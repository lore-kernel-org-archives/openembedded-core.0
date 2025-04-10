Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C0F7C3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 22:01:26 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.10996.1744322475993352140
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 15:01:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=LeNYsAzE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AGG56B018394
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 22:01:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=tpu1dkNziVWUbx7kwpQr9JcpfX96q/CMt4W
	k6flFYvM=; b=LeNYsAzEeH7KxL9p42MJaE/LfczpJ3MEdZ2MnoHj97PSkseUanx
	LBoguU2jBHteCHqu98qOCiJoAg4ZpjhzasWxZYWIzJ8312KmF5LsOtXTtpZzEHs4
	434dodHMtrUiXwQSVIotc4yAYUxCi3hP0AdpEbVIY7oLMYKCmPti6DunRbrR7qMK
	ccpZIWDU47zcPRpXkzfKyUmZnR/rmVMmBpsMAcJg8FIqeNHlDxbLwt2umtLVONqv
	45qNgqKIOvoiCcT5HjwdFDRQV+3hloCJ70BEoS8cuwXTdtiJTJKtxK8e8EPUn9pI
	elaS9LbeVaUiCKhZq/6nsFM50e6Q49IywYw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twtb8ht2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 22:01:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2254bdd4982so17715855ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 15:01:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744322474; x=1744927274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tpu1dkNziVWUbx7kwpQr9JcpfX96q/CMt4Wk6flFYvM=;
        b=BTNrS0lH1xBLTf5/INP3+7CtBkb/ERNUkGJo4ff1BInYjco5hiUtwG886svK6JMBil
         G3h9jLGXQLJhtpHqsdzZFA1wNzXqD5txDBdvuSuKIHq/8xZ79FatwX12IYWxrXWlh4AB
         ARwxK+I6aaggamEGC4rDjlq0Kp/wVrUdOTZBzSudi8qXQVMxTmMtaf4473Qucjx7Qb2t
         BTGVA17PFMC8vklVQb6vtcfN7pMSVTak5bGGEV52ghK+q4IF/6K3W57/8cCEwgm8g06b
         ZOe4RwBuHBlGq2RlW52KXTme56vQWcv3Sw/8/hMn50PjvI1dQAP4aeuwPYID+3OHS2yt
         o+AA==
X-Gm-Message-State: AOJu0YwlACPocHx3E4ORl13JMV6TrTfTg4EWWdnXpyKZxlDB/cdHsGCK
	eqKawiw57Z4LinaJ0j5lAM1V4oSYlJjV+uVu0CXdD3v6DUJJzZIq3ctxylKt1/xbzFAyS5QdV9d
	ACc9DEZNit/MA5ow4jULNnfWvZeaNCeDUGtj5q0uZdGmBqw1TRDWv5DlyD0lMG1XhiBHAKXusv4
	2dLGMXV/lU0wo=
X-Gm-Gg: ASbGncu0Vd772rL8LqWKgMhInA3dSq8zJ3F7PAXW3F0Ip3wrH59IPEeCBicbvOFBibG
	SZT579iJgnTqqHmhfulw6KMMaszoeeoJanpNv/UeDb4IFz5hSR1CrXLUi2D+VCPH3+K7BNLyrMV
	o1sDS3dEFS+7tuzN0P6W1iIOEHvbBgsJiadeiBHSrHJoPJpZd+2oN0v5pLNymgTfSMowPeG30E4
	IUnIrbPuvEmTJEVFMKTgKoi3Czg8PB+MultC0rrxcEpyteRRyQBHETPuZu2t8xyXjo5zZqeqT4e
	WAvBf+ZB21+XtawXRD6+n6ipogG64aNkRWjL7oiw/UHPRAhTcOJpOsIcWGlb7PwbK99416M9tSG
	N2j0cSr7oQ1iRgK781OatQvbN
X-Received: by 2002:a17:902:d4cf:b0:220:d078:eb33 with SMTP id d9443c01a7336-22bea4eefc6mr5136845ad.36.1744322473804;
        Thu, 10 Apr 2025 15:01:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtsccYTwcNBu/I9xIA/12wIeUU97i8dELKhLIpiOOtvmeXvwXO+2x+QkLyGp2xZ2C+M0/dzA==
X-Received: by 2002:a17:902:d4cf:b0:220:d078:eb33 with SMTP id d9443c01a7336-22bea4eefc6mr5135995ad.36.1744322472747;
        Thu, 10 Apr 2025 15:01:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d520011sm258136e87.243.2025.04.10.15.01.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 15:01:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-firmware: upgrade 20250311 -> 20250410
Date: Fri, 11 Apr 2025 01:01:07 +0300
Message-Id: <20250410220107.1584394-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: a8tHmbVs9z2zFZmpQ41XH_n8jXszyYmN
X-Authority-Analysis: v=2.4 cv=LLlmQIW9 c=1 sm=1 tr=0 ts=67f83fab cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=qtA3iuvjaZh4sjnKcnsA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: a8tHmbVs9z2zFZmpQ41XH_n8jXszyYmN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_07,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=999 malwarescore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100160
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 22:01:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214711

Update the recipe, add firmware for Qualcomm QCS8300 RIDE board and
Lenovo Yoga Slim7x laptop. Extend firmware files used for Lenovo
ThinkPad T14s laptop.

License-Update: additional files

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...20250311.bb => linux-firmware_20250410.bb} | 41 +++++++++++++++----
 1 file changed, 34 insertions(+), 7 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20250311.bb => linux-firmware_20250410.bb} (96%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250311.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250410.bb
similarity index 96%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20250311.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20250410.bb
index 675d37837662..f12bb2c6d37d 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250311.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250410.bb
@@ -160,7 +160,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "886924eb733c4efcec21dff980795771"
+WHENCE_CHKSUM  = "7ddfb44c16e34dcd8bbacc4839ab78dc"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -250,7 +250,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "b1083a36f19aea46f661dcfd4cd462d13933dcb4e7f0dc809525552dd5c3541d"
+SRC_URI[sha256sum] = "2ae6aab2d8930fd54bf30ae15498f1625721bc3630b894644db5d21fad5a20f9"
 
 inherit allarch
 
@@ -479,7 +479,9 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-qcm2290-adreno ${PN}-qcom-qcm2290-audio ${PN}-qcom-qcm2290-modem \
              ${PN}-qcom-qcm6490-adreno \
              ${PN}-qcom-qcm6490-audio ${PN}-qcom-qcm6490-compute ${PN}-qcom-qcm6490-ipa ${PN}-qcom-qcm6490-wifi \
-             ${PN}-qcom-qcs615-adreno ${PN}-qcom-qcs8300-adreno \
+             ${PN}-qcom-qcs615-adreno \
+             ${PN}-qcom-qcs8300-adreno ${PN}-qcom-qcs8300-audio ${PN}-qcom-qcs8300-compute \
+             ${PN}-qcom-qcs8300-generalpurpose \
              ${PN}-qcom-qrb4210-adreno \
              ${PN}-qcom-qrb4210-audio ${PN}-qcom-qrb4210-compute ${PN}-qcom-qrb4210-modem \
              ${PN}-qcom-sa8775p-adreno ${PN}-qcom-sa8775p-audio ${PN}-qcom-sa8775p-compute \
@@ -497,7 +499,9 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-sm8650-audio-tplg \
              ${PN}-qcom-x1e80100-adreno ${PN}-qcom-x1e80100-audio \
              ${PN}-qcom-x1e80100-lenovo-t14s-g6-adreno ${PN}-qcom-x1e80100-lenovo-t14s-g6-audio \
-             ${PN}-qcom-x1e80100-lenovo-t14s-g6-compute \
+             ${PN}-qcom-x1e80100-lenovo-t14s-g6-compute ${PN}-qcom-x1e80100-lenovo-t14s-g6-vpu \
+             ${PN}-qcom-x1e80100-lenovo-yoga-slim7x-adreno ${PN}-qcom-x1e80100-lenovo-yoga-slim7x-audio \
+             ${PN}-qcom-x1e80100-lenovo-yoga-slim7x-compute ${PN}-qcom-x1e80100-lenovo-yoga-slim7x-vpu \
              ${PN}-qla2xxx ${PN}-qla2xxx-license \
              ${PN}-rockchip-license ${PN}-rockchip-dptx \
              ${PN}-amlogic-vdec-license ${PN}-amlogic-vdec \
@@ -1811,6 +1815,9 @@ LICENSE:${PN}-qcom-qcm6490-ipa  = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcm6490-wifi  = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcs615-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcs8300-adreno = "Firmware-qcom"
+LICENSE:${PN}-qcom-qcs8300-audio = "Firmware-qcom-2"
+LICENSE:${PN}-qcom-qcs8300-compute = "Firmware-qcom-2"
+LICENSE:${PN}-qcom-qcs8300-generalpurpose = "Firmware-qcom-2"
 LICENSE:${PN}-qcom-qrb4210-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-qrb4210-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-qrb4210-compute  = "Firmware-qcom"
@@ -1838,8 +1845,13 @@ LICENSE:${PN}-qcom-sm8650-audio-tplg = "Firmware-linaro"
 LICENSE:${PN}-qcom-x1e80100-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-x1e80100-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-x1e80100-lenovo-t14s-g6-adreno = "Firmware-qcom"
-LICENSE:${PN}-qcom-x1e80100-lenovo-t14s-g6-audio = "Firmware-qcom"
+LICENSE:${PN}-qcom-x1e80100-lenovo-t14s-g6-audio = "Firmware-qcom & Firmware-linaro"
 LICENSE:${PN}-qcom-x1e80100-lenovo-t14s-g6-compute = "Firmware-qcom"
+LICENSE:${PN}-qcom-x1e80100-lenovo-t14s-g6-vpu = "Firmware-qcom"
+LICENSE:${PN}-qcom-x1e80100-lenovo-yoga-slim7x-adreno = "Firmware-qcom"
+LICENSE:${PN}-qcom-x1e80100-lenovo-yoga-slim7x-audio = "Firmware-qcom & Firmware-linaro"
+LICENSE:${PN}-qcom-x1e80100-lenovo-yoga-slim7x-compute = "Firmware-qcom"
+LICENSE:${PN}-qcom-x1e80100-lenovo-yoga-slim7x-vpu = "Firmware-qcom"
 
 FILES:${PN}-qcom-license   = "${nonarch_base_libdir}/firmware/LICENSE.qcom ${nonarch_base_libdir}/firmware/qcom/NOTICE.txt"
 FILES:${PN}-qcom-2-license   = "${nonarch_base_libdir}/firmware/LICENSE.qcom-2"
@@ -1885,6 +1897,9 @@ FILES:${PN}-qcom-qcm6490-ipa = "${nonarch_base_libdir}/firmware/qcom/qcm6490/ipa
 FILES:${PN}-qcom-qcm6490-wifi = "${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/wpss.mbn*"
 FILES:${PN}-qcom-qcs615-adreno = "${nonarch_base_libdir}/firmware/qcom/qcs615/a612_zap.mbn*"
 FILES:${PN}-qcom-qcs8300-adreno = "${nonarch_base_libdir}/firmware/qcom/qcs8300/a623_zap.mbn*"
+FILES:${PN}-qcom-qcs8300-audio = "${nonarch_base_libdir}/firmware/qcom/qcs8300/adsp*.*"
+FILES:${PN}-qcom-qcs8300-compute = "${nonarch_base_libdir}/firmware/qcom/qcs8300/cdsp*.*"
+FILES:${PN}-qcom-qcs8300-generalpurpose = "${nonarch_base_libdir}/firmware/qcom/qcs8300/gpdsp*.*"
 FILES:${PN}-qcom-qrb4210-adreno = "${nonarch_base_libdir}/firmware/qcom/qrb4210/a610_zap.mbn*"
 FILES:${PN}-qcom-qrb4210-audio = "${nonarch_base_libdir}/firmware/qcom/qrb4210/adsp*.*"
 FILES:${PN}-qcom-qrb4210-compute = "${nonarch_base_libdir}/firmware/qcom/qrb4210/cdsp*.*"
@@ -1914,8 +1929,13 @@ FILES:${PN}-qcom-sm8650-audio-tplg = "${nonarch_base_libdir}/firmware/qcom/sm865
 FILES:${PN}-qcom-x1e80100-adreno = "${nonarch_base_libdir}/firmware/qcom/x1e80100/gen70500_zap.mbn*"
 FILES:${PN}-qcom-x1e80100-audio = "${nonarch_base_libdir}/firmware/qcom/x1e80100/adsp*.* ${nonarch_base_libdir}/firmware/qcom/x1e80100/battmgr.jsn"
 FILES:${PN}-qcom-x1e80100-lenovo-t14s-g6-adreno = "${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/21N1/qcdxkmsuc8380.mbn*"
-FILES:${PN}-qcom-x1e80100-lenovo-t14s-g6-audio = "${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/21N1/*adsp*.* ${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/21N1/battmgr.jsn*"
+FILES:${PN}-qcom-x1e80100-lenovo-t14s-g6-audio = "${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/21N1/*adsp*.* ${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/21N1/battmgr.jsn* ${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/21N1/X1E80100-LENOVO-Thinkpad-T14s-tplg.bin* ${nonarch_base_libdir}/firmware/qcom/x1e80100/X1E80100-LENOVO-Thinkpad-T14s-tplg.bin*"
 FILES:${PN}-qcom-x1e80100-lenovo-t14s-g6-compute = "${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/21N1/*cdsp*.*"
+FILES:${PN}-qcom-x1e80100-lenovo-t14s-g6-vpu = "${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/21N1/qcvss8380.mbn*"
+FILES:${PN}-qcom-x1e80100-lenovo-yoga-slim7x-adreno = "${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/83ED/qcdxkmsuc8380.mbn*"
+FILES:${PN}-qcom-x1e80100-lenovo-yoga-slim7x-audio = "${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/83ED/*adsp*.* ${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/83ED/battmgr.jsn* ${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/83ED/X1E80100-LENOVO-Yoga-Slim7x-tplg.bin* ${nonarch_base_libdir}/firmware/qcom/x1e80100/X1E80100-LENOVO-Yoga-Slim7x-tplg.bin*"
+FILES:${PN}-qcom-x1e80100-lenovo-yoga-slim7x-compute = "${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/83ED/*cdsp*.*"
+FILES:${PN}-qcom-x1e80100-lenovo-yoga-slim7x-vpu = "${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/83ED/qcvss8380.mbn* ${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/83ED/qcav1e8380.mbn*"
 
 RDEPENDS:${PN}-qcom-aic100 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qdu100 = "${PN}-qcom-license"
@@ -1957,6 +1977,9 @@ RDEPENDS:${PN}-qcom-qcm6490-wifi = "${PN}-qcom-license"
 RPROVIDES:${PN}-qcom-qcm6490-wifi = "${PN}-qcom-qcs6490-wifi"
 RDEPENDS:${PN}-qcom-qcs615-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcs8300-adreno = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-qcs8300-audio = "${PN}-qcom-2-license"
+RDEPENDS:${PN}-qcom-qcs8300-compute = "${PN}-qcom-2-license"
+RDEPENDS:${PN}-qcom-qcs8300-generalpurpose = "${PN}-qcom-2-license"
 RDEPENDS:${PN}-qcom-qrb4210-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qrb4210-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qrb4210-compute = "${PN}-qcom-license"
@@ -1986,8 +2009,12 @@ RDEPENDS:${PN}-qcom-sm8650-audio-tplg = "${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-x1e80100-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-x1e80100-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-x1e80100-lenovo-t14s-g6-adreno = "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-x1e80100-lenovo-t14s-g6-audio = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-x1e80100-lenovo-t14s-g6-audio = "${PN}-qcom-license ${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-x1e80100-lenovo-t14s-g6-compute = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-x1e80100-lenovo-yoga-slim7x-adreno = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-x1e80100-lenovo-yoga-slim7x-audio = "${PN}-qcom-license ${PN}-linaro-license"
+RDEPENDS:${PN}-qcom-x1e80100-lenovo-yoga-slim7x-compute = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-x1e80100-lenovo-yoga-slim7x-vpu = "${PN}-qcom-license"
 
 RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
 RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
-- 
2.39.5


