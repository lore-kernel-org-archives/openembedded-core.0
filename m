Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9321C0015E
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 14:43:10 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web10.8916.1689950587225631763
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jul 2023 07:43:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=YXXWYER8;
 spf=pass (domain: baylibre.com, ip: 209.85.219.48, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-635dbfa710dso14554106d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 07:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689950586; x=1690555386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uXUiEgeXCwnxxMKPviBJRG0p5XvWGbdytg0iWSdy6Cc=;
        b=YXXWYER8ap8ND6PzlPLPoC1tJqbDfwzff4XraPcHEKc6kr4ptLbXg2tjOzbkUE+RpA
         b+snP7kVzL78DSR+hGBGShT0glJqox7ixpKBENpKGdM2Ac50MZPrjgW1GAxqmty1r9nb
         8B9zjwNL/p/mSBCI4umbgxJwm55IyVTTDc0ARB0ZT9LI4ZAQ8YTdfc/6mr+63xvy1zd7
         Ije/I6VrFURMDHR2m70Qk+xFpQ/vd0EpzUUv8kLuw2gK+0dAuYLmqBkAxDYwH/Rpo+Rh
         0LClRgu9XPAhYru0cklRx2MN6q3WypfWKaHdUdCHxNeUkFGQ7G6SmbOczUa9iKLRUDw4
         5qYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689950586; x=1690555386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uXUiEgeXCwnxxMKPviBJRG0p5XvWGbdytg0iWSdy6Cc=;
        b=X4HhZLaWREcpXbGhmMEf+RmWEnaJZR9wCl1Dpf/pGx+KSx6RO/THniqvMQ99STIAva
         1zBEUyqmNi26Ld2GSmIl8AArl4pT2ykBM45cn5fNtiA90EFMcJgDG49iq4M3GVb+DOxG
         jcanH0OETTf+w5CX+1+XvvrPPISWrXKL2L9LkCVRdy3rA4DM4cDBkmri42N/mZIcDpQN
         ipzyh+L3Svmo8b+85qneK+6yKA13Uw1PI+15wA/5CxSoeAdz4H+w4eZj+dvn69PXI4ZV
         Ospu2NYid40pTmmjjY9UlrRQcAVQeZ2fA+06i2EBagm3hifVMbtOdodHDTvqno4N0GTY
         qKMg==
X-Gm-Message-State: ABy/qLYgupdnV9Iky2yPtIC83Y9rwIVsu6wMt1w2gVI6EgCVVJEE5n1d
	FAR3maEQdotYxHFPd1uP+g6x/XS/8GLiFyMmG1w=
X-Google-Smtp-Source: APBJJlGQF8nd28HuyOFKTbn0/08mV4FKjXkPsf3cZAb2vIG5DGe/eUhrYCZ+egJ9ZHatQSR14LcFQg==
X-Received: by 2002:a0c:e645:0:b0:635:f89a:1d7b with SMTP id c5-20020a0ce645000000b00635f89a1d7bmr294145qvn.47.1689950585986;
        Fri, 21 Jul 2023 07:43:05 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id a23-20020a0ca997000000b006261e6a88c7sm1332296qvb.36.2023.07.21.07.43.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 07:43:05 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v2] python3-dtc: add from meta-virtualization
Date: Fri, 21 Jul 2023 10:43:04 -0400
Message-ID: <20230721144304.3404010-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 14:43:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184702

This provides pylibfdt, which is a runtime dependency for the dtschema
module that we already carry in oe-core.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
v2 adds maintainer info to maintainers.inc.

 meta/conf/distro/include/maintainers.inc      |   1 +
 ...erlay-make-overlay_get_target-public.patch | 132 ++++++++++++++++++
 .../python/python3-dtc_1.6.1.bb               |  26 ++++
 3 files changed, 159 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-dtc/0001-Revert-libfdt-overlay-make-overlay_get_target-public.patch
 create mode 100644 meta/recipes-devtools/python/python3-dtc_1.6.1.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 6e82e943fa..17f038c71e 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -614,6 +614,7 @@ RECIPE_MAINTAINER:pn-python3-cython = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-python3-dbus = "Zang Ruochen <zangruochen@loongson.cn>"
 RECIPE_MAINTAINER:pn-python3-dbusmock = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-python3-docutils = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-python3-dtc = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-dtschema = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-dtschema-wrapper = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-editables = "Ross Burton <ross.burton@arm.com>"
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


