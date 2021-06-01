Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.58336.1622557144294111629
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jun 2021 07:19:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=VXLD2xZq;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id h12-20020a17090aa88cb029016400fd8ad8so2026107pjq.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jun 2021 07:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=u4YJBDjs8wFQb5CVXWlKzQMzzD1ImWIfGrjbClfT+Fg=;
        b=VXLD2xZq6YlFSSQd8chy8kH5FS9lUbdc0rTsbkDx9z1Jnc10DLGdueGQYEN6fx284k
         FMH3z+l+Z1GXsJ6DqPQJSst9LDLjB7NDQloJhoCrP9GCUNdH0u21MVEn3rYg0SC2TJLi
         87ZUyRvATsRJoJ/jWH0lpewgHl/IqNj7suEmBMHVzuX3UNGmd6pCevz4WMPOfEaFurGJ
         6nBIGAaZvH/tIMIN6otxPGN0aXxZVxIhpjnySp8lt34lP/YJwQKxu2chxhGi7Em0qbui
         eKGW2LnMQJK7SOEcPBYw9J64s1dJfHbbMp3lO6QI9BSWeeXVawMBTvyPRZ4ehsUtKONW
         5NLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u4YJBDjs8wFQb5CVXWlKzQMzzD1ImWIfGrjbClfT+Fg=;
        b=qP/W9LMBjZIWSgK9DmCSvqMQFaX80rsiMIkepyjfxA4pPCzTyGm6LVcOcSMHy1saci
         2d1Uf3InQvjePYYUGgZZ+Wnk3nvsjYclIlcu0dJ6ouOM0TZAgHK1OQQVDpoxfugVc9Db
         PdMeKlUxeJ0rclwuwLeRjYVqHGGJWflnUblVNi7QZLQXMuQwCRZwYpaeVodZElJvxhCG
         LJp62K1WiIH7rrM76i8j1xup5PIQ1AtC0al0G7ncsEey1kDPg3TkUFji2hMjvLNQSqvr
         3JmVLcQ0kTgK4VHjbfo8A45q2/f9ee1UuzznJ7FEMOeDMR+7f16A1hXJ+ZSoSSoxm4/s
         QEzg==
X-Gm-Message-State: AOAM530RZjv2DTvc2DbTR0dpRW7GMAU3yNkrNUkuhQrQ4l/hUAmGPn05
	CioNdWzCvXxnpVslYVAo1ICrZsTAUdDtnMIlj6E=
X-Google-Smtp-Source: ABdhPJzOf59j3dp73eq3SeHFzSHhYtx0MVJKd9lqTShx0fFg5k3lh0Gt2QTt8AKZ0w0fTUBnJvXiWA==
X-Received: by 2002:a17:902:7d83:b029:105:8b10:629e with SMTP id a3-20020a1709027d83b02901058b10629emr8772464plm.0.1622557143324;
        Tue, 01 Jun 2021 07:19:03 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id bb18sm2307875pjb.44.2021.06.01.07.19.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 07:19:02 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/26] glibc: Add 8GB VM usage cap for usermode test suite
Date: Tue,  1 Jun 2021 04:18:03 -1000
Message-Id: <4926a16d4fc075ea486536427e99dd6dcaace583.1622556919.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1622556919.git.steve@sakoman.com>
References: <cover.1622556919.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

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
(cherry picked from commit 58d4f669bd46805669daf87626350fe9359feca5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc/check-test-wrapper | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc/check-test-wrapper b/meta/recipes-core/glibc/glibc/check-test-wrapper
index f8e04e02d2..6ec9b9b29e 100644
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
2.25.1

