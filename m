Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F20FF8873
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 12:25:47 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19144.1777551937792211026
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2026 05:25:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Burl6ZJg;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-448528f4e69so554972f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 05:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777551936; x=1778156736; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L5c+9cVev80Q6XY9xdL6/NZ9uDk45ZiQQSX/xsJnH9M=;
        b=Burl6ZJgEPB8aJOWANXT5aI9sTyiWmg2BmpzzyfYiZYhTFEGIOab2jT57szpRQQ8Sc
         1xE0ZqX+o6mZkUuvUm399MSnBr3t63rewFF1nhGwncG/AcpDIxT7rJvewFq3EAhfKEbO
         P+RwgP3aK+IAVavVYZfPCarHt5bDsSXibDWxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777551936; x=1778156736;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L5c+9cVev80Q6XY9xdL6/NZ9uDk45ZiQQSX/xsJnH9M=;
        b=ny4aMIifsetlDYGHnRkHTLUgWvbrq4kiN4c2KxaJMa45D2K0fIYdlYNw3fSah2z032
         ZiAXpgWrQGhscXbhUu2juJ/ymOI4VQvFbdwWUkDbRQSEwXwpD1KLSIW1sY4QVLpRg5HJ
         JjvGFWPZJmWbBJ4rx+5bbBYCaBP8SUHXnWShaT07QBAVkYMd2UWn5tPNxy5ALbVOocvs
         hfivDlLisnLhuFcFyBMJdcIwNskUcmYYS94/LF9jkCRyxsR5qgg0kUdaCbcLcqgTjZFV
         6DRMVX1SC8lkPZre5mnUGYJPafEcAnlLLexaCXiCObENATgV+qJj+hwOaAJx5NSECeiD
         PZCA==
X-Forwarded-Encrypted: i=1; AFNElJ/DdHSMbfIlwi9LhEnFFwZOvGH2IQ4aQPfxge4BbGb3Rb5qvQElRd4BTNsRezda4VfzkBNTjf5VluYfymcXcKVifA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw+y/TiLy1ZUMd0nW37KHP092D9kpenDrZrxBVV07AE03Gya4It
	SgvtNJGgzNXEWS4/BbzrOcknMYulBwlY06/+FvAB/6wkvPNQHgX+ymwOYBXJVGhEYMk=
X-Gm-Gg: AeBDieurfNJWX74YXJzaTG+1xV4KeSYJrrZ193HRtKvcQwbItsve2Mvd8QzVMG6UCsA
	rjveNN+8kSNxWWilnDNfVfC3h915mNHgddLK9GStD6QNlYN3pV71H5YVMZ57Gw164Ok77iuCBtg
	FaiSIC8StI/TGOW9gS+t1GfeMh4iamdz2Hgyoif+NxvhW1sTlwGtD9TzrRk9EOkNpI0WPUmLPYi
	LcoIioUxKIz9rcWRjVbmvn6bPnV1HBkNKoeiKsJJ/kqUHK+8O90MX6P0/3k/UJUnaBHkCgoyURd
	ZB6k8JFI5765hC2cdvMZT9Jk4+LPGbR9oPb6fm4sGEvh246TcEoVG6WtQNdXaVF2cStkRVOMnC0
	cnWSgrXvnapaIcZHw9zDDSohLwaBTJsBhmozwv6puY7rzYgql4qGY1d1nR5LZmYF30qruwzcG+G
	VQ0v9Wm34eb/vNffTj9rEOsi1yoiMVE2lFCR4iGL2XdU5unae7FUdqUFPgwOePxEdDefH8MtgK/
	Ec+nYWmccKW6zaH3WHU1O+re5o=
X-Received: by 2002:a5d:64e3:0:b0:43f:e659:1705 with SMTP id ffacd0b85a97d-4493e2ba59amr4588493f8f.20.1777551935693;
        Thu, 30 Apr 2026 05:25:35 -0700 (PDT)
Received: from localhost ([2a01:e0a:8cc:5b00:b8fa:c45c:f26d:53a3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b7ca67b9sm10713486f8f.34.2026.04.30.05.25.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 05:25:35 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Apr 2026 14:25:34 +0200
Message-Id: <DI6HKLJPYBHV.95KI3VALLEC2@smile.fr>
From: "Fabien Thomas" <fabien.thomas@smile.fr>
To: "Hongxu Jia" <hongxu.jia@windriver.com>, "Fabien Thomas"
 <fabien.thomas@smile.fr>, <openembedded-core@lists.openembedded.org>,
 <yoann.congal@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH 3/3] ovmf: fix CVE-2024-38798
X-Mailer: aerc 0.21.0
References: <20260427045650.2365793-1-hongxu.jia@windriver.com>
 <20260427045650.2365793-3-hongxu.jia@windriver.com>
 <DI6DQKDSGHF1.244EBN969P2YA@smile.fr>
 <29edab2d-29e6-49f3-88ec-6eb1d831214c@windriver.com>
In-Reply-To: <29edab2d-29e6-49f3-88ec-6eb1d831214c@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 12:25:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236162

On Thu Apr 30, 2026 at 2:05 PM CEST, Hongxu Jia wrote:
> On 4/30/26 17:25, Fabien Thomas wrote:
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender a=
nd know the content is safe.
>>
>> On Mon Apr 27, 2026 at 6:56 AM CEST, hongxu via lists.openembedded.org w=
rote:
>>> According to [1],
>>>
>>>    EDK2 contains a vulnerability in BIOS where an attacker may cause =
=E2=80=9CExposure of
>>>    Sensitive Information to an Unauthorized Actor=E2=80=9D by local acc=
ess. Successful
>>>    exploitation of this vulnerability will lead to possible information=
 disclosure
>>>    or escalation of privilege and impact Confidentiality.
>>>
>>> Backport a patch [2] from upstream to fix CVE-2024-38798
>>>
>>> [1] https://nvd.nist.gov/vuln/detail/CVE-2024-38798
>>> [2] https://github.com/tianocore/edk2/commit/0cad130cb4885961da201bb9b0=
8424b3fd3d2249
>>>
>>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>> ---
>>>   .../ovmf/ovmf/CVE-2024-38798.patch            | 116 +++++++++++++++++=
+
>>>   meta/recipes-core/ovmf/ovmf_git.bb            |   1 +
>>>   2 files changed, 117 insertions(+)
>>>   create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2024-38798.patch
>>>
>>> diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2024-38798.patch b/meta/re=
cipes-core/ovmf/ovmf/CVE-2024-38798.patch
>>> new file mode 100644
>>> index 0000000000..2d0a73c7a6
>>> --- /dev/null
>>> +++ b/meta/recipes-core/ovmf/ovmf/CVE-2024-38798.patch
>>> @@ -0,0 +1,116 @@
>>> +From 81263e46ad8cf2a6c7d86bc51c95342d07ec31ca Mon Sep 17 00:00:00 2001
>>> +From: Hongxu Jia <hongxu.jia@windriver.com>
>>> +Date: Mon, 5 Jan 2026 13:04:18 +0800
>>> +Subject: [PATCH] MdeModulePkg : Clear keyboard queue buffer after read=
ing
>>> +
>>> +There is a possibility to retrieve user input keystroke data stored in=
 the
>>> +queue buffer via the EFI_SIMPLE_TEXT_INPUT_PROTOCOL pointer. To preven=
t
>>> +exposure of the password string, clear the queue buffer by filling it
>>> +with zeros after reading.
>>> +
>>> +Signed-off-by: Nick Wang <nick.wang@insyde.com>
>>> +
>>> +CVE: CVE-2024-38798
>>> +Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/0c=
ad130cb4885961da201bb9b08424b3fd3d2249]
>>> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>> +---
>>> + MdeModulePkg/Bus/Isa/Ps2KeyboardDxe/Ps2KbdCtrller.c       | 2 ++
>>> + MdeModulePkg/Bus/Isa/Ps2KeyboardDxe/Ps2KbdTextIn.c        | 1 +
>>> + MdeModulePkg/Bus/Usb/UsbKbDxe/KeyBoard.c                  | 2 +-
>>> + .../Universal/Console/ConSplitterDxe/ConSplitter.c        | 1 +
>>> + .../Universal/Console/TerminalDxe/TerminalConIn.c         | 8 ++++++-=
-
>>> + 5 files changed, 11 insertions(+), 3 deletions(-)
>>> +
>>> +diff --git a/MdeModulePkg/Bus/Isa/Ps2KeyboardDxe/Ps2KbdCtrller.c b/Mde=
ModulePkg/Bus/Isa/Ps2KeyboardDxe/Ps2KbdCtrller.c
>>> +index 981309f..32757a7 100644
>>> +--- a/MdeModulePkg/Bus/Isa/Ps2KeyboardDxe/Ps2KbdCtrller.c
>>> ++++ b/MdeModulePkg/Bus/Isa/Ps2KeyboardDxe/Ps2KbdCtrller.c
>>> +@@ -650,6 +650,8 @@ PopScancodeBufHead (
>>> +     if (Buf !=3D NULL) {
>>> +       Buf[Index] =3D Queue->Buffer[Queue->Head];
>>> +     }
>>> ++
>>> ++    Queue->Buffer[Queue->Head] =3D 0;
>>> +   }
>>> +
>>> +   return EFI_SUCCESS;
>>> +diff --git a/MdeModulePkg/Bus/Isa/Ps2KeyboardDxe/Ps2KbdTextIn.c b/MdeM=
odulePkg/Bus/Isa/Ps2KeyboardDxe/Ps2KbdTextIn.c
>>> +index 81d3c6e..e03c88f 100644
>>> +--- a/MdeModulePkg/Bus/Isa/Ps2KeyboardDxe/Ps2KbdTextIn.c
>>> ++++ b/MdeModulePkg/Bus/Isa/Ps2KeyboardDxe/Ps2KbdTextIn.c
>>> +@@ -51,6 +51,7 @@ PopEfikeyBufHead (
>>> +     CopyMem (KeyData, &Queue->Buffer[Queue->Head], sizeof (EFI_KEY_DA=
TA));
>>> +   }
>>> +
>>> ++  ZeroMem (&Queue->Buffer[Queue->Head], sizeof (EFI_KEY_DATA));
>>> +   Queue->Head =3D (Queue->Head + 1) % KEYBOARD_EFI_KEY_MAX_COUNT;
>>> +   return EFI_SUCCESS;
>>> + }
>>> +diff --git a/MdeModulePkg/Bus/Usb/UsbKbDxe/KeyBoard.c b/MdeModulePkg/B=
us/Usb/UsbKbDxe/KeyBoard.c
>>> +index b5a6459..7df1566 100644
>>> +--- a/MdeModulePkg/Bus/Usb/UsbKbDxe/KeyBoard.c
>>> ++++ b/MdeModulePkg/Bus/Usb/UsbKbDxe/KeyBoard.c
>>> +@@ -1840,7 +1840,7 @@ Dequeue (
>>> +   }
>>> +
>>> +   CopyMem (Item, Queue->Buffer[Queue->Head], ItemSize);
>>> +-
>>> ++  ZeroMem (Queue->Buffer[Queue->Head], ItemSize);
>>> +   //
>>> +   // Adjust the head pointer of the FIFO keyboard buffer.
>>> +   //
>>> +diff --git a/MdeModulePkg/Universal/Console/ConSplitterDxe/ConSplitter=
.c b/MdeModulePkg/Universal/Console/ConSplitterDxe/ConSplitter.c
>>> +index 0a776f3..5c1a35e 100644
>>> +--- a/MdeModulePkg/Universal/Console/ConSplitterDxe/ConSplitter.c
>>> ++++ b/MdeModulePkg/Universal/Console/ConSplitterDxe/ConSplitter.c
>>> +@@ -3537,6 +3537,7 @@ ConSplitterTextInExDequeueKey (
>>> +     &Private->KeyQueue[1],
>>> +     Private->CurrentNumberOfKeys * sizeof (EFI_KEY_DATA)
>>> +     );
>>> ++  ZeroMem (&Private->KeyQueue[Private->CurrentNumberOfKeys], sizeof (=
EFI_KEY_DATA));
>>> +   return EFI_SUCCESS;
>>> + }
>>> +
>>> +diff --git a/MdeModulePkg/Universal/Console/TerminalDxe/TerminalConIn.=
c b/MdeModulePkg/Universal/Console/TerminalDxe/TerminalConIn.c
>>> +index f1d0a34..8aafb4b 100644
>>> +--- a/MdeModulePkg/Universal/Console/TerminalDxe/TerminalConIn.c
>>> ++++ b/MdeModulePkg/Universal/Console/TerminalDxe/TerminalConIn.c
>>> +@@ -760,7 +760,8 @@ RawFiFoRemoveOneKey (
>>> +     return FALSE;
>>> +   }
>>> +
>>> +-  *Output =3D TerminalDevice->RawFiFo->Data[Head];
>>> ++  *Output                             =3D TerminalDevice->RawFiFo->Da=
ta[Head];
>>> ++  TerminalDevice->RawFiFo->Data[Head] =3D 0;
>>> +
>>> +   TerminalDevice->RawFiFo->Head =3D (UINT8)((Head + 1) % (RAW_FIFO_MA=
X_NUMBER + 1));
>>> +
>>> +@@ -881,6 +882,7 @@ EfiKeyFiFoForNotifyRemoveOneKey (
>>> +   }
>>> +
>>> +   CopyMem (Output, &EfiKeyFiFo->Data[Head], sizeof (EFI_INPUT_KEY));
>>> ++  ZeroMem (&EfiKeyFiFo->Data[Head], sizeof (EFI_INPUT_KEY));
>>> +
>>> +   EfiKeyFiFo->Head =3D (UINT8)((Head + 1) % (FIFO_MAX_NUMBER + 1));
>>> +
>>> +@@ -1032,6 +1034,7 @@ EfiKeyFiFoRemoveOneKey (
>>> +   }
>>> +
>>> +   CopyMem (Output, &TerminalDevice->EfiKeyFiFo->Data[Head], sizeof (E=
FI_INPUT_KEY));
>>> ++  ZeroMem (&TerminalDevice->EfiKeyFiFo->Data[Head], sizeof (EFI_INPUT=
_KEY));
>>> +
>>> +   TerminalDevice->EfiKeyFiFo->Head =3D (UINT8)((Head + 1) % (FIFO_MAX=
_NUMBER + 1));
>>> +
>>> +@@ -1142,7 +1145,8 @@ UnicodeFiFoRemoveOneKey (
>>> +   Head =3D TerminalDevice->UnicodeFiFo->Head;
>>> +   ASSERT (Head < FIFO_MAX_NUMBER + 1);
>>> +
>>> +-  *Output =3D TerminalDevice->UnicodeFiFo->Data[Head];
>>> ++  *Output                                 =3D TerminalDevice->Unicode=
FiFo->Data[Head];
>>> ++  TerminalDevice->UnicodeFiFo->Data[Head] =3D 0;
>>> +
>>> +   TerminalDevice->UnicodeFiFo->Head =3D (UINT8)((Head + 1) % (FIFO_MA=
X_NUMBER + 1));
>>> + }
>>> +--
>>> +2.34.1
>>> +
>>> diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovm=
f/ovmf_git.bb
>>> index f0503db9fb..85b3d7c911 100644
>>> --- a/meta/recipes-core/ovmf/ovmf_git.bb
>>> +++ b/meta/recipes-core/ovmf/ovmf_git.bb
>>> @@ -36,6 +36,7 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;br=
anch=3Dmaster;protocol=3Dhttps \
>>>              file://CVE-2025-2296-7.patch \
>>>              file://CVE-2025-2296-8.patch \
>>>              file://CVE-2025-2296-9.patch \
>>> +           file://CVE-2024-38798.patch \
>>>              "
>>>
>>>   PV =3D "edk2-stable202402"
>> Helllo Hongxu,
>>
>> I'm filling in for Yoann while he's on leave.
>>
>> It appears that the patches from commits "[PATCH 2/3] ovmf: fix CVE-2025=
-2296"
>> and "[PATCH 3/3] ovmf: fix CVE-2024-38798" do not apply to neither
>> scarthgap-next nor scarthgap branch :
>> `Patch 0001-AmdSev-Halt-on-failed-blob-allocation.patch does not apply`
>> `Patch CVE-2024-38798.patch does not apply`
>>
>> Could you take another look at this?
>
> Hi Thomas,
>
> I could apply the patch on latest scarthgap, I am afraid it was caused=20
> by the `CR' at the end of lines
>
> would you please apply the patch by `git am --keep-cr 00*.patch' or=20
> cherry-pick from my github by following steps:
>
> $ git fetch https://github.com/hongxu-jia/openembedded-core.git scarthgap
>
> $ git log HEAD..FETCH_HEAD=C2=A0 --oneline
> 405b06db9d (scarthgap) ovmf: fix CVE-2024-38798
> 5b951e8d74 ovmf: fix CVE-2025-2296
> 2b93d45cfa u-boot: fix CVE-2025-24857
>
> $ git cherry-pick=C2=A02b93d45cfa=C2=A05b951e8d74=C2=A0405b06db9d
>
> //Hongxu
>
>
>>
>> --
>> Fabien Thomas
>> Smile ECS
>>

Sorry Hongxu,

I didn't see your other reply, at first.
I've just done exactly what you suggest and they applied correctly now.

Thanks for these fixes.
Regards,

--=20
Fabien Thomas
Smile ECS


