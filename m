Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26B17CC6B38
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 14:21:53 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14460.1792123110746919569
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 20:58:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=gPw/lcGQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.168.131, mailfrom: wenwfu@qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G1Brpt1890469;
	Fri, 16 Oct 2026 03:18:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=j0x6Z0iugJyYd9AkPf7mGsWz8hUvT0sHler
	Dqx4lA+A=; b=gPw/lcGQ77lnTIXOBxMVExBaGHdDkvSx8JtDQsoWsbiYpugOhAS
	duFbvpxMzINVYLOv0bgujrbbbap3hTbyx6QIFjS2i6oBeCcgYqX6ZeP6fZlDGgAn
	HJm/WZz6zO8VbLPbPrd8YRdWIwulT3j5FrtD5eoXmkuQANUep+r4eWFhC3m2fbSG
	2P1ztpDaSMzbRsYoUEIkDJRKUIQWvsn8hy83Likge/ZXIJfpig3+QxcbsYKjguLS
	73Chle/i1kr8kQZgc8+Z6d1jX1XHCtGHciV/+gbTx/27/CzRNaeltyZyof5iovG0
	+ERyIAZbyp1nl++KLU+j/lXl7vDfACMuiOg==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hba260bjm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 16 Oct 2026 03:18:46 +0000 (GMT)
Received: from pps.filterd (aptaippmta02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69G3Hcw32743147;
	Fri, 16 Oct 2026 03:18:45 GMT
Received: from perf-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 69G3IiRG2744153
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 16 Oct 2026 03:18:45 +0000 (GMT)
Received: by perf-sh02-lnx.ap.qualcomm.com (Postfix, from userid 3975139)
	id 19E7BAC5; Fri, 16 Oct 2026 11:18:44 +0800 (CST)
From: Wenwen Fu <wenwfu@qti.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Wenwen Fu <wenwfu@qti.qualcomm.com>,
        Antonin Godard <antonin.godard@bootlin.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH wrynose 7/7] initramfs-framework: avoid external commands in module loop
Date: Fri, 16 Oct 2026 11:18:42 +0800
Message-ID: <20261016031842.709431-1-wenwfu@qti.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=bsHZl0ai c=1 sm=1 tr=0 ts=6ad19797 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8
 a=TUV-FE7MVKuhXN5Lm6EA:9 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX5ryhXe5wXfw+
 jDy/xTzThjDSeKgVcxmLU5mKTsI5NRiZs++7OKsHFqRlVyGc7qgmMiNICfdmzxGH1YJh9gtMAV6
 GtnTkzAZvUnU1BJIstECdpJQr2Qoe4V03lHAVfImfWDaFsAxbfn1CZ9zzZjlakJSrtLpX+58Xmx
 uxiDWA68DADUCKzghSgPsgOUrIACkYMyYQcPnXmmtGc/AW/3S0JMqQsGC+rBeGvWPyShQHApZ1f
 HWqjVR8Fhi1OhlfysEP0R4sx3XIh63BCsf9twiFVsS0ZlYx3DW8QnrUkIYioDO7yPiib1aDkU1g
 wvqlrIRF1Y0ixhzoXThy40R3EgKWKfvdjrVT8yW4QYDObtn2g2Q4syDKVhpM/M5OChCoD4HgGjA
 Z+25Om/HEAXgRcow3rFVob9zcpQXsyNXSDT2zs0btJFGbPylVfz/K4V1BsvMZhOE9Vcz5uDgCuH
 XZM324Iw0Dw+j26Iheg==
X-Proofpoint-ORIG-GUID: 6qft52SfoZBHkCeWFVdAmULpseuB_VTb
X-Proofpoint-GUID: 6qft52SfoZBHkCeWFVdAmULpseuB_VTb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX3vg7Ylp+i5iF
 7V7KURrxpMr9/gNnhId5AhFC5UWGjuOFbklamV9ogeJAGfJB3WyYX8OatUAzmhliGa2t8S8XlZE
 FT1PIHn8KLWKqpkFPc06DMTYg9BVGcU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160012
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 14:21:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248031

Use shell pattern matching and parameter expansion to skip backup
modules and derive module names without invoking sed, basename, or cut
during initramfs module loading.

On QEMU, backup filtering decreased from 104.529 ms to 3.731 ms,
and module name parsing decreased from 115.657 ms to 4.071 ms.
Together, these stages decreased from 220.186 ms to 7.802 ms.

Tested with dash and BusyBox sh syntax checks and QEMU.

AI-Generated: OpenAI Codex
Signed-off-by: Wenwen Fu <wenwfu@qti.qualcomm.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f7097b98a32ff3b672e5340767cb2ca2709dfd9a)
---
 .../initrdscripts/initramfs-framework/init           | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/init b/meta/recipes-core/initrdscripts/initramfs-framework/init
index e03685175f..5dbf32a12d 100755
--- a/meta/recipes-core/initrdscripts/initramfs-framework/init
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/init
@@ -154,11 +154,15 @@ mkdir $ROOTFS_DIR
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


