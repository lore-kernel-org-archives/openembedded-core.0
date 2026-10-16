Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17968CCF2C2
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 14:21:53 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14186.1792122904133054427
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 20:55:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=DR4OsImp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.168.131, mailfrom: wenwfu@qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FNCo6S557676;
	Fri, 16 Oct 2026 03:18:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=sS+Y7dMklOrXTWU/R27uaEl5UsPiaHsjJTL
	3nx/LF+M=; b=DR4OsImpWojXM+MlIut8AwWx4JdrzGcbygR0D4Jm83+zLC4VoD+
	0ycG+zUjQCpoQq+ae19f07QSM3S6byUfhC9EQBCB4ayjVaKa5S1p5v7MuUk21Mzb
	KHAHkdyptA65A+fvmssNyd0jhIPF9vT2UsLqJLKKhLu+nD6xsZm8QIJn/X7vEPkb
	QHGyVizVuZUprerohDQpC2VUiCnkebMfDdrtJepNLHlTSJyxcydk+bOLNeXM+5BV
	H2v7veCaB7LFvkVe4a7pIap9IypcLaW0k4eGJXZsrvy2K7Dox8ZXK0Jj7TYRwV9d
	6sfC2IIpggx6rUIjWRcKE1Zdbu4hV1Pzzlw==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8a88nqs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 16 Oct 2026 03:18:38 +0000 (GMT)
Received: from pps.filterd (aptaippmta02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69G3HO7x2742999;
	Fri, 16 Oct 2026 03:18:36 GMT
Received: from perf-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 69G3Iah32744063
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 16 Oct 2026 03:18:36 +0000 (GMT)
Received: by perf-sh02-lnx.ap.qualcomm.com (Postfix, from userid 3975139)
	id 89C75AC5; Fri, 16 Oct 2026 11:18:35 +0800 (CST)
From: Wenwen Fu <wenwfu@qti.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Wenwen Fu <wenwfu@qti.qualcomm.com>,
        Antonin Godard <antonin.godard@bootlin.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH wrynose 6/7] initramfs-framework: avoid processes when parsing cmdline
Date: Fri, 16 Oct 2026 11:18:33 +0800
Message-ID: <20261016031833.708267-1-wenwfu@qti.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX+kBRt3hk9Pmw
 GCt/b5LpVc9Gy9boLcca/f5QtkiUQTHclQzEjUCLXiMOg/8A+uGh4Lif6BoRfDdfJXJnpt5HgtA
 dB8feu7NP5XECf1gD2PCBlkS3t3hInc=
X-Proofpoint-ORIG-GUID: -eM4uljuD36DZG-0S-8IjaPa-GxWpTBK
X-Authority-Analysis: v=2.4 cv=GJadgeNK c=1 sm=1 tr=0 ts=6ad1978e cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8
 a=iFOcMdv-CBwm9g4JKMcA:9 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX/agwm9FO1PwV
 O0y+loK0wtohrXSHCvmNPvsZtJ/gN0am944aiV1RZD+ZirGwokrNfYUKe2TxW4wGKXux78smWx2
 7jTyBgs05T5t7UOfOEcW6umVJlqJ65DrGcL9wB6P59yT9pAYQGB2eTY/LbVqjyebUk8pGwuawVr
 u0/QY53Q4qYsDauF/N9zW8mzHGuqWcUllRQrkYvElpMZOqHiBenfEqgyo44GDbrGIcMZD0y5ldO
 ZfjjyiKUKQFZ2PBvSc04U2D/Wrmrt8QQI29bXUeOHRfva/Zvb0TYy3AK5EfTxLar1moqlPS+jjx
 E9xa1BzVf9TXx42Gj9dwQi8OUnfeqJKk263yMgSe5fC7HT6MK+eTnnlK+0L5uAW7PHJ6fS/+2i5
 H98M38ZpQGFqSnoq0EWDMlQBImb1YnTyYI3hAqQRqj/Ciu/XW9Rhu/klgkntZc+mfbJLgz1p/1V
 Nx0osPSkJWjOvPaYbfg==
X-Proofpoint-GUID: -eM4uljuD36DZG-0S-8IjaPa-GxWpTBK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160012
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 14:21:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248030

Use POSIX shell parameter expansion instead of external cut and sed
while parsing kernel command-line parameters. This keeps the parser
compatible with /bin/sh implementations that do not support Bash-style
pattern substitution while avoiding per-parameter processes.

On QEMU, cmdline parsing decreased from 1.381871 s to 0.056985 s,
a 95.9% reduction.

Tested with dash and BusyBox sh syntax checks and QEMU.

AI-Generated: OpenAI Codex
Signed-off-by: Wenwen Fu <wenwfu@qti.qualcomm.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b560c7527a66b8fa90817a92b16b323493fb394d)
---
 .../initrdscripts/initramfs-framework/init        | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/init b/meta/recipes-core/initrdscripts/initramfs-framework/init
index e3bf97bba9..e03685175f 100755
--- a/meta/recipes-core/initrdscripts/initramfs-framework/init
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/init
@@ -100,13 +100,20 @@ for p in `cat /proc/cmdline`; do
 		continue
 	fi
 
-	opt=`echo $p | cut -d'=' -f1`
-	opt=`echo $opt | sed -e 'y/.-/__/'`
-	if [ "`echo $p | cut -d'=' -f1`" = "$p" ]; then
+	key=${p%%=*}
+	opt=$key
+	while :; do
+		case "$opt" in
+			*.*) opt=${opt%%.*}_${opt#*.} ;;
+			*-*) opt=${opt%%-*}_${opt#*-} ;;
+			*) break ;;
+		esac
+	done
+	if [ "$key" = "$p" ]; then
 		# opt parameter
 		eval "bootparam_${opt}=true"
 	else
-		value="`echo $p | cut -d'=' -f2-`"	# Option value
+		value=${p#*=}	# Option value
 		value_lstripped=${value#\"}
 		value_rstripped=${value%\"}
 
-- 
2.43.0


