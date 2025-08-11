Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7848C87FDA
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 04:05:03 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web10.40636.1754885095665179489
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Aug 2025 21:04:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=DomcwgrE;
 spf=pass (domain: underview.tech, ip: 209.85.222.177, mailfrom: vince@underview.tech)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7e814f6fc57so456850685a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Aug 2025 21:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1754885094; x=1755489894; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9vbe2aQu/GvLqs3hg8yJjmM0Qv7/RXyPeeoWiBnr2hc=;
        b=DomcwgrER7gr49YDGlDeNLp7L5DeJHvF69mDMjjjumpRiWPhOwh63ABQ2ClOSJFoqR
         qNkjf6itdAP2rbCzXpHEmFMjnp84ZEKEUtEk2OVUFa/oOuUSoT0jNT8INPodv5q7gHnb
         e1V46y7m2PYBairK0ewju2bAu5Yka+iB6Z1ndudjN7J0kkJAcFjjqNQTVfzdtnmnNNlT
         7Ta3o+0tF0LEVytX2cSnIyO9jaq1NOV347sz5YjVKMPadKUCh5ErueCse8Kwcf61Cbri
         EO91rRIbht3WMEYiVI/c4YaDF4F2mfwx/QU9iu+TRblJmm2fqF6BuXUbjsjZEFBolkYK
         PRog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754885094; x=1755489894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9vbe2aQu/GvLqs3hg8yJjmM0Qv7/RXyPeeoWiBnr2hc=;
        b=Vc1bBiewp5H8L3fX979Nouzn0EnRO1MSKLzEU15+iUs8ncwePcJQp6P7k17y1SOk5E
         q1zdSFjM6tGXt2oz2uz38D4VJ4kGeUD/Os5s1vIvFpRVo+n32KuR9ELVma2JPN1f0ewT
         IaEeuSUH7ZHUvW+eLb7msmTS7p4L+VJM2f+bEBNJS6iP+ohm25pltpXhWxFkWQzJP04e
         03jB3Z7+JY6CgwYu6M0G2z6nIBXI1Su3Mo0v9/llzrbfCUayYhjmSTjfbflMNThmBqIF
         kCWs5yj+iXSK5ZX0fPXQA5J2H3c0ZJXRUL1pop8RfBA+bJMYttINRU9HqkLHf7VE41Wl
         6zug==
X-Gm-Message-State: AOJu0YxgUUq88pDWRDwiUkk2YVd66IS7kHoLuRAA4QG8E8LKRevys4Ow
	vvKCG4C9+ps9aJDDPvVa9byJD5BPMqNARp5i2RBmNB1trRmvPf6hLZlUebOarYF/3NDfwD+TaQo
	4Lu9m
X-Gm-Gg: ASbGncv96y7kE7dDXl76dqiSt8JZCVR1us0M/JLaw/LthNBC22CGV49+jIiSXWQbNwM
	KqoeOOa6UfVdyrs3/n6wG41yGiKGbVu+LJbS7WmgmVTYf+7XOdkLCIhGq+xz5OyTTaRb2/GWW95
	8LmZN/2Jlu7zavjGCQUHRuJ+L/Z11mZo8d/V5Su/1FdjjpMaPZeniiXgzvo+HW32MScFkQh5vPB
	M+42qsPEw1aYDIrMvKkpwlSadpvk2lQqeFUK1PMva/jNcaKrzo1jy3SikyJZRkg+Lr4ijxa8s79
	Lc3Mu6d7gOeEWSUQku7uFcfY7+CWqQfSQ6wxsaF/0nD6wh8eYlDyAcSZIFd1aOJqneC63aZdMdI
	Q761EzAP5JTIFQaiqiQXj/g==
X-Google-Smtp-Source: AGHT+IGHlZfmdaWwRQoYG8B1JIts5eCG1x3+CU5Z2zXLqBNekIgsaEcH+1SCzwVwvXSKBmdL8PhAbw==
X-Received: by 2002:a05:620a:4917:b0:7e8:1b9a:fd57 with SMTP id af79cd13be357-7e82d4ccdaamr1092931785a.23.1754885094152;
        Sun, 10 Aug 2025 21:04:54 -0700 (PDT)
Received: from vince-server.. ([2601:406:4d01:1820::6d26])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e823fddc10sm597842685a.16.2025.08.10.21.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 21:04:53 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v7 1/9] bootimg_pcbios: seperate syslinux install into seperate functions
Date: Mon, 11 Aug 2025 00:03:32 -0400
Message-ID: <20250811040339.857858-2-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 04:05:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221708

Current oe-core bootimg_pcbios wic plugin only supports
booting with syslinux.

This commit seperates syslinux creation from
class BootimgPcbiosPlugin(SourcePlugin) override
functions in prepartion of supporting booting other
bootloaders in the wics plugin such as
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
2.43.0


