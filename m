Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.486.1621543745645629775
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 May 2021 13:49:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dL/uwBIi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id y14so16881587wrm.13
        for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 13:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=mSNdJ5FNhqQ5LveNIxOUOqgRA2SkSvoe3Q9QAszWkYE=;
        b=dL/uwBIiupVfa+jnS9TDd8tvCM1LKYb+Bv344bOF8yy+FNgyEiPlIi3Gao4RRI8tbz
         QZPVjrKyNEZGGSetu+ecbSSNrbc+L1Oyw444mkpGzTl1UAWhIpoYiaMKyPq9s49tdRun
         smvGmHNig7v8RZIZ4xaus6t90n2HDHz35Qaus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mSNdJ5FNhqQ5LveNIxOUOqgRA2SkSvoe3Q9QAszWkYE=;
        b=bUslHmBuZISMhN2ATi3SFwfW6J9CYK8FkUKE58Sso0F6vlrHLH1rzdJOL0ptVE78mn
         56ighCAKGnWsO4LTHwYmOFD228orC/HaV4Av4oPmlyUHiKAlKhPeW8ILVZeFuiYiuBvL
         2p9I/JWXRV7swM/Zagi76WKEh0d/0Jbakw9PPMW0nIdH6wu7lQgEuqMenteq7d5+spAl
         0K3wxFRsHzolZDklZgQ2xtS+PRkV258TQn/A98MTRyRRSHyJFyprknCSC1xMeCZu8KGM
         3Tzb+73ZLXTdW2JP1Hf9UH5Ty92S9sHd7JnUpfxdCIWdEHBNLBsFCxmV8EGeGXBjrR/U
         tIaw==
X-Gm-Message-State: AOAM5315aOOdArUidnpmzsFiyyteXCp1e0opA/aKPUoE4+WE3ru0T6Mk
	Akn/3bQgN9UnXuaU7QQT8j5yhLwN5/mW5A==
X-Google-Smtp-Source: ABdhPJyVhooMbegD2ZbXWnRgmt2vi36qVTI3CE85IFfmSl8DU4Zlf2E2hsxYzdVZuGrELIQXnGamoQ==
X-Received: by 2002:a05:6000:184a:: with SMTP id c10mr6403949wri.244.1621543743919;
        Thu, 20 May 2021 13:49:03 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:c394:d896:3913:6568])
        by smtp.gmail.com with ESMTPSA id n189sm3768061wme.9.2021.05.20.13.49.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 13:49:03 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott] [PATCH 02/28] glibc: Add 8GB VM usage cap for usermode test suite
Date: Thu, 20 May 2021 21:48:36 +0100
Message-Id: <20210520204902.2527687-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
References: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
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

