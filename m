Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6DD4C87FDA
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 04:05:53 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web10.40644.1754885146154061965
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Aug 2025 21:05:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=IJwq4+ai;
 spf=pass (domain: underview.tech, ip: 209.85.160.172, mailfrom: vince@underview.tech)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4af123c6fc4so39600241cf.0
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Aug 2025 21:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1754885145; x=1755489945; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=otmBbsGcoukEdW/FnrobSdXhWYcx9rZbytFt4Ajfjhw=;
        b=IJwq4+aibBjgSwRXU/5A0iVwPb4sOYQEzVG8iHVmxJ3m6xF2eXu3zNuFLg0MlOcPW+
         rd2bcuAAcLZ+B89PsQbgxB7utCfJ1BV3JWspjPwpad5GOBAUANcsdLDE5snE8Y8H+pCe
         OKU9yK7F0eABvmdJDHg37j+p/5xeDjL5BkOM0BVMvlog8n0+pkq03AbmxRmAaRlV7Pa2
         Cglpw8UG6+0N78Td4y1uZKqcsNBUUMDq4Msi6MHQfQywe2TvRL6d4qAo6JappsPXRphO
         tZ+zm0lfT9CUZ5sc2YSD2wyXv2f1szf/gfVV5n6+GBwTxBrOHIxgGYua2adjHpp5D+5q
         JMxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754885145; x=1755489945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=otmBbsGcoukEdW/FnrobSdXhWYcx9rZbytFt4Ajfjhw=;
        b=C960ntqfnObKFYc0A5KcyaSWgh0QzPSSnaw3DRFndzDnqAx0V916COexNpGD+MJirP
         nK1M+y0Cvg8qKyB1EJZTR3Ib5OZwKRNU8eccKwSmsw7e/Kl7uSnn8XGLr6b+P1nULIi6
         Gg/DjTfY1a69E+YOuTM8Bo5qJ/8r2vJgLIAp7pPPLv2NVSzOXk0idTj5DpOA79CCUnvi
         St/nIgODLSK867yWuCQiFpFX7pE8HYxi4CCSQiNg5E0A/qg9DMXyx6EPrCXe7ZEFy8ac
         E5jGFAPGKR1eeeiW6AhPSqK6Q1y0ypm0jUI7vXYPwQdrjjLlPXl+daf1y5U8OR+ZPJ/Q
         zmqw==
X-Gm-Message-State: AOJu0Yyg9vtMspYP9eKRywKLti3qlNED0tF67QzFj2VV1Yhs4t+dnYvM
	vxuLf6swddH+xuRGcbN/xL1XT4jzvt3wWVjIQQuINQV5aHKgJXUOmqE/cKMhYswGZX7yvS+XNx3
	qRNN2
X-Gm-Gg: ASbGnct2siZZfaEi7Owb/lY89/azQGQ/DLsqfxlrxWT1RRXMvsojUOfLtuJrnw3iWs0
	ovB5HlTwv6ZLL9THwzhLUrI4Amo7riUT/UTDj8JmI9A/h+1mACdYTfKvAjyF4IFGg+b5D57b79w
	KPZx0Gzx/Zp3ZQ8RoFY7nToBL6EieVeYNnnjRycqOHtQlAlbDg4Wr1V5m1sybIiFMEVLhnpSR4y
	HE1ZnCQuxSMjq5uamvQkfCurl7DYG6GFmvL3u+XuQpWh8uSnNKwXMFfg5zfC4Stx2/14X81abur
	jkclZX8t+H2ucaCOJ8mtv8tTjxUpC8BiKGURdFITQ2sBhlanKha1MQg0HkaqoiM1AEsLxs/rlg2
	gBxkCIvvarig=
X-Google-Smtp-Source: AGHT+IFcPTdj940WGjysAB/+ITCkXuWC1yCL7Gd0kyVqoD4bbC2JyXC2vftsFLEmh6xDqe7jufsOrA==
X-Received: by 2002:a05:622a:5906:b0:4b0:8e21:fd57 with SMTP id d75a77b69052e-4b0aed41d45mr189774481cf.41.1754885144814;
        Sun, 10 Aug 2025 21:05:44 -0700 (PDT)
Received: from vince-server.. ([2601:406:4d01:1820::6d26])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e823fddc10sm597842685a.16.2025.08.10.21.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 21:05:44 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: "Vincent Davis Jr." <vince@underview.tech>
Subject: [PATCH v7 5/9] bootimg_pcbios: remove unrequire _syslinux func params
Date: Mon, 11 Aug 2025 00:03:40 -0400
Message-ID: <20250811040339.857858-10-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250811040339.857858-2-vince@underview.tech>
References: <20250811040339.857858-2-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 04:05:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221712

From: "Vincent Davis Jr." <vince@underview.tech>

Commit
	1. removes unrequired function params from
		* _do_prepare_syslinux
		* _do_install_syslinux
	    Reason is that they aren't required by
            the function.
	2. Moves finding of resulting wic image
           back into do_install_disk task. As
	   the same code may be leverage to install
	   other bootloaders to the resulting disk.

Signed-off-by: Vincent Davis Jr. <vince@underview.tech>
---
 .../lib/wic/plugins/source/bootimg_pcbios.py  | 25 ++++++++-----------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg_pcbios.py b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
index 887a548cde..a4fabec0ae 100644
--- a/scripts/lib/wic/plugins/source/bootimg_pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
@@ -50,9 +50,12 @@ class BootimgPcbiosPlugin(SourcePlugin):
     @classmethod
     def do_install_disk(cls, disk, disk_name, creator, workdir, oe_builddir,
                         bootimg_dir, kernel_dir, native_sysroot):
+        full_path = creator._full_path(workdir, disk_name, "direct")
+        logger.debug("Installing MBR on disk %s as %s with size %s bytes",
+                     disk_name, full_path, disk.min_size)
 
-        cls._do_install_syslinux(disk, disk_name, creator, workdir, oe_builddir,
-                                 bootimg_dir, kernel_dir, native_sysroot)
+        cls._do_install_syslinux(creator, bootimg_dir,
+                            native_sysroot, full_path)
 
     @classmethod
     def do_configure_partition(cls, part, source_params, creator, cr_workdir,
@@ -66,9 +69,8 @@ class BootimgPcbiosPlugin(SourcePlugin):
                              oe_builddir, bootimg_dir, kernel_dir,
                              rootfs_dir, native_sysroot):
 
-        cls._do_prepare_syslinux(part, source_params, creator, cr_workdir,
-                                 oe_builddir, bootimg_dir, kernel_dir,
-                                 rootfs_dir, native_sysroot)
+        cls._do_prepare_syslinux(part, cr_workdir, bootimg_dir,
+                                 kernel_dir, native_sysroot)
 
     @classmethod
     def _get_bootloader_config(cls, bootloader, loader):
@@ -144,9 +146,8 @@ class BootimgPcbiosPlugin(SourcePlugin):
         cfg.close()
 
     @classmethod
-    def _do_prepare_syslinux(cls, part, source_params, creator, cr_workdir,
-                             oe_builddir, bootimg_dir, kernel_dir,
-                             rootfs_dir, native_sysroot):
+    def _do_prepare_syslinux(cls, part, cr_workdir, bootimg_dir,
+                             kernel_dir, native_sysroot):
         """
         Called to do the actual content population for a partition i.e. it
         'prepares' the partition to be incorporated into the image.
@@ -218,8 +219,8 @@ class BootimgPcbiosPlugin(SourcePlugin):
         part.source_file = bootimg
 
     @classmethod
-    def _do_install_syslinux(cls, disk, disk_name, creator, workdir, oe_builddir,
-                             bootimg_dir, kernel_dir, native_sysroot):
+    def _do_install_syslinux(cls, creator, bootimg_dir,
+                             native_sysroot, full_path):
         """
         Called after all partitions have been prepared and assembled into a
         disk image.  In this case, we install the MBR.
@@ -240,9 +241,5 @@ class BootimgPcbiosPlugin(SourcePlugin):
                            "have the right MACHINE set in local.conf?  If not, "
                            "is the bootimg_dir path correct?" % mbrfile)
 
-        full_path = creator._full_path(workdir, disk_name, "direct")
-        logger.debug("Installing MBR on disk %s as %s with size %s bytes",
-                     disk_name, full_path, disk.min_size)
-
         dd_cmd = "dd if=%s of=%s conv=notrunc" % (mbrfile, full_path)
         exec_cmd(dd_cmd, native_sysroot)
-- 
2.43.0


