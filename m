Return-Path: <rob.woolley@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 772C5C5DF66
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 18:06:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1250.1786989958665904347
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 11:05:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=I5fzy/3n;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=26897b1a80=rob.woolley@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HFU1472456684;
	Mon, 17 Aug 2026 18:05:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=+DCkTrkRgdHbPHt9AJxvSfyRejlPfK3e10eKWi/xtw4=; b=
	I5fzy/3nXNNQjGAqwWDUujiaGod/NX5H/+Oo7MH0o/aaH5X1KKjhsJlzQup9AA+Y
	nQKWZpK4sGmNPojbbN1wTr7oP8ARqFFlsHVT8apvAgiOTEMEIP696YF82pgyhwub
	wJYlL9F/w1pQ9lbdLf39HmfB8uveBkdY4WBveBoTGKZcoFNh9wH1t9ygfcxm7pKS
	HgHODvt/r6YEWRbex6y7bBb2vQi7eVDX52DLaeVY6u2F3IFLLEk4o4ftsLdLaqZU
	LvIzSw2go187p76TxXEP4+XNIGKaFNb/9krft/VH6as8d7dZXa/s0vMxs+2pjVs9
	JB6yK8ETRl0xOmduN67FXQ==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g2f33ud14-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 17 Aug 2026 18:05:49 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 17 Aug 2026 11:05:48 -0700
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 17 Aug 2026 11:05:48 -0700
From: Rob Woolley <rob.woolley@windriver.com>
Date: Mon, 17 Aug 2026 11:05:45 -0700
Subject: [PATCH v3 2/3] boost-build-native: Add python-numpy-include
 feature
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260817-fix-boost-v3-2-499c48e4fa56@windriver.com>
References: <20260817-fix-boost-v3-0-499c48e4fa56@windriver.com>
In-Reply-To: <20260817-fix-boost-v3-0-499c48e4fa56@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Rob Woolley <rob.woolley@windriver.com>, <alex.kanavin@gmail.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEzOCBTYWx0ZWRfX0x/JpgNZYX7d
 aQoWaP0kXQXpYAuQdGrEbpF1jGzdG+P9jP/pktXLW8m7RQ9DPB25QJwbUcxVfri8p4Wi5If72/3
 qlAUpwSND/nNKYCxg3IfnYhq0RpejBqpiX/sH7ECzrvZMnIObFKVVZF4aR4VJrSTmGRUoQqI6aS
 BVUtn6hHaqQJWUUH620xS9TEyacKoE2pSHFmhWoNhxEk6AfGtYYNG/LlVthzUL6TKWQImXvLtrF
 YLEV5UdYq2kfdh6o5t65nm7X9oIbx6EpZ7aDt/cg7fxAFVIt3jiDntzLFOLGCIcdsnCq/LiV0Yc
 yGTSu8yJ72oA2Y7zFbu740W7s71PkGxSP7LBqmbEmYOTVVi3AQLhD155cQTypGQwHN79xMLrdgC
 VgC55gBAyxffXBwJR0y+77pgm4S5JlejRR3uUb3TA95/DveMgcdCFrxxkPmiKD5PN6JfoHf4fSK
 0H0Z78VFywlD3RnNhEw==
X-Authority-Analysis: v=2.4 cv=JYuMa0KV c=1 sm=1 tr=0 ts=6a834d7d cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=CPqo0L0Xm0Efp08AHI4A:9 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: sxfDsezUTOxItw4sQOqcNNRqDCdwKjYP
X-Proofpoint-GUID: sxfDsezUTOxItw4sQOqcNNRqDCdwKjYP
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEzOCBTYWx0ZWRfXwCg11fMXnI+g
 1vLawZB2pUot9S+ThdMr9r2lGrpDsnybcMtHscX7+hCOr+/E8JFuTZH14h6LgSvXyxDUjtmz6le
 xKdCc1gdEcC4u+9B+b74ifSFcEkHmDRZnZ6W5P7ZNu48yNRk+FQo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170138
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 18:06:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243630

The Boost python.jam file attempts to import the NumPy module to determine
whether the Boost.Python NumPy extension should be enabled. This approach
is problematic when cross-compiling, particularly when NumPy includes
native extensions built for the target architecture.

Introduce the new python-numpy-include feature to avoid probing for NumPy
at build time by allowing the include path to be specified explicitly.

This enables BitBake to provide the correct NumPy include directory from
the recipe sysroot, eliminating the need to import the target NumPy
module from site-packages.

Signed-off-by: Rob Woolley <rob.woolley@windriver.com>
---
 .../boost/boost-build-native_1.91.0.bb             |  3 +-
 .../add-python-numpy-include-feature.patch         | 74 ++++++++++++++++++++++
 2 files changed, 76 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/boost/boost-build-native_1.91.0.bb b/meta/recipes-support/boost/boost-build-native_1.91.0.bb
index c276cf436d..5babd02448 100644
--- a/meta/recipes-support/boost/boost-build-native_1.91.0.bb
+++ b/meta/recipes-support/boost/boost-build-native_1.91.0.bb
@@ -6,7 +6,8 @@ SECTION = "devel"
 LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
-SRC_URI = "git://github.com/boostorg/build;protocol=https;branch=master;tag=boost-${PV}"
+SRC_URI = "git://github.com/boostorg/build;protocol=https;branch=master;tag=boost-${PV} \
+           file://add-python-numpy-include-feature.patch"
 SRCREV = "85252c9d6a3817daca23ddae94ce16c7be4d2c12"
 PE = "1"
 
diff --git a/meta/recipes-support/boost/boost-build/add-python-numpy-include-feature.patch b/meta/recipes-support/boost/boost-build/add-python-numpy-include-feature.patch
new file mode 100644
index 0000000000..12d7bef73c
--- /dev/null
+++ b/meta/recipes-support/boost/boost-build/add-python-numpy-include-feature.patch
@@ -0,0 +1,74 @@
+Add python-numpy-include feature
+
+The Boost python.jam file attempts to import the NumPy module to determine
+whether the Boost.Python NumPy extension should be enabled. This approach
+is problematic when cross-compiling, particularly when NumPy includes
+native extensions built for the target architecture.
+
+Introduce the new python-numpy-include feature to avoid probing for NumPy
+at build time by allowing the include path to be specified explicitly.
+
+This enables BitBake to provide the correct NumPy include directory from
+the recipe sysroot, eliminating the need to import the target NumPy
+module from site-packages.
+
+Upstream-Status: Submitted [https://github.com/bfgroup/b2/pull/611]
+
+Signed-off-by: Rob Woolley <rob.woolley@windriver.com>
+
+--- a/src/tools/python.jam
++++ b/src/tools/python.jam
+@@ -65,6 +65,9 @@
+ # installed in the development system's default paths.
+ feature.feature pythonpath : : free optional path ;
+ 
++# Declare python-numpy-include as a free feature accepting a path
++feature.feature python-numpy-include : : free path ;
++
+ # The best configured version of Python 2 and 3.
+ py2-version = ;
+ py3-version = ;
+@@ -866,21 +869,33 @@
+     # Discover the presence of NumPy
+     #
+     debug-message "Checking for NumPy..." ;
+-    local full-cmd = "import sys; sys.stderr = sys.stdout; import numpy; print(numpy.get_include())" ;
+-    local full-cmd = $(interpreter-cmd)" -c \"$(full-cmd)\"" ;
+-    debug-message "running command '$(full-cmd)'" ;
+-    local result = [ SHELL $(full-cmd) : strip-eol : exit-status ] ;
+-    if $(result[2]) = 0
+-    {
++
++    local custom-numpy = [ feature.get-values <python-numpy-include> : $(condition) ] ;
++
++    if $(custom-numpy)
++    { 
+         .numpy = true ;
+-        .numpy-include = $(result[1]) ;
++        .numpy-include = $(custom-numpy) ;
+         debug-message "NumPy enabled" ;
+     }
+     else
+     {
+-        debug-message "NumPy disabled. Reason:" ;
+-        debug-message "  $(full-cmd) aborted with " ;
+-        debug-message "  $(result[1])" ;
++        local full-cmd = "import sys; sys.stderr = sys.stdout; import numpy; print(numpy.get_include())" ;
++        local full-cmd = $(interpreter-cmd)" -c \"$(full-cmd)\"" ;
++        debug-message "running command '$(full-cmd)'" ;
++        local result = [ SHELL $(full-cmd) : strip-eol : exit-status ] ;
++        if $(result[2]) = 0
++        {
++            .numpy = true ;
++            .numpy-include = $(result[1]) ;
++            debug-message "NumPy enabled" ;
++        }
++        else
++        {
++            debug-message "NumPy disabled. Reason:" ;
++            debug-message "  $(full-cmd) aborted with " ;
++            debug-message "  $(result[1])" ;
++        }
+     }
+ 
+     #

-- 
2.49.0


