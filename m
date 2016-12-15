Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 24B5477200
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 00:06:14 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id p66so3968815pga.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2016 16:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=QqRT986KB6wosNHTorzV5stOVkC9cDstx2RNMG8mClY=;
	b=SS3hrZn4jOpfb50EAKiCc9lEbD9KWCoDi/1SbhZQVzoOxrqgBfbTSawWIyPqdCxTax
	wmW7tRlyi+D0zE0MRa56D3f5/e0bZpcdYe0/hv0qqIHtdciZDRTABtX/ozka/VBHtXs4
	qRpUcDTdMEvr35xVl6RE+rllXqmWnDZjC7VcEJWCVZx80BNsjgkdLy3DVdc9yFQM0cSh
	R2TrkjuYoQS1+exZMHjJa7wowGFNgxUJTiLoZiwen/w1V5XVf82B97QnmfLm9eXg8LsZ
	NziQ8XFJZOXU4TeF2juqalBCADlHvN2cO9c7TMty95denEnKbKPNQNhZ5WxyoFdcwQsE
	i8zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=QqRT986KB6wosNHTorzV5stOVkC9cDstx2RNMG8mClY=;
	b=eObCD9uuIiBY6qS+93QxOBDAznAEFcEZftVv/kK+YgjIpgeY3JVAavHsQO6Dh3iayL
	PfRXjvUqHuxmSWVaVzYS+LYLwZAxB4RJYlcsljm9YCG74WvwBvUfayi05kupF/e66iei
	A7ZMS2pyC2cJaiz5CGrHcJD2RhsTR9ALuHFF5aCkA7OEeehgUvAWbjbJXzgXqWGAnWci
	o1f1x55Ahmcx210TUyyudSSvOfYRgjeBVprgrUnWWiqsfHHqTh7qffx2Iv3X7P/lob6U
	JnLLJdO21mXxq4uFNcD2disMFflUl+7zmoJ8ecVilnmJ53d2+/WIW9b/IxbYj44R3+d+
	rvTA==
X-Gm-Message-State: AKaTC01Ro4BmLLKu7aTtVMBzR7pC5/gwqrM/CiPEQSMC9HfNZUriw/ROv3kh3VpevvI9ag==
X-Received: by 10.99.245.21 with SMTP id w21mr193209082pgh.5.1481760375869;
	Wed, 14 Dec 2016 16:06:15 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	x90sm89734383pfk.73.2016.12.14.16.06.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Dec 2016 16:06:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Dec 2016 16:06:08 -0800
Message-Id: <20161215000608.14821-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH V2] fontconfig: Fix namespace conflicts with glibc
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
X-List-Received-Date: Thu, 15 Dec 2016 00:06:15 -0000

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
 ...icts-with-integer-width-macros-from-TS-18.patch | 72 ++++++++++++++++++++++
 .../fontconfig/fontconfig_2.12.1.bb                |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-graphics/fontconfig/fontconfig/0001-Avoid-conflicts-with-integer-width-macros-from-TS-18.patch

diff --git a/meta/recipes-graphics/fontconfig/fontconfig/0001-Avoid-conflicts-with-integer-width-macros-from-TS-18.patch b/meta/recipes-graphics/fontconfig/fontconfig/0001-Avoid-conflicts-with-integer-width-macros-from-TS-18.patch
new file mode 100644
index 0000000..cad7170
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


