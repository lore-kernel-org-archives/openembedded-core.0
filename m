Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3C71CDB47F
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 22:27:14 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32861.1782253627741539817
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 15:27:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2lxdJSj8;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso2570465e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 15:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782253626; x=1782858426; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c5JGxmSM7GHnAgKiYWOOIKowHux69fx9+s0sP1H2H2Q=;
        b=2lxdJSj8G/YX7dl/zgpzR95VVuxqhV0s1IH/lZQlitUpwLGrrB/O6yhrSQEGItYPGl
         CvV2t7d/F8oZac52FEOVNCWUboRIS8y9zk/yEh/9lWGiMFwbtqp5lSAo8GOYUTGN/wu9
         +3xrgZQaz+RVImHamw4vFALVm1IxY4GnXY+h0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782253626; x=1782858426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c5JGxmSM7GHnAgKiYWOOIKowHux69fx9+s0sP1H2H2Q=;
        b=i9Hge3wz5z8gH9oM5UrJtHynY14T/gjuNCU20t9q30/P850Yfj4DxnoVeEzyO1OE6f
         kDoP3uujbn15fWeMnw7aXSKCk/8t8DCXWJFMkSW0n90AQk4Vca7UgS2sLaRlxnjM0XTe
         OD2Yu+sTnwARwa75luWr8GA5lEDJpxrcQpuhv1ZMFFaS8tbxvaSVzvsJZ/DA+bs+k6yK
         ak+W45m83Dh/m4x9v+eEGwi4ICQkAdCZM2oqhgVvlnlb9SG00kUpys9CtMEpLuVsUb98
         n5QFS9tCiph4U+gQzMWF8MIGGtKbCPWq05qV9ymRWWWBMD7068lzd+h/3giVQ8ErawE5
         3r4Q==
X-Gm-Message-State: AOJu0YzQWne5K9zKvcx6GE6OQ9cp9CldRrI39IRzYgcwSlo9tj8fIlEl
	vGq2LLtxH+R8WX6scdCZfTG3HBHtT3CnAWvYL0WEqbrJpYV6Fbc6udANXz5jWmAzaQsnRhHUTqD
	se3g6
X-Gm-Gg: AfdE7ckpAVdqcLOxU6D4yzbu/fJKNEV6PRmQMRGP/5N2WESp2isC9j98pHEi1vHhlvZ
	I604pTj466uMa2t3yBy0TgOeQQc6Ll/y+7alKnWjT1p7dUL8/d2E01htmW5RwmyXphqHlsUsVPD
	cnIdX+SAo12xIA23f3eYkMeS8veGR5QCxF/xg5qGa8mSf+yEZHcWvdmvozDzdIMbssD3AvSCtmJ
	uO7P1A31hNhybwVaI+yH8e1UpFiWCDreZLCIMQkXtSOmDgJ68QZLAerLNCJfnlnkbfo3SxaAqrB
	oR5xxEpHIGRqI/hvydC/KQ7urUQYcExtUZ7wFEnNaEzIpywl1YxwRCeWKhSGtsgAXSuT+H0uyq6
	rK/PJS01uzQmziVPc6VgFluyL8tppO0isAd/51EHYAAjlvNHxvTE/HHj4ifjRNd+J2k7i5KXyAJ
	IWTMutW+P4XIx2W6S+92da3MDntp6BpjAjE/fr7iJtIVQDv9Ki8E05ruUQZa5JCWDuS7JVv+2QI
	tsLZve3xdc8r4f7
X-Received: by 2002:a05:600c:3b0a:b0:490:be9e:fd03 with SMTP id 5b1f17b1804b1-4926084556emr7025375e9.7.1782253625863;
        Tue, 23 Jun 2026 15:27:05 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0055dd0cae868d89dd.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:55dd:cae:868d:89dd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd21dbdsm370786745e9.6.2026.06.23.15.27.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 15:27:05 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap v2 15/41] openssl: upgrade 3.5.6 -> 3.5.7
Date: Wed, 24 Jun 2026 00:26:14 +0200
Message-ID: <ed3353c07f6a8a6e55d244c0039e37fb62c81712.1782252148.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782252148.git.yoann.congal@smile.fr>
References: <cover.1782252148.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 22:27:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239437

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

