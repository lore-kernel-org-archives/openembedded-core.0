Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SoGMn-000659-Il
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 17:59:17 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jul 2012 08:48:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="190292917"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.157])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jul 2012 08:48:02 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jul 2012 08:47:40 -0700
Message-Id: <e9bdb70774aedc8b1149230b6770ffffdf40663f.1341802889.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1341802889.git.sgw@linux.intel.com>
References: <cover.1341802889.git.sgw@linux.intel.com>
In-Reply-To: <cover.1341802889.git.sgw@linux.intel.com>
References: <cover.1341802889.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 26/41] utils.bbclass: add helper function to add all multilib variants of a specific package
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
X-List-Received-Date: Mon, 09 Jul 2012 16:12:21 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This is useful for the scenario where we want to add 'gcc' to
the root file system for all multilib variants

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/classes/utils.bbclass |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index f8b09b4..ccf78fc 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -325,6 +325,15 @@ def extend_variants(d, var, extend, delim=':'):
 			variants.append(eext[1])
 	return " ".join(variants)
 
+def multilib_pkg_extend(d, pkg):
+	variants = (d.getVar("MULTILIB_VARIANTS", True) or "").split()
+	if not variants:
+	    return pkg
+	pkgs = pkg
+	for v in variants:
+	    pkgs = pkgs + " " + v + "-" + pkg
+	return pkgs
+
 def all_multilib_tune_values(d, var, unique = True, need_split = True, delim = ' '):
 	"""Return a string of all ${var} in all multilib tune configuration"""
 	values = []
-- 
1.7.7.6



