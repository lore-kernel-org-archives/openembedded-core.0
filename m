Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71535E77172
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 06:49:41 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.8173.1733294979109712984
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 22:49:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ANKxQVE2;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-434a736518eso78224795e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 22:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733294977; x=1733899777; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OKyXXEd2A/iivIA5iUVMDY1zO4Z4tCmJfuwhwW8jUVA=;
        b=ANKxQVE2m15Wa8GZeVyeXIcpwbelvHBGHYnZHw4LY+8anS2XRKhWlCCFVTbc9DFH8X
         OooxUbK6wVutRiqXgHj/S5t4ni4xpfmLrk9C0l/WPlbYI1IRtP8VxQtNxVKvY+hWjaif
         VUL1a1J3on4R3ZOGU6Fage0wEej/E4jfPgx6cTVSYbIdsJ1mthgkAR5fjNEYOJZ03i8i
         mfLw4llYVDAahAZ3gc2jMafvIZgPzMAQQGspSu7Q5yaRp6RL2kG2w1+HoyvVpZmyo9/P
         NgzdZxonTBOjAjp0c1bPu0NOfWyLlmsWeQcSaYLhd18vTZ+g21cSp5qZ9ahtM490tKvL
         iTYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733294977; x=1733899777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OKyXXEd2A/iivIA5iUVMDY1zO4Z4tCmJfuwhwW8jUVA=;
        b=qtmJ5y+mkcF/CwpgEA7US0oaguo41Cy9k/wWolDl2gUQdRnp9ORxM/wI/aOYdB2V6a
         d9vcoQC4UqF9MA0egPld6vAbQEX+8yQaKaVxHypcpFrtarDe7jMlfHlM6WDDNPz/bNO9
         VZ31iabUm4FsZxoLCqLi+AtXy5OeDdjURKly73x7WvYTtVEQDq68aFU5irjTYAW3LCL3
         tFeGgaiwFOU0nUz2C9nvQbPnl16kdmlMLea3nRKB2Ptqfcn8lV6vrh4RDdZEQthQWkT/
         mfrKQKrmX7bGoSVxfq+IK5H0VNEUEsbKG2CZy8yJ7s2avkvSEdrYExh1ByGoIBBUj9LE
         mm+w==
X-Gm-Message-State: AOJu0YzEIyQE+FO3MNRSYUsRFnhN6R6rJ7QcHckjNRNQhV8tMOsbDWZS
	9rxhgyNrOfD7JpkPspiitv4xD/iuiG0MMA+AvRPt7+hAQ25f7/Ez+yiMlw==
X-Gm-Gg: ASbGncs1mehzGnW/ta5BN2QBfr9lzaoUE+58Yc8wcwHOWoBi5ezhGX5zaGEKxima1J2
	vmxP7IyJbRDcgNlX4zQGboAuWhCQtbo81s8L0Tvkfp0f2k+xi6mfOmoHRa1/3Pj2sKfVDK0m86N
	wcOKz3gfukQm1PuCni+kIa0laYdAxYAdJeCxDVgOguztX/iEEFYKg8QHD1URn/b8HqRVeuZ3NJM
	nB6+c969K0jFYCwWA5v8xX+tXqtgHayCLEdXdYjIYhBMLgwFBSUteniC87f5yYuN8sBPpAUVy/X
	ykqpU0YAcZM=
X-Google-Smtp-Source: AGHT+IG/gkQq6bC35TglsdICZKdj4spD6a43GZVh9PIBH02EsR9SrahUwIG6mqce5TB/jQlOpxA1xw==
X-Received: by 2002:a05:6000:1acd:b0:385:fb40:e549 with SMTP id ffacd0b85a97d-385fd43c259mr4276289f8f.55.1733294977342;
        Tue, 03 Dec 2024 22:49:37 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385f343f293sm7435757f8f.36.2024.12.03.22.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 22:49:36 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/37] debugedit: upgrade 5.0 -> 5.1
Date: Wed,  4 Dec 2024 07:48:52 +0100
Message-Id: <20241204064920.817016-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204064920.817016-1-alex.kanavin@gmail.com>
References: <20241204064920.817016-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 06:49:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208238

From: Alexander Kanavin <alex@linutronix.de>

Remove 0002-sepdebugcrcfix.c-do-not-use-64bit-variants.patch
as the issues were fixed upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{debugedit_5.0.bb => debugedit_5.1.bb}    |  8 +--
 ...ugcrcfix.c-do-not-use-64bit-variants.patch | 56 -------------------
 ...003-Makefile.am-do-not-update-manual.patch | 13 ++---
 3 files changed, 9 insertions(+), 68 deletions(-)
 rename meta/recipes-devtools/debugedit/{debugedit_5.0.bb => debugedit_5.1.bb} (82%)
 delete mode 100644 meta/recipes-devtools/debugedit/files/0002-sepdebugcrcfix.c-do-not-use-64bit-variants.patch

diff --git a/meta/recipes-devtools/debugedit/debugedit_5.0.bb b/meta/recipes-devtools/debugedit/debugedit_5.1.bb
similarity index 82%
rename from meta/recipes-devtools/debugedit/debugedit_5.0.bb
rename to meta/recipes-devtools/debugedit/debugedit_5.1.bb
index 63ad7babd9a..5dc103f6438 100644
--- a/meta/recipes-devtools/debugedit/debugedit_5.0.bb
+++ b/meta/recipes-devtools/debugedit/debugedit_5.1.bb
@@ -9,16 +9,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://COPYING3;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "https://sourceware.org/ftp/debugedit/${PV}/debugedit-${PV}.tar.xz"
+SRC_URI = "https://sourceware.org/ftp/debugedit/${PV}/debugedit-${PV}.tar.xz \
+           "
 
 SRC_URI:append:libc-musl = "\
-           file://0002-sepdebugcrcfix.c-do-not-use-64bit-variants.patch \
            file://0003-Makefile.am-do-not-update-manual.patch \
            "
 
-SRC_URI[sha256sum] = "e9ecd7d350bebae1f178ce6776ca19a648b6fe8fa22f5b3044b38d7899aa553e"
+SRC_URI[sha256sum] = "ee9b688b2ed8fa62551c54cb5dc31aaa05853e7dedbd9e1237c77894ea5e3626"
 
-DEPENDS = "elfutils"
+DEPENDS = "elfutils xxhash"
 DEPENDS:append:libc-musl = " musl-legacy-error"
 
 inherit pkgconfig autotools
diff --git a/meta/recipes-devtools/debugedit/files/0002-sepdebugcrcfix.c-do-not-use-64bit-variants.patch b/meta/recipes-devtools/debugedit/files/0002-sepdebugcrcfix.c-do-not-use-64bit-variants.patch
deleted file mode 100644
index 4463bd2324a..00000000000
--- a/meta/recipes-devtools/debugedit/files/0002-sepdebugcrcfix.c-do-not-use-64bit-variants.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 3e05bbc1f7909ab6f529e66f0d0f70fb1e60583a Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Thu, 23 Mar 2023 11:55:53 +0800
-Subject: [PATCH 2/2] sepdebugcrcfix.c: do not use 64bit variants
-
-configure.ac checks for largefile support via AC_SYS_LARGEFILE
-already, therefore use off_t, open and lseek instead of 64bit
-variants. Musl e.g. does not define them without _LARGEFILE64_SOURCE
-and error is not seen on glibc because _GNU_SOURCE defines
-_LARGEFILE64_SOURCE.
-
-This patch is marked as inappropriate as debugedit obviously only
-wants to support glibc or some glibc compatible libcs. We can see
-this from the error() usage. And this patch is only for musl.
-
-Upstream-Status: Inappropriate [OE Specific]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- tools/sepdebugcrcfix.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/tools/sepdebugcrcfix.c b/tools/sepdebugcrcfix.c
-index c4a9d56..882e5f5 100644
---- a/tools/sepdebugcrcfix.c
-+++ b/tools/sepdebugcrcfix.c
-@@ -144,7 +144,7 @@ crc32 (const char *fname, const char *base_fname, uint32_t *crcp)
-       error (0, errno, _("cannot open \"%s\""), debugname);
-       return false;
-     }
--  off64_t size = lseek64 (fd, 0, SEEK_END);
-+  off_t size = lseek (fd, 0, SEEK_END);
-   if (size == -1)
-     {
-       error (0, errno, _("cannot get size of \"%s\""), debugname);
-@@ -289,7 +289,7 @@ process (Elf *elf, int fd, const char *fname)
- 	  return true;
- 	}
-       updated_count++;
--      off64_t seekto = (shdr->sh_offset + data->d_off
-+      off_t seekto = (shdr->sh_offset + data->d_off
- 			+ (crcp - (const uint8_t *) data->d_buf));
-       uint32_t crc_targetendian = (ehdr->e_ident[EI_DATA] == ELFDATA2LSB
- 				   ? htole32 (crc) : htobe32 (crc));
-@@ -361,7 +361,7 @@ main (int argc, char **argv)
- 	error (0, errno, _("cannot chmod \"%s\" to make sure we can read and write"), fname);
- 
-       bool failed = false;
--      int fd = open64 (fname, O_RDWR);
-+      int fd = open (fname, O_RDWR);
-       if (fd == -1)
- 	{
- 	  error (0, errno, _("cannot open \"%s\""), fname);
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/debugedit/files/0003-Makefile.am-do-not-update-manual.patch b/meta/recipes-devtools/debugedit/files/0003-Makefile.am-do-not-update-manual.patch
index de467f5365c..d0414f739a7 100644
--- a/meta/recipes-devtools/debugedit/files/0003-Makefile.am-do-not-update-manual.patch
+++ b/meta/recipes-devtools/debugedit/files/0003-Makefile.am-do-not-update-manual.patch
@@ -1,7 +1,7 @@
-From 4f0d7d2f4900ce8555e09854dc681278b7a3d9a9 Mon Sep 17 00:00:00 2001
+From b2715c3f4d28fab1c238086d9b5435e269b06301 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 23 Mar 2023 13:09:23 +0800
-Subject: [PATCH 3/3] Makefile.am: do not update manual
+Subject: [PATCH] Makefile.am: do not update manual
 
 The tarball ships these manuals, no need to re-generate them.
 We have local patches for debugedit.c and sepdebugcrcfix.c,
@@ -20,7 +20,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 30 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 98b2f20..f91deea 100644
+index c590edf..692e016 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -52,36 +52,6 @@ sepdebugcrcfix_LDADD = @LIBELF_LIBS@
@@ -58,8 +58,5 @@ index 98b2f20..f91deea 100644
 -	esac
 -
  noinst_HEADERS= tools/ansidecl.h \
- 		tools/hashtab.h \
- 		tools/md5.h \
--- 
-2.17.1
-
+ 		tools/hashtab.h
+ 
-- 
2.39.5


