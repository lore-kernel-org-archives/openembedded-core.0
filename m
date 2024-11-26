Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85E84D5A6CC
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 02:25:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.36609.1732587950363755919
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 18:25:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1060df9989=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQ1KgEL007184;
	Tue, 26 Nov 2024 02:25:49 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 433618aq0g-12
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 26 Nov 2024 02:25:49 +0000 (GMT)
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
Subject: [kirkstone][PATCH V2 12/13] ovmf: fix CVE-2024-38796
Date: Mon, 25 Nov 2024 18:25:25 -0800
Message-ID: <20241126022526.3389121-12-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241126022526.3389121-1-hongxu.jia@windriver.com>
References: <20241126022526.3389121-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 8xQFjVPngKlbg3mC9bLA8vb7Pu--0SxR
X-Proofpoint-GUID: 8xQFjVPngKlbg3mC9bLA8vb7Pu--0SxR
X-Authority-Analysis: v=2.4 cv=O65rvw9W c=1 sm=1 tr=0 ts=674531ad cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VlfZXiiP6vEA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=yMhMjlubAAAA:8 a=QyXUC8HyAAAA:8 a=qt-1hB-tNSDAmjCVnBUA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-11-26_01,2024-11-25_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 bulkscore=0 mlxlogscore=790 spamscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2411260019
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 02:25:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207836

Backport a fix from upstream to resolve CVE-2024-38796

    https://github.com/tianocore/edk2/commit/c95233b8525ca6828921affd149614=
6cff262e65

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...-Fix-overflow-issue-in-BasePeCoffLib.patch | 37 +++++++++++++++++++
 meta/recipes-core/ovmf/ovmf_git.bb            |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-core/ovmf/ovmf/0001-MdePkg-Fix-overflow-is=
sue-in-BasePeCoffLib.patch

diff --git a/meta/recipes-core/ovmf/ovmf/0001-MdePkg-Fix-overflow-issue-in-=
BasePeCoffLib.patch b/meta/recipes-core/ovmf/ovmf/0001-MdePkg-Fix-overflow-=
issue-in-BasePeCoffLib.patch
new file mode 100644
index 0000000000..8d36bdf1c1
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/0001-MdePkg-Fix-overflow-issue-in-BasePeC=
offLib.patch
@@ -0,0 +1,37 @@
+From c4d6af8428375c0343fcfd20bf1465e6d4be4690 Mon Sep 17 00:00:00 2001
+From: Doug Flick <dougflick@microsoft.com>
+Date: Fri, 22 Nov 2024 17:44:27 +0800
+Subject: [PATCH] MdePkg: Fix overflow issue in BasePeCoffLib
+
+The RelocDir->Size is a UINT32 value, and RelocDir->VirtualAddress is
+also a UINT32 value. The current code does not check for overflow when
+adding RelocDir->Size to RelocDir->VirtualAddress. This patch adds a
+check to ensure that the addition does not overflow.
+
+Signed-off-by: Doug Flick <dougflick@microsoft.com>
+Authored-by: sriraamx gobichettipalayam <sri..@intel.com>
+
+CVE: CVE-2024-38796
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/c95233=
b8525ca6828921affd1496146cff262e65]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ MdePkg/Library/BasePeCoffLib/BasePeCoff.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/MdePkg/Library/BasePeCoffLib/BasePeCoff.c b/MdePkg/Library/Ba=
sePeCoffLib/BasePeCoff.c
+index 6d8d9faeb8..2339b111b5 100644
+--- a/MdePkg/Library/BasePeCoffLib/BasePeCoff.c
++++ b/MdePkg/Library/BasePeCoffLib/BasePeCoff.c
+@@ -1014,7 +1014,7 @@ PeCoffLoaderRelocateImage (
+     RelocDir =3D &Hdr.Te->DataDirectory[0];=0D
+   }=0D
+ =0D
+-  if ((RelocDir !=3D NULL) && (RelocDir->Size > 0)) {=0D
++  if ((RelocDir !=3D NULL) && (RelocDir->Size > 0) && (RelocDir->Size - 1=
 < MAX_UINT32 - RelocDir->VirtualAddress)) {=0D
+     RelocBase    =3D (EFI_IMAGE_BASE_RELOCATION *)PeCoffLoaderImageAddres=
s (ImageContext, RelocDir->VirtualAddress, TeStrippedOffset);=0D
+     RelocBaseEnd =3D (EFI_IMAGE_BASE_RELOCATION *)PeCoffLoaderImageAddres=
s (=0D
+                                                   ImageContext,=0D
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ov=
mf_git.bb
index 1dba709824..e626d306a4 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -53,6 +53,7 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=
=3Dmaster;protocol=3Dhttps \
            file://CVE-2022-36765-0001.patch \
            file://CVE-2022-36765-0002.patch \
            file://CVE-2022-36765-0003.patch \
+           file://0001-MdePkg-Fix-overflow-issue-in-BasePeCoffLib.patch \
            "
=20
 PV =3D "edk2-stable202202"
--=20
2.25.1


