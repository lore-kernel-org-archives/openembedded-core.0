Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7175C4450B
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 10:07:17 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5809.1783591630190176467
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2026 03:07:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=PGfkvrHZ;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-471eeac43bfso1580466f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 03:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783591628; x=1784196428; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Xu6kVuNEdPDZQ9qsKHKyqPydRsS7HPjUtVmcp+DmPFs=;
        b=PGfkvrHZ6nE410cDeZNrqmHEaUFCW0Rw9u/p26gVvxzxUx/DB4RoFIsqtuDo2ZK2UN
         fWDGPNQefYXIKRi1LmeCVZ+t5pKLww6GJpi8cpQ6BiblZ89B+5U28AXSDgOfr5j7oHxg
         gfQS3LanwdYYqeexsksA7YO8GzVXpKdywhDEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591628; x=1784196428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Xu6kVuNEdPDZQ9qsKHKyqPydRsS7HPjUtVmcp+DmPFs=;
        b=Rh25F3x3gh0d+QZUrbxI8+MnkfYyQcoi+Xxt2/s8svm9iCfeCriyYXDZDz5Ri0D5Yp
         uQxeoSQ+JatFpaPFUO/WXE7yEf4MWFiuXuUGaXL5rYg3YQ+jsCbDIES58jvghWBQ74YE
         gx938/1VODJYz74XOzkekGp+SfHvQ+8h45aZKKbeEt/Q9o9Hx7VbObyiVxwhuagyyqF3
         HnHspZnH7irUS31peWz4xKFFk+/sCqj9xm+EBzkalIeqYQlwE3LaKxymK5w8FR1EH2zS
         xUSHDEl5j2B8qKoToHm5AVZaPJ/AF3aGQs/kEYpq9ulMJlywGUNcpMG6rWOGqYkNu8fQ
         w9KQ==
X-Gm-Message-State: AOJu0Yw5QssGH6Duk9un5nGHayCFGANqyAJXb9L3+8+t/EZqd1UbbNH8
	zONLAhykyUhQowwK+q+JLLnau1GomuN1sLnpd2cJEGIcQVvxS5vF2smSv7JERVUQM7ry7jeuyyG
	H9ZAa51A=
X-Gm-Gg: AfdE7cnhSvnMD4UBgNj54UJh9XtoC2487IuOoz1Jl3AlrmyoNbiTJIyees6RhuDdio5
	b8y3wS4Vd/bjsj9GN+11veYJpbbebF2pB8cu0rXgbIK7MU4aMWcncRKTTIfAQFEajd0+WgtfZYX
	7iX7tgpHwgjHoF8Dd/SgF3Fdox9YdeD5jSCvmK8X26jmSxMTdsIO5EmuOIYMIjyZufCP8Cwli/b
	GSeiheWH0KAy5GpaMQEA/pX6usw5XJ+4Cs1IHs3RVDPFFi0S4mnWVzaz4fQZltu5Ll3duMLLIPm
	CAlIlFzY88D8gQJD2Dgn3KfLw66TnhNXxMsCej9UlTTEKUxJ2I6lNgooNJ/9V8R7LUOZUvwA51M
	LGaM0r4QlBm7HsdP7BUqUXkt++DdD+J0BU5YWQ8llbOcnceYOhMAtz+RMdieE1CgEIbFMh7DUbM
	41QZy+tovA1w88ZYqk5f2gAO8lSTjLHoFvVqGmmW+m14mv2uUgswDZRSuGwaDcDRRhqk+fZEHBQ
	sGra3H96aYuYsqPzw==
X-Received: by 2002:a05:600c:a43:b0:493:d741:5d72 with SMTP id 5b1f17b1804b1-493e68db0fdmr66288125e9.38.1783591628187;
        Thu, 09 Jul 2026 03:07:08 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00fd88810a86c49142.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fd88:810a:86c4:9142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e5a5d174sm149687135e9.2.2026.07.09.03.07.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 03:07:07 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/25] perl: patch CVE-2026-8376
Date: Thu,  9 Jul 2026 12:06:30 +0200
Message-ID: <a690843c02ef9c79d52391b18016794d74aa5416.1783590688.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783590688.git.yoann.congal@smile.fr>
References: <cover.1783590688.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 10:07:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240561

From: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>

Backport patches from [1]

[1] https://github.com/Perl/perl5/pull/24433

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../perl/files/CVE-2026-8376-01.patch         | 62 +++++++++++++++++++
 .../perl/files/CVE-2026-8376-02.patch         | 49 +++++++++++++++
 meta/recipes-devtools/perl/perl_5.38.4.bb     |  2 +
 3 files changed, 113 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-8376-01.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-8376-02.patch

diff --git a/meta/recipes-devtools/perl/files/CVE-2026-8376-01.patch b/meta/recipes-devtools/perl/files/CVE-2026-8376-01.patch
new file mode 100644
index 00000000000..56ab85d2be9
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2026-8376-01.patch
@@ -0,0 +1,62 @@
+From b0810dddd6b789ead00c346ead873370710f103e Mon Sep 17 00:00:00 2001
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
index 00000000000..08ab11d87b5
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2026-8376-02.patch
@@ -0,0 +1,49 @@
+From 3cc827ca6bdb7b7cfbebe30286db57b7edae0e65 Mon Sep 17 00:00:00 2001
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
+index db7ab3a409..9248e1de2b 100644
+--- a/regcomp_study.c
++++ b/regcomp_study.c
+@@ -2862,6 +2862,13 @@ Perl_study_chunk(pTHX_
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
diff --git a/meta/recipes-devtools/perl/perl_5.38.4.bb b/meta/recipes-devtools/perl/perl_5.38.4.bb
index 5ab49ed3d77..9f4cc1c4044 100644
--- a/meta/recipes-devtools/perl/perl_5.38.4.bb
+++ b/meta/recipes-devtools/perl/perl_5.38.4.bb
@@ -18,6 +18,8 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://determinism.patch \
            file://0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch \
            file://0001-Fix-intermittent-failure-of-test-t-op-sigsystem.t.patch \
+           file://CVE-2026-8376-01.patch \
+           file://CVE-2026-8376-02.patch \
            "
 SRC_URI:append:class-native = " \
            file://perl-configpm-switch.patch \

