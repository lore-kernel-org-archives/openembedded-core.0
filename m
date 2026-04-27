Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F7BDFF8850
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 04:57:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35986.1777265816439810197
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Apr 2026 21:56:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=D7gZ4nyX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=857747364e=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R3WndY2673312;
	Mon, 27 Apr 2026 04:56:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=aQmJJG2HArLXmRdxp2KMmAb3tNkxbDHe0MocQvRrtQw=; b=D7gZ4nyXV1KF
	LyxzDrELWQOAaEhUFyQvvh9l0hqCULE9N7K+Vdpm6TamV74FLotgUtOA92vJVsJu
	O9uYMiXE0nc8HBOuvUFBSYV8yDgm/YbXpovLzVzA0C/jlAHipmyZUWW/UtPPQXmd
	SOGsDYkoNEKwJ5Pxe8KPMJzpgKj2Pe77uzfqWGZu19DIVMSXgALADKafu5fmNDiS
	CkxK/CLfMGnZNPTpiAgqk+rigPuKZC2PQOaJV5utI4PNtR46brTS8B0xWlbf9Akt
	8M9G04cJ4aeOf9trc1/POsyM03LG4HtNcROwKJn9VX6ryPtOWJDwJ6jFIlRw7KzA
	rXuDtmHX4A==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4drju09kwu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 27 Apr 2026 04:56:55 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 26 Apr 2026 21:56:54 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 26 Apr 2026 21:56:53 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <yoann.congal@smile.fr>
Subject: [scarthgap][PATCH 3/3] ovmf: fix CVE-2024-38798
Date: Mon, 27 Apr 2026 12:56:50 +0800
Message-ID: <20260427045650.2365793-3-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260427045650.2365793-1-hongxu.jia@windriver.com>
References: <20260427045650.2365793-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=J+SaKgnS c=1 sm=1 tr=0 ts=69eeec97 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=PYnjg3YJAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=c-OXHmbyAAAA:8 a=XZ9oeUmmphtA08bY2KAA:9
 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=1BV3uS847Uy0Hebj2SdW:22
X-Proofpoint-GUID: xWyHaloiKyv15PT3HOGsKSntFNWpO798
X-Proofpoint-ORIG-GUID: xWyHaloiKyv15PT3HOGsKSntFNWpO798
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA1MCBTYWx0ZWRfX9wsL9lRPcdiU
 zIXZpJnSAieZ8r8rC2ox/N+P0x46J6yOXHXDPxNUPkw2jnSN8y1hvuxFRhpUnBMNZk2VItzXvBF
 7eNow+TgMxXCY6IWJNxukS0IRQHjVc+5tAxjPwfnPyTxAMvjazPMRkvBe+x/yElNF31hqAd3gki
 mpJH+qkbd3QqMJVM+f+rJsuhpLFsDJvVr/b0x8pbaN66Ul4uweJ9ji+8Ia+ODjdUljxFkvqWPvW
 dzWmVlqssg+aOPxDZitsgCCEDI9+1hHw+6mkllLANsIuXxKgEC1VOWUo2eEJbR3SZ70GkLL+C6W
 vNs85mtD26SdxPVOTMF5x752phlyl2F77wF04BOF0nVeB+RGvAtMacJqefU7FBQ0PGG/LCFkWTJ
 c2kr1gyWdkx6Y2U+xOddZBAmqd0p23uAuiH1f5VxBjS1MogUHYJuKMsXSH/lzs0R9yU5xRwumYK
 OT5zDErZWrTXp6/4L5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 clxscore=1011 priorityscore=1501 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270050
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 04:57:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235977

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
index f0503db9fb..85b3d7c911 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -36,6 +36,7 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=
=3Dmaster;protocol=3Dhttps \
            file://CVE-2025-2296-7.patch \
            file://CVE-2025-2296-8.patch \
            file://CVE-2025-2296-9.patch \
+           file://CVE-2024-38798.patch \
            "
=20
 PV =3D "edk2-stable202402"
--=20
2.34.1


