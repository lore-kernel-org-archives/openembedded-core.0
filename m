Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TJN8r-0005w8-JI for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 13:29:29 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q93BGSBT026801;
	Wed, 3 Oct 2012 12:16:28 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25642-07; Wed,  3 Oct 2012 12:16:24 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q93BGJXL026795
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 3 Oct 2012 12:16:20 +0100
Message-ID: <1349262982.18301.26.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Date: Wed, 03 Oct 2012 12:16:22 +0100
In-Reply-To: <1349261234-22493-2-git-send-email-laurentiu.palcu@intel.com>
References: <1349261234-22493-1-git-send-email-laurentiu.palcu@intel.com>
	<1349261234-22493-2-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/1] qemu: add wrapper for qemu-mips binary
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
X-List-Received-Date: Wed, 03 Oct 2012 11:29:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-10-03 at 13:47 +0300, Laurentiu Palcu wrote:
> qemu-mips user emulation binary segfaults when running any kind of
> binary. This is due to a MMU access fault in the virtual CPU. This
> problem has been introduced in qemu when 4GB of vmem were reserved for
> 32-on-64 bit.
> 
> This workaround will need to be reverted once the proper fix is found.
> 
> [YOCTO #3143]
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> ---
>  meta/recipes-devtools/qemu/qemu_1.2.0.bb |   16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/qemu/qemu_1.2.0.bb b/meta/recipes-devtools/qemu/qemu_1.2.0.bb
> index 191ee48..fa53e57 100644
> --- a/meta/recipes-devtools/qemu/qemu_1.2.0.bb
> +++ b/meta/recipes-devtools/qemu/qemu_1.2.0.bb
> @@ -17,7 +17,7 @@ SRC_URI = "\
>  SRC_URI[md5sum] = "78eb1e984f4532aa9f2bdd3c127b5b61"
>  SRC_URI[sha256sum] = "c8b84420d9f4869397f84cad2dabd9a475b7723d619a924a873740353e9df936"
>  
> -PR = "r2"
> +PR = "r3"
>  
>  SRC_URI_append_virtclass-nativesdk = "\
>      file://relocatable_sdk.patch \
> @@ -29,6 +29,20 @@ do_configure_prepend_virtclass-nativesdk() {
>  		sed -i 's/-lX11//g' Makefile.target
>  	fi
>  }
> +
> +# The following fragment will create a wrapper for qemu-mips user emulation
> +# binary in order to work around a segmentation fault issue. Basically, by
> +# default, the reserved virtual address space for 32-on-64 bit is set to 4GB.
> +# This will trigger a MMU access fault in the virtual CPU. With this change,
> +# the qemu-mips works fine.
> +# IMPORTANT: This piece needs to be removed once the root cause is fixed!
> +inherit utils

You don't need this inherit since utils is inherited as part of
base.bbclass. Otherwise it looks good.

Cheers,

Richard



> +do_install_append() {
> +	create_wrapper ${D}/${bindir}/qemu-mips \
> +		QEMU_RESERVED_VA=0x0
> +}
> +# END of qemu-mips workaround
> +
>  do_configure_prepend_virtclass-native() {
>  	# Undo the -lX11 added by linker-flags.patch, don't assume that host has libX11 installed
>  	sed -i 's/-lX11//g' Makefile.target




