Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.10211.1621424921922821338
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 May 2021 04:48:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AJupPF73;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id z130so7120916wmg.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 May 2021 04:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mSNdJ5FNhqQ5LveNIxOUOqgRA2SkSvoe3Q9QAszWkYE=;
        b=AJupPF73dPHzOk5CO3M4zBmO0PC6zmmAqL4gpWoAKQGlQLUGShJwWczDmSTeqha78/
         hEixyYiLNdVimyc7Qh/i/imNhaEAFzvB6q4o6EHD39ufMcPwfyoQuwAYovMr0yrdHyDT
         C5lnWk3zIc9/Lkg6p313Fy55C0+meyFfZ1HyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mSNdJ5FNhqQ5LveNIxOUOqgRA2SkSvoe3Q9QAszWkYE=;
        b=W+k8OL/HaOzlzfXl7x5IxVHy34QOUnQoaekntMpHgMHQuZXoIQK4XSuA/CIllNuNM1
         UXK2j9rLWgxAZZwSjuLMRahjN/Kf2dgUCJoUMy+ZdWeTwxF1hnscYFFR3RVKXDJGyAWy
         +W9QYpT/O5FtXUA02zG2ahRSPzhQTBuRsmR3tYket1DwAtaxBzkK7+F6cDt6wEY0/Pf3
         NmMJK0HSKKhY9giwSslawiUi38EmkOU5XFX2RFKl0yiWDRlJs4D73NnMCMHwkel0tSO2
         k2XYdrgVwXhrfHFEBMrmX6rrR3BmKeFr+kDM3XtFvhlutUmAyKKVhOuRowqInDM+DCUO
         K02g==
X-Gm-Message-State: AOAM5317myu9jJOHn+I6YXnInvLU8KECTIQNMENVoyc9MMWX7nv1ymYJ
	6glk/RVXeohWYsPc5NFnOdqOGMq9XZz8/A==
X-Google-Smtp-Source: ABdhPJzhhmgW4c9FYfASTXve097BcId/l7DiRyJdGsD2Zbw9QZWpEdvC1MCpALi80IVRQZtpk1JcMA==
X-Received: by 2002:a05:600c:218c:: with SMTP id e12mr10775022wme.16.1621424920067;
        Wed, 19 May 2021 04:48:40 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:5a03:58fe:8897:9b3])
        by smtp.gmail.com with ESMTPSA id m20sm672754wmi.5.2021.05.19.04.48.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 04:48:39 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] glibc: Add 8GB VM usage cap for usermode test suite
Date: Wed, 19 May 2021 12:48:39 +0100
Message-Id: <20210519114839.2488672-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We've noticed that:

MACHINE=qemuarm oe-selftest -r glibc.GlibcSelfTest.test_glibc

ends up with one process growing to about the size of system memory
and triggering the OOM killer. This has been taking out other builds
running on the system on the autobuilders and is one cause of our
intermittent failures.

This was tracked down to:

WORKDIR=XXX/tmp/work/armv7vet2hf-neon-poky-linux-gnueabi/glibc-testsuite/2.33-r0
BUILDDIR=$WORKDIR/build-arm-poky-linux-gnueabi QEMU_SYSROOT=$WORKDIR/recipe-sysroot
QEMU_OPTIONS="$WORKDIR/recipe-sysroot-native/usr/bin/qemu-arm -r 3.2.0" \
$WORKDIR/check-test-wrapper user env GCONV_PATH=$BUILDDIR/iconvdata LOCPATH=$BUILDDIR/localedata LC_ALL=C $BUILDDIR/elf/ld-linux-armhf.so.3 \
    --library-path $BUILDDIR:$BUILDDIR/math:$BUILDDIR/elf:$BUILDDIR/dlfcn:$BUILDDIR/nss:$BUILDDIR/nis:$BUILDDIR/rt:$BUILDDIR/resolv:$BUILDDIR/mathvec:$BUILDDIR/support:$BUILDDIR/nptl \
    $BUILDDIR/nptl/tst-pthread-timedlock-lockloop

although other glibc tests appear to use 16GB of memory before failing
anyway. By capping the VM size to 8GB, we see the same number of failures
but no OOM situations. There may be some issue in qemu or the test which
could be improved to avoid this entirely but this provides a necessary
and useful safeguard to other builds and doensn't appear to make the
situation worse.

On a loaded system OOM may not occur as the test timeout may be triggered
first. An experiment with a 5GB limit showed an additional 7 failures.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/glibc/glibc/check-test-wrapper | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc/check-test-wrapper b/meta/recipes-core/glibc/glibc/check-test-wrapper
index f8e04e02d21..6ec9b9b29eb 100644
--- a/meta/recipes-core/glibc/glibc/check-test-wrapper
+++ b/meta/recipes-core/glibc/glibc/check-test-wrapper
@@ -2,6 +2,7 @@
 import sys
 import os
 import subprocess
+import resource
 
 env = os.environ.copy()
 args = sys.argv[1:]
@@ -44,6 +45,14 @@ if targettype == "user":
     qemuargs += ["-L", sysroot]
     qemuargs += ["-E", "LD_LIBRARY_PATH={}".format(":".join(libpaths))]
     command = qemuargs + args
+
+    # We've seen qemu-arm using up all system memory for some glibc
+    # tests e.g. nptl/tst-pthread-timedlock-lockloop
+    # Cap at 8GB since no test should need more than that
+    # (5GB adds 7 failures for qemuarm glibc test run)
+    limit = 8*1024*1024*1024
+    resource.setrlimit(resource.RLIMIT_AS, (limit, limit))
+
 elif targettype == "ssh":
     host = os.environ.get("SSH_HOST", None)
     user = os.environ.get("SSH_HOST_USER", None)
-- 
2.30.2

