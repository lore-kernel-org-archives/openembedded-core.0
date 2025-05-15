Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9AA8C2D0CD
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 13:44:24 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com (AS8PR03CU001.outbound.protection.outlook.com [52.101.71.41])
 by mx.groups.io with SMTP id smtpd.web10.12931.1747316663216423808
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 06:44:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector1 header.b=wEcJEzay;
 spf=pass (domain: ericsson.com, ip: 52.101.71.41, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IDcy6OpEMqHgerthaglo14QOdL9YzafHlxEPKloK9erREQPlEPwNZcU1oKj7XmNxEf7deRxa7yEJ5hfLyOJ9QIc7iwNnu9f7sXblxg1etNMbx9Oxns8yBludI7tFsdeFZOmnm/CVbyWw7CUXdr9rX8yHu/Zd0pdpd+01nX/+SN4pKmGkWIlGYJaix4HExSxESWS6L7OKpKZHkEAaT+1ywMxUJ16K/TLVtqTcNW6HK+EaTxDZWdrc49isWaKpCzVozeE0NsRj2v7aI3BrBfPsgF2zgNcDnZG9BDrv9RlnteYBAFG/55o9uYiXHRcyAf0rWERbq91uRLtIraDemN9rjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=voBIJV7AWlEPyF2+IlrT5Q1iIqcqCKGofftAnsFckKc=;
 b=mVFwUkMVtMRV6wTf9towLA+5ywYHYqtke8shKUYdQ5TD42hvYleEewRuTPpWMHCkDfq77aVzYcbxGTG9KTAWvFGxlTsDb63rdZRmWW1mT0qvQhELpkULKVyemBu79MLpQBqqtwZ2/WRKFQuh9yJaQPluwEznOq/8wE0rzZh4eRG2y+AdxcRlKyKvY7lKfd0vw6EE0+/GbKV/1lTE6q0tyvAchdusKLGRZj5mzSswUZxm6u3x9PMZjLxdp+AayPVEcBBc8dhkGJ1YJkpjlJxfM0eXYguszFvjuHo1LW277I4SIUX6kflinIcqbugw5bUY/nofw1jkK33jzBLWY+PE1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=voBIJV7AWlEPyF2+IlrT5Q1iIqcqCKGofftAnsFckKc=;
 b=wEcJEzayFhuqVSrbi4Y5aVu3e65UoakeraTc5APOeRMOwWCw8i1a1WIs54WW3UiFkVQMtZl1rDL9nv7RZrLpO6m11tLVnpg8FXmh+OsxuFVlVN2aw0rozAPMm/22GMDIHaAOllaQCj2TPGRMvqyz5jtGi70a4Rkb3F6fRDCoRwvGuhLC0UOTFhYZ1lYb8iR/i8VaRrtCbLpELhmRZ5llfc+mWB9qh3Pbe7L/6/gFjbKEqSe6fHORdhbNa27HKazrAEalYT13jxzA/041wP/XjITdea8OJkfjzBYLH/ijkNozemTFfvfKhy7VgAitfcGYVXxwJ4JW/zLIuy+YCy9CHQ==
Received: from PR3PR07MB6666.eurprd07.prod.outlook.com (2603:10a6:102:61::16)
 by PR3PR07MB6762.eurprd07.prod.outlook.com (2603:10a6:102:72::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Thu, 15 May
 2025 13:44:19 +0000
Received: from PR3PR07MB6666.eurprd07.prod.outlook.com
 ([fe80::548a:adf1:280d:283b]) by PR3PR07MB6666.eurprd07.prod.outlook.com
 ([fe80::548a:adf1:280d:283b%7]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 13:44:19 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: Quentin Schulz <quentin.schulz@cherry.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Joshua Watt <JPEWhacker@gmail.com>, Peter Marko <peter.marko@siemens.com>
Subject: RE: [OE-core] [PATCH v4 1/3] spdx: add option to include only
 compiled sources
Thread-Topic: [OE-core] [PATCH v4 1/3] spdx: add option to include only
 compiled sources
Thread-Index: AQHbxNVCY7B1PC0uk0ynF6zYbWHdwbPTmyoAgAANXoCAAAmFgIAAANNQ
Date: Thu, 15 May 2025 13:44:19 +0000
Message-ID: 
 <PR3PR07MB66662659710253B1ED4F50E08A90A@PR3PR07MB6666.eurprd07.prod.outlook.com>
References: <20250514125706.495571-1-daniel.turull@ericsson.com>
 <20250514125706.495571-2-daniel.turull@ericsson.com>
 <07ef3a4c-265a-40d2-939b-d3843662df38@cherry.de>
 <PR3PR07MB666678F2C4E5BA67075D490D8A90A@PR3PR07MB6666.eurprd07.prod.outlook.com>
 <50889349-4a1c-4978-a4e2-b7bf1964b881@cherry.de>
In-Reply-To: <50889349-4a1c-4978-a4e2-b7bf1964b881@cherry.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PR3PR07MB6666:EE_|PR3PR07MB6762:EE_
x-ms-office365-filtering-correlation-id: 94babd2f-0a83-4e98-36e3-08dd93b697e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?MDhPdlIwMFR4ODRlaTVib0hBVmR3bWNXRzIwWmhOWW91WG0zVjFCSm9CN05q?=
 =?utf-8?B?Yi9oa1RiaHdhZlRVemx3c2Nya2ppQkFuejlwUnM2NXZSbHFBR1dkUjltOU4x?=
 =?utf-8?B?bVEwakh3U2FUY0QvSWxVQkJyMlMxaUhVTnZncW5aNmV1L3dNV1FYaGNVNk0x?=
 =?utf-8?B?ZnNEWGxLNld2R1FHelQ2U1F0b0lYSFVTVW54YllvOElkV3BHdENLQ1gxczlZ?=
 =?utf-8?B?WS94OGdJcjZpQzcvNUM1TFpvbFQ2c2t3ZmtwTlI2RURxU3dCaGN2b1ZHTVJP?=
 =?utf-8?B?ZWZmSVcwL3Z3d3NwTmZDc21sZ1FGazErZ0gvT01yK2djSndrRUhvNThnaHBJ?=
 =?utf-8?B?Wk5sdkVUYWV4L2ZzcStoZGpTVFN4ZmI2bzV2cWN4TkRQNXc4bEdKNS9CZGI1?=
 =?utf-8?B?a2pJRlZ1UzBSRFRKVURydC9xcXFxOGxYalpreXRrNVZKOStqVVZNdUI4dVJK?=
 =?utf-8?B?TUV4MFRJWUJXc2R0MmplQnBzUUptdld5MXlvTUsyaEhqUXVvOVBXNnhxWldp?=
 =?utf-8?B?bDVQcUNTM2gwNFk2ZEZoY1FyVXVrelVESWFuazc4dTdDOUkxRjVXMWltV1JW?=
 =?utf-8?B?Sm5VTFFBV3hobU4zWk1IcmhER20xUnJBbVJzTEhHeTBlNExjYXZWa0s2VThL?=
 =?utf-8?B?Q21raUxaREVLUlZseVIvMStnL2ZjNHZ4aytCeWltck9lZ0h1T09HbThtMzNy?=
 =?utf-8?B?TG16Vit6bVlkek1DNHlXbjg3SEszVHZvbW9hREVWNjBNNS90NlhIUi8rcEJo?=
 =?utf-8?B?aVlEaHdubzIwYVBiUjU3S1lRQXVzQ2dVVHdBNFZueCtiZll4RVgxSTZHVFJH?=
 =?utf-8?B?cXcya1loNFBJU0gxWEMxWHNXUU10ZFd0RTQzSDN3WWQwakpUVnJjQndKd3ZU?=
 =?utf-8?B?bHJFY3M5YnpUOERXQUJ6OGIwbjNVY001UHhLM3M5RzFyVHhFejkzQUg2azEz?=
 =?utf-8?B?MnpWUGRzam1aaFdOSmhyQkZFVTBtTi9GZXF1UzB0Q2ZTTnpsZ285ZUZ0U2xL?=
 =?utf-8?B?QTBXbUdsL0llajJYSU1qQ05aMW5mbVFLdVFjNFVtbzFhTjR5QlFIZ0hhTjBy?=
 =?utf-8?B?Q0QzaGppaFh3clhxL0R6bS9oMGtZR2RhS1dsU2ZzK2hpS3RkZ0RNdG9GMGlS?=
 =?utf-8?B?TUdnWTdxNnhyNmVNeVB0MHBNN2xrOUFMblZxaTYzamh3R256eWRBd0ZMS1pk?=
 =?utf-8?B?QlhGWlN4SDFCbUxONFduUVlLeHdKcGl2cUZRS05TVUk3Zk9aaVRkMjhITVdv?=
 =?utf-8?B?OXRQUWNNa0dyUWVDb0RKSnhnSm1aelhadXROY2tIeWdIZitZVThDSTE3SCto?=
 =?utf-8?B?b1o5Z0JWSkhRc2FPNWJTSWMxeERSSy9jRHZMSHNNWm11L0ljeTZjdHNRbC9t?=
 =?utf-8?B?akhSdVZvSTFSNEMvK0VnRlpGM0w5Y1lYM1UwL1VUUnhMbEFKUU40UHRoaldx?=
 =?utf-8?B?T0czeFZ5UE9POVV3ek94Y2FiTmtJL0FzTGE2ZDlGOTFoNW5KS0FnQXBSVi9Q?=
 =?utf-8?B?dXQrd1FwcXRubVl1WnF4d05xalROam1ISkZkUGhXMWNWNk5jeFY1SmM2MnZO?=
 =?utf-8?B?ZGVFMVpRQnMwVVUrKzRva1hobkdCclhKMTlYQkhWY1NGMzFEaFQzcklodG1y?=
 =?utf-8?B?RTFuNWdIYlVia3VuTE9HUUEzSXltVEp3SHdLZytjMW5FM284Q3RQWmJXaW8r?=
 =?utf-8?B?NG5UUUlDU2ZXT3dBT2tiZURqUEY0U1NYWDR5QUtadHlQQnl1eUZXRmw1VVdY?=
 =?utf-8?B?Wncvb2p3aEtJeU14NlRaZW92c1dVSlFVU05qaVEzN3gwR3NQWk16NmdqcWFL?=
 =?utf-8?B?aHd1a054clQwUHRNZGttNm9aSGc3ZEljWmdHWk5TQjM0a1NHaEpRc3BHMHZF?=
 =?utf-8?B?d0h1SDJKZzZSbVExdXE3R3JTd09iYTY0Uk4yUXJSbDVUZEtPbGQ4UFYvakEr?=
 =?utf-8?B?SUVQeGkwOXg4UDFnUGNodU5Za1JVSUVsek5Ya1pIZTFDT1BJaTZvbEtWYVJ3?=
 =?utf-8?Q?yMFPWvlTeTJsJrdPX7CBnyVriWpHpo=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR07MB6666.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cjNRL2UyWVJtS01lZFBDU0tIazhUdTdIKzF6WU93SG9UWC9FcURmZ25MT0VI?=
 =?utf-8?B?NXZlS1dHOXhCenBQa2Jnd1pnUzhDbjlUOHlYZHNaSU9vclRpU0Nid2J1UWl1?=
 =?utf-8?B?NjM5OGt0bmRuMnk4NDhUWndDUlNMOTNtYXhzeFVIQ3pxeE5rVHFRc2E4N3ph?=
 =?utf-8?B?bGFtWEovRVR2NUNVWmlJY1dnZlYwcHl6VUR2QTBpREd1L05MbVR3T2JnTHVv?=
 =?utf-8?B?RUNUQUdhUE1wcEN6cjZOZlp0Mmt4UFFtNGsxcmhmSGV4azVxSHhDemROa1Z5?=
 =?utf-8?B?L0Rxc24ycWMxZzJ4WFVuUXQ1Z2FTbnNEbFN3TjNGL2QwUk5ySXNUUnJVbFlF?=
 =?utf-8?B?enhTZjNyNTBsNGtwcE9ZYzAxaUdIanBHQ1QwRHdIc1BiMFpESlZxTEtoTnFn?=
 =?utf-8?B?djdmdXpKTW5jemdYcW9UUnpHckJtaUxwM0hqUjhqNitadEtiQ1RncnI3aU1G?=
 =?utf-8?B?and4RzJOMnVSb0FhT0VGY2JMajRKUGRYTDY4YkJBQ3llQVAyQzlVakRVcWkv?=
 =?utf-8?B?WWdXZHlxbTFjRGxLTjVEWXQ1VVRVbGhTZHN5VmZ6U2FWWHVoendKbnd1WnZp?=
 =?utf-8?B?UDBLL1NEUTlyVjJ3OTNrdDVBbm5Pd1R4Y0VnUDhFaXpQaGJmUDRvNlBTZzRG?=
 =?utf-8?B?QXJxR0xsc1ErNEpabVZ0cnF1QndpRi82bnpoSTBCbTNsRDA5Q0gvc1Zab1VE?=
 =?utf-8?B?RmtUY0djZDRxUjZxZlhUcVpINFNoamo2SlZBWFBmdFA5T041QTJVc0llelZk?=
 =?utf-8?B?aFIwUUVxc3lXNUdMNW42RVA5S25hME8wRkRmWVdtaU56VEp2QVhTOXNJdUFI?=
 =?utf-8?B?TUVnRFN3L09LODJPbWh6VVZ1a1hodTRxakZiSllKcUVRZ2Y0a1ZSdlZkMk5k?=
 =?utf-8?B?TzR4OHU1NnJIUUc2MlY4MmszUkF4S0pZTFpic3JobVY3WUtBdVN3dHJRZlQw?=
 =?utf-8?B?cDRVclJ2cjg2VEtxZmZhamwvZlAySlIrQ01jME00Szk3NGoxcFgzSFhhRmpt?=
 =?utf-8?B?Y0syeFNpUmk3QVlrRStPR3dubGJQRTQybm9rdVYyWjhDOEdnRmNGeDFTYzNR?=
 =?utf-8?B?ZkNRZGhDMHJ3cXlDOHNpRlRnc0FLM1BiMXZzY2ZwdnNmVG53SFFzcHNMTklS?=
 =?utf-8?B?RlJxdVRxaFhSeDlpSnppejRhRElLNFZiRno2Z1RnbFBqSVJ6SlB5U24xL3ZE?=
 =?utf-8?B?a2o3RGFXNDNsWENoenNzN3hlMUUyTFFSM1dEWEhpMm56UWpkREZPM2hJeG0w?=
 =?utf-8?B?aDAxZGpvU0E2M25heDZGcTNsakpNK21xUDgzOEFBcTRDd0k0Q1FEY2c3Z3E0?=
 =?utf-8?B?T0F5Y25ra1o2VEliVXlydVI5YVRHbFNadzdvd2o5aFBBQVBUd29tQ3c4RXAz?=
 =?utf-8?B?TlMyaENFbVZqQit4ZkZXL3NOUHFUMTVmdmJ6eEVDUE9kMGNUQzBBUEVXQVU5?=
 =?utf-8?B?U2xwdkovSE5nT1RCNWluZHVKZ0JUNDFmWkk0dW8rZGNkU2NkTmJ3YWtMd2Vo?=
 =?utf-8?B?VE00ZzliRDJlUVdFTXhSQlo1LzNTQXdBM3d4bzlNT3FpOGVDM0lkbkFOT0lZ?=
 =?utf-8?B?Q0pHVjIvUG1EN0IwNE1HcE5wOUdTQmpmS3hrN0RHOHlWWDAwQ1dxMzFYWjBR?=
 =?utf-8?B?RTdjRWZXd2JTMHVyMnNpVm1obzFTYjdjUm9waEttRjFtR2hUUTV4VWlPMnJz?=
 =?utf-8?B?NTB2QW93VW1JRlNFbTBNa05Yc2xpTEJKSlFZTTlJaVN6MHdIMkEzWmFJVC9W?=
 =?utf-8?B?ZmloMjBPYlRiLzVSaEQrbldZL2cwVklXSHA5cmdRRDRCdUQ5T0RMcHc0RUtu?=
 =?utf-8?B?cU04MURjWFNLWWg3Z3JYcitLZ1JLYkFQQ0J1SzZtQXJPby9laTZsdFgrN2xx?=
 =?utf-8?B?dVN0K28yUmJYOFMvWFdnaXRIbGtzT1NMMXFWQ0FKdEYrU3FEYVdXOG81NkFV?=
 =?utf-8?B?aHRTVktUdjc3UVovdUVIWUFWajUrLzduWXNpLzJNZHFDdkM3QmR2Y3NUa3hI?=
 =?utf-8?B?enBITGU2d3pWR0pSd1RVUGFISEl2eEV4dFBPM3lkeGZYblhuRDd6eWp3WGNG?=
 =?utf-8?B?R0NRU0d2V01aTWxtUnh5Nk45a0cwSmppb3ZGVjlQZ052Mm1DQ2QzSmNNOWtp?=
 =?utf-8?Q?hQL8VAjjxOt5Oyg5GEeYcNAxK?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3PR07MB6666.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94babd2f-0a83-4e98-36e3-08dd93b697e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2025 13:44:19.8115
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kt7rK/5IjL6HY9W7lBo4ByQMZqXLtEa2x8taPOnbeDI6GpRC8xPUCAu+uoNWnjsjsCYsKhUSt0SAjVoxz7UD0OX8wxLuHFsySSflH2+26A4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR07MB6762
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 13:44:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216679

SGkgUXVlbnRpbiwNClRoYW5rcy4gSSdsbCBkaWcgYSBiaXQgbW9yZSBmb3IgdGhlIGhlYWRlciBm
aWxlcyBpZiBJIGNhbiBtb2RpZnkgdGhlIDJuZCBwYXRjaCBpbiB0aGUgc2VyaWVzLiBbUEFUQ0gg
djQgMi8zXSBrZXJuZWw6IGFkZCBzdXBwb3J0IHRvIGV4dHJhY3QgY29tcGlsZWQgZmlsZXMNCg0K
QWJvdXQgb25seSBleGNsdWRpbmcgdGhlIGMgZmlsZXMsIHRoaXMgaXMgd2hhdCB0aGUgY3VycmVu
dCBjb2RlIGluIHNwZHggaXMgZG9pbmcgKHVubGVzcyBJIG1hZGUgYSBtaXN0YWtlKSwgYW55dGhp
bmcgb3RoZXIgdGhhbiBjIGZpbGUsIGl0IHJldHVybnMgYWx3YXlzIHRydWUgaW4gdGhlIGlzX2Nv
bXBpbGVkX3NvdXJjZSwgc28gaXQgaXMgaW5jbHVkZWQgaW4gdGhlIHNwZHguDQoNClByb2JhYmx5
IHdlIGNvdWxkIGxvb2sgYXQgdGhlIGZpbGUgdHlwZSB0aGF0IHdlIGhhdmUgaW4gdGhlIGxpc3Qs
IHNvIGl0IGNhbiBiZSBtb3JlIGR5bmFtaWMuDQoNCkknbGwgc2VuZCBhIG5ldyB2ZXJzaW9uIGlu
IGEgZmV3IGRheXMsIGluIGNhc2UgdGhlcmUgYXJlIG1vcmUgY29tbWVudHMuDQoNCkN1cnJlbnRs
eSB0aGVyZSBhcmUgMzk5IENWRXMgd2l0aCBoZWFkZXIgZmlsZXMgKC5oKSBhbmQgbm9uIHdpdGgg
cnVzdCBmaWxlICgucnMpIGluIHRoZSBkYXRhIGZyb20gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L3NlY3VyaXR5L3Z1bG5zLmdpdC8NCg0KQmVzdCByZWdhcmRzLA0KDQpEYW5p
ZWwNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUXVlbnRpbiBTY2h1bHog
PHF1ZW50aW4uc2NodWx6QGNoZXJyeS5kZT4NCj4gU2VudDogVGh1cnNkYXksIDE1IE1heSAyMDI1
IDE1OjMzDQo+IFRvOiBEYW5pZWwgVHVydWxsIDxkYW5pZWwudHVydWxsQGVyaWNzc29uLmNvbT47
IG9wZW5lbWJlZGRlZC0NCj4gY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IENjOiBKb3No
dWEgV2F0dCA8SlBFV2hhY2tlckBnbWFpbC5jb20+OyBQZXRlciBNYXJrbw0KPiA8cGV0ZXIubWFy
a29Ac2llbWVucy5jb20+DQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIHY0IDEvM10g
c3BkeDogYWRkIG9wdGlvbiB0byBpbmNsdWRlIG9ubHkgY29tcGlsZWQNCj4gc291cmNlcw0KPiAN
Cj4gSGkgRGFuaWVsLA0KPiANCj4gT24gNS8xNS8yNSAzOjEyIFBNLCBEYW5pZWwgVHVydWxsIHdy
b3RlOg0KPiA+IEhpIFF1ZW50aW4sDQo+ID4gVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suIFRoYXQn
cyBhIGdvb2QgcG9pbnQgZm9yIHRoZSBoZWFkZXIgZmlsZXMgYW5kDQo+ID4gdGhlIHJ1c3QgZmls
ZXMuIEknbGwgbmVlZCB0byBmaW5kIGEgYmV0dGVyIHdheSB0byBleHRyYWN0IHRoZW0sIHNpbmNl
DQo+ID4gc2NyaXB0cy9jbGFuZy10b29scy9nZW5fY29tcGlsZV9jb21tYW5kcy5weSBvbmx5IGV4
dHJhY3RzIHRoZSBjb21tYW5kcw0KPiA+IGFuZCBpbmNsdWRlcyBvbmx5IHRoZSBjIGZpbGVzLiBT
byB1bmxlc3Mgd2UgZG9uJ3QgaGF2ZSBiZXR0ZXIgaW5mbyBvbg0KPiA+IHRoZSBmaWxlcyB1c2Vk
LCB3ZSBzaG91bGQgbm90IGV4Y2x1ZGUgYW55IGhlYWRlciBmaWxlLiBEbyB5b3UNCj4gDQo+IEkg
d291bGQgdGhlbiBzdWdnZXN0IHRvIGluY2x1ZGUgYWxsIGZpbGVzIGJ5IGRlZmF1bHQgYW5kIG9u
bHkgZXhjbHVkZSBDIGZpbGVzIGlmIHRoZXkNCj4gZG8gbm90IGFwcGVhciBpbiB0aGUgb3V0cHV0
IG9mIHNjcmlwdHMvY2xhbmctdG9vbHMvZ2VuX2NvbXBpbGVfY29tbWFuZHMucHkgc28NCj4geW91
IGNvdmVyIGV2ZXJ5dGhpbmcgYW5kIGFsbG93bGlzdCBvbmx5IHRoaW5ncyB5b3Uga25vdyBhcmUg
c2FmZS4NCj4gDQo+IGtub3cgYW55IGJldHRlciBzY3JpcHQgdG8gZXh0cmFjdCB0aGUgY29tcGls
ZWQgZmlsZXMgZnJvbSB0aGUga2VybmVsPw0KPiA+DQo+IA0KPiBObyBjbHVlLCBzb3JyeS4NCj4g
DQo+ID4gVGhlIGN1cnJlbnQgY29kZSBpbiB0aGUgc3BkeCBjbGFzcyBpcyBzdXBwb3NlZCB0byBv
bmx5IGlnbm9yZSB0aGUgYyBmaWxlcyB0aGF0IGFyZQ0KPiBub3QgY29tcGlsZWQsIChzbyBiZWVu
IGNvbnNlcnZhdGl2ZSBvbiB3aGF0IHRvIHJlbW92ZSkgYnV0IHByb2JhYmx5IHRoZSBzY3JpcHQN
Cj4gdGhhdCBJIGhhdmUgaW4gW1BBVENIIHY0IDMvM10gaW1wcm92ZV9rZXJuZWxfY3ZlX3JlcG9y
dDogYWRkIHNjcmlwdCBmb3INCj4gcG9zdHByb2Nlc2luZyBvZiBrZXJuZWwgQ1ZFIGRhdGEuDQo+
ID4NCj4gPiBOZWVkcyB0byBiZSB1cGRhdGVkLCB0aGF0IGlmIHRoZSBDVkUgaXMgbm90IGluIGEg
YyBmaWxlIGlzIG5vdCBpZ25vcmVkLCB1bmxlc3Mgd2UNCj4gaGF2ZSB0aGUgaGVhZGVyIGZpbGVz
IGluIHRoZSBsaXN0IG9mIGNvbXBpbGVkIGZpbGVzLg0KPiA+DQo+IA0KPiBBbnl0aGluZyB0aGF0
IGlzIE5PVCBhIEMgZmlsZSBzaG91bGQgTk9UIGJlIGlnbm9yZWQgKGV4Y2VwdCBpZiB5b3UgaGF2
ZSBhIHRvb2wgdGhhdA0KPiBhbGxvd3MgdG8ga25vdyB3aGljaCBub24tQyBmaWxlcyBhcmUgY29t
cGlsZWQgaW4pLiBBbnl0aGluZyB5b3UgY2FuIGd1YXJhbnRlZSBpcw0KPiBuZXZlciBjb21waWxl
ZCBpbiwgdGhlbiB5b3UgY2FuIGlnbm9yZS4gRm9yIG5vdyBpdCBzZWVtcyB5b3UncmUgc2F5aW5n
DQo+IGdlbl9jb21waWxlX2NvbW1hbmRzLnB5IG9ubHkgcmV0dXJucyBDIGZpbGVzIHNvIHRoYXQn
cyBhbGwgd2UgY2FuIGZpbHRlciBvdXQuDQo+IA0KPiBDaGVlcnMsDQo+IFF1ZW50aW4NCg==

