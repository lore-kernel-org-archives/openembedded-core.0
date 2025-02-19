Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60876C021AA
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 15:20:04 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.24892.1739978395101794684
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Feb 2025 07:19:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=T8nH/+Cn;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.170, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6f6c90b51c3so59283807b3.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 07:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739978394; x=1740583194; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AKjkJNC9SkUo8ugtgQCYZTqhIovLGI5eD6+UiWll/jw=;
        b=T8nH/+CnMXtoZ/0L7IzMjzXmsnrKix/ULkVddli81sRWaW/vdWs9L498b8FpC9Ro7h
         O0kZRX4sUcysZbdfqqkbxt9hK+bNP4xkHsjcn+wP1JH4q0cq26cXO9y5Fn9c7XMs1ppK
         LP2FlRB9FmSfdAuYqVesBXiA7KIjFmFUE4HqKkUyeRx6XM/7xdhUuxtsAky7i7pqzW5C
         9z8jfY3y3sZPFQdM384LYSduk3GAG03G/nLRVYCzAZTE82mDdEufvTmXMMK3YwFZwaCi
         gzvpE1BGONlylA8vvzpuV+jQZxAGu4PnBvm4tqaHGtKXJpfQmpBDT6KXpZ5PT3WImXir
         smAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739978394; x=1740583194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AKjkJNC9SkUo8ugtgQCYZTqhIovLGI5eD6+UiWll/jw=;
        b=mJ0UX1yIbCBNGfcDHI+DYoA5t44Evc4VElBgQ5pQrp4kXb0uKZrGEzavyQdDWkPz61
         ntuTRG2s0R6VEDAE8DunLtNhYoYUAf8Sl3d4sGbnDjVMRsGXYgjMxdzDTtU2xxbkwhmo
         NCi8YH6otLp1MU0zv/hKkqjrxU0SU3nHdLdITObdBtG1JU83RLqbP+R5htfNvfDIQXTk
         bp0FYKwe4HOQtHnDyrHhZPLA13BTKMWseMw5aDR9HDEAu+i71JiipGq9xkkdAz+mQx4N
         pxGHUnNo4jApuvDTJ3kTPeHyOmBr+UR2eDFjENNPArR6+Yhfe5PRnZIvSN+71uUP9Unz
         X/Zg==
X-Gm-Message-State: AOJu0Yy1xEvNXMpBkraO2fd9namKCuJpwnyDecGqr0rzTkXl6MiBq85j
	KKTbnjOlyklSokoYLiL/S2fctiX98lJA02JflzSr2Q7GB2ztKum8XyBSgcoLHGUsW6I+3SXPoSr
	//tAjm/E5rVWIpV+0+oQK10gcNgmpPBPuoEIEJr61tt27FEIvaJA=
X-Gm-Gg: ASbGncvj+gnVqzzRYA/N+dSTQcT3jY6SIht6RBWD8prf8sxRQuIIkAMWFb3VAyKbAz5
	BiYhUBYu0jA49t+pW2a7C73Z4mXj2j2w/IvYaElCXjifs7Rw968h5N5WKo6JFDM4L2fFjZjoZ6e
	0veMV4TPGfY1MXJ415LZrk+qywGrlr
X-Google-Smtp-Source: AGHT+IGK3IH8DNAkbpKzx8NqNqp96musmdfcYipnc8iXE2ciiTICzhAk0kUtrWl15DB0Xf+8gb4UhKMGUczt4BN6XPY=
X-Received: by 2002:a05:690c:6813:b0:6f5:4304:fdc with SMTP id
 00721157ae682-6fb5825d834mr161898747b3.6.1739978393707; Wed, 19 Feb 2025
 07:19:53 -0800 (PST)
MIME-Version: 1.0
References: <20250219102151.4000494-1-kai.kang@windriver.com>
In-Reply-To: <20250219102151.4000494-1-kai.kang@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 19 Feb 2025 07:19:42 -0800
X-Gm-Features: AWEUYZk5J9yl99imSkfR9rfAXK7wcvshd3ZpwSjlY4nsLi14SqKAYyOi_xK2FIg
Message-ID: <CAOSpxda-k+BcRkcQXzFe2D=gDyj_kKb+=YFVNnVeK4=fD=q1qg@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH 1/2] Revert "ovmf: Fix CVE-2023-45237"
To: kai.kang@windriver.com
Cc: openembedded-core@lists.openembedded.org, soumya.sambu@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 15:20:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211712

Hi Kai,

Not sure why, but this fails to apply for me:

Applying: Revert "ovmf: Fix CVE-2023-45237"
Using index info to reconstruct a base tree...
error: patch failed: meta/recipes-core/ovmf/ovmf/CVE-2023-45237-0001.patch:=
1
error: meta/recipes-core/ovmf/ovmf/CVE-2023-45237-0001.patch: patch
does not apply
error: patch failed: meta/recipes-core/ovmf/ovmf/CVE-2023-45237-0002.patch:=
1
error: meta/recipes-core/ovmf/ovmf/CVE-2023-45237-0002.patch: patch
does not apply
error: Did you hand edit your patch?
It does not apply to blobs recorded in its index.
Patch failed at 0001 Revert "ovmf: Fix CVE-2023-45237"

Steve

On Wed, Feb 19, 2025 at 2:22=E2=80=AFAM Kai Kang via lists.openembedded.org
<kai.kang=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> This reverts commit 4c2d3e37308cac98614dfafed79b7323423af8bc.
>
> The fix for CVE-2023-45237 causes ovmf firmware not support pxe boot
> any more and no boot item in OVMF menu such as
>
>     UEFI PXEv4 (MAC address)
>
> It has not been fixed by ovmf upstream and an issue has been created on
>
> https://github.com/tianocore/tianocore.github.io/issues/82
>
> Revert the fixes for now.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>
> Please add option `--keep-cr` when invoke `git am`.
>
>  .../ovmf/ovmf/CVE-2023-45237-0001.patch       |   78 -
>  .../ovmf/ovmf/CVE-2023-45237-0002.patch       | 1288 -----------------
>  meta/recipes-core/ovmf/ovmf_git.bb            |    2 -
>  3 files changed, 1368 deletions(-)
>  delete mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2023-45237-0001.patch
>  delete mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2023-45237-0002.patch
>
> diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2023-45237-0001.patch b/meta=
/recipes-core/ovmf/ovmf/CVE-2023-45237-0001.patch
> deleted file mode 100644
> index d1dcb8dc44..0000000000
> --- a/meta/recipes-core/ovmf/ovmf/CVE-2023-45237-0001.patch
> +++ /dev/null
> @@ -1,78 +0,0 @@
> -From cf07238e5fa4f8b1138ac1c9e80530b4d4e59f1c Mon Sep 17 00:00:00 2001
> -From: Pierre Gondois <pierre.gondois@arm.com>
> -Date: Fri, 11 Aug 2023 16:33:06 +0200
> -Subject: [PATCH] MdePkg/Rng: Add GUID to describe Arm Rndr Rng algorithm=
s
> -
> -BZ: https://bugzilla.tianocore.org/show_bug.cgi?id=3D4441
> -
> -The EFI_RNG_PROTOCOL can rely on the RngLib. The RngLib has multiple
> -implementations, some of them are unsafe (e.g. BaseRngLibTimerLib).
> -To allow the RngDxe to detect when such implementation is used,
> -a GetRngGuid() function is added in a following patch.
> -
> -Prepare GetRngGuid() return values and add a gEfiRngAlgorithmArmRndr
> -to describe a Rng algorithm accessed through Arm's RNDR instruction.
> -[1] states that the implementation of this algorithm should be
> -compliant to NIST SP900-80. The compliance is not guaranteed.
> -
> -[1] Arm Architecture Reference Manual Armv8, for A-profile architecture
> -sK12.1 'Properties of the generated random number'
> -
> -Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
> -Reviewed-by: Sami Mujawar <sami.mujawar@arm.com>
> -Reviewed-by: Liming Gao <gaoliming@byosoft.com.cn>
> -Acked-by: Ard Biesheuvel <ardb@kernel.org>
> -Tested-by: Kun Qin <kun.qin@microsoft.com>
> -
> -CVE: CVE-2023-45237
> -
> -Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/cf07=
238e5fa4f8b1138ac1c9e80530b4d4e59f1c]
> -
> -Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
> ----
> - MdePkg/Include/Protocol/Rng.h | 10 ++++++++++
> - MdePkg/MdePkg.dec             |  1 +
> - 2 files changed, 11 insertions(+)
> -
> -diff --git a/MdePkg/Include/Protocol/Rng.h b/MdePkg/Include/Protocol/Rng=
.h
> -index baf425587b..38bde53240 100644
> ---- a/MdePkg/Include/Protocol/Rng.h
> -+++ b/MdePkg/Include/Protocol/Rng.h
> -@@ -67,6 +67,15 @@ typedef EFI_GUID EFI_RNG_ALGORITHM;
> -   { \
> -     0xe43176d7, 0xb6e8, 0x4827, {0xb7, 0x84, 0x7f, 0xfd, 0xc4, 0xb6, 0x=
85, 0x61 } \
> -   }
> -+///
> -+/// The Arm Architecture states the RNDR that the DRBG algorithm should=
 be compliant
> -+/// with NIST SP800-90A, while not mandating a particular algorithm, so=
 as to be
> -+/// inclusive of different geographies.
> -+///
> -+#define EFI_RNG_ALGORITHM_ARM_RNDR \
> -+  { \
> -+    0x43d2fde3, 0x9d4e, 0x4d79,  {0x02, 0x96, 0xa8, 0x9b, 0xca, 0x78, 0=
x08, 0x41} \
> -+  }
> -
> - /**
> -   Returns information about the random number generation implementation=
.
> -@@ -146,5 +155,6 @@ extern EFI_GUID  gEfiRngAlgorithmSp80090Ctr256Guid;
> - extern EFI_GUID  gEfiRngAlgorithmX9313DesGuid;
> - extern EFI_GUID  gEfiRngAlgorithmX931AesGuid;
> - extern EFI_GUID  gEfiRngAlgorithmRaw;
> -+extern EFI_GUID  gEfiRngAlgorithmArmRndr;
> -
> - #endif
> -diff --git a/MdePkg/MdePkg.dec b/MdePkg/MdePkg.dec
> -index 59b405928b..a449dbc556 100644
> ---- a/MdePkg/MdePkg.dec
> -+++ b/MdePkg/MdePkg.dec
> -@@ -594,6 +594,7 @@
> -   gEfiRngAlgorithmX9313DesGuid       =3D { 0x63c4785a, 0xca34, 0x4012, =
{0xa3, 0xc8, 0x0b, 0x6a, 0x32, 0x4f, 0x55, 0x46 }}
> -   gEfiRngAlgorithmX931AesGuid        =3D { 0xacd03321, 0x777e, 0x4d3d, =
{0xb1, 0xc8, 0x20, 0xcf, 0xd8, 0x88, 0x20, 0xc9 }}
> -   gEfiRngAlgorithmRaw                =3D { 0xe43176d7, 0xb6e8, 0x4827, =
{0xb7, 0x84, 0x7f, 0xfd, 0xc4, 0xb6, 0x85, 0x61 }}
> -+  gEfiRngAlgorithmArmRndr            =3D { 0x43d2fde3, 0x9d4e, 0x4d79, =
{0x02, 0x96, 0xa8, 0x9b, 0xca, 0x78, 0x08, 0x41 }}
> -
> -   ## Include/Protocol/AdapterInformation.h
> -   gEfiAdapterInfoMediaStateGuid       =3D { 0xD7C74207, 0xA831, 0x4A26,=
 {0xB1, 0xF5, 0xD1, 0x93, 0x06, 0x5C, 0xE8, 0xB6 }}
> ---
> -2.40.0
> -
> diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2023-45237-0002.patch b/meta=
/recipes-core/ovmf/ovmf/CVE-2023-45237-0002.patch
> deleted file mode 100644
> index 722a6cd530..0000000000
> --- a/meta/recipes-core/ovmf/ovmf/CVE-2023-45237-0002.patch
> +++ /dev/null
> @@ -1,1288 +0,0 @@
> -From 4c4ceb2ceb80c42fd5545b2a4bd80321f07f4345 Mon Sep 17 00:00:00 2001
> -From: Doug Flick <dougflick@microsoft.com>
> -Date: Wed, 8 May 2024 22:56:28 -0700
> -Subject: [PATCH] NetworkPkg: SECURITY PATCH CVE-2023-45237
> -
> -REF:https://bugzilla.tianocore.org/show_bug.cgi?id=3D4542
> -
> -Bug Overview:
> -PixieFail Bug #9
> -CVE-2023-45237
> -CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:L/I:N/A:N
> -CWE-338 Use of Cryptographically Weak Pseudo-Random Number Generator (PR=
NG)
> -
> -Use of a Weak PseudoRandom Number Generator
> -
> -Change Overview:
> -
> -Updates all Instances of NET_RANDOM (NetRandomInitSeed ()) to either
> -
> ->
> -> EFI_STATUS
> -> EFIAPI
> -> PseudoRandomU32 (
> ->  OUT UINT32  *Output
> ->  );
> ->
> -
> -or (depending on the use case)
> -
> ->
> -> EFI_STATUS
> -> EFIAPI
> -> PseudoRandom (
> ->  OUT  VOID   *Output,
> ->  IN   UINTN  OutputLength
> ->  );
> ->
> -
> -This is because the use of
> -
> -Example:
> -
> -The following code snippet PseudoRandomU32 () function is used:
> -
> ->
> -> UINT32         Random;
> ->
> -> Status =3D PseudoRandomU32 (&Random);
> -> if (EFI_ERROR (Status)) {
> ->   DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\n",
> -__func__, Status));
> ->   return Status;
> -> }
> ->
> -
> -This also introduces a new PCD to enable/disable the use of the
> -secure implementation of algorithms for PseudoRandom () and
> -instead depend on the default implementation. This may be required for
> -some platforms where the UEFI Spec defined algorithms are not available.
> -
> ->
> -> PcdEnforceSecureRngAlgorithms
> ->
> -
> -If the platform does not have any one of the UEFI defined
> -secure RNG algorithms then the driver will assert.
> -
> -Cc: Saloni Kasbekar <saloni.kasbekar@intel.com>
> -Cc: Zachary Clark-williams <zachary.clark-williams@intel.com>
> -
> -Signed-off-by: Doug Flick [MSFT] <doug.edk2@gmail.com>
> -Reviewed-by: Saloni Kasbekar <saloni.kasbekar@intel.com>
> -
> -CVE: CVE-2023-45237
> -
> -Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/4c4c=
eb2ceb80c42fd5545b2a4bd80321f07f4345]
> -
> -Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
> ----
> - NetworkPkg/Dhcp4Dxe/Dhcp4Driver.c          |  10 +-
> - NetworkPkg/Dhcp6Dxe/Dhcp6Driver.c          |  11 +-
> - NetworkPkg/DnsDxe/DnsDhcp.c                |  10 +-
> - NetworkPkg/DnsDxe/DnsImpl.c                |  11 +-
> - NetworkPkg/HttpBootDxe/HttpBootDhcp6.c     |  10 +-
> - NetworkPkg/IScsiDxe/IScsiCHAP.c            |  19 ++-
> - NetworkPkg/IScsiDxe/IScsiMisc.c            |  14 +--
> - NetworkPkg/IScsiDxe/IScsiMisc.h            |   6 +-
> - NetworkPkg/Include/Library/NetLib.h        |  40 +++++--
> - NetworkPkg/Ip4Dxe/Ip4Driver.c              |  10 +-
> - NetworkPkg/Ip6Dxe/Ip6ConfigImpl.c          |   9 +-
> - NetworkPkg/Ip6Dxe/Ip6Driver.c              |  17 ++-
> - NetworkPkg/Ip6Dxe/Ip6If.c                  |  12 +-
> - NetworkPkg/Ip6Dxe/Ip6Mld.c                 |  12 +-
> - NetworkPkg/Ip6Dxe/Ip6Nd.c                  |  33 +++++-
> - NetworkPkg/Ip6Dxe/Ip6Nd.h                  |   8 +-
> - NetworkPkg/Library/DxeNetLib/DxeNetLib.c   | 130 ++++++++++++++++++---
> - NetworkPkg/Library/DxeNetLib/DxeNetLib.inf |  14 ++-
> - NetworkPkg/NetworkPkg.dec                  |   7 ++
> - NetworkPkg/SecurityFixes.yaml              |  39 +++++++
> - NetworkPkg/TcpDxe/TcpDriver.c              |  15 ++-
> - NetworkPkg/TcpDxe/TcpDxe.inf               |   3 +
> - NetworkPkg/Udp4Dxe/Udp4Driver.c            |  10 +-
> - NetworkPkg/Udp6Dxe/Udp6Driver.c            |  11 +-
> - NetworkPkg/UefiPxeBcDxe/PxeBcDhcp4.c       |   9 +-
> - NetworkPkg/UefiPxeBcDxe/PxeBcDhcp6.c       |  11 +-
> - NetworkPkg/UefiPxeBcDxe/PxeBcDriver.c      |  12 +-
> - 27 files changed, 410 insertions(+), 83 deletions(-)
> -
> -diff --git a/NetworkPkg/Dhcp4Dxe/Dhcp4Driver.c b/NetworkPkg/Dhcp4Dxe/Dhc=
p4Driver.c
> -index 8c37e93be3..892caee368 100644
> ---- a/NetworkPkg/Dhcp4Dxe/Dhcp4Driver.c
> -+++ b/NetworkPkg/Dhcp4Dxe/Dhcp4Driver.c
> -@@ -1,6 +1,7 @@
> - /** @file
> -
> - Copyright (c) 2006 - 2018, Intel Corporation. All rights reserved.<BR>
> -+Copyright (c) Microsoft Corporation
> - SPDX-License-Identifier: BSD-2-Clause-Patent
> -
> - **/
> -@@ -189,6 +190,13 @@ Dhcp4CreateService (
> - {
> -   DHCP_SERVICE  *DhcpSb;
> -   EFI_STATUS    Status;
> -+  UINT32        Random;
> -+
> -+  Status =3D PseudoRandomU32 (&Random);
> -+  if (EFI_ERROR (Status)) {
> -+    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\n", _=
_func__, Status));
> -+    return Status;
> -+  }
> -
> -   *Service =3D NULL;
> -   DhcpSb   =3D AllocateZeroPool (sizeof (DHCP_SERVICE));
> -@@ -203,7 +211,7 @@ Dhcp4CreateService (
> -   DhcpSb->Image        =3D ImageHandle;
> -   InitializeListHead (&DhcpSb->Children);
> -   DhcpSb->DhcpState =3D Dhcp4Stopped;
> --  DhcpSb->Xid       =3D NET_RANDOM (NetRandomInitSeed ());
> -+  DhcpSb->Xid       =3D Random;
> -   CopyMem (
> -     &DhcpSb->ServiceBinding,
> -     &mDhcp4ServiceBindingTemplate,
> -diff --git a/NetworkPkg/Dhcp6Dxe/Dhcp6Driver.c b/NetworkPkg/Dhcp6Dxe/Dhc=
p6Driver.c
> -index b591a4605b..e7f2787a98 100644
> ---- a/NetworkPkg/Dhcp6Dxe/Dhcp6Driver.c
> -+++ b/NetworkPkg/Dhcp6Dxe/Dhcp6Driver.c
> -@@ -3,7 +3,7 @@
> -   implementation for Dhcp6 Driver.
> -
> -   Copyright (c) 2009 - 2018, Intel Corporation. All rights reserved.<BR=
>
> --
> -+  Copyright (c) Microsoft Corporation
> -   SPDX-License-Identifier: BSD-2-Clause-Patent
> -
> - **/
> -@@ -123,6 +123,13 @@ Dhcp6CreateService (
> - {
> -   DHCP6_SERVICE  *Dhcp6Srv;
> -   EFI_STATUS     Status;
> -+  UINT32         Random;
> -+
> -+  Status =3D PseudoRandomU32 (&Random);
> -+  if (EFI_ERROR (Status)) {
> -+    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\n", _=
_func__, Status));
> -+    return Status;
> -+  }
> -
> -   *Service =3D NULL;
> -   Dhcp6Srv =3D AllocateZeroPool (sizeof (DHCP6_SERVICE));
> -@@ -147,7 +154,7 @@ Dhcp6CreateService (
> -   Dhcp6Srv->Signature  =3D DHCP6_SERVICE_SIGNATURE;
> -   Dhcp6Srv->Controller =3D Controller;
> -   Dhcp6Srv->Image      =3D ImageHandle;
> --  Dhcp6Srv->Xid        =3D (0xffffff & NET_RANDOM (NetRandomInitSeed ()=
));
> -+  Dhcp6Srv->Xid        =3D (0xffffff & Random);
> -
> -   CopyMem (
> -     &Dhcp6Srv->ServiceBinding,
> -diff --git a/NetworkPkg/DnsDxe/DnsDhcp.c b/NetworkPkg/DnsDxe/DnsDhcp.c
> -index 933565a32d..9eb3c1d2d8 100644
> ---- a/NetworkPkg/DnsDxe/DnsDhcp.c
> -+++ b/NetworkPkg/DnsDxe/DnsDhcp.c
> -@@ -2,6 +2,7 @@
> - Functions implementation related with DHCPv4/v6 for DNS driver.
> -
> - Copyright (c) 2015 - 2018, Intel Corporation. All rights reserved.<BR>
> -+Copyright (c) Microsoft Corporation
> - SPDX-License-Identifier: BSD-2-Clause-Patent
> -
> - **/
> -@@ -277,6 +278,7 @@ GetDns4ServerFromDhcp4 (
> -   EFI_DHCP4_TRANSMIT_RECEIVE_TOKEN  Token;
> -   BOOLEAN                           IsDone;
> -   UINTN                             Index;
> -+  UINT32                            Random;
> -
> -   Image      =3D Instance->Service->ImageHandle;
> -   Controller =3D Instance->Service->ControllerHandle;
> -@@ -292,6 +294,12 @@ GetDns4ServerFromDhcp4 (
> -   Data          =3D NULL;
> -   InterfaceInfo =3D NULL;
> -
> -+  Status =3D PseudoRandomU32 (&Random);
> -+  if (EFI_ERROR (Status)) {
> -+    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\n", _=
_func__, Status));
> -+    return Status;
> -+  }
> -+
> -   ZeroMem ((UINT8 *)ParaList, sizeof (ParaList));
> -
> -   ZeroMem (&MnpConfigData, sizeof (EFI_MANAGED_NETWORK_CONFIG_DATA));
> -@@ -467,7 +475,7 @@ GetDns4ServerFromDhcp4 (
> -
> -   Status =3D Dhcp4->Build (Dhcp4, &SeedPacket, 0, NULL, 2, ParaList, &T=
oken.Packet);
> -
> --  Token.Packet->Dhcp4.Header.Xid =3D HTONL (NET_RANDOM (NetRandomInitSe=
ed ()));
> -+  Token.Packet->Dhcp4.Header.Xid =3D Random;
> -
> -   Token.Packet->Dhcp4.Header.Reserved =3D HTONS ((UINT16)0x8000);
> -
> -diff --git a/NetworkPkg/DnsDxe/DnsImpl.c b/NetworkPkg/DnsDxe/DnsImpl.c
> -index d311812800..c2629bb8df 100644
> ---- a/NetworkPkg/DnsDxe/DnsImpl.c
> -+++ b/NetworkPkg/DnsDxe/DnsImpl.c
> -@@ -2,6 +2,7 @@
> - DnsDxe support functions implementation.
> -
> - Copyright (c) 2016 - 2018, Intel Corporation. All rights reserved.<BR>
> -+Copyright (c) Microsoft Corporation
> - SPDX-License-Identifier: BSD-2-Clause-Patent
> -
> - **/
> -@@ -1963,6 +1964,14 @@ ConstructDNSQuery (
> -   NET_FRAGMENT       Frag;
> -   DNS_HEADER         *DnsHeader;
> -   DNS_QUERY_SECTION  *DnsQuery;
> -+  EFI_STATUS         Status;
> -+  UINT32             Random;
> -+
> -+  Status =3D PseudoRandomU32 (&Random);
> -+  if (EFI_ERROR (Status)) {
> -+    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\n", _=
_func__, Status));
> -+    return Status;
> -+  }
> -
> -   //
> -   // Messages carried by UDP are restricted to 512 bytes (not counting =
the IP
> -@@ -1977,7 +1986,7 @@ ConstructDNSQuery (
> -   // Fill header
> -   //
> -   DnsHeader                    =3D (DNS_HEADER *)Frag.Bulk;
> --  DnsHeader->Identification    =3D (UINT16)NET_RANDOM (NetRandomInitSee=
d ());
> -+  DnsHeader->Identification    =3D (UINT16)Random;
> -   DnsHeader->Flags.Uint16      =3D 0x0000;
> -   DnsHeader->Flags.Bits.RD     =3D 1;
> -   DnsHeader->Flags.Bits.OpCode =3D DNS_FLAGS_OPCODE_STANDARD;
> -diff --git a/NetworkPkg/HttpBootDxe/HttpBootDhcp6.c b/NetworkPkg/HttpBoo=
tDxe/HttpBootDhcp6.c
> -index b22cef4ff5..f964515b0f 100644
> ---- a/NetworkPkg/HttpBootDxe/HttpBootDhcp6.c
> -+++ b/NetworkPkg/HttpBootDxe/HttpBootDhcp6.c
> -@@ -2,6 +2,7 @@
> -   Functions implementation related with DHCPv6 for HTTP boot driver.
> -
> - Copyright (c) 2015 - 2018, Intel Corporation. All rights reserved.<BR>
> -+Copyright (c) Microsoft Corporation
> - SPDX-License-Identifier: BSD-2-Clause-Patent
> -
> - **/
> -@@ -951,6 +952,7 @@ HttpBootDhcp6Sarr (
> -   UINT32                    OptCount;
> -   UINT8                     Buffer[HTTP_BOOT_DHCP6_OPTION_MAX_SIZE];
> -   EFI_STATUS                Status;
> -+  UINT32                    Random;
> -
> -   Dhcp6 =3D Private->Dhcp6;
> -   ASSERT (Dhcp6 !=3D NULL);
> -@@ -961,6 +963,12 @@ HttpBootDhcp6Sarr (
> -   OptCount =3D HttpBootBuildDhcp6Options (Private, OptList, Buffer);
> -   ASSERT (OptCount > 0);
> -
> -+  Status =3D PseudoRandomU32 (&Random);
> -+  if (EFI_ERROR (Status)) {
> -+    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\n", _=
_func__, Status));
> -+    return Status;
> -+  }
> -+
> -   Retransmit =3D AllocateZeroPool (sizeof (EFI_DHCP6_RETRANSMISSION));
> -   if (Retransmit =3D=3D NULL) {
> -     return EFI_OUT_OF_RESOURCES;
> -@@ -976,7 +984,7 @@ HttpBootDhcp6Sarr (
> -   Config.IaInfoEvent           =3D NULL;
> -   Config.RapidCommit           =3D FALSE;
> -   Config.ReconfigureAccept     =3D FALSE;
> --  Config.IaDescriptor.IaId     =3D NET_RANDOM (NetRandomInitSeed ());
> -+  Config.IaDescriptor.IaId     =3D Random;
> -   Config.IaDescriptor.Type     =3D EFI_DHCP6_IA_TYPE_NA;
> -   Config.SolicitRetransmission =3D Retransmit;
> -   Retransmit->Irt              =3D 4;
> -diff --git a/NetworkPkg/IScsiDxe/IScsiCHAP.c b/NetworkPkg/IScsiDxe/IScsi=
CHAP.c
> -index b507f11cd4..bebb1ac29b 100644
> ---- a/NetworkPkg/IScsiDxe/IScsiCHAP.c
> -+++ b/NetworkPkg/IScsiDxe/IScsiCHAP.c
> -@@ -3,6 +3,7 @@
> -   Configuration.
> -
> - Copyright (c) 2004 - 2018, Intel Corporation. All rights reserved.<BR>
> -+Copyright (c) Microsoft Corporation
> - SPDX-License-Identifier: BSD-2-Clause-Patent
> -
> - **/
> -@@ -576,16 +577,24 @@ IScsiCHAPToSendReq (
> -         //
> -         // CHAP_I=3D<I>
> -         //
> --        IScsiGenRandom ((UINT8 *)&AuthData->OutIdentifier, 1);
> -+        Status =3D IScsiGenRandom ((UINT8 *)&AuthData->OutIdentifier, 1=
);
> -+        if (EFI_ERROR (Status)) {
> -+          break;
> -+        }
> -+
> -         AsciiSPrint (ValueStr, sizeof (ValueStr), "%d", AuthData->OutId=
entifier);
> -         IScsiAddKeyValuePair (Pdu, ISCSI_KEY_CHAP_IDENTIFIER, ValueStr)=
;
> -         //
> -         // CHAP_C=3D<C>
> -         //
> --        IScsiGenRandom (
> --          (UINT8 *)AuthData->OutChallenge,
> --          AuthData->Hash->DigestSize
> --          );
> -+        Status =3D IScsiGenRandom (
> -+                   (UINT8 *)AuthData->OutChallenge,
> -+                   AuthData->Hash->DigestSize
> -+                   );
> -+        if (EFI_ERROR (Status)) {
> -+          break;
> -+        }
> -+
> -         BinToHexStatus =3D IScsiBinToHex (
> -                            (UINT8 *)AuthData->OutChallenge,
> -                            AuthData->Hash->DigestSize,
> -diff --git a/NetworkPkg/IScsiDxe/IScsiMisc.c b/NetworkPkg/IScsiDxe/IScsi=
Misc.c
> -index b3ea90158f..cd77f1a13e 100644
> ---- a/NetworkPkg/IScsiDxe/IScsiMisc.c
> -+++ b/NetworkPkg/IScsiDxe/IScsiMisc.c
> -@@ -2,6 +2,7 @@
> -   Miscellaneous routines for iSCSI driver.
> -
> - Copyright (c) 2004 - 2018, Intel Corporation. All rights reserved.<BR>
> -+Copyright (c) Microsoft Corporation
> - SPDX-License-Identifier: BSD-2-Clause-Patent
> -
> - **/
> -@@ -474,20 +475,17 @@ IScsiNetNtoi (
> -   @param[in, out]  Rand       The buffer to contain random numbers.
> -   @param[in]       RandLength The length of the Rand buffer.
> -
> -+  @retval EFI_SUCCESS on success
> -+  @retval others      on error
> -+
> - **/
> --VOID
> -+EFI_STATUS
> - IScsiGenRandom (
> -   IN OUT UINT8  *Rand,
> -   IN     UINTN  RandLength
> -   )
> - {
> --  UINT32  Random;
> --
> --  while (RandLength > 0) {
> --    Random  =3D NET_RANDOM (NetRandomInitSeed ());
> --    *Rand++ =3D (UINT8)(Random);
> --    RandLength--;
> --  }
> -+  return PseudoRandom (Rand, RandLength);
> - }
> -
> - /**
> -diff --git a/NetworkPkg/IScsiDxe/IScsiMisc.h b/NetworkPkg/IScsiDxe/IScsi=
Misc.h
> -index a951eee70e..91b2cd2261 100644
> ---- a/NetworkPkg/IScsiDxe/IScsiMisc.h
> -+++ b/NetworkPkg/IScsiDxe/IScsiMisc.h
> -@@ -2,6 +2,7 @@
> -   Miscellaneous definitions for iSCSI driver.
> -
> - Copyright (c) 2004 - 2018, Intel Corporation. All rights reserved.<BR>
> -+Copyright (c) Microsoft Corporation
> - SPDX-License-Identifier: BSD-2-Clause-Patent
> -
> - **/
> -@@ -202,8 +203,11 @@ IScsiNetNtoi (
> -   @param[in, out]  Rand       The buffer to contain random numbers.
> -   @param[in]       RandLength The length of the Rand buffer.
> -
> -+  @retval EFI_SUCCESS on success
> -+  @retval others      on error
> -+
> - **/
> --VOID
> -+EFI_STATUS
> - IScsiGenRandom (
> -   IN OUT UINT8  *Rand,
> -   IN     UINTN  RandLength
> -diff --git a/NetworkPkg/Include/Library/NetLib.h b/NetworkPkg/Include/Li=
brary/NetLib.h
> -index 8c0e62b388..e8108b79db 100644
> ---- a/NetworkPkg/Include/Library/NetLib.h
> -+++ b/NetworkPkg/Include/Library/NetLib.h
> -@@ -3,6 +3,7 @@
> -   It provides basic functions for the UEFI network stack.
> -
> - Copyright (c) 2005 - 2018, Intel Corporation. All rights reserved.<BR>
> -+Copyright (c) Microsoft Corporation
> - SPDX-License-Identifier: BSD-2-Clause-Patent
> -
> - **/
> -@@ -539,8 +540,6 @@ extern EFI_IPv4_ADDRESS  mZeroIp4Addr;
> - #define TICKS_PER_MS      10000U
> - #define TICKS_PER_SECOND  10000000U
> -
> --#define NET_RANDOM(Seed)  ((UINT32) ((UINT32) (Seed) * 1103515245UL + 1=
2345) % 4294967295UL)
> --
> - /**
> -   Extract a UINT32 from a byte stream.
> -
> -@@ -580,19 +579,40 @@ NetPutUint32 (
> -   );
> -
> - /**
> --  Initialize a random seed using current time and monotonic count.
> -+  Generate a Random output data given a length.
> -
> --  Get current time and monotonic count first. Then initialize a random =
seed
> --  based on some basic mathematics operation on the hour, day, minute, s=
econd,
> --  nanosecond and year of the current time and the monotonic count value=
.
> -+  @param[out] Output - The buffer to store the generated random data.
> -+  @param[in] OutputLength - The length of the output buffer.
> -
> --  @return The random seed initialized with current time.
> -+  @retval EFI_SUCCESS           On Success
> -+  @retval EFI_INVALID_PARAMETER Pointer is null or size is zero
> -+  @retval EFI_NOT_FOUND         RNG protocol not found
> -+  @retval Others                Error from RngProtocol->GetRNG()
> -
> -+  @return Status code
> - **/
> --UINT32
> -+EFI_STATUS
> - EFIAPI
> --NetRandomInitSeed (
> --  VOID
> -+PseudoRandom (
> -+  OUT  VOID   *Output,
> -+  IN   UINTN  OutputLength
> -+  );
> -+
> -+/**
> -+  Generate a 32-bit pseudo-random number.
> -+
> -+  @param[out] Output - The buffer to store the generated random number.
> -+
> -+  @retval EFI_SUCCESS           On Success
> -+  @retval EFI_NOT_FOUND         RNG protocol not found
> -+  @retval Others                Error from RngProtocol->GetRNG()
> -+
> -+  @return Status code
> -+**/
> -+EFI_STATUS
> -+EFIAPI
> -+PseudoRandomU32 (
> -+  OUT  UINT32  *Output
> -   );
> -
> - #define NET_LIST_USER_STRUCT(Entry, Type, Field)        \
> -diff --git a/NetworkPkg/Ip4Dxe/Ip4Driver.c b/NetworkPkg/Ip4Dxe/Ip4Driver=
.c
> -index ec483ff01f..683423f38d 100644
> ---- a/NetworkPkg/Ip4Dxe/Ip4Driver.c
> -+++ b/NetworkPkg/Ip4Dxe/Ip4Driver.c
> -@@ -2,6 +2,7 @@
> -   The driver binding and service binding protocol for IP4 driver.
> -
> - Copyright (c) 2005 - 2019, Intel Corporation. All rights reserved.<BR>
> -+Copyright (c) Microsoft Corporation
> - (C) Copyright 2015 Hewlett-Packard Development Company, L.P.<BR>
> -
> - SPDX-License-Identifier: BSD-2-Clause-Patent
> -@@ -549,11 +550,18 @@ Ip4DriverBindingStart (
> -   EFI_IP4_CONFIG2_PROTOCOL  *Ip4Cfg2;
> -   UINTN                     Index;
> -   IP4_CONFIG2_DATA_ITEM     *DataItem;
> -+  UINT32                    Random;
> -
> -   IpSb     =3D NULL;
> -   Ip4Cfg2  =3D NULL;
> -   DataItem =3D NULL;
> -
> -+  Status =3D PseudoRandomU32 (&Random);
> -+  if (EFI_ERROR (Status)) {
> -+    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\n", _=
_func__, Status));
> -+    return Status;
> -+  }
> -+
> -   //
> -   // Test for the Ip4 service binding protocol
> -   //
> -@@ -653,7 +661,7 @@ Ip4DriverBindingStart (
> -   //
> -   // Initialize the IP4 ID
> -   //
> --  mIp4Id =3D (UINT16)NET_RANDOM (NetRandomInitSeed ());
> -+  mIp4Id =3D (UINT16)Random;
> -
> -   return Status;
> -
> -diff --git a/NetworkPkg/Ip6Dxe/Ip6ConfigImpl.c b/NetworkPkg/Ip6Dxe/Ip6Co=
nfigImpl.c
> -index 70e232ce6c..4c1354d26c 100644
> ---- a/NetworkPkg/Ip6Dxe/Ip6ConfigImpl.c
> -+++ b/NetworkPkg/Ip6Dxe/Ip6ConfigImpl.c
> -@@ -2276,6 +2276,13 @@ Ip6ConfigInitInstance (
> -   UINTN                 Index;
> -   UINT16                IfIndex;
> -   IP6_CONFIG_DATA_ITEM  *DataItem;
> -+  UINT32                Random;
> -+
> -+  Status =3D PseudoRandomU32 (&Random);
> -+  if (EFI_ERROR (Status)) {
> -+    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\n", _=
_func__, Status));
> -+    return Status;
> -+  }
> -
> -   IpSb =3D IP6_SERVICE_FROM_IP6_CONFIG_INSTANCE (Instance);
> -
> -@@ -2381,7 +2388,7 @@ Ip6ConfigInitInstance (
> -     // The NV variable is not set, so generate a random IAID, and write=
 down the
> -     // fresh new configuration as the NV variable now.
> -     //
> --    Instance->IaId =3D NET_RANDOM (NetRandomInitSeed ());
> -+    Instance->IaId =3D Random;
> -
> -     for (Index =3D 0; Index < IpSb->SnpMode.HwAddressSize; Index++) {
> -       Instance->IaId |=3D (IpSb->SnpMode.CurrentAddress.Addr[Index] << =
((Index << 3) & 31));
> -diff --git a/NetworkPkg/Ip6Dxe/Ip6Driver.c b/NetworkPkg/Ip6Dxe/Ip6Driver=
.c
> -index b483a7d136..cbe011dad4 100644
> ---- a/NetworkPkg/Ip6Dxe/Ip6Driver.c
> -+++ b/NetworkPkg/Ip6Dxe/Ip6Driver.c
> -@@ -3,7 +3,7 @@
> -
> -   Copyright (c) 2009 - 2019, Intel Corporation. All rights reserved.<BR=
>
> -   (C) Copyright 2015 Hewlett-Packard Development Company, L.P.<BR>
> --
> -+  Copyright (c) Microsoft Corporation
> -   SPDX-License-Identifier: BSD-2-Clause-Patent
> -
> - **/
> -@@ -316,7 +316,11 @@ Ip6CreateService (
> -   IpSb->CurHopLimit       =3D IP6_HOP_LIMIT;
> -   IpSb->LinkMTU           =3D IP6_MIN_LINK_MTU;
> -   IpSb->BaseReachableTime =3D IP6_REACHABLE_TIME;
> --  Ip6UpdateReachableTime (IpSb);
> -+  Status                  =3D Ip6UpdateReachableTime (IpSb);
> -+  if (EFI_ERROR (Status)) {
> -+    goto ON_ERROR;
> -+  }
> -+
> -   //
> -   // RFC4861 RETRANS_TIMER: 1,000 milliseconds
> -   //
> -@@ -516,11 +520,18 @@ Ip6DriverBindingStart (
> -   EFI_STATUS               Status;
> -   EFI_IP6_CONFIG_PROTOCOL  *Ip6Cfg;
> -   IP6_CONFIG_DATA_ITEM     *DataItem;
> -+  UINT32                   Random;
> -
> -   IpSb     =3D NULL;
> -   Ip6Cfg   =3D NULL;
> -   DataItem =3D NULL;
> -
> -+  Status =3D PseudoRandomU32 (&Random);
> -+  if (EFI_ERROR (Status)) {
> -+    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\n", _=
_func__, Status));
> -+    return Status;
> -+  }
> -+
> -   //
> -   // Test for the Ip6 service binding protocol
> -   //
> -@@ -656,7 +667,7 @@ Ip6DriverBindingStart (
> -   //
> -   // Initialize the IP6 ID
> -   //
> --  mIp6Id =3D NET_RANDOM (NetRandomInitSeed ());
> -+  mIp6Id =3D Random;
> -
> -   return EFI_SUCCESS;
> -
> -diff --git a/NetworkPkg/Ip6Dxe/Ip6If.c b/NetworkPkg/Ip6Dxe/Ip6If.c
> -index 4629c05f25..f3d11c4d21 100644
> ---- a/NetworkPkg/Ip6Dxe/Ip6If.c
> -+++ b/NetworkPkg/Ip6Dxe/Ip6If.c
> -@@ -2,7 +2,7 @@
> -   Implement IP6 pseudo interface.
> -
> -   Copyright (c) 2009 - 2018, Intel Corporation. All rights reserved.<BR=
>
> --
> -+  Copyright (c) Microsoft Corporation
> -   SPDX-License-Identifier: BSD-2-Clause-Patent
> -
> - **/
> -@@ -89,6 +89,14 @@ Ip6SetAddress (
> -   IP6_PREFIX_LIST_ENTRY  *PrefixEntry;
> -   UINT64                 Delay;
> -   IP6_DELAY_JOIN_LIST    *DelayNode;
> -+  EFI_STATUS             Status;
> -+  UINT32                 Random;
> -+
> -+  Status =3D PseudoRandomU32 (&Random);
> -+  if (EFI_ERROR (Status)) {
> -+    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\n", _=
_func__, Status));
> -+    return Status;
> -+  }
> -
> -   NET_CHECK_SIGNATURE (Interface, IP6_INTERFACE_SIGNATURE);
> -
> -@@ -164,7 +172,7 @@ Ip6SetAddress (
> -   // Thus queue the address to be processed in Duplicate Address Detect=
ion module
> -   // after the delay time (in milliseconds).
> -   //
> --  Delay =3D (UINT64)NET_RANDOM (NetRandomInitSeed ());
> -+  Delay =3D (UINT64)Random;
> -   Delay =3D MultU64x32 (Delay, IP6_ONE_SECOND_IN_MS);
> -   Delay =3D RShiftU64 (Delay, 32);
> -
> -diff --git a/NetworkPkg/Ip6Dxe/Ip6Mld.c b/NetworkPkg/Ip6Dxe/Ip6Mld.c
> -index e6b2b653e2..498a118543 100644
> ---- a/NetworkPkg/Ip6Dxe/Ip6Mld.c
> -+++ b/NetworkPkg/Ip6Dxe/Ip6Mld.c
> -@@ -696,7 +696,15 @@ Ip6UpdateDelayTimer (
> -   IN OUT IP6_MLD_GROUP  *Group
> -   )
> - {
> --  UINT32  Delay;
> -+  UINT32      Delay;
> -+  EFI_STATUS  Status;
> -+  UINT32      Random;
> -+
> -+  Status =3D PseudoRandomU32 (&Random);
> -+  if (EFI_ERROR (Status)) {
> -+    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\n", _=
_func__, Status));
> -+    return Status;
> -+  }
> -
> -   //
> -   // If the Query packet specifies a Maximum Response Delay of zero, pe=
rform timer
> -@@ -715,7 +723,7 @@ Ip6UpdateDelayTimer (
> -   // is less than the remaining value of the running timer.
> -   //
> -   if ((Group->DelayTimer =3D=3D 0) || (Delay < Group->DelayTimer)) {
> --    Group->DelayTimer =3D Delay / 4294967295UL * NET_RANDOM (NetRandomI=
nitSeed ());
> -+    Group->DelayTimer =3D Delay / 4294967295UL * Random;
> -   }
> -
> -   return EFI_SUCCESS;
> -diff --git a/NetworkPkg/Ip6Dxe/Ip6Nd.c b/NetworkPkg/Ip6Dxe/Ip6Nd.c
> -index c10c7017f8..72aa45c10f 100644
> ---- a/NetworkPkg/Ip6Dxe/Ip6Nd.c
> -+++ b/NetworkPkg/Ip6Dxe/Ip6Nd.c
> -@@ -2,7 +2,7 @@
> -   Implementation of Neighbor Discovery support routines.
> -
> -   Copyright (c) 2009 - 2018, Intel Corporation. All rights reserved.<BR=
>
> --
> -+  Copyright (c) Microsoft Corporation
> -   SPDX-License-Identifier: BSD-2-Clause-Patent
> -
> - **/
> -@@ -16,17 +16,28 @@ EFI_MAC_ADDRESS  mZeroMacAddress;
> -
> -   @param[in, out] IpSb     Points to the IP6_SERVICE.
> -
> -+  @retval EFI_SUCCESS           ReachableTime Updated
> -+  @retval others                Failed to update ReachableTime
> - **/
> --VOID
> -+EFI_STATUS
> - Ip6UpdateReachableTime (
> -   IN OUT IP6_SERVICE  *IpSb
> -   )
> - {
> --  UINT32  Random;
> -+  UINT32      Random;
> -+  EFI_STATUS  Status;
> -
> --  Random              =3D (NetRandomInitSeed () / 4294967295UL) * IP6_R=
ANDOM_FACTOR_SCALE;
> -+  Status =3D PseudoRandomU32 (&Random);
> -+  if (EFI_ERROR (Status)) {
> -+    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\n", _=
_func__, Status));
> -+    return Status;
> -+  }
> -+
> -+  Random              =3D (Random / 4294967295UL) * IP6_RANDOM_FACTOR_S=
CALE;
> -   Random              =3D Random + IP6_MIN_RANDOM_FACTOR_SCALED;
> -   IpSb->ReachableTime =3D (IpSb->BaseReachableTime * Random) / IP6_RAND=
OM_FACTOR_SCALE;
> -+
> -+  return EFI_SUCCESS;
> - }
> -
> - /**
> -@@ -972,10 +983,17 @@ Ip6InitDADProcess (
> -   IP6_SERVICE                               *IpSb;
> -   EFI_STATUS                                Status;
> -   UINT32                                    MaxDelayTick;
> -+  UINT32                                    Random;
> -
> -   NET_CHECK_SIGNATURE (IpIf, IP6_INTERFACE_SIGNATURE);
> -   ASSERT (AddressInfo !=3D NULL);
> -
> -+  Status =3D PseudoRandomU32 (&Random);
> -+  if (EFI_ERROR (Status)) {
> -+    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\n", _=
_func__, Status));
> -+    return Status;
> -+  }
> -+
> -   //
> -   // Do nothing if we have already started DAD on the address.
> -   //
> -@@ -1014,7 +1032,7 @@ Ip6InitDADProcess (
> -   Entry->Transmit    =3D 0;
> -   Entry->Receive     =3D 0;
> -   MaxDelayTick       =3D IP6_MAX_RTR_SOLICITATION_DELAY / IP6_TIMER_INT=
ERVAL_IN_MS;
> --  Entry->RetransTick =3D (MaxDelayTick * ((NET_RANDOM (NetRandomInitSee=
d ()) % 5) + 1)) / 5;
> -+  Entry->RetransTick =3D (MaxDelayTick * ((Random % 5) + 1)) / 5;
> -   Entry->AddressInfo =3D AddressInfo;
> -   Entry->Callback    =3D Callback;
> -   Entry->Context     =3D Context;
> -@@ -2078,7 +2096,10 @@ Ip6ProcessRouterAdvertise (
> -     // in BaseReachableTime and recompute a ReachableTime.
> -     //
> -     IpSb->BaseReachableTime =3D ReachableTime;
> --    Ip6UpdateReachableTime (IpSb);
> -+    Status                  =3D Ip6UpdateReachableTime (IpSb);
> -+    if (EFI_ERROR (Status)) {
> -+      goto Exit;
> -+    }
> -   }
> -
> -   if (RetransTimer !=3D 0) {
> -diff --git a/NetworkPkg/Ip6Dxe/Ip6Nd.h b/NetworkPkg/Ip6Dxe/Ip6Nd.h
> -index bf64e9114e..5795e23c7d 100644
> ---- a/NetworkPkg/Ip6Dxe/Ip6Nd.h
> -+++ b/NetworkPkg/Ip6Dxe/Ip6Nd.h
> -@@ -2,7 +2,7 @@
> -   Definition of Neighbor Discovery support routines.
> -
> -   Copyright (c) 2009 - 2012, Intel Corporation. All rights reserved.<BR=
>
> --
> -+  Copyright (c) Microsoft Corporation
> -   SPDX-License-Identifier: BSD-2-Clause-Patent
> -
> - **/
> -@@ -780,10 +780,10 @@ Ip6OnArpResolved (
> - /**
> -   Update the ReachableTime in IP6 service binding instance data, in mil=
liseconds.
> -
> --  @param[in, out] IpSb     Points to the IP6_SERVICE.
> --
> -+  @retval EFI_SUCCESS           ReachableTime Updated
> -+  @retval others                Failed to update ReachableTime
> - **/
> --VOID
> -+EFI_STATUS
> - Ip6UpdateReachableTime (
> -   IN OUT IP6_SERVICE  *IpSb
> -   );
> -diff --git a/NetworkPkg/Library/DxeNetLib/DxeNetLib.c b/NetworkPkg/Libra=
ry/DxeNetLib/DxeNetLib.c
> -index fd4a9e15a8..01c13c08d2 100644
> ---- a/NetworkPkg/Library/DxeNetLib/DxeNetLib.c
> -+++ b/NetworkPkg/Library/DxeNetLib/DxeNetLib.c
> -@@ -3,6 +3,7 @@
> -
> - Copyright (c) 2005 - 2018, Intel Corporation. All rights reserved.<BR>
> - (C) Copyright 2015 Hewlett Packard Enterprise Development LP<BR>
> -+Copyright (c) Microsoft Corporation
> - SPDX-License-Identifier: BSD-2-Clause-Patent
> - **/
> -
> -@@ -31,6 +32,7 @@ SPDX-License-Identifier: BSD-2-Clause-Patent
> - #include <Library/DevicePathLib.h>
> - #include <Library/PrintLib.h>
> - #include <Library/UefiLib.h>
> -+#include <Protocol/Rng.h>
> -
> - #define NIC_ITEM_CONFIG_SIZE  (sizeof (NIC_IP4_CONFIG_INFO) + sizeof (E=
FI_IP4_ROUTE_TABLE) * MAX_IP4_CONFIG_IN_VARIABLE)
> - #define DEFAULT_ZERO_START    ((UINTN) ~0)
> -@@ -127,6 +129,25 @@ GLOBAL_REMOVE_IF_UNREFERENCED VLAN_DEVICE_PATH  mNe=
tVlanDevicePathTemplate =3D {
> -   0
> - };
> -
> -+//
> -+// These represent UEFI SPEC defined algorithms that should be supporte=
d by
> -+// the RNG protocol and are generally considered secure.
> -+//
> -+// The order of the algorithms in this array is important. This order i=
s the order
> -+// in which the algorithms will be tried by the RNG protocol.
> -+// If your platform needs to use a specific algorithm for the random nu=
mber generator,
> -+// then you should place that algorithm first in the array.
> -+//
> -+GLOBAL_REMOVE_IF_UNREFERENCED EFI_GUID  *mSecureHashAlgorithms[] =3D {
> -+  &gEfiRngAlgorithmSp80090Ctr256Guid,  // SP800-90A DRBG CTR using AES-=
256
> -+  &gEfiRngAlgorithmSp80090Hmac256Guid, // SP800-90A DRBG HMAC using SHA=
-256
> -+  &gEfiRngAlgorithmSp80090Hash256Guid, // SP800-90A DRBG Hash using SHA=
-256
> -+  &gEfiRngAlgorithmArmRndr,            // unspecified SP800-90A DRBG vi=
a ARM RNDR register
> -+  &gEfiRngAlgorithmRaw,                // Raw data from NRBG (or TRNG)
> -+};
> -+
> -+#define SECURE_HASH_ALGORITHMS_SIZE  (sizeof (mSecureHashAlgorithms) / =
sizeof (EFI_GUID *))
> -+
> - /**
> -   Locate the handles that support SNP, then open one of them
> -   to send the syslog packets. The caller isn't required to close
> -@@ -884,34 +905,107 @@ Ip6Swap128 (
> - }
> -
> - /**
> --  Initialize a random seed using current time and monotonic count.
> -+  Generate a Random output data given a length.
> -
> --  Get current time and monotonic count first. Then initialize a random =
seed
> --  based on some basic mathematics operation on the hour, day, minute, s=
econd,
> --  nanosecond and year of the current time and the monotonic count value=
.
> -+  @param[out] Output - The buffer to store the generated random data.
> -+  @param[in] OutputLength - The length of the output buffer.
> -
> --  @return The random seed initialized with current time.
> -+  @retval EFI_SUCCESS           On Success
> -+  @retval EFI_INVALID_PARAMETER Pointer is null or size is zero
> -+  @retval EFI_NOT_FOUND         RNG protocol not found
> -+  @retval Others                Error from RngProtocol->GetRNG()
> -
> -+  @return Status code
> - **/
> --UINT32
> -+EFI_STATUS
> - EFIAPI
> --NetRandomInitSeed (
> --  VOID
> -+PseudoRandom (
> -+  OUT  VOID   *Output,
> -+  IN   UINTN  OutputLength
> -   )
> - {
> --  EFI_TIME  Time;
> --  UINT32    Seed;
> --  UINT64    MonotonicCount;
> -+  EFI_RNG_PROTOCOL  *RngProtocol;
> -+  EFI_STATUS        Status;
> -+  UINTN             AlgorithmIndex;
> -+
> -+  if ((Output =3D=3D NULL) || (OutputLength =3D=3D 0)) {
> -+    return EFI_INVALID_PARAMETER;
> -+  }
> -+
> -+  Status =3D gBS->LocateProtocol (&gEfiRngProtocolGuid, NULL, (VOID **)=
&RngProtocol);
> -+  if (EFI_ERROR (Status)) {
> -+    DEBUG ((DEBUG_ERROR, "Failed to locate EFI_RNG_PROTOCOL: %r\n", Sta=
tus));
> -+    ASSERT_EFI_ERROR (Status);
> -+    return Status;
> -+  }
> -+
> -+  if (PcdGetBool (PcdEnforceSecureRngAlgorithms)) {
> -+    for (AlgorithmIndex =3D 0; AlgorithmIndex < SECURE_HASH_ALGORITHMS_=
SIZE; AlgorithmIndex++) {
> -+      Status =3D RngProtocol->GetRNG (RngProtocol, mSecureHashAlgorithm=
s[AlgorithmIndex], OutputLength, (UINT8 *)Output);
> -+      if (!EFI_ERROR (Status)) {
> -+        //
> -+        // Secure Algorithm was supported on this platform
> -+        //
> -+        return EFI_SUCCESS;
> -+      } else if (Status =3D=3D EFI_UNSUPPORTED) {
> -+        //
> -+        // Secure Algorithm was not supported on this platform
> -+        //
> -+        DEBUG ((DEBUG_ERROR, "Failed to generate random data using secu=
re algorithm %d: %r\n", AlgorithmIndex, Status));
> -+
> -+        //
> -+        // Try the next secure algorithm
> -+        //
> -+        continue;
> -+      } else {
> -+        //
> -+        // Some other error occurred
> -+        //
> -+        DEBUG ((DEBUG_ERROR, "Failed to generate random data using secu=
re algorithm %d: %r\n", AlgorithmIndex, Status));
> -+        ASSERT_EFI_ERROR (Status);
> -+        return Status;
> -+      }
> -+    }
> -+
> -+    //
> -+    // If we get here, we failed to generate random data using any secu=
re algorithm
> -+    // Platform owner should ensure that at least one secure algorithm =
is supported
> -+    //
> -+    ASSERT_EFI_ERROR (Status);
> -+    return Status;
> -+  }
> -+
> -+  //
> -+  // Lets try using the default algorithm (which may not be secure)
> -+  //
> -+  Status =3D RngProtocol->GetRNG (RngProtocol, NULL, OutputLength, (UIN=
T8 *)Output);
> -+  if (EFI_ERROR (Status)) {
> -+    DEBUG ((DEBUG_ERROR, "%a failed to generate random data: %r\n", __f=
unc__, Status));
> -+    ASSERT_EFI_ERROR (Status);
> -+    return Status;
> -+  }
> -
> --  gRT->GetTime (&Time, NULL);
> --  Seed  =3D (Time.Hour << 24 | Time.Day << 16 | Time.Minute << 8 | Time=
.Second);
> --  Seed ^=3D Time.Nanosecond;
> --  Seed ^=3D Time.Year << 7;
> -+  return EFI_SUCCESS;
> -+}
> -+
> -+/**
> -+  Generate a 32-bit pseudo-random number.
> -
> --  gBS->GetNextMonotonicCount (&MonotonicCount);
> --  Seed +=3D (UINT32)MonotonicCount;
> -+  @param[out] Output - The buffer to store the generated random number.
> -
> --  return Seed;
> -+  @retval EFI_SUCCESS           On Success
> -+  @retval EFI_NOT_FOUND         RNG protocol not found
> -+  @retval Others                Error from RngProtocol->GetRNG()
> -+
> -+  @return Status code
> -+**/
> -+EFI_STATUS
> -+EFIAPI
> -+PseudoRandomU32 (
> -+  OUT UINT32  *Output
> -+  )
> -+{
> -+  return PseudoRandom (Output, sizeof (*Output));
> - }
> -
> - /**
> -diff --git a/NetworkPkg/Library/DxeNetLib/DxeNetLib.inf b/NetworkPkg/Lib=
rary/DxeNetLib/DxeNetLib.inf
> -index 8145d256ec..a8f534a293 100644
> ---- a/NetworkPkg/Library/DxeNetLib/DxeNetLib.inf
> -+++ b/NetworkPkg/Library/DxeNetLib/DxeNetLib.inf
> -@@ -3,6 +3,7 @@
> - #
> - #  Copyright (c) 2006 - 2018, Intel Corporation. All rights reserved.<B=
R>
> - #  (C) Copyright 2015 Hewlett Packard Enterprise Development LP<BR>
> -+#  Copyright (c) Microsoft Corporation
> - #  SPDX-License-Identifier: BSD-2-Clause-Patent
> - #
> - ##
> -@@ -49,7 +50,11 @@
> -   gEfiSmbiosTableGuid                           ## SOMETIMES_CONSUMES  =
## SystemTable
> -   gEfiSmbios3TableGuid                          ## SOMETIMES_CONSUMES  =
## SystemTable
> -   gEfiAdapterInfoMediaStateGuid                 ## SOMETIMES_CONSUMES
> --
> -+  gEfiRngAlgorithmRaw                           ## CONSUMES
> -+  gEfiRngAlgorithmSp80090Ctr256Guid             ## CONSUMES
> -+  gEfiRngAlgorithmSp80090Hmac256Guid            ## CONSUMES
> -+  gEfiRngAlgorithmSp80090Hash256Guid            ## CONSUMES
> -+  gEfiRngAlgorithmArmRndr                       ## CONSUMES
> -
> - [Protocols]
> -   gEfiSimpleNetworkProtocolGuid                 ## SOMETIMES_CONSUMES
> -@@ -59,3 +64,10 @@
> -   gEfiComponentNameProtocolGuid                 ## SOMETIMES_CONSUMES
> -   gEfiComponentName2ProtocolGuid                ## SOMETIMES_CONSUMES
> -   gEfiAdapterInformationProtocolGuid            ## SOMETIMES_CONSUMES
> -+  gEfiRngProtocolGuid                           ## CONSUMES
> -+
> -+[FixedPcd]
> -+  gEfiNetworkPkgTokenSpaceGuid.PcdEnforceSecureRngAlgorithms ## CONSUME=
S
> -+
> -+[Depex]
> -+  gEfiRngProtocolGuid
> -diff --git a/NetworkPkg/NetworkPkg.dec b/NetworkPkg/NetworkPkg.dec
> -index 928e84fec4..ff335e957c 100644
> ---- a/NetworkPkg/NetworkPkg.dec
> -+++ b/NetworkPkg/NetworkPkg.dec
> -@@ -5,6 +5,7 @@
> - #
> - # Copyright (c) 2009 - 2021, Intel Corporation. All rights reserved.<BR=
>
> - # (C) Copyright 2015-2020 Hewlett Packard Enterprise Development LP<BR>
> -+# Copyright (c) Microsoft Corporation
> - #
> - # SPDX-License-Identifier: BSD-2-Clause-Patent
> - #
> -@@ -127,6 +128,12 @@
> -   # @Prompt Indicates whether SnpDxe creates event for ExitBootServices=
() call.
> -   gEfiNetworkPkgTokenSpaceGuid.PcdSnpCreateExitBootServicesEvent|TRUE|B=
OOLEAN|0x1000000C
> -
> -+  ## Enforces the use of Secure UEFI spec defined RNG algorithms for al=
l network connections.
> -+  # TRUE  - Enforce the use of Secure UEFI spec defined RNG algorithms.
> -+  # FALSE - Do not enforce and depend on the default implementation of =
RNG algorithm from the provider.
> -+  # @Prompt Enforce the use of Secure UEFI spec defined RNG algorithms.
> -+  gEfiNetworkPkgTokenSpaceGuid.PcdEnforceSecureRngAlgorithms|TRUE|BOOLE=
AN|0x1000000D
> -+
> - [PcdsFixedAtBuild, PcdsPatchableInModule, PcdsDynamic, PcdsDynamicEx]
> -   ## IPv6 DHCP Unique Identifier (DUID) Type configuration (From RFCs 3=
315 and 6355).
> -   # 01 =3D DUID Based on Link-layer Address Plus Time [DUID-LLT]
> -diff --git a/NetworkPkg/SecurityFixes.yaml b/NetworkPkg/SecurityFixes.ya=
ml
> -index 7e900483fe..2b2c794697 100644
> ---- a/NetworkPkg/SecurityFixes.yaml
> -+++ b/NetworkPkg/SecurityFixes.yaml
> -@@ -121,3 +121,42 @@ CVE_2023_45235:
> -     - http://www.openwall.com/lists/oss-security/2024/01/16/2
> -     - http://packetstormsecurity.com/files/176574/PixieFail-Proof-Of-Co=
ncepts.html
> -     - https://blog.quarkslab.com/pixiefail-nine-vulnerabilities-in-tian=
ocores-edk-ii-ipv6-network-stack.html
> -+CVE_2023_45237:
> -+  commit_titles:
> -+    - "NetworkPkg:: SECURITY PATCH CVE 2023-45237"
> -+  cve: CVE-2023-45237
> -+  date_reported: 2023-08-28 13:56 UTC
> -+  description: "Bug 09 - Use of a Weak PseudoRandom Number Generator"
> -+  note:
> -+  files_impacted:
> -+    - NetworkPkg/Dhcp4Dxe/Dhcp4Driver.c
> -+    - NetworkPkg/Dhcp6Dxe/Dhcp6Driver.c
> -+    - NetworkPkg/DnsDxe/DnsDhcp.c
> -+    - NetworkPkg/DnsDxe/DnsImpl.c
> -+    - NetworkPkg/HttpBootDxe/HttpBootDhcp6.c
> -+    - NetworkPkg/IScsiDxe/IScsiCHAP.c
> -+    - NetworkPkg/IScsiDxe/IScsiMisc.c
> -+    - NetworkPkg/IScsiDxe/IScsiMisc.h
> -+    - NetworkPkg/Include/Library/NetLib.h
> -+    - NetworkPkg/Ip4Dxe/Ip4Driver.c
> -+    - NetworkPkg/Ip6Dxe/Ip6ConfigImpl.c
> -+    - NetworkPkg/Ip6Dxe/Ip6Driver.c
> -+    - NetworkPkg/Ip6Dxe/Ip6If.c
> -+    - NetworkPkg/Ip6Dxe/Ip6Mld.c
> -+    - NetworkPkg/Ip6Dxe/Ip6Nd.c
> -+    - NetworkPkg/Ip6Dxe/Ip6Nd.h
> -+    - NetworkPkg/Library/DxeNetLib/DxeNetLib.c
> -+    - NetworkPkg/Library/DxeNetLib/DxeNetLib.inf
> -+    - NetworkPkg/NetworkPkg.dec
> -+    - NetworkPkg/TcpDxe/TcpDriver.c
> -+    - NetworkPkg/Udp4Dxe/Udp4Driver.c
> -+    - NetworkPkg/Udp6Dxe/Udp6Driver.c
> -+    - NetworkPkg/UefiPxeBcDxe/PxeBcDhcp4.c
> -+    - NetworkPkg/UefiPxeBcDxe/PxeBcDhcp6.c
> -+    - NetworkPkg/UefiPxeBcDxe/PxeBcDriver.c
> -+  links:
> -+    - https://bugzilla.tianocore.org/show_bug.cgi?id=3D4542
> -+    - https://nvd.nist.gov/vuln/detail/CVE-2023-45237
> -+    - http://www.openwall.com/lists/oss-security/2024/01/16/2
> -+    - http://packetstormsecurity.com/files/176574/PixieFail-Proof-Of-Co=
ncepts.html
> -+    - https://blog.quarkslab.com/pixiefail-nine-vulnerabilities-in-tian=
ocores-edk-ii-ipv6-network-stack.html
> -diff --git a/NetworkPkg/TcpDxe/TcpDriver.c b/NetworkPkg/TcpDxe/TcpDriver=
.c
> -index 98a90e0210..8fe6badd68 100644
> ---- a/NetworkPkg/TcpDxe/TcpDriver.c
> -+++ b/NetworkPkg/TcpDxe/TcpDriver.c
> -@@ -2,7 +2,7 @@
> -   The driver binding and service binding protocol for the TCP driver.
> -
> -   Copyright (c) 2009 - 2018, Intel Corporation. All rights reserved.<BR=
>
> --
> -+  Copyright (c) Microsoft Corporation
> -   SPDX-License-Identifier: BSD-2-Clause-Patent
> -
> - **/
> -@@ -163,7 +163,13 @@ TcpDriverEntryPoint (
> -   )
> - {
> -   EFI_STATUS  Status;
> --  UINT32      Seed;
> -+  UINT32      Random;
> -+
> -+  Status =3D PseudoRandomU32 (&Random);
> -+  if (EFI_ERROR (Status)) {
> -+    DEBUG ((DEBUG_ERROR, "%a Failed to generate random number: %r\n", _=
_func__, Status));
> -+    return Status;
> -+  }
> -
> -   //
> -   // Install the TCP Driver Binding Protocol
> -@@ -203,9 +209,8 @@ TcpDriverEntryPoint (
> -   //
> -   // Initialize ISS and random port.
> -   //
> --  Seed            =3D NetRandomInitSeed ();
> --  mTcpGlobalIss   =3D NET_RANDOM (Seed) % mTcpGlobalIss;
> --  mTcp4RandomPort =3D (UINT16)(TCP_PORT_KNOWN + (NET_RANDOM (Seed) % TC=
P_PORT_KNOWN));
> -+  mTcpGlobalIss   =3D Random % mTcpGlobalIss;
> -+  mTcp4RandomPort =3D (UINT16)(TCP_PORT_KNOWN + (Random % TCP_PORT_KNOW=
N));
> -   mTcp6RandomPort =3D mTcp4RandomPort;
> -
> -   return EFI_SUCCESS;
> -diff --git a/NetworkPkg/TcpDxe/TcpDxe.inf b/NetworkPkg/TcpDxe/TcpDxe.inf
> -index c0acbdca57..cf5423f4c5 100644
> ---- a/NetworkPkg/TcpDxe/TcpDxe.inf
> -+++ b/NetworkPkg/TcpDxe/TcpDxe.inf
> -@@ -82,5 +82,8 @@
> -   gEfiTcp6ProtocolGuid                          ## BY_START
> -   gEfiTcp6ServiceBindingProtocolGuid            ## BY_START
> -
> -+[Depex]
> -+  gEfiHash2ServiceBindingProtocolGuid
> -+
> - [UserExtensions.TianoCore."ExtraFiles"]
> -   TcpDxeExtra.uni
> -diff --git a/NetworkPkg/Udp4Dxe/Udp4Driver.c b/NetworkPkg/Udp4Dxe/Udp4Dr=
iver.c
> -index cb917fcfc9..c7ea16f4cd 100644
> ---- a/NetworkPkg/Udp4Dxe/Udp4Driver.c
> -+++ b/NetworkPkg/Udp4Dxe/Udp4Driver.c
> -@@ -1,6 +1,7 @@
> - /** @file
> -
> - Copyright (c) 2006 - 2018, Intel Corporation. All rights reserved.<BR>
> -+Copyright (c) Microsoft Corporation
> - SPDX-License-Identifier: BSD-2-Clause-Patent
> -
> - **/
> -@@ -555,6 +556,13 @@ Udp4DriverEntryPoint (
> -   )
> - {
> -   EFI_STATUS  Status;
> -+  UINT32      Random;
> -+
> -+  Status =3D PseudoRandomU32 (&Random);
> -+  if (EFI_ERROR (Status)) {
> -+    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\n", _=
_func__, Status));
> -+    return Status;
> -+  }
> -
> -   //
> -   // Install the Udp4DriverBinding and Udp4ComponentName protocols.
> -@@ -571,7 +579,7 @@ Udp4DriverEntryPoint (
> -     //
> -     // Initialize the UDP random port.
> -     //
> --    mUdp4RandomPort =3D (UINT16)(((UINT16)NetRandomInitSeed ()) % UDP4_=
PORT_KNOWN + UDP4_PORT_KNOWN);
> -+    mUdp4RandomPort =3D (UINT16)(((UINT16)Random) % UDP4_PORT_KNOWN + U=
DP4_PORT_KNOWN);
> -   }
> -
> -   return Status;
> -diff --git a/NetworkPkg/Udp6Dxe/Udp6Driver.c b/NetworkPkg/Udp6Dxe/Udp6Dr=
iver.c
> -index ae96fb9966..edb758d57c 100644
> ---- a/NetworkPkg/Udp6Dxe/Udp6Driver.c
> -+++ b/NetworkPkg/Udp6Dxe/Udp6Driver.c
> -@@ -2,7 +2,7 @@
> -   Driver Binding functions and Service Binding functions for the Networ=
k driver module.
> -
> -   Copyright (c) 2009 - 2018, Intel Corporation. All rights reserved.<BR=
>
> --
> -+  Copyright (c) Microsoft Corporation
> -   SPDX-License-Identifier: BSD-2-Clause-Patent
> -
> - **/
> -@@ -596,6 +596,13 @@ Udp6DriverEntryPoint (
> -   )
> - {
> -   EFI_STATUS  Status;
> -+  UINT32      Random;
> -+
> -+  Status =3D PseudoRandomU32 (&Random);
> -+  if (EFI_ERROR (Status)) {
> -+    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\n", _=
_func__, Status));
> -+    return Status;
> -+  }
> -
> -   //
> -   // Install the Udp6DriverBinding and Udp6ComponentName protocols.
> -@@ -614,7 +621,7 @@ Udp6DriverEntryPoint (
> -     // Initialize the UDP random port.
> -     //
> -     mUdp6RandomPort =3D (UINT16)(
> --                               ((UINT16)NetRandomInitSeed ()) %
> -+                               ((UINT16)Random) %
> -                                UDP6_PORT_KNOWN +
> -                                UDP6_PORT_KNOWN
> -                                );
> -diff --git a/NetworkPkg/UefiPxeBcDxe/PxeBcDhcp4.c b/NetworkPkg/UefiPxeBc=
Dxe/PxeBcDhcp4.c
> -index 91146b78cb..452038c219 100644
> ---- a/NetworkPkg/UefiPxeBcDxe/PxeBcDhcp4.c
> -+++ b/NetworkPkg/UefiPxeBcDxe/PxeBcDhcp4.c
> -@@ -2,7 +2,7 @@
> -   Functions implementation related with DHCPv4 for UefiPxeBc Driver.
> -
> -   Copyright (c) 2009 - 2018, Intel Corporation. All rights reserved.<BR=
>
> --
> -+  Copyright (c) Microsoft Corporation
> -   SPDX-License-Identifier: BSD-2-Clause-Patent
> -
> - **/
> -@@ -1381,6 +1381,12 @@ PxeBcDhcp4Discover (
> -   UINT8                             VendorOptLen;
> -   UINT32                            Xid;
> -
> -+  Status =3D PseudoRandomU32 (&Xid);
> -+  if (EFI_ERROR (Status)) {
> -+    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\n", _=
_func__, Status));
> -+    return Status;
> -+  }
> -+
> -   Mode   =3D Private->PxeBc.Mode;
> -   Dhcp4  =3D Private->Dhcp4;
> -   Status =3D EFI_SUCCESS;
> -@@ -1471,7 +1477,6 @@ PxeBcDhcp4Discover (
> -   //
> -   // Set fields of the token for the request packet.
> -   //
> --  Xid                                 =3D NET_RANDOM (NetRandomInitSeed=
 ());
> -   Token.Packet->Dhcp4.Header.Xid      =3D HTONL (Xid);
> -   Token.Packet->Dhcp4.Header.Reserved =3D HTONS ((UINT16)((IsBCast) ? 0=
x8000 : 0x0));
> -   CopyMem (&Token.Packet->Dhcp4.Header.ClientAddr, &Private->StationIp,=
 sizeof (EFI_IPv4_ADDRESS));
> -diff --git a/NetworkPkg/UefiPxeBcDxe/PxeBcDhcp6.c b/NetworkPkg/UefiPxeBc=
Dxe/PxeBcDhcp6.c
> -index 7fd1281c11..bcabbd2219 100644
> ---- a/NetworkPkg/UefiPxeBcDxe/PxeBcDhcp6.c
> -+++ b/NetworkPkg/UefiPxeBcDxe/PxeBcDhcp6.c
> -@@ -2180,7 +2180,7 @@ PxeBcDhcp6Discover (
> -   UINTN                            ReadSize;
> -   UINT16                           OpCode;
> -   UINT16                           OpLen;
> --  UINT32                           Xid;
> -+  UINT32                           Random;
> -   EFI_STATUS                       Status;
> -   UINTN                            DiscoverLenNeeded;
> -
> -@@ -2198,6 +2198,12 @@ PxeBcDhcp6Discover (
> -     return EFI_DEVICE_ERROR;
> -   }
> -
> -+  Status =3D PseudoRandomU32 (&Random);
> -+  if (EFI_ERROR (Status)) {
> -+    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\n", _=
_func__, Status));
> -+    return Status;
> -+  }
> -+
> -   DiscoverLenNeeded =3D sizeof (EFI_PXE_BASE_CODE_DHCPV6_PACKET);
> -   Discover          =3D AllocateZeroPool (DiscoverLenNeeded);
> -   if (Discover =3D=3D NULL) {
> -@@ -2207,8 +2213,7 @@ PxeBcDhcp6Discover (
> -   //
> -   // Build the discover packet by the cached request packet before.
> -   //
> --  Xid                     =3D NET_RANDOM (NetRandomInitSeed ());
> --  Discover->TransactionId =3D HTONL (Xid);
> -+  Discover->TransactionId =3D HTONL (Random);
> -   Discover->MessageType   =3D Request->Dhcp6.Header.MessageType;
> -   RequestOpt              =3D Request->Dhcp6.Option;
> -   DiscoverOpt             =3D Discover->DhcpOptions;
> -diff --git a/NetworkPkg/UefiPxeBcDxe/PxeBcDriver.c b/NetworkPkg/UefiPxeB=
cDxe/PxeBcDriver.c
> -index d84aca7e85..4cd915b411 100644
> ---- a/NetworkPkg/UefiPxeBcDxe/PxeBcDriver.c
> -+++ b/NetworkPkg/UefiPxeBcDxe/PxeBcDriver.c
> -@@ -3,6 +3,7 @@
> -
> -   (C) Copyright 2014 Hewlett-Packard Development Company, L.P.<BR>
> -   Copyright (c) 2007 - 2019, Intel Corporation. All rights reserved.<BR=
>
> -+  Copyright (c) Microsoft Corporation
> -
> -   SPDX-License-Identifier: BSD-2-Clause-Patent
> -
> -@@ -892,6 +893,13 @@ PxeBcCreateIp6Children (
> -   PXEBC_PRIVATE_PROTOCOL       *Id;
> -   EFI_SIMPLE_NETWORK_PROTOCOL  *Snp;
> -   UINTN                        Index;
> -+  UINT32                       Random;
> -+
> -+  Status =3D PseudoRandomU32 (&Random);
> -+  if (EFI_ERROR (Status)) {
> -+    DEBUG ((DEBUG_ERROR, "Failed to generate random number using EFI_RN=
G_PROTOCOL: %r\n", Status));
> -+    return Status;
> -+  }
> -
> -   if (Private->Ip6Nic !=3D NULL) {
> -     //
> -@@ -935,9 +943,9 @@ PxeBcCreateIp6Children (
> -   }
> -
> -   //
> --  // Generate a random IAID for the Dhcp6 assigned address.
> -+  // Set a random IAID for the Dhcp6 assigned address.
> -   //
> --  Private->IaId =3D NET_RANDOM (NetRandomInitSeed ());
> -+  Private->IaId =3D Random;
> -   if (Private->Snp !=3D NULL) {
> -     for (Index =3D 0; Index < Private->Snp->Mode->HwAddressSize; Index+=
+) {
> -       Private->IaId |=3D (Private->Snp->Mode->CurrentAddress.Addr[Index=
] << ((Index << 3) & 31));
> ---
> -2.40.0
> -
> diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/=
ovmf_git.bb
> index d52e3f4971..bb345688ac 100644
> --- a/meta/recipes-core/ovmf/ovmf_git.bb
> +++ b/meta/recipes-core/ovmf/ovmf_git.bb
> @@ -47,8 +47,6 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;bran=
ch=3Dmaster;protocol=3Dhttps \
>             file://CVE-2023-45229-0002.patch \
>             file://CVE-2023-45229-0003.patch \
>             file://CVE-2023-45229-0004.patch \
> -           file://CVE-2023-45237-0001.patch \
> -           file://CVE-2023-45237-0002.patch \
>             file://CVE-2023-45236.patch \
>             file://CVE-2022-36765-0001.patch \
>             file://CVE-2022-36765-0002.patch \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#211699): https://lists.openembedded.org/g/openembedde=
d-core/message/211699
> Mute This Topic: https://lists.openembedded.org/mt/111267276/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

