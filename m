Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1875C36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 11:44:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.45250.1744026245378100599
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 04:44:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6192bc662b=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5374k23V020179
	for <openembedded-core@lists.openembedded.org>; Mon, 7 Apr 2025 04:44:05 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45u41m1ted-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 04:44:04 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 7 Apr 2025 04:44:04 -0700
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 7 Apr 2025 04:44:03 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] ovmf: fix CVE-2025-2295
Date: Mon, 7 Apr 2025 19:44:02 +0800
Message-ID: <20250407114402.1612096-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Proofpoint-GUID: jkQ4yM1VAosKmCDZNjtYjik2smafFO0w
X-Proofpoint-ORIG-GUID: jkQ4yM1VAosKmCDZNjtYjik2smafFO0w
X-Authority-Analysis: v=2.4 cv=QOZoRhLL c=1 sm=1 tr=0 ts=67f3ba84 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=XR8D0OoHHMoA:10 a=PYnjg3YJAAAA:8 a=xNf9USuDAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=j59TsiCqwUfw_GPqhyAA:9 a=RVmHIydaz68A:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_03,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 spamscore=0 mlxscore=0
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504070083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 11:44:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214453

According to [1], EDK2 contains a vulnerability in BIOS where a user may
cause an Integer Overflow or Wraparound by network means. A successful
exploitation of this vulnerability may lead to denial of service.

Refer debian [2], backport a patch from edk2 [3] to fix CVE-2025-2295

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-2295
[2] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D1100594
[3] https://github.com/tianocore/edk2/commit/17cdc512f02a2dfd1b9e24133da56f=
dda099abda

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../ovmf/ovmf/CVE-2025-2295.patch             | 56 +++++++++++++++++++
 meta/recipes-core/ovmf/ovmf_git.bb            |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2025-2295.patch

diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2025-2295.patch b/meta/recipes=
-core/ovmf/ovmf/CVE-2025-2295.patch
new file mode 100644
index 00000000000..038a3f2dbc7
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/CVE-2025-2295.patch
@@ -0,0 +1,56 @@
+From 4b028816b5619ede6c3720664478055e09151516 Mon Sep 17 00:00:00 2001
+From: Madhavan <madavtechy@gmail.com>
+Date: Fri, 14 Mar 2025 14:15:13 -0400
+Subject: [PATCH] NetworkPkg/IScsiDxe:Fix for Remote Memory Exposure in ISC=
SI
+ bz4206
+
+Used SafeUint32Add to calculate and validate OutTransferLength with
+boundary check in IScsiOnR2TRcvd to avoid integer overflow
+
+Signed-off-by: Madhavan <madavtechy@gmail.com>
+
+CVE: CVE-2025-2295
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/17cdc5=
12f02a2dfd1b9e24133da56fdda099abda]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ NetworkPkg/IScsiDxe/IScsiProto.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/NetworkPkg/IScsiDxe/IScsiProto.c b/NetworkPkg/IScsiDxe/IScsiP=
roto.c
+index ef587649a0..fb48e6304d 100644
+--- a/NetworkPkg/IScsiDxe/IScsiProto.c
++++ b/NetworkPkg/IScsiDxe/IScsiProto.c
+@@ -1,7 +1,7 @@
+ /** @file=0D
+   The implementation of iSCSI protocol based on RFC3720.=0D
+ =0D
+-Copyright (c) 2004 - 2018, Intel Corporation. All rights reserved.<BR>=0D
++Copyright (c) 2004 - 2025, Intel Corporation. All rights reserved.<BR>=0D
+ SPDX-License-Identifier: BSD-2-Clause-Patent=0D
+ =0D
+ **/=0D
+@@ -2682,6 +2682,7 @@ IScsiOnR2TRcvd (
+   EFI_STATUS               Status;=0D
+   ISCSI_XFER_CONTEXT       *XferContext;=0D
+   UINT8                    *Data;=0D
++  UINT32                   TransferLength;=0D
+ =0D
+   R2THdr =3D (ISCSI_READY_TO_TRANSFER *)NetbufGetByte (Pdu, 0, NULL);=0D
+   if (R2THdr =3D=3D NULL) {=0D
+@@ -2712,7 +2713,12 @@ IScsiOnR2TRcvd (
+   XferContext->Offset            =3D R2THdr->BufferOffset;=0D
+   XferContext->DesiredLength     =3D R2THdr->DesiredDataTransferLength;=0D
+ =0D
+-  if (((XferContext->Offset + XferContext->DesiredLength) > Packet->OutTr=
ansferLength) ||=0D
++  Status =3D SafeUint32Add (XferContext->Offset, XferContext->DesiredLeng=
th, &TransferLength);=0D
++  if (EFI_ERROR (Status)) {=0D
++    return EFI_PROTOCOL_ERROR;=0D
++  }=0D
++=0D
++  if ((TransferLength > Packet->OutTransferLength) ||=0D
+       (XferContext->DesiredLength > Tcb->Conn->Session->MaxBurstLength)=0D
+       )=0D
+   {=0D
+--=20
+2.48.1
+
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ov=
mf_git.bb
index 764d79854ff..41ab85b703c 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -26,6 +26,7 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=
=3Dmaster;protocol=3Dhttps \
            file://0002-BaseTools-makefile-adjust-to-build-in-under-bitbake=
.patch \
            file://0003-debug-prefix-map.patch \
            file://0004-reproducible.patch \
+           file://CVE-2025-2295.patch \
            "
=20
 PV =3D "edk2-stable202411"
--=20
2.34.1


