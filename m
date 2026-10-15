Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 000EACC6B33
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 12:27:38 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38880.1792067251004831746
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 05:27:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=e+q0yTvz;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5357; q=dns/txt;
  s=iport01; t=1792067251; x=1793276851;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SEk36yLLedYHIyIj7rb4OIEDf/fwM51DXlWLKY0Mvpg=;
  b=e+q0yTvzrZwb+WCmRLh4NQMdAlese+hKSy+/01qYWfm6jDWyBIS71iON
   Ft0rE3PlSVsNRtylL11y7MTWvzhAebyKiclSx2xbaVkJQ2V8aDXgroPJN
   Z2nmzzPeBYovGhDoC8Cv0gMQWu8QC9K3nXqIzHGHyPweqO1hr9en9mGns
   1BtG6CS/yt+An3SJ6VKt6n/A2Oqx7RxJEheNzxGBhIVeuXMyaCD+8Lt0h
   Uck752EZnonjmI2OwXCfDKqocKpmIjwPC7bB+HAjVO5fihwfTUmyLQlOS
   O0S/7tgzOA//cQlUzEEgOi0KqKTg+g+IL/M4Yfr7P1oVyD7nAT0Z4XDUO
   Q==;
X-CSE-ConnectionGUID: iOUZndMASQaj8cpvZvWoPQ==
X-CSE-MsgGUID: ian3lKuIRt6LQ8YWvIOiwg==
X-IPAS-Result: =?us-ascii?q?A0BIAgBmxdBq/47/Ja1aglmCV3VhQkmWSgOeHIF+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYQ/RgKOFAImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QEgECAQMnCwEYAS0QHAMBAi8rIwgZgwIBgnQCARG7cIF5M4EBg?=
 =?us-ascii?q?ykBPwICQAFQ2zIBCxQBBYEzhUCII10YAYR8JxsbgXKBFYNpgQWBXAEBAoE2h?=
 =?us-ascii?q?m0EgiJ6EoFaHpUSSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F4EHGwYFg?=
 =?us-ascii?q?R2BIIIWIxk2eoEJXoErKWABEBeBCYIHAoJUggACAUlBDgdFUwklQxJHJiIIE?=
 =?us-ascii?q?gkBExowC4EbODwJKEEXDHMMHQVyCAINCQ0YDUgRLDcVGQQ+bgeRfB6Bc3IxM?=
 =?us-ascii?q?BoTASuCFCmTJgEHkjahDwoog3aMIpU6GjOEBJQXklQLmH2OCpZPhGmBaDyBK?=
 =?us-ascii?q?B8LB3AVSAGCWQlKGQ+OOYNrgX9lgi/JRyQ1AgEIMgEBBwIHDgMLgWiQAYF9A?=
 =?us-ascii?q?QE?=
IronPort-Data: A9a23:+mZl6qoiYe5lQ/gUgua2Cao+3f9eBmJOZBIvgKrLsJaIsI4StFCzt
 garIBmEa63bZWXyKdoiOYXl8BwDuZbSx95lTwA//30xRX4Qp+PIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8jhfngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfvb8U435ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0udQPFNI+
 dkxEwkEbECIn/yE3o28ctA506zPLOGzVG8ekmtrwTecCbMtRorOBv2Xo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LUvrSn8/w7pX7Wz1EqFuWrLAf6GnIxws327/oWDbQUoHQHJsJzhvH+
 goq+Uz4CxdBMP+C6ACZrFaV1t7wgwLcWZ0dQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2YcLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWna1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:UHJ+LKMOezpRrMBcThmjsMiBIKoaSvp037Dk7S9MoHtuA6ulfq
 +V/cjzuSWYtN9VYgBDpTniAtjlfZqjz/5ICOAqVN/INjUO+lHYSb2KhrGN/9SPIUHDH8dmpM
 FdmtBFeb7NJGk/q9rm6w+lFNtl6tyG/Ke0wdr69R5WPHhXg2UK1XYDNu5deXcGPDV7OQ==
X-Talos-CUID: =?us-ascii?q?9a23=3AYbdfY2lOoO/gg7Y/M0yEFVMAr0DXOXz68UXWL2q?=
 =?us-ascii?q?RMl9gSu2eUUGi5pxjq/M7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AN0wWQQ6/uDNRws48fwUiXLknxoxp6qL1DGMQsK8?=
 =?us-ascii?q?a5e29ZR1PJRa6jSu4F9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,159,1787011200"; 
   d="scan'208";a="521648574"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Oct 2026 12:27:30 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id 019501800022B;
	Thu, 15 Oct 2026 12:27:30 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id A2E76CC1292; Thu, 15 Oct 2026 05:27:29 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][scarthgap][PATCH v3 4/5] apr-util: Fix CVE-2026-34501
Date: Thu, 15 Oct 2026 05:27:20 -0700
Message-Id: <20261015122721.2278428-4-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261015122721.2278428-1-hthakar@cisco.com>
References: <20261015122721.2278428-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 12:27:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247879

From: Hetvi Thakar <hthakar@cisco.com>

Backport the upstream Redis response-length and error-checking fix [1]
to address CVE-2026-34501 [2].

[1] https://github.com/apache/apr-util/commit/e8f36bd5f1cc1c82bed1ae52d5699a4c610251c2
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-34501

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>

# Conflicts:
#	meta/recipes-support/apr/apr-util_1.6.3.bb
---
 .../apr/apr-util/CVE-2026-34501.patch         | 128 ++++++++++++++++++
 meta/recipes-support/apr/apr-util_1.6.3.bb    |   2 -
 2 files changed, 128 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/apr/apr-util/CVE-2026-34501.patch

diff --git a/meta/recipes-support/apr/apr-util/CVE-2026-34501.patch b/meta/recipes-support/apr/apr-util/CVE-2026-34501.patch
new file mode 100644
index 0000000000..0056e62171
--- /dev/null
+++ b/meta/recipes-support/apr/apr-util/CVE-2026-34501.patch
@@ -0,0 +1,128 @@
+From e8f36bd5f1cc1c82bed1ae52d5699a4c610251c2 Mon Sep 17 00:00:00 2001
+From: Eric Covener <covener@apache.org>
+Date: Mon, 3 Aug 2026 12:28:37 +0000
+Subject: [PATCH] Merge r1936809 from aprutil 1.7.x:
+
+Merge r1936808 from apr trunk:
+
+apr_redis error checking
+
+Submitted By: jfclere
+Reviewed By: jfclere, jorton, covener
+
+
+
+
+
+git-svn-id: https://svn.apache.org/repos/asf/apr/apr-util/branches/1.6.x@1936810 13f79535-47bb-0310-9956-ffa450edef68
+
+CVE: CVE-2026-34501
+Upstream-Status: Backport [https://github.com/apache/apr-util/commit/e8f36bd5f1cc1c82bed1ae52d5699a4c610251c2]
+
+(cherry picked from commit e8f36bd5f1cc1c82bed1ae52d5699a4c610251c2)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ redis/apr_redis.c | 54 +++++++++++++++++++++++++++++++++++++----------
+ 1 file changed, 43 insertions(+), 11 deletions(-)
+
+diff --git a/redis/apr_redis.c b/redis/apr_redis.c
+index 8d01fdd6..e7fe2071 100644
+--- a/redis/apr_redis.c
++++ b/redis/apr_redis.c
+@@ -853,26 +853,42 @@ APU_DECLARE(apr_status_t) apr_redis_setex(apr_redis_t *rc,
+     return rv;
+ }
+ 
++/* Redis upstream default is 512Mb. This code will try to read the entire
++ * response into a brigade, and then copy that into a pool, so impose
++ * some reasonable limit since RAM consumption will be double this.
++ * https://redis.io/docs/latest/develop/reference/protocol-spec/#bulk-strings
++ */
++#ifndef APR_REDIS_MAX_BULK_LEN
++#define APR_REDIS_MAX_BULK_LEN (64 * 1024 * 1024)
++#endif
++
+ static apr_status_t grab_bulk_resp(apr_redis_server_t *rs, apr_redis_t *rc,
+                                    apr_redis_conn_t *conn, apr_pool_t *p,
+                                    char **baton, apr_size_t *new_length)
+ {
+-    char *length;
++    /* conn->buffer contains "$<length>\r\n" */
++    char *length = conn->buffer + 1;
+     char *last;
+     apr_status_t rv;
+     apr_size_t len = 0;
++    long val;
++
+     *new_length = 0;
++    *baton = NULL;
+ 
+-    length = apr_strtok(conn->buffer + 1, " ", &last);
+-    if (length) {
+-        len = strtol(length, (char **) NULL, 10);
++    errno = 0;
++    last = NULL;
++    val = strtol(length, &last, 10);
++    if (errno || last == NULL || last == length || *last != '\r'
++        || val < 0 || val > APR_REDIS_MAX_BULK_LEN) {
++        rs_bad_conn(rs, conn);
++        if (rc)
++            apr_redis_disable_server(rc, rs);
++        return val > APR_REDIS_MAX_BULK_LEN ? APR_ENOSPC : APR_EGENERAL;
+     }
++    len = (apr_size_t)val;
+ 
+-    if (len == 0) {
+-        *new_length = 0;
+-        *baton = NULL;
+-    }
+-    else {
++    if (len) {
+         apr_bucket_brigade *bbb;
+         apr_bucket *e;
+ 
+@@ -907,6 +923,11 @@ static apr_status_t grab_bulk_resp(apr_redis_server_t *rs, apr_redis_t *rc,
+ 
+         conn->bb = bbb;
+ 
++        if (len < 2) {
++            *baton = NULL;
++            *new_length = 0;
++            return APR_EGENERAL;
++        }
+         *new_length = len - 2;
+         (*baton)[*new_length] = '\0';
+     }
+@@ -992,6 +1013,10 @@ APU_DECLARE(apr_status_t) apr_redis_getp(apr_redis_t *rc,
+     }
+     else if (strncmp(RS_TYPE_STRING, conn->buffer, RS_TYPE_STRING_LEN) == 0) {
+         rv = grab_bulk_resp(rs, rc, conn, p, baton, new_length);
++        if (rv != APR_SUCCESS) {
++            /* grab_bulk_resp already called rs_bad_conn; do not also release */
++            return rv;
++        }
+     }
+     else {
+         rv = APR_EGENERAL;
+@@ -1172,12 +1197,19 @@ apr_redis_info(apr_redis_server_t *rs, apr_pool_t *p, char **baton)
+         return rv;
+     }
+ 
+-    if (strncmp(RS_TYPE_STRING, conn->buffer, RS_TYPE_STRING_LEN) == 0) {
++    if (strncmp(RS_NOT_FOUND_GET, conn->buffer, RS_NOT_FOUND_GET_LEN) == 0) {
++        rv = APR_NOTFOUND;
++    }
++    else if (strncmp(RS_TYPE_STRING, conn->buffer, RS_TYPE_STRING_LEN) == 0) {
+         apr_size_t nl;
+         rv = grab_bulk_resp(rs, NULL, conn, p, baton, &nl);
++        if (rv != APR_SUCCESS) {
++            /* grab_bulk_resp already called rs_bad_conn; do not also release */
++            return rv;
++        }
+     } else {
+         rs_bad_conn(rs, conn);
+-        rv = APR_EGENERAL;
++        return APR_EGENERAL;
+     }
+ 
+     rs_release_conn(rs, conn);
diff --git a/meta/recipes-support/apr/apr-util_1.6.3.bb b/meta/recipes-support/apr/apr-util_1.6.3.bb
index 4d5d4b8fe0..f87f3d9929 100644
--- a/meta/recipes-support/apr/apr-util_1.6.3.bb
+++ b/meta/recipes-support/apr/apr-util_1.6.3.bb
@@ -17,8 +17,6 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.gz \
            file://CVE-2026-32327-dependent.patch \
            file://CVE-2026-32327.patch \
            file://CVE-2026-34501.patch \
-           file://CVE-2026-34502_p1.patch \
-           file://CVE-2026-34502_p2.patch \
            file://run-ptest \
            "
 
-- 
2.35.6


