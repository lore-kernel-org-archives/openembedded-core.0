Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BF9CD5A6CE
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 02:25:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.36918.1732587941994443879
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 18:25:42 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1060df9989=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQ1KgEB007184;
	Tue, 26 Nov 2024 02:25:41 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 433618aq0g-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 26 Nov 2024 02:25:40 +0000 (GMT)
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
Subject: [kirkstone][PATCH V2 02/13] ovmf: Fix CVE-2022-36764
Date: Mon, 25 Nov 2024 18:25:15 -0800
Message-ID: <20241126022526.3389121-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241126022526.3389121-1-hongxu.jia@windriver.com>
References: <20241126022526.3389121-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: c1z4G9Yd49d81MWprz2vk_LOehV_1PKr
X-Proofpoint-GUID: c1z4G9Yd49d81MWprz2vk_LOehV_1PKr
X-Authority-Analysis: v=2.4 cv=O65rvw9W c=1 sm=1 tr=0 ts=674531a5 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VlfZXiiP6vEA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=hqBzw_eTAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8
 a=N6i3clLbqkvBenj-L78A:9 a=UjeNzV11mqK6jmm6:21 a=RVmHIydaz68A:10 a=bkWp_v3HvcftT6DRAIDL:22 a=FdTzh2GWekK77mhwV6Dw:22
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207826

From: Soumya Sambu <soumya.sambu@windriver.com>

EDK2 is susceptible to a vulnerability in the Tcg2MeasurePeImage()
function, allowing a user to trigger a heap buffer overflow via a local
network. Successful exploitation of this vulnerability may result in a
compromise of confidentiality, integrity, and/or availability.

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-36764

Upstream-patches:
https://github.com/tianocore/edk2/commit/c7b27944218130cca3bbb20314ba5b88b5=
de4aa4
https://github.com/tianocore/edk2/commit/0d341c01eeabe0ab5e76693b36e728b8f5=
38a40e
https://github.com/tianocore/edk2/commit/8f6d343ae639fba8e4b80e45257275e230=
83431f

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../ovmf/ovmf/CVE-2022-36764-0001.patch       | 271 +++++++++++++++++
 .../ovmf/ovmf/CVE-2022-36764-0002.patch       | 281 ++++++++++++++++++
 .../ovmf/ovmf/CVE-2022-36764-0003.patch       |  48 +++
 meta/recipes-core/ovmf/ovmf_git.bb            |   3 +
 4 files changed, 603 insertions(+)
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2022-36764-0001.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2022-36764-0002.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2022-36764-0003.patch

diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2022-36764-0001.patch b/meta/r=
ecipes-core/ovmf/ovmf/CVE-2022-36764-0001.patch
new file mode 100644
index 0000000000..a552f36b2c
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/CVE-2022-36764-0001.patch
@@ -0,0 +1,271 @@
+From c7b27944218130cca3bbb20314ba5b88b5de4aa4 Mon Sep 17 00:00:00 2001
+From: "Douglas Flick [MSFT]" <doug.edk2@gmail.com>
+Date: Fri, 12 Jan 2024 02:16:04 +0800
+Subject: [PATCH] SecurityPkg: DxeTpm2MeasureBootLib: SECURITY PATCH 4118 -=
 CVE
+  2022-36764
+
+This commit contains the patch files and tests for DxeTpm2MeasureBootLib
+CVE 2022-36764.
+
+Cc: Jiewen Yao <jiewen.yao@intel.com>
+
+Signed-off-by: Doug Flick [MSFT] <doug.edk2@gmail.com>
+Reviewed-by: Jiewen Yao <jiewen.yao@intel.com>
+
+CVE: CVE-2022-36764
+
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/c7b279=
44218130cca3bbb20314ba5b88b5de4aa4]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ .../DxeTpm2MeasureBootLib.c                   | 12 ++--
+ .../DxeTpm2MeasureBootLibSanitization.c       | 46 +++++++++++++-
+ .../DxeTpm2MeasureBootLibSanitization.h       | 28 ++++++++-
+ .../DxeTpm2MeasureBootLibSanitizationTest.c   | 60 ++++++++++++++++---
+ 4 files changed, 131 insertions(+), 15 deletions(-)
+
+diff --git a/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootL=
ib.c b/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLib.c
+index 0475103d6e..714cc8e03e 100644
+--- a/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLib.c
++++ b/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLib.c
+@@ -378,7 +378,6 @@ Exit:
+   @retval EFI_OUT_OF_RESOURCES   No enough resource to measure image.=0D
+   @retval EFI_UNSUPPORTED        ImageType is unsupported or PE image is =
mal-format.=0D
+   @retval other error value=0D
+-=0D
+ **/=0D
+ EFI_STATUS=0D
+ EFIAPI=0D
+@@ -405,6 +404,7 @@ Tcg2MeasurePeImage (
+   Status    =3D EFI_UNSUPPORTED;=0D
+   ImageLoad =3D NULL;=0D
+   EventPtr  =3D NULL;=0D
++  Tcg2Event =3D NULL;=0D
+ =0D
+   Tcg2Protocol =3D MeasureBootProtocols->Tcg2Protocol;=0D
+   CcProtocol   =3D MeasureBootProtocols->CcProtocol;=0D
+@@ -420,18 +420,22 @@ Tcg2MeasurePeImage (
+   }=0D
+ =0D
+   FilePathSize =3D (UINT32)GetDevicePathSize (FilePath);=0D
++  Status       =3D SanitizePeImageEventSize (FilePathSize, &EventSize);=0D
++  if (EFI_ERROR (Status)) {=0D
++    return EFI_UNSUPPORTED;=0D
++  }=0D
+ =0D
+   //=0D
+   // Determine destination PCR by BootPolicy=0D
+   //=0D
+-  EventSize =3D sizeof (*ImageLoad) - sizeof (ImageLoad->DevicePath) + Fi=
lePathSize;=0D
+-  EventPtr  =3D AllocateZeroPool (EventSize + sizeof (EFI_TCG2_EVENT) - s=
izeof (Tcg2Event->Event));=0D
++  // from a malicious GPT disk partition=0D
++  EventPtr =3D AllocateZeroPool (EventSize);=0D
+   if (EventPtr =3D=3D NULL) {=0D
+     return EFI_OUT_OF_RESOURCES;=0D
+   }=0D
+ =0D
+   Tcg2Event                       =3D (EFI_TCG2_EVENT *)EventPtr;=0D
+-  Tcg2Event->Size                 =3D EventSize + sizeof (EFI_TCG2_EVENT)=
 - sizeof (Tcg2Event->Event);=0D
++  Tcg2Event->Size                 =3D EventSize;=0D
+   Tcg2Event->Header.HeaderSize    =3D sizeof (EFI_TCG2_EVENT_HEADER);=0D
+   Tcg2Event->Header.HeaderVersion =3D EFI_TCG2_EVENT_HEADER_VERSION;=0D
+   ImageLoad                       =3D (EFI_IMAGE_LOAD_EVENT *)Tcg2Event->=
Event;=0D
+diff --git a/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootL=
ibSanitization.c b/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2Measure=
BootLibSanitization.c
+index e2309655d3..2a4d52c6d5 100644
+--- a/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLibSanit=
ization.c
++++ b/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLibSanit=
ization.c
+@@ -151,7 +151,7 @@ SanitizeEfiPartitionTableHeader (
+ }=0D
+ =0D
+ /**=0D
+-  This function will validate that the allocation size from the primary h=
eader is sane=0D
++ This function will validate that the allocation size from the primary he=
ader is sane=0D
+   It will check the following:=0D
+     - AllocationSize does not overflow=0D
+ =0D
+@@ -273,3 +273,47 @@ SanitizePrimaryHeaderGptEventSize (
+ =0D
+   return EFI_SUCCESS;=0D
+ }=0D
++=0D
++/**=0D
++  This function will validate that the PeImage Event Size from the loaded=
 image is sane=0D
++  It will check the following:=0D
++    - EventSize does not overflow=0D
++=0D
++  @param[in] FilePathSize - Size of the file path.=0D
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
++SanitizePeImageEventSize (=0D
++  IN  UINT32  FilePathSize,=0D
++  OUT UINT32  *EventSize=0D
++  )=0D
++{=0D
++  EFI_STATUS  Status;=0D
++=0D
++  // Replacing logic:=0D
++  // sizeof (*ImageLoad) - sizeof (ImageLoad->DevicePath) + FilePathSize;=
=0D
++  Status =3D SafeUint32Add (OFFSET_OF (EFI_IMAGE_LOAD_EVENT, DevicePath),=
 FilePathSize, EventSize);=0D
++  if (EFI_ERROR (Status)) {=0D
++    DEBUG ((DEBUG_ERROR, "EventSize would overflow!\n"));=0D
++    return EFI_BAD_BUFFER_SIZE;=0D
++  }=0D
++=0D
++  // Replacing logic:=0D
++  // EventSize + sizeof (EFI_TCG2_EVENT) - sizeof (Tcg2Event->Event)=0D
++  Status =3D SafeUint32Add (*EventSize, OFFSET_OF (EFI_TCG2_EVENT, Event)=
, EventSize);=0D
++  if (EFI_ERROR (Status)) {=0D
++    DEBUG ((DEBUG_ERROR, "EventSize would overflow!\n"));=0D
++    return EFI_BAD_BUFFER_SIZE;=0D
++  }=0D
++=0D
++  return EFI_SUCCESS;=0D
++}=0D
+diff --git a/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootL=
ibSanitization.h b/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2Measure=
BootLibSanitization.h
+index 048b738987..8f72ba4240 100644
+--- a/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLibSanit=
ization.h
++++ b/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLibSanit=
ization.h
+@@ -9,6 +9,9 @@
+   Tcg2MeasureGptTable() function will receive untrusted GPT partition tab=
le, and parse=0D
+   partition data carefully.=0D
+ =0D
++  Tcg2MeasurePeImage() function will accept untrusted PE/COFF image and v=
alidate its=0D
++  data structure within this image buffer before use.=0D
++=0D
+   Copyright (c) Microsoft Corporation.<BR>=0D
+   SPDX-License-Identifier: BSD-2-Clause-Patent=0D
+ =0D
+@@ -110,4 +113,27 @@ SanitizePrimaryHeaderGptEventSize (
+   OUT UINT32                            *EventSize=0D
+   );=0D
+ =0D
+-#endif // DXE_TPM2_MEASURE_BOOT_LIB_SANITATION_=0D
++/**=0D
++  This function will validate that the PeImage Event Size from the loaded=
 image is sane=0D
++  It will check the following:=0D
++    - EventSize does not overflow=0D
++=0D
++  @param[in] FilePathSize - Size of the file path.=0D
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
++SanitizePeImageEventSize (=0D
++  IN  UINT32  FilePathSize,=0D
++  OUT UINT32  *EventSize=0D
++  );=0D
++=0D
++#endif // DXE_TPM2_MEASURE_BOOT_LIB_VALIDATION_=0D
+diff --git a/SecurityPkg/Library/DxeTpm2MeasureBootLib/InternalUnitTest/Dx=
eTpm2MeasureBootLibSanitizationTest.c b/SecurityPkg/Library/DxeTpm2MeasureB=
ootLib/InternalUnitTest/DxeTpm2MeasureBootLibSanitizationTest.c
+index 3eb9763e3c..820e99aeb9 100644
+--- a/SecurityPkg/Library/DxeTpm2MeasureBootLib/InternalUnitTest/DxeTpm2Me=
asureBootLibSanitizationTest.c
++++ b/SecurityPkg/Library/DxeTpm2MeasureBootLib/InternalUnitTest/DxeTpm2Me=
asureBootLibSanitizationTest.c
+@@ -72,10 +72,10 @@ TestSanitizeEfiPartitionTableHeader (
+   PrimaryHeader.Header.Revision          =3D DEFAULT_PRIMARY_TABLE_HEADER=
_REVISION;=0D
+   PrimaryHeader.Header.HeaderSize        =3D sizeof (EFI_PARTITION_TABLE_=
HEADER);=0D
+   PrimaryHeader.MyLBA                    =3D 1;=0D
+-  PrimaryHeader.AlternateLBA             =3D 2;=0D
+-  PrimaryHeader.FirstUsableLBA           =3D 3;=0D
+-  PrimaryHeader.LastUsableLBA            =3D 4;=0D
+-  PrimaryHeader.PartitionEntryLBA        =3D 5;=0D
++  PrimaryHeader.PartitionEntryLBA        =3D 2;=0D
++  PrimaryHeader.AlternateLBA             =3D 3;=0D
++  PrimaryHeader.FirstUsableLBA           =3D 4;=0D
++  PrimaryHeader.LastUsableLBA            =3D 5;=0D
+   PrimaryHeader.NumberOfPartitionEntries =3D DEFAULT_PRIMARY_TABLE_HEADER=
_NUMBER_OF_PARTITION_ENTRIES;=0D
+   PrimaryHeader.SizeOfPartitionEntry     =3D DEFAULT_PRIMARY_TABLE_HEADER=
_SIZE_OF_PARTITION_ENTRY;=0D
+   PrimaryHeader.PartitionEntryArrayCRC32 =3D 0; // Purposely invalid=0D
+@@ -187,11 +187,6 @@ TestSanitizePrimaryHeaderGptEventSize (
+   EFI_STATUS                  Status;=0D
+   EFI_PARTITION_TABLE_HEADER  PrimaryHeader;=0D
+   UINTN                       NumberOfPartition;=0D
+-  EFI_GPT_DATA                *GptData;=0D
+-  EFI_TCG2_EVENT              *Tcg2Event;=0D
+-=0D
+-  Tcg2Event =3D NULL;=0D
+-  GptData   =3D NULL;=0D
+ =0D
+   // Test that a normal PrimaryHeader passes validation=0D
+   PrimaryHeader.NumberOfPartitionEntries =3D 5;=0D
+@@ -225,6 +220,52 @@ TestSanitizePrimaryHeaderGptEventSize (
+   return UNIT_TEST_PASSED;=0D
+ }=0D
+ =0D
++/**=0D
++  This function tests the SanitizePeImageEventSize function.=0D
++  It's intent is to test that the untrusted input from a file path when g=
enerating a=0D
++  EFI_IMAGE_LOAD_EVENT structure will not cause an overflow when calculat=
ing=0D
++  the event size when allocating space=0D
++=0D
++  @param[in] Context  The unit test context.=0D
++=0D
++  @retval UNIT_TEST_PASSED  The test passed.=0D
++  @retval UNIT_TEST_ERROR_TEST_FAILED  The test failed.=0D
++**/=0D
++UNIT_TEST_STATUS=0D
++EFIAPI=0D
++TestSanitizePeImageEventSize (=0D
++  IN UNIT_TEST_CONTEXT  Context=0D
++  )=0D
++{=0D
++  UINT32      EventSize;=0D
++  UINTN       ExistingLogicEventSize;=0D
++  UINT32      FilePathSize;=0D
++  EFI_STATUS  Status;=0D
++=0D
++  FilePathSize =3D 255;=0D
++=0D
++  // Test that a normal PE image passes validation=0D
++  Status =3D SanitizePeImageEventSize (FilePathSize, &EventSize);=0D
++  UT_ASSERT_EQUAL (Status, EFI_SUCCESS);=0D
++=0D
++  // Test that the event size is correct compared to the existing logic=0D
++  ExistingLogicEventSize  =3D OFFSET_OF (EFI_IMAGE_LOAD_EVENT, DevicePath=
) + FilePathSize;=0D
++  ExistingLogicEventSize +=3D OFFSET_OF (EFI_TCG2_EVENT, Event);=0D
++=0D
++  if (EventSize !=3D ExistingLogicEventSize) {=0D
++    UT_LOG_ERROR ("SanitizePeImageEventSize returned an incorrect event s=
ize. Expected %u, got %u\n", ExistingLogicEventSize, EventSize);=0D
++    return UNIT_TEST_ERROR_TEST_FAILED;=0D
++  }=0D
++=0D
++  // Test that the event size may not overflow=0D
++  Status =3D SanitizePeImageEventSize (MAX_UINT32, &EventSize);=0D
++  UT_ASSERT_EQUAL (Status, EFI_BAD_BUFFER_SIZE);=0D
++=0D
++  DEBUG ((DEBUG_INFO, "%a: Test passed\n", __func__));=0D
++=0D
++  return UNIT_TEST_PASSED;=0D
++}=0D
++=0D
+ // *--------------------------------------------------------------------*=
=0D
+ // *  Unit Test Code Main Function=0D
+ // *--------------------------------------------------------------------*=
=0D
+@@ -267,6 +308,7 @@ UefiTestMain (
+   AddTestCase (Tcg2MeasureBootLibValidationTestSuite, "Tests Validating E=
FI Partition Table", "Common.Tcg2MeasureBootLibValidation", TestSanitizeEfi=
PartitionTableHeader, NULL, NULL, NULL);=0D
+   AddTestCase (Tcg2MeasureBootLibValidationTestSuite, "Tests Primary head=
er gpt event checks for overflow", "Common.Tcg2MeasureBootLibValidation", T=
estSanitizePrimaryHeaderAllocationSize, NULL, NULL, NULL);=0D
+   AddTestCase (Tcg2MeasureBootLibValidationTestSuite, "Tests Primary head=
er allocation size checks for overflow", "Common.Tcg2MeasureBootLibValidati=
on", TestSanitizePrimaryHeaderGptEventSize, NULL, NULL, NULL);=0D
++  AddTestCase (Tcg2MeasureBootLibValidationTestSuite, "Tests PE Image and=
 FileSize checks for overflow", "Common.Tcg2MeasureBootLibValidation", Test=
SanitizePeImageEventSize, NULL, NULL, NULL);=0D
+ =0D
+   Status =3D RunAllTestSuites (Framework);=0D
+ =0D
+--=20
+2.40.0
+
diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2022-36764-0002.patch b/meta/r=
ecipes-core/ovmf/ovmf/CVE-2022-36764-0002.patch
new file mode 100644
index 0000000000..22a7713f52
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/CVE-2022-36764-0002.patch
@@ -0,0 +1,281 @@
+From 0d341c01eeabe0ab5e76693b36e728b8f538a40e Mon Sep 17 00:00:00 2001
+From: "Douglas Flick [MSFT]" <doug.edk2@gmail.com>
+Date: Fri, 12 Jan 2024 02:16:05 +0800
+Subject: [PATCH] SecurityPkg: DxeTpmMeasureBootLib: SECURITY PATCH 4118 - =
CVE=20
+ 2022-36764
+
+This commit contains the patch files and tests for DxeTpmMeasureBootLib
+CVE 2022-36764.
+
+Cc: Jiewen Yao <jiewen.yao@intel.com>
+
+Signed-off-by: Doug Flick [MSFT] <doug.edk2@gmail.com>
+Reviewed-by: Jiewen Yao <jiewen.yao@intel.com>
+
+CVE: CVE-2022-36764
+
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/0d341c=
01eeabe0ab5e76693b36e728b8f538a40e]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ .../DxeTpmMeasureBootLib.c                    | 13 ++-
+ .../DxeTpmMeasureBootLibSanitization.c        | 44 +++++++++
+ .../DxeTpmMeasureBootLibSanitization.h        | 23 +++++
+ .../DxeTpmMeasureBootLibSanitizationTest.c    | 98 +++++++++++++++++--
+ 4 files changed, 168 insertions(+), 10 deletions(-)
+
+diff --git a/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootLib=
.c b/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootLib.c
+index 669ab19134..a9fc440a09 100644
+--- a/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootLib.c
++++ b/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootLib.c
+@@ -17,6 +17,7 @@
+ =0D
+ Copyright (c) 2009 - 2018, Intel Corporation. All rights reserved.<BR>=0D
+ SPDX-License-Identifier: BSD-2-Clause-Patent=0D
++Copyright (c) Microsoft Corporation.<BR>=0D
+ =0D
+ Copyright (c) Microsoft Corporation.<BR>=0D
+ SPDX-License-Identifier: BSD-2-Clause-Patent=0D
+@@ -345,18 +346,22 @@ TcgMeasurePeImage (
+   ImageLoad     =3D NULL;=0D
+   SectionHeader =3D NULL;=0D
+   Sha1Ctx       =3D NULL;=0D
++  TcgEvent      =3D NULL;=0D
+   FilePathSize  =3D (UINT32)GetDevicePathSize (FilePath);=0D
+ =0D
+-  //=0D
+   // Determine destination PCR by BootPolicy=0D
+   //=0D
+-  EventSize =3D sizeof (*ImageLoad) - sizeof (ImageLoad->DevicePath) + Fi=
lePathSize;=0D
+-  TcgEvent  =3D AllocateZeroPool (EventSize + sizeof (TCG_PCR_EVENT));=0D
++  Status =3D SanitizePeImageEventSize (FilePathSize, &EventSize);=0D
++  if (EFI_ERROR (Status)) {=0D
++    return EFI_UNSUPPORTED;=0D
++  }=0D
++=0D
++  TcgEvent =3D AllocateZeroPool (EventSize);=0D
+   if (TcgEvent =3D=3D NULL) {=0D
+     return EFI_OUT_OF_RESOURCES;=0D
+   }=0D
+ =0D
+-  TcgEvent->EventSize =3D EventSize;=0D
++  TcgEvent->EventSize =3D EventSize - sizeof (TCG_PCR_EVENT_HDR);=0D
+   ImageLoad           =3D (EFI_IMAGE_LOAD_EVENT *)TcgEvent->Event;=0D
+ =0D
+   switch (ImageType) {=0D
+diff --git a/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootLib=
Sanitization.c b/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBoot=
LibSanitization.c
+index a3fa46f5e6..c989851cec 100644
+--- a/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootLibSanitiz=
ation.c
++++ b/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootLibSanitiz=
ation.c
+@@ -239,3 +239,47 @@ SanitizePrimaryHeaderGptEventSize (
+ =0D
+   return EFI_SUCCESS;=0D
+ }=0D
++=0D
++/**=0D
++  This function will validate that the PeImage Event Size from the loaded=
 image is sane=0D
++  It will check the following:=0D
++    - EventSize does not overflow=0D
++=0D
++  @param[in] FilePathSize - Size of the file path.=0D
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
++SanitizePeImageEventSize (=0D
++  IN  UINT32  FilePathSize,=0D
++  OUT UINT32  *EventSize=0D
++  )=0D
++{=0D
++  EFI_STATUS  Status;=0D
++=0D
++  // Replacing logic:=0D
++  // sizeof (*ImageLoad) - sizeof (ImageLoad->DevicePath) + FilePathSize;=
=0D
++  Status =3D SafeUint32Add (OFFSET_OF (EFI_IMAGE_LOAD_EVENT, DevicePath),=
 FilePathSize, EventSize);=0D
++  if (EFI_ERROR (Status)) {=0D
++    DEBUG ((DEBUG_ERROR, "EventSize would overflow!\n"));=0D
++    return EFI_BAD_BUFFER_SIZE;=0D
++  }=0D
++=0D
++  // Replacing logic:=0D
++  // EventSize + sizeof (TCG_PCR_EVENT_HDR)=0D
++  Status =3D SafeUint32Add (*EventSize, sizeof (TCG_PCR_EVENT_HDR), Event=
Size);=0D
++  if (EFI_ERROR (Status)) {=0D
++    DEBUG ((DEBUG_ERROR, "EventSize would overflow!\n"));=0D
++    return EFI_BAD_BUFFER_SIZE;=0D
++  }=0D
++=0D
++  return EFI_SUCCESS;=0D
++}=0D
+diff --git a/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootLib=
Sanitization.h b/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBoot=
LibSanitization.h
+index 0d9d00c281..2248495813 100644
+--- a/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootLibSanitiz=
ation.h
++++ b/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootLibSanitiz=
ation.h
+@@ -111,4 +111,27 @@ SanitizePrimaryHeaderGptEventSize (
+   OUT UINT32                            *EventSize=0D
+   );=0D
+ =0D
++/**=0D
++  This function will validate that the PeImage Event Size from the loaded=
 image is sane=0D
++  It will check the following:=0D
++    - EventSize does not overflow=0D
++=0D
++  @param[in] FilePathSize - Size of the file path.=0D
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
++SanitizePeImageEventSize (=0D
++  IN  UINT32  FilePathSize,=0D
++  OUT UINT32  *EventSize=0D
++  );=0D
++=0D
+ #endif // DXE_TPM_MEASURE_BOOT_LIB_VALIDATION_=0D
+diff --git a/SecurityPkg/Library/DxeTpmMeasureBootLib/InternalUnitTest/Dxe=
TpmMeasureBootLibSanitizationTest.c b/SecurityPkg/Library/DxeTpmMeasureBoot=
Lib/InternalUnitTest/DxeTpmMeasureBootLibSanitizationTest.c
+index eeb928cdb0..c41498be45 100644
+--- a/SecurityPkg/Library/DxeTpmMeasureBootLib/InternalUnitTest/DxeTpmMeas=
ureBootLibSanitizationTest.c
++++ b/SecurityPkg/Library/DxeTpmMeasureBootLib/InternalUnitTest/DxeTpmMeas=
ureBootLibSanitizationTest.c
+@@ -1,8 +1,8 @@
+ /** @file=0D
+-This file includes the unit test cases for the DxeTpmMeasureBootLibSaniti=
zationTest.c.=0D
++  This file includes the unit test cases for the DxeTpmMeasureBootLibSani=
tizationTest.c.=0D
+ =0D
+-Copyright (c) Microsoft Corporation.<BR>=0D
+-SPDX-License-Identifier: BSD-2-Clause-Patent=0D
++  Copyright (c) Microsoft Corporation.<BR>=0D
++  SPDX-License-Identifier: BSD-2-Clause-Patent=0D
+ **/=0D
+ =0D
+ #include <Uefi.h>=0D
+@@ -186,9 +186,6 @@ TestSanitizePrimaryHeaderGptEventSize (
+   EFI_STATUS                  Status;=0D
+   EFI_PARTITION_TABLE_HEADER  PrimaryHeader;=0D
+   UINTN                       NumberOfPartition;=0D
+-  EFI_GPT_DATA                *GptData;=0D
+-=0D
+-  GptData =3D NULL;=0D
+ =0D
+   // Test that a normal PrimaryHeader passes validation=0D
+   PrimaryHeader.NumberOfPartitionEntries =3D 5;=0D
+@@ -222,6 +219,94 @@ TestSanitizePrimaryHeaderGptEventSize (
+   return UNIT_TEST_PASSED;=0D
+ }=0D
+ =0D
++/**=0D
++  This function tests the SanitizePeImageEventSize function.=0D
++  It's intent is to test that the untrusted input from a file path for an=
=0D
++  EFI_IMAGE_LOAD_EVENT structure will not cause an overflow when calculat=
ing=0D
++  the event size when allocating space.=0D
++=0D
++  @param[in] Context  The unit test context.=0D
++=0D
++  @retval UNIT_TEST_PASSED  The test passed.=0D
++  @retval UNIT_TEST_ERROR_TEST_FAILED  The test failed.=0D
++**/=0D
++UNIT_TEST_STATUS=0D
++EFIAPI=0D
++TestSanitizePeImageEventSize (=0D
++  IN UNIT_TEST_CONTEXT  Context=0D
++  )=0D
++{=0D
++  UINT32                    EventSize;=0D
++  UINTN                     ExistingLogicEventSize;=0D
++  UINT32                    FilePathSize;=0D
++  EFI_STATUS                Status;=0D
++  EFI_DEVICE_PATH_PROTOCOL  DevicePath;=0D
++  EFI_IMAGE_LOAD_EVENT      *ImageLoadEvent;=0D
++  UNIT_TEST_STATUS          TestStatus;=0D
++=0D
++  TestStatus =3D UNIT_TEST_ERROR_TEST_FAILED;=0D
++=0D
++  // Generate EFI_DEVICE_PATH_PROTOCOL test data=0D
++  DevicePath.Type      =3D 0;=0D
++  DevicePath.SubType   =3D 0;=0D
++  DevicePath.Length[0] =3D 0;=0D
++  DevicePath.Length[1] =3D 0;=0D
++=0D
++  // Generate EFI_IMAGE_LOAD_EVENT test data=0D
++  ImageLoadEvent =3D AllocateZeroPool (sizeof (EFI_IMAGE_LOAD_EVENT) + si=
zeof (EFI_DEVICE_PATH_PROTOCOL));=0D
++  if (ImageLoadEvent =3D=3D NULL) {=0D
++    DEBUG ((DEBUG_ERROR, "%a: AllocateZeroPool failed\n", __func__));=0D
++    goto Exit;=0D
++  }=0D
++=0D
++  // Populate EFI_IMAGE_LOAD_EVENT54 test data=0D
++  ImageLoadEvent->ImageLocationInMemory =3D (EFI_PHYSICAL_ADDRESS)0x12345=
678;=0D
++  ImageLoadEvent->ImageLengthInMemory   =3D 0x1000;=0D
++  ImageLoadEvent->ImageLinkTimeAddress  =3D (UINTN)ImageLoadEvent;=0D
++  ImageLoadEvent->LengthOfDevicePath    =3D sizeof (EFI_DEVICE_PATH_PROTO=
COL);=0D
++  CopyMem (ImageLoadEvent->DevicePath, &DevicePath, sizeof (EFI_DEVICE_PA=
TH_PROTOCOL));=0D
++=0D
++  FilePathSize =3D 255;=0D
++=0D
++  // Test that a normal PE image passes validation=0D
++  Status =3D SanitizePeImageEventSize (FilePathSize, &EventSize);=0D
++  if (EFI_ERROR (Status)) {=0D
++    UT_LOG_ERROR ("SanitizePeImageEventSize failed with %r\n", Status);=0D
++    goto Exit;=0D
++  }=0D
++=0D
++  // Test that the event size is correct compared to the existing logic=0D
++  ExistingLogicEventSize  =3D OFFSET_OF (EFI_IMAGE_LOAD_EVENT, DevicePath=
) + FilePathSize;=0D
++  ExistingLogicEventSize +=3D sizeof (TCG_PCR_EVENT_HDR);=0D
++=0D
++  if (EventSize !=3D ExistingLogicEventSize) {=0D
++    UT_LOG_ERROR ("SanitizePeImageEventSize returned an incorrect event s=
ize. Expected %u, got %u\n", ExistingLogicEventSize, EventSize);=0D
++    goto Exit;=0D
++  }=0D
++=0D
++  // Test that the event size may not overflow=0D
++  Status =3D SanitizePeImageEventSize (MAX_UINT32, &EventSize);=0D
++  if (Status !=3D EFI_BAD_BUFFER_SIZE) {=0D
++    UT_LOG_ERROR ("SanitizePeImageEventSize succeded when it was supposed=
 to fail with %r\n", Status);=0D
++    goto Exit;=0D
++  }=0D
++=0D
++  TestStatus =3D UNIT_TEST_PASSED;=0D
++Exit:=0D
++=0D
++  if (ImageLoadEvent !=3D NULL) {=0D
++    FreePool (ImageLoadEvent);=0D
++  }=0D
++=0D
++  if (TestStatus =3D=3D UNIT_TEST_ERROR_TEST_FAILED) {=0D
++    DEBUG ((DEBUG_ERROR, "%a: Test failed\n", __func__));=0D
++  } else {=0D
++    DEBUG ((DEBUG_INFO, "%a: Test passed\n", __func__));=0D
++  }=0D
++=0D
++  return TestStatus;=0D
++}=0D
++=0D
+ // *--------------------------------------------------------------------*=
=0D
+ // *  Unit Test Code Main Function=0D
+ // *--------------------------------------------------------------------*=
=0D
+@@ -265,6 +350,7 @@ UefiTestMain (
+   AddTestCase (TcgMeasureBootLibValidationTestSuite, "Tests Validating EF=
I Partition Table", "Common.TcgMeasureBootLibValidation", TestSanitizeEfiPa=
rtitionTableHeader, NULL, NULL, NULL);=0D
+   AddTestCase (TcgMeasureBootLibValidationTestSuite, "Tests Primary heade=
r gpt event checks for overflow", "Common.TcgMeasureBootLibValidation", Tes=
tSanitizePrimaryHeaderAllocationSize, NULL, NULL, NULL);=0D
+   AddTestCase (TcgMeasureBootLibValidationTestSuite, "Tests Primary heade=
r allocation size checks for overflow", "Common.TcgMeasureBootLibValidation=
", TestSanitizePrimaryHeaderGptEventSize, NULL, NULL, NULL);=0D
++  AddTestCase (TcgMeasureBootLibValidationTestSuite, "Tests PE Image and =
FileSize checks for overflow", "Common.TcgMeasureBootLibValidation", TestSa=
nitizePeImageEventSize, NULL, NULL, NULL);=0D
+ =0D
+   Status =3D RunAllTestSuites (Framework);=0D
+ =0D
+--=20
+2.40.0
+
diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2022-36764-0003.patch b/meta/r=
ecipes-core/ovmf/ovmf/CVE-2022-36764-0003.patch
new file mode 100644
index 0000000000..89386c0c29
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/CVE-2022-36764-0003.patch
@@ -0,0 +1,48 @@
+From 8f6d343ae639fba8e4b80e45257275e23083431f Mon Sep 17 00:00:00 2001
+From: "Douglas Flick [MSFT]" <doug.edk2@gmail.com>
+Date: Fri, 12 Jan 2024 02:16:06 +0800
+Subject: [PATCH] SecurityPkg: : Adding CVE 2022-36764 to SecurityFixes.yaml
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
+CVE: CVE-2022-36764
+
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/8f6d34=
3ae639fba8e4b80e45257275e23083431f]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ SecurityPkg/SecurityFixes.yaml | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/SecurityPkg/SecurityFixes.yaml b/SecurityPkg/SecurityFixes.ya=
ml
+index f9e3e7be74..833fb827a9 100644
+--- a/SecurityPkg/SecurityFixes.yaml
++++ b/SecurityPkg/SecurityFixes.yaml
+@@ -20,3 +20,17 @@ CVE_2022_36763:
+   - https://bugzilla.tianocore.org/show_bug.cgi?id=3D4117=0D
+   - https://bugzilla.tianocore.org/show_bug.cgi?id=3D2168=0D
+   - https://bugzilla.tianocore.org/show_bug.cgi?id=3D1990=0D
++CVE_2022_36764:=0D
++  commit_titles:=0D
++     - "SecurityPkg: DxeTpm2MeasureBootLib: SECURITY PATCH 4118 - CVE 202=
2-36764"=0D
++     - "SecurityPkg: DxeTpmMeasureBootLib: SECURITY PATCH 4118 - CVE 2022=
-36764"=0D
++     - "SecurityPkg: : Adding CVE 2022-36764 to SecurityFixes.yaml"=0D
++  cve: CVE-2022-36764=0D
++  date_reported: 2022-10-25 12:23 UTC=0D
++  description: Heap Buffer Overflow in Tcg2MeasurePeImage()=0D
++  note:=0D
++  files_impacted:=0D
++  - Library\DxeTpm2MeasureBootLib\DxeTpm2MeasureBootLib.c=0D
++  - Library\DxeTpmMeasureBootLib\DxeTpmMeasureBootLib.c=0D
++  links:=0D
++  - https://bugzilla.tianocore.org/show_bug.cgi?id=3D4118=0D
+--=20
+2.40.0
+
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ov=
mf_git.bb
index 78d86ad879..59e5598a1b 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -30,6 +30,9 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=
=3Dmaster;protocol=3Dhttps \
            file://CVE-2022-36763-0001.patch \
            file://CVE-2022-36763-0002.patch \
            file://CVE-2022-36763-0003.patch \
+           file://CVE-2022-36764-0001.patch \
+           file://CVE-2022-36764-0002.patch \
+           file://CVE-2022-36764-0003.patch \
            "
=20
 PV =3D "edk2-stable202202"
--=20
2.25.1


