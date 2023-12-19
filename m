Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D597C41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 18:09:31 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.3069.1703009363801521238
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 10:09:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FJ8pny0U;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40c41b43e1eso61513465e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 10:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1703009362; x=1703614162; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=wzlDqoI+Nnn/inORlTlZ5khk20W26kRtBtEy8X/eWic=;
        b=FJ8pny0Uu1dDx0TTjcFcGZh0n3Xi3Cbz/+7lcC++3rWbR8t9PzXp3BVE3YzEp+E5Fy
         tJtzICTAK7Mkac8rRM+CRkdQxSP16NzJsC8OSNtT1OemZwOJQYZF29IHzMT+YRWoYruR
         +f5SQbDFINqbA44GTzxRgByyfGSF1rRmJXYuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703009362; x=1703614162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wzlDqoI+Nnn/inORlTlZ5khk20W26kRtBtEy8X/eWic=;
        b=LLU7mW20JpoOpAnEcAIMyqfRuOpmVpTjylosTsfrNCkzqMaUt5zaak9Vobr41FX9AN
         ezrLIAQVXEDavyRWU7VTF91c63g/FIoFueHcDovlUtnUKI86LZnXT73YcMCCwjL9Henu
         GzNxDlGfmvuGMbkaRyoIcAZTvwskJM1qjF2fJALEeHG2gSdH0W736q7tTbtpQ+yqHXYz
         cmJiQSUDQDMTOBzSZzfdYZIdGS2OYPRvPXaobs55Q0LahtVhxtQ0hCgTqxesGhs3lH17
         dVjTK0rFZKzm74roXH2JlmJaI5Dv/oZqQF5F2p2YeJeNVO81BsJPW7YS1pjVFeyBVPnq
         gU+Q==
X-Gm-Message-State: AOJu0YwDr6b4/2+aamPtFJNMKNmzdVPYmKtY86SqQR5wnlUkPRA+AKV9
	j4xvsWDndBMcP6ZXyFT51DpCcCfhrecBf6+w0PY=
X-Google-Smtp-Source: AGHT+IF38WQhNFZveAP0N9LH8eeiiZ8UYiKcAWiZBb6yxsHXx8iIww0LIAvmfTWIU5INS8JTjPoC/g==
X-Received: by 2002:a7b:ce88:0:b0:408:434c:dae7 with SMTP id q8-20020a7bce88000000b00408434cdae7mr9085720wmj.2.1703009361705;
        Tue, 19 Dec 2023 10:09:21 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b87d:537f:7c6:e419])
        by smtp.gmail.com with ESMTPSA id h15-20020a5d504f000000b00336566b885csm12072552wrt.87.2023.12.19.10.09.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 10:09:21 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] testimage: Drop target_dumper and most of monitor_dumper
Date: Tue, 19 Dec 2023 18:09:20 +0000
Message-Id: <20231219180920.3538613-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:09:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192753

The target_dumper code is basically broken. It has been reading binary files
over the text base serial communication and runs at every command failure which
makes no sense. Each run might overwrite files from the previous run and the
output appears corrupted due to confusion from the binary data.

For now, remove the commands and the target dumper code as the command
and execution point are problematic. Also remove the same pieces of the monitor
code but leave the command list since in theory this can be moved to a more
useful place in the code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/testimage.bbclass | 16 ----------------
 meta/lib/oeqa/core/target/qemu.py     | 10 ----------
 meta/lib/oeqa/core/target/ssh.py      | 20 +-------------------
 meta/lib/oeqa/targetcontrol.py        |  2 --
 4 files changed, 1 insertion(+), 47 deletions(-)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index c6b7a1e142f..f36d9418914 100644
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
index 6893d10226c..d93b3ac94a2 100644
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
index f4dd0ca417a..09cdd14c759 100644
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
index e21655c9797..6e8b7819732 100644
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
2.39.2


