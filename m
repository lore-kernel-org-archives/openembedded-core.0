Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AFD7C3DA64
	for <webhook@archiver.kernel.org>; Wed, 31 Jul 2024 06:33:46 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.81])
 by mx.groups.io with SMTP id smtpd.web11.37301.1722407617714455889
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jul 2024 23:33:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=ZK76ySUe;
 spf=pass (domain: siemens.com, ip: 40.107.20.81, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eQkekTOmBm72S3x2fikBegUobiY/vvx70VHNbclrOJJicgx0JbVAQOs/F/fEAX96hQdgsv0vRB9NOhSITjwpvSKD0VWNTfVpt/pfqZqAaRkAi5Q+cNLM9nXThmEAVLNRRM0cU9KRwKO1lQb1Zwa9HcUgHDZY49L2v8wg4K0TBLcwk+/IbO0+oGNQRtgw3TzBunxNnzMELRo17hA/tei6tgIQfCn7LhkZn2s1pc49K6tQSpKEJmhjIw+9d2UleHHvXoOVxI0wTJPHDWNcC2OR+Qy48e1jGyahd7hdUKs6ODADQHmPCF8IAYhzk8nK4zswkEYomo7KMdJG+vh1zTXivw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cphm7nt2IKutfTPUoWkMuAsN5TXoOBxukGqRFzOhbNw=;
 b=ICM/6AJ/OUN6BnfJJDn95Ups28JCx8o9AbIrN221TCO7lml997I3NIUpY1efZzuVx2e46SVwOcGt4bO32TmSDwCUPvK4VyC8Bw779Bfg1bEHhrlJhNos6xq/mRyPsXcJzcCwa25zUAiSbCccVMEAQlwGZrT3d8qCOhX+P9LgpCaLnP0SbeFB0Vl2sYFEDvZni2XhnZbLYby14gAJJAKkZYzkpx9Tn6k+5Jbwx+9uSHq2/Rl0+MiS8SRCfTeSvosIf8KmVENdfMb15IwGGajwQoue2uOuDOVoStjeflavvXWx4NbxWHyMJtDbxVpOSkqmz4tkgKrS8P4Mx2hTz2zldQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cphm7nt2IKutfTPUoWkMuAsN5TXoOBxukGqRFzOhbNw=;
 b=ZK76ySUejZ9h+Ph1nSMZFc9EPbUEz9BHxyanu2QFH875oDdXGPPE9uihIVJ5u/CuNP1lqJ0r6SUquN1GT0cA3KUf4rLGKkTtKibd6ne6FC0ctiNyY97mBOB7Q3ymzhlOJKceQZxpLI3QnoQldU11miq1J+LUrJRVVXRQHbBt8ArOtfcc0nVdwv5a4nBSRZvmAX2wyNM5QTTCgDWVbLexstTWLmoEvNZZ0cn04JHF+Uv0p9ZKBFBN61x+8Kzi37+MsT05g1h6l5wvAtGStqPAmj08pWfk7qxFLJ9GsvYWy4Q+BeEuuVhGNRAiKSnFfxVAL0Dqm0CFVYX0nE60uzc49Q==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PRAPR10MB5225.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:29f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Wed, 31 Jul
 2024 06:33:34 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.7807.023; Wed, 31 Jul 2024
 06:33:34 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Steve Sakoman <steve@sakoman.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][master][scarthgap][PATCH]
 libstd-rs,rust-cross-canadian: set CVE_PRODUCT to rust
Thread-Topic: [OE-core][master][scarthgap][PATCH]
 libstd-rs,rust-cross-canadian: set CVE_PRODUCT to rust
Thread-Index: AQHa1dFzYso5SooLK0uDLIm0UjCTbrIQez0Q
Date: Wed, 31 Jul 2024 06:33:34 +0000
Message-ID: 
 <AS1PR10MB56979365103EE4D9D7A1761AFDB12@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240714093628.10082-1-peter.marko@siemens.com>
In-Reply-To: <20240714093628.10082-1-peter.marko@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=b911ca8a-a477-4d62-bae1-a21e27c6dc45;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-07-31T06:32:38Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PRAPR10MB5225:EE_
x-ms-office365-filtering-correlation-id: 1b483c15-dec0-4329-b9be-08dcb12ab3fd
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?YIKRMIYFLul80dfntFw1DV6mqqBW2qP7ItrTLTQN9nWgMXhwfqjnFckUU7CB?=
 =?us-ascii?Q?CmucjLvJKsBY7oTckx9CzhnUQB+0fdaSlj9cc4g28RmQiOhL7ghi15ORm4L2?=
 =?us-ascii?Q?i+50Hx9v+HK0akxb+0f1tBC03fr9BSv9mb0T5qv0wvOgFWhZsALBH14a+f02?=
 =?us-ascii?Q?kuQV+Twz2RBxLIgLrG80o1580AkkqUzwXvHZxZqGjZIR5CzS5aw/rFl3slK7?=
 =?us-ascii?Q?TikA+bPEDIGpXTaAT18dSPUfeoC8DnkPz8XdM4j5ofWFaDY8xX3nowh/2CrA?=
 =?us-ascii?Q?qpAyDWO3nJj22qh7KQKg9CqYPD5spnEwpPugy3mW+niUQHQwUmnXoyvQ4zSG?=
 =?us-ascii?Q?Rk4GMq+BNCHnkX7/G+mdLaCPGVidFxrd1eIeHj1hVJyLyXYBamjYe2zKmVQc?=
 =?us-ascii?Q?UQCifZzF9ZyEPFriYtHzYgenlkZWjE58gsBREhoA6v0NmfRbtZmZo7O3FEok?=
 =?us-ascii?Q?jhyjez6F6q8++BOMfv1RtT/0NwGhgr56awY8M0H/QJCReQFBIt72jlosF2cD?=
 =?us-ascii?Q?Z8STJh5h4QjgoFZskyp91XxifR05mg2jvMkMbw4nF/uf9eBtQV2RpLNPQz2L?=
 =?us-ascii?Q?SjU/p2uLNhwQB1VxZB3h1rCcE78RBq7adgFGePxRtLbRiJRNlYd2u8CjiBR5?=
 =?us-ascii?Q?s4k//WMbvQO+CSJHxFcLUSI55+KBrRmtUjQfClXQ9gRIDch9C4BDKhPnsmQR?=
 =?us-ascii?Q?RKSy3NlGRPSOXgYgmTqodcTXe188c1AFrD5+yCxMFWiH4ijdk0xecY7elh5T?=
 =?us-ascii?Q?K6hBkCszkqFb67ucKyrBBkfTET84ICzjCDDECBNioguPeSLwsB4sawLTL+nm?=
 =?us-ascii?Q?S8q9pU2vr3pksTnqXB2mfy/KMVXa22Efi2SLq95x2neNM5z1RD/wEmqDH3xS?=
 =?us-ascii?Q?7f1+TRQpqWehHATtxPRV/toCccuYQJNQACtuKnfOztxDOXetpFbVViudpqMz?=
 =?us-ascii?Q?ZlrPe+5bgb39VsH77FJuQCqvsyHo9tULNZ0ikzuwfR0yuH+S4unCJ/TzacQl?=
 =?us-ascii?Q?kPAGfHklQmKHnfbw3L0BDzEFUqqjVXUeXtNfWJKEmjLWgbHa/iG1BT832MBM?=
 =?us-ascii?Q?fgCDpIgoRhtgjcdGjI9xUK/1YRJULogFqhaezHPX6enptIMzHvwnd7GkTJq2?=
 =?us-ascii?Q?yyS0du2D4EcOtZRqn5p9oQQ/UzF3heb8+i+GWQ+NbBwfbKpTc6E2kpysfW8Z?=
 =?us-ascii?Q?edu2lOnb4903a5B3b3OYVf6YjvHX3gME4eDx1njdBL8mfJUuHTesmDZGe/Ev?=
 =?us-ascii?Q?yez7+wnsAxx9J5KSPNa7OhDlO0iIE1AqeBAo8OOOANzx9FbPpuhC5IGJ8ogq?=
 =?us-ascii?Q?nMx+Z992QkL/D5YCKogZzkaQWtO1PpauNQufNM21pJtiaO0zNk1L781A6FUE?=
 =?us-ascii?Q?3N1Z3Po1BrBQ/NrEny8V2L7uqnT3EtG5VGM8yia9mY7Hh+5dhA=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?epCskxqx84LIQy+ha1QNnlT/QA82+YxdTzfdgoGE5xzjlgW1EIG1M4dCK9VZ?=
 =?us-ascii?Q?IRWYEtM56VTtfN59dP8bEYMyX6VZqyRJ47ZK6f8Odpal97Q6q6T0zkOPOB2c?=
 =?us-ascii?Q?vwGPJHuBIsXxcrzh546poSlxADmejBC2LQOIKf/r/Xu13y44nwf6/FMi5B4d?=
 =?us-ascii?Q?vYaLP9t2igGahSqwsVRlXhwv37XomsWxRxTejCD5IpChW0bI6YH2fRTA6l0T?=
 =?us-ascii?Q?2RhLgVuoHLhv2OAEByjcTYvM+Mk1SJ9BlHEXpUe1QFjvGZOFriZ9HcoF+jgL?=
 =?us-ascii?Q?S1SuuuvcMEq5IJFPMyi0OGnJDuxz3TzVr8czKDGc6qXUBnePLSy6PalL+aE/?=
 =?us-ascii?Q?if23AFAJuju7RCF7Uvfvd5b2yvBNGK8lskfEv10DT5WljZBu4FsWt+GOCAqg?=
 =?us-ascii?Q?JjgxMgDX8VGkJfEceQqywZ0S/mXCsI44ew9jKCVrUjojuDvuwe6BXTmY7yOM?=
 =?us-ascii?Q?WA7ywW6TXwypkV4zK//DWdYCfEP3LWenVOe1Digcrlhyq126I6FQTGbwg/3B?=
 =?us-ascii?Q?1PJ7XdYp467w6BTEdXC03TApBRDYuWyzAKV2JAffaL4IKTtJQ2ayb/EDCkvU?=
 =?us-ascii?Q?qAgZfmq78cIVVGlgYbBgWikhF7o7kPZcMTC7sVDCjTRrvFJ/NT88MUcl3vN8?=
 =?us-ascii?Q?3VErX4m24r6mn6coLJK2R0I3ScsUp4xBtkmWOOakthF6vIgYlWDYf2HTq7jp?=
 =?us-ascii?Q?Dbm1MOAFNfugi29rXyJ/smgsJz9VId0aHVkna1DGptXWBv3VFS3bKPh6H635?=
 =?us-ascii?Q?2jwSjc2/TtTJM8KO9U1IWVX4KymdcKivv3UQQycwN/mpAIb01D8Vy+OPFfMz?=
 =?us-ascii?Q?LfAhrMHXlAi3FMDT4SoBU2fzhN/zM2zISGtPvEzezAwScBOfK02EOtftQNIo?=
 =?us-ascii?Q?6cgF2urlex6mmzItjfkUFVd9LFQshGFAoA6dsXTCMk3q7me3PIGzndOVxacm?=
 =?us-ascii?Q?f1/8L6CCKNWnLB2Z3AcCEX0QiGBOONYZMwIWdwEMT7QBWDLuTVUcy3VUwwcD?=
 =?us-ascii?Q?3bPhGgmNMtX+dSJHaVwjinkTi1K4GZJw94Un9SBrXk5AxxXhBTT6RohhCBqM?=
 =?us-ascii?Q?IAI8Ciy6hBPdKtl6hPM3Q7rRTdy4aOpo2xAcIj3w+7q1QiHu5XQSoPsWgMRn?=
 =?us-ascii?Q?DNiGD6my2ZgTIAo6Vm3k5GGK9VODBRqBQg2K3NhFeEp+0ZIjbSLrI02KIwbj?=
 =?us-ascii?Q?1IzoNy30GdigFJbeUXxAQVydHpYXOwMswGd3T58xzgcJ4ka3bisrTWwmkv9o?=
 =?us-ascii?Q?EesezsrpLoFz9iVFrRXtguPkVc6pj7T6d5cc3IDT/nomQi/Zaa02bIRKaVdX?=
 =?us-ascii?Q?8QZyohOTKETi5DgWeT3d16MhaQ0TljeTqiODBlabEJLLGL6LbJtGSFpx3s90?=
 =?us-ascii?Q?uzPAhgMIlwjGZLtdrxCpyz9jEU0F0r01/CDQSaREnPsQaqh/KjgFa3xz1HiV?=
 =?us-ascii?Q?AM1fuAaYzk5cTam/1ON8IxatUbuD5ERxgCGvpqkFKmEliaZc07gv2hkeQl/M?=
 =?us-ascii?Q?uYrzNyZSWURNFHhLMLXKnAOOLbUidItntli124MFDueR2V1nyFvY8Up2Zf9K?=
 =?us-ascii?Q?MSEz5fvyD9wI3v60oBBYyhQItw/WyLjWIZdD5ayZ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b483c15-dec0-4329-b9be-08dcb12ab3fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2024 06:33:34.6062
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DRAvhzgmXEmikvBROgnr2RTp6fKg1KN/w/Yn+vAnJhwr4IpbNE26ta1eGPsMj426w9We4OLE1x92t1nkAyQ0kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAPR10MB5225
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Jul 2024 06:33:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202692

Gentle ping for scrathgap

> -----Original Message-----
> From: Marko, Peter (ADV D EU SK BFS1) <Peter.Marko@siemens.com>
> Sent: Sunday, July 14, 2024 11:36
> To: openembedded-core@lists.openembedded.org
> Cc: Marko, Peter (ADV D EU SK BFS1) <Peter.Marko@siemens.com>
> Subject: [OE-core][master][scarthgap][PATCH] libstd-rs,rust-cross-canadia=
n:
> set CVE_PRODUCT to rust
>=20
> From: Peter Marko <peter.marko@siemens.com>
>=20
> These recipes come from rust sources and CVEs are reported for them under
> rust-lang:rust vendor:product touple.
> Especially libstd-rs needs correct CVE_PRODUCT as is it installed on targ=
et
> devices (being statically linked to rust compiled binaries).
>=20
> before:
> cargo: CVE_PRODUCT=3D"cargo"
> cargo-c-native: CVE_PRODUCT=3D"cargo-c"
> libstd-rs: CVE_PRODUCT=3D"libstd-rs"
> rust: CVE_PRODUCT=3D"rust"
> rust-cross-canadian: CVE_PRODUCT=3D"rust-cross-canadian-<arch>"
> rust-llvm: CVE_PRODUCT=3D"rust-llvm"
>=20
> after:
> cargo: CVE_PRODUCT=3D"cargo"
> cargo-c-native: CVE_PRODUCT=3D"cargo-c"
> libstd-rs: CVE_PRODUCT=3D"rust"
> rust: CVE_PRODUCT=3D"rust"
> rust-cross-canadian-x86-64: CVE_PRODUCT=3D"rust"
> rust-llvm: CVE_PRODUCT=3D"rust-llvm"
>=20
> Product for rust-llvm is uncertain and, should be handled in another comm=
it if
> it is desired to align it, too.
>=20
> sqlite> select vendor, product, count(product) from products where
> sqlite> vendor=3D"rust-lang" group by product;
> rust-lang|async-h1|2
> rust-lang|cargo|5
> rust-lang|future-utils|2
> rust-lang|futures-task|2
> rust-lang|mdbook|1
> rust-lang|regex|2
> rust-lang|rsa|2
> rust-lang|rust|45
> rust-lang|socket2|1
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/recipes-devtools/rust/libstd-rs_1.75.0.bb     | 2 ++
>  meta/recipes-devtools/rust/rust-cross-canadian.inc | 1 +
>  2 files changed, 3 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb b/meta/recipe=
s-
> devtools/rust/libstd-rs_1.75.0.bb
> index 5fc6fb97bb..14161714f2 100644
> --- a/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb
> +++ b/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb
> @@ -15,6 +15,8 @@ S =3D "${RUSTSRC}/library/sysroot"
>  RUSTLIB_DEP =3D ""
>  inherit cargo
>=20
> +CVE_PRODUCT =3D "rust"
> +
>  DEPENDS:append:libc-musl =3D " libunwind"
>  # rv32 does not have libunwind ported yet
>  DEPENDS:remove:riscv32 =3D "libunwind"
> diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc
> b/meta/recipes-devtools/rust/rust-cross-canadian.inc
> index f962437d6b..c34b839d15 100644
> --- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
> +++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
> @@ -1,5 +1,6 @@
>  SUMMARY =3D "Rust compiler and runtime libaries (cross-canadian for
> ${TARGET_ARCH} target)"
>  PN =3D "rust-cross-canadian-${TRANSLATED_TARGET_ARCH}"
> +CVE_PRODUCT =3D "rust"
>=20
>  inherit rust-target-config
>  inherit rust-common
> --
> 2.30.2


