Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07576D232FF
	for <webhook@archiver.kernel.org>; Sat, 10 Jan 2026 18:48:26 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14195.1768070903354512051
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Jan 2026 10:48:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=CSE/WLu3;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=JWx+Bm2i;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60AG03hF289273
	for <openembedded-core@lists.openembedded.org>; Sat, 10 Jan 2026 18:48:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CrQLljDYAEb
	IBcymVffCU4RVJQ1yRzJOesVyD7+vD4A=; b=CSE/WLu31bRHGq3+Rkn8DINZtnL
	wEu/nwNNnOScYj91M0xMl26ivk95cE2zAqMtOxkMjBvthXjkBqLzH8/bP3Um17ou
	5GnsekdBPfzym/81BsZ2nBga6mvm17F5Y3/sGvTNWJT1w9muiC4+ayR6WpfVRmyL
	3DLf8bQnaZQ/xd5NK1tQelYNbCripb1UvFX/51Aze1/X+gKRYbY6KQ4cpoz4Dkdi
	gVHLwuWtAZlXBTpedR3rry++BVn3BO2lgO1nAliPAzYRVE60B9Ti3USgT9Q/lssQ
	or45uwODRb5ctYcVDumI3QKEuta7+1MkjAdY63CGOfRx54OCaIX4LWYkuQg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkdqqs7cu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 10 Jan 2026 18:48:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2ea3d12fcso1257016585a.0
        for <openembedded-core@lists.openembedded.org>; Sat, 10 Jan 2026 10:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768070901; x=1768675701; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CrQLljDYAEbIBcymVffCU4RVJQ1yRzJOesVyD7+vD4A=;
        b=JWx+Bm2iPMsHB5S2qYc9Dz13upapitjcnQ0bzfWEFkBcq0aPMJx1IR/KTKHYfP/SzG
         AlYPYy0EIgdmuBU8SuJ2u7TmEqz7dVe1cD+Uw1f8famL5x7Y/cv7xaoGaveBJE5HZQ9d
         uDR7BAUqOHZ1m4mh147nopv/NL8E3vHT0Gc9XhiIi6V+f3tHHPGtvygNl8v+9jhuQcIC
         11xu/s3kCRuwxYf4jGAnqVLIOHVG22od6+ZWKUtTtaALCqxaxf1Yzlu/QPoc12OCsgcV
         XsArv3lPe4SpINm9YfkC9U7y71+gZ/CBgnWDPYMu5aNO+RbVex0qCJPnphjV/rCPDuM0
         2BNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768070901; x=1768675701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CrQLljDYAEbIBcymVffCU4RVJQ1yRzJOesVyD7+vD4A=;
        b=LLWopdBr+HLR0bQcCJJFf3lHS01y5DpCASwVDZp17bVhZW5GTi4GmAjc2Ke19hKVyk
         Et9hH8m2UHs2bVLl4eg+tkEYUaUOmE3GYZLhHTS44KyIIvq2LYtFUfDpXtyX5CjuURjR
         3y3JAAwxmfWpdtducnb7Dgs66+lgoMzxBBzSmwUtJqAO9fwPKENDmdAfgzd0pF37+ojw
         mfIqHVD+LAKerVy7h+sZDMjpEZcYr8hE6ixiH9fF0zmjoH+VczoqxukffAKuMctVawE/
         mAzNv3gU1EIYx/671Y0R0wj0+JDRCQJf3/FMkVC1Ph7/R5tMveJJQ5dKJfdgEPb42fOI
         UFJQ==
X-Gm-Message-State: AOJu0Yz2Zov0WUmLgQmvCd8ZL9WbRmHOxO6Zwzg+lWAUsRH2j6fG43C7
	ulR7q7LMCPDJxXDKNd2f6YCFEsnC+Tii+2Yi6ZWfiiNZJ2VpSEjvtG1MOOpSSW9n7t0nxSHQfCc
	50dMYNMYVEB44j+7GjpoWKL/i4WJ+Xezk/4phyMEZMlIRtrI5A/b0zAdraSdQh5HKkyQIayHVe/
	FW5JLH2pJVcOhpnW2tM0uA
X-Gm-Gg: AY/fxX593p/5AYv5tmEPVwlDYB0aocYM+UNVikr0RVrkv7cgecbhKjAir2SERZKzvs2
	zB7OvkX3H6qOZFWAhxmDRApr4qUP0qeAKCiBezzO8WR7IBGba6hryHJjJIAzH1u6rNbKpPI/ndD
	bYAlNuu9bdIg6lFLG7A1Ypom9wb98YoMaGkqiJ/J2PDfHLVfBNNQuqorTsSfSgRP00uCdqemgM+
	Q2oHvKzcgeLLd1Y2vVizT27kWH9Bg8cYZDnRm9UyMiRFh6wKCr4MMFW2J9LgzEsl7dTAJbCjK/U
	4Dr4NVCf92CuZrKmTpZAGqy7IwjugltGkcLdcodLytBprkxmz5ArOr17e0OT4llIMKwagyBjhkF
	ng7VEBez5OnTFdZ7k+S/R8DlsW85+Sqx10og5gXIbkwQ/MlphE97mH3xtDU62AidWxqC9IqQKfy
	AdpiZxMIBL59lTl3F2K9VydLU=
X-Received: by 2002:a05:620a:4484:b0:8b2:e986:26ff with SMTP id af79cd13be357-8c38940bcc4mr1864523685a.66.1768070901434;
        Sat, 10 Jan 2026 10:48:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1kGDUZ3ey0UlSw28M54pY2SsLJ7LgRNqSCaIZAca4EJhF3OYb3t4dfojEeR/cjQJjFPwnqQ==
X-Received: by 2002:a05:620a:4484:b0:8b2:e986:26ff with SMTP id af79cd13be357-8c38940bcc4mr1864521485a.66.1768070900871;
        Sat, 10 Jan 2026 10:48:20 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb3a053esm28879261fa.5.2026.01.10.10.48.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 10:48:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] linux-firmware: sort Qualcomm QCA firmware entries
Date: Sat, 10 Jan 2026 20:48:15 +0200
Message-ID: <20260110184815.642069-2-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260110184815.642069-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20260110184815.642069-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: lUyQ3M83fvcZpNkQZ5vbO5bzWY76x2fE
X-Proofpoint-GUID: lUyQ3M83fvcZpNkQZ5vbO5bzWY76x2fE
X-Authority-Analysis: v=2.4 cv=a9M9NESF c=1 sm=1 tr=0 ts=69629ef7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=V2gWEa8RpvRcWswn34wA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDE2NiBTYWx0ZWRfX9MdLAlkOoQXo
 qIvbJri+mZhhMGbGmdVHj19F9F+GUDAxHkVRKcZqxiMgxndyc7csvaV0c5TqGqgKswafeWG80kC
 +VFg4pgSRTagrt89qqSY2eZGUJZwEq8/WmCwPdPtm6esmxjG4HVwp9QdX1cHJOptev9kfP8NWiM
 H5nWPa0s1yqwFea5jPWU/8SE3zB6SUS5U6ujsxOToUOjjT/9fmWnMeWFxBsXTa3vg8vSziK6P27
 Zz8xNsRIVSP9yWbmJICq9aLfNp3/LMamQax8ppC0d/XcH8PgEbfj81w3HQopvYVa96YVUqIUcEJ
 ylsSEjLrrJT4kYOdfZAL7Y/L99BBCagt4vJBRDbULxJVVVnhdlzFOC/MdshA+bef2Oh18BhJV7a
 IIcPcreGKPvj8ZhDWGgawaTZeArXuqC6H509w6Q1rK+YoyIRzs8nVks9AludbJIgtkIhHd/BGOl
 X1SMRzBBcqYdvYVtBhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601100166
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Jan 2026 18:48:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229166

Move entries for Qualcomm QCA2066 firmware to the first place, keeping
all QCA firmware entries sorted

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../linux-firmware/linux-firmware_20260110.bb | 76 +++++++++----------
 1 file changed, 38 insertions(+), 38 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20260110.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20260110.bb
index d0ba0b2d8fa9..4324062726fc 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20260110.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20260110.bb
@@ -636,6 +636,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-ath12k-qcn9274 \
              ${PN}-ath12k-wcn7850 \
              ${PN}-qca \
+             ${PN}-qca-qca2066 \
              ${PN}-qca-qca61x4-serial \
              ${PN}-qca-qca61x4-usb \
              ${PN}-qca-qca6390 \
@@ -646,7 +647,6 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qca-wcn399x \
              ${PN}-qca-wcn6750 \
              ${PN}-qca-wcn685x \
-             ${PN}-qca-qca2066 \
              ${PN}-qca-wcn7850 \
              \
              ${PN}-imx-sdma-license ${PN}-imx-sdma-imx6q ${PN}-imx-sdma-imx7d \
@@ -934,6 +934,7 @@ LICENSE:${PN}-ath11k-wcn6855 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath12k = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath12k-qcn9274 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-ath12k-wcn7850 = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-qca-qca2066 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-qca-qca61x4-serial = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-qca-qca61x4-usb = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-qca-qca6390 = "Firmware-qualcommAthos_ath10k"
@@ -944,7 +945,6 @@ LICENSE:${PN}-qca-wcn3988 = "Firmware-qcom"
 LICENSE:${PN}-qca-wcn399x = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-qca-wcn6750 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-qca-wcn685x = "Firmware-qualcommAthos_ath10k"
-LICENSE:${PN}-qca-qca2066 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-qca-wcn7850 = "Firmware-qcom"
 
 FILES:${PN}-ar3k-license = "${nonarch_base_libdir}/firmware/LICENSE.QualcommAtheros_ar3k"
@@ -982,6 +982,41 @@ FILES:${PN}-ath12k-wcn7850 = "${nonarch_base_libdir}/firmware/ath12k/WCN7850"
 # -ath12k is a virtual package that depends upon all ath12k packages.
 ALLOW_EMPTY:${PN}-ath12k = "1"
 
+FILES:${PN}-qca-qca2066 = " \
+  ${nonarch_base_libdir}/firmware/qca/hpbtfw21.tlv* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.bin* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.bin* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.301* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.302* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.301* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.302* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.309* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.309* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.30a* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.30a* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.b8c* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.b9f* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.ba0* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.ba1* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.ba2* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.ba3* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.ba4* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.baa* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.bb8* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.b10c* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21.b111* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.b8c* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.b9f* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.ba0* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.ba1* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.ba2* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.ba3* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.ba4* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.baa* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.bb8* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.b10c* \
+  ${nonarch_base_libdir}/firmware/qca/hpnv21g.b111* \
+"
 FILES:${PN}-qca-qca61x4-serial = " \
   ${nonarch_base_libdir}/firmware/qca/nvm_0*.bin* \
   ${nonarch_base_libdir}/firmware/qca/rampatch_0*.bin* \
@@ -1040,41 +1075,6 @@ FILES:${PN}-qca-wcn685x = " \
   ${nonarch_base_libdir}/firmware/qca/wcnhpnv21.b* \
   ${nonarch_base_libdir}/firmware/qca/wcnhpnv21g.b* \
 "
-FILES:${PN}-qca-qca2066 = " \
-  ${nonarch_base_libdir}/firmware/qca/hpbtfw21.tlv* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.bin* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.bin* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.301* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.302* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.301* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.302* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.309* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.309* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.30a* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.30a* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.b8c* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.b9f* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.ba0* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.ba1* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.ba2* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.ba3* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.ba4* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.baa* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.bb8* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.b10c* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21.b111* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.b8c* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.b9f* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.ba0* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.ba1* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.ba2* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.ba3* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.ba4* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.baa* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.bb8* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.b10c* \
-  ${nonarch_base_libdir}/firmware/qca/hpnv21g.b111* \
-"
 FILES:${PN}-qca-wcn7850 = " \
   ${nonarch_base_libdir}/firmware/qca/hmtbtfw20.tlv* \
   ${nonarch_base_libdir}/firmware/qca/hmtnv20.b10f* \
@@ -1108,6 +1108,7 @@ RDEPENDS:${PN}-ath12k += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath12k-qcn9274 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-ath12k-wcn7850 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca += "${PN}-ath10k-license ${PN}-qcom-license"
+RDEPENDS:${PN}-qca-qca2066 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca-qca61x4-serial += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca-qca61x4-usb += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca-qca6390 += "${PN}-ath10k-license"
@@ -1118,7 +1119,6 @@ RDEPENDS:${PN}-qca-wcn3988 += "${PN}-qcom-license"
 RDEPENDS:${PN}-qca-wcn399x += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca-wcn6750 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca-wcn685x += "${PN}-ath10k-license"
-RDEPENDS:${PN}-qca-qca2066 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca-wcn7850 += "${PN}-qcom-license"
 # For ralink
 LICENSE:${PN}-ralink = "Firmware-ralink-firmware"
-- 
2.47.3


