Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f45.google.com (mail-yh0-f45.google.com
	[209.85.213.45])
	by mail.openembedded.org (Postfix) with ESMTP id DAC256A5AF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 15:13:42 +0000 (UTC)
Received: by mail-yh0-f45.google.com with SMTP id i72so402353yha.18
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 08:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=qpR62mTlDacRPtycP0syGJIKuEth6bHqUzUULta8ZXQ=;
	b=Pn+hp1h0uMtpyhhcVw5rUCEqDm7Y6ZVOaZUn65eMMxa20OwTpD4OlDMJ3BvMSr0ErQ
	a/LPQgNpC2hZDERhKmAjcJQY86eJ6g/VFcaBEIwarIGqAZ2M7gkVFd36YRVPKoi2nLSx
	h3b2zNx/hVOt81hgHLNUDNCCmdNm2YGcOK8Uj4gF9BFSpwobM5j6mVMNfy9cR210ViiG
	JoZg0SSlhZ5lhlmq7Sc8Q3A2+uFnTThC1uVivfKDGaUIgwBaYPbp2k6eoEBQwAsjmNIH
	WHI+NCWVHV8ZcZ7A4hty/Oa3DQ6LrR4p1+lBl03XZqFbPPZTzJj6kVkLUtLUZHHPilyp
	FVcA==
X-Received: by 10.236.101.227 with SMTP id b63mr22564809yhg.204.1375283623117; 
	Wed, 31 Jul 2013 08:13:43 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([187.23.155.55])
	by mx.google.com with ESMTPSA id b50sm3008640yhl.1.2013.07.31.08.13.40
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 31 Jul 2013 08:13:42 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 31 Jul 2013 12:13:25 -0300
Message-Id: <1375283605-25870-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.3.2
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v3] base.bbclass: Add support to EXTRA_DISTRO_FEATURES
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
X-List-Received-Date: Wed, 31 Jul 2013 15:13:43 -0000

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
Changes for v3:
- Drop _prepend/_append flags from DISTRO_FEATURES to avoid the re-add

 meta/classes/base.bbclass |  4 ++++
 meta/lib/oe/utils.py      | 25 +++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

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
index 82987e8..db468cb 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -117,6 +117,31 @@ def features_backfill(var,d):
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
+    # Avoid readding the removed features later
+    d.delVarFlag("DISTRO_FEATURES", "_append")
+    d.delVarFlag("DISTRO_FEATURES", "_prepend")
+
+    d.setVar('DISTRO_FEATURES', ' '.join(distro_features))
 
 def packages_filter_out_system(d):
     """
-- 
1.8.3.2


