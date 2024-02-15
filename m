Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6040DC48BEC
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 22:17:25 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.4904.1708035442166007475
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 14:17:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X0OqPKgt;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-411e5f21c0bso11839895e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 14:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708035440; x=1708640240; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kmL470n1WLDbhnyqzyBwLr3jSk5trh2U4t5zpynb0vw=;
        b=X0OqPKgtB/dRhcIZzY95brphG3ReBA3yJyJ/OhMzOepKqTLh6Zq2s70eVW3Ol4qruM
         xBhiiUSez05spQUM3PxvS+ZXVBAKJP//hyQw6ZfuVhsh/LeaQ+3gb2qHYg2WesDqBNAD
         IPkZgzqWVAgEMRQWYGaxOWnZE6cEoWNbUAIoNj3dAFq8Tn3iu3xS6CZ62i4BaHUqTxk3
         KZX9gAcru1A4nknZBJKdR9ib8APxOOdgr0AM4CHIb1uLqDUBJSl8DdfUeeCRzQwHJV6m
         DztZiRxFbmIyyd/UvBQnqApF6WF+YdyZBw/KUzHTa/PCj6l8fJcIj7bHAsXh7qFBvAvi
         y7HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708035440; x=1708640240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kmL470n1WLDbhnyqzyBwLr3jSk5trh2U4t5zpynb0vw=;
        b=GddNvhfMbgixq89i0Gvq/DUiB9AZreWdRKLAKtNJ2OflLzHUVj2F83DGwse+fyZare
         1A65qGeIdd6tNVJ9oprJtBUGDeGtGgMcrN7qocmlSVX9H7tUr2wT2IBWQRr1x6e1AloV
         mSJZJ6auVm8Mv0OhHlE8WuYTXgf+cOkkk4lwt9QHMkFgF6DEQ41yW0nIMkJ7NJdtj6kU
         CXYCAJ6O8WLoAfOHFGI1ACnizr+qY4Lxhya0mvGewCHe2qP196oifz5k2rauj5eHlzeb
         XdHoZqpfg8L0apFKDnQYwPQzZ66ioRkg3p9GJQG+sgpqsfTbOVxhn9QAE66TodGnthf3
         U18g==
X-Gm-Message-State: AOJu0YwQphHJyutxukQYFWAQAt2MKCkHOn7JbkETR+sdRLcqg3sOh5Ap
	tzUZPRXkm+esFXk4udUK02nG4R3QxgfYYwBNVzHM3/lzC0KjpXeMqwcZj5VIrJ0=
X-Google-Smtp-Source: AGHT+IHWt3Y/0/szDmEkVeGJpDZ5piYehHfJ75Bzoh+k/+N7+GhGTPX6AhCi4WJNz+frNDIvyHf5Jw==
X-Received: by 2002:adf:9bd9:0:b0:33d:1412:41b5 with SMTP id e25-20020adf9bd9000000b0033d141241b5mr956298wrc.71.1708035440343;
        Thu, 15 Feb 2024 14:17:20 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id e5-20020a5d65c5000000b0033cda3d3916sm335334wrw.88.2024.02.15.14.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 14:17:19 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [kirkstone][PATCH 04/12] runqemu: add qmp socket support
Date: Thu, 15 Feb 2024 23:13:50 +0100
Message-ID: <20240215221711.332614-5-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240215221711.332614-1-adrian.freihofer@siemens.com>
References: <20240215221711.332614-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 22:17:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195715

From: Ross Burton <ross.burton@arm.com>

Add support for qmp sockets and defaults to unix:qmp.sock if unspecified

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Backported from master: 380631797f0d63124a8c21efa93ab672dbd79283
Qemu throws many warnings without qmp and many runtime tests fail
without this patch also on kirkstone.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/runqemu | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index b7d7c7b4e7..b8c5adcbec 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -82,6 +82,7 @@ of the following environment variables (in any order):
     kvm-vhost - enable KVM with vhost when running x86/x86_64 (VT-capable CPU required)
     publicvnc - enable a VNC server open to all hosts
     audio - enable audio
+    qmp=<path> - create a QMP socket (defaults to unix:qmp.sock if unspecified)
     [*/]ovmf* - OVMF firmware file or base name for booting with UEFI
   tcpserial=<port> - specify tcp serial port number
   qemuparams=<xyz> - specify custom parameters to QEMU
@@ -216,6 +217,7 @@ class BaseConfig(object):
         self.cleaned = False
         # Files to cleanup after run
         self.cleanup_files = []
+        self.qmp = None
 
     def acquire_taplock(self, error=True):
         logger.debug("Acquiring lockfile %s..." % self.taplock)
@@ -526,6 +528,10 @@ class BaseConfig(object):
             elif arg == 'publicvnc':
                 self.publicvnc = True
                 self.qemu_opt_script += ' -vnc :0'
+            elif arg == "qmp":
+                self.qmp = "unix:qmp.sock"
+            elif arg.startswith("qmp="):
+                self.qmp = arg[len('qmp='):]
             elif arg.startswith('tcpserial='):
                 self.tcpserial_portnum = '%s' % arg[len('tcpserial='):]
             elif arg.startswith('qemuparams='):
@@ -1346,6 +1352,10 @@ class BaseConfig(object):
             raise RunQemuError("Failed to boot, QB_SYSTEM_NAME is NULL!")
         self.qemu_system = qemu_system
 
+    def setup_qmp(self):
+        if self.qmp:
+            self.qemu_opt += " -qmp %s,server,nowait" % self.qmp
+
     def setup_vga(self):
         if self.nographic == True:
             if self.sdl == True:
@@ -1476,6 +1486,7 @@ class BaseConfig(object):
         if self.snapshot:
             self.qemu_opt += " -snapshot"
 
+        self.setup_qmp()
         self.setup_serial()
         self.setup_vga()
 
-- 
2.43.1


