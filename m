Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19EA2C3DA4B
	for <webhook@archiver.kernel.org>; Thu, 11 Jul 2024 18:34:58 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web11.924.1720722894080440776
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jul 2024 11:34:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=GLX20Vfx;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.173, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e04196b7603so1198827276.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 11:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720722893; x=1721327693; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nJpT+Vb8Rc8NtCn6sXx+eArFcUaSAaf1pXX6RlLs6lQ=;
        b=GLX20VfxshYtuBnZb+YoI6szoUgWmHHg8kuxCMYpIf/mWRUNx6bLDbUbYdIHJ+ssVJ
         RHjBSFh+wXQTUlCAJVLlZtfLlqre0/9yTBN8QSTPblhEIhDOZluM92ugjeMmmpWVThMF
         mrmZgRnZz9DbR6U1zcw7NjTwW8L+XKZDn3JpzsTNEjA6nthMMdkBdHWZp+MZ2aRswJqg
         1G1Lasd49dgdZyyArXNNhfu7UE3GpfTFwVzu6s6rTU4EGShk0Vjr4zKdFLm2GR8sjtlu
         64uQukETgcx1rFYZy6rNCYtXukFJBEAnDx/fh3aeYJfqsS0JlYiY2WbrKxQLfxK5YuMB
         cXZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720722893; x=1721327693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nJpT+Vb8Rc8NtCn6sXx+eArFcUaSAaf1pXX6RlLs6lQ=;
        b=cfs2PIX4bz4XhQO31SabxZ1NNTcsjX4uQlflF1jlY0Kv6NSJG6rdAGnusD6gUc7/DH
         eBGNc5CT7X2Kt1s+3a3UL5niNntaQ+7XuqBZreoHGyrdxO8yX5ko3F9rMsbHXcyc9R4A
         jSLkfYY5+Ow14dORMunhF0Vje6B4ukk6fCOxOqGS5XFwRXyct2V1341L8O+XGH9sYcId
         NP/iQRY4F6pm2hN9mMLn/7QRPLSPFk5qVvJBS4BUhtUNPwOoS2Q0JNPVwhgIoQr6TGmG
         hM09gZe20yUQkSF8T9DANnYdGZ73QJYLmsCoIOEFoyPCynbmGSqOsev17+7Mw626WkJB
         oyWA==
X-Gm-Message-State: AOJu0YzdqSj/ObVlQF5K7C2DKNR9TntftJkQqxHzNuScI/NGfivMCWQk
	mLxWzsXWwTLa695ZWQo8xJ+D1r3Mdi4pdWwsrAA59heb34WBcQC7PJ08wx/mMHINXaZZdnD1ga4
	f/pjvL17KuWZDOEtjyeGMmtDaMQ76fVZKnRynRA==
X-Google-Smtp-Source: AGHT+IHGYR3UkLFjZt5rL2c4lHTmOCSLwnsveBXdTWtMWr1Ca+aFJ1j1WzZHlAvVClVXOCjCUmuyYi4ZZpFOb94FqoA=
X-Received: by 2002:a5b:1cd:0:b0:e02:b968:abaa with SMTP id
 3f1490d57ef6-e041b0586b5mr10408376276.18.1720722892220; Thu, 11 Jul 2024
 11:34:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240711045541.2155076-1-soumya.sambu@windriver.com>
In-Reply-To: <20240711045541.2155076-1-soumya.sambu@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 11 Jul 2024 11:34:40 -0700
Message-ID: <CAOSpxdarVffEO48reFmkKWUTs8btiNSTpkm80FAUFdYXMtMisw@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH 01/11] ovmf: Fix CVE-2022-36763
To: soumya.sambu@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 18:34:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201787

There appear to be line ending issues with all of the patches in this serie=
s:

ERROR: ovmf-edk2-stable202202-r0 do_patch: Applying patch
'CVE-2022-36763-0001.patch' on target directory
'/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/core2-64-poky-lin=
ux/ovmf/edk2-stable202202-r0/git'
CmdError('quilt --quiltrc
/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/core2-64-poky-linu=
x/ovmf/edk2-stable202202-r0/recipe-sysroot-native/etc/quiltrc
push', 0, 'stdout: Applying patch CVE-2022-36763-0001.patch
patching file SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootL=
ib.c
Hunk #1 FAILED at 20 (different line endings).
Hunk #2 FAILED at 44 (different line endings).
Hunk #3 FAILED at 144 (different line endings).
Hunk #4 FAILED at 195 (different line endings).
Hunk #5 FAILED at 223 (different line endings).
Hunk #6 FAILED at 248 (different line endings).
Hunk #7 FAILED at 310 (different line endings).
Hunk #8 FAILED at 326 (different line endings).
Hunk #9 FAILED at 443 (different line endings).
Hunk #10 FAILED at 515 (different line endings).
Hunk #11 FAILED at 646 (different line endings).
11 out of 11 hunks FAILED -- rejects in file
SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLib.c
patching file SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootL=
ib.inf
Hunk #1 FAILED at 37 (different line endings).
Hunk #2 FAILED at 46 (different line endings).
Hunk #3 FAILED at 65 (different line endings).
3 out of 3 hunks FAILED -- rejects in file
SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLib.inf
patching file SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootL=
ibSanitization.c
patching file SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootL=
ibSanitization.h
patching file SecurityPkg/Library/DxeTpm2MeasureBootLib/InternalUnitTest/Dx=
eTpm2MeasureBootLibSanitizationTest.c
patching file SecurityPkg/Library/DxeTpm2MeasureBootLib/InternalUnitTest/Dx=
eTpm2MeasureBootLibSanitizationTestHost.inf
patching file SecurityPkg/SecurityPkg.ci.yaml
Hunk #1 FAILED at 15 (different line endings).
1 out of 1 hunk FAILED -- rejects in file SecurityPkg/SecurityPkg.ci.yaml
Patch CVE-2022-36763-0001.patch does not apply (enforce with -f)

Steve

On Wed, Jul 10, 2024 at 9:56=E2=80=AFPM Soumya via lists.openembedded.org
<soumya.sambu=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Soumya Sambu <soumya.sambu@windriver.com>
>
> EDK2 is susceptible to a vulnerability in the Tcg2MeasureGptTable()
> function, allowing a user to trigger a heap buffer overflow via a local
> network. Successful exploitation of this vulnerability may result in a
> compromise of confidentiality, integrity, and/or availability.
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2022-36763
>
> Upstream-patches:
> https://github.com/tianocore/edk2/commit/224446543206450ddb5830e6abd026d6=
1d3c7f4b
> https://github.com/tianocore/edk2/commit/4776a1b39ee08fc45c70c1eab5a0195f=
325000d3
> https://github.com/tianocore/edk2/commit/1ddcb9fc6b4164e882687b031e8beacf=
cf7df29e
>
> Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
> ---
>  .../ovmf/ovmf/CVE-2022-36763-0001.patch       | 985 ++++++++++++++++++
>  .../ovmf/ovmf/CVE-2022-36763-0002.patch       | 889 ++++++++++++++++
>  .../ovmf/ovmf/CVE-2022-36763-0003.patch       |  55 +
>  meta/recipes-core/ovmf/ovmf_git.bb            |   3 +
>  4 files changed, 1932 insertions(+)
>  create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2022-36763-0001.patch
>  create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2022-36763-0002.patch
>  create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2022-36763-0003.patch
>
> diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2022-36763-0001.patch b/meta=
/recipes-core/ovmf/ovmf/CVE-2022-36763-0001.patch
> new file mode 100644
> index 0000000000..93cefe7740
> --- /dev/null
> +++ b/meta/recipes-core/ovmf/ovmf/CVE-2022-36763-0001.patch
> @@ -0,0 +1,985 @@
> +From 224446543206450ddb5830e6abd026d61d3c7f4b Mon Sep 17 00:00:00 2001
> +From: "Douglas Flick [MSFT]" <doug.edk2@gmail.com>
> +Date: Fri, 12 Jan 2024 02:16:01 +0800
> +Subject: [PATCH] SecurityPkg: DxeTpm2MeasureBootLib: SECURITY PATCH 4117=
 - CVE
> + 2022-36763
> +
> +This commit contains the patch files and tests for DxeTpm2MeasureBootLib
> +CVE 2022-36763.
> +
> +Cc: Jiewen Yao <jiewen.yao@intel.com>
> +
> +Signed-off-by: Doug Flick [MSFT] <doug.edk2@gmail.com>
> +
> +CVE: CVE-2022-36763
> +
> +Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/2244=
46543206450ddb5830e6abd026d61d3c7f4b]
> +
> +Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
> +---
> + .../DxeTpm2MeasureBootLib.c                   |  69 ++--
> + .../DxeTpm2MeasureBootLib.inf                 |   4 +-
> + .../DxeTpm2MeasureBootLibSanitization.c       | 275 ++++++++++++++++
> + .../DxeTpm2MeasureBootLibSanitization.h       | 113 +++++++
> + .../DxeTpm2MeasureBootLibSanitizationTest.c   | 303 ++++++++++++++++++
> + ...Tpm2MeasureBootLibSanitizationTestHost.inf |  28 ++
> + SecurityPkg/SecurityPkg.ci.yaml               |   1 +
> + 7 files changed, 763 insertions(+), 30 deletions(-)
> + create mode 100644 SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2Mea=
sureBootLibSanitization.c
> + create mode 100644 SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2Mea=
sureBootLibSanitization.h
> + create mode 100644 SecurityPkg/Library/DxeTpm2MeasureBootLib/InternalUn=
itTest/DxeTpm2MeasureBootLibSanitizationTest.c
> + create mode 100644 SecurityPkg/Library/DxeTpm2MeasureBootLib/InternalUn=
itTest/DxeTpm2MeasureBootLibSanitizationTestHost.inf
> +
> +diff --git a/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBoo=
tLib.c b/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLib.c
> +index 36a256a7af..0475103d6e 100644
> +--- a/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLib.c
> ++++ b/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLib.c
> +@@ -20,6 +20,8 @@ Copyright (c) 2013 - 2018, Intel Corporation. All righ=
ts reserved.<BR>
> + (C) Copyright 2015 Hewlett Packard Enterprise Development LP<BR>
> + SPDX-License-Identifier: BSD-2-Clause-Patent
> +
> ++Copyright (c) Microsoft Corporation.<BR>
> ++SPDX-License-Identifier: BSD-2-Clause-Patent
> + **/
> +
> + #include <PiDxe.h>
> +@@ -44,6 +46,8 @@ SPDX-License-Identifier: BSD-2-Clause-Patent
> + #include <Library/HobLib.h>
> + #include <Protocol/CcMeasurement.h>
> +
> ++#include "DxeTpm2MeasureBootLibSanitization.h"
> ++
> + typedef struct {
> +   EFI_TCG2_PROTOCOL              *Tcg2Protocol;
> +   EFI_CC_MEASUREMENT_PROTOCOL    *CcProtocol;
> +@@ -144,10 +148,11 @@ Tcg2MeasureGptTable (
> +   EFI_TCG2_EVENT               *Tcg2Event;
> +   EFI_CC_EVENT                 *CcEvent;
> +   EFI_GPT_DATA                 *GptData;
> +-  UINT32                       EventSize;
> ++  UINT32                       TcgEventSize;
> +   EFI_TCG2_PROTOCOL            *Tcg2Protocol;
> +   EFI_CC_MEASUREMENT_PROTOCOL  *CcProtocol;
> +   EFI_CC_MR_INDEX              MrIndex;
> ++  UINT32                       AllocSize;
> +
> +   if (mTcg2MeasureGptCount > 0) {
> +     return EFI_SUCCESS;
> +@@ -195,25 +200,22 @@ Tcg2MeasureGptTable (
> +                      BlockIo->Media->BlockSize,
> +                      (UINT8 *)PrimaryHeader
> +                      );
> +-  if (EFI_ERROR (Status)) {
> +-    DEBUG ((DEBUG_ERROR, "Failed to Read Partition Table Header!\n"));
> ++  if (EFI_ERROR (Status) || EFI_ERROR (SanitizeEfiPartitionTableHeader =
(PrimaryHeader, BlockIo))) {
> ++    DEBUG ((DEBUG_ERROR, "Failed to read Partition Table Header or inva=
lid Partition Table Header!\n"));
> +     FreePool (PrimaryHeader);
> +     return EFI_DEVICE_ERROR;
> +   }
> +
> +   //
> +-  // PrimaryHeader->SizeOfPartitionEntry should not be zero
> ++  // Read the partition entry.
> +   //
> +-  if (PrimaryHeader->SizeOfPartitionEntry =3D=3D 0) {
> +-    DEBUG ((DEBUG_ERROR, "SizeOfPartitionEntry should not be zero!\n"))=
;
> ++  Status =3D SanitizePrimaryHeaderAllocationSize (PrimaryHeader, &Alloc=
Size);
> ++  if (EFI_ERROR (Status)) {
> +     FreePool (PrimaryHeader);
> +     return EFI_BAD_BUFFER_SIZE;
> +   }
> +
> +-  //
> +-  // Read the partition entry.
> +-  //
> +-  EntryPtr =3D (UINT8 *)AllocatePool (PrimaryHeader->NumberOfPartitionE=
ntries * PrimaryHeader->SizeOfPartitionEntry);
> ++  EntryPtr =3D (UINT8 *)AllocatePool (AllocSize);
> +   if (EntryPtr =3D=3D NULL) {
> +     FreePool (PrimaryHeader);
> +     return EFI_OUT_OF_RESOURCES;
> +@@ -223,7 +225,7 @@ Tcg2MeasureGptTable (
> +                      DiskIo,
> +                      BlockIo->Media->MediaId,
> +                      MultU64x32 (PrimaryHeader->PartitionEntryLBA, Bloc=
kIo->Media->BlockSize),
> +-                     PrimaryHeader->NumberOfPartitionEntries * PrimaryH=
eader->SizeOfPartitionEntry,
> ++                     AllocSize,
> +                      EntryPtr
> +                      );
> +   if (EFI_ERROR (Status)) {
> +@@ -248,16 +250,21 @@ Tcg2MeasureGptTable (
> +   //
> +   // Prepare Data for Measurement (CcProtocol and Tcg2Protocol)
> +   //
> +-  EventSize =3D (UINT32)(sizeof (EFI_GPT_DATA) - sizeof (GptData->Parti=
tions)
> +-                       + NumberOfPartition * PrimaryHeader->SizeOfParti=
tionEntry);
> +-  EventPtr =3D (UINT8 *)AllocateZeroPool (EventSize + sizeof (EFI_TCG2_=
EVENT) - sizeof (Tcg2Event->Event));
> ++  Status =3D SanitizePrimaryHeaderGptEventSize (PrimaryHeader, NumberOf=
Partition, &TcgEventSize);
> ++  if (EFI_ERROR (Status)) {
> ++    FreePool (PrimaryHeader);
> ++    FreePool (EntryPtr);
> ++    return EFI_DEVICE_ERROR;
> ++  }
> ++
> ++  EventPtr =3D (UINT8 *)AllocateZeroPool (TcgEventSize);
> +   if (EventPtr =3D=3D NULL) {
> +     Status =3D EFI_OUT_OF_RESOURCES;
> +     goto Exit;
> +   }
> +
> +   Tcg2Event                       =3D (EFI_TCG2_EVENT *)EventPtr;
> +-  Tcg2Event->Size                 =3D EventSize + sizeof (EFI_TCG2_EVEN=
T) - sizeof (Tcg2Event->Event);
> ++  Tcg2Event->Size                 =3D TcgEventSize;
> +   Tcg2Event->Header.HeaderSize    =3D sizeof (EFI_TCG2_EVENT_HEADER);
> +   Tcg2Event->Header.HeaderVersion =3D EFI_TCG2_EVENT_HEADER_VERSION;
> +   Tcg2Event->Header.PCRIndex      =3D 5;
> +@@ -310,7 +317,7 @@ Tcg2MeasureGptTable (
> +                                             CcProtocol,
> +                                             0,
> +                                             (EFI_PHYSICAL_ADDRESS)(UINT=
N)(VOID *)GptData,
> +-                                            (UINT64)EventSize,
> ++                                            (UINT64)TcgEventSize - OFFS=
ET_OF (EFI_TCG2_EVENT, Event),
> +                                             CcEvent
> +                                             );
> +     if (!EFI_ERROR (Status)) {
> +@@ -326,7 +333,7 @@ Tcg2MeasureGptTable (
> +                              Tcg2Protocol,
> +                              0,
> +                              (EFI_PHYSICAL_ADDRESS)(UINTN)(VOID *)GptDa=
ta,
> +-                             (UINT64)EventSize,
> ++                             (UINT64)TcgEventSize -  OFFSET_OF (EFI_TCG=
2_EVENT, Event),
> +                              Tcg2Event
> +                              );
> +     if (!EFI_ERROR (Status)) {
> +@@ -443,11 +450,13 @@ Tcg2MeasurePeImage (
> +       Tcg2Event->Header.PCRIndex  =3D 2;
> +       break;
> +     default:
> +-      DEBUG ((
> +-        DEBUG_ERROR,
> +-        "Tcg2MeasurePeImage: Unknown subsystem type %d",
> +-        ImageType
> +-        ));
> ++      DEBUG (
> ++        (
> ++         DEBUG_ERROR,
> ++         "Tcg2MeasurePeImage: Unknown subsystem type %d",
> ++         ImageType
> ++        )
> ++        );
> +       goto Finish;
> +   }
> +
> +@@ -515,7 +524,7 @@ Finish:
> +
> +   @param  MeasureBootProtocols  Pointer to the located measure boot pro=
tocol instances.
> +
> +-  @retval EFI_SUCCESS           Sucessfully locate the measure boot pro=
tocol instances (at least one instance).
> ++  @retval EFI_SUCCESS           Successfully locate the measure boot pr=
otocol instances (at least one instance).
> +   @retval EFI_UNSUPPORTED       Measure boot is not supported.
> + **/
> + EFI_STATUS
> +@@ -646,12 +655,14 @@ DxeTpm2MeasureBootHandler (
> +     return EFI_SUCCESS;
> +   }
> +
> +-  DEBUG ((
> +-    DEBUG_INFO,
> +-    "Tcg2Protocol =3D %p, CcMeasurementProtocol =3D %p\n",
> +-    MeasureBootProtocols.Tcg2Protocol,
> +-    MeasureBootProtocols.CcProtocol
> +-    ));
> ++  DEBUG (
> ++    (
> ++     DEBUG_INFO,
> ++     "Tcg2Protocol =3D %p, CcMeasurementProtocol =3D %p\n",
> ++     MeasureBootProtocols.Tcg2Protocol,
> ++     MeasureBootProtocols.CcProtocol
> ++    )
> ++    );
> +
> +   //
> +   // Copy File Device Path
> +diff --git a/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBoo=
tLib.inf b/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLib.=
inf
> +index 6dca79a20c..28995f438d 100644
> +--- a/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLib.in=
f
> ++++ b/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLib.in=
f
> +@@ -37,6 +37,8 @@
> +
> + [Sources]
> +   DxeTpm2MeasureBootLib.c
> ++  DxeTpm2MeasureBootLibSanitization.c
> ++  DxeTpm2MeasureBootLibSanitization.h
> +
> + [Packages]
> +   MdePkg/MdePkg.dec
> +@@ -46,6 +48,7 @@
> +
> + [LibraryClasses]
> +   BaseMemoryLib
> ++  SafeIntLib
> +   DebugLib
> +   MemoryAllocationLib
> +   DevicePathLib
> +@@ -65,4 +68,3 @@
> +   gEfiFirmwareVolumeBlockProtocolGuid   ## SOMETIMES_CONSUMES
> +   gEfiBlockIoProtocolGuid               ## SOMETIMES_CONSUMES
> +   gEfiDiskIoProtocolGuid                ## SOMETIMES_CONSUMES
> +-
> +diff --git a/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBoo=
tLibSanitization.c b/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2Measu=
reBootLibSanitization.c
> +new file mode 100644
> +index 0000000000..e2309655d3
> +--- /dev/null
> ++++ b/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLibSan=
itization.c
> +@@ -0,0 +1,275 @@
> ++/** @file
> ++  The library instance provides security service of TPM2 measure boot a=
nd
> ++  Confidential Computing (CC) measure boot.
> ++
> ++  Caution: This file requires additional review when modified.
> ++  This library will have external input - PE/COFF image and GPT partiti=
on.
> ++  This external input must be validated carefully to avoid security iss=
ue like
> ++  buffer overflow, integer overflow.
> ++
> ++  This file will pull out the validation logic from the following funct=
ions, in an
> ++  attempt to validate the untrusted input in the form of unit tests
> ++
> ++  These are those functions:
> ++
> ++  DxeTpm2MeasureBootLibImageRead() function will make sure the PE/COFF =
image content
> ++  read is within the image buffer.
> ++
> ++  Tcg2MeasureGptTable() function will receive untrusted GPT partition t=
able, and parse
> ++  partition data carefully.
> ++
> ++  Copyright (c) Microsoft Corporation.<BR>
> ++  SPDX-License-Identifier: BSD-2-Clause-Patent
> ++**/
> ++#include <Uefi.h>
> ++#include <Uefi/UefiSpec.h>
> ++#include <Library/SafeIntLib.h>
> ++#include <Library/UefiLib.h>
> ++#include <Library/DebugLib.h>
> ++#include <Library/BaseLib.h>
> ++#include <IndustryStandard/UefiTcgPlatform.h>
> ++#include <Protocol/BlockIo.h>
> ++#include <Library/MemoryAllocationLib.h>
> ++
> ++#include "DxeTpm2MeasureBootLibSanitization.h"
> ++
> ++#define GPT_HEADER_REVISION_V1  0x00010000
> ++
> ++/**
> ++  This function will validate the EFI_PARTITION_TABLE_HEADER structure =
is safe to parse
> ++  However this function will not attempt to verify the validity of the =
GPT partition
> ++  It will check the following:
> ++    - Signature
> ++    - Revision
> ++    - AlternateLBA
> ++    - FirstUsableLBA
> ++    - LastUsableLBA
> ++    - PartitionEntryLBA
> ++    - NumberOfPartitionEntries
> ++    - SizeOfPartitionEntry
> ++    - BlockIo
> ++
> ++  @param[in] PrimaryHeader
> ++    Pointer to the EFI_PARTITION_TABLE_HEADER structure.
> ++
> ++  @param[in] BlockIo
> ++    Pointer to the EFI_BLOCK_IO_PROTOCOL structure.
> ++
> ++  @retval EFI_SUCCESS
> ++    The EFI_PARTITION_TABLE_HEADER structure is valid.
> ++
> ++  @retval EFI_INVALID_PARAMETER
> ++    The EFI_PARTITION_TABLE_HEADER structure is invalid.
> ++**/
> ++EFI_STATUS
> ++EFIAPI
> ++SanitizeEfiPartitionTableHeader (
> ++  IN CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,
> ++  IN CONST EFI_BLOCK_IO_PROTOCOL       *BlockIo
> ++  )
> ++{
> ++  //
> ++  // Verify that the input parameters are safe to use
> ++  //
> ++  if (PrimaryHeader =3D=3D NULL) {
> ++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header!\n"));
> ++    return EFI_INVALID_PARAMETER;
> ++  }
> ++
> ++  if ((BlockIo =3D=3D NULL) || (BlockIo->Media =3D=3D NULL)) {
> ++    DEBUG ((DEBUG_ERROR, "Invalid BlockIo!\n"));
> ++    return EFI_INVALID_PARAMETER;
> ++  }
> ++
> ++  //
> ++  // The signature must be EFI_PTAB_HEADER_ID ("EFI PART" in ASCII)
> ++  //
> ++  if (PrimaryHeader->Header.Signature !=3D EFI_PTAB_HEADER_ID) {
> ++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header!\n"));
> ++    return EFI_DEVICE_ERROR;
> ++  }
> ++
> ++  //
> ++  // The version must be GPT_HEADER_REVISION_V1 (0x00010000)
> ++  //
> ++  if (PrimaryHeader->Header.Revision !=3D GPT_HEADER_REVISION_V1) {
> ++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header Revision!\n"))=
;
> ++    return EFI_DEVICE_ERROR;
> ++  }
> ++
> ++  //
> ++  // The HeaderSize must be greater than or equal to 92 and must be les=
s than or equal to the logical block size
> ++  //
> ++  if ((PrimaryHeader->Header.HeaderSize < sizeof (EFI_PARTITION_TABLE_H=
EADER)) || (PrimaryHeader->Header.HeaderSize > BlockIo->Media->BlockSize)) =
{
> ++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header HeaderSize!\n"=
));
> ++    return EFI_DEVICE_ERROR;
> ++  }
> ++
> ++  //
> ++  // The partition entries should all be before the first usable block
> ++  //
> ++  if (PrimaryHeader->FirstUsableLBA <=3D PrimaryHeader->PartitionEntryL=
BA) {
> ++    DEBUG ((DEBUG_ERROR, "GPT PartitionEntryLBA is not less than FirstU=
sableLBA!\n"));
> ++    return EFI_DEVICE_ERROR;
> ++  }
> ++
> ++  //
> ++  // Check that the PartitionEntryLBA greater than the Max LBA
> ++  // This will be used later for multiplication
> ++  //
> ++  if (PrimaryHeader->PartitionEntryLBA > DivU64x32 (MAX_UINT64, BlockIo=
->Media->BlockSize)) {
> ++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header PartitionEntry=
LBA!\n"));
> ++    return EFI_DEVICE_ERROR;
> ++  }
> ++
> ++  //
> ++  // Check that the number of partition entries is greater than zero
> ++  //
> ++  if (PrimaryHeader->NumberOfPartitionEntries =3D=3D 0) {
> ++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header NumberOfPartit=
ionEntries!\n"));
> ++    return EFI_DEVICE_ERROR;
> ++  }
> ++
> ++  //
> ++  // SizeOfPartitionEntry must be 128, 256, 512... improper size may le=
ad to accessing uninitialized memory
> ++  //
> ++  if ((PrimaryHeader->SizeOfPartitionEntry < 128) || ((PrimaryHeader->S=
izeOfPartitionEntry & (PrimaryHeader->SizeOfPartitionEntry - 1)) !=3D 0)) {
> ++    DEBUG ((DEBUG_ERROR, "SizeOfPartitionEntry shall be set to a value =
of 128 x 2^n where n is an integer greater than or equal to zero (e.g., 128=
, 256, 512, etc.)!\n"));
> ++    return EFI_DEVICE_ERROR;
> ++  }
> ++
> ++  //
> ++  // This check is to prevent overflow when calculating the allocation =
size for the partition entries
> ++  // This check will be used later for multiplication
> ++  //
> ++  if (PrimaryHeader->NumberOfPartitionEntries > DivU64x32 (MAX_UINT64, =
PrimaryHeader->SizeOfPartitionEntry)) {
> ++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header NumberOfPartit=
ionEntries!\n"));
> ++    return EFI_DEVICE_ERROR;
> ++  }
> ++
> ++  return EFI_SUCCESS;
> ++}
> ++
> ++/**
> ++  This function will validate that the allocation size from the primary=
 header is sane
> ++  It will check the following:
> ++    - AllocationSize does not overflow
> ++
> ++  @param[in] PrimaryHeader
> ++    Pointer to the EFI_PARTITION_TABLE_HEADER structure.
> ++
> ++  @param[out] AllocationSize
> ++    Pointer to the allocation size.
> ++
> ++  @retval EFI_SUCCESS
> ++    The allocation size is valid.
> ++
> ++  @retval EFI_OUT_OF_RESOURCES
> ++    The allocation size is invalid.
> ++**/
> ++EFI_STATUS
> ++EFIAPI
> ++SanitizePrimaryHeaderAllocationSize (
> ++  IN CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,
> ++  OUT UINT32                           *AllocationSize
> ++  )
> ++{
> ++  EFI_STATUS  Status;
> ++
> ++  if (PrimaryHeader =3D=3D NULL) {
> ++    return EFI_INVALID_PARAMETER;
> ++  }
> ++
> ++  if (AllocationSize =3D=3D NULL) {
> ++    return EFI_INVALID_PARAMETER;
> ++  }
> ++
> ++  //
> ++  // Replacing logic:
> ++  // PrimaryHeader->NumberOfPartitionEntries * PrimaryHeader->SizeOfPar=
titionEntry;
> ++  //
> ++  Status =3D SafeUint32Mult (PrimaryHeader->NumberOfPartitionEntries, P=
rimaryHeader->SizeOfPartitionEntry, AllocationSize);
> ++  if (EFI_ERROR (Status)) {
> ++    DEBUG ((DEBUG_ERROR, "Allocation Size would have overflowed!\n"));
> ++    return EFI_BAD_BUFFER_SIZE;
> ++  }
> ++
> ++  return EFI_SUCCESS;
> ++}
> ++
> ++/**
> ++  This function will validate that the Gpt Event Size calculated from t=
he primary header is sane
> ++  It will check the following:
> ++    - EventSize does not overflow
> ++
> ++  Important: This function includes the entire length of the allocated =
space, including
> ++  (sizeof (EFI_TCG2_EVENT) - sizeof (Tcg2Event->Event)) . When hashing =
the buffer allocated with this
> ++  size, the caller must subtract the size of the (sizeof (EFI_TCG2_EVEN=
T) - sizeof (Tcg2Event->Event))
> ++  from the size of the buffer before hashing.
> ++
> ++  @param[in] PrimaryHeader - Pointer to the EFI_PARTITION_TABLE_HEADER =
structure.
> ++  @param[in] NumberOfPartition - Number of partitions.
> ++  @param[out] EventSize - Pointer to the event size.
> ++
> ++  @retval EFI_SUCCESS
> ++    The event size is valid.
> ++
> ++  @retval EFI_OUT_OF_RESOURCES
> ++    Overflow would have occurred.
> ++
> ++  @retval EFI_INVALID_PARAMETER
> ++    One of the passed parameters was invalid.
> ++**/
> ++EFI_STATUS
> ++SanitizePrimaryHeaderGptEventSize (
> ++  IN  CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,
> ++  IN  UINTN                             NumberOfPartition,
> ++  OUT UINT32                            *EventSize
> ++  )
> ++{
> ++  EFI_STATUS  Status;
> ++  UINT32      SafeNumberOfPartitions;
> ++
> ++  if (PrimaryHeader =3D=3D NULL) {
> ++    return EFI_INVALID_PARAMETER;
> ++  }
> ++
> ++  if (EventSize =3D=3D NULL) {
> ++    return EFI_INVALID_PARAMETER;
> ++  }
> ++
> ++  //
> ++  // We shouldn't even attempt to perform the multiplication if the num=
ber of partitions is greater than the maximum value of UINT32
> ++  //
> ++  Status =3D SafeUintnToUint32 (NumberOfPartition, &SafeNumberOfPartiti=
ons);
> ++  if (EFI_ERROR (Status)) {
> ++    DEBUG ((DEBUG_ERROR, "NumberOfPartition would have overflowed!\n"))=
;
> ++    return EFI_INVALID_PARAMETER;
> ++  }
> ++
> ++  //
> ++  // Replacing logic:
> ++  // (UINT32)(sizeof (EFI_GPT_DATA) - sizeof (GptData->Partitions) + Nu=
mberOfPartition * PrimaryHeader.SizeOfPartitionEntry);
> ++  //
> ++  Status =3D SafeUint32Mult (SafeNumberOfPartitions, PrimaryHeader->Siz=
eOfPartitionEntry, EventSize);
> ++  if (EFI_ERROR (Status)) {
> ++    DEBUG ((DEBUG_ERROR, "Event Size would have overflowed!\n"));
> ++    return EFI_BAD_BUFFER_SIZE;
> ++  }
> ++
> ++  //
> ++  // Replacing logic:
> ++  // *EventSize + sizeof (EFI_TCG2_EVENT) - sizeof (Tcg2Event->Event);
> ++  //
> ++  Status =3D SafeUint32Add (
> ++             OFFSET_OF (EFI_TCG2_EVENT, Event) + OFFSET_OF (EFI_GPT_DAT=
A, Partitions),
> ++             *EventSize,
> ++             EventSize
> ++             );
> ++  if (EFI_ERROR (Status)) {
> ++    DEBUG ((DEBUG_ERROR, "Event Size would have overflowed because of G=
PTData!\n"));
> ++    return EFI_BAD_BUFFER_SIZE;
> ++  }
> ++
> ++  return EFI_SUCCESS;
> ++}
> +diff --git a/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBoo=
tLibSanitization.h b/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2Measu=
reBootLibSanitization.h
> +new file mode 100644
> +index 0000000000..048b738987
> +--- /dev/null
> ++++ b/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLibSan=
itization.h
> +@@ -0,0 +1,113 @@
> ++/** @file
> ++  This file includes the function prototypes for the sanitization funct=
ions.
> ++
> ++  These are those functions:
> ++
> ++  DxeTpm2MeasureBootLibImageRead() function will make sure the PE/COFF =
image content
> ++  read is within the image buffer.
> ++
> ++  Tcg2MeasureGptTable() function will receive untrusted GPT partition t=
able, and parse
> ++  partition data carefully.
> ++
> ++  Copyright (c) Microsoft Corporation.<BR>
> ++  SPDX-License-Identifier: BSD-2-Clause-Patent
> ++
> ++**/
> ++
> ++#ifndef DXE_TPM2_MEASURE_BOOT_LIB_SANITATION_
> ++#define DXE_TPM2_MEASURE_BOOT_LIB_SANITATION_
> ++
> ++#include <Uefi.h>
> ++#include <Uefi/UefiSpec.h>
> ++#include <Protocol/BlockIo.h>
> ++#include <IndustryStandard/UefiTcgPlatform.h>
> ++#include <Protocol/Tcg2Protocol.h>
> ++
> ++/**
> ++  This function will validate the EFI_PARTITION_TABLE_HEADER structure =
is safe to parse
> ++  However this function will not attempt to verify the validity of the =
GPT partition
> ++  It will check the following:
> ++    - Signature
> ++    - Revision
> ++    - AlternateLBA
> ++    - FirstUsableLBA
> ++    - LastUsableLBA
> ++    - PartitionEntryLBA
> ++    - NumberOfPartitionEntries
> ++    - SizeOfPartitionEntry
> ++    - BlockIo
> ++
> ++  @param[in] PrimaryHeader
> ++    Pointer to the EFI_PARTITION_TABLE_HEADER structure.
> ++
> ++  @param[in] BlockIo
> ++    Pointer to the EFI_BLOCK_IO_PROTOCOL structure.
> ++
> ++  @retval EFI_SUCCESS
> ++    The EFI_PARTITION_TABLE_HEADER structure is valid.
> ++
> ++  @retval EFI_INVALID_PARAMETER
> ++    The EFI_PARTITION_TABLE_HEADER structure is invalid.
> ++**/
> ++EFI_STATUS
> ++EFIAPI
> ++SanitizeEfiPartitionTableHeader (
> ++  IN CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,
> ++  IN CONST EFI_BLOCK_IO_PROTOCOL       *BlockIo
> ++  );
> ++
> ++/**
> ++  This function will validate that the allocation size from the primary=
 header is sane
> ++  It will check the following:
> ++    - AllocationSize does not overflow
> ++
> ++  @param[in] PrimaryHeader
> ++    Pointer to the EFI_PARTITION_TABLE_HEADER structure.
> ++
> ++  @param[out] AllocationSize
> ++    Pointer to the allocation size.
> ++
> ++  @retval EFI_SUCCESS
> ++    The allocation size is valid.
> ++
> ++  @retval EFI_OUT_OF_RESOURCES
> ++    The allocation size is invalid.
> ++**/
> ++EFI_STATUS
> ++EFIAPI
> ++SanitizePrimaryHeaderAllocationSize (
> ++  IN CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,
> ++  OUT UINT32                           *AllocationSize
> ++  );
> ++
> ++/**
> ++  This function will validate that the Gpt Event Size calculated from t=
he primary header is sane
> ++  It will check the following:
> ++    - EventSize does not overflow
> ++
> ++  Important: This function includes the entire length of the allocated =
space, including
> ++  (sizeof (EFI_TCG2_EVENT) - sizeof (Tcg2Event->Event)) . When hashing =
the buffer allocated with this
> ++  size, the caller must subtract the size of the (sizeof (EFI_TCG2_EVEN=
T) - sizeof (Tcg2Event->Event))
> ++  from the size of the buffer before hashing.
> ++
> ++  @param[in] PrimaryHeader - Pointer to the EFI_PARTITION_TABLE_HEADER =
structure.
> ++  @param[in] NumberOfPartition - Number of partitions.
> ++  @param[out] EventSize - Pointer to the event size.
> ++
> ++  @retval EFI_SUCCESS
> ++    The event size is valid.
> ++
> ++  @retval EFI_OUT_OF_RESOURCES
> ++    Overflow would have occurred.
> ++
> ++  @retval EFI_INVALID_PARAMETER
> ++    One of the passed parameters was invalid.
> ++**/
> ++EFI_STATUS
> ++SanitizePrimaryHeaderGptEventSize (
> ++  IN  CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,
> ++  IN  UINTN                             NumberOfPartition,
> ++  OUT UINT32                            *EventSize
> ++  );
> ++
> ++#endif // DXE_TPM2_MEASURE_BOOT_LIB_SANITATION_
> +diff --git a/SecurityPkg/Library/DxeTpm2MeasureBootLib/InternalUnitTest/=
DxeTpm2MeasureBootLibSanitizationTest.c b/SecurityPkg/Library/DxeTpm2Measur=
eBootLib/InternalUnitTest/DxeTpm2MeasureBootLibSanitizationTest.c
> +new file mode 100644
> +index 0000000000..3eb9763e3c
> +--- /dev/null
> ++++ b/SecurityPkg/Library/DxeTpm2MeasureBootLib/InternalUnitTest/DxeTpm2=
MeasureBootLibSanitizationTest.c
> +@@ -0,0 +1,303 @@
> ++/** @file
> ++  This file includes the unit test cases for the DxeTpm2MeasureBootLibS=
anitizationTest.c.
> ++
> ++  Copyright (c) Microsoft Corporation.<BR>
> ++  SPDX-License-Identifier: BSD-2-Clause-Patent
> ++**/
> ++
> ++#include <Uefi.h>
> ++#include <Library/UefiLib.h>
> ++#include <Library/DebugLib.h>
> ++#include <Library/UnitTestLib.h>
> ++#include <Protocol/BlockIo.h>
> ++#include <Library/MemoryAllocationLib.h>
> ++#include <Library/BaseMemoryLib.h>
> ++#include <IndustryStandard/UefiTcgPlatform.h>
> ++#include <Protocol/Tcg2Protocol.h>
> ++
> ++#include "../DxeTpm2MeasureBootLibSanitization.h"
> ++
> ++#define UNIT_TEST_NAME     "DxeTpm2MeasureBootLibSanitizationTest"
> ++#define UNIT_TEST_VERSION  "1.0"
> ++
> ++#define DEFAULT_PRIMARY_TABLE_HEADER_REVISION                     0x000=
10000
> ++#define DEFAULT_PRIMARY_TABLE_HEADER_NUMBER_OF_PARTITION_ENTRIES  1
> ++#define DEFAULT_PRIMARY_TABLE_HEADER_SIZE_OF_PARTITION_ENTRY      128
> ++
> ++/**
> ++  This function tests the SanitizeEfiPartitionTableHeader function.
> ++  It's intent is to test that a malicious EFI_PARTITION_TABLE_HEADER
> ++  structure will not cause undefined or unexpected behavior.
> ++
> ++  In general the TPM should still be able to measure the data, but
> ++  be the header should be sanitized to prevent any unexpected behavior.
> ++
> ++  @param[in] Context  The unit test context.
> ++
> ++  @retval UNIT_TEST_PASSED  The test passed.
> ++  @retval UNIT_TEST_ERROR_TEST_FAILED  The test failed.
> ++**/
> ++UNIT_TEST_STATUS
> ++EFIAPI
> ++TestSanitizeEfiPartitionTableHeader (
> ++  IN UNIT_TEST_CONTEXT  Context
> ++  )
> ++{
> ++  EFI_STATUS                  Status;
> ++  EFI_PARTITION_TABLE_HEADER  PrimaryHeader;
> ++  EFI_BLOCK_IO_PROTOCOL       BlockIo;
> ++  EFI_BLOCK_IO_MEDIA          BlockMedia;
> ++
> ++  // Generate EFI_BLOCK_IO_MEDIA test data
> ++  BlockMedia.MediaId          =3D 1;
> ++  BlockMedia.RemovableMedia   =3D FALSE;
> ++  BlockMedia.MediaPresent     =3D TRUE;
> ++  BlockMedia.LogicalPartition =3D FALSE;
> ++  BlockMedia.ReadOnly         =3D FALSE;
> ++  BlockMedia.WriteCaching     =3D FALSE;
> ++  BlockMedia.BlockSize        =3D 512;
> ++  BlockMedia.IoAlign          =3D 1;
> ++  BlockMedia.LastBlock        =3D 0;
> ++
> ++  // Generate EFI_BLOCK_IO_PROTOCOL test data
> ++  BlockIo.Revision    =3D 1;
> ++  BlockIo.Media       =3D &BlockMedia;
> ++  BlockIo.Reset       =3D NULL;
> ++  BlockIo.ReadBlocks  =3D NULL;
> ++  BlockIo.WriteBlocks =3D NULL;
> ++  BlockIo.FlushBlocks =3D NULL;
> ++
> ++  // Geneate EFI_PARTITION_TABLE_HEADER test data
> ++  PrimaryHeader.Header.Signature         =3D EFI_PTAB_HEADER_ID;
> ++  PrimaryHeader.Header.Revision          =3D DEFAULT_PRIMARY_TABLE_HEAD=
ER_REVISION;
> ++  PrimaryHeader.Header.HeaderSize        =3D sizeof (EFI_PARTITION_TABL=
E_HEADER);
> ++  PrimaryHeader.MyLBA                    =3D 1;
> ++  PrimaryHeader.AlternateLBA             =3D 2;
> ++  PrimaryHeader.FirstUsableLBA           =3D 3;
> ++  PrimaryHeader.LastUsableLBA            =3D 4;
> ++  PrimaryHeader.PartitionEntryLBA        =3D 5;
> ++  PrimaryHeader.NumberOfPartitionEntries =3D DEFAULT_PRIMARY_TABLE_HEAD=
ER_NUMBER_OF_PARTITION_ENTRIES;
> ++  PrimaryHeader.SizeOfPartitionEntry     =3D DEFAULT_PRIMARY_TABLE_HEAD=
ER_SIZE_OF_PARTITION_ENTRY;
> ++  PrimaryHeader.PartitionEntryArrayCRC32 =3D 0; // Purposely invalid
> ++
> ++  // Calculate the CRC32 of the PrimaryHeader
> ++  PrimaryHeader.Header.CRC32 =3D CalculateCrc32 ((UINT8 *)&PrimaryHeade=
r, PrimaryHeader.Header.HeaderSize);
> ++
> ++  // Test that a normal PrimaryHeader passes validation
> ++  Status =3D SanitizeEfiPartitionTableHeader (&PrimaryHeader, &BlockIo)=
;
> ++  UT_ASSERT_NOT_EFI_ERROR (Status);
> ++
> ++  // Test that when number of partition entries is 0, the function retu=
rns EFI_DEVICE_ERROR
> ++  // Should print "Invalid Partition Table Header NumberOfPartitionEntr=
ies!""
> ++  PrimaryHeader.NumberOfPartitionEntries =3D 0;
> ++  Status                                 =3D SanitizeEfiPartitionTableH=
eader (&PrimaryHeader, &BlockIo);
> ++  UT_ASSERT_EQUAL (Status, EFI_DEVICE_ERROR);
> ++  PrimaryHeader.NumberOfPartitionEntries =3D DEFAULT_PRIMARY_TABLE_HEAD=
ER_SIZE_OF_PARTITION_ENTRY;
> ++
> ++  // Test that when the header size is too small, the function returns =
EFI_DEVICE_ERROR
> ++  // Should print "Invalid Partition Table Header Size!"
> ++  PrimaryHeader.Header.HeaderSize =3D 0;
> ++  Status                          =3D SanitizeEfiPartitionTableHeader (=
&PrimaryHeader, &BlockIo);
> ++  UT_ASSERT_EQUAL (Status, EFI_DEVICE_ERROR);
> ++  PrimaryHeader.Header.HeaderSize =3D sizeof (EFI_PARTITION_TABLE_HEADE=
R);
> ++
> ++  // Test that when the SizeOfPartitionEntry is too small, the function=
 returns EFI_DEVICE_ERROR
> ++  // should print: "SizeOfPartitionEntry shall be set to a value of 128=
 x 2^n where n is an integer greater than or equal to zero (e.g., 128, 256,=
 512, etc.)!"
> ++  PrimaryHeader.SizeOfPartitionEntry =3D 1;
> ++  Status                             =3D SanitizeEfiPartitionTableHeade=
r (&PrimaryHeader, &BlockIo);
> ++  UT_ASSERT_EQUAL (Status, EFI_DEVICE_ERROR);
> ++
> ++  DEBUG ((DEBUG_INFO, "%a: Test passed\n", __func__));
> ++
> ++  return UNIT_TEST_PASSED;
> ++}
> ++
> ++/**
> ++  This function tests the SanitizePrimaryHeaderAllocationSize function.
> ++  It's intent is to test that the untrusted input from a EFI_PARTITION_=
TABLE_HEADER
> ++  structure will not cause an overflow when calculating the allocation =
size.
> ++
> ++  @param[in] Context  The unit test context.
> ++
> ++  @retval UNIT_TEST_PASSED  The test passed.
> ++  @retval UNIT_TEST_ERROR_TEST_FAILED  The test failed.
> ++**/
> ++UNIT_TEST_STATUS
> ++EFIAPI
> ++TestSanitizePrimaryHeaderAllocationSize (
> ++  IN UNIT_TEST_CONTEXT  Context
> ++  )
> ++{
> ++  UINT32  AllocationSize;
> ++
> ++  EFI_STATUS                  Status;
> ++  EFI_PARTITION_TABLE_HEADER  PrimaryHeader;
> ++
> ++  // Test that a normal PrimaryHeader passes validation
> ++  PrimaryHeader.NumberOfPartitionEntries =3D 5;
> ++  PrimaryHeader.SizeOfPartitionEntry     =3D DEFAULT_PRIMARY_TABLE_HEAD=
ER_SIZE_OF_PARTITION_ENTRY;
> ++
> ++  Status =3D SanitizePrimaryHeaderAllocationSize (&PrimaryHeader, &Allo=
cationSize);
> ++  UT_ASSERT_NOT_EFI_ERROR (Status);
> ++
> ++  // Test that the allocation size is correct compared to the existing =
logic
> ++  UT_ASSERT_EQUAL (AllocationSize, PrimaryHeader.NumberOfPartitionEntri=
es * PrimaryHeader.SizeOfPartitionEntry);
> ++
> ++  // Test that an overflow is detected
> ++  PrimaryHeader.NumberOfPartitionEntries =3D MAX_UINT32;
> ++  PrimaryHeader.SizeOfPartitionEntry     =3D 5;
> ++  Status                                 =3D SanitizePrimaryHeaderAlloc=
ationSize (&PrimaryHeader, &AllocationSize);
> ++  UT_ASSERT_EQUAL (Status, EFI_BAD_BUFFER_SIZE);
> ++
> ++  // Test the inverse
> ++  PrimaryHeader.NumberOfPartitionEntries =3D 5;
> ++  PrimaryHeader.SizeOfPartitionEntry     =3D MAX_UINT32;
> ++  Status                                 =3D SanitizePrimaryHeaderAlloc=
ationSize (&PrimaryHeader, &AllocationSize);
> ++  UT_ASSERT_EQUAL (Status, EFI_BAD_BUFFER_SIZE);
> ++
> ++  // Test the worst case scenario
> ++  PrimaryHeader.NumberOfPartitionEntries =3D MAX_UINT32;
> ++  PrimaryHeader.SizeOfPartitionEntry     =3D MAX_UINT32;
> ++  Status                                 =3D SanitizePrimaryHeaderAlloc=
ationSize (&PrimaryHeader, &AllocationSize);
> ++  UT_ASSERT_EQUAL (Status, EFI_BAD_BUFFER_SIZE);
> ++
> ++  DEBUG ((DEBUG_INFO, "%a: Test passed\n", __func__));
> ++
> ++  return UNIT_TEST_PASSED;
> ++}
> ++
> ++/**
> ++  This function tests the SanitizePrimaryHeaderGptEventSize function.
> ++  It's intent is to test that the untrusted input from a EFI_GPT_DATA s=
tructure
> ++  will not cause an overflow when calculating the event size.
> ++
> ++  @param[in] Context  The unit test context.
> ++
> ++  @retval UNIT_TEST_PASSED  The test passed.
> ++  @retval UNIT_TEST_ERROR_TEST_FAILED  The test failed.
> ++**/
> ++UNIT_TEST_STATUS
> ++EFIAPI
> ++TestSanitizePrimaryHeaderGptEventSize (
> ++  IN UNIT_TEST_CONTEXT  Context
> ++  )
> ++{
> ++  UINT32                      EventSize;
> ++  UINT32                      ExistingLogicEventSize;
> ++  EFI_STATUS                  Status;
> ++  EFI_PARTITION_TABLE_HEADER  PrimaryHeader;
> ++  UINTN                       NumberOfPartition;
> ++  EFI_GPT_DATA                *GptData;
> ++  EFI_TCG2_EVENT              *Tcg2Event;
> ++
> ++  Tcg2Event =3D NULL;
> ++  GptData   =3D NULL;
> ++
> ++  // Test that a normal PrimaryHeader passes validation
> ++  PrimaryHeader.NumberOfPartitionEntries =3D 5;
> ++  PrimaryHeader.SizeOfPartitionEntry     =3D DEFAULT_PRIMARY_TABLE_HEAD=
ER_SIZE_OF_PARTITION_ENTRY;
> ++
> ++  // set the number of partitions
> ++  NumberOfPartition =3D 13;
> ++
> ++  // that the primary event size is correct
> ++  Status =3D SanitizePrimaryHeaderGptEventSize (&PrimaryHeader, NumberO=
fPartition, &EventSize);
> ++  UT_ASSERT_NOT_EFI_ERROR (Status);
> ++
> ++  // Calculate the existing logic event size
> ++  ExistingLogicEventSize =3D (UINT32)(OFFSET_OF (EFI_TCG2_EVENT, Event)=
 + OFFSET_OF (EFI_GPT_DATA, Partitions)
> ++                                    + NumberOfPartition * PrimaryHeader=
.SizeOfPartitionEntry);
> ++
> ++  // Check that the event size is correct
> ++  UT_ASSERT_EQUAL (EventSize, ExistingLogicEventSize);
> ++
> ++  // Tests that the primary event size may not overflow
> ++  Status =3D SanitizePrimaryHeaderGptEventSize (&PrimaryHeader, MAX_UIN=
T32, &EventSize);
> ++  UT_ASSERT_EQUAL (Status, EFI_BAD_BUFFER_SIZE);
> ++
> ++  // Test that the size of partition entries may not overflow
> ++  PrimaryHeader.SizeOfPartitionEntry =3D MAX_UINT32;
> ++  Status                             =3D SanitizePrimaryHeaderGptEventS=
ize (&PrimaryHeader, NumberOfPartition, &EventSize);
> ++  UT_ASSERT_EQUAL (Status, EFI_BAD_BUFFER_SIZE);
> ++
> ++  DEBUG ((DEBUG_INFO, "%a: Test passed\n", __func__));
> ++
> ++  return UNIT_TEST_PASSED;
> ++}
> ++
> ++// *-------------------------------------------------------------------=
-*
> ++// *  Unit Test Code Main Function
> ++// *-------------------------------------------------------------------=
-*
> ++
> ++/**
> ++  This function acts as the entry point for the unit tests.
> ++
> ++  @retval UNIT_TEST_PASSED  The test passed.
> ++  @retval UNIT_TEST_ERROR_TEST_FAILED  The test failed.
> ++  @retval others The test failed.
> ++**/
> ++EFI_STATUS
> ++EFIAPI
> ++UefiTestMain (
> ++  VOID
> ++  )
> ++{
> ++  EFI_STATUS                  Status;
> ++  UNIT_TEST_FRAMEWORK_HANDLE  Framework;
> ++  UNIT_TEST_SUITE_HANDLE      Tcg2MeasureBootLibValidationTestSuite;
> ++
> ++  Framework =3D NULL;
> ++
> ++  DEBUG ((DEBUG_INFO, "%a: TestMain() - Start\n", UNIT_TEST_NAME));
> ++
> ++  Status =3D InitUnitTestFramework (&Framework, UNIT_TEST_NAME, gEfiCal=
lerBaseName, UNIT_TEST_VERSION);
> ++  if (EFI_ERROR (Status)) {
> ++    DEBUG ((DEBUG_ERROR, "%a: Failed in InitUnitTestFramework. Status =
=3D %r\n", UNIT_TEST_NAME, Status));
> ++    goto EXIT;
> ++  }
> ++
> ++  Status =3D CreateUnitTestSuite (&Tcg2MeasureBootLibValidationTestSuit=
e, Framework, "Tcg2MeasureBootLibValidationTestSuite", "Common.Tcg2MeasureB=
ootLibValidation", NULL, NULL);
> ++  if (EFI_ERROR (Status)) {
> ++    DEBUG ((DEBUG_ERROR, "%s: Failed in CreateUnitTestSuite for Tcg2Mea=
sureBootLibValidationTestSuite\n", UNIT_TEST_NAME));
> ++    Status =3D EFI_OUT_OF_RESOURCES;
> ++    goto EXIT;
> ++  }
> ++
> ++  // -----------Suite---------------------------------Description------=
----------------------Class----------------------------------Test Function-=
-----------------------Pre---Clean-Context
> ++  AddTestCase (Tcg2MeasureBootLibValidationTestSuite, "Tests Validating=
 EFI Partition Table", "Common.Tcg2MeasureBootLibValidation", TestSanitizeE=
fiPartitionTableHeader, NULL, NULL, NULL);
> ++  AddTestCase (Tcg2MeasureBootLibValidationTestSuite, "Tests Primary he=
ader gpt event checks for overflow", "Common.Tcg2MeasureBootLibValidation",=
 TestSanitizePrimaryHeaderAllocationSize, NULL, NULL, NULL);
> ++  AddTestCase (Tcg2MeasureBootLibValidationTestSuite, "Tests Primary he=
ader allocation size checks for overflow", "Common.Tcg2MeasureBootLibValida=
tion", TestSanitizePrimaryHeaderGptEventSize, NULL, NULL, NULL);
> ++
> ++  Status =3D RunAllTestSuites (Framework);
> ++
> ++EXIT:
> ++  if (Framework !=3D NULL) {
> ++    FreeUnitTestFramework (Framework);
> ++  }
> ++
> ++  DEBUG ((DEBUG_INFO, "%a: TestMain() - End\n", UNIT_TEST_NAME));
> ++  return Status;
> ++}
> ++
> ++///
> ++/// Avoid ECC error for function name that starts with lower case lette=
r
> ++///
> ++#define DxeTpm2MeasureBootLibUnitTestMain  main
> ++
> ++/**
> ++  Standard POSIX C entry point for host based unit test execution.
> ++
> ++  @param[in] Argc  Number of arguments
> ++  @param[in] Argv  Array of pointers to arguments
> ++
> ++  @retval 0      Success
> ++  @retval other  Error
> ++**/
> ++INT32
> ++DxeTpm2MeasureBootLibUnitTestMain (
> ++  IN INT32  Argc,
> ++  IN CHAR8  *Argv[]
> ++  )
> ++{
> ++  return (INT32)UefiTestMain ();
> ++}
> +diff --git a/SecurityPkg/Library/DxeTpm2MeasureBootLib/InternalUnitTest/=
DxeTpm2MeasureBootLibSanitizationTestHost.inf b/SecurityPkg/Library/DxeTpm2=
MeasureBootLib/InternalUnitTest/DxeTpm2MeasureBootLibSanitizationTestHost.i=
nf
> +new file mode 100644
> +index 0000000000..2999aa2a44
> +--- /dev/null
> ++++ b/SecurityPkg/Library/DxeTpm2MeasureBootLib/InternalUnitTest/DxeTpm2=
MeasureBootLibSanitizationTestHost.inf
> +@@ -0,0 +1,28 @@
> ++## @file
> ++# This file builds the unit tests for DxeTpm2MeasureBootLib
> ++#
> ++# Copyright (C) Microsoft Corporation.<BR>
> ++# SPDX-License-Identifier: BSD-2-Clause-Patent
> ++##
> ++
> ++[Defines]
> ++  INF_VERSION                    =3D 0x00010006
> ++  BASE_NAME                      =3D DxeTpm2MeasuredBootLibTest
> ++  FILE_GUID                      =3D 144d757f-d423-484e-9309-a23695fad5=
bd
> ++  MODULE_TYPE                    =3D HOST_APPLICATION
> ++  VERSION_STRING                 =3D 1.0
> ++  ENTRY_POINT                    =3D main
> ++
> ++[Sources]
> ++  DxeTpm2MeasureBootLibSanitizationTest.c
> ++  ../DxeTpm2MeasureBootLibSanitization.c
> ++
> ++[Packages]
> ++  MdePkg/MdePkg.dec
> ++
> ++[LibraryClasses]
> ++  BaseLib
> ++  DebugLib
> ++  UnitTestLib
> ++  PrintLib
> ++  SafeIntLib
> +diff --git a/SecurityPkg/SecurityPkg.ci.yaml b/SecurityPkg/SecurityPkg.c=
i.yaml
> +index 7912142398..da811fdf93 100644
> +--- a/SecurityPkg/SecurityPkg.ci.yaml
> ++++ b/SecurityPkg/SecurityPkg.ci.yaml
> +@@ -15,6 +15,7 @@
> +         ##     "<ErrorID>", "<KeyWord>"
> +         ## ]
> +         "ExceptionList": [
> ++            "8001", "DxeTpm2MeasureBootLibUnitTestMain",
> +         ],
> +         ## Both file path and directory path are accepted.
> +         "IgnoreFiles": [
> +--
> +2.40.0
> +
> diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2022-36763-0002.patch b/meta=
/recipes-core/ovmf/ovmf/CVE-2022-36763-0002.patch
> new file mode 100644
> index 0000000000..6c20cc305e
> --- /dev/null
> +++ b/meta/recipes-core/ovmf/ovmf/CVE-2022-36763-0002.patch
> @@ -0,0 +1,889 @@
> +From 4776a1b39ee08fc45c70c1eab5a0195f325000d3 Mon Sep 17 00:00:00 2001
> +From: "Douglas Flick [MSFT]" <doug.edk2@gmail.com>
> +Date: Fri, 12 Jan 2024 02:16:02 +0800
> +Subject: [PATCH] SecurityPkg: DxeTpmMeasureBootLib: SECURITY PATCH 4117 =
- CVE
> + 2022-36763
> +
> +This commit contains the patch files and tests for DxeTpmMeasureBootLib
> +CVE 2022-36763.
> +
> +Cc: Jiewen Yao <jiewen.yao@intel.com>
> +
> +Signed-off-by: Doug Flick [MSFT] <doug.edk2@gmail.com>
> +Reviewed-by: Jiewen Yao <jiewen.yao@intel.com>
> +
> +CVE: CVE-2022-36763
> +
> +Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/4776=
a1b39ee08fc45c70c1eab5a0195f325000d3]
> +
> +Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
> +---
> + .../DxeTpmMeasureBootLib.c                    |  40 ++-
> + .../DxeTpmMeasureBootLib.inf                  |   4 +-
> + .../DxeTpmMeasureBootLibSanitization.c        | 241 ++++++++++++++
> + .../DxeTpmMeasureBootLibSanitization.h        | 114 +++++++
> + .../DxeTpmMeasureBootLibSanitizationTest.c    | 301 ++++++++++++++++++
> + ...eTpmMeasureBootLibSanitizationTestHost.inf |  28 ++
> + SecurityPkg/SecurityPkg.ci.yaml               |   1 +
> + 7 files changed, 715 insertions(+), 14 deletions(-)
> + create mode 100644 SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasu=
reBootLibSanitization.c
> + create mode 100644 SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasu=
reBootLibSanitization.h
> + create mode 100644 SecurityPkg/Library/DxeTpmMeasureBootLib/InternalUni=
tTest/DxeTpmMeasureBootLibSanitizationTest.c
> + create mode 100644 SecurityPkg/Library/DxeTpmMeasureBootLib/InternalUni=
tTest/DxeTpmMeasureBootLibSanitizationTestHost.inf
> +
> +diff --git a/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootL=
ib.c b/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootLib.c
> +index 220393dd2b..669ab19134 100644
> +--- a/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootLib.c
> ++++ b/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootLib.c
> +@@ -18,6 +18,8 @@
> + Copyright (c) 2009 - 2018, Intel Corporation. All rights reserved.<BR>
> + SPDX-License-Identifier: BSD-2-Clause-Patent
> +
> ++Copyright (c) Microsoft Corporation.<BR>
> ++SPDX-License-Identifier: BSD-2-Clause-Patent
> + **/
> +
> + #include <PiDxe.h>
> +@@ -40,6 +42,8 @@ SPDX-License-Identifier: BSD-2-Clause-Patent
> + #include <Library/SecurityManagementLib.h>
> + #include <Library/HobLib.h>
> +
> ++#include "DxeTpmMeasureBootLibSanitization.h"
> ++
> + //
> + // Flag to check GPT partition. It only need be measured once.
> + //
> +@@ -136,6 +140,9 @@ TcgMeasureGptTable (
> +   UINT32                      EventSize;
> +   UINT32                      EventNumber;
> +   EFI_PHYSICAL_ADDRESS        EventLogLastEntry;
> ++  UINT32                      AllocSize;
> ++
> ++  GptData =3D NULL;
> +
> +   if (mMeasureGptCount > 0) {
> +     return EFI_SUCCESS;
> +@@ -166,8 +173,8 @@ TcgMeasureGptTable (
> +                      BlockIo->Media->BlockSize,
> +                      (UINT8 *)PrimaryHeader
> +                      );
> +-  if (EFI_ERROR (Status)) {
> +-    DEBUG ((DEBUG_ERROR, "Failed to Read Partition Table Header!\n"));
> ++  if (EFI_ERROR (Status) || EFI_ERROR (SanitizeEfiPartitionTableHeader =
(PrimaryHeader, BlockIo))) {
> ++    DEBUG ((DEBUG_ERROR, "Failed to read Partition Table Header or inva=
lid Partition Table Header!\n"));
> +     FreePool (PrimaryHeader);
> +     return EFI_DEVICE_ERROR;
> +   }
> +@@ -175,7 +182,13 @@ TcgMeasureGptTable (
> +   //
> +   // Read the partition entry.
> +   //
> +-  EntryPtr =3D (UINT8 *)AllocatePool (PrimaryHeader->NumberOfPartitionE=
ntries * PrimaryHeader->SizeOfPartitionEntry);
> ++  Status =3D SanitizePrimaryHeaderAllocationSize (PrimaryHeader, &Alloc=
Size);
> ++  if (EFI_ERROR (Status)) {
> ++    FreePool (PrimaryHeader);
> ++    return EFI_DEVICE_ERROR;
> ++  }
> ++
> ++  EntryPtr =3D (UINT8 *)AllocatePool (AllocSize);
> +   if (EntryPtr =3D=3D NULL) {
> +     FreePool (PrimaryHeader);
> +     return EFI_OUT_OF_RESOURCES;
> +@@ -185,7 +198,7 @@ TcgMeasureGptTable (
> +                      DiskIo,
> +                      BlockIo->Media->MediaId,
> +                      MultU64x32 (PrimaryHeader->PartitionEntryLBA, Bloc=
kIo->Media->BlockSize),
> +-                     PrimaryHeader->NumberOfPartitionEntries * PrimaryH=
eader->SizeOfPartitionEntry,
> ++                     AllocSize,
> +                      EntryPtr
> +                      );
> +   if (EFI_ERROR (Status)) {
> +@@ -210,9 +223,8 @@ TcgMeasureGptTable (
> +   //
> +   // Prepare Data for Measurement
> +   //
> +-  EventSize =3D (UINT32)(sizeof (EFI_GPT_DATA) - sizeof (GptData->Parti=
tions)
> +-                       + NumberOfPartition * PrimaryHeader->SizeOfParti=
tionEntry);
> +-  TcgEvent =3D (TCG_PCR_EVENT *)AllocateZeroPool (EventSize + sizeof (T=
CG_PCR_EVENT_HDR));
> ++  Status   =3D SanitizePrimaryHeaderGptEventSize (PrimaryHeader, Number=
OfPartition, &EventSize);
> ++  TcgEvent =3D (TCG_PCR_EVENT *)AllocateZeroPool (EventSize);
> +   if (TcgEvent =3D=3D NULL) {
> +     FreePool (PrimaryHeader);
> +     FreePool (EntryPtr);
> +@@ -221,7 +233,7 @@ TcgMeasureGptTable (
> +
> +   TcgEvent->PCRIndex  =3D 5;
> +   TcgEvent->EventType =3D EV_EFI_GPT_EVENT;
> +-  TcgEvent->EventSize =3D EventSize;
> ++  TcgEvent->EventSize =3D EventSize - sizeof (TCG_PCR_EVENT_HDR);
> +   GptData             =3D (EFI_GPT_DATA *)TcgEvent->Event;
> +
> +   //
> +@@ -361,11 +373,13 @@ TcgMeasurePeImage (
> +       TcgEvent->PCRIndex  =3D 2;
> +       break;
> +     default:
> +-      DEBUG ((
> +-        DEBUG_ERROR,
> +-        "TcgMeasurePeImage: Unknown subsystem type %d",
> +-        ImageType
> +-        ));
> ++      DEBUG (
> ++        (
> ++         DEBUG_ERROR,
> ++         "TcgMeasurePeImage: Unknown subsystem type %d",
> ++         ImageType
> ++        )
> ++        );
> +       goto Finish;
> +   }
> +
> +diff --git a/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootL=
ib.inf b/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootLib.inf
> +index ebab6f7c1e..414c654d15 100644
> +--- a/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootLib.inf
> ++++ b/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootLib.inf
> +@@ -32,6 +32,8 @@
> +
> + [Sources]
> +   DxeTpmMeasureBootLib.c
> ++  DxeTpmMeasureBootLibSanitization.c
> ++  DxeTpmMeasureBootLibSanitization.h
> +
> + [Packages]
> +   MdePkg/MdePkg.dec
> +@@ -41,6 +43,7 @@
> +
> + [LibraryClasses]
> +   BaseMemoryLib
> ++  SafeIntLib
> +   DebugLib
> +   MemoryAllocationLib
> +   DevicePathLib
> +@@ -59,4 +62,3 @@
> +   gEfiFirmwareVolumeBlockProtocolGuid   ## SOMETIMES_CONSUMES
> +   gEfiBlockIoProtocolGuid               ## SOMETIMES_CONSUMES
> +   gEfiDiskIoProtocolGuid                ## SOMETIMES_CONSUMES
> +-
> +diff --git a/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootL=
ibSanitization.c b/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBo=
otLibSanitization.c
> +new file mode 100644
> +index 0000000000..a3fa46f5e6
> +--- /dev/null
> ++++ b/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootLibSanit=
ization.c
> +@@ -0,0 +1,241 @@
> ++/** @file
> ++  The library instance provides security service of TPM2 measure boot a=
nd
> ++  Confidential Computing (CC) measure boot.
> ++
> ++  Caution: This file requires additional review when modified.
> ++  This library will have external input - PE/COFF image and GPT partiti=
on.
> ++  This external input must be validated carefully to avoid security iss=
ue like
> ++  buffer overflow, integer overflow.
> ++
> ++  This file will pull out the validation logic from the following funct=
ions, in an
> ++  attempt to validate the untrusted input in the form of unit tests
> ++
> ++  These are those functions:
> ++
> ++  DxeTpmMeasureBootLibImageRead() function will make sure the PE/COFF i=
mage content
> ++  read is within the image buffer.
> ++
> ++  Tcg2MeasureGptTable() function will receive untrusted GPT partition t=
able, and parse
> ++  partition data carefully.
> ++
> ++  Copyright (c) Microsoft Corporation.<BR>
> ++  SPDX-License-Identifier: BSD-2-Clause-Patent
> ++**/
> ++#include <Uefi.h>
> ++#include <Uefi/UefiSpec.h>
> ++#include <Library/SafeIntLib.h>
> ++#include <Library/UefiLib.h>
> ++#include <Library/DebugLib.h>
> ++#include <Library/BaseLib.h>
> ++#include <IndustryStandard/UefiTcgPlatform.h>
> ++#include <Protocol/BlockIo.h>
> ++#include <Library/MemoryAllocationLib.h>
> ++
> ++#include "DxeTpmMeasureBootLibSanitization.h"
> ++
> ++#define GPT_HEADER_REVISION_V1  0x00010000
> ++
> ++/**
> ++  This function will validate the EFI_PARTITION_TABLE_HEADER structure =
is safe to parse
> ++  However this function will not attempt to verify the validity of the =
GPT partition
> ++  It will check the following:
> ++    - Signature
> ++    - Revision
> ++    - AlternateLBA
> ++    - FirstUsableLBA
> ++    - LastUsableLBA
> ++    - PartitionEntryLBA
> ++    - NumberOfPartitionEntries
> ++    - SizeOfPartitionEntry
> ++    - BlockIo
> ++
> ++  @param[in] PrimaryHeader
> ++    Pointer to the EFI_PARTITION_TABLE_HEADER structure.
> ++
> ++  @param[in] BlockIo
> ++    Pointer to the EFI_BLOCK_IO_PROTOCOL structure.
> ++
> ++  @retval EFI_SUCCESS
> ++    The EFI_PARTITION_TABLE_HEADER structure is valid.
> ++
> ++  @retval EFI_INVALID_PARAMETER
> ++    The EFI_PARTITION_TABLE_HEADER structure is invalid.
> ++**/
> ++EFI_STATUS
> ++EFIAPI
> ++SanitizeEfiPartitionTableHeader (
> ++  IN CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,
> ++  IN CONST EFI_BLOCK_IO_PROTOCOL       *BlockIo
> ++  )
> ++{
> ++  // Verify that the input parameters are safe to use
> ++  if (PrimaryHeader =3D=3D NULL) {
> ++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header!\n"));
> ++    return EFI_INVALID_PARAMETER;
> ++  }
> ++
> ++  if ((BlockIo =3D=3D NULL) || (BlockIo->Media =3D=3D NULL)) {
> ++    DEBUG ((DEBUG_ERROR, "Invalid BlockIo!\n"));
> ++    return EFI_INVALID_PARAMETER;
> ++  }
> ++
> ++  // The signature must be EFI_PTAB_HEADER_ID ("EFI PART" in ASCII)
> ++  if (PrimaryHeader->Header.Signature !=3D EFI_PTAB_HEADER_ID) {
> ++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header!\n"));
> ++    return EFI_DEVICE_ERROR;
> ++  }
> ++
> ++  // The version must be GPT_HEADER_REVISION_V1 (0x00010000)
> ++  if (PrimaryHeader->Header.Revision !=3D GPT_HEADER_REVISION_V1) {
> ++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header Revision!\n"))=
;
> ++    return EFI_DEVICE_ERROR;
> ++  }
> ++
> ++  // The HeaderSize must be greater than or equal to 92 and must be les=
s than or equal to the logical block size
> ++  if ((PrimaryHeader->Header.HeaderSize < sizeof (EFI_PARTITION_TABLE_H=
EADER)) || (PrimaryHeader->Header.HeaderSize > BlockIo->Media->BlockSize)) =
{
> ++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header HeaderSize!\n"=
));
> ++    return EFI_DEVICE_ERROR;
> ++  }
> ++
> ++  // check that the PartitionEntryLBA greater than the Max LBA
> ++  // This will be used later for multiplication
> ++  if (PrimaryHeader->PartitionEntryLBA > DivU64x32 (MAX_UINT64, BlockIo=
->Media->BlockSize)) {
> ++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header PartitionEntry=
LBA!\n"));
> ++    return EFI_DEVICE_ERROR;
> ++  }
> ++
> ++  // Check that the number of partition entries is greater than zero
> ++  if (PrimaryHeader->NumberOfPartitionEntries =3D=3D 0) {
> ++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header NumberOfPartit=
ionEntries!\n"));
> ++    return EFI_DEVICE_ERROR;
> ++  }
> ++
> ++  // SizeOfPartitionEntry must be 128, 256, 512... improper size may le=
ad to accessing uninitialized memory
> ++  if ((PrimaryHeader->SizeOfPartitionEntry < 128) || ((PrimaryHeader->S=
izeOfPartitionEntry & (PrimaryHeader->SizeOfPartitionEntry - 1)) !=3D 0)) {
> ++    DEBUG ((DEBUG_ERROR, "SizeOfPartitionEntry shall be set to a value =
of 128 x 2^n where n is an integer greater than or equal to zero (e.g., 128=
, 256, 512, etc.)!\n"));
> ++    return EFI_DEVICE_ERROR;
> ++  }
> ++
> ++  // This check is to prevent overflow when calculating the allocation =
size for the partition entries
> ++  // This check will be used later for multiplication
> ++  if (PrimaryHeader->NumberOfPartitionEntries > DivU64x32 (MAX_UINT64, =
PrimaryHeader->SizeOfPartitionEntry)) {
> ++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header NumberOfPartit=
ionEntries!\n"));
> ++    return EFI_DEVICE_ERROR;
> ++  }
> ++
> ++  return EFI_SUCCESS;
> ++}
> ++
> ++/**
> ++  This function will validate that the allocation size from the primary=
 header is sane
> ++  It will check the following:
> ++    - AllocationSize does not overflow
> ++
> ++  @param[in] PrimaryHeader
> ++    Pointer to the EFI_PARTITION_TABLE_HEADER structure.
> ++
> ++  @param[out] AllocationSize
> ++    Pointer to the allocation size.
> ++
> ++  @retval EFI_SUCCESS
> ++    The allocation size is valid.
> ++
> ++  @retval EFI_OUT_OF_RESOURCES
> ++    The allocation size is invalid.
> ++**/
> ++EFI_STATUS
> ++EFIAPI
> ++SanitizePrimaryHeaderAllocationSize (
> ++  IN CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,
> ++  OUT UINT32                           *AllocationSize
> ++  )
> ++{
> ++  EFI_STATUS  Status;
> ++
> ++  if (PrimaryHeader =3D=3D NULL) {
> ++    return EFI_INVALID_PARAMETER;
> ++  }
> ++
> ++  if (AllocationSize =3D=3D NULL) {
> ++    return EFI_INVALID_PARAMETER;
> ++  }
> ++
> ++  // Replacing logic:
> ++  // PrimaryHeader->NumberOfPartitionEntries * PrimaryHeader->SizeOfPar=
titionEntry;
> ++  Status =3D SafeUint32Mult (PrimaryHeader->NumberOfPartitionEntries, P=
rimaryHeader->SizeOfPartitionEntry, AllocationSize);
> ++  if (EFI_ERROR (Status)) {
> ++    DEBUG ((DEBUG_ERROR, "Allocation Size would have overflowed!\n"));
> ++    return EFI_BAD_BUFFER_SIZE;
> ++  }
> ++
> ++  return EFI_SUCCESS;
> ++}
> ++
> ++/**
> ++  This function will validate that the Gpt Event Size calculated from t=
he primary header is sane
> ++  It will check the following:
> ++    - EventSize does not overflow
> ++
> ++  Important: This function includes the entire length of the allocated =
space, including the
> ++  TCG_PCR_EVENT_HDR. When hashing the buffer allocated with this size, =
the caller must subtract
> ++  the size of the TCG_PCR_EVENT_HDR from the size of the buffer before =
hashing.
> ++
> ++  @param[in] PrimaryHeader - Pointer to the EFI_PARTITION_TABLE_HEADER =
structure.
> ++  @param[in] NumberOfPartition - Number of partitions.
> ++  @param[out] EventSize - Pointer to the event size.
> ++
> ++  @retval EFI_SUCCESS
> ++    The event size is valid.
> ++
> ++  @retval EFI_OUT_OF_RESOURCES
> ++    Overflow would have occurred.
> ++
> ++  @retval EFI_INVALID_PARAMETER
> ++    One of the passed parameters was invalid.
> ++**/
> ++EFI_STATUS
> ++SanitizePrimaryHeaderGptEventSize (
> ++  IN  CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,
> ++  IN  UINTN                             NumberOfPartition,
> ++  OUT UINT32                            *EventSize
> ++  )
> ++{
> ++  EFI_STATUS  Status;
> ++  UINT32      SafeNumberOfPartitions;
> ++
> ++  if (PrimaryHeader =3D=3D NULL) {
> ++    return EFI_INVALID_PARAMETER;
> ++  }
> ++
> ++  if (EventSize =3D=3D NULL) {
> ++    return EFI_INVALID_PARAMETER;
> ++  }
> ++
> ++  // We shouldn't even attempt to perform the multiplication if the num=
ber of partitions is greater than the maximum value of UINT32
> ++  Status =3D SafeUintnToUint32 (NumberOfPartition, &SafeNumberOfPartiti=
ons);
> ++  if (EFI_ERROR (Status)) {
> ++    DEBUG ((DEBUG_ERROR, "NumberOfPartition would have overflowed!\n"))=
;
> ++    return EFI_INVALID_PARAMETER;
> ++  }
> ++
> ++  // Replacing logic:
> ++  // (UINT32)(sizeof (EFI_GPT_DATA) - sizeof (GptData->Partitions) + Nu=
mberOfPartition * PrimaryHeader.SizeOfPartitionEntry + sizeof (TCG_PCR_EVEN=
T_HDR));
> ++  Status =3D SafeUint32Mult (SafeNumberOfPartitions, PrimaryHeader->Siz=
eOfPartitionEntry, EventSize);
> ++  if (EFI_ERROR (Status)) {
> ++    DEBUG ((DEBUG_ERROR, "Event Size would have overflowed!\n"));
> ++    return EFI_BAD_BUFFER_SIZE;
> ++  }
> ++
> ++  Status =3D SafeUint32Add (
> ++             sizeof (TCG_PCR_EVENT_HDR) +
> ++             OFFSET_OF (EFI_GPT_DATA, Partitions),
> ++             *EventSize,
> ++             EventSize
> ++             );
> ++  if (EFI_ERROR (Status)) {
> ++    DEBUG ((DEBUG_ERROR, "Event Size would have overflowed because of G=
PTData!\n"));
> ++    return EFI_BAD_BUFFER_SIZE;
> ++  }
> ++
> ++  return EFI_SUCCESS;
> ++}
> +diff --git a/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootL=
ibSanitization.h b/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBo=
otLibSanitization.h
> +new file mode 100644
> +index 0000000000..0d9d00c281
> +--- /dev/null
> ++++ b/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootLibSanit=
ization.h
> +@@ -0,0 +1,114 @@
> ++/** @file
> ++  This file includes the function prototypes for the sanitization funct=
ions.
> ++
> ++  These are those functions:
> ++
> ++  DxeTpmMeasureBootLibImageRead() function will make sure the PE/COFF i=
mage content
> ++  read is within the image buffer.
> ++
> ++  TcgMeasurePeImage() function will accept untrusted PE/COFF image and =
validate its
> ++  data structure within this image buffer before use.
> ++
> ++  TcgMeasureGptTable() function will receive untrusted GPT partition ta=
ble, and parse
> ++  partition data carefully.
> ++
> ++  Copyright (c) Microsoft Corporation.<BR>
> ++  SPDX-License-Identifier: BSD-2-Clause-Patent
> ++
> ++**/
> ++
> ++#ifndef DXE_TPM_MEASURE_BOOT_LIB_VALIDATION_
> ++#define DXE_TPM_MEASURE_BOOT_LIB_VALIDATION_
> ++
> ++#include <Uefi.h>
> ++#include <Uefi/UefiSpec.h>
> ++#include <Protocol/BlockIo.h>
> ++#include <IndustryStandard/UefiTcgPlatform.h>
> ++
> ++/**
> ++  This function will validate the EFI_PARTITION_TABLE_HEADER structure =
is safe to parse
> ++  However this function will not attempt to verify the validity of the =
GPT partition
> ++  It will check the following:
> ++    - Signature
> ++    - Revision
> ++    - AlternateLBA
> ++    - FirstUsableLBA
> ++    - LastUsableLBA
> ++    - PartitionEntryLBA
> ++    - NumberOfPartitionEntries
> ++    - SizeOfPartitionEntry
> ++    - BlockIo
> ++
> ++  @param[in] PrimaryHeader
> ++    Pointer to the EFI_PARTITION_TABLE_HEADER structure.
> ++
> ++  @param[in] BlockIo
> ++    Pointer to the EFI_BLOCK_IO_PROTOCOL structure.
> ++
> ++  @retval EFI_SUCCESS
> ++    The EFI_PARTITION_TABLE_HEADER structure is valid.
> ++
> ++  @retval EFI_INVALID_PARAMETER
> ++    The EFI_PARTITION_TABLE_HEADER structure is invalid.
> ++**/
> ++EFI_STATUS
> ++EFIAPI
> ++SanitizeEfiPartitionTableHeader (
> ++  IN CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,
> ++  IN CONST EFI_BLOCK_IO_PROTOCOL       *BlockIo
> ++  );
> ++
> ++/**
> ++  This function will validate that the allocation size from the primary=
 header is sane
> ++  It will check the following:
> ++    - AllocationSize does not overflow
> ++
> ++  @param[in] PrimaryHeader
> ++    Pointer to the EFI_PARTITION_TABLE_HEADER structure.
> ++
> ++  @param[out] AllocationSize
> ++    Pointer to the allocation size.
> ++
> ++  @retval EFI_SUCCESS
> ++    The allocation size is valid.
> ++
> ++  @retval EFI_OUT_OF_RESOURCES
> ++    The allocation size is invalid.
> ++**/
> ++EFI_STATUS
> ++EFIAPI
> ++SanitizePrimaryHeaderAllocationSize (
> ++  IN CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,
> ++  OUT UINT32                           *AllocationSize
> ++  );
> ++
> ++/**
> ++  This function will validate that the Gpt Event Size calculated from t=
he primary header is sane
> ++  It will check the following:
> ++    - EventSize does not overflow
> ++
> ++  Important: This function includes the entire length of the allocated =
space, including the
> ++  TCG_PCR_EVENT_HDR. When hashing the buffer allocated with this size, =
the caller must subtract
> ++  the size of the TCG_PCR_EVENT_HDR from the size of the buffer before =
hashing.
> ++
> ++  @param[in] PrimaryHeader - Pointer to the EFI_PARTITION_TABLE_HEADER =
structure.
> ++  @param[in] NumberOfPartition - Number of partitions.
> ++  @param[out] EventSize - Pointer to the event size.
> ++
> ++  @retval EFI_SUCCESS
> ++    The event size is valid.
> ++
> ++  @retval EFI_OUT_OF_RESOURCES
> ++    Overflow would have occurred.
> ++
> ++  @retval EFI_INVALID_PARAMETER
> ++    One of the passed parameters was invalid.
> ++**/
> ++EFI_STATUS
> ++SanitizePrimaryHeaderGptEventSize (
> ++  IN  CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,
> ++  IN  UINTN                             NumberOfPartition,
> ++  OUT UINT32                            *EventSize
> ++  );
> ++
> ++#endif // DXE_TPM_MEASURE_BOOT_LIB_VALIDATION_
> +diff --git a/SecurityPkg/Library/DxeTpmMeasureBootLib/InternalUnitTest/D=
xeTpmMeasureBootLibSanitizationTest.c b/SecurityPkg/Library/DxeTpmMeasureBo=
otLib/InternalUnitTest/DxeTpmMeasureBootLibSanitizationTest.c
> +new file mode 100644
> +index 0000000000..eeb928cdb0
> +--- /dev/null
> ++++ b/SecurityPkg/Library/DxeTpmMeasureBootLib/InternalUnitTest/DxeTpmMe=
asureBootLibSanitizationTest.c
> +@@ -0,0 +1,301 @@
> ++/** @file
> ++This file includes the unit test cases for the DxeTpmMeasureBootLibSani=
tizationTest.c.
> ++
> ++Copyright (c) Microsoft Corporation.<BR>
> ++SPDX-License-Identifier: BSD-2-Clause-Patent
> ++**/
> ++
> ++#include <Uefi.h>
> ++#include <Library/UefiLib.h>
> ++#include <Library/DebugLib.h>
> ++#include <Library/UnitTestLib.h>
> ++#include <Protocol/BlockIo.h>
> ++#include <Library/MemoryAllocationLib.h>
> ++#include <Library/BaseMemoryLib.h>
> ++#include <IndustryStandard/UefiTcgPlatform.h>
> ++
> ++#include "../DxeTpmMeasureBootLibSanitization.h"
> ++
> ++#define UNIT_TEST_NAME     "DxeTpmMeasureBootLibSanitizationTest"
> ++#define UNIT_TEST_VERSION  "1.0"
> ++
> ++#define DEFAULT_PRIMARY_TABLE_HEADER_REVISION                     0x000=
10000
> ++#define DEFAULT_PRIMARY_TABLE_HEADER_NUMBER_OF_PARTITION_ENTRIES  1
> ++#define DEFAULT_PRIMARY_TABLE_HEADER_SIZE_OF_PARTITION_ENTRY      128
> ++
> ++/**
> ++  This function tests the SanitizeEfiPartitionTableHeader function.
> ++  It's intent is to test that a malicious EFI_PARTITION_TABLE_HEADER
> ++  structure will not cause undefined or unexpected behavior.
> ++
> ++  In general the TPM should still be able to measure the data, but
> ++  be the header should be sanitized to prevent any unexpected behavior.
> ++
> ++  @param[in] Context  The unit test context.
> ++
> ++  @retval UNIT_TEST_PASSED  The test passed.
> ++  @retval UNIT_TEST_ERROR_TEST_FAILED  The test failed.
> ++**/
> ++UNIT_TEST_STATUS
> ++EFIAPI
> ++TestSanitizeEfiPartitionTableHeader (
> ++  IN UNIT_TEST_CONTEXT  Context
> ++  )
> ++{
> ++  EFI_STATUS                  Status;
> ++  EFI_PARTITION_TABLE_HEADER  PrimaryHeader;
> ++  EFI_BLOCK_IO_PROTOCOL       BlockIo;
> ++  EFI_BLOCK_IO_MEDIA          BlockMedia;
> ++
> ++  // Generate EFI_BLOCK_IO_MEDIA test data
> ++  BlockMedia.MediaId          =3D 1;
> ++  BlockMedia.RemovableMedia   =3D FALSE;
> ++  BlockMedia.MediaPresent     =3D TRUE;
> ++  BlockMedia.LogicalPartition =3D FALSE;
> ++  BlockMedia.ReadOnly         =3D FALSE;
> ++  BlockMedia.WriteCaching     =3D FALSE;
> ++  BlockMedia.BlockSize        =3D 512;
> ++  BlockMedia.IoAlign          =3D 1;
> ++  BlockMedia.LastBlock        =3D 0;
> ++
> ++  // Generate EFI_BLOCK_IO_PROTOCOL test data
> ++  BlockIo.Revision    =3D 1;
> ++  BlockIo.Media       =3D &BlockMedia;
> ++  BlockIo.Reset       =3D NULL;
> ++  BlockIo.ReadBlocks  =3D NULL;
> ++  BlockIo.WriteBlocks =3D NULL;
> ++  BlockIo.FlushBlocks =3D NULL;
> ++
> ++  // Geneate EFI_PARTITION_TABLE_HEADER test data
> ++  PrimaryHeader.Header.Signature         =3D EFI_PTAB_HEADER_ID;
> ++  PrimaryHeader.Header.Revision          =3D DEFAULT_PRIMARY_TABLE_HEAD=
ER_REVISION;
> ++  PrimaryHeader.Header.HeaderSize        =3D sizeof (EFI_PARTITION_TABL=
E_HEADER);
> ++  PrimaryHeader.MyLBA                    =3D 1;
> ++  PrimaryHeader.AlternateLBA             =3D 2;
> ++  PrimaryHeader.FirstUsableLBA           =3D 3;
> ++  PrimaryHeader.LastUsableLBA            =3D 4;
> ++  PrimaryHeader.PartitionEntryLBA        =3D 5;
> ++  PrimaryHeader.NumberOfPartitionEntries =3D DEFAULT_PRIMARY_TABLE_HEAD=
ER_NUMBER_OF_PARTITION_ENTRIES;
> ++  PrimaryHeader.SizeOfPartitionEntry     =3D DEFAULT_PRIMARY_TABLE_HEAD=
ER_SIZE_OF_PARTITION_ENTRY;
> ++  PrimaryHeader.PartitionEntryArrayCRC32 =3D 0; // Purposely invalid
> ++
> ++  // Calculate the CRC32 of the PrimaryHeader
> ++  PrimaryHeader.Header.CRC32 =3D CalculateCrc32 ((UINT8 *)&PrimaryHeade=
r, PrimaryHeader.Header.HeaderSize);
> ++
> ++  // Test that a normal PrimaryHeader passes validation
> ++  Status =3D SanitizeEfiPartitionTableHeader (&PrimaryHeader, &BlockIo)=
;
> ++  UT_ASSERT_NOT_EFI_ERROR (Status);
> ++
> ++  // Test that when number of partition entries is 0, the function retu=
rns EFI_DEVICE_ERROR
> ++  // Should print "Invalid Partition Table Header NumberOfPartitionEntr=
ies!""
> ++  PrimaryHeader.NumberOfPartitionEntries =3D 0;
> ++  Status                                 =3D SanitizeEfiPartitionTableH=
eader (&PrimaryHeader, &BlockIo);
> ++  UT_ASSERT_EQUAL (Status, EFI_DEVICE_ERROR);
> ++  PrimaryHeader.NumberOfPartitionEntries =3D DEFAULT_PRIMARY_TABLE_HEAD=
ER_SIZE_OF_PARTITION_ENTRY;
> ++
> ++  // Test that when the header size is too small, the function returns =
EFI_DEVICE_ERROR
> ++  // Should print "Invalid Partition Table Header Size!"
> ++  PrimaryHeader.Header.HeaderSize =3D 0;
> ++  Status                          =3D SanitizeEfiPartitionTableHeader (=
&PrimaryHeader, &BlockIo);
> ++  UT_ASSERT_EQUAL (Status, EFI_DEVICE_ERROR);
> ++  PrimaryHeader.Header.HeaderSize =3D sizeof (EFI_PARTITION_TABLE_HEADE=
R);
> ++
> ++  // Test that when the SizeOfPartitionEntry is too small, the function=
 returns EFI_DEVICE_ERROR
> ++  // should print: "SizeOfPartitionEntry shall be set to a value of 128=
 x 2^n where n is an integer greater than or equal to zero (e.g., 128, 256,=
 512, etc.)!"
> ++  PrimaryHeader.SizeOfPartitionEntry =3D 1;
> ++  Status                             =3D SanitizeEfiPartitionTableHeade=
r (&PrimaryHeader, &BlockIo);
> ++  UT_ASSERT_EQUAL (Status, EFI_DEVICE_ERROR);
> ++
> ++  DEBUG ((DEBUG_INFO, "%a: Test passed\n", __func__));
> ++
> ++  return UNIT_TEST_PASSED;
> ++}
> ++
> ++/**
> ++  This function tests the SanitizePrimaryHeaderAllocationSize function.
> ++  It's intent is to test that the untrusted input from a EFI_PARTITION_=
TABLE_HEADER
> ++  structure will not cause an overflow when calculating the allocation =
size.
> ++
> ++  @param[in] Context  The unit test context.
> ++
> ++  @retval UNIT_TEST_PASSED  The test passed.
> ++  @retval UNIT_TEST_ERROR_TEST_FAILED  The test failed.
> ++**/
> ++UNIT_TEST_STATUS
> ++EFIAPI
> ++TestSanitizePrimaryHeaderAllocationSize (
> ++  IN UNIT_TEST_CONTEXT  Context
> ++  )
> ++{
> ++  UINT32  AllocationSize;
> ++
> ++  EFI_STATUS                  Status;
> ++  EFI_PARTITION_TABLE_HEADER  PrimaryHeader;
> ++
> ++  // Test that a normal PrimaryHeader passes validation
> ++  PrimaryHeader.NumberOfPartitionEntries =3D 5;
> ++  PrimaryHeader.SizeOfPartitionEntry     =3D DEFAULT_PRIMARY_TABLE_HEAD=
ER_SIZE_OF_PARTITION_ENTRY;
> ++
> ++  Status =3D SanitizePrimaryHeaderAllocationSize (&PrimaryHeader, &Allo=
cationSize);
> ++  UT_ASSERT_NOT_EFI_ERROR (Status);
> ++
> ++  // Test that the allocation size is correct compared to the existing =
logic
> ++  UT_ASSERT_EQUAL (AllocationSize, PrimaryHeader.NumberOfPartitionEntri=
es * PrimaryHeader.SizeOfPartitionEntry);
> ++
> ++  // Test that an overflow is detected
> ++  PrimaryHeader.NumberOfPartitionEntries =3D MAX_UINT32;
> ++  PrimaryHeader.SizeOfPartitionEntry     =3D 5;
> ++  Status                                 =3D SanitizePrimaryHeaderAlloc=
ationSize (&PrimaryHeader, &AllocationSize);
> ++  UT_ASSERT_EQUAL (Status, EFI_BAD_BUFFER_SIZE);
> ++
> ++  // Test the inverse
> ++  PrimaryHeader.NumberOfPartitionEntries =3D 5;
> ++  PrimaryHeader.SizeOfPartitionEntry     =3D MAX_UINT32;
> ++  Status                                 =3D SanitizePrimaryHeaderAlloc=
ationSize (&PrimaryHeader, &AllocationSize);
> ++  UT_ASSERT_EQUAL (Status, EFI_BAD_BUFFER_SIZE);
> ++
> ++  // Test the worst case scenario
> ++  PrimaryHeader.NumberOfPartitionEntries =3D MAX_UINT32;
> ++  PrimaryHeader.SizeOfPartitionEntry     =3D MAX_UINT32;
> ++  Status                                 =3D SanitizePrimaryHeaderAlloc=
ationSize (&PrimaryHeader, &AllocationSize);
> ++  UT_ASSERT_EQUAL (Status, EFI_BAD_BUFFER_SIZE);
> ++
> ++  DEBUG ((DEBUG_INFO, "%a: Test passed\n", __func__));
> ++
> ++  return UNIT_TEST_PASSED;
> ++}
> ++
> ++/**
> ++  This function tests the SanitizePrimaryHeaderGptEventSize function.
> ++  It's intent is to test that the untrusted input from a EFI_GPT_DATA s=
tructure
> ++  will not cause an overflow when calculating the event size.
> ++
> ++  @param[in] Context  The unit test context.
> ++
> ++  @retval UNIT_TEST_PASSED  The test passed.
> ++  @retval UNIT_TEST_ERROR_TEST_FAILED  The test failed.
> ++**/
> ++UNIT_TEST_STATUS
> ++EFIAPI
> ++TestSanitizePrimaryHeaderGptEventSize (
> ++  IN UNIT_TEST_CONTEXT  Context
> ++  )
> ++{
> ++  UINT32                      EventSize;
> ++  UINT32                      ExistingLogicEventSize;
> ++  EFI_STATUS                  Status;
> ++  EFI_PARTITION_TABLE_HEADER  PrimaryHeader;
> ++  UINTN                       NumberOfPartition;
> ++  EFI_GPT_DATA                *GptData;
> ++
> ++  GptData =3D NULL;
> ++
> ++  // Test that a normal PrimaryHeader passes validation
> ++  PrimaryHeader.NumberOfPartitionEntries =3D 5;
> ++  PrimaryHeader.SizeOfPartitionEntry     =3D DEFAULT_PRIMARY_TABLE_HEAD=
ER_SIZE_OF_PARTITION_ENTRY;
> ++
> ++  // set the number of partitions
> ++  NumberOfPartition =3D 13;
> ++
> ++  // that the primary event size is correct
> ++  Status =3D SanitizePrimaryHeaderGptEventSize (&PrimaryHeader, NumberO=
fPartition, &EventSize);
> ++  UT_ASSERT_NOT_EFI_ERROR (Status);
> ++
> ++  // Calculate the existing logic event size
> ++  ExistingLogicEventSize =3D (UINT32)(sizeof (TCG_PCR_EVENT_HDR) + OFFS=
ET_OF (EFI_GPT_DATA, Partitions)
> ++                                    + NumberOfPartition * PrimaryHeader=
.SizeOfPartitionEntry);
> ++
> ++  // Check that the event size is correct
> ++  UT_ASSERT_EQUAL (EventSize, ExistingLogicEventSize);
> ++
> ++  // Tests that the primary event size may not overflow
> ++  Status =3D SanitizePrimaryHeaderGptEventSize (&PrimaryHeader, MAX_UIN=
T32, &EventSize);
> ++  UT_ASSERT_EQUAL (Status, EFI_BAD_BUFFER_SIZE);
> ++
> ++  // Test that the size of partition entries may not overflow
> ++  PrimaryHeader.SizeOfPartitionEntry =3D MAX_UINT32;
> ++  Status                             =3D SanitizePrimaryHeaderGptEventS=
ize (&PrimaryHeader, NumberOfPartition, &EventSize);
> ++  UT_ASSERT_EQUAL (Status, EFI_BAD_BUFFER_SIZE);
> ++
> ++  DEBUG ((DEBUG_INFO, "%a: Test passed\n", __func__));
> ++
> ++  return UNIT_TEST_PASSED;
> ++}
> ++
> ++// *-------------------------------------------------------------------=
-*
> ++// *  Unit Test Code Main Function
> ++// *-------------------------------------------------------------------=
-*
> ++
> ++/**
> ++  This function acts as the entry point for the unit tests.
> ++
> ++  @param argc - The number of command line arguments
> ++  @param argv - The command line arguments
> ++
> ++  @return int - The status of the test
> ++**/
> ++EFI_STATUS
> ++EFIAPI
> ++UefiTestMain (
> ++  VOID
> ++  )
> ++{
> ++  EFI_STATUS                  Status;
> ++  UNIT_TEST_FRAMEWORK_HANDLE  Framework;
> ++  UNIT_TEST_SUITE_HANDLE      TcgMeasureBootLibValidationTestSuite;
> ++
> ++  Framework =3D NULL;
> ++
> ++  DEBUG ((DEBUG_INFO, "%a: TestMain() - Start\n", UNIT_TEST_NAME));
> ++
> ++  Status =3D InitUnitTestFramework (&Framework, UNIT_TEST_NAME, gEfiCal=
lerBaseName, UNIT_TEST_VERSION);
> ++  if (EFI_ERROR (Status)) {
> ++    DEBUG ((DEBUG_ERROR, "%a: Failed in InitUnitTestFramework. Status =
=3D %r\n", UNIT_TEST_NAME, Status));
> ++    goto EXIT;
> ++  }
> ++
> ++  Status =3D CreateUnitTestSuite (&TcgMeasureBootLibValidationTestSuite=
, Framework, "TcgMeasureBootLibValidationTestSuite", "Common.TcgMeasureBoot=
LibValidation", NULL, NULL);
> ++  if (EFI_ERROR (Status)) {
> ++    DEBUG ((DEBUG_ERROR, "%s: Failed in CreateUnitTestSuite for TcgMeas=
ureBootLibValidationTestSuite\n", UNIT_TEST_NAME));
> ++    Status =3D EFI_OUT_OF_RESOURCES;
> ++    goto EXIT;
> ++  }
> ++
> ++  // -----------Suite---------------------------------Description------=
----------------------Class----------------------------------Test Function-=
-----------------------Pre---Clean-Context
> ++  AddTestCase (TcgMeasureBootLibValidationTestSuite, "Tests Validating =
EFI Partition Table", "Common.TcgMeasureBootLibValidation", TestSanitizeEfi=
PartitionTableHeader, NULL, NULL, NULL);
> ++  AddTestCase (TcgMeasureBootLibValidationTestSuite, "Tests Primary hea=
der gpt event checks for overflow", "Common.TcgMeasureBootLibValidation", T=
estSanitizePrimaryHeaderAllocationSize, NULL, NULL, NULL);
> ++  AddTestCase (TcgMeasureBootLibValidationTestSuite, "Tests Primary hea=
der allocation size checks for overflow", "Common.TcgMeasureBootLibValidati=
on", TestSanitizePrimaryHeaderGptEventSize, NULL, NULL, NULL);
> ++
> ++  Status =3D RunAllTestSuites (Framework);
> ++
> ++EXIT:
> ++  if (Framework !=3D NULL) {
> ++    FreeUnitTestFramework (Framework);
> ++  }
> ++
> ++  DEBUG ((DEBUG_INFO, "%a: TestMain() - End\n", UNIT_TEST_NAME));
> ++  return Status;
> ++}
> ++
> ++///
> ++/// Avoid ECC error for function name that starts with lower case lette=
r
> ++///
> ++#define DxeTpmMeasureBootLibUnitTestMain  main
> ++
> ++/**
> ++  Standard POSIX C entry point for host based unit test execution.
> ++
> ++  @param[in] Argc  Number of arguments
> ++  @param[in] Argv  Array of pointers to arguments
> ++
> ++  @retval 0      Success
> ++  @retval other  Error
> ++**/
> ++INT32
> ++DxeTpmMeasureBootLibUnitTestMain (
> ++  IN INT32  Argc,
> ++  IN CHAR8  *Argv[]
> ++  )
> ++{
> ++  return (INT32)UefiTestMain ();
> ++}
> +diff --git a/SecurityPkg/Library/DxeTpmMeasureBootLib/InternalUnitTest/D=
xeTpmMeasureBootLibSanitizationTestHost.inf b/SecurityPkg/Library/DxeTpmMea=
sureBootLib/InternalUnitTest/DxeTpmMeasureBootLibSanitizationTestHost.inf
> +new file mode 100644
> +index 0000000000..47b0811b00
> +--- /dev/null
> ++++ b/SecurityPkg/Library/DxeTpmMeasureBootLib/InternalUnitTest/DxeTpmMe=
asureBootLibSanitizationTestHost.inf
> +@@ -0,0 +1,28 @@
> ++## @file
> ++# This file builds the unit tests for DxeTpmMeasureBootLib
> ++#
> ++# Copyright (C) Microsoft Corporation.<BR>
> ++# SPDX-License-Identifier: BSD-2-Clause-Patent
> ++##
> ++
> ++[Defines]
> ++  INF_VERSION                    =3D 0x00010006
> ++  BASE_NAME                      =3D DxeTpmMeasuredBootLibTest
> ++  FILE_GUID                      =3D eb01bc38-309c-4d3e-967e-9f078c9077=
2f
> ++  MODULE_TYPE                    =3D HOST_APPLICATION
> ++  VERSION_STRING                 =3D 1.0
> ++  ENTRY_POINT                    =3D main
> ++
> ++[Sources]
> ++  DxeTpmMeasureBootLibSanitizationTest.c
> ++  ../DxeTpmMeasureBootLibSanitization.c
> ++
> ++[Packages]
> ++  MdePkg/MdePkg.dec
> ++
> ++[LibraryClasses]
> ++  BaseLib
> ++  DebugLib
> ++  UnitTestLib
> ++  PrintLib
> ++  SafeIntLib
> +diff --git a/SecurityPkg/SecurityPkg.ci.yaml b/SecurityPkg/SecurityPkg.c=
i.yaml
> +index da811fdf93..0e40eaa0fe 100644
> +--- a/SecurityPkg/SecurityPkg.ci.yaml
> ++++ b/SecurityPkg/SecurityPkg.ci.yaml
> +@@ -16,6 +16,7 @@
> +         ## ]
> +         "ExceptionList": [
> +             "8001", "DxeTpm2MeasureBootLibUnitTestMain",
> ++            "8001", "DxeTpmMeasureBootLibUnitTestMain"
> +         ],
> +         ## Both file path and directory path are accepted.
> +         "IgnoreFiles": [
> +--
> +2.40.0
> +
> diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2022-36763-0003.patch b/meta=
/recipes-core/ovmf/ovmf/CVE-2022-36763-0003.patch
> new file mode 100644
> index 0000000000..59bd5c4910
> --- /dev/null
> +++ b/meta/recipes-core/ovmf/ovmf/CVE-2022-36763-0003.patch
> @@ -0,0 +1,55 @@
> +From 1ddcb9fc6b4164e882687b031e8beacfcf7df29e Mon Sep 17 00:00:00 2001
> +From: "Douglas Flick [MSFT]" <doug.edk2@gmail.com>
> +Date: Fri, 12 Jan 2024 02:16:03 +0800
> +Subject: [PATCH] SecurityPkg: : Adding CVE 2022-36763 to SecurityFixes.y=
aml
> +
> +This creates / adds a security file that tracks the security fixes
> +found in this package and can be used to find the fixes that were
> +applied.
> +
> +Cc: Jiewen Yao <jiewen.yao@intel.com>
> +
> +Signed-off-by: Doug Flick [MSFT] <doug.edk2@gmail.com>
> +Reviewed-by: Jiewen Yao <jiewen.yao@intel.com>
> +
> +CVE: CVE-2022-36763
> +
> +Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/1ddc=
b9fc6b4164e882687b031e8beacfcf7df29e]
> +
> +Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
> +---
> + SecurityPkg/SecurityFixes.yaml | 22 ++++++++++++++++++++++
> + 1 file changed, 22 insertions(+)
> + create mode 100644 SecurityPkg/SecurityFixes.yaml
> +
> +diff --git a/SecurityPkg/SecurityFixes.yaml b/SecurityPkg/SecurityFixes.=
yaml
> +new file mode 100644
> +index 0000000000..f9e3e7be74
> +--- /dev/null
> ++++ b/SecurityPkg/SecurityFixes.yaml
> +@@ -0,0 +1,22 @@
> ++## @file
> ++# Security Fixes for SecurityPkg
> ++#
> ++# Copyright (c) Microsoft Corporation
> ++# SPDX-License-Identifier: BSD-2-Clause-Patent
> ++##
> ++CVE_2022_36763:
> ++  commit_titles:
> ++    - "SecurityPkg: DxeTpm2Measurement: SECURITY PATCH 4117 - CVE 2022-=
36763"
> ++    - "SecurityPkg: DxeTpmMeasurement: SECURITY PATCH 4117 - CVE 2022-3=
6763"
> ++    - "SecurityPkg: : Adding CVE 2022-36763 to SecurityFixes.yaml"
> ++  cve: CVE-2022-36763
> ++  date_reported: 2022-10-25 11:31 UTC
> ++  description: (CVE-2022-36763) - Heap Buffer Overflow in Tcg2MeasureGp=
tTable()
> ++  note: This patch is related to and supersedes TCBZ2168
> ++  files_impacted:
> ++  - Library\DxeTpm2MeasureBootLib\DxeTpm2MeasureBootLib.c
> ++  - Library\DxeTpmMeasureBootLib\DxeTpmMeasureBootLib.c
> ++  links:
> ++  - https://bugzilla.tianocore.org/show_bug.cgi?id=3D4117
> ++  - https://bugzilla.tianocore.org/show_bug.cgi?id=3D2168
> ++  - https://bugzilla.tianocore.org/show_bug.cgi?id=3D1990
> +--
> +2.40.0
> +
> diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/=
ovmf_git.bb
> index 84e3360a3a..78d86ad879 100644
> --- a/meta/recipes-core/ovmf/ovmf_git.bb
> +++ b/meta/recipes-core/ovmf/ovmf_git.bb
> @@ -27,6 +27,9 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;bran=
ch=3Dmaster;protocol=3Dhttps \
>             file://0006-reproducible.patch \
>             file://0001-BaseTools-fix-gcc12-warning.patch \
>             file://0001-BaseTools-fix-gcc12-warning-1.patch \
> +           file://CVE-2022-36763-0001.patch \
> +           file://CVE-2022-36763-0002.patch \
> +           file://CVE-2022-36763-0003.patch \
>             "
>
>  PV =3D "edk2-stable202202"
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201751): https://lists.openembedded.org/g/openembedde=
d-core/message/201751
> Mute This Topic: https://lists.openembedded.org/mt/107157592/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

