Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C9A0D5A6D6
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 02:25:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.36608.1732587949736482703
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 18:25:49 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1060df9989=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQ1KgEK007184;
	Tue, 26 Nov 2024 02:25:49 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 433618aq0g-11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 26 Nov 2024 02:25:48 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 25 Nov 2024 18:25:28 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 25 Nov 2024 18:25:28 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <steve@sakoman.com>
Subject: [kirkstone][PATCH V2 11/13] ovmf: Fix CVE-2022-36765
Date: Mon, 25 Nov 2024 18:25:24 -0800
Message-ID: <20241126022526.3389121-11-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241126022526.3389121-1-hongxu.jia@windriver.com>
References: <20241126022526.3389121-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: _pKoCehyUe5mVWEUU3_5Sr10zVEE8TUa
X-Proofpoint-GUID: _pKoCehyUe5mVWEUU3_5Sr10zVEE8TUa
X-Authority-Analysis: v=2.4 cv=O65rvw9W c=1 sm=1 tr=0 ts=674531ac cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VlfZXiiP6vEA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=hqBzw_eTAAAA:8 a=t7CeM3EgAAAA:8 a=QyXUC8HyAAAA:8 a=1XWaLZrsAAAA:8
 a=20KFwNOVAAAA:8 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=zd2uoN0lAAAA:8 a=7CQSdrXTAAAA:8 a=eJB_tvAIRh0TQ2-SWrsA:9 a=bkWp_v3HvcftT6DRAIDL:22 a=FdTzh2GWekK77mhwV6Dw:22 a=TjNXssC_j7lpFel5tvFf:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-11-26_01,2024-11-25_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2411260019
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 02:25:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207835

From: Soumya Sambu <soumya.sambu@windriver.com>

EDK2 is susceptible to a vulnerability in the CreateHob() function,
allowing a user to trigger a integer overflow to buffer overflow
via a local network. Successful exploitation of this vulnerability
may result in a compromise of confidentiality, integrity, and/or
availability.

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-36765

Upstream-patches:
https://github.com/tianocore/edk2/commit/59f024c76ee57c2bec84794536302fc770=
cd6ec2
https://github.com/tianocore/edk2/commit/aeaee8944f0eaacbf4cdf39279785b9ba4=
836bb6
https://github.com/tianocore/edk2/commit/9a75b030cf27d2530444e9a2f9f11867f7=
9bf679

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../ovmf/ovmf/CVE-2022-36765-0001.patch       | 179 ++++++++++++++++++
 .../ovmf/ovmf/CVE-2022-36765-0002.patch       | 157 +++++++++++++++
 .../ovmf/ovmf/CVE-2022-36765-0003.patch       | 135 +++++++++++++
 meta/recipes-core/ovmf/ovmf_git.bb            |   3 +
 4 files changed, 474 insertions(+)
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2022-36765-0001.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2022-36765-0002.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2022-36765-0003.patch

diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2022-36765-0001.patch b/meta/r=
ecipes-core/ovmf/ovmf/CVE-2022-36765-0001.patch
new file mode 100644
index 0000000000..120cf66f6a
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/CVE-2022-36765-0001.patch
@@ -0,0 +1,179 @@
+From 59f024c76ee57c2bec84794536302fc770cd6ec2 Mon Sep 17 00:00:00 2001
+From: Gua Guo <gua.guo@intel.com>
+Date: Thu, 11 Jan 2024 13:01:19 +0800
+Subject: [PATCH] UefiPayloadPkg/Hob: Integer Overflow in CreateHob()
+
+REF: https://bugzilla.tianocore.org/show_bug.cgi?id=3D4166
+
+Fix integer overflow in various CreateHob instances.
+Fixes: CVE-2022-36765
+
+The CreateHob() function aligns the requested size to 8
+performing the following operation:
+```
+HobLength =3D (UINT16)((HobLength + 0x7) & (~0x7));
+```
+
+No checks are performed to ensure this value doesn't
+overflow, and could lead to CreateHob() returning a smaller
+HOB than requested, which could lead to OOB HOB accesses.
+
+Reported-by: Marc Beatove <mbeatove@google.com>
+Cc: Guo Dong <guo.dong@intel.com>
+Cc: Sean Rhodes <sean@starlabs.systems>
+Cc: James Lu <james.lu@intel.com>
+Reviewed-by: Gua Guo <gua.guo@intel.com>
+Cc: John Mathew <john.mathews@intel.com>
+Authored-by: Gerd Hoffmann <kraxel@redhat.com>
+Signed-off-by: Gua Guo <gua.guo@intel.com>
+
+CVE: CVE-2022-36765
+
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/59f024=
c76ee57c2bec84794536302fc770cd6ec2]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ .../Library/PayloadEntryHobLib/Hob.c          | 43 +++++++++++++++++++
+ .../UefiPayloadEntry/UniversalPayloadEntry.c  |  8 ++--
+ 2 files changed, 48 insertions(+), 3 deletions(-)
+
+diff --git a/UefiPayloadPkg/Library/PayloadEntryHobLib/Hob.c b/UefiPayload=
Pkg/Library/PayloadEntryHobLib/Hob.c
+index 2c3acbbc19..51c2e28d7d 100644
+--- a/UefiPayloadPkg/Library/PayloadEntryHobLib/Hob.c
++++ b/UefiPayloadPkg/Library/PayloadEntryHobLib/Hob.c
+@@ -110,6 +110,13 @@ CreateHob (
+ =0D
+   HandOffHob =3D GetHobList ();=0D
+ =0D
++  //=0D
++  // Check Length to avoid data overflow.=0D
++  //=0D
++  if (HobLength > MAX_UINT16 - 0x7) {=0D
++    return NULL;=0D
++  }=0D
++=0D
+   HobLength =3D (UINT16)((HobLength + 0x7) & (~0x7));=0D
+ =0D
+   FreeMemory =3D HandOffHob->EfiFreeMemoryTop - HandOffHob->EfiFreeMemory=
Bottom;=0D
+@@ -160,6 +167,9 @@ BuildResourceDescriptorHob (
+ =0D
+   Hob =3D CreateHob (EFI_HOB_TYPE_RESOURCE_DESCRIPTOR, sizeof (EFI_HOB_RE=
SOURCE_DESCRIPTOR));=0D
+   ASSERT (Hob !=3D NULL);=0D
++  if (Hob =3D=3D NULL) {=0D
++    return;=0D
++  }=0D
+ =0D
+   Hob->ResourceType      =3D ResourceType;=0D
+   Hob->ResourceAttribute =3D ResourceAttribute;=0D
+@@ -330,6 +340,10 @@ BuildModuleHob (
+     );=0D
+ =0D
+   Hob =3D CreateHob (EFI_HOB_TYPE_MEMORY_ALLOCATION, sizeof (EFI_HOB_MEMO=
RY_ALLOCATION_MODULE));=0D
++  ASSERT (Hob !=3D NULL);=0D
++  if (Hob =3D=3D NULL) {=0D
++    return;=0D
++  }=0D
+ =0D
+   CopyGuid (&(Hob->MemoryAllocationHeader.Name), &gEfiHobMemoryAllocModul=
eGuid);=0D
+   Hob->MemoryAllocationHeader.MemoryBaseAddress =3D MemoryAllocationModul=
e;=0D
+@@ -378,6 +392,11 @@ BuildGuidHob (
+   ASSERT (DataLength <=3D (0xffff - sizeof (EFI_HOB_GUID_TYPE)));=0D
+ =0D
+   Hob =3D CreateHob (EFI_HOB_TYPE_GUID_EXTENSION, (UINT16)(sizeof (EFI_HO=
B_GUID_TYPE) + DataLength));=0D
++  ASSERT (Hob !=3D NULL);=0D
++  if (Hob =3D=3D NULL) {=0D
++    return NULL;=0D
++  }=0D
++=0D
+   CopyGuid (&Hob->Name, Guid);=0D
+   return Hob + 1;=0D
+ }=0D
+@@ -441,6 +460,10 @@ BuildFvHob (
+   EFI_HOB_FIRMWARE_VOLUME  *Hob;=0D
+ =0D
+   Hob =3D CreateHob (EFI_HOB_TYPE_FV, sizeof (EFI_HOB_FIRMWARE_VOLUME));=
=0D
++  ASSERT (Hob !=3D NULL);=0D
++  if (Hob =3D=3D NULL) {=0D
++    return;=0D
++  }=0D
+ =0D
+   Hob->BaseAddress =3D BaseAddress;=0D
+   Hob->Length      =3D Length;=0D
+@@ -472,6 +495,10 @@ BuildFv2Hob (
+   EFI_HOB_FIRMWARE_VOLUME2  *Hob;=0D
+ =0D
+   Hob =3D CreateHob (EFI_HOB_TYPE_FV2, sizeof (EFI_HOB_FIRMWARE_VOLUME2))=
;=0D
++  ASSERT (Hob !=3D NULL);=0D
++  if (Hob =3D=3D NULL) {=0D
++    return;=0D
++  }=0D
+ =0D
+   Hob->BaseAddress =3D BaseAddress;=0D
+   Hob->Length      =3D Length;=0D
+@@ -513,6 +540,10 @@ BuildFv3Hob (
+   EFI_HOB_FIRMWARE_VOLUME3  *Hob;=0D
+ =0D
+   Hob =3D CreateHob (EFI_HOB_TYPE_FV3, sizeof (EFI_HOB_FIRMWARE_VOLUME3))=
;=0D
++  ASSERT (Hob !=3D NULL);=0D
++  if (Hob =3D=3D NULL) {=0D
++    return;=0D
++  }=0D
+ =0D
+   Hob->BaseAddress          =3D BaseAddress;=0D
+   Hob->Length               =3D Length;=0D
+@@ -546,6 +577,10 @@ BuildCpuHob (
+   EFI_HOB_CPU  *Hob;=0D
+ =0D
+   Hob =3D CreateHob (EFI_HOB_TYPE_CPU, sizeof (EFI_HOB_CPU));=0D
++  ASSERT (Hob !=3D NULL);=0D
++  if (Hob =3D=3D NULL) {=0D
++    return;=0D
++  }=0D
+ =0D
+   Hob->SizeOfMemorySpace =3D SizeOfMemorySpace;=0D
+   Hob->SizeOfIoSpace     =3D SizeOfIoSpace;=0D
+@@ -583,6 +618,10 @@ BuildStackHob (
+     );=0D
+ =0D
+   Hob =3D CreateHob (EFI_HOB_TYPE_MEMORY_ALLOCATION, sizeof (EFI_HOB_MEMO=
RY_ALLOCATION_STACK));=0D
++  ASSERT (Hob !=3D NULL);=0D
++  if (Hob =3D=3D NULL) {=0D
++    return;=0D
++  }=0D
+ =0D
+   CopyGuid (&(Hob->AllocDescriptor.Name), &gEfiHobMemoryAllocStackGuid);=
=0D
+   Hob->AllocDescriptor.MemoryBaseAddress =3D BaseAddress;=0D
+@@ -664,6 +703,10 @@ BuildMemoryAllocationHob (
+     );=0D
+ =0D
+   Hob =3D CreateHob (EFI_HOB_TYPE_MEMORY_ALLOCATION, sizeof (EFI_HOB_MEMO=
RY_ALLOCATION));=0D
++  ASSERT (Hob !=3D NULL);=0D
++  if (Hob =3D=3D NULL) {=0D
++    return;=0D
++  }=0D
+ =0D
+   ZeroMem (&(Hob->AllocDescriptor.Name), sizeof (EFI_GUID));=0D
+   Hob->AllocDescriptor.MemoryBaseAddress =3D BaseAddress;=0D
+diff --git a/UefiPayloadPkg/UefiPayloadEntry/UniversalPayloadEntry.c b/Uef=
iPayloadPkg/UefiPayloadEntry/UniversalPayloadEntry.c
+index edb3c20471..abfe75bd7b 100644
+--- a/UefiPayloadPkg/UefiPayloadEntry/UniversalPayloadEntry.c
++++ b/UefiPayloadPkg/UefiPayloadEntry/UniversalPayloadEntry.c
+@@ -111,10 +111,12 @@ AddNewHob (
+   }=0D
+ =0D
+   NewHob.Header =3D CreateHob (Hob->Header->HobType, Hob->Header->HobLeng=
th);=0D
+-=0D
+-  if (NewHob.Header !=3D NULL) {=0D
+-    CopyMem (NewHob.Header + 1, Hob->Header + 1, Hob->Header->HobLength -=
 sizeof (EFI_HOB_GENERIC_HEADER));=0D
++  ASSERT (NewHob.Header !=3D NULL);=0D
++  if (NewHob.Header =3D=3D NULL) {=0D
++    return;=0D
+   }=0D
++=0D
++  CopyMem (NewHob.Header + 1, Hob->Header + 1, Hob->Header->HobLength - s=
izeof (EFI_HOB_GENERIC_HEADER));=0D
+ }=0D
+ =0D
+ /**=0D
+--=20
+2.40.0
+
diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2022-36765-0002.patch b/meta/r=
ecipes-core/ovmf/ovmf/CVE-2022-36765-0002.patch
new file mode 100644
index 0000000000..1209be27b5
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/CVE-2022-36765-0002.patch
@@ -0,0 +1,157 @@
+From aeaee8944f0eaacbf4cdf39279785b9ba4836bb6 Mon Sep 17 00:00:00 2001
+From: Gua Guo <gua.guo@intel.com>
+Date: Thu, 11 Jan 2024 13:07:50 +0800
+Subject: [PATCH] EmbeddedPkg/Hob: Integer Overflow in CreateHob()
+
+REF: https://bugzilla.tianocore.org/show_bug.cgi?id=3D4166
+
+Fix integer overflow in various CreateHob instances.
+Fixes: CVE-2022-36765
+
+The CreateHob() function aligns the requested size to 8
+performing the following operation:
+```
+HobLength =3D (UINT16)((HobLength + 0x7) & (~0x7));
+```
+
+No checks are performed to ensure this value doesn't
+overflow, and could lead to CreateHob() returning a smaller
+HOB than requested, which could lead to OOB HOB accesses.
+
+Reported-by: Marc Beatove <mbeatove@google.com>
+Cc: Leif Lindholm <quic_llindhol@quicinc.com>
+Reviewed-by: Ard Biesheuvel <ardb+tianocore@kernel.org>
+Cc: Abner Chang <abner.chang@amd.com>
+Cc: John Mathew <john.mathews@intel.com>
+Authored-by: Gerd Hoffmann <kraxel@redhat.com>
+Signed-off-by: Gua Guo <gua.guo@intel.com>
+
+CVE: CVE-2022-36765
+
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/aeaee8=
944f0eaacbf4cdf39279785b9ba4836bb6]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ EmbeddedPkg/Library/PrePiHobLib/Hob.c | 43 +++++++++++++++++++++++++++
+ 1 file changed, 43 insertions(+)
+
+diff --git a/EmbeddedPkg/Library/PrePiHobLib/Hob.c b/EmbeddedPkg/Library/P=
rePiHobLib/Hob.c
+index 8eb175aa96..cbc35152cc 100644
+--- a/EmbeddedPkg/Library/PrePiHobLib/Hob.c
++++ b/EmbeddedPkg/Library/PrePiHobLib/Hob.c
+@@ -110,6 +110,13 @@ CreateHob (
+ =0D
+   HandOffHob =3D GetHobList ();=0D
+ =0D
++  //=0D
++  // Check Length to avoid data overflow.=0D
++  //=0D
++  if (HobLength > MAX_UINT16 - 0x7) {=0D
++    return NULL;=0D
++  }=0D
++=0D
+   HobLength =3D (UINT16)((HobLength + 0x7) & (~0x7));=0D
+ =0D
+   FreeMemory =3D HandOffHob->EfiFreeMemoryTop - HandOffHob->EfiFreeMemory=
Bottom;=0D
+@@ -160,6 +167,9 @@ BuildResourceDescriptorHob (
+ =0D
+   Hob =3D CreateHob (EFI_HOB_TYPE_RESOURCE_DESCRIPTOR, sizeof (EFI_HOB_RE=
SOURCE_DESCRIPTOR));=0D
+   ASSERT (Hob !=3D NULL);=0D
++  if (Hob =3D=3D NULL) {=0D
++    return;=0D
++  }=0D
+ =0D
+   Hob->ResourceType      =3D ResourceType;=0D
+   Hob->ResourceAttribute =3D ResourceAttribute;=0D
+@@ -401,6 +411,10 @@ BuildModuleHob (
+     );=0D
+ =0D
+   Hob =3D CreateHob (EFI_HOB_TYPE_MEMORY_ALLOCATION, sizeof (EFI_HOB_MEMO=
RY_ALLOCATION_MODULE));=0D
++  ASSERT (Hob !=3D NULL);=0D
++  if (Hob =3D=3D NULL) {=0D
++    return;=0D
++  }=0D
+ =0D
+   CopyGuid (&(Hob->MemoryAllocationHeader.Name), &gEfiHobMemoryAllocModul=
eGuid);=0D
+   Hob->MemoryAllocationHeader.MemoryBaseAddress =3D MemoryAllocationModul=
e;=0D
+@@ -449,6 +463,11 @@ BuildGuidHob (
+   ASSERT (DataLength <=3D (0xffff - sizeof (EFI_HOB_GUID_TYPE)));=0D
+ =0D
+   Hob =3D CreateHob (EFI_HOB_TYPE_GUID_EXTENSION, (UINT16)(sizeof (EFI_HO=
B_GUID_TYPE) + DataLength));=0D
++  ASSERT (Hob !=3D NULL);=0D
++  if (Hob =3D=3D NULL) {=0D
++    return NULL;=0D
++  }=0D
++=0D
+   CopyGuid (&Hob->Name, Guid);=0D
+   return Hob + 1;=0D
+ }=0D
+@@ -512,6 +531,10 @@ BuildFvHob (
+   EFI_HOB_FIRMWARE_VOLUME  *Hob;=0D
+ =0D
+   Hob =3D CreateHob (EFI_HOB_TYPE_FV, sizeof (EFI_HOB_FIRMWARE_VOLUME));=
=0D
++  ASSERT (Hob !=3D NULL);=0D
++  if (Hob =3D=3D NULL) {=0D
++    return;=0D
++  }=0D
+ =0D
+   Hob->BaseAddress =3D BaseAddress;=0D
+   Hob->Length      =3D Length;=0D
+@@ -543,6 +566,10 @@ BuildFv2Hob (
+   EFI_HOB_FIRMWARE_VOLUME2  *Hob;=0D
+ =0D
+   Hob =3D CreateHob (EFI_HOB_TYPE_FV2, sizeof (EFI_HOB_FIRMWARE_VOLUME2))=
;=0D
++  ASSERT (Hob !=3D NULL);=0D
++  if (Hob =3D=3D NULL) {=0D
++    return;=0D
++  }=0D
+ =0D
+   Hob->BaseAddress =3D BaseAddress;=0D
+   Hob->Length      =3D Length;=0D
+@@ -584,6 +611,10 @@ BuildFv3Hob (
+   EFI_HOB_FIRMWARE_VOLUME3  *Hob;=0D
+ =0D
+   Hob =3D CreateHob (EFI_HOB_TYPE_FV3, sizeof (EFI_HOB_FIRMWARE_VOLUME3))=
;=0D
++  ASSERT (Hob !=3D NULL);=0D
++  if (Hob =3D=3D NULL) {=0D
++    return;=0D
++  }=0D
+ =0D
+   Hob->BaseAddress          =3D BaseAddress;=0D
+   Hob->Length               =3D Length;=0D
+@@ -639,6 +670,10 @@ BuildCpuHob (
+   EFI_HOB_CPU  *Hob;=0D
+ =0D
+   Hob =3D CreateHob (EFI_HOB_TYPE_CPU, sizeof (EFI_HOB_CPU));=0D
++  ASSERT (Hob !=3D NULL);=0D
++  if (Hob =3D=3D NULL) {=0D
++    return;=0D
++  }=0D
+ =0D
+   Hob->SizeOfMemorySpace =3D SizeOfMemorySpace;=0D
+   Hob->SizeOfIoSpace     =3D SizeOfIoSpace;=0D
+@@ -676,6 +711,10 @@ BuildStackHob (
+     );=0D
+ =0D
+   Hob =3D CreateHob (EFI_HOB_TYPE_MEMORY_ALLOCATION, sizeof (EFI_HOB_MEMO=
RY_ALLOCATION_STACK));=0D
++  ASSERT (Hob !=3D NULL);=0D
++  if (Hob =3D=3D NULL) {=0D
++    return;=0D
++  }=0D
+ =0D
+   CopyGuid (&(Hob->AllocDescriptor.Name), &gEfiHobMemoryAllocStackGuid);=
=0D
+   Hob->AllocDescriptor.MemoryBaseAddress =3D BaseAddress;=0D
+@@ -756,6 +795,10 @@ BuildMemoryAllocationHob (
+     );=0D
+ =0D
+   Hob =3D CreateHob (EFI_HOB_TYPE_MEMORY_ALLOCATION, sizeof (EFI_HOB_MEMO=
RY_ALLOCATION));=0D
++  ASSERT (Hob !=3D NULL);=0D
++  if (Hob =3D=3D NULL) {=0D
++    return;=0D
++  }=0D
+ =0D
+   ZeroMem (&(Hob->AllocDescriptor.Name), sizeof (EFI_GUID));=0D
+   Hob->AllocDescriptor.MemoryBaseAddress =3D BaseAddress;=0D
+--=20
+2.40.0
+
diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2022-36765-0003.patch b/meta/r=
ecipes-core/ovmf/ovmf/CVE-2022-36765-0003.patch
new file mode 100644
index 0000000000..9579205e09
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/CVE-2022-36765-0003.patch
@@ -0,0 +1,135 @@
+From 9a75b030cf27d2530444e9a2f9f11867f79bf679 Mon Sep 17 00:00:00 2001
+From: Gua Guo <gua.guo@intel.com>
+Date: Thu, 11 Jan 2024 13:03:26 +0800
+Subject: [PATCH] StandaloneMmPkg/Hob: Integer Overflow in CreateHob()
+
+REF: https://bugzilla.tianocore.org/show_bug.cgi?id=3D4166
+
+Fix integer overflow in various CreateHob instances.
+Fixes: CVE-2022-36765
+
+The CreateHob() function aligns the requested size to 8
+performing the following operation:
+```
+HobLength =3D (UINT16)((HobLength + 0x7) & (~0x7));
+```
+
+No checks are performed to ensure this value doesn't
+overflow, and could lead to CreateHob() returning a smaller
+HOB than requested, which could lead to OOB HOB accesses.
+
+Reported-by: Marc Beatove <mbeatove@google.com>
+Reviewed-by: Ard Biesheuvel <ardb+tianocore@kernel.org>
+Cc: Sami Mujawar <sami.mujawar@arm.com>
+Reviewed-by: Ray Ni <ray.ni@intel.com>
+Cc: John Mathew <john.mathews@intel.com>
+Authored-by: Gerd Hoffmann <kraxel@redhat.com>
+Signed-off-by: Gua Guo <gua.guo@intel.com>
+
+CVE: CVE-2022-36765
+
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/9a75b0=
30cf27d2530444e9a2f9f11867f79bf679]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ .../Arm/StandaloneMmCoreHobLib.c              | 35 +++++++++++++++++++
+ 1 file changed, 35 insertions(+)
+
+diff --git a/StandaloneMmPkg/Library/StandaloneMmCoreHobLib/Arm/Standalone=
MmCoreHobLib.c b/StandaloneMmPkg/Library/StandaloneMmCoreHobLib/Arm/Standal=
oneMmCoreHobLib.c
+index 1550e1babc..59473e28fe 100644
+--- a/StandaloneMmPkg/Library/StandaloneMmCoreHobLib/Arm/StandaloneMmCoreH=
obLib.c
++++ b/StandaloneMmPkg/Library/StandaloneMmCoreHobLib/Arm/StandaloneMmCoreH=
obLib.c
+@@ -34,6 +34,13 @@ CreateHob (
+ =0D
+   HandOffHob =3D GetHobList ();=0D
+ =0D
++  //=0D
++  // Check Length to avoid data overflow.=0D
++  //=0D
++  if (HobLength > MAX_UINT16 - 0x7) {=0D
++    return NULL;=0D
++  }=0D
++=0D
+   HobLength =3D (UINT16)((HobLength + 0x7) & (~0x7));=0D
+ =0D
+   FreeMemory =3D HandOffHob->EfiFreeMemoryTop - HandOffHob->EfiFreeMemory=
Bottom;=0D
+@@ -89,6 +96,10 @@ BuildModuleHob (
+     );=0D
+ =0D
+   Hob =3D CreateHob (EFI_HOB_TYPE_MEMORY_ALLOCATION, sizeof (EFI_HOB_MEMO=
RY_ALLOCATION_MODULE));=0D
++  ASSERT (Hob !=3D NULL);=0D
++  if (Hob =3D=3D NULL) {=0D
++    return;=0D
++  }=0D
+ =0D
+   CopyGuid (&(Hob->MemoryAllocationHeader.Name), &gEfiHobMemoryAllocModul=
eGuid);=0D
+   Hob->MemoryAllocationHeader.MemoryBaseAddress =3D MemoryAllocationModul=
e;=0D
+@@ -129,6 +140,9 @@ BuildResourceDescriptorHob (
+ =0D
+   Hob =3D CreateHob (EFI_HOB_TYPE_RESOURCE_DESCRIPTOR, sizeof (EFI_HOB_RE=
SOURCE_DESCRIPTOR));=0D
+   ASSERT (Hob !=3D NULL);=0D
++  if (Hob =3D=3D NULL) {=0D
++    return;=0D
++  }=0D
+ =0D
+   Hob->ResourceType      =3D ResourceType;=0D
+   Hob->ResourceAttribute =3D ResourceAttribute;=0D
+@@ -167,6 +181,11 @@ BuildGuidHob (
+   ASSERT (DataLength <=3D (0xffff - sizeof (EFI_HOB_GUID_TYPE)));=0D
+ =0D
+   Hob =3D CreateHob (EFI_HOB_TYPE_GUID_EXTENSION, (UINT16)(sizeof (EFI_HO=
B_GUID_TYPE) + DataLength));=0D
++  ASSERT (Hob !=3D NULL);=0D
++  if (Hob =3D=3D NULL) {=0D
++    return NULL;=0D
++  }=0D
++=0D
+   CopyGuid (&Hob->Name, Guid);=0D
+   return Hob + 1;=0D
+ }=0D
+@@ -226,6 +245,10 @@ BuildFvHob (
+   EFI_HOB_FIRMWARE_VOLUME  *Hob;=0D
+ =0D
+   Hob =3D CreateHob (EFI_HOB_TYPE_FV, sizeof (EFI_HOB_FIRMWARE_VOLUME));=
=0D
++  ASSERT (Hob !=3D NULL);=0D
++  if (Hob =3D=3D NULL) {=0D
++    return;=0D
++  }=0D
+ =0D
+   Hob->BaseAddress =3D BaseAddress;=0D
+   Hob->Length      =3D Length;=0D
+@@ -255,6 +278,10 @@ BuildFv2Hob (
+   EFI_HOB_FIRMWARE_VOLUME2  *Hob;=0D
+ =0D
+   Hob =3D CreateHob (EFI_HOB_TYPE_FV2, sizeof (EFI_HOB_FIRMWARE_VOLUME2))=
;=0D
++  ASSERT (Hob !=3D NULL);=0D
++  if (Hob =3D=3D NULL) {=0D
++    return;=0D
++  }=0D
+ =0D
+   Hob->BaseAddress =3D BaseAddress;=0D
+   Hob->Length      =3D Length;=0D
+@@ -282,6 +309,10 @@ BuildCpuHob (
+   EFI_HOB_CPU  *Hob;=0D
+ =0D
+   Hob =3D CreateHob (EFI_HOB_TYPE_CPU, sizeof (EFI_HOB_CPU));=0D
++  ASSERT (Hob !=3D NULL);=0D
++  if (Hob =3D=3D NULL) {=0D
++    return;=0D
++  }=0D
+ =0D
+   Hob->SizeOfMemorySpace =3D SizeOfMemorySpace;=0D
+   Hob->SizeOfIoSpace     =3D SizeOfIoSpace;=0D
+@@ -319,6 +350,10 @@ BuildMemoryAllocationHob (
+     );=0D
+ =0D
+   Hob =3D CreateHob (EFI_HOB_TYPE_MEMORY_ALLOCATION, sizeof (EFI_HOB_MEMO=
RY_ALLOCATION));=0D
++  ASSERT (Hob !=3D NULL);=0D
++  if (Hob =3D=3D NULL) {=0D
++    return;=0D
++  }=0D
+ =0D
+   ZeroMem (&(Hob->AllocDescriptor.Name), sizeof (EFI_GUID));=0D
+   Hob->AllocDescriptor.MemoryBaseAddress =3D BaseAddress;=0D
+--=20
+2.40.0
+
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ov=
mf_git.bb
index dbfed086e4..1dba709824 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -50,6 +50,9 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=
=3Dmaster;protocol=3Dhttps \
            file://CVE-2023-45237-0001.patch \
            file://CVE-2023-45237-0002.patch \
            file://CVE-2023-45236.patch \
+           file://CVE-2022-36765-0001.patch \
+           file://CVE-2022-36765-0002.patch \
+           file://CVE-2022-36765-0003.patch \
            "
=20
 PV =3D "edk2-stable202202"
--=20
2.25.1


