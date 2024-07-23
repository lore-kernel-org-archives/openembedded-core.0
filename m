Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4107AC3DA70
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 13:14:02 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.43740.1721740434211235528
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 06:13:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Rkvr4V5S;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7163489149eso463958a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 06:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1721740433; x=1722345233; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ej94kDsL8+qVaUoND1AV77fYnEpKTdxD/KsyeIrMxFo=;
        b=Rkvr4V5S4Dy1iOKARVyND8xsVEiMH4U6NLZB5tJ7RDSbtQQgVS5SLwGjov+bs/jGHB
         v/M79xCH/2/IspeX/hTD3xQMjfzxBvt2BsMG/lXG0lBHFow3We2IpQuSwJaoQWJosY0d
         bwC5Si8vl8RNgTGZUtF4mvqdQC6jqWVBEi3KxJEPgRmYyVDYQWg+QjRksj5xmyJ+L3/e
         aG76c9g32ljqge80Ay8evNbnckGrSq5pEcXktuwKvubGnnxOk60NXj4sG7q5iUnvWANr
         JefWpArHSjmaiCQw7Dl/FXn/FD+iAOs03Rc0GWZ5b/v8RxarUDQyT/rG+JbWpt3Hke8y
         eDiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721740433; x=1722345233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ej94kDsL8+qVaUoND1AV77fYnEpKTdxD/KsyeIrMxFo=;
        b=gWXZqXWtFbP6j8vfq21dk+VaMn+2Z4Bh0Apeo05k//Xvla0MhxKuWA+2iYtGFUgT5l
         qBLUPzqfB4C0EWtvdBUsEKqqxtftQTUIWdSVLDWfCzBKgqfuPlzb4VjI6eoogPozBj3a
         DYtB4TrIdvle46HBEeb1Z2+g++7yr92Hn+NvsyvLreKW/rMt92WVw/JlLA3h6tuPz8qE
         B0XAQvzPGA6refBvypagRle8epVwpcS8D3kRd/uHBGoT2M+jT9TXmq7wTTcEYcrOQJrS
         SlJbU48SOf7xLX2xu3+QUMBrtZdag+9U9205N/3mIwo5h8JggeBmPEYJZvZh0CHIKW1w
         wWig==
X-Gm-Message-State: AOJu0Yzm/UmxAiwjOrPNrH/6fL/2OrnV/orK1DiL9S3NrCHUD7aQ0iMS
	z2kJEHM3gAVYOfqQs6FI/u3CvnD+pzPPAuVvhEB6vZDMYk4d+9hCyflXTPRaln9o4RlZ3gxO53H
	eQVg=
X-Google-Smtp-Source: AGHT+IG5TVfF6HJFJlcm3EpD/UzL7j3hwB5F++f2caI37O9K4zLeBz9ZA48V/kmWF/UZ3mf5DD8fug==
X-Received: by 2002:a17:90a:ac0d:b0:2c9:8891:e12a with SMTP id 98e67ed59e1d1-2cd27434d39mr8499652a91.23.1721740433342;
        Tue, 23 Jul 2024 06:13:53 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cb7754a888sm10091540a91.57.2024.07.23.06.13.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 06:13:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 16/17] insane.bbclass: fix HOST_ variable names
Date: Tue, 23 Jul 2024 06:13:15 -0700
Message-Id: <7fd25eaa8fd5533d03d5f10792e2e6c30c64cc3c.1721740245.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721740245.git.steve@sakoman.com>
References: <cover.1721740245.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 13:14:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202361

From: Emil Kronborg <emil.kronborg@protonmail.com>

Commit cd25e5544ca3 ("insane: use HOST_ variables, not TARGET_ to
determine the cross system") updated the variables themselves, but not
their names. To prevent confusion, match the Python variable name to the
BitBake variable name.

Signed-off-by: Emil Kronborg <emil.kronborg@protonmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit f5bebc96580ec74d10bc96b4265357ebc9bcd6ad)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-global/insane.bbclass | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 4eb8cb1397..bcc179fe26 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -334,12 +334,12 @@ def package_qa_check_arch(path,name,d, elf, messages):
     if not elf:
         return
 
-    target_os   = d.getVar('HOST_OS')
-    target_arch = d.getVar('HOST_ARCH')
+    host_os   = d.getVar('HOST_OS')
+    host_arch = d.getVar('HOST_ARCH')
     provides = d.getVar('PROVIDES')
     bpn = d.getVar('BPN')
 
-    if target_arch == "allarch":
+    if host_arch == "allarch":
         pn = d.getVar('PN')
         oe.qa.add_message(messages, "arch", pn + ": Recipe inherits the allarch class, but has packaged architecture-specific binaries")
         return
@@ -351,12 +351,12 @@ def package_qa_check_arch(path,name,d, elf, messages):
 
     #if this will throw an exception, then fix the dict above
     (machine, osabi, abiversion, littleendian, bits) \
-        = oe.elf.machine_dict(d)[target_os][target_arch]
+        = oe.elf.machine_dict(d)[host_os][host_arch]
 
     # Check the architecture and endiannes of the binary
     is_32 = (("virtual/kernel" in provides) or bb.data.inherits_class("module", d)) and \
-            (target_os == "linux-gnux32" or target_os == "linux-muslx32" or \
-            target_os == "linux-gnu_ilp32" or re.match(r'mips64.*32', d.getVar('DEFAULTTUNE')))
+            (host_os == "linux-gnux32" or host_os == "linux-muslx32" or \
+            host_os == "linux-gnu_ilp32" or re.match(r'mips64.*32', d.getVar('DEFAULTTUNE')))
     is_bpf = (oe.qa.elf_machine_to_string(elf.machine()) == "BPF")
     if not ((machine == elf.machine()) or is_32 or is_bpf):
         oe.qa.add_message(messages, "arch", "Architecture did not match (%s, expected %s) in %s" % \
-- 
2.34.1


