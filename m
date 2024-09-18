Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83B8CCDD560
	for <webhook@archiver.kernel.org>; Wed, 18 Sep 2024 23:19:57 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.7299.1726701580722250254
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Sep 2024 16:19:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MYHQDMIA;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-205909afad3so3341625ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Sep 2024 16:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726701580; x=1727306380; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bt7AbR5u2IlOLRLPbBfBZpajFaAgmW7aMZ6voEFuH2c=;
        b=MYHQDMIA1YBXYhGlUI+s30R0w0kti6SYPURidq65PHaFMf7ZXubCk7NNCJWP+Bhls3
         0hJ/7JERbTUP6HynKf/72zgWJgnlbQGqCr0Vc1UkEtntIWmtk1YANwNWaYwZxdOSzvqC
         d+vnnMeAkMa9NONAIIaCaGuokSuBsstlv4bYmkmlDYlQuUIslxqnnlbnziSHFzjcJ7B4
         xV+dwDruE1cQIvTgRkVpwBz3k6Wmk1L3BD2gIFzPmnaho7AdIiAiyah4eH07OVED/Ojj
         gi5tojJplwe+2mmxebFrJ5J4rLM4Wgl2IJUmLTsSgu/LDrFMdAU/l7X/em3CjI04T/Ot
         Sq1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726701580; x=1727306380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bt7AbR5u2IlOLRLPbBfBZpajFaAgmW7aMZ6voEFuH2c=;
        b=KsTh2fUXBEHOAT+oPuROfyZ/AcG9xC7lPjg3U9CY7bIXHnkZia4ZKssFbxkDaXluIp
         rleQ0HvyVx6EM8bQir68pxQsU5D5iOvVStB9EXZ6vSZ4wl+jW+1bW1kth9drkYyPkrbY
         yYjUoXSCpehlZxDGVcfcoWYk4oFQt2kbwzbUQLgTrlDhWcO22b/H5efZPIi/9xCSaEEp
         OF7XPx3eI/bj31vQ0zNZ/ZOh2RlLF1ZEIO/AxjHes5teWTHQ2klZLa6cFFWDcrXDjL4A
         XUQqWEjbBwlH5lfRKk0IAIta6Fl8GQsZu28zFca7BvspN1tvNF0emmEpas+YQQltJYzR
         E1CQ==
X-Gm-Message-State: AOJu0YwTfFKF5gpbc9Q+1ZfRvtj8cxwmB/GQEBSBcyDcBHS+C6dDj3P2
	VQ80H7BwXoNNVYukzh+Q48FjeqMcZKYCeNo+pEcNTplq+7YfrdYRxxSUufxU
X-Google-Smtp-Source: AGHT+IGGweTQLS+EVKk3CFhE7TFGKYioVhFdhRWLRHGxFcSRttzIvKJTkbCRli5wvjOJIoeLttO9cA==
X-Received: by 2002:a17:902:ec88:b0:206:dc2a:232c with SMTP id d9443c01a7336-2076e32fa72mr415514415ad.15.1726701579769;
        Wed, 18 Sep 2024 16:19:39 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::c3c8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20794735719sm69867675ad.275.2024.09.18.16.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 16:19:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] qemu: Fix build on musl/riscv64
Date: Wed, 18 Sep 2024 16:19:37 -0700
Message-ID: <20240918231937.1424570-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Sep 2024 23:19:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204656

musl does not provide strerrorname_np() so do not use it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/fix-strerrorname_np.patch       | 27 +++++++++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index f37b32985bf..2786eedd423 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -21,6 +21,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
 SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://powerpc_rom.bin \
            file://run-ptest \
+           file://fix-strerrorname_np.patch \
            file://0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch \
            file://0002-apic-fixup-fallthrough-to-PIC.patch \
            file://0003-configure-Add-pkg-config-handling-for-libgcrypt.patch \
diff --git a/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch b/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
new file mode 100644
index 00000000000..5098e8a4e5a
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
@@ -0,0 +1,27 @@
+target/riscv/kvm: do not use non-portable strerrorname_np()
+
+strerrorname_np is non-portable and breaks building with musl libc.
+
+Use strerror(errno) instead, like we do other places.
+
+Upstream-Status: Submitted [https://mail.gnu.org/archive/html/qemu-stable/2023-12/msg00069.html]
+
+Cc: qemu-stable@nongnu.org
+Fixes: commit 082e9e4a58ba (target/riscv/kvm: improve 'init_multiext_cfg' error 
+msg)
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2041
+Buglink: https://gitlab.alpinelinux.org/alpine/aports/-/issues/15541
+Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
+
+--- a/target/riscv/kvm/kvm-cpu.c
++++ b/target/riscv/kvm/kvm-cpu.c
+@@ -1731,8 +1731,7 @@ static bool kvm_cpu_realize(CPUState *cs
+     if (riscv_has_ext(&cpu->env, RVV)) {
+         ret = prctl(PR_RISCV_V_SET_CONTROL, PR_RISCV_V_VSTATE_CTRL_ON);
+         if (ret) {
+-            error_setg(errp, "Error in prctl PR_RISCV_V_SET_CONTROL, code: %s",
+-                       strerrorname_np(errno));
++            error_setg(errp, "Error in prctl PR_RISCV_V_SET_CONTROL, error %d", errno);
+             return false;
+         }
+     }

