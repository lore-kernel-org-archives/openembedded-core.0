Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id F1D0478679
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Dec 2017 02:35:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vB72ZOCp007176
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Dec 2017 18:35:24 -0800
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Wed, 6 Dec 2017 18:35:24 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Dec 2017 10:33:28 +0800
Message-ID: <a590f7d1cd73422e5f2b8c7c40ed1404e6c45539.1512613370.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1512613370.git.jackie.huang@windriver.com>
References: <cover.1512613370.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] features_backfill: fix for multilib
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
X-List-Received-Date: Thu, 07 Dec 2017 02:35:24 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The backfilling feature doesn't work for multilib,

e.g. build with:
MACHINE = "qemumips64"
MULTILIB_GLOBAL_VARIANTS_append = " libn32"
MULTILIBS = "multilib:libn32"
DEFAULTTUNE_virtclass-multilib-libn32 ?= "mips64-n32"
require conf/multilib.conf

And we have backfill_considered in machine/include/mips/arch-mips.inc:
MACHINE_FEATURES_BACKFILL_CONSIDERED_append = "${@bb.utils.contains('TUNE_FEATURES', 'n32', 'qemu-usermode', '', d)}"

For libn32 builds, 'qemu-usermode' is not expected but it still
presents in MACHINE_FEATURES.

To fix the issue:
* Change the oe.utils.features_backfill to always compare with the
  original features(before backfilled), so we can run the function
  multiple times when needed.

* run oe.utils.features_backfill at the end of multilib_virtclass_handler
  to update the backfilled features to ensure it's correct for multilib.

[YOCTO #12373]

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/classes/multilib.bbclass | 4 ++++
 meta/lib/oe/utils.py          | 9 +++++++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 816f54e..589ee37 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -77,6 +77,10 @@ python multilib_virtclass_handler () {
     if newtune:
         e.data.setVar("DEFAULTTUNE", newtune)
         e.data.setVar('DEFAULTTUNE_ML_%s' % variant, newtune)
+
+    # Update the backfilled features after DEFAULTTUNE changed
+    oe.utils.features_backfill("DISTRO_FEATURES", e.data)
+    oe.utils.features_backfill("MACHINE_FEATURES", e.data)
 }
 
 addhandler multilib_virtclass_handler
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 1897c5f..371acd0 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -107,13 +107,18 @@ def features_backfill(var,d):
     backfill = (d.getVar(var+"_BACKFILL") or "").split()
     considered = (d.getVar(var+"_BACKFILL_CONSIDERED") or "").split()
 
+    features_original = (d.getVar(var + "_ORIGINAL") or "").split()
+    if not features_original:
+        features_original = features
+        d.setVar(var + "_ORIGINAL", " ".join(features_original))
+
     addfeatures = []
     for feature in backfill:
-        if feature not in features and feature not in considered:
+        if feature not in features_original and feature not in considered:
             addfeatures.append(feature)
 
     if addfeatures:
-        d.appendVar(var, " " + " ".join(addfeatures))
+        d.setVar(var, " ".join(features_original) + " " + " ".join(addfeatures))
 
 def all_distro_features(d, features, truevalue="1", falsevalue=""):
     """
-- 
1.9.1


