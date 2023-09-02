Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C667CA0FF7
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 09:54:23 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.50])
 by mx.groups.io with SMTP id smtpd.web11.5415.1693648456231802558
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 02:54:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=kAPmtiWb;
 spf=pass (domain: siemens.com, ip: 40.107.21.50, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=izJ7UwxOUiRk9b61hw/lG9Me+fh3vc5Ab/d03BU5zJaN7wTobqavEuoLDxL6zB4CVgVD5L3BeAhkSYG8X3nSE16p/cAS2GQDmQVWMkVFRQ1JGCAF4/YDwxcMd7g0oAmYFIWKtLlPS/5BjkmmzPJwX0Opwe2tW2FEoUD2E7jldnjKrtascrH9dkLj/tXGeh4LfpDnAI4iEmOiBexdkBR26B2Xe6lAG43bWv4Z/NEDf94lJ2BJyEEYtnmIvhwnC1EmEs6ZvIw67luVmbd27CKuZiSEJ2v/rNRoHpc3OtClURypxIyFjewIrPENKJNCs9nMltuQE3jkLwDNpCXwtkLZqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4h2HvYrmdI4a9GUfa0yeqOU/JrrHlb7WGNbzizQYVCY=;
 b=BevuRNZYJf5g+QkwOhL4iXUJWCLgU02004VKoZBEvwi86wM2HedmPHkTMPLEtkG0WLzaS3hYAsmTQwsWb61N9JUaXuv50j5UBJYCySR4/RWTT1RLkbFM8iTihZEH9EBm1p1ihT+f3VOv0rESuZZC4lQNXJBK7xnHTSqOpZySeTcHLIUrFDGesXKElZ3QySw9vMM18p0A4xYrYX8JmZXZots7ngego3bkbyjgadFCnR+/i/fBqzTBeAGOMl/V+57IWZsieBi6vIbS5PUo27Gt/3o1L76stO8vfiRQ0Z8HHwWhkMd6gZI6JB5yGT+giGbZMrb2YJ9HRDcqwBLJi0UI9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4h2HvYrmdI4a9GUfa0yeqOU/JrrHlb7WGNbzizQYVCY=;
 b=kAPmtiWbApwMtWMX3Kqyh+mGj52mmxKiXtd3Eg0edkSzXX6f+wY6xjC4uRerAlYLlEc4mTnViMr6IxKa+hH3b01B4HNF6DLd1fIiuxN4OAt6j8ShHvoljpkQrY0cLPx7v8VUO4/fcigrz4scHzcFJmF2boU8I7Tew0070vbCgjrUXly6ChJeBeIyCohiALXIZ/hXOEW9GG4k3enK6FEkGYOLY4t+RO2CBVsFeNKZ34zNbD/FK1i4XWR1jH7eIkNUZKxMmS4P0BBXAu/ukdjDVE1EaPYAR9JqmCthPb0eSBHYsTFCLGaOUiB9AzR14fAUs6nUJ9yqgnkmjKwLD4mQSA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB5PR10MB7656.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4aa::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.25; Sat, 2 Sep
 2023 09:54:11 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::252f:e0b5:470c:b374]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::252f:e0b5:470c:b374%3]) with mapi id 15.20.6745.026; Sat, 2 Sep 2023
 09:54:11 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] gcc-runtime: remove bashism
Thread-Topic: [OE-core][PATCH] gcc-runtime: remove bashism
Thread-Index: AQHZxEA/qEbJpViTwE+g/kVEm3AFpbAHfhew
Date: Sat, 2 Sep 2023 09:54:10 +0000
Message-ID: 
 <AS1PR10MB5697481EF7E00D09EA8B474FFDEBA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <17772E0BB222155E.29484@lists.openembedded.org>
In-Reply-To: <17772E0BB222155E.29484@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=a8de37d9-acf7-4c25-b1e5-844d8ca6cc4e;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2023-09-02T09:53:16Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB5PR10MB7656:EE_
x-ms-office365-filtering-correlation-id: f7805cc8-3650-4068-da2c-08dbab9a8ebd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 HMT8plqHT7wNrHMbI3MRt3Ppw7eUIX7NeD7MS49E5CEOIiJ+P1wGyxLMFWi1YdbY7JgkfERb3pi+vlrzpI4hSMmkAsSDjt5jOfLZm0CCCsOMv7Sc89Ic7FkDZFBGRltGiiKLiGeeNKU02dPe4rivvP6gwwT7g01RBmPbzda2BOtZxJGowizyrCWdIwWeku5dg6WSfAZ/dUMxWBEq0H0dgZ2ZT1HAKTrTWPydiXT/nUIS1NxMUVvGl9fvlkphNVGt9Qj3Sgh5DNzKVOnCULEq1DgP6vmNvlHBr4kSsn53a2Wp3lqI08dGu80nFpHwlD+Nkd2UaXis/3qGH5C81O11nxlYGBdcrsjuM6IbaN0QdLT5tHpOH9ul31dHXHFmMmSiPvyGXEzBbYwvwPanvneJtJog74lH3yKAvVuBOuDqxkzsp+AYU7hJKI9owqPvJFXdlAMEG0Y7M3ntFch5NfxGmMqaTztN6W15sRC93GCjkeZR1JCbSZE4TVzj2fHIszE7GjOHCyUmZei7U/vqQpHyV705wofBCu42km8JS9Pyw8eclDisJ9najXLTapuUYI+sn8Fw30ODASz9GyOAJWvCfIfBnK22wwTEkdbPnf+NnHZ1rPkRxTDDrtTNV+jJpl2D
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(39860400002)(366004)(376002)(396003)(451199024)(1800799009)(186009)(122000001)(478600001)(71200400001)(38100700002)(38070700005)(66556008)(64756008)(66476007)(66446008)(53546011)(7696005)(83380400001)(26005)(76116006)(66946007)(9686003)(82960400001)(6506007)(55236004)(6916009)(2906002)(5660300002)(8676002)(41300700001)(316002)(55016003)(86362001)(8936002)(52536014)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?XG6yobSPSJ0AfSbai5/FIjCO2tX+aq7hEPuKyHylSNW4qLW7DZHVq3+p+ZxV?=
 =?us-ascii?Q?hgK2DUiZV5HTDwl7hvPNB31wqRIQB0ZN+EHU2KbjqvddmuMHfXcJDKWl9VON?=
 =?us-ascii?Q?otIx5sG/E7hfUQBTkCqhp1BNoHxGN05puEnENWhtr3d5lw2Ctfv+qWVzaoKn?=
 =?us-ascii?Q?h3ZM3L4nA2AnKW5KGXepXnsFD3vfcBZKR3bha/u3s4No7b2Q0sRk+7AWslt1?=
 =?us-ascii?Q?HKLV/hyXGpJTdkLv9CXEvT1T1/dBZ3mz9zthEwJkLZsyY7UHYAI3XthNL+MX?=
 =?us-ascii?Q?gYKbuy9wD0vGLSJwfYQpaUQoxPKotU/rRfcHmWtoncaHp+y8P38DFdV0w5fR?=
 =?us-ascii?Q?j+sRI+qY9J0kHal3Zf+aJlzQBnRYRgYrtlnr6LNw2NpAZdbwjtA0TNw7qneA?=
 =?us-ascii?Q?S1Nk65GOYDdlTC5LJTAltxyCMsRYDZCHYml5vWPdjRbuSKb5j8Hq/O13P07X?=
 =?us-ascii?Q?MfLmunnrIAa5+HBmSOGYhUv9WQPHxb5QQ7KyHeAB66kkesWxuacHrhpk+U6f?=
 =?us-ascii?Q?DNWe0KMlr9HPY3gQSB4wZLgaYTOZQM4/7RgBZBP+qmFlkpW6OvTG87Yezik9?=
 =?us-ascii?Q?En+S6aUNCymBO7EQqw561s4Ck3tc9VM7hFy7ZkpuqxV3rVx1TONTZNbPuq7h?=
 =?us-ascii?Q?9egwSdpuY2eIFpgnHV1CQ7Dj9V4erULtfvmM6bvXz82F1195eRqo8+XbjMsw?=
 =?us-ascii?Q?KpRSEa+XNU3cXZ9zzKP+rzAz8FLQ+qbgfJ26Z7jme4/r0DkmhNbTlGFWzJkU?=
 =?us-ascii?Q?5lYuUxBasx44l0J/q8i2EhFs+UjBYZ7GfC1y39rPq0ZPoLqiW526yXNu7lo+?=
 =?us-ascii?Q?NOGzdbgTn/DgAYhvDa8bXbcOfhYyreY2kwLvBHzmqHtrNhSC0XtY/JW4GjSF?=
 =?us-ascii?Q?pUCy18XUGiZXwZKRTvnSy9E7iOZ0wPHIvUMC1nnczFDpvrDXJiYOviMjzM+S?=
 =?us-ascii?Q?IVGufvoAhDjRptvucUC0Nt5MVShu8BG46b4futX5ldhGeBiZo1E3kjP+mQje?=
 =?us-ascii?Q?n016GqZ4Yh8HcAaVqPL9t9IKQZZ43wMHEN4bZFoC6pNL3iJYERb08NjncO/a?=
 =?us-ascii?Q?ndZL6VrmY85aFCCqWGdY4a+6B7BBAEzwifETCyAiZeZg04vhd80xzQkgjDYZ?=
 =?us-ascii?Q?QD/e9dVUjJ/2fg0Lz8nfEG1UcuAASyFtmG9epBrY2g7MKRFTkhGwzfeyE6BO?=
 =?us-ascii?Q?tmO84w7djFcqpoAdh6DBgSTTuFmPNQ0/IXG5bbKBXDxSoQo6J5we1/Jtp7fM?=
 =?us-ascii?Q?zIHMZT6HHR6ZiqTEi7eChKszaMthYHF0W9bwlfM4pfuIwseigcylS7Oyu1HL?=
 =?us-ascii?Q?RzhK8PxAPzPv14ANsA2jsloxCZXvSQMKVJ/kQbvZaUSr8L1a09naf/160CdY?=
 =?us-ascii?Q?x1XZttrIGgene1S+fwZC6Sk9+pWfrAajxftb6k2+7/v9OmJyjC+JNt2i3nnj?=
 =?us-ascii?Q?uhevUFjIbMOzsC4zgmTavz2gDZ2oavokAkQohSbmcIqIKmOz3Ufj+oVKfe7y?=
 =?us-ascii?Q?RX5WzwvM2/3QwosLD1DZS52k3xPg2nyUmKGoskO3tGhmwWvOQi9Pm7OQEw+1?=
 =?us-ascii?Q?XENXjf4A9GCxa9X0IECiNxpFoM052ZkOpVZdbLKl?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f7805cc8-3650-4068-da2c-08dbab9a8ebd
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2023 09:54:11.0594
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fp5lmkJdGlkp4hDBVcTNEeAXvCI+d9KnIT56JU584aqS4fg04dYPTstmzY1jV0ABUX33ySSCQmQMDPjFbJ1Dqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR10MB7656
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 09:54:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187027

Gentle ping.
Thanks.

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Peter Marko via lists.openembedded.org
Sent: Tuesday, August 1, 2023 8:19
To: openembedded-core@lists.openembedded.org
Cc: Marko, Peter (ADV D EU SK BFS1) <Peter.Marko@siemens.com>
Subject: [OE-core][PATCH] gcc-runtime: remove bashism

> From: Peter Marko <peter.marko@siemens.com>
>
> Debian 12 no longer supports replacing dash with bash as default shell.
> Therefore to achieve compatibility with Debian 12, all bashisms need to b=
e removed.
>
> Shell comparison via =3D=3D gives an error with dash and thus the conditi=
on is always false.
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/recipes-devtools/gcc/gcc-runtime.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-dev=
tools/gcc/gcc-runtime.inc
> index bccc8a5b89..64b6168ba7 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> @@ -132,7 +132,7 @@ do_install:append:class-target () {
>  		ln -s ../${TARGET_SYS}/ext ${D}${includedir}/c++/${BINV}/${TARGET_ARCH=
}${TARGET_VENDOR_MULTILIB_ORIGINAL}-${TARGET_OS}/ext
>  	fi
> =20
> -	if [ "${TARGET_ARCH}" =3D=3D "x86_64" -a "${MULTILIB_VARIANTS}" !=3D ""=
 ];then
> +	if [ "${TARGET_ARCH}" =3D "x86_64" -a "${MULTILIB_VARIANTS}" !=3D ""=20
> +];then
>  		ln -sf ../${X86ARCH32}${TARGET_VENDOR}-${TARGET_OS} ${D}${includedir}/=
c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}/32
>  	fi
> =20
> --
> 2.30.2


