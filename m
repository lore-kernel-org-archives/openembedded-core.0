Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E731E77171
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 17:54:25 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.21442.1733334857935476330
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 09:54:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NmXCx2zF;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7259d6ae0c8so64908b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 09:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733334857; x=1733939657; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GHHBq6LW7662Lqi7IhrQfz7pIJzu7gUGQuECWWgfG+k=;
        b=NmXCx2zFjW68lFphHj2uS4z+EJgI6qFTlX8lPxlmf+KbKLuWjO6frtagJODf1bGGGV
         W9WjUBs2V5Vn0uhjaHtW0rCbfL0UJnDzjvG664EnXc6p+GRcl1l+5tK+oiUBLqcfjkSa
         oW1zcsjObN7QOYDA9vjRPpCgyOSxyhl6Mn6I6Da3hi9AXcy/+z4xZn7BKIxKihfScdZI
         9QGCEiiFt0Uw8XoTlN2eL8n8JkpTN2qzjsG0CIMNaVtc0rMVx6IBFafsvQK9NzXy4ki9
         6JEcw/3Yk9TNfsXAibT1WNqm3de1CZTwcxV0pHraycvzLiC4xNCIZJYYMrmgtJX/Tj+z
         VRvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733334857; x=1733939657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GHHBq6LW7662Lqi7IhrQfz7pIJzu7gUGQuECWWgfG+k=;
        b=MpjWFzEtoKFVX75w/wCpwgjIPhdG+Qg6VDNo2DaK7FBSdCWD25tCyqDefDW5G/JwA9
         JGxXUv6j9oQFIoHNP+pOpcaNIxdhUPRXPWjaPH+ExYLO/vSaM3EsyUZpL5AS6ZCtzMaB
         MI3aMXlOa48poOhNc2Se+YNVSTYKlRE8tt2/aENYaal8lgM/VRXLfwbCtNjl/MYf1HYs
         G5Rjj5Zk3tab1KsVIrjdxzFz/E3LdMz4VP+4h1vv8y00IpDAleExCS3lG1ESrYaof3YM
         Y4IMNkEHvhbGz1CjK7Fv90JBo418R57gJ2YQw/mEL1kzVLWxHNAB3stMcdW84WorCIxM
         XW8g==
X-Gm-Message-State: AOJu0YxtJx0RJMJiiqqMmnjeDR+ucvUFJiu0IO1rMaljvPPTpVZhmCS6
	8rCDBurcTyDweN7LNUfHXAaJdFQFC0njlsOeA5pCllth/ckgGIYXkF+vAEJuFVq0bgMjhIpR6Zc
	h
X-Gm-Gg: ASbGncu+fvSitaSqJ6JT0APH5NryAuB9x+w1jvc/+utnSZR9tW3gnBZ+MzX3ef8ziCe
	0z/hVSjJ9a5KW8O6ztc0sjI7iEkIyRonm83zPGLL5isaJQD5mHCZj1PgfKrbOfHurF51sPFlx7o
	TyUigmt0mXNky0Tw09r9eCWR/OMQex31hv2mY3RzWkldHP0SKf5frei4/THiR1aBDrfRyWVH98l
	fil1hBhkzExXB3v2xYOsop0SXpbimXMTHTAVFo=
X-Google-Smtp-Source: AGHT+IHOjUlEeyW7KPFK09Qr7AAP2HFjXL6rETSGRnp5k/NALNplrfV4HkKbZOaUrZKEpnhjqtYuyA==
X-Received: by 2002:a05:6a00:3a05:b0:71e:47a2:676 with SMTP id d2e1a72fcca58-7257fa5f05amr10128833b3a.6.1733334856713;
        Wed, 04 Dec 2024 09:54:16 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c2d5af1sm11727765a12.16.2024.12.04.09.54.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 09:54:16 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/38] ovmf: Fix CVE-2022-36764
Date: Wed,  4 Dec 2024 09:53:29 -0800
Message-Id: <aba14824159e549fd77cb90e3a9a327c527b366f.1733334655.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733334655.git.steve@sakoman.com>
References: <cover.1733334655.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 17:54:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208285

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
2.34.1


