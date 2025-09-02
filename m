Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55474CA1007
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 01:58:34 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.68011.1756778312942056368
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 18:58:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=DQ9R3d8B;
 spf=pass (domain: underview.tech, ip: 209.85.219.43, mailfrom: vince@underview.tech)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-71a2d730d03so11389066d6.3
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 18:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1756778311; x=1757383111; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=erDmI44TaPwCg8OY7OyOsBj1dsMGf9ZjmAhlCNcV5/s=;
        b=DQ9R3d8BTGeVQy8TxIYP+XWKnqNcZTQcrOxat2wQF6GXq120e/PPJoa7l4q2ZJMGpp
         Me292umbnBqk/9OnHG0ZohilwUtvdx2grjEUlHW6TqTYoReL+70Dp0B0IttujEBO1Ycs
         9N/Vm1yjZDIadbAOdvN9hjnRD2uouUSVqf+PT7qoXl7bHTVhYLJuf02yLLMaz2KF/+a0
         cWCGq2V+4lzsX3CJKr/bvxsFI14Pj174Lt67aW5xcJMM3akcSt25liGs/vCidopwWeVt
         AAATGLgCqQ6CRb9YTmouUiqmD9QiEpe7Hlx6wV/oUo3bXg41GUhUWgJZX+uTGx3UlV1n
         lQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756778311; x=1757383111;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=erDmI44TaPwCg8OY7OyOsBj1dsMGf9ZjmAhlCNcV5/s=;
        b=faY+Tp2G8gSasWIwUgs3wpBzfYcOOaxefbALxNVlJaEzVRI/qmlG05+GnNEkBf6vEu
         4Nykw02OJFlrenSTU/W6wPjW7W+HEgR4bQkyvLgv2RbxBOFfwVJmP1qSKS8vcSbHcPXE
         si3auWqfWHD2Cz/EaELKbyK8wxS2dNxkk6jBgc39omUHDqm9qcT4dQByzaJyf+RVKNbr
         gVUFTe2rJGJF0n+CnsCLB0kLWOGEuZeZH0qRGcYhJrS0lVCTZET587Kt58KJhVaQbYVm
         j/3rDl6iiz5a3YuYgHcLNA+n2BhR6fioP0Q+RGk21VCDBgx8Xl7aURJWPoeq1p+fs6ze
         6adg==
X-Gm-Message-State: AOJu0Yzxkv+OFmFY9NnG6RNBAHZqcDnxYC0dNmILTHKGf06Wi9jdIVae
	Qk5gi3IlWcoMQVWUsuZAillYoWWPx9o0+6DbHhb3YI1B9L9Px+EU/tXANwxrJA9Ix4MJe6HV1hU
	oXHjbOyc=
X-Gm-Gg: ASbGncsxPAURFSBsDszSnfQP1F0JWqTt0iOXQxxh6Ol2yOTzRZLJaDmusYvekeBKeSe
	CstprppmLF+l+9eUtb+52N/M90EN77AqT3SDy7DDvQ3CCn1gexCeVh/UdKqE98MZNPuAhNWu9Yt
	OieCvsnILgyWoimcJxFbYeR0df8fg3ybEjyHLskiPPtqGo1VB8gIyaqkJpj/8tJ+tZsGAYWOr8f
	uwo3VS2q5crbn/aO3J3pYXfUls4dmLl4h/Ev4F3DyBSyKhPfo45A3TZuubDYxGO9I362oY9Vfm2
	hAWpHSQXc2i9sgUvsWSAkO9SLphT/QEwa7wMnYtZcQJzCn3ItXCz29HJlzyoLJ84JHPQMCtSbLi
	OTkoDymwEhuc=
X-Google-Smtp-Source: AGHT+IGmcwoS55qKkUt+jnmafPgR3vo+0c/xcrOTtSM+/IOnANUIZpJiH6BlL4Ax4uTaQwuqy36TzA==
X-Received: by 2002:ad4:5a07:0:b0:70f:b283:77e8 with SMTP id 6a1803df08f44-70fb2837f6dmr65574406d6.3.1756778311464;
        Mon, 01 Sep 2025 18:58:31 -0700 (PDT)
Received: from vince-server.. ([2601:406:4d01:1820::7efe])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720a30b79aesm4284666d6.0.2025.09.01.18.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 18:58:31 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH 1/7] bootimg_pcbios: support grub hybrid boot
Date: Mon,  1 Sep 2025 21:58:19 -0400
Message-ID: <20250902015825.2785789-1-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 01:58:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222683

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


