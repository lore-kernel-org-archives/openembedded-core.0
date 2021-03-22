Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web12.1052.1616428298246138719
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Mar 2021 08:51:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=c2W9Cgec;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id q6-20020a17090a4306b02900c42a012202so8738179pjg.5
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Mar 2021 08:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X07tTifdSBkKUMvHnsG5y2BTvWsATzy9TGYhIp30Qi0=;
        b=c2W9CgecRebyxuGkChDOTj+6d3u2TPBvtcuPSOGocBXmWwzZGSY/o5Bruz+pb12b6I
         DPzM2CJRRLeFTQ2t1SrxpIPewSlQ7gEenf/KR/Np1QW3T3fDaeVZl4aURZMbnJRsJ+p6
         Hqznig1HIMTF5C9tHsOcTYj0LRJIu4Gst8N3HlkHvN/MaDfihWdN/qtdO0ClbEjseBPC
         q3wYX1FAK/+FAF6x+Vc5eatwR6L5GPAVeGJdWZPIEdOMHEU+RATEqa6mZu4YgnO++JZJ
         g2naKq2vhsWQcQPi7Kg+eTimdQdzsVVqe48m1kxr1AVp1vx/gKJw9oZEuqdx+z4Vg4eL
         6byQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X07tTifdSBkKUMvHnsG5y2BTvWsATzy9TGYhIp30Qi0=;
        b=TSQtYd+JDgKv2YejMf8GF3PIWp09CfJsCHw5EpayFE8K+TSzeYOJjwn3nG77ohyGer
         oGm6kcoMXDfYTXnzcmOVLgxkSAX8ewBrRBuxk4ELTf1r6SUKdPquRdxy18ki8CdRSWql
         nHLOAAJz8HBdjhnlx1DkhZSUVx75rbD/iUhR4OGEYwPElM1Sj9pudrGsSIK5KsetJZhU
         CAy3j832tv0qv+h9Qs5VGBRjyHWGYfCSUmTW3BfEfcv99CUUocAxp4KfC6OBHOJVyzPp
         8hu5e9wGKEGInzo/FpXB1uo+EcTTumb7T68go6qNKczptI3bvBBsd1VUtz28dwFfkoes
         1UuA==
X-Gm-Message-State: AOAM5324s4kCSCoweANQUuZkt8ngZng7rQjdT7Ar+Dz5SgNEA0P8PZ8Y
	zigTVWLcah2IhS7rFbLgCEaK0FEA0os23Q==
X-Google-Smtp-Source: ABdhPJwpaX09ha3cbgwkEteeLQeT/ywZhKtB+cAKMpIiDeZgtwuOq81ZuybJDQpKbdMKJWdBCZGd2w==
X-Received: by 2002:a17:90a:8408:: with SMTP id j8mr34421pjn.1.1616428297135;
        Mon, 22 Mar 2021 08:51:37 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b117])
        by smtp.gmail.com with ESMTPSA id l22sm16100443pjl.14.2021.03.22.08.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 08:51:36 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] valgrind: Fix ptests on ppc64 LE
Date: Mon, 22 Mar 2021 08:51:33 -0700
Message-Id: <20210322155133.857243-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Backport a patch to avoid lsw/lmw instructions

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ated-PowerPC-insns-aren-t-allowed-on.patch | 62 +++++++++++++++++++
 .../valgrind/valgrind_3.16.1.bb               |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-lmw-lswi-and-related-PowerPC-insns-aren-t-allowed-on.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-lmw-lswi-and-related-PowerPC-insns-aren-t-allowed-on.patch b/meta/recipes-devtools/valgrind/valgrind/0001-lmw-lswi-and-related-PowerPC-insns-aren-t-allowed-on.patch
new file mode 100644
index 0000000000..7c62144978
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-lmw-lswi-and-related-PowerPC-insns-aren-t-allowed-on.patch
@@ -0,0 +1,62 @@
+From 0748ed5403a75c12ad9137b3fabf9d8397206ed8 Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mark@klomp.org>
+Date: Tue, 1 Dec 2020 13:57:39 +0100
+Subject: [PATCH] lmw, lswi and related PowerPC insns aren't allowed on ppc64le
+
+lmw, lswi and related PowerPC insns aren't allowed on ppc64le
+
+Newer binutils produce an error when the assembly contains lmw, stmw,
+lswi, lswx, stswi, or stswx instructions in little-endian mode.
+
+Only build and run the lsw and ldst_multiple testcases on ppc64[be].
+
+https://bugs.kde.org/show_bug.cgi?id=427870
+Upstream-Status: Backport [https://sourceware.org/git/?p=valgrind.git;a=commit;h=74b74174d572fee4015b8f4e326db3cd949bcdc3]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ none/tests/ppc64/Makefile.am          | 9 ++++++---
+ none/tests/ppc64/ldst_multiple.vgtest | 1 +
+ 2 files changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/none/tests/ppc64/Makefile.am b/none/tests/ppc64/Makefile.am
+index 9bc0d0a..9d1e8b7 100644
+--- a/none/tests/ppc64/Makefile.am
++++ b/none/tests/ppc64/Makefile.am
+@@ -54,16 +54,20 @@ EXTRA_DIST = \
+ 
+ check_PROGRAMS = \
+ 	allexec \
+-	lsw jm-insns round \
++	jm-insns round \
+ 	test_isa_2_06_part1 test_isa_2_06_part2 test_isa_2_06_part3 \
+ 	test_dfp1 test_dfp2 test_dfp3 test_dfp4 test_dfp5 \
+ 	test_isa_2_07_part1 test_isa_2_07_part2 \
+ 	test_isa_3_0 \
+ 	subnormal_test \
+-	test_tm test_touch_tm ldst_multiple data-cache-instructions \
++	test_tm test_touch_tm data-cache-instructions \
+ 	power6_mf_gpr std_reg_imm \
+ 	twi_tdi tw_td power6_bcmp
+ 
++# lmw, stmw, lswi, lswx, stswi, stswx compile (and run) only on big endian.
++if VGCONF_PLATFORMS_INCLUDE_PPC64BE_LINUX
++check_PROGRAMS += lsw ldst_multiple
++endif
+ 
+ AM_CFLAGS    += @FLAG_M64@
+ AM_CXXFLAGS  += @FLAG_M64@
+@@ -175,4 +179,3 @@ test_isa_2_07_part2_LDADD = -lm
+ test_tm_LDADD = -lm
+ test_touch_tm_LDADD = -lm
+ test_isa_3_0_LDADD = -lm
+-
+diff --git a/none/tests/ppc64/ldst_multiple.vgtest b/none/tests/ppc64/ldst_multiple.vgtest
+index 87e668e..22dd46c 100644
+--- a/none/tests/ppc64/ldst_multiple.vgtest
++++ b/none/tests/ppc64/ldst_multiple.vgtest
+@@ -1 +1,2 @@
++prereq: ../../../tests/is_ppc64_BE
+ prog: ldst_multiple
+-- 
+2.31.0
+
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
index 9dbd9f74c4..2b1d185575 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
@@ -46,6 +46,7 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://0001-drd-musl-fix.patch \
            file://0001-helgrind-Intercept-libc-functions.patch \
            file://0001-Fix-nlcontrolc.vgtest-hanging-on-newer-glibc-and-or-.patch \
+           file://0001-lmw-lswi-and-related-PowerPC-insns-aren-t-allowed-on.patch \
            "
 SRC_URI[md5sum] = "d1b153f1ab17cf1f311705e7a83ef589"
 SRC_URI[sha256sum] = "c91f3a2f7b02db0f3bc99479861656154d241d2fdb265614ba918cc6720a33ca"
-- 
2.31.0

