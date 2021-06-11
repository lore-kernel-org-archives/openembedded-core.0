Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.6587.1623407610418391831
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Jun 2021 03:33:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=fr0Q3N1F;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1623407610;
  x=1654943610;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=48tcvz0M/p10LPVuJUIFUOT1HB5+n8bcfiur4tcf0l4=;
  b=fr0Q3N1FmC1nNH3+jC5OjRFvkoL/SxPgNnPr4TIr+AMQoFSw7rSFRx8Y
   j3r6kNZFphkbQQOtn+CWQsfEu8gG9lwfz63zxhXC3MfZXfoeK+fCpqlpi
   KvvsvF1Ob8kel/4eOrWPXAJiU0C2Wkq46RGNoihgI6F7fp3RuodnhMm2Y
   tEu2dZKAOr6VD2NIoBEv7U8jJYxPIf34LFec7EQO2CPxvITJdbPlnggcm
   u3e2HrWySu1d8AWYgTwLmwEuL+6SbT7Q7HUglbjdeVJCwmEwOQDAke9uU
   umJEEZHYvm4Y3Sfbn/U31CiWmVFa2A9BEWsOTlyUu6dNKjrC4J/BpRkbF
   Q==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>, Anuj Mittal
	<anuj.mittal@intel.com>
Subject: [hardknott][PATCH 2/2] native.bbclass: Do not remove "-native" in the middle of recipe names
Date: Fri, 11 Jun 2021 12:32:58 +0200
Message-ID: <20210611103258.27368-2-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20210611103258.27368-1-pkj@axis.com>
References: <20210611103258.27368-1-pkj@axis.com>
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

For dependencies such as "${PN}-foo", when modifying them for native
recipes, it is expected that they become "${BPN}-foo-native" rather
than "${BPN}-native-foo-native". This was previously done by removing
all occurences of "-native" from the dependency before adding
"-native" at the end. However, this fails for a recipe such as
"crate-native-tls" that happens to contain the string "-native" in the
middle of the name. Solve this by simply replacing ${PN} with ${BPN}
in the name instead before adding "-native" at the end

Also simplify adding "-native" to the end of names the recipe provides.
In this case it is not necessary to replace ${PN} with ${BPN} as the
recipes are expected to use ${BPN}-foo in the first place.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/native.bbclass | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index a0838e41b9..561cc23f68 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -119,6 +119,7 @@ python native_virtclass_handler () {
     pn = e.data.getVar("PN")
     if not pn.endswith("-native"):
         return
+    bpn = e.data.getVar("BPN")
 
     # Set features here to prevent appends and distro features backfill
     # from modifying native distro features
@@ -146,7 +147,10 @@ python native_virtclass_handler () {
             elif "-cross-" in dep:
                 newdeps.append(dep.replace("-cross", "-native"))
             elif not dep.endswith("-native"):
-                newdeps.append(dep.replace("-native", "") + "-native")
+                # Replace ${PN} with ${BPN} in the dependency to make sure
+                # dependencies on, e.g., ${PN}-foo become ${BPN}-foo-native
+                # rather than ${BPN}-native-foo-native.
+                newdeps.append(dep.replace(pn, bpn) + "-native")
             else:
                 newdeps.append(dep)
         d.setVar(varname, " ".join(newdeps), parsing=True)
@@ -166,7 +170,7 @@ python native_virtclass_handler () {
         if prov.find(pn) != -1:
             nprovides.append(prov)
         elif not prov.endswith("-native"):
-            nprovides.append(prov.replace(prov, prov + "-native"))
+            nprovides.append(prov + "-native")
         else:
             nprovides.append(prov)
     e.data.setVar("PROVIDES", ' '.join(nprovides))
