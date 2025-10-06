Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B18A0CCA472
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 09:53:27 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.30459.1759744405840209864
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Oct 2025 02:53:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=g/OF63BP;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202510060949494fc333d55e00020753-l63e8l@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202510060949494fc333d55e00020753
        for <openembedded-core@lists.openembedded.org>;
        Mon, 06 Oct 2025 11:53:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=w48O191tWDSv4fYCh3JPcbbI9pz5eOAALSuij1LgulI=;
 b=g/OF63BPWGqnnPexC7JBmZOmB+b4pVvofM8VAiyTXljS107cMHWrxP4P/Wh7cDqFJyK8kG
 pldYjX7Dx2aPngtdlmJmbErBsc41CGNmxxud0MQO3Qi3t2nf8R0Xku3gB1eUSFkWCp6SwNe2
 n23ZPfU/l8aOBo43IW4I3sWPz749ZhWZ8tWS5tuNwOAvIAw/DlstK0WRVrCNYZBc99M57yfK
 MnIg1X7UBHkz3cVFrJK4K7Gl+2U+ei2JR0FSuj3527abTBow20oVOMpyXw+/TDl7B3VnSW9W
 5g/ikSblXY3VDGc0AB/zZlbOuVVLwTG+NQUlDY1PG50ID4bTxIlX9/nQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] openssl: upgrade 3.0.17 -> 3.0.18
Date: Mon,  6 Oct 2025 11:49:10 +0200
Message-Id: <20251006094910.10542-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 09:53:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224473

From: Peter Marko <peter.marko@siemens.com>

Release information:
https://github.com/openssl/openssl/blob/openssl-3.0/NEWS.md#major-changes-between-openssl-3017-and-openssl-3018-30-sep-2025

OpenSSL 3.0.18 is a security patch release. The most severe CVE fixed in this release is Moderate.
This release incorporates the following bug fixes and mitigations:
* Fix Out-of-bounds read & write in RFC 3211 KEK Unwrap. (CVE-2025-9230)
* Fix Out-of-bounds read in HTTP client no_proxy handling. (CVE-2025-9232)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../0001-Configure-do-not-tweak-mips-cflags.patch    |  2 +-
 ...-strip-sysroot-and-debug-prefix-map-from-co.patch |  2 +-
 .../openssl/openssl/CVE-2023-50781-2.patch           | 12 ++++++------
 .../openssl/openssl/CVE-2023-50781-4.patch           |  2 +-
 .../openssl/openssl/CVE-2023-50781-6.patch           |  2 +-
 .../openssl/openssl/CVE-2024-41996.patch             |  4 ++--
 .../recipes-connectivity/openssl/openssl/afalg.patch |  2 +-
 .../openssl/{openssl_3.0.17.bb => openssl_3.0.18.bb} |  2 +-
 8 files changed, 14 insertions(+), 14 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.0.17.bb => openssl_3.0.18.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch b/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
index af435472a5..c2470c2e29 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
@@ -17,7 +17,7 @@ Index: openssl-3.0.4/Configure
 ===================================================================
 --- openssl-3.0.4.orig/Configure
 +++ openssl-3.0.4/Configure
-@@ -1423,16 +1423,6 @@ if ($target =~ /^mingw/ && `$config{CC}
+@@ -1423,16 +1423,6 @@ if ($target =~ /^mingw/ && `$config{CC} --target-help 2>&1` =~ m/-mno-cygwin/m)
          push @{$config{shared_ldflag}}, "-mno-cygwin";
          }
  
diff --git a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
index bafdbaa46f..40e9bb9d30 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
@@ -38,7 +38,7 @@ Index: openssl-3.0.4/Configurations/unix-Makefile.tmpl
 ===================================================================
 --- openssl-3.0.4.orig/Configurations/unix-Makefile.tmpl
 +++ openssl-3.0.4/Configurations/unix-Makefile.tmpl
-@@ -472,13 +472,23 @@ BIN_LDFLAGS={- join(' ', $target{bin_lfl
+@@ -483,13 +483,23 @@ BIN_LDFLAGS={- join(' ', $target{bin_lflags} || (),
                           '$(CNF_LDFLAGS)', '$(LDFLAGS)') -}
  BIN_EX_LIBS=$(CNF_EX_LIBS) $(EX_LIBS)
  
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-2.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-2.patch
index b336d9e850..a401b5cec2 100644
--- a/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-2.patch
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-2.patch
@@ -288,7 +288,7 @@ index c8921acd6e..11a91e62b1 100644
  
      switch (RSA_test_flags(prsactx->rsa, RSA_FLAG_TYPE_MASK)) {
      case RSA_FLAG_TYPE_RSA:
-@@ -199,6 +202,7 @@ static int rsa_decrypt(void *vprsactx, unsigned char *out, size_t *outlen,
+@@ -204,6 +207,7 @@ static int rsa_decrypt(void *vprsactx, unsigned char *out, size_t *outlen,
  {
      PROV_RSA_CTX *prsactx = (PROV_RSA_CTX *)vprsactx;
      int ret;
@@ -296,7 +296,7 @@ index c8921acd6e..11a91e62b1 100644
      size_t len = RSA_size(prsactx->rsa);
  
      if (!ossl_prov_is_running())
-@@ -276,8 +280,12 @@ static int rsa_decrypt(void *vprsactx, unsigned char *out, size_t *outlen,
+@@ -281,8 +285,12 @@ static int rsa_decrypt(void *vprsactx, unsigned char *out, size_t *outlen,
          }
          OPENSSL_free(tbuf);
      } else {
@@ -311,7 +311,7 @@ index c8921acd6e..11a91e62b1 100644
      }
      *outlen = constant_time_select_s(constant_time_msb_s(ret), *outlen, ret);
      ret = constant_time_select_int(constant_time_msb(ret), 0, 1);
-@@ -401,6 +409,10 @@ static int rsa_get_ctx_params(void *vprsactx, OSSL_PARAM *params)
+@@ -406,6 +414,10 @@ static int rsa_get_ctx_params(void *vprsactx, OSSL_PARAM *params)
      if (p != NULL && !OSSL_PARAM_set_uint(p, prsactx->alt_version))
          return 0;
  
@@ -322,7 +322,7 @@ index c8921acd6e..11a91e62b1 100644
      return 1;
  }
  
-@@ -412,6 +424,7 @@ static const OSSL_PARAM known_gettable_ctx_params[] = {
+@@ -417,6 +429,7 @@ static const OSSL_PARAM known_gettable_ctx_params[] = {
                      NULL, 0),
      OSSL_PARAM_uint(OSSL_ASYM_CIPHER_PARAM_TLS_CLIENT_VERSION, NULL),
      OSSL_PARAM_uint(OSSL_ASYM_CIPHER_PARAM_TLS_NEGOTIATED_VERSION, NULL),
@@ -330,7 +330,7 @@ index c8921acd6e..11a91e62b1 100644
      OSSL_PARAM_END
  };
  
-@@ -549,6 +562,14 @@ static int rsa_set_ctx_params(void *vprsactx, const OSSL_PARAM params[])
+@@ -554,6 +567,14 @@ static int rsa_set_ctx_params(void *vprsactx, const OSSL_PARAM params[])
              return 0;
          prsactx->alt_version = alt_version;
      }
@@ -345,7 +345,7 @@ index c8921acd6e..11a91e62b1 100644
  
      return 1;
  }
-@@ -562,6 +583,7 @@ static const OSSL_PARAM known_settable_ctx_params[] = {
+@@ -567,6 +588,7 @@ static const OSSL_PARAM known_settable_ctx_params[] = {
      OSSL_PARAM_octet_string(OSSL_ASYM_CIPHER_PARAM_OAEP_LABEL, NULL, 0),
      OSSL_PARAM_uint(OSSL_ASYM_CIPHER_PARAM_TLS_CLIENT_VERSION, NULL),
      OSSL_PARAM_uint(OSSL_ASYM_CIPHER_PARAM_TLS_NEGOTIATED_VERSION, NULL),
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-4.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-4.patch
index c6dad3cbec..c7a4a7daf8 100644
--- a/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-4.patch
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-4.patch
@@ -21,7 +21,7 @@ diff --git a/test/recipes/30-test_evp_data/evppkey_rsa_common.txt b/test/recipes
 index 080c4d02af..1405465098 100644
 --- a/test/recipes/30-test_evp_data/evppkey_rsa_common.txt
 +++ b/test/recipes/30-test_evp_data/evppkey_rsa_common.txt
-@@ -277,6 +277,414 @@ Derive = RSA-2048
+@@ -278,6 +278,414 @@ Derive = RSA-2048
  Result = KEYOP_INIT_ERROR
  Reason = operation not supported for this keytype
  
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-6.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-6.patch
index 75e1df4bba..9104667b8b 100644
--- a/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-6.patch
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-6.patch
@@ -35,7 +35,7 @@ index 0ad654fc60..a3d01eec45 100644
  # The old FIPS provider doesn't include the workaround (#13817)
  FIPSversion = >3.0.0
  # Corrupted ciphertext
-@@ -261,6 +269,16 @@ Decrypt = RSA-2048
+@@ -260,6 +268,16 @@ Decrypt = RSA-2048
  Input = 550AF55A2904E7B9762352F8FB7FA235A9CB053AACB2D5FCB8CA48453CB2EE3619746C701ABF2D4CC67003471A187900B05AA812BD25ED05C675DFC8C97A24A7BF49BD6214992CAD766D05A9A2B57B74F26A737E0237B8B76C45F1F226A836D7CFBC75BA999BDBE48DBC09227AA46C88F21DCCBA7840141AD5A5D71FD122E6BD6AC3E564780DFE623FC1CA9B995A6037BF0BBD43B205A84AC5444F34202C05CE9113087176432476576DE6FFFF9A52EA57C08BE3EC2F49676CB8E12F762AC71FA3C321E00AC988910C85FF52F93825666CE0D40FFAA0592078919D4493F46D95CCF76364C6D57760DD0B64805F9AFC76A2365A5575CA301D5103F0EA76CB9A79
  Output = 4cbb988d6a46228379132b0b5f8c249b3860043848c93632fb982c807c7c82fffc7a9ef83f4908f890373ac181ffea6381e103bcaa27e65638b6ecebef38b59ed4226a9d12af675cfcb634d8c40e7a7aff
  
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2024-41996.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2024-41996.patch
index 49ec9c0130..5a91f55a12 100644
--- a/meta/recipes-connectivity/openssl/openssl/CVE-2024-41996.patch
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2024-41996.patch
@@ -32,7 +32,7 @@ index 795a3f2..3e7a811 100644
 @@ -387,9 +387,11 @@ static int dh_validate_public(const DH *dh, int checktype)
      if (pub_key == NULL)
          return 0;
-
+ 
 -    /* The partial test is only valid for named group's with q = (p - 1) / 2 */
 -    if (checktype == OSSL_KEYMGMT_VALIDATE_QUICK_CHECK
 -        && ossl_dh_is_named_safe_prime_group(dh))
@@ -42,7 +42,7 @@ index 795a3f2..3e7a811 100644
 +     */
 +    if (ossl_dh_is_named_safe_prime_group(dh))
          return ossl_dh_check_pub_key_partial(dh, pub_key, &res);
-
+ 
      return DH_check_pub_key_ex(dh, pub_key);
 --
 2.40.0
diff --git a/meta/recipes-connectivity/openssl/openssl/afalg.patch b/meta/recipes-connectivity/openssl/openssl/afalg.patch
index cf77e873a2..8a8bf80a5f 100644
--- a/meta/recipes-connectivity/openssl/openssl/afalg.patch
+++ b/meta/recipes-connectivity/openssl/openssl/afalg.patch
@@ -7,7 +7,7 @@ Index: openssl-3.0.4/Configure
 ===================================================================
 --- openssl-3.0.4.orig/Configure
 +++ openssl-3.0.4/Configure
-@@ -1681,20 +1681,7 @@ $config{CFLAGS} = [ map { $_ eq '--ossl-
+@@ -1679,20 +1679,7 @@ $config{CFLAGS} = [ map { $_ eq '--ossl-strict-warnings'
  unless ($disabled{afalgeng}) {
      $config{afalgeng}="";
      if (grep { $_ eq 'afalgeng' } @{$target{enable}}) {
diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.17.bb b/meta/recipes-connectivity/openssl/openssl_3.0.18.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.0.17.bb
rename to meta/recipes-connectivity/openssl/openssl_3.0.18.bb
index a50bd2edbf..a8dd338327 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.17.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.18.bb
@@ -25,7 +25,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "dfdd77e4ea1b57ff3a6dbde6b0bdc3f31db5ac99e7fdd4eaf9e1fbb6ec2db8ce"
+SRC_URI[sha256sum] = "d80c34f5cf902dccf1f1b5df5ebb86d0392e37049e5d73df1b3abae72e4ffe8b"
 
 inherit lib_package multilib_header multilib_script ptest perlnative
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"

