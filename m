Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.25.1623933564847107388
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jun 2021 05:39:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=STlc46z0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id k42so1456859wms.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Jun 2021 05:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SgX69wEYDX+876T8cjt9+tEAOazgsr36RdnrRhaZxRw=;
        b=STlc46z09ERJe/jMqxj7kjfA+PTPuafaLEOYLSKv6m9V/OzHFcDDtnatHUmk1dVOF0
         Dy3M8k6fi3KVEJZZT55vfvXY8+KdrBogycKvzSqWRW+4oFTBcKqUA3VXLHaPtJtPULLm
         oetSs5gQJlzdXe/1UYqIxjREROfjBi6I+o0Ks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SgX69wEYDX+876T8cjt9+tEAOazgsr36RdnrRhaZxRw=;
        b=JNXNi4pbQK9Uk/qNddYPG4k7NRxd3LB1qU/Mn4txqjWFygX8ptsJ0flXWnbIrriBLv
         HK4ctq1INalhIIJ3gSY+XlP6BvVoFd8qh0dk6/uzl6mRfSD73Y7R4KsJtff2P3pvZBaF
         kReeir0ms1h/cMfy1svAnVPpMpm+26JWud/dGRSjRt6eaiTptEtfcy0DgXWhNSGh9Rrz
         iUf9hBFq7VFXgawYhn3LHdCoWDnSwaWMGRSgHoKG8H/6FpDbi8CZRw5NhGq2oROGUtVW
         lPr7ZX100PyzyYAQas5eHz/qCE96YnvQx3f7GIAPt7EX+rVPc605ftCrNy7pHDKOD6aP
         g4jw==
X-Gm-Message-State: AOAM530fw98cLErmR8QkLEIT6iQZXD7U0Fba/85biOXsH5pL+ssGaLY9
	Vf7QKOQV74xilFc22BHCQvgc9sw5ZDRyPw==
X-Google-Smtp-Source: ABdhPJxLTRizWRb8I2m0g7kLfk+x6XNYKszTa6JPKiW6sVM8/hA5hoKpx6vud+W2lHZJWFzrpEFx7g==
X-Received: by 2002:a1c:f613:: with SMTP id w19mr4964666wmc.136.1623933562886;
        Thu, 17 Jun 2021 05:39:22 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:3ef0:94f4:af84:585a])
        by smtp.gmail.com with ESMTPSA id c12sm6056213wrr.90.2021.06.17.05.39.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 05:39:22 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] ltp: Reinstate 'hanging' tests for evaluation
Date: Thu, 17 Jun 2021 13:39:22 +0100
Message-Id: <20210617123922.3388634-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We think we've found the root cause of the ltp hangs as a cgroup kernel
fs bug introduced in 5.1 and now fixed in linux-yocto. Reinstate these tests
and see if any issues recur.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../ltp/ltp/disable_hanging_tests.patch       | 45 -------------------
 meta/recipes-extended/ltp/ltp_20210524.bb     |  1 -
 2 files changed, 46 deletions(-)
 delete mode 100644 meta/recipes-extended/ltp/ltp/disable_hanging_tests.patch

diff --git a/meta/recipes-extended/ltp/ltp/disable_hanging_tests.patch b/meta/recipes-extended/ltp/ltp/disable_hanging_tests.patch
deleted file mode 100644
index 113ac0fefec..00000000000
--- a/meta/recipes-extended/ltp/ltp/disable_hanging_tests.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-This patch disables tests which we've found "hang" on our infrastructure.
-
-cgroup_xattr:
-https://autobuilder.yoctoproject.org/typhoon/#/builders/95/builds/1926 (x86)
-https://autobuilder.yoctoproject.org/typhoon/#/builders/95/builds/1898 (x86)
-https://autobuilder.yoctoproject.org/typhoon/#/builders/95/builds/1916 (x86)
-
-proc01:
-https://autobuilder.yoctoproject.org/typhoon/#/builders/96/builds/1748 (arm)
-https://autobuilder.yoctoproject.org/typhoon/#/builders/96/builds/1781 (arm)
-(in the latter was trying to read /proc/kmsg)
-(the above test looks horrible anyway)
-
-Upstream-Status: Inappropriate [OE Configuration]
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Index: git/runtest/controllers
-===================================================================
---- git.orig/runtest/controllers
-+++ git/runtest/controllers
-@@ -352,8 +352,6 @@ cpuset_memory_spread	cpuset_memory_sprea
- 
- cpuset_regression_test cpuset_regression_test.sh
- 
--cgroup_xattr	cgroup_xattr
--
- pids_1_1 pids.sh 1 1 0
- pids_1_2 pids.sh 1 2 0
- pids_1_10 pids.sh 1 10 0
-Index: git/runtest/fs
-===================================================================
---- git.orig/runtest/fs
-+++ git/runtest/fs
-@@ -64,11 +64,6 @@ writetest01	writetest
- #Also run the fs_di (Data Integrity tests)
- fs_di fs_di -d $TMPDIR
- 
--# Read every file in /proc. Not likely to crash, but does enough
--# to disturb the kernel. A good kernel latency killer too.
--# Was not sure why it should reside in runtest/crashme and won't get tested ever
--proc01 proc01 -m 128
--
- read_all_dev read_all -d /dev -p -q -r 3
- read_all_proc read_all -d /proc -q -r 3
- read_all_sys read_all -d /sys -q -r 3
diff --git a/meta/recipes-extended/ltp/ltp_20210524.bb b/meta/recipes-extended/ltp/ltp_20210524.bb
index 4328b1efee3..26fd9ac0497 100644
--- a/meta/recipes-extended/ltp/ltp_20210524.bb
+++ b/meta/recipes-extended/ltp/ltp_20210524.bb
@@ -31,7 +31,6 @@ SRCREV = "0fb171f2beddaf64bd27597577c206c0f892b3cd"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
-           file://disable_hanging_tests.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.30.2

