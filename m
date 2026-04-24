Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 045DEFF8847
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:57:14 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32604.1777064227018594775
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:57:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=CMOdoYD5;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso38756315e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064225; x=1777669025; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4oBgZxoFYGahSEFbzboDfXK7MkJ+E7dE/GQOB6AcGZA=;
        b=CMOdoYD5xYMMtCTe8iW+FUhXS6WH3LuP0c0WwrdhEo5mvuJwRLdcJUX9HYMRTwrqIS
         x4TYDPiySJPBB0A1u041uVYYOqjh8uAq4yr4RNDzLAt52N77sGsYOLil8CUwocwg2eWc
         0rGnLemF6ZwdhPlXoPT/MkuGgr98UidM/XzlI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064225; x=1777669025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4oBgZxoFYGahSEFbzboDfXK7MkJ+E7dE/GQOB6AcGZA=;
        b=TWqv0qmH8wVBHQ7088ncy5JZB8llJG4meQD3t8AocnpQD2GgH5/24zklX6+ZbdH2Ac
         to0Fh9h9AyfmcCobRqn4cN354Ju800JHnb3JRjgHLg3FctkwPcjrAgr6YYfzWKN4GDVH
         7jaEy0b/FG0MfYyNLZjcIkW1sA6ssAKmkCLdGCSUDmDec4rKSk9+4o5cK1eakfjp98ZJ
         1dlGOX0qQXAJ3uVKgnxgTDk1gQcADxK9Mqkzuaew6Lp+W+/KeGuCA6YFGlMxET9QOp5p
         SCKTxyrIdjs2LbxrJEh/Jyh6vG1NyEQNsSDZP0j1eDneYRAWEje/6HKpYlP8KyLT0K7/
         2P6Q==
X-Gm-Message-State: AOJu0Yz1FfKW+ElxXhtmqZjgPGvv/Dquhj2QftsVhqoD5BnanASNkpdi
	VJqHblqAUn/L5iXjmsXYWjtUY77gmLBh2A1fTEL7P2VzIhPmZDJgrE5PRJ9llEXeGmwuihO3Pk7
	3YUpDA5EuxqIM
X-Gm-Gg: AeBDieuP6tkxWFW7/BzXJpi4W1zvoaP0n77ze74NBMNwMggDFLBqPm1gfqvesSVuz16
	vr2xij13XGZBxtS10hXUC9y7K2QV/iUDELCgCFIWIBUXyPrwskAyCzM5yYkp01r3+h1X0cOi9qj
	oln3t7JK358Bv+CdcSMcX3meHtnTnPgQu9pRdkvLOvDLUGBCaYcJpmWJH3JOo6ZMgDv1xjoDfg2
	5cSRBLOTM1hlbUgERTOOjDZ7U7SQgSpFgQ6c0MuCUl5TSTVtekwAYHPm4pS4kaDE/eCYGshMYWX
	eAJOUZqOIYM2iVAvQM024HteVzzBuz7aGVtuhOjPr1aBO/8YQIF19Wqow1daihMYmowo3PZdrJw
	Z+tpJQm5G/0aQS+F4IIepRrdjEpIPeWL/yR1y8sR1DtCgUSTfd7gtZvY61BE/JAghMakU1cxl5L
	ml0Qkq1zGrE/8RuJkfO6Ox0ACMvtTCVVsdN2UEr67RDJoa7XeU7Bo4S3KXDMn0KZy8JvDkpK0fV
	XxfORfxUtNxwulMA9jnIYxud+QiKK56c12rXA==
X-Received: by 2002:a05:600c:3f10:b0:485:35d3:ce59 with SMTP id 5b1f17b1804b1-488fb753c9amr449406425e9.10.1777064225063;
        Fri, 24 Apr 2026 13:57:05 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.57.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:57:04 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 48/66] dtc: backport fix for build with glibc-2.43
Date: Fri, 24 Apr 2026 22:55:47 +0200
Message-ID: <7e9f4ab3d1839cef771675091e5ce49eccc39169.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:57:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235921

From: Martin Jansa <martin.jansa@gmail.com>

glibc-2.43 isn't used in OE builds yet, but this fixes dtc-native:
https://errors.yoctoproject.org/Errors/Details/903983/

../sources/dtc-1.7.2/libfdt/fdt_overlay.c: In function ‘overlay_fixup_phandle’:
../sources/dtc-1.7.2/libfdt/fdt_overlay.c:424:21: error: assignment discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
  424 |                 sep = memchr(fixup_str, ':', fixup_len);
      |                     ^
../sources/dtc-1.7.2/libfdt/fdt_overlay.c:434:21: error: assignment discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
  434 |                 sep = memchr(name, ':', fixup_len);
      |                     ^
cc1: all warnings being treated as errors

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 28552a7b6c94060c7ab3899619ab8afb74124d02)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../0001-Fix-discarded-const-qualifiers.patch | 85 +++++++++++++++++++
 meta/recipes-kernel/dtc/dtc_1.7.0.bb          |  1 +
 2 files changed, 86 insertions(+)
 create mode 100644 meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-const-qualifiers.patch

diff --git a/meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-const-qualifiers.patch b/meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-const-qualifiers.patch
new file mode 100644
index 00000000000..c643410ae9b
--- /dev/null
+++ b/meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-const-qualifiers.patch
@@ -0,0 +1,85 @@
+From 861cb43eb53afff83e28ba0e0f88ffa464ebe8ca Mon Sep 17 00:00:00 2001
+From: Stephen Gallagher <sgallagh@redhat.com>
+Date: Tue, 6 Jan 2026 14:19:30 -0500
+Subject: [PATCH] Fix discarded const qualifiers
+
+It's unsafe to implicitly discard the const qualifier on a pointer. In
+overlay_fixup_phandle(), this was probably just an oversight, and making
+the "sep" variable a const char * is sufficient to fix it.
+
+In create_node(), however, the "p" variable is directly modifying the
+buffer pointed to by "const char* node_name". To fix this, we need to
+actually make a duplicate of the buffer and operate on that instead.
+
+This introduces a malloc()/free()  and an unbounded strdup() into the
+operation, but fdtput isn't a long-running service and the node_name
+argument comes directly from argv, so this shouldn't introduce a
+significant performance impact.
+
+Signed-off-by: Stephen Gallagher <sgallagh@redhat.com>
+Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/utils/dtc/dtc.git/commit/libfdt/fdt_overlay.c?h=main&id=9a1c801a1a3c102bf95c5339c9e985b26b823a21]
+---
+ fdtput.c             | 8 +++++---
+ libfdt/fdt_overlay.c | 3 ++-
+ meson.build          | 3 ++-
+ 3 files changed, 9 insertions(+), 5 deletions(-)
+
+diff --git a/fdtput.c b/fdtput.c
+index c2fecf4..8deec7e 100644
+--- a/fdtput.c
++++ b/fdtput.c
+@@ -230,19 +230,21 @@ static int create_paths(char **blob, const char *in_path)
+ static int create_node(char **blob, const char *node_name)
+ {
+ 	int node = 0;
+-	char *p;
++	const char *p;
++	char *path = NULL;
+ 
+ 	p = strrchr(node_name, '/');
+ 	if (!p) {
+ 		report_error(node_name, -1, -FDT_ERR_BADPATH);
+ 		return -1;
+ 	}
+-	*p = '\0';
+ 
+ 	*blob = realloc_node(*blob, p + 1);
+ 
+ 	if (p > node_name) {
+-		node = fdt_path_offset(*blob, node_name);
++		path = xstrndup(node_name, (size_t)(p - node_name));
++		node = fdt_path_offset(*blob, path);
++		free(path);
+ 		if (node < 0) {
+ 			report_error(node_name, -1, node);
+ 			return -1;
+diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
+index 5c0c398..75b0619 100644
+--- a/libfdt/fdt_overlay.c
++++ b/libfdt/fdt_overlay.c
+@@ -431,7 +431,8 @@ static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
+ 		const char *fixup_str = value;
+ 		uint32_t path_len, name_len;
+ 		uint32_t fixup_len;
+-		char *sep, *endptr;
++		const char *sep;
++		char *endptr;
+ 		int poffset, ret;
+ 
+ 		fixup_end = memchr(value, '\0', len);
+diff --git a/meson.build b/meson.build
+index 8952e8a..ecb0ae0 100644
+--- a/meson.build
++++ b/meson.build
+@@ -14,7 +14,8 @@ add_project_arguments(
+     '-Wstrict-prototypes',
+     '-Wmissing-prototypes',
+     '-Wredundant-decls',
+-    '-Wshadow'
++    '-Wshadow',
++    '-Wdiscarded-qualifiers'
+   ]),
+   language: 'c'
+ )
diff --git a/meta/recipes-kernel/dtc/dtc_1.7.0.bb b/meta/recipes-kernel/dtc/dtc_1.7.0.bb
index 0702fc16dfa..a2f41197fda 100644
--- a/meta/recipes-kernel/dtc/dtc_1.7.0.bb
+++ b/meta/recipes-kernel/dtc/dtc_1.7.0.bb
@@ -12,6 +12,7 @@ SRC_URI = " \
     git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=main;protocol=https \
     file://0001-meson.build-bump-version-to-1.7.0.patch \
     file://0002-meson-allow-building-from-shallow-clones.patch \
+    file://0001-Fix-discarded-const-qualifiers.patch \
 "
 SRCREV = "039a99414e778332d8f9c04cbd3072e1dcc62798"
 

