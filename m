Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75144CA0FED
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 16:42:24 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web11.126.1757090534914151450
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 09:42:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=JFDA+44C;
 spf=pass (domain: underview.tech, ip: 209.85.222.182, mailfrom: vince@underview.tech)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8117aef2476so72883785a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 09:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1757090533; x=1757695333; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=erDmI44TaPwCg8OY7OyOsBj1dsMGf9ZjmAhlCNcV5/s=;
        b=JFDA+44Cln8LWltGRreQVPJHW0mEEcc7WtQe5vi4LrC14pG/OQO7WYfJMT5m2MqX/x
         LDPLDnijmw1i6G7PlTHq/FHtyMIozK+74JC4fJeWCGuGlRcZjG7Wgpx/avt/LdGIV8QB
         szm7mpd44cWaQbVzw100q728+RvNDjRLTgYijuPqGHA6zShjfytkOWqlYyM8JX8A3Bp3
         neXs5ekzY6xz6oo3myqWZvqrY/YG5flzAgyj+LKgczg/9BV28vEZFv6bJa2ig6gusYBb
         c55md4HXvNSWIPyOaavFDJISPV035+8hAc6HzmjdH4wAS969LdzhmnQsoVM0tqLBsSxG
         EHzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757090533; x=1757695333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=erDmI44TaPwCg8OY7OyOsBj1dsMGf9ZjmAhlCNcV5/s=;
        b=ff0b2SLEIZFJm7GKpp30VJWWZg5R7+ao5la2sVbbLX4TqUZllOtM7G55N0J+EUpUDi
         jD4KuyZdhM2OX8E9ASQYnpGK1YBOm0aLJEjqrC6qtzte6m16ooCTjZet8vVjS8mpdbHI
         l44wFVcKlTMwuVlXSAONBTdc3X4dGPX+fHjeldERvUtb/gvinlppKJh4/wknqFyLw2R8
         uoVGL3TjWsLuEGFwYlF1aerwEdE5DHcbXLolXfZhaZGFBdsg0UMk/HhW6b90jYrihl/G
         /deuzJexaRQaXceG+WMfVSq9YpeUONq5OgZMi0bQUURaMjLlZyHE3wX3ABS/Q8Oedrou
         KSJA==
X-Gm-Message-State: AOJu0YxFik2QYh5+48OWyMAHf28oBuZ9Qrp4gxPCiC+U1OZCTQdUwmPS
	TfPtPGyQ1NZE9vM+ehOT+hALA+n9uVga/UQD3d/QBhM34yaNEknsAGR9meZ1NAF4YeuGr9fAaje
	ynbey
X-Gm-Gg: ASbGncv3ah1Rh6A+gML9eVAHzXw8SLHat/knLorgaCE+VICKOwC0EJqQYspc86XjWnm
	AHR8wUTXaMqrh85LyVPNMn29p5T9FEvbC6Qo6M9Pc2ofAJEric2oejH5WJQkAmuQ3+L9MVj1y+P
	SyJwOMDGnm3pihszLQJEuh+ye4QUAAGEoPyJxeudrnCQNVZNTNE5XRNF1Yd92hF0YtUyjzDUjSZ
	LtTiKxHuAcuurELB9w5wtJPVaArOrr8SG1NVqzy3CY/ibA1moNuJkBW2kRXwbcVueGU/Zmuo9L5
	Fj3Yf6o/WebdscCY7O3IVCSZ9n07PrFq/zYvN/UV28m78KQhtFzzzUxWHBPcBejtjONAN1oxw0S
	d3wna1edXKDgKE62iaYJX2g==
X-Google-Smtp-Source: AGHT+IHBldigouxr5XwQN8OTWnSl6OiYOVKRSHVRJgaLEjIeHewux8FfTt09XkdT9GKl0t2zADc40Q==
X-Received: by 2002:a05:620a:a018:b0:80d:6f37:ed3d with SMTP id af79cd13be357-80d6f37f091mr1004623685a.42.1757090533333;
        Fri, 05 Sep 2025 09:42:13 -0700 (PDT)
Received: from vince-server.. ([2601:406:4d01:1820::d1ea])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-727b2c047dcsm39595046d6.59.2025.09.05.09.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 09:42:12 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [OE-core][PATCH v3 1/8] bootimg_pcbios: support grub hybrid boot
Date: Fri,  5 Sep 2025 12:41:29 -0400
Message-ID: <20250905164136.2896809-1-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 16:42:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223017

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
2.43.0


