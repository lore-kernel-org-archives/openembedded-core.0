Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73ADBC19F32
	for <webhook@archiver.kernel.org>; Sun,  2 Mar 2025 04:38:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.25202.1740890285400397188
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Mar 2025 20:38:05 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5156d6533d=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5224c56T023279;
	Sat, 1 Mar 2025 20:38:05 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 453xd7rpw3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 20:38:04 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sat, 1 Mar 2025 20:38:04 -0800
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sat, 1 Mar 2025 20:38:03 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] cmake-native: support RUNTIME_DEPENDENCIES for OE cross compiling
Date: Sun, 2 Mar 2025 12:38:02 +0800
Message-ID: <20250302043802.3279519-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=KICgDEFo c=1 sm=1 tr=0 ts=67c3e0ac cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=Vs1iUdzkB0EA:10 a=Ud-fGmwBAAAA:8 a=t7CeM3EgAAAA:8 a=_r4plLZGuho7ccY9tVsA:9 a=H0_BfbLtyfsadj6IJfz3:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: oLeHk0JGTRrAgAyKg4uspr0QwLwt3pzp
X-Proofpoint-GUID: oLeHk0JGTRrAgAyKg4uspr0QwLwt3pzp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-01_10,2025-02-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999
 suspectscore=0 spamscore=0 mlxscore=0 malwarescore=0 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503020033
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Mar 2025 04:38:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212185

While software uses RUNTIME_DEPENDENCIES for cmake build, it failed in
OE cross compiling
...
  install TARGETS RUNTIME_DEPENDENCIES is not supported when cross-compiling.
...

This commit adds environment OECMAKE_FORCE_CROSSCOMPILING to force support
RUNTIME_DEPENDENCIES for OE cross compile

export OECMAKE_FORCE_CROSSCOMPILING ??= "0" in cmake.bbclass, when users
encounter the error and explicitly set OECMAKE_FORCE_CROSSCOMPILING = "1"
in recipe, they should be aware of the probably regression of
RUNTIME_DEPENDENCIES in cross compiling situation

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes-recipe/cmake.bbclass             |  2 +
 .../cmake/cmake-native_3.31.5.bb              |  1 +
 ..._DEPENDENCIES-for-oe-cross-compiling.patch | 52 +++++++++++++++++++
 3 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-devtools/cmake/cmake/0001-support-RUNTIME_DEPENDENCIES-for-oe-cross-compiling.patch

diff --git a/meta/classes-recipe/cmake.bbclass b/meta/classes-recipe/cmake.bbclass
index e79f8a7435..9393e6133e 100644
--- a/meta/classes-recipe/cmake.bbclass
+++ b/meta/classes-recipe/cmake.bbclass
@@ -64,6 +64,8 @@ OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM = "ONLY"
 
 EXTRA_OECMAKE:append = " ${PACKAGECONFIG_CONFARGS}"
 
+export OECMAKE_FORCE_CROSSCOMPILING ??= "0"
+
 export CMAKE_BUILD_PARALLEL_LEVEL
 CMAKE_BUILD_PARALLEL_LEVEL:task-compile = "${@oe.utils.parallel_make(d, False)}"
 CMAKE_BUILD_PARALLEL_LEVEL:task-install = "${@oe.utils.parallel_make(d, True)}"
diff --git a/meta/recipes-devtools/cmake/cmake-native_3.31.5.bb b/meta/recipes-devtools/cmake/cmake-native_3.31.5.bb
index e285a17681..9446e1c2c5 100644
--- a/meta/recipes-devtools/cmake/cmake-native_3.31.5.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_3.31.5.bb
@@ -7,6 +7,7 @@ SRC_URI += "file://OEToolchainConfig.cmake \
             file://environment.d-cmake.sh \
             file://0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch \
             file://0001-CMakeLists.txt-disable-USE_NGHTTP2.patch \
+            file://0001-support-RUNTIME_DEPENDENCIES-for-oe-cross-compiling.patch \
             "
 
 LICENSE:append = " & BSD-1-Clause & MIT & BSD-2-Clause & curl"
diff --git a/meta/recipes-devtools/cmake/cmake/0001-support-RUNTIME_DEPENDENCIES-for-oe-cross-compiling.patch b/meta/recipes-devtools/cmake/cmake/0001-support-RUNTIME_DEPENDENCIES-for-oe-cross-compiling.patch
new file mode 100644
index 0000000000..163dd3c140
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake/0001-support-RUNTIME_DEPENDENCIES-for-oe-cross-compiling.patch
@@ -0,0 +1,52 @@
+From 7b3c3674df6ad8f90475d51f9c104e825656ebcc Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 21 Feb 2025 20:28:39 +0800
+Subject: [PATCH] support RUNTIME_DEPENDENCIES for oe cross compiling
+
+According to upstream cmake doc[1]:
+...
+``RUNTIME_DEPENDENCIES``
+  .. versionadded:: 3.21
+
+  This option causes all runtime dependencies of installed executable, shared
+  library, and module targets to be installed along with the targets
+  themselves. The ``RUNTIME``, ``LIBRARY``, ``FRAMEWORK``, and generic
+  arguments are used to determine the properties (``DESTINATION``,
+  ``COMPONENT``, etc.) of the installation of these dependencies.
+...
+
+But it does not support cross compiling, this commit adds environment
+OECMAKE_FORCE_CROSSCOMPILING to force support RUNTIME_DEPENDENCIES for
+OE cross compiling
+
+[1] https://gitlab.kitware.com/cmake/cmake/-/commit/72f2448e82d8b3e90fa733cb6c631298083ae06b
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ Source/cmInstallCommand.cxx | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/Source/cmInstallCommand.cxx b/Source/cmInstallCommand.cxx
+index 89cf028d38..cd4336b2a3 100644
+--- a/Source/cmInstallCommand.cxx
++++ b/Source/cmInstallCommand.cxx
+@@ -648,9 +648,12 @@ bool HandleTargetsMode(std::vector<std::string> const& args,
+                  system, '"'));
+       return false;
+     }
+-    if (helper.Makefile->IsOn("CMAKE_CROSSCOMPILING")) {
++    std::string oe_force = cmSystemTools::GetEnvVar("OECMAKE_FORCE_CROSSCOMPILING").
++      value_or(std::string());
++    if (helper.Makefile->IsOn("CMAKE_CROSSCOMPILING") && (oe_force != "1")) {
+       status.SetError("TARGETS RUNTIME_DEPENDENCIES is not supported "
+-                      "when cross-compiling.");
++                      "when cross-compiling. "
++                      "Please export OECMAKE_FORCE_CROSSCOMPILING='1' to force run");
+       return false;
+     }
+     if (helper.Makefile->GetSafeDefinition("CMAKE_HOST_SYSTEM_NAME") ==
+-- 
+2.25.1
+
-- 
2.34.1


