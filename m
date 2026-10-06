Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17238CA6004
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 15:46:29 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48860.1791301586497348653
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 08:46:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=JYqVaSvm;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48b03f23305so2693276f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 08:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791301585; x=1791906385; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3rcztIs9geCfMaxeWXq+KQ8SPz5NAsdx0LP7s+D41NA=;
        b=JYqVaSvmxP3muDQ+6BeDFcPRLECcyT+cIwUMGmrQu9HZB6T6jhlFHs/RMlHnKqOshn
         8bWhIZvj6AReHZJwmcUJ48LPwNHRDHTrnRI9OGvTGS5kK+icYjsRWOE7oKX40Uf8GYBK
         a8R87QzgILKIZy6cmBvpkGKCKWhEwXNGrc5To=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791301585; x=1791906385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3rcztIs9geCfMaxeWXq+KQ8SPz5NAsdx0LP7s+D41NA=;
        b=ysT5UUuTFWhQxciokFrKWZNNiruIgr3sZrKcRG5VjBTWE4LZvFMjw7VeGKqy2fLKR+
         dnehgfhQBRaV/bnXHJT8l33f7aioTHaG1WttEh1Y6d088BSjjXJ4QB9nd6pdD2fu8bvx
         J/UKg1qA5cBKSsU7vXTCm8mlIrUEqCrEJzdaPSISoFd46iykS72Xn7xv+Uw9VE2KxwTt
         shQfxtrAx4vPJfZbBtQwEVz+zEShIlxHP6NjCTsdmMHA2idDFF6lWBQtHQ2XwfVYvSPr
         W9q6cDrce9YNaFZXqv2qlOxqJQ032RIh2Nq7q+NTnFwanbPFGXZHeCOyqFMLz3PYXWf8
         Fkiw==
X-Gm-Message-State: AFq9FYKtRRLlaePQG5+ZHqv8cVC+oSBkEzZr1SY5+UZza/KJkRW14/K4
	G8Sg71x9jo4kSgCy1nZOhEWrRFeTKGtU/DhlAVP+h8OpU/LmAd5a3wjABJN7YBJwQi9LNmcu70G
	9xBKQj1Q=
X-Gm-Gg: AYBFou3BcfQyueCNkSXOhJR1nrTZvETHjteqgOCEcLozpIekMzUonczVuHVsFLqa3wz
	aHiNEoFoXoh9a1Irk3LynR6UeOfuyHzLybhruOkdxZ7hScuzIGJTAdlDKIKLVaP98mMhfIXxspo
	O+PjRqXD4CRdDuJOyvQOCVFfoPOhx7crmQEE/T6GEcHb/Dm/Kwte8Z0LAmio3Qrq0StAd9s1hnk
	vchIAUn7l1ws/L3VxZrWrHBvMIBiD5HdXIblEBdyNOnWSTN3mVGvCCrAYZO0s7dL5DCcyw7tYhq
	KRwlagVJ9/tVIf8XogW5Qv4jg1m/MLlfRCIiD2CttwPOaGeLKPUVnPBKssmejNEu6b+yA/SgNny
	E8KYvDbzy6CiEnFk2IOWYhRi9K4e0osCDcwyH6VcAzogCPCsSqgDgH5QtBeT1x3GNneKixcozNn
	usILTGo7wqXFoGLz1fUAc8FDspWKPWFPa1E0B/7qccNW5buxivD4kZvx7frf8+FLAY5gLVWo7cs
	q0mzw+973ZcGXVkcaq51kSo2JOum+n1yVP0N7rwJE3ijmPR+wCqiiDMuz9Xz9Ywvul5vxefVGDM
	yUq3wg==
X-Received: by 2002:a05:6000:40cb:b0:48c:45ed:2425 with SMTP id ffacd0b85a97d-48c47c8ed6cmr17231654f8f.4.1791301584482;
        Tue, 06 Oct 2026 08:46:24 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3032csm257281f8f.45.2026.10.06.08.46.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 08:46:24 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 02/19] go: skip internal/cgrouptest when cpu.max is not available
Date: Tue,  6 Oct 2026 17:45:48 +0200
Message-ID: <16ebeee71bb4f10b86467be367d64906bc5a46fa.1791299195.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791299195.git.yoann.congal@smile.fr>
References: <cover.1791299195.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 15:46:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247291

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

