Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id B52E571A19
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 22:05:25 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 12 Dec 2016 14:05:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,338,1477983600"; d="scan'208";a="1080938880"
Received: from mauric9x-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.158.7])
	by fmsmga001.fm.intel.com with ESMTP; 12 Dec 2016 14:05:22 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Dec 2016 11:05:05 +1300
Message-Id: <18d260f575f3463216016834f1cdff367d714180.1481579713.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1481579713.git.paul.eggleton@linux.intel.com>
References: <cover.1481579713.git.paul.eggleton@linux.intel.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: [PATCH 1/2] lib/oe/rootfs: fix log_check warnings being printed twice with RPM packaging
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 12 Dec 2016 22:05:28 -0000

We were calling _log_check() in the RPM-specific rootfs class as well as
in the base class; this is unnecessary and resulted in any errors/warnings
generated during the actual package installation time triggering two warnings
instead of one. Drop the call from RpmRootfs._create() to fix this.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/rootfs.py | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index a348b97..ed40b23 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -477,8 +477,6 @@ class RpmRootfs(Rootfs):
 
         execute_pre_post_process(self.d, rpm_post_process_cmds)
 
-        self._log_check()
-
         if self.inc_rpm_image_gen == "1":
             self.pm.backup_packaging_data()
 
-- 
2.5.5


