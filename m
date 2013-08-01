Return-Path: <otavio.salvador@gmail.com>
Received: from mail-gh0-f176.google.com (mail-gh0-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id 68B6F61883
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 14:05:49 +0000 (UTC)
Received: by mail-gh0-f176.google.com with SMTP id z17so764012ghb.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Aug 2013 07:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=Fj1CY100rywc0q2LgP08kcAlhW83HsVjTuoQ265dif4=;
	b=m+RRuiTpIEpZugZhoxIx/sPQSJlD+7AfDfeoHzNz+ZSx49FnTmSZpFcYNzcHVk38Kf
	gGsS12VRmlkP88FB8/myvf1joG8DhbQPE7B28E+15k0iVbb5hnwt4ADJ3/lDpaOKpvoC
	tT2VMOBY5x3Hwo1Y6Jg0igT8JlbIGkInmuQ0iwW4ROvoqdf3aFhLQmj5mGToX2CVOv6t
	/KhFdxm919WFxn2XAgGvMcz7Rw7YKL37BjE1N08R8+VW1xcVK39FgmfkXkGDGThQQXRX
	Xg/LxyWQQmtxPJsUY/+2gbWqB9X6OUu0GO3aNiAr+CJ/oe4YHWDZ6Jd+B/VOTMsglzp8
	Va6g==
X-Received: by 10.236.28.112 with SMTP id f76mr969789yha.93.1375365949545;
	Thu, 01 Aug 2013 07:05:49 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([187.23.155.55])
	by mx.google.com with ESMTPSA id h26sm4764826yhb.21.2013.08.01.07.05.47
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 01 Aug 2013 07:05:48 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu,  1 Aug 2013 11:05:32 -0300
Message-Id: <1375365932-9602-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.3.2
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v4] base.bbclass: Add support to EXTRA_DISTRO_FEATURES
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
X-List-Received-Date: Thu, 01 Aug 2013 14:05:49 -0000

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
Changes in v4:
- Drop _prepend/_append hack and remove/add DISTRO_FEATURES (thanks to
  RP for the tip).

Changes in v3:
- Drop _prepend/_append flags from DISTRO_FEATURES to avoid the re-add

Changes in v2:
- Use data copy to fix wrong prepend/append expanding.

 meta/classes/base.bbclass |  4 ++++
 meta/lib/oe/utils.py      | 24 ++++++++++++++++++++++++
 2 files changed, 28 insertions(+)

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
index 82987e8..0c9dde0 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -117,6 +117,30 @@ def features_backfill(var,d):
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
+    d.delVar("DISTRO_FEATURES")
+
+    d.setVar('DISTRO_FEATURES', ' '.join(distro_features))
 
 def packages_filter_out_system(d):
     """
-- 
1.8.3.2


