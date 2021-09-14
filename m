Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.6655.1631603481967465788
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Sep 2021 00:11:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 18E7BJII027184
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Sep 2021 00:11:19 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 14 Sep 2021 00:11:18 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 14 Sep 2021 00:11:18 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/3] multilib.bbclass: add RDEPENDS related check back
Date: Tue, 14 Sep 2021 15:06:50 +0800
Message-ID: <20210914070652.10294-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

When multilib enabled, instead of checking RDEPENDS_lib32-python3-core,
we should check RDEPENDS:lib32-python3-core as new override syntax applied.

So switch to new override syntax to make sure the related RDEPENDS check
logic is in effect.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/classes/multilib.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 3cbda5d806..b210c49c0c 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -196,7 +196,7 @@ PACKAGEFUNCS:append = " do_package_qa_multilib"
 python do_package_qa_multilib() {
 
     def check_mlprefix(pkg, var, mlprefix):
-        values = bb.utils.explode_deps(d.getVar('%s_%s' % (var, pkg)) or d.getVar(var) or "")
+        values = bb.utils.explode_deps(d.getVar('%s:%s' % (var, pkg)) or d.getVar(var) or "")
         candidates = []
         for i in values:
             if i.startswith('virtual/'):
-- 
2.32.0

