Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 79B196E268
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 02:40:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3O2eQpQ006760
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 19:40:27 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Thu, 23 Apr 2015 19:40:26 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Apr 2015 10:37:14 +0800
Message-ID: <1429843034-18978-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] rsync: backport a patch to fix CVE-2014-9512
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
X-List-Received-Date: Fri, 24 Apr 2015 02:40:28 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

rsync 3.1.1 allows remote attackers to write to arbitrary files via a symlink
attack on a file in the synchronization path.

Backport Complain-if-an-inc-recursive-path-is-not-right-for-i.patch to fix it

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...-an-inc-recursive-path-is-not-right-for-i.patch | 135 +++++++++++++++++++++
 meta/recipes-devtools/rsync/rsync_3.1.1.bb         |   4 +-
 2 files changed, 138 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/rsync/rsync-3.1.1/0001-Complain-if-an-inc-recursive-path-is-not-right-for-i.patch

diff --git a/meta/recipes-devtools/rsync/rsync-3.1.1/0001-Complain-if-an-inc-recursive-path-is-not-right-for-i.patch b/meta/recipes-devtools/rsync/rsync-3.1.1/0001-Complain-if-an-inc-recursive-path-is-not-right-for-i.patch
new file mode 100644
index 0000000..5ece542
--- /dev/null
+++ b/meta/recipes-devtools/rsync/rsync-3.1.1/0001-Complain-if-an-inc-recursive-path-is-not-right-for-i.patch
@@ -0,0 +1,135 @@
+From 962f8b90045ab331fc04c9e65f80f1a53e68243b Mon Sep 17 00:00:00 2001
+From: Wayne Davison <wayned@samba.org>
+Date: Wed, 31 Dec 2014 12:41:03 -0800
+Subject: [PATCH] Complain if an inc-recursive path is not right for its dir.
+ This ensures that a malicious sender can't use a just-sent symlink as a
+ trasnfer path.
+
+Upstream-Status: BackPort
+
+Fix the CVE-2014-9512, rsync 3.1.1 allows remote attackers to write to arbitrary
+files via a symlink attack on a file in the synchronization path.
+
+BackPort and fix this patch to make it able to apply to source code
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ flist.c | 22 ++++++++++++++++++++--
+ io.c    |  2 +-
+ main.c  |  4 ++--
+ rsync.c |  2 +-
+ proto.h | 2 +-
+ 6 files changed, 31 insertions(+), 8 deletions(-)
+
+diff --git a/flist.c b/flist.c
+index c24672e..92e4b65 100644
+--- a/flist.c
++++ b/flist.c
+@@ -2435,8 +2435,9 @@ struct file_list *send_file_list(int f, int argc, char *argv[])
+ 	return flist;
+ }
+ 
+-struct file_list *recv_file_list(int f)
++struct file_list *recv_file_list(int f, int dir_ndx)
+ {
++	const char *good_dirname = NULL;
+ 	struct file_list *flist;
+ 	int dstart, flags;
+ 	int64 start_read;
+@@ -2492,6 +2493,23 @@ struct file_list *recv_file_list(int f)
+ 		flist_expand(flist, 1);
+ 		file = recv_file_entry(f, flist, flags);
+ 
++		if (inc_recurse) {
++			static const char empty_dir[] = "\0";
++			const char *cur_dir = file->dirname ? file->dirname : empty_dir;
++			if (relative_paths && *cur_dir == '/')
++				cur_dir++;
++			if (cur_dir != good_dirname) {
++				const char *d = dir_ndx >= 0 ? f_name(dir_flist->files[dir_ndx], NULL) : empty_dir;
++				if (strcmp(cur_dir, d) != 0) {
++					rprintf(FERROR,
++						"ABORTING due to invalid dir prefix from sender: %s (should be: %s)\n",
++						cur_dir, d);
++					exit_cleanup(RERR_PROTOCOL);
++				}
++				good_dirname = cur_dir;
++			}
++		}
++
+ 		if (S_ISREG(file->mode)) {
+ 			/* Already counted */
+ 		} else if (S_ISDIR(file->mode)) {
+@@ -2615,7 +2633,7 @@ void recv_additional_file_list(int f)
+ 			rprintf(FINFO, "[%s] receiving flist for dir %d\n",
+ 				who_am_i(), ndx);
+ 		}
+-		flist = recv_file_list(f);
++		flist = recv_file_list(f, ndx);
+ 		flist->parent_ndx = ndx;
+ 	}
+ }
+diff --git a/io.c b/io.c
+index b9a9bd0..a868fa9 100644
+--- a/io.c
++++ b/io.c
+@@ -1685,7 +1685,7 @@ void wait_for_receiver(void)
+ 				rprintf(FINFO, "[%s] receiving flist for dir %d\n",
+ 					who_am_i(), ndx);
+ 			}
+-			flist = recv_file_list(iobuf.in_fd);
++			flist = recv_file_list(iobuf.in_fd, ndx);
+ 			flist->parent_ndx = ndx;
+ #ifdef SUPPORT_HARD_LINKS
+ 			if (preserve_hard_links)
+diff --git a/main.c b/main.c
+index e7a13f7..713b818 100644
+--- a/main.c
++++ b/main.c
+@@ -1009,7 +1009,7 @@ static void do_server_recv(int f_in, int f_out, int argc, char *argv[])
+ 		filesfrom_fd = -1;
+ 	}
+ 
+-	flist = recv_file_list(f_in);
++	flist = recv_file_list(f_in, -1);
+ 	if (!flist) {
+ 		rprintf(FERROR,"server_recv: recv_file_list error\n");
+ 		exit_cleanup(RERR_FILESELECT);
+@@ -1183,7 +1183,7 @@ int client_run(int f_in, int f_out, pid_t pid, int argc, char *argv[])
+ 
+ 	if (write_batch && !am_server)
+ 		start_write_batch(f_in);
+-	flist = recv_file_list(f_in);
++	flist = recv_file_list(f_in, -1);
+ 	if (inc_recurse && file_total == 1)
+ 		recv_additional_file_list(f_in);
+ 
+diff --git a/rsync.c b/rsync.c
+index 68ff6b1..c3ecc51 100644
+--- a/rsync.c
++++ b/rsync.c
+@@ -364,7 +364,7 @@ int read_ndx_and_attrs(int f_in, int f_out, int *iflag_ptr, uchar *type_ptr,
+ 		}
+ 		/* Send all the data we read for this flist to the generator. */
+ 		start_flist_forward(ndx);
+-		flist = recv_file_list(f_in);
++		flist = recv_file_list(f_in, ndx);
+ 		flist->parent_ndx = ndx;
+ 		stop_flist_forward();
+ 	}
+diff --git a/proto.h b/proto.h
+index 22fc539..247c558 100644
+--- a/proto.h
++++ b/proto.h
+@@ -89,7 +89,7 @@ struct file_struct *make_file(const char *fname, struct file_list *flist,
+ void unmake_file(struct file_struct *file);
+ void send_extra_file_list(int f, int at_least);
+ struct file_list *send_file_list(int f, int argc, char *argv[]);
+-struct file_list *recv_file_list(int f);
++struct file_list *recv_file_list(int f, int dir_ndx);
+ void recv_additional_file_list(int f);
+ int flist_find(struct file_list *flist, struct file_struct *f);
+ int flist_find_ignore_dirness(struct file_list *flist, struct file_struct *f);
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/rsync/rsync_3.1.1.bb b/meta/recipes-devtools/rsync/rsync_3.1.1.bb
index 5ff8ae8..3a79154 100644
--- a/meta/recipes-devtools/rsync/rsync_3.1.1.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.1.1.bb
@@ -1,7 +1,9 @@
 require rsync.inc
 
 
-SRC_URI += "file://acinclude.m4"
+SRC_URI += "file://acinclude.m4 \
+            file://0001-Complain-if-an-inc-recursive-path-is-not-right-for-i.patch \
+"
 
 SRC_URI[md5sum] = "43bd6676f0b404326eee2d63be3cdcfe"
 SRC_URI[sha256sum] = "7de4364fcf5fe42f3bdb514417f1c40d10bbca896abe7e7f2c581c6ea08a2621"
-- 
1.9.1


