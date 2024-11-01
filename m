Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F886E6F095
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 23:15:05 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.70])
 by mx.groups.io with SMTP id smtpd.web10.7353.1730502902148060039
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Nov 2024 16:15:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=TGOtFo6Z;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.236.70, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xdKv1lDwAMRg39bNpzBMosWZkKVLEJpL6gTgksnseDF50iTTxdyjt1ko01t4sP7H4smIef2K0E4svt9y+APreK5TBA+eQhJsG06/FYd7aqCRI494oRyOTl8KCucmSOPFCnXZg20nmzRWD8UskAi6qQ0LLJ2XiRyemF1JJVepjO8Cam0CKQnufX6QVUSJcsSrcB4rydzqA7dh6pWwzSMTyIXA1njmqkVkyJ+hI8korar0cBAG6twkO0YAg5dUXFOfM8461rRDTihRVTRnnji8ajftppcDLjh+Eo3ZVsriJ0nzupq/gl2fj7QodXBgjzcs/HF4iU/CEWK/rzGIBbJ/aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NQE+ZgKbhMoZ8BnZ5nAdo+7DQxJs8x+qfYm3rHi1K5w=;
 b=y4k9Qi2CJGHo7dm6d4wPeY842a++T6RRumwqxauH0JVIX75OUA500rEJ3vvalIsza/xcNKLtiL/hmZ/ghdRLZQetaUGOPrxpabJvytmTVToybXyY8bM68K4h4pkKB+Qzdk3ASlq4SIKUyNCcqJunM8jf+9N71kxyoILylPzBJfkOVRSNf5jXZQvqKRtM+rzOmkO9tZ211pMk1tOVuGHAv7HCKjDKShmTtj6f32B5Y5w9VagIxVVIy6VvUjLhCevLysmfuUGadXztaG1G0CeI4HtK3t/yXlToZs72LU2qWo4ec0NREvss4uEDgzqLw/LvQOpe8ZttKyw0aIJwKN0lkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQE+ZgKbhMoZ8BnZ5nAdo+7DQxJs8x+qfYm3rHi1K5w=;
 b=TGOtFo6Z3GmGaMTmMY+UQCRYVYpvY0A43c6vLrYuSaOTL4cCxm4b64OsgbYaH1WEF45E5Qnwk1wbbxG8nMeZ+EIlVJtd8Y29iTGwfXJYeYAgKoClBFmeSFTk/3wFbfASeezZHE55AqZmJ9ZjLGWrizi4PMmyJLx30kZ+61n5/+vOB3c5hm6P+YwOs7o30Plhy5uMQfjevsTl9ZQaGV+sqyf7tlrtkO0cuvHCFJl4O3zBr8tafwSNoMb+wGgJdVpb0atyvYMIaSNFPCf6kyGaFvv7ZFLB29vXmaHJOdScByhdmp7c5tkygBXY+Tqtvxryp4SqYzpfLzW4aLdoziNXaA==
Received: from DM8PR12MB5430.namprd12.prod.outlook.com (2603:10b6:8:28::6) by
 PH7PR12MB7115.namprd12.prod.outlook.com (2603:10b6:510:1ee::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Fri, 1 Nov
 2024 23:14:58 +0000
Received: from DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::604e:bc05:9357:c7d7]) by DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::604e:bc05:9357:c7d7%4]) with mapi id 15.20.8114.023; Fri, 1 Nov 2024
 23:14:58 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] devtool: modify: add DEVTOOL_PREFER_BRANCH
 support
Thread-Topic: [OE-core] [PATCH] devtool: modify: add DEVTOOL_PREFER_BRANCH
 support
Thread-Index: AQHbLJWiyUBsTo4LGkWC2zMcqdySibKi2vWAgAATJVCAAB5AkA==
Date: Fri, 1 Nov 2024 23:14:58 +0000
Message-ID: 
 <DM8PR12MB54306736B03571231E94A9498B562@DM8PR12MB5430.namprd12.prod.outlook.com>
References: <20241101193811.2068211-1-chris.laplante@agilent.com>
 <CANNYZj-_8+EH51Nk2tj+o7a2PpscSO2bi8e-ak8g5fnUhADULg@mail.gmail.com>
 <DM8PR12MB5430BF49467783C0051229C68B562@DM8PR12MB5430.namprd12.prod.outlook.com>
In-Reply-To: 
 <DM8PR12MB5430BF49467783C0051229C68B562@DM8PR12MB5430.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ActionId=446a3e2b-703c-476e-ba6d-5058f70627a5;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ContentBits=0;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Enabled=true;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Method=Standard;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Name=General;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SetDate=2024-11-01T21:18:46Z;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SiteId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=agilent.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5430:EE_|PH7PR12MB7115:EE_
x-ms-office365-filtering-correlation-id: 37c85fa7-d556-4205-f4f2-08dcfacb011e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?RtG4CBqyIPAVDHRTnkxocD5j3FIgA3AVaOvgTqM/A3MEDrLwGZYEOtzU05Z/?=
 =?us-ascii?Q?YBV2NoUenirzvKDiHlHPujIc6iX8At+I9YgS7p1K5Hn4qFrYORbltS2b7KvQ?=
 =?us-ascii?Q?4MPo4/67zakiMqz7iNp5K1szplTcyahiIm0vm4HK4iZz9TtXmM/hxnPdKhaf?=
 =?us-ascii?Q?MJBey0sZdxFbOuHsl4lAw/m506E4UHBpbzQ5bJpEAQcQipQkW8HViuRhdOH2?=
 =?us-ascii?Q?hEVyiZYgdJynwvV9KkhJyWmNyznDyMYCld314/Uj5WbNKzghmEffQWDTo9Pg?=
 =?us-ascii?Q?WpHOR9TIptnC+9aobfXfFooeeJdPrRlhHgTNYYDkF+KrkupPvdmIHJbvnBLc?=
 =?us-ascii?Q?TtTJ93kmT93THBU6cr0c9tfwYHIyB/DT0A1c4sZU2XW3r2kkKSGOrBiwof3b?=
 =?us-ascii?Q?ugYRvRukcVm+XyZvbIh9IUWfn2IzSW1FgXnzrhQN0sUnj5LuOx9RsEVv7jwp?=
 =?us-ascii?Q?4blXtjqwKAgdCRTGMpi1M7+5GBHUVv/vufSfwUMJfvNAC/9aZz1BN6QMiO5F?=
 =?us-ascii?Q?vDtmfirS9e1YSoX3rysKnJMtwedk1Zn29joFc5MAZWp9q91z4CQX/Z4YdRZP?=
 =?us-ascii?Q?yzG7DPHR2l1beLsNaOUn/Gjf1PpQ66C/ev9+o7Q9Bwia6VEt8lkctl+MpdLR?=
 =?us-ascii?Q?rMLEgaiKudIQLVs8GxbCc222BITvHnEoESO5CrWSboSfvDfDBXp5H6zPgf9Q?=
 =?us-ascii?Q?1p0oYL0iKnvCSUgsms59yLFYD2deNb+TFxKNgwdQQbRuI0QDCm3JB4hnaZC6?=
 =?us-ascii?Q?BZ+p/69wj65FejrlPYqaTQOemJPm4ov5iL7LB9DBRU0B90svVluIs9SVdCHr?=
 =?us-ascii?Q?X2Z7RiT2fSYZdVbK2PEnjzkuas+Xb52hY+inDTZSeJBz83BPmSIcF1S8MY1B?=
 =?us-ascii?Q?stmM3LmsPdt4NLSCrvRNiiyzauZP/Pn4vWGhHiicAeSH/z0oe6qBQGdgH60C?=
 =?us-ascii?Q?fPhgenI8vxwZgx0OxyB2TF6FpRnh30VvLD1OudfgS6CgGyNKsayWZC3SN76W?=
 =?us-ascii?Q?SStUu59rSYFG2gBhpIGjYNTMJ3xvYLI9S5qaJtAT+4++K82pdmiO9cLrbKg0?=
 =?us-ascii?Q?GRwrX1hpt0M/t5m83KurJ49+jPQOv4nrf1jCOx9fbP7pmAXVJXS6/qSdTRyo?=
 =?us-ascii?Q?VCk0pF07XhVOb8NO0D92wbTWazOCESEFiilSt8Ztj+oOxOXyWByIjn2eX0yJ?=
 =?us-ascii?Q?DGF8+o+qLnFzhYatOH7rbhftmLIPU2rwsNSPBG3m719ic3SElsc8OS0+6O4y?=
 =?us-ascii?Q?4D1gqRNevOVQTaBgJyz1vmalAAtMV/zW9U4Kv5wfVd6IyIyOt4x1LUaisn5u?=
 =?us-ascii?Q?O89LN5WKcDV/W0aAInS/oPvqnIapsL/XqBg8HWJIOIn64GjqQvI4V+xVzpj9?=
 =?us-ascii?Q?KFhZ9+Y=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5430.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?HkoZORP40ECjs9iDaR1Xhd5+7soID+O4tagE+3NR1o5utA2IVRv+KOn9MOph?=
 =?us-ascii?Q?WtJhVLKHycK+1PKYFELsIcdVmYeIWtmlt6a3Eqdt2pLMW+rXIjS4D9WhLgKP?=
 =?us-ascii?Q?yaJCH+FEYDJMSk/hUF4Aagutx38/PDusWn5i8I/pb2S5mTyHl78R+/zQ3FQT?=
 =?us-ascii?Q?hQ86Q7GQvVVuwmoh9MKf3T4zo+FOYF88ESv+oEo5awzhMHhU8LiqyvscGmgB?=
 =?us-ascii?Q?5nnhvEFiA54lNtZJ3Mkq4cvbQ/ckvJpH6RhymtkRcdu8h5Vcy4TC4N5R6HD5?=
 =?us-ascii?Q?+Wnp6MOjFutKwLFZBwfhSE5Hiv407Ve0m+jHOD8/osl7SVOlAx6Mmu+/5c5f?=
 =?us-ascii?Q?n9+cciGMzZyPkboN8SEmHylQeqFTezLkBSOXOA6SD5KCMBRFNU4p3eMfvI2l?=
 =?us-ascii?Q?8Qntst8P31BWMeEYoLTqu2Vd3PJh9eY55LEPuGaz8nDRr8vXKccsDRNjT9rp?=
 =?us-ascii?Q?lElGIOEWaEVWKKix8n8r+A15HY/0yonD0poHTqIVx0L8xCscYQE+Jy5sK0aM?=
 =?us-ascii?Q?ZBNEdTLewaIA7pzS69cfuparYa+px8XjWu6fvjU7zBCoVgJAspK3Fy+IBDBo?=
 =?us-ascii?Q?3zOY/jcZAAy+GRXc3gdWWjjbvZ8MM1eibae9C44X1E8Wemhy9bdlU6cznFRf?=
 =?us-ascii?Q?8B94MvEK3vTxjCRRr/6axoyDwVBZuJlUliF2MP+ZMfzh29Q7IP0wP4ewRXFu?=
 =?us-ascii?Q?IEpVhvvtyPPbB2WiFr3l0xxV0+H8C/jeHodBKF1uZKHvj7t2DyvGflDTRj8o?=
 =?us-ascii?Q?DYrDxMtlWCEOYlUt6HGRV+TTr1hm00/nYAFlfttZcFHDwWM/TY9iZrkfOS8I?=
 =?us-ascii?Q?N9DwL0IMix686VVzTKJbNPYtFZ6gelnlzSa3umN5BcS+AWeWJX64t+COYgbT?=
 =?us-ascii?Q?yAfBGDaRvuntS6Y9eW1L42CeFziPlAsKEDr2ehFna2Fn+6McQP8jyzz2w0Hq?=
 =?us-ascii?Q?YGJdSlAaCalX07/zf5WLSYm29q0lHlKcsDz+ALTrtTQFeI0bp3iMMXHWEEPa?=
 =?us-ascii?Q?8JJfdPTwtPlhl/tQnuWSrPh6MuCVfe0bh8bO5oAqAToovsLodjUp9Sk2LJBo?=
 =?us-ascii?Q?KKDJj26rmcyN+db63/jzFkKdyVwmcNYCiiVTM9OU/Q0SWPZvKSD7kA+kbV2q?=
 =?us-ascii?Q?VVdR9HyBoQtO3idR7gsDlYScjKdaQXzi9679FYpK29SXSBzyZZO4r0O4PXpC?=
 =?us-ascii?Q?XQSKVY5T2lcxWh9ZB0rGG8/lOTuOMZSl5lYsmgQBLFCszsXbtw6zRBlAKVtC?=
 =?us-ascii?Q?zSBTGwWV+xOW/YamYxL/PRO4NpkXumV8stC9WFf9i/OCNT+JtPwT0U6g60D/?=
 =?us-ascii?Q?9PANQO4/rYXjRwemj7A1G7hdMAmsrdwSzFEFOcODlv6GXw0tOTx4frPWgo/Q?=
 =?us-ascii?Q?OHhZlUOaP4pKVwHz3UJjJzEZlPPn6LyxKlso+kxYJ74P99d+1ogZMtDewYog?=
 =?us-ascii?Q?Zbjhqkzi1MN+pYmwAOBhqgDMExKiWQ3OkgEI/EabKH/lBmtgOa5CL/5u5luZ?=
 =?us-ascii?Q?oc7a2epRw8hHgE6GczLnQnshq7MkyqpDpnksPZXbHfUVm7i7mcjrftrk6gmK?=
 =?us-ascii?Q?oInBuHfRTj0uslhOp+AIXPIraT4cBqgiV63T5447?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37c85fa7-d556-4205-f4f2-08dcfacb011e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2024 23:14:58.3408
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: igQ52URjJqQOHlYBp4YVxW3ZQwEcND2ZO0c5eImWQDcLNHAY0mAOAaM4ZpBYx1qwFF3KIcL7Qu9Y6F6l2FCVs97ysH+L7n+FbGfHV5NY9Yo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7115
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 23:15:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206640

> Hi Alex,
>=20
> > Will devtool finish and devtool reset do the right thing as well when
> > this is used?
> >
> > Alex
> >
> > On Fri 1. Nov 2024 at 20.38, Chris Laplante via
> > https://nam12.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Flist=
s
> > .ope
> >
> nembedded.org%2F&data=3D05%7C02%7Cchris.laplante%40agilent.com%7C8f50
> >
> bd87a682487c18a508dcfab13c88%7Ca9c0bc098b46420693512ba12fb4a5c0%7
> >
> C0%7C0%7C638660886342885249%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiM
> >
> C4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%
> >
> 7C%7C&sdata=3DRLYQPy6ueVmaBE1IuIX28ADzR14kx8uEz7CdM76e8BM%3D&res
> > erved=3D0 <chris.laplante=3Dmailto:agilent.com@lists.openembedded.org>
> wrote:
> > From: Chris Laplante <mailto:chris.laplante@agilent.com>
> >
> > Provide a per-recipe opt-out for devtool's default behavior of using
> > the 'devtool'
> > branch. This is primarily intended for company-internal recipes (e.g.
> > on private
> > layers) that use floating upstream SRCREV. It is assumed that such
> > recipes do not care about patches, since the upstream is 100% controlle=
d by
> the user.
>=20
> devtool reset works fine. (We have been using this patch internally for t=
he last 6
> or 7 years.)
>=20
> I just tested 'devtool finish' and 'devtool update-recipe', and both are =
broken
> (not by this patch) for recipes with SRCREV =3D "${AUTOREV}" in general. =
So I
> wonder if devtool needs to be taught to handle recipes using AUTOREV. In
> which case, perhaps it should just automatically do the
> "DEVTOOL_PREFER_BRANCH" behavior...

Thinking a little bit more about this, I think I just want 'finish' and 'up=
date-recipe' to be mostly no-op in this case. When I'm developing a recipe =
under devtool that uses DEVTOOL_PREFER_BRANCH and SRCREV =3D "${AUTOREV}", =
I'm just using it for the edit-compile-test cycle using 'devtool build' and=
 'devtool deploy-target'. The only helpful thing I could foresee 'finish' o=
r 'update-recipe' doing is maybe slap my hand if I have commits that I forg=
ot to push. Otherwise, those subcommands are not useful here.=20

Even if we take DEVTOOL_PREFER_BRANCH out of the equation, I think that's a=
lso true for a recipe that just uses SRCREV =3D "${AUTOREV}".=20

Thanks,
Chris

