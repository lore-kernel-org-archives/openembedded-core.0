Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DAC5EC1121
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 18:43:03 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1836.1771872174852958382
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 10:42:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=VjlmgqJx;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=MLbh+tip;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NAWJFA3733258
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 18:42:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=hhwnlzIrx0fwrMCEvHI6ZCmsP5KlnF2h5bC
	qwYmqDIo=; b=VjlmgqJxQnE10gUkGA82Usjf/pCGElxdEfHCTh6tzcJHg1wFwlj
	4a0fjPTXyTvOSUwrcI0hm3mER9P22ucc9cJYIb5czWVW7G2TiV9SOkN9BRwnX0Vf
	OYXA1tb/TfHwHnxTdUev8HU6326CJuqKT0jRipwm3uac7s/Jkgci+neQ+EzSFrD8
	ND1Ik5rXE/oBcbbTZoK3KZ+Y0gwi5pkKsTu5/nuXMFnEq91W6PTqIa8b/t+G8SCw
	pNin4OERuNzULYvVnG3rh0UmiJ5uELHCINVHiaXjaM8Vmr3xrrt+gEUCZxUoFSZs
	ssD1aPmZBa8h3z+WCJ4XP9qwDunz/sa3zcA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn7t9hec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 18:42:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb0595def4so5691199585a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 10:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771872173; x=1772476973; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hhwnlzIrx0fwrMCEvHI6ZCmsP5KlnF2h5bCqwYmqDIo=;
        b=MLbh+tip6ZeZNeoHZH2F1s3IcUlSC/wb9570ZDfpoNdRh7Q2nW7U4LuD38OQgzetOp
         azT2fY2UlccxXSQSPXz1YTVgVajzVEgRRWuHzmdzP2szUeoC2PAchleZlWs6LOZp2TJk
         MtgjSd0KHWLxNPyvkQ0oY90Gfr7fyyzYnWoog3H+Oq/H2sU51kckykRsRW+ihHvDVvaT
         G1zEkKWXOqa6gC/Ng/XVmhflwTLLLoX3Je6LlQm1wbchejK80Yjlo+I97Bl0dvX18uTs
         gKXYXr13w6RorR5wtN++s9raS1QHiQNw68KWWuIfHyGaYRniOnwAeKYSuMsh2sa+6lJ3
         Ln/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771872173; x=1772476973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hhwnlzIrx0fwrMCEvHI6ZCmsP5KlnF2h5bCqwYmqDIo=;
        b=BCSClot4RKSQDL+beZ5e/LlrzEyF9yjY+ZnyseBpmYj4EMzg9WQZIo7N3436TLC51L
         ml916yWh5sYJYxLG5AG2ixiRTY0xNlNSI+gg2FBoOAIU36jb1bgVIbANok30LDqVpog7
         a1nd/GJbOGCPK2u3Kk2MjK2Gw6CRKODMmzvyMXpJ+jz4MYfc2PlhWemc6h1dEjYTNxiu
         Yv5plHMwzqR7ai/HrRyy+EMwSto7SWy2E8cfu8nhUKAHskgs0lUrlVqPfLq8TumkfkwN
         WSpIsELjdR/FYnNFNXXBKgUZfsL3wUtZ62IbETEf/dFRyNDKbe+LB3m5vLCp2AwMNFeb
         Mp0w==
X-Gm-Message-State: AOJu0YxP2SKnsgco65uLOayw4gXZzjTjPA+O4COeMvN5zGUqvCPOCOAg
	quT7dPIEnQuF6QbyiYbgm2QCbOQmqhr3YybIE+TgnWcnJUVUORjq9bqGoWYm/vXHy+oyuERtmV4
	EdMjtWhuutHfGWDdT4oy/LIDT7Nuv0QflXhWPTE6w/fuQjhyYbWE+MQ530PWqo5AsBIYbE4xPR4
	KtNIJGVX0up8z1CDw=
X-Gm-Gg: AZuq6aJ9smF6pJCAc+WGI/Sz+YmHkCE+2uGaw6waiusVIJuBDX/UXXGwKv6YMj5/+YN
	lqcRCum3JmhZ88xDyZab2xFlWBD7un+w70XarinBKq7fnHJ/OsgT9OA7AP1srEs94XH9QkkMxcH
	qFnyyi9wlj4wha3SNgbLqHSi1iPwipvI0uw+6a84n4wc5/a967s0eRZ4ynql3rraOhBN/vuF1iC
	5fepogCe7myO0rOHeWXDD2aOO6z5H1w09d76WNy/Lk+O4/PioO+SO7nPLmrpWmzDExShDTFMvXH
	7rZCHmMkyer0owHEYoXSkShRAFgV4rF7E91ffLSrbwXLRyYBgQcN6DPrTbW+WkUW7J/TPLvcCyV
	3IZmUnOI04EEiyugn+KReDlAV/Wp/y1OvmJ6pQNGu8EWRBbdqWfSwSp2RO/QyqZBzRy8TYDte5o
	P2A0Kr1W7iZX1OtgOGemIiJ+ijXFSNkayhRZI=
X-Received: by 2002:a05:620a:4611:b0:88e:1be9:cf65 with SMTP id af79cd13be357-8cb7c0049dfmr1734061385a.39.1771872172160;
        Mon, 23 Feb 2026 10:42:52 -0800 (PST)
X-Received: by 2002:a05:620a:4611:b0:88e:1be9:cf65 with SMTP id af79cd13be357-8cb7c0049dfmr1734057285a.39.1771872171296;
        Mon, 23 Feb 2026 10:42:51 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb13abbsm1747541e87.23.2026.02.23.10.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 10:42:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Sairamreddy Bojja <sbojja@qti.qualcomm.com>,
        Vivek Puar <vpuar@qti.qualcomm.com>
Subject: [PATCH v2] linux-firmware: upgrade 20260110 -> 20260221
Date: Mon, 23 Feb 2026 20:42:47 +0200
Message-ID: <20260223184247.394616-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c5OmgB9l c=1 sm=1 tr=0 ts=699c9fad cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=KxUeQjSHhAUF4MBDIF4A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: Qpbo0_PS7723OEj_PhL8pwSAD1zDktrW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE2MiBTYWx0ZWRfX27bBelP0UaCP
 M+VstmA5tw2ALvq6lZ4TpW0/8M7h54jkvdDTSDDsSdOdlAAfSO17Ey3dDTNiAucxMBmEBJtVw5W
 VKJxQshTxafoe9Ep36TmnDzQdJtRl6fSz9pYYJHrPeufQrpSvV1aqltsA3fW9+Rj1rjxNgC1mTn
 OZKkqKxuIYbWKpfm4GgrqvCU/KxiO/hPpHtBOY4Qr8qiaDfpnWNJAkzFkP7cMx9KZ/XEt2LEEma
 EhMM2sKGS9s3QMG+3YO13UDEugdsiBJ250gA8F82ZmESM4XiUnX679WO2bYja6CvtXtu40VAafk
 V1qK/eAOWSD8JZhjN9hcBoYhI0WYXnqcnRrctr7Em+a9WR/JcXyECxDGKs533FgBTqtZAGT62SL
 Xf/aTdjRE5Eqlg01x2S8/+02joexH+onk831oNA/ArJuREJGdNnQdyhF/8hldfWbgxVgfb8LPDW
 Ay2r2+/bSMwAfW+D10A==
X-Proofpoint-ORIG-GUID: Qpbo0_PS7723OEj_PhL8pwSAD1zDktrW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230162
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 18:43:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231690

Upgrade the firmware package to latest release. Add firmware for TI
TAS2783, Qualcomm Adreno A801, Qualcomm Glymur, Radxa Dragon Q6A CDSP
and several Intel Sensors Hub firmware versions. Also pick up several
ADSP topologies for Qualcomm X Elite and Qualcomm SM8450 based devices.

License-Update: copyright years, new firmware
Co-developed-by: Sairamreddy Bojja <sbojja@qti.qualcomm.com>
Signed-off-by: Sairamreddy Bojja <sbojja@qti.qualcomm.com>
Cc: Vivek Puar <vpuar@qti.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...20260110.bb => linux-firmware_20260221.bb} | 164 +++++++++++++++---
 1 file changed, 137 insertions(+), 27 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20260110.bb => linux-firmware_20260221.bb} (95%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20260110.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20260221.bb
similarity index 95%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20260110.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20260221.bb
index fcf15c11f553..168ccaa6d52d 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20260110.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20260221.bb
@@ -314,7 +314,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "dec69e98d9a03fca5a9793e8d24c0b8d"
+WHENCE_CHKSUM  = "e3897ca46d046032a2b60b8554caf61d"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -452,7 +452,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "48e05166db539f4ee8d29ac9d236a94442c5b1b1a160a966f6fe6b42bd714331"
+SRC_URI[sha256sum] = "bd19acc4c1a02548e09d3df67f987fe6e378df735bab138c1d9e917962056d94"
 
 inherit allarch
 
@@ -556,7 +556,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-mwl8k ${PN}-mwlwifi\
              ${PN}-ti-connectivity-license ${PN}-wl1251-license ${PN}-wlcommon ${PN}-wl1251 ${PN}-wl12xx ${PN}-wl18xx ${PN}-cc33xx \
              ${PN}-ti-keystone-license ${PN}-ti-keystone \
-             ${PN}-ti-tspa-license ${PN}-ti-tas2563 ${PN}-ti-tas2781 ${PN}-ti-vpe \
+             ${PN}-ti-tspa-license ${PN}-ti-tas2563 ${PN}-ti-tas2781 ${PN}-ti-tas2783 ${PN}-ti-vpe \
              ${PN}-ti-usb-3410-5052 \
              ${PN}-vt6656-license ${PN}-vt6656 \
              ${PN}-rs9113 ${PN}-rs9116 ${PN}-rsi-91x \
@@ -712,15 +712,16 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-adreno-a650 ${PN}-qcom-adreno-a660 ${PN}-qcom-adreno-a663 \
              ${PN}-qcom-adreno-a702 ${PN}-qcom-adreno-a730 ${PN}-qcom-adreno-a740 \
              ${PN}-qcom-adreno-g705 ${PN}-qcom-adreno-g709 ${PN}-qcom-adreno-g715 \
-             ${PN}-qcom-adreno-g800 ${PN}-qcom-adreno-g802 \
+             ${PN}-qcom-adreno-g800 ${PN}-qcom-adreno-g801 ${PN}-qcom-adreno-g802 \
              ${PN}-qcom-apq8016-modem ${PN}-qcom-apq8016-wifi \
              ${PN}-qcom-apq8096-adreno ${PN}-qcom-apq8096-audio ${PN}-qcom-apq8096-modem \
+             ${PN}-qcom-glymur-adreno ${PN}-qcom-glymur-audio ${PN}-qcom-glymur-compute \
              ${PN}-qcom-kaanapali-adreno ${PN}-qcom-kaanapali-audio ${PN}-qcom-kaanapali-compute ${PN}-qcom-kaanapali-soccp \
              ${PN}-qcom-qcm2290-adreno ${PN}-qcom-qcm2290-audio ${PN}-qcom-qcm2290-modem \
              ${PN}-qcom-qcm6490-adreno ${PN}-qcom-qcm6490-audio ${PN}-qcom-qcm6490-compute \
              ${PN}-qcom-qcm6490-ipa ${PN}-qcom-qcm6490-wifi ${PN}-qcom-qcm6490-qupv3fw \
              ${PN}-qcom-qcs615-adreno ${PN}-qcom-qcs615-audio ${PN}-qcom-qcs615-compute \
-             ${PN}-qcom-qcs6490-radxa-dragon-q6a-audio \
+             ${PN}-qcom-qcs6490-radxa-dragon-q6a-audio ${PN}-qcom-qcs6490-radxa-dragon-q6a-compute \
              ${PN}-qcom-qcs6490-thundercomm-rubikpi3-audio \
              ${PN}-qcom-qcs8300-adreno ${PN}-qcom-qcs8300-audio ${PN}-qcom-qcs8300-compute \
              ${PN}-qcom-qcs8300-generalpurpose ${PN}-qcom-qcs8300-qupv3fw \
@@ -741,15 +742,23 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-sm8250-adreno ${PN}-qcom-sm8250-audio ${PN}-qcom-sm8250-compute \
              ${PN}-qcom-sm8250-thundercomm-rb5-sensors \
              ${PN}-qcom-sm8350-adreno \
-             ${PN}-qcom-sm8450-adreno \
+             ${PN}-qcom-sm8450-adreno ${PN}-qcom-sm8450-audio-tplg \
              ${PN}-qcom-sm8550-adreno ${PN}-qcom-sm8550-audio-tplg \
              ${PN}-qcom-sm8650-adreno ${PN}-qcom-sm8650-audio-tplg \
              ${PN}-qcom-sm8750-adreno ${PN}-qcom-sm8750-audio ${PN}-qcom-sm8750-compute \
+             ${PN}-qcom-x1e80100-asus-vivobook-16-audio-tplg \
+             ${PN}-qcom-x1e80100-asus-vivobook-s15-audio-tplg \
+             ${PN}-qcom-x1e80100-asus-zenbook-a14-audio-tplg \
+             ${PN}-qcom-x1e80100-dell-inspiron-14-plus-7441-audio-tplg \
+             ${PN}-qcom-x1e80100-dell-latitude-7455-audio-tplg \
+             ${PN}-qcom-x1e80100-dell-xps13-9345-audio-tplg \
+             ${PN}-qcom-x1e80100-hp-omnibook-x14-audio-tplg \
              ${PN}-qcom-x1e80100-adreno ${PN}-qcom-x1e80100-audio ${PN}-qcom-x1e80100-compute \
              ${PN}-qcom-x1e80100-lenovo-t14s-g6-adreno ${PN}-qcom-x1e80100-lenovo-t14s-g6-audio \
              ${PN}-qcom-x1e80100-lenovo-t14s-g6-compute ${PN}-qcom-x1e80100-lenovo-t14s-g6-vpu \
              ${PN}-qcom-x1e80100-lenovo-yoga-slim7x-adreno ${PN}-qcom-x1e80100-lenovo-yoga-slim7x-audio \
              ${PN}-qcom-x1e80100-lenovo-yoga-slim7x-compute ${PN}-qcom-x1e80100-lenovo-yoga-slim7x-vpu \
+             ${PN}-qcom-x1e80100-qupv3fw \
              ${PN}-qcom-x1p42100-adreno \
              ${PN}-qla2xxx ${PN}-qla2xxx-license \
              ${PN}-rockchip-license ${PN}-rockchip-dptx \
@@ -762,9 +771,9 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-xc5000c-license ${PN}-xc5000c \
              ${PN}-typhoon-license ${PN}-typhoon \
              ${PN}-intel-license ${PN}-ish-lnlm \
-             ${PN}-dell-license ${PN}-ish-lnlm-39ceeaf8 \
+             ${PN}-dell-license ${PN}-ish-lnlm-39ceeaf8 ${PN}-ish-ptl-39ceeaf8 \
              ${PN}-hp-license ${PN}-ish-lnlm-12128606 \
-             ${PN}-lenovo-license ${PN}-ish-lnlm-53c4ffad-2a17559f \
+             ${PN}-lenovo-license ${PN}-ish-lnlm-53c4ffad \
              ${PN}-ish-ptl \
              ${PN}-advansys-license ${PN}-advansys \
              ${PN}-aeonsemi-license ${PN}-as21xxx \
@@ -1808,6 +1817,14 @@ FILES:${PN}-ti-tas2781 = "\
 "
 RDEPENDS:${PN}-ti-tas2781 = "${PN}-ti-tspa-license"
 
+# For ti-tas2783 - tas2783 firmware
+LICENSE:${PN}-ti-tas2783 = "Firmware-ti-tspa"
+FILES:${PN}-ti-tas2783 = "\
+    ${nonarch_base_libdir}/firmware/8E[8F]*-?-?.bin* \
+    ${nonarch_base_libdir}/firmware/ti/audio/tas2783/* \
+"
+RDEPENDS:${PN}-ti-tas2781 = "${PN}-ti-tspa-license"
+
 # For ti-vpe - Texas Instruments V4L2 driver for Video Processing Engine
 LICENSE:${PN}-ti-vpe = "Firmware-ti-tspa"
 FILES:${PN}-ti-vpe = "${nonarch_base_libdir}/firmware/ti/vpdma-1b8.bin*"
@@ -2050,7 +2067,10 @@ FILES:${PN}-cirrus = " \
     ${nonarch_base_libdir}/firmware/cs42l43.bin* \
     ${nonarch_base_libdir}/firmware/cirrus/* \
 "
-FILES:${PN}-cirrus-cs42l45 = "${nonarch_base_libdir}/firmware/sdca/1fa/1028/*"
+FILES:${PN}-cirrus-cs42l45 = " \
+    ${nonarch_base_libdir}/firmware/sdca/1fa/1028/* \
+    ${nonarch_base_libdir}/firmware/sdca/1fa/17aa/* \
+"
 FILES:${PN}-cirrus-license = "${nonarch_base_libdir}/firmware/LICENSE.cirrus"
 
 RDEPENDS:${PN}-cirrus += "${PN}-cirrus-license"
@@ -2300,12 +2320,16 @@ LICENSE:${PN}-qcom-adreno-g705 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-g709 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-g715 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-g800 = "Firmware-qcom"
+LICENSE:${PN}-qcom-adreno-g801 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-g802 = "Firmware-qcom"
 LICENSE:${PN}-qcom-apq8016-modem = "Firmware-qcom"
 LICENSE:${PN}-qcom-apq8016-wifi = "Firmware-qcom"
 LICENSE:${PN}-qcom-apq8096-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-apq8096-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-apq8096-modem = "Firmware-qcom"
+LICENSE:${PN}-qcom-glymur-adreno = "Firmware-qcom"
+LICENSE:${PN}-qcom-glymur-audio = "Firmware-qcom-2"
+LICENSE:${PN}-qcom-glymur-compute = "Firmware-qcom-2"
 LICENSE:${PN}-qcom-kaanapali-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-kaanapali-audio = "Firmware-qcom-2"
 LICENSE:${PN}-qcom-kaanapali-compute = "Firmware-qcom-2"
@@ -2321,10 +2345,11 @@ LICENSE:${PN}-qcom-qcm6490-ipa  = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcm6490-wifi  = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcm6490-qupv3fw = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcs615-adreno = "Firmware-qcom"
-LICENSE:${PN}-qcom-qcs615-audio = "Firmware-qcom"
+LICENSE:${PN}-qcom-qcs615-audio = "Firmware-qcom & Firmware-linaro"
 LICENSE:${PN}-qcom-qcs615-compute = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcs6490-radxa-dragon-q6a-audio = "Firmware-qcom & Firmware-linaro"
-LICENSE:${PN}-qcom-qcs6490-thundercomm-rubikpi3-audio = "Firmware-qcom"
+LICENSE:${PN}-qcom-qcs6490-radxa-dragon-q6a-compute = "Firmware-qcom"
+LICENSE:${PN}-qcom-qcs6490-thundercomm-rubikpi3-audio = "Firmware-qcom & Firmware-linaro"
 LICENSE:${PN}-qcom-qcs8300-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcs8300-audio = "Firmware-qcom-2 & Firmware-linaro"
 LICENSE:${PN}-qcom-qcs8300-compute = "Firmware-qcom-2"
@@ -2359,16 +2384,24 @@ LICENSE:${PN}-qcom-sm8250-compute = "Firmware-qcom"
 LICENSE:${PN}-qcom-sm8250-thundercomm-rb5-sensors = "Firmware-qcom"
 LICENSE:${PN}-qcom-sm8350-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-sm8450-adreno = "Firmware-qcom"
+LICENSE:${PN}-qcom-sm8450-audio-tplg = "Firmware-linaro"
 LICENSE:${PN}-qcom-sm8550-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-sm8550-audio-tplg = "Firmware-linaro"
 LICENSE:${PN}-qcom-sm8650-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-sm8650-audio-tplg = "Firmware-linaro"
 LICENSE:${PN}-qcom-sm8750-adreno = "Firmware-qcom"
-LICENSE:${PN}-qcom-sm8750-audio = "Firmware-qcom-2"
+LICENSE:${PN}-qcom-sm8750-audio = "Firmware-qcom-2 & Firmware-linaro"
 LICENSE:${PN}-qcom-sm8750-compute = "Firmware-qcom-2"
 LICENSE:${PN}-qcom-x1e80100-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-x1e80100-audio = "Firmware-qcom-2 & Firmware-linaro"
 LICENSE:${PN}-qcom-x1e80100-compute = "Firmware-qcom"
+LICENSE:${PN}-qcom-x1e80100-asus-vivobook-16-audio-tplg = "Firmware-linaro"
+LICENSE:${PN}-qcom-x1e80100-asus-vivobook-s15-audio-tplg = "Firmware-linaro"
+LICENSE:${PN}-qcom-x1e80100-asus-zenbook-a14-audio-tplg = "Firmware-linaro"
+LICENSE:${PN}-qcom-x1e80100-dell-inspiron-14-plus-7441-audio-tplg = "Firmware-linaro"
+LICENSE:${PN}-qcom-x1e80100-dell-latitude-7455-audio-tplg = "Firmware-linaro"
+LICENSE:${PN}-qcom-x1e80100-dell-xps13-9345-audio-tplg = "Firmware-linaro"
+LICENSE:${PN}-qcom-x1e80100-hp-omnibook-x14-audio-tplg = "Firmware-linaro"
 LICENSE:${PN}-qcom-x1e80100-lenovo-t14s-g6-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-x1e80100-lenovo-t14s-g6-audio = "Firmware-qcom & Firmware-linaro"
 LICENSE:${PN}-qcom-x1e80100-lenovo-t14s-g6-compute = "Firmware-qcom"
@@ -2377,6 +2410,7 @@ LICENSE:${PN}-qcom-x1e80100-lenovo-yoga-slim7x-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-x1e80100-lenovo-yoga-slim7x-audio = "Firmware-qcom & Firmware-linaro"
 LICENSE:${PN}-qcom-x1e80100-lenovo-yoga-slim7x-compute = "Firmware-qcom"
 LICENSE:${PN}-qcom-x1e80100-lenovo-yoga-slim7x-vpu = "Firmware-qcom"
+LICENSE:${PN}-qcom-x1e80100-qupv3fw = "Firmware-qcom"
 LICENSE:${PN}-qcom-x1p42100-adreno = "Firmware-qcom"
 
 FILES:${PN}-qcom-license   = "${nonarch_base_libdir}/firmware/LICENSE.qcom ${nonarch_base_libdir}/firmware/qcom/NOTICE.txt"
@@ -2414,12 +2448,16 @@ FILES:${PN}-qcom-adreno-g705 = "${nonarch_base_libdir}/firmware/qcom/gen70500_*.
 FILES:${PN}-qcom-adreno-g709 = "${nonarch_base_libdir}/firmware/qcom/gen70900_*.* ${nonarch_base_libdir}/firmware/qcom/gmu_gen70900.*"
 FILES:${PN}-qcom-adreno-g715 = "${nonarch_base_libdir}/firmware/qcom/gen71500_*.*"
 FILES:${PN}-qcom-adreno-g800 = "${nonarch_base_libdir}/firmware/qcom/gen80000_*.*"
+FILES:${PN}-qcom-adreno-g801 = "${nonarch_base_libdir}/firmware/qcom/gen80100_*.*"
 FILES:${PN}-qcom-adreno-g802 = "${nonarch_base_libdir}/firmware/qcom/gen80200_*.*"
 FILES:${PN}-qcom-apq8016-modem = "${nonarch_base_libdir}/firmware/qcom/apq8016/mba.mbn* ${nonarch_base_libdir}/firmware/qcom/apq8016/modem.mbn*"
 FILES:${PN}-qcom-apq8016-wifi = "${nonarch_base_libdir}/firmware/qcom/apq8016/wcnss.mbn* ${nonarch_base_libdir}/firmware/qcom/apq8016/WCNSS*"
 FILES:${PN}-qcom-apq8096-adreno = "${nonarch_base_libdir}/firmware/qcom/apq8096/a530_zap.mbn* ${nonarch_base_libdir}/firmware/qcom/a530_zap.mdt*"
 FILES:${PN}-qcom-apq8096-audio = "${nonarch_base_libdir}/firmware/qcom/apq8096/adsp*.*"
 FILES:${PN}-qcom-apq8096-modem = "${nonarch_base_libdir}/firmware/qcom/apq8096/mba.mbn* ${nonarch_base_libdir}/firmware/qcom/apq8096/modem*.* ${nonarch_base_libdir}/firmware/qcom/apq8096/wlanmdsp.mbn*"
+FILES:${PN}-qcom-glymur-adreno = "${nonarch_base_libdir}/firmware/qcom/glymur/gen80100_zap.mbn*"
+FILES:${PN}-qcom-glymur-audio = "${nonarch_base_libdir}/firmware/qcom/glymur/adsp*.*"
+FILES:${PN}-qcom-glymur-compute = "${nonarch_base_libdir}/firmware/qcom/glymur/cdsp*.*"
 FILES:${PN}-qcom-kaanapali-adreno = "${nonarch_base_libdir}/firmware/qcom/kaanapali/gen80200_zap.mbn*"
 FILES:${PN}-qcom-kaanapali-audio = "${nonarch_base_libdir}/firmware/qcom/kaanapali/adsp*.*"
 FILES:${PN}-qcom-kaanapali-compute = "${nonarch_base_libdir}/firmware/qcom/kaanapali/cdsp*.*"
@@ -2429,19 +2467,32 @@ FILES:${PN}-qcom-qcm2290-audio = "${nonarch_base_libdir}/firmware/qcom/qcm2290/a
 FILES:${PN}-qcom-qcm2290-modem = "${nonarch_base_libdir}/firmware/qcom/qcm2290/modem*.*"
 FILES:${PN}-qcom-qcm2290-wifi = "${nonarch_base_libdir}/firmware/qcom/qcm2290/wlanmdsp.mbn* ${nonarch_base_libdir}/firmware/ath10k/WCN3990/hw1.0/qcm2290/*"
 FILES:${PN}-qcom-qcm6490-adreno = "${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/a660_zap.mbn*"
-FILES:${PN}-qcom-qcm6490-audio = "${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/adsp*.* ${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/battmgr.jsn ${nonarch_base_libdir}/firmware/qcom/qcs6490/QCS6490-RB3Gen2-tplg.bin*"
+FILES:${PN}-qcom-qcm6490-audio = " \
+    ${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/adsp*.* \
+    ${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/battmgr.jsn \
+    ${nonarch_base_libdir}/firmware/qcom/qcm6490/QCM6490-IDP-tplg.bin* \
+    ${nonarch_base_libdir}/firmware/qcom/qcs6490/QCS6490-RB3Gen2-tplg.bin* \
+"
 FILES:${PN}-qcom-qcm6490-compute = "${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/cdsp*.*"
 FILES:${PN}-qcom-qcm6490-ipa = "${nonarch_base_libdir}/firmware/qcom/qcm6490/ipa_fws.mbn*"
 FILES:${PN}-qcom-qcm6490-wifi = "${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/wpss.mbn*"
 FILES:${PN}-qcom-qcm6490-qupv3fw = "${nonarch_base_libdir}/firmware/qcom/qc[ms]6490/qupv3fw.elf*"
 FILES:${PN}-qcom-qcs615-adreno = "${nonarch_base_libdir}/firmware/qcom/qcs615/a612_zap.mbn*"
-FILES:${PN}-qcom-qcs615-audio = "${nonarch_base_libdir}/firmware/qcom/qcs615/adsp*.*"
+FILES:${PN}-qcom-qcs615-audio = "${nonarch_base_libdir}/firmware/qcom/qcs615/adsp*.* ${nonarch_base_libdir}/firmware/qcom/qcs615/TALOS-EVK-tplg.bin*"
 FILES:${PN}-qcom-qcs615-compute = "${nonarch_base_libdir}/firmware/qcom/qcs615/cdsp*.*"
 FILES:${PN}-qcom-qcs6490-radxa-dragon-q6a-audio = " \
     ${nonarch_base_libdir}/firmware/qcom/qcs6490/radxa/dragon-q6a/adsp*.* \
+    ${nonarch_base_libdir}/firmware/qcom/qcs6490/radxa/dragon-q6a/QCS6490-Radxa-Dragon-Q6A-tplg.bin*\
     ${nonarch_base_libdir}/firmware/qcom/qcs6490/QCS6490-Radxa-Dragon-Q6A-tplg.bin*\
-    "
-FILES:${PN}-qcom-qcs6490-thundercomm-rubikpi3-audio = "${nonarch_base_libdir}/firmware/qcom/qcs6490/Thundercomm/RubikPi3/adsp*.*"
+"
+FILES:${PN}-qcom-qcs6490-radxa-dragon-q6a-compute = " \
+    ${nonarch_base_libdir}/firmware/qcom/qcs6490/radxa/dragon-q6a/cdsp*.* \
+"
+FILES:${PN}-qcom-qcs6490-thundercomm-rubikpi3-audio = " \
+    ${nonarch_base_libdir}/firmware/qcom/qcs6490/Thundercomm/RubikPi3/adsp*.* \
+    ${nonarch_base_libdir}/firmware/qcom/qcs6490/Thundercomm/RubikPi3/QCS6490-Thundercomm-RubikPi3-tplg.bin* \
+    ${nonarch_base_libdir}/firmware/qcom/qcs6490/QCS6490-Thundercomm-RubikPi3-tplg.bin* \
+"
 FILES:${PN}-qcom-qcs8300-adreno = "${nonarch_base_libdir}/firmware/qcom/qcs8300/a623_zap.mbn*"
 FILES:${PN}-qcom-qcs8300-audio = "${nonarch_base_libdir}/firmware/qcom/qcs8300/adsp*.* ${nonarch_base_libdir}/firmware/qcom/qcs8300/MONACO-EVK-tplg.bin*"
 FILES:${PN}-qcom-qcs8300-compute = "${nonarch_base_libdir}/firmware/qcom/qcs8300/cdsp*.*"
@@ -2482,20 +2533,53 @@ FILES:${PN}-qcom-sm8250-compute = "${nonarch_base_libdir}/firmware/qcom/sm8250/c
 FILES:${PN}-qcom-sm8250-thundercomm-rb5-sensors = "${nonarch_base_libdir}/firmware/qcom/sm8250/Thundercomm/RB5/slpi*.*"
 FILES:${PN}-qcom-sm8350-adreno = "${nonarch_base_libdir}/firmware/qcom/sm8350/a660_zap.mbn*"
 FILES:${PN}-qcom-sm8450-adreno = "${nonarch_base_libdir}/firmware/qcom/sm8450/a730_zap.mbn*"
+FILES:${PN}-qcom-sm8450-audio-tplg = "${nonarch_base_libdir}/firmware/qcom/sm8450/*tplg.bin*"
 FILES:${PN}-qcom-sm8550-adreno = "${nonarch_base_libdir}/firmware/qcom/sm8550/a740_zap.mbn*"
 FILES:${PN}-qcom-sm8550-audio-tplg = "${nonarch_base_libdir}/firmware/qcom/sm8550/*tplg.bin*"
 FILES:${PN}-qcom-sm8650-adreno = "${nonarch_base_libdir}/firmware/qcom/sm8650/gen70900_zap.mbn*"
 FILES:${PN}-qcom-sm8650-audio-tplg = "${nonarch_base_libdir}/firmware/qcom/sm8650/*tplg.bin*"
 FILES:${PN}-qcom-sm8750-adreno = "${nonarch_base_libdir}/firmware/qcom/sm8750/gen80000_zap.mbn*"
-FILES:${PN}-qcom-sm8750-audio = "${nonarch_base_libdir}/firmware/qcom/sm8750/adsp*.*"
+FILES:${PN}-qcom-sm8750-audio = "${nonarch_base_libdir}/firmware/qcom/sm8750/adsp*.* ${nonarch_base_libdir}/firmware/qcom/sm8750/*tplg.bin*"
 FILES:${PN}-qcom-sm8750-compute = "${nonarch_base_libdir}/firmware/qcom/sm8750/cdsp*.*"
 FILES:${PN}-qcom-x1e80100-adreno = "${nonarch_base_libdir}/firmware/qcom/x1e80100/gen70500_zap.mbn*"
 FILES:${PN}-qcom-x1e80100-audio = " \
     ${nonarch_base_libdir}/firmware/qcom/x1e80100/adsp*.* \
     ${nonarch_base_libdir}/firmware/qcom/x1e80100/battmgr.jsn \
+    ${nonarch_base_libdir}/firmware/qcom/x1e80100/X1E001DE-DEVKIT-tplg.bin* \
+    ${nonarch_base_libdir}/firmware/qcom/x1e80100/X1E80100-CRD-tplg.bin* \
     ${nonarch_base_libdir}/firmware/qcom/x1e80100/X1E80100-EVK-tplg.bin* \
-    "
+    ${nonarch_base_libdir}/firmware/qcom/x1e80100/X1E80100-Romulus-tplg.bin* \
+    ${nonarch_base_libdir}/firmware/qcom/x1e80100/X1E80100-TUXEDO-Elite-14-tplg.bin* \
+"
 FILES:${PN}-qcom-x1e80100-compute = "${nonarch_base_libdir}/firmware/qcom/x1e80100/cdsp*.*"
+FILES:${PN}-qcom-x1e80100-asus-vivobook-16-audio-tplg = " \
+    ${nonarch_base_libdir}/firmware/qcom/x1e80100/ASUSTeK/vivobook-16/X1E80100-ASUS-Vivobook-16-tplg.bin* \
+    ${nonarch_base_libdir}/firmware/qcom/x1e80100/X1E80100-ASUS-Vivobook-16-tplg.bin* \
+"
+FILES:${PN}-qcom-x1e80100-asus-vivobook-s15-audio-tplg = " \
+    ${nonarch_base_libdir}/firmware/qcom/x1e80100/ASUSTeK/vivobook-s15/X1E80100-ASUS-Vivobook-S15-tplg.bin* \
+    ${nonarch_base_libdir}/firmware/qcom/x1e80100/X1E80100-ASUS-Vivobook-S15-tplg.bin* \
+"
+FILES:${PN}-qcom-x1e80100-asus-zenbook-a14-audio-tplg = " \
+    ${nonarch_base_libdir}/firmware/qcom/x1e80100/ASUSTeK/zenbook-a14/X1E80100-ASUS-Zenbook-A14-tplg.bin* \
+    ${nonarch_base_libdir}/firmware/qcom/x1e80100/X1E80100-ASUS-Zenbook-A14-tplg.bin* \
+"
+FILES:${PN}-qcom-x1e80100-dell-inspiron-14-plus-7441-audio-tplg = " \
+    ${nonarch_base_libdir}/firmware/qcom/x1e80100/dell/inspiron-14-plus-7441/X1E80100-Dell-Inspiron-14p-7441-tplg.bin* \
+    ${nonarch_base_libdir}/firmware/qcom/x1e80100/X1E80100-Dell-Inspiron-14p-7441-tplg.bin* \
+"
+FILES:${PN}-qcom-x1e80100-dell-latitude-7455-audio-tplg = " \
+    ${nonarch_base_libdir}/firmware/qcom/x1e80100/dell/latitude-7455/X1E80100-Dell-Latitude-7455-tplg.bin* \
+    ${nonarch_base_libdir}/firmware/qcom/x1e80100/X1E80100-Dell-Latitude-7455-tplg.bin* \
+"
+FILES:${PN}-qcom-x1e80100-dell-xps13-9345-audio-tplg = " \
+    ${nonarch_base_libdir}/firmware/qcom/x1e80100/dell/xps13-9345/X1E80100-Dell-XPS-13-9345-tplg.bin* \
+    ${nonarch_base_libdir}/firmware/qcom/x1e80100/X1E80100-Dell-XPS-13-9345-tplg.bin* \
+"
+FILES:${PN}-qcom-x1e80100-hp-omnibook-x14-audio-tplg = " \
+    ${nonarch_base_libdir}/firmware/qcom/x1e80100/hp/omnibook-x14/X1E80100-HP-OMNIBOOK-X14-tplg.bin* \
+    ${nonarch_base_libdir}/firmware/qcom/x1e80100/X1E80100-HP-OMNIBOOK-X14-tplg.bin* \
+"
 FILES:${PN}-qcom-x1e80100-lenovo-t14s-g6-adreno = "${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/21N1/qcdxkmsuc8380.mbn*"
 FILES:${PN}-qcom-x1e80100-lenovo-t14s-g6-audio = "${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/21N1/*adsp*.* ${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/21N1/battmgr.jsn* ${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/21N1/X1E80100-LENOVO-Thinkpad-T14s-tplg.bin* ${nonarch_base_libdir}/firmware/qcom/x1e80100/X1E80100-LENOVO-Thinkpad-T14s-tplg.bin*"
 FILES:${PN}-qcom-x1e80100-lenovo-t14s-g6-compute = "${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/21N1/*cdsp*.*"
@@ -2504,6 +2588,7 @@ FILES:${PN}-qcom-x1e80100-lenovo-yoga-slim7x-adreno = "${nonarch_base_libdir}/fi
 FILES:${PN}-qcom-x1e80100-lenovo-yoga-slim7x-audio = "${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/83ED/*adsp*.* ${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/83ED/battmgr.jsn* ${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/83ED/X1E80100-LENOVO-Yoga-Slim7x-tplg.bin* ${nonarch_base_libdir}/firmware/qcom/x1e80100/X1E80100-LENOVO-Yoga-Slim7x-tplg.bin*"
 FILES:${PN}-qcom-x1e80100-lenovo-yoga-slim7x-compute = "${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/83ED/*cdsp*.*"
 FILES:${PN}-qcom-x1e80100-lenovo-yoga-slim7x-vpu = "${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/83ED/qcvss8380.mbn* ${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/83ED/qcav1e8380.mbn*"
+FILES:${PN}-qcom-x1e80100-qupv3fw = "${nonarch_base_libdir}/firmware/qcom/x1e80100/qupv3fw.elf*"
 FILES:${PN}-qcom-x1p42100-adreno = "${nonarch_base_libdir}/firmware/qcom/x1p42100/gen71500_zap.mbn*"
 
 RDEPENDS:${PN}-qcom-aic100 = "${PN}-qcom-license"
@@ -2533,12 +2618,16 @@ RDEPENDS:${PN}-qcom-adreno-g705 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-g709 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-g715 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-g800 = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-adreno-g801 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-g802 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8016-modem = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8016-wifi = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8096-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8096-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8096-modem = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-glymur-adreno = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-glymur-audio = "${PN}-qcom-2-license"
+RDEPENDS:${PN}-qcom-glymur-compute = "${PN}-qcom-2-license"
 RDEPENDS:${PN}-qcom-kaanapali-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-kaanapali-audio = "${PN}-qcom-2-license"
 RDEPENDS:${PN}-qcom-kaanapali-compute = "${PN}-qcom-2-license"
@@ -2558,10 +2647,11 @@ RDEPENDS:${PN}-qcom-qcm6490-wifi = "${PN}-qcom-license"
 RPROVIDES:${PN}-qcom-qcm6490-wifi = "${PN}-qcom-qcs6490-wifi"
 RDEPENDS:${PN}-qcom-qcm6490-qupv3fw = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcs615-adreno = "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-qcs615-audio = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-qcs615-audio = "${PN}-qcom-license ${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-qcs615-compute = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcs6490-radxa-dragon-q6a-audio = "${PN}-qcom-license ${PN}-linaro-license"
-RDEPENDS:${PN}-qcom-qcs6490-thundercomm-rubikpi3-audio = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-qcs6490-radxa-dragon-q6a-compute = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-qcs6490-thundercomm-rubikpi3-audio = "${PN}-qcom-license ${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-qcs8300-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcs8300-audio = "${PN}-qcom-2-license ${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-qcs8300-compute = "${PN}-qcom-2-license"
@@ -2598,16 +2688,24 @@ RDEPENDS:${PN}-qcom-sm8250-compute = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8250-thundercomm-rb5-sensors = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8350-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8450-adreno = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-sm8450-audio-tplg = "${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-sm8550-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8550-audio-tplg = "${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-sm8650-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8650-audio-tplg = "${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-sm8750-adreno = "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-sm8750-audio = "${PN}-qcom-2-license"
+RDEPENDS:${PN}-qcom-sm8750-audio = "${PN}-qcom-2-license ${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-sm8750-compute = "${PN}-qcom-2-license"
 RDEPENDS:${PN}-qcom-x1e80100-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-x1e80100-audio = "${PN}-qcom-2-license ${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-x1e80100-compute = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-x1e80100-asus-vivobook-16-audio-tplg = "${PN}-linaro-license"
+RDEPENDS:${PN}-qcom-x1e80100-asus-vivobook-s15-audio-tplg = "${PN}-linaro-license"
+RDEPENDS:${PN}-qcom-x1e80100-asus-zenbook-a14-audio-tplg = "${PN}-linaro-license"
+RDEPENDS:${PN}-qcom-x1e80100-dell-inspiron-14-plus-7441-audio-tplg = "${PN}-linaro-license"
+RDEPENDS:${PN}-qcom-x1e80100-dell-latitude-7455-audio-tplg = "${PN}-linaro-license"
+RDEPENDS:${PN}-qcom-x1e80100-dell-xps13-9345-audio-tplg = "${PN}-linaro-license"
+RDEPENDS:${PN}-qcom-x1e80100-hp-omnibook-x14-audio-tplg = "${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-x1e80100-lenovo-t14s-g6-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-x1e80100-lenovo-t14s-g6-audio = "${PN}-qcom-license ${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-x1e80100-lenovo-t14s-g6-compute = "${PN}-qcom-license"
@@ -2615,6 +2713,7 @@ RDEPENDS:${PN}-qcom-x1e80100-lenovo-yoga-slim7x-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-x1e80100-lenovo-yoga-slim7x-audio = "${PN}-qcom-license ${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-x1e80100-lenovo-yoga-slim7x-compute = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-x1e80100-lenovo-yoga-slim7x-vpu = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-x1e80100-qupv3fw = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-x1p42100-adreno = "${PN}-qcom-license"
 
 RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
@@ -2671,6 +2770,13 @@ FILES:${PN}-ish-lnlm-39ceeaf8 =  "\
 "
 RDEPENDS:${PN}-ish-lnlm-39ceeaf8 = "${PN}-dell-license"
 
+LICENSE:${PN}-ish-ptl-39ceeaf8 = "Firmware-dell"
+FILES:${PN}-ish-ptl-39ceeaf8 =  "\
+    ${nonarch_base_libdir}/firmware/intel/ish/ish_ptl_39ceeaf8.bin* \
+    ${nonarch_base_libdir}/firmware/dell/ish/ish_ptl_39ceeaf8_*.bin* \
+"
+RDEPENDS:${PN}-ish-ptl-39ceeaf8 = "${PN}-dell-license"
+
 # For HP ish - Intel Integrated Sensor Hub
 LICENSE:${PN}-hp-license = "Firmware-HP"
 FILES:${PN}-hp-license = "${nonarch_base_libdir}/firmware/LICENSE.HP"
@@ -2686,12 +2792,12 @@ RDEPENDS:${PN}-ish-lnlm-12128606 = "${PN}-hp-license"
 LICENSE:${PN}-lenovo-license = "Firmware-lenovo"
 FILES:${PN}-lenovo-license = "${nonarch_base_libdir}/firmware/LICENCE.lenovo"
 
-LICENSE:${PN}-ish-lnlm-53c4ffad-2a17559f = "Firmware-lenovo"
-FILES:${PN}-ish-lnlm-53c4ffad-2a17559f = "\
-    ${nonarch_base_libdir}/firmware/LENOVO/ish/ish_lnlm_53c4ffad_2a17559f.bin* \
-    ${nonarch_base_libdir}/firmware/intel/ish/ish_lnlm_53c4ffad_2a17559f.bin* \
+LICENSE:${PN}-ish-lnlm-53c4ffad = "Firmware-lenovo"
+FILES:${PN}-ish-lnlm-53c4ffad = "\
+    ${nonarch_base_libdir}/firmware/LENOVO/ish/ish_lnlm_53c4ffad_*.bin* \
+    ${nonarch_base_libdir}/firmware/intel/ish/ish_lnlm_53c4ffad_*.bin* \
 "
-RDEPENDS:${PN}-ish-lnlm-53c4ffad-2a17559f = "${PN}-lenovo-license"
+RDEPENDS:${PN}-ish-lnlm-53c4ffad = "${PN}-lenovo-license"
 
 LICENSE:${PN}-ish-ptl = "Firmware-intel"
 FILES:${PN}-ish-ptl = "${nonarch_base_libdir}/firmware/intel/ish/ish_ptl.bin*"
@@ -2735,7 +2841,11 @@ RDEPENDS:${PN}-en8811h = "${PN}-airoha-license"
 
 # For airoha-npu - Airoha Network Processor Unit driver
 LICENSE:${PN}-airoha-npu = "Firmware-airoha"
-FILES:${PN}-airoha-npu = "${nonarch_base_libdir}/firmware/airoha/en7581_npu*"
+FILES:${PN}-airoha-npu = " \
+    ${nonarch_base_libdir}/firmware/airoha/an7583_npu* \
+    ${nonarch_base_libdir}/firmware/airoha/en7581_npu* \
+    ${nonarch_base_libdir}/firmware/airoha/en7581_MT7996_npu* \
+"
 RDEPENDS:${PN}-airoha-npu = "${PN}-airoha-license"
 
 # For ccp - Platform Security Processor (PSP) device
-- 
2.47.3


