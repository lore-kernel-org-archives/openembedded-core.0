Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 542F4F36C57
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 07:45:00 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14479.1776671098009183107
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2026 00:44:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=EiEcMka2;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6D6A94E42A72;
	Mon, 20 Apr 2026 07:44:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3DC795FFA5;
	Mon, 20 Apr 2026 07:44:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 61BFA10460B79;
	Mon, 20 Apr 2026 09:44:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776671095; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3s8QPZqD7mRCLXgUrtoPxctcqmmnbmwnJWvjfAdsiLQ=;
	b=EiEcMka2tgf+Ud5eAA7cWn27WGM85F10QSBjxAj8IX5UTmPlJ2n3QZk/vsus6o2gpBpm6o
	bSmScKfhupXx6C6glql4sHjGEX3a8WfG0Q88Mq1zlZmGZ9k9DAPznycIOavkmbties0uq0
	ISVOGQC0ufWrybOryVfE9g5Ye4pyK3wQBgjvGSdiOOHWfcEsPnCGerj1RS3AF75DjE30Aw
	qPf6+fDLaOU/Ev1MyL4FqIBoAWJF4GC1KK5Ya7Th9MCvUoVDVTDdkjrRCMsDSmnRlr3vMZ
	9eemgNGISUr+mvKmPGm1MUDqtMNdmm14PLcQVTL6VJHPZsIw5WkV2ZeLdMfSdw==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Mon, 20 Apr 2026 09:44:40 +0200
Subject: [PATCH 09/10] oe/spdx30_task: Add status notes to VEX relationship
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-spdx3-improvements-v1-9-27e0d5edcdbe@bootlin.com>
References: <20260420-spdx3-improvements-v1-0-27e0d5edcdbe@bootlin.com>
In-Reply-To: <20260420-spdx3-improvements-v1-0-27e0d5edcdbe@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, peter.marko@siemens.com, 
 ross.burton@arm.com, jpewhacker@gmail.com, olivier.benjamin@bootlin.com, 
 antonin.godard@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 thomas.petazzoni@bootlin.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 07:45:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235550

Without the status note, we are losing the reason why the CVE is
considered vulnerable or fixed.
The information provided in CVE_STATUS is otherwise lost.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
 meta/lib/oe/sbom30.py       | 12 +++++++++---
 meta/lib/oe/spdx30_tasks.py |  9 +++++++--
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index 5d020b934cc0..0f1f9281ad32 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -704,7 +704,8 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
         )
         return self.add(v)
 
-    def new_vex_patched_relationship(self, from_, to):
+    def new_vex_patched_relationship(self, from_, to, notes: None):
+        props = {'security_statusNotes': notes} if notes else {}
         return self._new_relationship(
             oe.spdx30.security_VexFixedVulnAssessmentRelationship,
             from_,
@@ -712,9 +713,11 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
             to,
             spdxid_name="vex-fixed",
             security_vexVersion=VEX_VERSION,
+            **props,
         )
 
-    def new_vex_unpatched_relationship(self, from_, to):
+    def new_vex_unpatched_relationship(self, from_, to, notes: None):
+        props = {'security_statusNotes': notes} if notes else {}
         return self._new_relationship(
             oe.spdx30.security_VexAffectedVulnAssessmentRelationship,
             from_,
@@ -723,9 +726,11 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
             spdxid_name="vex-affected",
             security_vexVersion=VEX_VERSION,
             security_actionStatement="Mitigation action unknown",
+            **props,
         )
 
-    def new_vex_ignored_relationship(self, from_, to, *, impact_statement):
+    def new_vex_ignored_relationship(self, from_, to, *, impact_statement, notes: None):
+        props = {'security_statusNotes': notes} if notes else {}
         return self._new_relationship(
             oe.spdx30.security_VexNotAffectedVulnAssessmentRelationship,
             from_,
@@ -734,6 +739,7 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
             spdxid_name="vex-not-affected",
             security_vexVersion=VEX_VERSION,
             security_impactStatement=impact_statement,
+            **props,
         )
 
     def import_bitbake_build_objset(self):
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index a071d85e10ea..ffedc1e25b59 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -724,7 +724,8 @@ def create_recipe_spdx(d):
 
             if status == "Patched":
                 spdx_vex = recipe_objset.new_vex_patched_relationship(
-                    [spdx_cve_id], [recipe]
+                    [spdx_cve_id], [recipe],
+                    notes=": ".join(v for v in (detail, description) if v)
                 )
                 patches = []
                 for idx, filepath in enumerate(resources):
@@ -749,12 +750,16 @@ def create_recipe_spdx(d):
                     )
 
             elif status == "Unpatched":
-                recipe_objset.new_vex_unpatched_relationship([spdx_cve_id], [recipe])
+                recipe_objset.new_vex_unpatched_relationship(
+                    [spdx_cve_id], [recipe],
+                    notes=": ".join(v for v in (detail, description) if v)
+                )
             elif status == "Ignored":
                 spdx_vex = recipe_objset.new_vex_ignored_relationship(
                     [spdx_cve_id],
                     [recipe],
                     impact_statement=description,
+                    notes=detail,
                 )
 
                 vex_just_type = d.getVarFlag("CVE_CHECK_VEX_JUSTIFICATION", detail)

-- 
2.53.0


