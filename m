Received: from mail-we0-f170.google.com ([74.125.82.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UEHLx-0003my-3h
	for openembedded-core@lists.openembedded.org;
	Sat, 09 Mar 2013 11:50:14 +0100
Received: by mail-we0-f170.google.com with SMTP id z53so1928903wey.15
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Mar 2013 02:33:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=oJTHodQMGbjQNCl1W1UcAoADVQ3TjhQ0VynjA4ckd68=;
	b=LKHmcXz2/eEXZkNhSYBAWG+7zmJg66GkIHbiYbRPup/gR8xX6waf4tDqIifVh6UlaR
	CJsfg7m+eAaZNYje9L81DDrnEZVgWpfZmMydEGWvD8FkcwpU0i1o1I2IlqeMYWucKlqi
	GCaEh17UqESLtqIZAySF7DT9syT/8PRWsHsU08y6Ml2xe/NqHNBjj7FKXQ8GwEuRakkr
	OthMoDJITErpoFNnFmXpi7L/mSyVuQDbjZAZoA8QN3U2BjtH2XqugDwiS5R/EIw07rg0
	2IBRVpT7ngQruzozWVwuL8hWfM/amlD4wn7Nc8VdcsGFsSghWcmG++BMm1GkuC+oAhdg
	Hjdg==
X-Received: by 10.180.105.99 with SMTP id gl3mr3059533wib.22.1362825218240;
	Sat, 09 Mar 2013 02:33:38 -0800 (PST)
Received: from flashheart.burtonini.com (92.40.254.42.threembb.co.uk.
	[92.40.254.42])
	by mx.google.com with ESMTPS id j4sm3270117wiz.10.2013.03.09.02.33.36
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 09 Mar 2013 02:33:37 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Mar 2013 10:33:25 +0000
Message-Id: <1362825205-6649-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQm3gZK+d0HsumwUSLt71T++4snJsnj/ZCesvu6bMxI8fa6MHGSUBkyGfsw/okcDHPniUfLl
Subject: [PATCH] base.bbclass: don't backfill features that already exist
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 09 Mar 2013 10:50:15 -0000

It's too easy to cause rebuilds because the DISTRO_FEATURES have changed in
meaningless ways (such as re-ordering or duplicate items).  Help stop this by
checking if the feature to be back-filled is already present.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/base.bbclass |    4 ++--
 meta/lib/oe/utils.py      |    8 +++-----
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 4d69caf..4ec1eda 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -292,8 +292,8 @@ python base_eventhandler() {
         e.data.setVar('BB_VERSION', bb.__version__)
         pkgarch_mapping(e.data)
         preferred_ml_updates(e.data)
-        e.data.appendVar('DISTRO_FEATURES', oe.utils.features_backfill("DISTRO_FEATURES", e.data))
-        e.data.appendVar('MACHINE_FEATURES', oe.utils.features_backfill("MACHINE_FEATURES", e.data))
+        oe.utils.features_backfill("DISTRO_FEATURES", e.data)
+        oe.utils.features_backfill("MACHINE_FEATURES", e.data)
 
     if isinstance(e, bb.event.BuildStarted):
         statuslines = []
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 8d3efe4..b269f32 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -96,16 +96,14 @@ def features_backfill(var,d):
     # disturbing distributions that have already set DISTRO_FEATURES.
     # Distributions wanting to elide a value in DISTRO_FEATURES_BACKFILL should
     # add the feature to DISTRO_FEATURES_BACKFILL_CONSIDERED
-
+    features = (d.getVar(var, True) or "").split()
     backfill = (d.getVar(var+"_BACKFILL", True) or "").split()
     considered = (d.getVar(var+"_BACKFILL_CONSIDERED", True) or "").split()
 
     addfeatures = []
     for feature in backfill:
-        if feature not in considered:
+        if feature not in features and feature not in considered:
             addfeatures.append(feature)
 
     if addfeatures:
-        return " %s" % (" ".join(addfeatures))
-    else:
-        return ""
+        d.appendVar(var, " " + " ".join(addfeatures))
-- 
1.7.10.4



