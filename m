Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5612CC5B543
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 07:42:28 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.72])
 by mx.groups.io with SMTP id smtpd.web10.10672.1749022944860669637
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 00:42:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=k175/MZ6;
 spf=pass (domain: siemens.com, ip: 40.107.247.72, mailfrom: adrian.freihofer@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q/pp4hoimjAWsB9wS8hJSMHUlU6lLXEe/ZV2q6SMtOz3mt6jlgHZW8JtTdlSLztXPknK9ofBtv83u76Qcw4kbn4JHZ/BZkNip/YkyrjFoO5bWBsAw/V1BCY8FIPRxcH0vO3PS18ha82kPzaVRK837LBQ5Vn032mcEJTxo2frDsbpDwc+LODoUM2zhWCLi0jQ3pnh7cchwLDYNlpoDp9DbFMBEM4qDjkxgorsWgl2T+cmifu2TTkkshsi+ijvvIQet0gWxuX+etuyBCYoDdGZVgLu/nXlFJPMBYOcRwflxppJqq63u2BVJhp/5FuPYgioNnqd0ZqgO2HVfKgJpzmfZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+mB11p2C99NaLko8njN8gqoeDyc/p8qycUcz55Kji/M=;
 b=VLz9W6TedYQpjyxaKaYHxyEPGsqYtqxayXmE/kvWI0mv+qtiBTMSBfTWk8IxqVyI2jiYQ1YhuwlikuotUR0YAqCblZOgHU6ctLGgQXV0cLwN/MF6MeMX4LN8NNXig2Y+nP3JAB97Egh6SE4nrNjhp2+OhTIw9RNn18N7XlZmjt25ANhI22uZ+gqm0Xzr4L6CprwOXGMqWRwLSuCH6ZR6SDz9Nc5fgZR5qeDc1qw7oWgAZx+pzq5dcy3mekUCLaiW5okpR6pYNTjDr/UBXKfIsBE6TZOU38hDrrFU5puuwfH1D5w0C2nQ2ZMD8wcq1i9t3fLAd4WlxIl05iFUFvENXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+mB11p2C99NaLko8njN8gqoeDyc/p8qycUcz55Kji/M=;
 b=k175/MZ6Nqf7S2W+eZSQtWdP3LKbrL5qbfW8MD0t+sa8dWnGwY7Av1C15NuQ11nfn+Rg9qvjwvjlmmPrY+AKjHnsDUdKPaNC2A57VBSDiBC2bS9da7F1YgtcUKC4qLi6iZOicxkJ3K8/cSsCkZLOFpl9zaEospGnFuNHJQF9a3R8NJttmCh8r4G8P1IXUMZ1eIYGRGR6xihU7nn+WWWnxQGC/oNiXQrG1RSmkp64mo9jyP+WPB4q59dbPISFzYA4OaDm84lAMtDKPlxhA73OPA3hfZMbCLskMiNCjxAR51jl9VTud6f2qb0vosQ8AaZQVIerPu3mZk0FKqETRb17Gw==
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:13e::17)
 by DB5PR10MB7667.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:489::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Wed, 4 Jun
 2025 07:42:19 +0000
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e586:9cf8:7696:cbda]) by DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e586:9cf8:7696:cbda%6]) with mapi id 15.20.8813.018; Wed, 4 Jun 2025
 07:42:19 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v7 00/20] FIT image improvements
Thread-Topic: [OE-core] [PATCH v7 00/20] FIT image improvements
Thread-Index: AQHb1GDs5szeaGrcPUqPWcSZpgkA3rPxQVWAgAAukYCAASdskYAABxHC
Date: Wed, 4 Jun 2025 07:42:19 +0000
Message-ID: 
 <DB8PR10MB3529B367054D7A366541E6B58E6CA@DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM>
References: <20250603082419.409564-1-adrian.freihofer@siemens.com>
			 <dd27e615bd3ea965dee284352c90794d77854cf0.camel@linuxfoundation.org>
		 <3338cd8105d0f0832f01bb0f8b705e26f91c50d2.camel@siemens.com>
	 <18458D867A23466E.18429@lists.openembedded.org>
 <016900dc0028d234f57f41a4f16a76bfe89b10b7.camel@linuxfoundation.org>
In-Reply-To: 
 <016900dc0028d234f57f41a4f16a76bfe89b10b7.camel@linuxfoundation.org>
Accept-Language: en-US, de-CH
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=True;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-06-04T07:37:49.5433313Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard
x-ms-reactions: allow
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR10MB3529:EE_|DB5PR10MB7667:EE_
x-ms-office365-filtering-correlation-id: 904219eb-63c7-438f-ee5d-08dda33b5608
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018|7053199007|8096899003|13003099007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?gFaTJV/V7cS5lHT3gZlfl82Tn/Ym9nZgfYAMcibQS4V/SHMztZW5QTZK9k+y?=
 =?us-ascii?Q?gwU5tpDtzrL+KrfHT8PcvsYrHXnwo60gbAgcA5PX2wPcy0joeYZh3KeIbYvV?=
 =?us-ascii?Q?jVC5+mkSQwoUNTXaf7hIN6u3XxsjGip/BbWCCOhwtJF0+hZEiBo1QLYypoLN?=
 =?us-ascii?Q?QPWBjEafyDnkqmnNcRKiB1bqrRRrDKwYAGmrPO/x6z5zOACldLG+86UhqxMt?=
 =?us-ascii?Q?LSTw4PMKPKAm44QxKOc4U9Ghjm5rTAvfV0gOcCjqqtwt6mxldpooYw2VIPBB?=
 =?us-ascii?Q?bZ9IGUQInatWuIOMm8FuTlhTgnJfRwB133QXVijVpOXjWt3ozaIeq4zYkgSQ?=
 =?us-ascii?Q?MJNuY3NQePk85dNVRG/3ytAt4vyIcKEG+G+w2faJ2SwFir7Rr2N7f6n3D8Dv?=
 =?us-ascii?Q?jaq5oJiLmlbQU9TqdXGSFP1UM4LKzcyG5Wdd121Vh2uhXWwDlazs7MEbfucU?=
 =?us-ascii?Q?GIqB5HXe/3ts8AasAUGm3HtSiWIV5jQPHza3dKRDB09iAAuIBqSAhKlETW1s?=
 =?us-ascii?Q?woemzUNUjVemEq944//i2dLwjZRgBDqywZzU6TDMDfUR9cCnbt5Rs5nG+A9Z?=
 =?us-ascii?Q?8kelykJP9rApjxakDUNfz+5X1K9a+rDMGgnIF0fKbtDgB/hGzHzKMfSOXwFi?=
 =?us-ascii?Q?5gzLRw4JhG0LteaLlCTgdQgeuMMiSQvzoFa7Z8DBIw24+O89Mm3zv7r8fuR3?=
 =?us-ascii?Q?L3e4zXCjwJPvrE2nrLbhOFQg69fqtXU7WsFAEKUU0fz3XnYYAlWs9H6Rcrci?=
 =?us-ascii?Q?tkAusa5CA9mgEU/ki6+iy8bj+gFkxk5TMufcFXk7/oXMo12zlMLy1jXYsZgP?=
 =?us-ascii?Q?/hCHhfD4LH/EhhwK54+BroJLwITrjAf9rLrIyWm9a9kmBHiqJ+LP50qiQCIV?=
 =?us-ascii?Q?tA9jBcQHr+gmXTLQf0+UddUv8tUII+9cI+LvF3Qif4k2jmNuCIZTCMeqO2Se?=
 =?us-ascii?Q?4EshpstknJ4WC8NUtl7z6QuZG85zSaaW6tIKP8vQ8EUDlKmKFcAOW95sHr9Q?=
 =?us-ascii?Q?/bJaXCd92v7mwzAq1lv2w1J5++CwHc6tc5kcaP11VUeLdGIeNvaKQZx6NjR6?=
 =?us-ascii?Q?DqlHzyfyVo8+t+ZRmThWB6o2jSUZbUwsOn7bvEupMK40zLKlllim7J6p2DCI?=
 =?us-ascii?Q?zJN28PjwYvb0+MolK7NbZT/05gJGd2oNETRaioirMMB0PNcRtvab+hUBpQg6?=
 =?us-ascii?Q?0VDWmX6LKmivgkKfF6jRFd5NamfIEEX6fBX4TArhwX6Yr9akNy4p3cze2Cgc?=
 =?us-ascii?Q?fgr5OGO06Gg41oG2Lrzbk8KRmTlP3sLZC3fW/O1xfQuel2rd+XRdalVZxTnL?=
 =?us-ascii?Q?3t2+onBzay03eWsqk6KUhicGVJbnETXnvpF2ga9xA9krvduXbD29LgShZax3?=
 =?us-ascii?Q?eFKwViupxTrJHJurSaxJLjuqVzg25yYdtKVCtGSb8P/PJF7T4t3VCK4WuETt?=
 =?us-ascii?Q?YI83h8HrvBE=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007)(8096899003)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?0PpMsB2DoEi7X6xVHs8PgG2rJ1my48o0Dx28fXyyzQPBlp/rOgfFVW4y8OHA?=
 =?us-ascii?Q?pOo4/0naAGmr8H9aQSSutVkz9n7JIP6GEC5mw+JbqY9133ewF6ZVNRqETpeu?=
 =?us-ascii?Q?VjIkAhaGUIOWd/BVgUsRcKU95tp1CK5i8tp9SOznaGwjjq2x0G1ABYkBgtDf?=
 =?us-ascii?Q?o+jOFIjA14VtB41AMMVezC2vOwEGh4PzRrpDcPBnfDvpkn4njkH7PbLbEmIg?=
 =?us-ascii?Q?sTYGFuOW7W4lnNHXw2DIhtOxbxtybBmSU21+CyenybIBpmjP0hdnwsHcvqry?=
 =?us-ascii?Q?I9NOfXUwVgyFCL8BmzvUrSO8YKzFEkq0VEwjtX9RU96i0Kykaam+Wa0+TC8X?=
 =?us-ascii?Q?CQs43GhbUeHPOdK/gITdVPLDynmozV4uIHvI71G7cCGhLk9xt8zby/cnWGJ1?=
 =?us-ascii?Q?lwqw1hAcBZsXXI06j/eosCMkQVwsw1VQfPO1hR00XT5Y/VkR8T7tTuEVxKw+?=
 =?us-ascii?Q?FVC+/1+UJmseK9vXNa4S5DF48NivCAAjSy+sV21fjMZxDSCZBkxsTVXQADzw?=
 =?us-ascii?Q?HueStKMLw+guF7We/mePxgp8K6gyvl7aOGJ+2TP1fHpge+K/x+UZEykb9YLZ?=
 =?us-ascii?Q?JasDqa6Tx6fnu4eycRARKAqu5MkHBRq3013DjSc3p0QpIp6PGA6/hnikYdC0?=
 =?us-ascii?Q?RZ+nYmEZqYNlKFpmAd+IXrXuRxIoQw29B5gTKuu5XusPsZtVNmSPovh+5PtL?=
 =?us-ascii?Q?u0liMMA/6JKGxbV0h65077P0sd5nm58mlRATs0wn7x/9ti4fIVvJz9PEXfEC?=
 =?us-ascii?Q?76WuB5QopvDVxn2lr3roC7ckdBuEhiRiScl+BCGpZtbYth1pytmcUduYjelv?=
 =?us-ascii?Q?B5Hka0IGg4ABC/7l6RyOVyzDthVlQiFbh6IDSnMi2LvuZf9jv82s6X6iq6m+?=
 =?us-ascii?Q?LNU2myNLruJ8xpwaB+Us053v2n6/YEV0k04528dum/rEevYOdKt9NswUhut6?=
 =?us-ascii?Q?blhQeLueRFjihFAShctbhMRRA2ALeVR3XWuEzzIiDJvLk4Vtctrm4m7lnyxA?=
 =?us-ascii?Q?mOgfuazAuVNLpyWW5IQbA/C8F7f46p33JaJz+E1pyvwDp6ysKw+HiSoDH81x?=
 =?us-ascii?Q?3aA2erCgyXMjR4ZLvcDuI4nTQ0qJvYHC2q3SzyABBXVFIgM3vrQ2TMIsrQKZ?=
 =?us-ascii?Q?Om7DmqO2+rgsVxIXleTj6piOQugTw8twk+0/k60388JXaqZqnSGqjG0qY9r0?=
 =?us-ascii?Q?xbNxCQ0OdMTFdCKJPZ/mt2IMQuVogNzEW6gD6tLcT0VPX05TDYmiFASJl5SE?=
 =?us-ascii?Q?JA6VezZafKD8zyG/RxP+L1jY/CulJRMzVn4s4Kf4kZmzgx3KZPu/ZT8c3MJ/?=
 =?us-ascii?Q?yMbpsTg9qk3p9EOgjbpPqKxMEURqb5SHtJ5Ak0sMUA6kRroPdYosk9Kq3k5f?=
 =?us-ascii?Q?DL1EtugrQhdQjhWO4X03vw1trDYJQVJFR3e5LDGWheiVxOmfdFAlbigRUs9B?=
 =?us-ascii?Q?TIY6xoxltJ/Q++hXmELm0sgS/8nqi3LlSE7kB/lshIGhPupvF0SFU4UZLYSO?=
 =?us-ascii?Q?LHkSnXU+P53agR7j0B38yy0CmVO7RLZ1VOxHD4q9CdUR/pk5iTRhzEcyIFA8?=
 =?us-ascii?Q?gdqc7eYgYJ5DfOs8V9bhWPDCFygwD2tqkZSrivMRYv6RMxG6jWGW3MuZH4Zz?=
 =?us-ascii?Q?L5rt7mIptFLQJzHzSPvfc9U=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DB8PR10MB3529B367054D7A366541E6B58E6CADB8PR10MB3529EURP_"
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 904219eb-63c7-438f-ee5d-08dda33b5608
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2025 07:42:19.7855
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bltk8YFr/ghZkw9WqgHUCCfLe5bVfvpw4qgxOmbddUxLI8zXQuLK2rA63Gzn7tGbZug1lZMWeVxFidAbklTyeqcCIT14UX0kEYrtp69Ok0w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR10MB7667
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 07:42:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217843

--_000_DB8PR10MB3529B367054D7A366541E6B58E6CADB8PR10MB3529EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Richard

The status on master-next looks exactly like what I wanted to send as a nex=
t version.

Thank you very much!
Adrian

________________________________
From: Richard Purdie <richard.purdie@linuxfoundation.org>
Sent: Wednesday, June 4, 2025 9:12:25 AM
To: Freihofer, Adrian (SI B PRO TI EAC CCP) <adrian.freihofer@siemens.com>;=
 openembedded-core@lists.openembedded.org <openembedded-core@lists.openembe=
dded.org>
Subject: Re: [OE-core] [PATCH v7 00/20] FIT image improvements

On Tue, 2025-06-03 at 15:07 +0100, Richard Purdie via lists.openembedded.or=
g wrote:
> On Tue, 2025-06-03 at 13:35 +0000, Freihofer, Adrian wrote:
> > My conclusion is that the change requested by this discussion
> > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flis=
ts.openembedded.org%2Fg%2Fopenembedded-core%2Fmessage%2F217730&data=3D05%7C=
02%7Cadrian.freihofer%40siemens.com%7C31c6cb75bba348b0d27308dda337299f%7C38=
ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C638846179522472153%7CUnknown%7CTWF=
pbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIj=
oiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3Dzkpt560K%2FYkjU4xKLxPb6flMf=
QNczI6nM8u85ZlCwRY%3D&reserved=3D0<https://lists.openembedded.org/g/openemb=
edded-core/message/217730>
> > makes the linux-yocto-fitimage.bb incompatible with bitbake world.
> > I guess that bitbake world would now fail for all build configurations,
> > not only for musl.
> > The background is that the kernel artifact (linux.bin) which gets
> > included into the Fit image is no longer built by default. It requires
> > KERNEL_CLASSES +=3D "kernel-fit-extra-artifacts".
> >
> > I guess that this !fixup patch is the solution:
> >
> > diff --git a/meta/classes-recipe/kernel-fit-image.bbclass
> > b/meta/classes-recipe/kernel-fit-image.bbclass
> > index 6d80cd4bb47..d2eebb88bc2 100644
> > --- a/meta/classes-recipe/kernel-fit-image.bbclass
> > +++ b/meta/classes-recipe/kernel-fit-image.bbclass
> > @@ -7,6 +7,9 @@ UNPACKDIR =3D "${S}"
> >
> >  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >
> > +# This bbclass requires KERNEL_CLASSES +=3D "kernel-fit-extra-artifact=
s"
> > +EXCLUDE_FROM_WORLD =3D "1"
> > +
> >  DEPENDS +=3D "\
> >      u-boot-tools-native dtc-native \
> >
> > But I need to test it before sending a new version. And today I have no
> > access to my build machine.
>
> I just saw this and it matches my other email. I also just realised
> there are mutliple other world build failures. To expedite things, I'll
> include the above change in a test build.

I an confirm this did build successfully. I'll just clean up my patch
in master-next with the above in it?

Cheers,

Richard

--_000_DB8PR10MB3529B367054D7A366541E6B58E6CADB8PR10MB3529EURP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div dir=3D"auto">Hi Richard</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">The status on master-next looks exactly like what I wante=
d to send as a next version.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Thank you very much!</div>
<div dir=3D"auto">Adrian</div>
<div dir=3D"auto"><br>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Richard Purdie &lt;ri=
chard.purdie@linuxfoundation.org&gt;<br>
<b>Sent:</b> Wednesday, June 4, 2025 9:12:25 AM<br>
<b>To:</b> Freihofer, Adrian (SI B PRO TI EAC CCP) &lt;adrian.freihofer@sie=
mens.com&gt;; openembedded-core@lists.openembedded.org &lt;openembedded-cor=
e@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH v7 00/20] FIT image improvements</font=
>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Tue, 2025-06-03 at 15:07 +0100, Richard Purdie =
via lists.openembedded.org wrote:<br>
&gt; On Tue, 2025-06-03 at 13:35 +0000, Freihofer, Adrian wrote:<br>
&gt; &gt; My conclusion is that the change requested by this discussion<br>
&gt; &gt; <a href=3D"https://lists.openembedded.org/g/openembedded-core/mes=
sage/217730">https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A=
%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-core%2Fmessage%2F217730&amp=
;data=3D05%7C02%7Cadrian.freihofer%40siemens.com%7C31c6cb75bba348b0d27308dd=
a337299f%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C638846179522472153%7C=
Unknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXa=
W4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3Dzkpt560K%2=
FYkjU4xKLxPb6flMfQNczI6nM8u85ZlCwRY%3D&amp;reserved=3D0</a><br>
&gt; &gt; makes the linux-yocto-fitimage.bb incompatible with bitbake world=
.<br>
&gt; &gt; I guess that bitbake world would now fail for all build configura=
tions,<br>
&gt; &gt; not only for musl.<br>
&gt; &gt; The background is that the kernel artifact (linux.bin) which gets=
<br>
&gt; &gt; included into the Fit image is no longer built by default. It req=
uires<br>
&gt; &gt; KERNEL_CLASSES +=3D &quot;kernel-fit-extra-artifacts&quot;.<br>
&gt; &gt; <br>
&gt; &gt; I guess that this !fixup patch is the solution:<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta/classes-recipe/kernel-fit-image.bbclass<br>
&gt; &gt; b/meta/classes-recipe/kernel-fit-image.bbclass<br>
&gt; &gt; index 6d80cd4bb47..d2eebb88bc2 100644<br>
&gt; &gt; --- a/meta/classes-recipe/kernel-fit-image.bbclass<br>
&gt; &gt; +++ b/meta/classes-recipe/kernel-fit-image.bbclass<br>
&gt; &gt; @@ -7,6 +7,9 @@ UNPACKDIR =3D &quot;${S}&quot;<br>
&gt; &gt; <br>
&gt; &gt; &nbsp;PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&gt; &gt; <br>
&gt; &gt; +# This bbclass requires KERNEL_CLASSES +=3D &quot;kernel-fit-ext=
ra-artifacts&quot;<br>
&gt; &gt; +EXCLUDE_FROM_WORLD =3D &quot;1&quot;<br>
&gt; &gt; +<br>
&gt; &gt; &nbsp;DEPENDS +=3D &quot;\<br>
&gt; &gt; &nbsp;&nbsp;&nbsp;&nbsp; u-boot-tools-native dtc-native \<br>
&gt; &gt; <br>
&gt; &gt; But I need to test it before sending a new version. And today I h=
ave no<br>
&gt; &gt; access to my build machine.<br>
&gt; <br>
&gt; I just saw this and it matches my other email. I also just realised<br=
>
&gt; there are mutliple other world build failures. To expedite things, I'l=
l<br>
&gt; include the above change in a test build.<br>
<br>
I an confirm this did build successfully. I'll just clean up my patch<br>
in master-next with the above in it?<br>
<br>
Cheers,<br>
<br>
Richard<br>
</div>
</span></font></div>
</body>
</html>

--_000_DB8PR10MB3529B367054D7A366541E6B58E6CADB8PR10MB3529EURP_--

