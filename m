Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CF27E77170
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 09:33:42 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.6553.1733391213733314222
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Dec 2024 01:33:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=f6PrR9KC;
 spf=pass (domain: linaro.org, ip: 209.85.208.170, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ffc3f2b3a9so6057871fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 01:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733391212; x=1733996012; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mYuI1sjLO1UiypYkv5GHGWK1zKA9XBIznLe5yAqL0AQ=;
        b=f6PrR9KCVV2guHEoyuunCSZRyoaZyJFYcrCCfYlKFY31lInu/bmopmTmTxmAthfcpn
         BDh7EA3yrFHZhJErUCXosl93NzKwkFKFfh8AvHKsG0IDRh1MgPIuxn6PEY5/iiLRFgXw
         MbZbbKbsnU1STPxeq3kXV2/VTmnyiLFgRE2TPVPcXkWq8rHhqP4r4C4XczLSmqa3z90R
         3BVHavFiYHaJqi//0ah8K4CQ//1aGlQNodaxgZcZWeeuH2df729RFEK5zWCDDcDXQ1ZA
         yi1CedHRUVG2dbMYYjIae99gMEAjVJqigKBNnYjxOK1SEZMkwb0pkT+P7mwwqeetMFN6
         ZWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733391212; x=1733996012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mYuI1sjLO1UiypYkv5GHGWK1zKA9XBIznLe5yAqL0AQ=;
        b=jG3Q4br0GHN0z6CPj8lLqB7bZCWyaDy/njeALDvGwhqAeYvFtKVxF3Z/1M9mcmpzaL
         OoOHiR8Y5jvJdUedH5q8mXU7WgU4pxgpqieWROP9xpw+0xphG1fRBsZKPBLNoUEDnzk7
         D9vRsjSdYY2vk48bRNfz1mMmppfrNOHoLWmtRC5l0tBqFI3jEzmTeez4y+zIGyNFTdt5
         DQF1uh8j5xrwsVGzM324GXRC/vZ8Rfls9bqWxFw8KsugLINLYMiZTqkEgKPIEY4GbQ0N
         RzndaFmAqRn5j2kJhsoOJtb7RHnNglQQT/OCdRnjU4gtGBXsvgTTBmy91zqHuEz+Sznr
         T/1Q==
X-Gm-Message-State: AOJu0Ywf6DvhFOTSYAggZAEbEntMrd4ZS02BKfa0OdqxwjjDfiOm+XHR
	/eoYmxgzrYy+R8A9N/62sQ1m0dM5LQMFYq9gf8W7Hf7o3R1yDo6/2r+hy3Zpjny66V0GzdSZmxY
	5
X-Gm-Gg: ASbGncsRvASDNT+FySvsujnNKIavpgzgHe6AOq675RU+Xb7Qmaq0zI5vTG1HTq4EDE2
	94GHCgPxoj27SULUdOUreYbHPhdwbnmpgtFLD31zuGC9Rj3Z4+jmwX+Ceg2NU6Io4KkXCr0wKoc
	+TtQ9UO2Yb2k2vosUhxW6YtpnxcxA/HFacKT//Khn8nQqBzo6OJ6BkLKR1PJgb3qbrRpWBcUIcW
	YWDZ6ZWexgOUqJGOyBDUyA7bsu5EXuY4MOagf60w4rr8xHgsRr5BQb0HlPrB9dEjT/wgf0D68Ti
	4ROgXpx/7b/v4vKPZcMZ8RE=
X-Google-Smtp-Source: AGHT+IGIIXKRKIRozE670cDGt1Q3lrRnD6ln5kisWsIj1XZOkSQKqMB6yc971Ijq/HqfeRPrsZW5MA==
X-Received: by 2002:a05:651c:98f:b0:2ff:a3c0:a87a with SMTP id 38308e7fff4ca-30009ce0ba1mr88887581fa.28.1733391211782;
        Thu, 05 Dec 2024 01:33:31 -0800 (PST)
Received: from localhost.localdomain (2001-14ba-490-c700--133.rev.dnainternet.fi. [2001:14ba:490:c700::133])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30020e5750dsm1648961fa.101.2024.12.05.01.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 01:33:29 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 2/3] python3-dtc: update from 1.7.0 to 1.7.2
Date: Thu,  5 Dec 2024 11:32:36 +0200
Message-ID: <20241205093237.333818-3-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241205093237.333818-1-mikko.rapeli@linaro.org>
References: <20241205093237.333818-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 09:33:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208368

To fix compatibility with new swig version. Changes:

https://github.com/dgibson/dtc/releases/tag/v1.7.2

Changes since v1.7.1 include:
 * Build
   - Fix automatic dependency handling for paths with spaces in them
   - Fix to allow compilation with swig 4.3.0
   - Disable pointless warnings on swig generated code
 * fdtoverlay
   - Improve error message with missing /__symbols__

https://github.com/dgibson/dtc/releases/tag/v1.7.1

Changes sinve v1.7.0 include:
 * dtc
   * Fix check for 10-bit I2C addresses
   * Improve documentation of -@ option
   * Update to libyaml >= 0.2.3
   * Improvements & fixes for device graph checks
   * Add -L / --local-fixups option
   * Add check for length of interrupt-map properties
 * libfdt
   * Add fdt_path_getprop_namelen()
   * Add fdt_get_symbol() and fdt_get_symbol_namelen()
   * Correct documentation of fdt_path_offset()
   * Correct documentation of fdt_appendprop_addrrange()
   * Validate aliases is fdt_get_alias_namelen()
   * Don't overwrite phandles when applying overlays
   * Require Python 3
 * pylibfdt
   * Support boolean properties
   * Fixes for current Python versions
 * General
   * Assorted bugfixes
   * Assorted build improvements
   * Assorted typo fixes in docs
   * Some additional testcases
   * Move to GitHub Actions based CI

Drop revert patch. Will align dtc version with separate commit.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 ...erlay-make-overlay_get_target-public.patch | 132 ------------------
 ...hon3-dtc_1.7.0.bb => python3-dtc_1.7.2.bb} |   5 +-
 2 files changed, 2 insertions(+), 135 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-dtc/0001-Revert-libfdt-overlay-make-overlay_get_target-public.patch
 rename meta/recipes-devtools/python/{python3-dtc_1.7.0.bb => python3-dtc_1.7.2.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-dtc/0001-Revert-libfdt-overlay-make-overlay_get_target-public.patch b/meta/recipes-devtools/python/python3-dtc/0001-Revert-libfdt-overlay-make-overlay_get_target-public.patch
deleted file mode 100644
index a2df482e3a..0000000000
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
similarity index 84%
rename from meta/recipes-devtools/python/python3-dtc_1.7.0.bb
rename to meta/recipes-devtools/python/python3-dtc_1.7.2.bb
index 85e48d4694..c301c9550f 100644
--- a/meta/recipes-devtools/python/python3-dtc_1.7.0.bb
+++ b/meta/recipes-devtools/python/python3-dtc_1.7.2.bb
@@ -6,15 +6,14 @@ LICENSE = "GPL-2.0-only | BSD-2-Clause"
 
 DEPENDS = "flex-native bison-native swig-native python3-setuptools-scm-native libyaml dtc"
 
-SRC_URI = "git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=master \
-           file://0001-Revert-libfdt-overlay-make-overlay_get_target-public.patch \
+SRC_URI = "git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=main \
           "
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 LIC_FILES_CHKSUM = "file://pylibfdt/libfdt.i;beginline=1;endline=6;md5=afda088c974174a29108c8d80b5dce90"
 
-SRCREV = "039a99414e778332d8f9c04cbd3072e1dcc62798"
+SRCREV = "2d10aa2afe35527728db30b35ec491ecb6959e5c"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


