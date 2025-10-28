Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2057CCF9EA
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 22:34:31 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.25552.1761690870621501425
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Oct 2025 15:34:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=nzky3wB1;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=XITZU614;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SJlPVj2554360
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 22:34:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=LnMFMS9x1BkYF9tziw3sLnjc69Mb10hvtQb
	E+a7euI0=; b=nzky3wB1YiOp77OjIfE01YlUxRmWr5dzklFA6UQLlS/2yarOBV+
	J0YDrGf36Bz602MDryVtVK5p1QJNRC9ily6D9PkXUgOWbuxmuqIcZfQZV4Rqb7QF
	WNZpsZx1PQiI1heO5P5sXjhfuep5bixebHrf4PS8GHKAYmWI/953JQgvoTVS0xLs
	PF8Nmy5A+toPkBltWsoxe3baHWMU0PVrI73W0wuwkSJ+P+x93Zw7ovHEBZlLSg+B
	acPKZzTipDAR2hlz9gFXxuIEdfAqX7qn3rP9MNTQLlHqQaifAMwSkk5VONDgPZBQ
	/O9+rs48nRND1Gz8kRzeMmfDiox/KWtHzLQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a10cmg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 22:34:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4eba10ad6e1so63471681cf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 15:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761690869; x=1762295669; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=LnMFMS9x1BkYF9tziw3sLnjc69Mb10hvtQbE+a7euI0=;
        b=XITZU614JvLvjA7LuHbDPKCBa18PD6tsKie0Zm3cfQApmU56bQLHNP36LaFJnV45iF
         RLU8C4/l84XKIZC6xCdZxN64ebdql6xzrLgzfVFQO0j896wM0IgXDUlCuDbr1Khgs6qI
         TOUcXoKEHYVFmCO6fMLf2AzzfhXwP4Vka8WFhYGJlV4Ojt5OX7tY09g+N9rBdNjp7png
         KaE4aw9znfO5ymOEJ+iU3YpshM2gwnpRx9gCFO0OTXTavkbRaJ7TYK3S4ZtDZ7wqUsP0
         k/V9nINERPfBZxiX7VmxNtWwgLSjG2JTUz50iB2BRP/1ZzLfGsYcVgxwOHrbHZEHk5Py
         MW1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761690869; x=1762295669;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LnMFMS9x1BkYF9tziw3sLnjc69Mb10hvtQbE+a7euI0=;
        b=riS58bJ9StiuC6YTjXRYMDK4wF6gVzKt3wPz6GMnCy+2TbdtjMYQMn6TV+wyqZTJLS
         D5BGPXiCnh2K2LuoIb6RLVHvBEwlKAMo4W/+uMlPrR/WefeKPAUvXYFlYYd6tz2DdhCL
         O31F+0f0ovu7M9m5AiYuArLV+dvAefGEBAt5+xhRo3FLjb945yVcYGEdoKv6dj3ZOfGQ
         5cWid/+vqZlb4q5kD6vePIqMtBYqgNATwERyvEpmkWX6BZDQwruIlEVmNUVfxwUrGY9m
         DCrafftPy6RQcZSQO9EftUV9jQregAu+M6EYx/2eOBl3Kg/ycQfz18i5TY/MX1wM23+j
         mTdw==
X-Gm-Message-State: AOJu0YxY4LuzthnLvk4O57o1V1zqosV71oxVgG3L5XwNvPBMEfo6VKKg
	twvAaXzYKXGgmj82DzOx8AyIhqW+XofW7yB6tlMWMuruIcIGArYnTh2qB70ZUN/pUIlg9fmeXZQ
	ACvMsUtXF0EWTvH1SpPNShlA4URsWey6X5cWdIM25RqwGVrt9wvl+Tcf1UHFPxwVu2KsANgahCq
	qhofonuvWcs1N8wMI=
X-Gm-Gg: ASbGncsFxrD/sZ2qt19rjdDMpWoOaFKwv+F2X94OSHKo5f+myvCH9rkuF8llQzMdhY1
	BS7t9IvlKUVcNmYEeDAkfO8LHXh5EN51NnU2WI9/ijx3AXv/Y2g0t+geKbh8SCwipq94xsKLWtI
	hMw1RslwXXUhOFQPox5csI8orKdufWSeZaN2nd4qkkHHiBCsQ7gjNHTy89uEOMSNzgSIbNygmWp
	brU+tucvoYVHX54XGYz3yRRWAnE/FcmZzms7BUrWl81qH1b6xtrgApf5oG3Z/7rKqbw0dFUCLMI
	lb59zY8DRuf/7Cm7dgW8TS50MrLeOAb2enLUCIoMoR9MVzlogP64ivhEw+HNiaWe4qdgO5pnuR5
	FsOkAhW0/271U4zLMtj01cFkGza3RLP4321WTJ8wdLiaWwr4Txlv4pqq4AVoIhpc9YjwbbWyDBi
	Jmcp1KXyOkvCnM
X-Received: by 2002:a05:622a:18a3:b0:4ec:f477:60e9 with SMTP id d75a77b69052e-4ed15c54466mr13399531cf.76.1761690868881;
        Tue, 28 Oct 2025 15:34:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKdG7KpxSTK9Qw8Ox270yBgUbsLPAKhExxFA03KqErHAS+HqzVVBCpn5yA/q9kjZRdpnwS/g==
X-Received: by 2002:a05:622a:18a3:b0:4ec:f477:60e9 with SMTP id d75a77b69052e-4ed15c54466mr13399151cf.76.1761690868318;
        Tue, 28 Oct 2025 15:34:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f50996sm3317371e87.36.2025.10.28.15.34.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 15:34:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-firmware: drop catch-all QCA package
Date: Wed, 29 Oct 2025 00:34:24 +0200
Message-ID: <20251028223424.588491-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE5MSBTYWx0ZWRfX6IYG5sGYpzQm
 FcvwowkcLdWIPCdkfJrnhCax7TSTTnShPnt3Rs5S5KexHjJvVu4IixQtI6lFBg3LS0QhqS8UF8K
 +Qss7SK33m6x2hs/FPEg3oR3JbVrN3A9PTCT5jO2onjGX2Byie1ub9AOeEq1pOlCl/QpIGhyUdQ
 NMcJ/crNZ4yCd3YIIlhkDqOqU1HQGMfKOeCceAAK5VFhAIFb+VhZDPePLxQIXIdTv3mZM+dFft6
 ekbBHnnMDwyrSBxB9H1crTmAktmcJKxjPckWJeaJzDDr8WRgJJvbcAa6fQ4ojoMDkhI1Z8P4k2c
 CxEiXD637DJew03WFH2gZzwBULY4OZoZ8nusctYG2vrnCK0gL622zaWXjsRUuuhfmslfqMzH4y7
 d2BH079if97rhNjHr/b+euvKtU4Log==
X-Proofpoint-ORIG-GUID: psBKfHJcMX1gUcRIZRV0FoNL-BC-sviZ
X-Authority-Analysis: v=2.4 cv=EKULElZC c=1 sm=1 tr=0 ts=690144f6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=GWV1ib9EiYGjjPFu8m4A:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: psBKfHJcMX1gUcRIZRV0FoNL-BC-sviZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510280191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 22:34:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225417

With the linux-firmware now being an empty package there is no need in
the catch-all ${PN}-qca-misc package since developers will have to
package all firmware separately. Drop useless packages now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../linux-firmware/linux-firmware_20251021.bb             | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20251021.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20251021.bb
index 70fd983b0c04..66d3be90e7f1 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20251021.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20251021.bb
@@ -643,7 +643,6 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-qca-wcn6750 \
              ${PN}-qca-qca2066 \
              ${PN}-qca-wcn7850 \
-             ${PN}-qca-misc \
              \
              ${PN}-imx-sdma-license ${PN}-imx-sdma-imx6q ${PN}-imx-sdma-imx7d \
              \
@@ -934,7 +933,6 @@ LICENSE:${PN}-qca-wcn399x = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-qca-wcn6750 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-qca-qca2066 = "Firmware-qualcommAthos_ath10k"
 LICENSE:${PN}-qca-wcn7850 = "Firmware-qcom"
-LICENSE:${PN}-qca-misc = "Firmware-qualcommAthos_ath10k & Firmware-qcom"
 
 FILES:${PN}-ar3k-license = "${nonarch_base_libdir}/firmware/LICENSE.QualcommAtheros_ar3k"
 FILES:${PN}-ar3k = " \
@@ -1061,12 +1059,7 @@ FILES:${PN}-qca-wcn7850 = " \
   ${nonarch_base_libdir}/firmware/qca/hmtnv20.b112* \
   ${nonarch_base_libdir}/firmware/qca/hmtnv20.bin* \
 "
-FILES:${PN}-qca-misc = "${nonarch_base_libdir}/firmware/qca/*"
-# -qca is a virtual package that depends upon all qca packages.
 ALLOW_EMPTY:${PN}-qca = "1"
-# -qca-misc is a catch all package that includes all the qca
-# firmwares that are not already included in other -qca- packages.
-ALLOW_EMPTY:${PN}-qca-misc = "1"
 
 RDEPENDS:${PN}-ar3k += "${PN}-ar3k-license ${PN}-atheros-license"
 RDEPENDS:${PN}-ath10k += "${PN}-ath10k-license"
@@ -1103,7 +1096,6 @@ RDEPENDS:${PN}-qca-wcn399x += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca-wcn6750 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca-qca2066 += "${PN}-ath10k-license"
 RDEPENDS:${PN}-qca-wcn7850 += "${PN}-qcom-license"
-RDEPENDS:${PN}-qca-misc += "${PN}-ath10k-license ${PN}-qcom-license"
 # For ralink
 LICENSE:${PN}-ralink = "Firmware-ralink-firmware"
 LICENSE:${PN}-ralink-license = "Firmware-ralink-firmware"
-- 
2.47.3


