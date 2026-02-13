Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DE21EDF145
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 10:01:02 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.68450.1770976860345921753
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 02:01:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Y1GVgg6X;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C60034E40D20
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 10:00:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 82B27606CC;
	Fri, 13 Feb 2026 10:00:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 02D9610368E39;
	Fri, 13 Feb 2026 11:00:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770976852; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=eqSyc96qf6ovZgEWDRNEgC2hL33q+gi4RhYXwkKa5ww=;
	b=Y1GVgg6XrgeHhtwEgJKcFz7ZSltVqtQ3715rhabssF84t7vxpwkEEJhVZmhmBOhvUZEmUx
	Cno0bzD0kZJPYsWOilSpgyYY7P3hoics1JzgVieSp1uCq09PpGTcrbyjohQ/EdzEdnrRyq
	oFR6bkNYJMiLqX7TGfbrLqYEl8auEEG1XFqasg3q7Xb84MKRMwxWzk/12hUqibRBhyEpTG
	Zk+ybfEeNcFHE2ypFRi8SQcaVVW9uJFCAy18tETofZk6D6sgfmVQGToMbeQQaH0TlDBUav
	UaKVISj6ak1I9bJ5osX14rltVbJ3A72TEMs+fjigF0kfsAG4IXQ2p9t10r4FwA==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Fri, 13 Feb 2026 11:00:37 +0100
Subject: [PATCH scarthgap] spdx30_tasks: Exclude 'doc' when exporting
 PACKAGECONFIG to SPDX
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-backport-fix-packageconfig-spdx-v1-1-b157f0f0698b@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3N0QrDIAyF4VcpuV7AOhC6Vxm7SDXaMNAQyyiUv
 ntllx/8nHNCZxPu8JpOMP5Jl1YH5scEcaNaGCUNg3c+OD8/caX41WY7ZjlQB6hwbDVLwa7pwJB
 yoiU6CssKY0WNR/l/eEOPZPtWSOFzXTcabGqPfAAAAA==
X-Change-ID: 20260213-backport-fix-packageconfig-spdx-6dfda9c0a69b
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com, kamel.bouhara@bootlin.com, 
 jeremie.dautheribes@bootlin.com, thomas.petazzoni@bootlin.com, 
 miquel.raynal@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 antonin.godard@bootlin.com, pascal.eberhard@se.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 10:01:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231108

Currently when generating an SBOM, all packages have the 'doc' feature
indicated as disabled. This is in fact *not* a feature that was
declared in the recipe, but instead the documentation of the
PACKAGECONFIG variable.

But to be safe, if somehow a feature is named 'doc' and enabled, do
not exclude it when exporting PACKAGECONFIG features to SPDX.

(cherry picked from commit 933394adcb0d2db66ef7e0656a464241e58ec2e7)

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
 meta/lib/oe/spdx30_tasks.py | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index a3d848ceb1fe..a8970dcca0f7 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -811,12 +811,14 @@ def create_spdx(d):
 
     if d.getVar("SPDX_INCLUDE_PACKAGECONFIG", True) != "0":
         packageconfig = (d.getVar("PACKAGECONFIG") or "").split()
-        all_features = (d.getVarFlags("PACKAGECONFIG") or {}).keys()
+        all_features = set((d.getVarFlags("PACKAGECONFIG") or {}).keys())
+        blacklisted_features = {"doc"}
 
         if all_features:
             enabled = set(packageconfig)
-            all_features_set = set(all_features)
-            disabled = all_features_set - enabled
+            disabled = all_features - enabled
+            all_features -= disabled & blacklisted_features
+            disabled -= blacklisted_features
 
             for feature in sorted(all_features):
                 status = "enabled" if feature in enabled else "disabled"

---
base-commit: d50e4680ed6f930582d907b37c9ed545a89f5c27
change-id: 20260213-backport-fix-packageconfig-spdx-6dfda9c0a69b

Best regards,
-- 
Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>


