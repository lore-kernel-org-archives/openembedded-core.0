Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A53CECA0EE4
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 04:26:09 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web10.15470.1755145563793218788
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Aug 2025 21:26:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=L0B9OD3d;
 spf=pass (domain: underview.tech, ip: 209.85.219.48, mailfrom: vince@underview.tech)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-70a928c3686so6210486d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 21:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1755145562; x=1755750362; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mYCpoc5ZHK0fiFKtUpyU4evEUZ0uoQzt0H4G8S1+1ZE=;
        b=L0B9OD3dbK9rAAw6uofgmpV4Sd/bif+HA2Tnah5Q6oHFHRAlDfNTTWWd4XGnNpBJQi
         M8OC/pBRevWO91ct2MOIxmjZJukqoz+oi2l2pTx4iKqHcOsAhMNIIP8qIZD0sudxTHZe
         6tGuJvNlEmscnpFbPAjYe/UrtJybCnwvpzLRZpYeP+043M2s2kpkKbzpREX3CrVusdCZ
         ytXNJ5ZaG5E+9MeocIwa1ZUq0Ml5UBRWdq6KHjBkhwFXbXhmwe9PeRMcUqRhoztnv76g
         iqBQ0zB+xf/Qcj8aox1+Ev+7ItYuQSdH6Aw2rYoktnF4t34w90yPpG3G/JtsA2OkOB5Y
         9yRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755145562; x=1755750362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mYCpoc5ZHK0fiFKtUpyU4evEUZ0uoQzt0H4G8S1+1ZE=;
        b=hSjfglyKHcQRhzDZHFIio79qoMVwfBDFXv3PBqgds/brueFNCrwmuTLLGmbckBptl+
         sTWFo6ArXDgGdcwSVUF7l5SbcOknxobrhHcs7VIENyUinPEso5V3tnXoSBk1IqXFyHiU
         ZgzEsqIf6di9ORP5S8pQmYXm00vUnHX5e5vvw2lhGMHpHnTII8w6le2v6dfDv637pWdB
         j29CNWMyQjogLGuYDHuu1XhNPdUSVQ1DdZmI7NH9qLN/B70DSAzQcTQZqzUSztGfNTRo
         pFhdiaUXcyTCR+mUZtsGUqUDZLsG/9zeGjIOSGt0o8HXg9sSj4urPt9570Igos9HVti/
         X87Q==
X-Gm-Message-State: AOJu0Yx7lvY9yrpk8o+vmIlsTT18Bwtfv6ayOBxII5KlOl8NbANOoL0t
	HfwqWCYbJwKVdraYmbOBuKHGavWQcviTKx2nWsJEFgZucXbWnu43n00N/hpVXJdgeU3PPjTmzUc
	EHJDyfnM=
X-Gm-Gg: ASbGnctpt7MCOczQRF+caI1mvjUN6NJA0ojN4E9C6aV4295fhb1z7Y/Qa1n9pLOWfP7
	k82PljWR70W6XUXShs8iirzmbFBwD4xr5QsXjF4YzX1UF7bRot7cS9j051Cf2o/jbNMtT6GpMJI
	6jTMlzM96hlBExfiz3FViz529BmNSOgLXJOn++wxkF5HCu6zK1ncVWzZFLa7vGWCd2bR0IHXzWA
	ce8RF34S3f3M5bKW4+5SdnzXCBKTx50GtAnQA+VfXgiW4nBcx60leNL+AnnkAPgk28nVZPLy9wJ
	1STZs7Oq2ZCfAzTve27j4qsGFZ94tKW+6HkOJEDw8DRMduzVpmgQ/37nbqQ+ggaUGCyZNwKH3fD
	hWd/s/Sj710+4bw8+qYQVWpN1FX0U68i3xblX0gN0Ie4NeQ==
X-Google-Smtp-Source: AGHT+IHgq1spTn/aN9tNBqU15iIy/M0buRZA8Pq3jCkJMupB+APqmuu/bgtP5t1UZIixW7v1mpJh7A==
X-Received: by 2002:a05:6214:f2f:b0:707:255:6239 with SMTP id 6a1803df08f44-70b9830d7d0mr17492306d6.20.1755145561842;
        Wed, 13 Aug 2025 21:26:01 -0700 (PDT)
Received: from vince-B550I-AORUS-PRO-AX.. ([2601:406:4d01:1820:e358:dd1a:4ea0:986c])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70ae6cb6cc2sm8322816d6.22.2025.08.13.21.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 21:26:01 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v8 2/9] bootimg_pcbios: move syslinux funcs to end of file
Date: Thu, 14 Aug 2025 00:25:45 -0400
Message-Id: <20250814042552.21887-2-vince@underview.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250814042552.21887-1-vince@underview.tech>
References: <20250814042552.21887-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Aug 2025 04:26:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221842

This commit moves the seperated syslinux creation
functions from their current position to end of
file in the order

	1. _do_configure_syslinux
	2. _do_prepare_syslinux
	3. _do_install_syslinux

This is to prepare for inclusion of other
bootloaders. It also makes reading
through the wics plugin much easier if
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
2.34.1


