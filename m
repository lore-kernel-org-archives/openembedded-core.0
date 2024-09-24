Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5942ACF9C71
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 08:45:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.9118.1727167505643865645
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 01:45:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=99972f2181=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48O6q8Km005712
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 01:45:05 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41um550b5b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 01:45:05 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 24 Sep 2024 01:45:04 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Tue, 24 Sep 2024 01:45:03 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH] curl: free old conn better on reuse
Date: Tue, 24 Sep 2024 16:45:03 +0800
Message-ID: <20240924084503.6745-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Z/q+H2RA c=1 sm=1 tr=0 ts=66f27c11 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=EaEq8P2WXUwA:10 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=ugkhXdxtAAAA:8 a=tOIo0kB1ZWwfE7-IxJ4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: jHm5NnkrN28AOCDvr2XZN9LocuIBnsBw
X-Proofpoint-GUID: jHm5NnkrN28AOCDvr2XZN9LocuIBnsBw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-24_02,2024-09-23_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=951 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2408220000 definitions=main-2409240060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 08:45:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204843

From: Mingli Yu <mingli.yu@windriver.com>

Backport a patch [1] to free old conn better on reuse to
fix the memory leak issue [2].

[1] https://github.com/curl/curl/commit/06d1210
[2] https://github.com/curl/curl/issues/8841

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...01-url-free-old-conn-better-on-reuse.patch | 95 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |  1 +
 2 files changed, 96 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/0001-url-free-old-conn-better-on-reuse.patch

diff --git a/meta/recipes-support/curl/curl/0001-url-free-old-conn-better-on-reuse.patch b/meta/recipes-support/curl/curl/0001-url-free-old-conn-better-on-reuse.patch
new file mode 100644
index 0000000000..520fd01b5e
--- /dev/null
+++ b/meta/recipes-support/curl/curl/0001-url-free-old-conn-better-on-reuse.patch
@@ -0,0 +1,95 @@
+From 06d12105c7aa883a62802e36eebb76d5303247d0 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Sat, 14 May 2022 18:04:46 +0200
+Subject: [PATCH] url: free old conn better on reuse
+
+Make use of conn_free() better and avoid duplicate code.
+
+Reported-by: Andrea Pappacoda
+Fixes #8841
+Closes #8842
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/06d12105c7aa883a62802e36eebb76d5303247d0]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ lib/url.c | 34 ++++------------------------------
+ 1 file changed, 4 insertions(+), 30 deletions(-)
+
+diff --git a/lib/url.c b/lib/url.c
+index 631e49696..c2d9e78f4 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -3498,17 +3498,6 @@ static void reuse_conn(struct Curl_easy *data,
+      **established** from the primary socket to a remote address. */
+   char local_ip[MAX_IPADR_LEN] = "";
+   int local_port = -1;
+-#ifndef CURL_DISABLE_PROXY
+-  Curl_free_idnconverted_hostname(&old_conn->http_proxy.host);
+-  Curl_free_idnconverted_hostname(&old_conn->socks_proxy.host);
+-
+-  free(old_conn->http_proxy.host.rawalloc);
+-  free(old_conn->socks_proxy.host.rawalloc);
+-  Curl_free_primary_ssl_config(&old_conn->proxy_ssl_config);
+-#endif
+-  /* free the SSL config struct from this connection struct as this was
+-     allocated in vain and is targeted for destruction */
+-  Curl_free_primary_ssl_config(&old_conn->ssl_config);
+ 
+   /* get the user+password information from the old_conn struct since it may
+    * be new for this request even when we re-use an existing connection */
+@@ -3539,20 +3528,17 @@ static void reuse_conn(struct Curl_easy *data,
+     old_conn->http_proxy.passwd = NULL;
+     old_conn->socks_proxy.passwd = NULL;
+   }
+-  Curl_safefree(old_conn->http_proxy.user);
+-  Curl_safefree(old_conn->socks_proxy.user);
+-  Curl_safefree(old_conn->http_proxy.passwd);
+-  Curl_safefree(old_conn->socks_proxy.passwd);
+ #endif
+ 
+-  /* host can change, when doing keepalive with a proxy or if the case is
+-     different this time etc */
+   Curl_free_idnconverted_hostname(&conn->host);
+   Curl_free_idnconverted_hostname(&conn->conn_to_host);
+   Curl_safefree(conn->host.rawalloc);
+   Curl_safefree(conn->conn_to_host.rawalloc);
+   conn->host = old_conn->host;
++  old_conn->host.rawalloc = NULL;
++  old_conn->host.encalloc = NULL;
+   conn->conn_to_host = old_conn->conn_to_host;
++  old_conn->conn_to_host.rawalloc = NULL;
+   conn->conn_to_port = old_conn->conn_to_port;
+   conn->remote_port = old_conn->remote_port;
+   Curl_safefree(conn->hostname_resolve);
+@@ -3572,15 +3558,7 @@ static void reuse_conn(struct Curl_easy *data,
+   /* re-use init */
+   conn->bits.reuse = TRUE; /* yes, we're re-using here */
+ 
+-  Curl_safefree(old_conn->user);
+-  Curl_safefree(old_conn->passwd);
+-  Curl_safefree(old_conn->options);
+-  Curl_safefree(old_conn->localdev);
+-  Curl_llist_destroy(&old_conn->easyq, NULL);
+-
+-#ifdef USE_UNIX_SOCKETS
+-  Curl_safefree(old_conn->unix_domain_socket);
+-#endif
++  conn_free(old_conn);
+ }
+ 
+ /**
+@@ -3930,10 +3908,6 @@ static CURLcode create_conn(struct Curl_easy *data,
+      * allocated before we can move along and use the previously existing one.
+      */
+     reuse_conn(data, conn, conn_temp);
+-#ifdef USE_SSL
+-    free(conn->ssl_extra);
+-#endif
+-    free(conn);          /* we don't need this anymore */
+     conn = conn_temp;
+     *in_connect = conn;
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index 308b508072..ab1f58922a 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -60,6 +60,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2024-2398.patch \
            file://CVE-2024-7264_1.patch \
            file://CVE-2024-7264_2.patch \
+           file://0001-url-free-old-conn-better-on-reuse.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 
-- 
2.34.1


