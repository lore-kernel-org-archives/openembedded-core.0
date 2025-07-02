Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64745C8303C
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 06:52:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.17645.1751439130261101297
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 23:52:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=92784424e9=divya.chellam@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5625XE5j005298
	for <openembedded-core@lists.openembedded.org>; Tue, 1 Jul 2025 23:52:10 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47jfwm3rac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 23:52:09 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 1 Jul 2025 23:52:07 -0700
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][scarthgap][PATCH 5/5] libarchive: fix CVE-2025-5918
Date: Wed, 2 Jul 2025 12:21:34 +0530
Message-ID: <20250702065134.753410-5-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250702065134.753410-1-divya.chellam@windriver.com>
References: <20250702065134.753410-1-divya.chellam@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Authority-Analysis: v=2.4 cv=LPRmQIW9 c=1 sm=1 tr=0 ts=6864d719 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=Wb1JkmetP80A:10 a=xNf9USuDAAAA:8 a=NEAV23lmAAAA:8 a=3uWsZ661AAAA:8 a=t7CeM3EgAAAA:8 a=tyuvAb6jAAAA:8
 a=XnvF3NxQq13tHkOUM3cA:9 a=fYNom5PXsM5enKJDCoVv:22 a=FdTzh2GWekK77mhwV6Dw:22 a=vMd6T1JfvD_20K6YSfI9:22
X-Proofpoint-GUID: 6MrninVzziilGN6qAuA2Q89iHrV9CyWH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA1MyBTYWx0ZWRfX2hhezSgHW4Fl t10DvZCxNobAcTj5gt8ltN0D5w1xUjMYuUHemMlZXdUe58S7rmNxicnrNr0fJSNZHAQADSnrHzZ Rke7bMjjUBNVEwCF35Pydsc7aSh8g/s+Q9/7XkR3SI1WXFc/BLIRvftNSq1t//C8aYDhH4XIMXp
 DEx29h0SvdQJCUDHf3jrg1WQ4zrxTwhStO7Ua8C//7RyDIEj+A+c7W8G5ofzXx7cVH+ahaV6L08 cAoc5WUeTCzuMzu9q1SVgwHzcTxh4r005wmyQ65myjW60WrlRqcT5hqoHgHaRjwNwZ6JLTLShfY qPKjoCzJtCpR8XkhFvRqCgd1+xH4LwK1DtA+FyCWkNrgojp5mX3A+KAXrde4jveL593ucyJvPrd
 yCqzksI5XciRJA0bDUgbYVw6Pjm1l46mOXhOUZiYqf2RwcP739sT1fBjUlEpul06pkYs+JRe
X-Proofpoint-ORIG-GUID: 6MrninVzziilGN6qAuA2Q89iHrV9CyWH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=999
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507020053
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 06:52:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219786

From: Divya Chellam <divya.chellam@windriver.com>

A vulnerability has been identified in the libarchive library. This flaw can be triggered whe
n file streams are piped into bsdtar, potentially allowing for reading past the end of the fi
le. This out-of-bounds read can lead to unintended consequences, including unpredictable prog
ram behavior, memory corruption, or a denial-of-service condition.

CVE-2025-5918-0001 is the dependent commit and CVE-2025-5918-0002 is the actual CVE fix.

Reference:
https://security-tracker.debian.org/tracker/CVE-2025-5918

Upstream-patches:
https://github.com/libarchive/libarchive/commit/89b8c35ff4b5addc08a85bf5df02b407f8af1f6c
https://github.com/libarchive/libarchive/commit/dcbf1e0ededa95849f098d154a25876ed5754bcf

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 .../libarchive/CVE-2025-5918-0001.patch       | 326 ++++++++++++++++++
 .../libarchive/CVE-2025-5918-0002.patch       | 222 ++++++++++++
 .../libarchive/libarchive_3.7.9.bb            |   2 +
 3 files changed, 550 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-5918-0001.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-5918-0002.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2025-5918-0001.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2025-5918-0001.patch
new file mode 100644
index 0000000000..b5586a46de
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2025-5918-0001.patch
@@ -0,0 +1,326 @@
+From 89b8c35ff4b5addc08a85bf5df02b407f8af1f6c Mon Sep 17 00:00:00 2001
+From: Tobias Stoeckmann <stoeckmann@users.noreply.github.com>
+Date: Sun, 6 Apr 2025 22:34:37 +0200
+Subject: [PATCH] Improve lseek handling (#2564)
+
+The skip functions are limited to 1 GB for cases in which libarchive
+runs on a system with an off_t or long with 32 bits. This has negative
+impact on 64 bit systems.
+
+Instead, make sure that _all_ subsequent functions truncate properly.
+Some of them already did and some had regressions for over 10 years.
+
+Tests pass on Debian 12 i686 configured with --disable-largefile, i.e.
+running with an off_t with 32 bits.
+
+Casts added where needed to still pass MSVC builds.
+
+---------
+
+Signed-off-by: Tobias Stoeckmann <tobias@stoeckmann.org>
+
+CVE: CVE-2025-5918
+
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/89b8c35ff4b5addc08a85bf5df02b407f8af1f6c]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ libarchive/archive_read.c               |  6 ----
+ libarchive/archive_read_disk_posix.c    |  3 +-
+ libarchive/archive_read_open_fd.c       | 29 +++++++++++++------
+ libarchive/archive_read_open_file.c     | 35 ++++++++++++-----------
+ libarchive/archive_read_open_filename.c | 37 ++++++++++++++++++-------
+ libarchive/test/read_open_memory.c      |  2 +-
+ libarchive/test/test_sparse_basic.c     |  6 ++--
+ libarchive/test/test_tar_large.c        |  2 +-
+ 8 files changed, 75 insertions(+), 45 deletions(-)
+
+diff --git a/libarchive/archive_read.c b/libarchive/archive_read.c
+index 822c534..50db870 100644
+--- a/libarchive/archive_read.c
++++ b/libarchive/archive_read.c
+@@ -176,15 +176,9 @@ client_skip_proxy(struct archive_read_filter *self, int64_t request)
+ 		return 0;
+ 
+ 	if (self->archive->client.skipper != NULL) {
+-		/* Seek requests over 1GiB are broken down into
+-		 * multiple seeks.  This avoids overflows when the
+-		 * requests get passed through 32-bit arguments. */
+-		int64_t skip_limit = (int64_t)1 << 30;
+ 		int64_t total = 0;
+ 		for (;;) {
+ 			int64_t get, ask = request;
+-			if (ask > skip_limit)
+-				ask = skip_limit;
+ 			get = (self->archive->client.skipper)
+ 				(&self->archive->archive, self->data, ask);
+ 			total += get;
+diff --git a/libarchive/archive_read_disk_posix.c b/libarchive/archive_read_disk_posix.c
+index 09965eb..4839d62 100644
+--- a/libarchive/archive_read_disk_posix.c
++++ b/libarchive/archive_read_disk_posix.c
+@@ -778,7 +778,8 @@ _archive_read_data_block(struct archive *_a, const void **buff,
+ 	 */
+ 	if (t->current_sparse->offset > t->entry_total) {
+ 		if (lseek(t->entry_fd,
+-		    (off_t)t->current_sparse->offset, SEEK_SET) < 0) {
++		    (off_t)t->current_sparse->offset, SEEK_SET) !=
++		    t->current_sparse->offset) {
+ 			archive_set_error(&a->archive, errno, "Seek error");
+ 			r = ARCHIVE_FATAL;
+ 			a->archive.state = ARCHIVE_STATE_FATAL;
+diff --git a/libarchive/archive_read_open_fd.c b/libarchive/archive_read_open_fd.c
+index debfde2..3fd536d 100644
+--- a/libarchive/archive_read_open_fd.c
++++ b/libarchive/archive_read_open_fd.c
+@@ -131,7 +131,7 @@ static int64_t
+ file_skip(struct archive *a, void *client_data, int64_t request)
+ {
+ 	struct read_fd_data *mine = (struct read_fd_data *)client_data;
+-	int64_t skip = request;
++	off_t skip = (off_t)request;
+ 	int64_t old_offset, new_offset;
+ 	int skip_bits = sizeof(skip) * 8 - 1;  /* off_t is a signed type. */
+ 
+@@ -140,15 +140,15 @@ file_skip(struct archive *a, void *client_data, int64_t request)
+ 
+ 	/* Reduce a request that would overflow the 'skip' variable. */
+ 	if (sizeof(request) > sizeof(skip)) {
+-		int64_t max_skip =
++		const int64_t max_skip =
+ 		    (((int64_t)1 << (skip_bits - 1)) - 1) * 2 + 1;
+ 		if (request > max_skip)
+-			skip = max_skip;
++			skip = (off_t)max_skip;
+ 	}
+ 
+-	/* Reduce request to the next smallest multiple of block_size */
+-	request = (request / mine->block_size) * mine->block_size;
+-	if (request == 0)
++	/* Reduce 'skip' to the next smallest multiple of block_size */
++	skip = (off_t)(((int64_t)skip / mine->block_size) * mine->block_size);
++	if (skip == 0)
+ 		return (0);
+ 
+ 	if (((old_offset = lseek(mine->fd, 0, SEEK_CUR)) >= 0) &&
+@@ -178,11 +178,24 @@ static int64_t
+ file_seek(struct archive *a, void *client_data, int64_t request, int whence)
+ {
+ 	struct read_fd_data *mine = (struct read_fd_data *)client_data;
++	off_t seek = (off_t)request;
+ 	int64_t r;
++	int seek_bits = sizeof(seek) * 8 - 1;  /* off_t is a signed type. */
+ 
+ 	/* We use off_t here because lseek() is declared that way. */
+-	/* See above for notes about when off_t is less than 64 bits. */
+-	r = lseek(mine->fd, request, whence);
++
++	/* Reduce a request that would overflow the 'seek' variable. */
++	if (sizeof(request) > sizeof(seek)) {
++		const int64_t max_seek =
++		    (((int64_t)1 << (seek_bits - 1)) - 1) * 2 + 1;
++		const int64_t min_seek = ~max_seek;
++		if (request > max_seek)
++			seek = (off_t)max_seek;
++		else if (request < min_seek)
++			seek = (off_t)min_seek;
++	}
++
++	r = lseek(mine->fd, seek, whence);
+ 	if (r >= 0)
+ 		return r;
+ 
+diff --git a/libarchive/archive_read_open_file.c b/libarchive/archive_read_open_file.c
+index ecd56dc..2829b9a 100644
+--- a/libarchive/archive_read_open_file.c
++++ b/libarchive/archive_read_open_file.c
+@@ -145,7 +145,7 @@ FILE_skip(struct archive *a, void *client_data, int64_t request)
+ 
+ 	/* If request is too big for a long or an off_t, reduce it. */
+ 	if (sizeof(request) > sizeof(skip)) {
+-		int64_t max_skip =
++		const int64_t max_skip =
+ 		    (((int64_t)1 << (skip_bits - 1)) - 1) * 2 + 1;
+ 		if (request > max_skip)
+ 			skip = max_skip;
+@@ -176,39 +176,42 @@ FILE_seek(struct archive *a, void *client_data, int64_t request, int whence)
+ {
+ 	struct read_FILE_data *mine = (struct read_FILE_data *)client_data;
+ #if HAVE__FSEEKI64
+-	int64_t skip = request;
++	int64_t seek = request;
+ #elif HAVE_FSEEKO
+-	off_t skip = (off_t)request;
++	off_t seek = (off_t)request;
+ #else
+-	long skip = (long)request;
++	long seek = (long)request;
+ #endif
+-	int skip_bits = sizeof(skip) * 8 - 1;
++	int seek_bits = sizeof(seek) * 8 - 1;
+ 	(void)a; /* UNUSED */
+ 
+-	/* If request is too big for a long or an off_t, reduce it. */
+-	if (sizeof(request) > sizeof(skip)) {
+-		int64_t max_skip =
+-		    (((int64_t)1 << (skip_bits - 1)) - 1) * 2 + 1;
+-		if (request > max_skip)
+-			skip = max_skip;
++	/* Reduce a request that would overflow the 'seek' variable. */
++	if (sizeof(request) > sizeof(seek)) {
++		const int64_t max_seek =
++		    (((int64_t)1 << (seek_bits - 1)) - 1) * 2 + 1;
++		const int64_t min_seek = ~max_seek;
++		if (request > max_seek)
++			seek = max_seek;
++		else if (request < min_seek)
++			seek = min_seek;
+ 	}
+ 
+ #ifdef __ANDROID__
+ 	/* Newer Android versions have fseeko...to meditate. */
+-	int64_t ret = lseek(fileno(mine->f), skip, whence);
++	int64_t ret = lseek(fileno(mine->f), seek, whence);
+ 	if (ret >= 0) {
+ 		return ret;
+ 	}
+ #elif HAVE__FSEEKI64
+-	if (_fseeki64(mine->f, skip, whence) == 0) {
++	if (_fseeki64(mine->f, seek, whence) == 0) {
+ 		return _ftelli64(mine->f);
+ 	}
+ #elif HAVE_FSEEKO
+-	if (fseeko(mine->f, skip, whence) == 0) {
++	if (fseeko(mine->f, seek, whence) == 0) {
+ 		return ftello(mine->f);
+ 	}
+ #else
+-	if (fseek(mine->f, skip, whence) == 0) {
++	if (fseek(mine->f, seek, whence) == 0) {
+ 		return ftell(mine->f);
+ 	}
+ #endif
+@@ -226,4 +229,4 @@ FILE_close(struct archive *a, void *client_data)
+ 	free(mine->buffer);
+ 	free(mine);
+ 	return (ARCHIVE_OK);
+-}
+\ No newline at end of file
++}
+diff --git a/libarchive/archive_read_open_filename.c b/libarchive/archive_read_open_filename.c
+index 05f0ffb..3894b15 100644
+--- a/libarchive/archive_read_open_filename.c
++++ b/libarchive/archive_read_open_filename.c
+@@ -479,20 +479,24 @@ file_skip_lseek(struct archive *a, void *client_data, int64_t request)
+ 	struct read_file_data *mine = (struct read_file_data *)client_data;
+ #if defined(_WIN32) && !defined(__CYGWIN__)
+ 	/* We use _lseeki64() on Windows. */
+-	int64_t old_offset, new_offset;
++	int64_t old_offset, new_offset, skip = request;
+ #else
+-	off_t old_offset, new_offset;
++	off_t old_offset, new_offset, skip = (off_t)request;
+ #endif
++	int skip_bits = sizeof(skip) * 8 - 1;
+ 
+ 	/* We use off_t here because lseek() is declared that way. */
+ 
+-	/* TODO: Deal with case where off_t isn't 64 bits.
+-	 * This shouldn't be a problem on Linux or other POSIX
+-	 * systems, since the configuration logic for libarchive
+-	 * tries to obtain a 64-bit off_t.
+-	 */
++	/* Reduce a request that would overflow the 'skip' variable. */
++	if (sizeof(request) > sizeof(skip)) {
++		const int64_t max_skip =
++		    (((int64_t)1 << (skip_bits - 1)) - 1) * 2 + 1;
++		if (request > max_skip)
++			skip = max_skip;
++	}
++
+ 	if ((old_offset = lseek(mine->fd, 0, SEEK_CUR)) >= 0 &&
+-	    (new_offset = lseek(mine->fd, request, SEEK_CUR)) >= 0)
++	    (new_offset = lseek(mine->fd, skip, SEEK_CUR)) >= 0)
+ 		return (new_offset - old_offset);
+ 
+ 	/* If lseek() fails, don't bother trying again. */
+@@ -540,11 +544,24 @@ static int64_t
+ file_seek(struct archive *a, void *client_data, int64_t request, int whence)
+ {
+ 	struct read_file_data *mine = (struct read_file_data *)client_data;
++	off_t seek = (off_t)request;
+ 	int64_t r;
++	int seek_bits = sizeof(seek) * 8 - 1;
+ 
+ 	/* We use off_t here because lseek() is declared that way. */
+-	/* See above for notes about when off_t is less than 64 bits. */
+-	r = lseek(mine->fd, request, whence);
++
++	/* Reduce a request that would overflow the 'seek' variable. */
++	if (sizeof(request) > sizeof(seek)) {
++		const int64_t max_seek =
++		    (((int64_t)1 << (seek_bits - 1)) - 1) * 2 + 1;
++		const int64_t min_seek = ~max_seek;
++		if (request > max_seek)
++			seek = (off_t)max_seek;
++		else if (request < min_seek)
++			seek = (off_t)min_seek;
++	}
++
++	r = lseek(mine->fd, seek, whence);
+ 	if (r >= 0)
+ 		return r;
+ 
+diff --git a/libarchive/test/read_open_memory.c b/libarchive/test/read_open_memory.c
+index 6d2468c..9262ab9 100644
+--- a/libarchive/test/read_open_memory.c
++++ b/libarchive/test/read_open_memory.c
+@@ -167,7 +167,7 @@ memory_read_skip(struct archive *a, void *client_data, int64_t skip)
+ 
+ 	(void)a; /* UNUSED */
+ 	/* We can't skip by more than is available. */
+-	if ((off_t)skip > (off_t)(mine->end - mine->p))
++	if (skip > mine->end - mine->p)
+ 		skip = mine->end - mine->p;
+ 	/* Always do small skips by prime amounts. */
+ 	if (skip > 71)
+diff --git a/libarchive/test/test_sparse_basic.c b/libarchive/test/test_sparse_basic.c
+index 23cde56..93710cb 100644
+--- a/libarchive/test/test_sparse_basic.c
++++ b/libarchive/test/test_sparse_basic.c
+@@ -608,7 +608,8 @@ DEFINE_TEST(test_sparse_basic)
+ 	verify_sparse_file(a, "file2", sparse_file2, 20);
+ 	/* Encoded non sparse; expect a data block but no sparse entries. */
+ 	verify_sparse_file(a, "file3", sparse_file3, 0);
+-	verify_sparse_file(a, "file4", sparse_file4, 2);
++	if (sizeof(off_t) > 4)
++		verify_sparse_file(a, "file4", sparse_file4, 2);
+ 
+ 	assertEqualInt(ARCHIVE_OK, archive_read_free(a));
+ 
+@@ -635,7 +636,8 @@ DEFINE_TEST(test_sparse_basic)
+ 	verify_sparse_file(a, "file1", sparse_file1, 0);
+ 	verify_sparse_file(a, "file2", sparse_file2, 0);
+ 	verify_sparse_file(a, "file3", sparse_file3, 0);
+-	verify_sparse_file(a, "file4", sparse_file4, 0);
++	if (sizeof(off_t) > 4)
++		verify_sparse_file(a, "file4", sparse_file4, 0);
+ 
+ 	assertEqualInt(ARCHIVE_OK, archive_read_free(a));
+ 
+diff --git a/libarchive/test/test_tar_large.c b/libarchive/test/test_tar_large.c
+index c1f3791..1cde321 100644
+--- a/libarchive/test/test_tar_large.c
++++ b/libarchive/test/test_tar_large.c
+@@ -175,7 +175,7 @@ memory_read_skip(struct archive *a, void *_private, int64_t skip)
+ 	}
+ 	if (private->filebytes > 0) {
+ 		if (private->filebytes < skip)
+-			skip = (off_t)private->filebytes;
++			skip = private->filebytes;
+ 		private->filebytes -= skip;
+ 	} else {
+ 		skip = 0;
+-- 
+2.40.0
+
diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2025-5918-0002.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2025-5918-0002.patch
new file mode 100644
index 0000000000..a5fb33c8f1
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2025-5918-0002.patch
@@ -0,0 +1,222 @@
+From dcbf1e0ededa95849f098d154a25876ed5754bcf Mon Sep 17 00:00:00 2001
+From: Tobias Stoeckmann <stoeckmann@users.noreply.github.com>
+Date: Tue, 15 Apr 2025 06:02:17 +0200
+Subject: [PATCH] Do not skip past EOF while reading (#2584)
+
+Make sure to not skip past end of file for better error messages. One
+such example is now visible with rar testsuite. You can see the
+difference already by an actually not useless use of cat:
+
+```
+$ cat .../test_read_format_rar_ppmd_use_after_free.rar | bsdtar -t
+bsdtar: Archive entry has empty or unreadable filename ... skipping.
+bsdtar: Archive entry has empty or unreadable filename ... skipping.
+bsdtar: Truncated input file (needed 119 bytes, only 0 available)
+bsdtar: Error exit delayed from previous errors.
+```
+
+compared to
+
+```
+$ bsdtar -tf .../test_read_format_rar_ppmd_use_after_free.rar
+bsdtar: Archive entry has empty or unreadable filename ... skipping.
+bsdtar: Archive entry has empty or unreadable filename ... skipping.
+bsdtar: Error exit delayed from previous errors.
+```
+
+Since the former cannot lseek, the error is a different one
+(ARCHIVE_FATAL vs ARCHIVE_EOF). The piped version states explicitly that
+truncation occurred, while the latter states EOF because the skip past
+the end of file was successful.
+
+Signed-off-by: Tobias Stoeckmann <tobias@stoeckmann.org>
+
+CVE: CVE-2025-5918
+
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/dcbf1e0ededa95849f098d154a25876ed5754bcf]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ libarchive/archive_read_open_fd.c       | 13 +++++++---
+ libarchive/archive_read_open_file.c     | 33 +++++++++++++++++++------
+ libarchive/archive_read_open_filename.c | 16 +++++++++---
+ libarchive/test/test_read_format_rar.c  |  6 ++---
+ 4 files changed, 50 insertions(+), 18 deletions(-)
+
+diff --git a/libarchive/archive_read_open_fd.c b/libarchive/archive_read_open_fd.c
+index 3fd536d..dc7c9e5 100644
+--- a/libarchive/archive_read_open_fd.c
++++ b/libarchive/archive_read_open_fd.c
+@@ -52,6 +52,7 @@
+ struct read_fd_data {
+ 	int	 fd;
+ 	size_t	 block_size;
++	int64_t	 size;
+ 	char	 use_lseek;
+ 	void	*buffer;
+ };
+@@ -95,6 +96,7 @@ archive_read_open_fd(struct archive *a, int fd, size_t block_size)
+ 	if (S_ISREG(st.st_mode)) {
+ 		archive_read_extract_set_skip_file(a, st.st_dev, st.st_ino);
+ 		mine->use_lseek = 1;
++		mine->size = st.st_size;
+ 	}
+ #if defined(__CYGWIN__) || defined(_WIN32)
+ 	setmode(mine->fd, O_BINARY);
+@@ -151,9 +153,14 @@ file_skip(struct archive *a, void *client_data, int64_t request)
+ 	if (skip == 0)
+ 		return (0);
+ 
+-	if (((old_offset = lseek(mine->fd, 0, SEEK_CUR)) >= 0) &&
+-	    ((new_offset = lseek(mine->fd, skip, SEEK_CUR)) >= 0))
+-		return (new_offset - old_offset);
++	if ((old_offset = lseek(mine->fd, 0, SEEK_CUR)) >= 0) {
++		if (old_offset >= mine->size ||
++		    skip > mine->size - old_offset) {
++			/* Do not seek past end of file. */
++			errno = ESPIPE;
++		} else if ((new_offset = lseek(mine->fd, skip, SEEK_CUR)) >= 0)
++			return (new_offset - old_offset);
++	}
+ 
+ 	/* If seek failed once, it will probably fail again. */
+ 	mine->use_lseek = 0;
+diff --git a/libarchive/archive_read_open_file.c b/libarchive/archive_read_open_file.c
+index 2829b9a..6ed18a0 100644
+--- a/libarchive/archive_read_open_file.c
++++ b/libarchive/archive_read_open_file.c
+@@ -52,6 +52,7 @@
+ struct read_FILE_data {
+ 	FILE    *f;
+ 	size_t	 block_size;
++	int64_t	 size;
+ 	void	*buffer;
+ 	char	 can_skip;
+ };
+@@ -91,6 +92,7 @@ archive_read_open_FILE(struct archive *a, FILE *f)
+ 		archive_read_extract_set_skip_file(a, st.st_dev, st.st_ino);
+ 		/* Enable the seek optimization only for regular files. */
+ 		mine->can_skip = 1;
++		mine->size = st.st_size;
+ 	}
+ 
+ #if defined(__CYGWIN__) || defined(_WIN32)
+@@ -130,6 +132,7 @@ FILE_skip(struct archive *a, void *client_data, int64_t request)
+ #else
+ 	long skip = (long)request;
+ #endif
++	int64_t old_offset, new_offset;
+ 	int skip_bits = sizeof(skip) * 8 - 1;
+ 
+ 	(void)a; /* UNUSED */
+@@ -153,19 +156,33 @@ FILE_skip(struct archive *a, void *client_data, int64_t request)
+ 
+ #ifdef __ANDROID__
+         /* fileno() isn't safe on all platforms ... see above. */
+-	if (lseek(fileno(mine->f), skip, SEEK_CUR) < 0)
++	old_offset = lseek(fileno(mine->f), 0, SEEK_CUR);
+ #elif HAVE__FSEEKI64
+-	if (_fseeki64(mine->f, skip, SEEK_CUR) != 0)
++	old_offset = _ftelli64(mine->f);
+ #elif HAVE_FSEEKO
+-	if (fseeko(mine->f, skip, SEEK_CUR) != 0)
++	old_offset = ftello(mine->f);
+ #else
+-	if (fseek(mine->f, skip, SEEK_CUR) != 0)
++	old_offset = ftell(mine->f);
+ #endif
+-	{
+-		mine->can_skip = 0;
+-		return (0);
++	if (old_offset >= 0) {
++		if (old_offset < mine->size &&
++		    skip <= mine->size - old_offset) {
++#ifdef __ANDROID__
++			new_offset = lseek(fileno(mine->f), skip, SEEK_CUR);
++#elif HAVE__FSEEKI64
++			new_offset = _fseeki64(mine->f, skip, SEEK_CUR);
++#elif HAVE_FSEEKO
++			new_offset = fseeko(mine->f, skip, SEEK_CUR);
++#else
++			new_offset = fseek(mine->f, skip, SEEK_CUR);
++#endif
++			if (new_offset >= 0)
++				return (new_offset - old_offset);
++		}
+ 	}
+-	return (request);
++
++	mine->can_skip = 0;
++	return (0);
+ }
+ 
+ /*
+diff --git a/libarchive/archive_read_open_filename.c b/libarchive/archive_read_open_filename.c
+index 3894b15..5f5b3f1 100644
+--- a/libarchive/archive_read_open_filename.c
++++ b/libarchive/archive_read_open_filename.c
+@@ -74,6 +74,7 @@ struct read_file_data {
+ 	size_t	 block_size;
+ 	void	*buffer;
+ 	mode_t	 st_mode;  /* Mode bits for opened file. */
++	int64_t	 size;
+ 	char	 use_lseek;
+ 	enum fnt_e { FNT_STDIN, FNT_MBS, FNT_WCS } filename_type;
+ 	union {
+@@ -400,8 +401,10 @@ file_open(struct archive *a, void *client_data)
+ 	mine->st_mode = st.st_mode;
+ 
+ 	/* Disk-like inputs can use lseek(). */
+-	if (is_disk_like)
++	if (is_disk_like) {
+ 		mine->use_lseek = 1;
++		mine->size = st.st_size;
++	}
+ 
+ 	return (ARCHIVE_OK);
+ fail:
+@@ -495,9 +498,14 @@ file_skip_lseek(struct archive *a, void *client_data, int64_t request)
+ 			skip = max_skip;
+ 	}
+ 
+-	if ((old_offset = lseek(mine->fd, 0, SEEK_CUR)) >= 0 &&
+-	    (new_offset = lseek(mine->fd, skip, SEEK_CUR)) >= 0)
+-		return (new_offset - old_offset);
++	if ((old_offset = lseek(mine->fd, 0, SEEK_CUR)) >= 0) {
++		if (old_offset >= mine->size ||
++		    skip > mine->size - old_offset) {
++			/* Do not seek past end of file. */
++			errno = ESPIPE;
++		} else if ((new_offset = lseek(mine->fd, skip, SEEK_CUR)) >= 0)
++			return (new_offset - old_offset);
++	}
+ 
+ 	/* If lseek() fails, don't bother trying again. */
+ 	mine->use_lseek = 0;
+diff --git a/libarchive/test/test_read_format_rar.c b/libarchive/test/test_read_format_rar.c
+index dce567a..fce44a9 100644
+--- a/libarchive/test/test_read_format_rar.c
++++ b/libarchive/test/test_read_format_rar.c
+@@ -3829,8 +3829,8 @@ DEFINE_TEST(test_read_format_rar_ppmd_use_after_free)
+   assertA(ARCHIVE_OK == archive_read_next_header(a, &ae));
+   assertA(archive_read_data(a, buf, sizeof(buf)) <= 0);
+ 
+-  /* Test EOF */
+-  assertA(1 == archive_read_next_header(a, &ae));
++  /* Test for truncation */
++  assertA(ARCHIVE_FATAL == archive_read_next_header(a, &ae));
+ 
+   assertEqualIntA(a, ARCHIVE_OK, archive_read_close(a));
+   assertEqualInt(ARCHIVE_OK, archive_read_free(a));
+@@ -3856,7 +3856,7 @@ DEFINE_TEST(test_read_format_rar_ppmd_use_after_free2)
+   assertA(archive_read_data(a, buf, sizeof(buf)) <= 0);
+ 
+   /* Test EOF */
+-  assertA(1 == archive_read_next_header(a, &ae));
++  assertA(ARCHIVE_FATAL == archive_read_next_header(a, &ae));
+ 
+   assertEqualIntA(a, ARCHIVE_OK, archive_read_close(a));
+   assertEqualInt(ARCHIVE_OK, archive_read_free(a));
+-- 
+2.40.0
+
diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
index bb8609dd09..f08673ea3b 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
@@ -35,6 +35,8 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://CVE-2025-5915.patch \
            file://CVE-2025-5916.patch \
            file://CVE-2025-5917.patch \
+           file://CVE-2025-5918-0001.patch \
+           file://CVE-2025-5918-0002.patch \
            "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-- 
2.40.0


