Received: from 7.mo5.mail-out.ovh.net ([178.32.124.100]
	helo=mo5.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@eukrea.com>) id 1R4CRD-000397-He
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Sep 2011 15:57:11 +0200
Received: from mail183.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo5.mail-out.ovh.net (Postfix) with SMTP id 71C3E10400A4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2011 11:49:43 +0200 (CEST)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 15 Sep 2011 11:13:33 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.18?)
	(denis%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 15 Sep 2011 11:13:32 +0200
X-Ovh-Mailout: 178.32.228.5 (mo5.mail-out.ovh.net)
From: Denis Carikli <denis@eukrea.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1316075038-2729-1-git-send-email-Bernhard.Guillon@hale.at>
References: <1316075038-2729-1-git-send-email-Bernhard.Guillon@hale.at>
Organization: eukrea
Date: Thu, 15 Sep 2011 11:13:31 +0200
Message-ID: <1316078011.8845.0.camel@PCDEV1>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Ovh-Tracer-Id: 13960032946884189634
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -112
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeftddrvddtucetggdotefuucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrhhlucfvnfffucdlvddtmdenucdlqddutddtmdenudcurhgrnhguohhmuchsthhrihhnghdlshdmucdlieekmd
Subject: Re: [PATCH] liboil-0.3.17: add upstream Fix-enable-vfp-flag patch
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
X-List-Received-Date: Thu, 15 Sep 2011 13:57:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-09-15 at 10:23 +0200, Bernhard Guillon wrote:
> Add upstream 1921498bcc06408e8b051a3a9e9ce4182998f748 patch to fix
> compiling with vfp
> 
> Without this patch this error occours on arm with vfp and softfloat:
> 
> | math_vfp_asm.S:273: Error: selected processor does not support `fnegd d12,d4'
> | math_vfp_asm.S:273: Error: selected processor does not support `fstmiad r0!,{d12,d13,d14,d15}'
> | math_vfp_asm.S:273: Error: selected processor does not support `fmxr fpscr,lr'
> | make[3]: *** [math_vfp_asm.lo] Error 1
> 
> Signed-off-by: Bernhard Guillon <Bernhard.Guillon@hale.at>
> ---
>  .../liboil-0.3.17/0001-Fix-enable-vfp-flag.patch   |   39 ++++++++++++++++++++
>  meta/recipes-support/liboil/liboil_0.3.17.bb       |    3 +-
>  2 files changed, 41 insertions(+), 1 deletions(-)
>  create mode 100644 meta/recipes-support/liboil/liboil-0.3.17/0001-Fix-enable-vfp-flag.patch
> 
> diff --git a/meta/recipes-support/liboil/liboil-0.3.17/0001-Fix-enable-vfp-flag.patch b/meta/recipes-support/liboil/liboil-0.3.17/0001-Fix-enable-vfp-flag.patch
> new file mode 100644
> index 0000000..5b7dd4e
> --- /dev/null
> +++ b/meta/recipes-support/liboil/liboil-0.3.17/0001-Fix-enable-vfp-flag.patch
> @@ -0,0 +1,39 @@
> +From 1921498bcc06408e8b051a3a9e9ce4182998f748 Mon Sep 17 00:00:00 2001
> +From: David Schleef <ds@schleef.org>
> +Date: Fri, 8 Apr 2011 10:05:49 -0700
> +Subject: [PATCH 10/10] Fix --enable-vfp flag
> +
> +Patch from Christophe Lyon, fixes #36084.
> +---
> + configure.ac           |    4 ++--
> + liboil/arm/Makefile.am |    1 +
> + 2 files changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 98c81fb..407d88c 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -188,8 +188,8 @@ fi
> + AC_ARG_ENABLE(vfp,
> +   AC_HELP_STRING([--enable-vfp],[compile with Vector Floating-point unit support]),
> +   enable_vfp=$enableval,enable_vfp=yes)
> +-if test "x$enable-vfp" = xyes -a x$HAVE_GCC_ASM = xyes -a x$HAVE_ARM = xyes; then
> +-  AS_COMPILER_FLAG(["-Wa,-mfpu=vfp"],
> ++if test "x$enable_vfp" = xyes -a x$HAVE_GCC_ASM = xyes -a x$HAVE_ARM = xyes; then
> ++  AS_COMPILER_FLAG(["-mfpu=vfp"],
> +     [VFP_CFLAGS="$VFP_CFLAGS -mfpu=vfp"],
> +     true)
> +   #AS_COMPILER_FLAG(["-Wa,-mfloat-abi=softfp"],
> +diff --git a/liboil/arm/Makefile.am b/liboil/arm/Makefile.am
> +index ead08ed..cd8d9fa 100644
> +--- a/liboil/arm/Makefile.am
> ++++ b/liboil/arm/Makefile.am
> +@@ -6,4 +6,5 @@ libarm_la_SOURCES = \
> + 	math_vfp_asm.S
> + 
> + libarm_la_CFLAGS = $(LIBOIL_CFLAGS) $(VFP_CFLAGS)
> ++libarm_la_CCASFLAGS = $(LIBOIL_CFLAGS) $(VFP_CFLAGS)
> + 
> +-- 
> +1.7.6
> +
> diff --git a/meta/recipes-support/liboil/liboil_0.3.17.bb b/meta/recipes-support/liboil/liboil_0.3.17.bb
> index 64e1ddd..10a845e 100644
> --- a/meta/recipes-support/liboil/liboil_0.3.17.bb
> +++ b/meta/recipes-support/liboil/liboil_0.3.17.bb
> @@ -10,11 +10,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ad80780d9c5205d63481a0184e199a15 \
>                      file://testsuite/trans.c;endline=29;md5=380ecd43121fe3dcc0d8d7e5984f283d"
>  
>  DEPENDS = "glib-2.0"
> -PR = "r3"
> +PR = "r4"
>  
>  SRC_URI = "http://liboil.freedesktop.org/download/${BPN}-${PV}.tar.gz \
>             file://no-tests.patch \
>             file://fix-unaligned-whitelist.patch \
> +           file://0001-Fix-enable-vfp-flag.patch \
>            "
>  
>  SRC_URI[md5sum] = "47dc734f82faeb2964d97771cfd2e701"




