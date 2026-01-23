Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C019D74EC5
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 13:32:59 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67871.1769175176853674082
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jan 2026 05:32:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=KNMcXCtx;
 spf=pass (domain: siemens.com, ip: 52.101.69.51, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jFhb/H/A66jTMjBldbAKsdsmexFdFoAYcFgPo0pG42LPpr7mA+g3OL39WrDzUJvWDB3cAANmm7Bm0HizDnvWeDNXc5gC3cD7QEJ1U+Ok5vOlfiHD/J7JvWkF6W0NCzRsMbMxeGLiyah/8W9GRIgY5ouDnLHvrjsuVX1BvRwfWE/nL5pppeVGbWsKTiFVvyW3rf3Udu9OhHFAcSDN2bGEGq5udvXmgNf2DG1BrFMefmiSjcO+tAkKdB0tCKLHTMWe4VXWU0sJNhv56+wD/V5BkBCNFK0mfd++f0C1CTvesk4zbA5FaeWa/RZ16VYCovcddeerFf3FRVxN+yYHpEQaTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8re75+jr/n9vHffTNEa7pJL05ZVZPjusdGgR8vxVtb0=;
 b=Ob2XfY4lt9Fs+3+a04FjHZFSRpnCS6x2CBut9+/5kqf4NBwlD1WigxZSUkHn+Sf81W7VwtXuOzxnwjfuhMJlTeA0aQieh5uhonwatAnnO3v+Sr2zYhypXGLXSDfYcUL1JV5FIyz4WbTy/HLZrNI4eN/5UlBdYn4bk+9sGwvo9HSyNA5a+kvTI3H+4Xfkl8K9jlHg4JtENsLZk24uuqsZPPuZCzkUD5BsAQ/guu1/FLUb5VvMKd626MjjL+ibfkqsh0WGbtu8S4OI1czn59CUxD/BMG3avAef7DFk+X1FlBOftvW/w3qDAhzT1qj4H4Hv/MYfhWPPNXqRebbzZMcK5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8re75+jr/n9vHffTNEa7pJL05ZVZPjusdGgR8vxVtb0=;
 b=KNMcXCtxZKMGydutRMlib2n3/hO648Fdx3qUIzpYhxMNP4EiwRi6cqOQbAIdjbtLDe/H4Vwn5MHs9JetwWAGygH9uKU5xY2OwaRm36Fb3Fiol1iPYyrwE2ROo3jYnJ8zye2wFOodaI0dOhFPUGOCqUAiuP8qo+1pzhOMvGGWYTYOWQKWqI8WK9C1yiEhhZ2Ts7ELig/hqNfOjQsvausEie+bSdMP8KyV5QQ7heMrrDAOsfIoI3AWLBPAdrt5Yg1+tNC1n4J9BOvOkmbUJBDC4ZX+nk9wFuykgibcSzmOh5Zg4pEpl2QFMf4jWfU8WQaV3WKVLYkGvdRrUossoSyudg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PA1PR10MB9387.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:4fa::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Fri, 23 Jan
 2026 13:32:53 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9542.008; Fri, 23 Jan 2026
 13:32:51 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "dmitry.baryshkov@oss.qualcomm.com" <dmitry.baryshkov@oss.qualcomm.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v3] uki.bbclass: drop INITRD_ARCHIVE, fixing
 multiple INITRAMFS_FSTYPES
Thread-Topic: [OE-core] [PATCH v3] uki.bbclass: drop INITRD_ARCHIVE, fixing
 multiple INITRAMFS_FSTYPES
Thread-Index: AQHcjGrEiOhl5/CDJ0eBEbKbvgnAobVfvblQ
Date: Fri, 23 Jan 2026 13:32:51 +0000
Message-ID: 
 <AS1PR10MB569720FF73A415EC84069B29FD94A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260123131814.586417-1-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20260123131814.586417-1-dmitry.baryshkov@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=9063308f-2328-4d49-b0db-96813c4ef257;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-01-23T13:22:10Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PA1PR10MB9387:EE_
x-ms-office365-filtering-correlation-id: fe5bc6a0-9e20-4c58-0b2b-08de5a83e852
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?gx8NLWOPk2dVe0bfNmUJz30QVJfY3PfQwvD3EjwehjPiU/ioTGdrMp5z6nzu?=
 =?us-ascii?Q?WRpIgpmRxRmSaxfduTrXrx///exknpLL30I2/hicohnE35XEtVWUu38yDkyZ?=
 =?us-ascii?Q?KR9qPNSr/KSxT/hDOCAk8pwabrK3OV9AQNq8MP+25oqNSWTTPjFH/ITN2Mki?=
 =?us-ascii?Q?xh/O0WdmJ0QgTGsCQ6L3WSpTuz1uoyIZp339VKsinStiFd+UFb3RN8ZRS8/+?=
 =?us-ascii?Q?l0oh0TeeOewH7lD9WpFE+klctTRg25hfUJptJqRQjnemYQgdRmd2T5/FUoqM?=
 =?us-ascii?Q?p/QLFCyK6sK3ijICbMd2ceTD/WqLgbqeZHk8qTsqJtYi7XD9a/GpZyn1u/mh?=
 =?us-ascii?Q?QlvktZJPSyAAwqfrftrBizXfStB8KWdA/KQrpO1vSA60xYPkYuWm4RjxSv2k?=
 =?us-ascii?Q?a36FJ1nTN/K9aPtlPSEXI//E/Kt8XmAJyMF4r4UpW2g2WKJoldGodqzu0YE+?=
 =?us-ascii?Q?ebfGd6aVggCcBjF9IQsObLlBqcGodus9s7jhtbNq7Y17rbbrhQkqvzNFOgTT?=
 =?us-ascii?Q?0JP54U0fp5TYDXzOQh24o84Kgr4A9ULxN6usVelWCDiUecKB8ZbZjXnOn9Iy?=
 =?us-ascii?Q?j6GgCrt4jdcbi2zEgZVV/yVz+UkDAefvza1jb26YodS/IIupHP+z7bvCT0hv?=
 =?us-ascii?Q?r7MZrF1mlZZ5BnZ3RcUQk4qyf7XeWuROHXY9c370gu6akAHcxTABSuSZuGlQ?=
 =?us-ascii?Q?xMLd4SxANm6I7IUZS4ZNZYILFtTnTZ+vVLnvMsgIOQ9JFaqUWh21Gx1nTuiZ?=
 =?us-ascii?Q?mRgCJsyJVqYbP9VxsOFvwjl7+HbhDT0ADgq66H78cZoKw9+CW/Gayg5jOc3i?=
 =?us-ascii?Q?OCzvDVTDB/t8aWNHdH3+oRin8OdT/YPGzUNTXGMwLY2exc9Q9+f35/tTZxli?=
 =?us-ascii?Q?BMVK3jkMslxB79/rzPomfVH+qwWWGRcLiVnt8SdYkNi6iQSP8g8vnMCK3I7j?=
 =?us-ascii?Q?pJM33UuenNF+jFbZM4UQ4b7N3UTz2r3Bo+0FLU7XsfpN5yJzFuZPIloq9D5e?=
 =?us-ascii?Q?YH5JriwKtcJZDXmrZpbYLgWFt1Xp9azVDw0blw/SJeJ89CNvJnxOXoT91i6L?=
 =?us-ascii?Q?/ksNjZ5JBmGdU0MT8d44SsG5LTIXLoj81dJCv88UuLn8+n8jzKrNnzLhxjtc?=
 =?us-ascii?Q?0tOL2KZBpoPKn6ggZHPjtSOoNFuGaevLObesWKU2iOgoAp1l6jTFoIu2rPRN?=
 =?us-ascii?Q?7qFtf7IOQ3EigWWWNVz3w2vUW4pwkUEiLaIuI4WwG0HBkt0sbAbrfRoKYWNW?=
 =?us-ascii?Q?3xUrnCphZuSVAJ9nK9KAGZpInfN7to/RMlYRALUJAHSkY7VRdQJczLgibZ3e?=
 =?us-ascii?Q?PWwtPrsOHSQx3B0N+b7bOZ5txB0ZJP5JVW/6+4Odg+xUye7HC4vBP9V201Js?=
 =?us-ascii?Q?gXyL+vpt6dfGcyF0i4dWXd9n/D2YWcMXyJ703MjBmEC/vlwu4g4/tI5JTqsp?=
 =?us-ascii?Q?bOWoN+EnPeY1aFo17fqx8g7fXTCgv93pPM6zE8Nbx4bGvWbljaazgUc1f2XO?=
 =?us-ascii?Q?L9btQM1t9Mb+3rZPEYC4qIm1ECC2I/sFlfCBIPlmsg62fXFDKodKOq3geYWE?=
 =?us-ascii?Q?/bHEIbXV1x0SwSIZkbM4f1cOweY/zX/ZZtEfdYPEHSIjXTpiAkgMLXvX94WB?=
 =?us-ascii?Q?mtggQsG0LebS/67w2vOq9eI=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?BrMGTCNJQ+B4rK97/hG3Zeb+2ZlKjUc8B5CKquxT8oQjElZzpal8KipmiZIM?=
 =?us-ascii?Q?HWbOOs09IqEbX84OtzDqx/PGslo7QGgObsyvOh/ZNQ2iXZG3Ph5J4GzkIxz7?=
 =?us-ascii?Q?afYKVoS4Ar9skzymBrQhFl2G6xsn4DYXO8QuUpuDb0PLynUiwIFyZRHA+Byp?=
 =?us-ascii?Q?7FCqCAj18fp71VkQycXsobHRgzdN07FZG46aLenHsJ88voMQh+7mAfWoxJyJ?=
 =?us-ascii?Q?b2IQ+Z3VfuXrPIJ7RDpqXVwuqLUgn3fBaXigBYjBSo3tDCxaOO98eeboQ6UQ?=
 =?us-ascii?Q?1w7iqB/jA56cRVABFRy+KYZZLzBGczK56vZjzlpwgJcB7/0E2wbajiC91UpY?=
 =?us-ascii?Q?VHSOAgCfkoJJq9Tx9dhesfU4hr3wFYvC3KHcW2+wVFGt2+5SxIGEyOdK0nkA?=
 =?us-ascii?Q?BchrGhM0OzcnX817Jf8TTv1e5idYxLX8QjYQr75YlLaIXV8XfghxBIngYAbP?=
 =?us-ascii?Q?9sR/BNNGOdXhsfG72iz764MLdNR5KYUhHEAVHSRDsZb6rLEyFI1VA3yIwyEa?=
 =?us-ascii?Q?JfDvtpeGGwuZ2Wxlbmv8J4JyD//X5JqU1C6IzXGOaNeewLtB9FLf6TeWJ42H?=
 =?us-ascii?Q?o2FYe1SGyOs9KEmlLlAxnBhupnJF61CI2n3HBkEJ9jmcfYZUs0gX3UeEBUEC?=
 =?us-ascii?Q?47YLYZlGh4CUu8BycgyzlKTLQYfFkKt+8t6kex24f+QUjB5HYVQ2dzim9eX+?=
 =?us-ascii?Q?WaMbkz6BAn2apmMsWU7+jFjVqn3IZ2KMooQREKhgCyiUaiFoR+rgm/ojMMc4?=
 =?us-ascii?Q?yANHoawvSM+/88vUTuJEDiTqt7BflA6oJPGFIBeBnbNkxq8MNQy0PcRqLwHf?=
 =?us-ascii?Q?hAJnF9dDSqjm7qH3Q4BJZncUxHBxZqOSVKud6WUeV62pH3dUuLktar1p7M/g?=
 =?us-ascii?Q?YiJLvyh6smgSXJLi/vGHGVlLG1nnccceGAtFy/UySSf+lcj6xQJAMFxfATG3?=
 =?us-ascii?Q?6Y99glFcARH3dd9ejjAJdExUMbieRuNPJmOPhiNNX8+3/tglPZW4hLWvk/1Z?=
 =?us-ascii?Q?fIxKVJu8x0ns9+3zPwVCFr92V85m8lPsAPemNsuB89SEz4veUy0ZNKrTET0U?=
 =?us-ascii?Q?XkpdKE32zZBOlzas0fnJh5gpZGKt6F09mrAgksc4ZimxTl5R7OTgqd6twaoe?=
 =?us-ascii?Q?2mT0gwyWEpykp1XnU6qmaTNZcnF+5sWH6OPFZlPeWj22ZLZnmBMMGo9SnJkP?=
 =?us-ascii?Q?hjj4NsK809f0L6FDYIjLiF1CO3b2tTC7D8B1UJfxedQMeVGSnnwfWmX71Ubu?=
 =?us-ascii?Q?zOJfzvOaS/giuz5gUmiipOT9gMG5CNnURhJ7iuEvQKXlPcj6rvfMpOlMTDaL?=
 =?us-ascii?Q?oIRhfBJXRn7JAwgp5dQ2HEcgLvwzfKzYR2mIxgANBV/TF8VF21tJd9s+gqcZ?=
 =?us-ascii?Q?HOA1ehxugLo//DLcqbLXPgJkSbqn8iDe4U/NW9BgfvOTV+L96Bhp8jC//p8q?=
 =?us-ascii?Q?Bu9m9gzUY4WjF67B7+kDHepnH5CzdTNFZZhS7zqAQvAEE4vKZdVZ42bF1czS?=
 =?us-ascii?Q?W7ek+BwZX4rc4OTC7H7deGE07chryqf2KSYR7tmwLHmwKzeqixGTXHyKLQr0?=
 =?us-ascii?Q?q/fC+fhPdUz4cUHjspSPYDfZMTKKMP1QUJpj34ORHRo/6kn840B85FYLczQC?=
 =?us-ascii?Q?gBoXP9Jo6S0czVfobuS3iBn/v/age7OsKzL822PBingYb/L8tyjhFUkaIXhL?=
 =?us-ascii?Q?C7qmK1VBQ4DbwEo85RcIe9roa+UGW7L2BpA+xhZYiV+FP/Oym6DNJrNOXODV?=
 =?us-ascii?Q?RZmo14tE6A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fe5bc6a0-9e20-4c58-0b2b-08de5a83e852
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2026 13:32:51.7814
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +fMvYRcqS+tPHjSI2SJub2cTbBqSfMVqsfpQXMkWXu/YsVo8t7uduBww+FJ+P1dKXVKQAHyWR4QkvEVXbxYXRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB9387
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 13:32:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229889



> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Dmitry Baryshkov via
> lists.openembedded.org
> Sent: Friday, January 23, 2026 14:18
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH v3] uki.bbclass: drop INITRD_ARCHIVE, fixing mu=
ltiple
> INITRAMFS_FSTYPES
>=20
> If INITRAMFS_FSTYPES contains more than one entry, ukify build command
> will fail as INITRD_ARCHIVE will contain extra strings. Drop
> INITRD_ARCHIVE and handle fstypes directly in do_uki(), letting the user
> to specify other fstypes in INITRAMFS_FSTYPES.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  meta/classes-recipe/uki.bbclass | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uki.bb=
class
> index a2b1c8a82d6f..ea449540db66 100644
> --- a/meta/classes-recipe/uki.bbclass
> +++ b/meta/classes-recipe/uki.bbclass
> @@ -73,8 +73,6 @@ require ../conf/image-uefi.conf
>=20
>  INITRAMFS_IMAGE ?=3D "core-image-minimal-initramfs"
>=20
> -INITRD_ARCHIVE ?=3D "${INITRAMFS_IMAGE}-
> ${MACHINE}.${INITRAMFS_FSTYPES}"
> -
>  do_image_complete[depends] +=3D "${INITRAMFS_IMAGE}:do_image_complete"
>=20
>  UKIFY_CMD ?=3D "ukify build"
> @@ -127,7 +125,8 @@ python do_uki() {
>      ukify_cmd +=3D " --stub %s" % (stub)
>=20
>      # initrd
> -    initramfs_image =3D "%s" % (d.getVar('INITRD_ARCHIVE'))
> +    uki_fstype =3D d.getVar("INITRAMFS_FSTYPES").split()[0]
> +    initramfs_image =3D "%s-%s.%s" % (d.getVar('INITRAMFS_IMAGE'),
> d.getVar('MACHINE'), uki_fstype)

This will leave orphan INITRD_ARCHIVE variable defined.

Additionally, I think there is probably issue if someone sets non-default v=
alues for IMAGE_MACHINE_SUFFIX or INITRAMFS_IMAGE_NAME.
Isn't INITRAMFS_IMAGE_NAME the correct variable here instead of ${INITRAMFS=
_IMAGE}-${MACHINE}?

Peter

>      ukify_cmd +=3D " --initrd=3D%s" % (os.path.join(deploy_dir_image,
> initramfs_image))
>=20
>      # kernel
> --
> 2.47.3


