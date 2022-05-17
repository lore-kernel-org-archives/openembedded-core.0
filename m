Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 425EFC43217
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 08:17:01 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web11.4729.1652775413790803498
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 01:16:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 24H8Gmwr031048
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 May 2022 01:16:48 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 17 May 2022 01:16:42 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 17 May 2022 01:16:41 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <luca.ceresoli@bootlin.com>
Subject: [PATCH 7/7] python3-tornad: move from meta-python
Date: Tue, 17 May 2022 16:16:33 +0800
Message-ID: <20220517081633.2992360-7-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220517081633.2992360-1-mingli.yu@windriver.com>
References: <20220516104506.3d383183@melee>
 <20220517081633.2992360-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 08:17:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165718

From: Mingli Yu <mingli.yu@windriver.com>

Tornado is a Python web framework and asynchronous networking
library, originally developed at FriendFeed.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../python/python3-tornado_6.1.bb             | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-tornado_6.1.bb

diff --git a/meta/recipes-devtools/python/python3-tornado_6.1.bb b/meta/recipes-devtools/python/python3-tornado_6.1.bb
new file mode 100644
index 0000000000..1dedc51029
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-tornado_6.1.bb
@@ -0,0 +1,28 @@
+SUMMARY  = "Tornado is an open source version of the scalable, non-blocking web server and tools that power FriendFeed."
+DESCRIPTION = "Tornado is a Python web framework and asynchronous networking library, originally developed at FriendFeed. \
+By using non-blocking network I/O, Tornado can scale to tens of thousands of open connections, making it ideal for long \
+polling, WebSockets, and other applications that require a long-lived connection to each user."
+HOMEPAGE = "http://www.tornadoweb.org/en/stable/"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+SRC_URI[md5sum] = "f324f5e7607798552359d6ab054c4321"
+SRC_URI[sha256sum] = "33c6e81d7bd55b468d2e793517c909b139960b6c790a60b7991b9b6b76fb9791"
+
+inherit pypi setuptools3
+
+# Requires _compression which is currently located in misc
+RDEPENDS:${PN} += "${PYTHON_PN}-compression ${PYTHON_PN}-numbers ${PYTHON_PN}-email \
+                   ${PYTHON_PN}-pkgutil ${PYTHON_PN}-html ${PYTHON_PN}-json ${PYTHON_PN}-certifi ${PYTHON_PN}-threading \
+                   ${PYTHON_PN}-ctypes ${PYTHON_PN}-misc"
+
+RDEPENDS:${PN}-test += "${PN} ${PYTHON_PN}-unittest"
+
+PACKAGES =+ "\
+    ${PN}-test \
+"
+
+FILES:${PN}-test = " \
+    ${libdir}/${PYTHON_DIR}/site-packages/*/test \
+    ${libdir}/${PYTHON_DIR}/site-packages/*/testing.py* \
+"
-- 
2.25.1


