Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S0eR2-0003ZM-By
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 20:34:36 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 23 Feb 2012 11:26:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="69619522"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.61])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Feb 2012 11:26:13 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 19:26:09 +0000
Message-Id: <f7ac4b5a19670d88441b120cdbab19101d6a3a65.1330025054.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1330025054.git.paul.eggleton@linux.intel.com>
References: <cover.1330025054.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1330025054.git.paul.eggleton@linux.intel.com>
References: <cover.1330025054.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] conf/bitbake.conf: add DISTRO_FEATURES_BACKFILL
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
X-List-Received-Date: Thu, 23 Feb 2012 19:34:36 -0000

When introducing new items to DISTRO_FEATURES that control functionality
that is already enabled, in order to leave existing distro configuration
unchanged we need a way to "backfill" these new feature items onto the
existing DISTRO_FEATURES value.

This introduces a DISTRO_FEATURES_BACKFILL variable whose items will be
added to the end of DISTRO_FEATURES, unless they also appear in
DISTRO_FEATURES_BACKFILL_CONSIDERED which distros can use in their
configuration to prevent specific items from being added.

Fixes [YOCTO #1946].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/conf/bitbake.conf |    3 +++
 meta/lib/oe/utils.py   |   20 ++++++++++++++++++++
 2 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 90e5f7a..2539ae0 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -694,6 +694,9 @@ MACHINE_ESSENTIAL_EXTRA_RDEPENDS ?= ""
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?= ""
 IMAGE_FEATURES += "${EXTRA_IMAGE_FEATURES}"
 
+DISTRO_FEATURES_BACKFILL = ""
+DISTRO_FEATURES_append = "${@oe.utils.distro_features_backfill(d)}"
+
 COMBINED_FEATURES = "\
     ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "alsa", d)} \
     ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "bluetooth", d)} \
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 95daace..2aaed3a 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -88,3 +88,23 @@ def param_bool(cfg, field, dflt = None):
 def inherits(d, *classes):
     """Return True if the metadata inherits any of the specified classes"""
     return any(bb.data.inherits_class(cls, d) for cls in classes)
+
+def distro_features_backfill(d):
+    # This construct allows the addition of new features to DISTRO_FEATURES
+    # that if not present would disable existing functionality, without
+    # disturbing distributions that have already set DISTRO_FEATURES.
+    # Distributions wanting to elide a value in DISTRO_FEATURES_BACKFILL should
+    # add the feature to DISTRO_FEATURES_BACKFILL_CONSIDERED
+
+    backfill = (d.getVar("DISTRO_FEATURES_BACKFILL", True) or "").split()
+    considered = (d.getVar("DISTRO_FEATURES_BACKFILL_CONSIDERED", True) or "").split()
+
+    addfeatures = []
+    for feature in backfill:
+        if feature not in considered:
+            addfeatures.append(feature)
+
+    if addfeatures:
+        return " %s" % (" ".join(addfeatures))
+    else:
+        return ""
-- 
1.7.5.4



