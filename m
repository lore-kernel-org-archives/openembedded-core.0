Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAD16C74A44
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 18:54:40 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.28107.1678474474228981056
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Mar 2023 10:54:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pOjfwZXA;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: peron.clem@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id r19-20020a05600c459300b003eb3e2a5e7bso4148369wmo.0
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 10:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678474472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28zyv0ihsOv101ecNIwYzST4i93yTIy0P79jyXITz+w=;
        b=pOjfwZXAp9s00xztay2ujdGsiVoTdJ9m6ZWcUt7CVkDRx9GIjPOWL9I21GZTX+ADvD
         vsV/swNi3C8L2iA8CXPvSPmBfEKqzazsqeKDE20SqYenpRKG8Fm5ncfCfX1UrjgK6J8y
         ReJBQ17pyMDrS/UsNN3QcaHBmPSty1qBAqUUuSqH33aiZfUBL4XY9ba4xF4xZStqlMO6
         WuQxKvZXEijhtHr5Bai2rTrl9XnxilTHMaR96uruibxYzVWKvowIk+0eoBkt+o78ENke
         RrHjfGbyVN8LNwn7h2tdgP27yaKS3Jn9ONhLiZm2cUCgiKIaLOvJb8kXxoNcFPwEH5PS
         hzjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678474472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=28zyv0ihsOv101ecNIwYzST4i93yTIy0P79jyXITz+w=;
        b=GyFEw+OgFn7KDPhW/EUK8dFejA3m5yc37411OfuWGoVhFp2aImtP0C4TzNoC9Ps9t4
         0tsvLGZ8ydEXZIkvU3MqdKsUhHJsqjAiVZDNpVeRQQAt3iBUiBQeIu1P3hnzs+HGMB3A
         MayfWViSagypokWA6w5GvVwFr31vHN8fGgibVflf29mo7lUNR58ehQCA4cywXF3CxRYM
         ym7Kk1PJ9md1WuCAbYv8hZ+7DixUWkcRUbqAwGhaobAgoOzo7o/YqRz70TOnxsMP8lOx
         lzXyo9w2ailuZFhoSHMLBxVsLodgsxS09rbMLHPD+om5D720ut0oWLXDlw1SrR16J6gT
         FNBg==
X-Gm-Message-State: AO0yUKVr/6MsrofztI7uGTSlWcxFb+BfEQvUIQmxeDcdSjzxgIuB7+Z0
	HqR5cRjceeKHfgROSjkys6i+T7Pim1o=
X-Google-Smtp-Source: AK7set/g+Dzil+6QJF66GRNnmaT0qFnQIIpvcS45tj/J3hE6ne8jyj3S7rz8ygd3NcDbrBqKJAM7Zw==
X-Received: by 2002:a05:600c:310d:b0:3eb:3945:d405 with SMTP id g13-20020a05600c310d00b003eb3945d405mr3834675wmo.38.1678474472453;
        Fri, 10 Mar 2023 10:54:32 -0800 (PST)
Received: from localhost.localdomain (2a01cb000c0d3d00488c42bf7f506bd5.ipv6.abo.wanadoo.fr. [2a01:cb00:c0d:3d00:488c:42bf:7f50:6bd5])
        by smtp.gmail.com with ESMTPSA id p3-20020a1c7403000000b003dc42d48defsm701379wmc.6.2023.03.10.10.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 10:54:32 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
	Brenda Streiff <brenda.streiff@ni.com>
Subject: [PATCH v5 2/2] runqemu: add an option to enable guest-agent virtio device
Date: Fri, 10 Mar 2023 19:54:23 +0100
Message-Id: <20230310185423.171619-2-peron.clem@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310185423.171619-1-peron.clem@gmail.com>
References: <20230310185423.171619-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 18:54:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178343

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


