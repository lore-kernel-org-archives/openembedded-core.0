Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 389A8C27C5F
	for <webhook@archiver.kernel.org>; Fri,  7 Jun 2024 12:41:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.40918.1717764102043972120
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jun 2024 05:41:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6888d63cd4=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4576xUHT026914
	for <openembedded-core@lists.openembedded.org>; Fri, 7 Jun 2024 12:41:41 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yfruxectj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 07 Jun 2024 12:41:41 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 05:41:38 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][scarthgap][PATCH 1/1] util-linux: Fix CVE-2024-28085
Date: Fri, 7 Jun 2024 12:41:23 +0000
Message-ID: <20240607124123.3645930-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: -3hDzVOIqIqeswC9NW559XCmySSlkF4s
X-Proofpoint-GUID: -3hDzVOIqIqeswC9NW559XCmySSlkF4s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-07_06,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 spamscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406070092
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jun 2024 12:41:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200440

From: Soumya Sambu <soumya.sambu@windriver.com>

wall in util-linux through 2.40, often installed with setgid
tty permissions, allows escape sequences to be sent to other
users' terminals through argv. (Specifically, escape sequences
received from stdin are blocked, but escape sequences received
from argv are not blocked.) There may be plausible scenarios
where this leads to account takeover.

References:
https://nvd.nist.gov/vuln/detail/CVE-2024-28085

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 meta/recipes-core/util-linux/util-linux.inc   |  2 ++
 .../util-linux/CVE-2024-28085-0001.patch      | 36 +++++++++++++++++++
 .../util-linux/CVE-2024-28085-0002.patch      | 34 ++++++++++++++++++
 3 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2024-28085-0001.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2024-28085-0002.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index d506783f9a..48520ef951 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -40,6 +40,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://avoid_parallel_tests.patch \
            file://0001-login-utils-include-libgen.h-for-basename-API.patch \
            file://fcntl-lock.c \
+           file://CVE-2024-28085-0001.patch \
+           file://CVE-2024-28085-0002.patch \
            "
 
 SRC_URI[sha256sum] = "7b6605e48d1a49f43cc4b4cfc59f313d0dd5402fa40b96810bd572e167dfed0f"
diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-0001.patch b/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-0001.patch
new file mode 100644
index 0000000000..af39931b3f
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-0001.patch
@@ -0,0 +1,36 @@
+From 07f0f0f5bd1e5e2268257ae1ff6d76a9b6c6ea8b Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Wed, 17 Jan 2024 12:37:08 +0100
+Subject: [PATCH] wall: fix calloc cal [-Werror=calloc-transposed-args]
+
+term-utils/wall.c:143:37: error: xcalloc sizes specified with sizeof in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
+  143 |         buf->groups = xcalloc(sizeof(*buf->groups), buf->ngroups);
+      |                                     ^
+term-utils/wall.c:143:37: note: earlier argument should specify number of elements, later size of each element
+
+Signed-off-by: Karel Zak <kzak@redhat.com>
+
+CVE: CVE-2024-28085
+
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/07f0f0f5bd1e5e2268257ae1ff6d76a9b6c6ea8b]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ term-utils/wall.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/term-utils/wall.c b/term-utils/wall.c
+index 377db45..85c006a 100644
+--- a/term-utils/wall.c
++++ b/term-utils/wall.c
+@@ -135,7 +135,7 @@ static struct group_workspace *init_group_workspace(const char *group)
+
+	buf->requested_group = get_group_gid(group);
+	buf->ngroups = sysconf(_SC_NGROUPS_MAX) + 1;  /* room for the primary gid */
+-	buf->groups = xcalloc(sizeof(*buf->groups), buf->ngroups);
++	buf->groups = xcalloc(buf->ngroups, sizeof(*buf->groups));
+
+	return buf;
+ }
+--
+2.40.0
diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-0002.patch b/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-0002.patch
new file mode 100644
index 0000000000..a2b914d580
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-0002.patch
@@ -0,0 +1,34 @@
+From 404b0781f52f7c045ca811b2dceec526408ac253 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Thu, 21 Mar 2024 11:16:20 +0100
+Subject: [PATCH] wall: fix escape sequence Injection [CVE-2024-28085]
+
+Let's use for all cases the same output function.
+
+Reported-by: Skyler Ferrante <sjf5462@rit.edu>
+Signed-off-by: Karel Zak <kzak@redhat.com>
+
+CVE: CVE-2024-28085
+
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/404b0781f52f7c045ca811b2dceec526408ac253]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ term-utils/wall.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/term-utils/wall.c b/term-utils/wall.c
+index 85c006a..0212c03 100644
+--- a/term-utils/wall.c
++++ b/term-utils/wall.c
+@@ -328,7 +328,7 @@ static char *makemsg(char *fname, char **mvec, int mvecsz,
+		int i;
+
+		for (i = 0; i < mvecsz; i++) {
+-			fputs(mvec[i], fs);
++			fputs_careful(mvec[i], fs, '^', true, TERM_WIDTH);
+			if (i < mvecsz - 1)
+				fputc(' ', fs);
+		}
+--
+2.40.0
-- 
2.40.0


