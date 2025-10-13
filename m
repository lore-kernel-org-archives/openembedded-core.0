Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46975CCD183
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 18:04:01 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.51793.1760378633714117638
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Oct 2025 11:03:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=M1hbtWgg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DHDEup008174
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 18:03:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=vuntHQ8l3FQLI43tJi5qPrg0y8rUbSYKeEX
	Xq0+oBHA=; b=M1hbtWggvl5ytdxksDhOSNIduvdwM5TFwi01eFLtg1qtci7TuoO
	CVua3VDPJyXnx9O9DT406g21gDLemM9x6AwHO9srhtV1lcCFwhX73+6PFqE7lPuy
	vVGt89eopYBSWEmWSDpQKK+/fhpFcZfepF8aysY46ikoLgZPC/L3Df3czUt2rXhP
	wCs1tEzHc+sxE7Df1M0KrI9g5iCmVOClNigGBGjbTBkBr1DutPHx9r1pTfu8IFbX
	ja8ISi0gO60NkXXGFacHC72jTQpfmI4PyObWZYlAd7PEdezvPonXOaZDh2zH7HVS
	xwa/WfYyGGSSf1JshFJT/WquUNO85rHxLlQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rtrt2ddx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 18:03:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-87561645c1cso2533300285a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 11:03:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760378631; x=1760983431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vuntHQ8l3FQLI43tJi5qPrg0y8rUbSYKeEXXq0+oBHA=;
        b=NE46Qwicu6U2d9tjgN4uxkBfCkl1FPhjv6ifwf/l1DumkPQVwB1tsOVNcCo0bsD3ks
         WnEsJcS7f3+XXrXsP4NhwIl74PRu/Jm/hZz60oXJMGjazlkW3SGsjD9lh0vAnsK+exqM
         O3RJKy7rOZv714LOGYfww7MScmXuAtzSalsM3trUKRraBnGpbpV+LLARGOdGETuKYJUC
         sSw0NkWoVw6tNL+rY7zVsFYotPC4AElYHa795/8S1BWMb+ot2fMctX6DZxCv+4mREKR8
         +2CK5GymmKRlJPhJOgNS3SXymkqozyVVF/Tx9dSPVDgkxiNaIpS8zO2xXfzlxVTdO5g8
         vHug==
X-Gm-Message-State: AOJu0YxvleWhmBWHCbeRfULyy6s3c+ozhpKBpEUEDnwPSmBDajROnv15
	vWY0Eng7pyXY553sDqHOmpGfZNMiJocOPmSL6HjojAxVzx8xAwL9NGKANBM+Q0XwPz8L+Ue94sO
	e8MOEVTCHtPBEtddSlpVHJ63k20uBvPiXi/Iu+6tMfQBnERel0NFZ3Tnu3XYFAWv2rR4WLho9xD
	GMJqdDBmMMu3o2QNs=
X-Gm-Gg: ASbGncvaqFJMWmYQ+vcJWpfTyPFjToP42S8PlrUlMq/VEp7gOl2CWeYHQU4FwX/VRDN
	3fu70n8fL5RWhAGsqY/y3e0xYMwI4cj7mRB0SiYXnqNlynIQ3MY3+i6NFjHCU0Negd3zPLmqitv
	YDEacpdPoNJrcqBSiHMuH1kqu/uQcQxnqwZ9F8CahXSAg4zGg7Op2BvME6pOWD66Mg4Kec9xN7x
	19ICHQOx/0XWUCnsjw3I+TK/lgM8sB/hmZkQbvd4bAemfjmZa4VkYcQyakuny3aYLOojuZJ6nBs
	U0m45Wm8Yb2eD+NbyFZUKzG0yC052PNAdba9F9yHRFEJF7kJLmjIzWd8qwljMIok0WEr1NHTWrs
	zUvpG+VXfqOxL0cdz0ay5dOoezTTmpuMjp2GOPu06aS9/7Mx1Y9cx
X-Received: by 2002:a05:620a:708e:b0:828:6c7b:8f65 with SMTP id af79cd13be357-88352f8450emr3272263685a.31.1760378631114;
        Mon, 13 Oct 2025 11:03:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOdt36Dm/0PmitF9mqb8qTJivczFAvEWQcsryS3up4edmhQ64Wd4QHrAf2kBxl2mPcmKpYug==
X-Received: by 2002:a05:620a:708e:b0:828:6c7b:8f65 with SMTP id af79cd13be357-88352f8450emr3272254285a.31.1760378630306;
        Mon, 13 Oct 2025 11:03:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e5790sm4357490e87.19.2025.10.13.11.03.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 11:03:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] linux-firmware: drop catch-all Atheros packages
Date: Mon, 13 Oct 2025 21:03:47 +0300
Message-ID: <20251013180348.3061809-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: jMFVbhsm1n_0rHp_qvTPZofxgc9tupL-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyMiBTYWx0ZWRfX3E3KHgrhpKe1
 X4X/s/XcdCav6N67TkfSJpSQvy4LjWP2gAAUzvV9RXjVH6a8LRTEVwDhS5tSDFKnIunPV+Jm36o
 3guYPiGGjo0jbIgV9ZXveNKHbgJ6n0K7PRIVsX5AIKfEQbB4CdlN3yltBbAuylQxsw9sw7TYC7K
 ft1FMbQ0jY+MLx7pUZQA4EHP3krr5Wt4AD6Yo73LzNqIv75kCIzA9IVLgtJpx23hIqqMtG1bP3e
 RE+vGb7MT3mfumuQhHhrKDLF/z/liNDEHSYKHKfT8rsVV8VB5VyAW4xj1hqStLPzLekKz8gNQzH
 8Yd38LnHieDf20Je3iBDSYmq8xEjUEubZMi6Yorz3l6mCSyGw+6CiEzPTWgzU///R2k5OR0LFAm
 to88FOoc6UALEzufc2lRoIxpMM9IDg==
X-Authority-Analysis: v=2.4 cv=SfD6t/Ru c=1 sm=1 tr=0 ts=68ed3f08 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=EUspDBNiAAAA:8 a=Hpv2iyr_TndDikbCMhMA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: jMFVbhsm1n_0rHp_qvTPZofxgc9tupL-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130022
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 18:04:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224790

With the linux-firmware now being an empty package there is no need in
the catch-all ${PN}-ath*k-misc packages since developers will have to
package all firmware separately. Drop useless packages now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../linux-firmware/linux-firmware_20250917.bb | 21 -------------------
 1 file changed, 21 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250917.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250917.bb
index 9a12f454356b..3830ca59a2fe 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250917.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250917.bb
@@ -606,7 +606,6 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-ath10k-qca9984 \
              ${PN}-ath10k-qca99x0 \
              ${PN}-ath10k-wcn3990 \
-             ${PN}-ath10k-misc \
              ${PN}-ath11k \
              ${PN}-ath11k-ipq5018 \
              ${PN}-ath11k-ipq6018 \
@@ -617,11 +616,9 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-ath11k-qcn9074 \
              ${PN}-ath11k-wcn6750 \
              ${PN}-ath11k-wcn6855 \
-             ${PN}-ath11k-misc \
              ${PN}-ath12k \
              ${PN}-ath12k-qcn9274 \
              ${PN}-ath12k-wcn7850 \
-             ${PN}-ath12k-misc \
              ${PN}-qca \
              ${PN}-qca-qca61x4-serial \
              ${PN}-qca-qca61x4-usb \
@@ -894,7 +891,6 @@ LICENSE:${PN}-ath10k-qca988x = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath10k-qca9984 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath10k-qca99x0 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath10k-wcn3990 = "Firmware-qualcommAthos_ath10k"
-LICENSE:${PN}-ath10k-misc    = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath10k-license = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath11k = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath11k-ipq5018 = "Firmware-qualcommAthos_ath10k"
@@ -906,11 +902,9 @@ LICENSE:${PN}-ath11k-qca6698aq = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath11k-qcn9074 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath11k-wcn6750 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath11k-wcn6855 = "Firmware-qualcommAthos_ath10k"
-LICENSE:${PN}-ath11k-misc    = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath12k = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath12k-qcn9274 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath12k-wcn7850 = "Firmware-qualcommAthos_ath10k"
-LICENSE:${PN}-ath12k-misc = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-qca-qca61x4-serial = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-qca-qca61x4-usb = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-qca-qca6390 = "Firmware-qualcommAthos_ath10k"
@@ -938,12 +932,8 @@ FILES:${PN}-ath10k-qca988x = "${nonarch_base_libdir}/firmware/ath10k/QCA988X"
 FILES:${PN}-ath10k-qca9984 = "${nonarch_base_libdir}/firmware/ath10k/QCA9984"
 FILES:${PN}-ath10k-qca99x0 = "${nonarch_base_libdir}/firmware/ath10k/QCA99X0"
 FILES:${PN}-ath10k-wcn3990 = "${nonarch_base_libdir}/firmware/ath10k/WCN3990"
-FILES:${PN}-ath10k-misc = "${nonarch_base_libdir}/firmware/ath10k/*"
 # -ath10k is a virtual package that depends upon all ath10k packages.
 ALLOW_EMPTY:${PN}-ath10k = "1"
-# -ath10k-misc is a catch all package that includes all the ath10k
-# firmwares that are not already included in other -ath10k- packages.
-ALLOW_EMPTY:${PN}-ath10k-misc = "1"
 
 FILES:${PN}-ath11k-ipq5018 = "${nonarch_base_libdir}/firmware/ath11k/IPQ5018"
 FILES:${PN}-ath11k-ipq6018 = "${nonarch_base_libdir}/firmware/ath11k/IPQ6018"
@@ -954,21 +944,13 @@ FILES:${PN}-ath11k-qca6698aq = "${nonarch_base_libdir}/firmware/ath11k/QCA6698AQ
 FILES:${PN}-ath11k-qcn9074 = "${nonarch_base_libdir}/firmware/ath11k/QCN9074"
 FILES:${PN}-ath11k-wcn6750 = "${nonarch_base_libdir}/firmware/ath11k/WCN6750"
 FILES:${PN}-ath11k-wcn6855 = "${nonarch_base_libdir}/firmware/ath11k/WCN6855"
-FILES:${PN}-ath11k-misc = "${nonarch_base_libdir}/firmware/ath11k/*"
 # -ath11k is a virtual package that depends upon all ath11k packages.
 ALLOW_EMPTY:${PN}-ath11k = "1"
-# -ath11k-misc is a catch all package that includes all the ath11k
-# firmwares that are not already included in other -ath11k- packages.
-ALLOW_EMPTY:${PN}-ath11k-misc = "1"
 
 FILES:${PN}-ath12k-qcn9274 = "${nonarch_base_libdir}/firmware/ath12k/QCN9274"
 FILES:${PN}-ath12k-wcn7850 = "${nonarch_base_libdir}/firmware/ath12k/WCN7850"
-FILES:${PN}-ath12k-misc = "${nonarch_base_libdir}/firmware/ath12k/*"
 # -ath12k is a virtual package that depends upon all ath12k packages.
 ALLOW_EMPTY:${PN}-ath12k = "1"
-# -ath12k-misc is a catch all package that includes all the ath12k
-# firmwares that are not already included in other -ath12k- packages.
-ALLOW_EMPTY:${PN}-ath12k-misc = "1"
 
 FILES:${PN}-qca-qca61x4-serial = " \
   ${nonarch_base_libdir}/firmware/qca/nvm_0*.bin* \
@@ -1078,7 +1060,6 @@ RDEPENDS:${PN}-ath10k-qca988x += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath10k-qca9984 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath10k-qca99x0 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath10k-wcn3990 += "${PN}-ath10k-license"
-RDEPENDS:${PN}-ath10k-misc += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath11k += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath11k-ipq5018 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath11k-ipq6018 += "${PN}-ath10k-license"
@@ -1089,11 +1070,9 @@ RDEPENDS:${PN}-ath11k-qca6698aq += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath11k-qcn9074 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath11k-wcn6750 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath11k-wcn6855 += "${PN}-ath10k-license"
-RDEPENDS:${PN}-ath11k-misc += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath12k += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath12k-qcn9274 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath12k-wcn7850 += "${PN}-ath10k-license"
-RDEPENDS:${PN}-ath12k-misc += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca += "${PN}-ath10k-license ${PN}-qcom-license"
 RDEPENDS:${PN}-qca-qca61x4-serial += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca-qca61x4-usb += "${PN}-ath10k-license"
-- 
2.47.3


