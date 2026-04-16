Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC087F8A143
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 08:14:46 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8804.1776327275544138327
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 01:14:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=QW/2qTEQ;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 407C71A32F3;
	Thu, 16 Apr 2026 08:14:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0F55F5FDEB;
	Thu, 16 Apr 2026 08:14:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B70D910459ECF;
	Thu, 16 Apr 2026 10:14:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776327272; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=E4AQ6doVaLMraZTF57iKYPOYO4J63aB52ww+vtLEU2o=;
	b=QW/2qTEQ0DqknClWyZPmnIJsufWbL1H5ovkuFyBbsmAIoPe8mIcXj0kk4TtKXGGWJVigwi
	e+s+zJ0Vm2S1OgQghFRCn2l14v6S+X0FZspM1JWUlvlU4lOdb/09AqZATJhG8GyyaDMgQ2
	a4kbiKl1mbAMLTLvVsoolMYo6DQqMebNl3c4tN/ZzD1Op6JKTV3ShGAADndKSO3M8yx0i3
	Xi5EajLbtvMyWqZG63ydGFs8g8xNQ1EF/XlcC83ALfkPadEQ1ha5K49t7sFezlsPyBD1tU
	2loHtsAC30PbyCO8LtyEzdvDeZLKcfPG1P9uuyK0KYwQ6D+LlSwh+TAFiaczcw==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Thu, 16 Apr 2026 10:14:26 +0200
Subject: [PATCH] devtool-source: set S variable to a sub dir of UNPACKDIR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-fix-devtool-source-v1-1-3a9b689fbe16@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMUQqDMBCE4avIPnchCSWCV5E+aBzripiSVSlI7
 m5sHz+Y+U9SJIFSU52UcIhKXAvso6IwdesbLEMxOeO8eVrPo3x5wLHFuLDGPQVwV/vRo3cuWEv
 l+Ekoq1+0ff2tez8jbHeJcr4AKNTKTnYAAAA=
X-Change-ID: 20260416-fix-devtool-source-a76f6eb22c11
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, ross.burton@arm.com, 
 antonin.godard@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 thomas.petazzoni@bootlin.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.1
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 08:14:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235392

If a recipe set UNPACKDIR to a directory that is not contained within
WORKDIR, before this modification, this generates the following error:
"S should be set relative to UNPACKDIR."

S should not be updated, otherwise the recipe may not find the extracted
sources. In all recipes, S should reference the UNPACKDIR variable.
There is an exception for the kernel to prevent infinite recursion
when expanding the STAGING_KERNEL_DIR variable.

So, only updates UNPACKDIR to be within the DEVTOOL_TEMPDIR directory.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
I have done various testing, but since I don't know all the requirements
of devtool, and all the impacts of this change, I may have broken some
stuff (I hope not).

This patch fixes the following command:
 - devtool upgrade sbom-cve-check-update-cvelist-native

It does not break the following commands:
 - devtool upgrade linux-yocto
 - devtool upgrade python3-sbom-cve-check
---
 meta/classes/devtool-source.bbclass | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/classes/devtool-source.bbclass b/meta/classes/devtool-source.bbclass
index 2e0070486b46..fcc053120343 100644
--- a/meta/classes/devtool-source.bbclass
+++ b/meta/classes/devtool-source.bbclass
@@ -37,12 +37,11 @@ python() {
     workdir = os.path.join(tempdir, 'workdir')
     d.setVar('WORKDIR', workdir)
     if not d.getVar('S').startswith(workdir):
+        d.setVar('UNPACKDIR', os.path.join(workdir, 'sources'))
         # Usually a shared workdir recipe (kernel, gcc)
         # Try to set a reasonable default
         if bb.data.inherits_class('kernel', d):
-            d.setVar('S', '${WORKDIR}/source')
-        else:
-            d.setVar('S', '${WORKDIR}/%s' % os.path.basename(d.getVar('S')))
+            d.setVar('S', '${UNPACKDIR}/source')
     if bb.data.inherits_class('kernel', d):
         # We don't want to move the source to STAGING_KERNEL_DIR here
         d.setVar('STAGING_KERNEL_DIR', '${S}')

---
base-commit: 8b5f530fc57ba0e04c47b2d7338f5c0f862b084f
change-id: 20260416-fix-devtool-source-a76f6eb22c11

Best regards,
--  
Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>


