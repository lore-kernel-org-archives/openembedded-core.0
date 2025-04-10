Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E7B1C369A9
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 02:55:07 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.25735.1744253706462953482
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Apr 2025 19:55:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=CWbV5jMw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HEN5n032317
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 02:55:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5HJcaMFJSwT4eIdh9u5ZiT7/jhxEj2oPM6ltbxl5x44=; b=CWbV5jMwJJr/84Z+
	RoSP6kx/cZH4kh8R3tKVopZtTgBhjmaHFQLDj4bym5G9CO1Yg8IrMqQMmk+JLWDR
	C6pIGsaq9EQVJWTZBApobUi7Dz3SV+BnQeGeNgwZKxDLaZjr1uRUvSpuia2gdZxj
	e6u228KSi9Fi0Fo4vIYNHy0JxQ2wloSxc+Lnrz1UR1dR2jh7n/PXJYh8Y+oFs+Yz
	5EVQ/DznOoNK8hxWUUXZwAB1u87lE4CosiAg/6czUYT4jPwIjb1TPri09jHyCUbn
	Aup4cabjIxAU35L2N4VeihDcywy04tNdHxTyjzuxeWOsg7HZPfCX3Ox/Ok9Hzpqo
	asTVyg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbedffj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 02:55:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c760637fe5so87753585a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 19:55:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744253704; x=1744858504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5HJcaMFJSwT4eIdh9u5ZiT7/jhxEj2oPM6ltbxl5x44=;
        b=jD7K6vDSCe9YslH0fZhQQtrZO5RZ/szcHpiyel9IdcARBrK/zwkAQic9F6QCRtWoU0
         p9QsAkXXxloEJvsBYlaLLbGZN6xDBFVzQmmeROq/wVI67z306Q5yrEFNLkqPFjJgYhx+
         gTbNXc40YbYU1KbjI1ce/jIbXu0gY7Yn0GYeIUL/0/zMoeV+o/HByBA7clZkzN8hsInL
         bkUJrnFPm3UxvIZfioI+YCHy3ccQcKvOZ8zEYG6lrU7fb042qziMVmx0SbIdjKqPgTtm
         LHNPsCcK5rIdA7jFW3mZsbhSesHHR54d9bf1UkX5TjCYuwQ3f6DOOA72kylblReiXOdV
         RBcQ==
X-Gm-Message-State: AOJu0Yw4Brw4aF72+3ciC3MW+l+70ETnHJzA6lcjW8gVArHJDWDC0qgp
	Vb3WAg/RJCMPPgPur1q5q7+Qo/nqIsJ4wq7hYod8UNedXVj3qlYsC+rI4PvXxm8dHSPf9fAgGAI
	5WLfGA2DCWSSZZdSqGQxMcyEToVPIbPgaLIDMo1mT0XkgxcMfbLoyYZfBjD+HKC0G/tsu9JxxjQ
	qDrpbo8LDyUm0=
X-Gm-Gg: ASbGncsoO7hirYo4aOWE0W1BNCgwBB3jW00InNpcUbV3GJQky3ByObvztnvzaHGdiJh
	I6ZaJf27WLHaqgIa6ixx/Xw3xww73hqRbioHJjSycx3Sm6ZcCoKTqynPMNAPp//+RhU+TpLxzqa
	4dbSQxSSXdJbXhPUxIcV9NzoYOMdX8hoE37VKIh86zcmvf8RsooWk6tQlXIf5yeR2WF3bqyQAEn
	jpA/Gd7NAmqqp5Y72zG1nHQSwAbmTW6vYQTne8O18CHo8xEqADm6raKh/+rJLDsyx6htM888tkY
	X8uAat1W90puBsKw9U32CABcftSkruOg6H3Ky4Up3PG4XHAeUr9wz5Y4ea7je3kkfxr6T1btlps
	UHMwad8ckmBN8jrAuQfxTakHL
X-Received: by 2002:a05:620a:3946:b0:7c7:93ae:fe56 with SMTP id af79cd13be357-7c7a76d0401mr145569485a.51.1744253704223;
        Wed, 09 Apr 2025 19:55:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoOEgY+9wlVeA7AKConOiNmot1LTBte7TVfqyoPYFASEVOX4JOG00e1iXU6KkhQ4Xkpaxlhg==
X-Received: by 2002:a05:620a:3946:b0:7c7:93ae:fe56 with SMTP id af79cd13be357-7c7a76d0401mr145568085a.51.1744253703891;
        Wed, 09 Apr 2025 19:55:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d123197sm24032e87.44.2025.04.09.19.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 19:55:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 10 Apr 2025 05:54:45 +0300
Subject: [PATCH v7 06/12] llvm: remove LLVM_LDFLAGS from llvm-config
 --ldflags output
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-mesa-25-v7-6-59d715c66e19@oss.qualcomm.com>
References: <20250410-mesa-25-v7-0-59d715c66e19@oss.qualcomm.com>
In-Reply-To: <20250410-mesa-25-v7-0-59d715c66e19@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3323;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+gxJKfRSnv3UH2cvcNI+hzuaDpPxkXATCwLaG9OR8K0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn9zLxtIidv3jb6+UCHDdhBozJfvLl8hHLpA5/U
 q1atVn50PmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/cy8QAKCRCLPIo+Aiko
 1X4/B/4iwnGZL/uBI8fBFI83C5D/D1nvexQ6rDxs3PQXRmkdYAvLeW2YkKCQjuC0ZnFRy4t4LVx
 CXzcub0QwutnxLGWOmt3fGpeyCZ0tOKNIeXlYZL1A6JJIxu61fa7nvOfC+3GBovcpefnDcC0tTv
 t+IbkT8T+rC58GmV9K0EuoshaDMLyq5QDQsoVG5FMCdYg7iwBg2b5MIK2Y35tQH1qauR26J5Lif
 51enbpEdJDXmAdSsGRGWp2uAtpiw3QVbZvIpmalkU65TpeHuMJDC+Ac1aLfTgfhuWWn1W56RF5q
 Un4P9Y00gp6vhK29kf3263xbxR9Deiai1SWq8634TSN/rF62
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: -pIbj3CZRwozC9z-xSM2VFYlVk6kJaDi
X-Authority-Analysis: v=2.4 cv=T7OMT+KQ c=1 sm=1 tr=0 ts=67f7330a cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=WIpSu2wNbg6c4CAHoA0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: -pIbj3CZRwozC9z-xSM2VFYlVk6kJaDi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100021
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 02:55:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214608

On native OE builds the LLVM_LDFLAGS gets a lot of extra flags which may
depend on exact build dir and as such be inappropriate to binaries
shared through sstate-cache. It is not possible to override this
behaviour in llvm-config since crossscripts are not being used for
native builds. Ignore LLVM_LDFLAGS for native builds.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...g-remove-LLVM_LDFLAGS-from-ldflags-output.patch | 34 ++++++++++++++++++++++
 meta/recipes-devtools/llvm/llvm_20.1.1.bb          |  2 ++
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
diff --git a/meta/recipes-devtools/llvm/llvm_20.1.1.bb b/meta/recipes-devtools/llvm/llvm_20.1.1.bb
index 1ea94327161a8002453ac1aa79d7661d4da72499..b95473c88b64961cb6ae2f4ace14aac4600cf98e 100644
--- a/meta/recipes-devtools/llvm/llvm_20.1.1.bb
+++ b/meta/recipes-devtools/llvm/llvm_20.1.1.bb
@@ -32,6 +32,8 @@ SRC_URI[sha256sum] = "4d5ebbd40ce1e984a650818a4bb5ae86fc70644dec2e6d54e78b4176db
 UPSTREAM_CHECK_URI = "https://github.com/llvm/llvm-project"
 UPSTREAM_CHECK_REGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
 
+SRC_URI:append:class-native = " file://0001-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch"
+
 S = "${WORKDIR}/llvm-project-${PV}.src"
 
 OECMAKE_SOURCEPATH = "${S}/llvm"

-- 
2.39.5


