Return-Path: <felix.moessbauer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1913C54F3D
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:01 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.41])
 by mx.groups.io with SMTP id smtpd.web10.7987.1650631802391577299
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Apr 2022 05:50:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=squ8mTVU;
 spf=pass (domain: siemens.com, ip: 40.107.6.41,
 mailfrom: felix.moessbauer@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ILGeV8h9om1qf7tTLmm5nVf6ZojAR9pdZ73NfMX+b0SR2oyGEAz0iwVMp0h0G9M8/DXZt2mXDuLNa5Dw4lXfw1FozAzRGXUlOGUwTZI7Bk1Pcv/5jfxzjlWZuJkdNrQrsLANjjcTdXNKcsRP1EBCSw0lQocKWoVcejU4io7YkG72Uys6ccUr9juoblp7LfZ97g6Q5TlB8SuwTofBpWc44TWi3+/D6cNUngxxXPqcoHRDPwmiIAbOzvCfDsF/O9JFnFzptm2VJmIXpblm85jZl6RBLc7jnIDH9zMIc5q7magkF/RRrDIsvBaIhbzHe4UJvMcmvvV4bieXcfiDsgPeTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A+gRZMnc+SJCfq6QYHvImamZjBddt0B0tWW+0jx2ZuI=;
 b=laaBG2CEabHQkRq5oTr6evByx/K89Z45hVKv9YoTfFjAGlDIGRZCs3sZw4otnAfMvRrpfUwIWqd7Ce4ry28xE1As90cN8VGgeHi0MqJX6ATLZ/wAklOuAcVtDBTNJL9QgVgmT+JyMIrZsXQJTtrb9PylhwqwtVxCBV2woL2E2NAeqwacqBWEuIWykWuYPaBldyxP27YaNsRlsYzu46KxYzt5nu9sVpIWP5pMe7fOppO6jexnAwgc27yojEvM9A0gk+905yIyFAOU5RzR3h86hcINdQ3mIIVilW6NokSXOblzDIvT8XtXtGGkiwGD+/fHaQu9tuRoZV4xDv54V+dk+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A+gRZMnc+SJCfq6QYHvImamZjBddt0B0tWW+0jx2ZuI=;
 b=squ8mTVUMZsbe5af01hU8mBH3kpczgzx9Mxm+kuF8FV30fxyahh6vN03Qx0S+JL5kI+BLcwM9iDmlJlynvD0tnKpt/34SlJSuuTPIoM8c0WsL4qLuRlkLl1/H3G0shnPQG0K6v+K/EEWPH0qQ104IX9cHGvl5jy49mgOoOUiMxv1mOh5VPpi+OdDfokNScTmRNyxwyk6QTfO1TOBp7G1UzrnRYTjEWWC4u/GluTnQgnvno9kTEKRInc0GXk1I+HbMRvFOXzmgPHzCM36nvxlA2x8fgY1qC/RBTjPA/JP24vpJ8/QX9Bs7FZRq9obPjGAwuv6+OMSYoqWQaErZzL9sA==
Received: from AM9PR10MB4869.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:418::19)
 by DB9PR10MB5859.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:396::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Fri, 22 Apr
 2022 12:49:59 +0000
Received: from AM9PR10MB4869.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fd38:a772:d519:5d87]) by AM9PR10MB4869.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fd38:a772:d519:5d87%9]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 12:49:59 +0000
From: "Moessbauer, Felix" <felix.moessbauer@siemens.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "jan.kiszka@siemens.com"
	<jan.kiszka@siemens.com>, "Schild, Henning" <henning.schild@siemens.com>,
	"Schmidt, Adriaan" <adriaan.schmidt@siemens.com>
Subject: RE: [OE-core] [PATCH 1/1] Fix permissions when splitting rootfs
 folders across partitions.
Thread-Topic: [OE-core] [PATCH 1/1] Fix permissions when splitting rootfs
 folders across partitions.
Thread-Index: AQHYVZmz/yOQKqGgFkqgFMQaq9in96z7rKmAgAAw0FA=
Content-Class: 
Date: Fri, 22 Apr 2022 12:49:59 +0000
Message-ID: 
 <AM9PR10MB4869907AB0894E0CCADCC73689F79@AM9PR10MB4869.EURPRD10.PROD.OUTLOOK.COM>
References: <20220421160543.2718864-1-felix.moessbauer@siemens.com>
 <20220422113249.178338dc@melee>
In-Reply-To: <20220422113249.178338dc@melee>
Accept-Language: en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Enabled=true;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SetDate=2022-04-22T12:49:56Z;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Method=Standard;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Name=restricted-default;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ActionId=bd45f27a-3e1e-44c0-ad1e-a135cb4e7729;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ContentBits=0
document_confidentiality: Restricted
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5e656c37-3bfc-4b24-90cf-08da245e9c47
x-ms-traffictypediagnostic: DB9PR10MB5859:EE_
x-ld-processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
x-microsoft-antispam-prvs: 
 <DB9PR10MB5859D475EFE03292AE32C44189F79@DB9PR10MB5859.EURPRD10.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 vldBNQolYECIHXYVcM/xrxTPdk9k1nLr0ybk8axrbh9+IOhTUjLpweK/0EpPS4w14ogvNJGh0V6PBKxYyrIo45s1rD2vVafS5tXtaEuXFdjc1lovgB8Qpb7ZAYhSKXBlO0V35xBXBOcA+uoFnQ8p1PLMjgaCeMalMJTStvddqNMe5IcF04dOdK1NRt+slsV5nu3DDEJtJk239OM5246FjS5QnVJ4Zx+RutGpgkHffudIVv1rBT9of4M3PTr0qJ4vxw0MNNZH+S4di6Nvposzo5LpdrEN9paCf7/xycYO60fRbB1V3deZrw4ShNyshCTMwKLeIhcZNngDz0u/B4mNjMk3p+2tznAUm8PYUT3gMIrA82S39f+txQPvYki8LKx0pfGqiabPV6kj02vd82JX83JvFhJQFfMfBuEiIUcrJChCI1N+QEiHHjZZilL1au/BtRBRmL0P39sfRP3urCT18FJx5XRWqvuIaw5sw7xXi6q0bShOaF2v10MRRaqhLz6JzGQMz6YQCPCPuhgf+J1zWDe7279DiBlQRRmV97LFiYLOaGqPHf8vHUxH8RjoUibZTAvallq9hAojffzj0tRMgXFchVBoYuv6VT6Wu9BMNgVjkogE73GRRLWhc0KXEDJnhiw5mRZwO+RqbJgIM+7QH+gVBnKFXiS6igPXPtnLGXb93UFJXQ1axq4z6lqplyn4pU2XkbRAcqxrogYiC9sXI0jUJ3eSRbEe2w0h1XH+e3Wyc21FaH1buSZPBkZ58UEDB2ZpoBuA4L+3tjmFvQAjBlGbhOp4vxQmXydo+gFKAt0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB4869.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(45080400002)(86362001)(2906002)(966005)(508600001)(71200400001)(76116006)(8676002)(4326008)(66446008)(66946007)(66556008)(66476007)(64756008)(38070700005)(38100700002)(122000001)(82960400001)(55016003)(54906003)(8936002)(52536014)(6916009)(5660300002)(9686003)(316002)(6506007)(186003)(83380400001)(26005)(53546011)(33656002)(7696005)(107886003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?42UvphS2v0lIcKeoLxRvn6KuG1FmK/6KI4z8vAZOlFc6SMThSz6mtM2+G59f?=
 =?us-ascii?Q?DX00yLj9lcjzHBUhPxRXE4PTT5sTyjQOwzUzn8GS+yEUnZhchBE5NElDDqsd?=
 =?us-ascii?Q?1pd1vIC6IU1O54TbkTqU44SFT8r869ZCm6NKQu4QfiX6of3nsiy4s+vtv/a+?=
 =?us-ascii?Q?gkMbNK826BiZq7FUBjAOAiaeJVaqTGfq3hfak5byqItyORRJcBJm7hUcW70F?=
 =?us-ascii?Q?I/niKOGCXST4rJSokntX8KUAFAE/W3nCVq617H106J8NuIVMMCrCN8qtvJig?=
 =?us-ascii?Q?d/NUYnHkB+a8TIQcfa8dsn63d6XDQ9NSgmu93aA/R5u32EyeI8ZHJGfROsRi?=
 =?us-ascii?Q?cKUdVHGHA5xhmenphEZzjEWqRcgVvnANdV0ZBo4YpeAUnMiNfsAfjJXq4Ewx?=
 =?us-ascii?Q?D3lnXNJjI/Rb+oznSToOHKx+wF9exItvTj/9D7uekP5m+VU4MMkyXnnQe/mB?=
 =?us-ascii?Q?TUOxuqixE7bl5qNpsfvcsyNRfE/elb+jtdWbPoInG4bwN489pdvisR1G97t2?=
 =?us-ascii?Q?wj01NJyo2P0ph4gUaydFeh+J93FP9ixwAgSBUCdFrmB6EWH6Whvtx+5Ai5Sm?=
 =?us-ascii?Q?cNFpl5pz9T4CMYTGymAb/27Y//dXmvXe21Bl3hfTfhMwugWcvZSx8ffkgd0p?=
 =?us-ascii?Q?TdfTFu4xbN5AJhzZtfOo458NZQd3GjkoFmQoyEI7NCE7lRgp7GzMYTRT9N+b?=
 =?us-ascii?Q?EaKh79/kYee0Hwl8nF3PIcAFg9/2z4xo3H6UuSsRCnH5XKYvC0FkXJmofGre?=
 =?us-ascii?Q?bk/FqjFi2YZiU7PLQa5Sw8YppQkYQfdNWZ5aDqz0wDA6WCh0U+V3zgtd32hN?=
 =?us-ascii?Q?nQJZuv6BTeiYpciTr2ejNcypgHOQGaTdyrDlYhUpGTSYWjTxO9gKRRw9iIiq?=
 =?us-ascii?Q?5EjdDbUT6PbvLTT8d/TKdIf4EYUIaWY1lXDDylLh5Ml5v9kwToidilug076f?=
 =?us-ascii?Q?lC3REWzggufHczCZhw3TENikmRgIwzbYBaiJg1+gF9YrKFyCUzXnmW81g0Ab?=
 =?us-ascii?Q?OCoxVbRsUDuVj7TmK12WlsUmLLMwGlbt2l46RAsPfTBWj2ncnNZBp9jLB/GK?=
 =?us-ascii?Q?K8V0DW9Wzl1JG/tSkp14bMLUz0srEU4rRvTSUV1C42EIsxs71Iu2R4vSETzf?=
 =?us-ascii?Q?zmHma3IuUJvcAbt5+dk1t5XmwRUu4+fR5BsEhqEB+n8I4OxVQqKkqmthsv4t?=
 =?us-ascii?Q?+bWbe1/G7AdrYQX46/feKcetuetfx2dZvQHHRj+N1zxIYgWfJLAFC+3JoT/u?=
 =?us-ascii?Q?EctCUtmyAxf5c1/y7Pfn3JTH/+2Rdnv5fEoEvuopDKT9mDwwdoTjW4c3aZh7?=
 =?us-ascii?Q?ZHwZujR/C2rwLzABQxwMNzoxk6mDi3WIg/F5eHMAzq1mcdKKwFEI7MvEvLuG?=
 =?us-ascii?Q?rxVUguaPvxM9nNkhZfYyJjM6KjT2w6dsh9bZ8hjTG/iwy9BOT0Jdm7JeKVwh?=
 =?us-ascii?Q?Bvy5ulJJ869Bv8lCLTteKC+ejquxUNnbsNUKzM05T8opRin2mrva1OY2ST4Y?=
 =?us-ascii?Q?mhopynGb1zLb7AKvoBNq8wsm2WaBTzFxb1MDYHnnQ5NT8Fk0zOzVpUJvbNef?=
 =?us-ascii?Q?xoVe25PS1jvUhkirkfQ0ZwyO2yCcJIdTnxFO83rX+610uXsm1IgxPHLde1KW?=
 =?us-ascii?Q?8BbnuWOylk0zvnv94joZZBJdM4rrdl/ypQ4AJpU9i+ICtjA+q458+Bw/ZquI?=
 =?us-ascii?Q?wb2MZSK6VL7x9FXO0tXrHEyN3slDRys8Ihisn3vTFwgS4n8JXHBa4YcEuaAg?=
 =?us-ascii?Q?eyU2TzTfSRqT+PW4WSSCloKw8ExZbfY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB4869.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5e656c37-3bfc-4b24-90cf-08da245e9c47
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2022 12:49:59.3339
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 9olBHFKIEA85RSleiC7+aUgZjdXzAC26D6mVVHxMth+rAcyY5c6Oa4z0/bl7NOR1NrJgEicNJaVxi8fHnfosuZzPnLPpn/kv0ETAyMDaY0Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5859
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Apr 2022 16:52:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164791

> -----Original Message-----
> From: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Sent: Friday, April 22, 2022 11:33 AM
> To: Moessbauer, Felix (T CED SES-DE) <felix.moessbauer@siemens.com>
> Cc: openembedded-core@lists.openembedded.org; Kiszka, Jan (T CED)
> <jan.kiszka@siemens.com>; Schild, Henning (T CED SES-DE)
> <henning.schild@siemens.com>; Schmidt, Adriaan (T CED SES-DE)
> <adriaan.schmidt@siemens.com>
> Subject: Re: [OE-core] [PATCH 1/1] Fix permissions when splitting rootfs =
folders
> across partitions.
>=20
> Hello Felix,
>=20
> Il giorno Thu, 21 Apr 2022 18:05:43 +0200 "Felix Moessbauer"
> <felix.moessbauer@siemens.com> ha scritto:
>=20
> > This patches ensures that the file database containing the file and
> > folder usernames and permissions is always located relative to the
> > source and not to the appended rootfs-dir.
> >
> > Prior to this patch, the database was not found when using -rootfs-dir
> > in the WIC script, leading to erronous file permissions and ownership.
> >
> > Signed-off-by: Felix Moessbauer <felix.moessbauer@siemens.com>
>=20
> Autobuilder testing showed some errors, perhaps due to this patch:
>=20
>   KeyError: 'ROOTFS_DIR'
>=20
> See the full logs at:=20
> Would you mind looking at what is happening?

Hi Luca,

Thanks for testing this.

While I could easily fix this issue with some if / else, it brings me to a =
more fundamental question:
The use-case we need this patch for is a partition layout where folders lik=
e /tmp, /home should be placed on dedicated partitions.
As these folders originate from the same rootfs (i.e. image recipe), I trie=
d the following wic script to achieve the layout:

[...]
part / --use-uuid --source rootfs --fstype ext4  --exclude-path=3Dtmp/
part /tmp --use-uuid --source rootfs --rootfs-dir=3D${IMAGE_ROOTFS}/tmp
[...]

This obviously requires that the pseudo dir is located relative to "${IMAGE=
_ROOTFS}" but not to "=3D${IMAGE_ROOTFS}/tmp".
But while this pattern is a top answer on stackoverflow [1], there is also =
a note on the ML that this is not supported but instead recipes should be u=
sed to split the rootfs [2].

Felix

[1] https://stackoverflow.com/questions/56187209/yocto-create-and-populate-=
a-separate-home-partition
[2] https://www.yoctoproject.org/pipermail/yocto/2016-March/029300.html

>=20
> Best regards.
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbootl=
in.c
> om%2F&amp;data=3D05%7C01%7Cfelix.moessbauer%40siemens.com%7C42464ff
> f659f4d18db9808da244312b4%7C38ae3bcd95794fd4addab42e1495d55a%7C1
> %7C0%7C637862167736296029%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4
> wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C
> %7C%7C&amp;sdata=3Dru3bzQkMbII6D3kBpkB7unbzP9mgnu6k2Y%2BnZjHOqR0%
> 3D&amp;reserved=3D0

