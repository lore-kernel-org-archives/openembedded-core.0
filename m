Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web08.295.1630092734411853533
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Aug 2021 12:32:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: sakib.sajal@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 17RJWD96017023
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Aug 2021 12:32:13 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 27 Aug 2021 12:32:12 -0700
Received: from localhost.localdomain (128.224.73.156) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 27 Aug 2021 12:32:12 -0700
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] buildstats.bbclass: collect host data only when do_testimage fails
Date: Fri, 27 Aug 2021 15:32:10 -0400
Message-ID: <20210827193210.349031-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/classes/buildstats.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbclass
index 0de605200a..874d30b292 100644
--- a/meta/classes/buildstats.bbclass
+++ b/meta/classes/buildstats.bbclass
@@ -250,7 +250,7 @@ python run_buildstats () {
                     except subprocess.CalledProcessError as err:
                         bb.warn("Failed to get rootfs size: %s" % err.output.decode('utf-8'))
 
-    elif isinstance(e, bb.build.TaskFailed):
+    elif isinstance(e, bb.build.TaskFailed) and e.task == "do_testimage":
         # Can have a failure before TaskStarted so need to mkdir here too
         bb.utils.mkdirhier(taskdir)
         write_task_data("failed", os.path.join(taskdir, e.task), e, d)
-- 
2.25.1

