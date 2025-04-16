Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 794A2C369BD
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 15:59:45 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.23110.1744819176476825180
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Apr 2025 08:59:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Qft/bsb3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9mb3J022245
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 15:59:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HFmv60zzpxB
	Ot9BfSsOk6nn+Acop19FOvvN5XPXKizs=; b=Qft/bsb3T3qpdxdOyShdjV6vWtC
	MboMn+++ncbKdVHhfRL4WVFrdXs0tzJg0fjD5kGESnrve3FUx26w0NU6x+vR6/Gv
	x61Ent3eTCoou5hFCU1cD4J+Nnq/XlB7Wz3ggAHj8FcJhOd2QZqcpxJ8QhXphYCJ
	gk+R4EY7qhuTb+pXvXzg9ihSzrPg+QxrkK6aIfY6vwjIXgC2ANmBp8j1s9atyqJd
	8VbvL+gtPQRud3KpIW9EJfJkRsYRlmjoMqZY47+3XQ5DvQULfnl+kMosnD8xmoXw
	244+EZSzW44hGnCZpNZLVbAfLyUUHyw1qTu8p9cC/yNXOg/Os1rlOHLlOAQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj9c1a6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 15:59:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c579d37eeeso1019976785a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 08:59:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744819174; x=1745423974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HFmv60zzpxBOt9BfSsOk6nn+Acop19FOvvN5XPXKizs=;
        b=ixhiH/j8nCuAu2DqrWn0aJmJQIgtCP2RRzC0knAjDhGU5uBozecodqv2wzYVlEMcg2
         OBoxYp007JADSYgOfANkwlig5LgLle63y8ZkgIuz3K8Tpqr1d9ZjeaBbO/pS9dnnP6q3
         8bvA4mHv6VQswXqtegVTuAj1uOHMgoLfhgScDezgaeakSK2+F1mvw/I+v3iJoM6Uom4i
         YZSr5Ad3y4Da4DAJJkTYNqGOaR5wE1UbzGX3gFtLiQH/m4s5uKbMzYg6QMoKIQMEmA1T
         no1cJeM+Xuvh6EtGmmKP4iX6aZX5opY3AYfEz4rO34gQuXk626pVL5rci2x88Hk2FyXY
         toAg==
X-Gm-Message-State: AOJu0YzwBlrIVAOqDbHdTXROzvh223kUlOb5szBiBFGVLYVIypT2GSHz
	CEu90QJ1ewiVWK99sKstq+wreBBJBzl8T7wEgQ+ERI1Z+6Y2prtWXWzFDyB850c1Irec7kwpa8/
	8kfB7Oc6AHJhVaSXaF17u5b9uIvADQKBrJBAaxOZMVdFyOe1lA29qH1dOHyi/c40fduYC45+nqB
	uTSwva/AU0uGU=
X-Gm-Gg: ASbGnct9wGNMlTd8GdibXzcZA74IclNONv/0/xMwqTzD23iMASrVmbrPf3IBkrBw0ub
	puW7Cp4SGQTTGvPzLpCUMFPYIjzmSw2qg+H0xqhyeMR/0AGsLhW6fagl/miOMJo1DECrdp9CBK9
	NBAbCWeIzPQOPpaie3dDvAqbIIaK21NBCxfHq205w+/CM015oftc0r4+A1s188ftPNKlirccW65
	DTvGXSYHpCwL+/xD+dhAzP+TSU43SVIz1d1fcePxZLKrVMuQfP8kj208XaI+7+Kp0irP91CusJR
	FpFyx2+tYeKsKnQ+xM5HsfntTC3/qENYWpsY1YvlP7KK1vtGazGXzCLxpegXkpR97jbQUtNsUy/
	WFiyiIF88JgxmJOGFXf3zU/1s
X-Received: by 2002:a05:6214:e89:b0:6ea:d69c:a22e with SMTP id 6a1803df08f44-6f2b3050403mr31858476d6.30.1744819174428;
        Wed, 16 Apr 2025 08:59:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDSZjCGMTy8igQK5OnOa7wDxALGgwL+uHn4Yz4JpCv+zEs92Dy1pjR2CFJki9h+/cv3Ks0/Q==
X-Received: by 2002:a05:6214:e89:b0:6ea:d69c:a22e with SMTP id 6a1803df08f44-6f2b3050403mr31857976d6.30.1744819173947;
        Wed, 16 Apr 2025 08:59:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d5857223csm676550e87.175.2025.04.16.08.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 08:59:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/3] llvm: also install llvm-min-tblgen
Date: Wed, 16 Apr 2025 18:59:28 +0300
Message-Id: <20250416155929.2630778-2-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250416155929.2630778-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250416155929.2630778-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: LootTYi-oDWZJ7bVQXE1cxQTNLbWh7Sw
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=67ffd3e7 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=qQd9_2v_86bFzIgGbuAA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: LootTYi-oDWZJ7bVQXE1cxQTNLbWh7Sw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_04,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=887
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160130
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 15:59:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214996

Some projects are picky and want to hanve llvm-min-tblgen in addition to
a normal llvm-tblgen. Install the tool to the sysroot.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-devtools/llvm/llvm_20.1.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/llvm/llvm_20.1.2.bb b/meta/recipes-devtools/llvm/llvm_20.1.2.bb
index 4b24d28364cd..98855fa4c14d 100644
--- a/meta/recipes-devtools/llvm/llvm_20.1.2.bb
+++ b/meta/recipes-devtools/llvm/llvm_20.1.2.bb
@@ -159,6 +159,7 @@ do_install() {
 
 do_install:append:class-native() {
 	install -D -m 0755 ${B}/bin/llvm-tblgen ${D}${bindir}/llvm-tblgen${PV}
+	install -D -m 0755 ${B}/bin/llvm-min-tblgen ${D}${bindir}/llvm-min-tblgen
 	install -D -m 0755 ${B}/bin/llvm-config ${D}${bindir}/llvm-config${PV}
 	ln -sf llvm-config${PV} ${D}${bindir}/llvm-config
 
-- 
2.39.5


