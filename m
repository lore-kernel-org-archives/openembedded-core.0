Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B5F6B757A0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jun 2015 07:03:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5173wV6017972
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Jun 2015 00:03:58 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Mon, 1 Jun 2015 00:03:58 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 1 Jun 2015 14:58:00 +0800
Message-ID: <1433141880-27410-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] rsync: backport a patch to fix CVE-2014-8242
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
X-List-Received-Date: Mon, 01 Jun 2015 07:04:00 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../rsync/rsync-3.1.1/rsync.git-eac858085.patch    | 101 +++++++++++++++++++++
 meta/recipes-devtools/rsync/rsync_3.1.1.bb         |   1 +
 2 files changed, 102 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/rsync-3.1.1/rsync.git-eac858085.patch

diff --git a/meta/recipes-devtools/rsync/rsync-3.1.1/rsync.git-eac858085.patch b/meta/recipes-devtools/rsync/rsync-3.1.1/rsync.git-eac858085.patch
new file mode 100644
index 0000000..1fcac49
--- /dev/null
+++ b/meta/recipes-devtools/rsync/rsync-3.1.1/rsync.git-eac858085.patch
@@ -0,0 +1,101 @@
+From eac858085e3ac94ec0ab5061d11f52652c90a869 Mon Sep 17 00:00:00 2001
+From: Wayne Davison <wayned@samba.org>
+Date: Mon, 11 May 2015 12:36:20 -0700
+Subject: [PATCH 1/1] Add compat flag to allow proper seed checksum order.
+ Fixes the equivalent of librsync's CVE-2014-8242 issue.
+
+Upstream-Status: Backport
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ checksum.c | 17 +++++++++++++----
+ compat.c   |  5 +++++
+ options.c  |  1 +
+ 3 files changed, 19 insertions(+), 4 deletions(-)
+
+diff --git a/checksum.c b/checksum.c
+index a1c2aa2..933b514 100644
+--- a/checksum.c
++++ b/checksum.c
+@@ -23,6 +23,7 @@
+ 
+ extern int checksum_seed;
+ extern int protocol_version;
++extern int proper_seed_order;
+ 
+ /*
+   a simple 32 bit checksum that can be upadted from either end
+@@ -54,10 +55,18 @@ void get_checksum2(char *buf, int32 len, char *sum)
+ 	if (protocol_version >= 30) {
+ 		uchar seedbuf[4];
+ 		md5_begin(&m);
+-		md5_update(&m, (uchar *)buf, len);
+-		if (checksum_seed) {
+-			SIVALu(seedbuf, 0, checksum_seed);
+-			md5_update(&m, seedbuf, 4);
++		if (proper_seed_order) {
++			if (checksum_seed) {
++				SIVALu(seedbuf, 0, checksum_seed);
++				md5_update(&m, seedbuf, 4);
++			}
++			md5_update(&m, (uchar *)buf, len);
++		} else {
++			md5_update(&m, (uchar *)buf, len);
++			if (checksum_seed) {
++				SIVALu(seedbuf, 0, checksum_seed);
++				md5_update(&m, seedbuf, 4);
++			}
+ 		}
+ 		md5_result(&m, (uchar *)sum);
+ 	} else {
+diff --git a/compat.c b/compat.c
+index 2454937..f89d466 100644
+--- a/compat.c
++++ b/compat.c
+@@ -27,6 +27,7 @@ int inc_recurse = 0;
+ int compat_flags = 0;
+ int use_safe_inc_flist = 0;
+ int want_xattr_optim = 0;
++int proper_seed_order = 0;
+ 
+ extern int am_server;
+ extern int am_sender;
+@@ -78,6 +79,7 @@ int filesfrom_convert = 0;
+ #define CF_SYMLINK_ICONV (1<<2)
+ #define CF_SAFE_FLIST	 (1<<3)
+ #define CF_AVOID_XATTR_OPTIM (1<<4)
++#define CF_CHKSUM_SEED_FIX (1<<5)
+ 
+ static const char *client_info;
+ 
+@@ -271,12 +273,15 @@ void setup_protocol(int f_out,int f_in)
+ 				compat_flags |= CF_SAFE_FLIST;
+ 			if (local_server || strchr(client_info, 'x') != NULL)
+ 				compat_flags |= CF_AVOID_XATTR_OPTIM;
++			if (local_server || strchr(client_info, 'C') != NULL)
++				compat_flags |= CF_CHKSUM_SEED_FIX;
+ 			write_byte(f_out, compat_flags);
+ 		} else
+ 			compat_flags = read_byte(f_in);
+ 		/* The inc_recurse var MUST be set to 0 or 1. */
+ 		inc_recurse = compat_flags & CF_INC_RECURSE ? 1 : 0;
+ 		want_xattr_optim = protocol_version >= 31 && !(compat_flags & CF_AVOID_XATTR_OPTIM);
++		proper_seed_order = compat_flags & CF_CHKSUM_SEED_FIX ? 1 : 0;
+ 		if (am_sender) {
+ 			receiver_symlink_times = am_server
+ 			    ? strchr(client_info, 'L') != NULL
+diff --git a/options.c b/options.c
+index 19c2b7d..4128b59 100644
+--- a/options.c
++++ b/options.c
+@@ -2503,6 +2503,7 @@ void server_options(char **args, int *argc_p)
+ #endif
+ 		argstr[x++] = 'f'; /* flist I/O-error safety support */
+ 		argstr[x++] = 'x'; /* xattr hardlink optimization not desired */
++		argstr[x++] = 'C'; /* support checksum seed order fix */
+ 	}
+ 
+ 	if (x >= (int)sizeof argstr) { /* Not possible... */
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/rsync/rsync_3.1.1.bb b/meta/recipes-devtools/rsync/rsync_3.1.1.bb
index 3a79154..c74cdda 100644
--- a/meta/recipes-devtools/rsync/rsync_3.1.1.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.1.1.bb
@@ -3,6 +3,7 @@ require rsync.inc
 
 SRC_URI += "file://acinclude.m4 \
             file://0001-Complain-if-an-inc-recursive-path-is-not-right-for-i.patch \
+            file://rsync.git-eac858085.patch \
 "
 
 SRC_URI[md5sum] = "43bd6676f0b404326eee2d63be3cdcfe"
-- 
1.9.1


