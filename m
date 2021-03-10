Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web09.233.1615417536194278595
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 15:05:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=VLmj2M/G;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.176, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f176.google.com with SMTP id z190so18752606qka.9
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Mar 2021 15:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ho4Wj+9TpDJk4zCbO2uMTzQaCvnEMcCdi/33qttl2yo=;
        b=VLmj2M/G1sRPnllYxu33zSlUM+lgaK3fQEwCCg6EXEm7iG85DHestoYQu0OjitOZcj
         rKX5ukHKBKBKHe3pTnLi4De1RKhJbF/ggF4TY95HB/uAPTRS7JaTcpYIDvVw42mapst6
         0sF6PldZb6tRWj+m4XCHyqRP8uueXQALVZyGZLKNxh3IeLdcEv4EkYevzeRm5c+MAFIL
         evLkRDnCPIB7yzA2XKJtGAK268Zl8/fK0M4cJI2KAi/Qq+dwUBZza4t+qL4DB95auoPY
         fIvXYNXdRaovCZJ7jXX+iCeToLvprRZnGfElETo0Q9LpRV7o8O/MBhNwnS25I2LbV0Ap
         Bgvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ho4Wj+9TpDJk4zCbO2uMTzQaCvnEMcCdi/33qttl2yo=;
        b=k6WNYAW2gaymimKaNgxM49GLO4h/wFEiV4zI4ep44FOnn6uJ4xfcL6TGsDK4oKxvVz
         PTE4wMqbHV8zG3G5ZZgb4CjpT6rbA7Msp9Ei5MxdvKMdx4nFW2LwXRKVicbIiIbMn5CD
         RnjzbuY9AKKgGhfuczGsq5CqDTso7bvvCJk5Jt3Z7H+u9ztacrNB7jrx1jl4muLrj50K
         mHhurKoE+MfKHT9A0hJ+LBmbcrV3+QGITKq1HWWW8RSTOAOlLkmhf2/WrZAJ631i81BP
         enu9LIsriJETBartw3/nYaijVAHk2wMnsE9eY0UWW7GfBL2EYe+Lb1I50HYPFgtF4Ff+
         kb8g==
X-Gm-Message-State: AOAM531gKnDzRfRZI+YSxbt2rXpjIgbUeoAyT6k2WuFQ0vrlSGe/ZU88
	fG1mM4n3HFQZc6oFIS17mmXVw4y/BkrNyA==
X-Google-Smtp-Source: ABdhPJzE4sLn4EPlleSoJlT1UOj6LZGI51bDxgH0BQ6HBriTWGrgG96ZXKi4awU9mZmWr8Y3g5dU+w==
X-Received: by 2002:a37:a30f:: with SMTP id m15mr5008345qke.433.1615417535041;
        Wed, 10 Mar 2021 15:05:35 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([2605:a601:a62f:6d00:81d0:be77:cd9:faa8])
        by smtp.gmail.com with ESMTPSA id i93sm552852qtd.48.2021.03.10.15.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 15:05:34 -0800 (PST)
From: "Jon Mason" <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Cc: Jon Mason <jon.mason@arm.com>
Subject: [PATCH 2/3] runqemu: correct forcing of ttyS0
Date: Wed, 10 Mar 2021 18:05:32 -0500
Message-Id: <20210310230533.30268-2-jdmason@kudzu.us>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210310230533.30268-1-jdmason@kudzu.us>
References: <20210310230533.30268-1-jdmason@kudzu.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some platforms do not use ttyS* for their serial consoles (e.g., qemuarm
and qemuarm64).  The hardcoding of this can cause issues.  Modify
runqemu to use the serial consoles defined in SERIAL_CONSOLES instead of
hardcoding.

Signed-off-by: Jon Mason <jon.mason@arm.com>
Change-Id: I746d56de5669c955c5e29d3ded70c0a4d3171f17
---
 meta/classes/qemuboot.bbclass     |  2 +-
 meta/conf/machine/qemuarm.conf    |  2 +-
 meta/conf/machine/qemuarm64.conf  |  2 -
 meta/conf/machine/qemuarmv5.conf  |  2 +-
 meta/lib/oeqa/utils/qemurunner.py |  2 +-
 scripts/runqemu                   | 61 ++++++++++++++-----------------
 6 files changed, 31 insertions(+), 40 deletions(-)

diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index 8798ad80e68b..1f8012edc1d7 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -103,7 +103,7 @@ def qemuboot_vars(d):
     build_vars = ['MACHINE', 'TUNE_ARCH', 'DEPLOY_DIR_IMAGE',
                 'KERNEL_IMAGETYPE', 'IMAGE_NAME', 'IMAGE_LINK_NAME',
                 'STAGING_DIR_NATIVE', 'STAGING_BINDIR_NATIVE',
-                'STAGING_DIR_HOST']
+                'STAGING_DIR_HOST', 'SERIAL_CONSOLES']
     return build_vars + [k for k in d.keys() if k.startswith('QB_')]
 
 do_write_qemuboot_conf[vardeps] += "${@' '.join(qemuboot_vars(d))}"
diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.conf
index 37dae8c86353..e5ec4cc065f0 100644
--- a/meta/conf/machine/qemuarm.conf
+++ b/meta/conf/machine/qemuarm.conf
@@ -17,7 +17,7 @@ QB_SYSTEM_NAME = "qemu-system-arm"
 QB_MACHINE = "-machine virt,highmem=off"
 QB_CPU = "-cpu cortex-a15"
 # Standard Serial console
-QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0 vmalloc=256"
+QB_KERNEL_CMDLINE_APPEND = "vmalloc=256"
 # For graphics to work we need to define the VGA device as well as the necessary USB devices
 QB_GRAPHICS = "-device VGA,edid=on"
 QB_OPT_APPEND = "-device qemu-xhci -device usb-tablet -device usb-kbd"
diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
index 05fd1f749b0f..51f7ecdcfda5 100644
--- a/meta/conf/machine/qemuarm64.conf
+++ b/meta/conf/machine/qemuarm64.conf
@@ -17,8 +17,6 @@ QB_SYSTEM_NAME = "qemu-system-aarch64"
 QB_MACHINE = "-machine virt"
 QB_CPU = "-cpu cortex-a57"
 QB_CPU_KVM = "-cpu host -machine gic-version=3"
-# Standard Serial console
-QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0"
 # For graphics to work we need to define the VGA device as well as the necessary USB devices
 QB_GRAPHICS = "-device VGA,edid=on"
 QB_OPT_APPEND = "-device qemu-xhci -device usb-tablet -device usb-kbd"
diff --git a/meta/conf/machine/qemuarmv5.conf b/meta/conf/machine/qemuarmv5.conf
index 29bcc1199ea1..223286eb20a6 100644
--- a/meta/conf/machine/qemuarmv5.conf
+++ b/meta/conf/machine/qemuarmv5.conf
@@ -12,7 +12,7 @@ SERIAL_CONSOLES ?= "115200;ttyAMA0 115200;ttyAMA1"
 # For runqemu
 QB_SYSTEM_NAME = "qemu-system-arm"
 QB_MACHINE = "-machine versatilepb"
-QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0,115200 console=tty vmalloc=256"
+QB_KERNEL_CMDLINE_APPEND = "vmalloc=256"
 QB_OPT_APPEND = "-usb -device usb-tablet"
 PREFERRED_VERSION_linux-yocto ??= "5.10%"
 QB_DTB = "${@oe.utils.version_less_or_equal('PREFERRED_VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 77ec939ad725..eb23dbceb854 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -176,7 +176,7 @@ class QemuRunner:
             self.logger.error("Failed to create listening socket: %s" % msg[1])
             return False
 
-        bootparams = 'console=tty1 console=ttyS0,115200n8 printk.time=1'
+        bootparams = ' printk.time=1'
         if extra_bootparams:
             bootparams = bootparams + ' ' + extra_bootparams
 
diff --git a/scripts/runqemu b/scripts/runqemu
index 4c8358e9de79..842509eb145f 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -139,6 +139,7 @@ class BaseConfig(object):
                         'OE_TMPDIR',
                         'OECORE_NATIVE_SYSROOT',
                         'MULTICONFIG',
+                        'SERIAL_CONSOLES',
                         )
 
         self.qemu_opt = ''
@@ -464,7 +465,6 @@ class BaseConfig(object):
                 if ('gtk' in sys.argv):
                     raise RunQemuError('Option nographic makes no sense alongside the gtk option.' % (arg))
                 self.qemu_opt_script += ' -nographic'
-                self.kernel_cmdline_script += ' console=ttyS0'
             elif arg == 'sdl':
                 if 'gl' in sys.argv[1:]:
                     self.set_dri_path()
@@ -493,10 +493,8 @@ class BaseConfig(object):
             elif arg == 'novga':
                 self.qemu_opt_script += ' -vga none'
             elif arg == 'serial':
-                self.kernel_cmdline_script += ' console=ttyS0'
                 self.serialconsole = True
             elif arg == "serialstdio":
-                self.kernel_cmdline_script += ' console=ttyS0'
                 self.serialstdio = True
             elif arg == 'audio':
                 logger.info("Enabling audio in qemu")
@@ -1321,6 +1319,31 @@ class BaseConfig(object):
             raise RunQemuError("Failed to boot, QB_SYSTEM_NAME is NULL!")
         self.qemu_system = qemu_system
 
+    def setup_serial(self):
+        # Setup correct kernel command line for serial
+        if self.serialstdio == True or self.serialconsole == True or re.search("-nographic", self.qemu_opt) or self.tcpserial_portnum:
+            for entry in self.get('SERIAL_CONSOLES').split(' '):
+                self.kernel_cmdline_script += ' console=%s' %entry.split(';')[1]
+
+        if self.serialstdio == True or re.search("-nographic", self.qemu_opt):
+            self.qemu_opt += " -serial mon:stdio"
+        else:
+            self.qemu_opt += " -serial mon:vc"
+            if self.serialconsole:
+                if sys.stdin.isatty():
+                    subprocess.check_call(("stty", "intr", "^]"))
+                    logger.info("Interrupt character is '^]'")
+
+                self.qemu_opt += " %s" % self.get("QB_SERIAL_OPT")
+
+        # We always wants ttyS0 and ttyS1 in qemu machines (see SERIAL_CONSOLES).
+        # If no serial or serialtcp options were specified, only ttyS0 is created
+        # and sysvinit shows an error trying to enable ttyS1:
+        #     INIT: Id "S1" respawning too fast: disabled for 5 minutes
+        serial_num = len(re.findall("-serial", self.qemu_opt))
+        if serial_num < 2:
+            self.qemu_opt += " -serial null"
+
     def setup_final(self):
         qemu_bin = os.path.join(self.bindir_native, self.qemu_system)
 
@@ -1365,37 +1388,7 @@ class BaseConfig(object):
         if self.snapshot:
             self.qemu_opt += " -snapshot"
 
-        if self.serialconsole:
-            if sys.stdin.isatty():
-                subprocess.check_call(("stty", "intr", "^]"))
-                logger.info("Interrupt character is '^]'")
-
-            first_serial = ""
-            if not re.search("-nographic", self.qemu_opt):
-                first_serial = "-serial mon:vc"
-            # We always want a ttyS1. Since qemu by default adds a serial
-            # port when nodefaults is not specified, it seems that all that
-            # would be needed is to make sure a "-serial" is there. However,
-            # it appears that when "-serial" is specified, it ignores the
-            # default serial port that is normally added.  So here we make
-            # sure to add two -serial if there are none. And only one if
-            # there is one -serial already.
-            serial_num = len(re.findall("-serial", self.qemu_opt))
-            if serial_num == 0:
-                self.qemu_opt += " %s %s" % (first_serial, self.get("QB_SERIAL_OPT"))
-            elif serial_num == 1:
-                self.qemu_opt += " %s" % self.get("QB_SERIAL_OPT")
-
-        # We always wants ttyS0 and ttyS1 in qemu machines (see SERIAL_CONSOLES),
-        # if not serial or serialtcp options was specified only ttyS0 is created
-        # and sysvinit shows an error trying to enable ttyS1:
-        #     INIT: Id "S1" respawning too fast: disabled for 5 minutes
-        serial_num = len(re.findall("-serial", self.qemu_opt))
-        if serial_num == 0:
-            if re.search("-nographic", self.qemu_opt) or self.serialstdio:
-                self.qemu_opt += " -serial mon:stdio -serial null"
-            else:
-                self.qemu_opt += " -serial mon:vc -serial null"
+        self.setup_serial()
 
     def start_qemu(self):
         import shlex
-- 
2.20.1

