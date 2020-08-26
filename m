Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.16161.1598458832387311861
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2020 09:20:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KwwCEuBQ;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: vijaikumar.kanagarajan@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id t9so1229261pfq.8
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2020 09:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=X33O/qo20BhnLlN6k2MMLPsmPyNZb9REUq0VOnIGTAY=;
        b=KwwCEuBQVM21+y2OqaC2RZMAiLqpwGKrDSPgdkOKj+cXqoXVVkaEXl8eqcoyiBw7z4
         luBaAxRJxlTNMkO0a86XA8PkLbzV2xHzhsgwcEMJEFjvTbPVBpLBuqaubmc8NXA28fqN
         HC2dPXxr4tvZMzbjW5D6eud2LToCVSFtmWjZTkcHNltG+XZy7424GTwwd5kZ6XbjRXA3
         Bz5kt/pU1BlrPV8v0SEka6bmCM4XCmHQnmDGxNmNnieqoR9BZH3RE3uIuXPT+5Doi1Hk
         YMBDOefZXJLBreffQvofUcuENGIM+wEV9WdwbGnErQMo7/9vLQJzhkPKkCHExzt2GDrz
         fU3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=X33O/qo20BhnLlN6k2MMLPsmPyNZb9REUq0VOnIGTAY=;
        b=VZK6Juf8llNWSiStAL4AuRX0fgi5TlxfS9/a1lOZgWbPX16fylwC8r/WlqDrxG2+EX
         R1L6Yo7NTMH60bEXQeWQaVFbXJYtAFNnfmII7lRKgmjxorYtbqVICFZqQ7S46+i3nWIG
         /qnbNKcgz5/Hypcq3ySS56NIPVZvlxsZn2LAZs9P/m1z6Pkf5NQaA2OVQIaQUcKl5YvR
         JfaFJnIhDKRlQy7JgbP1JH/IGHffiRixubeqtV+r0Li0HTSZg98mjlJIsbblntp1ldrM
         k+SH3aBUWA7vFZ8EBEc+o9YqOywAx2YzEhv5aw5iWNqBTJYpwBSdkgoL3vCv+/NGYw0D
         Kjgg==
X-Gm-Message-State: AOAM531iOJK57Aai0JOZOUhKo8AX8nF3vGg7tfW+G8ovWqqFlUfMIMKr
	yKLt2SC3Aea2hPPnRAUP7VqcNWlNdZjHMA==
X-Google-Smtp-Source: ABdhPJzAPu6UsCNJOwOBF8n/d2BjQzqzrXs9rGEl0B4Jxaa76R+dUn7oL2R2nVLaZfHHivfwXbp9Hg==
X-Received: by 2002:a63:1b12:: with SMTP id b18mr11190183pgb.21.1598458831687;
        Wed, 26 Aug 2020 09:20:31 -0700 (PDT)
Return-Path: <vijaikumar.kanagarajan@gmail.com>
Received: from oxygen.mgc.mentorg.com (nat-sch.mentorg.com. [139.181.36.34])
        by smtp.gmail.com with ESMTPSA id o9sm2411897pjs.47.2020.08.26.09.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2020 09:20:31 -0700 (PDT)
From: "Vijai Kumar K" <vijaikumar.kanagarajan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
Subject: [PATCH] image_types_wic: Add ASSUME_PROVIDED to WICVARS
Date: Wed, 26 Aug 2020 21:50:25 +0530
Message-Id: <20200826162025.11638-1-vijaikumar.kanagarajan@gmail.com>
X-Mailer: git-send-email 2.17.1

Add ASSUME_PROVIDED to WICVARS so that wic can use that
when running on bitbake environment.

This fixes the below build failure in do_image_wic
when --include-path is used in wks file.
---
| DEBUG: Executing shell function do_image_wic
| INFO: Creating image(s)...
|
| ERROR: A native program tar required to build the image was not found (see details above).
|
| Please make sure wic-tools have tar-native in its DEPENDS, build it with 'bitbake wic-tools' and try again.
---

Signed-off-by: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
---
 meta/classes/image_types_wic.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index 7b1db50a28..2a1feed60d 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -4,7 +4,8 @@ WICVARS ?= "\
            BBLAYERS IMGDEPLOYDIR DEPLOY_DIR_IMAGE FAKEROOTCMD IMAGE_BASENAME IMAGE_BOOT_FILES \
            IMAGE_LINK_NAME IMAGE_ROOTFS INITRAMFS_FSTYPES INITRD INITRD_LIVE ISODIR RECIPE_SYSROOT_NATIVE \
            ROOTFS_SIZE STAGING_DATADIR STAGING_DIR STAGING_LIBDIR TARGET_SYS \
-           KERNEL_IMAGETYPE MACHINE INITRAMFS_IMAGE INITRAMFS_IMAGE_BUNDLE INITRAMFS_LINK_NAME APPEND"
+           KERNEL_IMAGETYPE MACHINE INITRAMFS_IMAGE INITRAMFS_IMAGE_BUNDLE INITRAMFS_LINK_NAME APPEND \
+           ASSUME_PROVIDED"
 
 inherit ${@bb.utils.contains('INITRAMFS_IMAGE_BUNDLE', '1', 'kernel-artifact-names', '', d)}
 
-- 
2.17.1

