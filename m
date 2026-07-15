Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3B6CC4450E
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 17:24:35 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5.1784136267178675439
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 10:24:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=fx6gcFrh;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4304; q=dns/txt;
  s=iport01; t=1784136267; x=1785345867;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Rm1sgufhN+l9u80puQJho0B5sK8bGgR6vGHmdYztJ6E=;
  b=fx6gcFrhp9gZEtfdOub5DcUufh0y19SIwcIy7HknAy+AEsPTVI5hlFqA
   QyzQcdzgslCHqH0PuvTt/HNEYh9ELcVOZThSpOEph9vp3+R4zmgazqlwN
   x8x7LIJ/mbehSetno50OvNry/NJBCS3gougiw046bBaEBGSIQeqRYd7vo
   eYZuOBeKagm6+geKRwAyr8XPxaj/flIGtnFKdCvJvTeSoaWdhqT/GXLbA
   shMKAnsAvsAUac3ffLunsYZs8Kq8FwqHYGl+wL2cLNQt3xzGt/tM2NcAk
   orgUFsPVvAyK+ERsq/Skhps89nwK/N0hLZFA88F5gaCvc8o1fKvgYQdcF
   g==;
X-CSE-ConnectionGUID: wJO0JG+MRjmnUvqeKWvLqw==
X-CSE-MsgGUID: HKDcgLibTUWGAorusKkEQQ==
X-IPAS-Result: =?us-ascii?q?A0BLAgDtwVdq/4r/Ja1aHgEBCxIMggULgld0X0JJhFePU?=
 =?us-ascii?q?oIhA4ETnQiBfg8BAQEPRA0EAQGFBQKNUQImNAkOAQIEAwIDAQEBAQEBAQEBA?=
 =?us-ascii?q?QELAQEFAQEBAgEHBYEOE4ZPDYZaAQIBAyMECwEYAT0cAwECAwImAgIrIwgQA?=
 =?us-ascii?q?QiDAgGCdAMRvUR6fzOBAYMoAT8CQ1DbLgELFAGBCi6FP4MdAYUCXBgBhHwnG?=
 =?us-ascii?q?xuBcoEVgnN2gQWBXAGBKIQUgmoEgiKBDIFaHo95SIECHANZLAFVEw0KCwcFg?=
 =?us-ascii?q?WYDNRIqFW4yHYEjPhc0WBsHBYEdgVCBAoR2Ix8DOX+BMHVKdy1qEheBUYIUg?=
 =?us-ascii?q?RoDCxgNSBEsNxQbBD0BbgeNSiWCOAeBDgErF4I5pU+hEgoog3WMIZU6GjOqb?=
 =?us-ascii?q?AuYfY4KlXNdhGmBaDyBRwsHcBWDIglKGQ+OLQsLhV+DFMkFPDUCAQgyAQEHA?=
 =?us-ascii?q?gcOAwuBaJAAAiYHgU8BAQ?=
IronPort-Data: A9a23:WNFkN6NG+pppyirvrR30lsFynXyQoLVcMsEvi/4bfWQNrUp21jcBn
 2MdC2iHOauLMGDzLdpxPI62oElSsZODnYJkSnM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WV7lV
 e/a+ZWFZgf6gmMsawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6+pMKxkUEs49wORyB1xQ7
 PE7Fy4pdw/W0opawJrjIgVtrt4oIM+uOMYUvWttiGmAS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2M0PHwsYDUXUrsTIJ4zkf2hmnn4WzZZs1mS46Ew5gA/ySQsieC3YYOMI4ziqcN9vmW0r
 W3i/m7FPy41HduF1CGm8V+Vv7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++MukCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXKIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:UNZlsqnq3FCknRqyI8kppq9G8WzpDfIO3DAbv31ZSRFFG/Fw8P
 re+8jztCWE7Ar5N0tPpTntAsS9qDbnhP1ICOoqTNKftXfd2VdARbsKheCJ/9SjIVydygc378
 hdmsZFZOEYdWIbse/KpC+lDt0n3N6LtIqshevY0jNRaDsCUdAH0++8YTzranGfg2J9dOMEKK
 Y=
X-Talos-CUID: =?us-ascii?q?9a23=3A/1oW02izLZSke8lYyruaTYV6BTJubV/6lFX/YGq?=
 =?us-ascii?q?CC2NvdaOMRHyv5od9jJ87?=
X-Talos-MUID: 9a23:DMRMrQhwLbzsmxS/LzC7gMMpFORE6KuKCUoxrKopks6eKDdTOBqktWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,165,1779148800"; 
   d="scan'208";a="510291118"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Jul 2026 17:24:18 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id EBDBB180001CD
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 17:24:17 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 196D8CC037D; Wed, 15 Jul 2026 22:54:16 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 2/6] glib-2.0: fix CVE-2026-58011
Date: Wed, 15 Jul 2026 22:53:26 +0530
Message-Id: <20260715172330.1149253-2-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260715172330.1149253-1-deeratho@cisco.com>
References: <20260715172330.1149253-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 17:24:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241027

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream 2.86.5 backport for
CVE-2026-58011. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://gitlab.gnome.org/GNOME/glib/-/commit/ae27363f025ffc131e2d75ee88a5cd8320dffe3b
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-58011

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../glib-2.0/glib-2.0/CVE-2026-58011.patch    | 78 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58011.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58011.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58011.patch
new file mode 100644
index 0000000000..a8d31c1270
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58011.patch
@@ -0,0 +1,78 @@
+From 371dbccb6b9a9a42b93c4b371214b159e7e94792 Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/ae27363f025ffc131e2d75ee88a5cd8320dffe3b]
+
+Backport Changes:
+- Used the target branch's existing literal day bounds because it does
+  not have upstream's MIN_DAYS/MAX_DAYS helper macros.
+
+Signed-off-by: Philip Withnall <pwithnall@gnome.org>
+(cherry picked from commit ae27363f025ffc131e2d75ee88a5cd8320dffe3b)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ glib/gdatetime.c       |  4 +++-
+ glib/tests/gdatetime.c | 18 ++++++++++++++++++
+ 2 files changed, 21 insertions(+), 1 deletion(-)
+
+diff --git a/glib/gdatetime.c b/glib/gdatetime.c
+index 2640e3b24..73eea643b 100644
+--- a/glib/gdatetime.c
++++ b/glib/gdatetime.c
+@@ -2024,7 +2024,9 @@ g_date_time_add_full (GDateTime *datetime,
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
+index 49390c900..527d61a11 100644
+--- a/glib/tests/gdatetime.c
++++ b/glib/tests/gdatetime.c
+@@ -1117,6 +1117,24 @@ test_GDateTime_add_full (void)
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
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
index 32e578db3c..6532d7eac0 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
@@ -48,6 +48,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2026-1489-03.patch \
            file://CVE-2026-1489-04.patch \
            file://CVE-2026-58010.patch \
+           file://CVE-2026-58011.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
-- 
2.35.6


