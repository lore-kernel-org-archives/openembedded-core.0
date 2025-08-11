Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A63EFC87FD2
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 04:05:13 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web11.40383.1754885109750469495
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Aug 2025 21:05:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=elNJXK+0;
 spf=pass (domain: underview.tech, ip: 209.85.222.182, mailfrom: vince@underview.tech)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7e7fb58425cso600150385a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Aug 2025 21:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1754885108; x=1755489908; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7eKgOnVBPg4nZsvPJst8cxUbqw2xjqqQxagqJKdeJHU=;
        b=elNJXK+0iDTq+VYddMvd9Q5kOzp9ZzH1nT54ctdJmLv5X75zUJFs2nUpi2KMwCmMYG
         Jau8BwtqGjIEqFXVgapNps7g752UPugIkSypTqv9Frxx4n5n5Pkt9OvkSRb/gNc5Iqt0
         sdt24TABTlVAIIf23hrW1zn4B8WsxUyQhAL3Mu1NLDgYuGP8cjJoEPIsvdJf+g9q2T8N
         8Ioj/miu94932Q91TpnPYLDvqFV16FPmS/zpE9bNfwTEqhekKLRWJHZ+O5/cmkPzINNq
         b0LX+4O2aNEDTac2Ht9ufEC7l1OFGiog5GfYAjnGQXiWF1pDkKdd1vVmtUTTb/JaYeTe
         8mIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754885108; x=1755489908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7eKgOnVBPg4nZsvPJst8cxUbqw2xjqqQxagqJKdeJHU=;
        b=PFUmtobLK14E+05VPBKkF6Wqkpkes87R0UzmbI0M09K0VpxBnLKCDWXqUK6PElg9zz
         PeYV5JSsug2gQC6NkQtHnsjhrzOdO3ym7sEB9vzB0JD00oq4FmO2rcePf7QgOttSYjTc
         HYeej34W/9hkci0yOTS0MrRxGHjn70XWFrJIcIs0foTzTzEvoy74wDAFgpxxSVrSW80U
         82SNcRDv9U5Ge9IAOsD10TFAR+xXJ0co0maUOBJ/ijBYwO0dXbD1O03PmjhBmsreb778
         UHvH8r4q6KSvXp1Vh11SdOwp7P6TJjyk2SeFKXZee5Ggk6TqD6FOlJywoWzYTaWa1aLM
         33pQ==
X-Gm-Message-State: AOJu0Yx+k0zL4f5FxoMyMcBpR33zPsDbXy618fMTzYq40vgFLrEgeZ9X
	apn/muAiN8/tyC+b9rj/Ig9F0VglutV+luwm20lgJPcdiB5JAlflKouGEzJriocetHN06cOywWe
	cQhKF
X-Gm-Gg: ASbGncvNgujNFGwOHcHhVW8itFJsr4G9XMiDBr5R42Z6swd36e0NE0UtgJlRjrECLLB
	gHJ0Aj1AjVmBf1t1c9n0CbmiRwxv6Oa6UJXn+Y76dHhsSsejLBUGKGCZekpzfRh3W1+oJay5ENW
	/Sf63JqNIGEGFZl7ti5ncgNOqPzTBL/oXx33hcURt55hsfGbrnJAsbADuMnZr5xPueWdOtqpz73
	v61tf3EM/Zw9Akr4YzlcoUECJ3+Vv2AMzAcxET+M0LNxN2NNIkUS5x4p+tJDguNTt1BPGseXQlY
	F1GFLMQtGwslwQOdwBsE3eUSr12Ykn61b+eua21fviybvfG9N0gNk5q/6TsPxZKf94n6axO3y9p
	H1Y9TnSAzNvS1iFOUn4MnEQ==
X-Google-Smtp-Source: AGHT+IGKLIRYSOlV17YDY1jQpeg2yfgx4CAVFvDuNcj3xE8VKqV62vdT/Ta2WgfFv+/jqDoqRYcZpQ==
X-Received: by 2002:a05:620a:a48c:b0:7e6:8545:5505 with SMTP id af79cd13be357-7e82c7904f8mr1463042785a.55.1754885106457;
        Sun, 10 Aug 2025 21:05:06 -0700 (PDT)
Received: from vince-server.. ([2601:406:4d01:1820::6d26])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e823fddc10sm597842685a.16.2025.08.10.21.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 21:05:06 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: "Vincent Davis Jr." <vince@underview.tech>
Subject: [PATCH v7 2/9] bootimg_pcbios: move newly created syslinux funcs to end of file
Date: Mon, 11 Aug 2025 00:03:34 -0400
Message-ID: <20250811040339.857858-4-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250811040339.857858-2-vince@underview.tech>
References: <20250811040339.857858-2-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 04:05:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221709

From: "Vincent Davis Jr." <vince@underview.tech>

This commit moves the seperated syslinux creation
functions from current position to end of file
in the order

	1. _do_configure_syslinux
	2. _do_prepare_syslinux
	3. _do_install_syslinux

This is to prepare for inclusion of other
bootloaders. It also makes reading
through the wic plugin much easier if
you group bootloader specific partition
creation functions together and place them
at the bottom of the file versus leaving
them in their current position.

Signed-off-by: Vincent Davis Jr. <vince@underview.tech>
---
 .../lib/wic/plugins/source/bootimg_pcbios.py  | 78 +++++++++----------
 1 file changed, 39 insertions(+), 39 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg_pcbios.py b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
index 6bde7a67d3..9ad301b008 100644
--- a/scripts/lib/wic/plugins/source/bootimg_pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
@@ -54,36 +54,6 @@ class BootimgPcbiosPlugin(SourcePlugin):
         cls._do_install_syslinux(disk, disk_name, creator, workdir, oe_builddir,
                                  bootimg_dir, kernel_dir, native_sysroot)
 
-    @classmethod
-    def _do_install_syslinux(cls, disk, disk_name, creator, workdir, oe_builddir,
-                             bootimg_dir, kernel_dir, native_sysroot):
-        """
-        Called after all partitions have been prepared and assembled into a
-        disk image.  In this case, we install the MBR.
-        """
-
-        bootimg_dir = cls._get_bootimg_dir(bootimg_dir, 'syslinux')
-        mbrfile = "%s/syslinux/" % bootimg_dir
-        if creator.ptable_format == 'msdos':
-            mbrfile += "mbr.bin"
-        elif creator.ptable_format == 'gpt':
-            mbrfile += "gptmbr.bin"
-        else:
-            raise WicError("Unsupported partition table: %s" %
-                           creator.ptable_format)
-
-        if not os.path.exists(mbrfile):
-            raise WicError("Couldn't find %s.  If using the -e option, do you "
-                           "have the right MACHINE set in local.conf?  If not, "
-                           "is the bootimg_dir path correct?" % mbrfile)
-
-        full_path = creator._full_path(workdir, disk_name, "direct")
-        logger.debug("Installing MBR on disk %s as %s with size %s bytes",
-                     disk_name, full_path, disk.min_size)
-
-        dd_cmd = "dd if=%s of=%s conv=notrunc" % (mbrfile, full_path)
-        exec_cmd(dd_cmd, native_sysroot)
-
     @classmethod
     def do_configure_partition(cls, part, source_params, creator, cr_workdir,
                                oe_builddir, bootimg_dir, kernel_dir,
@@ -93,6 +63,15 @@ class BootimgPcbiosPlugin(SourcePlugin):
                                    oe_builddir, bootimg_dir, kernel_dir,
                                    native_sysroot)
 
+    @classmethod
+    def do_prepare_partition(cls, part, source_params, creator, cr_workdir,
+                             oe_builddir, bootimg_dir, kernel_dir,
+                             rootfs_dir, native_sysroot):
+
+        cls._do_prepare_syslinux(part, source_params, creator, cr_workdir,
+                                 oe_builddir, bootimg_dir, kernel_dir,
+                                 rootfs_dir, native_sysroot)
+
     @classmethod
     def _do_configure_syslinux(cls, part, source_params, creator, cr_workdir,
                                oe_builddir, bootimg_dir, kernel_dir,
@@ -152,15 +131,6 @@ class BootimgPcbiosPlugin(SourcePlugin):
         cfg.write(syslinux_conf)
         cfg.close()
 
-    @classmethod
-    def do_prepare_partition(cls, part, source_params, creator, cr_workdir,
-                             oe_builddir, bootimg_dir, kernel_dir,
-                             rootfs_dir, native_sysroot):
-
-        cls._do_prepare_syslinux(part, source_params, creator, cr_workdir,
-                                 oe_builddir, bootimg_dir, kernel_dir,
-                                 rootfs_dir, native_sysroot)
-
     @classmethod
     def _do_prepare_syslinux(cls, part, source_params, creator, cr_workdir,
                              oe_builddir, bootimg_dir, kernel_dir,
@@ -234,3 +204,33 @@ class BootimgPcbiosPlugin(SourcePlugin):
 
         part.size = int(bootimg_size)
         part.source_file = bootimg
+
+    @classmethod
+    def _do_install_syslinux(cls, disk, disk_name, creator, workdir, oe_builddir,
+                             bootimg_dir, kernel_dir, native_sysroot):
+        """
+        Called after all partitions have been prepared and assembled into a
+        disk image.  In this case, we install the MBR.
+        """
+
+        bootimg_dir = cls._get_bootimg_dir(bootimg_dir, 'syslinux')
+        mbrfile = "%s/syslinux/" % bootimg_dir
+        if creator.ptable_format == 'msdos':
+            mbrfile += "mbr.bin"
+        elif creator.ptable_format == 'gpt':
+            mbrfile += "gptmbr.bin"
+        else:
+            raise WicError("Unsupported partition table: %s" %
+                           creator.ptable_format)
+
+        if not os.path.exists(mbrfile):
+            raise WicError("Couldn't find %s.  If using the -e option, do you "
+                           "have the right MACHINE set in local.conf?  If not, "
+                           "is the bootimg_dir path correct?" % mbrfile)
+
+        full_path = creator._full_path(workdir, disk_name, "direct")
+        logger.debug("Installing MBR on disk %s as %s with size %s bytes",
+                     disk_name, full_path, disk.min_size)
+
+        dd_cmd = "dd if=%s of=%s conv=notrunc" % (mbrfile, full_path)
+        exec_cmd(dd_cmd, native_sysroot)
-- 
2.43.0


