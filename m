Received: from mail-io1-f66.google.com (mail-io1-f66.google.com [209.85.166.66])
 by mx.groups.io with SMTP id smtpd.web10.1062.1595353935122909917
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2020 10:52:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TeT5W7+h;
 spf=pass (domain: gmail.com, ip: 209.85.166.66, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f66.google.com with SMTP id v6so22355433iob.4
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2020 10:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ws3YHW+1qp7oCOFZWYIeThx/PyFsm3W3wlZM4kbqjTI=;
        b=TeT5W7+hyRAdfx+4xpuzNzdeEyvA8ElF/DGTyPTU1qjX0V1CUQkP0UKsBgQgfrkmYF
         XrsDpHgyeGn27m3kq/+R8TF2m1m3VokuZyM1xgGlrUXx7zqU9tcfkbGT9Z5sisWXUQ8E
         oCZLibqxvmxiDbgpwmfI3w05PbD4HByxElkjzvM8mPSbYkTnkDti4Rr2ybQ17i3QhgtQ
         Wr3ALxS557T5JVAgkhL3GreGPVbme8w+cWCSHdV0xAdTg9x5LZp9bAdsAbgi+U1i42/O
         cwnfYug84mxir/stpI3GVdHoSrD27O6IQ59GfuikwP9Wl9b27zPHotBgBAZ9ww+XA/2T
         Z+fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ws3YHW+1qp7oCOFZWYIeThx/PyFsm3W3wlZM4kbqjTI=;
        b=a4iPrQNx0EuqseyAfys5kFpF6NsWZYZRLv6jxGN/8eBU01DuBKEUx+w4Lt5t/s2/c8
         6VfVsFTR5LlNL4h8sdUqmHBAT/53+OdrTF1425Km7Qzdm1BHguRW+EK+GNiWQwNx1FF0
         hr3AfcB+WmIQAUUcGEXMWFgNvGtoPooq+tYGhp2Ti4+gC2MHWtaV+MlGwD/lq0ZAx7ye
         i0auDgCYpiWSR8FutNyiqVDP4sOsw7QLr1lgng7mCaOqq8XCxExWynS8ZzNMrIphtcLC
         +J1prCoQgCM0Z7ji1zAUG2lr94WnMlSg2MMa2tlzXLOmXIEKSmQ2chxwnYM4tYET9VNL
         nABg==
X-Gm-Message-State: AOAM5300V0Prj/YHbaZAkDpKrJYllnPSOHZ8Tt3kVFwRF2WdhZPQU4lo
	Y5ZXqPy+cnoN6fw0fME1UwJVzEVWB/k=
X-Google-Smtp-Source: ABdhPJwq8aJmf5et04ho8jdfFxfeCXUde2w8Bw8ARNtJBLu7IB+QYXZhwnnfnL78Vo8M2UKZeKFekw==
X-Received: by 2002:a6b:6211:: with SMTP id f17mr29856918iog.34.1595353934196;
        Tue, 21 Jul 2020 10:52:14 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:c183:1b34:3163:7b15])
        by smtp.gmail.com with ESMTPSA id v5sm10840720ios.54.2020.07.21.10.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 10:52:13 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] classes/cmake: Fix host detection
Date: Tue, 21 Jul 2020 12:52:11 -0500
Message-Id: <20200721175211.11208-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes the class to use HOST_OS and HOST_ARCH to set the cmake SYSTEM
variables. The HOST variables should be used instead of
TARGET_OS/TARGET_ARCH because we want to control how cmake compiles for
where the package is going to run (the host), not what it will be
generating output for (the target). The distinction is only really
relevant when building canadian cross recipes.

Also fix up the host OS detection to account for MinGW by setting
CMAKE_SYSTEM_NAME to "Windows". This eliminates the need for meta-mingw
to patch this in all the cmake recipes it builds.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/cmake.bbclass | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 94ed8061bb..8243f7ce8c 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -70,15 +70,22 @@ CMAKE_BUILD_PARALLEL_LEVEL_task-install = "${@oe.utils.parallel_make(d, True)}"
 OECMAKE_TARGET_COMPILE ?= "all"
 OECMAKE_TARGET_INSTALL ?= "install"
 
+def map_host_os_to_system_name(host_os):
+    if host_os.startswith('mingw'):
+        return 'Windows'
+    if host_os.startswith('linux'):
+        return 'Linux'
+    return host_os
+
 # CMake expects target architectures in the format of uname(2),
 # which do not always match TARGET_ARCH, so all the necessary
 # conversions should happen here.
-def map_target_arch_to_uname_arch(target_arch):
-    if target_arch == "powerpc":
+def map_host_arch_to_uname_arch(host_arch):
+    if host_arch == "powerpc":
         return "ppc"
-    if target_arch == "powerpc64":
+    if host_arch == "powerpc64":
         return "ppc64"
-    return target_arch
+    return host_arch
 
 cmake_do_generate_toolchain_file() {
 	if [ "${BUILD_SYS}" = "${HOST_SYS}" ]; then
@@ -88,8 +95,8 @@ cmake_do_generate_toolchain_file() {
 # CMake system name must be something like "Linux".
 # This is important for cross-compiling.
 $cmake_crosscompiling
-set( CMAKE_SYSTEM_NAME `echo ${TARGET_OS} | sed -e 's/^./\u&/' -e 's/^\(Linux\).*/\1/'` )
-set( CMAKE_SYSTEM_PROCESSOR ${@map_target_arch_to_uname_arch(d.getVar('TARGET_ARCH'))} )
+set( CMAKE_SYSTEM_NAME ${@map_host_os_to_system_name(d.getVar('HOST_OS'))} )
+set( CMAKE_SYSTEM_PROCESSOR ${@map_host_arch_to_uname_arch(d.getVar('HOST_ARCH'))} )
 set( CMAKE_C_COMPILER ${OECMAKE_C_COMPILER} )
 set( CMAKE_CXX_COMPILER ${OECMAKE_CXX_COMPILER} )
 set( CMAKE_C_COMPILER_LAUNCHER ${OECMAKE_C_COMPILER_LAUNCHER} )
-- 
2.27.0

