Return-Path: <viswanath.kraleti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15EF2C9832F
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 08:59:52 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.53435.1790585983646126657
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 01:59:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=P+zzlxph;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=XCjZA4b9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: viswanath.kraleti@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S7xOwI1028472
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 08:59:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=///s0/PRHimVe3fymLAmf3xlKeEHfvdpDVZ
	hbKXYitQ=; b=P+zzlxph+cCPnOU27JxJiqqpanxKNyqxFZfjj3xhkRC5LZMDHcs
	hNjdXKOdVqZbb28IZByZZdaIax+Ko1BRZaSECDZD+E9EQfYrKXllzImR4hP8vM4S
	YZakGXNXuMf1zf0VS21Wq2KJse0FLwQu/hK2jngMtCm5XoyC9pHtky16zR2Joqic
	zKRFuLi1HPa9kMDdhJZ/aJYN+SWx/n3Gu8kAx6/pOz46TUWQMLMPbIvCjsLWTuU4
	ZVISeJpAap88QLtiWaXgTMbgs23QZhZnqmzP3JcYDFtOQ8mN3mzltBFw5mdDxBmz
	5+ZU9rOHArKIyN2938nBhbnX8QchymCuAbQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyjkxgmjv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 08:59:42 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2df7bc60df6so22452045ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 01:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790585981; x=1791190781; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=///s0/PRHimVe3fymLAmf3xlKeEHfvdpDVZhbKXYitQ=;
        b=XCjZA4b9Z3BAze/HxcnH/uHmXpCVWkRsnIV290H1gKJjWpyPgn0pvYj56XCc+hyt4d
         RlMzzLy06lepoB0be0o9Zh7VMjIeuwZOTNDcwXE4UT+FwCwLgzbCsrOpMIgUKmOoRhPZ
         HZUu0Vvd0qS+IpwdyyAE9afqvlM2ZXnROP7HyLW6BnMJki03AvhVSDLhaKKuOtNL2TOM
         4mbu7BTV0Sfr++dkA78o4R/XRGAA4eoGqQGWz39Omed2C9je4Sv0//q62aZ2ZU4xi/Tt
         o94s6DR4d5mv+XNsIe5gaEJJg0kQxjuMn/04/skKoLm4sByVn/lNT6jkrsX1V1gc0921
         m2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790585981; x=1791190781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=///s0/PRHimVe3fymLAmf3xlKeEHfvdpDVZhbKXYitQ=;
        b=Kp+tWiRb0kNGz4zELerQel9kwnr6E84qLSDgX0F5r4xUtEPimRBNp6wSLG+icGxZH+
         cesq8XP9f+H8d1OYDNuqWqCQTWnrvXPCZ/Dz02u9sCgqWQCIKnuEozbCXVjhuha3tWaH
         egT6MMaoYPAeWj8V6i9JmKq5AFhRLMw2mMMo9L62Q/i2TzhoetpADjmVAzPYpOGogtCr
         1ka9WpI7isnswfXvSJFRIPbeRmbdXDL6Pxmx3FHx20YsHkJLYlrXNAoZ35jJScwnXHMK
         QhqwNvlm2LiU4WMhhJE6t17rNUV9hUYwid3Lt5GvE/PSKOg6Oxndk3nDxfbmXOQ4UbDQ
         5+Sw==
X-Gm-Message-State: AFq9FYLo5qeDjiKMCpeA9PbHYE1kB0/SG2WoANI1N19LF46Uuept7uVL
	+6YFQdO3c+S8O96KViam+QDA+4o/kkmxoif4Pso9BO4shLImbH4OKLWx3A2I+Xxim7GXYdyZ4Il
	NJZgxQrjGVTET0TcKMSesCFmiOJdj0LKDVHEYVWxGFoU2Uw+HejbGAiLlMF7DBs5Qlzvv48d1xE
	7XWwasOPvAQGeE6hs=
X-Gm-Gg: AYBFou1KMLqPjccC5zmEnui00/mLlmLAMytBk9AfyyItH2/yoTts4c3WMY1GED3UR70
	1ai+x4LAmd1LHQZhnv8MqF7+lpDoffzyia4PlJwea6nlBHh0+VipQRjVf0ewWIEYTYTpL+wF0RB
	ALs67hm8HiBfj16Q4/jZazsJhzXaQmDNi12c2/ZDcbYapaNQqsZKSopnF7PPnAcDH4QihT61yi3
	TGikguadWn1NyN2o+Db9LJvwVBKBZcTOqR/MTd6DRDqR9mV9Vfk4qGKJBNXEr6i13t+0k0TtL4F
	/Vvw29JkKGf+OsMDcS5EFH8rI5EdMtjqmVW/qWOGb90Ls9/hnctedGISNAqd8pv3nhElX5eRIJx
	Fh4JXU2GToLFgEwhABGAd8rYyZ5fIkOxGT+PfUtLTDn9LI8z6UxSVJXPqUKdUmqfcfQXnbw==
X-Received: by 2002:a17:903:3205:b0:2dd:7a0d:e51d with SMTP id d9443c01a7336-2df7da856b7mr119215415ad.16.1790585981278;
        Mon, 28 Sep 2026 01:59:41 -0700 (PDT)
X-Received: by 2002:a17:903:3205:b0:2dd:7a0d:e51d with SMTP id d9443c01a7336-2df7da856b7mr119215275ad.16.1790585980742;
        Mon, 28 Sep 2026 01:59:40 -0700 (PDT)
Received: from hyd-e160-a52-10.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df91460aaasm38094925ad.73.2026.09.28.01.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 01:59:40 -0700 (PDT)
From: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Subject: [OE-core][PATCH] linux-firmware: package qcom-shikra-wifi firmware
Date: Mon, 28 Sep 2026 14:29:24 +0530
Message-ID: <20260928085924.3023725-1-viswanath.kraleti@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: zB6V-cNB74o3Gxi50ETqIzUu-wLrVPpr
X-Proofpoint-ORIG-GUID: zB6V-cNB74o3Gxi50ETqIzUu-wLrVPpr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzNSBTYWx0ZWRfX0P0l+DImygWo
 ZOpP52YCodzFHfiYZ1s7d0BfIV6tIQsoOMReq4wwMaVN5vj1EdlvLcQ/3kXpSge5aA/yCu0Xvxn
 As8Lu9pRRen/jQd+OYplAHYGYhpV23w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzNSBTYWx0ZWRfXz3fjZZT1SH7s
 Nur712CLpOqYVlUn37wOjWEJZF7XObp6OPPO70u/PWWdAhTp+ehQQCJ9yqWPC2AAYZCGQsLi8Z6
 jiENLalm9VhezxIJLn2xBr7hJPnmOzgkSSVdsM5HTp2KqU7kX+UGfN+g2ht6M2iyssZXyrEW4d2
 HBJf6MqyZrzS0ZYVDMsDjeGH4uH1TAJHybn7cP5YDiaY1pDQTR+PQWGMpAJ0bNxThGvkQYl7aMf
 dDaUoDw8uaSTGnQ0by3b+n3VU6I0xGtZp8WZoz+z6bPoQ2CEhqR29AeTIaExaqsIA6WFV+ujy6W
 2SBtudydLJ3oqiRafUGwYuw973MO4jZw6gnMl8SCTtuiAzOfZCG8xa1T1I7qfwnwkpHkI/ToNVZ
 KqZkyh83iWwo8i8EqJbG0tz2EuOjuU4hVU4PulP2UU64tpaRwFEHVEvSEM/rkZBmEMNvA11Q7Co
 Ndx/QlWjwpbfClS+Gow==
X-Authority-Analysis: v=2.4 cv=QZfzLcbv c=1 sm=1 tr=0 ts=6aba2c7e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=yXXZC928Ah5a3DY_KloA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 suspectscore=0 clxscore=1011 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280035
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 08:59:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246743

Split the Shikra-specific ath10k WCN3990 hw1.0 WiFi firmware out
of the generic linux-firmware-ath10k-wcn3990 package into its own
linux-firmware-qcom-shikra-wifi package, matching the existing
per-board split already done for QCM2290/QRB4210.

Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20260916.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20260916.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20260916.bb
index 44901c229a..2166f93ca3 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20260916.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20260916.bb
@@ -584,6 +584,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-atheros-license ${PN}-ar5523 ${PN}-ar9170 ${PN}-ath6k ${PN}-ath9k ${PN}-ath3k \
              ${PN}-carl9170 \
              ${PN}-qcom-qcm2290-wifi ${PN}-qcom-qrb4210-wifi ${PN}-qcom-sdm845-modem \
+             ${PN}-qcom-shikra-wifi \
              ${PN}-ar3k-license ${PN}-ar3k \
              ${PN}-ath10k-license ${PN}-ath10k \
              ${PN}-ath10k-qca4019 \
@@ -2474,6 +2475,7 @@ LICENSE:${PN}-qcom-shikra-compute = "LicenseRef-Firmware-qcom-2"
 LICENSE:${PN}-qcom-shikra-audio = "LicenseRef-Firmware-qcom-2"
 LICENSE:${PN}-qcom-shikra-modem = "LicenseRef-Firmware-qcom-2"
 LICENSE:${PN}-qcom-shikra-qupv3fw = "LicenseRef-Firmware-qcom"
+LICENSE:${PN}-qcom-shikra-wifi = "LicenseRef-Firmware-qualcommAthos-ath10k"
 LICENSE:${PN}-qcom-sm8150-adreno = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-sm8250-adreno = "LicenseRef-Firmware-qcom"
 LICENSE:${PN}-qcom-sm8250-audio = "LicenseRef-Firmware-qcom"
@@ -2654,6 +2656,7 @@ FILES:${PN}-qcom-shikra-compute = "${firmwaredir}/qcom/shikra/cdsp*.*"
 FILES:${PN}-qcom-shikra-audio = "${nonarch_base_libdir}/firmware/qcom/shikra/lpaicp*.*"
 FILES:${PN}-qcom-shikra-modem = "${nonarch_base_libdir}/firmware/qcom/shikra/cqs/qdsp6sw.mbn*"
 FILES:${PN}-qcom-shikra-qupv3fw = "${firmwaredir}/qcom/shikra/qupv3fw.elf*"
+FILES:${PN}-qcom-shikra-wifi = "${firmwaredir}/qcom/shikra/wlanmdsp.mbn* ${firmwaredir}/ath10k/WCN3990/hw1.0/shikra/*"
 FILES:${PN}-qcom-sm8150-adreno = "${firmwaredir}/qcom/sm8150/a640*.*"
 FILES:${PN}-qcom-sm8250-adreno = "${firmwaredir}/qcom/sm8250/a650*.*"
 FILES:${PN}-qcom-sm8250-audio = "${firmwaredir}/qcom/sm8250/adsp*.*"
@@ -2835,6 +2838,7 @@ RDEPENDS:${PN}-qcom-shikra-compute = "${PN}-qcom-2-license"
 RDEPENDS:${PN}-qcom-shikra-audio = "${PN}-qcom-2-license"
 RDEPENDS:${PN}-qcom-shikra-modem = "${PN}-qcom-2-license"
 RDEPENDS:${PN}-qcom-shikra-qupv3fw = "${PN}-qcom-license"
+RDEPENDS:${PN}-qcom-shikra-wifi = "${PN}-ath10k-license"
 RDEPENDS:${PN}-qcom-sm8150-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8250-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-sm8250-audio = "${PN}-qcom-license"

