Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D3BC88E5C
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 14:14:48 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.16])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16083.1789568084632249068
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 07:14:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector2 header.b=YgLDOoe9;
 spf=pass (domain: ericsson.com, ip: 52.101.72.16, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KeKbXcsG+/TkGOsV+4Xa0vloeOwOa5XdOPNkC4EgyHvOU5d6a7eXFqIn5rHmFmcKFYvHAs83lwE4Fq7BH/5D8g7vlD+bkR3nTLufe3eSUMpGxlBeLZLZu+RapwzqBnl6Au4Pkngg5qbfA9WQqZmvuAUxB8ALGQGvxpgJSgDwSxYv83lld9e8mLk6YjIpJP/lm3nwlCK5NKL8URDrOI9vNYk1Ws0mUZ4P7DitL+mRhozDLH/yzKTTUYkdBdHuwKm5JDTj6A6Ie6uBvlMHEsX7AJFDdDy7te05quNakRVZfQmONCKmn97nL2DCTbw4qV/fWOQEonDnftIH/Wmg2F6u8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjLoYmCfXZJW/OOyTjJMy3VIhiFwQn6WZ7Vr2MSB9do=;
 b=O947I0t1scgPEixumkWNe+YUl8k42ldtzetVnY1OvxdRgp6nrCMK8fVEjagxLPywOsAzySohy34mQcx5yc3Bgb91XZkqyXhvLNs+J4W671DT3wrVaAFGt/iyfvmv2Ev0OzFbdin4eWZ6iXUHTS3HqOsPy37y6uQZrMk4f17UO5iyEmnyRez9e2r1LRHt+4bO3JO90kPtEubJf096V2D9+84Y8bhiVwudltNv3WMGgzWFiFc3c7zv6R7qjwQ/fh3q6UdvyxVEq8SzAJKMaRVp6N/UsW7LAMWL+AHy3q2kSL4DQuVHy7sfT8oZUiXK3o84LvEjle/RNz7e4iYQOBLdVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjLoYmCfXZJW/OOyTjJMy3VIhiFwQn6WZ7Vr2MSB9do=;
 b=YgLDOoe99QxBn84lRgyJ/mKo+pNS6IWy/gaOiW1N2hklT++5pNIBh9lGXg0mcjcwXnKVpaPMqu+0oN7n6Uz5B0P0+gxQk8J6YtkYKmJmhtkrxbWK/huJklYJm0XhUM/zX8WnhxMu45Yzis1E7DKuRrH2NFToVscFMm0BNV3D7lNco10BsIYFhapVr7AsHQ2hDlpvLX52Jp0rIAeaE3A+fNOOFLvwyJpkMyPRFjukpvtMAXUxlCNAcH+TlwJ96gp8gUo+U6JL6UKf1YVkajwby1c+gmiEXWyGXD6c9TeGuzemU41H7VNmlurqSVII9wH4yY4suwq5GZyStzvegRKxrQ==
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com (2603:10a6:102:4af::6)
 by PA4PR07MB8694.eurprd07.prod.outlook.com (2603:10a6:102:263::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Wed, 16 Sep
 2026 14:14:37 +0000
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7]) by PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7%2]) with mapi id 15.21.0428.009; Wed, 16 Sep 2026
 14:14:37 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "yoann.congal@smile.fr"
	<yoann.congal@smile.fr>
CC: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"antonin.godard@bootlin.com" <antonin.godard@bootlin.com>
Subject: Re: [OE-core] [wrynose][PATCH 01/20] recipeutils: add optional
 stable_upgrade parameter to get_recipe_upgrade_status
Thread-Topic: [OE-core] [wrynose][PATCH 01/20] recipeutils: add optional
 stable_upgrade parameter to get_recipe_upgrade_status
Thread-Index: AQHdOsHCCPZ1R89UAkqfZd5QmR83/rbRU0KAgAACoYA=
Date: Wed, 16 Sep 2026 14:14:37 +0000
Message-ID: <633cbd89777e41583f9b7f7a89c008f0b3f89cf6.camel@ericsson.com>
References: <20260902095920.2840293-1-daniel.turull@ericsson.com>
	 <20260902095920.2840293-2-daniel.turull@ericsson.com>
	 <DLGSQL5WVBRG.2R6OMWQMQSRTS@smile.fr>
In-Reply-To: <DLGSQL5WVBRG.2R6OMWQMQSRTS@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3PR07MB10721:EE_|PA4PR07MB8694:EE_
x-ms-office365-filtering-correlation-id: 5e08208b-957e-47d0-4c8f-08df13fcd76f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|38070700021|11063799006|56012099006|4143699003|18002099003|22082099003|10067099003;
x-microsoft-antispam-message-info: 
 YXbSqD8WnD5J85ZXTn22tFyg2Sw3PdUQbLi5jrXWGpEc8SXIufNpZ0G8m0iJGYzFxXJ+sMVeq9sq/FmkZWI8YJsSZTkiptJpfZ+6Lw3KGnvxVVZ6k8AMfEmUmmQxaNf3UrKjgCrG1AbZ+s7VPsHPiT/iIlTpQnFPB0kYbhT+kSoS7WG1bYtJDDXfZnmTOURNTOxRuJOjXn4NmRCDMau04Yu7z/YYTd+Lycdq00bVLCdlgp3vniknfmebScQoyMI4EPpopMBulVXXGIeI932iAvwSI6DL4VQYbC565OZaPx9eZsOrlKc493nkKyVI61g527EIxHTfvzQqOKLvI8mi5XeM2KbbU/t+zQsbo8I8vAhOC39iyDO/rbOIcIE/dbSCOAjjSO/W/MJVOmq354VwtOymOu9Mgp3QQPRPXmiy1ksRQis0QQCdsgEaTMMEKwHw/LjX23grd3VPog6F+yHDqS06y3VsfrIItIISMhbEMAgwEwJOqJvpx8DYQqxY99h9t2RyqRMXxvHGejXlkUj2nItOIq8vhIw0fd4dEBE0aHVTzwPFI2b+PeW5Mkkfdy3kum7CQ3u/xYTo8aoTr3GLadlBxOSclzU0WG5KdWyWc5wUE9XxvXl0LT1kRZvc+hjxLSLpzp7l8keKUDDWb5KAhS04D6SvrwZ/OwHPOIUtclQE20nBkM5FypLc2dxFP7rG9CsPZ4VdfLAPjyk5EYupLXK9W7ZaUQQ5NnEKtgNh1Fc=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR07MB10721.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(38070700021)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?V0RyallwcnpmZUx1MmVjbFNONTdEQ3oxdVE2OXZScDJnOGgvczd3VkFFRHlk?=
 =?utf-8?B?cStiRzVLMTQwQkpCMzN4YVlwQ2MwQXhrbHQxekFwRzh6WS9ZSzlFdzl5ZkRE?=
 =?utf-8?B?eUl6TE9PNFFSYUwzOFFRUHZSaWMyWXRPRUdpZ2N1QkkyMEIzRjI2NEd6bUpX?=
 =?utf-8?B?ZG00RnltejFZUWRkZEtGV2EyaUZScktIRjJVT0pvOHpFbzRpS2Nrbm9yUkc0?=
 =?utf-8?B?NlNWcGdzU21nYS9vSVFkMHZhTGlEQnhVeDE5K2xDYWhsWXVJbC9NSTlndFVM?=
 =?utf-8?B?TS9WTkRja3JhS2tCYkt0WG9DNUp0aE9vQjd4N1B2TzdIdEt3cWw4VGVOWUJo?=
 =?utf-8?B?NnExRDEva1IxLzNPR0JlTkROM05VNkRSc3Y0MStGK2tCTXR2aDloN2pWaEd1?=
 =?utf-8?B?aU5zU0JWNFhTMFVmSEhKc2JaZ2Nwb1B4RUx6K1B6TXMxdHhKV3RkUm9xMUll?=
 =?utf-8?B?UkY2WW90MHpuYlRxWXF6Rnh5T29KRG9YeW8rOG9lL0syYlgva0lFNlBLbmVT?=
 =?utf-8?B?QlhXQVJCSFgyTFFOYmFMb29xU25VbnpKL3VUdUJiNjNtdE53S1hLYjBJSGVM?=
 =?utf-8?B?MWJaaC9mbDVwbjR6R2RNTlJnSWR0eEliMk5Fb2xoeDcvYVpGRWRvd0RvZzFv?=
 =?utf-8?B?SVpJdGhZUmRJVGNXd2p4eXR3NDNvRU5kY0lJVWdzV0tuQjQ4bXM4VjhmTUpF?=
 =?utf-8?B?cWJ2dnI2WnVnUmlOQlBreFFUV3piRkR3OUVKOHAyRkxiQ2hJQnlWZGMveWhM?=
 =?utf-8?B?ZEVGbWkxZjJFaCs2QjF2enRhbXhkWXltOWVkdmJZb3JaeXZkNCtnbDJybnpo?=
 =?utf-8?B?SllTQVNxVWI5RnVPczdZUFIydDBnZ1A1NnZyZk1PYTRsb001SG9IeC9YQmNI?=
 =?utf-8?B?TWw5WE5zOXp1NzRmTGV5SzNLcE53MnZOSHVSY0xSeUcyT2sxa1JjdGRhdUVp?=
 =?utf-8?B?aDhlalJPc01UdjF5b3I0aWE0YWFVQU5pYkVNdjRDMTRMc0xYUEhMbURRaWFh?=
 =?utf-8?B?cU1UNktNZlBoWjFtWDFDNGs3MUVwZzJ3aDN3aHpmSCtZMUNFcVY4b0QrZzFj?=
 =?utf-8?B?Rys2MGFHdU1sNDd1TEVWNS9pdlZDNlc1K3U1RU12T3B5ek15OVpqaG9GSTA4?=
 =?utf-8?B?UmRHL2RLZktidTFZdGwrT25oZHlIZm9heXdRT0RXb3NqZ0JmYTgzK3dCdDF3?=
 =?utf-8?B?K01ZenlWbFBaZjQzcXNQZ05rMjRib1RHc0M2SUNUUW1kYVUrNzl2ci80QkdE?=
 =?utf-8?B?YncvdVk5T1UzZHB1WHhPQlAyREZnRU9yTnNRdlBsWmI3RlVpVjZ1cnB0V21L?=
 =?utf-8?B?OVd6OGt3TUpQaC8yU3p1eEFlZWU4Nk8wQy9ONHhPTE9qRzg4aFFGZi9HUlFv?=
 =?utf-8?B?Nk4zOWVsa0F3dTdtUVBZeW9uQnVCanNDb2pBSXRqTGxDN0pzSmtRSXFEcHl4?=
 =?utf-8?B?eVhUQ2dqNjEvZThOclBYdWdTd3kycExFMG5XejFpQzJDWWhoY0FaV3cwUUZ3?=
 =?utf-8?B?SFNlSEhRSU11bHNLM1o3OUJxV0NsbnJEVjE5VHhwemltM0VvVll6ZDJIUW9G?=
 =?utf-8?B?ZDl6OTJtaWl2UzFvOGY0TnZKRHBldm1zaUJ6RExMZXlXSzlqZmdqRkNGSlNP?=
 =?utf-8?B?K3dMeWh2aUd0Znl2aTdsajAvUzhLbGtEK2VmQU1VOGpaaU1rL2U5QnZzd2Fr?=
 =?utf-8?B?SGVqb2pnUGIxLzZYVW9jaFp1ZXZuLzhSaS9wZ1Z5WVFibkUzK2p5d3lXa2VS?=
 =?utf-8?B?d0VaWE42ZXNreXFjS3E4MTZqNjZuc2ZCYWxwb2Y5b3FoNWdHMVE4d1dqR0Qx?=
 =?utf-8?B?S3dlWjErRVZrQ1F5UTgvYTdXZzVGdGxMdEJmbkIwcUFDczNIY3MxWWlLS2pU?=
 =?utf-8?B?czhxY3g3aEJBVnlYL01ESDh6MlA1TktlU2F3dlJ4NXMvQWVSM2J1UDBqdDU2?=
 =?utf-8?B?TjR3cE9hNzJacVJaY3RmZkpqM0MzYlJuNVJFUjA1VTBxZnZhK0F1YkdJNmx3?=
 =?utf-8?B?dWJrb1lMSngvNm9vQ2poTkZnZVpzVko0cTlrN2l6dWRLTmJvUkVqWjUrNmQw?=
 =?utf-8?B?bWUrbDkwMFlnVXg5UWlrbXJGaHcxbUhoeUd3SVYybWFNWURmMzhYbkdXNkl5?=
 =?utf-8?B?UkJ2MHF3ajMrQ3Z0eW9jTFhnWnNSOUNiL09nY3VUMU1STkx4OEp6L0gxeW9L?=
 =?utf-8?B?NEx4emJYdGNhcE1RSXQvUzJQWkwvQWI1Z3VEcElKaTNYZmdjMWdOaDlZOEE3?=
 =?utf-8?B?M0ZPOGRkVjZrWWlVOXNPZ3d0K1JRVjhNanBDOGMxdXpXdEx1bVlYUHFwNkx5?=
 =?utf-8?B?N3Izc0k2YTdHcGFWc1ZKSjFMYm9UUHRMVnFleGxYYzc4UjFXd09ITVh1RVRI?=
 =?utf-8?Q?WqUoI0ki1WqzgPc8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <33E1DEA2ECA99A4ABB4514E39025BC52@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3PR07MB10721.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e08208b-957e-47d0-4c8f-08df13fcd76f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2026 14:14:37.6879
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mtxdvlPVKMRox1Op/56Fi5E/0w6V7HJQ6yK+rO7zPVvZ3O+hTZY+iQUdrCNbekdT0+uoTC8AcRhKPcrd6E2YRMfq6bycx3jm/AEjmcMn9tY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR07MB8694
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 14:14:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245977

T24gV2VkLCAyMDI2LTA5LTE2IGF0IDE2OjA1ICswMjAwLCBZb2FubiBDb25nYWwgd3JvdGU6DQo+
IE9uIFdlZCBTZXAgMiwgMjAyNiBhdCAxMTo1OSBBTSBDRVNULCBEYW5pZWwgVHVydWxsIHZpYSBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOg0KPiA+IEZyb206IENoZW4gUWkgPFFpLkNoZW5A
d2luZHJpdmVyLmNvbT4NCj4gPiANCj4gPiBXZSB3YW50IHRoZSBhYmlsaXR5IHRvIGRvIHN0YWJs
ZSB2ZXJzaW9uIHVwZ3JhZGVzIGZvciByZWNpcGVzLg0KPiA+IFRvIHRoaXMgZW5kLCBhZGQgYW4g
b3B0aW9uYWwgc3RhYmxlX3VwZ3JhZGUgcGFyYW1ldGVyIHRvIHRoZQ0KPiA+IGdldF9yZWNpcGVf
dXBncmFkZV9zdGF0dXMgZnVuY3Rpb24sIHdoaWNoIGRlZmF1bHRzIHRvIEZhbHNlIGFuZA0KPiA+
IHdoZW4gZW5hYmxlZCB3aWxsIHRyeSB0byBnZXQgdGhlIGxhdGVzdCBzdGFibGUgdmVyc2lvbiBv
ZiB0aGUgcmVjaXBlLg0KPiA+IA0KPiA+IFRoZSBVUFNUUkVBTV9TVEFCTEVfUkVMRUFTRV9SRUdF
WCBpcyByZXNwZWN0ZWQuIElmIGEgcmVjaXBlIHNldHMNCj4gPiBpdCwgaXQgd2lsbCBiZSB1c2Vk
IGFzIHRoZSBmaWx0ZXJfcmVnZXguIElmIGl0J3Mgbm90IHNldCBleHBsaWNpdGx5LA0KPiA+IGl0
IG1lYW5zIHRoYXQgdGhlcmUncyBubyBzdGFibGUgdXBkYXRlcyBvciB0aGUgcmVjaXBlIGhhc24n
dCBiZWVuDQo+ID4gY2hlY2tlZCB5ZXQuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogQ2hlbiBR
aSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEFudG9uaW4gR29k
YXJkIDxhbnRvbmluLmdvZGFyZEBib290bGluLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBSaWNo
YXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gPiAoY2hl
cnJ5IHBpY2tlZCBmcm9tIGNvbW1pdCAxZWQ4ZmRkYTAzNWRjYzIxZjNkZjcxYzBjOTk2OTczMjI0
ZjRmNjgzKQ0KPiA+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBUdXJ1bGwgPGRhbmllbC50dXJ1bGxA
ZXJpY3Nzb24uY29tPg0KPiA+IC0tLQ0KPiA+ICBtZXRhL2xpYi9vZS9yZWNpcGV1dGlscy5weSB8
IDIzICsrKysrKysrKysrKysrKysrLS0tLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNl
cnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9tZXRhL2xp
Yi9vZS9yZWNpcGV1dGlscy5weSBiL21ldGEvbGliL29lL3JlY2lwZXV0aWxzLnB5DQo+ID4gaW5k
ZXggYzY2MDRmNTM2ZC4uN2MxZGY1MThhOCAxMDA2NDQNCj4gPiAtLS0gYS9tZXRhL2xpYi9vZS9y
ZWNpcGV1dGlscy5weQ0KPiA+ICsrKyBiL21ldGEvbGliL29lL3JlY2lwZXV0aWxzLnB5DQo+ID4g
QEAgLTEwMDksNyArMTAwOSw3IEBAIGRlZiBnZXRfcmVjaXBlX3B2X3dpdGhfcGZ4X3NmeChwdiwg
dXJpX3R5cGUpOg0KPiA+ICANCj4gPiAgICAgIHJldHVybiAocHYsIHBmeCwgc2Z4KQ0KPiA+ICAN
Cj4gPiAtZGVmIGdldF9yZWNpcGVfdXBzdHJlYW1fdmVyc2lvbihyZCk6DQo+ID4gK2RlZiBnZXRf
cmVjaXBlX3Vwc3RyZWFtX3ZlcnNpb24ocmQsIHN0YWJsZV91cGdyYWRlKToNCj4gDQo+IEkgcGxh
biB0byBiYWNrcG9ydCB0aGUgZm9sbG93LXVwIGFzIHdlbGw6DQo+IDZmOGFlMWVjZjM4IChsaWIv
b2UvcmVjaXBldXRpbHM6IG1ha2Ugc3RhYmxlX3VwZ3JhZGUgYXJndW1lbnQgb3B0aW9uYWwgaW4g
Z2V0X3JlY2lwZV91cHN0cmVhbV92ZXJzaW9uKCksIDIwMjYtMDYtMDgpDQo+IA0KPiBXaGF0IGRv
IHlvdSB0aGluaz8NClllcywgSSB0aGluayB3ZSBzaG91bGQgYmFja3BvcnRlZCBzbyBpdCBpcyB0
aGUgc2FtZSBhcyBpbiBtYXN0ZXIuDQoNCkRhbmllbA0KPiANCj4gVGhhbmtzIQ0KDQo=

