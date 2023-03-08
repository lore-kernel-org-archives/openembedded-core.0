Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35CFEC64EC4
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 17:14:52 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.13933.1678295682166301305
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Mar 2023 09:14:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AuXlEIgu;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: peron.clem@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id fm20-20020a05600c0c1400b003ead37e6588so1806963wmb.5
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 09:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678295680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28zyv0ihsOv101ecNIwYzST4i93yTIy0P79jyXITz+w=;
        b=AuXlEIguFtBSTe9UJ+P+bJBjRsgvMIpk4DQGDNXsL1R8ysUI3gkCjb2hVcQBHENC5Q
         8euH8lDYS/V0iR+soF56bthFo4yQJxjm0z8YwO6Yxnh3m8KzpAtgf3jJiOPRC228Tsuh
         Zwb37hZEQGHhwCZErfmZPgCdTy4BmEl+Fl3AxzoSkUHwLvXh6t7ZxjmyfPAnuqjBok8d
         zmbyvdnUEmWKX1Zz0UOHZPnD62eiJWpmhPI2EfRsLdlW3IFh3RCfhURaruT0/S3dzGhN
         TOaKKvyrfmdqni83WFC0EoJzxVa+H0GBEruUB+YY3PRZpfzOX9y2u1n/tlI32AaZSI8b
         T6QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678295680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=28zyv0ihsOv101ecNIwYzST4i93yTIy0P79jyXITz+w=;
        b=qJpj66h+5k52Vv5Abz4GcAhk+pYNNKENI369bqzbimdJE3AWuBYLQK5+/fiW3JeNa4
         SZXXOMZbFsUO3q+7k2CJy7/GYhWWHwof7FknLzOnVS3Y24bQvdhS9coxCRtdwY2wx890
         xkTICN3CbnQTT8H/5Exr4qw+RFAxK+hFOqR8mkqIU/hOfANSgftCo5G8i/T1GY5rAO2F
         9HhXBn0/+1DX3rAHYspg0sAW5J+Zi5m9qrBpU/Se7USKuHAjCkJLWnwekVY1ouJfh+bL
         7VAfqJnBFPnCD55aIr35dgWndvr0RoXAXjP8Fc7khiYEult9sIzQR0rVmpM7J81fgQMf
         oCgA==
X-Gm-Message-State: AO0yUKVUTNLXR/BqE5NZBE69gjW8WZuYg3OKAtq8Bt6UWes6d10cFnx4
	D7MPPrfW/h6dElGrktr9NyZSm7jEVUs=
X-Google-Smtp-Source: AK7set/JCdVzCEzaDhywl3MkmrKV3qKecWH8N39pEQGi6TSTEq15Z5YD8dqM3XP6NPXzA4EZh1RTAQ==
X-Received: by 2002:a05:600c:548d:b0:3eb:2da4:efe7 with SMTP id iv13-20020a05600c548d00b003eb2da4efe7mr16395538wmb.11.1678295680308;
        Wed, 08 Mar 2023 09:14:40 -0800 (PST)
Received: from localhost.localdomain (2a01cb000c0d3d0045a625b6f3ed646c.ipv6.abo.wanadoo.fr. [2a01:cb00:c0d:3d00:45a6:25b6:f3ed:646c])
        by smtp.gmail.com with ESMTPSA id h15-20020a05600c314f00b003d9aa76dc6asm113141wmo.0.2023.03.08.09.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 09:14:39 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
	Brenda Streiff <brenda.streiff@ni.com>
Subject: [PATCH v4 2/2] runqemu: add an option to enable guest-agent virtio device
Date: Wed,  8 Mar 2023 18:14:37 +0100
Message-Id: <20230308171437.35160-2-peron.clem@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230308171437.35160-1-peron.clem@gmail.com>
References: <20230308171437.35160-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 17:14:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178182

Add support to the runqemu script for a new option, 'guestagent', that
enables the virtio serial port for host-to-guest communication.

Signed-off-by: Brenda Streiff <brenda.streiff@ni.com>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 scripts/runqemu | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index 58b0c191e1..38aa35fdd4 100755
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
@@ -1375,6 +1382,12 @@ class BaseConfig(object):
         except FileNotFoundError:
             raise RunQemuError("/dev/dri directory does not exist; no render nodes available on this machine. %s" %(render_hint))
 
+    def setup_guest_agent(self):
+        if self.guest_agent == True:
+            self.qemu_opt += ' -chardev socket,path=' + self.guest_agent_sockpath + ',server,nowait,id=qga0 '
+            self.qemu_opt += ' -device virtio-serial '
+            self.qemu_opt += ' -device virtserialport,chardev=qga0,name=org.qemu.guest_agent.0 '
+
     def setup_vga(self):
         if self.nographic == True:
             if self.sdl == True:
@@ -1506,6 +1519,7 @@ class BaseConfig(object):
         if self.snapshot:
             self.qemu_opt += " -snapshot"
 
+        self.setup_guest_agent()
         self.setup_serial()
         self.setup_vga()
 
-- 
2.34.1


