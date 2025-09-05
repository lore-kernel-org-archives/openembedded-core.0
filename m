Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FC1ACA1010
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 16:42:24 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.122.1757090536596999760
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 09:42:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=ckat/1vP;
 spf=pass (domain: underview.tech, ip: 209.85.219.54, mailfrom: vince@underview.tech)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-70ddadde494so19474266d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 09:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1757090535; x=1757695335; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FXzuSotpMMnOjSPlL3MDTuoRfm/HOvDccvynxqGewg4=;
        b=ckat/1vPPu9+4qJSCLR98PynnV6+dqTuQ48vKC7ltbTpdR9xDAfVa9jJDDkGEvaPo/
         0O2aYr/Szx0h32M4wYm5gGYzN3HdyjNbfgRo05g+5yj5A0cRy2EkNMLymn6FZn/9Wdm8
         POObyG6FjVCMAZwdkMnpIdn1znaAlzu9IF2HpfOKgdK5kEgY0SQgw46hihXpTSQ/WKdf
         8UAthqqGmtjjmMOxec8mgUIHzm4nLJPv7VcC+WO/haWhxn6S79/9O85hajsbiK8zyqYA
         xb2lswg6sjcvV14ExdciIQLMerl4ZXkwSCIxeEWGYYfQBvk3pqVN5Np6tXlPFGZaNH8a
         5Nwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757090535; x=1757695335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FXzuSotpMMnOjSPlL3MDTuoRfm/HOvDccvynxqGewg4=;
        b=JCfYgSZjcOPw9svLBysf/eOBDydQjH2yI896idXL/oWnno370RiC0/8a31zkI1HsT3
         Bnb6pqglyXW03ruSdW/ZP3/XCs7VT7iAy0rMz9Qw5TME6Rq3XnryX8hRWUCxSMAqAnHK
         YGaNYLIF3Si4WCFmZ8M0VWIuFmjfW/JvvH8rbfPvEAt+TWUdSdND6YBkLO5U8g3uWMYI
         i8Z0/taFjkBLxAjx4B4t9nO+3U9G/nFYMN+SVu2zNIubDcvBbk5X9vvutvFj5tivT1FU
         64LqeKB9PtCscaDfjy4/KVN3m9BnlNnuhLWHCAKYpb2wgJxw51AodmOChwL+8k1/SUyd
         33bQ==
X-Gm-Message-State: AOJu0YzgqwxygFRwo+OA2S1ddTlxJ3m7OHOMYwiezY0ypUAihg/Ov+1r
	7Elmu4IahMXAUo7pohFmuf/ATsoDg3XTdPyKxMTipjbE5GxE1Cmvj9kPeNo9+80duITAkkq2dQC
	91O7G
X-Gm-Gg: ASbGncuHfAcvOY6RF9CZrvEruHsLVptpxBciOrIGJuuC32xFkDyG8JZhr6TtSUH6PcM
	5P90Zh68te6kIqtS5HVs8rDBaxpL3rTf7COi/R56o5PiilKoZhxR7yq+Jqrqf1oV8OV6CniaMdE
	H4eJL3kcxVP6VhWhgR6dGWuX/IWYXOMgot1yiWpIu9vjiMMk9EG0VHUEAlMBZ5e5UfZB8A1uryZ
	TRbHwH2DcGAme9/AojbaVAy+MrximCYYbXCfk741pLEXNIn4Fx3661B56WimeR9nBdjYmZCxr7u
	jMHejNpFHQZe13bVkaqJyHPpscGqMZc/JlUJ0hFXnsTftx5WbPDeOSKoPfXmy2hfWnlQslt9Iou
	AIj6PEVk7z7NIzsljcHREbA==
X-Google-Smtp-Source: AGHT+IFNliCutcjq+97danY3DqeZ4PBvCB2XbKe9oQnbcz59GXrxhA/FzKAmW99okLW0UKwz21DmMw==
X-Received: by 2002:a05:6214:2485:b0:733:74d3:5fda with SMTP id 6a1803df08f44-73374d37ce9mr18895596d6.28.1757090535068;
        Fri, 05 Sep 2025 09:42:15 -0700 (PDT)
Received: from vince-server.. ([2601:406:4d01:1820::d1ea])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-727b2c047dcsm39595046d6.59.2025.09.05.09.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 09:42:14 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [OE-core][PATCH v3 3/8] bootimg_efi: copy grub modules
Date: Fri,  5 Sep 2025 12:41:31 -0400
Message-ID: <20250905164136.2896809-3-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250905164136.2896809-1-vince@underview.tech>
References: <20250905164136.2896809-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 16:42:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223019

Assumming all grub modules weren't embedded
into boot*.efi (core.img) copy them now.

This commit populates the common partition
used to store the grub config and grub modules
for both PCBIOS and EFI.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 scripts/lib/wic/plugins/source/bootimg_efi.py | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/scripts/lib/wic/plugins/source/bootimg_efi.py b/scripts/lib/wic/plugins/source/bootimg_efi.py
index 98be12160c..c3254033d6 100644
--- a/scripts/lib/wic/plugins/source/bootimg_efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg_efi.py
@@ -350,7 +350,39 @@ class BootimgEFIPlugin(SourcePlugin):
                             (kernel_dir, mod, hdddir, mod[9:])
                         exec_cmd(cp_cmd, True)
                 else:
+                    # Assumming all grub modules weren't embedded
+                    # into grub.efi or core.img copy them now.
+                    copy_types = [ '*.mod', '*.o', '*.lst' ]
+
+                    # It appears the EFI directory resides after
+                    # initial population of the EFI System partition
+                    # in the if statement above. Remove so that the
+                    # partition doesn't contain any unrequired files.
                     shutil.rmtree("%s/EFI" % hdddir)
+
+                    hdddir = "%s/hdd" % cr_workdir
+
+                    staging_libdir = cls._get_staging_libdir()
+
+                    grub_format = get_bitbake_var('GRUB_MKIMAGE_FORMAT_EFI')
+                    if not grub_format:
+                        grub_format = 'x86_64-efi'
+
+                    grub_prefix_path = get_bitbake_var('GRUB_PREFIX_PATH')
+                    if not grub_prefix_path:
+                        grub_prefix_path = '/boot/grub'
+
+                    # Copy grub modules
+                    install_dir = '%s/%s/%s' % (hdddir, grub_prefix_path, grub_format)
+                    os.makedirs(install_dir, exist_ok=True)
+
+                    for ctype in copy_types:
+                        files = glob('%s/grub/%s/%s' % \
+                            (staging_libdir, grub_format, ctype))
+                        for file in files:
+                            shutil.copy2(file, install_dir, follow_symlinks=True)
+
+                    # bootimg_pcbios calles prepare_rootfs no need to here.
                     return 0
             elif source_params['loader'] == 'grub-efi':
                 shutil.copyfile("%s/hdd/boot/EFI/BOOT/grub.cfg" % cr_workdir,
@@ -457,3 +489,24 @@ class BootimgEFIPlugin(SourcePlugin):
 
         part.size = int(bootimg_size)
         part.source_file = bootimg
+
+    @classmethod
+    def _get_staging_libdir(cls):
+        """
+        For unknown reasons when running test with poky
+        STAGING_LIBDIR gets unset when wic create is executed.
+        Bellow is a hack to determine what STAGING_LIBDIR should
+        be if not specified.
+        """
+
+        staging_libdir = get_bitbake_var('STAGING_LIBDIR')
+        staging_dir_target = get_bitbake_var('STAGING_DIR_TARGET')
+
+        if not staging_libdir:
+            staging_libdir = '%s/usr/lib64' % staging_dir_target
+            if not os.path.isdir(staging_libdir):
+                staging_libdir = '%s/usr/lib32' % staging_dir_target
+                if not os.path.isdir(staging_libdir):
+                    staging_libdir = '%s/usr/lib' % staging_dir_target
+
+        return staging_libdir
-- 
2.43.0


