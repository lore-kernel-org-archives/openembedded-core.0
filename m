Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB621C48297
	for <webhook@archiver.kernel.org>; Sat, 10 Feb 2024 00:19:07 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.43])
 by mx.groups.io with SMTP id smtpd.web10.4002.1707524342477835887
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Feb 2024 16:19:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=LkXrsbi0;
 spf=pass (domain: axis.com, ip: 40.107.7.43, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m1aIrINJY6b/SWUrvagfqGe0wgWkoXkv3n7NlIU4hgt/PSpP9ngN/jM6eL8TZWjRNpBOiG815X9kIIqqiQMEJ/3bty82l69ILKht0u4u8tZo/RnLPn93cy6lGrR9ysVJoCyOtxKLoQgkiHP/C2BPaGjIy+tbbxOEM1xBn1DFZoAFxrZE9p2Gb3EuofGxjglm2sNJTUrY79dNgIcW5xJGIpHWBiv4YGHZftfZBdt+Ce/88nZitit2JOrpH/khc/4n8VadDA9dkOzKUywNz3s8Xlk+7vkhA6xLvfSmtjMBsb/68uzaA5alwiV3Y4SC3E1/4+4Fl5cMnq+M/9ySUevhmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/pn/sBVmOAdDc1mEgLYC+GnPTq5/og1tkI3bJSgiks0=;
 b=jBnCXpVzQt/qDZiazPxVkTGEgxpOCq7o+vw2AlLTKumhB64oWa2g53S3HUSSopYEv16T6pSwQMDhwqMsCjc4uENyKUtlMRrhdG+3jnfCmTToMEmfFo0D/tGrAQt13pqrCLt5C1qgreQcBTf1+dnNoCkX+VDFJW2nH1uca4gPoUSYU1v7cSLIFqNn3Vk1Svf6t/hCu6Ir7A2+IYU+AKLXcT3XoMfmRoVuOMUMYw0e6k9wZsQ5kkdZlg4u1YW0edNcVtg5uz+tMsQDfu+Ad9C190lGngPK+WqAFMU9nabKUk12OH9JEbQQkQAYAYg3LSnD5CKhO7NOmWbg5GqRddIUlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pn/sBVmOAdDc1mEgLYC+GnPTq5/og1tkI3bJSgiks0=;
 b=LkXrsbi0aGFyHqh5uxEy7gvSgd0l9EZFXJ6/nVJxyK/R/0HNTdopHirignYGbUjD9HGO+DTwT1IBJ1qA+p/SZcbtGuJNjUMvBFwSZC7S9LF3HhRW9zM95mTpahqFE2P39mXYatIaWFJ1ZjLEuZB35z1P7Wp65nQxlHe68dKogOY=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DB9PR02MB7865.eurprd02.prod.outlook.com (2603:10a6:10:326::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.27; Sat, 10 Feb
 2024 00:18:58 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::5b1d:259f:4ba1:8906]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::5b1d:259f:4ba1:8906%2]) with mapi id 15.20.7249.027; Sat, 10 Feb 2024
 00:18:58 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Martin Jansa <martin.jansa@gmail.com>
Subject: RE: [OE-core] [PATCH] insane.bbclass: Allow the warning about
 virtual/ to be disabled
Thread-Topic: [OE-core] [PATCH] insane.bbclass: Allow the warning about
 virtual/ to be disabled
Thread-Index: AQHaTTuh/s3PHFJ2oEW2SQnUVmz/VbDl3c9wgBz01dA=
Date: Sat, 10 Feb 2024 00:18:58 +0000
Message-ID: 
 <DB5PR02MB102136437CB630D61BB1C0685EF4A2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240122055232.2415989-1-pkj@axis.com>
 <f1722e2db188a3aec3ccc23fb573eaf2cae47eaa.camel@linuxfoundation.org>
 <17ACB13E58D9A491.7395@lists.openembedded.org>
In-Reply-To: <17ACB13E58D9A491.7395@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DB9PR02MB7865:EE_
x-ms-office365-filtering-correlation-id: d8b51d92-7a87-436c-dc67-08dc29cddfe8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 lc1lnzh6gy8XF0b/dUSmIBxHncnidORPN39rEQdJkW3YyFMQS4H9r9Jc+PWkp/M7KlRydmA3qmQ6SOmOfPXfMOUaa2ca6LpUtNEm9JX8+/hzw2bIBybH1dYyHZWDZZyxTpCvgaPKTte5nzHHcCpGaMScWW7EeAvUsHsk5+5UZ+tK3XYGk9YRMooXSVjEOwEZBHrgsQoTzWW9/Ac5kujwv8In1XOLE63NIRFAyUlXixlcVjYGMiHe3OJmIR/qhokf/JGJy/yXKS4S6gXPDvCNpwuNiAeHUJ7ff7Nt4QE+r+txudp8MzCGBsOzakhIdVgPqhS8NS22RcrOUhSfI2KDIoaySL+PwOhb7KfY1w6dkrFQrNgQMGa6vSCIBoV7TMyu3Y0IcUlYWW6TkRwSXtPnVMvLVSgFLx7EyvrjdZFETv9dGXzOtzWLjdFqxm8upKkUoICDKwgoWLSHSQ3S0h26NY+amIKQ3+3v2bQTietWAAS/y6M2DtimnjIsXbcEL077Pld7vSWItfvg/YTRBmEcToYoMUnOAQmU9m7GgswWLfvUlhTc7tdf6s0y0gRsNCqO6oUtAhoj3/dBoofjwAJAQusvVdgtNizlksEzE4ux58S42rWzbDoN2Ozcd1Nrvqzq
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(346002)(366004)(376002)(136003)(230273577357003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(5660300002)(44832011)(2906002)(9686003)(7696005)(33656002)(26005)(6506007)(53546011)(71200400001)(478600001)(38070700009)(38100700002)(122000001)(83380400001)(86362001)(52536014)(4326008)(8676002)(8936002)(66476007)(66946007)(64756008)(66446008)(66556008)(76116006)(316002)(110136005)(55016003)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YnBCTHJlVXFDK3FUWks3KzlmbEZKamhLRnhWOUNsZmZIV0VuWVZVZ1BRVDRK?=
 =?utf-8?B?WVBpaEEydFN3NjJqbFQ5Zzh3bFV3emhlV3ZCOTViUTU4dEUwRm52MXQwUnBs?=
 =?utf-8?B?RXIyNmNYUEZlSzhEUFZ0ZmFoZDBkSDd1MG1PUVgzRnQxZXVZWkhnZ2d2eDM5?=
 =?utf-8?B?VXE2YjhldGFUQ24wbGpnNHhuWjhTeU0wOW1GTktQTUFIWnMxOXdmdWhUYzlG?=
 =?utf-8?B?MFpURERPOFZlUFlWaHE2cTIwcGJTaHpqQ0ovRitQQVRyeVUrWkpKWlgvUjhx?=
 =?utf-8?B?enBsZlE2OEFmbENOcVZNYXpWS3ZxejM4RUF2WTlLRHZoYkxZdTNkZktBaTVU?=
 =?utf-8?B?TC8yN2wrV0ZqZkYxbEt0QUc3TWcxL1dFTzVGUnNwMzdjMGI5OUdsZVVKZVJB?=
 =?utf-8?B?aUZMOU9aUjNvVHdEcXQ0b2RJOEVueW5uLzVlK1lMQTJzUCs5RGFjQ2V2S25F?=
 =?utf-8?B?T1l4d29SeURCYm05c0hmckRsdGkveUxYOWszV08wSzBOMnltdUUxdnNjOVpz?=
 =?utf-8?B?a1QwMmVjOWFYbVNSSmUwRTcyMTBHV2Iyb2wvVjNmVmRYSm9QOFczdkl1dlVX?=
 =?utf-8?B?ZlFTSnRCR05rZGQ2ZnhVdHJMTXlNNDdlUmJYa2Z0alg0M3NNeDhzZ0FFU010?=
 =?utf-8?B?OVB3eGJiOXRVK1c1aGNvZGxDOXFneXhrcWVEL2NIbjFJZExlcjZrQTBPSUVH?=
 =?utf-8?B?YjU3eGF2UTRVNm12MWVWdUpyMmNjczN5OXVBSnpEZ0pvMnVpMk5wc2J4VGdJ?=
 =?utf-8?B?TFU0cDM2RnB3RmJKVW8xR004SWNhZXY3OUZ4RDQxbHJQS2FPbkFHWjlVU2NG?=
 =?utf-8?B?YU9iQ1Q4bkN0dXF2Nm5zVUc0Y2RaQlFkVG1WZzYyUnZmNGNRRlEwVUNBK3c4?=
 =?utf-8?B?T01qVFZpR2RVcktCMTd5UmRhczdWcHUvempjY0phK3g3TUxBTXJZK3JDdUtv?=
 =?utf-8?B?aTJ4T1pRY0QvQjF5NnZIcE1qbC9nQlNLQmk4NHcyWEVheXFDbXJHdzlwYWdo?=
 =?utf-8?B?RHlGNHBUZnlOQ2NXWW8wdVh1Q2NLNHRmd21XSU5CWWQ5bE8xRGVkNWErYXcr?=
 =?utf-8?B?emwwUWNvL3lnWklkZXBtWGZrTmMvbkVlNlVuNC9kSDhjQkIwNThFOWtrdWF6?=
 =?utf-8?B?Q3BEc3IvZ2dMNkt4ZENTQzNSUmlOdnM1dlUzRlA3ZFRRbU0yNlMxSXpvN3lY?=
 =?utf-8?B?RXo5OVVWN2o3NDJYV1R5b3lzS0lsanpDZCt2alJqZVVkUG5VQk9MZUIyUEIv?=
 =?utf-8?B?RGE3MTF3dWIrOUpSeVE2RmNhTUV6ME5nRDJkV1VzcUozMjN2cWI5UnJhL256?=
 =?utf-8?B?TEMybnI3Q08vKzVjdXo1SW90VmMxeStMeHRySXk1VEludTlDRXRyRzRrUmk4?=
 =?utf-8?B?WHdBV2hxVWo0anY2ajN3VWlFRVBoV0VwMFVVNWtXN0d4REk1Qzd4ZHU5REpm?=
 =?utf-8?B?MTVLdXc1c1dKR29pdDQwTjdwWkNQSlF2c2JTeEI2cW8vbVN1NHlKZmtGMEE4?=
 =?utf-8?B?dXZ0QnkxbHpJUW5PeWQwMGtXTE5yVDJML2hlY0dkOWFZMmJKYzFRNC9NaGpz?=
 =?utf-8?B?a3g0bkN3bkxneXVLSmRudWJQZEltQ2p3NHE1TWptTXRmcFhpRjZmUHZrRXRY?=
 =?utf-8?B?eVdWNWp6Y2pVVklBazlwQmVFOVpTb3d0ekRCYnF2enpXc1o3MFZ3THh6TFAv?=
 =?utf-8?B?T2h3WkQ0cnRVRHBFVXZCb2ZieHp2OTNOMm9FS1o5NGVKV09mcWhDcTZBNzZ2?=
 =?utf-8?B?MHVycWRzODNQQUpkMkFJdHJMRUhwdWRCMDhKZVYxd3dUcFo5YzhRN2VMaklB?=
 =?utf-8?B?QUtXRUh0Vm0rOERwM24rSnRudFgxdXE2dmZEWmJROUFrUGVmb0JId1BRN1VT?=
 =?utf-8?B?T1Y5T2xuLzhOM21lR2RUeXM0bEw3YW9lK29zYzBXd29xQmtCTTRjdDZUWnZh?=
 =?utf-8?B?UDViZG9oR0xlemVJWkhTdE9zNnBZTmtxQzkvVTAvMW1CQkd5V0xoUXZUajcy?=
 =?utf-8?B?QjlkSXVCVkNUZGI3cmgxWlZwdnpnRDhYYkJIUFVhTEJzaTNOejdvWjN4UWp3?=
 =?utf-8?B?WTJoa3Jrbk92S1c0dnN6WU8rYWNmb08xU3g3dnd0V0pBSXdPei9YMnBYWUVv?=
 =?utf-8?Q?CcYw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8b51d92-7a87-436c-dc67-08dc29cddfe8
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2024 00:18:58.1170
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NndobLjfjHTFh2Q9hQeAKj3I5ujo4piG9xrCsO0KfLK/NbPPjZ4f3AL/RP2z+acu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB7865
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Feb 2024 00:19:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195250

KnBpbmcqDQoNCi8vUGV0ZXINCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9t
OiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQt
Y29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiBPbiBCZWhhbGYgT2YgUGV0ZXIgS2plbGxlcnN0
ZWR0DQo+IFNlbnQ6IGRlbiAyMiBqYW51YXJpIDIwMjQgMTU6MjENCj4gVG86IFJpY2hhcmQgUHVy
ZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPjsgb3BlbmVtYmVkZGVkLWNv
cmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBDYzogTWFydGluIEphbnNhIDxtYXJ0aW4uamFu
c2FAZ21haWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gaW5zYW5lLmJi
Y2xhc3M6IEFsbG93IHRoZSB3YXJuaW5nIGFib3V0IHZpcnR1YWwvIHRvIGJlIGRpc2FibGVkDQo+
IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogUmljaGFyZCBQdXJk
aWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+ID4gU2VudDogZGVuIDIy
IGphbnVhcmkgMjAyNCAxNTowMg0KPiA+IFRvOiBQZXRlciBLamVsbGVyc3RlZHQgPHBldGVyLmtq
ZWxsZXJzdGVkdEBheGlzLmNvbT47IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcNCj4gPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gaW5zYW5lLmJiY2xhc3M6
IEFsbG93IHRoZSB3YXJuaW5nIGFib3V0IHZpcnR1YWwvIHRvIGJlIGRpc2FibGVkDQo+ID4NCj4g
PiBPbiBNb24sIDIwMjQtMDEtMjIgYXQgMDY6NTIgKzAxMDAsIFBldGVyIEtqZWxsZXJzdGVkdCB3
cm90ZToNCj4gPiA+IENvbW1pdCBmNjczZDNkMjM5Nzk5ZmIxYWI1MGY0YWE1ZDQ0MTg3NjY2YWEw
Y2Q3IGludHJvZHVjZWQgYSB3YXJuaW5nIGZvcg0KPiA+ID4gdmlydHVhbC8gYmVpbmcgdXNlZCBp
biBSUFJPVklERVMgYW5kIFJERVBFTkRTLiBNYWtlIGl0IHBvc3NpYmxlIHRvDQo+ID4gPiBkaXNh
YmxlIHRoZSB3YXJuaW5nIGJ5IHJlbW92aW5nICJ2aXJ0dWFsLXNsYXNoIGZyb20gV0FSTl9RQS4N
Cj4gPiA+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBLamVsbGVyc3RlZHQgPHBldGVyLmtq
ZWxsZXJzdGVkdEBheGlzLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gIG1ldGEvY2xhc3Nlcy1nbG9i
YWwvaW5zYW5lLmJiY2xhc3MgfCAxMyArKysrKysrLS0tLS0tDQo+ID4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDcgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IFdoaWxzdCBJIGNh
biB1bmRlcnN0YW5kIHdoeSB5b3UgbWlnaHQgd2FudCB0byBtYWtlIHRoaXMgY29uZmlndXJhYmxl
LA0KPiA+IEknbSBub3Qgc3VyZSBpZiBpcyBhIGdyZWF0IGlkZWEgc2luY2UgcGVvcGxlIGFyZSBq
dXN0IGdvaW5nIHRvIHR1cm4gaXQNCj4gPiBvZmYgYW5kIGNvbnRpbnVlIHRvIGlnbm9yZSBpdCA6
Ly4NCj4gPg0KPiA+IHZpcnR1YWwvIGluIHRoZSBydW50aW1lIG5hbWVzcGFjZSBoYXMgbmV2ZXIg
YmVlbiBzdXBwb3J0ZWQgYW5kIGFsd2F5cw0KPiA+IGJlZW4gc3Ryb25nbHkgcmVjb21tZW5kZWQg
YWdhaW5zdC4NCj4gDQo+IFdlIGRvIG5vdCBwcm9kdWNlIGFueSBwYWNrYWdlIGZlZWRzIGFuZCBB
RkFJSyBpbiB0aGF0IGNhc2UgdmlydHVhbC8gd29ya3MNCj4gZmluZSBmb3IgcnVudGltZSBkZXBl
bmRlbmNpZXMgc2luY2UgaXQgaXMgb25seSBhIG5hbWUsIGp1c3QgbGlrZSwgZS5nLiwNCj4gdmly
dHVhbC0uDQo+IA0KPiBXZSBnZXQgYSBnYXppbGxpb24gd2FybmluZ3MgZHVlIHRvIHRoaXMgZHVy
aW5nIHBhcnNpbmcsIGFuZCBpdCBpcyBub3QNCj4gYW55dGhpbmcgSSBjYW4gc29sdmUgZWFzaWx5
LiBBbmQgc2luY2UgaXQgaXMganVzdCBhIHdhcm5pbmcgdGhhdCBjdXJyZW50bHkNCj4gZG9lc24n
dCBhZmZlY3QgdXMsIEkgd291bGQgbGlrZSB0byB0dXJuIGl0IG9mZiBmb3Igbm93Lg0KPiANCj4g
QW5kIGFzIE1hcnRpbiBtZW50aW9uZWQsIHdpdGggbXkgY2hhbmdlIGFwcGxpZWQsIHRob3NlIHdo
byB3YW50IGNhbiB0dXJuDQo+IHRoZSB3YXJuaW5nIGludG8gYW4gZXJyb3IuIEFuZCBiZWluZyBh
YmxlIHRvIGRvIHRoYXQgaXMgdHlwaWNhbGx5IHRoZSBvbmx5DQo+IHdheSB0byBhY3R1YWxseSBn
ZXQgcmlkIG9mIGFsbCB3YXJuaW5ncyBhbmQga2VlcCB0aGVtIGZyb20gY29taW5nIGJhY2suDQo+
IA0KPiA+DQo+ID4gQ2hlZXJzLA0KPiA+DQo+ID4gUmljaGFyZA0KPiANCj4gLy9QZXRlcg0KDQo=

