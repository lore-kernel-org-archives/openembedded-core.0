Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0FF8CA1000
	for <webhook@archiver.kernel.org>; Sat, 30 Aug 2025 17:02:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.14026.1756573360371853833
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Aug 2025 10:02:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=PlvVYZbK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1337cb0bab=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57UGodYd649794
	for <openembedded-core@lists.openembedded.org>; Sat, 30 Aug 2025 10:02:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=ZaJX1gqSSVHXZwjTNQtRpw5MDZ6A3EiQ0JXjV9UM9Ck=; b=PlvVYZbKSGt8
	qsq0/mA0b38OLiHojrnvizGF8PiribRhv9L1tDCVYqWxcF9ojgzKuUbyWmjRYBB3
	D0WoKRFcSfVTpVW0IRxVSQ53zrK+aZUrMadHg4MzdyT85uOggsYktNVWYA1Zrlcz
	lK98lQL0gPVeHg3O41zuTuRx0ceBtDvK+zIWsvVItoqhaagf8s8lz0I1jnwzC1+P
	pTtFXL3ZlcXhdG/3XNZZAQgBoN5N9dQPI7IXhwyX15ip72zbJNPkwm3XYXUZdtpS
	Q5TOFjmRauraKDdeaK9GD1q1sM5eygOSw9gZjuleasfGpk9ArWsKpcxIS7pj+UXI
	zY/X6NJGJQ==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48uvjyr8w9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 30 Aug 2025 10:02:39 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Sat, 30 Aug 2025 10:02:37 -0700
Received: from pop-os.wrs.com (10.11.232.110) by ala-exchng01.corp.ad.wrs.com
 (10.11.224.121) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Sat, 30 Aug 2025 10:02:37 -0700
From: <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] stress-ng: upgrade 0.19.02 -> 0.19.03
Date: Sat, 30 Aug 2025 13:02:37 -0400
Message-ID: <20250830170237.3756511-2-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250830170237.3756511-1-Randy.MacLeod@windriver.com>
References: <20250830170237.3756511-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=K8wiHzWI c=1 sm=1 tr=0 ts=68b32eaf cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=2OwXVqhp2XgA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=z-b7nkVXqeyGS_NhI58A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: nmnM-2f0pAaondRVNUGpBSu-EBbVEHHw
X-Proofpoint-ORIG-GUID: nmnM-2f0pAaondRVNUGpBSu-EBbVEHHw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDE3OSBTYWx0ZWRfX/GUrNQ0/1ihI
 6DS0x/9A9eocpIS+DMRYwcI1vAu6hPXLPFpyP8rXQxsahxlBtiV7urweyeUlcAYlCDxecXNcD0e
 MzDK5Q+YGTwVboFpr+h1Mwi1jbrbkAGU+WJrcrJpwKx+53z7LrjpFGZb6SLmTofvYSuuKZILTQm
 zLF/EE/Iajuz7rV63XmQslJrsu6BOK9RQOb1oo1uQ5xDcKN/DpVp+vfAMJF39S/phbuD5CPhZKI
 dJFPf+360taM4JELI5B/MrkDauw7YvvHPiCnHiaDRc1/szTt2RnDdQr68OYf6pSKiL1YiRl7+2b
 5uJRcsz9+R4yoTOPg0FEoze+Jqm7MC7/rsXLnuu4nwaONOxujw9vTdwS6xGpyY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-30_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Aug 2025 17:02:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222626

From: Randy MacLeod <Randy.MacLeod@windriver.com>

Improvements
    More progress feedback when sending ^C (SIGINT)
    Clean up manual
    Improved portability

Changelog:
   https://github.com/ColinIanKing/stress-ng/releases/tag/V0.19.03

Re-enable DEBUG_BUILDs since the upstream defect:
   https://github.com/ColinIanKing/stress-ng/issues/315
is resolved by:
   6e62dc1fb   2023-08-31   Makefile: force vnni to be built with at least -O2

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../stress-ng/{stress-ng_0.19.02.bb => stress-ng_0.19.03.bb} | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.19.02.bb => stress-ng_0.19.03.bb} (85%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.19.02.bb b/meta/recipes-extended/stress-ng/stress-ng_0.19.03.bb
similarity index 85%
rename from meta/recipes-extended/stress-ng/stress-ng_0.19.02.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.19.03.bb
index dd8d3a8406..96b68f4653 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.19.02.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.19.03.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master;tag=V${PV}"
-SRCREV = "8d5399b282225f758606cd2b522382f65d947a8d"
+SRCREV = "20e0f48cf0ca9cc96ed150c3dfa96f8e8a2f964b"
 
 DEPENDS = "coreutils-native libbsd"
 
@@ -29,6 +29,3 @@ do_install() {
     oe_runmake DESTDIR=${D} BINDIR=${bindir} install
     ln -s stress-ng ${D}${bindir}/stress
 }
-
-# upstream issue: https://github.com/ColinIanKing/stress-ng/issues/315
-DEBUG_BUILD = "0"
-- 
2.34.1


