Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03A1EC4321E
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 12:51:12 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.47])
 by mx.groups.io with SMTP id smtpd.web10.42070.1669899063355024710
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 04:51:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=5XeSJ/1T;
 spf=pass (domain: arm.com, ip: 40.107.105.47, mailfrom: ross.burton@arm.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dY1DYsBCRG3p4wRWgGb66NCbOnZwAp0eaOagEsAMUt6ElXCNvJY/nOrYFQITg4rfNpbcDciVQl56e5JWSgiuLiZkzt19geBZoGOOZSCRcltXxv2WJbO55ie7nHA6scrXXazBGuxHeM60K1dP7MFoAGbSjP0NXzoeq2RcZWzlDYvFOafR1FJSE1HNieMS2Pi00jA28iSQwyPr8W8fj/P68E0p2jAjEzxrnkT6HfHtpWe/k3KLzD95sRDhbkonWdjn/tFQ5Cctw9AC0hoqePj5Zx32kJkNwKtrVSxy2psWgAc9Lg6y2mUTkxvcKWBLbOn+ud7Hu9CalIvEgW0hjw/Xmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+iVy4FnE9lAn0e2nFBR2214q7aWEgHoIAunyxD6/iYs=;
 b=cAwRuyVYE0TzDttuQYXDoJERodwoLjGoWNFOwjc0xAXTAAGFcKE3gvsIfJadsPgcIIPQAf9P5m7HmeGWAVlJ+uir8npg/HCPFvNHfq3FRb/09ixeMXhS1zcVpvVq7TGEWbr4YSK/0IOgC95z7yUOt09xNv+PSqfj97Gwv0x1+9mU9NSbvJw0eQrDnzrrQ5vCcXX6t6CY54ts73+in9TVF5QkCLFmUJADqKIDcApDvWVUxEGRB4EZj+on0uUjFMSkWXeACavXmde8Pe+aqMTtblSv2tc9QXpbUOQio7FfvFeY6KgkVA1im1jVsOhY9iS952mzHzaUT5ei3AFboaDYWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+iVy4FnE9lAn0e2nFBR2214q7aWEgHoIAunyxD6/iYs=;
 b=5XeSJ/1Tc2Cgr6TNSZNqgcmLdDG1DF28oOp464V2SjnbxCOfIMxKEbikgaxuAk1aMKRpyFNaSgA/0C8wQZK+ZzbROfDPf+k4hLvdaLrAv0Nod2cdXgDQy6mlYyxr1EGl19e1BuIfl9iPG9d378ILzMk28dCPBWJnBrw7CDX+i6U=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB7719.eurprd08.prod.outlook.com (2603:10a6:20b:524::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Thu, 1 Dec
 2022 12:51:00 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1ecf:7fb9:8c0:8119]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1ecf:7fb9:8c0:8119%9]) with mapi id 15.20.5880.008; Thu, 1 Dec 2022
 12:51:00 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "f_l_k@t-online.de" <f_l_k@t-online.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCHv9 1/4] graphene: import from meta-oe
Thread-Topic: [oe-core][PATCHv9 1/4] graphene: import from meta-oe
Thread-Index: AQHZBVoLjHjadAJm40eTO1fNEmQcQq5Y98gAgAADOQCAAAFlgA==
Date: Thu, 1 Dec 2022 12:51:00 +0000
Message-ID: <FC456B28-1AFE-4B92-9C03-37CD64631D0F@arm.com>
References: <20221201075324.353632-1-f_l_k@t-online.de>
 <0496E9D1-8A87-4F2C-9C6E-43CA4929D17E@arm.com>
 <CANNYZj9TwYeQ_UfD-oi8Md+cH-6Tx8s+jvM9EmrMC4LVBK7J8Q@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9TwYeQ_UfD-oi8Md+cH-6Tx8s+jvM9EmrMC4LVBK7J8Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.200.110.1.12)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR08MB7411:EE_|AS8PR08MB7719:EE_
x-ms-office365-filtering-correlation-id: 1926092a-ef64-4c65-081f-08dad39ab2ad
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Sa1TM65wFy3r9Rl8RNZW5m2py7nWBXzDhHqdo+P1SQSX2Hza7J+mAC+mmXiguoqPoazlVKOcSKO44LKj3dYQq6INt4x5K6VGx/9th5M2Y92eRPALMCdNb0s7FlW/6f5fu1PFv0TiIfmxQtG4HBoItZ0lVAcUYRq2eUXdmsiIM3pIE5a3OJISVAad5k0RiVqe31lajN7MQiYDBXqB3r4VzPkC/O3hgR3okIHLZOoF9s9TlapN9/Y/LzxnSpqz8YP2Lqssoy8Jcp/m4Qxp9Z0A4OZlwuRW3/6kL/+YHsOtUFGN1RJkzhBj1bQ6SXCl3h62eLhYFEs1P+FOlZUuaKOOyqbbipckWR3BBiJC3a7TK4hHpj0TkTOnFm88e9vrVZeDhckZ3vlI9pAvO92MUAOJVteIsIlUTe+o5vml2B6KL+YSnbR8lMZF/IWZziIRofS/PgK5tbIYJ0sTVY/jT2VfPmSBZnE7BWOXeNBJbUozxtuxJUyzEHVmdDkRl6ZmGTYOW0pqGJDRNSuaGXkL6u12QQ55KU5Jse64aixvx5XSko/mIUV0meAv6+b4pxipBHyu5MIDy6COoTOXjjxinaXBZU/oXUKCCxX6Sm8V/urfPH5NxXOK0saG2lkhTSNVOTITCKyaA95YI/MvkkD63kCH6RPN1w/cL/Ae68lVxsXN7ftR/in/iM+8zj1SYTmlvlahZvkJwyRM96dTHx1WyBu3cQXo2E1miFrFSW6z6rBSZ9Y=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(136003)(396003)(346002)(376002)(451199015)(478600001)(71200400001)(6486002)(6506007)(2906002)(186003)(36756003)(316002)(6916009)(26005)(6512007)(54906003)(66946007)(122000001)(38070700005)(76116006)(64756008)(66556008)(4326008)(66476007)(66446008)(91956017)(8676002)(41300700001)(53546011)(4744005)(8936002)(5660300002)(2616005)(38100700002)(86362001)(33656002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?b2hjUnIwVVFaem5Qc2tLdUxEM1JmazM4R2pSMHVnc2c1aGUwOGovbi9TS0dM?=
 =?utf-8?B?a0lzZmN5Z1V3b1d2SkUwelVjUEM4enhMb0RqOWY4ZmQ1b3diTEtnTjZCU2pP?=
 =?utf-8?B?WVc0Kysyek13WTI5cGZFU3k5SURPUGlHb0FWckVNNjRQREVGMC9rY0s2WkN0?=
 =?utf-8?B?ekpWdkY3WVczR3NJMEpmN1ZqU3lEcEhQZ2F0UnBob3hrTlZETGJHREdPZTVJ?=
 =?utf-8?B?MWV5Skc3MDhPY0dhTExrUmFJUE9mSStXREx0RzljK2RGMDVmUlRGM2syOXNt?=
 =?utf-8?B?MGMvdVVieGE5V1FId0pzTDdpYlBoT05ZMXU0ODBaVVN6cHM1QTJIdGpMR0hs?=
 =?utf-8?B?M1ZuYUxGNDdleEJlbzhEY1FhbnJMMjBWYW1kRTVFMGJzV0xCbDZmVHMxenBm?=
 =?utf-8?B?ZW85dkFUTkhlZ3EyOFMwWTJETXA2SHhDdDRST2dGaVZXSXl2dEJKaFNMbWJr?=
 =?utf-8?B?OTlXY1dNaFNjYTFudUptNzVlalVXd2ZCSjE4WGNGYlowMGd0dkQrMHM0b1ZX?=
 =?utf-8?B?ZTZ2NTVUUmdVSFRmaWJuSVpsK3ZtOGlBcWM5ZmdBTjZFUjBOdWdGeXdBMjlm?=
 =?utf-8?B?MmdtbDFIaVdiaDJlZ3BDNmNwOWN0WTRkMUdQc0ZEQUEveVFPTW9oRDZNQ0Rm?=
 =?utf-8?B?MnRTRjAxVjQwVnJDS1dycEFuNWQraVp1Q3NzVFFJOHp0c1R1YnRDWmpCOVk4?=
 =?utf-8?B?a0VMdVRTbTJVbk16a3B6QUVTb3A5cFQyUGxmWHhSdHAweUpncXp3dXdaTGJN?=
 =?utf-8?B?QjRqelZ2RmdqR29FdTd2RVcyeHZydGNRVTVDQ1ByZjEySWVoNWZBcER0enFi?=
 =?utf-8?B?REFVUHdoUnNyeS9tTk1uVzNqVi9kd3YwZ3lqbmJwMmZyVUY5RTVPMXRWb1FQ?=
 =?utf-8?B?SitXUUlPNXM5Tm1aNHhHUXdOUHZHa0tUWlNDdENCUTFwQlR6aTI1NGZIUWth?=
 =?utf-8?B?Y2F0eE15WllqdkZ5SEZKSU8wdkMvTlNNOTNvUCtaREhKSmdRS3AzeDNHYkc5?=
 =?utf-8?B?eWxTOURPMWt4cGg4U1lkMlNhSnhQZzBMaEZ5ZHBQbmIzeDRhMjhrUzFhUmlx?=
 =?utf-8?B?cGpFREdMNFJwN3VZSWlvZ3dXLzJlMHFEcVBBakpXdXNwVG9FdXNFaFludkJm?=
 =?utf-8?B?VjlwT0M3MnVjRVZNUlVpNXp5Z2g3Mk0zZi8yZW1qMFhjb0lkTHc2L0pCWGE5?=
 =?utf-8?B?ZVM0MEVIdWMrTko1aEI2R0RHanhUUGlpcjh5THBoU0NkU0ZOYS9DSnE2alQ1?=
 =?utf-8?B?U1I2dC9VdVE4WkxJQzhYNWFhM1dUeTIzZHNFOEFsVkpDMGZrYUdxOUprMzdZ?=
 =?utf-8?B?VUUxelF6ZGN3UW1SMnZyYlNWeUFiZ1o4UmhCL0l1KzJxQmIxQVNKUWlNVTB4?=
 =?utf-8?B?N3pDMG5TWEYzdXVvUGdVaDgzVk1GTHNxekNkYkFNVXZlVTJDcXJTNWE5USt5?=
 =?utf-8?B?U09LWk1nZTdoMzhCdUw5Mk5CT1RRQTV2VTdIcEt2aks5U0JoZzFLWUpvWDhX?=
 =?utf-8?B?WmhkUTdlYnVDN1FKK0FYUWljUDUvQ1IyMVIrV1Bnc2lMYVAvSVR4VnBPN3o0?=
 =?utf-8?B?c2J1V1pxQ1REdXlIaU8rUkFPMHRYQnlDU2RuMVZlbVBkdmlNRHB2QTFLcHdp?=
 =?utf-8?B?U2JTeXNGWXQ3QWRzLzZjMTBSR2JQR0xkK0VYdUFTdDBDcnBiUnhuRllMRi9F?=
 =?utf-8?B?NmNaT1k4c1JiLzVCeldrTUNoeUpxZHBOak02eGVNelV3aFRHS0ljSE14d05p?=
 =?utf-8?B?WUM5dWNWZFh3UWN6WFpxMFBPSzFxb2tBYk5YanVkMVptdTdxaTY2QTVrRU5N?=
 =?utf-8?B?Yk1KWmhld2lYSXZKK2thNi9JYjRzQ1IxWDJJYTRPM0xNTDkvM2dmMUpZNlor?=
 =?utf-8?B?Sit2TGhUbUtPQjYycHJoK1k4bnpXL0wrdHJENUtQTXl5NlE0cy9jYjJBeDVx?=
 =?utf-8?B?V3U2VGxLaW1Jd0gvRGgzdjhaR0t6SEVMTnlDdjJrY3pDNytSaG4vWHlLamxq?=
 =?utf-8?B?RXp2K1VWSGo0dmU5d1hlN2xjSXFWbEtubVpDcjRLR1I3TXdRTFVJUThnRW0w?=
 =?utf-8?B?Z3VjVThIOStoampnd1BuN3BaaFBUNkZ6WStYeUlTdmJlYjI0cUZxZjIwTUtr?=
 =?utf-8?Q?i0iKa6M07L1S6PVOUY5xVdfYC?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C2A5AF5BA92CD04084A0335519A19B27@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1926092a-ef64-4c65-081f-08dad39ab2ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 12:51:00.1986
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7yC31k1Oxlrt6RjlSElbjdrI/IFt8jOFNZhK1hHja+vo1q8AzjJtBYYgJGPBgMxLM6gQkWpygikgm1v2EFo9Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7719
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 12:51:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174056

T24gMSBEZWMgMjAyMiwgYXQgMTI6NDUsIEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5A
Z21haWwuY29tPiB3cm90ZToNCj4gDQo+IEhvdyBtdWNoIGxvbmdlciBiZWZvcmUgd2Via2l0LCB0
b28sIGRyb3BzIGd0azMgc3VwcG9ydCwgb3IgZ3RrMyBpdHNlbGYNCj4gc3RhcnRzIHRvIGJpdHJv
dCBpbiBzaWduaWZpY2FudCB3YXlzPyBJZiB3ZSB3YW50IHdlYmtpdCBpbiBjb3JlLCB0aGVuDQo+
IHdlIGJldHRlciBmaWd1cmUgb3V0IGhvdyB0byBidWlsZCAoYW5kIHRlc3QpIGl0IHdpdGggZ3Rr
NCwgYW5kIHJhdGhlcg0KPiBub3csIHRoYW4gbGF0ZXIuDQoNCkkgbWlnaHQgYmUgcHV0dGluZyBh
IGRpZmZlcmVudCBlbXBoYXNpcyB0byB5b3Ugb24gdGhhdCDigJxpZiB3ZSB3YW50IHdlYmtpdCBp
biBjb3Jl4oCdLg0KDQpJZiB3ZWJraXQgZGl0Y2hlcyBndGszIHN1cHBvcnQgKmFuZCogb2UtY29y
ZSBpcyBzdGlsbCBzaGlwcGluZyBhIGd0azMgYmFzZWQgVUkgdGhlbiBJ4oCZbGwgcmVwZWF0IG15
IHN1Z2dlc3Rpb24gdGhhdCB0aGUgYXV0b2J1aWxkZXIgc2hvdWxkIGV4ZXJjaXNlIGEgR1RLNCBz
dGFjayBwcm9wZXJseSwgYW5kIGVwaHkvd2Via2l0Z3RrNCBjYW4gbGl2ZSBpbiBtZXRhLWdub21l
LiAgRXBoeSBpcyBhIEdOT01FIHByb2plY3QsIG1ldGEtZ25vbWUgaXMgd2hlcmUgaXQgYmVsb25n
cy4NCg0KPiBJIGFsc28gZG9uJ3QgbGlrZSB0aGUgaWRlYSB0aGF0IGNvcmUgc2hvdWxkIGJlIHVz
aW5nIGxlc3MtdGhhbi1sYXRlc3QNCj4gb3B0aW9ucyB3aGVuIGxhdGVzdCBvcHRpb25zIGFyZSDi
gJhjb21wbGljYXRlZOKAmS4NCg0KQWRkaW5nIHJlY2lwZXMgaXNu4oCZdCBjb21wbGljYXRlZCwg
dGhhdOKAmXMgbm90IHRoZSBwcm9ibGVtLg0KDQpSb3NzDQoNCg0K

