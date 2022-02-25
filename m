Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FEBEC433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:26:52 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web09.6915.1645799211491965552
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:26:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=SEbyHabf;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id 132so4790537pga.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3vi6OXoK/DnKzV0RkLeDMqjaur9MT3W8eJwQJi4vhIc=;
        b=SEbyHabfYiEsEVMSW5mzt0XqXBmmyOIym7aovdfG99zsqAqQ0NRIjZ42lSpx7iSLuE
         Qh34QGJbr1xNfJeGrXIpaV08yKsjk47wEB3sJHPHYJRfbI4mDkuXg37nmvOJm9S5aXWH
         rLE4ETWBUAf/MCz97QEW63VDfOItNixOrhG9AEt64axq4TUJNc2ZGXCSK52QvwmxeKzO
         DKJIbXt/7NJ5+7gTlCwJGA+wQfsoYgRjzmO5y7Zbi3xKz0XQeW/Ww4aqxgkvXDeHMDjN
         a0M2hAPDsPcHky+79HCZ+XqlMIe1+Rdzcms/ubpXYTBEio4PZkPFqYEZUBqV+b3vueY/
         0RBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3vi6OXoK/DnKzV0RkLeDMqjaur9MT3W8eJwQJi4vhIc=;
        b=dIqfsgC18cBU886+QcXm2yN47v5++8k4S2EJR59chwst00ZjCLFbHb6VtAP7iqlT80
         ZAHRZpOe6KtIN92HEopK9GJNmb3JD34i1fV4Msqq6+4kIyAC1NjSKGWxFIrzx65aK8Ap
         ozoWs75SdFkk6eBCPK3ANK2vn6hXCmbmKj07K+82yIe6JkVRQ3OD2m7Sq5IFBV2G8JyJ
         I5lE5/w2SJ2WU/j9YhtSIJ2N/zJYVboD2LpLtXNgVP4L5cY3B9ZQ82JiyGhJSXDKPLgb
         HwjLiI7D5R2DrB7EG7GgCTEnvALRfS31HdhEfZforgbLKFlg5DnOL0LJ9jP89PjvKwHD
         TRIQ==
X-Gm-Message-State: AOAM531dZ89tTFqxyn+NJze2nL8jshXrdpG1kzpCY4XTW7WkR6nVM9IG
	wdf+4DdY/N0K4JnHW+Q6xMJ4wxaohUHaa5iL
X-Google-Smtp-Source: 
 ABdhPJw416JovpgClDYqkF8NjwVsz2QpYE9B3bZL5e+o5w4U11g1MZEiWzMmRU3LyUwbDaSDXkSnzQ==
X-Received: by 2002:a05:6a00:1a42:b0:4d1:e81a:64cb with SMTP id
 h2-20020a056a001a4200b004d1e81a64cbmr8060883pfv.78.1645799210282;
        Fri, 25 Feb 2022 06:26:50 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h17-20020a63df51000000b0036b9776ae5bsm2864538pgj.85.2022.02.25.06.26.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:26:49 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/50] openssl: Add fix for CVE-2021-4160
Date: Fri, 25 Feb 2022 04:25:41 -1000
Message-Id: 
 <5216986fc6dfd06562efa5937581dc6fa77ad276.1645798648.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645798648.git.steve@sakoman.com>
References: <cover.1645798648.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 14:26:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162347

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

Add a patch to fix CVE-2021-4160
The issue only affects OpenSSL on MIPS platforms.
Link: https://security-tracker.debian.org/tracker/CVE-2021-4160

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssl/openssl/CVE-2021-4160.patch       | 145 ++++++++++++++++++
 .../openssl/openssl_1.1.1l.bb                 |   1 +
 2 files changed, 146 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2021-4160.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2021-4160.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2021-4160.patch
new file mode 100644
index 0000000000..ff1e807157
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2021-4160.patch
@@ -0,0 +1,145 @@
+From e9e726506cd2a3fd9c0f12daf8cc1fe934c7dddb Mon Sep 17 00:00:00 2001
+From: Bernd Edlinger <bernd.edlinger@hotmail.de>
+Date: Sat, 11 Dec 2021 20:28:11 +0100
+Subject: [PATCH] Fix a carry overflow bug in bn_sqr_comba4/8 for mips 32-bit
+ targets
+
+bn_sqr_comba8 does for instance compute a wrong result for the value:
+a=0x4aaac919 62056c84 fba7334e 1a6be678 022181ba fd3aa878 899b2346 ee210f45
+
+The correct result is:
+r=0x15c72e32 605a3061 d11b1012 3c187483 6df96999 bd0c22ba d3e7d437 4724a82f
+    912c5e61 6a187efe 8f7c47fc f6945fe5 75be8e3d 97ed17d4 7950b465 3cb32899
+
+but the actual result was:
+r=0x15c72e32 605a3061 d11b1012 3c187483 6df96999 bd0c22ba d3e7d437 4724a82f
+    912c5e61 6a187efe 8f7c47fc f6945fe5 75be8e3c 97ed17d4 7950b465 3cb32899
+
+so the forth word of the result was 0x75be8e3c but should have been
+0x75be8e3d instead.
+
+Likewise bn_sqr_comba4 has an identical bug for the same value as well:
+a=0x022181ba fd3aa878 899b2346 ee210f45
+
+correct result:
+r=0x00048a69 9fe82f8b 62bd2ed1 88781335 75be8e3d 97ed17d4 7950b465 3cb32899
+
+wrong result:
+r=0x00048a69 9fe82f8b 62bd2ed1 88781335 75be8e3c 97ed17d4 7950b465 3cb32899
+
+Fortunately the bn_mul_comba4/8 code paths are not affected.
+
+Also the mips64 target does in fact not handle the carry propagation
+correctly.
+
+Example:
+a=0x4aaac91900000000 62056c8400000000 fba7334e00000000 1a6be67800000000
+    022181ba00000000 fd3aa87800000000 899b234635dad283 ee210f4500000001
+
+correct result:
+r=0x15c72e32272c4471 392debf018c679c8 b85496496bf8254c d0204f36611e2be1
+    0cdb3db8f3c081d8 c94ba0e1bacc5061 191b83d47ff929f6 5be0aebfc13ae68d
+    3eea7a7fdf2f5758 42f7ec656cab3cb5 6a28095be34756f2 64f24687bf37de06
+    2822309cd1d292f9 6fa698c972372f09 771e97d3a868cda0 dc421e8a00000001
+
+wrong result:
+r=0x15c72e32272c4471 392debf018c679c8 b85496496bf8254c d0204f36611e2be1
+    0cdb3db8f3c081d8 c94ba0e1bacc5061 191b83d47ff929f6 5be0aebfc13ae68d
+    3eea7a7fdf2f5758 42f7ec656cab3cb5 6a28095be34756f2 64f24687bf37de06
+    2822309cd1d292f8 6fa698c972372f09 771e97d3a868cda0 dc421e8a00000001
+
+Reviewed-by: Paul Dale <pauli@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/17258)
+
+(cherry picked from commit 336923c0c8d705cb8af5216b29a205662db0d590)
+
+Upstream-Status: Backport [https://git.openssl.org/gitweb/?p=openssl.git;a=patch;h=e9e726506cd2a3fd9c0f12daf8cc1fe934c7dddb]
+CVE: CVE-2021-4160
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+
+---
+ crypto/bn/asm/mips.pl |  4 ++++
+ test/bntest.c         | 45 +++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 49 insertions(+)
+
+diff --git a/crypto/bn/asm/mips.pl b/crypto/bn/asm/mips.pl
+index 8ad715bda4..74101030f2 100644
+--- a/crypto/bn/asm/mips.pl
++++ b/crypto/bn/asm/mips.pl
+@@ -1984,6 +1984,8 @@ $code.=<<___;
+ 	sltu	$at,$c_2,$t_1
+ 	$ADDU	$c_3,$t_2,$at
+ 	$ST	$c_2,$BNSZ($a0)
++	sltu	$at,$c_3,$t_2
++	$ADDU	$c_1,$at
+ 	mflo	($t_1,$a_2,$a_0)
+ 	mfhi	($t_2,$a_2,$a_0)
+ ___
+@@ -2194,6 +2196,8 @@ $code.=<<___;
+ 	sltu	$at,$c_2,$t_1
+ 	$ADDU	$c_3,$t_2,$at
+ 	$ST	$c_2,$BNSZ($a0)
++	sltu	$at,$c_3,$t_2
++	$ADDU	$c_1,$at
+ 	mflo	($t_1,$a_2,$a_0)
+ 	mfhi	($t_2,$a_2,$a_0)
+ ___
+diff --git a/test/bntest.c b/test/bntest.c
+index b58028a301..bab34ba54b 100644
+--- a/test/bntest.c
++++ b/test/bntest.c
+@@ -627,6 +627,51 @@ static int test_modexp_mont5(void)
+     if (!TEST_BN_eq(c, d))
+         goto err;
+ 
++    /*
++     * Regression test for overflow bug in bn_sqr_comba4/8 for
++     * mips-linux-gnu and mipsel-linux-gnu 32bit targets.
++     */
++    {
++        static const char *ehex[] = {
++            "95564994a96c45954227b845a1e99cb939d5a1da99ee91acc962396ae999a9ee",
++            "38603790448f2f7694c242a875f0cad0aae658eba085f312d2febbbd128dd2b5",
++            "8f7d1149f03724215d704344d0d62c587ae3c5939cba4b9b5f3dc5e8e911ef9a",
++            "5ce1a5a749a4989d0d8368f6e1f8cdf3a362a6c97fb02047ff152b480a4ad985",
++            "2d45efdf0770542992afca6a0590d52930434bba96017afbc9f99e112950a8b1",
++            "a359473ec376f329bdae6a19f503be6d4be7393c4e43468831234e27e3838680",
++            "b949390d2e416a3f9759e5349ab4c253f6f29f819a6fe4cbfd27ada34903300e",
++            "da021f62839f5878a36f1bc3085375b00fd5fa3e68d316c0fdace87a97558465",
++            NULL};
++        static const char *phex[] = {
++            "f95dc0f980fbd22e90caa5a387cc4a369f3f830d50dd321c40db8c09a7e1a241",
++            "a536e096622d3280c0c1ba849c1f4a79bf490f60006d081e8cf69960189f0d31",
++            "2cd9e17073a3fba7881b21474a13b334116cb2f5dbf3189a6de3515d0840f053",
++            "c776d3982d391b6d04d642dda5cc6d1640174c09875addb70595658f89efb439",
++            "dc6fbd55f903aadd307982d3f659207f265e1ec6271b274521b7a5e28e8fd7a5",
++            "5df089292820477802a43cf5b6b94e999e8c9944ddebb0d0e95a60f88cb7e813",
++            "ba110d20e1024774107dd02949031864923b3cb8c3f7250d6d1287b0a40db6a4",
++            "7bd5a469518eb65aa207ddc47d8c6e5fc8e0c105be8fc1d4b57b2e27540471d5",
++            NULL};
++        static const char *mhex[] = {
++            "fef15d5ce4625f1bccfbba49fc8439c72bf8202af039a2259678941b60bb4a8f",
++            "2987e965d58fd8cf86a856674d519763d0e1211cc9f8596971050d56d9b35db3",
++            "785866cfbca17cfdbed6060be3629d894f924a89fdc1efc624f80d41a22f1900",
++            "9503fcc3824ef62ccb9208430c26f2d8ceb2c63488ec4c07437aa4c96c43dd8b",
++            "9289ed00a712ff66ee195dc71f5e4ead02172b63c543d69baf495f5fd63ba7bc",
++            "c633bd309c016e37736da92129d0b053d4ab28d21ad7d8b6fab2a8bbdc8ee647",
++            "d2fbcf2cf426cf892e6f5639e0252993965dfb73ccd277407014ea784aaa280c",
++            "b7b03972bc8b0baa72360bdb44b82415b86b2f260f877791cd33ba8f2d65229b",
++            NULL};
++
++        if (!TEST_true(parse_bigBN(&e, ehex))
++                || !TEST_true(parse_bigBN(&p, phex))
++                || !TEST_true(parse_bigBN(&m, mhex))
++                || !TEST_true(BN_mod_exp_mont_consttime(d, e, p, m, ctx, NULL))
++                || !TEST_true(BN_mod_exp_simple(a, e, p, m, ctx))
++                || !TEST_BN_eq(a, d))
++            goto err;
++    }
++
+     /* Zero input */
+     if (!TEST_true(BN_bntest_rand(p, 1024, 0, 0)))
+         goto err;
+-- 
+2.25.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1l.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1l.bb
index bf7cd6527e..24466e11b1 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1l.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1l.bb
@@ -18,6 +18,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://afalg.patch \
            file://reproducible.patch \
            file://reproducibility.patch \
+           file://CVE-2021-4160.patch \
            "
 
 SRC_URI_append_class-nativesdk = " \
-- 
2.25.1


