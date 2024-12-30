Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D100E77188
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 14:33:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.63166.1735569180904514205
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Dec 2024 06:33:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=30946ffcbd=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BUDPXaH027819;
	Mon, 30 Dec 2024 14:33:00 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43t6j0hrnm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 30 Dec 2024 14:32:59 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 30 Dec 2024 06:32:58 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 30 Dec 2024 06:32:58 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <steve@sakoman.com>
Subject: [scarthgap][PATCH] ovmf: fix CVE-2024-38805
Date: Mon, 30 Dec 2024 06:32:58 -0800
Message-ID: <20241230143258.2992487-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=V7KH0fni c=1 sm=1 tr=0 ts=6772af1b cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=RZcAm9yDv7YA:10 a=NEAV23lmAAAA:8 a=hqBzw_eTAAAA:8 a=xjGz-wBMAAAA:8 a=t7CeM3EgAAAA:8 a=yBuf_3pMAAAA:8 a=20KFwNOVAAAA:8
 a=QYfpudqS8712woE2VTkA:9 a=bkWp_v3HvcftT6DRAIDL:22 a=dmbvPvuLAiAwK5y7oBu2:22 a=FdTzh2GWekK77mhwV6Dw:22 a=cF66dUKAeZLEmaOjNXpK:22
X-Proofpoint-ORIG-GUID: AUpcTG15jY9Vu7q6gP_ZuTcDOLBgobLI
X-Proofpoint-GUID: AUpcTG15jY9Vu7q6gP_ZuTcDOLBgobLI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-30_06,2024-12-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2412300126
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 14:33:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209163

A malicious iSCSI target could reply to the iSCSI initiator with a
malformed packet, causing out-of-bounds memory reads and writes.
This most likely leads to a denial of service, as the write
primitive should not be exploitable.

References:
https://github.com/tianocore/edk2/issues/10314

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...Dxe-add-checks-to-IScsiBuildKeyValue.patch | 60 +++++++++++++++++++
 meta/recipes-core/ovmf/ovmf_git.bb            |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-core/ovmf/ovmf/0001-NetworkPkg-IScsiDxe-ad=
d-checks-to-IScsiBuildKeyValue.patch

diff --git a/meta/recipes-core/ovmf/ovmf/0001-NetworkPkg-IScsiDxe-add-check=
s-to-IScsiBuildKeyValue.patch b/meta/recipes-core/ovmf/ovmf/0001-NetworkPkg=
-IScsiDxe-add-checks-to-IScsiBuildKeyValue.patch
new file mode 100644
index 0000000000..d121e066f6
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/0001-NetworkPkg-IScsiDxe-add-checks-to-IS=
csiBuildKeyValue.patch
@@ -0,0 +1,60 @@
+From dfd8ef9a9e396c4979239e518525d0b77c7715da Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Sun, 29 Dec 2024 21:58:05 +0800
+Subject: [PATCH] NetworkPkg/IScsiDxe: add checks to IScsiBuildKeyValueList
+
+Check we have any data left (Len > 0) before advancing the Data pointer
+and reducing Len.  Avoids wrapping Len.
+
+Also replace the AsciiStrLen() call with an open-coded loop which
+likewise checks Len to make sure we don't overrun the buffer.
+
+Bugzilla: https://bugzilla.tianocore.org/show_bug.cgi?id=3D4207
+Reported-by: Jeremy Boone <jeremy.boone@nccgroup.com>
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+
+CVE: CVE-2024-38805
+Upstream-Status: Backport [https://edk2.groups.io/g/devel/message/106280]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ NetworkPkg/IScsiDxe/IScsiProto.c | 16 ++++++++++++----
+ 1 file changed, 12 insertions(+), 4 deletions(-)
+
+diff --git a/NetworkPkg/IScsiDxe/IScsiProto.c b/NetworkPkg/IScsiDxe/IScsiP=
roto.c
+index ef58764..88e7946 100644
+--- a/NetworkPkg/IScsiDxe/IScsiProto.c
++++ b/NetworkPkg/IScsiDxe/IScsiProto.c
+@@ -1903,9 +1903,8 @@ IScsiBuildKeyValueList (
+       Data++;=0D
+     }=0D
+ =0D
+-    if (*Data =3D=3D '=3D') {=0D
++    if ((Len > 0) && (*Data =3D=3D '=3D')) {=0D
+       *Data =3D '\0';=0D
+-=0D
+       Data++;=0D
+       Len--;=0D
+     } else {=0D
+@@ -1917,8 +1916,17 @@ IScsiBuildKeyValueList (
+ =0D
+     InsertTailList (ListHead, &KeyValuePair->List);=0D
+ =0D
+-    Data +=3D AsciiStrLen (KeyValuePair->Value) + 1;=0D
+-    Len  -=3D (UINT32)AsciiStrLen (KeyValuePair->Value) + 1;=0D
++    while ((Len > 0) && (*Data !=3D '\0')) {=0D
++      Len--;=0D
++      Data++;=0D
++    }=0D
++=0D
++    if ((Len > 0) && (*Data =3D=3D '\0')) {=0D
++      Data++;=0D
++      Len--;=0D
++    } else {=0D
++      goto ON_ERROR;=0D
++    }=0D
+   }=0D
+ =0D
+   return ListHead;=0D
+--=20
+2.27.0
+
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ov=
mf_git.bb
index ada6ee72db..eeff5da991 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -26,6 +26,7 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=
=3Dmaster;protocol=3Dhttps \
            file://0004-reproducible.patch \
            file://0001-MdePkg-Fix-overflow-issue-in-BasePeCoffLib.patch \
            file://0001-MdeModulePkg-Potential-UINT32-overflow-in-S3-Resume=
C.patch \
+           file://0001-NetworkPkg-IScsiDxe-add-checks-to-IScsiBuildKeyValu=
e.patch \
            "
=20
 PV =3D "edk2-stable202402"
--=20
2.25.1


