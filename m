Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B2FEC5DF97
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 05:41:07 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6160.1787722857287222361
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 22:40:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=CNxnMjsf;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=23441; q=dns/txt;
  s=iport01; t=1787722857; x=1788932457;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jZLf+EBuo7rJcDeQPLfczKLiq9KSuHrzsAQs9QuwW8A=;
  b=CNxnMjsfAJ2G8AuB6W9wCUoZ96XhU2+yZvUoSlPWYOMyZK4EkdU1yYJc
   Dn5tJLslrHbrfrFfaXWLA7vKRnio65fgN5lSdjFuSg1ejY7syeNkww8LB
   cQLC3nt7ikUu8uVe/VVmWiu0+3NhZob0UckOLoezdFUpA+BcVZIRsBKZu
   BgDvZrVZiUa9LdJV4u9hjTqoUh6NYimUxSf0QUAo9/cyvXY1XBEFnhUI1
   ZY9ySkNvlTK72qF5Nr8ilY++t4JdNsUwNj+vH74y56ZP+Hxv6BvOKaZNs
   pLGGtgtO6SRXsgsVywrybDh/0QL77R0XfZZhMUbdut+rzn0pGTsOWkjww
   A==;
X-CSE-ConnectionGUID: DrjhZVcFQo+nbYqKL6WpHw==
X-CSE-MsgGUID: YqHDR2LtTLizUuQze/q1Yw==
X-IPAS-Result: =?us-ascii?q?A0BIAgByeo5q/48QJK1aglmCV3RfQkmWSgOeG4F+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYUFAo1sAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDYZaAQIBAxoNCwEYAS0QHAMBAi8rIwgZgwIBgnQCARG+RoF5M4EBg?=
 =?us-ascii?q?ygBPwJDUNswAQsUAQWBM4U/iCJdGAGEfCcbG4FygRWDaYEFgVwBAYEnBguGb?=
 =?us-ascii?q?QSCInoSgVoekWpIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQ0bBgWBH?=
 =?us-ascii?q?YEohBAjGTZ8gQlegSspYAESF4EJggcCglqCBQIBSUMOB0c+CxgNSBEsNxQZB?=
 =?us-ascii?q?D5uB45rH4JCBwF6EwErgRFzECmjRIIhoQ8KKIN2jCKVOhozqmwLmH2OCpZQh?=
 =?us-ascii?q?GmBaDyBKB8LB3AVSAGCWQlKGQ+OLQsLg2CBf4MUxyYkNQIBCDIBAQcCBw4DC?=
 =?us-ascii?q?4FokAABJ4FWAQE?=
IronPort-Data: A9a23:LrwdVKqKfZo4dDVqBnymBbRvfG1eBmJPZBIvgKrLsJaIsI4StFCzt
 garIBmFOvreZDPzf91yPY238klXsZbcyoAwHQZu+yE0QiwQouPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8jifHgqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgLNNwJcaDpOtfrT8k035ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0sptA2F8y
 /c2ETdOaBqynsGSno2javY506zPLOGzVG8eknhkyTecCbMtRorOBv2Uo9RZxzw3wMtJGJ4yZ
 eJANmEpN0qGOkMJYwtMYH49tL/Aan3XcyFYoVGcv4I84nPYy0p6172F3N/9KofUHp8Oxx/Bz
 o7A11XgIj0gbviD9R6E4E+xv/3C2jqiaZ1HQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS4QWJzO/Qpg2eHGVBFmAHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:XoGMoKpGvnmwoa0aXDKA0pkaV5rzeYIsimQD101hICG9vPb2qy
 nIpoV96faaslcssR0b9OxofZPwI080lqQFhbX5Q43DYOCOggLBR+tfBMnZsljd8kbFmNK1u5
 0NT0FWMqyXMbEDt7eY3CCIV/A93dKA7Kekwc3az3trUEVWTpsI1XYBNu5eeXcGPzWvwvECZe
 Kh2vY=
X-Talos-CUID: =?us-ascii?q?9a23=3AKPX79miZzAsw+zIbq1yWzRaj9DJuXmffzEXuKGG?=
 =?us-ascii?q?BDiVvQoyManvOx7tEjJ87?=
X-Talos-MUID: 9a23:E8Eb3gRAONlCMcwiRXTdnRFODp1M/5iKCVIwjKwUto6dbB1vbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,244,1779148800"; 
   d="scan'208";a="836323111"
Received: from alln-l-core-06.cisco.com ([173.36.16.143])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Aug 2026 05:36:55 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-06.cisco.com (Postfix) with ESMTPS id 69E7618000139;
	Wed, 26 Aug 2026 05:36:55 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id 07AC3CE1BBD; Tue, 25 Aug 2026 22:36:55 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][scarthgap][PATCH 2/5] apr-util: Fix CVE-2026-32327
Date: Tue, 25 Aug 2026 22:36:24 -0700
Message-Id: <20260826053627.1798620-2-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260826053627.1798620-1-hthakar@cisco.com>
References: <20260826053627.1798620-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: alln-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 05:41:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244299

From: Hetvi Thakar <hthakar@cisco.com>

Backport the upstream test compatibility prerequisite [1], which is
required by the regression tests included with the XML nesting-depth
fix [2]. The fix addresses CVE-2026-32327 as described by the advisory
[3].

[1] https://github.com/apache/apr-util/commit/dba5d434dba0547478f411d6fa068766455446ce
[2] https://github.com/apache/apr-util/commit/414e12e427c89f135d8ee66ab1203feffd3e2bd8
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-32327

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../apr-util/CVE-2026-32327-dependent.patch   |   34 +
 .../apr/apr-util/CVE-2026-32327.patch         | 2162 +++++++++++++++++
 meta/recipes-support/apr/apr-util_1.6.3.bb    |    2 +
 3 files changed, 2198 insertions(+)
 create mode 100644 meta/recipes-support/apr/apr-util/CVE-2026-32327-dependent.patch
 create mode 100644 meta/recipes-support/apr/apr-util/CVE-2026-32327.patch

diff --git a/meta/recipes-support/apr/apr-util/CVE-2026-32327-dependent.patch b/meta/recipes-support/apr/apr-util/CVE-2026-32327-dependent.patch
new file mode 100644
index 0000000000..c3c570f407
--- /dev/null
+++ b/meta/recipes-support/apr/apr-util/CVE-2026-32327-dependent.patch
@@ -0,0 +1,34 @@
+From dba5d434dba0547478f411d6fa068766455446ce Mon Sep 17 00:00:00 2001
+From: Joe Orton <jorton@apache.org>
+Date: Tue, 19 Dec 2023 11:20:33 +0000
+Subject: [PATCH] Merge r1914772 from 1.7.x:
+
+* test/testutil.h: Define APR_ASSERT_SUCCESS for compatibility
+  with apr trunk.
+
+
+
+git-svn-id: https://svn.apache.org/repos/asf/apr/apr-util/branches/1.6.x@1914774 13f79535-47bb-0310-9956-ffa450edef68
+
+CVE: CVE-2026-32327
+Upstream-Status: Backport [https://github.com/apache/apr-util/commit/dba5d434dba0547478f411d6fa068766455446ce]
+
+(cherry picked from commit dba5d434dba0547478f411d6fa068766455446ce)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ test/testutil.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/test/testutil.h b/test/testutil.h
+index eaa7e759..4c5e30b8 100644
+--- a/test/testutil.h
++++ b/test/testutil.h
+@@ -40,6 +40,8 @@ extern apr_pool_t *p;
+ /* Assert that RV is an APR_SUCCESS value; else fail giving strerror
+  * for RV and CONTEXT message. */
+ void apr_assert_success(abts_case* tc, const char *context, apr_status_t rv);
++#define APR_ASSERT_SUCCESS(tc, ctxt, rv) \
++             apr_assert_success(tc, ctxt, rv)
+ 
+ void apr_assert_failure(abts_case* tc, const char *context,
+                         apr_status_t rv, int lineno);
diff --git a/meta/recipes-support/apr/apr-util/CVE-2026-32327.patch b/meta/recipes-support/apr/apr-util/CVE-2026-32327.patch
new file mode 100644
index 0000000000..a0c4004709
--- /dev/null
+++ b/meta/recipes-support/apr/apr-util/CVE-2026-32327.patch
@@ -0,0 +1,2162 @@
+From 414e12e427c89f135d8ee66ab1203feffd3e2bd8 Mon Sep 17 00:00:00 2001
+From: Joe Orton <jorton@apache.org>
+Date: Mon, 3 Aug 2026 12:34:32 +0000
+Subject: [PATCH] Merge r1936807 from 1.7.x:
+
+limit XML processing depth
+
+Submitted By: jorton
+Reviewed By: jorton, jfclere, ivan
+
+
+git-svn-id: https://svn.apache.org/repos/asf/apr/apr-util/branches/1.6.x@1936815 13f79535-47bb-0310-9956-ffa450edef68
+
+CVE: CVE-2026-32327
+Upstream-Status: Backport [https://github.com/apache/apr-util/commit/414e12e427c89f135d8ee66ab1203feffd3e2bd8]
+
+(cherry picked from commit 414e12e427c89f135d8ee66ab1203feffd3e2bd8)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ CMakeLists.txt        |    3 +
+ test/data/nesting.xml | 2001 +++++++++++++++++++++++++++++++++++++++++
+ test/testxml.c        |   32 +
+ xml/apr_xml.c         |   21 +-
+ 4 files changed, 2056 insertions(+), 1 deletion(-)
+ create mode 100644 test/data/nesting.xml
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index fcbfc582..65b9194d 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -288,6 +288,9 @@ IF(APR_BUILD_TESTAPR)
+   EXECUTE_PROCESS(COMMAND ${CMAKE_COMMAND} -E copy_if_different 
+                   ${PROJECT_SOURCE_DIR}/test/data/billion-laughs.xml
+                   ${PROJECT_BINARY_DIR}/data/billion-laughs.xml)
++  EXECUTE_PROCESS(COMMAND ${CMAKE_COMMAND} -E copy_if_different 
++                  ${PROJECT_SOURCE_DIR}/test/data/nesting.xml
++                  ${PROJECT_BINARY_DIR}/data/nesting.xml)
+ 
+   IF(TEST_STATIC_LIBS)
+     SET(whichapr    aprutil-1)
+diff --git a/test/data/nesting.xml b/test/data/nesting.xml
+new file mode 100644
+index 00000000..a4efda86
+--- /dev/null
++++ b/test/data/nesting.xml
+@@ -0,0 +1,2001 @@
++<?xml version="1.0"?>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++<n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
++</n>
+diff --git a/test/testxml.c b/test/testxml.c
+index eed10672..5284f888 100644
+--- a/test/testxml.c
++++ b/test/testxml.c
+@@ -20,6 +20,10 @@
+ #include "abts.h"
+ #include "testutil.h"
+ 
++#ifndef APR_XML_MAX_DEPTH
++#define APR_XML_MAX_DEPTH 256
++#endif
++
+ static apr_status_t create_dummy_file_error(abts_case *tc, apr_pool_t *p,
+                                             apr_file_t **fd)
+ {
+@@ -166,6 +170,33 @@ static void test_billion_laughs(abts_case *tc, void *data)
+     apr_file_close(fd);
+ }
+ 
++static void test_nesting_limit(abts_case *tc, void *data)
++{
++    apr_file_t *fd;
++    apr_xml_parser *parser = NULL;
++    apr_xml_doc *doc;
++    apr_status_t rv;
++    char errbuf[256], *err;
++
++    rv = apr_file_open(&fd, "data/nesting.xml",
++                       APR_FOPEN_READ, 0, p);
++    APR_ASSERT_SUCCESS(tc, "open nesting.xml", rv);
++
++    rv = apr_xml_parse_file(p, &parser, &doc, fd, 2000);
++    ABTS_TRUE(tc, rv != APR_SUCCESS);
++
++    if (parser) {
++        err = apr_xml_parser_geterror(parser, errbuf, sizeof errbuf);
++        ABTS_STR_EQUAL(tc,
++                       "The maximum element nesting limit "
++                       "(" APR_STRINGIFY(APR_XML_MAX_DEPTH) ")"
++                       " was exceeded.",
++                       err);
++    }
++
++    apr_file_close(fd);
++}
++
+ static void test_CVE_2009_3720_alpha(abts_case *tc, void *data)
+ {
+     apr_xml_parser *xp;
+@@ -198,6 +229,7 @@ abts_suite *testxml(abts_suite *suite)
+ 
+     abts_run_test(suite, test_xml_parser, NULL);
+     abts_run_test(suite, test_billion_laughs, NULL);
++    abts_run_test(suite, test_nesting_limit, NULL);
+     abts_run_test(suite, test_CVE_2009_3720_alpha, NULL);
+     abts_run_test(suite, test_CVE_2009_3720_beta, NULL);
+ 
+diff --git a/xml/apr_xml.c b/xml/apr_xml.c
+index 2685a9a5..a2535f98 100644
+--- a/xml/apr_xml.c
++++ b/xml/apr_xml.c
+@@ -61,12 +61,19 @@ struct apr_xml_parser {
+     int error;			/* an error has occurred */
+ #define APR_XML_ERROR_EXPAT             1
+ #define APR_XML_ERROR_PARSE_DONE        2
+-/* also: public APR_XML_NS_ERROR_* values (if any) */
++#define APR_XML_ERROR_DEPTH_LIMIT       3
+ 
++/* also: public APR_XML_NS_ERROR_* values (if any) */
++    /** depth of element tree. */
++    unsigned int depth;
+     XML_Parser xp;              /* the actual (Expat) XML parser */
+     enum XML_Error xp_err;      /* stored Expat error code */
+ };
+ 
++#ifndef APR_XML_MAX_DEPTH
++#define APR_XML_MAX_DEPTH 256
++#endif
++
+ /* struct for scoping namespace declarations */
+ typedef struct apr_xml_ns_scope {
+     const char *prefix;		/* prefix used for this ns */
+@@ -154,6 +161,11 @@ static void start_handler(void *userdata, const char *name, const char **attrs)
+     if (parser->error)
+ 	return;
+ 
++    if (++parser->depth > APR_XML_MAX_DEPTH) {
++        parser->error = APR_XML_ERROR_DEPTH_LIMIT;
++        return;
++    }
++
+     elem = apr_pcalloc(parser->p, sizeof(*elem));
+ 
+     /* prep the element */
+@@ -327,6 +339,8 @@ static void end_handler(void *userdata, const char *name)
+     if (parser->error)
+ 	return;
+ 
++    parser->depth--;
++
+     /* pop up one level */
+     parser->cur_elem = parser->cur_elem->parent;
+ }
+@@ -499,6 +513,11 @@ APU_DECLARE(char *) apr_xml_parser_geterror(apr_xml_parser *parser,
+                             XML_ErrorString(parser->xp_err), parser->xp_err);
+         return errbuf;
+ 
++    case APR_XML_ERROR_DEPTH_LIMIT:
++        msg = "The maximum element nesting limit ("
++            APR_STRINGIFY(APR_XML_MAX_DEPTH) ") was exceeded.";
++        break;
++
+     case APR_XML_ERROR_PARSE_DONE:
+         msg = "The parser is not active.";
+         break;
diff --git a/meta/recipes-support/apr/apr-util_1.6.3.bb b/meta/recipes-support/apr/apr-util_1.6.3.bb
index 06f13e91ca..e3d6a23fcb 100644
--- a/meta/recipes-support/apr/apr-util_1.6.3.bb
+++ b/meta/recipes-support/apr/apr-util_1.6.3.bb
@@ -15,6 +15,8 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.gz \
 	   file://0001-test_transformation-Check-if-transform-is-supported-.patch \
            file://CVE-2025-49506_p1.patch \
            file://CVE-2025-49506_p2.patch \
+           file://CVE-2026-32327-dependent.patch \
+           file://CVE-2026-32327.patch \
            file://run-ptest \
            "
 
-- 
2.35.6


