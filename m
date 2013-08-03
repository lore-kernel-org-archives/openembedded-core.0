Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ye0-f180.google.com (mail-ye0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3FD4560664
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Aug 2013 22:58:45 +0000 (UTC)
Received: by mail-ye0-f180.google.com with SMTP id q4so747328yen.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Aug 2013 15:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=sqLNCt/Izd6K3dUiNoxRofrLRpEdwdpngXW2XnJD9pE=;
	b=g+c78azc2kWYeRddcfNm7uh0Tksy6HgA2D9vb+8SzjkZkQpxnfBfCWZeGYVyC+Ey/a
	CAonhcgs//5U/P98cxhRu7zXvk0GZ2wQ+n36rxQTl4M+CIsXRhI4IQLi4D5r0JdACnmt
	eqMMiFY+iP0fOnbB4hYB0FvZrJPOhFpuIzW3EKhRvYRhS7j/fndSkWN5SaYB5lVXSD6m
	nVtRDXnZFESkLw7ZlCHqPRKwuKaX61sTdc+9I75DM3hUVp0Ut2SBXH6UipanZOcr9w+O
	FRHQzxGgJB2nPFp6Lr8gu372StsnB4YxwiwWgdTcCIgFArtEZnq5nJ4H2Sn9fwe8Z3vs
	phiA==
X-Received: by 10.236.24.226 with SMTP id x62mr7753628yhx.124.1375570725835;
	Sat, 03 Aug 2013 15:58:45 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([187.23.155.55])
	by mx.google.com with ESMTPSA id
	s47sm23679938yhl.19.2013.08.03.15.58.44 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 03 Aug 2013 15:58:45 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Sat,  3 Aug 2013 19:58:37 -0300
Message-Id: <1375570717-3017-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.3.2
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2] blacklist.bbclass: Avoid blacklist specific handle in base.bbclass
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
X-List-Received-Date: Sat, 03 Aug 2013 22:58:45 -0000

base.bbclass had code which handled the PNBLACKLIST in case of
multilib use. This is better to be done in the blacklist.bbclass so it
has all logic in a single place.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
Changes in v2:
- Drop redundant 'or ""' code. Thanks to Mario for the hint.

 meta/classes/base.bbclass      | 10 ----------
 meta/classes/blacklist.bbclass | 25 +++++++++++++++++++++++++
 2 files changed, 25 insertions(+), 10 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index e2c9a7d..bc2b4f6 100644
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
index 75abd99..147e988 100644
--- a/meta/classes/blacklist.bbclass
+++ b/meta/classes/blacklist.bbclass
@@ -12,6 +12,31 @@
 #   PNBLACKLIST[pn] = "message"
 #
 
+# Cope with PNBLACKLIST flags for multilib case
+addhandler blacklist_multilib_eventhandler
+blacklist_multilib_eventhandler[eventmask] = "bb.event.ConfigParsed"
+python blacklist_multilib_eventhandler() {
+    multilibs = e.data.getVar('MULTILIBSA', True)
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
1.8.3.2


