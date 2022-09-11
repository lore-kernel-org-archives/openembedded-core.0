Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84B44ECAAA1
	for <webhook@archiver.kernel.org>; Sun, 11 Sep 2022 08:48:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.8117.1662886081937433859
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Sep 2022 01:48:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=KqLV7Wlf;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=6253cbd39a=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28B8m1Cc027061
	for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Sep 2022 01:48:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : mime-version : content-type; s=PPS06212021;
 bh=qMvTgDKb+4bVsMeK5zw+iNmuPCEqnrQNMOLKXhR57Y4=;
 b=KqLV7WlffGbZBqM/fMZXGbdvXXwYsypOIWJ+E5vOGcI6nWYD4foQ8OUUNWc5Tswf6Btp
 fKNriS6fKGKMX/uK5gVg81+pR25C8uqrxKva/kph2MOR/ax1616XM13JppHxvq4u0bbo
 GPFuCLSI9vr/inJUAZ2vMdyQY4wT++Wo68NrJ5SAT/WfMXJ4LL4M54QiBapoFmIVCuSQ
 hPRG4yOdg82RlZMzpVFlZOhQW9p4trvPmORa9B0QoxKquLQig7Srx7nLWWnuotU6nrWM
 8L2poHRYo/qtGPMo1sLx/DhTxgMbC72mk2/lDMX4tvNzKJKhFj/0TMrTEjZmJNCvnN7W iA==
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jgnv68uwk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Sep 2022 01:48:01 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 11 Sep 2022 01:48:00 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Sun, 11 Sep 2022 01:48:00 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] binutils: update USE_ALTERNATIVES_FOR for symlink files
Date: Sun, 11 Sep 2022 16:47:56 +0800
Message-ID: <20220911084756.10315-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: 015RB3EtsDe18lMLpDlLNbLpsvaQDtXH
X-Proofpoint-ORIG-GUID: 015RB3EtsDe18lMLpDlLNbLpsvaQDtXH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-11_04,2022-09-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 mlxlogscore=636 mlxscore=0 spamscore=0 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209110034
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Sep 2022 08:48:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170517

From: Kai Kang <kai.kang@windriver.com>

It provides more binary files by binutils 2.39. Then add them to
USE_ALTERNATIVES_FOR as others to handle symlink files via
update-alternative mechanism.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-devtools/binutils/binutils.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 789c8bec21..9d33a64371 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -47,7 +47,13 @@ USE_ALTERNATIVES_FOR = " \
 	as \
 	c++filt \
 	elfedit \
+	gp-archive \
+	gp-collect-app \
+	gp-display-html \
+	gp-display-src \
+	gp-display-text \
 	gprof \
+	gprofng \
 	ld \
 	ld.bfd \
 	${LDGOLD_ALTS} \
-- 
2.17.1


