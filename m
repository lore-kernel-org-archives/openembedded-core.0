Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 70D0F75D4A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 07:19:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0B7JXVQ026725
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jan 2016 23:19:33 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 10 Jan 2016 23:19:33 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 10 Jan 2016 23:19:27 -0800
Message-ID: <89127319d5f662d663553cb1c71e9cd4da409ef3.1452496745.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1452496745.git.liezhi.yang@windriver.com>
References: <cover.1452496745.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 8/8] rsync: 3.1.1 -> 3.1.2
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
X-List-Received-Date: Mon, 11 Jan 2016 07:19:32 -0000
Content-Type: text/plain

* Remove backport patches:
  - 0001-Complain-if-an-inc-recursive-path-is-not-right-for-i.patch
  - rsync.git-eac858085.patch

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...-an-inc-recursive-path-is-not-right-for-i.patch |  135 --------------------
 .../rsync/rsync-3.1.1/rsync.git-eac858085.patch    |  101 ---------------
 .../rsync/{rsync_3.1.1.bb => rsync_3.1.2.bb}       |    6 +-
 3 files changed, 2 insertions(+), 240 deletions(-)
 delete mode 100644 meta/recipes-devtools/rsync/rsync-3.1.1/0001-Complain-if-an-inc-recursive-path-is-not-right-for-i.patch
 delete mode 100644 meta/recipes-devtools/rsync/rsync-3.1.1/rsync.git-eac858085.patch
 rename meta/recipes-devtools/rsync/{rsync_3.1.1.bb => rsync_3.1.2.bb} (72%)

diff --git a/meta/recipes-devtools/rsync/rsync-3.1.1/0001-Complain-if-an-inc-recursive-path-is-not-right-for-i.patch b/meta/recipes-devtools/rsync/rsync-3.1.1/0001-Complain-if-an-inc-recursive-path-is-not-right-for-i.patch
deleted file mode 100644
index 5ece542..0000000
--- a/meta/recipes-devtools/rsync/rsync-3.1.1/0001-Complain-if-an-inc-recursive-path-is-not-right-for-i.patch
+++ /dev/null
@@ -1,135 +0,0 @@
-From 962f8b90045ab331fc04c9e65f80f1a53e68243b Mon Sep 17 00:00:00 2001
-From: Wayne Davison <wayned@samba.org>
-Date: Wed, 31 Dec 2014 12:41:03 -0800
-Subject: [PATCH] Complain if an inc-recursive path is not right for its dir.
- This ensures that a malicious sender can't use a just-sent symlink as a
- trasnfer path.
-
-Upstream-Status: BackPort
-
-Fix the CVE-2014-9512, rsync 3.1.1 allows remote attackers to write to arbitrary
-files via a symlink attack on a file in the synchronization path.
-
-BackPort and fix this patch to make it able to apply to source code
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
----
- flist.c | 22 ++++++++++++++++++++--
- io.c    |  2 +-
- main.c  |  4 ++--
- rsync.c |  2 +-
- proto.h | 2 +-
- 6 files changed, 31 insertions(+), 8 deletions(-)
-
-diff --git a/flist.c b/flist.c
-index c24672e..92e4b65 100644
---- a/flist.c
-+++ b/flist.c
-@@ -2435,8 +2435,9 @@ struct file_list *send_file_list(int f, int argc, char *argv[])
- 	return flist;
- }
- 
--struct file_list *recv_file_list(int f)
-+struct file_list *recv_file_list(int f, int dir_ndx)
- {
-+	const char *good_dirname = NULL;
- 	struct file_list *flist;
- 	int dstart, flags;
- 	int64 start_read;
-@@ -2492,6 +2493,23 @@ struct file_list *recv_file_list(int f)
- 		flist_expand(flist, 1);
- 		file = recv_file_entry(f, flist, flags);
- 
-+		if (inc_recurse) {
-+			static const char empty_dir[] = "\0";
-+			const char *cur_dir = file->dirname ? file->dirname : empty_dir;
-+			if (relative_paths && *cur_dir == '/')
-+				cur_dir++;
-+			if (cur_dir != good_dirname) {
-+				const char *d = dir_ndx >= 0 ? f_name(dir_flist->files[dir_ndx], NULL) : empty_dir;
-+				if (strcmp(cur_dir, d) != 0) {
-+					rprintf(FERROR,
-+						"ABORTING due to invalid dir prefix from sender: %s (should be: %s)\n",
-+						cur_dir, d);
-+					exit_cleanup(RERR_PROTOCOL);
-+				}
-+				good_dirname = cur_dir;
-+			}
-+		}
-+
- 		if (S_ISREG(file->mode)) {
- 			/* Already counted */
- 		} else if (S_ISDIR(file->mode)) {
-@@ -2615,7 +2633,7 @@ void recv_additional_file_list(int f)
- 			rprintf(FINFO, "[%s] receiving flist for dir %d\n",
- 				who_am_i(), ndx);
- 		}
--		flist = recv_file_list(f);
-+		flist = recv_file_list(f, ndx);
- 		flist->parent_ndx = ndx;
- 	}
- }
-diff --git a/io.c b/io.c
-index b9a9bd0..a868fa9 100644
---- a/io.c
-+++ b/io.c
-@@ -1685,7 +1685,7 @@ void wait_for_receiver(void)
- 				rprintf(FINFO, "[%s] receiving flist for dir %d\n",
- 					who_am_i(), ndx);
- 			}
--			flist = recv_file_list(iobuf.in_fd);
-+			flist = recv_file_list(iobuf.in_fd, ndx);
- 			flist->parent_ndx = ndx;
- #ifdef SUPPORT_HARD_LINKS
- 			if (preserve_hard_links)
-diff --git a/main.c b/main.c
-index e7a13f7..713b818 100644
---- a/main.c
-+++ b/main.c
-@@ -1009,7 +1009,7 @@ static void do_server_recv(int f_in, int f_out, int argc, char *argv[])
- 		filesfrom_fd = -1;
- 	}
- 
--	flist = recv_file_list(f_in);
-+	flist = recv_file_list(f_in, -1);
- 	if (!flist) {
- 		rprintf(FERROR,"server_recv: recv_file_list error\n");
- 		exit_cleanup(RERR_FILESELECT);
-@@ -1183,7 +1183,7 @@ int client_run(int f_in, int f_out, pid_t pid, int argc, char *argv[])
- 
- 	if (write_batch && !am_server)
- 		start_write_batch(f_in);
--	flist = recv_file_list(f_in);
-+	flist = recv_file_list(f_in, -1);
- 	if (inc_recurse && file_total == 1)
- 		recv_additional_file_list(f_in);
- 
-diff --git a/rsync.c b/rsync.c
-index 68ff6b1..c3ecc51 100644
---- a/rsync.c
-+++ b/rsync.c
-@@ -364,7 +364,7 @@ int read_ndx_and_attrs(int f_in, int f_out, int *iflag_ptr, uchar *type_ptr,
- 		}
- 		/* Send all the data we read for this flist to the generator. */
- 		start_flist_forward(ndx);
--		flist = recv_file_list(f_in);
-+		flist = recv_file_list(f_in, ndx);
- 		flist->parent_ndx = ndx;
- 		stop_flist_forward();
- 	}
-diff --git a/proto.h b/proto.h
-index 22fc539..247c558 100644
---- a/proto.h
-+++ b/proto.h
-@@ -89,7 +89,7 @@ struct file_struct *make_file(const char *fname, struct file_list *flist,
- void unmake_file(struct file_struct *file);
- void send_extra_file_list(int f, int at_least);
- struct file_list *send_file_list(int f, int argc, char *argv[]);
--struct file_list *recv_file_list(int f);
-+struct file_list *recv_file_list(int f, int dir_ndx);
- void recv_additional_file_list(int f);
- int flist_find(struct file_list *flist, struct file_struct *f);
- int flist_find_ignore_dirness(struct file_list *flist, struct file_struct *f);
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/rsync/rsync-3.1.1/rsync.git-eac858085.patch b/meta/recipes-devtools/rsync/rsync-3.1.1/rsync.git-eac858085.patch
deleted file mode 100644
index 1fcac49..0000000
--- a/meta/recipes-devtools/rsync/rsync-3.1.1/rsync.git-eac858085.patch
+++ /dev/null
@@ -1,101 +0,0 @@
-From eac858085e3ac94ec0ab5061d11f52652c90a869 Mon Sep 17 00:00:00 2001
-From: Wayne Davison <wayned@samba.org>
-Date: Mon, 11 May 2015 12:36:20 -0700
-Subject: [PATCH 1/1] Add compat flag to allow proper seed checksum order.
- Fixes the equivalent of librsync's CVE-2014-8242 issue.
-
-Upstream-Status: Backport
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
----
- checksum.c | 17 +++++++++++++----
- compat.c   |  5 +++++
- options.c  |  1 +
- 3 files changed, 19 insertions(+), 4 deletions(-)
-
-diff --git a/checksum.c b/checksum.c
-index a1c2aa2..933b514 100644
---- a/checksum.c
-+++ b/checksum.c
-@@ -23,6 +23,7 @@
- 
- extern int checksum_seed;
- extern int protocol_version;
-+extern int proper_seed_order;
- 
- /*
-   a simple 32 bit checksum that can be upadted from either end
-@@ -54,10 +55,18 @@ void get_checksum2(char *buf, int32 len, char *sum)
- 	if (protocol_version >= 30) {
- 		uchar seedbuf[4];
- 		md5_begin(&m);
--		md5_update(&m, (uchar *)buf, len);
--		if (checksum_seed) {
--			SIVALu(seedbuf, 0, checksum_seed);
--			md5_update(&m, seedbuf, 4);
-+		if (proper_seed_order) {
-+			if (checksum_seed) {
-+				SIVALu(seedbuf, 0, checksum_seed);
-+				md5_update(&m, seedbuf, 4);
-+			}
-+			md5_update(&m, (uchar *)buf, len);
-+		} else {
-+			md5_update(&m, (uchar *)buf, len);
-+			if (checksum_seed) {
-+				SIVALu(seedbuf, 0, checksum_seed);
-+				md5_update(&m, seedbuf, 4);
-+			}
- 		}
- 		md5_result(&m, (uchar *)sum);
- 	} else {
-diff --git a/compat.c b/compat.c
-index 2454937..f89d466 100644
---- a/compat.c
-+++ b/compat.c
-@@ -27,6 +27,7 @@ int inc_recurse = 0;
- int compat_flags = 0;
- int use_safe_inc_flist = 0;
- int want_xattr_optim = 0;
-+int proper_seed_order = 0;
- 
- extern int am_server;
- extern int am_sender;
-@@ -78,6 +79,7 @@ int filesfrom_convert = 0;
- #define CF_SYMLINK_ICONV (1<<2)
- #define CF_SAFE_FLIST	 (1<<3)
- #define CF_AVOID_XATTR_OPTIM (1<<4)
-+#define CF_CHKSUM_SEED_FIX (1<<5)
- 
- static const char *client_info;
- 
-@@ -271,12 +273,15 @@ void setup_protocol(int f_out,int f_in)
- 				compat_flags |= CF_SAFE_FLIST;
- 			if (local_server || strchr(client_info, 'x') != NULL)
- 				compat_flags |= CF_AVOID_XATTR_OPTIM;
-+			if (local_server || strchr(client_info, 'C') != NULL)
-+				compat_flags |= CF_CHKSUM_SEED_FIX;
- 			write_byte(f_out, compat_flags);
- 		} else
- 			compat_flags = read_byte(f_in);
- 		/* The inc_recurse var MUST be set to 0 or 1. */
- 		inc_recurse = compat_flags & CF_INC_RECURSE ? 1 : 0;
- 		want_xattr_optim = protocol_version >= 31 && !(compat_flags & CF_AVOID_XATTR_OPTIM);
-+		proper_seed_order = compat_flags & CF_CHKSUM_SEED_FIX ? 1 : 0;
- 		if (am_sender) {
- 			receiver_symlink_times = am_server
- 			    ? strchr(client_info, 'L') != NULL
-diff --git a/options.c b/options.c
-index 19c2b7d..4128b59 100644
---- a/options.c
-+++ b/options.c
-@@ -2503,6 +2503,7 @@ void server_options(char **args, int *argc_p)
- #endif
- 		argstr[x++] = 'f'; /* flist I/O-error safety support */
- 		argstr[x++] = 'x'; /* xattr hardlink optimization not desired */
-+		argstr[x++] = 'C'; /* support checksum seed order fix */
- 	}
- 
- 	if (x >= (int)sizeof argstr) { /* Not possible... */
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/rsync/rsync_3.1.1.bb b/meta/recipes-devtools/rsync/rsync_3.1.2.bb
similarity index 72%
rename from meta/recipes-devtools/rsync/rsync_3.1.1.bb
rename to meta/recipes-devtools/rsync/rsync_3.1.2.bb
index c74cdda..71c2045 100644
--- a/meta/recipes-devtools/rsync/rsync_3.1.1.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.1.2.bb
@@ -2,12 +2,10 @@ require rsync.inc
 
 
 SRC_URI += "file://acinclude.m4 \
-            file://0001-Complain-if-an-inc-recursive-path-is-not-right-for-i.patch \
-            file://rsync.git-eac858085.patch \
 "
 
-SRC_URI[md5sum] = "43bd6676f0b404326eee2d63be3cdcfe"
-SRC_URI[sha256sum] = "7de4364fcf5fe42f3bdb514417f1c40d10bbca896abe7e7f2c581c6ea08a2621"
+SRC_URI[md5sum] = "0f758d7e000c0f7f7d3792610fad70cb"
+SRC_URI[sha256sum] = "ecfa62a7fa3c4c18b9eccd8c16eaddee4bd308a76ea50b5c02a5840f09c0a1c2"
 
 PACKAGECONFIG ??= "acl attr"
 PACKAGECONFIG[acl] = "--enable-acl-support,--disable-acl-support,acl,"
-- 
1.7.9.5


