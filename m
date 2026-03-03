Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69DC2EC0486
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 09:57:57 +0000 (UTC)
Received: from TYVP286CU001.outbound.protection.outlook.com (TYVP286CU001.outbound.protection.outlook.com [52.101.125.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14759.1772531869155913667
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 01:57:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=htrbNad5;
 spf=pass (domain: fujitsu.com, ip: 52.101.125.23, mailfrom: liuyd.fnst@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=grgo0GasNt3jfBjtt2yQf4Mhht6WLxC5ai+YoNz4vYwmKfPGqrXjvBEHH216Ow0vTeMKnZzSZ9znYiMijBLl8+7VRso2d/onUcZKcGew56o/vR4zEWnuPFsmVrYA3FOvC6htd4J3HrRtCa410YTHdgdl44hShH9V1oB1l6DJ+aEOIu+VuIkspUlr0e477gT9IznFNwp3WVADZwor0Smyu4BbEZe3dlC2U773vTU/oF1HGZ6uM7lhC9Ygn0xk4gwLEVowSvqFUQTZtOO/Ukb3Tyzbdm0p2Ikha9fKu1K7UKuXWilvSIX6BGkoDsnPbsc1OV4t/2vbxza9Q6a/tWbUyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fr7XqnkjSBXp/cPh3KYUanVsDzTsOhP6t1kGDJBf3JQ=;
 b=ZkT3dgvmbkyhjzocBL4n9gNJHkfmer8k/h8EoHPkg1GgBcLuUqcNkDFzRB5BCeI9arJwlyWfMVual6FVff0A+OSShDmrp6rydxUAOOLcbcFS7dwD4CUtysicq51HcvoI/ceT4duNiG7hs9lc7iSDQsCmPQa8jLWi0fnbC/p9U3CdCB8ecQiKXE2/U+OSC2h73OTBfZhjRSLBnt4RLjAatAWXNyghQpDatSCqnpuVXdcqPoZA5LKTkVLa4ybupTRivfhA1N1n7a5+ecK7KBgRhr6JZZniDKMK1NQHHhkkEodcUmI24eF2loT2xl0B717Fl+SaXNxhqQPBtX8OSW+MOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fr7XqnkjSBXp/cPh3KYUanVsDzTsOhP6t1kGDJBf3JQ=;
 b=htrbNad5zQ+J3Ucg21YRGGV/PD3DVqNFMDIHd3ry325lW7z0EcwCBAATd73f81UkkxLFuwrzFbCYK1I3hFYNd/dehu7WhaySyBThoTcnroZKPXQCpYfYxHmufirduF7/iirXqCbonxRPHIAEBh8LhQ2XLtxF5Nnvwk/Ol9KrZhR6PQ5st4VFb9RDVut2+nC89W0DHXFQEUwUopr3ktbUC7YLhq4Lb5zQiV5vP1Fz9LE2/dyRkTf6Ytue2y83E+aWIBRwqslZR50MuiqkilOaMv/qudVSQUrJ16B8ttwYnmpWYiSj15MDTdWyASbS1WoAjBCZoxkkc56BOlHuqrwcGg==
Received: from TY3PR01MB10110.jpnprd01.prod.outlook.com (2603:1096:400:1d9::5)
 by OS3PR01MB8285.jpnprd01.prod.outlook.com (2603:1096:604:1a0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 09:57:44 +0000
Received: from TY3PR01MB10110.jpnprd01.prod.outlook.com
 ([fe80::65d2:5fd:bb96:1df2]) by TY3PR01MB10110.jpnprd01.prod.outlook.com
 ([fe80::65d2:5fd:bb96:1df2%5]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 09:57:44 +0000
From: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Subject: [OE-core][PATCH] libadwaita: upgrade 1.8.2 -> 1.8.4
Thread-Topic: Subject: [OE-core][PATCH] libadwaita: upgrade 1.8.2 -> 1.8.4
Thread-Index: AQHcqvPSU8vmbeAikkuDuTzSf5xQFA==
Date: Tue, 3 Mar 2026 09:57:44 +0000
Message-ID: 
 <TY3PR01MB10110296AA3721D174995FA199B7FA@TY3PR01MB10110.jpnprd01.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-03-03T09:57:43.660Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB10110:EE_|OS3PR01MB8285:EE_
x-ms-office365-filtering-correlation-id: 18309e1d-a254-4349-fb20-08de790b50d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|8096899003|38070700021|1580799027;
x-microsoft-antispam-message-info: 
 oX7Gvp3lP8FwsLr8Z/m41Df81bqY1BMCPVjI+qscSEDVpjEYaRKUSXb2NCIMgDVuQufaEMVclwvquxUzgl8EWigqcYl1Q/C4EMSeCJefLfyckOjDWg2cgRZp34kZl4RUyPsliLATZH3H1ghsXRfgBMNI3C7KBwJhxPElfMa9uLt6SIvTy07zJJ70aW0wLOU2Rq4UKIwNzcdxxfWDE+WwppRnjmi4ypqnNH/n0In/8oI8uLj81DXDPzLg6XoUZ1S971g9fAxir1/mmYMLhhmuMfYYakkTuklTS6uOWI+M9u6n2CdVKQK2loB6zJKPlP0fA3Vge4bOeoT0iMsWR20E9TDbCB34zV6pt1deRwf08QojgCtI5svijbiwRR5v/qnp0eIkxhBjJ16K1SIa5n53Es6IqyXRoNyW2aU7K0AGrZMCDtM3SUbqJ+DGrzXpPKOKe5grSiQDT1sIfVzy5y8SEYioW39aV0YK1FjZRpw4R+cjvYiJuc/sVUoTJSTU7pzahG6pFIY9zmHrdejrKTJwMHEl3+gkeYLq1wib3IUwUEdwb3+ODnIOQ4IRSyTM2wkBbyc5QFhq4LrscoQOum+/wsy2qPKqRO7QrGbpcLQz1GdIhbIjlxy4BYJVG5XmAa+kn1DBuxj13FtEv/iOGkKygysLEVTqzljCLOatq61ubLOJ/TlkOLv+RY6rYOArO5QwZ+jONnnr+K6iYD+4Lb6eVoWUs91VB21AjqVF10iOB7VdcYgiCOqa0IAZQU3sB0OfPxd64+XQijYnj0YLWN1S4cukiBIeNfvPiluAXsj1Acr0SYxeQeZn6HbW8an3HPJY
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10110.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(8096899003)(38070700021)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?VkgyWnp4Y293emlrZXpLWCs5cEIrUG1KVTBCNUkrT3Bha2JnSDdidmw1eXkv?=
 =?gb2312?B?cThkK0NkblNRZSt6SXl3bjdXQmQrcXRHQ1F5NWtNU0MzYmtTbHFVNWoxcDE0?=
 =?gb2312?B?STlDYzBSaHZEMkRWaTAzajJ0V3NORXlPd205eWVvUHp5VDVTMy8rcVFLeWpJ?=
 =?gb2312?B?VmJOZENES2prKytnQ0ZqQW5ia1JUNGZHb1p6YW1ZczdwZmRDcGxsdi9aUXRv?=
 =?gb2312?B?YWVEV2kyTzc4OCtMQkhybVo3K3pibndTWWlZOFRtOWc2QUpkbDUzSzF5dlRt?=
 =?gb2312?B?YzY5bTF6TktPaXNLTEM2cjd0dWkvQ0FWU2hMTzIvWXgxelo1NmU3bGtNaWw1?=
 =?gb2312?B?Y0laL056cmlzNStMUVVyY0hsQmlPZk1xV1JWdkhsZzNmSEUwWHZZMGJyazNK?=
 =?gb2312?B?ZE0ycit1cVdSYVFZenBEci9hZWQxczJzbXZWNlJwejYrYTBDSWRXdUJyUnJT?=
 =?gb2312?B?ald5ZTBGZm1ub3Z2NWJXRGlLVDZQVHpCZUF6SjV3Nko0ZUJYSVdEalBsZ1lK?=
 =?gb2312?B?ekJWVExnZ2FFWURPaDFXSDAzL3JYMEdwTG52RENsWWFPY2RyZjA1NzZBSXkx?=
 =?gb2312?B?RXFkRnNMbDlyRTlGZlE1b0k3aHZwNUk0bUdwN2ZJYWlwSENsVGNSSTIreFpy?=
 =?gb2312?B?d09QaFBVeXlyNDMyL1ZaK2hpTDRhQ2syZ2hIN2poS3gxYzA0MU9CeE1jb1Ja?=
 =?gb2312?B?ZFFsV0lMYWIyemUzRmczUndnaWVQeFE2eW5oRGdpWEY3SzNTN2M3S05taC9n?=
 =?gb2312?B?aXJYYXJTanpMZFJ3YVFBYW1tVFh6K1dqN2hMVHRqMmpIblh5ZGUvcWlVRUNC?=
 =?gb2312?B?WjZSNmxwdVZSbVE1eU12MDgzSytRU2J6VGhGVmJ1YUdxdXRxZFlOMzMwRzBP?=
 =?gb2312?B?TkRSUFhrY0JCZTFwUTlRTmJLa3o0OU1jOVY2RUFQQm1kejJNYnhDYndCYkZy?=
 =?gb2312?B?TzRXTVBBYjVTL3N1ZUp1TW54eUxOc0hHYXJBSEg4SEtCejRJNzlnQS81UW5m?=
 =?gb2312?B?UjY1T0NqNk04dG95RFl3NjhIek1SdE1sTUVjRUd3NnYzSzJKS3d6cjVNbFR4?=
 =?gb2312?B?SzBUTDFuUHpKZDgySnRBVmhNOEJjcGFlMFRPWWxiOHhYNnFkL3dadTh2MDVs?=
 =?gb2312?B?YU8rdWl6enRqZkxtSkRlb1ZaYXV4RTdZeUxoM0lpdnR2M0NaVjZYUktGWTJy?=
 =?gb2312?B?d3pjWEhXRFk0L0MwNmtPY3dnamliSlh3Qkp0MkJmR3VmVDk2QmVkMHoyTzBh?=
 =?gb2312?B?S2EwYnFJRFpmV1NxQlhyLzdtZ1BXamswTytDRmNHY1NWV2Jua21ydWNJM2dk?=
 =?gb2312?B?amwxQ2NMVTdnUWZYeEJ3OTV4Tm4vN0k4L0kxSDJsRUp2MWZmbzFTZzB4Rmtp?=
 =?gb2312?B?QjRUNmtCZlpUQzUwdUZxQXY2dCtRcW1VV29LTDR1QVhHUVc5cStQSS9xNWc2?=
 =?gb2312?B?MGdnNkNubzMvNStnNElzbUdnT1ZmT3MzMGxObDdwTDhnM0MyajAzSWR3anhI?=
 =?gb2312?B?M21xRWM1R05kcmZJS2RDMXFHT1RZZ2JZY3N0K2FFSDgzQitwb3VUZEtBL21z?=
 =?gb2312?B?Q0sycWt3MW9SaEg0MXljQkhvQWJRdzF3YXZUMytxU3A3OXpTYWdmTFV0aVlT?=
 =?gb2312?B?RSthdHZYdHVXSW1paktkRnJQbWxXbzVBNW1sNnExSFZpb3VENVVaZjZuWTFQ?=
 =?gb2312?B?OSt3U255ekZnejVqL1k5dFVjTm4vRmVyMkEvSjF5V1FTeTRHVlNwNTRwVGZD?=
 =?gb2312?B?Z3pybi9vM1JqQ0NOdkJuQ1lZdGFGZEJkSVE1RzlEczRBTGtpVzlwclY3TkxJ?=
 =?gb2312?B?RjhZbTVpVkhXTnNnenVwcGxHcTBXMFowQy9ldnZPN01EcGJQSkpISDJ1VUJC?=
 =?gb2312?B?b2Z5andhdThYazZJS0pSQVRZemFTTjIrQVdFR1dHZ3FRNTcyc0JpOUk4Zmli?=
 =?gb2312?B?TlhSNTIvZFpTOG16RzZYd0VrOUFUNWhZcXhRbzVjc3VKRmxWaDBwcElkTURF?=
 =?gb2312?B?QVY0WDFhUFFoQS8vQlVyTDlvSzAwUUFOLzBQczRWVmd0UmhTUlVPR3NYTE5Y?=
 =?gb2312?B?VVNKZ0FTWFRKUHBDQmZLWnlkR3pWd28zMUFGVXRFcTNHMmN5SXNJRWEzTnlk?=
 =?gb2312?B?YTJ5em9TL01tN2VCd1lFWFI1aUZmU2VXbmkwa1pUejB0MGszL3gzVVVkcWVX?=
 =?gb2312?B?WFhyS0lzZ3kvRTk0VU4yRWFGNW5qVUduaERnRGdDdVN1S211WU1IK0NVbm1Y?=
 =?gb2312?B?VisrVEx1Q2xRTDBobnZEUDhaNEcxWUh3TnF5UE5ESitoVCtodEw5MkU5UHY4?=
 =?gb2312?B?MkpXNFFtU0dhMVNEVFRaQjI3ME1ERnhnNS8rTTRHanBVRWZkMCs3dz09?=
Content-Type: multipart/alternative;
	boundary="_000_TY3PR01MB10110296AA3721D174995FA199B7FATY3PR01MB10110jp_"
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10110.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18309e1d-a254-4349-fb20-08de790b50d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2026 09:57:44.0906
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EytQvNbZx68l56SZzjDMKx5uRrfWe4xd6RXTus5RMY3paFy7mdtDVEMCMnHaVkEQ7ipay7Okqo+gmAxmv0jPWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8285
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 09:57:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232272

--_000_TY3PR01MB10110296AA3721D174995FA199B7FATY3PR01MB10110jp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

RnJvbTogTGl1IFlpZGluZyA8bGl1eWQuZm5zdEBmdWppdHN1LmNvbT4NCg0KPT09PT09PT09PT09
PQ0KVmVyc2lvbiAxLjguNA0KPT09PT09PT09PT09PQ0KICAtIEFkd0RpYWxvZw0KICAgIC0gRml4
IGluaXRpYWwgZm9jdXMgaW4gYm90dG9tIHNoZWV0IG1vZGUNCiAgLSBBZHdXcmFwQm94DQogICAg
LSBGaXggQURXX0pVU1RJRllfU1BSRUFEDQogIC0gVHJhbnNsYXRpb24gdXBkYXRlcw0KICAgIC0g
SW5kb25lc2lhbg0KICAgIC0gS2F6YWtoDQogICAgLSBSb21hbmlhbg0KDQpTaWduZWQtb2ZmLWJ5
OiBMaXUgWWlkaW5nIDxsaXV5ZC5mbnN0QGZ1aml0c3UuY29tPg0KLS0tDQogLi4uL2xpYmFkd2Fp
dGEve2xpYmFkd2FpdGFfMS44LjIuYmIgPT4gbGliYWR3YWl0YV8xLjguNC5iYn0gICAgIHwgMiAr
LQ0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZ25vbWUvbGliYWR3YWl0YS97bGliYWR3YWl0YV8xLjguMi5iYiA9PiBs
aWJhZHdhaXRhXzEuOC40LmJifSAoODklKQ0KDQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdu
b21lL2xpYmFkd2FpdGEvbGliYWR3YWl0YV8xLjguMi5iYiBiL21ldGEvcmVjaXBlcy1nbm9tZS9s
aWJhZHdhaXRhL2xpYmFkd2FpdGFfMS44LjQuYmINCnNpbWlsYXJpdHkgaW5kZXggODklDQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZ25vbWUvbGliYWR3YWl0YS9saWJhZHdhaXRhXzEuOC4yLmJi
DQpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdub21lL2xpYmFkd2FpdGEvbGliYWR3YWl0YV8xLjgu
NC5iYg0KaW5kZXggYjJlNzBhNGNjZC4uMzk0MjMyNDRkOSAxMDA2NDQNCi0tLSBhL21ldGEvcmVj
aXBlcy1nbm9tZS9saWJhZHdhaXRhL2xpYmFkd2FpdGFfMS44LjIuYmINCisrKyBiL21ldGEvcmVj
aXBlcy1nbm9tZS9saWJhZHdhaXRhL2xpYmFkd2FpdGFfMS44LjQuYmINCkBAIC0xMiw3ICsxMiw3
IEBAIERFUEVORFMgPSAiIFwNCg0KIGluaGVyaXQgZ25vbWViYXNlIGdvYmplY3QtaW50cm9zcGVj
dGlvbiBnaS1kb2NnZW4gdmFsYSBmZWF0dXJlc19jaGVjaw0KDQotU1JDX1VSSVthcmNoaXZlLnNo
YTI1NnN1bV0gPSAiNTg5YTZlMGY0MTkxNzQwZTg2OTBhN2QzMjk4ZTE2ZmEwZDQwNjEzNDFiNTUx
ZGE3YWJiMmYwMzBiNTUwYWRiMSINCitTUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICJkMDJi
Yjc3YjZmMGZmMTA1NTAwMmQyOTk4OThjNDg3Y2IyZDgzZGJmOTQwZDllZGY1OWY2ZmRmMjU3MmE5
MjFjIg0KDQogQU5ZX09GX0RJU1RST19GRUFUVVJFUyA9ICIke0dUSzNESVNUUk9GRUFUVVJFU30i
DQogUkVRVUlSRURfRElTVFJPX0ZFQVRVUkVTID0gIm9wZW5nbCINCg==

--_000_TY3PR01MB10110296AA3721D174995FA199B7FATY3PR01MB10110jp_
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
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Version 1.8.4</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; - AdwDialog</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; - Fix initial focus in bottom sheet mode</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; - AdwWrapBox</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; - Fix ADW_JUSTIFY_SPREAD</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; - Translation updates</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; - Indonesian</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; - Kazakh</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp; - Romanian</div>
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
&nbsp;.../libadwaita/{libadwaita_1.8.2.bb =3D&gt; libadwaita_1.8.4.bb} &nbs=
p; &nbsp; | 2 +-</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp;1 file changed, 1 insertion(+), 1 deletion(-)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp;rename meta/recipes-gnome/libadwaita/{libadwaita_1.8.2.bb =3D&gt; lib=
adwaita_1.8.4.bb} (89%)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
diff --git a/meta/recipes-gnome/libadwaita/libadwaita_1.8.2.bb b/meta/recip=
es-gnome/libadwaita/libadwaita_1.8.4.bb</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
similarity index 89%</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
rename from meta/recipes-gnome/libadwaita/libadwaita_1.8.2.bb</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
rename to meta/recipes-gnome/libadwaita/libadwaita_1.8.4.bb</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
index b2e70a4ccd..39423244d9 100644</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
--- a/meta/recipes-gnome/libadwaita/libadwaita_1.8.2.bb</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
+++ b/meta/recipes-gnome/libadwaita/libadwaita_1.8.4.bb</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
@@ -12,7 +12,7 @@ DEPENDS =3D &quot; \</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp;inherit gnomebase gobject-introspection gi-docgen vala features_check=
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
-SRC_URI[archive.sha256sum] =3D &quot;589a6e0f4191740e8690a7d3298e16fa0d406=
1341b551da7abb2f030b550adb1&quot;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
+SRC_URI[archive.sha256sum] =3D &quot;d02bb77b6f0ff1055002d299898c487cb2d83=
dbf940d9edf59f6fdf2572a921c&quot;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp;ANY_OF_DISTRO_FEATURES =3D &quot;${GTK3DISTROFEATURES}&quot;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp;REQUIRED_DISTRO_FEATURES =3D &quot;opengl&quot;</div>
</body>
</html>

--_000_TY3PR01MB10110296AA3721D174995FA199B7FATY3PR01MB10110jp_--

