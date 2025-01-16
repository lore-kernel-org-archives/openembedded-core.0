Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 453CEC02187
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 15:51:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.52746.1737042691571080548
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jan 2025 07:51:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=311110a243=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50GCrujD015661
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 15:51:30 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443dv15ta9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 15:51:30 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 16 Jan 2025 07:51:29 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 16 Jan 2025 07:51:28 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 5/8] rsync: fix CVE-2024-12086
Date: Thu, 16 Jan 2025 15:51:16 +0000
Message-ID: <20250116155119.3867588-5-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250116155119.3867588-1-archana.polampalli@windriver.com>
References: <20250116155119.3867588-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 6K8yheKIDO05RsYJbykWEPc_8ebUnYp5
X-Authority-Analysis: v=2.4 cv=N5zTF39B c=1 sm=1 tr=0 ts=67892b02 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VdSt8ZQiCzkA:10 a=hGzw-44bAAAA:8 a=t7CeM3EgAAAA:8 a=oq-7gxcSAAAA:8 a=7v-tfbF0ZksAj4QfIWoA:9 a=JGDlLAvNiWxBmoAP:21
 a=HvKuF1_PTVFglORKqfwH:22 a=FdTzh2GWekK77mhwV6Dw:22 a=UIhn0zqP03opOuWSx-ON:22
X-Proofpoint-ORIG-GUID: 6K8yheKIDO05RsYJbykWEPc_8ebUnYp5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_06,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=769 clxscore=1015
 suspectscore=0 bulkscore=0 mlxscore=0 phishscore=0 spamscore=0
 impostorscore=0 malwarescore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2411120000
 definitions=main-2501160119
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 15:51:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209963

From: Archana Polampalli <archana.polampalli@windriver.com>

A flaw was found in rsync. It could allow a server to enumerate the contents of an
arbitrary file from the client's machine. This issue occurs when files are being
copied from a client to a server. During this process, the rsync server will send
checksums of local data to the client to compare with in order to determine what
data needs to be sent to the server. By sending specially constructed checksum values
for arbitrary files, an attacker may be able to reconstruct the data of those files
byte-by-byte based on the responses from the client.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../rsync/files/CVE-2024-12086-0001.patch     |  42 +++++++
 .../rsync/files/CVE-2024-12086-0002.patch     | 108 ++++++++++++++++++
 .../rsync/files/CVE-2024-12086-0003.patch     | 108 ++++++++++++++++++
 .../rsync/files/CVE-2024-12086-0004.patch     |  41 +++++++
 meta/recipes-devtools/rsync/rsync_3.2.7.bb    |   4 +
 5 files changed, 303 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12086-0001.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12086-0002.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12086-0003.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12086-0004.patch

diff --git a/meta/recipes-devtools/rsync/files/CVE-2024-12086-0001.patch b/meta/recipes-devtools/rsync/files/CVE-2024-12086-0001.patch
new file mode 100644
index 0000000000..958a25a37b
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2024-12086-0001.patch
@@ -0,0 +1,42 @@
+From 8ad4b5d912fad1df29717dddaa775724da77d299 Mon Sep 17 00:00:00 2001
+From: Andrew Tridgell <andrew@tridgell.net>
+Date: Sat, 23 Nov 2024 11:08:03 +1100
+Subject: [PATCH] refuse fuzzy options when fuzzy not selected
+
+this prevents a malicious server providing a file to compare to when
+the user has not given the fuzzy option
+
+CVE: CVE-2024-12086
+
+Upstream-Status: Backport [https://git.samba.org/?p=rsync.git;a=commit;h=8ad4b5d912fad1df29717dddaa775724da77d299]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ receiver.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/receiver.c b/receiver.c
+index 6b4b369e..2d7f6033 100644
+--- a/receiver.c
++++ b/receiver.c
+@@ -66,6 +66,7 @@ extern char sender_file_sum[MAX_DIGEST_LEN];
+ extern struct file_list *cur_flist, *first_flist, *dir_flist;
+ extern filter_rule_list daemon_filter_list;
+ extern OFF_T preallocated_len;
++extern int fuzzy_basis;
+
+ extern struct name_num_item *xfer_sum_nni;
+ extern int xfer_sum_len;
+@@ -716,6 +717,10 @@ int recv_files(int f_in, int f_out, char *local_name)
+				fnamecmp = get_backup_name(fname);
+				break;
+			case FNAMECMP_FUZZY:
++				if (fuzzy_basis == 0) {
++					rprintf(FERROR_XFER, "rsync: refusing malicious fuzzy operation for %s\n", xname);
++					exit_cleanup(RERR_PROTOCOL);
++				}
+				if (file->dirname) {
+					pathjoin(fnamecmpbuf, sizeof fnamecmpbuf, file->dirname, xname);
+					fnamecmp = fnamecmpbuf;
+--
+2.40.0
diff --git a/meta/recipes-devtools/rsync/files/CVE-2024-12086-0002.patch b/meta/recipes-devtools/rsync/files/CVE-2024-12086-0002.patch
new file mode 100644
index 0000000000..5d25f12dd8
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2024-12086-0002.patch
@@ -0,0 +1,108 @@
+From b4a27ca25d0abb6fcf14f41b7e11f3a6e1d8a4ff Mon Sep 17 00:00:00 2001
+From: Andrew Tridgell <andrew@tridgell.net>
+Date: Sat, 23 Nov 2024 12:26:10 +1100
+Subject: [PATCH] added secure_relative_open()
+
+this is an open that enforces no symlink following for all path
+components in a relative path
+
+CVE: CVE-2024-12086
+
+Upstream-Status: Backport [https://git.samba.org/?p=rsync.git;a=commit;h=b4a27ca25d0abb6fcf14f41b7e11f3a6e1d8a4ff]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ syscall.c | 74 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 74 insertions(+)
+
+diff --git a/syscall.c b/syscall.c
+index b4b0f1f1..cffc814b 100644
+--- a/syscall.c
++++ b/syscall.c
+@@ -33,6 +33,8 @@
+ #include <sys/syscall.h>
+ #endif
+
++#include "ifuncs.h"
++
+ extern int dry_run;
+ extern int am_root;
+ extern int am_sender;
+@@ -707,3 +709,75 @@ int do_open_nofollow(const char *pathname, int flags)
+
+	return fd;
+ }
++
++/*
++  open a file relative to a base directory. The basedir can be NULL,
++  in which case the current working directory is used. The relpath
++  must be a relative path, and the relpath must not contain any
++  elements in the path which follow symlinks (ie. like O_NOFOLLOW, but
++  applies to all path components, not just the last component)
++*/
++int secure_relative_open(const char *basedir, const char *relpath, int flags, mode_t mode)
++{
++	if (!relpath || relpath[0] == '/') {
++		// must be a relative path
++		errno = EINVAL;
++		return -1;
++	}
++
++#if !defined(O_NOFOLLOW) || !defined(O_DIRECTORY)
++	// really old system, all we can do is live with the risks
++	if (!basedir) {
++		return open(relpath, flags, mode);
++	}
++	char fullpath[MAXPATHLEN];
++	pathjoin(fullpath, sizeof fullpath, basedir, relpath);
++	return open(fullpath, flags, mode);
++#else
++	int dirfd = AT_FDCWD;
++	if (basedir != NULL) {
++		dirfd = openat(AT_FDCWD, basedir, O_RDONLY | O_DIRECTORY);
++		if (dirfd == -1) {
++			return -1;
++		}
++	}
++	int retfd = -1;
++
++	char *path_copy = my_strdup(relpath, __FILE__, __LINE__);
++	if (!path_copy) {
++		return -1;
++	}
++
++	for (const char *part = strtok(path_copy, "/");
++	     part != NULL;
++	     part = strtok(NULL, "/"))
++	{
++		int next_fd = openat(dirfd, part, O_RDONLY | O_DIRECTORY | O_NOFOLLOW);
++		if (next_fd == -1 && errno == ENOTDIR) {
++			if (strtok(NULL, "/") != NULL) {
++				// this is not the last component of the path
++				errno = ELOOP;
++				goto cleanup;
++			}
++			// this could be the last component of the path, try as a file
++			retfd = openat(dirfd, part, flags | O_NOFOLLOW, mode);
++			goto cleanup;
++		}
++		if (next_fd == -1) {
++			goto cleanup;
++		}
++		if (dirfd != AT_FDCWD) close(dirfd);
++		dirfd = next_fd;
++	}
++
++	// the path must be a directory
++	errno = EINVAL;
++
++cleanup:
++	free(path_copy);
++	if (dirfd != AT_FDCWD) {
++		close(dirfd);
++	}
++	return retfd;
++#endif // O_NOFOLLOW, O_DIRECTORY
++}
+--
+2.40.0
diff --git a/meta/recipes-devtools/rsync/files/CVE-2024-12086-0003.patch b/meta/recipes-devtools/rsync/files/CVE-2024-12086-0003.patch
new file mode 100644
index 0000000000..de1747adf2
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2024-12086-0003.patch
@@ -0,0 +1,108 @@
+From c35e28331f10ba6eba370611abd78bde32d54da7 Mon Sep 17 00:00:00 2001
+From: Andrew Tridgell <andrew@tridgell.net>
+Date: Sat, 23 Nov 2024 12:28:13 +1100
+Subject: [PATCH] receiver: use secure_relative_open() for basis file
+
+this prevents attacks where the basis file is manipulated by a
+malicious sender to gain information about files outside the
+destination tree
+
+CVE: CVE-2024-12086
+
+Upstream-Status: Backport [https://git.samba.org/?p=rsync.git;a=commit;h=c35e28331f10ba6eba370611abd78bde32d54da7]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ receiver.c | 42 ++++++++++++++++++++++++++----------------
+ 1 file changed, 26 insertions(+), 16 deletions(-)
+
+diff --git a/receiver.c b/receiver.c
+index 2d7f6033..8031b8f4 100644
+--- a/receiver.c
++++ b/receiver.c
+@@ -552,6 +552,8 @@ int recv_files(int f_in, int f_out, char *local_name)
+	progress_init();
+
+	while (1) {
++		const char *basedir = NULL;
++
+		cleanup_disable();
+
+		/* This call also sets cur_flist. */
+@@ -722,27 +724,29 @@ int recv_files(int f_in, int f_out, char *local_name)
+					exit_cleanup(RERR_PROTOCOL);
+				}
+				if (file->dirname) {
+-					pathjoin(fnamecmpbuf, sizeof fnamecmpbuf, file->dirname, xname);
+-					fnamecmp = fnamecmpbuf;
+-				} else
+-					fnamecmp = xname;
++					basedir = file->dirname;
++				}
++				fnamecmp = xname;
+				break;
+			default:
+				if (fnamecmp_type > FNAMECMP_FUZZY && fnamecmp_type-FNAMECMP_FUZZY <= basis_dir_cnt) {
+					fnamecmp_type -= FNAMECMP_FUZZY + 1;
+					if (file->dirname) {
+-						stringjoin(fnamecmpbuf, sizeof fnamecmpbuf,
+-							   basis_dir[fnamecmp_type], "/", file->dirname, "/", xname, NULL);
+-					} else
+-						pathjoin(fnamecmpbuf, sizeof fnamecmpbuf, basis_dir[fnamecmp_type], xname);
++						pathjoin(fnamecmpbuf, sizeof fnamecmpbuf, basis_dir[fnamecmp_type], file->dirname);
++						basedir = fnamecmpbuf;
++					} else {
++						basedir = basis_dir[fnamecmp_type];
++					}
++					fnamecmp = xname;
+				} else if (fnamecmp_type >= basis_dir_cnt) {
+					rprintf(FERROR,
+						"invalid basis_dir index: %d.\n",
+						fnamecmp_type);
+					exit_cleanup(RERR_PROTOCOL);
+-				} else
+-					pathjoin(fnamecmpbuf, sizeof fnamecmpbuf, basis_dir[fnamecmp_type], fname);
+-				fnamecmp = fnamecmpbuf;
++				} else {
++					basedir = basis_dir[fnamecmp_type];
++					fnamecmp = fname;
++				}
+				break;
+			}
+			if (!fnamecmp || (daemon_filter_list.head
+@@ -765,7 +769,7 @@ int recv_files(int f_in, int f_out, char *local_name)
+		}
+
+		/* open the file */
+-		fd1 = do_open(fnamecmp, O_RDONLY, 0);
++		fd1 = secure_relative_open(basedir, fnamecmp, O_RDONLY, 0);
+
+		if (fd1 == -1 && protocol_version < 29) {
+			if (fnamecmp != fname) {
+@@ -776,14 +780,20 @@ int recv_files(int f_in, int f_out, char *local_name)
+
+			if (fd1 == -1 && basis_dir[0]) {
+				/* pre-29 allowed only one alternate basis */
+-				pathjoin(fnamecmpbuf, sizeof fnamecmpbuf,
+-					 basis_dir[0], fname);
+-				fnamecmp = fnamecmpbuf;
++				basedir = basis_dir[0];
++				fnamecmp = fname;
+				fnamecmp_type = FNAMECMP_BASIS_DIR_LOW;
+-				fd1 = do_open(fnamecmp, O_RDONLY, 0);
++				fd1 = secure_relative_open(basedir, fnamecmp, O_RDONLY, 0);
+			}
+		}
+
++		if (basedir) {
++			// for the following code we need the full
++			// path name as a single string
++			pathjoin(fnamecmpbuf, sizeof fnamecmpbuf, basedir, fnamecmp);
++			fnamecmp = fnamecmpbuf;
++		}
++
+		one_inplace = inplace_partial && fnamecmp_type == FNAMECMP_PARTIAL_DIR;
+		updating_basis_or_equiv = one_inplace
+		    || (inplace && (fnamecmp == fname || fnamecmp_type == FNAMECMP_BACKUP));
+--
+2.40.0
diff --git a/meta/recipes-devtools/rsync/files/CVE-2024-12086-0004.patch b/meta/recipes-devtools/rsync/files/CVE-2024-12086-0004.patch
new file mode 100644
index 0000000000..b85e1dfae4
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2024-12086-0004.patch
@@ -0,0 +1,41 @@
+From 9f86ddc9652247233f32b241a79d5aa4fb9d4afa Mon Sep 17 00:00:00 2001
+From: Andrew Tridgell <andrew@tridgell.net>
+Date: Tue, 26 Nov 2024 09:16:31 +1100
+Subject: [PATCH] disallow ../ elements in relpath for secure_relative_open
+
+CVE: CVE-2024-12086
+
+Upstream-Status: Backport [https://git.samba.org/?p=rsync.git;a=commit;h=9f86ddc9652247233f32b241a79d5aa4fb9d4afa]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ syscall.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/syscall.c b/syscall.c
+index cffc814b..081357bb 100644
+--- a/syscall.c
++++ b/syscall.c
+@@ -716,6 +716,8 @@ int do_open_nofollow(const char *pathname, int flags)
+   must be a relative path, and the relpath must not contain any
+   elements in the path which follow symlinks (ie. like O_NOFOLLOW, but
+   applies to all path components, not just the last component)
++
++  The relpath must also not contain any ../ elements in the path
+ */
+ int secure_relative_open(const char *basedir, const char *relpath, int flags, mode_t mode)
+ {
+@@ -724,6 +726,11 @@ int secure_relative_open(const char *basedir, const char *relpath, int flags, mo
+		errno = EINVAL;
+		return -1;
+	}
++	if (strncmp(relpath, "../", 3) == 0 || strstr(relpath, "/../")) {
++		// no ../ elements allowed in the relpath
++		errno = EINVAL;
++		return -1;
++	}
+
+ #if !defined(O_NOFOLLOW) || !defined(O_DIRECTORY)
+	// really old system, all we can do is live with the risks
+--
+2.40.0
diff --git a/meta/recipes-devtools/rsync/rsync_3.2.7.bb b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
index 6f4d539e4a..b6baec63a2 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.7.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
@@ -18,6 +18,10 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://CVE-2024-12084-0001.patch \
            file://CVE-2024-12084-0002.patch \
            file://CVE-2024-12085.patch \
+           file://CVE-2024-12086-0001.patch \
+           file://CVE-2024-12086-0002.patch \
+           file://CVE-2024-12086-0003.patch \
+           file://CVE-2024-12086-0004.patch \
            "
 
 SRC_URI[sha256sum] = "4e7d9d3f6ed10878c58c5fb724a67dacf4b6aac7340b13e488fb2dc41346f2bb"
-- 
2.40.0


