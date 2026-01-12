Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92409D26D97
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 09:49:12 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29925.1768211344096642484
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jan 2026 01:49:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=faqhXpok;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b8714a52072so131527866b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 01:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768211342; x=1768816142; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wRPcZe9o70ji5YcrgO1n6LlRzRltHSvUgF24lXBLyIE=;
        b=faqhXpokpR1+YXi0PtzY87h2doiJP+ep09rbzoekkU6FTOKX2ThpOPrS59iVpknSaN
         A6JwAUPRK6t969a/tP81b19HEedYG7uCFyvqCKXptvLRqwsjGAe5/Al/+Mm9z9JWh4i+
         WelYeemuV/Q35IQk7GI2Shafut/CwI0NYmGCVqTLynnjpcPLsI6bS/urkk2zt6Nm7NPP
         L55rrXdoY4d9+RR8TQe6kAwpQVZr7eD7EHxhs3/rTCM7Qyd7h9ZQWkrTz9iUG+F1M+3F
         j+r3PrlWPTqlhN/JBPbvvAPWsl1xn3Z9KLEG2JcWLMIoHo6IMpbgQglfuTq48GZAVe8u
         N9qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768211342; x=1768816142;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wRPcZe9o70ji5YcrgO1n6LlRzRltHSvUgF24lXBLyIE=;
        b=IMQVhSg28u75uqd+8WkwtODG2amfrXRFm0Ei1MDQf9NNZUzhVbUj+ko44OS/gtV1C5
         gbvhLD+1Et4cRkGOl+dtE7CtCuWKz18T/ihomKR9yXta2R0ejLYxaVQPaFWFCUt972KQ
         PRWQxW6qJ2HaA0PHZfh1/4lxX6bNvj8dItwK/BIDmAtCTKP16pFSAkOC1blA4AT4S51S
         Ut0239/Vx34v4khYlLKtHPtQZ4loBeBBpDk0HE1/C1dr+YUqwxQ4fTvGOR4l6JAveY26
         q0cJWGaUQ4f8YPxJoV8QUaedZcUJsm7Bz3GqhlKGZZLJLAmsstx3EAXo5xhJ27tCcSC3
         8ZaQ==
X-Gm-Message-State: AOJu0YxzV6qFqsHpvIch9vwIli5RItEHH+qOnuLSEnPfxHPUd9FoJaKD
	wL0+mcq9vgH82tferWNV/cYebCqL/PpaArpA/xduKkT+tbWuQrcSWYLulA6Vk6cg
X-Gm-Gg: AY/fxX6y+H58yI6B4yBPYCfuLw9ntGotuECaejVF9FOjUrNRhguOVOAC9zpgAWeU25N
	lKVEaVIYm9UuuSViGt5GPrevlskWWkNQ3mpdk+cwgc7w7X4ilCIUo7HfRrX207dGGkzDf0Z96ki
	VoEPAeNsyIikv8Pql4OBcgPB2yz8RyaznAHvF4i1itR/7pIGAyWrsKXb/TnEolntkBTPQlqy9jK
	lU/Dk6Aeq6Ei6O+7fRfkWDoZWP/d10BGUZ3E4ZW/he6pZAaaB6sblsBd+UuLG/KvSfUQUuQ7fnq
	TtoD3JKA3+P27ccOGZXY3bzhq83mdZkJICxud/0UnuOaDQiki5BAkEgTj0tdKtD3AKx51cSejy3
	18RZZSOLPJ2e/2Q5/qfjFoSeaFp2bg6C8OqtB8/z5ynqPn/+k4R8bAFmJNk4y2ORU99jLX8kawk
	bjYpdcGJ7qSQjrS/L5XLfKijdkhJHrjLrxTmgT4VpD3ax2rfeD0Na95cKoCo1LLWs7
X-Google-Smtp-Source: AGHT+IGgTCtgPDYnWtH24aL7CiMnyFGWupkTgVKcwHyVOjFMRDv6aIBibkNGYJMAmEgmRgfriMfoOg==
X-Received: by 2002:a17:906:4fc9:b0:b79:ecb0:db74 with SMTP id a640c23a62f3a-b844540607dmr1740917366b.59.1768211341917;
        Mon, 12 Jan 2026 01:49:01 -0800 (PST)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8724197145sm156452466b.11.2026.01.12.01.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 01:49:01 -0800 (PST)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [PATCH V4] qemurunner: Improve qmp module detection.
Date: Mon, 12 Jan 2026 10:47:37 +0100
Message-ID: <20260112094737.879408-2-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 09:49:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229197

Instead of using logfile to detect where qmp is located we can pass sysroot_native directly to the qemurunner so it can find the qmp module itself.

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 meta/classes-recipe/testimage.bbclass |  1 +
 meta/lib/oeqa/core/target/qemu.py     |  4 ++--
 meta/lib/oeqa/targetcontrol.py        |  2 ++
 meta/lib/oeqa/utils/qemurunner.py     | 14 +++++++-------
 meta/lib/oeqa/utils/qemutinyrunner.py |  3 ++-
 5 files changed, 14 insertions(+), 10 deletions(-)

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
index c4db0cf038..de26395bae 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -45,7 +45,7 @@ def getOutput(o):
 class QemuRunner:
 
     def __init__(self, machine, rootfs, display, tmpdir, deploy_dir_image, logfile, boottime, dump_dir, use_kvm, logger, use_slirp=False,
-     serial_ports=2, boot_patterns = defaultdict(str), use_ovmf=False, workdir=None, tmpfsdir=None):
+     serial_ports=2, boot_patterns = defaultdict(str), use_ovmf=False, workdir=None, tmpfsdir=None, native_sysroot=None):
 
         # Popen object for runqemu
         self.runqemu = None
@@ -76,6 +76,7 @@ class QemuRunner:
         self.msg = ''
         self.boot_patterns = boot_patterns
         self.tmpfsdir = tmpfsdir
+        self.native_sysroot = native_sysroot
 
         self.runqemutime = 300
         if not workdir:
@@ -186,17 +187,16 @@ class QemuRunner:
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


