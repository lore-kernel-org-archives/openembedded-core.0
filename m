Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E053BC636BB
	for <webhook@archiver.kernel.org>; Sun, 22 Feb 2026 21:22:10 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22199.1771795323565629883
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Feb 2026 13:22:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=hEAka7pd;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=fA4uGjMA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MEv2Xl1857015
	for <openembedded-core@lists.openembedded.org>; Sun, 22 Feb 2026 21:22:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=C3lUumilpxdzlqMJ10SQmjbVC96/7Y7eidD
	efZ9QBQc=; b=hEAka7pdK4i5lJ1euw4w3TLXcCjbUfHkr0D6w9FM9ugcICpnNd0
	9i27NVY+v/eGBPFgX2xMsUFDaXujUW6XEH38QP8MotIGT3+YHxhOTS7aeaf06acK
	1ufsC8zt9hAAXyyN9jmQyK8mKnSV8wAkPh7IZL9sutrXRsuhvSl1eI6/e8GdGlb6
	Gi/vz6LsoVZiK4SpFmphlY0iLXhtTYQh61Upg6p3hPLyZK/Hf4AK9AZJgLLFHbtG
	cOW/rdeHgnn/YxbWp/T78vZu8mEe2Lk/HKSaBZzQuLtK3MuJ+jjnQe3XgFMs8aYL
	6f4nt4ldzK/MM5yE3fNH8qioO/L1+2X9rlA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vgtsen-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 22 Feb 2026 21:22:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb3fae6f60so4906110985a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Feb 2026 13:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771795322; x=1772400122; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C3lUumilpxdzlqMJ10SQmjbVC96/7Y7eidDefZ9QBQc=;
        b=fA4uGjMAwIqq7bsjYambEC1CKjjv2baZNbokA1K60fHHbfffkcNKIlvpK2gBS9qiRy
         xOGWow12MyZShdnjcRO1TqDhb6q3QjZq3SFnvqYxBiK1SnvLyuoWLVGYW1StuziUwdKC
         bZzFmsJQJ3vqmHFmM9BrGSeVIDpwwOZNe/+lYQ98ZWfamcXSYHshRG2vcfmdIK/xI/Rl
         m2EFwW+WRxMRVMGd9wz5x5VDuUASvbmhILntlZzqaY3aFfFAdpD5Rbq3yWYGACD9CEpC
         57hzcQamgEVrM0/iQiYNHWACJ3Ld/2x0zvPdxkSwgsHoaFnXis3clUO/8/ZxvhZM8AuZ
         RHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771795322; x=1772400122;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C3lUumilpxdzlqMJ10SQmjbVC96/7Y7eidDefZ9QBQc=;
        b=c1wTb+ft56fFHFyjI9YekFeEt6DNKE1VEpo3HxnE8R2+SIogwtbtvRGfXv39PszMT9
         KSCzivxRehKu1+WsNhKar5CGHuAc9p8xzQkxIyBWvIQsZiwYGfBuc/ZGQ6JG7Fm3DJsT
         StsGGa1vRCIjEj5b8Eb9yx7terFHaJlUmRfC0alI1jcDxHQzA7oQ53pSMQKqRCeE4Ixo
         TJJfxZfZxOxDTtNgKOYclW2/Q/g7HMEgVjtifJaqk3CNznm23nJ1d9vVIDTmLiyPUJgO
         D4k9yHUWiH7+yqT3DATWk8XyvH0CYNLkZ07LJHPTfJx94I3AUSrJdZisCz8lMEnu5cHe
         s8bw==
X-Gm-Message-State: AOJu0Ywd91r3cGAp4exmkogCA20CQdBV+zuWH2ZLA9sATTJ+qKHdLuZb
	OL7mArmPv8XB2zqRMCKyIXVHn78yefydn2FWWdMtxK5sMp5ys/iT1B1D/WSZMIRYezSLfxds5d+
	cXp7LWMBXy435SLtrE2o/t0AKhPY9lnSx3agYmwk7031JhVw94nYKkg7kQbeyJXCtqefCtTt4Oz
	To+7MHlheIP358dt8=
X-Gm-Gg: AZuq6aJlHv/rNnDMtMPGKV0uy3Vp/3PdG57vF0vqhdoHXLwzMP1BgPhcQMSpwAkuYK9
	1cLjPZU7cEdj1WkIXYHTa6OD/gDexfZoRWkcQ8vm+MQjcXOZn/s83j7WNfArwTjIm2v5uexS6H+
	zVL5rkWbSxjeGty4GWvL1QFoGKvdjwmQh7EYIVDaU6McLzSNvIafMyrMO3lm1QtJs1b88mTPw5n
	PCN+q9vDPTLt/tje6THCVqWfRcAeypMUrTJwM65ZBsejakk/AiaI2X7qA1fqUnFquKbf9WS/NGy
	B4o8kvuycAEWzFxREWbi5bRR/dI7+PVAcDMs6uNs5w3sR0sN6v8qXlGlMkLs7BSC6IAYT2HIN0I
	dGYDzl9hpL7UBmW7spEZOX1vcPXOE6y80dPWs2MVtzfzg156ZnKYBmpcrSn/oj6mS1/jt/o0Fdw
	Fe3lqM+KhOeRRfB4mLpYceeR16gGra4AGrQkc=
X-Received: by 2002:a05:620a:44ca:b0:8a6:92d1:2dae with SMTP id af79cd13be357-8cb8c57ce71mr737612685a.5.1771795321131;
        Sun, 22 Feb 2026 13:22:01 -0800 (PST)
X-Received: by 2002:a05:620a:44ca:b0:8a6:92d1:2dae with SMTP id af79cd13be357-8cb8c57ce71mr737610185a.5.1771795320353;
        Sun, 22 Feb 2026 13:22:00 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb13a5dsm1172224e87.24.2026.02.22.13.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 13:21:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Sairamreddy Bojja <sbojja@qti.qualcomm.com>,
        Vivek Puar <vpuar@qti.qualcomm.com>
Subject: [PATCH] linux-firmware: upgrade 20260110 -> 20260221
Date: Sun, 22 Feb 2026 23:21:56 +0200
Message-ID: <20260222212156.55731-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIyMDIwNSBTYWx0ZWRfX7ylPoKwhoBik
 sP09AKZgp1x8yhr4O5x9q0U0MGYkk4jL7+9u9NalearkAEmMxrsol3STLixfgS6m0S+E0M+CVbi
 HDxa4f9yG6rxIihk5uOF1oNh1Cm/Qca1QL+e39DqZkloGhZvGvroAAJmOame33ZqpfpkBHrvC9Z
 LZA/m1Y8OBdy2Yt+E/xZtu0k4orSG/E+Nf7h/leQ2PzfjKblDFUPx/jpPKcLzVj2XoSG77roT6P
 lQoFaOxcS5vZN73D7niHbY4NAEXsDd2UPn4NZTrPttktylDimUh1juWBKjk415Ei8YZU82hj0px
 ETeadKBd16nljQlLItPHRKmelK6d/F5GbYX5k8Z1NNQRvI5suVmVkhV52v5HtzjFE0RF7P2sfNa
 Hpwa6rKzSpKXmubWNM9npTzpwDvutq7NEB8GyeTzaeqB2jFMFzmT5u8m2NWaDuiTUUOWV0BH7Mw
 9iTWme3CyuctcwwQJ2Q==
X-Authority-Analysis: v=2.4 cv=W+A1lBWk c=1 sm=1 tr=0 ts=699b737b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=KxUeQjSHhAUF4MBDIF4A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: EEu3tWsMQAABl1Iyo0HnoCBTCfy0OKfE
X-Proofpoint-ORIG-GUID: EEu3tWsMQAABl1Iyo0HnoCBTCfy0OKfE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-22_05,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602220205
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Feb 2026 21:22:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231638

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
 ...20260110.bb => linux-firmware_20260221.bb} | 163 +++++++++++++++---
 1 file changed, 136 insertions(+), 27 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20260110.bb => linux-firmware_20260221.bb} (95%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20260110.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20260221.bb
similarity index 95%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20260110.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20260221.bb
index fcf15c11f553..db017bd79922 100644
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
+FILES:${PN}-qcom-sm8750-audio = "${nonarch_base_libdir}/firmware/qcom/sm8750/adsp*.* ${nonarch_base_libdir}/firmware/qcom/sm8750/*tplg.bin.*"
 FILES:${PN}-qcom-sm8750-compute = "${nonarch_base_libdir}/firmware/qcom/sm8750/cdsp*.*"
 FILES:${PN}-qcom-x1e80100-adreno = "${nonarch_base_libdir}/firmware/qcom/x1e80100/gen70500_zap.mbn*"
 FILES:${PN}-qcom-x1e80100-audio = " \
     ${nonarch_base_libdir}/firmware/qcom/x1e80100/adsp*.* \
     ${nonarch_base_libdir}/firmware/qcom/x1e80100/battmgr.jsn \
+    ${nonarch_base_libdir}/firmware/qcom/x1e80100/X1E001DE-DEVKIT-tplg.bin* \
+    ${nonarch_base_libdir}/firmware/qcom/x1e80100/X1E80100-CRD-tplg.bin.zst* \
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
@@ -2558,10 +2647,10 @@ RDEPENDS:${PN}-qcom-qcm6490-wifi = "${PN}-qcom-license"
 RPROVIDES:${PN}-qcom-qcm6490-wifi = "${PN}-qcom-qcs6490-wifi"
 RDEPENDS:${PN}-qcom-qcm6490-qupv3fw = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcs615-adreno = "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-qcs615-audio = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-qcs615-audio = "${PN}-qcom-license ${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-qcs615-compute = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcs6490-radxa-dragon-q6a-audio = "${PN}-qcom-license ${PN}-linaro-license"
-RDEPENDS:${PN}-qcom-qcs6490-thundercomm-rubikpi3-audio = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-qcs6490-thundercomm-rubikpi3-audio = "${PN}-qcom-license ${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-qcs8300-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcs8300-audio = "${PN}-qcom-2-license ${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-qcs8300-compute = "${PN}-qcom-2-license"
@@ -2598,16 +2687,24 @@ RDEPENDS:${PN}-qcom-sm8250-compute = "${PN}-qcom-license"
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
@@ -2615,6 +2712,7 @@ RDEPENDS:${PN}-qcom-x1e80100-lenovo-yoga-slim7x-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-x1e80100-lenovo-yoga-slim7x-audio = "${PN}-qcom-license ${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-x1e80100-lenovo-yoga-slim7x-compute = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-x1e80100-lenovo-yoga-slim7x-vpu = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-x1e80100-qupv3fw = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-x1p42100-adreno = "${PN}-qcom-license"
 
 RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-audio = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
@@ -2671,6 +2769,13 @@ FILES:${PN}-ish-lnlm-39ceeaf8 =  "\
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
@@ -2686,12 +2791,12 @@ RDEPENDS:${PN}-ish-lnlm-12128606 = "${PN}-hp-license"
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
@@ -2735,7 +2840,11 @@ RDEPENDS:${PN}-en8811h = "${PN}-airoha-license"
 
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


