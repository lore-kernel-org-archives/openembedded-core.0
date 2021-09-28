Return-Path: <bevenson@melinkcorp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC0F6C433F5
	for <webhook@archiver.kernel.org>; Tue, 28 Sep 2021 19:01:02 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.127])
 by mx.groups.io with SMTP id smtpd.web12.917.1632855661391101047
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Sep 2021 12:01:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@melink.onmicrosoft.com
 header.s=selector1-melink-onmicrosoft-com header.b=JgQjUKhh;
 spf=pass (domain: melinkcorp.com, ip: 40.107.92.127,
 mailfrom: bevenson@melinkcorp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S3kl1FW5fu6T26/83zgJE+d1VCvk5dPAlEBPdS2wDnnd4/NSp7hBGMmcJZCdZidXL7x67eSvPIB0IIjPhMz2lAG4NY/icdE2f4qCOUvnadqli+hDAs07GepzSiVSr3dJ0/TZ+b8HCB1BUGv4A5E+Nb1VHyENZSjKJIcdc0IBjYAth8Ip/6S4fSRgX59pyT5eLQBS3SxsMrUlzzU/CoDSnr4KUEKHyEeofo0iXzvXRKSeDrFFw2/H3xRJviV99DCaZPddNkeNOskL9icLvXdTwX3mMl31tzaiWn6LdT7GPZkueaCNxfp+tDgqHgepaUd1bQW1C6B2RDGG3obKbRI6jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=xDc//rmKfAPfMwGzuX0GfmYU4ywok0UXGrNmF9Hes4I=;
 b=U2b2JhSnFKatz7lfnMbvFo4cOnMqLOdGgSHBkT3Fal2fbf4eGoFAgpp11TqisrjQUkonIwrtg/i5kVJn4YGLdKvF+9Hox1LfXZv75FQTBTX4IrX2/6NP5RqpuyU91msm2Pr+qgm1aXqyLg1u2UNt/CvpyPCF3Zu2uUtsKRTzlYzlFPWSUu/U9zChSlz2glJzvZ690mmZNeD5uHoM2WIQT5fX5Vb2iHNb/E4y2fTerjnKPcxkjDP2v75rDOC4yLfHh5oKfd420VNQxRx1R70a4R/PXEdQdbFLLcql5Td4K1s1SBKicPaoXZXa2ihLeBzwbCX0NKfo16f2QIg52d+Nmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=melinkcorp.com; dmarc=pass action=none
 header.from=melinkcorp.com; dkim=pass header.d=melinkcorp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Melink.onmicrosoft.com; s=selector1-Melink-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDc//rmKfAPfMwGzuX0GfmYU4ywok0UXGrNmF9Hes4I=;
 b=JgQjUKhhGQMaDWST8F4piFv+Ky1uC/iwfd/rPOBc+6yB7j/MeuaDATU7EqemtHQQIVJjHwkpNfkrHtYq0eLmPpLeda2KNDPXMOANDDWvNjYjI72MBmbuCtK1kWutgi/6vFNbJqq9r4fQWSWE64SXcseplsYK1dVSkdKVDg2w8XXwCn5Y5KfWyZIP3GCSCMsGjvsuzQH2Qh28o21oDrc/Xt3ZLHtZo5GOdcfY4MTJqk/ZU05XSyEJxuJGNlheskg9Of1HpC8T6Y6mxPfdVxLXkXTVbukE9GGLNlxdW3OudcRRhVMJAdRKH1NWqu8gPxv7P3iM64BczLH223x/ByavHg==
Received: from CH0PR20MB3948.namprd20.prod.outlook.com (2603:10b6:610:c6::22)
 by CH0PR20MB3947.namprd20.prod.outlook.com (2603:10b6:610:c9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Tue, 28 Sep
 2021 19:00:59 +0000
Received: from CH0PR20MB3948.namprd20.prod.outlook.com
 ([fe80::f002:4a83:9bb6:f33d]) by CH0PR20MB3948.namprd20.prod.outlook.com
 ([fe80::f002:4a83:9bb6:f33d%6]) with mapi id 15.20.4544.022; Tue, 28 Sep 2021
 19:00:58 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] binutils: compilation error 'unknown pseudo-op: `.l`'
Thread-Topic: [OE-core] binutils: compilation error 'unknown pseudo-op: `.l`'
Thread-Index: Ade0dPErc6hpxrTpRla0paDgkYmB+gAI2VWAAAAwZrA=
Date: Tue, 28 Sep 2021 19:00:58 +0000
Message-ID: 
 <CH0PR20MB3948DCD7B31C7C60F88A967FBBA89@CH0PR20MB3948.namprd20.prod.outlook.com>
References: 
 <CH0PR20MB3948E4BB526801B6B1E0B7F6BBA89@CH0PR20MB3948.namprd20.prod.outlook.com>
 <CAMKF1srwXtLOz8HSKraL1C=2M61Mqu5AX7-J6OLGRtK_AQRHbw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srwXtLOz8HSKraL1C=2M61Mqu5AX7-J6OLGRtK_AQRHbw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-bromium-msgid: a7e29e3f-6103-41f0-93e6-6849ed99282c
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=melinkcorp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5ea16ebc-4e44-483b-dd15-08d982b24ee1
x-ms-traffictypediagnostic: CH0PR20MB3947:
x-microsoft-antispam-prvs: 
 <CH0PR20MB3947B8010EBFA9A8EE25EF9EBBA89@CH0PR20MB3947.namprd20.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 KXNVIMUn0SMBoX0X732CdZL89/MHpp/yeAnxIXz0Co8X1JTehgkwKbRVtpnyRlvUurXgB5Mb0JHg3k8Qvpu7zmgwiZ/PJw60R7yw6d0dHlvQJrnpQd12yf6R3iMdA1WD0OvM2GArYcbAm59MQSshL9Xte7HJw2dt5p5HVJeZJeEpt0OSSWMkIHTl+spEjiausSp2imALcHj1czY0s5vs9ABJyoTLUmW8Aer0X7gKmZ7NEJApH8Z46m4p9nUibUVFXjUUkkBuVxWTphE0gjj/MVM2czcFOYD5cnjBetnnVAVCMa9DPf8/pTZju6HWO6jIHmkx0Y7cAR+3FLJsqI4agCgi4E26AKmuGIqq3r2amnqk0We+PIH0kfj7AN79vWNc9JA3ryIx3UR6XDDQzJWpdknWsgxqEQlkhQEUrEHoSqWnZgERERSuM6Yf/4jnESMQui/e8IWcLBjzal2obkxunnUDtElP3eVk7dR3DDTcXIdYhCZ8gFTUO6i95U8yHkJ8Hw2OF/K0+Dru3T0NUn7gqInjtxOusX8xn+ZC7iAgvIY/0tVT4Qn2c9elIIiaPhlhLmuz7G9bmxQ5Tt/HSJLFjz0GXG7iegqkd/dDoWLKMIHym7eVwdfAiASg4P/vKO3hkaUpSj7e1hEbx+8CeqFcbCDYHvY86NE1PAuDbe/+ommE0dONGrnZ0r92WDT1kgY55v62JBy1XN63+1JqMLbkj3aehSFq8GhMBOsf8vc9b/bnk0YVJrIcg/pq3iBcLiqs2GxBla4cXMstscn4t0NHN9JjKeHRsBOXdcB4Qf7yeXydsEc7MpObjjHGSd9gcm5Ltg+tAMg5dG1ZJLQr3Cj2LLExQmaruZG3fteP/z5Oq6DOI+fOeRDY3i00ViuGn3n+
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR20MB3948.namprd20.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(376002)(366004)(39840400004)(346002)(83380400001)(8676002)(26005)(6506007)(66574015)(5660300002)(38070700005)(53546011)(186003)(55016002)(7696005)(71200400001)(966005)(9686003)(66556008)(64756008)(316002)(86362001)(76116006)(52536014)(4326008)(8936002)(122000001)(33656002)(2906002)(66476007)(66446008)(66946007)(508600001)(38100700002)(6916009)(81973001)(414714003)(473944003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TDdYQ09LZEoxNW9PUEJsQXg1ZkRqS0VLSzJ6ODM4QTFmbnZTZm95MVkzTTVp?=
 =?utf-8?B?K2VPUlV3TjlZcHY4WlZzRU52c1VReng5UFdSbTR5NnhZa2JFblNKSGdRUGxu?=
 =?utf-8?B?MEdic2FQWThxRVhpQ3lQV3NaSURVb2pNK0paVGRZbUdlSWhHYTNKQXUwVVQx?=
 =?utf-8?B?eGE0SlhSNzEyb1VCRXpGVHBLamxnMjdkMnBLSTlhT3gzTC80dDdKZjBrU25P?=
 =?utf-8?B?N3M1RFZaTS9UQjZUajJsN29MOER5T3JMNEw5SFBkaXZONy9BdzlqcjJ1SlRQ?=
 =?utf-8?B?bHM5VUxzM2RmU1pDTFFDMm1rNWhzKzBWaXFJQ1JHYWZHbVhob3NzcldNUUZM?=
 =?utf-8?B?QWx1TXZ5djhpQ0dUL001eEc0WmhIb0YrVlhuQ2lGVHpCb3pUZFdJbWV6UWNQ?=
 =?utf-8?B?TmFoaFhvUzdRbHJOWVRxMEJTOXdsMnplVW52eFpUY0Z6ZGFGV3F4V21FTTYx?=
 =?utf-8?B?QUM0OHNHbUJtWlhwSlJWbzVqS2FUcytHZ082TkV1SzR6NFJzb3NXQ2tPMGtl?=
 =?utf-8?B?RDJ2R291WTVYbllGMkNPNHNnelI0S0o3QkRzMjIycFNrRkpHSkFTaWI2cnRO?=
 =?utf-8?B?c2c2RjhtVDJzdzluLzRic2JodWtUdnZnaXIzbG1vQWJ0V0UzN2E5bjMwNW5w?=
 =?utf-8?B?VGdWeFFZbG44Y0xvZ0l0WGRoKytqclVQR0pqWFVSaDBEUXo3UDhXUjhzOVlM?=
 =?utf-8?B?QzQzQlhaYzMzYS9DRzE5V2FNanRpV3VCSlFvVUZQWmJHZC9nNkljMXdPa0JF?=
 =?utf-8?B?OGFBaFh3eGJwNE1POHo2dkNJcnE1Nkp5OUNNZUp3UWhpMmhSUDNZbSs1S0lk?=
 =?utf-8?B?VTh5T1Jxb1NLYjNrdENsYnp6Y1NYN3dGaTBUSnV1UFJrbEZHWCtNVzNmRTZa?=
 =?utf-8?B?UU9TZ01iaE5aY2RmaitxTDFKaUdwTUtFTWNrdDg4NUo4djVTT3pnSTBMNy9r?=
 =?utf-8?B?SkxDYmllQ2NXLzhZODZCaE9hcG92c28wbmhHbUdMSFlOMVdOU3pYNGFubWpL?=
 =?utf-8?B?UWtjV1o4Si9BYUxVOEF0VXJVZkcwZ0pQeEVZblo3Z2pvb0hEdjJDVzdRZlJ5?=
 =?utf-8?B?Yk80dXR2Qjdhd2dqYmRWeWwrUy9VZ3JPdzQ0RDljMmNaSSszRHo0Zm90Q01R?=
 =?utf-8?B?V1Q5ZktDRWpvVGRFMDF5RVFPdkdCbW9zYUhuNGFXclhhTVBqcllYQXZBMlll?=
 =?utf-8?B?L2x6ZEl6SzZmY21MU09WL3FKNlE3d2RpbzU3RHh0QnFCYVBjUlBybXpVekh1?=
 =?utf-8?B?WnJ5Q3B0dWpkdWtOb2RhM3crV01kWkkwbWo4dGJOZ0VHMnBqVFc2blJVS3ZV?=
 =?utf-8?B?RzlqT1pCczdLL1laellUaG5sNHQ0bnNjdStuU3MralptVnVGeXJLU3VzU1gx?=
 =?utf-8?B?N3BpZ1p6bWRiTEovejhrWmJJZlduRytqWUl2dmg3S0dWeFNpMkEvOGRJbnBG?=
 =?utf-8?B?ZGVyOWtid0tXcUcwVk4xTDZUUXJRRXNKdnRVd1c4NlF0UzFRQ0hUd1F4UFZp?=
 =?utf-8?B?SWN6b1VpQXJuaFZjMldNMHE3UTA2UXRSTjBvRDYyMkR1ZFllRVpxZUlsZ3VJ?=
 =?utf-8?B?Y01EQnd1bktxUGRjMndtY0hoRFJteG9zSnhXWnI5eWN1bTM3TUloSGdwbXZ2?=
 =?utf-8?B?a0Z4bS9hZ3FpRW95UndMclhNQ0svQzhIOXB0N2FQd1UyMXVhRlRpemZkLzZF?=
 =?utf-8?B?NXFzdWdzejE0K1hsYVRTN0oyN2p4RDZYMTExa0VscFg1bGkxNVJnVjgwSCtq?=
 =?utf-8?Q?03U0Yi2b2ApciUSsMGEQ2it3Tm3OSNEsspupow8?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: melinkcorp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR20MB3948.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5ea16ebc-4e44-483b-dd15-08d982b24ee1
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2021 19:00:58.7466
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d06db0f9-efcc-42b5-9f8c-c934a01c9bfd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 IiQng7R4QENgw93Oo3AdzGH5dCeU4cJ216JF3/gnOiMAW1zofVizUqLPF2a3qli4d5gsszOFfjzi3UEeBxkXgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR20MB3947
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Sep 2021 19:01:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156429

S2hlbSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLaGVtIFJhaiA8
cmFqLmtoZW1AZ21haWwuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBTZXB0ZW1iZXIgMjgsIDIwMjEg
Mjo0MSBQTQ0KPiBUbzogQnJ5YW4gRXZlbnNvbiA8YmV2ZW5zb25AbWVsaW5rY29ycC5jb20+DQo+
IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6
IFJlOiBbT0UtY29yZV0gYmludXRpbHM6IGNvbXBpbGF0aW9uIGVycm9yICd1bmtub3duIHBzZXVk
by1vcDogYC5sYCcNCj4gDQo+IE9uIFR1ZSwgU2VwIDI4LCAyMDIxIGF0IDg6MTEgQU0gQnJ5YW4g
RXZlbnNvbg0KPiA8YmV2ZW5zb25AbWVsaW5rY29ycC5jb20+IHdyb3RlOg0KPiA+DQo+ID4gQWxs
LA0KPiA+DQo+ID4gSSBoYXZlIGEgQVQ5MVNBTTlHMjUgYmFzZWQgc3lzdGVtIHRoYXQgaGFzIGJl
ZW4gYnVpbHQgYW5kIHdvcmtzIHVzaW5nDQo+IHlvY3RvLTIuMiAobW9ydHkpLiAgSSBhbSBpbiB0
aGUgcHJvY2VzcyBvZiB1cGdyYWRpbmcgbXkgYnVpbGQgdG9vbHMgdG8gdGhlDQo+IGxhdGVzdC4g
IFRoZSBidWlsZCBpbWFnZSBpcyBhIGN1c3RvbSBpbWFnZSB0aGF0IGlzIGJhc2VkIG9mZiBvZiBj
b3JlLWltYWdlLQ0KPiBtaW5pbWFsIHdpdGggYSBmZXcgYWRkaXRpb25hbCBwYWNrYWdlcy4gIEkn
bSB1c2luZyBVYnVudHUgMTguMDQuMDYgTFRTIGZvciBteQ0KPiBob3N0IGVudmlyb25tZW50LiAg
SSdtIHVwIHRvIHlvY3RvLTIuNy40ICh3YXJyaW9yKSBhbmQgSSBoaXQgc29tZSBidWlsZCBpc3N1
ZXMNCj4gdGhhdCBJJ20gbG9va2luZyBmb3Igc29tZSBoZWxwIGluIHNvbHZpbmcuDQo+ID4NCj4g
PiBIZXJlIGlzIHNvbWUgYnVpbGQgY29uZmlndXJhdGlvbiBkZXRhaWxzICh3aXRoIGRldGFpbHMg
SSBkb24ndCB3YW50IHNwcmVhZA0KPiBvdmVyIHRoZSBpbnRlcm5ldCByZW1vdmVkKToNCj4gPiBC
dWlsZCBDb25maWd1cmF0aW9uOg0KPiA+IEJCX1ZFUlNJT04gICAgICAgICAgID0gIjEuNDIuMCIN
Cj4gPiBCVUlMRF9TWVMgICAgICAgICAgICA9ICJ4ODZfNjQtbGludXgiDQo+ID4gTkFUSVZFTFNC
U1RSSU5HICAgICAgPSAidW5pdmVyc2FsIg0KPiA+IFRBUkdFVF9TWVMgICAgICAgICAgID0gImFy
bS1wb2t5LWxpbnV4LWdudWVhYmkiDQo+ID4gTUFDSElORSAgICAgICAgICAgICAgPSAiYXQ5MXNh
bTl4NWVrIg0KPiA+IERJU1RST19WRVJTSU9OICAgICAgID0gIjIuNy40Ig0KPiA+IFRVTkVfRkVB
VFVSRVMgICAgICAgID0gImFybSBhcm12NSB0aHVtYiBkc3AiDQo+ID4gVEFSR0VUX0ZQVSAgICAg
ICAgICAgPSAic29mdCINCj4gPiBtZXRhLWJhY25ldCAgICAgICAgICA9DQo+ICJtYXN0ZXI6NDll
YmRlOTI2OWU4NTMzYThlNGNlOWMzMzVhZGRjZWQ2YmZiNzliNiINCj4gPiBtZXRhLWF0bWVsICAg
ICAgICAgICA9ICJ3YXJyaW9yOjEwMmQ5MmJmYzdiZDc3MjM4N2VhODljMTQ5ZDMzY2M1ZWJmOTE3
OWMiDQo+ID4gbWV0YS1xdDUgICAgICAgICAgICAgPSAid2Fycmlvcjo2MzEwYzVjMTczODBhZDVl
M2JkYWYxOTM4ZTAyNWQ3MTMwNjZlN2VlIg0KPiA+IG1ldGENCj4gPiBtZXRhLXBva3kNCj4gPiBt
ZXRhLXlvY3RvLWJzcCAgICAgICA9DQo+ICJ3YXJyaW9yOmViMTYzYmQ2YWEwOTExYTk1NDE3MDJj
ZDEyYTNkZjY4NGZlNWZiYjEiDQo+ID4gbWV0YS1vZQ0KPiA+IG1ldGEtbmV0d29ya2luZw0KPiA+
IG1ldGEtcHl0aG9uICAgICAgICAgID0NCj4gIndhcnJpb3I6YTI0YWNmOTRkNDhkNjM1ZWNhNjY4
ZWEzNDU5OGM2ZTVjODU3ZTNmOCINCj4gPg0KPiA+IEknbSBnZXR0aW5nIGZvbGxvd2luZyBlcnJv
ciB3aGVuIHRoZSBzeXN0ZW0gaXMgY29tcGlsaW5nIGJpbnV0aWxzOg0KPiA+DQo+ID4gSW4gZmls
ZSBpbmNsdWRlZCBmcm9tIC4uLy4uL2dvbGQvcG93ZXJwYy5jYzo0MzoNCj4gPiAuLi8uLi9nb2xk
L2djLmg6Mzc1OjE6IG5vdGU6IHBhcmFtZXRlciBwYXNzaW5nIGZvciBhcmd1bWVudCBvZiB0eXBl
DQo+ID4gJ3N0ZDo6dmVjdG9yPGxvbmcgbG9uZyB1bnNpZ25lZCBpbnQ+OjppdGVyYXRvcicge2Fr
YQ0KPiA+ICdfX2dudV9jeHg6Ol9fbm9ybWFsX2l0ZXJhdG9yPGxvbmcgbG9uZyB1bnNpZ25lZCBp
bnQqLA0KPiA+IHN0ZDo6dmVjdG9yPGxvbmcgbG9uZyB1bnNpZ25lZCBpbnQ+ID4nfSBjaGFuZ2Vk
IGluIEdDQyA3LjEgIH0gIF4NCj4gPiAuLi8uLi9nb2xkL2djLmg6Mzc1OjE6IG5vdGU6IHBhcmFt
ZXRlciBwYXNzaW5nIGZvciBhcmd1bWVudCBvZiB0eXBlDQo+ID4gJ3N0ZDo6dmVjdG9yPGxvbmcg
bG9uZyB1bnNpZ25lZCBpbnQ+OjppdGVyYXRvcicge2FrYQ0KPiAnX19nbnVfY3h4OjpfX25vcm1h
bF9pdGVyYXRvcjxsb25nIGxvbmcgdW5zaWduZWQgaW50Kiwgc3RkOjp2ZWN0b3I8bG9uZw0KPiBs
b25nIHVuc2lnbmVkIGludD4gPid9IGNoYW5nZWQgaW4gR0NDIDcuMSB7c3RhbmRhcmQgaW5wdXR9
OiBBc3NlbWJsZXINCj4gbWVzc2FnZXM6DQo+ID4ge3N0YW5kYXJkIGlucHV0fTozNDc2MDA6IFdh
cm5pbmc6IGVuZCBvZiBmaWxlIG5vdCBhdCBlbmQgb2YgYSBsaW5lOw0KPiA+IG5ld2xpbmUgaW5z
ZXJ0ZWQge3N0YW5kYXJkIGlucHV0fTozNDc2ODc6IEVycm9yOiB1bmtub3duIHBzZXVkby1vcDog
YC5sJw0KPiA+IHtzdGFuZGFyZCBpbnB1dH06IEVycm9yOiBvcGVuIENGSSBhdCB0aGUgZW5kIG9m
IGZpbGU7IG1pc3NpbmcNCj4gPiAuY2ZpX2VuZHByb2MgZGlyZWN0aXZlDQo+ID4gYXJtLXBva3kt
bGludXgtZ251ZWFiaS1nKys6IGZhdGFsIGVycm9yOiBLaWxsZWQgc2lnbmFsIHRlcm1pbmF0ZWQN
Cj4gPiBhcm0tcG9reS1saW51eC1nbnVlYWJpLWcrK3Byb2dyYW0gY2MxcGx1cw0KPiA+IGNvbXBp
bGF0aW9uIHRlcm1pbmF0ZWQuDQo+ID4gTWFrZWZpbGU6MTEzNzogcmVjaXBlIGZvciB0YXJnZXQg
J3Bvd2VycGMubycgZmFpbGVkDQo+ID4NCj4gPiBJIGhhdmUgbG9va2VkIHRocm91Z2ggdGhlIEdp
dCBsb2cgZm9yIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9iaW51dGlscyB1cA0KPiB0aHJvdWdoIG1h
c3RlciBIRUFELCBhbmQgSSBkb24ndCBzZWUgYW55IHJlZmVyZW5jZXMgdG8gYSBwcm9ibGVtIHNp
bWlsYXIgdG8NCj4gdGhpcyBvbmUuICBIYXMgYW55b25lIHNlZW4gYSBwcm9ibGVtIGxpa2UgdGhp
cyBiZWZvcmU/ICBJZiBzbywgZG9lcyBhbnlvbmUNCj4ga25vdyBob3cgdG8gZml4IGl0Pw0KPiA+
DQo+IA0KPiBpdCBzZWVtcyBjb21waWxlciBpcyBvdXQgb2YgbWVtb3J5Lg0KDQpUaGF0IG1heSBi
ZSB3aGF0IGhhcHBlbmVkLiAgSSB0cmllZCByZWJ1aWxkaW5nIGEgZmV3IHRpbWVzIGFuZCBJIGtl
cHQgZ2V0dGluZyB0aGUgc2FtZSBlcnJvci4gIEkgcmVhZCB0aHJvdWdoIHRoZSByZWxlYXNlIG5v
dGVzIGZvciB0aGUgb3RoZXIgcmVsZWFzZXMgYW5kIEkgc2F3IHRoYXQgSSB3b3VsZCBldmVudHVh
bGx5IG5lZWQgdG8gYWRkICdwdGVzdCcgdG8gbXkgRElTVFJPX0ZFQVRVUkVTX3JlbW92ZSBsaXN0
LiAgSSBkaWQgdGhhdCBhbmQgcmVidWlsdCB0aGUgaW1hZ2UsIGFuZCBpdCBidWlsdCB3aXRob3V0
IGlzc3Vlcy4NCg0KSWYgSSBzZWUgdGhpcyBhZ2FpbiBpbiB0aGUgZnV0dXJlLCBJIG1heSBuZWVk
IHRvIGNoYW5nZSB0aGUgcGFyYWxsZWwgYnVpbGQgc2V0dGluZ3Mgc28gdGhlcmUgaXMgbGVzcyBi
dWlsZGluZyBhdCB0aGUgc2FtZSB0aW1lLg0KDQpUaGFua3MsDQpCcnlhbg0KDQo+IA0KPiA+IFRo
YW5rcywNCj4gPiBCcnlhbg0KPiA+DQo+ID4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gPiBM
aW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gPiBW
aWV3L1JlcGx5IE9ubGluZSAoIzE1NjQyNCk6DQo+ID4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRk
ZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8xNTY0MjQNCj4gPiBNdXRlIFRoaXMg
VG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC84NTkyNjc1NS8xOTk3OTE0
DQo+ID4gR3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1jb3JlK293bmVyQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcNCj4gPiBVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3Jn
L2cvb3BlbmVtYmVkZGVkLQ0KPiBjb3JlL3Vuc3ViDQo+ID4gW3Jhai5raGVtQGdtYWlsLmNvbV0N
Cj4gPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiA+DQo=

