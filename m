Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 039E26B5A4
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Feb 2014 10:02:51 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s12A2jF0013299; Sun, 2 Feb 2014 10:02:45 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id onS6it2C_UHp; Sun,  2 Feb 2014 10:02:45 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s12A2dmM013294
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Sun, 2 Feb 2014 10:02:40 GMT
Message-ID: <1391335353.28575.145.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Sun, 02 Feb 2014 10:02:33 +0000
In-Reply-To: <316623c1ac044a6286904cdc7d1f9c68ddb692c8.1391245078.git.raj.khem@gmail.com>
References: <454d9116b5fa6e0dbd35b594e1baec619f3ad0a2.1391245078.git.raj.khem@gmail.com>
	<316623c1ac044a6286904cdc7d1f9c68ddb692c8.1391245078.git.raj.khem@gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] wireless-tools: Upgrade 29 -> 30.pre9
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 02 Feb 2014 10:02:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2014-02-01 at 01:00 -0800, Khem Raj wrote:
> This also fixes the underlinking problems that
> are unearthed with newer binutils 2.24
> where one of the wireless-tools libraries is asking
> for symbols from libm but all the symbols it asks
> for are unfortunately weak and they do not let new
> linker convince enough to link libm even though -lm
> is on cmdline since we are using --as-needed by default
> in linker, which means we end up with errors like
> 
> | make: *** [iwconfig] Error 1
> | libiw.so.30: undefined reference to `ceil'
> | libiw.so.30: undefined reference to `pow'
> | libiw.so.30: undefined reference to `log10'
> | libiw.so.30: undefined reference to `floor'
> | collect2: error: ld returned 1 exit status
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../wireless-tools/wireless-tools/man.patch        | 24 ++++++++++----------
>  ...eless-tools_29.bb => wireless-tools_30.pre9.bb} | 26 +++++++++++-----------
>  2 files changed, 25 insertions(+), 25 deletions(-)
>  rename meta/recipes-connectivity/wireless-tools/{wireless-tools_29.bb => wireless-tools_30.pre9.bb} (79%)
> 
> diff --git a/meta/recipes-connectivity/wireless-tools/wireless-tools/man.patch b/meta/recipes-connectivity/wireless-tools/wireless-tools/man.patch
> index 8e16215..6a757da 100644
> --- a/meta/recipes-connectivity/wireless-tools/wireless-tools/man.patch
> +++ b/meta/recipes-connectivity/wireless-tools/wireless-tools/man.patch
> @@ -1,15 +1,15 @@
>  Upstream-Status: Inappropriate [configuration]
>  
> ---- wireless_tools.26/Makefile.orig	2003-06-18 03:38:58.000000000 +0200
> -+++ wireless_tools.26/Makefile	2004-07-03 23:35:29.000000000 +0200
> -@@ -57,8 +57,8 @@
> - # Install directories
> - INSTALL_DIR= $(PREFIX)/sbin/
> - INSTALL_LIB= $(PREFIX)/lib/
> --INSTALL_INC= $(PREFIX)/include/
> --INSTALL_MAN= $(PREFIX)/man/
> -+INSTALL_INC= $(PREFIX)/usr/include/
> -+INSTALL_MAN= $(PREFIX)/usr/share/man/
> +Index: wireless_tools.30/Makefile
> +===================================================================
> +--- wireless_tools.30.orig/Makefile	2014-02-01 00:21:04.148463382 -0800
> ++++ wireless_tools.30/Makefile	2014-02-01 00:23:35.448072279 -0800
> +@@ -76,7 +76,7 @@
> + INSTALL_DIR= $(PREFIX)/sbin
> + INSTALL_LIB= $(PREFIX)/lib
> + INSTALL_INC= $(PREFIX)/include
> +-INSTALL_MAN= $(PREFIX)/man
> ++INSTALL_MAN= $(PREFIX)/share/man
>   
> - # Use local header if the version of wireless extensions is specified
> - ifdef FORCE_WEXT_VERSION
> + # Various commands
> + RM = rm -f
> diff --git a/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb b/meta/recipes-connectivity/wireless-tools/wireless-tools_30.pre9.bb
> similarity index 79%
> rename from meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb
> rename to meta/recipes-connectivity/wireless-tools/wireless-tools_30.pre9.bb
> index 3aef24e..bae22a0 100644
> --- a/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb
> +++ b/meta/recipes-connectivity/wireless-tools/wireless-tools_30.pre9.bb
> @@ -6,20 +6,19 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
>  			file://iwevent.c;beginline=59;endline=72;md5=d66a10026d4394f0a5b1c5587bce4537 \
>  			file://sample_enc.c;beginline=1;endline=4;md5=838372be07874260b566bae2f6ed33b6"
>  SECTION = "base"
> -PE = "1"
> -PR = "r4"
>  
> -SRC_URI = "http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux/wireless_tools.29.tar.gz \
> -	   file://remove.ldconfig.call.patch \
> -	   file://man.patch \
> -	   file://wireless-tools.if-pre-up \
> -	   file://zzz-wireless.if-pre-up \
> -	   file://avoid_strip.patch \
> -	   file://ldflags.patch"
> +SRC_URI = "http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux/wireless_tools.${PV}.tar.gz \
> +           file://wireless-tools.if-pre-up \
> +           file://zzz-wireless.if-pre-up \
> +           file://remove.ldconfig.call.patch \
> +           file://man.patch \
> +           file://avoid_strip.patch \
> +           file://ldflags.patch \
> +	  "
> +SRC_URI[md5sum] = "ca91ba7c7eff9bfff6926b1a34a4697d"
> +SRC_URI[sha256sum] = "abd9c5c98abf1fdd11892ac2f8a56737544fe101e1be27c6241a564948f34c63"
>  
> -SRC_URI[md5sum] = "e06c222e186f7cc013fd272d023710cb"
> -SRC_URI[sha256sum] = "6fb80935fe208538131ce2c4178221bab1078a1656306bce8909c19887e2e5a1"
> -S = "${WORKDIR}/wireless_tools.29"
> +S = "${WORKDIR}/wireless_tools.30"
>  
>  CFLAGS =+ "-I${S}"
>  EXTRA_OEMAKE = "-e 'BUILD_SHARED=y' \
> @@ -29,7 +28,8 @@ EXTRA_OEMAKE = "-e 'BUILD_SHARED=y' \
>  		'INSTALL_MAN=${D}${mandir}'"
>  
>  do_compile() {
> -	oe_runmake all libiw.a
> +	oe_runmake libiw.a
> +	oe_runmake all
>  }

Why the change to do_compile?

Cheers,

Richard



