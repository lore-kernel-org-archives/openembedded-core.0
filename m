Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DB27972A2D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 May 2015 19:55:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t47JtRJj025555
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 May 2015 12:55:27 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Thu, 7 May 2015 12:55:26 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 May 2015 12:55:26 -0700
Message-ID: <1431028526-7544-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 1/1] distro_features_check: add any of test
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
X-List-Received-Date: Thu, 07 May 2015 19:55:27 -0000
Content-Type: text/plain

Add a test for distro features including one or more
items in a list.  This is useful when, for example, we
need either x11 or directfb as a feature.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/classes/distro_features_check.bbclass |   13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta/classes/distro_features_check.bbclass b/meta/classes/distro_features_check.bbclass
index 1f1d6fb..7e91dbc 100644
--- a/meta/classes/distro_features_check.bbclass
+++ b/meta/classes/distro_features_check.bbclass
@@ -1,5 +1,7 @@
 # Allow checking of required and conflicting DISTRO_FEATURES
 #
+# ANY_OF_DISTRO_FEATURES:   ensure at least one item on this list is included
+#                           in DISTRO_FEATURES.
 # REQUIRED_DISTRO_FEATURES: ensure every item on this list is included
 #                           in DISTRO_FEATURES.
 # CONFLICT_DISTRO_FEATURES: ensure no item in this list is included in
@@ -8,10 +10,18 @@
 # Copyright 2013 (C) O.S. Systems Software LTDA.
 
 python () {
+    # Assume at least one var is set.
+    distro_features = (d.getVar('DISTRO_FEATURES', True) or "").split()
+
+    any_of_distro_features = d.getVar('ANY_OF_DISTRO_FEATURES', True)
+    if any_of_distro_features:
+        any_of_distro_features = any_of_distro_features.split()
+        if set.isdisjoint(set(any_of_distro_features),set(distro_features)):
+            raise bb.parse.SkipPackage("one of '%s' needs to be in DISTRO_FEATURES" % any_of_distro_features)
+
     required_distro_features = d.getVar('REQUIRED_DISTRO_FEATURES', True)
     if required_distro_features:
         required_distro_features = required_distro_features.split()
-        distro_features = (d.getVar('DISTRO_FEATURES', True) or "").split()
         for f in required_distro_features:
             if f in distro_features:
                 continue
@@ -21,7 +31,6 @@ python () {
     conflict_distro_features = d.getVar('CONFLICT_DISTRO_FEATURES', True)
     if conflict_distro_features:
         conflict_distro_features = conflict_distro_features.split()
-        distro_features = (d.getVar('DISTRO_FEATURES', True) or "").split()
         for f in conflict_distro_features:
             if f in distro_features:
                 raise bb.parse.SkipPackage("conflicting distro feature '%s' (in DISTRO_FEATURES)" % f)
-- 
1.7.9.5


