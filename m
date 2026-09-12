Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 338E5C88E56
	for <webhook@archiver.kernel.org>; Sun, 13 Sep 2026 09:49:07 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7814.1789223871068689026
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Sep 2026 07:37:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=QpWVrhEi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.168.131, mailfrom: wenwfu@qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CBdTVI2933486
	for <openembedded-core@lists.openembedded.org>; Sat, 12 Sep 2026 14:37:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/4sTYQbm5Pu77QelkMaXKnqJYAwAW5DrlUc
	5O34qVfs=; b=QpWVrhEiH4lLcnR/kYHb5EfMQt5mBTwtO6s9Z9IbtMx8AFgmT86
	RrUaOXaDWEFeypa6I6oc9C9+JSnrdrVozjkYuP2cnGu4UaDLstBZC2TnUmZ/Bahl
	s95zeg/+s5aysYfyOFdy83T6Wz96G29dHJ21sX5ad4WVA3M5etO7wLLJePC5WIu+
	NEiZljl4tfEF9SJzCfh+XDtXJA84xEIx0tBhfm/EbVFGVk3olJzpZEQ1fv4DQx6T
	jKXM5a0kZnxxogSnf9ZZzSFeMLq/tyCQ9YXBHUDt5vSabzKqvQCE7CP1Ku6cijNQ
	5VPpMeIenVNy2TxLYndkZ54R5zOSk1YEgXQ==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9d15ck-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 12 Sep 2026 14:37:50 +0000 (GMT)
Received: from pps.filterd (aptaippmta02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68CEbmN92817721
	for <openembedded-core@lists.openembedded.org>; Sat, 12 Sep 2026 14:37:48 GMT
Received: from perf-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 68CEbm0e2817711
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 12 Sep 2026 14:37:48 +0000 (GMT)
Received: by perf-sh02-lnx.ap.qualcomm.com (Postfix, from userid 3975139)
	id 482B6AC1; Sat, 12 Sep 2026 22:37:47 +0800 (CST)
From: Wenwen Fu <wenwfu@qti.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Wenwen Fu <wenwfu@qti.qualcomm.com>
Subject: [PATCH v2 2/2] initramfs-framework: avoid external commands in module loop
Date: Sat, 12 Sep 2026 22:37:45 +0800
Message-ID: <20260912143745.3722559-1-wenwfu@qti.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDIxMSBTYWx0ZWRfXzhJE9R8imTr+
 schpSddpi8zv0Ds1QgAOvv3dnJP+bW7VDlwHGegrvHbPhHw+C1n8DNwxd44UJWMzhkp3P9VDJsJ
 DEKciCZi3uf8jUw11IyizO9/CIMd/Ro=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDIxMSBTYWx0ZWRfXwdNkxNZLKI/g
 kKy3s08TlQbz/UdYrvtsm5xT5/XU26Kx+XSXZHnZhEA80liXxOj5eo1aMmTP8MrPAZtbZq0A2nK
 1O2J19obykDQzMKjC+lvrVMy/jSYP0afKMbu9tEiMeWkso3lUQlU9S65CFpCZH6t1pNBcugXh1b
 QixspXmztz68jggjdEFO5m46C56JgKm5tEQqP1q9B5BWt02RKM9BNegy/dm/Ha8iUdqTaGsuflt
 upIqIF+OCjAwEAydLZ2cZp9xCYb4j/ElflN75yKMAv019XhrrAQ8K137wl2wLCWzU0k4mN5SW2P
 PgGvIaqNRmqGrhFs+j4DmIiPtLm1qehnG7DMyXSBVkGwPKljvfHWaV8MKFogBX1tXzbKebW0Hes
 3yOm3Ti+ot3MdwLjiuXREAjgJ22vsR3oTjdnoYwHigcZXBAVsvw4D+Id06BOkHVx3aVI9uvFPVb
 jKXKjoZ6/uiok2DhMRQ==
X-Authority-Analysis: v=2.4 cv=IOSXmQvG c=1 sm=1 tr=0 ts=6aa563be cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=TUV-FE7MVKuhXN5Lm6EA:9
X-Proofpoint-ORIG-GUID: koyCAb_ULC49LpeicIoljq1g6Hd90gBJ
X-Proofpoint-GUID: koyCAb_ULC49LpeicIoljq1g6Hd90gBJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120211
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2026 09:49:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245713

Use shell pattern matching and parameter expansion to skip backup
modules and derive module names without invoking sed, basename, or cut
during initramfs module loading.

On QEMU, backup filtering decreased from 104.529 ms to 3.731 ms,
and module name parsing decreased from 115.657 ms to 4.071 ms.
Together, these stages decreased from 220.186 ms to 7.802 ms.

Tested with dash and BusyBox sh syntax checks and QEMU.

AI-Generated: OpenAI Codex
Signed-off-by: Wenwen Fu <wenwfu@qti.qualcomm.com>
---
 .../initrdscripts/initramfs-framework/init           | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/init b/meta/recipes-core/initrdscripts/initramfs-framework/init
index e560d25d53..e2da3511b8 100755
--- a/meta/recipes-core/initrdscripts/initramfs-framework/init
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/init
@@ -152,11 +152,15 @@ mkdir $ROOTFS_DIR
 # Load and run modules
 for m in $MODULES_DIR/*; do
 	# Skip backup files
-	if [ "`echo $m | sed -e 's/\~$//'`" != "$m" ]; then
-		continue
-	fi
+	case "$m" in
+		*~)
+			continue
+			;;
+	esac
 
-	module=`basename $m | cut -d'-' -f 2`
+	module=${m##*/}
+	module=${module#*-}
+	module=${module%%-*}
 	debug "Loading module $module"
 
 	# pre hooks
-- 
2.43.0


