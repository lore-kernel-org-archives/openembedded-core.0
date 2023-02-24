Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A21FC6FA8E
	for <webhook@archiver.kernel.org>; Sun,  5 Mar 2023 20:10:09 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.20449.1677252722685975135
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Feb 2023 07:32:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ky+Tegrz;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: peron.clem@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id p16so9444263wmq.5
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 07:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpRG3L/9eQJeUijSe7Xmg2yFu/YDYFP3XwnGTZa0InE=;
        b=Ky+Tegrz3KvaLqfZpLSHdKX4jP7BZmqvc+OBT4c/FEpVTPy3n3AKauZ+L9orPDNFdz
         XKwkQfEyKk/gl07J3nfO13VP7MPcJ7ZIO4cFtdWiETorD8R2AMCB4RZfDFBy97UcT6N4
         e65fwHnNWYrb2O1Am3+ooBa3wH8cRj1Q6l1q85IA589xCGUiwaMWrOQfpPWb5odlIwTd
         9JuNW5KqrOSKR+qj0idTCiiw78naOc0f++mJnbXJWPqibnVd+HJxsraP8A2ZLW9qurQa
         p0v38PmhKy+ys1vX13jfSdg3QticK6RXRzdOXqDKBmwpd8YH/qS7NkiCUfbGUaf+rBm9
         sEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bpRG3L/9eQJeUijSe7Xmg2yFu/YDYFP3XwnGTZa0InE=;
        b=BKcvDyhWKxa7gHjT08SLvGvkFdLhfugTfnZGOR46+CRAz46di2fXzGMSzo60pAJ12v
         eX6izyxauiUrKog5WogHXRFpss+aPuHj18JCSeHBvcdfDcsgT2CsOqObCqth3phwuPiU
         7e87QK9PbiJZ+qwX1QP9KQZCVF/sKNbyNX1HG9Ndg26FADknu8WojoPnmYenVf3xQclY
         XCghJ2CYy/oLhaY3ii7yOCsK49mvdWQoeevQeh9zBVbJJyC/3emmCdTvTl0xjir7+3PK
         I+r7xUxjDP6ivW8Db0N4fhe4NF/IEe2OUi1/lls85Q3D9b+XFhhg0w9oZ4DffFhAXjbz
         +fXA==
X-Gm-Message-State: AO0yUKVt346z1sUD8YXUS0/O+f1Lu6vdq/j9Bt9Ue2PYuyhXg44OpRxl
	OvpD/DgEpUXgaqmBAR8lxiB3WufPwgk=
X-Google-Smtp-Source: AK7set/g4u06TefdhObgVK/Fx9XNkgf7M6TCLV9QM/dRf/sHFrrxHZ9eONUHspFCru0qHnjRNHUPTg==
X-Received: by 2002:a05:600c:a293:b0:3eb:29fe:7baa with SMTP id hu19-20020a05600ca29300b003eb29fe7baamr1255091wmb.34.1677252720858;
        Fri, 24 Feb 2023 07:32:00 -0800 (PST)
Received: from Clement-Blade14.outsight.local (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id z14-20020a05600c220e00b003e11f280b8bsm3114284wml.44.2023.02.24.07.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 07:32:00 -0800 (PST)
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
	Brenda Streiff <brenda.streiff@ni.com>
Subject: [PATCH v2 2/2] runqemu: add an option to enable guest-agent virtio device
Date: Fri, 24 Feb 2023 16:31:57 +0100
Message-Id: <20230224153157.20305-2-peron.clem@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230224153157.20305-1-peron.clem@gmail.com>
References: <20230224153157.20305-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Mar 2023 20:10:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178051

Add support to the runqemu script for a new option, 'guestagent', that
enables the virtio serial port for host-to-guest communication.

Signed-off-by: Brenda Streiff <brenda.streiff@ni.com>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 scripts/runqemu | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index def11ea911..e71a1e8828 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -82,6 +82,7 @@ of the following environment variables (in any order):
     kvm-vhost - enable KVM with vhost when running x86/x86_64 (VT-capable CPU required)
     publicvnc - enable a VNC server open to all hosts
     audio - enable audio
+    guestagent - enable guest agent communication
     [*/]ovmf* - OVMF firmware file or base name for booting with UEFI
   tcpserial=<port> - specify tcp serial port number
   qemuparams=<xyz> - specify custom parameters to QEMU
@@ -216,6 +217,8 @@ class BaseConfig(object):
         self.cleaned = False
         # Files to cleanup after run
         self.cleanup_files = []
+        self.guest_agent = False
+        self.guest_agent_sockpath = '/tmp/qga.sock'
 
     def acquire_taplock(self, error=True):
         logger.debug("Acquiring lockfile %s..." % self.taplock)
@@ -526,6 +529,10 @@ class BaseConfig(object):
             elif arg == 'publicvnc':
                 self.publicvnc = True
                 self.qemu_opt_script += ' -vnc :0'
+            elif arg == 'guestagent':
+                self.guest_agent = True
+            elif arg.startswith('guestagent-sockpath='):
+                self.guest_agent_sockpath = '%s' % arg[len('guestagent-sockpath='):]
             elif arg.startswith('tcpserial='):
                 self.tcpserial_portnum = '%s' % arg[len('tcpserial='):]
             elif arg.startswith('qemuparams='):
@@ -1366,6 +1373,12 @@ class BaseConfig(object):
             raise RunQemuError("Failed to boot, QB_SYSTEM_NAME is NULL!")
         self.qemu_system = qemu_system
 
+    def setup_guest_agent(self):
+        if self.guest_agent == True:
+            self.qemu_opt += ' -chardev socket,path=' + self.guest_agent_sockpath + ',server,nowait,id=qga0 '
+            self.qemu_opt += ' -device virtio-serial '
+            self.qemu_opt += ' -device virtserialport,chardev=qga0,name=org.qemu.guest_agent.0 '
+
     def setup_vga(self):
         if self.nographic == True:
             if self.sdl == True:
@@ -1496,6 +1509,7 @@ class BaseConfig(object):
         if self.snapshot:
             self.qemu_opt += " -snapshot"
 
+        self.setup_guest_agent()
         self.setup_serial()
         self.setup_vga()
 
-- 
2.34.1


