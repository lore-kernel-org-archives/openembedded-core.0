Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10B1DC433F5
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 01:30:05 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.5654.1639013381253925301
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 17:30:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="235504011"
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600";
   d="scan'208";a="235504011"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 17:30:03 -0800
X-IronPort-AV: E=Sophos;i="5.88,190,1635231600";
   d="scan'208";a="503298187"
Received: from chuenong-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.229.15])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 17:30:02 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 19/33] oeqa/parselogs: Fix quoting
Date: Thu,  9 Dec 2021 09:29:18 +0800
Message-Id: 
 <50f9105410b662062765b6ec9a68ae30805d3b40.1639012800.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1639012800.git.anuj.mittal@intel.com>
References: <cover.1639012800.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 01:30:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159420

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Fix deprecation warnings about invalid escape sequences.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 43542614395150e8fa34133ba0fc7ee90f215bcb)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index 50101b7851..b81acdd18a 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -303,7 +303,7 @@ class ParseLogsTest(OERuntimeTestCase):
         grepcmd = 'grep '
         grepcmd += '-Ei "'
         for error in errors:
-            grepcmd += '\<' + error + '\>' + '|'
+            grepcmd += r'\<' + error + r'\>' + '|'
         grepcmd = grepcmd[:-1]
         grepcmd += '" ' + str(log) + " | grep -Eiv \'"
 
@@ -314,13 +314,13 @@ class ParseLogsTest(OERuntimeTestCase):
             errorlist = ignore_errors['default']
 
         for ignore_error in errorlist:
-            ignore_error = ignore_error.replace('(', '\(')
-            ignore_error = ignore_error.replace(')', '\)')
+            ignore_error = ignore_error.replace('(', r'\(')
+            ignore_error = ignore_error.replace(')', r'\)')
             ignore_error = ignore_error.replace("'", '.')
-            ignore_error = ignore_error.replace('?', '\?')
-            ignore_error = ignore_error.replace('[', '\[')
-            ignore_error = ignore_error.replace(']', '\]')
-            ignore_error = ignore_error.replace('*', '\*')
+            ignore_error = ignore_error.replace('?', r'\?')
+            ignore_error = ignore_error.replace('[', r'\[')
+            ignore_error = ignore_error.replace(']', r'\]')
+            ignore_error = ignore_error.replace('*', r'\*')
             ignore_error = ignore_error.replace('0-9', '[0-9]')
             grepcmd += ignore_error + '|'
         grepcmd = grepcmd[:-1]
-- 
2.33.1


