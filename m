Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web08.5149.1615533990255799030
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 23:26:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=V75MkgZw;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id a188so1258428pfb.4
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Mar 2021 23:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w66urxq6f49AdmHPgLTKIfpRJrEEuZjep+Z7ODfqoXg=;
        b=V75MkgZwsb6tPgcqq1mARplPuufzwkIKR5p2Xbo9GQzlMhi70Le4uR7kWfEvUgLKJ+
         6maqymgdC9gNNr1D0oINDXIiH6Y1o3RS2N34N/L7DbgaAY+DOPkRXGv/4j8KCf7qOYyR
         t/Mqs2wRyzPKP4jv782dFSfpMtNP3sCLJrc0dvX5x4MM25z9vMUk/aD7gqiRPQjFwBgd
         JtYXCmEwjfVSvV+rsUWhGkoybPIhcQbKC3l6edHbwZDbyYNP8TH91S83zVEjCX5vCbW7
         OI8/NbeVkBqiasTUrs9qyS9jh5lApvRpOxRPMOcoqcl2Qhmzs86jyi7JuvHrm9liXfii
         GuPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w66urxq6f49AdmHPgLTKIfpRJrEEuZjep+Z7ODfqoXg=;
        b=OImvKIPILorIIwqyJjVQwpR7sN7HgyNtUIxBiEjovH00+xX7WZdVmmT4ujxJRwxu0K
         3IFgsrMPQ0EM0Mv97V7lVfSR+IQza92R/ktI6edCDrLExV9KgxjI5C3pfWAEXLDVQxdS
         STwfXqhZyw4p7GupX3izxcANeU99wK2uB+YCBp8ruClIESxrmmtzKj2zU150Tzp5PjtG
         nakFxgCxGnDAJW3dJ275jPJqrAC9hwSQUU9bq9H9lETX82IpowIvSvl+5bbQ41k6thqJ
         092Ta4LJ69MkWllDBOH/AWHiuiwzm/U7FCYxLY71BFfJ6q7+2rin5zafCk4NyIK4Ze5m
         K6HQ==
X-Gm-Message-State: AOAM533B2s4x5+W7R15sZ5u0jGDan7ZEXjT597tbWy2dRU+2ICLcp2sX
	zqUCQ358ZkuG7+VNUNZNzXTaYNmgcJH0dw==
X-Google-Smtp-Source: ABdhPJxIWbCqG3NqTQOKQ03v+xxEtRjnkqWxviYtz7RuB4h1t8nTbJvHHCb0AfkcTWZOzBLPxBTPNw==
X-Received: by 2002:a63:4f57:: with SMTP id p23mr10496264pgl.281.1615533989313;
        Thu, 11 Mar 2021 23:26:29 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::c2dd])
        by smtp.gmail.com with ESMTPSA id t6sm1196667pjs.26.2021.03.11.23.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 23:26:28 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] libunwind: Link with libucontext on musl
Date: Thu, 11 Mar 2021 23:26:25 -0800
Message-Id: <20210312072625.1667879-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Functions like unw_getcontext in libunwind call getcontext() which are
not part of musl C library like glibc, however there is a supplimental
library providing these functions called libucontext, therefore link
libunwind with a static version of this library to resolve such symbols,
this inturn helps packages needing libunwind, who look for certain
APIs in libunwind during configure e.g. heaptrack

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/libunwind/libunwind.inc      | 1 +
 meta/recipes-support/libunwind/libunwind_1.5.0.bb | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-support/libunwind/libunwind.inc b/meta/recipes-support/libunwind/libunwind.inc
index 76a1bf6246..17ba151933 100644
--- a/meta/recipes-support/libunwind/libunwind.inc
+++ b/meta/recipes-support/libunwind/libunwind.inc
@@ -4,6 +4,7 @@ HOMEPAGE = "http://www.nongnu.org/libunwind"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d80c8ed4062b8339b715f90fa68cc9f"
 DEPENDS += "libatomic-ops"
+DEPENDS_append_libc-musl = " libucontext"
 
 inherit autotools multilib_header
 
diff --git a/meta/recipes-support/libunwind/libunwind_1.5.0.bb b/meta/recipes-support/libunwind/libunwind_1.5.0.bb
index 887a35708e..6392cac5c9 100644
--- a/meta/recipes-support/libunwind/libunwind_1.5.0.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.5.0.bb
@@ -25,3 +25,4 @@ COMPATIBLE_HOST_riscv32 = "null"
 LDFLAGS += "-Wl,-z,relro,-z,now ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
 SECURITY_LDFLAGS_append_libc-musl = " -lssp_nonshared"
+CACHED_CONFIGUREVARS_append_libc-musl = " LDFLAGS='${LDFLAGS} -lucontext'"
-- 
2.30.2

