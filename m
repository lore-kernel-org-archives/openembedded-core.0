Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 6673D6FF56
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 17:51:51 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id 128so11854336wmo.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 09:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=RNLSN12F/TgG29ilZhTvl4dq5D/IljtGf/3iO+MMot0=;
	b=t9udo6Xta9iYUmefW2vi7EoMi10feVFiN4S9sN/v9i+XqMpsNMHWfSHSRUCbuWC6ZH
	wg5V6h70yj+/un/3UmurisHbU0yPdguR2domf5csbVTBbMdfrdRvm8S1Ail3tAHfwLLy
	lXpUaHcIZwYjspn2J+FlzFovUnOPblrIeihRvL1fDrqPzVkGbkw2L2ASDL1YFETvgrZa
	E54o5dL3H9hCnMS5O0quS6yzNPZb8fUeGIgzBdCf9MDOVjmPmF5FkxKxCUyefO733kiK
	KBuD8lZlnX3YTA/KGEqdqOrHEiQLzaY/0bdAoEJpIMYtRItX7xhgC7q6UpHrg2i8c5hc
	Q0Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=RNLSN12F/TgG29ilZhTvl4dq5D/IljtGf/3iO+MMot0=;
	b=jkfsC7W7k4wEDTa22qZape00KI4VHgnYkh0u7XS9lNLBSeyrd7OEis1thXsLEEqXNq
	XDibroPfYvjNCSys+Nc993s83KnvuvjVKrJY1A8rqFNoN3lAJc1g0zzfgYr3ZSv0OcCo
	VYtj76kir9LA/iyom4xctiEnLcFuZrYFc4RhchsDq+EbP1gvY1do0S2L/nA2eBTptDfj
	7L6mMM5+4Lm0IHV6EtwZJAiivBHXVY44CB5zswng8K4hpahhKcLkdgxssq8AV/2cnD8F
	ounNQujsmK8D6lBwIGjfJcbOd8kbmT36dootptxwCEfW7z7o8qZLs55RNWKLoC5DwivK
	8HIg==
X-Gm-Message-State: AJaThX5ftCwzW9zqHQniiQdC1Xb2Lw/3eIMQ+vRLlsCFTNDLHDp/wHxl
	LCHJwuJD98njnXarO7T8ITbmbIn2
X-Google-Smtp-Source: AGs4zMY1rKI4k/Wog8OX/NQFX7HVj74Pq00H+MINozxtCyDjJ4H6Piywju1lKkR/uRgmog72b7MYng==
X-Received: by 10.28.48.150 with SMTP id w144mr4637494wmw.23.1511373112739;
	Wed, 22 Nov 2017 09:51:52 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	186sm3970953wmm.47.2017.11.22.09.51.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Nov 2017 09:51:52 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Nov 2017 17:51:47 +0000
Message-Id: <20171122175147.31931-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH][morty] fontconfig: Fix namespace conflicts with glibc
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
X-List-Received-Date: Wed, 22 Nov 2017 17:51:52 -0000

From: Khem Raj <raj.khem@gmail.com>

glibc 2.25 will come with TS 18661-1 macro definitions in limits.h which ends with following errors

| ../../fontconfig-2.12.1/src/fcmatch.c:324:63: error: 'PRI_CHAR_WIDTH_STRONG' undeclared here (not in a function)
|  #define FC_OBJECT(NAME, Type, Cmp) { FC_##NAME##_OBJECT, Cmp, PRI_##NAME##_STRONG, PRI_##NAME##_WEAK },
|                                                                ^
| ../../fontconfig-2.12.1/src/fcobjs.h:54:1: note: in expansion of macro 'FC_OBJECT'
|  FC_OBJECT (CHAR_WIDTH,  FcTypeInteger, NULL)
|  ^~~~~~~~~
| ../../fontconfig-2.12.1/src/fcmatch.c:324:84: error: 'PRI_CHAR_WIDTH_WEAK' undeclared here (not in a function)
|  #define FC_OBJECT(NAME, Type, Cmp) { FC_##NAME##_OBJECT, Cmp, PRI_##NAME##_STRONG, PRI_##NAME##_WEAK },
|                                                                                     ^
| ../../fontconfig-2.12.1/src/fcobjs.h:54:1: note: in expansion of macro 'FC_OBJECT'
|  FC_OBJECT (CHAR_WIDTH,  FcTypeInteger, NULL)
|  ^~~~~~~~~
| make[3]: *** [Makefile:632: fcmatch.lo] Error 1

(From OE-Core rev: 3575826752e7140da493c7f560fb5fcf483fc9b4)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...icts-with-integer-width-macros-from-TS-18.patch | 72 ++++++++++++++++++++++
 .../fontconfig/fontconfig_2.12.1.bb                |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-graphics/fontconfig/fontconfig/0001-Avoid-conflicts-with-integer-width-macros-from-TS-18.patch

diff --git a/meta/recipes-graphics/fontconfig/fontconfig/0001-Avoid-conflicts-with-integer-width-macros-from-TS-18.patch b/meta/recipes-graphics/fontconfig/fontconfig/0001-Avoid-conflicts-with-integer-width-macros-from-TS-18.patch
new file mode 100644
index 00000000000..cad71707adc
--- /dev/null
+++ b/meta/recipes-graphics/fontconfig/fontconfig/0001-Avoid-conflicts-with-integer-width-macros-from-TS-18.patch
@@ -0,0 +1,72 @@
+From 20cddc824c6501c2082cac41b162c34cd5fcc530 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 11 Dec 2016 14:32:00 -0800
+Subject: [PATCH] Avoid conflicts with integer width macros from TS
+ 18661-1:2014
+
+glibc 2.25+ has now defined these macros in <limits.h>
+https://sourceware.org/git/?p=glibc.git;a=commit;h=5b17fd0da62bf923cb61d1bb7b08cf2e1f1f9c1a
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ fontconfig/fontconfig.h | 2 +-
+ src/fcobjs.h            | 2 +-
+ src/fcobjshash.gperf    | 2 +-
+ src/fcobjshash.h        | 2 +-
+ 4 files changed, 4 insertions(+), 4 deletions(-)
+
+Index: fontconfig-2.12.1/fontconfig/fontconfig.h
+===================================================================
+--- fontconfig-2.12.1.orig/fontconfig/fontconfig.h
++++ fontconfig-2.12.1/fontconfig/fontconfig.h
+@@ -128,7 +128,8 @@ typedef int		FcBool;
+ #define FC_USER_CACHE_FILE	    ".fonts.cache-" FC_CACHE_VERSION
+ 
+ /* Adjust outline rasterizer */
+-#define FC_CHAR_WIDTH	    "charwidth"	/* Int */
++#define FC_CHARWIDTH	    "charwidth"	/* Int */
++#define FC_CHAR_WIDTH	    FC_CHARWIDTH
+ #define FC_CHAR_HEIGHT	    "charheight"/* Int */
+ #define FC_MATRIX	    "matrix"    /* FcMatrix */
+ 
+Index: fontconfig-2.12.1/src/fcobjs.h
+===================================================================
+--- fontconfig-2.12.1.orig/src/fcobjs.h
++++ fontconfig-2.12.1/src/fcobjs.h
+@@ -51,7 +51,7 @@ FC_OBJECT (DPI,			FcTypeDouble,	NULL)
+ FC_OBJECT (RGBA,		FcTypeInteger,	NULL)
+ FC_OBJECT (SCALE,		FcTypeDouble,	NULL)
+ FC_OBJECT (MINSPACE,		FcTypeBool,	NULL)
+-FC_OBJECT (CHAR_WIDTH,		FcTypeInteger,	NULL)
++FC_OBJECT (CHARWIDTH,		FcTypeInteger,	NULL)
+ FC_OBJECT (CHAR_HEIGHT,		FcTypeInteger,	NULL)
+ FC_OBJECT (MATRIX,		FcTypeMatrix,	NULL)
+ FC_OBJECT (CHARSET,		FcTypeCharSet,	FcCompareCharSet)
+Index: fontconfig-2.12.1/src/fcobjshash.gperf
+===================================================================
+--- fontconfig-2.12.1.orig/src/fcobjshash.gperf
++++ fontconfig-2.12.1/src/fcobjshash.gperf
+@@ -44,7 +44,7 @@ int id;
+ "rgba",FC_RGBA_OBJECT
+ "scale",FC_SCALE_OBJECT
+ "minspace",FC_MINSPACE_OBJECT
+-"charwidth",FC_CHAR_WIDTH_OBJECT
++"charwidth",FC_CHARWIDTH_OBJECT
+ "charheight",FC_CHAR_HEIGHT_OBJECT
+ "matrix",FC_MATRIX_OBJECT
+ "charset",FC_CHARSET_OBJECT
+Index: fontconfig-2.12.1/src/fcobjshash.h
+===================================================================
+--- fontconfig-2.12.1.orig/src/fcobjshash.h
++++ fontconfig-2.12.1/src/fcobjshash.h
+@@ -284,7 +284,7 @@ FcObjectTypeLookup (register const char
+       {(int)(long)&((struct FcObjectTypeNamePool_t *)0)->FcObjectTypeNamePool_str43,FC_CHARSET_OBJECT},
+       {-1},
+ #line 47 "fcobjshash.gperf"
+-      {(int)(long)&((struct FcObjectTypeNamePool_t *)0)->FcObjectTypeNamePool_str45,FC_CHAR_WIDTH_OBJECT},
++      {(int)(long)&((struct FcObjectTypeNamePool_t *)0)->FcObjectTypeNamePool_str45,FC_CHARWIDTH_OBJECT},
+ #line 48 "fcobjshash.gperf"
+       {(int)(long)&((struct FcObjectTypeNamePool_t *)0)->FcObjectTypeNamePool_str46,FC_CHAR_HEIGHT_OBJECT},
+ #line 55 "fcobjshash.gperf"
diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.12.1.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.12.1.bb
index 115f558eefa..8616154c616 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.12.1.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.12.1.bb
@@ -22,6 +22,7 @@ DEPENDS = "expat freetype zlib"
 
 SRC_URI = "http://fontconfig.org/release/fontconfig-${PV}.tar.gz \
            file://revert-static-pkgconfig.patch \
+           file://0001-Avoid-conflicts-with-integer-width-macros-from-TS-18.patch \
            "
 SRC_URI[md5sum] = "ce55e525c37147eee14cc2de6cc09f6c"
 SRC_URI[sha256sum] = "a9f42d03949f948a3a4f762287dbc16e53a927c91a07ee64207ebd90a9e5e292"
-- 
2.11.0


