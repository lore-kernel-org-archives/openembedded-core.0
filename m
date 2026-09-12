Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A69FC88E56
	for <webhook@archiver.kernel.org>; Sun, 13 Sep 2026 09:48:57 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7811.1789223857927845658
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Sep 2026 07:37:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=IqGasZki;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.180.131, mailfrom: wenwfu@qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CBdZrZ2881302
	for <openembedded-core@lists.openembedded.org>; Sat, 12 Sep 2026 14:37:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bWzOU/6CU5vNz/oM1CUYWI6rcd1EM6u8m8v
	9dP3fw/E=; b=IqGasZkioW6CvmIUQW3fF7UDlVld/N3jSmVfKbaxWFMJj3t256C
	A29ftE7MOprb6jmMG5MEYED3grmasA0ExTobWXXPUb6TCQo24zi5k0bCcvXJGJsy
	Cp0F72LNTk6upJhcfzxfMnkEUGw0VKQ6Ul+LS02aVwRZOyLBEbdjTSq6lIymbPW1
	xlIfxQU4QLCqOYx8JuSJ/loBzJtVjOY9L+NHICNhKTUygU2VM7rJZHQ+l/Q4T+3/
	2iow4Iw+/zHxKYc1OeRDLQ7bBhUiIXHxwr7FvrlAdkpaOn/zVP3XlqBG0sa/8lgd
	tmB0AWwsOtANKfob/r/mDPLYjA33t/pNI8Q==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c14ys-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 12 Sep 2026 14:37:36 +0000 (GMT)
Received: from pps.filterd (aptaippmta02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68CEbYAW2817213
	for <openembedded-core@lists.openembedded.org>; Sat, 12 Sep 2026 14:37:34 GMT
Received: from perf-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 68CEbXBD2817200
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 12 Sep 2026 14:37:33 +0000 (GMT)
Received: by perf-sh02-lnx.ap.qualcomm.com (Postfix, from userid 3975139)
	id D4E5EAC1; Sat, 12 Sep 2026 22:37:32 +0800 (CST)
From: Wenwen Fu <wenwfu@qti.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Wenwen Fu <wenwfu@qti.qualcomm.com>
Subject: [PATCH v2 1/2] initramfs-framework: avoid processes when parsing cmdline
Date: Sat, 12 Sep 2026 22:37:30 +0800
Message-ID: <20260912143730.3722534-1-wenwfu@qti.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: E-WIYjQhNXL8_sSo0rjnWl5VJr27XxBs
X-Proofpoint-GUID: E-WIYjQhNXL8_sSo0rjnWl5VJr27XxBs
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa563b0 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=6jv0jSjG4timV9SdKaYA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDIxMSBTYWx0ZWRfX5uakCA1of74p
 RG9Yr86iQhRienQ5n1U4qWZBWBdm8CDTzwVhBhkkJAVw/3NRgsGIdpU1b3jb49hjp3RY12wzuXq
 7CDMB7Oa9OZUw+dv9QQk5Ko1LLSv063/Nsg4DL5UQApdZ7ezKtE7Vnm2Fm71B9QaGGqJMtSe44M
 Pdn59ADhAG7aDfiQK2CtOZzldDr5zsWbqchfdhGvKanDScFqZWYniwleaaSitTyqRMbDvYsSH3Q
 aKkvCenchVOOu9BIOKl3mChp0+4o4xcSDsJkOIsVrWaZ5DjddGYV3CV4Ck2hRRMH7oPmpVMU/cG
 yWqB5rLeqwa6kXc2/+2vXWS/ABCkWJdXaK+O0sS8fqZ9gG+0jbFTa0FAW6U8sUCjH6ubkLIE1Xm
 1liEwdn51K6Ong4mp8FJQ61dx8fS5uKltQ34YEtuVlv9tyMov1hjGM/cZchfsimI4A3IFdr0mIE
 UKDrEjFTFzk3jP1l4ww==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDIxMSBTYWx0ZWRfX3u3lwyHr1rRA
 z6bvi41ThdGs8x7FYiTqHo7GtIREWXkEeHrgSKXfWKWLsCAsXUZ6GJnfM6zlk9519Ovs4Jvhr0o
 wQLvP2fwyDViccQ5PETmWf8LN5u2M0Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120211
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2026 09:48:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245712

Use POSIX shell parameter expansion instead of external cut and sed
while parsing kernel command-line parameters. This keeps the parser
compatible with /bin/sh implementations that do not support Bash-style
pattern substitution while avoiding per-parameter processes.

On QEMU, cmdline parsing decreased from 1.381871 s to 0.056985 s,
a 95.9% reduction.

Tested with dash and BusyBox sh syntax checks and QEMU.

AI-Generated: OpenAI Codex
Signed-off-by: Wenwen Fu <wenwfu@qti.qualcomm.com>
---
Changes since v1:
- Replace Bash-style substitution with POSIX-compatible logic, removing
  the dependency on Bash-specific shell features.
- Split the module-loop cleanup into a separate second patch.
- Add QEMU performance measurements.

 .../initrdscripts/initramfs-framework/init        | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/init b/meta/recipes-core/initrdscripts/initramfs-framework/init
index 67590ad765..e560d25d53 100755
--- a/meta/recipes-core/initrdscripts/initramfs-framework/init
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/init
@@ -104,13 +104,20 @@ for p in `cat /proc/cmdline`; do
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

