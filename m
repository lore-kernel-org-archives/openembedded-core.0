Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67159C3600C
	for <webhook@archiver.kernel.org>; Sat, 29 Mar 2025 20:07:38 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.17856.1743278849895037765
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Mar 2025 13:07:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=RuXQEHpQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52TJWDER010998
	for <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 20:07:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lsu9CYuzgNcf1mzGOXPVNDoxsmAY5YjYnKxsk6fwwkw=; b=RuXQEHpQzpr90QVh
	SeFq1kTKJ/bwEMLXJbuOxAVd6LSVeiadoHj09hgpcqs5Ymvq4MwgCqjDwzculrM8
	RN9XBcJoDD3jdmR8J1dtdrecWjPOr65fWhH5xA8fXs4OVadCr9elGn+2lJx2xkxU
	3JvVVkNMHKXe/TwE1NctfWwJwNuEoxwgAGIOwPO2fPnpcSkTOO89J9nhjslhZA+k
	pbSPq4y7jc86rOiBqJDj5SYNr9C7t2DvGNIvOjIDJBGaD5wM9fBa2BukNza7EDkk
	NuaZQdpH0iPmER0SfjGfixMgGVb2QOk19a5374zK3jNwH1bsoH1C9kfUTEJ7EF/3
	S79gIw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p98917rj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 20:07:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5bb68b386so942388785a.3
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 13:07:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743278848; x=1743883648;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lsu9CYuzgNcf1mzGOXPVNDoxsmAY5YjYnKxsk6fwwkw=;
        b=GYlrZcpDGdIjNvGDvH1CQnK6BjZmJFPvVHtTgLzFjiM4/1pFmNTmSYQ+b+/rD5vyou
         shexOs+BVly30wTTr2fBfqxPqjLwRlv2HYee38v2QfzCMvLf94rtrSLn0na4Yz0/HYPf
         4Ob5cBEW0i1aSOXuACs5U0Y7p8RxHvwGZBrrn2Z6J0eXUzfvZiX37CXSW8+fklBnmKkY
         vEsEDyAQqym5hboO/tSMnZtsRIR6j8QEsRZNyOtGxm1xnwKq2rOjBzeFCUhqyKZMrzf1
         BJ5dRrdWA7Tx35nl2z0MnIiQA7nv3i2UVf70lyHzyaFQQzcrtzDogp2EN4s3aUzDBR+x
         WI5w==
X-Gm-Message-State: AOJu0YxelmB2NaQp0L57IaK03HjEzK762uh7HovxZxcc2vRX7JzXQLjW
	C4xNKCdvDYsIa6FXbwuk/A/780uvk9hoYRbDP1ONKAkgwwZmOpsj7GDlzv8C9BwRBpqHe3fLHR0
	GpR5rY7EKboya4M26TdWjFAbrUfVJDcOWRsIDfcFRSjBRnA4oFAOPaPN1cDq3DDnJPnQ3BvFbd+
	ysS+PCwJq6BoQ=
X-Gm-Gg: ASbGncvwJjrR2wWzVt7uOoy1P1VnwG47NkImXy90KMkepKSuBxHrnNsy53/SwTDOx5a
	60WrsXt60CQnZscMPWRC5rxtKVwFdlQijpRpawkzUTSPKxTIjVaEVenpYt3YQ0UOCtsZx/YME7M
	p4786Gb9wEP1550RKIM7bYBdnmFuHvVIbGFxnIrYnPO7chLOhtg7T4kdfujQGN5SIFMzZ/U5zPC
	kAZ8+rGhA2IsX/6+u07FZMhnXZnbuaQXht8I+C7EE+U2STJr04mNFctLMjN+BPv0CMQSPrIwD3F
	Mv6jAyt5sVRY5C6l1wLOOM+MUTlzeT/2LovyjYMosPYKuJftZwCifglHx82wZnTttY5EuYhMdjp
	549ZG3nLRgS1JJYsd7dc9xYUXCyMU
X-Received: by 2002:a05:620a:2a0b:b0:7c5:43c2:a907 with SMTP id af79cd13be357-7c69072edbcmr490409885a.26.1743278847964;
        Sat, 29 Mar 2025 13:07:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTVi7NDzyhfhZreaAvJB+oO36VjvxwC/6pzeV0m7URqncPIeE64uprDXATSO1eUb57UdA03A==
X-Received: by 2002:a05:620a:2a0b:b0:7c5:43c2:a907 with SMTP id af79cd13be357-7c69072edbcmr490407785a.26.1743278847647;
        Sat, 29 Mar 2025 13:07:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094bb365sm685848e87.29.2025.03.29.13.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 13:07:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 29 Mar 2025 22:07:14 +0200
Subject: [PATCH v3 3/9] llvm: handle libdir in llvm-config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250329-mesa-25-v3-3-f4d0328eb867@oss.qualcomm.com>
References: <20250329-mesa-25-v3-0-f4d0328eb867@oss.qualcomm.com>
In-Reply-To: <20250329-mesa-25-v3-0-f4d0328eb867@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=905;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=IuzzLH49YcN+VIIkSFokCKJ3AWdCIlrAtboeqw5vZ2E=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn6FL0Z3EbWrXrrUljBtzfENoWv+gyGcHW1Wavb
 O8BbSV9CVmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ+hS9AAKCRCLPIo+Aiko
 1QJEB/9Uxg+wtREwf10sSIhg2Fe0rtmAN/tAX9Z6EdnQCXz3myAsmPZ5xa8iOrdTFCNn62OXhWX
 A+YqF6iVATFKjZlnh/Bqb5NmQOttZ6r6heuxttEbmL76URv+N03TSy9MqUuW2d1OrHR4i23AyWH
 doJuxXKBrAPrCcE5QbSVAUlxoQNJCErW7ph9ZlCMyiwobiw3MlRuYyuG/E3+I8WgWlS6B09gDHL
 W+21u2Fmd6uYR/S5KgohstZeOLcy2dofjiXH9Fw+DkwAf0U6+f6m8m5x2+fYNBNfI+sGoxrmPB4
 lacWGy6hI5ath7pedrmUO39eKynEaquFingU7+MVmt+AYRXC
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=fIk53Yae c=1 sm=1 tr=0 ts=67e85301 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=DFIL5-tCekSmT_aHp3cA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: bvbwffH5cfFTElVPWedk9KPXgrFejiHJ
X-Proofpoint-ORIG-GUID: bvbwffH5cfFTElVPWedk9KPXgrFejiHJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-29_03,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0 suspectscore=0
 mlxlogscore=740 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503290146
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 20:07:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213897

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


