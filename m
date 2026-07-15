Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A068C44501
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 17:22:11 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.394.1784136121418463913
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 10:22:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=XaSyrShs;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4222; q=dns/txt;
  s=iport01; t=1784136121; x=1785345721;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=O4Awg/bbx3qhjSb8cfk2Nv88A0jqvqgIS+e0DKndBpM=;
  b=XaSyrShsDdFf7A+ukzdiRaiUBLPlF3Wpnady4bHiYCH2jb5qNGV6LsEf
   l8ww4pxfkqAPWeQhaZRpQHac+WWa1+pEaUr+QCDgPj7p9sCaNCVl+XOre
   7f42ZDfqiQm9RAVhBBD9oCx06mItojNoHnsgPeqp4ndPtB5mc4dasdprx
   bM9VDvUIBmkypByIolZ6MD3vWuDDQ00BlAz0N7J2HtilyLAPXI9RfUMtb
   r2HSHGCi/+bbZRd3GbWC4RqogipfIM7bm95JCmwxA8ZQKnJUJ+cldq0x6
   PP3mBAyNY6R0nD6tChEV3IzC8Dq0ckAn8Hdl0RB9R8zeGfT03OP3nAzXC
   Q==;
X-CSE-ConnectionGUID: uF3FuWi5Tr2IRBZR/osg7w==
X-CSE-MsgGUID: EOeYuCQPRk2v9Qo4SRPKJw==
X-IPAS-Result: =?us-ascii?q?A0BLAgCFwFdq/5X/Ja1aglmCV3RfQkmEV49SgiEDgROdC?=
 =?us-ascii?q?IF+DwEBAQ9EDQQBAYUFAo1RAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4Thk8NhloBAgEDIwQLAVYcAwECAwImAgIrIwgQAQiDAgGCdAMRv?=
 =?us-ascii?q?R16fzOBAYNoAkNQ2y4BBQYUAYEKLoU/gx0BhQJcGAGEfCcbG4FygRWCc3aBB?=
 =?us-ascii?q?YFcAYEohBSCagSCIoEMgVqQFkiBAhwDWSwBVRMNCgsHBYFmAzUSKhVuMh2BI?=
 =?us-ascii?q?z4XNFgbBwWBHYFQgQKEdiMfAzl/gTB1SnctahIXgVGCFIEYAwsYDUgRLDcUG?=
 =?us-ascii?q?wQ9AW4HjUklgjgHgQ4BKxeCOaVPoRIKKIN1jCGVOhozqmwLmH2OCpVzXYRpg?=
 =?us-ascii?q?Wg8gUcLB3AVgyJTGQ+OLQsLhV+DFMkvPDULMgEBBwIHDgMLgWiQAAImB4FPA?=
 =?us-ascii?q?QE?=
IronPort-Data: A9a23:ld951avDLFIzB0AnMh0Jo9yt5efnVAdfMUV32f8akzHdYApBsoF/q
 tZmKT/Va/yOZzPxeYt3YYyw9U0Gu5LSyYRgS1RvrX9nQXgUgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZTdJ5xYuajhKs/3a9Us21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw58gsL3xx9
 KEkMmosVDqxvaWx273kVbw57igjBJGD0II3oHpsy3TdSP0hW52GGv+M7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtGYH49tL/Aan3XfzBVsluJpa0f6GnIxws327/oWDbQUoHTHZ0KwB3C9
 woq+UzUJRwrKfem8QCGqGz9v+iTphnDe6ANQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2cbLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWra1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:ptnMgqvkmtdqKRymRwE+AHcI7skDVNV00zEX/kB9WHVpm6uj5q
 eTdZUgpHvJYVkqNk3I9ersBEDEewK+yXcX2/h1AV7dZmjbUQKTRekIh7cKgQeQeREWndQz6U
 4PScRD4aXLbWRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaDZ2JK2xCe36m+oocfng+OaYE
X-Talos-CUID: =?us-ascii?q?9a23=3ACNjbrml0+IfbgTo05oNST7PYnhXXOWDzl1nNHE7?=
 =?us-ascii?q?lNXwzaYe/e2XX/7hrzNU7zg=3D=3D?=
X-Talos-MUID: 9a23:0gWvZAjldU+tvFApScNW6cMpGeBl0rmFMXg3ks8Y6vCDaRdKAxS/k2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,165,1779148800"; 
   d="scan'208";a="510076329"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Jul 2026 17:22:00 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id 3FC7E180001F7
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 17:22:00 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 5FA4ECC037D; Wed, 15 Jul 2026 22:51:58 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 2/6] glib-2.0: Fix CVE-2026-58011
Date: Wed, 15 Jul 2026 22:51:38 +0530
Message-Id: <20260715172142.1146263-2-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260715172142.1146263-1-deeratho@cisco.com>
References: <20260715172142.1146263-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 17:22:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241021

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream 2.88.1 backport for
CVE-2026-58011. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://gitlab.gnome.org/GNOME/glib/-/commit/5627b376381f7bfe98f4c64bc2d9d363457ddb82
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-58011

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../glib-2.0/files/CVE-2026-58011.patch       | 78 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib.inc           |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/files/CVE-2026-58011.patch

diff --git a/meta/recipes-core/glib-2.0/files/CVE-2026-58011.patch b/meta/recipes-core/glib-2.0/files/CVE-2026-58011.patch
new file mode 100644
index 0000000000..e90891bffe
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/files/CVE-2026-58011.patch
@@ -0,0 +1,78 @@
+From 456bd48b32bfc79ebb69a5dcc8d86b0ce99f71d6 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@gnome.org>
+Date: Sun, 29 Mar 2026 23:46:17 +0100
+Subject: [PATCH] gdatetime: Add missing range validation to
+ g_date_time_add_full()
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Otherwise it’s possible to create a non-`NULL` but invalid `GDateTime`,
+which breaks all kinds of internal assumptions.
+
+Spotted by linhlhq as #YWH-PGM9867-191. Thanks to them for providing a
+suggested fix and a test case, which I have adapted and validated.
+
+Fixes: #3917
+
+CVE: CVE-2026-58011
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/5627b376381f7bfe98f4c64bc2d9d363457ddb82]
+
+Backport Changes:
+- Used the target branch's existing literal day bounds because it does
+  not have upstream's MIN_DAYS/MAX_DAYS helper macros.
+
+Signed-off-by: Philip Withnall <pwithnall@gnome.org>
+(cherry picked from commit 5627b376381f7bfe98f4c64bc2d9d363457ddb82)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ glib/gdatetime.c       |  4 +++-
+ glib/tests/gdatetime.c | 18 ++++++++++++++++++
+ 2 files changed, 21 insertions(+), 1 deletion(-)
+
+diff --git a/glib/gdatetime.c b/glib/gdatetime.c
+index 8d67354cf..cca2cdae3 100644
+--- a/glib/gdatetime.c
++++ b/glib/gdatetime.c
+@@ -2076,7 +2076,9 @@ g_date_time_add_full (GDateTime *datetime,
+   new->days = full_time / USEC_PER_DAY;
+   new->usec = full_time % USEC_PER_DAY;
+ 
+-  /* XXX validate */
++  /* Validate it’s still in the range 0001-01-01 to 9999-12-31 */
++  if (new->days < 1 || new->days > 3652059)
++    g_clear_pointer (&new, g_date_time_unref);
+ 
+   return new;
+ }
+diff --git a/glib/tests/gdatetime.c b/glib/tests/gdatetime.c
+index 08e4075e9..d003a5445 100644
+--- a/glib/tests/gdatetime.c
++++ b/glib/tests/gdatetime.c
+@@ -1146,6 +1146,24 @@ test_GDateTime_add_full (void)
+   TEST_ADD_FULL (2010,  8, 25, 22, 45, 0,
+                     0,  1,  6,  1, 25, 0,
+                  2010, 10,  2,  0, 10, 0);
++
++#define TEST_ADD_FULL_ERROR(y,m,d,h,mi,s,ay,am,ad,ah,ami,as) G_STMT_START { \
++  GDateTime *dt; \
++  dt = g_date_time_new_utc (y, m, d, h, mi, s); \
++  g_assert_null (g_date_time_add_full (dt, ay, am, ad, ah, ami, as)); \
++  g_date_time_unref (dt); \
++} G_STMT_END
++
++  TEST_ADD_FULL_ERROR (     1, 12,  1,  0,  0, 0,
++                           -1,  0,  0,  0,  0, 0);
++  TEST_ADD_FULL_ERROR (     1, 12,  1,  0,  0, 0,
++                        10000,  0,  0,  0,  0, 0);
++  TEST_ADD_FULL_ERROR (  9999, 12,  1,  0,  0, 0,
++                       -10000,  0,  0,  0,  0, 0);
++  TEST_ADD_FULL_ERROR (     1, 12,  1,  0,  0, 0,
++                            0,  0, 3660001,  0,  0, 0);
++  TEST_ADD_FULL_ERROR (  9999, 12,  1,  0,  0, 0,
++                            0,  0, -3660001,  0,  0, 0);
+ }
+ 
+ static void
+-- 
+2.35.6
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 36c837dc79..c961dbf660 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -234,6 +234,7 @@ SRC_URI += "\
            file://0010-Do-not-hardcode-python-path-into-various-tools.patch \
            file://skip-timeout.patch \
            file://CVE-2026-58010.patch \
+           file://CVE-2026-58011.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
-- 
2.35.6


