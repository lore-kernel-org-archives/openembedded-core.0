Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 558D2C19F21
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 05:39:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.16444.1658900382216194738
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 22:39:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=O5IqTr7s;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=4207966b4e=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 26R5ajt3002885
	for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 22:39:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=n6xxVQjknBzipowAMhqI+CmMPtCvLQ9nscFyt2h5c70=;
 b=O5IqTr7sCc3qGccif+Dy9yhpUNGpwiYdAIo/q68C/y3atCZG/52clLBILIQjj/ohLLA0
 Ng2eVat4kccKr/Ir00SeT3nLV2/GhqXAPYXhtQuAj98EUm1RHHbkhhhl6VB/S3FujCR2
 zQqLRcb4ifHW5WXCazEpMhKU83fLs8eoYIAPzq8V7QBssnxO6Cv11cQM3J74vWIZRz3P
 85mf2rY5TPqXs1Yx6jKWryB/Y842ztp2OO0fMtm2QOmz6o+m/AfOjWf32t6q1lI0ApFk
 w+BzRJ9i/Rux58fPbpu/F1i1MgXdrOVowjoy/GaOhJX3SiRPrpwKGzezukr82Ud2kBpO Lw==
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hgggkaqwb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 22:39:41 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 26 Jul 2022 22:39:40 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 26 Jul 2022 22:39:40 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 26 Jul 2022 22:39:39 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][master][PATCH] apt: fix do_package_qa failure
Date: Wed, 27 Jul 2022 13:39:39 +0800
Message-ID: <20220727053939.353717-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 9ktthPsHvWPagDr1unC7P7twh55bh-_V
X-Proofpoint-GUID: 9ktthPsHvWPagDr1unC7P7twh55bh-_V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-26_07,2022-07-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=742
 impostorscore=0 bulkscore=0 clxscore=1011 adultscore=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207270019
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 05:39:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168542

From: Changqing Li <changqing.li@windriver.com>

bitbake nativesdk-apt failed with error:
ERROR: nativesdk-apt-2.4.5-r0 do_package_qa: QA Issue: nativesdk-apt installs files in /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/var/volatile, but it is expected to be empty [empty-dirs]

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-devtools/apt/apt_2.4.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/apt/apt_2.4.5.bb b/meta/recipes-devtools/apt/apt_2.4.5.bb
index 1d94dd118c..d79a33857a 100644
--- a/meta/recipes-devtools/apt/apt_2.4.5.bb
+++ b/meta/recipes-devtools/apt/apt_2.4.5.bb
@@ -123,6 +123,7 @@ do_install:append:class-native() {
 
 do_install:append:class-nativesdk() {
 	customize_apt_conf_sample
+	rm -rf ${D}${localstatedir}/log
 }
 
 do_install:append:class-target() {
-- 
2.25.1


