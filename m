Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5061C64EC4
	for <webhook@archiver.kernel.org>; Fri, 17 Feb 2023 23:01:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1780.1676674885463670722
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Feb 2023 15:01:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=E0I8oRbI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1412f5127e=joe.slater@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31HID92Z010666
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Feb 2023 15:01:25 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PPS06212021;
 bh=H4U8PbKXggIqfXKFbInDCKhn5VgfUAzq1vWoBLUYy6c=;
 b=E0I8oRbIPksdRsNuP4Vw/CKRceumiULoi7rOkfxxgpzQm/xM0GUeKOiwF1JOtNf4pTbH
 qvmyGU8aGL3SV9jcgmMv/oMq7LxEm1Fhi7KnjeGnu0t3yHqqymScN68Xrcp9kDUuUylM
 9D2YO9rgHKPeOwzCi8unj9I5RDPFq4/d0WmySWGvZUOclTapRnXTXbBqNpaLL7lMMwjH
 kxp4aIqfDJ+MIGt5ft5nlXyLkDEUuNX8fWIan17vvbn1+Ju15/NqxUE9yfw5K1DjAbWL
 QW7B5vNb86lutlB1dIO/F2A/FYg7tRLZOXBZoNcG7ThRGqAPN6VB4QEuLXh153raYLQa Pg== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nsbxat01c-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Feb 2023 15:01:24 -0800
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Fri, 17 Feb 2023 15:01:24 -0800
Received: from ala-jslater-lx1.corp.ad.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.18 via Frontend Transport; Fri, 17 Feb 2023 15:01:24 -0800
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>,
        <rodolfo.zumbado@windriver.com>
Subject: [oe-core][PATCH 2/2] tar: CVE-2022-48303
Date: Fri, 17 Feb 2023 15:01:23 -0800
Message-ID: <20230217230123.579622-2-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230217230123.579622-1-joe.slater@windriver.com>
References: <20230217230123.579622-1-joe.slater@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: lSQQrDp_MeTJZ0u04rrrGQOxT3bH4SMM
X-Proofpoint-ORIG-GUID: lSQQrDp_MeTJZ0u04rrrGQOxT3bH4SMM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-17_15,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=995
 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302170201
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Feb 2023 23:01:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177315

From: Rodolfo Quesada Zumbado <rodolfo.zumbado@windriver.com>

Fixes CVE-2022-48303 by checking Base-256 encoding is at least
2 bytes long. GNU Tar through 1.34 has a one-byte out-of-bounds
read that results in use of uninitialized memory for a conditional
jump. Exploitation to change the flow of control has not been
demonstrated. The issue occurs in from_header in list.c via a
V7 archive in which mtime has approximately 11 whitespace characters.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2022-48303

Upstream patch:
https://savannah.gnu.org/bugs/?62387
https://git.savannah.gnu.org/cgit/tar.git/patch/src/list.c?id=3da78400eafcccb97e2f2fd4b227ea40d794ede8

Signed-off-by: Rodolfo Quesada Zumbado <rodolfo.zumbado@windriver.com>
Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../tar/tar/CVE-2022-48303.patch              | 43 +++++++++++++++++++
 meta/recipes-extended/tar/tar_1.34.bb         |  4 +-
 2 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/tar/tar/CVE-2022-48303.patch

diff --git a/meta/recipes-extended/tar/tar/CVE-2022-48303.patch b/meta/recipes-extended/tar/tar/CVE-2022-48303.patch
new file mode 100644
index 0000000000..b2f40f3e64
--- /dev/null
+++ b/meta/recipes-extended/tar/tar/CVE-2022-48303.patch
@@ -0,0 +1,43 @@
+From 3da78400eafcccb97e2f2fd4b227ea40d794ede8 Mon Sep 17 00:00:00 2001
+From: Sergey Poznyakoff <gray@gnu.org>
+Date: Sat, 11 Feb 2023 11:57:39 +0200
+Subject: Fix boundary checking in base-256 decoder
+
+* src/list.c (from_header): Base-256 encoding is at least 2 bytes
+long.
+
+Upstream-Status: Backport [see reference below]
+CVE: CVE-2022-48303
+
+Reference to upstream patch:
+https://savannah.gnu.org/bugs/?62387
+https://git.savannah.gnu.org/cgit/tar.git/patch/src/list.c?id=3da78400eafcccb97e2f2fd4b227ea40d794ede8
+
+Signed-off-by: Rodolfo Quesada Zumbado <rodolfo.zumbado@windriver.com>
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+---
+ src/list.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)Signed-off-by: Rodolfo Quesada Zumbado <rodolfo.zumbado@windriver.com>
+
+
+(limited to 'src/list.c')
+
+diff --git a/src/list.c b/src/list.c
+index 9fafc42..86bcfdd 100644
+--- a/src/list.c
++++ b/src/list.c
+@@ -881,8 +881,9 @@ from_header (char const *where0, size_t digs, char const *type,
+ 	  where++;
+ 	}
+     }
+-  else if (*where == '\200' /* positive base-256 */
+-	   || *where == '\377' /* negative base-256 */)
++  else if (where <= lim - 2
++	   && (*where == '\200' /* positive base-256 */
++	       || *where == '\377' /* negative base-256 */))
+     {
+       /* Parse base-256 output.  A nonnegative number N is
+ 	 represented as (256**DIGS)/2 + N; a negative number -N is
+-- 
+cgit v1.1
+
diff --git a/meta/recipes-extended/tar/tar_1.34.bb b/meta/recipes-extended/tar/tar_1.34.bb
index 7307cd57a2..1ef5fe221e 100644
--- a/meta/recipes-extended/tar/tar_1.34.bb
+++ b/meta/recipes-extended/tar/tar_1.34.bb
@@ -6,7 +6,9 @@ SECTION = "base"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2"
+SRC_URI = "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2 \
+           file://CVE-2022-48303.patch \
+"
 
 SRC_URI[sha256sum] = "b44cc67f8a1f6b0250b7c860e952b37e8ed932a90bd9b1862a511079255646ff"
 
-- 
2.25.1


