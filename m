Received: from smtp1.axis.com (smtp1.axis.com [])
 by mx.groups.io with SMTP id smtpd.web10.49009.1622493253185579938
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 May 2021 13:34:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=ks1RXiUy;
 spf=fail (domain: axis.com, ip: <nil>, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1622493255;
  x=1654029255;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=zvlE2nBmdui0B1Twb+PE32mCT11nN2VYL1i8gIJAIBw=;
  b=ks1RXiUyAPjEQZI9wDiN55UTPuSFfO5vH8cwgTNZ23JfqVwRCZyuGg5o
   SlpIjCIRwhYzgHRx956JpYQvJmb+/qPhs0+mgCZcTjtW96Knnjk9Gb6R2
   0zeJpBWkG+yGwUNERrifS2VEsd0kTBRADzl9pZ4CW+d5t0ee6iL5AH6Zw
   xrh97c0iIDpEaiBrOZ+5FMJ0z1/swMrdqRx73gZWrG7qhQYvYL8FbS80O
   xNRNYSowSnUc1xGmVXATL/YoPPrSSah3EVkzaJ3vlGUOv8AnydfHgwjG+
   L7+iRn/OjTuky3B/3g/OEatniv5f31FlfPLCAutkAXwhWiDthTkrgunJv
   g==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] native.bbclass: Do not remove "-native" in the middle of recipe names
Date: Mon, 31 May 2021 22:34:04 +0200
Message-ID: <20210531203404.29716-2-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20210531203404.29716-1-pkj@axis.com>
References: <20210531203404.29716-1-pkj@axis.com>
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

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
