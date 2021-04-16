Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.11874.1618591401459601838
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Apr 2021 09:43:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qtQgUAFE;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id j12so8016191edy.3
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Apr 2021 09:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2MlV6twY8CrL08P22g9P+ORgGcohxgq/TKY6jsPZ8xg=;
        b=qtQgUAFE1l6mHWJZpwj7hsfdThvHuRs8RDEruYF6M8GQvsdZbNflmxGz77CQtjoGya
         XYp5Hok5CGMrf+UY0rUIsyuK6yPQ/e40vHg2HbXjChbrVtdV1zhF5IudsVPFQt6G7wlp
         9iP07fArVoe7hx47y3x16bngdvKJN9AYJKZL5FukpmglNSwT/Q/RQh5Y3OIeIfdA0OMi
         //PU2et31EL1J5VoYlSSPTET3ay9FQyr4npYDTrtHT1LIXGPDO1GGuwOXkV50Z/GtJz/
         v/dyoz9EyrrV9xZmbSmvEqVeZgBp6e1RsQA4Bzu6P5OQsgt90p19vGrZLSZNMLWdV/BN
         nWVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2MlV6twY8CrL08P22g9P+ORgGcohxgq/TKY6jsPZ8xg=;
        b=PAjiKf5kF6YkhN1dpzkbt5PiNSt2EuZe7mpYM51sDSlvEIhYWn8JRu/9UI59pvAF1z
         AsXc1TSsYmwWZbbDoAEKH1S56v8pa7fbyi3k3XNCSJcv7IXBpR2E1k252hhX2nskw+Fw
         JXIIpm44C47xsAkpOpdjLM8npMfu02ZScHz4ZVy8jM8ssouHvYQzxl2nn4j6knjsc5Ee
         0FlX1NnZW8BGSB4JkKwbM6X5BfJkxoSD3kaB7/lv9Xdn9PRFU6ENM8QlJkgENO8NhpTk
         pIdztQpIRqk6UIpCEcNX2tVUcCQDsWF1CvqBaNABMk8nDmj18M94igygrr+5l41lrJW9
         IiDQ==
X-Gm-Message-State: AOAM532qXxrnuZ639qvS/PzCR0w4Hx5OuZnlkq8b+fiD1kkvzGS0A3a9
	X01aO4c76tvIjNekXAxAcOqGIhQcr4v+P2x8
X-Google-Smtp-Source: ABdhPJwDkISCQs+YAU4WkBujiVlRP1Q6Ga3ONuceyYjg+K4zLiR8syo7vVaHJa1c8Dp8yNLRO/QMFA==
X-Received: by 2002:a50:c004:: with SMTP id r4mr10749031edb.192.1618591399741;
        Fri, 16 Apr 2021 09:43:19 -0700 (PDT)
Return-Path: <adrian.freihofer@gmail.com>
Received: from md2ramxc.lan.ffah.ch ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id y16sm5770989edc.62.2021.04.16.09.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 09:43:19 -0700 (PDT)
From: "Adrian Freihofer" <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH] runqemu: support uImage kernel
Date: Fri, 16 Apr 2021 18:43:10 +0200
Message-Id: <20210416164310.275973-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

u-boot's uImage kernel format is not supported by Qemu. Extract the
kernel from the uImage to a temporary directory.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/runqemu | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index ba0b701aff..fa630fc7a4 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -163,6 +163,7 @@ class BaseConfig(object):
         self.bios = ''
         self.kernel_cmdline = ''
         self.kernel_cmdline_script = ''
+        self.temp_kernel_dir = None
         self.bootparams = ''
         self.dtb = ''
         self.fstype = ''
@@ -1422,10 +1423,26 @@ class BaseConfig(object):
         self.setup_serial()
         self.setup_vga()
 
+    def dump_uimage(self):
+        if self.kernel and self.get('KERNEL_IMAGETYPE') == 'uImage':
+            import tempfile
+            self.temp_kernel_dir = tempfile.mkdtemp()
+            kernel = os.path.join(self.temp_kernel_dir, 'image')
+            dumpimage_bin = os.path.join(self.bindir_native, 'dumpimage')
+            image_link_name = self.get('IMAGE_LINK_NAME')
+            logger.info('Running: %s' % str([dumpimage_bin, "-o ", kernel, self.kernel]))
+            staging_bindir_native = '%s/usr/bin' % self.get('STAGING_DIR_NATIVE')
+            dumpimage_bin = os.path.join(staging_bindir_native, 'dumpimage')
+            subprocess.run([dumpimage_bin, "-p", "0", "-o", kernel, self.kernel])
+            return kernel
+        return self.kernel
+
     def start_qemu(self):
         import shlex
-        if self.kernel:
-            kernel_opts = "-kernel %s -append '%s %s %s %s'" % (self.kernel, self.kernel_cmdline,
+
+        kernel = self.dump_uimage()
+        if kernel:
+            kernel_opts = "-kernel %s -append '%s %s %s %s'" % (kernel, self.kernel_cmdline,
                                                                 self.kernel_cmdline_script, self.get('QB_KERNEL_CMDLINE_APPEND'),
                                                                 self.bootparams)
             if self.bios:
@@ -1481,6 +1498,9 @@ class BaseConfig(object):
             shutil.rmtree(self.rootfs)
             shutil.rmtree('%s.pseudo_state' % self.rootfs)
 
+        if self.temp_kernel_dir:
+            shutil.rmtree(self.temp_kernel_dir)
+
         self.cleaned = True
 
     def run_bitbake_env(self, mach=None):
-- 
2.26.3

