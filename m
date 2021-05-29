Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web09.22224.1622304395484228218
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 May 2021 09:06:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YkY1wvjF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id z17so6254089wrq.7
        for <openembedded-core@lists.openembedded.org>; Sat, 29 May 2021 09:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Pp41i/SzpEiDYeNK78OE+qXTE3NC2ZBiNdMAybnThv8=;
        b=YkY1wvjFbiCSufnysLt9TLepB49Q0L8BqYU+NtZRqoJNBDd29b3HaR+9zlXD+U++Rp
         6zYyhImfFXvgIM4amaTUhEPL6ZHi9eSWb4ZD51tR7dBiDMbyit7o08VzNPvcWliD9oyv
         eoFL2uzt474wKgtOz2r+agMqTFY7tj+iDJXOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Pp41i/SzpEiDYeNK78OE+qXTE3NC2ZBiNdMAybnThv8=;
        b=LbcgtdCT+PZPNL0J/Cp94qAv8Aoday90R6TIy9rOmCkS9WsFPsC/WHRaFilb3iOOMi
         4NcpQ1kBFQSGNtsYNoPO4/sBFLtZhCW0UvBj1RI1bhadzVpBgFo4h1AK0h050WRlbYaf
         IK6BBcXNQNRuh0ywU2oUPwpMPWiDJGqVWh+Kr8hC3zvb24K3f/eLOGe/a1AN2ngHS6jE
         EzmR9jFvCoDgAJuW81cu5FTD2HoNXiHcgaIdUCVIaQUXv2AhRwK3HZFVOjk4SIZ1Vm3I
         w4Hd+aWurtbtzX+QGux7Al24BanNvWZaetm4snX7jHylREeVxeeABeiGDzDBIg5m+Cmb
         +zMw==
X-Gm-Message-State: AOAM533GWDjN3//8mtLp9OHZ19epkDtZo7FCshTF2C6/AJD4pETvlQN7
	x3+QONqvL/ljqBHkyknIoyd0gzBgK5isKw==
X-Google-Smtp-Source: ABdhPJzlM65UsTjYF6H+MkhBgephYeJ+pMsw/aNmLOzlr35BBa0XzI4sXNKuL5aCiHXvoaiP81z6kw==
X-Received: by 2002:adf:f811:: with SMTP id s17mr14170618wrp.245.1622304393895;
        Sat, 29 May 2021 09:06:33 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:314e:6a46:a163:7356])
        by smtp.gmail.com with ESMTPSA id q20sm20873615wmq.2.2021.05.29.09.06.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 May 2021 09:06:33 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott] [PATCH 03/10] ltp: Disable problematic tests causing autobuilder hangs
Date: Sat, 29 May 2021 17:06:25 +0100
Message-Id: <20210529160632.2796977-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210529160632.2796977-1-richard.purdie@linuxfoundation.org>
References: <20210529160632.2796977-1-richard.purdie@linuxfoundation.org>
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
index d98c9fdc250..17adbf43f0a 100644
--- a/meta/recipes-extended/ltp/ltp_20210121.bb
+++ b/meta/recipes-extended/ltp/ltp_20210121.bb
@@ -42,6 +42,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0001-open_posix_testsuite-generate-makefiles.sh-Avoid-inc.patch \
            file://0002-Makefile-Avoid-wildcard-determinism-issues.patch \
            file://0003-syscalls-swapon-swapoff-Move-common-library-to-libs.patch \
+           file://disable_hanging_tests.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.30.2

