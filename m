Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.13166.1611672177207213957
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 06:42:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Z2ARHtnh;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id s24so774240pjp.5
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 06:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=88PNtJtoVogqTXFWXk6k7vo/DdMlrzyC/5kY7CYNExQ=;
        b=Z2ARHtnhtg2iB3yOUzwFmqi5Qvy3ZSfAWOlb5Iw5sbihLmXZaqOuHmovfGmAuxi0AH
         HPPS0iO4QWvvo4nFJ7/gg/uqDwBKGckjFT0yZq5iVsEZZ1LcF89r4hZuHAbDTl9QVerK
         Ahv1McSRXDiTVZ3PvfAbanVE7d9ohKMmqDFMofzfGOjh+Bb3FjNdMwY5KtOTSBz/Bay8
         njabbnG8/Bj0jPctrtMpUcfWZY+Xns4LcWGYrwuGXBdzwApmN5rLrVtWpMxBFugX79ds
         BIyeoClyYKDBL2YRuC8tnDXgtGGHE1qtJal55nKzjChMmnQvPt3z87R5PcarqjheiZ8X
         d2rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=88PNtJtoVogqTXFWXk6k7vo/DdMlrzyC/5kY7CYNExQ=;
        b=Pvjj8wOx8yMq0eJfu8A+B9iduI5sJdZrombH2awXR2CeHgxLJEXabI09/28bMrbuCr
         qJ7evIVvViuS+ABUEE/0OnX6F7aAw6hAsE0/Z6D15ICuYpqqgxFQ81C1sAU3KNMcnIan
         VP67KwIOaqj8smrFql1O7/VJKp8ICA1ZdKOzMyHghSLzwOOgoMUCu3ysCcLXjWcCYrOC
         kU6bJNG04fEcgwzrjzrBhUcnnbwIgiM8ixuNxpayTv6/HVPPWeVGiE50UHlYQa1zBDBi
         rORtejx/IlCq2r18LMYpUAjiilL1v9uA7yRHLkhRrexAR7YAa0yIwyo0yzMS4QXv/PmE
         KA0g==
X-Gm-Message-State: AOAM531gsXmS+52I7QMXJ/qEFGOO7+REDe+iHO8WFnUEOhs9pEBtaPNz
	vWtivre6NuOk4dAixqcSd+AAxD9EyXhlV17sQQQ=
X-Google-Smtp-Source: ABdhPJzUJczcLGKqMWK0W301tYmOZrDIdmOqWx92ipb+G5uEFDKw416/xR1u69+H2o+fUuCHeeWShg==
X-Received: by 2002:a17:90a:4083:: with SMTP id l3mr74946pjg.109.1611672176297;
        Tue, 26 Jan 2021 06:42:56 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 11sm19303634pgz.22.2021.01.26.06.42.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 06:42:55 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell V3 16/46] wic: Handle new PSEUDO_IGNORE_PATHS variable
Date: Tue, 26 Jan 2021 04:41:27 -1000
Message-Id: <e37671f6fbdf103b507f00778bd3cde136a25b94.1611671734.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611671734.git.steve@sakoman.com>
References: <cover.1611671734.git.steve@sakoman.com>
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

