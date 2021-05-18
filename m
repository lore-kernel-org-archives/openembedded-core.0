Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.5243.1621321617372686092
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 May 2021 00:06:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: qi.chen@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 14I76t8x025537
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 18 May 2021 00:06:55 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 18 May 2021 00:06:55 -0700
Received: from ala-lpggp7.wrs.com (147.11.105.171) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.4 via Frontend Transport; Tue, 18 May 2021 00:06:55 -0700
From: "Chen Qi" <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] sanity.bbclass: also check invalid char for SDKPATH
Date: Tue, 18 May 2021 00:06:55 -0700
Message-ID: <20210518070655.39921-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The invalid char check are now only for COREBASE and TMPDIR, however,
the SDKPATH with special char could also cause problem.

e.g.
bitbake nativesdk-xxhash
And we get the following error message.
Makefile:422: *** configured libdir (/opt/poky/3.3+snapshot/sysroots/x86_64-pokysdk-linux/usr/lib) is outside of exec_prefix (/opt/poky/3.3+snapshot/sysroots/x86_6\
4-pokysdk-linux/usr), can't generate pkg-config file.  Stop.

This is because we have '+' in SDKPATH.

FOR SDKPATH, the valid char requirement should be the same with TMPDIR.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/sanity.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index e907a3566f..727ff5a768 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -885,7 +885,7 @@ def check_sanity_everybuild(status, d):
         except:
             pass
 
-    for checkdir in ['COREBASE', 'TMPDIR']:
+    for checkdir in ['COREBASE', 'TMPDIR', 'SDKPATH']:
         val = d.getVar(checkdir)
         if val.find('..') != -1:
             status.addresult("Error, you have '..' in your %s directory path. Please ensure the variable contains an absolute path as this can break some recipe builds in obtuse ways." % checkdir)
-- 
2.30.2

