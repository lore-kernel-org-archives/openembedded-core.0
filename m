Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F388CCD185
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 18:04:01 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.51700.1760378635587610450
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Oct 2025 11:03:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=kPH80PQB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DHDAWX005682
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 18:03:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Sw4ToGX6ZSu
	lk/4n7K0H6YS+tHVbpYNnvEW6+kw3g3o=; b=kPH80PQBX40e/zTPNPPatnRfhCc
	Z68G2Q2wOMvaqis0hUe2znGO0y2f4YEeeXS5BlPwAyMtCo7kwfbVTt3UedOID19t
	OIzwkf4qJJRLlsC80I82Xuv+cfqupk2jKHaIe2vjEywm9xCgQ95leYCoDQ0hjaDo
	XXcfJT5V6ZFU4l6DQw6VToeZMso9NTu34uNGNgjLy9LwwF3dF1TdZObzd0AetHy6
	+9xrBFciGkL0FqR3qxVo3QUwNhImaEP/NCJdPt14Sz6mS05xA+UXyE1jp7TebT0P
	MpYLgoV6DpQupx3zMFw6CZZ26KNUPfjRMZX9VLYTJnF2QwZdKExqsptGMCg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa85n4q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 18:03:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-859df490f9dso1077839285a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 11:03:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760378633; x=1760983433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sw4ToGX6ZSulk/4n7K0H6YS+tHVbpYNnvEW6+kw3g3o=;
        b=ud0QFKUGpGF5QRlPA/8S8iWxWGywy6YwnDJOd2NPcJHgnD4OosjXpfpoPrJkDAddrr
         WZrDvk3ES4mA3Z8MZAW47DEhC1eEVz3tfRKM6hwZL9rShMVoQIT5ElbEU9T5/lChFR5Y
         ziy8SHjK6/OuxNiMEN6dl+D9buGsEv185RZUtTL04Yx931Pl0w2+MgIXBsqJ96eFNxod
         NGTiBjpCWJaxsSgLPhDkPL2xtBnaSaIDS9dJxicuCvNM9JhXVGtA2DWktMzieMewbGrM
         vmRBpe1Q7Pp8DEU2xeS39fpfIxZxZG/c81sCEo70ZXBvyT1b3Mv1l8MCe1zya8AR5Li+
         XuzQ==
X-Gm-Message-State: AOJu0YwOITPY5/ORuIsYIIteLZBMk3zb23vu1hiYAXrO4LZHTwAk0GIw
	KDet87M8wdiaOXbtPWVq7cnod9uuJoGVeCzZOSOp/DM2H5wtmP8SW5Xql5s1sL6PZ3FVUooBEMp
	Phrfj2gIPHdnwnDMmudgEmCUhKecZMRT8QQA9JIUf/xtojxlLY3w2SBTe17Ufe6Sv8l9oyC+SwA
	gMyN5N/XVADqzfmJk=
X-Gm-Gg: ASbGncuAGmj3GZfAzkz0Fak7oiyh0x/dYxCLUJWRDDuLt3Xyl8yRw7ueAj1mCeVCkdb
	vSXd/HRmoMBOPpsrSg4/0AfwzFo3qVA6w3ijjQlqwbokFhOXo4kInHjEJzgmxXftS1sXXHUUA4q
	C11LT7pf3H6VMu/X6kO5eNePcA7NWJB0MS4w8VX/HVF1ocpgqrDb9wkRztHIH3L0V/IEgfRL6/L
	NIZALgv488lm3FNcti1/7GsYvWhtP/1b3/2fE0dLoTvsQ6Re1dlq1Tob4YbPD4l0oXvNqlltoDG
	TBm2ET4gJ7h2eXiAdX9DRKPWH3zmOCG74mwotmAenajq9yquA/1o7PTcwy1aL4TXEDSqPPUZNei
	9W5s0miVRVR05E6hB46e+qz8A34oBXlAeZvfOJI7wmf106zwL/joF
X-Received: by 2002:a05:622a:1309:b0:4b0:8e2e:fd9b with SMTP id d75a77b69052e-4e6ead0231emr294775631cf.28.1760378632657;
        Mon, 13 Oct 2025 11:03:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYgeCaTH/PR7NY9okQBhXoGqI3Lofg6kyVcON7Mq8H05ZFXrwj1qtUeN+5qrkhsTYifh/CUA==
X-Received: by 2002:a05:622a:1309:b0:4b0:8e2e:fd9b with SMTP id d75a77b69052e-4e6ead0231emr294774701cf.28.1760378631617;
        Mon, 13 Oct 2025 11:03:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e5790sm4357490e87.19.2025.10.13.11.03.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 11:03:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] linux-firmware: upgrade 20250917 -> 20251011
Date: Mon, 13 Oct 2025 21:03:48 +0300
Message-ID: <20251013180348.3061809-2-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251013180348.3061809-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20251013180348.3061809-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: K_HJi-JQFQOc6CS71gFtzPsKVQGC4ESS
X-Proofpoint-ORIG-GUID: K_HJi-JQFQOc6CS71gFtzPsKVQGC4ESS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfX06z8jtaxChsO
 Xh4g92npkfwAmWFMIkrzIs1KRDbZir3WRdIC/AbdjHyDJINUQLoFFlCV5wJ5UKZzFurSnoxy/xD
 jzpTfPDy/kzYwvXHzIYPf6uAU/a9prPiTrw1tjiP4ULOWpdE2+9c8RJ9cdUlSrVv1rB0548z0NG
 7jMujQMq+w7vvfGf+vmbflmV6t+/TPfeJO4HIgYnXSJc6/kRWiEi4ehT5GGu1DRcbQNjYLMt8OL
 4fMMhOJ09oxc9OERLrtVPmRla4Fq/Cmq+eWA7AWOrUCgK9c7yH/TP76G2VFiB07AvwBshWaD2Sr
 KtZTFkezNLWObce510gCz0gH1F13DHP4g6Qf5hUe9eQHojHDF9wnarsumK06wx+YLMZhbob0Vcl
 +ksQElHlmLfn49J/4YBj7MnlzBu8MA==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68ed3f0a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=p0WdMEafAAAA:8 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=gLZiFkM3ttvkV3pLbGgA:9 a=IoWCM6iH3mJn3m4BftBB:22 a=poXaRoVlC6wW9_mwW8W4:22
 a=pHzHmUro8NiASowvMSCR:22 a=n87TN5wuljxrRezIQYnT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 18:04:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224791

Update the linux-firmware packate to the latest release. Add firmware
packages for Intel Sensors Hub on Dell and HP machines and also several
new Qualcomm firmware packages

License-Update: new and updated firmware

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...ANS-EVK-firmware-to-correct-location.patch | 39 --------
 ...20250917.bb => linux-firmware_20251011.bb} | 91 +++++++++++++++----
 2 files changed, 72 insertions(+), 58 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux-firmware/linux-firmware/0001-qcom-move-LEMANS-EVK-firmware-to-correct-location.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20250917.bb => linux-firmware_20251011.bb} (97%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware/0001-qcom-move-LEMANS-EVK-firmware-to-correct-location.patch b/meta/recipes-kernel/linux-firmware/linux-firmware/0001-qcom-move-LEMANS-EVK-firmware-to-correct-location.patch
deleted file mode 100644
index 01e555cbebc7..000000000000
--- a/meta/recipes-kernel/linux-firmware/linux-firmware/0001-qcom-move-LEMANS-EVK-firmware-to-correct-location.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 6625e563d600eba34cf2c71df7572ad1c421c6fd Mon Sep 17 00:00:00 2001
-From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-Date: Thu, 18 Sep 2025 05:37:13 +0300
-Subject: [PATCH] qcom: move LEMANS EVK firmware to correct location
-
-All firmware for the Lemans platform is located under qcom/sa8775p/
-subdir. Move audio topology for Lemans EVK to the same location and
-provide (ugh) backwards-compatible symlink.
-
-Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
-Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-Upstream-Status: Backport [https://gitlab.com/kernel-firmware/linux-firmware/-/commit/6625e563d600eba34cf2c71df7572ad1c421c6fd]
----
- WHENCE                                        |   3 ++-
- qcom/{qcs9100 => sa8775p}/LEMANS-EVK-tplg.bin | Bin
- 2 files changed, 2 insertions(+), 1 deletion(-)
- rename qcom/{qcs9100 => sa8775p}/LEMANS-EVK-tplg.bin (100%)
-
-diff --git a/WHENCE b/WHENCE
-index a93effa5008b..e22d8218959f 100644
---- a/WHENCE
-+++ b/WHENCE
-@@ -8469,7 +8469,8 @@ Originates from https://github.com/linux-msm/audioreach-topology.git
- --------------------------------------------------------------------------
- 
- Driver: qcom-qcs9100 - Qualcomm ASoC topology
--File: qcom/qcs9100/LEMANS-EVK-tplg.bin
-+File: qcom/sa8775p/LEMANS-EVK-tplg.bin
-+Link: qcom/qcs9100/LEMANS-EVK-tplg.bin -> ../sa8775p/LEMANS-EVK-tplg.bin
- Version: v0.1.0
- 
- Licence: Redistributable. See LICENCE.linaro for details
-diff --git a/qcom/qcs9100/LEMANS-EVK-tplg.bin b/qcom/sa8775p/LEMANS-EVK-tplg.bin
-similarity index 100%
-rename from qcom/qcs9100/LEMANS-EVK-tplg.bin
-rename to qcom/sa8775p/LEMANS-EVK-tplg.bin
--- 
-2.51.0
-
diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250917.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20251011.bb
similarity index 97%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20250917.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20251011.bb
index 3830ca59a2fe..a9e8935f930b 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250917.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20251011.bb
@@ -92,6 +92,7 @@ LICENSE = "\
     & Firmware-cxgb3 \
     & Firmware-cypress \
     & Firmware-dabusb \
+    & Firmware-dell \
     & Firmware-dib0700 \
     & Firmware-drxk \
     & Firmware-e100 \
@@ -99,8 +100,8 @@ LICENSE = "\
     & Firmware-ene_firmware \
     & Firmware-fw_sst_0f28 \
     & Firmware-go7007 \
-    & Firmware-go7007-s2250 \
     & Firmware-hfi1_firmware \
+    & Firmware-HP \
     & Firmware-i915 \
     & Firmware-ib_qib \
     & Firmware-ibt_firmware \
@@ -158,6 +159,7 @@ LICENSE = "\
     & Firmware-rtlwifi_firmware \
     & Firmware-imx-sdma_firmware \
     & Firmware-s5p-mfc \
+    & Firmware-sensoray \
     & Firmware-siano \
     & Firmware-tehuti \
     & Firmware-ti-connectivity \
@@ -220,6 +222,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.cxgb3;md5=1cf82d9e2a4b301e20c7936e61cd0e45 \
                     file://LICENCE.cypress;md5=48cd9436c763bf873961f9ed7b5c147b \
                     file://LICENCE.dabusb;md5=fd785fc5f935c950a3423e4b1b996657 \
+                    file://LICENSE.dell;md5=032c317c0483dd3364f478d2bf9d9818 \
                     file://LICENSE.dib0700;md5=f7411825c8a555a1a3e5eab9ca773431 \
                     file://LICENSE.drxk;md5=87a325e2e9740837036af3f04efa0d0f \
                     file://LICENCE.e100;md5=ec0f84136766df159a3ae6d02acdf5a8 \
@@ -227,8 +230,8 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.ene_firmware;md5=ed67f0f62f8f798130c296720b7d3921 \
                     file://LICENCE.fw_sst_0f28;md5=6353931c988ad52818ae733ac61cd293 \
                     file://LICENCE.go7007;md5=c0bb9f6aaaba55b0529ee9b30aa66beb \
-                    file://LICENCE.go7007-s2250;md5=2273a7fed8223f6d3ef3e65f508f22eb \
                     file://LICENSE.hfi1_firmware;md5=5e7b6e586ce7339d12689e49931ad444 \
+                    file://LICENCE.HP;md5=3506ce9cd4bedeaa4afb2d8fe24e0688 \
                     file://LICENSE.i915;md5=2b0b2e0d20984affd4490ba2cba02570 \
                     file://LICENSE.ib_qib;md5=b909c90fca84c507766601ecb6f3b9d9 \
                     file://LICENCE.ibt_firmware;md5=fdbee1ddfe0fb7ab0b2fcd6b454a366b \
@@ -287,6 +290,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.rtlwifi_firmware.txt;md5=00d06cfd3eddd5a2698948ead2ad54a5 \
                     file://LICENSE.s5p-mfc;md5=5bdad20069b5c0268245609045374639 \
                     file://LICENSE.sdma_firmware;md5=51e8c19ecc2270f4b8ea30341ad63ce9 \
+                    file://LICENCE.sensoray;md5=2273a7fed8223f6d3ef3e65f508f22eb \
                     file://LICENCE.siano;md5=4556c1bf830067f12ca151ad953ec2a5 \
                     file://LICENSE.tehuti;md5=2b0ebf8cdc4a1c4a49b8ad18c7cb2492 \
                     file://LICENCE.ti-connectivity;md5=3b1e9cf54aba8146dad4b735777d406f \
@@ -308,7 +312,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "a12ddaaab7162785af9d79b76132d185"
+WHENCE_CHKSUM  = "585c66ed89dcbaacae7023deb32b6bd2"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -347,6 +351,7 @@ NO_GENERIC_LICENSE[Firmware-cw1200-sdd] = "LICENCE.cw1200-sdd"
 NO_GENERIC_LICENSE[Firmware-cxgb3] = "LICENCE.cxgb3"
 NO_GENERIC_LICENSE[Firmware-cypress] = "LICENCE.cypress"
 NO_GENERIC_LICENSE[Firmware-dabusb] = "LICENCE.dabusb"
+NO_GENERIC_LICENSE[Firmware-dell] = "LICENSE.dell"
 NO_GENERIC_LICENSE[Firmware-dib0700] = "LICENSE.dib0700"
 NO_GENERIC_LICENSE[Firmware-drxk] = "LICENSE.drxk"
 NO_GENERIC_LICENSE[Firmware-e100] = "LICENCE.e100"
@@ -354,8 +359,8 @@ NO_GENERIC_LICENSE[Firmware-emi26] = "LICENCE.emi26"
 NO_GENERIC_LICENSE[Firmware-ene_firmware] = "LICENCE.ene_firmware"
 NO_GENERIC_LICENSE[Firmware-fw_sst_0f28] = "LICENCE.fw_sst_0f28"
 NO_GENERIC_LICENSE[Firmware-go7007] = "LICENCE.go7007"
-NO_GENERIC_LICENSE[Firmware-go7007-s2250] = "LICENCE.go7007-s2250"
 NO_GENERIC_LICENSE[Firmware-hfi1_firmware] = "LICENSE.hfi1_firmware"
+NO_GENERIC_LICENSE[Firmware-HP] = "LICENCE.HP"
 NO_GENERIC_LICENSE[Firmware-i915] = "LICENSE.i915"
 NO_GENERIC_LICENSE[Firmware-ib_qib] = "LICENSE.ib_qib"
 NO_GENERIC_LICENSE[Firmware-ibt_firmware] = "LICENCE.ibt_firmware"
@@ -412,6 +417,7 @@ NO_GENERIC_LICENSE[Firmware-rsi] = "LICENSE.rsi"
 NO_GENERIC_LICENSE[Firmware-rt1320] = "LICENSE.rt1320"
 NO_GENERIC_LICENSE[Firmware-rtlwifi_firmware] = "LICENCE.rtlwifi_firmware.txt"
 NO_GENERIC_LICENSE[Firmware-s5p-mfc] = "LICENSE.s5p-mfc"
+NO_GENERIC_LICENSE[Firmware-sensoray] = "LICENCE.sensoray"
 NO_GENERIC_LICENSE[Firmware-siano] = "LICENCE.siano"
 NO_GENERIC_LICENSE[Firmware-imx-sdma_firmware] = "LICENSE.sdma_firmware"
 NO_GENERIC_LICENSE[Firmware-tehuti] = "LICENSE.tehuti"
@@ -436,7 +442,6 @@ PE = "1"
 
 SRC_URI = "\
   ${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz \
-  file://0001-qcom-move-LEMANS-EVK-firmware-to-correct-location.patch \
 "
 
 BBCLASSEXTEND = "devupstream:target"
@@ -444,7 +449,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "120575b756915a11e736f599316a756b6a29a76d6135ad86208868b21c58fb75"
+SRC_URI[sha256sum] = "b6c9a9c112b88417d985b87d6521b677fa2fa0d5d7ee5219c76dc8ca66945ad3"
 
 inherit allarch
 
@@ -693,13 +698,16 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qcom-adreno-a2xx ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a4xx ${PN}-qcom-adreno-a530 \
              ${PN}-qcom-adreno-a612 ${PN}-qcom-adreno-a623 ${PN}-qcom-adreno-a630 \
              ${PN}-qcom-adreno-a650 ${PN}-qcom-adreno-a660 ${PN}-qcom-adreno-a663 \
-             ${PN}-qcom-adreno-a702 ${PN}-qcom-adreno-g715 ${PN}-qcom-adreno-g750 \
+             ${PN}-qcom-adreno-a702 ${PN}-qcom-adreno-g715 ${PN}-qcom-adreno-g705 \
+             ${PN}-qcom-adreno-g802 \
              ${PN}-qcom-apq8016-modem ${PN}-qcom-apq8016-wifi \
              ${PN}-qcom-apq8096-adreno ${PN}-qcom-apq8096-audio ${PN}-qcom-apq8096-modem \
+             ${PN}-qcom-kaanapali-adreno ${PN}-qcom-kaanapali-compute \
              ${PN}-qcom-qcm2290-adreno ${PN}-qcom-qcm2290-audio ${PN}-qcom-qcm2290-modem \
              ${PN}-qcom-qcm6490-adreno ${PN}-qcom-qcm6490-audio ${PN}-qcom-qcm6490-compute \
              ${PN}-qcom-qcm6490-ipa ${PN}-qcom-qcm6490-wifi ${PN}-qcom-qcm6490-qupv3fw \
              ${PN}-qcom-qcs615-adreno ${PN}-qcom-qcs615-audio ${PN}-qcom-qcs615-compute \
+             ${PN}-qcom-qcs6490-radxa-dragon-q6a-audio \
              ${PN}-qcom-qcs8300-adreno ${PN}-qcom-qcs8300-audio ${PN}-qcom-qcs8300-compute \
              ${PN}-qcom-qcs8300-generalpurpose ${PN}-qcom-qcs8300-qupv3fw \
              ${PN}-qcom-qrb4210-adreno \
@@ -737,6 +745,8 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-xc5000c-license ${PN}-xc5000c \
              ${PN}-typhoon-license ${PN}-typhoon \
              ${PN}-intel-license ${PN}-ish-lnlm \
+             ${PN}-dell-license ${PN}-ish-lnlm-39ceeaf8 \
+             ${PN}-hp-license ${PN}-ish-lnlm-dba6b120-152c3222 \
              ${PN}-lenovo-license ${PN}-ish-lnlm-53c4ffad-2a17559f \
              ${PN}-advansys-license ${PN}-advansys \
              ${PN}-aeonsemi-license ${PN}-as21xxx \
@@ -773,7 +783,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-emi26-license ${PN}-emi26 \
              ${PN}-ene-firmware-license ${PN}-ene-ub6250 \
              ${PN}-snd-maestro3 \
-             ${PN}-go7007-s2250-license ${PN}-go7007-s2250 \
+             ${PN}-sensoray-license ${PN}-go7007-s2250 \
              ${PN}-go7007-license ${PN}-go7007 \
              ${PN}-hfi1-license ${PN}-hfi1 \
              ${PN}-inside-secure-license ${PN}-inside-secure \
@@ -2259,13 +2269,16 @@ LICENSE:${PN}-qcom-adreno-a650 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a660 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a663 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-a702 = "Firmware-qcom"
+LICENSE:${PN}-qcom-adreno-g705 = "Firmware-qcom"
 LICENSE:${PN}-qcom-adreno-g715 = "Firmware-qcom"
-LICENSE:${PN}-qcom-adreno-g750 = "Firmware-qcom"
+LICENSE:${PN}-qcom-adreno-g802 = "Firmware-qcom"
 LICENSE:${PN}-qcom-apq8016-modem = "Firmware-qcom"
 LICENSE:${PN}-qcom-apq8016-wifi = "Firmware-qcom"
 LICENSE:${PN}-qcom-apq8096-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-apq8096-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-apq8096-modem = "Firmware-qcom"
+LICENSE:${PN}-qcom-kaanapali-adreno = "Firmware-qcom"
+LICENSE:${PN}-qcom-kaanapali-compute = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcm2290-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcm2290-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcm2290-modem = "Firmware-qcom"
@@ -2279,6 +2292,7 @@ LICENSE:${PN}-qcom-qcm6490-qupv3fw = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcs615-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcs615-audio = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcs615-compute = "Firmware-qcom"
+LICENSE:${PN}-qcom-qcs6490-radxa-dragon-q6a-audio = "Firmware-qcom & Firmware-linaro"
 LICENSE:${PN}-qcom-qcs8300-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-qcs8300-audio = "Firmware-qcom-2 & Firmware-linaro"
 LICENSE:${PN}-qcom-qcs8300-compute = "Firmware-qcom-2"
@@ -2313,7 +2327,7 @@ LICENSE:${PN}-qcom-sm8550-audio-tplg = "Firmware-linaro"
 LICENSE:${PN}-qcom-sm8650-audio-tplg = "Firmware-linaro"
 LICENSE:${PN}-qcom-sm8350-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-x1e80100-adreno = "Firmware-qcom"
-LICENSE:${PN}-qcom-x1e80100-audio = "Firmware-qcom"
+LICENSE:${PN}-qcom-x1e80100-audio = "Firmware-qcom & Firmware-linaro"
 LICENSE:${PN}-qcom-x1e80100-compute = "Firmware-qcom"
 LICENSE:${PN}-qcom-x1e80100-lenovo-t14s-g6-adreno = "Firmware-qcom"
 LICENSE:${PN}-qcom-x1e80100-lenovo-t14s-g6-audio = "Firmware-qcom & Firmware-linaro"
@@ -2353,13 +2367,16 @@ FILES:${PN}-qcom-adreno-a650 = "${nonarch_base_libdir}/firmware/qcom/a650*.*"
 FILES:${PN}-qcom-adreno-a660 = "${nonarch_base_libdir}/firmware/qcom/a660*.*"
 FILES:${PN}-qcom-adreno-a663 = "${nonarch_base_libdir}/firmware/qcom/a663*.*"
 FILES:${PN}-qcom-adreno-a702 = "${nonarch_base_libdir}/firmware/qcom/a702*.*"
-FILES:${PN}-qcom-adreno-g750 = "${nonarch_base_libdir}/firmware/qcom/gen70500_*.*"
+FILES:${PN}-qcom-adreno-g705 = "${nonarch_base_libdir}/firmware/qcom/gen70500_*.*"
 FILES:${PN}-qcom-adreno-g715 = "${nonarch_base_libdir}/firmware/qcom/gen71500_*.*"
+FILES:${PN}-qcom-adreno-g802 = "${nonarch_base_libdir}/firmware/qcom/gen80200_*.*"
 FILES:${PN}-qcom-apq8016-modem = "${nonarch_base_libdir}/firmware/qcom/apq8016/mba.mbn* ${nonarch_base_libdir}/firmware/qcom/apq8016/modem.mbn*"
 FILES:${PN}-qcom-apq8016-wifi = "${nonarch_base_libdir}/firmware/qcom/apq8016/wcnss.mbn* ${nonarch_base_libdir}/firmware/qcom/apq8016/WCNSS*"
 FILES:${PN}-qcom-apq8096-adreno = "${nonarch_base_libdir}/firmware/qcom/apq8096/a530_zap.mbn* ${nonarch_base_libdir}/firmware/qcom/a530_zap.mdt*"
 FILES:${PN}-qcom-apq8096-audio = "${nonarch_base_libdir}/firmware/qcom/apq8096/adsp*.*"
 FILES:${PN}-qcom-apq8096-modem = "${nonarch_base_libdir}/firmware/qcom/apq8096/mba.mbn* ${nonarch_base_libdir}/firmware/qcom/apq8096/modem*.* ${nonarch_base_libdir}/firmware/qcom/apq8096/wlanmdsp.mbn*"
+FILES:${PN}-qcom-kaanapali-adreno = "${nonarch_base_libdir}/firmware/qcom/kaanapali/gen80200_zap.mbn*"
+FILES:${PN}-qcom-kaanapali-compute = "${nonarch_base_libdir}/firmware/qcom/kaanapali/cdsp*.*"
 FILES:${PN}-qcom-qcm2290-adreno = "${nonarch_base_libdir}/firmware/qcom/qcm2290/a702_zap.mbn*"
 FILES:${PN}-qcom-qcm2290-audio = "${nonarch_base_libdir}/firmware/qcom/qcm2290/adsp*.*"
 FILES:${PN}-qcom-qcm2290-modem = "${nonarch_base_libdir}/firmware/qcom/qcm2290/modem*.*"
@@ -2373,6 +2390,10 @@ FILES:${PN}-qcom-qcm6490-qupv3fw = "${nonarch_base_libdir}/firmware/qcom/qc[ms]6
 FILES:${PN}-qcom-qcs615-adreno = "${nonarch_base_libdir}/firmware/qcom/qcs615/a612_zap.mbn*"
 FILES:${PN}-qcom-qcs615-audio = "${nonarch_base_libdir}/firmware/qcom/qcs615/adsp*.*"
 FILES:${PN}-qcom-qcs615-compute = "${nonarch_base_libdir}/firmware/qcom/qcs615/cdsp*.*"
+FILES:${PN}-qcom-qcs6490-radxa-dragon-q6a-audio = " \
+    ${nonarch_base_libdir}/firmware/qcom/qcs6490/radxa/dragon-q6a/adsp*.* \
+    ${nonarch_base_libdir}/firmware/qcom/qcs6490/QCS6490-Radxa-Dragon-Q6A-tplg.bin*\
+    "
 FILES:${PN}-qcom-qcs8300-adreno = "${nonarch_base_libdir}/firmware/qcom/qcs8300/a623_zap.mbn*"
 FILES:${PN}-qcom-qcs8300-audio = "${nonarch_base_libdir}/firmware/qcom/qcs8300/adsp*.* ${nonarch_base_libdir}/firmware/qcom/qcs8300/MONACO-EVK-tplg.bin*"
 FILES:${PN}-qcom-qcs8300-compute = "${nonarch_base_libdir}/firmware/qcom/qcs8300/cdsp*.*"
@@ -2413,7 +2434,11 @@ FILES:${PN}-qcom-sm8550-audio-tplg = "${nonarch_base_libdir}/firmware/qcom/sm855
 FILES:${PN}-qcom-sm8650-audio-tplg = "${nonarch_base_libdir}/firmware/qcom/sm8650/*tplg.bin*"
 FILES:${PN}-qcom-sm8350-adreno = "${nonarch_base_libdir}/firmware/qcom/sm8350/a660_zap.mbn*"
 FILES:${PN}-qcom-x1e80100-adreno = "${nonarch_base_libdir}/firmware/qcom/x1e80100/gen70500_zap.mbn*"
-FILES:${PN}-qcom-x1e80100-audio = "${nonarch_base_libdir}/firmware/qcom/x1e80100/adsp*.* ${nonarch_base_libdir}/firmware/qcom/x1e80100/battmgr.jsn"
+FILES:${PN}-qcom-x1e80100-audio = " \
+    ${nonarch_base_libdir}/firmware/qcom/x1e80100/adsp*.* \
+    ${nonarch_base_libdir}/firmware/qcom/x1e80100/battmgr.jsn \
+    ${nonarch_base_libdir}/firmware/qcom/x1e80100/X1E80100-EVK-tplg.bin* \
+    "
 FILES:${PN}-qcom-x1e80100-compute = "${nonarch_base_libdir}/firmware/qcom/x1e80100/cdsp*.*"
 FILES:${PN}-qcom-x1e80100-lenovo-t14s-g6-adreno = "${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/21N1/qcdxkmsuc8380.mbn*"
 FILES:${PN}-qcom-x1e80100-lenovo-t14s-g6-audio = "${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/21N1/*adsp*.* ${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/21N1/battmgr.jsn* ${nonarch_base_libdir}/firmware/qcom/x1e80100/LENOVO/21N1/X1E80100-LENOVO-Thinkpad-T14s-tplg.bin* ${nonarch_base_libdir}/firmware/qcom/x1e80100/X1E80100-LENOVO-Thinkpad-T14s-tplg.bin*"
@@ -2445,13 +2470,16 @@ RDEPENDS:${PN}-qcom-adreno-a650 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a660 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-a663 = "${PN}-qcom-license ${PN}-qcom-adreno-a660"
 RDEPENDS:${PN}-qcom-adreno-a702 = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-adreno-g705 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-adreno-g715 = "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-adreno-g750 = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-adreno-g802 = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8016-modem = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8016-wifi = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8096-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8096-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-apq8096-modem = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-kaanapali-adreno = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-kaanapali-compute = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcm2290-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcm2290-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcm2290-modem = "${PN}-qcom-license"
@@ -2469,6 +2497,7 @@ RDEPENDS:${PN}-qcom-qcm6490-qupv3fw = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcs615-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcs615-audio = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcs615-compute = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-qcs6490-radxa-dragon-q6a-audio = "${PN}-qcom-license ${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-qcs8300-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcs8300-audio = "${PN}-qcom-2-license ${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-qcs8300-compute = "${PN}-qcom-2-license"
@@ -2505,7 +2534,7 @@ RDEPENDS:${PN}-qcom-sm8550-audio-tplg = "${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-sm8650-audio-tplg = "${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-sm8350-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-x1e80100-adreno = "${PN}-qcom-license"
-RDEPENDS:${PN}-qcom-x1e80100-audio = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-x1e80100-audio = "${PN}-qcom-license ${PN}-linaro-license"
 RDEPENDS:${PN}-qcom-x1e80100-compute = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-x1e80100-lenovo-t14s-g6-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-x1e80100-lenovo-t14s-g6-audio = "${PN}-qcom-license ${PN}-linaro-license"
@@ -2559,6 +2588,28 @@ LICENSE:${PN}-ish-lnlm = "Firmware-intel"
 FILES:${PN}-ish-lnlm = "${nonarch_base_libdir}/firmware/intel/ish/ish_lnlm.bin"
 RDEPENDS:${PN}-ish-lnlm = "${PN}-intel-license"
 
+# For Dell ish - Intel Integrated Sensor Hub
+LICENSE:${PN}-dell-license = "Firmware-dell"
+FILES:${PN}-dell-license = "${nonarch_base_libdir}/firmware/LICENSE.dell"
+
+LICENSE:${PN}-ish-lnlm-39ceeaf8 = "Firmware-dell"
+FILES:${PN}-ish-lnlm-39ceeaf8 =  "\
+    ${nonarch_base_libdir}/firmware/intel/ish/ish_lnlm_39ceeaf8.bin \
+    ${nonarch_base_libdir}/firmware/dell/ish/ish_lnlm_39ceeaf8_*.bin \
+"
+RDEPENDS:${PN}-ish-lnlm-39ceeaf8 = "${PN}-dell-license"
+
+# For HP ish - Intel Integrated Sensor Hub
+LICENSE:${PN}-hp-license = "Firmware-HP"
+FILES:${PN}-hp-license = "${nonarch_base_libdir}/firmware/LICENSE.HP"
+
+LICENSE:${PN}-ish-lnlm-dba6b120-152c3222 = "Firmware-HP"
+FILES:${PN}-ish-lnlm-dba6b120-152c3222 = " \
+    ${nonarch_base_libdir}/firmware/intel/ish/ish_lnlm_dba6b120_152c3222.bin \
+    ${nonarch_base_libdir}/firmware/HP/ish/ish_lnlm_dba6b120_152c3222.bin \
+"
+RDEPENDS:${PN}-ish-lnlm-dba6b120-152c3222 = "${PN}-hp-license"
+
 # For LENOVO ish - Intel Integrated Sensor Hub
 LICENSE:${PN}-lenovo-license = "Firmware-lenovo"
 FILES:${PN}-lenovo-license = "${nonarch_base_libdir}/firmware/LICENCE.lenovo"
@@ -2878,15 +2929,15 @@ FILES:${PN}-ene-ub6250 = "${nonarch_base_libdir}/firmware/ene-ub6250/*"
 RDEPENDS:${PN}-ene-ub6250 = "${PN}-ene-firmware-license"
 
 # For go7007-s2250
-LICENSE:${PN}-go7007-s2250-license = "Firmware-go7007-s2250"
-FILES:${PN}-go7007-s2250-license = "${nonarch_base_libdir}/firmware/LICENCE.go7007-s2250"
+LICENSE:${PN}-sensoray-license = "Firmware-sensoray"
+FILES:${PN}-sensoray-license = "${nonarch_base_libdir}/firmware/LICENCE.sensoray"
 
-LICENSE:${PN}-go7007-s2250 = "Firmware-go7007-s2250"
+LICENSE:${PN}-go7007-s2250 = "Firmware-sensoray"
 FILES:${PN}-go7007-s2250 = " \
     ${nonarch_base_libdir}/firmware/go7007/s2250* \
     ${nonarch_base_libdir}/firmware/s2250* \
 "
-RDEPENDS:${PN}-go7007-s2250 = "${PN}-go7007-s2250-license"
+RDEPENDS:${PN}-go7007-s2250 = "${PN}-sensoray-license"
 
 # For go7007
 LICENSE:${PN}-go7007-license = "Firmware-go7007"
@@ -3225,6 +3276,7 @@ LICENSE:${PN} = "\
     & Firmware-cw1200-sdd \
     & Firmware-cxgb3 \
     & Firmware-dabusb \
+    & Firmware-dell \
     & Firmware-dib0700 \
     & Firmware-drxk \
     & Firmware-e100 \
@@ -3232,8 +3284,8 @@ LICENSE:${PN} = "\
     & Firmware-ene_firmware \
     & Firmware-fw_sst_0f28 \
     & Firmware-go7007 \
-    & Firmware-go7007-s2250 \
     & Firmware-hfi1_firmware \
+    & Firmware-HP \
     & Firmware-ib_qib \
     & Firmware-ibt_firmware \
     & Firmware-inside-secure \
@@ -3272,6 +3324,7 @@ LICENSE:${PN} = "\
     & Firmware-rt1320 \
     & Firmware-imx-sdma_firmware \
     & Firmware-s5p-mfc \
+    & Firmware-sensoray \
     & Firmware-siano \
     & Firmware-tehuti \
     & Firmware-ti-connectivity \
-- 
2.47.3


