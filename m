Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FBA0C76196
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 16:27:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.59847.1680280029634772560
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Mar 2023 09:27:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Q0FDN6Tb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3454c284ed=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32VG8foV027569
	for <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 16:27:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=YExOcsIBVpmP3ACGbNOuKLsgaTkHhkoAXgZZD4vKtGk=;
 b=Q0FDN6TbI7Ll+orncvF1dOwJ2ff5m66bTKMLlOMyvxRMApnyxiR4jn4zy5o7m3wu9blV
 z6kOqn51+FiIZa5iA1NojETtEHA1oyJBHS3P4vjKVM0sMmata8lNwrigmPbyyBrjKU6H
 qoWGCN0HGftXsR6/Fpq5B/lwOGQfIFcWYJN0oTau2kn8tSW43GEGiI6skTOb9u4Fa2EK
 ew65zYZL6w7wlohN/ovvcCyCBe6m05rc+a5+OEDrxVCagq9sQdbpzf8LSPubZWiKMoAy
 N9qDemd/rJAjgJduLMVsMnTo1RTYPVCwbhHSEY6A3m20RKBvnwITOSfDCt4bq0GoP3FO Dg== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3php6483gw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 16:27:08 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 31 Mar 2023 09:27:07 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Fri, 31 Mar 2023 09:27:06 -0700
From: Soumya <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Soumya <soumya.sambu@windriver.com>
Subject: [oe-core][PATCH 1/1] shadow: Fix can not print full login timeout message
Date: Fri, 31 Mar 2023 16:26:51 +0000
Message-ID: <20230331162651.760229-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: k_KINFuFOt0Ry7ZL-L6oBetC2DnJZen5
X-Proofpoint-GUID: k_KINFuFOt0Ry7ZL-L6oBetC2DnJZen5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-31_07,2023-03-31_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 clxscore=1011 mlxscore=0 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303310131
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 16:27:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179453

When we do not enter password during login, it is expected to display message "Login timed out after 60 seconds". But it prints only first few bytes(like "Login t") when write is immediately followed by exit.
Fix - Calling exit from new handler provides enough time to display full message.

Upstream-Status: Accepted [https://github.com/shadow-maint/shadow/commit/670cae834827a8f794e6f7464fa57790d911b63c]

Signed-off-by: Soumya <soumya.sambu@windriver.com>
---
 .../0001-Fix-can-not-print-full-login.patch   | 41 +++++++++++++++++++
 meta/recipes-extended/shadow/shadow.inc       |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-extended/shadow/files/0001-Fix-can-not-print-full-login.patch

diff --git a/meta/recipes-extended/shadow/files/0001-Fix-can-not-print-full-login.patch b/meta/recipes-extended/shadow/files/0001-Fix-can-not-print-full-login.patch
new file mode 100644
index 0000000000..37ba5f3dc2
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/0001-Fix-can-not-print-full-login.patch
@@ -0,0 +1,41 @@
+commit 670cae834827a8f794e6f7464fa57790d911b63c
+Author: SoumyaWind <121475834+SoumyaWind@users.noreply.github.com>
+Date:   Tue Dec 27 17:40:17 2022 +0530
+
+    shadow: Fix can not print full login timeout message
+    
+    Login timed out message prints only first few bytes when write is immediately followed by exit.
+    Calling exit from new handler provides enough time to display full message.
+
+Upstream-Status: Accepted [https://github.com/shadow-maint/shadow/commit/670cae834827a8f794e6f7464fa57790d911b63c]
+
+diff --git a/src/login.c b/src/login.c
+index 116e2cb3..c55f4de0 100644
+--- a/src/login.c
++++ b/src/login.c
+@@ -120,6 +120,7 @@ static void get_pam_user (char **ptr_pam_user);
+ 
+ static void init_env (void);
+ static void alarm_handler (int);
++static void exit_handler (int);
+ 
+ /*
+  * usage - print login command usage and exit
+@@ -391,11 +392,16 @@ static void init_env (void)
+ #endif				/* !USE_PAM */
+ }
+ 
++static void exit_handler (unused int sig)
++{
++	_exit (0);
++}
+ 
+ static void alarm_handler (unused int sig)
+ {
+ 	write (STDERR_FILENO, tmsg, strlen (tmsg));
+-	_exit (0);
++	signal(SIGALRM, exit_handler);
++	alarm(2);
+ }
+ 
+ #ifdef USE_PAM
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 2c70a2d00e..52b10000ee 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -14,6 +14,7 @@ GITHUB_BASE_URI = "https://github.com/shadow-maint/shadow/releases"
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://useradd \
+	   file://0001-Fix-can-not-print-full-login.patch \
            "
 
 SRC_URI:append:class-target = " \
-- 
2.34.1


