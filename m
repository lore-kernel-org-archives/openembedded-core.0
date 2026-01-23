Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EEBBD6CFA7
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 16:33:19 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.376.1769185990682162150
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jan 2026 08:33:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=AYGMrw1n;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Ip0uS2t1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N93KS23648936
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 16:33:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=fp+yPtC3GE06nESkLDvmDnvqiAhkvdHd9sr
	RvpC9HBQ=; b=AYGMrw1n6IRKZxWRViAav0/aa1svbvmNvwuaz+Py7bN7hYyR9R2
	5zJ1oqz5jFtGSqJ2gsBhuyARDk6VZ9IfNCU7LlB1Brc+4RvSrzOjMPXSQU4FaxXs
	NYp9Uet7yMX6lbh2IyrTxg9aILQeHckKv6yh425czyhqUaCMOwxx5etrAZV6Nu+O
	TCYcoQNgbhKhQHisXkuY9CUs0b4SF/PW1Z6TA6Msv/osT+j0pWweR5tG+0IpC3bg
	AUKlOaSkh/eBrIQlEMEcnHL/FrX3SEXdqmQ0+52BMTED5JDyCHtHnJVUfTs6SFRk
	6fXSQYDlWXxpY2AmIRTpsztlFQ4fGg78+Qg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buy4nu1eb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 16:33:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6a7fb4421so568898185a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 08:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769185989; x=1769790789; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fp+yPtC3GE06nESkLDvmDnvqiAhkvdHd9srRvpC9HBQ=;
        b=Ip0uS2t1c8xd2ki8yQ0qQl4F/J+9lL7b+zdV454QOI9DebLKZfNk0vShsQ7Uo0iRfZ
         IZkCuYrE2tDZcH7MNf/6KK2p4jVP6HWecqdAJbl/a0UGRN2F3FzNzn5EmRz4/DBeCkmS
         mHE540WfMVfxZTQOzTiJoROc2AFSf5rytUnFePAMrCT5UOlaQiPjvd+hKfeL5cB/AQ03
         R8NLGBikITOe/sHsLWh6JU3gPlsD3QvMxyZ5BgbJA2VQP61W2WmjRBjvswp81UTBn82I
         HCjrFkAB9f4EoJ95v+t2KPOyrWW24OKcsYE0JwV5Ou2o3DdgXNCgnPVJaRi+IKEndmCB
         BeDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769185989; x=1769790789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fp+yPtC3GE06nESkLDvmDnvqiAhkvdHd9srRvpC9HBQ=;
        b=ZMj9jqeLK1kz7oWh5J1SNaQbZvl+yD9ruLMN1ABDrYCSdwPGDtEsldaT0m+lvSQxwl
         55mQc6/S98dNGM/4nM7YMfIYRDcUxkqX4meGJXXb/yDlKyflhJnKrOWSXyX997VK+4j0
         Zoj8ZGIefAz4Fgzik531DRL1QwoSmavPcnLZzddGfpJouQMqJwlSjJOswxkrG+QS15g3
         vETnfVT7BJL6ncOp0Pkf3/I22liO8DLTJ56ORn645Z03jnAg1hrWdmcM5DwxgqPTxnzG
         V75fgjTiIbuJiNRYZv8JUzV9tSxDpsIjPMfeRpkXFrFUvt5U0dNl4eMNjVF0RIEFaKIt
         +WBg==
X-Gm-Message-State: AOJu0Yzx/72dCNHseJhpOpRcZyIR4i8s2SC7Qb8U4aYwKLW+Bg7iekzy
	P1lNj1Bk/zuaGuxj2gg80uOIvNfzUAj65XPsoSXYXRyYIb29scrs7e2EZTrysz6ub68T/H/N8jC
	9ZxU3pqadGd9DUMyzDGS2ZoBKtv9eMwnOnx/OddovbWraPYZaRZD42bd+G++EuLRVsBzCeqTP2M
	rmTg4D38VZhMXWLUs=
X-Gm-Gg: AZuq6aJbixtHsqHn5Uyt46HxWzcyt/0K9ydsgoMjcFVDmq/63ohh3HkjW0NhVVdqHmf
	cVBBJgajzF4XWHiN4Y+Qf0IgzI26yXRTKmOcH7pWFov3gKd66H4c27DRiM73mpL93hT3x5pX+5p
	RrD12mElCNaCD8IUJK6f6Y90WH+ETGyvB/f9F67JQBqKRuoVnutsqr+WHP97+Y7aeml/70kWmJX
	Ziq5FPeDESaCumK/hSD1fGsQ9xVEqzH3htUr5YC++axixY5gnA6hL2PFGVbbyDgLev5BjRecZs4
	PZyXV4AaWlIrI3D3Eb/3kQ6UMwb4jtw6DLVUwHpng4JmR7L+eGybboWEx1acOCMMZgR04xhPA+c
	gIHOQWkoLbA5gd7YNpqtexx+wBYG+mASguLSA2/qBhday3NlGN7qO1eMm4YAkuS4FdxbD5/3VtZ
	Ez9U1JgfnpGZWaE7/RLTugSPY=
X-Received: by 2002:a05:620a:178d:b0:8b2:f371:5601 with SMTP id af79cd13be357-8c6e2e32851mr428904385a.50.1769185988684;
        Fri, 23 Jan 2026 08:33:08 -0800 (PST)
X-Received: by 2002:a05:620a:178d:b0:8b2:f371:5601 with SMTP id af79cd13be357-8c6e2e32851mr428899585a.50.1769185988080;
        Fri, 23 Jan 2026 08:33:08 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385d9fec3a8sm6775731fa.14.2026.01.23.08.33.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 08:33:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-firmware: correct wil6210 dependency
Date: Fri, 23 Jan 2026 18:33:05 +0200
Message-ID: <20260123163305.880111-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: PYlWrKmIJ_2jBwxZWh6qthu8eSsKR3zx
X-Authority-Analysis: v=2.4 cv=I5lohdgg c=1 sm=1 tr=0 ts=6973a2c5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=JB0bkCRFZFWnAw_0AxsA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: PYlWrKmIJ_2jBwxZWh6qthu8eSsKR3zx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDEyNCBTYWx0ZWRfXwVLFt83AWIbW
 2nLJJyE09ovEsMERjQZMbi+ncUFWTnK2WAS90/Nf1PuKTapVw/OWvXryAV8osKmmcOuVG5n/thS
 NUA0gfyCMRqUWIsZfQKvIa+3Ax9v4vgAVRTnJYx1EHypvXkVOMhAnl4AzXgKgA9gKwypRjK1Rhx
 GeQ7IANJ4L1vHetM6NRe6jdOKu3h236C3ID1hWvuTahx1rB4L3xxkMN5pFNoYtwCtOFDevu3LUt
 //kKpEhqGmrZGvcHTq8tCOym4FhKHTr67MNwH3akPUwTsgkyEMIXA7aV7gueANEDtcjgbufjrpp
 OScnja8CMIbozBBSvoyXKbZyP0UaCfGVdkDwpBjk8Umt5PASM45192s4Vd6h2YlYAOw2+nrFBue
 iJNqTcljI7nBwwuNP/3nIOvf6UE6tNaQvipcMBxcBtAj+nEZqMm7M1LfwwRyiFVVgz1o6sXl3i2
 KGT8PX18utvm1m+QUQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230124
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 16:33:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229899

The LICENSE.QualcommAtheros_ath10k is already packages as
linux-firmware-ath10k-license package, making OE skip
linux-firmware-qualcommatheros-ath10k-license (because it's now empty)
and thus making linux-firmware-wil6210 uninstallable.

Drop the duplicate licence package and use linux-firmware-ath10k-license
instead.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../linux-firmware/linux-firmware_20260110.bb               | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20260110.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20260110.bb
index 4324062726fc..fcf15c11f553 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20260110.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20260110.bb
@@ -3317,13 +3317,9 @@ RDEPENDS:${PN}-vxge = "${PN}-vxge-license"
 LICENSE:${PN}-whiteheat = "GPL-2.0-only"
 FILES:${PN}-whiteheat = "${nonarch_base_libdir}/firmware/whiteheat*"
 
-# For wil6210 - Qualcomm Atheros support for 11ad family of chips
-LICENSE:${PN}-qualcommatheros-ath10k-license = "Firmware-qualcommAthos_ath10k"
-FILES:${PN}-qualcommatheros-ath10k-license = "${nonarch_base_libdir}/firmware/LICENSE.QualcommAtheros_ath10k"
-
 LICENSE:${PN}-wil6210 = "Firmware-qualcommAthos_ath10k"
 FILES:${PN}-wil6210 = "${nonarch_base_libdir}/firmware/wil6210*"
-RDEPENDS:${PN}-wil6210 = "${PN}-qualcommatheros-ath10k-license"
+RDEPENDS:${PN}-wil6210 = "${PN}-ath10k-license"
 
 # For xe - Intel Graphics driver
 LICENSE:${PN}-xe-license = "Firmware-xe"
-- 
2.47.3


