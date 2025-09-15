Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DE2FCAC597
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 23:26:09 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.6734.1757978765394009717
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 16:26:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ZHG+4jMF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58FEb9Dd006882
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 23:26:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/bqgCQDgWVr
	oOPYo80ExTBf9qU6YWwEl9jKbeaxkztU=; b=ZHG+4jMFSkm9+K0Ls7+wIrqRIfe
	/i3cGdzAe7Kd1aQvFn/1G+j5G5YayYKoLNsouhi3pcF7SpTC8FmUupmbRpo6w6l0
	V5wRmNgfaAlcwIqxio3u5FzSAb0aUPXEXTTDfUaKTR+ZlHANT+MKwxcuvYpXWAGP
	Ki7/qr7ttxDKpXX2H/uvKNalLSuI/oVK57r24TSdJw3eeQG9DvHj665FwO6HmJgX
	pQ3DhzdyPVRXTQkg2kMtPe95PyZbyxpKtBexu9l1aeIguLeKeUZX7Qv7LL+nHWI1
	CndzY2qelSUb1wqIp1IdsO7WoQcSEEbnkid+7KlvYplvlf+xciBMMdsxYJQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4951snpfw4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 23:26:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b345aff439so126960921cf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 16:26:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757978763; x=1758583563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/bqgCQDgWVroOPYo80ExTBf9qU6YWwEl9jKbeaxkztU=;
        b=nBLvltnHegDph119GkTqv+iVc6yKBx1ZgsNC+c1FEtoZ0RDBiRSQU5psQG2rvwUqo5
         hZXCAjnLBAAZ21izqSm5TgUEqnaSF5eLOcONFzWtjtHifj2H0h6qlYEfQSrng68evB2v
         AYWShdgs14xYePCu6BJQaEPkH4ga/NBzt3cbpDUGiCnjq73ddNkMUYj3h1xoVShNeehM
         7c2PSez0sZI+JeWu/KWtiQzBC23r/NP/k4vd8CgXMyBA4ej6rSxA8iFifGARPrve63Ym
         dZpwpaXp1Y522ck8D0gUyd197jX4PT4ZKsloXJdz8rOYAdvoHR6zBvsjuGeAUC8oX1QQ
         oZ2g==
X-Gm-Message-State: AOJu0YxWatjwBYLEmDBGG3C05C4y1W9Bvq+a5CiegTB/g0jl1glE6JqN
	bXdXzOxrk88OTjKovSZW7p2W3kRF7yg+GddNwMTMNTg3cPhGQf5M0/yEld23VhRDKQmI53dgClX
	OzXwnQEH4A6s2sCI6HLi91pfDZ4+P1frMy95LK6ahZFIoau68ebujgIkd/FKJluogvk0drPQodO
	JQVoJIilheB+MAUjM=
X-Gm-Gg: ASbGncuUagOd3ZbN/5QgkSwCccR8Px+pl3iQMCjB8QCEBwm3bfCbA44HF6q+KPLFAdE
	Sk7KdQtxUlQDwQyN8Ygj8KS1GMrvIF4si9BINIZjyXdRoq8IXG8sDkzZlVixdykQajwNsI3I2cZ
	k0N6LkW7cu8Ln7Ic8Lnpz/WWTqvEH57W6KKKl6fbgh8jhbxHKaOoBYaxbMzddg5BCIjhSQvppVo
	SKuHf4w2NEYBwxpWfWGCfRVgXiF3ceT3J281pgPuZqfbk7oO7I+SqXJwJ/yh8db7o87SQ9j9fOU
	iat9k8Q05orJjYt5tNC/N5rKOOoMwLGUJTHQ0nIXsyBlo0aG4lcSFPrs3WRHcIpnHgV1sVaK8pQ
	lACY+2D5RM1jfs4sNebif49UI1jf2LX6nrvDApYqRJ/C/qB4Sgt0O
X-Received: by 2002:a05:622a:1827:b0:4b7:96ff:631a with SMTP id d75a77b69052e-4b796ff6f29mr128099551cf.73.1757978763250;
        Mon, 15 Sep 2025 16:26:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElRnMD+fC2Dt+g017i0zZyZOCKuR4T74wQOy1Q73nMyf97m/lH6R71Wma1HovcEpqDgBSfgA==
X-Received: by 2002:a05:622a:1827:b0:4b7:96ff:631a with SMTP id d75a77b69052e-4b796ff6f29mr128099131cf.73.1757978762724;
        Mon, 15 Sep 2025 16:26:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-356cf10d013sm14137961fa.29.2025.09.15.16.26.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 16:26:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/2] clang: enable GPU backends for the opencl DISTRO_FEATURE
Date: Tue, 16 Sep 2025 02:25:57 +0300
Message-ID: <20250915232557.536762-2-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250915232557.536762-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250915232557.536762-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JO87s9Kb c=1 sm=1 tr=0 ts=68c8a08c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=4lsCOXvnqLZq96RfNPsA:9
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: qQuPptAB0jmJiSF4ctKTSgdoXxnUCTRf
X-Proofpoint-GUID: qQuPptAB0jmJiSF4ctKTSgdoXxnUCTRf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDA0MCBTYWx0ZWRfX0+XWyuJIWmrg
 WXuDS3XADc5bNp2umqpuk8mt0Qqbai+F19i+EfI5Ei1YXIIhMKQio7wrU/B57biLenCnFEuHIV4
 9dwiAFZtYjoaNDCKN8J+doBuuXaQG7Jnn4oybIIrDwPzNdzDArKlNxw+HSTvYarOJ3fFkt31BPx
 x/YdxaBpA82gSfN7sHYIepnwlKyEqhJHHCMKpZMzvD0cbpPGlL0Id8PrXUPkhH/0gqkgFG64JhY
 5OA37uQYJ/qWu/8uA7+IJHCGNPn88keBhe7GZeuP/hzPwrQNBcFO1qoZXlzAqSRNzeB1wAxId9l
 gs0WdEO7v/VoQopX+Yy6Mwk+ZIzxi3gwlRCzliRYCmjzk1UCqiQdzjeYRmibbPU7KtAS62RLk+g
 ohvry4S0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_09,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130040
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 23:26:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223510

Clang gates enabling of several backends (AMDGPU, NVPTX and SPIR-V) by
the GPU-related distro features (opengl, vulkan). Now as we got a
separate feature for OpenCL, enable those backends for the OpenCL-only
configurations.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-devtools/clang/clang_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
index 0009a95628de..4462ab9712d9 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -73,14 +73,14 @@ PACKAGECONFIG[libclang-python] = "-DCLANG_PYTHON_BINDINGS_VERSIONS=${PYTHON_BASE
 OECMAKE_SOURCEPATH = "${S}/llvm"
 
 # By default we build all the supported CPU architectures, and the GPU targets
-# if the opengl or vulkan DISTRO_FEATURES are enabled.
+# if the opencl, opengl or vulkan DISTRO_FEATURES are enabled.
 #
 # For target builds we default to building that specific architecture, BPF, and the GPU targets if required.
 #
 # The available target list can be seen in the source code
 # in the LLVM_ALL_TARGETS assignment:
 # https://github.com/llvm/llvm-project/blob/main/llvm/CMakeLists.txt
-LLVM_TARGETS_GPU ?= "${@bb.utils.contains_any('DISTRO_FEATURES', 'opengl vulkan', 'AMDGPU;NVPTX;SPIRV', '', d)}"
+LLVM_TARGETS_GPU ?= "${@bb.utils.contains_any('DISTRO_FEATURES', 'opencl opengl vulkan', 'AMDGPU;NVPTX;SPIRV', '', d)}"
 LLVM_TARGETS_TO_BUILD ?= "AArch64;ARM;BPF;Mips;PowerPC;RISCV;X86;LoongArch;${LLVM_TARGETS_GPU}"
 LLVM_TARGETS_TO_BUILD:class-target ?= "${@get_clang_host_arch(bb, d)};BPF;${LLVM_TARGETS_GPU}"
 
-- 
2.47.3


