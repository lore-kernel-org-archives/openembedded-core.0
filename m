Return-Path: <otavio.salvador@gmail.com>
Received: from mail-gh0-f174.google.com (mail-gh0-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id 0321A6B2CA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 22:26:43 +0000 (UTC)
Received: by mail-gh0-f174.google.com with SMTP id r17so1898916ghr.33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 15:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=rLYdipDgaYDUPgy8PuAd8EOic/GsgyaLscAZvhBAGuE=;
	b=hMCQ3HfEJntk6kXXvYkBkzIU2ObiXtNa/bOHNVSynWcGHtB1g3kl07AOcJ88gdTfZY
	NwCcghAkUCVEQMrzS1uHezjM9bBPkaoVq57oyJEGVPcGdQRlBVtz/eDF7LoMrhtU9xQ4
	de6xKM3+6auvxBJkVB/y12TCjubU19nRKSX0vmflGq8EH3jgLzgOoao7fCbegCjvRYJ2
	Ef40C0iC8Xyc8q71n98VT76YV0igczgOSM5G8pz2B7VgTVpyKRDVsnOyanbD5rLEEm0V
	CEX8nceEi53MGk7KIZQg25+e/IkghMJMkMgzXD6TzBpoG9TIrt82PcufFsm6p/RwZ9ot
	f5QQ==
X-Received: by 10.236.150.208 with SMTP id z56mr28109776yhj.187.1375136804025; 
	Mon, 29 Jul 2013 15:26:44 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([187.23.155.55])
	by mx.google.com with ESMTPSA id
	h26sm87174984yhb.21.2013.07.29.15.26.41 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 29 Jul 2013 15:26:43 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Jul 2013 19:26:27 -0300
Message-Id: <1375136787-18139-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.3.2
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] base.bbclass: Add support to EXTRA_DISTRO_FEATURES
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
X-List-Received-Date: Mon, 29 Jul 2013 22:26:44 -0000

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
 meta/classes/base.bbclass |  4 ++++
 meta/lib/oe/utils.py      | 20 ++++++++++++++++++++
 2 files changed, 24 insertions(+)

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
index 82987e8..9e82801 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -117,6 +117,26 @@ def features_backfill(var,d):
     if addfeatures:
         d.appendVar(var, " " + " ".join(addfeatures))
 
+def extra_distro_features(d):
+    import oe.data
+
+    extra_features = oe.data.typed_value('EXTRA_DISTRO_FEATURES', d)
+    if not extra_features:
+        return
+
+    d.finalize()
+
+    distro_features = d.getVar('DISTRO_FEATURES', True).split()
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


