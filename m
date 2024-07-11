Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEE3DC3271E
	for <webhook@archiver.kernel.org>; Thu, 11 Jul 2024 04:56:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.4941.1720673771003024590
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 21:56:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=79227d51f5=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46B4tMnv031582
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 21:56:10 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 407170mcjn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 21:56:09 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 21:56:07 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 05/11] ovmf: Fix CVE-2023-45232, CVE-2023-45233
Date: Thu, 11 Jul 2024 04:55:35 +0000
Message-ID: <20240711045541.2155076-5-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20240711045541.2155076-1-soumya.sambu@windriver.com>
References: <20240711045541.2155076-1-soumya.sambu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: wuu_JfsZRztxBMGcFw8L0uIEbJ4uIQZc
X-Proofpoint-ORIG-GUID: wuu_JfsZRztxBMGcFw8L0uIEbJ4uIQZc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-11_01,2024-07-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407110031
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jul 2024 04:56:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201755

From: Soumya Sambu <soumya.sambu@windriver.com>

CVE-2023-45232:
EDK2's Network Package is susceptible to an infinite loop vulnerability
when parsing unknown options in the Destination Options header of IPv6.
This vulnerability can be exploited by an attacker to gain unauthorized
access and potentially lead to a loss of Availability.

CVE-2023-45233:
EDK2's Network Package is susceptible to an infinite lop vulnerability
when parsing a PadN option in the Destination Options header of IPv6.
This vulnerability can be exploited by an attacker to gain unauthorized
access and potentially lead to a loss of Availability.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-45232
https://nvd.nist.gov/vuln/detail/CVE-2023-45233

Upstream-patches:
https://github.com/tianocore/edk2/commit/4df0229ef992d4f2721a8508787ebf9dc8=
1fbd6e
https://github.com/tianocore/edk2/commit/c9c87f08dd6ace36fa843424522c3558a8=
374cac

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../CVE-2023-45232-CVE-2023-45233-0001.patch  | 360 +++++++++++++++
 .../CVE-2023-45232-CVE-2023-45233-0002.patch  | 417 ++++++++++++++++++
 meta/recipes-core/ovmf/ovmf_git.bb            |   2 +
 3 files changed, 779 insertions(+)
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2023-45232-CVE-2023-452=
33-0001.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2023-45232-CVE-2023-452=
33-0002.patch

diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2023-45232-CVE-2023-45233-0001=
.patch b/meta/recipes-core/ovmf/ovmf/CVE-2023-45232-CVE-2023-45233-0001.pat=
ch
new file mode 100644
index 0000000000..d43e971d9d
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/CVE-2023-45232-CVE-2023-45233-0001.patch
@@ -0,0 +1,360 @@
+From 4df0229ef992d4f2721a8508787ebf9dc81fbd6e Mon Sep 17 00:00:00 2001
+From: Doug Flick <dougflick@microsoft.com>
+Date: Fri, 26 Jan 2024 05:54:50 +0800
+Subject: [PATCH] NetworkPkg: Ip6Dxe: SECURITY PATCH CVE-2023-45232 Patch
+
+REF:https://bugzilla.tianocore.org/show_bug.cgi?id=3D4537
+REF:https://bugzilla.tianocore.org/show_bug.cgi?id=3D4538
+
+Bug Details:
+PixieFail Bug #4
+CVE-2023-45232
+CVSS 7.5 : CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H
+CWE-835 Loop with Unreachable Exit Condition ('Infinite Loop')
+
+Infinite loop when parsing unknown options in the Destination Options
+header
+
+PixieFail Bug #5
+CVE-2023-45233
+CVSS 7.5 : CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H
+CWE-835 Loop with Unreachable Exit Condition ('Infinite Loop')
+
+Infinite loop when parsing a PadN option in the Destination Options
+header
+
+Change Overview:
+
+Most importantly this change corrects the following incorrect math
+and cleans up the code.
+
+>   // It is a PadN option
+>   //
+> - Offset =3D (UINT8)(Offset + *(Option + Offset + 1) + 2);
+> + OptDataLen =3D ((EFI_IP6_OPTION *)(Option + Offset))->Length;
+> + Offset     =3D IP6_NEXT_OPTION_OFFSET (Offset, OptDataLen);
+
+> case Ip6OptionSkip:
+> - Offset =3D (UINT8)(Offset + *(Option + Offset + 1));
+>   OptDataLen =3D ((EFI_IP6_OPTION *)(Option + Offset))->Length;
+>   Offset     =3D IP6_NEXT_OPTION_OFFSET (Offset, OptDataLen);
+
+Additionally, this change also corrects incorrect math where the calling
+function was calculating the HDR EXT optionLen as a uint8 instead of a
+uint16
+
+> - OptionLen =3D (UINT8)((*Option + 1) * 8 - 2);
+> + OptionLen =3D IP6_HDR_EXT_LEN (*Option) -
+IP6_COMBINED_SIZE_OF_NEXT_HDR_AND_LEN;
+
+Additionally this check adds additional logic to santize the incoming
+data
+
+Cc: Saloni Kasbekar <saloni.kasbekar@intel.com>
+Cc: Zachary Clark-williams <zachary.clark-williams@intel.com>
+
+Signed-off-by: Doug Flick [MSFT] <doug.edk2@gmail.com>
+Reviewed-by: Saloni Kasbekar <saloni.kasbekar@intel.com>
+
+CVE: CVE-2023-45232, CVE-2023-45233
+
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/4df022=
9ef992d4f2721a8508787ebf9dc81fbd6e]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ NetworkPkg/Ip6Dxe/Ip6Nd.h     | 35 ++++++++++++++++
+ NetworkPkg/Ip6Dxe/Ip6Option.c | 76 ++++++++++++++++++++++++++++++-----
+ NetworkPkg/Ip6Dxe/Ip6Option.h | 71 ++++++++++++++++++++++++++++++++
+ 3 files changed, 171 insertions(+), 11 deletions(-)
+
+diff --git a/NetworkPkg/Ip6Dxe/Ip6Nd.h b/NetworkPkg/Ip6Dxe/Ip6Nd.h
+index 860934a167..bf64e9114e 100644
+--- a/NetworkPkg/Ip6Dxe/Ip6Nd.h
++++ b/NetworkPkg/Ip6Dxe/Ip6Nd.h
+@@ -56,13 +56,48 @@ VOID
+   VOID  *Context=0D
+   );=0D
+ =0D
++//=0D
++// Per RFC8200 Section 4.2=0D
++//=0D
++//   Two of the currently-defined extension headers -- the Hop-by-Hop=0D
++//   Options header and the Destination Options header -- carry a variabl=
e=0D
++//   number of type-length-value (TLV) encoded "options", of the followin=
g=0D
++//   format:=0D
++//=0D
++//      +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+- - - - - - - - -=0D
++//      |  Option Type  |  Opt Data Len |  Option Data=0D
++//      +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+- - - - - - - - -=0D
++//=0D
++//      Option Type          8-bit identifier of the type of option.=0D
++//=0D
++//      Opt Data Len         8-bit unsigned integer.  Length of the Optio=
n=0D
++//                           Data field of this option, in octets.=0D
++//=0D
++//      Option Data          Variable-length field.  Option-Type-specific=
=0D
++//                           data.=0D
++//=0D
+ typedef struct _IP6_OPTION_HEADER {=0D
++  ///=0D
++  /// identifier of the type of option.=0D
++  ///=0D
+   UINT8    Type;=0D
++  ///=0D
++  /// Length of the Option Data field of this option, in octets.=0D
++  ///=0D
+   UINT8    Length;=0D
++  ///=0D
++  /// Option-Type-specific data.=0D
++  ///=0D
+ } IP6_OPTION_HEADER;=0D
+ =0D
+ STATIC_ASSERT (sizeof (IP6_OPTION_HEADER) =3D=3D 2, "IP6_OPTION_HEADER is=
 expected to be exactly 2 bytes long.");=0D
+ =0D
++#define IP6_NEXT_OPTION_OFFSET(offset, length)  (offset + sizeof(IP6_OPTI=
ON_HEADER) + length)=0D
++STATIC_ASSERT (=0D
++  IP6_NEXT_OPTION_OFFSET (0, 0) =3D=3D 2,=0D
++  "The next option is minimally the combined size of the option tag and l=
ength"=0D
++  );=0D
++=0D
+ typedef struct _IP6_ETHE_ADDR_OPTION {=0D
+   UINT8    Type;=0D
+   UINT8    Length;=0D
+diff --git a/NetworkPkg/Ip6Dxe/Ip6Option.c b/NetworkPkg/Ip6Dxe/Ip6Option.c
+index 8718d5d875..fd97ce116f 100644
+--- a/NetworkPkg/Ip6Dxe/Ip6Option.c
++++ b/NetworkPkg/Ip6Dxe/Ip6Option.c
+@@ -17,7 +17,8 @@
+   @param[in]  IpSb              The IP6 service data.=0D
+   @param[in]  Packet            The to be validated packet.=0D
+   @param[in]  Option            The first byte of the option.=0D
+-  @param[in]  OptionLen         The length of the whole option.=0D
++  @param[in]  OptionLen         The length of all options, expressed in b=
yte length of octets.=0D
++                                Maximum length is 2046 bytes or ((n + 1) =
* 8) - 2 where n is 255.=0D
+   @param[in]  Pointer           Identifies the octet offset within=0D
+                                 the invoking packet where the error was d=
etected.=0D
+ =0D
+@@ -31,12 +32,33 @@ Ip6IsOptionValid (
+   IN IP6_SERVICE  *IpSb,=0D
+   IN NET_BUF      *Packet,=0D
+   IN UINT8        *Option,=0D
+-  IN UINT8        OptionLen,=0D
++  IN UINT16       OptionLen,=0D
+   IN UINT32       Pointer=0D
+   )=0D
+ {=0D
+-  UINT8  Offset;=0D
+-  UINT8  OptionType;=0D
++  UINT16  Offset;=0D
++  UINT8   OptionType;=0D
++  UINT8   OptDataLen;=0D
++=0D
++  if (Option =3D=3D NULL) {=0D
++    ASSERT (Option !=3D NULL);=0D
++    return FALSE;=0D
++  }=0D
++=0D
++  if ((OptionLen <=3D 0) || (OptionLen > IP6_MAX_EXT_DATA_LENGTH)) {=0D
++    ASSERT (OptionLen > 0 && OptionLen <=3D IP6_MAX_EXT_DATA_LENGTH);=0D
++    return FALSE;=0D
++  }=0D
++=0D
++  if (Packet =3D=3D NULL) {=0D
++    ASSERT (Packet !=3D NULL);=0D
++    return FALSE;=0D
++  }=0D
++=0D
++  if (IpSb =3D=3D NULL) {=0D
++    ASSERT (IpSb !=3D NULL);=0D
++    return FALSE;=0D
++  }=0D
+ =0D
+   Offset =3D 0;=0D
+ =0D
+@@ -54,7 +76,8 @@ Ip6IsOptionValid (
+         //=0D
+         // It is a PadN option=0D
+         //=0D
+-        Offset =3D (UINT8)(Offset + *(Option + Offset + 1) + 2);=0D
++        OptDataLen =3D ((IP6_OPTION_HEADER *)(Option + Offset))->Length;=
=0D
++        Offset     =3D IP6_NEXT_OPTION_OFFSET (Offset, OptDataLen);=0D
+         break;=0D
+       case Ip6OptionRouterAlert:=0D
+         //=0D
+@@ -69,7 +92,8 @@ Ip6IsOptionValid (
+         //=0D
+         switch (OptionType & Ip6OptionMask) {=0D
+           case Ip6OptionSkip:=0D
+-            Offset =3D (UINT8)(Offset + *(Option + Offset + 1));=0D
++            OptDataLen =3D ((IP6_OPTION_HEADER *)(Option + Offset))->Leng=
th;=0D
++            Offset     =3D IP6_NEXT_OPTION_OFFSET (Offset, OptDataLen);=0D
+             break;=0D
+           case Ip6OptionDiscard:=0D
+             return FALSE;=0D
+@@ -308,7 +332,7 @@ Ip6IsExtsValid (
+   UINT32               Pointer;=0D
+   UINT32               Offset;=0D
+   UINT8                *Option;=0D
+-  UINT8                OptionLen;=0D
++  UINT16               OptionLen;=0D
+   BOOLEAN              Flag;=0D
+   UINT8                CountD;=0D
+   UINT8                CountA;=0D
+@@ -385,6 +409,36 @@ Ip6IsExtsValid (
+       // Fall through=0D
+       //=0D
+       case IP6_DESTINATION:=0D
++        //=0D
++        // See https://www.rfc-editor.org/rfc/rfc2460#section-4.2 page 23=
=0D
++        //=0D
++        // +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-=
+-+=0D
++        // |  Next Header  |  Hdr Ext Len  |                             =
  |=0D
++        // +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+                             =
  +=0D
++        // |                                                             =
  |=0D
++        // .                                                             =
  .=0D
++        // .                            Options                          =
  .=0D
++        // .                                                             =
  .=0D
++        // |                                                             =
  |=0D
++        // +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-=
+-+=0D
++        //=0D
++        //=0D
++        //   Next Header    8-bit selector.  Identifies the type of heade=
r=0D
++        //                  immediately following the Destination Options=
=0D
++        //                  header.  Uses the same values as the IPv4=0D
++        //                  Protocol field [RFC-1700 et seq.].=0D
++        //=0D
++        //   Hdr Ext Len    8-bit unsigned integer.  Length of the=0D
++        //                  Destination Options header in 8-octet units, =
not=0D
++        //                  including the first 8 octets.=0D
++        //=0D
++        //   Options        Variable-length field, of length such that th=
e=0D
++        //                  complete Destination Options header is an=0D
++        //                  integer multiple of 8 octets long.  Contains =
one=0D
++        //                  or  more TLV-encoded options, as described in=
=0D
++        //                  section 4.2.=0D
++        //=0D
++=0D
+         if (*NextHeader =3D=3D IP6_DESTINATION) {=0D
+           CountD++;=0D
+         }=0D
+@@ -398,7 +452,7 @@ Ip6IsExtsValid (
+ =0D
+         Offset++;=0D
+         Option    =3D ExtHdrs + Offset;=0D
+-        OptionLen =3D (UINT8)((*Option + 1) * 8 - 2);=0D
++        OptionLen =3D IP6_HDR_EXT_LEN (*Option) - sizeof (IP6_EXT_HDR);=0D
+         Option++;=0D
+         Offset++;=0D
+ =0D
+@@ -430,7 +484,7 @@ Ip6IsExtsValid (
+           //=0D
+           // Ignore the routing header and proceed to process the next he=
ader.=0D
+           //=0D
+-          Offset =3D Offset + (RoutingHead->HeaderLen + 1) * 8;=0D
++          Offset =3D Offset + IP6_HDR_EXT_LEN (RoutingHead->HeaderLen);=0D
+ =0D
+           if (UnFragmentLen !=3D NULL) {=0D
+             *UnFragmentLen =3D Offset;=0D
+@@ -441,7 +495,7 @@ Ip6IsExtsValid (
+           // to the packet's source address, pointing to the unrecognized=
 routing=0D
+           // type.=0D
+           //=0D
+-          Pointer =3D Offset + 2 + sizeof (EFI_IP6_HEADER);=0D
++          Pointer =3D Offset + sizeof (IP6_EXT_HDR) + sizeof (EFI_IP6_HEA=
DER);=0D
+           if ((IpSb !=3D NULL) && (Packet !=3D NULL) &&=0D
+               !IP6_IS_MULTICAST (&Packet->Ip.Ip6->DestinationAddress))=0D
+           {=0D
+@@ -527,7 +581,7 @@ Ip6IsExtsValid (
+         //=0D
+         // RFC2402, Payload length is specified in 32-bit words, minus "2=
".=0D
+         //=0D
+-        OptionLen =3D (UINT8)((*Option + 2) * 4);=0D
++        OptionLen =3D ((UINT16)(*Option + 2) * 4);=0D
+         Offset    =3D Offset + OptionLen;=0D
+         break;=0D
+ =0D
+diff --git a/NetworkPkg/Ip6Dxe/Ip6Option.h b/NetworkPkg/Ip6Dxe/Ip6Option.h
+index bd8e223c8a..fb07c28f5a 100644
+--- a/NetworkPkg/Ip6Dxe/Ip6Option.h
++++ b/NetworkPkg/Ip6Dxe/Ip6Option.h
+@@ -12,6 +12,77 @@
+ =0D
+ #define IP6_FRAGMENT_OFFSET_MASK  (~0x3)=0D
+ =0D
++//=0D
++// For more information see RFC 8200, Section 4.3, 4.4, and 4.6=0D
++//=0D
++//  This example format is from section 4.6=0D
++//  This does not apply to fragment headers=0D
++//=0D
++//     +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+=
=0D
++//    |  Next Header  |  Hdr Ext Len  |                               |=0D
++//    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+                               +=0D
++//    |                                                               |=0D
++//    .                                                               .=0D
++//    .                  Header-Specific Data                         .=0D
++//    .                                                               .=0D
++//    |                                                               |=0D
++//    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+=0D
++//=0D
++//      Next Header           8-bit selector.  Identifies the type of=0D
++//                            header immediately following the extension=
=0D
++//                            header.  Uses the same values as the IPv4=0D
++//                            Protocol field [IANA-PN].=0D
++//=0D
++//      Hdr Ext Len           8-bit unsigned integer.  Length of the=0D
++//                            Destination Options header in 8-octet units=
,=0D
++//                            not including the first 8 octets.=0D
++=0D
++//=0D
++// These defines apply to the following:=0D
++//   1. Hop by Hop=0D
++//   2. Routing=0D
++//   3. Destination=0D
++//=0D
++typedef struct _IP6_EXT_HDR {=0D
++  ///=0D
++  /// The Next Header field identifies the type of header immediately=0D
++  ///=0D
++  UINT8    NextHeader;=0D
++  ///=0D
++  /// The Hdr Ext Len field specifies the length of the Hop-by-Hop Option=
s=0D
++  ///=0D
++  UINT8    HdrExtLen;=0D
++  ///=0D
++  /// Header-Specific Data=0D
++  ///=0D
++} IP6_EXT_HDR;=0D
++=0D
++STATIC_ASSERT (=0D
++  sizeof (IP6_EXT_HDR) =3D=3D 2,=0D
++  "The combined size of Next Header and Len is two 8 bit fields"=0D
++  );=0D
++=0D
++//=0D
++// IPv6 extension headers contain an 8-bit length field which describes t=
he size of=0D
++// the header. However, the length field only includes the size of the ex=
tension=0D
++// header options, not the size of the first 8 bytes of the header. There=
fore, in=0D
++// order to calculate the full size of the extension header, we add 1 (to=
 account=0D
++// for the first 8 bytes omitted by the length field reporting) and then =
multiply=0D
++// by 8 (since the size is represented in 8-byte units).=0D
++//=0D
++// a is the length field of the extension header (UINT8)=0D
++// The result may be up to 2046 octets (UINT16)=0D
++//=0D
++#define IP6_HDR_EXT_LEN(a)  (((UINT16)((UINT8)(a)) + 1) * 8)=0D
++=0D
++// This is the maxmimum length permissible by a extension header=0D
++// Length is UINT8 of 8 octets not including the first 8 octets=0D
++#define IP6_MAX_EXT_DATA_LENGTH  (IP6_HDR_EXT_LEN (MAX_UINT8) - sizeof(IP=
6_EXT_HDR))=0D
++STATIC_ASSERT (=0D
++  IP6_MAX_EXT_DATA_LENGTH =3D=3D 2046,=0D
++  "Maximum data length is ((MAX_UINT8 + 1) * 8) - 2"=0D
++  );=0D
++=0D
+ typedef struct _IP6_FRAGMENT_HEADER {=0D
+   UINT8     NextHeader;=0D
+   UINT8     Reserved;=0D
+--=20
+2.40.0
+
diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2023-45232-CVE-2023-45233-0002=
.patch b/meta/recipes-core/ovmf/ovmf/CVE-2023-45232-CVE-2023-45233-0002.pat=
ch
new file mode 100644
index 0000000000..c6834a852e
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/CVE-2023-45232-CVE-2023-45233-0002.patch
@@ -0,0 +1,417 @@
+From c9c87f08dd6ace36fa843424522c3558a8374cac Mon Sep 17 00:00:00 2001
+From: Doug Flick <dougflick@microsoft.com>
+Date: Fri, 26 Jan 2024 05:54:51 +0800
+Subject: [PATCH] NetworkPkg: Ip6Dxe: SECURITY PATCH CVE-2023-45232 Unit Te=
sts
+
+REF:https://bugzilla.tianocore.org/show_bug.cgi?id=3D4537
+REF:https://bugzilla.tianocore.org/show_bug.cgi?id=3D4538
+
+Unit tests to confirm that..
+
+Infinite loop when parsing unknown options in the Destination Options
+header
+
+and
+
+Infinite loop when parsing a PadN option in the Destination Options
+header
+
+... have been patched
+
+This patch tests the following functions:
+Ip6IsOptionValid
+
+Cc: Saloni Kasbekar <saloni.kasbekar@intel.com>
+Cc: Zachary Clark-williams <zachary.clark-williams@intel.com>
+
+Signed-off-by: Doug Flick [MSFT] <doug.edk2@gmail.com>
+Reviewed-by: Saloni Kasbekar <saloni.kasbekar@intel.com>
+
+CVE: CVE-2023-45232, CVE-2023-45233
+
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/c9c87f=
08dd6ace36fa843424522c3558a8374cac]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ .../Ip6Dxe/GoogleTest/Ip6DxeGoogleTest.inf    |  10 +-
+ .../Ip6Dxe/GoogleTest/Ip6OptionGoogleTest.cpp | 278 ++++++++++++++++++
+ .../Ip6Dxe/GoogleTest/Ip6OptionGoogleTest.h   |  40 +++
+ 3 files changed, 324 insertions(+), 4 deletions(-)
+ create mode 100644 NetworkPkg/Ip6Dxe/GoogleTest/Ip6OptionGoogleTest.h
+
+diff --git a/NetworkPkg/Ip6Dxe/GoogleTest/Ip6DxeGoogleTest.inf b/NetworkPk=
g/Ip6Dxe/GoogleTest/Ip6DxeGoogleTest.inf
+index 6e4de0745f..ba29dbabad 100644
+--- a/NetworkPkg/Ip6Dxe/GoogleTest/Ip6DxeGoogleTest.inf
++++ b/NetworkPkg/Ip6Dxe/GoogleTest/Ip6DxeGoogleTest.inf
+@@ -1,13 +1,13 @@
+ ## @file=0D
+-# Unit test suite for the Ip6Dxe using Google Test=0D
++# Unit test suite for the Ip6DxeGoogleTest using Google Test=0D
+ #=0D
+ # Copyright (c) Microsoft Corporation.<BR>=0D
+ # SPDX-License-Identifier: BSD-2-Clause-Patent=0D
+ ##=0D
+ [Defines]=0D
+   INF_VERSION         =3D 0x00010017=0D
+-  BASE_NAME           =3D Ip6DxeUnitTest=0D
+-  FILE_GUID           =3D 4F05D17D-D3E7-4AAE-820C-576D46D2D34A=0D
++  BASE_NAME           =3D Ip6DxeGoogleTest=0D
++  FILE_GUID           =3D AE39981C-B7FE-41A8-A9C2-F41910477CA3=0D
+   VERSION_STRING      =3D 1.0=0D
+   MODULE_TYPE         =3D HOST_APPLICATION=0D
+ #=0D
+@@ -16,9 +16,11 @@
+ #  VALID_ARCHITECTURES           =3D IA32 X64 AARCH64=0D
+ #=0D
+ [Sources]=0D
++  ../Ip6Option.c=0D
++  Ip6OptionGoogleTest.h=0D
+   Ip6DxeGoogleTest.cpp=0D
+   Ip6OptionGoogleTest.cpp=0D
+-  ../Ip6Option.c=0D
++  Ip6OptionGoogleTest.h=0D
+ =0D
+ [Packages]=0D
+   MdePkg/MdePkg.dec=0D
+diff --git a/NetworkPkg/Ip6Dxe/GoogleTest/Ip6OptionGoogleTest.cpp b/Networ=
kPkg/Ip6Dxe/GoogleTest/Ip6OptionGoogleTest.cpp
+index f2cd90e1a9..29f8a4a96e 100644
+--- a/NetworkPkg/Ip6Dxe/GoogleTest/Ip6OptionGoogleTest.cpp
++++ b/NetworkPkg/Ip6Dxe/GoogleTest/Ip6OptionGoogleTest.cpp
+@@ -12,6 +12,7 @@ extern "C" {
+   #include <Library/DebugLib.h>=0D
+   #include "../Ip6Impl.h"=0D
+   #include "../Ip6Option.h"=0D
++  #include "Ip6OptionGoogleTest.h"=0D
+ }=0D
+ =0D
+ /////////////////////////////////////////////////////////////////////////=
=0D
+@@ -127,3 +128,280 @@ TEST_F (Ip6OptionValidationTest, InvalidPrefixInfoOp=
tionLengthShouldReturnFalse)
+ =0D
+   EXPECT_FALSE (Ip6IsNDOptionValid (option, optionLen));=0D
+ }=0D
++=0D
++////////////////////////////////////////////////////////////////////////=
=0D
++// Ip6IsOptionValid Tests=0D
++////////////////////////////////////////////////////////////////////////=
=0D
++=0D
++// Define a fixture for your tests if needed=0D
++class Ip6IsOptionValidTest : public ::testing::Test {=0D
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
++// Test Description=0D
++// Verify that a NULL option is Invalid=0D
++TEST_F (Ip6IsOptionValidTest, NullOptionShouldReturnTrue) {=0D
++  NET_BUF  Packet =3D { 0 };=0D
++  // we need to define enough of the packet to make the function work=0D
++  // The function being tested will pass IpSb to Ip6SendIcmpError which i=
s defined above=0D
++  IP6_SERVICE  *IpSb =3D NULL;=0D
++=0D
++  EFI_IPv6_ADDRESS  SourceAddress      =3D { 0x20, 0x01, 0x0d, 0xb8, 0x00=
, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff, 0x00, 0x00, 0x42, 0x83, 0x29 };=0D
++  EFI_IPv6_ADDRESS  DestinationAddress =3D { 0x20, 0x01, 0x0d, 0xb8, 0x00=
, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff, 0x00, 0x00, 0x42, 0x83, 0x29 };=0D
++  EFI_IP6_HEADER    Ip6Header          =3D { 0 };=0D
++=0D
++  Ip6Header.SourceAddress      =3D SourceAddress;=0D
++  Ip6Header.DestinationAddress =3D DestinationAddress;=0D
++  Packet.Ip.Ip6                =3D &Ip6Header;=0D
++=0D
++  EXPECT_FALSE (Ip6IsOptionValid (IpSb, &Packet, NULL, 0, 0));=0D
++}=0D
++=0D
++// Test Description=0D
++// Verify that an unknown option with a length of 0 and type of <unknown>=
 does not cause an infinite loop=0D
++TEST_F (Ip6IsOptionValidTest, VerifyNoInfiniteLoopOnUnknownOptionLength0)=
 {=0D
++  NET_BUF  Packet =3D { 0 };=0D
++  // we need to define enough of the packet to make the function work=0D
++  // The function being tested will pass IpSb to Ip6SendIcmpError which i=
s defined above=0D
++  UINT32  DeadCode =3D 0xDeadC0de;=0D
++  // Don't actually use this pointer, just pass it to the function, nothi=
ng will be done with it=0D
++  IP6_SERVICE  *IpSb =3D (IP6_SERVICE *)&DeadCode;=0D
++=0D
++  EFI_IPv6_ADDRESS  SourceAddress      =3D { 0x20, 0x01, 0x0d, 0xb8, 0x00=
, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff, 0x00, 0x00, 0x42, 0x83, 0x29 };=0D
++  EFI_IPv6_ADDRESS  DestinationAddress =3D { 0x20, 0x01, 0x0d, 0xb8, 0x00=
, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff, 0x00, 0x00, 0x42, 0x83, 0x29 };=0D
++  EFI_IP6_HEADER    Ip6Header          =3D { 0 };=0D
++=0D
++  Ip6Header.SourceAddress      =3D SourceAddress;=0D
++  Ip6Header.DestinationAddress =3D DestinationAddress;=0D
++  Packet.Ip.Ip6                =3D &Ip6Header;=0D
++=0D
++  IP6_OPTION_HEADER  optionHeader;=0D
++=0D
++  optionHeader.Type   =3D 23;   // Unknown Option=0D
++  optionHeader.Length =3D 0;    // This will cause an infinite loop if th=
e function is not working correctly=0D
++=0D
++  // This should be a valid option even though the length is 0=0D
++  EXPECT_TRUE (Ip6IsOptionValid (IpSb, &Packet, (UINT8 *)&optionHeader, s=
izeof (optionHeader), 0));=0D
++}=0D
++=0D
++// Test Description=0D
++// Verify that an unknown option with a length of 1 and type of <unknown>=
 does not cause an infinite loop=0D
++TEST_F (Ip6IsOptionValidTest, VerifyNoInfiniteLoopOnUnknownOptionLength1)=
 {=0D
++  NET_BUF  Packet =3D { 0 };=0D
++  // we need to define enough of the packet to make the function work=0D
++  // The function being tested will pass IpSb to Ip6SendIcmpError which i=
s defined above=0D
++  UINT32  DeadCode =3D 0xDeadC0de;=0D
++  // Don't actually use this pointer, just pass it to the function, nothi=
ng will be done with it=0D
++  IP6_SERVICE  *IpSb =3D (IP6_SERVICE *)&DeadCode;=0D
++=0D
++  EFI_IPv6_ADDRESS  SourceAddress      =3D { 0x20, 0x01, 0x0d, 0xb8, 0x00=
, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff, 0x00, 0x00, 0x42, 0x83, 0x29 };=0D
++  EFI_IPv6_ADDRESS  DestinationAddress =3D { 0x20, 0x01, 0x0d, 0xb8, 0x00=
, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff, 0x00, 0x00, 0x42, 0x83, 0x29 };=0D
++  EFI_IP6_HEADER    Ip6Header          =3D { 0 };=0D
++=0D
++  Ip6Header.SourceAddress      =3D SourceAddress;=0D
++  Ip6Header.DestinationAddress =3D DestinationAddress;=0D
++  Packet.Ip.Ip6                =3D &Ip6Header;=0D
++=0D
++  IP6_OPTION_HEADER  optionHeader;=0D
++=0D
++  optionHeader.Type   =3D 23;   // Unknown Option=0D
++  optionHeader.Length =3D 1;    // This will cause an infinite loop if th=
e function is not working correctly=0D
++=0D
++  EXPECT_TRUE (Ip6IsOptionValid (IpSb, &Packet, (UINT8 *)&optionHeader, s=
izeof (optionHeader), 0));=0D
++}=0D
++=0D
++// Test Description=0D
++// Verify that an unknown option with a length of 2 and type of <unknown>=
 does not cause an infinite loop=0D
++TEST_F (Ip6IsOptionValidTest, VerifyIpSkipUnknownOption) {=0D
++  NET_BUF  Packet =3D { 0 };=0D
++  // we need to define enough of the packet to make the function work=0D
++  // The function being tested will pass IpSb to Ip6SendIcmpError which i=
s defined above=0D
++  UINT32  DeadCode =3D 0xDeadC0de;=0D
++  // Don't actually use this pointer, just pass it to the function, nothi=
ng will be done with it=0D
++  IP6_SERVICE  *IpSb =3D (IP6_SERVICE *)&DeadCode;=0D
++=0D
++  EFI_IPv6_ADDRESS  SourceAddress      =3D { 0x20, 0x01, 0x0d, 0xb8, 0x00=
, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff, 0x00, 0x00, 0x42, 0x83, 0x29 };=0D
++  EFI_IPv6_ADDRESS  DestinationAddress =3D { 0x20, 0x01, 0x0d, 0xb8, 0x00=
, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff, 0x00, 0x00, 0x42, 0x83, 0x29 };=0D
++  EFI_IP6_HEADER    Ip6Header          =3D { 0 };=0D
++=0D
++  Ip6Header.SourceAddress      =3D SourceAddress;=0D
++  Ip6Header.DestinationAddress =3D DestinationAddress;=0D
++  Packet.Ip.Ip6                =3D &Ip6Header;=0D
++=0D
++  IP6_OPTION_HEADER  optionHeader;=0D
++=0D
++  optionHeader.Type   =3D 23;   // Unknown Option=0D
++  optionHeader.Length =3D 2;    // Valid length for an unknown option=0D
++=0D
++  EXPECT_TRUE (Ip6IsOptionValid (IpSb, &Packet, (UINT8 *)&optionHeader, s=
izeof (optionHeader), 0));=0D
++}=0D
++=0D
++// Test Description=0D
++// Verify that Ip6OptionPad1 is valid with a length of 0=0D
++TEST_F (Ip6IsOptionValidTest, VerifyIp6OptionPad1) {=0D
++  NET_BUF  Packet =3D { 0 };=0D
++  // we need to define enough of the packet to make the function work=0D
++  // The function being tested will pass IpSb to Ip6SendIcmpError which i=
s defined above=0D
++  UINT32  DeadCode =3D 0xDeadC0de;=0D
++  // Don't actually use this pointer, just pass it to the function, nothi=
ng will be done with it=0D
++  IP6_SERVICE  *IpSb =3D (IP6_SERVICE *)&DeadCode;=0D
++=0D
++  EFI_IPv6_ADDRESS  SourceAddress      =3D { 0x20, 0x01, 0x0d, 0xb8, 0x00=
, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff, 0x00, 0x00, 0x42, 0x83, 0x29 };=0D
++  EFI_IPv6_ADDRESS  DestinationAddress =3D { 0x20, 0x01, 0x0d, 0xb8, 0x00=
, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff, 0x00, 0x00, 0x42, 0x83, 0x29 };=0D
++  EFI_IP6_HEADER    Ip6Header          =3D { 0 };=0D
++=0D
++  Ip6Header.SourceAddress      =3D SourceAddress;=0D
++  Ip6Header.DestinationAddress =3D DestinationAddress;=0D
++  Packet.Ip.Ip6                =3D &Ip6Header;=0D
++=0D
++  IP6_OPTION_HEADER  optionHeader;=0D
++=0D
++  optionHeader.Type   =3D Ip6OptionPad1;=0D
++  optionHeader.Length =3D 0;=0D
++=0D
++  EXPECT_TRUE (Ip6IsOptionValid (IpSb, &Packet, (UINT8 *)&optionHeader, s=
izeof (optionHeader), 0));=0D
++}=0D
++=0D
++// Test Description=0D
++// Verify that Ip6OptionPadN doesn't overflow with various lengths=0D
++TEST_F (Ip6IsOptionValidTest, VerifyIp6OptionPadN) {=0D
++  NET_BUF  Packet =3D { 0 };=0D
++  // we need to define enough of the packet to make the function work=0D
++  // The function being tested will pass IpSb to Ip6SendIcmpError which i=
s defined above=0D
++  UINT32  DeadCode =3D 0xDeadC0de;=0D
++  // Don't actually use this pointer, just pass it to the function, nothi=
ng will be done with it=0D
++  IP6_SERVICE  *IpSb =3D (IP6_SERVICE *)&DeadCode;=0D
++=0D
++  EFI_IPv6_ADDRESS  SourceAddress      =3D { 0x20, 0x01, 0x0d, 0xb8, 0x00=
, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff, 0x00, 0x00, 0x42, 0x83, 0x29 };=0D
++  EFI_IPv6_ADDRESS  DestinationAddress =3D { 0x20, 0x01, 0x0d, 0xb8, 0x00=
, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff, 0x00, 0x00, 0x42, 0x83, 0x29 };=0D
++  EFI_IP6_HEADER    Ip6Header          =3D { 0 };=0D
++=0D
++  Ip6Header.SourceAddress      =3D SourceAddress;=0D
++  Ip6Header.DestinationAddress =3D DestinationAddress;=0D
++  Packet.Ip.Ip6                =3D &Ip6Header;=0D
++=0D
++  IP6_OPTION_HEADER  optionHeader;=0D
++=0D
++  optionHeader.Type   =3D Ip6OptionPadN;=0D
++  optionHeader.Length =3D 0xFF;=0D
++  EXPECT_TRUE (Ip6IsOptionValid (IpSb, &Packet, (UINT8 *)&optionHeader, s=
izeof (optionHeader), 0));=0D
++=0D
++  optionHeader.Length =3D 0xFE;=0D
++  EXPECT_TRUE (Ip6IsOptionValid (IpSb, &Packet, (UINT8 *)&optionHeader, s=
izeof (optionHeader), 0));=0D
++=0D
++  optionHeader.Length =3D 0xFD;=0D
++  EXPECT_TRUE (Ip6IsOptionValid (IpSb, &Packet, (UINT8 *)&optionHeader, s=
izeof (optionHeader), 0));=0D
++=0D
++  optionHeader.Length =3D 0xFC;=0D
++  EXPECT_TRUE (Ip6IsOptionValid (IpSb, &Packet, (UINT8 *)&optionHeader, s=
izeof (optionHeader), 0));=0D
++}=0D
++=0D
++// Test Description=0D
++// Verify an unknown option doesn't cause an infinite loop with various l=
engths=0D
++TEST_F (Ip6IsOptionValidTest, VerifyNoInfiniteLoopOnUnknownOptionLengthAt=
temptOverflow) {=0D
++  NET_BUF  Packet =3D { 0 };=0D
++  // we need to define enough of the packet to make the function work=0D
++  // The function being tested will pass IpSb to Ip6SendIcmpError which i=
s defined above=0D
++  UINT32  DeadCode =3D 0xDeadC0de;=0D
++  // Don't actually use this pointer, just pass it to the function, nothi=
ng will be done with it=0D
++  IP6_SERVICE  *IpSb =3D (IP6_SERVICE *)&DeadCode;=0D
++=0D
++  EFI_IPv6_ADDRESS  SourceAddress      =3D { 0x20, 0x01, 0x0d, 0xb8, 0x00=
, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff, 0x00, 0x00, 0x42, 0x83, 0x29 };=0D
++  EFI_IPv6_ADDRESS  DestinationAddress =3D { 0x20, 0x01, 0x0d, 0xb8, 0x00=
, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff, 0x00, 0x00, 0x42, 0x83, 0x29 };=0D
++  EFI_IP6_HEADER    Ip6Header          =3D { 0 };=0D
++=0D
++  Ip6Header.SourceAddress      =3D SourceAddress;=0D
++  Ip6Header.DestinationAddress =3D DestinationAddress;=0D
++  Packet.Ip.Ip6                =3D &Ip6Header;=0D
++=0D
++  IP6_OPTION_HEADER  optionHeader;=0D
++=0D
++  optionHeader.Type   =3D 23;   // Unknown Option=0D
++  optionHeader.Length =3D 0xFF;=0D
++  EXPECT_TRUE (Ip6IsOptionValid (IpSb, &Packet, (UINT8 *)&optionHeader, s=
izeof (optionHeader), 0));=0D
++=0D
++  optionHeader.Length =3D 0xFE;=0D
++  EXPECT_TRUE (Ip6IsOptionValid (IpSb, &Packet, (UINT8 *)&optionHeader, s=
izeof (optionHeader), 0));=0D
++=0D
++  optionHeader.Length =3D 0xFD;=0D
++  EXPECT_TRUE (Ip6IsOptionValid (IpSb, &Packet, (UINT8 *)&optionHeader, s=
izeof (optionHeader), 0));=0D
++=0D
++  optionHeader.Length =3D 0xFC;=0D
++  EXPECT_TRUE (Ip6IsOptionValid (IpSb, &Packet, (UINT8 *)&optionHeader, s=
izeof (optionHeader), 0));=0D
++}=0D
++=0D
++// Test Description=0D
++// Verify that the function supports multiple options=0D
++TEST_F (Ip6IsOptionValidTest, MultiOptionSupport) {=0D
++  UINT16   HdrLen;=0D
++  NET_BUF  Packet =3D { 0 };=0D
++  // we need to define enough of the packet to make the function work=0D
++  // The function being tested will pass IpSb to Ip6SendIcmpError which i=
s defined above=0D
++  UINT32  DeadCode =3D 0xDeadC0de;=0D
++  // Don't actually use this pointer, just pass it to the function, nothi=
ng will be done with it=0D
++  IP6_SERVICE  *IpSb =3D (IP6_SERVICE *)&DeadCode;=0D
++=0D
++  EFI_IPv6_ADDRESS  SourceAddress      =3D { 0x20, 0x01, 0x0d, 0xb8, 0x00=
, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff, 0x00, 0x00, 0x42, 0x83, 0x29 };=0D
++  EFI_IPv6_ADDRESS  DestinationAddress =3D { 0x20, 0x01, 0x0d, 0xb8, 0x00=
, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff, 0x00, 0x00, 0x42, 0x83, 0x29 };=0D
++  EFI_IP6_HEADER    Ip6Header          =3D { 0 };=0D
++=0D
++  Ip6Header.SourceAddress      =3D SourceAddress;=0D
++  Ip6Header.DestinationAddress =3D DestinationAddress;=0D
++  Packet.Ip.Ip6                =3D &Ip6Header;=0D
++=0D
++  UINT8              ExtHdr[1024] =3D { 0 };=0D
++  UINT8              *Cursor      =3D ExtHdr;=0D
++  IP6_OPTION_HEADER  *Option      =3D (IP6_OPTION_HEADER *)ExtHdr;=0D
++=0D
++  // Let's start chaining options=0D
++=0D
++  Option->Type   =3D 23;   // Unknown Option=0D
++  Option->Length =3D 0xFC;=0D
++=0D
++  Cursor +=3D sizeof (IP6_OPTION_HEADER) + 0xFC;=0D
++=0D
++  Option       =3D (IP6_OPTION_HEADER *)Cursor;=0D
++  Option->Type =3D Ip6OptionPad1;=0D
++=0D
++  Cursor +=3D sizeof (1);=0D
++=0D
++  // Type and length aren't processed, instead it just moves the pointer =
forward by 4 bytes=0D
++  Option         =3D (IP6_OPTION_HEADER *)Cursor;=0D
++  Option->Type   =3D Ip6OptionRouterAlert;=0D
++  Option->Length =3D 4;=0D
++=0D
++  Cursor +=3D sizeof (IP6_OPTION_HEADER) + 4;=0D
++=0D
++  Option         =3D (IP6_OPTION_HEADER *)Cursor;=0D
++  Option->Type   =3D Ip6OptionPadN;=0D
++  Option->Length =3D 0xFC;=0D
++=0D
++  Cursor +=3D sizeof (IP6_OPTION_HEADER) + 0xFC;=0D
++=0D
++  Option         =3D (IP6_OPTION_HEADER *)Cursor;=0D
++  Option->Type   =3D Ip6OptionRouterAlert;=0D
++  Option->Length =3D 4;=0D
++=0D
++  Cursor +=3D sizeof (IP6_OPTION_HEADER) + 4;=0D
++=0D
++  // Total 524=0D
++=0D
++  HdrLen =3D (UINT16)(Cursor - ExtHdr);=0D
++=0D
++  EXPECT_TRUE (Ip6IsOptionValid (IpSb, &Packet, ExtHdr, HdrLen, 0));=0D
++}=0D
+diff --git a/NetworkPkg/Ip6Dxe/GoogleTest/Ip6OptionGoogleTest.h b/NetworkP=
kg/Ip6Dxe/GoogleTest/Ip6OptionGoogleTest.h
+new file mode 100644
+index 0000000000..0509b6ae30
+--- /dev/null
++++ b/NetworkPkg/Ip6Dxe/GoogleTest/Ip6OptionGoogleTest.h
+@@ -0,0 +1,40 @@
++/** @file=0D
++  Exposes the functions needed to test the Ip6Option module.=0D
++=0D
++  Copyright (c) Microsoft Corporation=0D
++  SPDX-License-Identifier: BSD-2-Clause-Patent=0D
++**/=0D
++=0D
++#ifndef IP6_OPTION_HEADER_GOOGLE_TEST_H_=0D
++#define IP6_OPTION_HEADER_GOOGLE_TEST_H_=0D
++=0D
++#include <Uefi.h>=0D
++#include "../Ip6Impl.h"=0D
++=0D
++/**=0D
++  Validate the IP6 option format for both the packets we received=0D
++  and that we will transmit. It will compute the ICMPv6 error message fie=
lds=0D
++  if the option is malformatted.=0D
++=0D
++  @param[in]  IpSb              The IP6 service data.=0D
++  @param[in]  Packet            The to be validated packet.=0D
++  @param[in]  Option            The first byte of the option.=0D
++  @param[in]  OptionLen         The length of the whole option.=0D
++  @param[in]  Pointer           Identifies the octet offset within=0D
++                                the invoking packet where the error was d=
etected.=0D
++=0D
++=0D
++  @retval TRUE     The option is properly formatted.=0D
++  @retval FALSE    The option is malformatted.=0D
++=0D
++**/=0D
++BOOLEAN=0D
++Ip6IsOptionValid (=0D
++  IN IP6_SERVICE  *IpSb,=0D
++  IN NET_BUF      *Packet,=0D
++  IN UINT8        *Option,=0D
++  IN UINT16       OptionLen,=0D
++  IN UINT32       Pointer=0D
++  );=0D
++=0D
++#endif // __IP6_OPTION_HEADER_GOOGLE_TEST_H__=0D
+--=20
+2.40.0
+
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ov=
mf_git.bb
index e46b3ddebe..fc87cdf441 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -37,6 +37,8 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=
=3Dmaster;protocol=3Dhttps \
            file://CVE-2023-45230-0002.patch \
            file://CVE-2023-45231-0001.patch \
            file://CVE-2023-45231-0002.patch \
+           file://CVE-2023-45232-CVE-2023-45233-0001.patch \
+           file://CVE-2023-45232-CVE-2023-45233-0002.patch \
            "
=20
 PV =3D "edk2-stable202202"
--=20
2.40.0


