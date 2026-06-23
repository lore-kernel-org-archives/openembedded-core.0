Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 756FFCDE002
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 13:14:47 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20452.1782220478937373428
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 06:14:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=xZDbtygI;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49241a577d8so29160165e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 06:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782220477; x=1782825277; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c5JGxmSM7GHnAgKiYWOOIKowHux69fx9+s0sP1H2H2Q=;
        b=xZDbtygINpqekoOxfX+mkGCb1asIzvCU6c+PRDpirWkUY/lBbOPdwT4xYMoSwQOMQz
         TKvetd891zZCuMilrW7/PU/5+yme0v/pFXFJlFdJzebcrjlJCANLIDJbZCttVscOeXkZ
         p7pPXGM7spxERK84uwdSd9urMUqMyp7eIAVfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782220477; x=1782825277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c5JGxmSM7GHnAgKiYWOOIKowHux69fx9+s0sP1H2H2Q=;
        b=eKxyAJUq9KWDGxWkwQdHVVHuTyOWXGcPFMuh9U0hTP1XxUCZd/Y3knznJktkdv4+Nl
         mNpvaOISOULQicg8dRFnOxo/SoCDlP5NCO1SisFvPuSzQjWhpaint2umeaN8wg5Tzcq6
         6cOdkV/0Zx4ka4WOXRico8+aSjEuj6UOODFbm9Xwed2eP6Ms5Iy6KEssZLkk4hi9IF6d
         ITOcx/Cr4/1VwrJwwwhZkIJfrDVw9kX6rU1F434KLxOljcXf2o01lEgSOWCITBpqvK5+
         FtXR16EtiO2z+sbMBSzuvQ3WztTFsbXJXzLQ0al7m/KMctfENcS7UZnDlivfW8v7fNvE
         euyg==
X-Gm-Message-State: AOJu0YzXKunSTfTnGyrbO08DZt1a8wjTFsnXYALS6PeeCgnuidvFRtxs
	iXaI4dda3rgou5AfGX7jtLKOcij24DtynBLBzQEDNOuixCtjcuLU5UJ5ij2X3VWFEbvnAW6gl5P
	U3ET7
X-Gm-Gg: AfdE7clg6+lDA07l6a9uMpf/lw0svxBGBYgIAHYkNSCBH2kLbIp3KnaFh7sMUrmHkFX
	xqbB7O3L6h2OYyeAuBA+PUqrr0peuFgxcSqnWCEWgl+cKat1k6Hth/swhWZjTW5iq9YV/49cDiz
	lBo1rGi3Qgm2GEOVHUq5JLIAxVHkv65NBNY6e8nAQPOBlzi+bHW9vKyFRF8Q4u+GlScEbmEDF3E
	azk/DpdyPWvQC+hec8X7uuHmJNzwgiuJZyV8OoGp5sXlHNz9AyRzegqqdvxGoUVa5LI4QOeTeVF
	3LhjvTrOfgrLakZy9vRSDF9anqO32ZVH4kMg5SjccsFnkAFeqgqnFiuGivY+VoHPw5ppQCuxYJg
	1O0bVBK9WkyD6Cg0P8wFKc0QC1hHxBPRadfNTvNpK8AS2BiGCUxCW/VaJuYVQq4lv6w/NMN1qSd
	b4hCU5IfKv9M0qYpx5+YlovdAuhXnt02sujKDrOWVKt4EACwL/Dqwz6qJ9ZR0F7PqzcHg5cn67N
	FnQp68rvbfEeyESSg==
X-Received: by 2002:a05:600c:3e06:b0:492:4fc6:75e with SMTP id 5b1f17b1804b1-4924fc613bamr197535825e9.0.1782220476995;
        Tue, 23 Jun 2026 06:14:36 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa008234f3c115adbb1a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:8234:f3c1:15ad:bb1a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4925d013a69sm24334285e9.3.2026.06.23.06.14.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 06:14:36 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 15/26] openssl: upgrade 3.5.6 -> 3.5.7
Date: Tue, 23 Jun 2026 15:13:56 +0200
Message-ID: <ed3353c07f6a8a6e55d244c0039e37fb62c81712.1782220259.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782220259.git.yoann.congal@smile.fr>
References: <cover.1782220259.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 13:14:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239381

From: Peter Marko <peter.marko@siemens.com>

Release information [1]:

OpenSSL 3.5.7 is a security patch release. The most severe CVE fixed in this release is High.
This release incorporates the following bug fixes and mitigations:
* Fixed heap use-after-free in PKCS7_verify(). (CVE-2026-45447)
* Fixed CMS AuthEnvelopedData processing may accept forged messages. (CVE-2026-34182)
* Fixed unbounded memory growth in the QUIC PATH_CHALLENGE handler. (CVE-2026-34183)
* Fixed NULL pointer dereference in QUIC server initial packet handling. (CVE-2026-42764)
* Fixed AES-OCB IV ignored on EVP_Cipher() path. (CVE-2026-45445)
* Fixed possible heap buffer overflow in ASN.1 multibyte string conversion. (CVE-2026-7383)
* Fixed out-of-bounds read in CMS password-based decryption. (CVE-2026-9076)
* Fixed heap buffer over-read in ASN.1 content parsing. (CVE-2026-34180)
* Fixed PKCS#12 files with PBMAC1 are accepted with short HMAC keys. (CVE-2026-34181)
* Fixed possible NULL dereference in password-dased CMS decryption. (CVE-2026-42766)
* Fixed NULL pointer dereference in CRMF EncryptedValue decryption. (CVE-2026-42767)
* Fixed multi-RecipientInfo Bleichenbacher Oracle in CMS_decrypt() and PKCS7_decrypt(). (CVE-2026-42768)
* Fixed trust anchor substitution via cert/issuer typo in CMP rootCaKeyUpdate. (CVE-2026-42769)
* Fixed FFC-DH peer validation uses attacker-supplied q. (CVE-2026-42770)
* Fixed incorrect tag processing for empty messages in AES-GCM-SIV and AES-SIV modes. (CVE-2026-45446)

Refreshed patches.
Installed new test files to pass ptests.

[1] https://github.com/openssl/openssl/blob/openssl-3.5/NEWS.md#major-changes-between-openssl-356-and-openssl-357-9-jun-2026

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 9365ac47f994a7d6be92b8c011c51ecf48e8ef87)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../openssl/0001-Configure-do-not-tweak-mips-cflags.patch     | 2 +-
 .../openssl/{openssl_3.5.6.bb => openssl_3.5.7.bb}            | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.5.6.bb => openssl_3.5.7.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch b/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
index cf5ff356ee7..cd8906df675 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
@@ -20,7 +20,7 @@ diff --git a/Configure b/Configure
 index fff97bd..5ee54c1 100755
 --- a/Configure
 +++ b/Configure
-@@ -1552,16 +1552,6 @@ if ($target =~ /^mingw/ && `$config{CC} --target-help 2>&1` =~ m/-mno-cygwin/m)
+@@ -1557,16 +1557,6 @@ if ($target =~ /^mingw/ && `$config{CC} --target-help 2>&1` =~ m/-mno-cygwin/m)
          push @{$config{shared_ldflag}}, "-mno-cygwin";
          }
  
diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.6.bb b/meta/recipes-connectivity/openssl/openssl_3.5.7.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_3.5.6.bb
rename to meta/recipes-connectivity/openssl/openssl_3.5.7.bb
index 3bf78eff5c2..0b8e8afec81 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.5.6.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.5.7.bb
@@ -19,7 +19,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "deae7c80cba99c4b4f940ecadb3c3338b13cb77418409238e57d7f31f2a3b736"
+SRC_URI[sha256sum] = "a8c0d28a529ca480f9f36cf5792e2cd21984552a3c8e4aa11a24aa31aeac98e8"
 
 inherit lib_package multilib_header multilib_script ptest perlnative manpages
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
@@ -215,7 +215,7 @@ do_install_ptest() {
 	ln -s ${bindir}/openssl ${D}${PTEST_PATH}/apps
 
 	cd ${S}
-	find test/certs test/ct test/d2i-tests test/recipes test/ocsp-tests test/ssl-tests test/smime-certs -type f -exec install -m644 -D {} ${D}${PTEST_PATH}/{} \;
+	find test/certs test/ct test/d2i-tests test/recipes test/ocsp-tests test/ssl-tests test/smime-certs test/smime-eml -type f -exec install -m644 -D {} ${D}${PTEST_PATH}/{} \;
 	find apps test -name \*.cnf -exec install -m644 -D {} ${D}${PTEST_PATH}/{} \;
 	find apps test -name \*.der -exec install -m644 -D {} ${D}${PTEST_PATH}/{} \;
 	find apps test -name \*.pem -exec install -m644 -D {} ${D}${PTEST_PATH}/{} \;

