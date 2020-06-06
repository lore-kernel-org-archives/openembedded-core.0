Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web11.6088.1591429109096790940
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Jun 2020 00:38:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=sYnLHG3T;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=7vhd=7t=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49fBFs59K1z4R
	for <openembedded-core@lists.openembedded.org>; Sat,  6 Jun 2020 09:38:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1591429105;
	bh=2YbLUEt0gvpsbMnlsMyOo6/gZgwRKhkcMzu15a8jVP0=;
	h=From:To:Subject:Date:From;
	b=sYnLHG3Tnm75CMtRq7RMh4u96AF8z5RZNFv/LqkI/S4w2dboW3EvqXAOkRwUFJ6Zl
	 SI3gN35ASJMwAWXRlF+QKbiujomEl25evg4htqeavFhySa8lqYOsXADyvP1nwUXYuu
	 Hb1cZIbi507ZsYlhoON6ZpP8/yAL+TMqsXzRWVH67/fOcGb0P2NJGbP9b6nWTnjFBN
	 6HxchDQJ7FqcrjtN1qlAOSyi9hvfhCbIn4nEmUH+FVI5W8A5nQNGR7lwueYwQakO6H
	 J40FsU36tjMwwb9/TCEhxca/ioIoM63ANwxJawyiicG9sfyqIDKayRmDoXezvgfj/Y
	 ntW2Z5PYi9c93hBMGuSsJ7fg6jJdANKX5LRk/X9/QotJK0DOJA6hbiGg9DuK9b60k5
	 sbYut3vo7hkpKguKtRS+ENzFh2EvN7pJb9e9BUIJCLL3nWiDWU65CrYAyC/5z1o7Q9
	 nZVOTlgNDvA6uLa2dcKCsts95dD19Tb4WEHZC3hgj6rFSBBYuix22GNi+BsImLIQTs
	 yke3QsKxG787lgJg9fdiO4u6GMdqRsDc15U9yVQfPuPIL7U/bCmhlnYcCOWkWepEsQ
	 I/rxYkTKKTDXzmga7pfFtkc/jkLki3vos1G31Tw1rnEX8Afz3eqXCn/uwLAXcasUD1
	 gtV/OlAmIGVCpFs7DyCofw44=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] dpkg: Remove workaound patch for host tar < 1.27
Date: Sat,  6 Jun 2020 10:38:24 +0300
Message-Id: <20200606073824.17972-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

tar >= 1.28 is already required.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../dpkg/tweak-options-require-tar-1.27.patch | 36 -------------------
 meta/recipes-devtools/dpkg/dpkg_1.20.0.bb     |  3 --
 2 files changed, 39 deletions(-)
 delete mode 100644 meta/recipes-devtools/dpkg/dpkg/tweak-options-require-tar-1.27.patch

diff --git a/meta/recipes-devtools/dpkg/dpkg/tweak-options-require-tar-1.27.patch b/meta/recipes-devtools/dpkg/dpkg/tweak-options-require-tar-1.27.patch
deleted file mode 100644
index ac59dce69e..0000000000
--- a/meta/recipes-devtools/dpkg/dpkg/tweak-options-require-tar-1.27.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 48bcc51ce042d1b779b34fae454c52b15bdd9cae Mon Sep 17 00:00:00 2001
-From: Kai Kang <kai.kang@windriver.com>
-Date: Fri, 22 Feb 2019 01:47:16 -0500
-Subject: [PATCH] dpkg: 1.18.25 -> 1.19.4
-
-GNU tar >= 1.27 is required for --owner=NAME:ID and --group=NAME:ID. And fails
-to build .deb packages with error:
-
-| dpkg-deb: building package 'linux-libc-headers-dbg' in '.../tmp/work/i586-poky-linux/linux-libc-headers/4.19-r0/deploy-debs/i586/linux-libc-headers-dbg_ 4.19-r0.0_i386.deb'.
-| tar: root\:0: Invalid owner
-| tar: Error is not recoverable: exiting now
-| dpkg-deb: error: tar -cf subprocess returned error exit status 2
-
-Tweak tar options in dpkg-deb source code to make it work on old machines.
-
-Upstream-Status: Inappropriate [cross build specific]
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
----
- dpkg-deb/build.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/dpkg-deb/build.c b/dpkg-deb/build.c
-index 8436839..67c0c20 100644
---- a/dpkg-deb/build.c
-+++ b/dpkg-deb/build.c
-@@ -462,7 +462,7 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
-     if (options->mode)
-       command_add_args(&cmd, "--mode", options->mode, NULL);
-     if (options->root_owner_group)
--      command_add_args(&cmd, "--owner", "root:0", "--group", "root:0", NULL);
-+      command_add_args(&cmd, "--owner", "root", "--group", "root", NULL);
-     command_add_args(&cmd, "--null", "--no-unquote", "--no-recursion",
-                            "-T", "-", NULL);
-     command_exec(&cmd);
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.20.0.bb b/meta/recipes-devtools/dpkg/dpkg_1.20.0.bb
index 1e822bbdf5..d539c57522 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.20.0.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.20.0.bb
@@ -15,9 +15,6 @@ SRC_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/${BPN}_${PV}.tar.xz \
            file://pager.patch \
            file://0001-Add-support-for-riscv32-CPU.patch \
            "
-SRC_URI_append_class-native = " \
-                                file://tweak-options-require-tar-1.27.patch \
-"
 
 SRC_URI[md5sum] = "f88f077236a3ff3decae3b25c989893d"
 SRC_URI[sha256sum] = "b633cc2b0e030efb61e11029d8a3fb1123f719864c9992da2e52b471c96d0900"
-- 
2.17.1

