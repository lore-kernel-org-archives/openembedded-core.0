Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBE15F327A3
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 05:42:55 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11368.1776750169668713867
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2026 22:42:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FeYpyeMf;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48909558b3aso28762205e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 22:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776750168; x=1777354968; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OiZo5WZ9XgeMHuOS5qnZXY7aCV3BApaNYeGnZbPIQlk=;
        b=FeYpyeMfNIXZH48I9c7ngIM/5ixwNpsV0NbgR1vnYe7K25M5m7aYborB1/b9mZWej3
         QyuqUeo3i/Ji3j2/Z59Cjg9ngfSsMmRveokb8DCS74HBhw0SPg/fVhgAq/pMGaZn7+qv
         xIrZEUTeiebb+8n94yp88SpjnbtDFXMLoZMxUAfg2QPo7gSGvL1f26z1k9IYgCYwr884
         o+61kNDs7KkF0nJA0BVFNklHV8Oqd/kv/IdTzX4EPrgDr5Jx4KVkr8wz4LXh/jUxLPQu
         Tj1KlPTGLt+4pNwLn4Rg4JTPkQV/8n6f/qSZPRb6n7yN7Tk9jybqf3IVc++jYjnhQUXN
         k+Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776750168; x=1777354968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OiZo5WZ9XgeMHuOS5qnZXY7aCV3BApaNYeGnZbPIQlk=;
        b=RVzu7pmS7mT8Ne3m7u9I3+ZA+gJWyft10d0KowuZupUdzDXqKHf7+ZzttcXk3vm2TU
         yqzFh5ZkkBRFVgtSvRBkWP34cDS/MeLSXVhS7Cpy/0dHBJ+r4VmgRhwZedg3DgfJkuMM
         JW5EHh/Xy91GkKvteycIT1ourwtazZxFypavpwYFPjaVzo1rH2XD6jbU5YSPyrmD8/bc
         x/R/erlgrZtoNseZVV0lg98Q+cHbe5wE6ALJTwOHhQY6kE0N/npjWhaSJQXjvoiavz3y
         53cmJGTaaQlhJ6Wk6jJ6rgCP6Nyqlo7IVDqDAA+pfircXx3jg/764CNq06iqLvE7l/S2
         /P2Q==
X-Gm-Message-State: AOJu0YyDxApA6uVwmlmKwyLVveI4WB64VTpzt1DqWrcLwEa42ghNEx+w
	slgwF5YaFi58fpavjfnXBGRw398RNLiF3x+vP/lh+cj5oF4qJqbOPjphoBz6GA==
X-Gm-Gg: AeBDievbcwUbAVgAZLW7VBfvMPwBhZKi3Q8zdYZUe+6UZvZgh5ESMK/l1jN5gV4t2Tj
	0cqBhE5VAfLjFb5auZmgxEjWHYJeMv6lacb3znuLxxTFtozKnEI8Y3fJ2OzPyzavK6BaWxT8jV6
	uRFFK90M6pHiLokTKU8N+2VV+dpobYucs7121M1viq2pEzgQ0Y14mwmp/4XgjL9k3zED50XS9wQ
	tOQXHlsytR7mCHhrgDElNCre53vYLl/l2MC8lhuXx4/LS7es3dYYTAnpC2ClNrg6Yq/G1hDsm7Y
	s9WUWM4YIMU/42dgkDIbzohJ0aO/M4xy3yLIO7plFx+QmPPwnScgOII3n5lw9BntVJqWRI27BhF
	xYEd2gyUA7T+d5dONMChNiGFulGfD3C+KQEpQ9O6TDAKJOmMMWkc2+lT4tbTIJUe7Y+CBZW8dvF
	vlyiYUeWwzbarpOoJNqjWf6RUeg0/Cp/h5Frs6IrN7ixeKam5aUjn3o3TFE5NRTxsugBZkNYf9/
	LOgDJsgTgYCNUyagfPi
X-Received: by 2002:a05:600c:530e:b0:485:4eaf:eb53 with SMTP id 5b1f17b1804b1-488fb768db3mr243381045e9.19.1776750167453;
        Mon, 20 Apr 2026 22:42:47 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc0f8188sm361267535e9.2.2026.04.20.22.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 22:42:46 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH 1/6] dtc: backport fix for build with glibc-2.43
Date: Tue, 21 Apr 2026 07:42:35 +0200
Message-ID: <20260421054240.3264-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 05:42:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235591

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
---
 .../0001-Fix-discarded-const-qualifiers.patch | 85 +++++++++++++++++++
 meta/recipes-kernel/dtc/dtc_1.7.0.bb          |  1 +
 2 files changed, 86 insertions(+)
 create mode 100644 meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-const-qualifiers.patch

diff --git a/meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-const-qualifiers.patch b/meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-const-qualifiers.patch
new file mode 100644
index 0000000000..c643410ae9
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
index 0702fc16df..a2f41197fd 100644
--- a/meta/recipes-kernel/dtc/dtc_1.7.0.bb
+++ b/meta/recipes-kernel/dtc/dtc_1.7.0.bb
@@ -12,6 +12,7 @@ SRC_URI = " \
     git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=main;protocol=https \
     file://0001-meson.build-bump-version-to-1.7.0.patch \
     file://0002-meson-allow-building-from-shallow-clones.patch \
+    file://0001-Fix-discarded-const-qualifiers.patch \
 "
 SRCREV = "039a99414e778332d8f9c04cbd3072e1dcc62798"
 

