Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0CF3CA0EE5
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 04:26:19 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web11.15408.1755145575442541995
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Aug 2025 21:26:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=VO1hmQmd;
 spf=pass (domain: underview.tech, ip: 209.85.160.171, mailfrom: vince@underview.tech)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4b109bcceb9so5850761cf.2
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 21:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1755145574; x=1755750374; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RvgZjxwOTYKxbUK8oqDkfVJDT9za23Q+5vYjRqL3POQ=;
        b=VO1hmQmdBvEiNY6czOwYvPNGITee1G5bxt2Ly6JTpyKYR3qu4I6QSiUcFpj/jW1E1O
         h153hbIzsSLdV/ji8EXvtNE1SKD3BIKptWhnOKR9cciu15VRwS7lNPhGuniKLnJBhM5O
         mcxAqo1rg8THv51uIuqqZNsNsuKaGhwSUNESk9PsVLQhZHZunGTrGuehLDugEyUMYwfm
         wDvNOGOF749ec9Ktnakhf+nNjUaRi1/itikmdT1Eh25C9Kgj9LJwBSjq2Xx2jfbZVDod
         LqhZyXKhKBUBdvcLEaEhfRfBUYWYl/xgbJEZb99kwnR4EBb6JYS9m7Eqc947xOybjrGn
         eynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755145574; x=1755750374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RvgZjxwOTYKxbUK8oqDkfVJDT9za23Q+5vYjRqL3POQ=;
        b=knAWurzmcbDPMJgHIIY6EujLgLDGHvatiVW7xwDNt7xnslM/E/YNsn0FLJwQAv8Ayh
         rpjNpogCkQ68zksfqgI4pRHffvEaxDymqqOWzKdy41D6acSB9OMf5VR2O/ZdEt1YFwyW
         sqUUuJ7HJSdXprto3HMOU+G5WB4sDJ6BNKhW7F3FQncXxfn2o/qjijyBPQLtFCugpKYi
         CiMPjkIVwk653iQkFxJQEgm2zL6WjyKFF0fv7MkaWk9jSWyTMaGBXLJjQWEr+6ldJpS/
         RAupCcnz5CsrpQMsdbCansEOU4In/daepUBHD0jwN/XkSmimgrfDPQh1WOtWlJlWpkWL
         3QwA==
X-Gm-Message-State: AOJu0Yx1W3j91ajDp2JdpZoKlI5K2VMFcvYsN6fsDeG4/MsqwOqjjy7U
	FXbl+nFyHvmM7riPbKqiqQEhKodDOTbHQ9wfdckkx1hLhkU6ggL5SqzH7HEX8KGMXMexStkTTGN
	ZZmKrxJ4=
X-Gm-Gg: ASbGnctoVX9Wa599yS6WP31w1DsjOW0AzArqAFCOyuJ2JAFn/ySXnvu+9dOrDFr64Pd
	o4J87L+XL8+9m879+MGie5MLDBPkWvFBz7d8YBPO8ZUZLSG6iHd7rfrlLv6gbPjrlY7y8WISQSk
	WH3lQ9hUOmEyDfwu6iSuhGP07qjzG7+uYMuvJq6B4Jj+1ASs+y8UM3GvaJzIEP2qspK5bPbzF1O
	oaZrKu4Rylc1Ev+R3y/c1qLrKgifoKcqAPWE6Z0M42Bdbn4M/v9FkkyWqOy7BOmya+2I9imGqOL
	yeEZtzxV0J1Es6hzpDfs/3qj9YoTbMlIUWh/ixAo20MWFbo2iJKhekXa+bwGr+h1WBpDivV+ty9
	G0ithP6yklKIqUB+83TmhCRU8ueA9mpEoo4NQHcWdARA6GA==
X-Google-Smtp-Source: AGHT+IEOYQ9dBn3Es1fqND7VA21Us/Kml7CVdKYj3VL1aALAhEK37cWV7SFlma3qXnwqD8C6LvY8UQ==
X-Received: by 2002:ac8:580c:0:b0:4ab:ab85:e54e with SMTP id d75a77b69052e-4b10aa7a720mr22960871cf.8.1755145574035;
        Wed, 13 Aug 2025 21:26:14 -0700 (PDT)
Received: from vince-B550I-AORUS-PRO-AX.. ([2601:406:4d01:1820:e358:dd1a:4ea0:986c])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70ae6cb6cc2sm8322816d6.22.2025.08.13.21.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 21:26:13 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v8 7/9] bootimg_pcbios: include grub as an optional bootloader
Date: Thu, 14 Aug 2025 00:25:50 -0400
Message-Id: <20250814042552.21887-7-vince@underview.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250814042552.21887-1-vince@underview.tech>
References: <20250814042552.21887-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Aug 2025 04:26:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221847

Commit adds in support for installation of both
grub and syslinux using newly added grub functions.

Due to the bootimg_biosplusefi source_params['loader']
had to be named source_params['loader-bios'] so not
to create conflict in the wics plugin.

Commits also adds ability to set and or not set
source_params. If source_params set check
for both
	* syslinux
	* grub

if not set default to using syslinux as bootloader.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 .../lib/wic/plugins/source/bootimg_pcbios.py  | 42 ++++++++++++++++---
 1 file changed, 36 insertions(+), 6 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg_pcbios.py b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
index f50a5ae0e2..1fa9d895bb 100644
--- a/scripts/lib/wic/plugins/source/bootimg_pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
@@ -31,6 +31,9 @@ class BootimgPcbiosPlugin(SourcePlugin):
 
     name = 'bootimg_pcbios'
 
+    # Variable required for do_install_disk
+    loader = ''
+
     @classmethod
     def _get_bootimg_dir(cls, bootimg_dir, dirname):
         """
@@ -56,23 +59,50 @@ class BootimgPcbiosPlugin(SourcePlugin):
         logger.debug("Installing MBR on disk %s as %s with size %s bytes",
                      disk_name, full_path, disk.min_size)
 
-        cls._do_install_syslinux(creator, bootimg_dir,
+        if cls.loader == 'grub':
+            cls._do_install_grub(creator, kernel_dir,
+                            native_sysroot, full_path)
+        elif cls.loader == 'syslinux':
+            cls._do_install_syslinux(creator, bootimg_dir,
                             native_sysroot, full_path)
+        else:
+            raise WicError("boot loader some how not specified check do_prepare_partition")
 
     @classmethod
     def do_configure_partition(cls, part, source_params, creator, cr_workdir,
                                oe_builddir, bootimg_dir, kernel_dir,
                                native_sysroot):
-
-        cls._do_configure_syslinux(part, creator, cr_workdir)
+        try:
+            if source_params['loader-bios'] == 'grub':
+                cls._do_configure_grub(part, creator, cr_workdir)
+            elif source_params['loader-bios'] == 'syslinux':
+                cls._do_configure_syslinux(part, creator, cr_workdir)
+            else:
+                raise WicError("unrecognized bootimg_pcbios loader: %s" % source_params['loader-bios'])
+        except KeyError:
+            cls._do_configure_syslinux(part, creator, cr_workdir)
 
     @classmethod
     def do_prepare_partition(cls, part, source_params, creator, cr_workdir,
                              oe_builddir, bootimg_dir, kernel_dir,
                              rootfs_dir, native_sysroot):
-
-        cls._do_prepare_syslinux(part, cr_workdir, bootimg_dir,
-                                 kernel_dir, native_sysroot)
+        try:
+            if source_params['loader-bios'] == 'grub':
+                cls._do_prepare_grub(part, cr_workdir, oe_builddir,
+                                kernel_dir, rootfs_dir, native_sysroot)
+            elif source_params['loader-bios'] == 'syslinux':
+                cls._do_prepare_syslinux(part, cr_workdir, bootimg_dir,
+                                    kernel_dir, native_sysroot)
+            else:
+                raise WicError("unrecognized bootimg_pcbios loader: %s" % source_params['loader-bios'])
+
+            # Required by do_install_disk
+            cls.loader = source_params['loader-bios']
+        except KeyError:
+            # Required by do_install_disk
+            cls.loader = 'syslinux'
+            cls._do_prepare_syslinux(part, cr_workdir, bootimg_dir,
+                                kernel_dir, native_sysroot)
 
     @classmethod
     def _get_staging_libdir(cls):
-- 
2.34.1


