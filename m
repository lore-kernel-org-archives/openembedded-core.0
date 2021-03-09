Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.12741.1615311142830867856
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 09:32:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=m8ivYVXW;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id e2so1677183pld.9
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Mar 2021 09:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cppFyhBy1SXPbhT2Wz/xhXfZx7TgXN7uYFHawOF0HK4=;
        b=m8ivYVXWS0lwE8rkTzkWEj8e9tGiHSYeiLI321I59k6BaoaBOyP1eWfDQMhxsk79ZB
         R0iRzHr0xAKh7tDix+Sfyz/OmlofUQafS7Os2xzMbV5GtX0apzREk16ct+bioJtS1yeJ
         /Ox6eTTTyCM9pa/eXNzzS6xoZ5hj1AD0na35Cqxp5IkEK51a2NfwkFU8uN7KOIPJh9FJ
         KGigb5DUGkvgCxOF9PvJY9SMs5y5oDfegMvkmNa3rPtLUj2WSW/F8DU4HZiWHiu93rbB
         V1It0R7Y5J2cWUenrEAi3OcU43CEBpx+pJjFAxf5b/xhjTdATi2YUdQfF+0VOJXpVz5n
         OymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cppFyhBy1SXPbhT2Wz/xhXfZx7TgXN7uYFHawOF0HK4=;
        b=mS7to7dBd00epL6CuHhepUFi2pvNpbvPGCpmgjzCjMwwo6aL6Yit6MTRWjmwalPj/9
         S39c5PmKwY3NkzcZxTnm8OyzGVifxOAb3Zl/om80pspWf+m19VcpDaNQvmjYPYh/EAYK
         6zix1M6JvgadGXzU1yQHoCdHJVZc+rVYdPEsJmq6mWmoM5n5OhXKn6IbBmZPHPXrgHPd
         qo6BNddmjZmMSJFs27RZ3bTNpVd3Ko76dB2xZFjEKSyWJGnilu7/6dXk/7eaImGhJdyV
         a2MsfRLQG3oGhe72HbacYpxPHDk/FglNMHNwjoM8bOKDFWlNSsxB/AJ4vnnPmwEis3K+
         mYgA==
X-Gm-Message-State: AOAM532WSv0a3Qp1PRg1N637uIuVMREwjP9VG05VSogrtM6HHOWmrnYU
	oZ/dRpB4+vkqiUJO6HsJAD1YzpdiG1E7+Q==
X-Google-Smtp-Source: ABdhPJwRLNexoHTJlPSiD2GfqjQabnmrO9ip45toTmCoalZPGeEZ4HlW+jBmVIJsaAx98boQcQDVvw==
X-Received: by 2002:a17:90b:514:: with SMTP id r20mr5772599pjz.145.1615311141788;
        Tue, 09 Mar 2021 09:32:21 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e641])
        by smtp.gmail.com with ESMTPSA id k128sm13541568pfd.137.2021.03.09.09.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 09:32:21 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/5] qemuppc64: Add a QEMU machine definition for ppc64
Date: Tue,  9 Mar 2021 09:32:06 -0800
Message-Id: <20210309173210.295033-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/qemuppc64.conf | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta/conf/machine/qemuppc64.conf

diff --git a/meta/conf/machine/qemuppc64.conf b/meta/conf/machine/qemuppc64.conf
new file mode 100644
index 0000000000..0682e752be
--- /dev/null
+++ b/meta/conf/machine/qemuppc64.conf
@@ -0,0 +1,24 @@
+#@TYPE: Machine
+#@NAME: QEMU PPC64 machine
+#@DESCRIPTION: Machine configuration for running a PPC system on QEMU
+
+require conf/machine/include/qemu.inc
+require conf/machine/include/tune-power9.inc
+
+KERNEL_IMAGETYPE = "vmlinux"
+
+SERIAL_CONSOLES ?= "115200;hvc0"
+
+# For runqemu
+QB_SYSTEM_NAME = "qemu-system-ppc64"
+QB_MACHINE = "-machine pseries"
+QB_CPU = "-cpu POWER9"
+QB_KERNEL_CMDLINE_APPEND = "console=hvc0"
+#QB_OPT_APPEND += "-device qemu-xhci -device usb-tablet -device usb-kbd"
+QB_OPT_APPEND = "-usb -device usb-tablet"
+
+#prelink broken on ppc64
+#USER_CLASSES_remove = "image-prelink"
+#IMAGE_PREPROCESS_COMMAND_remove = "prelink_image;"
+
+MACHINE_EXTRA_RRECOMMENDS += " kernel-modules"
-- 
2.30.1

