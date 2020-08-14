Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.13141.1597386959545084715
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2020 23:36:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 07E6ZvSv027164
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2020 23:35:58 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Thu, 13 Aug 2020 23:35:57 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH V2] gpgme: fix multilib header conflict
Date: Fri, 14 Aug 2020 14:31:12 +0800
Message-ID: <20200814063112.333841-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <162B0E429CD0C931.6763@lists.openembedded.org>
References: <162B0E429CD0C931.6763@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

fix error:
file /usr/include/gpgme.h conflicts between attempted installs of gpgme-dev-1.13.1-r0.core2_64 and lib32-gpgme-dev-1.13.1-r0.core2_32

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-support/gpgme/gpgme_1.13.1.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/gpgme/gpgme_1.13.1.bb b/meta/recipes-support/gpgme/gpgme_1.13.1.bb
index 9fc1ae24a4..b51534351d 100644
--- a/meta/recipes-support/gpgme/gpgme_1.13.1.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.13.1.bb
@@ -59,7 +59,7 @@ EXTRA_OECONF += '--enable-languages="${LANGUAGES}" \
                  --disable-lang-python-test \
 '
 
-inherit autotools texinfo binconfig-disabled pkgconfig distutils-common-base ${PYTHON_INHERIT}
+inherit autotools texinfo binconfig-disabled pkgconfig distutils-common-base ${PYTHON_INHERIT} multilib_header
 
 export PKG_CONFIG='pkg-config'
 
@@ -83,3 +83,7 @@ do_configure_prepend () {
 	rm -f ${S}/m4/libassuan.m4
 	rm -f ${S}/m4/python.m4
 }
+
+do_install_append() {
+       oe_multilib_header gpgme.h
+}
-- 
2.17.1

