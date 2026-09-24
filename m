Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E5B3C98312
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 06:02:00 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1634.1790229717798276322
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 23:01:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=sWTbzR9p;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1329275-202609240601555aefbbcb3f0002078d-p_9tny@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202609240601555aefbbcb3f0002078d
        for <openembedded-core@lists.openembedded.org>;
        Thu, 24 Sep 2026 08:01:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=soyEvCEVUcLB/8HePGL4XBuynlM6PAhpsxKhY7+uFlE=;
 b=sWTbzR9pfUo+K9cceyeDoAzgAz+E9WSuGEWQVQfqDtxMpOCymmWQikHbCnYtypseKici1x
 tR1iQKfPcTu8IkqJionkH9iFaFzF30IfqC4LQqcALx3XzXA/z5D2Sz1bIa5xJX5hDb7T40u0
 GLYvHfm3Lj1+Dnu6I99uxgdP6iLY/rCG9SXjVNbbX4ag7sHSTuD6dXISai98rE1C53LrzrWi
 Dg4yLzOo9EgGdwQNqjBn1HqeOHcNLqq9XgiTpHBBUxeche1WPfDoyyJ+3VTVs7zmwKI6ecmA
 xw6O0EID+xPWEqegiC4hT1SsKA8//DvXf8+qFvfovCOXyaipmIejircQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 2/2] devtool: ide-sdk: allow ide plugins to add packages rootfs-dbg
Date: Thu, 24 Sep 2026 08:01:38 +0200
Message-ID: <20260924060138.364180-2-adrian.freihofer@siemens.com>
In-Reply-To: <20260924060138.364180-1-adrian.freihofer@siemens.com>
References: <20260924060138.364180-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2026 06:02:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246569

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Add a mechanism for IDE plugins to append packages to
IMAGE_INSTALL_DEBUGFS.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_sdk.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index c527d17806..1eb4d94fc6 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -221,6 +221,9 @@ class RecipeImage:
         self.base_image_fstypes_debugfs = ''
         self.base_has_combined_dbg = False
         self.base_image_install = set()
+        self.base_image_install_debugfs = set()
+        # Packages IDE plugins want added to IMAGE_INSTALL_DEBUGFS
+        self.extra_image_install_debugfs = set()
         self._bbappend = None
         # Content of the bbappend before strip_bbappend_sections() ran.
         self._orig_bbappend_content = orig_bbappend_content
@@ -279,6 +282,8 @@ class RecipeImage:
             'image-combined-dbg', image_d)
         self.base_image_install = set(
             (image_d.getVar('IMAGE_INSTALL') or '').split())
+        self.base_image_install_debugfs = set(
+            (image_d.getVar('IMAGE_INSTALL_DEBUGFS') or '').split())
 
         workdir = image_d.getVar('WORKDIR')
         self.__rootfs = os.path.join(workdir, 'rootfs')
@@ -437,6 +442,8 @@ class RecipeImage:
                 lines.append('IMAGE_INSTALL:append = " %s"' % r.name)
             if r.has_ptest and (r.name + '-ptest') not in self.base_image_install:
                 lines.append('IMAGE_INSTALL:append = " %s-ptest"' % r.name)
+        for pkg in sorted(self.extra_image_install_debugfs - self.base_image_install_debugfs):
+            lines.append('IMAGE_INSTALL_DEBUGFS:append = " %s"' % pkg)
 
         original_content = self._orig_bbappend_content or ''
         # strip_bbappend_sections() left this on disk, and it is what bitbake
-- 
2.55.0


