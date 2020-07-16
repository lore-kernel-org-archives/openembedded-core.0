Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.13150.1594897802707389377
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2020 04:10:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: liezhi.yang@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 06GB9VCx027691
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2020 04:09:52 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Thu, 16 Jul 2020
 04:09:42 -0700
From: "Robert Yang" <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/1] openssl: openssl-bin requires openssl-conf to run
Date: Thu, 16 Jul 2020 04:09:21 -0700
Message-ID: <3541ef9cd5a1ebdfa20e9bfe1b1dacf4589bf2fd.1594897729.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594897729.git.liezhi.yang@windriver.com>
References: <cover.1594897729.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

Fixed:
$ dnf install openssl-bin
$ openssl req -new -x509 -keyout lighttpd.pem -out lighttpd.pem -days 365 -nodes -batch
Can't open /usr/lib/ssl-1.1/openssl.cnf for reading, No such file or directory

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1g.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
index 47ed6b7640..815955837b 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
@@ -204,6 +204,8 @@ CONFFILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
 RRECOMMENDS_libcrypto += "openssl-conf"
 RDEPENDS_${PN}-ptest += "openssl-bin perl perl-modules bash"
 
+RDEPENDS_${PN}-bin += "openssl-conf"
+
 BBCLASSEXTEND = "native nativesdk"
 
 CVE_PRODUCT = "openssl:openssl"
-- 
2.17.1

