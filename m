Return-Path: <nora.schiffer@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7112C44501
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 09:50:50 +0000 (UTC)
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9309.1784195443505098853
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 02:50:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ew.tq-group.com header.s=default2602 header.b=o4NFAZgX;
 spf=pass (domain: ew.tq-group.com, ip: 188.40.3.216, mailfrom: nora.schiffer@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=aFYA/g+PNNpeJcvqOs+roo1Lf3XaDoML2RysnmfnJNI=; b=o4NFAZgX0aXP+93NoVDKILxCah
	N0W81fyeqcdxIr8vXdoVW6TC4TUtsxyMhoQdnIBrLY3a1JBf3OVBv6cu2wzUlcLCoXRQOvUEV0wRv
	//KDulgzbrziEV2UKYOvU/QBg4gdOmRo8vVj9LQrwlk8V5EQMTh9pcCtJDQ/RaEV8T1MtPwjEUGAD
	a83uk8GfZNzP1cM21jFsasEC3YqwqbaUh7nS1t7hGa/kBUWaA9k57u699S8tDCc2lDCYqSCfTekY3
	rCiaYWREUHruUsDPJK75q8gOV+Dp8HyyL3+aXyzJ/DyHNd5V04yGxm77F1Gruw9vBd+Oe3l1IN2pc
	26oRq/XA==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1wkIjo-000Nph-3C;
	Thu, 16 Jul 2026 11:50:41 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1wkIjo-0002w0-0y;
	Thu, 16 Jul 2026 11:50:40 +0200
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: openembedded-core@lists.openembedded.org
Cc: oss@ew.tq-group.com,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH] uki.bbclass: make initramfs optional
Date: Thu, 16 Jul 2026 11:50:03 +0200
Message-ID: <20260716095004.282348-1-nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28062/Thu Jul 16 08:25:13 2026)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 09:50:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241074

On many platforms, the boot time can be reduced by booting without
initramfs. Allow omitting it instead of failing the build when
INITRAMFS_IMAGE is empty.

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---
 meta/classes-recipe/uki.bbclass | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uki.bbclass
index fa1c95603b..566eab1eaa 100644
--- a/meta/classes-recipe/uki.bbclass
+++ b/meta/classes-recipe/uki.bbclass
@@ -73,7 +73,7 @@ require ../conf/image-uefi.conf
 
 INITRAMFS_IMAGE ?= "core-image-minimal-initramfs"
 
-do_image_complete[depends] += "${INITRAMFS_IMAGE}:do_image_complete"
+do_image_complete[depends] += "${@ '${INITRAMFS_IMAGE}:do_image_complete' if d.getVar('INITRAMFS_IMAGE') else ''}"
 
 UKIFY_CMD ?= "ukify build"
 UKI_CONFIG_FILE ?= "${UNPACKDIR}/uki.conf"
@@ -127,9 +127,11 @@ python do_uki() {
     ukify_cmd += " --stub %s" % (stub)
 
     # initrd
-    uki_fstype = d.getVar("INITRAMFS_FSTYPES").split()[0]
-    initramfs_image = "%s-%s.%s" % (d.getVar('INITRAMFS_IMAGE'), d.getVar('MACHINE'), uki_fstype)
-    ukify_cmd += " --initrd=%s" % (os.path.join(deploy_dir_image, initramfs_image))
+    initramfs_image = d.getVar('INITRAMFS_IMAGE')
+    if initramfs_image:
+        uki_fstype = d.getVar("INITRAMFS_FSTYPES").split()[0]
+        initramfs_file = "%s-%s.%s" % (initramfs_image, d.getVar('MACHINE'), uki_fstype)
+        ukify_cmd += " --initrd=%s" % (os.path.join(deploy_dir_image, initramfs_file))
 
     # kernel
     kernel_filename = d.getVar('UKI_KERNEL_FILENAME') or None
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


