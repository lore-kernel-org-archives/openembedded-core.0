Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.21941.1593611044539936187
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2020 06:44:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: hongxu.jia@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 061Dhw3l023515
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 1 Jul 2020 06:44:03 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Wed, 1 Jul 2020
 06:43:43 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] cpio: add nativesdk support
Date: Wed, 1 Jul 2020 21:43:41 +0800
Message-ID: <20200701134341.2894-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.18.2
MIME-Version: 1.0
Content-Type: text/plain

Since commit [24b80d211f nativesdk.bbclass: set sbindir to bindir]
applied, sbindir = bindir in nativesdk, then routine `rmt' is
installed to bindir which break `rmdir ${D}${bindir}/' failed with
`Directory not empty'

Don't rmdir while nativesdk

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-extended/cpio/cpio_2.13.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/cpio/cpio_2.13.bb b/meta/recipes-extended/cpio/cpio_2.13.bb
index 9e35a80f8b..44036f07f9 100644
--- a/meta/recipes-extended/cpio/cpio_2.13.bb
+++ b/meta/recipes-extended/cpio/cpio_2.13.bb
@@ -23,7 +23,9 @@ do_install () {
     if [ "${base_bindir}" != "${bindir}" ]; then
         install -d ${D}${base_bindir}/
         mv "${D}${bindir}/cpio" "${D}${base_bindir}/cpio"
-        rmdir ${D}${bindir}/
+        if [ "${PN}" != "nativesdk-cpio" ]; then
+            rmdir ${D}${bindir}/
+        fi
     fi
 
     # Avoid conflicts with the version from tar
@@ -46,4 +48,4 @@ ALTERNATIVE_LINK_NAME[cpio] = "${base_bindir}/cpio"
 ALTERNATIVE_PRIORITY[rmt] = "50"
 ALTERNATIVE_LINK_NAME[rmt] = "${sbindir}/rmt"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.18.2

