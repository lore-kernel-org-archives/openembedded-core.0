Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 064A8D232E4
	for <webhook@archiver.kernel.org>; Sat, 10 Jan 2026 18:48:26 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14042.1768070901638471207
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Jan 2026 10:48:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=VFe+RxAo;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=I12kkABa;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60A82IEO3264669
	for <openembedded-core@lists.openembedded.org>; Sat, 10 Jan 2026 18:48:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=yVHk/eFMuIHxpzT1Jz/hlN5NuuGAFd7XUSn
	P3bRnnq4=; b=VFe+RxAoX2TVHdRBku5Nt7oH12rZQ2VhQJmmGzqYS7apGx517Lv
	GkpTO9Vj28jDE27K0T/PJZRO8tUIxECt8SgPSKun+/Vma8qyoIT9y1TRE0OX4VCj
	IzTZpmyUyLY/5RW7Xc+sapwf8aYkGbnsWGiWSy5A1/VgAMGjbpjs3r8Ot5fusJ5X
	7RcVW1qi+oVSXPdl5ZCaO5WtwYzsj4eZk34eHBIaCYUJ0GyedVx86i/+a1Ov43RA
	rrBn7J7eewY83fF1QoriCQ2DpV+3Jlkpto+P0V4CClZvD+3/Xl0FvXqqdPueATl+
	bIBPfkaHxrsKEUf//BNrZFeQjKIWefcFSxg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkjvxrs1e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 10 Jan 2026 18:48:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b9fa6f808cso1491481785a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 10 Jan 2026 10:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768070900; x=1768675700; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=yVHk/eFMuIHxpzT1Jz/hlN5NuuGAFd7XUSnP3bRnnq4=;
        b=I12kkABaT328FQFou+ZMixw46oMsJHc9wJ3ZAWD7r7ejt7M92br9CsoHbSv0IY23M+
         27wv55ppFDJqdlswlbMZJw/xQWmG5Kqa8LhjuIoeiIA5bdz1MeFWrTbU+YlrcidnOFlA
         TYPJg95l+Jz+2k6PEvRARLylTYFosGQ8wklbIwVkZAEZEGmETwyxEaZ2O7GcCxowFvbl
         ahhH8UHcxEHPDnXElY35fMBEUaoq7pfgckt5xPAvu4KolS5DkhIkhipZayF8cwNt0N5w
         DTu+sQeH5JyTA6S0tNGz0qIxYSdz07DuVz7lKy9o4+BySN6Q1fnWu4oUvw7lRp4+b8y6
         KK/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768070900; x=1768675700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yVHk/eFMuIHxpzT1Jz/hlN5NuuGAFd7XUSnP3bRnnq4=;
        b=XXhABKH3LY3jom6YbrxxGLSAiW2WQX7Wwa7Oyr5Z1lTG1BZ9Q++TsUy8vnu+qRfh4b
         S1tpHIsjlrJDfyfM1h4SRtytwbL+ElGA7dgJvZeej/GNphgtAbS/AIbqfMTwcrELT/Uz
         enFuG9+CMektMH0LHV4Wf4RAQdhdX6kNNYp9agqMGteK78fgsXkzBlXVB/ltsWHkEMYO
         TJyc7NIuCp1HtgwX7QESLKjIsxRVdb2wQXnpDjBUhAMY9YiqdnaCyIFdWIvl42LAl+ol
         bgwrYcnth30wiqUPal2pVupIaKEcR+3S/d1m/w1Rs9GQmjttFMm681spzJVztDMOp2D8
         syNw==
X-Gm-Message-State: AOJu0YzeBlc51/illoeJwVgh9n8IKgbLjvLlzw6Mji0TmnvxgnurcMQm
	pQ2ddhaHtS4zw9WKY4UlzVKK89e2jUNSFX+mSP+7OOsdoNrmuVSf+LmGaXJ53ZhGrcgrECM7rim
	5ZN/Ll1dk5QpaxzEq2U89loKr8UK16cEQmGs2Q8o/yDUCfiByIoiapKiKAyDQmqOcbEzwxJ+sNa
	AkYwgRmpQvTFSoIKSqhpjk
X-Gm-Gg: AY/fxX7YoRQ5SgsLmQHzlIuKlLUq94ijFSzOHCakzZUPvZElKKHUG4eX5MSnUHDEgud
	HhKNBehE3YCdw1l9fMGyn8Fgxu9luNBy2GHNHLkg4VErFZaZEz7GBTr0fR7nr22LkxkIjIWOx/3
	U+gBQrFsQQasqrc6RbpQNCtMTBbH6Txet7gG80kuuDj79UJvMO/mPxg0eSlLr+631e0lMwu6LmP
	lIcx2Yf8aO49dRYaWalIQSJICZhYWh3gHSEgVLwyUmmaNHVJMMUkr2f3LZF3hSNxDlzBL91+hh5
	yp8AeTEfxxz6r1WBrJt/cq5YK5bp8NE9Gh+F9XV6XKThQ4YaqsNBTTudcRqKFQx5ctAqMT6ZeIY
	9Wkqx13iCbcoKdv8lvy/L4NMY4PnkvfPsUukkI0DTkqgCD8R989hRW0hFY79EVrEMUGeEwxD8OE
	cayXBL+KYspw0p3c6DdtZWPBY=
X-Received: by 2002:a05:620a:2587:b0:8b2:db27:425e with SMTP id af79cd13be357-8c3893dcab2mr1750364485a.50.1768070899513;
        Sat, 10 Jan 2026 10:48:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEYpD82ACSyenGTfQQ2wX6bfWaQKxsNPZ3djagtbYFb05TMPmI24dpQTiwG7NPLX2ye+mkbgw==
X-Received: by 2002:a05:620a:2587:b0:8b2:db27:425e with SMTP id af79cd13be357-8c3893dcab2mr1750361785a.50.1768070898726;
        Sat, 10 Jan 2026 10:48:18 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb3a053esm28879261fa.5.2026.01.10.10.48.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 10:48:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] linux-firmware: upgrade 20251125 -> 20260110
Date: Sat, 10 Jan 2026 20:48:14 +0200
Message-ID: <20260110184815.642069-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Wrsm8Nfv c=1 sm=1 tr=0 ts=69629ef5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=4ietmHOqQVxKwNsd6M0A:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: LhGLikc4PUCAm_B70vfEKLto0384NwK3
X-Proofpoint-ORIG-GUID: LhGLikc4PUCAm_B70vfEKLto0384NwK3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDE2NiBTYWx0ZWRfXykefFPep9+P1
 DKzz9SJ3xCLa+wkdFOhvIII9WyA7tWl/fOlqemwrt5vtnL87agwRx1gdKZKlA7B2IJTzpWO9kCY
 LGyWHbSddG8YVKyrtT4vaa16h7i6IO+STPxb1qvVpK9rhZWE53VnVM+9P6l7n61AXYvuBi+GGKV
 HG4iBolsWuF2x99EbPMqgxwH6Y7eZQIbUNrD8lLd8RSAEwjsUzp51f0QKjwCDoDhZuMnmGTdFBS
 Ml2QELEY6hrnWKNFrBt5VK8chxLQrsvKGKaXgQmE8saOCYCR7pmh++4Ej/xbjF7s6LRFmDeC9u+
 zOMvC9ZMRQJn1H7Uwd7q8i/2OwJYyVsL6X145+X3ALVCvzJzCLWZsTU4Ehrz3PH8FLCCAo7c2n3
 J8UPYizClBZqLLdLJaegZGBJL+Aa7pA/elBlN+PB7NfiXQfkxSeWVWVnE7SSCCW6/xBSXBFjvIJ
 LkOy2RBXpTMSZ8tRg4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601100166
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Jan 2026 18:48:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229165

Add Qualcomm GPU firmware, Qualcomm QCC2072 firmware, Renesas R-Car PCIe
PHY firmware and Airoha AN8811hb PHY firmware. License for Qualcomm
X1E80100 Audio DSP firmware has changed from LICENSE.qcom to
LICENSE.qcom-2.

License-Update: copyright years, new firmware
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...20251125.bb => linux-firmware_20260110.bb} | 80 ++++++++++++++++---
 1 file changed, 68 insertions(+), 12 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20251125.bb => linux-firmware_20260110.bb} (97%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20251125.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20260110.bb
similarity index 97%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20251125.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20260110.bb
index ff84a3c4645e..d0ba0b2d8fa9 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20251125.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20260110.bb
@@ -152,6 +152,7 @@ LICENSE = "\
     & Firmware-radeon \
     & Firmware-ralink_a_mediatek_company_firmware \
     & Firmware-ralink-firmware \
+    & Firmware-r8a779g_pcie_phy \
     & Firmware-rockchip \
     & Firmware-rp2 \
     & Firmware-rsi \
@@ -199,7 +200,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENSE.amdnpu;md5=ea42c0f38f2d42aad08bd50c822460dc \
                     file://LICENSE.amd_pmf;md5=a2589a05ea5b6bd2b7f4f623c7e7a649 \
                     file://LICENSE.amd-sev;md5=e750538791a8be0b7249c579edefb035 \
-                    file://LICENSE.amd-ucode;md5=6ca90c57f7b248de1e25c7f68ffc4698 \
+                    file://LICENSE.amd-ucode;md5=450f217aadc787514165e9568652d700 \
                     file://LICENSE.amlogic;md5=80e4e3f27def8bc4b232009c3a587c07 \
                     file://LICENSE.amlogic_vdec;md5=dc44f59bf64a81643e500ad3f39a468a \
                     file://LICENSE.amphion_vpu;md5=2bcdc00527b2d0542bd92b52aaec2b60 \
@@ -284,6 +285,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.ralink_a_mediatek_company_firmware;md5=728f1a85fd53fd67fa8d7afb080bc435 \
                     file://LICENCE.ralink-firmware.txt;md5=ab2c269277c45476fb449673911a2dfd \
                     file://LICENCE.rockchip;md5=5fd70190c5ed39734baceada8ecced26 \
+                    file://LICENCE.r8a779g_pcie_phy;md5=0b20e76a9a004b83c4a1c87e2153bbad \
                     file://LICENSE.rp2;md5=de5109226a643a1cdf706a633e993514 \
                     file://LICENSE.rsi;md5=a560f4b285f0733de1a3986ae847675d \
                     file://LICENSE.rt1320;md5=b44dab4314655e8f015009548dc4f962 \
@@ -312,7 +314,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "fc952a29d75c7b9a0c620bf1e7232d35"
+WHENCE_CHKSUM  = "dec69e98d9a03fca5a9793e8d24c0b8d"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -411,6 +413,7 @@ NO_GENERIC_LICENSE[Firmware-r8a779x_usb3] = "LICENCE.r8a779x_usb3"
 NO_GENERIC_LICENSE[Firmware-radeon] = "LICENSE.radeon"
 NO_GENERIC_LICENSE[Firmware-ralink_a_mediatek_company_firmware] = "LICENCE.ralink_a_mediatek_company_firmware"
 NO_GENERIC_LICENSE[Firmware-ralink-firmware] = "LICENCE.ralink-firmware.txt"
+NO_GENERIC_LICENSE[Firmware-r8a779g_pcie_phy] = "LICENCE.r8a779g_pcie_phy"
 NO_GENERIC_LICENSE[Firmware-rockchip] = "LICENCE.rockchip"
 NO_GENERIC_LICENSE[Firmware-rp2] = "LICENSE.rp2"
 NO_GENERIC_LICENSE[Firmware-rsi] = "LICENSE.rsi"
@@ -449,7 +452,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "eb807a01c52882ac97ef5b678d4a246b209e6165ac1287d62a5f93a09ee93cd2"
+SRC_URI[sha256sum] = "48e05166db539f4ee8d29ac9d236a94442c5b1b1a160a966f6fe6b42bd714331"
 
 inherit allarch
 
@@ -637,6 +640,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qca-qca61x4-usb \
              ${PN}-qca-qca6390 \
              ${PN}-qca-qca6698 \
+             ${PN}-qca-qcc2072 \
              ${PN}-qca-wcn3950 \
              ${PN}-qca-wcn3988 \
              ${PN}-qca-wcn399x \
@@ -704,10 +708,11 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-venus-1.8 ${PN}-qcom-venus-4.2 ${PN}-qcom-venus-5.2 ${PN}-qcom-venus-5.4 ${PN}-qcom-venus-6.0 \
              ${PN}-qcom-vpu \
              ${PN}-qcom-adreno-a2xx ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a4xx ${PN}-qcom-adreno-a530 \
-             ${PN}-qcom-adreno-a612 ${PN}-qcom-adreno-a623 ${PN}-qcom-adreno-a630 \
+             ${PN}-qcom-adreno-a612 ${PN}-qcom-adreno-a623 ${PN}-qcom-adreno-a630 ${PN}-qcom-adreno-a640 \
              ${PN}-qcom-adreno-a650 ${PN}-qcom-adreno-a660 ${PN}-qcom-adreno-a663 \
-             ${PN}-qcom-adreno-a702 ${PN}-qcom-adreno-g715 ${PN}-qcom-adreno-g705 \
-             ${PN}-qcom-adreno-g802 \
+             ${PN}-qcom-adreno-a702 ${PN}-qcom-adreno-a730 ${PN}-qcom-adreno-a740 \
+             ${PN}-qcom-adreno-g705 ${PN}-qcom-adreno-g709 ${PN}-qcom-adreno-g715 \
+             ${PN}-qcom-adreno-g800 ${PN}-qcom-adreno-g802 \
              ${PN}-qcom-apq8016-modem ${PN}-qcom-apq8016-wifi \
              ${PN}-qcom-apq8096-adreno ${PN}-qcom-apq8096-audio ${PN}-qcom-apq8096-modem \
              ${PN}-qcom-kaanapali-adreno ${PN}-qcom-kaanapali-audio ${PN}-qcom-kaanapali-compute ${PN}-qcom-kaanapali-soccp \
@@ -732,12 +737,14 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-sdm845-adreno ${PN}-qcom-sdm845-audio ${PN}-qcom-sdm845-compute \
              ${PN}-qcom-sdm845-thundercomm-db845c-sensors \
              ${PN}-qcom-sdx35-foxconn-firehose ${PN}-qcom-sdx61-foxconn-firehose \
+             ${PN}-qcom-sm8150-adreno \
              ${PN}-qcom-sm8250-adreno ${PN}-qcom-sm8250-audio ${PN}-qcom-sm8250-compute \
              ${PN}-qcom-sm8250-thundercomm-rb5-sensors \
              ${PN}-qcom-sm8350-adreno \
-             ${PN}-qcom-sm8550-audio-tplg \
-             ${PN}-qcom-sm8650-audio-tplg \
-             ${PN}-qcom-sm8750-audio ${PN}-qcom-sm8750-compute \
+             ${PN}-qcom-sm8450-adreno \
+             ${PN}-qcom-sm8550-adreno ${PN}-qcom-sm8550-audio-tplg \
+             ${PN}-qcom-sm8650-adreno ${PN}-qcom-sm8650-audio-tplg \
+             ${PN}-qcom-sm8750-adreno ${PN}-qcom-sm8750-audio ${PN}-qcom-sm8750-compute \
              ${PN}-qcom-x1e80100-adreno ${PN}-qcom-x1e80100-audio ${PN}-qcom-x1e80100-compute \
              ${PN}-qcom-x1e80100-lenovo-t14s-g6-adreno ${PN}-qcom-x1e80100-lenovo-t14s-g6-audio \
              ${PN}-qcom-x1e80100-lenovo-t14s-g6-compute ${PN}-qcom-x1e80100-lenovo-t14s-g6-vpu \
@@ -762,7 +769,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-advansys-license ${PN}-advansys \
              ${PN}-aeonsemi-license ${PN}-as21xxx \
              ${PN}-agere-license ${PN}-orinoco \
-             ${PN}-airoha-license ${PN}-en8811h ${PN}-airoha-npu \
+             ${PN}-airoha-license ${PN}-an8811hb ${PN}-en8811h ${PN}-airoha-npu \
              ${PN}-amd-sev-license ${PN}-ccp \
              ${PN}-amdnpu-license ${PN}-amdxdna \
              ${PN}-amd-pmf-license ${PN}-amd-pmf \
@@ -815,6 +822,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qla1280-license ${PN}-qla1280 \
              ${PN}-ib-qib-license ${PN}-ib-qib \
              ${PN}-r8a779x-usb3-license ${PN}-xhci-rcar \
+             ${PN}-r8a779g-pcie-phy-license ${PN}-pcie-rcar \
              ${PN}-r128 \
              ${PN}-rt1320-license ${PN}-rt1320 \
              ${PN}-rp2-license ${PN}-rp2 \
@@ -930,6 +938,7 @@ LICENSE:${PN}-qca-qca61x4-serial = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-qca-qca61x4-usb = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-qca-qca6390 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-qca-qca6698 = "Firmware-qualcommAthos_ath10k"
+LICENSE:${PN}-qca-qcc2072 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-qca-wcn3950 = "Firmware-qcom"
 LICENSE:${PN}-qca-wcn3988 = "Firmware-qcom"
 LICENSE:${PN}-qca-wcn399x = "Firmware-qualcommAthos_ath10k"
@@ -994,6 +1003,10 @@ FILES:${PN}-qca-qca6698 = " \
   ${nonarch_base_libdir}/firmware/qca/QCA6698/hpnv21.b207* \
   ${nonarch_base_libdir}/firmware/qca/QCA6698/hpnv21.bin* \
 "
+FILES:${PN}-qca-qcc2072 = " \
+  ${nonarch_base_libdir}/firmware/qca/ornbtfw11.tlv* \
+  ${nonarch_base_libdir}/firmware/qca/ornnv11.bin* \
+"
 FILES:${PN}-qca-wcn3950 = " \
   ${nonarch_base_libdir}/firmware/qca/cmbtfw12.tlv* \
   ${nonarch_base_libdir}/firmware/qca/cmbtfw13.tlv* \
@@ -1099,6 +1112,7 @@ RDEPENDS:${PN}-qca-qca61x4-serial += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca-qca61x4-usb += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca-qca6390 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca-qca6698 += "${PN}-ath10k-license"
+RDEPENDS:${PN}-qca-qcc2072 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca-wcn3950 += "${PN}-qcom-license"
 RDEPENDS:${PN}-qca-wcn3988 += "${PN}-qcom-license"
 RDEPENDS:${PN}-qca-wcn399x += "${PN}-ath10k-license"
@@ -2275,12 +2289,17 @@ LICENSE:${PN}-qcom-adreno-a530 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a612 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a623 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a630 = "Firmware-qcom"
+LICENSE:${PN}-qcom-adreno-a640 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a650 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a660 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a663 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a702 = "Firmware-qcom"
+LICENSE:${PN}-qcom-adreno-a730 = "Firmware-qcom"
+LICENSE:${PN}-qcom-adreno-a740 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-g705 = "Firmware-qcom"
+LICENSE:${PN}-qcom-adreno-g709 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-g715 = "Firmware-qcom"
+LICENSE:${PN}-qcom-adreno-g800 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-g802 = "Firmware-qcom"
 LICENSE:${PN}-qcom-apq8016-modem = "Firmware-qcom"
 LICENSE:${PN}-qcom-apq8016-wifi = "Firmware-qcom"
@@ -2333,17 +2352,22 @@ LICENSE:${PN}-qcom-sdm845-modem = "Firmware-qcom"
 LICENSE:${PN}-qcom-sdm845-thundercomm-db845c-sensors = "Firmware-qcom"
 LICENSE:${PN}-qcom-sdx35-foxconn-firehose = "Firmware-qcom"
 LICENSE:${PN}-qcom-sdx61-foxconn-firehose = "Firmware-qcom"
+LICENSE:${PN}-qcom-sm8150-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-sm8250-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-sm8250-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-sm8250-compute = "Firmware-qcom"
 LICENSE:${PN}-qcom-sm8250-thundercomm-rb5-sensors = "Firmware-qcom"
 LICENSE:${PN}-qcom-sm8350-adreno = "Firmware-qcom"
+LICENSE:${PN}-qcom-sm8450-adreno = "Firmware-qcom"
+LICENSE:${PN}-qcom-sm8550-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-sm8550-audio-tplg = "Firmware-linaro"
+LICENSE:${PN}-qcom-sm8650-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-sm8650-audio-tplg = "Firmware-linaro"
+LICENSE:${PN}-qcom-sm8750-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-sm8750-audio = "Firmware-qcom-2"
 LICENSE:${PN}-qcom-sm8750-compute = "Firmware-qcom-2"
 LICENSE:${PN}-qcom-x1e80100-adreno = "Firmware-qcom"
-LICENSE:${PN}-qcom-x1e80100-audio = "Firmware-qcom & Firmware-linaro"
+LICENSE:${PN}-qcom-x1e80100-audio = "Firmware-qcom-2 & Firmware-linaro"
 LICENSE:${PN}-qcom-x1e80100-compute = "Firmware-qcom"
 LICENSE:${PN}-qcom-x1e80100-lenovo-t14s-g6-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-x1e80100-lenovo-t14s-g6-audio = "Firmware-qcom & Firmware-linaro"
@@ -2379,12 +2403,17 @@ FILES:${PN}-qcom-adreno-a530 = "${nonarch_base_libdir}/firmware/qcom/a530*.fw*"
 FILES:${PN}-qcom-adreno-a612 = "${nonarch_base_libdir}/firmware/qcom/a612*.*"
 FILES:${PN}-qcom-adreno-a623 = "${nonarch_base_libdir}/firmware/qcom/a623*.*"
 FILES:${PN}-qcom-adreno-a630 = "${nonarch_base_libdir}/firmware/qcom/a630*.*"
+FILES:${PN}-qcom-adreno-a640 = "${nonarch_base_libdir}/firmware/qcom/a640*.*"
 FILES:${PN}-qcom-adreno-a650 = "${nonarch_base_libdir}/firmware/qcom/a650*.*"
 FILES:${PN}-qcom-adreno-a660 = "${nonarch_base_libdir}/firmware/qcom/a660*.*"
 FILES:${PN}-qcom-adreno-a663 = "${nonarch_base_libdir}/firmware/qcom/a663*.*"
 FILES:${PN}-qcom-adreno-a702 = "${nonarch_base_libdir}/firmware/qcom/a702*.*"
+FILES:${PN}-qcom-adreno-a730 = "${nonarch_base_libdir}/firmware/qcom/a730_sqe*.* ${nonarch_base_libdir}/firmware/qcom/gmu_gen70000.*"
+FILES:${PN}-qcom-adreno-a740 = "${nonarch_base_libdir}/firmware/qcom/a740_sqe*.* ${nonarch_base_libdir}/firmware/qcom/gmu_gen70200.*"
 FILES:${PN}-qcom-adreno-g705 = "${nonarch_base_libdir}/firmware/qcom/gen70500_*.*"
+FILES:${PN}-qcom-adreno-g709 = "${nonarch_base_libdir}/firmware/qcom/gen70900_*.* ${nonarch_base_libdir}/firmware/qcom/gmu_gen70900.*"
 FILES:${PN}-qcom-adreno-g715 = "${nonarch_base_libdir}/firmware/qcom/gen71500_*.*"
+FILES:${PN}-qcom-adreno-g800 = "${nonarch_base_libdir}/firmware/qcom/gen80000_*.*"
 FILES:${PN}-qcom-adreno-g802 = "${nonarch_base_libdir}/firmware/qcom/gen80200_*.*"
 FILES:${PN}-qcom-apq8016-modem = "${nonarch_base_libdir}/firmware/qcom/apq8016/mba.mbn* ${nonarch_base_libdir}/firmware/qcom/apq8016/modem.mbn*"
 FILES:${PN}-qcom-apq8016-wifi = "${nonarch_base_libdir}/firmware/qcom/apq8016/wcnss.mbn* ${nonarch_base_libdir}/firmware/qcom/apq8016/WCNSS*"
@@ -2446,13 +2475,18 @@ FILES:${PN}-qcom-sdm845-modem = "${nonarch_base_libdir}/firmware/qcom/sdm845/mba
 FILES:${PN}-qcom-sdm845-thundercomm-db845c-sensors = "${nonarch_base_libdir}/firmware/qcom/sdm845/Thundercomm/db845c/slpi*.*"
 FILES:${PN}-qcom-sdx35-foxconn-firehose = "${nonarch_base_libdir}/firmware/qcom/sdx35/foxconn/xbl_s_devprg_ns.melf*"
 FILES:${PN}-qcom-sdx61-foxconn-firehose = "${nonarch_base_libdir}/firmware/qcom/sdx61/foxconn/prog_firehose_lite.elf*"
+FILES:${PN}-qcom-sm8150-adreno = "${nonarch_base_libdir}/firmware/qcom/sm8150/a640*.*"
 FILES:${PN}-qcom-sm8250-adreno = "${nonarch_base_libdir}/firmware/qcom/sm8250/a650*.*"
 FILES:${PN}-qcom-sm8250-audio = "${nonarch_base_libdir}/firmware/qcom/sm8250/adsp*.*"
 FILES:${PN}-qcom-sm8250-compute = "${nonarch_base_libdir}/firmware/qcom/sm8250/cdsp*.*"
 FILES:${PN}-qcom-sm8250-thundercomm-rb5-sensors = "${nonarch_base_libdir}/firmware/qcom/sm8250/Thundercomm/RB5/slpi*.*"
 FILES:${PN}-qcom-sm8350-adreno = "${nonarch_base_libdir}/firmware/qcom/sm8350/a660_zap.mbn*"
+FILES:${PN}-qcom-sm8450-adreno = "${nonarch_base_libdir}/firmware/qcom/sm8450/a730_zap.mbn*"
+FILES:${PN}-qcom-sm8550-adreno = "${nonarch_base_libdir}/firmware/qcom/sm8550/a740_zap.mbn*"
 FILES:${PN}-qcom-sm8550-audio-tplg = "${nonarch_base_libdir}/firmware/qcom/sm8550/*tplg.bin*"
+FILES:${PN}-qcom-sm8650-adreno = "${nonarch_base_libdir}/firmware/qcom/sm8650/gen70900_zap.mbn*"
 FILES:${PN}-qcom-sm8650-audio-tplg = "${nonarch_base_libdir}/firmware/qcom/sm8650/*tplg.bin*"
+FILES:${PN}-qcom-sm8750-adreno = "${nonarch_base_libdir}/firmware/qcom/sm8750/gen80000_zap.mbn*"
 FILES:${PN}-qcom-sm8750-audio = "${nonarch_base_libdir}/firmware/qcom/sm8750/adsp*.*"
 FILES:${PN}-qcom-sm8750-compute = "${nonarch_base_libdir}/firmware/qcom/sm8750/cdsp*.*"
 FILES:${PN}-qcom-x1e80100-adreno = "${nonarch_base_libdir}/firmware/qcom/x1e80100/gen70500_zap.mbn*"
@@ -2488,12 +2522,17 @@ RDEPENDS:${PN}-qcom-adreno-a530 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a612 = "${PN}-qcom-license ${PN}-qcom-adreno-a630"
 RDEPENDS:${PN}-qcom-adreno-a623 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a630 = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-adreno-a640 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a650 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a660 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a663 = "${PN}-qcom-license ${PN}-qcom-adreno-a660"
 RDEPENDS:${PN}-qcom-adreno-a702 = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-adreno-a730 = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-adreno-a740 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-g705 = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-adreno-g709 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-g715 = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-adreno-g800 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-g802 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8016-modem = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8016-wifi = "${PN}-qcom-license"
@@ -2552,17 +2591,22 @@ RDEPENDS:${PN}-qcom-sdm845-modem = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdm845-thundercomm-db845c-sensors = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdx35-foxconn-firehose = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sdx61-foxconn-firehose = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-sm8150-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8250-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8250-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8250-compute = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8250-thundercomm-rb5-sensors = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8350-adreno = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-sm8450-adreno = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-sm8550-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8550-audio-tplg = "${PN}-linaro-license"
+RDEPENDS:${PN}-qcom-sm8650-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8650-audio-tplg = "${PN}-linaro-license"
+RDEPENDS:${PN}-qcom-sm8750-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8750-audio = "${PN}-qcom-2-license"
 RDEPENDS:${PN}-qcom-sm8750-compute = "${PN}-qcom-2-license"
 RDEPENDS:${PN}-qcom-x1e80100-adreno = "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-x1e80100-audio = "${PN}-qcom-license ${PN}-linaro-license"
+RDEPENDS:${PN}-qcom-x1e80100-audio = "${PN}-qcom-2-license ${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-x1e80100-compute = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-x1e80100-lenovo-t14s-g6-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-x1e80100-lenovo-t14s-g6-audio = "${PN}-qcom-license ${PN}-linaro-license"
@@ -2681,6 +2725,10 @@ RDEPENDS:${PN}-orinoco = "${PN}-agere-license"
 LICENSE:${PN}-airoha-license = "Firmware-airoha"
 FILES:${PN}-airoha-license = "${nonarch_base_libdir}/firmware/LICENSE.airoha"
 
+LICENSE:${PN}-an8811hb = "Firmware-airoha"
+FILES:${PN}-an8811hb = "${nonarch_base_libdir}/firmware/airoha/an8811hb/EthMD32*"
+RDEPENDS:${PN}-an8811hb = "${PN}-airoha-license"
+
 LICENSE:${PN}-en8811h = "Firmware-airoha"
 FILES:${PN}-en8811h = "${nonarch_base_libdir}/firmware/airoha/EthMD32*"
 RDEPENDS:${PN}-en8811h = "${PN}-airoha-license"
@@ -3137,6 +3185,14 @@ LICENSE:${PN}-xhci-rcar = "Firmware-r8a779x_usb3"
 FILES:${PN}-xhci-rcar = "${nonarch_base_libdir}/firmware/r8a779x_usb3_*"
 RDEPENDS:${PN}-xhci-rcar = "${PN}-r8a779x-usb3-license"
 
+# For pcie-rcar-gen4 - Renesas R-Car Gen4 PCIe driver
+LICENSE:${PN}-r8a779g-pcie-phy-license = "Firmware-r8a779g_pcie_phy"
+FILES:${PN}-r8a779g-pcie-phy-license = "${nonarch_base_libdir}/firmware/LICENCE.r8a779g_pcie_phy"
+
+LICENSE:${PN}-pcie-rcar = "Firmware-r8a779g_pcie_phy"
+FILES:${PN}-pcie-rcar = "${nonarch_base_libdir}/firmware/rcar_gen4_pcie.bin*"
+RDEPENDS:${PN}-pcie-rcar = "${PN}-r8a779g-pcie-phy-license"
+
 # For r128 - ATI Rage 128
 LICENSE:${PN}-r128 = "MIT"
 FILES:${PN}-r128 = "${nonarch_base_libdir}/firmware/r128/*"
-- 
2.47.3


