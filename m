Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 191D3C3DA40
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 16:41:33 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.1372.1689612087679900660
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 09:41:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=N/jkGtP5;
 spf=pass (domain: baylibre.com, ip: 209.85.219.42, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-63770af327fso33748246d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 09:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689612086; x=1690216886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+JyrG8X1hVd3hyvUg1azx8fY3JNeD39bXj9h4T2z7l8=;
        b=N/jkGtP5XLRsoKEGVy2iWywcHit/OpUVq/Fuw+fOE5KmX0KW+J1MQf6ZeynSUaznhI
         s/JBWqfDzFPmICXdZcw2uXwdJrtjgexGgAFU+wuEnM7a/CEL7WFdmqCLoCl016m/tv/z
         SbivsEU1+ceUvucFBHuazJfUp7w1w+D+qKak4cRxYt4O47nCTt8FVwNGvivglFI5NPU6
         /Q1Ju6WY4fD9M/PpR/5GzaPjRTERt8747T/nZfSFbpY4e6PTObxWHleXUexkQqxiEAuD
         3SPDgciCFW3NwGcDnfbEwicJwNBVChvlWMzppf3puet2P6/xYCzpAYUIPu0jkniDd8KO
         6xHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689612086; x=1690216886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+JyrG8X1hVd3hyvUg1azx8fY3JNeD39bXj9h4T2z7l8=;
        b=MwFo0Rb7VuZI1NPWlS5J9bxGZQzSlMgbk1CW6DvlVLE/+YjSNIhmS5E0iY21qCHr8g
         EwX3weww6RJMDLPnVhaxX+GPCS5PDjHLGlT/h39MOGIJvlZs1RC28QLxY+oi9d771Q35
         8YTRc9r8kak7pafgzkCvd2Qts0lH/mGSAws+wPIVWDzYbVox8C71kWAURPEv5ieIotkh
         UrIgGkFx50sV4ARe8QC9ITOi10ICxcArBNt836J+I/OqBc2hQLccBEeuYyttNBXKUcBd
         zA2SRFU6SVNHYrstGSoc7ZVBgVpiwqi0noO/qCfyhxey0Wc0AivHKUYt0HfVrETPKWkQ
         XT1g==
X-Gm-Message-State: ABy/qLYAU4O4djDBRsErISWu5asMpuQftbiMmEYsts6BwYBKJfzIMARt
	APzahK2/ZTbdtmGGVM9gG0qsx7/hKB9r3x2PzRE=
X-Google-Smtp-Source: APBJJlHQ2RicP+eYS6npw8fXZ4NdBeLHr9j+ZmatzDT3nsKG8yJvnE0rta3+NkouGDSj/9/Q97xhzg==
X-Received: by 2002:a0c:f013:0:b0:632:35e3:ea36 with SMTP id z19-20020a0cf013000000b0063235e3ea36mr12620609qvk.63.1689612086486;
        Mon, 17 Jul 2023 09:41:26 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id a24-20020a0cb358000000b0062dfdafa0b7sm9189qvf.136.2023.07.17.09.41.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 09:41:26 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/3] python3-dtc: add from meta-virtualization
Date: Mon, 17 Jul 2023 12:41:23 -0400
Message-ID: <20230717164124.1026028-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230717164124.1026028-1-tgamblin@baylibre.com>
References: <20230717164124.1026028-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 16:41:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184477

This provides pylibfdt, which is a runtime dependency for the dtschema
module that we already carry in oe-core.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...erlay-make-overlay_get_target-public.patch | 132 ++++++++++++++++++
 .../python/python3-dtc_1.6.1.bb               |  26 ++++
 2 files changed, 158 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-dtc/0001-Revert-libfdt-overlay-make-overlay_get_target-public.patch
 create mode 100644 meta/recipes-devtools/python/python3-dtc_1.6.1.bb

diff --git a/meta/recipes-devtools/python/python3-dtc/0001-Revert-libfdt-overlay-make-overlay_get_target-public.patch b/meta/recipes-devtools/python/python3-dtc/0001-Revert-libfdt-overlay-make-overlay_get_target-public.patch
new file mode 100644
index 0000000000..a2df482e3a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-dtc/0001-Revert-libfdt-overlay-make-overlay_get_target-public.patch
@@ -0,0 +1,132 @@
+From 4d4703e0199fb3556c37694e4d951785abca22fd Mon Sep 17 00:00:00 2001
+From: Bruce Ashfield <bruce.ashfield@gmail.com>
+Date: Wed, 19 Jan 2022 12:46:42 -0500
+Subject: [PATCH] Revert "libfdt: overlay: make overlay_get_target() public"
+
+This reverts commit 45f3d1a095dd3440578d5c6313eba555a791f3fb.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+---
+ libfdt/fdt_overlay.c | 29 ++++++++++++++++++++++-------
+ libfdt/libfdt.h      | 18 ------------------
+ libfdt/version.lds   |  1 -
+ 3 files changed, 22 insertions(+), 26 deletions(-)
+
+diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
+index 5c0c398..d217e79 100644
+--- a/libfdt/fdt_overlay.c
++++ b/libfdt/fdt_overlay.c
+@@ -40,22 +40,37 @@ static uint32_t overlay_get_target_phandle(const void *fdto, int fragment)
+ 	return fdt32_to_cpu(*val);
+ }
+ 
+-int fdt_overlay_target_offset(const void *fdt, const void *fdto,
+-			      int fragment_offset, char const **pathp)
++/**
++ * overlay_get_target - retrieves the offset of a fragment's target
++ * @fdt: Base device tree blob
++ * @fdto: Device tree overlay blob
++ * @fragment: node offset of the fragment in the overlay
++ * @pathp: pointer which receives the path of the target (or NULL)
++ *
++ * overlay_get_target() retrieves the target offset in the base
++ * device tree of a fragment, no matter how the actual targeting is
++ * done (through a phandle or a path)
++ *
++ * returns:
++ *      the targeted node offset in the base device tree
++ *      Negative error code on error
++ */
++static int overlay_get_target(const void *fdt, const void *fdto,
++			      int fragment, char const **pathp)
+ {
+ 	uint32_t phandle;
+ 	const char *path = NULL;
+ 	int path_len = 0, ret;
+ 
+ 	/* Try first to do a phandle based lookup */
+-	phandle = overlay_get_target_phandle(fdto, fragment_offset);
++	phandle = overlay_get_target_phandle(fdto, fragment);
+ 	if (phandle == (uint32_t)-1)
+ 		return -FDT_ERR_BADPHANDLE;
+ 
+ 	/* no phandle, try path */
+ 	if (!phandle) {
+ 		/* And then a path based lookup */
+-		path = fdt_getprop(fdto, fragment_offset, "target-path", &path_len);
++		path = fdt_getprop(fdto, fragment, "target-path", &path_len);
+ 		if (path)
+ 			ret = fdt_path_offset(fdt, path);
+ 		else
+@@ -621,7 +636,7 @@ static int overlay_merge(void *fdt, void *fdto)
+ 		if (overlay < 0)
+ 			return overlay;
+ 
+-		target = fdt_overlay_target_offset(fdt, fdto, fragment, NULL);
++		target = overlay_get_target(fdt, fdto, fragment, NULL);
+ 		if (target < 0)
+ 			return target;
+ 
+@@ -764,7 +779,7 @@ static int overlay_symbol_update(void *fdt, void *fdto)
+ 			return -FDT_ERR_BADOVERLAY;
+ 
+ 		/* get the target of the fragment */
+-		ret = fdt_overlay_target_offset(fdt, fdto, fragment, &target_path);
++		ret = overlay_get_target(fdt, fdto, fragment, &target_path);
+ 		if (ret < 0)
+ 			return ret;
+ 		target = ret;
+@@ -786,7 +801,7 @@ static int overlay_symbol_update(void *fdt, void *fdto)
+ 
+ 		if (!target_path) {
+ 			/* again in case setprop_placeholder changed it */
+-			ret = fdt_overlay_target_offset(fdt, fdto, fragment, &target_path);
++			ret = overlay_get_target(fdt, fdto, fragment, &target_path);
+ 			if (ret < 0)
+ 				return ret;
+ 			target = ret;
+diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
+index a7f432c..7f117e8 100644
+--- a/libfdt/libfdt.h
++++ b/libfdt/libfdt.h
+@@ -2116,24 +2116,6 @@ int fdt_del_node(void *fdt, int nodeoffset);
+  */
+ int fdt_overlay_apply(void *fdt, void *fdto);
+ 
+-/**
+- * fdt_overlay_target_offset - retrieves the offset of a fragment's target
+- * @fdt: Base device tree blob
+- * @fdto: Device tree overlay blob
+- * @fragment_offset: node offset of the fragment in the overlay
+- * @pathp: pointer which receives the path of the target (or NULL)
+- *
+- * fdt_overlay_target_offset() retrieves the target offset in the base
+- * device tree of a fragment, no matter how the actual targeting is
+- * done (through a phandle or a path)
+- *
+- * returns:
+- *      the targeted node offset in the base device tree
+- *      Negative error code on error
+- */
+-int fdt_overlay_target_offset(const void *fdt, const void *fdto,
+-			      int fragment_offset, char const **pathp);
+-
+ /**********************************************************************/
+ /* Debugging / informational functions                                */
+ /**********************************************************************/
+diff --git a/libfdt/version.lds b/libfdt/version.lds
+index cbce5d4..7ab85f1 100644
+--- a/libfdt/version.lds
++++ b/libfdt/version.lds
+@@ -77,7 +77,6 @@ LIBFDT_1.2 {
+ 		fdt_appendprop_addrrange;
+ 		fdt_setprop_inplace_namelen_partial;
+ 		fdt_create_with_flags;
+-		fdt_overlay_target_offset;
+ 	local:
+ 		*;
+ };
+-- 
+2.19.1
+
diff --git a/meta/recipes-devtools/python/python3-dtc_1.6.1.bb b/meta/recipes-devtools/python/python3-dtc_1.6.1.bb
new file mode 100644
index 0000000000..a868bd0109
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-dtc_1.6.1.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Python Library for the Device Tree Compiler"
+HOMEPAGE = "https://devicetree.org/"
+DESCRIPTION = "A python library for the Device Tree Compiler, a tool used to manipulate Device Tree files which contain a data structure for describing hardware."
+SECTION = "bootloader"
+LICENSE = "GPL-2.0-only | BSD-2-Clause"
+
+DEPENDS = "flex-native bison-native swig-native python3-setuptools-scm-native libyaml dtc"
+
+SRC_URI = "git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=master \
+           file://0001-Revert-libfdt-overlay-make-overlay_get_target-public.patch \
+          "
+
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
+
+LIC_FILES_CHKSUM = "file://pylibfdt/libfdt.i;beginline=1;endline=6;md5=afda088c974174a29108c8d80b5dce90"
+
+SRCREV = "c001fc01a43e7a06447c06ea3d50bd60641322b8"
+
+PV = "1.6.1+git${SRCPV}"
+S = "${WORKDIR}/git"
+
+PYPA_WHEEL = "${S}/dist/libfdt-1.6.2*.whl"
+
+inherit setuptools3 pkgconfig
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.41.0


