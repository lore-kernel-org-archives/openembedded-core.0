Return-Path: <kraghava@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E06DFCA0FFD
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 05:10:57 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.43796.1756703451971024386
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Aug 2025 22:10:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=P9GGp7Xl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.168.131, mailfrom: kraghava@qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57VLTThM020624
	for <openembedded-core@lists.openembedded.org>; Mon, 1 Sep 2025 05:10:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=W82ODo2NZ81m3Vj1rAcpTlgrOxaYZyll/rk
	PK6QwtJ0=; b=P9GGp7Xl+wrEJA12ToGQpv5k5xyPcpHWMeKMU9gzDda5Kl59xyX
	YK6HbWdZcLUhKeCbBnZ6wNoIkhKldF7GlD3YmSO/MCZaRHS2LNl5xN5syJHT75lI
	Umrzg/05W24S9RW5Yl5D8p0UrY7PYd5LF19ULfmk2c/mwAlY0AIl0aztYYDfo3ad
	23Brdt7Qc/+FcbqrG7fd2JxjLzNXtSo6hKCMAROKSPA+hHYOiEmKkvTniGHchfkW
	yz2rlKNHsIamWE0rPZd719pSG82JGhvSZltwSWx+R1hwFWW0rsEjmeo0YHN3sx9Q
	4PkOJHsT4JeEnoxGTw/3oXe6G9Emr9kRNSg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8rud0g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 05:10:51 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5815Aktw009738
	for <openembedded-core@lists.openembedded.org>; Mon, 1 Sep 2025 05:10:46 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 48utckq39u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 05:10:46 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5815Akvv009732
	for <openembedded-core@lists.openembedded.org>; Mon, 1 Sep 2025 05:10:46 GMT
Received: from hyd-e160-a01-2-02.qualcomm.com (hyd-e160-a01-2-02.qualcomm.com [10.147.154.238])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5815Ak3n009731
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Sep 2025 05:10:46 +0000
Received: by hyd-e160-a01-2-02.qualcomm.com (Postfix, from userid 4755465)
	id 978DA21503; Mon,  1 Sep 2025 10:40:45 +0530 (IST)
From: Keerthivasan Raghavan <kraghava@qti.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Keerthivasan Raghavan <kraghava@qti.qualcomm.com>
Subject: [PATCH V1] coreutils_9.7.bb: fix update-alternative support for base32
Date: Mon,  1 Sep 2025 10:40:41 +0530
Message-Id: <20250901051041.1363297-1-kraghava@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfX03Btz/mRLuGM
 jImhrrU/WGT88l3lfwGA2i4c/0FvmVpm00bZKMzvu2PDBiECoPJt1OYXA/XOBkOQeB8Rd/MNTMK
 Ag6CFB3lLULEXhBOQQ4Moj2MTRwFUDaaGk5yKzCo5ffBile2k6uCjCW2ZwlWW8IGkPJnvv5pBtR
 +mSwL8Pl5j2XgYLC7MNZeCXonDFacfmOymLu49NLrLAaDY17S8N+pa89VJrpAGdXMwrUO+FRZTs
 Ot84TAD8L5feHy31Q3MEyONbQkQREN/fHmgMjYkkPmZQ/TIFRxctDPijSjLlrE/kofXZhWsQn8t
 bSyzvfxQK4m1IXLO10jfkheyMRwwG2wAmR4oKe4FqLEGcH9gvlA6XTIMnqtQ/Jdh/0QUhAw+KJa
 e9smm11t
X-Proofpoint-GUID: O0FWUUFF1RDb10yj8LTthsWbWgd6rlkX
X-Proofpoint-ORIG-GUID: O0FWUUFF1RDb10yj8LTthsWbWgd6rlkX
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68b52adb cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=B1UeBZm0CyNC-tZKImcA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1011
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 05:10:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222638

base32 is listed as update-alternative binary but does not
set the alternatie variables for it to take effect causing
the original ELF file to be installed in the destination
instead of the symlink. Fix this by setting the alternative
variables and by moving the original binary into subdir.

Signed-off-by: Keerthivasan Raghavan <kraghava@qti.qualcomm.com>
---
 meta/recipes-core/coreutils/coreutils_9.7.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/coreutils/coreutils_9.7.bb b/meta/recipes-core/coreutils/coreutils_9.7.bb
index 5a6456d65e..3658f7100c 100644
--- a/meta/recipes-core/coreutils/coreutils_9.7.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.7.bb
@@ -90,7 +90,7 @@ do_install:class-native() {
 }
 
 do_install:append() {
-	for i in df mktemp nice printenv base64; do mv ${D}${bindir}/$i ${D}${bindir}/$i.${BPN}; done
+	for i in df mktemp nice printenv base32 base64; do mv ${D}${bindir}/$i ${D}${bindir}/$i.${BPN}; done
 
 	install -d ${D}${base_bindir}
 	[ "${base_bindir}" != "${bindir}" ] && for i in ${base_bindir_progs}; do mv ${D}${bindir}/$i ${D}${base_bindir}/$i.${BPN}; done
@@ -110,10 +110,14 @@ ALTERNATIVE_PRIORITY = "100"
 # Make hostname's priority higher than busybox but lower than net-tools
 ALTERNATIVE_PRIORITY[hostname] = "90"
 ALTERNATIVE:${PN} = "lbracket ${bindir_progs} ${base_bindir_progs} ${sbindir_progs} base32 base64 nice printenv mktemp df"
-ALTERNATIVE:${PN}-doc = "base64.1 nice.1 mktemp.1 df.1 groups.1 kill.1 uptime.1 stat.1 hostname.1"
+ALTERNATIVE:${PN}-doc = "base32.1 base64.1 nice.1 mktemp.1 df.1 groups.1 kill.1 uptime.1 stat.1 hostname.1"
 
 ALTERNATIVE_LINK_NAME[hostname.1] = "${mandir}/man1/hostname.1"
 
+ALTERNATIVE_LINK_NAME[base32] = "${base_bindir}/base32"
+ALTERNATIVE_TARGET[base32] = "${bindir}/base32.${BPN}"
+ALTERNATIVE_LINK_NAME[base32.1] = "${mandir}/man1/base32.1"
+
 ALTERNATIVE_LINK_NAME[base64] = "${base_bindir}/base64"
 ALTERNATIVE_TARGET[base64] = "${bindir}/base64.${BPN}"
 ALTERNATIVE_LINK_NAME[base64.1] = "${mandir}/man1/base64.1"
-- 
2.34.1


