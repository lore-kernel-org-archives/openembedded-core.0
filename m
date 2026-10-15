Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4AB4CC6B34
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 12:27:38 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38411.1792067248825543734
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 05:27:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=CapP+/rY;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=23727; q=dns/txt;
  s=iport01; t=1792067248; x=1793276848;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1BTKg52plI66ODFWOwVGQJoRBjWPoflo34Gs4m24mog=;
  b=CapP+/rYmV3GJGu+7jcvY8Uty0obcEc6aiMddpjg7yziHeQfPCk8+4MN
   Lqg80O07KVdNnpu8CMtEQWVLO57zUDkuqhzawb6/yfvaSMZTSdrFsae02
   r+W81WT5S7A5H3b/LqC5IjF4T0l8O+xwZJmALSYxsHp9fwBrhcOr7ZL3q
   qZkWE6WR/MfWSVAk2AnYu+yvkQXhk1euEFEFgkE9NwfqXl4vacInQSJB3
   r6kcDgCN0utMtmHb+NeHYycZBcZue65B/f2MHMeY3tyOKCS9ibMOaoLDH
   XPwem4mKHXPW58fVap08+SQrtw7RIJypi6WHhZ7HQ8INBcFRJ7glQcY1p
   Q==;
X-CSE-ConnectionGUID: xMqUIZCiShGnxrO9IZTMrQ==
X-CSE-MsgGUID: AHEMA6LvRA6e6g0UA1QDyQ==
X-IPAS-Result: =?us-ascii?q?A0BJAgDixdBq/5D/Ja1aglmCV3VhQkmVXmwDnhyBfg8BA?=
 =?us-ascii?q?QEPRA0EAQGFBQKOFAImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QEgECAQMaDQsBGAEtEBwDAQIvKyMIGYMCAYJ0AgERu26BeTOBA?=
 =?us-ascii?q?YMpAT8CQ1DbMgELFAEFgTOFQIgjXRgBhHwnGxuBcoEVg2mBBYFcAQGBJwYLh?=
 =?us-ascii?q?m0EgiKBDIFaHpUSSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F4EHGwYFg?=
 =?us-ascii?q?R2BIIIWIxk2eoEJXoErKWABEBeBCYIHAoJUggACAUlBDgdFUwklQxJHJiIIE?=
 =?us-ascii?q?gkBExowC4EbODwJKEEXDHMMHQVyCAINCQ0YDUgRLDcVGQQ+bgeRfB6CXgcBe?=
 =?us-ascii?q?hMBK4ERcxApo0OCIaEPCiiDdowilToaM6pvC5h9jgqWT4RpgWg8gSgfCwdwF?=
 =?us-ascii?q?UgBglkJShkPji4BCguDYIF/gxTJRyQ1AgEIMgEBBwIHDgMLgWiQAAEngVYBA?=
 =?us-ascii?q?Q?=
IronPort-Data: A9a23:T/1cwqz7xuIkNXnC51N6t+dhxyrEfRIJ4+MujC+fZmUNrF6WrkUGn
 DQeXG3XOKmMYjOke9lzPd/g8kkEu56DmoVkHVNo/1hgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHyYuCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWcsaz9MsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJFETJLA5yM12OmFh8
 +wCD2EsXCymndvjldpXSsE07igiBNPgMIVavjRryivUSK55B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cP3WjOX9PYH46tOe0hnD8eidwo1OOrq1x6G/WpOB0+OW2bYCJIozUFK25mG6xh
 k/j1jrdHCszatHBxmK42yuVqv72yHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7GQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:UgLUaKvj57+Fs+p2nrTW1qN47skDrtV00zEX/kB9WHVpmwKj+P
 xG+85rsiMc5wxxZJhNo7290ey7MBHhHP1OkO0s1MmZPDUO0VHAROoJ0WKh+UyEJ8SUzIBgPM
 lbH5SWIeeAa2SS9fyKgzWQIpIH3MSN9ryuiKP1yndgShwvVoRbhj0Jczpy1iZNNXJ77V1TLu
 vl2vZ6
X-Talos-CUID: 9a23:npz12mDsZKt7xZ/6EzlC7XM1KOskSX3yymfKBB6ZO1pMUoTAHA==
X-Talos-MUID: 9a23:z7SS4QmrDinqC95Ip1zSdnpLFOpNyvqKFnokz5hYtJG5HHVJFyak2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,159,1787011200"; 
   d="scan'208";a="535240869"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Oct 2026 12:27:27 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 9E3361800049A;
	Thu, 15 Oct 2026 12:27:27 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id 4B9D8CC1292; Thu, 15 Oct 2026 05:27:27 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][scarthgap][PATCH v3 2/5] apr-util: Fix CVE-2026-32327
Date: Thu, 15 Oct 2026 05:27:18 -0700
Message-Id: <20261015122721.2278428-2-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261015122721.2278428-1-hthakar@cisco.com>
References: <20261015122721.2278428-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 12:27:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247878

From: Hetvi Thakar <hthakar@cisco.com>

Backport the upstream test compatibility prerequisite [1], which is
required by the regression tests included with the XML nesting-depth
fix [2]. The fix addresses CVE-2026-32327 as described by the advisory
[3].

[1] https://github.com/apache/apr-util/commit/dba5d434dba0547478f411d6fa068766455446ce
[2] https://github.com/apache/apr-util/commit/414e12e427c89f135d8ee66ab1203feffd3e2bd8
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-32327

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>

# Conflicts:
#	meta/recipes-support/apr/apr-util_1.6.3.bb

# Conflicts:
#	meta/recipes-support/apr/apr-util_1.6.3.bb
---
 .../apr-util/CVE-2026-32327-dependent.patch   |   34 +
 .../apr/apr-util/CVE-2026-32327.patch         | 2162 +++++++++++++++++
 meta/recipes-support/apr/apr-util_1.6.3.bb    |    2 +-
 3 files changed, 2197 insertions(+), 1 deletion(-)
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
index 19f8e59ca5..c721d35f61 100644
--- a/meta/recipes-support/apr/apr-util_1.6.3.bb
+++ b/meta/recipes-support/apr/apr-util_1.6.3.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=158aa0b1efe0c12f23d4b007ddb9a5db \
 SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.gz \
            file://configfix.patch \
            file://configure_fixes.patch \
-	   file://0001-test_transformation-Check-if-transform-is-supported-.patch \
+	       file://0001-test_transformation-Check-if-transform-is-supported-.patch \
            file://CVE-2025-49506.patch \
            file://CVE-2026-32327-dependent.patch \
            file://CVE-2026-32327.patch \
-- 
2.35.6


