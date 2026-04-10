Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 645ADE9907B
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 10:28:21 +0000 (UTC)
Received: from OS0P286CU010.outbound.protection.outlook.com (OS0P286CU010.outbound.protection.outlook.com [40.107.74.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.153355.1775816892354298230
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Apr 2026 03:28:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=X8kRaTRh;
 spf=pass (domain: fujitsu.com, ip: 40.107.74.43, mailfrom: wangmy@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SPpIIupnPKw3saWs2kKUXZKLs9bR07bvQDZzMhwWWthcTcGf+37mg2LzEbAozRELK8T/gghDmUK6SeXsNRh9YTCQkZ6cF1OTmL4jbluZ6PHz9qWaCC2Po1GITAQrPh3NFXZm8RG6oZZMq+jYRWd+w9nTM1O12TzA67gSAAuYXz4y/z0K7DVfUleR7AQxE7JKUF/8J8c4RUBsuBso9HzaGOUuOJN6lYlH2Kjy1mOPwCEcxY6cOn04/rgJfWqUMqa2/CqRokhaRVLiqgjd60yuvKmquWQOMUj8nvHwdE6ExAd+6UyZ9OAW6NWryO2WcX7spoPicm7Uv99f7G2z3clWMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lo2ZBnxJ6aligNKKXrzSCpIB6Hojr4b2cVDD2Lsr4i4=;
 b=kY198crbXDPf7iRtbQhCJf8z6Xlsg2TwI4A3LiuF12j7VYp3aJhBQXtIycFzPcOWI41OUSiIHRobHRhiufxj8F3aGiqxZ9g0TVbG5fgECLHpUiPtcbMIleFzIJtIqV4BmRNXed90Zmhr9tDtmw5ono6UW8HeaFaw5k8+UG9TFxkUit4zd8L5rTPFz/EnRSD/+8m5Nc64GfY4AE/41sor2dAerbCpAFCIfGqxEuRy2DhK05WcUwoUKRxUYPXn0qGMCRqBdImaR9LnJieMDdK/fj24z6chPMtV3AdEzAesqWhVONxAjKXwr3v8YHU7KsKHUVuzhdSqfS/R+tvmTBcIkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lo2ZBnxJ6aligNKKXrzSCpIB6Hojr4b2cVDD2Lsr4i4=;
 b=X8kRaTRhBMmkF2RnbcdQiQwt/bHB18I+VR6UxBi3mtPvHgUSajR7J2JwA3WoynA0KT/WELPfbYgA26kJJ9P5hH8lr0KQg2K9wdaJNZvfSIJl9SEqHN/ai2uQ2cnoB+9BAnXkFy9mHBeQbHtvc3ReVY4ZXfThzv9L3vY9yNR8MwxUMc9Z70Gh4/xh0PpzvQbWgDKOcxmcbOeT13CVmMAyRzH+ysiaiwAUmuGiDD0rNIK8Vx/MXTBIkHwPWv3BIAS/h0Ms/fUasFsB6IZJxbIrs33cZDaSJ1TS9i46flW9uM8a2lJsLKLzyMMv2MnO3466w8IUmIGu2xp0p/zSCIGswA==
Received: from TYYPR01MB13419.jpnprd01.prod.outlook.com (2603:1096:405:1be::9)
 by OS7PR01MB13668.jpnprd01.prod.outlook.com (2603:1096:604:35d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Fri, 10 Apr
 2026 10:28:07 +0000
Received: from TYYPR01MB13419.jpnprd01.prod.outlook.com
 ([fe80::5408:8c53:d81e:a928]) by TYYPR01MB13419.jpnprd01.prod.outlook.com
 ([fe80::5408:8c53:d81e:a928%6]) with mapi id 15.20.9769.041; Fri, 10 Apr 2026
 10:28:07 +0000
From: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [PATCH] [OE-core] [PATCH v2] lttng-tools: upgrade 2.14.1 ->
 2.15.0
Thread-Topic: [PATCH] [OE-core] [PATCH v2] lttng-tools: upgrade 2.14.1 ->
 2.15.0
Thread-Index: AQHcx8HiI3qwdGmfDki1IaVHCIMT77XWrA8AgAFtwlA=
Date: Fri, 10 Apr 2026 10:28:07 +0000
Message-ID: 
 <TYYPR01MB1341978CA068B1BAC26E48065DC592@TYYPR01MB13419.jpnprd01.prod.outlook.com>
References: <20260409014036.1519-1-wangmy@fujitsu.com>
 <DHOMP5U25UXL.ZH8NFSNZYYVM@bootlin.com>
In-Reply-To: <DHOMP5U25UXL.ZH8NFSNZYYVM@bootlin.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9MDcxYTQ4NTQtNzcyMS00MzUxLWI0ODMtYjMxOWMyOWU3?=
 =?utf-8?B?NWI0O01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFROKAiztNU0lQ?=
 =?utf-8?B?X0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9T?=
 =?utf-8?B?ZXREYXRlPTIwMjYtMDQtMTBUMTA6Mjc6NDNaO01TSVBfTGFiZWxfYTcyOTVj?=
 =?utf-8?B?YzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX1NpdGVJZD1hMTlmMTIx?=
 =?utf-8?B?ZC04MWUxLTQ4NTgtYTlkOC03MzZlMjY3ZmQ0Yzc7TVNJUF9MYWJlbF9hNzI5?=
 =?utf-8?B?NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfVGFnPTEwLCAzLCAw?=
 =?utf-8?Q?,_1;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYYPR01MB13419:EE_|OS7PR01MB13668:EE_
x-ms-office365-filtering-correlation-id: f9058477-0683-4d05-177d-08de96ebdb6d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|1580799027|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: 
 V7CCJ4/sMhDr1lfcTjSOQv7fipbPIYEQQfqT9AjcxNW1fM1FIJwNUt8LpN+x1rL//mqCoG3kBv2Jk7/vezq7lXMCCGdgIlgqfRcNUpYTG65m+ejFbIIOu1r4QGkCxpYE7tefgJMluvz+S+UpGjaOBFQRjY5ygVzSUMkV7sStaTKF8Qh+C5ILJjfjwt4sOnjpYyEYTKuzdGltYJrH3znkwB3NbcTDuJkQqRWX73hO2CSkDbW6gPiMuZVoZbyuiMxjGUcDksLqDEodvKrBRn3Pi/fzFVCSWOJdruFaYO6AX8Ldy5OMOWA+o2otnYZfsxT1RlWkODK06JrpFR0zq5uG1T95MU8lOZqS0oFok5Gd3Zp6ZDDsu/vTasuQ+gVoKHdQ/ryv4BZ5KCdeR8Kxkd19cnd4yPoo90mvzm5zaQHQdkgt8Q4eXAuwvm2Zi7I4IrrLwCBAiExh2A31PbUSx/SNEirYsqcEILf5LC+Tx69X4boOyjINMKJhXi7Ut6/ds9FPBd6XFkNtSVtyliLFilV7pxvYxMa2qIlWuyKlbxltuoqheitUhmyvL/1haflovTROlVew88eUN2LQBqGwOZl/CZVSigSbo03omk1FR0ukqF9ROpZmBcqmg4VGfTe/cvG0my6hXhSNM4iEKMDk/6ku7nisdf2vdU3fiT+FK/O8f/CbFmIDrNPGt+uyL/jh8h06x/Ri1AZ9UrFZogE4N2UnLzEXpQB6+4mAya09qRjzU5QYh6lhosnbEYMOQE5HMlg1
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB13419.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(1580799027)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?V3NZaTNuSHFkeGE5cXY4T0dLU0IxVU40dUtxY2UxU245UEJaNk5wcXQ3c254?=
 =?utf-8?B?YjZVSEh1and0MGxQNmFsMG9rcjlQUGZEUmZldVFmZkVqMnF4MnFGL3BIUHlY?=
 =?utf-8?B?ZURaOG9DeXFNOW1VV3I0eWh1OUc3NFJtMndFVFFVVitKcG1seG5mV3BrU0Fl?=
 =?utf-8?B?Nkoyb2lITnVDYTVqQTVuME03YzVFOExyWXZCOTBzSVVXUmlQcFFLbm45SnZC?=
 =?utf-8?B?OXVtQ2hHTnAwQ2ZHREhvc052V25xMHdnZTZtZ0pYVVFMOHVNMGU5TVpsaURw?=
 =?utf-8?B?MlBOS3FjUEs2Tk1GRkcvT202ZlN1WjNoZ3NqbFF0MUFVNFlYMzhnU0pNaDdO?=
 =?utf-8?B?TlZHMnZHN2tmWmo0YXliOE1TRWY1VU9hMDZxaGdqZXJQYkNiMWdCU0N0SXlP?=
 =?utf-8?B?OWhCUnFJd1NkZ1l3UzBHeEJwaDFaajIzY1lpZ3F5S2ZoZVpQb3EzSGRxUEJp?=
 =?utf-8?B?R21UNk81NFRuWjllbGFwaDIrOFM4dkpTT0VqOWpvN1FWamtJcXdPOUxKdUFp?=
 =?utf-8?B?QVNwV0pKZjhsS1Z6QlpJTSszNUJnUVRmQklNVHgraGZMR05wM0NPUDN1K1pW?=
 =?utf-8?B?eUFjTGllOU1JU2Z3UjNvZzBKQ0FENVU5aVRFNE5EVGZJdUhmVTVQQ21PRFhr?=
 =?utf-8?B?Q29pZTFjNFNldis0Z2JYdDJsRDVtNmRlSmVldGJMWE1wMVFxSFhtSzdlQVkz?=
 =?utf-8?B?ZXdMU0dubENLS0t0aHBicnVJOTZmeGNxb3kvcHNCZjU1T3BQM29IaThTUFpt?=
 =?utf-8?B?dHl3RmN0YW5CeUhuSWNLWWsvT1UzL0dRUWtPejBVRU0rVHlHVEwxbWg5ZEtD?=
 =?utf-8?B?QmJkbThLamxEVHZybWlWZWtUek5HbjlWZmVHTElmRVJreFVhbDZKT3NYMDlj?=
 =?utf-8?B?R0UxbllOZUlvUGIvUWhScXFTU3IxWUxOVktHaTFoV1BjbERPODV4NlJWVnhD?=
 =?utf-8?B?a3QwR0NKZ09FVWlIY2YzLzhuWEd0TWtLOEZkbDNEZWxZYytHR21BcTlCZW1C?=
 =?utf-8?B?Y3ZKUVJpYjlkVEphaGtNSmYyblBPZFc4MXBsU3o3cXZMaEJtL2FqUXJzaSsr?=
 =?utf-8?B?QVRSUVMzeDBpRXNhbDhucTlCMHc1VVk2NlFCQUN3ZHBCY0w3T2pRQTNJNXJm?=
 =?utf-8?B?VG9WdFNyL1pZdTlnYlRqMElTV01VbnhrOE50UFJCSTBFbHR0Ty9YWmZXdnUv?=
 =?utf-8?B?UmVlRjhxdmtwLzFXeW1rNHBibHpJSXdsRW5CeFFkdkc3cWY2eXlFaXl2cGc0?=
 =?utf-8?B?cW8zdjlseUk5TUNoSlduZ0JtK29UUGh5c0R1d3VHckJ6UzVXUHhzWDBWVFlM?=
 =?utf-8?B?YThNOG9YMzVNbXU2bDVocXloekRsOG04VmZMM24wUFFkVDlaWDIrbmIrU3dD?=
 =?utf-8?B?MjR3czhqMkV0NUlyVEl1NU5XWWp3TGxqVVNpRFlxNVlQWWRVdCsvMnlsOEFZ?=
 =?utf-8?B?MCt2aExmR0tSSCtmMmpYbnA0RmlOa1ZvdTRETDhKWXRkWTczeDNXNUZJVGx0?=
 =?utf-8?B?ZkVWbmVHbGt3dmE2VVlFYTYwbHFhelo0Z3RBVFkvdmtlbU56R1l3MXpJNHdj?=
 =?utf-8?B?K1NxWDM4UDMwcnFEemFhME9MKzBMNmxxTU4zTGVTS1NIR1Z3aXRKbDkwRU56?=
 =?utf-8?B?OElWb2drcW01MXp6cnhmanY3bnpYSG5TWGVaVldoM1NnM0tKcnhFRU0reG1D?=
 =?utf-8?B?cEZlZHlqT0xBNnNYWElyZHNCUG02Z2dGalNzTFAwZUVxQ2tiUmVFYStqa1hU?=
 =?utf-8?B?S2NNZEtaTld4bEN2aXMxQWNJZnlqb2owdmMvNFNNWXRJVTEyRUFFQmNkbHcv?=
 =?utf-8?B?ZlFJNkowTFFrcVVjdXVkai9oY09nZldnRHVqWnVyL2krTnFpcDFPTnNGcmJR?=
 =?utf-8?B?V05ITk5LUlh6blRLdXh3em1NNXhCdm53cFdkQjh1eWlrSUUweWlqSStCRWFS?=
 =?utf-8?B?V0tMTEIvOWZxYnNvZXdHaTN0NmN0bDQxZGdLNzFQa1dLbHZZR1VXV01XNnB5?=
 =?utf-8?B?SWE3RmYrY2NXbGRtSXpOQk5Wd3Q0bzlVTkd6YTk5OGM2ck9mWmY4eUF1Yndr?=
 =?utf-8?B?WHJLN1gzU3lZbDMzdzVqQStaZmVOVmlxWDVlanpuYnFYMGh5RmR2VTQzMTkr?=
 =?utf-8?B?dkRjeURJbnI4Uk5XOWgvK3NvUmk0WU9kRkxHWDhWQTl6d09YYnBWUXBmR0hV?=
 =?utf-8?B?NkQyd25seWZKUlBqUm5GdEFXTXJnODNQMEFVNTl6Vlh1WWg3cDJEUHlYNzhU?=
 =?utf-8?B?eTdQQTI0ZlhvMFovTnBhQm1UVzV2WVlsaW8zckpKVjJ5OFBZaGxoR0IvTG9s?=
 =?utf-8?Q?BFXlvzhFvgAU5o97HY?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	rLYjbPfmg1UEWxfPNnMHbFP7ku8HdC7kMV62JROn5rlYatPf23oFUNlsH/zE8cT5B7LHtGp2igJPEmaWv8m6mkI4sA9exZwKAXwB1sW/2ubYhefkZ5IGFwLpqbevhdGEMRafV2PUIA/7hzs5yiBJUcn6S3QARIvht4EIECDADWHRYfFC93+AbcfS2n1Y8hA7BVyvYOznh95zDFNQTt2YQBjKzddiy9Z4Dzzf+IcVY31Szxqvkyzvptzuzx96o68SUMF6PDu9eY4nQKQJXxfMIjYweSwgwxGmvIiUDrIJ2TUvalvlpK3cpvmKhuMGJXclHrediar6lMsjIZBlJ4tBvw==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB13419.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9058477-0683-4d05-177d-08de96ebdb6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2026 10:28:07.5406
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kBomnbP1bizyfqrTicVEahnTqF5LU9LqGWgd+tccuOWJj5ZnGxol8ysv9PvfH/mIRaGY0a4wp0Rt4OkqEVm/yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB13668
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 10:28:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235014

SSBoYXZlIHNlbnQgYSB2MiBwYXRjaCBvZiBsdHRuZy11c3QgdG8gZml4IHRoaXMgcHRlc3QgZXJy
b3IuDQoNCiAgLS0NCkJlc3QgUmVnYXJkcw0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpXYW5nIE1pbmd5dQ0KRlVKSVRTVSBOQU5KSU5HIFNPRlRX
QVJFIFRFQ0hOT0xPR1kgQ08uLCBMVEQuIChGTlNUKQ0KTm8uNiBXZW56aHUgUm9hZCwgTmFuamlu
ZywgMjEwMDEyLCBDaGluYQ0KVEVM77yaKzg2KzI1LTg2NjMwNTY2LS04NTY4DQpDT0lOUzogNzk5
ODg1NDgNCkZBWDogKzg2KzI1LTgzMzE3Njg1DQpNQUlMOiB3YW5nbXlAZnVqaXRzdS5jb20NCg0K
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNYXRoaWV1IER1Ym9pcy1Ccmlh
bmQgPG1hdGhpZXUuZHVib2lzLWJyaWFuZEBib290bGluLmNvbT4NCj4gU2VudDogVGh1cnNkYXks
IEFwcmlsIDksIDIwMjYgODozOSBQTQ0KPiBUbzogV2FuZywgTWluZ3l1L+eOiyDpuKPnkZwgPHdh
bmdteUBmdWppdHN1LmNvbT47DQo+IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gW09FLWNvcmVdIFtQQVRDSCB2Ml0gbHR0bmct
dG9vbHM6IHVwZ3JhZGUgMi4xNC4xIC0+IDIuMTUuMA0KPiANCj4gT24gVGh1IEFwciA5LCAyMDI2
IGF0IDM6NDAgQU0gQ0VTVCwgd2FuZ215IHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IHdy
b3RlOg0KPiA+IEZyb206IFdhbmcgTWluZ3l1IDx3YW5nbXlAZnVqaXRzdS5jb20+DQo+ID4NCj4g
PiBkaXNhYmxlLXRlc3RzMi5wYXRjaA0KPiA+IHJlZnJlc3NoZWQgZm9yIDIuMTUuMA0KPiA+DQo+
ID4gMDAwMS10ZXN0cy1kby1ub3Qtc3RyaXAtYS1oZWxwZXItbGlicmFyeS5wYXRjaA0KPiA+IHJl
bW92ZWQgc2luY2UgaXQncyBub3QgYXZhaWxhYmxlIGluIDIuMTUuMA0KPiA+DQo+ID4gMDAwMS1j
b21tb24tQXV0b2RldGVjdC1tdXNsLWxpYmMtYW5kLWZpeC1DLWNvbXBpbGF0aW9uLWVyLnBhdGNo
DQo+ID4gYWRkZWQgdG8gZml4IGNvbXBpbGUgZXJyb3Igd2hlbiBlbmFibGUgbXVzbA0KPiA+DQo+
ID4gU2lnbmVkLW9mZi1ieTogV2FuZyBNaW5neXUgPHdhbmdteUBmdWppdHN1LmNvbT4NCj4gPiAt
LS0NCj4gDQo+IEhpIFdhbmcsDQo+IA0KPiBUaGFua3MgZm9yIHRoZSBuZXcgdmVyc2lvbi4NCj4g
DQo+IFNvbWUgcHRlc3RzIGxvb2tzIGJldHRlciwgYnV0IHNvbWUgb2YgdGhlc2UgYXJlIHN0aWxs
IGZhaWxpbmc6DQo+IA0KPiBBc3NlcnRpb25FcnJvcjoNCj4gRmFpbGVkIHB0ZXN0czoNCj4geyds
dHRuZy10b29scyc6DQo+IFsidGVzdHMuc2VyaWFsXzc4Xy1fVGVzdF9zY3JpcHRfJ3VzdC9zdGFs
bC1idWZmZXIvdGVzdF9zdGFsbF9idWZmZXJfY29tcGxleC5weSdfcg0KPiBldHVybmVkX2NvZGVf
MS5fMF9wYXNzZWQsXzBfZmFpbGVkLF8wX3NraXBwZWQsX3Vua25vd25fcGxhbm5lZF9bdG90YWw6
XzANCj4gXSIsDQo+IA0KPiAidGVzdHMuc2VyaWFsXzc5Xy1fVGVzdF9zY3JpcHRfJ3VzdC9zdGFs
bC1idWZmZXIvdGVzdF9zdGFsbF9idWZmZXJfc2ltcGxlLnB5J19yZXQNCj4gdXJuZWRfY29kZV8x
Ll8wX3Bhc3NlZCxfMF9mYWlsZWQsXzBfc2tpcHBlZCxfdW5rbm93bl9wbGFubmVkX1t0b3RhbDpf
MF0iLA0KPiANCj4gInRlc3RzLnNlcmlhbF84MF8tX1Rlc3Rfc2NyaXB0Xyd1c3Qvc3RhbGwtYnVm
ZmVyL3Rlc3Rfc3RhbGxfYnVmZmVyX3RpbWVyLnB5J19yZXR1DQo+IHJuZWRfY29kZV8xLl8wX3Bh
c3NlZCxfMF9mYWlsZWQsXzBfc2tpcHBlZCxfdW5rbm93bl9wbGFubmVkX1t0b3RhbDpfMF0iXX0N
Cj4gDQo+IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy92YWxreXJpZS8jL2J1
aWxkZXJzLzYxL2J1aWxkcy8zNDUwDQo+IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0
Lm9yZy92YWxreXJpZS8jL2J1aWxkZXJzLzczL2J1aWxkcy8zNDcyDQo+IA0KPiBDYW4geW91IGhh
dmUgYSBsb29rIGF0IHRoZSBpc3N1ZT8NCj4gDQo+IFRoYW5rcywNCj4gTWF0aGlldQ0KPiANCj4g
LS0NCj4gTWF0aGlldSBEdWJvaXMtQnJpYW5kLCBCb290bGluDQo+IEVtYmVkZGVkIExpbnV4IGFu
ZCBLZXJuZWwgZW5naW5lZXJpbmcNCj4gaHR0cHM6Ly9ib290bGluLmNvbQ0KDQo=

