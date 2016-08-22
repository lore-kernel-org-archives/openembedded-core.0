Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 157CE7017B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 08:38:09 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP; 22 Aug 2016 01:38:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,559,1464678000"; d="scan'208";a="159249743"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 22 Aug 2016 01:38:11 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id A8B116A4080
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 01:37:52 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Aug 2016 11:39:31 +0300
Message-Id: <1471855173-19517-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [jethro][PATCH 1/3] curl: security fix for CVE-2016-5419
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Aug 2016 08:38:11 -0000

Affected versions: libcurl 7.1 to and including 7.50.0

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-support/curl/curl/CVE-2016-5419.patch | 76 ++++++++++++++++++++++
 meta/recipes-support/curl/curl_7.44.0.bb           |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-5419.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2016-5419.patch b/meta/recipes-support/curl/curl/CVE-2016-5419.patch
new file mode 100644
index 0000000..2bea362
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2016-5419.patch
@@ -0,0 +1,76 @@
+From 247d890da88f9ee817079e246c59f3d7d12fde5f Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Fri, 1 Jul 2016 13:32:31 +0200
+Subject: [PATCH] TLS: switch off SSL session id when client cert is used
+
+
+Bug: https://curl.haxx.se/docs/adv_20160803A.html
+Reported-by: Bru Rom
+Contributions-by: Eric Rescorla and Ray Satiro
+
+Upstream-Status: Backport
+https://curl.haxx.se/CVE-2016-5419.patch
+
+CVE: CVE-2016-5419
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+ lib/url.c       |  1 +
+ lib/urldata.h   |  1 +
+ lib/vtls/vtls.c | 10 ++++++++++
+ 3 files changed, 12 insertions(+)
+
+diff --git a/lib/url.c b/lib/url.c
+index 258a286..e547e5c 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -6123,6 +6123,7 @@ static CURLcode create_conn(struct Curl_easy *data,
+   data->set.ssl.random_file = data->set.str[STRING_SSL_RANDOM_FILE];
+   data->set.ssl.egdsocket = data->set.str[STRING_SSL_EGDSOCKET];
+   data->set.ssl.cipher_list = data->set.str[STRING_SSL_CIPHER_LIST];
++  data->set.ssl.clientcert = data->set.str[STRING_CERT];
+ #ifdef USE_TLS_SRP
+   data->set.ssl.username = data->set.str[STRING_TLSAUTH_USERNAME];
+   data->set.ssl.password = data->set.str[STRING_TLSAUTH_PASSWORD];
+diff --git a/lib/urldata.h b/lib/urldata.h
+index 611c5a7..3cf7ed9 100644
+--- a/lib/urldata.h
++++ b/lib/urldata.h
+@@ -351,6 +351,7 @@ struct ssl_config_data {
+   char *CAfile;          /* certificate to verify peer against */
+   const char *CRLfile;   /* CRL to check certificate revocation */
+   const char *issuercert;/* optional issuer certificate filename */
++  char *clientcert;
+   char *random_file;     /* path to file containing "random" data */
+   char *egdsocket;       /* path to file containing the EGD daemon socket */
+   char *cipher_list;     /* list of ciphers to use */
+diff --git a/lib/vtls/vtls.c b/lib/vtls/vtls.c
+index d3e41cd..33e209d 100644
+--- a/lib/vtls/vtls.c
++++ b/lib/vtls/vtls.c
+@@ -156,6 +156,15 @@ Curl_clone_ssl_config(struct ssl_config_data *source,
+   else
+     dest->random_file = NULL;
+ 
++  if(source->clientcert) {
++    dest->clientcert = strdup(source->clientcert);
++    if(!dest->clientcert)
++      return FALSE;
++    dest->sessionid = FALSE;
++  }
++  else
++    dest->clientcert = NULL;
++
+   return TRUE;
+ }
+ 
+@@ -166,6 +175,7 @@ void Curl_free_ssl_config(struct ssl_config_data* sslc)
+   Curl_safefree(sslc->cipher_list);
+   Curl_safefree(sslc->egdsocket);
+   Curl_safefree(sslc->random_file);
++  Curl_safefree(sslc->clientcert);
+ }
+ 
+ 
+-- 
+2.4.0
+
diff --git a/meta/recipes-support/curl/curl_7.44.0.bb b/meta/recipes-support/curl/curl_7.44.0.bb
index 419ed83..dcd63aa 100644
--- a/meta/recipes-support/curl/curl_7.44.0.bb
+++ b/meta/recipes-support/curl/curl_7.44.0.bb
@@ -13,6 +13,7 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
 # from mucking around with debug options
 #
 SRC_URI += " file://configure_ac.patch \
+             file://CVE-2016-5419.patch \
              file://CVE-2016-0754.patch \
              file://CVE-2016-0755.patch"
 
-- 
2.4.0


