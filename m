Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.5504.1617633913702259088
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Apr 2021 07:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=a2fXroMK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id f6so5037211wrv.12
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Apr 2021 07:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=0fjNu9rfxmZgte0hWmAt6jDWKPaXgstRoBdE/koGrko=;
        b=a2fXroMKMGZKiWc8v+rx1NUD6jnThp4tpyu1o3bNlfKiMlFPhIQdWfEHamfzxZfuDh
         DuZZQKFWqu9lOp01OeyL7QhUpf36o2GGtR2n/IbzdvpuxcAyzTGDaQkzhh4JxDNUg4Zd
         p+lqZHbri2cbWEPgsdVD0TsFsi4wXhxOV6ADs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0fjNu9rfxmZgte0hWmAt6jDWKPaXgstRoBdE/koGrko=;
        b=Fg1s7qIaLuVNZK9UWU2zpvwOiq8Gl/GasDIadM4hrNqTODALu5CSGiSXb8q+mVSfcx
         ++8g1oTvKB6iaD6GzB9Z6XzxdQT7434JQZD6/yyNIjVgKW6p748gRQIL01U/fatFsPFJ
         JPnwicZGpedfogx1p6dZdOKWRlXpRlQZmyinrt7WT2bSE7/KlNkyRd5WlLMjpTgxPeQu
         RPQxtyEsIqNmHYHUi6SOT6JuxQVLTYftD4mOTzBAKMAYqz7yjc+Ywy+h7vx2/27/rsDJ
         uC1K2tWSoXiAcnMTsu/LsGw1m3NhxUX/AjBZDlmGtm78UdWaRMQgoGAi6rj6J57QjtIO
         5IVQ==
X-Gm-Message-State: AOAM531ulh3S9/fOgwuNOBygIr2P0AdqkRtN5iQ/9CcNbHNqRKFqO1Ro
	2luzhzqoBUUFBkQ5OjS1DsofPzHF4JrRJg==
X-Google-Smtp-Source: ABdhPJxdjrN6o7UF3aeQdt0qhKjr7j/hu5ZU55QtLdLdB0T1EcIcUMYpQBRC8/t01yeD3JJIQr95JA==
X-Received: by 2002:adf:df8b:: with SMTP id z11mr7638748wrl.133.1617633912226;
        Mon, 05 Apr 2021 07:45:12 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:1d45:30a1:7018:4816])
        by smtp.gmail.com with ESMTPSA id n5sm6750847wrp.50.2021.04.05.07.45.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 07:45:12 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] oeqa/runqemu: Support RUNQEMU_TMPFS_DIR as a location to copy snapshot images to
Date: Mon,  5 Apr 2021 15:45:10 +0100
Message-Id: <20210405144510.967151-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210405144510.967151-1-richard.purdie@linuxfoundation.org>
References: <20210405144510.967151-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We have a working theory that IO queues on the autobuilder are impacting
runtime testing under qemu, particularly async writes which inice does not
influence. We already pass the snapshot option to qemu which copies the
image and runs out of the copy. Add in the ability to copy the image to
a specificed location which can be a tmpfs. This means that writes to the
image would no longer be blocked by other writes to disk in the system.

Preliminary tests show that this does improve the qemu errors at the expense
of sometimes showing qemu startup timeouts as on a loaded system with a large
test image, it can take longer than 120s to copy the image to tmpfs. Having
a most consistent failure mode for loaded tests is probably desireable though.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/testimage.bbclass        | 1 +
 meta/lib/oeqa/core/target/qemu.py     | 4 ++--
 meta/lib/oeqa/targetcontrol.py        | 2 ++
 meta/lib/oeqa/utils/qemurunner.py     | 6 +++++-
 meta/lib/oeqa/utils/qemutinyrunner.py | 6 +++++-
 scripts/runqemu                       | 9 +++++++++
 6 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 78da4b09bdf..e6137595031 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -305,6 +305,7 @@ def testimage_main(d):
                       'dump_dir'    : d.getVar("TESTIMAGE_DUMP_DIR"),
                       'serial_ports': len(d.getVar("SERIAL_CONSOLES").split()),
                       'ovmf'        : ovmf,
+                      'tmpfsdir'    : d.getVar("RUNQEMU_TMPFS_DIR"),
                     }
 
     if d.getVar("TESTIMAGE_BOOT_PATTERNS"):
diff --git a/meta/lib/oeqa/core/target/qemu.py b/meta/lib/oeqa/core/target/qemu.py
index 0f29414df54..792efca1f84 100644
--- a/meta/lib/oeqa/core/target/qemu.py
+++ b/meta/lib/oeqa/core/target/qemu.py
@@ -21,7 +21,7 @@ class OEQemuTarget(OESSHTarget):
             port=None, machine='', rootfs='', kernel='', kvm=False, slirp=False,
             dump_dir='', dump_host_cmds='', display='', bootlog='',
             tmpdir='', dir_image='', boottime=60, serial_ports=2,
-            boot_patterns = defaultdict(str), ovmf=False, **kwargs):
+            boot_patterns = defaultdict(str), ovmf=False, tmpfsdir=None, **kwargs):
 
         super(OEQemuTarget, self).__init__(logger, None, server_ip, timeout,
                 user, port)
@@ -42,7 +42,7 @@ class OEQemuTarget(OESSHTarget):
                                  use_kvm=kvm, use_slirp=slirp, dump_dir=dump_dir,
                                  dump_host_cmds=dump_host_cmds, logger=logger,
                                  serial_ports=serial_ports, boot_patterns = boot_patterns, 
-                                 use_ovmf=ovmf)
+                                 use_ovmf=ovmf, tmpfsdir=tmpfsdir)
         dump_target_cmds = kwargs.get("testimage_dump_target")
         self.target_dumper = TargetDumper(dump_target_cmds, dump_dir, self.runner)
         self.target_dumper.create_dir("qemu")
diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 19f5a4ea7e9..12057f855ae 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -131,6 +131,7 @@ class QemuTarget(BaseTarget):
                             logfile = self.qemulog,
                             kernel = self.kernel,
                             boottime = int(d.getVar("TEST_QEMUBOOT_TIMEOUT")),
+                            tmpfsdir = d.getVar("RUNQEMU_TMPFS_DIR"),
                             logger = logger)
         else:
             self.runner = QemuRunner(machine=d.getVar("MACHINE"),
@@ -144,6 +145,7 @@ class QemuTarget(BaseTarget):
                             dump_dir = dump_dir,
                             dump_host_cmds = d.getVar("testimage_dump_host"),
                             logger = logger,
+                            tmpfsdir = d.getVar("RUNQEMU_TMPFS_DIR"),
                             serial_ports = len(d.getVar("SERIAL_CONSOLES").split()))
 
         self.target_dumper = TargetDumper(dump_target_cmds, dump_dir, self.runner)
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index eb23dbceb85..278904ba0b1 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -32,7 +32,7 @@ re_control_char = re.compile('[%s]' % re.escape("".join(control_chars)))
 class QemuRunner:
 
     def __init__(self, machine, rootfs, display, tmpdir, deploy_dir_image, logfile, boottime, dump_dir, dump_host_cmds,
-                 use_kvm, logger, use_slirp=False, serial_ports=2, boot_patterns = defaultdict(str), use_ovmf=False, workdir=None):
+                 use_kvm, logger, use_slirp=False, serial_ports=2, boot_patterns = defaultdict(str), use_ovmf=False, workdir=None, tmpfsdir=None):
 
         # Popen object for runqemu
         self.runqemu = None
@@ -61,6 +61,7 @@ class QemuRunner:
         self.serial_ports = serial_ports
         self.msg = ''
         self.boot_patterns = boot_patterns
+        self.tmpfsdir = tmpfsdir
 
         self.runqemutime = 120
         if not workdir:
@@ -150,6 +151,9 @@ class QemuRunner:
         else:
             env["DEPLOY_DIR_IMAGE"] = self.deploy_dir_image
 
+        if self.tmpfsdir:
+            env["RUNQEMU_TMPFS_DIR"] = self.tmpfsdir
+
         if not launch_cmd:
             launch_cmd = 'runqemu %s' % ('snapshot' if discard_writes else '')
             if self.use_kvm:
diff --git a/meta/lib/oeqa/utils/qemutinyrunner.py b/meta/lib/oeqa/utils/qemutinyrunner.py
index 5c92941c0a6..20009401ca8 100644
--- a/meta/lib/oeqa/utils/qemutinyrunner.py
+++ b/meta/lib/oeqa/utils/qemutinyrunner.py
@@ -19,7 +19,7 @@ from .qemurunner import QemuRunner
 
 class QemuTinyRunner(QemuRunner):
 
-    def __init__(self, machine, rootfs, display, tmpdir, deploy_dir_image, logfile, kernel, boottime, logger):
+    def __init__(self, machine, rootfs, display, tmpdir, deploy_dir_image, logfile, kernel, boottime, logger, tmpfsdir=None):
 
         # Popen object for runqemu
         self.runqemu = None
@@ -37,6 +37,7 @@ class QemuTinyRunner(QemuRunner):
         self.deploy_dir_image = deploy_dir_image
         self.logfile = logfile
         self.boottime = boottime
+        self.tmpfsdir = tmpfsdir
 
         self.runqemutime = 60
         self.socketfile = "console.sock"
@@ -83,6 +84,9 @@ class QemuTinyRunner(QemuRunner):
             return False
         else:
             os.environ["DEPLOY_DIR_IMAGE"] = self.deploy_dir_image
+        if self.tmpfsdir:
+            env["RUNQEMU_TMPFS_DIR"] = self.tmpfsdir
+
 
         # Set this flag so that Qemu doesn't do any grabs as SDL grabs interact
         # badly with screensavers.
diff --git a/scripts/runqemu b/scripts/runqemu
index 35053de368d..ba0b701aff3 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1196,6 +1196,15 @@ class BaseConfig(object):
             self.fstype = self.fstype[4:]
         rootfs_format = self.fstype if self.fstype in ('vmdk', 'vhd', 'vhdx', 'qcow2', 'vdi') else 'raw'
 
+        tmpfsdir = os.environ.get("RUNQEMU_TMPFS_DIR", None)
+        if self.snapshot and tmpfsdir:
+            newrootfs = os.path.join(tmpfsdir, os.path.basename(self.rootfs)) + "." + str(os.getpid())
+            shutil.copyfile(self.rootfs, newrootfs)
+            #print("Copying rootfs to tmpfs: %s" % newrootfs)
+            self.rootfs = newrootfs
+            # Don't need a second copy now!
+            self.snapshot = False
+
         qb_rootfs_opt = self.get('QB_ROOTFS_OPT')
         if qb_rootfs_opt:
             self.rootfs_options = qb_rootfs_opt.replace('@ROOTFS@', self.rootfs)
-- 
2.30.2

