Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D787FE95A67
	for <webhook@archiver.kernel.org>; Sun,  8 Oct 2023 21:14:03 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.40])
 by mx.groups.io with SMTP id smtpd.web10.47116.1696799634552289421
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Oct 2023 14:13:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=Jx+AvK8/;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.236.40, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nUqiCAHr5Rhpnw3Fbj41rbR5iOEBFCeJdNHU2hw4jrbeH1eXmTaEhgySQFPdpUJh+xbYMAu08k2C4VZZ+s/5i0KAC6Os8sm1pWt/nInM4oGlKgRVn7xuZGKbkDYQz7tnWjNSOju0eYXDQLUaDOqTSeUU/ip9mVNjWyjYmve+BdEZLSm5mfWFfXTAXe5MOR8H5BkWL2j9kwuVV1/OybH8p6H6psjahPyRvYbaqMyMuA8mRu/YARvIQGvliSaeOEDuDUwKxM7nORkvSbkXrNhWR7np7pRXK2Knko1dmO4DgqzrJ7oCKph4dlgagZDYrPPIhE0hNpp3ZGCkzJt+QFIQQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CoyU3qZP1CwaIbCxJSwYoa9rbxfRoWcLqgn1AmH0fCs=;
 b=RB7E4LJTHX1YweMBF1VCuopUKtMZKujw0gutksVwjLAF0yO6p6p7P3IFG7GjEq77F0OFnBFZmJOncDlhL/6W1VxD8vRr182MuYvsRQ8aJVdDNtZ8RBylwC8CNB/+aapI3vi1McQStfRwneNz+2yVlEsOyAzyVUndX0U2ZII0bRc6P7JucmQjDOLDsXyBy0qV75GRfG0LjMf6CFb19rDBp7M7xXBMbu2QxIdjakmrVqWuv4v3UmEmsGj/P1y6Fl08n5irl2jJuMPFgSnzPE+ZRHDLdJ34w2Z4qWW35r0t5URymK8EYRK28n1/KGxwviV0ftxmEden6rtu5p1Ekcl1eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CoyU3qZP1CwaIbCxJSwYoa9rbxfRoWcLqgn1AmH0fCs=;
 b=Jx+AvK8/hUMeYhvziS8donFINNamdpSEXn+JstXh4WnPXqX36A5BeyijyD4pMxCMPWewheVpbLPJhTJIBSrH/IBml9OO2INPa9BSGeTz68u5x15vRUShrYP9+qG6g8a1b5cA3ISc8zSZLmn8lX5XXPMQ3NQGn2P3j1wSlDp67ldiLjvc5jLZWdl5yAqkSdadzphhpmh0XNWpI7bCQk4uEgUVjkyEx4p66tJ7HJmvlt7pjIUviZan0kaszGoMeY7RqJMmA+f5Xed3ASpCv8T9Q+jRr6koNh4aZoX5jMtRWgBObRt/8QqYIKJ/zym/4MfSiIsayCJu1sfwQKSlp4Ly1g==
Received: from DM8PR12MB5430.namprd12.prod.outlook.com (2603:10b6:8:28::6) by
 DM4PR12MB5133.namprd12.prod.outlook.com (2603:10b6:5:390::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.36; Sun, 8 Oct 2023 21:13:49 +0000
Received: from DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::5c25:f895:7bc2:de11]) by DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::5c25:f895:7bc2:de11%3]) with mapi id 15.20.6838.040; Sun, 8 Oct 2023
 21:13:49 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 1/2] recipetool: use context manager for tinfoil
 to avoid hang
Thread-Topic: [OE-core] [PATCH 1/2] recipetool: use context manager for
 tinfoil to avoid hang
Thread-Index: AQHZ+UZfWsoy7INhFEOtNbdXb6oHULBAYusAgAADAEA=
Date: Sun, 8 Oct 2023 21:13:49 +0000
Message-ID: 
 <DM8PR12MB543089163820DC1C23C331C98BCFA@DM8PR12MB5430.namprd12.prod.outlook.com>
References: <20231007174701.1890063-1-chris.laplante@agilent.com>
 <20231008210224afa31dbd@mail.local>
In-Reply-To: <20231008210224afa31dbd@mail.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ActionId=69d3c97e-5391-4d9f-906e-7366c0435af9;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ContentBits=0;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Enabled=true;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Method=Standard;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Name=General;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SetDate=2023-10-08T21:13:07Z;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SiteId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=agilent.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5430:EE_|DM4PR12MB5133:EE_
x-ms-office365-filtering-correlation-id: 0f5e8a33-1b10-4f20-94d2-08dbc8437752
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 LO6+3k3DPsKl2tUnlTiKic6wUiW2JeZRtsjTbbHE21/bSdVCNVF3ZljmsXRY7pXwHToGoEBRycLE6u8YZS2ZdSoAXf2xoNOkro3Ee1KTA/z3xzndGe/XtpepyF4pkIONgOeF4yC6tGYYa94YIDrLBF8HVKykvyZP3/MBaPJlsrrVnwdrdqubAegOoy3oP8otTxkwUn6cYbZOJCRMnb2b7z+DRB2/CG39wUmL7HKZr4VfySqK9ggHHSEJDBzy3529iEwz0kySolJoQf04bR+rbJCe39Nt8vv7mexvQS3v6OoFckn3D3e+j8H79zkT9rca+9IlsCGjwjRuozMZeCiaB/8EriLkyOioCqEKgEmqI3Q3wQJ1Swvi5C0sYZr0wnGMy/Kq4BlgB+xp7PKny1bEl4E0AVKLh6W+A8sgxWBIABDthAy6V2PBrE6PzfnLdFFRsjQKd/z4VIxJEB5vz1P7c50cj42F8F0meLBSlLklic4ZcNrEinoDockl4BH+UuLEEaQRWX7SsJBSJXcV190+UtLfb7bsPpVOMY+m3uiO0f2v1wH/ZFc1h5j6J2fGiZM9NaY2BalMQXWjzgJiLtSUBuXktmGYj4Cl2MQayYOocHk=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5430.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(346002)(376002)(39860400002)(366004)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(55016003)(6506007)(66556008)(26005)(64756008)(66476007)(66946007)(76116006)(316002)(6916009)(66446008)(8936002)(5660300002)(8676002)(4326008)(52536014)(41300700001)(7696005)(71200400001)(9686003)(2906002)(4744005)(45080400002)(966005)(478600001)(33656002)(38070700005)(38100700002)(122000001)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?DJoLq5s3nreIzk2f7tYtn6DTMnMqylNMYbqh+ztnZO0lfGWpCtyw1xWa/CqJ?=
 =?us-ascii?Q?ZSsMQzQG8dP91UqN21NQHEe3RWQDsg7S94Nc018L1QS+4NG3aQIv3sCrFSgc?=
 =?us-ascii?Q?v8sAs6RKnzDH/QkcKu2IdKIBGEBUzI7q35EySFPkmaA03zAwMKJS8AxqxqeR?=
 =?us-ascii?Q?plPjgeQl6lMkDhr6YMKXhXIkHpsMKiCg3Zo3zA8iUwS9hPe1sRsVIzzv8k7r?=
 =?us-ascii?Q?mPYTgkW/6bbxuMvBhviRPfgzsA4zEhnOeBRfQWHT5kcoeU1m6TpooJlCtfbb?=
 =?us-ascii?Q?w61Xj3vs/I+k0u+vAPKWUXaRlNZjjOdUja04LxPfoI7wbmQrAhQdzp0mD4tq?=
 =?us-ascii?Q?vk3yQsSvcsrW0kS/pid3h8FKe7i2d4wAsenQlx4zmXvcJ8Q17yFP84tGTLXu?=
 =?us-ascii?Q?DWTekpHN8cL2VHYif6JoOHH58ngISiZSbV4+sVs5cikXQ7CG0CQ+Ysrxjbp+?=
 =?us-ascii?Q?+PHSzUzny0q4jW5RTnUr8BuK4bDfVf3/qryf9Lpr7KHgOPkl2kJvPnPjkTEx?=
 =?us-ascii?Q?cOTPNdmTcq3yeD9wwtNr74SuPZnEzVLQQF5RmvbRgm1nd75MJb0ZuvfQYc47?=
 =?us-ascii?Q?wqnhVEJiGxxsK/eXUVrnSNKj6jia+XgyWVR2yohkKkIenVHXTfyylnsSAciS?=
 =?us-ascii?Q?6WnS+C544OHB9CiW5aXfM0UTxkhaLcP1Kl0EbceUQ4cDct+fgoRSFs5rmYXj?=
 =?us-ascii?Q?Kd9VgIzGH0my3XwpQUK3uQgGO8pTz7iXeVfUsAK8tPldkaRG3vu3hRCmnOad?=
 =?us-ascii?Q?2IQAVuUulaFJKVEWgmEDz3QtsL6WtY+fziCccOFUVFapcRabhv5eo8zUTaAL?=
 =?us-ascii?Q?sHq/CZVGJA4t2099Ut4C2Ga718g4pOigMochTYsuIYyE8dyPYiLihRERJFKy?=
 =?us-ascii?Q?pbyO0sEhcPOuqw7XXDiK4wdeVl5Rg2zpbu0bFlfVYD5WqHndLxUDKyMwo3Xg?=
 =?us-ascii?Q?ufYGMu1tJ541yptdXkz9+dyy7AtMQD+59yEiwGm+P3jP3xREXWWQmGvzFF8c?=
 =?us-ascii?Q?1ztdJiQ5Z47w2kQDzzB2XVep389yEoTJHp9KldQsgwoTz2j4Joa/KxCuo3wE?=
 =?us-ascii?Q?EOOb3vtNcQLbd61G9ON73wSHIHmKBQkzvYFDGlpQwrAPvIS7cUW6pZ04cjs1?=
 =?us-ascii?Q?rYV9UkmXAb+NLwprXzXpVLd6I4A6U6tGSvVlXOjEFNqYkMF3pZoV7Y1o7dTd?=
 =?us-ascii?Q?DjB9cbCnOU6iYaEN+hw+5TNBYpyvpo1U+I40ljQxackfelPOvou+hshlcyxm?=
 =?us-ascii?Q?y+s8KQYlXeAunqhjJwJHH/Qq8wiA5oo5qruLTHt8+Z4kNRZmU/NxFQy9MZli?=
 =?us-ascii?Q?vMCjEGhAqQuC31WBZtCaT5BGdxQbIsU81Cz5nOW9wcjfDotYPIfW7Ti3bzLF?=
 =?us-ascii?Q?E8qSBSrqrwKZ0yAEgwa1+ULrgDGLkRXkGuuy0N03g6RidxWqfkZIpo1N43T1?=
 =?us-ascii?Q?AA5toGnHTpclJjmPiTVyIgj1DARCG64+1AzUQIx2lWXWWGFn8rXMpAuxa6TV?=
 =?us-ascii?Q?y24nqIZy94uOsWEULjInxmKbrkEmRXo44TYdDb0s5HjpSFyBdfHklchjbgFF?=
 =?us-ascii?Q?fW08oj3cfdx4opXvgrB6aq/ohhZ0nVqwxoM0foIS?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f5e8a33-1b10-4f20-94d2-08dbc8437752
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2023 21:13:49.2862
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aBnOs2ItcNVB9a/2KouXQD/2zZfymJDztzrZgJgdw7DQdVyGdMEJOOYVH5ieL7qGSXkOdn+99Qcrf2jXn+HhKYDNY4LtksG9ucVRo1Zr+F8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5133
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Oct 2023 21:14:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188827

Hi Alexandre,

>
> Thank you for your patches!
>
> Could you remember changing your git config for your next submission:
> https://docs.yo/
> ctoproject.org%2Fnext%2Fcontributor-guide%2Fsubmit-
> changes.html%23fixing-your-from-
> identity&data=3D05%7C01%7Cchris.laplante%40agilent.com%7Cd8e4bf9a3b674c
> 281b2408dbc841e009%7Ca9c0bc098b46420693512ba12fb4a5c0%7C0%7C0%7
> C638323957497350867%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM
> DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C
> &sdata=3DedAZCGs8naAEfH%2FqL1IkJZ1xnUtaTzKd9OM28HHNeeg%3D&reserve
> d=3D0
>
> Thanks!

Ah, my mistake, sorry! I will fix it right now.

Thanks,
Chris

