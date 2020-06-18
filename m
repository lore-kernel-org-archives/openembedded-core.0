Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.236.1592452451755892326
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2020 20:54:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=DRootqGj;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 2092A20B4781; Wed, 17 Jun 2020 20:54:11 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 2092A20B4781
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1592452451;
	bh=sav6+Lq99639L0UAIUORIVeTq4s2hlg+Px7QxWDUdns=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=DRootqGjEng4vj8xIeRaxDqTH5xaaN9ptLQTRQtJr4yj9ft/yoIjyKZQZHK8eZAgc
	 z3DlFGoTY9caCFw1SejHxxyH3JhfTTnDeuIwg5AJRXnVFb35AWKjLcq+GMjSHZlG17
	 aO1AjR0+VDQGZdTVHd6opdN+3dswpwwo0haHBEC0=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] dpkg-native: rebase and reinstate fix for "tar: file changed as we read it"
Date: Wed, 17 Jun 2020 20:54:02 -0700
Message-Id: <ab0ed1a865ae19a4835874993f61c7840ffff912.1592452323.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1592452323.git.paul.eggleton@linux.microsoft.com>
References: <cover.1592452323.git.paul.eggleton@linux.microsoft.com>

In OE-Core rev 8ee36a5f2f9367550d28bf271afc53bca6ff3d5f a patch was
added for dpkg to ignore a return of 1 from dpkg's calls to tar (which
indicates that files changed in some way while tar was operating) we
were observing failures on the autobuilder due to changes to link counts
in hard-linked file trees. The patch was subsequently rebased and then
later removed during an upgrade in
3812f58b3a438ae533c282170416cdd1681868e0 on the assumption that the fix
had been applied upstream, however that was not the case. I am now
occasionally seeing these errors in my builds without any apparent
material change to the files, so rebase and reinstate the patch.

Fixes [YOCTO #13913].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.microsoft.com>
---
 ...01-build.c-ignore-return-of-1-from-tar-cf.patch | 52 ++++++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.20.0.bb          |  2 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch

diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch b/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch
new file mode 100644
index 0000000..6c5a91d
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch
@@ -0,0 +1,52 @@
+From 450fece894fce750502be8accabfd88c585bda4c Mon Sep 17 00:00:00 2001
+From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
+Date: Tue, 16 Jun 2020 03:57:25 +0000
+Subject: [PATCH] build.c: ignore return of 1 from tar -cf
+
+When running do_package_write_deb, we have trees of hardlinked files
+such as the dbg source files in ${PN}-dbg. If something makes another
+copy of one of those files (or deletes one), the number of links a file
+has changes and tar can notice this, e.g.:
+
+| DEBUG: Executing python function do_package_deb
+| dpkg-deb: building package `sed-ptest' in `/media/build1/poky/build/tmp/work/i586-poky-linux/sed/4.2.2-r0/deploy-debs/i586/sed-ptest_4.2.2-r0.3_i386.deb'.
+| tar: ./usr/lib/sed/ptest/testsuite/tst-regex2: file changed as we read it
+| dpkg-deb: error: subprocess tar -cf returned error exit status 1
+
+Tar returns an error of 1 when files 'change' and other errors codes
+in other error cases. We tweak dpkg-deb here so that it ignores an exit
+code of 1 from tar. The files don't really change (and we have locking in
+place to avoid that kind of issue).
+
+Upsteam-Status: Inappropriate
+
+Original patch by RP 2015/3/27, rebased by Paul Eggleton
+
+Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
+---
+ dpkg-deb/build.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/dpkg-deb/build.c b/dpkg-deb/build.c
+index a3d1912..1de7f9c 100644
+--- a/dpkg-deb/build.c
++++ b/dpkg-deb/build.c
+@@ -427,6 +427,7 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
+ {
+   int pipe_filenames[2], pipe_tarball[2];
+   pid_t pid_tar, pid_comp;
++  int rc;
+ 
+   /* Fork off a tar. We will feed it a list of filenames on stdin later. */
+   m_pipe(pipe_filenames);
+@@ -477,7 +478,9 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
+   /* All done, clean up wait for tar and <compress> to finish their job. */
+   close(pipe_filenames[1]);
+   subproc_reap(pid_comp, _("<compress> from tar -cf"), 0);
+-  subproc_reap(pid_tar, "tar -cf", 0);
++  rc = subproc_reap(pid_tar, "tar -cf", SUBPROC_RETERROR);
++  if (rc && rc != 1)
++    ohshite(_("subprocess %s returned error exit status %d"), "tar -cf", rc);
+ }
+ 
+ static time_t
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.20.0.bb b/meta/recipes-devtools/dpkg/dpkg_1.20.0.bb
index d539c57..c98a9e5 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.20.0.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.20.0.bb
@@ -16,5 +16,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/${BPN}_${PV}.tar.xz \
            file://0001-Add-support-for-riscv32-CPU.patch \
            "
 
+SRC_URI_append_class-native = " file://0001-build.c-ignore-return-of-1-from-tar-cf.patch"
+
 SRC_URI[md5sum] = "f88f077236a3ff3decae3b25c989893d"
 SRC_URI[sha256sum] = "b633cc2b0e030efb61e11029d8a3fb1123f719864c9992da2e52b471c96d0900"
-- 
1.8.3.1

