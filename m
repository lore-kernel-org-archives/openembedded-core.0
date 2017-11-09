Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 12234785AF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 16:58:47 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga105.fm.intel.com with ESMTP; 09 Nov 2017 08:58:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,370,1505804400"; 
   d="scan'208";a="3077230"
Received: from scetola-mac01.jf.intel.com ([10.54.74.124])
	by orsmga001.jf.intel.com with ESMTP; 09 Nov 2017 08:58:47 -0800
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Nov 2017 08:58:27 -0800
Message-Id: <20171109165829.41508-3-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171109165829.41508-1-stephano.cetola@linux.intel.com>
References: <20171109165829.41508-1-stephano.cetola@linux.intel.com>
MIME-Version: 1.0
Subject: [rocko][PATCH 2/4] masterimage.py: fix stop()
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
X-List-Received-Date: Thu, 09 Nov 2017 16:58:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Erik Botö <erik.boto@pelagicore.com>

The stop() function is called in the context of the masterimage,
so self.master should be used instead of self.connection which is
undefined at that time.

[YOCTO #11524]

Signed-off-by: Erik Botö <erik.boto@pelagicore.com>
Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
---
 meta/lib/oeqa/controllers/masterimage.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/controllers/masterimage.py b/meta/lib/oeqa/controllers/masterimage.py
index fe90967923..e2ff3f12c2 100644
--- a/meta/lib/oeqa/controllers/masterimage.py
+++ b/meta/lib/oeqa/controllers/masterimage.py
@@ -156,7 +156,7 @@ class MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget, metaclass=ABCMeta
 
     def stop(self):
         bb.plain("%s - reboot/powercycle target" % self.pn)
-        self.power_cycle(self.connection)
+        self.power_cycle(self.master)
 
 
 class SystemdbootTarget(MasterImageHardwareTarget):
-- 
2.14.2


