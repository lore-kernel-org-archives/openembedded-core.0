Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qnn7J-0006ZU-GD
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 09:40:49 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 01 Aug 2011 00:36:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,299,1309762800"; d="scan'208";a="34147076"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.76])
	by orsmga001.jf.intel.com with ESMTP; 01 Aug 2011 00:36:21 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Aug 2011 00:36:04 -0700
Message-Id: <f215d757b3ee8163f5a1a6925968c39b2eea7673.1312182844.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312182844.git.sgw@linux.intel.com>
References: <cover.1312182844.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312182844.git.sgw@linux.intel.com>
References: <cover.1312182844.git.sgw@linux.intel.com>
Subject: [PATCH 12/22] sanity.bbclass: Add sanity check that TUNE_PKGARCH appears in PACKAGE_ARCHS
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
X-List-Received-Date: Mon, 01 Aug 2011 07:40:49 -0000

From: Kumar Gala <galak@kernel.crashing.org>

Its possible we get duplications if we explicity add TUNE_PKGARCH to
PACKAGE_ARCHS so instead just add a sanity check to verify it.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 meta/classes/sanity.bbclass |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index b054146..999e15d 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -375,8 +375,10 @@ def check_sanity(e):
     elif oeroot.find (' ') != -1:
         messages = messages + "Error, you have a space in your COREBASE directory path. Please move the installation to a directory which doesn't include a space."
 
-    # Check that we don't have duplicate entries in PACKAGE_ARCHS
+    # Check that we don't have duplicate entries in PACKAGE_ARCHS & that TUNE_PKGARCH is in PACKAGE_ARCHS
     pkgarchs = data.getVar('PACKAGE_ARCHS', e.data, True)
+    tunepkg = data.getVar('TUNE_PKGARCH', e.data, True)
+    tunefound = False
     seen = {}
     dups = []
 
@@ -385,9 +387,15 @@ def check_sanity(e):
 	    dups.append(pa)
 	else:
 	    seen[pa] = 1
+	if pa == tunepkg:
+	    tunefound = True
+
     if len(dups):
        messages = messages + "Error, the PACKAGE_ARCHS variable contains duplicates. The following archs are listed more than once: %s" % " ".join(dups)
 
+    if tunefound == False:
+       messages = messages + "Error, the PACKAGE_ARCHS variable does not contain TUNE_PKGARCH (%s)." % tunepkg
+
     if messages != "":
         raise_sanity_error(messages)
 
-- 
1.7.3.4



