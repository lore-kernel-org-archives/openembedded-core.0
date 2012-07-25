Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Su6jC-0008Jb-UR
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 20:54:35 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 25 Jul 2012 11:43:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="173137552"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.21])
	by azsmga001.ch.intel.com with ESMTP; 25 Jul 2012 11:43:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jul 2012 19:42:56 +0100
Message-Id: <7fed87a95b1df61b3ea8a4f09e85804f539e1ef6.1343241383.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1343241383.git.paul.eggleton@linux.intel.com>
References: <cover.1343241383.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1343241383.git.paul.eggleton@linux.intel.com>
References: <cover.1343241383.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 6/7] classes/image: add staticdev-pkgs IMAGE_FEATURES feature
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
X-List-Received-Date: Wed, 25 Jul 2012 18:54:35 -0000

Add a staticdev-pkgs feature that can be added to IMAGE_FEATURES in
order to install all staticdev packages.

Fixes [YOCTO #2531].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/image.bbclass |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 2c605bf..9bdb15e 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -35,7 +35,7 @@ NORMAL_FEATURE_INSTALL_OPTIONAL = "${@' '.join(oe.packagegroup.optional_packages
 
 def normal_groups(d):
     """Return all the IMAGE_FEATURES, with the exception of our special package groups"""
-    extras = set(['dev-pkgs', 'doc-pkgs', 'dbg-pkgs'])
+    extras = set(['dev-pkgs', 'staticdev-pkgs', 'doc-pkgs', 'dbg-pkgs'])
     features = set(oe.data.typed_value('IMAGE_FEATURES', d))
     return features.difference(extras)
 
@@ -47,6 +47,8 @@ def complementary_globs(featurevar, d):
     for feature in features:
         if feature == 'dev-pkgs':
             globs.append('*-dev')
+        elif feature == 'staticdev-pkgs':
+            globs.append('*-staticdev')
         elif feature == 'doc-pkgs':
             globs.append('*-doc')
         elif feature == 'dbg-pkgs':
-- 
1.7.9.5



