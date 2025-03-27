Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B82FC3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 14:20:50 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.48941.1743079040115451455
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 05:37:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Pjk+jaJi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5jFCv010898
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 12:37:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fxx1fa5HZBr
	rEZSe2K5qu3SgXGL/0e99fwkiFL3qFrc=; b=Pjk+jaJiJfXxc/yo/nQuvHuQ6or
	xqGeQmjxqs72zclsOSXrl11YspYOZZLKyWL68/0sVbw/DMmTBkFu/lbhFZXpkTS6
	/TiOHdu+SPm2XNHkbJ+7zQbemWyK2shC7Oxv22tJHQ3oX7BN3bctx6AyqHxF9N40
	WVSIsNPfTA6QAQFnzgC/Fc8AGYI5NowJMFECHD1Y+VyVvsa1oKw/IwC41XA3dVW3
	Kf0Iq2ZuagsS7Wq+esHL3Yw+U34OBjv0YD74JxdFHhKK7F7UN0PA54xNNqjO3HzC
	WNgZmLO3lPI/KULag3usveDg7PhylUj+nMrF/55mCHnNssj3QGbZm2lkchg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45n0kqh4g0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 12:37:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5ac559cbaso160486585a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 05:37:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743079037; x=1743683837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fxx1fa5HZBrrEZSe2K5qu3SgXGL/0e99fwkiFL3qFrc=;
        b=ELRi0MwE+6XWvu45vQ5JviHCLxgP6QH46pdtTAeEgNZ45JaCUP9DaqssCymY3JUjyd
         D3dUvmAGE6n1cBpbZnO4aC3xkjxlib37ZTgcN8g59Z1qACUc/niqRiJ23pWtL68+/HA8
         SbnCbIMw9vyIPKjYWtVN2+zJnzWZ1y1xQaE1Xz/g4b2MZFGF3tnW+LSaGoyeunk6y9yz
         NOboyzG7Ln1z5tk2LfJot9e96k++orHiFK2+2TCVBCryslBReGgVktLGFherjvMNyPB1
         +Jmqrxh0gpef2wr5evWFxsU/16zgLSxab0orbYPMJ8i/E1f66PKD3XPSFNLwxyt0LN1l
         iCuw==
X-Gm-Message-State: AOJu0YxT5+2i3yEzMWobzrTfcsdDXFkJJCjH6o6c9Qw+BdzXc5BzBNnN
	nZ2BDuFr3fjfiOyhwaaXuEzyC/E8Ajsa7aDuBK4eC2J30I1WzX7wwXpFkgEjx6fb4e4GSrn8qlG
	RAwRgPPRJpoujVuWGYXmzwqKM1vWWMf3m4VOTdL7wy5ic++9Ffw5mUTnUPZ6IHEoxwfK0RCubD1
	rNSgh/MKThFZE=
X-Gm-Gg: ASbGncsF2kzh0ipC3g/LnD/LHtkhLJwaY3j7kWJaLQmnsON/KNyxDbuz/M3Lryis9SY
	JeGX+PHyuhcNbuKhY9iW0d6I/v4Wb3J+WOHkRlshWpUzBGu44tyK+OE9s9ocVUJ525kFfELTf7o
	ooX6LYflXwBMrKsYNbAvIs9CvQlZA+DaA/MMTGgHD19kTF3P8fYxBUaMZKd+vvDOocXOq0GVoYC
	lpQ8kVutDqdL4ypNI/fxPyoyrsrfevx80yDB8yP4Xv0n8mMHKwEjY1PAguyr+cq/3mrL/2CF4DK
	FiMLsMaOdwRVVIzoNXlLRknkr9wDycaA3LnTgIioOEVn8fKkPY2SFAEX1FihZENroflT+ZMdkoU
	b2GDZLM83LXZf6hspesmlpCv0+4z+
X-Received: by 2002:a05:620a:29c9:b0:7c5:5f38:ba4b with SMTP id af79cd13be357-7c5ed9da8bcmr500669085a.10.1743079037162;
        Thu, 27 Mar 2025 05:37:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEskDuXwLx8xL/ko91Sz2vfvzQzPko6KqtXJAa1GkQYeWn1lg7fEUpkcv2IdBI/yi4dIVsylQ==
X-Received: by 2002:a05:620a:29c9:b0:7c5:5f38:ba4b with SMTP id af79cd13be357-7c5ed9da8bcmr500664585a.10.1743079036611;
        Thu, 27 Mar 2025 05:37:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad65121e2sm2053600e87.235.2025.03.27.05.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 05:37:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 4/8] llvm: import YOCTO_ALTERNATE_LIBDIR patch from meta-clang
Date: Thu, 27 Mar 2025 14:36:57 +0200
Message-Id: <20250327123701.3906604-5-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250327123701.3906604-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250327123701.3906604-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: jhLv9aKulIpACg5BKUf08_Pb7tmWH7eT
X-Authority-Analysis: v=2.4 cv=FrcF/3rq c=1 sm=1 tr=0 ts=67e5467f cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=IvTj1HvjAAAA:8 a=pGLkceISAAAA:8 a=mnq_9Jzftx32lQRVvlkA:9 a=NFOGd7dJGGMPyQGDc5-O:22
 a=kmyLcwvAnC_t3PsnBtKb:22
X-Proofpoint-GUID: jhLv9aKulIpACg5BKUf08_Pb7tmWH7eT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0 impostorscore=0
 mlxscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270087
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 14:20:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213744

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


