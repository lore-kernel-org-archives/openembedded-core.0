Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDFA3C36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:48:19 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.43385.1744019298187407993
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:48:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=F4aZv2tJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378dvKW010542
	for <openembedded-core@lists.openembedded.org>; Mon, 7 Apr 2025 09:48:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mxVIQywhiZ9YOuUBkpl3wuYcNsg05g4TxVdzCoz5Ol0=; b=F4aZv2tJWEykIFQC
	THfkspZsQ/iYONwf7gFEhglxB1DjXXodIWhy/Z0m7MEGEkSumPq7u8uobUF9MyPk
	PeA67XQ9nPCuFmeQsArznrjI1Kr4qmDieLqnDa/lWptJ7jKYo860QxKTUVKs74ka
	rSwsiTO0ftlDseTkk3W3xQly4EmrMjkEEurJmgXEi3o+xa+ZRyLlz8kFyfERqK07
	z8EDexdSTdTI++JJwWeNJpxAff38F3Gkw48U7fSdmhoe+jSS2IvMHCkleXVxSuL2
	964Se4Go8HkCqtLAtXXz/rCnc2l0hCp9nfb97bxgpeMjcG6BkJ3G8si8kJcEzInE
	UJ6xxg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpm3rgd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 09:48:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5ac559cbaso813065385a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 02:48:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744019296; x=1744624096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mxVIQywhiZ9YOuUBkpl3wuYcNsg05g4TxVdzCoz5Ol0=;
        b=dEaMoasx7JN+1agJ0LvaZ3uN/sn4JP2Ai3vsOw21gFn61ivf93vTYkxjm8YjSla/UY
         FQdRSYQTa0wAJ1H7FXWMrrwVttZ+2GLc8OvA97+XmcwDN0cJ5ck+3R5ZEXBjGDm++7sN
         Q/sFjK4Nsz6j4rem3eiM+H5Si+ryJHxhzeY1tgnUvKu/8VwHZYxECcySbHOBzatMLX6j
         R3TTlAJCo2js+T0K4PmHRc4RdiOynv4YEzrJrF3WSrREd6I/F0WKh6pEgT8gS4ipUywE
         +TtVv5WaNuYPsE6wrUFEwlz6HtygV3MOLe21/9QYfOXz6Uif0vvSmBVc+0gy2leHQeKU
         Yrkg==
X-Gm-Message-State: AOJu0YxZt08epTkibUPId73nzVJCCw41+yqNnjEELo1w/AxPBv5UgHme
	sR9M7P1UDUOzbJgJKHYm2xEByQ1lqx9QerBv132HGqvuIYfi8L+Mc9Dilt5H6AAkZDzS8YIRmkb
	a87IRgKzldmaNvhN7LcVa4JQxKfQklsrYDhRsLBrLabCpAcPp3E35WgzHzNlP8X9P98pCjszaRs
	2+qxY=
X-Gm-Gg: ASbGnctxaLYKlJTMgowVAdOHS+ehsq0Ka6LZaqbCjO8ntDz2rbmEEl7WWD3/TtkKxeL
	T+MxZCvNjW5vPTYVYUgKOYD/IUtKiOeO056Z3kXnb3qjxxYxw0GE3gXnV4Bx0taW8YI0DRTVC+T
	I1iIWpAJtU9YqdlmD/aE6DNAg5hAp+QwHEZ6hQC+5WhmgLPKrrflox7Ub/K5b69FzXHyZERe8Cw
	ZWoNcaAMUepr15Gdr60nIzZHceciJnm6OUle7IUvBGhk6jwMObhaQJSRoutLOEzNotFUxMl04d0
	9rI7vL7o10YVQ74P3FemNCMKg6CTtUFiOj0GSlF7z5A9Fj5mdan/o5Iws1kez0sLcZ2rNlTNe+T
	k1DNUC3g9GowVeQ6FRx0I0tJlqdYw
X-Received: by 2002:a05:620a:4711:b0:7c5:46e4:480b with SMTP id af79cd13be357-7c77dd878ffmr1117557285a.22.1744019296271;
        Mon, 07 Apr 2025 02:48:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH86Jpxexv5fH6CQC4iyfWhSLGmBA+Ou3NYTid3bP6Jbwnw+R7Z8reSL4NxSXhZgzHD01n6wg==
X-Received: by 2002:a05:620a:4711:b0:7c5:46e4:480b with SMTP id af79cd13be357-7c77dd878ffmr1117555285a.22.1744019295932;
        Mon, 07 Apr 2025 02:48:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e5ab53fsm1216985e87.52.2025.04.07.02.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 02:48:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 07 Apr 2025 12:48:08 +0300
Subject: [PATCH v6 03/13] llvm: use OECMAKE_SOURCEPATH to specify cmake dir
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-mesa-25-v6-3-29bf4cae8d28@oss.qualcomm.com>
References: <20250407-mesa-25-v6-0-29bf4cae8d28@oss.qualcomm.com>
In-Reply-To: <20250407-mesa-25-v6-0-29bf4cae8d28@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1677;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=msY/GiaQPn1I+mVA/wJknsgTpKRthaqaRkWh46fJtgQ=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ/rn+WG3rUKSTJK8ol0vcVzO653dxdqz8qAor5XVodWzu
 LfGmhd1MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAiwgLs/31eL/zAzKfm9Uf7
 tOY/R6vpu5P33zFNCypWe21pnqzo+N3kOp/HtFbtzeJPLHa6iHtwGp+uL7epSHh3dtutJ+daWF+
 YiLhd0BR/KBh5p19AIajgwcfjYok+d/lmze/q31A0y+QC64xo9vW7D7WvXH35TNd65uCXezu4GR
 8I179beq7Uz5jpxubVIWt7xXR2lUx3LewIdZjyNG7WXWbmvV92/CnrmyR/pcLWiyd2Hm8pE9vR0
 hDlsD8qWa0vyq50WTn3H3iQlrRQ/ZnynLmlKxUOZDu/5In3ePPeoK9qvcYq5Q181rHTzkzWnPC8
 SmiZIp/B0RWCPsxNvZzsT08lC/kYrzu2pG9n5NU9tWe8AQ==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: oqZyO1naLXesxkROKhPhJWuO4Jf3CYjH
X-Proofpoint-ORIG-GUID: oqZyO1naLXesxkROKhPhJWuO4Jf3CYjH
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f39f61 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=DXol61RQ6zBorhFbQVEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_03,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=796 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070070
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 09:48:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214432

Instead of pushing an `llvm` sourcedir into S, specify it through the
OECMAKE_SOURCEPATH so that all the patches are applied to the topdir and
debug paths also use top path to map.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-devtools/llvm/llvm_20.1.1.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_20.1.1.bb b/meta/recipes-devtools/llvm/llvm_20.1.1.bb
index 194660fdad1f8837eedce3293d56e7251e5030b7..8719faebe38b96d161b557a469c92490fe44f370 100644
--- a/meta/recipes-devtools/llvm/llvm_20.1.1.bb
+++ b/meta/recipes-devtools/llvm/llvm_20.1.1.bb
@@ -24,15 +24,17 @@ MAJ_MIN_VERSION = "${@oe.utils.trim_version("${PV}", 2)}"
 LLVM_RELEASE = "${PV}"
 
 SRC_URI = "https://github.com/llvm/llvm-project/releases/download/llvmorg-${PV}/llvm-project-${PV}.src.tar.xz \
-           file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
-           file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
+           file://0007-llvm-allow-env-override-of-exe-path.patch \
+           file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch \
            file://llvm-config \
            "
 SRC_URI[sha256sum] = "4d5ebbd40ce1e984a650818a4bb5ae86fc70644dec2e6d54e78b4176db3332e0"
 UPSTREAM_CHECK_URI = "https://github.com/llvm/llvm-project"
 UPSTREAM_CHECK_REGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
 
-S = "${WORKDIR}/llvm-project-${PV}.src/llvm"
+S = "${WORKDIR}/llvm-project-${PV}.src"
+
+OECMAKE_SOURCEPATH = "${S}/llvm"
 
 LLVM_INSTALL_DIR = "${WORKDIR}/llvm-install"
 

-- 
2.39.5


