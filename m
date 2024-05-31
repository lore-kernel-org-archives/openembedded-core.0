Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDD3AC25B75
	for <webhook@archiver.kernel.org>; Fri, 31 May 2024 07:00:03 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.81])
 by mx.groups.io with SMTP id smtpd.web11.5700.1717138794476838298
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 May 2024 23:59:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=qJb77p11;
 spf=pass (domain: siemens.com, ip: 40.107.22.81, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c/OuqAiAKDWCUtOGB7e2b0cNIG5CxMnQ2/kbuZrTBUQHgtndavHSiBCQ5243CgmH3v6bqmg/pOKk8LlTxMny+LMiVIFw/QC52NQ8HnpfjxwaaCd6oxj8YUP2y/vaGEzr81d3YD5pxGWVA0BDiHxINv3Te5eELInfMX/TsKj7IxTmDvEPkKxDWEA3chSinEgGgqCoQqsBav6fGtKsDbT0EfOt32HVix7ud3oWjd+RPTj2mIi65iiyo4/rmVPmocyKeR4vTWEbWWC50E44Z+HeYmJjYPik009vBA78qNkpX/+YQ0SvbKDeFGbWmIPfI/zDAv1JseQ3qhV4ZfcGwxq5hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WKDVRYcZwCZItq2oradektJMiNbWE/p91zkWO4rl7qI=;
 b=YiPkl7wm247vDzV+B3tPLo2cQb7IK25rtw1AQUZ5gIVN2prY4h0obr2nYUUfK6tCdj/p9L0mUuzu6ATpHHU5GoF++AHr/ozjt9Ex1lYU4Yt9zRhqBkROfPIhHZRwF6oDFPfbtUglm5j61LXypWB0+H7ty8DD9S7GJylqlqUdRiWXhnHhROtp0fcZ3sIPdEUxtm0gcciz7lC373Mwgw/RfIT7YPaHFAWbM+Jio1jLSpCf6Gmrp7HmBFheZkbFtoDgws1OdiedLhKg4HNhzUlrs/gVEbcRcABoAq1C3laFE8HGQft+dimaUk2K5XS1et4tozNWx3S6K4/KS/TmFFCmUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WKDVRYcZwCZItq2oradektJMiNbWE/p91zkWO4rl7qI=;
 b=qJb77p11ML4jl7/BuPf8t8qo0QH5uSdeDdaewDOTxvu/QYcGf9wsz9lGR6boVxLPwmuJp/KGMf8wrWR1FcA/Oh4q2+zl/ppEOzFjIeRTGgdPZGSDSU6N7S+pLf7XQ3E5bIhnHL6xvFHJaEt9m9Wh1WcB8bFg+66G1s88Ln/9dJZR1cfwNHW251PqrGMRSh6eGfWyJFkjHNBAN/fnpGmunr54fzOQurMqCciIhR+auaR3g6CFI3sFxAKai8lw49IiBmzvbqDrSA3XpHH24J5W1Kyjlfnp7S+2V9+kKudTKtw298tLeAe/ulkK055zwBLZ1/QQdUTLJ+Pfek+sDzFmgw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS2PR10MB7177.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:60f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.23; Fri, 31 May
 2024 06:59:51 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.7633.018; Fri, 31 May 2024
 06:59:51 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "bin.lan.cn@eng.windriver.com" <bin.lan.cn@eng.windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Bin Lan <bin.lan.cn@windriver.com>
Subject: RE: [OE-core][scarthgap][PATCH] opencl: fix virtual PROVIDES warnings
Thread-Topic: [OE-core][scarthgap][PATCH] opencl: fix virtual PROVIDES
 warnings
Thread-Index: AQHasyQO8vrcc3oW40yctw21mwmlW7Gw6WSw
Date: Fri, 31 May 2024 06:59:51 +0000
Message-ID: 
 <AS1PR10MB5697A2B6A2AFDBFC2E5C5D4AFDFC2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240531063027.2050793-1-bin.lan.cn@eng.windriver.com>
In-Reply-To: <20240531063027.2050793-1-bin.lan.cn@eng.windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=873e61c2-1d04-4b1a-ac6d-487ef2f6e3b6;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-05-31T06:57:43Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS2PR10MB7177:EE_
x-ms-office365-filtering-correlation-id: 260d10c4-ece2-4f63-4fb3-08dc813f449a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?aMc+TYi5KJvx8OLOzKreFaJE00u2u+dfZkraVYY8kpu9NhoL5GQbB0mBcxEu?=
 =?us-ascii?Q?5RA/YDb/Sh/QHhBMs8T38l0cP1ol5K+z+Z+BPWQuXN/0LV2fF/+4I9FY72o4?=
 =?us-ascii?Q?BkknWAnSPc0aXtIFvIKsDEHYLMD3YstS4jDYjzvo3EUh4WhGF3hC+EsVaFPa?=
 =?us-ascii?Q?lUvswoxmNMW2HtB9dCCvCSD3EHs1PSO+TvU9JgYmstKUYp25q4TcA1iPyKlp?=
 =?us-ascii?Q?0rQ2R1obeFPyEo4CNb4uvkAAPOmB3TDBLh/aslo8YXTAZB1ToCgoEG9J70at?=
 =?us-ascii?Q?yUTVDSHkAodiDo+VymvMSf2rFgXXtzGxpI7IXV77CDGmG5lk6NZYGHnU2gsM?=
 =?us-ascii?Q?Sq/lus7c9SSPyna2nXlO3XEinavCywed6C3encKe5XY48RmHWtiqsg+tzDrR?=
 =?us-ascii?Q?p+wzVkrAfc4DvKAYlPEcs4DLs2CJyshBcdK6H2oMEDxQ4oM4rmqPPZxQRO1E?=
 =?us-ascii?Q?LKdnFPGbtLynxy9+D/4Z31ft8ZwzPTsXnJfGNPi/Kl+L+hXS3Cnzux1DXbXQ?=
 =?us-ascii?Q?qLPiXkaLpCnUVPO94DsAKmZ9HlAFw2o8O1jurrVGkdKCSRMku+EL6sZ6Fps3?=
 =?us-ascii?Q?haMVylOlTqUMjQ6quHF6Xn7Uwws6UccR3e72WGc6wTIAV3dgA3Z80HLAcyhX?=
 =?us-ascii?Q?SrS9GL2xRDZgSKCAuxfG1QfmUcEazU3lx8aY4UGX2RS1McoOAqAbeaCdvt1u?=
 =?us-ascii?Q?Ibrx88nWLVYTbpkqWJaVDgzsJHQ/VQ5m5w3YihvIFZoY5OkmYxyW65LhlKFo?=
 =?us-ascii?Q?xVOp+zML01OMVh11ie3Sr8dNqYjrNWwr2IiLoE9+30oVQ3Kjk9EXO3YSe8Na?=
 =?us-ascii?Q?uNGDOTke9ok25QHCDrfgHzhuU0u5UVmiF1oMn7I43p7cxB/2tjcAvKemqM3E?=
 =?us-ascii?Q?gKKvzTMqlXFk4pLxJQ9198kavHkTxFeELa/VmsY59fk/bFgzmcOvgaUscouP?=
 =?us-ascii?Q?qnI55TDYrvuafs7p4Vfhm1PfeBEeVamukyCMr8KTUDORXhTdeJvzBafdu5b0?=
 =?us-ascii?Q?gEZRAyEt6TwwKt8QH4uXPg2AD9nWliN4D5zO3GZQE6pQPnsxvTvTS84xbvrm?=
 =?us-ascii?Q?WTtwkDm5grV+ubBtxVoC4s0HGfluoI3PZX4WvRfEkIIf9wsxlGaiyKvvoDH8?=
 =?us-ascii?Q?WbTaCuNKG6nJUxUCB5MH+ve5NavJTU5Ci9JtqP1qC+uuOj5vQH2bd6/69Tyt?=
 =?us-ascii?Q?NK3DrbbQsYm1SkRk0bbiLWACOBQ1ZwAqkS+cbNQV1xosVx8DwCQ0iha4CJXQ?=
 =?us-ascii?Q?P/aWTbp9uDpWPeCkW0RVFwmt2i5ZApQSQYxHx6ubG1BKeMSYIFsOv1PPJp1B?=
 =?us-ascii?Q?ZZ6R9p0B0av+S2jxtHbMwImTmJAzU/LXXEDbkKUJplJsQQ=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?QM0WqN72B7ExI7rQjubMEKajHdWq2GiUqwxsWKQw+6/qXEggW7225L7g73wR?=
 =?us-ascii?Q?+FDXdd76dtODrW2+RD62NJI9cE0SfLVDgcNDvvE3BXx6ZVM6F94bP+kHk+KK?=
 =?us-ascii?Q?kavPpWN3OJW2V1g/yAHO3Ml/RB674rOoqhcIe8NrGtvGb6eefXsxG1GSiW4G?=
 =?us-ascii?Q?jkVcavH9j4NgothpQEqTvXvglKmCnIx3OaGn5VjBna6Ov0i2XP10sPsE/H06?=
 =?us-ascii?Q?YEwpaF8/9cTfI1Xw6PpfFU+88Qqm+Aj4fIB5F5XMtUHpQ+feYk4JsnttjdG0?=
 =?us-ascii?Q?UoT0VtH28kGnc7YPt6Jz8NoS/kDFcW9n4WLgWzEDVucA522CgwUPDDllRBTS?=
 =?us-ascii?Q?zd5opoDQHBtCWohP+K/xv8nig7bihsAFUkesf1N2IgVtGJc7c4TNHV9rxoDq?=
 =?us-ascii?Q?+sb8V7chBm3/bme0pqVmdVAGKw2xzjaZVnJzLvBKNqZCROJJzXmPhIMh0s3S?=
 =?us-ascii?Q?rVEShJjNoZGKHrV1ShAi8/NWu2SuciKV2LL75NdZGknyTgyilmZmpmqZ1wX0?=
 =?us-ascii?Q?cblfgJseBkSuj891C9OhNyainJVoc2YrHg/hhq7OzH0Az1S3RHCZCsMQiD3R?=
 =?us-ascii?Q?iEonisLfREHTGnF84p9bgRbM31dOy9zgAZEIGkYPNp51xzF1OlQwAI9oo7FH?=
 =?us-ascii?Q?44TYsM7mAyTWd+Wfp48J2KPbL31KAlBvqOHrW7Wob/GBbCyo1w/9DOtbCUph?=
 =?us-ascii?Q?16bVLVqZDtCfJjRbb+tbv9C6jxDoJ94EPWgSdK31KdHTlfAccvjzZdNb1xfw?=
 =?us-ascii?Q?HE2umgeiLIgYiHvEmYa4RGbQGkaNLAetr/niX/WTCJiLuJAhE4z1ZX5he4YO?=
 =?us-ascii?Q?IHsPItGVE59/8VCJDW4nGbm7WVW9hvA4jWlkExhH9MUzg3AySB+562Mm/QTd?=
 =?us-ascii?Q?kjoE1d5uNOYc+d9Vc9hNXtZyOqWS8dieWNknjq4n336aPUbsvQipYVupvn3i?=
 =?us-ascii?Q?GQ/Z+G1kjzi35spK5CMlSt85jFIPBnOFqSvogHTeoXV1SK0UkvFS5o0cxqUQ?=
 =?us-ascii?Q?qajAr3FtlTSdGAKFCUcOSD2hrzL09JbMHTL9TMpGf1mh/YHaJRWhTAKWheew?=
 =?us-ascii?Q?IwFuuo/Q/3vgfO4Dq7wc2gtdrKi9emnQ+HZBmcScmcAxhk7vOc5byaJXowdG?=
 =?us-ascii?Q?T3bz5wbDawRt1y1UY4SLHwYjQ21Bcrc7hoYTrmUhAnCdd6l0h38Zg/ixZRYF?=
 =?us-ascii?Q?quNJjPrQS+vFxvL3vqpY5dTIELKZUHEeQVkmDji9XnI4/XPNk9WCU+2XHcDo?=
 =?us-ascii?Q?EkJn8HcJylJYfsoc71YZUHUE8YAU4IirXtT3Mm8IQCbqvgF7fPEJa1F3Pqzw?=
 =?us-ascii?Q?SzAWGCQASNdZnYOsk37nVLWbMFt/rehaYXGKP9wgNXnrDZHpwknrPiXDQjGN?=
 =?us-ascii?Q?xVoKfIRQgQuwhlFdEuoyNQe3+h8uJy+LYOh66N6wwCoBS9r6XHsldZj/oHfQ?=
 =?us-ascii?Q?7u9B6KU+lGqyCblF4pLIft26AvjzfBRoP8GuUoGv1KdzpAbHFSBz4IhnPdny?=
 =?us-ascii?Q?WwlbAuxPKLh1+6f5w1JZn5VC0qgDx/Xt5iUF1Re2ocjaTAvpREtVhsqm2+SZ?=
 =?us-ascii?Q?nXFonO+VCSrFJl7uirhkG1wE6htne4nUCEL+gXDz?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 260d10c4-ece2-4f63-4fb3-08dc813f449a
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2024 06:59:51.3456
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: osBj43389dJI8m81HDv9cugoLMFSzqrgUCb4GCKfJKed79o4TNoMoLVKRAm9PvYmCHu9kzOzOkwVf7+w0nn4YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7177
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 May 2024 07:00:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200057

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Bin Lan via lists.openembedded.org
Sent: Friday, May 31, 2024 8:30
To: openembedded-core@lists.openembedded.org
Cc: Bin Lan <bin.lan.cn@windriver.com>
Subject: [OE-core][scarthgap][PATCH] opencl: fix virtual PROVIDES warnings

> From: Bin Lan <bin.lan.cn@windriver.com>
>
> oe-core has started to warn when virtual/ is used outside of
> the RPROVIDES (build) context.
>
> We tweak provides/depends to use virtual- instead to
> avoid the warning:
>
>   RPROVIDES is set to virtual/opencl-icd, the substring 'virtual/'
>   holds no meaning in this context. It is suggested to use the 'virtual-'

You have old version of master/scarthgap, current warning is:
%s is set to %s but the substring 'virtual/' holds no meaning in this conte=
xt. It only works for build time dependencies, not runtime ones. It is sugg=
ested to use 'VIRTUAL-RUNTIME_' variables instead.

Also you should send this to master first as it applies to that branch, too=
.

>
> Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
> ---

