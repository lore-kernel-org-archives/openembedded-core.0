Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08073C83F01
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 17:48:50 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.1270.1693417721271795887
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 10:48:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=kxE3PWjE;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-68a1af910e0so4178854b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 10:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1693417720; x=1694022520; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UoD5oEADFKVMm0bKaPI06PiBgjEkMy8/skzNoCF3pwY=;
        b=kxE3PWjEDP+zQ+bAXxFIO4lMG20MqO6N+vL0ssl+5aIGLeXiwHOapCKhOKp+qaqrIy
         IFVNVfsXf6NMzYoaR7hLLNHOCK6NB1/9w4c7ZNw/ilA2yTSpYryMTtx+6A91zkcg14ze
         3aA3Hp9W6jiZBjsBetDhc72/A6UDSZR2GFg+b95My/kYoj2gE71Lw6RuQxnshHft4I8u
         mXLCYnmnMrHqrdnseJcJsB55LiXKStBhDnziOyBX+nu8+Aaf6MwNpNvFVY1j5saSDe19
         63BbD6wQaLXiNkWLlfDua1LpQuI3uUAhWGr1PREIceiX4V8ij7NYXGMaW6BST2swM/+e
         o0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693417720; x=1694022520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UoD5oEADFKVMm0bKaPI06PiBgjEkMy8/skzNoCF3pwY=;
        b=hgscIF03dp7M3ZacXSkSGR5oQ+qlYYYLe3mq+5YYyTzIFPNwLzqKchDXIDAL4hMueJ
         /NKIoQmRZBR58Tt+kMe1yyPk7ZKij0mESgtDBPQgZoQrKAwZoSfV3rTNlxDc81vzoHtz
         tdB2e4SE/gpg5A2JVn3h59DEYFLEJPmiDEbNAXcFai95JllQybJRBYf7P/hnJ/8urKP3
         c3+tSj0M2wpQ86/L2Dk3O0Txk238/kEwosXaAUdeUcGHtcD3VmjaThFIER0SBnOCIusd
         Nnhb8g1Xm3+Z6sta3O60HnsXumN5PSjquaq7D1PndLtAII3tdY2nUhkP7JbD9ghXfW3/
         w+lg==
X-Gm-Message-State: AOJu0Yyw400Me9oOLv//91kkXsD2sS3Khat2HTNo76wjrDqPL4kBkwRc
	FYONBbFIEilRCjlpx7NOU7tGyxJt/bnLSU7yftM=
X-Google-Smtp-Source: AGHT+IE9tlyGvDTNMiXqyxZ/b7qRkhDIdgKuABotbATnRgXeTqROtZEmFMiiXuIt+khRZQ8oCB5aHA==
X-Received: by 2002:a05:6a00:c87:b0:68b:e8f7:847 with SMTP id a7-20020a056a000c8700b0068be8f70847mr3172885pfv.17.1693417720231;
        Wed, 30 Aug 2023 10:48:40 -0700 (PDT)
Received: from xps13.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id fm14-20020a056a002f8e00b006889348ba6dsm10567578pfb.93.2023.08.30.10.48.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 10:48:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 04/20] tar: upgrade 1.34 -> 1.35
Date: Wed, 30 Aug 2023 07:48:08 -1000
Message-Id: <d85a7394a1efa8b644950b8d6edbc5e9917ce8b0.1693417541.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693417541.git.steve@sakoman.com>
References: <cover.1693417541.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 17:48:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186906

From: Wang Mingyu <wangmy@fujitsu.com>

CVE-2022-48303.patch
removed since it's included in 1.35

License-Update: http changed to https

Changelog:
===========
* Fail when building GNU tar, if the platform supports 64-bit time_t
  but the build uses only 32-bit time_t.
* Leave the devmajor and devminor fields empty (rather than zero) for
  non-special files, as this is more compatible with traditional tar.
* Bug fixes
** Fix interaction of --update with --wildcards.
** When extracting archives into an empty directory, do not create
   hard links to files outside that directory.
** Handle partial reads from regular files.
** Warn "file changed as we read it" less often.
** Fix --ignore-failed-read to ignore file-changed read errors
** Fix --remove-files to not remove a file that changed while we read it.
** Fix --atime-preserve=replace to not fail if there was no need to replace,
   either because we did not read the file, or the atime did not change.
** Fix race when creating a parent directory while another process is
   also doing so.
** Fix handling of prefix keywords not followed by "." in pax headers.
** Fix handling of out-of-range sparse entries in pax headers.
** Fix handling of --transform='s/s/@/2'.
** Fix treatment of options ending in / in files-from list.
** Fix crash on 'tar --checkpoint-action exec=\"'.
** Fix low-memory crash when reading incremental dumps.
** Fix --exclude-vcs-ignores memory allocation misuse.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c63769de05ce08c0627d302d14316ced31816b4d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../tar/tar/CVE-2022-48303.patch              | 43 -------------------
 .../tar/{tar_1.34.bb => tar_1.35.bb}          |  8 ++--
 2 files changed, 3 insertions(+), 48 deletions(-)
 delete mode 100644 meta/recipes-extended/tar/tar/CVE-2022-48303.patch
 rename meta/recipes-extended/tar/{tar_1.34.bb => tar_1.35.bb} (87%)

diff --git a/meta/recipes-extended/tar/tar/CVE-2022-48303.patch b/meta/recipes-extended/tar/tar/CVE-2022-48303.patch
deleted file mode 100644
index b2f40f3e64..0000000000
--- a/meta/recipes-extended/tar/tar/CVE-2022-48303.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 3da78400eafcccb97e2f2fd4b227ea40d794ede8 Mon Sep 17 00:00:00 2001
-From: Sergey Poznyakoff <gray@gnu.org>
-Date: Sat, 11 Feb 2023 11:57:39 +0200
-Subject: Fix boundary checking in base-256 decoder
-
-* src/list.c (from_header): Base-256 encoding is at least 2 bytes
-long.
-
-Upstream-Status: Backport [see reference below]
-CVE: CVE-2022-48303
-
-Reference to upstream patch:
-https://savannah.gnu.org/bugs/?62387
-https://git.savannah.gnu.org/cgit/tar.git/patch/src/list.c?id=3da78400eafcccb97e2f2fd4b227ea40d794ede8
-
-Signed-off-by: Rodolfo Quesada Zumbado <rodolfo.zumbado@windriver.com>
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
----
- src/list.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)Signed-off-by: Rodolfo Quesada Zumbado <rodolfo.zumbado@windriver.com>
-
-
-(limited to 'src/list.c')
-
-diff --git a/src/list.c b/src/list.c
-index 9fafc42..86bcfdd 100644
---- a/src/list.c
-+++ b/src/list.c
-@@ -881,8 +881,9 @@ from_header (char const *where0, size_t digs, char const *type,
- 	  where++;
- 	}
-     }
--  else if (*where == '\200' /* positive base-256 */
--	   || *where == '\377' /* negative base-256 */)
-+  else if (where <= lim - 2
-+	   && (*where == '\200' /* positive base-256 */
-+	       || *where == '\377' /* negative base-256 */))
-     {
-       /* Parse base-256 output.  A nonnegative number N is
- 	 represented as (256**DIGS)/2 + N; a negative number -N is
--- 
-cgit v1.1
-
diff --git a/meta/recipes-extended/tar/tar_1.34.bb b/meta/recipes-extended/tar/tar_1.35.bb
similarity index 87%
rename from meta/recipes-extended/tar/tar_1.34.bb
rename to meta/recipes-extended/tar/tar_1.35.bb
index 1ef5fe221e..4dbd418b60 100644
--- a/meta/recipes-extended/tar/tar_1.34.bb
+++ b/meta/recipes-extended/tar/tar_1.35.bb
@@ -4,13 +4,11 @@ or disk archive, and can restore individual files from the archive."
 HOMEPAGE = "http://www.gnu.org/software/tar/"
 SECTION = "base"
 LICENSE = "GPL-3.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
-SRC_URI = "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2 \
-           file://CVE-2022-48303.patch \
-"
+SRC_URI = "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2"
 
-SRC_URI[sha256sum] = "b44cc67f8a1f6b0250b7c860e952b37e8ed932a90bd9b1862a511079255646ff"
+SRC_URI[sha256sum] = "7edb8886a3dc69420a1446e1e2d061922b642f1cf632d2cd0f9ee7e690775985"
 
 inherit autotools gettext texinfo
 
-- 
2.34.1


