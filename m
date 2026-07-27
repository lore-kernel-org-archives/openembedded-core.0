Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 231E1C531D0
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 12:01:50 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29528.1785153701354353211
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 05:01:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=E8YVv9KD;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2624; q=dns/txt;
  s=iport01; t=1785153701; x=1786363301;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=60ohchEfnY8J3A3XT4vjnNYMF72C6xNEs+B6FTnc1Es=;
  b=E8YVv9KDFDrrgtcSC/jKOCOivQ9E2buV8v6Q95WLwIyJ6/9j956sdfX6
   j4O+82LsECLogc5C93u5DT/JSHJ65qaXFYOtTReaWOTJjEVa0uJxpAXJk
   3jFMkSyATpLI5dsKyJRUIaWuXA6YvmV2XxAVEnwOBJLhq+gjcRYt4ruWr
   xAkUHuidhma/D4cFy96iLlO06Acnz5T+nJX7ggKTLgsz3IdCuY8d8GYKm
   GGiQKxBFa22TRQgKvi58Xy45XZAJCYcFTnqWc5cZ3UCl7RyXbXyHNx+x7
   b3vxNhjNN71VGTu57q8NsklhDkEYOugTuTeHVMALGv3mTnjLHVIyGUS3d
   Q==;
X-CSE-ConnectionGUID: vlyIjtV1TaWa1hCoK4laaQ==
X-CSE-MsgGUID: Jkp17kSpQs+xExZe+Ri4mA==
X-IPAS-Result: =?us-ascii?q?A0BHAgCLR2dq/4//Ja1aHgEBCxIMggULgld0X0JJlCmCI?=
 =?us-ascii?q?QOeG4F+DwEBAQ9EDQQBAYUFAo1gAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NhloBAgEDJwsBGAE9HAMBAi8rIwgRCIMCAYJ0AxEGx?=
 =?us-ascii?q?AOBeTOBAYMoAT8CAkABUNsuAQsUAYE4hT+IIFwYAYR8JxsbgXKEfoEFgVwCA?=
 =?us-ascii?q?YEmgQaFeASCIoEMgVqQZkiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBD?=
 =?us-ascii?q?BsHBYEdgSx5hFgjHwM5f4EvdUp3LWoSF4Emg0sCgVADCxgNSBEsNxQZBD5uB?=
 =?us-ascii?q?413I4JAYS0BKQKCAwEBOJMmAZI7oRIKKIN1jCGVOhozqmyZCI4KllCEaYFoP?=
 =?us-ascii?q?IFZcBWDIgkWNBkPjjiDa4ZAwVI8NQIJMgEBBwIHDgMLgWiEYYsfgX4BAQ?=
IronPort-Data: A9a23:ggiyr6K8Jo4mFSLUFE+RgJQlxSXFcZb7ZxGr2PjKsXjdYENS1zwAz
 zcYXD+COareZWb3Kdh/O4u29E4H78WGz9FlQAQd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9hGQrajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1wCFAXP5Emo9p+PmgX9
 dcfC2wJZxm60rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBU7AtQIvIROPB4towMDUY358VW62BI
 ZBENHw2ME+ojx5nYj/7DLoykeqyj2X/dBVTqUmeouw85G27IAlZjeGwboWKIoDRLSlTtmSbv
 juZ/F/hOwpZJPGP+zfGyHPwg8aayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu1jfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:HmU6+69LRt0WKpKX5v9uk+D0I+orL9Y04lQ7vn2ZLiYlFvBw+P
 rBoB1273LJYXMqKRIdcLO7Scy9qA3nlKKdiLN5VdzJYOClghrLEGgI1+TfKlPbdxEWjtQ86Y
 5QN45jFdb3EV92yez+4AW+DpIc5ePvytHOuQ8bpE0dND2DrMpbnmFENjo=
X-Talos-CUID: 9a23:I3RRWG54SEI1t6067Nss6koFO8I5TCThxUjZek+TDkU1TLSccArF
X-Talos-MUID: 9a23:m+QlkwQtJYWT3LeERXTOhyk7a8RT+521S1AggacL+POFaSlZbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,188,1779148800"; 
   d="scan'208";a="515677043"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 27 Jul 2026 12:01:40 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id 0ECA71800026D
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 12:01:40 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 2B116CC037D; Mon, 27 Jul 2026 17:31:38 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH v3 1/2] curl: fix CVE-2026-4873
Date: Mon, 27 Jul 2026 17:31:36 +0530
Message-Id: <20260727120136.3147887-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260720113041.2479444-1-deeratho@cisco.com>
References: <20260720113041.2479444-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 12:01:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242089

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream backport for CVE-2026-4873.
The upstream fix commit is referenced in [1], and the public
CVE advisory is referenced in [2].

[1] https://github.com/curl/curl/commit/507e7be573b0a76fca597b75ff7cb27a66e7d865
[2] https://curl.se/docs/CVE-2026-4873.html

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
- Changes from v2 to v3:
- Updated the patch to include the fixed commit instead of CVE_STATUS as per Paul's suggestion.
 .../curl/curl/CVE-2026-4873.patch             | 32 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-4873.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-4873.patch b/meta/recipes-support/curl/curl/CVE-2026-4873.patch
new file mode 100644
index 0000000000..cd9d81a25f
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-4873.patch
@@ -0,0 +1,32 @@
+From 507e7be573b0a76fca597b75ff7cb27a66e7d865 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Tue, 24 Mar 2026 08:35:08 +0100
+Subject: [PATCH] url: do not reuse a non-tls starttls connection if new
+ requires TLS
+
+Reported-by: Arkadi Vainbrand
+
+Closes #21082
+
+CVE: CVE-2026-4873
+Upstream-Status: Backport [https://github.com/curl/curl/commit/507e7be573b0a76fca597b75ff7cb27a66e7d865]
+
+(cherry picked from commit 507e7be573b0a76fca597b75ff7cb27a66e7d865)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ lib/url.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/lib/url.c b/lib/url.c
+index ec0457b..cc60468 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -748 +748 @@ struct url_conn_match {
+-
++  BIT(req_tls); /* require TLS use from a clear-text start */
+@@ -899,0 +900,3 @@ static bool url_match_ssl_use(struct connectdata *conn,
++  else if(m->req_tls)
++    /* a clear-text STARTTLS protocol with required TLS */
++    return FALSE;
+@@ -1357,0 +1361 @@ static bool url_attach_existing(struct Curl_easy *data,
++  match.req_tls = data->set.use_ssl >= CURLUSESSL_CONTROL;
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 6ad0daa59d..af73d2e580 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -21,6 +21,7 @@ SRC_URI = " \
     file://CVE-2026-6253.patch \
     file://CVE-2026-6429-dependent.patch \
     file://CVE-2026-6429.patch \
+    file://CVE-2026-4873.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.35.6


