Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E1A2C36017
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 15:18:41 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.11438.1743607116417322245
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 08:18:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=eoWb+rVu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532AtSO4023292
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Apr 2025 15:18:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lsu9CYuzgNcf1mzGOXPVNDoxsmAY5YjYnKxsk6fwwkw=; b=eoWb+rVu28Nu0cJ9
	bRI/Zq+BvgYhLZlDRP0ElFBF/fY9q/H98FjXJ3QVt+2d73OnsvGTSfohXaydcpI2
	xxWBOsoecgrldZSTscDbp1/CtOVuaPdH42LDiehiR3/QpK5X4ZGD+HMO4X1JX3dB
	yahgOYNCRFpLJmrqrzV9P2WVv0ee5btvx1zJkihGJyrUdloIw4+6VwiUHMZp/x/X
	AsTAYMbncyeMtM0GfQlmkE9fbsiik1MYxbXnlNkkXl9CJnc/x448LxsXpf+6IbgP
	N+Q1MwQJY5MEB8aR+3V1/rmiuALW27RVKaU4JIuwJwSZCKLTknlDXkaIps7rfnd+
	+orH6Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ruadt6gk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 15:18:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5f7210995so171965385a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 08:18:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743607114; x=1744211914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lsu9CYuzgNcf1mzGOXPVNDoxsmAY5YjYnKxsk6fwwkw=;
        b=odezFKyNSgCIVxF+bHC1MyXHB55hnBocpb1aExgBxux9eb0eDUGSCfY7apXPRSPEVX
         DQ7CdOzLfhuF9tkOD6GD3QMPD4SpYFzcHlOjXyGHWO/KUtNx7BSXw4VtDMw0I84i0Bc2
         ZuwkV3aq4k6WDBSQfX+uN3HoXii/V+mU8r94KZHa2LXeWNEba4+5xsyrkFWNCTSOIXJQ
         9jeZyCFXHzAwXzlZqbsDtVOriwEoOYntf8yDQAVqAzbVgi4auovCixSXGNqgkYoTcSX9
         9o10XUoTQshOFRU1jDYod+MQfKHvsh+B8rWF2W+UzLCAUWW6FhLxwHQXOXWXcWVUB5IB
         POzg==
X-Gm-Message-State: AOJu0YyjOiuKuBkWkY44EkDplhUvkEvoK6+Qtrx39typRhlrV9O/qG7D
	ECisUZLABzxhSEJDdLt+To08AaUursRE1T2NhofljYTsW/Ltt02j4nKphOwRys8PfLKYraA9Js+
	EDRbW9xe1LSwudesV091ZSv0nitcxB4cQQADZsiUC2DaC06MC6J9DT2spivwPZgq2sev7mO7Hm2
	ui4kc=
X-Gm-Gg: ASbGncs0LgbF2H5GP2UJCsdVuHS+Hgbc6Kuq9WiuC+4/744q2Z67xem8563oJnYUjlN
	bi0HdBRln7vhyO0g7UWpf1pXNiwp2TceS7LM9iz8LPhidUGhv1cw7f1XG2USk5vPviL+hdueUp6
	LohNruIPbCODPzqHwB3RQEzOxP5gOn4Nzbjh2amHzuTiWb6Dy4q1BbVXqGz5O53IgEW+t80kFUH
	ci+xoxEiAlxYEaZj3o+xEyC99meqvW+GOkNLSpiqhkdFNKQKnFm+7jeIwLA2xWHFKNsJ3PhE+2n
	5YqZ2QlP/MAzt/5aDsVnJtvxt0ehgrfrcTMlGWN352IFAMWiSZb499sjrN9QDBxOrxtPh3wc7Jn
	Ihrpec0kblbCc2bvGhvO7ukAVj+Gr
X-Received: by 2002:a05:620a:29d1:b0:7b6:d7be:2e4 with SMTP id af79cd13be357-7c7682d114cmr293237985a.26.1743607114645;
        Wed, 02 Apr 2025 08:18:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH00bjtI8uw/429ne3afvlV75GacqQjWBQkvd+B2vgcypgU1bzhFMSLMp3NnkJPiyNCGBDHkQ==
X-Received: by 2002:a05:620a:29d1:b0:7b6:d7be:2e4 with SMTP id af79cd13be357-7c7682d114cmr293234485a.26.1743607114321;
        Wed, 02 Apr 2025 08:18:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30dd35925d7sm19946371fa.91.2025.04.02.08.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 08:18:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 02 Apr 2025 18:18:26 +0300
Subject: [PATCH v5 04/11] llvm: handle libdir in llvm-config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-mesa-25-v5-4-ab35f021a83b@oss.qualcomm.com>
References: <20250402-mesa-25-v5-0-ab35f021a83b@oss.qualcomm.com>
In-Reply-To: <20250402-mesa-25-v5-0-ab35f021a83b@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=905;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=IuzzLH49YcN+VIIkSFokCKJ3AWdCIlrAtboeqw5vZ2E=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn7VVAUxMCxVCKHcp16zgrpSAciaQtPAatm4uPj
 /ymC8SsDCuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ+1VQAAKCRCLPIo+Aiko
 1QRrB/9C6Nr9we2fzcK6RGshh1oG1BkhHaMP9q6bNOUj3fXQwcQxiP8v+jNPkqdsTQHmWN+D5M2
 +QomsrlkqIJrYMbCKfjRmbe9kWpH/9k6fifWaGmksOwFMr7VWd2AXpYF/An4Vbk766XqiIgd7Xa
 WdkeVRTQyQVhU2i+bKgzb9D7WzZfN6ojef7qKUoAbvDmJxDc/dLfHoVvmD1f2vrWCEbcXkdRFVb
 zB9C4NJFWRStsa0HEExF9SjmyP8Sj1agkFCw9AGDjW/qotq7CJaPDapUL0TQ1sUqW3IuRQS2yMo
 fPZl9Niti3vOU8yl6dABjTBgyWCbDxUEBNgEI7vLwnSlN9FN
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=VI/dn8PX c=1 sm=1 tr=0 ts=67ed554b cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=DFIL5-tCekSmT_aHp3cA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: jGPsyhaxhPzZdvoDusIbtLH47k_3IXZy
X-Proofpoint-GUID: jGPsyhaxhPzZdvoDusIbtLH47k_3IXZy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_06,2025-04-02_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 adultscore=0 suspectscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=717 malwarescore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020097
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 15:18:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214272

The llvm-config wrapper also needs to override a --libdir switch,
otherwise software (like mesa) end up using TMPDIR-based directory for
Clang resource lookup (and also encoding TMPDIR into the target binary).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-devtools/llvm/llvm/llvm-config | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/llvm/llvm/llvm-config b/meta/recipes-devtools/llvm/llvm/llvm-config
index 5e4ded2da5bc95d429c6f717a2f25223bbbe210e..6cf3e7578fa96f2893f73077bece4db45f29547c 100644
--- a/meta/recipes-devtools/llvm/llvm/llvm-config
+++ b/meta/recipes-devtools/llvm/llvm/llvm-config
@@ -35,6 +35,9 @@ for arg in "$@"; do
     --libs)
       output="${output} -lLLVM"
       ;;
+    --libdir)
+      output="${output} ${libdir}"
+      ;;
     --link-shared)
       break
       ;;

-- 
2.39.5


