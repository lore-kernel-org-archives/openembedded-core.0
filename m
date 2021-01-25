Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web09.341.1611586416761541740
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 06:53:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=C6HJ1kIj;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id lw17so34861pjb.0
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 06:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7UqqZJIN7RCusNGOLhpvLEE5xzyHxkXY7jP7RWhEyXU=;
        b=C6HJ1kIjo7XZvRCuiVR7araGhOvJy3+JlwS/UXAsOGDcJKuBPLUiQCGnYNp+zNx2Wb
         glpdrmhyQMzpTLEGupQCMUQhmwoAxkHl3gdi5BXKkb3db1c67kddWyE+giK0DWkJ+RqG
         PvANFxT0b//ceEAPyQF/I58b/upb7082v1VjkYvqtxXS5dt/G+z2zlqFYfeppp8YXwrb
         GG5qdkW74/781uKq4hsashaeapuRZ+WLqKBcohSDlmm37W9YtiPcr604pFPMdcYYlfmk
         OlPS3cHzphQBM9yRnIVdFeZh7CUqBYxrmz/BRD+f/QnXNJUBrj6cfR9c2km8fHhmCZEI
         M8bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7UqqZJIN7RCusNGOLhpvLEE5xzyHxkXY7jP7RWhEyXU=;
        b=TkNdKIB7oWR6004wtGya/R95FNLz8o6WIGceKY8d0roG77OzsMc/DuaEDJvX/TiE9k
         XPWA9/C+MoP3UvymCpQu/55BVggMtv6GpNovhAOqUQSoPmvWBi77mrXYV88imkGITRdL
         oMNf9yLN2iejWw57SyHGgVE/O9/ZNRRR3B0rscmoDY2zvdjdVEcO9GrWURtDo5Dx414P
         H6QBVtSBO1pC+c3GjFZaGeH3Z5OAEZwUD2mPl7HZCMQpDIVESBVpXXgyx/eXChCShDTr
         1QfpA2baYxv5K7chgy+UfKjOjesvevJSKhEcom2J5X/ouyF8GVPAVQfrQC1gyM3wAzea
         E7Eg==
X-Gm-Message-State: AOAM532Z2fKYPH8G2M11e4ldfVESznU6x/O0GPlM+QXwTuA7dvBz0aA9
	zzypUnJHCykHUdBvRziMh89nkNHC+5CFo4x1dlE=
X-Google-Smtp-Source: ABdhPJzpXdDPSwAX7q8n33AzcSjKgYcHcWxkOejmEuvxxUSQc/GHJ5Sdz2gEFFQM7jsz6yDMf4YpoA==
X-Received: by 2002:a17:90b:3449:: with SMTP id lj9mr605951pjb.84.1611586415924;
        Mon, 25 Jan 2021 06:53:35 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id x8sm17574354pfn.27.2021.01.25.06.53.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 06:53:35 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 41/47] wic: Allow exec_native_cmd to run HOSTTOOLS
Date: Mon, 25 Jan 2021 04:51:13 -1000
Message-Id: <7bdb6a5eb28f391c763b45f650d2b93bec67602c.1611585425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611585425.git.steve@sakoman.com>
References: <cover.1611585425.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Barker <pbarker@konsulko.com>

This allows programs from HOSTTOOLS (e.g. 'install', 'rm', 'mv', etc) to
be more easily executed by wic. Without this change only programs from
an actual *-native recipe built by bitbake can be executed by wic.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8eb186acdecfbb3151c9a0ab148358e3fe5cce39)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/image_types_wic.bbclass | 2 +-
 scripts/lib/wic/misc.py              | 7 +++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index f27f29c663..640603f5fa 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -3,7 +3,7 @@
 WICVARS ?= "\
            BBLAYERS IMGDEPLOYDIR DEPLOY_DIR_IMAGE FAKEROOTCMD IMAGE_BASENAME IMAGE_BOOT_FILES \
            IMAGE_LINK_NAME IMAGE_ROOTFS INITRAMFS_FSTYPES INITRD INITRD_LIVE ISODIR RECIPE_SYSROOT_NATIVE \
-           ROOTFS_SIZE STAGING_DATADIR STAGING_DIR STAGING_LIBDIR TARGET_SYS \
+           ROOTFS_SIZE STAGING_DATADIR STAGING_DIR STAGING_LIBDIR TARGET_SYS HOSTTOOLS_DIR \
            KERNEL_IMAGETYPE MACHINE INITRAMFS_IMAGE INITRAMFS_IMAGE_BUNDLE INITRAMFS_LINK_NAME APPEND \
            ASSUME_PROVIDED PSEUDO_IGNORE_PATHS"
 
diff --git a/scripts/lib/wic/misc.py b/scripts/lib/wic/misc.py
index fe4abe8115..e4b5a0d519 100644
--- a/scripts/lib/wic/misc.py
+++ b/scripts/lib/wic/misc.py
@@ -128,9 +128,12 @@ def exec_native_cmd(cmd_and_args, native_sysroot, pseudo=""):
     if pseudo:
         cmd_and_args = pseudo + cmd_and_args
 
-    native_paths = "%s/sbin:%s/usr/sbin:%s/usr/bin:%s/bin" % \
+    hosttools_dir = get_bitbake_var("HOSTTOOLS_DIR")
+
+    native_paths = "%s/sbin:%s/usr/sbin:%s/usr/bin:%s/bin:%s" % \
                    (native_sysroot, native_sysroot,
-                    native_sysroot, native_sysroot)
+                    native_sysroot, native_sysroot,
+                    hosttools_dir)
 
     native_cmd_and_args = "export PATH=%s:$PATH;%s" % \
                    (native_paths, cmd_and_args)
-- 
2.25.1

