Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E03BE7716D
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 06:49:51 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.8178.1733294986133347134
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 22:49:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WUDf8oNd;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-385de59c1a0so4794454f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 22:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733294984; x=1733899784; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h0TL8v6WA0CYM+cSGxKDR3WaOpGEC5e2FC4eugFfSRs=;
        b=WUDf8oNdnRKJCuM6Mw2ujA+ANxf9ob7qpAFf/TNmoyiWIMK/2tskvkPpD3plAqg33B
         cKX1q2YFnQHr+eD/kSFyMrnXahViijXd9vqHX4IQ0avy/wZeb7nEERHp86R5z+PtDnWf
         iu2oqZtATf89gdGHDPg39mO0vDAuue+79yMq+3rmAfjux67I05LR74Ks8rRg9z4Eki4Q
         CYXsJR7U3qQsXG0grxidqy5lOunOZFKuNX6Zd8E9ejYC3sb76wDdPbcsQAUCp00nB1bK
         vTOxGr18ZZl+LM0z8OGuMXSGdr5zvwM4NR+ACk+1OAwriIefb68ExITrWUFK2Q4w7KUU
         9FzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733294984; x=1733899784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h0TL8v6WA0CYM+cSGxKDR3WaOpGEC5e2FC4eugFfSRs=;
        b=nqfhb+C1XdNwU3ZmLYwZT8jFvsdJ8ytoS4aKpxI/N0JA92L9DamKhgd+Tu0uTduoYU
         79k3BLHbjS3S3XmkJOPC79aKCFxQOvkxfBf6l2nu0OacXPYsvb7+KIDT3Gq/kXq3ee7G
         +UwGNYck0UW3QGNyX6z3hTXMPwmBM1FQfdtYp9+KqoOcz7WNmRciSiRTSHBDFll2Rtms
         pStXhJVlFJgc9nD6JRlsdz5QF7YwdBUmWbLxyo1ZsNTIJrkhN2mHnJsUm2ygTiqO/2jx
         AAMaFo5UMplMNUYCC1kSx8BKtVbe9uov4bRx8bO8hjFY2Rmz6lhk2Hg4m4pRpQM6oXHM
         ygkA==
X-Gm-Message-State: AOJu0Yxxkgh0X0BNQkbuj1macJOO4azAOmbh/6j7o6VDkRU9rLpGNRMV
	m08D8FKxn+yre326l9YZETGn/59pEwfHe99lKSi+Gmd8eiiz6pNV4ouw2w==
X-Gm-Gg: ASbGncuyjFotexG+nYuBkFHMJ1xww1aG/wYMlSmi0p4t9VDyfmOCC9cQHbAk3FB7AHK
	vZ64lEj8Ul6TJQ/jaSMoBAFJBFJqLNrA8igHCbe8RAtAQw4Fv8r846XIvadMn3qT6teLcOg8ib4
	Lkf72L1N0YJG2bIMtkaxP0KggoCsOmnRQnraVR5qPI5RX/OYQ94RFagTBwQlNn0KceHTyDNPR+I
	4cnaKnl589UMNXs+d5rRDsFyLT52p7fvqZqG2gQrcmmjZw7pb/7LXv9vAZOOgLoB7YUav9zXwSh
	2mUDLFDuoTE=
X-Google-Smtp-Source: AGHT+IGEyKA9s0lQ7tMZJZ8/uA4ezWMkCRC9RmLNjG9zuA9Raj0Hl89MGc2X2iylv7m25h8CoNIGdA==
X-Received: by 2002:a05:6000:471c:b0:385:fc8c:24b6 with SMTP id ffacd0b85a97d-385fd3f188bmr4588559f8f.27.1733294984346;
        Tue, 03 Dec 2024 22:49:44 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385f343f293sm7435757f8f.36.2024.12.03.22.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 22:49:44 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 15/37] python3-dtc: update 1.7.0 -> 1.7.2
Date: Wed,  4 Dec 2024 07:48:58 +0100
Message-Id: <20241204064920.817016-15-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204064920.817016-1-alex.kanavin@gmail.com>
References: <20241204064920.817016-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 06:49:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208244

From: Alexander Kanavin <alex@linutronix.de>

Remove patch, as it is a leftover from meta-virtualization times
where python3-dtc was ahead of dtc in oe-core and had to be tweaked.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...erlay-make-overlay_get_target-public.patch | 132 ------------------
 ...hon3-dtc_1.7.0.bb => python3-dtc_1.7.2.bb} |   7 +-
 2 files changed, 3 insertions(+), 136 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-dtc/0001-Revert-libfdt-overlay-make-overlay_get_target-public.patch
 rename meta/recipes-devtools/python/{python3-dtc_1.7.0.bb => python3-dtc_1.7.2.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-dtc/0001-Revert-libfdt-overlay-make-overlay_get_target-public.patch b/meta/recipes-devtools/python/python3-dtc/0001-Revert-libfdt-overlay-make-overlay_get_target-public.patch
deleted file mode 100644
index a2df482e3aa..00000000000
--- a/meta/recipes-devtools/python/python3-dtc/0001-Revert-libfdt-overlay-make-overlay_get_target-public.patch
+++ /dev/null
@@ -1,132 +0,0 @@
-From 4d4703e0199fb3556c37694e4d951785abca22fd Mon Sep 17 00:00:00 2001
-From: Bruce Ashfield <bruce.ashfield@gmail.com>
-Date: Wed, 19 Jan 2022 12:46:42 -0500
-Subject: [PATCH] Revert "libfdt: overlay: make overlay_get_target() public"
-
-This reverts commit 45f3d1a095dd3440578d5c6313eba555a791f3fb.
-
-Upstream-Status: Inappropriate [embedded specific]
-
----
- libfdt/fdt_overlay.c | 29 ++++++++++++++++++++++-------
- libfdt/libfdt.h      | 18 ------------------
- libfdt/version.lds   |  1 -
- 3 files changed, 22 insertions(+), 26 deletions(-)
-
-diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
-index 5c0c398..d217e79 100644
---- a/libfdt/fdt_overlay.c
-+++ b/libfdt/fdt_overlay.c
-@@ -40,22 +40,37 @@ static uint32_t overlay_get_target_phandle(const void *fdto, int fragment)
- 	return fdt32_to_cpu(*val);
- }
- 
--int fdt_overlay_target_offset(const void *fdt, const void *fdto,
--			      int fragment_offset, char const **pathp)
-+/**
-+ * overlay_get_target - retrieves the offset of a fragment's target
-+ * @fdt: Base device tree blob
-+ * @fdto: Device tree overlay blob
-+ * @fragment: node offset of the fragment in the overlay
-+ * @pathp: pointer which receives the path of the target (or NULL)
-+ *
-+ * overlay_get_target() retrieves the target offset in the base
-+ * device tree of a fragment, no matter how the actual targeting is
-+ * done (through a phandle or a path)
-+ *
-+ * returns:
-+ *      the targeted node offset in the base device tree
-+ *      Negative error code on error
-+ */
-+static int overlay_get_target(const void *fdt, const void *fdto,
-+			      int fragment, char const **pathp)
- {
- 	uint32_t phandle;
- 	const char *path = NULL;
- 	int path_len = 0, ret;
- 
- 	/* Try first to do a phandle based lookup */
--	phandle = overlay_get_target_phandle(fdto, fragment_offset);
-+	phandle = overlay_get_target_phandle(fdto, fragment);
- 	if (phandle == (uint32_t)-1)
- 		return -FDT_ERR_BADPHANDLE;
- 
- 	/* no phandle, try path */
- 	if (!phandle) {
- 		/* And then a path based lookup */
--		path = fdt_getprop(fdto, fragment_offset, "target-path", &path_len);
-+		path = fdt_getprop(fdto, fragment, "target-path", &path_len);
- 		if (path)
- 			ret = fdt_path_offset(fdt, path);
- 		else
-@@ -621,7 +636,7 @@ static int overlay_merge(void *fdt, void *fdto)
- 		if (overlay < 0)
- 			return overlay;
- 
--		target = fdt_overlay_target_offset(fdt, fdto, fragment, NULL);
-+		target = overlay_get_target(fdt, fdto, fragment, NULL);
- 		if (target < 0)
- 			return target;
- 
-@@ -764,7 +779,7 @@ static int overlay_symbol_update(void *fdt, void *fdto)
- 			return -FDT_ERR_BADOVERLAY;
- 
- 		/* get the target of the fragment */
--		ret = fdt_overlay_target_offset(fdt, fdto, fragment, &target_path);
-+		ret = overlay_get_target(fdt, fdto, fragment, &target_path);
- 		if (ret < 0)
- 			return ret;
- 		target = ret;
-@@ -786,7 +801,7 @@ static int overlay_symbol_update(void *fdt, void *fdto)
- 
- 		if (!target_path) {
- 			/* again in case setprop_placeholder changed it */
--			ret = fdt_overlay_target_offset(fdt, fdto, fragment, &target_path);
-+			ret = overlay_get_target(fdt, fdto, fragment, &target_path);
- 			if (ret < 0)
- 				return ret;
- 			target = ret;
-diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
-index a7f432c..7f117e8 100644
---- a/libfdt/libfdt.h
-+++ b/libfdt/libfdt.h
-@@ -2116,24 +2116,6 @@ int fdt_del_node(void *fdt, int nodeoffset);
-  */
- int fdt_overlay_apply(void *fdt, void *fdto);
- 
--/**
-- * fdt_overlay_target_offset - retrieves the offset of a fragment's target
-- * @fdt: Base device tree blob
-- * @fdto: Device tree overlay blob
-- * @fragment_offset: node offset of the fragment in the overlay
-- * @pathp: pointer which receives the path of the target (or NULL)
-- *
-- * fdt_overlay_target_offset() retrieves the target offset in the base
-- * device tree of a fragment, no matter how the actual targeting is
-- * done (through a phandle or a path)
-- *
-- * returns:
-- *      the targeted node offset in the base device tree
-- *      Negative error code on error
-- */
--int fdt_overlay_target_offset(const void *fdt, const void *fdto,
--			      int fragment_offset, char const **pathp);
--
- /**********************************************************************/
- /* Debugging / informational functions                                */
- /**********************************************************************/
-diff --git a/libfdt/version.lds b/libfdt/version.lds
-index cbce5d4..7ab85f1 100644
---- a/libfdt/version.lds
-+++ b/libfdt/version.lds
-@@ -77,7 +77,6 @@ LIBFDT_1.2 {
- 		fdt_appendprop_addrrange;
- 		fdt_setprop_inplace_namelen_partial;
- 		fdt_create_with_flags;
--		fdt_overlay_target_offset;
- 	local:
- 		*;
- };
--- 
-2.19.1
-
diff --git a/meta/recipes-devtools/python/python3-dtc_1.7.0.bb b/meta/recipes-devtools/python/python3-dtc_1.7.2.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-dtc_1.7.0.bb
rename to meta/recipes-devtools/python/python3-dtc_1.7.2.bb
index 85e48d46942..99ff0cca874 100644
--- a/meta/recipes-devtools/python/python3-dtc_1.7.0.bb
+++ b/meta/recipes-devtools/python/python3-dtc_1.7.2.bb
@@ -6,15 +6,14 @@ LICENSE = "GPL-2.0-only | BSD-2-Clause"
 
 DEPENDS = "flex-native bison-native swig-native python3-setuptools-scm-native libyaml dtc"
 
-SRC_URI = "git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=master \
-           file://0001-Revert-libfdt-overlay-make-overlay_get_target-public.patch \
-          "
+SRC_URI = "git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=main \
+           "
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 LIC_FILES_CHKSUM = "file://pylibfdt/libfdt.i;beginline=1;endline=6;md5=afda088c974174a29108c8d80b5dce90"
 
-SRCREV = "039a99414e778332d8f9c04cbd3072e1dcc62798"
+SRCREV = "2d10aa2afe35527728db30b35ec491ecb6959e5c"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.5


