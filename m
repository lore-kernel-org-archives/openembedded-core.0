Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f46.google.com (mail-yh0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id 3AEAF6B426
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 01:11:56 +0000 (UTC)
Received: by mail-yh0-f46.google.com with SMTP id i57so62687yha.33
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 18:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=a7AX6crs8b0kLgBH11mL+/xud8NfNJ2pHRvBDUvKItA=;
	b=hh1rpLNfEKRWxni1A4uXjsivmHoMUd8Z96E17Z7l2xJeQ981+GtC5MOuU6477ZH+t0
	6GsoXPrMnCweKKBO/+SpsX5wIXEzL7eLoOhzQgvGIm1Ud3nMtyq+l2fEtB0VNY2ruERC
	I4e+LV0EOSrqwrijIyypt8VWsSY/qNfop3ZoZ3WZu4n/1mPPk2vV+kUz7ocDLZ2UAHj7
	W1CIJECpM1fAH480EcWho30AofjyqTzicsWeRTS+lQ+2HCVYW2r2gXAl3byCQ8tCZ31W
	onb5uoGcl8AYUQLbeR8VcEVH7WeX4UY/Dteh2G51wJSplGT5oaX6ILxhqdcWcX7rh8yZ
	6Q8g==
X-Received: by 10.236.199.242 with SMTP id x78mr7134813yhn.150.1375233116233; 
	Tue, 30 Jul 2013 18:11:56 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([187.23.155.55])
	by mx.google.com with ESMTPSA id
	v61sm38721192yhp.24.2013.07.30.18.11.54 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 30 Jul 2013 18:11:55 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 30 Jul 2013 22:11:30 -0300
Message-Id: <1375233090-5072-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.3.2
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2] base.bbclass: Add support to EXTRA_DISTRO_FEATURES
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
X-List-Received-Date: Wed, 31 Jul 2013 01:11:56 -0000

This allow the addition and removal of distro features easily. To add
a feature, use:

 EXTRA_DISTRO_FEATURES += "wayland"

and to remove, use '~' prefix, as:

 EXTRA_DISTRO_FEATURES += "~x11"

This code has been mostly copied from Mentor Graphics public layer but
changed the variable name for a more descriptive name. The original
code can be seen at user_feature.bbclass at:

 http://git.yoctoproject.org/cgit/cgit.cgi/meta-mentor

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
Changes for v2:
- Use data copy to fix wrong prepend/append expanding.

 meta/classes/base.bbclass |  4 ++++
 meta/lib/oe/utils.py      | 21 +++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 9c92e0b..83f6458 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -298,6 +298,9 @@ def buildcfg_neededvars(d):
     if pesteruser:
         bb.fatal('The following variable(s) were not set: %s\nPlease set them directly, or choose a MACHINE or DISTRO that sets them.' % ', '.join(pesteruser))
 
+EXTRA_DISTRO_FEATURES ?= ""
+EXTRA_DISTRO_FEATURES[type] = "list"
+
 addhandler base_eventhandler
 base_eventhandler[eventmask] = "bb.event.ConfigParsed bb.event.BuildStarted"
 python base_eventhandler() {
@@ -307,6 +310,7 @@ python base_eventhandler() {
         preferred_ml_updates(e.data)
         oe.utils.features_backfill("DISTRO_FEATURES", e.data)
         oe.utils.features_backfill("MACHINE_FEATURES", e.data)
+        oe.utils.extra_distro_features(e.data)
 
     if isinstance(e, bb.event.BuildStarted):
         localdata = bb.data.createCopy(e.data)
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 82987e8..b2e65a4 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -117,6 +117,27 @@ def features_backfill(var,d):
     if addfeatures:
         d.appendVar(var, " " + " ".join(addfeatures))
 
+def extra_distro_features(d):
+    import oe.data
+
+    l = d.createCopy()
+    l.finalize()
+
+    extra_features = oe.data.typed_value('EXTRA_DISTRO_FEATURES', l)
+    if not extra_features:
+        return
+
+    distro_features = l.getVar('DISTRO_FEATURES', True).split()
+    for feature in extra_features:
+        if feature.startswith('~'):
+            feature = feature[1:]
+            if feature in distro_features:
+                distro_features.remove(feature)
+        else:
+            if feature not in distro_features:
+                distro_features.append(feature)
+
+    d.setVar('DISTRO_FEATURES', ' '.join(distro_features))
 
 def packages_filter_out_system(d):
     """
-- 
1.8.3.2


