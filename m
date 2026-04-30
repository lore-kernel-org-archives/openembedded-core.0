Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8A26FF8875
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 09:25:30 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16263.1777541120545506012
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2026 02:25:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=oOS0AxiJ;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso7020985e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 02:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777541119; x=1778145919; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vutZ4PqugDQ3GlOETcCf56vOb41V8KlPJMbfOna8cCE=;
        b=oOS0AxiJWxEIk+L17qBlT3BtSKTZOFGYcymp4mOovt1P5Tkxlt+sg5iM0Kh7uU/hww
         0mTth0Dl9cPwa/Ma6i3dWXSGI6SfdjgdaADilxlGFhs5SQI8kDNLo6pF9DEIDaipgH9x
         YTuto0LrUNLorrCOdbyjy+jGvO+6t3ljBKle0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777541119; x=1778145919;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vutZ4PqugDQ3GlOETcCf56vOb41V8KlPJMbfOna8cCE=;
        b=AD56mEaFj57bWvyr9nfkKdtbHygmNVK4QNHFt9aUlo+NR3vDE5xburdZg68rEJlfVE
         gyHH1rqcG1yTaRBacdoura1Oa4Y67QQ8/qc0HMFPFLUG1laZ1B8ysf21/FmZzw+TGeq1
         imydjA6F3vTtwzNX3YfhFGlbQKrIL43npIdG9rRSuUxaYfKpxYy5/ucq+0oFkbVWEAt1
         dfYBv/SRuG4HK1t0hjkSDVo/zfbGSkpSwiMnN0fZcY57KXidmdUTsJZnQQJle04nbEid
         34szncb0ivyM7AVuhXhEPZk3sJd6nHslWCFPAgsvEtnBT0LbowwgE4QEHI6bv/CkxZ/4
         FCuA==
X-Forwarded-Encrypted: i=1; AFNElJ/pQSkxNwRB7tROR2/m4AGQZp/j2GwU+kyXqO65m6bu5W+CuGzw+3rFGJoP7QJCAj8iyJqWs7oVUckwNDRjUkNh4w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxYqTen3MX0VvHnNVydFFtsqhfw+YWLjksnFiwDpBcs0vAV7/mw
	+hFO6DRan6l3Bm4zTIW1iCFDegDFebBgTDipmslbn63U9N4eXUbQWPc6llXA3h+kWSM=
X-Gm-Gg: AeBDieuUO70n/bpM9BGSmx2WunxxEMAtXFzYGhO4/fGZr4gTx6WBckEvuUlZhMk6G2A
	17dQWqTDtuUDh/ZNVLM9Pgtf83Zi+vgeYCCOEW5sSe9QZhZPaIbHhHqgqORFKTLMzwx9aP6CR0q
	MxngHl1s+9d1Zpf6K+cImJF9gR7LY10DZFrcvfHrg6m56Xm6rhTx9VZ74BrFZG7nBeRLJEuPJ/h
	X5OdtGcvvUoCzQji1H5LYlZP9LruWFSWyndAJCnfIVaKYxyZcmPxnfMtMeSdJAZkFznzMglS+sW
	lx/bJdWRJJ+Q5G7l/3YVWWGvaHG3nt+lIeRvHaXcNPg+1vOymnyOMTvHT7ddsXSh+4sE7xKxHxW
	sOCeoGCZ8dAWkxIbIje1nEoZ2NutzZ5kORcIriIcaMKyEMPFmG78nnpjjtbghkpGVj7K97wc5gS
	QMPgpC6wr8JaRHa/HPZm6Wi7DcKY3nKan3YUcypQsNKz6Xxs/wxQXTS4sroTaGZshBKzaqCgEBr
	m01nqJZ3L33CLjMvvl9So7QcdUAUlHG6C37GQ==
X-Received: by 2002:a05:600c:6d2:b0:48a:7b7b:c2b9 with SMTP id 5b1f17b1804b1-48a8425667emr20285455e9.4.1777541118750;
        Thu, 30 Apr 2026 02:25:18 -0700 (PDT)
Received: from localhost ([2a01:e0a:8cc:5b00:b8fa:c45c:f26d:53a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81b9493bsm47978185e9.0.2026.04.30.02.25.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 02:25:18 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Apr 2026 11:25:17 +0200
Message-Id: <DI6DQKDSGHF1.244EBN969P2YA@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH 3/3] ovmf: fix CVE-2024-38798
From: "Fabien Thomas" <fabien.thomas@smile.fr>
To: <hongxu.jia@windriver.com>, <openembedded-core@lists.openembedded.org>,
 <yoann.congal@smile.fr>
X-Mailer: aerc 0.21.0
References: <20260427045650.2365793-1-hongxu.jia@windriver.com>
 <20260427045650.2365793-3-hongxu.jia@windriver.com>
In-Reply-To: <20260427045650.2365793-3-hongxu.jia@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 09:25:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236150

On Mon Apr 27, 2026 at 6:56 AM CEST, hongxu via lists.openembedded.org wrot=
e:
> According to [1],
>
>   EDK2 contains a vulnerability in BIOS where an attacker may cause =E2=
=80=9CExposure of
>   Sensitive Information to an Unauthorized Actor=E2=80=9D by local access=
. Successful
>   exploitation of this vulnerability will lead to possible information di=
sclosure
>   or escalation of privilege and impact Confidentiality.
>
> Backport a patch [2] from upstream to fix CVE-2024-38798
>
> [1] https://nvd.nist.gov/vuln/detail/CVE-2024-38798
> [2] https://github.com/tianocore/edk2/commit/0cad130cb4885961da201bb9b084=
24b3fd3d2249
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  .../ovmf/ovmf/CVE-2024-38798.patch            | 116 ++++++++++++++++++
>  meta/recipes-core/ovmf/ovmf_git.bb            |   1 +
>  2 files changed, 117 insertions(+)
>  create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2024-38798.patch
>
> diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2024-38798.patch b/meta/reci=
pes-core/ovmf/ovmf/CVE-2024-38798.patch
> new file mode 100644
> index 0000000000..2d0a73c7a6
> --- /dev/null
> +++ b/meta/recipes-core/ovmf/ovmf/CVE-2024-38798.patch
> @@ -0,0 +1,116 @@
> +From 81263e46ad8cf2a6c7d86bc51c95342d07ec31ca Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Mon, 5 Jan 2026 13:04:18 +0800
> +Subject: [PATCH] MdeModulePkg : Clear keyboard queue buffer after readin=
g
> +
> +There is a possibility to retrieve user input keystroke data stored in t=
he
> +queue buffer via the EFI_SIMPLE_TEXT_INPUT_PROTOCOL pointer. To prevent
> +exposure of the password string, clear the queue buffer by filling it
> +with zeros after reading.
> +
> +Signed-off-by: Nick Wang <nick.wang@insyde.com>
> +
> +CVE: CVE-2024-38798
> +Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/0cad=
130cb4885961da201bb9b08424b3fd3d2249]
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + MdeModulePkg/Bus/Isa/Ps2KeyboardDxe/Ps2KbdCtrller.c       | 2 ++
> + MdeModulePkg/Bus/Isa/Ps2KeyboardDxe/Ps2KbdTextIn.c        | 1 +
> + MdeModulePkg/Bus/Usb/UsbKbDxe/KeyBoard.c                  | 2 +-
> + .../Universal/Console/ConSplitterDxe/ConSplitter.c        | 1 +
> + .../Universal/Console/TerminalDxe/TerminalConIn.c         | 8 ++++++--
> + 5 files changed, 11 insertions(+), 3 deletions(-)
> +
> +diff --git a/MdeModulePkg/Bus/Isa/Ps2KeyboardDxe/Ps2KbdCtrller.c b/MdeMo=
dulePkg/Bus/Isa/Ps2KeyboardDxe/Ps2KbdCtrller.c
> +index 981309f..32757a7 100644
> +--- a/MdeModulePkg/Bus/Isa/Ps2KeyboardDxe/Ps2KbdCtrller.c
> ++++ b/MdeModulePkg/Bus/Isa/Ps2KeyboardDxe/Ps2KbdCtrller.c
> +@@ -650,6 +650,8 @@ PopScancodeBufHead (
> +     if (Buf !=3D NULL) {
> +       Buf[Index] =3D Queue->Buffer[Queue->Head];
> +     }
> ++
> ++    Queue->Buffer[Queue->Head] =3D 0;
> +   }
> +=20
> +   return EFI_SUCCESS;
> +diff --git a/MdeModulePkg/Bus/Isa/Ps2KeyboardDxe/Ps2KbdTextIn.c b/MdeMod=
ulePkg/Bus/Isa/Ps2KeyboardDxe/Ps2KbdTextIn.c
> +index 81d3c6e..e03c88f 100644
> +--- a/MdeModulePkg/Bus/Isa/Ps2KeyboardDxe/Ps2KbdTextIn.c
> ++++ b/MdeModulePkg/Bus/Isa/Ps2KeyboardDxe/Ps2KbdTextIn.c
> +@@ -51,6 +51,7 @@ PopEfikeyBufHead (
> +     CopyMem (KeyData, &Queue->Buffer[Queue->Head], sizeof (EFI_KEY_DATA=
));
> +   }
> +=20
> ++  ZeroMem (&Queue->Buffer[Queue->Head], sizeof (EFI_KEY_DATA));
> +   Queue->Head =3D (Queue->Head + 1) % KEYBOARD_EFI_KEY_MAX_COUNT;
> +   return EFI_SUCCESS;
> + }
> +diff --git a/MdeModulePkg/Bus/Usb/UsbKbDxe/KeyBoard.c b/MdeModulePkg/Bus=
/Usb/UsbKbDxe/KeyBoard.c
> +index b5a6459..7df1566 100644
> +--- a/MdeModulePkg/Bus/Usb/UsbKbDxe/KeyBoard.c
> ++++ b/MdeModulePkg/Bus/Usb/UsbKbDxe/KeyBoard.c
> +@@ -1840,7 +1840,7 @@ Dequeue (
> +   }
> +=20
> +   CopyMem (Item, Queue->Buffer[Queue->Head], ItemSize);
> +-
> ++  ZeroMem (Queue->Buffer[Queue->Head], ItemSize);
> +   //
> +   // Adjust the head pointer of the FIFO keyboard buffer.
> +   //
> +diff --git a/MdeModulePkg/Universal/Console/ConSplitterDxe/ConSplitter.c=
 b/MdeModulePkg/Universal/Console/ConSplitterDxe/ConSplitter.c
> +index 0a776f3..5c1a35e 100644
> +--- a/MdeModulePkg/Universal/Console/ConSplitterDxe/ConSplitter.c
> ++++ b/MdeModulePkg/Universal/Console/ConSplitterDxe/ConSplitter.c
> +@@ -3537,6 +3537,7 @@ ConSplitterTextInExDequeueKey (
> +     &Private->KeyQueue[1],
> +     Private->CurrentNumberOfKeys * sizeof (EFI_KEY_DATA)
> +     );
> ++  ZeroMem (&Private->KeyQueue[Private->CurrentNumberOfKeys], sizeof (EF=
I_KEY_DATA));
> +   return EFI_SUCCESS;
> + }
> +=20
> +diff --git a/MdeModulePkg/Universal/Console/TerminalDxe/TerminalConIn.c =
b/MdeModulePkg/Universal/Console/TerminalDxe/TerminalConIn.c
> +index f1d0a34..8aafb4b 100644
> +--- a/MdeModulePkg/Universal/Console/TerminalDxe/TerminalConIn.c
> ++++ b/MdeModulePkg/Universal/Console/TerminalDxe/TerminalConIn.c
> +@@ -760,7 +760,8 @@ RawFiFoRemoveOneKey (
> +     return FALSE;
> +   }
> +=20
> +-  *Output =3D TerminalDevice->RawFiFo->Data[Head];
> ++  *Output                             =3D TerminalDevice->RawFiFo->Data=
[Head];
> ++  TerminalDevice->RawFiFo->Data[Head] =3D 0;
> +=20
> +   TerminalDevice->RawFiFo->Head =3D (UINT8)((Head + 1) % (RAW_FIFO_MAX_=
NUMBER + 1));
> +=20
> +@@ -881,6 +882,7 @@ EfiKeyFiFoForNotifyRemoveOneKey (
> +   }
> +=20
> +   CopyMem (Output, &EfiKeyFiFo->Data[Head], sizeof (EFI_INPUT_KEY));
> ++  ZeroMem (&EfiKeyFiFo->Data[Head], sizeof (EFI_INPUT_KEY));
> +=20
> +   EfiKeyFiFo->Head =3D (UINT8)((Head + 1) % (FIFO_MAX_NUMBER + 1));
> +=20
> +@@ -1032,6 +1034,7 @@ EfiKeyFiFoRemoveOneKey (
> +   }
> +=20
> +   CopyMem (Output, &TerminalDevice->EfiKeyFiFo->Data[Head], sizeof (EFI=
_INPUT_KEY));
> ++  ZeroMem (&TerminalDevice->EfiKeyFiFo->Data[Head], sizeof (EFI_INPUT_K=
EY));
> +=20
> +   TerminalDevice->EfiKeyFiFo->Head =3D (UINT8)((Head + 1) % (FIFO_MAX_N=
UMBER + 1));
> +=20
> +@@ -1142,7 +1145,8 @@ UnicodeFiFoRemoveOneKey (
> +   Head =3D TerminalDevice->UnicodeFiFo->Head;
> +   ASSERT (Head < FIFO_MAX_NUMBER + 1);
> +=20
> +-  *Output =3D TerminalDevice->UnicodeFiFo->Data[Head];
> ++  *Output                                 =3D TerminalDevice->UnicodeFi=
Fo->Data[Head];
> ++  TerminalDevice->UnicodeFiFo->Data[Head] =3D 0;
> +=20
> +   TerminalDevice->UnicodeFiFo->Head =3D (UINT8)((Head + 1) % (FIFO_MAX_=
NUMBER + 1));
> + }
> +--=20
> +2.34.1
> +
> diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/=
ovmf_git.bb
> index f0503db9fb..85b3d7c911 100644
> --- a/meta/recipes-core/ovmf/ovmf_git.bb
> +++ b/meta/recipes-core/ovmf/ovmf_git.bb
> @@ -36,6 +36,7 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;bran=
ch=3Dmaster;protocol=3Dhttps \
>             file://CVE-2025-2296-7.patch \
>             file://CVE-2025-2296-8.patch \
>             file://CVE-2025-2296-9.patch \
> +           file://CVE-2024-38798.patch \
>             "
> =20
>  PV =3D "edk2-stable202402"

Helllo Hongxu,

I'm filling in for Yoann while he's on leave.

It appears that the patches from commits "[PATCH 2/3] ovmf: fix CVE-2025-22=
96"
and "[PATCH 3/3] ovmf: fix CVE-2024-38798" do not apply to neither
scarthgap-next nor scarthgap branch :
`Patch 0001-AmdSev-Halt-on-failed-blob-allocation.patch does not apply`
`Patch CVE-2024-38798.patch does not apply`

Could you take another look at this?

--=20
Fabien Thomas
Smile ECS


