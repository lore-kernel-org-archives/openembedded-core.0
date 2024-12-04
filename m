Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31516E77170
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 17:54:35 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.21447.1733334874381009127
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 09:54:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=QfK7c6is;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7fcc8533607so81984a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 09:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733334874; x=1733939674; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2MsgZZpDi+rqL51w4wNmVsolAe0Wj7MD0E8uu+RqxP8=;
        b=QfK7c6isWQxsnl8o2mq6Qq2XtmYslvy8x0LfZAFowZfy4QXJ0tIJwG4zguzUG3VRwG
         kQbmx1jvM9Pc8/rT0CtrnLAlyK09v6ZNnELiKAI2lw/zr2xvVSxMK60pNserwreV0gyx
         sMpvYIB4VqR1gZ4/90DrWUIm22985kd7oOdAb7MY+OvCkZwhXkrq/UODvbApVpStojL6
         8U7oi9k5TQX6KQAx5HSjdTq0nA0NjLYvDfgdWxk+DoeLN7czjflC/noiFwxunFCpo++P
         +5t2gniMabfgKBkqLQvs0fgVqsfPq2z/siJTEO1MoBhtt/ugVVmlAQ1v6ZHgkGhst5Xp
         0IoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733334874; x=1733939674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2MsgZZpDi+rqL51w4wNmVsolAe0Wj7MD0E8uu+RqxP8=;
        b=m1SF4h5cNv5le0ErwICb4pqliFlfFZ0KM08ODNAiAQvhayqMEnjCFRFK7dx8MsJape
         VrHeM9tqUXDNgKsFMKDKxXgP5YSwmzMfuUdeyNBl1BuFtNot9TUgwNOLRDe4iTjeg+mh
         vJc0hpJxbIEVQt0oERjKPKaqkS55aQ4cTXsNRtDW1vx3y0xtDtGWNl4IvWbU3qtD241o
         GeN4uNz3pRg+6/PlJJ2KUHDK5+PIu6JZSiQb4jPmBzfQhG42YHmHeCVXrhIwSpICTxtn
         vlwFsqrISOAKsfepSjXcVDhGMSiLDTrEuMQilQLRxQd814Q2fSRwPhMAnnRCuiZCWb/F
         hjCQ==
X-Gm-Message-State: AOJu0YwAZyCPNbPX+6xwTxmjhh70c6foHmjpxKP1fNjC6LHxpnM9UjfJ
	rJrOYhvH+lU9WdLaIwt2Q2Mqdwqo9PG1uzVq8GxVGtnZHHPba4u0ngOJ5Ke8QmFpaQIO6FsjOzJ
	3
X-Gm-Gg: ASbGncueEtcJ0Mnh7Mf0veA+uSOqUt3y6Mp8dKDYI+fI8Lg43xi1TcSyVDoGf0XsPtn
	eSUZOWCHm4+AIjmuesUdkQwRbHRc2BH+S5Qmd0x002L0dgoSQoJVvese0WhrYcKlcisc2qlbnHQ
	zjefNrt3QOVObp9j9yS8+S9d/GqD8n0Dj9aZBv2viC3jlcjJuAkAKKjM7jGoydxggKbahtWhABh
	AUfPO/JxrlYyc999dZrJVmAFOGS5KIe7sfso0U=
X-Google-Smtp-Source: AGHT+IGmGj4oOOC258+4bgYizRK5m7dm76RSd2Efj8mijw4yzWW2AoxBpLbsL+bOApibr3mlgHz0Og==
X-Received: by 2002:a05:6a20:2d13:b0:1e1:f5a:c027 with SMTP id adf61e73a8af0-1e165413276mr8713447637.43.1733334873054;
        Wed, 04 Dec 2024 09:54:33 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c2d5af1sm11727765a12.16.2024.12.04.09.54.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 09:54:32 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/38] ovmf: Fix CVE-2023-45236
Date: Wed,  4 Dec 2024 09:53:37 -0800
Message-Id: <a9cd3321558e95f61ed4c5eca0dcf5a3f4704925.1733334655.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733334655.git.steve@sakoman.com>
References: <cover.1733334655.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 17:54:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208293

From: Soumya Sambu <soumya.sambu@windriver.com>

EDK2's Network Package is susceptible to a predictable TCP Initial
Sequence Number. This vulnerability can be exploited by an attacker
to gain unauthorized access and potentially lead to a loss of
Confidentiality.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-45236

Upstream-patch:
https://github.com/tianocore/edk2/commit/1904a64bcc18199738e5be183d28887ac5=
d837d7

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../ovmf/ovmf/CVE-2023-45236.patch            | 829 ++++++++++++++++++
 meta/recipes-core/ovmf/ovmf_git.bb            |   1 +
 2 files changed, 830 insertions(+)
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2023-45236.patch

diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2023-45236.patch b/meta/recipe=
s-core/ovmf/ovmf/CVE-2023-45236.patch
new file mode 100644
index 0000000000..ac43392ce6
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/CVE-2023-45236.patch
@@ -0,0 +1,829 @@
+From 1904a64bcc18199738e5be183d28887ac5d837d7 Mon Sep 17 00:00:00 2001
+From: Doug Flick <dougflick@microsoft.com>
+Date: Wed, 8 May 2024 22:56:29 -0700
+Subject: [PATCH] NetworkPkg TcpDxe: SECURITY PATCH CVE-2023-45236
+
+REF: https://bugzilla.tianocore.org/show_bug.cgi?id=3D4541
+REF: https://www.rfc-editor.org/rfc/rfc1948.txt
+REF: https://www.rfc-editor.org/rfc/rfc6528.txt
+REF: https://www.rfc-editor.org/rfc/rfc9293.txt
+
+Bug Overview:
+PixieFail Bug #8
+CVE-2023-45236
+CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:C/C:L/I:N/A:N
+CWE-200 Exposure of Sensitive Information to an Unauthorized Actor
+
+Updates TCP ISN generation to use a cryptographic hash of the
+connection's identifying parameters and a secret key.
+This prevents an attacker from guessing the ISN used for some other
+connection.
+
+This is follows the guidance in RFC 1948, RFC 6528, and RFC 9293.
+
+RFC: 9293 Section 3.4.1.  Initial Sequence Number Selection
+
+   A TCP implementation MUST use the above type of "clock" for clock-
+   driven selection of initial sequence numbers (MUST-8), and SHOULD
+   generate its initial sequence numbers with the expression:
+
+   ISN =3D M + F(localip, localport, remoteip, remoteport, secretkey)
+
+   where M is the 4 microsecond timer, and F() is a pseudorandom
+   function (PRF) of the connection's identifying parameters ("localip,
+   localport, remoteip, remoteport") and a secret key ("secretkey")
+   (SHLD-1).  F() MUST NOT be computable from the outside (MUST-9), or
+   an attacker could still guess at sequence numbers from the ISN used
+   for some other connection.  The PRF could be implemented as a
+   cryptographic hash of the concatenation of the TCP connection
+   parameters and some secret data.  For discussion of the selection of
+   a specific hash algorithm and management of the secret key data,
+   please see Section 3 of [42].
+
+   For each connection there is a send sequence number and a receive
+   sequence number.  The initial send sequence number (ISS) is chosen by
+   the data sending TCP peer, and the initial receive sequence number
+   (IRS) is learned during the connection-establishing procedure.
+
+   For a connection to be established or initialized, the two TCP peers
+   must synchronize on each other's initial sequence numbers.  This is
+   done in an exchange of connection-establishing segments carrying a
+   control bit called "SYN" (for synchronize) and the initial sequence
+   numbers.  As a shorthand, segments carrying the SYN bit are also
+   called "SYNs".  Hence, the solution requires a suitable mechanism for
+   picking an initial sequence number and a slightly involved handshake
+   to exchange the ISNs.
+
+Cc: Saloni Kasbekar <saloni.kasbekar@intel.com>
+Cc: Zachary Clark-williams <zachary.clark-williams@intel.com>
+
+Signed-off-by: Doug Flick [MSFT] <doug.edk2@gmail.com>
+Reviewed-by: Saloni Kasbekar <saloni.kasbekar@intel.com>
+
+CVE: CVE-2023-45236
+
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/1904a6=
4bcc18199738e5be183d28887ac5d837d7]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ NetworkPkg/SecurityFixes.yaml |  22 +++
+ NetworkPkg/TcpDxe/TcpDriver.c |  92 ++++++++++++-
+ NetworkPkg/TcpDxe/TcpDxe.inf  |   8 +-
+ NetworkPkg/TcpDxe/TcpFunc.h   |  23 ++--
+ NetworkPkg/TcpDxe/TcpInput.c  |  13 +-
+ NetworkPkg/TcpDxe/TcpMain.h   |  59 ++++++--
+ NetworkPkg/TcpDxe/TcpMisc.c   | 244 ++++++++++++++++++++++++++++++++--
+ NetworkPkg/TcpDxe/TcpTimer.c  |   3 +-
+ 8 files changed, 415 insertions(+), 49 deletions(-)
+
+diff --git a/NetworkPkg/SecurityFixes.yaml b/NetworkPkg/SecurityFixes.yaml
+index 2b2c794697..ab355419cc 100644
+--- a/NetworkPkg/SecurityFixes.yaml
++++ b/NetworkPkg/SecurityFixes.yaml
+@@ -121,6 +121,28 @@ CVE_2023_45235:
+     - http://www.openwall.com/lists/oss-security/2024/01/16/2=0D
+     - http://packetstormsecurity.com/files/176574/PixieFail-Proof-Of-Conc=
epts.html=0D
+     - https://blog.quarkslab.com/pixiefail-nine-vulnerabilities-in-tianoc=
ores-edk-ii-ipv6-network-stack.html=0D
++CVE_2023_45236:=0D
++  commit_titles:=0D
++    - "NetworkPkg: TcpDxe: SECURITY PATCH CVE-2023-45236 Patch"=0D
++  cve: CVE-2023-45236=0D
++  date_reported: 2023-08-28 13:56 UTC=0D
++  description: "Bug 08 - edk2/NetworkPkg: Predictable TCP Initial Sequenc=
e Numbers"=0D
++  note:=0D
++  files_impacted:=0D
++    - NetworkPkg/Include/Library/NetLib.h=0D
++    - NetworkPkg/TcpDxe/TcpDriver.c=0D
++    - NetworkPkg/TcpDxe/TcpDxe.inf=0D
++    - NetworkPkg/TcpDxe/TcpFunc.h=0D
++    - NetworkPkg/TcpDxe/TcpInput.c=0D
++    - NetworkPkg/TcpDxe/TcpMain.h=0D
++    - NetworkPkg/TcpDxe/TcpMisc.c=0D
++    - NetworkPkg/TcpDxe/TcpTimer.c=0D
++  links:=0D
++    - https://bugzilla.tianocore.org/show_bug.cgi?id=3D4541=0D
++    - https://nvd.nist.gov/vuln/detail/CVE-2023-45236=0D
++    - http://www.openwall.com/lists/oss-security/2024/01/16/2=0D
++    - http://packetstormsecurity.com/files/176574/PixieFail-Proof-Of-Conc=
epts.html=0D
++    - https://blog.quarkslab.com/pixiefail-nine-vulnerabilities-in-tianoc=
ores-edk-ii-ipv6-network-stack.html=0D
+ CVE_2023_45237:=0D
+   commit_titles:=0D
+     - "NetworkPkg:: SECURITY PATCH CVE 2023-45237"=0D
+diff --git a/NetworkPkg/TcpDxe/TcpDriver.c b/NetworkPkg/TcpDxe/TcpDriver.c
+index 8fe6badd68..40bba4080c 100644
+--- a/NetworkPkg/TcpDxe/TcpDriver.c
++++ b/NetworkPkg/TcpDxe/TcpDriver.c
+@@ -83,6 +83,12 @@ EFI_SERVICE_BINDING_PROTOCOL  gTcpServiceBinding =3D {
+   TcpServiceBindingDestroyChild=0D
+ };=0D
+ =0D
++//=0D
++// This is the handle for the Hash2ServiceBinding Protocol instance this =
driver produces=0D
++// if the platform does not provide one.=0D
++//=0D
++EFI_HANDLE  mHash2ServiceHandle =3D NULL;=0D
++=0D
+ /**=0D
+   Create and start the heartbeat timer for the TCP driver.=0D
+ =0D
+@@ -165,6 +171,23 @@ TcpDriverEntryPoint (
+   EFI_STATUS  Status;=0D
+   UINT32      Random;=0D
+ =0D
++  //=0D
++  // Initialize the Secret used for hashing TCP sequence numbers=0D
++  //=0D
++  // Normally this should be regenerated periodically, but since=0D
++  // this is only used for UEFI networking and not a general purpose=0D
++  // operating system, it is not necessary to regenerate it.=0D
++  //=0D
++  Status =3D PseudoRandomU32 (&mTcpGlobalSecret);=0D
++  if (EFI_ERROR (Status)) {=0D
++    DEBUG ((DEBUG_ERROR, "%a failed to generate random number: %r\n", __f=
unc__, Status));=0D
++    return Status;=0D
++  }=0D
++=0D
++  //=0D
++  // Get a random number used to generate a random port number=0D
++  // Intentionally not linking this to mTcpGlobalSecret to avoid leaking =
information about the secret=0D
++  //=0D
+   Status =3D PseudoRandomU32 (&Random);=0D
+   if (EFI_ERROR (Status)) {=0D
+     DEBUG ((DEBUG_ERROR, "%a Failed to generate random number: %r\n", __f=
unc__, Status));=0D
+@@ -207,9 +230,8 @@ TcpDriverEntryPoint (
+   }=0D
+ =0D
+   //=0D
+-  // Initialize ISS and random port.=0D
++  // Initialize the random port.=0D
+   //=0D
+-  mTcpGlobalIss   =3D Random % mTcpGlobalIss;=0D
+   mTcp4RandomPort =3D (UINT16)(TCP_PORT_KNOWN + (Random % TCP_PORT_KNOWN)=
);=0D
+   mTcp6RandomPort =3D mTcp4RandomPort;=0D
+ =0D
+@@ -224,6 +246,8 @@ TcpDriverEntryPoint (
+   @param[in]  IpVersion          IP_VERSION_4 or IP_VERSION_6.=0D
+ =0D
+   @retval EFI_OUT_OF_RESOURCES   Failed to allocate some resources.=0D
++  @retval EFI_UNSUPPORTED        Service Binding Protocols are unavailabl=
e.=0D
++  @retval EFI_ALREADY_STARTED    The TCP driver is already started on the=
 controller.=0D
+   @retval EFI_SUCCESS            A new IP6 service binding private was cr=
eated.=0D
+ =0D
+ **/=0D
+@@ -234,11 +258,13 @@ TcpCreateService (
+   IN UINT8       IpVersion=0D
+   )=0D
+ {=0D
+-  EFI_STATUS        Status;=0D
+-  EFI_GUID          *IpServiceBindingGuid;=0D
+-  EFI_GUID          *TcpServiceBindingGuid;=0D
+-  TCP_SERVICE_DATA  *TcpServiceData;=0D
+-  IP_IO_OPEN_DATA   OpenData;=0D
++  EFI_STATUS                    Status;=0D
++  EFI_GUID                      *IpServiceBindingGuid;=0D
++  EFI_GUID                      *TcpServiceBindingGuid;=0D
++  TCP_SERVICE_DATA              *TcpServiceData;=0D
++  IP_IO_OPEN_DATA               OpenData;=0D
++  EFI_SERVICE_BINDING_PROTOCOL  *Hash2ServiceBinding;=0D
++  EFI_HASH2_PROTOCOL            *Hash2Protocol;=0D
+ =0D
+   if (IpVersion =3D=3D IP_VERSION_4) {=0D
+     IpServiceBindingGuid  =3D &gEfiIp4ServiceBindingProtocolGuid;=0D
+@@ -272,6 +298,33 @@ TcpCreateService (
+     return EFI_UNSUPPORTED;=0D
+   }=0D
+ =0D
++  Status =3D gBS->LocateProtocol (&gEfiHash2ProtocolGuid, NULL, (VOID **)=
&Hash2Protocol);=0D
++  if (EFI_ERROR (Status)) {=0D
++    //=0D
++    // If we can't find the Hashing protocol, then we need to create one.=
=0D
++    //=0D
++=0D
++    //=0D
++    // Platform is expected to publish the hash service binding protocol =
to support TCP.=0D
++    //=0D
++    Status =3D gBS->LocateProtocol (=0D
++                    &gEfiHash2ServiceBindingProtocolGuid,=0D
++                    NULL,=0D
++                    (VOID **)&Hash2ServiceBinding=0D
++                    );=0D
++    if (EFI_ERROR (Status) || (Hash2ServiceBinding =3D=3D NULL) || (Hash2=
ServiceBinding->CreateChild =3D=3D NULL)) {=0D
++      return EFI_UNSUPPORTED;=0D
++    }=0D
++=0D
++    //=0D
++    // Create an instance of the hash protocol for this controller.=0D
++    //=0D
++    Status =3D Hash2ServiceBinding->CreateChild (Hash2ServiceBinding, &mH=
ash2ServiceHandle);=0D
++    if (EFI_ERROR (Status)) {=0D
++      return EFI_UNSUPPORTED;=0D
++    }=0D
++  }=0D
++=0D
+   //=0D
+   // Create the TCP service data.=0D
+   //=0D
+@@ -423,6 +476,7 @@ TcpDestroyService (
+   EFI_STATUS                               Status;=0D
+   LIST_ENTRY                               *List;=0D
+   TCP_DESTROY_CHILD_IN_HANDLE_BUF_CONTEXT  Context;=0D
++  EFI_SERVICE_BINDING_PROTOCOL             *Hash2ServiceBinding;=0D
+ =0D
+   ASSERT ((IpVersion =3D=3D IP_VERSION_4) || (IpVersion =3D=3D IP_VERSION=
_6));=0D
+ =0D
+@@ -439,6 +493,30 @@ TcpDestroyService (
+     return EFI_SUCCESS;=0D
+   }=0D
+ =0D
++  //=0D
++  // Destroy the Hash2ServiceBinding instance if it is created by Tcp dri=
ver.=0D
++  //=0D
++  if (mHash2ServiceHandle !=3D NULL) {=0D
++    Status =3D gBS->LocateProtocol (=0D
++                    &gEfiHash2ServiceBindingProtocolGuid,=0D
++                    NULL,=0D
++                    (VOID **)&Hash2ServiceBinding=0D
++                    );=0D
++    if (EFI_ERROR (Status) || (Hash2ServiceBinding =3D=3D NULL) || (Hash2=
ServiceBinding->DestroyChild =3D=3D NULL)) {=0D
++      return EFI_UNSUPPORTED;=0D
++    }=0D
++=0D
++    //=0D
++    // Destroy the instance of the hashing protocol for this controller.=
=0D
++    //=0D
++    Status =3D Hash2ServiceBinding->DestroyChild (Hash2ServiceBinding, &m=
Hash2ServiceHandle);=0D
++    if (EFI_ERROR (Status)) {=0D
++      return EFI_UNSUPPORTED;=0D
++    }=0D
++=0D
++    mHash2ServiceHandle =3D NULL;=0D
++  }=0D
++=0D
+   Status =3D gBS->OpenProtocol (=0D
+                   NicHandle,=0D
+                   ServiceBindingGuid,=0D
+diff --git a/NetworkPkg/TcpDxe/TcpDxe.inf b/NetworkPkg/TcpDxe/TcpDxe.inf
+index cf5423f4c5..76de4cf9ec 100644
+--- a/NetworkPkg/TcpDxe/TcpDxe.inf
++++ b/NetworkPkg/TcpDxe/TcpDxe.inf
+@@ -6,6 +6,7 @@
+ #  stack has been loaded in system. This driver supports both IPv4 and IP=
v6 network stack.=0D
+ #=0D
+ #  Copyright (c) 2009 - 2018, Intel Corporation. All rights reserved.<BR>=
=0D
++#  Copyright (c) Microsoft Corporation=0D
+ #=0D
+ #  SPDX-License-Identifier: BSD-2-Clause-Patent=0D
+ #=0D
+@@ -68,7 +69,6 @@
+   NetLib=0D
+   IpIoLib=0D
+ =0D
+-=0D
+ [Protocols]=0D
+   ## SOMETIMES_CONSUMES=0D
+   ## SOMETIMES_PRODUCES=0D
+@@ -81,6 +81,12 @@
+   gEfiIp6ServiceBindingProtocolGuid             ## TO_START=0D
+   gEfiTcp6ProtocolGuid                          ## BY_START=0D
+   gEfiTcp6ServiceBindingProtocolGuid            ## BY_START=0D
++  gEfiHash2ProtocolGuid                         ## BY_START=0D
++  gEfiHash2ServiceBindingProtocolGuid           ## BY_START=0D
++=0D
++[Guids]=0D
++  gEfiHashAlgorithmMD5Guid                      ## CONSUMES=0D
++  gEfiHashAlgorithmSha256Guid                   ## CONSUMES=0D
+ =0D
+ [Depex]=0D
+   gEfiHash2ServiceBindingProtocolGuid=0D
+diff --git a/NetworkPkg/TcpDxe/TcpFunc.h b/NetworkPkg/TcpDxe/TcpFunc.h
+index a7af01fff2..c707bee3e5 100644
+--- a/NetworkPkg/TcpDxe/TcpFunc.h
++++ b/NetworkPkg/TcpDxe/TcpFunc.h
+@@ -2,7 +2,7 @@
+   Declaration of external functions shared in TCP driver.=0D
+ =0D
+   Copyright (c) 2009 - 2014, Intel Corporation. All rights reserved.<BR>=
=0D
+-=0D
++  Copyright (c) Microsoft Corporation=0D
+   SPDX-License-Identifier: BSD-2-Clause-Patent=0D
+ =0D
+ **/=0D
+@@ -36,8 +36,11 @@ VOID
+ =0D
+   @param[in, out]  Tcb               Pointer to the TCP_CB of this TCP in=
stance.=0D
+ =0D
++  @retval EFI_SUCCESS             The operation completed successfully=0D
++  @retval others                  The underlying functions failed and cou=
ld not complete the operation=0D
++=0D
+ **/=0D
+-VOID=0D
++EFI_STATUS=0D
+ TcpInitTcbLocal (=0D
+   IN OUT TCP_CB  *Tcb=0D
+   );=0D
+@@ -128,17 +131,6 @@ TcpCloneTcb (
+   IN TCP_CB  *Tcb=0D
+   );=0D
+ =0D
+-/**=0D
+-  Compute an ISS to be used by a new connection.=0D
+-=0D
+-  @return The result ISS.=0D
+-=0D
+-**/=0D
+-TCP_SEQNO=0D
+-TcpGetIss (=0D
+-  VOID=0D
+-  );=0D
+-=0D
+ /**=0D
+   Get the local mss.=0D
+ =0D
+@@ -202,8 +194,11 @@ TcpFormatNetbuf (
+   @param[in, out]  Tcb          Pointer to the TCP_CB that wants to initi=
ate a=0D
+                                 connection.=0D
+ =0D
++  @retval EFI_SUCCESS             The operation completed successfully=0D
++  @retval others                  The underlying functions failed and cou=
ld not complete the operation=0D
++=0D
+ **/=0D
+-VOID=0D
++EFI_STATUS=0D
+ TcpOnAppConnect (=0D
+   IN OUT TCP_CB  *Tcb=0D
+   );=0D
+diff --git a/NetworkPkg/TcpDxe/TcpInput.c b/NetworkPkg/TcpDxe/TcpInput.c
+index fb1aa827f8..0477a15d0c 100644
+--- a/NetworkPkg/TcpDxe/TcpInput.c
++++ b/NetworkPkg/TcpDxe/TcpInput.c
+@@ -724,6 +724,7 @@ TcpInput (
+   TCP_SEQNO   Urg;=0D
+   UINT16      Checksum;=0D
+   INT32       Usable;=0D
++  EFI_STATUS  Status;=0D
+ =0D
+   ASSERT ((Version =3D=3D IP_VERSION_4) || (Version =3D=3D IP_VERSION_6))=
;=0D
+ =0D
+@@ -872,7 +873,17 @@ TcpInput (
+       Tcb->LocalEnd.Port  =3D Head->DstPort;=0D
+       Tcb->RemoteEnd.Port =3D Head->SrcPort;=0D
+ =0D
+-      TcpInitTcbLocal (Tcb);=0D
++      Status =3D TcpInitTcbLocal (Tcb);=0D
++      if (EFI_ERROR (Status)) {=0D
++        DEBUG (=0D
++          (DEBUG_ERROR,=0D
++           "TcpInput: discard a segment because failed to init local end =
for TCB %p\n",=0D
++           Tcb)=0D
++          );=0D
++=0D
++        goto DISCARD;=0D
++      }=0D
++=0D
+       TcpInitTcbPeer (Tcb, Seg, &Option);=0D
+ =0D
+       TcpSetState (Tcb, TCP_SYN_RCVD);=0D
+diff --git a/NetworkPkg/TcpDxe/TcpMain.h b/NetworkPkg/TcpDxe/TcpMain.h
+index c0c9b7f46e..4d5566ab93 100644
+--- a/NetworkPkg/TcpDxe/TcpMain.h
++++ b/NetworkPkg/TcpDxe/TcpMain.h
+@@ -3,7 +3,7 @@
+   It is the common head file for all Tcp*.c in TCP driver.=0D
+ =0D
+   Copyright (c) 2009 - 2016, Intel Corporation. All rights reserved.<BR>=
=0D
+-=0D
++  Copyright (c) Microsoft Corporation=0D
+   SPDX-License-Identifier: BSD-2-Clause-Patent=0D
+ =0D
+ **/=0D
+@@ -13,6 +13,7 @@
+ =0D
+ #include <Protocol/ServiceBinding.h>=0D
+ #include <Protocol/DriverBinding.h>=0D
++#include <Protocol/Hash2.h>=0D
+ #include <Library/IpIoLib.h>=0D
+ #include <Library/DevicePathLib.h>=0D
+ #include <Library/PrintLib.h>=0D
+@@ -31,7 +32,7 @@ extern EFI_UNICODE_STRING_TABLE      *gTcpControllerName=
Table;
+ =0D
+ extern LIST_ENTRY  mTcpRunQue;=0D
+ extern LIST_ENTRY  mTcpListenQue;=0D
+-extern TCP_SEQNO   mTcpGlobalIss;=0D
++extern TCP_SEQNO   mTcpGlobalSecret;=0D
+ extern UINT32      mTcpTick;=0D
+ =0D
+ ///=0D
+@@ -45,14 +46,6 @@ extern UINT32      mTcpTick;
+ =0D
+ #define TCP_EXPIRE_TIME  65535=0D
+ =0D
+-///=0D
+-/// The implementation selects the initial send sequence number and the u=
nit to=0D
+-/// be added when it is increased.=0D
+-///=0D
+-#define TCP_BASE_ISS         0x4d7e980b=0D
+-#define TCP_ISS_INCREMENT_1  2048=0D
+-#define TCP_ISS_INCREMENT_2  100=0D
+-=0D
+ typedef union {=0D
+   EFI_TCP4_CONFIG_DATA    Tcp4CfgData;=0D
+   EFI_TCP6_CONFIG_DATA    Tcp6CfgData;=0D
+@@ -774,4 +767,50 @@ Tcp6Poll (
+   IN EFI_TCP6_PROTOCOL  *This=0D
+   );=0D
+ =0D
++/**=0D
++  Retrieves the Initial Sequence Number (ISN) for a TCP connection identi=
fied by local=0D
++  and remote IP addresses and ports.=0D
++=0D
++  This method is based on https://datatracker.ietf.org/doc/html/rfc9293#s=
ection-3.4.1=0D
++  Where the ISN is computed as follows:=0D
++    ISN =3D TimeStamp + MD5(LocalIP, LocalPort, RemoteIP, RemotePort, Sec=
ret)=0D
++=0D
++  Otherwise:=0D
++    ISN =3D M + F(localip, localport, remoteip, remoteport, secretkey)=0D
++=0D
++    "Here M is the 4 microsecond timer, and F() is a pseudorandom functio=
n (PRF) of the=0D
++    connection's identifying parameters ("localip, localport, remoteip, r=
emoteport")=0D
++    and a secret key ("secretkey") (SHLD-1). F() MUST NOT be computable f=
rom the=0D
++    outside (MUST-9), or an attacker could still guess at sequence number=
s from the=0D
++    ISN used for some other connection. The PRF could be implemented as a=
=0D
++    cryptographic hash of the concatenation of the TCP connection paramet=
ers and some=0D
++    secret data. For discussion of the selection of a specific hash algor=
ithm and=0D
++    management of the secret key data."=0D
++=0D
++  @param[in]       LocalIp        A pointer to the local IP address of th=
e TCP connection.=0D
++  @param[in]       LocalIpSize    The size, in bytes, of the LocalIp buff=
er.=0D
++  @param[in]       LocalPort      The local port number of the TCP connec=
tion.=0D
++  @param[in]       RemoteIp       A pointer to the remote IP address of t=
he TCP connection.=0D
++  @param[in]       RemoteIpSize   The size, in bytes, of the RemoteIp buf=
fer.=0D
++  @param[in]       RemotePort     The remote port number of the TCP conne=
ction.=0D
++  @param[out]      Isn            A pointer to the variable that will rec=
eive the Initial=0D
++                                  Sequence Number (ISN).=0D
++=0D
++  @retval EFI_SUCCESS             The operation completed successfully, a=
nd the ISN was=0D
++                                  retrieved.=0D
++  @retval EFI_INVALID_PARAMETER   One or more of the input parameters are=
 invalid.=0D
++  @retval EFI_UNSUPPORTED         The operation is not supported.=0D
++=0D
++**/=0D
++EFI_STATUS=0D
++TcpGetIsn (=0D
++  IN UINT8       *LocalIp,=0D
++  IN UINTN       LocalIpSize,=0D
++  IN UINT16      LocalPort,=0D
++  IN UINT8       *RemoteIp,=0D
++  IN UINTN       RemoteIpSize,=0D
++  IN UINT16      RemotePort,=0D
++  OUT TCP_SEQNO  *Isn=0D
++  );=0D
++=0D
+ #endif=0D
+diff --git a/NetworkPkg/TcpDxe/TcpMisc.c b/NetworkPkg/TcpDxe/TcpMisc.c
+index c93212d47d..3310306f63 100644
+--- a/NetworkPkg/TcpDxe/TcpMisc.c
++++ b/NetworkPkg/TcpDxe/TcpMisc.c
+@@ -3,7 +3,7 @@
+ =0D
+   (C) Copyright 2014 Hewlett-Packard Development Company, L.P.<BR>=0D
+   Copyright (c) 2009 - 2017, Intel Corporation. All rights reserved.<BR>=
=0D
+-=0D
++  Copyright (c) Microsoft Corporation=0D
+   SPDX-License-Identifier: BSD-2-Clause-Patent=0D
+ =0D
+ **/=0D
+@@ -20,7 +20,34 @@ LIST_ENTRY  mTcpListenQue =3D {
+   &mTcpListenQue=0D
+ };=0D
+ =0D
+-TCP_SEQNO  mTcpGlobalIss =3D TCP_BASE_ISS;=0D
++//=0D
++// The Session secret=0D
++// This must be initialized to a random value at boot time=0D
++//=0D
++TCP_SEQNO  mTcpGlobalSecret;=0D
++=0D
++//=0D
++// Union to hold either an IPv4 or IPv6 address=0D
++// This is used to simplify the ISN hash computation=0D
++//=0D
++typedef union {=0D
++  UINT8    IPv4[4];=0D
++  UINT8    IPv6[16];=0D
++} NETWORK_ADDRESS;=0D
++=0D
++//=0D
++// The ISN is computed by hashing this structure=0D
++// It is initialized with the local and remote IP addresses and ports=0D
++// and the secret=0D
++//=0D
++//=0D
++typedef struct {=0D
++  UINT16             LocalPort;=0D
++  UINT16             RemotePort;=0D
++  NETWORK_ADDRESS    LocalAddress;=0D
++  NETWORK_ADDRESS    RemoteAddress;=0D
++  TCP_SEQNO          Secret;=0D
++} ISN_HASH_CTX;=0D
+ =0D
+ CHAR16  *mTcpStateName[] =3D {=0D
+   L"TCP_CLOSED",=0D
+@@ -41,12 +68,18 @@ CHAR16  *mTcpStateName[] =3D {
+ =0D
+   @param[in, out]  Tcb               Pointer to the TCP_CB of this TCP in=
stance.=0D
+ =0D
++  @retval EFI_SUCCESS             The operation completed successfully=0D
++  @retval others                  The underlying functions failed and cou=
ld not complete the operation=0D
++=0D
+ **/=0D
+-VOID=0D
++EFI_STATUS=0D
+ TcpInitTcbLocal (=0D
+   IN OUT TCP_CB  *Tcb=0D
+   )=0D
+ {=0D
++  TCP_SEQNO   Isn;=0D
++  EFI_STATUS  Status;=0D
++=0D
+   //=0D
+   // Compute the checksum of the fixed parts of pseudo header=0D
+   //=0D
+@@ -57,6 +90,16 @@ TcpInitTcbLocal (
+                      0x06,=0D
+                      0=0D
+                      );=0D
++=0D
++    Status =3D TcpGetIsn (=0D
++               Tcb->LocalEnd.Ip.v4.Addr,=0D
++               sizeof (IPv4_ADDRESS),=0D
++               Tcb->LocalEnd.Port,=0D
++               Tcb->RemoteEnd.Ip.v4.Addr,=0D
++               sizeof (IPv4_ADDRESS),=0D
++               Tcb->RemoteEnd.Port,=0D
++               &Isn=0D
++               );=0D
+   } else {=0D
+     Tcb->HeadSum =3D NetIp6PseudoHeadChecksum (=0D
+                      &Tcb->LocalEnd.Ip.v6,=0D
+@@ -64,9 +107,25 @@ TcpInitTcbLocal (
+                      0x06,=0D
+                      0=0D
+                      );=0D
++=0D
++    Status =3D TcpGetIsn (=0D
++               Tcb->LocalEnd.Ip.v6.Addr,=0D
++               sizeof (IPv6_ADDRESS),=0D
++               Tcb->LocalEnd.Port,=0D
++               Tcb->RemoteEnd.Ip.v6.Addr,=0D
++               sizeof (IPv6_ADDRESS),=0D
++               Tcb->RemoteEnd.Port,=0D
++               &Isn=0D
++               );=0D
++  }=0D
++=0D
++  if (EFI_ERROR (Status)) {=0D
++    DEBUG ((DEBUG_ERROR, "TcpInitTcbLocal: failed to get isn\n"));=0D
++    ASSERT (FALSE);=0D
++    return Status;=0D
+   }=0D
+ =0D
+-  Tcb->Iss    =3D TcpGetIss ();=0D
++  Tcb->Iss    =3D Isn;=0D
+   Tcb->SndUna =3D Tcb->Iss;=0D
+   Tcb->SndNxt =3D Tcb->Iss;=0D
+ =0D
+@@ -82,6 +141,8 @@ TcpInitTcbLocal (
+   Tcb->RetxmitSeqMax =3D 0;=0D
+ =0D
+   Tcb->ProbeTimerOn =3D FALSE;=0D
++=0D
++  return EFI_SUCCESS;=0D
+ }=0D
+ =0D
+ /**=0D
+@@ -506,18 +567,162 @@ TcpCloneTcb (
+ }=0D
+ =0D
+ /**=0D
+-  Compute an ISS to be used by a new connection.=0D
+-=0D
+-  @return The resulting ISS.=0D
++  Retrieves the Initial Sequence Number (ISN) for a TCP connection identi=
fied by local=0D
++  and remote IP addresses and ports.=0D
++=0D
++  This method is based on https://datatracker.ietf.org/doc/html/rfc9293#s=
ection-3.4.1=0D
++  Where the ISN is computed as follows:=0D
++    ISN =3D TimeStamp + MD5(LocalIP, LocalPort, RemoteIP, RemotePort, Sec=
ret)=0D
++=0D
++  Otherwise:=0D
++    ISN =3D M + F(localip, localport, remoteip, remoteport, secretkey)=0D
++=0D
++    "Here M is the 4 microsecond timer, and F() is a pseudorandom functio=
n (PRF) of the=0D
++    connection's identifying parameters ("localip, localport, remoteip, r=
emoteport")=0D
++    and a secret key ("secretkey") (SHLD-1). F() MUST NOT be computable f=
rom the=0D
++    outside (MUST-9), or an attacker could still guess at sequence number=
s from the=0D
++    ISN used for some other connection. The PRF could be implemented as a=
=0D
++    cryptographic hash of the concatenation of the TCP connection paramet=
ers and some=0D
++    secret data. For discussion of the selection of a specific hash algor=
ithm and=0D
++    management of the secret key data."=0D
++=0D
++  @param[in]       LocalIp        A pointer to the local IP address of th=
e TCP connection.=0D
++  @param[in]       LocalIpSize    The size, in bytes, of the LocalIp buff=
er.=0D
++  @param[in]       LocalPort      The local port number of the TCP connec=
tion.=0D
++  @param[in]       RemoteIp       A pointer to the remote IP address of t=
he TCP connection.=0D
++  @param[in]       RemoteIpSize   The size, in bytes, of the RemoteIp buf=
fer.=0D
++  @param[in]       RemotePort     The remote port number of the TCP conne=
ction.=0D
++  @param[out]      Isn            A pointer to the variable that will rec=
eive the Initial=0D
++                                  Sequence Number (ISN).=0D
++=0D
++  @retval EFI_SUCCESS             The operation completed successfully, a=
nd the ISN was=0D
++                                  retrieved.=0D
++  @retval EFI_INVALID_PARAMETER   One or more of the input parameters are=
 invalid.=0D
++  @retval EFI_UNSUPPORTED         The operation is not supported.=0D
+ =0D
+ **/=0D
+-TCP_SEQNO=0D
+-TcpGetIss (=0D
+-  VOID=0D
++EFI_STATUS=0D
++TcpGetIsn (=0D
++  IN UINT8       *LocalIp,=0D
++  IN UINTN       LocalIpSize,=0D
++  IN UINT16      LocalPort,=0D
++  IN UINT8       *RemoteIp,=0D
++  IN UINTN       RemoteIpSize,=0D
++  IN UINT16      RemotePort,=0D
++  OUT TCP_SEQNO  *Isn=0D
+   )=0D
+ {=0D
+-  mTcpGlobalIss +=3D TCP_ISS_INCREMENT_1;=0D
+-  return mTcpGlobalIss;=0D
++  EFI_STATUS          Status;=0D
++  EFI_HASH2_PROTOCOL  *Hash2Protocol;=0D
++  EFI_HASH2_OUTPUT    HashResult;=0D
++  ISN_HASH_CTX        IsnHashCtx;=0D
++  EFI_TIME            TimeStamp;=0D
++=0D
++  //=0D
++  // Check that the ISN pointer is valid=0D
++  //=0D
++  if (Isn =3D=3D NULL) {=0D
++    return EFI_INVALID_PARAMETER;=0D
++  }=0D
++=0D
++  //=0D
++  // The local ip may be a v4 or v6 address and may not be NULL=0D
++  //=0D
++  if ((LocalIp =3D=3D NULL) || (LocalIpSize =3D=3D 0) || (RemoteIp =3D=3D=
 NULL) || (RemoteIpSize =3D=3D 0)) {=0D
++    return EFI_INVALID_PARAMETER;=0D
++  }=0D
++=0D
++  //=0D
++  // the local ip may be a v4 or v6 address=0D
++  //=0D
++  if ((LocalIpSize !=3D sizeof (EFI_IPv4_ADDRESS)) && (LocalIpSize !=3D s=
izeof (EFI_IPv6_ADDRESS))) {=0D
++    return EFI_INVALID_PARAMETER;=0D
++  }=0D
++=0D
++  //=0D
++  // Locate the Hash Protocol=0D
++  //=0D
++  Status =3D gBS->LocateProtocol (&gEfiHash2ProtocolGuid, NULL, (VOID **)=
&Hash2Protocol);=0D
++  if (EFI_ERROR (Status)) {=0D
++    DEBUG ((DEBUG_NET, "Failed to locate Hash Protocol: %r\n", Status));=
=0D
++=0D
++    //=0D
++    // TcpCreateService(..) is expected to be called prior to this functi=
on=0D
++    //=0D
++    ASSERT_EFI_ERROR (Status);=0D
++    return Status;=0D
++  }=0D
++=0D
++  //=0D
++  // Initialize the hash algorithm=0D
++  //=0D
++  Status =3D Hash2Protocol->HashInit (Hash2Protocol, &gEfiHashAlgorithmSh=
a256Guid);=0D
++  if (EFI_ERROR (Status)) {=0D
++    DEBUG ((DEBUG_NET, "Failed to initialize sha256 hash algorithm: %r\n"=
, Status));=0D
++    return Status;=0D
++  }=0D
++=0D
++  IsnHashCtx.LocalPort  =3D LocalPort;=0D
++  IsnHashCtx.RemotePort =3D RemotePort;=0D
++  IsnHashCtx.Secret     =3D mTcpGlobalSecret;=0D
++=0D
++  //=0D
++  // Check the IP address family and copy accordingly=0D
++  //=0D
++  if (LocalIpSize =3D=3D sizeof (EFI_IPv4_ADDRESS)) {=0D
++    CopyMem (&IsnHashCtx.LocalAddress.IPv4, LocalIp, LocalIpSize);=0D
++  } else if (LocalIpSize =3D=3D sizeof (EFI_IPv6_ADDRESS)) {=0D
++    CopyMem (&IsnHashCtx.LocalAddress.IPv6, LocalIp, LocalIpSize);=0D
++  } else {=0D
++    return EFI_INVALID_PARAMETER; // Unsupported address size=0D
++  }=0D
++=0D
++  //=0D
++  // Repeat the process for the remote IP address=0D
++  //=0D
++  if (RemoteIpSize =3D=3D sizeof (EFI_IPv4_ADDRESS)) {=0D
++    CopyMem (&IsnHashCtx.RemoteAddress.IPv4, RemoteIp, RemoteIpSize);=0D
++  } else if (RemoteIpSize =3D=3D sizeof (EFI_IPv6_ADDRESS)) {=0D
++    CopyMem (&IsnHashCtx.RemoteAddress.IPv6, RemoteIp, RemoteIpSize);=0D
++  } else {=0D
++    return EFI_INVALID_PARAMETER; // Unsupported address size=0D
++  }=0D
++=0D
++  //=0D
++  // Compute the hash=0D
++  // Update the hash with the data=0D
++  //=0D
++  Status =3D Hash2Protocol->HashUpdate (Hash2Protocol, (UINT8 *)&IsnHashC=
tx, sizeof (IsnHashCtx));=0D
++  if (EFI_ERROR (Status)) {=0D
++    DEBUG ((DEBUG_NET, "Failed to update hash: %r\n", Status));=0D
++    return Status;=0D
++  }=0D
++=0D
++  //=0D
++  // Finalize the hash and retrieve the result=0D
++  //=0D
++  Status =3D Hash2Protocol->HashFinal (Hash2Protocol, &HashResult);=0D
++  if (EFI_ERROR (Status)) {=0D
++    DEBUG ((DEBUG_NET, "Failed to finalize hash: %r\n", Status));=0D
++    return Status;=0D
++  }=0D
++=0D
++  Status =3D gRT->GetTime (&TimeStamp, NULL);=0D
++  if (EFI_ERROR (Status)) {=0D
++    return Status;=0D
++  }=0D
++=0D
++  //=0D
++  // copy the first 4 bytes of the hash result into the ISN=0D
++  //=0D
++  CopyMem (Isn, HashResult.Md5Hash, sizeof (*Isn));=0D
++=0D
++  //=0D
++  // now add the timestamp to the ISN as 4 microseconds units (1000 / 4 =
=3D 250)=0D
++  //=0D
++  *Isn +=3D (TCP_SEQNO)TimeStamp.Nanosecond * 250;=0D
++=0D
++  return Status;=0D
+ }=0D
+ =0D
+ /**=0D
+@@ -721,17 +926,28 @@ TcpFormatNetbuf (
+   @param[in, out]  Tcb          Pointer to the TCP_CB that wants to initi=
ate a=0D
+                                 connection.=0D
+ =0D
++  @retval EFI_SUCCESS             The operation completed successfully=0D
++  @retval others                  The underlying functions failed and cou=
ld not complete the operation=0D
++=0D
+ **/=0D
+-VOID=0D
++EFI_STATUS=0D
+ TcpOnAppConnect (=0D
+   IN OUT TCP_CB  *Tcb=0D
+   )=0D
+ {=0D
+-  TcpInitTcbLocal (Tcb);=0D
++  EFI_STATUS  Status;=0D
++=0D
++  Status =3D TcpInitTcbLocal (Tcb);=0D
++  if (EFI_ERROR (Status)) {=0D
++    return Status;=0D
++  }=0D
++=0D
+   TcpSetState (Tcb, TCP_SYN_SENT);=0D
+ =0D
+   TcpSetTimer (Tcb, TCP_TIMER_CONNECT, Tcb->ConnectTimeout);=0D
+   TcpToSendData (Tcb, 1);=0D
++=0D
++  return EFI_SUCCESS;=0D
+ }=0D
+ =0D
+ /**=0D
+diff --git a/NetworkPkg/TcpDxe/TcpTimer.c b/NetworkPkg/TcpDxe/TcpTimer.c
+index 5d2e124977..065b1bdf5f 100644
+--- a/NetworkPkg/TcpDxe/TcpTimer.c
++++ b/NetworkPkg/TcpDxe/TcpTimer.c
+@@ -2,7 +2,7 @@
+   TCP timer related functions.=0D
+ =0D
+   Copyright (c) 2009 - 2010, Intel Corporation. All rights reserved.<BR>=
=0D
+-=0D
++  Copyright (c) Microsoft Corporation=0D
+   SPDX-License-Identifier: BSD-2-Clause-Patent=0D
+ =0D
+ **/=0D
+@@ -483,7 +483,6 @@ TcpTickingDpc (
+   INT16       Index;=0D
+ =0D
+   mTcpTick++;=0D
+-  mTcpGlobalIss +=3D TCP_ISS_INCREMENT_2;=0D
+ =0D
+   //=0D
+   // Don't use LIST_FOR_EACH, which isn't delete safe.=0D
+--=20
+2.40.0
+
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ov=
mf_git.bb
index 47ed2c7cd3..dbfed086e4 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -49,6 +49,7 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=
=3Dmaster;protocol=3Dhttps \
            file://CVE-2023-45229-0004.patch \
            file://CVE-2023-45237-0001.patch \
            file://CVE-2023-45237-0002.patch \
+           file://CVE-2023-45236.patch \
            "
=20
 PV =3D "edk2-stable202202"
--=20
2.34.1


