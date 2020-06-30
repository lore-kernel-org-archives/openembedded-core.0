Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.7655.1593486293684864208
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2020 20:04:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=qo0llP8A;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id h22so8867022pjf.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2020 20:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=p5ZWywBKCWvhdVt8AVqO+DTMZpu6rYK7gD0gfWMihvk=;
        b=qo0llP8A4t4ZvEK3PYtmc0WihSQoiK25KctGNBsXCI2qfgCaV+eKWkPOeZDWt171uD
         iRkUztmk+6115+WKsDbhV3Mx9e1f6SVg+2BffmZX+KW8fxdUK4SmmEm5ZUyOJXOUfkYG
         AygcCN5+ImesIE8uvYvwQ7ZJrQKjr7XJfNYKKhQGPLoQTS4/rBH9FYniyoL4KZKA958z
         vaLlSsZQ8QcRj/WyOGDKZiO9ZTo+4FAfySz18GO3vZKSBIb0mbqjkBr0rbOPF0bWLGmv
         tF3l9MZ8XF4UwXfiH87jol0xREuBL0tj7X7oYhgkeqvJhg9U9DTiqjNwIEYdUXywE1S6
         NKDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=p5ZWywBKCWvhdVt8AVqO+DTMZpu6rYK7gD0gfWMihvk=;
        b=nxtwY+WPds8pCElZFIxP0MqDBr07z0G2EFlYE+UhAmz0rVpRIc93ZqedeehzYHbM0B
         6SSbpcRfUDWBI7VEgjLhuq2YlKVuV0eYmSy0X3exwF1WSsFSOuqXGF/Z35f0/MVt62Ty
         2C1HCoD6ASzvWwmi/cDHJXhe1V3ByFdY0+2Q/vk6mTudQG9nJQkyPo3FSBXXitIgrmfx
         WgOmx6Xh9D8+w3JVcc/ze87T92C7K6kruqeEfxRpVi2KwKVaEsZBGttcYvvmoil94rqY
         WHj4tJJSflX9FTnmLjY72cZ+1TyJa/nTJamAsXTPHcId0L2vdC90mDe81wtX2SJP3YF6
         kDFg==
X-Gm-Message-State: AOAM5315SYT1J8LlKuBqK2kA5zvDTp2yR4MaunCcqF++FyL2oTcOzFEC
	c4g02jraaR74Ol4qKASRfw89t2uhuxvZsw==
X-Google-Smtp-Source: ABdhPJzY3cCPDtk+kdwcW0tjxB41gam41tEyIBPOgjjyIw4LET4OxOkfiD53LfVmBloTim+rl3dMCw==
X-Received: by 2002:a17:90b:46c1:: with SMTP id jx1mr175270pjb.125.1593486292761;
        Mon, 29 Jun 2020 20:04:52 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id 6sm875627pfi.170.2020.06.29.20.04.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 20:04:52 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/22] testimage: enable ovmf support
Date: Mon, 29 Jun 2020 17:03:11 -1000
Message-Id: <458a860b45c0fb5bb3162b5a112b518c3339c1dd.1593485896.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593485896.git.steve@sakoman.com>
References: <cover.1593485896.git.steve@sakoman.com>

From: Konrad Weihmann <kweihmann@outlook.com>

Add support for running wic images with EFI as testimage.
Introduces a variable called QEMU_USE_OVMF for configuration.

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3af8aaff68ed332d812ea7dc184d392700ad7882)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/testimage.bbclass    | 6 +++++-
 meta/lib/oeqa/core/target/qemu.py | 6 ++++--
 meta/lib/oeqa/utils/qemurunner.py | 5 ++++-
 3 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index deb81bc256..53945478af 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -275,11 +275,14 @@ def testimage_main(d):
     # Get use_kvm
     kvm = oe.types.qemu_use_kvm(d.getVar('QEMU_USE_KVM'), d.getVar('TARGET_ARCH'))
 
+    # Get OVMF
+    ovmf = d.getVar("QEMU_USE_OVMF")
+
     slirp = False
     if d.getVar("QEMU_USE_SLIRP"):
         slirp = True
 
-    # TODO: We use the current implementatin of qemu runner because of
+    # TODO: We use the current implementation of qemu runner because of
     # time constrains, qemu runner really needs a refactor too.
     target_kwargs = { 'machine'     : machine,
                       'rootfs'      : rootfs,
@@ -293,6 +296,7 @@ def testimage_main(d):
                       'slirp'       : slirp,
                       'dump_dir'    : d.getVar("TESTIMAGE_DUMP_DIR"),
                       'serial_ports': len(d.getVar("SERIAL_CONSOLES").split()),
+                      'ovmf'        : ovmf,
                     }
 
     if d.getVar("TESTIMAGE_BOOT_PATTERNS"):
diff --git a/meta/lib/oeqa/core/target/qemu.py b/meta/lib/oeqa/core/target/qemu.py
index 059106e915..295e8765e9 100644
--- a/meta/lib/oeqa/core/target/qemu.py
+++ b/meta/lib/oeqa/core/target/qemu.py
@@ -20,7 +20,7 @@ class OEQemuTarget(OESSHTarget):
             port=None, machine='', rootfs='', kernel='', kvm=False, slirp=False,
             dump_dir='', dump_host_cmds='', display='', bootlog='',
             tmpdir='', dir_image='', boottime=60, serial_ports=2,
-            boot_patterns = defaultdict(str), **kwargs):
+            boot_patterns = defaultdict(str), ovmf=False, **kwargs):
 
         super(OEQemuTarget, self).__init__(logger, None, server_ip, timeout,
                 user, port)
@@ -31,6 +31,7 @@ class OEQemuTarget(OESSHTarget):
         self.rootfs = rootfs
         self.kernel = kernel
         self.kvm = kvm
+        self.ovmf = ovmf
         self.use_slirp = slirp
         self.boot_patterns = boot_patterns
 
@@ -39,7 +40,8 @@ class OEQemuTarget(OESSHTarget):
                                  logfile=bootlog, boottime=boottime,
                                  use_kvm=kvm, use_slirp=slirp, dump_dir=dump_dir,
                                  dump_host_cmds=dump_host_cmds, logger=logger,
-                                 serial_ports=serial_ports, boot_patterns = boot_patterns)
+                                 serial_ports=serial_ports, boot_patterns = boot_patterns, 
+                                 use_ovmf=ovmf)
 
     def start(self, params=None, extra_bootparams=None, runqemuparams=''):
         if self.use_slirp and not self.server_ip:
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 77ae08ebeb..992fff9370 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -32,7 +32,7 @@ re_control_char = re.compile('[%s]' % re.escape("".join(control_chars)))
 class QemuRunner:
 
     def __init__(self, machine, rootfs, display, tmpdir, deploy_dir_image, logfile, boottime, dump_dir, dump_host_cmds,
-                 use_kvm, logger, use_slirp=False, serial_ports=2, boot_patterns = defaultdict(str)):
+                 use_kvm, logger, use_slirp=False, serial_ports=2, boot_patterns = defaultdict(str), use_ovmf=False):
 
         # Popen object for runqemu
         self.runqemu = None
@@ -56,6 +56,7 @@ class QemuRunner:
         self.logged = False
         self.thread = None
         self.use_kvm = use_kvm
+        self.use_ovmf = use_ovmf
         self.use_slirp = use_slirp
         self.serial_ports = serial_ports
         self.msg = ''
@@ -158,6 +159,8 @@ class QemuRunner:
                 launch_cmd += ' nographic'
             if self.use_slirp:
                 launch_cmd += ' slirp'
+            if self.use_ovmf:
+                launch_cmd += ' ovmf'
             launch_cmd += ' %s %s %s' % (runqemuparams, self.machine, self.rootfs)
 
         return self.launch(launch_cmd, qemuparams=qemuparams, get_ip=get_ip, extra_bootparams=extra_bootparams, env=env)
-- 
2.17.1

