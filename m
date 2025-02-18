Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57B73C02198
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 07:12:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.14426.1739862747173834228
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 23:12:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4144056be1=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51I6hRlD023801
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Feb 2025 23:12:26 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44tq382h9f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Feb 2025 23:12:26 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 17 Feb 2025 23:12:25 -0800
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 17 Feb 2025 23:12:25 -0800
From: <mingli.yu@eng.windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH] procps: replaced one use of fputs(3) with a write(2) call
Date: Tue, 18 Feb 2025 15:12:24 +0800
Message-ID: <20250218071224.2238612-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: U16qZ00-5_yTNwV-MtBPR_6kktf57z0Q
X-Authority-Analysis: v=2.4 cv=fLPD3Yae c=1 sm=1 tr=0 ts=67b432da cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=T2h4t0Lz3GQA:10 a=p0WdMEafAAAA:8 a=t7CeM3EgAAAA:8 a=C_IRinGWAAAA:8 a=eLdoSaKvKJx6WDaDmVsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: U16qZ00-5_yTNwV-MtBPR_6kktf57z0Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-18_02,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=862 phishscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502180054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 07:12:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211563

From: Mingli Yu <mingli.yu@windriver.com>

This patch is ported from a merge request shown below,
and the following represents the original commit text.

------------------------------------------------------
top: In the bye_bye function, replace fputs with the write interface.

When top calls malloc, if a signal is received, it will
call sig_endpgm to process the signal. In the bye_bye function, if the
-b option is enable, the Batch variable is set, the fputs function
will calls malloc at the same time. The malloc function is not reentrant, so
it will cause the program to crash.

Signed-off-by: Shaohua Zhan <shaohua.zhan@windriver.com>
------------------------------------------------------

Reference(s):
https://gitlab.com/procps-ng/procps/-/merge_requests/127

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...x-for-the-bye_bye-function-merge-127.patch | 58 +++++++++++++++++++
 ...e-use-of-fputs-3-with-a-write-2-call.patch | 50 ++++++++++++++++
 meta/recipes-extended/procps/procps_3.3.17.bb |  2 +
 3 files changed, 110 insertions(+)
 create mode 100644 meta/recipes-extended/procps/procps/0001-top-fix-a-fix-for-the-bye_bye-function-merge-127.patch
 create mode 100644 meta/recipes-extended/procps/procps/0001-top-replaced-one-use-of-fputs-3-with-a-write-2-call.patch

diff --git a/meta/recipes-extended/procps/procps/0001-top-fix-a-fix-for-the-bye_bye-function-merge-127.patch b/meta/recipes-extended/procps/procps/0001-top-fix-a-fix-for-the-bye_bye-function-merge-127.patch
new file mode 100644
index 0000000000..bbc137a3d8
--- /dev/null
+++ b/meta/recipes-extended/procps/procps/0001-top-fix-a-fix-for-the-bye_bye-function-merge-127.patch
@@ -0,0 +1,58 @@
+From 37f106029975e3045b0cd779525d14c55d24b74e Mon Sep 17 00:00:00 2001
+From: Jim Warner <james.warner@comcast.net>
+Date: Mon, 21 Jun 2021 00:00:00 -0500
+Subject: [PATCH] top: fix a fix for the 'bye_bye' function (merge #127)
+
+In the merge request shown below, 1 too many bytes are
+written to stdout thus including the terminating null.
+As the cure, this commit just reduces the length by 1.
+
+[ along the way, we will remove some unneeded braces ]
+[ plus add some additional comments with attribution ]
+
+Reference(s):
+https://gitlab.com/procps-ng/procps/-/merge_requests/127
+. original merged change
+commit 0bf15c004db6a3342703a3c420a5692e376c457d
+
+Signed-off-by: Jim Warner <james.warner@comcast.net>
+
+Upstream-Status: Backport [https://gitlab.com/procps-ng/procps/-/commit/37f106029975e3045b0cd779525d14c55d24b74e]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ top/top.c | 14 +++++++++++---
+ 1 file changed, 11 insertions(+), 3 deletions(-)
+
+diff --git a/top/top.c b/top/top.c
+index 4d9860d5..0d21a1a5 100644
+--- a/top/top.c
++++ b/top/top.c
+@@ -569,13 +569,21 @@ static void bye_bye (const char *str) {
+ #endif // end: OFF_HST_HASH
+ 
+    numa_uninit();
++
++   /* we'll only have a 'str' if called by error_exit() |
++      or that xalloc_our_handler() function. if we were |
++      called from a sig_endpgm(), that parm is NULL ... | */
+    if (str) {
+       fputs(str, stderr);
+       exit(EXIT_FAILURE);
+    }
+-   if (Batch) {
+-      write(fileno(stdout), "\n", sizeof("\n"));
+-   }
++   /* this could happen when called from several places |
++      including that sig_endpgm().  thus we must use an |
++      async-signal-safe write function just in case ... |
++      (thanks: Shaohua Zhan shaohua.zhan@windriver.com) | */
++   if (Batch)
++      write(fileno(stdout), "\n", sizeof("\n") - 1);
++
+    exit(EXIT_SUCCESS);
+ } // end: bye_bye
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/procps/procps/0001-top-replaced-one-use-of-fputs-3-with-a-write-2-call.patch b/meta/recipes-extended/procps/procps/0001-top-replaced-one-use-of-fputs-3-with-a-write-2-call.patch
new file mode 100644
index 0000000000..4da13df047
--- /dev/null
+++ b/meta/recipes-extended/procps/procps/0001-top-replaced-one-use-of-fputs-3-with-a-write-2-call.patch
@@ -0,0 +1,50 @@
+From 6b8980a3b6279058d727377e914cfb6439d6f178 Mon Sep 17 00:00:00 2001
+From: Shaohua Zhan <shaohua.zhan@windriver.com>
+Date: Mon, 22 Mar 2021 00:00:00 +0800
+Subject: [PATCH] top: replaced one use of fputs(3) with a write(2) call
+
+This patch is ported from a merge request shown below,
+and the following represents the original commit text.
+
+------------------------------------------------------
+top: In the bye_bye function, replace fputs with the write interface.
+
+When top calls malloc, if a signal is received, it will
+call sig_endpgm to process the signal. In the bye_bye function, if the
+-b option is enable, the Batch variable is set, the fputs function
+will calls malloc at the same time. The malloc function is not reentrant, so
+it will cause the program to crash.
+
+Signed-off-by: Shaohua Zhan <shaohua.zhan@windriver.com>
+------------------------------------------------------
+
+Reference(s):
+https://gitlab.com/procps-ng/procps/-/merge_requests/127
+
+Signed-off-by: Jim Warner <james.warner@comcast.net>
+
+Upstream-Status: Backport [https://gitlab.com/procps-ng/procps/-/commit/6b8980a3b6279058d727377e914cfb6439d6f178]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ top/top.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/top/top.c b/top/top.c
+index f4f82be4..951c240c 100644
+--- a/top/top.c
++++ b/top/top.c
+@@ -417,7 +417,9 @@ static void bye_bye (const char *str) {
+       fputs(str, stderr);
+       exit(EXIT_FAILURE);
+    }
+-   if (Batch) fputs("\n", stdout);
++   if (Batch) {
++      write(fileno(stdout), "\n", sizeof("\n"));
++   }
+    exit(EXIT_SUCCESS);
+ } // end: bye_bye
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/procps/procps_3.3.17.bb b/meta/recipes-extended/procps/procps_3.3.17.bb
index bbec5a543c..131063efb9 100644
--- a/meta/recipes-extended/procps/procps_3.3.17.bb
+++ b/meta/recipes-extended/procps/procps_3.3.17.bb
@@ -18,6 +18,8 @@ SRC_URI = "git://gitlab.com/procps-ng/procps.git;protocol=https;branch=master \
            file://0002-proc-escape.c-add-missing-include.patch \
            file://CVE-2023-4016.patch \
            file://CVE-2023-4016-2.patch \
+           file://0001-top-replaced-one-use-of-fputs-3-with-a-write-2-call.patch \
+           file://0001-top-fix-a-fix-for-the-bye_bye-function-merge-127.patch \
            "
 SRCREV = "19a508ea121c0c4ac6d0224575a036de745eaaf8"
 
-- 
2.34.1


