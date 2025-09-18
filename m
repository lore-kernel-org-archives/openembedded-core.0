Return-Path: <barne.carstensen@danfoss.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FC6CCAC597
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 08:05:20 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.15])
 by mx.groups.io with SMTP id smtpd.web11.8734.1758182716187293180
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 01:05:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@danfoss.com header.s=selector1 header.b=Vmu0jGz7;
 spf=pass (domain: danfoss.com, ip: 52.101.84.15, mailfrom: barne.carstensen@danfoss.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RpG741di4MmJlcO5ItWtlV3SbwLfTDBt0yJtkLQ0TBeAZB6LtoauoIfmZ6+pBbTYBLJTe51FTkATINZ4XmILgsuCDsMQvuynNS1M/XpKzpmXItqnGVXN0u1Mo4aLbU3P1A8KBzaUYCtQKPKqi4dPy9itlrxY0kxLKTJyE4BzIM5QHJdPAfRqylPA2rasZzF2sZEYgQWAemsMrHxUHBHM/ad/mJNZ4f33S5PuLxOK+dBQy40dNs7reso0Ca8Sm+wHvB24Og8iwejTGaEGiF+ss3aexMF4/eP9TU3apFoYy21yXKwBAPAQZVRFLRRzZw3a0c8K7CXQe/Mcu+i0IWXpOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IC7KXNvxgWNnz8WmmphpPLq2CSajKkqwO+Hr8LiRsIg=;
 b=Jwv5qwj47iGaU+VvRm7cSIAlxL57KCQqXs8p8OhjcPbgctlkncp4YC1+9mPNwGmpKXEn/ulQl7hwWDR4LISdqsxreF4MainTv2e/0HYkYbdGbeV8d93g3ucrdewIqCI6JKcIndAeuWVbFW+cYwzlpK2D23XjirQjVXAa3SJse8QLFC1JdEVd/LxTF2brFwuW5GgIHUYK5vzb1eJZDzlEEi1ZjJFZzZQGLk1nN0hZy8InfRkb78RGw4P/m2KmiFM9ASKKdP1DQva/ySQl2NaR3PXymzLdr5b4ycwNJgzaQ+adkM2Ir0EqD6c8d/5ldYpNR/jrIlV2kDdqA42j89RoOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=danfoss.com; dmarc=pass action=none header.from=danfoss.com;
 dkim=pass header.d=danfoss.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=danfoss.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IC7KXNvxgWNnz8WmmphpPLq2CSajKkqwO+Hr8LiRsIg=;
 b=Vmu0jGz7OuCbI40MDu99UdoslnsSoSaRI2dvrv/P/NIBx8f9s21xS0j1KHI5crSV6ih5cbdyuiRC7rhnNbYt4DvuEI4/UMf7bzcMtka+Hronkmo0p5kyqBj2HDO6xXep1yQb/Z4m8jdO0vTMIRj8a9fM4D9tBYaTwquLzVMVCBdX53WN+MptwM8FnbSTCWBySjMnmxDyYuJH6NT3FRcWKp/mYkfD+i3s7yi+akKsHDOCuDWItHVr2v7euFuSy2zCsJf3yweOrcuLwPKjTbALS0eo6CexGgeOam6Y/B0iiPIxdcmMTlHqZg2ykaSb27j8/DeRSc0i3XkNnl6cNrD78Q==
Received: from DB9PR01MB7210.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:216::23) by PA1PR01MB10911.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:48c::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 08:05:12 +0000
Received: from DB9PR01MB7210.eurprd01.prod.exchangelabs.com
 ([fe80::67bf:897b:9f85:b32a]) by DB9PR01MB7210.eurprd01.prod.exchangelabs.com
 ([fe80::67bf:897b:9f85:b32a%5]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 08:05:12 +0000
From: Barne Carstensen <barne.carstensen@danfoss.com>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "randy.macleod@windriver.com"
	<randy.macleod@windriver.com>
Subject: RE: [OE-core] [PATCH] Fixes [YOCTO #15965]
Thread-Topic: [OE-core] [PATCH] Fixes [YOCTO #15965]
Thread-Index: AQHcJwT8jD4Qjy9jkEW2hSvUcVczgLSXIfUAgAF0R0A=
Date: Thu, 18 Sep 2025 08:05:12 +0000
Message-ID: 
 <DB9PR01MB72106CB784315DF9D5EEE5D08716A@DB9PR01MB7210.eurprd01.prod.exchangelabs.com>
References: <20250916122517.1965-1-barne.carstensen@danfoss.com>
 <aMqDjoK4oj_m0-04@nuoska>
In-Reply-To: <aMqDjoK4oj_m0-04@nuoska>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_8d6a82de-332f-43b8-a8a7-1928fd67507f_Enabled=True;MSIP_Label_8d6a82de-332f-43b8-a8a7-1928fd67507f_SiteId=097464b8-069c-453e-9254-c17ec707310d;MSIP_Label_8d6a82de-332f-43b8-a8a7-1928fd67507f_SetDate=2025-09-18T07:59:19.0000000Z;MSIP_Label_8d6a82de-332f-43b8-a8a7-1928fd67507f_Name=1.
 Business;MSIP_Label_8d6a82de-332f-43b8-a8a7-1928fd67507f_ContentBits=3;MSIP_Label_8d6a82de-332f-43b8-a8a7-1928fd67507f_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=danfoss.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR01MB7210:EE_|PA1PR01MB10911:EE_
x-ms-office365-filtering-correlation-id: 8f875219-ee1c-40cd-70d1-08ddf68a1803
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|7053199007|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-7?B?bE1PUUI3NDNhUlhQVUVIVDdzUTFpVExxZ0tQZk9IRy9mWjZsSnE1OE53cnB4?=
 =?utf-7?B?ZmtFMG9sVWhwREFtVGs3OHgvUUh6VGlDN3VTT3ZubEhRSlV5NWhHcmdpaHM3?=
 =?utf-7?B?eFo3NVB4OXFLcystRUxZWXZkYVZZekh4VldWV1l1ZllwZTNEYnhuVXBMc1pH?=
 =?utf-7?B?dFphTGNKMzl5VW5MTmZrQi9Ua0gwWXc3RFV0OHIzKy04TmNSRkJoR2FpR3BX?=
 =?utf-7?B?VTZCQ1hwOUtuVW90eXlIblJPUWZnUFNSYmVIS0pYWVlrQnVJMHQ4U1ZqOTZw?=
 =?utf-7?B?RHpOaXVFMW1PM3ErLW0wRHgySVVSamtHZCstTG1hL21XQW1FWTlzZHRwZFE3?=
 =?utf-7?B?dm03SWVNeXBJMTZQTnhia2FCcnppWDJDKy1pSldnc093OXhxcThlUDhVanF1?=
 =?utf-7?B?OGFHc3BuaW5IdmxuOTBHSHorLUdhVzhjc3l5aUhOb3dGdGZDQm9OTWhlcldy?=
 =?utf-7?B?MC9zTGFsd1NDQmsvT1NDRlBNcEt0amdDMmFwTEJMVURDcFhVVHBldzZmM1Qy?=
 =?utf-7?B?RGdvcmpnNkFpTlhRWFh0bWtJU3V0ZVpIbFArLXREUHlWVGlwTXVYY2ZJZ1BT?=
 =?utf-7?B?dVc2U1B6eTByVGk0ZlhhV3AyallpTWJsWGRhYm5kOFBXM3FvTGJTcjVSSjN4?=
 =?utf-7?B?a0pyKy05cndXUmNQNFU5NjhpZ0lWSFI3ODlNOUtRRGdDeHNSeVpnYW1XR3l5?=
 =?utf-7?B?UkRFaVFPNUkxT2drYWFLWmRXY1krLTVIV0xXTFRhUDV5SXpYUGZraUpTMmZG?=
 =?utf-7?B?UjhHY2ptU2dOemFBRmtWUystTDZ1V1p5UnpOTi9ydVAxZ2M3TGMyWHNyWjZm?=
 =?utf-7?B?VEovMmtwZistdHhOcVM3OEk2TUZGZlJsUVF3VWpiQTBpcjR0N3M4emY4WFo1?=
 =?utf-7?B?MEk2OVlWM1I0YUVheFF1UzdXWlZudzdzbkJ2TUpHeVE4MmF6a2NpVk1jRnBK?=
 =?utf-7?B?cjcvNXBUcjVaZmNvb29TRFJ3d3g3T0JLaUtpTXpybCstRDhDZjZkMjNSMFlm?=
 =?utf-7?B?a2RpSk54MW4yc1RGbmJBWVV4OFpuSVZ0WlRXSXlGTjZWcU00bUlBVGt2amo2?=
 =?utf-7?B?M1pWaUhGMWNOTWxMbDVpSmJDT2J1WFBGRXdlYVhLQ1RqbjJJdXlHUlprU1BL?=
 =?utf-7?B?dDIwd05ncFlobUU4QVliU1czbjMxWnRXYk5TbGtEMXRuNnp3dVdMTUNMb3lM?=
 =?utf-7?B?cXRhajloTE1valRqV1kvbzUxOTVmS2wybmZrVVBiaHdhaWtqSEpWYzM1eHZy?=
 =?utf-7?B?aFFXeHd1dGdYVHUrLVlySy9VdVZqRzZvTXRYTlRlVWZodDVZbmxaRkgzL1Ey?=
 =?utf-7?B?aHp2T3NVTVA3blAydk9FYURIUUNLVUVZYnI4YmFRVisteS9IYzBwLystRXNC?=
 =?utf-7?B?d3YwNktHWU9seDczdXl5MEJqL0lMTGptZm14ZGkrLVBaZHpZUWtEZWpxbDJX?=
 =?utf-7?B?NmtDZWJSSlhybngxOWh0ME1wSVRSaUVqSDB0OWdXUjZZKy1yci8zYjBlZmJ6?=
 =?utf-7?B?T3hxU3IvcjJObSstamk1cTB2WSstWWpEaE5XZVIvUzBlOWwzakNVcHdaUi9L?=
 =?utf-7?B?ay9kdGxRVDVNU2FyUjl1VnJhUzNDU0pqRmNrdE5qKy02RlV3OU42QkhiZjdP?=
 =?utf-7?B?cUF0eDZzaDJ2Z251VG1ZR0F0RDd6ZkJyb2dhbVRhKy1hQlBBNUc0U0RpWDJu?=
 =?utf-7?B?aURKVUlCRk9qNmQ5N2xXNHo5d0NaWTg5WllVTzZxeTJpdlhrN1FRekxiRzRt?=
 =?utf-7?B?L2hvQnV6UWRXTWNtbEVYR1VCejl5Sm5Kd0ZjKy1XUkQ0TklQdystQU0xM3A2?=
 =?utf-7?B?a0RTZzZPNzNTQnRXci9jaXduMjBONDRmT0l0VDZRb2tHZEVXblh4c2F0L1ZQ?=
 =?utf-7?B?TnRqcVFDOXdscGtnenpmd0R1eHJidVlkMGI5Q2tqeExpTkE3U3RqTVhTYmZX?=
 =?utf-7?B?N3ZabkVQVVRYeUdlZDU1bmpwalpEYnBvdVdwRjk5cmxlaWsxa0xIKy1vQUhH?=
 =?utf-7?B?ejhQd3VMM29YWnEyekJvdVUwTmhqQWZXaXhVZGlsN3hnK0FEMEFQUS0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR01MB7210.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-7?B?azVCVHVPeHUvZUpMcXRxYlBnaUZERzU4aEI0OU95Y2oxbThycnIrLXRPUld2?=
 =?utf-7?B?MystcmRuZHdNQUUzUmFWQWZwdEZaaUFrc1NqWnZ0YzRTaERiQmZRTmhSTVkv?=
 =?utf-7?B?Zy9WYlFWelJQS2kyNjhJZnBvUUVLc0tuV0h1SktyeDdTNkJ3RXlwRVdVc0hq?=
 =?utf-7?B?VkxWYjA4YWd6ZCstTDkrLXBRUy9zNjVDVUF3ZHZPaCstTTc3MmtQampwTDU=?=
 =?utf-7?B?TGMrLTQrLUVvRDVtci9BTmRqRHErLXZwSHdLZEdvYkJZbDljd292Z01VYnlu?=
 =?utf-7?B?V2g3b213TlcwakhQZU9WT04xSHNKalJpMVYyTkM1VXI3QXZiNUlSME1ScFE1?=
 =?utf-7?B?ZUtFa0NhVFJWbEZoNzhhMWxnRVFwVTBjTnpsMVV2YWh1Zml4SDBPeFV4bkpi?=
 =?utf-7?B?QlZFT3FtZm9ZM2hLZzVUZDl1MVRhQ3A2S2xMdWtLMVZ3eHM1bEtMZDZFVEY1?=
 =?utf-7?B?OHp3cU9Ga3V1WFhKVXZhMm1uQ0t0Rm9qL1IvU2xYdVRnYWdNVEdtR0NETmw1?=
 =?utf-7?B?c1JSZ2M4YnlhNHlqZVBxR2hNQmQzMXpUWHFjNm1adUJpb1dmaE9ObjZScnlK?=
 =?utf-7?B?SEd1dFBKWm80QWFVa1BjKy16NTJLTktEY3hKWDl4em5hdTFNbEpnUC90R2E1?=
 =?utf-7?B?dHI2bkxxNGNOWnhWU3gxZEV2QnVoeTMySU1EQzJKeFY3UUZrZVpHWFZqZ3Ni?=
 =?utf-7?B?V24yS0VicystQk51R0ZUd0tHaE9yOVlnVHBCZW9qaEpINmk5TlpDR2hDdWpX?=
 =?utf-7?B?bXBGU1NaMk5JbUZuYlNWdUQzYmd3YlNLT0xHQWcybmJKUzVOWGs1a05JQzVw?=
 =?utf-7?B?T2ZmQmxtbXIzTWNqNVRLbHJKVkc1QlFGTXBvZ0VHajZrQm9TblJ0NWprNjVK?=
 =?utf-7?B?bGR6SWpuMlo4c1hITVN0bzJsdGhuNXBRUWgrLVF2d3B1NGh1Q0NsNFhTbHM2?=
 =?utf-7?B?VENDTG9DRUk5V3JDOUIrLWhZbGlSSkNReGhlWkZzaXBGTFM4dTgvWTdDOTk2?=
 =?utf-7?B?dHhUUXVFdjBtSFQrLWlJZXk3ZEhlUkJySGlZYTJtd0xodWZiQWhHRWpzKy01?=
 =?utf-7?B?VEVNVVBvaVRpWDZiOU9uUU1YM2xhbGpGeHVqVGVaeVpzUmVhR1RCYWFEbzM2?=
 =?utf-7?B?NCstdTNFKy1WRCstQkdRb0hJalJMSmdpWmlwSU42VzlTT05HM0hSWWJwZXB0?=
 =?utf-7?B?dEJxRDV2ekxJbzNRQTZROUFDNzdISWVGQnZFVFgwMDRnYmdETllsTGhuOUlB?=
 =?utf-7?B?Z3VWeDdzallidWFwMG5yVWE3eXpheVM1bFpJdDBGZXN2Ky1NOVFycHlIUjM4?=
 =?utf-7?B?dHFuMzdhbkpKSDViNCstdWpYUU9NS043aXVtSzVOT25LTE1wNWhrdWtLZkpN?=
 =?utf-7?B?Z2NBMXVkNnZEVnlRRmsrLVJTMWNIcFJqZnV5ZzVOYk1VVFZYVWorLUhqSHds?=
 =?utf-7?B?QWVLaHExcHh5TzJBMWswZlBSNDIyck5SWUpxekNTOU8zVlVndlUyRnJUQUFW?=
 =?utf-7?B?U2RzbTN0VkhWU0EvNHBPZGhUZjNGRFVXbGl0WWRDaEtPenFISWdlQTUyY3NT?=
 =?utf-7?B?a0FVNmVVSHp1Y3BXUGJzd0FCYWdGSmdVNlhHUThacTBzWkJFVkJJSEFUcTlQ?=
 =?utf-7?B?Z0J4WDcyOU4yTjRxVFE2anFiZlZtaTRkbXZTa3VOZWM5SGJMWlpPR00vdVVk?=
 =?utf-7?B?clB6RUJVclBhdHQxQnlnQ3ZDL1lmVnIrLWYxWHVVcHRIL1dUcGx6QzV5RkZq?=
 =?utf-7?B?N1dISXhPY3k0L05DNldmZ01pL2NmT2ZscEpPQVhTZXhTRnZobVl5ZFJvcHgy?=
 =?utf-7?B?SistTllFTFZ0ajhJMG1aSi9wYmpXV1NYNGlNS2FtYnhLTVZReVdGaFFIbmQ=?=
 =?utf-7?B?dCstdVlDRXVuOXVsNzU5ZEFaYzErLXp4RlBmZlA3dHdySjFSVy9YaDVuUkp3?=
 =?utf-7?B?MEFMUzZya2o0UDdlaDVxZkY2bnkzNE5qT1dRbjhjSFZuaWZKU1BQSFh1d3Nw?=
 =?utf-7?B?TXhvUTlFM2dzSFhXSHdTZ2NhOHhLbWVoTHJpYWRGb2dJd2QwVHNtbUo3Nnpi?=
 =?utf-7?B?RkNJamp2Q2dBWUtDOCstcWMxQ21QdHNGVTV1RFVzR1RVUkJYZGZ1bXdLZ0x0?=
 =?utf-7?B?SzQ5Ky1ERC80VVJoOUozUTdtcm01cllSVktQRVF1UlVvN3FteHdYbmV2bDU=?=
 =?utf-7?B?Ky1jTFVrOWVUSkVNMjZsOGNNOU40ajZKakx5Ky1NcTE4QStBRDBBUFEt?=
Content-Type: text/plain; charset="utf-7"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: danfoss.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR01MB7210.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f875219-ee1c-40cd-70d1-08ddf68a1803
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2025 08:05:12.5121
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 097464b8-069c-453e-9254-c17ec707310d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KYdQUZIesas/Uu6jctsKi1ix/qZxg1G5TPmAlZZwD94/+1U4bsw+JbGJHLCzd2yQYFQ5BBAH2oSk0Sua3MOPp579mWuhvNT8KdZZrYbZSkI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR01MB10911
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 08:05:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223628

Hello,
Took me a while but I was able to build master now and yes, the parselogs+A=
F8-ignores+AF8AKg-.txt files are in the testexport.tar.gz Sorry for not che=
cking that before, I only looked into the reported bugs. Lesson learned. I =
guess the patch can then be rejected +2D3eCg-
Thanks and sorry again to waist your time with that,

Barne


Classified as Business
-----Original Message-----
From: Mikko Rapeli +ADw-mikko.rapeli+AEA-linaro.org+AD4-
Sent: Mittwoch, 17. September 2025 11:47
To: Barne Carstensen +ADw-barne.carstensen+AEA-danfoss.com+AD4-
Cc: openembedded-core+AEA-lists.openembedded.org+ADs- randy.macleod+AEA-win=
driver.com
Subject: Re: +AFs-OE-core+AF0- +AFs-PATCH+AF0- Fixes +AFs-YOCTO +ACM-15965+=
AF0-

+AFs-You don't often get email from mikko.rapeli+AEA-linaro.org. Learn why =
this is important at https://aka.ms/LearnAboutSenderIdentification +AF0-

Hi,

On Tue, Sep 16, 2025 at 12:25:22PM +-0000, Barne Carstensen via lists.opene=
mbedded.org wrote:
+AD4- Copy all the parselogs-ignores file so that they are always packed
+AD4- into the testexport.tar.gz (even when testsuite parselog is not
+AD4- selected)

This hints to the old behavior of testexport which was taking into account =
TEST+AF8-SUITES variable. This is no longer the case in poky master branch.
All tests and related files like parselogs ignore lists are copied as is to=
 testexport tar ball, and from all enabled layers.

+AD4- Signed-off-by: Barne Carstensen +ADw-barne.carstensen+AEA-danfoss.com=
+AD4-
+AD4- CC: randy.macleod+AEA-windriver.com
+AD4- ---
+AD4-  meta/classes-recipe/testexport.bbclass +AHw- 6 +-+-+-+-+-+-
+AD4-  1 file changed, 6 insertions(+-)
+AD4-
+AD4- diff --git a/meta/classes-recipe/testexport.bbclass
+AD4- b/meta/classes-recipe/testexport.bbclass
+AD4- index 843d777e3b..2f473a8811 100644
+AD4- --- a/meta/classes-recipe/testexport.bbclass
+AD4- +-+-+- b/meta/classes-recipe/testexport.bbclass
+AD4- +AEAAQA- -79,6 +-79,7 +AEAAQA- def testexport+AF8-main(d):
+AD4-  def copy+AF8-needed+AF8-files(d, tc):
+AD4-      import shutil
+AD4-      import oe.path
+AD4- +-    import glob
+AD4-
+AD4-      from oeqa.utils.package+AF8-manager import +AF8-get+AF8-json+AF8=
-file
+AD4-      from oeqa.core.utils.test import getSuiteCasesFiles +AEAAQA- -12=
0,6
+AD4- +-121,11 +AEAAQA- def copy+AF8-needed+AF8-files(d, tc):
+AD4-                      oe.path.copytree(src, dst)
+AD4-                  else:
+AD4-                      shutil.copy2(src, dst)
+AD4- +-
+AD4- +-    +ACM- Copy all parselogs-ignores files
+AD4- +-    parselogs+AF8-ignores +AD0- glob.glob(os.path.join(corebase+AF8=
-path, 'meta', 'lib', 'oeqa', 'runtime', 'cases', 'parselogs-ignores-+ACo-.=
txt'))
+AD4- +-    for f in parselogs+AF8-ignores:
+AD4- +-         shutil.copy2(f, cases+AF8-path)

This does not seem right. The lines just above should copy the path +ACI-li=
b/oeqa/runtime+ACI- from all enabled layers with oe.path.copytree(). Thus i=
t should not be necessary to copy parselogs files separately using a glob.

Can you try again with master branch without your patch?

If the issue still is there and parselogs files are missing from testexport=
 tar ball, is the layer in question not enabled for building in BBLAYERS?

Cheers,

-Mikko

