Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web12.24726.1628523364931716435
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Aug 2021 08:36:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10070"; a="278466900"
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; 
   d="scan'208";a="278466900"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2021 08:36:28 -0700
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; 
   d="scan'208";a="483462970"
Received: from abinzahx-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.229.181])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2021 08:36:27 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 18/23] curl: fix CVE-2021-22925
Date: Mon,  9 Aug 2021 23:35:50 +0800
Message-Id: <ee0340c35f811dd1c0926480673a7fec7bbb985b.1628522214.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1628522214.git.anuj.mittal@intel.com>
References: <cover.1628522214.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mingli Yu <mingli.yu@windriver.com>

CVE-2021-22925

Reported-by: Red Hat Product Security
Bug: https://curl.se/docs/CVE-2021-22925.html

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../curl/curl/CVE-2021-22925.patch            | 50 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.75.0.bb      |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2021-22925.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2021-22925.patch b/meta/recipes-support/curl/curl/CVE-2021-22925.patch
new file mode 100644
index 0000000000..e3009c9533
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2021-22925.patch
@@ -0,0 +1,50 @@
+From 894f6ec730597eb243618d33cc84d71add8d6a8a Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Sat, 12 Jun 2021 18:25:15 +0200
+Subject: [PATCH] telnet: fix option parser to not send uninitialized contents
+
+CVE-2021-22925
+
+Reported-by: Red Hat Product Security
+Bug: https://curl.se/docs/CVE-2021-22925.html
+
+CVE: CVE-2021-22925
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

