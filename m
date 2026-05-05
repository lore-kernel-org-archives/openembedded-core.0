Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FF39CD3439
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 16:59:03 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1057.1778000340608032563
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 09:59:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=UuB5FLNZ;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so378145e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 09:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778000338; x=1778605138; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tHNiwqjKu7MW1EvUhnIuiIzhhtjRwHhvSCLaSkJ0GA0=;
        b=UuB5FLNZ/9zDBUJr1Yib9b6DFaFtFZBqakueq3BlFjl6eHlYPDlfZTgYiUaHjgEkNp
         zPZixu5aSTUUNPB5rkdEygIY28e7n/Amu7NP4xm/NTPZY6jsvwk95sTb/ACCNP8ZX2y/
         NhaStymwyMn/dBbgOFh2qY3Z2/UsySzLH76pQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778000338; x=1778605138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tHNiwqjKu7MW1EvUhnIuiIzhhtjRwHhvSCLaSkJ0GA0=;
        b=PKnjx8+1kZZ+VyTZs41c6OTNHKJ6G6FwcGpNWRR1d97NTXVHKGDmIJ8T6+ldAxI7QZ
         JUkcHvxK7NHw0JujNrbtDZFEzpNDNu+Tq8uFJ/6Ab2Af9qbyNvQ3L3UN+EOswH20F7Ae
         96BGR64Fd0U01ZH7vgyE/VT32u+VrA5LLm6HdqE6DHNRzLWkHZ8GxHEP30u6qK6sbmRI
         I8J4omqbMNNRNFBK+7+X4fHJqgD2/F2E5hHS2dcxE1qC95wwTr8W9HNmVVJrW80EPDBk
         PEVvvLzbUJQgBNtS0tK/N8PszMB51i7u9zszQAkMrDXi0rBDmxKLzOGDDV0AWB0qb22U
         cEGg==
X-Gm-Message-State: AOJu0YyvRLncPD76fEMXRe8LGoY+MbLglGbc3faPc+zzZA9Wh8WMaUuE
	p33sH5AOGr2nSkMBigRurcCsRMDE+DCJAMDPNqUDAODHH/9HEVUtqf74qc7/k4lx8EFaATea4YH
	pSWM1UyM=
X-Gm-Gg: AeBDies4nHluNsM0F0ied0KUlYPrlNDQC5xklahZiElnMGqza2O8c6l04hD0+KExuu6
	f9A8Ng72Srch3ZEvineVwmML52Bxjb3Mn0uMgHs9kPyAUOtHdGEjeId77qdhnj6CuRS1j+cVqbE
	aarAZe63q7eCQuC+7KZltBlHNP6rYr8DoJq5jezA/0TSg6E67DsgmvPSwYk49z9sRnierI+fl5S
	VlonukGRixW6k/UISXAAiqTJxCR41d+UIqD4GfxAVpd0kNDKTPU1XjKrc7oM5ZZDwgVcWMOF7y8
	m+xy16iMOe33CYj0wknVC0JdbIdA0/f/t9zmn3gmqd/WHQKMmy7PiLZ2LrGCh+F+Htgm76GaBN5
	vD1hVl2fQz70zkTdjxqpd0+MSQFc/8DflTw55Rv6k/3ixx1KTpPxFNdJIiTBV/nhI5s8mP0nsFe
	r0VmNwoQNso0njbsO8Ilq/59Zu15bxxd4l/o9uq3kT9NNOZbNn+c3OUGncPO6Ib7WdLYdzyIfyV
	JYfRnTjYsAvwzhFZa/+rl7Gvg==
X-Received: by 2002:a05:600c:8116:b0:488:aa33:dc8f with SMTP id 5b1f17b1804b1-48d141ceb81mr67683835e9.0.1778000338149;
        Tue, 05 May 2026 09:58:58 -0700 (PDT)
Received: from localhost ([2a01:e0a:8cc:5b00:b8fa:c45c:f26d:53a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e51f6805fsm60025e9.2.2026.05.05.09.58.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:58:57 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/23] ovmf: fix CVE-2024-38798
Date: Tue,  5 May 2026 18:57:31 +0200
Message-ID: <ed444adf325d3a985ed8f9ae0a009ecbaf67c3fd.1777995876.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1777995876.git.fabien.thomas@smile.fr>
References: <cover.1777995876.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 16:59:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236505

From: Hongxu Jia <hongxu.jia@windriver.com>

According to [1],

  EDK2 contains a vulnerability in BIOS where an attacker may cause =E2=80=
=9CExposure of
  Sensitive Information to an Unauthorized Actor=E2=80=9D by local access. =
Successful
  exploitation of this vulnerability will lead to possible information disc=
losure
  or escalation of privilege and impact Confidentiality.

Backport a patch [2] from upstream to fix CVE-2024-38798

[1] https://nvd.nist.gov/vuln/detail/CVE-2024-38798
[2] https://github.com/tianocore/edk2/commit/0cad130cb4885961da201bb9b08424=
b3fd3d2249

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../ovmf/ovmf/CVE-2024-38798.patch            | 116 ++++++++++++++++++
 meta/recipes-core/ovmf/ovmf_git.bb            |   1 +
 2 files changed, 117 insertions(+)
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2024-38798.patch

diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2024-38798.patch b/meta/recipe=
s-core/ovmf/ovmf/CVE-2024-38798.patch
new file mode 100644
index 0000000000..2d0a73c7a6
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/CVE-2024-38798.patch
@@ -0,0 +1,116 @@
+From 81263e46ad8cf2a6c7d86bc51c95342d07ec31ca Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 5 Jan 2026 13:04:18 +0800
+Subject: [PATCH] MdeModulePkg : Clear keyboard queue buffer after reading
+
+There is a possibility to retrieve user input keystroke data stored in the
+queue buffer via the EFI_SIMPLE_TEXT_INPUT_PROTOCOL pointer. To prevent
+exposure of the password string, clear the queue buffer by filling it
+with zeros after reading.
+
+Signed-off-by: Nick Wang <nick.wang@insyde.com>
+
+CVE: CVE-2024-38798
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/0cad13=
0cb4885961da201bb9b08424b3fd3d2249]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ MdeModulePkg/Bus/Isa/Ps2KeyboardDxe/Ps2KbdCtrller.c       | 2 ++
+ MdeModulePkg/Bus/Isa/Ps2KeyboardDxe/Ps2KbdTextIn.c        | 1 +
+ MdeModulePkg/Bus/Usb/UsbKbDxe/KeyBoard.c                  | 2 +-
+ .../Universal/Console/ConSplitterDxe/ConSplitter.c        | 1 +
+ .../Universal/Console/TerminalDxe/TerminalConIn.c         | 8 ++++++--
+ 5 files changed, 11 insertions(+), 3 deletions(-)
+
+diff --git a/MdeModulePkg/Bus/Isa/Ps2KeyboardDxe/Ps2KbdCtrller.c b/MdeModu=
lePkg/Bus/Isa/Ps2KeyboardDxe/Ps2KbdCtrller.c
+index 981309f..32757a7 100644
+--- a/MdeModulePkg/Bus/Isa/Ps2KeyboardDxe/Ps2KbdCtrller.c
++++ b/MdeModulePkg/Bus/Isa/Ps2KeyboardDxe/Ps2KbdCtrller.c
+@@ -650,6 +650,8 @@ PopScancodeBufHead (
+     if (Buf !=3D NULL) {=0D
+       Buf[Index] =3D Queue->Buffer[Queue->Head];=0D
+     }=0D
++=0D
++    Queue->Buffer[Queue->Head] =3D 0;=0D
+   }=0D
+ =0D
+   return EFI_SUCCESS;=0D
+diff --git a/MdeModulePkg/Bus/Isa/Ps2KeyboardDxe/Ps2KbdTextIn.c b/MdeModul=
ePkg/Bus/Isa/Ps2KeyboardDxe/Ps2KbdTextIn.c
+index 81d3c6e..e03c88f 100644
+--- a/MdeModulePkg/Bus/Isa/Ps2KeyboardDxe/Ps2KbdTextIn.c
++++ b/MdeModulePkg/Bus/Isa/Ps2KeyboardDxe/Ps2KbdTextIn.c
+@@ -51,6 +51,7 @@ PopEfikeyBufHead (
+     CopyMem (KeyData, &Queue->Buffer[Queue->Head], sizeof (EFI_KEY_DATA))=
;=0D
+   }=0D
+ =0D
++  ZeroMem (&Queue->Buffer[Queue->Head], sizeof (EFI_KEY_DATA));=0D
+   Queue->Head =3D (Queue->Head + 1) % KEYBOARD_EFI_KEY_MAX_COUNT;=0D
+   return EFI_SUCCESS;=0D
+ }=0D
+diff --git a/MdeModulePkg/Bus/Usb/UsbKbDxe/KeyBoard.c b/MdeModulePkg/Bus/U=
sb/UsbKbDxe/KeyBoard.c
+index b5a6459..7df1566 100644
+--- a/MdeModulePkg/Bus/Usb/UsbKbDxe/KeyBoard.c
++++ b/MdeModulePkg/Bus/Usb/UsbKbDxe/KeyBoard.c
+@@ -1840,7 +1840,7 @@ Dequeue (
+   }=0D
+ =0D
+   CopyMem (Item, Queue->Buffer[Queue->Head], ItemSize);=0D
+-=0D
++  ZeroMem (Queue->Buffer[Queue->Head], ItemSize);=0D
+   //=0D
+   // Adjust the head pointer of the FIFO keyboard buffer.=0D
+   //=0D
+diff --git a/MdeModulePkg/Universal/Console/ConSplitterDxe/ConSplitter.c b=
/MdeModulePkg/Universal/Console/ConSplitterDxe/ConSplitter.c
+index 0a776f3..5c1a35e 100644
+--- a/MdeModulePkg/Universal/Console/ConSplitterDxe/ConSplitter.c
++++ b/MdeModulePkg/Universal/Console/ConSplitterDxe/ConSplitter.c
+@@ -3537,6 +3537,7 @@ ConSplitterTextInExDequeueKey (
+     &Private->KeyQueue[1],=0D
+     Private->CurrentNumberOfKeys * sizeof (EFI_KEY_DATA)=0D
+     );=0D
++  ZeroMem (&Private->KeyQueue[Private->CurrentNumberOfKeys], sizeof (EFI_=
KEY_DATA));=0D
+   return EFI_SUCCESS;=0D
+ }=0D
+ =0D
+diff --git a/MdeModulePkg/Universal/Console/TerminalDxe/TerminalConIn.c b/=
MdeModulePkg/Universal/Console/TerminalDxe/TerminalConIn.c
+index f1d0a34..8aafb4b 100644
+--- a/MdeModulePkg/Universal/Console/TerminalDxe/TerminalConIn.c
++++ b/MdeModulePkg/Universal/Console/TerminalDxe/TerminalConIn.c
+@@ -760,7 +760,8 @@ RawFiFoRemoveOneKey (
+     return FALSE;=0D
+   }=0D
+ =0D
+-  *Output =3D TerminalDevice->RawFiFo->Data[Head];=0D
++  *Output                             =3D TerminalDevice->RawFiFo->Data[H=
ead];=0D
++  TerminalDevice->RawFiFo->Data[Head] =3D 0;=0D
+ =0D
+   TerminalDevice->RawFiFo->Head =3D (UINT8)((Head + 1) % (RAW_FIFO_MAX_NU=
MBER + 1));=0D
+ =0D
+@@ -881,6 +882,7 @@ EfiKeyFiFoForNotifyRemoveOneKey (
+   }=0D
+ =0D
+   CopyMem (Output, &EfiKeyFiFo->Data[Head], sizeof (EFI_INPUT_KEY));=0D
++  ZeroMem (&EfiKeyFiFo->Data[Head], sizeof (EFI_INPUT_KEY));=0D
+ =0D
+   EfiKeyFiFo->Head =3D (UINT8)((Head + 1) % (FIFO_MAX_NUMBER + 1));=0D
+ =0D
+@@ -1032,6 +1034,7 @@ EfiKeyFiFoRemoveOneKey (
+   }=0D
+ =0D
+   CopyMem (Output, &TerminalDevice->EfiKeyFiFo->Data[Head], sizeof (EFI_I=
NPUT_KEY));=0D
++  ZeroMem (&TerminalDevice->EfiKeyFiFo->Data[Head], sizeof (EFI_INPUT_KEY=
));=0D
+ =0D
+   TerminalDevice->EfiKeyFiFo->Head =3D (UINT8)((Head + 1) % (FIFO_MAX_NUM=
BER + 1));=0D
+ =0D
+@@ -1142,7 +1145,8 @@ UnicodeFiFoRemoveOneKey (
+   Head =3D TerminalDevice->UnicodeFiFo->Head;=0D
+   ASSERT (Head < FIFO_MAX_NUMBER + 1);=0D
+ =0D
+-  *Output =3D TerminalDevice->UnicodeFiFo->Data[Head];=0D
++  *Output                                 =3D TerminalDevice->UnicodeFiFo=
->Data[Head];=0D
++  TerminalDevice->UnicodeFiFo->Data[Head] =3D 0;=0D
+ =0D
+   TerminalDevice->UnicodeFiFo->Head =3D (UINT8)((Head + 1) % (FIFO_MAX_NU=
MBER + 1));=0D
+ }=0D
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ov=
mf_git.bb
index fd5ff25dc9..4e6227f484 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -39,6 +39,7 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=
=3Dmaster;protocol=3Dhttps \
            file://CVE-2025-2296-7.patch \
            file://CVE-2025-2296-8.patch \
            file://CVE-2025-2296-9.patch \
+           file://CVE-2024-38798.patch \
            "
=20
 PV =3D "edk2-stable202402"

