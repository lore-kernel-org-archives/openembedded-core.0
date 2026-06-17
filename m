Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E233CD98F7
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 07:48:14 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10445.1781682492255574301
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 00:48:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=VJqi4w+d;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45f3cf907ceso2869040f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 00:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781682490; x=1782287290; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7itocfpSS/rLXFULwStfObzERJOPBbEqJaNa5bASe64=;
        b=VJqi4w+d+X1exq4q1V34NunbQs+KnV1h0NKY9Eng1sylJaJAkY5nYqC9R+nTnAsVBX
         Hs2fU9pWe/jo1zsl0Ie0QjdciGtaqgvPO9n0/EaNbwgD5ByBUcrqB3FtOMZkDcSDRO4N
         fzhee8ee7Ym+vUW9IOUX35b9jkY/gmowdRreY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781682490; x=1782287290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7itocfpSS/rLXFULwStfObzERJOPBbEqJaNa5bASe64=;
        b=b/giCZi7gv4bCmrIKADHhhUCX1vd9gXiaiu1K5pk25sdqa95d0f5I4L/m0gGNfPwiq
         yBBD2gBRT07aeA/wyqBAJtZF2Xb4mSV3DU+sI+tfSVXT/AE78beal7UNvhxMwbIjfzW9
         9j+kbDMCxgAJsaPBW1fmP+iLYe1PCxR+lE5phVmZtcQd10Qqy4qrR6yyWdWc/oq93stE
         wYkKjEveDCmQhGmmuxV6VP+iyZjfkz1jde7oIBtuJ/qxIG+FaX54YtAlxKn0CaPlNqBb
         yRyAJG4D1byA2ggg+dDeIGTrCfIf7utgPU9pYShd2h/oMg6MA/8d0pX+0qUrE20SVfdF
         kbZA==
X-Gm-Message-State: AOJu0YykLn0ntAfPrl1+PPdsTclLLsskdtWqQ59t2wRcYRb/sUecgorR
	638wVPYmzhPfVhsmCmVYFadYWLXjEfCa/W7wTkeziYw+MZjtHEJPurQ1h+PZgeKqCAKiLwM/RIf
	XPtRt
X-Gm-Gg: AfdE7cnJKJLuhPHa3kMslM7eEgGkDTmI0lkyTsyikm3WLH4MyoVlI/sYAIg2ksZPjvO
	6hyQRV3GCfVWKKes9HWG2JRpMJZg+UbafVGfwJEQEwd6y+7z9YEIDaN3O9ZJRKxupL1rXqr0EHE
	i6uIwsGowuU+RXMXaupCxe7gkwDqgk/cxjpJfTB5SalQdWzc+qYkH7lQWEiHet9z16Bsg81S17r
	+7jEvuVZdXp3KfPmptDPeZHiKjLMLvnsQOi7ZrydkTQkgyLPu470D2UELspn2YAoWZbhDPrivff
	ySCl9W5vCzuFKq8aqHNdck6PsWjBzuAzmSwabddSCg49b7Zda8EEDrN8YwTpqbxTHYkwsJSDL8M
	YoI441aIEeA1okiPHgWSV7VpMwQdsuxA+Sbg72am5t+Hj4+1+jP0I7RccNeDkYIaQXHJ6282rST
	GWSW3rAuz1cQt4Fk07wFghwvHxqJCJmuQG7fhEw0XcdCp5BllVio2rwXCTegUFpRUSRIYSHvKrD
	vdds06Tl/bU5UH0ag==
X-Received: by 2002:adf:ffca:0:b0:461:a161:8102 with SMTP id ffacd0b85a97d-46237e50407mr3702288f8f.28.1781682490326;
        Wed, 17 Jun 2026 00:48:10 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bc19bde07170effe.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bc19:bde0:7170:effe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2dbfb1sm54721732f8f.35.2026.06.17.00.48.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 00:48:09 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 8/8] openssl: upgrade 3.5.6 -> 3.5.7
Date: Wed, 17 Jun 2026 09:47:59 +0200
Message-ID: <530fb9ea9ba6ffe212566d3b95d17b519c52c769.1781682367.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781682367.git.yoann.congal@smile.fr>
References: <cover.1781682367.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 07:48:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239023

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

(From OE-Core rev: 9365ac47f994a7d6be92b8c011c51ecf48e8ef87)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
(cherry picked from commit 9365ac47f994a7d6be92b8c011c51ecf48e8ef87)
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
index 66856544721..212879dfa35 100644
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

