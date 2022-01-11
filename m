Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACA16C433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 14:33:12 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web11.8008.1641911590548367744
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 06:33:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=PdktRCcr;
 spf=pass (domain: intel.com, ip: 192.55.52.151,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641911591; x=1673447591;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=5fLbRWPj4Rd10cMvx9Xp5wP7pczsKvvJmn2YPnCKuHk=;
  b=PdktRCcrBoe5F9sVCpGcPSrH3z6UTW3qWv9pJvuj2nuBZYZnH6ELsqNl
   28KBF/fPn6IKBiYkcwmwluac4gLcZR1dE75cZMXjOsppcsrqOO+S6Y46E
   yPTMtbIDhxf04VYzcuWMOL0/iaGwM1kG+R09E9NMXrrRcCOqIYuS7pn8u
   XIvaPPQ+Bzm132Xm8YhsvZkTiSGzbEJbUvhks9ZqEIs9OjhC/RIFW7/tE
   Uqx1TWW22w65m6Wsvw+4Uw8e+7uAyflzQAXLb6ALhI2EQ/0rEzGJTtqiC
   IxaSPI5mHLw6vPHqqn/OsoymXubBK0kq5hvvT+9ANZ0ro/amgcc1e05aY
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="224192531"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600";
   d="scan'208";a="224192531"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 06:33:09 -0800
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600";
   d="scan'208";a="623086361"
Received: from wongkye-mobl3.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.137.187])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 06:33:04 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 3/9] lib/oe/reproducible: correctly set .git
 location when recursively looking for git repos
Date: Tue, 11 Jan 2022 22:32:47 +0800
Message-Id: 
 <2ff5c37f70e8c465cdbc61eea1d2d2a2be9bd84f.1641911316.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1641911316.git.anuj.mittal@intel.com>
References: <cover.1641911316.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 14:33:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160405

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ffdaa1a0527691d66dd28e86bd015bfad7a020f6)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oe/reproducible.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/reproducible.py b/meta/lib/oe/reproducible.py
index 204b9bd734..0938e4cb39 100644
--- a/meta/lib/oe/reproducible.py
+++ b/meta/lib/oe/reproducible.py
@@ -41,7 +41,7 @@ def find_git_folder(d, sourcedir):
     for root, dirs, files in os.walk(workdir, topdown=True):
         dirs[:] = [d for d in dirs if d not in exclude]
         if '.git' in dirs:
-            return root
+            return os.path.join(root, ".git")
 
     bb.warn("Failed to find a git repository in WORKDIR: %s" % workdir)
     return None
-- 
2.34.1


