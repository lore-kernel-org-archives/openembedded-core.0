Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 430CDE77173
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 09:53:41 +0000 (UTC)
Received: from HK3PR03CU002.outbound.protection.outlook.com (HK3PR03CU002.outbound.protection.outlook.com [52.101.129.102])
 by mx.groups.io with SMTP id smtpd.web11.97311.1733738016276612411
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Dec 2024 01:53:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aspeedtech.com header.s=selector2 header.b=JFT5l+yM;
 spf=pass (domain: aspeedtech.com, ip: 52.101.129.102, mailfrom: jamin_lin@aspeedtech.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XLQEQfVPetuJbM+OM4QpYpWNHzvBe+jzmOi/HCaNiyJ+XTxhIIKNO3YSM2nhpM106aKy3Gtvxs3xm+yrDYwptxwbf9x3KkkbKdSimtA7J9D31gT2sx1CbRnGuxN9NA+LU+oeH6JIuUR+8VW/rLH2x3+Yuh4TIgFjVsK2Gcm8E78q2xBj+reKM69CHFEOnPHOKMdJXKRDM4AxCa7z+GjqwYGbrgPvClYVLVYPDpw1BxovmaBGeXfO+CAcMq7LB8RJZizYhP/lsMud0kKHb+kiF6EejJdqiBQbxVrIfya398PerfhsnQ3GaDbWkIzWuqHFOUwx2zU67AYdBSGsCmqU3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uk9X3Vd1dsijAIvRoQ2zrx6NCbMod8eGVvSLEyMbhzg=;
 b=L23kQD1xmVIzR8Z87Z8CMAbD0GPWdEhyDUmu0M5mjFzveFItOa/YvbQNLjffX0APSj0NMc52oyjTdzYXjrrs+3HBlVZZr8d51qhzKarwHde1+/vakTzuwFTpUM70nGzsX1Ee9hDafjRz1FLn2izPlU6UKN78f+Ptql+uaRtPApc9tW8+g4MR0vo/wRHht2sUpIhjE+AxNtXfbfrQV1TeLOi26ACFIvj+Rns8VDj+ZTREirPAh7GtYLA/v8cNh81a5y0VDtyu2s+8OvUY+CHTbLUdclr3t2IdfquPG3aEaAYCis7jPIHNgLf12ZT7BfEdi6xbOI1yjmrFDNC+50ALNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uk9X3Vd1dsijAIvRoQ2zrx6NCbMod8eGVvSLEyMbhzg=;
 b=JFT5l+yMT7S33zVcM+Lkut7L36zjxsM3BEVmTTJTG3AQ+ER/4w6dOSh7IZjI/fmqWmotENPsnyZcfANo7fBwRkWhwQYiA96e76zlkYDiTugohTBSE7y3gVNYEMIX6rZtFhZRK1c0R+5828JLP6D4eP9oeL130ccF34g/9SSnh3ZnwR6UvTArg2uZvvvXPLOPKFicWr+uiJ2hJk0LSMD6hFXKMBLPJT+SqiJmx/9uC65nX5Q5Mhq/pQWapvKgZjpsVdIGRHnmgVQ5MvtggqlF+4KMWBuX22pwAAH7wP6M+1eBBpCRP7sz6JW4e9eaLFWgnIHfTvzgSSicmbGkrosAnw==
Received: from SI2PR06MB5041.apcprd06.prod.outlook.com (2603:1096:4:1a4::6) by
 KL1PR06MB6687.apcprd06.prod.outlook.com (2603:1096:820:fd::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.11; Mon, 9 Dec 2024 09:53:30 +0000
Received: from SI2PR06MB5041.apcprd06.prod.outlook.com
 ([fe80::705a:352a:7564:8e56]) by SI2PR06MB5041.apcprd06.prod.outlook.com
 ([fe80::705a:352a:7564:8e56%7]) with mapi id 15.20.8251.011; Mon, 9 Dec 2024
 09:53:30 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Troy Lee
	<troy_lee@aspeedtech.com>
Subject: RE: [OE-core] [PATCH v1] python3-pyhsslms: Add 2.0.0 recipe
Thread-Topic: [OE-core] [PATCH v1] python3-pyhsslms: Add 2.0.0 recipe
Thread-Index: AQHbShYvvipsUfPbXUireoBJ0iy5+rLdpAoAgAAApHCAAAa9AIAAAFBQ
Date: Mon, 9 Dec 2024 09:53:30 +0000
Message-ID: 
 <SI2PR06MB5041FCB5D34F7F0C6C1E5B07FC3C2@SI2PR06MB5041.apcprd06.prod.outlook.com>
References: <20241209084142.939432-1-jamin_lin@aspeedtech.com>
 <CANNYZj_i1OCJMUT6oc9fSo0=eb=P+zS8zj=W-aP=aVhOjoekcA@mail.gmail.com>
 <SI2PR06MB504120C9AFEC4523F1911A21FC3C2@SI2PR06MB5041.apcprd06.prod.outlook.com>
 <CANNYZj8W0GnxXJbTGCcOVYeVzp=kiYzKtruqh_m+zwp2wJJffA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8W0GnxXJbTGCcOVYeVzp=kiYzKtruqh_m+zwp2wJJffA@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR06MB5041:EE_|KL1PR06MB6687:EE_
x-ms-office365-filtering-correlation-id: 00c5470c-c7c2-42ce-f89a-08dd18375606
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|4022899009|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?WEVxeGhialdJZjZGNzJlbytlelM2dndRQVAzWGdJK0wyaFBtQVp6UW44M21U?=
 =?utf-8?B?a1V0WmZhZzF4cXhRMnRwc2NhMHYweml6VktOZ0E5R0hZQnExSnRWdDFqcnps?=
 =?utf-8?B?ajdOTWhjdUN3NWdpdk9oVjFsTzVydHZGNXU5ZlBjdHo5MTI4SlVpbXFxckF6?=
 =?utf-8?B?citnNFhmcE92QkM5RVBSdGcva1JTOWo4ejF1aFk0ZkY0WWlTOC90dG9nSE42?=
 =?utf-8?B?eks2cmRvVTRUNGFkYU1tZjR0NW9HTGdITzhvVGRjQ2cxZDhsRkFYQXZlUGhm?=
 =?utf-8?B?V0FEalpDdUFabllEandnWGgrQlZ5NW4vUGhiakJpZVZxQnB4SGIyVEdEcWRV?=
 =?utf-8?B?QzVDVTRjS0ZKa29PMWtGWXU2V2ZERmZldkt2bUtMZDVIMWtIMEUwMEpDWHR6?=
 =?utf-8?B?ajhlaGNOSGd4ajVnblg2VVFXTDhuSWt0RkZWc2VJUldudURUbUZSWngreDM2?=
 =?utf-8?B?RDFjQ2s0UjlvY2pDeW1QN1pZclVwUER1ZWNxQ0hYbGIxbW1Vbm9pTjhkeWhN?=
 =?utf-8?B?L3BacEtGU2k5dXdCeG1YZzdNMzVxVkZGRk5uQTUycDJlT0YvbmJEY2lOSjd4?=
 =?utf-8?B?VmRIYWlRMHAxanNwVnRqdkJxUmtTOXFXYm1PelhhalJCMDhjWXd2ektiaDFM?=
 =?utf-8?B?ZG9Ea2prS0JEOFd3andGZ3BuU3NsM0pXdG85NmNoSTRZNWFoNkljNkZzU055?=
 =?utf-8?B?bjF2RUNpQ2pnNnA3YUNYZzF4K3dWdFZkTWlaOEJFMXVZbWZsZjNSa29NNHRz?=
 =?utf-8?B?dzVIbFV1YlpmWk8xZ3B4ZXRDbXBhVUczOWQ4T25namczWmExbVJYeVZYL0F4?=
 =?utf-8?B?N0lyaU9wWHo0L3pUQTQrUnRUajJwZC92UysyMTYreVZGWCtXenNFNW1LYk9X?=
 =?utf-8?B?VmxDb2NSWGZUTEptUTk1RVdORko0aHE4ZW0raFdaYWptcHZMdFN3TlRaMjZn?=
 =?utf-8?B?anR0VWhIeHNZUVcwUHBqTE9aSVFnV3dQMDJJdTRvT0hJeHlLNTNYSC9rNStz?=
 =?utf-8?B?QUxUL3QyamJGVE9rL3lUUndkazJ0bUM5ajF1U0tyU21XcHhST1lHdlI5R2dT?=
 =?utf-8?B?YWxod1ZuM0c5YXM3VUFOdlpWMkt0OTkzdERqRjlVbXk0cm9GdzducDFEYTZX?=
 =?utf-8?B?bFgwSkQ2VzhlZTc4bnduRUM1WVpPV3ZOUnpnRldiMUJONE93WUNDNmRMc0du?=
 =?utf-8?B?QkVKemRUdjdMYTlmbFMzdE0xOTREZmdLdXZ5Wm9RZ25Wc1FFK1R2V3NhM052?=
 =?utf-8?B?SkxtTnRyWEw2NW9TMDBFTGpReTdwam02ZkFlMHAza3YzOVV2RGJHZlVWV1Vm?=
 =?utf-8?B?c1lDY0xVOG5Hd2ZrNHQ3KzVJdEV0QkRkcm11amJwMmxleFRhWGtuYWduT3E3?=
 =?utf-8?B?UWNwRE9JZjVKV28xR2lnTHpyMDhXK3NoREFpRFNYaUFzWk5KWlRlRkRRY0Z5?=
 =?utf-8?B?RE40dW4yOU9meDFMSVpGclcyUHRnNDlyL3VxaVMrYWxzSUhzUGVZU2JuL0Fp?=
 =?utf-8?B?YTRDbHZ5RytzMXczZi92QUJzZ2hNRzU5dVBHZkhSK2l4czRlVGNuR1hEZTZO?=
 =?utf-8?B?cm1pKysxbHZUVzZmeVY1MDc4Y0YrRE1pQzhOYVRoSG9ISjJMUUpybmZWOVlP?=
 =?utf-8?B?MmxIK3dST2o2azgvaE9mcmFuL0xEWjFSclF6YTlhZ2h1SGlBTnVVbDEwN2Zz?=
 =?utf-8?B?Q3B2b0NrSzl0b3BaMHBTVlBBVGxTNXlsSkhnbWthOW16a2dWejcvOVBDTUUr?=
 =?utf-8?B?NFpwblR1Szh5VVo2Mm1sU1VBSDRPeW01NFRMV0d3OWRxdHNwZzdrcEFxdEJu?=
 =?utf-8?Q?+tppwcilqUllqHlBvYQv2dSzSmEJEbcQF2y7U=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5041.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(4022899009)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RnZJeFVMdDhLcDkyb3ZHYUw3anVrTGJNSi9ZTXV1VHEvMTQ3UW0rSGZHYXVp?=
 =?utf-8?B?M1c0d2liOGl3eGsweUpOd1ZEbkZGR24vTWszd0ZpNktONUdPaVg2Z0dqcnpF?=
 =?utf-8?B?K1FFQ1VhQmNZbmlteUtmZWw0cnFoUVJuR2NWYVdCdjJQNDZBRDVndXVBYnAv?=
 =?utf-8?B?V0RpYytJOFN6TkR4ZWNOa3haZzA1QU5CNzltU0p3MmxCU2lKVy9WcnRIUEt5?=
 =?utf-8?B?aS9FZW5PQnpGL21SWkxmNVFGcTgxVm1CZVRiaFFkSys3RnF5N3FRYlBQdUtk?=
 =?utf-8?B?K0h2ZzFFc2o3YURQUmZJbkNHbjJIQ1NXZFYyN1Z1YWl5WEFUSEt1YXNlbFd1?=
 =?utf-8?B?MlpXSmwxK01uYnFHSnJxd29YYzZLeUd6UVFESWVSRCtSc3dTV1VTck80UG44?=
 =?utf-8?B?RE9tZHpjL0ltMUtGOXVXOXdOU2dPbXB0S3BpNGJNVlN5cHJOZmJCeW05OUU3?=
 =?utf-8?B?TG93aFpZb2RqbnFZS080R093TGJ1NEo3R3R0MWVWRytseDRmcWs3dWdBMXpW?=
 =?utf-8?B?bjNlME1Tem1kRGMvOEZMczhJV1IxV0tpenFyTU1CdFJOOGdtOTdEQkxkd2ZL?=
 =?utf-8?B?eERPU2o5VWR1QlAvR3NmdEl2UnNFWXBDRno2MmxqRldDcFRVRTgyT3RTOVJD?=
 =?utf-8?B?NWxwS1E2U25RS2djQTZiVC84S2xDOXp2dzJrdEUzb2VwdUJYdHh1QnRSdFY1?=
 =?utf-8?B?VWlzNEVpajBIbXhEOU95WmNlMnNKTXpoeENBbE5MMDRpTm0rNVBSZmFHRVJs?=
 =?utf-8?B?aW9jc1NHVTd1ZHZTWVBIK0JiVkFHTTI3VTFGQ2NSMU9IeUdhYllhM2JLNjFF?=
 =?utf-8?B?Y3dmVFJpcjY5M1VvZ1ZZWmZzdnpMM0Vnd25vVmxqVU1tTWtEb2R1enVHZ05B?=
 =?utf-8?B?NmpTOHZTWUVTNm5YZm9ORzQ2aWN3YXBmM1Z0UitrOCtrMEFrQ2RoeEg2ZlQv?=
 =?utf-8?B?bEtSV1N4U1c0eE5JVDNTejlqNnBldHM1NVZtQVUvM1c4S0owS1NCdHNzUW9V?=
 =?utf-8?B?Q0dYWFhobE5VZ3laL2lNVTg5QWNUMjJpcFlTWWlZeDUxVVBJb0l6K0VsYkQw?=
 =?utf-8?B?eTFIb1FCZVNwUTJLUjZKUzdHb3FGUkYvVXBhVmNCTWlWUGV1UGpEV2htSFBh?=
 =?utf-8?B?VHUwZ25mMFpPdm5kUDc1TlB2VW1xL0czUG91Q1ZSTEtvMzVnVGNuMEZMbHZD?=
 =?utf-8?B?QmJYRHZJeTYvMnU0SWFHeUN3U1RPRTE2dy83SmVuRE9vZVFETy80UCtON2tm?=
 =?utf-8?B?eUNWd1FQenBhYS91dzZyN2RMWnlGZlJzc2RSZEYzcHhWRFlDbi9VaSt6UTd3?=
 =?utf-8?B?RE1HeTVVVVI2dURpUzFPR204Qmhuc0l3MTl2NURPWmsvMkxaQTVvL3JOa3N6?=
 =?utf-8?B?NGpQb2t4UXVobVZLNkRadXAvdGp5dm5za0pHbUdwSTRjSTk3TnY5THpSNE4x?=
 =?utf-8?B?VlJxNXpyZ3FnY2JqWm9qRVpURFZ5cjFzSVpIN2VwdXdYYkVoVzZvMU5CWjJH?=
 =?utf-8?B?eEhrMXRCcnNLZjNqZ0hxWHNKaWk4M3pEcUR5bW45SmlDc0J1aTB4ZEFROVl0?=
 =?utf-8?B?Y2l2dE1nSFVDK1pVaHFCdkpYRXVHMnBycC9jQzJ6VEY1eWlmN01haFRLcDJI?=
 =?utf-8?B?bEZWTGxYNlhpMVdKRWRwTVpScStXdGMvckVuZ3VwSkRwUVA0SnZZWWJHM1Nj?=
 =?utf-8?B?cXFvMG1ibEZGTkRxdjRCK0JsMERyVTBqbUt2Qkpjb2F1MHVqSEdUN25mMjhI?=
 =?utf-8?B?cTdvTkE5bnZ5MXpqeUQrTlJ0dGdhOXZrOFp4OElhNjN6bjFpWTJta0NLWTNM?=
 =?utf-8?B?dFByT3M1K1VQajdzNW9ML2xsZVlqSkR2TFdWZFFYVWZaM0I3ak5WSDBCU1RN?=
 =?utf-8?B?Y2oyTkdLc1lKL2RvMjJ6OEVuQVFaL0dKTDZRbGdIQkM5QUV6a2Zid2VCK3Vz?=
 =?utf-8?B?SUdyVGRJcUs4MVNCSWxVd2t6NHpJeUc3RW5KUFZld2kwNFozNW00am9ZdnBG?=
 =?utf-8?B?T2RPQ3YzSzVyRlpENnNZU0tmeTVpSWU0TXdkQjM0ekxNTG5nczNCMDl3Vm9K?=
 =?utf-8?B?N0VES0k3bngzcXJRbThYakhVNTZGZ2dzdDh2ZFZzbmNrc1dLNlRGREdBOXBL?=
 =?utf-8?Q?h50L4IP8pNlkP2GkCvg6amc1p?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5041.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00c5470c-c7c2-42ce-f89a-08dd18375606
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2024 09:53:30.1980
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iGShNQgEHCbc3fEmz0HCKHIx/Yz4vqqz5ng9+tn/mMmuoYgSHCikY1JCCEinDCakXb88tMRvenVlmvA6IcQCHCcL3BdgoIxF196ybeTY6V4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6687
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 09:53:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208479

SGkgQWxleCwNCg0KPiA8dHJveV9sZWVAYXNwZWVkdGVjaC5jb20+DQo+IFN1YmplY3Q6IFJlOiBb
T0UtY29yZV0gW1BBVENIIHYxXSBweXRob24zLXB5aHNzbG1zOiBBZGQgMi4wLjAgcmVjaXBlDQo+
IA0KPiBIZWxsbywNCj4gDQo+IHRoYW5rcyBmb3IgdGhlIGV4cGxhbmF0aW9uLiBJJ2Qgc2F5IGl0
IGlzIGluZGVlZCBiZXR0ZXIgcGxhY2VkIGluIG1ldGEtcHl0aG9uLA0KPiBjYW4geW91IHNlbmQg
YSBwYXRjaCB0byBvcGVuZW1iZWRkZWQtZGV2ZWwgbGlzdD8NCj4gDQoNClRoYW5rcyBmb3IgcmV2
aWV3IGFuZCBzdWdnZXN0aW9uLiBJIHdpbGwgcmVzZW5kIHRvIG9wZW5lbWJlZGRlZC1kZXZlbC4N
Cg0KPiBBbHNvIEkgd291bGQgcmVjb21tZW5kIHRlc3RpbmcgdGhlIG1vZHVsZSBvbiBhIHRhcmdl
dCBpbWFnZS4NCj4gUGFydGljdWxhcmx5LCBpdCBkb2Vzbid0IGxpc3QgYW55IFJERVBFTkRTIGl0
ZW1zLCBhbmQgd2lsbCBsaWtlbHkgbm90IHdvcmsNCj4gcHJvcGVybHkgYmVjYXVzZSBvZiBpdC4N
Cj4gDQpUaGFua3MgZm9yIHN1Z2dlc3Rpb24uIEkgd2lsbCB0ZXN0IHRhcmdldCBpbWFnZSBzdWNo
IGFzIFFFTVVBUk0gYW5kIGVuc3VyZSBpdCB3b3Jrcy4NClRoYW5rcy1KYW1pbg0KDQo+IEFsZXgN
Cj4gDQo+IE9uIE1vbiwgOSBEZWMgMjAyNCBhdCAxMDo0MywgSmFtaW4gTGluIDxqYW1pbl9saW5A
YXNwZWVkdGVjaC5jb20+IHdyb3RlOg0KPiA+DQo+ID4gSGkgQWxleA0KPiA+DQo+ID4gSSBmb2xs
b3dlZCB0aGlzIHJlY2lwZSwgcHl0aG9uMy1jcnlwdG9ncmFwaHkuYmIgYW5kIHNlbmQgdGhpcyBw
YXRjaCB0bw0KPiA+IHBsYWNlIHB5aHNzbG1zIGludG8gT3BlbmVFbWJlZGRlZC1Db3JlL21ldGEg
bGF5ZXINCj4gPg0KPiBodHRwczovL2dpdGh1Yi5jb20vb3BlbmVtYmVkZGVkL29wZW5lbWJlZGRl
ZC1jb3JlL2Jsb2IvbWFzdGVyL21ldGEvcmUNCj4gYw0KPiA+IGlwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtY3J5cHRvZ3JhcGh5LmJiDQo+ID4gSSBhbSBva2F5IHRvIHJlc2VuZCB0aGlzIHBh
dGNoIGFuZCBhZGQgdGhpcyByZWNpcGUgaW50bw0KPiBtZXRhLW9wZW5lbWJlZGRlZC9tZXRhLXB5
dGhvbiBtZXRhIGxheWVyLg0KPiA+DQo+ID4gVGhpcyBweXRob24gbW9kdWxlIGlzIHVzZWQgZm9y
IExNU1MgYWxnb3JpdGhtIHN1cHBvcnQgYW5kIGl0IGlzIG5vdCBhDQo+ID4gSEFSRFdBUkUvQk9B
UkQgc3BlY2lmaWMuIFRoaXMgcHl0aG9uIG1vZHVsZSB1c2UgU29mdHdhcmUgdG8gc2lnbiB3aXRo
DQo+IExNU1MgYWxnb3JpdGhtLg0KPiA+IEkgdGVzdGVkIGl0IGluIE5BVElWRSBidWlsZCBlbnZp
cm9ubWVudCB3aXRoIGRldnNoZWxsIGFuZCBteSB0ZXN0ZWQgc3RlcHMgYXMNCj4gZm9sbG93aW5n
Lg0KPiA+DQo+ID4gMS4gREVQRU5EUyArPSAicHl0aG9uMy1weWhzc2xtcy1uYXRpdmUiIGluIHUt
Ym9vdF8yMDI0LjEwLmJiIDIuDQo+ID4gYml0YmFrZSAtYyBkZXZzaGVsbCB2aXJ0dWFsL2Jvb3Rs
b2FkZXIgMy4gQWRkIG15dGVzdC5weSBhbmQgdGhlDQo+ID4gY29udGVudHMgb2YgdGhpcyBmaWxl
IGFzIGZvbGxvd2luZy4NCj4gPiBgYGANCj4gPiBpbXBvcnQgcHloc3NsbXMNCj4gPg0KPiA+IHBy
aXZfa2V5ID0gcHloc3NsbXMuSHNzTG1zUHJpdmF0ZUtleS5nZW5rZXkoJ215a2V5JywgbGV2ZWxz
PTIpDQo+ID4gcHJpdl9rZXkuc2lnbkZpbGUoJ215ZmlsZS50eHQnKQ0KPiA+IGBgYA0KPiA+IDQu
IHRvdWNoIG15ZmlsZS50eHQNCj4gPiA1LiBweXRob24zIG15dGVzdC5weQ0KPiA+DQo+ID4gVGhl
biwgaXQgY3JlYXRlZCBzaWduaW5nIGZpbGUsIG15ZmlsZS50eHQuc2lnLg0KPiA+IGhleGR1bXAg
bXlmaWxlLnR4dC5zaWcNCj4gPiAwMDAwNmEwIDllZjkgZDUzNyAxMWMwIDk3NjYgNDExNiBjYzVj
IGNkY2MgMDY2OQ0KPiA+IDAwMDA2YjAgZjdmNiBlMjBmIDRjMTEgZTRkOCBmYmRjIGJjYTUgMzAz
NyBiNGM4DQo+ID4gMDAwMDZjMCBjOGQyIGQ1ZjUgMTgxOSBhZGEzIGE3YjAgY2UyMiA1MzM4IDdh
NTQNCj4gPiAwMDAwNmQwIGJkZjYgN2U3MSA4MTI1IDc1NmYgZGFiYSA0YTQzIDEzZjMgYjY5Yw0K
PiA+IDAwMDA2ZTAgZTcwMiAwNDBmIDhlODggZWE3OSA5ZWQxIGVmNDggYzEzNSAyMzRjDQo+ID4N
Cj4gPiBJIHJlZmVyIHRvIHRoaXMgUkVBRE1FLm1kIHRvIGNyZWF0ZSB0aGlzIHRlc3QgZmlsZSB0
byB0ZXN0IHRoaXMgcHl0aG9uIG1vZHVsZS4NCj4gPiBodHRwczovL2dpdGh1Yi5jb20vcnVzc2hv
dXNsZXkvcHloc3NsbXMNCj4gPiBodHRwczovL2dpdGh1Yi5jb20vcnVzc2hvdXNsZXkvcHloc3Ns
bXMvYmxvYi9tYXN0ZXIvUkVBRE1FLm1kDQo+ID4NCj4gPiBUaGFua3MtSmFtaW4NCj4gPg0KPiA+
ID4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggdjFdIHB5dGhvbjMtcHloc3NsbXM6IEFk
ZCAyLjAuMCByZWNpcGUNCj4gPiA+DQo+ID4gPiBIZWxsbywNCj4gPiA+DQo+ID4gPiBJJ2QgbGlr
ZSB0byBiZXR0ZXIgdW5kZXJzdGFuZCB0aGUgdXNlIGNhc2UgZm9yIHRoaXMgcmVjaXBlLiBXaGF0
DQo+ID4gPiBtYWtlcyBpdCBpbXBvcnRhbnQgZW5vdWdoIHRvIGJlIGluY2x1ZGVkIGluIG9lLWNv
cmUsIGFuZCBub3QsIGZvcg0KPiA+ID4gZXhhbXBsZSwgaW4gbWV0YS1weXRob24gdW5kZXIgbWV0
YS1vZT8gSWYgaXQgaXMgaW5kZWVkIGJyb2FkbHkNCj4gPiA+IHVzZWZ1bCwgc2hvdWxkIGl0IGhh
dmUgdGVzdHMgdGhhdCBlbnN1cmUgaXQgd29ya3M/DQo+ID4gPg0KPiA+ID4gQWxleA0KPiA+ID4N
Cj4gPiA+IE9uIE1vbiwgOSBEZWMgMjAyNCBhdCAwOTo0MSwgSmFtaW4gTGluIHZpYSBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnDQo+ID4gPiA8amFtaW5fbGluPWFzcGVlZHRlY2guY29tQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPiA+ID4gPg0KPiA+ID4gPiBUaGlzIHJlY2lwZSB3YXMg
cGxhY2VkIGluIG1ldGEtYXJtIG1ldGEgbGF5ZXIsDQo+ID4gPiA+IGh0dHBzOi8vZ2l0LnlvY3Rv
cHJvamVjdC5vcmcvbWV0YS1hcm0vdHJlZS9tZXRhLWFybS9yZWNpcGVzLWRldnRvbw0KPiA+ID4g
PiBscy9wDQo+ID4gPiA+IHl0aG9uL3B5dGhvbjMtcHloc3NsbXNfMi4wLjAuYmINCj4gPiA+ID4N
Cj4gPiA+ID4gSG93ZXZlciwgdXNlcnMgbWF5IHdhbnQgdG8gYnVpbGQgdGhpcyBweXRob24gbW9k
dWxlIGJ1dCBkbyBub3QNCj4gPiA+ID4gd2FudCB0byBhZGQgIm1ldGEtYXJtIiBsYXllci4gVG8g
bWFrZSB0aGlzIHJlY2lwZSBtb3JlIGZsZXhpYmxlLA0KPiA+ID4gPiBtb3ZlIHRoaXMgcmVjaXBl
IGZyb20gbWV0YS1hcm0gdG8gT3BlbkVtYmVkZGVkLUNvcmUvbWV0YSBsYXllci4NCj4gPiA+ID4N
Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSmFtaW4gTGluIDxqYW1pbl9saW5AYXNwZWVkdGVjaC5j
b20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiAgLi4uL3B5dGhvbi9weXRob24zLXB5aHNzbG1zXzIu
MC4wLmJiICAgICAgICAgICAgICAgfCAxNA0KPiA+ID4gKysrKysrKysrKysrKysNCj4gPiA+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspDQo+ID4gPiA+ICBjcmVhdGUgbW9kZSAx
MDA2NDQNCj4gPiA+ID4gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5aHNz
bG1zXzIuMC4wLmJiDQo+ID4gPiA+DQo+ID4gPiA+IGRpZmYgLS1naXQNCj4gPiA+ID4gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHloc3NsbXNfMi4wLjAuYmINCj4gPiA+
ID4gYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHloc3NsbXNfMi4wLjAu
YmINCj4gPiA+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiA+ID4gaW5kZXggMDAwMDAwMDAw
MC4uYjE4ZDFjOGU4Ng0KPiA+ID4gPiAtLS0gL2Rldi9udWxsDQo+ID4gPiA+ICsrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWhzc2xtc18yLjAuMC5iYg0KPiA+ID4g
PiBAQCAtMCwwICsxLDE0IEBADQo+ID4gPiA+ICtTVU1NQVJZID0gIlB1cmUtUHl0aG9uIGltcGxl
bWVudGF0aW9uIG9mIEhTUy9MTVMgRGlnaXRhbA0KPiA+ID4gPiArU2lnbmF0dXJlcw0KPiA+ID4g
KFJGQyA4NTU0KSINCj4gPiA+ID4gK0hPTUVQQUdFID0iaHR0cHM6Ly9weXBpLm9yZy9wcm9qZWN0
L3B5aHNzbG1zIg0KPiA+ID4gPiArTElDRU5TRSA9ICJNSVQiDQo+ID4gPiA+ICtMSUNfRklMRVNf
Q0hLU1VNID0NCj4gPiA+ICJmaWxlOi8vTElDRU5TRS50eHQ7bWQ1PWJiYzU5ZWY4YmYyMzhjMjkw
MmNhODE2Yjg3YjU4NTcxIg0KPiA+ID4gPiArDQo+ID4gPiA+ICtpbmhlcml0IHB5dGhvbl9zZXR1
cHRvb2xzX2J1aWxkX21ldGENCj4gPiA+ID4gKw0KPiA+ID4gPiArIyBNYWludGFpbmVyIHJlZnVz
ZWQgdG8gdXBsb2FkIHNvdXJjZSB0byBweXBpLm9yZywgYnV0IHNhaWQgaGUNCj4gPiA+ID4gK3dv
dWxkIGluIGEgZnV0dXJlIHJlbGVhc2UuICBJbiB0aGUgbWVhbnRpbWUsIGRvIGdpdGh1YiBTUkNf
VVJJID0NCj4gPiA+ICJnaXQ6Ly8vZ2l0aHViLmNvbS9ydXNzaG91c2xleS9weWhzc2xtcy5naXQ7
YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwcyINCj4gPiA+ID4gK1NSQ1JFViA9ICJjNzk4NzI4
ZGVlZDZkM2Y2ODFjOWU2YmZkN2ZlOGE2NzA1ZjU2MzhiIg0KPiA+ID4gPiArDQo+ID4gPiA+ICtT
ID0gIiR7V09SS0RJUn0vZ2l0Ig0KPiA+ID4gPiArDQo+ID4gPiA+ICtCQkNMQVNTRVhURU5EID0g
Im5hdGl2ZSBuYXRpdmVzZGsiDQo+ID4gPiA+IC0tDQo+ID4gPiA+IDIuMjUuMQ0KPiA+ID4gPg0K
PiA+ID4gPg0KPiA+ID4gPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiA+ID4gPiBMaW5rczog
WW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gPiA+ID4gVmll
dy9SZXBseSBPbmxpbmUgKCMyMDg0NzUpOg0KPiA+ID4gPiBodHRwczovL2xpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzIwODQ3NQ0KPiA+ID4gPiBNdXRl
IFRoaXMgVG9waWM6DQo+ID4gPiA+IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC8x
MTAwMDI3OTcvMTY4NjQ4OQ0KPiA+ID4gPiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWNvcmUr
b3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+ID4gPiBVbnN1YnNjcmliZToNCj4gPiA+
ID4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvdW5z
dWINCj4gPiA+ID4gW2FsZXgua2FuYXZpbkBnbWFpbC5jb21dDQo+ID4gPiA+IC09LT0tPS09LT0t
PS09LT0tPS09LT0tDQo+ID4gPiA+DQo=

