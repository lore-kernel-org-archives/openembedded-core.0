Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED412D3E766
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 17:58:53 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2286.1765389533431549183
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Dec 2025 09:58:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ACJlmRZT;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=ie6iwvog;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BAATtCW1602690
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 17:58:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WI6tSkMrHDbIYq9ujSo0hOXwzvVBM/EkCkv
	jZI/yORk=; b=ACJlmRZTZCYbtwjuR2Bt24DHtgc7ZbAGWnFlPmNFHIH3oz5AzqG
	C+k21UjecJv6hKFguNps6EckKy6lYb6Y8z06P6+Xheswy8CInBigxt60PCGOI/jA
	6cCXoaQYrc5YPkHGFI///upOJxGjg7BCt0iu5mQrttNXCODXxe2iQPMdF5Je4W/W
	DH7XGVzjzi6trqu4ps9IMQkOaiBNgMN6CHFKi+EMqrV2IutrUaBafQTpZ64HhGhQ
	PkcM1QS3jfiF2FQwGexkRH5uYm+rnVZfv780u+wp1QcoL2bPTFsw7mhec9qNZFW/
	ailtjQIU5m80BPVOSCil4tMjTl8UjyLnJXA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay75q9ejb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 17:58:52 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5595bbdbf49so78211e0c.3
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 09:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765389531; x=1765994331; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=WI6tSkMrHDbIYq9ujSo0hOXwzvVBM/EkCkvjZI/yORk=;
        b=ie6iwvogGB2nqeUNq6ub0qXfqzvGke7E/3tABeYxx2+6WorMfGW6h6O92kkIk/t4A2
         4QRpNMTqUcN0/u4369XXnsvBE7TSTGd5mgO5VEyQDSqKkHOmileO/kfrGw9jP+aSg70P
         9ApcOfduhmJ8GOsDLGhV6kdXn3kLlRQJQys7EfPzUVi5iiSdeF9bwDD8NfgJFonlcXn7
         N2/YqHeRMBzHWrvjgpToq516NQGiCHxPVIQ5j9zDnLN3FsZiRycMPFNeR+RAh4aGHV6q
         Mg8pgIEJywWGgoE5QxyDZ/KRAHAkuzEMGDesiWZe9vyvI5LHQojZLft/SkAvsgwz6NxM
         /+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765389531; x=1765994331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WI6tSkMrHDbIYq9ujSo0hOXwzvVBM/EkCkvjZI/yORk=;
        b=ciZAUm3RRIhOm8dvZA4GNY/FXM4pfXAMf/8f083f/IsKeFVjKEl4FPD9BFimMshNWc
         b0hKLaY46n9+yz/zovOJe/V18Nk/GhNTRCznp52qvRldyQD3skHLwjk1eXx2rHGC1iHJ
         FjG6v1jt9W9cGdVeAsBiD2hAg//3Jb1K7j+V+PhYy2ltFjeewQb1KxvGnFh5V1RV4/7M
         mR1BDgRMno5jqws+6ERf3WbwZQwwS7pWiu22ZYQ7moBUw8E0eVoLFomzVRKzHbnCG2R5
         LDR0PnUn/RR74uAd1pF8Taf2EVDgmE72BV1/npbOWuNMaQ/dKsHZDrGNn28moGhii9FM
         LrdQ==
X-Gm-Message-State: AOJu0YzDCoh107RymifB196LuQxe6f5nG9Sc+NMjKkeYt+lOqfJ8jxuE
	SL2AIpPXWyMTwm/l9A8uMGtyaqu9LnXA9AYau83WXanuJUqKd8xVvAOVxAa7joOAdbB+RYGfUpl
	nFE0VcD6WkkFLwA+yXf52JwtF9mkztv8wXgfSTJ96jYNKO2uHDoXoiwlEaI0VtvGY3qGKvJQLEV
	kyhh5U5iF7DgON5oY=
X-Gm-Gg: AY/fxX6m/G2X6UIa5iLu0Xavj1ip8KrogTcDF1acwK+akifcr7idby9tO9PIa7A13Vs
	X5+GVNl1/kbB07DLRqLTqEG/9zilTvfnaoy9MK8MhudnCJDDMMjRr3US7VbHrZI85GI2Uf9H7DJ
	BFQqxw+H4Gsp7UPSp8Hw7+pC9j5Fr7KKKB7dAkx7RJVUEn+t6bAdcHjmnFQubGbU9zJJ5T5dyly
	0NL7UtJb57gwEzbSki4U4e+E8Yg4CwXE3Xvi1Wu7S1t0ZyGx0AENwSyNnUL9c4A21vxY7qbI/Ab
	dY4Ys4rVI5W+nfNtLMtBROC/GP8s8FQRFBZWp+pxuMCA09YsGyJ7PFd22BQbLLh8byHMNFtNz57
	lIDqGEJVvxaL4eApVBRSoVdtEZfnDpbpFSkWYMTqIv2O+rqveqB45eVkb0Eo/ndZ3DQiNIvYRis
	e1GPgr0L8ur9F1hG7bViZtOzA=
X-Received: by 2002:a05:6122:3c55:b0:55b:9c1c:c995 with SMTP id 71dfb90a1353d-55fcfc59f16mr943031e0c.18.1765389531524;
        Wed, 10 Dec 2025 09:58:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGxGt+dbW4Z4bL6jfH9Y+enQAHRVBjvMWAJj1E29OrFME6dlXJqfqGbeXrTixlR24NdIzokyA==
X-Received: by 2002:a05:6122:3c55:b0:55b:9c1c:c995 with SMTP id 71dfb90a1353d-55fcfc59f16mr943025e0c.18.1765389530915;
        Wed, 10 Dec 2025 09:58:50 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37fbca98bccsm221771fa.50.2025.12.10.09.58.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 09:58:50 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 1/4] mesa: fix drivers sorting order
Date: Wed, 10 Dec 2025 19:58:46 +0200
Message-ID: <20251210175849.1989610-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Nz7A1Aa6KRQww1Ng0AXujvk-bedc97JO
X-Proofpoint-ORIG-GUID: Nz7A1Aa6KRQww1Ng0AXujvk-bedc97JO
X-Authority-Analysis: v=2.4 cv=NtrcssdJ c=1 sm=1 tr=0 ts=6939b4dc cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=CSqd8LzyNWODBqvqKkwA:9 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDE0NiBTYWx0ZWRfX6l/Z0D+EbLCM
 wY31n/fIU6m8hm1eyqIlVVc8UKUq3MiyrdzT+ttl1ioI51peu10thDTtLVVfS/mTw0Wk/IWAE+z
 lWS2p+AVmVtIChLP5US6EV0asujFciMDVsQjm6pnITshXrqnom+b9TvUoDxHQJOV1mvqFRobP6a
 ToAeS8Q5daWGOmSSaaV1qH+m5LLqbMa364K9sAfoB0xHwi+S8FhYrOG16JE3tSvfT3A0Dvv0OEg
 9JrF0rLnUy+QOu9hvSVnZ3rh0ySd/H6FlsRO6LEcqR2mtjKvJEZVWtghBh96hxdFuD1DBn9+mtm
 IPbmN95WjHHbxi75xbFjsW+UQWwNAoM1czUkETWnxQ3uLA+tY/IdG8U9Vu6tEK8GuGuRkTaiYOz
 mDSutRFM17/5xImsc1LfidxdBgc3Wg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_02,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100146
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 17:58:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227489

Fix few issues that were left unnoticed or breaking sorting order.

Fixes: 64108679ada8 ("mesa: sort out driver lists")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 27483f69514d..9b25bc0301f0 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -129,8 +129,8 @@ VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'broadcom', ',broadcom'
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'imagination', ',imagination-experimental', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel libclc gallium-llvm', ',intel', '', d)}"
-VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', '${VULKAN_DRIVERS_SWRAST}', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'panfrost libclc', ',panfrost', '', d)}"
+VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', '${VULKAN_DRIVERS_SWRAST}', '', d)}"
 
 PACKAGECONFIG[vulkan] = "-Dvulkan-drivers=${@strip_comma('${VULKAN_DRIVERS}')}, -Dvulkan-drivers='',glslang-native vulkan-loader vulkan-headers"
 PACKAGECONFIG[vulkan-beta] = "-Dvulkan-beta=true,-Dvulkan-beta=false"
@@ -176,9 +176,9 @@ GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'amd gallium-llvm', ',r
 GALLIUMDRIVERS .= "${GALLIUMDRIVERS_SOFTPIPE}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'svga gallium-llvm', ',svga', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'tegra', ',tegra', '', d)}"
-GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'virgl', ',virgl', '', d)}"
-GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'vc4', ',vc4', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'v3d', ',v3d', '', d)}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'vc4', ',vc4', '', d)}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'virgl', ',virgl', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'zink', ',zink', '', d)}"
 
 PACKAGECONFIG[gallium] = "-Dgallium-drivers=${@strip_comma('${GALLIUMDRIVERS}')}, -Dgallium-drivers='', libdrm"
-- 
2.47.3


