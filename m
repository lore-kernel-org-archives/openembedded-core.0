Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D2DCD116F1
	for <webhook@archiver.kernel.org>; Sat, 29 Nov 2025 15:41:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16523.1764430907273149488
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Nov 2025 07:41:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=HKhwcVM3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4428fcfaaa=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ATEx9hU2483046;
	Sat, 29 Nov 2025 15:41:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=yIB7CQjfv
	mGutd/3FVzhOIknNh0nVE+eagFijbZHmuk=; b=HKhwcVM3zBkg5sA8nMIkRPnvK
	mJpGMLiV8TvVaU/Nitrc21DwoE79ZMqsTIQdZk/xta25quhvnaqGrfJSwtJNjKqJ
	EEIQsrpY8cH2ix/txWYohdbeQldrG4j3J3RzvqtbbHD9VOa1PMd+y1BFCfAfHAH1
	wQiE5tdCferZxc0Ov5L9Emj9TdJo9i8aE9aEvbbIQ3FHLW1zEuam/wj9t7rK827g
	3/Ug9gtxmVPROky2iIA69MJuSn+pgER6kLlri1VozDZfcoXatl2PVcVw215k9CZq
	WDh1Of2zfYgLb1mBO2s1GSMvFbS1jwaOs/IZmM1qDrMrAbQvKR0ZsG5HLGBfg==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqqt68bmf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 29 Nov 2025 15:41:32 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sat, 29 Nov 2025 07:41:30 -0800
Received: from oak-lpgbuild14.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sat, 29 Nov 2025 07:41:30 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <alex@linutronix.de>
Subject: [OE-core][PATCH V3 1/2] rootfs-postcommands.bbclass: fix adding 'no password' banner
Date: Sat, 29 Nov 2025 15:41:29 +0000
Message-ID: <20251129154130.505619-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDEyNyBTYWx0ZWRfX3k2te+Qir66g
 VY+trJDlquhMTQPcF65xn2+VerdUmClPeKyEVaQev0x2JYIJ34fN5/IUCvC1B38YkaqLwuPrrhn
 m4gEcAYgd+pu51t8Zz0pl8pbMb8uqh6dy0znvpzVcc1WPTDWs5BAfQ/4MdO8vDbrbWsq24eqGJ8
 GvsuPDNulgZBGRQNYWQ3woqVIF6evRAHluKQw0Tr3lg1woWKyTQ2mHIoDVen9EzZnDdT6CkAbcI
 pRc5WWKCZew9R4jm1rTpHLi9RcQGt7KyyXHmYdih83oI+CuYRHeryQAsbmvmv+9PmlXm+/isDPJ
 OQgEcX/mTyAi2Zkf/007UcnLs/swtmN73Ol7wxOj1diD+6tX7hhPJmzUEVrCEVm/a+JFjPEFkqk
 MjfnvyiFOYJ9PPw7TCtbiFnAPnED4Q==
X-Authority-Analysis: v=2.4 cv=Adq83nXG c=1 sm=1 tr=0 ts=692b142c cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=l-dwHlYZxiQgmx0VytIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: pc2BOVARC9YzliKT0czVKFyZ0SWDFc2p
X-Proofpoint-GUID: pc2BOVARC9YzliKT0czVKFyZ0SWDFc2p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511290127
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Nov 2025 15:41:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226941

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


