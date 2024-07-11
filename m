Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4461C3DA4A
	for <webhook@archiver.kernel.org>; Thu, 11 Jul 2024 04:56:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.4943.1720673774361932422
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 21:56:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=79227d51f5=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46B4TWx6031011
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 21:56:14 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4075eg48nw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 21:56:13 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 21:56:11 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 07/11] ovmf: Fix CVE-2023-45235
Date: Thu, 11 Jul 2024 04:55:37 +0000
Message-ID: <20240711045541.2155076-7-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20240711045541.2155076-1-soumya.sambu@windriver.com>
References: <20240711045541.2155076-1-soumya.sambu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: VMBnCmTwnsE6HYSIPPlTvNF9u-STte2q
X-Proofpoint-ORIG-GUID: VMBnCmTwnsE6HYSIPPlTvNF9u-STte2q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-11_01,2024-07-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0
 mlxscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407110031
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 04:56:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201757

From: Soumya Sambu <soumya.sambu@windriver.com>

EDK2's Network Package is susceptible to a buffer overflow vulnerability
when handling Server ID option from a DHCPv6 proxy Advertise message.
This vulnerability can be exploited by an attacker to gain unauthorized
access and potentially lead to a loss of Confidentiality, Integrity
and/or Availability.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-45235

Upstream-patches:
https://github.com/tianocore/edk2/commit/fac297724e6cc343430cd0104e55cd7a96=
d1151e
https://github.com/tianocore/edk2/commit/ff2986358f75d8f58ef08a66fe673539c9=
c48f41

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../ovmf/ovmf/CVE-2023-45235-0001.patch       | 243 +++++++++++
 .../ovmf/ovmf/CVE-2023-45235-0002.patch       | 379 ++++++++++++++++++
 meta/recipes-core/ovmf/ovmf_git.bb            |   2 +
 3 files changed, 624 insertions(+)
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2023-45235-0001.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2023-45235-0002.patch

diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2023-45235-0001.patch b/meta/r=
ecipes-core/ovmf/ovmf/CVE-2023-45235-0001.patch
new file mode 100644
index 0000000000..264172f623
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/CVE-2023-45235-0001.patch
@@ -0,0 +1,243 @@
+From fac297724e6cc343430cd0104e55cd7a96d1151e Mon Sep 17 00:00:00 2001
+From: Doug Flick <dougflick@microsoft.com>
+Date: Fri, 26 Jan 2024 05:54:55 +0800
+Subject: [PATCH] NetworkPkg: UefiPxeBcDxe: SECURITY PATCH CVE-2023-45235 P=
atch
+
+REF:https://bugzilla.tianocore.org/show_bug.cgi?id=3D4540
+
+Bug Details:
+PixieFail Bug #7
+CVE-2023-45235
+CVSS 8.3 : CVSS:3.1/AV:A/AC:L/PR:N/UI:N/S:U/C:H/I:L/A:H
+CWE-119 Improper Restriction of Operations within the Bounds of
+ a Memory Buffer
+
+Buffer overflow when handling Server ID option from a DHCPv6 proxy
+Advertise message
+
+Change Overview:
+
+Performs two checks
+
+1. Checks that the length of the duid is accurate
+> + //
+> + // Check that the minimum and maximum requirements are met
+> + //
+> + if ((OpLen < PXEBC_MIN_SIZE_OF_DUID) ||
+(OpLen > PXEBC_MAX_SIZE_OF_DUID)) {
+> +  Status =3D EFI_INVALID_PARAMETER;
+> +  goto ON_ERROR;
+> + }
+
+2. Ensures that the amount of data written to the buffer is tracked and
+never exceeds that
+> + //
+> + // Check that the option length is valid.
+> + //
+> + if ((DiscoverLen + OpLen + PXEBC_COMBINED_SIZE_OF_OPT_CODE_AND_LEN)
+ > DiscoverLenNeeded) {
+> +     Status =3D EFI_OUT_OF_RESOURCES;
+> +     goto ON_ERROR;
+> + }
+
+Additional code clean up and fix for memory leak in case Option was NULL
+
+Cc: Saloni Kasbekar <saloni.kasbekar@intel.com>
+Cc: Zachary Clark-williams <zachary.clark-williams@intel.com>
+
+Signed-off-by: Doug Flick [MSFT] <doug.edk2@gmail.com>
+Reviewed-by: Saloni Kasbekar <saloni.kasbekar@intel.com>
+
+CVE: CVE-2023-45235
+
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/fac297=
724e6cc343430cd0104e55cd7a96d1151e]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ NetworkPkg/UefiPxeBcDxe/PxeBcDhcp6.c | 77 ++++++++++++++++++++++------
+ NetworkPkg/UefiPxeBcDxe/PxeBcDhcp6.h | 17 ++++++
+ 2 files changed, 78 insertions(+), 16 deletions(-)
+
+diff --git a/NetworkPkg/UefiPxeBcDxe/PxeBcDhcp6.c b/NetworkPkg/UefiPxeBcDx=
e/PxeBcDhcp6.c
+index 2b2d372889..7fd1281c11 100644
+--- a/NetworkPkg/UefiPxeBcDxe/PxeBcDhcp6.c
++++ b/NetworkPkg/UefiPxeBcDxe/PxeBcDhcp6.c
+@@ -887,6 +887,7 @@ PxeBcRequestBootService (
+   EFI_STATUS                       Status;=0D
+   EFI_DHCP6_PACKET                 *IndexOffer;=0D
+   UINT8                            *Option;=0D
++  UINTN                            DiscoverLenNeeded;=0D
+ =0D
+   PxeBc      =3D &Private->PxeBc;=0D
+   Request    =3D Private->Dhcp6Request;=0D
+@@ -899,7 +900,8 @@ PxeBcRequestBootService (
+     return EFI_DEVICE_ERROR;=0D
+   }=0D
+ =0D
+-  Discover =3D AllocateZeroPool (sizeof (EFI_PXE_BASE_CODE_DHCPV6_PACKET)=
);=0D
++  DiscoverLenNeeded =3D sizeof (EFI_PXE_BASE_CODE_DHCPV6_PACKET);=0D
++  Discover          =3D AllocateZeroPool (DiscoverLenNeeded);=0D
+   if (Discover =3D=3D NULL) {=0D
+     return EFI_OUT_OF_RESOURCES;=0D
+   }=0D
+@@ -924,16 +926,34 @@ PxeBcRequestBootService (
+                DHCP6_OPT_SERVER_ID=0D
+                );=0D
+     if (Option =3D=3D NULL) {=0D
+-      return EFI_NOT_FOUND;=0D
++      Status =3D EFI_NOT_FOUND;=0D
++      goto ON_ERROR;=0D
+     }=0D
+ =0D
+     //=0D
+     // Add Server ID Option.=0D
+     //=0D
+     OpLen =3D NTOHS (((EFI_DHCP6_PACKET_OPTION *)Option)->OpLen);=0D
+-    CopyMem (DiscoverOpt, Option, OpLen + 4);=0D
+-    DiscoverOpt +=3D (OpLen + 4);=0D
+-    DiscoverLen +=3D (OpLen + 4);=0D
++=0D
++    //=0D
++    // Check that the minimum and maximum requirements are met=0D
++    //=0D
++    if ((OpLen < PXEBC_MIN_SIZE_OF_DUID) || (OpLen > PXEBC_MAX_SIZE_OF_DU=
ID)) {=0D
++      Status =3D EFI_INVALID_PARAMETER;=0D
++      goto ON_ERROR;=0D
++    }=0D
++=0D
++    //=0D
++    // Check that the option length is valid.=0D
++    //=0D
++    if ((DiscoverLen + OpLen + PXEBC_COMBINED_SIZE_OF_OPT_CODE_AND_LEN) >=
 DiscoverLenNeeded) {=0D
++      Status =3D EFI_OUT_OF_RESOURCES;=0D
++      goto ON_ERROR;=0D
++    }=0D
++=0D
++    CopyMem (DiscoverOpt, Option, OpLen + PXEBC_COMBINED_SIZE_OF_OPT_CODE=
_AND_LEN);=0D
++    DiscoverOpt +=3D (OpLen + PXEBC_COMBINED_SIZE_OF_OPT_CODE_AND_LEN);=0D
++    DiscoverLen +=3D (OpLen + PXEBC_COMBINED_SIZE_OF_OPT_CODE_AND_LEN);=0D
+   }=0D
+ =0D
+   while (RequestLen < Request->Length) {=0D
+@@ -944,16 +964,24 @@ PxeBcRequestBootService (
+         (OpCode !=3D DHCP6_OPT_SERVER_ID)=0D
+         )=0D
+     {=0D
++      //=0D
++      // Check that the option length is valid.=0D
++      //=0D
++      if (DiscoverLen + OpLen + PXEBC_COMBINED_SIZE_OF_OPT_CODE_AND_LEN >=
 DiscoverLenNeeded) {=0D
++        Status =3D EFI_OUT_OF_RESOURCES;=0D
++        goto ON_ERROR;=0D
++      }=0D
++=0D
+       //=0D
+       // Copy all the options except IA option and Server ID=0D
+       //=0D
+-      CopyMem (DiscoverOpt, RequestOpt, OpLen + 4);=0D
+-      DiscoverOpt +=3D (OpLen + 4);=0D
+-      DiscoverLen +=3D (OpLen + 4);=0D
++      CopyMem (DiscoverOpt, RequestOpt, OpLen + PXEBC_COMBINED_SIZE_OF_OP=
T_CODE_AND_LEN);=0D
++      DiscoverOpt +=3D (OpLen + PXEBC_COMBINED_SIZE_OF_OPT_CODE_AND_LEN);=
=0D
++      DiscoverLen +=3D (OpLen + PXEBC_COMBINED_SIZE_OF_OPT_CODE_AND_LEN);=
=0D
+     }=0D
+ =0D
+-    RequestOpt +=3D (OpLen + 4);=0D
+-    RequestLen +=3D (OpLen + 4);=0D
++    RequestOpt +=3D (OpLen + PXEBC_COMBINED_SIZE_OF_OPT_CODE_AND_LEN);=0D
++    RequestLen +=3D (OpLen + PXEBC_COMBINED_SIZE_OF_OPT_CODE_AND_LEN);=0D
+   }=0D
+ =0D
+   //=0D
+@@ -2154,6 +2182,7 @@ PxeBcDhcp6Discover (
+   UINT16                           OpLen;=0D
+   UINT32                           Xid;=0D
+   EFI_STATUS                       Status;=0D
++  UINTN                            DiscoverLenNeeded;=0D
+ =0D
+   PxeBc    =3D &Private->PxeBc;=0D
+   Mode     =3D PxeBc->Mode;=0D
+@@ -2169,7 +2198,8 @@ PxeBcDhcp6Discover (
+     return EFI_DEVICE_ERROR;=0D
+   }=0D
+ =0D
+-  Discover =3D AllocateZeroPool (sizeof (EFI_PXE_BASE_CODE_DHCPV6_PACKET)=
);=0D
++  DiscoverLenNeeded =3D sizeof (EFI_PXE_BASE_CODE_DHCPV6_PACKET);=0D
++  Discover          =3D AllocateZeroPool (DiscoverLenNeeded);=0D
+   if (Discover =3D=3D NULL) {=0D
+     return EFI_OUT_OF_RESOURCES;=0D
+   }=0D
+@@ -2185,22 +2215,37 @@ PxeBcDhcp6Discover (
+   DiscoverLen             =3D sizeof (EFI_DHCP6_HEADER);=0D
+   RequestLen              =3D DiscoverLen;=0D
+ =0D
++  //=0D
++  // The request packet is generated by the UEFI network stack. In the DH=
CP4 DORA and DHCP6 SARR sequence,=0D
++  // the first (discover in DHCP4 and solicit in DHCP6) and third (reques=
t in both DHCP4 and DHCP6) are=0D
++  // generated by the DHCP client (the UEFI network stack in this case). =
By the time this function executes,=0D
++  // the DHCP sequence already has been executed once (see UEFI Specifica=
tion Figures 24.2 and 24.3), with=0D
++  // Private->Dhcp6Request being a cached copy of the DHCP6 request packe=
t that UEFI network stack previously=0D
++  // generated and sent.=0D
++  //=0D
++  // Therefore while this code looks like it could overflow, in practice =
it's not possible.=0D
++  //=0D
+   while (RequestLen < Request->Length) {=0D
+     OpCode =3D NTOHS (((EFI_DHCP6_PACKET_OPTION *)RequestOpt)->OpCode);=0D
+     OpLen  =3D NTOHS (((EFI_DHCP6_PACKET_OPTION *)RequestOpt)->OpLen);=0D
+     if ((OpCode !=3D EFI_DHCP6_IA_TYPE_NA) &&=0D
+         (OpCode !=3D EFI_DHCP6_IA_TYPE_TA))=0D
+     {=0D
++      if (DiscoverLen + OpLen + PXEBC_COMBINED_SIZE_OF_OPT_CODE_AND_LEN >=
 DiscoverLenNeeded) {=0D
++        Status =3D EFI_OUT_OF_RESOURCES;=0D
++        goto ON_ERROR;=0D
++      }=0D
++=0D
+       //=0D
+       // Copy all the options except IA option.=0D
+       //=0D
+-      CopyMem (DiscoverOpt, RequestOpt, OpLen + 4);=0D
+-      DiscoverOpt +=3D (OpLen + 4);=0D
+-      DiscoverLen +=3D (OpLen + 4);=0D
++      CopyMem (DiscoverOpt, RequestOpt, OpLen + PXEBC_COMBINED_SIZE_OF_OP=
T_CODE_AND_LEN);=0D
++      DiscoverOpt +=3D (OpLen + PXEBC_COMBINED_SIZE_OF_OPT_CODE_AND_LEN);=
=0D
++      DiscoverLen +=3D (OpLen + PXEBC_COMBINED_SIZE_OF_OPT_CODE_AND_LEN);=
=0D
+     }=0D
+ =0D
+-    RequestOpt +=3D (OpLen + 4);=0D
+-    RequestLen +=3D (OpLen + 4);=0D
++    RequestOpt +=3D (OpLen + PXEBC_COMBINED_SIZE_OF_OPT_CODE_AND_LEN);=0D
++    RequestLen +=3D (OpLen + PXEBC_COMBINED_SIZE_OF_OPT_CODE_AND_LEN);=0D
+   }=0D
+ =0D
+   Status =3D PxeBc->UdpWrite (=0D
+diff --git a/NetworkPkg/UefiPxeBcDxe/PxeBcDhcp6.h b/NetworkPkg/UefiPxeBcDx=
e/PxeBcDhcp6.h
+index c86f6d391b..6357d27fae 100644
+--- a/NetworkPkg/UefiPxeBcDxe/PxeBcDhcp6.h
++++ b/NetworkPkg/UefiPxeBcDxe/PxeBcDhcp6.h
+@@ -34,6 +34,23 @@
+ #define PXEBC_ADDR_START_DELIMITER        '['=0D
+ #define PXEBC_ADDR_END_DELIMITER          ']'=0D
+ =0D
++//=0D
++// A DUID consists of a 2-octet type code represented in network byte=0D
++// order, followed by a variable number of octets that make up the=0D
++// actual identifier.  The length of the DUID (not including the type=0D
++// code) is at least 1 octet and at most 128 octets.=0D
++//=0D
++#define PXEBC_MIN_SIZE_OF_DUID  (sizeof(UINT16) + 1)=0D
++#define PXEBC_MAX_SIZE_OF_DUID  (sizeof(UINT16) + 128)=0D
++=0D
++//=0D
++// This define represents the combineds code and length field from=0D
++// https://datatracker.ietf.org/doc/html/rfc3315#section-22.1=0D
++//=0D
++#define PXEBC_COMBINED_SIZE_OF_OPT_CODE_AND_LEN  \=0D
++      (sizeof (((EFI_DHCP6_PACKET_OPTION *)0)->OpCode) + \=0D
++      sizeof (((EFI_DHCP6_PACKET_OPTION *)0)->OpLen))=0D
++=0D
+ #define GET_NEXT_DHCP6_OPTION(Opt) \=0D
+   (EFI_DHCP6_PACKET_OPTION *) ((UINT8 *) (Opt) + \=0D
+   sizeof (EFI_DHCP6_PACKET_OPTION) + (NTOHS ((Opt)->OpLen)) - 1)=0D
+--=20
+2.40.0
+
diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2023-45235-0002.patch b/meta/r=
ecipes-core/ovmf/ovmf/CVE-2023-45235-0002.patch
new file mode 100644
index 0000000000..0e814a0212
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/CVE-2023-45235-0002.patch
@@ -0,0 +1,379 @@
+From ff2986358f75d8f58ef08a66fe673539c9c48f41 Mon Sep 17 00:00:00 2001
+From: Doug Flick <dougflick@microsoft.com>
+Date: Fri, 26 Jan 2024 05:54:56 +0800
+Subject: [PATCH] NetworkPkg: UefiPxeBcDxe: SECURITY PATCH CVE-2023-45235 U=
nit=20
+ Tests
+
+REF:https://bugzilla.tianocore.org/show_bug.cgi?id=3D4540
+
+Unit tests to confirm that the bug..
+
+Buffer overflow when handling Server ID option from a DHCPv6 proxy
+Advertise message
+
+..has been patched.
+
+This patch contains unit tests for the following functions:
+PxeBcRequestBootService
+PxeBcDhcp6Discover
+
+Cc: Saloni Kasbekar <saloni.kasbekar@intel.com>
+Cc: Zachary Clark-williams <zachary.clark-williams@intel.com>
+
+Signed-off-by: Doug Flick [MSFT] <doug.edk2@gmail.com>
+Reviewed-by: Saloni Kasbekar <saloni.kasbekar@intel.com>
+
+CVE: CVE-2023-45235
+
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/ff2986=
358f75d8f58ef08a66fe673539c9c48f41]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ .../GoogleTest/PxeBcDhcp6GoogleTest.cpp       | 278 +++++++++++++++++-
+ .../GoogleTest/PxeBcDhcp6GoogleTest.h         |  18 ++
+ 2 files changed, 294 insertions(+), 2 deletions(-)
+
+diff --git a/NetworkPkg/UefiPxeBcDxe/GoogleTest/PxeBcDhcp6GoogleTest.cpp b=
/NetworkPkg/UefiPxeBcDxe/GoogleTest/PxeBcDhcp6GoogleTest.cpp
+index 8260eeee50..bd423ebadf 100644
+--- a/NetworkPkg/UefiPxeBcDxe/GoogleTest/PxeBcDhcp6GoogleTest.cpp
++++ b/NetworkPkg/UefiPxeBcDxe/GoogleTest/PxeBcDhcp6GoogleTest.cpp
+@@ -4,7 +4,9 @@
+   Copyright (c) Microsoft Corporation=0D
+   SPDX-License-Identifier: BSD-2-Clause-Patent=0D
+ **/=0D
+-#include <gtest/gtest.h>=0D
++#include <Library/GoogleTestLib.h>=0D
++#include <GoogleTest/Library/MockUefiLib.h>=0D
++#include <GoogleTest/Library/MockUefiRuntimeServicesTableLib.h>=0D
+ =0D
+ extern "C" {=0D
+   #include <Uefi.h>=0D
+@@ -19,7 +21,8 @@ extern "C" {
+ // Definitions=0D
+ /////////////////////////////////////////////////////////////////////////=
//////=0D
+ =0D
+-#define PACKET_SIZE  (1500)=0D
++#define PACKET_SIZE            (1500)=0D
++#define REQUEST_OPTION_LENGTH  (120)=0D
+ =0D
+ typedef struct {=0D
+   UINT16    OptionCode;   // The option code for DHCP6_OPT_SERVER_ID (e.g=
., 0x03)=0D
+@@ -76,6 +79,26 @@ MockConfigure (
+ }=0D
+ =0D
+ // Needed by PxeBcSupport=0D
++EFI_STATUS=0D
++PxeBcDns6 (=0D
++  IN PXEBC_PRIVATE_DATA  *Private,=0D
++  IN     CHAR16          *HostName,=0D
++  OUT EFI_IPv6_ADDRESS   *IpAddress=0D
++  )=0D
++{=0D
++  return EFI_SUCCESS;=0D
++}=0D
++=0D
++UINT32=0D
++PxeBcBuildDhcp6Options (=0D
++  IN  PXEBC_PRIVATE_DATA       *Private,=0D
++  OUT EFI_DHCP6_PACKET_OPTION  **OptList,=0D
++  IN  UINT8                    *Buffer=0D
++  )=0D
++{=0D
++  return EFI_SUCCESS;=0D
++}=0D
++=0D
+ EFI_STATUS=0D
+ EFIAPI=0D
+ QueueDpc (=0D
+@@ -159,6 +182,10 @@ TEST_F (PxeBcHandleDhcp6OfferTest, BasicUsageTest) {
+   ASSERT_EQ (PxeBcHandleDhcp6Offer (&(PxeBcHandleDhcp6OfferTest::Private)=
), EFI_DEVICE_ERROR);=0D
+ }=0D
+ =0D
++/////////////////////////////////////////////////////////////////////////=
//////=0D
++// PxeBcCacheDnsServerAddresses Tests=0D
++/////////////////////////////////////////////////////////////////////////=
//////=0D
++=0D
+ class PxeBcCacheDnsServerAddressesTest : public ::testing::Test {=0D
+ public:=0D
+   PXEBC_PRIVATE_DATA Private =3D { 0 };=0D
+@@ -298,3 +325,250 @@ TEST_F (PxeBcCacheDnsServerAddressesTest, MultipleDn=
sEntries) {
+     FreePool (Private.DnsServer);=0D
+   }=0D
+ }=0D
++=0D
++/////////////////////////////////////////////////////////////////////////=
//////=0D
++// PxeBcRequestBootServiceTest Test Cases=0D
++/////////////////////////////////////////////////////////////////////////=
//////=0D
++=0D
++class PxeBcRequestBootServiceTest : public ::testing::Test {=0D
++public:=0D
++  PXEBC_PRIVATE_DATA Private =3D { 0 };=0D
++  EFI_UDP6_PROTOCOL Udp6Read;=0D
++=0D
++protected:=0D
++  // Add any setup code if needed=0D
++  virtual void=0D
++  SetUp (=0D
++    )=0D
++  {=0D
++    Private.Dhcp6Request =3D (EFI_DHCP6_PACKET *)AllocateZeroPool (PACKET=
_SIZE);=0D
++=0D
++    // Need to setup the EFI_PXE_BASE_CODE_PROTOCOL=0D
++    // The function under test really only needs the following:=0D
++    //  UdpWrite=0D
++    //  UdpRead=0D
++=0D
++    Private.PxeBc.UdpWrite =3D (EFI_PXE_BASE_CODE_UDP_WRITE)MockUdpWrite;=
=0D
++    Private.PxeBc.UdpRead  =3D (EFI_PXE_BASE_CODE_UDP_READ)MockUdpRead;=0D
++=0D
++    // Need to setup EFI_UDP6_PROTOCOL=0D
++    // The function under test really only needs the following:=0D
++    //  Configure=0D
++=0D
++    Udp6Read.Configure =3D (EFI_UDP6_CONFIGURE)MockConfigure;=0D
++    Private.Udp6Read   =3D &Udp6Read;=0D
++  }=0D
++=0D
++  // Add any cleanup code if needed=0D
++  virtual void=0D
++  TearDown (=0D
++    )=0D
++  {=0D
++    if (Private.Dhcp6Request !=3D NULL) {=0D
++      FreePool (Private.Dhcp6Request);=0D
++    }=0D
++=0D
++    // Clean up any resources or variables=0D
++  }=0D
++};=0D
++=0D
++TEST_F (PxeBcRequestBootServiceTest, ServerDiscoverBasicUsageTest) {=0D
++  PxeBcRequestBootServiceTest::Private.OfferBuffer[0].Dhcp6.OfferType =3D=
 PxeOfferTypeProxyBinl;=0D
++=0D
++  DHCP6_OPTION_SERVER_ID  Server =3D { 0 };=0D
++=0D
++  Server.OptionCode =3D  HTONS (DHCP6_OPT_SERVER_ID);=0D
++  Server.OptionLen  =3D HTONS (16); // valid length=0D
++  UINT8  Index =3D 0;=0D
++=0D
++  EFI_DHCP6_PACKET  *Packet =3D (EFI_DHCP6_PACKET *)&Private.OfferBuffer[=
Index].Dhcp6.Packet.Offer;=0D
++=0D
++  UINT8  *Cursor =3D (UINT8 *)(Packet->Dhcp6.Option);=0D
++=0D
++  CopyMem (Cursor, &Server, sizeof (Server));=0D
++  Cursor +=3D sizeof (Server);=0D
++=0D
++  // Update the packet length=0D
++  Packet->Length =3D (UINT16)(Cursor - (UINT8 *)Packet);=0D
++  Packet->Size   =3D PACKET_SIZE;=0D
++=0D
++  ASSERT_EQ (PxeBcRequestBootService (&(PxeBcRequestBootServiceTest::Priv=
ate), Index), EFI_SUCCESS);=0D
++}=0D
++=0D
++TEST_F (PxeBcRequestBootServiceTest, AttemptDiscoverOverFlowExpectFailure=
) {=0D
++  PxeBcRequestBootServiceTest::Private.OfferBuffer[0].Dhcp6.OfferType =3D=
 PxeOfferTypeProxyBinl;=0D
++=0D
++  DHCP6_OPTION_SERVER_ID  Server =3D { 0 };=0D
++=0D
++  Server.OptionCode =3D  HTONS (DHCP6_OPT_SERVER_ID);=0D
++  Server.OptionLen  =3D HTONS (1500); // This length would overflow witho=
ut a check=0D
++  UINT8  Index =3D 0;=0D
++=0D
++  EFI_DHCP6_PACKET  *Packet =3D (EFI_DHCP6_PACKET *)&Private.OfferBuffer[=
Index].Dhcp6.Packet.Offer;=0D
++=0D
++  UINT8  *Cursor =3D (UINT8 *)(Packet->Dhcp6.Option);=0D
++=0D
++  CopyMem (Cursor, &Server, sizeof (Server));=0D
++  Cursor +=3D sizeof (Server);=0D
++=0D
++  // Update the packet length=0D
++  Packet->Length =3D (UINT16)(Cursor - (UINT8 *)Packet);=0D
++  Packet->Size   =3D PACKET_SIZE;=0D
++=0D
++  // This is going to be stopped by the duid overflow check=0D
++  ASSERT_EQ (PxeBcRequestBootService (&(PxeBcRequestBootServiceTest::Priv=
ate), Index), EFI_INVALID_PARAMETER);=0D
++}=0D
++=0D
++TEST_F (PxeBcRequestBootServiceTest, RequestBasicUsageTest) {=0D
++  EFI_DHCP6_PACKET_OPTION  RequestOpt =3D { 0 }; // the data section does=
n't really matter=0D
++=0D
++  RequestOpt.OpCode =3D HTONS (0x1337);=0D
++  RequestOpt.OpLen  =3D 0; // valid length=0D
++=0D
++  UINT8  Index =3D 0;=0D
++=0D
++  EFI_DHCP6_PACKET  *Packet =3D (EFI_DHCP6_PACKET *)&Private.Dhcp6Request=
[Index];=0D
++=0D
++  UINT8  *Cursor =3D (UINT8 *)(Packet->Dhcp6.Option);=0D
++=0D
++  CopyMem (Cursor, &RequestOpt, sizeof (RequestOpt));=0D
++  Cursor +=3D sizeof (RequestOpt);=0D
++=0D
++  // Update the packet length=0D
++  Packet->Length =3D (UINT16)(Cursor - (UINT8 *)Packet);=0D
++  Packet->Size   =3D PACKET_SIZE;=0D
++=0D
++  ASSERT_EQ (PxeBcRequestBootService (&(PxeBcRequestBootServiceTest::Priv=
ate), Index), EFI_SUCCESS);=0D
++}=0D
++=0D
++TEST_F (PxeBcRequestBootServiceTest, AttemptRequestOverFlowExpectFailure)=
 {=0D
++  EFI_DHCP6_PACKET_OPTION  RequestOpt =3D { 0 }; // the data section does=
n't really matter=0D
++=0D
++  RequestOpt.OpCode =3D HTONS (0x1337);=0D
++  RequestOpt.OpLen  =3D 1500; // this length would overflow without a che=
ck=0D
++=0D
++  UINT8  Index =3D 0;=0D
++=0D
++  EFI_DHCP6_PACKET  *Packet =3D (EFI_DHCP6_PACKET *)&Private.Dhcp6Request=
[Index];=0D
++=0D
++  UINT8  *Cursor =3D (UINT8 *)(Packet->Dhcp6.Option);=0D
++=0D
++  CopyMem (Cursor, &RequestOpt, sizeof (RequestOpt));=0D
++  Cursor +=3D sizeof (RequestOpt);=0D
++=0D
++  // Update the packet length=0D
++  Packet->Length =3D (UINT16)(Cursor - (UINT8 *)Packet);=0D
++  Packet->Size   =3D PACKET_SIZE;=0D
++=0D
++  ASSERT_EQ (PxeBcRequestBootService (&(PxeBcRequestBootServiceTest::Priv=
ate), Index), EFI_OUT_OF_RESOURCES);=0D
++}=0D
++=0D
++/////////////////////////////////////////////////////////////////////////=
//////=0D
++// PxeBcDhcp6Discover Test=0D
++/////////////////////////////////////////////////////////////////////////=
//////=0D
++=0D
++class PxeBcDhcp6DiscoverTest : public ::testing::Test {=0D
++public:=0D
++  PXEBC_PRIVATE_DATA Private =3D { 0 };=0D
++  EFI_UDP6_PROTOCOL Udp6Read;=0D
++=0D
++protected:=0D
++  MockUefiRuntimeServicesTableLib RtServicesMock;=0D
++=0D
++  // Add any setup code if needed=0D
++  virtual void=0D
++  SetUp (=0D
++    )=0D
++  {=0D
++    Private.Dhcp6Request =3D (EFI_DHCP6_PACKET *)AllocateZeroPool (PACKET=
_SIZE);=0D
++=0D
++    // Need to setup the EFI_PXE_BASE_CODE_PROTOCOL=0D
++    // The function under test really only needs the following:=0D
++    //  UdpWrite=0D
++    //  UdpRead=0D
++=0D
++    Private.PxeBc.UdpWrite =3D (EFI_PXE_BASE_CODE_UDP_WRITE)MockUdpWrite;=
=0D
++    Private.PxeBc.UdpRead  =3D (EFI_PXE_BASE_CODE_UDP_READ)MockUdpRead;=0D
++=0D
++    // Need to setup EFI_UDP6_PROTOCOL=0D
++    // The function under test really only needs the following:=0D
++    //  Configure=0D
++=0D
++    Udp6Read.Configure =3D (EFI_UDP6_CONFIGURE)MockConfigure;=0D
++    Private.Udp6Read   =3D &Udp6Read;=0D
++  }=0D
++=0D
++  // Add any cleanup code if needed=0D
++  virtual void=0D
++  TearDown (=0D
++    )=0D
++  {=0D
++    if (Private.Dhcp6Request !=3D NULL) {=0D
++      FreePool (Private.Dhcp6Request);=0D
++    }=0D
++=0D
++    // Clean up any resources or variables=0D
++  }=0D
++};=0D
++=0D
++// Test Description=0D
++// This will cause an overflow by an untrusted packet during the option p=
arsing=0D
++TEST_F (PxeBcDhcp6DiscoverTest, BasicOverflowTest) {=0D
++  EFI_IPv6_ADDRESS         DestIp     =3D { 0 };=0D
++  EFI_DHCP6_PACKET_OPTION  RequestOpt =3D { 0 }; // the data section does=
n't really matter=0D
++=0D
++  RequestOpt.OpCode =3D HTONS (0x1337);=0D
++  RequestOpt.OpLen  =3D HTONS (0xFFFF); // overflow=0D
++=0D
++  UINT8  *Cursor =3D (UINT8 *)(Private.Dhcp6Request->Dhcp6.Option);=0D
++=0D
++  CopyMem (Cursor, &RequestOpt, sizeof (RequestOpt));=0D
++  Cursor +=3D sizeof (RequestOpt);=0D
++=0D
++  Private.Dhcp6Request->Length =3D (UINT16)(Cursor - (UINT8 *)Private.Dhc=
p6Request);=0D
++=0D
++  EXPECT_CALL (RtServicesMock, gRT_GetTime)=0D
++    .WillOnce (::testing::Return (0));=0D
++=0D
++  ASSERT_EQ (=0D
++    PxeBcDhcp6Discover (=0D
++      &(PxeBcDhcp6DiscoverTest::Private),=0D
++      0,=0D
++      NULL,=0D
++      FALSE,=0D
++      (EFI_IP_ADDRESS *)&DestIp=0D
++      ),=0D
++    EFI_OUT_OF_RESOURCES=0D
++    );=0D
++}=0D
++=0D
++// Test Description=0D
++// This will test that we can handle a packet with a valid option length=
=0D
++TEST_F (PxeBcDhcp6DiscoverTest, BasicUsageTest) {=0D
++  EFI_IPv6_ADDRESS         DestIp     =3D { 0 };=0D
++  EFI_DHCP6_PACKET_OPTION  RequestOpt =3D { 0 }; // the data section does=
n't really matter=0D
++=0D
++  RequestOpt.OpCode =3D HTONS (0x1337);=0D
++  RequestOpt.OpLen  =3D HTONS (0x30);=0D
++=0D
++  UINT8  *Cursor =3D (UINT8 *)(Private.Dhcp6Request->Dhcp6.Option);=0D
++=0D
++  CopyMem (Cursor, &RequestOpt, sizeof (RequestOpt));=0D
++  Cursor +=3D sizeof (RequestOpt);=0D
++=0D
++  Private.Dhcp6Request->Length =3D (UINT16)(Cursor - (UINT8 *)Private.Dhc=
p6Request);=0D
++=0D
++  EXPECT_CALL (RtServicesMock, gRT_GetTime)=0D
++    .WillOnce (::testing::Return (0));=0D
++=0D
++  ASSERT_EQ (=0D
++    PxeBcDhcp6Discover (=0D
++      &(PxeBcDhcp6DiscoverTest::Private),=0D
++      0,=0D
++      NULL,=0D
++      FALSE,=0D
++      (EFI_IP_ADDRESS *)&DestIp=0D
++      ),=0D
++    EFI_SUCCESS=0D
++    );=0D
++}=0D
+diff --git a/NetworkPkg/UefiPxeBcDxe/GoogleTest/PxeBcDhcp6GoogleTest.h b/N=
etworkPkg/UefiPxeBcDxe/GoogleTest/PxeBcDhcp6GoogleTest.h
+index b17c314791..0d825e4425 100644
+--- a/NetworkPkg/UefiPxeBcDxe/GoogleTest/PxeBcDhcp6GoogleTest.h
++++ b/NetworkPkg/UefiPxeBcDxe/GoogleTest/PxeBcDhcp6GoogleTest.h
+@@ -47,4 +47,22 @@ PxeBcCacheDnsServerAddresses (
+   IN PXEBC_DHCP6_PACKET_CACHE  *Cache6=0D
+   );=0D
+ =0D
++/**=0D
++  Build and send out the request packet for the bootfile, and parse the r=
eply.=0D
++=0D
++  @param[in]  Private               The pointer to PxeBc private data.=0D
++  @param[in]  Index                 PxeBc option boot item type.=0D
++=0D
++  @retval     EFI_SUCCESS           Successfully discovered the boot file=
.=0D
++  @retval     EFI_OUT_OF_RESOURCES  Failed to allocate resources.=0D
++  @retval     EFI_NOT_FOUND         Can't get the PXE reply packet.=0D
++  @retval     Others                Failed to discover the boot file.=0D
++=0D
++**/=0D
++EFI_STATUS=0D
++PxeBcRequestBootService (=0D
++  IN  PXEBC_PRIVATE_DATA  *Private,=0D
++  IN  UINT32              Index=0D
++  );=0D
++=0D
+ #endif // PXE_BC_DHCP6_GOOGLE_TEST_H_=0D
+--=20
+2.40.0
+
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ov=
mf_git.bb
index ac6a0a40e7..ceebb53438 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -41,6 +41,8 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=
=3Dmaster;protocol=3Dhttps \
            file://CVE-2023-45232-CVE-2023-45233-0002.patch \
            file://CVE-2023-45234-0001.patch \
            file://CVE-2023-45234-0002.patch \
+           file://CVE-2023-45235-0001.patch \
+           file://CVE-2023-45235-0002.patch \
            "
=20
 PV =3D "edk2-stable202202"
--=20
2.40.0


