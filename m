Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38C6BD1CA09
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 22:53:45 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.46])
 by mx.groups.io with SMTP id smtpd.web11.4292.1730760818870213241
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Nov 2024 14:53:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=fRvcedwk;
 spf=pass (domain: axis.com, ip: 40.107.21.46, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bg6tLpwAklO2abi/pV6vNO6ZMAtifdRJ5BLE0umCctIaXzw+hGiutCtQht3U/0pG1xqEQzJEXSk1nj1xiUm6O1ss87J4b7ZurKv58UHVIF0RicAMAkQHeD9WW/oEQXUHJFqlLA9YWfOp7v9KX38A1EGy2WGzaV3GDzUm8tJFnGlCY7qH4EzEVBcDDDl9mMlvSSBl2GOcDyTQfRBej3FS2k0irrCTKE28r0ILvkewU0B1198BRWFagxC0Du1ic3kVp51FZIjgZCB+J6jOureThntYGaQd2kBa9iCNgHHEfyvl7dDSgfZBYdIcyzOg1KWEiUUIHxq/1ADemzn5ZtiGNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IRRmFnt4yf0Q9Dsvfq2S6Nyawb3nBVNF0vEVfuRbc+M=;
 b=DVPE29CtF99QawE4UYWdwCMS7z92o0i0LMNiKvKhKjV35TyjF0GVsJxSXYo8PSA04SBaZFmTZjfmsXwUDslvX3OaXoVeLrQjJE65HT1l4wM/BUCrbKu1UJVN8pC5AZ7L3PM6M4N+k0e73OmLuFaTAJutMenHX7xlUhLJGpSPNaO3WNIPJ7NbAjkL9OPrtSUqTCVgeNp78Ght32dIjll6Anaat/isfKYx1siFnGFWoYByBOWFTJZrP3+fI9UzLXaONVlkEt9yfGMy4FG+y2UIxhJiTwxwuUUh5FVhuJ2QHLIufUGiY8U5dgDtEVY/8S3cdynwWMC+fCg1E/0owmNfLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IRRmFnt4yf0Q9Dsvfq2S6Nyawb3nBVNF0vEVfuRbc+M=;
 b=fRvcedwkLh5039T6TqJQ1QcE2GVeLR6a0PkXrbXnnmLhV84a9vnna1j+8RrKW2NbrB8EM3WbIMU8bc4GFzy/DTT0TlOpXvZtQUrph9O0nKs0K518dKeHuoR3w5TjjM3neAo8C8zyvNXyLa0o/C9hULbn+4VMtkyquxKvHyEV404=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AS2PR02MB9932.eurprd02.prod.outlook.com (2603:10a6:20b:607::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.28; Mon, 4 Nov
 2024 22:53:34 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%4]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 22:53:33 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "chris.laplante@agilent.com" <chris.laplante@agilent.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] devtool: modify: add DEVTOOL_PREFER_BRANCH
 support
Thread-Topic: [OE-core] [PATCH] devtool: modify: add DEVTOOL_PREFER_BRANCH
 support
Thread-Index: 
 AQHbLJWsHv+WdQCxK0KQzBJz/5ibp7Ki2vWAgAAVoICAAB38AIAAp5GAgAACWACAA4HMAIAAJ46AgAAskgCAAC9uYA==
Date: Mon, 4 Nov 2024 22:53:33 +0000
Message-ID: 
 <DB5PR02MB1021389C25C98D4C85588EE8EEF512@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20241101193811.2068211-1-chris.laplante@agilent.com>
		 <CANNYZj-_8+EH51Nk2tj+o7a2PpscSO2bi8e-ak8g5fnUhADULg@mail.gmail.com>
		 <DM8PR12MB5430BF49467783C0051229C68B562@DM8PR12MB5430.namprd12.prod.outlook.com>
		 <DM8PR12MB54306736B03571231E94A9498B562@DM8PR12MB5430.namprd12.prod.outlook.com>
		 <CANNYZj8rn3ocAAbCRYF-YKea8=DtVjcUv3vU+wbpCskzQ3JC=Q@mail.gmail.com>
	 <1a87ce686c05f97ab77fe19c658a6882a8dbd48c.camel@linuxfoundation.org>
	 <DM8PR12MB54304D02DCB6765D471334CD8B512@DM8PR12MB5430.namprd12.prod.outlook.com>
 <ae554f47fe13215139c6ea3cd88e5c8fdf29707f.camel@linuxfoundation.org>
 <DM8PR12MB5430A540AB3CABA956D1CA888B512@DM8PR12MB5430.namprd12.prod.outlook.com>
In-Reply-To: 
 <DM8PR12MB5430A540AB3CABA956D1CA888B512@DM8PR12MB5430.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ActionId=a144cc78-7eb1-4780-a9f4-cd574f501ee8;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ContentBits=0;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Enabled=true;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Method=Standard;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Name=General;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SetDate=2024-11-04T17:55:48Z;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SiteId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AS2PR02MB9932:EE_
x-ms-office365-filtering-correlation-id: 7f194000-a09a-438f-06c1-08dcfd2382b7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?NWVna2kzTVVMNSs2cU12cnJlRmV0S1hRMURpT0xwQ2hhQmFxbHBkRG5Rb2xU?=
 =?utf-8?B?ekdSMDNYbFFKS05jSit6eW5oZkZORHdZcHFMVHF2OVpybkN0d005TnpOTEFH?=
 =?utf-8?B?dWtMVTZZdStORlU3VVdZSDhYaXZlVy9yOVF2UDBJazFlQ2VyTktlOVBHNk9j?=
 =?utf-8?B?ZUdUZDJGMFZwU2x1VHR2Mm1pMTVWVHR3cjhQNzdnQ1JjUHF2Q0pVTFhMbjJN?=
 =?utf-8?B?SUlIOXEyVFZzZGVBYm1WR1cySkJ3d2lIVjl2MWtwMUFRTEdaWVA2UHg4YWN3?=
 =?utf-8?B?ZVlMVWpxZktDQ21HMkxiQUhkK0R0NDBkZWRjcmw2czhuMGRSa2E4RjhCUFNz?=
 =?utf-8?B?Ky9HbXN1dEFISEtPQldlYlE0RDJKN3Y2NjVVclVZVGYzM2tNREJhSTV6RCta?=
 =?utf-8?B?b1NieDd6Uzh4bVA5aklCS1ZtYjJrQm1aZis3M3NoVnd6am9MS2dBT0RnbUUv?=
 =?utf-8?B?V242M01qK3hjZ1Nmc2NnMndsZ0FJOWp1WmRnVWlMWm1OYlduMkNVVm16d3RX?=
 =?utf-8?B?OTJNTU5XSmtqU2RmNHZ5Q1g2SWl0OGlNekZuZHJYVlR2czZvR3NuT3RFZFla?=
 =?utf-8?B?KzdDSUp1Mi8xbGxCdjZjaUdFcCtSQTR3WGJhd0d6VC9EUnZkR3UySEhFb3JL?=
 =?utf-8?B?VEdERWV5cHQyYVV6MUdvUmhaY29FOEZadDdhbC9rLzY1ckI5cXJaczBUakZP?=
 =?utf-8?B?Z1VhdXRXUFFwQU1jc0Mrb1pRUVJLNXhTNTFJWkY2czZqaVNLRVQ4UDNYZmlD?=
 =?utf-8?B?ZHNaaDg3NWY3UlZESkc2RnJmN0hrWnRpTlphNzFVN2g3ampoTnFNN1Y0QXdt?=
 =?utf-8?B?OXg1MWNIaFc0SVJVNDFLR3pNMlpYVHRxQlduYmVSSStuKzhMcTkzeXFZYVZ6?=
 =?utf-8?B?K1VCbWpsYmdFMlc5dXM0eGp0VUlGZXJQang2UVVONTJGMkZyRzl4dzZTbFVk?=
 =?utf-8?B?TFRjdmVtdTNsRXY0aFEzeEVWWEt2SFY5SUJrbzh5d25vOG55TkRZZC94akFZ?=
 =?utf-8?B?VGJxeFQ4ZE1sQ3h3emd4QzNpVXord2RNeTR6MlZ2VjJPOXNqOXRvY1dUYWNW?=
 =?utf-8?B?Q1hEc1BFTWdOYXRBL2U2cnZIS040YTFqbmdiN3lqbzR2bThvbVZjQWpEN3Fh?=
 =?utf-8?B?T3NRanZUdWRrQjRzK1ArWkxtR0ZyanRaODV2RDd5eVZpZzIxbU44RmlnaVRs?=
 =?utf-8?B?RlEwanFQYXRpTlVsdUp5Ly8yVzFmQkFMVjlRYUdPY041cENzb0dsWmVFK2lJ?=
 =?utf-8?B?TjNnV1FZYzgwREVyYm1HWFJuVncyRng3cFVCRWZzcjhhRGRYR0o2dmxDc3NB?=
 =?utf-8?B?WEFhV1JNZjU1Y1QxdlR5SGZDM1QwQkRzM2lXaDR3SHEvM1pNdFlWNDlDSk00?=
 =?utf-8?B?NHBtbHNNNDdkQjVlL3BYVW1hYlZaOG1ic2REd2NFK1RJKy9uYkgrKzQ4USta?=
 =?utf-8?B?eHpGVnpaMWo5aENuRS8za0ZoengwdmRMUXRrcTkwWGhZMm55TkR4TDZCVzEv?=
 =?utf-8?B?WjI4cXFxVTl6N082RGZJL3EzcVl0SktENFNUZmw1RjNNeUQ3VkRqYzZ1eVg4?=
 =?utf-8?B?dkQzbnRrc3dUUDJNdGxxT3B4eEo0OTlyTU50MlloN08rL0NPa0VERmNuS0RG?=
 =?utf-8?B?aVdJZGhZVHdDT2NpOXdBTm01QUp6SURYUC9TVmlFWFJRNVdUSjB4K09IYVB4?=
 =?utf-8?B?M2tnY1lxSm4zaVdUYXgwWUJqTlNBUmIvN1ZrbzdVeWV6RlU0ajFKc3MrRTBo?=
 =?utf-8?Q?YjLIW+qFyJ4Pmr2FSfwka6gxmZHK/CZNqujLwtS?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Uko1V2lsU3RHL1FDSnk4Zm1RaklXcnMwblpSOXNCRkFMTktMMjZ4OElvZTZC?=
 =?utf-8?B?RGo5cHVValpnZ2phMFhCVm5ua2xpd1hDVjlyRXpuSkVqbVIvc0NGZmY2czJt?=
 =?utf-8?B?SW44dVRqMUJOMUFjbmFqVGtHNHMwUStZaWRHc3RRVm96bzAwQmdybkxQQTFq?=
 =?utf-8?B?b2tOejhEZnpkMDhFUC9JNFBtOGtRRlpjVCs1dlVZWUhIOVRNajNTNWxKclZS?=
 =?utf-8?B?aDV3NDNraFpRY1FmL1kxRTJJc2t0bjBYR0FrL0loUE05bkw0bVp5TEUxSGI5?=
 =?utf-8?B?ZlBDeDJVTkhQWllrTm5NNlZXR21xYWYwVU5VZ0s4ZXVnZ3orTnVnanFNSXhl?=
 =?utf-8?B?QThqcVNMbkk5SDZhT3ptNEx6M0dhWDRaUnBxcUVHNzR0Um1JVWpxaEpyRUVp?=
 =?utf-8?B?cnhjR2tBWU52Y1pJc203ejlkektZSHZ2UFpvUmN2T1AwTlZVeE1VWjBaRitT?=
 =?utf-8?B?blhYU2IxMDNBQW1sTWozNGd6M0pxWkVQNE5nZFNLQlV3ZHBaQzh6OXhxa2w5?=
 =?utf-8?B?djgxdmxWcTAwMU1tc1hzZFI3azRpOGdWOElSM0ZiUUFjMlZiOG0xWm0zTXMx?=
 =?utf-8?B?bVZnWjVTcFptOHVWdlRVZ3ZVeXpQMVQ0R3ZPU05TV3Q0K1RsZlFwVDZlTE5M?=
 =?utf-8?B?K01vOWdvZmhSQ2N5emZHQ2Y1ZEQ0UTlSUFlWZGhLVmxBWjhKOUtNSmg2blNJ?=
 =?utf-8?B?WXA4TmM2ZzhRcXd0aUJyNDNCcDJkVWhSRmpXZjhneHFibWtKMldqeWRVQlpt?=
 =?utf-8?B?bjdDUmIxZzVFTW00MTIvQkQ1aGZ0WEtQbitDWWpFMUtRZHJvQ1VGK3FhUzBY?=
 =?utf-8?B?cnk5ZjY1ZVE0anhmT3lkb25GK3gvZjd2OEVBMDZWcWh0dTlDQTBXYi9MbDJE?=
 =?utf-8?B?TUtlSkFDMHRqazEwelArUWhlbVkvbUpIZ0VzOGJtaG15WTE2SzZwR3Y2RGNB?=
 =?utf-8?B?WUpPMjlqUTBiY2RQdW1pMkgydnRQSXU4akxyQzBvM1YvYlJPTU5FcU81Rzcw?=
 =?utf-8?B?dGpXM3dRdjVjVFBYYXNEaVRoRzdlK0FRSUtVOWJUb2hVRjErT0I2aFhhelda?=
 =?utf-8?B?M3NkNXE1Sk5iUGd0cHJUemJXckdRR0QwR0I1ZnJCR0tGNnk2cW1lamJBeXAv?=
 =?utf-8?B?ZHIra25GQmFsNnVHbDBEa3FsZXpDV3lQcHVVekVLZE55SzlMTXl4K253V0U3?=
 =?utf-8?B?RzBUbGhjMDljRE5aR21XeEQxc0JMSGlPbXhhdHpsUStUQk1EcjNhMzlKU3kz?=
 =?utf-8?B?QTlzaTB5T0VXcHZMb3B3K1hhVjV1MmtkUHBHL0tjLzkweWxUQ1dJWjJTZHRs?=
 =?utf-8?B?TkVvMk1WRHBMbGNjbUNNL3ZUeUpRVXNpdmNZbjRic1RVM1pmeUp2Lzh6QUhF?=
 =?utf-8?B?QXJjUitJaHFBWXRJbWdiTWpYSWJma0hqUUx2dDZwa2JFR1FvZUJsaEdYLzdJ?=
 =?utf-8?B?dUJCU1p5eHdpdGFYY0JlRmdwR3lqd1dKNWtzWDhwNlh0UzlZTTZBUnZGWVR5?=
 =?utf-8?B?cWRIdGFEMnkyMm4yZXM2WGJVNWRhVkl5bE0rSXIrYXlXZjMrNDBMT1J6bDVD?=
 =?utf-8?B?ZFFmVmpZVmg5WmIyM0VPdmZhYjc4Wm1rVVJsaDdkaGh0Q1JsaG1NZFVvNmw0?=
 =?utf-8?B?VWZPTVhJa2gzVDBvcGJWbUsyTkZSeGNUNFZicmZCYk9PM0JCUCtJWER1ZE1h?=
 =?utf-8?B?K2hpaTdiRktTT2M1YUhMZFc0Uzlwc3cyN0lIcXZ1WGMrOHdnMi9SbWhycVZy?=
 =?utf-8?B?MnRpK0poSitKZ3F6byt1aGdhUFNBanZlL1FkWkxyeUhxKzE2enFhb041blZi?=
 =?utf-8?B?ay84RDhZTzZHUHI4Q3Npd1lxUklmK2JXcmd0WElSczhKRnlzS2dBZGJJR2pF?=
 =?utf-8?B?Zk1nbC9HSWhuVDZSVEJFMjBJYjhIalZxRlBxenNHTkQrSnZHM2J3RGNJaUhL?=
 =?utf-8?B?bExGKy9oVzFsVW4rTTYwNDhJTnR1OVgveWh0dXY4WGxaT3YxeFJzOHREcC9J?=
 =?utf-8?B?c1NtZnRVMWovNTRZUDBJckZoTlA4cHpTR2RJS3I0cmlEbXVrVEdwaW9tbjhl?=
 =?utf-8?B?cGRFaTFqTkwrTXV1cUlGaFRvTUl4MGtZUXpGN3BUZENtSnBZblJhOUZEVVNv?=
 =?utf-8?Q?Mi64=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f194000-a09a-438f-06c1-08dcfd2382b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2024 22:53:33.8406
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WDRZ6JnpXytqPcn1a3GuDssWsvlbsD1QyAwCz6SXDI60rtKb6aiM2TH5uxy45gsT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB9932
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Nov 2024 22:53:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206696

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIENocmlzIExhcGxhbnRlIHZpYQ0KPiBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnDQo+IFNlbnQ6IGRlbiA0IG5vdmVtYmVyIDIwMjQgMjA6NTgNCj4gVG86IFJp
Y2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPjsNCj4gYWxl
eC5rYW5hdmluQGdtYWlsLmNvbQ0KPiBDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gZGV2dG9vbDogbW9k
aWZ5OiBhZGQgREVWVE9PTF9QUkVGRVJfQlJBTkNIDQo+IHN1cHBvcnQNCj4gDQo+IEhpIFJpY2hh
cmQsDQo+IA0KPiA+ID4gSW50ZXJuYWxseSwgbXkgZXhwZXJpZW5jZSBoYXMgYmVlbiB0aGF0IHVz
ZXJzIGRvIG5vdCBub3RpY2UgdGhlDQo+ID4gPiAnZGV2dG9vbCcgYnJhbmNoIGhhcyBiZWVuIGNo
ZWNrZWQgb3V0LiBUaGV5IGdvIHRvIHB1c2ggdGhlaXIgY2hhbmdlcw0KPiA+ID4gYW5kIGVuZCB1
cCBjcmVhdGluZyBhIGJpemFycmUgJ2RldnRvb2wnIGJyYW5jaCBvbiB0aGUgcmVtb3RlLCB3aGlj
aA0KPiA+ID4gb2J2aW91c2x5IGRvZXNu4oCZdCBnZXQgcGlja2VkIHVwIGJ5IG91ciBidWlsZC4N
Cj4gPiA+DQo+ID4gPiBJbiB0aGUgY2FzZSBvZiBBVVRPUkVWIHdpdGhvdXQgYW55IGxvY2FsIHBh
dGNoZXMsIEknZCBhcmd1ZSB0aGF0IGJ5DQo+ID4gPiBkZWZhdWx0ICdkZXZ0b29sIG1vZGlmeScg
c2hvdWxkIGNoZWNrb3V0IHRoZSBicmFuY2ggZnJvbSBTUkNfVVJJLiBXZQ0KPiA+ID4gY291bGQg
YWRkIGEgZmxhZyB0byBvdmVycmlkZSB0aGF0IGJlaGF2aW9yIChlLmcuIC1kKSwgb3IgYWx0ZXJu
YXRpdmVseQ0KPiA+ID4gaGludCB0byB0aGUgdXNlciB0aGV5IGNhbiBwYXNzICctLWJyYW5jaCBk
ZXZ0b29sJy4NCj4gPiA+DQo+ID4gPiBXb3VsZCB3ZSBiZSBPSyB3aXRoIHRoaXM/IElmIHdlJ3Jl
IHdvcnJpZWQgYWJvdXQgaXQgYnJlYWtpbmcgYmFja3dhcmRzDQo+ID4gPiBjb21wYXRpYmlsaXR5
LCB0aGVuIEkgd291bGQgcHJlZmVyIHRvIGhhdmUgYW4gZXNjYXBlIGhhdGNoIChsaWtlDQo+ID4g
PiBERVZUT09MX1BSRUZFUl9CUkFOQ0gpIHRoYXQgSSBjYW4gdXNlIHRvIG9wdC1pbiB0byB0aGUg
bmV3IGJlaGF2aW9yLg0KPiA+DQo+ID4gVGhlcmUgYXJlIGEgZmV3IGNvbmZsaWN0aW5nIHRoaW5n
cyBoZXJlLiBXZSd2ZSB0cmllZCB0byBtYWtlIGRldnRvb2wNCj4gbW9kaWZ5DQo+ID4gYmVoYXZl
IHRoZSBzYW1lIHdoZXRoZXIgaXQgb3BlcmF0ZXMgb24gc29tZXRoaW5nIHNvdXJjZSBjb250cm9s
IGJhc2VkIG9yDQo+ID4gdGFyYmFsbCBiYXNlZCwgaW4gYm90aCBjYXNlcyB3aXRoIGFuZCB3aXRo
b3V0IHBhdGNoZXMgb3IgYWRkaXRpb25hbA0KPiBjb25maWcvZGF0YQ0KPiA+IGZpbGVzLiBUaGF0
IGlzIGEgZ29vZCB0aGluZyBpbiBnZW5lcmFsIGJ1dCBJIGNhbiBzZWUgaG93IGluIHRoaXMgY2Fz
ZSBpdA0KPiBkb2Vzbid0IGRvDQo+ID4gd2hhdCB0aGUgdXNlciB3b3VsZCBsaWtlLg0KPiA+DQo+
ID4gSG93IGNsZWFybHkgaXMgZGV2dG9vbCBzYXlpbmcgd2hhdCBpdCBpcyBkb2luZz8gSXMgdGhl
IHVzZXIgYmVpbmcgdG9sZA0KPiB0aGF0IGENCj4gPiAiZGV2dG9vbCIgYnJhbmNoIGlzIGJlaW5n
IGNyZWF0ZWQgdG8gaG9sZCB0aGVpciBjaGFuZ2VzPw0KPiANCj4gQ3VycmVudGx5LCAnZGV2dG9v
bCBtb2RpZnknIGRvZXNu4oCZdCBzYXkgYW55dGhpbmcgYWJvdXQgY3JlYXRpbmcgdGhlDQo+ICdk
ZXZ0b29sJyBicmFuY2guIEl0IGp1c3Qgc2F5czoNCj4gDQo+IElORk86IFNvdXJjZSB0cmVlIGV4
dHJhY3RlZCB0byAvd2hlcmV2ZXINCj4gSU5GTzogUmVjaXBlIDxyZWNpcGU+IG5vdyBzZXQgdXAg
dG8gYnVpbGQgZnJvbSAvd2hlcmV2ZXINCj4gDQo+ID4gSXQgaXNuJ3QgdW5yZWFzb25hYmxlIHRv
IGhvbGQgb3VyIGxvY2FsIGNoYW5nZXMgb24gdGhlIGJhc2lzIHRoYXQgdGhlDQo+IHVzZXIgd2Fu
dHMNCj4gPiB0byB3cml0ZSB0aGVtIGJhY2sgaW50byB0aGUgcmVjaXBlIHNvIHRoZSB0b29sIGRv
ZXMgcmVhbGx5IG5lZWQgYSB3YXkgdG8NCj4gdHJhY2sNCj4gPiB0aGF0Lg0KPiA+DQo+ID4gSSB0
aGluayBVSSBwZW9wbGUgbG9va2luZyBhdCB0aGlzIGZyb20gdGhlIGJpZ2dlciBwZXJzcGVjdGl2
ZSB3b3VsZA0KPiBjb25zaWRlciB0aGUNCj4gPiBiZWhhdmlvdXIgY2hhbmdpbmcgZGVwZW5kaW5n
IG9uIGNvbnRleHQgdG8gYmUgY29uZnVzaW5nIGFuZCBwZXJoYXBzIHRoZQ0KPiByZWFsDQo+ID4g
aXNzdWUgaXMgd2UncmUgbm90IHRlbGxpbmcgdGhlIHVzZXIgd2hhdCBpcyBnb2luZyBvbiAocGVy
aGFwcyB3aXRoIHNvbWUNCj4gZGV0YWlsIG9uDQo+ID4gKndoeSogaW4gdGhlIGRvY3MgdG9vKT8N
Cj4gPg0KPiA+IEknbSBub3Qgd29ycmllZCBhYm91dCBicmVha2luZyBjb21wYXRpYmlsaXR5LCBJ
J20gd29ycmllZCBhYm91dCBtYWtpbmcNCj4gdGhlDQo+ID4gZXhwZXJpZW5jZSBpbmNvbnNpc3Rl
bnQuIEEgbmV3IG1hZ2ljIGNvbmZpZyBvcHRpb24gZG9lc24ndCByZWFsbHkgbWFrZQ0KPiBtZSBm
ZWVsDQo+ID4gdGhhdCBtdWNoIGhhcHBpZXIsIGl0IGp1c3QgZm9ya3Mgb3VyIFVJIGludG8gdHdv
IHN0cmVhbXMgbWFraW5nIHRoaW5ncw0KPiBnZW5lcmFsbHkNCj4gPiBtb3JlIGNvbmZ1c2luZyB0
byB1c2VycyA6KC4NCj4gDQo+IEZyb20gbXkgUE9WLCBpdCBraW5kIG9mIG1ha2VzIHNlbnNlIHRv
IGhhdmUgc2xpZ2h0bHkgZGlmZmVyZW50IFVJDQo+IGJlaGF2aW9ycywgc2luY2UgSSBzZWUgYXQg
bGVhc3QgdHdvIGRpZmZlcmVudCB0eXBlcyBvZiBkZXZ0b29sIHVzZXJzOg0KPiANCj4gMS4gTGF5
ZXIgbWFpbnRhaW5lcnMgKGxpa2UgbXlzZWxmKSB3aG8gY2FyZSBhYm91dCBjcmVhdGluZyBwYXRj
aGVzIGZvcg0KPiB1cHN0cmVhbSBzb2Z0d2FyZSB0aGF0IHdlIHByb2JhYmx5IGRvbid0IGNvbnRy
b2wuDQo+IDIuIERldmVsb3BlcnMgKG1vc3Qgb2YgbXkgY29sbGVhZ3Vlcykgd2hvIHVzZSAnZGV2
dG9vbCcgYXMgYSBjb252ZW5pZW5jZQ0KPiB0byB0ZXN0IGFuZCBkZXZlbG9wIGNoYW5nZXMgdG8g
b3VyIGNsb3NlZC1zb3VyY2UgY29tcG9uZW50cy4gVGhlc2UgYXJlIG91cg0KPiBBVVRPUkVWIHJl
Y2lwZXMuIFNvbWUgKG1vc3Q/KSBvZiB0aGVzZSB1c2VycyBwcm9iYWJseSBkb24ndCBrbm93IGFi
b3V0DQo+IGRldnRvb2wncyBwYXRjaGluZyBmdW5jdGlvbmFsaXR5LCBidXQgdGhhdCdzIGZpbmUg
c2luY2UgdGhleSBkb24ndCBuZWVkDQo+IGl0Lg0KPiANCj4gU28gdG8gbWUgaXQgbWFrZXMgc2Vu
c2UgdGhhdCB0aGUgVUkgbWlnaHQgYmUgYSBsaXR0bGUgZGlmZmVyZW50IGZvciB0aGVzZQ0KPiBj
YXNlcy4NCj4gDQo+IFRoYXQgYmVpbmcgc2FpZCwgSSB1bmRlcnN0YW5kIGlmIHdlIGRvbid0IHdh
bnQgdG8gZnJhY3R1cmUgdGhlIFVJLiBJJ20NCj4gcGVyZmVjdGx5IGhhcHB5IHRvIGNvbnRpbnVl
IG1vZGlmeWluZyBvdXIgZm9yayBvZiBwb2t5IGlmIHRoYXQncyB0aGUgY2FzZQ0KPiA6KS4NCj4g
DQo+ID4gQXMgd2VsbCBhcyBtYWtpbmcgZGV2dG9vbCBjbGVhcmx5IHRlbGwgdGhlIHVzZXIgd2hh
dCBpdCBpcyBkb2luZywgY291bGQNCj4gd2Ugc2V0IHVwDQo+ID4gdGhlIHJlbW90ZXMgaW4gdGhl
IGdpdCByZXBvcyBzbyB0aGF0IHB1c2hlcyBkaWQgdGhlIGV4cGVjdGVkIHRoaW5nDQo+IGluc3Rl
YWQgKGkuZS4NCj4gPiBtYXAgZGV2dG9vbCBiYWNrIHRvIG1hc3Rlci9tYWluL3doYXRldmVyKT8N
Cj4gDQo+IEkgdGhpbmsgdHJ5aW5nIHRvIGJlIGNyYWZ0eSB3aXRoIHJlbW90ZXMgaXMgZ29pbmcg
dG8gYmUgZXZlbiBtb3JlDQo+IGNvbmZ1c2luZyB0byB1c2Vycy4gV2hhdCBJIGNvdWxkICptYXli
ZSogc2VlIGRvaW5nIGlzIHRpbmtlcmluZyB3aXRoIHNvbWUNCj4gZ2l0IGhvb2tzIChodHRwczov
L2dpdC1zY20uY29tL2Jvb2svbXMvdjIvQ3VzdG9taXppbmctR2l0LUdpdC1Ib29rcykgdG8NCj4g
d2FybiBvciBudWRnZSB0aGUgdXNlciBzb21laG93LiBFdmVuIHRoYXQgSSBmZWFyIGlzIG5vdCB3
b3J0aCB0aGUNCj4gY29tcGxpY2F0aW9ucy4NCg0KSSB3b3VsZCBzdHJvbmdseSBhZHZpc2UgYWdh
aW5zdCBpbnZvbHZpbmcgaG9va3MuIEkganVzdCByZWNlbnRseSBtYW5hZ2VkIHRvIA0KZ2V0IHJp
ZCBvZiB0aGUgaG9vayB0aGF0IHdhcyBpbnZvbHZlZCBpbiBrZWVwaW5nIHRyYWNrIG9mIHRoZSBw
YXRjaCBuYW1lIA0Kd2hlbiBkZXZ0b29sIG1vZGlmeSBjcmVhdGVzIGEgY29tbWl0IGZyb20gYSBw
YXRjaCwgYW5kIEkgd291bGQgaGF0ZSB0byBzZWUgDQphIG5ldyB1c2FnZSBvZiBob29rcyBpbnRy
b2R1Y2VkLg0KDQo+ID4gQ2hlZXJzLA0KPiA+DQo+ID4gUmljaGFyZA0KDQovL1BldGVyDQoNCg==

