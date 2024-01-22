Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEA05C4725D
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 14:20:41 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.49])
 by mx.groups.io with SMTP id smtpd.web11.75089.1705933239219114968
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 06:20:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=FZ3/Z9Xk;
 spf=pass (domain: axis.com, ip: 40.107.22.49, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A8yYJNeqtytM29OOZ4wd0VXRCSR08O9lxoC8fpufcVTCdOVOA93ZRzFwWKtIP/z5+PvO+nRYBN2zXeB1lEMEonYt6k7Q3L+IS2DRlOIeWHeAiWP7qLyL90tzV9w+eGI2S3JjVJ3Wk/s3d9s8oW9TJhOVzRyCWmLlhYTpr7k780wCx9GVjmx1y9pChkXwYUXi7Pg0avqsILbduEf94hNeJAqGJLy1vzbNqM1IC1M0NWfhNU02mbpo5xNnOENvrWmr8+KZvxd51dp2UrcXN9tSh8X5xZTuN6PFDY+eW/DsyYOHhujJCcBxEP0Sc6QkF/EoD7H4tlXagsAFvpeWg9rc4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wDIPyPhBwxtWzMTBE8WFoAcK1Gh7LLWNqOdlSkJG0Ek=;
 b=KYrlC/Z0/5U+ZA6q6EM7qoIiCVeVQlS0I8W7lVNUKLmYY3+IzozXvOAQCx2xosnoFisAV2nWNgJMsZTC3Ni5Xfr3DLDQAOaw0ph/DMCVTJz+zzcVmPedVAFMrFThs9M1ZFuXLjn+unyRBlX5lMhBku0SPq6ckwA4nLWHbNNQIKKM7zIsfWoceOgQX8wP+pOdMVPWIWFn1JAG59OvZd+JgKDnwAAAEbpWUZrYWxNQHiGiBjhSlc5A+mNRVWD1LUDjj9pV3zmt8f5fqt2J8JEQWQxANs2MChw8htoxAbdQv/wWB/4wS3eonGMZMrbmOKfqJFG7HVu8nRJtvZgr8Ov1PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wDIPyPhBwxtWzMTBE8WFoAcK1Gh7LLWNqOdlSkJG0Ek=;
 b=FZ3/Z9XkNUC5sRVFLgBwvDuhs8ONz9o2R3dqOTsYdDGF77NPhfI2EufiLP08YunhWU6aqIJd9qrzSnlsz5qe8Ge3eHp/0oKqZnT0bTMo1sXZThXDLOPIpQ4qFH4SzdCyC6gLRhTLVo4KqHQ6darv9OSy0ouNaKnuVP6VJR2HKCc=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by PR3PR02MB5993.eurprd02.prod.outlook.com (2603:10a6:102:64::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Mon, 22 Jan
 2024 14:20:36 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::7d13:15f0:2292:6962]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::7d13:15f0:2292:6962%7]) with mapi id 15.20.7202.028; Mon, 22 Jan 2024
 14:20:36 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Martin Jansa <martin.jansa@gmail.com>
Subject: RE: [OE-core] [PATCH] insane.bbclass: Allow the warning about
 virtual/ to be disabled
Thread-Topic: [OE-core] [PATCH] insane.bbclass: Allow the warning about
 virtual/ to be disabled
Thread-Index: AQHaTTuh/s3PHFJ2oEW2SQnUVmz/VbDl3c9w
Date: Mon, 22 Jan 2024 14:20:36 +0000
Message-ID: 
 <DB5PR02MB10213DE1C4CB9CCB36A027897EF752@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240122055232.2415989-1-pkj@axis.com>
 <f1722e2db188a3aec3ccc23fb573eaf2cae47eaa.camel@linuxfoundation.org>
In-Reply-To: 
 <f1722e2db188a3aec3ccc23fb573eaf2cae47eaa.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PR3PR02MB5993:EE_
x-ms-office365-filtering-correlation-id: 2c5909ff-12ed-45f0-ef4b-08dc1b554d72
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 x04KbVVLpLH/V6UrsJwL4wGiwtE92PnIeW4XIWFO3EitQnzds/px2aml8hn7dyVWDH7WnrWjLf2T6DbT9JbNsqBC/YLZiOj0aXWeW5qvBR8LxQR4sdeBhp25f1VtGTrUz6lJoUPr14Pv+ikHlfNxZ4YoVjQblEOA+CB+dAM5P0KOrZ1CekEhVVWxcinnGZGXZyv34VWAWCuKH+v+uJ2qhOJ9UBV/zAWxNyph8b3xtf1UCyqm8Elxdywp8F2nFX978EDJFwsTOG5oupwVsH7N2LYDFfXtnBragydCygd0gnov5V5uYKUvYDDbBsBYfbrw95/oJNhRE2j1f5ppHsAhJYyA0ATN0R252S67BCwpDl5MlIprZsg1xJsuvtbBHqiVRu/UjH7Jvm1lrKTt8qV6vWZXJco0cNOujtDo3rATp6oRKzr0h/mQvXtC1nBKuTk6rmp4A3QbXRcM73tHLCTIitmUBEWFXtmb9icJGj1Dbu/0eRQvKG0sgtANUckCHQTNkUcv/kTmiWozGfxsFtQ1Bj/+86lbrdVvN53TcEyeIYbjkoQ5mQDEnmV/ln9mNwrPQ08FG3GOv/szOGi+49x+SG7qLMLpILO3OPmoPX5vYkALOgJFh18UROlfLwRpWQVOzCMqOhXJaDJL6+OYMDTKd34JsOVRmY4qMlcSuFjQdeg=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(136003)(346002)(39860400002)(396003)(230273577357003)(230173577357003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(55016003)(9686003)(6506007)(71200400001)(26005)(53546011)(7696005)(86362001)(38100700002)(38070700009)(33656002)(41300700001)(52536014)(4326008)(8676002)(8936002)(2906002)(76116006)(5660300002)(44832011)(316002)(83380400001)(122000001)(478600001)(66556008)(66476007)(110136005)(64756008)(66946007)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Tmp2aFc3N0dBNXZUWmtLcG43amtOL3VvUnQ3dlZpc0w4UEZGL0wzYXFXTDh1?=
 =?utf-8?B?WjNrY3UranVaN3oraDVFQnBncFJCS2NNZlFLSzlNT3k0Mm0ya1lQc2d5NlY4?=
 =?utf-8?B?QzIwWTN4cWQvaWNiS3Z5amQrdHVEQTIwMUR3cm96Q2o1dU00SzNNVVhaQURy?=
 =?utf-8?B?eUd1MnhGMlcwdWN3eDZTUDZnSllydlg2MnFybWZoV1Y0QlVCMmRsZGdBWVNG?=
 =?utf-8?B?aFlnQzlrL0dkTFNvbi9EUFRyZ01XVWFOK24vOXJkMENmbnhYZVBobDdSNS9m?=
 =?utf-8?B?djBmdlgwWmVwbXVyc0Z3L0h2eDM3WklpWGJKL2NkQlpvdTBUeTNrb25VYktO?=
 =?utf-8?B?WVo2QTUxaU9NMHVnOXlmV25rVmhLTkRJb0RXbjMzZElWQWJ4YW1KMkVWc1ND?=
 =?utf-8?B?Z2FDMVJOL0JlL1ZRSnI1RjlUc3l3SEYzaGgrYUJ3QjhqYkR4VytVbDc3Tkl6?=
 =?utf-8?B?VG50UlBJVkFodzMyUFh0QjMwTVZHMENiUjA1ZGcyWWIrbG85ck4xL1ZORkZm?=
 =?utf-8?B?b0V5MWUxVmhZSTJyQXdCT1BzME9CZGR6a3VaSXVvWWdoR1c5UDZYYkpJdG5Q?=
 =?utf-8?B?Tm9oNmFmQUVxSVRNbGE1dFg2RktJQTkxS1NqUWt5UzRUN0tvZVh6dlNyQlU2?=
 =?utf-8?B?RldSV012RWhDbUwxUWlpQkg0SlFkSkdqdWVXaExjNHFlc2xCMU42dDUyWWZk?=
 =?utf-8?B?d2xzNFZ1OE5SRnR4REh2U3RYN2s4bkpoWnFveWRhTU9SY3EyeU9yL1dxcU5T?=
 =?utf-8?B?TlNlYzJCcjBCUE0yRnNPWUJLUVRzeS9wbGgrNThSZmVrNmpQSFAra1puY2R4?=
 =?utf-8?B?aEUzN2RId1ZtY1U4bmJoTGdPZThmQmJWSHJmeHZhbHlOWTJwcHVyMDVPdlpw?=
 =?utf-8?B?dTRHUmVrYmVRSG5GMWFoS2J2NXB5ZTZKMzhZT05CdDY2L3crUFoxSkJKVExK?=
 =?utf-8?B?dlQ3M01pOFJ6UjVDK1pPM3ZGUkw4Q1duMnI4cDJkeWs2djN0ejFuNzFRcnlY?=
 =?utf-8?B?SWVYQjdxMjlraENrRVpYenVTc0lGZ2hCTEVPbGkxc0RIcndOTlI3Q0h4TVlj?=
 =?utf-8?B?YTN2T0Z2VW9GUmlzQlM2SXB4L3JjRUlaWUVtU3pSVlpSZXRIbDhZeXk3RDNF?=
 =?utf-8?B?WGQ4N1A3cXVBUExta3dHcklSOUpMN2c0MkZvOWtaSXFpYy92QUxUVHVOdi9K?=
 =?utf-8?B?SGsxNlVFOWdYblBaZFV0eTRNZGJ4MExRUU5QYXRsMC80c3l6ZnA4by9lTEVM?=
 =?utf-8?B?V3V2eG1XRFdodVRabjAyN3pLRlVyTWJyVlhYbkkvWTRGVnYyRWtaU0huTGMz?=
 =?utf-8?B?dGZidVhJRlIwd0U3dUlOTUJKVVAweFFsWjV1d2hGbm9sK2FiTy84bW44aXdS?=
 =?utf-8?B?WjRSREpkemYxVWxUM0ZjbXExVkJzWFp4ZktFM0dRRkExWld0S25zODR0SE00?=
 =?utf-8?B?c1cxQkxEM2dQZWJFYWMzSFJHVll3UWlwTU5QcnlvN3JyTElXYm9ZTVZMRXpk?=
 =?utf-8?B?ZkhZNlVFTE5CNzJwdjFMbVZ5Z0JWS2p3WktRUk9nTFJyY3BsTG5RNzZRN3FQ?=
 =?utf-8?B?b1dJcnN6TXJYQklUMk5nOGpvbU05L2NMWmY5bmNlR2VVUTRPTURmZDhoeG5n?=
 =?utf-8?B?ZEwwajFjTXJPd1dBS2VzQkp1YVBkZXB4azZFSlRvN0xBTUd6Y2pKdURIemh1?=
 =?utf-8?B?Zm96WXoyS0Z3N2ViOE9VODNRZ3h0SVNlYjBXVFhrKzJHL3FoQUFWVzk4aDNS?=
 =?utf-8?B?QXc3T001M0dSYXY0ZWE0aWhuRTZyOWkwUHlRTEliNEZuNCtZZW1tbWlpa203?=
 =?utf-8?B?cE1pRUtnSFV0RE1ZN25FSk0zWWhldFM2WGtXR3NidUdQNk1QbmF0TnZ2QVZN?=
 =?utf-8?B?S0tLbEtZZ3JYM0cvcnM4MDVub2pVV1pyQ0JqRVBwaVVyUDBzUnREL1NYVXdP?=
 =?utf-8?B?blpBSmRHWmowMDQ1enRBUzNtdFpZYTZlTlBWUVNCb1ppVUducGRBeXk0TXVn?=
 =?utf-8?B?dzRiRVhsN3RSL01taHJmdExPeUxXbWlONFdSLytySURvQzJOeDhhNWhEaTdV?=
 =?utf-8?B?U1htTmdJSW1WN2JUN21FbEVvOHkvVGlaNWZxR0FOYzQ2NS9UK091TDFkK2c4?=
 =?utf-8?Q?nXiI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c5909ff-12ed-45f0-ef4b-08dc1b554d72
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2024 14:20:36.5133
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pz7WkhF5LNNfu1ZF7VJbQdR430yR3DQFKDC/jKXxAihCZODHHTdovFfkRaX10448
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR02MB5993
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 14:20:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194168

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmlj
aGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gU2VudDogZGVuIDIyIGphbnVhcmkg
MjAyNCAxNTowMg0KPiBUbzogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRA
YXhpcy5jb20+OyBvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0K
PiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gaW5zYW5lLmJiY2xhc3M6IEFsbG93IHRo
ZSB3YXJuaW5nIGFib3V0DQo+IHZpcnR1YWwvIHRvIGJlIGRpc2FibGVkDQo+IA0KPiBPbiBNb24s
IDIwMjQtMDEtMjIgYXQgMDY6NTIgKzAxMDAsIFBldGVyIEtqZWxsZXJzdGVkdCB3cm90ZToNCj4g
PiBDb21taXQgZjY3M2QzZDIzOTc5OWZiMWFiNTBmNGFhNWQ0NDE4NzY2NmFhMGNkNyBpbnRyb2R1
Y2VkIGEgd2FybmluZyBmb3INCj4gPiB2aXJ0dWFsLyBiZWluZyB1c2VkIGluIFJQUk9WSURFUyBh
bmQgUkRFUEVORFMuIE1ha2UgaXQgcG9zc2libGUgdG8NCj4gPiBkaXNhYmxlIHRoZSB3YXJuaW5n
IGJ5IHJlbW92aW5nICJ2aXJ0dWFsLXNsYXNoIGZyb20gV0FSTl9RQS4NCj4gPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IFBldGVyIEtqZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29t
Pg0KPiA+IC0tLQ0KPiA+ICBtZXRhL2NsYXNzZXMtZ2xvYmFsL2luc2FuZS5iYmNsYXNzIHwgMTMg
KysrKysrKy0tLS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA2IGRl
bGV0aW9ucygtKQ0KPiANCj4gV2hpbHN0IEkgY2FuIHVuZGVyc3RhbmQgd2h5IHlvdSBtaWdodCB3
YW50IHRvIG1ha2UgdGhpcyBjb25maWd1cmFibGUsDQo+IEknbSBub3Qgc3VyZSBpZiBpcyBhIGdy
ZWF0IGlkZWEgc2luY2UgcGVvcGxlIGFyZSBqdXN0IGdvaW5nIHRvIHR1cm4gaXQNCj4gb2ZmIGFu
ZCBjb250aW51ZSB0byBpZ25vcmUgaXQgOi8uDQo+IA0KPiB2aXJ0dWFsLyBpbiB0aGUgcnVudGlt
ZSBuYW1lc3BhY2UgaGFzIG5ldmVyIGJlZW4gc3VwcG9ydGVkIGFuZCBhbHdheXMNCj4gYmVlbiBz
dHJvbmdseSByZWNvbW1lbmRlZCBhZ2FpbnN0Lg0KDQpXZSBkbyBub3QgcHJvZHVjZSBhbnkgcGFj
a2FnZSBmZWVkcyBhbmQgQUZBSUsgaW4gdGhhdCBjYXNlIHZpcnR1YWwvIHdvcmtzIA0KZmluZSBm
b3IgcnVudGltZSBkZXBlbmRlbmNpZXMgc2luY2UgaXQgaXMgb25seSBhIG5hbWUsIGp1c3QgbGlr
ZSwgZS5nLiwgDQp2aXJ0dWFsLS4NCg0KV2UgZ2V0IGEgZ2F6aWxsaW9uIHdhcm5pbmdzIGR1ZSB0
byB0aGlzIGR1cmluZyBwYXJzaW5nLCBhbmQgaXQgaXMgbm90IA0KYW55dGhpbmcgSSBjYW4gc29s
dmUgZWFzaWx5LiBBbmQgc2luY2UgaXQgaXMganVzdCBhIHdhcm5pbmcgdGhhdCBjdXJyZW50bHkg
DQpkb2Vzbid0IGFmZmVjdCB1cywgSSB3b3VsZCBsaWtlIHRvIHR1cm4gaXQgb2ZmIGZvciBub3cu
DQoNCkFuZCBhcyBNYXJ0aW4gbWVudGlvbmVkLCB3aXRoIG15IGNoYW5nZSBhcHBsaWVkLCB0aG9z
ZSB3aG8gd2FudCBjYW4gdHVybiANCnRoZSB3YXJuaW5nIGludG8gYW4gZXJyb3IuIEFuZCBiZWlu
ZyBhYmxlIHRvIGRvIHRoYXQgaXMgdHlwaWNhbGx5IHRoZSBvbmx5IA0Kd2F5IHRvIGFjdHVhbGx5
IGdldCByaWQgb2YgYWxsIHdhcm5pbmdzIGFuZCBrZWVwIHRoZW0gZnJvbSBjb21pbmcgYmFjay4N
Cg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gUmljaGFyZA0KDQovL1BldGVyDQoNCg==

