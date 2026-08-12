Return-Path: <rob.woolley@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2AC9C5DF65
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 20:35:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4691.1786566898934846597
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 13:34:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CCkpb4mB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2684cb9286=rob.woolley@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CK1tmf3622333;
	Wed, 12 Aug 2026 20:34:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=raSj26PE6
	CE8T+f+/4l7t6pQilCTJfwhaMRq5mUL76U=; b=CCkpb4mBbJRVTZ2f8wEh95s+/
	MBZ8B8btcmI1aw77Op/6DLRFb+4DbeRStJxzxj3XLCH8GmIJrV7AnxsvwxWErJeF
	ZYC9zKs01kKh9xGxZ+eCKNtcsMqwig2GmneUS8wclRe2mRVMVP0vpqRAntfn1mmi
	E+wSg0HXFXLdbx/0PlcGgdbt3gNO8mNlP8+SBNCM/T+luqMmgG4PtloZWAEhwzpy
	jwA1prlNQ0lVlrFJkAudsMFzekvdQMfCO5YbKMrBp6D5MQH3ni0oe0gwOBFg+tok
	GAKdiuN+Q1/Uav6qNkrr2AHreJyNJNXHMKXxmlHn1xv94ZU94KFfVc0emJnJQ==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fyshwutfy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 12 Aug 2026 20:34:57 +0000 (GMT)
Received: from ala-p2exch01.corp.ad.wrs.com (10.11.226.101) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 12 Aug 2026 13:34:56 -0700
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-p2exch01.corp.ad.wrs.com (10.11.226.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.45; Wed, 12 Aug 2026 13:34:55 -0700
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 12 Aug 2026 13:34:55 -0700
From: Rob Woolley <rob.woolley@windriver.com>
Subject: [PATCH v2 0/3] boost: Add Boost.Python NumPy
Date: Wed, 12 Aug 2026 13:34:30 -0700
Message-ID: <20260812-fix-boost-v2-0-cbcb65f5e186@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANbYfGoC/02Nyw6CMBBFf4XM2pq+JNWV/2FY0HaQMZGSFquG8
 O8WdOHy5J6cO0PCSJjgVM0QMVOiMBSQuwpc3w5XZOQLg+Sy5obXrKMXsyGkiXWuVeIoDmidhuK
 PEcu4tS7Nl9PD3tBNa2A1ekpTiO/tLIvV+3UF/+tmwTjTaJSxymtl9flJg4+UMe5duEOzLMsH7
 Z9NrbgAAAA=
X-Change-ID: 20260806-fix-boost-fca31915ebc4
To: <openembedded-core@lists.openembedded.org>
CC: Rob Woolley <rob.woolley@windriver.com>, <alex.kanavin@gmail.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=IYK3n2qa c=1 sm=1 tr=0 ts=6a7cd8f1 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=rrsz9OxQvGTA-Fht71QA:9 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE2NSBTYWx0ZWRfX3EwVxqUBt3h9
 Z34TLHQ9clsJVy6eSc5Foh51gOQieJDH8Kmew6Giyky85Iawhyb/773AT796mAoXhsseeHAo4pt
 w81Wa8Ya/yYT+KcY1dV4h/LjKfbThj4Uw8NKn73ah+AKpMbdvnkt
X-Proofpoint-GUID: YcB6hPyprguG70ZyV-BM1w4QFBpJlN5g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE2NSBTYWx0ZWRfX5zvVi5EOvbzO
 SXMfPp3HZVk6iQ0b2FkrGChnPPFVbNLEpRn5XHH8P6j6mt+oT4EWpfxUyZgvfzsJikInGUagFuw
 9xLeHr+viAKChl9qmUPUXhqDfQ9xyomaYxUckspbyTMikFOjnNPjjttxxSlcnSskG76EuBXFjX3
 5I+AhcvxCnaA1i9qcJwfNCqG2wzvSqVPD35u1GSSdz6OlkXz3NmIi8+oXeHbbDnPKYnt721IRuy
 ww3pO0frvtI6dg0vNvIm/SqWPrSnY7xovN5oCP1o71Zj7pQNe3TP/RyJY2Cdv0ZX853k6dxqCuQ
 HDtOYls+tO51hfPTuFJqtPf73JTIwpwvJQCPdyEQHCAsXmaHdbfb6pcb51x0f/Xc9Kjq8dJSQAM
 qJmR3q9R9umFJsITivfSdzftEQo097Ha1K0PTLqbHueM7TfUOY9Pjo4g1mkNcYZFrK7wLX3eroU
 LAA7tIYAIdjzSlfvATw==
X-Proofpoint-ORIG-GUID: YcB6hPyprguG70ZyV-BM1w4QFBpJlN5g
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243301

UPDATE[v2]: I replaced the python-numpy-native trigger with a Boost b2
feature that skips the probing for NumPy if the numpy module's
include directory is supplied.

This was necessary as NumPy has a C extension which can't be safely
imported when cross-compiling.

----

The recipe for Boost does not support building Boost.Python NumPy.

There is a mistake in the variables supplied to test for numpy. A new
PACKAGECONFIG option is also provided to allow it to be optionally
enabled.

Below are the commit messages with additional debug information:

boost: Use python3-native executable

    The Boost build system executes Python in the compile task to
    import the Numpy module and print the include directory.

    We must specify the python3-native executable in the user-config.jam
    so that the python.jam can execute it properly.

    Without this change, it specifies a non-existant python executable
    and reports "No such file or directory" in log.do_compile.

```
$ grep -C4 "running" temp/log.do_compile
notice: [python-cfg]   interpreter command: "/ala-lpggp31/rwoolley/boost-fix/bitbake-builds/poky-master-poky-with-sstate-distro_poky-machine_qemuarm64/build/tmp/work/cortexa57-poky-linux/boost/1.91.0/recipe-sysroot/usr/bin/python3"
notice: [python-cfg]   include path: "/ala-lpggp31/rwoolley/boost-fix/bitbake-builds/poky-master-poky-with-sstate-distro_poky-machine_qemuarm64/build/tmp/work/cortexa57-poky-linux/boost/1.91.0/recipe-sysroot/usr/include/python3.14"
notice: [python-cfg]   library path: "/ala-lpggp31/rwoolley/boost-fix/bitbake-builds/poky-master-poky-with-sstate-distro_poky-machine_qemuarm64/build/tmp/work/cortexa57-poky-linux/boost/1.91.0/recipe-sysroot/usr/lib/python3.14"
notice: [python-cfg] Checking for NumPy...
notice: [python-cfg] running command '/ala-lpggp31/rwoolley/boost-fix/bitbake-builds/poky-master-poky-with-sstate-distro_poky-machine_qemuarm64/build/tmp/work/cortexa57-poky-linux/boost/1.91.0/recipe-sysroot/usr/bin/python3 -c "import sys; sys.stderr = sys.stdout; import numpy; print(numpy.get_include())"'
sh: line 1: /ala-lpggp31/rwoolley/boost-fix/bitbake-builds/poky-master-poky-with-sstate-distro_poky-machine_qemuarm64/build/tmp/work/cortexa57-poky-linux/boost/1.91.0/recipe-sysroot/usr/bin/python3: No such file or directory
notice: [python-cfg] NumPy disabled. Reason:
notice: [python-cfg]   /ala-lpggp31/rwoolley/boost-fix/bitbake-builds/poky-master-poky-with-sstate-distro_poky-machine_qemuarm64/build/tmp/work/cortexa57-poky-linux/boost/1.91.0/recipe-sysroot/usr/bin/python3 -c "import sys; sys.stderr = sys.stdout; import numpy; print(numpy.get_include())" aborted with
notice: [python-cfg]
```

boost-build-native: Add python-numpy-include feature

    The Boost python.jam file attempts to import the NumPy module to determine
    whether the Boost.Python NumPy extension should be enabled. This approach
    is problematic when cross-compiling, particularly when NumPy includes
    native extensions built for the target architecture.

    Introduce the new python-numpy-include feature to avoid probing for NumPy
    at build time by allowing the include path to be specified explicitly.

    This enables BitBake to provide the correct NumPy include directory from
    the recipe sysroot, eliminating the need to import the target NumPy
    module from site-packages.

boost: Add support for Boost.Python NumPy extension

    Support for NumPy was added to Boost release 1.63.

    This additional numpy PACKAGECONFIG ensures that python3-numpy
    is added as build-time and run-time dependencies. It uses the
    custom-made python-numpy-include feature to supply the directory
    for the numpy module headers to the b2 build system.

    If numpy is not added the PACKAGECONFIG it will still attempt the
    probe and fail gracefully like before.

With this support in place we may add a PACKAGECONFIG to enable numpy.

Shown here in conf/local.conf:
```
PACKAGECONFIG:append:pn-boost = " numpy"
```

$ grep python-cfg -A10 log.do_compile
notice: [python-cfg] Configuring python...
notice: [python-cfg]   user-specified version: "3.14"
notice: [python-cfg]   user-specified cmd-or-prefix: "/ala-lpggp31/rwoolley/boost-fix/bitbake-builds/poky-master/build/tmp/work/cortexa57-poky-linux/boost/1.91.0/recipe-sysroot-native/usr/bin/python3-native/python3"
notice: [python-cfg]   user-specified includes: "/ala-lpggp31/rwoolley/boost-fix/bitbake-builds/poky-master/build/tmp/work/cortexa57-poky-linux/boost/1.91.0/recipe-sysroot/usr/include/python3.14"
notice: [python-cfg]   user-specified libraries: "/ala-lpggp31/rwoolley/boost-fix/bitbake-builds/poky-master/build/tmp/work/cortexa57-poky-linux/boost/1.91.0/recipe-sysroot/usr/lib/python3.14"
notice: [python-cfg]   user-specified condition: "<python-numpy-include>/ala-lpggp31/rwoolley/boost-fix/bitbake-builds/poky-master/build/tmp/work/cortexa57-poky-linux/boost/1.91.0/recipe-sysroot/usr/lib/python3.14/site-packages/numpy/_core/include"
notice: [python-cfg] Details of this Python configuration:
notice: [python-cfg]   interpreter command: "/ala-lpggp31/rwoolley/boost-fix/bitbake-builds/poky-master/build/tmp/work/cortexa57-poky-linux/boost/1.91.0/recipe-sysroot-native/usr/bin/python3-native/python3"
notice: [python-cfg]   include path: "/ala-lpggp31/rwoolley/boost-fix/bitbake-builds/poky-master/build/tmp/work/cortexa57-poky-linux/boost/1.91.0/recipe-sysroot/usr/include/python3.14"
notice: [python-cfg]   library path: "/ala-lpggp31/rwoolley/boost-fix/bitbake-builds/poky-master/build/tmp/work/cortexa57-poky-linux/boost/1.91.0/recipe-sysroot/usr/lib/python3.14"
notice: [python-cfg] Checking for NumPy...
notice: [python-cfg] NumPy enabled
notice: Searching '.' for project-config configuration file 'project-config.jam'.
notice: Loading project-config configuration file 'project-config.jam' from '.'.
Performing configuration checks

    - default address-model    : 64-bit [1]
    - default architecture     : arm [1]

Building the Boost C++ Libraries.

$ find image \( -name libboost_py* -o -name libboost_nu* \) | xargs  ls -al
-rw-r--r-- 3 rwoolley users     3262 Aug 12 13:16 image/usr/lib/cmake/boost_numpy-1.91.0/libboost_numpy-variant-shared-py3.14.cmake
-rw-r--r-- 3 rwoolley users     3316 Aug 12 13:16 image/usr/lib/cmake/boost_numpy-1.91.0/libboost_numpy-variant-static-py3.14.cmake
-rw-r--r-- 3 rwoolley users     3280 Aug 12 13:16 image/usr/lib/cmake/boost_python-1.91.0/libboost_python-variant-shared-py3.14.cmake
-rw-r--r-- 3 rwoolley users     3334 Aug 12 13:16 image/usr/lib/cmake/boost_python-1.91.0/libboost_python-variant-static-py3.14.cmake
-rw-r--r-- 3 rwoolley users  1642060 Aug 12 13:15 image/usr/lib/libboost_numpy314.a
lrwxrwxrwx 1 rwoolley users       27 Aug 12 13:15 image/usr/lib/libboost_numpy314.so -> libboost_numpy314.so.1.91.0
-rwxr-xr-x 1 rwoolley users   702176 Aug 12 13:15 image/usr/lib/libboost_numpy314.so.1.91.0
-rw-r--r-- 3 rwoolley users 10658572 Aug 12 13:15 image/usr/lib/libboost_python314.a
lrwxrwxrwx 1 rwoolley users       28 Aug 12 13:15 image/usr/lib/libboost_python314.so -> libboost_python314.so.1.91.0
-rwxr-xr-x 1 rwoolley users  4727368 Aug 12 13:15 image/usr/lib/libboost_python314.so.1.91.0

Signed-off-by: Rob Woolley <rob.woolley@windriver.com>
---
Rob Woolley (3):
      boost: Use python3-native executable
      boost-build-native: Add python-numpy-include feature
      boost: Add support for Boost.Python NumPy extension

 .../boost/boost-build-native_1.91.0.bb             |  3 +-
 .../add-python-numpy-include-feature.patch         | 74 ++++++++++++++++++++++
 meta/recipes-support/boost/boost.inc               |  9 ++-
 3 files changed, 84 insertions(+), 2 deletions(-)
---
base-commit: 96872cac87349528fa0516fa2f6265adf0a15dd7
change-id: 20260806-fix-boost-fca31915ebc4

Best regards,
--  
Rob Woolley <rob.woolley@windriver.com>


