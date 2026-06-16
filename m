Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 402F2CD98E1
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 16:56:07 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2473.1781628959133257776
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 09:56:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=w+idzSPP;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20260616165556005dfc7d7200020760-iowqcw@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260616165556005dfc7d7200020760
        for <openembedded-core@lists.openembedded.org>;
        Tue, 16 Jun 2026 18:55:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=ik5xlVRlflzNAK3cYqwLitTf72eJci0CLvOaArPrcQE=;
 b=w+idzSPPq+K0cW8nNjRtRHzVpqMnMpCkjnghOWaSMnU8Tj0lwbJwwXV9Sgh9jxX60+DdyF
 gv2t88YDql2ll7xQEgygN6mv+iNMpYKpcsnJHAMsqjcsZAZ+gejWNKlFgWx5LD1D+AtoRhdy
 dealWbrdiDfLvkuxy4K21rmEN9LtBxH7xUyAlKSbZpASZV9j1LhQv/osE3NsILU3DQUYv+o3
 6dcng5hNUnEkB7aJWbVYC6Di3EY3jkLbsk9NwQTrlktE8AivEy9lgHqBPHdBCNtcMQ1rCuOi
 StIYaXNVWlF3QHvFBzKF37toXusPZGDy+985FpOvpxRlsD6iq7BTEC1A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH] openssl: upgrade 3.5.6 -> 3.5.7
Date: Tue, 16 Jun 2026 18:55:54 +0200
Message-ID: <20260616165554.3049547-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 16:56:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238922

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
---
 .../openssl/0001-Configure-do-not-tweak-mips-cflags.patch     | 2 +-
 .../openssl/{openssl_3.5.6.bb => openssl_3.5.7.bb}            | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.5.6.bb => openssl_3.5.7.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch b/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
index cf5ff356ee..cd8906df67 100644
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
index 6685654472..212879dfa3 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.5.6.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.5.7.bb
@@ -19,7 +19,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "deae7c80cba99c4b4f940ecadb3c3338b13cb77418409238e57d7f31f2a3b736"
+SRC_URI[sha256sum] = "a8c0d28a529ca480f9f36cf5792e2cd21984552a3c8e4aa11a24aa31aeac98e8"
 
 inherit lib_package multilib_header multilib_script ptest perlnative manpages
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
@@ -223,7 +223,7 @@ do_install_ptest() {
 	ln -s ${bindir}/openssl ${D}${PTEST_PATH}/apps
 
 	cd ${S}
-	find test/certs test/ct test/d2i-tests test/recipes test/ocsp-tests test/ssl-tests test/smime-certs -type f -exec install -m644 -D {} ${D}${PTEST_PATH}/{} \;
+	find test/certs test/ct test/d2i-tests test/recipes test/ocsp-tests test/ssl-tests test/smime-certs test/smime-eml -type f -exec install -m644 -D {} ${D}${PTEST_PATH}/{} \;
 	find apps test -name \*.cnf -exec install -m644 -D {} ${D}${PTEST_PATH}/{} \;
 	find apps test -name \*.der -exec install -m644 -D {} ${D}${PTEST_PATH}/{} \;
 	find apps test -name \*.pem -exec install -m644 -D {} ${D}${PTEST_PATH}/{} \;

