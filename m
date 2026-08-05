Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0D29C56201
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 08:31:23 +0000 (UTC)
Received: from aer-iport-3.cisco.com (aer-iport-3.cisco.com [173.38.203.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35937.1785918670114963942
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 01:31:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Nij/4C5S;
 spf=pass (domain: cisco.com, ip: 173.38.203.53, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4827; q=dns/txt;
  s=iport01; t=1785918676; x=1787128276;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ok33gsm7YHsz1FsRYhzt9g1FLcIKLpcV3MIzz1MhxMY=;
  b=Nij/4C5Sm7Q3t4b9vKIB+o0ZxRGdpkp/qjFQl3E6wwqOdQh7lcwPM8lK
   uWm0fME5FMwMhp8md1YVRinZX064nBmz5FYxiZK3EpR6UrpeRzWJ5++DD
   44Dhg/pT5qNBfEBByFwIoqt0F9mN1zc6oOhM7+l4gH2EA0aJ/EGEPoWxv
   sH48vQDowQ1x/A8jXowDqZolBntBgmweXFrk9QaiCW9XWqqDdnftzQAmw
   CB+1/u/DKiiq+v4nj0ZqNJEYwbHs5mqVGLaaG/CxhaY7X3U+TTnZsjfHt
   rEz/y6l9CpnHq22GD0JgLSjC8FYX6763jfbfGDlPt5o2p4n7HhL13Kn/Y
   w==;
X-CSE-ConnectionGUID: 1HEocLmYS5KxMrMVTt6T0w==
X-CSE-MsgGUID: fydGG0nmSgGqPcv4PXLl0g==
X-IPAS-Result: =?us-ascii?q?A0BLAgD/83Jq/8xK/pBaHgE8DA4LgVmCV3RfQkmUKYIhA?=
 =?us-ascii?q?54bgX4PAQEBD0QNBAEBhQUCjWYCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NhloBAgEDJwsBGAE9HAMBAi8rIwgQAQiDAgGCdAMRB?=
 =?us-ascii?q?r1UgXkzgQGDKAE/AgJAAVDbLgELFAGBOIU/iCFdGAGEfCcbG4FyhH6BBYFcA?=
 =?us-ascii?q?gGBUIZUBIIigQyBWpB3SIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4ENG?=
 =?us-ascii?q?wcFgR2BKIRtIxk2fIEJXoEtKmUSF4EJgnsCgnpvCxgNSBEsNxQZBD5uB41oI?=
 =?us-ascii?q?IF7RWEtASkCUIEzAQEnEQeTHwFCkXmhEgoog3WMIZU6GjOqbJkIjgqWUIRpg?=
 =?us-ascii?q?Wg8gVlwFYMiCRY0GQ9WjWKDa4ZAxWE8NQIJMgEBBwIHDgMLgWiQAoF8AQE?=
IronPort-Data: A9a23:IIPK26vgG9Fu51DKCtOn67EqS+fnVAJfMUV32f8akzHdYApBsoF/q
 tZmKTqGP6yKMTD8KN51YIji8h4FvJCEzoA1QQM+/3wzHi5BgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656yYghclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZTdJ5xYuajhKs/Lb9Us21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIwo8ZaBmpq8
 M0jdRMdSwqmud6qno7jVbw57igjBJGD0II3s3x6iDWcBvE8TNWbGOPB5MRT23E7gcUm8fT2P
 pZFL2AyMFKfP1sVYgt/5JEWxI9EglHzfjBCoU6VooI84nPYy0p6172F3N/9J4PTHJkExR/wS
 mTu8XX1LT5CMtmkxhWcynmy2tf/uSejV9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUz5RvIzu/f5ByUQzBfCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:SJz6UqB3NaoE6znlHemA55DYdb4zR+YMi2TDsHoBLSC9Hfb3qy
 nDppkmPFrP+VUssRIb6LW90de7IE80nKQdieJ6AV7hZniFhILCFu5fBOXZrwEIYxefysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjhzEht7t2utkuEimpRGsdd0zs=
X-Talos-CUID: 9a23:aeJjgWHqE3BMDIFiqmI+1GMTEeQgQ0aA72f1OWqGNXo3dOWKHAo=
X-Talos-MUID: 9a23:BgckNAkfLa+MYOJ76qIUdnpsJctHzPyoDXsCvow+sNfYDRxUP2+S2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,206,1779148800"; 
   d="scan'208";a="57114931"
Received: from aer-l-core-03.cisco.com ([144.254.74.204])
  by aer-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Aug 2026 08:31:15 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-03.cisco.com (Postfix) with ESMTPS id 026D91800021A
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Aug 2026 08:31:15 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id C0F95CC037D; Wed,  5 Aug 2026 14:01:13 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 1/8] curl: fix CVE-2026-8286
Date: Wed,  5 Aug 2026 14:00:56 +0530
Message-Id: <20260805083103.2633995-2-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260805083103.2633995-1-deeratho@cisco.com>
References: <20260805083103.2633995-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: aer-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 08:31:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242839

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream curl security fix backport for
CVE-2026-8286. The upstream fix commit is referenced in [1],
and the public curl advisory is referenced in [2]. The backported
commit link is also recorded in the embedded patch header.

[1] https://github.com/curl/curl/commit/a86efdd7ca5433de9231e650f18247de8319ad16
[2] https://curl.se/docs/CVE-2026-8286.html

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../curl/curl/CVE-2026-8286.patch             | 81 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8286.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-8286.patch b/meta/recipes-support/curl/curl/CVE-2026-8286.patch
new file mode 100644
index 0000000000..6fa42887a1
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-8286.patch
@@ -0,0 +1,81 @@
+From 90ff17f6bfe1d358c26fa25ab457bc420a9847b2 Mon Sep 17 00:00:00 2001
+From: Stefan Eissing <stefan@eissing.org>
+Date: Thu, 7 May 2026 10:30:07 +0200
+Subject: [PATCH] url: fix connection reuse for starttls protocols
+
+When a connection is tested for reuse in a transfer that *may* upgrade
+to TLS (commonly via STARTTLS), the SSL configuration must match the
+existing connection.
+
+Reported-by: Andrew Nesbit
+Closes #21522
+
+CVE: CVE-2026-8286
+Upstream-Status: Backport [https://github.com/curl/curl/commit/a86efdd7ca5433de9231e650f18247de8319ad16]
+
+Backport Changes:
+- Wrynose applies upstream commit [1] before this patch. That commit
+  adds req_tls to struct url_conn_match and initializes it in
+  url_attach_existing().
+- This backport replaces that local req_tls state with the upstream
+  may_tls/require_tls split and updates url_match_ssl_use(),
+  url_match_ssl_config(), and url_attach_existing() to preserve the
+  upstream STARTTLS reuse behavior on the Wrynose 8.19.0 codebase.
+
+[1] https://github.com/curl/curl/commit/507e7be573b0a76fca597b75ff7cb27a66e7d865
+
+(cherry picked from commit a86efdd7ca5433de9231e650f18247de8319ad16)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ lib/url.c | 15 ++++++++++-----
+ 1 file changed, 10 insertions(+), 5 deletions(-)
+
+diff --git a/lib/url.c b/lib/url.c
+index 4ebff50ef1..6c1375f8e3 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -745,7 +745,11 @@ struct url_conn_match {
+   BIT(want_proxy_ntlm_http);
+   BIT(want_nego_http);
+   BIT(want_proxy_nego_http);
+-  BIT(req_tls); /* require TLS use from a clear-text start */
++  BIT(may_tls); /* May upgrade clear-text connection to TLS, can only reuse
++                 * connections that have matching TLS configuration.
++                 * Always TRUE if `req_tls` is TRUE. */
++  BIT(require_tls); /* Requires TLS use from a clear-text start, can only
++                 * reuse connections that have TLS. */
+   BIT(wait_pipe);
+   BIT(force_reuse);
+   BIT(seen_pending_conn);
+@@ -897,7 +901,7 @@ static bool url_match_ssl_use(struct connectdata *conn,
+        (get_protocol_family(conn->scheme) != m->needle->scheme->protocol))
+       return FALSE;
+   }
+-  else if(m->req_tls)
++  else if(m->require_tls)
+     /* a clear-text STARTTLS protocol with required TLS */
+     return FALSE;
+   return TRUE;
+@@ -1090,8 +1094,8 @@ static bool url_match_destination(struct connectdata *conn,
+ static bool url_match_ssl_config(struct connectdata *conn,
+                                  struct url_conn_match *m)
+ {
+-  /* If talking TLS, conn needs to use the same SSL options. */
+-  if((m->needle->scheme->flags & PROTOPT_SSL) &&
++  /* If talking/upgrading to TLS, conn needs to use the same SSL options. */
++  if(((m->needle->scheme->flags & PROTOPT_SSL) || m->may_tls) &&
+      !Curl_ssl_conn_config_match(m->data, conn, FALSE)) {
+     DEBUGF(infof(m->data, "Connection #%" FMT_OFF_T
+                  " has different SSL parameters, cannot reuse",
+@@ -1364,7 +1368,8 @@ static bool url_attach_existing(struct Curl_easy *data,
+     (needle->scheme->protocol & PROTO_FAMILY_HTTP);
+ #endif
+ #endif
+-  match.req_tls = data->set.use_ssl >= CURLUSESSL_CONTROL;
++  match.require_tls = data->set.use_ssl >= CURLUSESSL_CONTROL;
++  match.may_tls = data->set.use_ssl > CURLUSESSL_NONE;
+ 
+   /* Find a connection in the pool that matches what "data + needle"
+    * requires. If a suitable candidate is found, it is attached to "data". */
+-- 
+2.35.6
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 5ba881bd76..ae57776eab 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -23,6 +23,7 @@ SRC_URI = " \
     file://CVE-2026-6429.patch \
     file://CVE-2026-7168.patch \
     file://CVE-2026-4873.patch \
+    file://CVE-2026-8286.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.35.6


