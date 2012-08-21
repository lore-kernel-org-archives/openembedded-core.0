Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T3mD7-00022b-NE for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 13:01:25 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7LAnKtB012435;
	Tue, 21 Aug 2012 11:49:20 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27999-09; Tue, 21 Aug 2012 11:49:15 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7LAnBpQ012429
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 21 Aug 2012 11:49:13 +0100
Message-ID: <1345546152.3907.63.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Matthew McClintock <msm@freescale.com>
Date: Tue, 21 Aug 2012 11:49:12 +0100
In-Reply-To: <1345488563-30901-1-git-send-email-msm@freescale.com>
References: <1345488563-30901-1-git-send-email-msm@freescale.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kmod-native_git.bb: fix builds for hosts with older libc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Aug 2012 11:01:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-08-20 at 13:49 -0500, Matthew McClintock wrote:
> kmod will fail to build with the following error because O_CLOEXEC is
> not defined:
> 
> | libkmod/libkmod-module.c: In function 'kmod_module_get_initstate':
> | libkmod/libkmod-module.c:1640: error: 'O_CLOEXEC' undeclared (first use in this function)
> | libkmod/libkmod-module.c:1640: error: (Each undeclared identifier is reported only once
> | libkmod/libkmod-module.c:1640: error: for each function it appears in.)
> | libkmod/libkmod-module.c: In function 'kmod_module_get_refcnt':
> | libkmod/libkmod-module.c:1754: error: 'O_CLOEXEC' undeclared (first use in this function)
> | libkmod/libkmod-module.c: In function 'kmod_module_get_sections':
> | libkmod/libkmod-module.c:1913: error: 'O_CLOEXEC' undeclared (first use in this function)
> | libkmod/libkmod-file.c: In function 'kmod_file_open':
> | libkmod/libkmod-file.c:282: error: 'O_CLOEXEC' undeclared (first use in this function)
> | libkmod/libkmod-file.c:282: error: (Each undeclared identifier is reported only once
> | libkmod/libkmod-file.c:282: error: for each function it appears in.)
> 
> Since we are only using kmod-native for depmod, and it's a non-threaded
> user of this libary being built this should be safe to override O_CLOEXEC.
> 
> Keep in mind this is ONLY effecting the native builds and not what is
> being shipped in the root file system.
> 
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
>  meta/recipes-kernel/kmod/kmod-native_git.bb |    8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-kernel/kmod/kmod-native_git.bb b/meta/recipes-kernel/kmod/kmod-native_git.bb
> index 96de8b8..3c5e3c3 100644
> --- a/meta/recipes-kernel/kmod/kmod-native_git.bb
> +++ b/meta/recipes-kernel/kmod/kmod-native_git.bb
> @@ -4,7 +4,7 @@
>  require kmod.inc
>  inherit native
>  
> -PR = "${INC_PR}.0"
> +PR = "${INC_PR}.1"
>  
>  do_install_append (){
>  	for tool in depmod insmod lsmod modinfo modprobe rmmod
> @@ -12,3 +12,9 @@ do_install_append (){
>  		ln -s kmod ${D}${bindir}/$tool
>  	done
>  }
> +
> +do_compile_append (){
> +	if ! grep O_CLOEXEC -r ${includedir_native}/bits/fcntl.h; then
> +		export CFLAGS="$CFLAGS -D O_CLOEXEC=0"
> +	fi
> +}


A compile append would execute after the compile. Isn't this after the
point you need the change?

Cheers,

Richard




