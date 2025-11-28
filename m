Return-Path: <miaoqing.pan@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2260FD111A8
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 01:37:16 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7075.1764293834879228684
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Nov 2025 17:37:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=pX/caz3Q;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=iFZ2djsG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: miaoqing.pan@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARMhp552324487
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 01:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2/xU8CVfWDcqk+c3NKxsLI8S37YCZyr1WdY
	+Qki26Ts=; b=pX/caz3Q/rUAvVHtAdntbUwiYjTizo88uzKRgm2VoL9XaIi8HBb
	lpUMDKY/U0eNqiyaJmkAklhcBYyVXesapBfrLRaW5MeE3RcsuZfojLkJENfWIndE
	INz5jVJh/Otz026JPdvtWqNFzZX7cX3jNo2LiW/Q9AEIeyYGpwR+XbvkzKlgZ47r
	B1qeX7jvSdTQu7ivqMLytpfzdXP56qjJ0u0V5eE6pHgJpgTWQyDW2lDvlx1Z/BGp
	OFHx8K2d8SiUURb2AhGdPdIrzO0KngwZ46CAL+4PSYczmrLXMq6ye2Ni71ORfl8C
	9O5RaDw6eZPluuYd5peMH4+xwF5euZSa/fA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apm2rsv4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 01:37:14 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3418ad76023so2149106a91.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 17:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764293834; x=1764898634; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2/xU8CVfWDcqk+c3NKxsLI8S37YCZyr1WdY+Qki26Ts=;
        b=iFZ2djsGG+CT2D4REmxO/vBDgXEb33Oi9rZeJaCcX5uJzzLHD57QYfMnJl8u82zugc
         +uFG5VsjvIekwzHBycxoIY7COCSAJvBm5Wodv9h/A9uvCNMdcwnZ6SCeYLTN+elQMYe/
         jEdL/4WO4jIpEBvNb83kurFeZ/nMUni9nfQ47w8/iqMLvUJkUk5319E1vZv84XwgEg+J
         Z1TqHpU21+N8kiXCU7xPrcuZ/COUL/bkWb8YFMZVKVpKwAITyamNqzeDA6U5a+/HTIMC
         oO0AR8344K+eF/mWIFflrWYA1GArDHnpyrowH9S2DwXb+NGKq2bFD9dOJ0RA78Iflgvc
         Z/6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764293834; x=1764898634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/xU8CVfWDcqk+c3NKxsLI8S37YCZyr1WdY+Qki26Ts=;
        b=OyPyJCQ5aAkuZh8xtSFbykjbVjiKNSITxiWuVbkklNgQm9i7J2E/q6ZfCqA1y5lS96
         JVWaOi/iMzH8DRdHrgo2BY51n/JiGm1KIP3HBx89orJklwHD2diHjFHl44EkzIokBDjk
         CRkRofi25SjQEjvpCV5UtOS5N/v1nIwN5YQq1OYV6fg5f4hyDsYlmkA3sNI92oJCwSlh
         LeI0Ctk4CIVAC4xVqa7IjRFhDBwVbJZh+WpBw0cOGND6f3qT2SVnQhziqnPP0bYWyD8n
         EM5wbnTzl3mI9sOKvLeNQwE5Tqj+/DI3HlMvKMvbs3rTtfMQAHQ+dD0z3nz4ARH2k1RC
         xhpQ==
X-Gm-Message-State: AOJu0Yx0+lXcb2P06qKfiT9nRrzGnWeEsqWgsmcs9MUpeRdXCuSgcbej
	uJM8aBTKtwDVWVyaAMomDcfuuqwsxFUp+vhAv+x9ZcV1QPcTwvG5t7N4MoyEHRXQ3PCjYgTROvE
	PdXPnjDEBLzpYGtZYiL8vqtdkpNGtZGTozgXknc7B8ncc05vjDxrgeVYMZZrNHqDA/7FuItnr18
	R7zPdTztQajxORsDhTEA==
X-Gm-Gg: ASbGncsxDgaGEzmNR5btUbt7oHm2wrTaFc2AGEgobF5Jk9gORTWMuNYVSnqy7rtxiSx
	RoVHMcJ/mI5d3Y51F5dBDfcZLSKzzS2E1xl8iYYrQyEp9Pb3QAM7EaQYEl31rs+DzOyCURDnjsP
	X98PFYiMwMCeQj/lbYdaMaQgWrv3lQAPPrK+YN9h6jva5OLoREmw3nr5RtZG2F9VNZfdVbjGTl5
	KpIeYGausp564UTfOUfrr6Fe9UQ29mHNt8Uu94bUK4wuHgwrM4OUOBj6JZ+gG6Ei/X2VeTVOXC9
	zQSCykvYqnhFdgIer1RPQuQU0vjt9Pc+9D6Ui/uyo0ta5xR9VOdDOxZiLWO3CbU6Ze4SN0ihT2d
	U6mp6GnJRcA7gYGHvTAxRgQrQzV1rvAkSSxjmNpAX5yY9EDdhU2TDs8fI/fXrls87Wdcy
X-Received: by 2002:a17:90b:5450:b0:330:82b1:ef76 with SMTP id 98e67ed59e1d1-34733f350cdmr25475051a91.28.1764293833594;
        Thu, 27 Nov 2025 17:37:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0teE8kU2tVnZA1PUvA6gGtMuwm1B4TCtBZZ9blBrCSgPuoeAUSWHfVnpCw4Uxoyl8GyWeSw==
X-Received: by 2002:a17:90b:5450:b0:330:82b1:ef76 with SMTP id 98e67ed59e1d1-34733f350cdmr25475027a91.28.1764293833103;
        Thu, 27 Nov 2025 17:37:13 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3477b732e5dsm2943858a91.10.2025.11.27.17.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 17:36:52 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: dmitry.baryshkov@oss.qualcomm.com,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH v3 0/4] wpa_supplicant: restore defconfig and enable new features
Date: Fri, 28 Nov 2025 09:36:24 +0800
Message-Id: <20251128013628.2187455-1-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDAxMCBTYWx0ZWRfX2kV1eNhyqslQ
 XF60L4RO/45+rk3WAJKgiIzDVy/tPvoeyXO5WonVGbdj1CotvzQWM4m1iKz4+vV8mXqhdffXNYd
 KaLQnKTt/APfgogsXQ3kDBRX4BqD6w3c2c/A+KYQyl2Lwm6feTIlvXEDiIyWPutedFLVWrBdGWO
 Tnjq5tqsBgricbxggKv2ZhrZP/uZgBVkVbMV51fVtChjISarYn1hXCZX0FZHJ5mWEF2wxyz3YUe
 Dtx/m53pG9ostlLFVS/Sd0jnPbPwjxVd/wJ4D3hyhsTsUIVFFpttQNZ+KwzKPNdkRDuCxt3WY+O
 di50jhLhI8/s0xxhFagERTxwYcyS25Ixch870og0v2OijpCsE8JK4OZfNwTr+BdZW/mXqX3khiP
 X/FFBNolbrqfOvpp0Zay7mddiJvFog==
X-Proofpoint-ORIG-GUID: sdxjiLhwmaznI9lAgpd_JCIrjPJsShGt
X-Authority-Analysis: v=2.4 cv=W941lBWk c=1 sm=1 tr=0 ts=6928fcca cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8g_0GoQgwrnzZeHJV4AA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: sdxjiLhwmaznI9lAgpd_JCIrjPJsShGt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511280010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 01:37:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226873

This series includes:

1. Restore use of packaged defconfig.
2. Fix sed indentation in build scripts.
3. Enable 802.11be (Wi-Fi 7) support.
4. Enable OWE (Opportunistic Wireless Encryption) support.

--
v2: updated commit messages.
v3: remove outdated comments in defconfig.
--
Miaoqing Pan (4):
  wpa-supplicant: restore use of packaged defconfig
  wpa-supplicant: fix sed indentation
  wpa-supplicant: enable 802.11be support
  wpa-supplicant: enable OWE support

 .../wpa-supplicant/wpa-supplicant/defconfig   | 684 ++++++++++++++++++
 .../wpa-supplicant/wpa-supplicant_2.11.bb     |  12 +-
 2 files changed, 692 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig


base-commit: f0f7632595792a73ea0a935b924e8bdf9954ec7b
-- 
2.34.1


