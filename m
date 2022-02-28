Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84783C433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 15:01:40 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.82])
 by mx.groups.io with SMTP id smtpd.web12.20592.1646060499275777467
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 07:01:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nxp.com header.s=selector2 header.b=YB9tffYO;
 spf=pass (domain: nxp.com, ip: 40.107.6.82, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GFKE0LNZdZXiUF5tZc4U0v+uBsSxhC3UN33zatgfxSNcrE9CktK0nMpaE5w6BcShX1VENTazolSoijBlUShAOxQbzHDscXEEoK2JTbk38ZTmXLPmTPHM/jc9nBzyAR4SyYhYTlhYSIZ5LRYB/7x2k+YwVxK3OLayYhv617ZSwfPH7hjFflCnhEbmiRS1njna8xX14RNBemIGJLnHqt1G6eCXhbZlPuwEAm2bhBH1sLXXiwKkFZ+jv/f3BLvzgMyHa4nbQKlVFRsaODerO29ISEQ7Jcppilv64RqZdhrfcnDvg0nujg5JPmfCsf+hkBT/xxlECmwJcjkJFnmvZEBTRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KtQNYk23R+gxSTB56QQ/hjoJ3tYZE8AEib9OtlXKNbY=;
 b=P9M4dSTAYoo7XDEAKkE8p3tghE2Uh5uIUewA+yp4giTyY7cLSCKoFG7jOk1yDUwvE/q3Qt+KHFSBwHgYiACQlECXtziWXbdXeqlMJ3VkqXgx3IvsKzXB1CslZhobyuRLsLpky9/OvZenwoeEd2C5m//F+h1AvdOQNYNe021SQLH+k8fyOCaGGa2jPpeenGMvVlV3til+tKonOlisGg4EA6FjJkvfk2yVQ8rOOgnY4WuL8rbwh9JvjKC659nnY187yMcAs8uH2nbjkDcroAn5/feYzFjoJrsF1ErrNMsQ5CGOu2WixoA6Gm0nWUjYFbh5ZV+Kq8RslI5752vLyeZgHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KtQNYk23R+gxSTB56QQ/hjoJ3tYZE8AEib9OtlXKNbY=;
 b=YB9tffYOnG/Pr5HQmKgfw4AHU+Q0zJeiBidhPQVuiVDEhbCgL2w1bznJ1c9CH+AH5EWD2K2CFNj7xhoDYYCCjF5ofV7RErGM64n5OvCV7HMpnT9BaDoMTPhAWyT1VGtB5znYddku55Sk/0VBTZpb9o54k+j98+bGf5Wgoj7PFOg=
Received: from GV1PR04MB9053.eurprd04.prod.outlook.com (2603:10a6:150:1c::8)
 by DB7PR04MB4795.eurprd04.prod.outlook.com (2603:10a6:10:19::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Mon, 28 Feb
 2022 15:01:36 +0000
Received: from GV1PR04MB9053.eurprd04.prod.outlook.com
 ([fe80::3405:802:f8a:2ab8]) by GV1PR04MB9053.eurprd04.prod.outlook.com
 ([fe80::3405:802:f8a:2ab8%4]) with mapi id 15.20.5017.026; Mon, 28 Feb 2022
 15:01:36 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] bitbake.conf: add BB_NUMBER_THREADS to
 BB_HASHEXCLUDE_COMMON
Thread-Topic: [OE-core] [PATCH] bitbake.conf: add BB_NUMBER_THREADS to
 BB_HASHEXCLUDE_COMMON
Thread-Index: AQHYLH9JE8lQ9+9QekqxiRLnEiPBS6yo+NSAgAAG34CAAA5AgIAAAJ1A
Date: Mon, 28 Feb 2022 15:01:36 +0000
Message-ID: 
 <GV1PR04MB9053C416CFAC5953DA3601BFE2019@GV1PR04MB9053.eurprd04.prod.outlook.com>
References: <20220228084250.3874136-1-rasmus.villemoes@prevas.dk>
	 <eee2ca92c2a0078b9f767737e20445927f7f2f5d.camel@linuxfoundation.org>
	 <c60f6d60-ff47-d91a-e97b-6a545c878e71@prevas.dk>
 <fdd9e9a9d65e5bc5531718ca3d831cf98d15e9c0.camel@linuxfoundation.org>
In-Reply-To: 
 <fdd9e9a9d65e5bc5531718ca3d831cf98d15e9c0.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f587edd9-8df3-42e6-c296-08d9facb3745
x-ms-traffictypediagnostic: DB7PR04MB4795:EE_
x-microsoft-antispam-prvs: 
 <DB7PR04MB47953B5BD0F7C0F98E5D3224E2019@DB7PR04MB4795.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Q/Zul0B8jjOc1RxRaF+NZTvWA61s77hJ4rRXZF3BkzSZOr6ULfEJHfNz8iD1eynMpnYz0gzDPLkWA09/BbJ3VaPZlpzfLpeyJbF0jcg0KEtXEyaz0QPqYnXYZRZOmyzzXdejtmC+eQy68ZC5QB9XtyJHo8axI6h2BWLjufPpeVdAcqd6eG/ngsFgGsPBbpRaBHxHgCxKqVa2ny+dumWTDH/ttZJ1Mnp/H8iIPAH2BtZf+NcbORiqQRulIIKhBr/6pReqUI0f7lgxj/+cQyzosFOSPpsmNXmUsidEDj3c0AuN/FI+sZaA4IWKbgIW8Pk4wunzd3xvqu/UFkT6TlWHnq64T6k7QoI92n8Eh5pvBt8SSNy2qfw3XJs9RtFTCUsIVAX7V6nKyyqVQ4PXaMX9efpOg7yfouQXwmfs0x9hEeByD6cUeT7e28NgzEh7r78qdemDrMrb25vmRuE92AlH39G6MvoUH8dIbxybheXT4h34TQzVGVyMEAqXpGJ0gwmEyfyu5E35QEFz76FHyX48/bB4faB8ZdKTGratuVcJCusXtNTVjRKkxcpAaKRUZfymwL/PPRNXYtpI2AQT0ubvgx8CAdePdnbi3Wjuy9MGJRP8A+z9u0eYYINAoqGYWE+FG3muxlwm29Ea0Sx3Kv9/ZOtFKJQ4x6xb4t86weXtpLRPKV1JkYIdtDhyA1/aTwvBhQxvJewxBBRbWn6X2/ywuA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB9053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(4744005)(52536014)(55016003)(53546011)(76116006)(66946007)(66476007)(66446008)(64756008)(66556008)(316002)(86362001)(38100700002)(186003)(110136005)(26005)(38070700005)(9686003)(7696005)(6506007)(83380400001)(33656002)(122000001)(5660300002)(8676002)(2906002)(71200400001)(508600001)(44832011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?yjvKI/cRhxPcoP3S09ZNuVldA7o4qyFSpYQyytudNl0OuIfPJut/Iuxmtv4c?=
 =?us-ascii?Q?TwWBDOUgtT2a1q4gC54RKns3n8xLFQ8XcRKHq5/t1VGS9pcqbKVDma+sa0QJ?=
 =?us-ascii?Q?rlh9KaZIYhhKrwyLF1GQ4eCPLizi92ybLtQMoF4dycz35pzVp8+j/9AkgtTd?=
 =?us-ascii?Q?64D10Lhl7Qew2Uykyo5HsZ1lllF2I4L/5/5Iv+gplM8ZwBZi1CDDX5KJHmq2?=
 =?us-ascii?Q?+r2dmwfKnterv0wl/r5IuhZKrvch13PK/fZqhD+qc3V+MQNxYIssCDmPlo02?=
 =?us-ascii?Q?nYKyCoaJh3hqagc5K4jNq9Kfh/sVF9ReDgLXDbfmGSknBOLDSSSqtB/vJAD9?=
 =?us-ascii?Q?+RLSBjbt7VKd6wY5+DxzV/UKPl1Mic6qFPEFT61ooJcQupcfE6T6P4kFO31Q?=
 =?us-ascii?Q?O9nTyo6whn18DR1o4+8ozxlwIwgL4avmfHk40XnFVG44t0+kQP538uR91KqS?=
 =?us-ascii?Q?D83xQWQ9efIYYX5SFWx5TukwCyC1XLRICiMX2TiPhWfUwccPytgU3E6HT4Za?=
 =?us-ascii?Q?0woTR0AClneTda4Fo/U5J+whN9Ycpdk1ne2dC9IxZ1D/kCd5YUvkmEUm93qf?=
 =?us-ascii?Q?pPoasRz6n/TOaIkjGD1PR4ccWTff8sM+UwcKyD55V1DICXw44Cm147x78wBL?=
 =?us-ascii?Q?Jf034yl2m8Blklf6KSDt3HslFlbW4htgmVOKlnGTaiEKvzvlewIOqVV9nZVK?=
 =?us-ascii?Q?bhrNsBIFHnyO5bSaziy5cl1+eaC8HF3OPV11NMh/V+4Y885B/rYA5++404hR?=
 =?us-ascii?Q?UpYt+hEIO51VPPLqvwXdLqXwU3u9Q6X5vy0sWMLVx4FY/X2kFhKX1gnZfnoC?=
 =?us-ascii?Q?/azJMCaUmYwtgxz35WP1SIf9CpYi0Qia0wqCN41Y75jhvXghRk0qCQQGTVfI?=
 =?us-ascii?Q?rY2wp/7UUXP+p2JFylnUW56q25bn3tYfB1YiRu+B+/rwA6v0d9IhaxDKZ+dQ?=
 =?us-ascii?Q?DywT81DLlgdaVpIslgMKqjJkeGuLT8+cEVngZV04CgfhxDVzEELwdKrKzj0u?=
 =?us-ascii?Q?tAPTLo0Yx4raBzUKxH2VJZdr27yEHfufKZMwVRa+qM6fjI0szDQG1DMLpw0Z?=
 =?us-ascii?Q?+hjtuqyQ8WcdU/4jzN6QwwEJDjIYfbAjrWHf77V1AifgAd0VVyRBqdSbr8mf?=
 =?us-ascii?Q?M8OlOCOXmCakkuRq2KM8sAjMknXGGErR7IvVHCKKXicS48Z2HwFfqEY+tqFQ?=
 =?us-ascii?Q?Cd3y4Z58z8WRaQyKN7BA7rXcIwH4hiF2h3DRQy5kFVCEmFEaJxHwyQZTZLwZ?=
 =?us-ascii?Q?o3URB2cMxBBnUYE5WJnI4QLWwoHq0Is8fN0yY1C7WNiHN9yDbqDVxd6k1gWg?=
 =?us-ascii?Q?NbeGxmQ/KDOWBWs33ktiG73Mk13ddq/L5nra7atbm3mwQ+dHVYwHa9g3Yknd?=
 =?us-ascii?Q?P7SuVdu0Un79ugPFEVA223XG4t8L+4VDUUS047Jk4rhzgAZg6c4KVM2dqwzy?=
 =?us-ascii?Q?6nmsPQmXdIeSJ4GhkcHvUB3bDFRT+hnBF3GsGJTCV4en+43cmHtMwqu0ghjE?=
 =?us-ascii?Q?+2HlokvbYq4TU73JifyI9aku0KifYNeK4INpqXpdeWSAtcM9Y1xlCLbV3S3c?=
 =?us-ascii?Q?v9JauiN9lebTOrOBN3ndInG5uLl5ZcMpFCWGfa/qyJAMeTZjP0Eon5zLgdQh?=
 =?us-ascii?Q?sw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f587edd9-8df3-42e6-c296-08d9facb3745
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2022 15:01:36.1166
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 bGMhiP3E2oocZgyNZQequ7L5h0yl9zg/hMrkzomuA9Em8EyvJd69yESFLLXSW+pcLU767ThZI8ikKe0FdqPRww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4795
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 15:01:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162506



> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Richard Purdie via
> lists.openembedded.org
> Sent: Monday, February 28, 2022 8:57 AM
> To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>; openembedded-
> core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] bitbake.conf: add BB_NUMBER_THREADS to
> BB_HASHEXCLUDE_COMMON
>=20
>=20
> Just to check, are the meta-imx people aware of it and able to fix the re=
al
> problem?

Yes, I will fix it. Thanks!

Tom


