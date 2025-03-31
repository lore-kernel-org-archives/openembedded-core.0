Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 162D3C36010
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 12:22:02 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.50714.1743423720233559478
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Mar 2025 05:22:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=c0N8vFvB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52V6kZCn005003
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 12:22:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lsu9CYuzgNcf1mzGOXPVNDoxsmAY5YjYnKxsk6fwwkw=; b=c0N8vFvB2DoYlW60
	6nU6AykEL5D8evV94M4jUqkESH6khyg7lBMl7cyFZtlYbFW/Vu2GbVouFHieQ9zQ
	5uhnT2epn0rZiDdm/WUxKac3wjr6almR7GcH/m4Uk1p7JJHDCsi/sZIu+GCHJ84j
	HXK85zkxM/pEfsYbdHddzj1FimHg1nfklX8F3hFoFO29+1SbDSN7nr0p3ahXQu12
	bzYb6ucPeSO8dt6Zkr0IL+Q2YjHpK1MMKjwwggl0VLmUJmbXSW5HFwzTQ0XhIIO7
	zxTX9JO3r6G1yFMSBwwoIp38TvoDpCltr/X4qxT3bfmfo/PWLif5APX3E5xaGv+K
	cs0tDw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45pa5bmc4p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 12:21:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5f7210995so319263385a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 05:21:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743423718; x=1744028518;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lsu9CYuzgNcf1mzGOXPVNDoxsmAY5YjYnKxsk6fwwkw=;
        b=aSnckzM4PDw2xPyC/xqJnPr0sumSaejDz1+jpxu1ofMRlr0WPuVmaZBNldgzk5tv56
         Jttaq1yL/kpPkznjMOOfZUYzFgQeMmjETxcomnCFPIYpaYF4KRl8Sv7KmXt5T8Rylp4b
         N/RQXZbcbWYHN8QWRxC+bkRkOoLf4ByA3Acx4EudP3k+8rDuJqJRhBBgK/hWuxI7L09f
         FyNykof/uBdEwm3ISu2L7CqRLvU5Sy1Pw/0DtYoDu7gPM8pkAdevLwGeg+JEX65ow20X
         /3iivRelQXmfEW9BThHsLb7sSOR59XpwCeFx+xm3j660sBJmvxZVWQSMI+a0s7sks/Ad
         xbkg==
X-Gm-Message-State: AOJu0YxmJUsb4daNZhYacVc0MjUCZKM/50Tsx0ULyNDdiqsUtpzzCQuO
	SqiXrjSk8dJyHTp83Oc1+BVEcl5gwOehLNuCoN4qKcwQQiitmh6HDzayYsn0Dok6dfsyhvFKkDl
	+eP1jWy/oFCpiFv0mR700ycT586OaVwjkUGNrQCps9d1eHxwYcS6yVhAAAlWbYwZkzIT7tqAfwi
	4Z7muMulg9jNVh8UuP
X-Gm-Gg: ASbGncuixhQyRkcuK/TNmX9o3JkYdxPOLczaaVseMdJve/xqtDDLIkjJq45k7WZHelZ
	e6Ia55Lv0zCYwXNw3OBPInq2aFhKtOpmIFyDC6JzD4l18x936/cTvxdNWSJ/yDwm7K5t75nUMG3
	kZLMN+ESSf9kz1PgmSz13U6MGfi6W3xMspVneLRbKScQmpjyxidtxJqgxcXQLU+HXwFxeW5t1u4
	AQLWAYjNRtWtA3xczQUnZyK0sXgboQWvwQL+e/eeJ9kD1J0oPngTJ3eIDq6e85IDCsqq4/vnt4C
	ifBVwzpPvrVi3YvJrjGUyNrDWzJd5y9ZDbrdVaAKRo/NuC5aWmlWjKdbdGv3mxBtJTGXJ9CliBw
	btqqY8NoYetIjL0la+lJrEZuAcD9C
X-Received: by 2002:a05:620a:4413:b0:7c5:6b46:e1f6 with SMTP id af79cd13be357-7c5f9b62855mr1716017985a.1.1743423717826;
        Mon, 31 Mar 2025 05:21:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkaVCouCxhRScE2yqw35pK6YAPZTMC9NOQzPK681A27kQAKMu9O24Nxu1RBLZwEa6lliV04A==
X-Received: by 2002:a05:620a:4413:b0:7c5:6b46:e1f6 with SMTP id af79cd13be357-7c5f9b62855mr1716015785a.1.1743423717534;
        Mon, 31 Mar 2025 05:21:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094c198bsm1107200e87.88.2025.03.31.05.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 05:21:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 31 Mar 2025 15:21:36 +0300
Subject: [PATCH v4 3/9] llvm: handle libdir in llvm-config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250331-mesa-25-v4-3-e62fc54a6efc@oss.qualcomm.com>
References: <20250331-mesa-25-v4-0-e62fc54a6efc@oss.qualcomm.com>
In-Reply-To: <20250331-mesa-25-v4-0-e62fc54a6efc@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=905;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=IuzzLH49YcN+VIIkSFokCKJ3AWdCIlrAtboeqw5vZ2E=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn6ojWRsfcOComiNSyjMlMKAD0rBWu6vp+qnQNT
 IW83PfH3biJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ+qI1gAKCRCLPIo+Aiko
 1Zz8CACjvNda8e+H8NO3MbuNLqfMWB9OTp+F/eCBEG4E+1cKvZwEjt8mdqCcYXf1jbyT9Y4DKSe
 0ODstXmODOa4tt/03G6dEeLj22qxNFSreHLDHP3o+WDrglLOpKXFtLpnNpGXGS2+oLhAcEjWymV
 165x94ftyo4FDtpAFiTb80gGIYEWd+lduurw1hUfIZw4UqjZ63UsrKZoU7TgaetqGN2gZ0j3s7H
 N6eUfAAJIz09xULkeu1aVKiHxnShH65rnxsmMNu+134eezwWNEEFcb8vEMOIbpz0eVZ6nkODqvt
 rYSpTvBjBIWX36Hyq8/ULG9jz53SR10Fm0RCKcnLkWzLUICq
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: cLRgghZTiV8uGHs3_fsn3ih9zKo1V0eH
X-Authority-Analysis: v=2.4 cv=YqcPR5YX c=1 sm=1 tr=0 ts=67ea88e7 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=DFIL5-tCekSmT_aHp3cA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: cLRgghZTiV8uGHs3_fsn3ih9zKo1V0eH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_05,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 mlxlogscore=740 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503310088
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 12:22:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213972

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


