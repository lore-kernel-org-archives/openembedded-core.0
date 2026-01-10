Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94E8DD2502D
	for <webhook@archiver.kernel.org>; Sat, 10 Jan 2026 23:45:22 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1535.1768088721684513284
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Jan 2026 15:45:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wo7JF40I;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b843e8a4fbfso652658566b.0
        for <openembedded-core@lists.openembedded.org>; Sat, 10 Jan 2026 15:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768088720; x=1768693520; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s4E5CzeeYRAlNRTvBE6decAoyCxyRhCaqBBD8HSGoTk=;
        b=Wo7JF40I+u5fB+L/VY5AaXB5PwuYS9pBTju0f0tyVXR19NdTiBFzVBF237lO74aQ1D
         lO9zZhlw3Cv3AKQtNgKui1H/C1yJFnpF+9YxblrOC7sECrvnTIqRgeNcqQOwY1RMmipq
         QCAigt4lGcCV5jHDGuPPc8iOcko28JZF/3rvUEyo58+Er6+ttOo1pGuP6/EihPXTFXmH
         rg+9oIrW/yRKJQ/ACsrh3ZlBx10fC49hBwyCC5dUspI4hlkEi3KBkncDYQm7ARoDMsKW
         mllE6fBZiRMDEo9GgA3JCf5JNZfOgrKgZu0LEDP2060IkSdliix9n6hv8U2WLEDVUoCH
         BWwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768088720; x=1768693520;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s4E5CzeeYRAlNRTvBE6decAoyCxyRhCaqBBD8HSGoTk=;
        b=UrZ9sChUQttfmqMKtvzr5/Ay2MCl7GcyzmFYZuerM3cZGziFmuo1b1pOjqfZFxruvV
         alaoo1rmegLzcqlz/LjAjqxZKFwPTnOlcOJ3PnuSStJpYEMOi52WGxt+d0Bm7dwaCRZf
         Bs6SkNrD5ZZgvUXEYjwwzk45lXeDDfr15u39iOtQ/Q31S30ScrUIyzt/CsbGaieVwCr4
         K2QPdstPFeqTCjeY/SDqlYSG0J3H55/vjOezyB/BCr9FG4ZdCiI+WBDupwFZUwI4Ag0m
         3f+Eg3R//HGZ6+uzZPb6ySK/aycGCibefKN8eeuqyUm55QQ3XiD+femZ5xCoi9Pyc0w6
         T09Q==
X-Gm-Message-State: AOJu0YxRPZ9pHJVS4fEkzQRfrH9+7FD8QuKZPx7xkfUbhAsUFSOydBU9
	bSHTYEd10PAloK+Unlh2aF6FBx2P80s95dMhX44rkjDXeKrVgdLspf8138ekSzst
X-Gm-Gg: AY/fxX4ExWrd3JpM/hlvRxyMb7A159BtJ8CTixkwHBxYqQhbn9+0NtAfnKOpNQXGCZd
	XrVBhUJmLYa3uQaQyIQC5P/t2r2ndDGKp1eBFDhRXNeKDeshX6sExD7bBmbVOrbyfy96YtIRExQ
	vUbZ9asZ184MTI817dswS0aQ/EGd2ju42BLaaH23xZfD5CPVjHCzHFU1dAliVMaP3WxJ/Ki+9ig
	6hLThHCi7MqljLm1Sj600jtstfwuyTDyo2IxOpweGRGoIE6uAiNOQlCemV1NiDUI9fI7bgmSaPx
	4MafdbnLhqZ/Ur1XKgfduk97P6m3rqmyMy6CQf1F2n8TPusBGNgYiI8LGPBd3NwBwZaled+mYCL
	++ipgUMhTQmwZQvTe47aMG/8WIduAWcu0I0XSP9NhnpS2DSEF2V0E1GHxrrJHY+lQPtALYhhm1q
	WIxwvoRNEewF/i+BjmBWAbFUBXHp2jdl2MdfQ/3vpKPrpcpiXnMIBpFUkhqhKqnYP7
X-Google-Smtp-Source: AGHT+IGljo5OPKQFWq3cm/UUAhSDPVwXXtBGp+Rc2XvXGl058AdKN83AGlVNZ6jwu4q53r8y4zMh6g==
X-Received: by 2002:a17:907:3f9b:b0:b76:b76e:112a with SMTP id a640c23a62f3a-b844516a870mr1353857066b.11.1768088719453;
        Sat, 10 Jan 2026 15:45:19 -0800 (PST)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a233f2asm1500963966b.13.2026.01.10.15.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 15:45:19 -0800 (PST)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [PATCH V3] qemurunner: Improve qmp module detection. in order to detect qmp module
Date: Sun, 11 Jan 2026 00:44:20 +0100
Message-ID: <20260110234420.813531-2-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Jan 2026 23:45:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229173

Instead of using logfile to detect where qmp is located we 
can pass sysroot_native directly to the qemurunner so it can find the qmp module directly.

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 meta/classes-recipe/testimage.bbclass |  1 +
 meta/lib/oeqa/core/target/qemu.py     |  4 ++--
 meta/lib/oeqa/targetcontrol.py        |  2 ++
 meta/lib/oeqa/utils/qemurunner.py     | 16 +++++++++-------
 meta/lib/oeqa/utils/qemutinyrunner.py |  3 ++-
 5 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index 844c0f19ad..a5c7c4f34b 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -305,6 +305,7 @@ def testimage_main(d):
                       'serial_ports': len(d.getVar("SERIAL_CONSOLES").split()),
                       'ovmf'        : ovmf,
                       'tmpfsdir'    : d.getVar("RUNQEMU_TMPFS_DIR"),
+                      'native_sysroot': d.getVar("STAGING_DIR_NATIVE"),
                     }
 
     if d.getVar("TESTIMAGE_BOOT_PATTERNS"):
diff --git a/meta/lib/oeqa/core/target/qemu.py b/meta/lib/oeqa/core/target/qemu.py
index 769a6fec7e..76c1ada02e 100644
--- a/meta/lib/oeqa/core/target/qemu.py
+++ b/meta/lib/oeqa/core/target/qemu.py
@@ -22,7 +22,7 @@ class OEQemuTarget(OESSHTarget):
             port=None, machine='', rootfs='', kernel='', kvm=False, slirp=False,
             dump_dir='', display='', bootlog='',
             tmpdir='', dir_image='', boottime=60, serial_ports=2,
-            boot_patterns = defaultdict(str), ovmf=False, tmpfsdir=None, **kwargs):
+            boot_patterns = defaultdict(str), ovmf=False, tmpfsdir=None, native_sysroot=None, **kwargs):
 
         super(OEQemuTarget, self).__init__(logger, None, server_ip, timeout,
                 user, port)
@@ -44,7 +44,7 @@ class OEQemuTarget(OESSHTarget):
                                  logfile=bootlog, boottime=boottime,
                                  use_kvm=kvm, use_slirp=slirp, dump_dir=dump_dir, logger=logger,
                                  serial_ports=serial_ports, boot_patterns = boot_patterns, 
-                                 use_ovmf=ovmf, tmpfsdir=tmpfsdir)
+                                 use_ovmf=ovmf, tmpfsdir=tmpfsdir, native_sysroot=native_sysroot)
 
     def start(self, params=None, extra_bootparams=None, runqemuparams=''):
         if self.use_slirp and not self.server_ip:
diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index a9080077e2..fa6b43bb35 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -127,6 +127,7 @@ class QemuTarget(BaseTarget):
                             logfile = self.qemulog,
                             kernel = self.kernel,
                             boottime = int(d.getVar("TEST_QEMUBOOT_TIMEOUT")),
+                            native_sysroot = d.getVar("RECIPE_SYSROOT_NATIVE"),
                             tmpfsdir = d.getVar("RUNQEMU_TMPFS_DIR"),
                             logger = logger)
         else:
@@ -140,6 +141,7 @@ class QemuTarget(BaseTarget):
                             use_kvm = use_kvm,
                             dump_dir = dump_dir,
                             logger = logger,
+                            native_sysroot = d.getVar("RECIPE_SYSROOT_NATIVE"),
                             tmpfsdir = d.getVar("RUNQEMU_TMPFS_DIR"),
                             serial_ports = len(d.getVar("SERIAL_CONSOLES").split()),
                             boot_patterns = boot_patterns)
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index c4db0cf038..ee84cae33b 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -45,7 +45,7 @@ def getOutput(o):
 class QemuRunner:
 
     def __init__(self, machine, rootfs, display, tmpdir, deploy_dir_image, logfile, boottime, dump_dir, use_kvm, logger, use_slirp=False,
-     serial_ports=2, boot_patterns = defaultdict(str), use_ovmf=False, workdir=None, tmpfsdir=None):
+     serial_ports=2, boot_patterns = defaultdict(str), use_ovmf=False, workdir=None, tmpfsdir=None, native_sysroot=None):
 
         # Popen object for runqemu
         self.runqemu = None
@@ -76,10 +76,13 @@ class QemuRunner:
         self.msg = ''
         self.boot_patterns = boot_patterns
         self.tmpfsdir = tmpfsdir
+        self.native_sysroot = native_sysroot
 
         self.runqemutime = 300
         if not workdir:
             workdir = os.getcwd()
+        # Store workdir for locating native sysroot (qmp bindings)
+        self.workdir = workdir
         self.qemu_pidfile = workdir + '/pidfile_' + str(os.getpid())
         self.monitorpipe = None
 
@@ -186,17 +189,16 @@ class QemuRunner:
         return self.launch(launch_cmd, qemuparams=qemuparams, get_ip=get_ip, extra_bootparams=extra_bootparams, env=env)
 
     def launch(self, launch_cmd, get_ip = True, qemuparams = None, extra_bootparams = None, env = None):
-        # use logfile to determine the recipe-sysroot-native path and
-        # then add in the site-packages path components and add that
-        # to the python sys.path so the qmp module can be found.
-        python_path = os.path.dirname(os.path.dirname(self.logfile))
-        python_path += "/recipe-sysroot-native/usr/lib/qemu-python"
+        if not self.native_sysroot:
+            self.logger.error("qemurunner: native_sysroot not provided; cannot locate qmp bindings")
+            return False
+        python_path = os.path.join(self.native_sysroot, "usr/lib/qemu-python")
         sys.path.append(python_path)
         importlib.invalidate_caches()
         try:
             qmp = importlib.import_module("qmp")
         except Exception as e:
-            self.logger.error("qemurunner: qmp module missing, please ensure it's installed in %s (%s)" % (python_path, str(e)))
+            self.logger.error("qemurunner: qmp module missing in %s (%s)" % (python_path, str(e)))
             return False
         # Path relative to tmpdir used as cwd for qemu below to avoid unix socket path length issues
         qmp_file = "." + next(tempfile._get_candidate_names())
diff --git a/meta/lib/oeqa/utils/qemutinyrunner.py b/meta/lib/oeqa/utils/qemutinyrunner.py
index 20009401ca..d1ccf65223 100644
--- a/meta/lib/oeqa/utils/qemutinyrunner.py
+++ b/meta/lib/oeqa/utils/qemutinyrunner.py
@@ -19,7 +19,7 @@ from .qemurunner import QemuRunner
 
 class QemuTinyRunner(QemuRunner):
 
-    def __init__(self, machine, rootfs, display, tmpdir, deploy_dir_image, logfile, kernel, boottime, logger, tmpfsdir=None):
+    def __init__(self, machine, rootfs, display, tmpdir, deploy_dir_image, logfile, kernel, boottime, logger, tmpfsdir=None, native_sysroot=None):
 
         # Popen object for runqemu
         self.runqemu = None
@@ -44,6 +44,7 @@ class QemuTinyRunner(QemuRunner):
         self.server_socket = None
         self.kernel = kernel
         self.logger = logger
+        self.native_sysroot = native_sysroot
 
 
     def create_socket(self):
-- 
2.43.0


