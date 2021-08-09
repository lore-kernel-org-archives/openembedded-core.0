Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web12.24726.1628523364931716435
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Aug 2021 08:36:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10070"; a="278466789"
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; 
   d="scan'208";a="278466789"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2021 08:36:07 -0700
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; 
   d="scan'208";a="483462870"
Received: from abinzahx-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.229.181])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2021 08:36:05 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 03/23] devtool: print a warning on upgrades if PREFERRED_VERSION is set
Date: Mon,  9 Aug 2021 23:35:35 +0800
Message-Id: <5fb2fb70d14b0e9f6235e5b940e9a3e1145750bb.1628522214.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1628522214.git.anuj.mittal@intel.com>
References: <cover.1628522214.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0b0f53eed0aadbf45d9eead96ebf7725cc7447e6)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/lib/devtool/upgrade.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index a061f26076..834589f92b 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -582,6 +582,9 @@ def upgrade(args, config, basepath, workspace):
         logger.info('New recipe is %s' % rf)
         if license_diff:
             logger.info('License checksums have been updated in the new recipe; please refer to it for the difference between the old and the new license texts.')
+        preferred_version = rd.getVar('PREFERRED_VERSION_%s' % rd.getVar('PN'))
+        if preferred_version:
+            logger.warning('Version is pinned to %s via PREFERRED_VERSION; it may need adjustment to match the new version before any further steps are taken' % preferred_version)
     finally:
         tinfoil.shutdown()
     return 0
-- 
2.31.1

