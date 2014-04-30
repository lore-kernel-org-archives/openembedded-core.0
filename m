Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 17E1660144
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Apr 2014 12:41:56 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 30 Apr 2014 05:32:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,958,1389772800"; d="scan'208";a="531267775"
Received: from cgwithan-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.50])
	by fmsmga002.fm.intel.com with ESMTP; 30 Apr 2014 05:32:19 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Apr 2014 13:31:58 +0100
Message-Id: <47e34e047c5193bc1d175c2fdae9e5b2d0f7cd35.1398861075.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1398861075.git.paul.eggleton@linux.intel.com>
References: <cover.1398861075.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1398861075.git.paul.eggleton@linux.intel.com>
References: <cover.1398861075.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/8] oeqa/targetcontrol: restart method shouldn't be abstract
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
X-List-Received-Date: Wed, 30 Apr 2014 12:41:57 -0000

From: Stefan Stanacar <stefanx.stanacar@intel.com>

And drop the un-needed and un-used restart methods.
Only qemu ever used this and actually does it safely.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/controllers/masterimage.py | 3 ---
 meta/lib/oeqa/targetcontrol.py           | 7 ++-----
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/controllers/masterimage.py b/meta/lib/oeqa/controllers/masterimage.py
index 1bd0ab4..e8d321f 100644
--- a/meta/lib/oeqa/controllers/masterimage.py
+++ b/meta/lib/oeqa/controllers/masterimage.py
@@ -133,9 +133,6 @@ class MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget):
         bb.plain("%s - reboot/powercycle target" % self.pn)
         self.power_cycle(self.connection)
 
-    def restart(self):
-        pass
-
 
 class GummibootTarget(MasterImageHardwareTarget):
 
diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 873a664..02cb370 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -70,9 +70,9 @@ class BaseTarget(object):
     def stop(self):
         pass
 
-    @abstractmethod
     def restart(self, params=None):
-        pass
+        self.stop()
+        self.start(params)
 
     def run(self, cmd, timeout=None):
         return self.connection.run(cmd, timeout)
@@ -170,6 +170,3 @@ class SimpleRemoteTarget(BaseTarget):
         self.connection = None
         self.ip = None
         self.server_ip = None
-
-    def restart(self, params=None):
-        pass
-- 
1.9.0


