Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D05D1D116EA
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 09:16:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12209.1764321383920012830
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Nov 2025 01:16:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rBWsFUZN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3427347a84=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS4P7ub416364;
	Fri, 28 Nov 2025 09:16:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=UriUAtDvf
	vZt69vYfyGJ8OZ//qR7Z5iZl0NwZZBl7l0=; b=rBWsFUZNZ20iC3ccoWk1wxbxo
	OO5cKRoJRgCs7XzlHZfdMzS5L2BEmTlGBx6aZdiO2aTVJE3u4buPnCKzfZhKsKyO
	wtcbuzzgcPn66u+rm4j8CmMqojG0yxK8QoVIchEWtVSAbMIL51huG6pE7xJ8Fd8u
	j6TXm4Wu+oicHAL7GBFL8HDWuoMRGQufOn2EVw6cEHtiwIL/w1uJiThE0EScnsCE
	ZplA5XDqUVeRZ9xsZcVOxV70HdqaJrmhUoGh6DONjgx6iiA1n7Tq0Qp7ZIWhev4t
	pkORRkfGn/qh3S5Ivk/1u4hkkBNYcqyY+iMCnYH2aHwrBpG+Ou+UJ91NS7opA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ak2d0xt7y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 28 Nov 2025 09:16:08 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 28 Nov 2025 01:16:06 -0800
Received: from oak-lpgbuild14.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 28 Nov 2025 01:16:06 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <alex@linutronix.de>
Subject: [OE-core][PATCH] rootfs-postcommands.bbclass: fix adding 'no password' banner
Date: Fri, 28 Nov 2025 09:16:06 +0000
Message-ID: <20251128091606.3465381-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA2NyBTYWx0ZWRfX2EwceMYIuD/K
 nXZj22WiySRmyzZVFWYPU7doZWkIhBB16GnSE7+rXMau9W7yfgs0zHGR7hKBl9suWPKD94n0C6V
 KYOrutWkQXmmSjrFHcZt1fNQYM+WtTMgyGLwVC1Q3MXi7pAeTtoOaxhDOczdApfVBbhL8q2vTi+
 1VTYQ5XgFlAw/OiVncuYGZSmjWxeKpMF44hJSUNRkl9Ldx1sW5CP8PatYpW6SN//S1saw6CRjFf
 Rm8k97akk2q9fT9yKbmQBcr9qsKTQRF6iX9UcUxGf5dOXWHapY3lZJLxvDqBXwNFDsN2Cg7/cw9
 bRn6HoVM/L77T7PEmFEEqUIO5a2zSQBNqWKx3C7ubrtbsRiyHhWWPhK965q4s3EB6CaxoFJSiQz
 3MYI/Wl+x5sAvhgBVskzyOWX5BWbKw==
X-Authority-Analysis: v=2.4 cv=JcCxbEKV c=1 sm=1 tr=0 ts=69296858 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=l-dwHlYZxiQgmx0VytIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: VDvIOL1OSNceLDPbSVspBQGdbAGATae8
X-Proofpoint-ORIG-GUID: VDvIOL1OSNceLDPbSVspBQGdbAGATae8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 spamscore=0 phishscore=0 clxscore=1011 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511280067
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 09:16:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226900

From: Chen Qi <Qi.Chen@windriver.com>

It's possible that users use EXTRA_USERS_PARAMS to set password
for root or explicitly expire root password. So we need to check
these two cases to ensure the 'no password' banner is not misleading.

We need to ensure that the function runs after set_user_group function
from extrausers.bbclass. So change to use :append.

Besides the above check, the '\n' at the end of the banner is also
removed. The '\n' in /etc/issue means hostname instead of new line.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes-recipe/rootfs-postcommands.bbclass | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/classes-recipe/rootfs-postcommands.bbclass
index d3a569ba3e..3c4edc0301 100644
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
+		echo "Type 'root' to login with superuser privileges (no password will be asked)." >> ${IMAGE_ROOTFS}/etc/issue
+	fi
 }
 
 #
-- 
2.43.0


