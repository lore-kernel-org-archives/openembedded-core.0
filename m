Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DD4CC61CE8
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 02:24:36 +0000 (UTC)
Received: from OS8PR02CU002.outbound.protection.outlook.com (OS8PR02CU002.outbound.protection.outlook.com [40.107.75.87])
 by mx.groups.io with SMTP id smtpd.web10.668.1749781469766820806
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 19:24:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aspeedtech.com header.s=selector2 header.b=QhnlkOOu;
 spf=pass (domain: aspeedtech.com, ip: 40.107.75.87, mailfrom: jamin_lin@aspeedtech.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EqNg4ZoSfIlVEPlABRUS+rV2Kj1slQwproxqDz85TdxEg8YqgnKT4ypE4n+G7kjPf5qPKtnfkKyhHug0fw8qZROMKxEh0Kmeun7x/qwcYozYWzvSUzgcRhOdppbjwasHj6s8QKd+Wz0VFu4mFXM9dnuWim/089cQMUyqO/EQkhh9WCAUUwcH5opwLcrf9MdJVws5vWjYkJ3nIH0rNq3ec6pC0/9uDXnLOVuWSHRuIBF7e//B19bii+eF2TEe+kyiMmOH/ac7isIj9GHv6YH1yNzNP/ICVtExD239Ejgf3/2RGoymLiJTCD6Ksh1aGE3K400HDTlNNgpTXoiT4f1gbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ppFUFE6wqZLHiZpBYb7LQ2IGJUk10v9c3lZrSxO8UU=;
 b=fXWzvf0SCNvIs6od6bWrFwiQaE33Pl5qcFHn+LjlTHt4/DZO4yXcxFTnBbwVJIfXhQPhP631U9H2Q3TjIlCcowxRBTVdUWhAOFSbQkK1zCpWQkwCBDwhyZc/4Uq0bbSXfgf3TUksxfLV3YGNu6zImBoK6L5EyCJiLtfxceqC6TddrevcVLyBkIaA3xnu49+6vp8sDQV9HQ19pwN7f8ZUpujwqVKUexty+5EuIxryNuAW5qprWdsfTQ+SAnYDfBBKtYnNYh4sqr9gqUn2wqj/FoQ3w11KelMYpuem4yG3y+ICeS1iXR/TgAsKaSR8Jist1SWHLPoqICqFPPYumAe1jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ppFUFE6wqZLHiZpBYb7LQ2IGJUk10v9c3lZrSxO8UU=;
 b=QhnlkOOuGFmzqvcf2eHSUErS781MRaEvJVEvGsZX3uD0Yx2g5W3UNBZzWPfIIi+JU5ez1oLMty2nfUodt3tR496QWVIM46MMsANwDhIRYVVJ98hUXKpg0ZWbanhfW5bhZyJxa8LFhRaUcm3rIaAaXIpDtLi0Hn/5vHdGkUJThHmIh/zPd5iqgTowa9+edrKaoopqEcg5S1yH6iDHUMaxnSxtYzCMaWihBu1lZ4GJBwchbeWOo9PdRPIe9h00+k1l1SERuqb/AuDFu2wFLrrPkJIeM1OHZXVKhKscVNJVE/53hTc7V0JjvXmcOGPhij+GNxz/fSNqvQHrb/I2b2nDKA==
Received: from SI2PR06MB5041.apcprd06.prod.outlook.com (2603:1096:4:1a4::6) by
 TYZPR06MB6498.apcprd06.prod.outlook.com (2603:1096:400:465::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Fri, 13 Jun
 2025 02:24:21 +0000
Received: from SI2PR06MB5041.apcprd06.prod.outlook.com
 ([fe80::705a:352a:7564:8e56]) by SI2PR06MB5041.apcprd06.prod.outlook.com
 ([fe80::705a:352a:7564:8e56%4]) with mapi id 15.20.8813.024; Fri, 13 Jun 2025
 02:24:19 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: "Freihofer, Adrian" <adrian.freihofer@siemens.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Troy Lee <troy_lee@aspeedtech.com>
Subject: RE: [OE-core] [PATCH v1 1/2] uboot-sign: Avoid symlink and install
 errors when SPL DTB is missing
Thread-Topic: [OE-core] [PATCH v1 1/2] uboot-sign: Avoid symlink and install
 errors when SPL DTB is missing
Thread-Index: AQHb1rNTo+Gi3ZoUCUaJWW85eWHLsrP/Z7sAgAD+H/A=
Date: Fri, 13 Jun 2025 02:24:19 +0000
Message-ID: 
 <SI2PR06MB5041C15A113B0EE4AA7B1543FC77A@SI2PR06MB5041.apcprd06.prod.outlook.com>
References: <20250606071915.2680182-1-jamin_lin@aspeedtech.com>
	 <20250606071915.2680182-2-jamin_lin@aspeedtech.com>
 <4004e8969d9e5d7ba9915e1cf4240ba08c12b0f7.camel@siemens.com>
In-Reply-To: <4004e8969d9e5d7ba9915e1cf4240ba08c12b0f7.camel@siemens.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR06MB5041:EE_|TYZPR06MB6498:EE_
x-ms-office365-filtering-correlation-id: 06526f64-88dc-4432-9105-08ddaa21670f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|4022899009|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?Sk5WZTNFR3oxQnE1K1N0M3FxemNxZ2ZoSk5pY1lpcnhnQ2x1YjVVMkhYZmVa?=
 =?utf-8?B?MEdSSCs0c1JXZGtteThlYXVpS1J6TjdWUUE3OXBGNmdmZVV3VGs1Yk9CZzdN?=
 =?utf-8?B?ck1WQS8vMksyMHNhWXZxcm1DSGVTL0RnODRqbVVSUnkvejlyZWdvZ28waVQx?=
 =?utf-8?B?L0x0YmJQWjlrOGxEekREdWZWckdaR01uSjBLUHduRDd4THE4eTkrcTk4SFd0?=
 =?utf-8?B?ZjAxRmplZEcrWGgxUWJwckFGU0JUR2xEK2pjVTJZeGxYME9BdXlBRmlMcjdx?=
 =?utf-8?B?QmJUOEsyU0hzMzArSzM0eHVrN1NHZTNEZ3VOVU51NHkweUMwUjBlaHVHVlE2?=
 =?utf-8?B?SGFzTjhaOHQ2NGVJMitHSXgyL20xeGNRKzV0bHVGNXZSTG90Sjd0Rm1BdWs3?=
 =?utf-8?B?NHlWUGthcUVlTlhZaHg4SDBiM0FwN1c3V09CRm9PcFRqMjE0Vko3aForV2Uv?=
 =?utf-8?B?cHhnb2MzWUp1M2VXRVVMM0dDOUx1WXR1QlIwR0VIWlpKK0NIb29kWmlEZ3Nu?=
 =?utf-8?B?aERtK3YzTUpyR2UrWEVmVmRrSUtxTFg2VUpCamtTQWU3U1dDRGdSREIrMEd6?=
 =?utf-8?B?b0RYeWZDMXVqdkd5K0NKUlp2aUVYb3B0L3ZqaGpCa3p2bGNmUHdpUldmdkVY?=
 =?utf-8?B?ZUZDdTIvQXNMcGxrRDlQaVFycFRXL01iVEFhS2hjQnBBWGtFSU9sbERjVktW?=
 =?utf-8?B?NDBLakVHZTIxYUlOanU4a1NwVDRUaHh5TXA1bTdXTTFmYm9YSlNFMnkxTC9i?=
 =?utf-8?B?UUF6aDRJblpFSkhFQm1nSEFlTkk3ZWVDaDdRRkNVaUJjVXFBdE9IS2tpOENq?=
 =?utf-8?B?NjBsVTB5bjhhdTJwWWdQQVJkQlI4aXlRK2ZxeWJZL0IxS01nYitKUjNpNmNz?=
 =?utf-8?B?OEpWT2pIbUNWQnh3N0g3MktqRzZnN3BPMnpkclRLM2kzMmQyKzViS0RmcWNS?=
 =?utf-8?B?cmM5ZytPa05GR2tNUENzNk83MFYxZjVlbUxYdzBQU0F0OFVvbGlRVUhtUFVy?=
 =?utf-8?B?L0xvV3pGSzl0WGJlZXI4VHAvMW0wSDNsS3BuZ1llLzl2YkJkcGE0SG00eWJV?=
 =?utf-8?B?SGZvN01JY29iMjhjaGQ1Y3kzZEw3WlZzWjN0NkpZSFFrWU9oUndvNUY3eUxR?=
 =?utf-8?B?N1FvSWlnWExVMEUxekZhcmMrNGg4TWVpdkZjVndRaWF0UEpjZkF0bDRXODd0?=
 =?utf-8?B?ajcvNXV0aDl0MEJkRVBnMjl2Y1grK1JNOGRMOXJ2ZExiNjBpVnIzNEVjTndj?=
 =?utf-8?B?WGZocXFlbnljMDFLWEJtRW44ZjRlbC93NGQzemt3UkVqeCtGSFQyNlVtdE9K?=
 =?utf-8?B?YUs5dllYc2xzMEpEdjB3Nk5JbUhwWHQ1RVdra29nZVliOUs5L1F3b0NVbjRu?=
 =?utf-8?B?blYzdk55dXNJalg2bG93OEdhTEp6RWtsNFVkNURBVHRBdDdtaG5qTHhYUDJq?=
 =?utf-8?B?VUV6SWhHand1dzZWVXczei9Ib3J2TTdDUWlNd0hsNGo4UmRJMVgzcnprcmxL?=
 =?utf-8?B?dTRaOVkxQkJkS1d6M09EUk84OCtqVjRnSHh3clprVWFjS1hKSnBmbisxV3Z4?=
 =?utf-8?B?ZE84N0dBNE8rVzZLcVY0dVYzQTIvdU9hWno1YTFpK0o2WlRxRDNHa29pSDRm?=
 =?utf-8?B?Unh1UFNZQXZCUTYyYzE3SWllOFpZZU0rMEVVbVZqdjF4T2hZR0YyTTFGbFQy?=
 =?utf-8?B?cytYcFVwUms5RWRWcTIyUWdVUnBWRm5sem9WSVoxRG00MmpXWkY4Ym9EakNq?=
 =?utf-8?B?UEhCMmRDSnpTb1dMcTRVcmNMczhPdksxYWJzUERlZWRGN3lBKzgwL212cDdS?=
 =?utf-8?B?RS9EQnJQU0U4elJyYVV0eG1BbHg2RFA3YVQ4bmlqaSt5bENXTXE2eHA2UjZ2?=
 =?utf-8?B?N21qMGRLZUxZSVBKVjY4cW5oUnp4MTVPd2M5TUZ2OHB1eDhXQlhqMzlKV0FU?=
 =?utf-8?B?QmhJdU9tUDRnZEdlQkJaR2VNbGkwd3JFUSt6QXV0YnJxSU5OZUU3NStvREFS?=
 =?utf-8?Q?syrzQHXD/+vAUm4QERN4i0/A5QvTMw=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5041.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(4022899009)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?N0EwYm85WDZYMmVpbGZkTnYzaFVKMWphTjRyb1d6Tzhjbm9WaGdZY0RYdHQx?=
 =?utf-8?B?dVhQMmRVRTYwaHF6RVRkYlBGVUpZZ29jNElYL25qLzU1SlgzOEN5bzY2Z21Y?=
 =?utf-8?B?bURNRk5xY3J3VDZmTHFjSTVJVkpMWXhRWnlkUXVMK0h1ZFFid2lBSmJkRE54?=
 =?utf-8?B?UENiVURndWZPdzV3Y0JhQjBmUmlGd3lCUHZWNys3VGdkZ0xoUkhLTWZ5U0dL?=
 =?utf-8?B?RXRtd0FQcVdIa0FXblFtVDdtQmFzWElRQWZNQWE1Q0xYeEkyeXZzVmFRUElO?=
 =?utf-8?B?bms1S0JCdVZ5U3VIeWd0elA1WDZUOHNmTXlURGIwVU4rM2NkOW1QVk9NQ1cy?=
 =?utf-8?B?MXZpaUNCWmJ0UzEwc2pNQW41RXpXZTVqSWVQeWdHSTRDdFFWb2FQdVpoaTU1?=
 =?utf-8?B?NUVqOUxVUTlZY2YwYjh4ajJCajZBSUxEK213U20yKzNOOFZmeVBBY3puSThX?=
 =?utf-8?B?VEZ4b29pamcyUGh2RllmVGxpZUgvY0JxNXR4UmFEVURXNjVnTjRvckRZSzBH?=
 =?utf-8?B?d1VvTVhoN2RaZHhsTXdxL2JUNGcvQm1QNnphNzRkeFE0R2NaMFhlMVJka0Qz?=
 =?utf-8?B?L3licTl1SXhwZWNvR3lkNVlmMEM3a0c2Q3VHRmhjSGdBaXZGRzhyQlZBK05H?=
 =?utf-8?B?NHdMNVJFNUxrVGhVdVJURGhoc21GNXl0Y0NkMUFzOVh4R3U3WEEvQ09lTnJi?=
 =?utf-8?B?QngxamFuU3ZkVktIQ0xzWG5EbGZLRDJ6LytaYmVpYUJVaEQrUlk2T2lvczg3?=
 =?utf-8?B?cnJiZTJESnh5K0lhSWQ0T2IyWFRyTllrVG1hK2ZIMTcvOVllTWR6N080VmQv?=
 =?utf-8?B?b25pN1BSNHozYkFEZU1RbzhqS1VUZzBmNGpBeDlSMTJ3MXNkZXZ5UkJMMDlZ?=
 =?utf-8?B?L1RFbmNiV2xGMlFGdmNLdTZoSk1Bdllqb3gwUTdFdStndW9Ha0J0MVpCNGpN?=
 =?utf-8?B?Z0I4M21DR2kvMFZTbko0QS91Q3Zoa3FvT1lNelFyWERnNmx0bzgydGZjMmZY?=
 =?utf-8?B?S29pM09EbTBqRXlXSmkxS0dpZ2s1UEdCUUh6Zkx0L3NkZ2NaeEtpRWtrYUMz?=
 =?utf-8?B?VmFMSS9iUHA4VWtBR3lJYlNzS0JEcXdTVld1cThYd2dmNmtKcW9wTWtneXE0?=
 =?utf-8?B?QlBhREY4OGF1R0dOenVEWXd1eStycWpNWDVzY0VmMkN5UDNoQzRlNXNZbXhZ?=
 =?utf-8?B?ZlBrVEN6akZMSkRhOWhpYlB5WEw1TnpqUjQ4VjN3K21pbzFSaHhUbXdiaFJZ?=
 =?utf-8?B?eklRb0RUUkd6SW9XQkVCSzRQdEdlUVVucDhTeWJDV0l1bklpTnRueVFQbFEw?=
 =?utf-8?B?WHI1RUQxUWJXOXFSeFFxNUtRQk1kTWdpdm81ZjkyMm9mYTdpUU5JYThoRUx0?=
 =?utf-8?B?VktwWEhzY1VySFpNYjZyazZUcE1STXprMVFkNyswSFk0Skd3RVpvRndnbEJR?=
 =?utf-8?B?V0MwWmNzYzhVZDN1ZGUzd21ndmxCcEd0VzhQTlV5YXdpVENoL21POGhLcmRt?=
 =?utf-8?B?QjE1aXJQT1RLNVRleVd2NXVuc3p1RFhpN2FhSzBCTEwvTndFVEVOUmpabDRm?=
 =?utf-8?B?eTJtSWlmZU9CaWV0MkYrN1RvQmlYeDNIWWlRVEYzRHpRcjNKQmtScC9PN0hH?=
 =?utf-8?B?dUU4UFZaSHJKRnlTNGFRTFp3L0VPcU5WUTcxb1h6ZnNTaTNjaXo5N2hHaE1O?=
 =?utf-8?B?Z0htRmVPN0hGWkthUGJ2RUt6ZldDY2RESmZKWFdvY0prU21HRmFkTWNPOGtH?=
 =?utf-8?B?NlhoTEhPREdXVjVwQzVNdEhWSnRza0t0Wm1PamhOOWQ3MmRuU3JsWHJKVHdD?=
 =?utf-8?B?RkJBT2g0N3RGbUg2VDNXcEhxWDN2dFU0TW9aV2ZCVlk1aDRyOVBIUlM4VkQy?=
 =?utf-8?B?ODFrSjdLV1JReXM0ZHpDN2JNVXhNRDJPWUx4SWRtWU1ZeEs3Smo2TFlSdzlu?=
 =?utf-8?B?Z2YzWGlvY2xyc1BxandicGVQcHFXQnNhM1oyVFdPUkhUOFgvcVhSQ0VWbkg4?=
 =?utf-8?B?NlY4Y1l5YzBlL2hwUFcwY2VaQ1JSVE8zbUpYSlBUTHdEeTVwWWVtRXlCNk9s?=
 =?utf-8?B?NzJtcE1jTHV3VHVOVytjL1FDclpPaWlMRDF6YktLd25mTWpIMHdHSmhSYmRn?=
 =?utf-8?Q?eiqNJk0SdaLmjOsB1MaTwa4/6?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5041.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06526f64-88dc-4432-9105-08ddaa21670f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2025 02:24:19.6076
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qNSLbq5cEHiuKkhu7Muj01IPpilJ0EPfhwowORPUtmAd1Uqa/O1ents13yHSDoVeMwjh5eU3Hk2Vxzx3N5QMHUADwlMD6NGwTK3XlzTrycw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6498
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 02:24:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218549

SGkgQWRyaWFuLA0KDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIHYxIDEvMl0gdWJv
b3Qtc2lnbjogQXZvaWQgc3ltbGluayBhbmQgaW5zdGFsbA0KPiBlcnJvcnMgd2hlbiBTUEwgRFRC
IGlzIG1pc3NpbmcNCj4gDQo+IE9uIEZyaSwgMjAyNS0wNi0wNiBhdCAxNToxOSArMDgwMCwgSmFt
aW4gTGluIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IHdyb3RlOg0KPiA+IEZpeCBwb3Rl
bnRpYWwgZXJyb3JzIGR1cmluZyBkb19kZXBsb3kgYW5kIGRlcGxveV9zcGxfZHRiIHdoZW4NCj4g
PiBTUExfRFRCX0JJTkFSWSBvciBTUExfQklOQVJZIGlzIG5vdCBwcmVzZW50Lg0KPiA+DQo+ID4g
V3JhcHBlZCBpbnN0YWxsIGNvbW1hbmQgaW4gZGVwbG95X3NwbF9kdGIoKSB3aXRoIGEgZmlsZSBl
eGlzdGVuY2UNCj4gPiBjaGVjay4NCj4gPiBJbXByb3ZlZCBjb25kaXRpb24gaW4gZG9fZGVwbG95
IHRvIGNoZWNrIGZvciBhY3R1YWwgZXhpc3RlbmNlIG9mDQo+ID4gJHtTUExfRElSfS8ke1NQTF9E
VEJfQklOQVJZfSBpbnN0ZWFkIG9mIG9ubHkgcmVseWluZyBvbiB2YXJpYWJsZSBub24tDQo+ID4g
ZW1wdGluZXNzLg0KPiA+IFByZXZlbnRzICJpbnN0YWxsOiBtaXNzaW5nIGRlc3RpbmF0aW9uIGZp
bGUgb3BlcmFuZCIgYW5kIGludmFsaWQNCj4gPiBzeW1saW5rIGNyZWF0aW9uLg0KPiANCj4gVGhl
IGNvbW1pdCBtZXNzYWdlIGRlc2NyaWJlcyB0aGUgY29kZSBjaGFuZ2VzLCBidXQgbGFja3MgdGhl
IGNydWNpYWwgY29udGV4dA0KPiBvZiB3aHkgdGhlc2UgY2hhbmdlcyBhcmUgbmVjZXNzYXJ5LiBD
b3VsZCB5b3UgcGxlYXNlIGFkZCBzb21lIGJhY2tncm91bmQNCj4gaW5mb3JtYXRpb24gZXhwbGFp
bmluZyB0aGUgbW90aXZhdGlvbiBvciBwcm9ibGVtIHRoaXMgY2hhbmdlIGlzIHNvbHZpbmc/DQo+
IFdoYXQncyB0aGUgdXNlIGNhc2Ugd2hlcmUgdGhlIGNvZGUgc2hvdWxkIHByb2NlZWQgd2l0aG91
dCBmaW5kaW5nIHRoZQ0KPiAke1NQTF9CSU5BUll9IGZpbGU/DQo+IFRoaXMgd291bGQgaGVscCBm
dXR1cmUgbWFpbnRhaW5lcnMgYmV0dGVyIHVuZGVyc3RhbmQgdGhlIHJhdGlvbmFsZSBiZWhpbmQg
dGhpcw0KPiBtb2RpZmljYXRpb24uDQo+IA0KVGhhbmtzIGZvciBzdWdnZXN0aW9uLiBIb3cgYWJv
dXQgdGhlIGZvbGxvd2luZyBjb21taXQgbWVzc2FnZXM/DQoNCkNvbW1pdCBNZXNzYWdlOg0KDQpG
aXggcG90ZW50aWFsIGVycm9ycyBkdXJpbmcgZG9fZGVwbG95IGFuZCBkZXBsb3lfc3BsX2R0YiB3
aGVuIFNQTF9EVEJfQklOQVJZIG9yIFNQTF9CSU5BUlkgaXMgbm90IHByZXNlbnQuDQoNCldyYXBw
ZWQgdGhlIGluc3RhbGwgY29tbWFuZCBpbiBkZXBsb3lfc3BsX2R0YigpIHdpdGggYSBmaWxlIGV4
aXN0ZW5jZSBjaGVjay4NCkltcHJvdmVkIHRoZSBjb25kaXRpb24gaW4gZG9fZGVwbG95IHRvIGNo
ZWNrIGZvciBhY3R1YWwgZXhpc3RlbmNlIG9mICR7U1BMX0RJUn0vJHtTUExfRFRCX0JJTkFSWX0g
aW5zdGVhZCBvZiBvbmx5IHJlbHlpbmcgb24gdmFyaWFibGUgbm9uLWVtcHRpbmVzcy4NClRoaXMg
cHJldmVudHMgaXNzdWVzIHN1Y2ggYXMgImluc3RhbGw6IG1pc3NpbmcgZGVzdGluYXRpb24gZmls
ZSBvcGVyYW5kIiBhbmQgY3JlYXRpb24gb2YgaW52YWxpZCBzeW1ib2xpYyBsaW5rcy4NCg0KTW90
aXZhdGlvbiBhbmQgVXNlIENhc2UNCkluIGNlcnRhaW4gc2NlbmFyaW9zLCB1c2VycyBtYXkgd2Fu
dCB0byBzaWduIG9ubHkgdGhlIFUtQm9vdCBGSVQgaW1hZ2UsIHdpdGhvdXQgdXNpbmcgU1BMLg0K
SW4gc3VjaCBjYXNlcywgU1BMX1NJR05fRU5BQkxFIHNob3VsZCBiZSBzZXQgdG8gMSB0byBlbmFi
bGUgZ2VuZXJhdGlvbiBvZiBhIEZJVCBJVFMgZmlsZSB3aXRoIHNpZ25hdHVyZSBub2Rlcy4NCkhv
d2V2ZXIsIHdoZW4gb25seSBVLUJvb3QgaXMgYnVpbHQgKG5vIFNQTCksIHRoZSBmb2xsb3dpbmcg
cHJvYmxlbXMgY2FuIG9jY3VyOg0KMS4gU1BMX0JJTkFSWSBpcyBuZXZlciBzZXQuDQpUaGUgZm9s
bG93aW5nIGxpbmUgZmFpbHMgYmVjYXVzZSAke1NQTF9CSU5BUll9IGlzIGVtcHR5DQpgYGANCmlu
c3RhbGwgLURtNjQ0ICR7U1BMX0JJTkFSWX0gJHtERVBMT1lESVJ9LyR7U1BMX0lNQUdFfQ0KYGBg
DQpUaGlzIHJlc3VsdHMgaW4gYSBidWlsZCBlcnJvci4NCg0KMi4gVGhpcyBjb25kaXRpb246IHdp
bGwgZXZhbHVhdGUgdG8gdHJ1ZSwgYmVjYXVzZSB0aGUgZGVmYXVsdCB2YWx1ZSBvZiBTUExfRFRC
X0JJTkFSWSBpcyB1LWJvb3Qtc3BsLmR0Yi4NCkJ1dCBpbiBhIFUtQm9vdC1vbmx5IGJ1aWxkLCB0
aGlzIGZpbGUgZG9lcyBub3QgZXhpc3QsIHdoaWNoIGxlYWRzIHRvIGNyZWF0aW9uIGludmFsaWQg
c3ltbGlua3MuDQpgYGANCmlmIFsgIiR7U1BMX1NJR05fRU5BQkxFfSIgPSAiMSIgLWEgLW4gIiR7
U1BMX0RUQl9CSU5BUll9IiBdDQpgYGANCg0KRml4IFN1bW1hcnkNClRoZSB1cGRhdGVkIGxvZ2lj
IG5vdzoNClNraXBzIHRoZSBpbnN0YWxsIHN0ZXAgdW5sZXNzICR7U1BMX0JJTkFSWX0gZXhpc3Rz
Lg0KQXZvaWRzIGNyZWF0aW5nIHN5bWxpbmtzIHVubGVzcyAke1NQTF9EVEJfQklOQVJZfSBhY3R1
YWxseSBleGlzdHMgb24gZGlzay4NClRoaXMgZW5zdXJlcyB0aGF0IFUtQm9vdC1vbmx5IGJ1aWxk
cyB3aXRoIHNpZ25hdHVyZSBzdXBwb3J0IGRvIG5vdCBmYWlsIGR1ZSB0byBtaXNzaW5nIFNQTCBh
cnRpZmFjdHMuDQoNClRoYW5rcy1KYW1pbg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogSmFtaW4g
TGluIDxqYW1pbl9saW5AYXNwZWVkdGVjaC5jb20+DQo+ID4gLS0tDQo+ID4gwqBtZXRhL2NsYXNz
ZXMtcmVjaXBlL3Vib290LXNpZ24uYmJjbGFzcyB8IDYgKysrKy0tDQo+ID4gwqAxIGZpbGUgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdp
dCBhL21ldGEvY2xhc3Nlcy1yZWNpcGUvdWJvb3Qtc2lnbi5iYmNsYXNzIGIvbWV0YS9jbGFzc2Vz
LQ0KPiA+IHJlY2lwZS91Ym9vdC1zaWduLmJiY2xhc3MgaW5kZXggNzNlOWNlM2YxMS4uNmVlMTg3
NGNkNiAxMDA2NDQNCj4gPiAtLS0gYS9tZXRhL2NsYXNzZXMtcmVjaXBlL3Vib290LXNpZ24uYmJj
bGFzcw0KPiA+ICsrKyBiL21ldGEvY2xhc3Nlcy1yZWNpcGUvdWJvb3Qtc2lnbi5iYmNsYXNzDQo+
ID4gQEAgLTI3NSw3ICsyNzUsOSBAQCBkZXBsb3lfc3BsX2R0YigpIHsNCj4gPiDCoAlmaQ0KPiA+
DQo+ID4gwqAJIyBGb3IgYmFja3dhcmRzIGNvbXBhdGliaWxpdHkuLi4NCj4gPiAtCWluc3RhbGwg
LURtNjQ0ICR7U1BMX0JJTkFSWX0gJHtERVBMT1lESVJ9LyR7U1BMX0lNQUdFfQ0KPiA+ICsJaWYg
WyAtZSAiJHtTUExfQklOQVJZfSIgXTsgdGhlbg0KPiBJZiBwb3NzaWJsZSwgdGhlc2Uga2luZHMg
b2YgY2hlY2tzIHNob3VsZCByZWx5IHNvbGVseSBvbiBCaXRCYWtlIHZhcmlhYmxlcy4NCj4gQ2hl
Y2tpbmcgZm9yIGZpbGVzIGluIHRoZSBmaWxlc3lzdGVtIGlzIHZlcnkgZnJhZ2lsZS4gVGhlcmUg
YXJlIG1hbnkgc2NlbmFyaW9zDQo+IHdoZXJlIGEgZmlsZSBtaWdodCBub3QgYmUgaW4gaXRzIGV4
cGVjdGVkIGxvY2F0aW9uIGR1ZSB0byBhIGJ1Zy4gV2hlbiB0aGlzDQo+IGhhcHBlbnMsIGRlYnVn
Z2luZyBiZWNvbWVzIG11Y2ggaGFyZGVyIGlmIHRoZSBjb2RlIHNpbGVudGx5IGNvbnRpbnVlcw0K
PiBydW5uaW5nIGluc3RlYWQgb2YgZmFpbGluZyB3aXRoIGEgY2xlYXIgZXJyb3IgbWVzc2FnZSBh
Ym91dCB0aGUgbWlzc2luZyBmaWxlLg0KPiBXaGlsZSBmaWxlLWJhc2VkIGNoZWNrcyBtaWdodCBh
bGxvdyBjb2RlIHRvIGNvbnRpbnVlIHJ1bm5pbmcgd2l0aCB3cm9uZw0KPiBhc3N1bXB0aW9ucywg
dmFyaWFibGUtYmFzZWQgY2hlY2tzIHdpbGwgZmFpbCBpbW1lZGlhdGVseSB3aXRoIGNsZWFyIGVy
cm9yDQo+IGNvbmRpdGlvbnMsIG1ha2luZyBkZWJ1Z2dpbmcgbW9yZSBzdHJhaWdodGZvcndhcmQg
YW5kIGlzc3VlcyBtb3JlIGFwcGFyZW50Lg0KPiBJIGtub3cgdGhlcmUgYXJlIHNpbWlsYXIgZXhh
bXBsZXMgaW4gdGhlIGV4aXN0aW5nIGNvZGUuDQo+IA0KPiA+ICsJCWluc3RhbGwgLURtNjQ0ICR7
U1BMX0JJTkFSWX0NCj4gPiAke0RFUExPWURJUn0vJHtTUExfSU1BR0V9DQo+ID4gKwlmaQ0KPiA+
IMKgfQ0KPiA+DQo+ID4gwqBkb191Ym9vdF9nZW5lcmF0ZV9yc2Ffa2V5cygpIHsNCj4gPiBAQCAt
NjAwLDcgKzYwMiw3IEBAIGRvX2RlcGxveTpwcmVwZW5kKCkgew0KPiA+IMKgCQlsbiAtc2YgJHtV
Qk9PVF9GSVRJTUFHRV9JTUFHRX0NCj4gPiAke0RFUExPWURJUn0vJHtVQk9PVF9GSVRJTUFHRV9T
WU1MSU5LfQ0KPiA+IMKgCWZpDQo+ID4NCj4gPiAtCWlmIFsgIiR7U1BMX1NJR05fRU5BQkxFfSIg
PSAiMSIgLWEgLW4gIiR7U1BMX0RUQl9CSU5BUll9IiBdDQo+ID4gOyB0aGVuDQo+ID4gKwlpZiBb
ICIke1NQTF9TSUdOX0VOQUJMRX0iID0gIjEiIC1hIC1lDQo+ID4gIiR7U1BMX0RJUn0vJHtTUExf
RFRCX0JJTkFSWX0iIF0gOyB0aGVuDQo+IFNhbWUgYXMgYWJvdmUuDQo+IA0KPiBBZHJpYW4NCj4g
DQo+ID4gwqAJCWxuIC1zZiAke1NQTF9EVEJfSU1BR0V9DQo+ID4gJHtERVBMT1lESVJ9LyR7U1BM
X0RUQl9TWU1MSU5LfQ0KPiA+IMKgCQlsbiAtc2YgJHtTUExfRFRCX0lNQUdFfQ0KPiA+ICR7REVQ
TE9ZRElSfS8ke1NQTF9EVEJfQklOQVJZfQ0KPiA+IMKgCQlsbiAtc2YgJHtTUExfTk9EVEJfSU1B
R0V9DQo+ID4gJHtERVBMT1lESVJ9LyR7U1BMX05PRFRCX1NZTUxJTkt9DQo+ID4NCj4gPiAtPS09
LT0tPS09LT0tPS09LT0tPS09LQ0KPiA+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMg
c2VudCB0byB0aGlzIGdyb3VwLg0KPiA+IFZpZXcvUmVwbHkgT25saW5lICgjMjE4MTEzKToNCj4g
PiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNz
YWdlLzIxODExMw0KPiA+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRk
ZWQub3JnL210LzExMzQ5OTU4NC8zNjE2ODU4DQo+ID4gR3JvdXAgT3duZXI6IG9wZW5lbWJlZGRl
ZC1jb3JlK293bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiBVbnN1YnNjcmliZToNCj4g
PiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1
YsKgWw0KPiA+IGFkcmlhbi5mcmVpaG9mZXJAc2llbWVucy5jb21dDQo+ID4gLT0tPS09LT0tPS09
LT0tPS09LT0tPS0NCj4gPg0KDQo=

