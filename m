Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id B319F7CE82
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Mar 2019 20:12:07 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id d17so2820695wre.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Mar 2019 13:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7tHfnCVdQaqns0tE6tnH5C4epIAOtSUv2M7W8PgRADY=;
	b=jgcSSGYqnZHNKUc0y62GDaV3kh8F8rj2BBK9dvXfpPcHAdtEuAsr1U8ZLu6QaqBu5r
	aQj5hqWWqgBi+mtTWH4NXY8FOukWGaClde7lHWfkpaYPHfhScUZ/Zuhmf1k8ciqbeLfR
	Or2xdunwmiNfaAhoXv2Xk4HPhM4VBZLxBjfn1plxDmW10Q4uY9iRk+wOakB4OfPoxgr7
	iiPjyo1jkZaVHJe0ng8+fRa1+LLj0L8bXWXxrG6ru3LE8/vosBtPBp7dFgYNTldHDy7U
	iMzDsCsIHOsYOq3LyHk7bbyWESUnrO4zxWIHy/fG5g85hbSn+s57UN9j4/qHFEmbQGiT
	KwWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7tHfnCVdQaqns0tE6tnH5C4epIAOtSUv2M7W8PgRADY=;
	b=WSitlVTcw5pFN8z7HIluY0t6DBGFvX0MLa7SNMxEgeJ3JeaD9vLJiG8Hi7VJoTU/hA
	V7L2ECY0tyto2H9hpmKwSNDSQ7eRfNOwZbF+M6qTWtH4KY63QOID/BeQ1WTSKoi+k3ZJ
	GgR0492eIpReXpmRWYwE0iFVdyiKdWFVDMo5NZCVuhuJDhHaj7EvOOdiVO3gS76v7n5q
	GWdgSzTlqJ3+bjIuGoPlMyS4FF/4DK4ziMMYRXffGaKBjofJUnActYOWUkvC/Lp4/Tw4
	345axvXhlcFCtlf3MVaa8dJUxD2vziyQsTBnHzRFVQlchMLYa6VOhSWcSf7jq4+gqBsl
	iheg==
X-Gm-Message-State: APjAAAUqkX+fDdIR0ot7VtddOidS71TMDqw2EbDR/DuGAV6ie/MplLwv
	5wmvONQYY21fzW32cdsaOg2ZQxMk
X-Google-Smtp-Source: APXvYqwusbyUq4vuCeaKysZknlVI7cLRWuqHpf/uAkz/apJ5xGWflOjhD1qFT1ietZZbnDl1fVLqcQ==
X-Received: by 2002:adf:f4c8:: with SMTP id h8mr19259853wrp.6.1552248727870;
	Sun, 10 Mar 2019 13:12:07 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	o12sm13324088wre.0.2019.03.10.13.12.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Mar 2019 13:12:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 10 Mar 2019 20:12:01 +0000
Message-Id: <20190310201201.3345-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [sumo][PATCH] busybox: backport fix for issues introduced by CVE-2011-5325.patch
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
X-List-Received-Date: Sun, 10 Mar 2019 20:12:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../busybox/busybox/CVE-2011-5325-fix.patch   | 393 ++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.27.2.bb   |   1 +
 2 files changed, 394 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2011-5325-fix.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2011-5325-fix.patch b/meta/recipes-core/busybox/busybox/CVE-2011-5325-fix.patch
new file mode 100644
index 0000000000..a8d7e4bd50
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2011-5325-fix.patch
@@ -0,0 +1,393 @@
+From 3e1e224fd031ae3927acda70f6e1fa55193e5b68 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Tue, 20 Feb 2018 15:57:45 +0100
+Subject: [PATCH] tar,unzip: postpone creation of symlinks with "suspicious"
+ targets
+
+This mostly reverts commit bc9bbeb2b81001e8731cd2ae501c8fccc8d87cc7
+"libarchive: do not extract unsafe symlinks unless $EXTRACT_UNSAFE_SYMLINKS=1"
+
+Users report that it is somewhat too restrictive. See
+https://bugs.busybox.net/show_bug.cgi?id=8411
+
+In particular, this interferes with unpacking of busybox-based
+filesystems with links like "sbin/applet" -> "../bin/busybox".
+
+The change is made smaller by deleting ARCHIVE_EXTRACT_QUIET flag -
+it is unused since 2010, and removing conditionals on it
+allows commonalizing some error message codes.
+
+function                                             old     new   delta
+create_or_remember_symlink                             -      94     +94
+create_symlinks_from_list                              -      64     +64
+tar_main                                            1002    1006      +4
+unzip_main                                          2732    2724      -8
+data_extract_all                                     984     891     -93
+unsafe_symlink_target                                147       -    -147
+------------------------------------------------------------------------------
+(add/remove: 2/1 grow/shrink: 1/2 up/down: 162/-248)          Total: -86 bytes
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+Upstream-Status: Backport from 1.28.2 [https://git.busybox.net/busybox/commit/?h=1_28_stable&id=37277a23fe48b13313f5d96084d890ed21d5fd8b]
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ archival/libarchive/data_extract_all.c      | 50 +++++++++-------
+ archival/libarchive/unsafe_symlink_target.c | 63 +++++++++------------
+ archival/tar.c                              |  2 +
+ archival/unzip.c                            | 29 ++++++----
+ include/bb_archive.h                        | 23 +++++---
+ testsuite/tar.tests                         | 10 ++--
+ 6 files changed, 95 insertions(+), 82 deletions(-)
+
+diff --git a/archival/libarchive/data_extract_all.c b/archival/libarchive/data_extract_all.c
+index b828b656d..dad8d7d87 100644
+--- a/archival/libarchive/data_extract_all.c
++++ b/archival/libarchive/data_extract_all.c
+@@ -108,9 +108,7 @@ void FAST_FUNC data_extract_all(archive_handle_t *archive_handle)
+ 			}
+ 		}
+ 		else if (existing_sb.st_mtime >= file_header->mtime) {
+-			if (!(archive_handle->ah_flags & ARCHIVE_EXTRACT_QUIET)
+-			 && !S_ISDIR(file_header->mode)
+-			) {
++			if (!S_ISDIR(file_header->mode)) {
+ 				bb_error_msg("%s not created: newer or "
+ 					"same age file exists", dst_name);
+ 			}
+@@ -126,7 +124,7 @@ void FAST_FUNC data_extract_all(archive_handle_t *archive_handle)
+ 	/* Handle hard links separately */
+ 	if (hard_link) {
+ 		res = link(hard_link, dst_name);
+-		if (res != 0 && !(archive_handle->ah_flags & ARCHIVE_EXTRACT_QUIET)) {
++		if (res != 0) {
+ 			/* shared message */
+ 			bb_perror_msg("can't create %slink '%s' to '%s'",
+ 					 "hard", dst_name, hard_link
+@@ -166,10 +164,9 @@ void FAST_FUNC data_extract_all(archive_handle_t *archive_handle)
+ 	}
+ 	case S_IFDIR:
+ 		res = mkdir(dst_name, file_header->mode);
+-		if ((res == -1)
++		if ((res != 0)
+ 		 && (errno != EISDIR) /* btw, Linux doesn't return this */
+ 		 && (errno != EEXIST)
+-		 && !(archive_handle->ah_flags & ARCHIVE_EXTRACT_QUIET)
+ 		) {
+ 			bb_perror_msg("can't make dir %s", dst_name);
+ 		}
+@@ -177,27 +174,38 @@ void FAST_FUNC data_extract_all(archive_handle_t *archive_handle)
+ 	case S_IFLNK:
+ 		/* Symlink */
+ //TODO: what if file_header->link_target == NULL (say, corrupted tarball?)
+-		if (!unsafe_symlink_target(file_header->link_target)) {
+-			res = symlink(file_header->link_target, dst_name);
+-			if (res != 0
+-				&& !(archive_handle->ah_flags & ARCHIVE_EXTRACT_QUIET)
+-			) {
+-						/* shared message */
+-						bb_perror_msg("can't create %slink '%s' to '%s'",
+-							"sym",
+-							dst_name, file_header->link_target
+-						);
+-			}
+-		}
++
++		/* To avoid a directory traversal attack via symlinks,
++		 * do not restore symlinks with ".." components
++		 * or symlinks starting with "/", unless a magic
++		 * envvar is set.
++		 *
++		 * For example, consider a .tar created via:
++		 *  $ tar cvf bug.tar anything.txt
++		 *  $ ln -s /tmp symlink
++		 *  $ tar --append -f bug.tar symlink
++		 *  $ rm symlink
++		 *  $ mkdir symlink
++		 *  $ tar --append -f bug.tar symlink/evil.py
++		 *
++		 * This will result in an archive that contains:
++		 *  $ tar --list -f bug.tar
++		 *  anything.txt
++		 *  symlink [-> /tmp]
++		 *  symlink/evil.py
++		 *
++		 * Untarring bug.tar would otherwise place evil.py in '/tmp'.
++		 */
++		create_or_remember_symlink(&archive_handle->symlink_placeholders,
++				file_header->link_target,
++				dst_name);
+ 		break;
+ 	case S_IFSOCK:
+ 	case S_IFBLK:
+ 	case S_IFCHR:
+ 	case S_IFIFO:
+ 		res = mknod(dst_name, file_header->mode, file_header->device);
+-		if ((res == -1)
+-		 && !(archive_handle->ah_flags & ARCHIVE_EXTRACT_QUIET)
+-		) {
++		if (res != 0) {
+ 			bb_perror_msg("can't create node %s", dst_name);
+ 		}
+ 		break;
+diff --git a/archival/libarchive/unsafe_symlink_target.c b/archival/libarchive/unsafe_symlink_target.c
+index ee46e28f8..8dcafeaa1 100644
+--- a/archival/libarchive/unsafe_symlink_target.c
++++ b/archival/libarchive/unsafe_symlink_target.c
+@@ -5,44 +5,37 @@
+ #include "libbb.h"
+ #include "bb_archive.h"
+ 
+-int FAST_FUNC unsafe_symlink_target(const char *target)
++void FAST_FUNC create_or_remember_symlink(llist_t **symlink_placeholders,
++		const char *target,
++		const char *linkname)
+ {
+-	const char *dot;
+-
+-	if (target[0] == '/') {
+-		const char *var;
+-unsafe:
+-		var = getenv("EXTRACT_UNSAFE_SYMLINKS");
+-		if (var) {
+-			if (LONE_CHAR(var, '1'))
+-				return 0; /* pretend it's safe */
+-			return 1; /* "UNSAFE!" */
+-		}
+-		bb_error_msg("skipping unsafe symlink to '%s' in archive,"
+-			" set %s=1 to extract",
+-			target,
+-			"EXTRACT_UNSAFE_SYMLINKS"
++	if (target[0] == '/' || strstr(target, "..")) {
++		llist_add_to(symlink_placeholders,
++			xasprintf("%s%c%s", linkname, '\0', target)
++		);
++		return;
++	}
++	if (symlink(target, linkname) != 0) {
++		/* shared message */
++		bb_perror_msg_and_die("can't create %slink '%s' to '%s'",
++			"sym", linkname, target
+ 		);
+-		/* Prevent further messages */
+-		setenv("EXTRACT_UNSAFE_SYMLINKS", "0", 0);
+-		return 1; /* "UNSAFE!" */
+ 	}
++}
+ 
+-	dot = target;
+-	for (;;) {
+-		dot = strchr(dot, '.');
+-			if (!dot)
+-				return 0; /* safe target */
++void FAST_FUNC create_symlinks_from_list(llist_t *list)
++{
++	while (list) {
++		char *target;
+ 
+-			/* Is it a path component starting with ".."? */
+-			if ((dot[1] == '.')
+-				&& (dot == target || dot[-1] == '/')
+-					/* Is it exactly ".."? */
+-				&& (dot[2] == '/' || dot[2] == '\0')
+-			) {
+-				goto unsafe;
+-			}
+-			/* NB: it can even be trailing ".", should only add 1 */
+-			dot += 1;
++		target = list->data + strlen(list->data) + 1;
++		if (symlink(target, list->data)) {
++			/* shared message */
++			bb_error_msg_and_die("can't create %slink '%s' to '%s'",
++				"sym",
++				list->data, target
++			);
++		}
++		list = list->link;
+ 	}
+-}
+\ No newline at end of file
++}
+diff --git a/archival/tar.c b/archival/tar.c
+index 7598b71e3..bde86330c 100644
+--- a/archival/tar.c
++++ b/archival/tar.c
+@@ -1252,6 +1252,8 @@ int tar_main(int argc UNUSED_PARAM, char **argv)
+ 	while (get_header_tar(tar_handle) == EXIT_SUCCESS)
+ 		bb_got_signal = EXIT_SUCCESS; /* saw at least one header, good */
+ 
++	create_symlinks_from_list(tar_handle->symlink_placeholders);
++
+ 	/* Check that every file that should have been extracted was */
+ 	while (tar_handle->accept) {
+ 		if (!find_list_entry(tar_handle->reject, tar_handle->accept->data)
+diff --git a/archival/unzip.c b/archival/unzip.c
+index 270e261b7..2f53ab7a4 100644
+--- a/archival/unzip.c
++++ b/archival/unzip.c
+@@ -335,7 +335,10 @@ static void unzip_create_leading_dirs(const char *fn)
+ 	free(name);
+ }
+ 
+-static void unzip_extract_symlink(zip_header_t *zip, const char *dst_fn)
++#if ENABLE_FEATURE_UNZIP_CDF
++static void unzip_extract_symlink(llist_t **symlink_placeholders,
++		zip_header_t *zip,
++		const char *dst_fn)
+ {
+ 	char *target;
+ 
+@@ -361,17 +364,12 @@ static void unzip_extract_symlink(zip_header_t *zip, const char *dst_fn)
+ 		target[xstate.mem_output_size] = '\0';
+ #endif
+ 	}
+-	if (!unsafe_symlink_target(target)) {
+-//TODO: libbb candidate
+-		if (symlink(target, dst_fn)) {
+-			/* shared message */
+-			bb_perror_msg_and_die("can't create %slink '%s' to '%s'",
+-				"sym", dst_fn, target
+-			);
+-		}
+-	}
++	create_or_remember_symlink(symlink_placeholders,
++			target,
++			dst_fn);
+ 	free(target);
+ }
++#endif
+ 
+ static void unzip_extract(zip_header_t *zip, int dst_fd)
+ {
+@@ -464,6 +462,9 @@ int unzip_main(int argc, char **argv)
+ 	llist_t *zaccept = NULL;
+ 	llist_t *zreject = NULL;
+ 	char *base_dir = NULL;
++#if ENABLE_FEATURE_UNZIP_CDF
++	llist_t *symlink_placeholders = NULL;
++#endif
+ 	int i, opt;
+ 	char key_buf[80]; /* must match size used by my_fgets80 */
+ 	struct stat stat_buf;
+@@ -894,8 +895,8 @@ int unzip_main(int argc, char **argv)
+ 			}
+ #if ENABLE_FEATURE_UNZIP_CDF
+ 			if (S_ISLNK(file_mode)) {
+-				if (dst_fd != STDOUT_FILENO) /* no -p */
+-					unzip_extract_symlink(&zip, dst_fn);
++				if (dst_fd != STDOUT_FILENO) /* not -p? */
++					unzip_extract_symlink(&symlink_placeholders, &zip, dst_fn);
+ 			} else
+ #endif
+ 			{
+@@ -931,6 +932,10 @@ int unzip_main(int argc, char **argv)
+ 		total_entries++;
+ 	}
+ 
++#if ENABLE_FEATURE_UNZIP_CDF
++	create_symlinks_from_list(symlink_placeholders);
++#endif
++
+ 	if (listing && quiet <= 1) {
+ 		if (!verbose) {
+ 			//	"  Length      Date    Time    Name\n"
+diff --git a/include/bb_archive.h b/include/bb_archive.h
+index 1e4da3c33..436eb0fe3 100644
+--- a/include/bb_archive.h
++++ b/include/bb_archive.h
+@@ -64,6 +64,9 @@ typedef struct archive_handle_t {
+ 	/* Currently processed file's header */
+ 	file_header_t *file_header;
+ 
++	/* List of symlink placeholders */
++	llist_t *symlink_placeholders;
++
+ 	/* Process the header component, e.g. tar -t */
+ 	void FAST_FUNC (*action_header)(const file_header_t *);
+ 
+@@ -119,15 +122,14 @@ typedef struct archive_handle_t {
+ #define ARCHIVE_RESTORE_DATE        (1 << 0)
+ #define ARCHIVE_CREATE_LEADING_DIRS (1 << 1)
+ #define ARCHIVE_UNLINK_OLD          (1 << 2)
+-#define ARCHIVE_EXTRACT_QUIET       (1 << 3)
+-#define ARCHIVE_EXTRACT_NEWER       (1 << 4)
+-#define ARCHIVE_DONT_RESTORE_OWNER  (1 << 5)
+-#define ARCHIVE_DONT_RESTORE_PERM   (1 << 6)
+-#define ARCHIVE_NUMERIC_OWNER       (1 << 7)
+-#define ARCHIVE_O_TRUNC             (1 << 8)
+-#define ARCHIVE_REMEMBER_NAMES      (1 << 9)
++#define ARCHIVE_EXTRACT_NEWER       (1 << 3)
++#define ARCHIVE_DONT_RESTORE_OWNER  (1 << 4)
++#define ARCHIVE_DONT_RESTORE_PERM   (1 << 5)
++#define ARCHIVE_NUMERIC_OWNER       (1 << 6)
++#define ARCHIVE_O_TRUNC             (1 << 7)
++#define ARCHIVE_REMEMBER_NAMES      (1 << 8)
+ #if ENABLE_RPM
+-#define ARCHIVE_REPLACE_VIA_RENAME  (1 << 10)
++#define ARCHIVE_REPLACE_VIA_RENAME  (1 << 9)
+ #endif
+ 
+ 
+@@ -196,7 +198,10 @@ void seek_by_jump(int fd, off_t amount) FAST_FUNC;
+ void seek_by_read(int fd, off_t amount) FAST_FUNC;
+ 
+ const char *strip_unsafe_prefix(const char *str) FAST_FUNC;
+-int unsafe_symlink_target(const char *target) FAST_FUNC;
++void create_or_remember_symlink(llist_t **symlink_placeholders,
++		const char *target,
++		const char *linkname) FAST_FUNC;
++void create_symlinks_from_list(llist_t *list) FAST_FUNC;
+ 
+ void data_align(archive_handle_t *archive_handle, unsigned boundary) FAST_FUNC;
+ const llist_t *find_list_entry(const llist_t *list, const char *filename) FAST_FUNC;
+diff --git a/testsuite/tar.tests b/testsuite/tar.tests
+index 127eeaaee..21cef49fe 100755
+--- a/testsuite/tar.tests
++++ b/testsuite/tar.tests
+@@ -279,7 +279,7 @@ optional UUDECODE FEATURE_TAR_AUTODETECT FEATURE_SEAMLESS_BZ2
+ testing "tar does not extract into symlinks" "\
+ >>/tmp/passwd && uudecode -o input && tar xf input 2>&1 && rm passwd; cat /tmp/passwd; echo \$?
+ " "\
+-tar: skipping unsafe symlink to '/tmp/passwd' in archive, set EXTRACT_UNSAFE_SYMLINKS=1 to extract
++tar: can't create symlink 'passwd' to '/tmp/passwd'
+ 0
+ " \
+ "" "\
+@@ -299,7 +299,7 @@ optional UUDECODE FEATURE_TAR_AUTODETECT FEATURE_SEAMLESS_BZ2
+ testing "tar -k does not extract into symlinks" "\
+ >>/tmp/passwd && uudecode -o input && tar xf input -k 2>&1 && rm passwd; cat /tmp/passwd; echo \$?
+ " "\
+-tar: skipping unsafe symlink to '/tmp/passwd' in archive, set EXTRACT_UNSAFE_SYMLINKS=1 to extract
++tar: can't create symlink 'passwd' to '/tmp/passwd'
+ 0
+ " \
+ "" "\
+@@ -324,11 +324,11 @@ rm -rf etc usr
+ ' "\
+ etc/ssl/certs/3b2716e5.0
+ etc/ssl/certs/EBG_Elektronik_Sertifika_Hizmet_Sağlayıcısı.pem
+-tar: skipping unsafe symlink to '/usr/share/ca-certificates/mozilla/EBG_Elektronik_Sertifika_Hizmet_Sağlayıcısı.crt' in archive, set EXTRACT_UNSAFE_SYMLINKS=1 to extract
+ etc/ssl/certs/f80cc7f6.0
+ usr/share/ca-certificates/mozilla/EBG_Elektronik_Sertifika_Hizmet_Sağlayıcısı.crt
+ 0
+ etc/ssl/certs/3b2716e5.0 -> EBG_Elektronik_Sertifika_Hizmet_Sağlayıcısı.pem
++etc/ssl/certs/EBG_Elektronik_Sertifika_Hizmet_Sağlayıcısı.pem -> /usr/share/ca-certificates/mozilla/EBG_Elektronik_Sertifika_Hizmet_Sağlayıcısı.crt
+ etc/ssl/certs/f80cc7f6.0 -> EBG_Elektronik_Sertifika_Hizmet_Sağlayıcısı.pem
+ " \
+ "" ""
+@@ -346,9 +346,9 @@ ls symlink/bb_test_evilfile
+ ' "\
+ anything.txt
+ symlink
+-tar: skipping unsafe symlink to '/tmp' in archive, set EXTRACT_UNSAFE_SYMLINKS=1 to extract
+ symlink/bb_test_evilfile
+-0
++tar: can't create symlink 'symlink' to '/tmp'
++1
+ ls: /tmp/bb_test_evilfile: No such file or directory
+ ls: bb_test_evilfile: No such file or directory
+ symlink/bb_test_evilfile
+-- 
+2.17.1
+
diff --git a/meta/recipes-core/busybox/busybox_1.27.2.bb b/meta/recipes-core/busybox/busybox_1.27.2.bb
index bab29728ee..716a0650fc 100644
--- a/meta/recipes-core/busybox/busybox_1.27.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.27.2.bb
@@ -43,6 +43,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://runlevel \
            file://makefile-libbb-race.patch \
            file://CVE-2011-5325.patch \
+           file://CVE-2011-5325-fix.patch \
            file://CVE-2017-15873.patch \
            file://busybox-CVE-2017-16544.patch \
            file://busybox-fix-lzma-segfaults.patch \
-- 
2.17.1


