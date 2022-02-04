Return-Path: <bevenson@melinkcorp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66DE7C433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 15:01:19 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.98])
 by mx.groups.io with SMTP id smtpd.web08.10131.1643986878358083812
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 07:01:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@melink.onmicrosoft.com
 header.s=selector1-melink-onmicrosoft-com header.b=OHzivOZ4;
 spf=pass (domain: melinkcorp.com, ip: 40.107.93.98,
 mailfrom: bevenson@melinkcorp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fmsZe/1+Ao9li0xx05tBnyPfvqMpZXyo+TbsL8BKY8usX+qva15ni4cvZ2yQ6jozPynE+LkfqA+HMV1bF5WswtjZYp3U0ORJLIR3BsUd2ttH80kWUvQlyt837/CBUBdZN57nTQ8UumZmc/v+Fqx9WGy3YF6+Qk0cnh07wgpb7upmNsiishmooBz8WyS3LJPUCW6R+NOOSlPGs4AX8PtaSIoEgJ4sIJKQwh2YbsfnUdMbG63k3bB3E6XWvvgn7xl2bIlIC6jUMePcfl4KXg+6cJSab/mVBZR14HL87Lp8GGH8XInueVq42O+kIOU3Kp2IkpuydM7cTVPhhloW2neXmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hDUtEY308AOchA0kuhlSKC+t+FEF3LnvBMcitdk161I=;
 b=kTyWssnN5dZ8PiUS3PlZo1b19WcKfHu0LhdnhY1+DfyoQY1+bHYl2/gPf6Jwe6tHedMwiYVM0+qTeJjOBDNMB7+FCWBQ8fJ91rhKs5Qj5jqaEaT08ao7rGNyUrP7TktMC78CrqBa8Bh2EGnUkj39n0hGu/XgBUVQHlfNO6EMop+cA2GecfooJ7nxk6Vea7Dh4soym+8zFBWERmqYEdUkqe/BrwjYQONFdKirmcX+lt0ZRQjbWu+PKsWXpVHJAvjF3Af0Jjfwr1WvDEKzJEoHwcs6aM7dqr6X7iGKBAsvvIeSlmt6yizsogvyOjsIhFWmJnUC25suvy4kxL7g3LRHzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Melink.onmicrosoft.com; s=selector1-Melink-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hDUtEY308AOchA0kuhlSKC+t+FEF3LnvBMcitdk161I=;
 b=OHzivOZ4JzbqbjFPGoanGdeTjCCkxY8k8p7UAOBYXyS0cTMHl/9e2uoIB7LnBKsnoiAuE0nUsTL00ep7eHtH83y+tia/gfS1MPJTGhqJYa/e/1nlxq//yemITIG4xCJzMc/Q6LTim6PN9zDtV1F49mjIN59Iuh8XDnQQixN5tzfQY3DERcKm3xXdWV7aYMiqcQgjvc/Ja+yJt5VR6RSXSCUh+to4I0h0TAa5DBhTsEazPK5yrbCP0W3nAX5rUYmg+rE2ZxEnjg94QQzXV0UePJ9GNiRtY3Z1DuP38x+dRT/V9wdvZyky5Uf6HuSTmhJZ00Y+t/yIpurfKOJS9T+zaw==
Received: from CH0PR20MB3948.namprd20.prod.outlook.com (2603:10b6:610:c6::22)
 by PH0PR20MB3703.namprd20.prod.outlook.com (2603:10b6:510:29::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Fri, 4 Feb
 2022 15:01:15 +0000
Received: from CH0PR20MB3948.namprd20.prod.outlook.com
 ([fe80::b805:3743:bea:e7d]) by CH0PR20MB3948.namprd20.prod.outlook.com
 ([fe80::b805:3743:bea:e7d%5]) with mapi id 15.20.4951.012; Fri, 4 Feb 2022
 15:01:15 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: "enrico.scholz@sigma-chemnitz.de" <enrico.scholz@sigma-chemnitz.de>,
	Alexander Kanavin <alex.kanavin@gmail.com>
CC: Jon Mason <jdmason@kudzu.us>, Yocto-mailing-list
	<yocto@lists.yoctoproject.org>, Patches and discussions about the oe-core
 layer <openembedded-core@lists.openembedded.org>, OpenEmbedded Devel List
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [OE-core] Inclusive Language Proposal for YP/OE
Thread-Topic: [oe] [OE-core] Inclusive Language Proposal for YP/OE
Thread-Index: AQHYGcoiZ54l3O2lkESg8ug3ybpvMKyDawQAgAAFCuKAAAYAsA==
Date: Fri, 4 Feb 2022 15:01:14 +0000
Message-ID: 
 <CH0PR20MB3948522D8A65FE1CED08EA37BB299@CH0PR20MB3948.namprd20.prod.outlook.com>
References: 
 <CAPoiz9wL16OTzxNHdw_5-L72GOHkhhM0--WZF7An071cx6sr_A@mail.gmail.com>
	<lyiltukbsk.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CANNYZj9wOzJ-gp+HVP-915AQp9d-D_PN4GrgPqaC0ZLVvzbgqg@mail.gmail.com>
 <lyee4ik98t.fsf@ensc-virt.intern.sigma-chemnitz.de>
In-Reply-To: <lyee4ik98t.fsf@ensc-virt.intern.sigma-chemnitz.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-bromium-msgid: 2691a096-4699-43b3-9a4c-bcee756ed94d
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=melinkcorp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d3f660d5-8ad5-45ed-0239-08d9e7ef30cb
x-ms-traffictypediagnostic: PH0PR20MB3703:EE_
x-microsoft-antispam-prvs: 
 <PH0PR20MB370360D501B76C2A4E6B349CBB299@PH0PR20MB3703.namprd20.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 LJ+l/OeuNqH89EZzTK7Qd663DkBnUyKhEQ7IKxi23UJKOunmzyiaMZ52jCU0QAHjppaHruKUjg/WVv5/5Oa/qNy8W5/+rMfqbm9AAvi7gnLuW6sN4SXsAYFql0+nRLY++EPq05WYsUU1Cf84cig9Kq/UFJmO027EN0FijPUWIpbgAHOZKJBS81vd6pm237UrFjq1Q2UJkNBgdd39nqcJap16BlDHnNFlzqlh9m4dUus02XupWTLuKeQjvH3QeiH4vmqZa6iqJtoXEeLo5UFdvEvFI3sowK+it5untwpH2+NTiIKTQJ966PohIcfKoPsRBcunmQ985LZOP2R5Y2jhTYIKCiLoTyftB486LknkTs6t6Jf/Ztwc1WiS4br95LbXo3bBD3F0b/upded329KWkTrC9sUPNLHuS9zWaL4wrPjs54QPoEva/GspsHiVFFysn+UBgcX9JzVFclP+5a7GWPkyz3h8NlDgKPjDGSVU8ys6Z43JwrgwjmkRvYYL3VAZFcQRNka81TX5aTKfXRAe08ZFqTCVm0afZFbuPKPnOFiFBo7OFHHEZT3zHbfunVR+/91ga/of0+FcLB9GJ8Hm1W2RtcnhMC3Ihtjf9VuPqFSX78cSwM4EbDy2T5DyRL1QgY98WSkV82pPMPPwIboE8QtKM5PLqZFYN3S4snHqH+lB/liy7EKc8A1/B6rSJVZFxaW4tbe3cDfdV25Zj7ylF980dTEqkIFhrosrOJRVGriKp9/cu5Vdqe+yZOCEze+P/izHJP9W0yMKEqmtQK+U7Fm6GQhxuU90mqY84TC1geo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR20MB3948.namprd20.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(396003)(346002)(376002)(136003)(39840400004)(366004)(4326008)(26005)(7696005)(8676002)(76116006)(52536014)(66946007)(86362001)(186003)(8936002)(66556008)(5660300002)(66476007)(64756008)(53546011)(66446008)(83380400001)(9686003)(6506007)(122000001)(966005)(316002)(110136005)(2906002)(33656002)(71200400001)(54906003)(55016003)(508600001)(38070700005)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?F+vh2H9p1RP87MZMdAU18OIgdJ7vCXWQbie11uR5md2JCHl56ub/F+rOMg0T?=
 =?us-ascii?Q?lwBcCEzRrEIPCQkpDRbN/7SGyanzFVZ3+ic6wXFXLzVLJc/L7aT21AHtFSgm?=
 =?us-ascii?Q?FZ3w0aw6V+mtV17YhaH6kF1mPh+oNfe0bi8p14f0yesiF+NCOwVsdlf+1fJW?=
 =?us-ascii?Q?J0FhEFW43AylutFg6QNZQrbqJNgQE9wnZdSugpnZWBrAE+ywNMjJkByJAOBB?=
 =?us-ascii?Q?a7xxGaqyfNPtxD/ZyB8aLog55qTnpmnLSGiHNk6/NrfzHvEz/Z1PlwdNnl6B?=
 =?us-ascii?Q?rS8Kfin8IxbcoABdw5TsNYaqOaA8JLS3o3HxAB+e3XMQA13gjkaci1FJmWUF?=
 =?us-ascii?Q?7x6VZAdDlbdszX26uKEeIcGxbB4c1UX17suHDgNWqMqLbEI1BszCVrNvvCI2?=
 =?us-ascii?Q?uvSnGILnVw9Rt93/xoWTnR1PiAD9WQV3WawZ3/x/KzhNXmh1KIiCmz6rsDkB?=
 =?us-ascii?Q?UavaeaI0gH7b9UgVegcBfZv7lc1aw1/KPtYtFhruxKLSoIelH562C/4XkE4o?=
 =?us-ascii?Q?6ECCBx8AFAmbEuQZE67wjHORB6oeq94asvu7XG31ZmOwAIL+kxcTIsUZL/oz?=
 =?us-ascii?Q?uu0B04TWhv+b0ImmPReDQ++SrRQucyK7AOpSSms5oPtFy3LBLdWklirTZjak?=
 =?us-ascii?Q?ccKI0yOTQuhlb0FiWraMKSlBdZdeCqnnmyzoo4M5F3TO4rzXWSRdORtMVzYO?=
 =?us-ascii?Q?4R/dmoj1SIj+3wP1QP7sh7TYxSi/j9Y6TAQm106jkrrCi1WsZ02ZdWZqskM2?=
 =?us-ascii?Q?QCcsMMxXio82ey9XMovXUjhc0iFrjEHUkZ7ENxQIx9TIetmMb8qzDIEhwQKA?=
 =?us-ascii?Q?qhyCy3wOKN/VY3TAxGPS15bbU0HznC06fXwbQBZr+gfdUBuw/F7W72yOLLMc?=
 =?us-ascii?Q?mR3dbaB9ULNnTro4mkWorV1Yw6kpfbrb0IOjMMDAZd2BDRYxCdziuMaeUPPL?=
 =?us-ascii?Q?FnNnEOmGwdLqNgh2Ihasv7OC5glU26DqhuqnvvWRZoFBfbOOEYQ6fxwuPh1Y?=
 =?us-ascii?Q?a3NuvS0RcymzTnnDRR32P2MGtKgjjBMYn3GbLsQH+6pfcay+1zK0+UDOPcKY?=
 =?us-ascii?Q?4dr8Zl6AKePwvC0xlNv5C6DLm2xU85wcEER/CRoNac4v4HwTJRRC8x8KlvIS?=
 =?us-ascii?Q?OwF2uPEwrmykVz9FlQhU+VxvS9Z/4gxczVskNf4vA88NsVHURstcBcLfJQgm?=
 =?us-ascii?Q?DH5prPgy3luFzTbtluIziTi0JlPSnmqczmXrpH5VJtDhugoZvj+hFBljjvA8?=
 =?us-ascii?Q?nFVdqrUWWWxOPF7MwunYGeoRc9iKgvZKREpa4JTdfTkKtCi+CQNfAiCUZwIR?=
 =?us-ascii?Q?H0JZ75f/cE+vmR9ZlrUhLaHZcnIdtSpwEwH7AocvioJGDWb2NY9QRO4NCGOp?=
 =?us-ascii?Q?XpOfuteNgdaceWC2Ld8sHqB82r438XE+nZub/m3FhWdZfY3U8RQvOAeeWINq?=
 =?us-ascii?Q?sFUr9RVo0rw+EQXTagM131ZFhIf/P+LsEC8QI/7JtDRMCrwkPgbhn7ANhq2l?=
 =?us-ascii?Q?s0BskUAhOGMDGVODSB/pwV8jsRfqUe9iOQY5Ojo6ySu2LYIP/W2aHjkfSTre?=
 =?us-ascii?Q?efgFgY+4KXuLfki4AF6U2KYhxkYkik5xNTG8/w+jMM7GLWagQ6gWWO6U5lTE?=
 =?us-ascii?Q?PQWQKoyKwORV6Qak55O6lQQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: melinkcorp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR20MB3948.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d3f660d5-8ad5-45ed-0239-08d9e7ef30cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2022 15:01:15.0196
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d06db0f9-efcc-42b5-9f8c-c934a01c9bfd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 QCNAr3FvVkO6eHgstfR7tqYpIn7ckVDzVJmfsdr6kvqwVbJfT2+jcsQuEkcep3XOvxdsE5TvqjyDGlGikINSfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR20MB3703
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Feb 2022 15:01:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161367

Enrico,

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Enrico Scholz via
> lists.openembedded.org
> Sent: Friday, February 4, 2022 9:16 AM
> To: Alexander Kanavin <alex.kanavin@gmail.com>
> Cc: Jon Mason <jdmason@kudzu.us>; Yocto-mailing-list
> <yocto@lists.yoctoproject.org>; Patches and discussions about the oe-core
> layer <openembedded-core@lists.openembedded.org>; OpenEmbedded
> Devel List <openembedded-devel@lists.openembedded.org>
> Subject: Re: [oe] [OE-core] Inclusive Language Proposal for YP/OE
>=20
> Alexander Kanavin <alex.kanavin@gmail.com> writes:
>=20
> >> > For BB_DISKMON_DIRS, the actions "ABORT, STOPTASKS and WARN"
> would
> >> > become "HALT, NO_NEW_TASKS and "WARN".
> >>
> >> I am not an native english speaker, but for "HALT" I will have to
> >> think twice whether it will pause the operation or abort it.  I would
> >> stay at "ABORT" because it makes much more clear what happens.
> >
> > I'm not taking a stand here, but just providing the context for where
> > the push for avoidance of 'abort' comes from:
> > https://inclusivenaming.org/word-lists/tier-1/
> >
> > Keep in mind that for non-native english speakers none of these words
> > are emotionally charged; they're just terms.
>=20
> Yes; these are terms.  But it should be possible to understand the meanin=
g of
> these terms without using a special "inclusivenaming"
> dictionary.  Else, we could just use "A", "B" and "C" for the actions abo=
ve and
> explain these "terms" in some documentation later.
>=20

Would CANCEL be clearer to you than HALT?

>=20
> >> > BB_HASHCONFIG_WHITELIST -> BB_HASHCONFIG_IGNORE_VARS
> >> > BB_SETSCENE_ENFORCE_WHITELIST ->
> BB_SETSCENE_ENFORCE_IGNORE_TASKS
> >> > BB_HASHBASE_WHITELIST -> BB_BASEHASH_IGNORE_VARS
> >> > MULTI_PROVIDER_WHITELIST -> BB_MULTI_PROVIDER_ALLOWED
> >>
> >> The new variable names sound like boolean flags, not like lists.
> >
> > I'd say the context should make it clear that they are lists
>=20
> It is bad when a context is required to understand the meaning of a varia=
ble.
>=20
> And where do you see a context when local.conf contains
>=20
> | BB_HASHCONFIG_IGNORE_VARS =3D "true"

Would BB_HASHCONFIG_IGNORELIST or BB_HASHCONFIG_ALLOWEDLIST make more sense=
 to you?

Bryan
>=20
>=20
>=20
> Enrico

