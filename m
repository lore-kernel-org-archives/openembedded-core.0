Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0781BC3ABDD
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 11:01:22 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.18059.1747738875468837694
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 04:01:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=EL8jzlbW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K8vnqc006697
	for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 11:01:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=NK/eWyMjWOWg1KRK3XJNRWEG6xsZATxz6fM
	L+RNh5k4=; b=EL8jzlbWVBrVyGpT1xRDzmOK5yX5HD7QE00hx56SFn2rGFgSr5Z
	htjxn3cbWKxx8iCj3qATmS9DQ5Q1NCSsTEhqH3vUui8rjD5Ps/+0oI/tRGFEnGYB
	UcE3+5EwHBM2cgnucPnnGaxLfo8q+MU0EZDb3e3jRephcSCIZMNe2t4n9DE96Tzt
	Qfjliw2LHz1Ey8ypsHeiKdUerYkWgVrC9cuIqdZ8X1qW+5orZT+3beJNBShcGUTB
	+IbnYJLnIEuSZyzF0RvzKt8Kw2tUQ9yrr+YXFdovX6Dknfi3gkkQ9b87z+AE/onJ
	Z8sFF8Qz6/eBwbAJIZaIneaj6rPRjm598Fg==
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4qcbr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 11:01:14 +0000 (GMT)
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-85c552b10b9so476554639f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 04:01:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747738873; x=1748343673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NK/eWyMjWOWg1KRK3XJNRWEG6xsZATxz6fML+RNh5k4=;
        b=WWlPm9Y+A6mF+5/5ubUuhfa5oXCeFM57wo0zW24jl4cS8xVM7og6DjXqDd8Q6NhCbH
         nuNa2I8ev9GxBDM+YQZO6zyFBfTcwIuLPQyTUGQEEh88tulSyLEOtfpxK6UGFLKNvbIh
         RylAn9hloi7yEmYKdeRls27dY0UuF257fNJ2/nuc6V4gmBfjoM/EwbLNemwJOELghRSV
         EEnYW6YulJuiM9Jc2ct2HXiSgRwOrgB+Ckq5IYA6+CAwBhbmuAufAPqV+GReLktFJfIp
         EfK381rMTF0hac21cuj5LWc000PtDH7bAd8OK7O4fyf0oHpg5+WEMZAhAoo/aWEasI6M
         Fa4Q==
X-Gm-Message-State: AOJu0YwVIiDf44UBd0bcnlfqjOYVgpx4ysI0tD7p5wKUPCiWUa6bYAZE
	k4/FMXi0n9MNUj9eZZxie6yzbjeiWP5unH7aTFONa1y7orkw/lB10JWSpvFzf6Z4ujWDDAe1oFJ
	e8bwazEVoes9tj3V+9kVyiWWY2gtOyYc2mjR0Z/WJBQPmaNiRjCuTNJ4F7P3tVqKWmdb1UUVXF7
	7TtVYX0z02Ovzo94k=
X-Gm-Gg: ASbGncvmUADRU71JbyHYpLo33ynfrFq/6lQb/xtgkhsyH4CJEIFlAeJJSIDo/zExHar
	lRsR90/ApQhtTLnCW7GsQ1F9ueEuH9ZIji+H+8y3SN9Mxsz80oN9hSg2Le4Lw9GfadgzJdhJTw8
	EMSOTBnhoz4uVDrokcBwc+S/2uGCjf/xFCDl9UJwL2XN1wWCtf8+srbMrTMJ4a3GmfYSx6vmMbg
	kFX4orcLWc6reN44ZNosv0WUefH0jVMO/uicj13GRHOFGW3vU7fxFbuxzVKTUtMW+uKerrSFPnO
	F3/QkYJQ2syC1aOItdGn9nsjePoSCLLtf8n8ABDeFydvd55Vbmfsez3VReU+q1pV/ZrkTTQoXds
	joOCY27SB5HnETl7x9E7q4o/E
X-Received: by 2002:a05:6e02:1909:b0:3dc:76ad:7990 with SMTP id e9e14a558f8ab-3dc76ad7baamr46548465ab.15.1747738873094;
        Tue, 20 May 2025 04:01:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF91i02BOmIK7VZDTGNSW+Gbhmnqlpl9WEOxaVXJJ6ZGh4QGauNOx1tF3jtknQqnQI4cqTjIw==
X-Received: by 2002:a05:6e02:1909:b0:3dc:76ad:7990 with SMTP id e9e14a558f8ab-3dc76ad7baamr46548185ab.15.1747738872660;
        Tue, 20 May 2025 04:01:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e7018102sm2276924e87.124.2025.05.20.04.01.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 04:01:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] clang: build-depend on spirv-llvm-translator-native
Date: Tue, 20 May 2025 14:01:11 +0300
Message-Id: <20250520110111.3893998-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 42KEtQnHULULIZEgwz-0lIcM0tLwYMK3
X-Authority-Analysis: v=2.4 cv=C4bpyRP+ c=1 sm=1 tr=0 ts=682c60fa cx=c_pps
 a=uNfGY+tMOExK0qre0aeUgg==:117 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=RRiqRlwsFlGyxeVV_SUA:9 a=61Ooq9ZcVZHF1UnRMGoz:22
X-Proofpoint-GUID: 42KEtQnHULULIZEgwz-0lIcM0tLwYMK3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA5MCBTYWx0ZWRfX6EYcT3sMjTWk
 YJBcDZ/LiHehrDA0aUmKWkZhjftC4/fUpPVNamAFILod9IFlbG68b+6xI2BHjgzVKgJfCzofGsD
 u46QvhUs3Zlr2XPq8g7j6FbU7XLmOclnxKkBBucbJR23Zkv/WdfGtUurorVqIVXRpsbafOU0qNY
 9UEKYkweS3aZXh1hXTDSYmQJ4GUKLbYiHD095ZrflMRw8xg5qVTiMx+YdIY8MnIoHi09z6w2xGo
 BCKh1cVePd5x0+BE5fo3fkDFds66HopTewzFo0Z0vG0tplRUZWYoPX1SISN5Gj2UrltM9wSKPte
 EyspsFt5ZLK4LxponJXUIB+PoIP0W+ZEHbd5i1KMpqOvQ7gVtM7KXhg1AuyNUd6mL0Mq9zlUk/9
 qhmzj6KL7EmKnJxuAOAJknQm6MTekrH4Q4MfFvvDp/7WaZcmp0ehP7TS73up7avCGFoyQGG1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=801 spamscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505200090
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 11:01:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216902

Building of spirv-mesa and spirv64-mesa CLC targets (which are required
for Mesa to work) requires a working llvm-spirv tool (provided by the
spirv-llvm-translator-native package). Make clang build-depend on the
corresponding recipe in order to be able to build requried targets.

Fixes: 4178fe97371b ("clang: split SPIRV-LLVM-Translator to its own recipe")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-devtools/clang/clang_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
index b41b700292c7..bca8c7fa877d 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -206,7 +206,7 @@ EXTRA_OECMAKE:append:class-target = "\
 
 DEPENDS = "binutils zlib zstd libffi libxml2 libxml2-native ninja-native swig-native spirv-tools-native"
 DEPENDS:append:class-nativesdk = " clang-crosssdk-${SDK_SYS} virtual/nativesdk-cross-binutils nativesdk-python3"
-DEPENDS:append:class-target = " clang-cross-${TARGET_ARCH} python3 ${@bb.utils.contains('TC_CXX_RUNTIME', 'llvm', 'compiler-rt libcxx', '', d)}"
+DEPENDS:append:class-target = " clang-cross-${TARGET_ARCH} python3 ${@bb.utils.contains('TC_CXX_RUNTIME', 'llvm', 'compiler-rt libcxx', '', d)} spirv-llvm-translator-native"
 
 RRECOMMENDS:${PN} = "binutils"
 RRECOMMENDS:${PN}:append:class-target = "${@bb.utils.contains('TC_CXX_RUNTIME', 'llvm', ' libcxx-dev', '', d)}"
-- 
2.39.5


