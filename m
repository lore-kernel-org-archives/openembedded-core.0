Return-Path: <louis.rannou@non.se.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC112C4345F
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 12:36:58 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.70])
 by mx.groups.io with SMTP id smtpd.web10.11361.1714739813863007051
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 May 2024 05:36:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@non.se.com header.s=selector2 header.b=TzH3ATo+;
 spf=pass (domain: non.se.com, ip: 40.107.247.70, mailfrom: louis.rannou@non.se.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FkOQKcbUBJtMccT1VgSLlWnV/Tm6vQWt7Oz9yKAHOWq4sNsoPP3/q+9HXhg+Munfqn/eNypoJfHFF8fujUYeSKz0Asp+3lkCSlGM3KAhgDspXuL2/Cfovx+uD+4/Ltc6PEb3el14RZ4wxC6fIqIQusPif53mMy4HXIKIBhtyCRIrBcWQiXcpqrL432B3cvQdCSQKwvC63CUdVM+mSpi5La2IlC6Qr2SSVG6g8WoDHLtFkDAqLWU37zgS7XFYSAWSpqIfGaIFdFfm3rgQquM7WKDrlOp+GNmaQMqln0a+QikQfEo/TX5V2BALlvW0VbqVK5MiKTMRB1ueJyWsvPCL5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JL5wtsc6FWY5PVPc1B3GyN71aKK6sLN62jN6pBeY8ls=;
 b=IY2L88DobNBf6GspPIMaqYLVXXDZplbdjRUdObcVfhbK2r0vVkfHPoH6N95wO28+Wlh/QJOCb7q2K+Y4SJw5WJV5y+JxjbNsPKEu66nvPDSDp7YNjRmRvMYE718k0fogiENi40LyIcispSwWnElDwdRhDlteJRS1HFW/wbO1leIBnnlt3JsMq6lQvMua49L+qXYNgR/zrb3PbizcOXyupyyfwXS1GGYnswldsD1KHMTmjKtP0gVeLgSL2cR9ZtGeIbNorV/1FgXjVAyAgo4hvXEiT3VRozCz5oM9WTFCidlz/BeUxMpvMtSaDKP2A0nkuzgG9VKPJedjxuIw3GjHzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=non.se.com; dmarc=pass action=none header.from=non.se.com;
 dkim=pass header.d=non.se.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=non.se.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JL5wtsc6FWY5PVPc1B3GyN71aKK6sLN62jN6pBeY8ls=;
 b=TzH3ATo+eM34Igz57ZJIkSaKwjneXPdPl3tlMXPaYSS7Oo8bscucJmOcHua7JyFM3sxn+/6aWqp/6SrjewlQwaFx/6TvrXYjwTCTDnMnDyW3LFfzGHESijn0qphg7StMScgYuC4xOaBSqj5IFHFtwXLSZvWNaHzwrUQYQut++YyugZl0xy7aDkl7CLpTLZYALImYwXKvBz5VGRtckyXRecgcjgxT1Ty/z7ZzSieSo8HSDFwddJONNCRkMr2/D4Lh2TX9YMpFRnEBd3aOnrdEscp5BKNoKfpN/wCnUl7IDqFFglb8I/AacUX/MrC2uMLD+N36IJVc4RaWZUaXDA2SOQ==
Received: from AS4PR04MB9316.eurprd04.prod.outlook.com (2603:10a6:20b:4e7::19)
 by DU2PR04MB9132.eurprd04.prod.outlook.com (2603:10a6:10:2f7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.30; Fri, 3 May
 2024 12:36:49 +0000
Received: from AS4PR04MB9316.eurprd04.prod.outlook.com
 ([fe80::2430:4340:c5ba:cd60]) by AS4PR04MB9316.eurprd04.prod.outlook.com
 ([fe80::2430:4340:c5ba:cd60%4]) with mapi id 15.20.7544.029; Fri, 3 May 2024
 12:36:49 +0000
From: Louis Rannou <louis.rannou@non.se.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [RFC] dm-verity image support
Thread-Topic: [RFC] dm-verity image support
Thread-Index: AQHanVaLmPCRyLZfnkqCo2igQ/1TUw==
Date: Fri, 3 May 2024 12:36:49 +0000
Message-ID: 
 <AS4PR04MB9316F4B1CCD8C19274FB36EEA91F2@AS4PR04MB9316.eurprd04.prod.outlook.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_57443d00-af18-408c-9335-47b5de3ec9b9_Enabled=True;MSIP_Label_57443d00-af18-408c-9335-47b5de3ec9b9_SiteId=6e51e1ad-c54b-4b39-b598-0ffe9ae68fef;MSIP_Label_57443d00-af18-408c-9335-47b5de3ec9b9_SetDate=2024-05-03T12:36:49.843Z;MSIP_Label_57443d00-af18-408c-9335-47b5de3ec9b9_Name=General;MSIP_Label_57443d00-af18-408c-9335-47b5de3ec9b9_ContentBits=0;MSIP_Label_57443d00-af18-408c-9335-47b5de3ec9b9_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=non.se.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR04MB9316:EE_|DU2PR04MB9132:EE_
x-ms-office365-filtering-correlation-id: 203c1526-e296-46e8-42ee-08dc6b6db43d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?2bNGmeKdfJlpA9SNJOnU/Y+YgguZx2IEg1D6Vkv2CLL08S/No0nxf75oO7?=
 =?iso-8859-1?Q?GUH+f8ItpXvlWxHON1CyrmjCx6FqBNfme9DtU2hfqV6KfMMUmwz2n2UqlX?=
 =?iso-8859-1?Q?aHgynPH9s3FK7GXFwZUkNas0dD5vAMUiTnXgdgkUCkQNH2iY72xZneRCqB?=
 =?iso-8859-1?Q?P1LMkrRjrGeIAHbFg51CJsulIwJLBLRwDpGQio8pGZ1ark7Izjg1ELy7qZ?=
 =?iso-8859-1?Q?fuOchJK4Gb0mTyjyFNtAu8QQZOPhTYpRqlOtaMwPLAN78i88jxC53dqqbm?=
 =?iso-8859-1?Q?BRDOhfBlaB33G5Rwn1YdokmPN5dsMLs9w8DSiEVhLl+74HJmXApTqxCfp3?=
 =?iso-8859-1?Q?UCQ+kBYn8m80M6KS3GxgQ7LxCD8FTMDYehObUue8/jAGwwfH8fxhsGS6YC?=
 =?iso-8859-1?Q?HHxvckBEmIK1BPdcF40KeanttYqd8kNd3MJcHbVLT/LE48tDRl1hawvr8l?=
 =?iso-8859-1?Q?BLsYYhivOUEkYcIdJ0oRHXSc7S0v9F26lsXmoBCRwGJPOHzQOhK53HIJx2?=
 =?iso-8859-1?Q?DPU5T29vOKjsXsP8JhYW0wkUbiEBg4TEqZqlBaLuO/KDV3XNfA43rgAm6c?=
 =?iso-8859-1?Q?r5DzrCsZygoBmFV0lHqpBFnbTt5FuuzWfmN91+CL6rfy9TlWMnnnYEteRP?=
 =?iso-8859-1?Q?3b8Z5DYHCFdBmc5gUHrzJRp/JVGzM2Xw2LEPAl3D9IFCKDlKDvJ4Yx7XKu?=
 =?iso-8859-1?Q?8XInvvY+U4hLBk+PR3p0o5dnCFCqVCG0DLS015g+nQhmvUk2mRgsF7MpRP?=
 =?iso-8859-1?Q?S4+oTTP+56L1YHoEPp7MBliKmeE/cKnfq1wLY4QEvDVdFYfIeFOD1IYSho?=
 =?iso-8859-1?Q?X7+iVFKNc4W+QGj3WeZ9HcPzfD7QrzaSJOQIm/gXo5380HPAthAnAfsAGx?=
 =?iso-8859-1?Q?4gbidxkLUKMfWPSxw9dwU6dN1+itxdbOrTyAoHeLs9Cv3NFY1ZSrWiVIYa?=
 =?iso-8859-1?Q?mUI5oittgT4xh7bwuwhkw6R+HtDQDjvjgFLG/Vy9NaKXoHrJW6mo5wIcdr?=
 =?iso-8859-1?Q?7Ocns3vOH/HuWqPaN1RRuPEVehiCRRirb8PlOreehdZQUOW3ccSVTh7CKY?=
 =?iso-8859-1?Q?bvJQ4qbE2ghDvzL/XFb7diEp0dLcYts4hJm1m5ORTKtFsEZpbNWY19VniB?=
 =?iso-8859-1?Q?KgXPpxElIG+snmeLXHq4r3Ll99B1rTWYqByf69ac9Np8CQYkrI/cmo2m+m?=
 =?iso-8859-1?Q?wIQd5M5jpALCK3MKX6vxoH1SkggfJK33rnw95NZqJEi3Njt1IPYJCmN77B?=
 =?iso-8859-1?Q?282hWwx8Nqn0o6WzAy5fvW0BazmwS5td/N8pTo6lmrrmCpc3LdDA6oOmsv?=
 =?iso-8859-1?Q?jM4f/2m0xrh3gHnlBKQGre7VsnogyGs9fAnupqCa7FgEsycrvBmX9xS9/f?=
 =?iso-8859-1?Q?IyH9BkAocl?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?v+FvW4n989cjOT7ygR5Xol9s5/1kjcz4ibiEmPI2L15v/EGOqhHUvy43rO?=
 =?iso-8859-1?Q?91OJHA0GpnOvaIc7xoBVCDwVKEbD7NWKLqiZenC6hwqtk7ukc/bhbqDU7R?=
 =?iso-8859-1?Q?DWPlwWNhMqWSnODQ55AInAyByPkE6VS3HhqCxEKhMaEuHuAzzAG3lDFjKg?=
 =?iso-8859-1?Q?wQSx+BNslpbN+w/eam6J/1NEq2RvR80TY13pzn2SafOizoFKpoPfmmPgc2?=
 =?iso-8859-1?Q?YmUTqNAs6NwX1UhJDRBLajDDKAukOYLWvfsOKhI2GKxSRzJ2gZX0jtHqKM?=
 =?iso-8859-1?Q?CXMt2Pu9N1o7893VZQ3Aaz73//3Kfa4DbRIKu1jGGhUQJbMiqZ+8lcyp78?=
 =?iso-8859-1?Q?tL+LA8c0ZdXllDur+Gu2F2GfbY3N+EB5a4Ji+09DUisKBMCq+XwgyUpmw3?=
 =?iso-8859-1?Q?CJrtA6obkUHtrJceoWVTfPuHQrr9mydXih4rUI6PGoJAjAMStjCcBdETWT?=
 =?iso-8859-1?Q?6ZN5BMKp5bMnLZPeWfZQ3XStBfZnwdg84TO4imtuwDK2CHRy+C835GxtdN?=
 =?iso-8859-1?Q?jWG8z8PobWlW11VA+5YOAsq6KkUJ2bpCjtBAkxqr32t2+QRsJr04rQ/Vnr?=
 =?iso-8859-1?Q?z2g1amEJeXTkj5mNxHMm57N60RT86BZ2VYNOaMDh1LZ3Z571xIvFH97o1r?=
 =?iso-8859-1?Q?ZA6dmmjuOx3/RMSP6vxYGt9ZjRCKipfI3WjbVXKg9YxXNNpIXS/kOLAI47?=
 =?iso-8859-1?Q?ddl4cNaY/VxT6PT31E2KwMPjRV8QnNKvFnUHeDQdSdunZRJH0Uj8GrcwsF?=
 =?iso-8859-1?Q?lI9Fn9T+sbcvivhkw4HlfU9JuIZFwFysYrP89Z8khjpy9QfFZh7zyLYXZf?=
 =?iso-8859-1?Q?qz3lm15XkEddtiuSWVCNRaw4hoFrBrr3MhUUjJQVfmqHlblAd8O2gaf49m?=
 =?iso-8859-1?Q?jskYgrfnWc5ABpmCf/W7Nq3ituiRMEGgklrOe8/bBj2U4eYxtWOcI8+qfE?=
 =?iso-8859-1?Q?FbY6sww2b+7uuzgTsXecZpl28fV+68DdRock+KtNVdERNhh/x588dC1x4t?=
 =?iso-8859-1?Q?dh7pIuB97ryINpmCf5oNlf4sceQiZwg+or0kr0shg5ubmEALMzA9r4oJzJ?=
 =?iso-8859-1?Q?WIHaEkOtRTLNRMcA5vZyNHIGyZVw1kdqHU/jUc0iWtEemB8KoGPpSj7mOY?=
 =?iso-8859-1?Q?GZTBc12ax/EPCAp8p2EqHeQIqUAQFn0LQddnqoKuWLpnxM8YSwIkuF9BuO?=
 =?iso-8859-1?Q?+VOmKxxnQJvrItgUkebnwFsGu84ypK8VdbUVSiGKMsT64HrrrGpa+s3kLV?=
 =?iso-8859-1?Q?HJRQnA3S3MqKx6LcOpQlMfwdwqK9SLq+AX3YL2KxwZIFRgDuoIJ+8oC9uw?=
 =?iso-8859-1?Q?YjfXMk+BSuTlEWaWHDHgkRzn7BGGWWjO9vi18jcMBLHTMcdeLiaqXLDOpu?=
 =?iso-8859-1?Q?wiR1Mq/dQYZ0lEnYHRYUV1AaFUnQJgKqelwQ0Zq5S5E6/1cAK979ip/ahC?=
 =?iso-8859-1?Q?cJzTQxI+xqpby75FTSI8oTj3HIwvuP0IOj82SJKYRQ9pyBp61oMxabrotn?=
 =?iso-8859-1?Q?UlZRSFymqXTu8VRDUCEz9RPHPcgs01rk0JlerSqMdwMikGt1Yiz2FD5+4f?=
 =?iso-8859-1?Q?kBzHq9ADky3FP5aI++fljAKhOMD2vD3xPcdu6taiyXd210QyJJe/0wASbZ?=
 =?iso-8859-1?Q?fQbAfBusErhLE=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: non.se.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 203c1526-e296-46e8-42ee-08dc6b6db43d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2024 12:36:49.8964
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6e51e1ad-c54b-4b39-b598-0ffe9ae68fef
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lNsE7UQmPo2NL9BmvNep+Y8tJw+NjsyhFJRg6MgkxgcsUBDCVasr7amDW1EaxbC023r6zjegtmVSOQnU/RREWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9132
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 12:36:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198983

Hello,

Would that be ok to have support for verity images in oe-core ?

We may use the bbclass dm-verity-image from meta-security. But in my opinio=
n we should not include the commit that creates a wic fragment 3b88f75 (dm-=
verity: add wks.in fragment with dynamic build hash data (10 months ago) <P=
aul Gortmaker>)

Instead, we may develop a wic plugin that builds the desired verity partiti=
on.

Please tell me if there is any interest

Regards,
Louis Rannou

General

