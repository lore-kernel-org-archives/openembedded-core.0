Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA399CFD2F6
	for <webhook@archiver.kernel.org>; Sat, 29 Nov 2025 03:54:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9091.1764388481538082971
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Nov 2025 19:54:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=FGCXIsqF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4428fcfaaa=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AT3avWG2701724;
	Sat, 29 Nov 2025 03:54:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=yIB7CQjfv
	mGutd/3FVzhOIknNh0nVE+eagFijbZHmuk=; b=FGCXIsqFs+x4ULsTnk92bTOls
	PmpEa1xmiIVARcvgYJOf9eC4ihicdYBVhhgIJMzj+KBfd/2YCksEha4MNrjKVX7Y
	qOFB2WBH4M7TMlysl2LXjXDeVyX6qRiSqiB5fFmPCdIhu1mpaYxclbW3CKDpgVWe
	Gu7kEgBhM0StHFbU+CH+d+Zlo8gDc/yhoz5oiUfIntSgVTEomQJz3tCX7IocNMQc
	IgB00zEUYK4Xan9zaKtZvZpWgBbsUeBnFz1lFnElSpt/4bLozmttkPTIAm7OQvEA
	j4uqofmIwcVMMocf3pVqnHKwDQkXZB7zx+YsNEijUa7DqtFRcuMBAkvUcHO8g==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqp21r3mm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 29 Nov 2025 03:54:38 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 28 Nov 2025 19:54:36 -0800
Received: from oak-lpgbuild14.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 28 Nov 2025 19:54:36 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <alex@linutronix.de>
Subject: [OE-core][PATCH V2 1/2] rootfs-postcommands.bbclass: fix adding 'no password' banner
Date: Sat, 29 Nov 2025 03:54:35 +0000
Message-ID: <20251129035436.249679-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: r9X72vOhuahZQ4OY1z1zTJj_Qnv79nGF
X-Authority-Analysis: v=2.4 cv=OLAqHCaB c=1 sm=1 tr=0 ts=692a6e7e cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=l-dwHlYZxiQgmx0VytIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDAyNyBTYWx0ZWRfX4y8abb4XBiWc
 hfOvDoIQGmaxKEy0PLXurabpJDfsH5syA9bgsO7tIyfz1vyFUe3QqyncP73+RnFbKoTCZ5ASahv
 a1W9wTzqaPer+6zAfhL9UEPxk57f2emin2Lgr4nK4qu+hGR2M2djj6xl642oNo7zWvv8AcCSWcx
 +LHSN2uQ4qQtBh5uRY7H0FCp6mDEyyyJYC3L/xl8f2tmFU7/D6ETNo35GAiV0kXGvbcnpKwsLZ/
 Lrke8Nd6zJrkRYimbfQHjctDwjpvlFEUnlS5UJfZDALLguA9nihPOhb3hZ/xVFWWqi+fPN/o9Cy
 Jdr8uqm3CIbn1y8BGcMaAqaE5/Th+YxJCht7UuvKTR35tVi4BkVantmPAg14N09Q13W8VEOupJG
 A80Z9+ZTIAMtIoVCld2uzzlSQaVXtw==
X-Proofpoint-ORIG-GUID: r9X72vOhuahZQ4OY1z1zTJj_Qnv79nGF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511290027
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Nov 2025 03:54:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226925

From: Chen Qi <Qi.Chen@windriver.com>

It's possible that users use EXTRA_USERS_PARAMS to set password
for root or explicitly expire root password. So we need to check
these two cases to ensure the 'no password' banner is not misleading.

As an example:
In conf/toolcfg.cfg:
OE_FRAGMENTS += "distro/poky core/yocto/root-login-with-empty-password
In local.conf:
INHERIT += "extrausers"
EXTRA_USERS_PARAMS += " passwd-expire root;"

Note that allowing 'empty-root-password' image feature + setting/expiring
root password has been working since available. This patch focuses on
the banner. We want to ensure that it's there only when root really has
empty password.

We need to ensure that the function runs after set_user_group function
from extrausers.bbclass. This is because the check is valid only after
things set in EXTRA_USERS_PARAMS are done. So change to use :append.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes-recipe/rootfs-postcommands.bbclass | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/classes-recipe/rootfs-postcommands.bbclass
index d3a569ba3e..bcc25798b9 100644
--- a/meta/classes-recipe/rootfs-postcommands.bbclass
+++ b/meta/classes-recipe/rootfs-postcommands.bbclass
@@ -4,8 +4,8 @@
 # SPDX-License-Identifier: MIT
 #
 
-# Zap the root password if empty-root-password feature is not enabled
-ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "empty-root-password", "add_empty_root_password_note", "zap_empty_root_password ",d)}'
+# Zap the root password if empty-root-password feature is not enabled else add a 'no password' banner if appropriate
+ROOTFS_POSTPROCESS_COMMAND:append = ' ${@bb.utils.contains("IMAGE_FEATURES", "empty-root-password", "add_empty_root_password_note", "zap_empty_root_password ",d)}'
 
 # Allow dropbear/openssh to accept logins from accounts with an empty password string if allow-empty-password is enabled
 ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "allow-empty-password", "ssh_allow_empty_password ", "",d)}'
@@ -259,7 +259,11 @@ zap_empty_root_password () {
 # This function adds a note to the login banner that the system is configured for root logins without password
 #
 add_empty_root_password_note () {
-	echo "Type 'root' to login with superuser privileges (no password will be asked).\n" >> ${IMAGE_ROOTFS}/etc/issue
+	rootpw="`grep '^root:' ${IMAGE_ROOTFS}/etc/shadow | cut -d':' -f2`"
+	rootpw_lastchanged="`grep "^root:" ${IMAGE_ROOTFS}/etc/shadow | cut -d: -f3`"
+	if [ -z "$rootpw" -a "$rootpw_lastchanged" != "0" ]; then
+		echo "Type 'root' to login with superuser privileges (no password will be asked).\n" >> ${IMAGE_ROOTFS}/etc/issue
+	fi
 }
 
 #
-- 
2.43.0


