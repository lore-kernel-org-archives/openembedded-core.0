Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UO9GN-0005M1-4a
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Apr 2013 18:13:18 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 05 Apr 2013 08:55:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,415,1363158000"; d="scan'208";a="281341076"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.14.34])
	by azsmga001.ch.intel.com with ESMTP; 05 Apr 2013 08:55:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Apr 2013 16:55:52 +0100
Message-Id: <1365177352-19056-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] lib/oe/classextend.py: avoid extending any kernel package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Apr 2013 16:13:18 -0000

For multilib and other uses of classextend, we don't want any
dependencies on kernel packages to be extended since there should only
be one kernel variant.

Fixes [YOCTO #2918] (where kernel-dev was being extended.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/classextend.py |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/classextend.py b/meta/lib/oe/classextend.py
index c37a896..e2ae7e9 100644
--- a/meta/lib/oe/classextend.py
+++ b/meta/lib/oe/classextend.py
@@ -5,7 +5,7 @@ class ClassExtender(object):
         self.pkgs_mapping = []
 
     def extend_name(self, name):
-        if name.startswith("kernel-module") or name == "virtual/kernel":
+        if name.startswith("kernel-") or name == "virtual/kernel":
             return name
         if name.startswith("rtld"):
             return name
-- 
1.7.10.4



