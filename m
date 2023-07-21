Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A032C04FE1
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 14:16:00 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.8235.1689948957929163264
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jul 2023 07:15:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PHydwNq6;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9520124000A;
	Fri, 21 Jul 2023 14:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689948956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4ucPZQ0ydJ1zHrLwA5FhR7RXvjrgavniWRWKfQNcIV4=;
	b=PHydwNq63J63P8lf0c1D+SZ42sUStnYNzaPpYZlJXxicosFlYBB74wqVzRCQ/7pG5Iu2kY
	GF5R7Q/RHF0uZjoCL/6LlBQAqO/scUr45XNQBcuvfrtKjz8JZvuFtSId+aquOzKhdQX/0b
	LXsbsFEkVVYFcF64ayggEvZu//Qp0j4Ne0c0lMNBoS9UDylBwbYt0urTLTftS1diI6/HkR
	ooFnDJTM32yXInGdjQ4VDKAmBbeQCkgke6DLA+Vo60tLyeumM3YPLSXBpKRGd8SgrXPTMB
	gVC09+zcA9U81ZLY4KWZjnqnqg7nG1+1nJj6BlkkuyWe6WyMnzebRcxunYHehw==
Date: Fri, 21 Jul 2023 16:15:55 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH 2/3] python3-dtc: add from meta-virtualization
Message-ID: <202307211415555bb24012@mail.local>
References: <20230717164124.1026028-1-tgamblin@baylibre.com>
 <20230717164124.1026028-2-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230717164124.1026028-2-tgamblin@baylibre.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 14:16:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184695

The following recipes do not have a maintainer assigned to them. Please add an entry to meta/conf/distro/include/maintainers.inc file.
python3-dtc (/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/recipes-devtools/python/python3-dtc_1.6.1.bb)

;)

On 17/07/2023 12:41:23-0400, Trevor Gamblin wrote:
> This provides pylibfdt, which is a runtime dependency for the dtschema
> module that we already carry in oe-core.
> 
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>  ...erlay-make-overlay_get_target-public.patch | 132 ++++++++++++++++++
>  .../python/python3-dtc_1.6.1.bb               |  26 ++++
>  2 files changed, 158 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-dtc/0001-Revert-libfdt-overlay-make-overlay_get_target-public.patch
>  create mode 100644 meta/recipes-devtools/python/python3-dtc_1.6.1.bb
> 
> diff --git a/meta/recipes-devtools/python/python3-dtc/0001-Revert-libfdt-overlay-make-overlay_get_target-public.patch b/meta/recipes-devtools/python/python3-dtc/0001-Revert-libfdt-overlay-make-overlay_get_target-public.patch
> new file mode 100644
> index 0000000000..a2df482e3a
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-dtc/0001-Revert-libfdt-overlay-make-overlay_get_target-public.patch
> @@ -0,0 +1,132 @@
> +From 4d4703e0199fb3556c37694e4d951785abca22fd Mon Sep 17 00:00:00 2001
> +From: Bruce Ashfield <bruce.ashfield@gmail.com>
> +Date: Wed, 19 Jan 2022 12:46:42 -0500
> +Subject: [PATCH] Revert "libfdt: overlay: make overlay_get_target() public"
> +
> +This reverts commit 45f3d1a095dd3440578d5c6313eba555a791f3fb.
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +---
> + libfdt/fdt_overlay.c | 29 ++++++++++++++++++++++-------
> + libfdt/libfdt.h      | 18 ------------------
> + libfdt/version.lds   |  1 -
> + 3 files changed, 22 insertions(+), 26 deletions(-)
> +
> +diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
> +index 5c0c398..d217e79 100644
> +--- a/libfdt/fdt_overlay.c
> ++++ b/libfdt/fdt_overlay.c
> +@@ -40,22 +40,37 @@ static uint32_t overlay_get_target_phandle(const void *fdto, int fragment)
> + 	return fdt32_to_cpu(*val);
> + }
> + 
> +-int fdt_overlay_target_offset(const void *fdt, const void *fdto,
> +-			      int fragment_offset, char const **pathp)
> ++/**
> ++ * overlay_get_target - retrieves the offset of a fragment's target
> ++ * @fdt: Base device tree blob
> ++ * @fdto: Device tree overlay blob
> ++ * @fragment: node offset of the fragment in the overlay
> ++ * @pathp: pointer which receives the path of the target (or NULL)
> ++ *
> ++ * overlay_get_target() retrieves the target offset in the base
> ++ * device tree of a fragment, no matter how the actual targeting is
> ++ * done (through a phandle or a path)
> ++ *
> ++ * returns:
> ++ *      the targeted node offset in the base device tree
> ++ *      Negative error code on error
> ++ */
> ++static int overlay_get_target(const void *fdt, const void *fdto,
> ++			      int fragment, char const **pathp)
> + {
> + 	uint32_t phandle;
> + 	const char *path = NULL;
> + 	int path_len = 0, ret;
> + 
> + 	/* Try first to do a phandle based lookup */
> +-	phandle = overlay_get_target_phandle(fdto, fragment_offset);
> ++	phandle = overlay_get_target_phandle(fdto, fragment);
> + 	if (phandle == (uint32_t)-1)
> + 		return -FDT_ERR_BADPHANDLE;
> + 
> + 	/* no phandle, try path */
> + 	if (!phandle) {
> + 		/* And then a path based lookup */
> +-		path = fdt_getprop(fdto, fragment_offset, "target-path", &path_len);
> ++		path = fdt_getprop(fdto, fragment, "target-path", &path_len);
> + 		if (path)
> + 			ret = fdt_path_offset(fdt, path);
> + 		else
> +@@ -621,7 +636,7 @@ static int overlay_merge(void *fdt, void *fdto)
> + 		if (overlay < 0)
> + 			return overlay;
> + 
> +-		target = fdt_overlay_target_offset(fdt, fdto, fragment, NULL);
> ++		target = overlay_get_target(fdt, fdto, fragment, NULL);
> + 		if (target < 0)
> + 			return target;
> + 
> +@@ -764,7 +779,7 @@ static int overlay_symbol_update(void *fdt, void *fdto)
> + 			return -FDT_ERR_BADOVERLAY;
> + 
> + 		/* get the target of the fragment */
> +-		ret = fdt_overlay_target_offset(fdt, fdto, fragment, &target_path);
> ++		ret = overlay_get_target(fdt, fdto, fragment, &target_path);
> + 		if (ret < 0)
> + 			return ret;
> + 		target = ret;
> +@@ -786,7 +801,7 @@ static int overlay_symbol_update(void *fdt, void *fdto)
> + 
> + 		if (!target_path) {
> + 			/* again in case setprop_placeholder changed it */
> +-			ret = fdt_overlay_target_offset(fdt, fdto, fragment, &target_path);
> ++			ret = overlay_get_target(fdt, fdto, fragment, &target_path);
> + 			if (ret < 0)
> + 				return ret;
> + 			target = ret;
> +diff --git a/libfdt/libfdt.h b/libfdt/libfdt.h
> +index a7f432c..7f117e8 100644
> +--- a/libfdt/libfdt.h
> ++++ b/libfdt/libfdt.h
> +@@ -2116,24 +2116,6 @@ int fdt_del_node(void *fdt, int nodeoffset);
> +  */
> + int fdt_overlay_apply(void *fdt, void *fdto);
> + 
> +-/**
> +- * fdt_overlay_target_offset - retrieves the offset of a fragment's target
> +- * @fdt: Base device tree blob
> +- * @fdto: Device tree overlay blob
> +- * @fragment_offset: node offset of the fragment in the overlay
> +- * @pathp: pointer which receives the path of the target (or NULL)
> +- *
> +- * fdt_overlay_target_offset() retrieves the target offset in the base
> +- * device tree of a fragment, no matter how the actual targeting is
> +- * done (through a phandle or a path)
> +- *
> +- * returns:
> +- *      the targeted node offset in the base device tree
> +- *      Negative error code on error
> +- */
> +-int fdt_overlay_target_offset(const void *fdt, const void *fdto,
> +-			      int fragment_offset, char const **pathp);
> +-
> + /**********************************************************************/
> + /* Debugging / informational functions                                */
> + /**********************************************************************/
> +diff --git a/libfdt/version.lds b/libfdt/version.lds
> +index cbce5d4..7ab85f1 100644
> +--- a/libfdt/version.lds
> ++++ b/libfdt/version.lds
> +@@ -77,7 +77,6 @@ LIBFDT_1.2 {
> + 		fdt_appendprop_addrrange;
> + 		fdt_setprop_inplace_namelen_partial;
> + 		fdt_create_with_flags;
> +-		fdt_overlay_target_offset;
> + 	local:
> + 		*;
> + };
> +-- 
> +2.19.1
> +
> diff --git a/meta/recipes-devtools/python/python3-dtc_1.6.1.bb b/meta/recipes-devtools/python/python3-dtc_1.6.1.bb
> new file mode 100644
> index 0000000000..a868bd0109
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-dtc_1.6.1.bb
> @@ -0,0 +1,26 @@
> +SUMMARY = "Python Library for the Device Tree Compiler"
> +HOMEPAGE = "https://devicetree.org/"
> +DESCRIPTION = "A python library for the Device Tree Compiler, a tool used to manipulate Device Tree files which contain a data structure for describing hardware."
> +SECTION = "bootloader"
> +LICENSE = "GPL-2.0-only | BSD-2-Clause"
> +
> +DEPENDS = "flex-native bison-native swig-native python3-setuptools-scm-native libyaml dtc"
> +
> +SRC_URI = "git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=master \
> +           file://0001-Revert-libfdt-overlay-make-overlay_get_target-public.patch \
> +          "
> +
> +UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
> +
> +LIC_FILES_CHKSUM = "file://pylibfdt/libfdt.i;beginline=1;endline=6;md5=afda088c974174a29108c8d80b5dce90"
> +
> +SRCREV = "c001fc01a43e7a06447c06ea3d50bd60641322b8"
> +
> +PV = "1.6.1+git${SRCPV}"
> +S = "${WORKDIR}/git"
> +
> +PYPA_WHEEL = "${S}/dist/libfdt-1.6.2*.whl"
> +
> +inherit setuptools3 pkgconfig
> +
> +BBCLASSEXTEND = "native nativesdk"
> -- 
> 2.41.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184477): https://lists.openembedded.org/g/openembedded-core/message/184477
> Mute This Topic: https://lists.openembedded.org/mt/100198619/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

