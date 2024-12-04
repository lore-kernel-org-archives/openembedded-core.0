Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52C22E77177
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 17:54:35 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.21189.1733334866507303454
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 09:54:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=uQMQ1J8P;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-724e7d5d5b2so84058b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 09:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733334866; x=1733939666; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yB0VQ/f2eYYYow4snolDF07RpEKQx8hzK9qvOeAcbRA=;
        b=uQMQ1J8Px7LNgWFtAMaa5Z7bmf+1sH32SmsM9+/3zKreyd+Kh0dppEY8Oomq1/i0vQ
         rEEPmwSCtjjWBXmgy3sh4Hc/MN6jPmZMLcw26fMUUZyHmxEID3AYd3PoPIXuGb1E9Z2N
         /gs9/3PCflW9oUIes5ITTIyplKKIHARcZkV/PMcdlpV4nCTkRpMbUsTaw6FlS6DHBqHl
         YzEFhaiAHd3LhpVgsCrekWZ6FdO7EZZe2Lp2/oWAe8uixE9fRPD65Any/edwdJaHAno9
         xvIKtQNkV4qT6tqw0WVcP+b6dFx9bBoeww7Zr4FQVDKCeoEtxT17DwyeRieZh+sOzIWM
         1svA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733334866; x=1733939666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yB0VQ/f2eYYYow4snolDF07RpEKQx8hzK9qvOeAcbRA=;
        b=BqnMPwOCBlelPElZEiHuhQngFL3j5xQo52+L/eNJfpnc5wHiDcZzTqqcvA0JG11ZPX
         KZ04N4dw5jxm0S3ci8bBGlsBd8HPcGdm5D72WTYhw8yBcG09TINtKPlhTMQ3r7nMW/Z1
         SNGifEW04EQzz78eVjCCJ63u539SvnYMc6wfQEnY1or1mtksWitTFs9gffKX5nyKHhIm
         V99TkLwoiTHV0rEQUH5hVn1ZmuYI82rngexCoMBPjgH1tTEsrVPPB/JGupqMH6OXL/ZD
         xO40O5XuLW1AFOsIKpP236YAeFIDtovOQqjNqB+6lwzbzyzVs61eNxlqXN/fqjUnk6Im
         MpbA==
X-Gm-Message-State: AOJu0YwXTLpNGhQmUWZ3rE6RZgl/JkDbWiFxlAWwXzpjD2vhHtqcfqkH
	aLgoq+Mn1uTx7zgmsRu0T8FkCQCbeP38x63eYWGyX0mIgm9EFYx3JV8pAgtfP0m1IDWwbyRnDRx
	k
X-Gm-Gg: ASbGnctoVuojXSYrkwl2UH966xMu3x8cKcB0Kqpg+ORu5ybiCDoPSLw9eD0lI2rSl9T
	TS6eeX/mqVYx+SNoaNb91zSZmW2qlegnt+g4L2LL75rXZcix7PeqiWM5vvn5+9aJ3KRp8Oo1RJo
	sfC1q8+9a/JTP8dS7iSGG5UI4Xlo2F2nz4bXggbe2SwVSXHnuxpJe7I97U8Te5G1BEr7rE2CBxj
	7sPEPtgF04+ITDxgorz6E9fttOpEQrbgbtNUmQ=
X-Google-Smtp-Source: AGHT+IE7bsh5Z3G+v5iMS26gviaTM1Ddv6vcIDjJyx/AOgqMFc9LksY0cWmbRm08EUK2Kf3zYGplmg==
X-Received: by 2002:a05:6a00:2e1e:b0:724:fbdc:726e with SMTP id d2e1a72fcca58-7257fcd9f92mr12136069b3a.23.1733334865348;
        Wed, 04 Dec 2024 09:54:25 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c2d5af1sm11727765a12.16.2024.12.04.09.54.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 09:54:25 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/38] ovmf: Fix CVE-2023-45234
Date: Wed,  4 Dec 2024 09:53:33 -0800
Message-Id: <d9d9e66349ac0a2e58f54b104fb1b30f1633c1ab.1733334655.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733334655.git.steve@sakoman.com>
References: <cover.1733334655.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 17:54:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208289

From: Soumya Sambu <soumya.sambu@windriver.com>

EDK2's Network Package is susceptible to a buffer overflow vulnerability
when processing DNS Servers option from a DHCPv6 Advertise message. This
vulnerability can be exploited by an attacker to gain unauthorized access
and potentially lead to a loss of Confidentiality, Integrity and/or
Availability.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-45234

Upstream-patches:
https://github.com/tianocore/edk2/commit/1b53515d53d303166b2bbd31e2cc7f16fd=
0aecd7
https://github.com/tianocore/edk2/commit/458c582685fc0e8057d2511c5a0394078d=
988c17

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../ovmf/ovmf/CVE-2023-45234-0001.patch       | 154 ++++++
 .../ovmf/ovmf/CVE-2023-45234-0002.patch       | 485 ++++++++++++++++++
 meta/recipes-core/ovmf/ovmf_git.bb            |   2 +
 3 files changed, 641 insertions(+)
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2023-45234-0001.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2023-45234-0002.patch

diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2023-45234-0001.patch b/meta/r=
ecipes-core/ovmf/ovmf/CVE-2023-45234-0001.patch
new file mode 100644
index 0000000000..463b4b824d
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/CVE-2023-45234-0001.patch
@@ -0,0 +1,154 @@
+From 1b53515d53d303166b2bbd31e2cc7f16fd0aecd7 Mon Sep 17 00:00:00 2001
+From: Doug Flick <dougflick@microsoft.com>
+Date: Fri, 26 Jan 2024 05:54:52 +0800
+Subject: [PATCH] NetworkPkg: UefiPxeBcDxe: SECURITY PATCH CVE-2023-45234 P=
atch
+
+REF:https://bugzilla.tianocore.org/show_bug.cgi?id=3D4539
+
+Bug Details:
+PixieFail Bug #6
+CVE-2023-45234
+CVSS 8.3 : CVSS:3.1/AV:A/AC:L/PR:N/UI:N/S:U/C:H/I:L/A:H
+CWE-119 Improper Restriction of Operations within the Bounds of
+ a Memory Buffer
+
+Buffer overflow when processing DNS Servers option in a DHCPv6
+Advertise message
+
+Change Overview:
+
+Introduces a function to cache the Dns Server and perform sanitizing
+on the incoming DnsServerLen to ensure that the length is valid
+
+> + EFI_STATUS
+> + PxeBcCacheDnsServerAddresses (
+> +  IN PXEBC_PRIVATE_DATA        *Private,
+> +  IN PXEBC_DHCP6_PACKET_CACHE  *Cache6
+> +  )
+
+Additional code cleanup
+
+Cc: Saloni Kasbekar <saloni.kasbekar@intel.com>
+Cc: Zachary Clark-williams <zachary.clark-williams@intel.com>
+
+Signed-off-by: Doug Flick [MSFT] <doug.edk2@gmail.com>
+Reviewed-by: Saloni Kasbekar <saloni.kasbekar@intel.com>
+
+CVE: CVE-2023-45234
+
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/1b5351=
5d53d303166b2bbd31e2cc7f16fd0aecd7]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ NetworkPkg/UefiPxeBcDxe/PxeBcDhcp6.c | 71 +++++++++++++++++++++++++---
+ 1 file changed, 65 insertions(+), 6 deletions(-)
+
+diff --git a/NetworkPkg/UefiPxeBcDxe/PxeBcDhcp6.c b/NetworkPkg/UefiPxeBcDx=
e/PxeBcDhcp6.c
+index 425e0cf806..2b2d372889 100644
+--- a/NetworkPkg/UefiPxeBcDxe/PxeBcDhcp6.c
++++ b/NetworkPkg/UefiPxeBcDxe/PxeBcDhcp6.c
+@@ -3,6 +3,7 @@
+ =0D
+   (C) Copyright 2014 Hewlett-Packard Development Company, L.P.<BR>=0D
+   Copyright (c) 2009 - 2018, Intel Corporation. All rights reserved.<BR>=
=0D
++  Copyright (c) Microsoft Corporation=0D
+ =0D
+   SPDX-License-Identifier: BSD-2-Clause-Patent=0D
+ =0D
+@@ -1312,6 +1313,65 @@ PxeBcSelectDhcp6Offer (
+   }=0D
+ }=0D
+ =0D
++/**=0D
++  Cache the DHCPv6 DNS Server addresses=0D
++=0D
++  @param[in] Private               The pointer to PXEBC_PRIVATE_DATA.=0D
++  @param[in] Cache6                The pointer to PXEBC_DHCP6_PACKET_CACH=
E.=0D
++=0D
++  @retval    EFI_SUCCESS           Cache the DHCPv6 DNS Server address su=
ccessfully.=0D
++  @retval    EFI_OUT_OF_RESOURCES  Failed to allocate resources.=0D
++  @retval    EFI_DEVICE_ERROR      The DNS Server Address Length provided=
 by a untrusted=0D
++                                   option is not a multiple of 16 bytes (=
sizeof (EFI_IPv6_ADDRESS)).=0D
++**/=0D
++EFI_STATUS=0D
++PxeBcCacheDnsServerAddresses (=0D
++  IN PXEBC_PRIVATE_DATA        *Private,=0D
++  IN PXEBC_DHCP6_PACKET_CACHE  *Cache6=0D
++  )=0D
++{=0D
++  UINT16  DnsServerLen;=0D
++=0D
++  DnsServerLen =3D NTOHS (Cache6->OptList[PXEBC_DHCP6_IDX_DNS_SERVER]->Op=
Len);=0D
++  //=0D
++  // Make sure that the number is nonzero=0D
++  //=0D
++  if (DnsServerLen =3D=3D 0) {=0D
++    return EFI_DEVICE_ERROR;=0D
++  }=0D
++=0D
++  //=0D
++  // Make sure the DnsServerlen is a multiple of EFI_IPv6_ADDRESS (16)=0D
++  //=0D
++  if (DnsServerLen % sizeof (EFI_IPv6_ADDRESS) !=3D 0) {=0D
++    return EFI_DEVICE_ERROR;=0D
++  }=0D
++=0D
++  //=0D
++  // This code is currently written to only support a single DNS Server i=
nstead=0D
++  // of multiple such as is spec defined (RFC3646, Section 3). The proper=
 behavior=0D
++  // would be to allocate the full space requested, CopyMem all of the da=
ta,=0D
++  // and then add a DnsServerCount field to Private and update additional=
 code=0D
++  // that depends on this.=0D
++  //=0D
++  // To support multiple DNS servers the `AllocationSize` would need to b=
e changed to DnsServerLen=0D
++  //=0D
++  // This is tracked in https://bugzilla.tianocore.org/show_bug.cgi?id=3D=
1886=0D
++  //=0D
++  Private->DnsServer =3D AllocateZeroPool (sizeof (EFI_IPv6_ADDRESS));=0D
++  if (Private->DnsServer =3D=3D NULL) {=0D
++    return EFI_OUT_OF_RESOURCES;=0D
++  }=0D
++=0D
++  //=0D
++  // Intentionally only copy over the first server address.=0D
++  // To support multiple DNS servers, the `Length` would need to be chang=
ed to DnsServerLen=0D
++  //=0D
++  CopyMem (Private->DnsServer, Cache6->OptList[PXEBC_DHCP6_IDX_DNS_SERVER=
]->Data, sizeof (EFI_IPv6_ADDRESS));=0D
++=0D
++  return EFI_SUCCESS;=0D
++}=0D
++=0D
+ /**=0D
+   Handle the DHCPv6 offer packet.=0D
+ =0D
+@@ -1335,6 +1395,7 @@ PxeBcHandleDhcp6Offer (
+   UINT32                    SelectIndex;=0D
+   UINT32                    Index;=0D
+ =0D
++  ASSERT (Private !=3D NULL);=0D
+   ASSERT (Private->SelectIndex > 0);=0D
+   SelectIndex =3D (UINT32)(Private->SelectIndex - 1);=0D
+   ASSERT (SelectIndex < PXEBC_OFFER_MAX_NUM);=0D
+@@ -1342,15 +1403,13 @@ PxeBcHandleDhcp6Offer (
+   Status =3D EFI_SUCCESS;=0D
+ =0D
+   //=0D
+-  // First try to cache DNS server address if DHCP6 offer provides.=0D
++  // First try to cache DNS server addresses if DHCP6 offer provides.=0D
+   //=0D
+   if (Cache6->OptList[PXEBC_DHCP6_IDX_DNS_SERVER] !=3D NULL) {=0D
+-    Private->DnsServer =3D AllocateZeroPool (NTOHS (Cache6->OptList[PXEBC=
_DHCP6_IDX_DNS_SERVER]->OpLen));=0D
+-    if (Private->DnsServer =3D=3D NULL) {=0D
+-      return EFI_OUT_OF_RESOURCES;=0D
++    Status =3D PxeBcCacheDnsServerAddresses (Private, Cache6);=0D
++    if (EFI_ERROR (Status)) {=0D
++      return Status;=0D
+     }=0D
+-=0D
+-    CopyMem (Private->DnsServer, Cache6->OptList[PXEBC_DHCP6_IDX_DNS_SERV=
ER]->Data, sizeof (EFI_IPv6_ADDRESS));=0D
+   }=0D
+ =0D
+   if (Cache6->OfferType =3D=3D PxeOfferTypeDhcpBinl) {=0D
+--=20
+2.40.0
+
diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2023-45234-0002.patch b/meta/r=
ecipes-core/ovmf/ovmf/CVE-2023-45234-0002.patch
new file mode 100644
index 0000000000..4bc7ac16d6
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/CVE-2023-45234-0002.patch
@@ -0,0 +1,485 @@
+From 458c582685fc0e8057d2511c5a0394078d988c17 Mon Sep 17 00:00:00 2001
+From: Doug Flick <dougflick@microsoft.com>
+Date: Fri, 26 Jan 2024 05:54:53 +0800
+Subject: [PATCH] NetworkPkg: UefiPxeBcDxe: SECURITY PATCH CVE-2023-45234 U=
nit=20
+ Tests
+
+REF:https://bugzilla.tianocore.org/show_bug.cgi?id=3D4539
+
+Unit tests to that the bug..
+
+Buffer overflow when processing DNS Servers option in a DHCPv6 Advertise
+message
+
+..has been patched
+
+This contains tests for the following functions:
+PxeBcHandleDhcp6Offer
+PxeBcCacheDnsServerAddresses
+
+Cc: Saloni Kasbekar <saloni.kasbekar@intel.com>
+Cc: Zachary Clark-williams <zachary.clark-williams@intel.com>
+
+Signed-off-by: Doug Flick [MSFT] <doug.edk2@gmail.com>
+Reviewed-by: Saloni Kasbekar <saloni.kasbekar@intel.com>
+
+CVE: CVE-2023-45234
+
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/458c58=
2685fc0e8057d2511c5a0394078d988c17]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ .../GoogleTest/PxeBcDhcp6GoogleTest.cpp       | 300 ++++++++++++++++++
+ .../GoogleTest/PxeBcDhcp6GoogleTest.h         |  50 +++
+ .../GoogleTest/UefiPxeBcDxeGoogleTest.cpp     |  19 ++
+ .../GoogleTest/UefiPxeBcDxeGoogleTest.inf     |  48 +++
+ 4 files changed, 417 insertions(+)
+ create mode 100644 NetworkPkg/UefiPxeBcDxe/GoogleTest/PxeBcDhcp6GoogleTes=
t.cpp
+ create mode 100644 NetworkPkg/UefiPxeBcDxe/GoogleTest/PxeBcDhcp6GoogleTes=
t.h
+ create mode 100644 NetworkPkg/UefiPxeBcDxe/GoogleTest/UefiPxeBcDxeGoogleT=
est.cpp
+ create mode 100644 NetworkPkg/UefiPxeBcDxe/GoogleTest/UefiPxeBcDxeGoogleT=
est.inf
+
+diff --git a/NetworkPkg/UefiPxeBcDxe/GoogleTest/PxeBcDhcp6GoogleTest.cpp b=
/NetworkPkg/UefiPxeBcDxe/GoogleTest/PxeBcDhcp6GoogleTest.cpp
+new file mode 100644
+index 0000000000..8260eeee50
+--- /dev/null
++++ b/NetworkPkg/UefiPxeBcDxe/GoogleTest/PxeBcDhcp6GoogleTest.cpp
+@@ -0,0 +1,300 @@
++/** @file=0D
++  Host based unit test for PxeBcDhcp6.c.=0D
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
++  #include "../PxeBcImpl.h"=0D
++  #include "../PxeBcDhcp6.h"=0D
++  #include "PxeBcDhcp6GoogleTest.h"=0D
++}=0D
++=0D
++/////////////////////////////////////////////////////////////////////////=
//////=0D
++// Definitions=0D
++/////////////////////////////////////////////////////////////////////////=
//////=0D
++=0D
++#define PACKET_SIZE  (1500)=0D
++=0D
++typedef struct {=0D
++  UINT16    OptionCode;   // The option code for DHCP6_OPT_SERVER_ID (e.g=
., 0x03)=0D
++  UINT16    OptionLen;    // The length of the option (e.g., 16 bytes)=0D
++  UINT8     ServerId[16]; // The 16-byte DHCPv6 Server Identifier=0D
++} DHCP6_OPTION_SERVER_ID;=0D
++=0D
++/////////////////////////////////////////////////////////////////////////=
//////=0D
++/// Symbol Definitions=0D
++/////////////////////////////////////////////////////////////////////////=
//////=0D
++=0D
++EFI_STATUS=0D
++MockUdpWrite (=0D
++  IN EFI_PXE_BASE_CODE_PROTOCOL      *This,=0D
++  IN UINT16                          OpFlags,=0D
++  IN EFI_IP_ADDRESS                  *DestIp,=0D
++  IN EFI_PXE_BASE_CODE_UDP_PORT      *DestPort,=0D
++  IN EFI_IP_ADDRESS                  *GatewayIp   OPTIONAL,=0D
++  IN EFI_IP_ADDRESS                  *SrcIp       OPTIONAL,=0D
++  IN OUT EFI_PXE_BASE_CODE_UDP_PORT  *SrcPort     OPTIONAL,=0D
++  IN UINTN                           *HeaderSize  OPTIONAL,=0D
++  IN VOID                            *HeaderPtr   OPTIONAL,=0D
++  IN UINTN                           *BufferSize,=0D
++  IN VOID                            *BufferPtr=0D
++  )=0D
++{=0D
++  return EFI_SUCCESS;=0D
++}=0D
++=0D
++EFI_STATUS=0D
++MockUdpRead (=0D
++  IN EFI_PXE_BASE_CODE_PROTOCOL      *This,=0D
++  IN UINT16                          OpFlags,=0D
++  IN OUT EFI_IP_ADDRESS              *DestIp      OPTIONAL,=0D
++  IN OUT EFI_PXE_BASE_CODE_UDP_PORT  *DestPort    OPTIONAL,=0D
++  IN OUT EFI_IP_ADDRESS              *SrcIp       OPTIONAL,=0D
++  IN OUT EFI_PXE_BASE_CODE_UDP_PORT  *SrcPort     OPTIONAL,=0D
++  IN UINTN                           *HeaderSize  OPTIONAL,=0D
++  IN VOID                            *HeaderPtr   OPTIONAL,=0D
++  IN OUT UINTN                       *BufferSize,=0D
++  IN VOID                            *BufferPtr=0D
++  )=0D
++{=0D
++  return EFI_SUCCESS;=0D
++}=0D
++=0D
++EFI_STATUS=0D
++MockConfigure (=0D
++  IN EFI_UDP6_PROTOCOL     *This,=0D
++  IN EFI_UDP6_CONFIG_DATA  *UdpConfigData OPTIONAL=0D
++  )=0D
++{=0D
++  return EFI_SUCCESS;=0D
++}=0D
++=0D
++// Needed by PxeBcSupport=0D
++EFI_STATUS=0D
++EFIAPI=0D
++QueueDpc (=0D
++  IN EFI_TPL            DpcTpl,=0D
++  IN EFI_DPC_PROCEDURE  DpcProcedure,=0D
++  IN VOID               *DpcContext    OPTIONAL=0D
++  )=0D
++{=0D
++  return EFI_SUCCESS;=0D
++}=0D
++=0D
++/////////////////////////////////////////////////////////////////////////=
//////=0D
++// PxeBcHandleDhcp6OfferTest Tests=0D
++/////////////////////////////////////////////////////////////////////////=
//////=0D
++=0D
++class PxeBcHandleDhcp6OfferTest : public ::testing::Test {=0D
++public:=0D
++  PXEBC_PRIVATE_DATA Private =3D { 0 };=0D
++  EFI_UDP6_PROTOCOL Udp6Read;=0D
++  EFI_PXE_BASE_CODE_MODE Mode =3D { 0 };=0D
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
++=0D
++    // Need to setup the EFI_PXE_BASE_CODE_MODE=0D
++    Private.PxeBc.Mode =3D &Mode;=0D
++=0D
++    // for this test it doesn't really matter what the Dhcpv6 ack is set =
to=0D
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
++// Note:=0D
++// Testing PxeBcHandleDhcp6Offer() is difficult because it depends on a=0D
++// properly setup Private structure. Attempting to properly test this fun=
ction=0D
++// without a signficant refactor is a fools errand. Instead, we will test=
=0D
++// that we can prevent an overflow in the function.=0D
++TEST_F (PxeBcHandleDhcp6OfferTest, BasicUsageTest) {=0D
++  PXEBC_DHCP6_PACKET_CACHE  *Cache6 =3D NULL;=0D
++  EFI_DHCP6_PACKET_OPTION   Option  =3D { 0 };=0D
++=0D
++  Private.SelectIndex =3D 1; // SelectIndex is 1-based=0D
++  Cache6              =3D &Private.OfferBuffer[Private.SelectIndex - 1].D=
hcp6;=0D
++=0D
++  Cache6->OptList[PXEBC_DHCP6_IDX_DNS_SERVER] =3D &Option;=0D
++  // Setup the DHCPv6 offer packet=0D
++  Cache6->OptList[PXEBC_DHCP6_IDX_DNS_SERVER]->OpCode =3D DHCP6_OPT_SERVE=
R_ID;=0D
++  Cache6->OptList[PXEBC_DHCP6_IDX_DNS_SERVER]->OpLen  =3D NTOHS (1337);=0D
++=0D
++  ASSERT_EQ (PxeBcHandleDhcp6Offer (&(PxeBcHandleDhcp6OfferTest::Private)=
), EFI_DEVICE_ERROR);=0D
++}=0D
++=0D
++class PxeBcCacheDnsServerAddressesTest : public ::testing::Test {=0D
++public:=0D
++  PXEBC_PRIVATE_DATA Private =3D { 0 };=0D
++=0D
++protected:=0D
++  // Add any setup code if needed=0D
++  virtual void=0D
++  SetUp (=0D
++    )=0D
++  {=0D
++  }=0D
++=0D
++  // Add any cleanup code if needed=0D
++  virtual void=0D
++  TearDown (=0D
++    )=0D
++  {=0D
++  }=0D
++};=0D
++=0D
++// Test Description=0D
++// Test that we cache the DNS server address from the DHCPv6 offer packet=
=0D
++TEST_F (PxeBcCacheDnsServerAddressesTest, BasicUsageTest) {=0D
++  UINT8                     SearchPattern[16] =3D { 0xDE, 0xAD, 0xBE, 0xE=
F, 0xDE, 0xAD, 0xBE, 0xEF, 0xDE, 0xAD, 0xBE, 0xEF, 0xDE, 0xAD, 0xBE, 0xEF }=
;=0D
++  EFI_DHCP6_PACKET_OPTION   *Option;=0D
++  PXEBC_DHCP6_PACKET_CACHE  *Cache6 =3D NULL;=0D
++=0D
++  Option =3D (EFI_DHCP6_PACKET_OPTION *)AllocateZeroPool (sizeof (EFI_DHC=
P6_PACKET_OPTION) + sizeof (SearchPattern));=0D
++  ASSERT_NE (Option, nullptr);=0D
++=0D
++  Option->OpCode =3D DHCP6_OPT_SERVER_ID;=0D
++  Option->OpLen  =3D NTOHS (sizeof (SearchPattern));=0D
++  CopyMem (Option->Data, SearchPattern, sizeof (SearchPattern));=0D
++=0D
++  Private.SelectIndex                         =3D 1; // SelectIndex is 1-=
based=0D
++  Cache6                                      =3D &Private.OfferBuffer[Pr=
ivate.SelectIndex - 1].Dhcp6;=0D
++  Cache6->OptList[PXEBC_DHCP6_IDX_DNS_SERVER] =3D Option;=0D
++=0D
++  Private.DnsServer =3D nullptr;=0D
++=0D
++  ASSERT_EQ (PxeBcCacheDnsServerAddresses (&(PxeBcCacheDnsServerAddresses=
Test::Private), Cache6), EFI_SUCCESS);=0D
++  ASSERT_NE (Private.DnsServer, nullptr);=0D
++  ASSERT_EQ (CompareMem (Private.DnsServer, SearchPattern, sizeof (Search=
Pattern)), 0);=0D
++=0D
++  if (Private.DnsServer) {=0D
++    FreePool (Private.DnsServer);=0D
++  }=0D
++=0D
++  if (Option) {=0D
++    FreePool (Option);=0D
++  }=0D
++}=0D
++// Test Description=0D
++// Test that we can prevent an overflow in the function=0D
++TEST_F (PxeBcCacheDnsServerAddressesTest, AttemptOverflowTest) {=0D
++  EFI_DHCP6_PACKET_OPTION   Option  =3D { 0 };=0D
++  PXEBC_DHCP6_PACKET_CACHE  *Cache6 =3D NULL;=0D
++=0D
++  Private.SelectIndex                         =3D 1; // SelectIndex is 1-=
based=0D
++  Cache6                                      =3D &Private.OfferBuffer[Pr=
ivate.SelectIndex - 1].Dhcp6;=0D
++  Cache6->OptList[PXEBC_DHCP6_IDX_DNS_SERVER] =3D &Option;=0D
++  // Setup the DHCPv6 offer packet=0D
++  Cache6->OptList[PXEBC_DHCP6_IDX_DNS_SERVER]->OpCode =3D DHCP6_OPT_SERVE=
R_ID;=0D
++  Cache6->OptList[PXEBC_DHCP6_IDX_DNS_SERVER]->OpLen  =3D NTOHS (1337);=0D
++=0D
++  Private.DnsServer =3D NULL;=0D
++=0D
++  ASSERT_EQ (PxeBcCacheDnsServerAddresses (&(PxeBcCacheDnsServerAddresses=
Test::Private), Cache6), EFI_DEVICE_ERROR);=0D
++  ASSERT_EQ (Private.DnsServer, nullptr);=0D
++=0D
++  if (Private.DnsServer) {=0D
++    FreePool (Private.DnsServer);=0D
++  }=0D
++}=0D
++=0D
++// Test Description=0D
++// Test that we can prevent an underflow in the function=0D
++TEST_F (PxeBcCacheDnsServerAddressesTest, AttemptUnderflowTest) {=0D
++  EFI_DHCP6_PACKET_OPTION   Option  =3D { 0 };=0D
++  PXEBC_DHCP6_PACKET_CACHE  *Cache6 =3D NULL;=0D
++=0D
++  Private.SelectIndex                         =3D 1; // SelectIndex is 1-=
based=0D
++  Cache6                                      =3D &Private.OfferBuffer[Pr=
ivate.SelectIndex - 1].Dhcp6;=0D
++  Cache6->OptList[PXEBC_DHCP6_IDX_DNS_SERVER] =3D &Option;=0D
++  // Setup the DHCPv6 offer packet=0D
++  Cache6->OptList[PXEBC_DHCP6_IDX_DNS_SERVER]->OpCode =3D DHCP6_OPT_SERVE=
R_ID;=0D
++  Cache6->OptList[PXEBC_DHCP6_IDX_DNS_SERVER]->OpLen  =3D NTOHS (2);=0D
++=0D
++  Private.DnsServer =3D NULL;=0D
++=0D
++  ASSERT_EQ (PxeBcCacheDnsServerAddresses (&(PxeBcCacheDnsServerAddresses=
Test::Private), Cache6), EFI_DEVICE_ERROR);=0D
++  ASSERT_EQ (Private.DnsServer, nullptr);=0D
++=0D
++  if (Private.DnsServer) {=0D
++    FreePool (Private.DnsServer);=0D
++  }=0D
++}=0D
++=0D
++// Test Description=0D
++// Test that we can handle recursive dns (multiple dns entries)=0D
++TEST_F (PxeBcCacheDnsServerAddressesTest, MultipleDnsEntries) {=0D
++  EFI_DHCP6_PACKET_OPTION   Option  =3D { 0 };=0D
++  PXEBC_DHCP6_PACKET_CACHE  *Cache6 =3D NULL;=0D
++=0D
++  Private.SelectIndex                         =3D 1; // SelectIndex is 1-=
based=0D
++  Cache6                                      =3D &Private.OfferBuffer[Pr=
ivate.SelectIndex - 1].Dhcp6;=0D
++  Cache6->OptList[PXEBC_DHCP6_IDX_DNS_SERVER] =3D &Option;=0D
++  // Setup the DHCPv6 offer packet=0D
++  Cache6->OptList[PXEBC_DHCP6_IDX_DNS_SERVER]->OpCode =3D DHCP6_OPT_SERVE=
R_ID;=0D
++=0D
++  EFI_IPv6_ADDRESS  addresses[2] =3D {=0D
++    // 2001:db8:85a3::8a2e:370:7334=0D
++    { 0x20, 0x01, 0x0d, 0xb8, 0x85, 0xa3, 0x00, 0x00, 0x00, 0x00, 0x8a, 0=
x2e, 0x03, 0x70, 0x73, 0x34 },=0D
++    // fe80::d478:91c3:ecd7:4ff9=0D
++    { 0xfe, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xd4, 0x78, 0x91, 0=
xc3, 0xec, 0xd7, 0x4f, 0xf9 }=0D
++  };=0D
++=0D
++  CopyMem (Cache6->OptList[PXEBC_DHCP6_IDX_DNS_SERVER]->Data, &addresses,=
 sizeof (addresses));=0D
++=0D
++  Cache6->OptList[PXEBC_DHCP6_IDX_DNS_SERVER]->OpLen =3D NTOHS (sizeof (a=
ddresses));=0D
++=0D
++  Private.DnsServer =3D NULL;=0D
++=0D
++  ASSERT_EQ (PxeBcCacheDnsServerAddresses (&(PxeBcCacheDnsServerAddresses=
Test::Private), Cache6), EFI_SUCCESS);=0D
++=0D
++  ASSERT_NE (Private.DnsServer, nullptr);=0D
++=0D
++  //=0D
++  // This is expected to fail until DnsServer supports multiple DNS serve=
rs=0D
++  //=0D
++  // This is tracked in https://bugzilla.tianocore.org/show_bug.cgi?id=3D=
1886=0D
++  //=0D
++  // Disabling:=0D
++  // ASSERT_EQ (CompareMem(Private.DnsServer, &addresses, sizeof(addresse=
s)), 0);=0D
++=0D
++  if (Private.DnsServer) {=0D
++    FreePool (Private.DnsServer);=0D
++  }=0D
++}=0D
+diff --git a/NetworkPkg/UefiPxeBcDxe/GoogleTest/PxeBcDhcp6GoogleTest.h b/N=
etworkPkg/UefiPxeBcDxe/GoogleTest/PxeBcDhcp6GoogleTest.h
+new file mode 100644
+index 0000000000..b17c314791
+--- /dev/null
++++ b/NetworkPkg/UefiPxeBcDxe/GoogleTest/PxeBcDhcp6GoogleTest.h
+@@ -0,0 +1,50 @@
++/** @file=0D
++  This file exposes the internal interfaces which may be unit tested=0D
++  for the PxeBcDhcp6Dxe driver.=0D
++=0D
++  Copyright (c) Microsoft Corporation.<BR>=0D
++  SPDX-License-Identifier: BSD-2-Clause-Patent=0D
++**/=0D
++=0D
++#ifndef PXE_BC_DHCP6_GOOGLE_TEST_H_=0D
++#define PXE_BC_DHCP6_GOOGLE_TEST_H_=0D
++=0D
++//=0D
++// Minimal includes needed to compile=0D
++//=0D
++#include <Uefi.h>=0D
++#include "../PxeBcImpl.h"=0D
++=0D
++/**=0D
++  Handle the DHCPv6 offer packet.=0D
++=0D
++  @param[in]  Private             The pointer to PXEBC_PRIVATE_DATA.=0D
++=0D
++  @retval     EFI_SUCCESS           Handled the DHCPv6 offer packet succe=
ssfully.=0D
++  @retval     EFI_NO_RESPONSE       No response to the following request =
packet.=0D
++  @retval     EFI_OUT_OF_RESOURCES  Failed to allocate resources.=0D
++  @retval     EFI_BUFFER_TOO_SMALL  Can't cache the offer pacet.=0D
++=0D
++**/=0D
++EFI_STATUS=0D
++PxeBcHandleDhcp6Offer (=0D
++  IN PXEBC_PRIVATE_DATA  *Private=0D
++  );=0D
++=0D
++/**=0D
++  Cache the DHCPv6 Server address=0D
++=0D
++  @param[in] Private               The pointer to PXEBC_PRIVATE_DATA.=0D
++  @param[in] Cache6                The pointer to PXEBC_DHCP6_PACKET_CACH=
E.=0D
++=0D
++  @retval    EFI_SUCCESS           Cache the DHCPv6 Server address succes=
sfully.=0D
++  @retval    EFI_OUT_OF_RESOURCES  Failed to allocate resources.=0D
++  @retval    EFI_DEVICE_ERROR      Failed to cache the DHCPv6 Server addr=
ess.=0D
++**/=0D
++EFI_STATUS=0D
++PxeBcCacheDnsServerAddresses (=0D
++  IN PXEBC_PRIVATE_DATA        *Private,=0D
++  IN PXEBC_DHCP6_PACKET_CACHE  *Cache6=0D
++  );=0D
++=0D
++#endif // PXE_BC_DHCP6_GOOGLE_TEST_H_=0D
+diff --git a/NetworkPkg/UefiPxeBcDxe/GoogleTest/UefiPxeBcDxeGoogleTest.cpp=
 b/NetworkPkg/UefiPxeBcDxe/GoogleTest/UefiPxeBcDxeGoogleTest.cpp
+new file mode 100644
+index 0000000000..cc4fdf525b
+--- /dev/null
++++ b/NetworkPkg/UefiPxeBcDxe/GoogleTest/UefiPxeBcDxeGoogleTest.cpp
+@@ -0,0 +1,19 @@
++/** @file=0D
++  Acts as the main entry point for the tests for the UefiPxeBcDxe module.=
=0D
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
+diff --git a/NetworkPkg/UefiPxeBcDxe/GoogleTest/UefiPxeBcDxeGoogleTest.inf=
 b/NetworkPkg/UefiPxeBcDxe/GoogleTest/UefiPxeBcDxeGoogleTest.inf
+new file mode 100644
+index 0000000000..301dcdf611
+--- /dev/null
++++ b/NetworkPkg/UefiPxeBcDxe/GoogleTest/UefiPxeBcDxeGoogleTest.inf
+@@ -0,0 +1,48 @@
++## @file=0D
++# Unit test suite for the UefiPxeBcDxe using Google Test=0D
++#=0D
++# Copyright (c) Microsoft Corporation.<BR>=0D
++# SPDX-License-Identifier: BSD-2-Clause-Patent=0D
++##=0D
++[Defines]=0D
++INF_VERSION    =3D 0x00010005=0D
++BASE_NAME      =3D UefiPxeBcDxeGoogleTest=0D
++FILE_GUID      =3D 77D45C64-EC1E-4174-887B-886E89FD1EDF=0D
++MODULE_TYPE    =3D HOST_APPLICATION=0D
++VERSION_STRING =3D 1.0=0D
++=0D
++#=0D
++# The following information is for reference only and not required by the=
 build tools.=0D
++#=0D
++#  VALID_ARCHITECTURES           =3D IA32 X64=0D
++#=0D
++=0D
++[Sources]=0D
++  UefiPxeBcDxeGoogleTest.cpp=0D
++  PxeBcDhcp6GoogleTest.cpp=0D
++  PxeBcDhcp6GoogleTest.h=0D
++  ../PxeBcDhcp6.c=0D
++  ../PxeBcSupport.c=0D
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
++  gEfiDns6ServiceBindingProtocolGuid=0D
++  gEfiDns6ProtocolGuid=0D
++=0D
++[Pcd]=0D
++  gEfiNetworkPkgTokenSpaceGuid.PcdDhcp6UidType=0D
++=0D
++[Guids]=0D
++  gZeroGuid=0D
+--=20
+2.40.0
+
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ov=
mf_git.bb
index fc87cdf441..ac6a0a40e7 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -39,6 +39,8 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=
=3Dmaster;protocol=3Dhttps \
            file://CVE-2023-45231-0002.patch \
            file://CVE-2023-45232-CVE-2023-45233-0001.patch \
            file://CVE-2023-45232-CVE-2023-45233-0002.patch \
+           file://CVE-2023-45234-0001.patch \
+           file://CVE-2023-45234-0002.patch \
            "
=20
 PV =3D "edk2-stable202202"
--=20
2.34.1


