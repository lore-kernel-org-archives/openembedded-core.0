Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78331CCF9E0
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 13:13:35 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.8998.1761138805609135590
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Oct 2025 06:13:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=dGElHlpw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MA3Dia024550
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 13:13:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=uoWK/IpwMazvr/3t0GJ3uRxrYvWqtI7AjCW
	N3gVfH/o=; b=dGElHlpw72crPkZMIas8soJa+IH39Cx7ycoqys63mnDdjLN7X63
	eFHzk9Ngdbz4SWD2LfjrX0G8SecdoPoxElrilRitGbNEfdFpI0HvQzTWX1c/XZGW
	p3HtFA+zDU9WnZdj6AMmJPExqJj2qZX2r4V9h6dJo8xCQT6BmDEZPBKhnY0Zi/IP
	P/dUoYw14VagxUZOjjWAtTKzJ/R91MmYgL/4vwe5XAlCbgiZZKURaEsPLHVCexgt
	CZkBvNQD8KBJSUrChtcIEYUgLPuQxRKgRPr2PJppJxjgm7GdIV9ooxcNi/b2IMEI
	FZ0rsDyFn2+AmAkgySayQDiJjHfoD455/mw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49wsws740v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 13:13:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e89265668fso30087041cf.3
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 06:13:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761138803; x=1761743603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uoWK/IpwMazvr/3t0GJ3uRxrYvWqtI7AjCWN3gVfH/o=;
        b=EHB0Cn5kOW2JoVUjl9QbFkRdH3X2RTJjZZ9UXn+izNTqzyf+A9hmUuULOmVvBn9mGv
         FM5RTdvqly+l0n5FJ+qbl9ESq/48WQKHRukcUH4uKnBopG/ALhDVGqrbJATVVhGtvc3r
         4PqJQK/jXm4tV1WFFOoFCCyByfN9+yodzAciKmr078iTRlx16xqkKDx/JQ7t6nhoEkeF
         zWrOsikuGzDei7mpxbGDK0xSlNFd/YNgXEVE0mhCzN6w+w2EFEMMjbqGRzkFN/NTH2pQ
         C4D1KOUReX1YlBNRb8oYzFZy0NGLgVN221cVYo+49Ph8FagVOZzRuxBcYPMDrYgioxGa
         9B0w==
X-Gm-Message-State: AOJu0YyEHwgqi95zpjtuxJcA1FdzncDk++L8wDxipNybTAtXf0NgtxoY
	NOwgfHKYj0t4DNgSE1f3bUGimLOcyuCtKcBKauoS01Sb3xEjV9ZaymfJB1XZ7HDjPJkYu8iFscD
	aH2V/8cGRCrfC0gOLtMtviSTZR6SUjgUT3X4M8MC5zdQ4cyta6r2mGF/cP8hfIWzYiY3mYcFXpf
	eKzDnfKse3aIUS3Ic=
X-Gm-Gg: ASbGnct7ttkmKRyAIivQwxhW57MXzYyytAaTkV/d2TUMocdp556TLuEucw7bWlSF5ZK
	RoW9xIfkdJtwP8xUisHJ2Bzmkp8JPyvec9d0Iv61ZKwqu4IQp+aVW3s2CdxAFJHgh1e9pEUmygT
	dl17Rmv3Nzv8t+wq+t1k26/o/r+0leGJZ8d4wZVX8hhW/8MmVlnCF5srJQZWZ9CwFY0G9eaOC9H
	eMvqOQztu/1BDIQkrpC+/sOF8lpaWCeu8pc1VaZq5gj6kLZgUe/6SCVgjAIjmdWXgGYzKkvBvru
	xxmYA2JYOtgv1b7EPX+XyRWn9Gp9QlWieR7Sufh2xcqqZv2a8EW57WgE2BIZm1AMuZQ75VL558u
	8oRJmQ7+1WGfeWTpXYKEfOxsNTvzwmm2L5vZS9UR6vwdlOaV8BzP0ww1fcDhkayXM5N6vKRl8jq
	NQQXLrD2VI/6A=
X-Received: by 2002:a05:622a:18a0:b0:4e2:ea31:1a with SMTP id d75a77b69052e-4e89d39ab6dmr237662231cf.68.1761138803136;
        Wed, 22 Oct 2025 06:13:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkSy2EEU1Ayuz4SNy/qjysH3cpiqrfPy0fmwvoKta0808HOa2tZeZlOkn8WYJ46yCFaamxBg==
X-Received: by 2002:a05:622a:18a0:b0:4e2:ea31:1a with SMTP id d75a77b69052e-4e89d39ab6dmr237661481cf.68.1761138802481;
        Wed, 22 Oct 2025 06:13:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-592eea72368sm730630e87.111.2025.10.22.06.13.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 06:13:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-firmware: upgrade 20251011 -> 20251021
Date: Wed, 22 Oct 2025 16:13:20 +0300
Message-ID: <20251022131320.596070-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDE0OCBTYWx0ZWRfX/b0BSxpwSSNA
 SVSIHhfiSZPvzERf4CCeQI2XlcsL4T/OnTLIO0ygKVfj6Y7C3Zos7bVpTJnchhxsO4/DGCn8SBA
 lzsPYUqWosTFZHhR4bomASLHfIfU1hOSQcoUB2YkjWcsdjXWMXTwGBjSxf1TBKCZ7VnISOk4W7w
 anfhEcps0NHFuyBamI8f/vkRqsXBTfFLO/jo6DrzZdp3rWTAWjy09jPJHUFyYwmP/QKFx7E4IKR
 jsFV2aUffwfyML5s1mcTLzhjVfgmq2Q9QgB7k2Qbh667+NjMz/HEOPMlD5uWBhgSuJywlAOSiNV
 dUO8JsyKIvpWWpd/YjgFXt+X7Fe7nYoDVU1GOzL0O+6NMmdZCFsfgKXsYEVc4MzKj2hdkKlUxEx
 8ZkTaKF5mVSDlVkVY8oon4gdLvoeaw==
X-Proofpoint-GUID: 7xgvErzbDt6frIsCfN-MLEY3O0EWY6EA
X-Proofpoint-ORIG-GUID: 7xgvErzbDt6frIsCfN-MLEY3O0EWY6EA
X-Authority-Analysis: v=2.4 cv=a+E9NESF c=1 sm=1 tr=0 ts=68f8d874 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=PAcHF1l5oVdxH6VbDgEA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510200148
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 13:13:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225192

Upgrade the firmware package, add new package for Intel Sensor Hub on
Pather Lake platforms.

License-Update: new and updated firmware

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...x-firmware_20251011.bb => linux-firmware_20251021.bb} | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20251011.bb => linux-firmware_20251021.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20251011.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20251021.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20251011.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20251021.bb
index ea8fac79be5c..66d3be90e7f1 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20251011.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20251021.bb
@@ -312,7 +312,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "585c66ed89dcbaacae7023deb32b6bd2"
+WHENCE_CHKSUM  = "aa7f40acde3418d9125fbb933ba2d9f9"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -449,7 +449,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "b6c9a9c112b88417d985b87d6521b677fa2fa0d5d7ee5219c76dc8ca66945ad3"
+SRC_URI[sha256sum] = "fa6130988ecd7968602938c77dd6f8d2dace4e03ba0da4c0e9624dfed657e6cf"
 
 inherit allarch
 
@@ -755,6 +755,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-dell-license ${PN}-ish-lnlm-39ceeaf8 \
              ${PN}-hp-license ${PN}-ish-lnlm-dba6b120-152c3222 \
              ${PN}-lenovo-license ${PN}-ish-lnlm-53c4ffad-2a17559f \
+             ${PN}-ish-ptl \
              ${PN}-advansys-license ${PN}-advansys \
              ${PN}-aeonsemi-license ${PN}-as21xxx \
              ${PN}-agere-license ${PN}-orinoco \
@@ -2617,6 +2618,10 @@ FILES:${PN}-ish-lnlm-53c4ffad-2a17559f = "\
 "
 RDEPENDS:${PN}-ish-lnlm-53c4ffad-2a17559f = "${PN}-lenovo-license"
 
+LICENSE:${PN}-ish-ptl = "Firmware-intel"
+FILES:${PN}-ish-ptl = "${nonarch_base_libdir}/firmware/intel/ish/ish_ptl.bin*"
+RDEPENDS:${PN}-ish-ptl = "${PN}-intel-license"
+
 # For advansys - AdvanSys SCSI
 LICENSE:${PN}-advansys-license = "Firmware-advansys"
 FILES:${PN}-advansys-license = "${nonarch_base_libdir}/firmware/LICENCE.advansys"
-- 
2.47.3


