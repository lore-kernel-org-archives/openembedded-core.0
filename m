Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93B6BC10DC3
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 14:36:18 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.85712.1701959773854172800
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 06:36:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=OTuIhJXB;
 spf=pass (domain: baylibre.com, ip: 209.85.128.41, mailfrom: pidge@baylibre.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40c09f4bea8so11233685e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 06:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701959772; x=1702564572; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0D995P5tXxmICE12H8lX0ufijPEAuOzHgGQJYBY5Wmo=;
        b=OTuIhJXBMRJ0lrZ17NBVfWdSa/u4ybcHTV6gGfigfFko5PZJdTprhUw2LUAwH1uyIP
         6nUYIx9fBpWUj67PZqTvQUiCah3NhSUIPuyagIR0w/YFMuh2XLK0Sxgy/TFphBpp5ZH1
         QLi8uqAObulVAm+9Mpss7FhuF/kbgAi8oIiSRMwgWClW87ykL/a7jzIIRlNVuZQj7cyr
         vhzjxTwW/qiOXgLXC4PmteLWo2nBgJD5R749IJvhhbotvXY/VomWoKg1Oy/z25XhLvbl
         zDlGKP/BpWaqBgKDZkvcZompybZeRzkrK93mi/ltbXROcIxWoGm1bYqT48XkWqNgGsDc
         jdsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701959772; x=1702564572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0D995P5tXxmICE12H8lX0ufijPEAuOzHgGQJYBY5Wmo=;
        b=HxXu6Ve55rP/yd6qboqgHLmBJ4/xtrgEqjHwO1KZyiOYGPHFVK0gocVeVM/2wkHizw
         AG3aXxTWc7GJkMqzWDqY+O0pjcOxqcijSCLIrq1E469W8K0dBUZxwQlDqhkFYxFGsXzx
         054T2r2yD2NlFoOdszIK4t6bcx1LPLcJ7VQlhgLRu78N0sqLXL4GtDlSxU61VmY8vRck
         h3kgBmzfpC7hJ55I1PWB88vooFlEHOROOuZRz7APsyi/GjJDXxOExuxXfLwc+ZtCBYwE
         2t6uhiqrzvUHS1BlYBnLc6fd9kNSlm5/ZeK8Vzp4F+qD9lRP+gfHgwGGdt54aa/zg95l
         s+Gw==
X-Gm-Message-State: AOJu0Yyl4FAjBDjNIK7lDbP5f+iYuscd3OphMu1+C/ksXBOoLH/jiS+1
	vRDQYda8BQeJqLBLV9VCx9jKkAO4VeLyQWczx6mfBg==
X-Google-Smtp-Source: AGHT+IFAtPymCKnUXF8CvGDboNNC0t/ilytVg47fGkoT5XPoFeSrrS3oGwQY9CPmrJeXlsFKdQyy4w==
X-Received: by 2002:a05:600c:331b:b0:40b:5e59:da7d with SMTP id q27-20020a05600c331b00b0040b5e59da7dmr1628680wmp.144.1701959772403;
        Thu, 07 Dec 2023 06:36:12 -0800 (PST)
Received: from orm.fritz.box ([194.110.145.184])
        by smtp.gmail.com with ESMTPSA id v14-20020a05600c444e00b0040b47c53610sm2072570wmn.14.2023.12.07.06.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 06:36:12 -0800 (PST)
From: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
	=?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
Subject: [PATCH 3/4] runqemu: add qmp socket support
Date: Thu,  7 Dec 2023 14:36:06 +0000
Message-Id: <1aca04f39524aa1716280c888d99de1ff226b0dc.1701959631.git.pidge@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701959631.git.pidge@baylibre.com>
References: <cover.1701959631.git.pidge@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 14:36:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191961

From: Ross Burton <ross.burton@arm.com>

Add support for qmp sockets and defaults to unix:qmp.sock if unspecified

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
---
 scripts/runqemu | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index 18aeb7f5f0c..6a5a6451daf 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -84,6 +84,7 @@ of the following environment variables (in any order):
     publicvnc - enable a VNC server open to all hosts
     audio - enable audio
     guestagent - enable guest agent communication
+    qmp=<path> - create a QMP socket (defaults to unix:qmp.sock if unspecified)
     [*/]ovmf* - OVMF firmware file or base name for booting with UEFI
   tcpserial=<port> - specify tcp serial port number
   qemuparams=<xyz> - specify custom parameters to QEMU
@@ -221,6 +222,7 @@ class BaseConfig(object):
         self.cleaned = False
         # Files to cleanup after run
         self.cleanup_files = []
+        self.qmp = None
         self.guest_agent = False
         self.guest_agent_sockpath = '/tmp/qga.sock'
 
@@ -536,6 +538,10 @@ to your build configuration.
                 self.qemu_opt_script += ' -vnc :0'
             elif arg == 'guestagent':
                 self.guest_agent = True
+            elif arg == "qmp":
+                self.qmp = "unix:qmp.sock"
+            elif arg.startswith("qmp="):
+                self.qmp = arg[len('qmp='):]
             elif arg.startswith('guestagent-sockpath='):
                 self.guest_agent_sockpath = '%s' % arg[len('guestagent-sockpath='):]
             elif arg.startswith('tcpserial='):
@@ -1406,6 +1412,10 @@ to your build configuration.
             self.qemu_opt += ' -device virtio-serial '
             self.qemu_opt += ' -device virtserialport,chardev=qga0,name=org.qemu.guest_agent.0 '
 
+    def setup_qmp(self):
+        if self.qmp:
+            self.qemu_opt += " -qmp %s,server,nowait" % self.qmp
+
     def setup_vga(self):
         if self.nographic == True:
             if self.sdl == True:
@@ -1547,6 +1557,7 @@ to your build configuration.
             self.qemu_opt += " -snapshot"
 
         self.setup_guest_agent()
+        self.setup_qmp()
         self.setup_serial()
         self.setup_vga()
 
-- 
2.34.1


