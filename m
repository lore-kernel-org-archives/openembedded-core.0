Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C230CA1009
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 01:58:44 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.68012.1756778318234973582
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 18:58:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=Z1L4n4cK;
 spf=pass (domain: underview.tech, ip: 209.85.219.41, mailfrom: vince@underview.tech)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-70fa0e941a9so29252366d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 18:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1756778317; x=1757383117; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FXzuSotpMMnOjSPlL3MDTuoRfm/HOvDccvynxqGewg4=;
        b=Z1L4n4cKpD5TBdg/SmJ11CAn6TBXIvStyDhplhZdNi/49c1meURE/uX91sNpBJcQm/
         HnjxzavoUkOfhhvReZhUmDcRwmkBMI32oZhVD/AyfE8Jh81Cy4wDq9zS80WkCsLhTncI
         RQIifdmPspLq4kbo8f8cTw0hB9mcSFydcFqsfyPFWqwr2umQn+mnvXN/dMdGU68fvCCa
         pp/6eTlxOU7B7cpxU4H3WVhZTrOhwD5Z/61ev+tfkyxU1QLOMJhJAQF3G2sfW6qLTue8
         H4c1yEsmEo5PvyY5QuNyK8wVQoZmaeVA8EJnrFcniMvtF/XNMM9M7hOlbrpHzB2aPt6U
         IXvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756778317; x=1757383117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FXzuSotpMMnOjSPlL3MDTuoRfm/HOvDccvynxqGewg4=;
        b=FSEdV2LN2wCsXyEkvAv356HjaWrsqIa5qVHb1chmL/p38pVgcZQ9Iu3VfUfFET8URd
         IUq5Ey9UY548/6W6xzF6rd9p5x4UmO8xhDBxOe+cY183ZMhFcdc7OrCLRFxyF6MSGsjy
         iSV9u1PJUomesJaRe019AukdZ3mMYR4ejWv9MhDJYPjN79th1cqjEabGJUqCkQ1Rlz02
         XMDzx+xAw/6p6ILxXEvO+EG0sSv50THFxW4+LRdrkDJwxDSWms22/4bZ1oPIuLq4pyxV
         M/MRcH6o2GygVGn7orClCD0U09vbeFmux1mnTlI5Gnf3DjMd24q1eQxxYeVxAzV9U4JK
         mTgQ==
X-Gm-Message-State: AOJu0YzNiANidzDGHGAMom5kY4lLI4GZZwyMaX9Mnggmkcoqe4mKYKP7
	NsccoJmJGE+x6Up4fw6VeqH4YDxzMxZ9HAx87iM/ewmS7iOmCsFgDrm0PENk9dZl6mKDvk362/m
	Ig/949Vk=
X-Gm-Gg: ASbGnctwFBfYPTeOpVxRwhzjfxvZWguMjRMlwOFdq4Tga+Ei5/wiD4qpHQSrLcda+6f
	yuT3yse3ijU0scuoSs3PEq7NZXNhXKQtiKJc6Mg08Xh074/FLhsUTo+FbRzX5ExxdXq6cCikaHh
	aepm1t+rS1sj6/Ag307dGSf/NbZrQ+3oFI3Hk7E8pMjYGpjR16BMbeJ0f28g72SroxLx06uLX3f
	BOXit98W9ODi0NM2FGF5xpKTYlPYYXRaV7X1ERqOYJh+zj+zCzXPoum+DNLm0oApGOt0cBj5Bn9
	IQkaluIhaoruUvpJbZXMBUNb69iu1sMOFyTjwqkv947Qy7pApw4hZ1XV7mt9mqwqjO6iAGeQ2NI
	lUhrDlel6v70=
X-Google-Smtp-Source: AGHT+IEEklNzkNGfA9KJhrPToL7IvF1wzVOM6/DOx1IM/phUQViKEQPQSPmASpV6trZ+2LQhYKqvFA==
X-Received: by 2002:a05:6214:2303:b0:70d:db23:b97b with SMTP id 6a1803df08f44-70fac89eb50mr130775406d6.18.1756778316809;
        Mon, 01 Sep 2025 18:58:36 -0700 (PDT)
Received: from vince-server.. ([2601:406:4d01:1820::7efe])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720a30b79aesm4284666d6.0.2025.09.01.18.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 18:58:36 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH 3/7] bootimg_efi: copy grub modules
Date: Mon,  1 Sep 2025 21:58:21 -0400
Message-ID: <20250902015825.2785789-3-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250902015825.2785789-1-vince@underview.tech>
References: <20250902015825.2785789-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 01:58:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222685

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


