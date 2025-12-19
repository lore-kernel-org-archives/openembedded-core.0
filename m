Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2C54D74964
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 08:31:07 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12954.1766133057815041379
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Dec 2025 00:30:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=jhV3ps5A;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=b9aj/hvX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4cCNE3559228
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 08:30:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1GrySeQXiRi/rq18N/zbQedojXL71C+e04e
	P/ur6ysM=; b=jhV3ps5AXiISIJ3CKk6ncEANvWDhNUt7Q89jQ62/n/HJvcwrGBZ
	lFpKg9fesgKZp7frmF/MhmJHoY/gkz3j+aRDC8SIN96MnTy+gahWuIh/7dC4nsGt
	kdW49U/vesA4g2zZOFsGnj0MH+wbODviRt44XZjWEMbD1sNNiq8NuobGMjs9gHro
	srBnXIuy64cGUfTndmaMlVcvnIW8hROt9eYgWJyMGE3aa0m9K0l2Kfmu/T+elDGc
	VRjWhpIxR438iWXa+F38jGGMMcAPeiK/Z48QcYwsB12/bWRS6qOTCi925NAgt45T
	p0dFTQlmesHnkBJwsCiCIg5Pk/AQt9T1DCA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2c9wbx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 08:30:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed6855557aso53925101cf.1
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 00:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766133056; x=1766737856; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1GrySeQXiRi/rq18N/zbQedojXL71C+e04eP/ur6ysM=;
        b=b9aj/hvXuRtPsb/tzADncaCitTLArJ7KjXIslejIM5kDGt99n9AnTz6Yd4rdUQK/bk
         qFG9LZ7Kggn9y2dYtoMSHVXMR0kicGALO6ssHnWFGmyYE5Nofdjg38g1Uvrg6SCyWKyi
         eZLKdhFsP9dliaOfzCyIifNNk9mxR6MlGuczUeMRVdlZFTaF8lJrxZB4vTJJDLsd8QnG
         t424HvetO56PWdEmS+A6Wio5TPPv5Hp4Jcxb4cVxVmnupyw18PCw6YgfRIAk3pIKl7M7
         EFW7Zn1FQeQ4Ntt+H9fbSzap+15uh3uJC06PYSLATiSPHDmpQtLpAsLGsTXVGHqOUuzc
         0Pig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766133056; x=1766737856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1GrySeQXiRi/rq18N/zbQedojXL71C+e04eP/ur6ysM=;
        b=u8t654VmM8I2DZsMkTiEqXBDABVlV9FhIVEI6g2o17z9n9daz/vc9xE3DuCi7UdJ7Q
         wKoMgWKSGJsWB23h6u4y7s0guCrMmJmiw6u2RKRJRiuyHBDwS3JyG7wWDd8u0DKI1h9L
         fgnl03j1Q4tOB/4GM2rLtnDwghWXQ0XfL/EYx8b6keHI/WoeH7z4L4qB0jp3+tIYL5ni
         9cWdzY8d1qD3yQuUJp5ogPb7HBiePAzaZ/ZTBTxy4RMD0eTW9TFs5yk6qB+u9NzI8aH7
         guhdGUiN7BVMOy4BbfRh2ZMZWFGtv8kvuFktuaw9lfuijAsgA5ZvJ8z66E7Q6u88M1r9
         TCkA==
X-Gm-Message-State: AOJu0YzoBqn9wCct2oDudlqwgusL6tUCI0QAFYqJ2iNkqH/tuRDltoHr
	K+zUJ33PNKY82Ec2l/8LNuCQpyOzHVbqdNP/SS2nxkXt2Dsu5NWexAit1XOvAAyziULGr4e4n1/
	XmFaZ4lWzvBJV4juaF9Y6MAoBJ+ONBNhTc79o5kdi8anj2we5SxBY61WYWVpigGrTclGVNVMQVd
	CKMT5GEdsdwrRS8U8=
X-Gm-Gg: AY/fxX6htdudZ8NkWcdDDfjxYLhmD8w6Uga9Bxc5xZ29CHBXGoHUnXHM/W4no0Dgh5a
	adLnxRAc6lk0nYYKs/IovJ72xlZCyvo6Fp/erxHb8WnFlCRKdZ8lgGM7i8NP8PkvseQC6DVB/Ih
	tSMhQkiWSMq6kV19kFKl/aW61WqA7PlP8wAV0AqQVXovIUeYHWlBYg8SUfAZJ4IWQBODlGy6il0
	O/OnwXA/BArg480I8b5DrSoJs/M/5vhMND1fYcqvnzPMTN6K3QmXgSugOdt4+a9h55nxjrd1HB8
	GDEA52nlCt6B+XMjypEaiNlFYkYH558l5LCSvULoh2xK+jb1RiXkPCS+2u00rzUjpOL174vgsw1
	ADxpNbPsN8dEy3gRw61dbvj/Pe6FBO1IQzhA9ogegiPFpBL+ELm26rsonmobWdaWh79KZvev7LA
	JtIF+7DmlNDQsKsY7Z/LHf9mM=
X-Received: by 2002:ac8:7fd6:0:b0:4f3:4b53:a914 with SMTP id d75a77b69052e-4f35f3a051dmr82167071cf.9.1766133055675;
        Fri, 19 Dec 2025 00:30:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/QBZdLb23kG1SQ5/qDcHLjQMiNiWnx+FzIwSzDC+lD6oOqYJ1r0NXMiu4K3xUBy5mfPJmvg==
X-Received: by 2002:ac8:7fd6:0:b0:4f3:4b53:a914 with SMTP id d75a77b69052e-4f35f3a051dmr82166751cf.9.1766133055089;
        Fri, 19 Dec 2025 00:30:55 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18618d07sm517022e87.62.2025.12.19.00.30.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 00:30:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libconfig: upgrade 1.8.1 -> 1.8.2
Date: Fri, 19 Dec 2025 10:30:53 +0200
Message-ID: <20251219083053.1783572-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cpSWUl4i c=1 sm=1 tr=0 ts=69450d41 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=fTjkepNWUJW63skwb0EA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA2OSBTYWx0ZWRfX3qLoCrU5IJLh
 o0pRMnMKsS9NdfrPxz5Hp1gaI8PdNgVAsC80jhnTqapZqYlwgUuqvWb1WvBRG2E/HR2Awxv8lRA
 /wmp4lUHkcb3+l2wtoMUAlFlqOEy5xIW4LWFEJ/dlKkE95RJrmhb1oBGYxi68yY8ueS5BLTeyZi
 Mj/RYT3TUlp8ytyP8rr307L8ZQaknzwDJcgCJDDqfAfqNJCONFZsbgGXkhxGDmihfv9wgtoyHbe
 +nr26U6xktsA01Vyurg1GmczeMwE8UsuBT6BsEuRvSfiqg4SiH9Y93Ckh9hswvkPSvU7UBCuFWo
 Z27p9YZ9G9U+VRXMNOCXWqsb83r1o4v4ur0U/I2U0duvitJGh8A8HfKA3iIz4CXjZDm8vyr/SBb
 BGXIp7VAc85bgyChf9d1mSRGgJAVLbFb9kVToBMIJNBMRE4SBkswuXRkCy0W4etR8T5ECwTdlYk
 rj+qaWS+/KGFWEEWXOQ==
X-Proofpoint-GUID: iDy104WtprvziQPYEKvzZ_UFxrn8FYTC
X-Proofpoint-ORIG-GUID: iDy104WtprvziQPYEKvzZ_UFxrn8FYTC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 08:31:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228199

Drop the patch merged upstream.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...Add-missing-dependency-for-scanner.h.patch | 33 -------------------
 ...{libconfig_1.8.1.bb => libconfig_1.8.2.bb} |  3 +-
 2 files changed, 1 insertion(+), 35 deletions(-)
 delete mode 100644 meta/recipes-extended/libconfig/libconfig/0001-Add-missing-dependency-for-scanner.h.patch
 rename meta/recipes-extended/libconfig/{libconfig_1.8.1.bb => libconfig_1.8.2.bb} (88%)

diff --git a/meta/recipes-extended/libconfig/libconfig/0001-Add-missing-dependency-for-scanner.h.patch b/meta/recipes-extended/libconfig/libconfig/0001-Add-missing-dependency-for-scanner.h.patch
deleted file mode 100644
index 6e6a9419aeb1..000000000000
--- a/meta/recipes-extended/libconfig/libconfig/0001-Add-missing-dependency-for-scanner.h.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From b9afffcee8809e47d0564f3d6376de724ae820ae Mon Sep 17 00:00:00 2001
-From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-Date: Wed, 29 Oct 2025 22:26:16 +0200
-Subject: [PATCH] Add missing dependency for scanner.h
-
-Automake doesn't handle the header -> source dependency for lex
-scanners. This might result in the out-of-date header or it not being
-rebuilt in time. Provide a rule to make sure that the header is built
-properly.
-
-Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-Upstream-Status: Submitted [https://github.com/hyperrealm/libconfig/pull/277]
----
- lib/Makefile.am | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/lib/Makefile.am b/lib/Makefile.am
-index 9ef984323af3..bd5d3dbe5aa3 100644
---- a/lib/Makefile.am
-+++ b/lib/Makefile.am
-@@ -36,6 +36,9 @@ libinc_cpp =  libconfig.h++
- 
- BUILT_SOURCES = scanner.c scanner.h grammar.c grammar.h
- 
-+scanner.h: scanner.c
-+	@if test ! -f $@; then rm -f scanner.c; $(MAKE) $(AM_MAKEFLAGS) scanner.c; else :; fi
-+
- ## Build mode: C-only or C & C++
- lib_LTLIBRARIES = libconfig.la
- 
--- 
-2.51.0
-
diff --git a/meta/recipes-extended/libconfig/libconfig_1.8.1.bb b/meta/recipes-extended/libconfig/libconfig_1.8.2.bb
similarity index 88%
rename from meta/recipes-extended/libconfig/libconfig_1.8.1.bb
rename to meta/recipes-extended/libconfig/libconfig_1.8.2.bb
index 37c2504b0168..6e08a7b04b89 100644
--- a/meta/recipes-extended/libconfig/libconfig_1.8.1.bb
+++ b/meta/recipes-extended/libconfig/libconfig_1.8.2.bb
@@ -9,9 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=17c8e32f0f72580cc2906b409d46b5ac"
 
 SRC_URI = " \
     git://github.com/hyperrealm/libconfig.git;protocol=https;branch=master;tag=v${PV} \
-    file://0001-Add-missing-dependency-for-scanner.h.patch \
 "
-SRCREV = "47ec93c588f534d20f6ee8704d2a2cec339db7b7"
+SRCREV = "a42cb47c1526a4f2ed025fcbb2289863375bc898"
 
 # needed when we modify grammar.y with patches
 DEPENDS += "bison-native flex-native"
-- 
2.47.3


