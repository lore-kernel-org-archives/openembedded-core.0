Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC9E9CD4925
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 22:31:23 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.3138.1695249075929876275
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 15:31:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=tlk2iUba;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-690b7cb71aeso176358b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 15:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695249075; x=1695853875; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UoD5oEADFKVMm0bKaPI06PiBgjEkMy8/skzNoCF3pwY=;
        b=tlk2iUbawMQQrfLSmVArUlbNgqRwU3DaTHanyqfYCHLAtat6x/3/n3ut2uSAW44udX
         Kx9/AsonT846KeJX3embrykRlRDk20VTMl1fnnRaNKgwMjz708SxtJjzcjXHPG6eJU9M
         jSt88XhJPFFbkc1TkssPFK7+SzO50MeASQspE4ZB9QR+IBMh3pCKSREKDJuE0r9377xP
         CujGQCIRXOnMK7qG8XtzPUtt2+YKy891YXZyawbQUabtIgZsIrFou/jF3v0gHdKGD7nj
         lebzsEkyA854AJT8QdY48FMVaO4ZzX9hVkm5CCtKQRwXL5LdHNHfFp6zZzTByVCQmuqM
         taVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695249075; x=1695853875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UoD5oEADFKVMm0bKaPI06PiBgjEkMy8/skzNoCF3pwY=;
        b=OzySNJOiTZqNbipRCbOQqEf13WgCtP22wNhqeMSEzyECan1zJSWABtnN3WUmrbt3s4
         T/OfSuXtrMB0vIgcfuwXlOyG4dH9JDSlP0vThiBf0ux2oF2yQRISor9Xbzgvol+iX5Cs
         GsPSQ9WbSU6eCn89HBYaYra+Lue/gWTeYmfPd/VQF8EV7271i4ihCizIUsKdzlaaDq1J
         ije0YFPi7fad90ckbYGlcCwrz9hMY6H2BAiiThjB36rBGHcGFpY5b5gSX5wpGpBlcpGc
         EY0iNbByOwEFqIxBFIJirg9UHO2gILhtX/zWXzm9DvVoEZAQZ7ahl9niOQyYoIg6JqvM
         VRKw==
X-Gm-Message-State: AOJu0YwYP18ZVjNn6Zfo63M/sFdjafyN2btUkTd+TGP5/qqu0iAfkCV/
	5GpA8HEmLjW7q9riglU2PwD9XM6bD1ofXTpj8zg=
X-Google-Smtp-Source: AGHT+IGA8R2gRVVukB5g9m0kT8UgXxk5AetVJpGoY/nX4xYoGG5OthTvI0wa2JPpjPhbvtRhDLkFLw==
X-Received: by 2002:a05:6a00:4385:b0:68a:48e7:9deb with SMTP id bt5-20020a056a00438500b0068a48e79debmr8816902pfb.2.1695249074845;
        Wed, 20 Sep 2023 15:31:14 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id a13-20020a63704d000000b00578f1a71a91sm11535pgn.79.2023.09.20.15.31.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 15:31:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/20] tar: upgrade 1.34 -> 1.35
Date: Wed, 20 Sep 2023 12:30:44 -1000
Message-Id: <4910b1e46a67dcdc3f7ebbab648a2b365c1910da.1695248921.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695248921.git.steve@sakoman.com>
References: <cover.1695248921.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 22:31:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187955

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


