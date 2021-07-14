Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web08.7298.1626272078813327482
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jul 2021 07:14:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PSiLVuAn;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id g12so1691427wme.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jul 2021 07:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nZsQ6RkSputJImnmSU6NhZwJ5twyZ4JdvlmGUBfjzoA=;
        b=PSiLVuAnhAvq+7Wjd3qcSr/zYeegP9bpU67oIMdPvS06oy32sAXtUaD5Me6V9xsd0I
         NvqvY4B/vHhvtuXfP4DQC+/c+a/iCs/jC1fvuozvipISBJAavIz6S2WWl9eKkGWopky9
         ESJbrjDzSlx+HrsCCyROYBXRNMOW+nvp5JSlQcCsiQYUjN5mlyNgfZ60uNLK1mxYdK1t
         AspSJB++zfDvFGlBFwkOPE7jakDmwHI8kg1SnShDmWwshiP182+0U4xUV3wOw8g63aNC
         LKFpuXAc3JbT1KyI1ALUdgXM8rII6PL63ktctGrzSI6lbDRPXWD7b1m0rrhJOT04OVhz
         TTBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nZsQ6RkSputJImnmSU6NhZwJ5twyZ4JdvlmGUBfjzoA=;
        b=RBzmefD5Gfekx3ptVw6gHXR3YJzKFusbqtv4yd6er1lTzHQdmnINkHBvlOfk63RB/P
         TVbWJgs4iv5E8lI+ncot30AtN56cnqPNLDdtRUjJmzM0cvTA+yTTyxb2yvcIKnNgxXNH
         EGpo7K5tn5NZ8AutvKBFewEs1RQTNQTkSInJ5ESrIs36EwuRZJ7h2bICzBwLb0uq38tS
         iHQgTxXcOdWcjJC92sdRLT/CoSnTmq/PByMKCHZ1ukjO7wX7C97A537Ruv6dNlroiuho
         QyJBVW4B7uj4ES3r5sytbW/r3E0nwvQbCK9gz6mn/IRuA3+0kojirznhZbyeDtJ/04R0
         1sqA==
X-Gm-Message-State: AOAM531rbwP6QLEoKX4uY/X22YwpH3KLdSXRgFN0ZObGQtVSQhkKZhQR
	W7gzFj1eG73OtNj93tjNzjejOoZ8Zks=
X-Google-Smtp-Source: ABdhPJy8Uf/UJM3LMOEs+i7lubZSbt2JcYSqAY/Coc1ueRUaIB4Kloqm5JjJBSePYpXqQ1wZX+/SVA==
X-Received: by 2002:a7b:c041:: with SMTP id u1mr11237484wmc.95.1626272077306;
        Wed, 14 Jul 2021 07:14:37 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id w18sm3061279wrg.68.2021.07.14.07.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 07:14:36 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH v3] tcmode-default.inc: do not set PREFERRED_VERSION for toolchain items
Date: Wed, 14 Jul 2021 16:14:32 +0200
Message-Id: <20210714141432.610106-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

oe-core has not been providing multiple versions for any of these items
for a long time, it's not likely to change anytime soon, and it makes
automated (or semi-automated) versions updates with devtool impossible,
as PREFERRED_VERSION masks the updated recipe in devtool workspace.

Specifically, this was prompted by investigating why automated llvm update
doesn't work; it does now.

v2: GCC is excluded as overriding the version through GCCVERSION is used
across several layers, and the list of things to override is large.

v3: exclude linux-libc-headers too, as that is using a separate update
process without involving devtool.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc | 36 ---------------------
 1 file changed, 36 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 1d4aa1e11f..e655bd85ce 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -18,12 +18,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 
 GCCVERSION ?= "11.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
-BINUVERSION ?= "2.36%"
-GDBVERSION ?= "10.%"
-GLIBCVERSION ?= "2.33"
 LINUXLIBCVERSION ?= "5.13%"
-QEMUVERSION ?= "6.0%"
-GOVERSION ?= "1.16%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to denote
 # llvm version being used, so always bump it with llvm recipe version bump
 LLVMVERSION ?= "12.0.1"
@@ -42,42 +37,11 @@ PREFERRED_VERSION_libgfortran ?= "${GCCVERSION}"
 PREFERRED_VERSION_nativesdk-gcc ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_nativesdk-libgcc ?= "${SDKGCCVERSION}"
 PREFERRED_VERSION_nativesdk-libgcc-initial ?= "${SDKGCCVERSION}"
-PREFERRED_VERSION_binutils ?= "${BINUVERSION}"
-PREFERRED_VERSION_binutils-native ?= "${BINUVERSION}"
-PREFERRED_VERSION_binutils-cross-${TARGET_ARCH} ?= "${BINUVERSION}"
-PREFERRED_VERSION_binutils-crosssdk-${SDK_SYS} ?= "${BINUVERSION}"
-PREFERRED_VERSION_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "${BINUVERSION}"
-PREFERRED_VERSION_gdb ?= "${GDBVERSION}"
-PREFERRED_VERSION_gdb-cross-${TARGET_ARCH} ?= "${GDBVERSION}"
-PREFERRED_VERSION_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "${GDBVERSION}"
 
 PREFERRED_VERSION_linux-libc-headers ?= "${LINUXLIBCVERSION}"
 PREFERRED_VERSION_nativesdk-linux-libc-headers ?= "${LINUXLIBCVERSION}"
-PREFERRED_VERSION_glibc                    ?= "${GLIBCVERSION}"
-PREFERRED_VERSION_glibc-locale             ?= "${GLIBCVERSION}"
-PREFERRED_VERSION_glibc-mtrace             ?= "${GLIBCVERSION}"
-PREFERRED_VERSION_glibc-scripts            ?= "${GLIBCVERSION}"
-PREFERRED_VERSION_nativesdk-glibc          ?= "${GLIBCVERSION}"
-PREFERRED_VERSION_cross-localedef-native   ?= "${GLIBCVERSION}"
-
-PREFERRED_VERSION_qemu ?= "${QEMUVERSION}"
-PREFERRED_VERSION_qemu-native ?= "${QEMUVERSION}"
-PREFERRED_VERSION_nativesdk-qemu ?= "${QEMUVERSION}"
 
 # Bootstrap Go using a binary release from golang.org.  If you want to bootstrap
 # from source using the C-implemented Go 1.4 (only supports x86-64 hosts) then use
 # go-native.
 PREFERRED_PROVIDER_go-native ?= "go-binary-native"
-PREFERRED_VERSION_virtual/${TARGET_PREFIX}go ?= "${GOVERSION}"
-PREFERRED_VERSION_go-cross-${TUNE_PKGARCH} ?= "${GOVERSION}"
-PREFERRED_VERSION_go-crosssdk-${SDK_ARCH} ?= "${GOVERSION}"
-PREFERRED_VERSION_go-cross-canadian-${TRANSLATED_TARGET_ARCH} ?= "${GOVERSION}"
-PREFERRED_VERSION_go ?= "${GOVERSION}"
-PREFERRED_VERSION_go-native ?= "${GOVERSION}"
-PREFERRED_VERSION_go-runtime ?= "${GOVERSION}"
-PREFERRED_VERSION_nativesdk-go ?= "${GOVERSION}"
-PREFERRED_VERSION_nativesdk-go-runtime ?= "${GOVERSION}"
-
-PREFERRED_VERSION_llvm = "${LLVMVERSION}"
-PREFERRED_VERSION_llvm-native = "${LLVMVERSION}"
-PREFERRED_VERSION_nativesdk-llvm = "${LLVMVERSION}"
-- 
2.31.1

