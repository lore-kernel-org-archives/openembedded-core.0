Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03651C36011
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 22:18:25 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.1784.1743113898834221488
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 15:18:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=I5ekFnTu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52REdk2C005955
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 22:18:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SM+IlWEYt4n
	c/J3FdkmsdaotwlmJiOhl1MIB1BvrPY0=; b=I5ekFnTuGoipZiw9XKQRYd2dfc9
	VDUNGcPt6VPkCRU1OOyZ/PjfJqni13UMRc05cKfhAs/hRKICGUoM284FXYrobz21
	t2eeYGCH8LltF8xeVYoboQdGFklGeHTTOc05RazBZ7hWcEX6O8y3oh9xWgRyAIJe
	KWEEtYmB+/o9Z4HeqnEst8WGt01tWQy93hAr0hCH+ajwwlPNI7hi5ARC9gTu/zNv
	31SBe8DhFBklOllcwlNPWg0iKjeOA26H0cXjdxzltjFB+1jisz1u00RTtRKCesjS
	RRwjS1jgj7WwjS9WIlaenwICUddshaACkvJkpTomUHAVDFnofmYkzWXo2WA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45m7nf6rc9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 22:18:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-47693206d3bso35121441cf.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 15:18:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743113896; x=1743718696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SM+IlWEYt4nc/J3FdkmsdaotwlmJiOhl1MIB1BvrPY0=;
        b=lZMZVff7G0g/ljT/T2IsPsYuTsRxZmpBOVJAXWAE7qy847kfh1oh148WlX0JvBQNM7
         SUlTgVlpC6aXqUk5kUsYegl+f5mL1yg8407lufWe53H1rGWPtuy3Vh3fA+u66Yr8+JEQ
         72cSahjVIgbd3+gBThCjnjRn4LXGkTiz/8geIMAAGDrTDs83Cin85F9KMH8AVd06S3aw
         fIkCHenpDEZ/I6NTmBPm/oI5LwV6sIu29wU7M1L+F3Nvu0YSfcAyJk8Z9lKVj2sv0ryv
         udNgRrkxFE7QNx39e2wDbJQQtU4Ib+33AUucJIuOEW/NYI0Ajrf3DYfzMf98+oXgxxTR
         XdMg==
X-Gm-Message-State: AOJu0YyC+uXhWmWO4JM7J4NPXVdl9mLPMoiSFAofxK2zI8Pc2dvAVSG/
	6XZpVRtMIduhdk9GB7P9t1fUq1p5cORZE8ohnzJZU9wjK68QVkdUOuS1aWvdgG/J739pa+5tmLE
	Zo7zltvuL5EwA5LGCvDvsbL0qAP5bbmacPYim/HI1FPGy1fUb1w2+oyBGIgIctdMvrMddRUukBD
	Y9MR+cvjQNabQ=
X-Gm-Gg: ASbGncvlEcBNLT4FDp3v20OXeA2uTv6EVvnR+NYBc7CZWHFIPjiXzWvc87zW+a5Sclz
	9AuxePPIfsosGXIjiOz1r+m5cDNy/045iyhR3OKEBfE4wYQJmy3CS9eTRZ+Gci+p0xiTcUGx5hR
	gQAY09BcGPFzJ2r/6Ossm7TSV35foPQOKyoCF1gP0XmCO058a3FB44VVnC1ln0RhrLTpuJZlMfN
	ZqMHQ/xcmj66k6XHVLwAOacQaLTcLV6OBGdqli7+tTFSmLl1swnfVkTpIZzAaySG+yUIMH25Sf0
	VxzeQd3xXpldrH8o2K2BDzlrAjGs8gJIyv19OeE8scg590ISgu5gDAY3DEDGuoWLZS4AkGG17ke
	vdqXtly54poccN64Pp5olQ/0juMSt
X-Received: by 2002:a05:622a:8cf:b0:476:b480:e440 with SMTP id d75a77b69052e-4776e12faffmr94550601cf.23.1743113896304;
        Thu, 27 Mar 2025 15:18:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+borEGwqsLlaRedSg2qKn9ltWsAAD/7HTHg5eBP0xXFmbcYQpsoLmAn3c1kMMCRIts2zbrw==
X-Received: by 2002:a05:622a:8cf:b0:476:b480:e440 with SMTP id d75a77b69052e-4776e12faffmr94550191cf.23.1743113895872;
        Thu, 27 Mar 2025 15:18:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30dd2b59808sm1019081fa.107.2025.03.27.15.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 15:18:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 1/7] llvm: move libLLVM.so.N.M to llvm-libllvm package
Date: Fri, 28 Mar 2025 00:18:01 +0200
Message-Id: <20250327221807.2551544-2-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250327221807.2551544-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250327221807.2551544-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: XlRTEV8J-Q-9bAOYyThAeraPHRToC42s
X-Proofpoint-GUID: XlRTEV8J-Q-9bAOYyThAeraPHRToC42s
X-Authority-Analysis: v=2.4 cv=IMMCChvG c=1 sm=1 tr=0 ts=67e5ceaa cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=O224Tk8ENGDN2UPLuq4A:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_05,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 mlxscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 mlxlogscore=921 adultscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270150
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 22:18:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213793

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


