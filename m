Return-Path: <romuald.jeanne@st.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DD3CC61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 07:55:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
 by mx.groups.io with SMTP id smtpd.web10.8118.1678348500178615126
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Mar 2023 23:55:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@st.com header.s=stmicroelectronics header.b=kxcu+xit;
 spf=pass (domain: st.com, ip: 185.132.182.106, mailfrom: prvs=14325c65a3=romuald.jeanne@st.com)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3295ukN2030180
	for <openembedded-core@lists.openembedded.org>; Thu, 9 Mar 2023 08:54:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=4DcVY8mXWMXDtCMCfuIyRnLsWIIa4mtkvF3BLlt0Soc=;
 b=kxcu+xitEsncUGSe/WEKv2NTpabpS4CIsAclshmK84yDpi7/vVeXPm9gmptJg+OO1YHs
 2ZKxYZWBp//E8le3B6P9MSjGw+2BI/P6ZAfeqDGrtd3+T8kyNYLhvz2FaVze4iMNy+wt
 s7SShJB1Ke5PNwhVg/qq04CXlZfu3JQPzMUQgbOTlanVSgyb7b5HXErCmd6b1xDroHVo
 9dA8NBlHCqje+QvtcXQR7PF1T/ml6TD99ADwsAK41y1JWdBldLfUbdnqC/BoFx+rJorI
 SmHvAZbMbO3KDfz/ooeH7GVctvZQWseIns5mGK4l2SKwXQEtozz/aVIdJn3VBizfoHSv eQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3p6fdrsu60-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 08:54:58 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EDF7310002A
	for <openembedded-core@lists.openembedded.org>; Thu,  9 Mar 2023 08:54:57 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8ADE620F575
	for <openembedded-core@lists.openembedded.org>; Thu,  9 Mar 2023 08:54:57 +0100 (CET)
Received: from localhost (10.201.23.79) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Thu, 9 Mar
 2023 08:54:57 +0100
From: <romuald.jeanne@st.com>
To: <openembedded-core@lists.openembedded.org>
CC: Romuald JEANNE <romuald.jeanne@st.com>
Subject: [PATCH] image_types: fix vname var init in multiubi_mkfs() function
Date: Thu, 9 Mar 2023 08:54:52 +0100
Message-ID: <20230309075452.6463-1-romuald.jeanne@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.201.23.79]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-09_04,2023-03-08_03,2023-02-09_01
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 07:55:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178210

From: Romuald JEANNE <romuald.jeanne@st.com>

As vname var is needed in multiubi_mkfs() function, we need to keep it
defined and use it as parameter to the new write_ubi_config() function.

See [YOCTO #15027]

Signed-off-by: Romuald JEANNE <romuald.jeanne@st.com>
---
 meta/classes-recipe/image_types.bbclass | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/image_types.bbclass
index 764e6a5574..c6cb8f5336 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -157,11 +157,7 @@ UBI_VOLTYPE ?= "dynamic"
 UBI_IMGTYPE ?= "ubifs"
 
 write_ubi_config() {
-	if [ -z "$1" ]; then
-		local vname=""
-	else
-		local vname="_$1"
-	fi
+	local vname="$1"
 
 	cat <<EOF > ubinize${vname}-${IMAGE_NAME}.cfg
 [ubifs]
@@ -183,7 +179,12 @@ multiubi_mkfs() {
             bbfatal "MKUBIFS_ARGS and UBINIZE_ARGS have to be set, see http://www.linux-mtd.infradead.org/faq/ubifs.html for details"
         fi
 
-	write_ubi_config "$3"
+	if [ -z "$3" ]; then
+		local vname=""
+	else
+		local vname="_$3"
+	fi
+	write_ubi_config "${vname}"
 
 	if [ -n "$vname" ]; then
 		mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubifs ${mkubifs_args}
-- 
2.17.1


