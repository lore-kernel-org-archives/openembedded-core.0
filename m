Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A822DC87FDA
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 04:06:23 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.40399.1754885177316373551
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Aug 2025 21:06:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=EElNVvP2;
 spf=pass (domain: underview.tech, ip: 209.85.222.178, mailfrom: vince@underview.tech)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7e81c336e10so459459085a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Aug 2025 21:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1754885176; x=1755489976; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UCUiwPzLRh225dVaSNXyhuL5liUwCz4JrYEbFEQf/6o=;
        b=EElNVvP2XnXpBdHTBbSjey5aXIWQeP2RvUWPamvpWMJRT3WYj0vUtHAZdzx0OInHw+
         cgFJiB8qWEpcnEawq9VH3F0CFvmHvPjoPI4C+IamlNBuQ3dKsNJcmnm+lDn6QmXoLMru
         ap1VNddzpAH76JlMsD1FUBWln/fNLOFAXVmGVLz9V6E1uBWa8HTay6mpCPRYtqxIO1I4
         jvsI7Bxk6spZUs2inQQ48nU63lM102lLDrrh15Hsb9OQmdGS0i60wHNrTrEP9FAa23UB
         3JOQgcCeM5xclwWe1CNAo+y4Met2EfHJEKv/dUUYjaTSjNsOXZeBOtAQVngPirhNHEbf
         Q1Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754885176; x=1755489976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UCUiwPzLRh225dVaSNXyhuL5liUwCz4JrYEbFEQf/6o=;
        b=cgbix3xQMNZDHxcpcYrPr+Ll98CkMBdrpEUAMKc6F3PP4ChwCPVsporBK1KPVg0I5l
         bOW1PSKmPP708cVjgR8PNHRwhYTORexAtOn0R/VKoH+3YKC5H4FICZXsmRWAmJgdB569
         ylY6SseBmrkV/MKuF7Uzh8B2P5y0QrctMbz1DT7sA8xdKKo8SMkC5UdBhBSf5/9KuLSC
         mkRusnsYV5Tdgh2i9CyuORqZHpCvr3sLjZy7LAK5b9ilVaX2Mj5yrrq8juIeb+RZmvMH
         qCE1EC15d+nOzeLSz9U4u3qSszjc9/d0R4z9bCEsnqikRqazWk77QWwjEbVzBdxOu/V0
         4CNw==
X-Gm-Message-State: AOJu0YxkjnE4GFR4DX7eI3yMdTvT3qkErmtKaHp9B+FxA/HUd+9+WmNz
	W3Q+Cw1XYOhbsqY0ffVCXpOv86OphJvyQpWFXilB+fBvApkqqchiGLsNPO46YJZhxiun9PKQn+s
	sWOqy
X-Gm-Gg: ASbGncu/3Ct8Uw88F0FsIr3uDo9lXqaPkRv7FirQ5qx1K9JZaMLLXFWNE5yFHvYOElT
	xdQ48u+PH5xab4sfV/IV9PdhYAs5xU/a9NOYx8BKVRuQhfsKEN/+WdFYvoASuhtT+kbOr3A0whf
	4X6FbnZgGEII4pkV+S6hp4TZ8X5usZjTPLrn5rZ+VRRtTs6rPc3tXExV+aTCTMxDvp2Tq+r6rrV
	jA6rSYaEVZMVY9voea2isyTwGcFqr4vsB9qhJehf1YJ5a6d3KK+DvNNWWkvA92IYptG4Daac5g/
	6pOvRxbi9qFAI+souQkOPrVNWJT5/HzTUbHErZ89muBSsyQlOZLfkyufoBPLXJ67QgyGWHDf4K+
	cyDXnb0pPDRo=
X-Google-Smtp-Source: AGHT+IFs3MuXoX/4WSwMyCc+jmPq8iJNYlbVNwngXxZiD62DRfh59AdG5kJtnjuX9BMEA2XUWuNwNw==
X-Received: by 2002:a05:620a:4548:b0:7e8:3eb5:4cd with SMTP id af79cd13be357-7e83eb50666mr977545585a.33.1754885175997;
        Sun, 10 Aug 2025 21:06:15 -0700 (PDT)
Received: from vince-server.. ([2601:406:4d01:1820::6d26])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e823fddc10sm597842685a.16.2025.08.10.21.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 21:06:15 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v7 7/9] bootimg_pcbios: include grub as an optional bootloader
Date: Mon, 11 Aug 2025 00:03:44 -0400
Message-ID: <20250811040339.857858-14-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250811040339.857858-2-vince@underview.tech>
References: <20250811040339.857858-2-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 04:06:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221714

Commit adds in support for booting using newly added
grub functions.

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
2.43.0


