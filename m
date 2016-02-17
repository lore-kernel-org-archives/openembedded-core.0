Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id B4E2560053
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 00:29:06 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3q4g5W5x3Nz3hjZx;
	Wed, 17 Feb 2016 01:29:03 +0100 (CET)
X-Auth-Info: CVY2bCcuG2uOGuZWZ1ut6L85RUDrTR/yZo4+MlhhRi8=
Received: from chi.lan (unknown [195.140.253.167])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3q4g5W38zZzvdWS;
	Wed, 17 Feb 2016 01:29:03 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Feb 2016 01:29:02 +0100
Message-Id: <1455668942-11433-1-git-send-email-marex@denx.de>
X-Mailer: git-send-email 2.1.4
Cc: Marek Vasut <marex@denx.de>
Subject: [PATCH V2] dpkg: Update to 1.18.4
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Feb 2016 00:29:09 -0000

Update dpkg version to 1.18.4 . This adds nios2 architecture support
among other fixes. One patch was updated so it would apply to 1.18.4.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross.burton@intel.com>
---
V2: Drop the CVE fix, since it is part of 1.18.4
---
 ...g-do_package_write_deb-we-have-trees-of-h.patch | 52 +++++++++++++---------
 .../dpkg/dpkg/dpkg-CVE-2015-0860.patch             | 35 ---------------
 .../dpkg/{dpkg_1.18.2.bb => dpkg_1.18.4.bb}        |  5 +--
 3 files changed, 32 insertions(+), 60 deletions(-)
 delete mode 100644 meta/recipes-devtools/dpkg/dpkg/dpkg-CVE-2015-0860.patch
 rename meta/recipes-devtools/dpkg/{dpkg_1.18.2.bb => dpkg_1.18.4.bb} (81%)

diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-When-running-do_package_write_deb-we-have-trees-of-h.patch b/meta/recipes-devtools/dpkg/dpkg/0001-When-running-do_package_write_deb-we-have-trees-of-h.patch
index 6967ef4..49ef853 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0001-When-running-do_package_write_deb-we-have-trees-of-h.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-When-running-do_package_write_deb-we-have-trees-of-h.patch
@@ -1,7 +1,7 @@
-From d14ffd786993da60ca84c4812da8a6594a8c764e Mon Sep 17 00:00:00 2001
+From e391bdba238d1371fc5b67cdae08b06eb5ada5c2 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 26 Aug 2015 15:48:13 +0300
-Subject: [PATCH 1/5] When running do_package_write_deb, we have trees of
+Subject: [PATCH] When running do_package_write_deb, we have trees of
  hardlinked files such as the dbg source files in ${PN}-dbg. If something
  makes another copy of one of those files (or deletes one), the number of
  links a file has changes and tar can notice this, e.g.:
@@ -19,23 +19,43 @@ place to avoid that kind of issue).
 Upstream-Status: Inappropriate
 RP 2015/3/27
 ---
- dpkg-deb/build.c | 11 ++++++++---
- 1 file changed, 8 insertions(+), 3 deletions(-)
+ dpkg-deb/build.c | 12 ++++++++----
+ 1 file changed, 8 insertions(+), 4 deletions(-)
 
 diff --git a/dpkg-deb/build.c b/dpkg-deb/build.c
-index ea3d861..1589927 100644
+index 2ddeec6..af363f0 100644
 --- a/dpkg-deb/build.c
 +++ b/dpkg-deb/build.c
-@@ -458,7 +458,7 @@ do_build(const char *const *argv)
+@@ -452,7 +452,7 @@ static void
+ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
+              struct compress_params *tar_compress_params, int fd_out)
+ {
+-  int pipe_filenames[2], pipe_tarball[2];
++  int pipe_filenames[2], pipe_tarball[2], rc;
+   pid_t pid_tar, pid_comp;
+ 
+   /* Fork off a tar. We will feed it a list of filenames on stdin later. */
+@@ -493,7 +493,9 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
+   /* All done, clean up wait for tar and <compress> to finish their job. */
+   close(pipe_filenames[1]);
+   subproc_reap(pid_comp, _("<compress> from tar -cf"), 0);
+-  subproc_reap(pid_tar, "tar -cf", 0);
++  rc = subproc_reap(pid_tar, "tar -cf", SUBPROC_RETERROR);
++  if (rc && rc != 1)
++    ohshite(_("subprocess %s returned error exit status %d"), "tar -cf", rc);
+ }
+ 
+ /**
+@@ -509,7 +511,7 @@ do_build(const char *const *argv)
    char *debar;
    char *tfbuf;
    int arfd;
--  int p1[2], p2[2], gzfd;
-+  int p1[2], p2[2], gzfd, rc;
+-  int p1[2], gzfd;
++  int p1[2], gzfd, rc;
    pid_t c1, c2;
  
    /* Decode our arguments. */
-@@ -538,7 +538,9 @@ do_build(const char *const *argv)
+@@ -590,7 +592,9 @@ do_build(const char *const *argv)
    }
    close(p1[0]);
    subproc_reap(c2, _("<compress> from tar -cf"), 0);
@@ -46,18 +66,6 @@ index ea3d861..1589927 100644
  
    if (lseek(gzfd, 0, SEEK_SET))
      ohshite(_("failed to rewind temporary file (%s)"), _("control member"));
-@@ -626,7 +628,10 @@ do_build(const char *const *argv)
-   /* All done, clean up wait for tar and <compress> to finish their job. */
-   close(p1[1]);
-   subproc_reap(c2, _("<compress> from tar -cf"), 0);
--  subproc_reap(c1, "tar -cf", 0);
-+  rc = subproc_reap(c1, "tar -cf", SUBPROC_RETERROR);
-+  if (rc && rc != 1)
-+    ohshite(_("subprocess %s returned error exit status %d"), "tar -cf", rc);
-+
-   /* Okay, we have data.tar as well now, add it to the ar wrapper. */
-   if (deb_format.major == 2) {
-     char datamember[16 + 1];
 -- 
-2.1.4
+2.7.0
 
diff --git a/meta/recipes-devtools/dpkg/dpkg/dpkg-CVE-2015-0860.patch b/meta/recipes-devtools/dpkg/dpkg/dpkg-CVE-2015-0860.patch
deleted file mode 100644
index 2fd3c3b..0000000
--- a/meta/recipes-devtools/dpkg/dpkg/dpkg-CVE-2015-0860.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 708e60ea4e16afb1d85da60dd73cb374a987653d Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Hanno=20B=C3=B6ck?= <hanno@hboeck.de>
-Date: Thu, 19 Nov 2015 20:03:10 +0100
-Subject: [PATCH 1/1] dpkg-deb: Fix off-by-one write access on ctrllenbuf
- variable
-
-This affects old format .deb packages.
-
-CVE: CVE-2015-0860
-Warned-by: afl
-Signed-off-by: Guillem Jover <guillem@debian.org>
-
-Upstream-Status: Backport
-
-Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
----
- dpkg-deb/extract.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/dpkg-deb/extract.c b/dpkg-deb/extract.c
-index 5a9587a..e39fb35 100644
---- a/dpkg-deb/extract.c
-+++ b/dpkg-deb/extract.c
-@@ -247,7 +247,7 @@ extracthalf(const char *debar, const char *dir,
-     if (errstr)
-       ohshit(_("archive has invalid format version: %s"), errstr);
- 
--    r = read_line(arfd, ctrllenbuf, 1, sizeof(ctrllenbuf));
-+    r = read_line(arfd, ctrllenbuf, 1, sizeof(ctrllenbuf) - 1);
-     if (r < 0)
-       read_fail(r, debar, _("archive control member size"));
-     if (sscanf(ctrllenbuf, "%jd%c%d", &ctrllennum, &nlc, &dummy) != 2 ||
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.18.2.bb b/meta/recipes-devtools/dpkg/dpkg_1.18.4.bb
similarity index 81%
rename from meta/recipes-devtools/dpkg/dpkg_1.18.2.bb
rename to meta/recipes-devtools/dpkg/dpkg_1.18.4.bb
index eab896c..7876944 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.18.2.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.18.4.bb
@@ -13,9 +13,8 @@ SRC_URI += "file://noman.patch \
 	    file://0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch \
 	    file://0005-dpkg-compiler.m4-remove-Wvla.patch \
 	    file://0006-add-musleabi-to-known-target-tripets.patch \
-	    file://dpkg-CVE-2015-0860.patch \
            "
 
-SRC_URI[md5sum] = "63b9d869081ec49adeef6c5ff62d6576"
-SRC_URI[sha256sum] = "11484f2a73d027d696e720a60380db71978bb5c06cd88fe30c291e069ac457a4"
+SRC_URI[md5sum] = "e95b513c89693f6ec3ab53b6b1c3defd"
+SRC_URI[sha256sum] = "fe89243868888ce715bf45861f26264f767d4e4dbd0d6f1a26ce60bbbbf106da"
 
-- 
2.1.4


