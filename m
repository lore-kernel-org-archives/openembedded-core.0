Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BEEECA6006
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 20:44:18 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5172.1791319453545953510
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 13:44:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=lgTV/zEF;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48af27fe287so865992f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 13:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791319452; x=1791924252; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3rcztIs9geCfMaxeWXq+KQ8SPz5NAsdx0LP7s+D41NA=;
        b=lgTV/zEFMQKqZEk/dT1PQOuduiS1S9XiZKLqIDPTp/9FBP/GT1WFYi9pdSTY9qs6zS
         VAbWdKrlbNxHbhYhcPllXEkamS7F6Ho8pmUw+MgHiHyWtdLxkriT5Wty2mR3H+7/QOai
         BxdXLp/80/8HMHkdicqZuaMBm4igWc0StzD7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791319452; x=1791924252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3rcztIs9geCfMaxeWXq+KQ8SPz5NAsdx0LP7s+D41NA=;
        b=WpPxJqNlRqgarWqLQ966tIxD3LF3ZyFWXtYnIRR84paFFfoaoEvjMwrko49KqOIq/E
         jgTmnuWXp5e53HnR0sBp06km8PanQNUJuywIYbHX/MeaF3bFWQXu+n73px1JGN1w/prf
         quas1633OizlWbKflIDuuy2eogKsBHsdW2U+aTRgpLmXPU8Em8jju8XKpyHSCC+gzLGk
         UiNQAvJ+sVPAtj3oJtQLPmoIaiE5M2jy2sTn2b/zazGoAvq8nCAor7PtVkeQmSccosYd
         umtr/6wm2/A9VbOknhVbyUhzkl6HMXakYLz8vZxZtO14kaNeizU8pUrL//WPbWTqRtUh
         9xVQ==
X-Gm-Message-State: AFq9FYKzOH45VYOS1oCsWzzK9rvp7UOBzgw7JK6Lv10vgH6S3vqe7S0T
	u5Zy6jsjA93S3FufGXTr7oFpEAClkpIxG28acWsifIPFiez36v2/IeoOi656ZThqi4uLjOTj8HE
	UAB4fMW8=
X-Gm-Gg: AYBFou0dBGgeSVot6EnlAYiaoZiA5ReET15FeX5i/koZLSwNqQTrjK+A3VdDisOsnAc
	F0eUNUpP5+me2VTPZQ3Ok3x7Z/HnHEyiAjQ41qq3KXIt/vs4jCIBVe1W51Xmv39v9RAXTYw88LF
	zXRKypCcLa80YRDdSC6heiICYc2X3htqxYnueh27kUhP71Bjt7GRZ4VOiuvr79xwNh7RJcrw1Hd
	ZsGTizbfQGK9ohJy7ZNnl5SudboGUR0vvwuYmQSnwDAX/+TXbUqGd2VxMd1kvEXCzyHbqYkB920
	k0tIHNThpRzQjnatgNXTh0zd65BYyeH+D48VGmxZwlOfpL2vyXMzQxe5DwdtRMcpuZrlSMDa7Oa
	JV5CjqPY7xVMKpyjLkFGNRb9SjqSrd/hLAxvY5rlf0A2n18SqWjl+YLQI/IGJ9KVqk1aPVgjyBM
	XFoAOVrziH3+5M8YKNjvcylRD70nVG4vpGxzH8nSGSYS1J+rDRvKe2zmcOqLMRzU2BzDmTBBHX+
	bCtZkhm856U3a0jv2nfnDdTpMfnQAZQuuV/XSOCWUrAldEJm7wOjOy3tr2zQc7QwE8=
X-Received: by 2002:a05:6000:3cd:b0:488:8568:bb02 with SMTP id ffacd0b85a97d-48c7278837emr813168f8f.23.1791319451743;
        Tue, 06 Oct 2026 13:44:11 -0700 (PDT)
Received: from FRSMI25-LASER (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c7273b5e0sm997338f8f.14.2026.10.06.13.44.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 13:44:11 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail v2 02/18] go: skip internal/cgrouptest when cpu.max is not available
Date: Tue,  6 Oct 2026 22:43:37 +0200
Message-ID: <16ebeee71bb4f10b86467be367d64906bc5a46fa.1791318909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791318909.git.yoann.congal@smile.fr>
References: <cover.1791318909.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 20:44:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247339

From: Khem Raj <raj.khem@gmail.com>

The internal/cgrouptest ptest fails on qemux86-64:

  Erroring setting cpu.max: open /sys/fs/cgroup/go-cgrouptestNNN/cpu.max: permission denied

cpu.max is only present in cgroup v2 when the kernel is built with
CONFIG_CFS_BANDWIDTH, which the linux-yocto qemu configuration does not
enable, even though the cpu controller is available. Writing the missing
file makes cgroupfs return EACCES.

Add a patch so that InCgroupV2 skips the test when the new cgroup has no
cpu.max, consistent with its other best-effort checks.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7b925b30e4753bd3698792b83f18e0848a85ba3f)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/go/go-1.27.1.inc        |  1 +
 ...est-skip-when-cpu.max-is-not-availab.patch | 39 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/0011-internal-cgrouptest-skip-when-cpu.max-is-not-availab.patch

diff --git a/meta/recipes-devtools/go/go-1.27.1.inc b/meta/recipes-devtools/go/go-1.27.1.inc
index 61df45558da..d7ba03b1bdd 100644
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
index 00000000000..f13cf78f7a7
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

