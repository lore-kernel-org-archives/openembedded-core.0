Return-Path: <rob.woolley@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD7AC5B56A
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 17:36:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35157.1786383370694175365
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Aug 2026 10:36:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=EYTDf3He;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2682d034ff=rob.woolley@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AGCava1982029
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 17:36:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=pdt688/XT
	5M55U2zvUYKnvFUcb4UDat5t/8wvPoWOdg=; b=EYTDf3HeFt+lqZHVuQuFbsb3J
	Cd71pFRGdq/Pc3UONQ/2ruxcRIRVxqcpXbRKcOL2QqPWleuh5Z3M5+ckgOadZmcH
	ewP3hDMTchdlGDvQCxmQsiwcncnz/0Z3XFWzfx8bmuD0Es32ni2IAyahiFribcJH
	u9AK4dNcyubvoKITPhAT7mH1YQJcyiBFTFr9erwDtT6l3MUIvIpTBUtsIH0i8fm2
	HL6NATOT80Q5aSemXZwHC+uacrV84RSMpYasED90K2S3Qt6nYRRzIiqTVOd76r7l
	fgFsReuQJ7AcCkitWZAMNTZ3nMNd0j4byYXkMza9Fti4F91CMhyKNwFgW45pQ==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fwue82wkq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 17:36:09 +0000 (GMT)
Received: from ala-p2exch01.corp.ad.wrs.com (10.11.226.101) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 10 Aug 2026 10:36:08 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-p2exch01.corp.ad.wrs.com (10.11.226.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.45; Mon, 10 Aug 2026 10:36:07 -0700
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 10 Aug 2026 10:36:07 -0700
From: Rob Woolley <rob.woolley@windriver.com>
Subject: [PATCH 0/2] boost: Add Boost.Python NumPy
Date: Mon, 10 Aug 2026 10:35:49 -0700
Message-ID: <20260810-fix-boost-v1-0-4e838b3d43b4@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPULemoC/yXMyw5AMBCF4VeRWWvSujR4FbHQmjIWKh1EIt5ds
 fxyTv4LGAMhQ5NcEPAgJr9EqDQBO/XLiIKGaMhkpmUltXB0CuM9b8LZPle1KtHYAuJ/DRjHr9V
 2v3k3M9rtDcB9P8LOttZtAAAA
X-Change-ID: 20260806-fix-boost-fca31915ebc4
To: <openembedded-core@lists.openembedded.org>
CC: Rob Woolley <rob.woolley@windriver.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=A6tc+aWG c=1 sm=1 tr=0 ts=6a7a0c09 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=7IJILsiK1fuy3y4Q9EcA:9 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDE1MCBTYWx0ZWRfXxHB0pyKCXLpo
 cI/eJm4xOh/FH6ULg8huUmnriMd1h4Cm/aQtzVfdiHpbn12k1oacUsoAS15MZg6xC+ZnHSPO5/6
 Uv8o8fuKFtpAf8v3QAzIWESDjiOwl9dhgwaj7yOb63OVpdNnYi4v
X-Proofpoint-GUID: p-CTuoq9428D_PiiZMWuhnAtnrsQbAok
X-Proofpoint-ORIG-GUID: p-CTuoq9428D_PiiZMWuhnAtnrsQbAok
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDE1MCBTYWx0ZWRfX9XcXSMePELRZ
 vDehtTXkaE/x/S/juewI9ZNdVNQaCmymN4qtk2orDeN2Y/Mr232g4lA8M2+8PIx/j+Q5tSowxcB
 R3Zn8LeelMNHhKCY0RlUNJZRdRh8ZBcijv9/87nEXyRmodFoRCUCdVD94vCYjDIG1qWwdN30leR
 jN37Cg2cXNbq7s3mLY7vh77w0Ih/BplYxZxd32QHU+KuzAOL3j1qR9MpgVJFOABsTo+R2XxnhCL
 xGOaykHP5MMuIb0IhKWXql5ZdgQzX+d7jbu96I6CGWvumKdJoznf51ZPT5VQw2IcBrcAOcSirQV
 zRJXOEzA+JjWMDLeDyaDrNTNmMSU3RW01CbRzkQNDuM5uwM4ryfmsO/uSis7NhsxSX3t5XM9Gd7
 3te1/iiYBA9JydWBKXvImsy4x8wLW6IM7bNVKBlJVafN84WWqhMlpSQ9ONrH5+EXCOvPa1PEzyN
 z0fo3WVWYy6A1qPIEDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_04,2026-08-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100150
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 17:36:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243139

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

    Without this change, it specifies a non-existent python executable
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

boost: Add support for Boost.Python NumPy extension

    Support for NumPy was added to Boost release 1.63.

    This additional numpy PACKAGECONFIG ensures that python3-numpy
    is added as build-time and run-time dependencies.

With this support in place we may add a PACKAGECONFIG to enable numpy.

Shown here in conf/local.conf:
```
PACKAGECONFIG:append:pn-boost = " numpy"
```

$ grep python-cfg log.do_compile
notice: [python-cfg] Configuring python...
notice: [python-cfg]   user-specified version: "3.14"
notice: [python-cfg]   user-specified cmd-or-prefix: "/ala-lpggp31/rwoolley/boost-fix/bitbake-builds/poky-master-poky-with-sstate-distro_poky-machine_qemuarm64/build/tmp/work/cortexa57-poky-linux/boost/1.91.0/recipe-sysroot-native/usr/bin/python3-native/python3"
notice: [python-cfg]   user-specified includes: "/ala-lpggp31/rwoolley/boost-fix/bitbake-builds/poky-master-poky-with-sstate-distro_poky-machine_qemuarm64/build/tmp/work/cortexa57-poky-linux/boost/1.91.0/recipe-sysroot/usr/include/python3.14"
notice: [python-cfg]   user-specified libraries: "/ala-lpggp31/rwoolley/boost-fix/bitbake-builds/poky-master-poky-with-sstate-distro_poky-machine_qemuarm64/build/tmp/work/cortexa57-poky-linux/boost/1.91.0/recipe-sysroot/usr/lib/python3.14"
notice: [python-cfg] Details of this Python configuration:
notice: [python-cfg]   interpreter command: "/ala-lpggp31/rwoolley/boost-fix/bitbake-builds/poky-master-poky-with-sstate-distro_poky-machine_qemuarm64/build/tmp/work/cortexa57-poky-linux/boost/1.91.0/recipe-sysroot-native/usr/bin/python3-native/python3"
notice: [python-cfg]   include path: "/ala-lpggp31/rwoolley/boost-fix/bitbake-builds/poky-master-poky-with-sstate-distro_poky-machine_qemuarm64/build/tmp/work/cortexa57-poky-linux/boost/1.91.0/recipe-sysroot/usr/include/python3.14"
notice: [python-cfg]   library path: "/ala-lpggp31/rwoolley/boost-fix/bitbake-builds/poky-master-poky-with-sstate-distro_poky-machine_qemuarm64/build/tmp/work/cortexa57-poky-linux/boost/1.91.0/recipe-sysroot/usr/lib/python3.14"
notice: [python-cfg] Checking for NumPy...
notice: [python-cfg] running command '/ala-lpggp31/rwoolley/boost-fix/bitbake-builds/poky-master-poky-with-sstate-distro_poky-machine_qemuarm64/build/tmp/work/cortexa57-poky-linux/boost/1.91.0/recipe-sysroot-native/usr/bin/python3-native/python3 -c "import sys; sys.stderr = sys.stdout; import numpy; print(numpy.get_include())"'
notice: [python-cfg] NumPy enabled

$ find image \( -name libboost_py* -o -name libboost_nu* \) | xargs  ls -al
-
-rw-r--r-- 3 rwoolley users     3262 Aug  4 14:07 image/usr/lib/cmake/boost_numpy-1.91.0/libboost_numpy-variant-shared-py3.14.cmake
-rw-r--r-- 3 rwoolley users     3316 Aug  4 14:07 image/usr/lib/cmake/boost_numpy-1.91.0/libboost_numpy-variant-static-py3.14.cmake
-rw-r--r-- 3 rwoolley users     3280 Aug  4 14:07 image/usr/lib/cmake/boost_python-1.91.0/libboost_python-variant-shared-py3.14.cmake
-rw-r--r-- 3 rwoolley users     3334 Aug  4 14:07 image/usr/lib/cmake/boost_python-1.91.0/libboost_python-variant-static-py3.14.cmake
-rw-r--r-- 3 rwoolley users  1642060 Aug  4 14:05 image/usr/lib/libboost_numpy314.a
lrwxrwxrwx 1 rwoolley users       27 Aug  4 14:05 image/usr/lib/libboost_numpy314.so -> libboost_numpy314.so.1.91.0
-rwxr-xr-x 1 rwoolley users   702176 Aug  4 14:05 image/usr/lib/libboost_numpy314.so.1.91.0
-rw-r--r-- 3 rwoolley users 10658572 Aug  4 14:05 image/usr/lib/libboost_python314.a
lrwxrwxrwx 1 rwoolley users       28 Aug  4 14:05 image/usr/lib/libboost_python314.so -> libboost_python314.so.1.91.0
-rwxr-xr-x 1 rwoolley users  4727368 Aug  4 14:05 image/usr/lib/libboost_python314.so.1.91.0

The Python one-liner which imports numpy uses the python3-numpy-native module,
however the return value doesn't appear to be used.  The supplied include path
pointing to the target sysroot seems to be used for compliation.

Signed-off-by: Rob Woolley <rob.woolley@windriver.com>
---
Rob Woolley (2):
      boost: Use python3-native executable
      boost: Add support for Boost.Python NumPy extension

 meta/recipes-support/boost/boost.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
---
base-commit: 96872cac87349528fa0516fa2f6265adf0a15dd7
change-id: 20260806-fix-boost-fca31915ebc4

Best regards,
--  
Rob Woolley <rob.woolley@windriver.com>


