Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DD2EC02194
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 16:31:56 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.46059.1738859511591541510
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 08:31:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bnGh7QMI;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21f464b9a27so10021685ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 08:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738859511; x=1739464311; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RkaXflAdcBE41rtA16mXo4zgtbjy/PPpfiejcEmhS88=;
        b=bnGh7QMInh6wr12nT0T6m+nounbdgmmOKRFkUWEXtRIMANLewlus0+Oyeyh1fR3gFm
         cHzijNhjRJi7MsMIAAnvhgzys+BmMGaBIn5s20NiLVkNGrHLtfIVYmOLO2IzrzNeYvbO
         Y3l8xoeh6QIWW8xmFXDcQbVsD3NY3OaQxQAHRMPpEYfvpj+SCsIXPHTQ4Ppc1ouSb5lC
         VwVX01iALoxJLU4OdJ9Cd4s8cHubrZKvHGk2pncr9Ur7h5T5BJbL0T5UbpCxS3//phr6
         r/+BGcooPCI7Yr2IUs16g2AJSm0R7xyxzaQy7XgZQRFH8Qse0RJhrIpHA7qs0ixbVywu
         2a6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738859511; x=1739464311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RkaXflAdcBE41rtA16mXo4zgtbjy/PPpfiejcEmhS88=;
        b=lZA292Ze5C6S5UBDWs8Todq/WeJ0hZmxLK/r0A8/NjjfoI44PHN3ZdHicMJEYEjeCu
         7lHLuSjUJre4ZllMdNsKJLWKPhDpTa5+Sb9FiydkYMC7yT/2sjVQBeGsuzI3TxAIiaec
         k8qpSbDQX81jBmo5brzeMjAYtrhh4Lt1MWHyoMvAMM/GlQOzzLIVljUlCkazUmm4Zciu
         WfoL6aJ7mLYpMUK+n3UFNAa7mN4+J2qlZLuP60ZAo6Q6okbWpBqUbEX4bRWznKfXaoWR
         3Ha8hASrNJwrjzIVCOMgBm35Q+FisTr5xquD7K22Szvzu+8Ost8y6ePAHncKVI9RKAs4
         lA1Q==
X-Gm-Message-State: AOJu0YzBNx1/1NvabSs10Cy523XGbnmFsiXBKO+ifA9Sa63uTwcj8MIQ
	OKqZrnLdKiRUU6bjelmmS+BeRrqeuYzIU1EwZu9D4/M1dQ3SQgSG5gd9twLN
X-Gm-Gg: ASbGncuBKM79vqduiEuUy4Zm/H2LIDgNF8NrPZIsXEU1X63QhoC/QIlSZovXT/bAuOd
	rdVamAWNK6fjuZ0J6l5wNYlf1b2MhvzuxrAZZZjpTyBgJbafxyosbB0NRdiUrpow2wRLtS296Tt
	Ae9IzF239ZyYo1IfDV4KhXwCU1uHD01Y+lrSISWSDBckyD2qBx8cqJxEhYoMPHnz0CD3WSVJ7PE
	l0ISPrmpQIe96Y7bjkfx86KYW8qDPst50ou8eBaJKQdQVZIP4t9s+0p/mgLJkYhbIErEm3EpRmp
	UWmssJQ=
X-Google-Smtp-Source: AGHT+IF8nTIz8AMnjfozKqVjwTgeqGVZmxwLNRXD4X2q5rBVsNtfvHSN3MKwBHmdjJzwMbA5CocRVw==
X-Received: by 2002:a05:6a21:6010:b0:1ea:e93d:7574 with SMTP id adf61e73a8af0-1ee03a41bb9mr132128637.18.1738859510767;
        Thu, 06 Feb 2025 08:31:50 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::f923])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad51af78167sm1341577a12.73.2025.02.06.08.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 08:31:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] mpfr: Fix build with glibc 2.41
Date: Thu,  6 Feb 2025 08:31:48 -0800
Message-ID: <20250206163148.2719087-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 16:31:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210950

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...o-use-predefined-_Float128-definitio.patch | 44 +++++++++++++++++++
 meta/recipes-support/mpfr/mpfr_4.2.1.bb       |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-support/mpfr/mpfr/0001-include-math.h-to-use-predefined-_Float128-definitio.patch

diff --git a/meta/recipes-support/mpfr/mpfr/0001-include-math.h-to-use-predefined-_Float128-definitio.patch b/meta/recipes-support/mpfr/mpfr/0001-include-math.h-to-use-predefined-_Float128-definitio.patch
new file mode 100644
index 00000000000..0dcbdce0db3
--- /dev/null
+++ b/meta/recipes-support/mpfr/mpfr/0001-include-math.h-to-use-predefined-_Float128-definitio.patch
@@ -0,0 +1,44 @@
+From 4f2af1afce6edb4ba1dfc9bb4849c9f300efe213 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 26 Dec 2024 19:44:12 -0800
+Subject: [PATCH] include math.h to use predefined _Float128 definition
+
+glibc has added this patch [1] which defines __HAVE_FLOAT128 for clang
+therefore include math.h to avoid defining _Float128 during configure if
+not needed.
+
+Fixes
+cannot combine with previous '__float128' declaration specifier
+
+[1] https://sourceware.org/git/?p=glibc.git;a=blobdiff;f=sysdeps/x86/bits/floatn.h;h=ba030d270a73c71f166083b30dbaf89371ff49fa;hp=e661abaea469b8b916fd312cc42382ad4c5e220f;hb=d773aff467840f5ed305e40c180466e90bd88183;hpb=b2556550a0f952b2a841a0b4bddc999c2df1b233
+
+Upstream-Status: Submitted [https://sympa.inria.fr/sympa/arc/mpfr/2024-12/msg00001.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ acinclude.m4 | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/acinclude.m4 b/acinclude.m4
+index 3d7910517..65c4eb9fd 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -805,8 +805,9 @@ dnl the "undefined reference" error disappear.
+ if test "$enable_float128" != no; then
+    AC_MSG_CHECKING(if _Float128 with hex constants is supported)
+    AC_LINK_IFELSE([AC_LANG_PROGRAM([[]], [[
+-volatile _Float128 x = 0x1.fp+16383f128;
+-return x == 0;
++     #include <math.h>
++     volatile _Float128 x = 0x1.fp+16383f128;
++     return x == 0;
+ ]])],
+       [AC_MSG_RESULT(yes)
+        AC_DEFINE([MPFR_WANT_FLOAT128],1,[Build float128 functions])],
+@@ -816,6 +817,7 @@ dnl Use the q suffix in this case.
+        AC_LINK_IFELSE([AC_LANG_PROGRAM([[
+ #define _Float128 __float128
+ ]], [[
++#include <math.h>
+ volatile _Float128 x = 0x1.fp+16383q;
+ return x == 0;
+ ]])],
diff --git a/meta/recipes-support/mpfr/mpfr_4.2.1.bb b/meta/recipes-support/mpfr/mpfr_4.2.1.bb
index 9558eab8280..423ac46783c 100644
--- a/meta/recipes-support/mpfr/mpfr_4.2.1.bb
+++ b/meta/recipes-support/mpfr/mpfr_4.2.1.bb
@@ -14,6 +14,7 @@ CVE_PRODUCT = "gnu_mpfr"
 DEPENDS = "gmp autoconf-archive-native"
 
 SRC_URI = "https://www.mpfr.org/mpfr-${PV}/mpfr-${PV}.tar.xz"
+SRC_URI += "file://0001-include-math.h-to-use-predefined-_Float128-definitio.patch"
 SRC_URI[sha256sum] = "277807353a6726978996945af13e52829e3abd7a9a5b7fb2793894e18f1fcbb2"
 
 UPSTREAM_CHECK_URI = "http://www.mpfr.org/mpfr-current/"

