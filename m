Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.31179.1620651681083256292
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 06:01:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qCjApoeX;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id b17so18628764ede.0
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 06:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dNqdGYRzBgkT5NxQYvURC8Up20okwXrbhLSr3BfrIiM=;
        b=qCjApoeXw5T2j/ChcJnwpZtCZoPUJ/KTQabPluHYwsNRf9s8MWpfXfMmdYY+ETvMuH
         SYniHx0lPr91C/rGKoDJf1OFOMuh9D5xsgcFbHZQPZcUILowKIT5Lk29IDFgRGEF4TWR
         6TmT2ANr3hL1RBKXYOeWxJ8mdrDcB6gu4oGeLgHdBbs+TIk3XcNhlgKBipbPEJywR5FQ
         apc2gLzOCYy0rhoO60Nm7alxdTg3yc8qpEfKkDn/CEv1HXL9FL5zLo3KOpCZ0qdn4sK+
         2W3bnbAjiJXTWTVxKZaLw4Mk+9SReufjOvU7QoEHD4JInvKX4tVUul3qLguo6XdmoiPp
         6V1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dNqdGYRzBgkT5NxQYvURC8Up20okwXrbhLSr3BfrIiM=;
        b=SGmHidC4mF52nn6yWpCvr68KQ7ihV5q9xnnxjREDpV5TbK0YKqldaJI0APEmxbx1h4
         SqMFhMQL7M5u+hYQL+VthtoB2sd/73z+Gl6YapTLHysC22Vf36NxAZAWx/9vjF/CeK0c
         p3vhr59k+HrX3QNmFlcxkZeuAMN47+oCArbDg5Lx/+4WtUWNzlV0HJA4DTfIHpqFqhO5
         JFGaTv7C2Uep3eZS3rgv9XmjwZnCev2+5XAA36PB5tn++nkDBFic4h4tMQvmQDr4AJ5B
         Jxmwzp6EqQPc5yDnvAtOece1RLKGJILqwuIG54/trpjzbW4HE+GCMjyK3eDC9lAILldS
         Q6pA==
X-Gm-Message-State: AOAM531y45xrFPvUIogDnGaqyrtkdEsa5qRxPdhK+3YWCOgCHGdd575O
	xGu+nTlgNVdHijrfsNLFRPlZ7nmceTk=
X-Google-Smtp-Source: ABdhPJwz2P/JoMHBqLInpjtJIvD2XvJFT3Gaf+i+9IDo5IevBhq4M7CUqeHx8jbQ/FSOw49JQc34bA==
X-Received: by 2002:a05:6402:7c7:: with SMTP id u7mr29117667edy.2.1620651679661;
        Mon, 10 May 2021 06:01:19 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id pw11sm9057361ejb.88.2021.05.10.06.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 06:01:19 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 4/8] ffmpeg: update 4.3.2 -> 4.4
Date: Mon, 10 May 2021 15:01:06 +0200
Message-Id: <20210510130110.939820-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210510130110.939820-1-alex.kanavin@gmail.com>
References: <20210510130110.939820-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop mips64_cpu_detection.patch as upstream
has changed the code in a way that's difficult
to rebase. I have confirmed that builds on qemumip64 still
work, and the patch does not say clearly what was the
way to reproduce the failure it's aiming to address.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../ffmpeg/ffmpeg/mips64_cpu_detection.patch  | 32 -------------------
 .../ffmpeg/{ffmpeg_4.3.2.bb => ffmpeg_4.4.bb} |  3 +-
 2 files changed, 1 insertion(+), 34 deletions(-)
 delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/mips64_cpu_detection.patch
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_4.3.2.bb => ffmpeg_4.4.bb} (98%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/mips64_cpu_detection.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/mips64_cpu_detection.patch
deleted file mode 100644
index 69429af8f0..0000000000
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/mips64_cpu_detection.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-It will add -mips64r6 and -mips64r2 to cmdline which will
-cause conflicts
-
-in OE we user mips32r2 and mips64r2 for mips arch versions
-so there is no benefit of detecting it automatically by
-poking at tools especially in cross env
-
-Fixes errors like
-
-linking -mnan=2008 module with previous -mnan=legacy modules
-failed to merge target specific data of file
-
--Khem
-Upstream-Status: Inappropriate [OE-Specific]
-
-Index: ffmpeg-3.1.1/configure
-===================================================================
---- ffmpeg-3.1.1.orig/configure
-+++ ffmpeg-3.1.1/configure
-@@ -5220,12 +5220,9 @@ elif enabled mips; then
- 
-     # Enable minimum ISA based on selected options
-     if enabled mips64; then
--        enabled mips64r6 && check_inline_asm_flags mips64r6 '"dlsa $0, $0, $0, 1"' '-mips64r6'
-         enabled mips64r2 && check_inline_asm_flags mips64r2 '"dext $0, $0, 0, 1"' '-mips64r2'
-         disabled mips64r6 && disabled mips64r2 && check_inline_asm_flags mips64r1 '"daddi $0, $0, 0"' '-mips64'
-     else
--        enabled mips32r6 && check_inline_asm_flags mips32r6 '"aui $0, $0, 0"' '-mips32r6'
--        enabled mips32r5 && check_inline_asm_flags mips32r5 '"eretnc"' '-mips32r5'
-         enabled mips32r2 && check_inline_asm_flags mips32r2 '"ext $0, $0, 0, 1"' '-mips32r2'
-         disabled mips32r6 && disabled mips32r5 && disabled mips32r2 && check_inline_asm_flags mips32r1 '"addi $0, $0, 0"' '-mips32'
-     fi
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
similarity index 98%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
index 08be38ca50..19a8e58370 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
@@ -24,10 +24,9 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
-           file://mips64_cpu_detection.patch \
            file://0001-libavutil-include-assembly-with-full-path-from-sourc.patch \
            "
-SRC_URI[sha256sum] = "46e4e64f1dd0233cbc0934b9f1c0da676008cad34725113fb7f802cfa84ccddb"
+SRC_URI[sha256sum] = "06b10a183ce5371f915c6bb15b7b1fffbe046e8275099c96affc29e17645d909"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET_armv4 = "arm"
-- 
2.31.1

