Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77261C43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 09:21:09 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.32])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16829.1782811264303939643
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 02:21:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector2 header.b=a7tsALve;
 spf=pass (domain: ericsson.com, ip: 52.101.65.32, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vSZal6K5IscKhqyvf0ions9P0eyB4/wITAMOyMEkDFbjMGSCe2jlWsZxivBtfxJVbTPmiOdY1xzs6ixwHrZvKdJJP8t6GhyM6/lm2zLREOz0Am63199hPKhBh6bcjY12+QFyPDtuaq4T4ZIeZB5kbd/0G8lnOVKEsN6j6Usylmi1+XSHbl9UwujuyMlZGoGKDTphVSre+RxoWyyRot3mUQEgyC+1DdH9S1ZC2SWA1StahU8gmZWa6/z78idRmaT/JXPgc87tao/ZiniEFxxYVY8o3PCUmIsusbxRBuU2GGzslNMfraJdCBGAr9SGGyH5qIdy1otxO9/TzWdpiLau+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VjKkz5tJ1ywi0AMO2nON6ZpLO2iAw73wkywG4XUByFI=;
 b=speWgAFhM1jhfF6LqZ7aouqWd06zkfeGKLXB1EPRXgViWC8il2d2IZ0UgRNK8HFfyd54Yq8Mrd4hXmIBPlD1KBD99E4ioLf2r3eHZSfqHN265Y7qV9U5ARI/6zlm4vGZudmAcb+41raBs0dzLaZIpQJnQQQZOWy6x94vGZmaO5o7gFCO/CCSzj4d6XfHymVDG7MgwOY8eiHq60luhjOBzAYPwXgct82jW/YbJAf3PIbqFz6YQT0VrRzCHWAzJaZNu8vTY2GYt4GH0Y0RWQV7c9eTzlvVodSPF+ttnzyTcgbtKLO3H/5vifDr4EuBV3cqHCXSXorptzTP9Yn2kjuk5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VjKkz5tJ1ywi0AMO2nON6ZpLO2iAw73wkywG4XUByFI=;
 b=a7tsALveFRcelECpZ7JEKon/K1JiT/PNPXWhQlmllsOuw6mtY49944vx3od/RX0r9sdU/fM8ux+DL2SbbKA2wn8jhwZfihqSuND+HCK2Q0XEkC3MJf7bLIblgr/w6vyCITFX1jpL7VvDnLwkuDlWEGQ0NezJ2hp/MUULc0SnjzNxt1lEWbTdqKIg3qIaxanTYnYn3ePqlL+2RQP7TwrpGPG93YAWjahCS1YiLgfGIufZYjGF9hgBmNlSsJLB9XSJIbCtfVXuY+J91Rej42lcN30gfEDv2KcV4wde5G5pY1SAH4TFA2PfKAsz3Wqs30SRqH7qplDTjca5B+1XKCiQ4A==
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com (2603:10a6:102:4af::6)
 by AMBPR07MB10617.eurprd07.prod.outlook.com (2603:10a6:20b:6a5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Tue, 30 Jun
 2026 09:21:00 +0000
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7]) by PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7%7]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 09:20:59 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: "Ross.Burton@arm.com" <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/3] classes/meson: use ninja explicitly when
 compiling
Thread-Topic: [OE-core] [PATCH 1/3] classes/meson: use ninja explicitly when
 compiling
Thread-Index: AQHdB9HVAsrWb8/jtkWXSF19iC+Um7ZWwRYAgAAB/YCAAA+zgIAAAReA
Date: Tue, 30 Jun 2026 09:20:59 +0000
Message-ID: <697ef358000f2bceb6c4325f137492f1f677d566.camel@ericsson.com>
References: <20260629141559.1305873-1-ross.burton@arm.com>
	 <DJM8EZJFQZCJ.2860UZRX5PB0Q@bootlin.com>
	 <ed70423e6ae6dfa9da7e739fd3c59a8f041a8773.camel@ericsson.com>
	 <DA367819-E672-4344-B7C7-5A7D2089A0A1@arm.com>
In-Reply-To: <DA367819-E672-4344-B7C7-5A7D2089A0A1@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3PR07MB10721:EE_|AMBPR07MB10617:EE_
x-ms-office365-filtering-correlation-id: c0c32386-7673-4dc9-62bf-08ded688e5ef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|10070799003|1800799024|376014|366016|56012099006|11063799006|22082099003|4143699003|18002099003|38070700021;
x-microsoft-antispam-message-info: 
 71qpsSRRzVuFqKicGJWCffPy/2AQVhB7ZzSr++pYGsYk4HV9y4pYFNlPsldDTxhluDFyWVazzqY7z4EgRfX7/mrFCnGK1EfumbHrGzecBLSss30VgUZDPksN8azMtuOuO/1a6zoekQvqPO2DADTmV0u4i+F5Lm38FIITAcfxYvM8AYBFSjBuKBD+ntwj/QybvMC3DdQ+s+4CjhG5nGL+b1NprCGv3E5Qt9k/U8L0NMZkuxzk+HwdJGBl2YwayonwCvI4XW11ndTbgFJ8Udy+xpiupGPGNM0q06vFdzZ1a/8HCjAhaW/Yd8jce4w8QCSCqcXBZJXU2kD/5Cyuci8X3G/VDqPmCvO59y43mh9DSWe3WXqBwEoqEOY7y9moedrT4vtoJybz0CZ8h8a4H1sMSet/NQ+HM+pojTQh5PvnqrGqY8hV5rm2/SeANpXSg+kLx0EoGbk+UX8Ku2qhYqSE11W3Tm2JpCB+8BNrfrGpHWV4Y94uMXv8SnveFCBdxQ9q9MOzbF1RZgTMmtxGdcu27B04jLtJxHhNHiXT3MoyJD/ZcXEOV5HghARcp8G/RbSx8mM7M5dXFpSHzqfeXZNy4/GvUepv1cxe1iY+XAQIQev7OBC06YujGAMsD3Myx+dfPdx8V96IsCvafCh2VpSs8HNZ6DCcN25i9FHJKYco0AuFuAKUdn950NUTagTCX6Bgz/NF7yK0CgtaX5tfjB7/DerpUDSuUCEKxmOk6Jk40lk=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR07MB10721.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(1800799024)(376014)(366016)(56012099006)(11063799006)(22082099003)(4143699003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ajVwdm5yVVRKYlVBSDAxNENqeFpXTWRSVlEzd2pWbVpUU1NsNWlGVnF6czdU?=
 =?utf-8?B?UkxKSkVQQU9PSlJqUTNYTXZqQ2twTHRKeFdlY3NYVWxhVi92U2xhdmYxUDNj?=
 =?utf-8?B?V1R5SlNPc3E3dzUrU2tYRHNYR2E2UzNVUnF5SHcvdTV6NFFrRUgvekNsYy8y?=
 =?utf-8?B?VXg3aUtWK2lwcmlReVB0Znh5ZjhraUJCcjlzbWlDWTJNYzlDM21SdXNXK3dh?=
 =?utf-8?B?THBRR1ZNNFRRdWJ3YUdXdTl0R0Q4M1d3NXN0c3E3d1dQUzdILy9OVXd5NDBW?=
 =?utf-8?B?c0pYV3NIU1ZoUmRHeFYxcDRVUFpSaGwrSm1FdEE5aHdCOXBYd1VMNWI2M3NH?=
 =?utf-8?B?WFZia3lSYmNTRm44N0kwNDhWN1pjV0l6VUFWbWd3RzJHOSsrVUdwdE9SbDJk?=
 =?utf-8?B?dnZvOVFDa2ZVUzZsUFRlb0p1SmhLSVhoTlRMOFBTejkwRkowM3ZMMGVaV2JV?=
 =?utf-8?B?REVrU0loanJEMkg0VVpzZlJaeGxhdDhtMjIvSnBzSVhMUmZHNWY5b0cxaFVV?=
 =?utf-8?B?S0J6OXFuMllKMzVZRThocEpGZFpTRloxQWpNTzFNcWJaQW9tNVN3di9vUkE4?=
 =?utf-8?B?ZTIzWUNKdm1TdGo1NUhzNzhtd0JEQTQ1cTVmTi9OZThQaS9vRWthU3Zwam9h?=
 =?utf-8?B?UkswMlZldXMrQ1lVb0srN3AyMmMyckRiM3dINjRTckFRaWZZckU5Tk1TMjBB?=
 =?utf-8?B?c1VPRW43TFU5NGtyamFWeUJvR0x1SzRUWDZYRjdqYlNEY2NnYXY5WmdjUVJS?=
 =?utf-8?B?NkhzR2JHeC9LM3JxRGUzbXRDNUNEMGxiZUU0YzZuaE9qUGh1RFErWWhkOUov?=
 =?utf-8?B?bC9tdFpZZU02RFdQUExsenk2S2UzRFZvOWlUUTluK3Y0bkw5eEZTaE0xR1dt?=
 =?utf-8?B?dE1NeEVoUmRZL1RsS3JHMkZOeGV3MDVsZUE3ODh4TDUxbkpXdlk4QWlwbi9x?=
 =?utf-8?B?eHdiODZEZ29TbWo0VWhHK3V4VDQyTWl0UjNQMklPY2RRZ0Juck85WXRGdnBR?=
 =?utf-8?B?ZzFmRm1MODBNTmkyMXRITzRld1J3QUFPVFdhbGtHU0ZFdWY4b2hWb2Z5MzNw?=
 =?utf-8?B?OXNPUVFidHlaRzNUbHA4S1dTMkI2eURJQjkrUnNsbUFycC9ZSnRzTEZrRjVU?=
 =?utf-8?B?WkpHWVNBeFc3MUd5QkwrYWFBTEs5T1d0V21XdFBTNFFaS1VYRUthV0NML0Rz?=
 =?utf-8?B?Ym04UzQvby9kYjcvZktTaStJa1VOdVhQUEE0Q1VrNjkwLzhoOGpmUXQybzBM?=
 =?utf-8?B?OVVIZlVuZkYvQmhkc3NSckszSTFaTGRyY0piTk0zU3JHcDhJMW9FcWtKOWgv?=
 =?utf-8?B?UnduLzNtcTN1dmpXZ1BuNWpJeWkzYVdma2V4elRuanJwSTBxMnpOa0N4Q0Fv?=
 =?utf-8?B?VDdUUHErdUFjSzhGM1MxYUtaT0VraHdzYXZabERRd1ZDTk5IMTJNaFdhK2dh?=
 =?utf-8?B?c0JZbDN5RmY5V2wzVVpoUElqMlRXNktCMVZkbFM5Nmc0dzhJZzBUNVc5VEcv?=
 =?utf-8?B?M0VTRzhDRWRUQUxMY0ZoOVZHeHJTRWhVS1hoTVNVQmtVUmZ0M3pZRkNXaHlN?=
 =?utf-8?B?WTZ2b0NWS0g0UXlWc3JiYTNTandYOGVyQXBOSlNnb3J4THNSVEM0QXprbnVt?=
 =?utf-8?B?YjEzUXVzNjlDd2tOZnJXdXdiZ3BHZzByem5uaWtRalB6YzNHUHFBeXoyT0Z0?=
 =?utf-8?B?V2w5bmE3YXRFWXpXT2YwOUQ0LzFJSnczMlBrWm1sWWpubGNLSERQWC8vSTlJ?=
 =?utf-8?B?dkN3Z01HWlN1WlI4QXY0QVY2VzBuekltU3BDa0NiZ2RBd0tZcy9DZkw4bUN0?=
 =?utf-8?B?alVXVXRSUkwzYWJUNG11bm5kNG5XS0xhWWkrUTZuR2hRWnpIVk1MVlRzb0x5?=
 =?utf-8?B?QkdFck9abFBST252RG5KdDUvbVJ6aStQNDQ3L05HUnFDLzVGYTRjWkR1WU1z?=
 =?utf-8?B?YWJscnhyeVEwMEthOGZIUzhZT2dWM0NWWnNFS0hkNS9XdVM5a1JGb3BBeXVX?=
 =?utf-8?B?bGg0ZzJUZVE0d2hJRW5yRzZoVTlMUTk0Ky9LVDdKNmkrS0grU0R3Q3hNNWdk?=
 =?utf-8?B?NlNBc2VkbFFsRjFqQzhnQ1g5ajhRKzFiMXNOUmh5RFdLSElPRkhYc1JpTXYr?=
 =?utf-8?B?Vkw3Rm5oSVhITTl0dU40bDk2Rk9nTzJ0OFNGVVM1M1dCdHU2d0RVdFczSFBo?=
 =?utf-8?B?NG14NHRsUkVuVUIyMGhDMFBNTEhCRjRYRitldUFSNzhMYm5rMmJwS0puS0VH?=
 =?utf-8?B?L3huVmZPTE5SOHROODdaTTVGMjl5MmVRbmtBbks0V0s2MXR4dEx6a2ZMbGNF?=
 =?utf-8?B?SHZZR0d3UUpQY25jLzdCaXlFRUhYck5IY3VDMHY0Ym5mOFlHbmp3aFUrYmRL?=
 =?utf-8?Q?yREie7GkJF4CJYUq50PEMzNy2lJusDudmBevQGjpcj11b?=
x-ms-exchange-antispam-messagedata-1: 7NZpjtJppV2sxSnybPPr3/eimMDCeRtrWS8=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0F771BD7D6008A4E979E79971B1FE1FD@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3PR07MB10721.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0c32386-7673-4dc9-62bf-08ded688e5ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2026 09:20:59.4620
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j9LXbYAwqG7G+z6GydJU3W9jONULG9tShQ0XOnkgtr2AaGO2QWnkSUt79XR/CwkrVJDkHcAZHYAySFDEICgh18yFbKULIoVyfKCDbTIb/IE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR07MB10617
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 09:21:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239872

T24gVHVlLCAyMDI2LTA2LTMwIGF0IDA5OjE3ICswMDAwLCBSb3NzIEJ1cnRvbiB3cm90ZToNCj4g
T24gMzAgSnVuIDIwMjYsIGF0IDA5OjIwLCBEYW5pZWwgVHVydWxsIDxkYW5pZWwudHVydWxsQGVy
aWNzc29uLmNvbT4NCj4gd3JvdGU6DQo+ID4gRG8geW91IGtub3cgd2h5IGlzIGNvbmZsaWN0aW5n
PyB0aGUgc3lzdGVtZCBwYXRjaCBkb2Vzbid0IHRvdWNoDQo+ID4gbWVzb24uYmJjbGFzcw0KPiA+
IA0KPiA+IElzIGlzIGEgZGlmZmVyZW50IGZvcm1hdCBleHBlY3RlZCBmb3IgTUVTT05fVEFSR0VU
IGNvbnRlbnQ/DQo+IA0KPiBZZXMsIHRoZSA6ZXhlY3V0YWJsZSBzdWZmaXggaXMgYSBtZXNvbi1z
cGVjaWZpYyB0YWcgKGZvcg0KPiBkaXNhbWJpZ3VhdGlvbikgdGhhdCBpc27igJl0IG5lZWRlZCB3
aGVuIGludm9raW5nIG5pbmphIHRhcmdldHMNCj4gZGlyZWN0bHkuDQo+IA0KPiBSb3NzDQoNCk9r
LiBJIGNhbiByZWJhc2UgbXkgcGF0Y2ggb24gdG9wIG9mIFJvc3Mgd2l0aCBvbmx5IG9mIHRoZSBj
aGFuZ2UuDQpUaGVuIHlvdSBjYW4gcGljayBhbnkgb2YgdmVyc2lvbiB0aGF0IGFwcGxpZXMuDQoN
CkRhbmllbA0K

