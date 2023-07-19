Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61BFAEB64DA
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 12:03:16 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.48])
 by mx.groups.io with SMTP id smtpd.web10.11961.1689768193532048004
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jul 2023 05:03:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=K+U0wZHC;
 spf=pass (domain: siemens.com, ip: 40.107.22.48, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hhpGT4FGQGJCLKmPVyVGvhaqpsfpbC1fJFfcH2vqTLNYd7vBS69SU0t/tqHwBRi/vtq5lbCR+aNxTfOqtLWJwA4kO4KJ13iIKqTWsWotvNmze6CWWN7nZmo2VOyDlvhfAJjdfWM9cblpIbkoQCEeNgwOr/3wndlPUY+3zt2ZgcrJGZLNoVTbFIwbJnI43AkrA8l0Rg5we+FFc8wKzkr1iRCB6FbZ2iw5tjAk2pm5AyCUVp3NFgr6lNjLbDgAmPDnq6mwy/He5tJOkK/hQSYGxG9HxdgKqWimo0ATnNJVI5pHTX+isN4EhhX3NmIKHW2+kXtVNon/azE4kkwrO2gm0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ZeZ4ClhXMj7bIZBQ9xCbKPHLnHMI0AeGemGhz7ovGo=;
 b=jr1ckqzWvPaqZBGSXaBmMFXJ4uB+Naata8TcPvKLTd/Q8Fnw9OyZpeikegBRRtxX7AGma7y4CGks0oqw8Xru45AH14scSKDj/C6Nbm+WIxeNny9dWakIJDq31xsUu2xDSM6kfuvWGD6KrqD4WR7ScsbtyNVf028gq6LkWG0LISeBQl/xU5hPSBU9Ws1E03/Vt8Zo3oui1GYb5gbBMApOLenziaIu8wymBx9T98zYVkuytD9dvlilq0cZ/97oVKP3aV7gJpZGXqYc7Cyz5HVDQLicW1ZMvjbc0QgV3Zn5HsYwtZF07Y0TQlm1Vh/GGKiADv4eNq6woqtlnoHlv+nHDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ZeZ4ClhXMj7bIZBQ9xCbKPHLnHMI0AeGemGhz7ovGo=;
 b=K+U0wZHCZrUB4i2KTpZDYS89sNju+btFEy7z5z61o0F5wDTTI80ntW1YNPmFRidGxSyU2PQnNsE5g+i2PHdBJnP7cqzFrU+heBiGX1LVWYkIOwP57YpHcyWAU6DQv/XALCYu24zO2yqkowle5WlHEOhkC6tdLNjRVifl7EPEUfhNL41T1o2wJmH8wOhjaZdcVkwihB+jHaepCG+P7rU6s5LM8n7YUC5V2rU1dyVNZR9IojCACeC8fvsNUYnHN/ExRN3Ss0pLm2nLYAgbNMKc5BX64B5Ombhm3Y1KU3tk3sHZDNNAyMbgHhgQ2vXnIGRvnlBzZLJb2+faB+MB5xcT5g==
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by VI1PR10MB7715.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:1cf::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Wed, 19 Jul
 2023 12:03:10 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::aca4:33f1:8cc0:ba0e]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::aca4:33f1:8cc0:ba0e%3]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 12:03:10 +0000
From: "Valek, Andrej" <andrej.valek@siemens.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"Ross.Burton@arm.com" <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v9 0/3] CVE-check handling
Thread-Topic: [OE-core][PATCH v9 0/3] CVE-check handling
Thread-Index: AQHZpcQdgpu78byhg0qChnnStUlCU6/BC4YAgAAH3YCAAAXiAIAADSqA
Date: Wed, 19 Jul 2023 12:03:10 +0000
Message-ID: <af1666bc975eeb52cfe4058b40e331c73c87421b.camel@siemens.com>
References: <20230519081850.82586-1-andrej.valek@siemens.com>
	 <20230623111459.97933-2-andrej.valek@siemens.com>
	 <38950e1b3bd475c131e7e4b5db03d9d170c8d690.camel@siemens.com>
	 <ca87e264250af926f1cf3a2463e3213436c515bd.camel@linuxfoundation.org>
	 <1B3C5AD0-9492-4319-9409-DFB59F587E9F@arm.com>
In-Reply-To: <1B3C5AD0-9492-4319-9409-DFB59F587E9F@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 (3.46.4-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR10MB3977:EE_|VI1PR10MB7715:EE_
x-ms-office365-filtering-correlation-id: 81c92f69-0922-4ef7-1d27-08db88501ef3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 FjmXduftLaDx1uAjxPrnwfL4jIMOVsZp1mTWxIzeE4P8cuyGwQUyLPkbgjSw7zlwaCj7KcGFX4SxLnDozk2Eex2LYRAFBJZnOzquJCQfqvSNSx93QIjpBSL4h59wab8NHw4N4U1T0ilzd77tksHOlOL9puv1425ggGoOf8pmFu5EXM+0tGsR2iYZIFkQ4V9IKP7FLvXjPZEcXm2rgd2H+IM0DC34XVsuduQ18KguCVZMVzQxJGl4Vcpu5/mt4sc3fKEKZYaS+WfFt1lwI0dPK9vkvtyr27ZC1UVO7qEYwhMETk6BCg2708agKflji60YVvu3sbQwMYGFncdk2DSkO1GGsvfQNZX7qsIM6a8Sdj2AVjQ02b0YssdoTdAThHr5hNGz6fnSZTK6L9Xjw9dQWNL7ItS6Toq8SoGWZcl1it74JxD3anwUXMQutIpCWJW82/7hpfNtNGl2qPLQFQVp4Kw2XZfI0RiV+n/TLa7OsnwBcRL7OwGVlqxTrTLzLGtmtH0RInZ+Pb/A6RbAwxgxdEWnh2pAJW6jKCmt8SeUaI5hol8bN2uZtLWCinuR/HrHhCHqxhIqNLxKDATOvB+NpUIz+jtbrEHQeHKjwKcR2rzSlwMR1I4bh1lbtCGNn8YU
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(376002)(366004)(396003)(136003)(451199021)(4326008)(6486002)(91956017)(71200400001)(478600001)(110136005)(2616005)(38070700005)(86362001)(4744005)(2906002)(76116006)(6506007)(186003)(6512007)(53546011)(26005)(316002)(38100700002)(122000001)(82960400001)(66476007)(64756008)(41300700001)(66556008)(66946007)(66446008)(36756003)(8676002)(5660300002)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?R045cElDbVBOTW1RU0FWQzZudlFrTGtvbEpsY2YrTmFuQkROOStpbS94OU8r?=
 =?utf-8?B?MEl5TzZXQ21RY1p2QnZnRVdiUlhnTXFPc0h2TkRKYnFsRXRNZlhPSHB3bHlG?=
 =?utf-8?B?L0RjTVhNbkx6YThHdndTdk05NGdJYUlqczhDYThNNThTY2N0NlhObjcwRVRS?=
 =?utf-8?B?cGhBRHIrcFFVbUo5QURadW85VXlGMFd1MExMaVlxa2F6b1VZMTdDTXBZU21u?=
 =?utf-8?B?TlgrUTNXL0FQNzhnWFY3ZVQ1NVRPOTIrdFpsd3Z0SUNHeTNIei9raTJTTUk3?=
 =?utf-8?B?Z2ZOZlVkck1MUTRIOUZFNGJVM3FkRVhPaTZPcFVKZTdrY044QnVZOWxzWHEr?=
 =?utf-8?B?Q2FZYVcxcFdIRXU2K0ExQ2NZOFB0S1QvRXhiVmQvbXQ3Ni9aU3A4bXpiWlpn?=
 =?utf-8?B?dGtkaDRkM2h3TFFyWTVsL2l4ZnF4eE91TmdpTmxuT3ozVzhlak5qZ3h6MnIy?=
 =?utf-8?B?My9aWk9jcjhnT3RJdnBxOHZhd2xqWWRxdmwwRm8yUnVzVWZnVkk5Ykx6RFQ5?=
 =?utf-8?B?eGRrdGVQajA3dVdGNWwvUHgvWHNXMWRya2prRXU2MWxXazhnWm9sdUZCUmFk?=
 =?utf-8?B?cXJvVUU5dlBueGp3S29nRXN2SzZGYncrRk02QlJhQkg5WnBMUlhrZWhCbUti?=
 =?utf-8?B?SjdubGVoNmh4bXcvbkc5T2c4Y29HTi9mdG0zMjQ1emh3T3BVeHJwa3RTWWRD?=
 =?utf-8?B?UzhzaEJoK1cvQ0Q4MnFBMWFKWXRFWUFuNEFqVHM0a2lMbWUvZUU2VG1UVkps?=
 =?utf-8?B?cDVrMWxiYkNuSVpjRXIxbFlBSE12b1R5cjR3cWxhSGExRnVlSHE1eVI4OVlP?=
 =?utf-8?B?Nks5NFc0ZW5WanpjYWZiYVMwOXVRemxvaXhHb3VlS1ZnZ2hDOU8rMUJFRHky?=
 =?utf-8?B?M1NWUVVDL2tqME05QkpLZE9SaCtiWDZ2TkJvY3JzejBYNldLZGVQNkRGbXRi?=
 =?utf-8?B?azJTY1lUR1VXKy9DSmJEaHBRTHl0MjBDejVwbFBOODh0RzJFR1pRazJrRno2?=
 =?utf-8?B?T1R6NURoWkJKUy9uRlV0RGZKcFA3ajdnTnE4U2VSV0NXQlVIREtXVjd1U3Uz?=
 =?utf-8?B?MkZRVHZodkRCRVJmZVo1UTUvZXdNUzNKV2ZYTjg4dTdFRGhVWVZXUkZKdzQ0?=
 =?utf-8?B?Wng0WENoU2M2RVRoNkpJQUY4OHFKanJ0Z2pNdUVFZVVjNmpRRDc3MnpqQXdQ?=
 =?utf-8?B?TGdNUFl3V1RhVmMvNGExY0EvWkh2R0ZPL041emV3TEtCVjcwVFFHVHllaWZp?=
 =?utf-8?B?V0RodXpMRGlwOXdCQTJwNVdkVEhPUEp6SEhxdlZKWEZXYVY3eFBDQnh4L2hO?=
 =?utf-8?B?Wmw2eVVidFVTSEVxYWo4UjhnTTZQSHYzK3hZWjltQjhjdWphcEJqS2duRHhv?=
 =?utf-8?B?dHA3ejNXVG1yVnJ6UzVZSTFIUnU3Q1VHVXRQWmRhb214aE1odTNReC9xM08v?=
 =?utf-8?B?MTU1aSs3Y3dlc0pFd0RxMlJRL0x4T2g3cXgwazFGWDB1a0hySkVTOVlpY25M?=
 =?utf-8?B?QUNwODlRWGN2Q3Ywdk0rUkh0WW1lSWoyRHVmbzRReERnN016ai9YL21DKzli?=
 =?utf-8?B?MW4rdWsxNkJ3aXh3YUI0K3o3TkxEeDhYeHNWd3RLLyt1bUtEcWtzVFVOaEUx?=
 =?utf-8?B?TjNPeDZ6akRac3d3MjhocW1ZTDlRbmtxckRSVHBkV3pEU0tSQ0duQ0xOZUkr?=
 =?utf-8?B?bUdBQmRYNWJpRzNUaUJSbHlkZjBnQnpLLzdhOTY3MnR0T1dwdGRBeTNRalUx?=
 =?utf-8?B?bzU5bWh6UEtyeTNTalRPd0FDQUNYazhHWDZCKzNsQ3RHbVpJbGVFOWlSNVl1?=
 =?utf-8?B?dlRxYXlNV21FN1ZyVjRSdzk1UVg2MTk5Ri9QMEJwK1k2cEQ5QmlqK1RncUpx?=
 =?utf-8?B?TnMwM2tHckl0d0duM3kya2YxWnZTZFBtYy9NVU0xZlgrdUxRU1pPYm1zS255?=
 =?utf-8?B?Y0JkSEpYdHVOeDdLQWdnb3hwYmdzVUNYdnFJcUFNWmwrcUZacmg3bnJSTmFZ?=
 =?utf-8?B?WEE3MlhaQ3k0YkFDa0JqWXZ6N1pUN1BhZzVZOHllYWdxUHF0c0piclY0TjVp?=
 =?utf-8?B?T3liaWhPU0xMVURDMW9xUGdXdTRxZWduWnh3b2NLeVo2NElTMmpZMHdRYXgw?=
 =?utf-8?B?VWh3cHZaeWtwenRFVXROVVcyMlJjVzJDcjlCelcwUzBIaVJ4S2todGNOcVFM?=
 =?utf-8?B?TGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8F7B710AF5B1AF4D9A3A611B586E0D35@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 81c92f69-0922-4ef7-1d27-08db88501ef3
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2023 12:03:10.0707
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C1vcqub5E5BDd2gq1X7uXJVSDJmL0v25TgXsckMObMX7g1LG6W1rHP0IWG3XbuO97DhiVTGmM6dKaedEwh4B6K48EBXIJAdTyChYPtY9NPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB7715
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 12:03:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184580

RXZlbiBiZXR0ZXIsDQoNClNvIEkgd2lsbCBtYWtlIG9uZSBtb3JlIHJlYmFzZSwganVzdCBmb3Ig
IltPRS1jb3JlXVtQQVRDSCB2OSAzLzNdIGN2ZV9jaGVjazoNCmNvbnZlcnQgQ1ZFX0NIRUNLX0lH
Tk9SRSB0byBDVkVfU1RBVFVTIg0KDQpSZWdhcmRzLA0KQW5kcmVqDQoNCk9uIFdlZCwgMjAyMy0w
Ny0xOSBhdCAxMToxNiArMDAwMCwgUm9zcyBCdXJ0b24gd3JvdGU6DQo+IE9uIDE5IEp1bCAyMDIz
LCBhdCAxMTo1NCwgUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlv
bi5vcmc+DQo+IHdyb3RlOg0KPiA+IA0KPiA+IE9uIFdlZCwgMjAyMy0wNy0xOSBhdCAxMDoyNiAr
MDAwMCwgVmFsZWssIEFuZHJlaiB3cm90ZToNCj4gPiA+IEhlbGxvLA0KPiA+ID4gDQo+ID4gPiBJ
IHdvdWxkIGxpa2UgdG8gYXNrLCB3aGF0J3MgdGhlIHN0YXR1cyBoZXJlPw0KPiA+IA0KPiA+IEkn
dmUgYXNrZWQgZm9yIHNvbWUgcGVvcGxlIHRvIGhlbHAgcmV2aWV3IGl0IGFuZCBJJ20gd2FpdGlu
ZyBvbiB0aGVpcg0KPiA+IGZlZWRiYWNrLiBGV0lXIHRoZXkgZGlkIHByb21pc2UgInRoaXMgbW9y
bmluZyIgeWVzdGVyZGF5IHNvIHRoZXkgaGF2ZQ0KPiA+IGFyb3VuZCA2IG1pbnV0ZXMhDQo+IA0K
PiBJIHN1c3BlY3QgSSB3YXMgdGhhdCBwZXJzb24gOikuIEkgaGF2ZSBubyBtYWpvciBvYmplY3Rp
b25zIHRvIHRoZSBwYXRjaCBub3cuDQo+IA0KPiBDaGVlcnMsDQo+IFJvc3MNCg0K

