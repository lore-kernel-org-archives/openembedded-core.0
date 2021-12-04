Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16733C433F5
	for <webhook@archiver.kernel.org>; Sat,  4 Dec 2021 07:13:36 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.22335.1638602014592993823
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 23:13:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f/DRzoco;
 spf=pass (domain: gmail.com, ip: 209.85.221.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id t9so10514192wrx.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 23:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=66e+jzh960mR2MFQBWSar+yVAKZomRYJAdQn4MdjCT4=;
        b=f/DRzocond4EVqemkVLhALxQx7Rt571yMSgTI/6xQWL4gY8UsfesLHbZfVLeWbXAu5
         usQKByijUVxdqp2pzg/x2nZQ0J/qZuiY7ES3oyNW3+cjlVBJFh9WYTg2SXAPktmyXt5V
         9d8rsMEJ8jjRNdAJcDnoLtdz53wyASxM0fSlcQ/C7dCchLGqqQby0JR4W3iHCvjzhPoQ
         awckEQ6JYjQ+9Jq3nTnwM6E/JdqKllJJrsi7JNwNJHTRXXC8swhCENIx/hyd5oCeyGq3
         TFLP2CdvAafkt+Nx1KCwYoV5748U0YTPEA1WQIsi+IQRhJa2kN36DD7jk/LqR/X4h/zj
         qHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=66e+jzh960mR2MFQBWSar+yVAKZomRYJAdQn4MdjCT4=;
        b=fnGZmyb7dMzpvpENYULgHRS1i8EAz7IZGQHUqheVDljQqlu4Y8lLzaPUYjbRuMMYjj
         JKVQt2tUxkoLikEFkl7LiLC3VSYGiDLKh6AlwL+I6FgZy3IexmXVwYsmOj4AKx994Ot5
         /S33lxjqvAv7iSQlXp1auQG/hD14MroJBbaak1mcSWpQBH7olIOM3CjWUWkv6rzJAA2n
         0QAYn68pI6aiS/3+UwlACCle4ym2Be2/OH2/m4tqqExCiYJ3zCCU/l6bZ2jokPDHJvTC
         Kw9w4FEFtf1Q8psDJBLVqo5qs+juNO5ohFtXqHh6Lx+wk7w1IAC8juWUEtUkZHh3Ropp
         Ls5Q==
X-Gm-Message-State: AOAM531fGFa3ae0t0QZqPyuZLnkGa+h7tr+trvLiwhB63IJmbeybbgVC
	cMuRycy4YfLrPSGqRtgM3bYC3JldiG1erA==
X-Google-Smtp-Source: 
 ABdhPJxnn6lrh2No5MdV+WY8NU0Rmb2/YDa8YOsM1vvz2uqMSulj2uCXG0TRnnwSXSBs/SfbsSVGFw==
X-Received: by 2002:adf:fb0c:: with SMTP id
 c12mr29231100wrr.614.1638602013042;
        Fri, 03 Dec 2021 23:13:33 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 y15sm5837992wry.72.2021.12.03.23.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 23:13:32 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 08/26] valgrind: remove unneeded patch
Date: Sat,  4 Dec 2021 08:13:05 +0100
Message-Id: <20211204071323.2480163-8-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211204071323.2480163-1-alex@linutronix.de>
References: <20211204071323.2480163-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Dec 2021 07:13:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159155

Whatever the issues were all those years ago,
current valgrind builds ok on qemux86_64 and qemuppc.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...t-fail-to-build-on-some-PPC32-config.patch | 51 -------------------
 .../valgrind/valgrind_3.18.1.bb               |  1 -
 2 files changed, 52 deletions(-)
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-Remove-tests-that-fail-to-build-on-some-PPC32-config.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-Remove-tests-that-fail-to-build-on-some-PPC32-config.patch b/meta/recipes-devtools/valgrind/valgrind/0001-Remove-tests-that-fail-to-build-on-some-PPC32-config.patch
deleted file mode 100644
index a78e1953ff..0000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0001-Remove-tests-that-fail-to-build-on-some-PPC32-config.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 9762fd23e1f1db66d4b977c694a17d3bca3fe99a Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 8 Jan 2016 16:36:29 +0200
-Subject: [PATCH] Remove tests that fail to build on some PPC32 configurations
-
-Failures are documented here:
-http://errors.yoctoproject.org/Errors/Search/?items=10&query=862d702fbb99e484631315aa44b9e46f8fc567da&filter=valgrind&type=recipe
-
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-Upstream-Status: Pending
----
- memcheck/tests/ppc32/Makefile.am | 2 +-
- none/tests/ppc32/Makefile.am     | 4 ++--
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/memcheck/tests/ppc32/Makefile.am b/memcheck/tests/ppc32/Makefile.am
-index 26b95a2..8f05743 100644
---- a/memcheck/tests/ppc32/Makefile.am
-+++ b/memcheck/tests/ppc32/Makefile.am
-@@ -10,7 +10,7 @@ EXTRA_DIST = $(noinst_SCRIPTS) \
- 	power_ISA2_07.stderr.exp power_ISA2_07.vgtest
- 
- check_PROGRAMS = \
--	power_ISA2_05 power_ISA2_07
-+	power_ISA2_07
- 
- power_ISA2_05_CFLAGS = $(AM_CFLAGS) $(WERROR) -Winline -Wall -Wshadow -g \
- 		-I$(top_srcdir)/include @FLAG_M32@
-diff --git a/none/tests/ppc32/Makefile.am b/none/tests/ppc32/Makefile.am
-index 196239e..0fe3425 100644
---- a/none/tests/ppc32/Makefile.am
-+++ b/none/tests/ppc32/Makefile.am
-@@ -50,13 +50,13 @@ EXTRA_DIST = \
- 
- check_PROGRAMS = \
- 	allexec \
--	lsw jm-insns round \
-+	lsw \
- 	test_isa_2_06_part1 test_isa_2_06_part2 test_isa_2_06_part3 \
- 	test_dfp1 test_dfp2 test_dfp3 test_dfp4 test_dfp5 \
- 	test_isa_2_07_part1 test_isa_2_07_part2 \
- 	test_tm test_touch_tm ldst_multiple data-cache-instructions \
- 	test_fx test_gx \
--	testVMX twi tw xlc_dbl_u32 power5+_round power6_bcmp \
-+	twi tw xlc_dbl_u32 power6_bcmp \
- 	bug129390-ppc32 bug139050-ppc32 \
- 	ldstrev mftocrf mcrfs
- 
--- 
-2.6.4
-
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.18.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.18.1.bb
index 6fc2f36868..e825f83d5c 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.18.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.18.1.bb
@@ -21,7 +21,6 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://taskset_nondeterministic_tests \
            file://0004-Fix-out-of-tree-builds.patch \
            file://0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch \
-           file://0001-Remove-tests-that-fail-to-build-on-some-PPC32-config.patch \
            file://use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch \
            file://avoid-neon-for-targets-which-don-t-support-it.patch \
            file://valgrind-make-ld-XXX.so-strlen-intercept-optional.patch \
-- 
2.20.1


