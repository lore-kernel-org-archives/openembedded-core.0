Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7B31C98318
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 02:22:56 +0000 (UTC)
Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10.1790302969218097659
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Sep 2026 19:22:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=A7A6vinE;
 spf=pass (domain: gmail.com, ip: 74.125.229.170, mailfrom: raj.khem@gmail.com)
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144efd1ea76so307142c88.1
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2026 19:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790302969; x=1790907769; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RjlaOOLk2Yi/aylwWdmySSwLLPiHx+GP/YzcHKEUaM4=;
        b=A7A6vinEn2CPswtd/p8c15G9JcLaZmCyy3EZFdqsd+YLjCSDgklsAYH68RiqR5e/+a
         7qGLpBWZOI/mCwNgQQ529n/3nvAAX4ciiDH1+72T/+0HxcTBQYeL4WsWsBSZ6vvtbwNY
         nx2Sh2nXdXY3l1JFbmo8WCQr4KfobsvUscqvzEZ8Pb/+hxXrRm2frXaFzObEf9TLwEMz
         sqzpNvCjioszMPm5115F1lBbBfzHhDmlS155YpeTdik2kAWcOlrvNyiB0Iwm7ymaHzwW
         Vfk27Pcx/+KB57LIUEh8PCdPzWtjM4wkm4JS7Ob2nuZ9oTv5I7YWTZqQPWb2H4PCrGJt
         rxZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790302969; x=1790907769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RjlaOOLk2Yi/aylwWdmySSwLLPiHx+GP/YzcHKEUaM4=;
        b=IPOFKgVl/loUomvdRVaMTRN1Ex8HZLKH4RxAZbnk+Xx+iUYRS57Oik6SfHx9nxbw2v
         46AyI3NuSF4zG5XC8/9EeFLyl7mszrZXsH9/9m0QEMD1dDJ88xxLdw1yxAHxVB2pTdCv
         EN/28V796agzMu3gC+GLib2GU4bVqkPq9MFdEvP4uuWiljB9C7Xbv165rcacYWYV6y+k
         vxW+s2goPKKcOElIhlWJyhlUnSIbLVRFeN+TWGMgn6OF+PShNFrkFAaP5dM3IvWDaR2P
         3H6rhV3HmjS1IXo52Z91RqIIMQ/TcycETgBmEP/hx5JfEuBF/BqSv/bleSA3GWfsMtQA
         UYNA==
X-Gm-Message-State: AFuF++mKKhZW/kQP5oa3lnLCoZZfVZgRTK3qNEiIDldZYs/y9AO/KsKY
	joehr+URpmOCptFO0OPxSNtwpT/CTeQaz4BdgS3l400kufLJyngMW8Xp9rr+pLC3CX8=
X-Gm-Gg: AYBFou2GoRZmtSg4RrTf9v4/s9u7C+JuTUiR+0HeXbGcGbwBq7KwEIzbsQ/J7kvKvhH
	5yOrDlvelLHw7CqSXTRkaP24JVme4yx7SSmR6EunIvGVxgpJspOEdC7QwP4N3P1wTBXqHI4JplV
	V47YH6Bto/ExCMLLX3SUaeng77rFEyiHMAaKI7pX8mQ+60N07k6O800IH9INsbD5v8kVKOFnh9F
	1xkQVQKIyrRKifOVL2wd0Sswtm9EWPoO7pUxCEamwf8rUGyOHecGmg+geOriiIfDPi/H/esZOgL
	to/1nglJYoNh1AI23PwQxTDAl3WvR8rfjTDOYDpX0Aten3bMUpsRuJ2oO6E1ohaNXYy/Wq8wbAS
	GJ+lRooQdahYfsxUeVDz/ZvIH+jlOkZEypvcNb2Ri9NQUOY+QqfSq2qSus0qZNAPLJhCkCwtJPw
	Bcu/l9qnYbZeuw5JhiIK0aUf8KDwF6u3XIUA0ZvuLYEUjH39eGHBFU5BJInsvAr9UwjynizE5wV
	qyFzQAKAtWKS//jC4Dte/G2Gc/iYxc/FtGYqF8uWxMwIVHcl6r9XIZ9J2GBW2DXlCNUIQNGhW23
	nCQvX8oLbyl2sOx1IE4KDiZbmmLOw+cnWAsLJZIEi3J/PJb3ifTnGtaqMkF1gDyYThcI80d4PhH
	fz2OsFHlujllH6BMofvtIJUlkjS8xGyyUXa58SbcvWHF7sTADAYTRqHRX6QVcOyf678H/1RNapp
	quxTX35EwaVLRQlJ2dDlh+WRF5LTw2qk87bwhgsg==
X-Received: by 2002:a05:701b:42d0:10b0:134:cf34:b8e0 with SMTP id a92af1059eb24-14504030d1dmr3376157c88.9.1790302968385;
        Thu, 24 Sep 2026 19:22:48 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145aa0cb7bcsm2038583c88.2.2026.09.24.19.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 19:22:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] go: skip internal/cgrouptest when cpu.max is not available
Date: Thu, 24 Sep 2026 19:22:45 -0700
Message-ID: <20260925022245.2912240-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2026 02:22:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246596

The internal/cgrouptest ptest fails on qemux86-64:

  Erroring setting cpu.max: open /sys/fs/cgroup/go-cgrouptestNNN/cpu.max: permission denied

cpu.max is only present in cgroup v2 when the kernel is built with
CONFIG_CFS_BANDWIDTH, which the linux-yocto qemu configuration does not
enable, even though the cpu controller is available. Writing the missing
file makes cgroupfs return EACCES.

Add a patch so that InCgroupV2 skips the test when the new cgroup has no
cpu.max, consistent with its other best-effort checks.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/recipes-devtools/go/go-1.27.1.inc        |  1 +
 ...est-skip-when-cpu.max-is-not-availab.patch | 39 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/0011-internal-cgrouptest-skip-when-cpu.max-is-not-availab.patch

diff --git a/meta/recipes-devtools/go/go-1.27.1.inc b/meta/recipes-devtools/go/go-1.27.1.inc
index 61df45558d..d7ba03b1bd 100644
--- a/meta/recipes-devtools/go/go-1.27.1.inc
+++ b/meta/recipes-devtools/go/go-1.27.1.inc
@@ -15,5 +15,6 @@ SRC_URI += "\
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
     file://0010-cmd-go-clear-GOROOT-for-func-ldShared-when-trimpath-.patch \
+    file://0011-internal-cgrouptest-skip-when-cpu.max-is-not-availab.patch \
 "
 SRC_URI[main.sha256sum] = "4e408abae126d916b6164627193f2c54f0e3ca1312d693b86db45f862ab238b1"
diff --git a/meta/recipes-devtools/go/go/0011-internal-cgrouptest-skip-when-cpu.max-is-not-availab.patch b/meta/recipes-devtools/go/go/0011-internal-cgrouptest-skip-when-cpu.max-is-not-availab.patch
new file mode 100644
index 0000000000..f13cf78f7a
--- /dev/null
+++ b/meta/recipes-devtools/go/go/0011-internal-cgrouptest-skip-when-cpu.max-is-not-availab.patch
@@ -0,0 +1,39 @@
+From 3335a08288a68ebce5f3e99745186ded36c564c9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Thu, 24 Sep 2026 10:22:23 -0700
+Subject: [PATCH] internal/cgrouptest: skip when cpu.max is not available
+
+The cpu.max interface file is only present in cgroup v2 when the kernel
+is built with CONFIG_CFS_BANDWIDTH, even if the cpu controller is enabled
+in the parent's cgroup.subtree_control. Without it, SetCPUMax tries to
+create the file, which cgroupfs rejects with EACCES, and TestInCgroupV2
+fails with:
+
+  Erroring setting cpu.max: open /sys/fs/cgroup/go-cgrouptestNNN/cpu.max: permission denied
+
+Skip, like the other best-effort checks in InCgroupV2, when the new
+cgroup does not have cpu.max.
+
+Upstream-Status: Submitted [https://github.com/golang/go/pull/81745]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ src/internal/cgrouptest/cgrouptest_linux.go | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/internal/cgrouptest/cgrouptest_linux.go b/src/internal/cgrouptest/cgrouptest_linux.go
+index ad9599c..a4b9b52 100644
+--- a/src/internal/cgrouptest/cgrouptest_linux.go
++++ b/src/internal/cgrouptest/cgrouptest_linux.go
+@@ -82,6 +82,12 @@ func InCgroupV2(t *testing.T, fn func(*CgroupV2)) {
+ 		}
+ 	}()
+
++	// cpu.max only exists when the kernel supports CPU bandwidth control
++	// (CONFIG_CFS_BANDWIDTH), even if the cpu controller is enabled.
++	if _, err := os.Stat(filepath.Join(path, "cpu.max")); err != nil {
++		t.Skipf("cgroup %s does not support cpu.max: %v", path, err)
++	}
++
+ 	migrateTo(t, path)
+ 	defer migrateTo(t, orig)
+

