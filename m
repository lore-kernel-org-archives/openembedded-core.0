Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C53D5C369A1
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:48:19 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.42851.1744019299335476118
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:48:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=G+XYQVTM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378doTP001298
	for <openembedded-core@lists.openembedded.org>; Mon, 7 Apr 2025 09:48:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lsu9CYuzgNcf1mzGOXPVNDoxsmAY5YjYnKxsk6fwwkw=; b=G+XYQVTMQ5iYho87
	8Qy3UGgtrlZYu+BTYJ14W8HEwnSdRJQ73BSjN00QlTZMjMnca5+zCo1LEIvGokKD
	YjHtZnZWPCkTBzZ38hKgwc/CmrnckyT/TFPwujkN5qw9IAzpNBzGqfJ1V3Pncdtw
	7ppro+prBW61rnfC6a70AQ6+FbI8SC9J2V+dzVB+ce5KyZAvT1aWZ1xFijDz/QcC
	Fw6iiHryZ6IFND2zSgXVXU05pvJVoSnDRXjOZGBIiiNESCx41m/Hi5U6kN/jbFov
	vHvNc7YH2HFu4vmbL8cpiZ0s9XlFF2nvnuAnwZZ7uxPvcLapGQqGggjsYWjFRvpJ
	badMBw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfkbrdk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 09:48:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5e2872e57so793635985a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 02:48:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744019298; x=1744624098;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lsu9CYuzgNcf1mzGOXPVNDoxsmAY5YjYnKxsk6fwwkw=;
        b=OVp8LosxyptQ/SppmUbw8XEb2h4sTGwbX3tXjmt+J6acXBt2CuqoxwY9uJsLVdyLzh
         fpQkwrLTEfJMNqMYZZlSYE5Ex1ikzaZQ4HDEtfhl+QJPf9N3g2qX8yRid3Xs8L2mimv3
         ykhidADU3QGlUGHBuBPdMAcpmJfunGYX4DbOtTVPfKROjgT3nNQ0Zk66kzcjXu9lpsOo
         J1inodtrclE7wbDVGeaE3bL2e8ertMhp2C/TI6GPDwpfBQo48e+W7QHyrZPOclbEvS7H
         viuHUdilvaIt/um7a7EA73fUR1tovAXHhpHSpDwLa8siHd1sQZqV9VnYqdsOpizFWOVi
         yQiw==
X-Gm-Message-State: AOJu0YxIEQOOATsytn03jVsXD/ytoTyCAIj3dyFZQ4EUCqL9RDx0n2tX
	ZO5DyL1UF7qDM1JGI+DgCknMFKlv7poszW6kMyUiKpdhehxt+cilgW/iUJoA5HHZJh/eHIkNGnG
	sZif9oMV2M4TYLbeHPO+1HVQ9X8wDPXroLKBOiCDgNq8MpIlSiTwFWrW5NSejj2e1bQqXY/jH+8
	jeLSQ=
X-Gm-Gg: ASbGncuwsBUtvV8NoKRJcQWsKSGBB8Vc39xPtM55G7RG2Ze+2/f13FAdQ75akPUW1TC
	3wzglHwIQK+BuGft96SwAwAXRZlzwEhDLPLoIZvgAcEKp8MAZjR6NEyZhEanyAvm6P9P7IXVyFQ
	/A51WNGpKMxt/pA0nGVKIyArjvz550qvS0OlRMKD68IV8F2fQGkFZ+cszX2hRJE5QA8KPLXI1hC
	yH/NF0+gvt9XxJGlo/LinPS56XpfmymOKG2ckhM6KljnQt9/EQHpOpm6amJliC3R6P684IWpEl2
	jWO9Vs61KXGmpRfpbwuiYytVXrsu+Ab9rbc89y5ytdg0dt/exlZZ9xKcYz8NdwVLBPFxdACC6VL
	JHtVEZQRXeO2N7K0hhz+wyo6hQEz+
X-Received: by 2002:a05:620a:bc7:b0:7c5:f6d9:86ec with SMTP id af79cd13be357-7c775ad8d4emr1690760485a.35.1744019297660;
        Mon, 07 Apr 2025 02:48:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfnQek2N+zzTBzxXXTDTHLuyig/EFpybN0FGF5PtF7HUvjeX74kehpGilVNjqH+EBKB1fszQ==
X-Received: by 2002:a05:620a:bc7:b0:7c5:f6d9:86ec with SMTP id af79cd13be357-7c775ad8d4emr1690758985a.35.1744019297333;
        Mon, 07 Apr 2025 02:48:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e5ab53fsm1216985e87.52.2025.04.07.02.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 02:48:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 07 Apr 2025 12:48:09 +0300
Subject: [PATCH v6 04/13] llvm: handle libdir in llvm-config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-mesa-25-v6-4-29bf4cae8d28@oss.qualcomm.com>
References: <20250407-mesa-25-v6-0-29bf4cae8d28@oss.qualcomm.com>
In-Reply-To: <20250407-mesa-25-v6-0-29bf4cae8d28@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=905;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=IuzzLH49YcN+VIIkSFokCKJ3AWdCIlrAtboeqw5vZ2E=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn859XjLq6GgGGzrSsTnz62hWabhZC4rCs0QuN/
 vTMgPqjOteJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/OfVwAKCRCLPIo+Aiko
 1a/qB/sH+3OsKrcynbSfxRo/o6mQkSzdSRioSqkjWRcTmYHmi7AfoQJ4B/2VHzQyRxd49lMDilD
 ldDCEdK8jW08bWArL5xvL9btgt6ryB43RSZRq0SkDg3+rOmsIMWbiDlE+O2kHk/cyShEZe2pV0F
 dOnFRYrQrhtE4B29N3HkBW6sMjZ2MeY8TfvoqzPIrI1lxD6izLsgsB80Ateh77CepLwbeER9TPF
 kAz9Ji9jxyHSvAZTN8ZQGQRnaPe+PXhYO8yXN+ibTPhyUFvw6+ufd80dhStQgePfBpwuLKjAj14
 49F/tPf20QHMCbLfgusiP/fZa4VzcJeJnDWnK+EL8F8IwW6k
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: _SPb84JdHVAqmwOkB0ID5DmVGweRNlVj
X-Proofpoint-ORIG-GUID: _SPb84JdHVAqmwOkB0ID5DmVGweRNlVj
X-Authority-Analysis: v=2.4 cv=b7Oy4sGx c=1 sm=1 tr=0 ts=67f39f62 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=DFIL5-tCekSmT_aHp3cA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_03,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 mlxlogscore=719 bulkscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070070
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 09:48:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214433

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


