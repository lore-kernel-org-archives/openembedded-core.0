Return-Path: <qiutt@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B8C7C77B75
	for <webhook@archiver.kernel.org>; Tue, 18 Apr 2023 01:00:33 +0000 (UTC)
Received: from esa1.fujitsucc.c3s2.iphmx.com (esa1.fujitsucc.c3s2.iphmx.com [68.232.152.245])
 by mx.groups.io with SMTP id smtpd.web10.14920.1681779627806877602
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Apr 2023 18:00:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=s4u2HgA4;
 spf=neutral (domain: fujitsu.com, ip: 68.232.152.245, mailfrom: qiutt@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1681779628; x=1713315628;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Bd4X0QA1Om/YMn5GFr9yXl/JLRY6fmbhYH/dTAzdbdo=;
  b=s4u2HgA4Enx5bM1XAp8lr3D+gcR6H7VHDlktcIbPcB9u0bZTUKNzdb3G
   VHjvx4FeCE9JSoK5Pz7nqgNMrj4WgpQuXi5UMM/xyu312rAPF56HeLWx1
   EN83XXmPpqdKr3BMUJfoubbqgeMnICUFodlBP579Ta5ST/6wNv/iWx6pK
   Lj5IbK4+GPwAnRZ4KXUaIjHcNoBQwqJogJ3BwzGzQqucEALRSyYxMT66E
   +unc7HWIoWLfbNWASN6+td+mOP7nRaytoaboqvTlifR0ZI5sNWaQ6iXX8
   SumO6UsF1PW/CdmcyY3jEYpAKy530CC3Fv265KlDDgQfKImHktGxe0rn/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="90483505"
X-IronPort-AV: E=Sophos;i="5.99,205,1677510000"; 
   d="scan'208";a="90483505"
Received: from mail-tycjpn01lp2168.outbound.protection.outlook.com (HELO JPN01-TYC-obe.outbound.protection.outlook.com) ([104.47.23.168])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 10:00:25 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ETSnOjMjbkNM5AR/isetSLp9teFiZ9LvIx2vUeYL0oRc2ygGllcaHUKssHlqX8xN1e2Fgf7jZwUzx2MeLW+/5zhDkurvt2sKURUaahRMhJamWrNFhUnVdkm6NtXEoKFxEJC/NEM2a71IJowTh9wzJlYTkePSegAYZ3pJncz4OuhXhxzBiSa2aWMDSCMjsH09I1LxIxgn5CacqKUCOcgsOJQfw1lZ9sIlGT2iAt7LGrcbssRioRBnXleGGi1vQcBFft2W1RkscQ9nNb99Yn/uAtfGLuYFrCe2u8VrHeMetXqU7XB8h7ekuw8gfxJQ+nrhqlA9n1surRZEvnCXGzRYmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bd4X0QA1Om/YMn5GFr9yXl/JLRY6fmbhYH/dTAzdbdo=;
 b=A+yP9t6bSkO3coadIjxLOy306CzqUKz+jTMwvI64AzR+WiaE148ZSR4AopiSjhh/SDeGvC3ermwcLPIr6fhe4Xfx4sm0kn3CKoNuCgUTqwMchkENnEKNJxRXxfCvqoPWMZb4cPPs7XNvFveb9Ox4dX5W3Wis697f+nbTnQp4mrPUcaL+m3RPFIfxNptP7Ng/P1sebBRAJJFBSpde8OipjglROOn6HsXWGLsfP0py5oGVAdhuiBsE/+ubwMOb2a8jlLmCFQ7psqALFCj65V6j8Yt9UAk8hOOCcGsqcWFQvNnOMSoreCIRIjGYwNDHaAdRaJJRbpdGdLDfaQULPFTO+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OS3PR01MB9515.jpnprd01.prod.outlook.com (2603:1096:604:1c8::7)
 by TY3PR01MB10126.jpnprd01.prod.outlook.com (2603:1096:400:1d9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 01:00:21 +0000
Received: from OS3PR01MB9515.jpnprd01.prod.outlook.com
 ([fe80::4bb4:7c26:81d3:efbf]) by OS3PR01MB9515.jpnprd01.prod.outlook.com
 ([fe80::4bb4:7c26:81d3:efbf%4]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 01:00:21 +0000
From: "Tingting Qiu (Fujitsu)" <qiutt@fujitsu.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "fnstml-fujitsuten@fujitsu.com"
	<fnstml-fujitsuten@fujitsu.com>
Subject: RE: [OE-core] [PATCH V1] coreutils: Add gcc parameter for ptest
Thread-Topic: [OE-core] [PATCH V1] coreutils: Add gcc parameter for ptest
Thread-Index: AQHZbq6fc5JA3dyHCUmeGkKCNTc2ua8qjSCAgAW3dpA=
Date: Tue, 18 Apr 2023 01:00:21 +0000
Message-ID: 
 <OS3PR01MB9515C7A0036E9133BE40A910BA9D9@OS3PR01MB9515.jpnprd01.prod.outlook.com>
References: <1681462400-3660-1-git-send-email-qiutt@fujitsu.com>
 <20230414114111.07f9ffdb@booty>
In-Reply-To: <20230414114111.07f9ffdb@booty>
Accept-Language: zh-CN, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ActionId=77c57f7d-353e-47dc-8c17-739d8cec5b24;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=0;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=true;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED???;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2023-04-18T00:59:06Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB9515:EE_|TY3PR01MB10126:EE_
x-ms-office365-filtering-correlation-id: feefb965-a436-4bf9-e1f1-08db3fa8491e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 6QLt8lkShPRJJg9semhaqi2XDSDMEjF3n/v6DKKVbob9sJ9JaPDUDE0yfQryGn8ehhm/lLMDaGiruGF3jDn+OPcE1D1YBZ3hJkvMiBmyGu0mp/teYkGvsvR/Y7RbPxHwVhI7YcpwBX7HWNOWRSnR51qmeE73m/7sTURA/rNrdgsw6dGp0asVflanABxNrOVSbXjDk3/19DqW8KpPc5rwZF4su0JP/uUSg+o2d/MWWqCC6pbxyStpTDgCrQiOxrF1yNopnqGhQTGoGxhOyeZD/d4jkYkv5hlHSLrcCBM+waamTRgLgPHrgar8TInMzFuLB5dSfG6sgu3cSRUspgb/CICxmXpM9dwQLAuJGJZmr2qG/duySWvs05x7Or5Xs8hM06tgT8MlomWgikC0hDH0Bu3T6qtgXRLfhE30uFtniyoUOsk1uAgofKDBu2gDUi/FDOaj8z8SBeX6uBISIMsvZ+nDQMQsBo13TRLfS8IVVEAvjNNYASxf24OCzKgftpEMBYy0LGTmmCtnSCVeavAgVtQGkYKVy1JEa0dC7+t/t1ahC/qKqzW4EhaNYWaxW7+kcENAh2eZulOIreJ+jKsBYNoMV91BV++WsmkJ4IwotjEfRorLOGyYtVEdix5/82nN
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB9515.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(396003)(39860400002)(366004)(451199021)(1590799018)(966005)(7696005)(478600001)(86362001)(55016003)(71200400001)(26005)(83380400001)(33656002)(107886003)(85182001)(9686003)(6506007)(53546011)(186003)(82960400001)(38070700005)(38100700002)(122000001)(64756008)(76116006)(66556008)(66946007)(66476007)(316002)(66446008)(2906002)(4326008)(6916009)(8936002)(5660300002)(8676002)(52536014)(41300700001)(54906003)(1580799015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?big5?B?YzNyTTU1WUJhdjdLU2ZGNWxTOEM2YUllOG9CWmZ3MVpKNExyRU50aVNHeWZRVE44?=
 =?big5?B?SUtmRkRodTQrWlpHRnU5ODh1Z1RPNnVVanJ0Y1EzZFl3WEl3MnpnMVhPblJCdnln?=
 =?big5?B?WExYTk1pUFpCZmpyWjlZaFdDQzc0SW9oQUlZc3UwNDlaWitMTW9NWlFvWEYyQXJn?=
 =?big5?B?YXhCMTgxUVRLeEJjOVFDVWtMeTZIdllPcncyZW80YzhRYjlLVk1WaUdyWkljb1g1?=
 =?big5?B?OUMxMWdjZVdPRzJOemZkR0l5Q2dpL2NzTU14czhkTnhzdzkyNkJLNEhqTFJJYUt0?=
 =?big5?B?V3NvTnZjOCtxbU9WNjVBWlZzTnMwUUpwYnJYNld2ekhYTkJadzhtc1B2N0Q2RTlo?=
 =?big5?B?M0I4czBXSm53K3YvUkNBRWZYaW5rRThCeWNWNldTeTdTOUtWbUY4cERnYnpUYW5U?=
 =?big5?B?NUwvdHZobUhmV3hkM2NJUFJ2bEY0L3czSzB3VTNhbWhuOHJ0dklyVk5VQnkvbHMx?=
 =?big5?B?bU9kOTFWVzVtV2RsdXJ6UHBIOTVXbFBJdGp4Nk9UaEJpWkR1OCsvV2hndDVESzJC?=
 =?big5?B?a2hNMWZkdG5oZTNoWnIyVmRaY1dpWE9nQk5CbFFJbDJ0cklYU1BDVWVKcEc3bzdK?=
 =?big5?B?aDcyMkJpTC8yVDVlUjQvOFNFcjVmenpBa0YxdTVqak1qZ2xvdGIrZFE0K3pncFAv?=
 =?big5?B?bFZwOXNsOU1qcG40akgxS1FuUzJ1M0dXQk03Z0ZSeUJDSHduakpsdklGQkRIY3JF?=
 =?big5?B?Qzd2OTFxeEl3YzZhUllDeDRxZkdJYnhOMUNDZkN0MlIvRHVKdzlieHpXNVY3S2xH?=
 =?big5?B?eS9jek1QMkwzajZ6dWp4Z0hQMTM3cnpTdUFydEF5eElGRWVTQU9heUhiK00rdExG?=
 =?big5?B?d3V0WEx1UGdMTWJmZUlXQ2o5MXpMQnphTXBjVzQ4cE9BYjhabHd1V2trVVFVNmZt?=
 =?big5?B?VEdRNU5LcFZQTENkeTc1UGUyTWhMaE4yZzFaejRqL2FJQk1pbkdVK1o1cjJydGhY?=
 =?big5?B?SnJkOGpYMEwrS2VhckZ3TjhvL0FNSjhUSTVLSVp4TTM2QlpOcW1tcmwwRFg4S0pH?=
 =?big5?B?N25MQjFRSnNqeXBsOU5lR1BUQ2dzOWZjNnNLaWhUeEhIRFZHcTZxM01pTG5hdlpp?=
 =?big5?B?SldPQmZYQlRJUWtqakNLUWRXVTFaQi8rdWpBOW92cEVkb2c5Z1NuMENsdTErdEF5?=
 =?big5?B?WHZkYzVscU1WdnJ5VWk4S3NTZ3BzREtEdHl3ekxaZnR2bjF4dm5xR2VnK3hrTmpk?=
 =?big5?B?YnVpM1lERWRlWEg3SHhnM0ZmTHI4OW5oVkp1VXorY0g3Um1tRHA3YWZ1dEJvVWJP?=
 =?big5?B?SW90V1VQKzA3VWNoaUY4VFhRdGladDNER0c2SGpsVS84R3N2MzAyMjA5bzdadmly?=
 =?big5?B?V2xXdXMvVXd3ajl5VXA4WENCZGl0Wk9UdGliT1pqeE1jdXM2L1RCZiswZVZpdGpX?=
 =?big5?B?QTFBVlVMQjc5RXpBSElyb1B6eVVPR2xwelBNMURRREQxekQ5OUJkdExzRWNOY3pP?=
 =?big5?B?dmszZlUydGtPeDBsMkVFZDAveCswUk5hUmpEMXQ0TmFXbGJaaXlFSWE3a2VGeHNv?=
 =?big5?B?eE91c3FrUXJ2dnU4dmlRdDJWOEJtWHp1Q3czNzVnUmZUcWZmUHp0OVRxSFlWMXUw?=
 =?big5?B?djJSbFZkbmlucGdMbnZ2Q0E5OFZ6SE81T0JzNy8ydUxDYVk4TUlIdmFZVHkyRHVk?=
 =?big5?B?ZmFjUEVpQk9jS3NYZ3pKQkVCbFE3c0U1MHphT0FDV3dDaXNEenlUcHBkQnQ5cGFU?=
 =?big5?B?M0pTWHJVaGRDUGNTbW1aM296b25pT1FzckJSOFhwaDZCeFVZZ0hEZHZ4NTR5eVY0?=
 =?big5?B?RWVlQm1rYlpHRTlpdXZsT3h6MU42UkRqdU1ENWhsVDB3Z0c4bE42cEd3Ync3NDVH?=
 =?big5?B?dGZaMEt1eGpML2t4bjUxejM5WE9XS2dnN1hzTytrMHl3c1pCQklIMWVZcnBCZHk2?=
 =?big5?B?VFl3bDRmbGZxMnNtQ245RDNERzRPaGptcEEvNEZpZThTZ09RRWp1SEU1amxaN3RT?=
 =?big5?Q?ZIkCX2S7cAoFv9ECAM0/OcW7YJUbJJn/uhDdkwDdNZo=3D?=
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Q+2PMN+xDbew1oSJfIJkwxDoyxKqvCE/jZ20YqNbBv4RnjhOTlJbdfGPrLReGnAStU1oldadT/DzT80J5/Ll1XwQSDIpkmnKbW/dfdv1ghkpttF5Yk2dSGdKYzhXJn6mC97C9BvWvGAqm3BHvmRsSSCqvcpC6JEt5k0hxPX1hIubR0k62VOJaD5ZpEh+MFYHMazoeIpU42RFNmL3RRmzhlpiE0JOAWzcOsPuYiroCnbQksxjdg7mLSA7bOMzlohPIf0tlzUxxZIukTHoB3ZcEQH3/6RIvj72Rsg8zyc8wJUSb4f+sUf3FfjzF8NnhIZm+rXsmoK4B+V/nouNKHOa9oTzpY/QNNnPA54SnkH7YkK5jLf54WioqHtuHxhmy97brrK8aCwQeCbY4JWhnailIXUTVIgP47cRNVntP+lfbYoMnWKgtgm9aVtWE0ofS1KLKR+Xonlb4GGhsmKxYY+beApoIgataPZHFAtwXtlwoEchON3uBHlxwz8copyM07462QjmtDUfhETFMGh6mEkgRCW0etBLZrHnFfpW70QtqyTUgDV9DUOniifp1OJZ/i/gGJbfyC53amDsPWJzSMMu7hGumjLmSb1KmxSR+Pyj2RK7HebTOAERd0yw61haEKYk17Hd1xc3cszAkQrzRskApVjIjoj/Vf128D/9upPM18/BL68GHYeDCx6h7qxyLwaExeI2zc3ndm79Rv368nh2TqiyroA3uDiP1fGF1eonyrMmb+3Xe3pb8v42CPSDI+q8LcIlZliqpJg7mI025hprTvFlLxDFgPPG0FYY+9TGDhEWipkWSh8WCUFmRBE67/BP
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB9515.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: feefb965-a436-4bf9-e1f1-08db3fa8491e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2023 01:00:21.6768
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cCazOzWNQcZqEthnR+NdiJ7lqzx4LZSofnnHwxkCqtj7EOK+hBqRWy7JkyyVR11EH3AlUED79E7SmgolQqbBbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10126
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Apr 2023 01:00:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180170

SGkgTHVjYSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMdWNhIENl
cmVzb2xpIDxsdWNhLmNlcmVzb2xpQGJvb3RsaW4uY29tPg0KPiBTZW50OiBGcmlkYXksIEFwcmls
IDE0LCAyMDIzIDU6NDEgUE0NCj4gVG86IFFpdSwgVGluZ3RpbmcvpLMgtEC0QCA8cWl1dHRAZnVq
aXRzdS5jb20+DQo+IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
OyBGTlNUIGZuc3RtbC1mdWppdHN1dGVuDQo+IDxmbnN0bWwtZnVqaXRzdXRlbkBmdWppdHN1LmNv
bT4NCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggVjFdIGNvcmV1dGlsczogQWRkIGdj
YyBwYXJhbWV0ZXIgZm9yIHB0ZXN0DQo+IA0KPiBIZWxsbyBRaXUsDQo+IA0KPiBPbiBGcmksIDE0
IEFwciAyMDIzIDE2OjUzOjIwICswODAwDQo+ICJxaXV0dEBmdWppdHN1LmNvbSIgPHFpdXR0QGZ1
aml0c3UuY29tPiB3cm90ZToNCj4gDQo+ID4gRnJvbTogUWl1IFRpbmd0aW5nIDxxaXV0dEBmdWpp
dHN1LmNvbT4NCj4gPg0KPiA+IElmIGdjYyBpcyBpbnN0YWxsZWQgaW4gaW1hZ2UsIHB0ZXN0IHJl
c3VsdCBoYXMgNCBFUlJPUi4NCj4gPiAgIEVSUk9SOiB0ZXN0cy9ybS9yLXJvb3Quc2gNCj4gPiAg
IEVSUk9SOiB0ZXN0cy9ybS9ybS1yZWFkZGlyLWZhaWwuc2gNCj4gPiAgIEVSUk9SOiB0ZXN0cy9j
cC9uZnMtcmVtb3ZhbC1yYWNlLnNoDQo+ID4gICBFUlJPUjogdGVzdHMvbHMvZ2V0eGF0dHItc3Bl
ZWR1cC5zaA0KPiA+DQo+ID4gci1yb290LmxvZyBhcyBhbiBleGFtcGxlOg0KPiA+ICAgLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiAgIGsuYzoxOjEwOiBmYXRhbCBlcnJvcjogc3RkaW8u
aDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQ0KPiA+ICAgICAgIDEgfCAjaW5jbHVkZSA8c3Rk
aW8uaD4NCj4gPiAgICAgICAgIHwgICAgICAgICAgXn5+fn5+fn5+DQo+ID4gICBjb21waWxhdGlv
biB0ZXJtaW5hdGVkLg0KPiA+ICAgci1yb290LnNoOiBzZXQtdXAgZmFpbHVyZTogZmFpbGVkIHRv
IGJ1aWxkIHNoYXJlZCBsaWJyYXJ5DQo+ID4gICBFUlJPUiB0ZXN0cy9ybS9yLXJvb3Quc2ggKGV4
aXQgc3RhdHVzOiA5OSkNCj4gPiAgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4NCj4g
PiByZWFzb246DQo+ID4gICBJbiB0aGVzZSBjYXNlcywgay5jIGZpbGUgaXMgY3JlYXRlZCBhbmQg
Y29tcGlsZWQgYnkgZ2NjIGJlZm9yZSBydW4uDQo+ID4gICBUaGVyZSBpcyBhIHN0ZGlvLmggZmls
ZSBpbiAvdXNyL2luY2x1ZGUvIGRpcmVjdG9yeSwNCj4gPiAgIGJ1dCBnY2MgcGFyYW1ldGVyIGlz
IG5vdCBzZXQgaXQuDQo+ID4NCj4gPiBzb2x1dGlvbjoNCj4gPiAgIEFkZCAiLWwgL3Vzci9pbmNs
dWRlLyIgaW4gZ2NjIHBhcmFtZXRlci4NCj4gDQo+IFdoeSAiLWwiPyBTaG91bGRuJ3QgaXQgYmUg
Ii1JIj8NClllcywgaXQgc2hvdWxkIGJlICItSSIuDQpUaGFua3MNCg0KQmVzdCByZWdhcmRzLA0K
UWl1IFRpbmd0aW5nDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEx1Y2ENCj4gDQo+IC0tDQo+IEx1
Y2EgQ2VyZXNvbGksIEJvb3RsaW4NCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVl
cmluZw0KPiBodHRwczovL2Jvb3RsaW4uY29tDQo=

