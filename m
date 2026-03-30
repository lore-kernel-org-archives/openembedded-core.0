Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FB221061B10
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 15:16:32 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.54087.1774883788145609192
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2026 08:16:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Ju5a4+gn;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439d8df7620so3301329f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 08:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774883786; x=1775488586; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c7Ntv5WlGXlL27P/RsBAxjbVszcLFVitE0WPg10Pytc=;
        b=Ju5a4+gnOf22I4cusOmgaUMBUiV6KvU5IEFdz3PP2eaMMdanMf5sY35vnJMDw/gXaa
         5PJSVR++i+ML5kticxMXU8gKkuhCYjxOYJ1bElmfNIHJ/y7IP4O56p5DBx1FI3VoDd8o
         0AAK7xY8ulNBF1xkHls8CXGS0ouZF4m+fG0g9ODUCwvqcqfVUPSiUn7D4/imseLTWNZi
         CmzRxFoGK4sr0dfSeLi7gwCiaZTmokvF/zm4mSg14S7WZVyvMH4HxG5RrzekxbZtR3TA
         Inixw1bG5aOY93sR3l8aeXdfsQQV+cVpPcvCj43UDza5QnOVTMJeycHS7V+gjpw54qAG
         NE7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774883786; x=1775488586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c7Ntv5WlGXlL27P/RsBAxjbVszcLFVitE0WPg10Pytc=;
        b=Jo9KMq+8hHOvFxRIQDLyn4OKnz5Z3MSwxeFVPuR3cDBnUp/5LpN/gnW459k/U8PE0l
         dR43jRNuPbAnc2KXhHu2bMYch3lvOA42MeDMUpqlpuqn1nw07U8aZVX64bTzUSFxhKoT
         cqoJrXJxMapTM5N1KK6eY7lfCow5v+KI8LTO0dPAuqJ5jc95fJjOGmQU+CkbfUlZH0dM
         nobKJzo/uGOZYl2l3+q13+bfTL+r7F576AwLzsHynVN4RpE3snDpoR+wNskldbp916O1
         3dkyoUznTZNj9BIuIRGvWZcfIr2+nUPKL+WBTO6O7U8uSugvcT7AjKfAcshUX7GxQJN2
         N5Xw==
X-Gm-Message-State: AOJu0Yxozn0BkHIzuCmqQVcfEkQ23aBmPHzEN8YMPMZT/CZ3jWRS91GI
	JGiicWX3IR96VF+yBHytLxap7+fAYJ3P7K92orS4/9j73EnN8kaK2w93LRd/Vw==
X-Gm-Gg: ATEYQzz6A4fXjISQQVY6o05MKV2ZwEFzUgbxS5Rpw7pS+bP81HkhadVLv34v2AWp1p9
	clqyEYpVcyBOZfa10fAruoOkc6eK8be5Hf+WzNCLp5bMRKbV2X6DZzNonBaDIIOg5dXNhgqEveg
	LHvNK4ufUyDmntk+anvEBA/Gg/RJ0uHePwj1TIiFPxiIK6HlF5j3PiKXA4uL4odOgpuLO3HAFPE
	0g21noZpse8LeofL8FHy4w278UfALGSyaalwTePEIPH1DLRxw1n3px2XgWI5GLWqkhho28IPfdL
	BdfpssXqe9S+2ZxEQZgPc2y1P6CZ6H8mUQlOtTb/fB1Qhs3879hqWoDSOuC3VwgpSKbTIC2NDOL
	km9yxD4aiiTxiIz5cifK14Hu0gGTrrGds3w/W7MVPSt1G1MiUWHBHfVIN7sdSlU+zHodgQqLqW5
	wCsGu0Dq7RoCV0ebwbi7AqJkGk2Q==
X-Received: by 2002:a05:600c:a108:b0:485:17a7:b9c7 with SMTP id 5b1f17b1804b1-48727d6f6d8mr176843645e9.10.1774883786190;
        Mon, 30 Mar 2026 08:16:26 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722d49c18sm282326195e9.14.2026.03.30.08.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 08:16:25 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [whinlatter][PATCH 1/7] dtc: backport fix for build with glibc-2.43
Date: Mon, 30 Mar 2026 17:16:10 +0200
Message-ID: <20260330151620.3835312-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 15:16:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234242

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
 .../0001-Fix-discarded-const-qualifiers.patch | 83 +++++++++++++++++++
 meta/recipes-kernel/dtc/dtc_1.7.2.bb          |  1 +
 2 files changed, 84 insertions(+)
 create mode 100644 meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-const-qualifiers.patch

diff --git a/meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-const-qualifiers.patch b/meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-const-qualifiers.patch
new file mode 100644
index 0000000000..053a94f0bf
--- /dev/null
+++ b/meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-const-qualifiers.patch
@@ -0,0 +1,83 @@
+From c58beee7bec0774f12202511c97beb741ff2b534 Mon Sep 17 00:00:00 2001
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
+ meson.build          | 1 +
+ 3 files changed, 8 insertions(+), 4 deletions(-)
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
+index 28b667f..5f8aa62 100644
+--- a/libfdt/fdt_overlay.c
++++ b/libfdt/fdt_overlay.c
+@@ -409,7 +409,8 @@ static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
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
+index 310699f..2966b06 100644
+--- a/meson.build
++++ b/meson.build
+@@ -18,6 +18,7 @@ add_project_arguments(
+     '-Wshadow',
+     '-Wsuggest-attribute=format',
+     '-Wwrite-strings',
++    '-Wdiscarded-qualifiers',
+   ]),
+   language: 'c'
+ )
diff --git a/meta/recipes-kernel/dtc/dtc_1.7.2.bb b/meta/recipes-kernel/dtc/dtc_1.7.2.bb
index 92e83a9404..b8b79542c5 100644
--- a/meta/recipes-kernel/dtc/dtc_1.7.2.bb
+++ b/meta/recipes-kernel/dtc/dtc_1.7.2.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = " \
     git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=main;protocol=https \
+    file://0001-Fix-discarded-const-qualifiers.patch \
 "
 SRCREV = "2d10aa2afe35527728db30b35ec491ecb6959e5c"
 

