Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15801C9830E
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 01:46:28 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48335.1790559978829128933
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 18:46:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo01.lge.com) (156.147.1.125)
	by 156.147.23.51 with ESMTP; 28 Sep 2026 10:46:16 +0900
X-Original-SENDERIP: 156.147.1.125
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.127.86)
	by 156.147.1.125 with ESMTP; 28 Sep 2026 10:46:16 +0900
X-Original-SENDERIP: 10.177.127.86
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-core@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [PATCH 1/2] siteinfo: add siteinfo_get_files_for_machine()
Date: Mon, 28 Sep 2026 10:46:12 +0900
Message-ID: <20260928014613.2399839-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 01:46:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246718

From: "mark.yang" <mark.yang@lge.com>

Add siteinfo_get_files_for_machine() to look up the site files for any
arch/os pair, not just HOST_ARCH-HOST_OS. siteinfo_get_files() now
calls it with HOST_ARCH and HOST_OS, as 7429ed8d2a ("siteinfo:
generalise siteinfo") did for siteinfo_data().

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 meta/classes-recipe/siteinfo.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/siteinfo.bbclass b/meta/classes-recipe/siteinfo.bbclass
index 25b53d929a..9dc8d3a477 100644
--- a/meta/classes-recipe/siteinfo.bbclass
+++ b/meta/classes-recipe/siteinfo.bbclass
@@ -194,8 +194,8 @@ python () {
 # sstate isn't path specific
 SITEINFO_PATHVARS = "COREBASE"
 
-def siteinfo_get_files(d, sysrootcache=False):
-    sitedata = siteinfo_data(d)
+def siteinfo_get_files_for_machine(arch, osname, d):
+    sitedata = siteinfo_data_for_machine(arch, osname, d)
     sitefiles = []
     searched = []
     for path in d.getVar("BBPATH").split(":"):
@@ -223,4 +223,6 @@ def siteinfo_get_files(d, sysrootcache=False):
 
     return sitefiles, searched
 
+def siteinfo_get_files(d, sysrootcache=False):
+    return siteinfo_get_files_for_machine(d.getVar("HOST_ARCH"), d.getVar("HOST_OS"), d)
 

base-commit: fb479118c94f5448759a3ce8f1aad89d5aebdf75

