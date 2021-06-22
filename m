Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web09.6606.1624355462485042172
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 02:51:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: DFf/3AtcV+HH0JlX0Qh1M2yw2I2XLVyhzWe60tLOrKkjl+ud3ynRVTsXBu+diGWAHhNJdOHIJb
 VyuZnLk/4ZPg==
X-IronPort-AV: E=McAfee;i="6200,9189,10022"; a="204014057"
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; 
   d="scan'208";a="204014057"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2021 02:50:53 -0700
IronPort-SDR: XbnRy3tAoaGeGNWk2Jek2aaBaEQEpasX+MkvFOy6IOIjTUXgqzrQ2wyh6WsP4u17voxKK+SDxq
 vyeU6MLcnb4Q==
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; 
   d="scan'208";a="423260003"
Received: from leexiaoy-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.150.96])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2021 02:50:52 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 01/13] curl: cleanup CVE patches for hardknott
Date: Tue, 22 Jun 2021 17:50:20 +0800
Message-Id: <456ba1717fc3ebb9d10cc6a3c916b07f7c4e8a22.1624352878.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1624352878.git.anuj.mittal@intel.com>
References: <cover.1624352878.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Trevor Gamblin <trevor.gamblin@windriver.com>

The patch backported to address CVE-2021-22890 was missing a bracket to
properly close out the logic in lib/vtls/wolfssl.c. Fix this so to avoid
any surprise failures when using curl with hardknott.

Also fix the CVE designation in the patch descriptions for CVEs
CVE-2021-22890 and CVE-2021-22876 so that CVE checks run with bitbake
correctly detect that they are patched.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...oxy-argument-to-Curl_ssl_get-addsession.patch | 16 ++++++++--------
 ...p-credentials-from-the-auto-referer-hea.patch |  5 ++++-
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-support/curl/curl/0001-vtls-add-isproxy-argument-to-Curl_ssl_get-addsession.patch b/meta/recipes-support/curl/curl/0001-vtls-add-isproxy-argument-to-Curl_ssl_get-addsession.patch
index a0c7d68f33..1e0e18cf12 100644
--- a/meta/recipes-support/curl/curl/0001-vtls-add-isproxy-argument-to-Curl_ssl_get-addsession.patch
+++ b/meta/recipes-support/curl/curl/0001-vtls-add-isproxy-argument-to-Curl_ssl_get-addsession.patch
@@ -1,15 +1,14 @@
-From a2d3885223db9616283bfe33435fbe9b3140eac7 Mon Sep 17 00:00:00 2001
+From e499142d377b56c7606437d14c99d3cb27aba9fd Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <trevor.gamblin@windriver.com>
 Date: Tue, 1 Jun 2021 09:50:20 -0400
-Subject: [PATCH 1/2] vtls: add 'isproxy' argument to
- Curl_ssl_get/addsessionid()
+Subject: [PATCH] vtls: add 'isproxy' argument to Curl_ssl_get/addsessionid()
 
 To make sure we set and extract the correct session.
 
 Reported-by: Mingtao Yang
 Bug: https://curl.se/docs/CVE-2021-22890.html
 
-CVE-2021-22890
+CVE: CVE-2021-22890
 
 Upstream-Status: Backport
 (https://github.com/curl/curl/commit/b09c8ee15771c614c4bf3ddac893cdb12187c844)
@@ -25,8 +24,8 @@ Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
  lib/vtls/sectransp.c | 10 ++++----
  lib/vtls/vtls.c      | 12 +++++++---
  lib/vtls/vtls.h      |  2 ++
- lib/vtls/wolfssl.c   | 28 +++++++++++++----------
- 10 files changed, 111 insertions(+), 51 deletions(-)
+ lib/vtls/wolfssl.c   | 29 ++++++++++++++----------
+ 10 files changed, 112 insertions(+), 51 deletions(-)
 
 diff --git a/lib/vtls/bearssl.c b/lib/vtls/bearssl.c
 index 29b08c0e6..0432dfadc 100644
@@ -463,7 +462,7 @@ index 9666682ec..4dc29794c 100644
                                 size_t idsize,
                                 int sockindex);
 diff --git a/lib/vtls/wolfssl.c b/lib/vtls/wolfssl.c
-index e1fa45926..e4c70877f 100644
+index e1fa45926..f1b12b1d8 100644
 --- a/lib/vtls/wolfssl.c
 +++ b/lib/vtls/wolfssl.c
 @@ -516,7 +516,9 @@ wolfssl_connect_step1(struct Curl_easy *data, struct connectdata *conn,
@@ -477,7 +476,7 @@ index e1fa45926..e4c70877f 100644
        /* we got a session id, use it! */
        if(!SSL_set_session(backend->handle, ssl_sessionid)) {
          char error_buffer[WOLFSSL_MAX_ERROR_SZ];
-@@ -774,21 +776,23 @@ wolfssl_connect_step3(struct Curl_easy *data, struct connectdata *conn,
+@@ -774,21 +776,24 @@ wolfssl_connect_step3(struct Curl_easy *data, struct connectdata *conn,
      void *old_ssl_sessionid = NULL;
  
      our_ssl_sessionid = SSL_get_session(backend->handle);
@@ -501,6 +500,7 @@ index e1fa45926..e4c70877f 100644
 +            infof(data, "old SSL session ID is stale, removing\n");
 +            Curl_ssl_delsessionid(data, old_ssl_sessionid);
 +            incache = FALSE;
++        }
        }
      }
  
diff --git a/meta/recipes-support/curl/curl/0002-transfer-strip-credentials-from-the-auto-referer-hea.patch b/meta/recipes-support/curl/curl/0002-transfer-strip-credentials-from-the-auto-referer-hea.patch
index 6c4f6f2f48..c02c9bed68 100644
--- a/meta/recipes-support/curl/curl/0002-transfer-strip-credentials-from-the-auto-referer-hea.patch
+++ b/meta/recipes-support/curl/curl/0002-transfer-strip-credentials-from-the-auto-referer-hea.patch
@@ -6,7 +6,10 @@ Subject: [PATCH 2/2] transfer: strip credentials from the auto-referer header
 
 Added test 2081 to verify.
 
-CVE-2021-22876
+CVE: CVE-2021-22876
+
+Upstream-Status: Backport
+(https://github.com/curl/curl/commit/7214288898f5625a6cc196e22a74232eada7861c)
 
 Bug: https://curl.se/docs/CVE-2021-22876.html
 
-- 
2.31.1

