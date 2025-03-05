Return-Path: <quic_bpothuno@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA840C19F32
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 06:47:10 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.7886.1741157227048134961
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 22:47:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=FUSFqvlS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.180.131, mailfrom: bpothuno@qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524NA1io025488
	for <openembedded-core@lists.openembedded.org>; Wed, 5 Mar 2025 06:47:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=fKmeMgWSlZdOBdW3ktqSD+b6s8yiAbActQ7
	shKg1En8=; b=FUSFqvlSDO1birbdgUZA+IMCSZdCKy6TTJxLuUTKa19EusUFtu1
	8LczqsFvTV7L0PzQzseVIB0y6/moFPKHql/ysZvOz919DaOL0J4AauzFg6qosuSx
	v9Y+Pg6P9HSUOStv24VQtBSKcz6jMfjr45byZ3NBHwjSF8iRCf3BSoKyCSrAsKMa
	/Wo17RVddbwrk3UElVaHbv70LKFoJjYZd0vpm6lD+610tkMn3I2Ah1Y35NdlFOBU
	DX0vjAtphAIVrMlqmgvCvGOTbUOaEG3gDMb0vJUmPJw+aq/fUDv4Lhlyi5a+1xmg
	CUeCoYVKCnw463OZr+b49OaLt7qwGPqdpNg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6tvd80-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 06:47:05 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5256l2t6026719
	for <openembedded-core@lists.openembedded.org>; Wed, 5 Mar 2025 06:47:02 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 453uambvet-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 06:47:02 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5256l2sG026713
	for <openembedded-core@lists.openembedded.org>; Wed, 5 Mar 2025 06:47:02 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com ([10.213.97.93])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 5256l2MS026707
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 06:47:02 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 460767)
	id A4894579; Wed,  5 Mar 2025 12:17:01 +0530 (+0530)
From: Balaji Pothunoori <quic_bpothuno@quicinc.com>
To: openembedded-core@lists.openembedded.org
Cc: Balaji Pothunoori <quic_bpothuno@quicinc.com>
Subject: [PATCH] dhcpcd: fix for unexpected syscall 135 for 10.1.0 version
Date: Wed,  5 Mar 2025 12:11:01 +0530
Message-Id: <20250305064101.4065316-1-quic_bpothuno@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: af3IpaRRzx3DDsa0VlzY6aoKZMx9-9Ew
X-Proofpoint-ORIG-GUID: af3IpaRRzx3DDsa0VlzY6aoKZMx9-9Ew
X-Authority-Analysis: v=2.4 cv=Sf4NduRu c=1 sm=1 tr=0 ts=67c7f36a cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=COk6AnOGAAAA:8 a=29iXaaDHAAAA:8 a=3913LV_Jhq5vo-U7tIkA:9 a=TjNXssC_j7lpFel5tvFf:22
 a=IKEkoQGeIXdUWEBz-oOH:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_03,2025-03-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 phishscore=0
 suspectscore=0 clxscore=1011 malwarescore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503050052
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 06:47:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212296

Current dhcpcd (version 10.1.0) service crashes on the WiFi (wlan0)
interface with the following error:

"ps_seccomp_violation: unexpected syscall 135"

This update pulls in fix #421 for dhcpcd 10.1.0 to address this issue.

Signed-off-by: Balaji Pothunoori <quic_bpothuno@quicinc.com>
---
 .../dhcpcd/dhcpcd_10.1.0.bb                   |  1 +
 ...llow-the-__NR_rt_sigprocmask-syscall.patch | 30 +++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/0001-linux-Allow-the-__NR_rt_sigprocmask-syscall.patch

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.1.0.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.1.0.bb
index 3f806bb18783..99b72852bf34 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.1.0.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.1.0.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://dhcpcd.service \
            file://dhcpcd@.service \
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
+           file://0001-linux-Allow-the-__NR_rt_sigprocmask-syscall.patch \
            "
 
 SRCREV = "57c3506a5622e199cf0e3fc1ef26a71cdedc9521"
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-linux-Allow-the-__NR_rt_sigprocmask-syscall.patch b/meta/recipes-connectivity/dhcpcd/files/0001-linux-Allow-the-__NR_rt_sigprocmask-syscall.patch
new file mode 100644
index 000000000000..7058330165f3
--- /dev/null
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-linux-Allow-the-__NR_rt_sigprocmask-syscall.patch
@@ -0,0 +1,30 @@
+From e9e40400003db2e4f12dba85acabbaf2212a520f Mon Sep 17 00:00:00 2001
+From: Scott Shambarger <devel@shambarger.net>
+Date: Sat, 7 Dec 2024 16:37:28 +0000
+Subject: [PATCH] linux: Allow the __NR_rt_sigprocmask syscall
+
+Fixes recent glibc changes to getrandom() used by arc4random().
+Fixes #421.
+
+Upstream-Status: Backport
+See details in https://github.com/NetworkConfiguration/dhcpcd/issues/421
+
+Signed-off-by: Scott Shambarger <devel@shambarger.net>
+---
+ src/privsep-linux.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/privsep-linux.c b/src/privsep-linux.c
+index 8357904c9c9a..e3485a2efdfc 100644
+--- a/src/privsep-linux.c
++++ b/src/privsep-linux.c
+@@ -409,6 +409,9 @@ static struct sock_filter ps_seccomp_filter[] = {
+ #ifdef __NR_recvmsg
+ 	SECCOMP_ALLOW(__NR_recvmsg),
+ #endif
++#ifdef __NR_rt_sigprocmask
++	SECCOMP_ALLOW(__NR_rt_sigprocmask),
++#endif
+ #ifdef __NR_rt_sigreturn
+ 	SECCOMP_ALLOW(__NR_rt_sigreturn),
+ #endif

