Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 106A4D58D7E
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 18:38:26 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.26302.1732559897479263339
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 10:38:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=VR5y1/9y;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20241125183814d65976ae0ccecdb915-gjzpel@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20241125183814d65976ae0ccecdb915
        for <openembedded-core@lists.openembedded.org>;
        Mon, 25 Nov 2024 19:38:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=b+kkzVUBLxEr85luybolgfWydA4pkbKLkEyNnIWEPIg=;
 b=VR5y1/9yP943MK9SzfV87VErnVblWo2Brpl5hBVhlLj8Wa5UJwkTry02Z58ZrNyWJTQXM+
 2cBxA7/0SvvwL1D2+70yClZ0TZ+Jjrv3nwPycaipJuR68AIUxRLx/TftF0jDciHsBY8GDsQ2
 XIHV5sNrZwbN6DM+GKvvWNbLjzDvGd2/2OxN+vcpwoffrBjAihgbfXiwthCH6OtMdffxeh2M
 n9OjbJ6gQTlnMdmJhJG4rTdCr6ojkz7kYX07oFw7kvHtM8DTSKg2/DUhMHaCX/AI3SHnFJKn
 sceszFDjQ+pEIiXvKaAZwNumze35kMa7UtDv60cvkbx3HCpBnU6cCLLA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 2/2] init-manager: define VIRTUAL-RUNTIME_keymaps for all init managers
Date: Mon, 25 Nov 2024 19:36:36 +0100
Message-Id: <20241125183636.15293-2-peter.marko@siemens.com>
In-Reply-To: <20241125183636.15293-1-peter.marko@siemens.com>
References: <20241125183636.15293-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 18:38:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207797

From: Peter Marko <peter.marko@siemens.com>

VIRTUAL-RUNTIME_keymaps is defined in some init managers and also in
some package groups. Defining distro features in recipes is wrong.
Define it in all init managers instead.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/conf/distro/include/init-manager-none.inc            | 1 +
 meta/conf/distro/include/init-manager-systemd.inc         | 1 +
 meta/conf/distro/include/init-manager-sysvinit.inc        | 1 +
 meta/recipes-core/packagegroups/packagegroup-base.bb      | 3 ---
 meta/recipes-core/packagegroups/packagegroup-core-boot.bb | 3 ---
 5 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta/conf/distro/include/init-manager-none.inc b/meta/conf/distro/include/init-manager-none.inc
index 6ece5c9906..3972e6d8aa 100644
--- a/meta/conf/distro/include/init-manager-none.inc
+++ b/meta/conf/distro/include/init-manager-none.inc
@@ -2,3 +2,4 @@ VIRTUAL-RUNTIME_init_manager ??= "sysvinit"
 VIRTUAL-RUNTIME_initscripts ??= "initscripts"
 VIRTUAL-RUNTIME_login_manager ??= "busybox"
 VIRTUAL-RUNTIME_dev_manager ??= "udev"
+VIRTUAL-RUNTIME_keymaps ?= "keymaps"
diff --git a/meta/conf/distro/include/init-manager-systemd.inc b/meta/conf/distro/include/init-manager-systemd.inc
index 0a76647459..8132135c25 100644
--- a/meta/conf/distro/include/init-manager-systemd.inc
+++ b/meta/conf/distro/include/init-manager-systemd.inc
@@ -5,5 +5,6 @@ VIRTUAL-RUNTIME_init_manager ??= "systemd"
 VIRTUAL-RUNTIME_initscripts ??= "systemd-compat-units"
 VIRTUAL-RUNTIME_login_manager ??= "shadow-base"
 VIRTUAL-RUNTIME_dev_manager ??= "systemd"
+VIRTUAL-RUNTIME_keymaps ?= "keymaps"
 # systemd hardcodes /root in its source codes, other values are not offically supported
 ROOT_HOME ?= "/root"
diff --git a/meta/conf/distro/include/init-manager-sysvinit.inc b/meta/conf/distro/include/init-manager-sysvinit.inc
index e2d17b358d..cfb3438632 100644
--- a/meta/conf/distro/include/init-manager-sysvinit.inc
+++ b/meta/conf/distro/include/init-manager-sysvinit.inc
@@ -5,3 +5,4 @@ VIRTUAL-RUNTIME_init_manager ??= "sysvinit"
 VIRTUAL-RUNTIME_initscripts ??= "initscripts"
 VIRTUAL-RUNTIME_login_manager ??= "busybox"
 VIRTUAL-RUNTIME_dev_manager ??= "udev"
+VIRTUAL-RUNTIME_keymaps ?= "keymaps"
diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index 70a1035003..cb9d1f07af 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -39,9 +39,6 @@ PACKAGES = ' \
             \
             '
 
-# Override by distro if needed
-VIRTUAL-RUNTIME_keymaps ?= "keymaps"
-
 #
 # packagegroup-base contain stuff needed for base system (machine related)
 #
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
index fa06092e27..5cdd161811 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
@@ -9,9 +9,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit packagegroup
 
-# Distro can override the following VIRTUAL-RUNTIME providers:
-VIRTUAL-RUNTIME_keymaps ?= "keymaps"
-
 EFI_PROVIDER ??= "grub-efi"
 
 SYSVINIT_SCRIPTS = "${@bb.utils.contains('MACHINE_FEATURES', 'rtc', '${VIRTUAL-RUNTIME_base-utils-hwclock}', '', d)} \
-- 
2.30.2


