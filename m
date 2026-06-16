Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E734CD98F2
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 19:17:00 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5760.1781637412903081919
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 12:16:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=p2J62WVE;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490ace40f4bso46864045e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 12:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781637411; x=1782242211; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TnRuueY+O1Po16KgrEEGwiM6L2TzSMx2faAbm6pgros=;
        b=p2J62WVE0CurySnOaAEFsRppTSOsXrjQTIkZzb3wDL3di0P9yUV68TXRWw81sP9Hcn
         /AvT6ERVTnRa4mDqiV3UO5I4DWVobXGBZbfNyhIg6vwAPiVk+tnN1On7yNQLAbItS17D
         3bAohUS7crGwa5Qi1YhN5oLuUuSMLIvw/PgGxwGfnT0WdDqcFc5L29AIC8trRZOfzoTt
         NLfYJxa4YInGwy3bSM1UdfrSx+eWMTrbCIOTtDgkvRJ3cxI4a1yh6QyPd3jBo3XMLZvj
         ntNeXPndsbUoaoWl8BsHqHUUarf6NWFFQdP/zRqm6OLBiDCT4RGm8KpqlkuPXxXPCM/K
         RS3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781637411; x=1782242211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TnRuueY+O1Po16KgrEEGwiM6L2TzSMx2faAbm6pgros=;
        b=OYOiCT3CQqupZ7SoH+rUusMbVlZ+HN3KSp+PE6uiuw6CIDZZa57KulRc0dDfgwCAmt
         J5XlzGLJlF02GAYoqqDih2sbgihKoNUeaCMThVSl7vLjyrAzXdkfEKOKSzCmNEUTc2Q3
         odTKYufO0cluJ8+yxg92bTKfjDPr2Wk2ukLwlsdNguQp3rXPRUAcCfP9ZvaDPMYY9q3F
         JcG132yNDx+4NzH9OgcZCTDdb8qcP9ge0LrYTDnUVEqnrPERUAQVs+oRJjbhqjoTX+U5
         v35K4QM05EZc4ae1H5qqOnHPoyff30UmVF6IiAGuoR8IlA1cCTKu/y1o04qfUjslP7di
         hdGg==
X-Gm-Message-State: AOJu0Yw5H2l9aKuZxIrDGME391eLURl4msimI5m8111z7pN5EIOCaWah
	xmx/QxmL7bTSOGtS4kMEMJGssjO88ZXCA8zLUzeZ3DWBMEl7kyLQvZRzC+Jh5HGZ
X-Gm-Gg: Acq92OGHz4qXDD+C7CLBhTfi8Mq6L5cqR1KaZFLXAFvCOK3uZMa8INtyko7jISswZDe
	/apKkzmLWkg2liZnlMfBcrH+fsSjDX7QUSDFiN9cv787xyjcp6Ts4uvCsrvbHTrRKiTltlcZrqi
	ai1o95tIVcUcQyZDn61YlkfW+xeX8fAKxOtXHicxoWb4/4lsmA1R1h7lTiRe3Yu2fSbbtSN0otm
	xpAKI1uQsm3DHe86cdl8xWzhHFV4/VrL7RbbgiYKD7t+D9mhmJ9h27/m5ETUzN1Katht7MTdfWf
	bX/kAWO+YVTqz9bSYxY5pyiyRkW84naTFsE976Yu/cTg/mO5raPPkqJqca1RDvugFbr3ZnGveDH
	NMkGlb+u4KRI+/JnJMFOCE8mhZzAMyGggv4IU5ItBes+UIN85O5GsyXOin8orr0A4i8uFS5HSzT
	++syE8QuhA3K6DAmDc5uVPVu5CysiU0GjEBOHdqzIxCsYP5J2wGaJiSI4WWdE=
X-Received: by 2002:a05:600c:3e0f:b0:490:add9:7f88 with SMTP id 5b1f17b1804b1-492333c9592mr11869655e9.21.1781637410996;
        Tue, 16 Jun 2026 12:16:50 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a4f8d7sm86982035e9.5.2026.06.16.12.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 12:16:50 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 18/30] dtc: upgrade 1.7.2 -> 1.8.1
Date: Tue, 16 Jun 2026 21:16:14 +0200
Message-ID: <20260616191628.2014553-18-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260616191628.2014553-1-alex.kanavin@gmail.com>
References: <20260616191628.2014553-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 19:17:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238943

From: Alexander Kanavin <alex@linutronix.de>

License-Update: typo fix

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-Fix-discarded-const-qualifiers.patch | 83 -------------------
 .../dtc/{dtc_1.7.2.bb => dtc_1.8.1.bb}        |  6 +-
 2 files changed, 3 insertions(+), 86 deletions(-)
 delete mode 100644 meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-const-qualifiers.patch
 rename meta/recipes-kernel/dtc/{dtc_1.7.2.bb => dtc_1.8.1.bb} (85%)

diff --git a/meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-const-qualifiers.patch b/meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-const-qualifiers.patch
deleted file mode 100644
index 053a94f0bf..0000000000
--- a/meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-const-qualifiers.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-From c58beee7bec0774f12202511c97beb741ff2b534 Mon Sep 17 00:00:00 2001
-From: Stephen Gallagher <sgallagh@redhat.com>
-Date: Tue, 6 Jan 2026 14:19:30 -0500
-Subject: [PATCH] Fix discarded const qualifiers
-
-It's unsafe to implicitly discard the const qualifier on a pointer. In
-overlay_fixup_phandle(), this was probably just an oversight, and making
-the "sep" variable a const char * is sufficient to fix it.
-
-In create_node(), however, the "p" variable is directly modifying the
-buffer pointed to by "const char* node_name". To fix this, we need to
-actually make a duplicate of the buffer and operate on that instead.
-
-This introduces a malloc()/free()  and an unbounded strdup() into the
-operation, but fdtput isn't a long-running service and the node_name
-argument comes directly from argv, so this shouldn't introduce a
-significant performance impact.
-
-Signed-off-by: Stephen Gallagher <sgallagh@redhat.com>
-Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/utils/dtc/dtc.git/commit/libfdt/fdt_overlay.c?h=main&id=9a1c801a1a3c102bf95c5339c9e985b26b823a21]
----
- fdtput.c             | 8 +++++---
- libfdt/fdt_overlay.c | 3 ++-
- meson.build          | 1 +
- 3 files changed, 8 insertions(+), 4 deletions(-)
-
-diff --git a/fdtput.c b/fdtput.c
-index c2fecf4..8deec7e 100644
---- a/fdtput.c
-+++ b/fdtput.c
-@@ -230,19 +230,21 @@ static int create_paths(char **blob, const char *in_path)
- static int create_node(char **blob, const char *node_name)
- {
- 	int node = 0;
--	char *p;
-+	const char *p;
-+	char *path = NULL;
- 
- 	p = strrchr(node_name, '/');
- 	if (!p) {
- 		report_error(node_name, -1, -FDT_ERR_BADPATH);
- 		return -1;
- 	}
--	*p = '\0';
- 
- 	*blob = realloc_node(*blob, p + 1);
- 
- 	if (p > node_name) {
--		node = fdt_path_offset(*blob, node_name);
-+		path = xstrndup(node_name, (size_t)(p - node_name));
-+		node = fdt_path_offset(*blob, path);
-+		free(path);
- 		if (node < 0) {
- 			report_error(node_name, -1, node);
- 			return -1;
-diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
-index 28b667f..5f8aa62 100644
---- a/libfdt/fdt_overlay.c
-+++ b/libfdt/fdt_overlay.c
-@@ -409,7 +409,8 @@ static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
- 		const char *fixup_str = value;
- 		uint32_t path_len, name_len;
- 		uint32_t fixup_len;
--		char *sep, *endptr;
-+		const char *sep;
-+		char *endptr;
- 		int poffset, ret;
- 
- 		fixup_end = memchr(value, '\0', len);
-diff --git a/meson.build b/meson.build
-index 310699f..2966b06 100644
---- a/meson.build
-+++ b/meson.build
-@@ -18,6 +18,7 @@ add_project_arguments(
-     '-Wshadow',
-     '-Wsuggest-attribute=format',
-     '-Wwrite-strings',
-+    '-Wdiscarded-qualifiers',
-   ]),
-   language: 'c'
- )
diff --git a/meta/recipes-kernel/dtc/dtc_1.7.2.bb b/meta/recipes-kernel/dtc/dtc_1.8.1.bb
similarity index 85%
rename from meta/recipes-kernel/dtc/dtc_1.7.2.bb
rename to meta/recipes-kernel/dtc/dtc_1.8.1.bb
index b8b79542c5..5c3b1d7a6d 100644
--- a/meta/recipes-kernel/dtc/dtc_1.7.2.bb
+++ b/meta/recipes-kernel/dtc/dtc_1.8.1.bb
@@ -6,13 +6,13 @@ LICENSE = "GPL-2.0-only | BSD-2-Clause"
 
 LIC_FILES_CHKSUM = "file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://BSD-2-Clause;md5=5d6306d1b08f8df623178dfd81880927 \
-                    file://README.license;md5=a1eb22e37f09df5b5511b8a278992d0e"
+                    file://README.license;md5=a5696bd07fcc7285cbbacc42c2132248 \
+                    "
 
 SRC_URI = " \
     git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=main;protocol=https \
-    file://0001-Fix-discarded-const-qualifiers.patch \
 "
-SRCREV = "2d10aa2afe35527728db30b35ec491ecb6959e5c"
+SRCREV = "8f48565e5cfedc74d3f7512f1e0188e9d85dc1de"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-- 
2.47.3


