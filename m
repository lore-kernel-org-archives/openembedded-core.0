Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web08.12981.1611672240922413360
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 06:44:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ozuuy2qy;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id o16so1942345pgg.5
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 06:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7UqqZJIN7RCusNGOLhpvLEE5xzyHxkXY7jP7RWhEyXU=;
        b=ozuuy2qy/ZH65L8GFp7ztm3GEYVk33XNnG+tlHlp7uLcFi5/kTo+B60Eq3NXhnOjC8
         nQFIx5rUglU6AO2J8bGVuizXdkZSaa6jrb2U2v0bPK1kwCg7wr9qYYho2Bm5wSHP2gfa
         YYfVD4+rF+vtCX+Dm0YElqIJv7/gsVfBp7+UlsxLr87RGVNM68likXsVhsRggQp5+k7h
         xhICTBIE7lpEyiMesSm4uHDZMRzniI0l8WjgqLM22CkTcfU7n6TabHTltkeYfXXfaoQJ
         KwODf9timVZKWPPy7osnYP4x76fSkR9qhsi6hT45Mkx3zJ18bgDvKnEfx2MktaUe1eD8
         fKIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7UqqZJIN7RCusNGOLhpvLEE5xzyHxkXY7jP7RWhEyXU=;
        b=JtlRQ0jEbS5hv7wSFQKvhOcY61gLr8+xCqZaUjWPQTshbodv8cMwJMkM1/0L55tvae
         o4Uedgw6AoRpX+9izDI3tB1Tk9iCb1cBbAjShMmSiobOIHDpJyP1zDmcurFNRa+1FHcF
         C8EdClu8UwM9FmrKAq9WuvI0NfULPLxED572Bnaqj0N1jVow5O+9RS+cwixp9AT7A7Jb
         xV3aZ8U18rJsGxoZK34JPa6LCrm1W4j7qGds3foWLWqZ4tyDU/Ply1lXuQOW2GbHTX5D
         zrGctGfDBRv6X492jRDBW289LQsWsAlquXL5dr0pdx6NluCwC6EqmHhMhDOQDRhMi9El
         W5OA==
X-Gm-Message-State: AOAM532EpwOsd+n6ERGHaYXbvqSZ5Aciqf2AkUPFeYl2KVcufk79MUkl
	xsohW47+KN6wA/0CK7pyXEck/tRywikATpdyzlM=
X-Google-Smtp-Source: ABdhPJyIp6z70a5E/PqFIIy/tAEtLFS0Kg03R5YoRcKpnFx5LyQfXLgsgyD7d0iglFxTZOcs1c8wqg==
X-Received: by 2002:a05:6a00:1:b029:1c1:2d5f:dc16 with SMTP id h1-20020a056a000001b02901c12d5fdc16mr5517599pfk.55.1611672240020;
        Tue, 26 Jan 2021 06:44:00 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 11sm19303634pgz.22.2021.01.26.06.43.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 06:43:59 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell V3 40/46] wic: Allow exec_native_cmd to run HOSTTOOLS
Date: Tue, 26 Jan 2021 04:41:51 -1000
Message-Id: <5fafa0e6275b96dad3179c875746be26f45b558a.1611671734.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611671734.git.steve@sakoman.com>
References: <cover.1611671734.git.steve@sakoman.com>
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

