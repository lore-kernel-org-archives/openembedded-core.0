Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C33CCD6115
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 17:27:41 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.48])
 by mx.groups.io with SMTP id smtpd.web10.69494.1696872452256903058
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Oct 2023 10:27:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=eUvnvZtf;
 spf=pass (domain: siemens.com, ip: 40.107.7.48, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CcSHiir7gKcwZ09OJ/varwzviQ6YB7bipXXwqlsI9PufyZFszn/cceI16xBBixeXTQuHURO8gshpWniROC+0e6zeh1udJudTrekcSwAFcfgMPu9jHVXJ/PwKXNzxCWWnety+Py26lCM1TqcKcm90czRn68EQ1xzK51Y04l4+eEMETvWkAguLfg3eESNYiKcCSC/9znh2h525F03git068mM60rlOyrUJVt583qWSb7Ucn2LRvD6+YqvtebyPMv5fdIPFIgIG0SVzUI9iAs+NoXvouJnjzS7TNvXjH0o2KVmj+bSlbIqmL9ZxzGJVssFy0pHj4yP0dX+uEfd4M+MyQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+KTfl2IawOUqXol1xPwYMshLAw4raFgNvI4Smwf+gxo=;
 b=ZU0N7eDvMFSIfTVmmm/lkjmCOpDyTOAqEzwggNSy6GwYqwLmjWploLCEDvmuTzwLxrbrA5BhUHBPcHfj6W/+DQ3+ZhkX4hJucb1eXBXBdwy1sIVHexHbO1uohrRXx/xi/Llw0HBHdfo4bxYvEvtyuBGDRma+S/05tBswyCxw0nHjsVHPUVUWg7pSU7l1WDbqs7uek0SLKXJ3J10SIc7vFSkLsvy9H+CEsO3aTvzPZ/NUey2v9rxsbpBwG1jk/T+Ucf6l4N1rVti/ae8tFlluPLPrCEHInbjCt9OyKHf0dA/a/2jioSpb4fey4SzC6pDpIBnfzroRWd2CRW5nlVmfVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+KTfl2IawOUqXol1xPwYMshLAw4raFgNvI4Smwf+gxo=;
 b=eUvnvZtfcL0laAMUCGg+uk6qwm3YaNZYkQjm3ZP7/lensrSwgYYg2cgDA6Q3PjNu0xAzTyKfg9c1LR4XnTUq1tzQszuHjcw6xGmqGLaTFNe69AtO1xqk0n63fn+1s3gJfhtQaAtS5Bh70shA5iQ5FIU93LngsvyuLS00fJ0ghbbbs+XfILMcH8BN/rveyVOTe4WaW2nDupNTLu2QTJ+/W0SOScckjn2+Zip9kc+KGpa+bqe9gVJIslZ1f5M/vJeU6/nJpnKHbshr5d7UWHFXbHfP7ZsL4Cx4ar6mxQxQnfHtJ3O5gbxkLjqFe0o7io3tG0NovbJBqaKjnAAy/SLm3w==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB9PR10MB7098.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:458::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.43; Mon, 9 Oct
 2023 17:27:28 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fad3:1ee5:fae4:adf7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fad3:1ee5:fae4:adf7%5]) with mapi id 15.20.6838.040; Mon, 9 Oct 2023
 17:27:28 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Marek Vasut <marex@denx.de>, "richard.purdie@linuxfoundation.org"
	<richard.purdie@linuxfoundation.org>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>, "steve@sakoman.com"
	<steve@sakoman.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] ncurses: Mitigate CVE-2023-29491
Thread-Topic: [OE-core] [PATCH] ncurses: Mitigate CVE-2023-29491
Thread-Index: AQHZ+s4QM7OitojrPkSOGd5qmkfWiLBBqgyAgAABCGCAAAKCgIAACAHA
Date: Mon, 9 Oct 2023 17:27:28 +0000
Message-ID: 
 <AS1PR10MB5697B786381725B14B540C96FDCEA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20231009163110.94431-1-marex@denx.de>
 <4eb39033effcbbcd8651f73632b94bb159fecb65.camel@linuxfoundation.org>
 <AS1PR10MB56972FEC790240DB9F01228FFDCEA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <71c01da4-1fcf-438e-ad90-d17970a9adc2@denx.de>
In-Reply-To: <71c01da4-1fcf-438e-ad90-d17970a9adc2@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=8ed33bdf-72ed-467a-8a1a-ecc89dc7c49e;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2023-10-09T17:25:29Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB9PR10MB7098:EE_
x-ms-office365-filtering-correlation-id: 30ca2c08-d3f8-4430-82f5-08dbc8ed031b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 abNpgzrE5+uCv0BBZf1aNTe1DqyetxND57WZns8/kA9sAXVAItx2/mXQj/aEoCqW6oUzLT18FY2+Ue39aU9KjKCDnHmeMR8zyJZ6pVZlJnbFvoNesRXCGk6Q6bqgJKJjX2hV/zfVpYXhpENeRtqK1EZbgq4Wptl3f1/8KTSWq6fKLHMwQnw+wuEbRNARluxyjXfdII4J48cYpw4nWFnoRTkjQapBSA4fT8ikhJP5KQ+oI+UcvrsPYq7NXKQTzLG2M/SyJtwbd3Fu1pKXX5yLs80iPl+YvOsuZrHPDgkH8EPnGFtAJA8/5UmL1YnyyaTW8+9XLtI61aPsNBmdB4fwE+SHdZcR5fwapq189xDZUfZWujI4FgkRQR23xwUWX0rsC3DdTCLi5Y/grWL/4+cktmepkxvoAkQgpvQ1fX4nP4+sn9ccEu9Z5zCqaBZpVTwCrvnkpPANVgA4CaFok/mnDrLO0xF4or6JbjHIBwP8UEksu6fHg7BVP/QMRVW3ehGP5B+0IhoR6w9jCowEGhR5yUKgwttmkhI0+oIsPSAIGsFjgAmXXIveHLnQVtnBuaIqfKrTvLg+BiQfta2lWbuC9wAr4XI5cdx/Mzt0YZNdMZo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(366004)(396003)(376002)(136003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(966005)(55016003)(2906002)(66556008)(83380400001)(55236004)(26005)(316002)(66946007)(64756008)(66476007)(110136005)(76116006)(54906003)(66446008)(4326008)(6506007)(5660300002)(41300700001)(8676002)(53546011)(52536014)(478600001)(7696005)(9686003)(8936002)(71200400001)(33656002)(38070700005)(38100700002)(82960400001)(86362001)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bkxMeHpuV29LaFBLaFg2UFhENklvdzJEcjJ6MTdxUUZ2cEpmM3d1WXlUT2M2?=
 =?utf-8?B?NmpGRjJWTFpBdnMyY1VneEdNZzBQNHVWdnhQZHVkTWQ5T1FXL0lYWVdkQk5h?=
 =?utf-8?B?UWJrK1dkcWF6MVB1YThiSjVjRXdneGs4M3hyMVN5MEp1eU9tMSt0L0NCZFNP?=
 =?utf-8?B?a1FaZzF6enk4VGJ4eG0vUXN6bklpalMySDJTRi9qcnpWSmYyakJBTHhSRHJq?=
 =?utf-8?B?aDJFMThZSFI2Y3lwOEFiQ2NFcjJJT2JDcTg1eFRraXZJTnIrM0RUUTQ3SXph?=
 =?utf-8?B?RGdLRGhHdUE4aDVjZllPOHdidWJibWh4Nk1DUXZqaWFvSDZPUkZwVXJjcm9j?=
 =?utf-8?B?NDFsRk9XQXhiYjhBcWJQd0thdnNwdm5uTURIVThoZlN4M25iZEh6RzZmQkVB?=
 =?utf-8?B?S0VOMFNCTWlQYnhBdGM4ZjBmNTZKUVNBLzB3MytHdGc2K2xtZk1MdU92ek1O?=
 =?utf-8?B?U0FEeHExdVp3b2k4UFVNdzI4cEhtcTh4ZGZWZXpGMitVRXJRTmNtRkF2NnVF?=
 =?utf-8?B?bW9Ydnd3bE1uVFdhSjJzNC9oalorU3QxaVlqb0FJbW1qODc1RUNxU1VYTWhL?=
 =?utf-8?B?bUdNYmx5MkdpVkdDYWVkLzQ5alBNNDFVRWVwQktIc3UxVzJUSG5BcmZtanVC?=
 =?utf-8?B?ZWRCSkdDRlVCV2ZuQ3hqd0lVcFdpNjA2dkNVWEhsWFVLOWhheUFGTGRCeGZt?=
 =?utf-8?B?TlRHeFFhSWdFaUhMYTFsaVpqMHpSUS9iYU1pWEpOVnY1Mzlhc2FFYXg4UkF1?=
 =?utf-8?B?bm0rYXdia2U5UERXVnNka2hYNG1zZGxTelR4WGdYYXNkejQ5eXZES2NsNFRV?=
 =?utf-8?B?ZmNZQ20wNWFobENBQW83MGlGZFI1ZE9KVFRMb1lqS0tvOTVNbmtDQld4N05o?=
 =?utf-8?B?TDdMUW1GdUJray9POFovbzRRSXV6dS81NXM0OFpjNGtLalFXdzNKcXBaZUNm?=
 =?utf-8?B?RTJiU29lb2E3NG5rYzJvYzdpN2ZvVDN3eFJUaUNBRStPN3dFZG11aWd0U1l0?=
 =?utf-8?B?OU0rRVVoQnl1US8wYStnRjc0R2kybTZ0eEc2aEg1T1FrMDFNaUQ0bmwzZ0VH?=
 =?utf-8?B?dTE4TW9iTE53alZ2eHM4cHdLck9WMEJBU0daWDEzQTlndTllKzRadlRhcmdC?=
 =?utf-8?B?bVdTUVUyTjNyc2JFZ3BUSlZ3ODBPWVZCOGxkamxEY0Z1NUJyN2oySWI2eDJI?=
 =?utf-8?B?OHNjbHZ5alRqY2ZQcU1RMmMzck54WWF5UEp5Vnc3ajZYT0ZFcGpabHBLSEpa?=
 =?utf-8?B?UVdPT0JOWkw0a2EvYitjZW4yOENkTVV1Y0M4dkpGTjdOOE5PRVFIMVlyMkda?=
 =?utf-8?B?TzVKUVprRU41MkNUdlVvVnVZdEhUMm5HZzZZZHpiekVHY3JoVVdIcG5VTWx6?=
 =?utf-8?B?WTRnVnVvb1hqL1ZHbnBJRS90UVU4VC93N0NLdi9FdlRYKyt0MEMvWDFqNzNm?=
 =?utf-8?B?RjFRc2lQZ2dWZVNnTWJoSkF0YUZwTStaUFA5U2F4WEU0VVpIc1UxVDRSRHhM?=
 =?utf-8?B?SDJMcGo2L25LeVdiY1dXSmQ1dUdSek9iVjF0MmZFRG9QbmFwM2FtQkRJREg0?=
 =?utf-8?B?Zll2cmVjcEFMb05wYXpDVmZYQndIS05CTVM0emk0TnVXRWhLNkd2aXpIc29x?=
 =?utf-8?B?QjdGVXZBYzdYYm9XODVGRHdZSUxnMVhXZWhMRG5YWStmTEowS1VLaWd1NW0x?=
 =?utf-8?B?OE4rejd0UlhWeVV1ZkVFNmYyby9YQUV3Wm5GdzlzRlhnUXJsU0J3RGJrT09S?=
 =?utf-8?B?RXhTWFJwYmE3TDMyNUFSNldkcElQZDRGcjJVWGpqVWtzbTUyVm11clE3UXly?=
 =?utf-8?B?dzFCZkxjc0FnZFcwMnVka0VkTER5N3RwT3hGOER4UWFOMk5ha3RDSDJjdS9E?=
 =?utf-8?B?em5wN0o3aXR0aThKTEFNSXpWY2RlbGlSMXFjYkZ6Q04wYXRwUHRjMDBja21j?=
 =?utf-8?B?eDRlUnQxMDdYa0ZwN092ZnM5TVRPYkRleWM3ZGtpMWtQR2ZkYy8rVXB6dVJ3?=
 =?utf-8?B?amlYZ0huSy9KVURzaXJoQjhxVkV3eSt4bEFyM2ZvVWt5TmFSTzZHV3RDTTI4?=
 =?utf-8?B?SU1ROHBMWWhMb1pXT1RIa3oxdW9saXBpeTJRRG9QVG9lT1FJbVh6RmVWd1Jn?=
 =?utf-8?Q?OFvQyvdoqyf+yjwi5+hyOBUfV?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 30ca2c08-d3f8-4430-82f5-08dbc8ed031b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2023 17:27:28.7839
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZBecLRV1LwIXs3s34a7P53BiBCOx/Pb3DwkT5yDeRuhg3vHepAbFdSo0HrW7aXxLkvsLIF9XCtnDvk3mqdbhFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7098
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Oct 2023 17:27:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188858

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54
LmRlPiANClNlbnQ6IE1vbmRheSwgT2N0b2JlciA5LCAyMDIzIDE4OjU3DQpUbzogTWFya28sIFBl
dGVyIChBRFYgRCBFVSBTSyBCRlMxKSA8UGV0ZXIuTWFya29Ac2llbWVucy5jb20+OyByaWNoYXJk
LnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnDQpDYzogQWxleGFuZHJlIEJlbGxvbmkgPGFsZXhh
bmRyZS5iZWxsb25pQGJvb3RsaW4uY29tPjsgc3RldmVAc2Frb21hbi5jb207IG9wZW5lbWJlZGRl
ZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BB
VENIXSBuY3Vyc2VzOiBNaXRpZ2F0ZSBDVkUtMjAyMy0yOTQ5MQ0KDQo+IE9uIDEwLzkvMjMgMTg6
NTEsIE1hcmtvLCBQZXRlciB3cm90ZToNCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiA+IEZyb206IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgDQo+ID4g
PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBS
aWNoYXJkIFB1cmRpZSANCj4gPiB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+IFNlbnQ6
IE1vbmRheSwgT2N0b2JlciA5LCAyMDIzIDE4OjQ0DQo+ID4gVG86IE1hcmVrIFZhc3V0IDxtYXJl
eEBkZW54LmRlPjsgc3RldmVAc2Frb21hbi5jb207IA0KPiA+IG9wZW5lbWJlZGRlZC1jb3JlQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiBDYzogQWxleGFuZHJlIEJlbGxvbmkgPGFsZXhhbmRy
ZS5iZWxsb25pQGJvb3RsaW4uY29tPg0KPiA+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENI
XSBuY3Vyc2VzOiBNaXRpZ2F0ZSBDVkUtMjAyMy0yOTQ5MQ0KPiA+IA0KPiA+PiBPbiBNb24sIDIw
MjMtMTAtMDkgYXQgMTg6MzEgKzAyMDAsIE1hcmVrIFZhc3V0IHdyb3RlOg0KPiA+Pj4gQ29uZmln
dXJlIHdpdGggIi0tZGlzYWJsZS1yb290LWVudmlyb24iIHRvIGRpc2FsbG93IGxvYWRpbmcgb2Yg
DQo+ID4+PiBjdXN0b20gdGVybWluZm8gZW50cmllcyBpbiBzZXR1aWQvc2V0Z2lkIHByb2dyYW1z
LCBtaXRpZ2F0aW5nIHRoZSANCj4gPj4+IGltcGFjdCBvZiBDVkUtMjAyMy0yOTQ5MS4NCj4gPj4+
DQo+ID4+PiBUaGlzIGlzIHRha2VuIGZyb20gZGViaWFuOg0KPiA+Pj4gaHR0cHM6Ly9zYWxzYS5k
ZWJpYW4ub3JnL2RlYmlhbi9uY3Vyc2VzLy0vY29tbWl0LzFjNTMwYWFkNzcyZjdhZWVmMDMNCj4g
Pj4+IDliDQo+ID4+PiA4NzgwZDUxY2QwOWJkNWEwOGFjDQo+ID4+Pg0KPiA+Pj4gU2lnbmVkLW9m
Zi1ieTogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+DQo+ID4+PiAtLS0NCj4gPj4+IENjOiBB
bGV4YW5kcmUgQmVsbG9uaSA8YWxleGFuZHJlLmJlbGxvbmlAYm9vdGxpbi5jb20+DQo+ID4+PiBD
YzogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+
ID4+PiAtLS0NCj4gPj4+ICAgbWV0YS9yZWNpcGVzLWNvcmUvbmN1cnNlcy9uY3Vyc2VzLmluYyB8
IDEgKw0KPiA+Pj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gPj4+DQo+ID4+
PiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvbmN1cnNlcy9uY3Vyc2VzLmluYw0KPiA+
Pj4gYi9tZXRhL3JlY2lwZXMtY29yZS9uY3Vyc2VzL25jdXJzZXMuaW5jDQo+ID4+PiBpbmRleCAz
NjdmM2IxOWY0Li4xYmMwN2VjMmQ0IDEwMDY0NA0KPiA+Pj4gLS0tIGEvbWV0YS9yZWNpcGVzLWNv
cmUvbmN1cnNlcy9uY3Vyc2VzLmluYw0KPiA+Pj4gKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvbmN1
cnNlcy9uY3Vyc2VzLmluYw0KPiA+Pj4gQEAgLTg3LDYgKzg3LDcgQEAgbmN1cnNlc19jb25maWd1
cmUoKSB7DQo+ID4+PiAgIAkgICAgICAgIC0tZW5hYmxlLXNpZ3dpbmNoIFwNCj4gPj4+ICAgCSAg
ICAgICAgLS1lbmFibGUtcGMtZmlsZXMgXA0KPiA+Pj4gICAJICAgICAgICAtLWRpc2FibGUtcnBh
dGgtaGFjayBcDQo+ID4+PiArCSAgICAgICAgLS1kaXNhYmxlLXJvb3QtZW52aXJvbiBcDQo+ID4+
PiAgIAkJJHtFWENPTkZJR19BUkdTfSBcDQo+ID4+PiAgIAkgICAgICAgIC0td2l0aC1tYW5wYWdl
LWZvcm1hdD1ub3JtYWwgXA0KPiA+Pj4gICAJICAgICAgICAtLXdpdGhvdXQtbWFucGFnZS1yZW5h
bWVzIFwNCj4gPj4NCj4gPj4gU2hvdWxkIHRoZSBwYXRjaCBhZGQgYSBDVkVfU1RBVFVTIGVudHJ5
IGFzIHdlbGwgc28gdGhlIGN2ZSB0b29saW5nIGNhbiB0ZWxsIHdlJ3ZlIG1pdGlnYXRlZCB0aGlz
Pw0KPiA+IA0KPiA+IG5jdXJzZXMgNi40IGlzIG5vdCBhZmZlY3RlZCBhbmQgbm90IHNob3duIGlu
IENWRSByZXBvcnQsIG5vdCBzdXJlIHdoeSB0aGlzIGlzIHN1Ym1pdHRlZCBmb3IgbWFzdGVyLg0K
PiA+IFBldGVyDQo+DQo+IEp1c3Qgd2FudGVkIHRvIG1ha2Ugc3VyZSB0aGUgY29uZmlndXJhdGlv
biBpcyBjb25zaXN0ZW50IGFjcm9zcyBhbGwgdGhlIHJlbGVhc2VzLg0KDQpJIHRoaW5rIHRoYXQg
dGhlIGNvbW1pdCBtZXNzYWdlIHNob3VsZCBiZSBjaGFuZ2VkLg0KSXQncyBtaXNsZWFkaW5nIHdo
ZW4gaXQgb25seSBzYXlzIHRoYXQgaXQgbWl0aWdhdGVzIGFscmVhZHkgZml4ZWQgQ1ZFLg0KDQpQ
ZXRlcg0K

