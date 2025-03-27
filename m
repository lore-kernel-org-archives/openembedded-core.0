Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20614C3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 14:20:10 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.48790.1743079032563118106
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 05:37:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ViFdsn9A;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5jFR1025693
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 12:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SM+IlWEYt4n
	c/J3FdkmsdaotwlmJiOhl1MIB1BvrPY0=; b=ViFdsn9A8i+8k96N7WrJQQLAfds
	eZ6ONUV74dQq18U1lsSaswjZXKP7ujTJ3B3leSsx4TNdfupzDUfzMhd126VfC+pz
	KMdKu74djoS2mT3c3uW1J3aGKyNGfB2/45Sd2fKqYZFdigozeA7snsyocIxHAbo0
	zEvnfEYLZqvtgNdLtktnP1AujOleue6Soq9npVmwpJTbHNHsgPEyCRIPEm6devux
	8g2HYRmE6wBj/yWpQrfyYV0n0pTeOaDsWkosw1h28ZfEyW17uscT1iz/J4yKN7KJ
	06V7Iu45xYt/DdnJ/MVU2g9PX9xfPIih8Xu15HOFYCtSrMp+0DRINCEYJjw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45n0nus3vt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 12:37:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5750ca8b2so150283085a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 05:37:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743079030; x=1743683830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SM+IlWEYt4nc/J3FdkmsdaotwlmJiOhl1MIB1BvrPY0=;
        b=hrex0b6bG/4kGTUtkFkPXM2YBRmOq3gzRywQn6WCTRdp8ZEzTNL7AV2hAFuTAkcVnP
         XMnb929ChaBSLbZ3+cDObKdVN/coZgXjhftnzSI2VXMSldeJoNx3PPg3AoR2EyZt62oe
         vUGSDHKNGTCk7fd+o4pVCsjX17k8RTVjxQ0Z7m3ZJTwohNmPIRKQuSD4qikTv8JLNkCR
         XpXzshZXjrzsug9MPVspODQnpkVCSDgpQCkQ7+uC0tsy3G260RNvBFejVqGe/nsfw99x
         bWoHFjCOLNLcKOxpWgQSR+QoKObn2rJWGv6003nmg0n5pBJ5+quESffh+yVsULBnfhAU
         oAyg==
X-Gm-Message-State: AOJu0YyfO5h3Xd55ajNvk0+FE+qI97XxBkGWr4cdx918Yz8fxSJ9pajv
	20gxnbSA1ixVk6WUKSVgO+3qYqdhrrSUd+/wmavj/PQ1cGf6G5bEf4N7WyL51ZvabZ0vjTWeUJp
	JEopmjX9WRSe4NvKrq6qkfvhri+H0uMYxkVRTCp4d4oeZya1VDDt2RrVsUWjnOGy35yBgl4GYt7
	3BhZK3QVVDA0A=
X-Gm-Gg: ASbGncvEFbl1tWAmCMJdoggx6vSDV8YXM74Aue5lYFOjLTXk7XWbhhLKueDZrId+5dy
	LBNAQO409M4+YfDSk2tIJdP1p7Xd/uiCrl5M36xu3+l4lq3RnYqggC8qwFZJwUx4eVu9n8VtOnt
	gv/yQ+ahxmFbTuBSvQEROBRzIxju4ljSS2nQCNFKQr0qbUiO/bc9RAlOKYGJBJuqKwf06mQs/pb
	/WtCadoeQDA/Wp862pA+DPuCU7pF9c4ob0+K053DzcV5Xan+4zekbgZqMqIn+S3rh2VaS9MqkIV
	ybNFB9/eEgHpgKzK8OCtwHHqgbcbPbqdA6jft/zQGRFSzE/cBBp16gFvYIHi560DdlYXfV6BPXF
	Txvy7c1Kr2LhwQk1TzGjKg/599xhv
X-Received: by 2002:a05:620a:199c:b0:7c5:4750:9302 with SMTP id af79cd13be357-7c5eda0f072mr439054985a.34.1743079029573;
        Thu, 27 Mar 2025 05:37:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpLP66XU7Z62v1EJfPFPaJiZau4Mv1Lcguw8ZgAgQDUtsN/8J0BM2cZvudURuU5QFjgf/FAA==
X-Received: by 2002:a05:620a:199c:b0:7c5:4750:9302 with SMTP id af79cd13be357-7c5eda0f072mr439050785a.34.1743079028983;
        Thu, 27 Mar 2025 05:37:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad65121e2sm2053600e87.235.2025.03.27.05.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 05:37:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/8] llvm: move libLLVM.so.N.M to llvm-libllvm package
Date: Thu, 27 Mar 2025 14:36:54 +0200
Message-Id: <20250327123701.3906604-2-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250327123701.3906604-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250327123701.3906604-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: WJLKrYA_HGJlWrHt56sBEQVYjd1gjGQZ
X-Authority-Analysis: v=2.4 cv=AcaxH2XG c=1 sm=1 tr=0 ts=67e54677 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=O224Tk8ENGDN2UPLuq4A:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: WJLKrYA_HGJlWrHt56sBEQVYjd1gjGQZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=921
 impostorscore=0 malwarescore=0 bulkscore=0 mlxscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270087
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 14:20:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213741

Neither MAJOR_VER nor MINOR_VER are defined, so libLLVM.so.N.M ends up
in the main libllvm package rather than the llvm-libllvm package, as
expected. Fix this by properly using two-component version.

Fixes: db3bf550a372 ("llvm: Update to 18.1.0 RC4")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-devtools/llvm/llvm_20.1.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/llvm/llvm_20.1.0.bb b/meta/recipes-devtools/llvm/llvm_20.1.0.bb
index 7ffc6ec1cb8a..296a164cdd7f 100644
--- a/meta/recipes-devtools/llvm/llvm_20.1.0.bb
+++ b/meta/recipes-devtools/llvm/llvm_20.1.0.bb
@@ -19,6 +19,7 @@ VER_SUFFIX = ""
 PV .= "${VER_SUFFIX}"
 
 MAJOR_VERSION = "${@oe.utils.trim_version("${PV}", 1)}"
+MAJ_MIN_VERSION = "${@oe.utils.trim_version("${PV}", 2)}"
 
 LLVM_RELEASE = "${PV}"
 
@@ -152,7 +153,7 @@ FILES:${PN}-bugpointpasses = "\
 
 FILES:${PN}-libllvm = "\
     ${libdir}/libLLVM-${MAJOR_VERSION}.so \
-    ${libdir}/libLLVM.so.${MAJOR_VER}.${MINOR_VER} \
+    ${libdir}/libLLVM.so.${MAJ_MIN_VERSION} \
 "
 
 FILES:${PN}-liblto += "\
-- 
2.39.5


