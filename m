Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17482CA0ED3
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 10:10:08 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.6])
 by mx.groups.io with SMTP id smtpd.web11.35391.1725271798447490122
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 03:09:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=JPo+gLmU;
 spf=pass (domain: axis.com, ip: 52.101.70.6, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XiUlHqf5vxseIl9eiLgxUgsRK7i7S0pRn4SPUm5cVcBOGftllN0oFfr57YKEvLpvJoWlgsYBazf9tZgr4pKonQ21UEIk9i7P5RwcnMgLInF8AFM9QHuJLb9vtMpj3SkIfbV29Up8dNA2Jk7L7xVQlUD9xZyDhP0evZ01nVk3CoijhJAXaO8isrbsg6Rsb8Fjiz4mQdplRxExoEYWTe5L5//hDmVbNQWz3Dm5hun3UjFc872z06fKYqoOxj0Fjq159mX45I6Ps1D9NTdLOSfZnOEy/TiO+6v7fNKpg8e3IBi4aycAsBEQMctv6A+gxZhK/XvISpx0hmeuh5PGRtlkpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AeTnL4Fvlqa1xigFgdM5blPDjnxT1Nb/4RAkh8Qbcr4=;
 b=rqR6fjHlRhtAzaKc/iuqCP+ugafOP1PdbL1e/p/lZTT0f6NMrQFXyWmVQB5ngm018Z1jqTbtfk6Gh7RiR+J2yjtTxzrP8GWRfpjIh4T5sH57tks6UTjhSNd0xL686Eq3kG5EH+OIfCHalGCLqLZRu7aDm7miSMB7ECq5IygQWgKpfiLBZRYvmbF2yRyd+m6+26kmCEyGE0fd2bCXJQ/m9zLgosZnsEyJzYog+NnTlr7/agWBGZ5kLe5pBLDitqh6WU9178j0EawIgGdY173hnjIVkssrbXa9Y/kbSJ2Ly3968+ZztFENAYJy+jgCHfcqmio8TAcCiF2QLEOIe1nzYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AeTnL4Fvlqa1xigFgdM5blPDjnxT1Nb/4RAkh8Qbcr4=;
 b=JPo+gLmUrT8SYCAlvrczQhtU+bmjPQaXE5ZVHBDDxPh7yvJ2nFJ/ZR6eeJ+GyDQc3BpeeMiS6KYaOpFkY31HqMKXFesbj3td7moDhDh48U6n8HDMwI0lB/A+gwGjLU1ntEhWKCinAMWC/fQ2UNCkDWjI52kH2LMgdTH1qYRPEpk=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AS2PR02MB9715.eurprd02.prod.outlook.com (2603:10a6:20b:5e8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Mon, 2 Sep
 2024 10:09:54 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%4]) with mapi id 15.20.7918.024; Mon, 2 Sep 2024
 10:09:54 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Mikko Rapeli <mikko.rapeli@linaro.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 2/3] bitbake.conf: add getopt to HOSTTOOLS
Thread-Topic: [OE-core] [PATCH 2/3] bitbake.conf: add getopt to HOSTTOOLS
Thread-Index: AQHa/RxcR326byJlKkqhlhWiCPd1ZLJEReUw
Date: Mon, 2 Sep 2024 10:09:54 +0000
Message-ID: 
 <DB5PR02MB1021356397EAB4F11F18E3EE0EF922@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240902094117.31156-1-mikko.rapeli@linaro.org>
 <20240902094117.31156-3-mikko.rapeli@linaro.org>
In-Reply-To: <20240902094117.31156-3-mikko.rapeli@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AS2PR02MB9715:EE_
x-ms-office365-filtering-correlation-id: 3b9d65a5-0908-424b-bd2e-08dccb376410
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?YoyJiTf7L+XLZNBMM3WIzi+q3M6FStOIUhhJh2ScM5D6+giPrUmlpvDxUb/i?=
 =?us-ascii?Q?9vVgrAuyBSgY4Wx8ZLJce63XhsD6bXHdthgoVVHpchEyS/lRJIkPo0V1GQWJ?=
 =?us-ascii?Q?XI6gK+yMkqHCfQIeJnVowE1g3hKgz+QzEdsZqjVTK3RplDdTdIkXhV0am/Pi?=
 =?us-ascii?Q?lml3Ma7fD30Bj81kT4jutEn+gn2P2+7ekaflZ/iI9iVKR+Nv4ztGVV94zcXo?=
 =?us-ascii?Q?OWNYFozaCjGJFiipkxQhE/xOlqKWRlleOWiD5K9Arbl61WLpYECwx4RwAhqA?=
 =?us-ascii?Q?ksF6aBpZTMIDjuKrI0/sbmoQPLZgV2ipflj76/jbwaPaqvHtXhmfVPCoQyGi?=
 =?us-ascii?Q?JXdMWTLDMwGoKFVUqp0lvFCQQxgt65+nEbkIy/rcDFbWcnaet7a9Q8kngCgf?=
 =?us-ascii?Q?+OD+aYv8mvyURFAVbHUFCYGl+aDhiHgi6n1J8eswW0xjn6D/mO2ktFqgyXsA?=
 =?us-ascii?Q?Ds30GgzH/WriB9DmSQSB2ioRmGj281jmlHb0FIAmDqJ2+8CLQR1OA53Gn85N?=
 =?us-ascii?Q?w2ObsjKo5DmiI1WJQhZuzZxUjbxyEo3Y7acWf1br2mZBK+2Slj9W1BGUADXr?=
 =?us-ascii?Q?6T3qBdyDWo6B4ou9Kflvs/MQr9A3wgc2DnBHBI5ol57hXtlyIZOUq/+szwrF?=
 =?us-ascii?Q?lO+QlQp3wBqOqLoQ59C+99j1wzArJ841XhMRWxoiZWpPSEKzGRxxglz3WU/j?=
 =?us-ascii?Q?sSO7NSX1xays6F/pyDke1BM87Cq+cHuiY4LL5Tzi6VFpYjaYikIOjkTAv/fR?=
 =?us-ascii?Q?PPs5ScuEci9RqCj0hOEBWy8t3ID5OekYEbwR3qGO7AgeidwhklrkF0X84W0a?=
 =?us-ascii?Q?xasxL+6ElP3N8mMW8WvyFkMupWtpMjCcp0/UboLXwr6rt1L//i0/Yfc4Nlhb?=
 =?us-ascii?Q?DrFAXolc7NCWttjcMaxLJy/g80GNvEi0LD53Df+2Vy2OYUymgqCGQsvamfJF?=
 =?us-ascii?Q?EY52YVBKRwKYSFooDhOkQ48IZUz7lxPpcHuxMq+kZgEdgwZoN435nRE8wr3f?=
 =?us-ascii?Q?4v23DRJ+0hHAN2UK09xp2ETVGFjgI/oP539ctI15tA+lOiLq4kYsTkkrSipK?=
 =?us-ascii?Q?EpW1kYbxkY9moZS6M0EFGQu/kwFYYcaDTtn3nfLxURbQkPyD0EHervt9qi/r?=
 =?us-ascii?Q?PxcDi7SkksrVXNheNCVg3giQRaYKkgzNMC0ja4J/BZpOjQpf7kvqQXE8aR7/?=
 =?us-ascii?Q?vdxFgPddXsjXy9ceey76Ldx0XXoR7zSUKoNgnVam4yy41c346nZzuZis8od/?=
 =?us-ascii?Q?xSsOl0Q7Bkkkec68WxuAZ+yOCvUOXr1tENNRANUUmZFyYcZM5egcFBerLZOI?=
 =?us-ascii?Q?ovoT70GZuAtVw1p5TSktIfeJbcdjjh+GGI6BjcRgkCbzaq7EpQ+Nio68IgFR?=
 =?us-ascii?Q?Fn3ARRYzI32W1s7EeOIS+x4qPlwMgiyd4/Ica8DM9/hBQdkFJg=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?ZlJ5YCBjwHq2TFF+R0RcsmJ6idIaZxemxuPup99rUc1qaNVcgzsHO0mfKxJ8?=
 =?us-ascii?Q?arvnjf+6FA0bQCbr4tu7rT0D+dX+ye5lgfRw82kySbtrflwtWtCpdR+gi+KT?=
 =?us-ascii?Q?NHarRq0FxkN8sQcQ4/6HZ6zQOj4mtgbjzWSDBsWdASVjUYye+Xh9YvMzf35L?=
 =?us-ascii?Q?F2boCVkIolar9hVgffEIcQUqFZQKcjp5dXuRrb0NnPBcyZm9p6KCZQMh965w?=
 =?us-ascii?Q?X/KMEIrbmivSpjh+S3QUj5DGr3Ea3oAQS6hMs7ovbDgozrgdGDKdWnrGuLah?=
 =?us-ascii?Q?GJFm9veXTuG5Ys9dVVRhpFz5VUPhEnmd78GRFXXfkM708ClZo9f+BXINK5E8?=
 =?us-ascii?Q?ujBZwjMsdiG0k9Hq4S5pzpJqqIQdb+CgqqrRy02SDfz1D0+iv1X6Xh2HwYdP?=
 =?us-ascii?Q?vMSlLcW52HQIgQuEmK8B/b4UrfusjxjZXMJV7HFV/1+i0/eHuFKmjvbjns09?=
 =?us-ascii?Q?AuK9Uh25/j6/EzEWj0aiigON4mxPo/ClwNKfOiQ71EgTcfjM9eRXtdAVxQA2?=
 =?us-ascii?Q?EOLWLtbI7x77fIxFp63Ww9oNxKoBjq/NguwpQwlanGFI7m5hKOl0bY5dcKeL?=
 =?us-ascii?Q?WScWEWGJHYYziFNQOGv3MnoGarvB0UZk4m7YVTiiVfe1oSbn+m3AbPFkTsOE?=
 =?us-ascii?Q?750MrIiJih+lVMreyYC949AyxFet1LHSA0jrqHeNAjANuyQctTWQJ88H06NI?=
 =?us-ascii?Q?vMJoO7SalJKMzbtnfU6GRXnMyMWDURGJ1Zard3B7KFO0O8eWVQ3sg1YM7A7C?=
 =?us-ascii?Q?aKPGSk+zoSQi9okD5ckoBv3V97GSgdmVNW26YPkXGb3kXf1l7W6VizqIc9uR?=
 =?us-ascii?Q?buk7NgKYWLhPmnmMma5F8L0rZdvKI7MlwbZdcg4qhOpAoH6qXdd64BIrwEAw?=
 =?us-ascii?Q?MmYqmb5ZcK6hLT1QTxrZyeqgEUp4IX//f1p2TWlGCSNAHJ6sjH5Z2VLVn501?=
 =?us-ascii?Q?eKXzkda6VqgOVJEfW3gIdm9YTojbytfd0n3IthnSLntCyN2RraKNmvv6/XCW?=
 =?us-ascii?Q?BqIR/9gHO+sJFmZDbxFB+u3EbRGduoDmQRnTPiyym2ZUZvffaydv8Id1WHxJ?=
 =?us-ascii?Q?DHEL+b03uDB2Uc24j3CxnATGwCWHXovG9y1YHgBiC8+TYdYmrzmtE2S5BXrH?=
 =?us-ascii?Q?kqhttHeeXqFocAnb/VIrkfNHZvvOOdNGwibuXB/qgjNk3+RKYDjzb0sH4YWK?=
 =?us-ascii?Q?fGRmptrrvusYDy8//pQCtfPJL5j+ZoWEya/YaR5zz57E0LQukBrpThD7PmKR?=
 =?us-ascii?Q?U9ZhKzlS7jBHLC2DWIhxQJCudKnW52AAS1AWbtGWQc7HBB54VBfMM8F+j16n?=
 =?us-ascii?Q?w8mbNKuZfU2qqmpff0TI8iZZPrhsA8Ro7PcUiCBXHziXk9/V3Anxy/51w1Zs?=
 =?us-ascii?Q?SybJLN0tTXx/8iGGBOLWQwV9+QCvQUeN/VRsaci8U5vOFnkdU2xaFODTtW36?=
 =?us-ascii?Q?uH4RsiZeTIHcLBy+vP4ev92w2r79Xj5smacC7GxEOgkgcOEsOvPKpaxe6mep?=
 =?us-ascii?Q?xltQ6eMdWEqmjNY4WbQqcV8a1YuP0aQjcF2XDvZguKEjk+UGrpODdABXdsHx?=
 =?us-ascii?Q?eGgbJECsVO7FmnV4SUM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b9d65a5-0908-424b-bd2e-08dccb376410
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2024 10:09:54.1040
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a1nkHcSc7bDGizRkYlioE+XiifV+1RDX2PHUY52bKW6Sd062T4ziZOaYAiTE3YXV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB9715
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 10:10:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204070

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Mikko Rapeli
> Sent: den 2 september 2024 11:41
> To: openembedded-core@lists.openembedded.org
> Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
> Subject: [OE-core] [PATCH 2/3] bitbake.conf: add getopt to HOSTTOOLS

You are adding getent, not getopt.

>=20
> Needed by systemd-tools-native
>=20
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index d8252c5b82..a8c630e7f8 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -511,7 +511,7 @@ HOSTTOOLS_DIR =3D "${TMPDIR}/hosttools"
>  HOSTTOOLS +=3D " \
>      [ ar as awk basename bash bunzip2 bzip2 cat chgrp chmod chown chrpat=
h cmp comm cp cpio \
>      cpp cut date dd diff diffstat dirname du echo egrep env expand expr =
false \
> -    fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gz=
ip \
> +    fgrep file find flock g++ gawk getent gcc getconf getopt git grep gu=
nzip gzip \

Keep the commands sorted.

>      head hostname iconv id install ld ldd ln ls lz4c make md5sum mkdir m=
kfifo mknod \
>      mktemp mv nm objcopy objdump od patch perl pr printf pwd \
>      python3 pzstd ranlib readelf readlink realpath rm rmdir rpcgen sed s=
eq sh \
> --
> 2.34.1

//Peter


