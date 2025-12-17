Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AE6AD64076
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 05:22:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7664.1765948961937438049
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 21:22:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=s0YOgLul;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=444662dbf6=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH1bQYl1219900;
	Tue, 16 Dec 2025 21:22:41 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=xkM5Cj4eb
	5TQpZfM7ShbYLqZIasOe3zUXpjR7YTKKHA=; b=s0YOgLuljaPHGBmbgqL7yUFN5
	n38hiIklroq4WOAC//HppLVqwgk4FCM22A7ludU31RgdbxifM71WLH71jrTfXIxP
	H/PVVLfW2lOZS9d+JtZ9TeBcYlQoYWSuihwh1FZXPXvj+FaKGOGVaKLi1V+QK3Oy
	QKnPfsrLnCWBggD48uBfXWDwp6zFFQvVhJ/TkG93tqXP5nEZgOcotfUQHxzvYkNw
	d2OWHly1a4nMe7Jr0aMXinGcyEvVWrJyLAXBzM+EY9LHBdpsOEhaQ0uiiUYRydnW
	f7dWI3mFOoyqRwMuTcKd6Xz8lKFJ4yAxHOcVMuwa2IUfryEes+eHInHY3vwCw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b3k0sg55p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 16 Dec 2025 21:22:41 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 16 Dec 2025 21:22:40 -0800
Received: from oak-lpgbuild14.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 16 Dec 2025 21:22:40 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <paul@pbarker.dev>
Subject: [OE-core][PATCH V6 1/2] extrausers.bbclass: use '+=' for ROOTFS_POSTPROCESS_COMMAND
Date: Wed, 17 Dec 2025 05:22:39 +0000
Message-ID: <20251217052240.3400449-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: fnPAOCRh4VsBKNPRSOx47C85YKBo8Lga
X-Proofpoint-ORIG-GUID: fnPAOCRh4VsBKNPRSOx47C85YKBo8Lga
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA0MSBTYWx0ZWRfX1LaC/hbgX0Zr
 1icRvKpjllELpYmgXSo6nasn3dCHCPJ3wEOBx6he23yNsyGj6X4UGCfIcRT+ZLkqeWrz94Kplxj
 j5wewproFt19/mXd+te5eNVUpX4eA2fvFsCYEix/+Zpwf1VcsKzPfUpuuDziBzD3Ooxv4fsgm77
 jN7oZ8HYTNT9BHS2uZuvRmckkVt+XtzEvT7OTDrHi0sWp3Rhb7npal9o/KtwFK31l14SjhzkoMq
 6iQ4CDNlm3NbSdVsS1DkfUtq81sfcn8eufoifdwaaY2m2Hz02yiyzD4Z/DrI9Zzy/lRRYeg7WnU
 x/GB2vRaU5aBVuuyAHuRm9fNTZp3i4ol5qibzJyeyM8A6ChI0JnUpsmq/Ru+sFoZYniyUn1/t+G
 u64vb6DBldIGzQy4g76Yb2/13NNENA==
X-Authority-Analysis: v=2.4 cv=PqeergM3 c=1 sm=1 tr=0 ts=69423e21 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=92fUyVKKCLMJj5RAaaAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170041
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 05:22:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227996

From: Chen Qi <Qi.Chen@windriver.com>

This is the only place in oe-core that still uses apppend for
ROOTFS_POSTPROCESS_COMMAND. It's modifying users and groups and
such behavior does not need to run as the last step. So change
to use '+='.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/extrausers.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/extrausers.bbclass b/meta/classes/extrausers.bbclass
index c825c06df9..bfb70b7180 100644
--- a/meta/classes/extrausers.bbclass
+++ b/meta/classes/extrausers.bbclass
@@ -23,7 +23,7 @@ inherit useradd_base
 PACKAGE_INSTALL:append = " ${@['', 'base-passwd shadow'][bool(d.getVar('EXTRA_USERS_PARAMS'))]}"
 
 # Image level user / group settings
-ROOTFS_POSTPROCESS_COMMAND:append = " set_user_group"
+ROOTFS_POSTPROCESS_COMMAND += "set_user_group"
 
 # Image level user / group settings
 set_user_group () {
-- 
2.43.0


