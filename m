Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 294FFC5AC67
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 11:32:15 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.26])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17174.1786015932024732290
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 04:32:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector2 header.b=G9ks3LQV;
 spf=pass (domain: ericsson.com, ip: 52.101.65.26, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pQZmsOOAZAmKl8fQwX/yYghwMvmRBWS4k6fPolh+/4arYeAIm97qK2vkb92j8vhqpsiZPCiL6BHXSGssOYDizXdTbhbleassKyXMZ2QckHcR9maagS0Auwz+vp+qxtyWb5Deqg6bH3qLaYz63YGUWsUYGWpBoKdXDux4crhZOdlxhOHQQNl1gUpX1mtbvAHyX2YyZ+FbbM6PtDX8LP4aQf+7h38kbC02/i1xWDESlkVA8JDlmlR5juAWyDvF6WZmt+O+VTPxReJrBrUnVHYFCd2dRQVOOMqNsrXaEuj5BuVHUctzoo9FxBViyjRoXWwubldIwFf8VTiN50QCelN6BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oj+ApRfRgnRABvp7KwSDIgTRs+K1Hpwn1GCgU4oVfbQ=;
 b=maO4HACMfGznmyooPcHUVUMxDBdnujABCplbFiRxqkzDdj02VxB+OKsLci3CzZ5fgrn8Bay3vviWRmfo7STq79D85hvmwqi3nxOJf7Uix//ZrvhVAXKKp5l/sWnBFnrciErZOsFJ6IE4ZXB4EpQAZOrdVauc/YuizeY3fQpKj+xKh1MtAZ1Mu3rdvUZeLEzq3f1GwIfxay+8xSmfsrTUd1NyI5Lo3gc4OAoLqEW+jwTj1ryRtOWvY/jaGgUrjLGYuLceEmZDnzAahHtbjbI2Lk/OpTWsbEBlxRRl/wzr4fd4Nr/B7yLD7mOjouEY/bVQzCW4XEiBJiVrBvlCHfv9Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oj+ApRfRgnRABvp7KwSDIgTRs+K1Hpwn1GCgU4oVfbQ=;
 b=G9ks3LQV1ipCCxWUz0KflMUPP3MQOzTqtgklaSGyF4eq30yTr0N+EgWzQ+2OYq3Xp19KB4t6o/G7wvH5RYzg5Zkp8nUnQ/KULuKTi3YjunBwMsb8QZxN+r95Ln5LdmUpyz0VFGmvLc/m8cyGHi/Jr1uC+aQf+tyKuxct0Q4DmsaVYdNrNauntsUKzKqeC4CnhmAVbgoEXyJTk6APJVtb8AET6LqF3Ur1nIUSANN17mSFT3vEY26X/PGSnePqrExMKrSvdn8slUPaTd6/TMT4V+VSUmX7EIp6Fts3mcyoIr/uT5F87pe/WbYRkumK3hT9z7XuDKi4FS033hqzcSQisg==
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com (2603:10a6:102:4af::6)
 by VI1PR07MB6349.eurprd07.prod.outlook.com (2603:10a6:800:139::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.8; Thu, 6 Aug 2026
 11:32:07 +0000
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7]) by PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7%6]) with mapi id 15.21.0315.006; Thu, 6 Aug 2026
 11:32:06 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: "Ross.Burton@arm.com" <Ross.Burton@arm.com>
CC: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: restore libdw/libelf to elfutils PACKAGECONFIG
 RRECOMMENDS
Thread-Topic: [PATCH] systemd: restore libdw/libelf to elfutils PACKAGECONFIG
 RRECOMMENDS
Thread-Index: AQHdJZUvxLrXCzkbRk6XhWA6TyoPoraQ4IMAgAACvQA=
Date: Thu, 6 Aug 2026 11:32:06 +0000
Message-ID: <c6e541776d35aeafbdc1610676590585f57bd403.camel@ericsson.com>
References: <20260806111717.4060900-1-daniel.turull@ericsson.com>
	 <55681715-1058-42D3-82B9-880BACD55E48@arm.com>
In-Reply-To: <55681715-1058-42D3-82B9-880BACD55E48@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3PR07MB10721:EE_|VI1PR07MB6349:EE_
x-ms-office365-filtering-correlation-id: a1422d2d-2b8d-4302-8144-08def3ae589c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|38070700021|6133799003|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info: 
 6UWUedhCQdjGd87Uwy24Lgr7FbLZOZ6XdDcUBc3KWGdUjKBI3IU0BG/f8glfHQwTgkni014Q061G3B6kXlYE/MN3/0j8i/P/mi/JJTBUmHF+9LEoEINRjpuUPCHTixUZw2thr5v2pxTztuphSmM/l82ChmdfWwEMdhDH1aqtrTWHhWTKR0wiT6Vp2i0KZS/wGsbzzbha+v1lehq8S1T/+rTy/lFFnyAa2iDFsKmkM1Rv5EtVEl3CtratLiGvdZ29P5XfTAbteyD3W4bYtd02kqQeagIEp9shZdNw2AxlKAm+15Cls0zuZTU6jXyPpbvy/28RIFYx71QHa3cPb0EGVJBvb7h5xxkJqBYXuGSlYVP4etwPSs436Lhs1v1DdFzkUtZDtt+yWTj2JnqIW4YL1bV5GJt1SfMZ4Dok4uHqBHgLC2UQg7GLbMdlGqW5M+Qye8ihn6nfWy4fa73yIoTcXvJQcy2hmG3oCFShv/q+BwKoYxerWw4xMwJFzzBOg674/zl1QkwsHqFcvslByfNqQXhSlLMJut8BfxkcLZ80V1/i3TR7Egfvx/71hck882ib94gsLml0w8GOfZGdBj/Mc28OthMvW1kabxiukbFfZXSH3qTxl9b09QrcCg5n17f8jsygxx51465w36bwdsu9Jsku655bQBmfH+lQkKTiXUPMrMyN6+FUO53PPtZOBA7t8fAn8ALf6X0w/DpU6oK2OVPfswILfNy4oaKn2HF6Nog=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR07MB10721.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(38070700021)(6133799003)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?a3A2NTByeVFJNENqaGNoMkpLb2FzbGpkSGc0QnV4ZGZjRGEyMmREWW5HZjJu?=
 =?utf-8?B?SmtVdVdkWXI0WVNGU2NYNTR2RG50b1dHbERZaGpFSFpYOEZPQ05uVEh3ckwv?=
 =?utf-8?B?cmFUT2xsL3IxMWtsR3hERFRXdCttT3ZxbVpyMUNHZlNXSTg0SFlyWkRac1NM?=
 =?utf-8?B?VTloQ3ErcTZNRzRWSUpyTThUalFaUFQvM3J6TUxla0Qzb0E1alRiUStqUVVL?=
 =?utf-8?B?dFJObWxVZ3VhZEJVY1FuWjBCdTkyTzJFRTFsVkZYWXZYaVJsbS8xZHVCN3dM?=
 =?utf-8?B?b2VWcmdHS3JzSkNqMFlsVjJoeFJkNU5KdE15c3NucmtsanhBaFNPcURoTDRm?=
 =?utf-8?B?UWFyeFlqTzZxRXFoVS95VTZESTNhVjI2NDl0VlpNSDBzY0ZXYzN5eHVhbSs4?=
 =?utf-8?B?d2FpKy9UVWhGM0lxcm1qTG9oRGs4TWk2cEdJbmpXNnBhbVI1U0dtalRUNjZt?=
 =?utf-8?B?K0JReGUwWFlubG9CZW1GL3k2R0ZPVWNuNXg3ZGt6UzJsUVFieEJHU3dXODlw?=
 =?utf-8?B?ZGY4b2VGZ1pXWnNueDNIakllaWJMUG14L2lMMHBtV25kVTlHUFlRRFk2TDB0?=
 =?utf-8?B?amFYMll4aTk3b3U2NjYwRjRrK1FaenArRW9VZWIzNzdId3dKZUJlK1drMFRS?=
 =?utf-8?B?OUpEdm9hVlkvenI4QzRSSHMyaXdMU3BMeWRqSGJuUTNsV3VTblk5RWkwWWRB?=
 =?utf-8?B?WTFrT0hMQjAwblNZVG4xeGtOVTladkRWTTlSOU9aN3FXZGlPS3BOU3kwdEZY?=
 =?utf-8?B?Sk90dVpPbDhMN2YyUmxNLzc5RkVQTE4zQWQyM0krZ3E0RmwzTjk1VHlHYlYw?=
 =?utf-8?B?Mm1lQS80WGRrNFpSN0NSbXlEZjNtMnNKZmFpV3JHdXRwMnlqdGo3YTcwL21K?=
 =?utf-8?B?SlRHQU1yRlIwK0g2YnJwUGtOaFhOeHJjYU9jcVV5SkpQdTRLRnRWRER6TW8w?=
 =?utf-8?B?VXJJbEhNZDIyTDFvOVRjWFNQZ2g5OXZLekgrdE5DRTZvUmt5THcvOHJaQkkv?=
 =?utf-8?B?V280c3I4NFVJQkgvMDA5NG10aktuVGI1ZHhVRy9YN3JaSm9hQ093S01KdWUr?=
 =?utf-8?B?cm1xeElzdUV0Sm1FZSt1cFNFZWg0aUs5MlpBbW5xd3VvVVJ0M0t0OWVpbW85?=
 =?utf-8?B?M3M4d0JSQjMydVZjWmp4WUk2SWc0NVYrMCtqSmt0TWxTVFlVRHpjRlRlbW5y?=
 =?utf-8?B?RnpKblBiUjJQTjVuYVIyT3hTeHdKVGw4L3hRRXRIOXUwRFRHMVA3Tzd6b2JM?=
 =?utf-8?B?N24zQ25GMTk5QmltTDNpdlpJTS94RGM5a0wzUDJPQmFzb2VUV21xRmdPN3Rx?=
 =?utf-8?B?Q1hZUHBJVWlaU1VlclpVcm51ZEh1b1BFbzltNXFmUDkwVEZOa3dmVzFpaWVL?=
 =?utf-8?B?Y1UxWmpsSVBzT1JkRDVpK0dsTGs3cU9QV1BoTXN2WHBHOGR4dGJlWmN6S2VY?=
 =?utf-8?B?b2tVQitlUGROTktqSGU0YjhQVnRpSlNTQWordGlzRmdlWENhWlprbk9CeVRp?=
 =?utf-8?B?RDZkcTFsNVdrelNwZjZuMUZSeHRuV29QbmJGeEI4c3NIbXNURE0rRXRWNjdv?=
 =?utf-8?B?eng2bWR4dUFqSXQ1ck1qbG56akkrRWsvVmdyRW5PUHJSR2ZPUFA2SnE1YjJu?=
 =?utf-8?B?VXhRVVpZTnJhcHJYVG9CNUVHOEtQT3gzZTMraGlOS1lhNDZwTy9jS2hzQjY2?=
 =?utf-8?B?dFVUUVMweW5ySUtvTU9mMC9EdlhvQTdtcUE4ekttM1p4NXNhZ1B1N1hkRFdi?=
 =?utf-8?B?LzhUTHRLMkwvZnhxa0YrSDNoWFZ2K1luOWVoRVpmRjVOenMvOWh6WGZMV2dq?=
 =?utf-8?B?VjVXNXZtMmxaWVJEUHJJVjJmdEk0SDJIM1lNNFp3SnFUWGQxUFRTdXUwaURv?=
 =?utf-8?B?dEp3SzhkL3FISzRFU3VNMlo5Wk5NQWtVc2ZOdGlZTEdEY1BkelEzN05LemdU?=
 =?utf-8?B?akxldG10VWEveklFMG52bWwzTzE4YjQ3L01xNC9iTVVzaThYZGczVnVkSVZh?=
 =?utf-8?B?WS9ZTHNJTlQzQzU5S21mUTVHL3l5MXVjdnR0a3YzQ1hJaVg4QitjQnBDMkxi?=
 =?utf-8?B?SFNCVlk0WWtLd0dRNGt5MGRMdDI3eUpPTGpwQkVMVVErdlNHZmh6bE9IdzUr?=
 =?utf-8?B?NEVqeHNBMUtBVTBFRFBaeml0NWJKMmY0WHk4dmN4bTlmcWRaM2ZMME9mOTB2?=
 =?utf-8?B?QldYcG1MWkpidHU5L1lDZ1RJdDV4MGJTV3pMcFRJUCs0L3FRYXpSVzJuZGxL?=
 =?utf-8?B?cU5uRndTdTJuSjl0b3E0by9ZVTRONHZjMi9uU3BWV2wrb2prbGw0eGExdFZG?=
 =?utf-8?B?Mk5wSnM5WmRHV3l4TTVpbngxMmVjSi9OSDlXUG5xTEdVLy8yRHhGZ1lHaUU2?=
 =?utf-8?Q?Z+ezQl0vARJUzurc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F202D12114CC6B459243AB599BA8B39A@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3PR07MB10721.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1422d2d-2b8d-4302-8144-08def3ae589c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2026 11:32:06.9619
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dk38BFWPMtTCBYvhLEffOhc0qmPLRAI9E/gr641hJUGlNsDroldMwhrRYulc4kEpt5/pzHA11l22kSxiqVwrL3HjXs0PkfLvwxQKNIvieao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB6349
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 11:32:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242932

T24gVGh1LCAyMDI2LTA4LTA2IGF0IDExOjIyICswMDAwLCBSb3NzIEJ1cnRvbiB3cm90ZToNCj4g
T24gNiBBdWcgMjAyNiwgYXQgMTI6MTcsIGRhbmllbC50dXJ1bGxAZXJpY3Nzb24uY29twqB3cm90
ZToNCj4gPiANCj4gPiBGcm9tOiBEYW5pZWwgVHVydWxsIDxkYW5pZWwudHVydWxsQGVyaWNzc29u
LmNvbT4NCj4gPiANCj4gPiBzeXN0ZW1kLWNvcmVkdW1wIGRsb3BlbigpcyBsaWJkdyB0byBzeW1i
b2xpY2F0ZSBiYWNrdHJhY2VzLiBUaGVzZQ0KPiA+IGxpYnJhcmllcyBhcmUgbWFya2VkIGFzICJz
dWdnZXN0ZWQiIGluIGxpYnN5c3RlbWQtc2hhcmVkJ3MgLm5vdGUuZGxvcGVuDQo+ID4gbWV0YWRh
dGEsIGNhdXNpbmcgdGhlbSB0byBsYW5kIGluIFJTVUdHRVNUUyByYXRoZXIgdGhhbiBSUkVDT01N
RU5EUy4NCj4gPiBSU1VHR0VTVFMgcGFja2FnZXMgYXJlIG5vdCBpbnN0YWxsZWQgaW50byB0aGUg
cm9vdGZzLCBicmVha2luZw0KPiA+IHN5bWJvbGljYXRpb24gYW5kIGNhdXNpbmcgdGVzdF9zeXN0
ZW1kX2NvcmVkdW1wX21pbmlkZWJ1Z2luZm8gdG8gZmFpbC4NCj4gDQo+IElmIFJTVUdHRVNUUyBh
cmUgbm90IHJlc3BlY3RlZCBhbnl3aGVyZSB0aGVuIHdvdWxkIGl0IGJlIGJldHRlciB0byBqdXN0
IGNoYW5nZSB0aGUgbG9naWMgdG8gdXNlDQo+IFJSRUNPTU1FTkRTPw0KDQpJIGRvbid0IGtub3cg
aWYgdGhpcyBpcyB0aGUgZXhjZXB0aW9uIG9yIHRoZXkgYXJlIG5vdCByZXNwZWN0ZWQuIENoYW5n
aW5nIHRvIGFsbCBSUkVDT01NRU5EUyB3aWxsIGJlDQpzYWZlciBidXQgaXQgd2lsbCBpbmNyZWFz
ZSB0aGUgZGVwZW5kZW5jaWVzPw0KDQpUaGVyZSBhcmUgc29tZSByZWNvbW1lbmRzIGFzIHdlbGwg
aW4gdGhlIHNvIGZpbGUgZm9yIHN5c3RlbWQtc2hhcmVkLTI2MS5zbw0KDQp8QEZETw0KW3siZmVh
dHVyZSI6ImFjbCIsImRlc2NyaXB0aW9uIjoiU3VwcG9ydCBmb3IgZmlsZSBBY2Nlc3MgQ29udHJv
bCBMaXN0cw0KKEFDTHMpIiwicHJpb3JpdHkiOiJyZWNvbW1lbmRlZCIsInNvbmFtZSI6WyJsaWJh
Y2wuc28uMSJdfV0NCnxARkRPDQpbeyJmZWF0dXJlIjoiYmxraWQiLCJkZXNjcmlwdGlvbiI6IlN1
cHBvcnQgZm9yIGJsb2NrIGRldmljZQ0KaWRlbnRpZmljYXRpb24iLCJwcmlvcml0eSI6InJlY29t
bWVuZGVkIiwic29uYW1lIjpbImxpYmJsa2lkLnNvLjEiXX1dDQp8QEZETw0KW3siZmVhdHVyZSI6
ImR3IiwiZGVzY3JpcHRpb24iOiJTdXBwb3J0IGZvciBiYWNrdHJhY2UgYW5kIEVMRiBwYWNrYWdl
IG1ldGFkYXRhIGRlY29kaW5nIGZyb20gY29yZQ0KZmlsZXMiLCJwcmlvcml0eSI6InN1Z2dlc3Rl
ZCIsInNvbmFtZSI6WyJsaWJkdy5zby4xIl19XQ0KfEBGRE8NClt7ImZlYXR1cmUiOiJlbGYiLCJk
ZXNjcmlwdGlvbiI6IlN1cHBvcnQgZm9yIGJhY2t0cmFjZXMgYW5kIHJlYWRpbmcgRUxGIHBhY2th
Z2UgbWV0YWRhdGEgZnJvbSBjb3JlDQpmaWxlcyIsInByaW9yaXR5Ijoic3VnZ2VzdGVkIiwic29u
YW1lIjpbImxpYmVsZi5zby4xIl19XQ0KfEBGRE8NClt7ImZlYXR1cmUiOiJmZGlzayIsImRlc2Ny
aXB0aW9uIjoiU3VwcG9ydCBmb3IgcmVhZGluZyBhbmQgd3JpdGluZyBwYXJ0aXRpb24NCnRhYmxl
cyIsInByaW9yaXR5Ijoic3VnZ2VzdGVkIiwic29uYW1lIjpbImxpYmZkaXNrLnNvLjEiXX1dDQp8
QEZETw0KW3siZmVhdHVyZSI6ImdudXRscyIsImRlc2NyaXB0aW9uIjoiU3VwcG9ydCBmb3IgVExT
IHZpYQ0KR251VExTIiwicHJpb3JpdHkiOiJzdWdnZXN0ZWQiLCJzb25hbWUiOlsibGliZ251dGxz
LnNvLjMwIl19XQ0KfEBGRE8NClt7ImZlYXR1cmUiOiJhcmNoaXZlIiwiZGVzY3JpcHRpb24iOiJT
dXBwb3J0IGZvciBkZWNvbXByZXNzaW5nIGFyY2hpdmUNCmZpbGVzIiwicHJpb3JpdHkiOiJzdWdn
ZXN0ZWQiLCJzb25hbWUiOlsibGliYXJjaGl2ZS5zby4xMyJdfV0NCnxARkRPDQpbeyJmZWF0dXJl
IjoiY3J5cHQiLCJkZXNjcmlwdGlvbiI6IlN1cHBvcnQgZm9yIGhhc2hpbmcNCnBhc3N3b3JkcyIs
InByaW9yaXR5IjoicmVjb21tZW5kZWQiLCJzb25hbWUiOlsibGliY3J5cHQuc28uMiIsImxpYmNy
eXB0LnNvLjEiLCJsaWJjcnlwdC5zby4xLjEiXX1dDQp8QEZETw0KW3siZmVhdHVyZSI6Im1vdW50
IiwiZGVzY3JpcHRpb24iOiJTdXBwb3J0IGZvciBtb3VudA0KZW51bWVyYXRpb24iLCJwcmlvcml0
eSI6InJlY29tbWVuZGVkIiwic29uYW1lIjpbImxpYm1vdW50LnNvLjEiXX1dDQp8QEZETw0KW3si
ZmVhdHVyZSI6Imttb2QiLCJkZXNjcmlwdGlvbiI6IlN1cHBvcnQgZm9yIGxvYWRpbmcga2VybmVs
DQptb2R1bGVzIiwicHJpb3JpdHkiOiJyZWNvbW1lbmRlZCIsInNvbmFtZSI6WyJsaWJrbW9kLnNv
LjIiXX1dDQp8QEZETw0KW3siZmVhdHVyZSI6InNlY2NvbXAiLCJkZXNjcmlwdGlvbiI6IlN1cHBv
cnQgZm9yIFNlY2NvbXANClNhbmRib3hlcyIsInByaW9yaXR5IjoicmVjb21tZW5kZWQiLCJzb25h
bWUiOlsibGlic2VjY29tcC5zby4yIl19XQ0KfEBGRE8NClt7ImZlYXR1cmUiOiJ6c3RkIiwiZGVz
Y3JpcHRpb24iOiJTdXBwb3J0IHpzdGQgY29tcHJlc3Npb24gaW4gam91cm5hbCBhbmQgY29yZWR1
bXANCmZpbGVzIiwicHJpb3JpdHkiOiJyZWNvbW1lbmRlZCIsInNvbmFtZSI6WyJsaWJ6c3RkLnNv
LjEiXX1dDQp8QEZETw0KW3siZmVhdHVyZSI6ImdjcnlwdCIsImRlc2NyaXB0aW9uIjoiU3VwcG9y
dCBmb3Igam91cm5hbGQgZm9yd2FyZC0NCnNlYWxpbmciLCJwcmlvcml0eSI6InN1Z2dlc3RlZCIs
InNvbmFtZSI6WyJsaWJnY3J5cHQuc28uMjAiXX1dDQoNCkkgbm90aWNlZCBpdCB3aGVuIHRlc3Rp
bmcgc3lzdGVtZC4NCg0KRGFuaWVsDQoNCj4gDQo+IFJvc3MNCg0K

