Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36A5AECAAD5
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 18:26:54 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web09.51802.1661624798408283960
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:26:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=OEhQATq3;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id r22so4224605pgm.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=Kwt6XJBvXQs1rQiDXcT0TP/k4V7LlryHgzCI/CqIvfw=;
        b=OEhQATq3LjfVjoVu8VZ7pyRl8KpBpsF7jWvtK7B5EuTExw8GVnKj/zUfvvrQ7JcwKV
         3q49IcQGKzNqPEPSmiyUOb8NjVn1qxkr44AwEhI/UhGrYnLQjGoM0IA3MZh59nihGyCE
         CcYuF1oHMVQj8iRFS5LQFq8dOh2bpTlqR2ZfQYp3heaXJkfUkPUocW9lNmWJGfbp8JCE
         nkBxKEl2u1/5pxq80WPSujhY86NkPsbLYmPUDxUJqYToDADmBBB7ZBfYXBR0zcx2tNj1
         1B8THFdyVLWyA0a/F6mQttvjTMNBQzs43lyEhgKKRknHUYIwO6Zbfbjq0RMPJ2V/gDZ/
         lDGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=Kwt6XJBvXQs1rQiDXcT0TP/k4V7LlryHgzCI/CqIvfw=;
        b=iazn+OJvoZuVfegh7MYoFPi1mAmEnXFZt3BL7OgBcX6kiETbA4lnapuas8/F0CYMYC
         sbFTNLZpy5qzFxGlQp15q7/DI9TYQCdV+Q1H9FYbIgHcl9CoVG+7C4MO7BAxM0Ovgwby
         BHIQP817hPySHuP0FsTSOHYelVbhhGlieU5AWfqhLymhQSJv/xew6AwbummNSk7cwysK
         6Kl9SIG8wC6B1xceekSoICKTyXARBrAW60/MHzy1BthvaBvqHDgDrvPX5hSLpNGQZ36M
         TuUFzqxGLHpiRfXE3YPikm1SbQrIb1IuH5sDsQKCRqKZnjuJ6j6UszkTDkYtSpRyxyyr
         U0vw==
X-Gm-Message-State: ACgBeo1RX7Vou+U+5PPvH5vzk2Rzbv0hhaVjp9JkAndIj2/UyjHGZ5EX
	t+iuU/9rBS7tT7YWbaMaj1+kW50zwrZzYmwk
X-Google-Smtp-Source: 
 AA6agR5H+gupdalolR3YQ85Dpzu9HcWMOkAP1tCmAsQy6+rL2r/f7spf+NKcd/FofCvgAtEMxwb9nA==
X-Received: by 2002:a63:d60b:0:b0:429:7f1e:aa6 with SMTP id
 q11-20020a63d60b000000b004297f1e0aa6mr7753475pgg.492.1661624811765;
        Sat, 27 Aug 2022 11:26:51 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 r21-20020a170902ea5500b001708c4ebbaesm3864716plg.309.2022.08.27.11.26.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Aug 2022 11:26:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 23/24] wic/bootimg-efi: use cross objcopy when
 building unified kernel image
Date: Sat, 27 Aug 2022 08:25:47 -1000
Message-Id: 
 <0c4bea4743a2e658f587ab1c6bb2b483e5383d30.1661624569.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661624569.git.steve@sakoman.com>
References: <cover.1661624569.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Aug 2022 18:26:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169964

From: Ross Burton <ross.burton@arm.com>

We can't rely on the host objcopy knowing how to process target binaries,
so use the cross objcopy in the sysroot instead.

Also construct the command argument-by-argument as the format expression
was getting unwieldy.

(From OE-Core rev: 0264aeedbf21e9e7a104243c11b3b57f00e38bda)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py | 25 +++++++++----------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 0391aebdc8..a65a5b9780 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -326,21 +326,20 @@ class BootimgEFIPlugin(SourcePlugin):
                 exec_cmd(install_cmd)
 
                 staging_dir_host = get_bitbake_var("STAGING_DIR_HOST")
+                target_sys = get_bitbake_var("TARGET_SYS")
 
                 # https://www.freedesktop.org/software/systemd/man/systemd-stub.html
-                objcopy_cmd = "objcopy \
-                    --add-section .osrel=%s --change-section-vma .osrel=0x20000 \
-                    --add-section .cmdline=%s --change-section-vma .cmdline=0x30000 \
-                    --add-section .linux=%s --change-section-vma .linux=0x2000000 \
-                    --add-section .initrd=%s --change-section-vma .initrd=0x3000000 \
-                    %s %s" % \
-                    ("%s/usr/lib/os-release" % staging_dir_host,
-                    cmdline.name,
-                    "%s/%s" % (staging_kernel_dir, kernel),
-                    initrd.name,
-                    efi_stub,
-                    "%s/EFI/Linux/linux.efi" % hdddir)
-                exec_cmd(objcopy_cmd)
+                objcopy_cmd = "%s-objcopy" % target_sys
+                objcopy_cmd += " --add-section .osrel=%s/usr/lib/os-release" % staging_dir_host
+                objcopy_cmd += " --change-section-vma .osrel=0x20000"
+                objcopy_cmd += " --add-section .cmdline=%s" % cmdline.name
+                objcopy_cmd += " --change-section-vma .cmdline=0x30000"
+                objcopy_cmd += " --add-section .linux=%s/%s" % (staging_kernel_dir, kernel)
+                objcopy_cmd += " --change-section-vma .linux=0x2000000"
+                objcopy_cmd += " --add-section .initrd=%s" % initrd.name
+                objcopy_cmd += " --change-section-vma .initrd=0x3000000"
+                objcopy_cmd += " %s %s/EFI/Linux/linux.efi" % (efi_stub, hdddir)
+                exec_native_cmd(objcopy_cmd, native_sysroot)
         else:
             install_cmd = "install -m 0644 %s/%s %s/%s" % \
                 (staging_kernel_dir, kernel, hdddir, kernel)
-- 
2.25.1


