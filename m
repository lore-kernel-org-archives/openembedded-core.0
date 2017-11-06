Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id BC63C78452
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Nov 2017 18:13:24 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Nov 2017 10:13:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,353,1505804400"; 
   d="scan'208";a="4057102"
Received: from scetola-mac01.jf.intel.com ([10.54.74.141])
	by orsmga002.jf.intel.com with ESMTP; 06 Nov 2017 10:13:09 -0800
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Nov 2017 10:13:04 -0800
Message-Id: <20171106181306.3042-3-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171106181306.3042-1-stephano.cetola@linux.intel.com>
References: <20171106181306.3042-1-stephano.cetola@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] masterimage.py: fix stop()
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
X-List-Received-Date: Mon, 06 Nov 2017 18:13:25 -0000
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


