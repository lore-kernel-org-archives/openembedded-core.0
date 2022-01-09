Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01CBBC43217
	for <webhook@archiver.kernel.org>; Sun,  9 Jan 2022 22:27:56 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web12.23874.1641767274475582804
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 14:27:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DRupfDND;
 spf=pass (domain: gmail.com, ip: 209.85.128.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso8222062wmj.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 14:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a876aILdw9evGi/2FoLYQh0QXclYIoBa+Oc7808gI5k=;
        b=DRupfDNDtFs9wDP0Uj9Jzd0RwOkZXCdg6+Rt7AcjUoY138axMVQrGuXgE+Kppun9uH
         qK8OsRuQRzL9dioViJ1vn/tFoJYgzxLvp0mY0UTFq4Adhn9uxOanhmX0RUPSLdn2uOwk
         ViO/l5/fCTOQ9bqaGlWgZRqTfBlfymtLokX+/8wa0YYJXm4Ap1ziziNzrLXiotFD3tpp
         JoiYVgKF6tUqFSn8AM+28Cb2aFx0GlJGf+4E8HAiGarTadfr18ZiPnrOfm86gWpYSTVF
         HVOWPajBsNrpeaSsb8T4ONPfCJJ84fa0gNZTiWOeACveAvjoZbjuqd8MuwjZ8mPy0nTU
         nIXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a876aILdw9evGi/2FoLYQh0QXclYIoBa+Oc7808gI5k=;
        b=NokostiPneoEHCCxZFv7YDJzCmttMkbTRtnkoL3F/sNLZO6+tzCHvmWNP8qosHQnyi
         HeP67m0DVK7gAqjrExgJawixesJOJgJkeysqQdXsmyCkQ0H3QmTnK7iWFW44Z53fEeUO
         h+rGx6U9A8EUS7VbRecsRviAo5wz9u2jyehB9kI4ME0gzU8YTAVq31l1zdZqrb37hnbU
         kl7gUzix8jX65whYwGf4xLwc9Cjl5Dbwk/aPDM6Xqn4Kj5q2vzy/7djPvel30JucXVZY
         pivdCzqwem4Gi2xXxjZsQcsW2aKGn+j89Kdge70HVXQRB4tcBbyg6hyA3J7QFYtX6C/D
         eMEQ==
X-Gm-Message-State: AOAM532APbZVw+AYBJFShD4IGTXs9IN8Zkp87Ysuf1l896r1G47czAXe
	r1RvXkUxa2RuUb/xVI9NdIj5DU8Ykzs=
X-Google-Smtp-Source: 
 ABdhPJxq0tKEkG8r0HvfHERnLIZ3LCNRwCVVzvB8DdMtjTXAwWlrCpHOVHOcnoCR+ywwUoHrhPAy3A==
X-Received: by 2002:a7b:c08c:: with SMTP id
 r12mr19835905wmh.161.1641767273059;
        Sun, 09 Jan 2022 14:27:53 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 l6sm6804319wry.18.2022.01.09.14.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jan 2022 14:27:52 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Andrej Valek <andrej.valek@siemens.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 04/14] busybox: update 1.34.1 -> 1.35.0
Date: Sun,  9 Jan 2022 23:27:22 +0100
Message-Id: <20220109222732.2252416-4-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220109222732.2252416-1-alex@linutronix.de>
References: <20220109222732.2252416-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Jan 2022 22:27:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160307

Drop upstreamed patch.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-mktemp-add-tmpdir-option.patch       | 81 -------------------
 .../busybox/busybox/fail_on_no_media.patch    | 28 ++++---
 .../{busybox_1.34.1.bb => busybox_1.35.0.bb}  |  3 +-
 3 files changed, 19 insertions(+), 93 deletions(-)
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-mktemp-add-tmpdir-option.patch
 rename meta/recipes-core/busybox/{busybox_1.34.1.bb => busybox_1.35.0.bb} (93%)

diff --git a/meta/recipes-core/busybox/busybox/0001-mktemp-add-tmpdir-option.patch b/meta/recipes-core/busybox/busybox/0001-mktemp-add-tmpdir-option.patch
deleted file mode 100644
index 4a1960dff2..0000000000
--- a/meta/recipes-core/busybox/busybox/0001-mktemp-add-tmpdir-option.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From ceb378209f953ea745ed93a8645567196380ce3c Mon Sep 17 00:00:00 2001
-From: Andrej Valek <andrej.valek@siemens.com>
-Date: Thu, 24 Jun 2021 19:13:22 +0200
-Subject: [PATCH] mktemp: add tmpdir option
-
-Make mktemp more compatible with coreutils.
-- add "--tmpdir" option
-- add long variants for "d,q,u" options
-
-Upstream-Status: Submitted [http://lists.busybox.net/pipermail/busybox/2021-June/088932.html]
-
-Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- coreutils/mktemp.c | 26 ++++++++++++++++++--------
- 1 file changed, 18 insertions(+), 8 deletions(-)
-
-diff --git a/coreutils/mktemp.c b/coreutils/mktemp.c
-index 5393320a5..05c6d98c6 100644
---- a/coreutils/mktemp.c
-+++ b/coreutils/mktemp.c
-@@ -39,16 +39,17 @@
- //kbuild:lib-$(CONFIG_MKTEMP) += mktemp.o
- 
- //usage:#define mktemp_trivial_usage
--//usage:       "[-dt] [-p DIR] [TEMPLATE]"
-+//usage:       "[-dt] [-p DIR, --tmpdir[=DIR]] [TEMPLATE]"
- //usage:#define mktemp_full_usage "\n\n"
- //usage:       "Create a temporary file with name based on TEMPLATE and print its name.\n"
- //usage:       "TEMPLATE must end with XXXXXX (e.g. [/dir/]nameXXXXXX).\n"
- //usage:       "Without TEMPLATE, -t tmp.XXXXXX is assumed.\n"
--//usage:     "\n	-d	Make directory, not file"
--//usage:     "\n	-q	Fail silently on errors"
--//usage:     "\n	-t	Prepend base directory name to TEMPLATE"
--//usage:     "\n	-p DIR	Use DIR as a base directory (implies -t)"
--//usage:     "\n	-u	Do not create anything; print a name"
-+//usage:     "\n	-d			Make directory, not file"
-+//usage:     "\n	-q			Fail silently on errors"
-+//usage:     "\n	-t			Prepend base directory name to TEMPLATE"
-+//usage:     "\n	-p DIR, --tmpdir[=DIR]	Use DIR as a base directory (implies -t)"
-+//usage:     "\n				For --tmpdir is a optional one."
-+//usage:     "\n	-u			Do not create anything; print a name"
- //usage:     "\n"
- //usage:     "\nBase directory is: -p DIR, else $TMPDIR, else /tmp"
- //usage:
-@@ -72,13 +73,22 @@ int mktemp_main(int argc UNUSED_PARAM, char **argv)
- 		OPT_t = 1 << 2,
- 		OPT_p = 1 << 3,
- 		OPT_u = 1 << 4,
-+		OPT_td = 1 << 5,
- 	};
- 
- 	path = getenv("TMPDIR");
- 	if (!path || path[0] == '\0')
- 		path = "/tmp";
- 
--	opts = getopt32(argv, "^" "dqtp:u" "\0" "?1"/*1 arg max*/, &path);
-+	opts = getopt32long(argv, "^"
-+	       "dqtp:u\0"
-+	       "?1" /* 1 arg max */,
-+	       "directory\0" No_argument       "d"
-+	       "quiet\0"     No_argument       "q"
-+	       "dry-run\0"   No_argument       "u"
-+	       "tmpdir\0"    Optional_argument "\xff"
-+	       , &path, &path
-+	);
- 
- 	chp = argv[optind];
- 	if (!chp) {
-@@ -95,7 +105,7 @@ int mktemp_main(int argc UNUSED_PARAM, char **argv)
- 		goto error;
- 	}
- #endif
--	if (opts & (OPT_t|OPT_p))
-+	if (opts & (OPT_t|OPT_p|OPT_td))
- 		chp = concat_path_file(path, chp);
- 
- 	if (opts & OPT_u) {
--- 
-2.11.0
-
diff --git a/meta/recipes-core/busybox/busybox/fail_on_no_media.patch b/meta/recipes-core/busybox/busybox/fail_on_no_media.patch
index 820acc2684..38db52538e 100644
--- a/meta/recipes-core/busybox/busybox/fail_on_no_media.patch
+++ b/meta/recipes-core/busybox/busybox/fail_on_no_media.patch
@@ -1,3 +1,8 @@
+From a35e79002d36cca3c272ba5625aec86d6b7a38a8 Mon Sep 17 00:00:00 2001
+From: Saul Wold <sgw@linux.intel.com>
+Date: Tue, 9 Apr 2013 23:25:54 -0700
+Subject: [PATCH] busybox: fail on no media
+
 Upstream-Status: Denied
 [https://www.mail-archive.com/busybox@busybox.net/msg22354.html]
 
@@ -10,16 +15,18 @@ removed, but that would be harder to accomplish.
 
 Signed-off-by: Saul Wold <sgw@linux.intel.com>
 
+---
+ util-linux/mount.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
 
-Index: busybox-1.20.2/util-linux/mount.c
-===================================================================
---- busybox-1.20.2.orig/util-linux/mount.c
-+++ busybox-1.20.2/util-linux/mount.c
-@@ -598,7 +598,13 @@ static int mount_it_now(struct mntent *m
- 				break;
+diff --git a/util-linux/mount.c b/util-linux/mount.c
+index 4e65b6b..9d7a566 100644
+--- a/util-linux/mount.c
++++ b/util-linux/mount.c
+@@ -746,6 +746,14 @@ static int mount_it_now(struct mntent *mp, unsigned long vfsflags, char *filtero
  			errno = errno_save;
  		}
--
+ 
 +		/*
 +		 * Break if there is no media, no point retrying for all
 +		 * fs types since there is no media available
@@ -27,6 +34,7 @@ Index: busybox-1.20.2/util-linux/mount.c
 +		if (rc == -1 && errno == ENOMEDIUM) {
 +			bb_perror_msg_and_die("mounting %s on %s failed", mp->mnt_fsname, mp->mnt_dir);
 +		}
- 		if (!rc || (vfsflags & MS_RDONLY) || (errno != EACCES && errno != EROFS))
- 			break;
- 		if (!(vfsflags & MS_SILENT))
++
+ 		// Should we retry read-only mount?
+ 		if (vfsflags & MS_RDONLY)
+ 			break;		// no, already was tried
diff --git a/meta/recipes-core/busybox/busybox_1.34.1.bb b/meta/recipes-core/busybox/busybox_1.35.0.bb
similarity index 93%
rename from meta/recipes-core/busybox/busybox_1.34.1.bb
rename to meta/recipes-core/busybox/busybox_1.35.0.bb
index 3651c06126..7ce1717046 100644
--- a/meta/recipes-core/busybox/busybox_1.34.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.35.0.bb
@@ -46,8 +46,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-testsuite-use-www.example.org-for-wget-test-cases.patch \
            file://0001-du-l-works-fix-to-use-145-instead-of-144.patch \
            file://0001-sysctl-ignore-EIO-of-stable_secret-below-proc-sys-ne.patch \
-           file://0001-mktemp-add-tmpdir-option.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg "
 
-SRC_URI[tarball.sha256sum] = "415fbd89e5344c96acf449d94a6f956dbed62e18e835fc83e064db33a34bd549"
+SRC_URI[tarball.sha256sum] = "faeeb244c35a348a334f4a59e44626ee870fb07b6884d68c10ae8bc19f83a694"
-- 
2.20.1


