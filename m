Return-Path: <m.schwan@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6099D41C37
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 13:23:42 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.115])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9037.1765459416959114235
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Dec 2025 05:23:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@phytec.de header.s=selector2 header.b=gGpEcjgK;
 spf=pass (domain: phytec.de, ip: 40.107.159.115, mailfrom: m.schwan@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bSoDEYFVJluhCCVkUvPPY8zjZfqBTqU2E+TyH5JMDWmUwjhFuYyZm8uYqVIFMpEC1kdQkWYoAuFII2qnsINMrYTCbuW+IwsM6QRYQAolY7IwAKULgMTKlzLkFjgqZhj62SS331zK//J6ujz42loKmi7XbgiE9yX/YwxWviMwnD0mn00IjspYJaClTbusZjzvd1iV4jUsIShKWfY6+YnrOpH4rv/Ci42bFVxXQab+XSMIYAIgwiEExcEWqvLiYV6TatAQCLfTnDDQi+wojuuq8mhm4LeJ7v6egoCit4wm/NjtKh25xdC5a9HlR+qHXTxE6B4xZWRVyGKSWmzXRte6sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pn/jOUiSxbJC48rSve0wjmvUTMag0RzUWGmsBj4afgc=;
 b=P5Xv+kIvoY26uhLI1zeBWVpxAi06XO7GZ67k3WgB331gDeJPkR8MPikn3ycmziZ5xW3lPaaMtcLjXtxr3jlNhYFJ6eSKnENGStYgmooBj+UqyNpGYzZIGr1xEPO2l8ZD8LFpdLtAloX1WuSp7zfW5ExoWwbaF8Xkh7pjHqWPjsJK5ZGQo4+gNxAggaCwtbKY2vbOk+8AZettzlkagJf4Lt3Hp72ttVcuMeBef+7aexIm2UNVloNbADeYd0z5+ucM1wrvN3O/DKm/nuzzWVnqnehB0cz5QzvzeF9sW+OgWDyjniVmm1wWv/0wQoHFbjt8TRWLcp/gUmJQe3W/spC9NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pn/jOUiSxbJC48rSve0wjmvUTMag0RzUWGmsBj4afgc=;
 b=gGpEcjgKfX/6sFBoYrC3a6VSGPE0ftsYS/IrD1B42J+SDlTxsVyjlzUfCFv5gt7wyZUvvl9OBtm1+W002Z/Z9+ECFYPQmMVHVwEHwD/gAf3yA45U3Th58UTaaG4YCkNqfh2qHu/h68r5B/U3ZP0FVzEzENBoPuxwc70O+viQYIbCHVSyeJ7jYLpZi/eiboFapcB9/pSewBdO6VzDhC1PJkrh8UoQH3U7MgGgp2qBcwcH9Evg+iOh96jbap18zWVsRRXVcuCb8O13WSfTzW7RqRuhwV7RfvxWb/oHPZX6fGERzEP40g1WUwxdbyws+c9dQr2l9zpFWb+h3BOOQczS4A==
Received: from VI2P195MB2489.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:22f::12)
 by DU0P195MB1771.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:3b5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Thu, 11 Dec
 2025 13:23:32 +0000
Received: from VI2P195MB2489.EURP195.PROD.OUTLOOK.COM
 ([fe80::83ab:361:2a81:b582]) by VI2P195MB2489.EURP195.PROD.OUTLOOK.COM
 ([fe80::83ab:361:2a81:b582%4]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 13:23:32 +0000
From: Martin Schwan <M.Schwan@phytec.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] cargo-update-recipe-crates: Don't fail for
 partially empty Cargo.lock
Thread-Topic: [OE-core] [PATCH] cargo-update-recipe-crates: Don't fail for
 partially empty Cargo.lock
Thread-Index: AQHcXfWRtG5Dds9CxE26HvW0hj0qQ7UchsSA
Date: Thu, 11 Dec 2025 13:23:31 +0000
Message-ID: <cd485373cfa253d77f0e94ce6434cf90f61bc715.camel@phytec.de>
References: <20251125090059.3155853-1-m.schwan@phytec.de>
	 <CANNYZj96iASKujEQRjxVn9AMSRjHV7ep=oh6JbaZw+kWnOOsqQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj96iASKujEQRjxVn9AMSRjHV7ep=oh6JbaZw+kWnOOsqQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI2P195MB2489:EE_|DU0P195MB1771:EE_
x-ms-office365-filtering-correlation-id: 33f6c6aa-c0f7-4620-8df0-08de38b87af4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?eXVyV0krZTlrOFB6d1FFOWtmOGxsdjcyYVdtMWxBMmdjbHErZi9za3I2VVhn?=
 =?utf-8?B?UVRreWJCMnpBSExpdnFBeUFFV3BEaEtZY1lBTkpRcVdZN1BWMVhlOS9HNWVC?=
 =?utf-8?B?L1JGa1NTOCttWWROWnpyT3BFbjk5OEJCUjdtVGwydDB2SXpEc20rbUdLTFJH?=
 =?utf-8?B?cTVYQ2hzQnpzaE11Sk1palFidHNLdm9LRXpkbVVPTW95NGtudnNYaWNjQllY?=
 =?utf-8?B?Y2ZpQTBvMUpUVmJsdHJTZHN4cEtBV05qVTBXQXpnc3FMbHRiRmhReXZBU014?=
 =?utf-8?B?MEFTTHZjNWRxWXl3TC9adnhNYlZZUkVBWlRiNDlnbkhrV3Y5c3lzaGsvVnhl?=
 =?utf-8?B?bUxHZFpteFBObkY5UklhaUVGVVl1aEJOM05FVmZyRVlPQmF0VGsyK1NabVJs?=
 =?utf-8?B?c3VqdVQwV2hLWDZJenBpZ1dVQ0Z0WDc1RVBnQnVxaytSYjlmY2VkNmd5ajEr?=
 =?utf-8?B?NmkyV09oUkZNK1JzWXcxVld4eWdVb3JxckJ6RHpOSjhUdTRudmxRN1kyYXBp?=
 =?utf-8?B?OUxWRlI0ZlM2ZFNEcU9YMGhiZkRYTUkvaGZSNVB2MFRVbVQzZFpUeEZZck9u?=
 =?utf-8?B?eVFOMHpkRHNmR1BLTi9GKy9wbWdsWXcvR3JrVFYvMGxYc3p3dHZsUXdSU1Bj?=
 =?utf-8?B?a3dJd3VtbkE4WjJCWXIxOUxpMEoyb1JJK29YY2t4SlBHeVlWYmloS2k5d0Zw?=
 =?utf-8?B?SUFlQVNBaXpMTWxnYVI3NTdpRDNXMnFKYVdwdXVXMnFUUHNLSUJodDFjbG8v?=
 =?utf-8?B?OXVyWWlObFJCVkpQM09nZXZsMDJ5c25rbXVMRUNxQitUWTU4V0Y4UW5pUTVk?=
 =?utf-8?B?Y2xDWmMzNmtWR0ZvWHA2L21wTnNiaFJ3Vm4rWUNxRXQ2Y3dXY3orTS9sMDl1?=
 =?utf-8?B?SU5xSlBtOFdoZ3N1Sld5Wk82L3BzSkZjWFhEQkRoNEZUcndsZXpRUmRLZW1m?=
 =?utf-8?B?ekNCMW90Z0w1Sk8zNElOSHZlTHR0eXRudXRoYTZHY0p5UEVKRGZ6Mk8vcVJn?=
 =?utf-8?B?bERsYnRhVDdyK2t0TC9JSmxST3k1c1dQVkI4dHRWMG9KcTdTQ0YvNC9mRzN6?=
 =?utf-8?B?MDRNNm5SY0NiQnJIdktuOFZISEpjcDhBN3ZQZlUwNnNOT3pHOTFETURxeGRz?=
 =?utf-8?B?SHQ0QmtBU0hDWjRMdStWL1kweTRqT0RRRThwNVFwSFpEcGZNMFlrS1JFR2N5?=
 =?utf-8?B?Wmk0czQ5NS91S1Y3ZHpZdmNoNWlLbGFZNkU0U3ZTR0tMUTNoYSszaTFBeUd2?=
 =?utf-8?B?WGF3a0NjNzhtK0VTWVEvampHQUMwclR5N3czd3QwWXkxSjFjOGxxejEyLzY5?=
 =?utf-8?B?RjZ6ZURyYlBTZVRVUyt6a2Q3ekJGeUlBUEJhQ0tHeHVvVm1JZTBDZnd3WDl4?=
 =?utf-8?B?eXVIVXpMVm81WTlLM2tLdlJ6N1FZNCtFU0MxMytTMkdQTmxvOEpYUnpTMnA5?=
 =?utf-8?B?ZTQ3bHB4VGtzRmJQZU9MTjJza0U5Q0d1YkpNU1Q2MWZEL1Jpamw3RFhqbkgy?=
 =?utf-8?B?WDh5Ykw3MENyVmNDZWJDc0oxVW9UVzEzcEhYYUE4NHR6WGdKdnJ3NjZub3dp?=
 =?utf-8?B?WG1BTGN1SitKZjJZUjY3SEYxTU1Na29nOFJhaWR3SVI2dzYzRlZOdDFVM29U?=
 =?utf-8?B?WFI1UHlidzVFTGdGaEp2SkN0d21BNEZnSWVZT2I3bi9ZMzkwMzJHVHA4MFZM?=
 =?utf-8?B?U1lydlBtL3R0YlBHUzFRbWVWVTRTV2hWejhpZHNYaWczZ3A0RW9KUCtPbmxQ?=
 =?utf-8?B?OVV4eHhBU0pqTmh1N0d4NDNhcjdSdnF0N1Z6MVI1YlFMclFtRXhpRlZtMnZS?=
 =?utf-8?B?VU96WWtqU0wyN1JIa1hjYXFacUhFMlIrOTdMN0xYZmVOWlRUbVZLbUlFNlk3?=
 =?utf-8?B?STVEQmwzQ1RTNVlmVWFicWdaODdKclFIOFZnQXNSQXZiUW5tZDk2eTViMWxs?=
 =?utf-8?B?aXp3ZnRndHphaDU0cC8xVWpsMjRBNytQSGR2RHYxZHNmdHhiRjErRjBiRXlC?=
 =?utf-8?B?dWNUMVF6NVo4Z3VVNklYczBhVHIvL2F2R2lrL2FEMjAyaDhQbm55aXJIek9r?=
 =?utf-8?Q?9BgyHm?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2P195MB2489.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NERXUGdCaTBmSnluOEg5ZVA1WmF0LzFobmN6cUY4RU41c2JtSit2bDJYUkJY?=
 =?utf-8?B?ZFBIVFJITFQvNVgvTTh1a0Z3ckRDK04zc1JKcDMwSzA2Ni84M3owU3FWM096?=
 =?utf-8?B?Wk9SeHh0bHMvemtJSHZPWVh3dUR4M2dmZnA3aDI4UTBHUUpIc29laUdhUDds?=
 =?utf-8?B?cE1DcVdjZ3NscjZGbENpQlFreE4vZjVyMTlJemxVVThHdk0rc1JSTFJhTUsr?=
 =?utf-8?B?K2RhQm1GVHhDaS83cmhSOGN0NUFoaHlsSnRWVGlJNFZNVmJrdmNZY0V0RFo4?=
 =?utf-8?B?STlJaEZ1ZXFTMDFWS3J6OWVaanY3bklwdUZlbzFDVGQ3cC91dk5DZWVwWWs3?=
 =?utf-8?B?aXNMYTg3eUM4ME1kU3VSMHNDbUJNUEVVaVJyUlJDUTl2RERiSTFJYThHQ1JH?=
 =?utf-8?B?UXJ2T0k0aXlGQjZpNDhVTkRPczhVVzI5dExJZ2QrWi9FaHhnSDBkU2VKcitW?=
 =?utf-8?B?eHJSVlJLZTRMR0I0UGFnVEc2OENBL3BQUklyUmpiVFNNZHZPMFhWOUY0d053?=
 =?utf-8?B?T2s1akR1K01jZCt2Y3pVQUFVeUwzR1g5cEUvcWNBVkJCbHB5QzlMVmxVNitv?=
 =?utf-8?B?b2E2NUw5TkxXUXBDWGlqbTJCR1Jvd3hHSG9YaFM5a0ZXT0RucDk4bXB0QlVV?=
 =?utf-8?B?WmpwZlZSVldIYXNOb1gzYWFwR092MWVabDlXWEFZUUZHQVlzVGxCdDhSNU4r?=
 =?utf-8?B?VWJ1RmxpM0U4VXdUcFRaN0RHVWtDekgxa2U4c0g1Qk5wMHpnN1MwWnd5a2hm?=
 =?utf-8?B?aWlDb09Kem92Q2w0SnZieUlVVUxMaGlLZGhzQm9JTTBhYlM3eDJJQ0RzblE1?=
 =?utf-8?B?ODd3VUtCRTVpWXd2T3JZWmEyN2RMZU5FQWNKUS9EeFRhMXIwcitZVnkrcjFz?=
 =?utf-8?B?Q2FlNFJRb3ZWUTNpblJFZ3R0dm1jbjlYSTRxUWtNQWVRUmhVaENheWVvVk14?=
 =?utf-8?B?ejlrOE8rcEhJczI2RjdwazRVRC9hTzBaRnh3ZXlRVVlKSmtONlRZYVNZYXZN?=
 =?utf-8?B?WE9DSGlpNWs0MXlJdlNrNURnMnRCdHZRaU40VTd3RCswRmdtVmk0ampBdStn?=
 =?utf-8?B?dFpwL3ZJUHVKb3phZ3FBVHcrZG50a2xVZXhvT21LZk9JeUpBTmJENThYVlpz?=
 =?utf-8?B?UnBiR00zQWFYcm9UbEhoV1RyK1FSd0t1UFUvSm0vSnprSWNSY25MVjNCREFl?=
 =?utf-8?B?R1lmeFZ0SUhFc084bDZyYjliZXUrN1I5aWI3N0s5NXAvOG4yNWpWWFB2NFZJ?=
 =?utf-8?B?Z2c5NklQTmg3ZStNYjVURmo4MklrelZUdnB3V1F6R1NxWTJrY01DcHVEY2dL?=
 =?utf-8?B?TW8ySkZaa0xLTDMvT25zbzhBeml1REYzR1pPL25IVW5UcGNKK1dDVG54b3E5?=
 =?utf-8?B?ZWN3NmlIQ254c0dITjZLejZtY3BqZlBzUmwwNFFjTUZNUVhPWHRidm1iQkV5?=
 =?utf-8?B?RDZJUkkwNW5uaXQzeDhFd2VYdmVkdGtqSDVGaldQT1pLRzJ0TzZEZnRZM0hn?=
 =?utf-8?B?dUNabWhzREZCUXRnNEZ2QzlFM0ZQWVA5WlFMTk1ZZ1dIenFDNzY5eHFBRzc0?=
 =?utf-8?B?SkpVcW1uV0hTVTM0Ykk2VTFTbEJYWnhxYm0xbGRIYjZ6MS8xV2RxZ3JsZFFx?=
 =?utf-8?B?b08vaVZNdUhRbVFHbE5KSHA0ZS8yRE5Sa0ZKRmU0bHRsNWE1Y1hrRUY4VGhK?=
 =?utf-8?B?MzhPYjdkUlhwWEV0dE5VaHFIR1RWamtnU2UreGVkVW5ncmZzRjVQUE1OTGN6?=
 =?utf-8?B?ZFV4K1REQmhNSkhiMXVkalVReGVTazZGV25Ia0VhK1ZtczJOL0dkK2ZNV3M3?=
 =?utf-8?B?M0VRUFczYzRUajZhb3UrcWhERDhTNnVVekVXekNERG01OXk4WDkzUFhUeENP?=
 =?utf-8?B?VGZwbGFxa2hLRTVoMTRxdGVHS1pPcFgxWWZEY0RNVE9WWVZBeTRTcUdQWEMw?=
 =?utf-8?B?SEhqaSt1MGZ3SVFTQjBwVXVzcFlabmJCLzZOcFpSV2NwUG5wdEExS0VkYUlr?=
 =?utf-8?B?eVU1Y3Z6UDgrRVZXUlBiRXQ3cDlLZDRNUlFHN0owalVRcmcrUTMvb3dqY0tX?=
 =?utf-8?B?U3FadlVldmhRemdZa3lMY1AxQ28ydWw2dWxES1lHNFlJQlRUVHp1ZTRZbW8x?=
 =?utf-8?Q?1nvg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FC8B676D9571B4448160AD492A2A9DF7@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI2P195MB2489.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 33f6c6aa-c0f7-4620-8df0-08de38b87af4
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2025 13:23:32.0789
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7egbSCDQfAeAA6v5TVM3M2zTORdO7UzQ4hZOYNqkdcb24s9zaF26k1t9YYbjz7PZnGtE6PW/L70BbsVVcNg1fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P195MB1771
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 13:23:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227529

T24gVHVlLCAyMDI1LTExLTI1IGF0IDExOjIzICswMTAwLCBBbGV4YW5kZXIgS2FuYXZpbiB3cm90
ZToKPiBPbiBUdWUsIDI1IE5vdiAyMDI1IGF0IDEwOjAxLCBNYXJ0aW4gU2Nod2FuIHZpYQo+IGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcKPiA8bS5zY2h3YW49cGh5dGVjLmRlQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmc+IHdyb3RlOgo+ID4gCj4gPiBEbyBub3QgZmFpbCBpZiBvbmx5IHNvbWUgQ2FyZ28u
bG9jayBmaWxlcyBhcmUgZW1wdHkuIE9ubHkgZmFpbCwgaWYKPiA+IHRoZXJlCj4gPiBhcmUgYWJz
b2x1dGVseSBubyBkZXBlbmRlbmNpZXMgZm91bmQgaW4gYW55IENhcmdvLmxvY2suCj4gCj4gLi4u
Cj4gCj4gPiBXaGlsZSBhdCBpdCwgcmVzdHJ1Y3R1cmUgZG9fdXBkYXRlX2NyYXRlcygpIHRvIGJl
IGEgcmVhbCBQeXRob24KPiA+IGZ1bmN0aW9uCj4gPiBhbmQgdXNlIHRoZSBjb3JyZXNwb25kaW5n
IGNvZGUgZGlyZWN0bHkgaW5saW5lLgo+IAo+IFRoaXMsIGFzIGEgZGlmZiBvbiB0aGUgbWFpbGlu
ZyBsaXN0LCBpcyBpbmNyZWRpYmx5IGhhcmQgdG8gcmV2aWV3LAo+IGFuZAo+IG5lZWRzIHRvIGJl
IHNwbGl0IHVwLiBSZWZhY3RvcmluZyBpbiBvbmUgY29tbWl0IChleHBsYWluaW5nIHRoZQo+IGJl
bmVmaXRzKSwgZnVuY3Rpb25hbCBjaGFuZ2VzIGluIGFub3RoZXIgcGxlYXNlLiBFdmVuIGJldHRl
ciBpZiB5b3UKPiBjYW4gc3BsaXQgdGhpbmdzIGZ1cnRoZXIsIGFuZCBleHBsYWluIHdoYXQgdGhl
IHBhcnRpY3VsYXIKPiBtb2RpZmljYXRpb25zIGFyZSAocmF0aGVyIHRoYW4gdXNlIHRlcm1zIGxp
a2UgJ3Jlc3RydWN0dXJlJykuCgpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4gQWRtaXR0ZWRseSwg
SSB3YXMgYSBiaXQgbGF6eSB3aXRoIHRoaXMgb25lLCBhcwp0aGUgY2hhbmdlcyB3ZXJlIHF1aXRl
IGludGVyd292ZW4uIEknbGwgc2VuZCBhIHYyIGFuZCBzcGxpdCB0aGluZ3MgdXAsCmFzIGJlc3Qg
YXMgSSBjYW4uCgpSZWdhcmRzLApNYXJ0aW4KCj4gCj4gQWVseAo=

