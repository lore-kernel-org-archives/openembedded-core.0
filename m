Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73B23CA1007
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 02:15:34 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.68033.1756779331692764493
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 19:15:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=hSaYbKOm;
 spf=pass (domain: underview.tech, ip: 209.85.219.51, mailfrom: vince@underview.tech)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-70deaa19d5aso28503176d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 19:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1756779330; x=1757384130; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VPU4ZMa0glJot5vc8Cad8w0mQS3c0giU/uJVjTopFlk=;
        b=hSaYbKOm8Tz1u7GXw2SoYl+PYTHioZ8jpC2HXr95BlrQJftohLeIHzTsS9GUXIajO2
         Y/7Aj7h0Ym4IuGmBcLjrDBhXEKuZf5jsQQvm0aIZta3eFaBEgDiVX0IcneC4Ps7MPhTc
         /13rX2fnvRs8fs6ZBVT033V9v+MwECB95XXCmEnNAue0oAnIFDeQG7x8xOnioehITipc
         CrlgN5EfKfBizBcu4yBOzGGsDr8pUwmkrSC1mzzWvePT7sRMX+zuEpsNUDjLq31oyJeS
         aXD9l2d4/eY2vH7e9TToscXXFE5ak91mp6XFValEcSSog9PVQUjTxSASeoNDwlyNVZq0
         9Vfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756779330; x=1757384130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VPU4ZMa0glJot5vc8Cad8w0mQS3c0giU/uJVjTopFlk=;
        b=FENTTkwJXMhFxtHGOLve3wmLDKzvwN6pLcJ7r+aaJbFcePnO+jOePNYjy2/Ctx2RNe
         X433XDFpQx2DqcVQTr2GTi2JJYdN3XoP+ArXPHt5TyFoIzSFpemXoRNVnATZ282UFpol
         bAmAJihiAv0x9W9d/f3d9lEJNY3rGqUPdK7gudOh/MRmBWS4fb4Aa6SpXBC7xDyWNLtL
         IHdgC5fyEAdHnpTDdG6WhIqWAE87svMPXmnLIaCtBe+0L4ydlx2MaTorIYJxp2jx6qLz
         AHdOD30xZ9JhC3oNA8cBwRaEVLZ0S4WSDdal82LGfJzUDYQsFgxAFBlx6OhM72PhC3Mm
         Q8hQ==
X-Gm-Message-State: AOJu0YwB3EyWLxlPbUnZ9mx5bMsqNChbiIXzDSDoTJ4erXWe5qpMfcGm
	bIomqpL0BEqHhhZjzPnt85aiR8AOgIBHf9q2ap4rhiGzpRWHJ9PtYGq7h+1fSBjHBxtlh0z1V2z
	ZnVyimfI=
X-Gm-Gg: ASbGnctrUsTYBKpHrWcO2o0w/TCGduVMYdw50nuaVZq4btp4Usw5a0UXRQEwL84McSN
	O3zQObY1RfVySaf8ga8/1o98ExSNs9w3B83Fkw6e2sHS0tk14xo0IuQafSzvADPNKOBQLddaLJl
	lnup1EdvKz1pKp0QVsHuFr5MPBHNdglZdZz2vTaLbce5AZjaDwS2fzKgjMkHQL71IJnREuNgYHR
	j9zA+go/IzrclgV6cbIISn+jt6NwVou8N3x3xHVF2w9eYN9rjGC6qX8do41Q8owDfM5B8VVJmhQ
	VHhhH9NNQEttetZBItQ6CsRfH1e+anGion+sLteww9rTp9evKzoUkOS+Rg5s0TRcPnMlnOBHf7/
	38yvHey2Av8AtlZ7Yu2uqnloQIJ3nSV02LJd0kJKQy4O9SA==
X-Google-Smtp-Source: AGHT+IEkpI+yLv7CVQuzwVo9bkE4x9gAzAITjUwhffgcxKs7910Mjs4kwhzPLVMnSs0tDic4EEsTZA==
X-Received: by 2002:a05:6214:40e:b0:70d:e501:1fa1 with SMTP id 6a1803df08f44-70fac901fbdmr117270886d6.53.1756779330396;
        Mon, 01 Sep 2025 19:15:30 -0700 (PDT)
Received: from vince-B550I-AORUS-PRO-AX.. ([2601:406:4d01:1820:90ff:fb15:d573:4b27])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720b55cf6c9sm4194436d6.49.2025.09.01.19.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 19:15:30 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [OE-core][PATCH v2 1/7] bootimg_pcbios: support grub hybrid boot
Date: Mon,  1 Sep 2025 22:15:17 -0400
Message-Id: <20250902021523.25780-1-vince@underview.tech>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 02:15:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222692

If caller wants to primarily leverage
grub as the primary boot loader current
oe-core doesn't support booting grub when
the boot firmware is legacy BIOS based and
the partition table format is GPT based.

Issue GPT header reside where core.img
should be located (at byte 512).

To navigate around issue core.img was
moved to a seperate partition.

If disk is a GPT disk caller must specify
the file system type as none and set the
partition type as BIOS boot. No filesystem
will be created on partition. This also
allows wic plugin to know where to dd
core.img.

Unfortunately No deep dive into grub-install
was perform to know the exact bytes changed
in hybrid boot case. To see the change in
bytes generated boot.img + core.img was compared
to boot.img + core.img after grub-install was
executed using the xxd command.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 .../lib/wic/plugins/source/bootimg_pcbios.py  | 55 ++++++++++++++++++-
 1 file changed, 53 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg_pcbios.py b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
index caabda6318..a7fb2eca4e 100644
--- a/scripts/lib/wic/plugins/source/bootimg_pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
@@ -101,7 +101,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
                      disk_name, full_path, disk.min_size)
 
         if cls.loader == 'grub':
-            cls._do_install_grub(creator, kernel_dir,
+            cls._do_install_grub(disk, creator, kernel_dir,
                             native_sysroot, full_path)
         elif cls.loader == 'syslinux':
             cls._do_install_syslinux(creator, bootimg_dir,
@@ -340,6 +340,12 @@ class BootimgPcbiosPlugin(SourcePlugin):
 
     @classmethod
     def _do_configure_grub(cls, part, creator, cr_workdir):
+        # If partition type is either EFI System or
+        # BIOS boot no need to generate/copy grub config.
+        if part.part_type == '21686148-6449-6E6F-744E-656564454649' or \
+           part.part_type == 'C12A7328-F81F-11D2-BA4B-00A0C93EC93B':
+            return 0
+
         hdddir = "%s/hdd" % cr_workdir
         bootloader = creator.ks.bootloader
 
@@ -438,6 +444,12 @@ class BootimgPcbiosPlugin(SourcePlugin):
          grub_mods_path, core_img, builtin_modules)
         exec_native_cmd(grub_mkimage, native_sysroot)
 
+        # If partition type is either EFI System or
+        # BIOS boot no need to copy in grub modules.
+        if part.part_type == '21686148-6449-6E6F-744E-656564454649' or \
+           part.part_type == 'C12A7328-F81F-11D2-BA4B-00A0C93EC93B':
+            return 0
+
         # Copy grub modules
         install_dir = '%s/%s/%s' % (hdddir, grub_prefix_path, grub_format)
         os.makedirs(install_dir, exist_ok=True)
@@ -454,7 +466,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
                             native_sysroot, False)
 
     @classmethod
-    def _do_install_grub(cls, creator, kernel_dir,
+    def _do_install_grub(cls, disk, creator, kernel_dir,
                          native_sysroot, full_path):
         core_img = '%s/grub-bios-core.img' % (kernel_dir)
 
@@ -478,6 +490,45 @@ class BootimgPcbiosPlugin(SourcePlugin):
             # Install core.img or grub stage 1.5
             dd_cmd = "dd if=%s of=%s conv=notrunc bs=1 seek=512" % (core_img, full_path)
             exec_cmd(dd_cmd, native_sysroot)
+        elif creator.ptable_format == 'gpt':
+            # Issue GPT headers reside where core.img should be (at byte 512).
+            # To navigate around issue core.img was moved to a seperate partition.
+            #
+            # If disk is a GPT disk caller must specify the file system
+            # type as none. As no filesystem may be created. Caller must
+            # also set the partition type to BIOS boot. So, the plugin
+            # may embed core.img there.
+
+            # Replicates what grub-install does to boot.img
+            # Found by comparing xxd output of generated boot.img
+            # to boot.img after grub-install.
+            dd_cmd = "echo -ne '\\x00\\x08' | dd of=%s conv=notrunc bs=1 count=2 seek=92" % (full_path)
+            exec_native_cmd(dd_cmd, native_sysroot)
+
+            dd_cmd = "echo -ne '\\x90\\x90' | dd of=%s conv=notrunc bs=1 count=2 seek=102" % (full_path)
+            exec_native_cmd(dd_cmd, native_sysroot)
+
+            for part in creator.parts:
+                if part.part_type == '21686148-6449-6E6F-744E-656564454649':
+                    part_start_byte = part.start * disk.sector_size
+
+                    # Install core.img or grub stage 1.5
+                    dd_cmd = "dd if=%s of=%s conv=notrunc bs=1 seek=%s" % \
+                        (core_img, full_path, part_start_byte)
+                    exec_cmd(dd_cmd, native_sysroot)
+
+                    # Replicates what grub-install does to core.img
+                    # Found by comparing xxd output of generated
+                    # core.img to core.img ater grub install.
+                    dd_cmd = "echo -ne '\\x01\\x08' | dd of=%s conv=notrunc bs=1 count=2 seek=%d" % \
+                            (full_path, part_start_byte + 500)
+                    exec_native_cmd(dd_cmd, native_sysroot)
+
+                    dd_cmd = "echo -ne '\\x2f\\x02' | dd of=%s conv=notrunc bs=1 count=2 seek=%d" % \
+                            (full_path, part_start_byte + 508)
+                    exec_native_cmd(dd_cmd, native_sysroot)
+
+                    break
         else:
             raise WicError("Unsupported partition table: %s" %
                            creator.ptable_format)
-- 
2.34.1


