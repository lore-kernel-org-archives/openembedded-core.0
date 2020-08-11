Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.12387.1597143705636552954
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2020 04:01:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=X2xhJi3J;
 spf=pass (domain: burtonini.com, ip: 209.85.221.66, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f66.google.com with SMTP id a14so11062243wra.5
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2020 04:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2mzrSYSFKEXTaQqdRpFO24s3VcY0wedruaZ4PoOhFkE=;
        b=X2xhJi3JTtQS+1Mz6aRgEYkHAPtvPjtLgahujevk6BVhcaXKyGcNz2wLTQDtgnX76P
         c9PNJIUSVdINdSzPzQtKgnxFgLU2IqY860rue3jd351M5wLa+rgCMnepFGqF3YR+sgz8
         c+mcfJF7vc0Sb7E5zwB+hud+qhS1n45mUecPErz4333epjcn+RRQPQewhj4gCM3JAlDp
         8kTPTuoy+J4s2/TEYGZGrYwYdzKuedtEVl/CLP4M9YqhOvlbq8MwD3eMdkqLcoQrnihc
         pq9NhzJhRWJhqWCt6v3gmwgBP1f7aEEEP38ELaM7xxWiJm0BfbUAzWeM+M8w7mxM3iIy
         MzBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2mzrSYSFKEXTaQqdRpFO24s3VcY0wedruaZ4PoOhFkE=;
        b=hFRwD1ZBU4Vgsa8wUQUfUEygyGzF/XY2kRWLyLpQU6anBmk1X8CtMFL0iAUMtB5lNo
         5YcSxVfxvsI1PiwtO7617dYJiyETESZgFQ4CvTePpcisrDyychZ/QDxBZHfCw4+5vtFA
         FttCBUulydzCmgJWW8go/f2nik2snWAH/gt/nmIirVTovW3USuNPZjI1Y+U/+3URCrYW
         6+UWdOBNSn/1V0FwBP9yH5YObevaWZIC7xE1eYuscu4+xbpQ9OSM8F51eYNXcNmzb1Az
         btrZBN+2aXyAFt5Ey9GJcsAWxGp4cHPwu4vNByxT8HD241M/7JzCtN8JiLqurT9+fJbm
         hFdg==
X-Gm-Message-State: AOAM533BU39agZwepKfduDNjZQYjhWicUlDL1LgBROBvK3TGtH2VNiBx
	olVYrA/WCMvUaq7vvM+MSGSMy1FiParpXg==
X-Google-Smtp-Source: ABdhPJyKgHTTl9oqPiQMg6nAogu6CHZy90x85NxDWPRPJP+nGn2vWy3jHYlXOtVvYQa0Kd+rfSJELg==
X-Received: by 2002:adf:edc3:: with SMTP id v3mr5637053wro.193.1597143703646;
        Tue, 11 Aug 2020 04:01:43 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id t25sm4353290wmj.18.2020.08.11.04.01.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 04:01:42 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gcc: backport a fix for out-of-line atomics on aarch64
Date: Tue, 11 Aug 2020 12:01:40 +0100
Message-Id: <20200811110140.1506395-1-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/gcc/gcc-10.1.inc        |  1 +
 ...-up-__aarch64_cas16_acq_rel-fallback.patch | 66 +++++++++++++++++++
 2 files changed, 67 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-10.1/0001-aarch64-Fix-up-__aarch64_cas16_acq_rel-fallback.patch

diff --git a/meta/recipes-devtools/gcc/gcc-10.1.inc b/meta/recipes-devtools/gcc/gcc-10.1.inc
index 5f310301b0..e8b0c61aae 100644
--- a/meta/recipes-devtools/gcc/gcc-10.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-10.1.inc
@@ -70,6 +70,7 @@ SRC_URI = "\
            file://0002-aarch64-Introduce-SLS-mitigation-for-RET-and-BR-inst.patch \
            file://0003-aarch64-Mitigate-SLS-for-BLR-instruction.patch \
            file://pr96130.patch \
+           file://0001-aarch64-Fix-up-__aarch64_cas16_acq_rel-fallback.patch \
 "
 SRC_URI[sha256sum] = "b6898a23844b656f1b68691c5c012036c2e694ac4b53a8918d4712ad876e7ea2"
 
diff --git a/meta/recipes-devtools/gcc/gcc-10.1/0001-aarch64-Fix-up-__aarch64_cas16_acq_rel-fallback.patch b/meta/recipes-devtools/gcc/gcc-10.1/0001-aarch64-Fix-up-__aarch64_cas16_acq_rel-fallback.patch
new file mode 100644
index 0000000000..c060accd99
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-10.1/0001-aarch64-Fix-up-__aarch64_cas16_acq_rel-fallback.patch
@@ -0,0 +1,66 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From fd2ec4542fd2975e6d3f2f1c1a2639945a84f9e1 Mon Sep 17 00:00:00 2001
+From: Jakub Jelinek <jakub@redhat.com>
+Date: Mon, 3 Aug 2020 22:55:28 +0200
+Subject: [PATCH] aarch64: Fix up __aarch64_cas16_acq_rel fallback
+
+As mentioned in the PR, the fallback path when LSE is unavailable writes
+incorrect registers to the memory if the previous content compares equal
+to x0, x1 - it writes copy of x0, x1 from the start of function, but it
+should write x2, x3.
+
+2020-08-03  Jakub Jelinek  <jakub@redhat.com>
+
+	PR target/96402
+	* config/aarch64/lse.S (__aarch64_cas16_acq_rel): Use x2, x3 instead
+	of x(tmp0), x(tmp1) in STXP arguments.
+
+	* gcc.target/aarch64/pr96402.c: New test.
+
+(cherry picked from commit 90b43856fdff7d96d93d22970eca8a86c56e0ddc)
+---
+ gcc/testsuite/gcc.target/aarch64/pr96402.c | 16 ++++++++++++++++
+ libgcc/config/aarch64/lse.S                |  2 +-
+ 2 files changed, 17 insertions(+), 1 deletion(-)
+ create mode 100644 gcc/testsuite/gcc.target/aarch64/pr96402.c
+
+diff --git a/gcc/testsuite/gcc.target/aarch64/pr96402.c b/gcc/testsuite/gcc.target/aarch64/pr96402.c
+new file mode 100644
+index 00000000000..fa2dddfac15
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/aarch64/pr96402.c
+@@ -0,0 +1,16 @@
++/* PR target/96402 */
++/* { dg-do run { target int128 } } */
++/* { dg-options "-moutline-atomics" } */
++
++int
++main ()
++{
++  __int128 a = 0;
++  __sync_val_compare_and_swap (&a, (__int128) 0, (__int128) 1);
++  if (a != 1)
++    __builtin_abort ();
++  __sync_val_compare_and_swap (&a, (__int128) 1, (((__int128) 0xdeadbeeffeedbac1ULL) << 64) | 0xabadcafe00c0ffeeULL);
++  if (a != ((((__int128) 0xdeadbeeffeedbac1ULL) << 64) | 0xabadcafe00c0ffeeULL))
++    __builtin_abort ();
++  return 0;
++}
+diff --git a/libgcc/config/aarch64/lse.S b/libgcc/config/aarch64/lse.S
+index 64691c601c1..c8fbfbce4fd 100644
+--- a/libgcc/config/aarch64/lse.S
++++ b/libgcc/config/aarch64/lse.S
+@@ -203,7 +203,7 @@ STARTFN	NAME(cas)
+ 	cmp		x0, x(tmp0)
+ 	ccmp		x1, x(tmp1), #0, eq
+ 	bne		1f
+-	STXP		w(tmp2), x(tmp0), x(tmp1), [x4]
++	STXP		w(tmp2), x2, x3, [x4]
+ 	cbnz		w(tmp2), 0b
+ 1:	ret
+ 
+-- 
+2.26.2
+
-- 
2.26.2

