Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web12.7495.1593486288760540959
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2020 20:04:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=xDgzSUaf;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id g17so7877058plq.12
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2020 20:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=46LI6ZSvSBrWkCX+DvsCKNsEKsG3QhCP8KvfK6SnQLA=;
        b=xDgzSUafFKY62u4BKMtHd7J9yvqysrQasy17Y97/+etAKA33ItLSmKbkItbuJZ2H7l
         2mF8pKHRFXlL/0ZINuJ/Hs7Nt7sHfjXDqvi8WT9/pp2DwSaQZtRTdiEJJD2QdKO2QjPF
         qtfKNeb/JqKWHJUC9CAHfZ1coNNXn1oHJkBt3QorPMAqciWCgggGDYtvV+U/XobeyGuc
         HGfm3SgqsK8D0Rq4weS6tQSLDfHN5KNMTYPkmWvdKMbSqPHnhDhuD20aZwfyqThweQsY
         7MOuoVs7n4Yr7oHmarUmW/PGO6Hrs3gdt4HJ8Pcny47s9SZMzaN8iUrwW+4qkrFZF6fa
         wF/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=46LI6ZSvSBrWkCX+DvsCKNsEKsG3QhCP8KvfK6SnQLA=;
        b=ONnVwIlNM65gVtjEsqmaO18ZfSp5LvF22DRXlARmY+OegXz/OkY6Pfv993mpj3YL4U
         Lqeiiyt7vCxg1wuV4+3NgynR9BRhLTtpM+nPoZ5KhoB/YUG0TJAqUhlOdRr4QFHICoZM
         FxWAlKNDk6LjDwZv9tlS1SO/IsGj5KC62n139S35IbjoA0wuOwOubyJwLab/wfhw3dIW
         JsikhMCU1/t3rP2eklpyHgugj/WHrGrxKnDAEBx80IAzpphFtIl2HhQk48TkgwOI7+Pi
         Si5+zPHTjSiXXJasyiVB3pSQ/+aG6zB8Hffer4EM4Llm0/GONw00grR6A9TM4uBYN1bA
         Z0iA==
X-Gm-Message-State: AOAM531QE/vQopATyckoA+GRQzzOMXM/PYl+JtckRhcgROrex1xYFXSu
	4+0YGrQrtmjfimC3ihY402y6OnXfPZ0HEg==
X-Google-Smtp-Source: ABdhPJzHMZSfTPe7Djiq0UdXpb18M7efF5e0BoBxMu6vAMMthiiQ2rd2LdExsOqIaT+If3iY3Gpf2w==
X-Received: by 2002:a17:902:7b92:: with SMTP id w18mr5082896pll.258.1593486287873;
        Mon, 29 Jun 2020 20:04:47 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id 6sm875627pfi.170.2020.06.29.20.04.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 20:04:47 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/22] runqemu: add QB_ROOTFS_EXTRA_OPT parameter
Date: Mon, 29 Jun 2020 17:03:10 -1000
Message-Id: <1a5cb1bd56be2b784208516a7c73c49906c7022f.1593485896.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593485896.git.steve@sakoman.com>
References: <cover.1593485896.git.steve@sakoman.com>

From: Konrad Weihmann <kweihmann@outlook.com>

Content of the optional parameter will be appended to the rootfs-device
in the qemu configuration, in case QB_ROOTFS_OPT is not specified.
By default this is empty.

Example use cases are:

Defining 'readonly' when using squashfs, so multiple instances of qemu
can share the same base image, something that cannot be done by just
specifying 'snapshot'.

Defining 'bootindex=0' which helps to get past the EFI shell in
ovmf-binary. This also enables the use case of running WIC images with
EFI bootloader through the testimage.bbclass.

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e9b8c194636cb5505774a2a71bf54450580dd5b8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/qemuboot.bbclass |  5 +++++
 scripts/runqemu               | 11 ++++++++---
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index 54044c38da..99da543f9a 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -65,6 +65,10 @@
 #                   " -device virtio-serial-device -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1 -device virtconsole,chardev=virtcon"
 #                   Note, runqemu will replace "@PORT@" with the port number which is used.
 #
+# QB_ROOTFS_EXTRA_OPT: extra options to be appended to the rootfs device in case there is none specified by QB_ROOTFS_OPT.
+#                      Can be used to automatically determine the image from the other variables
+#                      but define things link 'bootindex' when booting from EFI or 'readonly' when using squashfs
+#                      without the need to specify a dedicated qemu configuration
 # Usage:
 # IMAGE_CLASSES += "qemuboot"
 # See "runqemu help" for more info
@@ -77,6 +81,7 @@ QB_OPT_APPEND ?= "-show-cursor"
 QB_NETWORK_DEVICE ?= "-device virtio-net-pci,netdev=net0,mac=@MAC@"
 QB_CMDLINE_IP_SLIRP ?= "ip=dhcp"
 QB_CMDLINE_IP_TAP ?= "ip=192.168.7.@CLIENT@::192.168.7.@GATEWAY@:255.255.255.0"
+QB_ROOTFS_EXTRA_OPT ?= ""
 
 # This should be kept align with ROOT_VM
 QB_DRIVE_TYPE ?= "/dev/sd"
diff --git a/scripts/runqemu b/scripts/runqemu
index 6a77e3db9a..310d79fdc5 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1196,6 +1196,10 @@ class BaseConfig(object):
         else:
             self.rootfs_options = '-drive file=%s,if=virtio,format=%s' % (self.rootfs, rootfs_format)
 
+        qb_rootfs_extra_opt = self.get("QB_ROOTFS_EXTRA_OPT")
+        if qb_rootfs_extra_opt and not qb_rootfs_extra_opt.startswith(","):
+            qb_rootfs_extra_opt = "," + qb_rootfs_extra_opt
+
         if self.fstype in ('cpio.gz', 'cpio'):
             self.kernel_cmdline = 'root=/dev/ram0 rw debugshell'
             self.rootfs_options = '-initrd %s' % self.rootfs
@@ -1208,14 +1212,15 @@ class BaseConfig(object):
                     drive_type = self.get('QB_DRIVE_TYPE')
                     if drive_type.startswith("/dev/sd"):
                         logger.info('Using scsi drive')
-                        vm_drive = '-drive if=none,id=hd,file=%s,format=%s -device virtio-scsi-pci,id=scsi -device scsi-hd,drive=hd' \
-                                       % (self.rootfs, rootfs_format)
+                        vm_drive = '-drive if=none,id=hd,file=%s,format=%s -device virtio-scsi-pci,id=scsi -device scsi-hd,drive=hd%s' \
+                                       % (self.rootfs, rootfs_format, qb_rootfs_extra_opt)
                     elif drive_type.startswith("/dev/hd"):
                         logger.info('Using ide drive')
                         vm_drive = "-drive file=%s,format=%s" % (self.rootfs, rootfs_format)
                     elif drive_type.startswith("/dev/vdb"):
                         logger.info('Using block virtio drive');
-                        vm_drive = '-drive id=disk0,file=%s,if=none,format=%s -device virtio-blk-device,drive=disk0' % (self.rootfs, rootfs_format)
+                        vm_drive = '-drive id=disk0,file=%s,if=none,format=%s -device virtio-blk-device,drive=disk0%s' \
+                                    % (self.rootfs, rootfs_format,qb_rootfs_extra_opt)
                     else:
                         # virtio might have been selected explicitly (just use it), or
                         # is used as fallback (then warn about that).
-- 
2.17.1

