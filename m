Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82333C47074
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 15:46:18 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.151052.1703864777093247596
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 07:46:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=c25YTh6y;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1d41bb4da91so20483755ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 07:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703864776; x=1704469576; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ge79HK4mhTRbSi2FtrAC8aw5+ylzUjzokAMN9U56dxY=;
        b=c25YTh6yZS4iTHd5e3hb8GldCtt74zVzfTDywwFHT0hJIJtSoZwD978rIX3sEOpOGg
         ODlskpTiIUBdJVMVKb6/4m9tcXniwWsZph7W7j+tZaRfTrMCHLb3ZOwYo5al73ayvRaL
         eSmwLIhoMlUYU+sh9vOFKKCEMou08wMx5NBUFzuZP8XYkYgK/k5a/ymaWyN8CoCldB7T
         Oz2gKp6zLNKw7YpBdlygM3umhJNXl0m+yXVX1VCPk2kKF6e0jvIIZhTOC4nbM/AERSOE
         /zcvdozbfoyt7WBmzWTJD/ZejaFPMvaXf6Lf+5XTY35ILUTLgDaeVi74FvUaDlnOpMM5
         a2+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703864776; x=1704469576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ge79HK4mhTRbSi2FtrAC8aw5+ylzUjzokAMN9U56dxY=;
        b=FLuc030NrdHgknf05vwYa2Le4WfYcLcp4D+U9u3czu1BLTu4r3K5OuuRHmnZT55CmY
         FuyYpm7gc5+v+xA4U/PMY7yRU38AzT8DY5M/B1G/Cu68u64iMmUo4u8AxFWwhhWhxCFk
         r1pXm2hT6PpEyWJSvlEalQG/gPmQtonKY0fQ6CyGuFc+I2vj5vyPntzzsNRpqFx4QvL+
         +0pnTMGTRAtZttRObLchjqi9vZ+OI2GzcFukf6D+4Ika5DobB/40usPC+F81I0ebGVIa
         01Xt5x1gjAGg1sipBsLXAKxnxFsmf80Ph1DIV+r/WFYXxMRbmK9MDWpsRqxWKbSZom6Y
         rjfA==
X-Gm-Message-State: AOJu0Yx/isVWUM2uzLdjS5JsLPu7QPdvRIMfpgF1JjBdWI+aMinh9Hdt
	B1ZbPbuwVHx0Q22Ou3g7L2GXGTsgFygBKPO8/Mubi9/Q8Rel0Q==
X-Google-Smtp-Source: AGHT+IFS00p1epVqEyj80PCy7L8uu9zC/I9BlvB5iCOfL4cu1odOhWct8DXW12p20UVfX3WrJMNtlA==
X-Received: by 2002:a17:903:11ce:b0:1d4:9c03:44e3 with SMTP id q14-20020a17090311ce00b001d49c0344e3mr786303plh.52.1703864776184;
        Fri, 29 Dec 2023 07:46:16 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id jm7-20020a17090304c700b001d3e6f58e5esm15772705plb.6.2023.12.29.07.46.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 07:46:15 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 39/41] testimage: Drop target_dumper and most of monitor_dumper
Date: Fri, 29 Dec 2023 05:44:53 -1000
Message-Id: <4c7aa982a996b23a4c5100c5a5a9390e26e5fe46.1703864512.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703864512.git.steve@sakoman.com>
References: <cover.1703864512.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 15:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193056

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The target_dumper code is basically broken. It has been reading binary files
over the text base serial communication and runs at every command failure which
makes no sense. Each run might overwrite files from the previous run and the
output appears corrupted due to confusion from the binary data.

For now, remove the commands and the target dumper code as the command
and execution point are problematic. Also remove the same pieces of the monitor
code but leave the command list since in theory this can be moved to a more
useful place in the code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a24d787987dccc95fdd95b7e85bf525a1c55b285)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/testimage.bbclass | 16 ----------------
 meta/lib/oeqa/core/target/qemu.py     | 10 ----------
 meta/lib/oeqa/core/target/ssh.py      | 20 +-------------------
 meta/lib/oeqa/targetcontrol.py        |  2 --
 4 files changed, 1 insertion(+), 47 deletions(-)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index c6b7a1e142..f36d941891 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -109,21 +109,6 @@ TESTIMAGE_DUMP_DIR ?= "${LOG_DIR}/runtime-hostdump/"
 
 TESTIMAGE_UPDATE_VARS ?= "DL_DIR WORKDIR DEPLOY_DIR_IMAGE IMAGE_LINK_NAME"
 
-testimage_dump_target () {
-    top -bn1
-    ps
-    free
-    df
-    # The next command will export the default gateway IP
-    export DEFAULT_GATEWAY=$(ip route | awk '/default/ { print $3}')
-    ping -c3 $DEFAULT_GATEWAY
-    dmesg
-    netstat -an
-    ip address
-    # Next command will dump logs from /var/log/
-    find /var/log/ -type f -name !wtmp* 2>/dev/null -exec echo "====================" \; -exec echo {} \; -exec echo "====================" \; -exec cat {} \; -exec echo "" \;
-}
-
 testimage_dump_monitor () {
     query-status
     query-block
@@ -352,7 +337,6 @@ def testimage_main(d):
     target_kwargs['serialcontrol_cmd'] = d.getVar("TEST_SERIALCONTROL_CMD") or None
     target_kwargs['serialcontrol_extra_args'] = d.getVar("TEST_SERIALCONTROL_EXTRA_ARGS") or ""
     target_kwargs['testimage_dump_monitor'] = d.getVar("testimage_dump_monitor") or ""
-    target_kwargs['testimage_dump_target'] = d.getVar("testimage_dump_target") or ""
 
     def export_ssh_agent(d):
         import os
diff --git a/meta/lib/oeqa/core/target/qemu.py b/meta/lib/oeqa/core/target/qemu.py
index 6893d10226..d93b3ac94a 100644
--- a/meta/lib/oeqa/core/target/qemu.py
+++ b/meta/lib/oeqa/core/target/qemu.py
@@ -14,8 +14,6 @@ from collections import defaultdict
 
 from .ssh import OESSHTarget
 from oeqa.utils.qemurunner import QemuRunner
-from oeqa.utils.dump import MonitorDumper
-from oeqa.utils.dump import TargetDumper
 
 supported_fstypes = ['ext3', 'ext4', 'cpio.gz', 'wic']
 
@@ -47,14 +45,6 @@ class OEQemuTarget(OESSHTarget):
                                  use_kvm=kvm, use_slirp=slirp, dump_dir=dump_dir, logger=logger,
                                  serial_ports=serial_ports, boot_patterns = boot_patterns, 
                                  use_ovmf=ovmf, tmpfsdir=tmpfsdir)
-        dump_monitor_cmds = kwargs.get("testimage_dump_monitor")
-        self.monitor_dumper = MonitorDumper(dump_monitor_cmds, dump_dir, self.runner)
-        if self.monitor_dumper:
-            self.monitor_dumper.create_dir("qmp")
-
-        dump_target_cmds = kwargs.get("testimage_dump_target")
-        self.target_dumper = TargetDumper(dump_target_cmds, dump_dir, self.runner)
-        self.target_dumper.create_dir("qemu")
 
     def start(self, params=None, extra_bootparams=None, runqemuparams=''):
         if self.use_slirp and not self.server_ip:
diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
index f4dd0ca417..09cdd14c75 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -48,8 +48,6 @@ class OESSHTarget(OETarget):
         if port:
             self.ssh = self.ssh + [ '-p', port ]
             self.scp = self.scp + [ '-P', port ]
-        self._monitor_dumper = None
-        self.target_dumper = None
 
     def start(self, **kwargs):
         pass
@@ -57,15 +55,6 @@ class OESSHTarget(OETarget):
     def stop(self, **kwargs):
         pass
 
-    @property
-    def monitor_dumper(self):
-        return self._monitor_dumper
-
-    @monitor_dumper.setter
-    def monitor_dumper(self, dumper):
-        self._monitor_dumper = dumper
-        self.monitor_dumper.dump_monitor()
-
     def _run(self, command, timeout=None, ignore_status=True):
         """
             Runs command in target using SSHProcess.
@@ -104,14 +93,7 @@ class OESSHTarget(OETarget):
 
         status, output = self._run(sshCmd, processTimeout, ignore_status)
         self.logger.debug('Command: %s\nStatus: %d Output:  %s\n' % (command, status, output))
-        if (status == 255) and (('No route to host') in output):
-            if self.monitor_dumper:
-                self.monitor_dumper.dump_monitor()
-        if status == 255:
-            if self.target_dumper:
-                self.target_dumper.dump_target()
-            if self.monitor_dumper:
-                self.monitor_dumper.dump_monitor()
+
         return (status, output)
 
     def copyTo(self, localSrc, remoteDst):
diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index e21655c979..6e8b781973 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -103,7 +103,6 @@ class QemuTarget(BaseTarget):
             self.rootfs = os.path.join(d.getVar("DEPLOY_DIR_IMAGE"),  d.getVar("IMAGE_LINK_NAME") + '.' + self.image_fstype)
             self.kernel = os.path.join(d.getVar("DEPLOY_DIR_IMAGE"), d.getVar("KERNEL_IMAGETYPE", False) + '-' + d.getVar('MACHINE', False) + '.bin')
         self.qemulog = os.path.join(self.testdir, "qemu_boot_log.%s" % self.datetime)
-        dump_target_cmds = d.getVar("testimage_dump_target")
         dump_monitor_cmds = d.getVar("testimage_dump_monitor")
         dump_dir = d.getVar("TESTIMAGE_DUMP_DIR")
         if not dump_dir:
@@ -144,7 +143,6 @@ class QemuTarget(BaseTarget):
                             tmpfsdir = d.getVar("RUNQEMU_TMPFS_DIR"),
                             serial_ports = len(d.getVar("SERIAL_CONSOLES").split()))
 
-        self.target_dumper = TargetDumper(dump_target_cmds, dump_dir, self.runner)
         self.monitor_dumper = MonitorDumper(dump_monitor_cmds, dump_dir, self.runner)
         if (self.monitor_dumper):
             self.monitor_dumper.create_dir("qmp")
-- 
2.34.1


