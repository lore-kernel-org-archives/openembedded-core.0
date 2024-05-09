Return-Path: <robert.kovacsics@carallon.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C83FCC10F1A
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 17:49:18 +0000 (UTC)
Received: from GBR01-CWX-obe.outbound.protection.outlook.com (GBR01-CWX-obe.outbound.protection.outlook.com [40.107.121.111])
 by mx.groups.io with SMTP id smtpd.web11.2139.1715276951800019249
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 May 2024 10:49:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@carallon.onmicrosoft.com header.s=selector2-carallon-onmicrosoft-com header.b=LIcHH+2c;
 spf=pass (domain: carallon.com, ip: 40.107.121.111, mailfrom: robert.kovacsics@carallon.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mR+0xsmecsY6K2lmhd6zed+l3yYpM/F0r30OSijb0e1SRJDO4QsbmwqUOgZbU0UR47RrTXtX3vdAzPVI/lnx7XTZ9V+CQO2OsD2bl3OxRG8lfrkYq0b7bKNsiALTICHV4UIxbkJKdhxBgcCQeUFmKGl6Pm+U2t1MhpBn6P3luyvlyDhkvxURxSfipTY8BuS9HynMuuxShgUKAMAFfaJMJ7kRsMREKNsaO+4Uqd5P2we0k6UoDHF3ZZRFgwfVS3qUTMD2rKB6+cZjL19v1ZpcY6pJyJga0V5PjmllixiowBTsZANYlRJJunUwnnyIXH5Xs4a/GxAO5c9sjqamb1T7bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v1BsRACWiL26bJVQlPWHJclBwagXk50xqreThHqrhmU=;
 b=ZMdctkYeY3U4hoahP0Gc7zv/owb0UCHmnfP2U1Aryu9IbNg+QsJtxwREWIB9amKc1YWHVPyqHc1uUWMpnFh9SLSDMGgmWI03jH4DFYLb3cdpCqBi9UiYdCr4kPpYeRqajp4jDymeYQKh8bG59vMVeMqRocJb0UHxQ1zssyjZ+7c+cGMkmAABq4uRx+NZP1qzt7OgOJMfhtHWnDcjeZmgLIFVrlnbo6IOpuFPndgVNZYbKEIDO5dedIJ6Bkb+p2oe9eeaf03SQJnjTVihwAoex1D51YGVjupnRfOU9TW7GG1VeOEDLwFmb+dVDqQN+9HlpVdjXYRQnW5Y5emsaSYZcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=carallon.com; dmarc=pass action=none header.from=carallon.com;
 dkim=pass header.d=carallon.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=carallon.onmicrosoft.com; s=selector2-carallon-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v1BsRACWiL26bJVQlPWHJclBwagXk50xqreThHqrhmU=;
 b=LIcHH+2c0ufl7rl0fy2wSnhBVL3MBjzoRpYcD0IkKMCPzjqs6pTRwB7aqt0733SAltlbvPsK2rJbbEsMGtkKcJgFk8EO5Fgnx0TtVyyTp8PxP58kECipxtmOKXR5RUf8nqwj/TLIU9tcLdhM8Jx18p+4e3l9iJhc5rgORPd3hxU=
Received: from CWXP265MB2693.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:ad::13)
 by LO3P265MB2188.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:106::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.47; Thu, 9 May
 2024 17:49:08 +0000
Received: from CWXP265MB2693.GBRP265.PROD.OUTLOOK.COM
 ([fe80::4711:7677:a3f:b1eb]) by CWXP265MB2693.GBRP265.PROD.OUTLOOK.COM
 ([fe80::4711:7677:a3f:b1eb%4]) with mapi id 15.20.7544.046; Thu, 9 May 2024
 17:49:07 +0000
From: Robert Kovacsics <robert.kovacsics@carallon.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH 1/1] sdk: Fix path length limit to match reserved
 size
Thread-Topic: [OE-core][PATCH 1/1] sdk: Fix path length limit to match
 reserved size
Thread-Index: AQHaojXicnPw/RNvOUOpmtqp8HzFGQ==
Date: Thu, 9 May 2024 17:49:07 +0000
Message-ID: 
 <CWLP265MB2690EFA16882F3682871EE78EDE62@CWLP265MB2690.GBRP265.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=carallon.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB2693:EE_|LO3P265MB2188:EE_
x-ms-office365-filtering-correlation-id: 1c1830e7-192f-47c0-0462-08dc7050534e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?xTapZkO2RD/2Dft/qNjuU4W/WyCawrCwI3kpSNIZArD3IFC2rWlfAugnTB?=
 =?iso-8859-1?Q?ouejwvV3wxJO27VxIjIBfR5EggaSuqHy7f5JTvDJQYE5fjtIVvYtipbW5F?=
 =?iso-8859-1?Q?+WdWTnOxvEpEy6Er8VQ1NFpOULAFqkHaBN13MiwubOKljBw131BL08ePXp?=
 =?iso-8859-1?Q?vG+0xkgRAf/9GRDQBVzipwOqSpVlrIneLLVOEnhZkO2iuj3eznuHw7q+D+?=
 =?iso-8859-1?Q?skRlrVHUIQru2nMhfC7SxmDXvmavWK90saQYLwhtAZcbb2HXlka+2hL0gB?=
 =?iso-8859-1?Q?DGNF84ERBQFVmhjepntQahka02nvx9yGY3GF2B3V8Umgg5mytNFnAwXRUF?=
 =?iso-8859-1?Q?2B25lJg66WT+5cYlQfHh3BNBZgT6toLYF2bHYv9l/thMcKDJBKa5rHUBxH?=
 =?iso-8859-1?Q?bBXx4PIz9If62Ujpy4tCFIkpmgoW6a5zHTBLjsW2gJ4LPF0CJFqMv98SUM?=
 =?iso-8859-1?Q?ABQqQBGaNhQawVW+4U0psIeGrEYg2vLAIh/ZLkyXYr+fLHt5cNDxpEkAki?=
 =?iso-8859-1?Q?aITH2llcN4xgktYqGHXibACidcJHFJ8Rdawid0sVhT2O5XI7cU2laGy6Bl?=
 =?iso-8859-1?Q?acM4zvRu7hDM4A6ZPJUzi+H0kknJQH4XQpIfFdWjFLo3L+P0iODYEhc6V+?=
 =?iso-8859-1?Q?loGPbGGBRs2YKmMwkWz6Ti9uFVlS7nQkhTgvzWXBa7dNB9C2ErCtjRUGrt?=
 =?iso-8859-1?Q?1sL2uVCt41m5RgFN/XX37cPKUFvZg+ncCa3OC9dLGHZdoUUAqPE/ALHg0N?=
 =?iso-8859-1?Q?SnPvKGiQPAndHlweIF2zkJMIGsYMhJqP4wZvaOxQyxr/tUdSq7ow/RCzhy?=
 =?iso-8859-1?Q?VN1Mf454BYiTcS17CvJGvF4Wv0qgchGo+nKPINNbRwh7dYOQ88wPWLMACY?=
 =?iso-8859-1?Q?2M/aCdQMbTROwrn+d5cfM15Hj+bCfs0T8iXSTNtSe3YQwhSGwQoHtj1LAN?=
 =?iso-8859-1?Q?WPLDLKRJ+7namt7/XmYO4BRXmI6GaXgDxUGjH05sx7+SV60v20I1CGcv21?=
 =?iso-8859-1?Q?X8YkVwVu+vdr64y0kADCkdkeWk43Ju9W8J7Ny5jjjarnF2ze49tIC6b9JU?=
 =?iso-8859-1?Q?UeGHf1eEqsHx9Or5pV54BYGJQF+z7vL3AU3iX7Dw88dsOjiHJ3qy+uvg2k?=
 =?iso-8859-1?Q?AeIqIRK234YjeT7byrzQnNG74ZPe0C7ujqveTWB04tfgg9+ubduUmkvn8i?=
 =?iso-8859-1?Q?846Hsqlcg/l/rvaS0Cub8hvaTUNvphw/F1TinRboW+GHOO/PUoqzBNKVEo?=
 =?iso-8859-1?Q?UiN7TKpC+GFR/dMs1ljcgNjyiqaxzbJEfvWazet+5qGUb9N6bmflf1bT8J?=
 =?iso-8859-1?Q?JS6QkHBRc3hdmiLYafTZmdAQugRsfQ1jBR+dPuNb5Re02QemaCk8zmnJvB?=
 =?iso-8859-1?Q?n8SKbp+1ki3dr0BBidm0qBkdrjcrEtEQ=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWXP265MB2693.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?I3F1rAg1TfccfdghdHItHgUDPiMpa+3O0IkdJWLZl0/NCGHUX1by5jgbfO?=
 =?iso-8859-1?Q?u6PPg7bpOs1zE9uZpdXwC9/BSBeNmUB4SpOB9GFCgV2XGqCGHgRaaKrweB?=
 =?iso-8859-1?Q?QZ9bxRpTW1Rd4E7MetYli2ipv/8eM/gk1uxRJdF7Xg+jK/blH+z8mVNrhF?=
 =?iso-8859-1?Q?HfqpZGB7GIBu0Dd1d7KYrB/3kAuNupKyvnem1Xe/vZzX1kjgM2PpQyoFkh?=
 =?iso-8859-1?Q?Kz8WkNAYY9XoPbf1htRutvU/NGR0tcyl4LJiMiww4CG9rjEDjs/Q1NM91E?=
 =?iso-8859-1?Q?7nNm7E/Lx3GzTsBJJMqAjg1/jxE1suyn2nXhPp+lKPCR9oseitPFHvs9Eb?=
 =?iso-8859-1?Q?CjGSOjWFy8Xd0XO03G+5u8QG60dD9sc/X3rm2EpzhPfNbES2aBgoHvjrNN?=
 =?iso-8859-1?Q?Ncq70l98bcxkfQqN/mtD7ykO8wAnwH2epJmdw1bnIRm9nk/5QQYYGETyfH?=
 =?iso-8859-1?Q?22boyS2G7hw31gCbkl4Popk8ggAc2UBLnwSJ4sPINk3wpVYCah44eqKbHF?=
 =?iso-8859-1?Q?YnEKjYG+o6gJAPSXLxs7hX7iDVcJSjNdF2fH67XMBhn24cdRFAv02Yr5AQ?=
 =?iso-8859-1?Q?h9m2XGtEuY5oaNTdFeUZWD1kC883dLBs+vtDlL0lvvzPopEvoTVCPytcJY?=
 =?iso-8859-1?Q?G+xbnsBeWQwvsiFJ6JzOp45i7ehzWd3mEP1HBYB/UjVwpNBlRfq83bnC+Z?=
 =?iso-8859-1?Q?wK0U5r4UgS0Bbq7UaTYLr3Vz/66N6g0wURWG1cF84yJB8tezw0GAZuF3kY?=
 =?iso-8859-1?Q?PSliBGvRwdSZzjvAJ80uRiRg1pbaSa/ix3w1+VvNEaH4v05oY+XliwIOaM?=
 =?iso-8859-1?Q?ZMCglaVaW/HDk3kpCX+ePCAG41AIvOLDTabZpouYPNS9iuHw8LOwI9MYdq?=
 =?iso-8859-1?Q?y46yQccKFBKZ/3pLt1xKMP4TUBh3aCFNPlOD4D2R1lFLra26Ljd7g2OGqK?=
 =?iso-8859-1?Q?sNpn7PQjoCpkXyGIWuaWiREI2D8vsum7AeMfvQ8EFbUH+ji0hwCPn2hfbr?=
 =?iso-8859-1?Q?Tlt4G++oMkmtrEZUwwaTNIJk9ODdM8RJuELzzyBiGRiyYxFTUQgAeIfvAh?=
 =?iso-8859-1?Q?4O5CCzElgyLbS5EBkScKIm4X4UNDvZSmzf9+gfryc6nZV1/dTBywyx2xr1?=
 =?iso-8859-1?Q?VX/lYck7M+JcbTH1IPqmlRL1/mo14s6HLS1vJvzb7vaonuzLpJ10xYSfsy?=
 =?iso-8859-1?Q?EJQ6pe6pH962oknl3SQABIdYF84YiMrLV6weBcw6I71Du2mv+UpCSBv5f2?=
 =?iso-8859-1?Q?EXOQvyMuLiwJnDBEzuCKJSJ+dmdXnlgP+oXqESlmfrqR1gq1Vi5diaKx82?=
 =?iso-8859-1?Q?cH3bj48/SaQ7L/XBuwfp6jFbwLJb/cR0ZF2JwLxaHv3PCmm8ADrmDgh8OJ?=
 =?iso-8859-1?Q?vK3/xzzCDV4zwRxzXQ1ORCc+hqRG5MVdm27DZEWUGAkJsotPvyyMYOi72V?=
 =?iso-8859-1?Q?nxp0y7evLTAqcH2XQ1JA8eMh8CrYoLKKSffiGZxRAorwXfppxbcflagWAL?=
 =?iso-8859-1?Q?NM9qog3mwg/EKUqL2XBSZj01ClcATx8Ce4O2e8PQ6vFq2NsCdq+VKMUXFy?=
 =?iso-8859-1?Q?1GcxPkTqb+YCnLrqBfbAeGPiXChHMPw4nch7L+wi1E8CgrFxZmz6gr32Vs?=
 =?iso-8859-1?Q?H70t7V+9zDMF33vcORT49rdEMUOVKkyb/k?=
Content-Type: multipart/mixed;
	boundary="_002_CWLP265MB2690EFA16882F3682871EE78EDE62CWLP265MB2690GBRP_"
MIME-Version: 1.0
X-OriginatorOrg: carallon.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB2693.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c1830e7-192f-47c0-0462-08dc7050534e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2024 17:49:07.6759
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5677293e-6dd8-433d-8f8c-03a0fd233eed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0ilWnFD40DAA/3Fv8ucNSovNYnaLhlhRLT+0hSbyNWHhX7Pew+9VAGjgcjtaGej3UD7f8hzy3BP6XRFqRsv21TQNTpmmy/jmE4WVHHhHYkY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB2188
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 17:49:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199181

--_002_CWLP265MB2690EFA16882F3682871EE78EDE62CWLP265MB2690GBRP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,=0A=
=0A=
I was just reading over the code, trying to figure out how the SDK/eSDK ins=
taller works, and the following stood out to me as a potential bug: meta/re=
cipes-core/meta/uninative-tarball.bb uses `patchelf` to reserve 1024 bytes =
in the ELF interpreter section, but the check in meta/files/toolchain-shar-=
extract.sh is against paths 2048 bytes long.=0A=
=0A=
If I understand correctly, this is because the ELF patching is actually don=
e by the python script scripts/relocate_sdk.py -- presumably because patche=
lf itself is compiled as a dynamically linked executable, so will refer to =
`/usr/local/oe-sdk/hardcoded-buildpath/lib/ld-linux*.so`. (I did quickly ch=
eck, it seems possible to build patchelf statically but that then requires =
musl I believe.)=0A=
=0A=
Anyway, this just stood out to me as being wrong, but as it wasn't a bug I =
experienced, perhaps I misunderstood something.=0A=
=0A=
Robert Kovacsics (1):=0A=
=A0 sdk: Fix path length limit to match reserved size=0A=
=0A=
=A0meta/files/toolchain-shar-extract.sh =A0 =A0 =A0 =A0| 4 +++-=0A=
=A0meta/recipes-core/meta/uninative-tarball.bb | 2 ++=0A=
=A02 files changed, 5 insertions(+), 1 deletion(-)=

--_002_CWLP265MB2690EFA16882F3682871EE78EDE62CWLP265MB2690GBRP_
Content-Type: text/x-patch;
	name="0001-sdk-Fix-path-length-limit-to-match-reserved-size.patch"
Content-Description: 
 0001-sdk-Fix-path-length-limit-to-match-reserved-size.patch
Content-Disposition: attachment;
	filename="0001-sdk-Fix-path-length-limit-to-match-reserved-size.patch";
	size=1695; creation-date="Thu, 09 May 2024 17:45:17 GMT";
	modification-date="Thu, 09 May 2024 17:45:17 GMT"
Content-Transfer-Encoding: base64

RnJvbSAzOTVhM2JjNTFiZjA1MjBhODM4ZDM4YWMzMTAxMjEwNmYxOWIxMzRkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBSb2JlcnQgS292YWNzaWNzIDxyb2JlcnQua292YWNzaWNzQGNh
cmFsbG9uLmNvbT4KRGF0ZTogVGh1LCA5IE1heSAyMDI0IDE0OjI4OjE3ICswMTAwClN1YmplY3Q6
IFtPRS1jb3JlXVtQQVRDSCAxLzFdIHNkazogRml4IHBhdGggbGVuZ3RoIGxpbWl0IHRvIG1hdGNo
IHJlc2VydmVkCiBzaXplCgotLS0KIG1ldGEvZmlsZXMvdG9vbGNoYWluLXNoYXItZXh0cmFjdC5z
aCAgICAgICAgfCA0ICsrKy0KIG1ldGEvcmVjaXBlcy1jb3JlL21ldGEvdW5pbmF0aXZlLXRhcmJh
bGwuYmIgfCAyICsrCiAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL21ldGEvZmlsZXMvdG9vbGNoYWluLXNoYXItZXh0cmFjdC5zaCBi
L21ldGEvZmlsZXMvdG9vbGNoYWluLXNoYXItZXh0cmFjdC5zaAppbmRleCA0Mzg2Yjk4NWJiLi44
OWQzMDAwNWZkIDEwMDY0NAotLS0gYS9tZXRhL2ZpbGVzL3Rvb2xjaGFpbi1zaGFyLWV4dHJhY3Qu
c2gKKysrIGIvbWV0YS9maWxlcy90b29sY2hhaW4tc2hhci1leHRyYWN0LnNoCkBAIC0xNjQsNyAr
MTY0LDkgQEAgZWxzZQogZmkKIAogIyBsaW1pdCB0aGUgbGVuZ3RoIGZvciB0YXJnZXRfc2RrX2Rp
ciwgZW5zdXJlIHRoZSByZWxvY2F0aW9uIGJlaGF2aW91ciBpbiByZWxvY2F0ZV9zZGsucHkgaGFz
IHJpZ2h0IHJlc3VsdC4KLWlmIFsgJHsjdGFyZ2V0X3Nka19kaXJ9IC1ndCAyMDQ4IF07IHRoZW4K
KyMgVGhpcyBpcyBkdWUgdG8gRUxGIGludGVycHJldGVyIGJlaW5nIHNldCB0byAnYScqMTAyNCBp
bgorIyBtZXRhL3JlY2lwZXMtY29yZS9tZXRhL3VuaW5hdGl2ZS10YXJiYWxsLmJiCitpZiBbICR7
I3RhcmdldF9zZGtfZGlyfSAtZ3QgMTAyNCBdOyB0aGVuCiAJZWNobyAiRXJyb3I6IFRoZSB0YXJn
ZXQgZGlyZWN0b3J5IHBhdGggaXMgdG9vIGxvbmchISEiCiAJZXhpdCAxCiBmaQpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWNvcmUvbWV0YS91bmluYXRpdmUtdGFyYmFsbC5iYiBiL21ldGEvcmVj
aXBlcy1jb3JlL21ldGEvdW5pbmF0aXZlLXRhcmJhbGwuYmIKaW5kZXggN2VlYmNhZjExYS4uMGZk
MDFmZGI2NCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvbWV0YS91bmluYXRpdmUtdGFy
YmFsbC5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9tZXRhL3VuaW5hdGl2ZS10YXJiYWxsLmJi
CkBAIC01OCw2ICs1OCw4IEBAIGZha2Vyb290IGFyY2hpdmVfc2RrKCkgewogCURFU1Q9Ii4vJHtT
REtfQVJDSH0tJHtTREtfT1N9IgogCW12IHN5c3Jvb3RzLyR7U0RLX1NZU30gJERFU1QKIAlybSBz
eXNyb290cyAtcmYKKwkjIFRoZXJlIGlzIGEgY2hlY2sgaW4gbWV0YS9maWxlcy90b29sY2hhaW4t
c2hhci1leHRyYWN0LnNoIC0tIG1ha2Ugc3VyZSB0bworCSMga2VlcCB0aGF0IGNoZWNrIHVwIHRv
IGRhdGUgaWYgY2hhbmdpbmcgdGhlIGAxMDI0YAogCXBhdGNoZWxmIC0tc2V0LWludGVycHJldGVy
ICR7QCcnLmpvaW4oJ2EnIGZvciBuIGluIHJhbmdlKDEwMjQpKX0gJERFU1QvdXNyL2Jpbi9wYXRj
aGVsZgogCW12ICRERVNUL3Vzci9iaW4vcGF0Y2hlbGYgJERFU1QvdXNyL2Jpbi9wYXRjaGVsZi11
bmluYXRpdmUKIAkke1NES19BUkNISVZFX0NNRH0KLS0gCjIuNDQuMAoK

--_002_CWLP265MB2690EFA16882F3682871EE78EDE62CWLP265MB2690GBRP_--

