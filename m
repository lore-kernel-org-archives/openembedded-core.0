Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 399CAC35FF5
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:53:07 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.4676.1741809186135800206
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:53:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vv2jSJPN;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ff797f8f1bso454620a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741809185; x=1742413985; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LYtMpra41veMhesAdXqehjUQliM/Iyg6LIbjUtE1AEk=;
        b=vv2jSJPNibupc/ogFb9CE6wfmvJahTyTVC0xYYc3VtbRtUMdKBLf1PCbQXtBErRYhl
         h9xhQOKg7nrXOq9Ut3TPFM9BrJXHsf8BZg9fG1+oFFoANTjzJvGtCbh86bkxuXftoYbH
         ATNCwz5rvB6mTsEXKV9OYV9yShvCfTmNn72dwWc0NsB8TMf3Z9AUD9hXtSq7COmQcoZ5
         0ylbEuL3uRrofHkK8/4pDNdgBN5KNej3zbUDuHl9eM7QXr55rD3Enym4OiEi711r8X47
         RSuF+f38DeQkjVQwkdt7vu1dkO5KmwsdjPtxjxjh1AAgbNszHZ/bBOXMd3rSNJxtRw3r
         oAZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809185; x=1742413985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LYtMpra41veMhesAdXqehjUQliM/Iyg6LIbjUtE1AEk=;
        b=r374MUlcOGvtlMJ7J8cNMFk5ZjBCB8AcXvY1v8m9k1XREP5tD6BOHLBDpscXhVOjxu
         gaOe6KpQBD+S7TOksE4s2Biq1k6ksiSSPWtoMS0Tt8VZu0HJ78BnBHTXxlbt0unfXs6y
         XZLq4n6B6E9QZzl0ekJfaUeQ+Wm6KA3409MTnwp7UkVwJNQqkzQ+cWH6djBxoRi8z9NS
         h5A1xnlVdi89hFs7lXNw3+fKMlBmI3n+Rfq9Ngu3KFX3Bb7XKhmoKZ5mFMF6KAEulbia
         GytB+AhceZjpddaX9s+Z8isp5Y6IS61+vYphZZJxsRg5HGWqAJK+6JWkB/L9TvMJTldk
         NPBw==
X-Gm-Message-State: AOJu0Yy8+hjGrUqb1WFQ3fNmUf8Cqync2GIv2Ipn98Pm3kqx6fxXckhr
	1aZjawJtgRV0Bcl/wb8e2WLuek9z7IHneUSu83Nrnp2XyJSiiBxpjx5h4zi+moWekBGk/RRNMqc
	T
X-Gm-Gg: ASbGncubvZ2VxXvWI6q2VP8rIFTePf0bk2FtKd6rXv9/xUaOYABtzNxjA7wiHSOClnH
	LL0qs/fxDybuvuKRXJhTWrUdcaPxPdEy9rB0Z7NmzCDqDjJBjAgivRyk74e5iIMg+GHiOhZK1AJ
	tbtGQdZS1tIYZRZuzljnzs9Jdd+qwMMMZy6eijg1/GogKMmSDAlpyj2wqHMsYeMeXHwlEUfcgau
	DhsqM97X9zzxaoDqX0c0s0K7jmWCMSgWArrJ4S35r4rBKcZHJlvXPyPfzWZnlqu5CJUTgEFSvqw
	BNgRSjgsfdz7xXepG5aBxWQ4wEqYHW74rcM=
X-Google-Smtp-Source: AGHT+IGTXG3gFud3QNn22q1SnuTK6kTXLkKOMwNc8pOM9FY1k5CdPI6Hmy0g5tgsV97FcGDu0UKj9w==
X-Received: by 2002:a05:6a21:4cc7:b0:1f3:36f7:c0d2 with SMTP id adf61e73a8af0-1f58cbf3befmr14040730637.41.1741809185380;
        Wed, 12 Mar 2025 12:53:05 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5779:a397:ba1c:2b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56093c2f5sm1389955a12.67.2025.03.12.12.53.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:53:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 17/25] grub: patch CVE-2024-45778 and CVE-2024-45779
Date: Wed, 12 Mar 2025 12:52:25 -0700
Message-ID: <9ecee5f950f249d982b307bbdbe0e13e55f27b24.1741808973.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741808973.git.steve@sakoman.com>
References: <cover.1741808973.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:53:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212684

From: Peter Marko <peter.marko@siemens.com>

Cherry-pick patch mentioning these CVEs.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../files/CVE-2024-45778_CVE-2024-45779.patch | 55 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45778_CVE-2024-45779.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2024-45778_CVE-2024-45779.patch b/meta/recipes-bsp/grub/files/CVE-2024-45778_CVE-2024-45779.patch
new file mode 100644
index 0000000000..eba013897f
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2024-45778_CVE-2024-45779.patch
@@ -0,0 +1,55 @@
+From 26db6605036bd9e5b16d9068a8cc75be63b8b630 Mon Sep 17 00:00:00 2001
+From: Daniel Axtens <dja@axtens.net>
+Date: Sat, 23 Mar 2024 15:59:43 +1100
+Subject: [PATCH] fs/bfs: Disable under lockdown
+
+The BFS is not fuzz-clean. Don't allow it to be loaded under lockdown.
+This will also disable the AFS.
+
+Fixes: CVE-2024-45778
+Fixes: CVE-2024-45779
+
+Reported-by: Nils Langius <nils@langius.de>
+Signed-off-by: Daniel Axtens <dja@axtens.net>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+CVE: CVE-2024-45778
+CVE: CVE-2024-45779
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ grub-core/fs/bfs.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/grub-core/fs/bfs.c b/grub-core/fs/bfs.c
+index 022f69fe2..78aeb051f 100644
+--- a/grub-core/fs/bfs.c
++++ b/grub-core/fs/bfs.c
+@@ -30,6 +30,7 @@
+ #include <grub/types.h>
+ #include <grub/i18n.h>
+ #include <grub/fshelp.h>
++#include <grub/lockdown.h>
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+@@ -1106,7 +1107,10 @@ GRUB_MOD_INIT (bfs)
+ {
+   COMPILE_TIME_ASSERT (1 << LOG_EXTENT_SIZE ==
+ 		       sizeof (struct grub_bfs_extent));
+-  grub_fs_register (&grub_bfs_fs);
++  if (!grub_is_lockdown ())
++    {
++      grub_fs_register (&grub_bfs_fs);
++    }
+ }
+ 
+ #ifdef MODE_AFS
+@@ -1115,5 +1119,6 @@ GRUB_MOD_FINI (afs)
+ GRUB_MOD_FINI (bfs)
+ #endif
+ {
+-  grub_fs_unregister (&grub_bfs_fs);
++  if (!grub_is_lockdown ())
++    grub_fs_unregister (&grub_bfs_fs);
+ }
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index bd0c9d2601..d187ffedc4 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -33,6 +33,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2024-45777.patch \
            file://CVE-2025-0690.patch \
            file://CVE-2025-1118.patch \
+           file://CVE-2024-45778_CVE-2024-45779.patch \
 "
 
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"
-- 
2.43.0


