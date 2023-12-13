Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50BBEC4167D
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 20:30:25 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.47321.1702499423821962983
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 12:30:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=ZOADuElb;
 spf=pass (domain: baylibre.com, ip: 209.85.221.44, mailfrom: pidge@baylibre.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3332fc9b9b2so6404074f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 12:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1702499422; x=1703104222; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0D995P5tXxmICE12H8lX0ufijPEAuOzHgGQJYBY5Wmo=;
        b=ZOADuElbr9swgZRL3AE3GUhmJTT43CES22fNIV+W5jcrVAgmvbr8+m0jr5GVjW7oLC
         sFcXSNZtFC39vvhKRqRIlHhYpOueKYwBRmsEg4d1TttVVVXTqGth51KP4cpu0tnreFAE
         61lsmZd7pMv5DoYhbAYepLm3dv+xonDq1Ldof938tZoYHCXJnnTxRHRRqfZDMxLcR5ac
         reMmGRq1nRzs+OMvSWfWbJnx4HHMxvAWcYhifF+eUvK2SVFDcqeF1UQ8Tp7s3I2H0gvv
         S8zVH8Fa/RWKztbAYpY0oDGrKpg3xv3xabiVQtyTyB3XkXaLBP0wuQVlct+Ii8Ks7CJG
         KsTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702499422; x=1703104222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0D995P5tXxmICE12H8lX0ufijPEAuOzHgGQJYBY5Wmo=;
        b=RpVYbnWnxpfZPXTvRJyroNXtAlzKHnLe7gstSYwii9mbtQx9CGWZhmDFKGmtlvPopI
         gO2DK8GWyPhjpulBEI/9Jpaaa8JE0hn4DlI85rMSBV1ih3Nsi0/XJfLG4hHHtK3YxJmW
         hkGIzgQH+Z+CZdLGKHb1O/FPo7dgFpQrqurK2l0YCLBFfcVresehapJfVsChOH6DyVvp
         25QfEqcpGIOttIsLuCbN9LoZZc3qB1u+J/cH3DlrgwOFN4/QHOfqIGVpXwtPq6KigUts
         J8hP8EkjNq7rmHxZ3GzPoVNZgDMRAh8fo/O9uoipQ+kHgVSPYw+mXmNT9RZ4uG36Cly6
         l/gw==
X-Gm-Message-State: AOJu0YzKKZ5Mi2yM9ktub0slN/c8aeA1NqjGxTWji4Zn+bWg7+gj6cYT
	Ha9K5Qw54S1YkMPoV4bO3eKfk96PgIlbWmyPc1kt2g==
X-Google-Smtp-Source: AGHT+IFb5l+/QZ6UUeLCDFmtd6KMAypHSOSvhIVBJXaOQytomyKENbM6cvrDHSsVBMmgCztn/JbmvA==
X-Received: by 2002:a5d:5234:0:b0:333:3c19:d3cb with SMTP id i20-20020a5d5234000000b003333c19d3cbmr2114043wra.149.1702499422306;
        Wed, 13 Dec 2023 12:30:22 -0800 (PST)
Received: from orm.fritz.box ([194.110.145.184])
        by smtp.gmail.com with ESMTPSA id x10-20020a5d444a000000b00336371fafe6sm2945312wrr.16.2023.12.13.12.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 12:30:22 -0800 (PST)
From: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
	=?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
Subject: [PATCHv2 3/4] runqemu: add qmp socket support
Date: Wed, 13 Dec 2023 20:30:14 +0000
Message-Id: <a1f6c49d8fc25e6e4cb7e975014342ba3d0c214e.1702499299.git.pidge@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702499299.git.pidge@baylibre.com>
References: <cover.1702499299.git.pidge@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 20:30:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192315

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


