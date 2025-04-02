Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ECA3C3601B
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 15:18:41 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.11412.1743607119494405083
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 08:18:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=boD9L2xd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532Dd1kk023785
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Apr 2025 15:18:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	du1roVfS56aGtytSJphbe5YlhE/mNL1c4L8lrK/8DKk=; b=boD9L2xdiPFp1wfu
	B2xw4bRTIYEraX+DI29B5qfA9haJQutFdDfvqld6J4xL1k5UT3RrH9rqlBk5zWJs
	yVCqufeGh7q44mRw4Igk8+xjBQiLi3uOKUbiaZZqeCBBjOF1XYu2uDQlJSlE8IcL
	66ZILsPK4UP4zuLlhxwrOwbMKYIPuFNsvQJ87MvtvBMWfGOT3ov5uaMnk7dfL/2Z
	MdibhqFViOHL8OY7kBAZstBqOKpW0rim4Fr9s/eh25Mnw/cOKEVi6W2QOB/xwDGk
	K5tAgsymIkwRsE68QYNI+em4ntB5HDH1jVHvort9RYH0+hBFyb/vHkKgdxI/CSkj
	3ujlWw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45rxapssk8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 15:18:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c0c1025adbso1446305685a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 08:18:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743607117; x=1744211917;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=du1roVfS56aGtytSJphbe5YlhE/mNL1c4L8lrK/8DKk=;
        b=dRIBdNm+Lh1TK6xZwmAeawepp3IEacZ9CVZ5QApp6pjU4EJVXPrgyGpWzl9dQ/Nmm4
         L44jI2ol0WoniW9yiyUpipcEv3UiIy7FdLT9WNRp5yCKwDjw40NXcyVdDzddQOMDCEQA
         unVjpTKLDuqNriOvn0paDgtHdyw0d+8QkF7mwJS4O6LS4uo5NoAYyCChGBUnG4LCztCr
         LwWDTIeCHZWkRrl3xlBlTZ4XZEjtm7zfJ4+St7FZZaxwJc9FLqbsW0mgg7PZ13BimuDF
         OjIVQ3np5dbRHWZswrUzeQz0bV/bLi2vr8GncxUnXR20JsrpNF4dOQDvfl2UgoaM6wr8
         5X4A==
X-Gm-Message-State: AOJu0YwZihAxGmEvQX4xfYUrH4omyO7DtHjv/yrFuThsE2bYNiOyUQ6T
	iW2p6JnKzlsnV6YRd0ZfeZnmxzefLaHTCkPE3qEFGVYRoOWc3N7NEawGJjoAjoo7/I4tkpkIiJ0
	Kpw3FU5/MCqTls4sL3gTZuyYIXZWU4HmwUbk1KSZFjsxa2tEMV4b4/AwRue0s1pEIJ4rFUaqR5a
	Tkitth6lcTJWU=
X-Gm-Gg: ASbGncv+Oy03ilIBkTDYTopXRCuWB7rVJrR+UIyBhE84MqP2KmSJ0hH8MDHpL5MqzJO
	+9cAIZjaXXxDHoBHk8fC4+T9tHoymox69bbe5IKnfkYSBtgHtl/bsCS1sZRPFFdrp4yVg2I+h4w
	cFjv3rpG/peL8XIIXBbAQFtArloozvdCnAVljEK5/ydjV2ggc+5UFRGSnnhMA9NtJw9ZBwJgCLL
	Rdg5dChW1rTAVzTUAqY6+wH352zAEcjaw9/Jls5aFFASoZgU7Bwxrzm3IvUxOkPDkU2uO1j/1xT
	cd3+IWNzUrRaNZVNheWcXxe2fDvwUX11SG+ztnzdWsp+6aPwl+GNnYdlX2uFTr17BD8/8Vgtvdz
	115m2URPt++QVhm8kdTkwDgaHbutA
X-Received: by 2002:a05:620a:31a6:b0:7c5:3f38:9583 with SMTP id af79cd13be357-7c690890ddcmr2633208785a.50.1743607117324;
        Wed, 02 Apr 2025 08:18:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFw1jM59R+oBYKMrUjWbNkKTaNgPO9J9qJsfHWULv08HOd3BpqjIUdhvTHc6xsnKKKBO6NxGQ==
X-Received: by 2002:a05:620a:31a6:b0:7c5:3f38:9583 with SMTP id af79cd13be357-7c690890ddcmr2633203885a.50.1743607116799;
        Wed, 02 Apr 2025 08:18:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30dd35925d7sm19946371fa.91.2025.04.02.08.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 08:18:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 02 Apr 2025 18:18:28 +0300
Subject: [PATCH v5 06/11] llvm: remove LLVM_LDFLAGS from llvm-config
 --ldflags output
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-mesa-25-v5-6-ab35f021a83b@oss.qualcomm.com>
References: <20250402-mesa-25-v5-0-ab35f021a83b@oss.qualcomm.com>
In-Reply-To: <20250402-mesa-25-v5-0-ab35f021a83b@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3323;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Hlj3pD8nKP6/T3QbVP52bMJWWz38H3Tj88dnFZ1gofA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn7VVBobD3MjH67xqE3V+ih0j4UbOXdkzuZjYxS
 NJMoL9NawCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ+1VQQAKCRCLPIo+Aiko
 1W7ZB/48SgCFtieWvkg9wFDcGBPpWR9mYmU2hTpXoHrRwL7aNeqTCEy0IAQ46ScT0Nnec5SPXvR
 NFoxRZLuYY/98kAc8AGTRvknvXt7pu25Yh9bPbpDCshpiyW8EBiQ6qgaT3owvTw0YCqz+tex8CL
 U50vzKP8/4JGVlS28yHIaFtusSRhP4An3a9+N389kn3AkUPOfpebhOM5kL3DKXhlTQUpCm2MDVv
 EQcHxYiHTQ/Iu/t8mk2pFvlwTQ/nr4BVTOjcd3ot2tFNRRR1GKxaZcm2FdbS1g5Xa2oNgt/Am2v
 nGXW6CZ3obOBLJxh/3Hi9dMAVlT7ApUq84IjCETDIHCLqGSp
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Vbj3PEp9 c=1 sm=1 tr=0 ts=67ed554f cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=WrwaasjOpFmsboFgkhQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: MPD4Z_5bfCgroRtIxZ5gQOVGxxG51g2q
X-Proofpoint-GUID: MPD4Z_5bfCgroRtIxZ5gQOVGxxG51g2q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_06,2025-04-02_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 suspectscore=0 clxscore=1015 mlxscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020097
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 15:18:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214274

On native OE builds the LLVM_LDFLAGS gets a lot of extra flags which may
depend on exact build dir and as such be inappropriate to binaries
shared through sstate-cache. It is not possible to override this
behaviour in llvm-config since crossscripts are not being used for
native builds. Ignore LLVM_LDFLAGS for native builds.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...g-remove-LLVM_LDFLAGS-from-ldflags-output.patch | 34 ++++++++++++++++++++++
 meta/recipes-devtools/llvm/llvm_20.1.0.bb          |  2 ++
 2 files changed, 36 insertions(+)

diff --git a/meta/recipes-devtools/llvm/llvm/0001-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch b/meta/recipes-devtools/llvm/llvm/0001-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch
new file mode 100644
index 0000000000000000000000000000000000000000..2320399d5f7de44cf9cc4269d180c097c1b4a616
--- /dev/null
+++ b/meta/recipes-devtools/llvm/llvm/0001-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch
@@ -0,0 +1,34 @@
+From caff2482f786dd7fd5f1f46f2667f7ed847cb8f8 Mon Sep 17 00:00:00 2001
+From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+Date: Wed, 2 Apr 2025 17:05:17 +0300
+Subject: [PATCH] llvm-config: remove LLVM_LDFLAGS from --ldflags output
+
+On native OE builds the LLVM_LDFLAGS gets a lot of extra flags which may
+depend on exact build dir and as such be inappropriate to binaries
+shared through sstate-cache. It is not possible to override this
+behaviour in llvm-config since crossscripts are not being used for
+native builds. As a OE-specific modification ignore LLVM_LDFLAGS for
+native builds.
+
+Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+Upstream-Status: Inappropriate [OE-Specific]
+---
+ llvm/tools/llvm-config/llvm-config.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/llvm/tools/llvm-config/llvm-config.cpp b/llvm/tools/llvm-config/llvm-config.cpp
+index d5b76b1bb6c1..29f7c2eaa419 100644
+--- a/llvm/tools/llvm-config/llvm-config.cpp
++++ b/llvm/tools/llvm-config/llvm-config.cpp
+@@ -529,7 +529,7 @@ int main(int argc, char **argv) {
+         OS << ActiveIncludeOption << ' ' << LLVM_CXXFLAGS << '\n';
+       } else if (Arg == "--ldflags") {
+         OS << ((HostTriple.isWindowsMSVCEnvironment()) ? "-LIBPATH:" : "-L")
+-           << ActiveLibDir << ' ' << LLVM_LDFLAGS << '\n';
++           << ActiveLibDir << '\n';
+       } else if (Arg == "--system-libs") {
+         PrintSystemLibs = true;
+       } else if (Arg == "--libs") {
+-- 
+2.39.5
+
diff --git a/meta/recipes-devtools/llvm/llvm_20.1.0.bb b/meta/recipes-devtools/llvm/llvm_20.1.0.bb
index c1c4138e8cc16b8b4ddfa3355a6141b5fede569d..e164dc54f4cb7cec92689b3c646aef83c0f0bbd6 100644
--- a/meta/recipes-devtools/llvm/llvm_20.1.0.bb
+++ b/meta/recipes-devtools/llvm/llvm_20.1.0.bb
@@ -32,6 +32,8 @@ SRC_URI[sha256sum] = "4579051e3c255fb4bb795d54324f5a7f3ef79bd9181e44293d7ee9a7f6
 UPSTREAM_CHECK_URI = "https://github.com/llvm/llvm-project"
 UPSTREAM_CHECK_REGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
 
+SRC_URI:append:class-native = " file://0001-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch"
+
 S = "${WORKDIR}/llvm-project-${PV}.src"
 
 OECMAKE_SOURCEPATH = "${S}/llvm"

-- 
2.39.5


