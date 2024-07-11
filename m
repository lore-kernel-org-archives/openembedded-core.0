Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46247C3DA45
	for <webhook@archiver.kernel.org>; Thu, 11 Jul 2024 19:04:56 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web10.38.1720724687304135247
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jul 2024 12:04:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=FSGw6eoM;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.171, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dfdb6122992so1180083276.3
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 12:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720724686; x=1721329486; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bdFMAzUZs73VqKp7tXYor/lmRXWnyMURLzAdyPoxO4o=;
        b=FSGw6eoMMVuI7RuGtr2fJbrldTgP2hiENSAxPDokZizXiSYItEnbQ/TdPvSr0Z5S6+
         ak1mgxcMU75Y6FQNtymYvjxJ80zWVE9EcWVaYT1niYZV/aJyY6iqs28bfhC5PggoH77s
         f8exehGYK6r651B0tI2Il5lhKtBbxBnKAZu+sSLfoEMdPl6EUY/ed5ip8y49NIXH4He+
         t32h1RjM7xKe3bYurV+O3Bc+s/1e09bzKtfdYeuEc1zNRt/RD4+/lr+7wmdSZJSI0ssp
         HVzYqlkoiSB754ON2Dv1k8OBGAG0ib7sFA0Jti9QXJB+ic1VLw5fMK1PgTarxnPUQ/mo
         79NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720724686; x=1721329486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bdFMAzUZs73VqKp7tXYor/lmRXWnyMURLzAdyPoxO4o=;
        b=OMEyPa3mCsebxohvlznUtBjhL7xexccWucoqyyo+ftR+5RTnHYlWTlkqgBL9acCb7w
         Dv055qw/nqi6bRwg3r6LwKtTLmzO6gtNsCxos6qPNyXAcFIRy0/lu0ZixXHggm1jeQsc
         IVcKJe27oSm6O3ZM8IOg1MHv88CmtZKbXoybkK1scTUHXzBkS7wjbfu74cRXATmOjvNc
         eZEwrQzl8l7+Xfg/EgSry3PheP7Oib5Tp0ltOLR7WuE8qMwPo6mwdMz5w4CYOonhIwBF
         PCLRaJ9h6c43jLjUBtEJTvwjSZ0XBlc1jaqHDH6SAloDZ2EPu7nFjFQEsRKjQ78DU+AR
         SykQ==
X-Gm-Message-State: AOJu0Yxm249dKXWgoCkWLxsCkZ6xmhNgmOc2ESnabY0dC3n+j2cQutuo
	FiGoIXIgq0tYn0N8dXYRYsjl7QrZswSBwxcIsDAMzXk8JLki3QohW5+oTT6WfgTIw5qyRoUTerw
	/FEZ1GOyeUj+eiJ7KvC46FavVg/A2TEYiQQz4cqyX1fsNP/t/
X-Google-Smtp-Source: AGHT+IEK7f/dH0IGojIn/5F8t5sW+PVFz/oVMiAAQnb0JEjBCRpDQz+echbseFRx1N4VRI42OnX9F6IoRfRWYKq1fNQ=
X-Received: by 2002:a05:6902:1b87:b0:e02:b1ed:620 with SMTP id
 3f1490d57ef6-e041b07c870mr11975930276.30.1720724685968; Thu, 11 Jul 2024
 12:04:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240711045541.2155076-1-soumya.sambu@windriver.com>
 <CAOSpxdarVffEO48reFmkKWUTs8btiNSTpkm80FAUFdYXMtMisw@mail.gmail.com> <BYAPR11MB339761C3FAAF0DC70C54B74D81A52@BYAPR11MB3397.namprd11.prod.outlook.com>
In-Reply-To: <BYAPR11MB339761C3FAAF0DC70C54B74D81A52@BYAPR11MB3397.namprd11.prod.outlook.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 11 Jul 2024 12:04:34 -0700
Message-ID: <CAOSpxdZycgJeHj+j-JG_qm5Jsf9hpskw0-iVTV=KVtJUgUKGSg@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH 01/11] ovmf: Fix CVE-2022-36763
To: "Sambu, Soumya" <Soumya.Sambu@windriver.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 19:04:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201789

On Thu, Jul 11, 2024 at 11:46=E2=80=AFAM Sambu, Soumya
<Soumya.Sambu@windriver.com> wrote:
>
> Hi Steve,
>
> Kindly apply patch using: git am --keep-cr <patch> to retain the line end=
ings.

This does not fix the issue.  To confirm, please try applying your
patches to kirkstone head from the mailing list or patchworks and then
build ovmf.

Steve
>
> Regards,
> Soumya
> ________________________________
> From: Steve Sakoman <steve@sakoman.com>
> Sent: Friday, July 12, 2024 12:04 AM
> To: Sambu, Soumya <Soumya.Sambu@windriver.com>
> Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org>
> Subject: Re: [OE-core][kirkstone][PATCH 01/11] ovmf: Fix CVE-2022-36763
>
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.
>
> There appear to be line ending issues with all of the patches in this ser=
ies:
>
> ERROR: ovmf-edk2-stable202202-r0 do_patch: Applying patch
> 'CVE-2022-36763-0001.patch' on target directory
> '/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/core2-64-poky-l=
inux/ovmf/edk2-stable202202-r0/git'
> CmdError('quilt --quiltrc
> /home/steve/builds/poky-contrib-kirkstone/build/tmp/work/core2-64-poky-li=
nux/ovmf/edk2-stable202202-r0/recipe-sysroot-native/etc/quiltrc
> push', 0, 'stdout: Applying patch CVE-2022-36763-0001.patch
> patching file SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBoo=
tLib.c
> Hunk #1 FAILED at 20 (different line endings).
> Hunk #2 FAILED at 44 (different line endings).
> Hunk #3 FAILED at 144 (different line endings).
> Hunk #4 FAILED at 195 (different line endings).
> Hunk #5 FAILED at 223 (different line endings).
> Hunk #6 FAILED at 248 (different line endings).
> Hunk #7 FAILED at 310 (different line endings).
> Hunk #8 FAILED at 326 (different line endings).
> Hunk #9 FAILED at 443 (different line endings).
> Hunk #10 FAILED at 515 (different line endings).
> Hunk #11 FAILED at 646 (different line endings).
> 11 out of 11 hunks FAILED -- rejects in file
> SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLib.c
> patching file SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBoo=
tLib.inf
> Hunk #1 FAILED at 37 (different line endings).
> Hunk #2 FAILED at 46 (different line endings).
> Hunk #3 FAILED at 65 (different line endings).
> 3 out of 3 hunks FAILED -- rejects in file
> SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLib.inf
> patching file SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBoo=
tLibSanitization.c
> patching file SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBoo=
tLibSanitization.h
> patching file SecurityPkg/Library/DxeTpm2MeasureBootLib/InternalUnitTest/=
DxeTpm2MeasureBootLibSanitizationTest.c
> patching file SecurityPkg/Library/DxeTpm2MeasureBootLib/InternalUnitTest/=
DxeTpm2MeasureBootLibSanitizationTestHost.inf
> patching file SecurityPkg/SecurityPkg.ci.yaml
> Hunk #1 FAILED at 15 (different line endings).
> 1 out of 1 hunk FAILED -- rejects in file SecurityPkg/SecurityPkg.ci.yaml
> Patch CVE-2022-36763-0001.patch does not apply (enforce with -f)
>
> Steve
>
> On Wed, Jul 10, 2024 at 9:56=E2=80=AFPM Soumya via lists.openembedded.org
> <soumya.sambu=3Dwindriver.com@lists.openembedded.org> wrote:
> >
> > From: Soumya Sambu <soumya.sambu@windriver.com>
> >
> > EDK2 is susceptible to a vulnerability in the Tcg2MeasureGptTable()
> > function, allowing a user to trigger a heap buffer overflow via a local
> > network. Successful exploitation of this vulnerability may result in a
> > compromise of confidentiality, integrity, and/or availability.
> >
> > References:
> > https://nvd.nist.gov/vuln/detail/CVE-2022-36763
> >
> > Upstream-patches:
> > https://github.com/tianocore/edk2/commit/224446543206450ddb5830e6abd026=
d61d3c7f4b
> > https://github.com/tianocore/edk2/commit/4776a1b39ee08fc45c70c1eab5a019=
5f325000d3
> > https://github.com/tianocore/edk2/commit/1ddcb9fc6b4164e882687b031e8bea=
cfcf7df29e
> >
> > Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
> > ---
> >  .../ovmf/ovmf/CVE-2022-36763-0001.patch       | 985 ++++++++++++++++++
> >  .../ovmf/ovmf/CVE-2022-36763-0002.patch       | 889 ++++++++++++++++
> >  .../ovmf/ovmf/CVE-2022-36763-0003.patch       |  55 +
> >  meta/recipes-core/ovmf/ovmf_git.bb            |   3 +
> >  4 files changed, 1932 insertions(+)
> >  create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2022-36763-0001.pat=
ch
> >  create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2022-36763-0002.pat=
ch
> >  create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2022-36763-0003.pat=
ch
> >
> > diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2022-36763-0001.patch b/me=
ta/recipes-core/ovmf/ovmf/CVE-2022-36763-0001.patch
> > new file mode 100644
> > index 0000000000..93cefe7740
> > --- /dev/null
> > +++ b/meta/recipes-core/ovmf/ovmf/CVE-2022-36763-0001.patch
> > @@ -0,0 +1,985 @@
> > +From 224446543206450ddb5830e6abd026d61d3c7f4b Mon Sep 17 00:00:00 2001
> > +From: "Douglas Flick [MSFT]" <doug.edk2@gmail.com>
> > +Date: Fri, 12 Jan 2024 02:16:01 +0800
> > +Subject: [PATCH] SecurityPkg: DxeTpm2MeasureBootLib: SECURITY PATCH 41=
17 - CVE
> > + 2022-36763
> > +
> > +This commit contains the patch files and tests for DxeTpm2MeasureBootL=
ib
> > +CVE 2022-36763.
> > +
> > +Cc: Jiewen Yao <jiewen.yao@intel.com>
> > +
> > +Signed-off-by: Doug Flick [MSFT] <doug.edk2@gmail.com>
> > +
> > +CVE: CVE-2022-36763
> > +
> > +Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/22=
4446543206450ddb5830e6abd026d61d3c7f4b]
> > +
> > +Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
> > +---
> > + .../DxeTpm2MeasureBootLib.c                   |  69 ++--
> > + .../DxeTpm2MeasureBootLib.inf                 |   4 +-
> > + .../DxeTpm2MeasureBootLibSanitization.c       | 275 ++++++++++++++++
> > + .../DxeTpm2MeasureBootLibSanitization.h       | 113 +++++++
> > + .../DxeTpm2MeasureBootLibSanitizationTest.c   | 303 +++++++++++++++++=
+
> > + ...Tpm2MeasureBootLibSanitizationTestHost.inf |  28 ++
> > + SecurityPkg/SecurityPkg.ci.yaml               |   1 +
> > + 7 files changed, 763 insertions(+), 30 deletions(-)
> > + create mode 100644 SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2M=
easureBootLibSanitization.c
> > + create mode 100644 SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2M=
easureBootLibSanitization.h
> > + create mode 100644 SecurityPkg/Library/DxeTpm2MeasureBootLib/Internal=
UnitTest/DxeTpm2MeasureBootLibSanitizationTest.c
> > + create mode 100644 SecurityPkg/Library/DxeTpm2MeasureBootLib/Internal=
UnitTest/DxeTpm2MeasureBootLibSanitizationTestHost.inf
> > +
> > +diff --git a/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureB=
ootLib.c b/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLib.=
c
> > +index 36a256a7af..0475103d6e 100644
> > +--- a/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLib.=
c
> > ++++ b/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLib.=
c
> > +@@ -20,6 +20,8 @@ Copyright (c) 2013 - 2018, Intel Corporation. All ri=
ghts reserved.<BR>
> > + (C) Copyright 2015 Hewlett Packard Enterprise Development LP<BR>
> > + SPDX-License-Identifier: BSD-2-Clause-Patent
> > +
> > ++Copyright (c) Microsoft Corporation.<BR>
> > ++SPDX-License-Identifier: BSD-2-Clause-Patent
> > + **/
> > +
> > + #include <PiDxe.h>
> > +@@ -44,6 +46,8 @@ SPDX-License-Identifier: BSD-2-Clause-Patent
> > + #include <Library/HobLib.h>
> > + #include <Protocol/CcMeasurement.h>
> > +
> > ++#include "DxeTpm2MeasureBootLibSanitization.h"
> > ++
> > + typedef struct {
> > +   EFI_TCG2_PROTOCOL              *Tcg2Protocol;
> > +   EFI_CC_MEASUREMENT_PROTOCOL    *CcProtocol;
> > +@@ -144,10 +148,11 @@ Tcg2MeasureGptTable (
> > +   EFI_TCG2_EVENT               *Tcg2Event;
> > +   EFI_CC_EVENT                 *CcEvent;
> > +   EFI_GPT_DATA                 *GptData;
> > +-  UINT32                       EventSize;
> > ++  UINT32                       TcgEventSize;
> > +   EFI_TCG2_PROTOCOL            *Tcg2Protocol;
> > +   EFI_CC_MEASUREMENT_PROTOCOL  *CcProtocol;
> > +   EFI_CC_MR_INDEX              MrIndex;
> > ++  UINT32                       AllocSize;
> > +
> > +   if (mTcg2MeasureGptCount > 0) {
> > +     return EFI_SUCCESS;
> > +@@ -195,25 +200,22 @@ Tcg2MeasureGptTable (
> > +                      BlockIo->Media->BlockSize,
> > +                      (UINT8 *)PrimaryHeader
> > +                      );
> > +-  if (EFI_ERROR (Status)) {
> > +-    DEBUG ((DEBUG_ERROR, "Failed to Read Partition Table Header!\n"))=
;
> > ++  if (EFI_ERROR (Status) || EFI_ERROR (SanitizeEfiPartitionTableHeade=
r (PrimaryHeader, BlockIo))) {
> > ++    DEBUG ((DEBUG_ERROR, "Failed to read Partition Table Header or in=
valid Partition Table Header!\n"));
> > +     FreePool (PrimaryHeader);
> > +     return EFI_DEVICE_ERROR;
> > +   }
> > +
> > +   //
> > +-  // PrimaryHeader->SizeOfPartitionEntry should not be zero
> > ++  // Read the partition entry.
> > +   //
> > +-  if (PrimaryHeader->SizeOfPartitionEntry =3D=3D 0) {
> > +-    DEBUG ((DEBUG_ERROR, "SizeOfPartitionEntry should not be zero!\n"=
));
> > ++  Status =3D SanitizePrimaryHeaderAllocationSize (PrimaryHeader, &All=
ocSize);
> > ++  if (EFI_ERROR (Status)) {
> > +     FreePool (PrimaryHeader);
> > +     return EFI_BAD_BUFFER_SIZE;
> > +   }
> > +
> > +-  //
> > +-  // Read the partition entry.
> > +-  //
> > +-  EntryPtr =3D (UINT8 *)AllocatePool (PrimaryHeader->NumberOfPartitio=
nEntries * PrimaryHeader->SizeOfPartitionEntry);
> > ++  EntryPtr =3D (UINT8 *)AllocatePool (AllocSize);
> > +   if (EntryPtr =3D=3D NULL) {
> > +     FreePool (PrimaryHeader);
> > +     return EFI_OUT_OF_RESOURCES;
> > +@@ -223,7 +225,7 @@ Tcg2MeasureGptTable (
> > +                      DiskIo,
> > +                      BlockIo->Media->MediaId,
> > +                      MultU64x32 (PrimaryHeader->PartitionEntryLBA, Bl=
ockIo->Media->BlockSize),
> > +-                     PrimaryHeader->NumberOfPartitionEntries * Primar=
yHeader->SizeOfPartitionEntry,
> > ++                     AllocSize,
> > +                      EntryPtr
> > +                      );
> > +   if (EFI_ERROR (Status)) {
> > +@@ -248,16 +250,21 @@ Tcg2MeasureGptTable (
> > +   //
> > +   // Prepare Data for Measurement (CcProtocol and Tcg2Protocol)
> > +   //
> > +-  EventSize =3D (UINT32)(sizeof (EFI_GPT_DATA) - sizeof (GptData->Par=
titions)
> > +-                       + NumberOfPartition * PrimaryHeader->SizeOfPar=
titionEntry);
> > +-  EventPtr =3D (UINT8 *)AllocateZeroPool (EventSize + sizeof (EFI_TCG=
2_EVENT) - sizeof (Tcg2Event->Event));
> > ++  Status =3D SanitizePrimaryHeaderGptEventSize (PrimaryHeader, Number=
OfPartition, &TcgEventSize);
> > ++  if (EFI_ERROR (Status)) {
> > ++    FreePool (PrimaryHeader);
> > ++    FreePool (EntryPtr);
> > ++    return EFI_DEVICE_ERROR;
> > ++  }
> > ++
> > ++  EventPtr =3D (UINT8 *)AllocateZeroPool (TcgEventSize);
> > +   if (EventPtr =3D=3D NULL) {
> > +     Status =3D EFI_OUT_OF_RESOURCES;
> > +     goto Exit;
> > +   }
> > +
> > +   Tcg2Event                       =3D (EFI_TCG2_EVENT *)EventPtr;
> > +-  Tcg2Event->Size                 =3D EventSize + sizeof (EFI_TCG2_EV=
ENT) - sizeof (Tcg2Event->Event);
> > ++  Tcg2Event->Size                 =3D TcgEventSize;
> > +   Tcg2Event->Header.HeaderSize    =3D sizeof (EFI_TCG2_EVENT_HEADER);
> > +   Tcg2Event->Header.HeaderVersion =3D EFI_TCG2_EVENT_HEADER_VERSION;
> > +   Tcg2Event->Header.PCRIndex      =3D 5;
> > +@@ -310,7 +317,7 @@ Tcg2MeasureGptTable (
> > +                                             CcProtocol,
> > +                                             0,
> > +                                             (EFI_PHYSICAL_ADDRESS)(UI=
NTN)(VOID *)GptData,
> > +-                                            (UINT64)EventSize,
> > ++                                            (UINT64)TcgEventSize - OF=
FSET_OF (EFI_TCG2_EVENT, Event),
> > +                                             CcEvent
> > +                                             );
> > +     if (!EFI_ERROR (Status)) {
> > +@@ -326,7 +333,7 @@ Tcg2MeasureGptTable (
> > +                              Tcg2Protocol,
> > +                              0,
> > +                              (EFI_PHYSICAL_ADDRESS)(UINTN)(VOID *)Gpt=
Data,
> > +-                             (UINT64)EventSize,
> > ++                             (UINT64)TcgEventSize -  OFFSET_OF (EFI_T=
CG2_EVENT, Event),
> > +                              Tcg2Event
> > +                              );
> > +     if (!EFI_ERROR (Status)) {
> > +@@ -443,11 +450,13 @@ Tcg2MeasurePeImage (
> > +       Tcg2Event->Header.PCRIndex  =3D 2;
> > +       break;
> > +     default:
> > +-      DEBUG ((
> > +-        DEBUG_ERROR,
> > +-        "Tcg2MeasurePeImage: Unknown subsystem type %d",
> > +-        ImageType
> > +-        ));
> > ++      DEBUG (
> > ++        (
> > ++         DEBUG_ERROR,
> > ++         "Tcg2MeasurePeImage: Unknown subsystem type %d",
> > ++         ImageType
> > ++        )
> > ++        );
> > +       goto Finish;
> > +   }
> > +
> > +@@ -515,7 +524,7 @@ Finish:
> > +
> > +   @param  MeasureBootProtocols  Pointer to the located measure boot p=
rotocol instances.
> > +
> > +-  @retval EFI_SUCCESS           Sucessfully locate the measure boot p=
rotocol instances (at least one instance).
> > ++  @retval EFI_SUCCESS           Successfully locate the measure boot =
protocol instances (at least one instance).
> > +   @retval EFI_UNSUPPORTED       Measure boot is not supported.
> > + **/
> > + EFI_STATUS
> > +@@ -646,12 +655,14 @@ DxeTpm2MeasureBootHandler (
> > +     return EFI_SUCCESS;
> > +   }
> > +
> > +-  DEBUG ((
> > +-    DEBUG_INFO,
> > +-    "Tcg2Protocol =3D %p, CcMeasurementProtocol =3D %p\n",
> > +-    MeasureBootProtocols.Tcg2Protocol,
> > +-    MeasureBootProtocols.CcProtocol
> > +-    ));
> > ++  DEBUG (
> > ++    (
> > ++     DEBUG_INFO,
> > ++     "Tcg2Protocol =3D %p, CcMeasurementProtocol =3D %p\n",
> > ++     MeasureBootProtocols.Tcg2Protocol,
> > ++     MeasureBootProtocols.CcProtocol
> > ++    )
> > ++    );
> > +
> > +   //
> > +   // Copy File Device Path
> > +diff --git a/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureB=
ootLib.inf b/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLi=
b.inf
> > +index 6dca79a20c..28995f438d 100644
> > +--- a/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLib.=
inf
> > ++++ b/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLib.=
inf
> > +@@ -37,6 +37,8 @@
> > +
> > + [Sources]
> > +   DxeTpm2MeasureBootLib.c
> > ++  DxeTpm2MeasureBootLibSanitization.c
> > ++  DxeTpm2MeasureBootLibSanitization.h
> > +
> > + [Packages]
> > +   MdePkg/MdePkg.dec
> > +@@ -46,6 +48,7 @@
> > +
> > + [LibraryClasses]
> > +   BaseMemoryLib
> > ++  SafeIntLib
> > +   DebugLib
> > +   MemoryAllocationLib
> > +   DevicePathLib
> > +@@ -65,4 +68,3 @@
> > +   gEfiFirmwareVolumeBlockProtocolGuid   ## SOMETIMES_CONSUMES
> > +   gEfiBlockIoProtocolGuid               ## SOMETIMES_CONSUMES
> > +   gEfiDiskIoProtocolGuid                ## SOMETIMES_CONSUMES
> > +-
> > +diff --git a/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureB=
ootLibSanitization.c b/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2Mea=
sureBootLibSanitization.c
> > +new file mode 100644
> > +index 0000000000..e2309655d3
> > +--- /dev/null
> > ++++ b/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLibS=
anitization.c
> > +@@ -0,0 +1,275 @@
> > ++/** @file
> > ++  The library instance provides security service of TPM2 measure boot=
 and
> > ++  Confidential Computing (CC) measure boot.
> > ++
> > ++  Caution: This file requires additional review when modified.
> > ++  This library will have external input - PE/COFF image and GPT parti=
tion.
> > ++  This external input must be validated carefully to avoid security i=
ssue like
> > ++  buffer overflow, integer overflow.
> > ++
> > ++  This file will pull out the validation logic from the following fun=
ctions, in an
> > ++  attempt to validate the untrusted input in the form of unit tests
> > ++
> > ++  These are those functions:
> > ++
> > ++  DxeTpm2MeasureBootLibImageRead() function will make sure the PE/COF=
F image content
> > ++  read is within the image buffer.
> > ++
> > ++  Tcg2MeasureGptTable() function will receive untrusted GPT partition=
 table, and parse
> > ++  partition data carefully.
> > ++
> > ++  Copyright (c) Microsoft Corporation.<BR>
> > ++  SPDX-License-Identifier: BSD-2-Clause-Patent
> > ++**/
> > ++#include <Uefi.h>
> > ++#include <Uefi/UefiSpec.h>
> > ++#include <Library/SafeIntLib.h>
> > ++#include <Library/UefiLib.h>
> > ++#include <Library/DebugLib.h>
> > ++#include <Library/BaseLib.h>
> > ++#include <IndustryStandard/UefiTcgPlatform.h>
> > ++#include <Protocol/BlockIo.h>
> > ++#include <Library/MemoryAllocationLib.h>
> > ++
> > ++#include "DxeTpm2MeasureBootLibSanitization.h"
> > ++
> > ++#define GPT_HEADER_REVISION_V1  0x00010000
> > ++
> > ++/**
> > ++  This function will validate the EFI_PARTITION_TABLE_HEADER structur=
e is safe to parse
> > ++  However this function will not attempt to verify the validity of th=
e GPT partition
> > ++  It will check the following:
> > ++    - Signature
> > ++    - Revision
> > ++    - AlternateLBA
> > ++    - FirstUsableLBA
> > ++    - LastUsableLBA
> > ++    - PartitionEntryLBA
> > ++    - NumberOfPartitionEntries
> > ++    - SizeOfPartitionEntry
> > ++    - BlockIo
> > ++
> > ++  @param[in] PrimaryHeader
> > ++    Pointer to the EFI_PARTITION_TABLE_HEADER structure.
> > ++
> > ++  @param[in] BlockIo
> > ++    Pointer to the EFI_BLOCK_IO_PROTOCOL structure.
> > ++
> > ++  @retval EFI_SUCCESS
> > ++    The EFI_PARTITION_TABLE_HEADER structure is valid.
> > ++
> > ++  @retval EFI_INVALID_PARAMETER
> > ++    The EFI_PARTITION_TABLE_HEADER structure is invalid.
> > ++**/
> > ++EFI_STATUS
> > ++EFIAPI
> > ++SanitizeEfiPartitionTableHeader (
> > ++  IN CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,
> > ++  IN CONST EFI_BLOCK_IO_PROTOCOL       *BlockIo
> > ++  )
> > ++{
> > ++  //
> > ++  // Verify that the input parameters are safe to use
> > ++  //
> > ++  if (PrimaryHeader =3D=3D NULL) {
> > ++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header!\n"));
> > ++    return EFI_INVALID_PARAMETER;
> > ++  }
> > ++
> > ++  if ((BlockIo =3D=3D NULL) || (BlockIo->Media =3D=3D NULL)) {
> > ++    DEBUG ((DEBUG_ERROR, "Invalid BlockIo!\n"));
> > ++    return EFI_INVALID_PARAMETER;
> > ++  }
> > ++
> > ++  //
> > ++  // The signature must be EFI_PTAB_HEADER_ID ("EFI PART" in ASCII)
> > ++  //
> > ++  if (PrimaryHeader->Header.Signature !=3D EFI_PTAB_HEADER_ID) {
> > ++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header!\n"));
> > ++    return EFI_DEVICE_ERROR;
> > ++  }
> > ++
> > ++  //
> > ++  // The version must be GPT_HEADER_REVISION_V1 (0x00010000)
> > ++  //
> > ++  if (PrimaryHeader->Header.Revision !=3D GPT_HEADER_REVISION_V1) {
> > ++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header Revision!\n"=
));
> > ++    return EFI_DEVICE_ERROR;
> > ++  }
> > ++
> > ++  //
> > ++  // The HeaderSize must be greater than or equal to 92 and must be l=
ess than or equal to the logical block size
> > ++  //
> > ++  if ((PrimaryHeader->Header.HeaderSize < sizeof (EFI_PARTITION_TABLE=
_HEADER)) || (PrimaryHeader->Header.HeaderSize > BlockIo->Media->BlockSize)=
) {
> > ++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header HeaderSize!\=
n"));
> > ++    return EFI_DEVICE_ERROR;
> > ++  }
> > ++
> > ++  //
> > ++  // The partition entries should all be before the first usable bloc=
k
> > ++  //
> > ++  if (PrimaryHeader->FirstUsableLBA <=3D PrimaryHeader->PartitionEntr=
yLBA) {
> > ++    DEBUG ((DEBUG_ERROR, "GPT PartitionEntryLBA is not less than Firs=
tUsableLBA!\n"));
> > ++    return EFI_DEVICE_ERROR;
> > ++  }
> > ++
> > ++  //
> > ++  // Check that the PartitionEntryLBA greater than the Max LBA
> > ++  // This will be used later for multiplication
> > ++  //
> > ++  if (PrimaryHeader->PartitionEntryLBA > DivU64x32 (MAX_UINT64, Block=
Io->Media->BlockSize)) {
> > ++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header PartitionEnt=
ryLBA!\n"));
> > ++    return EFI_DEVICE_ERROR;
> > ++  }
> > ++
> > ++  //
> > ++  // Check that the number of partition entries is greater than zero
> > ++  //
> > ++  if (PrimaryHeader->NumberOfPartitionEntries =3D=3D 0) {
> > ++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header NumberOfPart=
itionEntries!\n"));
> > ++    return EFI_DEVICE_ERROR;
> > ++  }
> > ++
> > ++  //
> > ++  // SizeOfPartitionEntry must be 128, 256, 512... improper size may =
lead to accessing uninitialized memory
> > ++  //
> > ++  if ((PrimaryHeader->SizeOfPartitionEntry < 128) || ((PrimaryHeader-=
>SizeOfPartitionEntry & (PrimaryHeader->SizeOfPartitionEntry - 1)) !=3D 0))=
 {
> > ++    DEBUG ((DEBUG_ERROR, "SizeOfPartitionEntry shall be set to a valu=
e of 128 x 2^n where n is an integer greater than or equal to zero (e.g., 1=
28, 256, 512, etc.)!\n"));
> > ++    return EFI_DEVICE_ERROR;
> > ++  }
> > ++
> > ++  //
> > ++  // This check is to prevent overflow when calculating the allocatio=
n size for the partition entries
> > ++  // This check will be used later for multiplication
> > ++  //
> > ++  if (PrimaryHeader->NumberOfPartitionEntries > DivU64x32 (MAX_UINT64=
, PrimaryHeader->SizeOfPartitionEntry)) {
> > ++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header NumberOfPart=
itionEntries!\n"));
> > ++    return EFI_DEVICE_ERROR;
> > ++  }
> > ++
> > ++  return EFI_SUCCESS;
> > ++}
> > ++
> > ++/**
> > ++  This function will validate that the allocation size from the prima=
ry header is sane
> > ++  It will check the following:
> > ++    - AllocationSize does not overflow
> > ++
> > ++  @param[in] PrimaryHeader
> > ++    Pointer to the EFI_PARTITION_TABLE_HEADER structure.
> > ++
> > ++  @param[out] AllocationSize
> > ++    Pointer to the allocation size.
> > ++
> > ++  @retval EFI_SUCCESS
> > ++    The allocation size is valid.
> > ++
> > ++  @retval EFI_OUT_OF_RESOURCES
> > ++    The allocation size is invalid.
> > ++**/
> > ++EFI_STATUS
> > ++EFIAPI
> > ++SanitizePrimaryHeaderAllocationSize (
> > ++  IN CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,
> > ++  OUT UINT32                           *AllocationSize
> > ++  )
> > ++{
> > ++  EFI_STATUS  Status;
> > ++
> > ++  if (PrimaryHeader =3D=3D NULL) {
> > ++    return EFI_INVALID_PARAMETER;
> > ++  }
> > ++
> > ++  if (AllocationSize =3D=3D NULL) {
> > ++    return EFI_INVALID_PARAMETER;
> > ++  }
> > ++
> > ++  //
> > ++  // Replacing logic:
> > ++  // PrimaryHeader->NumberOfPartitionEntries * PrimaryHeader->SizeOfP=
artitionEntry;
> > ++  //
> > ++  Status =3D SafeUint32Mult (PrimaryHeader->NumberOfPartitionEntries,=
 PrimaryHeader->SizeOfPartitionEntry, AllocationSize);
> > ++  if (EFI_ERROR (Status)) {
> > ++    DEBUG ((DEBUG_ERROR, "Allocation Size would have overflowed!\n"))=
;
> > ++    return EFI_BAD_BUFFER_SIZE;
> > ++  }
> > ++
> > ++  return EFI_SUCCESS;
> > ++}
> > ++
> > ++/**
> > ++  This function will validate that the Gpt Event Size calculated from=
 the primary header is sane
> > ++  It will check the following:
> > ++    - EventSize does not overflow
> > ++
> > ++  Important: This function includes the entire length of the allocate=
d space, including
> > ++  (sizeof (EFI_TCG2_EVENT) - sizeof (Tcg2Event->Event)) . When hashin=
g the buffer allocated with this
> > ++  size, the caller must subtract the size of the (sizeof (EFI_TCG2_EV=
ENT) - sizeof (Tcg2Event->Event))
> > ++  from the size of the buffer before hashing.
> > ++
> > ++  @param[in] PrimaryHeader - Pointer to the EFI_PARTITION_TABLE_HEADE=
R structure.
> > ++  @param[in] NumberOfPartition - Number of partitions.
> > ++  @param[out] EventSize - Pointer to the event size.
> > ++
> > ++  @retval EFI_SUCCESS
> > ++    The event size is valid.
> > ++
> > ++  @retval EFI_OUT_OF_RESOURCES
> > ++    Overflow would have occurred.
> > ++
> > ++  @retval EFI_INVALID_PARAMETER
> > ++    One of the passed parameters was invalid.
> > ++**/
> > ++EFI_STATUS
> > ++SanitizePrimaryHeaderGptEventSize (
> > ++  IN  CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,
> > ++  IN  UINTN                             NumberOfPartition,
> > ++  OUT UINT32                            *EventSize
> > ++  )
> > ++{
> > ++  EFI_STATUS  Status;
> > ++  UINT32      SafeNumberOfPartitions;
> > ++
> > ++  if (PrimaryHeader =3D=3D NULL) {
> > ++    return EFI_INVALID_PARAMETER;
> > ++  }
> > ++
> > ++  if (EventSize =3D=3D NULL) {
> > ++    return EFI_INVALID_PARAMETER;
> > ++  }
> > ++
> > ++  //
> > ++  // We shouldn't even attempt to perform the multiplication if the n=
umber of partitions is greater than the maximum value of UINT32
> > ++  //
> > ++  Status =3D SafeUintnToUint32 (NumberOfPartition, &SafeNumberOfParti=
tions);
> > ++  if (EFI_ERROR (Status)) {
> > ++    DEBUG ((DEBUG_ERROR, "NumberOfPartition would have overflowed!\n"=
));
> > ++    return EFI_INVALID_PARAMETER;
> > ++  }
> > ++
> > ++  //
> > ++  // Replacing logic:
> > ++  // (UINT32)(sizeof (EFI_GPT_DATA) - sizeof (GptData->Partitions) + =
NumberOfPartition * PrimaryHeader.SizeOfPartitionEntry);
> > ++  //
> > ++  Status =3D SafeUint32Mult (SafeNumberOfPartitions, PrimaryHeader->S=
izeOfPartitionEntry, EventSize);
> > ++  if (EFI_ERROR (Status)) {
> > ++    DEBUG ((DEBUG_ERROR, "Event Size would have overflowed!\n"));
> > ++    return EFI_BAD_BUFFER_SIZE;
> > ++  }
> > ++
> > ++  //
> > ++  // Replacing logic:
> > ++  // *EventSize + sizeof (EFI_TCG2_EVENT) - sizeof (Tcg2Event->Event)=
;
> > ++  //
> > ++  Status =3D SafeUint32Add (
> > ++             OFFSET_OF (EFI_TCG2_EVENT, Event) + OFFSET_OF (EFI_GPT_D=
ATA, Partitions),
> > ++             *EventSize,
> > ++             EventSize
> > ++             );
> > ++  if (EFI_ERROR (Status)) {
> > ++    DEBUG ((DEBUG_ERROR, "Event Size would have overflowed because of=
 GPTData!\n"));
> > ++    return EFI_BAD_BUFFER_SIZE;
> > ++  }
> > ++
> > ++  return EFI_SUCCESS;
> > ++}
> > +diff --git a/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureB=
ootLibSanitization.h b/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2Mea=
sureBootLibSanitization.h
> > +new file mode 100644
> > +index 0000000000..048b738987
> > +--- /dev/null
> > ++++ b/SecurityPkg/Library/DxeTpm2MeasureBootLib/DxeTpm2MeasureBootLibS=
anitization.h
> > +@@ -0,0 +1,113 @@
> > ++/** @file
> > ++  This file includes the function prototypes for the sanitization fun=
ctions.
> > ++
> > ++  These are those functions:
> > ++
> > ++  DxeTpm2MeasureBootLibImageRead() function will make sure the PE/COF=
F image content
> > ++  read is within the image buffer.
> > ++
> > ++  Tcg2MeasureGptTable() function will receive untrusted GPT partition=
 table, and parse
> > ++  partition data carefully.
> > ++
> > ++  Copyright (c) Microsoft Corporation.<BR>
> > ++  SPDX-License-Identifier: BSD-2-Clause-Patent
> > ++
> > ++**/
> > ++
> > ++#ifndef DXE_TPM2_MEASURE_BOOT_LIB_SANITATION_
> > ++#define DXE_TPM2_MEASURE_BOOT_LIB_SANITATION_
> > ++
> > ++#include <Uefi.h>
> > ++#include <Uefi/UefiSpec.h>
> > ++#include <Protocol/BlockIo.h>
> > ++#include <IndustryStandard/UefiTcgPlatform.h>
> > ++#include <Protocol/Tcg2Protocol.h>
> > ++
> > ++/**
> > ++  This function will validate the EFI_PARTITION_TABLE_HEADER structur=
e is safe to parse
> > ++  However this function will not attempt to verify the validity of th=
e GPT partition
> > ++  It will check the following:
> > ++    - Signature
> > ++    - Revision
> > ++    - AlternateLBA
> > ++    - FirstUsableLBA
> > ++    - LastUsableLBA
> > ++    - PartitionEntryLBA
> > ++    - NumberOfPartitionEntries
> > ++    - SizeOfPartitionEntry
> > ++    - BlockIo
> > ++
> > ++  @param[in] PrimaryHeader
> > ++    Pointer to the EFI_PARTITION_TABLE_HEADER structure.
> > ++
> > ++  @param[in] BlockIo
> > ++    Pointer to the EFI_BLOCK_IO_PROTOCOL structure.
> > ++
> > ++  @retval EFI_SUCCESS
> > ++    The EFI_PARTITION_TABLE_HEADER structure is valid.
> > ++
> > ++  @retval EFI_INVALID_PARAMETER
> > ++    The EFI_PARTITION_TABLE_HEADER structure is invalid.
> > ++**/
> > ++EFI_STATUS
> > ++EFIAPI
> > ++SanitizeEfiPartitionTableHeader (
> > ++  IN CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,
> > ++  IN CONST EFI_BLOCK_IO_PROTOCOL       *BlockIo
> > ++  );
> > ++
> > ++/**
> > ++  This function will validate that the allocation size from the prima=
ry header is sane
> > ++  It will check the following:
> > ++    - AllocationSize does not overflow
> > ++
> > ++  @param[in] PrimaryHeader
> > ++    Pointer to the EFI_PARTITION_TABLE_HEADER structure.
> > ++
> > ++  @param[out] AllocationSize
> > ++    Pointer to the allocation size.
> > ++
> > ++  @retval EFI_SUCCESS
> > ++    The allocation size is valid.
> > ++
> > ++  @retval EFI_OUT_OF_RESOURCES
> > ++    The allocation size is invalid.
> > ++**/
> > ++EFI_STATUS
> > ++EFIAPI
> > ++SanitizePrimaryHeaderAllocationSize (
> > ++  IN CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,
> > ++  OUT UINT32                           *AllocationSize
> > ++  );
> > ++
> > ++/**
> > ++  This function will validate that the Gpt Event Size calculated from=
 the primary header is sane
> > ++  It will check the following:
> > ++    - EventSize does not overflow
> > ++
> > ++  Important: This function includes the entire length of the allocate=
d space, including
> > ++  (sizeof (EFI_TCG2_EVENT) - sizeof (Tcg2Event->Event)) . When hashin=
g the buffer allocated with this
> > ++  size, the caller must subtract the size of the (sizeof (EFI_TCG2_EV=
ENT) - sizeof (Tcg2Event->Event))
> > ++  from the size of the buffer before hashing.
> > ++
> > ++  @param[in] PrimaryHeader - Pointer to the EFI_PARTITION_TABLE_HEADE=
R structure.
> > ++  @param[in] NumberOfPartition - Number of partitions.
> > ++  @param[out] EventSize - Pointer to the event size.
> > ++
> > ++  @retval EFI_SUCCESS
> > ++    The event size is valid.
> > ++
> > ++  @retval EFI_OUT_OF_RESOURCES
> > ++    Overflow would have occurred.
> > ++
> > ++  @retval EFI_INVALID_PARAMETER
> > ++    One of the passed parameters was invalid.
> > ++**/
> > ++EFI_STATUS
> > ++SanitizePrimaryHeaderGptEventSize (
> > ++  IN  CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,
> > ++  IN  UINTN                             NumberOfPartition,
> > ++  OUT UINT32                            *EventSize
> > ++  );
> > ++
> > ++#endif // DXE_TPM2_MEASURE_BOOT_LIB_SANITATION_
> > +diff --git a/SecurityPkg/Library/DxeTpm2MeasureBootLib/InternalUnitTes=
t/DxeTpm2MeasureBootLibSanitizationTest.c b/SecurityPkg/Library/DxeTpm2Meas=
ureBootLib/InternalUnitTest/DxeTpm2MeasureBootLibSanitizationTest.c
> > +new file mode 100644
> > +index 0000000000..3eb9763e3c
> > +--- /dev/null
> > ++++ b/SecurityPkg/Library/DxeTpm2MeasureBootLib/InternalUnitTest/DxeTp=
m2MeasureBootLibSanitizationTest.c
> > +@@ -0,0 +1,303 @@
> > ++/** @file
> > ++  This file includes the unit test cases for the DxeTpm2MeasureBootLi=
bSanitizationTest.c.
> > ++
> > ++  Copyright (c) Microsoft Corporation.<BR>
> > ++  SPDX-License-Identifier: BSD-2-Clause-Patent
> > ++**/
> > ++
> > ++#include <Uefi.h>
> > ++#include <Library/UefiLib.h>
> > ++#include <Library/DebugLib.h>
> > ++#include <Library/UnitTestLib.h>
> > ++#include <Protocol/BlockIo.h>
> > ++#include <Library/MemoryAllocationLib.h>
> > ++#include <Library/BaseMemoryLib.h>
> > ++#include <IndustryStandard/UefiTcgPlatform.h>
> > ++#include <Protocol/Tcg2Protocol.h>
> > ++
> > ++#include "../DxeTpm2MeasureBootLibSanitization.h"
> > ++
> > ++#define UNIT_TEST_NAME     "DxeTpm2MeasureBootLibSanitizationTest"
> > ++#define UNIT_TEST_VERSION  "1.0"
> > ++
> > ++#define DEFAULT_PRIMARY_TABLE_HEADER_REVISION                     0x0=
0010000
> > ++#define DEFAULT_PRIMARY_TABLE_HEADER_NUMBER_OF_PARTITION_ENTRIES  1
> > ++#define DEFAULT_PRIMARY_TABLE_HEADER_SIZE_OF_PARTITION_ENTRY      128
> > ++
> > ++/**
> > ++  This function tests the SanitizeEfiPartitionTableHeader function.
> > ++  It's intent is to test that a malicious EFI_PARTITION_TABLE_HEADER
> > ++  structure will not cause undefined or unexpected behavior.
> > ++
> > ++  In general the TPM should still be able to measure the data, but
> > ++  be the header should be sanitized to prevent any unexpected behavio=
r.
> > ++
> > ++  @param[in] Context  The unit test context.
> > ++
> > ++  @retval UNIT_TEST_PASSED  The test passed.
> > ++  @retval UNIT_TEST_ERROR_TEST_FAILED  The test failed.
> > ++**/
> > ++UNIT_TEST_STATUS
> > ++EFIAPI
> > ++TestSanitizeEfiPartitionTableHeader (
> > ++  IN UNIT_TEST_CONTEXT  Context
> > ++  )
> > ++{
> > ++  EFI_STATUS                  Status;
> > ++  EFI_PARTITION_TABLE_HEADER  PrimaryHeader;
> > ++  EFI_BLOCK_IO_PROTOCOL       BlockIo;
> > ++  EFI_BLOCK_IO_MEDIA          BlockMedia;
> > ++
> > ++  // Generate EFI_BLOCK_IO_MEDIA test data
> > ++  BlockMedia.MediaId          =3D 1;
> > ++  BlockMedia.RemovableMedia   =3D FALSE;
> > ++  BlockMedia.MediaPresent     =3D TRUE;
> > ++  BlockMedia.LogicalPartition =3D FALSE;
> > ++  BlockMedia.ReadOnly         =3D FALSE;
> > ++  BlockMedia.WriteCaching     =3D FALSE;
> > ++  BlockMedia.BlockSize        =3D 512;
> > ++  BlockMedia.IoAlign          =3D 1;
> > ++  BlockMedia.LastBlock        =3D 0;
> > ++
> > ++  // Generate EFI_BLOCK_IO_PROTOCOL test data
> > ++  BlockIo.Revision    =3D 1;
> > ++  BlockIo.Media       =3D &BlockMedia;
> > ++  BlockIo.Reset       =3D NULL;
> > ++  BlockIo.ReadBlocks  =3D NULL;
> > ++  BlockIo.WriteBlocks =3D NULL;
> > ++  BlockIo.FlushBlocks =3D NULL;
> > ++
> > ++  // Geneate EFI_PARTITION_TABLE_HEADER test data
> > ++  PrimaryHeader.Header.Signature         =3D EFI_PTAB_HEADER_ID;
> > ++  PrimaryHeader.Header.Revision          =3D DEFAULT_PRIMARY_TABLE_HE=
ADER_REVISION;
> > ++  PrimaryHeader.Header.HeaderSize        =3D sizeof (EFI_PARTITION_TA=
BLE_HEADER);
> > ++  PrimaryHeader.MyLBA                    =3D 1;
> > ++  PrimaryHeader.AlternateLBA             =3D 2;
> > ++  PrimaryHeader.FirstUsableLBA           =3D 3;
> > ++  PrimaryHeader.LastUsableLBA            =3D 4;
> > ++  PrimaryHeader.PartitionEntryLBA        =3D 5;
> > ++  PrimaryHeader.NumberOfPartitionEntries =3D DEFAULT_PRIMARY_TABLE_HE=
ADER_NUMBER_OF_PARTITION_ENTRIES;
> > ++  PrimaryHeader.SizeOfPartitionEntry     =3D DEFAULT_PRIMARY_TABLE_HE=
ADER_SIZE_OF_PARTITION_ENTRY;
> > ++  PrimaryHeader.PartitionEntryArrayCRC32 =3D 0; // Purposely invalid
> > ++
> > ++  // Calculate the CRC32 of the PrimaryHeader
> > ++  PrimaryHeader.Header.CRC32 =3D CalculateCrc32 ((UINT8 *)&PrimaryHea=
der, PrimaryHeader.Header.HeaderSize);
> > ++
> > ++  // Test that a normal PrimaryHeader passes validation
> > ++  Status =3D SanitizeEfiPartitionTableHeader (&PrimaryHeader, &BlockI=
o);
> > ++  UT_ASSERT_NOT_EFI_ERROR (Status);
> > ++
> > ++  // Test that when number of partition entries is 0, the function re=
turns EFI_DEVICE_ERROR
> > ++  // Should print "Invalid Partition Table Header NumberOfPartitionEn=
tries!""
> > ++  PrimaryHeader.NumberOfPartitionEntries =3D 0;
> > ++  Status                                 =3D SanitizeEfiPartitionTabl=
eHeader (&PrimaryHeader, &BlockIo);
> > ++  UT_ASSERT_EQUAL (Status, EFI_DEVICE_ERROR);
> > ++  PrimaryHeader.NumberOfPartitionEntries =3D DEFAULT_PRIMARY_TABLE_HE=
ADER_SIZE_OF_PARTITION_ENTRY;
> > ++
> > ++  // Test that when the header size is too small, the function return=
s EFI_DEVICE_ERROR
> > ++  // Should print "Invalid Partition Table Header Size!"
> > ++  PrimaryHeader.Header.HeaderSize =3D 0;
> > ++  Status                          =3D SanitizeEfiPartitionTableHeader=
 (&PrimaryHeader, &BlockIo);
> > ++  UT_ASSERT_EQUAL (Status, EFI_DEVICE_ERROR);
> > ++  PrimaryHeader.Header.HeaderSize =3D sizeof (EFI_PARTITION_TABLE_HEA=
DER);
> > ++
> > ++  // Test that when the SizeOfPartitionEntry is too small, the functi=
on returns EFI_DEVICE_ERROR
> > ++  // should print: "SizeOfPartitionEntry shall be set to a value of 1=
28 x 2^n where n is an integer greater than or equal to zero (e.g., 128, 25=
6, 512, etc.)!"
> > ++  PrimaryHeader.SizeOfPartitionEntry =3D 1;
> > ++  Status                             =3D SanitizeEfiPartitionTableHea=
der (&PrimaryHeader, &BlockIo);
> > ++  UT_ASSERT_EQUAL (Status, EFI_DEVICE_ERROR);
> > ++
> > ++  DEBUG ((DEBUG_INFO, "%a: Test passed\n", __func__));
> > ++
> > ++  return UNIT_TEST_PASSED;
> > ++}
> > ++
> > ++/**
> > ++  This function tests the SanitizePrimaryHeaderAllocationSize functio=
n.
> > ++  It's intent is to test that the untrusted input from a EFI_PARTITIO=
N_TABLE_HEADER
> > ++  structure will not cause an overflow when calculating the allocatio=
n size.
> > ++
> > ++  @param[in] Context  The unit test context.
> > ++
> > ++  @retval UNIT_TEST_PASSED  The test passed.
> > ++  @retval UNIT_TEST_ERROR_TEST_FAILED  The test failed.
> > ++**/
> > ++UNIT_TEST_STATUS
> > ++EFIAPI
> > ++TestSanitizePrimaryHeaderAllocationSize (
> > ++  IN UNIT_TEST_CONTEXT  Context
> > ++  )
> > ++{
> > ++  UINT32  AllocationSize;
> > ++
> > ++  EFI_STATUS                  Status;
> > ++  EFI_PARTITION_TABLE_HEADER  PrimaryHeader;
> > ++
> > ++  // Test that a normal PrimaryHeader passes validation
> > ++  PrimaryHeader.NumberOfPartitionEntries =3D 5;
> > ++  PrimaryHeader.SizeOfPartitionEntry     =3D DEFAULT_PRIMARY_TABLE_HE=
ADER_SIZE_OF_PARTITION_ENTRY;
> > ++
> > ++  Status =3D SanitizePrimaryHeaderAllocationSize (&PrimaryHeader, &Al=
locationSize);
> > ++  UT_ASSERT_NOT_EFI_ERROR (Status);
> > ++
> > ++  // Test that the allocation size is correct compared to the existin=
g logic
> > ++  UT_ASSERT_EQUAL (AllocationSize, PrimaryHeader.NumberOfPartitionEnt=
ries * PrimaryHeader.SizeOfPartitionEntry);
> > ++
> > ++  // Test that an overflow is detected
> > ++  PrimaryHeader.NumberOfPartitionEntries =3D MAX_UINT32;
> > ++  PrimaryHeader.SizeOfPartitionEntry     =3D 5;
> > ++  Status                                 =3D SanitizePrimaryHeaderAll=
ocationSize (&PrimaryHeader, &AllocationSize);
> > ++  UT_ASSERT_EQUAL (Status, EFI_BAD_BUFFER_SIZE);
> > ++
> > ++  // Test the inverse
> > ++  PrimaryHeader.NumberOfPartitionEntries =3D 5;
> > ++  PrimaryHeader.SizeOfPartitionEntry     =3D MAX_UINT32;
> > ++  Status                                 =3D SanitizePrimaryHeaderAll=
ocationSize (&PrimaryHeader, &AllocationSize);
> > ++  UT_ASSERT_EQUAL (Status, EFI_BAD_BUFFER_SIZE);
> > ++
> > ++  // Test the worst case scenario
> > ++  PrimaryHeader.NumberOfPartitionEntries =3D MAX_UINT32;
> > ++  PrimaryHeader.SizeOfPartitionEntry     =3D MAX_UINT32;
> > ++  Status                                 =3D SanitizePrimaryHeaderAll=
ocationSize (&PrimaryHeader, &AllocationSize);
> > ++  UT_ASSERT_EQUAL (Status, EFI_BAD_BUFFER_SIZE);
> > ++
> > ++  DEBUG ((DEBUG_INFO, "%a: Test passed\n", __func__));
> > ++
> > ++  return UNIT_TEST_PASSED;
> > ++}
> > ++
> > ++/**
> > ++  This function tests the SanitizePrimaryHeaderGptEventSize function.
> > ++  It's intent is to test that the untrusted input from a EFI_GPT_DATA=
 structure
> > ++  will not cause an overflow when calculating the event size.
> > ++
> > ++  @param[in] Context  The unit test context.
> > ++
> > ++  @retval UNIT_TEST_PASSED  The test passed.
> > ++  @retval UNIT_TEST_ERROR_TEST_FAILED  The test failed.
> > ++**/
> > ++UNIT_TEST_STATUS
> > ++EFIAPI
> > ++TestSanitizePrimaryHeaderGptEventSize (
> > ++  IN UNIT_TEST_CONTEXT  Context
> > ++  )
> > ++{
> > ++  UINT32                      EventSize;
> > ++  UINT32                      ExistingLogicEventSize;
> > ++  EFI_STATUS                  Status;
> > ++  EFI_PARTITION_TABLE_HEADER  PrimaryHeader;
> > ++  UINTN                       NumberOfPartition;
> > ++  EFI_GPT_DATA                *GptData;
> > ++  EFI_TCG2_EVENT              *Tcg2Event;
> > ++
> > ++  Tcg2Event =3D NULL;
> > ++  GptData   =3D NULL;
> > ++
> > ++  // Test that a normal PrimaryHeader passes validation
> > ++  PrimaryHeader.NumberOfPartitionEntries =3D 5;
> > ++  PrimaryHeader.SizeOfPartitionEntry     =3D DEFAULT_PRIMARY_TABLE_HE=
ADER_SIZE_OF_PARTITION_ENTRY;
> > ++
> > ++  // set the number of partitions
> > ++  NumberOfPartition =3D 13;
> > ++
> > ++  // that the primary event size is correct
> > ++  Status =3D SanitizePrimaryHeaderGptEventSize (&PrimaryHeader, Numbe=
rOfPartition, &EventSize);
> > ++  UT_ASSERT_NOT_EFI_ERROR (Status);
> > ++
> > ++  // Calculate the existing logic event size
> > ++  ExistingLogicEventSize =3D (UINT32)(OFFSET_OF (EFI_TCG2_EVENT, Even=
t) + OFFSET_OF (EFI_GPT_DATA, Partitions)
> > ++                                    + NumberOfPartition * PrimaryHead=
er.SizeOfPartitionEntry);
> > ++
> > ++  // Check that the event size is correct
> > ++  UT_ASSERT_EQUAL (EventSize, ExistingLogicEventSize);
> > ++
> > ++  // Tests that the primary event size may not overflow
> > ++  Status =3D SanitizePrimaryHeaderGptEventSize (&PrimaryHeader, MAX_U=
INT32, &EventSize);
> > ++  UT_ASSERT_EQUAL (Status, EFI_BAD_BUFFER_SIZE);
> > ++
> > ++  // Test that the size of partition entries may not overflow
> > ++  PrimaryHeader.SizeOfPartitionEntry =3D MAX_UINT32;
> > ++  Status                             =3D SanitizePrimaryHeaderGptEven=
tSize (&PrimaryHeader, NumberOfPartition, &EventSize);
> > ++  UT_ASSERT_EQUAL (Status, EFI_BAD_BUFFER_SIZE);
> > ++
> > ++  DEBUG ((DEBUG_INFO, "%a: Test passed\n", __func__));
> > ++
> > ++  return UNIT_TEST_PASSED;
> > ++}
> > ++
> > ++// *-----------------------------------------------------------------=
---*
> > ++// *  Unit Test Code Main Function
> > ++// *-----------------------------------------------------------------=
---*
> > ++
> > ++/**
> > ++  This function acts as the entry point for the unit tests.
> > ++
> > ++  @retval UNIT_TEST_PASSED  The test passed.
> > ++  @retval UNIT_TEST_ERROR_TEST_FAILED  The test failed.
> > ++  @retval others The test failed.
> > ++**/
> > ++EFI_STATUS
> > ++EFIAPI
> > ++UefiTestMain (
> > ++  VOID
> > ++  )
> > ++{
> > ++  EFI_STATUS                  Status;
> > ++  UNIT_TEST_FRAMEWORK_HANDLE  Framework;
> > ++  UNIT_TEST_SUITE_HANDLE      Tcg2MeasureBootLibValidationTestSuite;
> > ++
> > ++  Framework =3D NULL;
> > ++
> > ++  DEBUG ((DEBUG_INFO, "%a: TestMain() - Start\n", UNIT_TEST_NAME));
> > ++
> > ++  Status =3D InitUnitTestFramework (&Framework, UNIT_TEST_NAME, gEfiC=
allerBaseName, UNIT_TEST_VERSION);
> > ++  if (EFI_ERROR (Status)) {
> > ++    DEBUG ((DEBUG_ERROR, "%a: Failed in InitUnitTestFramework. Status=
 =3D %r\n", UNIT_TEST_NAME, Status));
> > ++    goto EXIT;
> > ++  }
> > ++
> > ++  Status =3D CreateUnitTestSuite (&Tcg2MeasureBootLibValidationTestSu=
ite, Framework, "Tcg2MeasureBootLibValidationTestSuite", "Common.Tcg2Measur=
eBootLibValidation", NULL, NULL);
> > ++  if (EFI_ERROR (Status)) {
> > ++    DEBUG ((DEBUG_ERROR, "%s: Failed in CreateUnitTestSuite for Tcg2M=
easureBootLibValidationTestSuite\n", UNIT_TEST_NAME));
> > ++    Status =3D EFI_OUT_OF_RESOURCES;
> > ++    goto EXIT;
> > ++  }
> > ++
> > ++  // -----------Suite---------------------------------Description----=
------------------------Class----------------------------------Test Functio=
n------------------------Pre---Clean-Context
> > ++  AddTestCase (Tcg2MeasureBootLibValidationTestSuite, "Tests Validati=
ng EFI Partition Table", "Common.Tcg2MeasureBootLibValidation", TestSanitiz=
eEfiPartitionTableHeader, NULL, NULL, NULL);
> > ++  AddTestCase (Tcg2MeasureBootLibValidationTestSuite, "Tests Primary =
header gpt event checks for overflow", "Common.Tcg2MeasureBootLibValidation=
", TestSanitizePrimaryHeaderAllocationSize, NULL, NULL, NULL);
> > ++  AddTestCase (Tcg2MeasureBootLibValidationTestSuite, "Tests Primary =
header allocation size checks for overflow", "Common.Tcg2MeasureBootLibVali=
dation", TestSanitizePrimaryHeaderGptEventSize, NULL, NULL, NULL);
> > ++
> > ++  Status =3D RunAllTestSuites (Framework);
> > ++
> > ++EXIT:
> > ++  if (Framework !=3D NULL) {
> > ++    FreeUnitTestFramework (Framework);
> > ++  }
> > ++
> > ++  DEBUG ((DEBUG_INFO, "%a: TestMain() - End\n", UNIT_TEST_NAME));
> > ++  return Status;
> > ++}
> > ++
> > ++///
> > ++/// Avoid ECC error for function name that starts with lower case let=
ter
> > ++///
> > ++#define DxeTpm2MeasureBootLibUnitTestMain  main
> > ++
> > ++/**
> > ++  Standard POSIX C entry point for host based unit test execution.
> > ++
> > ++  @param[in] Argc  Number of arguments
> > ++  @param[in] Argv  Array of pointers to arguments
> > ++
> > ++  @retval 0      Success
> > ++  @retval other  Error
> > ++**/
> > ++INT32
> > ++DxeTpm2MeasureBootLibUnitTestMain (
> > ++  IN INT32  Argc,
> > ++  IN CHAR8  *Argv[]
> > ++  )
> > ++{
> > ++  return (INT32)UefiTestMain ();
> > ++}
> > +diff --git a/SecurityPkg/Library/DxeTpm2MeasureBootLib/InternalUnitTes=
t/DxeTpm2MeasureBootLibSanitizationTestHost.inf b/SecurityPkg/Library/DxeTp=
m2MeasureBootLib/InternalUnitTest/DxeTpm2MeasureBootLibSanitizationTestHost=
.inf
> > +new file mode 100644
> > +index 0000000000..2999aa2a44
> > +--- /dev/null
> > ++++ b/SecurityPkg/Library/DxeTpm2MeasureBootLib/InternalUnitTest/DxeTp=
m2MeasureBootLibSanitizationTestHost.inf
> > +@@ -0,0 +1,28 @@
> > ++## @file
> > ++# This file builds the unit tests for DxeTpm2MeasureBootLib
> > ++#
> > ++# Copyright (C) Microsoft Corporation.<BR>
> > ++# SPDX-License-Identifier: BSD-2-Clause-Patent
> > ++##
> > ++
> > ++[Defines]
> > ++  INF_VERSION                    =3D 0x00010006
> > ++  BASE_NAME                      =3D DxeTpm2MeasuredBootLibTest
> > ++  FILE_GUID                      =3D 144d757f-d423-484e-9309-a23695fa=
d5bd
> > ++  MODULE_TYPE                    =3D HOST_APPLICATION
> > ++  VERSION_STRING                 =3D 1.0
> > ++  ENTRY_POINT                    =3D main
> > ++
> > ++[Sources]
> > ++  DxeTpm2MeasureBootLibSanitizationTest.c
> > ++  ../DxeTpm2MeasureBootLibSanitization.c
> > ++
> > ++[Packages]
> > ++  MdePkg/MdePkg.dec
> > ++
> > ++[LibraryClasses]
> > ++  BaseLib
> > ++  DebugLib
> > ++  UnitTestLib
> > ++  PrintLib
> > ++  SafeIntLib
> > +diff --git a/SecurityPkg/SecurityPkg.ci.yaml b/SecurityPkg/SecurityPkg=
.ci.yaml
> > +index 7912142398..da811fdf93 100644
> > +--- a/SecurityPkg/SecurityPkg.ci.yaml
> > ++++ b/SecurityPkg/SecurityPkg.ci.yaml
> > +@@ -15,6 +15,7 @@
> > +         ##     "<ErrorID>", "<KeyWord>"
> > +         ## ]
> > +         "ExceptionList": [
> > ++            "8001", "DxeTpm2MeasureBootLibUnitTestMain",
> > +         ],
> > +         ## Both file path and directory path are accepted.
> > +         "IgnoreFiles": [
> > +--
> > +2.40.0
> > +
> > diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2022-36763-0002.patch b/me=
ta/recipes-core/ovmf/ovmf/CVE-2022-36763-0002.patch
> > new file mode 100644
> > index 0000000000..6c20cc305e
> > --- /dev/null
> > +++ b/meta/recipes-core/ovmf/ovmf/CVE-2022-36763-0002.patch
> > @@ -0,0 +1,889 @@
> > +From 4776a1b39ee08fc45c70c1eab5a0195f325000d3 Mon Sep 17 00:00:00 2001
> > +From: "Douglas Flick [MSFT]" <doug.edk2@gmail.com>
> > +Date: Fri, 12 Jan 2024 02:16:02 +0800
> > +Subject: [PATCH] SecurityPkg: DxeTpmMeasureBootLib: SECURITY PATCH 411=
7 - CVE
> > + 2022-36763
> > +
> > +This commit contains the patch files and tests for DxeTpmMeasureBootLi=
b
> > +CVE 2022-36763.
> > +
> > +Cc: Jiewen Yao <jiewen.yao@intel.com>
> > +
> > +Signed-off-by: Doug Flick [MSFT] <doug.edk2@gmail.com>
> > +Reviewed-by: Jiewen Yao <jiewen.yao@intel.com>
> > +
> > +CVE: CVE-2022-36763
> > +
> > +Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/47=
76a1b39ee08fc45c70c1eab5a0195f325000d3]
> > +
> > +Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
> > +---
> > + .../DxeTpmMeasureBootLib.c                    |  40 ++-
> > + .../DxeTpmMeasureBootLib.inf                  |   4 +-
> > + .../DxeTpmMeasureBootLibSanitization.c        | 241 ++++++++++++++
> > + .../DxeTpmMeasureBootLibSanitization.h        | 114 +++++++
> > + .../DxeTpmMeasureBootLibSanitizationTest.c    | 301 +++++++++++++++++=
+
> > + ...eTpmMeasureBootLibSanitizationTestHost.inf |  28 ++
> > + SecurityPkg/SecurityPkg.ci.yaml               |   1 +
> > + 7 files changed, 715 insertions(+), 14 deletions(-)
> > + create mode 100644 SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMea=
sureBootLibSanitization.c
> > + create mode 100644 SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMea=
sureBootLibSanitization.h
> > + create mode 100644 SecurityPkg/Library/DxeTpmMeasureBootLib/InternalU=
nitTest/DxeTpmMeasureBootLibSanitizationTest.c
> > + create mode 100644 SecurityPkg/Library/DxeTpmMeasureBootLib/InternalU=
nitTest/DxeTpmMeasureBootLibSanitizationTestHost.inf
> > +
> > +diff --git a/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBoo=
tLib.c b/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootLib.c
> > +index 220393dd2b..669ab19134 100644
> > +--- a/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootLib.c
> > ++++ b/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootLib.c
> > +@@ -18,6 +18,8 @@
> > + Copyright (c) 2009 - 2018, Intel Corporation. All rights reserved.<BR=
>
> > + SPDX-License-Identifier: BSD-2-Clause-Patent
> > +
> > ++Copyright (c) Microsoft Corporation.<BR>
> > ++SPDX-License-Identifier: BSD-2-Clause-Patent
> > + **/
> > +
> > + #include <PiDxe.h>
> > +@@ -40,6 +42,8 @@ SPDX-License-Identifier: BSD-2-Clause-Patent
> > + #include <Library/SecurityManagementLib.h>
> > + #include <Library/HobLib.h>
> > +
> > ++#include "DxeTpmMeasureBootLibSanitization.h"
> > ++
> > + //
> > + // Flag to check GPT partition. It only need be measured once.
> > + //
> > +@@ -136,6 +140,9 @@ TcgMeasureGptTable (
> > +   UINT32                      EventSize;
> > +   UINT32                      EventNumber;
> > +   EFI_PHYSICAL_ADDRESS        EventLogLastEntry;
> > ++  UINT32                      AllocSize;
> > ++
> > ++  GptData =3D NULL;
> > +
> > +   if (mMeasureGptCount > 0) {
> > +     return EFI_SUCCESS;
> > +@@ -166,8 +173,8 @@ TcgMeasureGptTable (
> > +                      BlockIo->Media->BlockSize,
> > +                      (UINT8 *)PrimaryHeader
> > +                      );
> > +-  if (EFI_ERROR (Status)) {
> > +-    DEBUG ((DEBUG_ERROR, "Failed to Read Partition Table Header!\n"))=
;
> > ++  if (EFI_ERROR (Status) || EFI_ERROR (SanitizeEfiPartitionTableHeade=
r (PrimaryHeader, BlockIo))) {
> > ++    DEBUG ((DEBUG_ERROR, "Failed to read Partition Table Header or in=
valid Partition Table Header!\n"));
> > +     FreePool (PrimaryHeader);
> > +     return EFI_DEVICE_ERROR;
> > +   }
> > +@@ -175,7 +182,13 @@ TcgMeasureGptTable (
> > +   //
> > +   // Read the partition entry.
> > +   //
> > +-  EntryPtr =3D (UINT8 *)AllocatePool (PrimaryHeader->NumberOfPartitio=
nEntries * PrimaryHeader->SizeOfPartitionEntry);
> > ++  Status =3D SanitizePrimaryHeaderAllocationSize (PrimaryHeader, &All=
ocSize);
> > ++  if (EFI_ERROR (Status)) {
> > ++    FreePool (PrimaryHeader);
> > ++    return EFI_DEVICE_ERROR;
> > ++  }
> > ++
> > ++  EntryPtr =3D (UINT8 *)AllocatePool (AllocSize);
> > +   if (EntryPtr =3D=3D NULL) {
> > +     FreePool (PrimaryHeader);
> > +     return EFI_OUT_OF_RESOURCES;
> > +@@ -185,7 +198,7 @@ TcgMeasureGptTable (
> > +                      DiskIo,
> > +                      BlockIo->Media->MediaId,
> > +                      MultU64x32 (PrimaryHeader->PartitionEntryLBA, Bl=
ockIo->Media->BlockSize),
> > +-                     PrimaryHeader->NumberOfPartitionEntries * Primar=
yHeader->SizeOfPartitionEntry,
> > ++                     AllocSize,
> > +                      EntryPtr
> > +                      );
> > +   if (EFI_ERROR (Status)) {
> > +@@ -210,9 +223,8 @@ TcgMeasureGptTable (
> > +   //
> > +   // Prepare Data for Measurement
> > +   //
> > +-  EventSize =3D (UINT32)(sizeof (EFI_GPT_DATA) - sizeof (GptData->Par=
titions)
> > +-                       + NumberOfPartition * PrimaryHeader->SizeOfPar=
titionEntry);
> > +-  TcgEvent =3D (TCG_PCR_EVENT *)AllocateZeroPool (EventSize + sizeof =
(TCG_PCR_EVENT_HDR));
> > ++  Status   =3D SanitizePrimaryHeaderGptEventSize (PrimaryHeader, Numb=
erOfPartition, &EventSize);
> > ++  TcgEvent =3D (TCG_PCR_EVENT *)AllocateZeroPool (EventSize);
> > +   if (TcgEvent =3D=3D NULL) {
> > +     FreePool (PrimaryHeader);
> > +     FreePool (EntryPtr);
> > +@@ -221,7 +233,7 @@ TcgMeasureGptTable (
> > +
> > +   TcgEvent->PCRIndex  =3D 5;
> > +   TcgEvent->EventType =3D EV_EFI_GPT_EVENT;
> > +-  TcgEvent->EventSize =3D EventSize;
> > ++  TcgEvent->EventSize =3D EventSize - sizeof (TCG_PCR_EVENT_HDR);
> > +   GptData             =3D (EFI_GPT_DATA *)TcgEvent->Event;
> > +
> > +   //
> > +@@ -361,11 +373,13 @@ TcgMeasurePeImage (
> > +       TcgEvent->PCRIndex  =3D 2;
> > +       break;
> > +     default:
> > +-      DEBUG ((
> > +-        DEBUG_ERROR,
> > +-        "TcgMeasurePeImage: Unknown subsystem type %d",
> > +-        ImageType
> > +-        ));
> > ++      DEBUG (
> > ++        (
> > ++         DEBUG_ERROR,
> > ++         "TcgMeasurePeImage: Unknown subsystem type %d",
> > ++         ImageType
> > ++        )
> > ++        );
> > +       goto Finish;
> > +   }
> > +
> > +diff --git a/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBoo=
tLib.inf b/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootLib.in=
f
> > +index ebab6f7c1e..414c654d15 100644
> > +--- a/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootLib.in=
f
> > ++++ b/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootLib.in=
f
> > +@@ -32,6 +32,8 @@
> > +
> > + [Sources]
> > +   DxeTpmMeasureBootLib.c
> > ++  DxeTpmMeasureBootLibSanitization.c
> > ++  DxeTpmMeasureBootLibSanitization.h
> > +
> > + [Packages]
> > +   MdePkg/MdePkg.dec
> > +@@ -41,6 +43,7 @@
> > +
> > + [LibraryClasses]
> > +   BaseMemoryLib
> > ++  SafeIntLib
> > +   DebugLib
> > +   MemoryAllocationLib
> > +   DevicePathLib
> > +@@ -59,4 +62,3 @@
> > +   gEfiFirmwareVolumeBlockProtocolGuid   ## SOMETIMES_CONSUMES
> > +   gEfiBlockIoProtocolGuid               ## SOMETIMES_CONSUMES
> > +   gEfiDiskIoProtocolGuid                ## SOMETIMES_CONSUMES
> > +-
> > +diff --git a/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBoo=
tLibSanitization.c b/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasure=
BootLibSanitization.c
> > +new file mode 100644
> > +index 0000000000..a3fa46f5e6
> > +--- /dev/null
> > ++++ b/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootLibSan=
itization.c
> > +@@ -0,0 +1,241 @@
> > ++/** @file
> > ++  The library instance provides security service of TPM2 measure boot=
 and
> > ++  Confidential Computing (CC) measure boot.
> > ++
> > ++  Caution: This file requires additional review when modified.
> > ++  This library will have external input - PE/COFF image and GPT parti=
tion.
> > ++  This external input must be validated carefully to avoid security i=
ssue like
> > ++  buffer overflow, integer overflow.
> > ++
> > ++  This file will pull out the validation logic from the following fun=
ctions, in an
> > ++  attempt to validate the untrusted input in the form of unit tests
> > ++
> > ++  These are those functions:
> > ++
> > ++  DxeTpmMeasureBootLibImageRead() function will make sure the PE/COFF=
 image content
> > ++  read is within the image buffer.
> > ++
> > ++  Tcg2MeasureGptTable() function will receive untrusted GPT partition=
 table, and parse
> > ++  partition data carefully.
> > ++
> > ++  Copyright (c) Microsoft Corporation.<BR>
> > ++  SPDX-License-Identifier: BSD-2-Clause-Patent
> > ++**/
> > ++#include <Uefi.h>
> > ++#include <Uefi/UefiSpec.h>
> > ++#include <Library/SafeIntLib.h>
> > ++#include <Library/UefiLib.h>
> > ++#include <Library/DebugLib.h>
> > ++#include <Library/BaseLib.h>
> > ++#include <IndustryStandard/UefiTcgPlatform.h>
> > ++#include <Protocol/BlockIo.h>
> > ++#include <Library/MemoryAllocationLib.h>
> > ++
> > ++#include "DxeTpmMeasureBootLibSanitization.h"
> > ++
> > ++#define GPT_HEADER_REVISION_V1  0x00010000
> > ++
> > ++/**
> > ++  This function will validate the EFI_PARTITION_TABLE_HEADER structur=
e is safe to parse
> > ++  However this function will not attempt to verify the validity of th=
e GPT partition
> > ++  It will check the following:
> > ++    - Signature
> > ++    - Revision
> > ++    - AlternateLBA
> > ++    - FirstUsableLBA
> > ++    - LastUsableLBA
> > ++    - PartitionEntryLBA
> > ++    - NumberOfPartitionEntries
> > ++    - SizeOfPartitionEntry
> > ++    - BlockIo
> > ++
> > ++  @param[in] PrimaryHeader
> > ++    Pointer to the EFI_PARTITION_TABLE_HEADER structure.
> > ++
> > ++  @param[in] BlockIo
> > ++    Pointer to the EFI_BLOCK_IO_PROTOCOL structure.
> > ++
> > ++  @retval EFI_SUCCESS
> > ++    The EFI_PARTITION_TABLE_HEADER structure is valid.
> > ++
> > ++  @retval EFI_INVALID_PARAMETER
> > ++    The EFI_PARTITION_TABLE_HEADER structure is invalid.
> > ++**/
> > ++EFI_STATUS
> > ++EFIAPI
> > ++SanitizeEfiPartitionTableHeader (
> > ++  IN CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,
> > ++  IN CONST EFI_BLOCK_IO_PROTOCOL       *BlockIo
> > ++  )
> > ++{
> > ++  // Verify that the input parameters are safe to use
> > ++  if (PrimaryHeader =3D=3D NULL) {
> > ++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header!\n"));
> > ++    return EFI_INVALID_PARAMETER;
> > ++  }
> > ++
> > ++  if ((BlockIo =3D=3D NULL) || (BlockIo->Media =3D=3D NULL)) {
> > ++    DEBUG ((DEBUG_ERROR, "Invalid BlockIo!\n"));
> > ++    return EFI_INVALID_PARAMETER;
> > ++  }
> > ++
> > ++  // The signature must be EFI_PTAB_HEADER_ID ("EFI PART" in ASCII)
> > ++  if (PrimaryHeader->Header.Signature !=3D EFI_PTAB_HEADER_ID) {
> > ++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header!\n"));
> > ++    return EFI_DEVICE_ERROR;
> > ++  }
> > ++
> > ++  // The version must be GPT_HEADER_REVISION_V1 (0x00010000)
> > ++  if (PrimaryHeader->Header.Revision !=3D GPT_HEADER_REVISION_V1) {
> > ++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header Revision!\n"=
));
> > ++    return EFI_DEVICE_ERROR;
> > ++  }
> > ++
> > ++  // The HeaderSize must be greater than or equal to 92 and must be l=
ess than or equal to the logical block size
> > ++  if ((PrimaryHeader->Header.HeaderSize < sizeof (EFI_PARTITION_TABLE=
_HEADER)) || (PrimaryHeader->Header.HeaderSize > BlockIo->Media->BlockSize)=
) {
> > ++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header HeaderSize!\=
n"));
> > ++    return EFI_DEVICE_ERROR;
> > ++  }
> > ++
> > ++  // check that the PartitionEntryLBA greater than the Max LBA
> > ++  // This will be used later for multiplication
> > ++  if (PrimaryHeader->PartitionEntryLBA > DivU64x32 (MAX_UINT64, Block=
Io->Media->BlockSize)) {
> > ++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header PartitionEnt=
ryLBA!\n"));
> > ++    return EFI_DEVICE_ERROR;
> > ++  }
> > ++
> > ++  // Check that the number of partition entries is greater than zero
> > ++  if (PrimaryHeader->NumberOfPartitionEntries =3D=3D 0) {
> > ++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header NumberOfPart=
itionEntries!\n"));
> > ++    return EFI_DEVICE_ERROR;
> > ++  }
> > ++
> > ++  // SizeOfPartitionEntry must be 128, 256, 512... improper size may =
lead to accessing uninitialized memory
> > ++  if ((PrimaryHeader->SizeOfPartitionEntry < 128) || ((PrimaryHeader-=
>SizeOfPartitionEntry & (PrimaryHeader->SizeOfPartitionEntry - 1)) !=3D 0))=
 {
> > ++    DEBUG ((DEBUG_ERROR, "SizeOfPartitionEntry shall be set to a valu=
e of 128 x 2^n where n is an integer greater than or equal to zero (e.g., 1=
28, 256, 512, etc.)!\n"));
> > ++    return EFI_DEVICE_ERROR;
> > ++  }
> > ++
> > ++  // This check is to prevent overflow when calculating the allocatio=
n size for the partition entries
> > ++  // This check will be used later for multiplication
> > ++  if (PrimaryHeader->NumberOfPartitionEntries > DivU64x32 (MAX_UINT64=
, PrimaryHeader->SizeOfPartitionEntry)) {
> > ++    DEBUG ((DEBUG_ERROR, "Invalid Partition Table Header NumberOfPart=
itionEntries!\n"));
> > ++    return EFI_DEVICE_ERROR;
> > ++  }
> > ++
> > ++  return EFI_SUCCESS;
> > ++}
> > ++
> > ++/**
> > ++  This function will validate that the allocation size from the prima=
ry header is sane
> > ++  It will check the following:
> > ++    - AllocationSize does not overflow
> > ++
> > ++  @param[in] PrimaryHeader
> > ++    Pointer to the EFI_PARTITION_TABLE_HEADER structure.
> > ++
> > ++  @param[out] AllocationSize
> > ++    Pointer to the allocation size.
> > ++
> > ++  @retval EFI_SUCCESS
> > ++    The allocation size is valid.
> > ++
> > ++  @retval EFI_OUT_OF_RESOURCES
> > ++    The allocation size is invalid.
> > ++**/
> > ++EFI_STATUS
> > ++EFIAPI
> > ++SanitizePrimaryHeaderAllocationSize (
> > ++  IN CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,
> > ++  OUT UINT32                           *AllocationSize
> > ++  )
> > ++{
> > ++  EFI_STATUS  Status;
> > ++
> > ++  if (PrimaryHeader =3D=3D NULL) {
> > ++    return EFI_INVALID_PARAMETER;
> > ++  }
> > ++
> > ++  if (AllocationSize =3D=3D NULL) {
> > ++    return EFI_INVALID_PARAMETER;
> > ++  }
> > ++
> > ++  // Replacing logic:
> > ++  // PrimaryHeader->NumberOfPartitionEntries * PrimaryHeader->SizeOfP=
artitionEntry;
> > ++  Status =3D SafeUint32Mult (PrimaryHeader->NumberOfPartitionEntries,=
 PrimaryHeader->SizeOfPartitionEntry, AllocationSize);
> > ++  if (EFI_ERROR (Status)) {
> > ++    DEBUG ((DEBUG_ERROR, "Allocation Size would have overflowed!\n"))=
;
> > ++    return EFI_BAD_BUFFER_SIZE;
> > ++  }
> > ++
> > ++  return EFI_SUCCESS;
> > ++}
> > ++
> > ++/**
> > ++  This function will validate that the Gpt Event Size calculated from=
 the primary header is sane
> > ++  It will check the following:
> > ++    - EventSize does not overflow
> > ++
> > ++  Important: This function includes the entire length of the allocate=
d space, including the
> > ++  TCG_PCR_EVENT_HDR. When hashing the buffer allocated with this size=
, the caller must subtract
> > ++  the size of the TCG_PCR_EVENT_HDR from the size of the buffer befor=
e hashing.
> > ++
> > ++  @param[in] PrimaryHeader - Pointer to the EFI_PARTITION_TABLE_HEADE=
R structure.
> > ++  @param[in] NumberOfPartition - Number of partitions.
> > ++  @param[out] EventSize - Pointer to the event size.
> > ++
> > ++  @retval EFI_SUCCESS
> > ++    The event size is valid.
> > ++
> > ++  @retval EFI_OUT_OF_RESOURCES
> > ++    Overflow would have occurred.
> > ++
> > ++  @retval EFI_INVALID_PARAMETER
> > ++    One of the passed parameters was invalid.
> > ++**/
> > ++EFI_STATUS
> > ++SanitizePrimaryHeaderGptEventSize (
> > ++  IN  CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,
> > ++  IN  UINTN                             NumberOfPartition,
> > ++  OUT UINT32                            *EventSize
> > ++  )
> > ++{
> > ++  EFI_STATUS  Status;
> > ++  UINT32      SafeNumberOfPartitions;
> > ++
> > ++  if (PrimaryHeader =3D=3D NULL) {
> > ++    return EFI_INVALID_PARAMETER;
> > ++  }
> > ++
> > ++  if (EventSize =3D=3D NULL) {
> > ++    return EFI_INVALID_PARAMETER;
> > ++  }
> > ++
> > ++  // We shouldn't even attempt to perform the multiplication if the n=
umber of partitions is greater than the maximum value of UINT32
> > ++  Status =3D SafeUintnToUint32 (NumberOfPartition, &SafeNumberOfParti=
tions);
> > ++  if (EFI_ERROR (Status)) {
> > ++    DEBUG ((DEBUG_ERROR, "NumberOfPartition would have overflowed!\n"=
));
> > ++    return EFI_INVALID_PARAMETER;
> > ++  }
> > ++
> > ++  // Replacing logic:
> > ++  // (UINT32)(sizeof (EFI_GPT_DATA) - sizeof (GptData->Partitions) + =
NumberOfPartition * PrimaryHeader.SizeOfPartitionEntry + sizeof (TCG_PCR_EV=
ENT_HDR));
> > ++  Status =3D SafeUint32Mult (SafeNumberOfPartitions, PrimaryHeader->S=
izeOfPartitionEntry, EventSize);
> > ++  if (EFI_ERROR (Status)) {
> > ++    DEBUG ((DEBUG_ERROR, "Event Size would have overflowed!\n"));
> > ++    return EFI_BAD_BUFFER_SIZE;
> > ++  }
> > ++
> > ++  Status =3D SafeUint32Add (
> > ++             sizeof (TCG_PCR_EVENT_HDR) +
> > ++             OFFSET_OF (EFI_GPT_DATA, Partitions),
> > ++             *EventSize,
> > ++             EventSize
> > ++             );
> > ++  if (EFI_ERROR (Status)) {
> > ++    DEBUG ((DEBUG_ERROR, "Event Size would have overflowed because of=
 GPTData!\n"));
> > ++    return EFI_BAD_BUFFER_SIZE;
> > ++  }
> > ++
> > ++  return EFI_SUCCESS;
> > ++}
> > +diff --git a/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBoo=
tLibSanitization.h b/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasure=
BootLibSanitization.h
> > +new file mode 100644
> > +index 0000000000..0d9d00c281
> > +--- /dev/null
> > ++++ b/SecurityPkg/Library/DxeTpmMeasureBootLib/DxeTpmMeasureBootLibSan=
itization.h
> > +@@ -0,0 +1,114 @@
> > ++/** @file
> > ++  This file includes the function prototypes for the sanitization fun=
ctions.
> > ++
> > ++  These are those functions:
> > ++
> > ++  DxeTpmMeasureBootLibImageRead() function will make sure the PE/COFF=
 image content
> > ++  read is within the image buffer.
> > ++
> > ++  TcgMeasurePeImage() function will accept untrusted PE/COFF image an=
d validate its
> > ++  data structure within this image buffer before use.
> > ++
> > ++  TcgMeasureGptTable() function will receive untrusted GPT partition =
table, and parse
> > ++  partition data carefully.
> > ++
> > ++  Copyright (c) Microsoft Corporation.<BR>
> > ++  SPDX-License-Identifier: BSD-2-Clause-Patent
> > ++
> > ++**/
> > ++
> > ++#ifndef DXE_TPM_MEASURE_BOOT_LIB_VALIDATION_
> > ++#define DXE_TPM_MEASURE_BOOT_LIB_VALIDATION_
> > ++
> > ++#include <Uefi.h>
> > ++#include <Uefi/UefiSpec.h>
> > ++#include <Protocol/BlockIo.h>
> > ++#include <IndustryStandard/UefiTcgPlatform.h>
> > ++
> > ++/**
> > ++  This function will validate the EFI_PARTITION_TABLE_HEADER structur=
e is safe to parse
> > ++  However this function will not attempt to verify the validity of th=
e GPT partition
> > ++  It will check the following:
> > ++    - Signature
> > ++    - Revision
> > ++    - AlternateLBA
> > ++    - FirstUsableLBA
> > ++    - LastUsableLBA
> > ++    - PartitionEntryLBA
> > ++    - NumberOfPartitionEntries
> > ++    - SizeOfPartitionEntry
> > ++    - BlockIo
> > ++
> > ++  @param[in] PrimaryHeader
> > ++    Pointer to the EFI_PARTITION_TABLE_HEADER structure.
> > ++
> > ++  @param[in] BlockIo
> > ++    Pointer to the EFI_BLOCK_IO_PROTOCOL structure.
> > ++
> > ++  @retval EFI_SUCCESS
> > ++    The EFI_PARTITION_TABLE_HEADER structure is valid.
> > ++
> > ++  @retval EFI_INVALID_PARAMETER
> > ++    The EFI_PARTITION_TABLE_HEADER structure is invalid.
> > ++**/
> > ++EFI_STATUS
> > ++EFIAPI
> > ++SanitizeEfiPartitionTableHeader (
> > ++  IN CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,
> > ++  IN CONST EFI_BLOCK_IO_PROTOCOL       *BlockIo
> > ++  );
> > ++
> > ++/**
> > ++  This function will validate that the allocation size from the prima=
ry header is sane
> > ++  It will check the following:
> > ++    - AllocationSize does not overflow
> > ++
> > ++  @param[in] PrimaryHeader
> > ++    Pointer to the EFI_PARTITION_TABLE_HEADER structure.
> > ++
> > ++  @param[out] AllocationSize
> > ++    Pointer to the allocation size.
> > ++
> > ++  @retval EFI_SUCCESS
> > ++    The allocation size is valid.
> > ++
> > ++  @retval EFI_OUT_OF_RESOURCES
> > ++    The allocation size is invalid.
> > ++**/
> > ++EFI_STATUS
> > ++EFIAPI
> > ++SanitizePrimaryHeaderAllocationSize (
> > ++  IN CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,
> > ++  OUT UINT32                           *AllocationSize
> > ++  );
> > ++
> > ++/**
> > ++  This function will validate that the Gpt Event Size calculated from=
 the primary header is sane
> > ++  It will check the following:
> > ++    - EventSize does not overflow
> > ++
> > ++  Important: This function includes the entire length of the allocate=
d space, including the
> > ++  TCG_PCR_EVENT_HDR. When hashing the buffer allocated with this size=
, the caller must subtract
> > ++  the size of the TCG_PCR_EVENT_HDR from the size of the buffer befor=
e hashing.
> > ++
> > ++  @param[in] PrimaryHeader - Pointer to the EFI_PARTITION_TABLE_HEADE=
R structure.
> > ++  @param[in] NumberOfPartition - Number of partitions.
> > ++  @param[out] EventSize - Pointer to the event size.
> > ++
> > ++  @retval EFI_SUCCESS
> > ++    The event size is valid.
> > ++
> > ++  @retval EFI_OUT_OF_RESOURCES
> > ++    Overflow would have occurred.
> > ++
> > ++  @retval EFI_INVALID_PARAMETER
> > ++    One of the passed parameters was invalid.
> > ++**/
> > ++EFI_STATUS
> > ++SanitizePrimaryHeaderGptEventSize (
> > ++  IN  CONST EFI_PARTITION_TABLE_HEADER  *PrimaryHeader,
> > ++  IN  UINTN                             NumberOfPartition,
> > ++  OUT UINT32                            *EventSize
> > ++  );
> > ++
> > ++#endif // DXE_TPM_MEASURE_BOOT_LIB_VALIDATION_
> > +diff --git a/SecurityPkg/Library/DxeTpmMeasureBootLib/InternalUnitTest=
/DxeTpmMeasureBootLibSanitizationTest.c b/SecurityPkg/Library/DxeTpmMeasure=
BootLib/InternalUnitTest/DxeTpmMeasureBootLibSanitizationTest.c
> > +new file mode 100644
> > +index 0000000000..eeb928cdb0
> > +--- /dev/null
> > ++++ b/SecurityPkg/Library/DxeTpmMeasureBootLib/InternalUnitTest/DxeTpm=
MeasureBootLibSanitizationTest.c
> > +@@ -0,0 +1,301 @@
> > ++/** @file
> > ++This file includes the unit test cases for the DxeTpmMeasureBootLibSa=
nitizationTest.c.
> > ++
> > ++Copyright (c) Microsoft Corporation.<BR>
> > ++SPDX-License-Identifier: BSD-2-Clause-Patent
> > ++**/
> > ++
> > ++#include <Uefi.h>
> > ++#include <Library/UefiLib.h>
> > ++#include <Library/DebugLib.h>
> > ++#include <Library/UnitTestLib.h>
> > ++#include <Protocol/BlockIo.h>
> > ++#include <Library/MemoryAllocationLib.h>
> > ++#include <Library/BaseMemoryLib.h>
> > ++#include <IndustryStandard/UefiTcgPlatform.h>
> > ++
> > ++#include "../DxeTpmMeasureBootLibSanitization.h"
> > ++
> > ++#define UNIT_TEST_NAME     "DxeTpmMeasureBootLibSanitizationTest"
> > ++#define UNIT_TEST_VERSION  "1.0"
> > ++
> > ++#define DEFAULT_PRIMARY_TABLE_HEADER_REVISION                     0x0=
0010000
> > ++#define DEFAULT_PRIMARY_TABLE_HEADER_NUMBER_OF_PARTITION_ENTRIES  1
> > ++#define DEFAULT_PRIMARY_TABLE_HEADER_SIZE_OF_PARTITION_ENTRY      128
> > ++
> > ++/**
> > ++  This function tests the SanitizeEfiPartitionTableHeader function.
> > ++  It's intent is to test that a malicious EFI_PARTITION_TABLE_HEADER
> > ++  structure will not cause undefined or unexpected behavior.
> > ++
> > ++  In general the TPM should still be able to measure the data, but
> > ++  be the header should be sanitized to prevent any unexpected behavio=
r.
> > ++
> > ++  @param[in] Context  The unit test context.
> > ++
> > ++  @retval UNIT_TEST_PASSED  The test passed.
> > ++  @retval UNIT_TEST_ERROR_TEST_FAILED  The test failed.
> > ++**/
> > ++UNIT_TEST_STATUS
> > ++EFIAPI
> > ++TestSanitizeEfiPartitionTableHeader (
> > ++  IN UNIT_TEST_CONTEXT  Context
> > ++  )
> > ++{
> > ++  EFI_STATUS                  Status;
> > ++  EFI_PARTITION_TABLE_HEADER  PrimaryHeader;
> > ++  EFI_BLOCK_IO_PROTOCOL       BlockIo;
> > ++  EFI_BLOCK_IO_MEDIA          BlockMedia;
> > ++
> > ++  // Generate EFI_BLOCK_IO_MEDIA test data
> > ++  BlockMedia.MediaId          =3D 1;
> > ++  BlockMedia.RemovableMedia   =3D FALSE;
> > ++  BlockMedia.MediaPresent     =3D TRUE;
> > ++  BlockMedia.LogicalPartition =3D FALSE;
> > ++  BlockMedia.ReadOnly         =3D FALSE;
> > ++  BlockMedia.WriteCaching     =3D FALSE;
> > ++  BlockMedia.BlockSize        =3D 512;
> > ++  BlockMedia.IoAlign          =3D 1;
> > ++  BlockMedia.LastBlock        =3D 0;
> > ++
> > ++  // Generate EFI_BLOCK_IO_PROTOCOL test data
> > ++  BlockIo.Revision    =3D 1;
> > ++  BlockIo.Media       =3D &BlockMedia;
> > ++  BlockIo.Reset       =3D NULL;
> > ++  BlockIo.ReadBlocks  =3D NULL;
> > ++  BlockIo.WriteBlocks =3D NULL;
> > ++  BlockIo.FlushBlocks =3D NULL;
> > ++
> > ++  // Geneate EFI_PARTITION_TABLE_HEADER test data
> > ++  PrimaryHeader.Header.Signature         =3D EFI_PTAB_HEADER_ID;
> > ++  PrimaryHeader.Header.Revision          =3D DEFAULT_PRIMARY_TABLE_HE=
ADER_REVISION;
> > ++  PrimaryHeader.Header.HeaderSize        =3D sizeof (EFI_PARTITION_TA=
BLE_HEADER);
> > ++  PrimaryHeader.MyLBA                    =3D 1;
> > ++  PrimaryHeader.AlternateLBA             =3D 2;
> > ++  PrimaryHeader.FirstUsableLBA           =3D 3;
> > ++  PrimaryHeader.LastUsableLBA            =3D 4;
> > ++  PrimaryHeader.PartitionEntryLBA        =3D 5;
> > ++  PrimaryHeader.NumberOfPartitionEntries =3D DEFAULT_PRIMARY_TABLE_HE=
ADER_NUMBER_OF_PARTITION_ENTRIES;
> > ++  PrimaryHeader.SizeOfPartitionEntry     =3D DEFAULT_PRIMARY_TABLE_HE=
ADER_SIZE_OF_PARTITION_ENTRY;
> > ++  PrimaryHeader.PartitionEntryArrayCRC32 =3D 0; // Purposely invalid
> > ++
> > ++  // Calculate the CRC32 of the PrimaryHeader
> > ++  PrimaryHeader.Header.CRC32 =3D CalculateCrc32 ((UINT8 *)&PrimaryHea=
der, PrimaryHeader.Header.HeaderSize);
> > ++
> > ++  // Test that a normal PrimaryHeader passes validation
> > ++  Status =3D SanitizeEfiPartitionTableHeader (&PrimaryHeader, &BlockI=
o);
> > ++  UT_ASSERT_NOT_EFI_ERROR (Status);
> > ++
> > ++  // Test that when number of partition entries is 0, the function re=
turns EFI_DEVICE_ERROR
> > ++  // Should print "Invalid Partition Table Header NumberOfPartitionEn=
tries!""
> > ++  PrimaryHeader.NumberOfPartitionEntries =3D 0;
> > ++  Status                                 =3D SanitizeEfiPartitionTabl=
eHeader (&PrimaryHeader, &BlockIo);
> > ++  UT_ASSERT_EQUAL (Status, EFI_DEVICE_ERROR);
> > ++  PrimaryHeader.NumberOfPartitionEntries =3D DEFAULT_PRIMARY_TABLE_HE=
ADER_SIZE_OF_PARTITION_ENTRY;
> > ++
> > ++  // Test that when the header size is too small, the function return=
s EFI_DEVICE_ERROR
> > ++  // Should print "Invalid Partition Table Header Size!"
> > ++  PrimaryHeader.Header.HeaderSize =3D 0;
> > ++  Status                          =3D SanitizeEfiPartitionTableHeader=
 (&PrimaryHeader, &BlockIo);
> > ++  UT_ASSERT_EQUAL (Status, EFI_DEVICE_ERROR);
> > ++  PrimaryHeader.Header.HeaderSize =3D sizeof (EFI_PARTITION_TABLE_HEA=
DER);
> > ++
> > ++  // Test that when the SizeOfPartitionEntry is too small, the functi=
on returns EFI_DEVICE_ERROR
> > ++  // should print: "SizeOfPartitionEntry shall be set to a value of 1=
28 x 2^n where n is an integer greater than or equal to zero (e.g., 128, 25=
6, 512, etc.)!"
> > ++  PrimaryHeader.SizeOfPartitionEntry =3D 1;
> > ++  Status                             =3D SanitizeEfiPartitionTableHea=
der (&PrimaryHeader, &BlockIo);
> > ++  UT_ASSERT_EQUAL (Status, EFI_DEVICE_ERROR);
> > ++
> > ++  DEBUG ((DEBUG_INFO, "%a: Test passed\n", __func__));
> > ++
> > ++  return UNIT_TEST_PASSED;
> > ++}
> > ++
> > ++/**
> > ++  This function tests the SanitizePrimaryHeaderAllocationSize functio=
n.
> > ++  It's intent is to test that the untrusted input from a EFI_PARTITIO=
N_TABLE_HEADER
> > ++  structure will not cause an overflow when calculating the allocatio=
n size.
> > ++
> > ++  @param[in] Context  The unit test context.
> > ++
> > ++  @retval UNIT_TEST_PASSED  The test passed.
> > ++  @retval UNIT_TEST_ERROR_TEST_FAILED  The test failed.
> > ++**/
> > ++UNIT_TEST_STATUS
> > ++EFIAPI
> > ++TestSanitizePrimaryHeaderAllocationSize (
> > ++  IN UNIT_TEST_CONTEXT  Context
> > ++  )
> > ++{
> > ++  UINT32  AllocationSize;
> > ++
> > ++  EFI_STATUS                  Status;
> > ++  EFI_PARTITION_TABLE_HEADER  PrimaryHeader;
> > ++
> > ++  // Test that a normal PrimaryHeader passes validation
> > ++  PrimaryHeader.NumberOfPartitionEntries =3D 5;
> > ++  PrimaryHeader.SizeOfPartitionEntry     =3D DEFAULT_PRIMARY_TABLE_HE=
ADER_SIZE_OF_PARTITION_ENTRY;
> > ++
> > ++  Status =3D SanitizePrimaryHeaderAllocationSize (&PrimaryHeader, &Al=
locationSize);
> > ++  UT_ASSERT_NOT_EFI_ERROR (Status);
> > ++
> > ++  // Test that the allocation size is correct compared to the existin=
g logic
> > ++  UT_ASSERT_EQUAL (AllocationSize, PrimaryHeader.NumberOfPartitionEnt=
ries * PrimaryHeader.SizeOfPartitionEntry);
> > ++
> > ++  // Test that an overflow is detected
> > ++  PrimaryHeader.NumberOfPartitionEntries =3D MAX_UINT32;
> > ++  PrimaryHeader.SizeOfPartitionEntry     =3D 5;
> > ++  Status                                 =3D SanitizePrimaryHeaderAll=
ocationSize (&PrimaryHeader, &AllocationSize);
> > ++  UT_ASSERT_EQUAL (Status, EFI_BAD_BUFFER_SIZE);
> > ++
> > ++  // Test the inverse
> > ++  PrimaryHeader.NumberOfPartitionEntries =3D 5;
> > ++  PrimaryHeader.SizeOfPartitionEntry     =3D MAX_UINT32;
> > ++  Status                                 =3D SanitizePrimaryHeaderAll=
ocationSize (&PrimaryHeader, &AllocationSize);
> > ++  UT_ASSERT_EQUAL (Status, EFI_BAD_BUFFER_SIZE);
> > ++
> > ++  // Test the worst case scenario
> > ++  PrimaryHeader.NumberOfPartitionEntries =3D MAX_UINT32;
> > ++  PrimaryHeader.SizeOfPartitionEntry     =3D MAX_UINT32;
> > ++  Status                                 =3D SanitizePrimaryHeaderAll=
ocationSize (&PrimaryHeader, &AllocationSize);
> > ++  UT_ASSERT_EQUAL (Status, EFI_BAD_BUFFER_SIZE);
> > ++
> > ++  DEBUG ((DEBUG_INFO, "%a: Test passed\n", __func__));
> > ++
> > ++  return UNIT_TEST_PASSED;
> > ++}
> > ++
> > ++/**
> > ++  This function tests the SanitizePrimaryHeaderGptEventSize function.
> > ++  It's intent is to test that the untrusted input from a EFI_GPT_DATA=
 structure
> > ++  will not cause an overflow when calculating the event size.
> > ++
> > ++  @param[in] Context  The unit test context.
> > ++
> > ++  @retval UNIT_TEST_PASSED  The test passed.
> > ++  @retval UNIT_TEST_ERROR_TEST_FAILED  The test failed.
> > ++**/
> > ++UNIT_TEST_STATUS
> > ++EFIAPI
> > ++TestSanitizePrimaryHeaderGptEventSize (
> > ++  IN UNIT_TEST_CONTEXT  Context
> > ++  )
> > ++{
> > ++  UINT32                      EventSize;
> > ++  UINT32                      ExistingLogicEventSize;
> > ++  EFI_STATUS                  Status;
> > ++  EFI_PARTITION_TABLE_HEADER  PrimaryHeader;
> > ++  UINTN                       NumberOfPartition;
> > ++  EFI_GPT_DATA                *GptData;
> > ++
> > ++  GptData =3D NULL;
> > ++
> > ++  // Test that a normal PrimaryHeader passes validation
> > ++  PrimaryHeader.NumberOfPartitionEntries =3D 5;
> > ++  PrimaryHeader.SizeOfPartitionEntry     =3D DEFAULT_PRIMARY_TABLE_HE=
ADER_SIZE_OF_PARTITION_ENTRY;
> > ++
> > ++  // set the number of partitions
> > ++  NumberOfPartition =3D 13;
> > ++
> > ++  // that the primary event size is correct
> > ++  Status =3D SanitizePrimaryHeaderGptEventSize (&PrimaryHeader, Numbe=
rOfPartition, &EventSize);
> > ++  UT_ASSERT_NOT_EFI_ERROR (Status);
> > ++
> > ++  // Calculate the existing logic event size
> > ++  ExistingLogicEventSize =3D (UINT32)(sizeof (TCG_PCR_EVENT_HDR) + OF=
FSET_OF (EFI_GPT_DATA, Partitions)
> > ++                                    + NumberOfPartition * PrimaryHead=
er.SizeOfPartitionEntry);
> > ++
> > ++  // Check that the event size is correct
> > ++  UT_ASSERT_EQUAL (EventSize, ExistingLogicEventSize);
> > ++
> > ++  // Tests that the primary event size may not overflow
> > ++  Status =3D SanitizePrimaryHeaderGptEventSize (&PrimaryHeader, MAX_U=
INT32, &EventSize);
> > ++  UT_ASSERT_EQUAL (Status, EFI_BAD_BUFFER_SIZE);
> > ++
> > ++  // Test that the size of partition entries may not overflow
> > ++  PrimaryHeader.SizeOfPartitionEntry =3D MAX_UINT32;
> > ++  Status                             =3D SanitizePrimaryHeaderGptEven=
tSize (&PrimaryHeader, NumberOfPartition, &EventSize);
> > ++  UT_ASSERT_EQUAL (Status, EFI_BAD_BUFFER_SIZE);
> > ++
> > ++  DEBUG ((DEBUG_INFO, "%a: Test passed\n", __func__));
> > ++
> > ++  return UNIT_TEST_PASSED;
> > ++}
> > ++
> > ++// *-----------------------------------------------------------------=
---*
> > ++// *  Unit Test Code Main Function
> > ++// *-----------------------------------------------------------------=
---*
> > ++
> > ++/**
> > ++  This function acts as the entry point for the unit tests.
> > ++
> > ++  @param argc - The number of command line arguments
> > ++  @param argv - The command line arguments
> > ++
> > ++  @return int - The status of the test
> > ++**/
> > ++EFI_STATUS
> > ++EFIAPI
> > ++UefiTestMain (
> > ++  VOID
> > ++  )
> > ++{
> > ++  EFI_STATUS                  Status;
> > ++  UNIT_TEST_FRAMEWORK_HANDLE  Framework;
> > ++  UNIT_TEST_SUITE_HANDLE      TcgMeasureBootLibValidationTestSuite;
> > ++
> > ++  Framework =3D NULL;
> > ++
> > ++  DEBUG ((DEBUG_INFO, "%a: TestMain() - Start\n", UNIT_TEST_NAME));
> > ++
> > ++  Status =3D InitUnitTestFramework (&Framework, UNIT_TEST_NAME, gEfiC=
allerBaseName, UNIT_TEST_VERSION);
> > ++  if (EFI_ERROR (Status)) {
> > ++    DEBUG ((DEBUG_ERROR, "%a: Failed in InitUnitTestFramework. Status=
 =3D %r\n", UNIT_TEST_NAME, Status));
> > ++    goto EXIT;
> > ++  }
> > ++
> > ++  Status =3D CreateUnitTestSuite (&TcgMeasureBootLibValidationTestSui=
te, Framework, "TcgMeasureBootLibValidationTestSuite", "Common.TcgMeasureBo=
otLibValidation", NULL, NULL);
> > ++  if (EFI_ERROR (Status)) {
> > ++    DEBUG ((DEBUG_ERROR, "%s: Failed in CreateUnitTestSuite for TcgMe=
asureBootLibValidationTestSuite\n", UNIT_TEST_NAME));
> > ++    Status =3D EFI_OUT_OF_RESOURCES;
> > ++    goto EXIT;
> > ++  }
> > ++
> > ++  // -----------Suite---------------------------------Description----=
------------------------Class----------------------------------Test Functio=
n------------------------Pre---Clean-Context
> > ++  AddTestCase (TcgMeasureBootLibValidationTestSuite, "Tests Validatin=
g EFI Partition Table", "Common.TcgMeasureBootLibValidation", TestSanitizeE=
fiPartitionTableHeader, NULL, NULL, NULL);
> > ++  AddTestCase (TcgMeasureBootLibValidationTestSuite, "Tests Primary h=
eader gpt event checks for overflow", "Common.TcgMeasureBootLibValidation",=
 TestSanitizePrimaryHeaderAllocationSize, NULL, NULL, NULL);
> > ++  AddTestCase (TcgMeasureBootLibValidationTestSuite, "Tests Primary h=
eader allocation size checks for overflow", "Common.TcgMeasureBootLibValida=
tion", TestSanitizePrimaryHeaderGptEventSize, NULL, NULL, NULL);
> > ++
> > ++  Status =3D RunAllTestSuites (Framework);
> > ++
> > ++EXIT:
> > ++  if (Framework !=3D NULL) {
> > ++    FreeUnitTestFramework (Framework);
> > ++  }
> > ++
> > ++  DEBUG ((DEBUG_INFO, "%a: TestMain() - End\n", UNIT_TEST_NAME));
> > ++  return Status;
> > ++}
> > ++
> > ++///
> > ++/// Avoid ECC error for function name that starts with lower case let=
ter
> > ++///
> > ++#define DxeTpmMeasureBootLibUnitTestMain  main
> > ++
> > ++/**
> > ++  Standard POSIX C entry point for host based unit test execution.
> > ++
> > ++  @param[in] Argc  Number of arguments
> > ++  @param[in] Argv  Array of pointers to arguments
> > ++
> > ++  @retval 0      Success
> > ++  @retval other  Error
> > ++**/
> > ++INT32
> > ++DxeTpmMeasureBootLibUnitTestMain (
> > ++  IN INT32  Argc,
> > ++  IN CHAR8  *Argv[]
> > ++  )
> > ++{
> > ++  return (INT32)UefiTestMain ();
> > ++}
> > +diff --git a/SecurityPkg/Library/DxeTpmMeasureBootLib/InternalUnitTest=
/DxeTpmMeasureBootLibSanitizationTestHost.inf b/SecurityPkg/Library/DxeTpmM=
easureBootLib/InternalUnitTest/DxeTpmMeasureBootLibSanitizationTestHost.inf
> > +new file mode 100644
> > +index 0000000000..47b0811b00
> > +--- /dev/null
> > ++++ b/SecurityPkg/Library/DxeTpmMeasureBootLib/InternalUnitTest/DxeTpm=
MeasureBootLibSanitizationTestHost.inf
> > +@@ -0,0 +1,28 @@
> > ++## @file
> > ++# This file builds the unit tests for DxeTpmMeasureBootLib
> > ++#
> > ++# Copyright (C) Microsoft Corporation.<BR>
> > ++# SPDX-License-Identifier: BSD-2-Clause-Patent
> > ++##
> > ++
> > ++[Defines]
> > ++  INF_VERSION                    =3D 0x00010006
> > ++  BASE_NAME                      =3D DxeTpmMeasuredBootLibTest
> > ++  FILE_GUID                      =3D eb01bc38-309c-4d3e-967e-9f078c90=
772f
> > ++  MODULE_TYPE                    =3D HOST_APPLICATION
> > ++  VERSION_STRING                 =3D 1.0
> > ++  ENTRY_POINT                    =3D main
> > ++
> > ++[Sources]
> > ++  DxeTpmMeasureBootLibSanitizationTest.c
> > ++  ../DxeTpmMeasureBootLibSanitization.c
> > ++
> > ++[Packages]
> > ++  MdePkg/MdePkg.dec
> > ++
> > ++[LibraryClasses]
> > ++  BaseLib
> > ++  DebugLib
> > ++  UnitTestLib
> > ++  PrintLib
> > ++  SafeIntLib
> > +diff --git a/SecurityPkg/SecurityPkg.ci.yaml b/SecurityPkg/SecurityPkg=
.ci.yaml
> > +index da811fdf93..0e40eaa0fe 100644
> > +--- a/SecurityPkg/SecurityPkg.ci.yaml
> > ++++ b/SecurityPkg/SecurityPkg.ci.yaml
> > +@@ -16,6 +16,7 @@
> > +         ## ]
> > +         "ExceptionList": [
> > +             "8001", "DxeTpm2MeasureBootLibUnitTestMain",
> > ++            "8001", "DxeTpmMeasureBootLibUnitTestMain"
> > +         ],
> > +         ## Both file path and directory path are accepted.
> > +         "IgnoreFiles": [
> > +--
> > +2.40.0
> > +
> > diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2022-36763-0003.patch b/me=
ta/recipes-core/ovmf/ovmf/CVE-2022-36763-0003.patch
> > new file mode 100644
> > index 0000000000..59bd5c4910
> > --- /dev/null
> > +++ b/meta/recipes-core/ovmf/ovmf/CVE-2022-36763-0003.patch
> > @@ -0,0 +1,55 @@
> > +From 1ddcb9fc6b4164e882687b031e8beacfcf7df29e Mon Sep 17 00:00:00 2001
> > +From: "Douglas Flick [MSFT]" <doug.edk2@gmail.com>
> > +Date: Fri, 12 Jan 2024 02:16:03 +0800
> > +Subject: [PATCH] SecurityPkg: : Adding CVE 2022-36763 to SecurityFixes=
.yaml
> > +
> > +This creates / adds a security file that tracks the security fixes
> > +found in this package and can be used to find the fixes that were
> > +applied.
> > +
> > +Cc: Jiewen Yao <jiewen.yao@intel.com>
> > +
> > +Signed-off-by: Doug Flick [MSFT] <doug.edk2@gmail.com>
> > +Reviewed-by: Jiewen Yao <jiewen.yao@intel.com>
> > +
> > +CVE: CVE-2022-36763
> > +
> > +Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/1d=
dcb9fc6b4164e882687b031e8beacfcf7df29e]
> > +
> > +Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
> > +---
> > + SecurityPkg/SecurityFixes.yaml | 22 ++++++++++++++++++++++
> > + 1 file changed, 22 insertions(+)
> > + create mode 100644 SecurityPkg/SecurityFixes.yaml
> > +
> > +diff --git a/SecurityPkg/SecurityFixes.yaml b/SecurityPkg/SecurityFixe=
s.yaml
> > +new file mode 100644
> > +index 0000000000..f9e3e7be74
> > +--- /dev/null
> > ++++ b/SecurityPkg/SecurityFixes.yaml
> > +@@ -0,0 +1,22 @@
> > ++## @file
> > ++# Security Fixes for SecurityPkg
> > ++#
> > ++# Copyright (c) Microsoft Corporation
> > ++# SPDX-License-Identifier: BSD-2-Clause-Patent
> > ++##
> > ++CVE_2022_36763:
> > ++  commit_titles:
> > ++    - "SecurityPkg: DxeTpm2Measurement: SECURITY PATCH 4117 - CVE 202=
2-36763"
> > ++    - "SecurityPkg: DxeTpmMeasurement: SECURITY PATCH 4117 - CVE 2022=
-36763"
> > ++    - "SecurityPkg: : Adding CVE 2022-36763 to SecurityFixes.yaml"
> > ++  cve: CVE-2022-36763
> > ++  date_reported: 2022-10-25 11:31 UTC
> > ++  description: (CVE-2022-36763) - Heap Buffer Overflow in Tcg2Measure=
GptTable()
> > ++  note: This patch is related to and supersedes TCBZ2168
> > ++  files_impacted:
> > ++  - Library\DxeTpm2MeasureBootLib\DxeTpm2MeasureBootLib.c
> > ++  - Library\DxeTpmMeasureBootLib\DxeTpmMeasureBootLib.c
> > ++  links:
> > ++  - https://bugzilla.tianocore.org/show_bug.cgi?id=3D4117
> > ++  - https://bugzilla.tianocore.org/show_bug.cgi?id=3D2168
> > ++  - https://bugzilla.tianocore.org/show_bug.cgi?id=3D1990
> > +--
> > +2.40.0
> > +
> > diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovm=
f/ovmf_git.bb
> > index 84e3360a3a..78d86ad879 100644
> > --- a/meta/recipes-core/ovmf/ovmf_git.bb
> > +++ b/meta/recipes-core/ovmf/ovmf_git.bb
> > @@ -27,6 +27,9 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;br=
anch=3Dmaster;protocol=3Dhttps \
> >             file://0006-reproducible.patch \
> >             file://0001-BaseTools-fix-gcc12-warning.patch \
> >             file://0001-BaseTools-fix-gcc12-warning-1.patch \
> > +           file://CVE-2022-36763-0001.patch \
> > +           file://CVE-2022-36763-0002.patch \
> > +           file://CVE-2022-36763-0003.patch \
> >             "
> >
> >  PV =3D "edk2-stable202202"
> > --
> > 2.40.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#201751): https://lists.openembedded.org/g/openembed=
ded-core/message/201751
> > Mute This Topic: https://lists.openembedded.org/mt/107157592/3620601
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
steve@sakoman.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

