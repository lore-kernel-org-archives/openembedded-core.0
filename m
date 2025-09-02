Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A9DFCA1007
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 02:16:04 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.68268.1756779340572722896
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 19:15:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=PGWNNiDx;
 spf=pass (domain: underview.tech, ip: 209.85.219.47, mailfrom: vince@underview.tech)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-70df91bdc53so40807326d6.3
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 19:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1756779339; x=1757384139; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3mwsaZs5IlXVYlujKOMC8jF7uSg5r7QHgVF03R2UUMg=;
        b=PGWNNiDxRMwl4DspyJFmdvapzxivoN1KICA0c9mE+vLIAI5vx30k7e/r4/he/PQ8BX
         jS2uxztoJQXTKqOoCpCt5cvqenhClkjntBHKMc25u3xReCPkPhWLpKh2op5RSdfxjr/Y
         DcV1NPwqy6xjTiaLiXvpQ78lk9Kpj6mGYW1TuMv9c+HvFnJ1MAqotszT3p82UlvAbB7J
         rbc0TWrffZdv7O1GNbTyPR99XebrqmTpbJlRZOVIKqLG/XdMSZkvhU8G9nOCe/scMwBQ
         rXQM7Hddwx7TL8T8VV6Kjdqvqnw7b7b3ZiPfAe5ThP68JbdJePoYwG1hIVfLKew0XooU
         hhjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756779339; x=1757384139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3mwsaZs5IlXVYlujKOMC8jF7uSg5r7QHgVF03R2UUMg=;
        b=e6fCPxiBw6hEfXyN4D7rU8wxZdIOrVr4Q/cAhEYzdniDvyUlEhAlAl3BzZuC8xdf7i
         WHp2Td4DWumUP696CVIUlNtUXUdkDVEIRK+VRH3Yp3NC6qaNfmffOtQiiRqNAckzFdYC
         gZYkStZc8xFwUtcw0chpG2hv5e3GTJXRB0pLNS3NXkqPZhguxnCZZMii67zI9ZFz1lG8
         TdnVYIb1+ir7S+PX4MHSDnNobJKKPpQrpNrE7EsuBmEOaLMlgV73QT4HLvZ0CZL+TeEr
         o1exnQVmaj/utv/L6tmURjzMvu6bGoYdNZuYu2BN8pMSQWxSLRM0EHK0OKKd1S3LXRLH
         JoGw==
X-Gm-Message-State: AOJu0YyvHtDbMEFvGQhWQoSdj6s7eAt2M6qzhsS155asSsURQzG5f+ac
	EIBDcgXhJqzVzoAvX7UAzNT6WzOFk9LLx/+5eFkC7eVFp3qZxWkQjAMlrt88TRfGbUG4IyCSgdR
	wUza//Ss=
X-Gm-Gg: ASbGnctCmJbQPcgBP7O+AF3Ww9EZ83yfv7G377QpWYt7DZaknRDdmXTNsA142Lppam3
	WquyYbeHBeRk98uKzYDi7LX5BpsoeL/GldiyuahXIV9XBf5JvUfCkz5/o6ooxT8dPbUzO3/tMd0
	8t7DAks14NkjsZiujJsCjo5hqg4fFCeyrNJxggKcWZ+lfJL97tTNXI3m0FbyQhFqZ+yxeMFQgX4
	QN/IapVLaLrcXXlseAfrMUDJlNsBGACq4p5//M/J77gxgmCYYweo+0liLtfAqCPnGgTUq1zSj6i
	noDbInbrhueXY7RQOgUQeJxLs8WVh6VxQVqwDnSGXN6T3A7lqpVzthz2pl1+yfJ5LBUnFP1FRdK
	E+OihtdbzaMfjRJNOZY6kOoFD5NdY55VgL0/ZdRzTPcATrsdC3BgwJlUk
X-Google-Smtp-Source: AGHT+IEOsf0mCyviVw8Ex2biU6aGba7P+iZc+/dvR6rhJfOzZA+fTbO5+JIhUHTVsO1lF4cfz5yxCw==
X-Received: by 2002:a05:6214:20eb:b0:70d:fec6:494a with SMTP id 6a1803df08f44-70fac74b6f7mr105717956d6.17.1756779339050;
        Mon, 01 Sep 2025 19:15:39 -0700 (PDT)
Received: from vince-B550I-AORUS-PRO-AX.. ([2601:406:4d01:1820:90ff:fb15:d573:4b27])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720b55cf6c9sm4194436d6.49.2025.09.01.19.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 19:15:38 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [OE-core][PATCH v2 3/7] bootimg_efi: copy grub modules
Date: Mon,  1 Sep 2025 22:15:19 -0400
Message-Id: <20250902021523.25780-3-vince@underview.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250902021523.25780-1-vince@underview.tech>
References: <20250902021523.25780-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 02:16:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222694

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
2.34.1


