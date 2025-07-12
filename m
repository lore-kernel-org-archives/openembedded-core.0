Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2513C83F10
	for <webhook@archiver.kernel.org>; Sat, 12 Jul 2025 12:20:55 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.16])
 by mx.groups.io with SMTP id smtpd.web10.35201.1752322850734426926
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Jul 2025 05:20:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=MchI3Rlh;
 spf=pass (domain: siemens.com, ip: 40.107.162.16, mailfrom: adrian.freihofer@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uB0x2TlF1TzKZCeEtANAbIJkgyq/edB47lEcj3AFwSmRvcWxZtnIKyVOjBGzoU0DMwvS2CDENPp9jjG2/RelsFRH6ajbAgLntoTqcOf5FeB4nEBoTLIdotVW321LxO8cDBLeYGSM41+/SPiq939rTLPA3CGze2iwUOWuGuWsbSTNdb3FLfxA4CeXj6v78Fscb+OaqOClBfcR/1E/J9/8HG0irzDtPjVo4IKJGQcqDWxjDU+BfXjjTNPQjqhywkygeUYa+0lmWTtgDE6CpRJAaXJEa2Lk0gZy/tucQJzpBnLwtD/oFvix2T0avlrsOELXZDmd9aZq3INKpFWzQIciFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ORAu6i5YIIds+usMgCzGSh3MjSQHc/1ZyroGwQVpvjY=;
 b=L8V1ebyHD9r8QIpqqRLLsLQz9iLJmpUS9Z35bDrdPWxhlIYDxCvfk8OR3USndvBOLtwkXHZGdzkv2XhICMNsyIYDYuj1qt8nGCKjjxlFPpYVgSjTtAbWTYwSadCs58+5UPRIJirEq9l2dh9l1pWwxweDyTvNKlE6cFELpVIXqyF5+DrnlrVTTVOq8zKiptiDmuOjY7fbQ4k0vh5XeuAlwI5PzcIm3fmlIOfoDoFuvkPOT4JavH+2X+S4pURGCyIi/CaCBGHSYhudiPK9i9DgK1xBmQjuUeM8HEpZrQhCJuVoOiz5IQMCIX7FOmFlYcXuMcOCde08pYv0daejjqnPWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ORAu6i5YIIds+usMgCzGSh3MjSQHc/1ZyroGwQVpvjY=;
 b=MchI3Rlhte/Q0ECKN4yXOS37ViVcH+My29yF11i86AzM6+1rf2iFQPT8hkG5FBJSvZGxMxeMWFvNr3I4xtc2ZLH9FBwBh6VWTdiRiURUALhyixHj2Lzr+5smTcVlrkNjFTntwJXAeB2da08VHxmqS9pkIT588NxCblUKSxDvbzHDuW7sf+J5ACQY9gbrF05I4dJXlji+vycKOoZ99Sl/MvtnNaapKbRQVNE0UGpUqpNwSpFVXbTs9DqbTjwI31A5hWr0Yej5aDfeOLZ4EJmmNzxnGsCAsfABrUdYAcAbDIuQKzlZ8FCR+dyv2XZJbfDAkw7SocCtBw0KYJRQsxa2tg==
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:13e::17)
 by AS8PR10MB5950.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:529::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Sat, 12 Jul
 2025 12:20:46 +0000
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e586:9cf8:7696:cbda]) by DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e586:9cf8:7696:cbda%5]) with mapi id 15.20.8922.023; Sat, 12 Jul 2025
 12:20:46 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: "Pascal.Weisser.ext@karlstorz.com" <Pascal.Weisser.ext@karlstorz.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3 1/1] systemd: add rdepends on libnss-resolve
 to nss-resolve PACKAGECONFIG
Thread-Topic: [OE-core] [PATCH v3 1/1] systemd: add rdepends on libnss-resolve
 to nss-resolve PACKAGECONFIG
Thread-Index: AQHb8B1OUDWutJmBoUubkgQivGEy3rQrH0iAgANPRoA=
Date: Sat, 12 Jul 2025 12:20:45 +0000
Message-ID: <0a16102b2485ced8ce7e7dd6fff79547f8a2956f.camel@siemens.com>
References: <20250708153030.3324742-1-pascal.weisser.ext@karlstorz.com>
		 <20250708153030.3324742-2-pascal.weisser.ext@karlstorz.com>
	 <1850DADD9952DE68.30268@lists.openembedded.org>
In-Reply-To: <1850DADD9952DE68.30268@lists.openembedded.org>
Accept-Language: en-US, de-CH
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-1.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR10MB3529:EE_|AS8PR10MB5950:EE_
x-ms-office365-filtering-correlation-id: 6db7a680-46bd-421d-6372-08ddc13e8761
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|4022899009|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?OGFpOWxoeDcxNDB6V01ZVGU1TWxRYzVmMFFCeWRDUUkwRGxjbmdLWWtKVVJN?=
 =?utf-8?B?WFVkaWUzQjFnM0RXd05aYlRNc1dONWlVOHc5WmZaUFhrZys3SDR1Tk1WcXdQ?=
 =?utf-8?B?VExxVTRGOGtXK3k2Ui82SkRmaHZDU3MyWGFrV0xRNDNTYm1OWVo4N1ppU1Vz?=
 =?utf-8?B?bTdWVjExOTVKZGRNNG9URVhmRzBqRG5RUFo3OWtSRWk5V3gwcXovRUJSeFNZ?=
 =?utf-8?B?U3BCeWRzWmRyVkhNWXJMcVF1QksvR3hFT1Avd2JnZkk5c240bDgvNUhxWFRC?=
 =?utf-8?B?cndvY1ZRWTg5NjBtUFErRGZsdnJzeU1tazlVZ1BxT0pJSlVKWUFPZUtMYnhy?=
 =?utf-8?B?d1pCYWFTRUFoaHRhS0hVRlZqZkxoekl3QUhxbENiVk92bkZDRHBKR1FSdERL?=
 =?utf-8?B?OGc0NGJvejRxcXpzUURlTDBhTU5JamozeWVKODc1WWs5OWpYbmpYeGs5WGJw?=
 =?utf-8?B?ZXRnMldmcWVJbTQ2MllhOEN1a0UyWG1QOCtuRnhsUmdEdjNjZ2gzbERpOVR4?=
 =?utf-8?B?NVFORm9mTHBOSDd2WlRwU1FYekxURkRZSEtjaHc2YmZ0MnVhRWh6Y0RIYjdL?=
 =?utf-8?B?YlJMT29QVGFiWmFlbHVsVndmQ2dmWWw2N1ZDOU4rRkROMEtLWTd6ejh6YWpP?=
 =?utf-8?B?RmsvNUE1MGZtOGZYVm1uZmN6UWRmTFMzdldDckMxTEwvNGQrOVNZV0NjcG05?=
 =?utf-8?B?RlRUZE5obXNYaGZIbTIvNko0WFY2Y0FVTFJhVktlR0UvRHlVaGNnMGxXZUhI?=
 =?utf-8?B?Z1JYUXljaUhlTnl4cDFqRmVEaCswWURYRnJnTTVGMXpCODhHRkNaZlNmb0U3?=
 =?utf-8?B?ZTRTK1dOZWpmazJ4ajdFUE05RW1pRTdWcGdRNU1XM0ptbXRBRW4vd054Y1U3?=
 =?utf-8?B?amZLOUgxa3pXQVh6a2FweWVybGIybFU1Uk1CUGtvcHV1NFBsUHIvRkxHbUtm?=
 =?utf-8?B?OWFUOTdUZy9BVEJ4UFVWOTlLUHpQM1liWDJ5OEZHVkhsd2lDeGVGZWRKU29N?=
 =?utf-8?B?SEFxYTg4bUZ0Wm1UUWl4RkJiUS9BNVN4R1lhOUM4bk9wYjBMWXJBNmN4L3FG?=
 =?utf-8?B?TEdiMG5VbXhLVTZHeXVDbWx6eGVXYmxFcUZxb0d4RW9RSzFmb0kvaytoOU55?=
 =?utf-8?B?WnRNaDJEenB5S2V0UjVHNzFtNFE3cXRhYVZTUk9PQVpHeHlRVTBzckRXa0Rm?=
 =?utf-8?B?enpmMVVSUzRmV1FOTTJpelJ6WWg2cGpvYnZYMStIVEZTWWU3TWVFT0RFRnk1?=
 =?utf-8?B?WFhPTHV2VnVaWVJFdzR6V1ZrS2UxR1FuRS9qZTd6Z2I0UVVvK3RNa1lPZlI3?=
 =?utf-8?B?a29iK1JTUGEzdnI5ZzdpV1o5MWVNam1pcEkrUUdHUWQ3cTBFQzRORytHWGV4?=
 =?utf-8?B?VE15UTU5TkE5cFNQNUR5YWJYdS9PQi9rUjNpZjBsVGxYMElQdjBrUFVBVndq?=
 =?utf-8?B?OVBETStZRXZPTjVtRTFudWFGZEdkSXJ6L0xIM2xyZGlpay9jVWNGK1JwWmJx?=
 =?utf-8?B?cGc2RFpkakJnZzB3NGNIc24wNWhTcFJsdjVJNGVxTyswa0hINVlpTHVoNDZC?=
 =?utf-8?B?QkIvSmIvTG9jUjNHME1yWDVkZUJGN2k0MGNRSTVuWXA4OUFhM3JkVVFWb3hi?=
 =?utf-8?B?ZnZwZWo3WHUxT0V2eE5vb3UvRzlGaTMzNkk4NVQ5R2ZESnhISXhQemtacUc5?=
 =?utf-8?B?ZXFMWlA3eFYwN3lEa2JLVlJzdTJydlF1TU84ckNwNW9FeURyTGVQZXk2Z0RN?=
 =?utf-8?B?clI5bmtPL3kyQzF5VzdDZUNheUlZd1NjUzFuTVQzRDdjQmZMTEVFQVU3OHVF?=
 =?utf-8?B?OTJSVmZUZ0FxdFAxNlZheDNvdnM2QnYyd3U4bEJ5bW5iNmZ5Nnp5RUE5UTM5?=
 =?utf-8?B?cFBXNWNldTNmK1pVUjUxOE84Yjc2QVQxMHc5Z1BpTTdtd2Y3T1MwZDdiNFFt?=
 =?utf-8?Q?Td6gPhGXzzk=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UlJaUWlUYjV4dWJxQXNKRW8reUJvRVloZFFjUkhSVStFWmY4bWxqR0l0QVlD?=
 =?utf-8?B?VHhaVDc0b3RkK3UzdmwrNWdXT1J3MXNESVVMcUt6aG9rdjYza0dYU0dId1J3?=
 =?utf-8?B?aVZHRzV3amRTcmlKQXE2TXA2TUViMG9NaUlCc285bnZLMm12Nm1xa0I5WVVQ?=
 =?utf-8?B?SXdMUW9KSExoSTAyMmRiRTZmVlVEQWJRc0ZCKzJwZHhqOVlOaXFIc0FBSWpi?=
 =?utf-8?B?Wjk3eU0xeWxGQnBhN2ZYZ3RlaG9oNWlaY3dqUXVBM0hkU1BjMEE0L1p0dURl?=
 =?utf-8?B?WDRDTlp6ZWhlbTA0QWFnYVpIZlpVZXRxRFlXMDJBQ3FFOFR2UFJ6c081ZnZy?=
 =?utf-8?B?QmZqRUpVY1daZlZVeHFBdHY2Vko3WG9yLzQ2MjVqREJocnpLUERuMHlRYnNp?=
 =?utf-8?B?ZFg1WHlBSWZKaEhMVW1ONlBOR1BsVlBQbzJpYnFOdnJwNytiamNIWkdET1Nx?=
 =?utf-8?B?TzBpUWtNajRvUngzMENBV0R6SytLb05ibHhSSXU0cklLSXhaNkd4aWhCWkUx?=
 =?utf-8?B?VWl3UHJLL29uNXVHTHVZNU5OT3g1VG02WWx4T1NxcUtXZXVTcGNtdHc1MHVw?=
 =?utf-8?B?TDlqOEw3dktGdlFrUDV3Slcyam9qTUxUaGNkVzZRN01MTWV0ZytRYmRaSTJi?=
 =?utf-8?B?NTBTb2E2TFFORitWV3ZDSDJSWUJyeTBDY2FyY1RlNmdJamdqdVdnTVZwN0Rr?=
 =?utf-8?B?WEk2NXZLU2I2S2hSYnlZd0JOYzRKV3I4Qi8zNzluQTg4SjBHaDU2MTcvY3VD?=
 =?utf-8?B?clYvaUU0TVpMVkRvNU1uSi9Dd1RnYkhNL216WG5LcjA1czUwbzZrMnNJN1JU?=
 =?utf-8?B?dEE3QXVXWVJJVGo0aU8xRy9HUzlaV0w5S2xIRjVQVVR4MHl2YzhtUHk1RXpi?=
 =?utf-8?B?WmFCSzF3NzRWQk1HbUQ0ajh3YWxveTlqaFd3OThtVFVlWWdieVhHOXJqM2Jw?=
 =?utf-8?B?c3hBYVc5SElDQm9DeEMzWitpYXFFY0VmdlFCTXNyekJSbFBybG4zcGY5eGVi?=
 =?utf-8?B?SDF5SVZ0Sno3Wks0RVZmVjJDZWNGcnBPKy8wYUpyWi9JaUxSYmc5RjN4SVJG?=
 =?utf-8?B?OGp0MVBBRlpzaVp5NUNtUThEbWFLcXVLMEpNRFZyUWtaTW92S0RpMlE2V3gz?=
 =?utf-8?B?NVZhemN3M2YwS25MSjFWQTVaR1I2elUrUnJmZ3h6RXFHRXdVdVJHQXlzZWVS?=
 =?utf-8?B?NXhJNEJJczVUNllXVVFieTFZc2xnS2g1TWNXNmEzRXg2a0RVbUxncjVweHpq?=
 =?utf-8?B?N2VQSnBvNnNPZm5wVGhnNGpaZXFJUUYrUlN0YWE0eUJtYU1EMTZnTHZOOGJW?=
 =?utf-8?B?ZUxqZWI5d0FzVzlkemNKaktBU3hmVXpBTENMK2Q0bjhiZGtGYTJ5TmRUNHR5?=
 =?utf-8?B?ZW5mcVQxbXR2RWdTK09XMG5WZWxrMG5yWlpBNUdMVkxXSk56MkRBNDExUDVQ?=
 =?utf-8?B?OXVlaDdZNityVGRicGxuTW1jS0ZxQkg2cXo5Y0w5MkFjckM2dVlXVndsNFVm?=
 =?utf-8?B?MDZtUm8yVm5pQXMzSjVSQ1RaWHA2eENLeWxVQWVaaTA2d0ZVRkpIMk1xbGcv?=
 =?utf-8?B?T28wcVk2VkxxWjhFOHdmemh5SmlFS0JHcVhjR253M1dMZ2d1L0JDcGJONTBn?=
 =?utf-8?B?SjVuVWcwTDkzT05IWUdEMzk1MUVKZVJoMmtYMytKbG9KT1o2dXRoejUvSzA3?=
 =?utf-8?B?YzVseUxFeGMxRmZKZjhnellsUGx0ZUVWdGpScm5JSGF1UkZVT3dKSlBBWlFT?=
 =?utf-8?B?MGhsb20xdGRrQXVxQkRsbEdMQTcyVkdiRUQrMEZUcUdtbmFIVThuRFJOb2h4?=
 =?utf-8?B?YmlXVDlrOXNpOUNPODcwalpqV2J0NG5ENVZFUXhLODhQSkZYVnJodHZOZm9r?=
 =?utf-8?B?bmt6VmlKWEZtbjRWS1lQTzRpU0sxTXQzNUxGNlFsbUE0T0VRdE5QYXZRQ25s?=
 =?utf-8?B?S3YxejVxU1RjN1N5N0ZraEc1U2Q3b0EySU1PRmRVSmJ6OFNETlBzUVJ4T251?=
 =?utf-8?B?Z2J4K1UrZmV1OXhmRGNEYnN0Y0toWEJrdEpGb05ESUYvV0FWTHcxT0xtSFU4?=
 =?utf-8?B?Ty8wL25rRmk2d3A5biszUHVrdnJHaCtxb3dEdUU4a2N2KzFiQ3Z4VnlzRmFp?=
 =?utf-8?B?Rk5xbVlQVE5hNjNVZ250WXRVd0lQNWQzNFAwNE53Nm1Yc3ZXUFFVdTBPcGtn?=
 =?utf-8?B?UUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CF631679E23F854F93BDEBBF8679672E@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6db7a680-46bd-421d-6372-08ddc13e8761
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2025 12:20:45.9793
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UcDvYmRgYOR3r+GFSOn2aK38fjV++3uQz6l2ymiDcm0BTZnC/YeZ88He4WKiZGSxphRZieLQhH9OQb44PRmiXzU4FFJxv9ThKWPZWC2CO9M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB5950
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Jul 2025 12:20:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220175

SGkgUGFzY2FsCgpBZnRlciBvdXIgcHJpdmF0ZSBkaXNjdXNzaW9uLCBJIHJlYWxpemVkIG15IHF1
ZXN0aW9uIGFjdHVhbGx5IHBlcnRhaW5lZAp0byB2MiwgYnV0IEkgbWlzdGFrZW5seSBhZGRyZXNz
ZWQgaXQgaW4gdGhlIGNvbnRleHQgb2YgdjMuIEZvciBjbGFyaXR5LAp2MyBsb29rcyBnb29kLgoK
VGhhbmsgeW91LApBZHJpYW4KCj4gCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0KPiBMaW5rczog
WW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4KPiBWaWV3L1JlcGx5
IE9ubGluZSAoIzIyMDExNSk6Cj4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3Bl
bmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8yMjAxMTUKPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8v
bGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC8xMTQwNDg0NTUvMzYxNjg1OAo+IEdyb3VwIE93bmVy
OiBvcGVuZW1iZWRkZWQtY29yZStvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnCj4gVW5zdWJz
Y3JpYmU6Cj4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNv
cmUvdW5zdWLCoFsKPiBhZHJpYW4uZnJlaWhvZmVyQHNpZW1lbnMuY29tXQo+IC09LT0tPS09LT0t
PS09LT0tPS09LT0tCj4gCgo=

