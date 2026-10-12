Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5968CA9ED0
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 21:43:45 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.6])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5728.1791841416490910711
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 14:43:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=Ms6+WjHv;
 spf=pass (domain: siemens.com, ip: 52.101.70.6, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F9Aby052aRRcjALOmvpAncfbpZ2NhM2SlCSkDncr6VDxZNX/HdzlCfN7xpYuHiX7foZF48i0kZ2E5jqIcC21i8J0Mh32gQtSufOYtdcKqkRhHPv/lhtmJo6zAVa8GppNllr4f+t2HzSOSRV5n3J8YYV/i3RVI7A2Vs+/wdVCsPCpwO6ISpWmBOyYRyO5OPDyWm4oyvvIWcQnj2AHIJgZVRAz0k7/64oIPs2JJ9mLfvn/BOOstWx9c13uFC8E6ykTkIpaDgjBaascC9btlWvxqVag1lzzJGhEhYbcccvzsrJz57mhStnC5Bk1VkNNoA6BfXIN/HA/IwkVqio4+RQNYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tHkFYJDYJ196UdpR0FcbIsCNUD0SqFyr9TO7Su+JxCE=;
 b=DjviC4k64LxWcrPYcqsgU8yfbGGUgDBWRcWDXCQIi3rAr14oInIVDvPScH2TboXTO6bvJUV8U6kC4EOTXC64EfZ/lRXqhbKVvIin0GwRsbH2pJKfBo7rUwBA3x1om04S5BTSkcit/yBbcx3IYciDo6OD2iteVnnl09V2gazUNbD88ydYxAZDUucisFPsZ/oJcBaPmb/5nP2f7lMyMj7VUbCGpl3uapQUvVh0VGI6MEMrHgmZPmKs2fKYhmdfHumh8WTf7zdDHe2rnp0CXKc4NoRjCCiQX58oQ8XzvHJ48kvndVv4VuwAZCX97GwUqS3hr4PZ/zfJ3Z03b9NAC40zfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tHkFYJDYJ196UdpR0FcbIsCNUD0SqFyr9TO7Su+JxCE=;
 b=Ms6+WjHvZM0uVHhjgiN9tJPG/eYLh9/R5Az1MHU/9QGgzThlKmQwD1fH907xDZ8h918r/h+9IWMggArjr+oPGFAg5GIjDWn1DGG6qhgzWBahgveBALXnA9D40U9Kag2YFTj5J/v43dMV0cXYqxU23uxibsOy8Ss3hyR5XNk+qEVYXb51QEyHxg6of8QQH+a0aqFVAXsA/WjvvTU9hJ2Mv8tyjJ9EI43HSq7pGm6M6cOdJn9dp+ekbAD44XAhZUaYfG3V48LRHkcdP38xCJxg4LGyW0qfK21UTPxnfUR01n9+ImdONmXYUbQ1zt9KBdrWiKtd+JbYlzOYIBECTWiInA==
Received: from AM9PR10MB5082.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:435::23)
 by GV1PR10MB6009.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:5c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Mon, 12 Oct
 2026 21:43:31 +0000
Received: from AM9PR10MB5082.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c5a:f9c2:dc48:6388]) by AM9PR10MB5082.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c5a:f9c2:dc48:6388%6]) with mapi id 15.21.0496.021; Mon, 12 Oct 2026
 21:43:31 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [scarthgap][PATCH] glib-2.0: patch CVE-2026-15588
Thread-Topic: [OE-core] [scarthgap][PATCH] glib-2.0: patch CVE-2026-15588
Thread-Index: AQHdUzOCBWtQrOLTgEaNEeGNO5l/Fbb6Gu2AgABkBYA=
Date: Mon, 12 Oct 2026 21:43:31 +0000
Message-ID: 
 <AM9PR10MB5082FADA7C00F37CEC605767FD9F2@AM9PR10MB5082.EURPRD10.PROD.OUTLOOK.COM>
References: <20261003123400.235082-1-peter.marko@siemens.com>
 <DM2Z5BIMBVKM.3FWEF1MP2Q9FH@smile.fr>
In-Reply-To: <DM2Z5BIMBVKM.3FWEF1MP2Q9FH@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=b50f51f8-bd36-473a-a0b2-56dead3b573b;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-10-12T21:43:09Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR10MB5082:EE_|GV1PR10MB6009:EE_
x-ms-office365-filtering-correlation-id: f25cceb4-b4df-4c02-3853-08df28a9dbe4
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|4143699003|11063799006|38070700021|55112099003|56012099006|22082099003|18002099003|261009223027099003|10067099003;
x-microsoft-antispam-message-info: 
 TyM8JkkuSgS6IjM6R3zOhYnC+V1bb4xJJNaT3KXzm9JkajLZ5WiUW63hMMWbOLBESphxPvLQUyp7hYQLlzInN7BOgNYsKM2S6d+Z0PmAadOfwPrIYX7eNBCdP48h4Qvma2n45jEIA8u3D/2YewI3xdGe+92ErLXmH585EIQLraMLaK8Nmn87H86hMiNjuEcwAvWGB00ynAuXh5pEVoCNRiOOqCrtm1gK3T2qRvBpDkRtxRcBAxF1rbX+8W0FGwqv4MobyG/2yorqAIcr6e60OmuyiSF7j3HS3ylWAy7eT2/P7pLkUtfM7AIYJ6YWlS2dpZ0DsJ/AFejnKnEcpqmG0sOPkKQ4pdu+bkmGnxhPMPE09a5tpDeRL96M0bLhzZYrq+Zu2f0dP5iR8a1Pz5qKNEo/3a1AEX7XPTevYDMWx+ojgC3FgzoipAnha6M7GeGSqcp/8ASxWvdTKEJRvnyZb+Sf57pO8+3GNPjJ4okyXpwIh48IC5igqSnHlXcp+/YvKcSbrlSpQ/hJjCr/0lemcUuwekbSeWzp+k994bIQvJjfnUc20AyDFodbFB7zXveFzEvWt+UveK+gCGMrTt0kYiT4758JTXE3CdSoODmeqZc2yfAVYOoTcMUGT/26LTGj4MjTnSzYUUISmLhsD1+WvPpS28LLvK2lTy5JL+OHK4c=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB5082.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(4143699003)(11063799006)(38070700021)(55112099003)(56012099006)(22082099003)(18002099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aG45U3YzdGVmdzlGUXBseTJoS1AxcTEyYm5mL3BZNjJyVE9NZEw4MXliV1Bp?=
 =?utf-8?B?NTZmdUxwcDcvaFVTVWg1K1dSbVJYemVkSTcyYWhrVURleGpBZGd2N1AxMUtU?=
 =?utf-8?B?Y3pBYndFVlRQdmpvZUdNUDQ2ZEJyVVVnWUxyM1BPREpYRVRaMXVWR25tVTNj?=
 =?utf-8?B?RUF0V2xXdGc0VG9tNXlQTCt4OVZvQkt5SFVJOHJ3S2dEZWZIQUliYUxrb2py?=
 =?utf-8?B?OG9CS1h1NjZCVzdoQXhGM1o2MmVxQ3NoNXZuZzRvU2F0RUJvZE9GM1NqOFR6?=
 =?utf-8?B?TTVRVnhQY1lxSjlsOVVuRjk1aC85cGdVT0h3WHN5ZzhUbDFpMUIzeDE5Ull5?=
 =?utf-8?B?Qlg4YTVDUi85YnFVaDFwancvTHlQSWpUVWZGSjhiODdtb1NxQ09TTmRjNXFE?=
 =?utf-8?B?UHlpMEduU25PdU4vNE5obXRnSzRGNmx0Sy9QdkJxVDRsSnAzUHBaVkdLK1U1?=
 =?utf-8?B?NUlCQkgrMVlRcklDQXE2bW5nRURycitTZ042dUhuNTZGbWRqdmRwS002UjhM?=
 =?utf-8?B?SmM0U0xGdWxxNFFpck03bTZ1OG1qUHd5VUwwRjVGRUdwQjZFS1QrMFl4K28v?=
 =?utf-8?B?b3dBVTVsRHpReGhwRmFNbmRCVHZnT0d3dWEveFo1UDBEVmQvYUNoUlhzVW9z?=
 =?utf-8?B?aXBUZGNyMzFyRUZoc3h3OVFSZjI4ZHRmMlVpWXBVVWNsU3FRWkRwNkEwWnZT?=
 =?utf-8?B?T1ZYcmx6V3dkT2luMm1BNzBGSFRHQkExdGtLZnQ1UXNJbzdpZjNvSGVrdjZX?=
 =?utf-8?B?b3hTWVRsUVFFWG9zVk1NQllLUGpmYmVCWUdBeW5hVi9nZHIraHIvc1dpOStB?=
 =?utf-8?B?NlJUei80anhZUHI5VzJVMFJ4WThMdGV5VFVLYkJoUHQ2d09NNkdCSmkxQ2hm?=
 =?utf-8?B?SUFjVE8yZG1QME8rWmxtL09rK09hbkJVMng2T2M5YkNpZkNPdy9pcWtzcmVX?=
 =?utf-8?B?bm5rTjlWbmh6SmNFc2RUWm5PeFYwZ1Q3dkRvZldVT2Y4dXFCbEFNOFhTM2N4?=
 =?utf-8?B?N0dzTVd3U3hYd2FUUjdNN3h3VjBtOWV1M3JmdGdqSGNUU2w1aldLYzUrZlR5?=
 =?utf-8?B?MTVMZTVISUZFOXF4cnFnUFpUZEZ2L1BTTXdJSWMycVJIQ1ErUU1RbXhkYVhV?=
 =?utf-8?B?c1lueFNGL0NlamdzWlpzZ2lUMjNiMHJRdXFMQjE3L3gzekpQYUtTUmVmT0RQ?=
 =?utf-8?B?WkpJYTZzNmRQYUZhOWxocVJBYmZvelB5a1c0RmVIK2NqYWIzb20xWVJydHVD?=
 =?utf-8?B?UjM5SnNzK1dwTkV6Q1BOUVFPdndMaTlPSmxMOGtmblIyMFd0S082RkQvaCsw?=
 =?utf-8?B?Y29jdUVtbUZmMkM2V0ROZzVXUEQyNm5ISVZZb1k5U01PbkZHdkw5Q2ZDTkNa?=
 =?utf-8?B?dW9UNXV6bTFWMmkzeEduTzJ3QkJNcXIwd0xmdnh6am5tb3NwUmFLUmdJSnhv?=
 =?utf-8?B?cnNiRm5KT09LZG9kVWF2azVXcG8wUXdyZ1U3NWpEMnFXUG9lcG5yU0tweGNp?=
 =?utf-8?B?YWwvWU5JTzBzcGl5QWFodXM4TTV6RUh2L0NSUThQNjRpUkdvd0pZMjVCeTdK?=
 =?utf-8?B?OHVNaENXL2xKb3VLdlZyUWN0RmRwYUtTdEVIN0F2N2tFR0hiZk9JN2V2QitV?=
 =?utf-8?B?STZtT1M3c3lkSWNMendWRnh6QXg4bWdldTBMRitNYk1ZZlRBa0UrNUhyOU1E?=
 =?utf-8?B?UEk4WmpNc2dveHkzOG80RmRQS3BtNU55NnlwT0o0TlF4Uk1INkJZUkFoYnA1?=
 =?utf-8?B?VzhocURGR3dpdG1UWjF1Tm5aeWJhQ0Vac2cwRGRFWFcxdWoraXFCR2tYazNC?=
 =?utf-8?B?enlIaGNJRm9kTkdFNEJPSy9CdHZqUWpTZWFkSWpINk1RVnpmZXVwaEI4K2hT?=
 =?utf-8?B?bWp1blNXSlc5dTNwVVE3RHQrZ3lZUUFWUmdsY2tDWXQ5aDRzVWRKVmdmdEsy?=
 =?utf-8?B?NmUra0Y2TkRHOEhRYktXak1WTG1wZ0V0aGo1RGFabituK3hRRFFZbXI1a3BC?=
 =?utf-8?B?VWF6dFcvNjV3NzdzVEx1TWphZjhtYkl1bXo0d1J3RjFUWkFaS0FaUWFOQjR4?=
 =?utf-8?B?RllsTGx2Z2JDZ3VwVDhxQUdNU1lJbzRScmJHd1krQWltZkJTREdLMjlJVUxy?=
 =?utf-8?B?cDNPQkQ3OUNEZ1NvRWtpWWFGTFdEUGoxT29aZTc1RVFmMUxjUUFVNFhnbW8y?=
 =?utf-8?B?NU0wRmFJLzZzME1LZk1UeXJsRGxSMm85YVljakg0bFRSY0xXbFVyTTh1N0o1?=
 =?utf-8?B?VkZLRE42dGFCaUlwTEdNU25PZ0pweXpOK0l2QUlhREFaemd0cDgxRlhrMjgy?=
 =?utf-8?B?cFJDWmg1ZnJXeVZyVFI4QjhZUG9NWE9kbWx1Z1JoNnRiVTE0QlQwUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB5082.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f25cceb4-b4df-4c02-3853-08df28a9dbe4
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2026 21:43:31.2567
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mE46QPhX0wXreosj9hQ/uxc3IpdJZ23gkuIoDLHN6Mkk/PjWpMLQLmspXOEGr0mglKT8QdPsMZODrhnEGwYjWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6009
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 21:43:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247691

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWW9hbm4gQ29uZ2FsIDx5
b2Fubi5jb25nYWxAc21pbGUuZnI+DQo+IFNlbnQ6IE1vbmRheSwgT2N0b2JlciAxMiwgMjAyNiA1
OjQ1IFBNDQo+IFRvOiBNYXJrbywgUGV0ZXIgKEZUIEQgRVUgU0sgQkZTMSkgPFBldGVyLk1hcmtv
QHNpZW1lbnMuY29tPjsNCj4gb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtzY2FydGhnYXBdW1BBVENIXSBnbGliLTIuMDog
cGF0Y2ggQ1ZFLTIwMjYtMTU1ODgNCj4gDQo+IE9uIFNhdCBPY3QgMywgMjAyNiBhdCAyOjMzIFBN
IENFU1QsIFBldGVyIE1hcmtvIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IHdyb3RlOg0K
PiA+IEZyb206IFBldGVyIE1hcmtvIDxwZXRlci5tYXJrb0BzaWVtZW5zLmNvbT4NCj4gPg0KPiA+
IFBpY2sgcGF0Y2ggcGVyIFsxXS4NCj4gPg0KPiA+IFsxXSBodHRwczovL3NlY3VyaXR5LXRyYWNr
ZXIuZGViaWFuLm9yZy90cmFja2VyL0NWRS0yMDI2LTE1NTg4DQo+ID4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBQZXRlciBNYXJrbyA8cGV0ZXIubWFya29Ac2llbWVucy5jb20+DQo+ID4gLS0tDQo+ID4g
IC4uLi9nbGliLTIuMC9nbGliLTIuMC9DVkUtMjAyNi0xNTU4OC5wYXRjaCAgICB8IDI2NyArKysr
KysrKysrKysrKysrKysNCj4gPiAgbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjBf
Mi43OC42LmJiIHwgICAxICsNCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAyNjggaW5zZXJ0aW9ucygr
KQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xp
Yi0yLjAvQ1ZFLTIwMjYtMTU1ODgucGF0Y2gNCj4gDQo+IEhlbGxvLA0KPiANCj4gSSBiZWxpZXZl
IHRoaXMgQ1ZFIGFsc28gbmVlZCBhIGZpeCBvbiB3cnlub3NlICgyLjg4LjIpOiBmaXggaW4gMi44
OC4zLg0KDQpEb25lIHdpdGggaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVt
YmVkZGVkLWNvcmUvbWVzc2FnZS8yNDc2OTANCg0KUGV0ZXINCg0KPiANCj4gUmVnYXJkcywNCj4g
LS0NCj4gWW9hbm4gQ29uZ2FsDQo+IFNtaWxlIEVDUw0KDQo=

