Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SE1qG-0000Uq-Oe for openembedded-core@lists.openembedded.org;
	Sat, 31 Mar 2012 19:11:56 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2VH2oBD025073
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Mar 2012 18:02:50 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23140-10 for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Mar 2012 18:02:45 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2VH2fpR025067
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Mar 2012 18:02:42 +0100
Message-ID: <1333213361.18082.250.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sat, 31 Mar 2012 18:02:41 +0100
In-Reply-To: <0f8cf941e9e7d9c25cd882bae083b536b715cd17.1333145263.git.nitin.a.kamble@intel.com>
References: <512eae1ae0678b247076db900304725702acc91e.1333145263.git.nitin.a.kamble@intel.com>
	<0f8cf941e9e7d9c25cd882bae083b536b715cd17.1333145263.git.nitin.a.kamble@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 2/3] cross-canadian.bbclass: fix rpath for sdk executables
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 31 Mar 2012 17:11:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-03-30 at 15:28 -0700, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> 
> This makes the libraries located in places like this findable:
> /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib
> 
> Which avoids linking cross canadian sdk executables with host libraries like this:
> 
> $ ldd /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/bin/x86_64-oe-linux/x86_64-oe-linux-gdb
>         linux-vdso.so.1 =>  (0x00007fffb7fff000)
>         libreadline.so.6 => /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/x86_64-oe-linux/../libreadline.so.6 (0x00007fbfb5511000)
>         libdl.so.2 => /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/libdl.so.2 (0x00007fbfb530c000)
>         libncurses.so.5 => /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/libncurses.so.5 (0x00007fbfb50e9000)
>         libtinfo.so.5 => /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/libtinfo.so.5 (0x00007fbfb4ec2000)
>         libz.so.1 => /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/x86_64-oe-linux/../libz.so.1 (0x00007fbfb4cac000)
>         libm.so.6 => /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/libm.so.6 (0x00007fbfb4a2a000)
>         libpthread.so.0 => /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/libpthread.so.0 (0x00007fbfb480d000)
>         libutil.so.1 => /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/libutil.so.1 (0x00007fbfb4609000)
>         libexpat.so.1 => /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/x86_64-oe-linux/../libexpat.so.1 (0x00007fbfb43e0000)
>         libc.so.6 => /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/libc.so.6 (0x00007fbfb4059000)
>         /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/lib/ld-linux-x86-64.so.2 => /lib64/ld-linux-x86-64.so.2 (0x0000003f05000000)
> 
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
>  meta/classes/cross-canadian.bbclass |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
> index e187b88..4ff092c 100644
> --- a/meta/classes/cross-canadian.bbclass
> +++ b/meta/classes/cross-canadian.bbclass
> @@ -48,7 +48,9 @@ DPKG_ARCH = "${SDK_ARCH}"
>  CPPFLAGS = "${BUILDSDK_CPPFLAGS}"
>  CFLAGS = "${BUILDSDK_CFLAGS}"
>  CXXFLAGS = "${BUILDSDK_CFLAGS}"
> -LDFLAGS = "${BUILDSDK_LDFLAGS}"
> +LDFLAGS = "${BUILDSDK_LDFLAGS} \
> +	-Wl,-rpath-link,${STAGING_LIBDIR}/.. \
> +	 -Wl,-rpath,${libdir}/.. "
>  
>  DEPENDS_GETTEXT = "gettext-native gettext-nativesdk"

I've merged this, fixing the whitespace myself this time. Please keep an
eye on whitespace in future (as commented on the version of this that
went to the poky list accidentally).

Cheers,

Richard





