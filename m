Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7B03C61DFD
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 09:04:26 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25549.1788167056768747343
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2026 02:04:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ToRSQgZU;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 127224E41464
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 09:04:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DCF9460231
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 09:04:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B007111C78A62;
	Mon, 31 Aug 2026 11:04:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788167054; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XUtTs19rAo4L7e0ibvU078QNnSmDIAJqnsPw8CvNm3o=;
	b=ToRSQgZU6Nl6IwIvK6Jx8dDtHGxEH5DjV+gLdUabcyH07/lpxcSIEfyuwRj1V4NY+5S+gb
	Bgdu5MIuf00HO+x+iphy9OhGCpC3LlqZu8pobNR8Pj1Hni9HPxCJx+DVS1vVofgVET4BUA
	BPY3ieklPmG4Zz8jkxqnFrgFZ+ZuV3tQ5UCVwsxJWGXS6R2+9TO9dALnKHTUJOetfC40+y
	tTkRAQyW60l3vdEb6vU/HDYcPSt4lkjHmE2N6yUelW03csmSG+2hnHWPSoZV7LcP/9TTLn
	mUXmJuxQbZjGifxEtjTgJs6ZqIaiulxVjiDhH4RRJGZEn8yHKlNfoQM/f93p6w==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Mon, 31 Aug 2026 11:03:35 +0200
Subject: [PATCH 3/9] appstream: upgrade 1.1.6 -> 1.2.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-mathieu-updates-2026-08-31-v1-3-58b54db72860@bootlin.com>
References: <20260831-mathieu-updates-2026-08-31-v1-0-58b54db72860@bootlin.com>
In-Reply-To: <20260831-mathieu-updates-2026-08-31-v1-0-58b54db72860@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788167050; l=7039;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=pP7qiNSSFuOPYceSWNW3n2Tnd8333GdQqVvHOePXxlU=;
 b=i+0uQ4KpsjtCYdc6pLcALdPv7hozuUvYF4fQHFcW/EHDrGk6FFwu6WU38f+SrWXmgj2HHmb4R
 +OigMYy7hcNCCoa8oJTXPdhj4p+JOC4Tu49KQoR8ABBhOJNjgF69mAH
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2026 09:04:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244745

Source: NEWS

Version 1.2.0
~~~~~~~~~~~~~
Released: 2026-08-28

Notes:
 * This release marks the libappstream-compose API as stable.

 * This release introduces a new, lightly sandboxed (on Linux) media worker for appstream-compose
   and switches to VIPS for image processing. Please report any issues you may find! The sandbox
   can be disabled by setting `ASC_NO_SANDBOX=1` in the environment.
   The image formats XPM, TIFF and BMP will no longer be read by Compose, and will be rejected
   unconditionally.

 * This release introduces <heading>My headline!</heading> markup for AppStream descriptions.
   Older versions will remove this markup, so only use it if your target clients have a recent
   version of AppStream.

Features:
 * compose: Create AscMedia for isolated out-of-process media handling using asc-mediaworker
 * compose: Process images, fonts & videos via the media worker
 * Generalize path segment validation, use it in the compose media worker
 * compose: Switch from using GdkPixbuf to VIPS for image processing
 * compose: Harmonize supported formats, don't read XPM/TIFF/BMP
 * compose: Make JPEG-XL the default image output format
 * compose: Implement basic support for FreeBSD
 * compose: Rely on VIPS for SVG support, drop our dedicated librsvg path
 * compose: Make image-targets and image batch-processing public API
 * compose: Expose the source-icon convention and a hint-tag lookup as public API
 * compose: Drop unstable-API marker
 * compose: Don't create image thumbnails that aren't a substantially smaller
 * compose: Only transfer pre-opened fds and no more directory fd to the worker
 * compose: Implement a basic sandbox for the mediaworker using Landlock
 * compose: Use RESTRICT_SELF_TSYNC and block UDP access on newer Landlock
 * compose: Mix the output image format type into the GCID
 * compose: Make AscUnit a proper abstract class
 * compose: Improve API documentation
 * Always sanitize whitespaces in keywords and drop empty ones
 * Assume a language element without percentage means full translation
 * news-to-metainfo: Support a details URL in the YAML variant
 * news-convert: Support inline Markdown in news text
 * news-convert: Support headers in XML<->YAML/NEWS/Markdown conversions
 * ascli: news-convert: Support standalone release XML as source/target
 * Whitespace-sanitize all description markup we read
 * Output descriptions as literals in YAML and wrap markup ourselves

Specification:
 * docs: Document the appstreamcli news file conversion helper
 * Implement support for headings in description markup

Bugfixes:
 * meson: Set _POSIX_C_SOURCE on Linux only
 * compose: Fix a race where units were deleting each other's icon directories
 * compose: Fix documentation and introspection annotation issues
 * compose: Drop dead public API, make some API private
 * compose: Sharpen with libvips instead of a hand-rolled unsharp mask
 * compose: Only read AVIF from HEIF containers, never HEIC
 * compose: Fix double-free crash wh

[Changelog truncated as it exceeds 3000 characters;
the full changelog can be found in an attachment to the AUH email]

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../appstream/appstream/0001-remove-hardcoded-path.patch            | 6 +++---
 .../appstream/appstream/0002-Do-not-build-qt-tests.patch            | 2 +-
 .../0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch | 2 +-
 .../appstream/{appstream_1.1.6.bb => appstream_1.2.0.bb}            | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch b/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
index 9d1ff639c0f8..d0cb5cf6f495 100644
--- a/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
+++ b/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.patch
@@ -1,4 +1,4 @@
-From 75c550f2f88d990fdb18b6118ca052af732a11b2 Mon Sep 17 00:00:00 2001
+From 0a532ef29855599e4761923bb38069e98d78e25f Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Mon, 12 Dec 2022 15:42:42 +0100
 Subject: [PATCH] remove hardcoded path
@@ -14,10 +14,10 @@ Upstream-Status: Inappropriate [oe-specific]
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 24d1069..14fffff 100644
+index 004dce3..cefb852 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -230,10 +230,10 @@ endif
+@@ -229,10 +229,10 @@ endif
  stemmer_inc_dirs = include_directories()
  if get_option('stemming')
      stemmer_lib = cc.find_library('stemmer', required: true)
diff --git a/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch b/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch
index c9d544f3fcc7..861d9552a50e 100644
--- a/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch
+++ b/meta/recipes-support/appstream/appstream/0002-Do-not-build-qt-tests.patch
@@ -1,4 +1,4 @@
-From 6b50c15e350f80e805816f1c2ae2abe97cef6312 Mon Sep 17 00:00:00 2001
+From 0d387b6cb8907dd377212de187fbe749b40eedb4 Mon Sep 17 00:00:00 2001
 From: Marc Ferland <marc.ferland@sonatest.com>
 Date: Fri, 26 Jul 2024 15:41:00 -0400
 Subject: [PATCH] Do not build qt/tests
diff --git a/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch b/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch
index 185dd507b319..9f06f789162e 100644
--- a/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch
+++ b/meta/recipes-support/appstream/appstream/0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch
@@ -1,4 +1,4 @@
-From f7a125e90f99a997652fceb07263517df0f1ecc6 Mon Sep 17 00:00:00 2001
+From 2c0758a84741e6e91cfd1ba70e9017ba4e76143a Mon Sep 17 00:00:00 2001
 From: Marc Ferland <marc.ferland@sonatest.com>
 Date: Mon, 29 Jul 2024 09:35:51 -0400
 Subject: [PATCH] Fix PACKAGE_PREFIX_DIR in qt/cmake/AppStreamQtConfig.cmake.in
diff --git a/meta/recipes-support/appstream/appstream_1.1.6.bb b/meta/recipes-support/appstream/appstream_1.2.0.bb
similarity index 95%
rename from meta/recipes-support/appstream/appstream_1.1.6.bb
rename to meta/recipes-support/appstream/appstream_1.2.0.bb
index 723c74000655..4a1c23e760fd 100644
--- a/meta/recipes-support/appstream/appstream_1.1.6.bb
+++ b/meta/recipes-support/appstream/appstream_1.2.0.bb
@@ -24,7 +24,7 @@ SRC_URI = " \
 	file://0002-Do-not-build-qt-tests.patch \
 	file://0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch \
 "
-SRC_URI[sha256sum] = "e298929f39729e84a70f6be6941f3e7f3fc2ee3c83cb3ea1b1b5b280a8fe3a24"
+SRC_URI[sha256sum] = "901919378910550271feb2d826034c9af6522f3ad218de04d3d6d35ddba5cb45"
 
 S = "${UNPACKDIR}/AppStream-${PV}"
 

-- 
2.47.3


