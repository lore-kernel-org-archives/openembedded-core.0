Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBD08C4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 15:03:37 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.111])
 by mx.groups.io with SMTP id smtpd.web11.16049.1699455810147164378
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 07:03:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nedap.com header.s=selector2 header.b=kRue0MYM;
 spf=pass (domain: nedap.com, ip: 40.107.249.111, mailfrom: jermain.horsman@nedap.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mZfmqWnVjINY/KgQnovbLm3NdOtVVpFkx6v6cNTZjJX4/hMVG2cG1Q+ta3kxts9uuHwdz7nMOYv2Z+n8QfdvENTvbZGVPqQMGY61RTcvQKoLNMWWo9bNna5Wi9xSQ0GIEZCJzRvdE/j8z8Ig2D+pdNEKFGpO+NcBLT2fLVADNVsuqwybYLNZderr4RoBZpSt5eiyO2Q15I8xCFGIcmyPXvXn2BZ1mNZJncf/2hF8QO45XR/F99x909G+1kLLV9lKRpJnmS0vv0WHoW61EUSWDVMgPWujJxSVNabRoenIRKYsMeLt1dSVXvVw6444OGV/eua7QxHPv1o40PYAgdZytw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vaACPT9xltVcpMxcx07Hhi8UHoPv4L88C5hOLYEW6CI=;
 b=NUYyK+NBGc7TskNrrlowDmPkFFbD5rgjmo7y4GhaEqi1TuwKkQtB4SugbXNejAf4PLfOb+lCFjDmck4m8po9P2KN8GX8Oi3sDIUHWP9Figt97prm+lamG13HQazEoouKQsTY7ekBYwvMnLlJkJob25eGI4AJFF8yccH905trEv0OB7GmbRMYXgDdftKQ6Nae/LekPO5dR95vNSqun5+UW9JCDM6s+f5iQYJ6AgC0A+X8rtEigv9r4rXvCJaJXJw72BeNgu0FyCbDWBXuTdKV1mDIgxWoP25FEV1Rp98rm87Jstzk2y5Vd7cUPcyWoYIyAi6wS+k14u7uts+wn5B4bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nedap.com; dmarc=pass action=none header.from=nedap.com;
 dkim=pass header.d=nedap.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nedap.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vaACPT9xltVcpMxcx07Hhi8UHoPv4L88C5hOLYEW6CI=;
 b=kRue0MYMfvqhKXEu5K4hTjW3jdHZc1Kr1egxc0e62A+qqw8UFmJV5B2YmwIKEVKUWbZerGnZ0oJWlnLCnMsNiDV9UtiJGjXwK2e1fX9dF1omjZThOqxsjqK6Ukh41gOLpHEnEvokI9YpUOX5V57YsoypoQQY0kCbmekaz00tA2E=
Received: from VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:137::14)
 by PA4PR10MB5660.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:265::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 15:03:26 +0000
Received: from VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ba10:eb74:e945:d470]) by VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ba10:eb74:e945:d470%6]) with mapi id 15.20.6954.029; Wed, 8 Nov 2023
 15:03:26 +0000
From: Jermain Horsman <jermain.horsman@nedap.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [RFC 6/7] bitbake-layers: Add default remote to
 layers-setup.json
Thread-Topic: [OE-core] [RFC 6/7] bitbake-layers: Add default remote to
 layers-setup.json
Thread-Index: AQHaEY79h0XZ99k0E02fVkxF0T/7n7BwSPaAgAA6eeA=
Date: Wed, 8 Nov 2023 15:03:25 +0000
Message-ID: 
 <VI1PR10MB3182C867637E593F93D86C67F7A8A@VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM>
References: <20231107152641.1043-2-jermain.horsman@nedap.com>
 <20231107152641.1043-8-jermain.horsman@nedap.com>
 <CANNYZj_KbgyoEnXe1F815bcjMO+H_s9k1RbPzbpcxOxfNwpQBQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_KbgyoEnXe1F815bcjMO+H_s9k1RbPzbpcxOxfNwpQBQ@mail.gmail.com>
Accept-Language: nl-NL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nedap.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR10MB3182:EE_|PA4PR10MB5660:EE_
x-ms-office365-filtering-correlation-id: 46eb48b3-a928-42e7-75cc-08dbe06bdc00
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 PGD+NIGPrUtfI/NGp4CcoyhokhYUK6OVj8SDGCAkCkmiAUwkvQvGZrJ0uIjqQx5h6tIBANPLsSOQoWHGkRgGxSqGFPscKCSA1AVFZXipTBprzQaFk84yu8GGJrTsSfTRtgz75uJ2zbyGhZPvMHL+C4mbIR7dAvelZLIdv6+IPVc7j/VCuZil+bb+ExW/NBrNV+lm+kYBK9kv9mkDYWduOS1M2xQgQ4jCiO2e/7dml29UdpH0F+y4YYUEqxWG4Arob+kq0ixd5+aNKOwt0A391EHlOfmoKn6Xb9LdiNgzUcGvD1E8KGQ80y6WLNhBYGPTCyuZ9KEBPI/AruqV+B6CD6fi7OeX/C34sPzM9i23QefgzsUsoy5hbmMCQMy4jsuMCyMVtaQFg/hvMPsRSXF1djXg0vQzLqw8ZrQyLfC6OXwh5cXzFqizRLBfsmO00jt8wHPkvY8BWeMauYt0wiDmQu04GsRKwMqQBb27ElA/HFYRJHafgjWggtumyNnrIK0XK6DTDOOFq/GkYmEYAwEa04ODWBiN7aq/7lbdH3dpc1TB8b2iHuM50DfQbjJto23W9+wk34O3qGZhLTzVIyoz57EahUbpHVIKGSDYugISO9vZxkyT9cDRfbG5mcJih0xN
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(366004)(376002)(39850400004)(346002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(6916009)(316002)(8676002)(41300700001)(8936002)(4326008)(2906002)(55016003)(38100700002)(5660300002)(66556008)(9686003)(33656002)(66446008)(64756008)(66476007)(86362001)(44832011)(52536014)(4744005)(66946007)(83380400001)(26005)(76116006)(38070700009)(122000001)(71200400001)(6506007)(7696005)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?OFFXclU2V0xxNHk5UldEaE5ISnUzU0Zmb3VrOVR6VlBVQ2RGMXllZEU0UXRY?=
 =?utf-8?B?UHFnUUszL0djRHVYWmRJdktHc2RrVG9BeitycXJWd2N2alJ0QlNIK2pCaGtw?=
 =?utf-8?B?TnduZTRjaG5NWm14Qit2ZHc3SVRxc1pJODJKM1c4ZUM5bW5iNkJObVZMbGg0?=
 =?utf-8?B?NzZ2K0tqY0JjWllWV0diR2RjUXBPaFRRSzRwRG1UL2l5a2JaRjJ1MUdvanhm?=
 =?utf-8?B?RHRtS2FKRk9XZDJmN1NzR0ZyaDFheUU4TDB2WVJTNHdEWjg5OUxCQVRSYTh2?=
 =?utf-8?B?UEVaY0NTWHNPNWJwVkc1a1dpZ1NJZ1V6Q0w3SUViRXE1dFVvdG1FT3Jaa0dx?=
 =?utf-8?B?TkVtUzhGcWg3dmtVU3oyNEwwazNRcVorRGNhRlJLVnhjanJVYjYxTHNJOFM1?=
 =?utf-8?B?OXJDdmYyS2hlTXU4cm5CTUFTQldhOWV5SHd0T1JYMzNyM3R3bGNmOFpkdzNo?=
 =?utf-8?B?R3FoNGhqamQxUTljUWlvYnJ1WEcvUlp1TmtPNVBleU00NDh5VnV0SGNHVjFC?=
 =?utf-8?B?em92b1h0ZmRMVmNvelRBeW9jbWkyOExTYUVQbFhCbXR2Y2N1Q29ZSWNNZDd5?=
 =?utf-8?B?WUt5VnpLNnpDbUE0WWE5MnpIVnNSMTJ5anVHVEZuQmdVVTFiOWdKbFNESkU5?=
 =?utf-8?B?aElqK21lb05BWkdrY2haY0tmZTJaejR3NnlscURFWTNsb1laeTJpamlud2pa?=
 =?utf-8?B?VEJtOGp4NUlzVmkvRW0zemFlbzRTUGwrdnZwcUNaY1Q4Z3BBNDk5dW1ZbmdQ?=
 =?utf-8?B?dDNUMHRvZ2xBb3gzNVFOSXRVdHc1OUlOYkMyZy9ZMTl1Znp4V0U0N3diWk55?=
 =?utf-8?B?NGlEbXJ3bG9hYytxN3ljZzRGYU82NHBEeGhsczgzbVlSNHpidmFCb1JaUHdj?=
 =?utf-8?B?akUxb2pUa2Y2TFRQMGUyaFo0VmErc3E2akVxVlJET29mVmZQSGIrOFQ0OUNW?=
 =?utf-8?B?RjlUMVJMZHkwZ3hOTCt3a0tuU0dyRFpDQmd1YURsYVRFSi9xR1d6N1RpdFBI?=
 =?utf-8?B?aU5BL3JYVHdqay8xQ0MxNThrN2RtZ292UGJWYWZnVURtME1nSnJ4MFIvRjJT?=
 =?utf-8?B?V2dXbUFoeCtrRlFPUTJ6L2IzVThjUm40TDZVV2xjVFU1eWNKWWVGN1pNTmN3?=
 =?utf-8?B?N3ArZUhkM0lSRHNmeTVrVUdIQnlSOEcwU3hVbnNGU3NZSVF6dFFMWUd6YnhG?=
 =?utf-8?B?NTFwbXpiRWJDL2JNSkFZR2cxMmZmWkpidVdTbzZlcWd1YnlqeXdFS3FqQUtp?=
 =?utf-8?B?RnVscFhla01sT0pUcklvcjJ6SktNRUordkdEMkJ3TEdQQ0VQeDVrN1poZnYv?=
 =?utf-8?B?N01OQk54V0FaQ2ZQcnkyL0FCT3RDMU5PeHI2ei8rOG1Hb0VJRUF4dUE3RmJr?=
 =?utf-8?B?VHpSd2xCMTU2bHhKdk1nQTJjdXdTbHphMTh3dS9TdEtBZ2hFT3NQQ3c2bXcy?=
 =?utf-8?B?ME5yTGlNU1V2R2RFcE9Ub0x1bU9wcUt0Vi95Q2VGVFBwVVp2cEphenJtR0NV?=
 =?utf-8?B?QjNSSW9zc2JrUGVWTC8yYlpFRlRaS0pxbm45THZaQ1BCQnhGaVl6eE14Z3ls?=
 =?utf-8?B?bmVRMS9tYzRaNjJ6UllqanZDWktTMC9HQmFRMno2TVJoTiszaFRrUDVDY01h?=
 =?utf-8?B?YVFIVTIrVExUSmRuM2M2UlhmRnVPR24vWGhuc3JBSEVQa2NXSldyV0ZUekF5?=
 =?utf-8?B?K1JVMHppTzBlSHYrT0xyMDBuMElucnVzSHhxTXNOU3NlY0orNytnYUNBM1dF?=
 =?utf-8?B?YzZpWkNmb2tiamNVWnV5SURqeUlhVDNpdWNyWGZucTBSTC9ja0xvd3dDa3hh?=
 =?utf-8?B?SXBiZXJETVhHVjRKemZsVURoUjlicU0rMmVqd2VQc011MExuVVo1b0FkREd5?=
 =?utf-8?B?QUwwOGlYYkZMZlVlNWVtUnNZQUQ5V3p1VzJMOEZSOTFybkkrSldCWGxtK1p0?=
 =?utf-8?B?WG9CRGM3WVhIWjNKWDBNaEJYYmM3Ulk2dTVYUURpb1pMaEFNK3NZOHZoTk1h?=
 =?utf-8?B?UWEvRGVOdmErSG53UkJlU0NkYXlNQzFnSkk1OERKby92TU9wdTFYcUd4Mlda?=
 =?utf-8?B?VVlLSW82eFV6QVZ5dXQ0Qksyc0RhZFBGd1h6QkZLdThnN3VPeTA2NWoxTS83?=
 =?utf-8?Q?C4+iqH/J7jcb2Y3lqkh/o4mws?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nedap.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 46eb48b3-a928-42e7-75cc-08dbe06bdc00
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2023 15:03:25.9804
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d21d161-0ae7-4a24-94cf-df0881e2fa96
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pcPgkm/8Prh3nNdLG0alFcE0kIic1FdOh964t+Dgih1dGP23lDtNmzckr6dYhrsjC9LPxyOUihGmExK1VMv/zXnQkWSL5Z0eO7S4MMfPHdA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR10MB5660
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 15:03:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190352

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4
LmthbmF2aW5AZ21haWwuY29tPiANClNlbnQ6IFdlZG5lc2RheSwgTm92ZW1iZXIgOCwgMjAyMyAx
MjoyNCBQTQ0KDQo+IEkgdGhpbmsgYWRkaW5nIHRoaXMgZmllbGQgY2FuIGJlIGF2b2lkZWQgaWYg
cmVtb3RlIGFuZCBicmFuY2ggYXJlDQo+IGNvbWJpbmVkIHdpdGggLyBzZXBhcmF0b3IgaW4gdGhl
IGFscmVhZHkgZXhpc3RpZyAncmV2JyBmaWVsZD8NCj4NCj4gRS5nLiAnZ2l0IGNoZWNrb3V0IHBv
a3ktY29udHJpYi9tYXN0ZXInIGFuZCAnZ2l0IGNoZWNrb3V0DQo+IG9yaWdpbi9tYXN0ZXInIGJv
dGggd29yayBoZXJlLiBUaGUgaWRlYSBpcyB0aGF0ICdyZXYnIGNvbnRhaW5zDQo+IGJhc2ljYWxs
eSB3aGF0IHdlIGdpdmUgdG8gJ2dpdCBjaGVja291dCcgaW4gdGhlIHNldHVwLWxheWVycyBzY3Jp
cHQuDQo+IENhbiBiZSBhIHRhZyB0b28uDQo+DQo+IFdpbGwgdGhhdCBjYXVzZSBpc3N1ZXM/DQoN
ClRoaXMgaXMgY2VydGFpbmx5IGEgcG9zc2liaWxpdHksIHRoZXJlIGlzbid0IHJlYWxseSBhbnkg
aXNzdWUgd2l0aCB0aGlzLA0KaG93ZXZlciwgaXQgd2lsbCBjaGVja291dCB1c2luZyBhIGRldGFj
aGVkIGhlYWQgd2hpY2ggY2FuIGJlIGENCmJpdCBvZiBhbiBhbm5veWFuY2UgaWYgeW91IGRvIGEg
c3Vic2VxdWVudCBjcmVhdGUtbGF5ZXJzLXNldHVwDQphcyBhbGwgdGhlIGJyYW5jaGVzIHdpbGwg
aGF2ZSBjaGFuZ2VkIHRvICdIRUFEJyBpbnN0ZWFkIG9mIHRoZWlyDQpwcmV2aW91cyA8YnJhbmNo
PiB2YWx1ZS4NCg0KT25lIGNvdWxkIGFyZ3VlIHRoYXQgdGhlIGJyYW5jaCBmaWVsZCBjb3VsZCBi
ZSBkcm9wcGVkIGFzIHdlbGwsDQppdCBpc24ndCByZWFsbHkgdXNlZCBjdXJyZW50bHksIG5vciB3
b3VsZCBpdCBiZSB1c2VkIGlmIHdlIGRlY2lkZSB0bw0KdXNlIHJlbW90ZS9icmFuY2guDQoNClNp
bmNlcmVseSwNCg0KSmVybWFpbiBIb3JzbWFuDQo=

