Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C608EB64D7
	for <webhook@archiver.kernel.org>; Sun, 18 Jun 2023 09:22:19 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.2795.1687080130638907445
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jun 2023 02:22:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TaHG2hqp;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687080127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5Rg8XEX9NF8/b2RDKKyrEQkHXG9++Zt6VXpRWNqIAO8=;
	b=TaHG2hqp9IiX7+fPQtOQR+wTyFpMtPCv/ezFabiYRlDypZ01a0XJGs1qKrrW+CFcR2d/0j
	6vq6fTYi62joK/R5mQ7huWe7mgGtyf5qVYQVmvLAVp+RaSaxTeH8gmYO0iL4ketum/Nj4r
	d3Xm/uFjUtE0YNKHA+9ENQhc2XqnSqxr8NAn77LkqIMQ8VMNoyy5zAjZKqj8TnZhz09UwH
	CtgKFhm1VghxRvD8nRkMZI6l8KnPhTDaNZqjdTlmzNGqCbUgznssmATjKoWs8iVy1LCGU1
	I92+/u+bs4heN9j1gIQrtqd7mGCoGLaoNarJLyaSz3TVqmzjvvrzk7WFoIwzFw==
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5007260004;
	Sun, 18 Jun 2023 09:22:07 +0000 (UTC)
Date: Sun, 18 Jun 2023 11:22:06 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, nd@arm.com
Subject: Re: [OE-core] [PATCH] ghostscript: mostly rewrite recipe
Message-ID: <202306180922060ba89da4@mail.local>
References: <20230616103752.468683-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230616103752.468683-1-ross.burton@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Jun 2023 09:22:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183057

Hello,

This doesn't build on the AB:

https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/3055/steps/13/logs/errors
https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/7306/steps/11/logs/errors
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/7327/steps/12/logs/errors
https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/7208/steps/12/logs/errors
https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/4678/steps/11/logs/errors

| checking for zlib.h... no
| configure: error: I did not find a copy of zlib on your system.
|   Please either install it, or unpack a copy of the source in a
|   local directory named 'zlib'. See http://www.gzip.org/zlib/
|   for more information.

On 16/06/2023 11:37:52+0100, Ross Burton wrote:
> From: Ross Burton <ross.burton@arm.com>
> 
> This started as a patch cleanup but escalated rapidly.
> 
> Remove unneeded patches:
> - mkdir-p.patch isn't needed now the Makefiles appear to have the correct
>   dependencies.
> - ghostscript-9.15-parallel-make.patch appears to be unneeded for the same
>   reason
> - base-genht.c-add-a-preprocessor-define-to-allow-fope.patch isn't needed
> - cups-no-gcrypt.patch isn't needed
> - do-not-check-local-libpng-source.patch can be replaced by deleting
>   the libpng/ directory, as is already done for jpeg/
> - ghostscript-9.21-native-fix-disable-system-libtiff.patch is not needed
>   when we stop doing native builds (see below)
> 
> Remove the need for ghostscript-native to build and install tools that
> are needed at target build-time: ghostscript can do this itself.  Remove
> the BBCLASSEXTEND and all of the native overrides.
> 
> Inherit pkgconfig and explicitly tell configure to use the pkgconfig
> binary: unless told otherwise this configure will refuse to use an
> unprefixed pkgconfig in cross builds.
> 
> Review DEPENDS and add missing freetype and zlib dependencies.
> 
> Ghostcript will use the embedded copies of libraries over system
> libraries, so extend the deletion of jpeg and libpng to include expat,
> freetype, zlib, and cups as we want to link to our build of those.
> 
> Add PACKAGECONFIGs for optional libidn and libpaper dependencies.
> 
> Remove HAVE_SYS_TIME_H assignments, the upstream bug was fixed in 2011.
> 
> Clean up comments: there's no need to explain how to use PACKAGECONFIG,
> and justify the use of autotools-brokensep.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../avoid-host-contamination.patch            |  3 +-
>  ...-a-preprocessor-define-to-allow-fope.patch | 42 --------
>  .../ghostscript/cups-no-gcrypt.patch          | 37 -------
>  .../do-not-check-local-libpng-source.patch    | 31 ------
>  .../ghostscript-9.15-parallel-make.patch      | 28 ------
>  ...21-native-fix-disable-system-libtiff.patch | 47 ---------
>  .../ghostscript/ghostscript/mkdir-p.patch     | 50 ----------
>  .../ghostscript/ghostscript_10.01.1.bb        | 96 ++++---------------
>  8 files changed, 20 insertions(+), 314 deletions(-)
>  delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/base-genht.c-add-a-preprocessor-define-to-allow-fope.patch
>  delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/cups-no-gcrypt.patch
>  delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/do-not-check-local-libpng-source.patch
>  delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.15-parallel-make.patch
>  delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.21-native-fix-disable-system-libtiff.patch
>  delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/mkdir-p.patch
> 
> diff --git a/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch b/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch
> index e8cb16c36b4..15c7eb5a774 100644
> --- a/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch
> +++ b/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch
> @@ -5,8 +5,7 @@ Subject: [PATCH 04/10] avoid host contamination
>  
>  Remove hardcode path refer to host to avoid host contamination.
>  
> -Upstream-Status: Inappropriate [embedded specific]
> -
> +Upstream-Status: Pending
>  Signed-off-by: Kai Kang <kai.kang@windriver.com>
>  
>  Rebase to 9.23
> diff --git a/meta/recipes-extended/ghostscript/ghostscript/base-genht.c-add-a-preprocessor-define-to-allow-fope.patch b/meta/recipes-extended/ghostscript/ghostscript/base-genht.c-add-a-preprocessor-define-to-allow-fope.patch
> deleted file mode 100644
> index 7d80066a80e..00000000000
> --- a/meta/recipes-extended/ghostscript/ghostscript/base-genht.c-add-a-preprocessor-define-to-allow-fope.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -From 9ca6f795409b988d38dd98bc2a6ecb68a9392312 Mon Sep 17 00:00:00 2001
> -From: Hongxu Jia <hongxu.jia@windriver.com>
> -Date: Thu, 29 Mar 2018 16:37:40 +0800
> -Subject: [PATCH 10/10] base/genht.c: add a preprocessor define to allow fopen
> - calling
> -
> -The commit in upstream:
> -http://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=773c69e46e70bdd5482676437dafd2ca83397643
> -
> -Replace all fopen calls with gp_fopen and add a preprocessor define so
> -that any unintential calls directly to fopen will cause an error.
> -
> -Only exceptions are those in the platform specific code, and mkromfs.c.
> -This patch add a preprocessor define to allow fopen calling in
> -base/genht.c.
> -
> -Upstream-Status: Pending
> -
> -Rebase to 9.23
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ----
> - base/genht.c | 4 ++++
> - 1 file changed, 4 insertions(+)
> -
> -diff --git a/base/genht.c b/base/genht.c
> -index e597e72..e96bfb5 100644
> ---- a/base/genht.c
> -+++ b/base/genht.c
> -@@ -16,6 +16,10 @@
> - 
> - /* Generate C code for compiling halftones into ROM. */
> - #include "malloc_.h"
> -+
> -+/* prevent gp.h from defining fopen */
> -+#define fopen fopen
> -+
> - #include "stdio_.h"
> - #include "string_.h"
> - #include "gscdefs.h"
> --- 
> -1.8.3.1
> -
> diff --git a/meta/recipes-extended/ghostscript/ghostscript/cups-no-gcrypt.patch b/meta/recipes-extended/ghostscript/ghostscript/cups-no-gcrypt.patch
> deleted file mode 100644
> index 4c9bb22fa2d..00000000000
> --- a/meta/recipes-extended/ghostscript/ghostscript/cups-no-gcrypt.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From 9129eb7fa9dc160d64a7d9df9279a3b1dae4d793 Mon Sep 17 00:00:00 2001
> -From: Jackie Huang <jackie.huang@windriver.com>
> -Date: Thu, 29 Mar 2018 16:16:18 +0800
> -Subject: [PATCH 08/10] cups no gcrypt
> -
> -Don't build-depend on libgcrypt, as nothing is used from it
> -
> -Backported from
> -http://www.cups.org/strfiles.php/3308/cups-no-gcrypt.patch
> -
> -This addresses the cryto dependency seen during build.
> -
> -Upstream-Status: Backport
> -
> -Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> -
> -Rebase to 9.23
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ----
> - cups/libs/cups/http-private.h | 1 -
> - 1 file changed, 1 deletion(-)
> -
> -diff --git a/cups/libs/cups/http-private.h b/cups/libs/cups/http-private.h
> -index 99a85c3..a674852 100644
> ---- a/cups/libs/cups/http-private.h
> -+++ b/cups/libs/cups/http-private.h
> -@@ -80,7 +80,6 @@ typedef int socklen_t;
> - #  elif defined HAVE_GNUTLS
> - #    include <gnutls/gnutls.h>
> - #    include <gnutls/x509.h>
> --#    include <gcrypt.h>
> - #  elif defined(HAVE_CDSASSL)
> - #    include <CoreFoundation/CoreFoundation.h>
> - #    include <Security/Security.h>
> --- 
> -1.8.3.1
> -
> diff --git a/meta/recipes-extended/ghostscript/ghostscript/do-not-check-local-libpng-source.patch b/meta/recipes-extended/ghostscript/ghostscript/do-not-check-local-libpng-source.patch
> deleted file mode 100644
> index 13e71c824f8..00000000000
> --- a/meta/recipes-extended/ghostscript/ghostscript/do-not-check-local-libpng-source.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From 108a7d3f79af8c669af129bd87401402e76edfa9 Mon Sep 17 00:00:00 2001
> -From: Hongxu Jia <hongxu.jia@windriver.com>
> -Date: Mon, 18 Jan 2016 01:00:30 -0500
> -Subject: [PATCH] configure.ac: do not check local png source
> -
> -In oe-core, it did not need to compile local libpng
> -source in ghostscript, so do not check local png
> -source, and directly check the existance of shared
> -libpng library.
> -
> -Upstream-Status: Inappropriate [OE-Core specific]
> -
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> -
> ----
> - configure.ac | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index bb57825..389c473 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -1441,7 +1441,7 @@ else
> -   PNGDEVS=''
> -   PNGDEVS_ALL='png48 png16m pnggray pngmono pngmonod png256 png16 pngalpha png16malpha'
> -   AC_MSG_CHECKING([for local png library source])
> --  if test -f $srcdir/libpng/pngread.c; then
> -+  if false; then
> -           AC_MSG_RESULT([yes])
> -           SHARE_LIBPNG=0
> -           LIBPNGDIR=$srcdir/libpng
> diff --git a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.15-parallel-make.patch b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.15-parallel-make.patch
> deleted file mode 100644
> index 5b57da2a972..00000000000
> --- a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.15-parallel-make.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From 04a86a613e0f9bfbbad99874f72217f75e8c53a3 Mon Sep 17 00:00:00 2001
> -From: Robert Yang <liezhi.yang@windriver.com>
> -Date: Thu, 29 Mar 2018 15:59:05 +0800
> -Subject: [PATCH] contrib.mak: fix for parallel build
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> -
> -Rebase to 9.23
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> -
> ----
> - contrib/contrib.mak | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/contrib/contrib.mak b/contrib/contrib.mak
> -index 2edee7a..c9100e8 100644
> ---- a/contrib/contrib.mak
> -+++ b/contrib/contrib.mak
> -@@ -1241,6 +1241,7 @@ $(DEVOBJ)gdevalps.$(OBJ) : $(JAPSRC)gdevalps.c $(PDEVH) \
> - ### ----------------- Additional .upp files ---------------- ###
> - 
> - extra-upp-install: install-libdata
> -+	mkdir -p $(DESTDIR)$(gsdatadir)$(D)lib
> - 	for f in $(CONTRIBSRC)uniprint$(D)*.upp; do \
> - 	    $(INSTALL_DATA) $$f $(DESTDIR)$(gsdatadir)$(D)lib || exit 1; \
> - 	done
> diff --git a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.21-native-fix-disable-system-libtiff.patch b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.21-native-fix-disable-system-libtiff.patch
> deleted file mode 100644
> index a382c7f8917..00000000000
> --- a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.21-native-fix-disable-system-libtiff.patch
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -From 0124b1c29b9cfe46d73ae82ce023dd7c5b055744 Mon Sep 17 00:00:00 2001
> -From: Hongxu Jia <hongxu.jia@windriver.com>
> -Date: Thu, 29 Mar 2018 16:36:12 +0800
> -Subject: [PATCH 09/10] ghostscript-native:fix disable-system-libtiff
> -
> -Modify configure to add the check to make sure
> -ghostscrip could work while system-libtiff is
> -disabled.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> -
> -Rebase to ghostscript 9.25.
> -
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> -Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> ----
> - configure.ac | 5 +++++
> - 1 file changed, 5 insertions(+)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 80a60b1..f3e9efb 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -1319,6 +1319,7 @@ AC_TRY_COMPILE([], [return 0;],
> - CFLAGS=$CGLAGS_STORE
> - 
> - if test x"$SHARE_LIBTIFF" = x"0" ; then
> -+    if test -e $LIBTIFFDIR/configure; then
> -       echo "Running libtiff configure script..."
> -       olddir=`pwd`
> -       if ! test -d "$LIBTIFFCONFDIR" ; then
> -@@ -1337,6 +1338,10 @@ if test x"$SHARE_LIBTIFF" = x"0" ; then
> - 
> -       echo
> -       echo "Continuing with Ghostscript configuration..."
> -+    else
> -+      AC_MSG_NOTICE([Could not find local copy of libtiff.
> -+Disabling tiff output devices.])
> -+    fi
> - fi
> - 
> - AC_SUBST(SHARE_LIBTIFF)
> --- 
> -1.8.3.1
> -
> diff --git a/meta/recipes-extended/ghostscript/ghostscript/mkdir-p.patch b/meta/recipes-extended/ghostscript/ghostscript/mkdir-p.patch
> deleted file mode 100644
> index 3e6d3e3c48a..00000000000
> --- a/meta/recipes-extended/ghostscript/ghostscript/mkdir-p.patch
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -From 2b23026f8e2a352417fb1c4da94bf69b19bef267 Mon Sep 17 00:00:00 2001
> -From: Joe Slater <joe.slater@windriver.com>
> -Date: Thu, 29 Mar 2018 16:04:32 +0800
> -Subject: [PATCH 05/10] ghostscript: allow directories to be created more than
> - once
> -
> -When doing parallel builds, we might try to create directories
> -more than once.  This should not cause an error.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Joe Slater <joe.slater@windriver.com>
> -
> -Rebase to 9.23
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ----
> - base/unix-end.mak | 17 ++++++++---------
> - 1 file changed, 8 insertions(+), 9 deletions(-)
> -
> -diff --git a/base/unix-end.mak b/base/unix-end.mak
> -index 9ce599a..feff5a6 100644
> ---- a/base/unix-end.mak
> -+++ b/base/unix-end.mak
> -@@ -17,15 +17,14 @@
> - UNIX_END_MAK=$(GLSRC)unix-end.mak $(TOP_MAKEFILES)
> - # Define the rule for building standard configurations.
> - directories: $(UNIX_END_MAK)
> --	@if test "$(BINDIR)"    != "" -a ! -d $(BINDIR);        then mkdir $(BINDIR);        fi
> --	@if test "$(GLGENDIR)"  != "" -a ! -d $(GLGENDIR);      then mkdir $(GLGENDIR);      fi
> --	@if test "$(GLOBJDIR)"  != "" -a ! -d $(GLOBJDIR);      then mkdir $(GLOBJDIR);      fi
> --	@if test "$(DEVGENDIR)" != "" -a ! -d $(DEVGENDIR);     then mkdir $(DEVGENDIR);     fi
> --	@if test "$(DEVOBJDIR)" != "" -a ! -d $(DEVOBJDIR);     then mkdir $(DEVOBJDIR);     fi
> --	@if test "$(AUXDIR)"    != "" -a ! -d $(AUXDIR);        then mkdir $(AUXDIR);        fi
> --	@if test "$(PSGENDIR)"  != "" -a ! -d $(PSGENDIR);      then mkdir $(PSGENDIR);      fi
> --	@if test "$(PSGENDIR)"  != "" -a ! -d $(PSGENDIR)/cups; then mkdir $(PSGENDIR)/cups; fi
> --	@if test "$(PSOBJDIR)"  != "" -a ! -d $(PSOBJDIR);      then mkdir $(PSOBJDIR);      fi
> -+	@if test "$(BINDIR)"    != "" -a ! -d $(BINDIR);        then mkdir -p $(BINDIR);        fi
> -+	@if test "$(GLGENDIR)"  != "" -a ! -d $(GLGENDIR);      then mkdir -p $(GLGENDIR);      fi
> -+	@if test "$(GLOBJDIR)"  != "" -a ! -d $(GLOBJDIR);      then mkdir -p $(GLOBJDIR);      fi
> -+	@if test "$(DEVGENDIR)" != "" -a ! -d $(DEVGENDIR);     then mkdir -p $(DEVGENDIR);     fi
> -+	@if test "$(DEVOBJDIR)" != "" -a ! -d $(DEVOBJDIR);     then mkdir -p $(DEVOBJDIR);     fi
> -+	@if test "$(AUXDIR)"    != "" -a ! -d $(AUXDIR);        then mkdir -p $(AUXDIR);        fi
> -+	@if test "$(PSGENDIR)"  != "" -a ! -d $(PSGENDIR)/cups; then mkdir -p $(PSGENDIR)/cups; fi
> -+	@if test "$(PSOBJDIR)"  != "" -a ! -d $(PSOBJDIR);      then mkdir -p $(PSOBJDIR);      fi
> - 
> - 
> - gs: .gssubtarget $(UNIX_END_MAK)
> --- 
> -1.8.3.1
> -
> diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.01.1.bb b/meta/recipes-extended/ghostscript/ghostscript_10.01.1.bb
> index 5d4b8cdc913..84e3351f7dd 100644
> --- a/meta/recipes-extended/ghostscript/ghostscript_10.01.1.bb
> +++ b/meta/recipes-extended/ghostscript/ghostscript_10.01.1.bb
> @@ -13,91 +13,49 @@ SECTION = "console/utils"
>  LICENSE = "GPL-3.0-only"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=f98ffa763e50cded76f49bce73aade16"
>  
> -DEPENDS = "ghostscript-native tiff jpeg fontconfig cups libpng"
> -DEPENDS:class-native = "libpng-native"
> +DEPENDS = "tiff jpeg fontconfig cups libpng freetype zlib"
>  
>  UPSTREAM_CHECK_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases"
>  UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
>  
> -# As of ghostscript 9.54.0 the jpeg issue in the CVE is present in the gs jpeg sources
> -# however we use an external jpeg which doesn't have the issue.
> +# We use a system libjpeg-turbo which has this fix
>  CVE_CHECK_IGNORE += "CVE-2013-6629"
>  
>  def gs_verdir(v):
>      return "".join(v.split("."))
>  
>  
> -SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs${@gs_verdir("${PV}")}/${BPN}-${PV}.tar.gz \
> -                file://ghostscript-9.15-parallel-make.patch \
> -                file://ghostscript-9.16-Werror-return-type.patch \
> -                file://do-not-check-local-libpng-source.patch \
> -                file://avoid-host-contamination.patch \
> -                file://mkdir-p.patch \
> +SRC_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs${@gs_verdir("${PV}")}/${BPN}-${PV}.tar.gz \
> +           file://ghostscript-9.16-Werror-return-type.patch \
> +           file://avoid-host-contamination.patch \
>  "
>  
> -SRC_URI = "${SRC_URI_BASE} \
> -           file://cups-no-gcrypt.patch \
> -           "
> -
> -SRC_URI:class-native = "${SRC_URI_BASE} \
> -                        file://ghostscript-9.21-native-fix-disable-system-libtiff.patch \
> -                        file://base-genht.c-add-a-preprocessor-define-to-allow-fope.patch \
> -                        "
> -
>  SRC_URI[sha256sum] = "4df18a808cd4369f25e02dbcec2f133cb6d674627b2c6b1502020e58d43e32ce"
>  
> -# Put something like
> -#
> -#   PACKAGECONFIG:append:pn-ghostscript = " x11"
> -#
> -# in local.conf to enable building with X11.  Be careful.  The order
> -# of the overrides matters!
> -#
> -#PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
> -PACKAGECONFIG:class-native = ""
> -
> +PACKAGECONFIG ??= ""
> +PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+3"
> +PACKAGECONFIG[libidn] = "--with-libidn,--without-libidn,libidn"
> +PACKAGECONFIG[libpaper] = "--with-libpaper,--without-libpaper,libpaper"
>  PACKAGECONFIG[x11] = "--with-x --x-includes=${STAGING_INCDIR} --x-libraries=${STAGING_LIBDIR}, \
> -                      --without-x, virtual/libx11 libxext libxt gtk+3\
> -                      "
> +                      --without-x, virtual/libx11 libxext libxt"
>  
> -EXTRA_OECONF = "--without-libpaper --with-system-libtiff --with-jbig2dec \
> +EXTRA_OECONF = "--with-jbig2dec \
>                  --with-fontpath=${datadir}/fonts \
> -                --without-libidn --with-cups-serverbin=${exec_prefix}/lib/cups \
> -                --with-cups-datadir=${datadir}/cups \
>                  CUPSCONFIG="${STAGING_BINDIR_CROSS}/cups-config" \
> +                PKGCONFIG=pkg-config \
>                  "
>  
>  EXTRA_OECONF:append:mipsarcho32 = " --with-large_color_index=0"
>  
> -# Explicity disable libtiff, fontconfig,
> -# freetype, cups for ghostscript-native
> -EXTRA_OECONF:class-native = "--without-x --with-system-libtiff=no \
> -                             --without-libpaper \
> -                             --with-fontpath=${datadir}/fonts \
> -                             --without-libidn --disable-fontconfig \
> -                             --enable-freetype --disable-cups "
> -
> -# This has been fixed upstream but for now we need to subvert the check for time.h
> -# http://bugs.ghostscript.com/show_bug.cgi?id=692443
> -# http://bugs.ghostscript.com/show_bug.cgi?id=692426
> -CFLAGS += "-DHAVE_SYS_TIME_H=1"
> -BUILD_CFLAGS += "-DHAVE_SYS_TIME_H=1"
> -
> -inherit autotools-brokensep
> -
> -do_configure:prepend:class-target () {
> -        rm -rf ${S}/jpeg/
> -}
> +# Uses autoconf but not automake, can't do out-of-tree
> +inherit autotools-brokensep pkgconfig
>  
> -do_configure:append () {
> -	# copy tools from the native ghostscript build
> -	if [ "${PN}" != "ghostscript-native" ]; then
> -		mkdir -p obj/aux soobj
> -		for i in genarch genconf mkromfs echogs gendev genht packps; do
> -			cp ${STAGING_BINDIR_NATIVE}/ghostscript-${PV}/$i obj/aux/$i
> -		done
> -	fi
> +# Prune the source tree of libraries that we're using our packaging of, so that
> +# ghostscript can't link to them.
> +prune_sources() {
> +    rm -rf ${S}/jpeg/ ${S}/libpng/ ${S}/tiff/ ${S}/expat/ ${S}/freetype/ ${S}/zlib/ ${S}/cups/lib
>  }
> +do_unpack[postfuncs] += "prune_sources"
>  
>  do_install:append () {
>      mkdir -p ${D}${datadir}/ghostscript/${PV}/
> @@ -105,22 +63,6 @@ do_install:append () {
>      cp -r ${S}/iccprofiles ${D}${datadir}/ghostscript/${PV}/
>  }
>  
> -do_compile:class-native () {
> -    mkdir -p obj
> -    for i in genarch genconf mkromfs echogs gendev genht packps; do
> -        oe_runmake obj/aux/$i
> -    done
> -}
> -
> -do_install:class-native () {
> -    install -d ${D}${bindir}/ghostscript-${PV}
> -    for i in genarch genconf mkromfs echogs gendev genht packps; do
> -        install -m 755 obj/aux/$i ${D}${bindir}/ghostscript-${PV}/$i
> -    done
> -}
> -
> -BBCLASSEXTEND = "native"
> -
>  # ghostscript does not supports "arc"
>  COMPATIBLE_HOST = "^(?!arc).*"
>  
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183007): https://lists.openembedded.org/g/openembedded-core/message/183007
> Mute This Topic: https://lists.openembedded.org/mt/99567584/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

