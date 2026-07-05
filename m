Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E22E5C44500
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 22:43:07 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.139227.1783291386158762710
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 15:43:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=PcNdUcAI;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4798bea72f9so1391880f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 15:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783291384; x=1783896184; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qVJRBvgf1dTwSsR7QLtZGCre0wZPxicpkRcK5GKsMNI=;
        b=PcNdUcAIihEXyzvswkQ54HaP/OK+xtpEjlqdhS6ULaJbZL9NzRuZbpX3XquLliIJbz
         /AhWtFDmNpbHPK51hbwxA7dFcHE3/Jt3JeraWDXcSPsOmKzE12x62HBzkuEGAkIY/YBm
         8v0pK6fv6e/rmPV6m5MeJt3ztnrCVr2qnLrcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783291384; x=1783896184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qVJRBvgf1dTwSsR7QLtZGCre0wZPxicpkRcK5GKsMNI=;
        b=ak5fWVlS9qvyRwPzqen5p6dcmQ38RO7pqLd8fltS7w5H0n1sqs5UjXUfATmO4MyQU/
         jEQ7mII+YR9f9iSM2BaeRL2uj5f8hPypoQXXZ2KYdQ2CyDkD/ImwQ35AU6TmIFm1YW7q
         rDgISY3B2ODWUNuYZOMyHbZoU/GmCDAwNGTJXxAo6Zr+HEfF6r9soVdOLU0wVWLwmCqN
         fYfAAR/KKTIH8J3AyPNchXYP86ovxhmInGVhucDhl3pkj7tlsS6S9nLuxKs7pGM89jP5
         5AE5LHniyyNCNBUqC7XMM/xEExJiXAT03oo9vvVGowopRc+k8xZhv3Ga8glsS39+rqXf
         cdJg==
X-Gm-Message-State: AOJu0YwnS52NH8MNVn3knJsl/eK9stHimkhkPG0jufoiCt3pRBz2Mhio
	sheaBgy6cAlCo1wpA+NQU/OYeFHGn2e0kPaSZjlUM4IcPoOdKYLdZ4MA+XBwslL6RAHdDGYrIES
	qB82Oabs=
X-Gm-Gg: AfdE7clEIiRcWPIZEvn+o1pFOiUTNwxem6NDyMfvJF7hHiw7l3++DegG01w+WiNO+lI
	7BfGlxUtyd8p5Ebakn+GEi+nel95eKGWLYQlNk4mRJei6RnLCOh7XvUr9d/6HMcJdeUJse5PREP
	jh6Sh75/e7dfR+Ji8+rjK77ntsg/zO32MmvrFWvzIX3FauS9o43cN8mzkDELntsw2wAX6iQgDct
	kaLPWXNgNwpocBA30KlWczZs63voMPlOwWT5ZJYkCkHNxCnQ00IOqVYOI1R44bA8gJPmK2sqiOy
	IX+CpQNAkSvzo0RNmWOavaWStc5/1Rz99FMoowYVh2Ws8Ur4DtXd3GZ4eFicUWOS3Ai1EVSAb2d
	XnqQUgdhDU6Iy2XluXlw8uq1uGkrfehlTC1RFKpnmejPZXnBjpyvgYynX/Qt2qcMCQnA66h1DMe
	5gUNXP3stRqgGIPQcYgqI8p3YRDg==
X-Received: by 2002:a05:600c:8708:b0:492:4911:8a with SMTP id 5b1f17b1804b1-493d11db676mr85229615e9.12.1783291384381;
        Sun, 05 Jul 2026 15:43:04 -0700 (PDT)
Received: from FRSMI25-LASER.lan ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm17943606f8f.30.2026.07.05.15.43.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 15:43:03 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 36/55] perl: patch CVE-2026-8376
Date: Mon,  6 Jul 2026 00:41:26 +0200
Message-ID: <ef67ec3d6e52c8dda309fadfb0ca5c7ecf7fd5dc.1783289522.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783289522.git.yoann.congal@smile.fr>
References: <cover.1783289522.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 22:43:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240190

From: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>

Backport patches from [1]

[1] https://github.com/Perl/perl5/pull/24433

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5dd5865a74accaec21eb8391b2491f98908f8586)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../perl/files/CVE-2026-8376-01.patch         | 62 +++++++++++++++++++
 .../perl/files/CVE-2026-8376-02.patch         | 49 +++++++++++++++
 meta/recipes-devtools/perl/perl_5.42.0.bb     |  2 +
 3 files changed, 113 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-8376-01.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-8376-02.patch

diff --git a/meta/recipes-devtools/perl/files/CVE-2026-8376-01.patch b/meta/recipes-devtools/perl/files/CVE-2026-8376-01.patch
new file mode 100644
index 00000000000..af94eec29cf
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2026-8376-01.patch
@@ -0,0 +1,62 @@
+From fd23f4370d24d00352d1cc09b16687f16da6ae5b Mon Sep 17 00:00:00 2001
+From: Tony Cook <tony@develop-help.com>
+Date: Tue, 12 May 2026 14:47:31 +1000
+Subject: [PATCH 1/2] perl/perl-security#147: test cases
+
+The suggested case from the ticket and an alternative.
+
+(cherry picked from commit e842efdafe7c51a687a4907e4887988fe6a025ef)
+
+CVE: CVE-2026-8376
+Upstream-Status: Backport [https://github.com/Perl/perl5/commit/e842efdafe7c51a687a4907e4887988fe6a025ef]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ t/re/pat_psycho.t | 18 ++++++++++++++++--
+ 1 file changed, 16 insertions(+), 2 deletions(-)
+
+diff --git a/t/re/pat_psycho.t b/t/re/pat_psycho.t
+index 336039521d..73a7992372 100644
+--- a/t/re/pat_psycho.t
++++ b/t/re/pat_psycho.t
+@@ -10,7 +10,7 @@
+ use strict;
+ use warnings;
+ use 5.010;
+-
++use Config;
+ 
+ sub run_tests;
+ 
+@@ -31,7 +31,7 @@ BEGIN {
+ 
+ skip_all('$PERL_SKIP_PSYCHO_TEST set') if $ENV{PERL_SKIP_PSYCHO_TEST};
+ 
+-plan tests => 15;  # Update this when adding/deleting tests.
++plan tests => 17;  # Update this when adding/deleting tests.
+ 
+ run_tests() unless caller;
+ 
+@@ -211,6 +211,20 @@ EOF
+ 
+ 
+     }
++
++  SKIP:
++    { # sec #147
++        $Config{ptrsize} == 4
++          or skip "these only fail on x32 and use too much memory on x64", 2;
++        local $::TODO = "This crashes";
++        # original case
++        fresh_perl_like('/\x{10000}{1073741824}/',
++                        qr/Regexp out of space/, {}, "ssize_t overflow");
++
++        # synthesized but similar case
++        fresh_perl_like('/(?:\x{10001}\x{10000}){536870912}/',
++                        qr/Regexp out of space/, {}, "ssize_t overflow again");
++    }
+ } # End of sub run_tests
+ 
+ 1;
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/perl/files/CVE-2026-8376-02.patch b/meta/recipes-devtools/perl/files/CVE-2026-8376-02.patch
new file mode 100644
index 00000000000..39b3d510fe4
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2026-8376-02.patch
@@ -0,0 +1,49 @@
+From 49c18d4c91d5b49e0a7cbb8277f3149198004c36 Mon Sep 17 00:00:00 2001
+From: Tony Cook <tony@develop-help.com>
+Date: Tue, 12 May 2026 14:51:00 +1000
+Subject: [PATCH 2/2] perl/perl-security#147: test against the actual character
+ lengths
+
+(cherry picked from commit 5e7f119eb2bb1181be908701f22bf7068e722f1c)
+
+CVE: CVE-2026-8376
+Upstream-Status: Backport [https://github.com/Perl/perl5/commit/5e7f119eb2bb1181be908701f22bf7068e722f1c]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ regcomp_study.c   | 7 +++++++
+ t/re/pat_psycho.t | 1 -
+ 2 files changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/regcomp_study.c b/regcomp_study.c
+index 9106452dd5..05f1b017b1 100644
+--- a/regcomp_study.c
++++ b/regcomp_study.c
+@@ -2770,6 +2770,13 @@ Perl_study_chunk(pTHX_
+                                                (U8 *) SvEND(data->last_found))
+                                 - (U8*)s;
+                         l -= old;
++
++                        if (l > 0 &&
++                            (mincount >= SSize_t_MAX / (SSize_t)l
++                             || old > SSize_t_MAX - mincount * (SSize_t)l)) {
++                            FAIL("Regexp out of space");
++                        }
++
+                         /* Get the added string: */
+                         last_str = newSVpvn_utf8(s  + old, l, UTF);
+                         last_chrs = UTF ? utf8_length((U8*)(s + old),
+diff --git a/t/re/pat_psycho.t b/t/re/pat_psycho.t
+index 73a7992372..9fd764fd5e 100644
+--- a/t/re/pat_psycho.t
++++ b/t/re/pat_psycho.t
+@@ -216,7 +216,6 @@ EOF
+     { # sec #147
+         $Config{ptrsize} == 4
+           or skip "these only fail on x32 and use too much memory on x64", 2;
+-        local $::TODO = "This crashes";
+         # original case
+         fresh_perl_like('/\x{10000}{1073741824}/',
+                         qr/Regexp out of space/, {}, "ssize_t overflow");
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/perl/perl_5.42.0.bb b/meta/recipes-devtools/perl/perl_5.42.0.bb
index cf28067bab8..1833b7a352d 100644
--- a/meta/recipes-devtools/perl/perl_5.42.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.42.0.bb
@@ -16,6 +16,8 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://0002-Constant-Fix-up-shebang.patch \
            file://determinism.patch \
            file://0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch \
+           file://CVE-2026-8376-01.patch \
+           file://CVE-2026-8376-02.patch \
            "
 SRC_URI:append:class-native = " \
            file://perl-configpm-switch.patch \

