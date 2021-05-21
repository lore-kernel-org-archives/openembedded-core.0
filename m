Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.11844.1621615194664872826
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 May 2021 09:39:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MjxMxatS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id f20-20020a05600c4e94b0290181f6edda88so847916wmq.2
        for <openembedded-core@lists.openembedded.org>; Fri, 21 May 2021 09:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8TmJS0u0t8nGfDWLmgZ3u33G2slLq9qchp0R8ShmF98=;
        b=MjxMxatSIW2FFq33X8DBPw6+sC3HvU09LNuf6w6IwqaQxFbFGGZNSg+3uaIbxu3r8K
         RnfIm0Tb8JYBIL9vrVr9ptf4eA+NxUHVO2g0fwOGIFFJsMSByIiE53jsfgcGw0TOU04w
         OJLVCGmjyumO11uTaI60jh7Hr7JyLyAD+OGwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8TmJS0u0t8nGfDWLmgZ3u33G2slLq9qchp0R8ShmF98=;
        b=U53d++DgAu0kEJMosbWp4F/lyxTKel4S0sUu17/Gl1XEnSP5mG5Eck2dh/vTrNaBAh
         WObmZJqVrMyCpGPQscvM0ItSjyyG+B/QSkuaoVGQcbm4j6FBpSbxLI7jAcrgQCnAEwWU
         BSDVczm/yAt5aRqfUg5MGgNgpwGqvcXS8fetOLYndqfHDvZ1fvPux6XK+FpMzOwXbc5X
         llPJ9xXoJFnKlQkGJj1qsjXjimrkp1e3QdjfcwkFgFeLW/sC1LU2WmhJ5uDfp3J23QFd
         xXDTD2jAMrZO9rl0ekRxSXQiwiUIt15s879kTxqwlEUR+NfNwivJhFw5+MxddtKAULCk
         ZDKA==
X-Gm-Message-State: AOAM533rCNghOVhnAMI+39sB8xftnKKl4/ZbpZBTOgEXuFClqjqEjB27
	EXpulyiydy0v7nJZdVnXM0p6e4QF5tFebQ==
X-Google-Smtp-Source: ABdhPJwIfcudrkHvL9uIMay7cLyKtnFJCPjAjVz2+rc6CAkekHXS5UC0HmkEdzLg7fwTLkW//5TCOA==
X-Received: by 2002:a05:600c:2256:: with SMTP id a22mr9696332wmm.138.1621615192841;
        Fri, 21 May 2021 09:39:52 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:c394:d896:3913:6568])
        by smtp.gmail.com with ESMTPSA id 10sm100818wmi.7.2021.05.21.09.39.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 09:39:52 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] ltp: Disable problematic tests causing autobuilder hangs
Date: Fri, 21 May 2021 17:39:51 +0100
Message-Id: <20210521163951.2582671-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We've seen three hangs in cgroup_xattr and two in proc01 so far. The new
plan is just to disable any tests seen to hang. I've had enough of these
causing problems on our testing infrastructure.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../ltp/ltp/disable_hanging_tests.patch       | 45 +++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20210121.bb     |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/disable_hanging_tests.patch

diff --git a/meta/recipes-extended/ltp/ltp/disable_hanging_tests.patch b/meta/recipes-extended/ltp/ltp/disable_hanging_tests.patch
new file mode 100644
index 00000000000..113ac0fefec
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/disable_hanging_tests.patch
@@ -0,0 +1,45 @@
+This patch disables tests which we've found "hang" on our infrastructure.
+
+cgroup_xattr:
+https://autobuilder.yoctoproject.org/typhoon/#/builders/95/builds/1926 (x86)
+https://autobuilder.yoctoproject.org/typhoon/#/builders/95/builds/1898 (x86)
+https://autobuilder.yoctoproject.org/typhoon/#/builders/95/builds/1916 (x86)
+
+proc01:
+https://autobuilder.yoctoproject.org/typhoon/#/builders/96/builds/1748 (arm)
+https://autobuilder.yoctoproject.org/typhoon/#/builders/96/builds/1781 (arm)
+(in the latter was trying to read /proc/kmsg)
+(the above test looks horrible anyway)
+
+Upstream-Status: Inappropriate [OE Configuration]
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: git/runtest/controllers
+===================================================================
+--- git.orig/runtest/controllers
++++ git/runtest/controllers
+@@ -352,8 +352,6 @@ cpuset_memory_spread	cpuset_memory_sprea
+ 
+ cpuset_regression_test cpuset_regression_test.sh
+ 
+-cgroup_xattr	cgroup_xattr
+-
+ pids_1_1 pids.sh 1 1 0
+ pids_1_2 pids.sh 1 2 0
+ pids_1_10 pids.sh 1 10 0
+Index: git/runtest/fs
+===================================================================
+--- git.orig/runtest/fs
++++ git/runtest/fs
+@@ -64,11 +64,6 @@ writetest01	writetest
+ #Also run the fs_di (Data Integrity tests)
+ fs_di fs_di -d $TMPDIR
+ 
+-# Read every file in /proc. Not likely to crash, but does enough
+-# to disturb the kernel. A good kernel latency killer too.
+-# Was not sure why it should reside in runtest/crashme and won't get tested ever
+-proc01 proc01 -m 128
+-
+ read_all_dev read_all -d /dev -p -q -r 3
+ read_all_proc read_all -d /proc -q -r 3
+ read_all_sys read_all -d /sys -q -r 3
diff --git a/meta/recipes-extended/ltp/ltp_20210121.bb b/meta/recipes-extended/ltp/ltp_20210121.bb
index ffda7107623..e1ffd0ddf45 100644
--- a/meta/recipes-extended/ltp/ltp_20210121.bb
+++ b/meta/recipes-extended/ltp/ltp_20210121.bb
@@ -40,6 +40,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0001-open_posix_testsuite-generate-makefiles.sh-Avoid-inc.patch \
            file://0002-Makefile-Avoid-wildcard-determinism-issues.patch \
            file://0003-syscalls-swapon-swapoff-Move-common-library-to-libs.patch \
+           file://disable_hanging_tests.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.30.2

