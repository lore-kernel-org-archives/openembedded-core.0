Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C532C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 19:54:50 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web09.15352.1634673289930028462
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:54:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=1s+DZ2Ep;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id om14so769503pjb.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=lzcqr0c+RFHNHR1zuclX1x3dhuwXXb99khca2slbY3U=;
        b=1s+DZ2EpmVrBkVQlGBRFZZG3zwg6F++r4iN5dORcn2VMz4lKz+MLCnoyrHC9LBh+mS
         tUbpbk2NATxQ5caiU5im+TXT53eJ10Xh2dlllmiz2KUDcN9oEsqI58nhMigaw325+W5x
         V8bBaj+oLm59ILbMMYWNsIRe68G/vEmRX4Iq1uZj0bz5BtlbgLgcDf07HF2/7O3H7OSc
         +D0X00XFjog66TLEq9vKkVzD3WolGI887A20eEzL13vD6YJmUg9dcrsxYnupgAAjW5FG
         m/tMAj4gLZ/SiEtisMJRPfBXuOubyA0AhQQoEU3dRWOvda/wYiOzjoAUJYKO6wQHd/9I
         aXpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lzcqr0c+RFHNHR1zuclX1x3dhuwXXb99khca2slbY3U=;
        b=U8eR13eVZAr+IwkDo9/sftJDR3RVJqcAd0gdWCjrb7sNcgJItmeHguNSqeKWS+cto1
         GqKkoQS2gmxu87Rn7ZvmQTzdf7GJJyNGPaHXuDGhgHTIrKY12+Bc73Opv2f8LvSOw3+b
         jBGFAlqjAYnLnaSvIFDHxoOS50X5ZODOqyrpAVT4V6Pf92urXbSAN2fbGMzzAXdH3F/R
         E73+NjvtWm65BUKUEFSiPkbuVO4EwVB7waVLfmBsR5Q7g3CUJTAPLJq24Ln7YekpEPb+
         93lunVnlJ/iZ2FKldqbRZ/tiktiOMq4r1oMWhldsHX5YL0ZIrGc1lr1+KnVWLlOVAA0u
         Ds6Q==
X-Gm-Message-State: AOAM533qarOGgSHf5SGGAQ0fXRFAYgmN5158/wofljVIFoBul/mcj011
	M6iiuox4ISq0Rb/MHnhIOxbvD7hZKb8rl0vW
X-Google-Smtp-Source: 
 ABdhPJw/O74qGhXaVmqy53KYRPDFXd9HVYDfdPvu0G0GLa1jqzJBPyyLNPLzrZmob1ezsfJPZPSsvQ==
X-Received: by 2002:a17:90a:17e1:: with SMTP id
 q88mr2024602pja.99.1634673288985;
        Tue, 19 Oct 2021 12:54:48 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q14sm67104pfk.3.2021.10.19.12.54.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 12:54:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 17/38] gcc: fix missing dependencies for selftests
Date: Tue, 19 Oct 2021 09:53:28 -1000
Message-Id: 
 <5690d18bb6a9a61a81ccd0bc28d1ace4181d1921.1634665675.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634665675.git.steve@sakoman.com>
References: <cover.1634665675.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 19:54:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157222

Building GCC with multiple make jobs appears to trigger a race condition.  The build fails with:

/bin/bash: TOPDIR/tmp/work/x86_64-linux/gcc-cross-i686/9.3.0-r0/gcc-9.3.0/build.x86_64-linux.i686-poky-linux/./gcc/xgcc: No such file or directory

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-9.3.inc         |  1 +
 ...x-missing-dependencies-for-selftests.patch | 45 +++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0040-fix-missing-dependencies-for-selftests.patch

diff --git a/meta/recipes-devtools/gcc/gcc-9.3.inc b/meta/recipes-devtools/gcc/gcc-9.3.inc
index 1c8e3df51d..235576e627 100644
--- a/meta/recipes-devtools/gcc/gcc-9.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-9.3.inc
@@ -69,6 +69,7 @@ SRC_URI = "\
            file://0037-CVE-2019-14250-Check-zero-value-in-simple_object_elf.patch \
            file://0038-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch \
            file://0039-process_alt_operands-Don-t-match-user-defined-regs-o.patch \
+           file://0040-fix-missing-dependencies-for-selftests.patch \
            file://0001-aarch64-New-Straight-Line-Speculation-SLS-mitigation.patch \
            file://0002-aarch64-Introduce-SLS-mitigation-for-RET-and-BR-inst.patch \
            file://0003-aarch64-Mitigate-SLS-for-BLR-instruction.patch \
diff --git a/meta/recipes-devtools/gcc/gcc-9.3/0040-fix-missing-dependencies-for-selftests.patch b/meta/recipes-devtools/gcc/gcc-9.3/0040-fix-missing-dependencies-for-selftests.patch
new file mode 100644
index 0000000000..c8960c6098
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-9.3/0040-fix-missing-dependencies-for-selftests.patch
@@ -0,0 +1,45 @@
+From b19d8aac15649f31a7588b2634411a1922906ea8 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Wed, 3 Jun 2020 12:30:57 -0600
+Subject: [PATCH] Fix missing dependencies for selftests which occasionally
+ causes failed builds.
+
+gcc/
+
+	* Makefile.in (SELFTEST_DEPS): Move before including language makefile
+	fragments.
+	
+Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=b19d8aac15649f31a7588b2634411a1922906ea8]
+Signed-off-by:Steve Sakoman <steve@sakoman.com>
+
+---
+ gcc/Makefile.in | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/gcc/Makefile.in b/gcc/Makefile.in
+index aab1dbba57b..be11311b60d 100644
+--- a/gcc/Makefile.in
++++ b/gcc/Makefile.in
+@@ -1735,6 +1735,10 @@ $(FULL_DRIVER_NAME): ./xgcc$(exeext)
+ 	$(LN_S) $< $@
+ 
+ #
++# SELFTEST_DEPS need to be set before including language makefile fragments.
++# Otherwise $(SELFTEST_DEPS) is empty when used from <LANG>/Make-lang.in.
++SELFTEST_DEPS = $(GCC_PASSES) stmp-int-hdrs $(srcdir)/testsuite/selftests
++
+ # Language makefile fragments.
+ 
+ # The following targets define the interface between us and the languages.
+@@ -2010,8 +2014,6 @@ DEVNULL=$(if $(findstring mingw,$(build)),nul,/dev/null)
+ SELFTEST_FLAGS = -nostdinc $(DEVNULL) -S -o $(DEVNULL) \
+ 	-fself-test=$(srcdir)/testsuite/selftests
+ 
+-SELFTEST_DEPS = $(GCC_PASSES) stmp-int-hdrs $(srcdir)/testsuite/selftests
+-
+ # Run the selftests during the build once we have a driver and the frontend,
+ # so that self-test failures are caught as early as possible.
+ # Use "s-selftest-FE" to ensure that we only run the selftests if the
+-- 
+2.27.0
+
-- 
2.25.1


