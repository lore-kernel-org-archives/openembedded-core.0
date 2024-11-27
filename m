Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C3FED6D231
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 19:24:52 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web10.79614.1732735491751209037
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Nov 2024 11:24:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Rwp171AS;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20241127192449074349ebcd314c4c01-ladd8l@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20241127192449074349ebcd314c4c01
        for <openembedded-core@lists.openembedded.org>;
        Wed, 27 Nov 2024 20:24:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=SCCdfyc/4k8gjkhRv+K5LtrEdvqvp7829kaGmOdb8jk=;
 b=Rwp171AS/HRMiGmyOrS3I8QekMjCuPQqIrzytyRWo7G+U5CR1e48xfEcly3qx4ZtLF+vAs
 3AkOgjEC2eOqYAyQfeeglzA1MP+iSid4AzpriXAs6oXeexWUMR/wICaWXbZ6GYLAIEh/Osee
 HdKrlHZxyzBTypqEXBAh56WrA+eG1z3MtMU4PoBYhJRuAD+wcFeYUnVK7h2xuQBJmujzjDS8
 0SQ2RGIPo6fqRFgdFwYAYNtGwEGtX77oq5M5vFVDLHL9xsvRlx+D3fINfp1INVpChutp3Hat
 4s3K1umW/di41SHI+HMh6zFUWOHCjUdUehcD8xGkB1YJZxxk+JUU4+DA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH v3 2/2] default-providers: define keymaps virtual runtime provider
Date: Wed, 27 Nov 2024 20:23:34 +0100
Message-Id: <20241127192334.17381-2-peter.marko@siemens.com>
In-Reply-To: <20241127192334.17381-1-peter.marko@siemens.com>
References: <20241127172455.15722-1-peter.marko@siemens.com>
 <20241127192334.17381-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 19:24:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207960

From: Peter Marko <peter.marko@siemens.com>

VIRTUAL-RUNTIME_keymaps is defined in busybox init manager and also in
some package groups. Defining distro features in recipes is wrong.
Also this is not directly related to init manager.
So move all these definitions to default-providers.inc

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
v2: moved VIRTUAL-RUNTIME_keymaps to default-providers.inc
v3: no change

 meta/conf/distro/include/default-providers.inc            | 1 +
 meta/conf/distro/include/init-manager-mdev-busybox.inc    | 1 -
 meta/recipes-core/packagegroups/packagegroup-base.bb      | 3 ---
 meta/recipes-core/packagegroups/packagegroup-core-boot.bb | 3 ---
 4 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index b32c4e0d25..506d77811f 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -29,6 +29,7 @@ VIRTUAL-RUNTIME_getopt ?= "util-linux-getopt"
 VIRTUAL-RUNTIME_base-utils ?= "busybox"
 VIRTUAL-RUNTIME_base-utils-hwclock ?= "busybox-hwclock"
 VIRTUAL-RUNTIME_base-utils-syslog ?= "busybox-syslog"
+VIRTUAL-RUNTIME_keymaps ?= "keymaps"
 
 #
 # Default recipe providers
diff --git a/meta/conf/distro/include/init-manager-mdev-busybox.inc b/meta/conf/distro/include/init-manager-mdev-busybox.inc
index 12091cba68..d9b05e1781 100644
--- a/meta/conf/distro/include/init-manager-mdev-busybox.inc
+++ b/meta/conf/distro/include/init-manager-mdev-busybox.inc
@@ -3,5 +3,4 @@ DISTRO_FEATURES_BACKFILL_CONSIDERED:append = " systemd sysvinit"
 VIRTUAL-RUNTIME_dev_manager ??= "busybox-mdev"
 VIRTUAL-RUNTIME_init_manager ??= "busybox"
 VIRTUAL-RUNTIME_initscripts ??= "initscripts"
-VIRTUAL-RUNTIME_keymaps ??= "keymaps"
 VIRTUAL-RUNTIME_login_manager ??= "busybox"
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


