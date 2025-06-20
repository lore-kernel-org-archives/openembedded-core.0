Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CE6CC7115B
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 19:15:32 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.4551.1750446924622620614
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jun 2025 12:15:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=NKETlgjb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KFwwjt004901
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 19:15:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nuZF2Qf72V7
	TsZChzUHkYREhu1b6oZueC2tx+OVtThE=; b=NKETlgjbAR+44JqE/aZ58LvRzr0
	DnEaP04TdRbIkmax6Vc6faUKnREIb9mCTbAIQtj4GD+yx3PEcK6/ZsW+Qa0/VcF8
	ocRNkyoNNOoEHIcl+NaDgwMwm+2Z0ZPeJYTJdd8T411Kk9BfxYd7yHnXVMHF7JvM
	mud70iSuQI6wdiGdgUbzs0hCoTwKSrFGmWiUfXPPvbo3RskQuU1D4CWiSUQahpfk
	qAtC1NHDu6IeBaBgJM5EcLabtHC5kHlyBbSmKbWXUXuk4HF3QrnMhfKRZLXetkKf
	e2epgspVR6tD7ayDLsaxNGjgnGABR9Waqg/OlpkTnL4QaZU9hBh/IG8+c5Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47darvrfvd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 19:15:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5cd0f8961so429520185a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 12:15:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750446908; x=1751051708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nuZF2Qf72V7TsZChzUHkYREhu1b6oZueC2tx+OVtThE=;
        b=va4pQq4mL+v1vG9YZeFQVrTtOfDllhuAfJucHvZeluFDzgZGmptBcdrCrj0IjOCz30
         etY9jx0v95lJYGVp0uNT8Ira++CqNeI0SlfAafF5PilAIZqGBmb2DqxiygPjUUSzP2Pd
         SAYQ4Qpioo27Gj+APM8Y/QwtAXJV73N7DeHrmptE3SuiOF+V01VtWj5saO8yM7Lb25fL
         rsu+OP5hio8+5vti84qkqcfoZX0oad0u2H8H6OAvsGHyRliuFMyxdrWbuejasFigiAVa
         Ppd6OhjHNeD9Wqqrr+G4Yhe2kslxO5QceLfjMQ/xtAjY++n95Fpf5elef6gK6VxUhnV4
         k4aw==
X-Gm-Message-State: AOJu0Yy4qQGSu+SGIqNd0ULdUlEPBg1bYoZrX6g+pitXS/w0xbEzaHgZ
	bbvrkSqplKbJ7vEsOO8YVZVSIpc7PXE8WMQ23VcBbMfxuLmoQ8KErJgeXIVUUMDEdnJ08JmCtJT
	tuEZK0Ww/kBeWj0s1WXB1J2q0/aUa3AOIBo3+HPGPOVqkRMs3qGBWNVZhp0HZQWDCixiSqk8IF5
	6a7uEY+5TGZ9aCWqcJ2w==
X-Gm-Gg: ASbGncujrJbetQwlB7kfea65V0xaZvOC6dbfrMCKHddCSW9ulCdfVVlzslJOOgHiqNg
	mJ56/fdju5h6pZ8t07tXoFE1iUJfLa0S436Y/SvJcF6zoQsRXFHfqp/SobfS82MWR9v0pW3gdUQ
	wRYeLoVnIgtkZFevUQDATqNChtwRKTLBtU5aTXnXMUrLv6zgAVXuxjUpta5MJoOAi9XF+Smr4zW
	DNLb3wlMHpO8PyCmyrGPeIF3/r2XSGXHs5ivzBGPOwUuuxFMD1U6W0fXgIGHyw6cVFFtmgYcFys
	8kuEDU8RouVQPq/KGoGmKx4/KC3MZjm6rqTtDSOkKbqEhEok0M3ZfU9MUOK+gDraznbYgzoAeaL
	PtHyIb0iiYbwJTDyEejxGDFtMCcABors5ENU=
X-Received: by 2002:a05:620a:2552:b0:7ca:f41a:546b with SMTP id af79cd13be357-7d3f98c7e0emr673747985a.6.1750446907915;
        Fri, 20 Jun 2025 12:15:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdiE/ANG02HCsvk7dt/14SY0Y4oXb5ymamLftV/x8Fcq2p4jqu9zg40KqMALwcsATq6L++qg==
X-Received: by 2002:a05:620a:2552:b0:7ca:f41a:546b with SMTP id af79cd13be357-7d3f98c7e0emr673742285a.6.1750446907325;
        Fri, 20 Jun 2025 12:15:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41cc124sm381614e87.215.2025.06.20.12.15.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 12:15:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v7 6/8] libglvnd: migrate from meta-oe
Date: Fri, 20 Jun 2025 22:14:55 +0300
Message-Id: <20250620191457.2018861-6-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250620191457.2018861-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250620191457.2018861-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: xBhg-GDLZt69d9Sdn3ktcoNga9_QYVvJ
X-Proofpoint-GUID: xBhg-GDLZt69d9Sdn3ktcoNga9_QYVvJ
X-Authority-Analysis: v=2.4 cv=YrgPR5YX c=1 sm=1 tr=0 ts=6855b34c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=iGHA9ds3AAAA:8 a=zjtiufAZAAAA:8 a=7CQSdrXTAAAA:8 a=LVuIr49FmCvZ6bsMoTIA:9
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=2tRhtM0yMehlNRDZlsEQ:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEzNCBTYWx0ZWRfXxQh5fWFp8b3L
 jM65I2zCY0YFtrVoHe8P4msO81b3ltQHZ9yYSQymRJb71xWoGAt/8O6PnMC2LpU3PKc9fSR5M0s
 mWz8BPJQNZ4GjAbgzj/wNlsEZq4eHv60053gvUXSWgw88co4BDp5T45ToYQdvuz00RdJqLsSXBn
 ddZwFXhUI489jB0SJOtGGLyQK3Vo9Lc2Pu5ui3CWt9lyBr9IYtGdyXGmuoPGcUaAAf5YBhYCfax
 9tgnQ7vcIwyFJbhii62yjS9CngUlAy/BqtbgSBGnUhAatvPS1LUy1ZX9RfmqkkyM807wwilvJLu
 UUTpmxohq+JbTS/yjS/ZiN+I6VQX4S58RDxGe5jskY+pgNHkojz4zvC9MNRffW/O2k726pJpx2A
 B6B/skuIIgz4oIDBb0fT99s+6j4zjxyiDcl6T2NavnljKngW77MKdohK6ibfGc+9adc8+cvo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_08,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 mlxscore=0 suspectscore=0 priorityscore=1501 adultscore=0 phishscore=0
 spamscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200134
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jun 2025 19:15:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219148

libglvnd is a vendor-neutral approach to handling OpenGL / OpenGL ES /
EGL / GLX libraries. It has been proposed and initially implemented by
NVIDIA in order to simplify coinstallation of GL drivers provided by
different vendors. Major Linux distributions (Debian, Ubuntu, Fedora,
etc.) have already switched to libglvnd.

Having libglvnd in OE-Core simplifies integration of this ABI into
distro and BSP layers (e.g. it will help meta-tegra, which currently
provides its own version of the recipe).

Import recipe for libglvnd from the meta-oe layer (changes: fix virtual
package names, add add the SUMMARY data, drop git@ from SRC_URI, require
glvnd DISTRO_FEATURE).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 meta/lib/oeqa/selftest/cases/distrodata.py    |  2 +-
 .../libglvnd/libglvnd_1.7.0.bb                | 39 +++++++++++++++++++
 3 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/libglvnd/libglvnd_1.7.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 870c81e85fc0..d94fb693e39a 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -353,6 +353,7 @@ RECIPE_MAINTAINER:pn-libgcrypt = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-libgfortran = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libgit2 = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libgloss = "Alejandro Hernandez <alejandro@enedino.org>"
+RECIPE_MAINTAINER:pn-libglvnd = "Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>"
 RECIPE_MAINTAINER:pn-libglu = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-libgpg-error = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-libgudev = "Ross Burton <ross.burton@arm.com>"
diff --git a/meta/lib/oeqa/selftest/cases/distrodata.py b/meta/lib/oeqa/selftest/cases/distrodata.py
index 1e88ea82e6a8..f2c6124d704f 100644
--- a/meta/lib/oeqa/selftest/cases/distrodata.py
+++ b/meta/lib/oeqa/selftest/cases/distrodata.py
@@ -56,7 +56,7 @@ but their recipes claim otherwise by setting UPSTREAM_VERSION_UNKNOWN. Please re
 
         def is_maintainer_exception(entry):
             exceptions = ["musl", "newlib", "picolibc", "linux-yocto", "linux-dummy", "mesa-gl", "libgfortran", "libx11-compose-data",
-                          "cve-update-nvd2-native", "barebox"]
+                          "cve-update-nvd2-native", "barebox", "libglvnd"]
             for i in exceptions:
                  if i in entry:
                      return True
diff --git a/meta/recipes-graphics/libglvnd/libglvnd_1.7.0.bb b/meta/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
new file mode 100644
index 000000000000..d2a4b2dc51d9
--- /dev/null
+++ b/meta/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
@@ -0,0 +1,39 @@
+SUMMARY = "the GL Vendor-Neutral Dispatch library"
+DESCRIPTION = "libglvnd is a vendor-neutral dispatch layer for arbitrating \
+OpenGL API calls between multiple vendors."
+HOMEPAGE = "https://gitlab.freedesktop.org/glvnd/libglvnd"
+LICENSE = "MIT & BSD-1-Clause & BSD-3-Clause & GPL-3.0-with-autoconf-exception"
+LIC_FILES_CHKSUM = "file://README.md;beginline=323;md5=7ac5f0111f648b92fe5427efeb08e8c4"
+
+SRC_URI = "git://gitlab.freedesktop.org/glvnd/libglvnd.git;protocol=https;branch=master"
+
+SRCREV = "faa23f21fc677af5792825dc30cb1ccef4bf33a6"
+
+REQUIRED_DISTRO_FEATURES = "opengl glvnd"
+
+inherit meson pkgconfig features_check
+
+S = "${WORKDIR}/git"
+
+PACKAGECONFIG ?= "\
+  ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+  ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'egl gles1 gles2', '', d)} \
+  ${@bb.utils.contains('DISTRO_FEATURES', 'opengl x11', 'glx', '', d)} \
+  "
+
+PACKAGECONFIG[x11] = "-Dx11=enabled,-Dx11=disabled,libx11 libxext xorgproto"
+PACKAGECONFIG[glx] = "-Dglx=enabled,-Dglx=disabled,libx11 libxext xorgproto,,virtual-libglx-icd"
+PACKAGECONFIG[egl] = "-Degl=true,-Degl=false,,virtual-libegl-icd"
+PACKAGECONFIG[gles1] = "-Dgles1=true,-Dgles1=false,"
+PACKAGECONFIG[gles2] = "-Dgles2=true,-Dgles2=false,"
+
+BBCLASSEXTEND = "native nativesdk"
+
+PROVIDES = " \
+    ${@bb.utils.contains('PACKAGECONFIG', 'glx', 'virtual/libgl', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'gles1', 'virtual/libgles1', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'gles2', 'virtual/libgles2 virtual/libgles3', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'virtual/egl', '', d)} \
+"
+
+RPROVIDES:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'egl', 'libegl', '', d)}"
-- 
2.39.5


