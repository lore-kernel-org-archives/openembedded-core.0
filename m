Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27A27D116F1
	for <webhook@archiver.kernel.org>; Sat, 29 Nov 2025 03:54:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9092.1764388481588860641
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Nov 2025 19:54:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=I4j83Bt9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4428fcfaaa=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AT3avWH2701724;
	Sat, 29 Nov 2025 03:54:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=NBEHv4GzEayz0W3OkAJEyLFwjVpXQ9oU+vnsI7+eB90=; b=
	I4j83Bt9pqJnVwMWCxvrUSVS0bZMOfjd+cOyaftNJXTCNIdf98xj9FJo4zTqF8Oi
	kIqT6cbHMX9a8I6ZIvtTbXWp9At47o9nqMxY8oRy3nUvdwigupmCKMXDm8kr0gSI
	rTRja8JGspysZ8UQce2+LhP5q8avXm6uCDPfFr6SZLwA4BUoU+RTYU9/3T/4BC4H
	bxfOs/gJuGD4sa+BMCVAQ4k2sVviifCjbub+QxvHYreUGw/ID5OjsYCygtrer9yP
	+Lbg8f0nSk+OME5NKSG9Ik/08xE40WxRKvSnmYJxjQ8vLiey3rDNIag1XW/AS/vd
	WoSTvXiR1DMbnYuryiwZeA==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqp21r3mm-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 29 Nov 2025 03:54:39 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 28 Nov 2025 19:54:37 -0800
Received: from oak-lpgbuild14.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 28 Nov 2025 19:54:37 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <alex@linutronix.de>
Subject: [OE-core][PATCH V2 2/2] rootfs-postcommands.bbclass: remove the '\n' in 'no password' banner
Date: Sat, 29 Nov 2025 03:54:36 +0000
Message-ID: <20251129035436.249679-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251129035436.249679-1-Qi.Chen@windriver.com>
References: <20251129035436.249679-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: EosUOWFo1n5RQ8M5VlF0onlfyer55n56
X-Authority-Analysis: v=2.4 cv=OLAqHCaB c=1 sm=1 tr=0 ts=692a6e7f cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=REMLytHimOLY3GlGwUcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDAyNyBTYWx0ZWRfX06I3XtAD5yQa
 Kh3V1T3U4fOC8nVYSfqLYBfh0pNawbTPiPFe9wfXaFAfkwR56k+aHAOX8qLgkmFPN02zNX8q8a+
 dG24XtZ/0VOYJg7kdZjJd5yUPfYJqnf829BJ61dpEv9wtakblxLfI+bFbGS2pvQKrCNCsj7TsEM
 KaasRf60C2Rn5cq9DImidpzKM0Kq7z26YVYEMQpIMOeESyRxKG7cdjgPAwkhJpX7j2Jo0fMycA9
 9+Uh6OLT7hSwWVbHD3FA36+uNi3k5jdoqJrpXdHOG/A3Nem9bzdt5Od4Uew0hslaAc4YZ+EFF12
 RERVaAikuNtmDeGZEDjmdaU3tlZmhkfttQ2PAio3ivCD4BnoKeeAGOdGoM6NW1bd/x5K1LZo3bo
 0pnNYdf77iJnnAR8z7biTaxag3LE5Q==
X-Proofpoint-ORIG-GUID: EosUOWFo1n5RQ8M5VlF0onlfyer55n56
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511290027
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Nov 2025 03:54:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226926

From: Chen Qi <Qi.Chen@windriver.com>

The '\n' means hostname instead of new line in /etc/issues.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes-recipe/rootfs-postcommands.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/classes-recipe/rootfs-postcommands.bbclass
index bcc25798b9..3c4edc0301 100644
--- a/meta/classes-recipe/rootfs-postcommands.bbclass
+++ b/meta/classes-recipe/rootfs-postcommands.bbclass
@@ -262,7 +262,7 @@ add_empty_root_password_note () {
 	rootpw="`grep '^root:' ${IMAGE_ROOTFS}/etc/shadow | cut -d':' -f2`"
 	rootpw_lastchanged="`grep "^root:" ${IMAGE_ROOTFS}/etc/shadow | cut -d: -f3`"
 	if [ -z "$rootpw" -a "$rootpw_lastchanged" != "0" ]; then
-		echo "Type 'root' to login with superuser privileges (no password will be asked).\n" >> ${IMAGE_ROOTFS}/etc/issue
+		echo "Type 'root' to login with superuser privileges (no password will be asked)." >> ${IMAGE_ROOTFS}/etc/issue
 	fi
 }
 
-- 
2.43.0


