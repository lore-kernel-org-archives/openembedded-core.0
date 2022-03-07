Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DC9AC4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 14:13:50 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.26505.1646662420742202043
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 06:13:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=fIn10KBU;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646662428; x=1678198428;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=jpWdtnKxhjRk/rSNvvjwwH7HocUOgfmdHS4x7H3wE9o=;
  b=fIn10KBUyKu6Db/AgQvdPZwbJFPYdSVe2PGFyrEeuPbd4IQF9gzPu58P
   /tUbVZFL04VWaWjWWUuORoU06zfdePRIYjHbdz3HaTSGXhVey7h+ZTjGv
   7Y/jWlYnBI/bSjtysUkgk8AwMKWBsKCJpMm3SpHI0hyc0bMcRQDsV36b7
   mWs6Vq7VJoWcfHAl+L3UI9Ev1jbuppMcvgx58diijW4SMd2mfPvo40qrz
   wg3osrJy2XMBI1/ta1n3OQd8Iu2fEP9CnK5N+XWyHZz7xeC/TesCxSzCY
   EFJ68Gu9rIM1op66n3PnLTfODNKWe7ov4lRRnHIHpW824SW9Px5AQ+qUZ
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10278"; a="315112489"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400";
   d="scan'208";a="315112489"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 06:10:21 -0800
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400";
   d="scan'208";a="495070803"
Received: from hmohdnox-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.227.91])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 06:10:20 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 08/25] devtool: explicitly set main or master
 branches in upgrades when available
Date: Mon,  7 Mar 2022 22:09:44 +0800
Message-Id: 
 <e2f27f05018a7f7882166b1b82ffd4b443ca9dc0.1646661615.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646661615.git.anuj.mittal@intel.com>
References: <cover.1646661615.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 14:13:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162828

From: Alexander Kanavin <alex.kanavin@gmail.com>

In particular this resolves devtool's inability to pick a branch
when the same tagged commit is avaiable in main and in a release maintenance
branch.

Thanks to Peter Kjellerstedt for the suggestion.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bcb21ee2760a2c76039412a56c6cda43fbf96fd0)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/lib/devtool/upgrade.py | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 826a3f955f..0357ec07bf 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -192,14 +192,15 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, srcbranch, branch, kee
             get_branch = [x.strip() for x in check_branch.splitlines()]
             # Remove HEAD reference point and drop remote prefix
             get_branch = [x.split('/', 1)[1] for x in get_branch if not x.startswith('origin/HEAD')]
-            if 'master' in get_branch:
-                # If it is master, we do not need to append 'branch=master' as this is default.
-                # Even with the case where get_branch has multiple objects, if 'master' is one
-                # of them, we should default take from 'master'
-                srcbranch = ''
-            elif len(get_branch) == 1:
-                # If 'master' isn't in get_branch and get_branch contains only ONE object, then store result into 'srcbranch'
+            if len(get_branch) == 1:
+                # If srcrev is on only ONE branch, then use that branch
                 srcbranch = get_branch[0]
+            elif 'main' in get_branch:
+                # If srcrev is on multiple branches, then choose 'main' if it is one of them
+                srcbranch = 'main'
+            elif 'master' in get_branch:
+                # Otherwise choose 'master' if it is one of the branches
+                srcbranch = 'master'
             else:
                 # If get_branch contains more than one objects, then display error and exit.
                 mbrch = '\n  ' + '\n  '.join(get_branch)
-- 
2.35.1


