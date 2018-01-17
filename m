Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DA9287860E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 05:46:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w0H5kgsM002414
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jan 2018 21:46:42 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 16 Jan 2018 21:46:41 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Jan 2018 13:44:18 +0800
Message-ID: <26531b875fdbb802de8ab5953e2f6967db021698.1516167783.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1516167783.git.jackie.huang@windriver.com>
References: <cover.1516167783.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1 v2] features_backfill: fix for multilib
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
X-List-Received-Date: Wed, 17 Jan 2018 05:46:41 -0000
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
index dc0868be3e..8e2cd57eec 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -76,6 +76,10 @@ python multilib_virtclass_handler () {
     newtune = e.data.getVar("DEFAULTTUNE_" + "virtclass-multilib-" + variant, False)
     if newtune:
         e.data.setVar("DEFAULTTUNE", newtune)
+
+    # Update the backfilled features after DEFAULTTUNE changed
+    oe.utils.features_backfill("DISTRO_FEATURES", e.data)
+    oe.utils.features_backfill("MACHINE_FEATURES", e.data)
 }
 
 addhandler multilib_virtclass_handler
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 7a79d752b6..b6c10424e7 100644
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
2.11.0


