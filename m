Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EB28C433EF
	for <webhook@archiver.kernel.org>; Wed, 29 Sep 2021 14:59:23 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web10.10087.1632927554721798137
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Sep 2021 07:59:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10122"; a="224613809"
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200";
   d="scan'208";a="224613809"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 07:59:22 -0700
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200";
   d="scan'208";a="520858460"
Received: from zkeh-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.213.143.173])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 07:59:21 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 07/10] oeqa/qemurunner: Use oe._exit(),
 not sys.exit()
Date: Wed, 29 Sep 2021 22:59:05 +0800
Message-Id: 
 <a99e23c403abd8e520079e2e216d87e713559682.1632903759.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1632903759.git.anuj.mittal@intel.com>
References: <cover.1632903759.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Sep 2021 14:59:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156464

From: Richard Purdie <richard.purdie@linuxfoundation.org>

sys.exit will cause finally statements and other code to run at exit. Since
we're using os.fork() here, os._exit() is apprioriate in this codepath.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ec08498ff29de9ccd23be88b9d7af3dab6bbb81e)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index a0f17d557b..d6d47cfabb 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -235,7 +235,7 @@ class QemuRunner:
             r = os.fdopen(r)
             x = r.read()
             os.killpg(os.getpgid(self.runqemu.pid), signal.SIGTERM)
-            sys.exit(0)
+            os._exit(0)
 
         self.logger.debug("runqemu started, pid is %s" % self.runqemu.pid)
         self.logger.debug("waiting at most %s seconds for qemu pid (%s)" %
-- 
2.31.1


