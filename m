Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E29CC3271E
	for <webhook@archiver.kernel.org>; Thu, 11 Jul 2024 04:56:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.4971.1720673763628059277
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 21:56:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=79227d51f5=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46B4f2pR015514
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 21:56:03 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4075eg48ns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 21:56:02 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 21:55:59 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 01/11] ovmf: Fix CVE-2022-36763
Date: Thu, 11 Jul 2024 04:55:31 +0000
Message-ID: <20240711045541.2155076-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: rq33zvKv5a_1z3oob6TUQFzfUDby27kr
X-Proofpoint-ORIG-GUID: rq33zvKv5a_1z3oob6TUQFzfUDby27kr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-11_01,2024-07-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1011 adultscore=0 bulkscore=0
 mlxscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407110031
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 04:56:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201751

From: Soumya Sambu <soumya.sambu@windriver.com>

EDK2 is susceptible to a vulnerability in the Tcg2MeasureGptTable()
function, allowing a user to trigger a heap buffer overflow via a local
network. Successful exploitation of this vulnerability may result in a
compromise of confidentiality, integrity, and/or availability.

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-36763

Upstream-patches:
https://github.com/tianocore/edk2/commit/224446543206450ddb5830e6abd026d61d=
3c7f4b
https://github.com/tianocore/edk2/commit/4776a1b39ee08fc45c70c1eab5a0195f32=
5000d3
https://github.com/tianocore/edk2/commit/1ddcb9fc6b4164e882687b031e8beacfcf=
7df29e

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../ovmf/ovmf/CVE-2022-36763-0001.patch       | 985 ++++++++++++++++++
 .../ovmf/ovmf/CVE-2022-36763-0002.patch       | 889 ++++++++++++++++
 .../ovmf/ovmf/CVE-2022-36763-0003.patch       |  55 +
 meta/recipes-core/ovmf/ovmf_git.bb            |   3 +
 4 files changed, 1932 insertions(+)
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2022-36763-0001.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2022-36763-0002.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2022-36763-0003.patch

diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2022-36763-0001.patch b/meta/r=
ecipes-core/ovmf/ovmf/CVE-2022-36763-0001.patch
new file mode 100644
index 0000000000..93cefe7740
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/CVE-2022-36763-0001.patch
@@ -0,0 +1,985 @@
+From 224446543206450ddb5830e6abd026d61d3c7f4b Mon Sep 17 00:00:00 2001
+From: "Douglas Flick [MSFT]" <doug.edk2@gmail.com>
+Date: Fri, 12 Jan 2024 02:16:01 +0800
+Subject: [PATCH] SecurityPkg: DxeTpm2MeasureBootLib: SECURITY PATCH 4117 -=
 CVE
+ 2022-36763
+
+This commit contains the patch files and tests for DxeTpm2MeasureBootLib
+CVE 2022-36763.
+
+Cc: Jiewen Yao <jiewen.yao@intel.com>
+
+Signed-off-by: Doug Flick [MSFT] <doug.edk2@gmail.com>
+
+CVE: CVE-2022-36763
+
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/224446=
543206450ddb5830e6abd026d61d3c7f4b]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ .../DxeTpm2MeasureBootLib.c                   |  69 ++--
+ .../DxeTpm2MeasureBootLib.inf                 |   4 +-
+ .../DxeTpm2MeasureBootLibSanitization.c       | 275 ++++++++++++++++
+ .../DxeTpm2MeasureBootLibSanitization.h       | 113 +++++++
+ .../DxeTpm2MeasureBootLibSanitizationTest.c   | 303 ++++++++++++++++++
+ ...Tpm2MeasureBootLibSanitizationTestHost.inf |  28 ++
+ SecurityPkg/SecurityPkg.ci.yaml               |   1 +
+ 7 files changed, 763 insertions(+), 30 deletions(-)
+ create mode 100644 SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2Measu=
reBootLibSanitization.c
+ create mode 100644 SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2Measu=
reBootLibSanitization.h
+ create mode 100644 SecurityPkg/Library/DxeTpm2MeasureBootLib/InternalUnit=
Test/DxeTpm2MeasureBootLibSanitizationTest.c
+ create mode 100644 SecurityPkg/Library/DxeTpm2MeasureBootLib/InternalUnit=
Test/DxeTpm2MeasureBootLibSanitizationTestHost.inf
+
+diff --git a/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootL=
ib.c b/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLib.c
+index 36a256a7af..0475103d6e 100644
+--- a/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLib.c
++++ b/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLib.c
+@@ -20,6 +20,8 @@ Copyright (c) 2013 - 2018, Intel Corporation. All rights=
 reserved.<BR>
+ (C) Copyright 2015 Hewlett Packard Enterprise Development LP<BR>=0D
+ SPDX-License-Identifier: BSD-2-Clause-Patent=0D
+ =0D
++Copyright (c) Microsoft Corporation.<BR>=0D
++SPDX-License-Identifier: BSD-2-Clause-Patent=0D
+ **/=0D
+ =0D
+ #include <PiDxe.h>=0D
+@@ -44,6 +46,8 @@ SPDX-License-Identifier: BSD-2-Clause-Patent
+ #include <Library/HobLib.h>=0D
+ #include <Protocol/CcMeasurement.h>=0D
+ =0D
++#include "DxeTpm2MeasureBootLibSanitization.h"=0D
++=0D
+ typedef struct {=0D
+   EFI_TCG2_PROTOCOL              *Tcg2Protocol;=0D
+   EFI_CC_MEASUREMENT_PROTOCOL    *CcProtocol;=0D
+@@ -144,10 +148,11 @@ Tcg2MeasureGptTable (
+   EFI_TCG2_EVENT               *Tcg2Event;=0D
+   EFI_CC_EVENT                 *CcEvent;=0D
+   EFI_GPT_DATA                 *GptData;=0D
+-  UINT32                       EventSize;=0D
++  UINT32                       TcgEventSize;=0D
+   EFI_TCG2_PROTOCOL            *Tcg2Protocol;=0D
+   EFI_CC_MEASUREMENT_PROTOCOL  *CcProtocol;=0D
+   EFI_CC_MR_INDEX              MrIndex;=0D
++  UINT32                       AllocSize;=0D
+ =0D
+   if (mTcg2MeasureGptCount > 0) {=0D
+     return EFI_SUCCESS;=0D
+@@ -195,25 +200,22 @@ Tcg2MeasureGptTable (
+                      BlockIo->Media->BlockSize,=0D
+                      (UINT8 *)PrimaryHeader=0D
+                      );=0D
+-  if (EFI_ERROR (Status)) {=0D
+-    DEBUG ((DEBUG_ERROR, "Failed to Read Partition Table Header!\n"));=0D
++  if (EFI_ERROR (Status) || EFI_ERROR (SanitizeEfiPartitionTableHeader (P=
rimaryHeader, BlockIo))) {=0D
++    DEBUG ((DEBUG_ERROR, "Failed to read Partition Table Header or invali=
d Partition Table Header!\n"));=0D
+     FreePool (PrimaryHeader);=0D
+     return EFI_DEVICE_ERROR;=0D
+   }=0D
+ =0D
+   //=0D
+-  // PrimaryHeader->SizeOfPartitionEntry should not be zero=0D
++  // Read the partition entry.=0D
+   //=0D
+-  if (PrimaryHeader->SizeOfPartitionEntry =3D=3D 0) {=0D
+-    DEBUG ((DEBUG_ERROR, "SizeOfPartitionEntry should not be zero!\n"));=
=0D
++  Status =3D SanitizePrimaryHeaderAllocationSize (PrimaryHeader, &AllocSi=
ze);=0D
++  if (EFI_ERROR (Status)) {=0D
+     FreePool (PrimaryHeader);=0D
+     return EFI_BAD_BUFFER_SIZE;=0D
+   }=0D
+ =0D
+-  //=0D
+-  // Read the partition entry.=0D
+-  //=0D
+-  EntryPtr =3D (UINT8 *)AllocatePool (PrimaryHeader->NumberOfPartitionEnt=
ries * PrimaryHeader->SizeOfPartitionEntry);=0D
++  EntryPtr =3D (UINT8 *)AllocatePool (AllocSize);=0D
+   if (EntryPtr =3D=3D NULL) {=0D
+     FreePool (PrimaryHeader);=0D
+     return EFI_OUT_OF_RESOURCES;=0D
+@@ -223,7 +225,7 @@ Tcg2MeasureGptTable (
+                      DiskIo,=0D
+                      BlockIo->Media->MediaId,=0D
+                      MultU64x32 (PrimaryHeader->PartitionEntryLBA, BlockI=
o->Media->BlockSize),=0D
+-                     PrimaryHeader->NumberOfPartitionEntries * PrimaryHea=
der->SizeOfPartitionEntry,=0D
++                     AllocSize,=0D
+                      EntryPtr=0D
+                      );=0D
+   if (EFI_ERROR (Status)) {=0D
+@@ -248,16 +250,21 @@ Tcg2MeasureGptTable (
+   //=0D
+   // Prepare Data for Measurement (CcProtocol and Tcg2Protocol)=0D
+   //=0D
+-  EventSize =3D (UINT32)(sizeof (EFI_GPT_DATA) - sizeof (GptData->Partiti=
ons)=0D
+-                       + NumberOfPartition * PrimaryHeader->SizeOfPartiti=
onEntry);=0D
+-  EventPtr =3D (UINT8 *)AllocateZeroPool (EventSize + sizeof (EFI_TCG2_EV=
ENT) - sizeof (Tcg2Event->Event));=0D
++  Status =3D SanitizePrimaryHeaderGptEventSize (PrimaryHeader, NumberOfPa=
rtition, &TcgEventSize);=0D
++  if (EFI_ERROR (Status)) {=0D
++    FreePool (PrimaryHeader);=0D
++    FreePool (EntryPtr);=0D
++    return EFI_DEVICE_ERROR;=0D
++  }=0D
++=0D
++  EventPtr =3D (UINT8 *)AllocateZeroPool (TcgEventSize);=0D
+   if (EventPtr =3D=3D NULL) {=0D
+     Status =3D EFI_OUT_OF_RESOURCES;=0D
+     goto Exit;=0D
+   }=0D
+ =0D
+   Tcg2Event                       =3D (EFI_TCG2_EVENT *)EventPtr;=0D
+-  Tcg2Event->Size                 =3D EventSize + sizeof (EFI_TCG2_EVENT)=
 - sizeof (Tcg2Event->Event);=0D
++  Tcg2Event->Size                 =3D TcgEventSize;=0D
+   Tcg2Event->Header.HeaderSize    =3D sizeof (EFI_TCG2_EVENT_HEADER);=0D
+   Tcg2Event->Header.HeaderVersion =3D EFI_TCG2_EVENT_HEADER_VERSION;=0D
+   Tcg2Event->Header.PCRIndex      =3D 5;=0D
+@@ -310,7 +317,7 @@ Tcg2MeasureGptTable (
+                                             CcProtocol,=0D
+                                             0,=0D
+                                             (EFI_PHYSICAL_ADDRESS)(UINTN)=
(VOID *)GptData,=0D
+-                                            (UINT64)EventSize,=0D
++                                            (UINT64)TcgEventSize - OFFSET=
_OF (EFI_TCG2_EVENT, Event),=0D
+                                             CcEvent=0D
+                                             );=0D
+     if (!EFI_ERROR (Status)) {=0D
+@@ -326,7 +333,7 @@ Tcg2MeasureGptTable (
+                              Tcg2Protocol,=0D
+                              0,=0D
+                              (EFI_PHYSICAL_ADDRESS)(UINTN)(VOID *)GptData=
,=0D
+-                             (UINT64)EventSize,=0D
++                             (UINT64)TcgEventSize -  OFFSET_OF (EFI_TCG2_=
EVENT, Event),=0D
+                              Tcg2Event=0D
+                              );=0D
+     if (!EFI_ERROR (Status)) {=0D
+@@ -443,11 +450,13 @@ Tcg2MeasurePeImage (
+       Tcg2Event->Header.PCRIndex  =3D 2;=0D
+       break;=0D
+     default:=0D
+-      DEBUG ((=0D
+-        DEBUG_ERROR,=0D
+-        "Tcg2MeasurePeImage: Unknown subsystem type %d",=0D
+-        ImageType=0D
+-        ));=0D
++      DEBUG (=0D
++        (=0D
++         DEBUG_ERROR,=0D
++         "Tcg2MeasurePeImage: Unknown subsystem type %d",=0D
++         ImageType=0D
++        )=0D
++        );=0D
+       goto Finish;=0D
+   }=0D
+ =0D
+@@ -515,7 +524,7 @@ Finish:
+ =0D
+   @param  MeasureBootProtocols  Pointer to the located measure boot proto=
col instances.=0D
+ =0D
+-  @retval EFI_SUCCESS           Sucessfully locate the measure boot proto=
col instances (at least one instance).=0D
++  @retval EFI_SUCCESS           Successfully locate the measure boot prot=
ocol instances (at least one instance).=0D
+   @retval EFI_UNSUPPORTED       Measure boot is not supported.=0D
+ **/=0D
+ EFI_STATUS=0D
+@@ -646,12 +655,14 @@ DxeTpm2MeasureBootHandler (
+     return EFI_SUCCESS;=0D
+   }=0D
+ =0D
+-  DEBUG ((=0D
+-    DEBUG_INFO,=0D
+-    "Tcg2Protocol =3D %p, CcMeasurementProtocol =3D %p\n",=0D
+-    MeasureBootProtocols.Tcg2Protocol,=0D
+-    MeasureBootProtocols.CcProtocol=0D
+-    ));=0D
++  DEBUG (=0D
++    (=0D
++     DEBUG_INFO,=0D
++     "Tcg2Protocol =3D %p, CcMeasurementProtocol =3D %p\n",=0D
++     MeasureBootProtocols.Tcg2Protocol,=0D
++     MeasureBootProtocols.CcProtocol=0D
++    )=0D
++    );=0D
+ =0D
+   //=0D
+   // Copy File Device Path=0D
+diff --git a/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootL=
ib.inf b/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLib.inf
+index 6dca79a20c..28995f438d 100644
+--- a/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLib.inf
++++ b/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLib.inf
+@@ -37,6 +37,8 @@
+ =0D
+ [Sources]=0D
+   DxeTpm2MeasureBootLib.c=0D
++  DxeTpm2MeasureBootLibSanitization.c=0D
++  DxeTpm2MeasureBootLibSanitization.h=0D
+ =0D
+ [Packages]=0D
+   MdePkg/MdePkg.dec=0D
+@@ -46,6 +48,7 @@
+ =0D
+ [LibraryClasses]=0D
+   BaseMemoryLib=0D
++  SafeIntLib=0D
+   DebugLib=0D
+   MemoryAllocationLib=0D
+   DevicePathLib=0D
+@@ -65,4 +68,3 @@
+   gEfiFirmwareVolumeBlockProtocolGuid   ## SOMETIMES_CONSUMES=0D
+   gEfiBlockIoProtocolGuid               ## SOMETIMES_CONSUMES=0D
+   gEfiDiskIoProtocolGuid                ## SOMETIMES_CONSUMES=0D
+-=0D
+diff --git a/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootL=
ibSanitization.c b/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2Measure=
BootLibSanitization.c
+new file mode 100644
+index 0000000000..e2309655d3
+--- /dev/null
++++ b/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLibSanit=
ization.c
+@@ -0,0 +1,275 @@
++/** @file=0D
++  The library instance provides security service of TPM2 measure boot and=
=0D
++  Confidential Computing (CC) measure boot.=0D
++=0D
++  Caution: This file requires additional review when modified.=0D
++  This library will have external input - PE/COFF image and GPT partition=
.=0D
++  This external input must be validated carefully to avoid security issue=
 like=0D
++  buffer overflow, integer overflow.=0D
++=0D
++  This file will pull out the validation logic from the following functio=
ns, in an=0D
++  attempt to validate the untrusted input in the form of unit tests=0D
++=0D
++  These are those functions:=0D
++=0D
++  DxeTpm2MeasureBootLibImageRead() function will make sure the PE/COFF im=
age content=0D
++  read is within the image buffer.=0D
++=0D
++  Tcg2MeasureGptTable() function will receive untrusted GPT partition tab=
le, and parse=0D
++  partition data carefully.=0D
++=0D
++  Copyright (c) Microsoft Corporation.<BR>=0D
++  SPDX-License-Identifier: BSD-2-Clause-Patent=0D
++**/=0D
++#include <Uefi.h>=0D
++#include <Uefi/UefiSpec.h>=0D
++#include <Library/SafeIntLib.h>=0D
++#include <Library/UefiLib.h>=0D
++#include <Library/DebugLib.h>=0D
++#include <Library/BaseLib.h>=0D
++#include <IndustryStandard/UefiTcgPlatform.h>=0D
++#include <Protocol/BlockIo.h>=0D
++#include <Library/MemoryAllocationLib.h>=0D
++=0D
++#include "DxeTpm2MeasureBootLibSanitization.h"=0D
++=0D
++#define GPT_HEADER_REVISION_V1  0x00010000=0D
++=0D
++/**=0D
++  This function will validate the EFI_PARTITION_TABLE_HEADER structure is=
 safe to parse=0D
++  However this function will not attempt to verify the validity of the GP=
T partition=0D
++  It will check the following:=0D
++    - Signature=0D
++    - Revision=0D
++    - AlternateLBA=0D
++    - FirstUsableLBA=0D
++    - LastUsableLBA=0D
++    - PartitionEntryLBA=0D
++    - NumberOfPartitionEntries=0D
++    - SizeOfPartitionEntry=0D
++    - BlockIo=0D
++=0D
++  @param[in] PrimaryHeader=0D
++    Pointer to the EFI_PARTITION_TABLE_HEADER structure.=0D
++=0D
++  @param[in] BlockIo=0D
++    Pointer to the EFI_BLOCK_IO_PROTOCOL structure.=0D
++=0D
++  @retval EFI_SUCCESS=0D
++    The EFI_PARTITION_TABLE_HEADER structure is valid.=0D
++=0D
++  @retval EFI_INVALID_PARAMETER=0D
++    The EFI_PARTITION_TABLE_HEADER structure is invalid.=0D
++**/=0D
++EFI_STATUS=0D
++EFIAPI=0D
++SanitizeEfiPartitionTableHeader (=0D
++  IN CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,=0D
++  IN CONST EFI_BLOCK_IO_PROTOCOL       *BlockIo=0D
++  )=0D
++{=0D
++  //=0D
++  // Verify that the input parameters are safe to use=0D
++  //=0D
++  if (PrimaryHeader =3D=3D NULL) {=0D
++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header!\n"));=0D
++    return EFI_INVALID_PARAMETER;=0D
++  }=0D
++=0D
++  if ((BlockIo =3D=3D NULL) || (BlockIo->Media =3D=3D NULL)) {=0D
++    DEBUG ((DEBUG_ERROR, "Invalid BlockIo!\n"));=0D
++    return EFI_INVALID_PARAMETER;=0D
++  }=0D
++=0D
++  //=0D
++  // The signature must be EFI_PTAB_HEADER_ID ("EFI PART" in ASCII)=0D
++  //=0D
++  if (PrimaryHeader->Header.Signature !=3D EFI_PTAB_HEADER_ID) {=0D
++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header!\n"));=0D
++    return EFI_DEVICE_ERROR;=0D
++  }=0D
++=0D
++  //=0D
++  // The version must be GPT_HEADER_REVISION_V1 (0x00010000)=0D
++  //=0D
++  if (PrimaryHeader->Header.Revision !=3D GPT_HEADER_REVISION_V1) {=0D
++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header Revision!\n"));=
=0D
++    return EFI_DEVICE_ERROR;=0D
++  }=0D
++=0D
++  //=0D
++  // The HeaderSize must be greater than or equal to 92 and must be less =
than or equal to the logical block size=0D
++  //=0D
++  if ((PrimaryHeader->Header.HeaderSize < sizeof (EFI_PARTITION_TABLE_HEA=
DER)) || (PrimaryHeader->Header.HeaderSize > BlockIo->Media->BlockSize)) {=
=0D
++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header HeaderSize!\n"))=
;=0D
++    return EFI_DEVICE_ERROR;=0D
++  }=0D
++=0D
++  //=0D
++  // The partition entries should all be before the first usable block=0D
++  //=0D
++  if (PrimaryHeader->FirstUsableLBA <=3D PrimaryHeader->PartitionEntryLBA=
) {=0D
++    DEBUG ((DEBUG_ERROR, "GPT PartitionEntryLBA is not less than FirstUsa=
bleLBA!\n"));=0D
++    return EFI_DEVICE_ERROR;=0D
++  }=0D
++=0D
++  //=0D
++  // Check that the PartitionEntryLBA greater than the Max LBA=0D
++  // This will be used later for multiplication=0D
++  //=0D
++  if (PrimaryHeader->PartitionEntryLBA > DivU64x32 (MAX_UINT64, BlockIo->=
Media->BlockSize)) {=0D
++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header PartitionEntryLB=
A!\n"));=0D
++    return EFI_DEVICE_ERROR;=0D
++  }=0D
++=0D
++  //=0D
++  // Check that the number of partition entries is greater than zero=0D
++  //=0D
++  if (PrimaryHeader->NumberOfPartitionEntries =3D=3D 0) {=0D
++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header NumberOfPartitio=
nEntries!\n"));=0D
++    return EFI_DEVICE_ERROR;=0D
++  }=0D
++=0D
++  //=0D
++  // SizeOfPartitionEntry must be 128, 256, 512... improper size may lead=
 to accessing uninitialized memory=0D
++  //=0D
++  if ((PrimaryHeader->SizeOfPartitionEntry < 128) || ((PrimaryHeader->Siz=
eOfPartitionEntry & (PrimaryHeader->SizeOfPartitionEntry - 1)) !=3D 0)) {=0D
++    DEBUG ((DEBUG_ERROR, "SizeOfPartitionEntry shall be set to a value of=
 128 x 2^n where n is an integer greater than or equal to zero (e.g., 128, =
256, 512, etc.)!\n"));=0D
++    return EFI_DEVICE_ERROR;=0D
++  }=0D
++=0D
++  //=0D
++  // This check is to prevent overflow when calculating the allocation si=
ze for the partition entries=0D
++  // This check will be used later for multiplication=0D
++  //=0D
++  if (PrimaryHeader->NumberOfPartitionEntries > DivU64x32 (MAX_UINT64, Pr=
imaryHeader->SizeOfPartitionEntry)) {=0D
++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header NumberOfPartitio=
nEntries!\n"));=0D
++    return EFI_DEVICE_ERROR;=0D
++  }=0D
++=0D
++  return EFI_SUCCESS;=0D
++}=0D
++=0D
++/**=0D
++  This function will validate that the allocation size from the primary h=
eader is sane=0D
++  It will check the following:=0D
++    - AllocationSize does not overflow=0D
++=0D
++  @param[in] PrimaryHeader=0D
++    Pointer to the EFI_PARTITION_TABLE_HEADER structure.=0D
++=0D
++  @param[out] AllocationSize=0D
++    Pointer to the allocation size.=0D
++=0D
++  @retval EFI_SUCCESS=0D
++    The allocation size is valid.=0D
++=0D
++  @retval EFI_OUT_OF_RESOURCES=0D
++    The allocation size is invalid.=0D
++**/=0D
++EFI_STATUS=0D
++EFIAPI=0D
++SanitizePrimaryHeaderAllocationSize (=0D
++  IN CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,=0D
++  OUT UINT32                           *AllocationSize=0D
++  )=0D
++{=0D
++  EFI_STATUS  Status;=0D
++=0D
++  if (PrimaryHeader =3D=3D NULL) {=0D
++    return EFI_INVALID_PARAMETER;=0D
++  }=0D
++=0D
++  if (AllocationSize =3D=3D NULL) {=0D
++    return EFI_INVALID_PARAMETER;=0D
++  }=0D
++=0D
++  //=0D
++  // Replacing logic:=0D
++  // PrimaryHeader->NumberOfPartitionEntries * PrimaryHeader->SizeOfParti=
tionEntry;=0D
++  //=0D
++  Status =3D SafeUint32Mult (PrimaryHeader->NumberOfPartitionEntries, Pri=
maryHeader->SizeOfPartitionEntry, AllocationSize);=0D
++  if (EFI_ERROR (Status)) {=0D
++    DEBUG ((DEBUG_ERROR, "Allocation Size would have overflowed!\n"));=0D
++    return EFI_BAD_BUFFER_SIZE;=0D
++  }=0D
++=0D
++  return EFI_SUCCESS;=0D
++}=0D
++=0D
++/**=0D
++  This function will validate that the Gpt Event Size calculated from the=
 primary header is sane=0D
++  It will check the following:=0D
++    - EventSize does not overflow=0D
++=0D
++  Important: This function includes the entire length of the allocated sp=
ace, including=0D
++  (sizeof (EFI_TCG2_EVENT) - sizeof (Tcg2Event->Event)) . When hashing th=
e buffer allocated with this=0D
++  size, the caller must subtract the size of the (sizeof (EFI_TCG2_EVENT)=
 - sizeof (Tcg2Event->Event))=0D
++  from the size of the buffer before hashing.=0D
++=0D
++  @param[in] PrimaryHeader - Pointer to the EFI_PARTITION_TABLE_HEADER st=
ructure.=0D
++  @param[in] NumberOfPartition - Number of partitions.=0D
++  @param[out] EventSize - Pointer to the event size.=0D
++=0D
++  @retval EFI_SUCCESS=0D
++    The event size is valid.=0D
++=0D
++  @retval EFI_OUT_OF_RESOURCES=0D
++    Overflow would have occurred.=0D
++=0D
++  @retval EFI_INVALID_PARAMETER=0D
++    One of the passed parameters was invalid.=0D
++**/=0D
++EFI_STATUS=0D
++SanitizePrimaryHeaderGptEventSize (=0D
++  IN  CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,=0D
++  IN  UINTN                             NumberOfPartition,=0D
++  OUT UINT32                            *EventSize=0D
++  )=0D
++{=0D
++  EFI_STATUS  Status;=0D
++  UINT32      SafeNumberOfPartitions;=0D
++=0D
++  if (PrimaryHeader =3D=3D NULL) {=0D
++    return EFI_INVALID_PARAMETER;=0D
++  }=0D
++=0D
++  if (EventSize =3D=3D NULL) {=0D
++    return EFI_INVALID_PARAMETER;=0D
++  }=0D
++=0D
++  //=0D
++  // We shouldn't even attempt to perform the multiplication if the numbe=
r of partitions is greater than the maximum value of UINT32=0D
++  //=0D
++  Status =3D SafeUintnToUint32 (NumberOfPartition, &SafeNumberOfPartition=
s);=0D
++  if (EFI_ERROR (Status)) {=0D
++    DEBUG ((DEBUG_ERROR, "NumberOfPartition would have overflowed!\n"));=
=0D
++    return EFI_INVALID_PARAMETER;=0D
++  }=0D
++=0D
++  //=0D
++  // Replacing logic:=0D
++  // (UINT32)(sizeof (EFI_GPT_DATA) - sizeof (GptData->Partitions) + Numb=
erOfPartition * PrimaryHeader.SizeOfPartitionEntry);=0D
++  //=0D
++  Status =3D SafeUint32Mult (SafeNumberOfPartitions, PrimaryHeader->SizeO=
fPartitionEntry, EventSize);=0D
++  if (EFI_ERROR (Status)) {=0D
++    DEBUG ((DEBUG_ERROR, "Event Size would have overflowed!\n"));=0D
++    return EFI_BAD_BUFFER_SIZE;=0D
++  }=0D
++=0D
++  //=0D
++  // Replacing logic:=0D
++  // *EventSize + sizeof (EFI_TCG2_EVENT) - sizeof (Tcg2Event->Event);=0D
++  //=0D
++  Status =3D SafeUint32Add (=0D
++             OFFSET_OF (EFI_TCG2_EVENT, Event) + OFFSET_OF (EFI_GPT_DATA,=
 Partitions),=0D
++             *EventSize,=0D
++             EventSize=0D
++             );=0D
++  if (EFI_ERROR (Status)) {=0D
++    DEBUG ((DEBUG_ERROR, "Event Size would have overflowed because of GPT=
Data!\n"));=0D
++    return EFI_BAD_BUFFER_SIZE;=0D
++  }=0D
++=0D
++  return EFI_SUCCESS;=0D
++}=0D
+diff --git a/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootL=
ibSanitization.h b/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2Measure=
BootLibSanitization.h
+new file mode 100644
+index 0000000000..048b738987
+--- /dev/null
++++ b/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLibSanit=
ization.h
+@@ -0,0 +1,113 @@
++/** @file=0D
++  This file includes the function prototypes for the sanitization functio=
ns.=0D
++=0D
++  These are those functions:=0D
++=0D
++  DxeTpm2MeasureBootLibImageRead() function will make sure the PE/COFF im=
age content=0D
++  read is within the image buffer.=0D
++=0D
++  Tcg2MeasureGptTable() function will receive untrusted GPT partition tab=
le, and parse=0D
++  partition data carefully.=0D
++=0D
++  Copyright (c) Microsoft Corporation.<BR>=0D
++  SPDX-License-Identifier: BSD-2-Clause-Patent=0D
++=0D
++**/=0D
++=0D
++#ifndef DXE_TPM2_MEASURE_BOOT_LIB_SANITATION_=0D
++#define DXE_TPM2_MEASURE_BOOT_LIB_SANITATION_=0D
++=0D
++#include <Uefi.h>=0D
++#include <Uefi/UefiSpec.h>=0D
++#include <Protocol/BlockIo.h>=0D
++#include <IndustryStandard/UefiTcgPlatform.h>=0D
++#include <Protocol/Tcg2Protocol.h>=0D
++=0D
++/**=0D
++  This function will validate the EFI_PARTITION_TABLE_HEADER structure is=
 safe to parse=0D
++  However this function will not attempt to verify the validity of the GP=
T partition=0D
++  It will check the following:=0D
++    - Signature=0D
++    - Revision=0D
++    - AlternateLBA=0D
++    - FirstUsableLBA=0D
++    - LastUsableLBA=0D
++    - PartitionEntryLBA=0D
++    - NumberOfPartitionEntries=0D
++    - SizeOfPartitionEntry=0D
++    - BlockIo=0D
++=0D
++  @param[in] PrimaryHeader=0D
++    Pointer to the EFI_PARTITION_TABLE_HEADER structure.=0D
++=0D
++  @param[in] BlockIo=0D
++    Pointer to the EFI_BLOCK_IO_PROTOCOL structure.=0D
++=0D
++  @retval EFI_SUCCESS=0D
++    The EFI_PARTITION_TABLE_HEADER structure is valid.=0D
++=0D
++  @retval EFI_INVALID_PARAMETER=0D
++    The EFI_PARTITION_TABLE_HEADER structure is invalid.=0D
++**/=0D
++EFI_STATUS=0D
++EFIAPI=0D
++SanitizeEfiPartitionTableHeader (=0D
++  IN CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,=0D
++  IN CONST EFI_BLOCK_IO_PROTOCOL       *BlockIo=0D
++  );=0D
++=0D
++/**=0D
++  This function will validate that the allocation size from the primary h=
eader is sane=0D
++  It will check the following:=0D
++    - AllocationSize does not overflow=0D
++=0D
++  @param[in] PrimaryHeader=0D
++    Pointer to the EFI_PARTITION_TABLE_HEADER structure.=0D
++=0D
++  @param[out] AllocationSize=0D
++    Pointer to the allocation size.=0D
++=0D
++  @retval EFI_SUCCESS=0D
++    The allocation size is valid.=0D
++=0D
++  @retval EFI_OUT_OF_RESOURCES=0D
++    The allocation size is invalid.=0D
++**/=0D
++EFI_STATUS=0D
++EFIAPI=0D
++SanitizePrimaryHeaderAllocationSize (=0D
++  IN CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,=0D
++  OUT UINT32                           *AllocationSize=0D
++  );=0D
++=0D
++/**=0D
++  This function will validate that the Gpt Event Size calculated from the=
 primary header is sane=0D
++  It will check the following:=0D
++    - EventSize does not overflow=0D
++=0D
++  Important: This function includes the entire length of the allocated sp=
ace, including=0D
++  (sizeof (EFI_TCG2_EVENT) - sizeof (Tcg2Event->Event)) . When hashing th=
e buffer allocated with this=0D
++  size, the caller must subtract the size of the (sizeof (EFI_TCG2_EVENT)=
 - sizeof (Tcg2Event->Event))=0D
++  from the size of the buffer before hashing.=0D
++=0D
++  @param[in] PrimaryHeader - Pointer to the EFI_PARTITION_TABLE_HEADER st=
ructure.=0D
++  @param[in] NumberOfPartition - Number of partitions.=0D
++  @param[out] EventSize - Pointer to the event size.=0D
++=0D
++  @retval EFI_SUCCESS=0D
++    The event size is valid.=0D
++=0D
++  @retval EFI_OUT_OF_RESOURCES=0D
++    Overflow would have occurred.=0D
++=0D
++  @retval EFI_INVALID_PARAMETER=0D
++    One of the passed parameters was invalid.=0D
++**/=0D
++EFI_STATUS=0D
++SanitizePrimaryHeaderGptEventSize (=0D
++  IN  CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,=0D
++  IN  UINTN                             NumberOfPartition,=0D
++  OUT UINT32                            *EventSize=0D
++  );=0D
++=0D
++#endif // DXE_TPM2_MEASURE_BOOT_LIB_SANITATION_=0D
+diff --git a/SecurityPkg/Library/DxeTpm2MeasureBootLib/InternalUnitTest/Dx=
eTpm2MeasureBootLibSanitizationTest.c b/SecurityPkg/Library/DxeTpm2MeasureB=
ootLib/InternalUnitTest/DxeTpm2MeasureBootLibSanitizationTest.c
+new file mode 100644
+index 0000000000..3eb9763e3c
+--- /dev/null
++++ b/SecurityPkg/Library/DxeTpm2MeasureBootLib/InternalUnitTest/DxeTpm2Me=
asureBootLibSanitizationTest.c
+@@ -0,0 +1,303 @@
++/** @file=0D
++  This file includes the unit test cases for the DxeTpm2MeasureBootLibSan=
itizationTest.c.=0D
++=0D
++  Copyright (c) Microsoft Corporation.<BR>=0D
++  SPDX-License-Identifier: BSD-2-Clause-Patent=0D
++**/=0D
++=0D
++#include <Uefi.h>=0D
++#include <Library/UefiLib.h>=0D
++#include <Library/DebugLib.h>=0D
++#include <Library/UnitTestLib.h>=0D
++#include <Protocol/BlockIo.h>=0D
++#include <Library/MemoryAllocationLib.h>=0D
++#include <Library/BaseMemoryLib.h>=0D
++#include <IndustryStandard/UefiTcgPlatform.h>=0D
++#include <Protocol/Tcg2Protocol.h>=0D
++=0D
++#include "../DxeTpm2MeasureBootLibSanitization.h"=0D
++=0D
++#define UNIT_TEST_NAME     "DxeTpm2MeasureBootLibSanitizationTest"=0D
++#define UNIT_TEST_VERSION  "1.0"=0D
++=0D
++#define DEFAULT_PRIMARY_TABLE_HEADER_REVISION                     0x00010=
000=0D
++#define DEFAULT_PRIMARY_TABLE_HEADER_NUMBER_OF_PARTITION_ENTRIES  1=0D
++#define DEFAULT_PRIMARY_TABLE_HEADER_SIZE_OF_PARTITION_ENTRY      128=0D
++=0D
++/**=0D
++  This function tests the SanitizeEfiPartitionTableHeader function.=0D
++  It's intent is to test that a malicious EFI_PARTITION_TABLE_HEADER=0D
++  structure will not cause undefined or unexpected behavior.=0D
++=0D
++  In general the TPM should still be able to measure the data, but=0D
++  be the header should be sanitized to prevent any unexpected behavior.=0D
++=0D
++  @param[in] Context  The unit test context.=0D
++=0D
++  @retval UNIT_TEST_PASSED  The test passed.=0D
++  @retval UNIT_TEST_ERROR_TEST_FAILED  The test failed.=0D
++**/=0D
++UNIT_TEST_STATUS=0D
++EFIAPI=0D
++TestSanitizeEfiPartitionTableHeader (=0D
++  IN UNIT_TEST_CONTEXT  Context=0D
++  )=0D
++{=0D
++  EFI_STATUS                  Status;=0D
++  EFI_PARTITION_TABLE_HEADER  PrimaryHeader;=0D
++  EFI_BLOCK_IO_PROTOCOL       BlockIo;=0D
++  EFI_BLOCK_IO_MEDIA          BlockMedia;=0D
++=0D
++  // Generate EFI_BLOCK_IO_MEDIA test data=0D
++  BlockMedia.MediaId          =3D 1;=0D
++  BlockMedia.RemovableMedia   =3D FALSE;=0D
++  BlockMedia.MediaPresent     =3D TRUE;=0D
++  BlockMedia.LogicalPartition =3D FALSE;=0D
++  BlockMedia.ReadOnly         =3D FALSE;=0D
++  BlockMedia.WriteCaching     =3D FALSE;=0D
++  BlockMedia.BlockSize        =3D 512;=0D
++  BlockMedia.IoAlign          =3D 1;=0D
++  BlockMedia.LastBlock        =3D 0;=0D
++=0D
++  // Generate EFI_BLOCK_IO_PROTOCOL test data=0D
++  BlockIo.Revision    =3D 1;=0D
++  BlockIo.Media       =3D &BlockMedia;=0D
++  BlockIo.Reset       =3D NULL;=0D
++  BlockIo.ReadBlocks  =3D NULL;=0D
++  BlockIo.WriteBlocks =3D NULL;=0D
++  BlockIo.FlushBlocks =3D NULL;=0D
++=0D
++  // Geneate EFI_PARTITION_TABLE_HEADER test data=0D
++  PrimaryHeader.Header.Signature         =3D EFI_PTAB_HEADER_ID;=0D
++  PrimaryHeader.Header.Revision          =3D DEFAULT_PRIMARY_TABLE_HEADER=
_REVISION;=0D
++  PrimaryHeader.Header.HeaderSize        =3D sizeof (EFI_PARTITION_TABLE_=
HEADER);=0D
++  PrimaryHeader.MyLBA                    =3D 1;=0D
++  PrimaryHeader.AlternateLBA             =3D 2;=0D
++  PrimaryHeader.FirstUsableLBA           =3D 3;=0D
++  PrimaryHeader.LastUsableLBA            =3D 4;=0D
++  PrimaryHeader.PartitionEntryLBA        =3D 5;=0D
++  PrimaryHeader.NumberOfPartitionEntries =3D DEFAULT_PRIMARY_TABLE_HEADER=
_NUMBER_OF_PARTITION_ENTRIES;=0D
++  PrimaryHeader.SizeOfPartitionEntry     =3D DEFAULT_PRIMARY_TABLE_HEADER=
_SIZE_OF_PARTITION_ENTRY;=0D
++  PrimaryHeader.PartitionEntryArrayCRC32 =3D 0; // Purposely invalid=0D
++=0D
++  // Calculate the CRC32 of the PrimaryHeader=0D
++  PrimaryHeader.Header.CRC32 =3D CalculateCrc32 ((UINT8 *)&PrimaryHeader,=
 PrimaryHeader.Header.HeaderSize);=0D
++=0D
++  // Test that a normal PrimaryHeader passes validation=0D
++  Status =3D SanitizeEfiPartitionTableHeader (&PrimaryHeader, &BlockIo);=
=0D
++  UT_ASSERT_NOT_EFI_ERROR (Status);=0D
++=0D
++  // Test that when number of partition entries is 0, the function return=
s EFI_DEVICE_ERROR=0D
++  // Should print "Invalid Partition Table Header NumberOfPartitionEntrie=
s!""=0D
++  PrimaryHeader.NumberOfPartitionEntries =3D 0;=0D
++  Status                                 =3D SanitizeEfiPartitionTableHea=
der (&PrimaryHeader, &BlockIo);=0D
++  UT_ASSERT_EQUAL (Status, EFI_DEVICE_ERROR);=0D
++  PrimaryHeader.NumberOfPartitionEntries =3D DEFAULT_PRIMARY_TABLE_HEADER=
_SIZE_OF_PARTITION_ENTRY;=0D
++=0D
++  // Test that when the header size is too small, the function returns EF=
I_DEVICE_ERROR=0D
++  // Should print "Invalid Partition Table Header Size!"=0D
++  PrimaryHeader.Header.HeaderSize =3D 0;=0D
++  Status                          =3D SanitizeEfiPartitionTableHeader (&P=
rimaryHeader, &BlockIo);=0D
++  UT_ASSERT_EQUAL (Status, EFI_DEVICE_ERROR);=0D
++  PrimaryHeader.Header.HeaderSize =3D sizeof (EFI_PARTITION_TABLE_HEADER)=
;=0D
++=0D
++  // Test that when the SizeOfPartitionEntry is too small, the function r=
eturns EFI_DEVICE_ERROR=0D
++  // should print: "SizeOfPartitionEntry shall be set to a value of 128 x=
 2^n where n is an integer greater than or equal to zero (e.g., 128, 256, 5=
12, etc.)!"=0D
++  PrimaryHeader.SizeOfPartitionEntry =3D 1;=0D
++  Status                             =3D SanitizeEfiPartitionTableHeader =
(&PrimaryHeader, &BlockIo);=0D
++  UT_ASSERT_EQUAL (Status, EFI_DEVICE_ERROR);=0D
++=0D
++  DEBUG ((DEBUG_INFO, "%a: Test passed\n", __func__));=0D
++=0D
++  return UNIT_TEST_PASSED;=0D
++}=0D
++=0D
++/**=0D
++  This function tests the SanitizePrimaryHeaderAllocationSize function.=0D
++  It's intent is to test that the untrusted input from a EFI_PARTITION_TA=
BLE_HEADER=0D
++  structure will not cause an overflow when calculating the allocation si=
ze.=0D
++=0D
++  @param[in] Context  The unit test context.=0D
++=0D
++  @retval UNIT_TEST_PASSED  The test passed.=0D
++  @retval UNIT_TEST_ERROR_TEST_FAILED  The test failed.=0D
++**/=0D
++UNIT_TEST_STATUS=0D
++EFIAPI=0D
++TestSanitizePrimaryHeaderAllocationSize (=0D
++  IN UNIT_TEST_CONTEXT  Context=0D
++  )=0D
++{=0D
++  UINT32  AllocationSize;=0D
++=0D
++  EFI_STATUS                  Status;=0D
++  EFI_PARTITION_TABLE_HEADER  PrimaryHeader;=0D
++=0D
++  // Test that a normal PrimaryHeader passes validation=0D
++  PrimaryHeader.NumberOfPartitionEntries =3D 5;=0D
++  PrimaryHeader.SizeOfPartitionEntry     =3D DEFAULT_PRIMARY_TABLE_HEADER=
_SIZE_OF_PARTITION_ENTRY;=0D
++=0D
++  Status =3D SanitizePrimaryHeaderAllocationSize (&PrimaryHeader, &Alloca=
tionSize);=0D
++  UT_ASSERT_NOT_EFI_ERROR (Status);=0D
++=0D
++  // Test that the allocation size is correct compared to the existing lo=
gic=0D
++  UT_ASSERT_EQUAL (AllocationSize, PrimaryHeader.NumberOfPartitionEntries=
 * PrimaryHeader.SizeOfPartitionEntry);=0D
++=0D
++  // Test that an overflow is detected=0D
++  PrimaryHeader.NumberOfPartitionEntries =3D MAX_UINT32;=0D
++  PrimaryHeader.SizeOfPartitionEntry     =3D 5;=0D
++  Status                                 =3D SanitizePrimaryHeaderAllocat=
ionSize (&PrimaryHeader, &AllocationSize);=0D
++  UT_ASSERT_EQUAL (Status, EFI_BAD_BUFFER_SIZE);=0D
++=0D
++  // Test the inverse=0D
++  PrimaryHeader.NumberOfPartitionEntries =3D 5;=0D
++  PrimaryHeader.SizeOfPartitionEntry     =3D MAX_UINT32;=0D
++  Status                                 =3D SanitizePrimaryHeaderAllocat=
ionSize (&PrimaryHeader, &AllocationSize);=0D
++  UT_ASSERT_EQUAL (Status, EFI_BAD_BUFFER_SIZE);=0D
++=0D
++  // Test the worst case scenario=0D
++  PrimaryHeader.NumberOfPartitionEntries =3D MAX_UINT32;=0D
++  PrimaryHeader.SizeOfPartitionEntry     =3D MAX_UINT32;=0D
++  Status                                 =3D SanitizePrimaryHeaderAllocat=
ionSize (&PrimaryHeader, &AllocationSize);=0D
++  UT_ASSERT_EQUAL (Status, EFI_BAD_BUFFER_SIZE);=0D
++=0D
++  DEBUG ((DEBUG_INFO, "%a: Test passed\n", __func__));=0D
++=0D
++  return UNIT_TEST_PASSED;=0D
++}=0D
++=0D
++/**=0D
++  This function tests the SanitizePrimaryHeaderGptEventSize function.=0D
++  It's intent is to test that the untrusted input from a EFI_GPT_DATA str=
ucture=0D
++  will not cause an overflow when calculating the event size.=0D
++=0D
++  @param[in] Context  The unit test context.=0D
++=0D
++  @retval UNIT_TEST_PASSED  The test passed.=0D
++  @retval UNIT_TEST_ERROR_TEST_FAILED  The test failed.=0D
++**/=0D
++UNIT_TEST_STATUS=0D
++EFIAPI=0D
++TestSanitizePrimaryHeaderGptEventSize (=0D
++  IN UNIT_TEST_CONTEXT  Context=0D
++  )=0D
++{=0D
++  UINT32                      EventSize;=0D
++  UINT32                      ExistingLogicEventSize;=0D
++  EFI_STATUS                  Status;=0D
++  EFI_PARTITION_TABLE_HEADER  PrimaryHeader;=0D
++  UINTN                       NumberOfPartition;=0D
++  EFI_GPT_DATA                *GptData;=0D
++  EFI_TCG2_EVENT              *Tcg2Event;=0D
++=0D
++  Tcg2Event =3D NULL;=0D
++  GptData   =3D NULL;=0D
++=0D
++  // Test that a normal PrimaryHeader passes validation=0D
++  PrimaryHeader.NumberOfPartitionEntries =3D 5;=0D
++  PrimaryHeader.SizeOfPartitionEntry     =3D DEFAULT_PRIMARY_TABLE_HEADER=
_SIZE_OF_PARTITION_ENTRY;=0D
++=0D
++  // set the number of partitions=0D
++  NumberOfPartition =3D 13;=0D
++=0D
++  // that the primary event size is correct=0D
++  Status =3D SanitizePrimaryHeaderGptEventSize (&PrimaryHeader, NumberOfP=
artition, &EventSize);=0D
++  UT_ASSERT_NOT_EFI_ERROR (Status);=0D
++=0D
++  // Calculate the existing logic event size=0D
++  ExistingLogicEventSize =3D (UINT32)(OFFSET_OF (EFI_TCG2_EVENT, Event) +=
 OFFSET_OF (EFI_GPT_DATA, Partitions)=0D
++                                    + NumberOfPartition * PrimaryHeader.S=
izeOfPartitionEntry);=0D
++=0D
++  // Check that the event size is correct=0D
++  UT_ASSERT_EQUAL (EventSize, ExistingLogicEventSize);=0D
++=0D
++  // Tests that the primary event size may not overflow=0D
++  Status =3D SanitizePrimaryHeaderGptEventSize (&PrimaryHeader, MAX_UINT3=
2, &EventSize);=0D
++  UT_ASSERT_EQUAL (Status, EFI_BAD_BUFFER_SIZE);=0D
++=0D
++  // Test that the size of partition entries may not overflow=0D
++  PrimaryHeader.SizeOfPartitionEntry =3D MAX_UINT32;=0D
++  Status                             =3D SanitizePrimaryHeaderGptEventSiz=
e (&PrimaryHeader, NumberOfPartition, &EventSize);=0D
++  UT_ASSERT_EQUAL (Status, EFI_BAD_BUFFER_SIZE);=0D
++=0D
++  DEBUG ((DEBUG_INFO, "%a: Test passed\n", __func__));=0D
++=0D
++  return UNIT_TEST_PASSED;=0D
++}=0D
++=0D
++// *--------------------------------------------------------------------*=
=0D
++// *  Unit Test Code Main Function=0D
++// *--------------------------------------------------------------------*=
=0D
++=0D
++/**=0D
++  This function acts as the entry point for the unit tests.=0D
++=0D
++  @retval UNIT_TEST_PASSED  The test passed.=0D
++  @retval UNIT_TEST_ERROR_TEST_FAILED  The test failed.=0D
++  @retval others The test failed.=0D
++**/=0D
++EFI_STATUS=0D
++EFIAPI=0D
++UefiTestMain (=0D
++  VOID=0D
++  )=0D
++{=0D
++  EFI_STATUS                  Status;=0D
++  UNIT_TEST_FRAMEWORK_HANDLE  Framework;=0D
++  UNIT_TEST_SUITE_HANDLE      Tcg2MeasureBootLibValidationTestSuite;=0D
++=0D
++  Framework =3D NULL;=0D
++=0D
++  DEBUG ((DEBUG_INFO, "%a: TestMain() - Start\n", UNIT_TEST_NAME));=0D
++=0D
++  Status =3D InitUnitTestFramework (&Framework, UNIT_TEST_NAME, gEfiCalle=
rBaseName, UNIT_TEST_VERSION);=0D
++  if (EFI_ERROR (Status)) {=0D
++    DEBUG ((DEBUG_ERROR, "%a: Failed in InitUnitTestFramework. Status =3D=
 %r\n", UNIT_TEST_NAME, Status));=0D
++    goto EXIT;=0D
++  }=0D
++=0D
++  Status =3D CreateUnitTestSuite (&Tcg2MeasureBootLibValidationTestSuite,=
 Framework, "Tcg2MeasureBootLibValidationTestSuite", "Common.Tcg2MeasureBoo=
tLibValidation", NULL, NULL);=0D
++  if (EFI_ERROR (Status)) {=0D
++    DEBUG ((DEBUG_ERROR, "%s: Failed in CreateUnitTestSuite for Tcg2Measu=
reBootLibValidationTestSuite\n", UNIT_TEST_NAME));=0D
++    Status =3D EFI_OUT_OF_RESOURCES;=0D
++    goto EXIT;=0D
++  }=0D
++=0D
++  // -----------Suite---------------------------------Description--------=
--------------------Class----------------------------------Test Function---=
---------------------Pre---Clean-Context=0D
++  AddTestCase (Tcg2MeasureBootLibValidationTestSuite, "Tests Validating E=
FI Partition Table", "Common.Tcg2MeasureBootLibValidation", TestSanitizeEfi=
PartitionTableHeader, NULL, NULL, NULL);=0D
++  AddTestCase (Tcg2MeasureBootLibValidationTestSuite, "Tests Primary head=
er gpt event checks for overflow", "Common.Tcg2MeasureBootLibValidation", T=
estSanitizePrimaryHeaderAllocationSize, NULL, NULL, NULL);=0D
++  AddTestCase (Tcg2MeasureBootLibValidationTestSuite, "Tests Primary head=
er allocation size checks for overflow", "Common.Tcg2MeasureBootLibValidati=
on", TestSanitizePrimaryHeaderGptEventSize, NULL, NULL, NULL);=0D
++=0D
++  Status =3D RunAllTestSuites (Framework);=0D
++=0D
++EXIT:=0D
++  if (Framework !=3D NULL) {=0D
++    FreeUnitTestFramework (Framework);=0D
++  }=0D
++=0D
++  DEBUG ((DEBUG_INFO, "%a: TestMain() - End\n", UNIT_TEST_NAME));=0D
++  return Status;=0D
++}=0D
++=0D
++///=0D
++/// Avoid ECC error for function name that starts with lower case letter=
=0D
++///=0D
++#define DxeTpm2MeasureBootLibUnitTestMain  main=0D
++=0D
++/**=0D
++  Standard POSIX C entry point for host based unit test execution.=0D
++=0D
++  @param[in] Argc  Number of arguments=0D
++  @param[in] Argv  Array of pointers to arguments=0D
++=0D
++  @retval 0      Success=0D
++  @retval other  Error=0D
++**/=0D
++INT32=0D
++DxeTpm2MeasureBootLibUnitTestMain (=0D
++  IN INT32  Argc,=0D
++  IN CHAR8  *Argv[]=0D
++  )=0D
++{=0D
++  return (INT32)UefiTestMain ();=0D
++}=0D
+diff --git a/SecurityPkg/Library/DxeTpm2MeasureBootLib/InternalUnitTest/Dx=
eTpm2MeasureBootLibSanitizationTestHost.inf b/SecurityPkg/Library/DxeTpm2Me=
asureBootLib/InternalUnitTest/DxeTpm2MeasureBootLibSanitizationTestHost.inf
+new file mode 100644
+index 0000000000..2999aa2a44
+--- /dev/null
++++ b/SecurityPkg/Library/DxeTpm2MeasureBootLib/InternalUnitTest/DxeTpm2Me=
asureBootLibSanitizationTestHost.inf
+@@ -0,0 +1,28 @@
++## @file=0D
++# This file builds the unit tests for DxeTpm2MeasureBootLib=0D
++#=0D
++# Copyright (C) Microsoft Corporation.<BR>=0D
++# SPDX-License-Identifier: BSD-2-Clause-Patent=0D
++##=0D
++=0D
++[Defines]=0D
++  INF_VERSION                    =3D 0x00010006=0D
++  BASE_NAME                      =3D DxeTpm2MeasuredBootLibTest=0D
++  FILE_GUID                      =3D 144d757f-d423-484e-9309-a23695fad5bd=
=0D
++  MODULE_TYPE                    =3D HOST_APPLICATION=0D
++  VERSION_STRING                 =3D 1.0=0D
++  ENTRY_POINT                    =3D main=0D
++=0D
++[Sources]=0D
++  DxeTpm2MeasureBootLibSanitizationTest.c=0D
++  ../DxeTpm2MeasureBootLibSanitization.c=0D
++=0D
++[Packages]=0D
++  MdePkg/MdePkg.dec=0D
++=0D
++[LibraryClasses]=0D
++  BaseLib=0D
++  DebugLib=0D
++  UnitTestLib=0D
++  PrintLib=0D
++  SafeIntLib=0D
+diff --git a/SecurityPkg/SecurityPkg.ci.yaml b/SecurityPkg/SecurityPkg.ci.=
yaml
+index 7912142398..da811fdf93 100644
+--- a/SecurityPkg/SecurityPkg.ci.yaml
++++ b/SecurityPkg/SecurityPkg.ci.yaml
+@@ -15,6 +15,7 @@
+         ##     "<ErrorID>", "<KeyWord>"=0D
+         ## ]=0D
+         "ExceptionList": [=0D
++            "8001", "DxeTpm2MeasureBootLibUnitTestMain",=0D
+         ],=0D
+         ## Both file path and directory path are accepted.=0D
+         "IgnoreFiles": [=0D
+--=20
+2.40.0
+
diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2022-36763-0002.patch b/meta/r=
ecipes-core/ovmf/ovmf/CVE-2022-36763-0002.patch
new file mode 100644
index 0000000000..6c20cc305e
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/CVE-2022-36763-0002.patch
@@ -0,0 +1,889 @@
+From 4776a1b39ee08fc45c70c1eab5a0195f325000d3 Mon Sep 17 00:00:00 2001
+From: "Douglas Flick [MSFT]" <doug.edk2@gmail.com>
+Date: Fri, 12 Jan 2024 02:16:02 +0800
+Subject: [PATCH] SecurityPkg: DxeTpmMeasureBootLib: SECURITY PATCH 4117 - =
CVE=20
+ 2022-36763
+
+This commit contains the patch files and tests for DxeTpmMeasureBootLib
+CVE 2022-36763.
+
+Cc: Jiewen Yao <jiewen.yao@intel.com>
+
+Signed-off-by: Doug Flick [MSFT] <doug.edk2@gmail.com>
+Reviewed-by: Jiewen Yao <jiewen.yao@intel.com>
+
+CVE: CVE-2022-36763
+
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/4776a1=
b39ee08fc45c70c1eab5a0195f325000d3]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ .../DxeTpmMeasureBootLib.c                    |  40 ++-
+ .../DxeTpmMeasureBootLib.inf                  |   4 +-
+ .../DxeTpmMeasureBootLibSanitization.c        | 241 ++++++++++++++
+ .../DxeTpmMeasureBootLibSanitization.h        | 114 +++++++
+ .../DxeTpmMeasureBootLibSanitizationTest.c    | 301 ++++++++++++++++++
+ ...eTpmMeasureBootLibSanitizationTestHost.inf |  28 ++
+ SecurityPkg/SecurityPkg.ci.yaml               |   1 +
+ 7 files changed, 715 insertions(+), 14 deletions(-)
+ create mode 100644 SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasure=
BootLibSanitization.c
+ create mode 100644 SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasure=
BootLibSanitization.h
+ create mode 100644 SecurityPkg/Library/DxeTpmMeasureBootLib/InternalUnitT=
est/DxeTpmMeasureBootLibSanitizationTest.c
+ create mode 100644 SecurityPkg/Library/DxeTpmMeasureBootLib/InternalUnitT=
est/DxeTpmMeasureBootLibSanitizationTestHost.inf
+
+diff --git a/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootLib=
.c b/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootLib.c
+index 220393dd2b..669ab19134 100644
+--- a/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootLib.c
++++ b/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootLib.c
+@@ -18,6 +18,8 @@
+ Copyright (c) 2009 - 2018, Intel Corporation. All rights reserved.<BR>=0D
+ SPDX-License-Identifier: BSD-2-Clause-Patent=0D
+ =0D
++Copyright (c) Microsoft Corporation.<BR>=0D
++SPDX-License-Identifier: BSD-2-Clause-Patent=0D
+ **/=0D
+ =0D
+ #include <PiDxe.h>=0D
+@@ -40,6 +42,8 @@ SPDX-License-Identifier: BSD-2-Clause-Patent
+ #include <Library/SecurityManagementLib.h>=0D
+ #include <Library/HobLib.h>=0D
+ =0D
++#include "DxeTpmMeasureBootLibSanitization.h"=0D
++=0D
+ //=0D
+ // Flag to check GPT partition. It only need be measured once.=0D
+ //=0D
+@@ -136,6 +140,9 @@ TcgMeasureGptTable (
+   UINT32                      EventSize;=0D
+   UINT32                      EventNumber;=0D
+   EFI_PHYSICAL_ADDRESS        EventLogLastEntry;=0D
++  UINT32                      AllocSize;=0D
++=0D
++  GptData =3D NULL;=0D
+ =0D
+   if (mMeasureGptCount > 0) {=0D
+     return EFI_SUCCESS;=0D
+@@ -166,8 +173,8 @@ TcgMeasureGptTable (
+                      BlockIo->Media->BlockSize,=0D
+                      (UINT8 *)PrimaryHeader=0D
+                      );=0D
+-  if (EFI_ERROR (Status)) {=0D
+-    DEBUG ((DEBUG_ERROR, "Failed to Read Partition Table Header!\n"));=0D
++  if (EFI_ERROR (Status) || EFI_ERROR (SanitizeEfiPartitionTableHeader (P=
rimaryHeader, BlockIo))) {=0D
++    DEBUG ((DEBUG_ERROR, "Failed to read Partition Table Header or invali=
d Partition Table Header!\n"));=0D
+     FreePool (PrimaryHeader);=0D
+     return EFI_DEVICE_ERROR;=0D
+   }=0D
+@@ -175,7 +182,13 @@ TcgMeasureGptTable (
+   //=0D
+   // Read the partition entry.=0D
+   //=0D
+-  EntryPtr =3D (UINT8 *)AllocatePool (PrimaryHeader->NumberOfPartitionEnt=
ries * PrimaryHeader->SizeOfPartitionEntry);=0D
++  Status =3D SanitizePrimaryHeaderAllocationSize (PrimaryHeader, &AllocSi=
ze);=0D
++  if (EFI_ERROR (Status)) {=0D
++    FreePool (PrimaryHeader);=0D
++    return EFI_DEVICE_ERROR;=0D
++  }=0D
++=0D
++  EntryPtr =3D (UINT8 *)AllocatePool (AllocSize);=0D
+   if (EntryPtr =3D=3D NULL) {=0D
+     FreePool (PrimaryHeader);=0D
+     return EFI_OUT_OF_RESOURCES;=0D
+@@ -185,7 +198,7 @@ TcgMeasureGptTable (
+                      DiskIo,=0D
+                      BlockIo->Media->MediaId,=0D
+                      MultU64x32 (PrimaryHeader->PartitionEntryLBA, BlockI=
o->Media->BlockSize),=0D
+-                     PrimaryHeader->NumberOfPartitionEntries * PrimaryHea=
der->SizeOfPartitionEntry,=0D
++                     AllocSize,=0D
+                      EntryPtr=0D
+                      );=0D
+   if (EFI_ERROR (Status)) {=0D
+@@ -210,9 +223,8 @@ TcgMeasureGptTable (
+   //=0D
+   // Prepare Data for Measurement=0D
+   //=0D
+-  EventSize =3D (UINT32)(sizeof (EFI_GPT_DATA) - sizeof (GptData->Partiti=
ons)=0D
+-                       + NumberOfPartition * PrimaryHeader->SizeOfPartiti=
onEntry);=0D
+-  TcgEvent =3D (TCG_PCR_EVENT *)AllocateZeroPool (EventSize + sizeof (TCG=
_PCR_EVENT_HDR));=0D
++  Status   =3D SanitizePrimaryHeaderGptEventSize (PrimaryHeader, NumberOf=
Partition, &EventSize);=0D
++  TcgEvent =3D (TCG_PCR_EVENT *)AllocateZeroPool (EventSize);=0D
+   if (TcgEvent =3D=3D NULL) {=0D
+     FreePool (PrimaryHeader);=0D
+     FreePool (EntryPtr);=0D
+@@ -221,7 +233,7 @@ TcgMeasureGptTable (
+ =0D
+   TcgEvent->PCRIndex  =3D 5;=0D
+   TcgEvent->EventType =3D EV_EFI_GPT_EVENT;=0D
+-  TcgEvent->EventSize =3D EventSize;=0D
++  TcgEvent->EventSize =3D EventSize - sizeof (TCG_PCR_EVENT_HDR);=0D
+   GptData             =3D (EFI_GPT_DATA *)TcgEvent->Event;=0D
+ =0D
+   //=0D
+@@ -361,11 +373,13 @@ TcgMeasurePeImage (
+       TcgEvent->PCRIndex  =3D 2;=0D
+       break;=0D
+     default:=0D
+-      DEBUG ((=0D
+-        DEBUG_ERROR,=0D
+-        "TcgMeasurePeImage: Unknown subsystem type %d",=0D
+-        ImageType=0D
+-        ));=0D
++      DEBUG (=0D
++        (=0D
++         DEBUG_ERROR,=0D
++         "TcgMeasurePeImage: Unknown subsystem type %d",=0D
++         ImageType=0D
++        )=0D
++        );=0D
+       goto Finish;=0D
+   }=0D
+ =0D
+diff --git a/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootLib=
.inf b/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootLib.inf
+index ebab6f7c1e..414c654d15 100644
+--- a/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootLib.inf
++++ b/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootLib.inf
+@@ -32,6 +32,8 @@
+ =0D
+ [Sources]=0D
+   DxeTpmMeasureBootLib.c=0D
++  DxeTpmMeasureBootLibSanitization.c=0D
++  DxeTpmMeasureBootLibSanitization.h=0D
+ =0D
+ [Packages]=0D
+   MdePkg/MdePkg.dec=0D
+@@ -41,6 +43,7 @@
+ =0D
+ [LibraryClasses]=0D
+   BaseMemoryLib=0D
++  SafeIntLib=0D
+   DebugLib=0D
+   MemoryAllocationLib=0D
+   DevicePathLib=0D
+@@ -59,4 +62,3 @@
+   gEfiFirmwareVolumeBlockProtocolGuid   ## SOMETIMES_CONSUMES=0D
+   gEfiBlockIoProtocolGuid               ## SOMETIMES_CONSUMES=0D
+   gEfiDiskIoProtocolGuid                ## SOMETIMES_CONSUMES=0D
+-=0D
+diff --git a/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootLib=
Sanitization.c b/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBoot=
LibSanitization.c
+new file mode 100644
+index 0000000000..a3fa46f5e6
+--- /dev/null
++++ b/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootLibSanitiz=
ation.c
+@@ -0,0 +1,241 @@
++/** @file=0D
++  The library instance provides security service of TPM2 measure boot and=
=0D
++  Confidential Computing (CC) measure boot.=0D
++=0D
++  Caution: This file requires additional review when modified.=0D
++  This library will have external input - PE/COFF image and GPT partition=
.=0D
++  This external input must be validated carefully to avoid security issue=
 like=0D
++  buffer overflow, integer overflow.=0D
++=0D
++  This file will pull out the validation logic from the following functio=
ns, in an=0D
++  attempt to validate the untrusted input in the form of unit tests=0D
++=0D
++  These are those functions:=0D
++=0D
++  DxeTpmMeasureBootLibImageRead() function will make sure the PE/COFF ima=
ge content=0D
++  read is within the image buffer.=0D
++=0D
++  Tcg2MeasureGptTable() function will receive untrusted GPT partition tab=
le, and parse=0D
++  partition data carefully.=0D
++=0D
++  Copyright (c) Microsoft Corporation.<BR>=0D
++  SPDX-License-Identifier: BSD-2-Clause-Patent=0D
++**/=0D
++#include <Uefi.h>=0D
++#include <Uefi/UefiSpec.h>=0D
++#include <Library/SafeIntLib.h>=0D
++#include <Library/UefiLib.h>=0D
++#include <Library/DebugLib.h>=0D
++#include <Library/BaseLib.h>=0D
++#include <IndustryStandard/UefiTcgPlatform.h>=0D
++#include <Protocol/BlockIo.h>=0D
++#include <Library/MemoryAllocationLib.h>=0D
++=0D
++#include "DxeTpmMeasureBootLibSanitization.h"=0D
++=0D
++#define GPT_HEADER_REVISION_V1  0x00010000=0D
++=0D
++/**=0D
++  This function will validate the EFI_PARTITION_TABLE_HEADER structure is=
 safe to parse=0D
++  However this function will not attempt to verify the validity of the GP=
T partition=0D
++  It will check the following:=0D
++    - Signature=0D
++    - Revision=0D
++    - AlternateLBA=0D
++    - FirstUsableLBA=0D
++    - LastUsableLBA=0D
++    - PartitionEntryLBA=0D
++    - NumberOfPartitionEntries=0D
++    - SizeOfPartitionEntry=0D
++    - BlockIo=0D
++=0D
++  @param[in] PrimaryHeader=0D
++    Pointer to the EFI_PARTITION_TABLE_HEADER structure.=0D
++=0D
++  @param[in] BlockIo=0D
++    Pointer to the EFI_BLOCK_IO_PROTOCOL structure.=0D
++=0D
++  @retval EFI_SUCCESS=0D
++    The EFI_PARTITION_TABLE_HEADER structure is valid.=0D
++=0D
++  @retval EFI_INVALID_PARAMETER=0D
++    The EFI_PARTITION_TABLE_HEADER structure is invalid.=0D
++**/=0D
++EFI_STATUS=0D
++EFIAPI=0D
++SanitizeEfiPartitionTableHeader (=0D
++  IN CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,=0D
++  IN CONST EFI_BLOCK_IO_PROTOCOL       *BlockIo=0D
++  )=0D
++{=0D
++  // Verify that the input parameters are safe to use=0D
++  if (PrimaryHeader =3D=3D NULL) {=0D
++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header!\n"));=0D
++    return EFI_INVALID_PARAMETER;=0D
++  }=0D
++=0D
++  if ((BlockIo =3D=3D NULL) || (BlockIo->Media =3D=3D NULL)) {=0D
++    DEBUG ((DEBUG_ERROR, "Invalid BlockIo!\n"));=0D
++    return EFI_INVALID_PARAMETER;=0D
++  }=0D
++=0D
++  // The signature must be EFI_PTAB_HEADER_ID ("EFI PART" in ASCII)=0D
++  if (PrimaryHeader->Header.Signature !=3D EFI_PTAB_HEADER_ID) {=0D
++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header!\n"));=0D
++    return EFI_DEVICE_ERROR;=0D
++  }=0D
++=0D
++  // The version must be GPT_HEADER_REVISION_V1 (0x00010000)=0D
++  if (PrimaryHeader->Header.Revision !=3D GPT_HEADER_REVISION_V1) {=0D
++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header Revision!\n"));=
=0D
++    return EFI_DEVICE_ERROR;=0D
++  }=0D
++=0D
++  // The HeaderSize must be greater than or equal to 92 and must be less =
than or equal to the logical block size=0D
++  if ((PrimaryHeader->Header.HeaderSize < sizeof (EFI_PARTITION_TABLE_HEA=
DER)) || (PrimaryHeader->Header.HeaderSize > BlockIo->Media->BlockSize)) {=
=0D
++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header HeaderSize!\n"))=
;=0D
++    return EFI_DEVICE_ERROR;=0D
++  }=0D
++=0D
++  // check that the PartitionEntryLBA greater than the Max LBA=0D
++  // This will be used later for multiplication=0D
++  if (PrimaryHeader->PartitionEntryLBA > DivU64x32 (MAX_UINT64, BlockIo->=
Media->BlockSize)) {=0D
++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header PartitionEntryLB=
A!\n"));=0D
++    return EFI_DEVICE_ERROR;=0D
++  }=0D
++=0D
++  // Check that the number of partition entries is greater than zero=0D
++  if (PrimaryHeader->NumberOfPartitionEntries =3D=3D 0) {=0D
++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header NumberOfPartitio=
nEntries!\n"));=0D
++    return EFI_DEVICE_ERROR;=0D
++  }=0D
++=0D
++  // SizeOfPartitionEntry must be 128, 256, 512... improper size may lead=
 to accessing uninitialized memory=0D
++  if ((PrimaryHeader->SizeOfPartitionEntry < 128) || ((PrimaryHeader->Siz=
eOfPartitionEntry & (PrimaryHeader->SizeOfPartitionEntry - 1)) !=3D 0)) {=0D
++    DEBUG ((DEBUG_ERROR, "SizeOfPartitionEntry shall be set to a value of=
 128 x 2^n where n is an integer greater than or equal to zero (e.g., 128, =
256, 512, etc.)!\n"));=0D
++    return EFI_DEVICE_ERROR;=0D
++  }=0D
++=0D
++  // This check is to prevent overflow when calculating the allocation si=
ze for the partition entries=0D
++  // This check will be used later for multiplication=0D
++  if (PrimaryHeader->NumberOfPartitionEntries > DivU64x32 (MAX_UINT64, Pr=
imaryHeader->SizeOfPartitionEntry)) {=0D
++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header NumberOfPartitio=
nEntries!\n"));=0D
++    return EFI_DEVICE_ERROR;=0D
++  }=0D
++=0D
++  return EFI_SUCCESS;=0D
++}=0D
++=0D
++/**=0D
++  This function will validate that the allocation size from the primary h=
eader is sane=0D
++  It will check the following:=0D
++    - AllocationSize does not overflow=0D
++=0D
++  @param[in] PrimaryHeader=0D
++    Pointer to the EFI_PARTITION_TABLE_HEADER structure.=0D
++=0D
++  @param[out] AllocationSize=0D
++    Pointer to the allocation size.=0D
++=0D
++  @retval EFI_SUCCESS=0D
++    The allocation size is valid.=0D
++=0D
++  @retval EFI_OUT_OF_RESOURCES=0D
++    The allocation size is invalid.=0D
++**/=0D
++EFI_STATUS=0D
++EFIAPI=0D
++SanitizePrimaryHeaderAllocationSize (=0D
++  IN CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,=0D
++  OUT UINT32                           *AllocationSize=0D
++  )=0D
++{=0D
++  EFI_STATUS  Status;=0D
++=0D
++  if (PrimaryHeader =3D=3D NULL) {=0D
++    return EFI_INVALID_PARAMETER;=0D
++  }=0D
++=0D
++  if (AllocationSize =3D=3D NULL) {=0D
++    return EFI_INVALID_PARAMETER;=0D
++  }=0D
++=0D
++  // Replacing logic:=0D
++  // PrimaryHeader->NumberOfPartitionEntries * PrimaryHeader->SizeOfParti=
tionEntry;=0D
++  Status =3D SafeUint32Mult (PrimaryHeader->NumberOfPartitionEntries, Pri=
maryHeader->SizeOfPartitionEntry, AllocationSize);=0D
++  if (EFI_ERROR (Status)) {=0D
++    DEBUG ((DEBUG_ERROR, "Allocation Size would have overflowed!\n"));=0D
++    return EFI_BAD_BUFFER_SIZE;=0D
++  }=0D
++=0D
++  return EFI_SUCCESS;=0D
++}=0D
++=0D
++/**=0D
++  This function will validate that the Gpt Event Size calculated from the=
 primary header is sane=0D
++  It will check the following:=0D
++    - EventSize does not overflow=0D
++=0D
++  Important: This function includes the entire length of the allocated sp=
ace, including the=0D
++  TCG_PCR_EVENT_HDR. When hashing the buffer allocated with this size, th=
e caller must subtract=0D
++  the size of the TCG_PCR_EVENT_HDR from the size of the buffer before ha=
shing.=0D
++=0D
++  @param[in] PrimaryHeader - Pointer to the EFI_PARTITION_TABLE_HEADER st=
ructure.=0D
++  @param[in] NumberOfPartition - Number of partitions.=0D
++  @param[out] EventSize - Pointer to the event size.=0D
++=0D
++  @retval EFI_SUCCESS=0D
++    The event size is valid.=0D
++=0D
++  @retval EFI_OUT_OF_RESOURCES=0D
++    Overflow would have occurred.=0D
++=0D
++  @retval EFI_INVALID_PARAMETER=0D
++    One of the passed parameters was invalid.=0D
++**/=0D
++EFI_STATUS=0D
++SanitizePrimaryHeaderGptEventSize (=0D
++  IN  CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,=0D
++  IN  UINTN                             NumberOfPartition,=0D
++  OUT UINT32                            *EventSize=0D
++  )=0D
++{=0D
++  EFI_STATUS  Status;=0D
++  UINT32      SafeNumberOfPartitions;=0D
++=0D
++  if (PrimaryHeader =3D=3D NULL) {=0D
++    return EFI_INVALID_PARAMETER;=0D
++  }=0D
++=0D
++  if (EventSize =3D=3D NULL) {=0D
++    return EFI_INVALID_PARAMETER;=0D
++  }=0D
++=0D
++  // We shouldn't even attempt to perform the multiplication if the numbe=
r of partitions is greater than the maximum value of UINT32=0D
++  Status =3D SafeUintnToUint32 (NumberOfPartition, &SafeNumberOfPartition=
s);=0D
++  if (EFI_ERROR (Status)) {=0D
++    DEBUG ((DEBUG_ERROR, "NumberOfPartition would have overflowed!\n"));=
=0D
++    return EFI_INVALID_PARAMETER;=0D
++  }=0D
++=0D
++  // Replacing logic:=0D
++  // (UINT32)(sizeof (EFI_GPT_DATA) - sizeof (GptData->Partitions) + Numb=
erOfPartition * PrimaryHeader.SizeOfPartitionEntry + sizeof (TCG_PCR_EVENT_=
HDR));=0D
++  Status =3D SafeUint32Mult (SafeNumberOfPartitions, PrimaryHeader->SizeO=
fPartitionEntry, EventSize);=0D
++  if (EFI_ERROR (Status)) {=0D
++    DEBUG ((DEBUG_ERROR, "Event Size would have overflowed!\n"));=0D
++    return EFI_BAD_BUFFER_SIZE;=0D
++  }=0D
++=0D
++  Status =3D SafeUint32Add (=0D
++             sizeof (TCG_PCR_EVENT_HDR) +=0D
++             OFFSET_OF (EFI_GPT_DATA, Partitions),=0D
++             *EventSize,=0D
++             EventSize=0D
++             );=0D
++  if (EFI_ERROR (Status)) {=0D
++    DEBUG ((DEBUG_ERROR, "Event Size would have overflowed because of GPT=
Data!\n"));=0D
++    return EFI_BAD_BUFFER_SIZE;=0D
++  }=0D
++=0D
++  return EFI_SUCCESS;=0D
++}=0D
+diff --git a/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootLib=
Sanitization.h b/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBoot=
LibSanitization.h
+new file mode 100644
+index 0000000000..0d9d00c281
+--- /dev/null
++++ b/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootLibSanitiz=
ation.h
+@@ -0,0 +1,114 @@
++/** @file=0D
++  This file includes the function prototypes for the sanitization functio=
ns.=0D
++=0D
++  These are those functions:=0D
++=0D
++  DxeTpmMeasureBootLibImageRead() function will make sure the PE/COFF ima=
ge content=0D
++  read is within the image buffer.=0D
++=0D
++  TcgMeasurePeImage() function will accept untrusted PE/COFF image and va=
lidate its=0D
++  data structure within this image buffer before use.=0D
++=0D
++  TcgMeasureGptTable() function will receive untrusted GPT partition tabl=
e, and parse=0D
++  partition data carefully.=0D
++=0D
++  Copyright (c) Microsoft Corporation.<BR>=0D
++  SPDX-License-Identifier: BSD-2-Clause-Patent=0D
++=0D
++**/=0D
++=0D
++#ifndef DXE_TPM_MEASURE_BOOT_LIB_VALIDATION_=0D
++#define DXE_TPM_MEASURE_BOOT_LIB_VALIDATION_=0D
++=0D
++#include <Uefi.h>=0D
++#include <Uefi/UefiSpec.h>=0D
++#include <Protocol/BlockIo.h>=0D
++#include <IndustryStandard/UefiTcgPlatform.h>=0D
++=0D
++/**=0D
++  This function will validate the EFI_PARTITION_TABLE_HEADER structure is=
 safe to parse=0D
++  However this function will not attempt to verify the validity of the GP=
T partition=0D
++  It will check the following:=0D
++    - Signature=0D
++    - Revision=0D
++    - AlternateLBA=0D
++    - FirstUsableLBA=0D
++    - LastUsableLBA=0D
++    - PartitionEntryLBA=0D
++    - NumberOfPartitionEntries=0D
++    - SizeOfPartitionEntry=0D
++    - BlockIo=0D
++=0D
++  @param[in] PrimaryHeader=0D
++    Pointer to the EFI_PARTITION_TABLE_HEADER structure.=0D
++=0D
++  @param[in] BlockIo=0D
++    Pointer to the EFI_BLOCK_IO_PROTOCOL structure.=0D
++=0D
++  @retval EFI_SUCCESS=0D
++    The EFI_PARTITION_TABLE_HEADER structure is valid.=0D
++=0D
++  @retval EFI_INVALID_PARAMETER=0D
++    The EFI_PARTITION_TABLE_HEADER structure is invalid.=0D
++**/=0D
++EFI_STATUS=0D
++EFIAPI=0D
++SanitizeEfiPartitionTableHeader (=0D
++  IN CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,=0D
++  IN CONST EFI_BLOCK_IO_PROTOCOL       *BlockIo=0D
++  );=0D
++=0D
++/**=0D
++  This function will validate that the allocation size from the primary h=
eader is sane=0D
++  It will check the following:=0D
++    - AllocationSize does not overflow=0D
++=0D
++  @param[in] PrimaryHeader=0D
++    Pointer to the EFI_PARTITION_TABLE_HEADER structure.=0D
++=0D
++  @param[out] AllocationSize=0D
++    Pointer to the allocation size.=0D
++=0D
++  @retval EFI_SUCCESS=0D
++    The allocation size is valid.=0D
++=0D
++  @retval EFI_OUT_OF_RESOURCES=0D
++    The allocation size is invalid.=0D
++**/=0D
++EFI_STATUS=0D
++EFIAPI=0D
++SanitizePrimaryHeaderAllocationSize (=0D
++  IN CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,=0D
++  OUT UINT32                           *AllocationSize=0D
++  );=0D
++=0D
++/**=0D
++  This function will validate that the Gpt Event Size calculated from the=
 primary header is sane=0D
++  It will check the following:=0D
++    - EventSize does not overflow=0D
++=0D
++  Important: This function includes the entire length of the allocated sp=
ace, including the=0D
++  TCG_PCR_EVENT_HDR. When hashing the buffer allocated with this size, th=
e caller must subtract=0D
++  the size of the TCG_PCR_EVENT_HDR from the size of the buffer before ha=
shing.=0D
++=0D
++  @param[in] PrimaryHeader - Pointer to the EFI_PARTITION_TABLE_HEADER st=
ructure.=0D
++  @param[in] NumberOfPartition - Number of partitions.=0D
++  @param[out] EventSize - Pointer to the event size.=0D
++=0D
++  @retval EFI_SUCCESS=0D
++    The event size is valid.=0D
++=0D
++  @retval EFI_OUT_OF_RESOURCES=0D
++    Overflow would have occurred.=0D
++=0D
++  @retval EFI_INVALID_PARAMETER=0D
++    One of the passed parameters was invalid.=0D
++**/=0D
++EFI_STATUS=0D
++SanitizePrimaryHeaderGptEventSize (=0D
++  IN  CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,=0D
++  IN  UINTN                             NumberOfPartition,=0D
++  OUT UINT32                            *EventSize=0D
++  );=0D
++=0D
++#endif // DXE_TPM_MEASURE_BOOT_LIB_VALIDATION_=0D
+diff --git a/SecurityPkg/Library/DxeTpmMeasureBootLib/InternalUnitTest/Dxe=
TpmMeasureBootLibSanitizationTest.c b/SecurityPkg/Library/DxeTpmMeasureBoot=
Lib/InternalUnitTest/DxeTpmMeasureBootLibSanitizationTest.c
+new file mode 100644
+index 0000000000..eeb928cdb0
+--- /dev/null
++++ b/SecurityPkg/Library/DxeTpmMeasureBootLib/InternalUnitTest/DxeTpmMeas=
ureBootLibSanitizationTest.c
+@@ -0,0 +1,301 @@
++/** @file=0D
++This file includes the unit test cases for the DxeTpmMeasureBootLibSaniti=
zationTest.c.=0D
++=0D
++Copyright (c) Microsoft Corporation.<BR>=0D
++SPDX-License-Identifier: BSD-2-Clause-Patent=0D
++**/=0D
++=0D
++#include <Uefi.h>=0D
++#include <Library/UefiLib.h>=0D
++#include <Library/DebugLib.h>=0D
++#include <Library/UnitTestLib.h>=0D
++#include <Protocol/BlockIo.h>=0D
++#include <Library/MemoryAllocationLib.h>=0D
++#include <Library/BaseMemoryLib.h>=0D
++#include <IndustryStandard/UefiTcgPlatform.h>=0D
++=0D
++#include "../DxeTpmMeasureBootLibSanitization.h"=0D
++=0D
++#define UNIT_TEST_NAME     "DxeTpmMeasureBootLibSanitizationTest"=0D
++#define UNIT_TEST_VERSION  "1.0"=0D
++=0D
++#define DEFAULT_PRIMARY_TABLE_HEADER_REVISION                     0x00010=
000=0D
++#define DEFAULT_PRIMARY_TABLE_HEADER_NUMBER_OF_PARTITION_ENTRIES  1=0D
++#define DEFAULT_PRIMARY_TABLE_HEADER_SIZE_OF_PARTITION_ENTRY      128=0D
++=0D
++/**=0D
++  This function tests the SanitizeEfiPartitionTableHeader function.=0D
++  It's intent is to test that a malicious EFI_PARTITION_TABLE_HEADER=0D
++  structure will not cause undefined or unexpected behavior.=0D
++=0D
++  In general the TPM should still be able to measure the data, but=0D
++  be the header should be sanitized to prevent any unexpected behavior.=0D
++=0D
++  @param[in] Context  The unit test context.=0D
++=0D
++  @retval UNIT_TEST_PASSED  The test passed.=0D
++  @retval UNIT_TEST_ERROR_TEST_FAILED  The test failed.=0D
++**/=0D
++UNIT_TEST_STATUS=0D
++EFIAPI=0D
++TestSanitizeEfiPartitionTableHeader (=0D
++  IN UNIT_TEST_CONTEXT  Context=0D
++  )=0D
++{=0D
++  EFI_STATUS                  Status;=0D
++  EFI_PARTITION_TABLE_HEADER  PrimaryHeader;=0D
++  EFI_BLOCK_IO_PROTOCOL       BlockIo;=0D
++  EFI_BLOCK_IO_MEDIA          BlockMedia;=0D
++=0D
++  // Generate EFI_BLOCK_IO_MEDIA test data=0D
++  BlockMedia.MediaId          =3D 1;=0D
++  BlockMedia.RemovableMedia   =3D FALSE;=0D
++  BlockMedia.MediaPresent     =3D TRUE;=0D
++  BlockMedia.LogicalPartition =3D FALSE;=0D
++  BlockMedia.ReadOnly         =3D FALSE;=0D
++  BlockMedia.WriteCaching     =3D FALSE;=0D
++  BlockMedia.BlockSize        =3D 512;=0D
++  BlockMedia.IoAlign          =3D 1;=0D
++  BlockMedia.LastBlock        =3D 0;=0D
++=0D
++  // Generate EFI_BLOCK_IO_PROTOCOL test data=0D
++  BlockIo.Revision    =3D 1;=0D
++  BlockIo.Media       =3D &BlockMedia;=0D
++  BlockIo.Reset       =3D NULL;=0D
++  BlockIo.ReadBlocks  =3D NULL;=0D
++  BlockIo.WriteBlocks =3D NULL;=0D
++  BlockIo.FlushBlocks =3D NULL;=0D
++=0D
++  // Geneate EFI_PARTITION_TABLE_HEADER test data=0D
++  PrimaryHeader.Header.Signature         =3D EFI_PTAB_HEADER_ID;=0D
++  PrimaryHeader.Header.Revision          =3D DEFAULT_PRIMARY_TABLE_HEADER=
_REVISION;=0D
++  PrimaryHeader.Header.HeaderSize        =3D sizeof (EFI_PARTITION_TABLE_=
HEADER);=0D
++  PrimaryHeader.MyLBA                    =3D 1;=0D
++  PrimaryHeader.AlternateLBA             =3D 2;=0D
++  PrimaryHeader.FirstUsableLBA           =3D 3;=0D
++  PrimaryHeader.LastUsableLBA            =3D 4;=0D
++  PrimaryHeader.PartitionEntryLBA        =3D 5;=0D
++  PrimaryHeader.NumberOfPartitionEntries =3D DEFAULT_PRIMARY_TABLE_HEADER=
_NUMBER_OF_PARTITION_ENTRIES;=0D
++  PrimaryHeader.SizeOfPartitionEntry     =3D DEFAULT_PRIMARY_TABLE_HEADER=
_SIZE_OF_PARTITION_ENTRY;=0D
++  PrimaryHeader.PartitionEntryArrayCRC32 =3D 0; // Purposely invalid=0D
++=0D
++  // Calculate the CRC32 of the PrimaryHeader=0D
++  PrimaryHeader.Header.CRC32 =3D CalculateCrc32 ((UINT8 *)&PrimaryHeader,=
 PrimaryHeader.Header.HeaderSize);=0D
++=0D
++  // Test that a normal PrimaryHeader passes validation=0D
++  Status =3D SanitizeEfiPartitionTableHeader (&PrimaryHeader, &BlockIo);=
=0D
++  UT_ASSERT_NOT_EFI_ERROR (Status);=0D
++=0D
++  // Test that when number of partition entries is 0, the function return=
s EFI_DEVICE_ERROR=0D
++  // Should print "Invalid Partition Table Header NumberOfPartitionEntrie=
s!""=0D
++  PrimaryHeader.NumberOfPartitionEntries =3D 0;=0D
++  Status                                 =3D SanitizeEfiPartitionTableHea=
der (&PrimaryHeader, &BlockIo);=0D
++  UT_ASSERT_EQUAL (Status, EFI_DEVICE_ERROR);=0D
++  PrimaryHeader.NumberOfPartitionEntries =3D DEFAULT_PRIMARY_TABLE_HEADER=
_SIZE_OF_PARTITION_ENTRY;=0D
++=0D
++  // Test that when the header size is too small, the function returns EF=
I_DEVICE_ERROR=0D
++  // Should print "Invalid Partition Table Header Size!"=0D
++  PrimaryHeader.Header.HeaderSize =3D 0;=0D
++  Status                          =3D SanitizeEfiPartitionTableHeader (&P=
rimaryHeader, &BlockIo);=0D
++  UT_ASSERT_EQUAL (Status, EFI_DEVICE_ERROR);=0D
++  PrimaryHeader.Header.HeaderSize =3D sizeof (EFI_PARTITION_TABLE_HEADER)=
;=0D
++=0D
++  // Test that when the SizeOfPartitionEntry is too small, the function r=
eturns EFI_DEVICE_ERROR=0D
++  // should print: "SizeOfPartitionEntry shall be set to a value of 128 x=
 2^n where n is an integer greater than or equal to zero (e.g., 128, 256, 5=
12, etc.)!"=0D
++  PrimaryHeader.SizeOfPartitionEntry =3D 1;=0D
++  Status                             =3D SanitizeEfiPartitionTableHeader =
(&PrimaryHeader, &BlockIo);=0D
++  UT_ASSERT_EQUAL (Status, EFI_DEVICE_ERROR);=0D
++=0D
++  DEBUG ((DEBUG_INFO, "%a: Test passed\n", __func__));=0D
++=0D
++  return UNIT_TEST_PASSED;=0D
++}=0D
++=0D
++/**=0D
++  This function tests the SanitizePrimaryHeaderAllocationSize function.=0D
++  It's intent is to test that the untrusted input from a EFI_PARTITION_TA=
BLE_HEADER=0D
++  structure will not cause an overflow when calculating the allocation si=
ze.=0D
++=0D
++  @param[in] Context  The unit test context.=0D
++=0D
++  @retval UNIT_TEST_PASSED  The test passed.=0D
++  @retval UNIT_TEST_ERROR_TEST_FAILED  The test failed.=0D
++**/=0D
++UNIT_TEST_STATUS=0D
++EFIAPI=0D
++TestSanitizePrimaryHeaderAllocationSize (=0D
++  IN UNIT_TEST_CONTEXT  Context=0D
++  )=0D
++{=0D
++  UINT32  AllocationSize;=0D
++=0D
++  EFI_STATUS                  Status;=0D
++  EFI_PARTITION_TABLE_HEADER  PrimaryHeader;=0D
++=0D
++  // Test that a normal PrimaryHeader passes validation=0D
++  PrimaryHeader.NumberOfPartitionEntries =3D 5;=0D
++  PrimaryHeader.SizeOfPartitionEntry     =3D DEFAULT_PRIMARY_TABLE_HEADER=
_SIZE_OF_PARTITION_ENTRY;=0D
++=0D
++  Status =3D SanitizePrimaryHeaderAllocationSize (&PrimaryHeader, &Alloca=
tionSize);=0D
++  UT_ASSERT_NOT_EFI_ERROR (Status);=0D
++=0D
++  // Test that the allocation size is correct compared to the existing lo=
gic=0D
++  UT_ASSERT_EQUAL (AllocationSize, PrimaryHeader.NumberOfPartitionEntries=
 * PrimaryHeader.SizeOfPartitionEntry);=0D
++=0D
++  // Test that an overflow is detected=0D
++  PrimaryHeader.NumberOfPartitionEntries =3D MAX_UINT32;=0D
++  PrimaryHeader.SizeOfPartitionEntry     =3D 5;=0D
++  Status                                 =3D SanitizePrimaryHeaderAllocat=
ionSize (&PrimaryHeader, &AllocationSize);=0D
++  UT_ASSERT_EQUAL (Status, EFI_BAD_BUFFER_SIZE);=0D
++=0D
++  // Test the inverse=0D
++  PrimaryHeader.NumberOfPartitionEntries =3D 5;=0D
++  PrimaryHeader.SizeOfPartitionEntry     =3D MAX_UINT32;=0D
++  Status                                 =3D SanitizePrimaryHeaderAllocat=
ionSize (&PrimaryHeader, &AllocationSize);=0D
++  UT_ASSERT_EQUAL (Status, EFI_BAD_BUFFER_SIZE);=0D
++=0D
++  // Test the worst case scenario=0D
++  PrimaryHeader.NumberOfPartitionEntries =3D MAX_UINT32;=0D
++  PrimaryHeader.SizeOfPartitionEntry     =3D MAX_UINT32;=0D
++  Status                                 =3D SanitizePrimaryHeaderAllocat=
ionSize (&PrimaryHeader, &AllocationSize);=0D
++  UT_ASSERT_EQUAL (Status, EFI_BAD_BUFFER_SIZE);=0D
++=0D
++  DEBUG ((DEBUG_INFO, "%a: Test passed\n", __func__));=0D
++=0D
++  return UNIT_TEST_PASSED;=0D
++}=0D
++=0D
++/**=0D
++  This function tests the SanitizePrimaryHeaderGptEventSize function.=0D
++  It's intent is to test that the untrusted input from a EFI_GPT_DATA str=
ucture=0D
++  will not cause an overflow when calculating the event size.=0D
++=0D
++  @param[in] Context  The unit test context.=0D
++=0D
++  @retval UNIT_TEST_PASSED  The test passed.=0D
++  @retval UNIT_TEST_ERROR_TEST_FAILED  The test failed.=0D
++**/=0D
++UNIT_TEST_STATUS=0D
++EFIAPI=0D
++TestSanitizePrimaryHeaderGptEventSize (=0D
++  IN UNIT_TEST_CONTEXT  Context=0D
++  )=0D
++{=0D
++  UINT32                      EventSize;=0D
++  UINT32                      ExistingLogicEventSize;=0D
++  EFI_STATUS                  Status;=0D
++  EFI_PARTITION_TABLE_HEADER  PrimaryHeader;=0D
++  UINTN                       NumberOfPartition;=0D
++  EFI_GPT_DATA                *GptData;=0D
++=0D
++  GptData =3D NULL;=0D
++=0D
++  // Test that a normal PrimaryHeader passes validation=0D
++  PrimaryHeader.NumberOfPartitionEntries =3D 5;=0D
++  PrimaryHeader.SizeOfPartitionEntry     =3D DEFAULT_PRIMARY_TABLE_HEADER=
_SIZE_OF_PARTITION_ENTRY;=0D
++=0D
++  // set the number of partitions=0D
++  NumberOfPartition =3D 13;=0D
++=0D
++  // that the primary event size is correct=0D
++  Status =3D SanitizePrimaryHeaderGptEventSize (&PrimaryHeader, NumberOfP=
artition, &EventSize);=0D
++  UT_ASSERT_NOT_EFI_ERROR (Status);=0D
++=0D
++  // Calculate the existing logic event size=0D
++  ExistingLogicEventSize =3D (UINT32)(sizeof (TCG_PCR_EVENT_HDR) + OFFSET=
_OF (EFI_GPT_DATA, Partitions)=0D
++                                    + NumberOfPartition * PrimaryHeader.S=
izeOfPartitionEntry);=0D
++=0D
++  // Check that the event size is correct=0D
++  UT_ASSERT_EQUAL (EventSize, ExistingLogicEventSize);=0D
++=0D
++  // Tests that the primary event size may not overflow=0D
++  Status =3D SanitizePrimaryHeaderGptEventSize (&PrimaryHeader, MAX_UINT3=
2, &EventSize);=0D
++  UT_ASSERT_EQUAL (Status, EFI_BAD_BUFFER_SIZE);=0D
++=0D
++  // Test that the size of partition entries may not overflow=0D
++  PrimaryHeader.SizeOfPartitionEntry =3D MAX_UINT32;=0D
++  Status                             =3D SanitizePrimaryHeaderGptEventSiz=
e (&PrimaryHeader, NumberOfPartition, &EventSize);=0D
++  UT_ASSERT_EQUAL (Status, EFI_BAD_BUFFER_SIZE);=0D
++=0D
++  DEBUG ((DEBUG_INFO, "%a: Test passed\n", __func__));=0D
++=0D
++  return UNIT_TEST_PASSED;=0D
++}=0D
++=0D
++// *--------------------------------------------------------------------*=
=0D
++// *  Unit Test Code Main Function=0D
++// *--------------------------------------------------------------------*=
=0D
++=0D
++/**=0D
++  This function acts as the entry point for the unit tests.=0D
++=0D
++  @param argc - The number of command line arguments=0D
++  @param argv - The command line arguments=0D
++=0D
++  @return int - The status of the test=0D
++**/=0D
++EFI_STATUS=0D
++EFIAPI=0D
++UefiTestMain (=0D
++  VOID=0D
++  )=0D
++{=0D
++  EFI_STATUS                  Status;=0D
++  UNIT_TEST_FRAMEWORK_HANDLE  Framework;=0D
++  UNIT_TEST_SUITE_HANDLE      TcgMeasureBootLibValidationTestSuite;=0D
++=0D
++  Framework =3D NULL;=0D
++=0D
++  DEBUG ((DEBUG_INFO, "%a: TestMain() - Start\n", UNIT_TEST_NAME));=0D
++=0D
++  Status =3D InitUnitTestFramework (&Framework, UNIT_TEST_NAME, gEfiCalle=
rBaseName, UNIT_TEST_VERSION);=0D
++  if (EFI_ERROR (Status)) {=0D
++    DEBUG ((DEBUG_ERROR, "%a: Failed in InitUnitTestFramework. Status =3D=
 %r\n", UNIT_TEST_NAME, Status));=0D
++    goto EXIT;=0D
++  }=0D
++=0D
++  Status =3D CreateUnitTestSuite (&TcgMeasureBootLibValidationTestSuite, =
Framework, "TcgMeasureBootLibValidationTestSuite", "Common.TcgMeasureBootLi=
bValidation", NULL, NULL);=0D
++  if (EFI_ERROR (Status)) {=0D
++    DEBUG ((DEBUG_ERROR, "%s: Failed in CreateUnitTestSuite for TcgMeasur=
eBootLibValidationTestSuite\n", UNIT_TEST_NAME));=0D
++    Status =3D EFI_OUT_OF_RESOURCES;=0D
++    goto EXIT;=0D
++  }=0D
++=0D
++  // -----------Suite---------------------------------Description--------=
--------------------Class----------------------------------Test Function---=
---------------------Pre---Clean-Context=0D
++  AddTestCase (TcgMeasureBootLibValidationTestSuite, "Tests Validating EF=
I Partition Table", "Common.TcgMeasureBootLibValidation", TestSanitizeEfiPa=
rtitionTableHeader, NULL, NULL, NULL);=0D
++  AddTestCase (TcgMeasureBootLibValidationTestSuite, "Tests Primary heade=
r gpt event checks for overflow", "Common.TcgMeasureBootLibValidation", Tes=
tSanitizePrimaryHeaderAllocationSize, NULL, NULL, NULL);=0D
++  AddTestCase (TcgMeasureBootLibValidationTestSuite, "Tests Primary heade=
r allocation size checks for overflow", "Common.TcgMeasureBootLibValidation=
", TestSanitizePrimaryHeaderGptEventSize, NULL, NULL, NULL);=0D
++=0D
++  Status =3D RunAllTestSuites (Framework);=0D
++=0D
++EXIT:=0D
++  if (Framework !=3D NULL) {=0D
++    FreeUnitTestFramework (Framework);=0D
++  }=0D
++=0D
++  DEBUG ((DEBUG_INFO, "%a: TestMain() - End\n", UNIT_TEST_NAME));=0D
++  return Status;=0D
++}=0D
++=0D
++///=0D
++/// Avoid ECC error for function name that starts with lower case letter=
=0D
++///=0D
++#define DxeTpmMeasureBootLibUnitTestMain  main=0D
++=0D
++/**=0D
++  Standard POSIX C entry point for host based unit test execution.=0D
++=0D
++  @param[in] Argc  Number of arguments=0D
++  @param[in] Argv  Array of pointers to arguments=0D
++=0D
++  @retval 0      Success=0D
++  @retval other  Error=0D
++**/=0D
++INT32=0D
++DxeTpmMeasureBootLibUnitTestMain (=0D
++  IN INT32  Argc,=0D
++  IN CHAR8  *Argv[]=0D
++  )=0D
++{=0D
++  return (INT32)UefiTestMain ();=0D
++}=0D
+diff --git a/SecurityPkg/Library/DxeTpmMeasureBootLib/InternalUnitTest/Dxe=
TpmMeasureBootLibSanitizationTestHost.inf b/SecurityPkg/Library/DxeTpmMeasu=
reBootLib/InternalUnitTest/DxeTpmMeasureBootLibSanitizationTestHost.inf
+new file mode 100644
+index 0000000000..47b0811b00
+--- /dev/null
++++ b/SecurityPkg/Library/DxeTpmMeasureBootLib/InternalUnitTest/DxeTpmMeas=
ureBootLibSanitizationTestHost.inf
+@@ -0,0 +1,28 @@
++## @file=0D
++# This file builds the unit tests for DxeTpmMeasureBootLib=0D
++#=0D
++# Copyright (C) Microsoft Corporation.<BR>=0D
++# SPDX-License-Identifier: BSD-2-Clause-Patent=0D
++##=0D
++=0D
++[Defines]=0D
++  INF_VERSION                    =3D 0x00010006=0D
++  BASE_NAME                      =3D DxeTpmMeasuredBootLibTest=0D
++  FILE_GUID                      =3D eb01bc38-309c-4d3e-967e-9f078c90772f=
=0D
++  MODULE_TYPE                    =3D HOST_APPLICATION=0D
++  VERSION_STRING                 =3D 1.0=0D
++  ENTRY_POINT                    =3D main=0D
++=0D
++[Sources]=0D
++  DxeTpmMeasureBootLibSanitizationTest.c=0D
++  ../DxeTpmMeasureBootLibSanitization.c=0D
++=0D
++[Packages]=0D
++  MdePkg/MdePkg.dec=0D
++=0D
++[LibraryClasses]=0D
++  BaseLib=0D
++  DebugLib=0D
++  UnitTestLib=0D
++  PrintLib=0D
++  SafeIntLib=0D
+diff --git a/SecurityPkg/SecurityPkg.ci.yaml b/SecurityPkg/SecurityPkg.ci.=
yaml
+index da811fdf93..0e40eaa0fe 100644
+--- a/SecurityPkg/SecurityPkg.ci.yaml
++++ b/SecurityPkg/SecurityPkg.ci.yaml
+@@ -16,6 +16,7 @@
+         ## ]=0D
+         "ExceptionList": [=0D
+             "8001", "DxeTpm2MeasureBootLibUnitTestMain",=0D
++            "8001", "DxeTpmMeasureBootLibUnitTestMain"=0D
+         ],=0D
+         ## Both file path and directory path are accepted.=0D
+         "IgnoreFiles": [=0D
+--=20
+2.40.0
+
diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2022-36763-0003.patch b/meta/r=
ecipes-core/ovmf/ovmf/CVE-2022-36763-0003.patch
new file mode 100644
index 0000000000..59bd5c4910
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/CVE-2022-36763-0003.patch
@@ -0,0 +1,55 @@
+From 1ddcb9fc6b4164e882687b031e8beacfcf7df29e Mon Sep 17 00:00:00 2001
+From: "Douglas Flick [MSFT]" <doug.edk2@gmail.com>
+Date: Fri, 12 Jan 2024 02:16:03 +0800
+Subject: [PATCH] SecurityPkg: : Adding CVE 2022-36763 to SecurityFixes.yaml
+
+This creates / adds a security file that tracks the security fixes
+found in this package and can be used to find the fixes that were
+applied.
+
+Cc: Jiewen Yao <jiewen.yao@intel.com>
+
+Signed-off-by: Doug Flick [MSFT] <doug.edk2@gmail.com>
+Reviewed-by: Jiewen Yao <jiewen.yao@intel.com>
+
+CVE: CVE-2022-36763
+
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/1ddcb9=
fc6b4164e882687b031e8beacfcf7df29e]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ SecurityPkg/SecurityFixes.yaml | 22 ++++++++++++++++++++++
+ 1 file changed, 22 insertions(+)
+ create mode 100644 SecurityPkg/SecurityFixes.yaml
+
+diff --git a/SecurityPkg/SecurityFixes.yaml b/SecurityPkg/SecurityFixes.ya=
ml
+new file mode 100644
+index 0000000000..f9e3e7be74
+--- /dev/null
++++ b/SecurityPkg/SecurityFixes.yaml
+@@ -0,0 +1,22 @@
++## @file=0D
++# Security Fixes for SecurityPkg=0D
++#=0D
++# Copyright (c) Microsoft Corporation=0D
++# SPDX-License-Identifier: BSD-2-Clause-Patent=0D
++##=0D
++CVE_2022_36763:=0D
++  commit_titles:=0D
++    - "SecurityPkg: DxeTpm2Measurement: SECURITY PATCH 4117 - CVE 2022-36=
763"=0D
++    - "SecurityPkg: DxeTpmMeasurement: SECURITY PATCH 4117 - CVE 2022-367=
63"=0D
++    - "SecurityPkg: : Adding CVE 2022-36763 to SecurityFixes.yaml"=0D
++  cve: CVE-2022-36763=0D
++  date_reported: 2022-10-25 11:31 UTC=0D
++  description: (CVE-2022-36763) - Heap Buffer Overflow in Tcg2MeasureGptT=
able()=0D
++  note: This patch is related to and supersedes TCBZ2168=0D
++  files_impacted:=0D
++  - Library\DxeTpm2MeasureBootLib\DxeTpm2MeasureBootLib.c=0D
++  - Library\DxeTpmMeasureBootLib\DxeTpmMeasureBootLib.c=0D
++  links:=0D
++  - https://bugzilla.tianocore.org/show_bug.cgi?id=3D4117=0D
++  - https://bugzilla.tianocore.org/show_bug.cgi?id=3D2168=0D
++  - https://bugzilla.tianocore.org/show_bug.cgi?id=3D1990=0D
+--=20
+2.40.0
+
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ov=
mf_git.bb
index 84e3360a3a..78d86ad879 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -27,6 +27,9 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=
=3Dmaster;protocol=3Dhttps \
            file://0006-reproducible.patch \
            file://0001-BaseTools-fix-gcc12-warning.patch \
            file://0001-BaseTools-fix-gcc12-warning-1.patch \
+           file://CVE-2022-36763-0001.patch \
+           file://CVE-2022-36763-0002.patch \
+           file://CVE-2022-36763-0003.patch \
            "
=20
 PV =3D "edk2-stable202202"
--=20
2.40.0


