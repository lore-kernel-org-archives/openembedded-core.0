Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CC77C7EE23
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 06:50:12 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.2717.1685083808409638770
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 May 2023 23:50:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=G8DhnGAj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-309382efe13so176311f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 23:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685083806; x=1687675806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rnfJOGlUak2SLDIgcRRO811h/jipw5LitCPgC1W6NrM=;
        b=G8DhnGAj5/hxYTEytX1uw25UCctY0AXKnwcbwh7SYI6cSkF65iUL/WaG0uDEtQ9rSc
         ei0bFzQ499pkH+vRC5tEvlG5cnLszs+oGz7DKX75+jcvfi9z6/kTgIzkupSE3nG7PxRv
         L/8lMwIWexqG6hnIKpl6wVuP/C84H5FFUJn0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685083806; x=1687675806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rnfJOGlUak2SLDIgcRRO811h/jipw5LitCPgC1W6NrM=;
        b=QO0fBGM8KlMeHsZ89IFJRYuiv3SlNl2GDtBPPz/Mu1YrNFuriT9n1YN89oqIWtUc2o
         uvlZERI2D7JMXIvEAi4T72aBqQqKZUHk5Fq7fT4XtLbr94inv8p5S33wFha1L//9Lx0B
         di8fc/wNAkbKrTGKDH/TITd7G1Ld65y7sAUY6WHM8mWUtsWBfdB5utK5R/ayDtSiKNKo
         2TIKSI3HEEpO+x0oBPYpuJuTjVvO81OlHMoX9bJ95XVDhqMEiqIHysr0MYQpf0aHboT/
         2WExreQB3QzkT6803q22lbCCaGLBs4KawsFNrKWHkBHSZtTI0/NN/nDXf92Bquz01Dfx
         3RrQ==
X-Gm-Message-State: AC+VfDyAJ1gwv0/r8RTTZ43O/VBYT7D6ofWz9zM62ZmWXGS3S3D91A2K
	uQnolirw8KmGyC/fFX1DkcXEKZ8ImpQO+h9Le4s=
X-Google-Smtp-Source: ACHHUZ4O7yRVRcv838eiP+a6mCN2vemzc4oA8c6+49l6O+tSCAUYZ8pwMk57QQjRMVUasLet57Dxbg==
X-Received: by 2002:a5d:4101:0:b0:30a:9c8c:161b with SMTP id l1-20020a5d4101000000b0030a9c8c161bmr482206wrp.65.1685083806310;
        Thu, 25 May 2023 23:50:06 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:fb7f:e528:bcc3:c3ef])
        by smtp.gmail.com with ESMTPSA id c11-20020adfe74b000000b0030630120e56sm1221501wrn.57.2023.05.25.23.50.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 23:50:05 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] lttng-tools: Add patch to fix gcc 13 test issue
Date: Fri, 26 May 2023 07:50:05 +0100
Message-Id: <20230526065005.2817075-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 06:50:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181761

Add a couple of patches from upstream which fix a failing test with gcc 13.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...a4a793c81221a28f822d07135069456ea021.patch |  48 ++++++++
 .../lttng/lttng-tools/gcc13-ptest-fix.patch   | 107 ++++++++++++++++++
 .../lttng/lttng-tools_2.13.9.bb               |   2 +
 3 files changed, 157 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/40b2a4a793c81221a28f822d07135069456ea021.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/gcc13-ptest-fix.patch

diff --git a/meta/recipes-kernel/lttng/lttng-tools/40b2a4a793c81221a28f822d07135069456ea021.patch b/meta/recipes-kernel/lttng/lttng-tools/40b2a4a793c81221a28f822d07135069456ea021.patch
new file mode 100644
index 00000000000..e338eaff2b1
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-tools/40b2a4a793c81221a28f822d07135069456ea021.patch
@@ -0,0 +1,48 @@
+From 40b2a4a793c81221a28f822d07135069456ea021 Mon Sep 17 00:00:00 2001
+From: Olivier Dion <odion@efficios.com>
+Date: Fri, 10 Mar 2023 13:17:46 -0500
+Subject: [PATCH] Tests: fix: parse-callback reports missing addr2line
+MIME-Version: 1.0
+Content-Type: text/plain; charset=utf8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Backport
+
+addr2line from binutils is required for this script to work correctly.
+However, it silently fails. Fix this by using `subprocess.run' with
+`check=True' instead of `subprocess.getoutput'. That way, an exception
+is raised if an error occurs.
+
+Fix the shebang by not assuming where python is installed while at it.
+
+Change-Id: I5157b3dbccf6bfbe08a6b6840b38f5db9010fe96
+Signed-off-by: Olivier Dion <odion@efficios.com>
+Signed-off-by: JÃ©rÃ©mie Galarneau <jeremie.galarneau@efficios.com>
+---
+ tests/utils/parse-callstack.py | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/tests/utils/parse-callstack.py b/tests/utils/parse-callstack.py
+index 3bfddd9ef..c3f0e2e9b 100755
+--- a/tests/utils/parse-callstack.py
++++ b/tests/utils/parse-callstack.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python3
++#!/usr/bin/env python3
+ #
+ # Copyright (C) 2017 Francis Deslauriers <francis.deslauriers@efficios.com>
+ #
+@@ -24,7 +24,9 @@ def addr2line(executable, addr):
+     # Expand inlined functions
+     cmd += ['--addresses', addr]
+ 
+-    addr2line_output = subprocess.getoutput(' '.join(cmd))
++    status = subprocess.run(cmd, stdout=subprocess.PIPE, check=True)
++
++    addr2line_output = status.stdout.decode("utf-8")
+ 
+     # Omit the last 2 lines as the caller of main can not be determine
+     fcts = [addr2line_output.split()[-2]]
+-- 
+2.34.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-tools/gcc13-ptest-fix.patch b/meta/recipes-kernel/lttng/lttng-tools/gcc13-ptest-fix.patch
new file mode 100644
index 00000000000..52c4ec9f8ef
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-tools/gcc13-ptest-fix.patch
@@ -0,0 +1,107 @@
+From 844be4dc46deeec83199da80e9e2a6058e9f5a53 Mon Sep 17 00:00:00 2001
+From: =?utf8?q?J=C3=A9r=C3=A9mie=20Galarneau?=
+ <jeremie.galarneau@efficios.com>
+Date: Thu, 25 May 2023 19:15:20 -0400
+Subject: [PATCH] Tests fix: test_callstack: output of addr2line incorrectly
+ parsed
+MIME-Version: 1.0
+Content-Type: text/plain; charset=utf8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Backport
+
+Issue observed
+--------------
+
+The test_callstack test fails with GCC 13.1 with the following output:
+
+  Traceback (most recent call last):
+  File "/usr/lib/lttng-tools/ptest/tests/regression/././kernel//../../utils/parse-callstack.py", line 160, in <module>
+  main()
+  File "/usr/lib/lttng-tools/ptest/tests/regression/././kernel//../../utils/parse-callstack.py", line 155, in main
+  raise Exception('Expected function name not found in recorded callstack')
+  Exception: Expected function name not found in recorded callstack
+  ok 10 - Destroy session callstack
+  PASS: kernel/test_callstack 10 - Destroy session callstack
+  not ok 11 - Validate userspace callstack
+  FAIL: kernel/test_callstack 11 - Validate userspace callstack
+
+Cause
+-----
+
+parse-callstack.py uses 'split()' to split the lines of addr2line's
+output. By default, 'split()' splits a string on any whitespace.
+Typically this was fine as addr2line's output doesn't contain spaces and
+the function then splits on new lines.
+
+Typical output of addr2line:
+
+  $ addr2line -e ./tests/regression/kernel//../../utils/testapp/gen-syscall-events-callstack/gen-syscall-events-callstack --functions --addresses 0x40124B
+  0x000000000040124b
+  my_gettid
+  /tmp/test-callstack-master/src/lttng-tools/tests/utils/testapp/gen-syscall-events-callstack/gen-syscall-events-callstack.c:40
+
+However, with the test app compiled using gcc 13.1, a "discriminator"
+annotation is present:
+
+  0x0000000000401279
+  fct_b
+  /tmp/test-callstack-master/src/lttng-tools/tests/utils/testapp/gen-syscall-events-callstack/gen-syscall-events-callstack.c:58 (discriminator 1)
+
+Hence, by selecting the second to last element (-2, with negative
+indexing), the addr2line function returns '(discriminator' as the
+function name.
+
+Solution
+--------
+
+The parsing code is changed to simply iterate on groups of 3 lines,
+following addr2line's output format.
+
+Fixes #1377
+
+Change-Id: I8c1eab97e84ca7cad171904bed6660540061cf08
+Signed-off-by: JÃ©rÃ©mie Galarneau <jeremie.galarneau@efficios.com>
+---
+ tests/utils/parse-callstack.py | 25 +++++++++++++++++--------
+ 1 file changed, 17 insertions(+), 8 deletions(-)
+
+diff --git a/tests/utils/parse-callstack.py b/tests/utils/parse-callstack.py
+index c3f0e2e9bc..029100b618 100755
+--- a/tests/utils/parse-callstack.py
++++ b/tests/utils/parse-callstack.py
+@@ -26,14 +26,23 @@ def addr2line(executable, addr):
+ 
+     status = subprocess.run(cmd, stdout=subprocess.PIPE, check=True)
+ 
+-    addr2line_output = status.stdout.decode("utf-8")
+-
+-    # Omit the last 2 lines as the caller of main can not be determine
+-    fcts = [addr2line_output.split()[-2]]
+-
+-    fcts = [ f for f in fcts if '??' not in f]
+-
+-    return fcts
++    addr2line_output = status.stdout.decode("utf-8").splitlines()
++    # addr2line's output is made of 3-tuples:
++    #   - address
++    #   - function name
++    #   - source location
++    if len(addr2line_output) % 3 != 0:
++        raise Exception('Unexpected addr2line output:\n\t{}'.format('\n\t'.join(addr2line_output)))
++
++    function_names = []
++    for address_line_number in range(0, len(addr2line_output), 3):
++        function_name = addr2line_output[address_line_number + 1]
++
++        # Filter-out unresolved functions
++        if "??" not in function_name:
++            function_names.append(addr2line_output[address_line_number + 1])
++
++    return function_names
+ 
+ def extract_user_func_names(executable, raw_callstack):
+     """
+-- 
+2.34.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.13.9.bb b/meta/recipes-kernel/lttng/lttng-tools_2.13.9.bb
index 58c0378d66f..113720ca5cb 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.13.9.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.13.9.bb
@@ -37,6 +37,8 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://lttng-sessiond.service \
            file://disable-tests.patch \
            file://0001-compat-Define-off64_t-as-off_t-on-linux.patch \
+           file://40b2a4a793c81221a28f822d07135069456ea021.patch \
+           file://gcc13-ptest-fix.patch \
            "
 
 SRC_URI[sha256sum] = "8d94dc95b608cf70216b01203a3f8242b97a232db2e23421a2f43708da08f337"
-- 
2.39.2


