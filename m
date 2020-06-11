Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.2591.1591861307130902393
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2020 00:41:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 05B7fP2G012072
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2020 00:41:36 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Thu, 11 Jun 2020 00:40:57 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] python3: add the rdepends for python3-misc
Date: Thu, 11 Jun 2020 15:39:28 +0800
Message-ID: <20200611073928.1974192-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

* Add python3-numbers to rdepends for python3-misc to fix below error:
 # python3
 [snip]
 >>> import statistics
 [snip]
 ModuleNotFoundError: No module named 'numbers'

* Don't use the hardcoded python3 moudules rdepends

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-devtools/python/python3_3.8.3.bb | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.8.3.bb b/meta/recipes-devtools/python/python3_3.8.3.bb
index 09793dade2..997308dc75 100644
--- a/meta/recipes-devtools/python/python3_3.8.3.bb
+++ b/meta/recipes-devtools/python/python3_3.8.3.bb
@@ -331,7 +331,15 @@ INSANE_SKIP_${PN}-dev += "dev-elf"
 
 # catch all the rest (unsorted)
 PACKAGES += "${PN}-misc"
-RDEPENDS_${PN}-misc += "python3-core python3-email python3-codecs python3-pydoc python3-pickle python3-audio"
+RDEPENDS_${PN}-misc += "\
+  ${PN}-core \
+  ${PN}-email \
+  ${PN}-codecs \
+  ${PN}-pydoc \
+  ${PN}-pickle \
+  ${PN}-audio \
+  ${PN}-numbers \
+"
 RDEPENDS_${PN}-modules_append_class-target = " ${MLPREFIX}python3-misc"
 RDEPENDS_${PN}-modules_append_class-nativesdk = " ${MLPREFIX}python3-misc"
 FILES_${PN}-misc = "${libdir}/python${PYTHON_MAJMIN} ${libdir}/python${PYTHON_MAJMIN}/lib-dynload"
-- 
2.24.1

