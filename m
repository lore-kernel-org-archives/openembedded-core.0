Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A374EC0486
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 10:00:57 +0000 (UTC)
Received: from TYVP286CU001.outbound.protection.outlook.com (TYVP286CU001.outbound.protection.outlook.com [52.101.125.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14810.1772532056319154958
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 02:00:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=JjOxqEET;
 spf=pass (domain: fujitsu.com, ip: 52.101.125.50, mailfrom: liuyd.fnst@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s/69ZAW+8AL0OW1prA2x99xGYITcpikrPBkruOdWjm+KOTp2DiL6kX9OSJ1vhaX84NxIDDdtPZk2bNtCn3IucKTYci0Xy0BG4LRpR9W8X3Sy6ztUk5+7vs3zICOu72qynHpk6E5UQAyreyROl2ZoR9QST6zKGEJ9NeVdRn26xNlpsCY8pGrVXy9ANLdWu3zbB1Krg0TNaHQoKP7tL9P4OGO8ajP08KPNqgiSsRedGm3eUOEO0RsD56bukAo7FAdC5kAqWjcK8L9iXCWVqCJcHqK0XLJOr3bDsnB7TSo5uE7GtnlYM67D7EmhORyMUZj4yKuwu0m0PfdCTBVbj51mGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SP/07/401jmhwvZ7dJ0Z89PScdiBRYyanMGE0ln65u4=;
 b=xvVjesntlH3aPLcJS5WXxuwd9JY89Bniwsl1jz0V2HxsdfXR4s1h0P37bkYixz8n82IwhL0ayBzovxvG9nydZHUmMBwCwdA6SDsCGUS01DsmlWsa5yLByDvYQiE9ZPNuZQa3XV3Tgprs3Z3QpHBdM5lAUk7EtwVFvm+l1/yEe4pRL9LjNzTonntwhNAq88qQJsl3p4C9DAhuuvWAtTrbj18xIsf9AAgWx1DBYaPaYyucPOKj3QM+Qz2v00ggaQDhd/xjuSVVQsu1Sd+B/v5tNpnnOn6ftaca1qW91dCh/b2mMObpoYH0fMnQIfOUjugwiewFNVFbP5MNannW7C0GBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SP/07/401jmhwvZ7dJ0Z89PScdiBRYyanMGE0ln65u4=;
 b=JjOxqEETzwDw8vQe/g0v1lCuNBSuFfivnxf5fr8k9DUpTqiS/hDHTYBnWGLqiEfTnhBQAMcnqzHMDIeVoJePQc18+Eg5+vfeenLYS1yKwf/9ypHUHSi25KyWcBRuGF/n6fOm9pKbVbp4jh4o2wcjqZnFgTf20g6pOal/xeMGXnMuamX1bsUcJ8gIWiJmE/+qk0h/gVeRmgD5Ojuz6+FXaYkX0UEgDJEglJyeAL8kiIQMVkXMSvYaVIKkYs41Nn7776mClFX91agAaiNDSinK8f5j3/5xCivT6gKb0oJLJCY1JCuvx4DOBzMXm1IlYdVa4DLzH/AGVK4iEYqvn/VFSQ==
Received: from TY3PR01MB10110.jpnprd01.prod.outlook.com (2603:1096:400:1d9::5)
 by OS3PR01MB8285.jpnprd01.prod.outlook.com (2603:1096:604:1a0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 10:00:51 +0000
Received: from TY3PR01MB10110.jpnprd01.prod.outlook.com
 ([fe80::65d2:5fd:bb96:1df2]) by TY3PR01MB10110.jpnprd01.prod.outlook.com
 ([fe80::65d2:5fd:bb96:1df2%5]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 10:00:51 +0000
From: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] gtk4: upgrade 4.20.2 -> 4.20.3
Thread-Topic: [OE-core][PATCH] gtk4: upgrade 4.20.2 -> 4.20.3
Thread-Index: AQHcqvRfF44rCsFI+UiONCQZzbMInQ==
Date: Tue, 3 Mar 2026 10:00:51 +0000
Message-ID: 
 <TY3PR01MB10110963433FADBDD4A12AC4C9B7FA@TY3PR01MB10110.jpnprd01.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-03-03T10:00:51.217Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB10110:EE_|OS3PR01MB8285:EE_
x-ms-office365-filtering-correlation-id: dc3bc220-494d-4b08-f427-08de790bc093
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|8096899003|38070700021|1580799027;
x-microsoft-antispam-message-info: 
 MSPmq911hezQc4+hDrTHXfy9VqkJoyvq+aKXbWse4aum0fyKzTHdqia23FWfhOOR9GPkCpzmLJ/6U2HsEBXpLFpZ3biuKr03Q4Mz0up1iNfAbIXECWTkAk8HHRYt6sH5tSZJcsJiR/pgd/b4IjGS8kWgcNJS1t5jqOwpmXsUXSyMtY58FNwcCdk8FTaIrFKm4WFkjcjl8vmbWfUrWtFtzAYp1J6+3EHPFkhFoj5R0HDMkphSABnyMqcNpkTnF0PZCNnHQfSs/1JNxVMDpv2w1yOpevdc1dEdW9zr94BslDPRBelqSgLFKchSLsovDXWw/Uq6EYxqnPIYgcAVciBQIMA30ZKjw6/IT3X8CHh9csAPvbW7Cq5PJgWDGZST9Ft+vcxwzDwnKy1BcOz5kanvYeclWyNcIbYE6fe1GEyf1t1eBtZjuN1WBjRW6T3t6J+m2Di6e+n7osG/mNq1Af9lnBH1X3QXzvl9zVhprg0hU5lFe8YV6ixSRy97ZG9g70KP1+25gHBk9IXYcu01WIxPl5K6s074dPAvaPyyI7UP4rnGC2OhLEl6hfAzwwZbtrXJcY8CH6cZx+DBwLis3amWjh+vdWtxz8kPSm8BtnX4nN3eXmcMGlRqNqYqL0c07UZ9ao7lqQ38Fvt79HDGS7cexqh9bUvHP+DXwP2i9mCvMgeB83qRuKHkUTG1bIc7DLU94hAYqBVZMF8eyyirT7YYFpyluUN3qYMEcBHR0NnyA1Q3j0UFjyN8k1W8xFBv5Euxi5HEgXWJ4Dxljp2ZAErvsOOKUKI9EcUww7RPyt9SB63z8bJKcSNM4o2Pa/lODvW4+95fomOPCZ5Y/dfCYO8qTA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10110.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(8096899003)(38070700021)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?VlNjOWpoZmxGOTZNSzJZNGZXS3NzNmd1NUZ3R0t2blNPZ21lTCtoWTM3RDd4?=
 =?gb2312?B?d1hYM0NRRGhic1ZDaUFVUjNYSWlENnhQZTlJOGFmZThsTTZyYngrSU9aOUFh?=
 =?gb2312?B?d3hRTjBxY0ppdmVLd1R5K2sxd3NEZ2dtNXNHcUZwRWFnNS9tbDBmU3JFVDFQ?=
 =?gb2312?B?dktaLzZnb01LanF2S21rak9oYzNHYWFna2ZQVnI3SzdvZlNsZDJscE1pV1Yy?=
 =?gb2312?B?ZVJWZFpmNWcvYU5QYmZVWHBXMzNlYlVoWFNPcmI4dmNyNTN0UExvNGg2a212?=
 =?gb2312?B?c3ZVUkxKdDBabXpvWWo1VTR1MU9RZGxMNnpRbUdxQllMZjl1c0t6cm5pamVo?=
 =?gb2312?B?dzMxSGhBNXpiaUN2ZWUyb25QOXc1T1Zwb3lMZ1l0dGVwVGRneUpRZVpKY2Zh?=
 =?gb2312?B?Z1Vaby91Mitab1VHWVZuUDNlWUpUYWpUaFR4V1NaUUxQMC9pVDlMMjV3MUhk?=
 =?gb2312?B?ek13QThZQ2N3eW00WnRXSTBrMWk0WUNiQmZRb25wR2dITjZ2SGZuamdnb0Ny?=
 =?gb2312?B?WE1WY1phaXg0OTY0OEJXSjdOR2dTeGFsZi80cDBMRzc5ZXVTSEhtOTVmSlA4?=
 =?gb2312?B?cTdQNzhZN0xSTEd0RXhCTzFMSWd5amtnemgrQUhVT3JCeEtNNi9FRW5WVGdu?=
 =?gb2312?B?RnFHSjQ1UmZPc09Jd21DaTVxbUNJV3g4a094R0VCM05HZlhkeGpmaExnaTl3?=
 =?gb2312?B?cCsxbGR4OThsVGlyQUY1Q2hsRFRnd0VNd3JjUHV5WjRkeHpCNG4wd1hDLzA0?=
 =?gb2312?B?djExQW4wVHpDSDFNT2xaVmg1N1BIOUpBNGtRVXhqNUhMVHhIbW01QzVINnQz?=
 =?gb2312?B?UkVPUnhYTkNDSUl6bkVVVEphK1BmU0ZEWHZ5MUpUODNabWZBb2c1WExBZ3Ry?=
 =?gb2312?B?TW43RmdDVVhEMDYxRlFBbDArQ0VlSXJaZFgvRkplVENlSUlNNmVvcnZkTDVZ?=
 =?gb2312?B?dmF5dU9UcDFVbjBnNXJ2V2JpVklDWFBXRkQ3NVFFZWFSTWZXYndmNVYrT3JS?=
 =?gb2312?B?NGUrc2d4MU9yM0dZa0hvWVdVd1dRSFIwQkxLMU1tRU9iMmRGaDdSTldhb01F?=
 =?gb2312?B?MkJVcEhOMlFwQXRzVWZIU0lGcmp0c1d6T2hDWFdOczRXN1lZY1RCcGh3S3lq?=
 =?gb2312?B?SGdEVTNudHVmS0tlWFFHV0d1VTkzRkU4ellwdzZQMEJFVmU0TlJUY1ZJV08v?=
 =?gb2312?B?Y01hNTJlQzI2TnBEb1IwWXJ2dUlCQlljY1BkQkNjQ0lML2JCcHZaV0d5OUVG?=
 =?gb2312?B?K0NGVVRDa043ZXpHaEp5SmhaMXNvbjZtVkJrcnhNYUlmamYyZ21jWi9SMWRw?=
 =?gb2312?B?c1NVcDV2Zng5WUtoUDdaRVNrdE1lWFZIV0I5TlpPdjkzZk91TGdibktqUDQ4?=
 =?gb2312?B?djNscHJSTkJxMElxUDdnT3kyMGJ6VUFseC9jVmZQT2ZsWkVlalA1UGg4NVIx?=
 =?gb2312?B?cURYUm9YQ2JtcFk4L3p2NXF4aDRVd2RjZGRvZWlqUnRaUGwyTzVzS01RUmZG?=
 =?gb2312?B?L0lvWTFtaVVqOHpOTVNWVzQ0a2oxeFV2d3p6Uk91VEJqWVQzaXBnbk14ZWhS?=
 =?gb2312?B?bG00TDFHSXVYaWNQRWI0YXVXU2p3c0lJNzZmdExObksvMXZacjdPVG9DZ20z?=
 =?gb2312?B?QjdvalpybFhIT29oaVlGQWJ5SWh4dGp5M3pwOGE0RXJLSVVNNzZ0a2Y4amNH?=
 =?gb2312?B?NjVFdm1qb2FYTlV6UktzaUkxMThuNmpMbkVROVZsWVJxdENaZXB6THZ5ZEVW?=
 =?gb2312?B?WkJ6MFQxTmZqWk5tdWpUZ3UzcExKQ2J5NkRRcWRmYzZwbTVibnVLWVBtOEtZ?=
 =?gb2312?B?enBCZkhpdzd1L1dNeXRJdEt1TTZnRFNDVis4dE1QUFJ5aG80WnZJMzQ4dU15?=
 =?gb2312?B?QVRYNmtEZkE4SlVVOTRmWGZTWUx2amhqekV2a20wZzdUNzRRNzhmOFdvZHph?=
 =?gb2312?B?TUtGMWU2SVZCeU5TdWh3ZlRrU05pQkl4STcycWlkblh4WDlKelhVSk80NU4z?=
 =?gb2312?B?Z3QzKzVMSXQvdTM4VkRvZnBYSG95azR2czFWbnpGYzYxa2dEQlRuNkl1WEhW?=
 =?gb2312?B?VkZaZ2Q1REFHY0F5dkxHc0l2OGdxcWpsWmVMUzFMVmtQdWNucW41TzdFQ1dy?=
 =?gb2312?B?VFJiL1JhRVd4UlpRTzNSWWM2cU5ZZXZMdDAvczk2dXpCUFcxWHdNWmlzL1hG?=
 =?gb2312?B?b2RpTHdkVXJSemlEbGhJTUh4RDJPb2l4alN0S2g3Q0VwUDB4bWpZdkFhdG1o?=
 =?gb2312?B?MGprUTFvU3puRE40Q3BmY09XVG9OdEV3WWc4OUkvSm5QTlFoamRrbVl2ZWFP?=
 =?gb2312?B?UThOK1JqNmFwb2txQ282MnZKUW9TMGpDYmNCcUpXYUJldDYrRUd1QT09?=
Content-Type: multipart/alternative;
	boundary="_000_TY3PR01MB10110963433FADBDD4A12AC4C9B7FATY3PR01MB10110jp_"
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10110.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc3bc220-494d-4b08-f427-08de790bc093
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2026 10:00:51.5214
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VvcXRwG+iTldIyEL3KfOBbSjUbJeHg2KJ7z7JCR9pLRLCkrru/PqX030CBVycNpyWSpC5+djDLX79MUxt+TVsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8285
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 10:00:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232273

--_000_TY3PR01MB10110963433FADBDD4A12AC4C9B7FATY3PR01MB10110jp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

RnJvbTogTGl1IFlpZGluZyA8bGl1eWQuZm5zdEBmdWppdHN1LmNvbT4NCg0KQ2hhbmdlbG9nDQog
IGh0dHBzOi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS9ndGsvLS9ibG9iLzQuMjAuMy9ORVdTP3Jl
Zl90eXBlPXRhZ3MNCg0KU2lnbmVkLW9mZi1ieTogTGl1IFlpZGluZyA8bGl1eWQuZm5zdEBmdWpp
dHN1LmNvbT4NCi0tLQ0KIG1ldGEvcmVjaXBlcy1nbm9tZS9ndGsrL3tndGs0XzQuMjAuMi5iYiA9
PiBndGs0XzQuMjAuMy5iYn0gfCAyICstDQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pDQogcmVuYW1lIG1ldGEvcmVjaXBlcy1nbm9tZS9ndGsrL3tndGs0XzQu
MjAuMi5iYiA9PiBndGs0XzQuMjAuMy5iYn0gKDk3JSkNCg0KZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1nbm9tZS9ndGsrL2d0azRfNC4yMC4yLmJiIGIvbWV0YS9yZWNpcGVzLWdub21lL2d0aysv
Z3RrNF80LjIwLjMuYmINCnNpbWlsYXJpdHkgaW5kZXggOTclDQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMjAuMi5iYg0KcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1n
bm9tZS9ndGsrL2d0azRfNC4yMC4zLmJiDQppbmRleCA5Mjc5MWRiMTY5Li5lZjlhMDVmN2ZlIDEw
MDY0NA0KLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2d0aysvZ3RrNF80LjIwLjIuYmINCisrKyBi
L21ldGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0azRfNC4yMC4zLmJiDQpAQCAtMzMsNyArMzMsNyBA
QCBMSUNfRklMRVNfQ0hLU1VNID0gIiBcDQogICAgIGZpbGU6Ly90ZXN0cy90ZXN0Z3RrLmM7ZW5k
bGluZT0yNTttZDU9NDlkMDY3NzA2ODFiODMyMjQ2NmI1MmVkMTlkMjlmYjIgXA0KICINCg0KLVNS
Q19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjVlODI0MGVkZWNhZmFmZjJiOGJhZjQ2NjNiZGNl
YWE2NjhlZjEwYTIwN2JlZTRkN2Y5MGUwMTBlMTBiZGRjNWMiDQorU1JDX1VSSVthcmNoaXZlLnNo
YTI1NnN1bV0gPSAiMjg3M2YyOTAzMDg4YTY2YzcxMTczZWEyZWQ4NWZmYWUyNjZhNjZiOTcyYzNh
NDg0MmJiYjJmNmYxODdlYzE1MyINCg0KIFMgPSAiJHtVTlBBQ0tESVJ9LyR7R05PTUVCTn0tJHtQ
Vn0iDQoNCi0tDQoyLjQzLjANCg==

--_000_TY3PR01MB10110963433FADBDD4A12AC4C9B7FATY3PR01MB10110jp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
From:&nbsp;Liu Yiding &lt;liuyd.fnst@fujitsu.com&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Changelog</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; https://gitlab.gnome.org/GNOME/gtk/-/blob/4.20.3/NEWS?ref_type=3Dtag=
s</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Signed-off-by: Liu Yiding &lt;liuyd.fnst@fujitsu.com&gt;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
---</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp;meta/recipes-gnome/gtk+/{gtk4_4.20.2.bb =3D&gt; gtk4_4.20.3.bb} | 2 +=
-</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp;1 file changed, 1 insertion(+), 1 deletion(-)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp;rename meta/recipes-gnome/gtk+/{gtk4_4.20.2.bb =3D&gt; gtk4_4.20.3.bb=
} (97%)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
diff --git a/meta/recipes-gnome/gtk+/gtk4_4.20.2.bb b/meta/recipes-gnome/gt=
k+/gtk4_4.20.3.bb</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
similarity index 97%</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
rename from meta/recipes-gnome/gtk+/gtk4_4.20.2.bb</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
rename to meta/recipes-gnome/gtk+/gtk4_4.20.3.bb</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
index 92791db169..ef9a05f7fe 100644</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
--- a/meta/recipes-gnome/gtk+/gtk4_4.20.2.bb</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
+++ b/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
@@ -33,7 +33,7 @@ LIC_FILES_CHKSUM =3D &quot; \</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; &nbsp;file://tests/testgtk.c;endline=3D25;md5=3D49d06770681b8=
322466b52ed19d29fb2 \</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp;&quot;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
-SRC_URI[archive.sha256sum] =3D &quot;5e8240edecafaff2b8baf4663bdceaa668ef1=
0a207bee4d7f90e010e10bddc5c&quot;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
+SRC_URI[archive.sha256sum] =3D &quot;2873f2903088a66c71173ea2ed85ffae266a6=
6b972c3a4842bbb2f6f187ec153&quot;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp;S =3D &quot;${UNPACKDIR}/${GNOMEBN}-${PV}&quot;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
--</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
2.43.0</div>
</body>
</html>

--_000_TY3PR01MB10110963433FADBDD4A12AC4C9B7FATY3PR01MB10110jp_--

