Return-Path: <Li.Zhou@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 96E1D6E268
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 07:36:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3O7aq9N019280
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 00:36:52 -0700 (PDT)
Received: from pek-lzhou2-d1.corp.ad.wrs.com (128.224.162.243) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Fri, 24 Apr 2015 00:36:51 -0700
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Apr 2015 15:36:36 +0800
Message-ID: <1429860996-13152-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [128.224.162.243]
Subject: [PATCH] libarchive: Security Advisory - libarchive - CVE-2015-2304
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
X-List-Received-Date: Fri, 24 Apr 2015 07:36:51 -0000
Content-Type: text/plain

libarchive: Updated libarchive packages fix security vulnerability

Alexander Cherepanov discovered that bsdcpio, an implementation of the "cpio"
program part of the libarchive project, is susceptible to a directory
traversal vulnerability via absolute paths.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 ...IVE_EXTRACT_SECURE_NOABSOLUTEPATHS-option.patch |  151 ++++++++++++++++++++
 .../libarchive/libarchive_3.1.2.bb                 |    1 +
 2 files changed, 152 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-Add-ARCHIVE_EXTRACT_SECURE_NOABSOLUTEPATHS-option.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/0001-Add-ARCHIVE_EXTRACT_SECURE_NOABSOLUTEPATHS-option.patch b/meta/recipes-extended/libarchive/libarchive/0001-Add-ARCHIVE_EXTRACT_SECURE_NOABSOLUTEPATHS-option.patch
new file mode 100644
index 0000000..4ca779c
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/0001-Add-ARCHIVE_EXTRACT_SECURE_NOABSOLUTEPATHS-option.patch
@@ -0,0 +1,151 @@
+From 59357157706d47c365b2227739e17daba3607526 Mon Sep 17 00:00:00 2001
+From: Alessandro Ghedini <alessandro@ghedini.me>
+Date: Sun, 1 Mar 2015 12:07:45 +0100
+Subject: [PATCH] Add ARCHIVE_EXTRACT_SECURE_NOABSOLUTEPATHS option
+
+This fixes a directory traversal in the cpio tool.
+
+
+Upstream-Status: backport
+
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ cpio/bsdcpio.1                           |    3 ++-
+ cpio/cpio.c                              |    2 ++
+ libarchive/archive.h                     |    2 ++
+ libarchive/archive_write_disk.3          |    3 +++
+ libarchive/archive_write_disk_posix.c    |   14 +++++++++++---
+ libarchive/test/test_write_disk_secure.c |   23 +++++++++++++++++++++++
+ 6 files changed, 43 insertions(+), 4 deletions(-)
+
+diff --git a/cpio/bsdcpio.1 b/cpio/bsdcpio.1
+index f966aa0..e52546e 100644
+--- a/cpio/bsdcpio.1
++++ b/cpio/bsdcpio.1
+@@ -156,7 +156,8 @@ See above for description.
+ .It Fl Fl insecure
+ (i and p mode only)
+ Disable security checks during extraction or copying.
+-This allows extraction via symbolic links and path names containing
++This allows extraction via symbolic links, absolute paths,
++and path names containing
+ .Sq ..
+ in the name.
+ .It Fl J , Fl Fl xz
+diff --git a/cpio/cpio.c b/cpio/cpio.c
+index 0acde11..b267e9b 100644
+--- a/cpio/cpio.c
++++ b/cpio/cpio.c
+@@ -171,6 +171,7 @@ main(int argc, char *argv[])
+ 	cpio->extract_flags |= ARCHIVE_EXTRACT_NO_OVERWRITE_NEWER;
+ 	cpio->extract_flags |= ARCHIVE_EXTRACT_SECURE_SYMLINKS;
+ 	cpio->extract_flags |= ARCHIVE_EXTRACT_SECURE_NODOTDOT;
++	cpio->extract_flags |= ARCHIVE_EXTRACT_SECURE_NOABSOLUTEPATHS;
+ 	cpio->extract_flags |= ARCHIVE_EXTRACT_PERM;
+ 	cpio->extract_flags |= ARCHIVE_EXTRACT_FFLAGS;
+ 	cpio->extract_flags |= ARCHIVE_EXTRACT_ACL;
+@@ -256,6 +257,7 @@ main(int argc, char *argv[])
+ 		case OPTION_INSECURE:
+ 			cpio->extract_flags &= ~ARCHIVE_EXTRACT_SECURE_SYMLINKS;
+ 			cpio->extract_flags &= ~ARCHIVE_EXTRACT_SECURE_NODOTDOT;
++			cpio->extract_flags &= ~ARCHIVE_EXTRACT_SECURE_NOABSOLUTEPATHS;
+ 			break;
+ 		case 'L': /* GNU cpio */
+ 			cpio->option_follow_links = 1;
+diff --git a/libarchive/archive.h b/libarchive/archive.h
+index 1f0fc38..ef635ac 100644
+--- a/libarchive/archive.h
++++ b/libarchive/archive.h
+@@ -649,6 +649,8 @@ __LA_DECL int archive_read_set_passphrase_callback(struct archive *,
+ /* Default: Do not use HFS+ compression if it was not compressed. */
+ /* This has no effect except on Mac OS v10.6 or later. */
+ #define	ARCHIVE_EXTRACT_HFS_COMPRESSION_FORCED	(0x8000)
++/* Default: Do not reject entries with absolute paths */
++#define ARCHIVE_EXTRACT_SECURE_NOABSOLUTEPATHS (0x10000)
+ 
+ __LA_DECL int archive_read_extract(struct archive *, struct archive_entry *,
+ 		     int flags);
+diff --git a/libarchive/archive_write_disk.3 b/libarchive/archive_write_disk.3
+index fa925cc..a2e7afa 100644
+--- a/libarchive/archive_write_disk.3
++++ b/libarchive/archive_write_disk.3
+@@ -177,6 +177,9 @@ The default is to not refuse such paths.
+ Note that paths ending in
+ .Pa ..
+ always cause an error, regardless of this flag.
++.It Cm ARCHIVE_EXTRACT_SECURE_NOABSOLUTEPATHS
++Refuse to extract an absolute path.
++The default is to not refuse such paths.
+ .It Cm ARCHIVE_EXTRACT_SPARSE
+ Scan data for blocks of NUL bytes and try to recreate them with holes.
+ This results in sparse files, independent of whether the archive format
+diff --git a/libarchive/archive_write_disk_posix.c b/libarchive/archive_write_disk_posix.c
+index ab3bdac..c1290eb 100644
+--- a/libarchive/archive_write_disk_posix.c
++++ b/libarchive/archive_write_disk_posix.c
+@@ -2509,8 +2509,9 @@ cleanup_pathname_win(struct archive_write_disk *a)
+ /*
+  * Canonicalize the pathname.  In particular, this strips duplicate
+  * '/' characters, '.' elements, and trailing '/'.  It also raises an
+- * error for an empty path, a trailing '..' or (if _SECURE_NODOTDOT is
+- * set) any '..' in the path.
++ * error for an empty path, a trailing '..', (if _SECURE_NODOTDOT is
++ * set) any '..' in the path or (if ARCHIVE_EXTRACT_SECURE_NOABSOLUTEPATHS
++ * is set) if the path is absolute.
+  */
+ static int
+ cleanup_pathname(struct archive_write_disk *a)
+@@ -2529,8 +2530,15 @@ cleanup_pathname(struct archive_write_disk *a)
+ 	cleanup_pathname_win(a);
+ #endif
+ 	/* Skip leading '/'. */
+-	if (*src == '/')
++	if (*src == '/') {
++		if (a->flags & ARCHIVE_EXTRACT_SECURE_NOABSOLUTEPATHS) {
++			archive_set_error(&a->archive, ARCHIVE_ERRNO_MISC,
++			                  "Path is absolute");
++			return (ARCHIVE_FAILED);
++		}
++
+ 		separator = *src++;
++	}
+ 
+ 	/* Scan the pathname one element at a time. */
+ 	for (;;) {
+diff --git a/libarchive/test/test_write_disk_secure.c b/libarchive/test/test_write_disk_secure.c
+index 31c5bfd..2c94206 100644
+--- a/libarchive/test/test_write_disk_secure.c
++++ b/libarchive/test/test_write_disk_secure.c
+@@ -178,6 +178,29 @@ DEFINE_TEST(test_write_disk_secure)
+ 	assert(S_ISDIR(st.st_mode));
+ 	archive_entry_free(ae);
+ 
++	/*
++	 * Without security checks, we should be able to
++	 * extract an absolute path.
++	 */
++	assert((ae = archive_entry_new()) != NULL);
++	archive_entry_copy_pathname(ae, "/tmp/libarchive_test-test_write_disk_secure-absolute_path.tmp");
++	archive_entry_set_mode(ae, S_IFREG | 0777);
++	assert(0 == archive_write_header(a, ae));
++	assert(0 == archive_write_finish_entry(a));
++	assertFileExists("/tmp/libarchive_test-test_write_disk_secure-absolute_path.tmp");
++	assert(0 == unlink("/tmp/libarchive_test-test_write_disk_secure-absolute_path.tmp"));
++
++	/* But with security checks enabled, this should fail. */
++	assert(archive_entry_clear(ae) != NULL);
++	archive_entry_copy_pathname(ae, "/tmp/libarchive_test-test_write_disk_secure-absolute_path.tmp");
++	archive_entry_set_mode(ae, S_IFREG | 0777);
++	archive_write_disk_set_options(a, ARCHIVE_EXTRACT_SECURE_NOABSOLUTEPATHS);
++	failure("Extracting an absolute path should fail here.");
++	assertEqualInt(ARCHIVE_FAILED, archive_write_header(a, ae));
++	archive_entry_free(ae);
++	assert(0 == archive_write_finish_entry(a));
++	assertFileNotExists("/tmp/libarchive_test-test_write_disk_secure-absolute_path.tmp");
++
+ 	assertEqualInt(ARCHIVE_OK, archive_write_free(a));
+ 
+ 	/* Test the entries on disk. */
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
index 96e2d50..75008c3 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
@@ -32,6 +32,7 @@ PACKAGECONFIG[nettle] = "--with-nettle,--without-nettle,nettle,"
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://libarchive-CVE-2013-0211.patch \
            file://pkgconfig.patch \
+           file://0001-Add-ARCHIVE_EXTRACT_SECURE_NOABSOLUTEPATHS-option.patch \
            "
 
 SRC_URI[md5sum] = "efad5a503f66329bb9d2f4308b5de98a"
-- 
1.7.9.5


