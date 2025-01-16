Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4539DC02183
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 15:51:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.52451.1737042692363928489
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jan 2025 07:51:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=311110a243=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50GDe2kQ023856
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 07:51:32 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443s1pncwr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 07:51:31 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 16 Jan 2025 07:51:31 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 16 Jan 2025 07:51:30 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 6/8] rsync: fix CVE-2024-12087
Date: Thu, 16 Jan 2025 15:51:17 +0000
Message-ID: <20250116155119.3867588-6-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250116155119.3867588-1-archana.polampalli@windriver.com>
References: <20250116155119.3867588-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=DdLtqutW c=1 sm=1 tr=0 ts=67892b03 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VdSt8ZQiCzkA:10 a=hGzw-44bAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=KrHTQlyhAAAA:8 a=oq-7gxcSAAAA:8 a=kmYkUENqAAAA:8
 a=wiWAKtjnS9dp6FeNCn0A:9 a=HvKuF1_PTVFglORKqfwH:22 a=FdTzh2GWekK77mhwV6Dw:22 a=NeM01qLVy57-G_-UPP7B:22 a=UIhn0zqP03opOuWSx-ON:22 a=p9kz6gysRiz6SGr9lVkz:22
X-Proofpoint-GUID: DBSVOi8HhApLku-RLSv7cDlJYYKT29m_
X-Proofpoint-ORIG-GUID: DBSVOi8HhApLku-RLSv7cDlJYYKT29m_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_06,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 mlxlogscore=759 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2501160119
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 15:51:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209964

From: Archana Polampalli <archana.polampalli@windriver.com>

A path traversal vulnerability exists in rsync. It stems from behavior enabled
by the `--inc-recursive` option, a default-enabled option for many client options
and can be enabled by the server even if not explicitly enabled by the client.
When using the `--inc-recursive` option, a lack of proper symlink verification
coupled with deduplication checks occurring on a per-file-list basis could allow
a server to write files outside of the client's intended destination directory.
A malicious server could write malicious files to arbitrary locations named after
valid directories/paths on the client.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../rsync/files/CVE-2024-12087-0001.patch     | 49 +++++++++++++++++++
 .../rsync/files/CVE-2024-12087-0002.patch     | 31 ++++++++++++
 .../rsync/files/CVE-2024-12087-0003.patch     | 40 +++++++++++++++
 meta/recipes-devtools/rsync/rsync_3.2.7.bb    |  3 ++
 4 files changed, 123 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12087-0001.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12087-0002.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12087-0003.patch

diff --git a/meta/recipes-devtools/rsync/files/CVE-2024-12087-0001.patch b/meta/recipes-devtools/rsync/files/CVE-2024-12087-0001.patch
new file mode 100644
index 0000000000..67abc64a62
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2024-12087-0001.patch
@@ -0,0 +1,49 @@
+From 688f5c379a433038bde36897a156d589be373a98 Mon Sep 17 00:00:00 2001
+From: Wayne Davison <wayne@opencoder.net>
+Date: Thu, 14 Nov 2024 15:46:50 -0800
+Subject: [PATCH] Refuse a duplicate dirlist.
+
+CVE: CVE-2024-12087
+
+Upstream-Status: Backport [https://git.samba.org/?p=rsync.git;a=commit;h=688f5c379a433038bde36897a156d589be373a98]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ flist.c | 9 +++++++++
+ rsync.h | 1 +
+ 2 files changed, 10 insertions(+)
+
+diff --git a/flist.c b/flist.c
+index 464d556e..847b1054 100644
+--- a/flist.c
++++ b/flist.c
+@@ -2584,6 +2584,15 @@ struct file_list *recv_file_list(int f, int dir_ndx)
+		init_hard_links();
+ #endif
+
++	if (inc_recurse && dir_ndx >= 0) {
++		struct file_struct *file = dir_flist->files[dir_ndx];
++		if (file->flags & FLAG_GOT_DIR_FLIST) {
++			rprintf(FERROR_XFER, "rsync: refusing malicious duplicate flist for dir %d\n", dir_ndx);
++			exit_cleanup(RERR_PROTOCOL);
++		}
++		file->flags |= FLAG_GOT_DIR_FLIST;
++	}
++
+	flist = flist_new(0, "recv_file_list");
+	flist_expand(flist, FLIST_START_LARGE);
+
+diff --git a/rsync.h b/rsync.h
+index 0f9e277f..b9a7101a 100644
+--- a/rsync.h
++++ b/rsync.h
+@@ -84,6 +84,7 @@
+ #define FLAG_DUPLICATE (1<<4)	/* sender */
+ #define FLAG_MISSING_DIR (1<<4)	/* generator */
+ #define FLAG_HLINKED (1<<5)	/* receiver/generator (checked on all types) */
++#define FLAG_GOT_DIR_FLIST (1<<5)/* sender/receiver/generator - dir_flist only */
+ #define FLAG_HLINK_FIRST (1<<6)	/* receiver/generator (w/FLAG_HLINKED) */
+ #define FLAG_IMPLIED_DIR (1<<6)	/* sender/receiver/generator (dirs only) */
+ #define FLAG_HLINK_LAST (1<<7)	/* receiver/generator */
+--
+2.40.0
diff --git a/meta/recipes-devtools/rsync/files/CVE-2024-12087-0002.patch b/meta/recipes-devtools/rsync/files/CVE-2024-12087-0002.patch
new file mode 100644
index 0000000000..8a22e0c371
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2024-12087-0002.patch
@@ -0,0 +1,31 @@
+From 344327385fa47fa5bb67a32c237735e6240cfb93 Mon Sep 17 00:00:00 2001
+From: Andrew Tridgell <andrew@tridgell.net>
+Date: Tue, 26 Nov 2024 16:12:45 +1100
+Subject: [PATCH] range check dir_ndx before use
+
+CVE: CVE-2024-12087
+
+Upstream-Status: Backport [https://git.samba.org/?p=rsync.git;a=commit;h=344327385fa47fa5bb67a32c237735e6240cfb93]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ flist.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/flist.c b/flist.c
+index 847b1054..087f9da6 100644
+--- a/flist.c
++++ b/flist.c
+@@ -2585,6 +2585,10 @@ struct file_list *recv_file_list(int f, int dir_ndx)
+ #endif
+
+	if (inc_recurse && dir_ndx >= 0) {
++		if (dir_ndx >= dir_flist->used) {
++			rprintf(FERROR_XFER, "rsync: refusing invalid dir_ndx %u >= %u\n", dir_ndx, dir_flist->used);
++			exit_cleanup(RERR_PROTOCOL);
++		}
+		struct file_struct *file = dir_flist->files[dir_ndx];
+		if (file->flags & FLAG_GOT_DIR_FLIST) {
+			rprintf(FERROR_XFER, "rsync: refusing malicious duplicate flist for dir %d\n", dir_ndx);
+--
+2.40.0
diff --git a/meta/recipes-devtools/rsync/files/CVE-2024-12087-0003.patch b/meta/recipes-devtools/rsync/files/CVE-2024-12087-0003.patch
new file mode 100644
index 0000000000..0ece69c4e7
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2024-12087-0003.patch
@@ -0,0 +1,40 @@
+From 996af4a79f9afe4d7158ecdd87c78cee382c6b39 Mon Sep 17 00:00:00 2001
+From: Natanael Copa <ncopa@alpinelinux.org>
+Date: Wed, 15 Jan 2025 15:10:24 +0100
+Subject: [PATCH] Fix FLAG_GOT_DIR_FLIST collission with FLAG_HLINKED
+
+fixes commit 688f5c379a43 (Refuse a duplicate dirlist.)
+
+Fixes: https://github.com/RsyncProject/rsync/issues/702
+Fixes: https://github.com/RsyncProject/rsync/issues/697
+CVE: CVE-2024-12087
+
+Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/996af4a79f9afe4d7158ecdd87c78cee382c6b39]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ rsync.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/rsync.h b/rsync.h
+index 9be1297b..479ac484 100644
+--- a/rsync.h
++++ b/rsync.h
+@@ -84,7 +84,6 @@
+ #define FLAG_DUPLICATE (1<<4)	/* sender */
+ #define FLAG_MISSING_DIR (1<<4)	/* generator */
+ #define FLAG_HLINKED (1<<5)	/* receiver/generator (checked on all types) */
+-#define FLAG_GOT_DIR_FLIST (1<<5)/* sender/receiver/generator - dir_flist only */
+ #define FLAG_HLINK_FIRST (1<<6)	/* receiver/generator (w/FLAG_HLINKED) */
+ #define FLAG_IMPLIED_DIR (1<<6)	/* sender/receiver/generator (dirs only) */
+ #define FLAG_HLINK_LAST (1<<7)	/* receiver/generator */
+@@ -93,6 +92,7 @@
+ #define FLAG_SKIP_GROUP (1<<10)	/* receiver/generator */
+ #define FLAG_TIME_FAILED (1<<11)/* generator */
+ #define FLAG_MOD_NSEC (1<<12)	/* sender/receiver/generator */
++#define FLAG_GOT_DIR_FLIST (1<<13)/* sender/receiver/generator - dir_flist only */
+
+ /* These flags are passed to functions but not stored. */
+
+--
+2.40.0
diff --git a/meta/recipes-devtools/rsync/rsync_3.2.7.bb b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
index b6baec63a2..bfbe97c57d 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.7.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
@@ -22,6 +22,9 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://CVE-2024-12086-0002.patch \
            file://CVE-2024-12086-0003.patch \
            file://CVE-2024-12086-0004.patch \
+           file://CVE-2024-12087-0001.patch \
+           file://CVE-2024-12087-0002.patch \
+           file://CVE-2024-12087-0003.patch \
            "
 
 SRC_URI[sha256sum] = "4e7d9d3f6ed10878c58c5fb724a67dacf4b6aac7340b13e488fb2dc41346f2bb"
-- 
2.40.0


