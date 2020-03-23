Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.44979.1584930293200736300
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Mar 2020 19:24:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: kai.kang@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 02N2OTxA005186
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Sun, 22 Mar 2020 19:24:39 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Sun, 22 Mar 2020 19:24:18 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] ifupdown: create file interfaces if not exist
Date: Mon, 23 Mar 2020 10:24:14 +0800
Message-ID: <20200323022414.14394-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It fails to run ifup if /etc/network/interfaces doesn't exist:

| ifup: couldn't open interfaces file "/etc/network/interfaces": No such
|       file or directory

Create the config file if not exist.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-core/ifupdown/ifupdown_0.8.35.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-core/ifupdown/ifupdown_0.8.35.bb b/meta/recipes-core/ifupdown/ifupdown_0.8.35.bb
index 53cb971d33..a8913e6e29 100644
--- a/meta/recipes-core/ifupdown/ifupdown_0.8.35.bb
+++ b/meta/recipes-core/ifupdown/ifupdown_0.8.35.bb
@@ -48,6 +48,13 @@ do_install_ptest () {
     cp -r ${S}/tests/linux ${D}${PTEST_PATH}/tests/
 }
 
+pkg_postinst_ontarget_${PN} () {
+    if [ ! -f /etc/network/interfaces ]; then
+        mkdir -p /etc/network
+        touch /etc/network/interfaces
+    fi
+}
+
 ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE_${PN} = "ifup ifdown"
 
-- 
2.17.1

