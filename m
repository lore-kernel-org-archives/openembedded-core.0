Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F9BBC02183
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 15:15:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.51697.1737040514333111918
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jan 2025 07:15:14 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=311110a243=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50G5BLYD023508
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 15:15:13 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443dv15rss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 15:15:13 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 16 Jan 2025 07:15:12 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 16 Jan 2025 07:15:10 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH 1/6] rsync: fix CVE-2024-12084
Date: Thu, 16 Jan 2025 15:15:04 +0000
Message-ID: <20250116151509.1939178-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: ka0jv83scHeuDkDWMqUMRI4-YXD6A2_A
X-Authority-Analysis: v=2.4 cv=N5zTF39B c=1 sm=1 tr=0 ts=67892281 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VdSt8ZQiCzkA:10 a=hGzw-44bAAAA:8 a=t7CeM3EgAAAA:8 a=KrHTQlyhAAAA:8 a=M98Jb2jFlnBTcjZXD7UA:9 a=HvKuF1_PTVFglORKqfwH:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=NeM01qLVy57-G_-UPP7B:22
X-Proofpoint-ORIG-GUID: ka0jv83scHeuDkDWMqUMRI4-YXD6A2_A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_06,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 clxscore=1015
 suspectscore=0 bulkscore=0 mlxscore=0 phishscore=0 spamscore=0
 impostorscore=0 malwarescore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2411120000
 definitions=main-2501160115
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 15:15:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209953

From: Archana Polampalli <archana.polampalli@windriver.com>

A heap-based buffer overflow flaw was found in the rsync daemon. This issue is due
to improper handling of attacker-controlled checksum lengths (s2length) in the code.
When MAX_DIGEST_LEN exceeds the fixed SUM_LENGTH (16 bytes), an attacker can write
out of bounds in the sum2 buffer.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../rsync/files/CVE-2024-12084-0001.patch     | 156 ++++++++++++++++++
 .../rsync/files/CVE-2024-12084-0002.patch     |  43 +++++
 meta/recipes-devtools/rsync/rsync_3.2.7.bb    |   2 +
 3 files changed, 201 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12084-0001.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12084-0002.patch

diff --git a/meta/recipes-devtools/rsync/files/CVE-2024-12084-0001.patch b/meta/recipes-devtools/rsync/files/CVE-2024-12084-0001.patch
new file mode 100644
index 0000000000..d654067fab
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2024-12084-0001.patch
@@ -0,0 +1,156 @@
+From 0902b52f6687b1f7952422080d50b93108742e53 Mon Sep 17 00:00:00 2001
+From: Wayne Davison <wayne@opencoder.net>
+Date: Tue, 29 Oct 2024 22:55:29 -0700
+Subject: [PATCH] Some checksum buffer fixes.
+
+- Put sum2_array into sum_struct to hold an array of sum2 checksums
+  that are each xfer_sum_len bytes.
+- Remove sum2 buf from sum_buf.
+- Add macro sum2_at() to access each sum2 array element.
+- Throw an error if a sums header has an s2length larger than
+  xfer_sum_len.
+
+CVE: CVE-2024-12084
+
+Upstream-Status: Backport [https://git.samba.org/?p=rsync.git;a=commit;h=0902b52f6687b1f7952422080d50b93108742e53]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ io.c     | 3 ++-
+ match.c  | 8 ++++----
+ rsync.c  | 5 ++++-
+ rsync.h  | 4 +++-
+ sender.c | 4 +++-
+ 5 files changed, 16 insertions(+), 8 deletions(-)
+
+diff --git a/io.c b/io.c
+index a99ac0ec..bb60eeca 100644
+--- a/io.c
++++ b/io.c
+@@ -55,6 +55,7 @@ extern int read_batch;
+ extern int compat_flags;
+ extern int protect_args;
+ extern int checksum_seed;
++extern int xfer_sum_len;
+ extern int daemon_connection;
+ extern int protocol_version;
+ extern int remove_source_files;
+@@ -1977,7 +1978,7 @@ void read_sum_head(int f, struct sum_struct *sum)
+		exit_cleanup(RERR_PROTOCOL);
+	}
+	sum->s2length = protocol_version < 27 ? csum_length : (int)read_int(f);
+-	if (sum->s2length < 0 || sum->s2length > MAX_DIGEST_LEN) {
++	if (sum->s2length < 0 || sum->s2length > xfer_sum_len) {
+		rprintf(FERROR, "Invalid checksum length %d [%s]\n",
+			sum->s2length, who_am_i());
+		exit_cleanup(RERR_PROTOCOL);
+diff --git a/match.c b/match.c
+index cdb30a15..36e78ed2 100644
+--- a/match.c
++++ b/match.c
+@@ -232,7 +232,7 @@ static void hash_search(int f,struct sum_struct *s,
+				done_csum2 = 1;
+			}
+
+-			if (memcmp(sum2,s->sums[i].sum2,s->s2length) != 0) {
++			if (memcmp(sum2, sum2_at(s, i), s->s2length) != 0) {
+				false_alarms++;
+				continue;
+			}
+@@ -252,7 +252,7 @@ static void hash_search(int f,struct sum_struct *s,
+					if (i != aligned_i) {
+						if (sum != s->sums[aligned_i].sum1
+						 || l != s->sums[aligned_i].len
+-						 || memcmp(sum2, s->sums[aligned_i].sum2, s->s2length) != 0)
++						 || memcmp(sum2, sum2_at(s, aligned_i), s->s2length) != 0)
+							goto check_want_i;
+						i = aligned_i;
+					}
+@@ -271,7 +271,7 @@ static void hash_search(int f,struct sum_struct *s,
+						if (sum != s->sums[i].sum1)
+							goto check_want_i;
+						get_checksum2((char *)map, l, sum2);
+-						if (memcmp(sum2, s->sums[i].sum2, s->s2length) != 0)
++						if (memcmp(sum2, sum2_at(s, i), s->s2length) != 0)
+							goto check_want_i;
+						/* OK, we have a re-alignment match.  Bump the offset
+						 * forward to the new match point. */
+@@ -290,7 +290,7 @@ static void hash_search(int f,struct sum_struct *s,
+			 && (!updating_basis_file || s->sums[want_i].offset >= offset
+			  || s->sums[want_i].flags & SUMFLG_SAME_OFFSET)
+			 && sum == s->sums[want_i].sum1
+-			 && memcmp(sum2, s->sums[want_i].sum2, s->s2length) == 0) {
++			 && memcmp(sum2, sum2_at(s, want_i), s->s2length) == 0) {
+				/* we've found an adjacent match - the RLL coder
+				 * will be happy */
+				i = want_i;
+diff --git a/rsync.c b/rsync.c
+index cd288f57..b130aba5 100644
+--- a/rsync.c
++++ b/rsync.c
+@@ -437,7 +437,10 @@ int read_ndx_and_attrs(int f_in, int f_out, int *iflag_ptr, uchar *type_ptr, cha
+   */
+ void free_sums(struct sum_struct *s)
+ {
+-	if (s->sums) free(s->sums);
++	if (s->sums) {
++		free(s->sums);
++		free(s->sum2_array);
++	}
+	free(s);
+ }
+
+diff --git a/rsync.h b/rsync.h
+index d3709fe0..8ddbe702 100644
+--- a/rsync.h
++++ b/rsync.h
+@@ -958,12 +958,12 @@ struct sum_buf {
+	uint32 sum1;	        /**< simple checksum */
+	int32 chain;		/**< next hash-table collision */
+	short flags;		/**< flag bits */
+-	char sum2[SUM_LENGTH];	/**< checksum  */
+ };
+
+ struct sum_struct {
+	OFF_T flength;		/**< total file length */
+	struct sum_buf *sums;	/**< points to info for each chunk */
++	char *sum2_array;	/**< checksums of length xfer_sum_len */
+	int32 count;		/**< how many chunks */
+	int32 blength;		/**< block_length */
+	int32 remainder;	/**< flength % block_length */
+@@ -982,6 +982,8 @@ struct map_struct {
+	int status;		/* first errno from read errors		*/
+ };
+
++#define sum2_at(s, i)	((s)->sum2_array + ((OFF_T)(i) * xfer_sum_len))
++
+ #define NAME_IS_FILE		(0)    /* filter name as a file */
+ #define NAME_IS_DIR		(1<<0) /* filter name as a dir */
+ #define NAME_IS_XATTR		(1<<2) /* filter name as an xattr */
+diff --git a/sender.c b/sender.c
+index 3d4f052e..ab205341 100644
+--- a/sender.c
++++ b/sender.c
+@@ -31,6 +31,7 @@ extern int log_before_transfer;
+ extern int stdout_format_has_i;
+ extern int logfile_format_has_i;
+ extern int want_xattr_optim;
++extern int xfer_sum_len;
+ extern int csum_length;
+ extern int append_mode;
+ extern int copy_links;
+@@ -94,10 +95,11 @@ static struct sum_struct *receive_sums(int f)
+		return(s);
+
+	s->sums = new_array(struct sum_buf, s->count);
++	s->sum2_array = new_array(char, s->count * xfer_sum_len);
+
+	for (i = 0; i < s->count; i++) {
+		s->sums[i].sum1 = read_int(f);
+-		read_buf(f, s->sums[i].sum2, s->s2length);
++		read_buf(f, sum2_at(s, i), s->s2length);
+
+		s->sums[i].offset = offset;
+		s->sums[i].flags = 0;
+--
+2.40.0
diff --git a/meta/recipes-devtools/rsync/files/CVE-2024-12084-0002.patch b/meta/recipes-devtools/rsync/files/CVE-2024-12084-0002.patch
new file mode 100644
index 0000000000..266b80c241
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2024-12084-0002.patch
@@ -0,0 +1,43 @@
+From 42e2b56c4ede3ab164f9a5c6dae02aa84606a6c1 Mon Sep 17 00:00:00 2001
+From: Wayne Davison <wayne@opencoder.net>
+Date: Tue, 5 Nov 2024 11:01:03 -0800
+Subject: [PATCH] Another cast when multiplying integers.
+
+CVE: CVE-2024-12084
+
+Upstream-Status: Backport [https://git.samba.org/?p=rsync.git;a=commit;h=42e2b56c4ede3ab164f9a5c6dae02aa84606a6c1]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ rsync.h  | 2 +-
+ sender.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/rsync.h b/rsync.h
+index 8ddbe702..0f9e277f 100644
+--- a/rsync.h
++++ b/rsync.h
+@@ -982,7 +982,7 @@ struct map_struct {
+	int status;		/* first errno from read errors		*/
+ };
+
+-#define sum2_at(s, i)	((s)->sum2_array + ((OFF_T)(i) * xfer_sum_len))
++#define sum2_at(s, i)	((s)->sum2_array + ((size_t)(i) * xfer_sum_len))
+
+ #define NAME_IS_FILE		(0)    /* filter name as a file */
+ #define NAME_IS_DIR		(1<<0) /* filter name as a dir */
+diff --git a/sender.c b/sender.c
+index ab205341..2bbff2fa 100644
+--- a/sender.c
++++ b/sender.c
+@@ -95,7 +95,7 @@ static struct sum_struct *receive_sums(int f)
+		return(s);
+
+	s->sums = new_array(struct sum_buf, s->count);
+-	s->sum2_array = new_array(char, s->count * xfer_sum_len);
++	s->sum2_array = new_array(char, (size_t)s->count * xfer_sum_len);
+
+	for (i = 0; i < s->count; i++) {
+		s->sums[i].sum1 = read_int(f);
+--
+2.40.0
diff --git a/meta/recipes-devtools/rsync/rsync_3.2.7.bb b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
index 130581a785..2f3ea61978 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.7.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
@@ -15,6 +15,8 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://makefile-no-rebuild.patch \
            file://determism.patch \
            file://0001-Add-missing-prototypes-to-function-declarations.patch \
+           file://CVE-2024-12084-0001.patch \
+           file://CVE-2024-12084-0002.patch \
            "
 SRC_URI[sha256sum] = "4e7d9d3f6ed10878c58c5fb724a67dacf4b6aac7340b13e488fb2dc41346f2bb"
 
-- 
2.40.0


