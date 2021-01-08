Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web08.348.1610127003236281393
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Jan 2021 09:30:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=b10vA4fD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id q18so9795980wrn.1
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Jan 2021 09:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oMGe7pAIJ8buVC3xn5Ny8imAEDBz53STMto8VW6F1gQ=;
        b=b10vA4fDoZ55wKyghuAWwhraA+ae0QWdcU/7MHzS4zujYp7GdRF5LkCa5r6WYDOy1I
         nVZMcjGu3NSDhb/8MS15EOV+Wdfy3GVazo7yIvZCtpetECME2ewhjNTQt6Xh0weVBUYy
         oloSD+MdYqQuYcJOAj9kesBdK+NGYa8Xw9tZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oMGe7pAIJ8buVC3xn5Ny8imAEDBz53STMto8VW6F1gQ=;
        b=b6FP2LU+4RGucS4/6D7bkVHSCvpPZc9yl+RYwtXI5NpeZipQs2WD5rUsbcvoLpDCFw
         RdDvqFyzhyZy6YDwSDBiA9jQ2nzajrtmuWI18PAteSoXP318zPiLydqrqD8bbqysnvpK
         53C9QlIOiRBVvtVgLCtgta/EP+svFTbytrnKDWVy8vpW38Nwe1fOuyX82f9T4PmUv3Tr
         KYPW/HOHe2xoTHZNTWA+AZAFDdlKhMw/r+VWYexgdqgVH9d/iVnWo56ZH//60A2tUpAY
         kvdLiIC075ukRLe+lpAlK2Yxi6F36dFc2J4SriqZYK+V3QDef6fj3ntQP8VTk1jB0KK5
         puVw==
X-Gm-Message-State: AOAM530sGarxClDJy1N3wy8oLBFRLnxOXohkQRCQDYu0AUE26sN5fMfg
	/npsJoTSOX8XE1dRBO42MGbQlHqkI7dIMQ==
X-Google-Smtp-Source: ABdhPJxau9VjFusp+Bb3W+KLBc3FWoYVYCRcPMQvuhG6SpF39juMmncAUHKty7p5va7UnCWpjo320w==
X-Received: by 2002:adf:fa86:: with SMTP id h6mr4594559wrr.103.1610127001473;
        Fri, 08 Jan 2021 09:30:01 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:8262:2156:a38b:824c])
        by smtp.gmail.com with ESMTPSA id z3sm15272920wrn.59.2021.01.08.09.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 09:30:00 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Alistair Francis <alistair23@gmail.com>
Subject: [PATCH] qemu: Add some user space mmap tweaks to address musl 32 bit build issues
Date: Fri,  8 Jan 2021 17:30:00 +0000
Message-Id: <20210108173000.629263-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/qemu/qemu.inc         |  2 ++
 meta/recipes-devtools/qemu/qemu/mmap.patch  | 29 +++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu/mmap2.patch | 26 ++++++++++++++++++
 3 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/mmap.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/mmap2.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 286901fb1f0..cfa65f99d04 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -27,6 +27,8 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0001-Add-enable-disable-udev.patch \
            file://0001-qemu-Do-not-include-file-if-not-exists.patch \
            file://mingwfix.patch \
+           file://mmap.patch \
+           file://mmap2.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/mmap.patch b/meta/recipes-devtools/qemu/qemu/mmap.patch
new file mode 100644
index 00000000000..0f7d2ce04c2
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/mmap.patch
@@ -0,0 +1,29 @@
+If mremap() is called without the MREMAP_MAYMOVE flag with a start address
+just before the end of memory (reserved_va) where new_size would exceed 
+GUEST_ADD_MAX, the assert(end - 1 <= GUEST_ADDR_MAX) in page_set_flags() 
+would trigger.
+
+Add an extra guard to the guest_range_valid() checks to prevent this and
+avoid asserting binaries when reserved_va is set.
+
+This meant a test case now gives the same behaviour regardless of whether
+reserved_va is set or not.
+
+Upstream-Status: Pending
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
+
+Index: qemu-5.2.0/linux-user/mmap.c
+===================================================================
+--- qemu-5.2.0.orig/linux-user/mmap.c
++++ qemu-5.2.0/linux-user/mmap.c
+@@ -727,7 +727,9 @@ abi_long target_mremap(abi_ulong old_add
+ 
+     if (!guest_range_valid(old_addr, old_size) ||
+         ((flags & MREMAP_FIXED) &&
+-         !guest_range_valid(new_addr, new_size))) {
++         !guest_range_valid(new_addr, new_size)) ||
++        ((flags & MREMAP_MAYMOVE) == 0 &&
++         !guest_range_valid(old_addr, new_size))) {
+         errno = ENOMEM;
+         return -1;
+     }
diff --git a/meta/recipes-devtools/qemu/qemu/mmap2.patch b/meta/recipes-devtools/qemu/qemu/mmap2.patch
new file mode 100644
index 00000000000..9d40565938f
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/mmap2.patch
@@ -0,0 +1,26 @@
+When using qemu-i386 to build qemux86 webkitgtk on musl, it sits in an
+infinite loop of mremap calls of ever decreasing/increasing addresses.
+
+I suspect something in the musl memory allocation code loops indefinitely
+if it only sees ENOMEM and only exits when it hits EFAULT.
+
+According to the docs, trying to mremap outside the address space
+can/should return EFAULT and changing this allows the build to succeed.
+Whether this should be fixed in qemu and/or musl, not sure.
+
+Upstream-Status: Pending
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
+
+Index: qemu-5.2.0/linux-user/mmap.c
+===================================================================
+--- qemu-5.2.0.orig/linux-user/mmap.c
++++ qemu-5.2.0/linux-user/mmap.c
+@@ -727,7 +727,7 @@ abi_long target_mremap(abi_ulong old_add
+          !guest_range_valid(new_addr, new_size)) ||
+         ((flags & MREMAP_MAYMOVE) == 0 &&
+          !guest_range_valid(old_addr, new_size))) {
+-        errno = ENOMEM;
++        errno = EFAULT;
+         return -1;
+     }
+ 
-- 
2.27.0

