Received: from huawei.com (huawei.com [45.249.212.191])
 by mx.groups.io with SMTP id smtpd.web12.8747.1591169931401136791
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2020 00:38:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: huawei.com, ip: 45.249.212.191, mailfrom: zhengjunling@huawei.com)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 32314B3CC866867CE329
	for <openembedded-core@lists.openembedded.org>; Wed,  3 Jun 2020 15:38:48 +0800 (CST)
Received: from HULK-Android.huawei.com (10.113.189.218) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Wed, 3 Jun 2020 15:38:39 +0800
From: "Junling Zheng" <zhengjunling@huawei.com>
To: <openembedded-core@lists.openembedded.org>
CC: <fanyiming@huawei.com>
Subject: [OE-core] [PATCH 2/2] buildstats.bbclass: Do not recalculate build start time
Date: Wed, 3 Jun 2020 15:38:28 +0800
Message-ID: <20200603073828.7704-2-zhengjunling@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200603073828.7704-1-zhengjunling@huawei.com>
References: <20200603073828.7704-1-zhengjunling@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.113.189.218]
X-CFilter-Loop: Reflected
Content-Type: text/plain

The build start time is recorded in __timedata_build, which we should
use rather than recalculating it.

Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
---
 meta/classes/buildstats.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbclass
index e7d47c74df..6f87187233 100644
--- a/meta/classes/buildstats.bbclass
+++ b/meta/classes/buildstats.bbclass
@@ -136,7 +136,7 @@ python run_buildstats () {
                 if x:
                     f.write(x + " ")
             f.write("\n")
-            f.write("Build Started: %0.2f \n" % time.time())
+            f.write("Build Started: %0.2f \n" % d.getVar('__timedata_build', False)[0])
 
     elif isinstance(e, bb.event.BuildCompleted):
         build_time = os.path.join(bsdir, "build_stats")
-- 
2.17.1

