Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51679E77188
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 07:31:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.58987.1735543864006570943
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Dec 2024 23:31:04 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3094d051be=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BU74RnZ024265
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 07:31:03 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43t6j0hfn7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 07:31:03 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sun, 29 Dec 2024 23:31:01 -0800
Received: from pek-lpg-core2.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sun, 29 Dec 2024 23:31:01 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] sanity.bbclass: Lower the length of TMPDIR limit to 400
Date: Mon, 30 Dec 2024 15:31:00 +0800
Message-ID: <20241230073100.229869-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=V7KH0fni c=1 sm=1 tr=0 ts=67724c37 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=RZcAm9yDv7YA:10 a=NEAV23lmAAAA:8 a=iGHA9ds3AAAA:8 a=mLKua8RHAAAA:8 a=t7CeM3EgAAAA:8 a=N8FuDuPdbH489lbyvPcA:9
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=ewTM_9iNE6a0vsrYD_ou:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: E5NJPa09cdiY2eweYg_49185UPrAkrAW
X-Proofpoint-GUID: E5NJPa09cdiY2eweYg_49185UPrAkrAW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-30_03,2024-12-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2412300062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 07:31:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209146

From: Changqing Li <changqing.li@windriver.com>

When TMPDIR has length 410,  bitbake uninative-tarball will fail at
do_populate_sdk with error: Failed to open backup database:
"TMPDIR/work/x86_64-nativesdk-pokysdk-linux/uninative-tarball/1.0/sdk/image/var/lib/dnf/history.sqlite"

sqlite3 has a hardcode max pathname limit 512, refer [1], and there is a
check, refer [2], pathname + 8 > max path name limit(512) is not
allowed.  So the pathname length need to <= 504.  While, length of
"TMPDIR/work/x86_64-nativesdk-pokysdk-linux/uninative-tarball/1.0/sdk/image/var/lib/dnf/history.sqlite"
is 505, so error happened.

We had met similar issue [3], and refer the comments, upstream reject
the change of the hardcode length, see [4][5].

This patch try to improve and workaround this issue by lower max TMPDIR
length to 400, at least for distro name length <=13, the build can
success.

[1] https://github.com/sqlite/sqlite/blob/master/src/os_unix.c#L180
[2] https://github.com/sqlite/sqlite/blob/master/src/pager.c#L4777
[3] https://bugzilla.yoctoproject.org/show_bug.cgi?id=12374
[4] https://sqlite.org/cgi/src/tktview/c060923a5422590b3734
[5] https://sqlite.org/forum/forumpost/0b1b8b5116

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/classes-global/sanity.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index a0b2508e11..7b8a497d5a 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -760,8 +760,8 @@ def check_sanity_version_change(status, d):
     if not oes_bb_conf:
         status.addresult('You are not using the OpenEmbedded version of conf/bitbake.conf. This means your environment is misconfigured, in particular check BBPATH.\n')
 
-    # The length of TMPDIR can't be longer than 410
-    status.addresult(check_path_length(tmpdir, "TMPDIR", 410))
+    # The length of TMPDIR can't be longer than 400
+    status.addresult(check_path_length(tmpdir, "TMPDIR", 400))
 
     # Check that TMPDIR isn't located on nfs
     status.addresult(check_not_nfs(tmpdir, "TMPDIR"))
-- 
2.25.1


