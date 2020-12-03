Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.11679.1607008164269973644
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 07:09:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=bRxS5cyC;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id s2so1289175plr.9
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 07:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=31dFvabm9K/YGguCYKewU8363Zv4t7bqclOhiuA7LoM=;
        b=bRxS5cyCbbIDmO2wSd/mAAsmQsOomXPDMhY5b+95pFtt6pOreSm5dOqBRnG7PUv0RN
         3m5C2+jSRBRJT29kUpZc1AnnOoI66xA/3R2VxNoggsoy6qbxyygi/JyRuCL815Fjncvn
         yCR4VknuIGMksyll1UaY51wdZSuRAXS6+15KdUu7pPke8yLjmhr3DTwy1/pinglTYX1g
         L2dRsyggobXk+yvWIu5pfQ5TKBGlm3qEHYuGV3dWRqtqvvoiEcArCgTCz3EXT3NF03we
         lzxWOOjjHWStHBja9bwm7lWOw1PSmWRCbYKyFCMJExvKz6jDacpM+MCvqCyJ42FEhE7u
         pTDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=31dFvabm9K/YGguCYKewU8363Zv4t7bqclOhiuA7LoM=;
        b=D7rEKKVkuBzGh4lbErItjzXReHFaxcCv8BRN1WviCJohlE+cRTDhSEm9ZsP7n0J6iT
         XD5xRJf5tFTd0WPr40GmbdqZua3Z2PriazOiyM1gx7/hictI2OJ1JcwPKpIaDPpmYyYZ
         gVMOe4JEw+CAUAZ8ym3R4vYNvoZaO0J1JxzHpfpDebVY1dnDcFUCOl4fot6ikB9VyFed
         DVIbWbWiRdMtXTXLPYq6CVQ8BRtRwauK11lCLbqAZSNbX9XmR3pNDJAMhjPc6Z6Ezqd2
         /Zh55O30sn0iziVw0fWs0VOfY+UOxwk62DFM0QAba7XomBpJ8sOWSky+g8NgKOTgRUeF
         liSQ==
X-Gm-Message-State: AOAM533HT946z6PCJchaHfrK0ELJsCndQqAMOVqI/q7SAYkgCDKWx746
	PDD2nWIFTVYjZ0GEIDain/SFW3t3lE3Vs0lV
X-Google-Smtp-Source: ABdhPJyEir8mUa8pc/Mc9s8BiSUblnTD5R/8sS7ph7v3BUm3cCxJns8mmu6JxNSMyfpOfNPck757Cw==
X-Received: by 2002:a17:902:d90d:b029:da:5114:7275 with SMTP id c13-20020a170902d90db02900da51147275mr3527854plz.64.1607008163268;
        Thu, 03 Dec 2020 07:09:23 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s7sm1632320pju.37.2020.12.03.07.09.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 07:09:22 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 17/28] wic: Handle new PSEUDO_IGNORE_PATHS variable
Date: Thu,  3 Dec 2020 05:08:07 -1000
Message-Id: <9c7b1991d248f09517c67e110923885841a9beac.1607007208.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607007208.git.steve@sakoman.com>
References: <cover.1607007208.git.steve@sakoman.com>

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
2.17.1

