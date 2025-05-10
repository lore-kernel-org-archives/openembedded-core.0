Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB412C3ABC3
	for <webhook@archiver.kernel.org>; Sat, 10 May 2025 02:54:44 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.40])
 by mx.groups.io with SMTP id smtpd.web10.3202.1746845682925567919
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 19:54:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=Xfa0KxLS;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.237.40, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YVO1PcI5RHwWC8SGRw/LmvdTGWoNqNakMU6WlhARzL5woG7RGWRAoEqwqniu+yCHIhYsBoHIkx0nu7p+YLxD+xpfY0lJJcnZagFLDTkrNtD/zs+NYUaqjgQcoiy8IInSG1mIUrWHr84DCClicDfxPWCf3XIghOAjYfGT1bTeJXrigo501Pv2hmmtWxer7fR4qb83OVKfjc60fYhF1WTx4BXR9tglknfQHeIP4SppRCbIu7HCAPFCgYcTMG0NI3Iz3F+4dU3hkpo4P8794YqcoAuh5SauyyA/u51A91xsv8IKiGetPTwEpcMHFXfHB8LEZNY8Hr35OMha7A5f+mYjzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=npgNpjSr7kTT/ToTK/4hT3cdWL92CO5KKv+ldupTCV0=;
 b=KlkxJBVc9tzihv5IXCnXhHofiwMkSbeX08QiqqscuZwCuUBOWxjPGrZeKha7CWmlvFYrOcD3xQk/Wju5M3OCOAJEvWOC+URwA55ijksz7D2X9bBB3u40PibnO+K/rsaOLwkNgXbdxSCdCqxwqJTisYkSe3dnalFMTJ7M/Y25rYDbstzmVdgQDXDE9tvL+nYgoQHenIH6wxj0QaklhmvnbNRPlYOUnjyAiDM8y4kcujQ2lNzkVoremGeKHufLwM5OSUeF2OfUj3IHDQnZIEc2Bikz+hZAP1BWHY5F3FVX4CVyLnRUVAyRCv4wYc9mmv3pGY17DWglGUa6JzLdQfYPoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=npgNpjSr7kTT/ToTK/4hT3cdWL92CO5KKv+ldupTCV0=;
 b=Xfa0KxLSQDVwukYkz1Gu7V278b6LB73XcCsHO63ES7YZpISAPt2ySuKRxKxf3qo56Ok/KqbPExZ9DoYzOI53T3r0lOirmqqXJWLFIbdN+EsyKZf3DbaLQVbRoxf6EeORnZpiYmEA6Mj5sTzO93CScyqgg5pq/bBbp2D+SoHUvfR1OLkpYaIF4Fhax98KYwMpdnI970XwMNpLSwzmT3zXP0QTUPnbb/LIl2JiGTEbCZwDMyCne0X0Alq5LuFdZBZbzOsoBWYqxSkTIf/qzBaWS7cb0RUSev/H7yKGMBT91deBa+AWGZPh3JGkYT4tBS5bDe1f5VlvvyzUaw3idca+cw==
Received: from DM8PR12MB5430.namprd12.prod.outlook.com (2603:10b6:8:28::6) by
 SJ0PR12MB7035.namprd12.prod.outlook.com (2603:10b6:a03:47c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Sat, 10 May
 2025 02:54:39 +0000
Received: from DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::604e:bc05:9357:c7d7]) by DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::604e:bc05:9357:c7d7%4]) with mapi id 15.20.8722.021; Sat, 10 May 2025
 02:54:39 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: "mike.looijmans@topic.nl" <mike.looijmans@topic.nl>, Max
	<max.oss.09@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] kernel-module dependency mystery
Thread-Topic: [OE-core] kernel-module dependency mystery
Thread-Index: AQHbtEwd7WGnxn9of0+TOqFHIIGjbbO0FR0AgABUZ4CAFttN0A==
Date: Sat, 10 May 2025 02:54:39 +0000
Message-ID: 
 <DM8PR12MB543067EC42BD9FAC5101B6DA8B95A@DM8PR12MB5430.namprd12.prod.outlook.com>
References: <5a9b30f0-c189-4841-9821-6dc26de4de84@topic.nl>
 <bde7ccac49b5417cda5c964055f72e28a3bc84be.camel@gmail.com>
 <b88d7c9d-5f69-4104-864d-b66f2d20a1fa@topic.nl>
In-Reply-To: <b88d7c9d-5f69-4104-864d-b66f2d20a1fa@topic.nl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ActionId=2d50b63e-9b41-46ac-9e15-3a237d7c6852;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ContentBits=0;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Enabled=true;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Method=Standard;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Name=General;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SetDate=2025-05-10T02:53:28Z;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SiteId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=agilent.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5430:EE_|SJ0PR12MB7035:EE_
x-ms-office365-filtering-correlation-id: 2852dc4b-fece-406e-fc17-08dd8f6e0184
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?QcUcxI/5Gfv14ZJgCneFDOX7YtquNDpnJRqlSuNzmNglcDWdVMAD6r2iplHw?=
 =?us-ascii?Q?ONvE2hQgHBqvUqHvdQOZhyGmFPVzsoxUXSto0YZhY9XCWWVGNnL+kSDI9vnX?=
 =?us-ascii?Q?NbqAXACEBJF+ZNkxa4hcOxtuPxhM9GxuWT7JiEhX0PlIjB+bWplDl5X744QR?=
 =?us-ascii?Q?t4h5PKACphSofWcECH/Hz3UlSVoeN/vh5ztS6BM2opru3o0bafGBe/PM805c?=
 =?us-ascii?Q?tkuXfpCqn0HqFxi8w6gM9t+4ALuRovB9IMiXTp2FI2JbXYqXLHwyzInPXGs+?=
 =?us-ascii?Q?s3z+mtpSeIVcKZ5+vP7aqEcBMIvSkR8YVyAyIMRCKcVKmueuYDEqCV/gl6gl?=
 =?us-ascii?Q?s0R2VFRCseky1lBmriaqHob3BMRDRhHE1lLtowzKsLqhjx0AwiayaGllXB/M?=
 =?us-ascii?Q?s1e7dTN7f1p6H3et+sT/iSLOJ8onEoul5so6vNEKDAX+/vPMY8k2eFtbvvds?=
 =?us-ascii?Q?oijNg1r9BUR8gpwommq248g6TpxJoLaY+NK1jX5oBhII5jA47JIzZTQTY6h3?=
 =?us-ascii?Q?zp0VrTj9JkF3S2AXtejW7mCkjgdztfo87eva47/ySUV23fP18l4LoQiCYh9s?=
 =?us-ascii?Q?R0k5pKzJH+7pfm4SAXjezH+21TrA2ARgGhCJYEEY6WWNoAeCqdiXWR85xDoG?=
 =?us-ascii?Q?2/bkNyQ5PA7qRPpZfx6lWLqUgQylATRiIS0ClOx6FPXCB1RwsfM6t9emT6CQ?=
 =?us-ascii?Q?VAOV0U9NIJ51yI77qgAMJYTGEYGpK7Sy1O0LJlE0P4oCuH85U9bM4whIqnRv?=
 =?us-ascii?Q?lm/MGUO4vWi42BmA6NfIm8FJLUnzEF2AA7li6fbK4OWj1jaRSychN4d1WA0+?=
 =?us-ascii?Q?vROIGNH9fEf6TJGzSk3/G9cvU2kAMrFyTBRC5tGCdqY++v1lX8C6eeqg9KPc?=
 =?us-ascii?Q?2QeSaYfuhCcnZc6gCH4BAD5RrpWoJJZgdsOa6k2qO0WlhReKzv4WBwuzgSG3?=
 =?us-ascii?Q?imBReHVifmwOYKn7zFSAb11LzcudBDtgY+EmZyhnHe3UKTj0EgS3eZTi6UjB?=
 =?us-ascii?Q?5bX4gr9uFsy+v8xoNFqANFSAe8DFxIrQm8EUx/GczGZEJ1VW1dTB2R5xfovC?=
 =?us-ascii?Q?ClP8w/hg3+nnYwZQk06M0E8Kz2yeLbQXFyRhwO/maFTwijuxQdbVuUZvzWUU?=
 =?us-ascii?Q?Tz6lDcgBwL23GBe+bJiMl43I8bJTkf0S32YCo4t55PyVrd0mf/di96AtHDT5?=
 =?us-ascii?Q?4savb7UY9Mmr51SAUAYQD/BWM9aCMx93z462a/x2CxD6o93DW3zWIM1VnZTc?=
 =?us-ascii?Q?dW6Whs5ic/U9n+I6zcDh2lFmf68ve36zkMiR9obW5kLR/Nlv1alGvdVsmb+4?=
 =?us-ascii?Q?jXCH/sz7BMhlHv6DNnt7rup6UwA/P26383ygTSRHbtOuUFgbnZfuqqfT6OXF?=
 =?us-ascii?Q?oX4MhH4VSWo5vI1PJrRtTwiDN0hkSiy59r+UzQ2aMHHhMEMSfHyLAuYQmuJn?=
 =?us-ascii?Q?0dey+x6f/Zo=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5430.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?XJLMnHrSQ6zfNMHMP6htqTFUWgXVsB5AWSBy2nPtjcBfx5QrndqRnExpD2BY?=
 =?us-ascii?Q?K/RkAAHayT5FapZi1g+/1hsQgani8hDrLe5/pNgXNOkhlRWa83JNT/vSrNk4?=
 =?us-ascii?Q?YPzPbrfbMeUwbG9DIY/bCCmAACYKHF7POFExIaMzReKJkLRoUKYkAhk+H6Po?=
 =?us-ascii?Q?U6bTOwJ+Y+5V/lBz56idijtA+S0jzPx1ReahiDgWBYY+U+LZ+cYIp2/P/aH9?=
 =?us-ascii?Q?pkL86zX+DV9Pbl+lx5TTQbFu/tD319Mgsn283Og5HeBKn6KzWQ5CrgErc8Z6?=
 =?us-ascii?Q?bt9Z47qg9PMBZGSmbsNn6Dyv/MgTzU/Ye5GfuUcsTpAnxNMprtgtUQAGywpf?=
 =?us-ascii?Q?wLdNgkMVSAdRPygZq6Jasrh2wB5WR+EaOUP3wJk2qqiyZkgCba9VJAcrPQQA?=
 =?us-ascii?Q?3qw5yNCpRivVLlyEupCGtVC9y/ZXciDKd/hdOtdoewu/y3hqzbBb1hZf0m/d?=
 =?us-ascii?Q?Y2NsjriTCn1s1UA6jEYv6RqoNGi8yyzkj9+iV8AAibApCEAxraKiSgXCjSOI?=
 =?us-ascii?Q?gnspBGy1MotsDfci+Nu1myHToC6Higi/x7KbzvoDHjrV2a3CsXR0B7fwJbQz?=
 =?us-ascii?Q?L3mgypopYTCloTyM7Txkutn7E3ThxmLuFlUqvpx5hCR1CcMyX4lXYtmcxN7d?=
 =?us-ascii?Q?qx8SgSFwBbOB47f+NE8iekWTN6jzv4Ky46ZDYBBxTQsTV0MmTWSBwwt47UR9?=
 =?us-ascii?Q?6xxthR1DJNodbmgsOgPvN8KxFGo97UMkymwKP5O1uHO7oQ3qfDqkp0i8pCzh?=
 =?us-ascii?Q?FpF8/m7qVjer8lt/wBq/DyweObI+FTx5DtTvzce2mKndt3utjAe6hko3CNTN?=
 =?us-ascii?Q?J7Bb41vARAEAYfJrSj6bIkm6pTXzvJ0Jd24Xkj1R+PmMPwAks0z60wJAJoxC?=
 =?us-ascii?Q?egL3OBjjH1C8C+3m003GVSBwEoUvajnp/aBqQXxBJ/kziDVQO3thbxjwr79i?=
 =?us-ascii?Q?Sjp5gNIEdKrygOUj34GW7rOSq0YRmxfOgsBNF/SJlQSy/x/dfqOABTtgj9LF?=
 =?us-ascii?Q?BHSmr7/7IkDtzGCU/5In2tEsxjyQa4zU48sq/m1WD67TjY82V/i7IWHALvJy?=
 =?us-ascii?Q?ultv+YeXchilbdqLzIabNygrtwMw3PjPbqk8EBbJ/E16fplNgYtZgaWePc7S?=
 =?us-ascii?Q?biBxqJdUncYMXLmiTfygGld3ToIRhqesoYChkZAMKTLwcQFX0oe+No9iNM2Z?=
 =?us-ascii?Q?XhkTzqd5X/VtXhsvRo2pc53ekccoZpIkASyrvG+JqeJCYCucG/TfUu7V6o3y?=
 =?us-ascii?Q?IGVswGVinJpRbkF9JXUoz9mAQk2wbjmh56XshUxWnMMYw0WKHO8Bewjm6gAV?=
 =?us-ascii?Q?DYFPiSZOtCfc0vftxbwRgGYqQZcMFzGrAI59B6X8Fww/+Q+3ZdS8iPLXGMXQ?=
 =?us-ascii?Q?CAsiFZ5Z0EA3NBQy3SGuaK0xM3anzZIfcnk5GxJLb1wOS98RzbsZmtAkHVTR?=
 =?us-ascii?Q?xSgelosPdse0IwnX33NRQ2iebwjoYSY9wco7VN9RBcroQd4QXkmRBPBryWRw?=
 =?us-ascii?Q?VxVwI/RDgbhiDrHYJ/83D41dJw+Tp7hT9lsB7Hxkbyb3PClXqR+rmmojGR6M?=
 =?us-ascii?Q?45K4Q3Q7hj914KtOv+z7NGaZ0TBLNMeNWdTZd2Cp?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2852dc4b-fece-406e-fc17-08dd8f6e0184
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2025 02:54:39.1107
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OVy4gytCCJ6eBI6guvXv5Tnk/XNISlzOixxA+xUI0nXCoqj8t93VaiIs513g+96w3xmohU5cbcZENGV+kKAB8FdJDU89OmKW8iTjBopQ8Fc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7035
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 02:54:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216248

Hi all,

> That sounds plausible, and explains why only one failed (kernel happened =
to be
> in sstate-cache). I'll check the LOCALVERSION_AUTO value...
>=20
>=20
> >
> >> I'm on "scarthgap" branch.
> >>
> >> The "kernel-module-dyplo" recipe can be found here:
> >>
> >> https://nam12.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgi=
t
> >> hub.com%2Ftopic-embedded-products%2Fmeta-
> dyplo%2Fblob%2Fmaster%2Freci
> >> pes-dyplo%2Fdyplo-core%2Fkernel-module-
> dyplo.bb&data=3D05%7C02%7Cchris.
> >>
> laplante%40agilent.com%7Cbf3eb36f3f9a44d9396508dd84003587%7Ca9c0bc0
> 98
> >>
> b46420693512ba12fb4a5c0%7C0%7C0%7C638811858640678798%7CUnknown
> %7CTWFp
> >>
> bGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMi
> IsI
> >>
> kFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DhrrWwDxGA0CV
> IlUcjc
> >> JZmfoxWy7KNScoECmYpJbP7ck%3D&reserved=3D0
> >>
> >> The isue at first glance appears to be that
> >> "kernel-6.6.40-xilinx-g6a2cb0f14db5" mixes the git version hash from
> >> the module itself and the git hash of the kernel. There's no such
> >> package, it should have been "kernel-6.6.40-xilinx-gd7b52381656b"

Just wanted to drop a link to this Bugzilla because it seems relevant: http=
s://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14885

Thanks,
Chris

