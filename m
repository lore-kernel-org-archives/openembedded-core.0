Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8751DC021A9
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 19:22:34 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.1985.1739820152690643814
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 11:22:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=G2qt/TyS;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20250217192228236d2d70e21d436c56-gzo4ej@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20250217192228236d2d70e21d436c56
        for <openembedded-core@lists.openembedded.org>;
        Mon, 17 Feb 2025 20:22:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=6f7Oq4AL2c3xcx/6ZBoJYrHBG0NJrU/XevznhW4y95c=;
 b=G2qt/TySUW6GRYeotIfhOQSkLDOByCaxx+liz1BZg1LCcKXHBMfvTn8iThoyGSyuioE1Bg
 FA78pg/icA/jPnYADzG23FxEc1VWb9b04RVXqcKgttA7oEimBgGLyATNYb8zFb2nPIUwiISU
 SzstRaewxrtsbfvnm+XCy11bCwbsPJmTxc3XLYG2w9t2B7Nt6Zoy+VgwHvIpDMtp2FtE4FOB
 IJapTP7xo7/sdkyn5RsRfdFUmqwkikZ7A01Ujxf38j69jLzhqk7TD2OQmvWAvQseC70mCN5v
 /Cebq4hAZyrKrIsd5OZ2o7rawPWaRx7xWVruqj0PUss87zDE3Lqhro3A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] gnutls: upgrade 3.8.8 -> 3.8.9
Date: Mon, 17 Feb 2025 20:21:41 +0100
Message-Id: <20250217192141.1383722-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Feb 2025 19:22:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211552

From: Peter Marko <peter.marko@siemens.com>

Solves CVE-2024-12243

Refreshed patches

License-Update: multiple changes
* https://gitlab.com/gnutls/gnutls/-/commit/a8727cdb076287d0a2098ba49d76899b4e70160e
  COPYING.LESSER updated wording to latest FSF version
* https://gitlab.com/gnutls/gnutls/-/commit/75f5ea80738156b81de30ae9b482a69cf4e77e9d
  LICENSE file merged to README.md
  COPYING and COPYING.LESSERv2 moved to top-level directory

Release notes: https://gitlab.com/gnutls/gnutls/-/blob/3.8.9/NEWS?ref_type=tags

* Version 3.8.9 (released 2025-02-07)

** libgnutls: leancrypto was added as an interim option for PQC
   The library can now be built with leancrypto instead of liboqs for
   post-quantum cryptography (PQC), when configured with
   --with-leancrypto option instead of --with-liboqs.

** libgnutls: Experimental support for ML-DSA signature algorithm
   The library and certtool now support ML-DSA signature algorithm as
   defined in FIPS 204 and based on
   draft-ietf-lamps-dilithium-certificates-04. This feature is
   currently marked as experimental and can only be enabled when
   compiled with --with-leancrypto or --with-liboqs.
   Contributed by David Dudas.

** libgnutls: Support for ML-KEM-1024 key encapsulation mechanism
   The support for ML-KEM post-quantum key encapsulation mechanisms
   has been extended to cover ML-KEM-1024, in addition to ML-KEM-768.
   MLKEM1024 is only offered as SecP384r1MLKEM1024 hybrid as per
   draft-kwiatkowski-tls-ecdhe-mlkem-03.

** libgnutls: Fix potential DoS in handling certificates with numerous name
   constraints, as a follow-up of CVE-2024-12133 in libtasn1. The
   bundled copy of libtasn1 has also been updated to the latest 4.20.0
   release to complete the fix.  Reported by Bing Shi (#1553).
   [GNUTLS-SA-2025-02-07, CVSS: medium] [CVE-2024-12243]

** API and ABI modifications:
GNUTLS_PK_MLDSA44: New enum member of gnutls_pk_algorithm_t
GNUTLS_PK_MLDSA65: New enum member of gnutls_pk_algorithm_t
GNUTLS_PK_MLDSA87: New enum member of gnutls_pk_algorithm_t
GNUTLS_SIGN_MLDSA44: New enum member of gnutls_sign_algorithm_t
GNUTLS_SIGN_MLDSA65: New enum member of gnutls_sign_algorithm_t
GNUTLS_SIGN_MLDSA87: New enum member of gnutls_sign_algorithm_t

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...g-.hmac-file-should-be-excuted-in-target-envi.patch |  2 +-
 .../gnutls/gnutls/Add-ptest-support.patch              | 10 +++++-----
 .../gnutls/{gnutls_3.8.8.bb => gnutls_3.8.9.bb}        |  8 ++++----
 3 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls_3.8.8.bb => gnutls_3.8.9.bb} (91%)

diff --git a/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch b/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch
index 59824d35f1..2dccea7859 100644
--- a/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch
+++ b/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch
@@ -14,7 +14,7 @@ diff --git a/lib/Makefile.am b/lib/Makefile.am
 index a50d311..193ea19 100644
 --- a/lib/Makefile.am
 +++ b/lib/Makefile.am
-@@ -198,8 +198,7 @@ hmac_file = .libs/.$(gnutls_so).hmac
+@@ -272,8 +272,7 @@ hmac_file = .libs/.$(gnutls_so).hmac
  
  all-local: $(hmac_file)
  
diff --git a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch b/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
index 8e4df7b37e..339d3d2f9e 100644
--- a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
+++ b/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
@@ -15,9 +15,9 @@ diff --git a/Makefile.am b/Makefile.am
 index 843193f..816b09f 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -191,6 +191,9 @@ dist-hook:
- 	mv ChangeLog $(distdir)
- 	touch -c $(distdir)/doc/*.html $(distdir)/doc/*.pdf $(distdir)/doc/*.info
+@@ -194,6 +194,9 @@ dist-hook:
+ distcheck-hook:
+ 	@test -d "$(top_srcdir)/po/.reference" || { echo "PO files are not downloaded; run ./bootstrap without --skip-po"; exit 1; }
  
 +install-ptest:
 +	 $(MAKE) -C tests DESTDIR=$(DESTDIR)/tests $@
@@ -29,7 +29,7 @@ diff --git a/configure.ac b/configure.ac
 index 1744813..efb9e34 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1226,6 +1226,8 @@ AC_SUBST(LIBGNUTLS_CFLAGS)
+@@ -1491,6 +1491,8 @@ AC_SUBST(LIBGNUTLS_CFLAGS)
  
  AM_CONDITIONAL(NEEDS_LIBRT, test "$gnutls_needs_librt" = "yes")
  
@@ -42,7 +42,7 @@ diff --git a/tests/Makefile.am b/tests/Makefile.am
 index 189d068..8430b05 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -668,6 +668,12 @@ SH_LOG_COMPILER = $(SHELL)
+@@ -678,6 +678,12 @@ SH_LOG_COMPILER = $(SHELL)
  AM_VALGRINDFLAGS = --suppressions=$(srcdir)/suppressions.valgrind
  LOG_COMPILER = $(LOG_VALGRIND)
  
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.8.bb b/meta/recipes-support/gnutls/gnutls_3.8.9.bb
similarity index 91%
rename from meta/recipes-support/gnutls/gnutls_3.8.8.bb
rename to meta/recipes-support/gnutls/gnutls_3.8.9.bb
index 26824554ab..f2b7ac7bb8 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.8.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.9.bb
@@ -10,9 +10,9 @@ LICENSE:${PN}-xx = "LGPL-2.1-or-later"
 LICENSE:${PN}-bin = "GPL-3.0-or-later"
 LICENSE:${PN}-openssl = "GPL-3.0-or-later"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=71391c8e0c1cfe68077e7fce3b586283 \
-                    file://doc/COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
-                    file://doc/COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c"
+LIC_FILES_CHKSUM = "file://README.md;beginline=181;endline=205;md5=e159ff2a6e9cc95141fb0eaff733bba3 \
+                    file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
+                    file://COPYING.LESSERv2;md5=4bf661c1e3793e55c8d1051bc5e0ae21"
 
 DEPENDS = "nettle gmp virtual/libiconv libunistring"
 
@@ -25,7 +25,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://Add-ptest-support.patch \
            "
 
-SRC_URI[sha256sum] = "ac4f020e583880b51380ed226e59033244bc536cad2623f2e26f5afa2939d8fb"
+SRC_URI[sha256sum] = "69e113d802d1670c4d5ac1b99040b1f2d5c7c05daec5003813c049b5184820ed"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc ptest
 

