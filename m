Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1StQa0-0004et-Ks
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jul 2012 23:54:16 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 Jul 2012 14:42:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="196972518"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.58])
	by fmsmga002.fm.intel.com with ESMTP; 23 Jul 2012 14:42:40 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jul 2012 22:42:28 +0100
Message-Id: <04a1b5ed1aa6db85a5442019b1f721bd5c0409e7.1343079550.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1343079550.git.paul.eggleton@linux.intel.com>
References: <cover.1343079550.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1343079550.git.paul.eggleton@linux.intel.com>
References: <cover.1343079550.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 5/6] classes/image: add staticdev-pkgs IMAGE_FEATURES feature
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
X-List-Received-Date: Mon, 23 Jul 2012 21:54:17 -0000

Add a staticdev-pkgs feature that can be added to IMAGE_FEATURES in
order to install all staticdev packages.

Fixes [YOCTO #2531].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/image.bbclass |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index ed531e3..429e883 100644
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



