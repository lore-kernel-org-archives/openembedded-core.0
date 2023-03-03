Return-Path: <romuald.jeanne@st.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99BFBC64EC4
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 10:54:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
 by mx.groups.io with SMTP id smtpd.web11.20313.1677840858733625642
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Mar 2023 02:54:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@st.com header.s=stmicroelectronics header.b=0GJrCThS;
 spf=pass (domain: st.com, ip: 185.132.182.106, mailfrom: prvs=1426d6bd6c=romuald.jeanne@st.com)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32387p9r019095
	for <openembedded-core@lists.openembedded.org>; Fri, 3 Mar 2023 11:54:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=UqaEv67/ZFUPZLRACEmFoiRjmZ+a1dxvdQxTKqk/W40=;
 b=0GJrCThS0coVV3tbDiAmPHFHyE52NjDAm5ezFG29/nhw0HOGxUJS5aQcetA3oYlhmyI5
 yPiugN/7Ia8k7QzJDngztJjYzsz0EeJNj+i9T7gm14XLS9+tgDbguHZaba9DNBWk+ZDT
 KfqzTS7EJzamIrTdKM3PR4MCz+p4dWzzUybB91+sxgKruBgPh73TTvjRhKyIZdpbRE08
 ReXpyBGEf5dHb1Q/SO9mYAYs/8L9qz5N0ZPdH6IWCm9mhf4GYKmskIck5axtc86eRsBv
 U8nskrUcfXFsF9YhhtUI/GpEhqmd/IrSAPrXu2xdYsDEB6xgtCvp/Mj5fYMvLb3xMIx5 ig== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3p2r880j2p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 11:54:16 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8388710002A
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Mar 2023 11:54:14 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DC622216EC5
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Mar 2023 11:54:14 +0100 (CET)
Received: from localhost (10.201.23.79) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Fri, 3 Mar
 2023 11:54:14 +0100
From: <romuald.jeanne@st.com>
To: <openembedded-core@lists.openembedded.org>
CC: Romuald JEANNE <romuald.jeanne@st.com>
Subject: [PATCH] image_types: fix vname var init in multiubi_mkfs() function
Date: Fri, 3 Mar 2023 11:54:10 +0100
Message-ID: <20230303105410.2413-1-romuald.jeanne@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.201.23.79]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-03_01,2023-03-03_01,2023-02-09_01
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 10:54:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177985

From: Romuald JEANNE <romuald.jeanne@st.com>

As vname var is needed in multiubi_mkfs() function, we need to keep it
defined and use it as parameter to the new write_ubi_config() function.

See [YOCTO #15027]

Signed-off-by: Romuald JEANNE <romuald.jeanne@st.com>
---
 meta/classes-recipe/image_types.bbclass | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/image_types.bbclass
index 764e6a5574..77cb22cf9c 100644
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
+	if [ -z "$1" ]; then
+		local vname=""
+	else
+		local vname="_$3"
+	fi
+	write_ubi_config "${vname}"
 
 	if [ -n "$vname" ]; then
 		mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${IMGDEPLOYDIR}/${IMAGE_NAME}${vname}${IMAGE_NAME_SUFFIX}.ubifs ${mkubifs_args}
-- 
2.17.1


