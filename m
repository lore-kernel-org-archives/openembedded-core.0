Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28194C433FE
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 02:11:02 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.6040.1642385441199973001
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jan 2022 18:10:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=bmqpvouY;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642385441; x=1673921441;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=5fLbRWPj4Rd10cMvx9Xp5wP7pczsKvvJmn2YPnCKuHk=;
  b=bmqpvouYnsxEKtSOTmQE/hRFU2dM2qD/UkiFo0A3lB6bErFYdBUPj+j1
   UXdHwVaD9GbHHUkLA8ZdFWmYuOE03sZg7BXavcx7Y3x3ZYv6hl0TRpkcS
   K7g7ZJSE2hEIISeYge6uxl+y4Jy5Fa6dJuvhzv/pw+eY2sLPqLK6CdUEK
   T8GfqOn1dk0t4mCVOSs67/cd7lGV7uVXPumzYosAUHH9V0vkxMHMKaxNu
   QJK7yCGuwV2OjTxEHgUI+jM7Hcn/xwg4Cp2tJMW9GeTGra3azvf4VBFXG
   PP8eEck8zDdkl+R9GToXs1KrQdjUGNKQcpqq1a1K/msRIzt4/st+/Lwoh
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10229"; a="242094190"
X-IronPort-AV: E=Sophos;i="5.88,294,1635231600";
   d="scan'208";a="242094190"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2022 18:10:40 -0800
X-IronPort-AV: E=Sophos;i="5.88,294,1635231600";
   d="scan'208";a="492220686"
Received: from khershix-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.230.190])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2022 18:10:39 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 02/12] lib/oe/reproducible: correctly set .git
 location when recursively looking for git repos
Date: Mon, 17 Jan 2022 10:10:22 +0800
Message-Id: 
 <1b41f1a38d43c1f0ef351bd6959a77821886a8b6.1642385249.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1642385249.git.anuj.mittal@intel.com>
References: <cover.1642385249.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jan 2022 02:11:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160621

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


