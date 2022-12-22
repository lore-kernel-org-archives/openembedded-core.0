Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EE66C4332F
	for <webhook@archiver.kernel.org>; Thu, 22 Dec 2022 19:18:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.54122.1671736674787362201
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Dec 2022 11:17:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=DjQ1RU6g;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=935540d331=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BMIoqcB006667
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Dec 2022 11:17:54 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=ungG5wqJn0jaIdFl06To8p9MqRAeFsQCjVF8xw7cGZ8=;
 b=DjQ1RU6gzXd1VkoaTUj+dmY5cj55RGbUwrOFop7H16wIsMh3YRy5eIyExMkwQxxv+/F7
 jIkB0XwKvS1svTyHC2Bka1prlvKHvlIBPmTPAhZiU43gOA7fbBGVYyQM/I/s9D3EVsHW
 r8B9tjOJeFDLcIPWA05SJWSzx8ClrUYfj07xlmYM2uQhND2NhMqM2XUigwA4FZqs27zh
 Guh3F4OF5FRmd5r7xee1Ry7f6XcF0HaPS0tuFU+Y877WDKCJYNtx7xSderNR6rHeYftw
 BA0HckElZzs3kgIGH+uI2kKlg3i2r8UorcZVfB8r29BUSwWLRSaxRyX8uspZEUHpaDsA oQ== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mhe5qc159-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Dec 2022 11:17:54 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 22 Dec 2022 11:17:53 -0800
Received: from vme.wrs.com (172.25.44.4) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Thu, 22 Dec 2022 11:17:53 -0800
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] valgrind: skip the boost_thread test on arm
Date: Thu, 22 Dec 2022 14:17:53 -0500
Message-ID: <20221222191753.789795-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: yeUaxDsGxiRnFEDKkRrv3BBebEx0iGLN
X-Proofpoint-GUID: yeUaxDsGxiRnFEDKkRrv3BBebEx0iGLN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-22_10,2022-12-22_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=979 phishscore=0 mlxscore=0
 adultscore=0 spamscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212220164
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Dec 2022 19:18:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174972

This test is failing on the arm workers only so skip there until the issue
can be worked on and resolved. The bug #14311 will remain open for tracking.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64 b/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
index a9809e5d8c..4477f39132 100644
--- a/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
+++ b/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
@@ -1,3 +1,4 @@
+drd/tests/boost_thread
 gdbserver_tests/hgtls
 memcheck/tests/dw4
 memcheck/tests/leak_cpp_interior
-- 
2.34.1


