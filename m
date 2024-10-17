Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FBFFD3748B
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 13:32:15 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.48401.1729171931086099588
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Oct 2024 06:32:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=FPYtRaXW;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20cd76c513cso8860595ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 06:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729171930; x=1729776730; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hdtvDCY0W73NC3zRDMLaLvZiO7hT55mpHOEZUTuqsiM=;
        b=FPYtRaXWa1z02K4/Dpdxn5L6mi0iRFrzKhE0V8S6QhtPj2XPDN6YaNljT3118ZyTpG
         ebzxYqIouExDL0kDfEvRbJTA4k63Z2V1r1cd+MuSHybw3O0DVUgc00GDlEobs6MecRxy
         JhEh3Ds2QUqTjp2CBFhaYEYgIYW5Si72SWMMNVU2BVVXHmZ1eNfaUzH3DxmhIKV+zNAW
         FMLXA/WJSFM5stExxRyDxabaqazQ8xkPp4f+tmeFBowSMaVUGVzRDH/iJvTwgI7ikAUx
         7yho4HymbsdrUgxrB83luzERlyESq1HQ3WlBKwtQKrztwp1hbq1oDSMR50sjIOK7HeDf
         /mEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729171930; x=1729776730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hdtvDCY0W73NC3zRDMLaLvZiO7hT55mpHOEZUTuqsiM=;
        b=Ji6N5XhHrHdy+oitp5j3omMvDSbcuzknz3CCQK/MvMt8xWuQm5LzVmlgGrN9RploNl
         YtU7+eZUuGFWE9591L3HjuUIuwKbHL8Ha8OjQ7Ca8W4TRPE9tAes2cfxbehVO37z+d0f
         xM0fy/AM1BHXqMpfeSrli09U9JGlbS5147x2EIQTRkJCMzlW0Xp0HwhLGMIGLVSnyq8m
         Mfs8GtPqza7UOH+PNKWyE4GUIuZW5gQOWw6DqJ4Y2eoYV5YKBHpHcWR4uzBNG0ViNKio
         03HbnqzJsLswA8YATPO48aV64flpE+NiRpPIoXUb61lpeFwqPXIAogq9pElXhID76pjI
         oz9Q==
X-Gm-Message-State: AOJu0Yz6KlIb5SJzGVHWFwHC6GOR4uhgoLp3wK53gCN/1m3Z3oTYdpUp
	rIFnSVf5kj1Rfl+qFQckyFzmEwKj1NikIpJQpvYIjItJS+BrRy3gxIbUCuCIkO+5AHPsM4FXo9O
	n
X-Google-Smtp-Source: AGHT+IFSMnudJ+zOGgk7BAlVQu168JweUVqpCjA4k/6y+chOG8jy91g75xBxDTWokrIwbbRDnl2yNA==
X-Received: by 2002:a17:902:db12:b0:20b:c1e4:2d70 with SMTP id d9443c01a7336-20ca147e89bmr319223595ad.23.1729171930307;
        Thu, 17 Oct 2024 06:32:10 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d1805b093sm44161595ad.254.2024.10.17.06.32.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 06:32:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/5] syslinux: Disable error on implicit-function-declaration
Date: Thu, 17 Oct 2024 06:31:56 -0700
Message-Id: <14fdee535c37aaa44898dc22149004c97b2456ca.1729170868.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729170868.git.steve@sakoman.com>
References: <cover.1729170868.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 13:32:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206024

From: Khem Raj <raj.khem@gmail.com>

syslinux has vendored copy of ext2fs/ext2_fs.h but uses ext2fs/ext2fs.h
from e2fsprogs package, however, ext2fs/ext2fs.h has dependencies on
ext2fs/ext2_fs.h coming from e2fsprogs package as these both headers
come from same package, here syslinux uses ext2fs.h from e2fsprogs but
supplies its own copy of ext2_fs.h which maybe out of sync and that
results in warnings about implicit implicit-function-declarations
e.g.

recipe-sysroot/usr/include/ext2fs/ext2fs.h:727:16: error: implicit declaration of function 'ext2fs_has_feature_gdt_csum' [-Wimplicit-function-declaration]
|   727 |                ext2fs_has_feature_gdt_csum(fs->super);
|       |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~

ext2fs_has_feature_gdt_csum here comes from newer version of
ext2fs/ext2_fs.h but missing from vendored copy, hence the warning.

With gcc-14 this warning is treated as error by default, which breaks
the build, so lets treat it as warning only.

All these functions are never used in syslinux, so functionality-wise we
are fine.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a2b30108055e68b62fdad7319d7d569bc38a07b4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
index 0e4a23c1b4..4b4b6d4b64 100644
--- a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
@@ -48,7 +48,7 @@ TARGET_LDFLAGS = ""
 SECURITY_LDFLAGS = ""
 LDFLAGS_SECTION_REMOVAL = ""
 
-CFLAGS:append = " -DNO_INLINE_FUNCS"
+CFLAGS:append = " -DNO_INLINE_FUNCS -Wno-error=implicit-function-declaration"
 
 EXTRA_OEMAKE = " \
 	BINDIR=${bindir} SBINDIR=${sbindir} LIBDIR=${libdir} \
-- 
2.34.1


