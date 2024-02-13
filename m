Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7088BC4829F
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 21:43:47 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.26199.1707860625596550915
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 13:43:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=tyv5HZjk;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-5d42e7ab8a9so2972732a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 13:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1707860625; x=1708465425; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VxNCwsCF0pcZXY2WbJaH3f16QE/nnEoIdUBaXHVQv9A=;
        b=tyv5HZjkU7ju0Bn89eisYr9/vRbOVa6dLyDvYjCf0RWcLvYz3vAROrfvx1H7ZZwi4x
         dIciGQ5731qkZRrv3Cf9IJgEeu5sfX1gbFbqiuB2kaUgal/+Nd/LvNh4jmID8kS4873v
         NFs0MP1jlVYD0rgYNPdPTO9Y2vYxG6TQO5+3pfY8rY0lQRbQjbFx+ZIf3vznOvKg1qWK
         b9f1TDtN3IbBj7AA19kKI6LwGiNFCQXwXNLbqXiMfNfnphS4KHBjiSRqfLG1cFiN+5o5
         w2ZpW7HujZSA5QxF0hUgd3qX5z+hIPrhZv+oeDnkl6BexfCqhDI4tTAi7rCfRZPbaIPl
         +KOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707860625; x=1708465425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VxNCwsCF0pcZXY2WbJaH3f16QE/nnEoIdUBaXHVQv9A=;
        b=hONbBHfal9SyuMq8lmY24UbqCthG1BtqrVCjw1lZnKv2OuDuHbtOHWm6ZJVhtN+kp7
         xfaVPeU5RTa+A2hICWZurgHtzp8Kq7fRijo1Rkc3TQh3I4rOqRr4ZTgjHPgS7UDABP6Y
         2SBc0WFz4kBvIvUgHAprl83m4Modh22uJf1OA4s/nXyizD6CHypoQiNuEMi8rP6g43To
         rxLkB6z41Ed21zGh+aUPn5u09puEkeWLvvsnmm39Y7ESoMjKHWThyOBxj2nazyKwewnz
         IKB/4bm4zoy8UQGu3SwYRadwLL7MQLTSfxMiNVPMU2jdBsLAkX+ahG6/WymyGOCMVFVK
         RjZg==
X-Gm-Message-State: AOJu0Yyh+qn9pEKTNKLxiM9Q2zaMZvU7yuzVGuFDbuaNbELOxRrSDyr2
	CUxppMwOrJCP7BkHMIDeEjSbzkK3KZGXR89QVFQHjQCLfscvpKtyZBFKxRCP1qcxhE1BUtq1uIX
	y
X-Google-Smtp-Source: AGHT+IEHDEWBi/SzANOj4XD7ZWfityHK2vjvw5iGDozeNKyftUcziTsRg12b3XqTY2oOdKqgNRPwVw==
X-Received: by 2002:a05:6a00:10c4:b0:6e0:4b8a:7ab7 with SMTP id d4-20020a056a0010c400b006e04b8a7ab7mr578712pfu.21.1707860624886;
        Tue, 13 Feb 2024 13:43:44 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id x37-20020a056a0018a500b006e04efcfbc2sm7767327pfh.74.2024.02.13.13.43.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 13:43:44 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 5/7] ncurses: Fix CVE-2023-29491
Date: Tue, 13 Feb 2024 11:43:25 -1000
Message-Id: <041433f0767ae9112f6a74a7d7c93ce9b411792c.1707860435.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1707860435.git.steve@sakoman.com>
References: <cover.1707860435.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 21:43:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195434

From: virendra thakur <thakur.virendra1810@gmail.com>

memory corruption when processing malformed terminfo data entries
loaded by setuid/setgid programs

CVE-2023-29491.patch change the --disable-root-environ configure option
behavior.
set --disable-root-environ in configuration options.

--disable-root-environ option with a few additional changes
to the code allows us to mitigate CVE-2023-29491 and avoid
other issues that involve the possibility of malicious use of
environment variables through setuid applications, and, therefore,
it was the fix chosen in order to resolve this vulnerability.

Reference:
https://ubuntu.com/security/CVE-2023-29491
https://launchpad.net/ubuntu/+source/ncurses/6.2-0ubuntu2.1

Signed-off-by: virendra thakur <virendrak@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ncurses/files/CVE-2023-29491.patch        | 45 +++++++++++++++++++
 meta/recipes-core/ncurses/ncurses_6.2.bb      |  3 +-
 2 files changed, 47 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/ncurses/files/CVE-2023-29491.patch

diff --git a/meta/recipes-core/ncurses/files/CVE-2023-29491.patch b/meta/recipes-core/ncurses/files/CVE-2023-29491.patch
new file mode 100644
index 0000000000..0a0497723f
--- /dev/null
+++ b/meta/recipes-core/ncurses/files/CVE-2023-29491.patch
@@ -0,0 +1,45 @@
+Backport of:
+
+Author: Sven Joachim <svenjoac@gmx.de>
+Description: Change the --disable-root-environ configure option behavior
+ By default, the --disable-root-environ option forbids program run by
+ the superuser to load custom terminfo entries.  This patch changes
+ that to only restrict programs running with elevated privileges,
+ matching the behavior of the --disable-setuid-environ option
+ introduced in the 20230423 upstream patchlevel.
+Bug-Debian: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1034372#29
+Bug: https://lists.gnu.org/archive/html/bug-ncurses/2023-04/msg00018.html
+Forwarded: not-needed
+Last-Update: 2023-05-01
+
+Upstream-Status: Backport [https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/ncurses/6.2-0ubuntu2.1/ncurses_6.2-0ubuntu2.1.debian.tar.xz]
+CVE: CVE-2023-29491
+Signed-off-by: Virendra Thakur <virendrak@kpit.com>
+
+---
+ ncurses/tinfo/access.c |    2 --
+ 1 file changed, 2 deletions(-)
+
+--- a/ncurses/tinfo/access.c
++++ b/ncurses/tinfo/access.c
+@@ -178,15 +178,16 @@ _nc_is_file_path(const char *path)
+ NCURSES_EXPORT(int)
+ _nc_env_access(void)
+ {
++    int result = TRUE;
++
+ #if HAVE_ISSETUGID
+     if (issetugid())
+-	return FALSE;
++	result = FALSE;
+ #elif HAVE_GETEUID && HAVE_GETEGID
+     if (getuid() != geteuid()
+ 	|| getgid() != getegid())
+-	return FALSE;
++	result = FALSE;
+ #endif
+-    /* ...finally, disallow root */
+-    return (getuid() != ROOT_UID) && (geteuid() != ROOT_UID);
++    return result;
+ }
+ #endif
diff --git a/meta/recipes-core/ncurses/ncurses_6.2.bb b/meta/recipes-core/ncurses/ncurses_6.2.bb
index 451bfbcb5d..33285bcb5b 100644
--- a/meta/recipes-core/ncurses/ncurses_6.2.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.2.bb
@@ -5,11 +5,12 @@ SRC_URI += "file://0001-tic-hang.patch \
            file://0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch \
            file://CVE-2021-39537.patch \
            file://CVE-2022-29458.patch \
+           file://CVE-2023-29491.patch \
            "
 # commit id corresponds to the revision in package version
 SRCREV = "a669013cd5e9d6434e5301348ea51baf306c93c4"
 S = "${WORKDIR}/git"
-EXTRA_OECONF += "--with-abi-version=5"
+EXTRA_OECONF += "--with-abi-version=5 --disable-root-environ"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+(\+\d+)*)"
 
 # This is needed when using patchlevel versions like 6.1+20181013
-- 
2.34.1


