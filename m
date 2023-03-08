Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1882FC6FD1E
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 17:07:42 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.13704.1678295255512973119
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Mar 2023 09:07:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=b8FuhNNP;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: peron.clem@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id j19-20020a05600c1c1300b003e9b564fae9so1806824wms.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 09:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678295254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28zyv0ihsOv101ecNIwYzST4i93yTIy0P79jyXITz+w=;
        b=b8FuhNNPLOwYkeR48WtQ8cGRlSbUaqHNhnOrWZSktAvSo4v9BaFLZh7CBBuoCqp6+s
         XPStflENxtvnxuolK8IOrZoSHG24w/Y+aFRkElJ37VlfvYrRSVEJKR/R3km4wmLFq5zH
         l4RyK1C80gDL/EQG69wUh2YBP+bkJIihVTL3Q9hxu1eZqbTykP8d2rmqvmEb+1OXWXQ7
         KyXEUNAKUpYAURkwBOIyzUNL+WLdK6BngsZqHcQym5loNTj59pqKvDwT81G+XipLqVat
         +C4Pz4ncp6X0+77/nS+2WcaWFWuSfXaJQxnk0BFCH+LSBeQyJk+Q9B4d3EwC1sIpwanI
         336Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678295254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=28zyv0ihsOv101ecNIwYzST4i93yTIy0P79jyXITz+w=;
        b=hNnjV245vjrCGMuk93FqxjD819S9j9MD2ljIiPUOWfLDYqYqpqsjkwPqIbcPvp1bmj
         rI1kRqOH+HG8Xqb6lQBvMkG5HRh7I41rPZXw2SWvMtgWGs2iaJOIhYRMCPpasLwlXgoA
         HZeHPR6EoGH6KrEj2/Q4DvKMUYRrmm1lPY+K2F0giOJR2n6QXbNotS0xsKwuaMx9lmBw
         wjQXNSmwVPkKSmuv7hXNo/rcV/3L8GPZwVqdllL4lW7l9SKUBC3NajahQFM1e7TRZZy4
         ZdnCmuS7cFzO0rdrjp2OuT1nuTktBYQzrj/e8TlgOQDK8ciTrurtvhcxax1m94vouZxQ
         aJuA==
X-Gm-Message-State: AO0yUKWF3w4eR3cslxcNpl2Tg89WoM9s/8K2EcLcBY/kiljNCI/R4wui
	LTPXccSM9sB4dcVdZGx0lQPM3Ua1AZs=
X-Google-Smtp-Source: AK7set/+4y07m33KVM976Ok7T25rUl/flGLQ47zVO7hgnRkqlu47siJ2PAAfjaFx/Rx194qzsNywwQ==
X-Received: by 2002:a05:600c:3591:b0:3eb:3998:8c05 with SMTP id p17-20020a05600c359100b003eb39988c05mr13777355wmq.6.1678295253611;
        Wed, 08 Mar 2023 09:07:33 -0800 (PST)
Received: from localhost.localdomain (2a01cb000c0d3d0045a625b6f3ed646c.ipv6.abo.wanadoo.fr. [2a01:cb00:c0d:3d00:45a6:25b6:f3ed:646c])
        by smtp.gmail.com with ESMTPSA id l13-20020adfe58d000000b002c569acab1esm15796876wrm.73.2023.03.08.09.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 09:07:33 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
	Brenda Streiff <brenda.streiff@ni.com>
Subject: [PATCH v3 2/2] runqemu: add an option to enable guest-agent virtio device
Date: Wed,  8 Mar 2023 18:07:28 +0100
Message-Id: <20230308170728.33056-2-peron.clem@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230308170728.33056-1-peron.clem@gmail.com>
References: <20230308170728.33056-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 17:07:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178180

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


