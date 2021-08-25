Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web09.12207.1629879059702655121
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 01:10:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 17P8AvPN020574
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Aug 2021 01:10:58 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 25 Aug 2021 01:10:57 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Wed, 25 Aug 2021 01:10:57 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 25 Aug 2021 01:10:56 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] libcgroup: remove static pam library
Date: Wed, 25 Aug 2021 16:10:54 +0800
Message-ID: <20210825081054.40523-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

libpam disables static build by default, so remove static pam library of
libcgroup. Otherwise it complains QA issue:

| ERROR: libcgroup-2.0-r0 do_package: QA Issue: libcgroup:
         Files/directories were installed but not shipped in any package:
|  /lib/security/pam_cgroup.a

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-core/libcgroup/libcgroup_2.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/libcgroup/libcgroup_2.0.bb b/meta/recipes-core/libcgroup/libcgroup_2.0.bb
index bc0a75d46c..f48b8ece9b 100644
--- a/meta/recipes-core/libcgroup/libcgroup_2.0.bb
+++ b/meta/recipes-core/libcgroup/libcgroup_2.0.bb
@@ -31,4 +31,5 @@ FILES:${PN}-dev += "${base_libdir}/security/*.la"
 do_install:append() {
 	# Until we ship the test suite, this library isn't useful
 	rm -f ${D}${libdir}/libcgroupfortesting.*
+	rm -f ${D}${base_libdir}/security/pam_cgroup.a
 }
-- 
2.17.1

