Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E157FB516F
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 22:12:02 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.66612.1775513516592253172
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2026 15:11:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=UaepC9tP;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1329275-20260406221154082db4213a0002073c-6__3m_@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260406221154082db4213a0002073c
        for <openembedded-core@lists.openembedded.org>;
        Tue, 07 Apr 2026 00:11:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=MEqyzXeEN/RVE6RVpBJ+VJEtqbkv6Iaw6xGtaYq4BeY=;
 b=UaepC9tPjRhSGnIem5LWKL4+RkVydTWZ+arIbfZlj8yaY8ssHGqALPXU8t0ZDWUndP0ziA
 w7PEi/EbzaTe8OK/L+w/H9pqRgUkgBHTAZJ7ByXhJp9kkY38yVdpAo7LUQcsgQqXe3Z4mY6J
 QkTS/56vMmW151Mj5l74wE6l4nkuU3SOKEVQ0DN9AlWi/hOu/CkumODUFljT7fuExYqADHyN
 AGnHSuSaVJGKBkMGH4q45T2e5AN4bKa0tq0YJD8x6OLXdVLMOLhZ1/zJGNjDwup3iLG1dj91
 qHQ8cDupIDBl6YErnX6x6y4+0wWTesCOA5c1jk3g//uSkK/hB5HA4j5w==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 6/6] devtool: ide-sdk: use TOOLCHAIN not TCOVERRIDE
Date: Tue,  7 Apr 2026 00:10:33 +0200
Message-ID: <20260406221133.2769152-7-adrian.freihofer@siemens.com>
In-Reply-To: <20260406221133.2769152-1-adrian.freihofer@siemens.com>
References: <20260406221133.2769152-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 22:12:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234692

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Looks like TOOLCHAIN is the correct variable to determine the toolchain
used by a recipe, not TCOVERRIDE.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/lib/devtool/ide_sdk.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 9bccd76f0c..07f5552758 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -416,7 +416,7 @@ class RecipeModified:
         self.staging_incdir = None
         self.strip_cmd = None
         self.target_arch = None
-        self.tcoverride = None
+        self.toolchain = None
         self.topdir = None
         self.workdir = None
         # Service management
@@ -502,7 +502,7 @@ class RecipeModified:
             recipe_d.getVar('STAGING_INCDIR'))
         self.strip_cmd = recipe_d.getVar('STRIP')
         self.target_arch = recipe_d.getVar('TARGET_ARCH')
-        self.tcoverride = recipe_d.getVar('TCOVERRIDE')
+        self.toolchain = recipe_d.getVar('TOOLCHAIN')
         self.topdir = recipe_d.getVar('TOPDIR')
         self.workdir = os.path.realpath(recipe_d.getVar('WORKDIR'))
 
@@ -673,7 +673,7 @@ class RecipeModified:
     @property
     def gdb_pretty_print_scripts(self):
         if self._gdb_pretty_print_scripts is None:
-            if self.tcoverride == "toolchain-gcc":
+            if self.toolchain == "gcc":
                 gcc_python_helpers_pattern = os.path.join(self.recipe_sysroot, "usr", "share", "gcc-*", "python")
                 gcc_python_helpers_dirs = glob.glob(gcc_python_helpers_pattern)
                 if gcc_python_helpers_dirs:
-- 
2.53.0


