Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED311C88E4D
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 15:55:04 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42640.1789141539822120257
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 08:45:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=EldNLHKn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.180.131, mailfrom: wenwfu@qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEmF87798918
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 15:14:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=BMq3EwYVtM+8yyRkHB/E5o21W17cr1vUKL2
	D9xxVvPQ=; b=EldNLHKnl9RSqXeBRG4aHKw8/unwx7AwDbn1UHjs5Uq4zSvwssj
	43xTETYT5vOb7ndUJC3FXPP962j9tGmUkggcSODEKTEpB3qOA4V2K8T3F1oedPb6
	VxOj3+IVf2Poy+BlZjsIAZzzko1WNwYzdfvPsnQvkgQApX93etaaBkWdc1jeGfpJ
	ncpNB3M7DsNPn3tLNyE+xitiUGMNuRC39yUxCqrpWmRzAAgyZYoXb7HdUUhCGz7l
	LY7SHvgSkT+4GwJ1bLhDBUqrjRYCObyP5fweTHdmISk3/WNoGdnpCNExUgNIKpf7
	m1tncIXxTmnGwOfXkRHIHOaGCYQfktc65Bw==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm2q146gm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 15:14:23 +0000 (GMT)
Received: from pps.filterd (aptaippmta01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68BFEKBt1132706
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 15:14:20 GMT
Received: from perf-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 68BFEJUR1132697
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 15:14:19 +0000 (GMT)
Received: by perf-sh02-lnx.ap.qualcomm.com (Postfix, from userid 3975139)
	id BDA60AC4; Fri, 11 Sep 2026 23:14:18 +0800 (CST)
From: Wenwen Fu <wenwfu@qti.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Wenwen Fu <wenwfu@qti.qualcomm.com>
Subject: [PATCH] initramfs-framework: avoid processes when parsing cmdline
Date: Fri, 11 Sep 2026 23:14:16 +0800
Message-ID: <20260911151416.1946900-1-wenwfu@qti.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=d6lgWhjE c=1 sm=1 tr=0 ts=6aa41ad0 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=84CP5231zqWhsF3xmNgA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxMiBTYWx0ZWRfX1pXENC8pCUbv
 PSyTmiSuZIqsQNNkV6KOj71AdZQ9GtlRbXwb7zAqbFCtiDULSnpOQci3ED3f7TpE1BAhjI4DgxE
 VJl+lGXG4byUVN03tpl4gm8KMAYRKwcFIjARZmBeFQ3kJxUAXkkQT4X7xb0pqmvuItL+Pq/rmiW
 X/a1+g8aSk8qblKelRjE8zfi5hk0Uywh7QSRQc4eh9AR6EtVymYQrwbrD+blhORNrPZRsDfOnYA
 eBD3He6Ou6aqQ3e6M0hL4wSkXb0Anu08dPHe3MRLcLj107/DRanPK+Zeix6h1XdV6mPrUnYe6O/
 VzgISEzwjj4ZmBQF9Rat0Ure2m6uDwuDPSGQYb20SV72u3QmwmKktfnRPiFepvPRtIwGeiyDvO9
 t7fRu6/8uWrgJEP7xRfRp3SFj9balmH31ymswYB59QogJrvQp87Gd8Kbbxx16B1cQgpbAHOKqmY
 XvRz3vjYc9pX4StSotQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxMiBTYWx0ZWRfX9Ut3jSNLON8f
 yOmP9Mhh3ejPm3WouhqWJ/sxdUK6ZKa4tIwKzY4VcDUIjvVSTX7rm6e9CFRixZkCgLNxvzqVI4u
 9PWMrgPjcJHYJ/0msoMZ9nDsuTVzk/0=
X-Proofpoint-GUID: 43dfnlQAKDs0_x-ZWwe0SGpVdgpMw_8d
X-Proofpoint-ORIG-GUID: 43dfnlQAKDs0_x-ZWwe0SGpVdgpMw_8d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110212
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 15:55:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245661

Use shell parameter expansion rather than external cut and sed commands
while parsing kernel command-line parameters in the initramfs.

On the target initramfs, 100 command-line parser runs took 13.48 s
before this change and 0.51 s afterwards. This reduces the per-run
cost from 134.8 ms to 5.1 ms.

Signed-off-by: Wenwen Fu <wenwfu@qti.qualcomm.com>
---
 meta/recipes-core/initrdscripts/initramfs-framework/init | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/init b/meta/recipes-core/initrdscripts/initramfs-framework/init
index 67590ad765..62d8ccfd0c 100755
--- a/meta/recipes-core/initrdscripts/initramfs-framework/init
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/init
@@ -104,13 +104,14 @@ for p in `cat /proc/cmdline`; do
 		continue
 	fi
 
-	opt=`echo $p | cut -d'=' -f1`
-	opt=`echo $opt | sed -e 'y/.-/__/'`
-	if [ "`echo $p | cut -d'=' -f1`" = "$p" ]; then
+	key=${p%%=*}
+	opt=${key//./_}
+	opt=${opt//-/_}
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


