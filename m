Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RDkum-0003XV-CZ
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Oct 2011 00:35:12 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 11 Oct 2011 15:29:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,525,1312182000"; d="scan'208";a="72530512"
Received: from unknown (HELO scimitar.amr.corp.intel.com) ([10.255.15.64])
	by fmsmga001.fm.intel.com with ESMTP; 11 Oct 2011 15:29:28 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Oct 2011 15:29:22 -0700
Message-Id: <8ed04d4eed9093c6cb12303ffe1efd0eadaa7df2.1318371066.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1318371066.git.josh@linux.intel.com>
References: <cover.1318371066.git.josh@linux.intel.com>
In-Reply-To: <cover.1318371066.git.josh@linux.intel.com>
References: <cover.1318371066.git.josh@linux.intel.com>
Subject: [RFC PATCH 1/1] insane.bbclass: add qa check to ensure declared packages exist
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
X-List-Received-Date: Tue, 11 Oct 2011 22:35:12 -0000

This patch adds an extra package sanity check to test whether any extra
packages defined by the recipe (i.e. anything other than -dev, -dbg, -doc,
-staticdev and -locale packages) are actually created.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/classes/insane.bbclass |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index b861e85..ccc0d1c 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -520,6 +520,8 @@ python do_package_qa () {
     g = globals()
     walk_sane = True
     rdepends_sane = True
+    exists = True
+
     for package in packages.split():
         skip = (bb.data.getVar('INSANE_SKIP_' + package, d, True) or "").split()
         if skip:
@@ -539,13 +541,18 @@ python do_package_qa () {
 
         bb.note("Checking Package: %s" % package)
         path = "%s/%s" % (pkgdest, package)
+        if not package.endswith("-dev") and not package.endswith("-dbg") and not package.endswith("-doc") and not package.endswith("-staticdev") and not package.endswith("-locale"):
+            contents_len = os.listdir(path)
+            if not contents_len:
+                bb.error("QA Issue: PACKAGE %s defined but not created" % package)
+                exists = False
         if not package_qa_walk(path, warnchecks, errorchecks, skip, package, d):
             walk_sane  = False
         if not package_qa_check_rdepends(package, pkgdest, skip, d):
             rdepends_sane = False
 
 
-    if not walk_sane or not rdepends_sane:
+    if not walk_sane or not rdepends_sane or not exists:
         bb.fatal("QA run found fatal errors. Please consider fixing them.")
     bb.note("DONE with PACKAGE QA")
 }
-- 
1.7.6.4



