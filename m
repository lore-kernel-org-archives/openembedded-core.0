Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FF7BCA5FC4
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 08:17:13 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8574.1790756229736837934
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 01:17:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=2SVYu+vB;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0FA481A107C
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:17:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D80FC60749
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:17:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 98746103298BE;
	Wed, 30 Sep 2026 10:17:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790756227; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SKBpLuZUrj9gHZHx9EebdL0UVpBhgTZiCTX2ChZY/Q0=;
	b=2SVYu+vBTPTM2msudEmQFXk8yN7iIxJcYubLqZnY83LA5njPF4JBl6QVUEFLr0UYrZuEO9
	LVAGix+uknNt7iBhXkotKxawohFcDRC3mT43zf20NELVXHQQTSYxP9V65P31wNyuyauerQ
	yIVlS1E2t3l7LaAZlKeOVe5b9cnuTBijJdCCFPubIcZqcySCxUZfaPuutSXbDtQzgSSbRN
	tEwjIWGxWCy3CxV6RSIYemf1MCH6U3NGYND+edAKLqRH4Rs54hd/h/nfBMz7BwODz600Rf
	Nev5M6gFo/c4c7e3qlt1rH50Lws2AcWuKX7w8ZlbIuFJI2Z0EjPCHDMAYXtudQ==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 30 Sep 2026 10:16:48 +0200
Subject: [PATCH 23/24] igt-gpu-tools: upgrade 2.5 -> 2.6
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-mathieu-upgrades-2026-02-29-v1-23-102c38be04df@bootlin.com>
References: <20260930-mathieu-upgrades-2026-02-29-v1-0-102c38be04df@bootlin.com>
In-Reply-To: <20260930-mathieu-upgrades-2026-02-29-v1-0-102c38be04df@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790756204; l=5541;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=Uw+IeG1/GWT+mkkLbDXEXYifNCHXII6W61vbL/DMqLQ=;
 b=YLc0jLA6EnZe2f2sEO5p5AjFYtw/tUppkZgZfbpT0orzbz/EYXtJTda3aQQd2WAOzqCEpWTJF
 YwO848Np5jGAVaOSApq2gAiBIXbJ7y8fB9q8apc6ZNnDC50BQOC8EUY
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:17:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246947

Drop obsolete reproducibility fix, issue was fixed upstream:
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/573a2c9824ce7893a32b8ce6022d21d7b5434842

General changes:
- Removed xe_eudebug from meson.

Devops changes:
- Bumped Debian version to bookworm and Fedora to latest 44

Runner changes:
- New igt_runner option --save-results-after-each-test.

Library changes:
- Continued refactor of display library code.
- New platform filtering helpers for skipping tests without modifying
  test source code.
- Improved setting up the render and compute pipelines for Intel GPUs.

Test changes:
- Improved display testing during suspend.
- Added subtest for BACKGROUND_COLOR crtc property.
- New test for HDMI TMDS audio bandwidth constraints on Intel GPUs.
- Added subtest for Content Match Refresh Rate across both fixed and
  video timing display modes.
- New Xe page offline tests on Intel CRI GPUs.
- Added test coverage for FIXED_MATRIX colorops for CSC.
- Added GT reset submit stress subtest.
- New tests for SRIOV GGTT accesses by PF and VFs on Xe..
- Added FIXED_MATRIX colorop subtests.
- Added UHBR-to-HBR fallback subtest for UHBR-capable DP
  connectors.(Sowmiya S)
- Improved KMS tests on MediaTek.
- Added user fence no signal subtest for Intel Xe driver.
- Improved userptr stress test for amdgpu.
- Improved Xe OA testing.
- Improved FBC handling in display tests.
- Improved amdgpu reset tests.
- Added subtest to validate YUV420 with DC3CO.
- Ported dmabuf tests to KUnit.
- Added display feature discovery subtests for HDR, VRR and DSC.
- Added Panthor sparse VM_BIND tests.
- Extended BO tests to cover GEM_INFO and cache flags on MSM.
- New tests for PERFCNTR_CONFIG ioctl on MSM GPUs.
- New tests for PowerVR Imagination GPUs.

Tools changes:
- Fixed gputop on Panthor.
- Renamed AMD tool to igt_hdmi_compliance and improved it to work on
  Intel GPUs
- Improvements in amd_hdmi_compliance.
- Decreased number of dynamically linked libraries in many tools.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 ...uild-do-not-hardcode-the-build-directory-.patch | 46 ----------------------
 .../{igt-gpu-tools_2.5.bb => igt-gpu-tools_2.6.bb} |  3 +-
 2 files changed, 1 insertion(+), 48 deletions(-)

diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-meson.build-do-not-hardcode-the-build-directory-.patch b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-meson.build-do-not-hardcode-the-build-directory-.patch
deleted file mode 100644
index 3cf62632903c..000000000000
--- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools/0001-lib-meson.build-do-not-hardcode-the-build-directory-.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 5681532ed4e1b656219bf887bbeadbe3ee6d277d Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Thu, 18 Dec 2025 15:45:11 +0100
-Subject: [PATCH] lib/meson.build: do not hardcode the build directory into the
- installable library
-
-This breaks reproducibility, and is not otherwise appropriate, as the
-original directory may not exist. If there's a use case for referring to
-it, the location should be passed in with a command line switch or
-environment variable.
-
-imgdir is set elsewhere in meson.build to:
-
-imgdir = join_paths(build_root, 'data')
-
-and them IGT_IMGDIR is used thusly in lib/igt_core.h:
-
-/**
- * igt_fopen_data:
- * @filename: filename to open.
- *
- * Open a datafile for test, first try from installation directory,
- * then from build directory, and finally from current directory.
- */
-#define igt_fopen_data(filename) \
-        __igt_fopen_data(IGT_SRCDIR, IGT_DATADIR, IGT_IMGDIR, filename)
-
-Upstream-Status: Inappropriate [hack patching in a bogus dir; issue reported at https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/190]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- lib/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/meson.build b/lib/meson.build
-index d1289a5e0..a8c15be8e 100644
---- a/lib/meson.build
-+++ b/lib/meson.build
-@@ -309,7 +309,7 @@ foreach f: lib_sources
- 	    '-DIGT_DATADIR="@0@"'.format(join_paths(prefix, datadir)),
- 	    '-DIGT_SRCDIR="@0@"'.format(srcdir),
- 	    '-DIGT_LOG_DOMAIN="@0@"'.format(f.split('.')[0]),
--            '-DIGT_IMGDIR="@0@"'.format(imgdir),
-+            '-DIGT_IMGDIR="/this/is/a/bogus/dir"',
- 	])
- 
-     lib_intermediates += lib
diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.5.bb b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.6.bb
similarity index 93%
rename from meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.5.bb
rename to meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.6.bb
index f03bf4663048..d76c2355a1b2 100644
--- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.5.bb
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_2.6.bb
@@ -9,10 +9,9 @@ LICENSE = "MIT"
 
 inherit meson pkgconfig
 
-SRCREV = "a8e2cbd2854d7980a9eccecc6e0c801d0824b88f"
+SRCREV = "916c79cfb7675ca01607dcd821f8c49d4f633a6f"
 
 SRC_URI = "git://gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=https;branch=master;tag=v${PV} \
-           file://0001-lib-meson.build-do-not-hardcode-the-build-directory-.patch \
            "
 
 DEPENDS += "libdrm libpciaccess cairo udev glib-2.0 procps libunwind kmod openssl elfutils alsa-lib json-c bison-native pciutils jansson"

-- 
2.47.3


