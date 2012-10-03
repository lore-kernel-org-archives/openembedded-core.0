Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TJOP6-0000ED-5Y
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 14:50:20 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 03 Oct 2012 05:37:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,527,1344236400"; d="scan'208";a="219071500"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.52])
	by orsmga002.jf.intel.com with ESMTP; 03 Oct 2012 05:37:19 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Oct 2012 13:37:15 +0100
Message-Id: <f6110021596825f3877f3e0f973a188599e5ea19.1349267792.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1349267792.git.paul.eggleton@linux.intel.com>
References: <cover.1349267792.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1349267792.git.paul.eggleton@linux.intel.com>
References: <cover.1349267792.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] buildhistory_analysis: update to use explode_dep_versions2()
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
X-List-Received-Date: Wed, 03 Oct 2012 12:50:20 -0000

Handle where multiple version specifications are present for the same
dependency.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/buildhistory_analysis.py |   23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index a5a607e..ad57f00 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -262,8 +262,8 @@ def compare_lists(alines, blines):
 
 
 def compare_pkg_lists(astr, bstr):
-    depvera = bb.utils.explode_dep_versions(astr)
-    depverb = bb.utils.explode_dep_versions(bstr)
+    depvera = bb.utils.explode_dep_versions2(astr)
+    depverb = bb.utils.explode_dep_versions2(bstr)
 
     # Strip out changes where the version has increased
     remove = []
@@ -271,8 +271,23 @@ def compare_pkg_lists(astr, bstr):
         if k in depverb:
             dva = depvera[k]
             dvb = depverb[k]
-            if dva and dvb and dva != dvb:
-                if bb.utils.vercmp(bb.utils.split_version(dva), bb.utils.split_version(dvb)) < 0:
+            if dva and dvb and len(dva) == len(dvb):
+                # Since length is the same, sort so that prefixes (e.g. >=) will line up
+                dva.sort()
+                dvb.sort()
+                removeit = True
+                for dvai, dvbi in zip(dva, dvb):
+                    if dvai != dvbi:
+                        aiprefix = dvai.split(' ')[0]
+                        biprefix = dvbi.split(' ')[0]
+                        if aiprefix == biprefix and aiprefix in ['>=', '=']:
+                            if bb.utils.vercmp(bb.utils.split_version(dvai), bb.utils.split_version(dvbi)) > 0:
+                                removeit = False
+                                break
+                        else:
+                            removeit = False
+                            break
+                if removeit:
                     remove.append(k)
 
     for k in remove:
-- 
1.7.9.5



