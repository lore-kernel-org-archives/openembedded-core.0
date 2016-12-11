Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id E9F9E719BA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Dec 2016 23:07:25 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id p66so8880211pga.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Dec 2016 15:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=pVvE11eltax2lHMpZKO4mKEVJ5kPoEnRpdJSNVaeB1w=;
	b=YjrKIanmaKaLa+mP4tCqH3i/KjbgVxbtSEHrAl/8HTwoQ6Kbdcdz+fGHxUPD9DLgeh
	AgfmjSeGG82kBObkh0ifXSWQo0BwPz5pgDxngntcG3CVU68aoLnnSv8DH1mbPyQCLWp9
	M3MQw6uimcrkHz+rp4SqRWEa7lPyxTpRc5e+y3ofYHIv6liFNBJJHlOo3K7vW/pCdEl+
	5jivLuuyvOLe/Fl0ywOfH+/tupLiGuc2foTwmF7YLVq2/yjq2JMMV8HAGiZ2jC8BT4Ql
	cT5CJ7aBU4YBL1LxZno5UlZSqNHZoKcmPoTCJpCwuLaXDVUdc04dfQ2OJZrkzdtXgE0O
	DPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pVvE11eltax2lHMpZKO4mKEVJ5kPoEnRpdJSNVaeB1w=;
	b=Md4e9qXjAQP450zjbN4vrtCAxyLbp8nGAqZV8doNcHXPOxLAKRnO5ysLDSCmuRaLiw
	9J9ZW7+Oxn4ACK5l1wgN+HIS3bc9RWzHtOafzriAzAxnzyV+SMi1M5TAmcSp8rZOgrKz
	yQvRNy8+PlwcYjSVz8KtjEeJskBhManVvA0BbyigV+TpiQJhNAQjaKRz6K/FS+TsTUM3
	SSPT/64vIb9EBZsQ6dyduZJ0xbImnRas/lMbLNn92VvtvzgnydbzD0tyc3UU+bVSoSB9
	Qg09w1AZ4clZZVd2F0k5c8TVcXRUFFAH2EJzkpMHKGUipRAHJDY9z1Qr31q2/W+di+TE
	IE7Q==
X-Gm-Message-State: AKaTC00u+P9VhL6NN5w3f0xA6/9JLQPExX7IzDfRmFJk95C0x7LW7teBxM6NJBrfPC5CHw==
X-Received: by 10.99.208.21 with SMTP id z21mr162309142pgf.79.1481497647098;
	Sun, 11 Dec 2016 15:07:27 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	y200sm71819235pfb.16.2016.12.11.15.07.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 11 Dec 2016 15:07:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 11 Dec 2016 15:07:19 -0800
Message-Id: <20161211230719.28765-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH] fontconfig: Fix namespace conflicts with glibc
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
X-List-Received-Date: Sun, 11 Dec 2016 23:07:26 -0000

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

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...icts-with-integer-width-macros-from-TS-18.patch | 74 ++++++++++++++++++++++
 .../fontconfig/fontconfig_2.12.1.bb                |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-graphics/fontconfig/fontconfig/0001-Avoid-conflicts-with-integer-width-macros-from-TS-18.patch

diff --git a/meta/recipes-graphics/fontconfig/fontconfig/0001-Avoid-conflicts-with-integer-width-macros-from-TS-18.patch b/meta/recipes-graphics/fontconfig/fontconfig/0001-Avoid-conflicts-with-integer-width-macros-from-TS-18.patch
new file mode 100644
index 0000000..326ff3c
--- /dev/null
+++ b/meta/recipes-graphics/fontconfig/fontconfig/0001-Avoid-conflicts-with-integer-width-macros-from-TS-18.patch
@@ -0,0 +1,74 @@
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
+diff --git a/fontconfig/fontconfig.h b/fontconfig/fontconfig.h
+index 5c72b22..843c532 100644
+--- a/fontconfig/fontconfig.h
++++ b/fontconfig/fontconfig.h
+@@ -128,7 +128,7 @@ typedef int		FcBool;
+ #define FC_USER_CACHE_FILE	    ".fonts.cache-" FC_CACHE_VERSION
+ 
+ /* Adjust outline rasterizer */
+-#define FC_CHAR_WIDTH	    "charwidth"	/* Int */
++#define FC_CHARWIDTH	    "charwidth"	/* Int */
+ #define FC_CHAR_HEIGHT	    "charheight"/* Int */
+ #define FC_MATRIX	    "matrix"    /* FcMatrix */
+ 
+diff --git a/src/fcobjs.h b/src/fcobjs.h
+index 1fc4f65..d27864b 100644
+--- a/src/fcobjs.h
++++ b/src/fcobjs.h
+@@ -51,7 +51,7 @@ FC_OBJECT (DPI,			FcTypeDouble,	NULL)
+ FC_OBJECT (RGBA,		FcTypeInteger,	NULL)
+ FC_OBJECT (SCALE,		FcTypeDouble,	NULL)
+ FC_OBJECT (MINSPACE,		FcTypeBool,	NULL)
+-FC_OBJECT (CHAR_WIDTH,		FcTypeInteger,	NULL)
++FC_OBJECT (CHARWIDTH,		FcTypeInteger,	NULL)
+ FC_OBJECT (CHAR_HEIGHT,		FcTypeInteger,	NULL)
+ FC_OBJECT (MATRIX,		FcTypeMatrix,	NULL)
+ FC_OBJECT (CHARSET,		FcTypeCharSet,	FcCompareCharSet)
+diff --git a/src/fcobjshash.gperf b/src/fcobjshash.gperf
+index 80a0237..eb4ad84 100644
+--- a/src/fcobjshash.gperf
++++ b/src/fcobjshash.gperf
+@@ -44,7 +44,7 @@ int id;
+ "rgba",FC_RGBA_OBJECT
+ "scale",FC_SCALE_OBJECT
+ "minspace",FC_MINSPACE_OBJECT
+-"charwidth",FC_CHAR_WIDTH_OBJECT
++"charwidth",FC_CHARWIDTH_OBJECT
+ "charheight",FC_CHAR_HEIGHT_OBJECT
+ "matrix",FC_MATRIX_OBJECT
+ "charset",FC_CHARSET_OBJECT
+diff --git a/src/fcobjshash.h b/src/fcobjshash.h
+index 5a4d1ea..4e66bb0 100644
+--- a/src/fcobjshash.h
++++ b/src/fcobjshash.h
+@@ -284,7 +284,7 @@ FcObjectTypeLookup (register const char *str, register unsigned int len)
+       {(int)(long)&((struct FcObjectTypeNamePool_t *)0)->FcObjectTypeNamePool_str43,FC_CHARSET_OBJECT},
+       {-1},
+ #line 47 "fcobjshash.gperf"
+-      {(int)(long)&((struct FcObjectTypeNamePool_t *)0)->FcObjectTypeNamePool_str45,FC_CHAR_WIDTH_OBJECT},
++      {(int)(long)&((struct FcObjectTypeNamePool_t *)0)->FcObjectTypeNamePool_str45,FC_CHARWIDTH_OBJECT},
+ #line 48 "fcobjshash.gperf"
+       {(int)(long)&((struct FcObjectTypeNamePool_t *)0)->FcObjectTypeNamePool_str46,FC_CHAR_HEIGHT_OBJECT},
+ #line 55 "fcobjshash.gperf"
+-- 
+2.10.2
+
diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.12.1.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.12.1.bb
index 115f558..8616154 100644
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
2.10.2


