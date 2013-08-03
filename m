Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ye0-f176.google.com (mail-ye0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id DDDF160664
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Aug 2013 22:31:14 +0000 (UTC)
Received: by mail-ye0-f176.google.com with SMTP id q3so739970yen.21
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Aug 2013 15:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=i7F/gV4p7KrEXjSNvBE4Cv+i3DhIkgtZ7NkXgNyp0WY=;
	b=dgK0qsQvLdxi7E+7iUTc6/Poih3QfLBu8fu31VFiATO3UmHLB2aXYPJB06X907Gy6a
	yq0YxNZY1pXjfYktdK1sR2qpvzUb3CbWUMb8msdW7ZIHnbhlOuAM4ksRZSl+h6cVCN7U
	cKUbXV3Ghl2PdB+ED3GyVZ3WM3WiiObBWct4erZVTvteo8kJh1yGVVbRq9u7VCN9ZZQC
	CbO+R7qNnPnPHPgW7Jkl6LRfG2/UBCcyDbMm/dq5lZ0KWhVClYNfVcDewVRmJR7/8kzu
	4XsTLIoBxsUUHXV9dHJ/D19jpiGaMnLSaFt8w5XnePR2OiChMTcNFrLDf4cYoqJj5b+G
	uFhw==
X-Received: by 10.236.141.134 with SMTP id g6mr7722275yhj.81.1375569075052;
	Sat, 03 Aug 2013 15:31:15 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([187.23.155.55])
	by mx.google.com with ESMTPSA id
	j63sm23495976yhh.17.2013.08.03.15.31.13 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 03 Aug 2013 15:31:14 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Sat,  3 Aug 2013 19:30:57 -0300
Message-Id: <1375569057-696-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.3.2
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] blacklist.bbclass: Avoid blacklist specific handle in base.bbclass
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
X-List-Received-Date: Sat, 03 Aug 2013 22:31:15 -0000

base.bbclass had code which handled the PNBLACKLIST in case of
multilib use. This is better to be done in the blacklist.bbclass so it
has all logic in a single place.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
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
index 75abd99..6153cf8 100644
--- a/meta/classes/blacklist.bbclass
+++ b/meta/classes/blacklist.bbclass
@@ -12,6 +12,31 @@
 #   PNBLACKLIST[pn] = "message"
 #
 
+# Cope with PNBLACKLIST flags for multilib case
+addhandler blacklist_multilib_eventhandler
+blacklist_multilib_eventhandler[eventmask] = "bb.event.ConfigParsed"
+python blacklist_multilib_eventhandler() {
+    multilibs = e.data.getVar('MULTILIBS', True) or ""
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


