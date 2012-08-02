Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Swro1-0002yQ-1A
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 11:34:57 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 Aug 2012 02:23:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="129551550"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.75])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Aug 2012 02:23:18 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Aug 2012 10:23:07 +0100
Message-Id: <001d0bb5d09032699992123a4228adff24f90606.1343899228.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1343899228.git.paul.eggleton@linux.intel.com>
References: <cover.1343899228.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1343899228.git.paul.eggleton@linux.intel.com>
References: <cover.1343899228.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 7/9] buildhistory_analysis: tidy up duplicate split_version function
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Aug 2012 09:34:57 -0000

This function is now provided by bb.utils and since we have now bumped
the minimum bitbake version, we can switch to that one instead.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/buildhistory_analysis.py |   20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index 55bd7b7..a1a0408 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -261,24 +261,6 @@ def compare_lists(alines, blines):
     return filechanges
 
 
-def split_version(s):
-    """Split a version string into its constituent parts (PE, PV, PR)
-    FIXME: this is a duplicate of a new function in bitbake/lib/bb/utils -
-    we should switch to that once we can bump the minimum bitbake version
-    """
-    s = s.strip(" <>=")
-    e = 0
-    if s.count(':'):
-        e = int(s.split(":")[0])
-        s = s.split(":")[1]
-    r = ""
-    if s.count('-'):
-        r = s.rsplit("-", 1)[1]
-        s = s.rsplit("-", 1)[0]
-    v = s
-    return (e, v, r)
-
-
 def compare_pkg_lists(astr, bstr):
     depvera = bb.utils.explode_dep_versions(astr)
     depverb = bb.utils.explode_dep_versions(bstr)
@@ -290,7 +272,7 @@ def compare_pkg_lists(astr, bstr):
             dva = depvera[k]
             dvb = depverb[k]
             if dva and dvb and dva != dvb:
-                if bb.utils.vercmp(split_version(dva), split_version(dvb)) < 0:
+                if bb.utils.vercmp(bb.utils.split_version(dva), bb.utils.split_version(dvb)) < 0:
                     remove.append(k)
 
     for k in remove:
-- 
1.7.9.5



