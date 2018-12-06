Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 47CCD79203
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Dec 2018 13:43:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wB6DhMuK012593
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Dec 2018 05:43:33 -0800
Received: from pek-kkang-d1.wrs.com (128.224.163.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Thu, 6 Dec 2018 05:43:12 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 6 Dec 2018 21:41:39 +0800
Message-ID: <226bbb49f1868d91cb552ce0ad3fe8ee3bf26f04.1544100963.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1544100963.git.kai.kang@windriver.com>
References: <cover.1544100963.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] distro_features_check.bbclass: show all error info at one time
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
X-List-Received-Date: Thu, 06 Dec 2018 13:43:42 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

In distro_features_check.bbclass it checks whether items in
REQUIRED_DISTRO_FEATURES and CONFLICT_DISTRO_FEATURES exist in
DISTRO_FEATURES. But it only shows one required or conflict distro
feature when error occurs. Update to show them all at one time.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/classes/distro_features_check.bbclass | 29 +++++++++-------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/meta/classes/distro_features_check.bbclass b/meta/classes/distro_features_check.bbclass
index 9b78b03ef6..eeaa3b44cb 100644
--- a/meta/classes/distro_features_check.bbclass
+++ b/meta/classes/distro_features_check.bbclass
@@ -11,27 +11,22 @@
 
 python () {
     # Assume at least one var is set.
-    distro_features = (d.getVar('DISTRO_FEATURES') or "").split()
+    distro_features = set((d.getVar('DISTRO_FEATURES') or '').split())
 
-    any_of_distro_features = d.getVar('ANY_OF_DISTRO_FEATURES')
+    any_of_distro_features = set((d.getVar('ANY_OF_DISTRO_FEATURES') or '').split())
     if any_of_distro_features:
-        any_of_distro_features = any_of_distro_features.split()
-        if set.isdisjoint(set(any_of_distro_features),set(distro_features)):
-            raise bb.parse.SkipRecipe("one of '%s' needs to be in DISTRO_FEATURES" % any_of_distro_features)
+        if set.isdisjoint(any_of_distro_features, distro_features):
+            raise bb.parse.SkipRecipe("one of '%s' needs to be in DISTRO_FEATURES" % ' '.join(any_of_distro_features))
 
-    required_distro_features = d.getVar('REQUIRED_DISTRO_FEATURES')
+    required_distro_features = set((d.getVar('REQUIRED_DISTRO_FEATURES') or '').split())
     if required_distro_features:
-        required_distro_features = required_distro_features.split()
-        for f in required_distro_features:
-            if f in distro_features:
-                continue
-            else:
-                raise bb.parse.SkipRecipe("missing required distro feature '%s' (not in DISTRO_FEATURES)" % f)
+        missing = set.difference(required_distro_features, distro_features)
+        if missing:
+            raise bb.parse.SkipRecipe("missing required distro feature%s '%s' (not in DISTRO_FEATURES)" % ('s' if len(missing) > 1 else '', ' '.join(missing)))
 
-    conflict_distro_features = d.getVar('CONFLICT_DISTRO_FEATURES')
+    conflict_distro_features = set((d.getVar('CONFLICT_DISTRO_FEATURES') or '').split())
     if conflict_distro_features:
-        conflict_distro_features = conflict_distro_features.split()
-        for f in conflict_distro_features:
-            if f in distro_features:
-                raise bb.parse.SkipRecipe("conflicting distro feature '%s' (in DISTRO_FEATURES)" % f)
+        conflicts = set.intersection(conflict_distro_features, distro_features)
+        if conflicts:
+            raise bb.parse.SkipRecipe("conflicting distro feature%s '%s' (in DISTRO_FEATURES)" % ('s' if len(conflicts) > 1 else '', ' '.join(conflicts)))
 }
-- 
2.19.0.rc2


