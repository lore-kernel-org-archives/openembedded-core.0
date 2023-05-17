Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6E2FC7EE2A
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 02:44:56 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.40950.1684291495323129481
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 May 2023 19:44:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=48gjhDVg;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-24dec03ad8fso295320a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 May 2023 19:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1684291494; x=1686883494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ne04COgMAhX13WtvBSZI5A3LjNY4NBrAKTn+HmT6krY=;
        b=48gjhDVgoH0sCkdonnuHh+kgnpdNuKbiTzjxdOgvKxRFsbQ3gHRXTINjdpSVECYbMk
         PJxRomJruOE5BuolB0SIbWA02DtLSLv+jeTdyalZgyNL+5YsGEG0WPEziucFoe0O+3I1
         kwwJSTkupH3KCfAav6MnlzHZnV00f0l+qWSjS8AF5DWtJMvXCztdXKCkjHDbebgJDSxo
         lWaYOnFL+Na0lcqWrfQ+cZC4s/wHmq6NMIV13OYsDc1KRQ9zEhbuHDuyiZSMtWKCS9G8
         K8Qh7mJVSSlqCzLtL6iligCNQVxDQKdSv+FgVxWBxXun8WWr6jJomTlMbok2JaWi7s0G
         MH8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684291494; x=1686883494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ne04COgMAhX13WtvBSZI5A3LjNY4NBrAKTn+HmT6krY=;
        b=DyhVJgp93eJKo3Jt7/dWb9MAU5Uhvv1VcM6oNA80MeXEacjBLfJITcGHLt7vyA/x8z
         rkHZrhvDlNKKl7p2IyByAZ/gXu0Ej0HNHt7h11tf9ZhLjCcyOqYdnEeLtIH803iTyByJ
         rn4mdR6Lf7liAkDZZk6OJNzr0ARrLz0+GlHWRtaDqzzctEeDKllbmUkaoWpgTLZKnVhe
         GP3GUpVosM5j92Pm6wP76zFXlzX//psLtXwcEczD4TWm1JDkFk2hMu6Trv31S+pVPAP4
         jSlDZ7UcrcurHew1cN2jGJ0PBCnASIuNaPiXjHv/4esQWQpS7fqgzBcg2cE+vSpatIoL
         VvUg==
X-Gm-Message-State: AC+VfDyo49eLZ7odfTxWASve6vGPjF7dd7Ypt4dW4fCJE8WbH/+idNY5
	o8unLiMr71p4uFnNZzLNvcO/aiUrJ1LSvTrlhD4=
X-Google-Smtp-Source: ACHHUZ6bH7QG1hrCD/YC/UpsfPf2HZI7sU6Fx+CCkJ5i3DtEg96Wf45o7Ru3Vitbv+6GNZj/kneLJQ==
X-Received: by 2002:a17:902:d505:b0:1a6:dd9a:62c5 with SMTP id b5-20020a170902d50500b001a6dd9a62c5mr49942537plg.10.1684291494330;
        Tue, 16 May 2023 19:44:54 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id bj11-20020a170902850b00b001a2135e7eabsm16282767plb.16.2023.05.16.19.44.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 19:44:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 05/13] unfs3: fix symlink time setting issue
Date: Tue, 16 May 2023 16:44:28 -1000
Message-Id: <221b509b31a44a16ccc0f66293e51b86322c0b5b.1684291329.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1684291329.git.steve@sakoman.com>
References: <cover.1684291329.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 02:44:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181434

From: hen Qi <Qi.Chen@windriver.com>

Add back the dropped 0001-attr-fix-utime-for-symlink.patch
to fix symlink time setting issue on NFS.

The problem could be reproduced by runing the following command
on nfs booted qemu:

  ln -s dest src && touch -h src

Apart from the rpm operations mentioned in the original patch,
'docker pull' also fails with a 'stale file' error. The common
pattern here is extracting files from a bundle and setting times
for them.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fe35a2c11ba6f87735bccae244817016f9c1b5db)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-attr-fix-utime-for-symlink.patch     | 88 +++++++++++++++++++
 meta/recipes-devtools/unfs3/unfs3_git.bb      |  1 +
 2 files changed, 89 insertions(+)
 create mode 100644 meta/recipes-devtools/unfs3/unfs3/0001-attr-fix-utime-for-symlink.patch

diff --git a/meta/recipes-devtools/unfs3/unfs3/0001-attr-fix-utime-for-symlink.patch b/meta/recipes-devtools/unfs3/unfs3/0001-attr-fix-utime-for-symlink.patch
new file mode 100644
index 0000000000..a0f3740d6a
--- /dev/null
+++ b/meta/recipes-devtools/unfs3/unfs3/0001-attr-fix-utime-for-symlink.patch
@@ -0,0 +1,88 @@
+From 7e789895919d57d573ebb8faa147d1286104cd01 Mon Sep 17 00:00:00 2001
+From: Rui Wang <rui.wang@windriver.com>
+Date: Mon, 24 Apr 2023 02:57:57 -0700
+Subject: [PATCH] attr: fix utime for symlink
+
+unfs3 has an old defect that it can not change the timestamps of a
+symlink file because it only uses utime(), which will follow the
+symlink. This will not cause an error if the symlink points to an
+existent file. But under some special situation, such as installing
+a rpm package, rpm tool will create the symlink first and try to
+modify the timestamps of it, when the target file is non-existent.
+This will cause an ESTALE error. Making rpm tool ignore this error
+is a solution, but not the best one. An acceptable approach is
+Making unfs3 support lutimes(), which can modify the symlink file
+itself. Considering not every system support this function, so a
+function checking is necessary.
+
+Upstream-Status: Submitted [https://github.com/unfs3/unfs3/pull/35]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ attr.c         | 15 +++++++++++----
+ backend_unix.h |  2 ++
+ configure.ac   |  1 +
+ 3 files changed, 14 insertions(+), 4 deletions(-)
+
+diff --git a/attr.c b/attr.c
+index 0ce9375..930ce6e 100644
+--- a/attr.c
++++ b/attr.c
+@@ -285,7 +285,7 @@ post_op_attr get_post_cached(struct svc_req * req)
+ static nfsstat3 set_time(const char *path, backend_statstruct buf, sattr3 new)
+ {
+     time_t new_atime, new_mtime;
+-    struct utimbuf utim;
++    struct timeval stamps[2];
+     int res;
+ 
+     /* set atime and mtime */
+@@ -307,10 +307,17 @@ static nfsstat3 set_time(const char *path, backend_statstruct buf, sattr3 new)
+ 	else			       /* DONT_CHANGE */
+ 	    new_mtime = buf.st_mtime;
+ 
+-	utim.actime = new_atime;
+-	utim.modtime = new_mtime;
++	stamps[0].tv_sec = new_atime;
++	stamps[0].tv_usec = 0;
++	stamps[1].tv_sec = new_mtime;
++	stamps[1].tv_usec = 0;
++
++#if HAVE_LUTIMES
++	res = backend_lutimes(path, stamps);
++#else
++	res = backend_utimes(path, stamps);
++#endif
+ 
+-	res = backend_utime(path, &utim);
+ 	if (res == -1)
+ 	    return setattr_err();
+     }
+diff --git a/backend_unix.h b/backend_unix.h
+index 4db72ae..9cce9ab 100644
+--- a/backend_unix.h
++++ b/backend_unix.h
+@@ -61,6 +61,8 @@
+ #define backend_symlink symlink
+ #define backend_truncate truncate
+ #define backend_utime utime
++#define backend_utimes utimes
++#define backend_lutimes lutimes
+ #define backend_statstruct struct stat
+ #define backend_dirstream DIR
+ #define backend_statvfsstruct struct statvfs
+diff --git a/configure.ac b/configure.ac
+index d46c905..c21afe3 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -32,6 +32,7 @@ AC_CHECK_FUNCS(setresuid setresgid)
+ AC_CHECK_FUNCS(vsyslog)
+ AC_CHECK_FUNCS(lchown)
+ AC_CHECK_FUNCS(setgroups)
++AC_CHECK_FUNCS(lutimes)
+ UNFS3_COMPILE_WARNINGS
+ 
+ PKG_CHECK_MODULES([TIRPC], [libtirpc])
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/unfs3/unfs3_git.bb b/meta/recipes-devtools/unfs3/unfs3_git.bb
index 9913a503e8..c5b7898b3c 100644
--- a/meta/recipes-devtools/unfs3/unfs3_git.bb
+++ b/meta/recipes-devtools/unfs3/unfs3_git.bb
@@ -17,6 +17,7 @@ SRC_URI = "git://github.com/unfs3/unfs3.git;protocol=https;branch=master \
            file://0001-Alias-off64_t-to-off_t-on-linux-if-not-defined.patch \
            file://0001-locate.c-Include-attr.h.patch \
            file://0001-fix-building-on-macOS.patch \
+           file://0001-attr-fix-utime-for-symlink.patch \
            "
 SRCREV = "c8f2d2cd4529955419bad0e163f88d47ff176b8d"
 UPSTREAM_CHECK_GITTAGREGEX = "unfs3\-(?P<pver>\d+(\.\d+)+)"
-- 
2.34.1


