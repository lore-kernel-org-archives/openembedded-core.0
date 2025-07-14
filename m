Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 398C8C83F1B
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 10:24:21 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com (AS8PR03CU001.outbound.protection.outlook.com [52.101.71.2])
 by mx.groups.io with SMTP id smtpd.web11.75004.1752488659662656805
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jul 2025 03:24:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=sYHwRZ/s;
 spf=pass (domain: siemens.com, ip: 52.101.71.2, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xC56RpBcSHrwAljdldpE1UrIJBmAuF1r3fpFEyiNQkOdhSH3lT2E89xVgf7Gt+usPx6BkjuldpqNYncmzO5h3RsPqX6r0AD7iiz3U8REfjUNn/OKbZDh5w47EKl4CcLUOxEKUwoiqxaX55bSGTpZ62m7ll2fFi3BdMti2355cdHXIhcoGg+mHwjVQ5gCuKUmOKTr61KLHFVKNQSfbp17+Zl8XXZSh174H5cSelzHfii0TxmnntAvpnS2z+2hmjfXKmT16wWzUZYre74gAKb5z9kTMu4LIC8uEzlAc3GkQknMMhlTyWTOCCq3Olx0Diq8D4uMTjy3ykSQSo0ypWaFgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Ymp5Y9+M71L05N7EXkRYvDfE5MmNnmnV/TY5XewxnE=;
 b=OPXY9LLXL1rujqP7xSgvlZ0CFPoC8jMdRq+ONUH2AC8ruOY4EMkgF4MDBhZXl+Mm0C/raNLQD8xkcVHp/pVAYBfAPgBRqepdvV5/IkqQ8zdcnA/bNDmHyBeon1g8vSrHTYO4skzPByuvu3lwPJamG86WodwsKKO4V0diWp2TetWrNKPQsHoF2fOThS6of+UMt55VfzXFkh97i3U3i+VtoeXCfMM1POp8BoWMFRrJCcICVBf3ZLm3oC9GEpA6lD7HYQqBnH/Hc09DWDmpItRQ4E/pVHJGIDPF/TinsA0yBAl2cAZra9GveYj54CEABnhTQq2RReK+blIWO5mbQd5q9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Ymp5Y9+M71L05N7EXkRYvDfE5MmNnmnV/TY5XewxnE=;
 b=sYHwRZ/s7Qx6p7PSZfZTvcnzcReD+f6HuUvQPlWnL9CYXBh+SQbHZYyePzI42Ai7T1fpULFIb4Eo8b3KU1PpzXKi2a6MlgMl7viQsR8Hqd9DB5fBu+tvGbqZjkIec324FQ0zEVgvcTIJYSZPVKNkUIBvcC0feH26RpT5gDqKtaylh473g5EKKCAZ8VureTSfX2CoTPUkAI2PO7jp/qa+ajuVvYrb9ovlFuEL6Wt0I2tYYZw6L7DUrCnQx1dBRrKoi1Ch+tb3/EoDoobXFhLOwfLqYn+52Zo1sj6S1oxHpG8il5BzXpeg9J3sODkX4Nji3YMQv59SXaMCZyM+efJ3NQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PAVPR10MB7258.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:31a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Mon, 14 Jul
 2025 10:24:16 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%7]) with mapi id 15.20.8901.024; Mon, 14 Jul 2025
 10:24:16 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "hiagofranco@gmail.com" <hiagofranco@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Denys Dmytriyenko <denis@denix.org>, Hiago De Franco
	<hiago.franco@toradex.com>
Subject: RE: [OE-core] [PATCH] mtd-utils: add optional systemd service for
 ubihealthd
Thread-Topic: [OE-core] [PATCH] mtd-utils: add optional systemd service for
 ubihealthd
Thread-Index: AQHb8tA79G+R3ePQDE23lsf+vgIEzLQxa/Eg
Date: Mon, 14 Jul 2025 10:24:15 +0000
Message-ID: 
 <AS1PR10MB56977B0B73EDD7AC5361A17FFD54A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250712015604.148635-1-hiagofranco@gmail.com>
In-Reply-To: <20250712015604.148635-1-hiagofranco@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=dcc7bb23-8b30-4a90-9939-7a0ce43b0a05;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-07-14T10:19:30Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PAVPR10MB7258:EE_
x-ms-office365-filtering-correlation-id: a95ec1ce-aa0e-4fc4-6ccb-08ddc2c095da
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?OeIoqL63wpIDG4Tuu3H5whHG7u4eXdL7oZhgIYWpWMPHb4xeHvbQti1iC4v6?=
 =?us-ascii?Q?TW9cxo4ozZ4UinRq3YGhwxAauXF+iVCB4do+JJ1sCquO1BIdMactSA8mFTiR?=
 =?us-ascii?Q?bTCOvZc5AgGPZXtd1LjAJY/O0anBtnBAXjpHClPDz01ILF/kMQWStqEs2iA/?=
 =?us-ascii?Q?qfdRdCkdLdFbPSCquCJjKbAalwapunF+celYeLUd4cZwc2a9BsUgnDoIDPUc?=
 =?us-ascii?Q?+fcdtvWcWn/SvItu4f6h1gE7WR2F672ECV9HG11APBg1NLCJ/S54rAJE4yiF?=
 =?us-ascii?Q?geifjHGdY49x/AAINdGuYxDFFCb3/drsv33kfttSZZhk4yQ4DYeNe4xQespn?=
 =?us-ascii?Q?8zrJ1WhuLyQE5OGUsWVDFQTWeegI/UOBAIS2s1rFKwiI9R3LxiRZEN0BcAPu?=
 =?us-ascii?Q?AUn8zK0WMITdYL5PVRCqRR+j9CftUzEHYY1yYehA4+4zzBMDUInSd4r/D79b?=
 =?us-ascii?Q?xZTd6D1/GjKyElOOyLfgpEeNV41+Z6hR6OAwe6Sy6zSXrhwlzMWl+V7gg73q?=
 =?us-ascii?Q?4Bc5lOwxrRuJXIFAUqglQAFKiercK7jR9D32i4+yGvrBhij9nnRNFCSq+fYR?=
 =?us-ascii?Q?/UlFoP4XB/8W8F3rYLD3qK256I8wkNeC6Un38K1f10VbibA1Z2H+FUp/JxYq?=
 =?us-ascii?Q?kJ95z85hg0vuZKwxUXNRLQ/IAXHGSEAeTJH2WHoy6q+LOVgNR3yJGC0umsOa?=
 =?us-ascii?Q?skQWbbqGRjC+85N3wApaSBenQ9jeS5wWHvV2uuGktdVkQ6+Dh4Uwhe0aPs49?=
 =?us-ascii?Q?AkAPpXSe8HBNVrLNqaumvywmaM/jv6c5xeKgffVEQ7TlZu38yCOPeZGpPjVS?=
 =?us-ascii?Q?LZL4AzODJ5b7ugZGqJ8BDKbZoZ8ieD5bYQE4plfTo69QcxD7h0uagqnNUoc6?=
 =?us-ascii?Q?+0/TbRNwmTXrlV3gabhzBLfTOqzYMLjLFZX5OTwUMtLJt/5mzb8qxaJyV8AV?=
 =?us-ascii?Q?MZ9e4D94RxaykKVXpC9F1wM7q8Y6Fj1nrOH2qnZEkN516bwQL921FewJ/Sm1?=
 =?us-ascii?Q?Oi94TDIq1AMDwIV0IexgDR+fizm5jDLxU3Kh2E3Q9IHfvnHBezbdtN3bHr9q?=
 =?us-ascii?Q?r+RbS+BtLkmBzq1iuxOkwBVs1Z63/j8DBF6v4U3sCyCqfGVKYD3FyD98VgnI?=
 =?us-ascii?Q?ym8cWJ0xG15ihdz4baKWYRQKki7fD4Zp7fBzLPasnLI3yoWC5LI8gyhkqMhx?=
 =?us-ascii?Q?MfG1Cle0BvVUS53d6fWqEqQYoIzpD5OudW0Z4IPhqYX8NSQvsflC6ku8xpBx?=
 =?us-ascii?Q?RVzk9BwPuvz5W58mPu39rsRKYQRVvAVADG1qccFeOQ1zAab1qkYK90G7Iu5b?=
 =?us-ascii?Q?bzfXOs9I/wNFiINBNuvl2ZAHf5twNNa+FStyKMPfSbWSDq4xUA4peKCpdxob?=
 =?us-ascii?Q?R3ruugslxflxUTqqciBElIMPTiGA6W0IaFgYVxCJu8IB01jgiJrND0FoqyH+?=
 =?us-ascii?Q?ODKXBuJSYq//VD1/FxUgzULxSyp2yUCJpUVztBVrlZx5aJg4blXMGw=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?y4Y9cAi1k0WrWPjufMGy8PjuUjAJtlkQVzeUlTaCQWCUfZIPVD4wZU3Vhjpx?=
 =?us-ascii?Q?YSA2+Urwy5C8BZZLd7hcovLjtXxVpOR9jqVmGU2FrN06CiQJzeXif1+6t7Ll?=
 =?us-ascii?Q?gvLdD/uRxyYlvHldxkSR65arxNKEa674+Id3qQE5SLn0/tmMCff6BHbhs+4p?=
 =?us-ascii?Q?3GTuqsHIcHNhqbbbscgrkiSfpVC8wWatrCBVxKP3LJtj0YQd4tHLjwvr4uc1?=
 =?us-ascii?Q?Z7nkxOTMxRjPAVmC+NOFWY4qExwxUOB7bojohcXmcL2cdrqyNKfq0BIXXqi0?=
 =?us-ascii?Q?D0/PPbns+NtwLR3tCP5EEP6f9icu0lTcvsZOIyuViQBlisTw/QDgq2n5iTmv?=
 =?us-ascii?Q?npwIqT5NjpQSMicQTgnu7tAQGylMtHS/HguGhOgyg9ag/lPTzunkHJHJIn9J?=
 =?us-ascii?Q?FJ2kdDpBg0YmTDW28xbEEXPNf9TgaSABKFCkXEUC+fEt1UpYbaLzWus3julw?=
 =?us-ascii?Q?vvUjRXyvU0fkRVo5s+IpJOh2yMlZhCWV+ZdXycGC+KXIWcslDPCfMKUuJQxV?=
 =?us-ascii?Q?eLNP/uDKXb9pcYf4JjDDHz9uKEklGZxskDz00X/V0rz2zdpR5qs8bq6r72lp?=
 =?us-ascii?Q?KZ7ILcgE7xoxc573HrIhVO3p041uwGyaYnVrF/zSOT/JDqA+XhkviQ3hSrWe?=
 =?us-ascii?Q?yUGmGYaXN1E8FCYNxVactqM9ak0t31q0JfAuQrUt+55kEg92MG5LiBBMl05Q?=
 =?us-ascii?Q?5Oqeckx/PTe5YJvLUtU4DG2nn2pSPrcnAhEo0w6uVj6J30Qt8EGheibvEhaK?=
 =?us-ascii?Q?OMsUo3BeG8Wgjp1I10pf0KZSanGRUdw0gRrsLzrDfsASsnQ0ZGMv4PDcSApU?=
 =?us-ascii?Q?WdPWXZCRBEXu+8/kUGO7B4iMspSK8cZbSspgfNqhWzbkD20eweZdEqwsmzMC?=
 =?us-ascii?Q?WFoVqjl1fN9XfFlirgPvKJvxWRK2303Okj8QWJKp69tZN6ZvjdPRi4b4hiFX?=
 =?us-ascii?Q?kSTb8aO0y4oGWGueFOz1ubq5vEf4KazUPs4/6FTas9yYGgPso6LUlCTWKHG7?=
 =?us-ascii?Q?Z0xg38sjsrhcwqVSIbVcG4o8eIBC7dy8MRPJWQGafndpiUWkaonUMDsJQJBi?=
 =?us-ascii?Q?/2WG6cQJvSGKrKYvFmZ6x44BpFpDUyfnVHtqE6GbR5P5WT4t09DRkRuoGJ1q?=
 =?us-ascii?Q?+6gJ6VE4YdbjnzHZZqpvjwEOiiZuEYKnqybUEqfHG2n/A+bQ0AmcvvG/k9OK?=
 =?us-ascii?Q?RK8WkJlsShqYqmh5wEEiMaIWlVScflhLqav8SrTzaBvM+0VKKTqmL9qsfPim?=
 =?us-ascii?Q?i+7FwF0cswj0V1rVVEqBXVtmpuhJx3lmaFeT/fvjsttxIc58+iOwE32Dkcm4?=
 =?us-ascii?Q?3CCwPTssoKXXwcSmxc6NxFM+7xwyT6xGwJh1At/agtp7YugRJOmcQAPUPfBs?=
 =?us-ascii?Q?md7ZQL6D8Xf/K06ILSFdQz2G4lTMyK/11MVCOoEyYYGICOsKEjTEZ2it8IQu?=
 =?us-ascii?Q?i9EIWfCipMe3N/hit9N4FU5peToinQJQGsT2+1gi/tgaFwjHsuD+ZCwUYI1k?=
 =?us-ascii?Q?nhGkGa/dCYsYmMBT1zQl4kEnW2K9KJtSovpw/70s4XRHsgY/ph76q/Ew+s09?=
 =?us-ascii?Q?RqEEepun4dl9wQOlsi3XQWQp+bWkw4AvIoZYt49L?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a95ec1ce-aa0e-4fc4-6ccb-08ddc2c095da
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2025 10:24:15.9498
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SICFdxUHB4KYhQtSHbxN1syys8785BSPbu7xGv+Vzmi1OzOzY6HZsI9O+iE6eh1X8Hauz0AgaQr/hxDxIcpNsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7258
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 10:24:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220222



> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Hiago De Franco via
> lists.openembedded.org
> Sent: Saturday, July 12, 2025 3:56
> To: openembedded-core@lists.openembedded.org
> Cc: Denys Dmytriyenko <denis@denix.org>; Hiago De Franco
> <hiago.franco@toradex.com>
> Subject: [OE-core] [PATCH] mtd-utils: add optional systemd service for ub=
ihealthd
>=20
> From: Hiago De Franco <hiago.franco@toradex.com>
>=20
> Add support for deploying a ubihealthd.service systemd unit through a
> new 'ubihealthd-service' PACKAGECONFIG option.
>=20
> This change allows systems using systemd to easily enable and manage the
> UBI health monitoring daemon as a background service.
>=20
> Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> ---
>  .../mtd/files/ubihealthd.service              | 10 +++++++++
>  meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb  | 21 ++++++++++++++++---
>  2 files changed, 28 insertions(+), 3 deletions(-)
>  create mode 100644 meta/recipes-devtools/mtd/files/ubihealthd.service
>=20
> diff --git a/meta/recipes-devtools/mtd/files/ubihealthd.service b/meta/re=
cipes-
> devtools/mtd/files/ubihealthd.service
> new file mode 100644
> index 000000000000..74b8df655b5c
> --- /dev/null
> +++ b/meta/recipes-devtools/mtd/files/ubihealthd.service
> @@ -0,0 +1,10 @@
> +[Unit]
> +Description=3DUBI health daemon
> +After=3Dmulti-user.target
> +
> +[Service]
> +Type=3Dforking
> +ExecStart=3D@SBINDIR@/ubihealthd
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> diff --git a/meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb b/meta/recipes-
> devtools/mtd/mtd-utils_2.3.0.bb
> index 47f0b01abe0f..d99a1d5c7b70 100644
> --- a/meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb
> +++ b/meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb
> @@ -6,7 +6,7 @@ LICENSE =3D "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c317bb3 \
>=20
> file://include/common.h;beginline=3D1;endline=3D17;md5=3Dba05b07912a44ea2=
bf81ce409
> 380049c"
>=20
> -inherit autotools pkgconfig update-alternatives
> +inherit autotools pkgconfig systemd update-alternatives
>=20
>  DEPENDS =3D "zlib e2fsprogs util-linux"
>  RDEPENDS:mtd-utils-tests +=3D "bash"
> @@ -17,7 +17,8 @@ SRC_URI =3D "git://git.infradead.org/mtd-
> utils.git;branch=3Dmaster \
>             file://0002-ubifs-utils-journal-Include-sys-stat.h.patch \
>             file://0003-ubifs-utils-link-libmissing.a-in-case-execinfo.h-=
isn.patch \
>             file://0004-ubifs-utils-extract_files-Include-linux-limits.h.=
patch \
> -           file://0001-Improve-check-for-GCC-compiler-version.patch"
> +           file://0001-Improve-check-for-GCC-compiler-version.patch \
> +           file://ubihealthd.service"
>=20
>  # xattr support creates an additional compile-time dependency on acl bec=
ause
>  # the sys/acl.h header is needed. libacl is not needed and thus enabling=
 xattr
> @@ -29,6 +30,7 @@ PACKAGECONFIG[crypto] =3D "--with-crypto,--without-
> crypto,openssl"
>  PACKAGECONFIG[jffs] =3D "--with-jffs,--without-jffs"
>  PACKAGECONFIG[ubifs] =3D "--with-ubifs,--without-ubifs"
>  PACKAGECONFIG[zstd] =3D "--with-zstd,--without-zstd,zstd"
> +PACKAGECONFIG[ubihealthd-service] =3D ",,systemd"

This seems to be wrong:
1. depending on systemd is allowed only with REQUIRED_DISTRO_FEATURES =3D "=
systemd"
2. the recipe build does not depend on systemd

I believe that you can just leave out the systemd from this line and it sho=
uld be fine.
Systemd bbclass will make sure that the service is installed/excluded based=
 on distro.

Peter=20

