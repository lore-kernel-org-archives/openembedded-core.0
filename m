Return-Path: <yue.tao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A62FC433EF
	for <webhook@archiver.kernel.org>; Mon, 25 Jul 2022 08:10:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.25676.1658736614134076904
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jul 2022 01:10:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=NPDqkmSe;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=4205e3d8d6=yue.tao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 26P7w7PP014357
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Jul 2022 08:10:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PPS06212021;
 bh=RlbxYQITGJpFHdFrip/1GIkNcc9jjQ4jBaBypByoiWY=;
 b=NPDqkmSee/7UCbWkgXoryOXcENr8K1geUFkxVW1PomTQ31uKwAaQAr0rFf4PEfnPEpdM
 eLUcXp1Vht7LJ+4WQo6DmIUrvDboS+Kq/KN9e33v9Tqo2zueAGE4Rj4HZM22Otb95ObY
 eqT3T4bbafaQ3izzuu2X7hJ8xVZdAZHnF6D8dLPTeNcNLBC3QkwWi2aPZM6K5EGt5y0r
 vLtUvucd6saBMJs9ow+0C6OK4zC+Ln1pNhJCJF8i44ghTcpxmSBd2+PGci6HXaLS7sXu
 iXvG6UQ0Xrxc9d4aQ7WGruUio0GXQEhAjUepjlMAJavNile1QBrk6G4KDsHn0DsgGy9M zw==
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hg7y8sd9a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jul 2022 08:10:13 +0000
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 25 Jul 2022 01:10:12 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 25 Jul 2022 01:10:11 -0700
Received: from pek-ytao-d1.wrs.com (128.224.34.179) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 25 Jul 2022 01:10:11 -0700
From: Yue Tao <yue.tao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <yue.tao@windriver.com>
Subject: [kirkstone][PATCH 2/2] gnupg: upgrade to 2.3.7 to fix CVE-2022-34903
Date: Mon, 25 Jul 2022 16:10:07 +0800
Message-ID: <20220725081007.31172-2-yue.tao@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220725081007.31172-1-yue.tao@windriver.com>
References: <20220725081007.31172-1-yue.tao@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: VCf9A5trGRAqk6IjtyItYX4TGoceIZUP
X-Proofpoint-ORIG-GUID: VCf9A5trGRAqk6IjtyItYX4TGoceIZUP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-23_02,2022-07-21_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=642 lowpriorityscore=0 adultscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207250035
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Jul 2022 08:10:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168471

Signed-off-by: Yue Tao <yue.tao@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/gnupg/{gnupg_2.3.6.bb => gnupg_2.3.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gnupg/{gnupg_2.3.6.bb => gnupg_2.3.7.bb} (97%)

diff --git a/meta/recipes-support/gnupg/gnupg_2.3.6.bb b/meta/recipes-support/gnupg/gnupg_2.3.7.bb
similarity index 97%
rename from meta/recipes-support/gnupg/gnupg_2.3.6.bb
rename to meta/recipes-support/gnupg/gnupg_2.3.7.bb
index f35eb8c75a..da2b1c4deb 100644
--- a/meta/recipes-support/gnupg/gnupg_2.3.6.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.3.7.bb
@@ -23,7 +23,7 @@ SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "21f7fe2fc5c2f214184ab050977ec7a8e304e58bfae2ab098fec69f8fabda9c1"
+SRC_URI[sha256sum] = "ee163a5fb9ec99ffc1b18e65faef8d086800c5713d15a672ab57d3799da83669"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.17.1


