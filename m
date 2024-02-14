Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8612BC48BC3
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 14:41:32 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.74])
 by mx.groups.io with SMTP id smtpd.web11.42963.1707921683933115262
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Feb 2024 06:41:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=Q0yhENMN;
 spf=pass (domain: axis.com, ip: 40.107.8.74, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kuJTvyygn/ktWxV6WmQl6MwS3ON1uUsHyxy/gYlHKFY8F2IY62UV/GSyoAuX/7Z8l9eWBOEvWotdQzT86Np5RjT+sgY2yVgg9R5pW0TNtxLr0OmlBrfA767+cTTjWMwaHjYfTfW35+ZRMSmNbaFpU+kSKmTskZsYnyPlgmHFBTXMVBSu0RyKWPI8ozgFGXwjEcHDVf159/3PFsVXPA8B8ZC/eN58smH6V/wsUUQt0WYTXLWmvEHkGEBKL5hX3oeUw4I8DBWO68guYW2t9b81V4yujWOTGTck+jCN/Vk4mnDm/fczkcOKmBPh6N4gOZzTeo7X4Gq0Xfu/mck9pjjOWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b+TsYRv90SMZM4H0Ch3ch5YTpTE79ZUTdyzxUgtfHq8=;
 b=BDpbIM+sJe5h4gBlF0/iZ8uohNv9QgKQjocGeet+3eto7adqiR5Bnvz6bUmjzjeJBF0nK0aVsTbS7YhjzJDqe7mztFMgkJGg04t3BcODlgo5fZJOgANfYlvGf2ss/q80d7AJ6xB5lHFVEnZsxolAs+j/lMsfyTOxzG1SLJZSWsIH593wFEKM3aHiadrRbjq9vsex5L2pN2AVAlGLZGnGNpdkVXg2FqCxHW6Kw0YMPnPYVP0hHAXkAUD3mkA/wjQ/0MlStHlqyAPYYTrNKkFDYaNyJEsM3VqmJOpIoK1H21nxppef1VVAzqUMTJxhfzo9vAZBfcnj8V9dXlo+iq3clw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b+TsYRv90SMZM4H0Ch3ch5YTpTE79ZUTdyzxUgtfHq8=;
 b=Q0yhENMNjW8dXAi5GOmMmGsSpjy+zVRA4hCcnczoAlw5Z2cpUftTTLOmsCIRnR5pQuMuwDJ/YCjoVUuU9dh28c/wbvFly3lgqYkVjaksOilYrpP//Y70GleWRmNcmAAf4jUn0Hy6GAeJHFG2rCsLAsGLh53m5ZQFYURs9xWe5QE=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AS2PR02MB9906.eurprd02.prod.outlook.com (2603:10a6:20b:609::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.35; Wed, 14 Feb
 2024 14:41:20 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::546:7e4f:ddb1:92d7]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::546:7e4f:ddb1:92d7%7]) with mapi id 15.20.7270.036; Wed, 14 Feb 2024
 14:41:20 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
CC: Adrian Freihofer <adrian.freihofer@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Ross Burton
	<Ross.Burton@arm.com>, Mohammed Raza <mohammed.raza@savoirfairelinux.com>
Subject: RE: [OE-core] VS Code plugin and multiple build directories
Thread-Topic: [OE-core] VS Code plugin and multiple build directories
Thread-Index: 
 AdpejlwvkIVHrQ98QLWkzxa8yv//hQAAtIMAAAtW5oAAGkBsgAACGQqAAAAxnwAAAOztAAAAMXkAAAPE2oAAAlvDQA==
Date: Wed, 14 Feb 2024 14:41:20 +0000
Message-ID: 
 <DB5PR02MB10213E20ADB72DDCD1CAE6F75EF4E2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: 
 <DB5PR02MB10213FA30B1A62CEA61B98E02EF4F2@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <3a0bb821-e692-4256-ab7b-95716f2e5896@savoirfairelinux.com>
 <3c844a195548fa8d0352bfc469996f3077eb5a0a.camel@gmail.com>
 <33e57963-8887-4c95-ad8f-654afcea5e74@savoirfairelinux.com>
 <14a1b53384f2901878d7b4ed225edf8254af07f9.camel@gmail.com>
 <CANNYZj9UxD9-Owt6H1OouZXu4WYWOoUnh77g10Cihj5nLjoAPw@mail.gmail.com>
 <4582012f-7518-462b-bee4-5777f28cb28d@savoirfairelinux.com>
 <CANNYZj8GvH4RKa9phsQ7oSv2b0604DtLa09W1Fndm-bA3KANVg@mail.gmail.com>
 <71696e62-8d1f-43b4-8277-7a6619a20d73@savoirfairelinux.com>
In-Reply-To: <71696e62-8d1f-43b4-8277-7a6619a20d73@savoirfairelinux.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AS2PR02MB9906:EE_
x-ms-office365-filtering-correlation-id: 478eca44-f424-47ee-179c-08dc2d6b0229
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 hf5v6SwXZm4uFkVV3rU0EFSnl7f+C2PRaejxBhgCGRca6BpxNnCfNI5CW/3O2d8FBgToCTr2hZvxqqFOZ59XGx/TWygl4mf9i8s2fyvowSMROxo85mkPnbmoxtlhHDeq1B1ahLjPhSurtgjLdiJ4R12Ut1dHNO1UN4ZtvEuO64gbVovVm1RA9zqLLQT5nat8XkUBtUqVzB1mkNitXu+dSrWxjFO768yCMGv4MSLzCZDPv1iub1e0is7zc5LuOI01Gj2Py+3lTqeZ1sLDYxZO1R2fdMBzj2QSOPDMb3hlORE4+ohqzs+ZT51vQuWxNK0lGH3cxnua19GEj6+Ogxb7L7AC8b+yulJcF7Gh9GVlnn2Jc4AJdp0fDnoPjvNGmQUJ0+qe7shkdNBqdUprWMBwA/I1GKOqAdGDriTEQP0KHHZHiaFf2iVg+V54MugLrB+Uc9s/HVnM2JjDd9MXqTQ6NhlnVvnDU43uBFQMr7/ah5+13TOqpLi6zGQFhUAtHskw7sUYPVchwHuItppj6yrWuz6AFOKPNqlYy+bt7ALRdX+cqlN8GnscIjtZsj0JYTJiiIlxo82wCSlI/ilV9MbWJUCoI0VNNMfr5EofxWPCa+YIWVd7b6KSoR5VwzsoAx8D
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(39860400002)(396003)(136003)(366004)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(9686003)(478600001)(41300700001)(55016003)(4326008)(8936002)(52536014)(5660300002)(8676002)(2906002)(44832011)(110136005)(7696005)(66556008)(38070700009)(53546011)(76116006)(66946007)(316002)(54906003)(64756008)(71200400001)(66446008)(66476007)(83380400001)(122000001)(86362001)(26005)(6506007)(33656002)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RHMveHZVVVZ4N2lOKzdrREVnSk1kOUFiS0R2bFVndlNXeURQcXlsbFBEU2hk?=
 =?utf-8?B?azg3T2NVUkFzbDR2UHVNcnI5R1VobUdWMlVTYXAvYVVDZHZyVEwzdmRrNnZW?=
 =?utf-8?B?MzZTWDEwNExxWTBpWmlTUEpYQU5SY25ySUlzUzhaajFSdUFBNzN2ZGNXdWV0?=
 =?utf-8?B?Y0drcTJpd0RqcFFsbVBUbUlFVXJkbjlRZTJNZUx0aDNoTWpGQ3hmc3VkNkxJ?=
 =?utf-8?B?M1pwMlgwZEVxdHNyb2krTWRKUzFvZlloNXd5bEsyMTduNXRlTEJ0Vkg3WUx2?=
 =?utf-8?B?WDR0d0VrTkVlOEpEQmNFTkRVL3hFSTA4dFllOWdXOGpxaURMV244ZlhmclUr?=
 =?utf-8?B?M3hONXpLZWlZbTFGUGlGdTQxL2FWREZpYW4xc0MxRXNPbS8yY1BKUEUwUTZ2?=
 =?utf-8?B?aVR5VmQ2RzlpMDdPcWxIMkdJVzNRanR3UzdoUStxWWFRSDVTeW5oU2t0QWJm?=
 =?utf-8?B?MEY0Q0J3Rk45VnhjMmRIZWhlMzVxZHNvcWFwSk0ySVlRM3NLMU1iVXNYSEV5?=
 =?utf-8?B?bW1iQnZtK2ZvRjdablQxSTNnYURSdmw3RFdVWC9mekdXMmpzTXQ5YVI0SHFU?=
 =?utf-8?B?bDlmc3E3SjZ0ZnBCQjk0WHhiRkJBSFoyVjArTVdzcWtZMkxCMnhyQWpoM0Ji?=
 =?utf-8?B?TE5YSWpLRDA2WnNsaktWYzNucGQ4ZC9hYXI1bnN0QWMwZ25kZVlNMXJ5R1ov?=
 =?utf-8?B?cU5INEhzbjVNYkV4Tlc2eWVDNWNBQ29lQ09neDJlQlJPQkZaQ2ZwVWVPUzE2?=
 =?utf-8?B?VkRYdVljQmxCYWhYVXVtVzFGT292OWgwb3hOOGpYOHFDdVlidTUvMHJXandQ?=
 =?utf-8?B?WE9yL1ZBVWFDTjMzNGxCd2Y2WjFhaTZkcnh1WklSWGhkdEZhaWYvNnBHNEJF?=
 =?utf-8?B?UXdPNWhjTWMrUFFjRzFYTXRFTXc5SGE1a0JmM2lPQmtSZXI4eDdPVGg3aklK?=
 =?utf-8?B?aUZIWis3U1hwZU5oWU5xcFFTejlHNk9YVjdTWUcwajhKSzFsM3c2YkdsUVlW?=
 =?utf-8?B?cEFoRGI5RTJUd2ZVT084SnhSbjZpUEREd21TcSsvaEd3S1Jib2xocmRtbm5D?=
 =?utf-8?B?UTNRRkZyRGM2ZlQxdWJUY3lqQ3V4M21PWGh2Y0srWDhodm5hOXA3RmkyN2Vq?=
 =?utf-8?B?eGFjNkI3Z3l1ZHFSenlsaUVzZkFNbnkvMk1LYjQwNDVPZ2EyQlJMUjd6NGpF?=
 =?utf-8?B?NHU3YWpBZ09ySWljWTZvdjcyZENPMVNBZlRid3BwZEpIeEJqZjVqOEtFS2lS?=
 =?utf-8?B?c2dXajdySFR2aVhqQW1BM01UMW1oNkhjUjNHbnRyM1RVMHZNeU4rcTh5M0VE?=
 =?utf-8?B?YU1GQWlqdWVzdXVEZ0ptUWlzVTJRbVQ1MHk2SEtHOCtPcFpHWEM4aG9uOHl3?=
 =?utf-8?B?cVJzUHc1U3B5TndnbmlCajZuaVlKVXhzTUpwNHpFY0tkT215WkJ0SDRxM0gr?=
 =?utf-8?B?bEtrNDZjME1xdHdZN2lwdnVuS3BsQk81ekMxWDVsM1R0UzZ1SWhyQU9WMS9X?=
 =?utf-8?B?WlFqMnNyLzJqb0hkRndOWXlaQnRyQ2RFdyszZi8yRTVMTVFEa21tc09EWlJ4?=
 =?utf-8?B?c05KbUkzZnprMXFBd1RpVkxIZXEyaE12TTlONXlLNGdHK1ZMZERhL2xadWk3?=
 =?utf-8?B?Z3lwT2Ird21oa2x0Sm9DVnJkWjh3bGRHY0NWN0MyNEkrdE9OYy9XMkhuOEpz?=
 =?utf-8?B?Q25IRmM1UnJVMmgzVjd2K1VseHVKTDRmWXRIRkZidlZ4dUpXb0JRQ0QwUXN2?=
 =?utf-8?B?UGYzaXRCYjdCQi80czVhcjdHeXdldFlnZ1hrVTRuY05IOEJyOWJ1WHdRcGpl?=
 =?utf-8?B?cnV3Rm40ZytmZUhKTWR2YTUweW9XdWtjTHlqYk9iQ3c5SVYxQkJBanJSS2NF?=
 =?utf-8?B?eUZGSWo5Q0lkRTJMdGxURDVOdjFPaVBDeHRuK1BxVHRQMFlxOEh2SGpid0RX?=
 =?utf-8?B?d3dSNldtVDBFV1MwMUw4MnEyWitrdFpMWmJ5NGJjM0VtbkRkc29LK05Td3ZD?=
 =?utf-8?B?Rm5YZTR0YmNkRkp6S09yWjBIaWNMdVZzaWlxeFBSUDBkQWF4SGpFVHZjVnNU?=
 =?utf-8?B?b1BaWkN1YVk5UE5wMHRuM1lYWDFCK3FEOFpRU0xYQUM4SS90QVFCSG9PbHRU?=
 =?utf-8?Q?GVXM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 478eca44-f424-47ee-179c-08dc2d6b0229
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2024 14:41:20.0492
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bx9KjFBsu0R+gjwPFio+Jot7LrSeYGXmEn2k+F0jFEVixLOvQu/o1nX2W41UAu8x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB9906
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 14:41:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195479

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBFbmd1ZXJyYW5kIGRlIFJpYmF1
Y291cnQgPGVuZ3VlcnJhbmQuZGUtDQo+IHJpYmF1Y291cnRAc2F2b2lyZmFpcmVsaW51eC5jb20+
DQo+IFNlbnQ6IGRlbiAxNCBmZWJydWFyaSAyMDI0IDEzOjUwDQo+IFRvOiBBbGV4YW5kZXIgS2Fu
YXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4NCj4gQ2M6IEFkcmlhbiBGcmVpaG9mZXIgPGFk
cmlhbi5mcmVpaG9mZXJAZ21haWwuY29tPjsgb3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmc7IFJvc3MgQnVydG9uIDxSb3NzLkJ1cnRvbkBhcm0uY29tPjsgTW9oYW1t
ZWQNCj4gUmF6YSA8bW9oYW1tZWQucmF6YUBzYXZvaXJmYWlyZWxpbnV4LmNvbT47IFBldGVyIEtq
ZWxsZXJzdGVkdA0KPiA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPg0KPiBTdWJqZWN0OiBS
ZTogW09FLWNvcmVdIFZTIENvZGUgcGx1Z2luIGFuZCBtdWx0aXBsZSBidWlsZCBkaXJlY3Rvcmll
cw0KPiANCj4gT24gMTQvMDIvMjAyNCAxMjowMSwgQWxleGFuZGVyIEthbmF2aW4gd3JvdGU6DQo+
ID4gT24gV2VkLCAxNCBGZWIgMjAyNCBhdCAxMTo1NiwgRW5ndWVycmFuZCBkZSBSaWJhdWNvdXJ0
DQo+ID4gPGVuZ3VlcnJhbmQuZGUtcmliYXVjb3VydEBzYXZvaXJmYWlyZWxpbnV4LmNvbT4gd3Jv
dGU6DQo+ID4+ICAgICAgICJiaXRiYWtlLnBhdGhUb0JpdGJha2VGb2xkZXIiOiAiJHt3b3Jrc3Bh
Y2VGb2xkZXJ9L3Bva3kvYml0YmFrZSIsDQo+ID4NCj4gPiBJIGFza2VkIHRoaXMgaW4gYSBkaWZm
ZXJlbnQgdGhyZWFkLCBidXQgcGVyaGFwcyBjb3VsZCBhc2sgaGVyZSB0b286DQo+ID4gaG93IGlz
IHRoaXMgc2V0dGluZyB1c2VkPyBJZiB2c2NvZGUgbmVlZHMgdG8gcnVuIGJpdGJha2UgZXhlY3V0
YWJsZSwNCj4gPiBpdCBjYW4gZG8gc28gZGlyZWN0bHkgYXMgdGhhdCBpcyBwbGFjZWQgaW4gUEFU
SCBieSBvZS1pbml0LWJ1aWxkZW52LA0KPiA+IG5vPw0KPiANCj4gVGhpcyBzZXR0aW5nIGlzIGlu
aGVyaXRlZCBmcm9tIEV1Z2VuJ3MgdmVyc2lvbi4gSXQncyBub3QgdXNlZCB0byBzdGFydA0KPiBi
aXRiYWtlIGFueSBtb3JlLg0KPiANCj4gVGhlIHNoZWxsIGludm9jYXRpb25zIGZvciBZb2N0byBh
cmUgYnVpbHQgaW4gdGhlIGZvbGxvd2luZyBmb3JtYXQ6DQo+IA0KPiAJW2NvbW1hbmRXcmFwcGVy
ICJdLiBbcGF0aFRvRW52U2NyaXB0XSBbcGF0aFRvQnVpbGRGb2xkZXJdICYmIGJpdGJha2UgPHJl
Y2lwZT5bIl0NCj4gDQo+IFdlIHRlc3QgdGhpcyBpbiBDSSBhZ2FpbnN0IHR5cGljYWwgY29uZmln
dXJhdGlvbnMgZm9yIGthcywgcGxhaW4gcG9reQ0KPiBuYXRpdmUsIGRvY2tlciBydW4gd2l0aCBj
cm9wcywgd2hpY2ggYWRkcmVzc2VzIHByb2JhYmx5IDkwJSBvZiBvdXIgdXNlcnMuDQo+ID4NCj4g
PiBUaGUgcmVhc29uIGJpdGJha2UgbG9jYXRpb24gaXMgY29tcGxpY2F0ZWQgdG8gc2V0LCBpcyB0
aGF0IG5vdCBhbGwNCj4gPiBzZXR1cHMgdXNlIGJpdGJha2UgY29weSBjb250YWluZWQgaW4gcG9r
eTsgc29tZSB1c2Ugc2VwYXJhdGUgY2xvbmVzIG9mDQo+ID4gc3RhbmRhbG9uZSBiaXRiYWtlIHJl
cG9zaXRvcnkgdGhhdCBjYW4gYmUgYW55d2hlcmUuDQo+IA0KPiBUb2RheSBwYXRoVG9CaXRiYWtl
Rm9sZGVyIGlzIG9ubHkgdXNlZCB0byBjb25maWd1cmUgdGhlIHBhcnNpbmcgb2YNCj4gUHl0aG9u
IHNlZ21lbnRzIGJ5IGltcG9ydGluZyB0aGUgbW9kdWxlcyBpbiB0aGUgcG9reSBQeXRob24gbGli
cmFyaWUuIFNvDQo+IHRoZSBzZXR0aW5nIGV4cGVjdHMgdGhhdCB0aGlzIGJpdGJha2UgcGF0aCBp
cyBpbnNpZGUgcG9reSBhY3R1YWxseSAoYW5kDQo+IGRvZXNuJ3QgdXNlIGFueXRoaW5nIGluc2lk
ZSBiaXRiYWtlKS4gSSBjb3VsZCBkZXByZWNhdGUgaXQgYW5kIHJlcGxhY2UNCj4gaXQgd2l0aCBh
IHBhdGggdG8gcG9reSB0byBiZSBtb3JlIGFjY3VyYXRlLg0KDQpXaGlsZSB3ZSBkbyB1c2UgUG9r
eSBhcyB0aGUgYmFzaXMgZm9yIG91ciBwbGF0Zm9ybSwgbm90IGV2ZXJ5b25lIGRvZXMuIA0KSXQg
aXMganVzdCBhcyBsaWtlbHkgdGhhdCB0aGUgYnVpbGQgZW52aXJvbm1lbnQgaXMgc2V0dXAgYnkg
ZmV0Y2hpbmcgdGhlIA0KaW5kaXZpZHVhbCByZXBvc2l0b3JpZXMgZm9yIGJpdGJha2UsIE9FIENv
cmUgYW5kIG1ldGEtcG9reS4NCg0KQWxzbywgd2hhdCBkbyB5b3UgbWVhbiBieSAicGFyc2luZyBv
ZiBQeXRob24gc2VnbWVudHMgYnkgaW1wb3J0aW5nIHRoZSANCm1vZHVsZXMgaW4gdGhlIHBva3kg
UHl0aG9uIGxpYnJhcmllIj8gRG8geW91IG1lYW4gdGhlIFB5dGhvbiBtb2R1bGVzIGluIA0KbWV0
YS9saWIvb2U/IEluIHRoYXQgY2FzZSB5b3UgcmVhbGx5IHNob3VsZCB0YWtlIGFsbCBjYWxscyB0
byBgYWRkcHlsaWJgIA0KaW50byBjb25zaWRlcmF0aW9uIGluc3RlYWQgYXMgdGhleSBjYW4gYmUg
dXNlZCBieSBhbnkgbGF5ZXIgdG8gYWRkIGV4dHJhIA0KUHl0aG9uIG1vZHVsZXMgdGhhdCBiaXRi
YWtlIHNob3VsZCBiZSBhd2FyZSBvZi4NCg0KPiA+IEFsZXgNCj4gRW5ndWVycmFuZCBkZSBSaWJh
dWNvdXJ0DQoNCi8vUGV0ZXINCg0K

