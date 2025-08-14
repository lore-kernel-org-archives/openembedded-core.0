Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C61FDCA0EDC
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 04:25:59 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.15466.1755145558480650395
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Aug 2025 21:25:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=JO2dEO0p;
 spf=pass (domain: underview.tech, ip: 209.85.219.41, mailfrom: vince@underview.tech)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-70a88ddb1a2so6438286d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 21:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1755145557; x=1755750357; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tP9J796JFWiAJbWiRJ9fxIQtNdlshPEiVGR7i1hl5kg=;
        b=JO2dEO0pukVD4uTzpY+/KclcgKq7p+VPsZ3HxO1vS/6Q1PZri3PYP5o8LG52B0xt0g
         kTDsgBtFZvKT/1ruFyofaQPn0jPVgkRuPrm5qOp84gCtKlf9v+3HEq6w5MT+7xAjp1ij
         uetMZ6G7I7IM/jHlYL8IvbMpK2to5xJk4wgkrnqxMOZAdkAKwb7a4oiN2G4G2q2BJxNs
         73Aq1tgkE+QXLu3fMFKDnSg9iOsBa85sJ/zyV0sPqzcf3AFyPKoFiIOxr9mywNm09Yty
         XlwqIHR8+Du25WBGG6Dp0Iia58b7P20GkMO8y6sCGw0DQDCENPeuVuFOLO22LAi5QO/y
         19vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755145557; x=1755750357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tP9J796JFWiAJbWiRJ9fxIQtNdlshPEiVGR7i1hl5kg=;
        b=J9dCzVDXsc6z2Wm7t0Yxq9gJx1craFRpImP6GzVgoIV0oN/j9SlqiWRANURU/8M1JG
         Ih5bD3D0QhEgwz6obDlu7+sFQJv0qdFgwxsHZoKENz0HuHxdiOdpd176acE7QDFbzITp
         z5y+JTlrCNVSYH68TAR6hCsBmRGITgfbTO8eAbuo8n040mR2f5EBdRUe/2C15CwWGRLk
         LX1ZPyu/vuovAXNYWCI0Ls+e132maZ+LyUJm9fKWwQNYC6x11xfJ3vx+/GGUqPpgLk4u
         fDc/C9nt1gOCfQy9abvJL4Xba8IHcfV5twC/SZ/kuy8lp/BOnqGVyhgQ/D4mYUheCKkr
         LUNw==
X-Gm-Message-State: AOJu0YxzOGnyEDMhD+BBVuSPe9WQmUvoH28PqJIg5hDrflEfgx37CF3Z
	iqT4tlgRWGA6EgNCRokPtkVlCU9aXkbr+Mo/rHPIsvv3lXne61JQ4E3x8VIcvJ2eCj4kQo73/kj
	nisg6ztg=
X-Gm-Gg: ASbGncuSbJ4M+qaZ0CHXv07sGOytXIPwIXSyjGdK2E1IIt4OUAjOoQFCqWgrjlI+X6q
	VbWJOoOqwv3lMAT27YYADomnGAfRqFprMBIUSiu+GRp/f/aDYeYVFPPUJLgjGk7cFyqHWZn44uj
	IsVDI705Gu3FhfX7fkzpRbDKzB6Udm/cpoMNQrY5f+wA0dnc14rZVFfDJrYCRDIyA0CY3eFYSxs
	chm8A9U/XHXNLtOzJ9DvX//rgyUNrznfTb1n3YOycq5dAz+1Kv67HiuojMM35jPRDYFQQ0fjoic
	eUIUbCtnExhB2XyAH5AFx6Gw3koz9OG0QD4oOqFLHuJD2R8jvB/2eOTYIqtDbFE5Bu72UyNjjcR
	BfvqIWLAfEsiaF1+uQEpMSDxJptU6yod3rN8+FzN7nOA5rw==
X-Google-Smtp-Source: AGHT+IGxDXPJ/ccIL1V6a77DlnZPbwM/w2PsG5IxWYykTVBxBnUGaHm5JoNmGxOEwwf993Kiwts9Og==
X-Received: by 2002:a05:6214:1d23:b0:707:5046:6a1e with SMTP id 6a1803df08f44-70b9821b51amr18220106d6.10.1755145556982;
        Wed, 13 Aug 2025 21:25:56 -0700 (PDT)
Received: from vince-B550I-AORUS-PRO-AX.. ([2601:406:4d01:1820:e358:dd1a:4ea0:986c])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70ae6cb6cc2sm8322816d6.22.2025.08.13.21.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 21:25:56 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v8 1/9] bootimg_pcbios: move syslinux install into seperate functions
Date: Thu, 14 Aug 2025 00:25:44 -0400
Message-Id: <20250814042552.21887-1-vince@underview.tech>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Aug 2025 04:25:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221841

Current oe-core bootimg_pcbios wics plugin
only supports installing syslinux directly
into the resulting wic image.

This commit seperates syslinux installation from
class BootimgPcbiosPlugin(SourcePlugin) override
functions in preparation of supporting the installation
of other bootloaders to the resulting wics plugin
such as:
	* grub
	* extlinux

Being moved now to make it easier to include
future bootloaders.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 .../lib/wic/plugins/source/bootimg_pcbios.py  | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/scripts/lib/wic/plugins/source/bootimg_pcbios.py b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
index 21f41e00bb..6bde7a67d3 100644
--- a/scripts/lib/wic/plugins/source/bootimg_pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
@@ -50,10 +50,18 @@ class BootimgPcbiosPlugin(SourcePlugin):
     @classmethod
     def do_install_disk(cls, disk, disk_name, creator, workdir, oe_builddir,
                         bootimg_dir, kernel_dir, native_sysroot):
+
+        cls._do_install_syslinux(disk, disk_name, creator, workdir, oe_builddir,
+                                 bootimg_dir, kernel_dir, native_sysroot)
+
+    @classmethod
+    def _do_install_syslinux(cls, disk, disk_name, creator, workdir, oe_builddir,
+                             bootimg_dir, kernel_dir, native_sysroot):
         """
         Called after all partitions have been prepared and assembled into a
         disk image.  In this case, we install the MBR.
         """
+
         bootimg_dir = cls._get_bootimg_dir(bootimg_dir, 'syslinux')
         mbrfile = "%s/syslinux/" % bootimg_dir
         if creator.ptable_format == 'msdos':
@@ -80,9 +88,19 @@ class BootimgPcbiosPlugin(SourcePlugin):
     def do_configure_partition(cls, part, source_params, creator, cr_workdir,
                                oe_builddir, bootimg_dir, kernel_dir,
                                native_sysroot):
+
+        cls._do_configure_syslinux(part, source_params, creator, cr_workdir,
+                                   oe_builddir, bootimg_dir, kernel_dir,
+                                   native_sysroot)
+
+    @classmethod
+    def _do_configure_syslinux(cls, part, source_params, creator, cr_workdir,
+                               oe_builddir, bootimg_dir, kernel_dir,
+                               native_sysroot):
         """
         Called before do_prepare_partition(), creates syslinux config
         """
+
         hdddir = "%s/hdd/boot" % cr_workdir
 
         install_cmd = "install -d %s" % hdddir
@@ -138,6 +156,15 @@ class BootimgPcbiosPlugin(SourcePlugin):
     def do_prepare_partition(cls, part, source_params, creator, cr_workdir,
                              oe_builddir, bootimg_dir, kernel_dir,
                              rootfs_dir, native_sysroot):
+
+        cls._do_prepare_syslinux(part, source_params, creator, cr_workdir,
+                                 oe_builddir, bootimg_dir, kernel_dir,
+                                 rootfs_dir, native_sysroot)
+
+    @classmethod
+    def _do_prepare_syslinux(cls, part, source_params, creator, cr_workdir,
+                             oe_builddir, bootimg_dir, kernel_dir,
+                             rootfs_dir, native_sysroot):
         """
         Called to do the actual content population for a partition i.e. it
         'prepares' the partition to be incorporated into the image.
-- 
2.34.1


