Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19B71C9831E
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 01:48:58 +0000 (UTC)
Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13434.1790300935436345492
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Sep 2026 18:48:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CiltKvjV;
 spf=pass (domain: gmail.com, ip: 74.125.229.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-1438f55921fso148804c88.1
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Sep 2026 18:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790300935; x=1790905735; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RjlaOOLk2Yi/aylwWdmySSwLLPiHx+GP/YzcHKEUaM4=;
        b=CiltKvjVrQPCG7QJqKl64q9XCN18UM2HElI38QZ3Za2bROrr3GoU18VlAXp6NMDtc5
         RPd6X+Fb2jm9xwAc4CmcyDDeGcqjjxUN9bDfl/03e1HPnTrs4hj55PtfCqZq803SwDyY
         fS9UEjYDhltry15J8r3aPItn6wyP+QMQboyUXZ/pnRvcXV0371FmIllIOGMBafHLsOOD
         TkIpiqgfulwKWeLpeJQVoja/V4/HAL0vdZvr80L+NcFtTM0m4VhqF0B1oyE6h7X3mam2
         iSJb+zrOr8EDQveyx75kJseHpuxO5hLpTJHJ7wAaFBiKm+0sIZ+lxZaHeqyk/wY5QuvZ
         NQWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790300935; x=1790905735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RjlaOOLk2Yi/aylwWdmySSwLLPiHx+GP/YzcHKEUaM4=;
        b=Af8c0VJpUU8PsUbX/DMhdhetYRIt4CmOtHj2e75BKLZbrmG8SkiIF2EUk/wMf9YisD
         8pogT6ioR6exhujY/RINrF8uDvznyCaWNV9NYn2zK2XbbRTonBiaI1Hg3+NizleToBN5
         YLVC2da52zln8TuTOh8e3to92avR8WVyk0oOhLYAYf2gtzWoNnfaLFBH61tcj2wF4eEl
         JFvQX1b5EHI3U391lXvGVsNowQj1V8FXZSK4AINcPteBvn/VZ4DldhWmSr10TBQgfvQO
         aywUeikccjyvAasmfNp78rBczRu57VEqRTeF6qghYC7gFhoiNHsJdXO/43fUNMYYkbuj
         SnAg==
X-Gm-Message-State: AFuF++kcPoQUYpw1+4MeqnuIIBS3mCdmDWAxMyToPkkbB2T0tWxwvMCY
	BEJKF3HFWT/l2TQu6MoUF5qRixXlX6BgK8XnxpODXgrEiVjKidIpICAeUF+uZK3PBno=
X-Gm-Gg: AYBFou3U2Y1kP5vwl7CMrSUtcl6hGh66lowKtI8sg2jZQfzVEilPIzlyVdEi2U6T8Og
	Qbs3UEjEK27UU+NfmI+B756a3YVT9EwDA8rOnNaGt7ODUUT2dqbxw1lIKEI7X0yo6Hj1PygzIsu
	LoEB1/P2dUGDcl9HiztDJuEDGMiXGMVPg4M0rmUepbL9xc8XSoHrf4dTtLbvdfVnlHmenP/6Bli
	KUvjs5bKpxHioLNvPXFUwkuxf+F6Un0efpxHMWGYi2Q15AJwT+LxLte/hc/8lTL7F6JRbIcQUAv
	LmZg/bqLZIl4auxtAoLeZoMvpZewxD8OENmPH64DU77buIVrnQO3pCv50YaOb6yLdlxo1aHNDwn
	O1TqI3cal1s6eQP+OCgKdpOt4VmGShiK32ZymlqOpzp4fodoJBbCQfjBLuSfGoQjXOzkXNzDFqu
	t0yPHTfH1dXiwA3PrS0H7wsHtow/Ge+nSuxDsvzgkEA/mDlu4aV668KPGrM8xVv/6dBHwjtU7Is
	fLpnmoGSct+8583oAmP9HN0jRko2hL4g8TKr2lYmhSJz5xfj/6h4fXLVBNgNC0y5rtllrDBt0uN
	t7fy6yOGuaYplAG+bFKg6a8kvlF5oUW6qBeNzloZVqjgeeg1xIfovG/UwEVZi9GydhCJktWa2H3
	JpfqyXSLGF947KXE1sv1HGfj1j3oZYGLULdQkCOnfoOlG1nlJRRQLgQt3XXfM6yUf20laPpuLHJ
	9aX8I0MEojN74WUL+Fo4F6UIfShhKUBgt0NpsUZw==
X-Received: by 2002:a05:701b:424d:20b0:144:c11c:858e with SMTP id a92af1059eb24-14503fc80efmr3413736c88.31.1790300934587;
        Thu, 24 Sep 2026 18:48:54 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ad9e097fsm2267039c88.13.2026.09.24.18.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 18:48:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] go: skip internal/cgrouptest when cpu.max is not available
Date: Thu, 24 Sep 2026 18:48:51 -0700
Message-ID: <20260925014851.2774593-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2026 01:48:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246595

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

