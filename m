Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B44EC28B2E
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:53:17 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.4474.1741809187852736965
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:53:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=UbpNYgHS;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2fec13a4067so458194a91.2
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741809187; x=1742413987; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q4+8uyFzMSDo4KPXNYI4oc3DW5Ki2wh4lkMroNAvJPk=;
        b=UbpNYgHScgIuY8TlrF3/GvYUZ69qWP5ab1KJgLjJVi0BqCtlu01KNHgYD2DSf7dkpL
         QSMEGwypA2fNCzKqONJyMekCWbl9rmLThGPfSVO2Ord8asdzKdx8Zh+aWhxwRKUSyEEt
         SfsR7b9TTtpg9wOlRmCT+jnqOHAKH8FdfflgPsxyh020tIUlDy63eRgLlv0rHw58oJ4D
         O1sLtiLiUWaMnyr8HmiSkdKQtYvQXVVQFIfhZLDH2NW8ne9cTfOWAcM3FMy+qi5bfXCV
         AwAnm2LTUtZuQLaR6SLQUyA2EnmaGLqu2VgeNsK7UG5iKWMZyRSH5lYVu3O4/0yZIojP
         EzaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809187; x=1742413987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q4+8uyFzMSDo4KPXNYI4oc3DW5Ki2wh4lkMroNAvJPk=;
        b=HJa7uxobtpvPrFP90GstrLgCLVUswGzWoEJQ9UJ64O7WyJ6kOt1byXUvl7o7r4DZqt
         rzXAlANsx+gj/gj//24Y+fySF7ZEkYNf1lyfTEDlWM/oL2JCh7L419/HGXe+hIxr3AeP
         FK3sF4bn7ofi47w9VTUcjj0Q1ScvQVUwXglgIgcDd/6uStu+cT81rvxzYZ9JoWuVQXwD
         nNj00SW5TYf8ZhETFIArLHexFHF/QYvgxGNkwiBseExe4njn1obtqixNbeYa80/vbhs/
         FF7V9fGE0LBsY6yFIJFqDKAgz43LljrjP7zdSW7C5ucWLhA6a5gBLE9Zi+hM1wmqLb5G
         6DNA==
X-Gm-Message-State: AOJu0Yxey9SafwaJzqURAI8VQPiqVeG5j2JWm8MPSKEXPvLx4igi52bY
	z8iJXUeG50LtQp35b4RId0WOP9b5ODCEcawhREmE53YpFTjQq39E9sdY4T+QGfFiZDhnNRTO5Y4
	Y
X-Gm-Gg: ASbGncv8LUX4nVVe41xeMAR5HlQJ5T6J8NhL1SLwwG6LSzIJPC9RgJecTOGa54ayQLC
	bZLY7ODDl6k6BJASpCnPHHBpWX0BZHWqOSKqGiL8cx4eOJqWzWPPzHOHRa1CyQj77F5Wn88FJeW
	PVo7cFdjyFufdT9MeU3HFue+thezXp9USVxblGG7IGUegcIlXC10iy6mYFuIH2lA1KA8i7Te8o7
	IEUjTSm0uyy3elKz4+dujK4rOjzN+HezQyoTK5QyCBdhW//Q4uRqMEqvgsL9TnY6Z8fOrYjdaHF
	UVGBkfYW6BneL2PGJmTL3NIAzPh8hxnIRec=
X-Google-Smtp-Source: AGHT+IHQBo/DmT3vjnnfap3HdWc+oLpKoX/tvObNIpJNl4ICJYa+H5Knp0YWp+sI+Y0FIO8QHURUkQ==
X-Received: by 2002:a05:6a21:6190:b0:1f5:8678:1820 with SMTP id adf61e73a8af0-1f58cb23744mr11983163637.12.1741809186955;
        Wed, 12 Mar 2025 12:53:06 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5779:a397:ba1c:2b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56093c2f5sm1389955a12.67.2025.03.12.12.53.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:53:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 18/25] grub: patch CVE-2025-0677, CVE-2025-0684, CVE-2025-0685, CVE-2025-0686 and CVE-2025-0689
Date: Wed, 12 Mar 2025 12:52:26 -0700
Message-ID: <0a2cb15d6953a809135bea69609673d068f46df1.1741808973.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741808973.git.steve@sakoman.com>
References: <cover.1741808973.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:53:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212685

From: Peter Marko <peter.marko@siemens.com>

Cherry-pick patch mentioning these CVEs.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...025-0685_CVE-2025-0686_CVE-2025-0689.patch | 377 ++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |   1 +
 2 files changed, 378 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-0677_CVE-2025-0684_CVE-2025-0685_CVE-2025-0686_CVE-2025-0689.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2025-0677_CVE-2025-0684_CVE-2025-0685_CVE-2025-0686_CVE-2025-0689.patch b/meta/recipes-bsp/grub/files/CVE-2025-0677_CVE-2025-0684_CVE-2025-0685_CVE-2025-0686_CVE-2025-0689.patch
new file mode 100644
index 0000000000..d5563cecc4
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2025-0677_CVE-2025-0684_CVE-2025-0685_CVE-2025-0686_CVE-2025-0689.patch
@@ -0,0 +1,377 @@
+From 47b2dfc7953f70f98ddf35dfdd6e7f4f20283b10 Mon Sep 17 00:00:00 2001
+From: Daniel Axtens <dja@axtens.net>
+Date: Sat, 23 Mar 2024 16:20:45 +1100
+Subject: [PATCH] fs: Disable many filesystems under lockdown
+
+The idea is to permit the following: btrfs, cpio, exfat, ext, f2fs, fat,
+hfsplus, iso9660, squash4, tar, xfs and zfs.
+
+The JFS, ReiserFS, romfs, UDF and UFS security vulnerabilities were
+reported by Jonathan Bar Or <jonathanbaror@gmail.com>.
+
+Fixes: CVE-2025-0677
+Fixes: CVE-2025-0684
+Fixes: CVE-2025-0685
+Fixes: CVE-2025-0686
+Fixes: CVE-2025-0689
+
+Suggested-by: Daniel Axtens <dja@axtens.net>
+Signed-off-by: Daniel Axtens <dja@axtens.net>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+CVE: CVE-2025-0677
+CVE: CVE-2025-0684
+CVE: CVE-2025-0685
+CVE: CVE-2025-0686
+CVE: CVE-2025-0689
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=47b2dfc7953f70f98ddf35dfdd6e7f4f20283b10]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ grub-core/fs/affs.c     | 9 +++++++--
+ grub-core/fs/cbfs.c     | 9 +++++++--
+ grub-core/fs/jfs.c      | 9 +++++++--
+ grub-core/fs/minix.c    | 9 +++++++--
+ grub-core/fs/nilfs2.c   | 9 +++++++--
+ grub-core/fs/ntfs.c     | 9 +++++++--
+ grub-core/fs/reiserfs.c | 9 +++++++--
+ grub-core/fs/romfs.c    | 9 +++++++--
+ grub-core/fs/sfs.c      | 9 +++++++--
+ grub-core/fs/udf.c      | 9 +++++++--
+ grub-core/fs/ufs.c      | 9 +++++++--
+ 11 files changed, 77 insertions(+), 22 deletions(-)
+
+diff --git a/grub-core/fs/affs.c b/grub-core/fs/affs.c
+index ed606b3f1..352f5d232 100644
+--- a/grub-core/fs/affs.c
++++ b/grub-core/fs/affs.c
+@@ -26,6 +26,7 @@
+ #include <grub/types.h>
+ #include <grub/fshelp.h>
+ #include <grub/charset.h>
++#include <grub/lockdown.h>
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+@@ -703,11 +704,15 @@ static struct grub_fs grub_affs_fs =
+ 
+ GRUB_MOD_INIT(affs)
+ {
+-  grub_fs_register (&grub_affs_fs);
++  if (!grub_is_lockdown ())
++    {
++      grub_fs_register (&grub_affs_fs);
++    }
+   my_mod = mod;
+ }
+ 
+ GRUB_MOD_FINI(affs)
+ {
+-  grub_fs_unregister (&grub_affs_fs);
++  if (!grub_is_lockdown ())
++    grub_fs_unregister (&grub_affs_fs);
+ }
+diff --git a/grub-core/fs/cbfs.c b/grub-core/fs/cbfs.c
+index 8ab7106af..f6349df34 100644
+--- a/grub-core/fs/cbfs.c
++++ b/grub-core/fs/cbfs.c
+@@ -26,6 +26,7 @@
+ #include <grub/dl.h>
+ #include <grub/i18n.h>
+ #include <grub/cbfs_core.h>
++#include <grub/lockdown.h>
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+@@ -390,12 +391,16 @@ GRUB_MOD_INIT (cbfs)
+ #if (defined (__i386__) || defined (__x86_64__)) && !defined (GRUB_UTIL) && !defined (GRUB_MACHINE_EMU) && !defined (GRUB_MACHINE_XEN)
+   init_cbfsdisk ();
+ #endif
+-  grub_fs_register (&grub_cbfs_fs);
++  if (!grub_is_lockdown ())
++    {
++      grub_fs_register (&grub_cbfs_fs);
++    }
+ }
+ 
+ GRUB_MOD_FINI (cbfs)
+ {
+-  grub_fs_unregister (&grub_cbfs_fs);
++  if (!grub_is_lockdown ())
++    grub_fs_unregister (&grub_cbfs_fs);
+ #if (defined (__i386__) || defined (__x86_64__)) && !defined (GRUB_UTIL) && !defined (GRUB_MACHINE_EMU) && !defined (GRUB_MACHINE_XEN)
+   fini_cbfsdisk ();
+ #endif
+diff --git a/grub-core/fs/jfs.c b/grub-core/fs/jfs.c
+index 6f7c43904..c0bbab8a9 100644
+--- a/grub-core/fs/jfs.c
++++ b/grub-core/fs/jfs.c
+@@ -26,6 +26,7 @@
+ #include <grub/types.h>
+ #include <grub/charset.h>
+ #include <grub/i18n.h>
++#include <grub/lockdown.h>
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+@@ -963,11 +964,15 @@ static struct grub_fs grub_jfs_fs =
+ 
+ GRUB_MOD_INIT(jfs)
+ {
+-  grub_fs_register (&grub_jfs_fs);
++  if (!grub_is_lockdown ())
++    {
++      grub_fs_register (&grub_jfs_fs);
++    }
+   my_mod = mod;
+ }
+ 
+ GRUB_MOD_FINI(jfs)
+ {
+-  grub_fs_unregister (&grub_jfs_fs);
++  if (!grub_is_lockdown ())
++    grub_fs_unregister (&grub_jfs_fs);
+ }
+diff --git a/grub-core/fs/minix.c b/grub-core/fs/minix.c
+index 5354951d1..c267298b5 100644
+--- a/grub-core/fs/minix.c
++++ b/grub-core/fs/minix.c
+@@ -25,6 +25,7 @@
+ #include <grub/dl.h>
+ #include <grub/types.h>
+ #include <grub/i18n.h>
++#include <grub/lockdown.h>
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+@@ -734,7 +735,10 @@ GRUB_MOD_INIT(minix)
+ #endif
+ #endif
+ {
+-  grub_fs_register (&grub_minix_fs);
++  if (!grub_is_lockdown ())
++    {
++      grub_fs_register (&grub_minix_fs);
++    }
+   my_mod = mod;
+ }
+ 
+@@ -756,5 +760,6 @@ GRUB_MOD_FINI(minix)
+ #endif
+ #endif
+ {
+-  grub_fs_unregister (&grub_minix_fs);
++  if (!grub_is_lockdown ())
++    grub_fs_unregister (&grub_minix_fs);
+ }
+diff --git a/grub-core/fs/nilfs2.c b/grub-core/fs/nilfs2.c
+index fc7374ead..08abf173f 100644
+--- a/grub-core/fs/nilfs2.c
++++ b/grub-core/fs/nilfs2.c
+@@ -34,6 +34,7 @@
+ #include <grub/dl.h>
+ #include <grub/types.h>
+ #include <grub/fshelp.h>
++#include <grub/lockdown.h>
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+@@ -1231,11 +1232,15 @@ GRUB_MOD_INIT (nilfs2)
+ 				  grub_nilfs2_dat_entry));
+   COMPILE_TIME_ASSERT (1 << LOG_INODE_SIZE
+ 		       == sizeof (struct grub_nilfs2_inode));
+-  grub_fs_register (&grub_nilfs2_fs);
++  if (!grub_is_lockdown ())
++    {
++      grub_fs_register (&grub_nilfs2_fs);
++    }
+   my_mod = mod;
+ }
+ 
+ GRUB_MOD_FINI (nilfs2)
+ {
+-  grub_fs_unregister (&grub_nilfs2_fs);
++  if (!grub_is_lockdown ())
++    grub_fs_unregister (&grub_nilfs2_fs);
+ }
+diff --git a/grub-core/fs/ntfs.c b/grub-core/fs/ntfs.c
+index de435aa14..8cc2ba3d5 100644
+--- a/grub-core/fs/ntfs.c
++++ b/grub-core/fs/ntfs.c
+@@ -27,6 +27,7 @@
+ #include <grub/fshelp.h>
+ #include <grub/ntfs.h>
+ #include <grub/charset.h>
++#include <grub/lockdown.h>
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+@@ -1320,11 +1321,15 @@ static struct grub_fs grub_ntfs_fs =
+ 
+ GRUB_MOD_INIT (ntfs)
+ {
+-  grub_fs_register (&grub_ntfs_fs);
++  if (!grub_is_lockdown ())
++    {
++      grub_fs_register (&grub_ntfs_fs);
++    }
+   my_mod = mod;
+ }
+ 
+ GRUB_MOD_FINI (ntfs)
+ {
+-  grub_fs_unregister (&grub_ntfs_fs);
++  if (!grub_is_lockdown ())
++    grub_fs_unregister (&grub_ntfs_fs);
+ }
+diff --git a/grub-core/fs/reiserfs.c b/grub-core/fs/reiserfs.c
+index 36b26ac98..cdef2eba0 100644
+--- a/grub-core/fs/reiserfs.c
++++ b/grub-core/fs/reiserfs.c
+@@ -39,6 +39,7 @@
+ #include <grub/types.h>
+ #include <grub/fshelp.h>
+ #include <grub/i18n.h>
++#include <grub/lockdown.h>
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+@@ -1417,11 +1418,15 @@ static struct grub_fs grub_reiserfs_fs =
+ 
+ GRUB_MOD_INIT(reiserfs)
+ {
+-  grub_fs_register (&grub_reiserfs_fs);
++  if (!grub_is_lockdown ())
++    {
++      grub_fs_register (&grub_reiserfs_fs);
++    }
+   my_mod = mod;
+ }
+ 
+ GRUB_MOD_FINI(reiserfs)
+ {
+-  grub_fs_unregister (&grub_reiserfs_fs);
++  if (!grub_is_lockdown ())
++    grub_fs_unregister (&grub_reiserfs_fs);
+ }
+diff --git a/grub-core/fs/romfs.c b/grub-core/fs/romfs.c
+index 1f7dcfca1..acf8dd21e 100644
+--- a/grub-core/fs/romfs.c
++++ b/grub-core/fs/romfs.c
+@@ -23,6 +23,7 @@
+ #include <grub/disk.h>
+ #include <grub/fs.h>
+ #include <grub/fshelp.h>
++#include <grub/lockdown.h>
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+@@ -475,10 +476,14 @@ static struct grub_fs grub_romfs_fs =
+ 
+ GRUB_MOD_INIT(romfs)
+ {
+-  grub_fs_register (&grub_romfs_fs);
++  if (!grub_is_lockdown ())
++    {
++      grub_fs_register (&grub_romfs_fs);
++    }
+ }
+ 
+ GRUB_MOD_FINI(romfs)
+ {
+-  grub_fs_unregister (&grub_romfs_fs);
++  if (!grub_is_lockdown ())
++    grub_fs_unregister (&grub_romfs_fs);
+ }
+diff --git a/grub-core/fs/sfs.c b/grub-core/fs/sfs.c
+index 983e88008..f64bdd2df 100644
+--- a/grub-core/fs/sfs.c
++++ b/grub-core/fs/sfs.c
+@@ -26,6 +26,7 @@
+ #include <grub/types.h>
+ #include <grub/fshelp.h>
+ #include <grub/charset.h>
++#include <grub/lockdown.h>
+ #include <grub/safemath.h>
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+@@ -779,11 +780,15 @@ static struct grub_fs grub_sfs_fs =
+ 
+ GRUB_MOD_INIT(sfs)
+ {
+-  grub_fs_register (&grub_sfs_fs);
++  if (!grub_is_lockdown ())
++    {
++      grub_fs_register (&grub_sfs_fs);
++    }
+   my_mod = mod;
+ }
+ 
+ GRUB_MOD_FINI(sfs)
+ {
+-  grub_fs_unregister (&grub_sfs_fs);
++  if (!grub_is_lockdown ())
++    grub_fs_unregister (&grub_sfs_fs);
+ }
+diff --git a/grub-core/fs/udf.c b/grub-core/fs/udf.c
+index b836e6107..a60643be1 100644
+--- a/grub-core/fs/udf.c
++++ b/grub-core/fs/udf.c
+@@ -27,6 +27,7 @@
+ #include <grub/fshelp.h>
+ #include <grub/charset.h>
+ #include <grub/datetime.h>
++#include <grub/lockdown.h>
+ #include <grub/udf.h>
+ #include <grub/safemath.h>
+ 
+@@ -1455,11 +1456,15 @@ static struct grub_fs grub_udf_fs = {
+ 
+ GRUB_MOD_INIT (udf)
+ {
+-  grub_fs_register (&grub_udf_fs);
++  if (!grub_is_lockdown ())
++    {
++      grub_fs_register (&grub_udf_fs);
++    }
+   my_mod = mod;
+ }
+ 
+ GRUB_MOD_FINI (udf)
+ {
+-  grub_fs_unregister (&grub_udf_fs);
++  if (!grub_is_lockdown ())
++    grub_fs_unregister (&grub_udf_fs);
+ }
+diff --git a/grub-core/fs/ufs.c b/grub-core/fs/ufs.c
+index 01235101b..6b496e7b8 100644
+--- a/grub-core/fs/ufs.c
++++ b/grub-core/fs/ufs.c
+@@ -25,6 +25,7 @@
+ #include <grub/dl.h>
+ #include <grub/types.h>
+ #include <grub/i18n.h>
++#include <grub/lockdown.h>
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+@@ -899,7 +900,10 @@ GRUB_MOD_INIT(ufs1)
+ #endif
+ #endif
+ {
+-  grub_fs_register (&grub_ufs_fs);
++  if (!grub_is_lockdown ())
++    {
++      grub_fs_register (&grub_ufs_fs);
++    }
+   my_mod = mod;
+ }
+ 
+@@ -913,6 +917,7 @@ GRUB_MOD_FINI(ufs1)
+ #endif
+ #endif
+ {
+-  grub_fs_unregister (&grub_ufs_fs);
++  if (!grub_is_lockdown ())
++    grub_fs_unregister (&grub_ufs_fs);
+ }
+ 
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index d187ffedc4..a9d55ba015 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -34,6 +34,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2025-0690.patch \
            file://CVE-2025-1118.patch \
            file://CVE-2024-45778_CVE-2024-45779.patch \
+           file://CVE-2025-0677_CVE-2025-0684_CVE-2025-0685_CVE-2025-0686_CVE-2025-0689.patch \
 "
 
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"
-- 
2.43.0


