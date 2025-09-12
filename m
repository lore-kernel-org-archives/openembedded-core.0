Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC86BCAC58F
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 15:26:06 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.19604.1757690756433999488
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Sep 2025 08:25:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=pP57LWk/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fDES017446
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 15:25:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/bqgCQDgWVr
	oOPYo80ExTBf9qU6YWwEl9jKbeaxkztU=; b=pP57LWk/t3wkpYnCLZjhV1UjEIT
	SBI9vqs/Gx7xY12QeDSaeFsVqFbtCVOeCgZ9E2pr74DO/9QY4LGFzh9uVBhB0EHi
	662TtdQ9K6Dwiur1KHKWNPdmf3SeLYGwh+ZMmSseRo6Ozx1OSaDXRehrsplMAeCy
	v4BjUPBI6naGGuw73e5UepDAD4MIRn9hzMpsiAcp9H3if2T/+dL5HnsgQkRzuuAB
	vtwHFRmIgSV/os+RPqRDLP2N4MwEj/YP31wGVKmI7bbnlKC250dMw8OPTstTKQ84
	obIbZMf34G2ai8DT1Zk7czqSTgWF7x+tkIfm5pF1uKnwXg01XMT2X9clMLQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8v4nf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 15:25:55 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-76d3633c86dso11954316d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 08:25:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757690754; x=1758295554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/bqgCQDgWVroOPYo80ExTBf9qU6YWwEl9jKbeaxkztU=;
        b=g+iueMrJlHZ+dvl9ZXr70prZfs5abFlitqlcRr6ZJXZ9Ro9dxuSArzpUc9oBx2y/uT
         605T4bgdn16vQjpAwLbIO0eNnUcwxkDjMjH4nflsvI0I7Jmxb52B70cq4bPwJYD0enbz
         MdfpS6CDby8AQKoccukR7cYSB3BxNokRBdWJy3cRfDuxVT+nLFxhpfOUW1UNKsYESgMX
         q1BX99LJPY5unJAOca5V+Yee+ljJUvSzi+rejDLeRyrvkOXzFLs7RaWH2ahQUZIRVurc
         XZ5DWckWVayAbMWahzAypPl0UYkDr4qf40k0Ltpt+TksvPMmmCn9jsODxHlWKpdRvPb7
         FBvg==
X-Gm-Message-State: AOJu0YyXJ9FhftXnWautit/zG0CUbq0eaiKyrLAMEuXR3HNd9OHjpi/L
	unb/TnsWaogSQ2vtUo+dE9oc/DJj/onb4CBYieLb1mci5Up4GDtaLJjLX/Qi2wxsqpVJ1sh6owL
	D82tBPI0304kwV9PbbIFqpMAPMrO8WbCtnPAQfsh1XMjd+YKQm08oZL0XfhVpEeLebyMwzussRc
	axV3MaDcVLdvrUKCo=
X-Gm-Gg: ASbGncvXDHEGrXqpN4x5Lkwr4S3qqFWsxAsUe0tnYqH1Sa2RAvzFHOBtRMG24V6c5JM
	29pJZ96bA/JhYRCEtjaAiSkGuz9RAHzhXUCjxKAdybkyjMca4XdoW4MbWLuoNiChhZ62QJIGpXV
	y6x2V+1VTtnsPdJMnBdmayYJGNNOv7AjkP+tvL7QmkJbHnlxtcm/AL8hjykaaYd5PUHJGDUXQay
	Nu2XKv/S9wsVDeWh22gfG9UBMpKc7uShVW7KTcrc2vOSdhAUH+Zm3kN4qNGG/rnVyud8Bj7gqUG
	OssOq7eogXVtpEuwnKJsqWd1r4/V54gEZ+Gst79062Yi3ECHxsh/EggvUEvVjLh43E4WY0F7aOM
	+A/mNpsxSQz2lHU/Kh6Edr89cCYWaySpsrM5PLHKrm0sbxlYSu7iI
X-Received: by 2002:ad4:5e8e:0:b0:721:a9d7:297a with SMTP id 6a1803df08f44-767ba92fe9fmr42307326d6.7.1757690754126;
        Fri, 12 Sep 2025 08:25:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkOwkRRg5UMYZgDFL3CsLodXWO+48xLXYVLebR5CnFYdWOwED3z+Xzu93cUAqOwrYhGFcfPg==
X-Received: by 2002:ad4:5e8e:0:b0:721:a9d7:297a with SMTP id 6a1803df08f44-767ba92fe9fmr42306686d6.7.1757690753525;
        Fri, 12 Sep 2025 08:25:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e5c3b62c9sm1223465e87.27.2025.09.12.08.25.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 08:25:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] clang: enable GPU backends for the opencl DISTRO_FEATURE
Date: Fri, 12 Sep 2025 18:25:48 +0300
Message-ID: <20250912152548.730100-3-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250912152548.730100-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250912152548.730100-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfX2mXpx+waPWRs
 HxG9+bS/eSsthTqqB6x2V+oWDOZeim2ulL/x3cx1so8f96jwzIbB7S9GReX1kKeOoOECKqKGd7Z
 qRLUGQbzbzKesiyWqUtjporDyjPYHoTdG5Nta8sA8L6BqublACTJ2OlEpD4kanHGWhE3yjncQVg
 KiceRoOOkpozjOk+1+nRppW+XBYmvjsldgeoEAcSg7XlXATul7ELn5Kgi32Bjqj9odNSt7W1Pu5
 osZymRVqE2Nzpq6LvZmTHxzjgKNSvJQvb3IqTPa6xMp0D9h/8dl/l9h+jnIVzatJoRbDPeenrkb
 VuuBXPDa0h/TCl1XD4gKdGX1AnT80Fg7xXevs1smeTlNBXz6dPYqmom0PLdCbl0YphoZf+olE3g
 DI/FXjMf
X-Proofpoint-ORIG-GUID: D-_5ALfh3iZBChAt8FAHUU4eoaYxPXA4
X-Proofpoint-GUID: D-_5ALfh3iZBChAt8FAHUU4eoaYxPXA4
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68c43b83 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=4lsCOXvnqLZq96RfNPsA:9
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_05,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 15:26:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223322

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


