Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F460C369A2
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 02:55:07 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.25731.1744253698752381424
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Apr 2025 19:54:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Sb1L9xtA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HJ2fo015749
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 02:54:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lsu9CYuzgNcf1mzGOXPVNDoxsmAY5YjYnKxsk6fwwkw=; b=Sb1L9xtA5WcCT+00
	dlhu5YS5X9DgRILjs0UMRg8M/LS+eIBNBJZCwdHKkUML/1KR9o8DvphCa5zjkGcu
	1SJahZulduK9ZvB5a7iBNw72rs+Kon8ZsTtjNZ+2yAhcc02Ovuov2+o/mG3StI0c
	Lbuk/znTQT/tm1UF5LUlenf4ywsGpeeocBYakZPS6S3A/9Is+tf6HR/HTPvSSdZ/
	4I3tzRlsDwWoS4B1nAqXGqG3PIFN9skjANNl3wzdFQ/cR6s2x3yY5NXrHxSMZfgp
	6EVJJ+XMAvmC7PU9ZKcWvEDujBGsgYnP1JKTt/L6bhEvYCWjfqj+eCsAH8cdNIia
	wsKHqw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd2wc41-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 02:54:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c579d37eeeso67979885a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 19:54:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744253697; x=1744858497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lsu9CYuzgNcf1mzGOXPVNDoxsmAY5YjYnKxsk6fwwkw=;
        b=A5bqJQCKDTjyK6UwOOHhTl8DflO6mirv3C2/ceCdlNp9lsBXH5IvuhpjWVVTN9Exn9
         M7v0YgvI1D6z9kgMw/kWw2GbUPT9/XDbyvh2SyRbjbz8Z+UknM54fZxGkDMEoFVrmdKm
         k+A7J9mPsJeQWgLt1gLucD9VKmtoqa6lQW/qzVdrNWQhKDaN/qbNgaM6ykDImVY74Mih
         3TjVTXTXvPo8epXX1tASGG3fHV6y2mTawzYynGnSLBllW6wqp+uv/avfZ+4dhtmvwx20
         AI5dujHtShFjcvyyvcV+yodK5Ny68zXYCwKCcs0Asmh8YFOCqXbqi6YQE0zgXjTUxmOh
         fXsw==
X-Gm-Message-State: AOJu0YzS+QYRvLIH/GKz57ZcZCg5PY+quSW+PHy1/kFJpmRjLXE+TY8q
	7Eoort+LT066WsGeA5AXJL0xdwe1WJgFF+dEN4MeDTosMlQAMtBJRj/fbSmFJGUWdsl1wSuOFAQ
	EuLj8exgHWXWq8cDtwngw1VKHDceuI8Km4wgTBegt7tWVlYRmSDKsB/YcOo67+OHIhpZFLrGqtd
	0dhXoNFSTDspA=
X-Gm-Gg: ASbGncsAdxJRcoqBhkErxhhWGqMyIdi+e10bX6hr7m/LhXea6FdBLJmx5wTu6Z4Ak7J
	qHwl6Hyju9S+NVGdu+vFexrxCDK9zFpxveLzAlWwBLR4xCh0+rj16xLlgLUxDM3sAZp9vWvqiGx
	2ZXme3mYSAkeKquX/qVEgA+cZ0w8Byq1gl32fl7rkpBdTQpRtL93v7YTb6c8CCGA1A4GHpDD7dB
	x+0Xrv5hV4ubDtXAYXKtZchHWDeUMO9j2+oe7tm2WPXf14wzPfQzuiASJsfZ26eKL72O+fXDkLj
	NacxswFpQ9/9iD1/gSIKThuG9fg+AFlYjqi52hiRemoaRX/s3+X3Evbhi9NF0gcOY3tp7/cXk9Y
	rWKBebWq4roUG3KPSOiFqvOm5
X-Received: by 2002:a05:620a:192a:b0:7c5:6a2a:d0d0 with SMTP id af79cd13be357-7c7a7659f89mr169489785a.5.1744253696819;
        Wed, 09 Apr 2025 19:54:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrVvCZIHwuDZ2/8L0fHk0cGDEy3BTJ7ZnP0Z04SYrB0njdxEUSZqqZcDAxzKB90ZCxPlJXGQ==
X-Received: by 2002:a05:620a:192a:b0:7c5:6a2a:d0d0 with SMTP id af79cd13be357-7c7a7659f89mr169488385a.5.1744253696500;
        Wed, 09 Apr 2025 19:54:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d123197sm24032e87.44.2025.04.09.19.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 19:54:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 10 Apr 2025 05:54:43 +0300
Subject: [PATCH v7 04/12] llvm: handle libdir in llvm-config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-mesa-25-v7-4-59d715c66e19@oss.qualcomm.com>
References: <20250410-mesa-25-v7-0-59d715c66e19@oss.qualcomm.com>
In-Reply-To: <20250410-mesa-25-v7-0-59d715c66e19@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=905;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=IuzzLH49YcN+VIIkSFokCKJ3AWdCIlrAtboeqw5vZ2E=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn9zLxFK7b2qCDxTW/BNhimlgaewYws7LakS+Vy
 aom/okXvOCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/cy8QAKCRCLPIo+Aiko
 1QH3B/465ApR0dQcWQ4BNNFjdaIp3At+TzJptCgYcvrqSj0g3H/x9UDsta9fK5pqgGri4NHFGtu
 jBhFC3IXsh1u0hvIN3LNc8AGPio8nUj2fONYh9FamB0C33fbT+JCnEn5oyHx8yfa4w1jyVZ+G0n
 3my4yW68XpVJXfo8aOLsod7rkjWatIxH8KvEbg3gEFODK/I2ehshjYvIWrRcsTlRxBl4n02J5ty
 hgW2p6LSPC+Ysmep36JyO6eLoLADUVfadUW53B/oCeVbMhsNxPlDXPGe7dWE+mzvKFgkMNhUAtc
 cl77+tdCZ0BCjBEQ3GcwjZ/Sd69RxV8i07CfZzdHU2U4UCPz
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: RgBANFALc_-QUMukgxZU9zm3B5Y7rAJ9
X-Proofpoint-GUID: RgBANFALc_-QUMukgxZU9zm3B5Y7rAJ9
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f73302 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=DFIL5-tCekSmT_aHp3cA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=778 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100021
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 02:55:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214606

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


