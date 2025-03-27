Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5AF3C3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 13:55:39 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.50537.1743083729734071692
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 06:55:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=TbQ+CdLu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5jFYo005975
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 13:55:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fxx1fa5HZBr
	rEZSe2K5qu3SgXGL/0e99fwkiFL3qFrc=; b=TbQ+CdLuQmITsnBajZu9nPVMvJZ
	7y2atASvHV0mxHX/XfvgUE//gFbdM9N9Nz6Gv4OL4twSHMfSlp2KquMYyi1YXRtz
	kBKPUe63lBUrbt19ss20CeXQ6g2p0j1qgug9PSmyXk/AS9OhZ0fpYGwy6DoN356L
	XOW8tkwfk98+dranSxxjKYCIXt2EGJHqOxlofJQYsmOyeV015uYdeNq5i+8zclI8
	/42SRssB46bkINrALKX+RNHZV8uE2gxCPJWo8Ch2iPbzA/nHoFdH6cjA3mdOXSQw
	4OUP0mo7Apbk2R6rPU3dG3sIgGatBveJ4biDFsnBJgeiUgFqo+Iad9zflYg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45m7nf5fcc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 13:55:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c548e16909so117961885a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 06:55:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743083728; x=1743688528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fxx1fa5HZBrrEZSe2K5qu3SgXGL/0e99fwkiFL3qFrc=;
        b=TBBkwz/+iua3bc3pHQ521SERpQpIN2M8kZUh43Zn99JRseRRw5hUmHuEf+KKDorrEu
         Pj6OjNlNFLbWKxuRHok/9ZYCYM3lR0nZY1gBGWy2rLQHGC3f5/QsIFPIbx+kfsyYTwxk
         MRdsna71GX6oqr6yebKPFzCnSmpYE9yAVQBc7WPmX6OcndgWYmKcin0kGeFE2c8RfJas
         cSghl0k9dct9BliZjGtNdMvsEtgHsGKlllG30vkKmeYoVHRg3Bo01sMZYddNeC6+5Y4D
         hmzpuVq5EqoCkWajSS8Xh8fZ6H5ZcLfYSSIEC/I2hcwoTWSJwFS2DrkPyIc6mM9iK9xN
         noFg==
X-Gm-Message-State: AOJu0YyVlpyFVUaJY1Tl45D4G53QYHBbTo5gD9ZJYSXIomAcuf9RFtL7
	Nr2SWzHcPRVzQuqcZmWf4I3mvb8bGLVJho6pxMX8xq2F6TxD+gulZ0+VUOzVcLIwDQdVsi61QE1
	qXy2FXvLXGgzccNYKFLdEKhPQL4I/hDc43yBr+S8KCFATGxGaLCP4zxquyd+yePlaBQ873MAcPH
	Or7BOw0ukMTq0=
X-Gm-Gg: ASbGncvbxnVBkjmm+ioZI9Da4rj6+nc/NIkjly9fZB7p66QwEkCxak5GGvOqk3/hdbs
	3yv3KEA1lBsSejMhcYlJiKKaEq5zK6bWywA2/KkYFOHQmFmg6pJ9F0e9RZWayDSfAP6zeDw/tJ7
	HvgidNJ/CO9MQs8G8JjW4hg/XaLpYBIsHB4gLWO3Y6JJ69aqCyP/3WZvmWF1an3xbZ8dkw5Dgo5
	F3096QuaiwN80JfgCvS4qu8tXx+k3FENCqIymm+vik0cpWq3aGY9z9BrwYjLiFOZH9DL6IdI9C1
	1BDVT5cDOxqBsK0FNxfTYj0+c1L9/2aznr2+C1ISWnkcqZ6mljzD6m/zC6y3YVZmydC4aUPv3Bs
	IcpjpFYpQllKy70kFAcL/QvJVx8Ov
X-Received: by 2002:a05:620a:4707:b0:7c5:4738:8a11 with SMTP id af79cd13be357-7c5eda127e6mr609486685a.27.1743083727610;
        Thu, 27 Mar 2025 06:55:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkxb1k5mfY5fI9aXQo5nAV12C4RwKH6mSAx+ZYrNaOidMJcqlyKe0dtd9B7xkGfyWL9E3i4Q==
X-Received: by 2002:a05:620a:4707:b0:7c5:4738:8a11 with SMTP id af79cd13be357-7c5eda127e6mr609481585a.27.1743083727010;
        Thu, 27 Mar 2025 06:55:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d910e70sm24288271fa.105.2025.03.27.06.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 06:55:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 4/8] llvm: import YOCTO_ALTERNATE_LIBDIR patch from meta-clang
Date: Thu, 27 Mar 2025 15:55:16 +0200
Message-Id: <20250327135520.3920189-5-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250327135520.3920189-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250327135520.3920189-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 3wDfzUoOHnpPgJzob-JEP0nS1mtTmz8I
X-Proofpoint-GUID: 3wDfzUoOHnpPgJzob-JEP0nS1mtTmz8I
X-Authority-Analysis: v=2.4 cv=IMMCChvG c=1 sm=1 tr=0 ts=67e558d1 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=IvTj1HvjAAAA:8 a=pGLkceISAAAA:8 a=mnq_9Jzftx32lQRVvlkA:9 a=PEH46H7Ffwr30OY-TuGO:22
 a=kmyLcwvAnC_t3PsnBtKb:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 mlxscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270095
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 13:55:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213732

Cross-building of mesa requires us to be able to provide target-specific
value for --libdir.  Update the cross-environment llvm-config patch from
meta-clang in order to allow overriding the --libdir output.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...-llvm-allow-env-override-of-exe-path.patch | 41 +++++++++++++++++--
 meta/recipes-devtools/llvm/llvm/llvm-config   |  7 ++++
 2 files changed, 45 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch b/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
index 29266013ecb1..e598a9e5d49b 100644
--- a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
+++ b/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
@@ -8,16 +8,18 @@ return the libraries, include directories, etc. from inside the sysroot rather
 than from the native sysroot. Thus provide an env override for calling
 llvm-config from a target sysroot.
 
+Add YOCTO_ALTERNATE_LIBDIR and YOCTO_ALTERNATE_EXE_PATH env variables
+
 Upstream-Status: Inappropriate [OE-specific]
 
 Signed-off-by: Martin Kelly <mkelly@xevo.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- llvm/tools/llvm-config/llvm-config.cpp | 7 +++++++
- 1 file changed, 7 insertions(+)
+ llvm/tools/llvm-config/llvm-config.cpp | 25 +++++++++++++++++++------
+ 1 file changed, 19 insertions(+), 6 deletions(-)
 
 diff --git a/llvm/tools/llvm-config/llvm-config.cpp b/llvm/tools/llvm-config/llvm-config.cpp
-index d5b76b1bb..6c28c34bc 100644
+index d5b76b1bb6c1..a739f0d8dbea 100644
 --- a/llvm/tools/llvm-config/llvm-config.cpp
 +++ b/llvm/tools/llvm-config/llvm-config.cpp
 @@ -246,6 +246,13 @@ Typical components:\n\
@@ -34,3 +36,36 @@ index d5b76b1bb..6c28c34bc 100644
    // This just needs to be some symbol in the binary; C++ doesn't
    // allow taking the address of ::main however.
    void *P = (void *)(intptr_t)GetExecutablePath;
+@@ -325,7 +332,7 @@ int main(int argc, char **argv) {
+   // Compute various directory locations based on the derived location
+   // information.
+   std::string ActivePrefix, ActiveBinDir, ActiveIncludeDir, ActiveLibDir,
+-              ActiveCMakeDir;
++              ActiveCMakeDir, BaseLibDir;
+   std::string ActiveIncludeOption;
+   if (IsInDevelopmentTree) {
+     ActiveIncludeDir = std::string(LLVM_SRC_ROOT) + "/include";
+@@ -366,12 +373,18 @@ int main(int argc, char **argv) {
+       sys::fs::make_absolute(ActivePrefix, Path);
+       ActiveBinDir = std::string(Path);
+     }
+-    ActiveLibDir = ActivePrefix + "/lib" + LLVM_LIBDIR_SUFFIX;
+-    {
+-      SmallString<256> Path(LLVM_INSTALL_PACKAGE_DIR);
+-      sys::fs::make_absolute(ActivePrefix, Path);
+-      ActiveCMakeDir = std::string(Path);
++    // Hack for Yocto: we need to override the lib path when we are using
++    // llvm-config from within a target sysroot since LLVM_LIBDIR_SUFFIX
++    // maybe different for host llvm vs target e.g. ppc64 Libdir=lib64 but
++    // x86_64 Libdir = lib
++    const char *YoctoLibDir = std::getenv("YOCTO_ALTERNATE_LIBDIR");
++    if (YoctoLibDir != nullptr) {
++      BaseLibDir = std::string(YoctoLibDir);
++    } else {
++      BaseLibDir = std::string("/lib") + LLVM_LIBDIR_SUFFIX;
+     }
++    ActiveLibDir = ActivePrefix + BaseLibDir;
++    ActiveCMakeDir = ActiveLibDir + "/cmake/llvm";
+     ActiveIncludeOption = "-I" + ActiveIncludeDir;
+   }
+ 
diff --git a/meta/recipes-devtools/llvm/llvm/llvm-config b/meta/recipes-devtools/llvm/llvm/llvm-config
index 5e4ded2da5bc..d9d994a2032f 100644
--- a/meta/recipes-devtools/llvm/llvm/llvm-config
+++ b/meta/recipes-devtools/llvm/llvm/llvm-config
@@ -9,6 +9,13 @@
 # Provide ours from the environment instead.
 
 NEXT_LLVM_CONFIG="$(which -a llvm-config | sed -n 2p)"
+SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
+export YOCTO_ALTERNATE_EXE_PATH="${YOCTO_ALTERNATE_EXE_PATH:="$(readlink -f "$SCRIPT_DIR/../llvm-config")"}"
+if [ -n "$( echo $base_libdir | sed -n '/lib64/p')" ]; then
+    export YOCTO_ALTERNATE_LIBDIR="${YOCTO_ALTERNATE_LIBDIR:="/lib64"}"
+else
+    export YOCTO_ALTERNATE_LIBDIR="${YOCTO_ALTERNATE_LIBDIR:="/lib"}"
+fi
 if [[ $# == 0 ]]; then
   exec "$NEXT_LLVM_CONFIG"
 fi
-- 
2.39.5


