Return-Path: <otavio.salvador@gmail.com>
Received: from mail-gh0-f182.google.com (mail-gh0-f182.google.com
	[209.85.160.182])
	by mail.openembedded.org (Postfix) with ESMTP id 17C2861883
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Aug 2013 20:19:40 +0000 (UTC)
Received: by mail-gh0-f182.google.com with SMTP id z15so1580863ghb.41
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Aug 2013 13:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=/Heoqv3+QX0qo7WRqtJi2JNtbWz0tF+hhgFHgIfeFMw=;
	b=LbtrTucTwgz+bE3YowFxoIzW4nf7p/qTDAVQEM/T+YCjM2QPGzN4AFmNElB04jNjSs
	sd+XGskR0fFvBvIH6w7VAFveBZaaiH/2FOfdLITMNOmgYCO3cTlIKS+bCOrahFfVD/bU
	LCk2yi2LuY1A11SO/cWWQIyJ7iOl4J0FhaMvXVLKZkGbhcrso8dEvSBRk5CMOi+sya58
	t/iFZ6PN1KqHaWwaYWQmq84zP4+kiAUgWUxoXeUaa3uMFyzKI/pj1clNff+k+GxIllXU
	gCxtORrjfMqs52cGMzPCnG/mqnfUZT+B84BM25hOUGhno7grjmBOYmAOupfvR5G9AxVw
	s//w==
X-Received: by 10.236.63.132 with SMTP id a4mr7205610yhd.41.1376165980017;
	Sat, 10 Aug 2013 13:19:40 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([187.23.155.55])
	by mx.google.com with ESMTPSA id 66sm26009893yhe.20.2013.08.10.13.19.38
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 10 Aug 2013 13:19:39 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Sat, 10 Aug 2013 17:19:30 -0300
Message-Id: <1376165970-23322-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.4.rc1
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v3] blacklist.bbclass: Avoid blacklist specific handle in base.bbclass
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
X-List-Received-Date: Sat, 10 Aug 2013 20:19:40 -0000

base.bbclass had code which handled the PNBLACKLIST in case of
multilib use. This is better to be done in the blacklist.bbclass so it
has all logic in a single place.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
Changes in v3:
- Fix a typo kept when testing the code and commited by mistake

Changes in v2:
- Drop redundant 'or ""' code. Thanks to Mario for the hint.

 meta/classes/base.bbclass      | 10 ----------
 meta/classes/blacklist.bbclass | 25 +++++++++++++++++++++++++
 2 files changed, 25 insertions(+), 10 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index a2403ac..f30f4db 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -141,7 +141,6 @@ def pkgarch_mapping(d):
 def preferred_ml_updates(d):
     # If any PREFERRED_PROVIDER or PREFERRED_VERSION are set,
     # we need to mirror these variables in the multilib case;
-    # likewise the PNBLACKLIST flags.
     multilibs = d.getVar('MULTILIBS', True) or ""
     if not multilibs:
         return
@@ -154,21 +153,12 @@ def preferred_ml_updates(d):
 
     versions = []
     providers = []
-    blacklists = d.getVarFlags('PNBLACKLIST') or {}
     for v in d.keys():
         if v.startswith("PREFERRED_VERSION_"):
             versions.append(v)
         if v.startswith("PREFERRED_PROVIDER_"):
             providers.append(v)
 
-    for pkg, reason in blacklists.items():
-        if pkg.endswith(("-native", "-crosssdk")) or pkg.startswith(("nativesdk-", "virtual/nativesdk-")) or 'cross-canadian' in pkg:
-            continue
-        for p in prefixes:
-            newpkg = p + "-" + pkg
-            if not d.getVarFlag('PNBLACKLIST', newpkg, True):
-                d.setVarFlag('PNBLACKLIST', newpkg, reason)
-
     for v in versions:
         val = d.getVar(v, False)
         pkg = v.replace("PREFERRED_VERSION_", "")
diff --git a/meta/classes/blacklist.bbclass b/meta/classes/blacklist.bbclass
index 75abd99..a0141a8 100644
--- a/meta/classes/blacklist.bbclass
+++ b/meta/classes/blacklist.bbclass
@@ -12,6 +12,31 @@
 #   PNBLACKLIST[pn] = "message"
 #
 
+# Cope with PNBLACKLIST flags for multilib case
+addhandler blacklist_multilib_eventhandler
+blacklist_multilib_eventhandler[eventmask] = "bb.event.ConfigParsed"
+python blacklist_multilib_eventhandler() {
+    multilibs = e.data.getVar('MULTILIBS', True)
+    if not multilibs:
+        return
+
+    # this block has been copied from base.bbclass so keep it in sync
+    prefixes = []
+    for ext in multilibs.split():
+        eext = ext.split(':')
+        if len(eext) > 1 and eext[0] == 'multilib':
+            prefixes.append(eext[1])
+
+    blacklists = e.data.getVarFlags('PNBLACKLIST') or {}
+    for pkg, reason in blacklists.items():
+        if pkg.endswith(("-native", "-crosssdk")) or pkg.startswith(("nativesdk-", "virtual/nativesdk-")) or 'cross-canadian' in pkg:
+            continue
+        for p in prefixes:
+            newpkg = p + "-" + pkg
+            if not e.data.getVarFlag('PNBLACKLIST', newpkg, True):
+                e.data.setVarFlag('PNBLACKLIST', newpkg, reason)
+}
+
 python () {
     blacklist = d.getVarFlag('PNBLACKLIST', d.getVar('PN', True), True)
 
-- 
1.8.4.rc1


