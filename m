Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.17695.1627896496410830085
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Aug 2021 02:28:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1729SDhk020431
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 2 Aug 2021 02:28:14 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 2 Aug 2021 02:28:13 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 2 Aug 2021 02:28:12 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <anuj.mittal@intel.com>
Subject: [hardknott][PATCH] curl: fix CVE-2021-22925
Date: Mon, 2 Aug 2021 17:25:50 +0800
Message-ID: <20210802092550.31148-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

CVS-2021-22925

Reported-by: Red Hat Product Security
Bug: https://curl.se/docs/CVE-2021-22925.html

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../curl/curl/CVE-2021-22925.patch            | 50 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.75.0.bb      |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2021-22925.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2021-22925.patch b/meta/recipes-support/curl/curl/CVE-2021-22925.patch
new file mode 100644
index 0000000000..21a79302ce
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2021-22925.patch
@@ -0,0 +1,50 @@
+From 894f6ec730597eb243618d33cc84d71add8d6a8a Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Sat, 12 Jun 2021 18:25:15 +0200
+Subject: [PATCH] telnet: fix option parser to not send uninitialized contents
+
+CVS-2021-22925
+
+Reported-by: Red Hat Product Security
+Bug: https://curl.se/docs/CVE-2021-22925.html
+
+CVE: CVS-2021-22925
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/894f6ec730597eb243618d33cc84d71add8d6a8a]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ lib/telnet.c | 17 +++++++++++------
+ 1 file changed, 11 insertions(+), 6 deletions(-)
+
+diff --git a/lib/telnet.c b/lib/telnet.c
+index 1d3024ec4..a81bb81c3 100644
+--- a/lib/telnet.c
++++ b/lib/telnet.c
+@@ -920,12 +920,17 @@ static void suboption(struct Curl_easy *data)
+         size_t tmplen = (strlen(v->data) + 1);
+         /* Add the variable only if it fits */
+         if(len + tmplen < (int)sizeof(temp)-6) {
+-          if(sscanf(v->data, "%127[^,],%127s", varname, varval) == 2) {
+-            msnprintf((char *)&temp[len], sizeof(temp) - len,
+-                      "%c%s%c%s", CURL_NEW_ENV_VAR, varname,
+-                      CURL_NEW_ENV_VALUE, varval);
+-            len += tmplen;
+-          }
++          int rv;
++          char sep[2] = "";
++          varval[0] = 0;
++          rv = sscanf(v->data, "%127[^,]%1[,]%127s", varname, sep, varval);
++          if(rv == 1)
++            len += msnprintf((char *)&temp[len], sizeof(temp) - len,
++                             "%c%s", CURL_NEW_ENV_VAR, varname);
++          else if(rv >= 2)
++            len += msnprintf((char *)&temp[len], sizeof(temp) - len,
++                             "%c%s%c%s", CURL_NEW_ENV_VAR, varname,
++                             CURL_NEW_ENV_VALUE, varval);
+         }
+       }
+       msnprintf((char *)&temp[len], sizeof(temp) - len,
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/curl/curl_7.75.0.bb b/meta/recipes-support/curl/curl_7.75.0.bb
index 42be2eb0b5..b2aad0bbc2 100644
--- a/meta/recipes-support/curl/curl_7.75.0.bb
+++ b/meta/recipes-support/curl/curl_7.75.0.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://vtls-fix-warning.patch \
            file://CVE-2021-22898.patch \
            file://CVE-2021-22897.patch \
+           file://CVE-2021-22925.patch \
 "
 
 SRC_URI[sha256sum] = "50552d4501c178e4cc68baaecc487f466a3d6d19bbf4e50a01869effb316d026"
-- 
2.31.1

