Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web12.3164.1619366463980742737
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 09:01:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FHWPnlcU;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 31so6565941pgn.13
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Apr 2021 09:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gI9K9dsFjVg6RCbkU+Mm5oBwIOVDjE/6T4LNIZSHxNk=;
        b=FHWPnlcUMFJSUN3wOEYx6hYVTtJzpntSf+NopWMBaAtnVV5X10pbEaTH6ul2AxbAux
         pfVKUIE3D2t3qtC5eREN3MeexKxmyPdbv2hzBTmdg6eC8dRMKubE5UtX0HD9GwOlpATK
         eGHLsQg9KXbEZrkueqy5iX2/QVWy0Fy78UDBiPms6Ujl2Va2mpCizSmebwSfr6//mLed
         e9pDJgI110jvnisGFO0Z9wSZqZFWxlQil8L8nTHaudUxYzMvOOpisUSpegkCEVsZWO4G
         cn3gMlzhXUEYCwQR+qv/zDfYkEDVu1og1DBZfKKLBP7MS+q25W0GbaRuSWejhG0GMQEh
         on4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gI9K9dsFjVg6RCbkU+Mm5oBwIOVDjE/6T4LNIZSHxNk=;
        b=LGRpcbApLJMSH6z1yprsO3f8Lha5MCzH4Q6E1ZTHd6mnaUc5/EohLzuFLeBHxgZnyi
         4Gef2bYxGoy4aePXDAY5+hUSB52TLdvlXcexN3bra1QzrYK19OV22DmSZ6lYvlcvxh5r
         PMZzQfiloSfsZp0C89EYKV+WGddrZXWp1WlRLG7l6Zrwp6ZXo1HS0T8NGx5R+Qh9+3hW
         ACcJRH5YNZLD9XHCzH+65xkMUbnxDoQz6BtdeiQ/2q5yAP1MvpIhJ5uSaGHvo9rCPn1p
         nAF3f966ICs7/JKmjpOpjaInRoaWc5HNE2pXvxIw+la8L6wwsB33TPIKPTVw7YKs/XCg
         2QMw==
X-Gm-Message-State: AOAM532vb1mpfYAU1XznW007xu/cdMIEk92KzFzwP4exiPolVSCZfc8H
	eIbdak/R6OK/b1HbYgWXMBOWrpShqJIDyw==
X-Google-Smtp-Source: ABdhPJzSfEDh0EuMbfQETlMAMrt36k2OJrJjWpNhYN+u5nmlYI/mw+3t1voG5i8uHLsyfQ4XX7w3cQ==
X-Received: by 2002:a65:5888:: with SMTP id d8mr12596596pgu.23.1619366463102;
        Sun, 25 Apr 2021 09:01:03 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ef3])
        by smtp.gmail.com with ESMTPSA id r11sm8481002pff.192.2021.04.25.09.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Apr 2021 09:01:02 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>
Subject: [PATCH] apt: Fix build on musl when seccomp is enabled
Date: Sun, 25 Apr 2021 09:01:00 -0700
Message-Id: <20210425160100.2731765-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Armin Kuster <akuster808@gmail.com>
---
 ...atat64-and-prlimit64-defines-on-musl.patch | 48 +++++++++++++++++++
 meta/recipes-devtools/apt/apt_2.2.2.bb        |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-devtools/apt/apt/0001-Hide-fstatat64-and-prlimit64-defines-on-musl.patch

diff --git a/meta/recipes-devtools/apt/apt/0001-Hide-fstatat64-and-prlimit64-defines-on-musl.patch b/meta/recipes-devtools/apt/apt/0001-Hide-fstatat64-and-prlimit64-defines-on-musl.patch
new file mode 100644
index 0000000000..f1816836b5
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt/0001-Hide-fstatat64-and-prlimit64-defines-on-musl.patch
@@ -0,0 +1,48 @@
+From e849b161ce1d87ab369b921438abcf5b3a03e186 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 25 Apr 2021 08:57:03 -0700
+Subject: [PATCH] Hide fstatat64 and prlimit64 defines on musl
+
+musl defines fstatat64 and prlimit64 as macros which confuses the
+seccomp sysall rewiring since there are syscalls with same names
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ methods/aptmethod.h | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/methods/aptmethod.h b/methods/aptmethod.h
+index bd50e80..3085aed 100644
+--- a/methods/aptmethod.h
++++ b/methods/aptmethod.h
+@@ -121,6 +121,12 @@ protected:
+       if (ctx == NULL)
+ 	 return _error->FatalE("HttpMethod::Configuration", "Cannot init seccomp");
+ 
++#ifndef __GLIBC__
++#pragma push_macro("fstatat64")
++#pragma push_macro("prlimit64")
++#undef fstatat64
++#undef prlimit64
++#endif
+ #define ALLOW(what)                                                     \
+    if ((rc = seccomp_rule_add(ctx, SCMP_ACT_ALLOW, SCMP_SYS(what), 0))) \
+       return _error->FatalE("HttpMethod::Configuration", "Cannot allow %s: %s", #what, strerror(-rc));
+@@ -320,9 +326,11 @@ protected:
+ 	 if ((rc = seccomp_rule_add(ctx, SCMP_ACT_ALLOW, seccomp_syscall_resolve_name(custom.c_str()), 0)))
+ 	    return _error->FatalE("aptMethod::Configuration", "Cannot allow %s: %s", custom.c_str(), strerror(-rc));
+       }
+-
+ #undef ALLOW
+-
++#ifndef __GLIBC__
++#pragma pop_macro("fstatat64")
++#pragma pop_macro("prlimit64")
++#endif
+       rc = seccomp_load(ctx);
+       if (rc == -EINVAL)
+       {
+-- 
+2.31.1
+
diff --git a/meta/recipes-devtools/apt/apt_2.2.2.bb b/meta/recipes-devtools/apt/apt_2.2.2.bb
index 7d1bce558d..27bc1c75fd 100644
--- a/meta/recipes-devtools/apt/apt_2.2.2.bb
+++ b/meta/recipes-devtools/apt/apt_2.2.2.bb
@@ -12,6 +12,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/apt/${BPN}_${PV}.tar.xz \
            file://0001-CMakeLists.txt-avoid-changing-install-paths-based-on.patch \
            file://0001-srvrec-Keep-support-for-older-resolver.patch \
            file://0001-cmake-Do-not-build-po-files.patch \
+           file://0001-Hide-fstatat64-and-prlimit64-defines-on-musl.patch \
            "
 
 SRC_URI_append_class-native = " \
-- 
2.31.1

