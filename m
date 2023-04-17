Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA04AC77B70
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 06:22:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.47447.1681712530361951249
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Apr 2023 23:22:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=347187e0b3=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33H6BVr7004734
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Apr 2023 23:22:10 -0700
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pyq76j46a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Apr 2023 23:22:09 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 16 Apr 2023 23:22:09 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Sun, 16 Apr 2023 23:22:08 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH] curl: Fix CVE-2023-27536
Date: Mon, 17 Apr 2023 14:22:07 +0800
Message-ID: <20230417062207.3870781-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Ld9ecoB3IkcSani5azSy1a6p_Cx3ihjX
X-Proofpoint-GUID: Ld9ecoB3IkcSani5azSy1a6p_Cx3ihjX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-17_02,2023-04-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=678 spamscore=0
 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304170058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 06:22:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180120

From: Mingli Yu <mingli.yu@windriver.com>

Backport patch [1] to fix CVE-2023-27536.

[1] https://github.com/curl/curl/commit/cb49e67303dba

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../curl/curl/CVE-2023-27536.patch            | 57 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27536.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-27536.patch b/meta/recipes-support/curl/curl/CVE-2023-27536.patch
new file mode 100644
index 0000000000..842c70785a
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-27536.patch
@@ -0,0 +1,57 @@
+From 6b1ef6d5ebbfd5e68dea1eea2dc0c6cc4dc2e394 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 17 Apr 2023 05:36:18 +0000
+Subject: [PATCH] url: only reuse connections with same GSS delegation
+
+Reported-by: Harry Sintonen
+Closes #10731
+
+CVE: CVE-2023-27536
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/cb49e67303dba]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ lib/url.c     | 6 ++++++
+ lib/urldata.h | 1 +
+ 2 files changed, 7 insertions(+)
+
+diff --git a/lib/url.c b/lib/url.c
+index df4377d..8c43c3b 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -1350,6 +1350,11 @@ ConnectionExists(struct Curl_easy *data,
+         }
+       }
+ 
++      /* GSS delegation differences do not actually affect every connection
++         and auth method, but this check takes precaution before efficiency */
++      if(needle->gssapi_delegation != check->gssapi_delegation)
++        continue;
++
+       /* If multiplexing isn't enabled on the h2 connection and h1 is
+          explicitly requested, handle it: */
+       if((needle->handler->protocol & PROTO_FAMILY_HTTP) &&
+@@ -1807,6 +1812,7 @@ static struct connectdata *allocate_conn(struct Curl_easy *data)
+   conn->fclosesocket = data->set.fclosesocket;
+   conn->closesocket_client = data->set.closesocket_client;
+   conn->lastused = Curl_now(); /* used now */
++  conn->gssapi_delegation = data->set.gssapi_delegation;
+ 
+   return conn;
+   error:
+diff --git a/lib/urldata.h b/lib/urldata.h
+index 69eb2ee..c2a7e6c 100644
+--- a/lib/urldata.h
++++ b/lib/urldata.h
+@@ -1131,6 +1131,7 @@ struct connectdata {
+   int socks5_gssapi_enctype;
+ #endif
+   unsigned short localport;
++  unsigned char gssapi_delegation; /* inherited from set.gssapi_delegation */
+ };
+ 
+ /* The end of connectdata. */
+-- 
+2.23.0
+
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index 945745cdde..888527857a 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -40,6 +40,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2023-23914_5-4.patch \
            file://CVE-2023-23914_5-5.patch \
            file://CVE-2023-23916.patch \
+           file://CVE-2023-27536.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 
-- 
2.25.1


