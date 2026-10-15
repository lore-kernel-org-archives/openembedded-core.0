Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E905CC6B3C
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 12:27:39 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38411.1792067248825543734
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 05:27:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Na8pH6g1;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6278; q=dns/txt;
  s=iport01; t=1792067251; x=1793276851;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kV8zvaSNgUtoYyXy67ixFCX4gB7LnzSkePuS9nyO+cc=;
  b=Na8pH6g1hzOGf7pYBUb6MdRbgdKvsj9OopPClYfsj7QhlPd6LA3p9RMb
   eN6I4y6C+LQFkeAJ+G69eeV8+uBQkKYpVTrJmpg4dJm4qO66oCNsJNSrM
   tdIwDbbzuLjoJ+GEI/W2+OcI/yoAbb6uodlHuHvzoW6heiH2C10re2YwH
   GGXK9eKE9Ain/TxrHLd+ZuU7LZD/q5bVlTjmsmGRnuyMJu4p6q6xv8/u4
   P53dO+4Eumt4ELP8LcF7ATQY7sXeF5+tO3QBVhon1+X0G9SY/43s+qQTA
   Ou/vuZDDXGH9VvYVnbZjVTQQ1Z4z76vrhexhfJ0sv0XEHwXzC/2jj4s0H
   w==;
X-CSE-ConnectionGUID: 2KUhoDMoTFWF/Fun0kgCAw==
X-CSE-MsgGUID: dbHARy38Q/ShosqJmTNkCw==
X-IPAS-Result: =?us-ascii?q?A0BIAgDixdBq/5P/Ja1aglmCV3VhQkmWSgOeHIF+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYUFAo4UAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDZASAQIBAycLARgBLRAcAwECLysjCBmDAgGCdAIBEbtugXkzgQGDK?=
 =?us-ascii?q?QE/AkNQ2zIBCxQBBYEzhUCII10YAYR8JxsbgXKBFYE7gi6BBYFcAQGIJQSCI?=
 =?us-ascii?q?noSgVoelRJIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBHYEgg?=
 =?us-ascii?q?hYjGTZ6gQlegSspYAEQF4EJggcCglSCAAIBSUEOB0VTCSVDEkcmIggSCQETG?=
 =?us-ascii?q?jALgRs4PAkoQRcMcwwdBXIIAg0JDRgNSBEsNxUZBD5uB5F8HoFzcnsTAQckg?=
 =?us-ascii?q?UM6FymlZKEPCiiDdowilToaM6pvC5h9jgqWDkGEaYFoPIEoHwsHcBVIAYJZC?=
 =?us-ascii?q?UoZD445g2uBf4MUyUckNQIBCDIBAQcCBw4DC4FokAItgU8BAQ?=
IronPort-Data: A9a23:zqW9i6qNiBa2ciXvb/ncP2Z/Nk5eBmJOZBIvgKrLsJaIsI4StFCzt
 garIBmAbPuJNmf9LdBwYNvkoBgA6pWAndBlTFY++C5nQixD9OPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8jhfngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfvb8U435ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0rxUPGFJ2
 dkfFB4yQFetmuTuw72QY/Y506zPLOGzVG8ekmtrwTecCbMtRorOBvySo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LV/rSn8/w7pX7Wz1EqFuWrLAf6GnIxws327/oWDbQUoHRGJ8JxhbJ/
 Aoq+Uz1CDEzDs3EmQPCyXKrnfbtmB/dW6kNQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2cZLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWna1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:Vrvd4KHSgdBdr1lypLqEMMeALOsnbusQ8zAXPo5KJiC9Ffbo8P
 xG88576faZslsssTQb6LK90cq7MBfhHOBOgbX5VI3KNGKNhILrFvAG0WKI+VPd8kPFmtK1/J
 0QFZSWcOeAbmRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaEp2JK2xCe32m+oocfng/OaYE
X-Talos-CUID: =?us-ascii?q?9a23=3Aem3V5Gl/PBGvblwixX7uv7JYxcHXOSf+8XfXD2q?=
 =?us-ascii?q?/NUhWZvq7VFnI+6xPutU7zg=3D=3D?=
X-Talos-MUID: 9a23:zQfWtgvCGgQ5XuwPx82niDtCHf15uPSXT3sNlo4fmcy4Ey9bJGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,159,1787011200"; 
   d="scan'208";a="535240892"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Oct 2026 12:27:31 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 1ED1918000243;
	Thu, 15 Oct 2026 12:27:31 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id C02AFCC1292; Thu, 15 Oct 2026 05:27:30 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][scarthgap][PATCH v3 5/5] apr-util: Fix CVE-2026-34502
Date: Thu, 15 Oct 2026 05:27:21 -0700
Message-Id: <20261015122721.2278428-5-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261015122721.2278428-1-hthakar@cisco.com>
References: <20261015122721.2278428-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 12:27:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247880

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
index f87f3d9929..4d5d4b8fe0 100644
--- a/meta/recipes-support/apr/apr-util_1.6.3.bb
+++ b/meta/recipes-support/apr/apr-util_1.6.3.bb
@@ -17,6 +17,8 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.gz \
            file://CVE-2026-32327-dependent.patch \
            file://CVE-2026-32327.patch \
            file://CVE-2026-34501.patch \
+           file://CVE-2026-34502_p1.patch \
+           file://CVE-2026-34502_p2.patch \
            file://run-ptest \
            "
 
-- 
2.35.6


