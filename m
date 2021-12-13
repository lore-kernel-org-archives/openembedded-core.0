Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A062C433F5
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 04:17:37 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web12.7345.1639369051545710943
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Dec 2021 20:17:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=intel header.b=TIL11BIY;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639369056; x=1670905056;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=vN5XDILhlYkMnT/IH/ypQBQGCUv0acghGJkQ+jxCOjg=;
  b=TIL11BIYbeT49zedtYxIDw9MMF33KqAixFtpzGoDt4hN/jCgJxmfW9S8
   D29F7g+v2UaJADxEm9S2HU2/GnAoMVUc9zqcswKjqB0ib9Du4ZwXYC5kV
   X3MYib3uWU1nmsKzwrJZSUflhRyEymmqvm1nSZiO4uKBP+3BbnjXBb9M2
   7wYmX5elB+6j14Forf7f1k4f0EbkhDQoFl4auUkaD5vTp3Aakyf6MjeL8
   udWGkZhPDPF+arPgKYdEx9hCmWHq4SSMTmUOsKWlCfEPSIhj8nVW3LkgZ
   SmykJOl/Trwkoie9Xbh2pC17nW7RmpJfdqRr+LPY2G2t3BYg9945G9FF8
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="238602217"
X-IronPort-AV: E=Sophos;i="5.88,201,1635231600";
   d="scan'208";a="238602217"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2021 20:17:36 -0800
X-IronPort-AV: E=Sophos;i="5.88,201,1635231600";
   d="scan'208";a="517589267"
Received: from echan1-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.132.97])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2021 20:17:34 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 05/20] oeqa/parselogs: Fix quoting
Date: Mon, 13 Dec 2021 12:17:04 +0800
Message-Id: 
 <85024cac98791fa39b73de7f3512a690277ffc7c.1639365111.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1639365111.git.anuj.mittal@intel.com>
References: <cover.1639365111.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 04:17:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159595

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Fix deprecation warnings about invalid escape sequences.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 43542614395150e8fa34133ba0fc7ee90f215bcb)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index 01b633d89e..c842f95c34 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -302,7 +302,7 @@ class ParseLogsTest(OERuntimeTestCase):
         grepcmd = 'grep '
         grepcmd += '-Ei "'
         for error in errors:
-            grepcmd += '\<' + error + '\>' + '|'
+            grepcmd += r'\<' + error + r'\>' + '|'
         grepcmd = grepcmd[:-1]
         grepcmd += '" ' + str(log) + " | grep -Eiv \'"
 
@@ -313,13 +313,13 @@ class ParseLogsTest(OERuntimeTestCase):
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


