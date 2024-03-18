Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64F74C54E60
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 02:22:21 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web11.34075.1710728538941465235
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Mar 2024 19:22:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=SX4IdafK;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.169, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3c386c46068so399023b6e.2
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Mar 2024 19:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710728538; x=1711333338; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KlBjlRBPGgLBrKrkpWm+r6oEBb6SJGY2G6gw6/ALEZY=;
        b=SX4IdafKmjeQ3HAYy2pFCKLcQzyzMM8BH+E5HH0HsZrABglA/cEEK1soG0apBibsho
         ZQijvcyJd9CvzpbrIyio6AgUzTMb0VUT5nE2YjNtgy/eR0Nd4SsRrSVgdA9L3PE8iNSF
         9c2sBQkmOEm8hpGiDPHNT3L5mFQ5mFWJbjKZxs1GXuNtVruIZ0ufe414jKzEjeoq1C5I
         6ozF6NbfxYwd4wPnQXAUAz7BIPYoG9QwITv25hH84dXmyW8zAUb6NoJTPaCdJ0JdzSaW
         FPvWG+dWenzY5+tl6aehrm3LI8yuw6/jsBUWjdbG0VDcdAJdLjdbGfZ18oxIlh2mhB/H
         demw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710728538; x=1711333338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KlBjlRBPGgLBrKrkpWm+r6oEBb6SJGY2G6gw6/ALEZY=;
        b=Ka5sSl/jSiM1w0H+/I3cMVKHmYVW04WOMvu4YukFeX34JMii45IorDgt8RvfVb2xry
         SKEYA6DQ8IOvS2Nbx1Mtv2RlciVLpsA9Xab/PAaRLOaltaYFU8u5j80Ho7d0xsTfwyZ9
         arH8N+3TuxemqRYrEX+V3yJ67KLU8Yy5Sb92ALYBwtVVB1f0Yi4h2EzEbIhXmIh9y+U6
         aKZmDaqgMx9elpMw8nhhXixNOHYIU74yBge4pVmAv55Pg8u8gb5zdGwUW0P6JX2B2zlz
         J7xRFskF4R2spFOp+OP77GYpAW04ldQiFwgZvqqTxHuf7zrwQdwXdHfHSuUBUwTqLkts
         ypjA==
X-Gm-Message-State: AOJu0YwJezVRqc6lNmkCm7GsXSKb+XyIkZnwuGWK/CFq6o+PC01b/qi6
	bJEmBy5sLLE1vSTWMJRzJAyV2PjlUULjFGFBl0A47JjpKxfrjT3la2fhigDjWYjDCtyjxss7UWI
	W6ev9Gw==
X-Google-Smtp-Source: AGHT+IGq90sxtkiiLXuvMjkZHeEcmiMXNS64EDwBlx1fsIjizykWn3sMAcCKyKr9GFJdZyEW+cHEBA==
X-Received: by 2002:a05:6808:1453:b0:3c2:523c:a2b5 with SMTP id x19-20020a056808145300b003c2523ca2b5mr13782736oiv.4.1710728538111;
        Sun, 17 Mar 2024 19:22:18 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id 25-20020a630f59000000b005dc2ca5b667sm5953953pgp.10.2024.03.17.19.22.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 19:22:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 09/14] openssl: upgrade to 3.1.5
Date: Sun, 17 Mar 2024 16:21:53 -1000
Message-Id: <aeac11fa743567e185179b27b4700bbf8fcf06e1.1710728384.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710728384.git.steve@sakoman.com>
References: <cover.1710728384.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 02:22:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197284

From: Lee Chee Yang <chee.yang.lee@intel.com>

Changes between 3.1.4 and 3.1.5 [30 Jan 2024]
 * A file in PKCS12 format can contain certificates and keys and may
come from
   an untrusted source. The PKCS12 specification allows certain fields
to be
   NULL, but OpenSSL did not correctly check for this case. A fix has
been
   applied to prevent a NULL pointer dereference that results in OpenSSL
   crashing. If an application processes PKCS12 files from an untrusted
source
   using the OpenSSL APIs then that application will be vulnerable to
this
   issue prior to this fix.

   OpenSSL APIs that were vulnerable to this are: PKCS12_parse(),
   PKCS12_unpack_p7data(), PKCS12_unpack_p7encdata(),
PKCS12_unpack_authsafes()
   and PKCS12_newpass().

   We have also fixed a similar issue in SMIME_write_PKCS7(). However
since this
   function is related to writing data we do not consider it security
   significant.

   ([CVE-2024-0727])
https://www.openssl.org/news/cl31.txt

drop fix_random_labels.patch as fixed in
https://github.com/openssl/openssl/commit/99630a1b08fd6464d95052dee4a3500afeb95867

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssl/openssl/fix_random_labels.patch   | 22 -------------------
 .../{openssl_3.1.4.bb => openssl_3.1.5.bb}    |  4 ++--
 2 files changed, 2 insertions(+), 24 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/fix_random_labels.patch
 rename meta/recipes-connectivity/openssl/{openssl_3.1.4.bb => openssl_3.1.5.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl/fix_random_labels.patch b/meta/recipes-connectivity/openssl/openssl/fix_random_labels.patch
deleted file mode 100644
index 78dcd81685..0000000000
--- a/meta/recipes-connectivity/openssl/openssl/fix_random_labels.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-The perl script adds random suffixes to the local function names to ensure
-it doesn't clash with other parts of openssl. Set the random number seed
-to something predictable so the assembler files are generated consistently
-and our own reproducible builds tests pass.
-
-Upstream-Status: Pending
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Index: openssl-3.1.0/crypto/modes/asm/aes-gcm-avx512.pl
-===================================================================
---- openssl-3.1.0.orig/crypto/modes/asm/aes-gcm-avx512.pl
-+++ openssl-3.1.0/crypto/modes/asm/aes-gcm-avx512.pl
-@@ -191,6 +191,9 @@ my $CTX_OFFSET_HTable    = (16 * 6);
- # ;;; Helper functions
- # ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
- 
-+# Ensure the local labels are reproduicble
-+srand(10000);
-+
- # ; Generates "random" local labels
- sub random_string() {
-   my @chars  = ('a' .. 'z', 'A' .. 'Z', '0' .. '9', '_');
diff --git a/meta/recipes-connectivity/openssl/openssl_3.1.4.bb b/meta/recipes-connectivity/openssl/openssl_3.1.5.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_3.1.4.bb
rename to meta/recipes-connectivity/openssl/openssl_3.1.5.bb
index 0fe4e76808..05bfeac45e 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.1.4.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.1.5.bb
@@ -11,7 +11,6 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://run-ptest \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
-           file://fix_random_labels.patch \
            file://0001-Added-handshake-history-reporting-when-test-fails.patch \
            "
 
@@ -19,7 +18,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "840af5366ab9b522bde525826be3ef0fb0af81c6a9ebd84caa600fea1731eee3"
+SRC_URI[sha256sum] = "6ae015467dabf0469b139ada93319327be24b98251ffaeceda0221848dc09262"
 
 inherit lib_package multilib_header multilib_script ptest perlnative manpages
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
@@ -187,6 +186,7 @@ PTEST_BUILD_HOST_PATTERN = "perl_version ="
 do_install_ptest () {
 	install -d ${D}${PTEST_PATH}/test
 	install -m755 ${B}/test/p_test.so ${D}${PTEST_PATH}/test
+	install -m755 ${B}/test/p_minimal.so ${D}${PTEST_PATH}/test
 	install -m755 ${B}/test/provider_internal_test.cnf ${D}${PTEST_PATH}/test
 
 	# Prune the build tree
-- 
2.34.1


