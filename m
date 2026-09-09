Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC764C79FB5
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 07:30:01 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6314.1788938998867069874
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 00:29:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qZCVMFxC;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4859245e493so2969471f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 00:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788938997; x=1789543797; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vLm0orLkmNPhqEXzNv0DIpYCo7/Uo7ZArtKONlPXf9Q=;
        b=qZCVMFxCIlIOluKfFeeuTZWTqTgChbr/rFGhgvgslxMhclIFxu+268GEACeS3SIDue
         zqmFYLSSu87zPRuuM14CEiWzoO0HQdxytjAWq0fg2Y8CivWbJNji5iQUwbzF4rt7vT13
         iyaW0HGkLwu4gcZHuOjmJEGtovPZIlmkxVe1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788938997; x=1789543797;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vLm0orLkmNPhqEXzNv0DIpYCo7/Uo7ZArtKONlPXf9Q=;
        b=AJhTkkRw2z5bu8NcpwF3twZh8cr2IfZexmRFezF44gg2zL2acLeVJHkrOXH1soL6LQ
         zymV5C/7KzmWKrFm12mFDiS3oRxEP9OczOnV1aL+Vic5sghu3wMveeBU1+qFbIDrXDYc
         4asVK4uNH2eLR4vi7F+i50ILNATgRnS0niXujZ2h3bDLhTR22QyGa6K4wBEh3VsO8xXz
         Y9Yu8dKYrjLV1ueshpGUzXckNcfBqj3PZFLZdZBPFA+poUSTJKF2DCAzRlgSxl7pDwkI
         WgXsARXvyvpH+UY3B7F0DHLGxE/Qutgh5uFvjnbQJFHkHdVDXqycJcxnmfWfK1p1E8Pv
         cXdA==
X-Gm-Message-State: AFuF++m8e1clISjmowzs+OUGW4wfN/2cKFEp3XVs1JLe6hCiRgKA4em1
	w4tDF3Qp7NOeLIrsTW5StsWXBVHcZOWXbMDp0XwYwZ4Z0wNRIEVfK4NHmD90O8kTSPx1QiWAApZ
	hbS0Gmls=
X-Gm-Gg: AYBFou3f2lbt3F1MprQzRzdysriyt0RFjtfzwJtVRdpqaTKbw7n5ycNrx7890K57hm7
	SByO7I/J2EG0Ig4e0Ux1obo+MBnaOoHrAkvfw4N3Af4b3Q3OsLUK3a/jflBiC/1fgj9sOCka7/F
	Qr6OlOdqN+b043h5rATZ/0z80TQ5nrHwH6U3M8UJDuBKO8kahuGsjkz7K15qiHV9znmIV0EVLPy
	ZkxcKf9VGdk/UOtB116W+twBKUhp/c794QVxClv41Wl3avfRnWJ+glF5BckDaC3ll1kr+3DsRc4
	n3BpVTz6ytUys0FLDR3PyKe+tceFz6XJ+2b+mQXxD56OqPdVTwmw/ofbcz90trNRpk1pLlIhRFd
	ksdcY7MXs2+RtL6HL/fUaHopunR4r7tpJxJrTLoJZuKLH1jftDHl2F2fceDlC4Oqe0SWI5KuRyE
	hNec6sReQ6EF08lDuApfUCIJ+tZUGAVUsigqUbOgZwvtazW0hBgggE12i3bUu2RyM1sxGbU4Dz0
	gTEH1RKAfUT0jt6C0gmDnUjTfLg+nsgWTNXgMpNaMpZvwBV2gl/jcpkO2yi4SF/KqvKLz5bus0=
X-Received: by 2002:a5d:5f09:0:b0:485:8a47:5b81 with SMTP id ffacd0b85a97d-4858a475c55mr28865116f8f.30.1788938996550;
        Wed, 09 Sep 2026 00:29:56 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm40624310f8f.16.2026.09.09.00.29.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:29:56 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 07/38] apr-util: upgrade 1.6.3 -> 1.6.5
Date: Wed,  9 Sep 2026 09:29:06 +0200
Message-ID: <112245f1bbf764ef856bcdf7420e4d72ab95ba1c.1788938909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788938908.git.yoann.congal@smile.fr>
References: <cover.1788938908.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 07:30:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245416

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
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
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
index e523859927a..00000000000
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
index 261b78736f6..00000000000
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
index dbb1148809b..4cc0ad79ae0 100644
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
index cb5465f8729..ba1e3359ff5 100644
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

