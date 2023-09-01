Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFB9DCA0FE6
	for <webhook@archiver.kernel.org>; Fri,  1 Sep 2023 10:17:57 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.61])
 by mx.groups.io with SMTP id smtpd.web10.3035.1693563475248229993
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Sep 2023 03:17:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=Udo0iJi0;
 spf=pass (domain: siemens.com, ip: 40.107.105.61, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CYb4mV7jkRc2xwbg+ubkaHDwDnsaRUKp/EISL+VB72IClxT5QXo/61Zi6Y0kTfUlMp48jbzKfOIvsavzYbF4pRDOENCk4/nfhJEyYZgpRUxfrRZh3GJNj+NEoJZVC4hBWPI53Viv4UZtzgaEQ27sWLbcbSWf9EDRoSlMFBf36K6hWimMEN1NIhEnF/vfz7WPwN5r2gBZGsybPG+6RDgdHq/CaG1lyfEGj15gXgio4kQIj+05Q/zeowYyVH9fPfcvLc54NdZjhgh1RpFTd9BZewwAfuEP3YQSvde9VGeOKVUde7+/12qABf0GfjFdRXxV8GFZA5mk2FiIJC3QwiDIZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=97K3EbBn5lViSGgqvrdKSANsEJUcpshd6BqmQDXE5gw=;
 b=FXimbvqSo9+/Ze46INT3T9uZRyWDu4g5zRhEAHT4KwvIamSBZvgFL+8lcvgg2m27Z8mVDQMXOeqnFH1aatCseGaRZdVe6vtO/51PiDq/W9QbHvZZwIaTDbtzzKi8puLXRaLQP+b21Lb+WqLBCarIx9+R1K3HPBoxnwja77QWnoSy23JZ7xnpmq9yI5uP4lLXr/VSC8ZxkdZJCPriFexk1xkXzoJHSzQWYUqPGZgK2aZGCGyhDkFMSv1V5Ih/bOQ+L39tlkjUgXA5FkG1no/tQ24s6zpj3jbJtStygVf5THuyDrNGnM+9qOHhDnJumusR8YO5nZWX8rMCsc5Yr30G9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=97K3EbBn5lViSGgqvrdKSANsEJUcpshd6BqmQDXE5gw=;
 b=Udo0iJi04xWm0VJJkjwNMjSTbdvmHvwp0lHNro8axP5t5UMvHZgHJrhAVF/AMmuVxsvDGGuf4Eciz7LmEYN+XWx5TxMb0Fuki82GxzLP/KTAcE/vl4x+QLuywlVSgC4QkScmWHocoFGeqzBHkp+IE7eAVtSLIbHWUkPBMuGQivqz95lD2X5qL5RV70jo2fUFBP3aUT0M91T0t1CZV7ETD2TpeGe3XvqQ1f2KrSs/hTt6Ho3SMLmDoattydGMKAOGkMScILOsNk+bZxJc/kCjuEh5zdJT4QIzWHmVk/Fb+a5LlTpLfRXlCHlBd+kP6qI1osLzTCJW6Q0mgZG9+8e41Q==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS2PR10MB7504.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:590::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.25; Fri, 1 Sep
 2023 10:17:51 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::252f:e0b5:470c:b374]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::252f:e0b5:470c:b374%3]) with mapi id 15.20.6745.021; Fri, 1 Sep 2023
 10:17:51 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "dnagodra@cisco.com" <dnagodra@cisco.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Steve Sakoman
	<steve@sakoman.com>, "richard.purdie@linuxfoundation.org"
	<richard.purdie@linuxfoundation.org>
CC: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>, "xe-linux-external(mailer
 list)" <xe-linux-external@cisco.com>
Subject: RE: [OE-core] [master] [PATCH] flex: Exclude CVE-2015-1773 from
 cve-check.
Thread-Topic: [OE-core] [master] [PATCH] flex: Exclude CVE-2015-1773 from
 cve-check.
Thread-Index: AQHZ3IriHaT1DV2PUEC9CPagzAANMLAFwcwg
Date: Fri, 1 Sep 2023 10:17:51 +0000
Message-ID: 
 <AS1PR10MB56979FF52E47FC8AB6626A66FDE4A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <1780AAD9BF6EA98C.27804@lists.openembedded.org>
 <SN7PR11MB6971D172A62262F969B5A85ED4E4A@SN7PR11MB6971.namprd11.prod.outlook.com>
In-Reply-To: 
 <SN7PR11MB6971D172A62262F969B5A85ED4E4A@SN7PR11MB6971.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=b35c4074-0472-4dc5-9437-8856c5792d38;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2023-09-01T10:16:59Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS2PR10MB7504:EE_
x-ms-office365-filtering-correlation-id: db21ea5f-ed2c-4181-999b-08dbaad4b30b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 As4p3xb05eOCEoKrDtTpsb8dKqskFu/z99AzEHsKRj0wiTLX5Jikq6lcthBkG4vvSSK/P1shCc7AS8ge0d/To6pVY6P4+1uPL8AjGk+PCBS7549eLguq72U1ET7M0NlXaKIhQritJmJiqRqZa/a4Vr4N4nd4FEo5lMTCRW+drD3AtrxEgwE9u68T4bIMDzU7pY2uZw+18Y1RP6LOfbx7Taih26hsNgPBy2ZlKBNwejJMHSfH0L16D/+MFFfI6ei/hGV1fZnokhYF3/8uHBxyMTMtb1EEU9uGvwlV/XW/KTRNqC7Q8X09icVgiL5ft7f1Xuo6JmB1uAQAJB7ALShoEGiqKQURiFwau7fkjYdhIHiIiemNlnz07jbPErKldr39Oltx+8fWKyRZTOrK2xaJ4OhxFjm9qY8o/f1OVIGqKjuu9Q0t68GEFZfeOieDIop8SHogi47vkyA0tVdT1AMg94zkgqnMlD+qCaScw66XjrbkUUCdlrHB3ZvQtz2vQ+zs1eJJ4seR47Y1Q8yteYf9SR3JHOs7Dw/wYTX7KfQrYubnVtxaOFZWLnW7wMPpsTlizGt/kmysiv5w/aKNrgZ527G8dGCKh0T8F225hiGjdjuIv1zpjXHdfCwHNRDAUDJB
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(346002)(136003)(396003)(366004)(1800799009)(186009)(451199024)(8936002)(41300700001)(83380400001)(55016003)(4326008)(8676002)(64756008)(478600001)(71200400001)(54906003)(66946007)(110136005)(76116006)(66446008)(66476007)(26005)(53546011)(55236004)(6506007)(7696005)(316002)(9686003)(2906002)(66556008)(38070700005)(38100700002)(122000001)(52536014)(82960400001)(5660300002)(86362001)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?AnN5lqhaw5JKt/xaqJ5xmMB/RM7nR520REfr9dBelyJwmUjE51jYFl7l8wgf?=
 =?us-ascii?Q?MvFYLE30ggcV+N+Cj40+zQWL6ZTRdorexEx6IG2KJ1FrphFalYeziBApSEGV?=
 =?us-ascii?Q?9DCqhetIhtJ0ToBQazYKuf0hMx4lzSnR+CgM/3UpqxCKqefFsO2vu8HhpbD3?=
 =?us-ascii?Q?+j6hDzzo4ukCvtz38hoBXjiOlIeYAhuke6BFrND01UW5vLoXrls7hvy05U2J?=
 =?us-ascii?Q?TNj26zCRvOsI/VybWWavZwnLnPEfx51tJ0zF8MGcSwpoH69mdOgbA/0Ii1WD?=
 =?us-ascii?Q?tg1+O8aWfdCuNuUV1sye6N+PRO/Cx6jVNsk+FhdpNStQwQrqeZtXFpi413B+?=
 =?us-ascii?Q?PQjfJOVSQXLLlHS1SFxsl6WKcGJ8n5h5NOaz/7BFCyuP9yYHb9BPEj0Sb4j9?=
 =?us-ascii?Q?mXuj75camIR+tcZKMeLQwqMgLm65oq6mHgnH/tKkjO9ZNNnA42tRHYLyyrM5?=
 =?us-ascii?Q?RFYz9q+gN8gXp6iXtXQVl527nekxprcuXVi09dVxqxudcSrOOIaDWq+lXCCL?=
 =?us-ascii?Q?Y11uFlgn4ZIwkgZkIUqa2sHK7XNQyn0AbdpUWYnEkB8+k3T2Ve7KlkLT4Af8?=
 =?us-ascii?Q?9AIPfX8nf9sp2500e9IFRucpCx9E4XBYcTxUEsu8WVK4T9v8gnNH6IDs4pJ2?=
 =?us-ascii?Q?xQ4xSWMmngvauUqHHIP6lA15U0L1wblOeoM1YQD5Ayrj9iObpa6JmU0+7Q+7?=
 =?us-ascii?Q?DW1MNJ2majtTy72fhZpzf4vyRwe47RQVmSdIo33wq4GmEvP9PPpXG7kh9DrC?=
 =?us-ascii?Q?gz9DRPBecTEq9RzSGlmmqz8C1iycD/qlOOyjZWNZ2tQqJZM5q+uStlO7OhnQ?=
 =?us-ascii?Q?YYT/o0HToehowle6H9wqSBcvomsShLoxcORCl9QPLV6iABsTBlVhKUsR0kHV?=
 =?us-ascii?Q?iqIpGrNeFYEwDPXBELmugWGtelXls+Dtnjci7ZfUawIf4RJShgaP6MEj+B6/?=
 =?us-ascii?Q?7dcIyTnxG1gVFz+DB8I2pKjIuaRVWWwfENelgVDZ1W34eFK9wlzXEsfaJpJ8?=
 =?us-ascii?Q?0IyV4MEAPRf0YYvBu7wAQLU/O+5qIKqx3QSlrD200+slYbgJ/4CZmTe3I+xb?=
 =?us-ascii?Q?UrRUUwrJJrl4GofBd/5+wGvY6SOfJC9tYTTckdv3Kqx1/JktmFoISqDoF1Kp?=
 =?us-ascii?Q?CN2+32wPLvFi3ERW9bWHR2dQcknhJ4r7YBk7I5br5oq613iEdmh+s7p2B72R?=
 =?us-ascii?Q?5h/d0Vl+eYFizAaMd4aDffiH9NlG0XWtkzAG8mJmt32KqtVzBTb9DpY3K5Hb?=
 =?us-ascii?Q?sfhqv8B6MGGaPXVP/6W5sHVJL297TC4LEVOKDbksMjmJV39l5LevTOSz9kXk?=
 =?us-ascii?Q?JdlqjE4JZayI6wt5el6YXtsdu2dV4lfk3cHE83T6bR4P4BreA5YaKhMUHdaW?=
 =?us-ascii?Q?uBCiWaS2E558jefIDObgBqwzW2OY1FmFXOCYbSNXgn/CeHoM5+k+TUF7McT4?=
 =?us-ascii?Q?SbB/HpA6WwUh33aLYODWqhWqbJSGte1EwA2TDcIMefadxnPFEUVDOyeT6FEa?=
 =?us-ascii?Q?5DzcTRYc+njOm0UmV7E0eneSnCNPz54vFhpi8jboNG/weoUD2P+5aZLDAotf?=
 =?us-ascii?Q?pTSGhMqxKPNamUzpc3wDEfgrTMVhqsXnrZQFKCpk?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: db21ea5f-ed2c-4181-999b-08dbaad4b30b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2023 10:17:51.6453
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lc9xTcOlsCJXJmUJYuy1JrkYEiFxZVxElFbxnr+BMVvDbpEyxsRry7uowczJT+dKTeDIOde3/6cOoD8nTzieoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7504
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Sep 2023 10:17:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187001

What's the reason for ignoring this CVE in all branches when CVE_PRODUCT =
=3D "flex_project:flex" means it's not reported by cve-check?
Peter

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Dhairya Nagodra via lists.openembedded.org
Sent: Friday, September 1, 2023 6:15
To: Dhairya Nagodra -X (dnagodra - E-INFO CHIPS INC at Cisco) <dnagodra@cis=
co.com>; openembedded-core@lists.openembedded.org; Steve Sakoman <steve@sak=
oman.com>; richard.purdie@linuxfoundation.org
Cc: Qi.Chen@windriver.com; xe-linux-external(mailer list) <xe-linux-externa=
l@cisco.com>; steve@sakoman.com
Subject: Re: [OE-core] [master] [PATCH] flex: Exclude CVE-2015-1773 from cv=
e-check.

> Hi @Steve Sakoman @richard.purdie@linuxfoundation.org,
>
> Kindly consider this patch for "master" branch.
> Apologies for the error.
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-=20
> > core@lists.openembedded.org> On Behalf Of Dhairya Nagodra via=20
> > lists.openembedded.org
> > Sent: Friday, September 1, 2023 9:38 AM
> > To: openembedded-core@lists.openembedded.org
> > Cc: Qi.Chen@windriver.com; xe-linux-external(mailer list) <xe-linux-=20
> > external@cisco.com>; Dhairya Nagodra -X (dnagodra - E-INFO CHIPS INC=20
> > at
> > Cisco) <dnagodra@cisco.com>
> > Subject: [OE-core] [dunfell] [PATCH] flex: Exclude CVE-2015-1773 from=20
> > cve- check.
> >=20
> > Issue only affects Apache.
> >=20
> > Signed-off-by: Dhairya Nagodra <dnagodra@cisco.com>
> > ---
> >  meta/recipes-devtools/flex/flex_2.6.4.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
> > diff --git a/meta/recipes-devtools/flex/flex_2.6.4.bb b/meta/recipes-=20
> > devtools/flex/flex_2.6.4.bb index 1ac88d65ef..5be7351f4c 100644
> > --- a/meta/recipes-devtools/flex/flex_2.6.4.bb
> > +++ b/meta/recipes-devtools/flex/flex_2.6.4.bb
> > @@ -31,6 +31,8 @@ CVE_STATUS[CVE-2019-6293] =3D "upstream-wontfix: \=20
> > there is stack exhaustion but no bug and it is building the \  parser,=
=20
> > not running it, effectively similar to a compiler ICE. Upstream no=20
> > plans to address this."
> >=20
> > +CVE_STATUS[CVE-2015-1773] =3D "not-applicable-platform: Issue only=20
> > +affects
> > Apache."
> > +
> >  inherit autotools gettext texinfo ptest github-releases
> >=20
> >  M4 =3D "${bindir}/m4"
> > --
> > 2.35.6


