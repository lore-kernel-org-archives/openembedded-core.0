Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3792EE77170
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 17:54:25 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.21182.1733334862166461119
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 09:54:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hOuhe/Hf;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7fc22a88bcbso43679a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 09:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733334861; x=1733939661; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g4iaqnpuiIhDmYl6dKEVKaKRPvGQqr8a1Jxzfc66EDc=;
        b=hOuhe/HfKOTg1XhbL6c/i2Jx/DYJkKn6CG6n8sV6BOzlCuKiat0H0YrBD+4l+LyeKI
         OE9x97KN5xEAJjRiVfa8hf/ycbXiexY3zFqrJIy9dTUuJHU1eFgBGINSMzlNGObMAT7h
         dudmu7NkMKk3EmhzX6PK3u5rff0ktJs5rxsLGw5SAI7rhvuVSAP1uzzz5P3cTeoca/8f
         ddKnwRxKkvft8ivc5wUqaV1PUbyITaqxKchu+7F1+N8LpWZRCW7nlY6SQcEESJhlFeWd
         hfdPTqYRXc7ktK4cI7im3fU4F9IJr3jVjD2SDXKxkhrF0x2mdnT0vKH7OYtrPimpr5em
         IKLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733334861; x=1733939661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g4iaqnpuiIhDmYl6dKEVKaKRPvGQqr8a1Jxzfc66EDc=;
        b=IiVORn6cmIw5nBc3Djyr3F0yBqi1719OdkSk0BkYyBBjOKKNjd8U5oScnjASMRdLZj
         bkYQdf+gbSc2MESgfhbPTVNL5rc3HsimKmGlBL9sj/yCEWd+EgH5tG9qNzgfFD+2AGKM
         zfNHeqffw5GUQY/ZcRmmkQaWHmwhDFFzzYoFepSz/2oMk1azjNl5+3wfRGsSv0hAXNDK
         QFd3eMrgXyEwgdRk+ZiINbcBLndIMI9hWW1RbXrOx3pA5oq3ITuUMRQOJRERH2FQS1Jv
         NrDtUeP2hIVL7PiZ5v3SOwvqkDD6MQO8UbSQ5cnRp25VG7rZM9ksL6HFPLKHDgkN1UKN
         rfAA==
X-Gm-Message-State: AOJu0YyEGjYyTrDMc+lf3D34fNioQilUKFw/Zm/US2fQwzZboMUh3xxb
	TJeEnZWT32VtMe7x/ixmgnSZGbs6t+2fJBXDlPpp1ztg2K3+QT020UyNjlByOH7q3DI47871DE8
	V
X-Gm-Gg: ASbGnctAOi6i7x8iq3s3y77iJLHsZtGVHwSqCd2fkaL+qrgTudvOYGpO49/krdSEucw
	x4GaDqPvssNtK0PR4ZkMdPP5tpHkPVBtRO+6H5jWBWzir8zGcT8Eva+tZ/WkkUY3fXNTSQSP/eS
	rHO3RDR1G7vkstY4s5dnlfFQVgrZtthoY/H3OJWEwHdm0HrSwjL2gAUowehgoXVuvPHnElOBbd4
	tKSyYGDBGUXWTRX5daifCjO4Qri7Zg0ds1QFQE=
X-Google-Smtp-Source: AGHT+IFVy5ZsipYT2gLzFqR3Ik+Wz+AxJGJ3Obew+Fcz/IRzqqzCSrV9QzrT7SHzAlD0WBLw6/f5fw==
X-Received: by 2002:a05:6a21:7789:b0:1e1:6ef2:fbe3 with SMTP id adf61e73a8af0-1e16ef300e5mr4829240637.5.1733334859648;
        Wed, 04 Dec 2024 09:54:19 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c2d5af1sm11727765a12.16.2024.12.04.09.54.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 09:54:19 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/38] ovmf: Fix CVE-2023-45230
Date: Wed,  4 Dec 2024 09:53:30 -0800
Message-Id: <50b50174f057a9a5fb9773e67b4f183ae942ff10.1733334655.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733334655.git.steve@sakoman.com>
References: <cover.1733334655.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 17:54:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208286

From: Soumya Sambu <soumya.sambu@windriver.com>

EDK2's Network Package is susceptible to a buffer overflow vulnerability
via a long server ID option in DHCPv6 client. This vulnerability can be
exploited by an attacker to gain unauthorized access and potentially lead
to a loss of Confidentiality, Integrity and/or Availability.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-45230

Upstream-patches:
https://github.com/tianocore/edk2/commit/f31453e8d6542461d92d835e0b79fec8b0=
39174d
https://github.com/tianocore/edk2/commit/5f3658197bf29c83b3349b0ab1d99cdb0c=
3814bc

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../ovmf/ovmf/CVE-2023-45230-0001.patch       | 1617 +++++++++++++++++
 .../ovmf/ovmf/CVE-2023-45230-0002.patch       |  604 ++++++
 meta/recipes-core/ovmf/ovmf_git.bb            |    2 +
 3 files changed, 2223 insertions(+)
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2023-45230-0001.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2023-45230-0002.patch

diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2023-45230-0001.patch b/meta/r=
ecipes-core/ovmf/ovmf/CVE-2023-45230-0001.patch
new file mode 100644
index 0000000000..b0e13c1613
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/CVE-2023-45230-0001.patch
@@ -0,0 +1,1617 @@
+From f31453e8d6542461d92d835e0b79fec8b039174d Mon Sep 17 00:00:00 2001
+From: "Doug Flick via groups.io" <dougflick=3Dmicrosoft.com@groups.io>
+Date: Fri, 26 Jan 2024 05:54:43 +0800
+Subject: [PATCH] NetworkPkg: Dhcp6Dxe: SECURITY PATCH CVE-2023-45230 Patch
+
+REF:https://bugzilla.tianocore.org/show_bug.cgi?id=3D4535
+
+Bug Details:
+PixieFail Bug #2
+CVE-2023-45230
+CVSS 8.3 : CVSS:3.1/AV:A/AC:L/PR:N/UI:N/S:U/C:H/I:L/A:H
+CWE-119 Improper Restriction of Operations within the Bounds
+ of a Memory Buffer
+
+Changes Overview:
+> -UINT8 *
+> +EFI_STATUS
+>  Dhcp6AppendOption (
+> -  IN OUT UINT8   *Buf,
+> -  IN     UINT16  OptType,
+> -  IN     UINT16  OptLen,
+> -  IN     UINT8   *Data
+> +  IN OUT EFI_DHCP6_PACKET  *Packet,
+> +  IN OUT UINT8             **PacketCursor,
+> +  IN     UINT16            OptType,
+> +  IN     UINT16            OptLen,
+> +  IN     UINT8             *Data
+>    );
+
+Dhcp6AppendOption() and variants can return errors now.  All callsites
+are adapted accordingly.
+
+It gets passed in EFI_DHCP6_PACKET as additional parameter ...
+
+> +  //
+> +  // Verify the PacketCursor is within the packet
+> +  //
+> +  if (  (*PacketCursor < Packet->Dhcp6.Option)
+> +     || (*PacketCursor >=3D Packet->Dhcp6.Option +
+ (Packet->Size - sizeof (EFI_DHCP6_HEADER))))
+> +  {
+> +    return EFI_INVALID_PARAMETER;
+> +  }
+
+... so it can look at Packet->Size when checking buffer space.
+Also to allow Packet->Length updates.
+
+Lots of checks added.
+
+Cc: Saloni Kasbekar <saloni.kasbekar@intel.com>
+Cc: Zachary Clark-williams <zachary.clark-williams@intel.com>
+
+Signed-off-by: Doug Flick [MSFT] <doug.edk2@gmail.com>
+Reviewed-by: Saloni Kasbekar <saloni.kasbekar@intel.com>
+
+CVE: CVE-2023-45230
+
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/f31453=
e8d6542461d92d835e0b79fec8b039174d]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ NetworkPkg/Dhcp6Dxe/Dhcp6Impl.h    |  43 +++
+ NetworkPkg/Dhcp6Dxe/Dhcp6Io.c      | 409 +++++++++++++++++++----------
+ NetworkPkg/Dhcp6Dxe/Dhcp6Utility.c | 373 +++++++++++++++++++++-----
+ NetworkPkg/Dhcp6Dxe/Dhcp6Utility.h |  82 +++---
+ 4 files changed, 668 insertions(+), 239 deletions(-)
+
+diff --git a/NetworkPkg/Dhcp6Dxe/Dhcp6Impl.h b/NetworkPkg/Dhcp6Dxe/Dhcp6Im=
pl.h
+index 0eb9c669b5..f2422c2f28 100644
+--- a/NetworkPkg/Dhcp6Dxe/Dhcp6Impl.h
++++ b/NetworkPkg/Dhcp6Dxe/Dhcp6Impl.h
+@@ -45,6 +45,49 @@ typedef struct _DHCP6_INSTANCE  DHCP6_INSTANCE;
+ #define DHCP6_SERVICE_SIGNATURE   SIGNATURE_32 ('D', 'H', '6', 'S')=0D
+ #define DHCP6_INSTANCE_SIGNATURE  SIGNATURE_32 ('D', 'H', '6', 'I')=0D
+ =0D
++//=0D
++// For more information on DHCP options see RFC 8415, Section 21.1=0D
++//=0D
++// The format of DHCP options is:=0D
++//=0D
++//     0                   1                   2                   3=0D
++//     0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1=0D
++//    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+=0D
++//    |          option-code          |           option-len          |=0D
++//    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+=0D
++//    |                          option-data                          |=0D
++//    |                      (option-len octets)                      |=0D
++//    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+=0D
++//=0D
++#define DHCP6_SIZE_OF_OPT_CODE  (sizeof(UINT16))=0D
++#define DHCP6_SIZE_OF_OPT_LEN   (sizeof(UINT16))=0D
++=0D
++//=0D
++// Combined size of Code and Length=0D
++//=0D
++#define DHCP6_SIZE_OF_COMBINED_CODE_AND_LEN  (DHCP6_SIZE_OF_OPT_CODE + \=
=0D
++                                              DHCP6_SIZE_OF_OPT_LEN)=0D
++=0D
++STATIC_ASSERT (=0D
++  DHCP6_SIZE_OF_COMBINED_CODE_AND_LEN =3D=3D 4,=0D
++  "Combined size of Code and Length must be 4 per RFC 8415"=0D
++  );=0D
++=0D
++//=0D
++// Offset to the length is just past the code=0D
++//=0D
++#define DHCP6_OPT_LEN_OFFSET(a)  (a + DHCP6_SIZE_OF_OPT_CODE)=0D
++STATIC_ASSERT (=0D
++  DHCP6_OPT_LEN_OFFSET (0) =3D=3D 2,=0D
++  "Offset of length is + 2 past start of option"=0D
++  );=0D
++=0D
++#define DHCP6_OPT_DATA_OFFSET(a)  (a + DHCP6_SIZE_OF_COMBINED_CODE_AND_LE=
N)=0D
++STATIC_ASSERT (=0D
++  DHCP6_OPT_DATA_OFFSET (0) =3D=3D 4,=0D
++  "Offset to option data should be +4 from start of option"=0D
++  );=0D
++=0D
+ #define DHCP6_PACKET_ALL        0=0D
+ #define DHCP6_PACKET_STATEFUL   1=0D
+ #define DHCP6_PACKET_STATELESS  2=0D
+diff --git a/NetworkPkg/Dhcp6Dxe/Dhcp6Io.c b/NetworkPkg/Dhcp6Dxe/Dhcp6Io.c
+index dcd01e6268..bf5aa7a769 100644
+--- a/NetworkPkg/Dhcp6Dxe/Dhcp6Io.c
++++ b/NetworkPkg/Dhcp6Dxe/Dhcp6Io.c
+@@ -3,9 +3,9 @@
+ =0D
+   (C) Copyright 2014 Hewlett-Packard Development Company, L.P.<BR>=0D
+   Copyright (c) 2009 - 2018, Intel Corporation. All rights reserved.<BR>=
=0D
++  Copyright (c) Microsoft Corporation=0D
+ =0D
+   SPDX-License-Identifier: BSD-2-Clause-Patent=0D
+-=0D
+ **/=0D
+ =0D
+ #include "Dhcp6Impl.h"=0D
+@@ -930,7 +930,8 @@ Dhcp6SendSolicitMsg   (
+   //=0D
+   Packet =3D AllocateZeroPool (DHCP6_BASE_PACKET_SIZE + UserLen);=0D
+   if (Packet =3D=3D NULL) {=0D
+-    return EFI_OUT_OF_RESOURCES;=0D
++    Status =3D EFI_OUT_OF_RESOURCES;=0D
++    goto ON_ERROR;=0D
+   }=0D
+ =0D
+   Packet->Size                       =3D DHCP6_BASE_PACKET_SIZE + UserLen=
;=0D
+@@ -944,54 +945,64 @@ Dhcp6SendSolicitMsg   (
+   Cursor =3D Packet->Dhcp6.Option;=0D
+ =0D
+   Length =3D HTONS (ClientId->Length);=0D
+-  Cursor =3D Dhcp6AppendOption (=0D
+-             Cursor,=0D
++  Status =3D Dhcp6AppendOption (=0D
++             Packet,=0D
++             &Cursor,=0D
+              HTONS (Dhcp6OptClientId),=0D
+              Length,=0D
+              ClientId->Duid=0D
+              );=0D
++  if (EFI_ERROR (Status)) {=0D
++    goto ON_ERROR;=0D
++  }=0D
+ =0D
+-  Cursor =3D Dhcp6AppendETOption (=0D
+-             Cursor,=0D
++  Status =3D Dhcp6AppendETOption (=0D
++             Packet,=0D
++             &Cursor,=0D
+              Instance,=0D
+              &Elapsed=0D
+              );=0D
++  if (EFI_ERROR (Status)) {=0D
++    goto ON_ERROR;=0D
++  }=0D
+ =0D
+-  Cursor =3D Dhcp6AppendIaOption (=0D
+-             Cursor,=0D
++  Status =3D Dhcp6AppendIaOption (=0D
++             Packet,=0D
++             &Cursor,=0D
+              Instance->IaCb.Ia,=0D
+              Instance->IaCb.T1,=0D
+              Instance->IaCb.T2,=0D
+              Packet->Dhcp6.Header.MessageType=0D
+              );=0D
++  if (EFI_ERROR (Status)) {=0D
++    goto ON_ERROR;=0D
++  }=0D
+ =0D
+   //=0D
+   // Append user-defined when configurate Dhcp6 service.=0D
+   //=0D
+   for (Index =3D 0; Index < Instance->Config->OptionCount; Index++) {=0D
+     UserOpt =3D Instance->Config->OptionList[Index];=0D
+-    Cursor  =3D Dhcp6AppendOption (=0D
+-                Cursor,=0D
++    Status  =3D Dhcp6AppendOption (=0D
++                Packet,=0D
++                &Cursor,=0D
+                 UserOpt->OpCode,=0D
+                 UserOpt->OpLen,=0D
+                 UserOpt->Data=0D
+                 );=0D
++    if (EFI_ERROR (Status)) {=0D
++      goto ON_ERROR;=0D
++    }=0D
+   }=0D
+ =0D
+-  //=0D
+-  // Determine the size/length of packet.=0D
+-  //=0D
+-  Packet->Length +=3D (UINT32)(Cursor - Packet->Dhcp6.Option);=0D
+   ASSERT (Packet->Size > Packet->Length + 8);=0D
+ =0D
+   //=0D
+   // Callback to user with the packet to be sent and check the user's fee=
dback.=0D
+   //=0D
+   Status =3D Dhcp6CallbackUser (Instance, Dhcp6SendSolicit, &Packet);=0D
+-=0D
+   if (EFI_ERROR (Status)) {=0D
+-    FreePool (Packet);=0D
+-    return Status;=0D
++    goto ON_ERROR;=0D
+   }=0D
+ =0D
+   //=0D
+@@ -1005,10 +1016,8 @@ Dhcp6SendSolicitMsg   (
+   Instance->StartTime =3D 0;=0D
+ =0D
+   Status =3D Dhcp6TransmitPacket (Instance, Packet, Elapsed);=0D
+-=0D
+   if (EFI_ERROR (Status)) {=0D
+-    FreePool (Packet);=0D
+-    return Status;=0D
++    goto ON_ERROR;=0D
+   }=0D
+ =0D
+   //=0D
+@@ -1020,6 +1029,14 @@ Dhcp6SendSolicitMsg   (
+            Elapsed,=0D
+            Instance->Config->SolicitRetransmission=0D
+            );=0D
++=0D
++ON_ERROR:=0D
++=0D
++  if (Packet) {=0D
++    FreePool (Packet);=0D
++  }=0D
++=0D
++  return Status;=0D
+ }=0D
+ =0D
+ /**=0D
+@@ -1110,7 +1127,8 @@ Dhcp6SendRequestMsg (
+   //=0D
+   Packet =3D AllocateZeroPool (DHCP6_BASE_PACKET_SIZE + UserLen);=0D
+   if (Packet =3D=3D NULL) {=0D
+-    return EFI_OUT_OF_RESOURCES;=0D
++    Status =3D EFI_OUT_OF_RESOURCES;=0D
++    goto ON_ERROR;=0D
+   }=0D
+ =0D
+   Packet->Size                       =3D DHCP6_BASE_PACKET_SIZE + UserLen=
;=0D
+@@ -1124,51 +1142,67 @@ Dhcp6SendRequestMsg (
+   Cursor =3D Packet->Dhcp6.Option;=0D
+ =0D
+   Length =3D HTONS (ClientId->Length);=0D
+-  Cursor =3D Dhcp6AppendOption (=0D
+-             Cursor,=0D
++  Status =3D Dhcp6AppendOption (=0D
++             Packet,=0D
++             &Cursor,=0D
+              HTONS (Dhcp6OptClientId),=0D
+              Length,=0D
+              ClientId->Duid=0D
+              );=0D
++  if (EFI_ERROR (Status)) {=0D
++    goto ON_ERROR;=0D
++  }=0D
+ =0D
+-  Cursor =3D Dhcp6AppendETOption (=0D
+-             Cursor,=0D
++  Status =3D Dhcp6AppendETOption (=0D
++             Packet,=0D
++             &Cursor,=0D
+              Instance,=0D
+              &Elapsed=0D
+              );=0D
++  if (EFI_ERROR (Status)) {=0D
++    goto ON_ERROR;=0D
++  }=0D
+ =0D
+-  Cursor =3D Dhcp6AppendOption (=0D
+-             Cursor,=0D
++  Status =3D Dhcp6AppendOption (=0D
++             Packet,=0D
++             &Cursor,=0D
+              HTONS (Dhcp6OptServerId),=0D
+              ServerId->Length,=0D
+              ServerId->Duid=0D
+              );=0D
++  if (EFI_ERROR (Status)) {=0D
++    goto ON_ERROR;=0D
++  }=0D
+ =0D
+-  Cursor =3D Dhcp6AppendIaOption (=0D
+-             Cursor,=0D
++  Status =3D Dhcp6AppendIaOption (=0D
++             Packet,=0D
++             &Cursor,=0D
+              Instance->IaCb.Ia,=0D
+              Instance->IaCb.T1,=0D
+              Instance->IaCb.T2,=0D
+              Packet->Dhcp6.Header.MessageType=0D
+              );=0D
++  if (EFI_ERROR (Status)) {=0D
++    goto ON_ERROR;=0D
++  }=0D
+ =0D
+   //=0D
+   // Append user-defined when configurate Dhcp6 service.=0D
+   //=0D
+   for (Index =3D 0; Index < Instance->Config->OptionCount; Index++) {=0D
+     UserOpt =3D Instance->Config->OptionList[Index];=0D
+-    Cursor  =3D Dhcp6AppendOption (=0D
+-                Cursor,=0D
++    Status  =3D Dhcp6AppendOption (=0D
++                Packet,=0D
++                &Cursor,=0D
+                 UserOpt->OpCode,=0D
+                 UserOpt->OpLen,=0D
+                 UserOpt->Data=0D
+                 );=0D
++    if (EFI_ERROR (Status)) {=0D
++      goto ON_ERROR;=0D
++    }=0D
+   }=0D
+ =0D
+-  //=0D
+-  // Determine the size/length of packet.=0D
+-  //=0D
+-  Packet->Length +=3D (UINT32)(Cursor - Packet->Dhcp6.Option);=0D
+   ASSERT (Packet->Size > Packet->Length + 8);=0D
+ =0D
+   //=0D
+@@ -1177,8 +1211,7 @@ Dhcp6SendRequestMsg (
+   Status =3D Dhcp6CallbackUser (Instance, Dhcp6SendRequest, &Packet);=0D
+ =0D
+   if (EFI_ERROR (Status)) {=0D
+-    FreePool (Packet);=0D
+-    return Status;=0D
++    goto ON_ERROR;=0D
+   }=0D
+ =0D
+   //=0D
+@@ -1194,14 +1227,21 @@ Dhcp6SendRequestMsg (
+   Status =3D Dhcp6TransmitPacket (Instance, Packet, Elapsed);=0D
+ =0D
+   if (EFI_ERROR (Status)) {=0D
+-    FreePool (Packet);=0D
+-    return Status;=0D
++    goto ON_ERROR;=0D
+   }=0D
+ =0D
+   //=0D
+   // Enqueue the sent packet for the retransmission in case reply timeout=
.=0D
+   //=0D
+   return Dhcp6EnqueueRetry (Instance, Packet, Elapsed, NULL);=0D
++=0D
++ON_ERROR:=0D
++=0D
++  if (Packet) {=0D
++    FreePool (Packet);=0D
++  }=0D
++=0D
++  return Status;=0D
+ }=0D
+ =0D
+ /**=0D
+@@ -1266,7 +1306,8 @@ Dhcp6SendDeclineMsg (
+   //=0D
+   Packet =3D AllocateZeroPool (DHCP6_BASE_PACKET_SIZE);=0D
+   if (Packet =3D=3D NULL) {=0D
+-    return EFI_OUT_OF_RESOURCES;=0D
++    Status =3D EFI_OUT_OF_RESOURCES;=0D
++    goto ON_ERROR;=0D
+   }=0D
+ =0D
+   Packet->Size                       =3D DHCP6_BASE_PACKET_SIZE;=0D
+@@ -1280,42 +1321,58 @@ Dhcp6SendDeclineMsg (
+   Cursor =3D Packet->Dhcp6.Option;=0D
+ =0D
+   Length =3D HTONS (ClientId->Length);=0D
+-  Cursor =3D Dhcp6AppendOption (=0D
+-             Cursor,=0D
++  Status =3D Dhcp6AppendOption (=0D
++             Packet,=0D
++             &Cursor,=0D
+              HTONS (Dhcp6OptClientId),=0D
+              Length,=0D
+              ClientId->Duid=0D
+              );=0D
++  if (EFI_ERROR (Status)) {=0D
++    goto ON_ERROR;=0D
++  }=0D
+ =0D
+-  Cursor =3D Dhcp6AppendETOption (=0D
+-             Cursor,=0D
++  Status =3D Dhcp6AppendETOption (=0D
++             Packet,=0D
++             &Cursor,=0D
+              Instance,=0D
+              &Elapsed=0D
+              );=0D
++  if (EFI_ERROR (Status)) {=0D
++    goto ON_ERROR;=0D
++  }=0D
+ =0D
+-  Cursor =3D Dhcp6AppendOption (=0D
+-             Cursor,=0D
++  Status =3D Dhcp6AppendOption (=0D
++             Packet,=0D
++             &Cursor,=0D
+              HTONS (Dhcp6OptServerId),=0D
+              ServerId->Length,=0D
+              ServerId->Duid=0D
+              );=0D
++  if (EFI_ERROR (Status)) {=0D
++    goto ON_ERROR;=0D
++  }=0D
+ =0D
+-  Cursor =3D Dhcp6AppendIaOption (Cursor, DecIa, 0, 0, Packet->Dhcp6.Head=
er.MessageType);=0D
++  Status =3D Dhcp6AppendIaOption (=0D
++             Packet,=0D
++             &Cursor,=0D
++             DecIa,=0D
++             0,=0D
++             0,=0D
++             Packet->Dhcp6.Header.MessageType=0D
++             );=0D
++  if (EFI_ERROR (Status)) {=0D
++    goto ON_ERROR;=0D
++  }=0D
+ =0D
+-  //=0D
+-  // Determine the size/length of packet.=0D
+-  //=0D
+-  Packet->Length +=3D (UINT32)(Cursor - Packet->Dhcp6.Option);=0D
+   ASSERT (Packet->Size > Packet->Length + 8);=0D
+ =0D
+   //=0D
+   // Callback to user with the packet to be sent and check the user's fee=
dback.=0D
+   //=0D
+   Status =3D Dhcp6CallbackUser (Instance, Dhcp6SendDecline, &Packet);=0D
+-=0D
+   if (EFI_ERROR (Status)) {=0D
+-    FreePool (Packet);=0D
+-    return Status;=0D
++    goto ON_ERROR;=0D
+   }=0D
+ =0D
+   //=0D
+@@ -1329,16 +1386,22 @@ Dhcp6SendDeclineMsg (
+   Instance->StartTime =3D 0;=0D
+ =0D
+   Status =3D Dhcp6TransmitPacket (Instance, Packet, Elapsed);=0D
+-=0D
+   if (EFI_ERROR (Status)) {=0D
+-    FreePool (Packet);=0D
+-    return Status;=0D
++    goto ON_ERROR;=0D
+   }=0D
+ =0D
+   //=0D
+   // Enqueue the sent packet for the retransmission in case reply timeout=
.=0D
+   //=0D
+   return Dhcp6EnqueueRetry (Instance, Packet, Elapsed, NULL);=0D
++=0D
++ON_ERROR:=0D
++=0D
++  if (Packet) {=0D
++    FreePool (Packet);=0D
++  }=0D
++=0D
++  return Status;=0D
+ }=0D
+ =0D
+ /**=0D
+@@ -1399,7 +1462,8 @@ Dhcp6SendReleaseMsg (
+   //=0D
+   Packet =3D AllocateZeroPool (DHCP6_BASE_PACKET_SIZE);=0D
+   if (Packet =3D=3D NULL) {=0D
+-    return EFI_OUT_OF_RESOURCES;=0D
++    Status =3D EFI_OUT_OF_RESOURCES;=0D
++    goto ON_ERROR;=0D
+   }=0D
+ =0D
+   Packet->Size                       =3D DHCP6_BASE_PACKET_SIZE;=0D
+@@ -1413,45 +1477,61 @@ Dhcp6SendReleaseMsg (
+   Cursor =3D Packet->Dhcp6.Option;=0D
+ =0D
+   Length =3D HTONS (ClientId->Length);=0D
+-  Cursor =3D Dhcp6AppendOption (=0D
+-             Cursor,=0D
++  Status =3D Dhcp6AppendOption (=0D
++             Packet,=0D
++             &Cursor,=0D
+              HTONS (Dhcp6OptClientId),=0D
+              Length,=0D
+              ClientId->Duid=0D
+              );=0D
++  if (EFI_ERROR (Status)) {=0D
++    goto ON_ERROR;=0D
++  }=0D
+ =0D
+   //=0D
+   // ServerId is extracted from packet, it's network order.=0D
+   //=0D
+-  Cursor =3D Dhcp6AppendOption (=0D
+-             Cursor,=0D
++  Status =3D Dhcp6AppendOption (=0D
++             Packet,=0D
++             &Cursor,=0D
+              HTONS (Dhcp6OptServerId),=0D
+              ServerId->Length,=0D
+              ServerId->Duid=0D
+              );=0D
++  if (EFI_ERROR (Status)) {=0D
++    goto ON_ERROR;=0D
++  }=0D
+ =0D
+-  Cursor =3D Dhcp6AppendETOption (=0D
+-             Cursor,=0D
++  Status =3D Dhcp6AppendETOption (=0D
++             Packet,=0D
++             &Cursor,=0D
+              Instance,=0D
+              &Elapsed=0D
+              );=0D
++  if (EFI_ERROR (Status)) {=0D
++    goto ON_ERROR;=0D
++  }=0D
+ =0D
+-  Cursor =3D Dhcp6AppendIaOption (Cursor, RelIa, 0, 0, Packet->Dhcp6.Head=
er.MessageType);=0D
++  Status =3D Dhcp6AppendIaOption (=0D
++             Packet,=0D
++             &Cursor,=0D
++             RelIa,=0D
++             0,=0D
++             0,=0D
++             Packet->Dhcp6.Header.MessageType=0D
++             );=0D
++  if (EFI_ERROR (Status)) {=0D
++    goto ON_ERROR;=0D
++  }=0D
+ =0D
+-  //=0D
+-  // Determine the size/length of packet=0D
+-  //=0D
+-  Packet->Length +=3D (UINT32)(Cursor - Packet->Dhcp6.Option);=0D
+   ASSERT (Packet->Size > Packet->Length + 8);=0D
+ =0D
+   //=0D
+   // Callback to user with the packet to be sent and check the user's fee=
dback.=0D
+   //=0D
+   Status =3D Dhcp6CallbackUser (Instance, Dhcp6SendRelease, &Packet);=0D
+-=0D
+   if (EFI_ERROR (Status)) {=0D
+-    FreePool (Packet);=0D
+-    return Status;=0D
++    goto ON_ERROR;=0D
+   }=0D
+ =0D
+   //=0D
+@@ -1461,16 +1541,22 @@ Dhcp6SendReleaseMsg (
+   Instance->IaCb.Ia->State =3D Dhcp6Releasing;=0D
+ =0D
+   Status =3D Dhcp6TransmitPacket (Instance, Packet, Elapsed);=0D
+-=0D
+   if (EFI_ERROR (Status)) {=0D
+-    FreePool (Packet);=0D
+-    return Status;=0D
++    goto ON_ERROR;=0D
+   }=0D
+ =0D
+   //=0D
+   // Enqueue the sent packet for the retransmission in case reply timeout=
.=0D
+   //=0D
+   return Dhcp6EnqueueRetry (Instance, Packet, Elapsed, NULL);=0D
++=0D
++ON_ERROR:=0D
++=0D
++  if (Packet) {=0D
++    FreePool (Packet);=0D
++  }=0D
++=0D
++  return Status;=0D
+ }=0D
+ =0D
+ /**=0D
+@@ -1529,7 +1615,8 @@ Dhcp6SendRenewRebindMsg (
+   //=0D
+   Packet =3D AllocateZeroPool (DHCP6_BASE_PACKET_SIZE + UserLen);=0D
+   if (Packet =3D=3D NULL) {=0D
+-    return EFI_OUT_OF_RESOURCES;=0D
++    Status =3D EFI_OUT_OF_RESOURCES;=0D
++    goto ON_ERROR;=0D
+   }=0D
+ =0D
+   Packet->Size                       =3D DHCP6_BASE_PACKET_SIZE + UserLen=
;=0D
+@@ -1543,26 +1630,38 @@ Dhcp6SendRenewRebindMsg (
+   Cursor =3D Packet->Dhcp6.Option;=0D
+ =0D
+   Length =3D HTONS (ClientId->Length);=0D
+-  Cursor =3D Dhcp6AppendOption (=0D
+-             Cursor,=0D
++  Status =3D Dhcp6AppendOption (=0D
++             Packet,=0D
++             &Cursor,=0D
+              HTONS (Dhcp6OptClientId),=0D
+              Length,=0D
+              ClientId->Duid=0D
+              );=0D
++  if (EFI_ERROR (Status)) {=0D
++    goto ON_ERROR;=0D
++  }=0D
+ =0D
+-  Cursor =3D Dhcp6AppendETOption (=0D
+-             Cursor,=0D
++  Status =3D Dhcp6AppendETOption (=0D
++             Packet,=0D
++             &Cursor,=0D
+              Instance,=0D
+              &Elapsed=0D
+              );=0D
++  if (EFI_ERROR (Status)) {=0D
++    goto ON_ERROR;=0D
++  }=0D
+ =0D
+-  Cursor =3D Dhcp6AppendIaOption (=0D
+-             Cursor,=0D
++  Status =3D Dhcp6AppendIaOption (=0D
++             Packet,=0D
++             &Cursor,=0D
+              Instance->IaCb.Ia,=0D
+              Instance->IaCb.T1,=0D
+              Instance->IaCb.T2,=0D
+              Packet->Dhcp6.Header.MessageType=0D
+              );=0D
++  if (EFI_ERROR (Status)) {=0D
++    goto ON_ERROR;=0D
++  }=0D
+ =0D
+   if (!RebindRequest) {=0D
+     //=0D
+@@ -1578,18 +1677,22 @@ Dhcp6SendRenewRebindMsg (
+                Dhcp6OptServerId=0D
+                );=0D
+     if (Option =3D=3D NULL) {=0D
+-      FreePool (Packet);=0D
+-      return EFI_DEVICE_ERROR;=0D
++      Status =3D EFI_DEVICE_ERROR;=0D
++      goto ON_ERROR;=0D
+     }=0D
+ =0D
+     ServerId =3D (EFI_DHCP6_DUID *)(Option + 2);=0D
+ =0D
+-    Cursor =3D Dhcp6AppendOption (=0D
+-               Cursor,=0D
++    Status =3D Dhcp6AppendOption (=0D
++               Packet,=0D
++               &Cursor,=0D
+                HTONS (Dhcp6OptServerId),=0D
+                ServerId->Length,=0D
+                ServerId->Duid=0D
+                );=0D
++    if (EFI_ERROR (Status)) {=0D
++      goto ON_ERROR;=0D
++    }=0D
+   }=0D
+ =0D
+   //=0D
+@@ -1597,18 +1700,18 @@ Dhcp6SendRenewRebindMsg (
+   //=0D
+   for (Index =3D 0; Index < Instance->Config->OptionCount; Index++) {=0D
+     UserOpt =3D Instance->Config->OptionList[Index];=0D
+-    Cursor  =3D Dhcp6AppendOption (=0D
+-                Cursor,=0D
++    Status  =3D Dhcp6AppendOption (=0D
++                Packet,=0D
++                &Cursor,=0D
+                 UserOpt->OpCode,=0D
+                 UserOpt->OpLen,=0D
+                 UserOpt->Data=0D
+                 );=0D
++    if (EFI_ERROR (Status)) {=0D
++      goto ON_ERROR;=0D
++    }=0D
+   }=0D
+ =0D
+-  //=0D
+-  // Determine the size/length of packet.=0D
+-  //=0D
+-  Packet->Length +=3D (UINT32)(Cursor - Packet->Dhcp6.Option);=0D
+   ASSERT (Packet->Size > Packet->Length + 8);=0D
+ =0D
+   //=0D
+@@ -1618,10 +1721,8 @@ Dhcp6SendRenewRebindMsg (
+   Event =3D (RebindRequest) ? Dhcp6EnterRebinding : Dhcp6EnterRenewing;=0D
+ =0D
+   Status =3D Dhcp6CallbackUser (Instance, Event, &Packet);=0D
+-=0D
+   if (EFI_ERROR (Status)) {=0D
+-    FreePool (Packet);=0D
+-    return Status;=0D
++    goto ON_ERROR;=0D
+   }=0D
+ =0D
+   //=0D
+@@ -1638,16 +1739,22 @@ Dhcp6SendRenewRebindMsg (
+   Instance->StartTime =3D 0;=0D
+ =0D
+   Status =3D Dhcp6TransmitPacket (Instance, Packet, Elapsed);=0D
+-=0D
+   if (EFI_ERROR (Status)) {=0D
+-    FreePool (Packet);=0D
+-    return Status;=0D
++    goto ON_ERROR;=0D
+   }=0D
+ =0D
+   //=0D
+   // Enqueue the sent packet for the retransmission in case reply timeout=
.=0D
+   //=0D
+   return Dhcp6EnqueueRetry (Instance, Packet, Elapsed, NULL);=0D
++=0D
++ON_ERROR:=0D
++=0D
++  if (Packet) {=0D
++    FreePool (Packet);=0D
++  }=0D
++=0D
++  return Status;=0D
+ }=0D
+ =0D
+ /**=0D
+@@ -1811,7 +1918,8 @@ Dhcp6SendInfoRequestMsg (
+   //=0D
+   Packet =3D AllocateZeroPool (DHCP6_BASE_PACKET_SIZE + UserLen);=0D
+   if (Packet =3D=3D NULL) {=0D
+-    return EFI_OUT_OF_RESOURCES;=0D
++    Status =3D EFI_OUT_OF_RESOURCES;=0D
++    goto ON_ERROR;=0D
+   }=0D
+ =0D
+   Packet->Size                       =3D DHCP6_BASE_PACKET_SIZE + UserLen=
;=0D
+@@ -1828,44 +1936,56 @@ Dhcp6SendInfoRequestMsg (
+ =0D
+   if (SendClientId) {=0D
+     Length =3D HTONS (ClientId->Length);=0D
+-    Cursor =3D Dhcp6AppendOption (=0D
+-               Cursor,=0D
++    Status =3D Dhcp6AppendOption (=0D
++               Packet,=0D
++               &Cursor,=0D
+                HTONS (Dhcp6OptClientId),=0D
+                Length,=0D
+                ClientId->Duid=0D
+                );=0D
++    if (EFI_ERROR (Status)) {=0D
++      goto ON_ERROR;=0D
++    }=0D
+   }=0D
+ =0D
+-  Cursor =3D Dhcp6AppendETOption (=0D
+-             Cursor,=0D
++  Status =3D Dhcp6AppendETOption (=0D
++             Packet,=0D
++             &Cursor,=0D
+              Instance,=0D
+              &Elapsed=0D
+              );=0D
++  if (EFI_ERROR (Status)) {=0D
++    goto ON_ERROR;=0D
++  }=0D
+ =0D
+-  Cursor =3D Dhcp6AppendOption (=0D
+-             Cursor,=0D
++  Status =3D Dhcp6AppendOption (=0D
++             Packet,=0D
++             &Cursor,=0D
+              OptionRequest->OpCode,=0D
+              OptionRequest->OpLen,=0D
+              OptionRequest->Data=0D
+              );=0D
++  if (EFI_ERROR (Status)) {=0D
++    goto ON_ERROR;=0D
++  }=0D
+ =0D
+   //=0D
+   // Append user-defined when configurate Dhcp6 service.=0D
+   //=0D
+   for (Index =3D 0; Index < OptionCount; Index++) {=0D
+     UserOpt =3D OptionList[Index];=0D
+-    Cursor  =3D Dhcp6AppendOption (=0D
+-                Cursor,=0D
++    Status  =3D Dhcp6AppendOption (=0D
++                Packet,=0D
++                &Cursor,=0D
+                 UserOpt->OpCode,=0D
+                 UserOpt->OpLen,=0D
+                 UserOpt->Data=0D
+                 );=0D
++    if (EFI_ERROR (Status)) {=0D
++      goto ON_ERROR;=0D
++    }=0D
+   }=0D
+ =0D
+-  //=0D
+-  // Determine the size/length of packet.=0D
+-  //=0D
+-  Packet->Length +=3D (UINT32)(Cursor - Packet->Dhcp6.Option);=0D
+   ASSERT (Packet->Size > Packet->Length + 8);=0D
+ =0D
+   //=0D
+@@ -1877,16 +1997,22 @@ Dhcp6SendInfoRequestMsg (
+   // Send info-request packet with no state.=0D
+   //=0D
+   Status =3D Dhcp6TransmitPacket (Instance, Packet, Elapsed);=0D
+-=0D
+   if (EFI_ERROR (Status)) {=0D
+-    FreePool (Packet);=0D
+-    return Status;=0D
++    goto ON_ERROR;=0D
+   }=0D
+ =0D
+   //=0D
+   // Enqueue the sent packet for the retransmission in case reply timeout=
.=0D
+   //=0D
+   return Dhcp6EnqueueRetry (Instance, Packet, Elapsed, Retransmission);=0D
++=0D
++ON_ERROR:=0D
++=0D
++  if (Packet) {=0D
++    FreePool (Packet);=0D
++  }=0D
++=0D
++  return Status;=0D
+ }=0D
+ =0D
+ /**=0D
+@@ -1937,7 +2063,8 @@ Dhcp6SendConfirmMsg (
+   //=0D
+   Packet =3D AllocateZeroPool (DHCP6_BASE_PACKET_SIZE + UserLen);=0D
+   if (Packet =3D=3D NULL) {=0D
+-    return EFI_OUT_OF_RESOURCES;=0D
++    Status =3D EFI_OUT_OF_RESOURCES;=0D
++    goto ON_ERROR;=0D
+   }=0D
+ =0D
+   Packet->Size                       =3D DHCP6_BASE_PACKET_SIZE + UserLen=
;=0D
+@@ -1951,54 +2078,64 @@ Dhcp6SendConfirmMsg (
+   Cursor =3D Packet->Dhcp6.Option;=0D
+ =0D
+   Length =3D HTONS (ClientId->Length);=0D
+-  Cursor =3D Dhcp6AppendOption (=0D
+-             Cursor,=0D
++  Status =3D Dhcp6AppendOption (=0D
++             Packet,=0D
++             &Cursor,=0D
+              HTONS (Dhcp6OptClientId),=0D
+              Length,=0D
+              ClientId->Duid=0D
+              );=0D
++  if (EFI_ERROR (Status)) {=0D
++    goto ON_ERROR;=0D
++  }=0D
+ =0D
+-  Cursor =3D Dhcp6AppendETOption (=0D
+-             Cursor,=0D
++  Status =3D Dhcp6AppendETOption (=0D
++             Packet,=0D
++             &Cursor,=0D
+              Instance,=0D
+              &Elapsed=0D
+              );=0D
++  if (EFI_ERROR (Status)) {=0D
++    goto ON_ERROR;=0D
++  }=0D
+ =0D
+-  Cursor =3D Dhcp6AppendIaOption (=0D
+-             Cursor,=0D
++  Status =3D Dhcp6AppendIaOption (=0D
++             Packet,=0D
++             &Cursor,=0D
+              Instance->IaCb.Ia,=0D
+              Instance->IaCb.T1,=0D
+              Instance->IaCb.T2,=0D
+              Packet->Dhcp6.Header.MessageType=0D
+              );=0D
++  if (EFI_ERROR (Status)) {=0D
++    goto ON_ERROR;=0D
++  }=0D
+ =0D
+   //=0D
+   // Append user-defined when configurate Dhcp6 service.=0D
+   //=0D
+   for (Index =3D 0; Index < Instance->Config->OptionCount; Index++) {=0D
+     UserOpt =3D Instance->Config->OptionList[Index];=0D
+-    Cursor  =3D Dhcp6AppendOption (=0D
+-                Cursor,=0D
++    Status  =3D Dhcp6AppendOption (=0D
++                Packet,=0D
++                &Cursor,=0D
+                 UserOpt->OpCode,=0D
+                 UserOpt->OpLen,=0D
+                 UserOpt->Data=0D
+                 );=0D
++    if (EFI_ERROR (Status)) {=0D
++      goto ON_ERROR;=0D
++    }=0D
+   }=0D
+ =0D
+-  //=0D
+-  // Determine the size/length of packet.=0D
+-  //=0D
+-  Packet->Length +=3D (UINT32)(Cursor - Packet->Dhcp6.Option);=0D
+   ASSERT (Packet->Size > Packet->Length + 8);=0D
+ =0D
+   //=0D
+   // Callback to user with the packet to be sent and check the user's fee=
dback.=0D
+   //=0D
+   Status =3D Dhcp6CallbackUser (Instance, Dhcp6SendConfirm, &Packet);=0D
+-=0D
+   if (EFI_ERROR (Status)) {=0D
+-    FreePool (Packet);=0D
+-    return Status;=0D
++    goto ON_ERROR;=0D
+   }=0D
+ =0D
+   //=0D
+@@ -2012,16 +2149,22 @@ Dhcp6SendConfirmMsg (
+   Instance->StartTime =3D 0;=0D
+ =0D
+   Status =3D Dhcp6TransmitPacket (Instance, Packet, Elapsed);=0D
+-=0D
+   if (EFI_ERROR (Status)) {=0D
+-    FreePool (Packet);=0D
+-    return Status;=0D
++    goto ON_ERROR;=0D
+   }=0D
+ =0D
+   //=0D
+   // Enqueue the sent packet for the retransmission in case reply timeout=
.=0D
+   //=0D
+   return Dhcp6EnqueueRetry (Instance, Packet, Elapsed, NULL);=0D
++=0D
++ON_ERROR:=0D
++=0D
++  if (Packet) {=0D
++    FreePool (Packet);=0D
++  }=0D
++=0D
++  return Status;=0D
+ }=0D
+ =0D
+ /**=0D
+diff --git a/NetworkPkg/Dhcp6Dxe/Dhcp6Utility.c b/NetworkPkg/Dhcp6Dxe/Dhcp=
6Utility.c
+index e6368b5b1c..705c665c51 100644
+--- a/NetworkPkg/Dhcp6Dxe/Dhcp6Utility.c
++++ b/NetworkPkg/Dhcp6Dxe/Dhcp6Utility.c
+@@ -577,24 +577,33 @@ Dhcp6OnTransmitted (
+ }=0D
+ =0D
+ /**=0D
+-  Append the option to Buf, and move Buf to the end.=0D
++  Append the option to Buf, update the length of packet, and move Buf to =
the end.=0D
+ =0D
+-  @param[in, out] Buf           The pointer to the buffer.=0D
+-  @param[in]      OptType       The option type.=0D
+-  @param[in]      OptLen        The length of option contents.=0D
+-  @param[in]      Data          The pointer to the option content.=0D
++  @param[in, out] Packet         A pointer to the packet, on success Pack=
et->Length=0D
++                                 will be updated.=0D
++  @param[in, out] PacketCursor   The pointer in the packet, on success Pa=
cketCursor=0D
++                                 will be moved to the end of the option.=
=0D
++  @param[in]      OptType        The option type.=0D
++  @param[in]      OptLen         The length of option contents.=0D
++  @param[in]      Data           The pointer to the option content.=0D
+ =0D
+-  @return         Buf           The position to append the next option.=0D
++  @retval   EFI_INVALID_PARAMETER An argument provided to the function wa=
s invalid=0D
++  @retval   EFI_BUFFER_TOO_SMALL  The buffer is too small to append the o=
ption.=0D
++  @retval   EFI_SUCCESS           The option is appended successfully.=0D
+ =0D
+ **/=0D
+-UINT8 *=0D
++EFI_STATUS=0D
+ Dhcp6AppendOption (=0D
+-  IN OUT UINT8   *Buf,=0D
+-  IN     UINT16  OptType,=0D
+-  IN     UINT16  OptLen,=0D
+-  IN     UINT8   *Data=0D
++  IN OUT EFI_DHCP6_PACKET  *Packet,=0D
++  IN OUT UINT8             **PacketCursor,=0D
++  IN     UINT16            OptType,=0D
++  IN     UINT16            OptLen,=0D
++  IN     UINT8             *Data=0D
+   )=0D
+ {=0D
++  UINT32  Length;=0D
++  UINT32  BytesNeeded;=0D
++=0D
+   //=0D
+   //  The format of Dhcp6 option:=0D
+   //=0D
+@@ -607,35 +616,95 @@ Dhcp6AppendOption (
+   //    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+=
=0D
+   //=0D
+ =0D
+-  ASSERT (OptLen !=3D 0);=0D
++  //=0D
++  // Verify the arguments are valid=0D
++  //=0D
++  if (Packet =3D=3D NULL) {=0D
++    return EFI_INVALID_PARAMETER;=0D
++  }=0D
++=0D
++  if ((PacketCursor =3D=3D NULL) || (*PacketCursor =3D=3D NULL)) {=0D
++    return EFI_INVALID_PARAMETER;=0D
++  }=0D
++=0D
++  if (Data =3D=3D NULL) {=0D
++    return EFI_INVALID_PARAMETER;=0D
++  }=0D
++=0D
++  if (OptLen =3D=3D 0) {=0D
++    return EFI_INVALID_PARAMETER;=0D
++  }=0D
++=0D
++  //=0D
++  // Verify the PacketCursor is within the packet=0D
++  //=0D
++  if (  (*PacketCursor < Packet->Dhcp6.Option)=0D
++     || (*PacketCursor >=3D Packet->Dhcp6.Option + (Packet->Size - sizeof=
 (EFI_DHCP6_HEADER))))=0D
++  {=0D
++    return EFI_INVALID_PARAMETER;=0D
++  }=0D
++=0D
++  //=0D
++  // Calculate the bytes needed for the option=0D
++  //=0D
++  BytesNeeded =3D DHCP6_SIZE_OF_COMBINED_CODE_AND_LEN + NTOHS (OptLen);=0D
++=0D
++  //=0D
++  // Space remaining in the packet=0D
++  //=0D
++  Length =3D Packet->Size - Packet->Length;=0D
++  if (Length < BytesNeeded) {=0D
++    return EFI_BUFFER_TOO_SMALL;=0D
++  }=0D
++=0D
++  //=0D
++  // Verify the PacketCursor is within the packet=0D
++  //=0D
++  if (  (*PacketCursor < Packet->Dhcp6.Option)=0D
++     || (*PacketCursor >=3D Packet->Dhcp6.Option + (Packet->Size - sizeof=
 (EFI_DHCP6_HEADER))))=0D
++  {=0D
++    return EFI_INVALID_PARAMETER;=0D
++  }=0D
++=0D
++  WriteUnaligned16 ((UINT16 *)*PacketCursor, OptType);=0D
++  *PacketCursor +=3D DHCP6_SIZE_OF_OPT_CODE;=0D
++  WriteUnaligned16 ((UINT16 *)*PacketCursor, OptLen);=0D
++  *PacketCursor +=3D DHCP6_SIZE_OF_OPT_LEN;=0D
++  CopyMem (*PacketCursor, Data, NTOHS (OptLen));=0D
++  *PacketCursor +=3D NTOHS (OptLen);=0D
+ =0D
+-  WriteUnaligned16 ((UINT16 *)Buf, OptType);=0D
+-  Buf +=3D 2;=0D
+-  WriteUnaligned16 ((UINT16 *)Buf, OptLen);=0D
+-  Buf +=3D 2;=0D
+-  CopyMem (Buf, Data, NTOHS (OptLen));=0D
+-  Buf +=3D NTOHS (OptLen);=0D
++  // Update the packet length by the length of the option + 4 bytes=0D
++  Packet->Length +=3D BytesNeeded;=0D
+ =0D
+-  return Buf;=0D
++  return EFI_SUCCESS;=0D
+ }=0D
+ =0D
+ /**=0D
+   Append the appointed IA Address option to Buf, and move Buf to the end.=
=0D
+ =0D
+-  @param[in, out] Buf           The pointer to the position to append.=0D
++  @param[in, out] Packet        A pointer to the packet, on success Packe=
t->Length=0D
++                                will be updated.=0D
++  @param[in, out] PacketCursor  The pointer in the packet, on success Pac=
ketCursor=0D
++                                will be moved to the end of the option.=0D
+   @param[in]      IaAddr        The pointer to the IA Address.=0D
+   @param[in]      MessageType   Message type of DHCP6 package.=0D
+ =0D
+-  @return         Buf           The position to append the next option.=0D
++  @retval   EFI_INVALID_PARAMETER An argument provided to the function wa=
s invalid=0D
++  @retval   EFI_BUFFER_TOO_SMALL  The buffer is too small to append the o=
ption.=0D
++  @retval   EFI_SUCCESS           The option is appended successfully.=0D
+ =0D
+ **/=0D
+-UINT8 *=0D
++EFI_STATUS=0D
+ Dhcp6AppendIaAddrOption (=0D
+-  IN OUT UINT8                 *Buf,=0D
++  IN OUT EFI_DHCP6_PACKET      *Packet,=0D
++  IN OUT UINT8                 **PacketCursor,=0D
+   IN     EFI_DHCP6_IA_ADDRESS  *IaAddr,=0D
+   IN     UINT32                MessageType=0D
+   )=0D
+ {=0D
++  UINT32  BytesNeeded;=0D
++  UINT32  Length;=0D
++=0D
+   //  The format of the IA Address option is:=0D
+   //=0D
+   //       0                   1                   2                   3=
=0D
+@@ -657,17 +726,60 @@ Dhcp6AppendIaAddrOption (
+   //      .                                                              =
 .=0D
+   //      +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+=
-+=0D
+ =0D
++  //=0D
++  // Verify the arguments are valid=0D
++  //=0D
++  if (Packet =3D=3D NULL) {=0D
++    return EFI_INVALID_PARAMETER;=0D
++  }=0D
++=0D
++  if ((PacketCursor =3D=3D NULL) || (*PacketCursor =3D=3D NULL)) {=0D
++    return EFI_INVALID_PARAMETER;=0D
++  }=0D
++=0D
++  if (IaAddr =3D=3D NULL) {=0D
++    return EFI_INVALID_PARAMETER;=0D
++  }=0D
++=0D
++  //=0D
++  // Verify the PacketCursor is within the packet=0D
++  //=0D
++  if (  (*PacketCursor < Packet->Dhcp6.Option)=0D
++     || (*PacketCursor >=3D Packet->Dhcp6.Option + (Packet->Size - sizeof=
 (EFI_DHCP6_HEADER))))=0D
++  {=0D
++    return EFI_INVALID_PARAMETER;=0D
++  }=0D
++=0D
++  BytesNeeded  =3D DHCP6_SIZE_OF_COMBINED_CODE_AND_LEN;=0D
++  BytesNeeded +=3D sizeof (EFI_IPv6_ADDRESS);=0D
++  //=0D
++  // Even if the preferred-lifetime is 0, it still needs to store it.=0D
++  //=0D
++  BytesNeeded +=3D sizeof (IaAddr->PreferredLifetime);=0D
++  //=0D
++  // Even if the valid-lifetime is 0, it still needs to store it.=0D
++  //=0D
++  BytesNeeded +=3D sizeof (IaAddr->ValidLifetime);=0D
++=0D
++  //=0D
++  // Space remaining in the packet=0D
++  //=0D
++  Length =3D Packet->Size - Packet->Length;=0D
++  if (Length < BytesNeeded) {=0D
++    return EFI_BUFFER_TOO_SMALL;=0D
++  }=0D
++=0D
+   //=0D
+   // Fill the value of Ia Address option type=0D
+   //=0D
+-  WriteUnaligned16 ((UINT16 *)Buf, HTONS (Dhcp6OptIaAddr));=0D
+-  Buf +=3D 2;=0D
++  WriteUnaligned16 ((UINT16 *)*PacketCursor, HTONS (Dhcp6OptIaAddr));=0D
++  *PacketCursor +=3D DHCP6_SIZE_OF_OPT_CODE;=0D
+ =0D
+-  WriteUnaligned16 ((UINT16 *)Buf, HTONS (sizeof (EFI_DHCP6_IA_ADDRESS)))=
;=0D
+-  Buf +=3D 2;=0D
++  WriteUnaligned16 ((UINT16 *)*PacketCursor, HTONS (sizeof (EFI_DHCP6_IA_=
ADDRESS)));=0D
++  *PacketCursor +=3D DHCP6_SIZE_OF_OPT_LEN;=0D
+ =0D
+-  CopyMem (Buf, &IaAddr->IpAddress, sizeof (EFI_IPv6_ADDRESS));=0D
+-  Buf +=3D sizeof (EFI_IPv6_ADDRESS);=0D
++  CopyMem (*PacketCursor, &IaAddr->IpAddress, sizeof (EFI_IPv6_ADDRESS));=
=0D
++  *PacketCursor +=3D sizeof (EFI_IPv6_ADDRESS);=0D
+ =0D
+   //=0D
+   // Fill the value of preferred-lifetime and valid-lifetime.=0D
+@@ -675,44 +787,58 @@ Dhcp6AppendIaAddrOption (
+   // should set to 0 when initiate a Confirm message.=0D
+   //=0D
+   if (MessageType !=3D Dhcp6MsgConfirm) {=0D
+-    WriteUnaligned32 ((UINT32 *)Buf, HTONL (IaAddr->PreferredLifetime));=
=0D
++    WriteUnaligned32 ((UINT32 *)*PacketCursor, HTONL (IaAddr->PreferredLi=
fetime));=0D
+   }=0D
+ =0D
+-  Buf +=3D 4;=0D
++  *PacketCursor +=3D sizeof (IaAddr->PreferredLifetime);=0D
+ =0D
+   if (MessageType !=3D Dhcp6MsgConfirm) {=0D
+-    WriteUnaligned32 ((UINT32 *)Buf, HTONL (IaAddr->ValidLifetime));=0D
++    WriteUnaligned32 ((UINT32 *)*PacketCursor, HTONL (IaAddr->ValidLifeti=
me));=0D
+   }=0D
+ =0D
+-  Buf +=3D 4;=0D
++  *PacketCursor +=3D sizeof (IaAddr->ValidLifetime);=0D
++=0D
++  //=0D
++  // Update the packet length=0D
++  //=0D
++  Packet->Length +=3D BytesNeeded;=0D
+ =0D
+-  return Buf;=0D
++  return EFI_SUCCESS;=0D
+ }=0D
+ =0D
+ /**=0D
+   Append the appointed Ia option to Buf, and move Buf to the end.=0D
+ =0D
+-  @param[in, out] Buf           The pointer to the position to append.=0D
++  @param[in, out] Packet        A pointer to the packet, on success Packe=
t->Length=0D
++                                will be updated.=0D
++  @param[in, out] PacketCursor  The pointer in the packet, on success Pac=
ketCursor=0D
++                                will be moved to the end of the option.=0D
+   @param[in]      Ia            The pointer to the Ia.=0D
+   @param[in]      T1            The time of T1.=0D
+   @param[in]      T2            The time of T2.=0D
+   @param[in]      MessageType   Message type of DHCP6 package.=0D
+ =0D
+-  @return         Buf           The position to append the next Ia option=
.=0D
++  @retval   EFI_INVALID_PARAMETER An argument provided to the function wa=
s invalid=0D
++  @retval   EFI_BUFFER_TOO_SMALL  The buffer is too small to append the o=
ption.=0D
++  @retval   EFI_SUCCESS           The option is appended successfully.=0D
+ =0D
+ **/=0D
+-UINT8 *=0D
++EFI_STATUS=0D
+ Dhcp6AppendIaOption (=0D
+-  IN OUT UINT8         *Buf,=0D
+-  IN     EFI_DHCP6_IA  *Ia,=0D
+-  IN     UINT32        T1,=0D
+-  IN     UINT32        T2,=0D
+-  IN     UINT32        MessageType=0D
++  IN OUT EFI_DHCP6_PACKET  *Packet,=0D
++  IN OUT UINT8             **PacketCursor,=0D
++  IN     EFI_DHCP6_IA      *Ia,=0D
++  IN     UINT32            T1,=0D
++  IN     UINT32            T2,=0D
++  IN     UINT32            MessageType=0D
+   )=0D
+ {=0D
+-  UINT8   *AddrOpt;=0D
+-  UINT16  *Len;=0D
+-  UINTN   Index;=0D
++  UINT8       *AddrOpt;=0D
++  UINT16      *Len;=0D
++  UINTN       Index;=0D
++  UINT32      BytesNeeded;=0D
++  UINT32      Length;=0D
++  EFI_STATUS  Status;=0D
+ =0D
+   //=0D
+   //  The format of IA_NA and IA_TA option:=0D
+@@ -733,32 +859,74 @@ Dhcp6AppendIaOption (
+   //    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+=
=0D
+   //=0D
+ =0D
++  //=0D
++  // Verify the arguments are valid=0D
++  //=0D
++  if (Packet =3D=3D NULL) {=0D
++    return EFI_INVALID_PARAMETER;=0D
++  }=0D
++=0D
++  if ((PacketCursor =3D=3D NULL) || (*PacketCursor =3D=3D NULL)) {=0D
++    return EFI_INVALID_PARAMETER;=0D
++  }=0D
++=0D
++  if (Ia =3D=3D NULL) {=0D
++    return EFI_INVALID_PARAMETER;=0D
++  }=0D
++=0D
++  //=0D
++  // Verify the PacketCursor is within the packet=0D
++  //=0D
++  if (  (*PacketCursor < Packet->Dhcp6.Option)=0D
++     || (*PacketCursor >=3D Packet->Dhcp6.Option + (Packet->Size - sizeof=
 (EFI_DHCP6_HEADER))))=0D
++  {=0D
++    return EFI_INVALID_PARAMETER;=0D
++  }=0D
++=0D
++  BytesNeeded  =3D DHCP6_SIZE_OF_COMBINED_CODE_AND_LEN;=0D
++  BytesNeeded +=3D sizeof (Ia->Descriptor.IaId);=0D
++  //=0D
++  // + N for the IA_NA-options/IA_TA-options=0D
++  // Dhcp6AppendIaAddrOption will need to check the length for each addre=
ss=0D
++  //=0D
++  if (Ia->Descriptor.Type =3D=3D Dhcp6OptIana) {=0D
++    BytesNeeded +=3D sizeof (T1) + sizeof (T2);=0D
++  }=0D
++=0D
++  //=0D
++  // Space remaining in the packet=0D
++  //=0D
++  Length =3D (UINT16)(Packet->Size - Packet->Length);=0D
++  if (Length < BytesNeeded) {=0D
++    return EFI_BUFFER_TOO_SMALL;=0D
++  }=0D
++=0D
+   //=0D
+   // Fill the value of Ia option type=0D
+   //=0D
+-  WriteUnaligned16 ((UINT16 *)Buf, HTONS (Ia->Descriptor.Type));=0D
+-  Buf +=3D 2;=0D
++  WriteUnaligned16 ((UINT16 *)*PacketCursor, HTONS (Ia->Descriptor.Type))=
;=0D
++  *PacketCursor +=3D DHCP6_SIZE_OF_OPT_CODE;=0D
+ =0D
+   //=0D
+   // Fill the len of Ia option later, keep the pointer first=0D
+   //=0D
+-  Len  =3D (UINT16 *)Buf;=0D
+-  Buf +=3D 2;=0D
++  Len            =3D (UINT16 *)*PacketCursor;=0D
++  *PacketCursor +=3D DHCP6_SIZE_OF_OPT_LEN;=0D
+ =0D
+   //=0D
+   // Fill the value of iaid=0D
+   //=0D
+-  WriteUnaligned32 ((UINT32 *)Buf, HTONL (Ia->Descriptor.IaId));=0D
+-  Buf +=3D 4;=0D
++  WriteUnaligned32 ((UINT32 *)*PacketCursor, HTONL (Ia->Descriptor.IaId))=
;=0D
++  *PacketCursor +=3D sizeof (Ia->Descriptor.IaId);=0D
+ =0D
+   //=0D
+   // Fill the value of t1 and t2 if iana, keep it 0xffffffff if no specif=
ied.=0D
+   //=0D
+   if (Ia->Descriptor.Type =3D=3D Dhcp6OptIana) {=0D
+-    WriteUnaligned32 ((UINT32 *)Buf, HTONL ((T1 !=3D 0) ? T1 : 0xffffffff=
));=0D
+-    Buf +=3D 4;=0D
+-    WriteUnaligned32 ((UINT32 *)Buf, HTONL ((T2 !=3D 0) ? T2 : 0xffffffff=
));=0D
+-    Buf +=3D 4;=0D
++    WriteUnaligned32 ((UINT32 *)*PacketCursor, HTONL ((T1 !=3D 0) ? T1 : =
0xffffffff));=0D
++    *PacketCursor +=3D sizeof (T1);=0D
++    WriteUnaligned32 ((UINT32 *)*PacketCursor, HTONL ((T2 !=3D 0) ? T2 : =
0xffffffff));=0D
++    *PacketCursor +=3D sizeof (T2);=0D
+   }=0D
+ =0D
+   //=0D
+@@ -766,35 +934,51 @@ Dhcp6AppendIaOption (
+   //=0D
+   for (Index =3D 0; Index < Ia->IaAddressCount; Index++) {=0D
+     AddrOpt =3D (UINT8 *)Ia->IaAddress + Index * sizeof (EFI_DHCP6_IA_ADD=
RESS);=0D
+-    Buf     =3D Dhcp6AppendIaAddrOption (Buf, (EFI_DHCP6_IA_ADDRESS *)Add=
rOpt, MessageType);=0D
++    Status  =3D Dhcp6AppendIaAddrOption (Packet, PacketCursor, (EFI_DHCP6=
_IA_ADDRESS *)AddrOpt, MessageType);=0D
++    if (EFI_ERROR (Status)) {=0D
++      return Status;=0D
++    }=0D
+   }=0D
+ =0D
+   //=0D
+   // Fill the value of Ia option length=0D
+   //=0D
+-  *Len =3D HTONS ((UINT16)(Buf - (UINT8 *)Len - 2));=0D
++  *Len =3D HTONS ((UINT16)(*PacketCursor - (UINT8 *)Len - 2));=0D
+ =0D
+-  return Buf;=0D
++  //=0D
++  // Update the packet length=0D
++  //=0D
++  Packet->Length +=3D BytesNeeded;=0D
++=0D
++  return EFI_SUCCESS;=0D
+ }=0D
+ =0D
+ /**=0D
+   Append the appointed Elapsed time option to Buf, and move Buf to the en=
d.=0D
+ =0D
+-  @param[in, out] Buf           The pointer to the position to append.=0D
++  @param[in, out] Packet        A pointer to the packet, on success Packe=
t->Length=0D
++  @param[in, out] PacketCursor  The pointer in the packet, on success Pac=
ketCursor=0D
++                                will be moved to the end of the option.=0D
+   @param[in]      Instance      The pointer to the Dhcp6 instance.=0D
+   @param[out]     Elapsed       The pointer to the elapsed time value in=
=0D
+-                                  the generated packet.=0D
++                                the generated packet.=0D
+ =0D
+-  @return         Buf           The position to append the next Ia option=
.=0D
++  @retval   EFI_INVALID_PARAMETER An argument provided to the function wa=
s invalid=0D
++  @retval   EFI_BUFFER_TOO_SMALL  The buffer is too small to append the o=
ption.=0D
++  @retval   EFI_SUCCESS           The option is appended successfully.=0D
+ =0D
+ **/=0D
+-UINT8 *=0D
++EFI_STATUS=0D
+ Dhcp6AppendETOption (=0D
+-  IN OUT UINT8           *Buf,=0D
+-  IN     DHCP6_INSTANCE  *Instance,=0D
+-  OUT    UINT16          **Elapsed=0D
++  IN OUT EFI_DHCP6_PACKET  *Packet,=0D
++  IN OUT UINT8             **PacketCursor,=0D
++  IN     DHCP6_INSTANCE    *Instance,=0D
++  OUT    UINT16            **Elapsed=0D
+   )=0D
+ {=0D
++  UINT32  BytesNeeded;=0D
++  UINT32  Length;=0D
++=0D
+   //=0D
+   //  The format of elapsed time option:=0D
+   //=0D
+@@ -806,27 +990,70 @@ Dhcp6AppendETOption (
+   //  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+=0D
+   //=0D
+ =0D
++  //=0D
++  // Verify the arguments are valid=0D
++  //=0D
++  if (Packet =3D=3D NULL) {=0D
++    return EFI_INVALID_PARAMETER;=0D
++  }=0D
++=0D
++  if ((PacketCursor =3D=3D NULL) || (*PacketCursor =3D=3D NULL)) {=0D
++    return EFI_INVALID_PARAMETER;=0D
++  }=0D
++=0D
++  if (Instance =3D=3D NULL) {=0D
++    return EFI_INVALID_PARAMETER;=0D
++  }=0D
++=0D
++  if ((Elapsed =3D=3D NULL)) {=0D
++    return EFI_INVALID_PARAMETER;=0D
++  }=0D
++=0D
++  //=0D
++  // Verify the PacketCursor is within the packet=0D
++  //=0D
++  if (  (*PacketCursor < Packet->Dhcp6.Option)=0D
++     || (*PacketCursor >=3D Packet->Dhcp6.Option + (Packet->Size - sizeof=
 (EFI_DHCP6_HEADER))))=0D
++  {=0D
++    return EFI_INVALID_PARAMETER;=0D
++  }=0D
++=0D
++  BytesNeeded =3D DHCP6_SIZE_OF_COMBINED_CODE_AND_LEN;=0D
++  //=0D
++  // + 2 for elapsed-time=0D
++  //=0D
++  BytesNeeded +=3D sizeof (UINT16);=0D
++  //=0D
++  // Space remaining in the packet=0D
++  //=0D
++  Length =3D Packet->Size - Packet->Length;=0D
++  if (Length < BytesNeeded) {=0D
++    return EFI_BUFFER_TOO_SMALL;=0D
++  }=0D
++=0D
+   //=0D
+   // Fill the value of elapsed-time option type.=0D
+   //=0D
+-  WriteUnaligned16 ((UINT16 *)Buf, HTONS (Dhcp6OptElapsedTime));=0D
+-  Buf +=3D 2;=0D
++  WriteUnaligned16 ((UINT16 *)*PacketCursor, HTONS (Dhcp6OptElapsedTime))=
;=0D
++  *PacketCursor +=3D DHCP6_SIZE_OF_OPT_CODE;=0D
+ =0D
+   //=0D
+   // Fill the len of elapsed-time option, which is fixed.=0D
+   //=0D
+-  WriteUnaligned16 ((UINT16 *)Buf, HTONS (2));=0D
+-  Buf +=3D 2;=0D
++  WriteUnaligned16 ((UINT16 *)*PacketCursor, HTONS (2));=0D
++  *PacketCursor +=3D DHCP6_SIZE_OF_OPT_LEN;=0D
+ =0D
+   //=0D
+   // Fill in elapsed time value with 0 value for now.  The actual value i=
s=0D
+   // filled in later just before the packet is transmitted.=0D
+   //=0D
+-  WriteUnaligned16 ((UINT16 *)Buf, HTONS (0));=0D
+-  *Elapsed =3D (UINT16 *)Buf;=0D
+-  Buf     +=3D 2;=0D
++  WriteUnaligned16 ((UINT16 *)*PacketCursor, HTONS (0));=0D
++  *Elapsed       =3D (UINT16 *)*PacketCursor;=0D
++  *PacketCursor +=3D sizeof (UINT16);=0D
+ =0D
+-  return Buf;=0D
++  Packet->Length +=3D BytesNeeded;=0D
++=0D
++  return EFI_SUCCESS;=0D
+ }=0D
+ =0D
+ /**=0D
+diff --git a/NetworkPkg/Dhcp6Dxe/Dhcp6Utility.h b/NetworkPkg/Dhcp6Dxe/Dhcp=
6Utility.h
+index 046454ff4a..06947f6c1f 100644
+--- a/NetworkPkg/Dhcp6Dxe/Dhcp6Utility.h
++++ b/NetworkPkg/Dhcp6Dxe/Dhcp6Utility.h
+@@ -160,69 +160,85 @@ Dhcp6OnTransmitted (
+   );=0D
+ =0D
+ /**=0D
+-  Append the appointed option to the buf, and move the buf to the end.=0D
+-=0D
+-  @param[in, out] Buf           The pointer to buffer.=0D
+-  @param[in]      OptType       The option type.=0D
+-  @param[in]      OptLen        The length of option content.s=0D
+-  @param[in]      Data          The pointer to the option content.=0D
+-=0D
+-  @return         Buf           The position to append the next option.=0D
+-=0D
++  Append the option to Buf, update the length of packet, and move Buf to =
the end.=0D
++=0D
++  @param[in, out] Packet         A pointer to the packet, on success Pack=
et->Length=0D
++                                 will be updated.=0D
++  @param[in, out] PacketCursor   The pointer in the packet, on success Pa=
cketCursor=0D
++                                 will be moved to the end of the option.=
=0D
++  @param[in]      OptType        The option type.=0D
++  @param[in]      OptLen         The length of option contents.=0D
++  @param[in]      Data           The pointer to the option content.=0D
++=0D
++  @retval   EFI_INVALID_PARAMETER An argument provided to the function wa=
s invalid=0D
++  @retval   EFI_BUFFER_TOO_SMALL  The buffer is too small to append the o=
ption.=0D
++  @retval   EFI_SUCCESS           The option is appended successfully.=0D
+ **/=0D
+-UINT8 *=0D
++EFI_STATUS=0D
+ Dhcp6AppendOption (=0D
+-  IN OUT UINT8   *Buf,=0D
+-  IN     UINT16  OptType,=0D
+-  IN     UINT16  OptLen,=0D
+-  IN     UINT8   *Data=0D
++  IN OUT EFI_DHCP6_PACKET  *Packet,=0D
++  IN OUT UINT8             **PacketCursor,=0D
++  IN     UINT16            OptType,=0D
++  IN     UINT16            OptLen,=0D
++  IN     UINT8             *Data=0D
+   );=0D
+ =0D
+ /**=0D
+-  Append the Ia option to Buf, and move Buf to the end.=0D
+-=0D
+-  @param[in, out] Buf           The pointer to the position to append.=0D
++  Append the appointed Ia option to Buf, update the Ia option length, and=
 move Buf=0D
++  to the end of the option.=0D
++  @param[in, out] Packet        A pointer to the packet, on success Packe=
t->Length=0D
++                                will be updated.=0D
++  @param[in, out] PacketCursor   The pointer in the packet, on success Pa=
cketCursor=0D
++                                 will be moved to the end of the option.=
=0D
+   @param[in]      Ia            The pointer to the Ia.=0D
+   @param[in]      T1            The time of T1.=0D
+   @param[in]      T2            The time of T2.=0D
+   @param[in]      MessageType   Message type of DHCP6 package.=0D
+ =0D
+-  @return         Buf           The position to append the next Ia option=
.=0D
+-=0D
++  @retval   EFI_INVALID_PARAMETER An argument provided to the function wa=
s invalid=0D
++  @retval   EFI_BUFFER_TOO_SMALL  The buffer is too small to append the o=
ption.=0D
++  @retval   EFI_SUCCESS           The option is appended successfully.=0D
+ **/=0D
+-UINT8 *=0D
++EFI_STATUS=0D
+ Dhcp6AppendIaOption (=0D
+-  IN OUT UINT8         *Buf,=0D
+-  IN     EFI_DHCP6_IA  *Ia,=0D
+-  IN     UINT32        T1,=0D
+-  IN     UINT32        T2,=0D
+-  IN     UINT32        MessageType=0D
++  IN OUT EFI_DHCP6_PACKET  *Packet,=0D
++  IN OUT UINT8             **PacketCursor,=0D
++  IN     EFI_DHCP6_IA      *Ia,=0D
++  IN     UINT32            T1,=0D
++  IN     UINT32            T2,=0D
++  IN     UINT32            MessageType=0D
+   );=0D
+ =0D
+ /**=0D
+   Append the appointed Elapsed time option to Buf, and move Buf to the en=
d.=0D
+ =0D
+-  @param[in, out] Buf           The pointer to the position to append.=0D
++  @param[in, out] Packet        A pointer to the packet, on success Packe=
t->Length=0D
++  @param[in, out] PacketCursor   The pointer in the packet, on success Pa=
cketCursor=0D
++                                 will be moved to the end of the option.=
=0D
+   @param[in]      Instance      The pointer to the Dhcp6 instance.=0D
+   @param[out]     Elapsed       The pointer to the elapsed time value in=
=0D
+                                   the generated packet.=0D
+ =0D
+-  @return         Buf           The position to append the next Ia option=
.=0D
++  @retval   EFI_INVALID_PARAMETER An argument provided to the function wa=
s invalid=0D
++  @retval   EFI_BUFFER_TOO_SMALL  The buffer is too small to append the o=
ption.=0D
++  @retval   EFI_SUCCESS           The option is appended successfully.=0D
+ =0D
+ **/=0D
+-UINT8 *=0D
++EFI_STATUS=0D
+ Dhcp6AppendETOption (=0D
+-  IN OUT UINT8           *Buf,=0D
+-  IN     DHCP6_INSTANCE  *Instance,=0D
+-  OUT    UINT16          **Elapsed=0D
++  IN OUT EFI_DHCP6_PACKET  *Packet,=0D
++  IN OUT UINT8             **PacketCursor,=0D
++  IN     DHCP6_INSTANCE    *Instance,=0D
++  OUT    UINT16            **Elapsed=0D
+   );=0D
+ =0D
+ /**=0D
+   Set the elapsed time based on the given instance and the pointer to the=
=0D
+   elapsed time option.=0D
+ =0D
+-  @param[in]      Elapsed       The pointer to the position to append.=0D
+-  @param[in]      Instance      The pointer to the Dhcp6 instance.=0D
++  @retval   EFI_INVALID_PARAMETER An argument provided to the function wa=
s invalid=0D
++  @retval   EFI_BUFFER_TOO_SMALL  The buffer is too small to append the o=
ption.=0D
++  @retval   EFI_SUCCESS           The option is appended successfully.=0D
+ **/=0D
+ VOID=0D
+ SetElapsedTime (=0D
+--=20
+2.40.0
+
diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2023-45230-0002.patch b/meta/r=
ecipes-core/ovmf/ovmf/CVE-2023-45230-0002.patch
new file mode 100644
index 0000000000..1f891f8007
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/CVE-2023-45230-0002.patch
@@ -0,0 +1,604 @@
+From 5f3658197bf29c83b3349b0ab1d99cdb0c3814bc Mon Sep 17 00:00:00 2001
+From: "Doug Flick via groups.io" <dougflick=3Dmicrosoft.com@groups.io>
+Date: Fri, 26 Jan 2024 05:54:45 +0800
+Subject: [PATCH] NetworkPkg: Dhcp6Dxe: SECURITY PATCH CVE-2023-45230 Unit=
=20
+ Tests
+
+REF: https://bugzilla.tianocore.org/show_bug.cgi?id=3D4535
+
+Confirms that reported issue...
+
+"Buffer overflow in the DHCPv6 client via a long Server ID option"
+
+..has been corrected by the provided patch.
+
+Tests the following functions to ensure they appropriately handle
+untrusted data (either too long or too small) to prevent a buffer
+overflow:
+
+Dhcp6AppendOption
+Dhcp6AppendETOption
+Dhcp6AppendIaOption
+
+Cc: Saloni Kasbekar <saloni.kasbekar@intel.com>
+Cc: Zachary Clark-williams <zachary.clark-williams@intel.com>
+
+Signed-off-by: Doug Flick [MSFT] <doug.edk2@gmail.com>
+Reviewed-by: Saloni Kasbekar <saloni.kasbekar@intel.com>
+
+CVE: CVE-2023-45230
+
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/5f3658=
197bf29c83b3349b0ab1d99cdb0c3814bc]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ .../GoogleTest/Dhcp6DxeGoogleTest.cpp         |  20 +
+ .../GoogleTest/Dhcp6DxeGoogleTest.inf         |  43 ++
+ .../Dhcp6Dxe/GoogleTest/Dhcp6IoGoogleTest.cpp | 478 ++++++++++++++++++
+ 3 files changed, 541 insertions(+)
+ create mode 100644 NetworkPkg/Dhcp6Dxe/GoogleTest/Dhcp6DxeGoogleTest.cpp
+ create mode 100644 NetworkPkg/Dhcp6Dxe/GoogleTest/Dhcp6DxeGoogleTest.inf
+ create mode 100644 NetworkPkg/Dhcp6Dxe/GoogleTest/Dhcp6IoGoogleTest.cpp
+
+diff --git a/NetworkPkg/Dhcp6Dxe/GoogleTest/Dhcp6DxeGoogleTest.cpp b/Netwo=
rkPkg/Dhcp6Dxe/GoogleTest/Dhcp6DxeGoogleTest.cpp
+new file mode 100644
+index 0000000000..9aeced2f91
+--- /dev/null
++++ b/NetworkPkg/Dhcp6Dxe/GoogleTest/Dhcp6DxeGoogleTest.cpp
+@@ -0,0 +1,20 @@
++/** @file=0D
++  Acts as the main entry point for the tests for the Dhcp6Dxe module.=0D
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
+diff --git a/NetworkPkg/Dhcp6Dxe/GoogleTest/Dhcp6DxeGoogleTest.inf b/Netwo=
rkPkg/Dhcp6Dxe/GoogleTest/Dhcp6DxeGoogleTest.inf
+new file mode 100644
+index 0000000000..8e9119a371
+--- /dev/null
++++ b/NetworkPkg/Dhcp6Dxe/GoogleTest/Dhcp6DxeGoogleTest.inf
+@@ -0,0 +1,43 @@
++## @file=0D
++# Unit test suite for the Dhcp6Dxe using Google Test=0D
++#=0D
++# Copyright (c) Microsoft Corporation.<BR>=0D
++# SPDX-License-Identifier: BSD-2-Clause-Patent=0D
++##=0D
++[Defines]=0D
++  INF_VERSION         =3D 0x00010017=0D
++  BASE_NAME           =3D Dhcp6DxeGoogleTest=0D
++  FILE_GUID           =3D 1D2A4C65-38C8-4C2F-BB60-B5FA49625AA9=0D
++  VERSION_STRING      =3D 1.0=0D
++  MODULE_TYPE         =3D HOST_APPLICATION=0D
++#=0D
++# The following information is for reference only and not required by the=
 build tools.=0D
++#=0D
++#  VALID_ARCHITECTURES           =3D IA32 X64 AARCH64=0D
++#=0D
++[Sources]=0D
++  Dhcp6DxeGoogleTest.cpp=0D
++  Dhcp6IoGoogleTest.cpp=0D
++  ../Dhcp6Io.c=0D
++  ../Dhcp6Utility.c=0D
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
+diff --git a/NetworkPkg/Dhcp6Dxe/GoogleTest/Dhcp6IoGoogleTest.cpp b/Networ=
kPkg/Dhcp6Dxe/GoogleTest/Dhcp6IoGoogleTest.cpp
+new file mode 100644
+index 0000000000..7ee40e4af4
+--- /dev/null
++++ b/NetworkPkg/Dhcp6Dxe/GoogleTest/Dhcp6IoGoogleTest.cpp
+@@ -0,0 +1,478 @@
++/** @file=0D
++  Tests for Dhcp6Io.c.=0D
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
++  #include <Library/BaseMemoryLib.h>=0D
++  #include "../Dhcp6Impl.h"=0D
++  #include "../Dhcp6Utility.h"=0D
++}=0D
++=0D
++////////////////////////////////////////////////////////////////////////=
=0D
++// Defines=0D
++////////////////////////////////////////////////////////////////////////=
=0D
++=0D
++#define DHCP6_PACKET_MAX_LEN  1500=0D
++=0D
++////////////////////////////////////////////////////////////////////////=
=0D
++////////////////////////////////////////////////////////////////////////=
=0D
++// Symbol Definitions=0D
++// These functions are not directly under test - but required to compile=
=0D
++////////////////////////////////////////////////////////////////////////=
=0D
++=0D
++// This definition is used by this test but is also required to compile=0D
++// by Dhcp6Io.c=0D
++EFI_IPv6_ADDRESS  mAllDhcpRelayAndServersAddress =3D {=0D
++  { 0xFF, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 2 }=0D
++};=0D
++=0D
++EFI_STATUS=0D
++EFIAPI=0D
++UdpIoSendDatagram (=0D
++  IN  UDP_IO           *UdpIo,=0D
++  IN  NET_BUF          *Packet,=0D
++  IN  UDP_END_POINT    *EndPoint OPTIONAL,=0D
++  IN  EFI_IP_ADDRESS   *Gateway  OPTIONAL,=0D
++  IN  UDP_IO_CALLBACK  CallBack,=0D
++  IN  VOID             *Context=0D
++  )=0D
++{=0D
++  return EFI_SUCCESS;=0D
++}=0D
++=0D
++EFI_STATUS=0D
++EFIAPI=0D
++UdpIoRecvDatagram (=0D
++  IN  UDP_IO           *UdpIo,=0D
++  IN  UDP_IO_CALLBACK  CallBack,=0D
++  IN  VOID             *Context,=0D
++  IN  UINT32           HeadLen=0D
++  )=0D
++{=0D
++  return EFI_SUCCESS;=0D
++}=0D
++=0D
++////////////////////////////////////////////////////////////////////////=
=0D
++// Dhcp6AppendOptionTest Tests=0D
++////////////////////////////////////////////////////////////////////////=
=0D
++=0D
++class Dhcp6AppendOptionTest : public ::testing::Test {=0D
++public:=0D
++  UINT8 *Buffer =3D NULL;=0D
++  EFI_DHCP6_PACKET *Packet;=0D
++=0D
++protected:=0D
++  // Add any setup code if needed=0D
++  virtual void=0D
++  SetUp (=0D
++    )=0D
++  {=0D
++    // Initialize any resources or variables=0D
++    Buffer =3D (UINT8 *)AllocateZeroPool (DHCP6_PACKET_MAX_LEN);=0D
++    ASSERT_NE (Buffer, (UINT8 *)NULL);=0D
++=0D
++    Packet       =3D (EFI_DHCP6_PACKET *)Buffer;=0D
++    Packet->Size =3D DHCP6_PACKET_MAX_LEN;=0D
++  }=0D
++=0D
++  // Add any cleanup code if needed=0D
++  virtual void=0D
++  TearDown (=0D
++    )=0D
++  {=0D
++    // Clean up any resources or variables=0D
++    if (Buffer !=3D NULL) {=0D
++      FreePool (Buffer);=0D
++    }=0D
++  }=0D
++};=0D
++=0D
++// Test Description:=0D
++// Attempt to append an option to a packet that is too small by a duid th=
at is too large=0D
++TEST_F (Dhcp6AppendOptionTest, InvalidDataExpectBufferTooSmall) {=0D
++  UINT8           *Cursor;=0D
++  EFI_DHCP6_DUID  *UntrustedDuid;=0D
++  EFI_STATUS      Status;=0D
++=0D
++  UntrustedDuid =3D (EFI_DHCP6_DUID *)AllocateZeroPool (sizeof (EFI_DHCP6=
_DUID));=0D
++  ASSERT_NE (UntrustedDuid, (EFI_DHCP6_DUID *)NULL);=0D
++=0D
++  UntrustedDuid->Length =3D NTOHS (0xFFFF);=0D
++=0D
++  Cursor =3D Dhcp6AppendOptionTest::Packet->Dhcp6.Option;=0D
++=0D
++  Status =3D Dhcp6AppendOption (=0D
++             Dhcp6AppendOptionTest::Packet,=0D
++             &Cursor,=0D
++             HTONS (Dhcp6OptServerId),=0D
++             UntrustedDuid->Length,=0D
++             UntrustedDuid->Duid=0D
++             );=0D
++=0D
++  ASSERT_EQ (Status, EFI_BUFFER_TOO_SMALL);=0D
++}=0D
++=0D
++// Test Description:=0D
++// Attempt to append an option to a packet that is large enough=0D
++TEST_F (Dhcp6AppendOptionTest, ValidDataExpectSuccess) {=0D
++  UINT8           *Cursor;=0D
++  EFI_DHCP6_DUID  *UntrustedDuid;=0D
++  EFI_STATUS      Status;=0D
++  UINTN           OriginalLength;=0D
++=0D
++  UINT8  Duid[6] =3D { 0x00, 0x01, 0x02, 0x03, 0x04, 0x05 };=0D
++=0D
++  Packet->Length =3D sizeof (EFI_DHCP6_HEADER);=0D
++  OriginalLength =3D Packet->Length;=0D
++=0D
++  UntrustedDuid =3D (EFI_DHCP6_DUID *)AllocateZeroPool (sizeof (EFI_DHCP6=
_DUID));=0D
++  ASSERT_NE (UntrustedDuid, (EFI_DHCP6_DUID *)NULL);=0D
++=0D
++  UntrustedDuid->Length =3D NTOHS (sizeof (Duid));=0D
++  CopyMem (UntrustedDuid->Duid, Duid, sizeof (Duid));=0D
++=0D
++  Cursor =3D Dhcp6AppendOptionTest::Packet->Dhcp6.Option;=0D
++=0D
++  Status =3D Dhcp6AppendOption (=0D
++             Dhcp6AppendOptionTest::Packet,=0D
++             &Cursor,=0D
++             HTONS (Dhcp6OptServerId),=0D
++             UntrustedDuid->Length,=0D
++             UntrustedDuid->Duid=0D
++             );=0D
++=0D
++  ASSERT_EQ (Status, EFI_SUCCESS);=0D
++=0D
++  // verify that the pointer to cursor moved by the expected amount=0D
++  ASSERT_EQ (Cursor, (UINT8 *)Dhcp6AppendOptionTest::Packet->Dhcp6.Option=
 + sizeof (Duid) + 4);=0D
++=0D
++  // verify that the length of the packet is now the expected amount=0D
++  ASSERT_EQ (Dhcp6AppendOptionTest::Packet->Length, OriginalLength + size=
of (Duid) + 4);=0D
++}=0D
++=0D
++////////////////////////////////////////////////////////////////////////=
=0D
++// Dhcp6AppendETOption Tests=0D
++////////////////////////////////////////////////////////////////////////=
=0D
++=0D
++class Dhcp6AppendETOptionTest : public ::testing::Test {=0D
++public:=0D
++  UINT8 *Buffer =3D NULL;=0D
++  EFI_DHCP6_PACKET *Packet;=0D
++=0D
++protected:=0D
++  // Add any setup code if needed=0D
++  virtual void=0D
++  SetUp (=0D
++    )=0D
++  {=0D
++    // Initialize any resources or variables=0D
++    Buffer =3D (UINT8 *)AllocateZeroPool (DHCP6_PACKET_MAX_LEN);=0D
++    ASSERT_NE (Buffer, (UINT8 *)NULL);=0D
++=0D
++    Packet         =3D (EFI_DHCP6_PACKET *)Buffer;=0D
++    Packet->Size   =3D DHCP6_PACKET_MAX_LEN;=0D
++    Packet->Length =3D sizeof (EFI_DHCP6_HEADER);=0D
++  }=0D
++=0D
++  // Add any cleanup code if needed=0D
++  virtual void=0D
++  TearDown (=0D
++    )=0D
++  {=0D
++    // Clean up any resources or variables=0D
++    if (Buffer !=3D NULL) {=0D
++      FreePool (Buffer);=0D
++    }=0D
++  }=0D
++};=0D
++=0D
++// Test Description:=0D
++// Attempt to append an option to a packet that is too small by a duid th=
at is too large=0D
++TEST_F (Dhcp6AppendETOptionTest, InvalidDataExpectBufferTooSmall) {=0D
++  UINT8           *Cursor;=0D
++  EFI_STATUS      Status;=0D
++  DHCP6_INSTANCE  Instance;=0D
++  UINT16          ElapsedTimeVal;=0D
++  UINT16          *ElapsedTime;=0D
++=0D
++  Cursor      =3D Dhcp6AppendETOptionTest::Packet->Dhcp6.Option;=0D
++  ElapsedTime =3D &ElapsedTimeVal;=0D
++=0D
++  Packet->Length =3D Packet->Size - 2;=0D
++=0D
++  Status =3D Dhcp6AppendETOption (=0D
++             Dhcp6AppendETOptionTest::Packet,=0D
++             &Cursor,=0D
++             &Instance, // Instance is not used in this function=0D
++             &ElapsedTime=0D
++             );=0D
++=0D
++  // verify that we error out because the packet is too small for the opt=
ion header=0D
++  ASSERT_EQ (Status, EFI_BUFFER_TOO_SMALL);=0D
++=0D
++  // reset the length=0D
++  Packet->Length =3D sizeof (EFI_DHCP6_HEADER);=0D
++}=0D
++=0D
++// Test Description:=0D
++// Attempt to append an option to a packet that is large enough=0D
++TEST_F (Dhcp6AppendETOptionTest, ValidDataExpectSuccess) {=0D
++  UINT8           *Cursor;=0D
++  EFI_STATUS      Status;=0D
++  DHCP6_INSTANCE  Instance;=0D
++  UINT16          ElapsedTimeVal;=0D
++  UINT16          *ElapsedTime;=0D
++  UINTN           ExpectedSize;=0D
++  UINTN           OriginalLength;=0D
++=0D
++  Cursor         =3D Dhcp6AppendETOptionTest::Packet->Dhcp6.Option;=0D
++  ElapsedTime    =3D &ElapsedTimeVal;=0D
++  ExpectedSize   =3D 6;=0D
++  OriginalLength =3D Packet->Length;=0D
++=0D
++  Status =3D Dhcp6AppendETOption (=0D
++             Dhcp6AppendETOptionTest::Packet,=0D
++             &Cursor,=0D
++             &Instance, // Instance is not used in this function=0D
++             &ElapsedTime=0D
++             );=0D
++=0D
++  // verify that the status is EFI_SUCCESS=0D
++  ASSERT_EQ (Status, EFI_SUCCESS);=0D
++=0D
++  // verify that the pointer to cursor moved by the expected amount=0D
++  ASSERT_EQ (Cursor, (UINT8 *)Dhcp6AppendETOptionTest::Packet->Dhcp6.Opti=
on + ExpectedSize);=0D
++=0D
++  // verify that the length of the packet is now the expected amount=0D
++  ASSERT_EQ (Dhcp6AppendETOptionTest::Packet->Length, OriginalLength + Ex=
pectedSize);=0D
++}=0D
++=0D
++////////////////////////////////////////////////////////////////////////=
=0D
++// Dhcp6AppendIaOption Tests=0D
++////////////////////////////////////////////////////////////////////////=
=0D
++=0D
++class Dhcp6AppendIaOptionTest : public ::testing::Test {=0D
++public:=0D
++  UINT8 *Buffer =3D NULL;=0D
++  EFI_DHCP6_PACKET *Packet;=0D
++  EFI_DHCP6_IA *Ia;=0D
++=0D
++protected:=0D
++  // Add any setup code if needed=0D
++  virtual void=0D
++  SetUp (=0D
++    )=0D
++  {=0D
++    // Initialize any resources or variables=0D
++    Buffer =3D (UINT8 *)AllocateZeroPool (DHCP6_PACKET_MAX_LEN);=0D
++    ASSERT_NE (Buffer, (UINT8 *)NULL);=0D
++=0D
++    Packet       =3D (EFI_DHCP6_PACKET *)Buffer;=0D
++    Packet->Size =3D DHCP6_PACKET_MAX_LEN;=0D
++=0D
++    Ia =3D (EFI_DHCP6_IA *)AllocateZeroPool (sizeof (EFI_DHCP6_IA) + size=
of (EFI_DHCP6_IA_ADDRESS) * 2);=0D
++    ASSERT_NE (Ia, (EFI_DHCP6_IA *)NULL);=0D
++=0D
++    CopyMem (Ia->IaAddress, mAllDhcpRelayAndServersAddress.Addr, sizeof (=
EFI_IPv6_ADDRESS));=0D
++    CopyMem (Ia->IaAddress + 1, mAllDhcpRelayAndServersAddress.Addr, size=
of (EFI_IPv6_ADDRESS));=0D
++=0D
++    Ia->IaAddressCount =3D 2;=0D
++  }=0D
++=0D
++  // Add any cleanup code if needed=0D
++  virtual void=0D
++  TearDown (=0D
++    )=0D
++  {=0D
++    // Clean up any resources or variables=0D
++    if (Buffer !=3D NULL) {=0D
++      FreePool (Buffer);=0D
++    }=0D
++=0D
++    if (Ia !=3D NULL) {=0D
++      FreePool (Ia);=0D
++    }=0D
++  }=0D
++};=0D
++=0D
++// Test Description:=0D
++// Attempt to append an option to a packet that doesn't have enough space=
=0D
++// for the option header=0D
++TEST_F (Dhcp6AppendIaOptionTest, IaNaInvalidDataExpectBufferTooSmall) {=0D
++  UINT8       *Cursor;=0D
++  EFI_STATUS  Status;=0D
++=0D
++  Packet->Length =3D Packet->Size - 2;=0D
++=0D
++  Ia->Descriptor.Type =3D Dhcp6OptIana;=0D
++  Ia->Descriptor.IaId =3D 0x12345678;=0D
++=0D
++  Cursor =3D Dhcp6AppendIaOptionTest::Packet->Dhcp6.Option;=0D
++=0D
++  Status =3D Dhcp6AppendIaOption (=0D
++             Dhcp6AppendIaOptionTest::Packet,=0D
++             &Cursor,=0D
++             Ia,=0D
++             0x12345678,=0D
++             0x11111111,=0D
++             Dhcp6OptIana=0D
++             );=0D
++=0D
++  // verify that we error out because the packet is too small for the opt=
ion header=0D
++  ASSERT_EQ (Status, EFI_BUFFER_TOO_SMALL);=0D
++=0D
++  // reset the length=0D
++  Packet->Length =3D sizeof (EFI_DHCP6_HEADER);=0D
++}=0D
++=0D
++// Test Description:=0D
++// Attempt to append an option to a packet that doesn't have enough space=
=0D
++// for the option header=0D
++TEST_F (Dhcp6AppendIaOptionTest, IaTaInvalidDataExpectBufferTooSmall) {=0D
++  UINT8       *Cursor;=0D
++  EFI_STATUS  Status;=0D
++=0D
++  // Use up nearly all the space in the packet=0D
++  Packet->Length =3D Packet->Size - 2;=0D
++=0D
++  Ia->Descriptor.Type =3D Dhcp6OptIata;=0D
++  Ia->Descriptor.IaId =3D 0x12345678;=0D
++=0D
++  Cursor =3D Dhcp6AppendIaOptionTest::Packet->Dhcp6.Option;=0D
++=0D
++  Status =3D Dhcp6AppendIaOption (=0D
++             Dhcp6AppendIaOptionTest::Packet,=0D
++             &Cursor,=0D
++             Ia,=0D
++             0,=0D
++             0,=0D
++             Dhcp6OptIata=0D
++             );=0D
++=0D
++  // verify that we error out because the packet is too small for the opt=
ion header=0D
++  ASSERT_EQ (Status, EFI_BUFFER_TOO_SMALL);=0D
++=0D
++  // reset the length=0D
++  Packet->Length =3D sizeof (EFI_DHCP6_HEADER);=0D
++}=0D
++=0D
++TEST_F (Dhcp6AppendIaOptionTest, IaNaValidDataExpectSuccess) {=0D
++  UINT8       *Cursor;=0D
++  EFI_STATUS  Status;=0D
++  UINTN       ExpectedSize;=0D
++  UINTN       OriginalLength;=0D
++=0D
++  //=0D
++  // 2 bytes for the option header type=0D
++  //=0D
++  ExpectedSize =3D 2;=0D
++  //=0D
++  // 2 bytes for the option header length=0D
++  //=0D
++  ExpectedSize +=3D 2;=0D
++  //=0D
++  // 4 bytes for the IAID=0D
++  //=0D
++  ExpectedSize +=3D 4;=0D
++  //=0D
++  // + 4 bytes for the T1=0D
++  //=0D
++  ExpectedSize +=3D 4;=0D
++  //=0D
++  // + 4 bytes for the T2=0D
++  //=0D
++  ExpectedSize +=3D 4;=0D
++  //=0D
++  // + (4 + sizeof (EFI_DHCP6_IA_ADDRESS)) * 2;=0D
++  //   + 2 bytes for the option header type=0D
++  //   + 2 bytes for the option header length=0D
++  //   + sizeof (EFI_DHCP6_IA_ADDRESS) for the IA Address=0D
++  //=0D
++  ExpectedSize +=3D (4 + sizeof (EFI_DHCP6_IA_ADDRESS)) * 2;=0D
++=0D
++  Cursor =3D Dhcp6AppendIaOptionTest::Packet->Dhcp6.Option;=0D
++=0D
++  Packet->Length =3D sizeof (EFI_DHCP6_HEADER);=0D
++  OriginalLength =3D Packet->Length;=0D
++=0D
++  Ia->Descriptor.Type =3D Dhcp6OptIana;=0D
++  Ia->Descriptor.IaId =3D 0x12345678;=0D
++=0D
++  Status =3D Dhcp6AppendIaOption (=0D
++             Dhcp6AppendIaOptionTest::Packet,=0D
++             &Cursor,=0D
++             Ia,=0D
++             0x12345678,=0D
++             0x12345678,=0D
++             Dhcp6OptIana=0D
++             );=0D
++=0D
++  // verify that the pointer to cursor moved by the expected amount=0D
++  ASSERT_EQ (Cursor, (UINT8 *)Dhcp6AppendIaOptionTest::Packet->Dhcp6.Opti=
on + ExpectedSize);=0D
++=0D
++  // verify that the length of the packet is now the expected amount=0D
++  ASSERT_EQ (Dhcp6AppendIaOptionTest::Packet->Length, OriginalLength + Ex=
pectedSize);=0D
++=0D
++  // verify that the status is EFI_SUCCESS=0D
++  ASSERT_EQ (Status, EFI_SUCCESS);=0D
++}=0D
++=0D
++TEST_F (Dhcp6AppendIaOptionTest, IaTaValidDataExpectSuccess) {=0D
++  UINT8       *Cursor;=0D
++  EFI_STATUS  Status;=0D
++  UINTN       ExpectedSize;=0D
++  UINTN       OriginalLength;=0D
++=0D
++  //=0D
++  // 2 bytes for the option header type=0D
++  //=0D
++  ExpectedSize =3D 2;=0D
++  //=0D
++  // 2 bytes for the option header length=0D
++  //=0D
++  ExpectedSize +=3D 2;=0D
++  //=0D
++  // 4 bytes for the IAID=0D
++  //=0D
++  ExpectedSize +=3D 4;=0D
++  //=0D
++  // + (4 + sizeof (EFI_DHCP6_IA_ADDRESS)) * 2;=0D
++  //   + 2 bytes for the option header type=0D
++  //   + 2 bytes for the option header length=0D
++  //   + sizeof (EFI_DHCP6_IA_ADDRESS) for the IA Address=0D
++  //=0D
++  ExpectedSize +=3D (4 + sizeof (EFI_DHCP6_IA_ADDRESS)) * 2;=0D
++=0D
++  Cursor =3D Dhcp6AppendIaOptionTest::Packet->Dhcp6.Option;=0D
++=0D
++  Packet->Length =3D sizeof (EFI_DHCP6_HEADER);=0D
++  OriginalLength =3D Packet->Length;=0D
++=0D
++  Ia->Descriptor.Type =3D Dhcp6OptIata;=0D
++  Ia->Descriptor.IaId =3D 0x12345678;=0D
++=0D
++  Status =3D Dhcp6AppendIaOption (=0D
++             Dhcp6AppendIaOptionTest::Packet,=0D
++             &Cursor,=0D
++             Ia,=0D
++             0,=0D
++             0,=0D
++             Dhcp6OptIata=0D
++             );=0D
++=0D
++  // verify that the pointer to cursor moved by the expected amount=0D
++  ASSERT_EQ (Cursor, (UINT8 *)Dhcp6AppendIaOptionTest::Packet->Dhcp6.Opti=
on + ExpectedSize);=0D
++=0D
++  // verify that the length of the packet is now the expected amount=0D
++  ASSERT_EQ (Dhcp6AppendIaOptionTest::Packet->Length, OriginalLength + Ex=
pectedSize);=0D
++=0D
++  // verify that the status is EFI_SUCCESS=0D
++  ASSERT_EQ (Status, EFI_SUCCESS);=0D
++}=0D
+--=20
+2.40.0
+
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ov=
mf_git.bb
index 59e5598a1b..957a74aabe 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -33,6 +33,8 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=
=3Dmaster;protocol=3Dhttps \
            file://CVE-2022-36764-0001.patch \
            file://CVE-2022-36764-0002.patch \
            file://CVE-2022-36764-0003.patch \
+           file://CVE-2023-45230-0001.patch \
+           file://CVE-2023-45230-0002.patch \
            "
=20
 PV =3D "edk2-stable202202"
--=20
2.34.1


