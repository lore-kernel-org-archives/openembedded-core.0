Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0145060053
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 13:42:06 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 08 Sep 2015 06:42:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,490,1437462000"; d="scan'208";a="800637728"
Received: from jdkarpin-mobl4.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.5.153])
	by fmsmga002.fm.intel.com with ESMTP; 08 Sep 2015 06:42:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Sep 2015 14:41:50 +0100
Message-Id: <13fe49e007b2b2bd0dad6f799813af46b24d7b4e.1441719081.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1441719081.git.paul.eggleton@linux.intel.com>
References: <cover.1441719081.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1441719081.git.paul.eggleton@linux.intel.com>
References: <cover.1441719081.git.paul.eggleton@linux.intel.com>
Subject: [RFC PATCH 1/3] classes/sstate: break out function to get sstate manifest filename
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
X-List-Received-Date: Tue, 08 Sep 2015 13:42:07 -0000

It is useful in a few different contexts to see which files have been
written out by an sstate task; break out a function that lets us get the
path to the manifest file easily.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/sstate.bbclass |  7 ++-----
 meta/lib/oe/sstatesig.py    | 12 ++++++++++++
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 77313bc..b75700eb 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -157,17 +157,14 @@ def sstate_add(ss, source, dest, d):
 
 def sstate_install(ss, d):
     import oe.path
+    import oe.sstatesig
     import subprocess
 
     sharedfiles = []
     shareddirs = []
     bb.utils.mkdirhier(d.expand("${SSTATE_MANIFESTS}"))
 
-    d2 = d.createCopy()
-    extrainf = d.getVarFlag("do_" + ss['task'], 'stamp-extra-info', True)
-    if extrainf:
-        d2.setVar("SSTATE_MANMACH", extrainf)
-    manifest = d2.expand("${SSTATE_MANFILEPREFIX}.%s" % ss['task'])
+    manifest, d2 = oe.sstatesig.sstate_get_manifest_filename(ss['task'], d)
 
     if os.access(manifest, os.R_OK):
         bb.fatal("Package already staged (%s)?!" % manifest)
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 9d6d7c4..cb46712 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -277,3 +277,15 @@ def find_siginfo(pn, taskname, taskhashlist, d):
         return filedates
 
 bb.siggen.find_siginfo = find_siginfo
+
+
+def sstate_get_manifest_filename(task, d):
+    """
+    Return the sstate manifest file path for a particular task.
+    Also returns the datastore that can be used to query related variables.
+    """
+    d2 = d.createCopy()
+    extrainf = d.getVarFlag("do_" + task, 'stamp-extra-info', True)
+    if extrainf:
+        d2.setVar("SSTATE_MANMACH", extrainf)
+    return (d2.expand("${SSTATE_MANFILEPREFIX}.%s" % task), d2)
-- 
2.1.0


