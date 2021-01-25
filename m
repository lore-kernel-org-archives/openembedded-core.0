Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.345.1611586349557691051
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 06:52:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=wvDGt9+X;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id s15so7725662plr.9
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 06:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=88PNtJtoVogqTXFWXk6k7vo/DdMlrzyC/5kY7CYNExQ=;
        b=wvDGt9+X4b+z7qrq7T18zf7huzLBaOL5NOeonNuEQRAHhD7eaI/ge0uX4eDXr2AnHy
         g3Azd0dou1zPO7C+gdgIYd3ayGsBQRh3Um61MfmuP+Gkg8fFxN3koQRVmDCzeTSM0RxX
         nqR8pTiwqwumgXnbSnWQyjFjZDZvCmv2rBEoaUFeuLS9AmYZclIwC7VgLBY4QtmFRBCX
         1v0YtEjcYixululvFcSrc9XkR2t0aiNSFTdrS4KGnJ71ifRRwWqq2Rq445iR3fvK9HOX
         2GwrcRosF4MN3KTzIHAy5qAVVoasf7DbLZJBB+pcDjr4+CGVaxAF/gDN9AMNZwBbQud4
         kqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=88PNtJtoVogqTXFWXk6k7vo/DdMlrzyC/5kY7CYNExQ=;
        b=UAXR+8m3JSCR2hpM6IR6As/LOh3fRSj2WnDxUtE5JniXsoBnqWs63YfLwrJtC2ljSQ
         DS1KA7+w/gz+aGRrQbb35OXDAdUPvyIUDf1xAWj/8cAaeJyHwLbn/bfLgaQWylDMbfGs
         4avJwosIKc0HFrzwj9cwZfCz88FXeI4FzROv1KZuaQtnkPtXGQPEPnt0E0cZd1v9A/n3
         +3rEJZGLOS/HnsC8edP/yQhoOhgqJlqwhnA9wn/0TGiU9PKyLq7Cp7eqGHbib1s/JA20
         ZCciIffi6ITfulyxArz29S1bQdJTI4hqQXZF/JY+NJIyq0Mvp/Z/wXRHCTaOtfCaoqbi
         2zvQ==
X-Gm-Message-State: AOAM530QwVpCKphy2NtKjEgQhywn5LGGb5EScq6cS3qqvpiXuzl5xDaX
	WC8Vk0emTC4tcy3jSvklucSLChArhrmLMZVCEH8=
X-Google-Smtp-Source: ABdhPJzXNCGGlVQrBZg05t9yfG/5FEcNKgtQ8UwOJaA1/gdyw510Pt1+Q3+rV8E/7AEgWLrDMoToqw==
X-Received: by 2002:a17:902:d510:b029:de:72a4:ebf1 with SMTP id b16-20020a170902d510b02900de72a4ebf1mr795417plg.11.1611586348686;
        Mon, 25 Jan 2021 06:52:28 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id x8sm17574354pfn.27.2021.01.25.06.52.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 06:52:28 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 17/47] wic: Handle new PSEUDO_IGNORE_PATHS variable
Date: Mon, 25 Jan 2021 04:50:49 -1000
Message-Id: <5a91101eda920968f23e52b05991504db1bcbda6.1611585425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611585425.git.steve@sakoman.com>
References: <cover.1611585425.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Adjust wic to correctly handle the new PSEUDO_IGNORE_PATH variable and avoid
inode corruption issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 13500f5234361385c365c7c35e83f99435500481)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/image_types_wic.bbclass |  2 +-
 scripts/lib/wic/partition.py         | 12 +++++++-----
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index 82f0985eeb..f27f29c663 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -5,7 +5,7 @@ WICVARS ?= "\
            IMAGE_LINK_NAME IMAGE_ROOTFS INITRAMFS_FSTYPES INITRD INITRD_LIVE ISODIR RECIPE_SYSROOT_NATIVE \
            ROOTFS_SIZE STAGING_DATADIR STAGING_DIR STAGING_LIBDIR TARGET_SYS \
            KERNEL_IMAGETYPE MACHINE INITRAMFS_IMAGE INITRAMFS_IMAGE_BUNDLE INITRAMFS_LINK_NAME APPEND \
-           ASSUME_PROVIDED"
+           ASSUME_PROVIDED PSEUDO_IGNORE_PATHS"
 
 inherit ${@bb.utils.contains('INITRAMFS_IMAGE_BUNDLE', '1', 'kernel-artifact-names', '', d)}
 
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 1347571aa0..4ec0608fe4 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -198,21 +198,23 @@ class Partition():
 
         Currently handles ext2/3/4, btrfs, vfat and squashfs.
         """
+
+        rootfs = "%s/rootfs_%s.%s.%s" % (cr_workdir, self.label,
+                                         self.lineno, self.fstype)
+        if os.path.isfile(rootfs):
+            os.remove(rootfs)
+
         p_prefix = os.environ.get("PSEUDO_PREFIX", "%s/usr" % native_sysroot)
         if (pseudo_dir):
             pseudo = "export PSEUDO_PREFIX=%s;" % p_prefix
             pseudo += "export PSEUDO_LOCALSTATEDIR=%s;" % pseudo_dir
             pseudo += "export PSEUDO_PASSWD=%s;" % rootfs_dir
             pseudo += "export PSEUDO_NOSYMLINKEXP=1;"
+            pseudo += "export PSEUDO_IGNORE_PATHS=%s;" % (rootfs + "," + (get_bitbake_var("PSEUDO_IGNORE_PATHS") or ""))
             pseudo += "%s " % get_bitbake_var("FAKEROOTCMD")
         else:
             pseudo = None
 
-        rootfs = "%s/rootfs_%s.%s.%s" % (cr_workdir, self.label,
-                                         self.lineno, self.fstype)
-        if os.path.isfile(rootfs):
-            os.remove(rootfs)
-
         if not self.size and real_rootfs:
             # The rootfs size is not set in .ks file so try to get it
             # from bitbake variable
-- 
2.25.1

