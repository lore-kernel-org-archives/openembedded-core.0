Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C1A4D5A6CC
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 02:25:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.36923.1732587947148046803
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 18:25:47 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1060df9989=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQ1KgEH007184;
	Tue, 26 Nov 2024 02:25:46 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 433618aq0g-8
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 26 Nov 2024 02:25:45 +0000 (GMT)
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
Subject: [kirkstone][PATCH V2 08/13] ovmf: Fix CVE-2023-45229
Date: Mon, 25 Nov 2024 18:25:21 -0800
Message-ID: <20241126022526.3389121-8-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241126022526.3389121-1-hongxu.jia@windriver.com>
References: <20241126022526.3389121-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 9jKz55rwy37SCKVY8TGhPbMkgBo6fEv-
X-Proofpoint-GUID: 9jKz55rwy37SCKVY8TGhPbMkgBo6fEv-
X-Authority-Analysis: v=2.4 cv=O65rvw9W c=1 sm=1 tr=0 ts=674531aa cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VlfZXiiP6vEA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=hqBzw_eTAAAA:8 a=XkRKQH6RAAAA:8 a=QQrwgld0AAAA:8 a=VKio34HhAAAA:8
 a=t7CeM3EgAAAA:8 a=yMhMjlubAAAA:8 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8 a=COk6AnOGAAAA:8 a=wpvmLeFpByndl7j4LjUA:9 a=3YgzRljvZfCK9fvt:21 a=lBZTsuZDXdQA:10 a=Hv90Ch-Tvl0A:10 a=bkWp_v3HvcftT6DRAIDL:22 a=1gUyE30hU_ULiMxJiLUW:22 a=GixL4z90Y-kx4mQuXZm8:22
 a=ALVy6clGPs_Yy9GZ8Zsv:22 a=FdTzh2GWekK77mhwV6Dw:22 a=TjNXssC_j7lpFel5tvFf:22
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
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 02:25:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207832

From: Soumya Sambu <soumya.sambu@windriver.com>

EDK2's Network Package is susceptible to an out-of-bounds read
vulnerability when processing the IA_NA or IA_TA option in a DHCPv6
Advertise message. This vulnerability can be exploited by an attacker
to gain unauthorized access and potentially lead to a loss of
Confidentiality.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-45229

Upstream-patches:
https://github.com/tianocore/edk2/commit/1dbb10cc52dc8ef49bb700daa1cefc76b2=
6d52e0
https://github.com/tianocore/edk2/commit/07362769ab7a7d74dbea1c7a7a3662c7b5=
d1f097
https://github.com/tianocore/edk2/commit/1c440a5eceedc64e892877eeac0f1a4938=
f5abbb
https://github.com/tianocore/edk2/commit/1d0b95f6457d225c5108302a9da74b4ed7=
aa5a38

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../ovmf/ovmf/CVE-2023-45229-0001.patch       | 604 ++++++++++++++++++
 .../ovmf/ovmf/CVE-2023-45229-0002.patch       | 539 ++++++++++++++++
 .../ovmf/ovmf/CVE-2023-45229-0003.patch       | 244 +++++++
 .../ovmf/ovmf/CVE-2023-45229-0004.patch       | 157 +++++
 meta/recipes-core/ovmf/ovmf_git.bb            |   4 +
 5 files changed, 1548 insertions(+)
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2023-45229-0001.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2023-45229-0002.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2023-45229-0003.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2023-45229-0004.patch

diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2023-45229-0001.patch b/meta/r=
ecipes-core/ovmf/ovmf/CVE-2023-45229-0001.patch
new file mode 100644
index 0000000000..9d8549b27d
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/CVE-2023-45229-0001.patch
@@ -0,0 +1,604 @@
+From 1dbb10cc52dc8ef49bb700daa1cefc76b26d52e0 Mon Sep 17 00:00:00 2001
+From: "Doug Flick via groups.io" <dougflick=3Dmicrosoft.com@groups.io>
+Date: Fri, 26 Jan 2024 05:54:46 +0800
+Subject: [PATCH] NetworkPkg: Dhcp6Dxe: SECURITY PATCH CVE-2023-45229 Patch
+
+REF: https://bugzilla.tianocore.org/show_bug.cgi?id=3D4534
+
+Bug Details:
+PixieFail Bug #1
+CVE-2023-45229
+CVSS 6.5 : CVSS:3.1/AV:A/AC:L/PR:N/UI:N/S:U/C:H/I:N/A:N
+CWE-125 Out-of-bounds Read
+
+Change Overview:
+
+Introduce Dhcp6SeekInnerOptionSafe which performs checks before seeking
+the Inner Option from a DHCP6 Option.
+
+>
+> EFI_STATUS
+> Dhcp6SeekInnerOptionSafe (
+>  IN  UINT16  IaType,
+>  IN  UINT8   *Option,
+>  IN  UINT32  OptionLen,
+>  OUT UINT8   **IaInnerOpt,
+>  OUT UINT16  *IaInnerLen
+>  );
+>
+
+Lots of code cleanup to improve code readability.
+
+Cc: Saloni Kasbekar <saloni.kasbekar@intel.com>
+Cc: Zachary Clark-williams <zachary.clark-williams@intel.com>
+
+Signed-off-by: Doug Flick [MSFT] <doug.edk2@gmail.com>
+Reviewed-by: Saloni Kasbekar <saloni.kasbekar@intel.com>
+
+CVE: CVE-2023-45229
+
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/1dbb10=
cc52dc8ef49bb700daa1cefc76b26d52e0]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ NetworkPkg/Dhcp6Dxe/Dhcp6Impl.h | 138 +++++++++++++++++++---
+ NetworkPkg/Dhcp6Dxe/Dhcp6Io.c   | 203 +++++++++++++++++++++-----------
+ 2 files changed, 256 insertions(+), 85 deletions(-)
+
+diff --git a/NetworkPkg/Dhcp6Dxe/Dhcp6Impl.h b/NetworkPkg/Dhcp6Dxe/Dhcp6Im=
pl.h
+index f2422c2f28..220e7c68f1 100644
+--- a/NetworkPkg/Dhcp6Dxe/Dhcp6Impl.h
++++ b/NetworkPkg/Dhcp6Dxe/Dhcp6Impl.h
+@@ -45,6 +45,20 @@ typedef struct _DHCP6_INSTANCE  DHCP6_INSTANCE;
+ #define DHCP6_SERVICE_SIGNATURE   SIGNATURE_32 ('D', 'H', '6', 'S')=0D
+ #define DHCP6_INSTANCE_SIGNATURE  SIGNATURE_32 ('D', 'H', '6', 'I')=0D
+ =0D
++#define DHCP6_PACKET_ALL        0=0D
++#define DHCP6_PACKET_STATEFUL   1=0D
++#define DHCP6_PACKET_STATELESS  2=0D
++=0D
++#define DHCP6_BASE_PACKET_SIZE  1024=0D
++=0D
++#define DHCP6_PORT_CLIENT  546=0D
++#define DHCP6_PORT_SERVER  547=0D
++=0D
++#define DHCP_CHECK_MEDIA_WAITING_TIME  EFI_TIMER_PERIOD_SECONDS(20)=0D
++=0D
++#define DHCP6_INSTANCE_FROM_THIS(Instance)  CR ((Instance), DHCP6_INSTANC=
E, Dhcp6, DHCP6_INSTANCE_SIGNATURE)=0D
++#define DHCP6_SERVICE_FROM_THIS(Service)    CR ((Service), DHCP6_SERVICE,=
 ServiceBinding, DHCP6_SERVICE_SIGNATURE)=0D
++=0D
+ //=0D
+ // For more information on DHCP options see RFC 8415, Section 21.1=0D
+ //=0D
+@@ -59,12 +73,10 @@ typedef struct _DHCP6_INSTANCE  DHCP6_INSTANCE;
+ //    |                      (option-len octets)                      |=0D
+ //    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+=0D
+ //=0D
+-#define DHCP6_SIZE_OF_OPT_CODE  (sizeof(UINT16))=0D
+-#define DHCP6_SIZE_OF_OPT_LEN   (sizeof(UINT16))=0D
++#define DHCP6_SIZE_OF_OPT_CODE  (sizeof (((EFI_DHCP6_PACKET_OPTION *)0)->=
OpCode))=0D
++#define DHCP6_SIZE_OF_OPT_LEN   (sizeof (((EFI_DHCP6_PACKET_OPTION *)0)->=
OpLen))=0D
+ =0D
+-//=0D
+ // Combined size of Code and Length=0D
+-//=0D
+ #define DHCP6_SIZE_OF_COMBINED_CODE_AND_LEN  (DHCP6_SIZE_OF_OPT_CODE + \=
=0D
+                                               DHCP6_SIZE_OF_OPT_LEN)=0D
+ =0D
+@@ -73,34 +85,122 @@ STATIC_ASSERT (
+   "Combined size of Code and Length must be 4 per RFC 8415"=0D
+   );=0D
+ =0D
+-//=0D
+ // Offset to the length is just past the code=0D
+-//=0D
+-#define DHCP6_OPT_LEN_OFFSET(a)  (a + DHCP6_SIZE_OF_OPT_CODE)=0D
++#define DHCP6_OFFSET_OF_OPT_LEN(a)  (a + DHCP6_SIZE_OF_OPT_CODE)=0D
+ STATIC_ASSERT (=0D
+-  DHCP6_OPT_LEN_OFFSET (0) =3D=3D 2,=0D
++  DHCP6_OFFSET_OF_OPT_LEN (0) =3D=3D 2,=0D
+   "Offset of length is + 2 past start of option"=0D
+   );=0D
+ =0D
+-#define DHCP6_OPT_DATA_OFFSET(a)  (a + DHCP6_SIZE_OF_COMBINED_CODE_AND_LE=
N)=0D
++#define DHCP6_OFFSET_OF_OPT_DATA(a)  (a + DHCP6_SIZE_OF_COMBINED_CODE_AND=
_LEN)=0D
+ STATIC_ASSERT (=0D
+-  DHCP6_OPT_DATA_OFFSET (0) =3D=3D 4,=0D
++  DHCP6_OFFSET_OF_OPT_DATA (0) =3D=3D 4,=0D
+   "Offset to option data should be +4 from start of option"=0D
+   );=0D
++//=0D
++// Identity Association options (both NA (Non-Temporary) and TA (Temporar=
y Association))=0D
++// are defined in RFC 8415 and are a deriviation of a TLV stucture=0D
++// For more information on IA_NA see Section 21.4=0D
++// For more information on IA_TA see Section 21.5=0D
++//=0D
++//=0D
++//  The format of IA_NA and IA_TA option:=0D
++//=0D
++//     0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1=0D
++//    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+=0D
++//    |          OPTION_IA_NA         |          option-len           |=0D
++//    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+=0D
++//    |                        IAID (4 octets)                        |=0D
++//    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+=0D
++//    |                        T1 (only for IA_NA)                    |=0D
++//    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+=0D
++//    |                        T2 (only for IA_NA)                    |=0D
++//    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+=0D
++//    |                                                               |=0D
++//    .                  IA_NA-options/IA_TA-options                  .=0D
++//    .                                                               .=0D
++//    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+=0D
++//=0D
++#define DHCP6_SIZE_OF_IAID           (sizeof(UINT32))=0D
++#define DHCP6_SIZE_OF_TIME_INTERVAL  (sizeof(UINT32))=0D
+ =0D
+-#define DHCP6_PACKET_ALL        0=0D
+-#define DHCP6_PACKET_STATEFUL   1=0D
+-#define DHCP6_PACKET_STATELESS  2=0D
++// Combined size of IAID, T1, and T2=0D
++#define DHCP6_SIZE_OF_COMBINED_IAID_T1_T2  (DHCP6_SIZE_OF_IAID +  \=0D
++                                            DHCP6_SIZE_OF_TIME_INTERVAL +=
 \=0D
++                                            DHCP6_SIZE_OF_TIME_INTERVAL)=
=0D
++STATIC_ASSERT (=0D
++  DHCP6_SIZE_OF_COMBINED_IAID_T1_T2 =3D=3D 12,=0D
++  "Combined size of IAID, T1, T2 must be 12 per RFC 8415"=0D
++  );=0D
+ =0D
+-#define DHCP6_BASE_PACKET_SIZE  1024=0D
++// This is the size of IA_TA without options=0D
++#define DHCP6_MIN_SIZE_OF_IA_TA  (DHCP6_SIZE_OF_COMBINED_CODE_AND_LEN + \=
=0D
++                                  DHCP6_SIZE_OF_IAID)=0D
++STATIC_ASSERT (=0D
++  DHCP6_MIN_SIZE_OF_IA_TA =3D=3D 8,=0D
++  "Minimum combined size of IA_TA per RFC 8415"=0D
++  );=0D
+ =0D
+-#define DHCP6_PORT_CLIENT  546=0D
+-#define DHCP6_PORT_SERVER  547=0D
++// Offset to a IA_TA inner option=0D
++#define DHCP6_OFFSET_OF_IA_TA_INNER_OPT(a)  (a + DHCP6_MIN_SIZE_OF_IA_TA)=
=0D
++STATIC_ASSERT (=0D
++  DHCP6_OFFSET_OF_IA_TA_INNER_OPT (0) =3D=3D 8,=0D
++  "Offset of IA_TA Inner option is + 8 past start of option"=0D
++  );=0D
+ =0D
+-#define DHCP_CHECK_MEDIA_WAITING_TIME  EFI_TIMER_PERIOD_SECONDS(20)=0D
++// This is the size of IA_NA without options (16)=0D
++#define DHCP6_MIN_SIZE_OF_IA_NA  DHCP6_SIZE_OF_COMBINED_CODE_AND_LEN + \=
=0D
++                                 DHCP6_SIZE_OF_COMBINED_IAID_T1_T2=0D
++STATIC_ASSERT (=0D
++  DHCP6_MIN_SIZE_OF_IA_NA =3D=3D 16,=0D
++  "Minimum combined size of IA_TA per RFC 8415"=0D
++  );=0D
+ =0D
+-#define DHCP6_INSTANCE_FROM_THIS(Instance)  CR ((Instance), DHCP6_INSTANC=
E, Dhcp6, DHCP6_INSTANCE_SIGNATURE)=0D
+-#define DHCP6_SERVICE_FROM_THIS(Service)    CR ((Service), DHCP6_SERVICE,=
 ServiceBinding, DHCP6_SERVICE_SIGNATURE)=0D
++#define DHCP6_OFFSET_OF_IA_NA_INNER_OPT(a)  (a + DHCP6_MIN_SIZE_OF_IA_NA)=
=0D
++STATIC_ASSERT (=0D
++  DHCP6_OFFSET_OF_IA_NA_INNER_OPT (0) =3D=3D 16,=0D
++  "Offset of IA_NA Inner option is + 16 past start of option"=0D
++  );=0D
++=0D
++#define DHCP6_OFFSET_OF_IA_NA_T1(a)  (a + \=0D
++                                   DHCP6_SIZE_OF_COMBINED_CODE_AND_LEN + =
\=0D
++                                   DHCP6_SIZE_OF_IAID)=0D
++STATIC_ASSERT (=0D
++  DHCP6_OFFSET_OF_IA_NA_T1 (0) =3D=3D 8,=0D
++  "Offset of IA_NA Inner option is + 8 past start of option"=0D
++  );=0D
++=0D
++#define DHCP6_OFFSET_OF_IA_NA_T2(a)  (a + \=0D
++                                   DHCP6_SIZE_OF_COMBINED_CODE_AND_LEN +\=
=0D
++                                   DHCP6_SIZE_OF_IAID + \=0D
++                                   DHCP6_SIZE_OF_TIME_INTERVAL)=0D
++STATIC_ASSERT (=0D
++  DHCP6_OFFSET_OF_IA_NA_T2 (0) =3D=3D 12,=0D
++  "Offset of IA_NA Inner option is + 12 past start of option"=0D
++  );=0D
++=0D
++//=0D
++// For more information see RFC 8415 Section 21.13=0D
++//=0D
++// The format of the Status Code Option:=0D
++//=0D
++//     0                   1                   2                   3=0D
++//     0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1=0D
++//    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+=0D
++//    |       OPTION_STATUS_CODE      |         option-len            |=0D
++//    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+=0D
++//    |          status-code          |                               |=0D
++//    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+                               |=0D
++//    .                                                               .=0D
++//    .                        status-message                         .=0D
++//    .                                                               .=0D
++//    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+=0D
++//=0D
++#define DHCP6_OFFSET_OF_STATUS_CODE(a)  (a + DHCP6_SIZE_OF_COMBINED_CODE_=
AND_LEN)=0D
++STATIC_ASSERT (=0D
++  DHCP6_OFFSET_OF_STATUS_CODE (0) =3D=3D 4,=0D
++  "Offset of status is + 4 past start of option"=0D
++  );=0D
+ =0D
+ extern EFI_IPv6_ADDRESS    mAllDhcpRelayAndServersAddress;=0D
+ extern EFI_DHCP6_PROTOCOL  gDhcp6ProtocolTemplate;=0D
+diff --git a/NetworkPkg/Dhcp6Dxe/Dhcp6Io.c b/NetworkPkg/Dhcp6Dxe/Dhcp6Io.c
+index bf5aa7a769..89d16484a5 100644
+--- a/NetworkPkg/Dhcp6Dxe/Dhcp6Io.c
++++ b/NetworkPkg/Dhcp6Dxe/Dhcp6Io.c
+@@ -598,8 +598,8 @@ Dhcp6UpdateIaInfo (
+   // The inner options still start with 2 bytes option-code and 2 bytes o=
ption-len.=0D
+   //=0D
+   if (Instance->Config->IaDescriptor.Type =3D=3D Dhcp6OptIana) {=0D
+-    T1 =3D NTOHL (ReadUnaligned32 ((UINT32 *)(Option + 8)));=0D
+-    T2 =3D NTOHL (ReadUnaligned32 ((UINT32 *)(Option + 12)));=0D
++    T1 =3D NTOHL (ReadUnaligned32 ((UINT32 *)(DHCP6_OFFSET_OF_IA_NA_T1 (O=
ption))));=0D
++    T2 =3D NTOHL (ReadUnaligned32 ((UINT32 *)(DHCP6_OFFSET_OF_IA_NA_T2 (O=
ption))));=0D
+     //=0D
+     // Refer to RFC3155 Chapter 22.4. If a client receives an IA_NA with =
T1 greater than T2,=0D
+     // and both T1 and T2 are greater than 0, the client discards the IA_=
NA option and processes=0D
+@@ -609,13 +609,14 @@ Dhcp6UpdateIaInfo (
+       return EFI_DEVICE_ERROR;=0D
+     }=0D
+ =0D
+-    IaInnerOpt =3D Option + 16;=0D
+-    IaInnerLen =3D (UINT16)(NTOHS (ReadUnaligned16 ((UINT16 *)(Option + 2=
))) - 12);=0D
++    IaInnerOpt =3D DHCP6_OFFSET_OF_IA_NA_INNER_OPT (Option);=0D
++    IaInnerLen =3D (UINT16)(NTOHS (ReadUnaligned16 ((UINT16 *)(DHCP6_OFFS=
ET_OF_OPT_LEN (Option)))) - DHCP6_SIZE_OF_COMBINED_IAID_T1_T2);=0D
+   } else {=0D
+-    T1         =3D 0;=0D
+-    T2         =3D 0;=0D
+-    IaInnerOpt =3D Option + 8;=0D
+-    IaInnerLen =3D (UINT16)(NTOHS (ReadUnaligned16 ((UINT16 *)(Option + 2=
))) - 4);=0D
++    T1 =3D 0;=0D
++    T2 =3D 0;=0D
++=0D
++    IaInnerOpt =3D DHCP6_OFFSET_OF_IA_TA_INNER_OPT (Option);=0D
++    IaInnerLen =3D (UINT16)(NTOHS (ReadUnaligned16 ((UINT16 *)(DHCP6_OFFS=
ET_OF_OPT_LEN (Option)))) - DHCP6_SIZE_OF_IAID);=0D
+   }=0D
+ =0D
+   //=0D
+@@ -641,7 +642,7 @@ Dhcp6UpdateIaInfo (
+   Option  =3D Dhcp6SeekOption (IaInnerOpt, IaInnerLen, Dhcp6OptStatusCode=
);=0D
+ =0D
+   if (Option !=3D NULL) {=0D
+-    StsCode =3D NTOHS (ReadUnaligned16 ((UINT16 *)(Option + 4)));=0D
++    StsCode =3D NTOHS (ReadUnaligned16 ((UINT16 *)(DHCP6_OFFSET_OF_OPT_LE=
N (Option))));=0D
+     if (StsCode !=3D Dhcp6StsSuccess) {=0D
+       return EFI_DEVICE_ERROR;=0D
+     }=0D
+@@ -661,6 +662,87 @@ Dhcp6UpdateIaInfo (
+   return Status;=0D
+ }=0D
+ =0D
++/**=0D
++  Seeks the Inner Options from a DHCP6 Option=0D
++=0D
++  @param[in]  IaType          The type of the IA option.=0D
++  @param[in]  Option          The pointer to the DHCP6 Option.=0D
++  @param[in]  OptionLen       The length of the DHCP6 Option.=0D
++  @param[out] IaInnerOpt      The pointer to the IA inner option.=0D
++  @param[out] IaInnerLen      The length of the IA inner option.=0D
++=0D
++  @retval EFI_SUCCESS         Seek the inner option successfully.=0D
++  @retval EFI_DEVICE_ERROR    The OptionLen is invalid. On Error,=0D
++                              the pointers are not modified=0D
++**/=0D
++EFI_STATUS=0D
++Dhcp6SeekInnerOptionSafe (=0D
++  IN  UINT16  IaType,=0D
++  IN  UINT8   *Option,=0D
++  IN  UINT32  OptionLen,=0D
++  OUT UINT8   **IaInnerOpt,=0D
++  OUT UINT16  *IaInnerLen=0D
++  )=0D
++{=0D
++  UINT16  IaInnerLenTmp;=0D
++  UINT8   *IaInnerOptTmp;=0D
++=0D
++  if (Option =3D=3D NULL) {=0D
++    ASSERT (Option !=3D NULL);=0D
++    return EFI_DEVICE_ERROR;=0D
++  }=0D
++=0D
++  if (IaInnerOpt =3D=3D NULL) {=0D
++    ASSERT (IaInnerOpt !=3D NULL);=0D
++    return EFI_DEVICE_ERROR;=0D
++  }=0D
++=0D
++  if (IaInnerLen =3D=3D NULL) {=0D
++    ASSERT (IaInnerLen !=3D NULL);=0D
++    return EFI_DEVICE_ERROR;=0D
++  }=0D
++=0D
++  if (IaType =3D=3D Dhcp6OptIana) {=0D
++    // Verify we have a fully formed IA_NA=0D
++    if (OptionLen < DHCP6_MIN_SIZE_OF_IA_NA) {=0D
++      return EFI_DEVICE_ERROR;=0D
++    }=0D
++=0D
++    //=0D
++    IaInnerOptTmp =3D DHCP6_OFFSET_OF_IA_NA_INNER_OPT (Option);=0D
++=0D
++    // Verify the IaInnerLen is valid.=0D
++    IaInnerLenTmp =3D (UINT16)NTOHS (ReadUnaligned16 ((UINT16 *)DHCP6_OFF=
SET_OF_OPT_LEN (Option)));=0D
++    if (IaInnerLenTmp < DHCP6_SIZE_OF_COMBINED_IAID_T1_T2) {=0D
++      return EFI_DEVICE_ERROR;=0D
++    }=0D
++=0D
++    IaInnerLenTmp -=3D DHCP6_SIZE_OF_COMBINED_IAID_T1_T2;=0D
++  } else if (IaType =3D=3D Dhcp6OptIata) {=0D
++    // Verify the OptionLen is valid.=0D
++    if (OptionLen < DHCP6_MIN_SIZE_OF_IA_TA) {=0D
++      return EFI_DEVICE_ERROR;=0D
++    }=0D
++=0D
++    IaInnerOptTmp =3D DHCP6_OFFSET_OF_IA_TA_INNER_OPT (Option);=0D
++=0D
++    // Verify the IaInnerLen is valid.=0D
++    IaInnerLenTmp =3D (UINT16)NTOHS (ReadUnaligned16 ((UINT16 *)(DHCP6_OF=
FSET_OF_OPT_LEN (Option))));=0D
++    if (IaInnerLenTmp < DHCP6_SIZE_OF_IAID) {=0D
++      return EFI_DEVICE_ERROR;=0D
++    }=0D
++=0D
++    IaInnerLenTmp -=3D DHCP6_SIZE_OF_IAID;=0D
++  } else {=0D
++    return EFI_DEVICE_ERROR;=0D
++  }=0D
++=0D
++  *IaInnerOpt =3D IaInnerOptTmp;=0D
++  *IaInnerLen =3D IaInnerLenTmp;=0D
++=0D
++  return EFI_SUCCESS;=0D
++}=0D
++=0D
+ /**=0D
+   Seek StatusCode Option in package. A Status Code option may appear in t=
he=0D
+   options field of a DHCP message and/or in the options field of another =
option.=0D
+@@ -684,6 +766,12 @@ Dhcp6SeekStsOption (
+   UINT8   *IaInnerOpt;=0D
+   UINT16  IaInnerLen;=0D
+   UINT16  StsCode;=0D
++  UINT32  OptionLen;=0D
++=0D
++  // OptionLen is the length of the Options excluding the DHCP header.=0D
++  // Length of the EFI_DHCP6_PACKET from the first byte of the Header fie=
ld to the last=0D
++  // byte of the Option[] field.=0D
++  OptionLen =3D Packet->Length - sizeof (Packet->Dhcp6.Header);=0D
+ =0D
+   //=0D
+   // Seek StatusCode option directly in DHCP message body. That is, searc=
h in=0D
+@@ -691,12 +779,12 @@ Dhcp6SeekStsOption (
+   //=0D
+   *Option =3D Dhcp6SeekOption (=0D
+               Packet->Dhcp6.Option,=0D
+-              Packet->Length - 4,=0D
++              OptionLen,=0D
+               Dhcp6OptStatusCode=0D
+               );=0D
+ =0D
+   if (*Option !=3D NULL) {=0D
+-    StsCode =3D NTOHS (ReadUnaligned16 ((UINT16 *)(*Option + 4)));=0D
++    StsCode =3D NTOHS (ReadUnaligned16 ((UINT16 *)(DHCP6_OFFSET_OF_STATUS=
_CODE (*Option))));=0D
+     if (StsCode !=3D Dhcp6StsSuccess) {=0D
+       return EFI_DEVICE_ERROR;=0D
+     }=0D
+@@ -707,7 +795,7 @@ Dhcp6SeekStsOption (
+   //=0D
+   *Option =3D Dhcp6SeekIaOption (=0D
+               Packet->Dhcp6.Option,=0D
+-              Packet->Length - sizeof (EFI_DHCP6_HEADER),=0D
++              OptionLen,=0D
+               &Instance->Config->IaDescriptor=0D
+               );=0D
+   if (*Option =3D=3D NULL) {=0D
+@@ -715,52 +803,35 @@ Dhcp6SeekStsOption (
+   }=0D
+ =0D
+   //=0D
+-  // The format of the IA_NA option is:=0D
++  // Calculate the distance from Packet->Dhcp6.Option to the IA option.=0D
+   //=0D
+-  //     0                   1                   2                   3=0D
+-  //     0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1=
=0D
+-  //    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+=
=0D
+-  //    |          OPTION_IA_NA         |          option-len           |=
=0D
+-  //    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+=
=0D
+-  //    |                        IAID (4 octets)                        |=
=0D
+-  //    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+=
=0D
+-  //    |                              T1                               |=
=0D
+-  //    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+=
=0D
+-  //    |                              T2                               |=
=0D
+-  //    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+=
=0D
+-  //    |                                                               |=
=0D
+-  //    .                         IA_NA-options                         .=
=0D
+-  //    .                                                               .=
=0D
+-  //    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+=
=0D
++  // Packet->Size and Packet->Length are both UINT32 type, and Packet->Si=
ze is=0D
++  // the size of the whole packet, including the DHCP header, and Packet-=
>Length=0D
++  // is the length of the DHCP message body, excluding the DHCP header.=0D
+   //=0D
+-  // The format of the IA_TA option is:=0D
++  // (*Option - Packet->Dhcp6.Option) is the number of bytes from the sta=
rt of=0D
++  // DHCP6 option area to the start of the IA option.=0D
+   //=0D
+-  //     0                   1                   2                   3=0D
+-  //     0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1=
=0D
+-  //    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+=
=0D
+-  //    |         OPTION_IA_TA          |          option-len           |=
=0D
+-  //    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+=
=0D
+-  //    |                        IAID (4 octets)                        |=
=0D
+-  //    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+=
=0D
+-  //    |                                                               |=
=0D
+-  //    .                         IA_TA-options                         .=
=0D
+-  //    .                                                               .=
=0D
+-  //    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+=
=0D
++  // Dhcp6SeekInnerOptionSafe() is searching starting from the start of t=
he=0D
++  // IA option to the end of the DHCP6 option area, thus subtract the spa=
ce=0D
++  // up until this option=0D
+   //=0D
++  OptionLen =3D OptionLen - (*Option - Packet->Dhcp6.Option);=0D
+ =0D
+   //=0D
+-  // sizeof (option-code + option-len + IaId)           =3D 8=0D
+-  // sizeof (option-code + option-len + IaId + T1)      =3D 12=0D
+-  // sizeof (option-code + option-len + IaId + T1 + T2) =3D 16=0D
+-  //=0D
+-  // The inner options still start with 2 bytes option-code and 2 bytes o=
ption-len.=0D
++  // Seek the inner option=0D
+   //=0D
+-  if (Instance->Config->IaDescriptor.Type =3D=3D Dhcp6OptIana) {=0D
+-    IaInnerOpt =3D *Option + 16;=0D
+-    IaInnerLen =3D (UINT16)(NTOHS (ReadUnaligned16 ((UINT16 *)(*Option + =
2))) - 12);=0D
+-  } else {=0D
+-    IaInnerOpt =3D *Option + 8;=0D
+-    IaInnerLen =3D (UINT16)(NTOHS (ReadUnaligned16 ((UINT16 *)(*Option + =
2))) - 4);=0D
++  if (EFI_ERROR (=0D
++        Dhcp6SeekInnerOptionSafe (=0D
++          Instance->Config->IaDescriptor.Type,=0D
++          *Option,=0D
++          OptionLen,=0D
++          &IaInnerOpt,=0D
++          &IaInnerLen=0D
++          )=0D
++        ))=0D
++  {=0D
++    return EFI_DEVICE_ERROR;=0D
+   }=0D
+ =0D
+   //=0D
+@@ -784,7 +855,7 @@ Dhcp6SeekStsOption (
+   //=0D
+   *Option =3D Dhcp6SeekOption (IaInnerOpt, IaInnerLen, Dhcp6OptStatusCode=
);=0D
+   if (*Option !=3D NULL) {=0D
+-    StsCode =3D NTOHS (ReadUnaligned16 ((UINT16 *)(*Option + 4)));=0D
++    StsCode =3D NTOHS (ReadUnaligned16 ((UINT16 *)((DHCP6_OFFSET_OF_STATU=
S_CODE (*Option)))));=0D
+     if (StsCode !=3D Dhcp6StsSuccess) {=0D
+       return EFI_DEVICE_ERROR;=0D
+     }=0D
+@@ -1105,7 +1176,7 @@ Dhcp6SendRequestMsg (
+   //=0D
+   Option =3D Dhcp6SeekOption (=0D
+              Instance->AdSelect->Dhcp6.Option,=0D
+-             Instance->AdSelect->Length - 4,=0D
++             Instance->AdSelect->Length - sizeof (EFI_DHCP6_HEADER),=0D
+              Dhcp6OptServerId=0D
+              );=0D
+   if (Option =3D=3D NULL) {=0D
+@@ -1289,7 +1360,7 @@ Dhcp6SendDeclineMsg (
+   //=0D
+   Option =3D Dhcp6SeekOption (=0D
+              LastReply->Dhcp6.Option,=0D
+-             LastReply->Length - 4,=0D
++             LastReply->Length - sizeof (EFI_DHCP6_HEADER),=0D
+              Dhcp6OptServerId=0D
+              );=0D
+   if (Option =3D=3D NULL) {=0D
+@@ -1448,7 +1519,7 @@ Dhcp6SendReleaseMsg (
+   //=0D
+   Option =3D Dhcp6SeekOption (=0D
+              LastReply->Dhcp6.Option,=0D
+-             LastReply->Length - 4,=0D
++             LastReply->Length - sizeof (EFI_DHCP6_HEADER),=0D
+              Dhcp6OptServerId=0D
+              );=0D
+   if (Option =3D=3D NULL) {=0D
+@@ -1673,7 +1744,7 @@ Dhcp6SendRenewRebindMsg (
+ =0D
+     Option =3D Dhcp6SeekOption (=0D
+                LastReply->Dhcp6.Option,=0D
+-               LastReply->Length - 4,=0D
++               LastReply->Length - sizeof (EFI_DHCP6_HEADER),=0D
+                Dhcp6OptServerId=0D
+                );=0D
+     if (Option =3D=3D NULL) {=0D
+@@ -2208,7 +2279,7 @@ Dhcp6HandleReplyMsg (
+   //=0D
+   Option =3D Dhcp6SeekOption (=0D
+              Packet->Dhcp6.Option,=0D
+-             Packet->Length - 4,=0D
++             Packet->Length - sizeof (EFI_DHCP6_HEADER),=0D
+              Dhcp6OptRapidCommit=0D
+              );=0D
+ =0D
+@@ -2354,7 +2425,7 @@ Dhcp6HandleReplyMsg (
+     //=0D
+     // Any error status code option is found.=0D
+     //=0D
+-    StsCode =3D NTOHS (ReadUnaligned16 ((UINT16 *)(Option + 4)));=0D
++    StsCode =3D NTOHS (ReadUnaligned16 ((UINT16 *)((DHCP6_OFFSET_OF_STATU=
S_CODE (Option)))));=0D
+     switch (StsCode) {=0D
+       case Dhcp6StsUnspecFail:=0D
+         //=0D
+@@ -2487,7 +2558,7 @@ Dhcp6SelectAdvertiseMsg (
+   //=0D
+   Option =3D Dhcp6SeekOption (=0D
+              AdSelect->Dhcp6.Option,=0D
+-             AdSelect->Length - 4,=0D
++             AdSelect->Length - sizeof (EFI_DHCP6_HEADER),=0D
+              Dhcp6OptServerUnicast=0D
+              );=0D
+ =0D
+@@ -2498,7 +2569,7 @@ Dhcp6SelectAdvertiseMsg (
+       return EFI_OUT_OF_RESOURCES;=0D
+     }=0D
+ =0D
+-    CopyMem (Instance->Unicast, Option + 4, sizeof (EFI_IPv6_ADDRESS));=0D
++    CopyMem (Instance->Unicast, DHCP6_OFFSET_OF_OPT_DATA (Option), sizeof=
 (EFI_IPv6_ADDRESS));=0D
+   }=0D
+ =0D
+   //=0D
+@@ -2551,7 +2622,7 @@ Dhcp6HandleAdvertiseMsg (
+   //=0D
+   Option =3D Dhcp6SeekOption (=0D
+              Packet->Dhcp6.Option,=0D
+-             Packet->Length - 4,=0D
++             Packet->Length - sizeof (EFI_DHCP6_HEADER),=0D
+              Dhcp6OptRapidCommit=0D
+              );=0D
+ =0D
+@@ -2645,7 +2716,7 @@ Dhcp6HandleAdvertiseMsg (
+       CopyMem (Instance->AdSelect, Packet, Packet->Size);=0D
+ =0D
+       if (Option !=3D NULL) {=0D
+-        Instance->AdPref =3D *(Option + 4);=0D
++        Instance->AdPref =3D *(DHCP6_OFFSET_OF_OPT_DATA (Option));=0D
+       }=0D
+     } else {=0D
+       //=0D
+@@ -2714,11 +2785,11 @@ Dhcp6HandleStateful (
+   //=0D
+   Option =3D Dhcp6SeekOption (=0D
+              Packet->Dhcp6.Option,=0D
+-             Packet->Length - 4,=0D
++             Packet->Length - DHCP6_SIZE_OF_COMBINED_CODE_AND_LEN,=0D
+              Dhcp6OptClientId=0D
+              );=0D
+ =0D
+-  if ((Option =3D=3D NULL) || (CompareMem (Option + 4, ClientId->Duid, Cl=
ientId->Length) !=3D 0)) {=0D
++  if ((Option =3D=3D NULL) || (CompareMem (DHCP6_OFFSET_OF_OPT_DATA (Opti=
on), ClientId->Duid, ClientId->Length) !=3D 0)) {=0D
+     goto ON_CONTINUE;=0D
+   }=0D
+ =0D
+@@ -2727,7 +2798,7 @@ Dhcp6HandleStateful (
+   //=0D
+   Option =3D Dhcp6SeekOption (=0D
+              Packet->Dhcp6.Option,=0D
+-             Packet->Length - 4,=0D
++             Packet->Length - DHCP6_SIZE_OF_COMBINED_CODE_AND_LEN,=0D
+              Dhcp6OptServerId=0D
+              );=0D
+ =0D
+@@ -2832,7 +2903,7 @@ Dhcp6HandleStateless (
+   //=0D
+   Option =3D Dhcp6SeekOption (=0D
+              Packet->Dhcp6.Option,=0D
+-             Packet->Length - 4,=0D
++             Packet->Length - sizeof (EFI_DHCP6_HEADER),=0D
+              Dhcp6OptServerId=0D
+              );=0D
+ =0D
+--=20
+2.40.0
+
diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2023-45229-0002.patch b/meta/r=
ecipes-core/ovmf/ovmf/CVE-2023-45229-0002.patch
new file mode 100644
index 0000000000..7ce5c98789
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/CVE-2023-45229-0002.patch
@@ -0,0 +1,539 @@
+From 07362769ab7a7d74dbea1c7a7a3662c7b5d1f097 Mon Sep 17 00:00:00 2001
+From: "Doug Flick via groups.io" <dougflick=3Dmicrosoft.com@groups.io>
+Date: Fri, 26 Jan 2024 05:54:47 +0800
+Subject: [PATCH] NetworkPkg: Dhcp6Dxe: SECURITY PATCH CVE-2023-45229 Unit=
=20
+ Tests
+
+REF: https://bugzilla.tianocore.org/show_bug.cgi?id=3D4534
+
+These tests confirm that the report bug...
+
+"Out-of-bounds read when processing IA_NA/IA_TA options in a
+DHCPv6 Advertise message"
+
+..has been patched.
+
+The following functions are tested to confirm an out of bounds read is
+patched and that the correct statuses are returned:
+
+Dhcp6SeekInnerOptionSafe
+Dhcp6SeekStsOption
+
+TCBZ4534
+CVE-2023-45229
+CVSS 6.5 : CVSS:3.1/AV:A/AC:L/PR:N/UI:N/S:U/C:H/I:N/A:N
+CWE-125 Out-of-bounds Read
+
+Cc: Saloni Kasbekar <saloni.kasbekar@intel.com>
+Cc: Zachary Clark-williams <zachary.clark-williams@intel.com>
+
+Signed-off-by: Doug Flick [MSFT] <doug.edk2@gmail.com>
+Reviewed-by: Saloni Kasbekar <saloni.kasbekar@intel.com>
+
+CVE: CVE-2023-45229
+
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/073627=
69ab7a7d74dbea1c7a7a3662c7b5d1f097]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ NetworkPkg/Dhcp6Dxe/Dhcp6Io.c                 |   2 +-
+ .../GoogleTest/Dhcp6DxeGoogleTest.inf         |   1 +
+ .../Dhcp6Dxe/GoogleTest/Dhcp6IoGoogleTest.cpp | 365 +++++++++++++++++-
+ .../Dhcp6Dxe/GoogleTest/Dhcp6IoGoogleTest.h   |  58 +++
+ 4 files changed, 423 insertions(+), 3 deletions(-)
+ create mode 100644 NetworkPkg/Dhcp6Dxe/GoogleTest/Dhcp6IoGoogleTest.h
+
+diff --git a/NetworkPkg/Dhcp6Dxe/Dhcp6Io.c b/NetworkPkg/Dhcp6Dxe/Dhcp6Io.c
+index 89d16484a5..3b8feb4a20 100644
+--- a/NetworkPkg/Dhcp6Dxe/Dhcp6Io.c
++++ b/NetworkPkg/Dhcp6Dxe/Dhcp6Io.c
+@@ -816,7 +816,7 @@ Dhcp6SeekStsOption (
+   // IA option to the end of the DHCP6 option area, thus subtract the spa=
ce=0D
+   // up until this option=0D
+   //=0D
+-  OptionLen =3D OptionLen - (*Option - Packet->Dhcp6.Option);=0D
++  OptionLen =3D OptionLen - (UINT32)(*Option - Packet->Dhcp6.Option);=0D
+ =0D
+   //=0D
+   // Seek the inner option=0D
+diff --git a/NetworkPkg/Dhcp6Dxe/GoogleTest/Dhcp6DxeGoogleTest.inf b/Netwo=
rkPkg/Dhcp6Dxe/GoogleTest/Dhcp6DxeGoogleTest.inf
+index 8e9119a371..12532ed30c 100644
+--- a/NetworkPkg/Dhcp6Dxe/GoogleTest/Dhcp6DxeGoogleTest.inf
++++ b/NetworkPkg/Dhcp6Dxe/GoogleTest/Dhcp6DxeGoogleTest.inf
+@@ -18,6 +18,7 @@
+ [Sources]=0D
+   Dhcp6DxeGoogleTest.cpp=0D
+   Dhcp6IoGoogleTest.cpp=0D
++  Dhcp6IoGoogleTest.h=0D
+   ../Dhcp6Io.c=0D
+   ../Dhcp6Utility.c=0D
+ =0D
+diff --git a/NetworkPkg/Dhcp6Dxe/GoogleTest/Dhcp6IoGoogleTest.cpp b/Networ=
kPkg/Dhcp6Dxe/GoogleTest/Dhcp6IoGoogleTest.cpp
+index 7ee40e4af4..7db253a7b8 100644
+--- a/NetworkPkg/Dhcp6Dxe/GoogleTest/Dhcp6IoGoogleTest.cpp
++++ b/NetworkPkg/Dhcp6Dxe/GoogleTest/Dhcp6IoGoogleTest.cpp
+@@ -13,6 +13,7 @@ extern "C" {
+   #include <Library/BaseMemoryLib.h>=0D
+   #include "../Dhcp6Impl.h"=0D
+   #include "../Dhcp6Utility.h"=0D
++  #include "Dhcp6IoGoogleTest.h"=0D
+ }=0D
+ =0D
+ ////////////////////////////////////////////////////////////////////////=
=0D
+@@ -21,7 +22,35 @@ extern "C" {
+ =0D
+ #define DHCP6_PACKET_MAX_LEN  1500=0D
+ =0D
++// This definition is used by this test but is also required to compile=0D
++// by Dhcp6Io.c=0D
++#define DHCPV6_OPTION_IA_NA  3=0D
++#define DHCPV6_OPTION_IA_TA  4=0D
++=0D
++#define SEARCH_PATTERN      0xDEADC0DE=0D
++#define SEARCH_PATTERN_LEN  sizeof(SEARCH_PATTERN)=0D
++=0D
+ ////////////////////////////////////////////////////////////////////////=
=0D
++// Test structures for IA_NA and IA_TA options=0D
++////////////////////////////////////////////////////////////////////////=
=0D
++typedef struct {=0D
++  UINT16    Code;=0D
++  UINT16    Len;=0D
++  UINT32    IAID;=0D
++} DHCPv6_OPTION;=0D
++=0D
++typedef struct {=0D
++  DHCPv6_OPTION    Header;=0D
++  UINT32           T1;=0D
++  UINT32           T2;=0D
++  UINT8            InnerOptions[0];=0D
++} DHCPv6_OPTION_IA_NA;=0D
++=0D
++typedef struct {=0D
++  DHCPv6_OPTION    Header;=0D
++  UINT8            InnerOptions[0];=0D
++} DHCPv6_OPTION_IA_TA;=0D
++=0D
+ ////////////////////////////////////////////////////////////////////////=
=0D
+ // Symbol Definitions=0D
+ // These functions are not directly under test - but required to compile=
=0D
+@@ -210,7 +239,7 @@ TEST_F (Dhcp6AppendETOptionTest, InvalidDataExpectBuff=
erTooSmall) {
+   Status =3D Dhcp6AppendETOption (=0D
+              Dhcp6AppendETOptionTest::Packet,=0D
+              &Cursor,=0D
+-             &Instance, // Instance is not used in this function=0D
++             &Instance,                    // Instance is not used in thi=
s function=0D
+              &ElapsedTime=0D
+              );=0D
+ =0D
+@@ -240,7 +269,7 @@ TEST_F (Dhcp6AppendETOptionTest, ValidDataExpectSucces=
s) {
+   Status =3D Dhcp6AppendETOption (=0D
+              Dhcp6AppendETOptionTest::Packet,=0D
+              &Cursor,=0D
+-             &Instance, // Instance is not used in this function=0D
++             &Instance,                    // Instance is not used in thi=
s function=0D
+              &ElapsedTime=0D
+              );=0D
+ =0D
+@@ -476,3 +505,335 @@ TEST_F (Dhcp6AppendIaOptionTest, IaTaValidDataExpect=
Success) {
+   // verify that the status is EFI_SUCCESS=0D
+   ASSERT_EQ (Status, EFI_SUCCESS);=0D
+ }=0D
++=0D
++////////////////////////////////////////////////////////////////////////=
=0D
++// Dhcp6SeekInnerOptionSafe Tests=0D
++////////////////////////////////////////////////////////////////////////=
=0D
++=0D
++// Define a fixture for your tests if needed=0D
++class Dhcp6SeekInnerOptionSafeTest : public ::testing::Test {=0D
++protected:=0D
++  // Add any setup code if needed=0D
++  virtual void=0D
++  SetUp (=0D
++    )=0D
++  {=0D
++    // Initialize any resources or variables=0D
++  }=0D
++=0D
++  // Add any cleanup code if needed=0D
++  virtual void=0D
++  TearDown (=0D
++    )=0D
++  {=0D
++    // Clean up any resources or variables=0D
++  }=0D
++};=0D
++=0D
++// Test Description:=0D
++// This test verifies that Dhcp6SeekInnerOptionSafe returns EFI_SUCCESS w=
hen the IANA option is found.=0D
++TEST_F (Dhcp6SeekInnerOptionSafeTest, IANAValidOptionExpectSuccess) {=0D
++  EFI_STATUS           Result;=0D
++  UINT8                Option[sizeof (DHCPv6_OPTION_IA_NA) + SEARCH_PATTE=
RN_LEN] =3D { 0 };=0D
++  UINT32               OptionLength                                      =
        =3D sizeof (Option);=0D
++  DHCPv6_OPTION_IA_NA  *OptionPtr                                        =
        =3D (DHCPv6_OPTION_IA_NA *)Option;=0D
++  UINT32               SearchPattern                                     =
        =3D SEARCH_PATTERN;=0D
++=0D
++  UINTN   SearchPatternLength =3D SEARCH_PATTERN_LEN;=0D
++  UINT8   *InnerOptionPtr     =3D NULL;=0D
++  UINT16  InnerOptionLength   =3D 0;=0D
++=0D
++  OptionPtr->Header.Code =3D Dhcp6OptIana;=0D
++  OptionPtr->Header.Len  =3D HTONS (4 + 12); // Valid length has to be mo=
re than 12=0D
++  OptionPtr->Header.IAID =3D 0x12345678;=0D
++  OptionPtr->T1          =3D 0x11111111;=0D
++  OptionPtr->T2          =3D 0x22222222;=0D
++  CopyMem (OptionPtr->InnerOptions, &SearchPattern, SearchPatternLength);=
=0D
++=0D
++  Result =3D Dhcp6SeekInnerOptionSafe (=0D
++             Dhcp6OptIana,=0D
++             Option,=0D
++             OptionLength,=0D
++             &InnerOptionPtr,=0D
++             &InnerOptionLength=0D
++             );=0D
++  ASSERT_EQ (Result, EFI_SUCCESS);=0D
++  ASSERT_EQ (InnerOptionLength, 4);=0D
++  ASSERT_EQ (CompareMem (InnerOptionPtr, &SearchPattern, SearchPatternLen=
gth), 0);=0D
++}=0D
++=0D
++// Test Description:=0D
++// This test verifies that Dhcp6SeekInnerOptionSafe returns EFI_DEIVCE_ER=
ROR when the IANA option size is invalid.=0D
++TEST_F (Dhcp6SeekInnerOptionSafeTest, IANAInvalidSizeExpectFail) {=0D
++  // Lets add an inner option of bytes we expect to find=0D
++  EFI_STATUS           Status;=0D
++  UINT8                Option[sizeof (DHCPv6_OPTION_IA_NA) + SEARCH_PATTE=
RN_LEN] =3D { 0 };=0D
++  UINT32               OptionLength                                      =
        =3D sizeof (Option);=0D
++  DHCPv6_OPTION_IA_NA  *OptionPtr                                        =
        =3D (DHCPv6_OPTION_IA_NA *)Option;=0D
++  UINT32               SearchPattern                                     =
        =3D SEARCH_PATTERN;=0D
++=0D
++  UINTN   SearchPatternLength =3D SEARCH_PATTERN_LEN;=0D
++  UINT8   *InnerOptionPtr     =3D NULL;=0D
++  UINT16  InnerOptionLength   =3D 0;=0D
++=0D
++  OptionPtr->Header.Code =3D Dhcp6OptIana;=0D
++  OptionPtr->Header.Len  =3D HTONS (4); // Set the length to lower than e=
xpected (12)=0D
++  OptionPtr->Header.IAID =3D 0x12345678;=0D
++  OptionPtr->T1          =3D 0x11111111;=0D
++  OptionPtr->T2          =3D 0x22222222;=0D
++  CopyMem (OptionPtr->InnerOptions, &SearchPattern, SearchPatternLength);=
=0D
++=0D
++  // Set the InnerOptionLength to be less than the size of the option=0D
++  Status =3D Dhcp6SeekInnerOptionSafe (=0D
++             Dhcp6OptIana,=0D
++             Option,=0D
++             OptionLength,=0D
++             &InnerOptionPtr,=0D
++             &InnerOptionLength=0D
++             );=0D
++  ASSERT_EQ (Status, EFI_DEVICE_ERROR);=0D
++=0D
++  // Now set the OptionLength to be less than the size of the option=0D
++  OptionLength =3D sizeof (DHCPv6_OPTION_IA_NA) - 1;=0D
++  Status       =3D Dhcp6SeekInnerOptionSafe (=0D
++                   Dhcp6OptIana,=0D
++                   Option,=0D
++                   OptionLength,=0D
++                   &InnerOptionPtr,=0D
++                   &InnerOptionLength=0D
++                   );=0D
++  ASSERT_EQ (Status, EFI_DEVICE_ERROR);=0D
++}=0D
++=0D
++// Test Description:=0D
++// This test verifies that Dhcp6SeekInnerOptionSafe returns EFI_SUCCESS w=
hen the IATA option is found=0D
++TEST_F (Dhcp6SeekInnerOptionSafeTest, IATAValidOptionExpectSuccess) {=0D
++  // Lets add an inner option of bytes we expect to find=0D
++  EFI_STATUS           Status;=0D
++  UINT8                Option[sizeof (DHCPv6_OPTION_IA_TA) + SEARCH_PATTE=
RN_LEN] =3D { 0 };=0D
++  UINT32               OptionLength                                      =
        =3D sizeof (Option);=0D
++  DHCPv6_OPTION_IA_TA  *OptionPtr                                        =
        =3D (DHCPv6_OPTION_IA_TA *)Option;=0D
++  UINT32               SearchPattern                                     =
        =3D SEARCH_PATTERN;=0D
++=0D
++  UINTN   SearchPatternLength =3D SEARCH_PATTERN_LEN;=0D
++  UINT8   *InnerOptionPtr     =3D NULL;=0D
++  UINT16  InnerOptionLength   =3D 0;=0D
++=0D
++  OptionPtr->Header.Code =3D Dhcp6OptIata;=0D
++  OptionPtr->Header.Len  =3D HTONS (4 + 4); // Valid length has to be mor=
e than 4=0D
++  OptionPtr->Header.IAID =3D 0x12345678;=0D
++  CopyMem (OptionPtr->InnerOptions, &SearchPattern, SearchPatternLength);=
=0D
++=0D
++  Status =3D Dhcp6SeekInnerOptionSafe (=0D
++             Dhcp6OptIata,=0D
++             Option,=0D
++             OptionLength,=0D
++             &InnerOptionPtr,=0D
++             &InnerOptionLength=0D
++             );=0D
++  ASSERT_EQ (Status, EFI_SUCCESS);=0D
++  ASSERT_EQ (InnerOptionLength, 4);=0D
++  ASSERT_EQ (CompareMem (InnerOptionPtr, &SearchPattern, SearchPatternLen=
gth), 0);=0D
++}=0D
++=0D
++// Test Description:=0D
++// This test verifies that Dhcp6SeekInnerOptionSafe returns EFI_SUCCESS w=
hen the IATA option size is invalid.=0D
++TEST_F (Dhcp6SeekInnerOptionSafeTest, IATAInvalidSizeExpectFail) {=0D
++  // Lets add an inner option of bytes we expect to find=0D
++  EFI_STATUS           Status;=0D
++  UINT8                Option[sizeof (DHCPv6_OPTION_IA_TA) + SEARCH_PATTE=
RN_LEN] =3D { 0 };=0D
++  UINT32               OptionLength                                      =
        =3D sizeof (Option);=0D
++  DHCPv6_OPTION_IA_TA  *OptionPtr                                        =
        =3D (DHCPv6_OPTION_IA_TA *)Option;=0D
++  UINT32               SearchPattern                                     =
        =3D SEARCH_PATTERN;=0D
++=0D
++  UINTN   SearchPatternLength =3D SEARCH_PATTERN_LEN;=0D
++  UINT8   *InnerOptionPtr     =3D NULL;=0D
++  UINT16  InnerOptionLength   =3D 0;=0D
++=0D
++  OptionPtr->Header.Code =3D Dhcp6OptIata;=0D
++  OptionPtr->Header.Len  =3D HTONS (2); // Set the length to lower than e=
xpected (4)=0D
++  OptionPtr->Header.IAID =3D 0x12345678;=0D
++  CopyMem (OptionPtr->InnerOptions, &SearchPattern, SearchPatternLength);=
=0D
++=0D
++  Status =3D Dhcp6SeekInnerOptionSafe (=0D
++             Dhcp6OptIata,=0D
++             Option,=0D
++             OptionLength,=0D
++             &InnerOptionPtr,=0D
++             &InnerOptionLength=0D
++             );=0D
++  ASSERT_EQ (Status, EFI_DEVICE_ERROR);=0D
++=0D
++  // Now lets try modifying the OptionLength to be less than the size of =
the option=0D
++  OptionLength =3D sizeof (DHCPv6_OPTION_IA_TA) - 1;=0D
++  Status       =3D Dhcp6SeekInnerOptionSafe (=0D
++                   Dhcp6OptIata,=0D
++                   Option,=0D
++                   OptionLength,=0D
++                   &InnerOptionPtr,=0D
++                   &InnerOptionLength=0D
++                   );=0D
++  ASSERT_EQ (Status, EFI_DEVICE_ERROR);=0D
++}=0D
++=0D
++// Test Description:=0D
++// This test verifies that any other Option Type fails=0D
++TEST_F (Dhcp6SeekInnerOptionSafeTest, InvalidOption) {=0D
++  // Lets add an inner option of bytes we expect to find=0D
++  EFI_STATUS           Result;=0D
++  UINT8                Option[sizeof (DHCPv6_OPTION_IA_TA) + SEARCH_PATTE=
RN_LEN] =3D { 0 };=0D
++  UINT32               OptionLength                                      =
        =3D sizeof (Option);=0D
++  DHCPv6_OPTION_IA_TA  *OptionPtr                                        =
        =3D (DHCPv6_OPTION_IA_TA *)Option;=0D
++  UINT32               SearchPattern                                     =
        =3D SEARCH_PATTERN;=0D
++=0D
++  UINTN   SearchPatternLength =3D SEARCH_PATTERN_LEN;=0D
++  UINT8   *InnerOptionPtr     =3D NULL;=0D
++  UINT16  InnerOptionLength   =3D 0;=0D
++=0D
++  OptionPtr->Header.Code =3D 0xC0DE;=0D
++  OptionPtr->Header.Len  =3D HTONS (2); // Set the length to lower than e=
xpected (4)=0D
++  OptionPtr->Header.IAID =3D 0x12345678;=0D
++  CopyMem (OptionPtr->InnerOptions, &SearchPattern, SearchPatternLength);=
=0D
++=0D
++  Result =3D Dhcp6SeekInnerOptionSafe (0xC0DE, Option, OptionLength, &Inn=
erOptionPtr, &InnerOptionLength);=0D
++  ASSERT_EQ (Result, EFI_DEVICE_ERROR);=0D
++}=0D
++=0D
++////////////////////////////////////////////////////////////////////////=
=0D
++// Dhcp6SeekStsOption Tests=0D
++////////////////////////////////////////////////////////////////////////=
=0D
++=0D
++#define PACKET_SIZE  (1500)=0D
++=0D
++class Dhcp6SeekStsOptionTest : public ::testing::Test {=0D
++public:=0D
++  DHCP6_INSTANCE Instance      =3D { 0 };=0D
++  EFI_DHCP6_PACKET *Packet     =3D NULL;=0D
++  EFI_DHCP6_CONFIG_DATA Config =3D { 0 };=0D
++=0D
++protected:=0D
++  // Add any setup code if needed=0D
++  virtual void=0D
++  SetUp (=0D
++    )=0D
++  {=0D
++    // Allocate a packet=0D
++    Packet =3D (EFI_DHCP6_PACKET *)AllocateZeroPool (PACKET_SIZE);=0D
++    ASSERT_NE (Packet, nullptr);=0D
++=0D
++    // Initialize the packet=0D
++    Packet->Size =3D PACKET_SIZE;=0D
++=0D
++    Instance.Config =3D &Config;=0D
++  }=0D
++=0D
++  // Add any cleanup code if needed=0D
++  virtual void=0D
++  TearDown (=0D
++    )=0D
++  {=0D
++    // Clean up any resources or variables=0D
++    FreePool (Packet);=0D
++  }=0D
++};=0D
++=0D
++// Test Description:=0D
++// This test verifies that Dhcp6SeekStsOption returns EFI_DEVICE_ERROR wh=
en the option is invalid=0D
++// This verifies that the calling function is working as expected=0D
++TEST_F (Dhcp6SeekStsOptionTest, SeekIATAOptionExpectFail) {=0D
++  EFI_STATUS    Status;=0D
++  UINT8         *Option             =3D NULL;=0D
++  UINT32        SearchPattern       =3D SEARCH_PATTERN;=0D
++  UINT16        SearchPatternLength =3D SEARCH_PATTERN_LEN;=0D
++  UINT16        *Len                =3D NULL;=0D
++  EFI_DHCP6_IA  Ia                  =3D { 0 };=0D
++=0D
++  Ia.Descriptor.Type                =3D DHCPV6_OPTION_IA_TA;=0D
++  Ia.IaAddressCount                 =3D 1;=0D
++  Ia.IaAddress[0].PreferredLifetime =3D 0xDEADBEEF;=0D
++  Ia.IaAddress[0].ValidLifetime     =3D 0xDEADAAAA;=0D
++  Ia.IaAddress[0].IpAddress         =3D mAllDhcpRelayAndServersAddress;=0D
++=0D
++  Packet->Length =3D sizeof (EFI_DHCP6_HEADER);=0D
++=0D
++  Option =3D Dhcp6SeekStsOptionTest::Packet->Dhcp6.Option;=0D
++=0D
++  // Let's append the option to the packet=0D
++  Status =3D Dhcp6AppendOption (=0D
++             Dhcp6SeekStsOptionTest::Packet,=0D
++             &Option,=0D
++             Dhcp6OptStatusCode,=0D
++             SearchPatternLength,=0D
++             (UINT8 *)&SearchPattern=0D
++             );=0D
++  ASSERT_EQ (Status, EFI_SUCCESS);=0D
++=0D
++  // Inner option length - this will be overwritten later=0D
++  Len =3D (UINT16 *)(Option + 2);=0D
++=0D
++  // Fill in the inner IA option=0D
++  Status =3D Dhcp6AppendIaOption (=0D
++             Dhcp6SeekStsOptionTest::Packet,=0D
++             &Option,=0D
++             &Ia,=0D
++             0x12345678,=0D
++             0x11111111,=0D
++             0x22222222=0D
++             );=0D
++  ASSERT_EQ (Status, EFI_SUCCESS);=0D
++=0D
++  // overwrite the len of inner Ia option=0D
++  *Len =3D HTONS (3);=0D
++=0D
++  Dhcp6SeekStsOptionTest::Instance.Config->IaDescriptor.Type =3D DHCPV6_O=
PTION_IA_TA;=0D
++=0D
++  Option =3D NULL;=0D
++  Status =3D Dhcp6SeekStsOption (&(Dhcp6SeekStsOptionTest::Instance), Dhc=
p6SeekStsOptionTest::Packet, &Option);=0D
++=0D
++  ASSERT_EQ (Status, EFI_DEVICE_ERROR);=0D
++}=0D
++=0D
++// Test Description:=0D
++// This test verifies that Dhcp6SeekInnerOptionSafe returns EFI_SUCCESS w=
hen the IATA option size is invalid.=0D
++TEST_F (Dhcp6SeekStsOptionTest, SeekIANAOptionExpectSuccess) {=0D
++  EFI_STATUS    Status              =3D EFI_NOT_FOUND;=0D
++  UINT8         *Option             =3D NULL;=0D
++  UINT32        SearchPattern       =3D SEARCH_PATTERN;=0D
++  UINT16        SearchPatternLength =3D SEARCH_PATTERN_LEN;=0D
++  EFI_DHCP6_IA  Ia                  =3D { 0 };=0D
++=0D
++  Ia.Descriptor.Type                =3D DHCPV6_OPTION_IA_NA;=0D
++  Ia.IaAddressCount                 =3D 1;=0D
++  Ia.IaAddress[0].PreferredLifetime =3D 0x11111111;=0D
++  Ia.IaAddress[0].ValidLifetime     =3D 0x22222222;=0D
++  Ia.IaAddress[0].IpAddress         =3D mAllDhcpRelayAndServersAddress;=0D
++  Packet->Length                    =3D sizeof (EFI_DHCP6_HEADER);=0D
++=0D
++  Option =3D Dhcp6SeekStsOptionTest::Packet->Dhcp6.Option;=0D
++=0D
++  Status =3D Dhcp6AppendOption (=0D
++             Dhcp6SeekStsOptionTest::Packet,=0D
++             &Option,=0D
++             Dhcp6OptStatusCode,=0D
++             SearchPatternLength,=0D
++             (UINT8 *)&SearchPattern=0D
++             );=0D
++  ASSERT_EQ (Status, EFI_SUCCESS);=0D
++=0D
++  Status =3D Dhcp6AppendIaOption (=0D
++             Dhcp6SeekStsOptionTest::Packet,=0D
++             &Option,=0D
++             &Ia,=0D
++             0x12345678,=0D
++             0x11111111,=0D
++             0x22222222=0D
++             );=0D
++  ASSERT_EQ (Status, EFI_SUCCESS);=0D
++=0D
++  Dhcp6SeekStsOptionTest::Instance.Config->IaDescriptor.Type =3D DHCPV6_O=
PTION_IA_NA;=0D
++=0D
++  Option =3D NULL;=0D
++  Status =3D Dhcp6SeekStsOption (&(Dhcp6SeekStsOptionTest::Instance), Dhc=
p6SeekStsOptionTest::Packet, &Option);=0D
++=0D
++  ASSERT_EQ (Status, EFI_SUCCESS);=0D
++}=0D
+diff --git a/NetworkPkg/Dhcp6Dxe/GoogleTest/Dhcp6IoGoogleTest.h b/NetworkP=
kg/Dhcp6Dxe/GoogleTest/Dhcp6IoGoogleTest.h
+new file mode 100644
+index 0000000000..aed3b89082
+--- /dev/null
++++ b/NetworkPkg/Dhcp6Dxe/GoogleTest/Dhcp6IoGoogleTest.h
+@@ -0,0 +1,58 @@
++/** @file=0D
++  Acts as header for private functions under test in Dhcp6Io.c=0D
++=0D
++  Copyright (c) Microsoft Corporation=0D
++  SPDX-License-Identifier: BSD-2-Clause-Patent=0D
++**/=0D
++=0D
++#ifndef DHCP6_IO_GOOGLE_TEST_H_=0D
++#define DHCP6_IO_GOOGLE_TEST_H_=0D
++=0D
++/////////////////////////////////////////////////////////////////////////=
///////=0D
++// These are the functions that are being unit tested=0D
++/////////////////////////////////////////////////////////////////////////=
///////=0D
++=0D
++#include <Uefi.h>=0D
++=0D
++/**=0D
++  Seeks the Inner Options from a DHCP6 Option=0D
++=0D
++  @param[in]  IaType          The type of the IA option.=0D
++  @param[in]  Option          The pointer to the DHCP6 Option.=0D
++  @param[in]  OptionLen       The length of the DHCP6 Option.=0D
++  @param[out] IaInnerOpt      The pointer to the IA inner option.=0D
++  @param[out] IaInnerLen      The length of the IA inner option.=0D
++=0D
++  @retval EFI_SUCCESS         Seek the inner option successfully.=0D
++  @retval EFI_DEVICE_ERROR    The OptionLen is invalid.=0D
++*/=0D
++EFI_STATUS=0D
++Dhcp6SeekInnerOptionSafe (=0D
++  UINT16  IaType,=0D
++  UINT8   *Option,=0D
++  UINT32  OptionLen,=0D
++  UINT8   **IaInnerOpt,=0D
++  UINT16  *IaInnerLen=0D
++  );=0D
++=0D
++/**=0D
++  Seek StatusCode Option in package. A Status Code option may appear in t=
he=0D
++  options field of a DHCP message and/or in the options field of another =
option.=0D
++  See details in section 22.13, RFC3315.=0D
++=0D
++  @param[in]       Instance        The pointer to the Dhcp6 instance.=0D
++  @param[in]       Packet          The pointer to reply messages.=0D
++  @param[out]      Option          The pointer to status code option.=0D
++=0D
++  @retval EFI_SUCCESS              Seek status code option successfully.=
=0D
++  @retval EFI_DEVICE_ERROR         An unexpected error.=0D
++=0D
++**/=0D
++EFI_STATUS=0D
++Dhcp6SeekStsOption (=0D
++  IN     DHCP6_INSTANCE    *Instance,=0D
++  IN     EFI_DHCP6_PACKET  *Packet,=0D
++  OUT    UINT8             **Option=0D
++  );=0D
++=0D
++#endif // DHCP6_IO_GOOGLE_TEST_H=0D
+--=20
+2.40.0
+
diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2023-45229-0003.patch b/meta/r=
ecipes-core/ovmf/ovmf/CVE-2023-45229-0003.patch
new file mode 100644
index 0000000000..bf4e8eda1f
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/CVE-2023-45229-0003.patch
@@ -0,0 +1,244 @@
+From 1c440a5eceedc64e892877eeac0f1a4938f5abbb Mon Sep 17 00:00:00 2001
+From: Doug Flick <dougflick@microsoft.com>
+Date: Tue, 13 Feb 2024 10:46:00 -0800
+Subject: [PATCH] NetworkPkg: Dhcp6Dxe: SECURITY PATCH CVE-2023-45229 Relat=
ed=20
+ Patch
+
+REF: https://bugzilla.tianocore.org/show_bug.cgi?id=3D4673
+REF: https://bugzilla.tianocore.org/show_bug.cgi?id=3D4534
+
+This was not part of the Quarkslab bugs however the same pattern
+as CVE-2023-45229 exists in Dhcp6UpdateIaInfo.
+
+This patch replaces the code in question with the safe function
+created to patch CVE-2023-45229
+
+>
+>   if (EFI_ERROR (
+>        Dhcp6SeekInnerOptionSafe (
+>          Instance->Config->IaDescriptor.Type,
+>          Option,
+>          OptionLen,
+>          &IaInnerOpt,
+>          &IaInnerLen
+>          )
+>        ))
+>  {
+>    return EFI_DEVICE_ERROR;
+>  }
+>
+
+Additionally corrects incorrect usage of macro to read the status
+
+> - StsCode =3D NTOHS (ReadUnaligned16 ((UINT16 *)DHCP6_OFFSET_OF_OPT_LEN
+ (Option)));
+> + StsCode =3D NTOHS (ReadUnaligned16 ((UINT16 *)
+DHCP6_OFFSET_OF_STATUS_CODE (Option));
+
+Cc: Saloni Kasbekar <saloni.kasbekar@intel.com>
+Cc: Zachary Clark-williams <zachary.clark-williams@intel.com>
+Signed-off-by: Doug Flick [MSFT] <doug.edk2@gmail.com>
+Reviewed-by: Saloni Kasbekar <saloni.kasbekar@intel.com>
+Reviewed-by: Leif Lindholm <quic_llindhol@quicinc.com>
+
+CVE: CVE-2023-45229
+
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/1c440a=
5eceedc64e892877eeac0f1a4938f5abbb]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ NetworkPkg/Dhcp6Dxe/Dhcp6Io.c | 70 ++++++++++++++++++++++++++---------
+ NetworkPkg/Dhcp6Dxe/Dhcp6Io.h | 22 +++++++++++
+ 2 files changed, 75 insertions(+), 17 deletions(-)
+
+diff --git a/NetworkPkg/Dhcp6Dxe/Dhcp6Io.c b/NetworkPkg/Dhcp6Dxe/Dhcp6Io.c
+index 3b8feb4a20..a9bffae353 100644
+--- a/NetworkPkg/Dhcp6Dxe/Dhcp6Io.c
++++ b/NetworkPkg/Dhcp6Dxe/Dhcp6Io.c
+@@ -528,13 +528,23 @@ Dhcp6UpdateIaInfo (
+ {=0D
+   EFI_STATUS  Status;=0D
+   UINT8       *Option;=0D
++  UINT32      OptionLen;=0D
+   UINT8       *IaInnerOpt;=0D
+   UINT16      IaInnerLen;=0D
+   UINT16      StsCode;=0D
+   UINT32      T1;=0D
+   UINT32      T2;=0D
+ =0D
++  T1 =3D 0;=0D
++  T2 =3D 0;=0D
++=0D
+   ASSERT (Instance->Config !=3D NULL);=0D
++=0D
++  // OptionLen is the length of the Options excluding the DHCP header.=0D
++  // Length of the EFI_DHCP6_PACKET from the first byte of the Header fie=
ld to the last=0D
++  // byte of the Option[] field.=0D
++  OptionLen =3D Packet->Length - sizeof (Packet->Dhcp6.Header);=0D
++=0D
+   //=0D
+   // If the reply was received in response to a solicit with rapid commit=
 option,=0D
+   // request, renew or rebind message, the client updates the information=
 it has=0D
+@@ -549,13 +559,29 @@ Dhcp6UpdateIaInfo (
+   //=0D
+   Option =3D Dhcp6SeekIaOption (=0D
+              Packet->Dhcp6.Option,=0D
+-             Packet->Length - sizeof (EFI_DHCP6_HEADER),=0D
++             OptionLen,=0D
+              &Instance->Config->IaDescriptor=0D
+              );=0D
+   if (Option =3D=3D NULL) {=0D
+     return EFI_DEVICE_ERROR;=0D
+   }=0D
+ =0D
++  //=0D
++  // Calculate the distance from Packet->Dhcp6.Option to the IA option.=0D
++  //=0D
++  // Packet->Size and Packet->Length are both UINT32 type, and Packet->Si=
ze is=0D
++  // the size of the whole packet, including the DHCP header, and Packet-=
>Length=0D
++  // is the length of the DHCP message body, excluding the DHCP header.=0D
++  //=0D
++  // (*Option - Packet->Dhcp6.Option) is the number of bytes from the sta=
rt of=0D
++  // DHCP6 option area to the start of the IA option.=0D
++  //=0D
++  // Dhcp6SeekInnerOptionSafe() is searching starting from the start of t=
he=0D
++  // IA option to the end of the DHCP6 option area, thus subtract the spa=
ce=0D
++  // up until this option=0D
++  //=0D
++  OptionLen =3D OptionLen - (UINT32)(Option - Packet->Dhcp6.Option);=0D
++=0D
+   //=0D
+   // The format of the IA_NA option is:=0D
+   //=0D
+@@ -591,32 +617,32 @@ Dhcp6UpdateIaInfo (
+   //=0D
+ =0D
+   //=0D
+-  // sizeof (option-code + option-len + IaId)           =3D 8=0D
+-  // sizeof (option-code + option-len + IaId + T1)      =3D 12=0D
+-  // sizeof (option-code + option-len + IaId + T1 + T2) =3D 16=0D
+-  //=0D
+-  // The inner options still start with 2 bytes option-code and 2 bytes o=
ption-len.=0D
++  // Seek the inner option=0D
+   //=0D
++  if (EFI_ERROR (=0D
++        Dhcp6SeekInnerOptionSafe (=0D
++          Instance->Config->IaDescriptor.Type,=0D
++          Option,=0D
++          OptionLen,=0D
++          &IaInnerOpt,=0D
++          &IaInnerLen=0D
++          )=0D
++        ))=0D
++  {=0D
++    return EFI_DEVICE_ERROR;=0D
++  }=0D
++=0D
+   if (Instance->Config->IaDescriptor.Type =3D=3D Dhcp6OptIana) {=0D
+     T1 =3D NTOHL (ReadUnaligned32 ((UINT32 *)(DHCP6_OFFSET_OF_IA_NA_T1 (O=
ption))));=0D
+     T2 =3D NTOHL (ReadUnaligned32 ((UINT32 *)(DHCP6_OFFSET_OF_IA_NA_T2 (O=
ption))));=0D
+     //=0D
+     // Refer to RFC3155 Chapter 22.4. If a client receives an IA_NA with =
T1 greater than T2,=0D
+     // and both T1 and T2 are greater than 0, the client discards the IA_=
NA option and processes=0D
+-    // the remainder of the message as though the server had not  include=
d the invalid IA_NA option.=0D
++    // the remainder of the message as though the server had not included=
 the invalid IA_NA option.=0D
+     //=0D
+     if ((T1 > T2) && (T2 > 0)) {=0D
+       return EFI_DEVICE_ERROR;=0D
+     }=0D
+-=0D
+-    IaInnerOpt =3D DHCP6_OFFSET_OF_IA_NA_INNER_OPT (Option);=0D
+-    IaInnerLen =3D (UINT16)(NTOHS (ReadUnaligned16 ((UINT16 *)(DHCP6_OFFS=
ET_OF_OPT_LEN (Option)))) - DHCP6_SIZE_OF_COMBINED_IAID_T1_T2);=0D
+-  } else {=0D
+-    T1 =3D 0;=0D
+-    T2 =3D 0;=0D
+-=0D
+-    IaInnerOpt =3D DHCP6_OFFSET_OF_IA_TA_INNER_OPT (Option);=0D
+-    IaInnerLen =3D (UINT16)(NTOHS (ReadUnaligned16 ((UINT16 *)(DHCP6_OFFS=
ET_OF_OPT_LEN (Option)))) - DHCP6_SIZE_OF_IAID);=0D
+   }=0D
+ =0D
+   //=0D
+@@ -642,7 +668,7 @@ Dhcp6UpdateIaInfo (
+   Option  =3D Dhcp6SeekOption (IaInnerOpt, IaInnerLen, Dhcp6OptStatusCode=
);=0D
+ =0D
+   if (Option !=3D NULL) {=0D
+-    StsCode =3D NTOHS (ReadUnaligned16 ((UINT16 *)(DHCP6_OFFSET_OF_OPT_LE=
N (Option))));=0D
++    StsCode =3D NTOHS (ReadUnaligned16 ((UINT16 *)(DHCP6_OFFSET_OF_STATUS=
_CODE (Option))));=0D
+     if (StsCode !=3D Dhcp6StsSuccess) {=0D
+       return EFI_DEVICE_ERROR;=0D
+     }=0D
+@@ -703,15 +729,21 @@ Dhcp6SeekInnerOptionSafe (
+   }=0D
+ =0D
+   if (IaType =3D=3D Dhcp6OptIana) {=0D
++    //=0D
+     // Verify we have a fully formed IA_NA=0D
++    //=0D
+     if (OptionLen < DHCP6_MIN_SIZE_OF_IA_NA) {=0D
+       return EFI_DEVICE_ERROR;=0D
+     }=0D
+ =0D
++    //=0D
++    // Get the IA Inner Option and Length=0D
+     //=0D
+     IaInnerOptTmp =3D DHCP6_OFFSET_OF_IA_NA_INNER_OPT (Option);=0D
+ =0D
++    //=0D
+     // Verify the IaInnerLen is valid.=0D
++    //=0D
+     IaInnerLenTmp =3D (UINT16)NTOHS (ReadUnaligned16 ((UINT16 *)DHCP6_OFF=
SET_OF_OPT_LEN (Option)));=0D
+     if (IaInnerLenTmp < DHCP6_SIZE_OF_COMBINED_IAID_T1_T2) {=0D
+       return EFI_DEVICE_ERROR;=0D
+@@ -719,14 +751,18 @@ Dhcp6SeekInnerOptionSafe (
+ =0D
+     IaInnerLenTmp -=3D DHCP6_SIZE_OF_COMBINED_IAID_T1_T2;=0D
+   } else if (IaType =3D=3D Dhcp6OptIata) {=0D
++    //=0D
+     // Verify the OptionLen is valid.=0D
++    //=0D
+     if (OptionLen < DHCP6_MIN_SIZE_OF_IA_TA) {=0D
+       return EFI_DEVICE_ERROR;=0D
+     }=0D
+ =0D
+     IaInnerOptTmp =3D DHCP6_OFFSET_OF_IA_TA_INNER_OPT (Option);=0D
+ =0D
++    //=0D
+     // Verify the IaInnerLen is valid.=0D
++    //=0D
+     IaInnerLenTmp =3D (UINT16)NTOHS (ReadUnaligned16 ((UINT16 *)(DHCP6_OF=
FSET_OF_OPT_LEN (Option))));=0D
+     if (IaInnerLenTmp < DHCP6_SIZE_OF_IAID) {=0D
+       return EFI_DEVICE_ERROR;=0D
+diff --git a/NetworkPkg/Dhcp6Dxe/Dhcp6Io.h b/NetworkPkg/Dhcp6Dxe/Dhcp6Io.h
+index 051a652f2b..ab0e1ac27f 100644
+--- a/NetworkPkg/Dhcp6Dxe/Dhcp6Io.h
++++ b/NetworkPkg/Dhcp6Dxe/Dhcp6Io.h
+@@ -217,4 +217,26 @@ Dhcp6OnTimerTick (
+   IN VOID       *Context=0D
+   );=0D
+ =0D
++/**=0D
++  Seeks the Inner Options from a DHCP6 Option=0D
++=0D
++  @param[in]  IaType          The type of the IA option.=0D
++  @param[in]  Option          The pointer to the DHCP6 Option.=0D
++  @param[in]  OptionLen       The length of the DHCP6 Option.=0D
++  @param[out] IaInnerOpt      The pointer to the IA inner option.=0D
++  @param[out] IaInnerLen      The length of the IA inner option.=0D
++=0D
++  @retval EFI_SUCCESS         Seek the inner option successfully.=0D
++  @retval EFI_DEVICE_ERROR    The OptionLen is invalid. On Error,=0D
++                              the pointers are not modified=0D
++**/=0D
++EFI_STATUS=0D
++Dhcp6SeekInnerOptionSafe (=0D
++  IN  UINT16  IaType,=0D
++  IN  UINT8   *Option,=0D
++  IN  UINT32  OptionLen,=0D
++  OUT UINT8   **IaInnerOpt,=0D
++  OUT UINT16  *IaInnerLen=0D
++  );=0D
++=0D
+ #endif=0D
+--=20
+2.40.0
+
diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2023-45229-0004.patch b/meta/r=
ecipes-core/ovmf/ovmf/CVE-2023-45229-0004.patch
new file mode 100644
index 0000000000..85d204972d
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/CVE-2023-45229-0004.patch
@@ -0,0 +1,157 @@
+From 1d0b95f6457d225c5108302a9da74b4ed7aa5a38 Mon Sep 17 00:00:00 2001
+From: "Doug Flick via groups.io" <dougflick=3Dmicrosoft.com@groups.io>
+Date: Fri, 26 Jan 2024 05:54:57 +0800
+Subject: [PATCH] NetworkPkg: : Adds a SecurityFix.yaml file
+
+This creates / adds a security file that tracks the security fixes
+found in this package and can be used to find the fixes that were
+applied.
+
+Cc: Saloni Kasbekar <saloni.kasbekar@intel.com>
+Cc: Zachary Clark-williams <zachary.clark-williams@intel.com>
+
+Signed-off-by: Doug Flick [MSFT] <doug.edk2@gmail.com>
+Reviewed-by: Saloni Kasbekar <saloni.kasbekar@intel.com>
+
+CVE: CVE_2023_45229
+
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/1d0b95=
f6457d225c5108302a9da74b4ed7aa5a38]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ NetworkPkg/SecurityFixes.yaml | 123 ++++++++++++++++++++++++++++++++++
+ 1 file changed, 123 insertions(+)
+ create mode 100644 NetworkPkg/SecurityFixes.yaml
+
+diff --git a/NetworkPkg/SecurityFixes.yaml b/NetworkPkg/SecurityFixes.yaml
+new file mode 100644
+index 0000000000..7e900483fe
+--- /dev/null
++++ b/NetworkPkg/SecurityFixes.yaml
+@@ -0,0 +1,123 @@
++## @file=0D
++# Security Fixes for SecurityPkg=0D
++#=0D
++# Copyright (c) Microsoft Corporation=0D
++# SPDX-License-Identifier: BSD-2-Clause-Patent=0D
++##=0D
++CVE_2023_45229:=0D
++  commit_titles:=0D
++    - "NetworkPkg: Dhcp6Dxe: SECURITY PATCH CVE-2023-45229 Patch"=0D
++    - "NetworkPkg: Dhcp6Dxe: SECURITY PATCH CVE-2023-45229 Unit Tests"=0D
++  cve: CVE-2023-45229=0D
++  date_reported: 2023-08-28 13:56 UTC=0D
++  description: "Bug 01 - edk2/NetworkPkg: Out-of-bounds read when process=
ing IA_NA/IA_TA options in a DHCPv6 Advertise message"=0D
++  note:=0D
++  files_impacted:=0D
++    - NetworkPkg\Dhcp6Dxe\Dhcp6Io.c=0D
++    - NetworkPkg\Dhcp6Dxe\Dhcp6Impl.h=0D
++  links:=0D
++    - https://bugzilla.tianocore.org/show_bug.cgi?id=3D4534=0D
++    - https://nvd.nist.gov/vuln/detail/CVE-2023-45229=0D
++    - http://www.openwall.com/lists/oss-security/2024/01/16/2=0D
++    - http://packetstormsecurity.com/files/176574/PixieFail-Proof-Of-Conc=
epts.html=0D
++    - https://blog.quarkslab.com/pixiefail-nine-vulnerabilities-in-tianoc=
ores-edk-ii-ipv6-network-stack.html=0D
++CVE_2023_45230:=0D
++  commit_titles:=0D
++    - "NetworkPkg: Dhcp6Dxe: SECURITY PATCH CVE-2023-45230 Patch"=0D
++    - "NetworkPkg: Dhcp6Dxe: SECURITY PATCH CVE-2023-45230 Unit Tests"=0D
++  cve: CVE-2023-45230=0D
++  date_reported: 2023-08-28 13:56 UTC=0D
++  description: "Bug 02 - edk2/NetworkPkg: Buffer overflow in the DHCPv6 c=
lient via a long Server ID option"=0D
++  note:=0D
++  files_impacted:=0D
++    - NetworkPkg\Dhcp6Dxe\Dhcp6Io.c=0D
++    - NetworkPkg\Dhcp6Dxe\Dhcp6Impl.h=0D
++  links:=0D
++    - https://bugzilla.tianocore.org/show_bug.cgi?id=3D4535=0D
++    - https://nvd.nist.gov/vuln/detail/CVE-2023-45230=0D
++    - http://www.openwall.com/lists/oss-security/2024/01/16/2=0D
++    - http://packetstormsecurity.com/files/176574/PixieFail-Proof-Of-Conc=
epts.html=0D
++    - https://blog.quarkslab.com/pixiefail-nine-vulnerabilities-in-tianoc=
ores-edk-ii-ipv6-network-stack.html=0D
++CVE_2023_45231:=0D
++  commit_titles:=0D
++    - "NetworkPkg: Dhcp6Dxe: SECURITY PATCH CVE-2023-45231 Patch"=0D
++    - "NetworkPkg: Dhcp6Dxe: SECURITY PATCH CVE-2023-45231 Unit Tests"=0D
++  cve: CVE-2023-45231=0D
++  date_reported: 2023-08-28 13:56 UTC=0D
++  description: "Bug 03 - edk2/NetworkPkg: Out-of-bounds read when handlin=
g a ND Redirect message with truncated options"=0D
++  note:=0D
++  files_impacted:=0D
++    - NetworkPkg/Ip6Dxe/Ip6Option.c=0D
++  links:=0D
++    - https://bugzilla.tianocore.org/show_bug.cgi?id=3D4536=0D
++    - https://nvd.nist.gov/vuln/detail/CVE-2023-45231=0D
++    - http://www.openwall.com/lists/oss-security/2024/01/16/2=0D
++    - http://packetstormsecurity.com/files/176574/PixieFail-Proof-Of-Conc=
epts.html=0D
++    - https://blog.quarkslab.com/pixiefail-nine-vulnerabilities-in-tianoc=
ores-edk-ii-ipv6-network-stack.html=0D
++CVE_2023_45232:=0D
++  commit_titles:=0D
++    - "NetworkPkg: Dhcp6Dxe: SECURITY PATCH CVE-2023-45232 Patch"=0D
++    - "NetworkPkg: Dhcp6Dxe: SECURITY PATCH CVE-2023-45232 Unit Tests"=0D
++  cve: CVE-2023-45232=0D
++  date_reported: 2023-08-28 13:56 UTC=0D
++  description: "Bug 04 - edk2/NetworkPkg: Infinite loop when parsing unkn=
own options in the Destination Options header"=0D
++  note:=0D
++  files_impacted:=0D
++    - NetworkPkg/Ip6Dxe/Ip6Option.c=0D
++    - NetworkPkg/Ip6Dxe/Ip6Option.h=0D
++  links:=0D
++    - https://bugzilla.tianocore.org/show_bug.cgi?id=3D4537=0D
++    - https://nvd.nist.gov/vuln/detail/CVE-2023-45232=0D
++    - http://www.openwall.com/lists/oss-security/2024/01/16/2=0D
++    - http://packetstormsecurity.com/files/176574/PixieFail-Proof-Of-Conc=
epts.html=0D
++    - https://blog.quarkslab.com/pixiefail-nine-vulnerabilities-in-tianoc=
ores-edk-ii-ipv6-network-stack.html=0D
++CVE_2023_45233:=0D
++  commit_titles:=0D
++    - "NetworkPkg: Dhcp6Dxe: SECURITY PATCH CVE-2023-45232 Patch"=0D
++    - "NetworkPkg: Dhcp6Dxe: SECURITY PATCH CVE-2023-45232 Unit Tests"=0D
++  cve: CVE-2023-45233=0D
++  date_reported: 2023-08-28 13:56 UTC=0D
++  description: "Bug 05 - edk2/NetworkPkg: Infinite loop when parsing a Pa=
dN option in the Destination Options header "=0D
++  note: This was fixed along with CVE-2023-45233=0D
++  files_impacted:=0D
++    - NetworkPkg/Ip6Dxe/Ip6Option.c=0D
++    - NetworkPkg/Ip6Dxe/Ip6Option.h=0D
++  links:=0D
++    - https://bugzilla.tianocore.org/show_bug.cgi?id=3D4538=0D
++    - https://nvd.nist.gov/vuln/detail/CVE-2023-45233=0D
++    - http://www.openwall.com/lists/oss-security/2024/01/16/2=0D
++    - http://packetstormsecurity.com/files/176574/PixieFail-Proof-Of-Conc=
epts.html=0D
++    - https://blog.quarkslab.com/pixiefail-nine-vulnerabilities-in-tianoc=
ores-edk-ii-ipv6-network-stack.html=0D
++CVE_2023_45234:=0D
++  commit_titles:=0D
++    - "NetworkPkg: Dhcp6Dxe: SECURITY PATCH CVE-2023-45234 Patch"=0D
++    - "NetworkPkg: Dhcp6Dxe: SECURITY PATCH CVE-2023-45234 Unit Tests"=0D
++  cve: CVE-2023-45234=0D
++  date_reported: 2023-08-28 13:56 UTC=0D
++  description: "Bug 06 - edk2/NetworkPkg: Buffer overflow when processing=
 DNS Servers option in a DHCPv6 Advertise message"=0D
++  note:=0D
++  files_impacted:=0D
++    - NetworkPkg/UefiPxeBcDxe/PxeBcDhcp6.c=0D
++  links:=0D
++    - https://bugzilla.tianocore.org/show_bug.cgi?id=3D4539=0D
++    - https://nvd.nist.gov/vuln/detail/CVE-2023-45234=0D
++    - http://www.openwall.com/lists/oss-security/2024/01/16/2=0D
++    - http://packetstormsecurity.com/files/176574/PixieFail-Proof-Of-Conc=
epts.html=0D
++    - https://blog.quarkslab.com/pixiefail-nine-vulnerabilities-in-tianoc=
ores-edk-ii-ipv6-network-stack.html=0D
++CVE_2023_45235:=0D
++  commit_titles:=0D
++    - "NetworkPkg: Dhcp6Dxe: SECURITY PATCH CVE-2023-45235 Patch"=0D
++    - "NetworkPkg: Dhcp6Dxe: SECURITY PATCH CVE-2023-45235 Unit Tests"=0D
++  cve: CVE-2023-45235=0D
++  date_reported: 2023-08-28 13:56 UTC=0D
++  description: "Bug 07 - edk2/NetworkPkg: Buffer overflow when handling S=
erver ID option from a DHCPv6 proxy Advertise message"=0D
++  note:=0D
++  files_impacted:=0D
++    - NetworkPkg/UefiPxeBcDxe/PxeBcDhcp6.c=0D
++    - NetworkPkg/UefiPxeBcDxe/PxeBcDhcp6.h=0D
++  links:=0D
++    - https://bugzilla.tianocore.org/show_bug.cgi?id=3D4540=0D
++    - https://nvd.nist.gov/vuln/detail/CVE-2023-45235=0D
++    - http://www.openwall.com/lists/oss-security/2024/01/16/2=0D
++    - http://packetstormsecurity.com/files/176574/PixieFail-Proof-Of-Conc=
epts.html=0D
++    - https://blog.quarkslab.com/pixiefail-nine-vulnerabilities-in-tianoc=
ores-edk-ii-ipv6-network-stack.html=0D
+--=20
+2.40.0
+
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ov=
mf_git.bb
index ceebb53438..6ac72772d1 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -43,6 +43,10 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branc=
h=3Dmaster;protocol=3Dhttps \
            file://CVE-2023-45234-0002.patch \
            file://CVE-2023-45235-0001.patch \
            file://CVE-2023-45235-0002.patch \
+           file://CVE-2023-45229-0001.patch \
+           file://CVE-2023-45229-0002.patch \
+           file://CVE-2023-45229-0003.patch \
+           file://CVE-2023-45229-0004.patch \
            "
=20
 PV =3D "edk2-stable202202"
--=20
2.25.1


