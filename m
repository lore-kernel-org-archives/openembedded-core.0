Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 691966D491
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2014 06:44:54 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 02 Feb 2014 22:40:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,770,1384329600"; d="scan'208";a="468881458"
Received: from unknown (HELO [10.255.12.71]) ([10.255.12.71])
	by fmsmga001.fm.intel.com with ESMTP; 02 Feb 2014 22:44:54 -0800
Message-ID: <52EF3AE6.2000505@linux.intel.com>
Date: Sun, 02 Feb 2014 22:44:54 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>, 
 openembedded-core@lists.openembedded.org
References: <454d9116b5fa6e0dbd35b594e1baec619f3ad0a2.1391245078.git.raj.khem@gmail.com>
	<316623c1ac044a6286904cdc7d1f9c68ddb692c8.1391245078.git.raj.khem@gmail.com>
In-Reply-To: <316623c1ac044a6286904cdc7d1f9c68ddb692c8.1391245078.git.raj.khem@gmail.com>
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
X-List-Received-Date: Mon, 03 Feb 2014 06:44:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/01/2014 01:00 AM, Khem Raj wrote:
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
>   .../wireless-tools/wireless-tools/man.patch        | 24 ++++++++++----------
>   ...eless-tools_29.bb => wireless-tools_30.pre9.bb} | 26 +++++++++++-----------
>   2 files changed, 25 insertions(+), 25 deletions(-)
>   rename meta/recipes-connectivity/wireless-tools/{wireless-tools_29.bb => wireless-tools_30.pre9.bb} (79%)
>
> diff --git a/meta/recipes-connectivity/wireless-tools/wireless-tools/man.patch b/meta/recipes-connectivity/wireless-tools/wireless-tools/man.patch
> index 8e16215..6a757da 100644
> --- a/meta/recipes-connectivity/wireless-tools/wireless-tools/man.patch
> +++ b/meta/recipes-connectivity/wireless-tools/wireless-tools/man.patch
> @@ -1,15 +1,15 @@
>   Upstream-Status: Inappropriate [configuration]
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
>   			file://iwevent.c;beginline=59;endline=72;md5=d66a10026d4394f0a5b1c5587bce4537 \
>   			file://sample_enc.c;beginline=1;endline=4;md5=838372be07874260b566bae2f6ed33b6"
>   SECTION = "base"
> -PE = "1"
> -PR = "r4"
>

Did you really intend to remove the PE = "1", won't that make packages 
go backwards?

Sau!

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
>   CFLAGS =+ "-I${S}"
>   EXTRA_OEMAKE = "-e 'BUILD_SHARED=y' \
> @@ -29,7 +28,8 @@ EXTRA_OEMAKE = "-e 'BUILD_SHARED=y' \
>   		'INSTALL_MAN=${D}${mandir}'"
>
>   do_compile() {
> -	oe_runmake all libiw.a
> +	oe_runmake libiw.a
> +	oe_runmake all
>   }
>
>   do_install() {
>

