Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F815D5A6D6
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 02:25:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.36920.1732587943773550356
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 18:25:43 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1060df9989=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQ1KgED007184;
	Tue, 26 Nov 2024 02:25:43 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 433618aq0g-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 26 Nov 2024 02:25:42 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 25 Nov 2024 18:25:27 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 25 Nov 2024 18:25:27 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <steve@sakoman.com>
Subject: [kirkstone][PATCH V2 04/13] ovmf: Fix CVE-2023-45231
Date: Mon, 25 Nov 2024 18:25:17 -0800
Message-ID: <20241126022526.3389121-4-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241126022526.3389121-1-hongxu.jia@windriver.com>
References: <20241126022526.3389121-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: x-xF2LDaIqfF_J0bj_adBDZvRRS_dbJ5
X-Proofpoint-GUID: x-xF2LDaIqfF_J0bj_adBDZvRRS_dbJ5
X-Authority-Analysis: v=2.4 cv=O65rvw9W c=1 sm=1 tr=0 ts=674531a6 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VlfZXiiP6vEA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=hqBzw_eTAAAA:8 a=t7CeM3EgAAAA:8 a=yMhMjlubAAAA:8 a=QyXUC8HyAAAA:8
 a=pGLkceISAAAA:8 a=M0iPxMNiYaO_7JsmHxAA:9 a=bkWp_v3HvcftT6DRAIDL:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-11-26_01,2024-11-25_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2411260019
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 02:25:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207828

From: Soumya Sambu <soumya.sambu@windriver.com>

EDK2's Network Package is susceptible to an out-of-bounds read
vulnerability when processing  Neighbor Discovery Redirect message. This
vulnerability can be exploited by an attacker to gain unauthorized access
and potentially lead to a loss of Confidentiality.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-45231

Upstream-patches:
https://github.com/tianocore/edk2/commit/bbfee34f4188ac00371abe1389ae9c9fb9=
89a0cd
https://github.com/tianocore/edk2/commit/6f77463d72807ec7f4ed6518c3dac29a10=
40df9f

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../ovmf/ovmf/CVE-2023-45231-0001.patch       |  65 +++++
 .../ovmf/ovmf/CVE-2023-45231-0002.patch       | 250 ++++++++++++++++++
 meta/recipes-core/ovmf/ovmf_git.bb            |   2 +
 3 files changed, 317 insertions(+)
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2023-45231-0001.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2023-45231-0002.patch

diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2023-45231-0001.patch b/meta/r=
ecipes-core/ovmf/ovmf/CVE-2023-45231-0001.patch
new file mode 100644
index 0000000000..7aa9b27407
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/CVE-2023-45231-0001.patch
@@ -0,0 +1,65 @@
+From bbfee34f4188ac00371abe1389ae9c9fb989a0cd Mon Sep 17 00:00:00 2001
+From: Doug Flick <dougflick@microsoft.com>
+Date: Fri, 26 Jan 2024 05:54:48 +0800
+Subject: [PATCH] NetworkPkg: Ip6Dxe: SECURITY PATCH CVE-2023-45231 Patch
+
+REF:https://bugzilla.tianocore.org/show_bug.cgi?id=3D4536
+
+Bug Overview:
+PixieFail Bug #3
+CVE-2023-45231
+CVSS 6.5 : CVSS:3.1/AV:A/AC:L/PR:N/UI:N/S:U/C:H/I:N/A:N
+CWE-125 Out-of-bounds Read
+
+Out-of-bounds read when handling a ND Redirect message with truncated
+options
+
+Change Overview:
+
+Adds a check to prevent truncated options from being parsed
++  //
++  // Cannot process truncated options.
++  // Cannot process options with a length of 0 as there is no Type
+field.
++  //
++  if (OptionLen < sizeof (IP6_OPTION_HEADER)) {
++    return FALSE;
++  }
+
+Cc: Saloni Kasbekar <saloni.kasbekar@intel.com>
+Cc: Zachary Clark-williams <zachary.clark-williams@intel.com>
+
+Signed-off-by: Doug Flick [MSFT] <doug.edk2@gmail.com>
+Reviewed-by: Saloni Kasbekar <saloni.kasbekar@intel.com>
+
+CVE: CVE-2023-45231
+
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/bbfee3=
4f4188ac00371abe1389ae9c9fb989a0cd]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ NetworkPkg/Ip6Dxe/Ip6Option.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/NetworkPkg/Ip6Dxe/Ip6Option.c b/NetworkPkg/Ip6Dxe/Ip6Option.c
+index 199eea124d..8718d5d875 100644
+--- a/NetworkPkg/Ip6Dxe/Ip6Option.c
++++ b/NetworkPkg/Ip6Dxe/Ip6Option.c
+@@ -137,6 +137,14 @@ Ip6IsNDOptionValid (
+     return FALSE;=0D
+   }=0D
+ =0D
++  //=0D
++  // Cannot process truncated options.=0D
++  // Cannot process options with a length of 0 as there is no Type field.=
=0D
++  //=0D
++  if (OptionLen < sizeof (IP6_OPTION_HEADER)) {=0D
++    return FALSE;=0D
++  }=0D
++=0D
+   Offset =3D 0;=0D
+ =0D
+   //=0D
+--=20
+2.40.0
+
diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2023-45231-0002.patch b/meta/r=
ecipes-core/ovmf/ovmf/CVE-2023-45231-0002.patch
new file mode 100644
index 0000000000..fbc2c4416e
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/CVE-2023-45231-0002.patch
@@ -0,0 +1,250 @@
+From 6f77463d72807ec7f4ed6518c3dac29a1040df9f Mon Sep 17 00:00:00 2001
+From: Doug Flick <dougflick@microsoft.com>
+Date: Fri, 26 Jan 2024 05:54:49 +0800
+Subject: [PATCH] NetworkPkg: Ip6Dxe: SECURITY PATCH CVE-2023-45231 Unit Te=
sts
+
+REF:https://bugzilla.tianocore.org/show_bug.cgi?id=3D4536
+
+Validates that the patch for...
+
+Out-of-bounds read when handling a ND Redirect message with truncated
+options
+
+.. has been fixed
+
+Tests the following function to ensure that an out of bounds read does
+not occur
+Ip6OptionValidation
+
+Cc: Saloni Kasbekar <saloni.kasbekar@intel.com>
+Cc: Zachary Clark-williams <zachary.clark-williams@intel.com>
+
+Signed-off-by: Doug Flick [MSFT] <doug.edk2@gmail.com>
+Reviewed-by: Saloni Kasbekar <saloni.kasbekar@intel.com>
+
+CVE: CVE-2023-45231
+
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/6f7746=
3d72807ec7f4ed6518c3dac29a1040df9f]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ .../Ip6Dxe/GoogleTest/Ip6DxeGoogleTest.cpp    |  20 +++
+ .../Ip6Dxe/GoogleTest/Ip6DxeGoogleTest.inf    |  42 ++++++
+ .../Ip6Dxe/GoogleTest/Ip6OptionGoogleTest.cpp | 129 ++++++++++++++++++
+ 3 files changed, 191 insertions(+)
+ create mode 100644 NetworkPkg/Ip6Dxe/GoogleTest/Ip6DxeGoogleTest.cpp
+ create mode 100644 NetworkPkg/Ip6Dxe/GoogleTest/Ip6DxeGoogleTest.inf
+ create mode 100644 NetworkPkg/Ip6Dxe/GoogleTest/Ip6OptionGoogleTest.cpp
+
+diff --git a/NetworkPkg/Ip6Dxe/GoogleTest/Ip6DxeGoogleTest.cpp b/NetworkPk=
g/Ip6Dxe/GoogleTest/Ip6DxeGoogleTest.cpp
+new file mode 100644
+index 0000000000..6ebfd5fdfb
+--- /dev/null
++++ b/NetworkPkg/Ip6Dxe/GoogleTest/Ip6DxeGoogleTest.cpp
+@@ -0,0 +1,20 @@
++/** @file=0D
++  Acts as the main entry point for the tests for the Ip6Dxe module.=0D
++=0D
++  Copyright (c) Microsoft Corporation=0D
++  SPDX-License-Identifier: BSD-2-Clause-Patent=0D
++**/=0D
++#include <gtest/gtest.h>=0D
++=0D
++/////////////////////////////////////////////////////////////////////////=
///////=0D
++// Run the tests=0D
++/////////////////////////////////////////////////////////////////////////=
///////=0D
++int=0D
++main (=0D
++  int   argc,=0D
++  char  *argv[]=0D
++  )=0D
++{=0D
++  testing::InitGoogleTest (&argc, argv);=0D
++  return RUN_ALL_TESTS ();=0D
++}=0D
+diff --git a/NetworkPkg/Ip6Dxe/GoogleTest/Ip6DxeGoogleTest.inf b/NetworkPk=
g/Ip6Dxe/GoogleTest/Ip6DxeGoogleTest.inf
+new file mode 100644
+index 0000000000..6e4de0745f
+--- /dev/null
++++ b/NetworkPkg/Ip6Dxe/GoogleTest/Ip6DxeGoogleTest.inf
+@@ -0,0 +1,42 @@
++## @file=0D
++# Unit test suite for the Ip6Dxe using Google Test=0D
++#=0D
++# Copyright (c) Microsoft Corporation.<BR>=0D
++# SPDX-License-Identifier: BSD-2-Clause-Patent=0D
++##=0D
++[Defines]=0D
++  INF_VERSION         =3D 0x00010017=0D
++  BASE_NAME           =3D Ip6DxeUnitTest=0D
++  FILE_GUID           =3D 4F05D17D-D3E7-4AAE-820C-576D46D2D34A=0D
++  VERSION_STRING      =3D 1.0=0D
++  MODULE_TYPE         =3D HOST_APPLICATION=0D
++#=0D
++# The following information is for reference only and not required by the=
 build tools.=0D
++#=0D
++#  VALID_ARCHITECTURES           =3D IA32 X64 AARCH64=0D
++#=0D
++[Sources]=0D
++  Ip6DxeGoogleTest.cpp=0D
++  Ip6OptionGoogleTest.cpp=0D
++  ../Ip6Option.c=0D
++=0D
++[Packages]=0D
++  MdePkg/MdePkg.dec=0D
++  MdeModulePkg/MdeModulePkg.dec=0D
++  UnitTestFrameworkPkg/UnitTestFrameworkPkg.dec=0D
++  NetworkPkg/NetworkPkg.dec=0D
++=0D
++[LibraryClasses]=0D
++  GoogleTestLib=0D
++  DebugLib=0D
++  NetLib=0D
++  PcdLib=0D
++=0D
++[Protocols]=0D
++  gEfiDhcp6ServiceBindingProtocolGuid=0D
++=0D
++[Pcd]=0D
++  gEfiNetworkPkgTokenSpaceGuid.PcdDhcp6UidType=0D
++=0D
++[Guids]=0D
++  gZeroGuid=0D
+diff --git a/NetworkPkg/Ip6Dxe/GoogleTest/Ip6OptionGoogleTest.cpp b/Networ=
kPkg/Ip6Dxe/GoogleTest/Ip6OptionGoogleTest.cpp
+new file mode 100644
+index 0000000000..f2cd90e1a9
+--- /dev/null
++++ b/NetworkPkg/Ip6Dxe/GoogleTest/Ip6OptionGoogleTest.cpp
+@@ -0,0 +1,129 @@
++/** @file=0D
++  Tests for Ip6Option.c.=0D
++=0D
++  Copyright (c) Microsoft Corporation=0D
++  SPDX-License-Identifier: BSD-2-Clause-Patent=0D
++**/=0D
++#include <gtest/gtest.h>=0D
++=0D
++extern "C" {=0D
++  #include <Uefi.h>=0D
++  #include <Library/BaseLib.h>=0D
++  #include <Library/DebugLib.h>=0D
++  #include "../Ip6Impl.h"=0D
++  #include "../Ip6Option.h"=0D
++}=0D
++=0D
++/////////////////////////////////////////////////////////////////////////=
=0D
++// Defines=0D
++///////////////////////////////////////////////////////////////////////=0D
++=0D
++#define IP6_PREFIX_INFO_OPTION_DATA_LEN    32=0D
++#define OPTION_HEADER_IP6_PREFIX_DATA_LEN  (sizeof (IP6_OPTION_HEADER) + =
IP6_PREFIX_INFO_OPTION_DATA_LEN)=0D
++=0D
++////////////////////////////////////////////////////////////////////////=
=0D
++// Symbol Definitions=0D
++// These functions are not directly under test - but required to compile=
=0D
++////////////////////////////////////////////////////////////////////////=
=0D
++UINT32  mIp6Id;=0D
++=0D
++EFI_STATUS=0D
++Ip6SendIcmpError (=0D
++  IN IP6_SERVICE       *IpSb,=0D
++  IN NET_BUF           *Packet,=0D
++  IN EFI_IPv6_ADDRESS  *SourceAddress       OPTIONAL,=0D
++  IN EFI_IPv6_ADDRESS  *DestinationAddress,=0D
++  IN UINT8             Type,=0D
++  IN UINT8             Code,=0D
++  IN UINT32            *Pointer             OPTIONAL=0D
++  )=0D
++{=0D
++  // ..=0D
++  return EFI_SUCCESS;=0D
++}=0D
++=0D
++////////////////////////////////////////////////////////////////////////=
=0D
++// Ip6OptionValidation Tests=0D
++////////////////////////////////////////////////////////////////////////=
=0D
++=0D
++// Define a fixture for your tests if needed=0D
++class Ip6OptionValidationTest : public ::testing::Test {=0D
++protected:=0D
++  // Add any setup code if needed=0D
++  virtual void=0D
++  SetUp (=0D
++    )=0D
++  {=0D
++    // Initialize any resources or variables=0D
++  }=0D
++=0D
++  // Add any cleanup code if needed=0D
++  virtual void=0D
++  TearDown (=0D
++    )=0D
++  {=0D
++    // Clean up any resources or variables=0D
++  }=0D
++};=0D
++=0D
++// Test Description:=0D
++// Null option should return false=0D
++TEST_F (Ip6OptionValidationTest, NullOptionShouldReturnFalse) {=0D
++  UINT8   *option   =3D nullptr;=0D
++  UINT16  optionLen =3D 10; // Provide a suitable length=0D
++=0D
++  EXPECT_FALSE (Ip6IsNDOptionValid (option, optionLen));=0D
++}=0D
++=0D
++// Test Description:=0D
++// Truncated option should return false=0D
++TEST_F (Ip6OptionValidationTest, TruncatedOptionShouldReturnFalse) {=0D
++  UINT8   option[]  =3D { 0x01 }; // Provide a truncated option=0D
++  UINT16  optionLen =3D 1;=0D
++=0D
++  EXPECT_FALSE (Ip6IsNDOptionValid (option, optionLen));=0D
++}=0D
++=0D
++// Test Description:=0D
++// Ip6OptionPrefixInfo Option with zero length should return false=0D
++TEST_F (Ip6OptionValidationTest, OptionWithZeroLengthShouldReturnFalse) {=
=0D
++  IP6_OPTION_HEADER  optionHeader;=0D
++=0D
++  optionHeader.Type   =3D Ip6OptionPrefixInfo;=0D
++  optionHeader.Length =3D 0;=0D
++  UINT8  option[sizeof (IP6_OPTION_HEADER)];=0D
++=0D
++  CopyMem (option, &optionHeader, sizeof (IP6_OPTION_HEADER));=0D
++  UINT16  optionLen =3D sizeof (IP6_OPTION_HEADER);=0D
++=0D
++  EXPECT_FALSE (Ip6IsNDOptionValid (option, optionLen));=0D
++}=0D
++=0D
++// Test Description:=0D
++// Ip6OptionPrefixInfo Option with valid length should return true=0D
++TEST_F (Ip6OptionValidationTest, ValidPrefixInfoOptionShouldReturnTrue) {=
=0D
++  IP6_OPTION_HEADER  optionHeader;=0D
++=0D
++  optionHeader.Type   =3D Ip6OptionPrefixInfo;=0D
++  optionHeader.Length =3D 4; // Length 4 * 8 =3D 32=0D
++  UINT8  option[OPTION_HEADER_IP6_PREFIX_DATA_LEN];=0D
++=0D
++  CopyMem (option, &optionHeader, sizeof (IP6_OPTION_HEADER));=0D
++=0D
++  EXPECT_TRUE (Ip6IsNDOptionValid (option, IP6_PREFIX_INFO_OPTION_DATA_LE=
N));=0D
++}=0D
++=0D
++// Test Description:=0D
++// Ip6OptionPrefixInfo Option with invalid length should return false=0D
++TEST_F (Ip6OptionValidationTest, InvalidPrefixInfoOptionLengthShouldRetur=
nFalse) {=0D
++  IP6_OPTION_HEADER  optionHeader;=0D
++=0D
++  optionHeader.Type   =3D Ip6OptionPrefixInfo;=0D
++  optionHeader.Length =3D 3; // Length 3 * 8 =3D 24 (Invalid)=0D
++  UINT8  option[sizeof (IP6_OPTION_HEADER)];=0D
++=0D
++  CopyMem (option, &optionHeader, sizeof (IP6_OPTION_HEADER));=0D
++  UINT16  optionLen =3D sizeof (IP6_OPTION_HEADER);=0D
++=0D
++  EXPECT_FALSE (Ip6IsNDOptionValid (option, optionLen));=0D
++}=0D
+--=20
+2.40.0
+
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ov=
mf_git.bb
index 957a74aabe..e46b3ddebe 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -35,6 +35,8 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=
=3Dmaster;protocol=3Dhttps \
            file://CVE-2022-36764-0003.patch \
            file://CVE-2023-45230-0001.patch \
            file://CVE-2023-45230-0002.patch \
+           file://CVE-2023-45231-0001.patch \
+           file://CVE-2023-45231-0002.patch \
            "
=20
 PV =3D "edk2-stable202202"
--=20
2.25.1


