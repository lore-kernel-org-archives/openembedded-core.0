Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.223.1602101959945357565
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2020 13:19:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Kh0e7qdd;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id m15so1582477pls.8
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2020 13:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xXE1l1axSQdCPx12jPSFdSQHl81MzcP8MUpJ0CaWto4=;
        b=Kh0e7qddhWTAVElx8om9s6ZgeOe/uaumxR0U2t8O669+nz55QwKqUdcpuyr/u/QlH/
         2L6EGXydj2TvlHBNu2BPyJXPS2WgAOQol+RfoksIK5iQXxX92isPdMBBGzZ+59+0WtvP
         NdJd2shMBtytu96r3/rl+4O5VsgAohmyMzv3hzSzaQ3UF9nvW4Q4c0WLhbR0Al5g9EOk
         CqetEDfjo6wSvD3MKkLhLBrp/6mAo8GhdCANWX7LomuBf5XNzpKTres8rXSfNRpm0Bpn
         ITlxeaxOkr/RDmf5CklXZMM2Ta3uuIG+t1TSEGlJxAVynGlDupY7DRSuZHqI6upQbB7e
         ikpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xXE1l1axSQdCPx12jPSFdSQHl81MzcP8MUpJ0CaWto4=;
        b=R86Y7a7zl3r//eYDFJVaHHH2gyUX51mVCcBe7Jai5ABI0YKHqSzgbRUdQ1xwSKkgYa
         C+M+zh6C5ex+08mirIF2DLj/PC8KAlCXFdbnZJ1UQFVPFV7VnaSRca29g7SHh27iVYON
         3UIE0bsgZZrmtI6Pk0YiEVRKqBd9IA3BzQUnYP+VBY66KUIyPyKxtBmrC6DMuZv+RCl5
         RsYipXmbW6RJ8RgKVnZr0k5zMyABM8wldzIyMQMM8SF8jE9E5TURjFbUeltRt/1oGfFl
         43pnL+HtJ1YgBf0WRyPOHai7Ne9YN0jGw1VZjJ+MJK3ltRCEWPPnq2P6GU9XIX7WUJ18
         hFQg==
X-Gm-Message-State: AOAM531bgkpbg60WvIYCXih88Lj0sf8s5yXrDR3EwJ+DD3xelSNXcnlI
	UCdDr9y3s1l2IYyaJyvTAhU+IN6l2ZTqWg==
X-Google-Smtp-Source: ABdhPJy0Ya+bWD+raz1s3aeZR+OQi7zNc4CuciHQRp5Cd8Lh52ht0nSx5UHfEBCHriWyU+EUWwdAgQ==
X-Received: by 2002:a17:902:b696:b029:d2:1ebe:d80c with SMTP id c22-20020a170902b696b02900d21ebed80cmr4301047pls.18.1602101959003;
        Wed, 07 Oct 2020 13:19:19 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4467])
        by smtp.gmail.com with ESMTPSA id d6sm3275603pjz.12.2020.10.07.13.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 13:19:18 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] strace: Fix value of IPPROTO_MAX
Date: Wed,  7 Oct 2020 13:19:15 -0700
Message-Id: <20201007201915.2354067-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This should also fix build with musl

../strace-5.8/xlat/inet_protocols.h:239:1: error: static assertion failed: "IPPROTO_MAX != 256"
  239 | static_assert((IPPROTO_MAX) == (256), "IPPROTO_MAX != 256");
      | ^~~~~~~~~~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix typo should be 263 instead of 253

 ...PROTO_MAX-last-in-IPPROTO_-constants.patch | 70 +++++++++++++++++++
 meta/recipes-devtools/strace/strace_5.8.bb    |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-devtools/strace/strace/0001-xlat-Mark-IPPROTO_MAX-last-in-IPPROTO_-constants.patch

diff --git a/meta/recipes-devtools/strace/strace/0001-xlat-Mark-IPPROTO_MAX-last-in-IPPROTO_-constants.patch b/meta/recipes-devtools/strace/strace/0001-xlat-Mark-IPPROTO_MAX-last-in-IPPROTO_-constants.patch
new file mode 100644
index 0000000000..cd53f33f60
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/0001-xlat-Mark-IPPROTO_MAX-last-in-IPPROTO_-constants.patch
@@ -0,0 +1,70 @@
+From 387d3b6fba95cb47c4dacc6bcd330148a9168850 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 7 Oct 2020 12:54:03 -0700
+Subject: [PATCH] xlat: Mark IPPROTO_MAX last in IPPROTO_* constants
+
+* xlat/inet_protocols.in (IPPROTO_MAX): It should be the last entry
+  after adding IPPROTO_MPTCP this should have new value as
+  IPPROTO_MPTCP + 1.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Submitted [https://lists.strace.io/pipermail/strace-devel/2020-October/010253.html]
+---
+ xlat/inet_protocols.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/xlat/inet_protocols.in
++++ b/xlat/inet_protocols.in
+@@ -32,5 +32,5 @@ IPPROTO_UDPLITE		136
+ IPPROTO_MPLS		137
+ IPPROTO_ETHERNET	143
+ IPPROTO_RAW		255
+-IPPROTO_MAX		256
+ IPPROTO_MPTCP		262
++IPPROTO_MAX		263
+--- a/xlat/inet_protocols.h
++++ b/xlat/inet_protocols.h
+@@ -234,19 +234,19 @@ DIAG_POP_IGNORE_TAUTOLOGICAL_COMPARE
+ #else
+ # define IPPROTO_RAW 255
+ #endif
+-#if defined(IPPROTO_MAX) || (defined(HAVE_DECL_IPPROTO_MAX) && HAVE_DECL_IPPROTO_MAX)
++#if defined(IPPROTO_MPTCP) || (defined(HAVE_DECL_IPPROTO_MPTCP) && HAVE_DECL_IPPROTO_MPTCP)
+ DIAG_PUSH_IGNORE_TAUTOLOGICAL_COMPARE
+-static_assert((IPPROTO_MAX) == (256), "IPPROTO_MAX != 256");
++static_assert((IPPROTO_MPTCP) == (262), "IPPROTO_MPTCP != 262");
+ DIAG_POP_IGNORE_TAUTOLOGICAL_COMPARE
+ #else
+-# define IPPROTO_MAX 256
++# define IPPROTO_MPTCP 262
+ #endif
+-#if defined(IPPROTO_MPTCP) || (defined(HAVE_DECL_IPPROTO_MPTCP) && HAVE_DECL_IPPROTO_MPTCP)
++#if defined(IPPROTO_MAX) || (defined(HAVE_DECL_IPPROTO_MAX) && HAVE_DECL_IPPROTO_MAX)
+ DIAG_PUSH_IGNORE_TAUTOLOGICAL_COMPARE
+-static_assert((IPPROTO_MPTCP) == (262), "IPPROTO_MPTCP != 262");
++static_assert((IPPROTO_MAX) == (263), "IPPROTO_MAX != 263");
+ DIAG_POP_IGNORE_TAUTOLOGICAL_COMPARE
+ #else
+-# define IPPROTO_MPTCP 262
++# define IPPROTO_MAX 263
+ #endif
+ 
+ #ifndef XLAT_MACROS_ONLY
+@@ -353,12 +353,12 @@ static const struct xlat_data inet_proto
+  XLAT(IPPROTO_RAW),
+  #define XLAT_VAL_32 ((unsigned) (IPPROTO_RAW))
+  #define XLAT_STR_32 STRINGIFY(IPPROTO_RAW)
+- XLAT(IPPROTO_MAX),
+- #define XLAT_VAL_33 ((unsigned) (IPPROTO_MAX))
+- #define XLAT_STR_33 STRINGIFY(IPPROTO_MAX)
+  XLAT(IPPROTO_MPTCP),
+- #define XLAT_VAL_34 ((unsigned) (IPPROTO_MPTCP))
+- #define XLAT_STR_34 STRINGIFY(IPPROTO_MPTCP)
++ #define XLAT_VAL_33 ((unsigned) (IPPROTO_MPTCP))
++ #define XLAT_STR_33 STRINGIFY(IPPROTO_MPTCP)
++ XLAT(IPPROTO_MAX),
++ #define XLAT_VAL_34 ((unsigned) (IPPROTO_MAX))
++ #define XLAT_STR_34 STRINGIFY(IPPROTO_MAX)
+ };
+ const struct xlat inet_protocols[1] = { {
+  .data = inet_protocols_xdata,
diff --git a/meta/recipes-devtools/strace/strace_5.8.bb b/meta/recipes-devtools/strace/strace_5.8.bb
index 70d5940f60..0415588b97 100644
--- a/meta/recipes-devtools/strace/strace_5.8.bb
+++ b/meta/recipes-devtools/strace/strace_5.8.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://ptest-spacesave.patch \
            file://uintptr_t.patch \
            file://0001-strace-fix-reproducibilty-issues.patch \
+           file://0001-xlat-Mark-IPPROTO_MAX-last-in-IPPROTO_-constants.patch \
            "
 SRC_URI[sha256sum] = "df4a669f7fff9cc302784085bd4b72fab216a426a3f72c892b28a537b71e7aa9"
 
-- 
2.28.0

