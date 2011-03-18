Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Q0Zyq-0005bI-H2
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Mar 2011 14:44:42 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 18 Mar 2011 06:41:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,205,1299484800"; d="scan'208";a="721605340"
Received: from unknown (HELO localhost) ([10.255.16.25])
	by orsmga001.jf.intel.com with ESMTP; 18 Mar 2011 06:41:36 -0700
Message-Id: <7783b3cb5e880f7c6cdebf21599411bfec862972.1300455579.git.josh@linux.intel.com>
In-Reply-To: <cover.1300455579.git.josh@linux.intel.com>
References: <cover.1300455579.git.josh@linux.intel.com>
Old-Date: Fri, 18 Mar 2011 13:28:42 +0000
Date: Fri, 18 Mar 2011 13:41:30 +0000
To: openembedded-core@lists.openembedded.org
CC: 
From: Joshua Lock <josh@linux.intel.com>
Subject: [PATCH 1/1] sanity.bbclass: check for duplicates in PACKAGE_ARCHS
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
X-List-Received-Date: Fri, 18 Mar 2011 13:44:43 -0000

From: Joshua Lock <josh@linux.intel.com>

Duplicate entries in PACKAGE_ARCHS causes problems with rootfs
generation. For example multiple architecture entries in opkg.conf
will confuse the opkg package manager.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/classes/sanity.bbclass |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 6e13d2a..639e1ea 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -338,6 +338,19 @@ def check_sanity(e):
     elif oeroot.find (' ') != -1:
         messages = messages + "Error, you have a space in your POKYBASE directory path. Please move Poky to a directory which doesn't include a space."
 
+    # Check that we don't have duplicate entries in PACKAGE_ARCHS
+    pkgarchs = data.getVar('PACKAGE_ARCHS', e.data, True)
+    seen = {}
+    dups = []
+
+    for pa in pkgarchs.split():
+    	if seen.get(pa, 0) == 1:
+	    dups.append(pa)
+	else:
+	    seen[pa] = 1
+    if len(dups):
+       messages = messages + "Error, the PACKAGE_ARCHS variable contains duplicates. The following archs are listed more than once: %s" % " ".join(dups)
+
     if messages != "":
         raise_sanity_error(messages)
 
-- 
1.7.4



