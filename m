Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CE79C61DCB
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 05:40:37 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6235.1787722833686446382
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 22:40:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=dNwp0ADM;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6278; q=dns/txt;
  s=iport01; t=1787722833; x=1788932433;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u8MK/yZtFo2ravxINd8/W1Ib1W35nCxvVL7FhMih8ps=;
  b=dNwp0ADMlv0/KTLgWCTb2qXDy11MvPze1enBiMPl4feNvy7pxgp62FjT
   YG3nHhztI5GmqJYxiLRB8Fao8hHwbE20QH7Mq/xi+LBFl4oj/A02tOKDe
   rd9lEbVWCXsDTgi2yRpZg0N9XpDc+PNvBEqfefVSDOGTgruv0RYHaGw+e
   PkwLLjb6c6Wm4C5CKKD0R73o7bF5W1KllD/a2pn4U6SBqQuSjrZqSpPqa
   B7+NMci96lK8bYhTnMYjDbNvo4hV9WUSSnOU1EN4NZWOvRMNnhXe6t9u8
   ekXINRQpsAuO5aES1K/qVRfDWScO5sX54hQU6z3Rvsi8cRyXsnbD5Kd9/
   A==;
X-CSE-ConnectionGUID: wimatMyYRQu9mEyigjDYrA==
X-CSE-MsgGUID: xMIcgoehSJOFb5STjHCREQ==
X-IPAS-Result: =?us-ascii?q?A0BHAgByeo5q/40QJK1aglmCV3RfQkmWSgOeG4F+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYUFAo1sAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NhloBAgEDJwsBGAEtEBwDAQIvKyMIGYMCAYJ0AgERvkaBeTOBAYMoA?=
 =?us-ascii?q?T8CQ1DbMAELFAEFgTOFP4giXRgBhHwnGxuBcoEVgTuCLoEFgVwBAYglBIIie?=
 =?us-ascii?q?hKBWh6RakiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDRsGBYEdgSiEE?=
 =?us-ascii?q?CMZNnyBCV6BKylgARIXgQmCBwKCWoIFAgFJQw4HRz4LGA1IESw3FBkEPm4Hj?=
 =?us-ascii?q?msfgVdyexMBBySBQzoXKaVloQ8KKIN2jCKVOhozqmwLmH2OCpYPQYRpgWg8g?=
 =?us-ascii?q?SgfCwdwFUgBglkJShkPjjiDa4F/gxTHJiQ1AgEIMgEBBwIHDgMLgWiQAi2BT?=
 =?us-ascii?q?wEB?=
IronPort-Data: A9a23:5LYmgKgxjo46BsJIBhnmakg5X161NxEKZh0ujC45NGQN5FlHY01je
 htvDG2POfyNamCjeowgOo2x9BsEuJWEzIVqTQRv/yExFXljpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeCULOZ82QsaDxMu/jd8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUH++N+HURfx
 MYhNWEIQwGCiOCa8aiSH7wEasQLdKEHPasWvnVmiDWcBvE8TNWbH+PB5MRT23E7gcUm8fT2P
 pVCL2ExKk2eJUQTYz/7C7pm9AusrnnjczRboUi9rqss6G+Vxwt0uFToGIqPI4bQFZQEwy50o
 ErW2kXyDRYXNOe97hSPr0mQhM/kpw7CDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q+7AfIzu/f5ByUQzBYCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:Oczkz6oolTGWLjfJxFnZ8o0aV5rzeYIsimQD101hICG9vPb2qy
 nIpoV96faaslcssR0b9OxofZPwI080lqQFhbX5Q43DYOCOggLBR+tfBMnZsljd8kbFmNK1u5
 0NT0FWMqyXMbEDt7eY3CCIV/A93dKA7Kekwc3az3trUEVWTpsI1XYBNu5eeXcGPzWvwvECZe
 Kh2vY=
X-Talos-CUID: 9a23:Apwpm2PNy9M3KO5DRyhi/VIxC/EfS2CMyVrBIkC6JVdzYejA
X-Talos-MUID: 9a23:s30hMwQhhRsVfOYsRXT8oRBpO8Bl45+ML24HzK46uemvDwFJbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,244,1779148800"; 
   d="scan'208";a="821228995"
Received: from alln-l-core-04.cisco.com ([173.36.16.141])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Aug 2026 05:37:00 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-04.cisco.com (Postfix) with ESMTPS id 493621800019B;
	Wed, 26 Aug 2026 05:37:00 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id E2C71CE1BBD; Tue, 25 Aug 2026 22:36:59 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][scarthgap][PATCH 5/5] apr-util: Fix CVE-2026-34502
Date: Tue, 25 Aug 2026 22:36:27 -0700
Message-Id: <20260826053627.1798620-5-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260826053627.1798620-1-hthakar@cisco.com>
References: <20260826053627.1798620-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: alln-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 05:40:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244298

From: Hetvi Thakar <hthakar@cisco.com>

Backport the upstream memcache validation fix [1] and its follow-up
parsing correction [2] to address CVE-2026-34502 [3].

[1] https://github.com/apache/apr-util/commit/f1c98dd0847c43375daf3789c936685adbc6d872
[2] https://github.com/apache/apr-util/commit/997c02ce5b9db44083c580e3e47095f5ac4524ae
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-34502

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../apr/apr-util/CVE-2026-34502_p1.patch      | 106 ++++++++++++++++++
 .../apr/apr-util/CVE-2026-34502_p2.patch      |  38 +++++++
 meta/recipes-support/apr/apr-util_1.6.3.bb    |   2 +
 3 files changed, 146 insertions(+)
 create mode 100644 meta/recipes-support/apr/apr-util/CVE-2026-34502_p1.patch
 create mode 100644 meta/recipes-support/apr/apr-util/CVE-2026-34502_p2.patch

diff --git a/meta/recipes-support/apr/apr-util/CVE-2026-34502_p1.patch b/meta/recipes-support/apr/apr-util/CVE-2026-34502_p1.patch
new file mode 100644
index 0000000000..d4c6cb39b4
--- /dev/null
+++ b/meta/recipes-support/apr/apr-util/CVE-2026-34502_p1.patch
@@ -0,0 +1,106 @@
+From f1c98dd0847c43375daf3789c936685adbc6d872 Mon Sep 17 00:00:00 2001
+From: Eric Covener <covener@apache.org>
+Date: Mon, 3 Aug 2026 12:33:18 +0000
+Subject: [PATCH] Merge r1936812 from aprutil 1.7.x:
+
+Merge r1936811 from apr trunk:
+
+apr_memcache: error checking
+
+Reviewed By: covener, jorton, jfclere
+
+
+
+
+
+git-svn-id: https://svn.apache.org/repos/asf/apr/apr-util/branches/1.6.x@1936813 13f79535-47bb-0310-9956-ffa450edef68
+
+CVE: CVE-2026-34502
+Upstream-Status: Backport [https://github.com/apache/apr-util/commit/f1c98dd0847c43375daf3789c936685adbc6d872]
+
+(cherry picked from commit f1c98dd0847c43375daf3789c936685adbc6d872)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ memcache/apr_memcache.c | 31 ++++++++++++++++++++++++++++---
+ 1 file changed, 28 insertions(+), 3 deletions(-)
+
+diff --git a/memcache/apr_memcache.c b/memcache/apr_memcache.c
+index 2c7bd1de..137be778 100644
+--- a/memcache/apr_memcache.c
++++ b/memcache/apr_memcache.c
+@@ -595,6 +595,11 @@ static apr_status_t get_server_line(apr_memcache_conn_t *conn)
+     conn->blen = bsize;
+     conn->buffer[bsize] = '\0';
+ 
++    /* Validate CRLF line termination to prevent integer underflow attacks */
++    if (bsize < 2 || conn->buffer[bsize-2] != '\r' || conn->buffer[bsize-1] != '\n') {
++        return APR_EGENERAL;
++    }
++
+     return apr_brigade_cleanup(conn->tb);
+ }
+ 
+@@ -1087,9 +1092,14 @@ apr_memcache_version(apr_memcache_server_t *ms,
+     }
+ 
+     if (strncmp(MS_VERSION, conn->buffer, MS_VERSION_LEN) == 0) {
+-        *baton = apr_pstrmemdup(p, conn->buffer+MS_VERSION_LEN+1, 
+-                                conn->blen - MS_VERSION_LEN - 2);
+-        rv = APR_SUCCESS;
++        if (conn->blen < MS_VERSION_LEN + 2) {
++            rv = APR_EGENERAL;
++        }
++        else {
++            *baton = apr_pstrmemdup(p, conn->buffer+MS_VERSION_LEN+1, 
++                                    conn->blen - MS_VERSION_LEN - 2);
++            rv = APR_SUCCESS;
++       } 
+     }
+     else {
+         rv = APR_EGENERAL;
+@@ -1555,23 +1565,35 @@ apr_memcache_multgetp(apr_memcache_t *mc,
+ static const char *stat_read_string(apr_pool_t *p, char *buf, apr_size_t len)
+ {
+     /* remove trailing \r\n and null char */
++    if (len < 2) {
++        return apr_pstrdup(p, "");
++    }
+     return apr_pstrmemdup(p, buf, len-2);
+ }
+ 
+ static apr_uint32_t stat_read_uint32(apr_pool_t *p, char *buf, apr_size_t  len)
+ {
++    if (len < 2) {
++        return 0;
++    }
+     buf[len-2] = '\0';
+     return atoi(buf);
+ }
+ 
+ static apr_uint64_t stat_read_uint64(apr_pool_t *p, char *buf, apr_size_t  len)
+ {
++    if (len < 2) {
++        return 0;
++    }
+     buf[len-2] = '\0';
+     return apr_atoi64(buf);
+ }
+ 
+ static apr_time_t stat_read_time(apr_pool_t *p, char *buf, apr_size_t  len)
+ {
++    if (len < 2) {
++        return 0;
++    }
+     buf[len-2] = '\0';
+     return apr_time_from_sec(atoi(buf));
+ }
+@@ -1583,6 +1605,9 @@ static apr_time_t stat_read_rtime(apr_pool_t *p, char *buf, apr_size_t  len)
+     char *usecs;
+     const char *sep = ":.";
+ 
++    if (len < 2) {
++        return apr_time_make(0, 0);
++    }
+     buf[len-2] = '\0';
+ 
+     secs = apr_strtok(buf, sep, &tok);
diff --git a/meta/recipes-support/apr/apr-util/CVE-2026-34502_p2.patch b/meta/recipes-support/apr/apr-util/CVE-2026-34502_p2.patch
new file mode 100644
index 0000000000..844ad8109d
--- /dev/null
+++ b/meta/recipes-support/apr/apr-util/CVE-2026-34502_p2.patch
@@ -0,0 +1,38 @@
+From 997c02ce5b9db44083c580e3e47095f5ac4524ae Mon Sep 17 00:00:00 2001
+From: Eric Covener <covener@apache.org>
+Date: Fri, 7 Aug 2026 14:23:29 +0000
+Subject: [PATCH] fix memcache version parsing
+
+partial port of 1936966 from trunk
+
+
+git-svn-id: https://svn.apache.org/repos/asf/apr/apr-util/branches/1.6.x@1936975 13f79535-47bb-0310-9956-ffa450edef68
+
+CVE: CVE-2026-34502
+Upstream-Status: Backport [https://github.com/apache/apr-util/commit/997c02ce5b9db44083c580e3e47095f5ac4524ae]
+
+(cherry picked from commit 997c02ce5b9db44083c580e3e47095f5ac4524ae)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ memcache/apr_memcache.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/memcache/apr_memcache.c b/memcache/apr_memcache.c
+index 137be778..74146712 100644
+--- a/memcache/apr_memcache.c
++++ b/memcache/apr_memcache.c
+@@ -1092,12 +1092,12 @@ apr_memcache_version(apr_memcache_server_t *ms,
+     }
+ 
+     if (strncmp(MS_VERSION, conn->buffer, MS_VERSION_LEN) == 0) {
+-        if (conn->blen < MS_VERSION_LEN + 2) {
++        if (conn->blen < MS_VERSION_LEN + 4) {
+             rv = APR_EGENERAL;
+         }
+         else {
+             *baton = apr_pstrmemdup(p, conn->buffer+MS_VERSION_LEN+1, 
+-                                    conn->blen - MS_VERSION_LEN - 2);
++                                    conn->blen - MS_VERSION_LEN - 3);
+             rv = APR_SUCCESS;
+        } 
+     }
diff --git a/meta/recipes-support/apr/apr-util_1.6.3.bb b/meta/recipes-support/apr/apr-util_1.6.3.bb
index 341975fbca..9da2da0816 100644
--- a/meta/recipes-support/apr/apr-util_1.6.3.bb
+++ b/meta/recipes-support/apr/apr-util_1.6.3.bb
@@ -18,6 +18,8 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.gz \
            file://CVE-2026-32327-dependent.patch \
            file://CVE-2026-32327.patch \
            file://CVE-2026-34501.patch \
+           file://CVE-2026-34502_p1.patch \
+           file://CVE-2026-34502_p2.patch \
            file://run-ptest \
            "
 
-- 
2.35.6


