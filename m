Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1E30C54E4A
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 21:57:20 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.1996.1709071036434480274
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 13:57:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bRABDLR4;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6e09143c7bdso2914260b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 13:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1709071036; x=1709675836; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gn2GrBm2b8UMJwz9z8J6Rk+NNiDahCAp8AXqltDoxow=;
        b=bRABDLR4BIifaXlVerKYqNy6W740W0GZWuR+OdfXM7BdVatzLqKd63tsA9sKiGEahz
         BIkKoUTE6Rikv3jIodeXDjSJtKzPowuv0ilF27ABFbNrW2h6UQBe48rvnBIoQtCCmHtn
         1xEojcBjPoLd6D13l0Gwkv7D+vp5BV6McxwT+OXVNIJ61P8OantX7Dxp1eS7m9w7u8jn
         jN4o/y1AYKspVsNCDl2Tl+yQKhmbqFopfB1nW4TR8gaqqnzjaty/F1nVbucp3/oVlwri
         bT4Lgwjx8GXPxUj/XUJBUqrsXqtxx/FAAj9aSSgW06k+RmczXji4ORppZbD3ihjnP9l7
         PHmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709071036; x=1709675836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gn2GrBm2b8UMJwz9z8J6Rk+NNiDahCAp8AXqltDoxow=;
        b=mfmIOrCAWBTkq3ZO6sPQmj2ghvjT3poXVhaKeH3k3eRKPuXXYU/xZ/4tyIWhKxueS2
         mbErkAq3OrRsgc3VP1K6GwZ7ZdHbNrykq0PmWWLMtnKuFvSmEvgSZ7tuo86gHjflgDgF
         Lw1Yvc/F0BsrbtK1t+1mWzuUbailry4zAlkr7pNo0rOUJDw+pLTwgbAkFybFWapBArf9
         yiT6j0etTWU8S6hzujmZwEriogGIATy7K3ji9Skj5nAae+FI4clZufYatXPY8I2/l9kd
         IqX5EjzsPvO32PJ9r+Pv4nnW2eJGdwvHN/vEJOvTvmfi6W+c0PJHnApP8WJuyBqWyKe8
         zjFg==
X-Gm-Message-State: AOJu0YwgEn1zRxIiUq9T/hI2vNrPw65kKKZEQb7vRTLINKhqXbeuBmfz
	6Q6yirppVPrUhQ7dxjKO26ibwPERTKWd1pwJd61CBvpMJpAE4gG3VKMJ9KnlVbjtFaaUH/Xr2zN
	r15E=
X-Google-Smtp-Source: AGHT+IHV5ziBXrWkHIIez4hVvMFtuWKPXzzQ5ZMRINo4ASIUQU55a2Knr3T43aHsoFrxy7jzJX0Mlg==
X-Received: by 2002:a05:6a00:982:b0:6e5:584d:8d17 with SMTP id u2-20020a056a00098200b006e5584d8d17mr1805373pfg.15.1709071035638;
        Tue, 27 Feb 2024 13:57:15 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id n7-20020aa78a47000000b006e50bbf4e71sm4936428pfa.9.2024.02.27.13.57.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 13:57:15 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/16] runqemu: add qmp socket support
Date: Tue, 27 Feb 2024 11:56:51 -1000
Message-Id: <31de620e9d899b93c6e982d3a563bbf618ce79c6.1709070850.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709070850.git.steve@sakoman.com>
References: <cover.1709070850.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 21:57:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196303

From: Ross Burton <ross.burton@arm.com>

Add support for qmp sockets and defaults to unix:qmp.sock if unspecified

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Backported from master: 380631797f0d63124a8c21efa93ab672dbd79283
Qemu throws many warnings without qmp and many runtime tests fail
without this patch also on kirkstone.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/runqemu | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index 81d95133b6..ba7c1b2461 100755
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
@@ -512,6 +514,10 @@ to your build configuration.
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
@@ -1332,6 +1338,10 @@ to your build configuration.
             raise RunQemuError("Failed to boot, QB_SYSTEM_NAME is NULL!")
         self.qemu_system = qemu_system
 
+    def setup_qmp(self):
+        if self.qmp:
+            self.qemu_opt += " -qmp %s,server,nowait" % self.qmp
+
     def setup_vga(self):
         if self.nographic == True:
             if self.sdl == True:
@@ -1462,6 +1472,7 @@ to your build configuration.
         if self.snapshot:
             self.qemu_opt += " -snapshot"
 
+        self.setup_qmp()
         self.setup_serial()
         self.setup_vga()
 
-- 
2.34.1


