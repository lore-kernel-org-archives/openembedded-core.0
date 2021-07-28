Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.800.1627435412664253675
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jul 2021 18:23:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: changqing.li@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 16S1NUaB005179
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jul 2021 18:23:31 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 16S1NUHR028304
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jul 2021 18:23:30 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 27 Jul 2021 18:23:30 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 27 Jul 2021 18:23:29 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] archiver.bbclass: fix do_ar_configured failure for kernel
Date: Wed, 28 Jul 2021 09:21:22 +0800
Message-ID: <20210728012122.27696-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/classes/archiver.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 900268971c..dd31dc0cd8 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -281,7 +281,10 @@ python do_ar_configured() {
         # ${STAGING_DATADIR}/aclocal/libtool.m4, so we can't re-run the
         # do_configure, we archive the already configured ${S} to
         # instead of.
-        elif pn != 'libtool-native':
+        # The kernel class functions require it to be on work-shared, we
+        # don't unpack, patch, configure again, just archive the already
+        # configured ${S}
+        elif not (pn == 'libtool-native' or is_work_shared(d)):
             def runTask(task):
                 prefuncs = d.getVarFlag(task, 'prefuncs') or ''
                 for func in prefuncs.split():
-- 
2.17.1

