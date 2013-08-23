Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ye0-f181.google.com (mail-ye0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id B5C506065F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 14:49:28 +0000 (UTC)
Received: by mail-ye0-f181.google.com with SMTP id m5so151156yen.40
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 07:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pOzJmjmuouXSZeRa/2by6TiakhEjd8b8h0A3XkfiuF0=;
	b=T4lhR87QDKekwd2k3kHNMzkOj5mfEkIvFSgdZDGcTf+E/QC7UdfHWpZCB7v13THGLq
	zm6b7a58WsN+PUKRrMqLn2xW5oVTtKG4FVDzsOnFxNkzdPT1OiEaGQH2Mdz6qQl08PGp
	wZDyHLwlkuG6k5iLC+c/gK7oajH2lmPms1QwUqKxcYKS9shbKU6uA911dy9uXKj2YOwZ
	JQy7pzBUOUfZiztu+cvP1n0RGWdzQAdW2z6HoxiZwKgW9INyubVBRa5yciI15iaFoAE8
	N9PU4I+4TOsc9Ksnqbx4pnW2rehupilm7gLPOpj3XEkbSOuz+i053i/9cumbLrXpvlgJ
	fnFw==
X-Received: by 10.236.23.166 with SMTP id v26mr85543yhv.249.1377269369505;
	Fri, 23 Aug 2013 07:49:29 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([187.23.155.55])
	by mx.google.com with ESMTPSA id v23sm248195yhv.1.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 23 Aug 2013 07:49:28 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Aug 2013 11:48:57 -0300
Message-Id: <1377269339-6139-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.4.rc1
In-Reply-To: <1377269339-6139-1-git-send-email-otavio@ossystems.com.br>
References: <1377269339-6139-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [RFC PATCH v5 1/2] base.bbclass: Add support to EXTRA_DISTRO_FEATURES
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
X-List-Received-Date: Fri, 23 Aug 2013 14:49:28 -0000

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
Changes in v5:
- Resend

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
index 98b823e..f30f4db 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -288,6 +288,9 @@ def buildcfg_neededvars(d):
     if pesteruser:
         bb.fatal('The following variable(s) were not set: %s\nPlease set them directly, or choose a MACHINE or DISTRO that sets them.' % ', '.join(pesteruser))
 
+EXTRA_DISTRO_FEATURES ?= ""
+EXTRA_DISTRO_FEATURES[type] = "list"
+
 addhandler base_eventhandler
 base_eventhandler[eventmask] = "bb.event.ConfigParsed bb.event.BuildStarted"
 python base_eventhandler() {
@@ -297,6 +300,7 @@ python base_eventhandler() {
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
1.8.4.rc1


