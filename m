Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.13019.1597386171889444153
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2020 23:22:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 07E6MoRA024885
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2020 23:22:50 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Thu, 13 Aug 2020 23:22:47 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <kai.kang@windriver.com>
Subject: [PATCH] gpgme: fix multilib header conflict
Date: Fri, 14 Aug 2020 14:18:02 +0800
Message-ID: <20200814061802.314064-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

fix error:
file /usr/include/gpgme.h conflicts between attempted installs of gpgme-dev-1.13.1-r0.core2_64 and lib32-gpgme-dev-1.13.1-r0.core2_32

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-support/gpgme/gpgme_1.13.1.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-support/gpgme/gpgme_1.13.1.bb b/meta/recipes-support/gpgme/gpgme_1.13.1.bb
index 9fc1ae24a4..0f9f4686dc 100644
--- a/meta/recipes-support/gpgme/gpgme_1.13.1.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.13.1.bb
@@ -83,3 +83,8 @@ do_configure_prepend () {
 	rm -f ${S}/m4/libassuan.m4
 	rm -f ${S}/m4/python.m4
 }
+
+inherit multilib_header
+do_install_append() {
+       oe_multilib_header gpgme.h
+}
-- 
2.17.1

