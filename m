Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.8648.1593555493283718772
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2020 15:18:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: joe.slater@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 05UMHpkL005357
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2020 15:18:02 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Tue, 30 Jun 2020
 15:17:24 -0700
From: "Joe Slater" <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [oe-core][PATCH 1/1] jquery: use ${S}
Date: Tue, 30 Jun 2020 15:17:24 -0700
Message-ID: <20200630221724.46087-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Currently, several files are unpacked to WORKDIR and installed.
This makes them invisible to the archiver.  Unpack to S.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta/recipes-devtools/jquery/jquery_3.5.1.bb | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/jquery/jquery_3.5.1.bb b/meta/recipes-devtools/jquery/jquery_3.5.1.bb
index b4d7e80afe..62f0dfb0c5 100644
--- a/meta/recipes-devtools/jquery/jquery_3.5.1.bb
+++ b/meta/recipes-devtools/jquery/jquery_3.5.1.bb
@@ -2,12 +2,14 @@ SUMMARY = "jQuery is a fast, small, and feature-rich JavaScript library"
 HOMEPAGE = "https://jquery.com/"
 LICENSE = "MIT"
 SECTION = "devel"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/${BP}.js;beginline=8;endline=10;md5=ebd7bc5d23ab165188e526a0c65d24bb"
+LIC_FILES_CHKSUM = "file://${S}/${BP}.js;beginline=8;endline=10;md5=ebd7bc5d23ab165188e526a0c65d24bb"
 
+# unpack items to ${S} so the archiver can see them
+#
 SRC_URI = "\
-    https://code.jquery.com/${BP}.js;name=js \
-    https://code.jquery.com/${BP}.min.js;name=min \
-    https://code.jquery.com/${BP}.min.map;name=map \
+    https://code.jquery.com/${BP}.js;name=js;subdir=${BP} \
+    https://code.jquery.com/${BP}.min.js;name=min;subdir=${BP} \
+    https://code.jquery.com/${BP}.min.map;name=map;subdir=${BP} \
     "
 
 SRC_URI[js.sha256sum] = "416a3b2c3bf16d64f6b5b6d0f7b079df2267614dd6847fc2f3271b4409233c37"
@@ -20,9 +22,9 @@ inherit allarch
 
 do_install() {
     install -d ${D}${datadir}/javascript/${BPN}/
-    install -m 644 ${WORKDIR}/${BP}.js ${D}${datadir}/javascript/${BPN}/${BPN}.js
-    install -m 644 ${WORKDIR}/${BP}.min.js ${D}${datadir}/javascript/${BPN}/${BPN}.min.js
-    install -m 644 ${WORKDIR}/${BP}.min.map ${D}${datadir}/javascript/${BPN}/${BPN}.min.map
+    install -m 644 ${S}/${BP}.js ${D}${datadir}/javascript/${BPN}/${BPN}.js
+    install -m 644 ${S}/${BP}.min.js ${D}${datadir}/javascript/${BPN}/${BPN}.min.js
+    install -m 644 ${S}/${BP}.min.map ${D}${datadir}/javascript/${BPN}/${BPN}.min.map
 }
 
 PACKAGES = "${PN}"
-- 
2.17.1

