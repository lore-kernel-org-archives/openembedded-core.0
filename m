Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84594C9830B
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 18:18:09 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1991.1790187487533326996
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 11:18:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=TGm8TLPN;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-202609231739076801e076490002072c-6kior0@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202609231739076801e076490002072c
        for <openembedded-core@lists.openembedded.org>;
        Wed, 23 Sep 2026 19:39:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=yVmbp62fMTgA5lo/tj1+ebGsewtODdU1dDcUKeSge/U=;
 b=TGm8TLPNqzfqQ4SP1xyeNjCqVj5Lc2A/UIL02k/+qjNHCuJ06ggY0KqdaYcoH/yjlT4/xE
 GQwx49zwScWYHgIZsAe/HR5l/kKN6pnYDVgnyshu7epEHUAvVC4lqHU92wjgFwzYKooke183
 9IcVkmoTl8OlWEs+BrVbYCQktZbisLt8sw3c2HPCCyDQMkg9GTdVDN5+3Cs/AxmUDiJfCB2l
 PVf2WyKAqDBYWN+r/GfBSMh6piZBrTu8j5817vW9uBWcUHRhq28Fq5/cY8sc6IxxAXqqgCBR
 5qFafic9+0lJn70GoOBeazigjtqNWuIOCt/a2PRxbYJRwC5mflh85nAw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH] u-boot-tools: use all patches from u-boot
Date: Wed, 23 Sep 2026 19:38:50 +0200
Message-ID: <20260923173850.21338-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 18:18:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246535

From: Peter Marko <peter.marko@siemens.com>

After sharing CVE_PRODUCT between u-boot and u-boot-tools CVEs
patched in u-boot showed-up in CVE reports for u-boot-tools.

It does not make much sense to share git repository but not share all
patches on top of it, so move adding all patches from u-boot recipe to a
common include file where also the git repository is defined.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc       | 10 ++++++++++
 meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb |  2 --
 meta/recipes-bsp/u-boot/u-boot_2024.01.bb       | 12 ------------
 3 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 27e6ac9db5b..6d388fadedc 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -18,6 +18,16 @@ SRCREV = "866ca972d6c3cabeaf6dbac431e8e08bb30b3c8e"
 
 SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master \
            file://CVE-2025-24857.patch \
+           file://CVE-2024-57254.patch \
+           file://CVE-2024-57255.patch \
+           file://CVE-2024-57256.patch \
+           file://CVE-2024-57257.patch \
+           file://CVE-2024-57258-1.patch \
+           file://CVE-2024-57258-2.patch \
+           file://CVE-2024-57258-3.patch \
+           file://CVE-2024-57259.patch \
+           file://CVE-2024-42040.patch \
+           file://CVE-2026-46728.patch \
 "
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
index 4b6d89ed4e1..7eaf721ca83 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
@@ -1,4 +1,2 @@
 require u-boot-common.inc
 require u-boot-tools.inc
-
-SRC_URI += "file://CVE-2026-46728.patch"
diff --git a/meta/recipes-bsp/u-boot/u-boot_2024.01.bb b/meta/recipes-bsp/u-boot/u-boot_2024.01.bb
index 7eaeed1004b..945398c90e4 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2024.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2024.01.bb
@@ -2,15 +2,3 @@ require u-boot-common.inc
 require u-boot.inc
 
 DEPENDS += "bc-native dtc-native python3-pyelftools-native"
-
-SRC_URI += "file://CVE-2024-57254.patch \
-            file://CVE-2024-57255.patch \
-            file://CVE-2024-57256.patch \
-            file://CVE-2024-57257.patch \
-            file://CVE-2024-57258-1.patch \
-            file://CVE-2024-57258-2.patch \
-            file://CVE-2024-57258-3.patch \
-            file://CVE-2024-57259.patch \
-            file://CVE-2024-42040.patch \
-            file://CVE-2026-46728.patch \
-"

