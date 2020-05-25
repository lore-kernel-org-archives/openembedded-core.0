Received: from esa7.bmw.c3s2.iphmx.com (esa7.bmw.c3s2.iphmx.com [68.232.133.109])
 by mx.groups.io with SMTP id smtpd.web11.27639.1590392767325378464
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2020 00:46:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=nt5W89DP;
 spf=pass (domain: bmw.de, ip: 68.232.133.109, mailfrom: prvs=40745be84=michael.ho@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1590392767; x=1621928767;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=6fWXGpirCwsD3UvQrENzhAJuWXW2zhuHfBVdbhlujzQ=;
  b=nt5W89DPzjbrVVKCet4+JlJhQoAzVcjbdG0aTSaFDgohznw1mZhnenV4
   AkxY4tBi33qfcA7wK5rwOuSsRMdzPsJizotT1ctJKp7tU7D+RX9s3k4J7
   TxhheIX/HEem/NxFIH5LN+n4zwuY1RXnCp3ICJTOcVRc8A+LlEeQlTQVZ
   I=;
Received: from esagw2.bmwgroup.com (HELO esagw2.muc) ([160.46.252.38]) by
 esa7.bmw.c3s2.iphmx.com with ESMTP/TLS; 25 May 2020 09:46:01 +0200
Received: from esabb1.muc ([160.50.100.31])  by esagw2.muc with ESMTP/TLS;
 25 May 2020 09:46:00 +0200
Received: from smucm09k.bmwgroup.net (HELO smucm09k.europe.bmw.corp) ([160.48.96.43])
 by esabb1.muc with ESMTP/TLS; 25 May 2020 09:45:59 +0200
Received: from michael-pcx.bmw-carit.intra (192.168.221.38) by
 smucm09k.europe.bmw.corp (160.48.96.43) with Microsoft SMTP Server (TLS;
 Mon, 25 May 2020 09:45:58 +0200
From: "Michael Ho" <Michael.Ho@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Michael Ho <Michael.Ho@bmw.de>
Subject: [PATCH] package_rpm.bbclass: respect package overrides for the main package
Date: Mon, 25 May 2020 09:45:49 +0200
Message-ID: <1590392749-329454-1-git-send-email-michael.ho@bmw.de>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Return-Path: michael.ho@bmw.de
X-ClientProxiedBy: smucm08l.europe.bmw.corp (160.48.96.40) To
 smucm09k.europe.bmw.corp (160.48.96.43)
Content-Type: text/plain

From: Michael Ho <Michael.Ho@bmw.de>

Apply ${PN} to OVERRIDES when determining the base package spec variables.
Without this, there is a mismatch in behaviour where overrides for the base
package have no effect while overrides for subpackages do. The subpackages
should not be affected by this override as they apply their own package
overrides and will by default fetch the base variables and apply them in
the spec file.

This makes the behaviour for package overrides match the implementation
in package_deb.bbclass and package_ipk.bbclass.

Signed-off-by: Michael Ho <Michael.Ho@bmw.de>
---
 meta/classes/package_rpm.bbclass | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 9a4be2e..519c22b 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -286,16 +286,18 @@ python write_specfile () {
 
     # Construct the SPEC file...
     srcname    = d.getVar('PN')
-    srcsummary = (d.getVar('SUMMARY') or d.getVar('DESCRIPTION') or ".")
-    srcversion = d.getVar('PKGV').replace('-', '+')
-    srcrelease = d.getVar('PKGR')
-    srcepoch   = (d.getVar('PKGE') or "")
-    srclicense = d.getVar('LICENSE')
-    srcsection = d.getVar('SECTION')
-    srcmaintainer  = d.getVar('MAINTAINER')
-    srchomepage    = d.getVar('HOMEPAGE')
-    srcdescription = d.getVar('DESCRIPTION') or "."
-    srccustomtagschunk = get_package_additional_metadata("rpm", d)
+    localdata = bb.data.createCopy(d)
+    localdata.setVar('OVERRIDES', d.getVar("OVERRIDES", False) + ":" + srcname)
+    srcsummary = (localdata.getVar('SUMMARY') or localdata.getVar('DESCRIPTION') or ".")
+    srcversion = localdata.getVar('PKGV').replace('-', '+')
+    srcrelease = localdata.getVar('PKGR')
+    srcepoch   = (localdata.getVar('PKGE') or "")
+    srclicense = localdata.getVar('LICENSE')
+    srcsection = localdata.getVar('SECTION')
+    srcmaintainer  = localdata.getVar('MAINTAINER')
+    srchomepage    = localdata.getVar('HOMEPAGE')
+    srcdescription = localdata.getVar('DESCRIPTION') or "."
+    srccustomtagschunk = get_package_additional_metadata("rpm", localdata)
 
     srcdepends     = d.getVar('DEPENDS')
     srcrdepends    = []
-- 
2.7.4

