Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.14926.1627871380963783523
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Aug 2021 19:29:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: changqing.li@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 1722Tejx003787
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Sun, 1 Aug 2021 19:29:40 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 1722TdqT003782
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Sun, 1 Aug 2021 19:29:40 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 1 Aug 2021 19:29:39 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Sun, 1 Aug 2021 19:29:38 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH] archiver.bbclass: fix do_ar_configured failure for kernel
Date: Mon, 2 Aug 2021 10:27:17 +0800
Message-ID: <20210802022717.16022-1-changqing.li@windriver.com>
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

