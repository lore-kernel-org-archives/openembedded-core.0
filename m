Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25275C3600C
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 12:22:02 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.50459.1743423716310742581
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Mar 2025 05:21:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=SvPBidl1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52V6keDg028166
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 12:21:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AS+w1P7zyHFnfLucYjiktS7bjXogJ0ROIA2ty176TmE=; b=SvPBidl1pMjkNcAc
	HIeKibNmoZuabeHjI012+DIb5NdCcheO7fCrvn6/p9z8hCncqHXfvzWrw23LTXxl
	f09R+DBpo9gnbqA3mhGDFS6R84ErqflfykbRKjk06UY3OLdRLLGUyHmnDQq9fQWv
	9kek8RueH5OjQQ4Bh3jqd0O6ivCJ/Eir9wUPDFJ9djlpN2BGNWXhA2I8Hh1CMc/M
	rIXnAykpiPkXvo85qSM7RX2XMLttaZWRKE5jzbB3VGiqoZ98pJkHid1aGuHDqfPh
	oKskqX19V5Yjffl0w/o0CfOfstXIeU4FDcn66qlO0khuqvUnvD4o6/C61b6W28HT
	cgiJQQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p6jhmn5m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 12:21:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c53e316734so831303285a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 05:21:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743423714; x=1744028514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AS+w1P7zyHFnfLucYjiktS7bjXogJ0ROIA2ty176TmE=;
        b=wiH0vpFQLvJ1WZk8wzGY3N9dURuHwt18SRxzlydoLF7Mce8gYU1+mhh5VS8laJAWl3
         BSWAtLZJ8QtX95r5E1HDFvE62fNhIfHDfEEdLOM9ZjEKcIVyllBYjhoCYbsTWvBmG8W7
         3KhT9KJF630lpITiCEa57ulLN7QJrndhFfpJO3mIKT9ZLMDBrwra06sz0FVi23OHnr9C
         QooVgvyvBsbMfY2h41WushMFeKkD/+aqNYrt8z+ziT2ie97wcz2TRJMJvseJxXMRolVe
         Olr0iT00nd7aC5OExP4AGux7HmJXNfQ5vX0QLPP3of92+dfjRyasypv4PkrvG/hKVHo6
         IOhA==
X-Gm-Message-State: AOJu0YwaljkeqFPjMi5KsKvoZiAm9e3ehu61UbsAO3+Xm/Yw6ZeNVWqq
	Zb8bS9kUJFSwz9g0ggWVBINvASKhFIBwPwH95elnY5vzrasX6f03L07RcrC0W9xkz1NmUWCNYBx
	VwPogEaV7Y7wJI97G03+etlGGTzQq/huUl0bXrsYmdOKJyF13tRL9k0/oOCMTYXt3s3RDTMZdmR
	XhDEKYrqZmzwUcin0h
X-Gm-Gg: ASbGncthtu0hsNB9y8QkZnmRUfaIWE53s5Ib4vhQMosImk+5YJ/gHvzBEV7bD9krZi2
	Tqp32BU1c6eAaFt79Bl/eLrHzEohZAF8CUlt8ndEIgvph78q+eBVV9+QNPXGh+otordgpoPmlex
	2+zGNqXDZFGql7oXNXKKyBMY7kNoGfEcIQuVxr48mijjarFbNk3eAIfTiYQsMVm9TWqyIKWjYWt
	ZIlnATkjNyUUvXdcpdkEEnMOTBl0D9epXa3O2wR3ybswIcPUU1aST5ud/Vka7j5Q4QDuuG3OEod
	ffILXsnLIVzgJK2mZjgxjrsnUn8j0J6nMKV9ZXdyCAMlOHz0E2WoCgFCOdtGZxjRX02LxUUH8Od
	drBRQ215YUMlBhvqJiMlfA8v8m5oT
X-Received: by 2002:a05:620a:3948:b0:7c5:e3ad:fa19 with SMTP id af79cd13be357-7c6865e8a87mr1054479185a.16.1743423714153;
        Mon, 31 Mar 2025 05:21:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+ICVe8A8hRh4bxZRzHafeNem5WSOcrsk057zckpSKFY62kqqwh41iLpvhn3ZsDexBKCZCPg==
X-Received: by 2002:a05:620a:3948:b0:7c5:e3ad:fa19 with SMTP id af79cd13be357-7c6865e8a87mr1054476085a.16.1743423713773;
        Mon, 31 Mar 2025 05:21:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094c198bsm1107200e87.88.2025.03.31.05.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 05:21:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 31 Mar 2025 15:21:35 +0300
Subject: [PATCH v4 2/9] llvm: use OECMAKE_SOURCEPATH to specify cmake dir
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250331-mesa-25-v4-2-e62fc54a6efc@oss.qualcomm.com>
References: <20250331-mesa-25-v4-0-e62fc54a6efc@oss.qualcomm.com>
In-Reply-To: <20250331-mesa-25-v4-0-e62fc54a6efc@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1677;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Up3cMTdzpBSB2lLY9eOM+XuWIZCZmELrydx0Z1G8gjc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn6ojW/fmHFfL8WeArSX/ETDt3sNZIyUnUaHMF4
 VC+suUsTF+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ+qI1gAKCRCLPIo+Aiko
 1cwZB/9O1VsHbGfMtGTizMpWYmgun9piHKUFkkGCwVLU+R6eRegtJFhwfBTm8NOC+zz/eDoqPhH
 xcKFOVG7K/Tn5lZK9lv2KuFbYIP6W0qGHAN4Y1UI7Bo1DdsctmU+y6OKBkKd6wH0zD3pNAXMP3m
 gkkhOcbvieYMYVUDB9DbCDmdpGoi2IY6WqNqIGOGVz5Ygc4lSkv1iCRdY+YBYhpN4S90qdu/KHg
 rQP88lyI2ss5NEX4U/LuBV6DiMfXccaxJu2aEC0P9NFYG3lmSN4TrE/2qVr5WyjUvIHacQ/qZRD
 QQI9M2dZqdOZtTYz+/f9bLEZgW8suOWDRdvPMlk4HKlR0eR/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: O1YgZgwwtEzl6Tuob2TgYgZYpjfEuij8
X-Proofpoint-ORIG-GUID: O1YgZgwwtEzl6Tuob2TgYgZYpjfEuij8
X-Authority-Analysis: v=2.4 cv=bZZrUPPB c=1 sm=1 tr=0 ts=67ea88e4 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=D0RIUQgIwEgepnv7z8kA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_05,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 impostorscore=0 mlxlogscore=827 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503310088
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 12:22:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213971

Instead of pushing an `llvm` sourcedir into S, specify it through the
OECMAKE_SOURCEPATH so that all the patches are applied to the topdir and
debug paths also use top path to map.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-devtools/llvm/llvm_20.1.0.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_20.1.0.bb b/meta/recipes-devtools/llvm/llvm_20.1.0.bb
index 296a164cdd7ffb45f056c879cc5fc4fbc459caba..7470d2b4d8a55868fe5d2e88f5843a2ec3faf7c0 100644
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


