Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1864C61DBD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 05:40:36 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6234.1787722832586932639
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 22:40:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=kf6XP5Qj;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5243; q=dns/txt;
  s=iport01; t=1787722832; x=1788932432;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+OGa0xGaB18Pj/rsnf3jZs6S8DOpT/7z+TprJktO3vA=;
  b=kf6XP5Qj9bA07doTUjf9zYRyNF/BtVVyYXo4TYTEEdv6wK8ctYi+Fqe6
   RNPj6c2HPdEcdYwnsvyjiGVLO/5R4RVyAsE4pRoBw9o4NX0t0JaWzDG3c
   Og2OlUe3F6PDxy2nPOiggo2l1sF7C2KYoHkOmomeXz27yw8C1ycM1phWT
   mbtlHFkSxH1XoOotvwfwhf8Eqeq4SGenjrvwbp4L7szj0UDl2eR43H83b
   pIZ08/X0Vj6WBk1FFIT3xfKEgH77NyqqYjf21UC3oUsN+bDtrTApZbyVg
   zG9rHYXOq4NlKWVS3G/F1VIdaxgQfYeCy0niMjhDZ8uhergqOGJSU9RIE
   Q==;
X-CSE-ConnectionGUID: ZZWOd71HTymXS6LpofGUlA==
X-CSE-MsgGUID: ytxu9xopRnyM3p4ttg6g2g==
X-IPAS-Result: =?us-ascii?q?A0BIAgByeo5q/5AQJK1aglmCV3RfQkmWSgOeG4F+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYQ/RgKNbAImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDYZaAQIBAycLARgBLRAcAwECLysjCBmDAgGCdAIBEb5GgXkzgQGDK?=
 =?us-ascii?q?AE/AgJAAVDbMAELFAEFgTOFP4giXRgBhHwnGxuBcoEVg2mBBYFcAQECgTaGb?=
 =?us-ascii?q?QSCInoSgVoekWpIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQ0bBgWBH?=
 =?us-ascii?q?YEohBAjGTZ8gQlegSspYAESF4EJggcCglqCBQIBSUMOB0c+CxgNSBEsNxQZB?=
 =?us-ascii?q?D5uB45rH4FXcjEwGhMBK4IUKZMmAQeSN6EPCiiDdowilToaM4QElBeSUQuYf?=
 =?us-ascii?q?Y4KllCEaYFoPIEoHwsHcBVIAYJZCUoZD444g2uBf2WCL8cmJDUCAQgyAQEHA?=
 =?us-ascii?q?gcOAwuBaJABgX0BAQ?=
IronPort-Data: A9a23:A412I6iHsxI/7uEvRHon9TE6X161NxEKZh0ujC45NGQN5FlHY01je
 htvXj+PO6zbYjH8ed4iaI7k9UsCvsOBmoJiGVZt/HwwHy9jpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeCULOZ82QsaDxMu/jd8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUqyNlQDT4X1
 cAJLQA2MDSbgOyZ/baSH7wEasQLdKEHPasWvnVmiDWcBvE8TNWbHOPB5MRT23E7gcUm8fT2P
 pVCL2ExKk2eJUQTZj/7C7pm9AusrnnjczRboUi9rqss6G+Vxwt0uFToGIqMK43WGJsFxi50o
 ErX43TkUwEdLOaZ2B/e6i6wmuCRknn0Ddd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q+7AfIzu/f5ByUQzBbCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:SJCFhK8kpAhP0q7Aexxuk+AAI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HIoB11737JYVoqNU3I3OrwWpVoIkmskaKdn7NwAV7KZmCP0wGVxcNZnO7fKlbbdREWmNQw6U
 5ISdkZNDSJNykYse/KpC+lDt0n3N6LtIqshevY0jNRaDsCUdAY0++8YTzraXGfg2J9dOIEKK
 Y=
X-Talos-CUID: 9a23:kHLXTGEeMgVRxN7LqmJVxnEzFp98UkHMyUfrfWugDmhGdbm8HAo=
X-Talos-MUID: =?us-ascii?q?9a23=3A7YRgcw6Jo14VzSRUG37FQdfOxox5/7SzWVAKia8?=
 =?us-ascii?q?AquzfLXBsJzjDg264F9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,244,1779148800"; 
   d="scan'208";a="819945680"
Received: from alln-l-core-07.cisco.com ([173.36.16.144])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Aug 2026 05:36:59 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-07.cisco.com (Postfix) with ESMTPS id 10338180001DC;
	Wed, 26 Aug 2026 05:36:59 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id AA505CE1BBD; Tue, 25 Aug 2026 22:36:58 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][scarthgap][PATCH 4/5] apr-util: Fix CVE-2026-34501
Date: Tue, 25 Aug 2026 22:36:26 -0700
Message-Id: <20260826053627.1798620-4-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260826053627.1798620-1-hthakar@cisco.com>
References: <20260826053627.1798620-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: alln-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 05:40:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244297

From: Hetvi Thakar <hthakar@cisco.com>

Backport the upstream Redis response-length and error-checking fix [1]
to address CVE-2026-34501 [2].

[1] https://github.com/apache/apr-util/commit/e8f36bd5f1cc1c82bed1ae52d5699a4c610251c2
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-34501

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../apr/apr-util/CVE-2026-34501.patch         | 128 ++++++++++++++++++
 meta/recipes-support/apr/apr-util_1.6.3.bb    |   1 +
 2 files changed, 129 insertions(+)
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
index 3051a08eaf..341975fbca 100644
--- a/meta/recipes-support/apr/apr-util_1.6.3.bb
+++ b/meta/recipes-support/apr/apr-util_1.6.3.bb
@@ -17,6 +17,7 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.gz \
            file://CVE-2025-49506_p2.patch \
            file://CVE-2026-32327-dependent.patch \
            file://CVE-2026-32327.patch \
+           file://CVE-2026-34501.patch \
            file://run-ptest \
            "
 
-- 
2.35.6


