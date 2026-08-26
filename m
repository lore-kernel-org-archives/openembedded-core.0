Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21070C61DBD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 05:28:15 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6039.1787722092983859320
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 22:28:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=eSOw+z3x;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=11375; q=dns/txt;
  s=iport01; t=1787722093; x=1788931693;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=unqXJRsNWC0KNj5S1LLDiMsX+J8lAog1VD4TfeD1HR0=;
  b=eSOw+z3xt3KnFcm8yq4Bz8BM6ihgz14eLbQuxdaBtEuKuCT80DzKvsIW
   Do5q46eChc398+3OqqOO8M6stOYC8eHubjoHLLVCZ+E2vxPC4TvksrIRS
   GJy+z7Iefq5YfJASlNybumA0KarP9zEVsRPnac5cQdA1SzYzDK+AOJJtB
   6LHJpnHcKVB64dAyeA0e2H8bPwYQMhmi5o+U/HzZShcWZkfLkZ6Naw0DT
   +2LPX3BKLL0o3cc/Yp0mNlG+en2I2h4zJFgUMupr1dqL8IWAn2ciIuDQS
   O7rtoxDDCkn0o1pnilHAKi2A9Pn/PcgVugCAtP+RqisFNZ/BW69rDrPM0
   w==;
X-CSE-ConnectionGUID: X60iMCMKQty/Mi2e4dW+cA==
X-CSE-MsgGUID: ldszFcEgRKusbNwK9WcItA==
X-IPAS-Result: =?us-ascii?q?A0BJAgBDeI5q/5UQJK1aHgEBCxIMggULgld0XkNJhFeRB?=
 =?us-ascii?q?2yLZ5I3FIFqDwEBAQ9EDQQBAYUFjW4CJjQJDgECBAMCAwEBAQEBAQEBAQEBC?=
 =?us-ascii?q?wEBBQEBAQIBBwWBDhOGTw2GWgECASYECwEYAS0sAwECAwImAiILIyGDAgGCO?=
 =?us-ascii?q?gM3AxG+Vnp/M4EBgygB2h8NglgBCxQBBYEFLoU/gn8gAYUCXRgBgkmCMycbG?=
 =?us-ascii?q?4FyhH6CH0ICAhiBLIN1gmoEgiI8UIFaHlCRGkiBAhwDWSwBVRMNCgsHBYFmA?=
 =?us-ascii?q?zUSKhVuMh2BIz4XNVgbBgWBHYEohBAjGTZ8gQlegSspYAESF4EJggcCglqCB?=
 =?us-ascii?q?QIBSUMOB0c+CxgNSBEsNxQZBD0BbgeOax+CSQGBDQEjCCAwgRtBEQ2Scy47j?=
 =?us-ascii?q?1uCIaAecQoog3aMIo8+hXwaM4VbpRGZCIs3glOECZIQN4RpgWg8gVlwFUgBg?=
 =?us-ascii?q?lkJShkPji0BFYNgMzeBAhZUgj3HJicyAgEIMgEBBwIHDgMLgWiRHmABAQ?=
IronPort-Data: A9a23:PKzQ7qpKepQysUknBBeSZJ4Q9ABeBmISZBIvgKrLsJaIsI4StFCzt
 garIBnSP/2DZTTyf95/aYzk8k0Hvsfdm9FgTAJqpXphECtD8uPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgLNNwJcaDpOtfrT8k035ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0tYpWWBr3
 tk7ESwcKTWC3e/qzI34QcA506zPLOGzVG8eknhkyTecCbMtRorOBvyQo9RZxzw3wMtJGJ4yZ
 eJANmEpN0qGOkMJYwtGYH49tL/Aan3XcyFYoVGcv4I84nPYy0p6172F3N/9KoXbFJ4FwhvHz
 o7A12D1GQM0P/GQ8xmY6XiKmcyeoijaRKtHQdVU8dYv2jV/3Fc7EhwdVVKhrb+hl1SyWt93L
 00S5zogqrU0+EW3T977GRqirxasuQYRXddVGeA25AyBj6HT+QuxAmkfUiUHb8QrssIzTzEm2
 lKF2dTzClRHqLCJRGjb876OrjSaIikYKGIEfmkPSg5t3jX4iIg3ihSKSpNoF7S4y4SvXzrx2
 DuN6iM5gt3/kPI26klyxnif6xrEm3QDZlVdCtn/No590j5EWQ==
IronPort-HdrOrdr: A9a23:m94ZgKqKE7fywf932wOZePgaV5oJeYIsimQD101hICG9vPb2qy
 nIpoV+6faUskd1ZJhOo7G90cW7LE80lqQFg7X5Q43DYOCOggLBR+tfBODZrQEIdReTygd179
 YGT0EHMqySMXFKyeDn/QK/D9EshPOD8KyumKPi6k0Fd3ANV0mlhD0Jcjpy1SZNNXB7OaY=
X-Talos-CUID: 9a23:buFPI2/LWTUzv3gL3LGVv35KQsEAWVj+9WvBZGq5U2s1RILWQnbFrQ==
X-Talos-MUID: 9a23:/PaLrgm+pwV1/NQxoMjAdnpmONx6za+DB3oujI4MndanZBN7Giu02WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,244,1779148800"; 
   d="scan'208";a="819938457"
Received: from alln-l-core-12.cisco.com ([173.36.16.149])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Aug 2026 05:28:12 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-12.cisco.com (Postfix) with ESMTPS id D77E418000146;
	Wed, 26 Aug 2026 05:28:11 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 6E620CCA79B; Tue, 25 Aug 2026 22:28:11 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Peter Marko <peter.marko@siemens.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][wrynose][PATCH] apr-util: upgrade 1.6.3 -> 1.6.5
Date: Tue, 25 Aug 2026 22:28:05 -0700
Message-Id: <20260826052805.3261254-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: alln-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 05:28:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244286

From: Peter Marko <peter.marko@siemens.com>

Removed included patches and refresh remaining one.

Release Notes: [1]

Changes with APR-util 1.6.5

  *) Fix oracle DBD compilation errors introduced in 1.6.4. PR 70170.

Changes with APR-util 1.6.4

  *) SECURITY: CVE-2026-34502: Heap buffer overflow in APR memcached
     client (cve.mitre.org)
     Heap-based Buffer Overflow vulnerability in Apache Portable
     Runtime Utility memcached client
     This issue affects Apache Portable Runtime Utility: from 1.3.0
     through 1.6.3.
     Credits: Elhanan Haenel

  *) SECURITY: CVE-2026-34501: Apache Portable Runtime Utility: Heap
     buffer overflow in APR redis client (cve.mitre.org)
     Heap-based Buffer Overflow vulnerability in Apache Portable
     Runtime Utility redis client.
     This issue affects Apache Portable Runtime Utility: from 1.6.0
     through 1.6.3.
     Users are recommended to upgrade to version 1.6.4, which fixes
     the issue.
     Credits: Elhanan Haenel

  *) SECURITY: CVE-2026-34191: Apache Portable Runtime Utility: SQL
     Injection in apr_dbd_oracle (cve.mitre.org)
     Improper Neutralization of Special Elements used in an SQL
     Command ('SQL Injection') vulnerability in Apache Portable
     Runtime Utility via apr_dbd_oracle provider.
     This issue affects Apache Portable Runtime Utility: from 1.6.0
     through 1.6.3.
     Users are recommended to upgrade to version 1.6.4, which fixes
     the issue.
     Credits: Elhanan Haenel

  *) SECURITY: CVE-2026-32327: Apache Portable Runtime Utility:
     apr-util XML stack recursion crash (cve.mitre.org)
     A bug in APR-util version 1.6.3 (and earlier) allows a stack
     recursion attack against any library consumer which parses XML
     from untrusted sources and uses the apr_xml_quote_elem()
     function.
     Users are recommended to upgrade to version 1.6.4, which fixes
     this issue.
     Credits: Younghyo Cho @ CISLab, SeoulTech

  *) SECURITY: CVE-2025-49506: apr_password_validate() vulnerable to
     timing attack (cve.mitre.org)
     APR-util versions 1.6.3 (and earlier) function
     apr_password_validate() was not constant-time with regards to
     hashes or passwords comparisons, potentially leaking their
     content via a side channel timing attack particularly on
     platforms without crypt() such as  Windows, BeOS, NetWare, or
     Android.
     Users are recommended to upgrade to version 1.6.4, which fixes
     this issue.
     Credits: Michael Rowley <michael csirt.global>

  *) apr_brigade: Don't split the final LF in apr_brigade_split_line() to
     avoid producing an empty bucket.  PR 64273
     [Barnim Dzwillo <dzwillo strato.de>, Joe Orton]

  *) apr_brigade: Metadata buckets are now ignored in
     apr_brigade_split_line, apr_brigade_flatten and
     apr_brigade_to_iovec, fixing possible undefined behaviour.  PR 68278
     [Ben Kallus <benjamin.p.kallus.gr dartmouth.edu>, Joe Orton]

  *) apr_crypto_openssl: Compatibility with OpenSSL 3.  [Yann Ylavic]

  *) apr_crypto_openssl: use OPENSSL_init_crypto() to initialise OpenSSL
     on versions 1.1+. [Graham Leggett]

  *) apr_memcache: Fix name lookup to allow IPv6 as well as IPv4.
     [Lubos Uhliarik <luhliari redhat.com>]

  *) configure: Fix Berkeley DB detection with compilers enforcing
     strict C99 compliance.  PR 66396.
     [Florian Weimer <fweimer redhat.com>]

[1] https://github.com/apache/apr-util/blob/1.6.5/CHANGES

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bb8e0e12c54c452ffb17ce600972edfa9455f459)
Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 ...le-function-prototype-warning-with-c.patch | 130 ------------------
 ...ion-Check-if-transform-is-supported-.patch |  37 -----
 .../apr/apr-util/configfix.patch              |   4 +-
 .../{apr-util_1.6.3.bb => apr-util_1.6.5.bb}  |   4 +-
 4 files changed, 3 insertions(+), 172 deletions(-)
 delete mode 100644 meta/recipes-support/apr/apr-util/0001-sdbm-Fix-old-style-function-prototype-warning-with-c.patch
 delete mode 100644 meta/recipes-support/apr/apr-util/0001-test_transformation-Check-if-transform-is-supported-.patch
 rename meta/recipes-support/apr/{apr-util_1.6.3.bb => apr-util_1.6.5.bb} (93%)

diff --git a/meta/recipes-support/apr/apr-util/0001-sdbm-Fix-old-style-function-prototype-warning-with-c.patch b/meta/recipes-support/apr/apr-util/0001-sdbm-Fix-old-style-function-prototype-warning-with-c.patch
deleted file mode 100644
index e523859927..0000000000
--- a/meta/recipes-support/apr/apr-util/0001-sdbm-Fix-old-style-function-prototype-warning-with-c.patch
+++ /dev/null
@@ -1,130 +0,0 @@
-From 05afaf207eaff4c175198abd129ed1acde220df3 Mon Sep 17 00:00:00 2001
-From: Yann Ylavic <ylavic@apache.org>
-Date: Thu, 14 Mar 2024 15:52:25 +0000
-Subject: [PATCH] sdbm: Fix old style function prototype warning with clang
-
-This fixes the following warning with clang
-
-../dbm/sdbm/sdbm_pair.c:63:1: warning: a function definition without a prototype is
-deprecated in all versions of C and is not supported in C2x [-Wdeprecated-non-prototype]
-   63 | fitpair(pag, need)
-      | ^
-
-Upstream-Status: Backport [https://github.com/apache/apr-util/commit/073368a46fbe92995927258ae2fc97d3920872f2]
-Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
-Submitted by: Biswapriyo Nath <nathbappai@gmail.com>
-Github: closes #47
-
-Merges r1912679 from ^/apr/apr/trunk
-
-git-svn-id: https://svn.apache.org/repos/asf/apr/apr-util/branches/1.7.x@1916307 13f79535-47bb-0310-9956-ffa450edef68
-Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
----
- dbm/sdbm/sdbm_pair.c | 39 +++++++++------------------------------
- 1 file changed, 9 insertions(+), 30 deletions(-)
-
-diff --git a/dbm/sdbm/sdbm_pair.c b/dbm/sdbm/sdbm_pair.c
-index 50d7965..6ecaff6 100644
---- a/dbm/sdbm/sdbm_pair.c
-+++ b/dbm/sdbm/sdbm_pair.c
-@@ -60,9 +60,7 @@ static int seepair(char *, int, char *, int);
-  */
- 
- int
--fitpair(pag, need)
--char *pag;
--int need;
-+fitpair(char *pag, int need)
- {
- 	register int n;
- 	register int off;
-@@ -79,10 +77,7 @@ int need;
- }
- 
- void
--putpair(pag, key, val)
--char *pag;
--apr_sdbm_datum_t key;
--apr_sdbm_datum_t val;
-+putpair(char *pag, apr_sdbm_datum_t key, apr_sdbm_datum_t val)
- {
- 	register int n;
- 	register int off;
-@@ -108,9 +103,7 @@ apr_sdbm_datum_t val;
- }
- 
- apr_sdbm_datum_t
--getpair(pag, key)
--char *pag;
--apr_sdbm_datum_t key;
-+getpair(char *pag, apr_sdbm_datum_t key)
- {
- 	register int i;
- 	register int n;
-@@ -129,18 +122,14 @@ apr_sdbm_datum_t key;
- }
- 
- int
--duppair(pag, key)
--char *pag;
--apr_sdbm_datum_t key;
-+duppair(char *pag, apr_sdbm_datum_t key)
- {
- 	register short *ino = (short *) pag;
- 	return ino[0] > 0 && seepair(pag, ino[0], key.dptr, key.dsize) > 0;
- }
- 
- apr_sdbm_datum_t
--getnkey(pag, num)
--char *pag;
--int num;
-+getnkey(char *pag, int num)
- {
- 	apr_sdbm_datum_t key;
- 	register int off;
-@@ -159,9 +148,7 @@ int num;
- }
- 
- int
--delpair(pag, key)
--char *pag;
--apr_sdbm_datum_t key;
-+delpair(char *pag, apr_sdbm_datum_t key)
- {
- 	register int n;
- 	register int i;
-@@ -231,11 +218,7 @@ apr_sdbm_datum_t key;
-  * return 0 if not found.
-  */
- static int
--seepair(pag, n, key, siz)
--char *pag;
--register int n;
--register char *key;
--register int siz;
-+seepair(char *pag, register int n, register char *key, register int siz)
- {
- 	register int i;
- 	register int off = PBLKSIZ;
-@@ -251,10 +234,7 @@ register int siz;
- }
- 
- void
--splpage(pag, new, sbit)
--char *pag;
--char *new;
--long sbit;
-+splpage(char *pag, char *new, long sbit)
- {
- 	apr_sdbm_datum_t key;
- 	apr_sdbm_datum_t val;
-@@ -295,8 +275,7 @@ long sbit;
-  * this could be made more rigorous.
-  */
- int
--chkpage(pag)
--char *pag;
-+chkpage(char *pag)
- {
- 	register int n;
- 	register int off;
diff --git a/meta/recipes-support/apr/apr-util/0001-test_transformation-Check-if-transform-is-supported-.patch b/meta/recipes-support/apr/apr-util/0001-test_transformation-Check-if-transform-is-supported-.patch
deleted file mode 100644
index 261b78736f..0000000000
--- a/meta/recipes-support/apr/apr-util/0001-test_transformation-Check-if-transform-is-supported-.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 3a97f58cfb40fc1911bbfd067e8457a472613d75 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 18 Apr 2023 22:58:00 -0700
-Subject: [PATCH] test_transformation: Check if transform is supported before
- using it
-
-This helps in excluding these tests on systems where these are not
-available e.g. musl
-
-Upstream-Status: Submitted [https://bz.apache.org/bugzilla/show_bug.cgi?id=66570]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- test/testxlate.c | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/test/testxlate.c b/test/testxlate.c
-index 6981eff..de00fa4 100644
---- a/test/testxlate.c
-+++ b/test/testxlate.c
-@@ -116,8 +116,12 @@ static void test_transformation(abts_case *tc, void *data)
-     }
- 
-     /* 4. Transformation using charset aliases */
--    one_test(tc, "UTF-8", "UTF-7", test_utf8, test_utf7, p);
--    one_test(tc, "UTF-7", "UTF-8", test_utf7, test_utf8, p);
-+    if (is_transform_supported(tc, "UTF-8", "UTF-7", p)) {
-+        one_test(tc, "UTF-8", "UTF-7", test_utf8, test_utf7, p);
-+    }
-+    if (is_transform_supported(tc, "UTF-7", "UTF-8", p)) {
-+        one_test(tc, "UTF-7", "UTF-8", test_utf7, test_utf8, p);
-+    }
- }
- 
- #endif /* APR_HAS_XLATE */
--- 
-2.40.0
-
diff --git a/meta/recipes-support/apr/apr-util/configfix.patch b/meta/recipes-support/apr/apr-util/configfix.patch
index dbb1148809..4cc0ad79ae 100644
--- a/meta/recipes-support/apr/apr-util/configfix.patch
+++ b/meta/recipes-support/apr/apr-util/configfix.patch
@@ -4,7 +4,7 @@ Index: apr-util-1.3.4/apu-config.in
 ===================================================================
 --- apr-util-1.3.4.orig/apu-config.in	2009-01-12 17:08:06.000000000 +0000
 +++ apr-util-1.3.4/apu-config.in	2009-01-12 17:09:00.000000000 +0000
-@@ -134,14 +134,7 @@
+@@ -139,14 +139,7 @@ while test $# -gt 0; do
      exit 0
      ;;
      --includes)
@@ -19,7 +19,7 @@ Index: apr-util-1.3.4/apu-config.in
      ;;
      --ldflags)
      flags="$flags $LDFLAGS"
-@@ -155,28 +148,10 @@
+@@ -160,28 +153,10 @@ while test $# -gt 0; do
      exit 0
      ;;
      --link-ld)
diff --git a/meta/recipes-support/apr/apr-util_1.6.3.bb b/meta/recipes-support/apr/apr-util_1.6.5.bb
similarity index 93%
rename from meta/recipes-support/apr/apr-util_1.6.3.bb
rename to meta/recipes-support/apr/apr-util_1.6.5.bb
index cb5465f872..ba1e3359ff 100644
--- a/meta/recipes-support/apr/apr-util_1.6.3.bb
+++ b/meta/recipes-support/apr/apr-util_1.6.5.bb
@@ -11,12 +11,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=158aa0b1efe0c12f23d4b007ddb9a5db \
 
 SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.gz \
            file://configfix.patch \
-	   file://0001-test_transformation-Check-if-transform-is-supported-.patch \
-	       file://0001-sdbm-Fix-old-style-function-prototype-warning-with-c.patch \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "2b74d8932703826862ca305b094eef2983c27b39d5c9414442e9976a9acf1983"
+SRC_URI[sha256sum] = "f43a1c8c79eef497a022ec6c99dddbdf57e42001da6ccbfae259631ed5aa2805"
 
 EXTRA_OECONF = "--with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \
 		--without-odbc \
-- 
2.35.6


