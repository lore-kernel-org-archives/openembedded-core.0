Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F9EEC4829A
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 21:43:47 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.26201.1707860627247652008
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 13:43:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=QnN7wLFy;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6e08dd0fa0bso138843b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 13:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1707860626; x=1708465426; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YMLCsOZVXvEU4p+mmDBVNpHaMRYnfo9qFmdmuxcQjoE=;
        b=QnN7wLFy45x9LgRU/hixuexjzZKFSSTbOxC/Rm2nzVkbTwoJkXiUvkCaZzBiAnTSe1
         wwWErH1Wn2WgduuysDazHE+COXS+Fd2R+rGO/zJgNajW4VTE7Ltm87gNxOcIaIzrqw5F
         pNA12ZcnRpMClNjD0JdAhpWe+a63SWj5VvxFQLVi1LZlJFDti/mcK5wyPJgHgKYCXiEN
         SPOSO0qH/9O+wdcFc54+SIOj0mnzCASps5z/QbpUAZcC1652IsEAb/zOkMfofDmEFRge
         u8MG+uUqzQDVbnjOEV7tPv2FgAR7oli5nuo9Q5HTI9SSyFQt+Jqzm/AN5ik8gAz/TrFT
         GhSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707860626; x=1708465426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YMLCsOZVXvEU4p+mmDBVNpHaMRYnfo9qFmdmuxcQjoE=;
        b=F0COogrMSHDX5K6P1lckS5szL/Qe6wL8fJLb0zplLiqwAk9Z138UFxLxkNBjaBH4dl
         9INQu/JN3miioM+AydXv70qX7tNWTDXTxS5Ny1jT6Vix+FBqFfxbqXQzt1BumoSwe1kX
         4SxCWTygP7GjmWSznCHXG+NbFf05uDaUJJ9zDzvh+ymEIzJ3/RxbnCandGpBtrcszkmA
         CXr2B9qrTqcC4+l8RbtnpGpcWocHe0dzcIJa7rjqV8sInuedx3h6Wx2cPW5RYjesZv8a
         6vu7zhRkrYdlpmI/EnMAFRhwTXnpV7spEw7e4CMxxqupecFlEhzqbXjZENPxal6A8jvf
         GruQ==
X-Gm-Message-State: AOJu0YytkJfxMI9VRCgdqkFmt5gi53cA2sT5x/SV9UBdJ4WOLHbtonny
	4KweDGLhXxKOXxua/ipZOeIsdQJ8hWuEwFNn4B6gHi/lcT+Ifnmq99eUifcS+850f5JpM4eE5WY
	p
X-Google-Smtp-Source: AGHT+IHsLiQhs0uVi7+EEOy8qUCS+xWMzx0mIZaThHwEOrjrzQmDbiZvA0e9WiqxGG4bzKqbbMBdVg==
X-Received: by 2002:a05:6a00:2d1d:b0:6e0:3d93:1bea with SMTP id fa29-20020a056a002d1d00b006e03d931beamr207497pfb.0.1707860626370;
        Tue, 13 Feb 2024 13:43:46 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id x37-20020a056a0018a500b006e04efcfbc2sm7767327pfh.74.2024.02.13.13.43.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 13:43:46 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 6/7] rsync: Fix rsync hanging when used with --relative
Date: Tue, 13 Feb 2024 11:43:26 -1000
Message-Id: <fb448f87c0b3906b91d453451083dc003ac94ebe.1707860435.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1707860435.git.steve@sakoman.com>
References: <cover.1707860435.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 21:43:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195435

From: Matthias Schmitz <matthias.schmitz@port4949.net>

Fixes [YOCTO #15383]

This bug was introduced into upstream when fixing CVE-2022-29154. It was
later discovered and fixed upstream but this fix didn't make it into
poky yet.
The added patch is taken from upstreams git repository:
https://github.com/WayneD/rsync/commit/fabef23bea6e9963c06e218586fda1a823e3c6bf

Signed-off-by: Matthias Schmitz <matthias.schmitz@port4949.net>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...lative-when-copying-an-absolute-path.patch | 31 +++++++++++++++++++
 meta/recipes-devtools/rsync/rsync_3.1.3.bb    |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/0001-Fix-relative-when-copying-an-absolute-path.patch

diff --git a/meta/recipes-devtools/rsync/files/0001-Fix-relative-when-copying-an-absolute-path.patch b/meta/recipes-devtools/rsync/files/0001-Fix-relative-when-copying-an-absolute-path.patch
new file mode 100644
index 0000000000..b2e02dba97
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/0001-Fix-relative-when-copying-an-absolute-path.patch
@@ -0,0 +1,31 @@
+From fabef23bea6e9963c06e218586fda1a823e3c6bf Mon Sep 17 00:00:00 2001
+From: Wayne Davison <wayne@opencoder.net>
+Date: Mon, 8 Aug 2022 21:30:21 -0700
+Subject: [PATCH] Fix --relative when copying an absolute path.
+
+CVE: CVE-2022-29154
+Upstream-Status: Backport [https://github.com/WayneD/rsync/commit/fabef23bea6e9963c06e218586fda1a823e3c6bf]
+Signed-off-by: Matthias Schmitz <matthias.schmitz@port4949.net>
+---
+ exclude.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/exclude.c b/exclude.c
+index 2394023f..ba5ca5a3 100644
+--- a/exclude.c
++++ b/exclude.c
+@@ -434,8 +434,10 @@ void add_implied_include(const char *arg)
+ 				*p++ = *cp++;
+ 				break;
+ 			  case '/':
+-				if (p[-1] == '/') /* This is safe because of the initial slash. */
++				if (p[-1] == '/') { /* This is safe because of the initial slash. */
++					cp++;
+ 					break;
++				}
+ 				if (relative_paths) {
+ 					filter_rule const *ent;
+ 					int found = 0;
+-- 
+2.39.2
+
diff --git a/meta/recipes-devtools/rsync/rsync_3.1.3.bb b/meta/recipes-devtools/rsync/rsync_3.1.3.bb
index a5c20dee34..c744503227 100644
--- a/meta/recipes-devtools/rsync/rsync_3.1.3.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.1.3.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://CVE-2016-9842.patch \
            file://CVE-2016-9843.patch \
            file://CVE-2022-29154.patch \
+           file://0001-Fix-relative-when-copying-an-absolute-path.patch \
 "
 
 SRC_URI[md5sum] = "1581a588fde9d89f6bc6201e8129afaf"
-- 
2.34.1


