Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D3C0CA5FE4
	for <webhook@archiver.kernel.org>; Sat,  3 Oct 2026 19:49:48 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11922.1791056985971552511
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Oct 2026 12:49:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Bu4Rmg4B;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20261003194942377a49846500020743-lwxccn@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20261003194942377a49846500020743
        for <openembedded-core@lists.openembedded.org>;
        Sat, 03 Oct 2026 21:49:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=NUKaUifIG4RVsq7/bpYeq4jxqOZ2ClnYd8Xvv8aULmc=;
 b=Bu4Rmg4BQKctqBqI1IlSd+E9RiG8I4fMZHsF6vUHS1WMv/14KK/4dWcbBjNRq4wUmtJXPX
 013wTzf89H9GgjY6crKDEBt8BoTtE1x93H7zWgAUBrItMFbS/KOpeNzI0NS/f2QQdJZAcKGT
 RNdKTyXOqAI/o9Jmdae3+NCL4Ap1QAs8733uIpJ24hhN2TjgVFABLA2m6opVyMSc1PCsAZH0
 3mn2sWCjiGdbdkGk55eaJ48ktjgldvld06ydayPEg+FSS5RYnEKtxokD4Wz7Mgavqb1uEhJo
 RcG0sHgCcp9ZqVEb65M0ZETF2/Z1BQmIeX0uqJ6mTBd4EhhVCw6ZSxGw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH] systemd: patch CVE-2026-4105
Date: Sat,  3 Oct 2026 21:49:26 +0200
Message-ID: <20261003194926.1818550-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Oct 2026 19:49:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247173

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

machine-varlink.c is not yet present in v255, so drop that hunk.
Same resolution is also done by Debian in [2] for v252.

[1] https://security-tracker.debian.org/tracker/CVE-2026-4105
[2] https://sources.debian.org/src/systemd/252.39-1~deb12u2/debian/patches/CVE-2026-4105.patch

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/images/core-image-ptest.bb  |  2 +-
 .../systemd/systemd/CVE-2026-4105.patch       | 32 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_255.22.bb   |  1 +
 3 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2026-4105.patch

diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-core/images/core-image-ptest.bb
index 72081f938de..024c69e9fda 100644
--- a/meta/recipes-core/images/core-image-ptest.bb
+++ b/meta/recipes-core/images/core-image-ptest.bb
@@ -36,7 +36,7 @@ QB_MEM:virtclass-mcextend-python3-cryptography = "-m 5100"
 TEST_SUITES = "ping ssh parselogs ptest"
 
 # Sadly at the moment the full set of ptests is not robust enough and sporadically fails in random places
-PTEST_EXPECT_FAILURE = "1"
+#PTEST_EXPECT_FAILURE = "1"
 
 python () {
     if not d.getVar("MCNAME"):
diff --git a/meta/recipes-core/systemd/systemd/CVE-2026-4105.patch b/meta/recipes-core/systemd/systemd/CVE-2026-4105.patch
new file mode 100644
index 00000000000..5b5c8e621e8
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2026-4105.patch
@@ -0,0 +1,32 @@
+From 6941d92dc299667036cbe264435971cec59ebc76 Mon Sep 17 00:00:00 2001
+From: Luca Boccassi <luca.boccassi@gmail.com>
+Date: Sun, 8 Mar 2026 14:30:52 +0000
+Subject: [PATCH] machined: reject invalid class types when registering
+ machines
+
+Follow-up for fbe550738d03b178bb004a1390e74115e904118a
+
+(cherry picked from commit 6df5f80bd374be1b45c52d740e88f0236da922c7)
+(cherry picked from commit 497d0172416cbb5b70f96b95399d041407c223bd)
+(cherry picked from commit 749e2eaf7086c91598cf7043a31919854b1c2dfe)
+
+CVE: CVE-2026-4105
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/6941d92dc299667036cbe264435971cec59ebc76]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/machine/machined-dbus.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/machine/machined-dbus.c b/src/machine/machined-dbus.c
+index f4915f67da..3565836dc8 100644
+--- a/src/machine/machined-dbus.c
++++ b/src/machine/machined-dbus.c
+@@ -271,7 +271,7 @@ static int method_create_or_register_machine(Manager *manager, sd_bus_message *m
+                 c = _MACHINE_CLASS_INVALID;
+         else {
+                 c = machine_class_from_string(class);
+-                if (c < 0)
++                if (c < 0 || !IN_SET(c, MACHINE_CONTAINER, MACHINE_VM))
+                         return sd_bus_error_set(error, SD_BUS_ERROR_INVALID_ARGS, "Invalid machine class parameter");
+         }
+ 
diff --git a/meta/recipes-core/systemd/systemd_255.22.bb b/meta/recipes-core/systemd/systemd_255.22.bb
index e5a0fd91700..3c5e59542bf 100644
--- a/meta/recipes-core/systemd/systemd_255.22.bb
+++ b/meta/recipes-core/systemd/systemd_255.22.bb
@@ -37,6 +37,7 @@ SRC_URI += " \
            file://CVE-2026-29111-02.patch \
            file://CVE-2026-29111-03.patch \
            file://CVE-2026-29111-04.patch \
+           file://CVE-2026-4105.patch \
            "
 
 # patches needed by musl

