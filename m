Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3902E67A79
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 06:56:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12733.1772521009033476814
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 22:56:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=UI3qJiDg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75229269e5=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6234fXBj3843119
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Mar 2026 22:56:48 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=SXSLnbycvhieuOKQ4ZC+r8RX4roJsvfgePAEWBpglJA=; b=UI3qJiDgdXyY
	XPKpH1FIkWe/pBJkFEfxEWDzLbk6nphNiGe6FC388ml8Ni++LWQEqkOdPVMnzZse
	v9UXLJW711D/SkLGdsBOdDJx3QoQ9Hhn/X+Hgd1/3x48XZ8yr+a1WzmrwVeGEqEN
	KYsDrFV1+OUa5lY+aWQl1hzChdxgoPbJyA8Ua0VkIcgITnH6je40cm6rJMptPiMy
	loYBMlFiCllzFBOn0dGCz3IZCwcREyD1hFvMi7xeAzq6fZTbeA5FRYOAYpEeC9mg
	QQTKE17BfseglUhcc/1hxD+nGJJxnd3RtKHJwI9R08TnIuViPm4LJV2eSg3lNd7c
	CYVOz2G8/Q==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckvh430b4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 22:56:48 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 2 Mar 2026 22:56:48 -0800
Received: from pek-lpg-core5.wrs.com (128.224.153.45) by
 ala-exchng01.corp.ad.wrs.com (10.11.232.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 2 Mar 2026 22:56:47 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 07/19] openssl: upgrade 3.5.5 -> 3.6.1
Date: Tue, 3 Mar 2026 14:56:28 +0800
Message-ID: <20260303065640.2541884-7-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260303065640.2541884-1-hongxu.jia@windriver.com>
References: <20260303065640.2541884-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: NeBCpre6qYRRr3Vb6VfU8b5z4zf-nfnW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA0NyBTYWx0ZWRfX/THF40Js/11t
 OUoB/qyxkAlQh4FfgjcaAnFc2Oc45E9Il98dS7G4DCtvRhq0YsfPA1cV4UHNeWm0jdpD4K4I1pR
 UNcZ0OsGKSfDM0qH9Bz4NTE15anHVIFsjB/Zq7484mLDykzW/gGukf0qgWYAOVlgVYxziiyXnYn
 /V2AI7VcKkaRry+XxJqijsMceGD5bSrFhIheoda8QA4WUBBOo3SI2itHnatfeZtEDwz0vaZLV6g
 WvbZRN/KnoDIVLfW8v2Qi/i9VTai9zjtrK5lE2YEnwDtY8ZRaiebAUCAFKo2MaAEfbFMMjP4rtw
 Q5CzRY1877rC9HoQk0q8e68DUyn4aAqdGjaE4gFQImGwRLVhxT9jMzeJynvd0cX5jPWUK+K5JbF
 9qfCuhf+C5+EkQ4CHBsM9aguCtx95wuyziEcJxb+zRpKN7LsKh9OBm7ZESwhWIPBoNbhjAUT+9Y
 OTC7WUo1VwIy/UKeZHA==
X-Proofpoint-GUID: NeBCpre6qYRRr3Vb6VfU8b5z4zf-nfnW
X-Authority-Analysis: v=2.4 cv=Z/3h3XRA c=1 sm=1 tr=0 ts=69a68630 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=FOZC9FOpAAAA:20 a=t7CeM3EgAAAA:8 a=k-42gJp3AAAA:8
 a=ilKATfAMAAAA:8 a=pGLkceISAAAA:8 a=mnQmNr8GAAAA:8 a=NgrZLRFE4FQsaHnYCSkA:9
 a=uCHaoWw3D5WkjwlE:21 a=FdTzh2GWekK77mhwV6Dw:22 a=uCSXFHLys93vLW5PjgO_:22
 a=73awMTU50e6eLoBjGbzZ:22 a=kJ1edbOCtaRpYhyEJ7sn:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030047
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 06:56:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232244

Release note [1]:

OpenSSL 3.6.1 is a security patch release. The most severe CVE fixed in this
release is High.

This release incorporates the following bug fixes and mitigations:

    Fixed Improper validation of PBMAC1 parameters in PKCS#12 MAC verification.
    (CVE-2025-11187)

    Fixed Stack buffer overflow in CMS AuthEnvelopedData parsing.
    (CVE-2025-15467)

    Fixed NULL dereference in SSL_CIPHER_find() function on unknown cipher ID.
    (CVE-2025-15468)

    Fixed openssl dgst one-shot codepath silently truncates inputs >16 MiB.
    (CVE-2025-15469)

    Fixed TLS 1.3 CompressedCertificate excessive memory allocation.
    (CVE-2025-66199)

    Fixed Heap out-of-bounds write in BIO_f_linebuffer on short writes.
    (CVE-2025-68160)

    Fixed Unauthenticated/unencrypted trailing bytes with low-level OCB
    function calls.
    (CVE-2025-69418)

    Fixed Out of bounds write in PKCS12_get_friendlyname() UTF-8 conversion.
    (CVE-2025-69419)

    Fixed Missing ASN1_TYPE validation in TS_RESP_verify_response()
    function.
    (CVE-2025-69420)

    Fixed NULL Pointer Dereference in PKCS12_item_decrypt_d2i_ex() function.
    (CVE-2025-69421)

    Fixed Missing ASN1_TYPE validation in PKCS#12 parsing.
    (CVE-2026-22795)

    Fixed ASN1_TYPE Type Confusion in the PKCS7_digest_from_attributes()
    function.
    (CVE-2026-22796)

    Fixed a regression in X509_V_FLAG_CRL_CHECK_ALL flag handling by
    restoring its pre-3.6.0 behaviour.

    Fixed a regression in handling stapled OCSP responses causing handshake
    failures for OpenSSL 3.6.0 servers with various client implementations.

[1] https://github.com/openssl/openssl/releases/tag/openssl-3.6.1

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...ke-history-reporting-when-test-fails.patch | 25 ++++++++-----------
 ...1-Configure-do-not-tweak-mips-cflags.patch |  6 ++---
 ...sysroot-and-debug-prefix-map-from-co.patch |  7 +++---
 .../0001-extend-check_cwm-test-timeout.patch  |  4 +--
 .../{openssl_3.5.5.bb => openssl_3.6.1.bb}    |  2 +-
 5 files changed, 20 insertions(+), 24 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.5.5.bb => openssl_3.6.1.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch b/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch
index a74c79303f..5104a3cc00 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-Added-handshake-history-reporting-when-test-fails.patch
@@ -1,4 +1,4 @@
-From 5ba65051fea0513db0d997f0ab7cafb9826ed74a Mon Sep 17 00:00:00 2001
+From cda360c014be3c6bfbec23045ae0cb784908cf59 Mon Sep 17 00:00:00 2001
 From: William Lyu <William.Lyu@windriver.com>
 Date: Fri, 20 Oct 2023 16:22:37 -0400
 Subject: [PATCH] Added handshake history reporting when test fails
@@ -13,10 +13,10 @@ Signed-off-by: William Lyu <William.Lyu@windriver.com>
  3 files changed, 217 insertions(+), 33 deletions(-)
 
 diff --git a/test/helpers/handshake.c b/test/helpers/handshake.c
-index f611b3a..5703b48 100644
+index 5e56060..f9bb035 100644
 --- a/test/helpers/handshake.c
 +++ b/test/helpers/handshake.c
-@@ -25,6 +25,102 @@
+@@ -26,6 +26,102 @@
  #include <netinet/sctp.h>
  #endif
  
@@ -119,7 +119,7 @@ index f611b3a..5703b48 100644
  HANDSHAKE_RESULT *HANDSHAKE_RESULT_new(void)
  {
      HANDSHAKE_RESULT *ret;
-@@ -724,15 +820,6 @@ static void configure_handshake_ssl(SSL *server, SSL *client,
+@@ -828,15 +924,6 @@ static void configure_handshake_ssl(SSL *server, SSL *client,
          SSL_set_post_handshake_auth(client, 1);
  }
  
@@ -135,7 +135,7 @@ index f611b3a..5703b48 100644
  /* An SSL object and associated read-write buffers. */
  typedef struct peer_st {
      SSL *ssl;
-@@ -1077,16 +1164,6 @@ static void do_shutdown_step(PEER *peer)
+@@ -1181,16 +1268,6 @@ static void do_shutdown_step(PEER *peer)
      }
  }
  
@@ -152,7 +152,7 @@ index f611b3a..5703b48 100644
  static int renegotiate_op(const SSL_TEST_CTX *test_ctx)
  {
      switch (test_ctx->handshake_mode) {
-@@ -1164,19 +1241,6 @@ static void do_connect_step(const SSL_TEST_CTX *test_ctx, PEER *peer,
+@@ -1268,19 +1345,6 @@ static void do_connect_step(const SSL_TEST_CTX *test_ctx, PEER *peer,
      }
  }
  
@@ -172,7 +172,7 @@ index f611b3a..5703b48 100644
  /*
   * Determine the handshake outcome.
   * last_status: the status of the peer to have acted last.
-@@ -1541,6 +1605,10 @@ static HANDSHAKE_RESULT *do_handshake_internal(
+@@ -1645,6 +1709,10 @@ static HANDSHAKE_RESULT *do_handshake_internal(
  
      start = time(NULL);
  
@@ -183,7 +183,7 @@ index f611b3a..5703b48 100644
      /*
       * Half-duplex handshake loop.
       * Client and server speak to each other synchronously in the same process.
-@@ -1562,6 +1630,10 @@ static HANDSHAKE_RESULT *do_handshake_internal(
+@@ -1666,6 +1734,10 @@ static HANDSHAKE_RESULT *do_handshake_internal(
                  0 /* server went last */);
          }
  
@@ -195,7 +195,7 @@ index f611b3a..5703b48 100644
          case HANDSHAKE_SUCCESS:
              client_turn_count = 0;
 diff --git a/test/helpers/handshake.h b/test/helpers/handshake.h
-index 78b03f9..b9967c2 100644
+index 7cf654f..b4459d7 100644
 --- a/test/helpers/handshake.h
 +++ b/test/helpers/handshake.h
 @@ -1,5 +1,5 @@
@@ -300,7 +300,7 @@ index 78b03f9..b9967c2 100644
 +
  #endif /* OSSL_TEST_HANDSHAKE_HELPER_H */
 diff --git a/test/ssl_test.c b/test/ssl_test.c
-index ea60851..9d6b093 100644
+index 27b4415..64a13c0 100644
 --- a/test/ssl_test.c
 +++ b/test/ssl_test.c
 @@ -26,6 +26,44 @@ static OSSL_LIB_CTX *libctx = NULL;
@@ -360,7 +360,4 @@ index ea60851..9d6b093 100644
 +
      return ret;
  }
-
---
-2.25.1
-
+ 
diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch b/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
index cf5ff356ee..d1526cb69a 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
@@ -1,4 +1,4 @@
-From 0377f0d5b5c1079e3b9a80881f4dcc891cbe9f9a Mon Sep 17 00:00:00 2001
+From 8db9b88edbfbf40d56f330110efdc5cade6f183e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Tue, 30 May 2023 09:11:27 -0700
 Subject: [PATCH] Configure: do not tweak mips cflags
@@ -17,10 +17,10 @@ Signed-off-by: Tim Orling <tim.orling@konsulko.com>
  1 file changed, 10 deletions(-)
 
 diff --git a/Configure b/Configure
-index fff97bd..5ee54c1 100755
+index 6cc03bf..2bcb075 100755
 --- a/Configure
 +++ b/Configure
-@@ -1552,16 +1552,6 @@ if ($target =~ /^mingw/ && `$config{CC} --target-help 2>&1` =~ m/-mno-cygwin/m)
+@@ -1573,16 +1573,6 @@ if ($target =~ /^mingw/ && `$config{CC} --target-help 2>&1` =~ m/-mno-cygwin/m)
          push @{$config{shared_ldflag}}, "-mno-cygwin";
          }
  
diff --git a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
index dadc034c91..f70b14ab84 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
@@ -1,4 +1,4 @@
-From 5985253f2c9025d7c127443a3a9938946f80c2a1 Mon Sep 17 00:00:00 2001
+From 31f71d1f2def3def2b44ec905cc9bcc7d8d2b454 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
 Date: Tue, 6 Nov 2018 14:50:47 +0100
 Subject: [PATCH] buildinfo: strip sysroot and debug-prefix-map from compiler
@@ -28,14 +28,13 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
 Update to fix buildpaths qa issue for '-ffile-prefix-map'.
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  Configurations/unix-Makefile.tmpl | 16 +++++++++++++++-
  crypto/build.info                 |  2 +-
  2 files changed, 16 insertions(+), 2 deletions(-)
 
 diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Makefile.tmpl
-index 09303c4..011bda1 100644
+index 71b069e..ad82899 100644
 --- a/Configurations/unix-Makefile.tmpl
 +++ b/Configurations/unix-Makefile.tmpl
 @@ -513,13 +513,27 @@ BIN_LDFLAGS={- join(' ', $target{bin_lflags} || (),
@@ -68,7 +67,7 @@ index 09303c4..011bda1 100644
  
  # For x86 assembler: Set PROCESSOR to 386 if you want to support
 diff --git a/crypto/build.info b/crypto/build.info
-index aee5c46..95c9577 100644
+index 872684c..96d37c6 100644
 --- a/crypto/build.info
 +++ b/crypto/build.info
 @@ -115,7 +115,7 @@ DEFINE[../libcrypto]=$UPLINKDEF
diff --git a/meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-test-timeout.patch b/meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-test-timeout.patch
index f6eb28069a..6bf768cf94 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-test-timeout.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-extend-check_cwm-test-timeout.patch
@@ -1,4 +1,4 @@
-From c7000672296f4c367341aa3415f26c4d9f5e4749 Mon Sep 17 00:00:00 2001
+From 1f2bfacaefde4fbf6020946333df45cdd84bfac8 Mon Sep 17 00:00:00 2001
 From: Gyorgy Sarvari <skandigraun@gmail.com>
 Date: Thu, 23 Oct 2025 11:24:36 +0200
 Subject: [PATCH] extend check_cwm test timeout
@@ -15,7 +15,7 @@ Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/test/radix/main.c b/test/radix/main.c
-index 4a1e886a71..39f8c61ef9 100644
+index 0f3dc11..d925639 100644
 --- a/test/radix/main.c
 +++ b/test/radix/main.c
 @@ -25,6 +25,11 @@ static int test_script(int idx)
diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.5.bb b/meta/recipes-connectivity/openssl/openssl_3.6.1.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.5.5.bb
rename to meta/recipes-connectivity/openssl/openssl_3.6.1.bb
index 7799647415..849bfe0874 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.5.5.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.6.1.bb
@@ -19,7 +19,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "b28c91532a8b65a1f983b4c28b7488174e4a01008e29ce8e69bd789f28bc2a89"
+SRC_URI[sha256sum] = "b1bfedcd5b289ff22aee87c9d600f515767ebf45f77168cb6d64f231f518a82e"
 
 inherit lib_package multilib_header multilib_script ptest perlnative manpages
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.34.1


