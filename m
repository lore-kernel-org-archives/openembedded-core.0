Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18150CC6B38
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 14:22:03 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14464.1792123131764680153
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 20:58:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ig1tiGTs;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.168.131, mailfrom: wenwfu@qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G1C3cn1890584;
	Fri, 16 Oct 2026 03:18:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=kbiEkiGrILliDyx99sQVF1xDsRx+mwg5v9G
	uyDpR4es=; b=ig1tiGTsMZmeI/KnETnIF+hIHUokkRj6H2P9Ev6hKTFjVgA+UFp
	xZC5V7ex/3/hSAJQLIMbDIXry2nyEw7T6l/FfO0pqXcrRlYozPZKefiTm4Dd1AC3
	1UE7vivfGqlV67skkQYKXkElmXCMTLKtCKoW/1hWu0vCzO4D0TPUt+nXPTbIZ5S7
	sy9CPyhCtRPOD80X9sFyXKknwstI2LphFbLDuFRks05Cu2fX3fY14IUGmffJu/G+
	t9+/t2Xjl7+EfBW0Pf5Z1bgFgYedBjzWr+SYv7c39Kuzpy19Yeti5uZE7sN7jTxi
	Q1gGoOKCVMa6qfJ3mOlbreNWX7NUGNH99+Q==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hba260bhq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 16 Oct 2026 03:18:28 +0000 (GMT)
Received: from pps.filterd (aptaippmta02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69G3Hc5T2743148;
	Fri, 16 Oct 2026 03:18:27 GMT
Received: from perf-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 69G3IQwf2743967
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 16 Oct 2026 03:18:26 +0000 (GMT)
Received: by perf-sh02-lnx.ap.qualcomm.com (Postfix, from userid 3975139)
	id BC2DAAC8; Fri, 16 Oct 2026 11:18:25 +0800 (CST)
From: Wenwen Fu <wenwfu@qti.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Wenwen Fu <wenwfu@qti.qualcomm.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH wrynose 5/7] initramfs-framework: allow opting out of efivarfs mount
Date: Fri, 16 Oct 2026 11:18:24 +0800
Message-ID: <20261016031824.706656-1-wenwfu@qti.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=bsHZl0ai c=1 sm=1 tr=0 ts=6ad19784 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=ag1SF4gXAAAA:8
 a=aNJ5eksCtXL9qKsYOLUA:9 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX0XnfBQaaMmb9
 w3Ot4xOaqkXHAIMa9GnPfjg4pBAxgYOP6Ioy5sHHw2/FlQhDaOVnPO7JLx7EAh/7XASRL3wGKx/
 lgb1fbR8+nwyBGbzUq/eWL59lA4gV5U/94HEC8UejSA9529LZ5sTa+EJzc3tNR/fq6VZJggmi6W
 e41N1ro5W5yxZI48TKH18HWu3VHBIfweqXkeHGShwFSGwrsuOFM02fG060BWLAYlRvoJFgA6BOA
 IfUSCgY67+m8oI69MPryM3cWUiBhlDKQ+F2/zRpZTGCCUhgiawPSS4BmZnGQGnohpEItaxeAmT/
 qyQVYDwU4oaVioYE0kGEcwvriD5oCOMQFumu3UHZVQKVNI391iBUGOl36vtEbLsmOWxmZ+J1nOr
 LxH7jROqNWyii/9pUTgZ974QG3F7uwGEkXJZ4YP5PdBR/lFP6m5UIntIwrkQlGqG850Ns+QeoLE
 bMvb3w1KAPoa59yhdgA==
X-Proofpoint-ORIG-GUID: C9GJri0uEcfZNlPnTUJ-AFIwrHWd6qyR
X-Proofpoint-GUID: C9GJri0uEcfZNlPnTUJ-AFIwrHWd6qyR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX9D3BQykSePeP
 mzNW+sxmFdns1EEVg2fWfaS2vO9/F/Q5BIcknjhJ0mLAF+iTCA9giNkLmKRTkMBXlNTtUVffhJP
 avr0bJdKZrZlK60yrmVz0eTthDYQ5UE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160012
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 14:22:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248032

The initramfs mounts efivarfs before parsing the kernel command line.
This was added so EFI metadata is available to early consumers such
as mdadm when assembling Intel VROC RAID root devices.

On systems where the real root filesystem mounts efivarfs later, the
early mount is redundant and adds work to the initramfs critical path.
Allow these systems to opt out with initramfs.efivarfs=0.

Parse the command line before deciding whether to mount efivarfs.
Keep the existing mount behavior by default for initramfs users that
need EFI variables before switch_root.

Signed-off-by: Wenwen Fu <wenwfu@qti.qualcomm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9147744020f9b948f656a116ac03a9656e5a254b)
---
 .../initrdscripts/initramfs-framework/init             | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/init b/meta/recipes-core/initrdscripts/initramfs-framework/init
index 67590ad765..e3bf97bba9 100755
--- a/meta/recipes-core/initrdscripts/initramfs-framework/init
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/init
@@ -87,10 +87,6 @@ mount -t sysfs sysfs /sys
 mount -t tmpfs tmpfs /run
 mkdir -p /run/lock
 
-if [ -d $EFI_DIR ];then
-	mount -t efivarfs none /sys/firmware/efi/efivars
-fi
-
 # populate bootparam environment
 for p in `cat /proc/cmdline`; do
 	if [ -n "$quoted" ]; then
@@ -130,6 +126,12 @@ for p in `cat /proc/cmdline`; do
 	fi
 done
 
+# Keep efivarfs available in the initramfs by default.  Systems which
+# provide it from the real root filesystem can opt out of the early mount.
+if [ "${bootparam_initramfs_efivarfs:-1}" != "0" ] && [ -d "$EFI_DIR" ]; then
+	mount -t efivarfs none /sys/firmware/efi/efivars
+fi
+
 # use /dev with devtmpfs
 if grep -q devtmpfs /proc/filesystems; then
 	mkdir -p /dev
-- 
2.43.0


