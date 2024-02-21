Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA2AEC54790
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 19:40:52 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.458.1708544445656616873
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Feb 2024 11:40:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EWvO4JN4;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-33d153254b7so3594708f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 11:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708544444; x=1709149244; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kmL470n1WLDbhnyqzyBwLr3jSk5trh2U4t5zpynb0vw=;
        b=EWvO4JN4+/MjzQZI6AoTHAi0stGMkX42UzMrtY1iNGMFUagqxmHNpPEXoh9ltL/A3Y
         N60QytCWjtlAQ9tcAGLH5PzP6BgorQBqJGtoLUI5ppzIObUchBBCmF6jdpeAEF2o/Umx
         YTUL1/lD1+1TNG1qofEylfrznDgE0TCGc6CBLq+3o3FpWiwb8fJwujfnEx7ky/GcGYPg
         5NEC0H+jhHEb9fmW0YrZqkO0ypgTtbgakb663G0KxorKdDXQTCs79OywTDllwvH7GB4L
         e4b0mJKB1xSMaxV5fkvkbQBCJXedmyMwgrGqP+JKVKUgem0UGirGPhVY33lIJ0Ixy8Ee
         tp4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708544444; x=1709149244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kmL470n1WLDbhnyqzyBwLr3jSk5trh2U4t5zpynb0vw=;
        b=rD7KtuJOPwJfEq+LUTCPsLwM+BQ2sRe756dQVx6mbaX0eMinYYrUFlphiOPu1UPdw/
         GzDpHZc3PBTxd3oQY81TV5m2JCi254Cpo5JRpiHyUz5LE+IiBcFPqDWn0s/uAlPAMQ9t
         3/Lc1CUCij4CuWH6tWxQlZSh7SI9JYTGbK7jDRJHpT84uIkqw17GUt8WeGy5l1CWIMuy
         YrZ9GGVpXUYXh1iaVtzx7Z5knVrTRYVr21tb16vZ73xZ1f27oHhEOznlcLpUAzmqVr/N
         CelQk6lrUSRgbCJUpAejDlMbBqQZCzMWR6QriH9Mr7Yvfsznn3Y2911IxrOnemOcIEbv
         /6tQ==
X-Gm-Message-State: AOJu0Yy1i9oVtwnsvuFlCzIiiXsZ+7KoCXlKn/3vo1XqxAookWBQ9RNe
	0wQp4N2B1cn+4IZJNkvx6m6filMJDxXedMuBhPBGdCeToNZqYLrieFLdakMt
X-Google-Smtp-Source: AGHT+IEz4MtasQt3A5+5QOcA8IYsLbkAh3f9PgPhsqNW2Fvf/k+8t+mivWXxpbPgE2WEuMVIYXI5yA==
X-Received: by 2002:a5d:64c8:0:b0:33d:545b:1794 with SMTP id f8-20020a5d64c8000000b0033d545b1794mr8214199wri.9.1708544443886;
        Wed, 21 Feb 2024 11:40:43 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id h5-20020a05600016c500b0033d60cba289sm8764686wrf.68.2024.02.21.11.40.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 11:40:43 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH v2 04/13] runqemu: add qmp socket support
Date: Wed, 21 Feb 2024 20:36:56 +0100
Message-ID: <20240221194036.1804463-5-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240221194036.1804463-1-adrian.freihofer@siemens.com>
References: <20240221194036.1804463-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 19:40:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195988

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


