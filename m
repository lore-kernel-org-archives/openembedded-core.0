Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5DE8C3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 13:55:29 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.50536.1743083727389787519
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 06:55:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Rww+CxEI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5jFMg010902
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 13:55:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lrnxHIQhpnz
	Qk8LjlG6rp9IzYwU1+oVEHFQn83Bqpwk=; b=Rww+CxEIUKkbrQcIyjWZuhXqKQL
	95erRM8FfN3JS4+v3YGwkTNBhZEkxmfuoRi8oqw5Jkj+eFrMd2ojOaOSJhSNthDe
	tgSL9Eb0cHYSVKEUAF/7//rK+b5KQpj6yIXbKqFQzUGmKHwkMZohsilvsi6LJ44V
	b9gzd7AU0HmJMIRD1O4XTttNytwKzqTwWTiFVnXvlR7mTtKTTND3UEaYrHDd3fSc
	yMHW7qHKYAItNINCcFpFnE1YOqI+ivgFO5CO4XDM8Sr3d9MY63gRpN3I8W6/Eday
	sQ3xKNJcsjtiM07xCaixwA4WroPkMVVCaBjVUrjlK8ejBCV66C+xTSUWYKQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45n0kqhaes-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 13:55:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c3c5e92d41so164428985a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 06:55:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743083725; x=1743688525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lrnxHIQhpnzQk8LjlG6rp9IzYwU1+oVEHFQn83Bqpwk=;
        b=WKHISlclPBkTowHJnP3FENNeEBXgNrm/VCpjVHEPfg9O+UTHWFtDoRuKAfUlP2VR7/
         VnD5ZxnrRB8q5fedXdYVF+Ko1Jikx3n0zRQ0EXS9rEh0za9hLYQoDp1QMuNZesqWzZ7F
         91dgyERtVa2DDPhiwo+O28et65OvMjklL3QJLgqzIp7e9qryvbtk6a3hxpLv6z/G+UkE
         f8lnwnbw6Qqnl7RN0S9gComCmjHd14MTmbkNxF1P6/omHrkQcZteZakgQxnuimclNDoJ
         kTuZ4vBmgxa3GxpjITEluNRLxpn1T8gJYBOvLAxyP3vs6lrg7RPAsCSaAnbvLMDSXy6A
         JeSw==
X-Gm-Message-State: AOJu0YzyRF8M17vsaRTlTntVBMqHEPdQVeOTDNi0psH0zvRQt64hYCw3
	U4tEjKmStrIEuow5RWXyyIt7jGRzq4Niitj9S+LQ+2DuCLtelrnXYV7OVh6crY40wWO5ObLJLWx
	+OrfrqthqETgXy/7zLYvX7deyg3yDLAMHiY4OaSZoHBbBjviKqBcZq945mb7X6tnUJYlyn7vAqk
	b9sVvA0Uv7hsU=
X-Gm-Gg: ASbGnctPzwvVn2Wzl4CYChhdK/j87snBIP+kJ36BfMquHba+N0YAbDMvDxiay8C/e53
	7c7/kIdTMOhpgSf4z9EgnaLCEmpt53OdoCWpJjEgivZn0ARgRYU2Ro6HtXMr7QoQl1otvN+C4JC
	gweuNMMKugcoUHP1VSzaBWIV17EWGV+L+Xa77nxCRR4cvVOOcptekYqI/cH28lzRtinV5OcGJYO
	vHaCE7Egqap73j41WDmnbk19TmX8rfzqH8CA85mZLzlwfQtj33gAkZhZi/QNcsRckffbLobRtPU
	zQKDMHUGYzHTLqDzcXkq4q607hCl7FbuUK3gp8MFQP1AKxP2ibyCrDeMTLmOvR9HUKcyf0hFaOB
	VPg7bpwnkUDOGEE76kXMsxhhUF1jB
X-Received: by 2002:a05:620a:4256:b0:7c5:5d9b:b626 with SMTP id af79cd13be357-7c5eda60393mr746833885a.36.1743083725061;
        Thu, 27 Mar 2025 06:55:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIedesBUx/K8L7Zdhr4JoGy/owrEVlQwS7jJ5zPZaHfY+RTVO9YDphy6/V/gzSUy3A6zZo9w==
X-Received: by 2002:a05:620a:4256:b0:7c5:5d9b:b626 with SMTP id af79cd13be357-7c5eda60393mr746827785a.36.1743083724560;
        Thu, 27 Mar 2025 06:55:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d910e70sm24288271fa.105.2025.03.27.06.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 06:55:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/8] llvm: use OECMAKE_SOURCEPATH to specify cmake dir
Date: Thu, 27 Mar 2025 15:55:14 +0200
Message-Id: <20250327135520.3920189-3-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250327135520.3920189-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250327135520.3920189-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 1eR2IU5zRSDO91S0KOGJS2zW9Wn_q0tR
X-Authority-Analysis: v=2.4 cv=FrcF/3rq c=1 sm=1 tr=0 ts=67e558ce cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=D0RIUQgIwEgepnv7z8kA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 1eR2IU5zRSDO91S0KOGJS2zW9Wn_q0tR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=968
 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0 impostorscore=0
 mlxscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270095
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 13:55:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213731

Instead of pushing an `llvm` sourcedir into S, specify it through the
OECMAKE_SOURCEPATH so that all the patches are applied to the topdir and
debug paths also use top path to map.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-devtools/llvm/llvm_20.1.0.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_20.1.0.bb b/meta/recipes-devtools/llvm/llvm_20.1.0.bb
index 296a164cdd7f..7470d2b4d8a5 100644
--- a/meta/recipes-devtools/llvm/llvm_20.1.0.bb
+++ b/meta/recipes-devtools/llvm/llvm_20.1.0.bb
@@ -24,15 +24,17 @@ MAJ_MIN_VERSION = "${@oe.utils.trim_version("${PV}", 2)}"
 LLVM_RELEASE = "${PV}"
 
 SRC_URI = "https://github.com/llvm/llvm-project/releases/download/llvmorg-${PV}/llvm-project-${PV}.src.tar.xz \
-           file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
-           file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
+           file://0007-llvm-allow-env-override-of-exe-path.patch \
+           file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch \
            file://llvm-config \
            "
 SRC_URI[sha256sum] = "4579051e3c255fb4bb795d54324f5a7f3ef79bd9181e44293d7ee9a7f62aad9a"
 UPSTREAM_CHECK_URI = "https://github.com/llvm/llvm-project"
 UPSTREAM_CHECK_REGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
 
-S = "${WORKDIR}/llvm-project-${PV}.src/llvm"
+S = "${WORKDIR}/llvm-project-${PV}.src"
+
+OECMAKE_SOURCEPATH = "${S}/llvm"
 
 LLVM_INSTALL_DIR = "${WORKDIR}/llvm-install"
 
-- 
2.39.5


