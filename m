Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.6654.1631603481578166898
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Sep 2021 00:11:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: mingli.yu@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 18E7BK5Q014517
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Sep 2021 00:11:21 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 18E7BKAa009054
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Sep 2021 00:11:20 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 14 Sep 2021 00:11:20 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 14 Sep 2021 00:11:19 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/3] insane.bbclass: add FILERDEPENDS related check back
Date: Tue, 14 Sep 2021 15:06:51 +0800
Message-ID: <20210914070652.10294-2-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210914070652.10294-1-mingli.yu@windriver.com>
References: <20210914070652.10294-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Instead of FILERDEPENDS_*, the FILERDEPENDS should be FILERDEPENDS:*
such as FILERDEPENDS:/usr/bin/python3.9:lib32-python3-core as an example,
so switch to new override syntax to make sure the related check in effect.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/classes/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 20d4e4d746..f2d2ca3689 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -780,7 +780,7 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
             filerdepends = {}
             rdep_data = oe.packagedata.read_subpkgdata(pkg, d)
             for key in rdep_data:
-                if key.startswith("FILERDEPENDS_"):
+                if key.startswith("FILERDEPENDS:"):
                     for subkey in bb.utils.explode_deps(rdep_data[key]):
                         if subkey not in ignored_file_rdeps and \
                                 not subkey.startswith('perl('):
-- 
2.32.0

