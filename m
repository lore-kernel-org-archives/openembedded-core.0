Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E362CE7A81
	for <webhook@archiver.kernel.org>; Thu,  5 Sep 2024 18:15:59 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.128])
 by mx.groups.io with SMTP id smtpd.web11.16770.1725560156617665000
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Sep 2024 11:15:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@witekio.com header.s=selector2 header.b=aSyzyf48;
 spf=pass (domain: witekio.com, ip: 40.107.22.128, mailfrom: hsimeliere@witekio.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P0X/CoDhVic8tme98qMVljDwPdwVY28No3VExA6eodqEIP39+D6kJwzllHY9hCUjg6xda9ikaNAGaY95In0v/jWqrsUrNpsy4ryeAjJGAV58UHrsXfRAYmGxdBLbZWuEQHeuD23pyNhmkmz5n/jBsn6l6J64u1SiGcAh+GTD29yaeF0HVM11NblsiZOUgnOYuMl7WU/6Y1xTkCi8mPCKKtCVdM4CAEeVPtQB+XdPJ3D4C6mTl7SfeN644IDr8R3wpLGcWY3aR9WnaMi/FPQ/Pd5xB272S2y92j20+mwrUJzvk5ei/kvgr/2nCpSzJAF24liPp8ISPd2VcdHfJd4HVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2xNK4OeE0AsW88Cyqnx0XmgCU4yg5EbncAJLWJowEFk=;
 b=mX+IJETggNeX/ET2l06azFaHKoDnRy0kwRSCNxpMKwJYCvBZwxC49dflTufEonz//fYYpIDofMKeoeHZr/vXVEqWkYKs1bKMjk4yLOUJ7CaPyEMdr+/YCkzMwKuKIf8lubOa8sFI+hGc1iUdJKCyDR9nwNYPcydaY0rcNHSRPyIOrhROFt5S+4CM5GJWX2a8UUxGy7/w+4UVkpyxBVPTQQKNq94chgRH5r5zu831i8k7I13QsEV0bhbEH/CuTDtpeGhyHA4TO/cfirLE3+njx9+K1RFGduSmnqBXZfJN1w/rhuwnGX+hxCQWlcTskxH3vOafkkpgvqTKY+a3JzrCrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2xNK4OeE0AsW88Cyqnx0XmgCU4yg5EbncAJLWJowEFk=;
 b=aSyzyf48EXka7rjGjvDTF9al2bOklVu6FqIkyEWv3Pyg3/8J1CSIkDvyaE0ijBqurLkty3pyBDAiEIbrWtSrAYRPhdwSoSwx2ZfqTrO9jGO1PVGKSrSx1o4rwXl9X1JI5xIvlaOZ/ufE5Xtw+6jhenkF4PbFqa5BfwVzvCvxRByLffR3JYFtT9137NKDIcCy3+LcrYAN1X4pfbgiE0v1JqN1FpbmXRLPPC0eBqHLZIlUjxW1f1thmGioC37xJq34wPkmStFh5jNZpw/0o20UkPrynhR8Jqbh2u9ZgcgS4TpSAuECZDfOSZ3XPneVAf9CNvGhuXXEwUm+jxlPA+GY6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from PR3P192MB0714.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:48::10)
 by PAWP192MB2412.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:46d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Thu, 5 Sep
 2024 18:15:46 +0000
Received: from PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 ([fe80::345f:a9e9:d884:3091]) by PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 ([fe80::345f:a9e9:d884:3091%5]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 18:15:45 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
CC: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
Subject: [kirkstone][PATCH] python3: CVE-2024-6232 CVE-2024-7592 fixes
Date: Thu,  5 Sep 2024 20:14:34 +0200
Message-ID: <20240905181434.6454-1-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PAZP264CA0074.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1fa::9) To PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:48::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR3P192MB0714:EE_|PAWP192MB2412:EE_
X-MS-Office365-Filtering-Correlation-Id: fba4ade2-ddb2-4d45-1362-08dccdd6c24f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7s11bKURheHkA7AfFzT1iYTqTT/2M8SrERnZCu4gEdVmTdu3acxQVVU36QPY?=
 =?us-ascii?Q?CFrzytqK9xzWwXXRE3DfZEdUlN1/fc1KBB3Blg30yTzsY9D/bjDJ+7v4BD19?=
 =?us-ascii?Q?ocgOmu6+5971OzPd/sDDDjpkXsR2ztS9TxfcEm+9cbVgQUjrQeX4NKi19cRw?=
 =?us-ascii?Q?JCpcyvG0KmzRq+7rBOeFdztut3HsKVVPjrZce4S1t0SCJwveGgQY7vWAR3i5?=
 =?us-ascii?Q?dZJC+8+ckhMS0j3y+VwQDGyq171WH9iF0ycRDfZRHWReWll+JvGSZNMotSSo?=
 =?us-ascii?Q?fae/lZqCpSwxA5ZTyFy0RFk9PCnGUsJeR3RzHFQGlPFMYTyGSzxWL+SZtkLf?=
 =?us-ascii?Q?/B66F3neBC8TLfm88h05K08gpE9xgqV1s9Cw7hwOpr0B/d5fdKHlMyM4ymZk?=
 =?us-ascii?Q?A++ENPJvbF9SBz+U0AG6ZL7jAI+MdsI59hrzl+lY27Qw01XhYj8xmJ5mLq6F?=
 =?us-ascii?Q?R+Ye5Y8Hvf0YFaXw2UENlKnnU5QNZZ4Ea4QxUve7OmKOBBj/wKMRqBE9zEGI?=
 =?us-ascii?Q?nRlBrDc5t0tYzscRuL1DpyJR682+O/1E9wLK9Tip5va/xy8jinfh9T+7BBnH?=
 =?us-ascii?Q?OlPLKPRJIdS2OH5mlY17wo4FcWdIPe3fCzDEFpLXVNDhrE/NKvXo+nqZf1+8?=
 =?us-ascii?Q?9yaFX137tJ4AI91poa049+Q34EIooVT+MxkJR7PtLhs22WiKOXHOnoFaJfXl?=
 =?us-ascii?Q?OH/llDj3aNLYnTZU7Jb24tsBcdwxPtBtuawMCRgIaHp+9CkgeZNH04OXROaE?=
 =?us-ascii?Q?bmti5wWhamTKiCtXqvflBy6EZ1aMLlYNvHAu/w7KTTj9kusl+yp0TP1OsjYM?=
 =?us-ascii?Q?cfutI3rp7gCQTlbga8NwaIwiAbfB4RvOVAfevYiH+0c7gmoZZboGI+M6F0mk?=
 =?us-ascii?Q?M49OJi73C9SS3qQ3sH9c6U1zZqcdBgIUN2QmH1hsaDcPDBgjVI0tT32VD71e?=
 =?us-ascii?Q?F+eGAA/v8xA4N0k/VYl9l1TPc/3kA948c5uZo69g6lZpv89L60CWF8/i+gqL?=
 =?us-ascii?Q?o6zKw/PIbCnLRaM1QxAfkwJ22FbKUzu7b18QZ0OMQG4XzElNoex6ec9riPow?=
 =?us-ascii?Q?B1nPTFFdDTSBVMbpLoAcwSMwkq78TngtzKOEsSeRFhmllTcuqaM4S55C6UzD?=
 =?us-ascii?Q?nFruK05ppdI+lcFzDvxkJnAXjghJr8L9VuKmoUziES/UDFStj6T0ecIRvry6?=
 =?us-ascii?Q?uEpnFZnVrtmzb6pWkWLHwAT6nNCmwUJaikHNSNl8tCjKREUcE+Q840+TAitr?=
 =?us-ascii?Q?M2QLku2tT8BHVfJYZ1Ng+2Vqp2Uut6KOgtExiWDDLFL8eeGpJ3MmljPK3UAG?=
 =?us-ascii?Q?8QRxyEkfLiShkSXc6N22AV8U+lWIi5SyH6jdpNTSjIx+JYTRqxIWboQ68Tok?=
 =?us-ascii?Q?U9Fx82w=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3P192MB0714.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JUBFXBmtVnYNIqiliI3JgSrqHnwNPyvQLBToIazCxEjplde73xTqVPqF/4M1?=
 =?us-ascii?Q?QsBDCR9rxZ3Hf71KGQiHJQb1LhHD7QwlUBffsCSpSg9XoWaR/wQWMh8ktnDI?=
 =?us-ascii?Q?igN/gCt6FKLZ/6uSFsb2IgIFAlp+B+thLDcVvSpttkMPAr6yWn/t51/DUG9f?=
 =?us-ascii?Q?da7bOewddpYYRQh9oAVInl/O2tlr7M4t1zR89neMQKuCy5PKATSujlRr/VaM?=
 =?us-ascii?Q?HU3bS135basd3UZTXvtpanylENG1GdgueVEk9f8slJ2VoJBsWRoUuxB2/ykK?=
 =?us-ascii?Q?Q1uWQ/Uv2TLHpJvAuhQmJir/CZENM2N9oxITx1rlglomBFbpvXUOaizg3Sqf?=
 =?us-ascii?Q?sk3DnrssSUzGKstLJTxR/B+9FF+9AQ/7Ep95lhIEbZYuOemAM6nGFhg9SrAv?=
 =?us-ascii?Q?bnISjIQY4Ns2FGdKb85oLc+G4AZO5B1zCRvB2WSUGIqRa96JEvv5RS/XbDcQ?=
 =?us-ascii?Q?k0kCnzhzqA61Jx5h9zryybzdPDJR09JBRAS96XfMYPyvMhuLXzgUpcsPjQgE?=
 =?us-ascii?Q?cYy2s9AruU3Q0hoxJc6JoIVfnhnsQicaIi8JCR8Z0uQEQlDXqwKTnNrxW/rJ?=
 =?us-ascii?Q?cQu9gA0yyv/BwVqk2MTiQPNvc984vGBsMmLZZji3JoqzCmbWI0h525SCWE1z?=
 =?us-ascii?Q?ypVaNxkWQsWLrWqoHz6YOFV36BAXa9EBrGfXMrfv3mm5SWrSMDJDuFyqKkur?=
 =?us-ascii?Q?ZDo3EuGbCMsFtncus7XufGAOCGfqrilbji427p1jJ53SdB2OVHBGk3UuV2+y?=
 =?us-ascii?Q?2QNzX+9VOf3k6OubQneCyTDEMXxyMDVFngHPvpgb0SB5aSzgs3xfFqo1EE3M?=
 =?us-ascii?Q?6OGwa80EDRd5sAPkmUm9kvFlpvSit8hbW8wGv4fxKgHnTFhxBahQ6kP6n8An?=
 =?us-ascii?Q?ZfeBx2dTBMjBgkubeFjxEsxTNTUuNYeXFZ3ld5DdLa8KIQaaek6jWibm/Oxq?=
 =?us-ascii?Q?aCAy7N5zBo/Lp6g53GJOAGkUxrnfR/1+46g2V5ScGLglo+G4Roga2s3etMbB?=
 =?us-ascii?Q?j+euvX+Q6r+ezGe5RJWCnjH01YlIcseFJ9eCcQ8oD469EVbwlQUrJuvuC0RE?=
 =?us-ascii?Q?DhwnjXYas0rZH5iDohGX/dSp98sZDwDfcFffHzsut/JsOu62U6rca/LUJ4jk?=
 =?us-ascii?Q?h8bPPgSWvRDjaJI2IIB/EdCyUA9z0e0420iEZBIdR72NbjMxVoo8bSaLPTZa?=
 =?us-ascii?Q?hBCjx/o/kJMGdUzJqcE7tLK9z0b6z+mbiZ+pRr6mX+44Ka223UuE4QZN6vjK?=
 =?us-ascii?Q?FA7O83Ld0kFKSh6CilQdKfiVixcx5bkLzNW7WUErin/GVsFcOqzkhl3F+i9w?=
 =?us-ascii?Q?sGhWJPDo/2E12Y3rVRstvm4JVeG2sjJsVKtQlVKBlecr2OPXLRS9ugvqOeUN?=
 =?us-ascii?Q?CnMqOM89hUoxdnpn22C5RGo1f+l7uaBrAxkaR5AB6JyJH1JQjz4UnByRxV3w?=
 =?us-ascii?Q?1EDsLHTMXZHJ9iGPyBLNks3bP+NCi6KBpylLdsTuoeKkX9CoK1i4aJi/ZDTW?=
 =?us-ascii?Q?bR7lHkTkRmsN26FrAyBGZRTFX3kre9F5xdsuMarW35yYK7mD89yLxXGRHkfQ?=
 =?us-ascii?Q?ZUzqqg5CdZMm2suqNJh3juHASRW/3TWAVIv3uUTntHzDiOyaFhxcO+UDnf4n?=
 =?us-ascii?Q?5Q=3D=3D?=
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fba4ade2-ddb2-4d45-1362-08dccdd6c24f
X-MS-Exchange-CrossTenant-AuthSource: PR3P192MB0714.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 18:15:45.7329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HgtaxvXVKuR/KsqLC5934W882LX2s8Q2C6hPfXqeQcM3/H0hN15n3CL16bwz8A/ucx7N6URZpahPEq/Dwjvjbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP192MB2412
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Sep 2024 18:15:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204242

From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>

Upstream-Status: Backport from https://github.com/python/cpython/commit/b2f=
11ca7667e4d57c71c1c88b255115f16042d9a
Upstream-Status: Backport from https://github.com/python/cpython/commit/743=
acbe872485dc18df4d8ab2dc7895187f062c4

Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
---
 .../python/python3/CVE-2024-6232.patch        | 251 ++++++++++++++++++
 .../python/python3/CVE-2024-7592.patch        | 140 ++++++++++
 .../python/python3_3.10.14.bb                 |   2 +
 3 files changed, 393 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2024-6232.patc=
h
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2024-7592.patc=
h

diff --git a/meta/recipes-devtools/python/python3/CVE-2024-6232.patch b/met=
a/recipes-devtools/python/python3/CVE-2024-6232.patch
new file mode 100644
index 0000000000..874cbfe40c
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2024-6232.patch
@@ -0,0 +1,251 @@
+From 3a22dc1079be5a75750d24dc6992956e7b84b5a0 Mon Sep 17 00:00:00 2001
+From: Seth Michael Larson <seth@python.org>
+Date: Tue, 3 Sep 2024 10:07:53 -0500
+Subject: [PATCH 2/2] [3.10] gh-121285: Remove backtracking when parsing
+ tarfile headers (GH-121286) (#123640)
+
+* Remove backtracking when parsing tarfile headers
+* Rewrite PAX header parsing to be stricter
+* Optimize parsing of GNU extended sparse headers v0.0
+
+(cherry picked from commit 34ddb64d088dd7ccc321f6103d23153256caa5d4)
+
+Upstream-Status: Backport from https://github.com/python/cpython/commit/74=
3acbe872485dc18df4d8ab2dc7895187f062c4
+CVE: CVE-2024-6232
+
+Co-authored-by: Kirill Podoprigora <kirill.bast9@mail.ru>
+Co-authored-by: Gregory P. Smith <greg@krypto.org>
+Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
+---
+ Lib/tarfile.py                                | 105 +++++++++++-------
+ Lib/test/test_tarfile.py                      |  42 +++++++
+ ...-07-02-13-39-20.gh-issue-121285.hrl-yI.rst |   2 +
+ 3 files changed, 111 insertions(+), 38 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2024-07-02-13-39-20.gh-issue=
-121285.hrl-yI.rst
+
+diff --git a/Lib/tarfile.py b/Lib/tarfile.py
+index 495349f08f9..3ab6811d633 100755
+--- a/Lib/tarfile.py
++++ b/Lib/tarfile.py
+@@ -841,6 +841,9 @@ def data_filter(member, dest_path):
+ # Sentinel for replace() defaults, meaning "don't change the attribute"
+ _KEEP =3D object()
+=20
++# Header length is digits followed by a space.
++_header_length_prefix_re =3D re.compile(br"([0-9]{1,20}) ")
++
+ class TarInfo(object):
+     """Informational class which holds the details about an
+        archive member given by a tar header block.
+@@ -1410,41 +1413,59 @@ def _proc_pax(self, tarfile):
+         else:
+             pax_headers =3D tarfile.pax_headers.copy()
+=20
+-        # Check if the pax header contains a hdrcharset field. This tells=
 us
+-        # the encoding of the path, linkpath, uname and gname fields. Nor=
mally,
+-        # these fields are UTF-8 encoded but since POSIX.1-2008 tar
+-        # implementations are allowed to store them as raw binary strings=
 if
+-        # the translation to UTF-8 fails.
+-        match =3D re.search(br"\d+ hdrcharset=3D([^\n]+)\n", buf)
+-        if match is not None:
+-            pax_headers["hdrcharset"] =3D match.group(1).decode("utf-8")
+-
+-        # For the time being, we don't care about anything other than "BI=
NARY".
+-        # The only other value that is currently allowed by the standard =
is
+-        # "ISO-IR 10646 2000 UTF-8" in other words UTF-8.
+-        hdrcharset =3D pax_headers.get("hdrcharset")
+-        if hdrcharset =3D=3D "BINARY":
+-            encoding =3D tarfile.encoding
+-        else:
+-            encoding =3D "utf-8"
+-
+         # Parse pax header information. A record looks like that:
+         # "%d %s=3D%s\n" % (length, keyword, value). length is the size
+         # of the complete record including the length field itself and
+-        # the newline. keyword and value are both UTF-8 encoded strings.
+-        regex =3D re.compile(br"(\d+) ([^=3D]+)=3D")
++        # the newline.
+         pos =3D 0
+-        while True:
+-            match =3D regex.match(buf, pos)
+-            if not match:
+-                break
++        encoding =3D None
++        raw_headers =3D []
++        while len(buf) > pos and buf[pos] !=3D 0x00:
++            if not (match :=3D _header_length_prefix_re.match(buf, pos)):
++                raise InvalidHeaderError("invalid header")
++            try:
++                length =3D int(match.group(1))
++            except ValueError:
++                raise InvalidHeaderError("invalid header")
++            # Headers must be at least 5 bytes, shortest being '5 x=3D\n'=
.
++            # Value is allowed to be empty.
++            if length < 5:
++                raise InvalidHeaderError("invalid header")
++            if pos + length > len(buf):
++                raise InvalidHeaderError("invalid header")
+=20
+-            length, keyword =3D match.groups()
+-            length =3D int(length)
+-            if length =3D=3D 0:
++            header_value_end_offset =3D match.start(1) + length - 1  # La=
st byte of the header
++            keyword_and_value =3D buf[match.end(1) + 1:header_value_end_o=
ffset]
++            raw_keyword, equals, raw_value =3D keyword_and_value.partitio=
n(b"=3D")
++
++            # Check the framing of the header. The last character must be=
 '\n' (0x0A)
++            if not raw_keyword or equals !=3D b"=3D" or buf[header_value_=
end_offset] !=3D 0x0A:
+                 raise InvalidHeaderError("invalid header")
+-            value =3D buf[match.end(2) + 1:match.start(1) + length - 1]
++            raw_headers.append((length, raw_keyword, raw_value))
++
++            # Check if the pax header contains a hdrcharset field. This t=
ells us
++            # the encoding of the path, linkpath, uname and gname fields.=
 Normally,
++            # these fields are UTF-8 encoded but since POSIX.1-2008 tar
++            # implementations are allowed to store them as raw binary str=
ings if
++            # the translation to UTF-8 fails. For the time being, we don'=
t care about
++            # anything other than "BINARY". The only other value that is =
currently
++            # allowed by the standard is "ISO-IR 10646 2000 UTF-8" in oth=
er words UTF-8.
++            # Note that we only follow the initial 'hdrcharset' setting t=
o preserve
++            # the initial behavior of the 'tarfile' module.
++            if raw_keyword =3D=3D b"hdrcharset" and encoding is None:
++                if raw_value =3D=3D b"BINARY":
++                    encoding =3D tarfile.encoding
++                else:  # This branch ensures only the first 'hdrcharset' =
header is used.
++                    encoding =3D "utf-8"
++
++            pos +=3D length
+=20
++        # If no explicit hdrcharset is set, we use UTF-8 as a default.
++        if encoding is None:
++            encoding =3D "utf-8"
++
++        # After parsing the raw headers we can decode them to text.
++        for length, raw_keyword, raw_value in raw_headers:
+             # Normally, we could just use "utf-8" as the encoding and "st=
rict"
+             # as the error handler, but we better not take the risk. For
+             # example, GNU tar <=3D 1.23 is known to store filenames it c=
annot
+@@ -1452,17 +1473,16 @@ def _proc_pax(self, tarfile):
+             # hdrcharset=3DBINARY header).
+             # We first try the strict standard encoding, and if that fail=
s we
+             # fall back on the user's encoding and error handler.
+-            keyword =3D self._decode_pax_field(keyword, "utf-8", "utf-8",
++            keyword =3D self._decode_pax_field(raw_keyword, "utf-8", "utf=
-8",
+                     tarfile.errors)
+             if keyword in PAX_NAME_FIELDS:
+-                value =3D self._decode_pax_field(value, encoding, tarfile=
.encoding,
++                value =3D self._decode_pax_field(raw_value, encoding, tar=
file.encoding,
+                         tarfile.errors)
+             else:
+-                value =3D self._decode_pax_field(value, "utf-8", "utf-8",
++                value =3D self._decode_pax_field(raw_value, "utf-8", "utf=
-8",
+                         tarfile.errors)
+=20
+             pax_headers[keyword] =3D value
+-            pos +=3D length
+=20
+         # Fetch the next header.
+         try:
+@@ -1477,7 +1497,7 @@ def _proc_pax(self, tarfile):
+=20
+         elif "GNU.sparse.size" in pax_headers:
+             # GNU extended sparse format version 0.0.
+-            self._proc_gnusparse_00(next, pax_headers, buf)
++            self._proc_gnusparse_00(next, raw_headers)
+=20
+         elif pax_headers.get("GNU.sparse.major") =3D=3D "1" and pax_heade=
rs.get("GNU.sparse.minor") =3D=3D "0":
+             # GNU extended sparse format version 1.0.
+@@ -1499,15 +1519,24 @@ def _proc_pax(self, tarfile):
+=20
+         return next
+=20
+-    def _proc_gnusparse_00(self, next, pax_headers, buf):
++    def _proc_gnusparse_00(self, next, raw_headers):
+         """Process a GNU tar extended sparse header, version 0.0.
+         """
+         offsets =3D []
+-        for match in re.finditer(br"\d+ GNU.sparse.offset=3D(\d+)\n", buf=
):
+-            offsets.append(int(match.group(1)))
+         numbytes =3D []
+-        for match in re.finditer(br"\d+ GNU.sparse.numbytes=3D(\d+)\n", b=
uf):
+-            numbytes.append(int(match.group(1)))
++        for _, keyword, value in raw_headers:
++            if keyword =3D=3D b"GNU.sparse.offset":
++                try:
++                    offsets.append(int(value.decode()))
++                except ValueError:
++                    raise InvalidHeaderError("invalid header")
++
++            elif keyword =3D=3D b"GNU.sparse.numbytes":
++                try:
++                    numbytes.append(int(value.decode()))
++                except ValueError:
++                    raise InvalidHeaderError("invalid header")
++
+         next.sparse =3D list(zip(offsets, numbytes))
+=20
+     def _proc_gnusparse_01(self, next, pax_headers):
+diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
+index cfc13bccb20..007c3e94acb 100644
+--- a/Lib/test/test_tarfile.py
++++ b/Lib/test/test_tarfile.py
+@@ -1139,6 +1139,48 @@ def test_pax_number_fields(self):
+         finally:
+             tar.close()
+=20
++    def test_pax_header_bad_formats(self):
++        # The fields from the pax header have priority over the
++        # TarInfo.
++        pax_header_replacements =3D (
++            b" foo=3Dbar\n",
++            b"0 \n",
++            b"1 \n",
++            b"2 \n",
++            b"3 =3D\n",
++            b"4 =3Da\n",
++            b"1000000 foo=3Dbar\n",
++            b"0 foo=3Dbar\n",
++            b"-12 foo=3Dbar\n",
++            b"000000000000000000000000036 foo=3Dbar\n",
++        )
++        pax_headers =3D {"foo": "bar"}
++
++        for replacement in pax_header_replacements:
++            with self.subTest(header=3Dreplacement):
++                tar =3D tarfile.open(tmpname, "w", format=3Dtarfile.PAX_F=
ORMAT,
++                                   encoding=3D"iso8859-1")
++                try:
++                    t =3D tarfile.TarInfo()
++                    t.name =3D "pax"  # non-ASCII
++                    t.uid =3D 1
++                    t.pax_headers =3D pax_headers
++                    tar.addfile(t)
++                finally:
++                    tar.close()
++
++                with open(tmpname, "rb") as f:
++                    data =3D f.read()
++                    self.assertIn(b"11 foo=3Dbar\n", data)
++                    data =3D data.replace(b"11 foo=3Dbar\n", replacement)
++
++                with open(tmpname, "wb") as f:
++                    f.truncate()
++                    f.write(data)
++
++                with self.assertRaisesRegex(tarfile.ReadError, r"method t=
ar: ReadError\('invalid header'\)"):
++                    tarfile.open(tmpname, encoding=3D"iso8859-1")
++
+=20
+ class WriteTestBase(TarTest):
+     # Put all write tests in here that are supposed to be tested
+diff --git a/Misc/NEWS.d/next/Security/2024-07-02-13-39-20.gh-issue-121285=
.hrl-yI.rst b/Misc/NEWS.d/next/Security/2024-07-02-13-39-20.gh-issue-121285=
.hrl-yI.rst
+new file mode 100644
+index 00000000000..81f918bfe2b
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2024-07-02-13-39-20.gh-issue-121285.hrl-yI=
.rst
+@@ -0,0 +1,2 @@
++Remove backtracking from tarfile header parsing for ``hdrcharset``, PAX, =
and
++GNU sparse headers.
+--=20
+2.46.0
+
diff --git a/meta/recipes-devtools/python/python3/CVE-2024-7592.patch b/met=
a/recipes-devtools/python/python3/CVE-2024-7592.patch
new file mode 100644
index 0000000000..7303a41e20
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2024-7592.patch
@@ -0,0 +1,140 @@
+From 3c15b8437f57fe1027171b34af88bf791cf1868c Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Wed, 4 Sep 2024 17:50:36 +0200
+Subject: [PATCH 1/2] [3.10] gh-123067: Fix quadratic complexity in parsing
+ "-quoted cookie values with backslashes (GH-123075) (#123106)
+
+This fixes CVE-2024-7592.
+(cherry picked from commit 44e458357fca05ca0ae2658d62c8c595b048b5ef)
+
+Upstream-Status: Backport from https://github.com/python/cpython/commit/b2=
f11ca7667e4d57c71c1c88b255115f16042d9a
+CVE: CVE-2024-7592
+
+Co-authored-by: Serhiy Storchaka <storchaka@gmail.com>
+Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
+---
+ Lib/http/cookies.py                           | 34 ++++-------------
+ Lib/test/test_http_cookies.py                 | 38 +++++++++++++++++++
+ ...-08-16-19-13-21.gh-issue-123067.Nx9O4R.rst |  1 +
+ 3 files changed, 47 insertions(+), 26 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Library/2024-08-16-19-13-21.gh-issue-=
123067.Nx9O4R.rst
+
+diff --git a/Lib/http/cookies.py b/Lib/http/cookies.py
+index 35ac2dc6ae2..2c1f021d0ab 100644
+--- a/Lib/http/cookies.py
++++ b/Lib/http/cookies.py
+@@ -184,8 +184,13 @@ def _quote(str):
+         return '"' + str.translate(_Translator) + '"'
+=20
+=20
+-_OctalPatt =3D re.compile(r"\\[0-3][0-7][0-7]")
+-_QuotePatt =3D re.compile(r"[\\].")
++_unquote_sub =3D re.compile(r'\\(?:([0-3][0-7][0-7])|(.))').sub
++
++def _unquote_replace(m):
++    if m[1]:
++        return chr(int(m[1], 8))
++    else:
++        return m[2]
+=20
+ def _unquote(str):
+     # If there aren't any doublequotes,
+@@ -205,30 +210,7 @@ def _unquote(str):
+     #    \012 --> \n
+     #    \"   --> "
+     #
+-    i =3D 0
+-    n =3D len(str)
+-    res =3D []
+-    while 0 <=3D i < n:
+-        o_match =3D _OctalPatt.search(str, i)
+-        q_match =3D _QuotePatt.search(str, i)
+-        if not o_match and not q_match:              # Neither matched
+-            res.append(str[i:])
+-            break
+-        # else:
+-        j =3D k =3D -1
+-        if o_match:
+-            j =3D o_match.start(0)
+-        if q_match:
+-            k =3D q_match.start(0)
+-        if q_match and (not o_match or k < j):     # QuotePatt matched
+-            res.append(str[i:k])
+-            res.append(str[k+1])
+-            i =3D k + 2
+-        else:                                      # OctalPatt matched
+-            res.append(str[i:j])
+-            res.append(chr(int(str[j+1:j+4], 8)))
+-            i =3D j + 4
+-    return _nulljoin(res)
++    return _unquote_sub(_unquote_replace, str)
+=20
+ # The _getdate() routine is used to set the expiration time in the cookie=
's HTTP
+ # header.  By default, _getdate() returns the current time in the appropr=
iate
+diff --git a/Lib/test/test_http_cookies.py b/Lib/test/test_http_cookies.py
+index 6072c7e15e9..644e75cd5b7 100644
+--- a/Lib/test/test_http_cookies.py
++++ b/Lib/test/test_http_cookies.py
+@@ -5,6 +5,7 @@
+ import unittest
+ from http import cookies
+ import pickle
++from test import support
+=20
+=20
+ class CookieTests(unittest.TestCase):
+@@ -58,6 +59,43 @@ def test_basic(self):
+             for k, v in sorted(case['dict'].items()):
+                 self.assertEqual(C[k].value, v)
+=20
++    def test_unquote(self):
++        cases =3D [
++            (r'a=3D"b=3D\""', 'b=3D"'),
++            (r'a=3D"b=3D\\"', 'b=3D\\'),
++            (r'a=3D"b=3D\=3D"', 'b=3D=3D'),
++            (r'a=3D"b=3D\n"', 'b=3Dn'),
++            (r'a=3D"b=3D\042"', 'b=3D"'),
++            (r'a=3D"b=3D\134"', 'b=3D\\'),
++            (r'a=3D"b=3D\377"', 'b=3D\xff'),
++            (r'a=3D"b=3D\400"', 'b=3D400'),
++            (r'a=3D"b=3D\42"', 'b=3D42'),
++            (r'a=3D"b=3D\\042"', 'b=3D\\042'),
++            (r'a=3D"b=3D\\134"', 'b=3D\\134'),
++            (r'a=3D"b=3D\\\""', 'b=3D\\"'),
++            (r'a=3D"b=3D\\\042"', 'b=3D\\"'),
++            (r'a=3D"b=3D\134\""', 'b=3D\\"'),
++            (r'a=3D"b=3D\134\042"', 'b=3D\\"'),
++        ]
++        for encoded, decoded in cases:
++            with self.subTest(encoded):
++                C =3D cookies.SimpleCookie()
++                C.load(encoded)
++                self.assertEqual(C['a'].value, decoded)
++
++    @support.requires_resource('cpu')
++    def test_unquote_large(self):
++        n =3D 10**6
++        for encoded in r'\\', r'\134':
++            with self.subTest(encoded):
++                data =3D 'a=3D"b=3D' + encoded*n + ';"'
++                C =3D cookies.SimpleCookie()
++                C.load(data)
++                value =3D C['a'].value
++                self.assertEqual(value[:3], 'b=3D\\')
++                self.assertEqual(value[-2:], '\\;')
++                self.assertEqual(len(value), n + 3)
++
+     def test_load(self):
+         C =3D cookies.SimpleCookie()
+         C.load('Customer=3D"WILE_E_COYOTE"; Version=3D1; Path=3D/acme')
+diff --git a/Misc/NEWS.d/next/Library/2024-08-16-19-13-21.gh-issue-123067.=
Nx9O4R.rst b/Misc/NEWS.d/next/Library/2024-08-16-19-13-21.gh-issue-123067.N=
x9O4R.rst
+new file mode 100644
+index 00000000000..6a234561fe3
+--- /dev/null
++++ b/Misc/NEWS.d/next/Library/2024-08-16-19-13-21.gh-issue-123067.Nx9O4R.=
rst
+@@ -0,0 +1 @@
++Fix quadratic complexity in parsing ``"``-quoted cookie values with backs=
lashes by :mod:`http.cookies`.
+--=20
+2.46.0
+
diff --git a/meta/recipes-devtools/python/python3_3.10.14.bb b/meta/recipes=
-devtools/python/python3_3.10.14.bb
index b5bc80ab88..f31644e486 100644
--- a/meta/recipes-devtools/python/python3_3.10.14.bb
+++ b/meta/recipes-devtools/python/python3_3.10.14.bb
@@ -36,6 +36,8 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Pytho=
n-${PV}.tar.xz \
            file://deterministic_imports.patch \
            file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
            file://0001-test_storlines-skip-due-to-load-variability.patch \
+           file://CVE-2024-7592.patch \
+           file://CVE-2024-6232.patch \
            "
=20
 SRC_URI:append:class-native =3D " \
--=20
2.43.0


