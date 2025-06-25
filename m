Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1E20C77B7C
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 15:30:50 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.20])
 by mx.groups.io with SMTP id smtpd.web11.18442.1750865442502581347
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jun 2025 08:30:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector1 header.b=moCi3UFR;
 spf=pass (domain: ericsson.com, ip: 52.101.84.20, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZrkXyEL3/oeW+gw2eT+JYgjQ8ZPDBtb71PHtBrFUHi5M/KNA5HDhTv6s01CwCqkc2xLw1ejTA7UjC5XNdfQSsboELDJMKe7ax4AtnrvFS2Wkzn1sQ/Ksyv2A6u5pScnoD0DNgT0YvfVzmeSWbZ3qu+bt5SF+Bxq2qmHM4oZIydqYjnyv7Xa1n6flTZnuXAf1Ze4tBFqAt0/fGJ3uDvSvTfJzjooa0Au30A0sGTy1N6HLJ+OztsA1EBtvM22jy+q8mDLtyKKe01zp1jZPL0WIc1jyUA443RwD7LA3l2M7GD8oxqsg35YWxjePBlM6mMK2r+urYWlbZeVC4/1ZMxzSJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ESdca8sUygektGdsvn+Fs/+29VDK8QpEiAz6fHTsuhc=;
 b=O1xDT/0uCv+Q9MO/01IBSGnXXVUMgysz1W0eMX16IgbDWQqRuqODCCKdo6okus78IbplUkvglTXZLGmRg3Mx4U27DU2EI6Q7alhv82ALa3POj04TY3tbN6cMiZEcoj1ESRCweAv36x9J6gJMLY131AVF42mnDhnhZpVQzJP5seH4AmDzXutPUnp/3/nwCpJImVVGSGptNjRu7YImZ+gI9S/9fBWHgNnU071wWTubQ0nuEnX8s4Y1xvP7H3syYuV9CFZCqTRCkr3hLDSxUaGkZYsf1wORl7RIQxzF6Fka3pTXp2hgx0X6AmIvaS6L8ckDF8EibJfv/oOoSTWxWBi2qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ESdca8sUygektGdsvn+Fs/+29VDK8QpEiAz6fHTsuhc=;
 b=moCi3UFR3TdkX5+FGFsJx7eYXRJjx8pPHFeETh4mE96DXjeBQrwvqfHYpENeoI3pBLcRM9IDrpuNs7nHFE8j6iYPuDX2Dr4NvAhoPyg5aEKopUMma58TAoAx8Y2TWJvNPpmLyRW8gm/B6okDNj3brN06yJ3ZFATQeho/AJMm5gBCGWjZ0ceRwquN/LtlTmgNdbXbWOuLRpY0uriMtuhBy5tHttcQYtIhA2nne6TI2BZUZlQ3Npr/SE85OoudxdMfSspB3tXQNIWZLoZfuvJUl+gcy0m0HOREKei6jhCjmMq86YBeLs2QanJW1K6iMKvYQ4MnGcNA6YZ3vd0PlmrXbw==
Received: from PR3PR07MB6666.eurprd07.prod.outlook.com (2603:10a6:102:61::16)
 by FRWPR07MB10623.eurprd07.prod.outlook.com (2603:10a6:d10:187::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Wed, 25 Jun
 2025 15:30:39 +0000
Received: from PR3PR07MB6666.eurprd07.prod.outlook.com
 ([fe80::548a:adf1:280d:283b]) by PR3PR07MB6666.eurprd07.prod.outlook.com
 ([fe80::548a:adf1:280d:283b%4]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 15:30:38 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: Steve Sakoman <steve@sakoman.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Mathieu Dubois-Briand
	<mathieu.dubois-briand@bootlin.com>, Yocto TSC <tsc@lists.yoctoproject.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: RE: [OE-core] [scarthgap][PATCH 1/2] package: export debugsources in
 PKGDESTWORK as json
Thread-Topic: [OE-core] [scarthgap][PATCH 1/2] package: export debugsources in
 PKGDESTWORK as json
Thread-Index: AQHb4PbW2NffJtzwFESr9CHHwmXEZ7QKml2AgAawnQCAAr5YgIAAAJ9Q
Date: Wed, 25 Jun 2025 15:30:38 +0000
Message-ID: 
 <PR3PR07MB66668384E88F8B08A86100448A7BA@PR3PR07MB6666.eurprd07.prod.outlook.com>
References: <20250619084736.1940747-1-daniel.turull@ericsson.com>
 <CAOSpxdaq52nk4PmHEjnm3P2yc4EPh+A_JEAgewbLHeQJtgMotg@mail.gmail.com>
 <a041e18e26dc44c399aa86b6c8ecef15eb3dcbaa.camel@linuxfoundation.org>
 <CAOSpxdayvq2SLFEcONDG_QFvS6ma29u-oBgHO-3aWDJQczmZ2A@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdayvq2SLFEcONDG_QFvS6ma29u-oBgHO-3aWDJQczmZ2A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PR3PR07MB6666:EE_|FRWPR07MB10623:EE_
x-ms-office365-filtering-correlation-id: c99ac913-c8d6-4e76-be9f-08ddb3fd3d0a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?TnBSdkhTN21vZjQ1THRXUXFTVjhQTHNyWmJkRFJ2NHFhaDhJU3dLd0o5K3Jq?=
 =?utf-8?B?SEtkRDV1c2M4bTNGU0xjL3pqdTc0WVJsTjhQYlRZUDdKNVdrR1czQTA1dVl0?=
 =?utf-8?B?dzltb0NsbUNLZ2dReFJaNVRzM1IzSHdES3BkUjNVWGNML2FMbkxYSXloU0hy?=
 =?utf-8?B?dEZreGswOWhSRTM4T3JRTjNhek11NTQ5bEZNVmE1Q1ZpcWZsNSs5aU1WekVW?=
 =?utf-8?B?aFl2TGtzL0kwMWlrRUpUS3NjNG1uTVVHWUhaUldtSGNMOXdkOVZBaGhXdUE5?=
 =?utf-8?B?MnpoVUlTMFRGYUx2N3EySHY5TWdGeVZWTFJyQkN5dmR4NnlzSEhTZzNrOGlP?=
 =?utf-8?B?ZkFUZHY4TnkveHpTSm1saGlLVGMwTUdBTER0K1YwRjBOL0ljRXI1VlN0R3lP?=
 =?utf-8?B?QThFSWtZSkZtWkVXczk3bEc2a05NWDJzSkdhT1JwVk5tN2tuZkUwYkNua3pC?=
 =?utf-8?B?ekVxdEhGbWhyekFWeWxuT0JUSEJKUnc1eVZyOHhjNER2eFVWKzMvelA1TEw2?=
 =?utf-8?B?TVAreVhVTzB2WVlGL0FHWGx2VXpJRFVhenVERDZla3MvY0RVa2lJQ1NWbHAv?=
 =?utf-8?B?U1NVL0R0SWZXd3YzSXY3OWViK05nM2VpVkliVXA5cS9adkpYQWtMVE81VHcx?=
 =?utf-8?B?NHFxYzNzUitpN2N4UFVFOThKaW1IU2o1Q2JkRU8rdE5SYVRQSUtqMWtmb3o1?=
 =?utf-8?B?dTdwdE5jQ0NTSnFKWklybVkzVldZWmUrUzZqalpUaytONlBrNktLYXlpSnAw?=
 =?utf-8?B?YnRhcGRzbTdYWXI3cGt4RGtSQ2VidlVSOUpYd2JmL2trbkRZdmFCczRtU3pG?=
 =?utf-8?B?djRocWJDKzV1aERJYzljTk81SXhpcnlrSndpdHc4OE1UQmFWTldyeXdWZTha?=
 =?utf-8?B?bEIrWm4wTzhuUFJtbzFjSjFnYVhpU2ZxVk5TMVhiTXB6WUFKNC9nemRlQmNr?=
 =?utf-8?B?dGE3SXRvbVlGdk9jRGV3U3Q1dVFHYzJSU2V2YTBZL2h1THlxWXR5NGN4OGhv?=
 =?utf-8?B?Q0p6bFkvTzVPb1pScDI1NDlJdFBDUjVBK0QwajhnQVlXampxUWZQemM1ZXZP?=
 =?utf-8?B?ODFQbEYwSGR5ODBQci9qS3dBaEVVVW9zd2RiMytuQkxNaTE4SlVUUEJxQlNu?=
 =?utf-8?B?Z3dxQXZXYnpWNytFUTI4bWR1bjNodDNJM3JKb09SYVgrMk9xOWlHTTNPTitS?=
 =?utf-8?B?Wk1selRyQjNVa2R6SWhnak5PZ3NqY3R0Ulg2b3I0S1BQeGU0WlJ5NGRvdDA4?=
 =?utf-8?B?WmtGOFErM1VhNElJT0tRdU1WdncrcThxS0VWZEZ2SDN2dzJIbXpzMUY1SFpi?=
 =?utf-8?B?Tlh3Tm1sWFFFc3Y0dGdISjFvd1dMNEZ0Q2RULzN6amV0dXhXUEE4SURiY21x?=
 =?utf-8?B?UWpuaXFGTTRoMWhaWEdidnRQZS82eXd6ZERzeDMzcTVrSHpscjNGZHFOR1di?=
 =?utf-8?B?QnZXNkprTFgweU1DSTlEVTllVkEzaU5Wc2dUUTlUYk5sU0xXMUEyVjR4UWN5?=
 =?utf-8?B?dytmTWxLZ3JSR2JZVE5mbjJuKy9QTVdrZWF4VmtoQ3BabVREeENDQXNUMVd3?=
 =?utf-8?B?dFVidU9pMnd5Z3QwTjIrb3o4ak10RmNkeXY4eVJ1QlFvRGNuZmlsQnBRMkt0?=
 =?utf-8?B?eXh2bitWcUljRUFpdWMrZExrZVhuZ2NtRFFlMTF4bkJQV1RPRTJtMkJmMVdC?=
 =?utf-8?B?Skg4M3NrSTZiNnZqc2ZDdFhCbE5oZk5QcVNoVGdSVysrTlFSTWdQLzRNNzQ1?=
 =?utf-8?B?cG43VUc2eit2VHpFS01zVkpnQmpCUWlPYzNZS1QvM2s4WVcyWWg3TFlOOEht?=
 =?utf-8?B?TWF2V0ZrNG5XTDlvZWZnOG52WWQrYjFyNXhsR1NJNi9pT0hkUEVaOVRpRmd4?=
 =?utf-8?B?WWFwVTlIVEE3MERvS2MwN1pTUlhxdmR6U0FRcUUxMVZZaWhqOFkxajQrOTcy?=
 =?utf-8?B?djUxRkYvZ2VIN1FyWTkxOHdqRElIeG1CczloanB0Ti9hMVRHaEk1Y2NnLyti?=
 =?utf-8?B?UGVFUDlLalN3PT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR07MB6666.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?c25lQlhUMmh5aFN0VWpldEZJZzVsVnFad3B1bXNDWXJuU3BYRDVCZU1MbTVN?=
 =?utf-8?B?NTVqbUFnczViRXBxdUx0S01ZZzhRMXRVSzJqV0JQWWgyY1lONEcxQlRBNVFn?=
 =?utf-8?B?U1dnUGNpWVEvVXE0YTVCNmpRUXppeEl2OWpzSTVJRmZRTzFSbFlDcUQzbGVK?=
 =?utf-8?B?RFFoZjJ5N2szN1NvVGpoUzBMV0ZvbmE5bjRUNXhtOGpiWEE5Z2EwVi83M2hn?=
 =?utf-8?B?dGJJTEE3RFphL2hub2x2QmFlY2dHR2hucVJXYStlTlRaYisxRXlWVWNXKzhq?=
 =?utf-8?B?UEV5UzRvblpRazFmRWh1cjRjQUJiWGFkZUQzc1cxd0gxVWQ0MDZ3QS93TnNG?=
 =?utf-8?B?ZTRucmQ3MStDeFMxWTVvRGNIelhKYzVrYlkwQjZoak5wdkZHdFREcUtGL09V?=
 =?utf-8?B?V1I2TTlLVGlmbDhsdUdBR3JTSU9hUlZ4OGs2WERaN3QzU0ZzQStWWmp2ZGMx?=
 =?utf-8?B?bVFEZzhNYnhqdVdodktuZS9wdE8zMFlWenBjNElTTW1HUUJTWVlERUhINHIw?=
 =?utf-8?B?QW9DM21OUnNKY243blppc2x6WDRiYjFYNlorankzeFJzdEFxNjdWS2I2VVkr?=
 =?utf-8?B?eDREQXNHRHRzY1VHVU5ERU1YZnk2Rjd5NzF5N0g1c09NcE9DbkFDMmtuQ1JU?=
 =?utf-8?B?ZWFMTVlpZzB2V01QN3g0azd3MlNVb3JYV3RrWlBQM1hiaXh1c0lEa3FKRk1E?=
 =?utf-8?B?RzNDOWx5dGkrbVBYZFB4UmIzazQ4R0xaNitSSWUweFNrU3NBVm96cHBTVktR?=
 =?utf-8?B?SDY2ckhNVm9wWGdJeTBjS2xjVmNFbmphbHdSdy9FWE5CNG1rcTk5Nmozbm4x?=
 =?utf-8?B?MFFQZmNaN3JzczNEVUc2K2xXcW9wakQxZUg2Rm5ub0dqNmVPNnBKckltR3RE?=
 =?utf-8?B?UENJN0VpeDI2a2RWU2RqdWxua2NiQU5EME96TVlneWFGRk52YmVQaVpxVURl?=
 =?utf-8?B?VWpXWk5QTkJNN3JMSTMwdTh6YTh0Yk5kbEJLMTZ6ZGtsdmpacTNVL1VuemFN?=
 =?utf-8?B?UlR6ZkxBL0E3bENydDYxSlJhUTN1OFAwYnRlY1ZmVEVBejUwanRNb1lmbjlH?=
 =?utf-8?B?L3N6UmJWamcrTzc5dHZmS0cwRGQrOGgxV2FOVDRLeEFXU3FGbmJRdzBTSlhT?=
 =?utf-8?B?cWxkenJ0MUdwd0JIVVpGZ0JDNnozUmVWSHVMUnlMMDY5NU5ncDJEeVR6MHJ4?=
 =?utf-8?B?bnhuQ25HQkd6UE8wOG42djYvNXJ2VGJ0U3N0eHNVaDBOR2NWU0QreUttOEVx?=
 =?utf-8?B?aWlYK0h6SkUxTVpIZE1sd3ord09VU2tPZ3liUGJxcUNFMXFPbEpzZWlXNXV1?=
 =?utf-8?B?ODFPUDYxRlR6a0ZscmFqK0s1MjU2UXY2VHkyUmJ5NEIwYW4vSS9qckU2N3VN?=
 =?utf-8?B?VFUwRHkxL3BuS1FsZ0JqRFQvbXlSVGtTMnR4NUNScmRmRTg3ODI0cTAvNVBS?=
 =?utf-8?B?ck5oOWNLdmU2T0NoanNEdzE1U1RXb0dsY0lWdjBCdUxoUHY3VXZudG80cFdL?=
 =?utf-8?B?dXFnMWFpQUpWV0dDcHV2Z0s4bUhIckt6eVJmYTBlZVpHSW1aZjRRYUUva3FQ?=
 =?utf-8?B?NDdjZDZqVDM0ME5GOHZoenBabmhFTUhuSGxtSkRZWFhmd0wySngvRGxKUmZN?=
 =?utf-8?B?S1grclFER2RJYzZ4NUtmd1h1SktFMlZ6Tng2amVVTHV0aHc2UnR6cThiZEJN?=
 =?utf-8?B?WWtWdmpTS0VzUVdDMzdhWlBhOFBYTk96d0Fuejh3WE5rZnZLNXFCNVI3VmpN?=
 =?utf-8?B?STE3VXdGWTlwVnBjL1ZhLzE1V0lGd3JZb0RpYzdJTjdhSkE5S0UyUW5Rb0k2?=
 =?utf-8?B?VGRiaUFZclZUZjRudHgveWZSWlBhUGpFLy9XbXduREdnVER5d0RXYXJ3V2ky?=
 =?utf-8?B?TlYrQmxXVzFtWExrZWF3Zi9JNHRjaTV5WldKSmxXOFRTem9QNVRKb1dtY0FF?=
 =?utf-8?B?K0VCRitDU2JkdU51c0ZsWTZTRXdKS2RNMkVKQUEyV2x3S0ttcjRqd3VEMzMw?=
 =?utf-8?B?TlBUVHdlZ3A4MUxRdkljRXJrM25kMUtmMHlvVitpNiszWndJK1pyWnRUTGM0?=
 =?utf-8?B?OEl4OHhxdG5FSnhlRlYwN0FpRjN4VGIxUGtoV2E2NDhOTUhnRlB0RC84dWx2?=
 =?utf-8?Q?oWg3uQwYPdgJD9i+4ZkOOjdBc?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3PR07MB6666.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c99ac913-c8d6-4e76-be9f-08ddb3fd3d0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 15:30:38.8647
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KixtegzjS6GmZQeh0ik5m1P/2bTfP/dQ6xL+/JQJH4IelzChIViGaD4v3ckpbrND0IWkKK5m+3qYTCchNZT37w3kGtuc7EwJCQLVwLaQ7PQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR07MB10623
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 15:30:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219325

T2suDQpJJ2xsIHRha2UgYSBsb29rIGFuZCBzZWUgd2hhdCBjaGFuZ2VkIGZyb20gc2NhcnRoZ2Fw
IHRvIG1hc3Rlci4gSSdsbCByZXNlbmQgdGhlIHBhdGNoIHdoZW4gaXQgaXMgZml4ZWQuIEknbGwg
dGVzdCB3aXRoIHRoZSBvZS1zZWxmdGVzdA0KDQpEYW5pZWwNCg0KPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGV2ZSBTYWtvbWFuIDxzdGV2ZUBzYWtvbWFuLmNvbT4NCj4g
U2VudDogV2VkbmVzZGF5LCAyNSBKdW5lIDIwMjUgMTc6MjcNCj4gVG86IERhbmllbCBUdXJ1bGwg
PGRhbmllbC50dXJ1bGxAZXJpY3Nzb24uY29tPg0KPiBDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZzsgTWF0aGlldSBEdWJvaXMtQnJpYW5kDQo+IDxtYXRoaWV1LmR1
Ym9pcy1icmlhbmRAYm9vdGxpbi5jb20+OyBZb2N0byBUU0MNCj4gPHRzY0BsaXN0cy55b2N0b3By
b2plY3Qub3JnPjsgUmljaGFyZCBQdXJkaWUNCj4gPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRh
dGlvbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW3NjYXJ0aGdhcF1bUEFUQ0ggMS8y
XSBwYWNrYWdlOiBleHBvcnQgZGVidWdzb3VyY2VzDQo+IGluIFBLR0RFU1RXT1JLIGFzIGpzb24N
Cj4gDQo+IE9uIE1vbiwgSnVuIDIzLCAyMDI1IGF0IDI6MzPigK9QTSBSaWNoYXJkIFB1cmRpZQ0K
PiA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6DQo+ID4NCj4gPiBP
biBUaHUsIDIwMjUtMDYtMTkgYXQgMDg6MjMgLTA3MDAsIFN0ZXZlIFNha29tYW4gd3JvdGU6DQo+
ID4gPiBTaW5jZSB0aGlzIGlzIGEgZmVhdHVyZSBhZGRpdGlvbiB0aGUgVFNDIHdpbGwgbmVlZCB0
byBhcHByb3ZlIGl0DQo+ID4gPiBiZWZvcmUgSSBjYW4gdGFrZSB0aGlzIGJhY2twb3J0Lg0KPiA+
ID4NCj4gPiA+IEkndmUgY29waWVkIHRoZSBUU0Mgc28gdGhleSBjYW4gYWRkIHRoaXMgdG8gdGhl
IGFnZW5kYSBmb3IgdGhlaXINCj4gPiA+IG5leHQgbWVldGluZy4NCj4gPg0KPiA+IFRoZSBUU0Mg
ZGlzY3Vzc2VkIHRoaXMgdG9kYXkuIFRoZSBjaGFuZ2UgYWRkcyBhIHNpbmdsZSBkYXRhIGZpbGUg
dG8NCj4gPiBwYWNrYWdlZGF0YSBiYXNlZCBvbiBleGlzdGluZyBpbmZvcm1hdGlvbiB3ZSBhbHJl
YWR5IGNhbGN1bGF0ZSBkdXJpbmcNCj4gPiB0aGUgYnVpbGQgc28gdGhlIHBvdGVudGlhbCByaXNr
IGFuZCBpbXBhY3Qgb24gZXhpc3RpbmcgdXNlcnMgaXMgbG93Lg0KPiA+DQo+ID4gV2hpbHN0IHRo
aXMgaXMgYSBmZWF0dXJlIGNoYW5nZSwgdGhlIHVzZXMgZm9yIHNlY3VyaXR5IGFuZCBoYW5kbGlu
Zw0KPiA+IENWRXMgYXJlIGV4dHJlbWVseSB1c2VmdWwgc28gb24gYmFsYW5jZSB0aGUgVFNDIHRo
aW5rcyB0aGlzIGNhbiBiZQ0KPiA+IG1lcmdlZC4NCj4gDQo+IFVuZm9ydHVuYXRlbHkgdGhpcyBw
YXRjaCBpcyBjYXVzaW5nIG9lLXNlbGZ0ZXN0IGZhaWx1cmVzIG9uIHRoZSBhdXRvYnVpbGRlciwN
Cj4gaGVyZSdzIGEgc2FtcGxlIGxvZzoNCj4gDQo+IGh0dHBzOi8vZXVyMDIuc2FmZWxpbmtzLnBy
b3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmVycm9ycy4NCj4geW9jdG9w
cm9qZWN0Lm9yZyUyRkVycm9ycyUyRkRldGFpbHMlMkY4NjIzODglMkYmZGF0YT0wNSU3QzAyJTdD
ZGFuDQo+IGllbC50dXJ1bGwlNDBlcmljc3Nvbi5jb20lN0NkZWZhOWU2ZGVlMmU0ZDdiMTc5MzA4
ZGRiM2ZjYzlmZCU3QzkyZTgNCj4gNGNlYmZiZmQ0N2FiYmU1MjA4MGM2Yjg3OTUzZiU3QzAlN0Mw
JTdDNjM4ODY0NjIwNDcyOTg5NTY0JTdDVW4NCj4ga25vd24lN0NUV0ZwYkdac2IzZDhleUpGYlhC
MGVVMWhjR2tpT25SeWRXVXNJbFlpT2lJd0xqQXVNREF3DQo+IE1DSXNJbEFpT2lKWGFXNHpNaUlz
SWtGT0lqb2lUV0ZwYkNJc0lsZFVJam95ZlElM0QlM0QlN0MwJTdDJTdDJTdDDQo+ICZzZGF0YT15
ZmxvSnhxUWw4cnFxQlN3dUZaZGxrNjJQZkF4MFJEJTJCeWZJTFZmbVRnSTglM0QmcmVzZXJ2ZWQ9
MA0KPiANCj4gVGhpcyB3aWxsIG5lZWQgdG8gYmUgYWRkcmVzc2VkIGJlZm9yZSBJIGNhbiBtZXJn
ZS4NCj4gDQo+IFRoYW5rcywNCj4gDQo+IFN0ZXZlDQo=

