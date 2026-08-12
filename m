Return-Path: <rob.woolley@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74D87C5AD5A
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 20:35:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4711.1786566899240164262
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 13:34:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=U2o0NhNH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2684cb9286=rob.woolley@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CK1tmg3622333;
	Wed, 12 Aug 2026 20:34:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=WZafNF8lk5D14DxVRnTcepVcEk0QBTqIT6/cJ6VP9Xk=; b=
	U2o0NhNHAP28DICGElRW6oFIld4euArJ8Nmbg7PxmYRIFC61jh8MUbitgX7egoBx
	/X7ZHn8L/yBzYmJ6NCqB72q1XFHzSNzT83MLPK55cLD0ZJ39bP1BOKiCTTqsUEtY
	16oeEjDDgHMh+j6hbviEOkApm7BU6y3+0QuPlm2vjFhdEn4RueL9Sa+nKAKE+tlz
	shrSRHiHRlkGIVBEddm+34V6zrXx+U9MPlRCA+d+Hwc09ldCvddvo8ZlVnpDCDfc
	qsqUsx1/SSe8bnxIpgTkcvUxNDZgeXqz8Lc6MJLhea5zoY6WyvWh5IRULhEz5ywh
	YRHIXf4lQM2Kn1jLXSgfkw==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fyshwutfy-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 12 Aug 2026 20:34:57 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 12 Aug 2026 13:34:56 -0700
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 12 Aug 2026 13:34:56 -0700
From: Rob Woolley <rob.woolley@windriver.com>
Date: Wed, 12 Aug 2026 13:34:32 -0700
Subject: [PATCH v2 2/3] boost-build-native: Add python-numpy-include
 feature
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260812-fix-boost-v2-2-cbcb65f5e186@windriver.com>
References: <20260812-fix-boost-v2-0-cbcb65f5e186@windriver.com>
In-Reply-To: <20260812-fix-boost-v2-0-cbcb65f5e186@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Rob Woolley <rob.woolley@windriver.com>, <alex.kanavin@gmail.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=IYK3n2qa c=1 sm=1 tr=0 ts=6a7cd8f1 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=NEAV23lmAAAA:8 a=CPqo0L0Xm0Efp08AHI4A:9 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE2NSBTYWx0ZWRfXw/N2Pnce7fy8
 NDwIigKBO4evvrPWji7kHn+w9X4E9sMOVbIh5hOx+nLLgz0k1YY7mnS1G3VKkMEEg6avwE30Tc7
 uT5q4tSU5Y56tJz62Z9Q3MUgAff/m2VspH3Ev6EXKNQXWRH1xHeG
X-Proofpoint-GUID: PCPZlrkOBG7SA5Hgp0ki5Z_3SmRUE4iD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE2NSBTYWx0ZWRfX6KChuXkD4S+d
 pKlmEeuZyUFQdM0W1tFqq5vJlvMwCgjMdJvTJKo7yV3JjQZ+9aHO2lLh7+GhVW7rVzYGdgWs+Kb
 AQhw4xS876jtofJzKmFyL+HZ5eMlsqztOZflH7cK6XDLqcu/SWr+tGsLTIbKebPdtNPLc32uMii
 6QtQX1gPZZn9g5X4KvuvZo07AWCLI+zV1ox6LsJE5kboamSciK4/4ztsJmLXjDt/UGLvTRgm0WQ
 A8lpY/Ry+G0Ym1Lui0TFC3dsp4Nhz2HEgdW5mLm9FW28uboYXasZleTB6n4prlC367WI+QqH4YP
 PmVmnzTlFhuWA714D9mYxJvZogPqAKMyFZ8lGjp6dt5ArYn1/SEy3dtdngH/Afk/YSW4GL82U+3
 mSHf4hYmVIKLj0IAYbwKIJhvvHxoUYcysoVwuEXbgnK24Xxn9Eosap7OughovNhelwCHjvOjUW1
 +9T4W/ANpbri68cr3Ig==
X-Proofpoint-ORIG-GUID: PCPZlrkOBG7SA5Hgp0ki5Z_3SmRUE4iD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120165
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 20:35:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243302

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
index 0000000000..708a5a43f7
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
+Upstream-Status: Pending
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


