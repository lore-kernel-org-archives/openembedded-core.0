Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78220C369C2
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 00:57:23 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.3254.1744937838191795782
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 17:57:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=OTahl0Qv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HCliE5008910
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Apr 2025 00:57:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u6UG6ZM5UrXTCK3/sjn3Hg7Znll8PCBtcru2pFnUQlA=; b=OTahl0QviTAj0lwg
	aP8eK25VoTv5RTMoPMnN3XXTixxt+sz4CuvNf4hKSBKpSKGt5OYbHH9uiw/7texR
	dQtgtzzx8k6ghes3VQEbi70zroaisXTzixQ82lLCbA9VXIXKTveX2XUJHdMbsGry
	R/lmNH5Z5KlgatgphrTxHHIn0m+OYPi7SMcrfBAt83BXKOBrewwrxA+3s1YovmJo
	TMWZgy3/+AmGrOZzdPpsOTZy6kZQn5tzEJO594XjW329LM+MeWfE5tWcI0se6d7B
	IQo5gUXOZhHO3DgEvGWytRkjecxBQ3Gq1Y6/k9BdDCLuqSb8wFj1ADG3l1c0LiI2
	AXxBLg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxk8f1x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Apr 2025 00:57:17 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6ead629f6c6so22615316d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 17:57:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744937836; x=1745542636;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u6UG6ZM5UrXTCK3/sjn3Hg7Znll8PCBtcru2pFnUQlA=;
        b=XbfZzw6tQ1ZHH4IQi/5PvU+OxagsMK8PmmROyZp8o13eHTW1ypD0PweR/sDddnne1B
         /EJWVyUrPSjV4TF5SVXCegZkFSxtZlO9UwsGhGJsmwePGNebw8v+kr7tw3ZvJqlwN0Jz
         FtsfdjShsIwJyJl5KcF2q6pvjgofedObHPjfwb8+5qvyAUoVeJouYKmnh+KhWwNroc/6
         q3n5o0oO72b6OJe7jvSbKK22RIu8wDjENN6+AerB1ldlSDRGR69lyGYOoVYSNYGyN46r
         xa4rvNv2Hr5SKy7Vnj8Jq9TveNUZQBPfBQi5E0oO8rilkyh+LqLUbKChjZWkFS60hyIW
         eylQ==
X-Gm-Message-State: AOJu0YxsNKBFHI2klPdap/Txyu5Lwy3Yb/6kbSKCV3gnFqPKHAT3iUqw
	WFJNkICS0RcBODnX4VURZRGnSHFmq5OGQbZmT/+1YLs1sO7aDJCjLnOypXjbsoMM/1qeX6vgwbu
	zBy7EeIqnInTG5c1VW9j4Ir5zJDQxjG+zVpbP6DAZPDUD4u4r6IrkvU/Nbe0xL7k37VXygiuh3M
	1dK3HpDnkzWX4=
X-Gm-Gg: ASbGncuPzpLgZQI0Hyl4bZZWNqYWTdse+lGsF3G6dhZH4GKyzbMgaQABIiDFPQrWKND
	1MIJOy4gaCDjQ8Qj2TcLQjIDPdX0gIgp9I1fIAVjWd/Yhvfzlg0QZ15y1FrtUdeHuKp/O3nEPlo
	zVfOBFnjYopHmQMpnkHxCGhQHI1CFAnXtuBf5RB0+cYvyylLN3JtS5EHatmnT4g6LOSrbIPTq57
	eZ48zEhIMJZVWkDfsmU6kBFuRUjSNyhQFJ94rYU3c7RqQyLOZjQqMPj/yWvSJvD04uqKmZXKnap
	OyEBsuaQl2lGoBS8/Y3pnZyWey6zzlBi9ubWnkvlvdnDIJciP7xDmzawBkE1z+PCFvpFeKdF9Tl
	KZiDkeejmAjDOvO88DPhz+pOZ
X-Received: by 2002:ad4:5ba2:0:b0:6e8:9a55:8259 with SMTP id 6a1803df08f44-6f2c4515171mr21031006d6.9.1744937836174;
        Thu, 17 Apr 2025 17:57:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmpEaz6jeKjau0oGX8etHQcMH/7ui7h4eqlN5nww0z0D08v2RIhl8kSzUm9Riz5OrzB8LZfg==
X-Received: by 2002:ad4:5ba2:0:b0:6e8:9a55:8259 with SMTP id 6a1803df08f44-6f2c4515171mr21030766d6.9.1744937835796;
        Thu, 17 Apr 2025 17:57:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-310907a77c1sm718951fa.57.2025.04.17.17.57.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 17:57:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 18 Apr 2025 03:57:12 +0300
Subject: [PATCH v2 1/3] meson: pass -target and -I to bindgen calls
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-mesa-25-fixes-v2-1-e110ccfe291f@oss.qualcomm.com>
References: <20250418-mesa-25-fixes-v2-0-e110ccfe291f@oss.qualcomm.com>
In-Reply-To: <20250418-mesa-25-fixes-v2-0-e110ccfe291f@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=994;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=IHpEZaEk5c5V//eNaDaKFBkCrlcHIGS7GMwYlkAQQZU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQwbj4ozbNxb8PPdH6bZPtIpJdsiTiz7B/pMndcdWfT3yp
 9bOy/1AJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmYhfCwbD2ycYvv2cUaZjJ
 xjzdc2xJLeOZhZnpXR+fT5rFtWzvvqb/Gc4f8iqOP5X5tqaR3/SQkG4d46m/R/8/7mtLa8pITco
 IaMrbJPbdce6Uaeb/wuJvhqp7udfrzcuvzHj2isUpJNY+Xr6jwD1GS1nzTeY8oZ/lGWesPy+6o2
 m/UF0pKfJkwQWvhm0mQYXtuaus++2/edrssi2yjV0ibnv3KsfvztgzT2VykzUjmXNkldQzlNTku
 xoYn19ezV/VPvVM6SEH9Z1Gf5uSlnreq+9QlQmvWbS/MVc6+MGEOYXm/REWJdZarpckfyreaDm+
 acbNHYvFuWUsdsdb9H+5x1531nLRoxeHA81+hc90OSIJAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=6801a36d cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=E226iTZLpvBttkJnM84A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: _NgqKc8UGD4LL9s4QRnfkvqVfii9kyIn
X-Proofpoint-ORIG-GUID: _NgqKc8UGD4LL9s4QRnfkvqVfii9kyIn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_07,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=675 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180005
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Apr 2025 00:57:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215116

In order to properly generate Rust bindings for the target systems, we
need to pass '-taget foo-linux-gnueabi' flags and a correct include
target include path (${STAGING_INCDIR}) to the bindgen. Add those
flags to the generated meson target file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/classes-recipe/meson.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meson.bbclass
index cbfc45b94bbd076735847134a0976b6b30784d50..ef45a034a767e979a45553ba08e46dc90e34f33f 100644
--- a/meta/classes-recipe/meson.bbclass
+++ b/meta/classes-recipe/meson.bbclass
@@ -93,6 +93,7 @@ cpp_link_args = ${@meson_array('LDFLAGS', d)}
 [properties]
 needs_exe_wrapper = true
 sys_root = '${STAGING_DIR_HOST}'
+bindgen_clang_arguments = ['-target', '${@d.getVar('RUST_HOST_SYS')}', '-I${STAGING_INCDIR}']
 
 [host_machine]
 system = '${@meson_operating_system('HOST_OS', d)}'

-- 
2.39.5


