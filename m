Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53F77C02188
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 15:51:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.52453.1737042697095544114
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jan 2025 07:51:37 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=311110a243=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50GAv5Fk030372
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 15:51:36 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 446wf7geq1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 15:51:36 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 16 Jan 2025 07:51:35 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 16 Jan 2025 07:51:33 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 8/8] rsync: fix CVE-2024-12747
Date: Thu, 16 Jan 2025 15:51:19 +0000
Message-ID: <20250116155119.3867588-8-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250116155119.3867588-1-archana.polampalli@windriver.com>
References: <20250116155119.3867588-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: G4wIOHCkEP37Fr6_7KTizFK41C6JS70u
X-Authority-Analysis: v=2.4 cv=X8moKHTe c=1 sm=1 tr=0 ts=67892b08 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VdSt8ZQiCzkA:10 a=hGzw-44bAAAA:8 a=t7CeM3EgAAAA:8 a=oq-7gxcSAAAA:8 a=CbrHNlHg-600iOgXvc4A:9 a=HvKuF1_PTVFglORKqfwH:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=UIhn0zqP03opOuWSx-ON:22
X-Proofpoint-GUID: G4wIOHCkEP37Fr6_7KTizFK41C6JS70u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_06,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 mlxscore=0
 malwarescore=0 impostorscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501160119
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 15:51:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209965

From: Archana Polampalli <archana.polampalli@windriver.com>

A flaw was found in rsync. This vulnerability arises from a race condition during
rsync's handling of symbolic links. Rsync's default behavior when encountering
symbolic links is to skip them. If an attacker replaced a regular file with a
symbolic link at the right time, it was possible to bypass the default behavior
and traverse symbolic links. Depending on the privileges of the rsync process,
an attacker could leak sensitive information, potentially leading to privilege escalation.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../rsync/files/CVE-2024-12747.patch          | 192 ++++++++++++++++++
 meta/recipes-devtools/rsync/rsync_3.2.7.bb    |   1 +
 2 files changed, 193 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12747.patch

diff --git a/meta/recipes-devtools/rsync/files/CVE-2024-12747.patch b/meta/recipes-devtools/rsync/files/CVE-2024-12747.patch
new file mode 100644
index 0000000000..b1dd0a03b9
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2024-12747.patch
@@ -0,0 +1,192 @@
+From 0590b09d9a34ae72741b91ec0708a820650198b0 Mon Sep 17 00:00:00 2001
+From: Andrew Tridgell <andrew@tridgell.net>
+Date: Wed, 18 Dec 2024 08:59:42 +1100
+Subject: [PATCH] fixed symlink race condition in sender
+
+when we open a file that we don't expect to be a symlink use
+O_NOFOLLOW to prevent a race condition where an attacker could change
+a file between being a normal file and a symlink
+
+CVE: CVE-2024-12747
+
+Upstream-Status: Backport [https://git.samba.org/?p=rsync.git;a=commit;h=0590b09d9a34ae72741b91ec0708a820650198b0]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ checksum.c  |  2 +-
+ flist.c     |  2 +-
+ generator.c |  4 ++--
+ receiver.c  |  2 +-
+ sender.c    |  2 +-
+ syscall.c   | 20 ++++++++++++++++++++
+ t_unsafe.c  |  3 +++
+ tls.c       |  3 +++
+ trimslash.c |  2 ++
+ util1.c     |  2 +-
+ 10 files changed, 35 insertions(+), 7 deletions(-)
+
+diff --git a/checksum.c b/checksum.c
+index cb21882c..66e80896 100644
+--- a/checksum.c
++++ b/checksum.c
+@@ -406,7 +406,7 @@ void file_checksum(const char *fname, const STRUCT_STAT *st_p, char *sum)
+	int32 remainder;
+	int fd;
+
+-	fd = do_open(fname, O_RDONLY, 0);
++	fd = do_open_checklinks(fname);
+	if (fd == -1) {
+		memset(sum, 0, file_sum_len);
+		return;
+diff --git a/flist.c b/flist.c
+index 087f9da6..17832533 100644
+--- a/flist.c
++++ b/flist.c
+@@ -1390,7 +1390,7 @@ struct file_struct *make_file(const char *fname, struct file_list *flist,
+
+	if (copy_devices && am_sender && IS_DEVICE(st.st_mode)) {
+		if (st.st_size == 0) {
+-			int fd = do_open(fname, O_RDONLY, 0);
++			int fd = do_open_checklinks(fname);
+			if (fd >= 0) {
+				st.st_size = get_device_size(fd, fname);
+				close(fd);
+diff --git a/generator.c b/generator.c
+index 110db28f..3f13bb95 100644
+--- a/generator.c
++++ b/generator.c
+@@ -1798,7 +1798,7 @@ static void recv_generator(char *fname, struct file_struct *file, int ndx,
+
+	if (write_devices && IS_DEVICE(sx.st.st_mode) && sx.st.st_size == 0) {
+		/* This early open into fd skips the regular open below. */
+-		if ((fd = do_open(fnamecmp, O_RDONLY, 0)) >= 0)
++		if ((fd = do_open_nofollow(fnamecmp, O_RDONLY)) >= 0)
+			real_sx.st.st_size = sx.st.st_size = get_device_size(fd, fnamecmp);
+	}
+
+@@ -1867,7 +1867,7 @@ static void recv_generator(char *fname, struct file_struct *file, int ndx,
+	}
+
+	/* open the file */
+-	if (fd < 0 && (fd = do_open(fnamecmp, O_RDONLY, 0)) < 0) {
++	if (fd < 0 && (fd = do_open_checklinks(fnamecmp)) < 0) {
+		rsyserr(FERROR, errno, "failed to open %s, continuing",
+			full_fname(fnamecmp));
+	  pretend_missing:
+diff --git a/receiver.c b/receiver.c
+index 8031b8f4..edfbb210 100644
+--- a/receiver.c
++++ b/receiver.c
+@@ -775,7 +775,7 @@ int recv_files(int f_in, int f_out, char *local_name)
+			if (fnamecmp != fname) {
+				fnamecmp = fname;
+				fnamecmp_type = FNAMECMP_FNAME;
+-				fd1 = do_open(fnamecmp, O_RDONLY, 0);
++				fd1 = do_open_nofollow(fnamecmp, O_RDONLY);
+			}
+
+			if (fd1 == -1 && basis_dir[0]) {
+diff --git a/sender.c b/sender.c
+index 2bbff2fa..a4d46c39 100644
+--- a/sender.c
++++ b/sender.c
+@@ -350,7 +350,7 @@ void send_files(int f_in, int f_out)
+			exit_cleanup(RERR_PROTOCOL);
+		}
+
+-		fd = do_open(fname, O_RDONLY, 0);
++		fd = do_open_checklinks(fname);
+		if (fd == -1) {
+			if (errno == ENOENT) {
+				enum logcode c = am_daemon && protocol_version < 28 ? FERROR : FWARNING;
+diff --git a/syscall.c b/syscall.c
+index 081357bb..8cea2900 100644
+--- a/syscall.c
++++ b/syscall.c
+@@ -45,6 +45,8 @@ extern int preallocate_files;
+ extern int preserve_perms;
+ extern int preserve_executability;
+ extern int open_noatime;
++extern int copy_links;
++extern int copy_unsafe_links;
+
+ #ifndef S_BLKSIZE
+ # if defined hpux || defined __hpux__ || defined __hpux
+@@ -788,3 +790,21 @@ cleanup:
+	return retfd;
+ #endif // O_NOFOLLOW, O_DIRECTORY
+ }
++
++/*
++  varient of do_open/do_open_nofollow which does do_open() if the
++  copy_links or copy_unsafe_links options are set and does
++  do_open_nofollow() otherwise
++
++  This is used to prevent a race condition where an attacker could be
++  switching a file between being a symlink and being a normal file
++
++  The open is always done with O_RDONLY flags
++ */
++int do_open_checklinks(const char *pathname)
++{
++	if (copy_links || copy_unsafe_links) {
++		return do_open(pathname, O_RDONLY, 0);
++	}
++	return do_open_nofollow(pathname, O_RDONLY);
++}
+diff --git a/t_unsafe.c b/t_unsafe.c
+index 010cac50..e10619a2 100644
+--- a/t_unsafe.c
++++ b/t_unsafe.c
+@@ -28,6 +28,9 @@ int am_root = 0;
+ int am_sender = 1;
+ int read_only = 0;
+ int list_only = 0;
++int copy_links = 0;
++int copy_unsafe_links = 0;
++
+ short info_levels[COUNT_INFO], debug_levels[COUNT_DEBUG];
+
+ int
+diff --git a/tls.c b/tls.c
+index e6b0708a..858f8f10 100644
+--- a/tls.c
++++ b/tls.c
+@@ -49,6 +49,9 @@ int list_only = 0;
+ int link_times = 0;
+ int link_owner = 0;
+ int nsec_times = 0;
++int safe_symlinks = 0;
++int copy_links = 0;
++int copy_unsafe_links = 0;
+
+ #ifdef SUPPORT_XATTRS
+
+diff --git a/trimslash.c b/trimslash.c
+index 1ec928ca..f2774cd7 100644
+--- a/trimslash.c
++++ b/trimslash.c
+@@ -26,6 +26,8 @@ int am_root = 0;
+ int am_sender = 1;
+ int read_only = 1;
+ int list_only = 0;
++int copy_links = 0;
++int copy_unsafe_links = 0;
+
+ int
+ main(int argc, char **argv)
+diff --git a/util1.c b/util1.c
+index f260d398..d84bc414 100644
+--- a/util1.c
++++ b/util1.c
+@@ -365,7 +365,7 @@ int copy_file(const char *source, const char *dest, int tmpfilefd, mode_t mode)
+	int len;   /* Number of bytes read into `buf'. */
+	OFF_T prealloc_len = 0, offset = 0;
+
+-	if ((ifd = do_open(source, O_RDONLY, 0)) < 0) {
++	if ((ifd = do_open_nofollow(source, O_RDONLY)) < 0) {
+		int save_errno = errno;
+		rsyserr(FERROR_XFER, errno, "open %s", full_fname(source));
+		errno = save_errno;
+--
+2.40.0
diff --git a/meta/recipes-devtools/rsync/rsync_3.2.7.bb b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
index df3627ed53..37e79e1e56 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.7.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
@@ -26,6 +26,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://CVE-2024-12087-0002.patch \
            file://CVE-2024-12087-0003.patch \
            file://CVE-2024-12088.patch \
+           file://CVE-2024-12747.patch \
            "
 
 SRC_URI[sha256sum] = "4e7d9d3f6ed10878c58c5fb724a67dacf4b6aac7340b13e488fb2dc41346f2bb"
-- 
2.40.0


