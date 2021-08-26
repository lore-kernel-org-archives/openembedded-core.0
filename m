Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web09.24781.1629942638834224044
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 18:50:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: kai.kang@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 17Q1oZ07013766
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Wed, 25 Aug 2021 18:50:36 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 17Q1oZKh016932
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 25 Aug 2021 18:50:35 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 25 Aug 2021 18:50:35 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Wed, 25 Aug 2021 18:50:34 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 25 Aug 2021 18:50:33 -0700
From: "kai" <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2] libcgroup: fix installed-vs-shipped qa issue
Date: Thu, 26 Aug 2021 09:50:31 +0800
Message-ID: <20210826015031.39102-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

When pam is enabled, it complains installed-vs-shipped QA issue:

| ERROR: libcgroup-2.0-r0 do_package: QA Issue: libcgroup:
         Files/directories were installed but not shipped in any package:
|  /lib/security/pam_cgroup.a

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-core/libcgroup/libcgroup_2.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/libcgroup/libcgroup_2.0.bb b/meta/recipes-core/libcgroup/libcgroup_2.0.bb
index bc0a75d46c..a58dd88ea5 100644
--- a/meta/recipes-core/libcgroup/libcgroup_2.0.bb
+++ b/meta/recipes-core/libcgroup/libcgroup_2.0.bb
@@ -27,6 +27,7 @@ PACKAGECONFIG[pam] = "--enable-pam-module-dir=${base_libdir}/security --enable-p
 PACKAGES =+ "cgroups-pam-plugin"
 FILES:cgroups-pam-plugin = "${base_libdir}/security/pam_cgroup.so*"
 FILES:${PN}-dev += "${base_libdir}/security/*.la"
+FILES:${PN}-staticdev += "${base_libdir}/security/pam_cgroup.a"
 
 do_install:append() {
 	# Until we ship the test suite, this library isn't useful
-- 
2.17.1

