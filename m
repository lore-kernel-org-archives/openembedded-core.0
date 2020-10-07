Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.62.1602101481602541137
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2020 13:11:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fqoKDbtf;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id j33so2199005pgj.5
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2020 13:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=51NeytPx5rgtkAoTNYncFYKWpBAvXVPYiKeDmlg/+Qw=;
        b=fqoKDbtfxMrBMZ9TkZcFVyiu6N3+7bSMn1R/NxQCQLM/3TdkDhfw3ZDrCw51S3BMTO
         EHV2UhRqV7frv4hNGh4+fG/Pj0+LzT4hbMQJMY682otVKDoCG/ruuTFW8ynRi51I3uYa
         imNjlR3N8wa1+bWdYqGfJ14CLUSlO3Q4X9YOf8BW7NR17OlGUzZa0tSG8mHnkXbX38Pi
         JTyszJW1OLXyYgOI2xEY4yRbbNFS5zDYJI9gX4qt1fVU9/hOGhi0ifbWd4Z7P9D3PDpS
         fAd1Q5nYpcJR+B3t1Qggg6EsXqfKwfwz93b7yVW/xfbH4DguJ8n9lGswDfeLJmXUFU4X
         gSWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=51NeytPx5rgtkAoTNYncFYKWpBAvXVPYiKeDmlg/+Qw=;
        b=IHf7+hGmZAgQ83puxAVNNhbQoEmw7ZBWCl0/DD4CBWdrfLEDplWOv02/b/A/kG4a9j
         p4Y6n7wvmJeUlc6XiRv5CuPJT7bxQEPr0nP8Q8c848rxe4e/WNoevVe6iswUiu4ZcErM
         QNJWELID4R0dW8kNwGvSXgsFPcmay92r4QzM3Uq/WS8I5bcII8H04XGnF/EgMDXApj+z
         MLn/7Fw7jLtuYGXdrjDSpb4clMgsTxBotCEl5XLTTUuM5s59gUu76nhjfyLRKbP9p0py
         BfAeDRqTIpy0t8fu2JhV7ADpj0FTxZIUwNqNcVNf9ktd8mIIOC2cjI6iS4Vfe465MmjU
         xdeQ==
X-Gm-Message-State: AOAM532CkQg5rHtpjVhYPyZFK2maxsVV4e55VsBjgKRPjQu+whEu6seM
	sB5uJujN1ami+JsZGr/HheouOlAtSi32HQ==
X-Google-Smtp-Source: ABdhPJzKbk8nCzzC2egLz/VOfSRFh7a6se9zR6xD62nK9Ll7fp9ss91vfHj/rBOW1VcmM7YuL8YaFw==
X-Received: by 2002:a17:90a:d311:: with SMTP id p17mr4339185pju.135.1602101480390;
        Wed, 07 Oct 2020 13:11:20 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4467])
        by smtp.gmail.com with ESMTPSA id o20sm4658038pgh.63.2020.10.07.13.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 13:11:19 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] strace: Fix value of IPPROTO_MAX
Date: Wed,  7 Oct 2020 13:11:17 -0700
Message-Id: <20201007201117.2252038-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This should also fix build with musl

../strace-5.8/xlat/inet_protocols.h:239:1: error: static assertion failed: "IPPROTO_MAX != 256"
  239 | static_assert((IPPROTO_MAX) == (256), "IPPROTO_MAX != 256");
      | ^~~~~~~~~~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...PROTO_MAX-last-in-IPPROTO_-constants.patch | 70 +++++++++++++++++++
 meta/recipes-devtools/strace/strace_5.8.bb    |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-devtools/strace/strace/0001-xlat-Mark-IPPROTO_MAX-last-in-IPPROTO_-constants.patch

diff --git a/meta/recipes-devtools/strace/strace/0001-xlat-Mark-IPPROTO_MAX-last-in-IPPROTO_-constants.patch b/meta/recipes-devtools/strace/strace/0001-xlat-Mark-IPPROTO_MAX-last-in-IPPROTO_-constants.patch
new file mode 100644
index 0000000000..f5632b77fd
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
+Upstream-Status: Submitted [https://lists.strace.io/pipermail/strace-devel/2020-October/thread.html]
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
++IPPROTO_MAX		253
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
++static_assert((IPPROTO_MAX) == (253), "IPPROTO_MAX != 253");
+ DIAG_POP_IGNORE_TAUTOLOGICAL_COMPARE
+ #else
+-# define IPPROTO_MPTCP 262
++# define IPPROTO_MAX 253
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

