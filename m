Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 383D3C5CFEB
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 22:11:11 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9062.1771625464595820669
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 14:11:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=VDAhJYJn;
 spf=pass (domain: siemens.com, ip: 40.107.130.56, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aiAzDIiF0odb+00t/1daTNPjI+No9Ut0P7NshZ2tmZ1bgoV4TfdoeaGVSJ8PteWRkz1nsLc++sdTyd/NqBVWgXtDCJtt/q4A+3dUjHrSuXWTk2WpUEDIznHaNQibt01uZX311+HCX7tmRDbo84/Plfh201KWekX65QwkevFJddgj/mGeUlnaaLRLkE7o8uO/eq0z3gbQPv0qjYUtcR3LxRu2w19iWCiXFdjR/KPWgH53DnXbQcJPCjb63xvEYZpFnhDG2+FBtW+uynfPz/vwWP4QrLhKp0kJrsywNzWrbfuNfLZcFgbX+HqwLcSFYtNKGvyOziYDEqiXDdPuqlee/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jvFMJ77B7GLLeQQzdGdwSas9mCjIfLliPFQeVCYY2QA=;
 b=LHHHo82PzIWQhHLOP15nv8JAuBRL0M3dEQBnU6mpOQGq0Zh4XRUoR4Hl9GQeypIequKSz4+lsziz2Ku5mEyXryOjZWg3hmarmUptiNQhOYSMuKRC42Z5XcrDAMACN1Z8fyzj318N/ftoaoFp2JE3hSuKySwfRIHQn4IJHwnX6ObkcsA6Qslb4dJKEeS96oi4OnpCZG8wC57Eo1ObX35KwlygUdLY7vdyMKvLcItfI5OsIvobfrQqFT5DVfB9AOHwM+MMozoqk2pqPiMPUBS0yvN0chdFwPf9uIhqZ0j6pRibjqFl557qWqqt8jZ/TRZN6ycd3N4zhVTsKmLPtGwuAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jvFMJ77B7GLLeQQzdGdwSas9mCjIfLliPFQeVCYY2QA=;
 b=VDAhJYJntE7UURzVZO8gRvGJ1cWHZsyXpQMekuTbnHXdzORQCGKbtteHfMeVvXf4rq8hjY9Hw1dqopiTq7rZfcqEja1SjAFQ82/sYp6ag2LWB6Z/ozHIuWPXM058okG3mskN6jkIBlR78CFodOUiEGW9bUAKawXRbg4A5t0Jj+P+YIiNQq+yBOri6uBfmDRqBxrOWmI2El+RFCL2Z/rqgycsjYVlfZGE4DtvzEFIjF3tfgD6/KEiIEM8l0XUz6FZBhoiVGt9xUfgEhKMZwuGeFr5zN2BYmzTevnzNNhrxkZfmGmuDOBwhFw5OofsOC0ZnpV7/BuwWXOAdO/IeSXsiQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GV2PR10MB6041.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:ac::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 22:10:54 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9632.017; Fri, 20 Feb 2026
 22:10:54 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "livinsunny519@gmail.com" <livinsunny519@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "JPEWhacker@gmail.com" <JPEWhacker@gmail.com>
Subject: RE: [OE-core][scarthgap][PATCH] busybox: Fixes CVE-2025-60876
 malicious URL can be used to inject HTTP headers in the request.
Thread-Topic: [OE-core][scarthgap][PATCH] busybox: Fixes CVE-2025-60876
 malicious URL can be used to inject HTTP headers in the request.
Thread-Index: AQHcorMMSRyB1yFtV0eA9FXDZiw7bLWMI0Wg
Date: Fri, 20 Feb 2026 22:10:54 +0000
Message-ID: 
 <AS1PR10MB569753F708B9C4394056B224FD68A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260220215043.2883581-1-livinsunny519@gmail.com>
In-Reply-To: <20260220215043.2883581-1-livinsunny519@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=675807bc-c851-42fb-80e1-efd50ecb161e;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-02-20T22:00:32Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GV2PR10MB6041:EE_
x-ms-office365-filtering-correlation-id: 96987217-c0c1-4fc9-0c0a-08de70cceabb
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|15866825006;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?Qu18uJW5BJsC0sYKTqAe3VQboSZi85A7iz+T4yQKnaZ1MGMymE5bp7b38iaw?=
 =?us-ascii?Q?wzbOzjlrs1WddQnXmMWqDPJdZipjRjo2I7uuotTXuJE825hE+Xnz5d05Do5B?=
 =?us-ascii?Q?IVGsKDvVGtKba/i6l5Mlk25d3zQAVQCYIsyRAb8xlJy7wPpMk4dcfhdXmTx/?=
 =?us-ascii?Q?yHZOzws7K9QIClwFYBPsdoXfguK7o7M7o1f24DfMR+jgLMAqyxSnxF1v3Rus?=
 =?us-ascii?Q?1gwHNNcKZpN4oyssIHsE7nvrS6mW5sAUDkgL7Mmg6O8HC/s5a+DzDEbtiuSa?=
 =?us-ascii?Q?gIexFpM1t93MeJMeeKQJk5tgWwFgdM/FbiEE1SuAF+3HW496Oab/XX1JcWGT?=
 =?us-ascii?Q?z6EFetDWsPOxu/0y0EApl2fdF4uwBAeKI1R5CHZNfSZmhBQxHOWjm7/sAu0P?=
 =?us-ascii?Q?kkJOdB8Lxc2VGu11hy5xD7csscvq3dFzIK5M6GE80wCEE8x3ffCnPv50ikcM?=
 =?us-ascii?Q?0gn6p9F0EiZyOYYWOR8CsgzTJJ8sbsghhHM/EUI6XMRIOQc9RIZNsH6wjWOx?=
 =?us-ascii?Q?bJwJjHe1J36F+4gWHVeZdtpxSEvP6ELZkMVXdMdDxgHnPlVddUIUNzkdk9VR?=
 =?us-ascii?Q?AwIE6KPMv6OaFQ87pp4oVt4aV+u7SDwyPFRLbPJHU0eaAyCYAMxwz4vbUJlB?=
 =?us-ascii?Q?2/eDbLKmq5HZ9FuN8niiLYLnW1GpNOHwCFqKcah+NSmGgVG53TPb54dxXSd9?=
 =?us-ascii?Q?87kisBTxcMj0Ambww4enkPnWBNg4vMckH6kKZBeO0q/bFH5n4ogmTSVtTaLq?=
 =?us-ascii?Q?bYyANQouEDW/ihr03L+87kXm+FoivenqbgYgbO88pzDP9xqIpL3Csknjry6N?=
 =?us-ascii?Q?A129XDppQIcOApnwZ1MtKS5x0XhKFHEMpOHPvo6s++oZRovjfmR1HGZUq7Ck?=
 =?us-ascii?Q?gD96f/OkJf+BkPJAWx08y4Yw2KRyBYWBlOEg23M2xaT3ig2bX7E85sEL3T9I?=
 =?us-ascii?Q?IB7FO0EpOMbCN+AMi3lIvBV0wFA5Hh/8L21qh89ZgI3iPGFrNvwhTMLPuvMF?=
 =?us-ascii?Q?hkASN19VzWRcPZxjWyRMd/wLFtytmx1oZLQdh14xzi6210m/TbqOfcxQFt/s?=
 =?us-ascii?Q?fmE2k1xLT+54KN5DKOxpH8ohBz9Q+PAx5VmTH1pd88JyYmDHFydhyLypcrSq?=
 =?us-ascii?Q?wJ91ysbObk93xtsz+lKiz5l4lUkV2xwX88maFmox+vXo8UqpPjibpwTzxuyx?=
 =?us-ascii?Q?bb6+5cy6GKqcaGGNv4A1VnVj6RD16roN5v86iC3yR+k6YePNKT9iUgUZqHya?=
 =?us-ascii?Q?MpVXcFy2EPVdcPad2DHkFnfp3y+XULB5rKxU4CpeGZhRwmXQngUIsV+3fyoV?=
 =?us-ascii?Q?8C9lJMO1Q1Bw8/9JhHy6YLGtpddOCLkUpxnTFIwaHf3nfkQ19jSl5aWOWvOq?=
 =?us-ascii?Q?7wGDacdS7hYwz4/4OtvSuWKaqw4rqumTcS8OPFpSpTQvFv25fgMrhWulOWsc?=
 =?us-ascii?Q?IQ8wDZrHSL/lQ71Wt22lBBy2+rcRz2eIRYWo5dzra6BZaiO5HWieKtPqqrqT?=
 =?us-ascii?Q?67+A+T/PhP0rZ8qlGWt6ieXbrdP8xCBcO0Odyliq7ngsLBXqXjAyRoEzMFdb?=
 =?us-ascii?Q?ixkum+HwtjrBADG9pC1Z9yN/5a+hymOkA8KVIrFXZJCojyRAeIwuvYlF3uIZ?=
 =?us-ascii?Q?2w=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(15866825006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?iZH0hWTpE+kTmt+BksqESfVwbAw6LEJtqSDnQ1lNUQL4lvTYBBngDEtia1MA?=
 =?us-ascii?Q?wKSf1HsQHImgQ/pBprGznsFq//fVI5ObDvzCW7rIjvBV8vN1yJx0bWlSly1A?=
 =?us-ascii?Q?W7LiDwVqcq2cBD88wJuidRLQU62J94USrOykeaX5bRJcOzrX9bpuoKMzgPQm?=
 =?us-ascii?Q?Nzj6n+BZ6p8M9oP9FLKaT5g1zYfz3cOjYvm06zEDZNPgzmkr6931vm59C6DD?=
 =?us-ascii?Q?+DVIc6cVLhhd31B1eYWCou+ZxlAjQmoVeFDETH+U3HXaIjz0ozrCMAXaRlkP?=
 =?us-ascii?Q?hTU0ifJfrNAWck29e5fLuXnpkcqAd+stwuzIXpYY5M6XHlq9q1+T4krMZP1w?=
 =?us-ascii?Q?zIuXSbvLjhgKs2obVRuorvHt5+TPMcSjsMS8wAsCEZ7S1sH5HpD+20gvke0x?=
 =?us-ascii?Q?IOMrLRgadfeHS1nQ3yT+rLcTCg1ELP3YECf49xami1N6iaDb9DI2ar8YnJbd?=
 =?us-ascii?Q?FFnX5kifC5rgdRkCOWvMVzNcIlSHLDXgS3UwPIQOr4BRDXAqKJ2J+oZyGpa0?=
 =?us-ascii?Q?85Y0k/f96PRUJrsY7xqHDOq3rH5DFcPLSnBbfaQyVTLHzpUGXYJ8tb0xA0XC?=
 =?us-ascii?Q?vfokzcBrfwW2oH9jxlCP6aHSbPnBpkLPIxJUQJdWdStPM85F6E42kYB2wbTV?=
 =?us-ascii?Q?z0tmQxEPsD03rYvw329FVufnkuOGjX6AqzrT3NWHKQO3SacQulHtHjlg4vnD?=
 =?us-ascii?Q?fCHtkhw9PlHT24tcpUPewMdc5bXNnjNQ2TDhf29WuqMHB3sakZkJOEOtLbF8?=
 =?us-ascii?Q?Bq2hOFOlMsaU1Vhg4KIK/Sy+8QXGvpDH/sgt8SbBEV6r9pOhmFlc6YiMaGQr?=
 =?us-ascii?Q?a3WJrD4OF65fNrKJh+QFEX0tL4XyPnaOM7RgVZ0hBaLM9er8GVh4ehe/2TQj?=
 =?us-ascii?Q?rzdVxoqRmW/bkmVhUGbeTpSi0gCdCNBOzVQgF92mU9G5x9ugx5KKRr2GrV8f?=
 =?us-ascii?Q?vgKSNTbt10Bd4ZTtsM83Np0bCiPvl1sGvlYUSEfIKB6kOcu0nJsuW4xhcRPF?=
 =?us-ascii?Q?5JjLip4/pzhBEx8T7MYG5+kKXVu0F3HcXsSs2RYa2EILBc/qVZFs7HprTNhp?=
 =?us-ascii?Q?0mn4SF0t3uDbmiTsFDT1pBZ46vGG/uQ3fq3ape5N/KgL1tOMeAIpTmiI3qxZ?=
 =?us-ascii?Q?QthwT4JHVsaZ5xIsPMwf+5S9F86VFQ9SP3B0gJ1HBJC9T3Miis43bvs58/Jy?=
 =?us-ascii?Q?vu+pKl1i3eMX6ReH2mr0+tHUshn50PEy4gQ2k/hv2fXMPndFuEgv8n4/2OH6?=
 =?us-ascii?Q?gf4wMBfIU2BJmQi4XTzv92IV9WkcsYR8D/8TbXHXBMDPY6aOIOn8lw/YYsEj?=
 =?us-ascii?Q?dSYIpUSAS93AaiYCp/urRjad0vVbEzhfdx6puoC3aCVc6Ma9+m9enOu1OjEB?=
 =?us-ascii?Q?pjNjv+b3/8yy4Z6LgEdkxjfbtPhcNdb+Hgf04EzmAs9xqR5tR7P6f5yLiR0G?=
 =?us-ascii?Q?knuVQwPCF+BB0/AdvY+2X1ub72wYXTu6rI4gguE+lXIBMC5BhB8ldBDF6gb7?=
 =?us-ascii?Q?NaxGFRk1FxgCxviLE+mLqE+YOYRW8y6j9Z32OwjGQVUAkHALsFMwyg+R88/E?=
 =?us-ascii?Q?Dfb6aF7z5A/K/DeHMQZ63Dr8MQKpKaTptwvT8EPpO+hY+p0bTzZL7NNdOwRT?=
 =?us-ascii?Q?KQ9W4Jz96ck3WptXatZmPOIVQz56QL+2om//6OiwtQz9ZkXFdCtqSpvnkMYO?=
 =?us-ascii?Q?uNW3d0XvJhifoZavZKfMnENii/FMicp9I6tQfbp/9i8UBzXSY+2Eu8LQPbIN?=
 =?us-ascii?Q?No07jXbCbw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 96987217-c0c1-4fc9-0c0a-08de70cceabb
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2026 22:10:54.6504
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QlmH2MWtCHm++h6TkkYyWAG5zGoHlLiKjZ/cUAeMUM3Z1pDN37+Kt15lHCXZxkGXh5uZpUWSVmrHBGXp+F5Tig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6041
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 22:11:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231554



> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Livin Sunny via
> lists.openembedded.org
> Sent: Friday, February 20, 2026 22:49
> To: openembedded-core@lists.openembedded.org
> Cc: JPEWhacker@gmail.com; Livin Sunny <livinsunny519@gmail.com>
> Subject: [OE-core][scarthgap][PATCH] busybox: Fixes CVE-2025-60876
> malicious URL can be used to inject HTTP headers in the request.
>=20
> This is a backport of the fix from [1], which has been submitted to
> the busybox upstream project and is tracked in [2].
>=20
> [1] https://lists.busybox.net/pipermail/busybox/2025-November/091840.html
> [2] https://security-tracker.debian.org/tracker/CVE-2025-60876
>=20
> Signed-off-by: Livin Sunny <livinsunny519@gmail.com>
> ---
>  ...control-chars-in-URLs-CVE-2025-60876.patch | 42 +++++++++++++++++++
>  meta/recipes-core/busybox/busybox_1.36.1.bb   |  1 +
>  2 files changed, 43 insertions(+)
>  create mode 100644 meta/recipes-core/busybox/busybox/wget-disallow-contr=
ol-
> chars-in-URLs-CVE-2025-60876.patch
>=20
> diff --git a/meta/recipes-core/busybox/busybox/wget-disallow-control-char=
s-in-
> URLs-CVE-2025-60876.patch b/meta/recipes-core/busybox/busybox/wget-
> disallow-control-chars-in-URLs-CVE-2025-60876.patch
> new file mode 100644
> index 0000000000..aafd0ec60b
> --- /dev/null
> +++ b/meta/recipes-core/busybox/busybox/wget-disallow-control-chars-in-UR=
Ls-
> CVE-2025-60876.patch
> @@ -0,0 +1,42 @@
> +From: Radoslav Kolev <radoslav.kolev@suse.com>
> +Date: Fri, 21 Nov 2025 11:21:18 +0200
> +Subject: wget: don't allow control characters or spaces in the URL
> +Bug-Debian: https://bugs.debian.org/1120795
> +
> +Fixes CVE-2025-60876 malicious URL can be used to inject
> +HTTP headers in the request.
> +
> +Signed-off-by: Radoslav Kolev <radoslav.kolev@suse.com>
> +Reviewed-by: Emmanuel Deloget <logout@free.fr>
> +
> +Upstream-Status: Backport [https://lists.busybox.net/pipermail/busybox/2=
025-
> November/091840.html]

This is incorrect statement.
It's not a backport, but only a submitted patch which was not yet accepted =
by busybox maintainer.
Similarly, the commit message also wrongly says "backport".

I'd also recommend to mention in commit message that Debian has taken this =
patch, which gives it some credibility.
https://salsa.debian.org/installer-team/busybox/-/blob/debian/1%251.37.0-10=
/debian/patches/wget-disallow-control-chars-in-URLs-CVE-2025-60876.patch

Peter

