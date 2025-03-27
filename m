Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB6DEC36010
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 13:55:49 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.50399.1743083741584072170
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 06:55:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=GyKa17MQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5jDUA012382
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 13:55:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SM+IlWEYt4n
	c/J3FdkmsdaotwlmJiOhl1MIB1BvrPY0=; b=GyKa17MQ/4Fapky5Z8uijGDr+ef
	jVtMQitQYqXSP+ETI49xnihB4Vu7bd7BdYRUj0Ed6dahB0io4SQnr3xc9ah+Du7r
	3I7ZUYTVXFMmLozvpt2VCZMQajCpS2fBTNLbM6svWkmoZ+RegzPCVvEC52Mn5suC
	GUgbtTFO+LzOXNFn01j5+ieHQ4VPPVIzWjuRl/LTPOipjdHTewwjb5+1iRt/SCZb
	F7yqLbIt/oHDcsx7Ucw4/nFogZifiP/+1lJTpqm0zkJomzaNXZ62kgG/23uwcmML
	QnK8a56G3E+NQVsUQMeqFKTFeSV5J0LZrN1HejkOK4wBu+4lL4TunQcGI4w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45mmutk4mt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 13:55:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5f3b94827so59487285a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 06:55:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743083724; x=1743688524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SM+IlWEYt4nc/J3FdkmsdaotwlmJiOhl1MIB1BvrPY0=;
        b=qiyoVULJtnYX6wIb4aAVLQyd6JOFPbfPAwQKS7yzz5HCV0vJz4FIqbsGnXUdQrVDnx
         fbfWLi6uEIlz28qdPpaaaUGwcCXmAmT70XrdY0H2scpaYGURdi2bG6vSLGiFfVmZZ07r
         qkFa2+IX+6AG4Gy9xX87aiqFN7Dt8L8zGrXeOVu1SX98LatBpIgN6nXluddMQjU6R/vq
         XwYFc5VbZVndNaswJvppIg32wjiFuIJwq8RRLMJOp2L8NBZmOZzruVC8rQBxqKeDESyl
         khtuqizz9mi+xSOKrS8NgKMTapQAaxfzd0lIhT+5ufhEnIcpEw91mj4Ii87rFB3iS3YQ
         97ug==
X-Gm-Message-State: AOJu0YyOyyfwGu/0u1ulEL92DpyT8E/HCUMjQAH4l24TSV1Qn4CV0wtl
	4s2lBTGczHFA3kWKAcGAl3K66sRltU3db13iQr/cBxXtPmfc5J2WtvKknmd9+c4jzDN1a6dbHpO
	WyhWPCLREQ7P6XO8EURXsw78CPUdVvwlRpgVsEy4dtbUCAdAdE6xSc2cQRvEsrsnxxaoverILzr
	sUY3RJK8KDvgM=
X-Gm-Gg: ASbGnctJiEHZr+caGGf/H1AnqRzPJbiYWKVctzZs6doq4qt4GdD0BjhOVXmJERpz8kL
	PsJZ8UeIZrZSa87z64dUKU7my7B+msM3lUs+FxT1/D/dp1aMF2itZ4ysz7fDfGrZ2Ow/imKQt/h
	KskhCWsAgVATgmBKY2AHU6vja4Kigvmy11zFORUxZtjyqlT598AlqNu75FwOfDFES+xYtMp5qsa
	h1s85+pc3h5d0/D0AMOZ/P9RnF9F6Ff1w8HhdXfBEFFt2iqaxzjyUyTiu0ttbG0dBIkPdSlh/IC
	9GnbPf55cY6bTWmTA3k2j8GqiOpx6CIGZh+wd/l7UVRNjx35rlUx8mXWPqBRzOHZyWTKdmqx88s
	LPC/XEhUrdhuEiWGfqg3YXk6CUEuL
X-Received: by 2002:a05:620a:3703:b0:7c5:4738:8a0e with SMTP id af79cd13be357-7c5eda66e5dmr521717285a.44.1743083724021;
        Thu, 27 Mar 2025 06:55:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEl8CjV1C9LO2PJnqynPw9paAVrBCxX0zAlFEct/y/rNIC5RPI2xr6pjx2gvX9CYFmsLLzCig==
X-Received: by 2002:a05:620a:3703:b0:7c5:4738:8a0e with SMTP id af79cd13be357-7c5eda66e5dmr521713285a.44.1743083723536;
        Thu, 27 Mar 2025 06:55:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d910e70sm24288271fa.105.2025.03.27.06.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 06:55:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/8] llvm: move libLLVM.so.N.M to llvm-libllvm package
Date: Thu, 27 Mar 2025 15:55:13 +0200
Message-Id: <20250327135520.3920189-2-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250327135520.3920189-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250327135520.3920189-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: lR7DGtYChCWGjAeNpXGHv3-9r9wjssEk
X-Authority-Analysis: v=2.4 cv=MqlS63ae c=1 sm=1 tr=0 ts=67e558dd cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=O224Tk8ENGDN2UPLuq4A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: lR7DGtYChCWGjAeNpXGHv3-9r9wjssEk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 mlxlogscore=921 mlxscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503270096
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 13:55:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213737

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


