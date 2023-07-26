Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3779C001DC
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 08:16:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6557.1690359364796056609
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jul 2023 01:16:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=657121c14f=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36Q7hkJx019268
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 08:16:04 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s0636bb01-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 08:16:04 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 01:15:56 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 01:15:55 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [mickledore][PATCH] cups: Fix CVE-2023-34241
Date: Wed, 26 Jul 2023 16:15:54 +0800
Message-ID: <20230726081554.3400144-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.35.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: tH2zpSQh5vW2moq_d3tLjLEeCxGJQpd9
X-Proofpoint-ORIG-GUID: tH2zpSQh5vW2moq_d3tLjLEeCxGJQpd9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-26_01,2023-07-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=883 clxscore=1015 mlxscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2307260073
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 08:16:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184867

From: Mingli Yu <mingli.yu@windriver.com>

Backport patch [1] to fix CVE-2023-34241.

[1] https://github.com/OpenPrinting/cups/commit/9809947a959e18409dcf562a3466ef246cb90cb2

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-extended/cups/cups.inc           |  1 +
 .../cups/cups/CVE-2023-34241.patch            | 70 +++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2023-34241.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index d77758fd3f..c6a676b747 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -16,6 +16,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://volatiles.99_cups \
            file://cups-volatiles.conf \
            file://CVE-2023-32324.patch \
+           file://CVE-2023-34241.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2023-34241.patch b/meta/recipes-extended/cups/cups/CVE-2023-34241.patch
new file mode 100644
index 0000000000..4950ca341d
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2023-34241.patch
@@ -0,0 +1,70 @@
+From ffd290b4ab247f82722927ba9b21358daa16dbf1 Mon Sep 17 00:00:00 2001
+From: Rose <83477269+AtariDreams@users.noreply.github.com>
+Date: Thu, 1 Jun 2023 11:33:39 -0400
+Subject: [PATCH] Log result of httpGetHostname BEFORE closing the connection
+
+httpClose frees the memory of con->http. This is problematic because httpGetHostname then tries to access the memory it points to.
+
+We have to log the hostname first.
+
+CVE: CVE-2023-34241
+
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/9809947a959e18409dcf562a3466ef246cb90cb2]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ scheduler/client.c | 16 +++++++---------
+ 1 file changed, 7 insertions(+), 9 deletions(-)
+
+diff --git a/scheduler/client.c b/scheduler/client.c
+index 91e441188..327473a4d 100644
+--- a/scheduler/client.c
++++ b/scheduler/client.c
+@@ -193,13 +193,11 @@ cupsdAcceptClient(cupsd_listener_t *lis)/* I - Listener socket */
+    /*
+     * Can't have an unresolved IP address with double-lookups enabled...
+     */
+-
+-    httpClose(con->http);
+-
+     cupsdLogClient(con, CUPSD_LOG_WARN,
+-                    "Name lookup failed - connection from %s closed!",
++                    "Name lookup failed - closing connection from %s!",
+                     httpGetHostname(con->http, NULL, 0));
+ 
++    httpClose(con->http);
+     free(con);
+     return;
+   }
+@@ -235,11 +233,11 @@ cupsdAcceptClient(cupsd_listener_t *lis)/* I - Listener socket */
+       * with double-lookups enabled...
+       */
+ 
+-      httpClose(con->http);
+-
+       cupsdLogClient(con, CUPSD_LOG_WARN,
+-                      "IP lookup failed - connection from %s closed!",
++                      "IP lookup failed - closing connection from %s!",
+                       httpGetHostname(con->http, NULL, 0));
++
++      httpClose(con->http);
+       free(con);
+       return;
+     }
+@@ -256,11 +254,11 @@ cupsdAcceptClient(cupsd_listener_t *lis)/* I - Listener socket */
+ 
+   if (!hosts_access(&wrap_req))
+   {
+-    httpClose(con->http);
+-
+     cupsdLogClient(con, CUPSD_LOG_WARN,
+                     "Connection from %s refused by /etc/hosts.allow and "
+ 		    "/etc/hosts.deny rules.", httpGetHostname(con->http, NULL, 0));
++
++    httpClose(con->http);
+     free(con);
+     return;
+   }
+-- 
+2.25.1
+
-- 
2.35.5


