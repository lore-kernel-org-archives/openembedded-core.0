Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECBFEC3DA4B
	for <webhook@archiver.kernel.org>; Thu, 11 Jul 2024 04:56:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.4946.1720673778343572176
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 21:56:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=79227d51f5=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46B1r21P008766
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 21:56:18 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4075eg48p1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 21:56:17 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 21:56:15 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 09/11] ovmf: Fix CVE-2023-45237
Date: Thu, 11 Jul 2024 04:55:39 +0000
Message-ID: <20240711045541.2155076-9-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20240711045541.2155076-1-soumya.sambu@windriver.com>
References: <20240711045541.2155076-1-soumya.sambu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: p3PBUf4m0jhmQfjpaS7p4DCcCojUCXmo
X-Proofpoint-ORIG-GUID: p3PBUf4m0jhmQfjpaS7p4DCcCojUCXmo
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201759

From: Soumya Sambu <soumya.sambu@windriver.com>

EDK2's Network Package is susceptible to a predictable TCP Initial Sequence
Number. This vulnerability can be exploited by an attacker to gain
unauthorized access and potentially lead to a loss of Confidentiality.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-45237

Upstream-patches:
https://github.com/tianocore/edk2/commit/4c4ceb2ceb80c42fd5545b2a4bd80321f0=
7f4345

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../ovmf/ovmf/CVE-2023-45237-0001.patch       |   78 +
 .../ovmf/ovmf/CVE-2023-45237-0002.patch       | 1288 +++++++++++++++++
 meta/recipes-core/ovmf/ovmf_git.bb            |    2 +
 3 files changed, 1368 insertions(+)
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2023-45237-0001.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2023-45237-0002.patch

diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2023-45237-0001.patch b/meta/r=
ecipes-core/ovmf/ovmf/CVE-2023-45237-0001.patch
new file mode 100644
index 0000000000..d1dcb8dc44
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/CVE-2023-45237-0001.patch
@@ -0,0 +1,78 @@
+From cf07238e5fa4f8b1138ac1c9e80530b4d4e59f1c Mon Sep 17 00:00:00 2001
+From: Pierre Gondois <pierre.gondois@arm.com>
+Date: Fri, 11 Aug 2023 16:33:06 +0200
+Subject: [PATCH] MdePkg/Rng: Add GUID to describe Arm Rndr Rng algorithms
+
+BZ: https://bugzilla.tianocore.org/show_bug.cgi?id=3D4441
+
+The EFI_RNG_PROTOCOL can rely on the RngLib. The RngLib has multiple
+implementations, some of them are unsafe (e.g. BaseRngLibTimerLib).
+To allow the RngDxe to detect when such implementation is used,
+a GetRngGuid() function is added in a following patch.
+
+Prepare GetRngGuid() return values and add a gEfiRngAlgorithmArmRndr
+to describe a Rng algorithm accessed through Arm's RNDR instruction.
+[1] states that the implementation of this algorithm should be
+compliant to NIST SP900-80. The compliance is not guaranteed.
+
+[1] Arm Architecture Reference Manual Armv8, for A-profile architecture
+sK12.1 'Properties of the generated random number'
+
+Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
+Reviewed-by: Sami Mujawar <sami.mujawar@arm.com>
+Reviewed-by: Liming Gao <gaoliming@byosoft.com.cn>
+Acked-by: Ard Biesheuvel <ardb@kernel.org>
+Tested-by: Kun Qin <kun.qin@microsoft.com>
+
+CVE: CVE-2023-45237
+
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/cf0723=
8e5fa4f8b1138ac1c9e80530b4d4e59f1c]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ MdePkg/Include/Protocol/Rng.h | 10 ++++++++++
+ MdePkg/MdePkg.dec             |  1 +
+ 2 files changed, 11 insertions(+)
+
+diff --git a/MdePkg/Include/Protocol/Rng.h b/MdePkg/Include/Protocol/Rng.h
+index baf425587b..38bde53240 100644
+--- a/MdePkg/Include/Protocol/Rng.h
++++ b/MdePkg/Include/Protocol/Rng.h
+@@ -67,6 +67,15 @@ typedef EFI_GUID EFI_RNG_ALGORITHM;
+   { \=0D
+     0xe43176d7, 0xb6e8, 0x4827, {0xb7, 0x84, 0x7f, 0xfd, 0xc4, 0xb6, 0x85=
, 0x61 } \=0D
+   }=0D
++///=0D
++/// The Arm Architecture states the RNDR that the DRBG algorithm should b=
e compliant=0D
++/// with NIST SP800-90A, while not mandating a particular algorithm, so a=
s to be=0D
++/// inclusive of different geographies.=0D
++///=0D
++#define EFI_RNG_ALGORITHM_ARM_RNDR \=0D
++  { \=0D
++    0x43d2fde3, 0x9d4e, 0x4d79,  {0x02, 0x96, 0xa8, 0x9b, 0xca, 0x78, 0x0=
8, 0x41} \=0D
++  }=0D
+ =0D
+ /**=0D
+   Returns information about the random number generation implementation.=
=0D
+@@ -146,5 +155,6 @@ extern EFI_GUID  gEfiRngAlgorithmSp80090Ctr256Guid;
+ extern EFI_GUID  gEfiRngAlgorithmX9313DesGuid;=0D
+ extern EFI_GUID  gEfiRngAlgorithmX931AesGuid;=0D
+ extern EFI_GUID  gEfiRngAlgorithmRaw;=0D
++extern EFI_GUID  gEfiRngAlgorithmArmRndr;=0D
+ =0D
+ #endif=0D
+diff --git a/MdePkg/MdePkg.dec b/MdePkg/MdePkg.dec
+index 59b405928b..a449dbc556 100644
+--- a/MdePkg/MdePkg.dec
++++ b/MdePkg/MdePkg.dec
+@@ -594,6 +594,7 @@
+   gEfiRngAlgorithmX9313DesGuid       =3D { 0x63c4785a, 0xca34, 0x4012, {0=
xa3, 0xc8, 0x0b, 0x6a, 0x32, 0x4f, 0x55, 0x46 }}=0D
+   gEfiRngAlgorithmX931AesGuid        =3D { 0xacd03321, 0x777e, 0x4d3d, {0=
xb1, 0xc8, 0x20, 0xcf, 0xd8, 0x88, 0x20, 0xc9 }}=0D
+   gEfiRngAlgorithmRaw                =3D { 0xe43176d7, 0xb6e8, 0x4827, {0=
xb7, 0x84, 0x7f, 0xfd, 0xc4, 0xb6, 0x85, 0x61 }}=0D
++  gEfiRngAlgorithmArmRndr            =3D { 0x43d2fde3, 0x9d4e, 0x4d79, {0=
x02, 0x96, 0xa8, 0x9b, 0xca, 0x78, 0x08, 0x41 }}=0D
+ =0D
+   ## Include/Protocol/AdapterInformation.h=0D
+   gEfiAdapterInfoMediaStateGuid       =3D { 0xD7C74207, 0xA831, 0x4A26, {=
0xB1, 0xF5, 0xD1, 0x93, 0x06, 0x5C, 0xE8, 0xB6 }}=0D
+--=20
+2.40.0
+
diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2023-45237-0002.patch b/meta/r=
ecipes-core/ovmf/ovmf/CVE-2023-45237-0002.patch
new file mode 100644
index 0000000000..722a6cd530
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/CVE-2023-45237-0002.patch
@@ -0,0 +1,1288 @@
+From 4c4ceb2ceb80c42fd5545b2a4bd80321f07f4345 Mon Sep 17 00:00:00 2001
+From: Doug Flick <dougflick@microsoft.com>
+Date: Wed, 8 May 2024 22:56:28 -0700
+Subject: [PATCH] NetworkPkg: SECURITY PATCH CVE-2023-45237
+
+REF:https://bugzilla.tianocore.org/show_bug.cgi?id=3D4542
+
+Bug Overview:
+PixieFail Bug #9
+CVE-2023-45237
+CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:L/I:N/A:N
+CWE-338 Use of Cryptographically Weak Pseudo-Random Number Generator (PRNG)
+
+Use of a Weak PseudoRandom Number Generator
+
+Change Overview:
+
+Updates all Instances of NET_RANDOM (NetRandomInitSeed ()) to either
+
+>
+> EFI_STATUS
+> EFIAPI
+> PseudoRandomU32 (
+>  OUT UINT32  *Output
+>  );
+>
+
+or (depending on the use case)
+
+>
+> EFI_STATUS
+> EFIAPI
+> PseudoRandom (
+>  OUT  VOID   *Output,
+>  IN   UINTN  OutputLength
+>  );
+>
+
+This is because the use of
+
+Example:
+
+The following code snippet PseudoRandomU32 () function is used:
+
+>
+> UINT32         Random;
+>
+> Status =3D PseudoRandomU32 (&Random);
+> if (EFI_ERROR (Status)) {
+>   DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\n",
+__func__, Status));
+>   return Status;
+> }
+>
+
+This also introduces a new PCD to enable/disable the use of the
+secure implementation of algorithms for PseudoRandom () and
+instead depend on the default implementation. This may be required for
+some platforms where the UEFI Spec defined algorithms are not available.
+
+>
+> PcdEnforceSecureRngAlgorithms
+>
+
+If the platform does not have any one of the UEFI defined
+secure RNG algorithms then the driver will assert.
+
+Cc: Saloni Kasbekar <saloni.kasbekar@intel.com>
+Cc: Zachary Clark-williams <zachary.clark-williams@intel.com>
+
+Signed-off-by: Doug Flick [MSFT] <doug.edk2@gmail.com>
+Reviewed-by: Saloni Kasbekar <saloni.kasbekar@intel.com>
+
+CVE: CVE-2023-45237
+
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/4c4ceb=
2ceb80c42fd5545b2a4bd80321f07f4345]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ NetworkPkg/Dhcp4Dxe/Dhcp4Driver.c          |  10 +-
+ NetworkPkg/Dhcp6Dxe/Dhcp6Driver.c          |  11 +-
+ NetworkPkg/DnsDxe/DnsDhcp.c                |  10 +-
+ NetworkPkg/DnsDxe/DnsImpl.c                |  11 +-
+ NetworkPkg/HttpBootDxe/HttpBootDhcp6.c     |  10 +-
+ NetworkPkg/IScsiDxe/IScsiCHAP.c            |  19 ++-
+ NetworkPkg/IScsiDxe/IScsiMisc.c            |  14 +--
+ NetworkPkg/IScsiDxe/IScsiMisc.h            |   6 +-
+ NetworkPkg/Include/Library/NetLib.h        |  40 +++++--
+ NetworkPkg/Ip4Dxe/Ip4Driver.c              |  10 +-
+ NetworkPkg/Ip6Dxe/Ip6ConfigImpl.c          |   9 +-
+ NetworkPkg/Ip6Dxe/Ip6Driver.c              |  17 ++-
+ NetworkPkg/Ip6Dxe/Ip6If.c                  |  12 +-
+ NetworkPkg/Ip6Dxe/Ip6Mld.c                 |  12 +-
+ NetworkPkg/Ip6Dxe/Ip6Nd.c                  |  33 +++++-
+ NetworkPkg/Ip6Dxe/Ip6Nd.h                  |   8 +-
+ NetworkPkg/Library/DxeNetLib/DxeNetLib.c   | 130 ++++++++++++++++++---
+ NetworkPkg/Library/DxeNetLib/DxeNetLib.inf |  14 ++-
+ NetworkPkg/NetworkPkg.dec                  |   7 ++
+ NetworkPkg/SecurityFixes.yaml              |  39 +++++++
+ NetworkPkg/TcpDxe/TcpDriver.c              |  15 ++-
+ NetworkPkg/TcpDxe/TcpDxe.inf               |   3 +
+ NetworkPkg/Udp4Dxe/Udp4Driver.c            |  10 +-
+ NetworkPkg/Udp6Dxe/Udp6Driver.c            |  11 +-
+ NetworkPkg/UefiPxeBcDxe/PxeBcDhcp4.c       |   9 +-
+ NetworkPkg/UefiPxeBcDxe/PxeBcDhcp6.c       |  11 +-
+ NetworkPkg/UefiPxeBcDxe/PxeBcDriver.c      |  12 +-
+ 27 files changed, 410 insertions(+), 83 deletions(-)
+
+diff --git a/NetworkPkg/Dhcp4Dxe/Dhcp4Driver.c b/NetworkPkg/Dhcp4Dxe/Dhcp4=
Driver.c
+index 8c37e93be3..892caee368 100644
+--- a/NetworkPkg/Dhcp4Dxe/Dhcp4Driver.c
++++ b/NetworkPkg/Dhcp4Dxe/Dhcp4Driver.c
+@@ -1,6 +1,7 @@
+ /** @file=0D
+ =0D
+ Copyright (c) 2006 - 2018, Intel Corporation. All rights reserved.<BR>=0D
++Copyright (c) Microsoft Corporation=0D
+ SPDX-License-Identifier: BSD-2-Clause-Patent=0D
+ =0D
+ **/=0D
+@@ -189,6 +190,13 @@ Dhcp4CreateService (
+ {=0D
+   DHCP_SERVICE  *DhcpSb;=0D
+   EFI_STATUS    Status;=0D
++  UINT32        Random;=0D
++=0D
++  Status =3D PseudoRandomU32 (&Random);=0D
++  if (EFI_ERROR (Status)) {=0D
++    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\n", __f=
unc__, Status));=0D
++    return Status;=0D
++  }=0D
+ =0D
+   *Service =3D NULL;=0D
+   DhcpSb   =3D AllocateZeroPool (sizeof (DHCP_SERVICE));=0D
+@@ -203,7 +211,7 @@ Dhcp4CreateService (
+   DhcpSb->Image        =3D ImageHandle;=0D
+   InitializeListHead (&DhcpSb->Children);=0D
+   DhcpSb->DhcpState =3D Dhcp4Stopped;=0D
+-  DhcpSb->Xid       =3D NET_RANDOM (NetRandomInitSeed ());=0D
++  DhcpSb->Xid       =3D Random;=0D
+   CopyMem (=0D
+     &DhcpSb->ServiceBinding,=0D
+     &mDhcp4ServiceBindingTemplate,=0D
+diff --git a/NetworkPkg/Dhcp6Dxe/Dhcp6Driver.c b/NetworkPkg/Dhcp6Dxe/Dhcp6=
Driver.c
+index b591a4605b..e7f2787a98 100644
+--- a/NetworkPkg/Dhcp6Dxe/Dhcp6Driver.c
++++ b/NetworkPkg/Dhcp6Dxe/Dhcp6Driver.c
+@@ -3,7 +3,7 @@
+   implementation for Dhcp6 Driver.=0D
+ =0D
+   Copyright (c) 2009 - 2018, Intel Corporation. All rights reserved.<BR>=
=0D
+-=0D
++  Copyright (c) Microsoft Corporation=0D
+   SPDX-License-Identifier: BSD-2-Clause-Patent=0D
+ =0D
+ **/=0D
+@@ -123,6 +123,13 @@ Dhcp6CreateService (
+ {=0D
+   DHCP6_SERVICE  *Dhcp6Srv;=0D
+   EFI_STATUS     Status;=0D
++  UINT32         Random;=0D
++=0D
++  Status =3D PseudoRandomU32 (&Random);=0D
++  if (EFI_ERROR (Status)) {=0D
++    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\n", __f=
unc__, Status));=0D
++    return Status;=0D
++  }=0D
+ =0D
+   *Service =3D NULL;=0D
+   Dhcp6Srv =3D AllocateZeroPool (sizeof (DHCP6_SERVICE));=0D
+@@ -147,7 +154,7 @@ Dhcp6CreateService (
+   Dhcp6Srv->Signature  =3D DHCP6_SERVICE_SIGNATURE;=0D
+   Dhcp6Srv->Controller =3D Controller;=0D
+   Dhcp6Srv->Image      =3D ImageHandle;=0D
+-  Dhcp6Srv->Xid        =3D (0xffffff & NET_RANDOM (NetRandomInitSeed ()))=
;=0D
++  Dhcp6Srv->Xid        =3D (0xffffff & Random);=0D
+ =0D
+   CopyMem (=0D
+     &Dhcp6Srv->ServiceBinding,=0D
+diff --git a/NetworkPkg/DnsDxe/DnsDhcp.c b/NetworkPkg/DnsDxe/DnsDhcp.c
+index 933565a32d..9eb3c1d2d8 100644
+--- a/NetworkPkg/DnsDxe/DnsDhcp.c
++++ b/NetworkPkg/DnsDxe/DnsDhcp.c
+@@ -2,6 +2,7 @@
+ Functions implementation related with DHCPv4/v6 for DNS driver.=0D
+ =0D
+ Copyright (c) 2015 - 2018, Intel Corporation. All rights reserved.<BR>=0D
++Copyright (c) Microsoft Corporation=0D
+ SPDX-License-Identifier: BSD-2-Clause-Patent=0D
+ =0D
+ **/=0D
+@@ -277,6 +278,7 @@ GetDns4ServerFromDhcp4 (
+   EFI_DHCP4_TRANSMIT_RECEIVE_TOKEN  Token;=0D
+   BOOLEAN                           IsDone;=0D
+   UINTN                             Index;=0D
++  UINT32                            Random;=0D
+ =0D
+   Image      =3D Instance->Service->ImageHandle;=0D
+   Controller =3D Instance->Service->ControllerHandle;=0D
+@@ -292,6 +294,12 @@ GetDns4ServerFromDhcp4 (
+   Data          =3D NULL;=0D
+   InterfaceInfo =3D NULL;=0D
+ =0D
++  Status =3D PseudoRandomU32 (&Random);=0D
++  if (EFI_ERROR (Status)) {=0D
++    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\n", __f=
unc__, Status));=0D
++    return Status;=0D
++  }=0D
++=0D
+   ZeroMem ((UINT8 *)ParaList, sizeof (ParaList));=0D
+ =0D
+   ZeroMem (&MnpConfigData, sizeof (EFI_MANAGED_NETWORK_CONFIG_DATA));=0D
+@@ -467,7 +475,7 @@ GetDns4ServerFromDhcp4 (
+ =0D
+   Status =3D Dhcp4->Build (Dhcp4, &SeedPacket, 0, NULL, 2, ParaList, &Tok=
en.Packet);=0D
+ =0D
+-  Token.Packet->Dhcp4.Header.Xid =3D HTONL (NET_RANDOM (NetRandomInitSeed=
 ()));=0D
++  Token.Packet->Dhcp4.Header.Xid =3D Random;=0D
+ =0D
+   Token.Packet->Dhcp4.Header.Reserved =3D HTONS ((UINT16)0x8000);=0D
+ =0D
+diff --git a/NetworkPkg/DnsDxe/DnsImpl.c b/NetworkPkg/DnsDxe/DnsImpl.c
+index d311812800..c2629bb8df 100644
+--- a/NetworkPkg/DnsDxe/DnsImpl.c
++++ b/NetworkPkg/DnsDxe/DnsImpl.c
+@@ -2,6 +2,7 @@
+ DnsDxe support functions implementation.=0D
+ =0D
+ Copyright (c) 2016 - 2018, Intel Corporation. All rights reserved.<BR>=0D
++Copyright (c) Microsoft Corporation=0D
+ SPDX-License-Identifier: BSD-2-Clause-Patent=0D
+ =0D
+ **/=0D
+@@ -1963,6 +1964,14 @@ ConstructDNSQuery (
+   NET_FRAGMENT       Frag;=0D
+   DNS_HEADER         *DnsHeader;=0D
+   DNS_QUERY_SECTION  *DnsQuery;=0D
++  EFI_STATUS         Status;=0D
++  UINT32             Random;=0D
++=0D
++  Status =3D PseudoRandomU32 (&Random);=0D
++  if (EFI_ERROR (Status)) {=0D
++    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\n", __f=
unc__, Status));=0D
++    return Status;=0D
++  }=0D
+ =0D
+   //=0D
+   // Messages carried by UDP are restricted to 512 bytes (not counting th=
e IP=0D
+@@ -1977,7 +1986,7 @@ ConstructDNSQuery (
+   // Fill header=0D
+   //=0D
+   DnsHeader                    =3D (DNS_HEADER *)Frag.Bulk;=0D
+-  DnsHeader->Identification    =3D (UINT16)NET_RANDOM (NetRandomInitSeed =
());=0D
++  DnsHeader->Identification    =3D (UINT16)Random;=0D
+   DnsHeader->Flags.Uint16      =3D 0x0000;=0D
+   DnsHeader->Flags.Bits.RD     =3D 1;=0D
+   DnsHeader->Flags.Bits.OpCode =3D DNS_FLAGS_OPCODE_STANDARD;=0D
+diff --git a/NetworkPkg/HttpBootDxe/HttpBootDhcp6.c b/NetworkPkg/HttpBootD=
xe/HttpBootDhcp6.c
+index b22cef4ff5..f964515b0f 100644
+--- a/NetworkPkg/HttpBootDxe/HttpBootDhcp6.c
++++ b/NetworkPkg/HttpBootDxe/HttpBootDhcp6.c
+@@ -2,6 +2,7 @@
+   Functions implementation related with DHCPv6 for HTTP boot driver.=0D
+ =0D
+ Copyright (c) 2015 - 2018, Intel Corporation. All rights reserved.<BR>=0D
++Copyright (c) Microsoft Corporation=0D
+ SPDX-License-Identifier: BSD-2-Clause-Patent=0D
+ =0D
+ **/=0D
+@@ -951,6 +952,7 @@ HttpBootDhcp6Sarr (
+   UINT32                    OptCount;=0D
+   UINT8                     Buffer[HTTP_BOOT_DHCP6_OPTION_MAX_SIZE];=0D
+   EFI_STATUS                Status;=0D
++  UINT32                    Random;=0D
+ =0D
+   Dhcp6 =3D Private->Dhcp6;=0D
+   ASSERT (Dhcp6 !=3D NULL);=0D
+@@ -961,6 +963,12 @@ HttpBootDhcp6Sarr (
+   OptCount =3D HttpBootBuildDhcp6Options (Private, OptList, Buffer);=0D
+   ASSERT (OptCount > 0);=0D
+ =0D
++  Status =3D PseudoRandomU32 (&Random);=0D
++  if (EFI_ERROR (Status)) {=0D
++    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\n", __f=
unc__, Status));=0D
++    return Status;=0D
++  }=0D
++=0D
+   Retransmit =3D AllocateZeroPool (sizeof (EFI_DHCP6_RETRANSMISSION));=0D
+   if (Retransmit =3D=3D NULL) {=0D
+     return EFI_OUT_OF_RESOURCES;=0D
+@@ -976,7 +984,7 @@ HttpBootDhcp6Sarr (
+   Config.IaInfoEvent           =3D NULL;=0D
+   Config.RapidCommit           =3D FALSE;=0D
+   Config.ReconfigureAccept     =3D FALSE;=0D
+-  Config.IaDescriptor.IaId     =3D NET_RANDOM (NetRandomInitSeed ());=0D
++  Config.IaDescriptor.IaId     =3D Random;=0D
+   Config.IaDescriptor.Type     =3D EFI_DHCP6_IA_TYPE_NA;=0D
+   Config.SolicitRetransmission =3D Retransmit;=0D
+   Retransmit->Irt              =3D 4;=0D
+diff --git a/NetworkPkg/IScsiDxe/IScsiCHAP.c b/NetworkPkg/IScsiDxe/IScsiCH=
AP.c
+index b507f11cd4..bebb1ac29b 100644
+--- a/NetworkPkg/IScsiDxe/IScsiCHAP.c
++++ b/NetworkPkg/IScsiDxe/IScsiCHAP.c
+@@ -3,6 +3,7 @@
+   Configuration.=0D
+ =0D
+ Copyright (c) 2004 - 2018, Intel Corporation. All rights reserved.<BR>=0D
++Copyright (c) Microsoft Corporation=0D
+ SPDX-License-Identifier: BSD-2-Clause-Patent=0D
+ =0D
+ **/=0D
+@@ -576,16 +577,24 @@ IScsiCHAPToSendReq (
+         //=0D
+         // CHAP_I=3D<I>=0D
+         //=0D
+-        IScsiGenRandom ((UINT8 *)&AuthData->OutIdentifier, 1);=0D
++        Status =3D IScsiGenRandom ((UINT8 *)&AuthData->OutIdentifier, 1);=
=0D
++        if (EFI_ERROR (Status)) {=0D
++          break;=0D
++        }=0D
++=0D
+         AsciiSPrint (ValueStr, sizeof (ValueStr), "%d", AuthData->OutIden=
tifier);=0D
+         IScsiAddKeyValuePair (Pdu, ISCSI_KEY_CHAP_IDENTIFIER, ValueStr);=
=0D
+         //=0D
+         // CHAP_C=3D<C>=0D
+         //=0D
+-        IScsiGenRandom (=0D
+-          (UINT8 *)AuthData->OutChallenge,=0D
+-          AuthData->Hash->DigestSize=0D
+-          );=0D
++        Status =3D IScsiGenRandom (=0D
++                   (UINT8 *)AuthData->OutChallenge,=0D
++                   AuthData->Hash->DigestSize=0D
++                   );=0D
++        if (EFI_ERROR (Status)) {=0D
++          break;=0D
++        }=0D
++=0D
+         BinToHexStatus =3D IScsiBinToHex (=0D
+                            (UINT8 *)AuthData->OutChallenge,=0D
+                            AuthData->Hash->DigestSize,=0D
+diff --git a/NetworkPkg/IScsiDxe/IScsiMisc.c b/NetworkPkg/IScsiDxe/IScsiMi=
sc.c
+index b3ea90158f..cd77f1a13e 100644
+--- a/NetworkPkg/IScsiDxe/IScsiMisc.c
++++ b/NetworkPkg/IScsiDxe/IScsiMisc.c
+@@ -2,6 +2,7 @@
+   Miscellaneous routines for iSCSI driver.=0D
+ =0D
+ Copyright (c) 2004 - 2018, Intel Corporation. All rights reserved.<BR>=0D
++Copyright (c) Microsoft Corporation=0D
+ SPDX-License-Identifier: BSD-2-Clause-Patent=0D
+ =0D
+ **/=0D
+@@ -474,20 +475,17 @@ IScsiNetNtoi (
+   @param[in, out]  Rand       The buffer to contain random numbers.=0D
+   @param[in]       RandLength The length of the Rand buffer.=0D
+ =0D
++  @retval EFI_SUCCESS on success=0D
++  @retval others      on error=0D
++=0D
+ **/=0D
+-VOID=0D
++EFI_STATUS=0D
+ IScsiGenRandom (=0D
+   IN OUT UINT8  *Rand,=0D
+   IN     UINTN  RandLength=0D
+   )=0D
+ {=0D
+-  UINT32  Random;=0D
+-=0D
+-  while (RandLength > 0) {=0D
+-    Random  =3D NET_RANDOM (NetRandomInitSeed ());=0D
+-    *Rand++ =3D (UINT8)(Random);=0D
+-    RandLength--;=0D
+-  }=0D
++  return PseudoRandom (Rand, RandLength);=0D
+ }=0D
+ =0D
+ /**=0D
+diff --git a/NetworkPkg/IScsiDxe/IScsiMisc.h b/NetworkPkg/IScsiDxe/IScsiMi=
sc.h
+index a951eee70e..91b2cd2261 100644
+--- a/NetworkPkg/IScsiDxe/IScsiMisc.h
++++ b/NetworkPkg/IScsiDxe/IScsiMisc.h
+@@ -2,6 +2,7 @@
+   Miscellaneous definitions for iSCSI driver.=0D
+ =0D
+ Copyright (c) 2004 - 2018, Intel Corporation. All rights reserved.<BR>=0D
++Copyright (c) Microsoft Corporation=0D
+ SPDX-License-Identifier: BSD-2-Clause-Patent=0D
+ =0D
+ **/=0D
+@@ -202,8 +203,11 @@ IScsiNetNtoi (
+   @param[in, out]  Rand       The buffer to contain random numbers.=0D
+   @param[in]       RandLength The length of the Rand buffer.=0D
+ =0D
++  @retval EFI_SUCCESS on success=0D
++  @retval others      on error=0D
++=0D
+ **/=0D
+-VOID=0D
++EFI_STATUS=0D
+ IScsiGenRandom (=0D
+   IN OUT UINT8  *Rand,=0D
+   IN     UINTN  RandLength=0D
+diff --git a/NetworkPkg/Include/Library/NetLib.h b/NetworkPkg/Include/Libr=
ary/NetLib.h
+index 8c0e62b388..e8108b79db 100644
+--- a/NetworkPkg/Include/Library/NetLib.h
++++ b/NetworkPkg/Include/Library/NetLib.h
+@@ -3,6 +3,7 @@
+   It provides basic functions for the UEFI network stack.=0D
+ =0D
+ Copyright (c) 2005 - 2018, Intel Corporation. All rights reserved.<BR>=0D
++Copyright (c) Microsoft Corporation=0D
+ SPDX-License-Identifier: BSD-2-Clause-Patent=0D
+ =0D
+ **/=0D
+@@ -539,8 +540,6 @@ extern EFI_IPv4_ADDRESS  mZeroIp4Addr;
+ #define TICKS_PER_MS      10000U=0D
+ #define TICKS_PER_SECOND  10000000U=0D
+ =0D
+-#define NET_RANDOM(Seed)  ((UINT32) ((UINT32) (Seed) * 1103515245UL + 123=
45) % 4294967295UL)=0D
+-=0D
+ /**=0D
+   Extract a UINT32 from a byte stream.=0D
+ =0D
+@@ -580,19 +579,40 @@ NetPutUint32 (
+   );=0D
+ =0D
+ /**=0D
+-  Initialize a random seed using current time and monotonic count.=0D
++  Generate a Random output data given a length.=0D
+ =0D
+-  Get current time and monotonic count first. Then initialize a random se=
ed=0D
+-  based on some basic mathematics operation on the hour, day, minute, sec=
ond,=0D
+-  nanosecond and year of the current time and the monotonic count value.=
=0D
++  @param[out] Output - The buffer to store the generated random data.=0D
++  @param[in] OutputLength - The length of the output buffer.=0D
+ =0D
+-  @return The random seed initialized with current time.=0D
++  @retval EFI_SUCCESS           On Success=0D
++  @retval EFI_INVALID_PARAMETER Pointer is null or size is zero=0D
++  @retval EFI_NOT_FOUND         RNG protocol not found=0D
++  @retval Others                Error from RngProtocol->GetRNG()=0D
+ =0D
++  @return Status code=0D
+ **/=0D
+-UINT32=0D
++EFI_STATUS=0D
+ EFIAPI=0D
+-NetRandomInitSeed (=0D
+-  VOID=0D
++PseudoRandom (=0D
++  OUT  VOID   *Output,=0D
++  IN   UINTN  OutputLength=0D
++  );=0D
++=0D
++/**=0D
++  Generate a 32-bit pseudo-random number.=0D
++=0D
++  @param[out] Output - The buffer to store the generated random number.=0D
++=0D
++  @retval EFI_SUCCESS           On Success=0D
++  @retval EFI_NOT_FOUND         RNG protocol not found=0D
++  @retval Others                Error from RngProtocol->GetRNG()=0D
++=0D
++  @return Status code=0D
++**/=0D
++EFI_STATUS=0D
++EFIAPI=0D
++PseudoRandomU32 (=0D
++  OUT  UINT32  *Output=0D
+   );=0D
+ =0D
+ #define NET_LIST_USER_STRUCT(Entry, Type, Field)        \=0D
+diff --git a/NetworkPkg/Ip4Dxe/Ip4Driver.c b/NetworkPkg/Ip4Dxe/Ip4Driver.c
+index ec483ff01f..683423f38d 100644
+--- a/NetworkPkg/Ip4Dxe/Ip4Driver.c
++++ b/NetworkPkg/Ip4Dxe/Ip4Driver.c
+@@ -2,6 +2,7 @@
+   The driver binding and service binding protocol for IP4 driver.=0D
+ =0D
+ Copyright (c) 2005 - 2019, Intel Corporation. All rights reserved.<BR>=0D
++Copyright (c) Microsoft Corporation=0D
+ (C) Copyright 2015 Hewlett-Packard Development Company, L.P.<BR>=0D
+ =0D
+ SPDX-License-Identifier: BSD-2-Clause-Patent=0D
+@@ -549,11 +550,18 @@ Ip4DriverBindingStart (
+   EFI_IP4_CONFIG2_PROTOCOL  *Ip4Cfg2;=0D
+   UINTN                     Index;=0D
+   IP4_CONFIG2_DATA_ITEM     *DataItem;=0D
++  UINT32                    Random;=0D
+ =0D
+   IpSb     =3D NULL;=0D
+   Ip4Cfg2  =3D NULL;=0D
+   DataItem =3D NULL;=0D
+ =0D
++  Status =3D PseudoRandomU32 (&Random);=0D
++  if (EFI_ERROR (Status)) {=0D
++    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\n", __f=
unc__, Status));=0D
++    return Status;=0D
++  }=0D
++=0D
+   //=0D
+   // Test for the Ip4 service binding protocol=0D
+   //=0D
+@@ -653,7 +661,7 @@ Ip4DriverBindingStart (
+   //=0D
+   // Initialize the IP4 ID=0D
+   //=0D
+-  mIp4Id =3D (UINT16)NET_RANDOM (NetRandomInitSeed ());=0D
++  mIp4Id =3D (UINT16)Random;=0D
+ =0D
+   return Status;=0D
+ =0D
+diff --git a/NetworkPkg/Ip6Dxe/Ip6ConfigImpl.c b/NetworkPkg/Ip6Dxe/Ip6Conf=
igImpl.c
+index 70e232ce6c..4c1354d26c 100644
+--- a/NetworkPkg/Ip6Dxe/Ip6ConfigImpl.c
++++ b/NetworkPkg/Ip6Dxe/Ip6ConfigImpl.c
+@@ -2276,6 +2276,13 @@ Ip6ConfigInitInstance (
+   UINTN                 Index;=0D
+   UINT16                IfIndex;=0D
+   IP6_CONFIG_DATA_ITEM  *DataItem;=0D
++  UINT32                Random;=0D
++=0D
++  Status =3D PseudoRandomU32 (&Random);=0D
++  if (EFI_ERROR (Status)) {=0D
++    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\n", __f=
unc__, Status));=0D
++    return Status;=0D
++  }=0D
+ =0D
+   IpSb =3D IP6_SERVICE_FROM_IP6_CONFIG_INSTANCE (Instance);=0D
+ =0D
+@@ -2381,7 +2388,7 @@ Ip6ConfigInitInstance (
+     // The NV variable is not set, so generate a random IAID, and write d=
own the=0D
+     // fresh new configuration as the NV variable now.=0D
+     //=0D
+-    Instance->IaId =3D NET_RANDOM (NetRandomInitSeed ());=0D
++    Instance->IaId =3D Random;=0D
+ =0D
+     for (Index =3D 0; Index < IpSb->SnpMode.HwAddressSize; Index++) {=0D
+       Instance->IaId |=3D (IpSb->SnpMode.CurrentAddress.Addr[Index] << ((=
Index << 3) & 31));=0D
+diff --git a/NetworkPkg/Ip6Dxe/Ip6Driver.c b/NetworkPkg/Ip6Dxe/Ip6Driver.c
+index b483a7d136..cbe011dad4 100644
+--- a/NetworkPkg/Ip6Dxe/Ip6Driver.c
++++ b/NetworkPkg/Ip6Dxe/Ip6Driver.c
+@@ -3,7 +3,7 @@
+ =0D
+   Copyright (c) 2009 - 2019, Intel Corporation. All rights reserved.<BR>=
=0D
+   (C) Copyright 2015 Hewlett-Packard Development Company, L.P.<BR>=0D
+-=0D
++  Copyright (c) Microsoft Corporation=0D
+   SPDX-License-Identifier: BSD-2-Clause-Patent=0D
+ =0D
+ **/=0D
+@@ -316,7 +316,11 @@ Ip6CreateService (
+   IpSb->CurHopLimit       =3D IP6_HOP_LIMIT;=0D
+   IpSb->LinkMTU           =3D IP6_MIN_LINK_MTU;=0D
+   IpSb->BaseReachableTime =3D IP6_REACHABLE_TIME;=0D
+-  Ip6UpdateReachableTime (IpSb);=0D
++  Status                  =3D Ip6UpdateReachableTime (IpSb);=0D
++  if (EFI_ERROR (Status)) {=0D
++    goto ON_ERROR;=0D
++  }=0D
++=0D
+   //=0D
+   // RFC4861 RETRANS_TIMER: 1,000 milliseconds=0D
+   //=0D
+@@ -516,11 +520,18 @@ Ip6DriverBindingStart (
+   EFI_STATUS               Status;=0D
+   EFI_IP6_CONFIG_PROTOCOL  *Ip6Cfg;=0D
+   IP6_CONFIG_DATA_ITEM     *DataItem;=0D
++  UINT32                   Random;=0D
+ =0D
+   IpSb     =3D NULL;=0D
+   Ip6Cfg   =3D NULL;=0D
+   DataItem =3D NULL;=0D
+ =0D
++  Status =3D PseudoRandomU32 (&Random);=0D
++  if (EFI_ERROR (Status)) {=0D
++    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\n", __f=
unc__, Status));=0D
++    return Status;=0D
++  }=0D
++=0D
+   //=0D
+   // Test for the Ip6 service binding protocol=0D
+   //=0D
+@@ -656,7 +667,7 @@ Ip6DriverBindingStart (
+   //=0D
+   // Initialize the IP6 ID=0D
+   //=0D
+-  mIp6Id =3D NET_RANDOM (NetRandomInitSeed ());=0D
++  mIp6Id =3D Random;=0D
+ =0D
+   return EFI_SUCCESS;=0D
+ =0D
+diff --git a/NetworkPkg/Ip6Dxe/Ip6If.c b/NetworkPkg/Ip6Dxe/Ip6If.c
+index 4629c05f25..f3d11c4d21 100644
+--- a/NetworkPkg/Ip6Dxe/Ip6If.c
++++ b/NetworkPkg/Ip6Dxe/Ip6If.c
+@@ -2,7 +2,7 @@
+   Implement IP6 pseudo interface.=0D
+ =0D
+   Copyright (c) 2009 - 2018, Intel Corporation. All rights reserved.<BR>=
=0D
+-=0D
++  Copyright (c) Microsoft Corporation=0D
+   SPDX-License-Identifier: BSD-2-Clause-Patent=0D
+ =0D
+ **/=0D
+@@ -89,6 +89,14 @@ Ip6SetAddress (
+   IP6_PREFIX_LIST_ENTRY  *PrefixEntry;=0D
+   UINT64                 Delay;=0D
+   IP6_DELAY_JOIN_LIST    *DelayNode;=0D
++  EFI_STATUS             Status;=0D
++  UINT32                 Random;=0D
++=0D
++  Status =3D PseudoRandomU32 (&Random);=0D
++  if (EFI_ERROR (Status)) {=0D
++    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\n", __f=
unc__, Status));=0D
++    return Status;=0D
++  }=0D
+ =0D
+   NET_CHECK_SIGNATURE (Interface, IP6_INTERFACE_SIGNATURE);=0D
+ =0D
+@@ -164,7 +172,7 @@ Ip6SetAddress (
+   // Thus queue the address to be processed in Duplicate Address Detectio=
n module=0D
+   // after the delay time (in milliseconds).=0D
+   //=0D
+-  Delay =3D (UINT64)NET_RANDOM (NetRandomInitSeed ());=0D
++  Delay =3D (UINT64)Random;=0D
+   Delay =3D MultU64x32 (Delay, IP6_ONE_SECOND_IN_MS);=0D
+   Delay =3D RShiftU64 (Delay, 32);=0D
+ =0D
+diff --git a/NetworkPkg/Ip6Dxe/Ip6Mld.c b/NetworkPkg/Ip6Dxe/Ip6Mld.c
+index e6b2b653e2..498a118543 100644
+--- a/NetworkPkg/Ip6Dxe/Ip6Mld.c
++++ b/NetworkPkg/Ip6Dxe/Ip6Mld.c
+@@ -696,7 +696,15 @@ Ip6UpdateDelayTimer (
+   IN OUT IP6_MLD_GROUP  *Group=0D
+   )=0D
+ {=0D
+-  UINT32  Delay;=0D
++  UINT32      Delay;=0D
++  EFI_STATUS  Status;=0D
++  UINT32      Random;=0D
++=0D
++  Status =3D PseudoRandomU32 (&Random);=0D
++  if (EFI_ERROR (Status)) {=0D
++    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\n", __f=
unc__, Status));=0D
++    return Status;=0D
++  }=0D
+ =0D
+   //=0D
+   // If the Query packet specifies a Maximum Response Delay of zero, perf=
orm timer=0D
+@@ -715,7 +723,7 @@ Ip6UpdateDelayTimer (
+   // is less than the remaining value of the running timer.=0D
+   //=0D
+   if ((Group->DelayTimer =3D=3D 0) || (Delay < Group->DelayTimer)) {=0D
+-    Group->DelayTimer =3D Delay / 4294967295UL * NET_RANDOM (NetRandomIni=
tSeed ());=0D
++    Group->DelayTimer =3D Delay / 4294967295UL * Random;=0D
+   }=0D
+ =0D
+   return EFI_SUCCESS;=0D
+diff --git a/NetworkPkg/Ip6Dxe/Ip6Nd.c b/NetworkPkg/Ip6Dxe/Ip6Nd.c
+index c10c7017f8..72aa45c10f 100644
+--- a/NetworkPkg/Ip6Dxe/Ip6Nd.c
++++ b/NetworkPkg/Ip6Dxe/Ip6Nd.c
+@@ -2,7 +2,7 @@
+   Implementation of Neighbor Discovery support routines.=0D
+ =0D
+   Copyright (c) 2009 - 2018, Intel Corporation. All rights reserved.<BR>=
=0D
+-=0D
++  Copyright (c) Microsoft Corporation=0D
+   SPDX-License-Identifier: BSD-2-Clause-Patent=0D
+ =0D
+ **/=0D
+@@ -16,17 +16,28 @@ EFI_MAC_ADDRESS  mZeroMacAddress;
+ =0D
+   @param[in, out] IpSb     Points to the IP6_SERVICE.=0D
+ =0D
++  @retval EFI_SUCCESS           ReachableTime Updated=0D
++  @retval others                Failed to update ReachableTime=0D
+ **/=0D
+-VOID=0D
++EFI_STATUS=0D
+ Ip6UpdateReachableTime (=0D
+   IN OUT IP6_SERVICE  *IpSb=0D
+   )=0D
+ {=0D
+-  UINT32  Random;=0D
++  UINT32      Random;=0D
++  EFI_STATUS  Status;=0D
+ =0D
+-  Random              =3D (NetRandomInitSeed () / 4294967295UL) * IP6_RAN=
DOM_FACTOR_SCALE;=0D
++  Status =3D PseudoRandomU32 (&Random);=0D
++  if (EFI_ERROR (Status)) {=0D
++    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\n", __f=
unc__, Status));=0D
++    return Status;=0D
++  }=0D
++=0D
++  Random              =3D (Random / 4294967295UL) * IP6_RANDOM_FACTOR_SCA=
LE;=0D
+   Random              =3D Random + IP6_MIN_RANDOM_FACTOR_SCALED;=0D
+   IpSb->ReachableTime =3D (IpSb->BaseReachableTime * Random) / IP6_RANDOM=
_FACTOR_SCALE;=0D
++=0D
++  return EFI_SUCCESS;=0D
+ }=0D
+ =0D
+ /**=0D
+@@ -972,10 +983,17 @@ Ip6InitDADProcess (
+   IP6_SERVICE                               *IpSb;=0D
+   EFI_STATUS                                Status;=0D
+   UINT32                                    MaxDelayTick;=0D
++  UINT32                                    Random;=0D
+ =0D
+   NET_CHECK_SIGNATURE (IpIf, IP6_INTERFACE_SIGNATURE);=0D
+   ASSERT (AddressInfo !=3D NULL);=0D
+ =0D
++  Status =3D PseudoRandomU32 (&Random);=0D
++  if (EFI_ERROR (Status)) {=0D
++    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\n", __f=
unc__, Status));=0D
++    return Status;=0D
++  }=0D
++=0D
+   //=0D
+   // Do nothing if we have already started DAD on the address.=0D
+   //=0D
+@@ -1014,7 +1032,7 @@ Ip6InitDADProcess (
+   Entry->Transmit    =3D 0;=0D
+   Entry->Receive     =3D 0;=0D
+   MaxDelayTick       =3D IP6_MAX_RTR_SOLICITATION_DELAY / IP6_TIMER_INTER=
VAL_IN_MS;=0D
+-  Entry->RetransTick =3D (MaxDelayTick * ((NET_RANDOM (NetRandomInitSeed =
()) % 5) + 1)) / 5;=0D
++  Entry->RetransTick =3D (MaxDelayTick * ((Random % 5) + 1)) / 5;=0D
+   Entry->AddressInfo =3D AddressInfo;=0D
+   Entry->Callback    =3D Callback;=0D
+   Entry->Context     =3D Context;=0D
+@@ -2078,7 +2096,10 @@ Ip6ProcessRouterAdvertise (
+     // in BaseReachableTime and recompute a ReachableTime.=0D
+     //=0D
+     IpSb->BaseReachableTime =3D ReachableTime;=0D
+-    Ip6UpdateReachableTime (IpSb);=0D
++    Status                  =3D Ip6UpdateReachableTime (IpSb);=0D
++    if (EFI_ERROR (Status)) {=0D
++      goto Exit;=0D
++    }=0D
+   }=0D
+ =0D
+   if (RetransTimer !=3D 0) {=0D
+diff --git a/NetworkPkg/Ip6Dxe/Ip6Nd.h b/NetworkPkg/Ip6Dxe/Ip6Nd.h
+index bf64e9114e..5795e23c7d 100644
+--- a/NetworkPkg/Ip6Dxe/Ip6Nd.h
++++ b/NetworkPkg/Ip6Dxe/Ip6Nd.h
+@@ -2,7 +2,7 @@
+   Definition of Neighbor Discovery support routines.=0D
+ =0D
+   Copyright (c) 2009 - 2012, Intel Corporation. All rights reserved.<BR>=
=0D
+-=0D
++  Copyright (c) Microsoft Corporation=0D
+   SPDX-License-Identifier: BSD-2-Clause-Patent=0D
+ =0D
+ **/=0D
+@@ -780,10 +780,10 @@ Ip6OnArpResolved (
+ /**=0D
+   Update the ReachableTime in IP6 service binding instance data, in milli=
seconds.=0D
+ =0D
+-  @param[in, out] IpSb     Points to the IP6_SERVICE.=0D
+-=0D
++  @retval EFI_SUCCESS           ReachableTime Updated=0D
++  @retval others                Failed to update ReachableTime=0D
+ **/=0D
+-VOID=0D
++EFI_STATUS=0D
+ Ip6UpdateReachableTime (=0D
+   IN OUT IP6_SERVICE  *IpSb=0D
+   );=0D
+diff --git a/NetworkPkg/Library/DxeNetLib/DxeNetLib.c b/NetworkPkg/Library=
/DxeNetLib/DxeNetLib.c
+index fd4a9e15a8..01c13c08d2 100644
+--- a/NetworkPkg/Library/DxeNetLib/DxeNetLib.c
++++ b/NetworkPkg/Library/DxeNetLib/DxeNetLib.c
+@@ -3,6 +3,7 @@
+ =0D
+ Copyright (c) 2005 - 2018, Intel Corporation. All rights reserved.<BR>=0D
+ (C) Copyright 2015 Hewlett Packard Enterprise Development LP<BR>=0D
++Copyright (c) Microsoft Corporation=0D
+ SPDX-License-Identifier: BSD-2-Clause-Patent=0D
+ **/=0D
+ =0D
+@@ -31,6 +32,7 @@ SPDX-License-Identifier: BSD-2-Clause-Patent
+ #include <Library/DevicePathLib.h>=0D
+ #include <Library/PrintLib.h>=0D
+ #include <Library/UefiLib.h>=0D
++#include <Protocol/Rng.h>=0D
+ =0D
+ #define NIC_ITEM_CONFIG_SIZE  (sizeof (NIC_IP4_CONFIG_INFO) + sizeof (EFI=
_IP4_ROUTE_TABLE) * MAX_IP4_CONFIG_IN_VARIABLE)=0D
+ #define DEFAULT_ZERO_START    ((UINTN) ~0)=0D
+@@ -127,6 +129,25 @@ GLOBAL_REMOVE_IF_UNREFERENCED VLAN_DEVICE_PATH  mNetV=
lanDevicePathTemplate =3D {
+   0=0D
+ };=0D
+ =0D
++//=0D
++// These represent UEFI SPEC defined algorithms that should be supported =
by=0D
++// the RNG protocol and are generally considered secure.=0D
++//=0D
++// The order of the algorithms in this array is important. This order is =
the order=0D
++// in which the algorithms will be tried by the RNG protocol.=0D
++// If your platform needs to use a specific algorithm for the random numb=
er generator,=0D
++// then you should place that algorithm first in the array.=0D
++//=0D
++GLOBAL_REMOVE_IF_UNREFERENCED EFI_GUID  *mSecureHashAlgorithms[] =3D {=0D
++  &gEfiRngAlgorithmSp80090Ctr256Guid,  // SP800-90A DRBG CTR using AES-25=
6=0D
++  &gEfiRngAlgorithmSp80090Hmac256Guid, // SP800-90A DRBG HMAC using SHA-2=
56=0D
++  &gEfiRngAlgorithmSp80090Hash256Guid, // SP800-90A DRBG Hash using SHA-2=
56=0D
++  &gEfiRngAlgorithmArmRndr,            // unspecified SP800-90A DRBG via =
ARM RNDR register=0D
++  &gEfiRngAlgorithmRaw,                // Raw data from NRBG (or TRNG)=0D
++};=0D
++=0D
++#define SECURE_HASH_ALGORITHMS_SIZE  (sizeof (mSecureHashAlgorithms) / si=
zeof (EFI_GUID *))=0D
++=0D
+ /**=0D
+   Locate the handles that support SNP, then open one of them=0D
+   to send the syslog packets. The caller isn't required to close=0D
+@@ -884,34 +905,107 @@ Ip6Swap128 (
+ }=0D
+ =0D
+ /**=0D
+-  Initialize a random seed using current time and monotonic count.=0D
++  Generate a Random output data given a length.=0D
+ =0D
+-  Get current time and monotonic count first. Then initialize a random se=
ed=0D
+-  based on some basic mathematics operation on the hour, day, minute, sec=
ond,=0D
+-  nanosecond and year of the current time and the monotonic count value.=
=0D
++  @param[out] Output - The buffer to store the generated random data.=0D
++  @param[in] OutputLength - The length of the output buffer.=0D
+ =0D
+-  @return The random seed initialized with current time.=0D
++  @retval EFI_SUCCESS           On Success=0D
++  @retval EFI_INVALID_PARAMETER Pointer is null or size is zero=0D
++  @retval EFI_NOT_FOUND         RNG protocol not found=0D
++  @retval Others                Error from RngProtocol->GetRNG()=0D
+ =0D
++  @return Status code=0D
+ **/=0D
+-UINT32=0D
++EFI_STATUS=0D
+ EFIAPI=0D
+-NetRandomInitSeed (=0D
+-  VOID=0D
++PseudoRandom (=0D
++  OUT  VOID   *Output,=0D
++  IN   UINTN  OutputLength=0D
+   )=0D
+ {=0D
+-  EFI_TIME  Time;=0D
+-  UINT32    Seed;=0D
+-  UINT64    MonotonicCount;=0D
++  EFI_RNG_PROTOCOL  *RngProtocol;=0D
++  EFI_STATUS        Status;=0D
++  UINTN             AlgorithmIndex;=0D
++=0D
++  if ((Output =3D=3D NULL) || (OutputLength =3D=3D 0)) {=0D
++    return EFI_INVALID_PARAMETER;=0D
++  }=0D
++=0D
++  Status =3D gBS->LocateProtocol (&gEfiRngProtocolGuid, NULL, (VOID **)&R=
ngProtocol);=0D
++  if (EFI_ERROR (Status)) {=0D
++    DEBUG ((DEBUG_ERROR, "Failed to locate EFI_RNG_PROTOCOL: %r\n", Statu=
s));=0D
++    ASSERT_EFI_ERROR (Status);=0D
++    return Status;=0D
++  }=0D
++=0D
++  if (PcdGetBool (PcdEnforceSecureRngAlgorithms)) {=0D
++    for (AlgorithmIndex =3D 0; AlgorithmIndex < SECURE_HASH_ALGORITHMS_SI=
ZE; AlgorithmIndex++) {=0D
++      Status =3D RngProtocol->GetRNG (RngProtocol, mSecureHashAlgorithms[=
AlgorithmIndex], OutputLength, (UINT8 *)Output);=0D
++      if (!EFI_ERROR (Status)) {=0D
++        //=0D
++        // Secure Algorithm was supported on this platform=0D
++        //=0D
++        return EFI_SUCCESS;=0D
++      } else if (Status =3D=3D EFI_UNSUPPORTED) {=0D
++        //=0D
++        // Secure Algorithm was not supported on this platform=0D
++        //=0D
++        DEBUG ((DEBUG_ERROR, "Failed to generate random data using secure=
 algorithm %d: %r\n", AlgorithmIndex, Status));=0D
++=0D
++        //=0D
++        // Try the next secure algorithm=0D
++        //=0D
++        continue;=0D
++      } else {=0D
++        //=0D
++        // Some other error occurred=0D
++        //=0D
++        DEBUG ((DEBUG_ERROR, "Failed to generate random data using secure=
 algorithm %d: %r\n", AlgorithmIndex, Status));=0D
++        ASSERT_EFI_ERROR (Status);=0D
++        return Status;=0D
++      }=0D
++    }=0D
++=0D
++    //=0D
++    // If we get here, we failed to generate random data using any secure=
 algorithm=0D
++    // Platform owner should ensure that at least one secure algorithm is=
 supported=0D
++    //=0D
++    ASSERT_EFI_ERROR (Status);=0D
++    return Status;=0D
++  }=0D
++=0D
++  //=0D
++  // Lets try using the default algorithm (which may not be secure)=0D
++  //=0D
++  Status =3D RngProtocol->GetRNG (RngProtocol, NULL, OutputLength, (UINT8=
 *)Output);=0D
++  if (EFI_ERROR (Status)) {=0D
++    DEBUG ((DEBUG_ERROR, "%a failed to generate random data: %r\n", __fun=
c__, Status));=0D
++    ASSERT_EFI_ERROR (Status);=0D
++    return Status;=0D
++  }=0D
+ =0D
+-  gRT->GetTime (&Time, NULL);=0D
+-  Seed  =3D (Time.Hour << 24 | Time.Day << 16 | Time.Minute << 8 | Time.S=
econd);=0D
+-  Seed ^=3D Time.Nanosecond;=0D
+-  Seed ^=3D Time.Year << 7;=0D
++  return EFI_SUCCESS;=0D
++}=0D
++=0D
++/**=0D
++  Generate a 32-bit pseudo-random number.=0D
+ =0D
+-  gBS->GetNextMonotonicCount (&MonotonicCount);=0D
+-  Seed +=3D (UINT32)MonotonicCount;=0D
++  @param[out] Output - The buffer to store the generated random number.=0D
+ =0D
+-  return Seed;=0D
++  @retval EFI_SUCCESS           On Success=0D
++  @retval EFI_NOT_FOUND         RNG protocol not found=0D
++  @retval Others                Error from RngProtocol->GetRNG()=0D
++=0D
++  @return Status code=0D
++**/=0D
++EFI_STATUS=0D
++EFIAPI=0D
++PseudoRandomU32 (=0D
++  OUT UINT32  *Output=0D
++  )=0D
++{=0D
++  return PseudoRandom (Output, sizeof (*Output));=0D
+ }=0D
+ =0D
+ /**=0D
+diff --git a/NetworkPkg/Library/DxeNetLib/DxeNetLib.inf b/NetworkPkg/Libra=
ry/DxeNetLib/DxeNetLib.inf
+index 8145d256ec..a8f534a293 100644
+--- a/NetworkPkg/Library/DxeNetLib/DxeNetLib.inf
++++ b/NetworkPkg/Library/DxeNetLib/DxeNetLib.inf
+@@ -3,6 +3,7 @@
+ #=0D
+ #  Copyright (c) 2006 - 2018, Intel Corporation. All rights reserved.<BR>=
=0D
+ #  (C) Copyright 2015 Hewlett Packard Enterprise Development LP<BR>=0D
++#  Copyright (c) Microsoft Corporation=0D
+ #  SPDX-License-Identifier: BSD-2-Clause-Patent=0D
+ #=0D
+ ##=0D
+@@ -49,7 +50,11 @@
+   gEfiSmbiosTableGuid                           ## SOMETIMES_CONSUMES  ##=
 SystemTable=0D
+   gEfiSmbios3TableGuid                          ## SOMETIMES_CONSUMES  ##=
 SystemTable=0D
+   gEfiAdapterInfoMediaStateGuid                 ## SOMETIMES_CONSUMES=0D
+-=0D
++  gEfiRngAlgorithmRaw                           ## CONSUMES=0D
++  gEfiRngAlgorithmSp80090Ctr256Guid             ## CONSUMES=0D
++  gEfiRngAlgorithmSp80090Hmac256Guid            ## CONSUMES=0D
++  gEfiRngAlgorithmSp80090Hash256Guid            ## CONSUMES=0D
++  gEfiRngAlgorithmArmRndr                       ## CONSUMES=0D
+ =0D
+ [Protocols]=0D
+   gEfiSimpleNetworkProtocolGuid                 ## SOMETIMES_CONSUMES=0D
+@@ -59,3 +64,10 @@
+   gEfiComponentNameProtocolGuid                 ## SOMETIMES_CONSUMES=0D
+   gEfiComponentName2ProtocolGuid                ## SOMETIMES_CONSUMES=0D
+   gEfiAdapterInformationProtocolGuid            ## SOMETIMES_CONSUMES=0D
++  gEfiRngProtocolGuid                           ## CONSUMES=0D
++=0D
++[FixedPcd]=0D
++  gEfiNetworkPkgTokenSpaceGuid.PcdEnforceSecureRngAlgorithms ## CONSUMES=
=0D
++=0D
++[Depex]=0D
++  gEfiRngProtocolGuid=0D
+diff --git a/NetworkPkg/NetworkPkg.dec b/NetworkPkg/NetworkPkg.dec
+index 928e84fec4..ff335e957c 100644
+--- a/NetworkPkg/NetworkPkg.dec
++++ b/NetworkPkg/NetworkPkg.dec
+@@ -5,6 +5,7 @@
+ #=0D
+ # Copyright (c) 2009 - 2021, Intel Corporation. All rights reserved.<BR>=
=0D
+ # (C) Copyright 2015-2020 Hewlett Packard Enterprise Development LP<BR>=0D
++# Copyright (c) Microsoft Corporation=0D
+ #=0D
+ # SPDX-License-Identifier: BSD-2-Clause-Patent=0D
+ #=0D
+@@ -127,6 +128,12 @@
+   # @Prompt Indicates whether SnpDxe creates event for ExitBootServices()=
 call.=0D
+   gEfiNetworkPkgTokenSpaceGuid.PcdSnpCreateExitBootServicesEvent|TRUE|BOO=
LEAN|0x1000000C=0D
+ =0D
++  ## Enforces the use of Secure UEFI spec defined RNG algorithms for all =
network connections.=0D
++  # TRUE  - Enforce the use of Secure UEFI spec defined RNG algorithms.=0D
++  # FALSE - Do not enforce and depend on the default implementation of RN=
G algorithm from the provider.=0D
++  # @Prompt Enforce the use of Secure UEFI spec defined RNG algorithms.=0D
++  gEfiNetworkPkgTokenSpaceGuid.PcdEnforceSecureRngAlgorithms|TRUE|BOOLEAN=
|0x1000000D=0D
++=0D
+ [PcdsFixedAtBuild, PcdsPatchableInModule, PcdsDynamic, PcdsDynamicEx]=0D
+   ## IPv6 DHCP Unique Identifier (DUID) Type configuration (From RFCs 331=
5 and 6355).=0D
+   # 01 =3D DUID Based on Link-layer Address Plus Time [DUID-LLT]=0D
+diff --git a/NetworkPkg/SecurityFixes.yaml b/NetworkPkg/SecurityFixes.yaml
+index 7e900483fe..2b2c794697 100644
+--- a/NetworkPkg/SecurityFixes.yaml
++++ b/NetworkPkg/SecurityFixes.yaml
+@@ -121,3 +121,42 @@ CVE_2023_45235:
+     - http://www.openwall.com/lists/oss-security/2024/01/16/2=0D
+     - http://packetstormsecurity.com/files/176574/PixieFail-Proof-Of-Conc=
epts.html=0D
+     - https://blog.quarkslab.com/pixiefail-nine-vulnerabilities-in-tianoc=
ores-edk-ii-ipv6-network-stack.html=0D
++CVE_2023_45237:=0D
++  commit_titles:=0D
++    - "NetworkPkg:: SECURITY PATCH CVE 2023-45237"=0D
++  cve: CVE-2023-45237=0D
++  date_reported: 2023-08-28 13:56 UTC=0D
++  description: "Bug 09 - Use of a Weak PseudoRandom Number Generator"=0D
++  note:=0D
++  files_impacted:=0D
++    - NetworkPkg/Dhcp4Dxe/Dhcp4Driver.c=0D
++    - NetworkPkg/Dhcp6Dxe/Dhcp6Driver.c=0D
++    - NetworkPkg/DnsDxe/DnsDhcp.c=0D
++    - NetworkPkg/DnsDxe/DnsImpl.c=0D
++    - NetworkPkg/HttpBootDxe/HttpBootDhcp6.c=0D
++    - NetworkPkg/IScsiDxe/IScsiCHAP.c=0D
++    - NetworkPkg/IScsiDxe/IScsiMisc.c=0D
++    - NetworkPkg/IScsiDxe/IScsiMisc.h=0D
++    - NetworkPkg/Include/Library/NetLib.h=0D
++    - NetworkPkg/Ip4Dxe/Ip4Driver.c=0D
++    - NetworkPkg/Ip6Dxe/Ip6ConfigImpl.c=0D
++    - NetworkPkg/Ip6Dxe/Ip6Driver.c=0D
++    - NetworkPkg/Ip6Dxe/Ip6If.c=0D
++    - NetworkPkg/Ip6Dxe/Ip6Mld.c=0D
++    - NetworkPkg/Ip6Dxe/Ip6Nd.c=0D
++    - NetworkPkg/Ip6Dxe/Ip6Nd.h=0D
++    - NetworkPkg/Library/DxeNetLib/DxeNetLib.c=0D
++    - NetworkPkg/Library/DxeNetLib/DxeNetLib.inf=0D
++    - NetworkPkg/NetworkPkg.dec=0D
++    - NetworkPkg/TcpDxe/TcpDriver.c=0D
++    - NetworkPkg/Udp4Dxe/Udp4Driver.c=0D
++    - NetworkPkg/Udp6Dxe/Udp6Driver.c=0D
++    - NetworkPkg/UefiPxeBcDxe/PxeBcDhcp4.c=0D
++    - NetworkPkg/UefiPxeBcDxe/PxeBcDhcp6.c=0D
++    - NetworkPkg/UefiPxeBcDxe/PxeBcDriver.c=0D
++  links:=0D
++    - https://bugzilla.tianocore.org/show_bug.cgi?id=3D4542=0D
++    - https://nvd.nist.gov/vuln/detail/CVE-2023-45237=0D
++    - http://www.openwall.com/lists/oss-security/2024/01/16/2=0D
++    - http://packetstormsecurity.com/files/176574/PixieFail-Proof-Of-Conc=
epts.html=0D
++    - https://blog.quarkslab.com/pixiefail-nine-vulnerabilities-in-tianoc=
ores-edk-ii-ipv6-network-stack.html=0D
+diff --git a/NetworkPkg/TcpDxe/TcpDriver.c b/NetworkPkg/TcpDxe/TcpDriver.c
+index 98a90e0210..8fe6badd68 100644
+--- a/NetworkPkg/TcpDxe/TcpDriver.c
++++ b/NetworkPkg/TcpDxe/TcpDriver.c
+@@ -2,7 +2,7 @@
+   The driver binding and service binding protocol for the TCP driver.=0D
+ =0D
+   Copyright (c) 2009 - 2018, Intel Corporation. All rights reserved.<BR>=
=0D
+-=0D
++  Copyright (c) Microsoft Corporation=0D
+   SPDX-License-Identifier: BSD-2-Clause-Patent=0D
+ =0D
+ **/=0D
+@@ -163,7 +163,13 @@ TcpDriverEntryPoint (
+   )=0D
+ {=0D
+   EFI_STATUS  Status;=0D
+-  UINT32      Seed;=0D
++  UINT32      Random;=0D
++=0D
++  Status =3D PseudoRandomU32 (&Random);=0D
++  if (EFI_ERROR (Status)) {=0D
++    DEBUG ((DEBUG_ERROR, "%a Failed to generate random number: %r\n", __f=
unc__, Status));=0D
++    return Status;=0D
++  }=0D
+ =0D
+   //=0D
+   // Install the TCP Driver Binding Protocol=0D
+@@ -203,9 +209,8 @@ TcpDriverEntryPoint (
+   //=0D
+   // Initialize ISS and random port.=0D
+   //=0D
+-  Seed            =3D NetRandomInitSeed ();=0D
+-  mTcpGlobalIss   =3D NET_RANDOM (Seed) % mTcpGlobalIss;=0D
+-  mTcp4RandomPort =3D (UINT16)(TCP_PORT_KNOWN + (NET_RANDOM (Seed) % TCP_=
PORT_KNOWN));=0D
++  mTcpGlobalIss   =3D Random % mTcpGlobalIss;=0D
++  mTcp4RandomPort =3D (UINT16)(TCP_PORT_KNOWN + (Random % TCP_PORT_KNOWN)=
);=0D
+   mTcp6RandomPort =3D mTcp4RandomPort;=0D
+ =0D
+   return EFI_SUCCESS;=0D
+diff --git a/NetworkPkg/TcpDxe/TcpDxe.inf b/NetworkPkg/TcpDxe/TcpDxe.inf
+index c0acbdca57..cf5423f4c5 100644
+--- a/NetworkPkg/TcpDxe/TcpDxe.inf
++++ b/NetworkPkg/TcpDxe/TcpDxe.inf
+@@ -82,5 +82,8 @@
+   gEfiTcp6ProtocolGuid                          ## BY_START=0D
+   gEfiTcp6ServiceBindingProtocolGuid            ## BY_START=0D
+ =0D
++[Depex]=0D
++  gEfiHash2ServiceBindingProtocolGuid=0D
++=0D
+ [UserExtensions.TianoCore."ExtraFiles"]=0D
+   TcpDxeExtra.uni=0D
+diff --git a/NetworkPkg/Udp4Dxe/Udp4Driver.c b/NetworkPkg/Udp4Dxe/Udp4Driv=
er.c
+index cb917fcfc9..c7ea16f4cd 100644
+--- a/NetworkPkg/Udp4Dxe/Udp4Driver.c
++++ b/NetworkPkg/Udp4Dxe/Udp4Driver.c
+@@ -1,6 +1,7 @@
+ /** @file=0D
+ =0D
+ Copyright (c) 2006 - 2018, Intel Corporation. All rights reserved.<BR>=0D
++Copyright (c) Microsoft Corporation=0D
+ SPDX-License-Identifier: BSD-2-Clause-Patent=0D
+ =0D
+ **/=0D
+@@ -555,6 +556,13 @@ Udp4DriverEntryPoint (
+   )=0D
+ {=0D
+   EFI_STATUS  Status;=0D
++  UINT32      Random;=0D
++=0D
++  Status =3D PseudoRandomU32 (&Random);=0D
++  if (EFI_ERROR (Status)) {=0D
++    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\n", __f=
unc__, Status));=0D
++    return Status;=0D
++  }=0D
+ =0D
+   //=0D
+   // Install the Udp4DriverBinding and Udp4ComponentName protocols.=0D
+@@ -571,7 +579,7 @@ Udp4DriverEntryPoint (
+     //=0D
+     // Initialize the UDP random port.=0D
+     //=0D
+-    mUdp4RandomPort =3D (UINT16)(((UINT16)NetRandomInitSeed ()) % UDP4_PO=
RT_KNOWN + UDP4_PORT_KNOWN);=0D
++    mUdp4RandomPort =3D (UINT16)(((UINT16)Random) % UDP4_PORT_KNOWN + UDP=
4_PORT_KNOWN);=0D
+   }=0D
+ =0D
+   return Status;=0D
+diff --git a/NetworkPkg/Udp6Dxe/Udp6Driver.c b/NetworkPkg/Udp6Dxe/Udp6Driv=
er.c
+index ae96fb9966..edb758d57c 100644
+--- a/NetworkPkg/Udp6Dxe/Udp6Driver.c
++++ b/NetworkPkg/Udp6Dxe/Udp6Driver.c
+@@ -2,7 +2,7 @@
+   Driver Binding functions and Service Binding functions for the Network =
driver module.=0D
+ =0D
+   Copyright (c) 2009 - 2018, Intel Corporation. All rights reserved.<BR>=
=0D
+-=0D
++  Copyright (c) Microsoft Corporation=0D
+   SPDX-License-Identifier: BSD-2-Clause-Patent=0D
+ =0D
+ **/=0D
+@@ -596,6 +596,13 @@ Udp6DriverEntryPoint (
+   )=0D
+ {=0D
+   EFI_STATUS  Status;=0D
++  UINT32      Random;=0D
++=0D
++  Status =3D PseudoRandomU32 (&Random);=0D
++  if (EFI_ERROR (Status)) {=0D
++    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\n", __f=
unc__, Status));=0D
++    return Status;=0D
++  }=0D
+ =0D
+   //=0D
+   // Install the Udp6DriverBinding and Udp6ComponentName protocols.=0D
+@@ -614,7 +621,7 @@ Udp6DriverEntryPoint (
+     // Initialize the UDP random port.=0D
+     //=0D
+     mUdp6RandomPort =3D (UINT16)(=0D
+-                               ((UINT16)NetRandomInitSeed ()) %=0D
++                               ((UINT16)Random) %=0D
+                                UDP6_PORT_KNOWN +=0D
+                                UDP6_PORT_KNOWN=0D
+                                );=0D
+diff --git a/NetworkPkg/UefiPxeBcDxe/PxeBcDhcp4.c b/NetworkPkg/UefiPxeBcDx=
e/PxeBcDhcp4.c
+index 91146b78cb..452038c219 100644
+--- a/NetworkPkg/UefiPxeBcDxe/PxeBcDhcp4.c
++++ b/NetworkPkg/UefiPxeBcDxe/PxeBcDhcp4.c
+@@ -2,7 +2,7 @@
+   Functions implementation related with DHCPv4 for UefiPxeBc Driver.=0D
+ =0D
+   Copyright (c) 2009 - 2018, Intel Corporation. All rights reserved.<BR>=
=0D
+-=0D
++  Copyright (c) Microsoft Corporation=0D
+   SPDX-License-Identifier: BSD-2-Clause-Patent=0D
+ =0D
+ **/=0D
+@@ -1381,6 +1381,12 @@ PxeBcDhcp4Discover (
+   UINT8                             VendorOptLen;=0D
+   UINT32                            Xid;=0D
+ =0D
++  Status =3D PseudoRandomU32 (&Xid);=0D
++  if (EFI_ERROR (Status)) {=0D
++    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\n", __f=
unc__, Status));=0D
++    return Status;=0D
++  }=0D
++=0D
+   Mode   =3D Private->PxeBc.Mode;=0D
+   Dhcp4  =3D Private->Dhcp4;=0D
+   Status =3D EFI_SUCCESS;=0D
+@@ -1471,7 +1477,6 @@ PxeBcDhcp4Discover (
+   //=0D
+   // Set fields of the token for the request packet.=0D
+   //=0D
+-  Xid                                 =3D NET_RANDOM (NetRandomInitSeed (=
));=0D
+   Token.Packet->Dhcp4.Header.Xid      =3D HTONL (Xid);=0D
+   Token.Packet->Dhcp4.Header.Reserved =3D HTONS ((UINT16)((IsBCast) ? 0x8=
000 : 0x0));=0D
+   CopyMem (&Token.Packet->Dhcp4.Header.ClientAddr, &Private->StationIp, s=
izeof (EFI_IPv4_ADDRESS));=0D
+diff --git a/NetworkPkg/UefiPxeBcDxe/PxeBcDhcp6.c b/NetworkPkg/UefiPxeBcDx=
e/PxeBcDhcp6.c
+index 7fd1281c11..bcabbd2219 100644
+--- a/NetworkPkg/UefiPxeBcDxe/PxeBcDhcp6.c
++++ b/NetworkPkg/UefiPxeBcDxe/PxeBcDhcp6.c
+@@ -2180,7 +2180,7 @@ PxeBcDhcp6Discover (
+   UINTN                            ReadSize;=0D
+   UINT16                           OpCode;=0D
+   UINT16                           OpLen;=0D
+-  UINT32                           Xid;=0D
++  UINT32                           Random;=0D
+   EFI_STATUS                       Status;=0D
+   UINTN                            DiscoverLenNeeded;=0D
+ =0D
+@@ -2198,6 +2198,12 @@ PxeBcDhcp6Discover (
+     return EFI_DEVICE_ERROR;=0D
+   }=0D
+ =0D
++  Status =3D PseudoRandomU32 (&Random);=0D
++  if (EFI_ERROR (Status)) {=0D
++    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\n", __f=
unc__, Status));=0D
++    return Status;=0D
++  }=0D
++=0D
+   DiscoverLenNeeded =3D sizeof (EFI_PXE_BASE_CODE_DHCPV6_PACKET);=0D
+   Discover          =3D AllocateZeroPool (DiscoverLenNeeded);=0D
+   if (Discover =3D=3D NULL) {=0D
+@@ -2207,8 +2213,7 @@ PxeBcDhcp6Discover (
+   //=0D
+   // Build the discover packet by the cached request packet before.=0D
+   //=0D
+-  Xid                     =3D NET_RANDOM (NetRandomInitSeed ());=0D
+-  Discover->TransactionId =3D HTONL (Xid);=0D
++  Discover->TransactionId =3D HTONL (Random);=0D
+   Discover->MessageType   =3D Request->Dhcp6.Header.MessageType;=0D
+   RequestOpt              =3D Request->Dhcp6.Option;=0D
+   DiscoverOpt             =3D Discover->DhcpOptions;=0D
+diff --git a/NetworkPkg/UefiPxeBcDxe/PxeBcDriver.c b/NetworkPkg/UefiPxeBcD=
xe/PxeBcDriver.c
+index d84aca7e85..4cd915b411 100644
+--- a/NetworkPkg/UefiPxeBcDxe/PxeBcDriver.c
++++ b/NetworkPkg/UefiPxeBcDxe/PxeBcDriver.c
+@@ -3,6 +3,7 @@
+ =0D
+   (C) Copyright 2014 Hewlett-Packard Development Company, L.P.<BR>=0D
+   Copyright (c) 2007 - 2019, Intel Corporation. All rights reserved.<BR>=
=0D
++  Copyright (c) Microsoft Corporation=0D
+ =0D
+   SPDX-License-Identifier: BSD-2-Clause-Patent=0D
+ =0D
+@@ -892,6 +893,13 @@ PxeBcCreateIp6Children (
+   PXEBC_PRIVATE_PROTOCOL       *Id;=0D
+   EFI_SIMPLE_NETWORK_PROTOCOL  *Snp;=0D
+   UINTN                        Index;=0D
++  UINT32                       Random;=0D
++=0D
++  Status =3D PseudoRandomU32 (&Random);=0D
++  if (EFI_ERROR (Status)) {=0D
++    DEBUG ((DEBUG_ERROR, "Failed to generate random number using EFI_RNG_=
PROTOCOL: %r\n", Status));=0D
++    return Status;=0D
++  }=0D
+ =0D
+   if (Private->Ip6Nic !=3D NULL) {=0D
+     //=0D
+@@ -935,9 +943,9 @@ PxeBcCreateIp6Children (
+   }=0D
+ =0D
+   //=0D
+-  // Generate a random IAID for the Dhcp6 assigned address.=0D
++  // Set a random IAID for the Dhcp6 assigned address.=0D
+   //=0D
+-  Private->IaId =3D NET_RANDOM (NetRandomInitSeed ());=0D
++  Private->IaId =3D Random;=0D
+   if (Private->Snp !=3D NULL) {=0D
+     for (Index =3D 0; Index < Private->Snp->Mode->HwAddressSize; Index++)=
 {=0D
+       Private->IaId |=3D (Private->Snp->Mode->CurrentAddress.Addr[Index] =
<< ((Index << 3) & 31));=0D
+--=20
+2.40.0
+
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ov=
mf_git.bb
index 6ac72772d1..47ed2c7cd3 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -47,6 +47,8 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=
=3Dmaster;protocol=3Dhttps \
            file://CVE-2023-45229-0002.patch \
            file://CVE-2023-45229-0003.patch \
            file://CVE-2023-45229-0004.patch \
+           file://CVE-2023-45237-0001.patch \
+           file://CVE-2023-45237-0002.patch \
            "
=20
 PV =3D "edk2-stable202202"
--=20
2.40.0


