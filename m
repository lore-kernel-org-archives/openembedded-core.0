Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97260EFB7F6
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 04:01:57 +0000 (UTC)
Received: from OS0P286CU011.outbound.protection.outlook.com (OS0P286CU011.outbound.protection.outlook.com [52.101.228.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13052.1771905712187154853
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 20:01:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=GeCrDUdi;
 spf=pass (domain: fujitsu.com, ip: 52.101.228.13, mailfrom: liuyd.fnst@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vu8XjhEUJRif6+A9p3uRY+9aTyr9GnW8bamsA2iuJHTWZZH6ydK3Bb6hoVTnXDVIJSdwB39vUAzBzp3eHc5ipqFwT2UWGFpAu8h7vG6hEzmQT2YAygwUudKHjJNhybn+E2JZPdSNnDE4ZKWRlQgxd9CeHohtMMVDqteveQkubGJWcFiUta62Waj+5K5KavnBzc6Z/bZQXKWdQkuorZ6KMQIECeBfaU/iHG9IbWCgOkyZBlsewQixH2dvMHjRyIdifypw/Wj7jLSTJVHaa/fDQWcoZ+hboizd3whgJmwHs0gl1FOUnv5e1mzd9Secs/ib9ZYRarVf3ZSyadyFwNTlnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ed0PwOxpmheK/m0aLHnbokf9athUUddeXQr/T5ju9kk=;
 b=mh6IWZCYcU/cJl4FHfObgkUWRzcCpr51ytXoD/H1bk7K+HK3pUFODK4d1pRskSgiDcvqwZOg8lhy7nkz/CnUrAziLuaamW7ZDFFZniVfyUX6yZuX2e/7woHV6bXg4JuFBr2uUNgnKiPHdX77MbXK2IiIESzJAuQstpt31kKjZcmWudOcYLpRMc5ozD/XYkHJcaZwsip3cmcXA3c+u8vwjrDP5DHwDcRzO89uDunahqq8FUNyWANpg3l2+wGpOKtovgo2RvPp2NzT+kKjMaNNwM4gGKH0OMAmZoPmRFubM0B6yVa5fbJW5pBw9m5hPVoxA/V/OycMrSaFuvhAlsqbJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ed0PwOxpmheK/m0aLHnbokf9athUUddeXQr/T5ju9kk=;
 b=GeCrDUdilpbfPamaw9g70c/k8k4rJehbS7CT30Q5/tsfNRmJYgEKrP/a1W4B/9YW7ZX+U46OY+jUlXbgEwDU94nvoUB4OA1FeliGdaPHKCRzTZC2nmmN430jHr7TWheogf8smZJOf5pwyUqnZlyBuyVOtGYo3PAKzKO/m+uZ6tsxGU9FtMAM/WlmPS8VRdHzrMwv0ccl/9jfW8y86bu89ueYtH683hT0DdvMv01r7trTgc1FvBdF1RB96IqnqIV8cISfk7n0WzNxo1wtLfjtHwAFJxCr7QdixNyR86fPaKfMkFjpiy2bqwDNAsL3tWF7pPvq+tdtXtZB8GwkAwhz9g==
Received: from TY3PR01MB10110.jpnprd01.prod.outlook.com (2603:1096:400:1d9::5)
 by TYRPR01MB14110.jpnprd01.prod.outlook.com (2603:1096:405:221::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 04:01:47 +0000
Received: from TY3PR01MB10110.jpnprd01.prod.outlook.com
 ([fe80::65d2:5fd:bb96:1df2]) by TY3PR01MB10110.jpnprd01.prod.outlook.com
 ([fe80::65d2:5fd:bb96:1df2%5]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 04:01:47 +0000
From: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: 
 =?gb2312?B?u9i4tDogW09FLWNvcmVdW1BBVENIIHYyXSBsaWJwYW06IHVwZ3JhZGUgMS43?=
 =?gb2312?Q?.1_->_1.7.2?=
Thread-Topic: [OE-core][PATCH v2] libpam: upgrade 1.7.1 -> 1.7.2
Thread-Index: AQHcmWdwJ6PHDMmyT0O2mVcJYvccTbWRUbpu
Date: Tue, 24 Feb 2026 04:01:47 +0000
Message-ID: 
 <TY3PR01MB10110545ACB9B18EB8F38FF679B74A@TY3PR01MB10110.jpnprd01.prod.outlook.com>
References: <1892715AD9360F1C.449619@lists.openembedded.org>
In-Reply-To: <1892715AD9360F1C.449619@lists.openembedded.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-02-24T04:01:46.807Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB10110:EE_|TYRPR01MB14110:EE_
x-ms-office365-filtering-correlation-id: 293eee54-98be-4465-56b2-08de73596e7c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|1580799027|38070700021|8096899003|13003099007|7053199007;
x-microsoft-antispam-message-info: 
 =?gb2312?B?b3N5cCthT09NQmc0Smd0WjRaMll0ejh6VTRONy9GMzVZRUJBL3RDcHVlV2o4?=
 =?gb2312?B?SGgvWjFCRndqTU9ENmhKc2NuVXhRaU4rMDJMNWlwakZLSXVDV2s5Snh5Nncr?=
 =?gb2312?B?VWt2ejREblU4SVBTVnhpbUxmWU9uODN5aUREVEZ4N0g1Ymo0bWhpSVNqVG9W?=
 =?gb2312?B?bW1ZL2NNSG96d0ptc01jOGcreHo0aU1MNU82YWVadDVndVBjSHgycDZ2L0pD?=
 =?gb2312?B?Qlg0NWFNTHZWQTd6M1dzTE5UVWh5ZFZCYmttWnBmWnFUNllaeUFybUVRaS9o?=
 =?gb2312?B?OURwZjNlUTZFL1lSeVBNVVVHVlNySTZWVjZDNDVMc1BVQThCa0ZrcnVMUk40?=
 =?gb2312?B?V3AwbG05QXZDYjRBS0RGcGEwZ25jVGR6TTY5Z091cDBUQ0hpM2EvVW5LSVBl?=
 =?gb2312?B?cHJyVFAvODlzY01oWHBEdWJyN0hZQVdTV0Zkc3lBMTQzSzVORmlDb1lBeFEr?=
 =?gb2312?B?QVR6elJOMk9LZEhSdWdRR3hpZXBqQ0NPSFdReUxPbzV5L1gvWUpvWUVGK1FB?=
 =?gb2312?B?OEE0MmYvL3R0WTViZHBxTEo2S0FLUnFkMFU4UU1kKzdNYXFkZnhPVWxTZzg5?=
 =?gb2312?B?Q3kvc0Q5Kzc2ZjMvVjFxM0pnZUZuUUgvYUI3TUhwVWM1dXpYbTl3NVpOMHZY?=
 =?gb2312?B?K0NRRmRFVHd3ZS9ZRGtsaU5WVXA5d3p6aEx2aFVqTEYzSEV6RFV1NGlTM2dG?=
 =?gb2312?B?QnF4T21idlphM0w4cWdrRTY2aEFzUG5CRnVNczQ1YUlPcVRMWlZWK1A2OVIz?=
 =?gb2312?B?UmpubFRNVjdHbUV1UEdiM1lIVTNRNDRnZUJaZ0Q5SU4ybHdzbjIxZ1hLWko0?=
 =?gb2312?B?Njl2dld0MFVJUWpEb1JJRWFsOGd2ZnROMVJQdjY1bmJUNjd2dEpuVXl1ZTZi?=
 =?gb2312?B?NmxyM0w5NyttMm1uMHlMUVNrbFVLYjN6Z2dGY2JjMlhaTjY4MmRIckVyRm9G?=
 =?gb2312?B?M213NGxjSkJrQ2c0Z3FPaHhCckRPSkZDRGlXK2lmSnd5b0tlV1RHZnZPZDNF?=
 =?gb2312?B?K0h5V20zUldrRWpLOENzVy9BeStzYy9sUjdPOTRRbmZOcHdOVU9iL1FYdTI3?=
 =?gb2312?B?M2VVeWR5TElmSk1YSWY0WEk3ODFjclFDZ1FzT1VTdmsvUG9GUVphc2hGMDRO?=
 =?gb2312?B?NGFGOU1KS1Fhd2RUcTZmVHdYQUZJalhVUkp0Y3F0cU9OMXkrS2NuOEpwZVJo?=
 =?gb2312?B?TzZTY1VyTGU3RnFPM2NxcjdNQThsSkhQT0YydjNjb0gwRytpcDRBT3U3Zzhm?=
 =?gb2312?B?V0FqY2pHYlNTNm9CYlkwS1hnSk1USS9QMnBmQW5QV3hOZEVBS2RiVkhtWUtF?=
 =?gb2312?B?SzYxaXZ6V29ZZ3RMU1pHdEJ1WEEzWEp1ejRuZDNjVWRxYkpZZWhYNEUvR0Z3?=
 =?gb2312?B?aVJ2OUk2L1I1bGh4YXVaN1BTUEVYUnZQTU5KWXNaSUxXb1VjRUdETStWMXRL?=
 =?gb2312?B?enFtWEM2RU10VCtFZ0NZZW9XM1FnYXFVRHZuU0QvNnBMQ0ltbjUyNzJ2cnl6?=
 =?gb2312?B?OCtYR0t1SzRHdzF4RThWY1NWNG1nSW4wck5vVWFWWWlteTJCUEhQU2VzSGZi?=
 =?gb2312?B?UXJUV00zUml1dVE4N3pEeE13dUdscTZPdnBlYjFCVjV4a2w5aWt6ckFWS3Bj?=
 =?gb2312?B?YlFjUVNUTlVWWVlUMGdqdHN5emd4aSt2WDFHeWRNejVvL0VwNU0zQ2hXbW11?=
 =?gb2312?B?ajAweFVMbDFwV056R215QzlPRHE5a05oNXZKVVd4TFhvaTR0amt2TjJOMnRm?=
 =?gb2312?B?bFdUbDBvc0VreWlZYm1CcUY4cFJPSzgzM0I2YTNnZCtKaStGRlJicytIRFR2?=
 =?gb2312?B?dWRFaXFtMitKbUMweTgwaDNHSjZIcWZjSk5XbTA5Z0RwNldrSVNueEtMR1pL?=
 =?gb2312?B?Wi9UcWdJY0czSzlzclM1b1VhOHpZYmlFNGdMdUhGb0ludWxmdHd1M1B4cHdK?=
 =?gb2312?B?TUVmcGpPU1o2Yi80dnFmaFREaUtjeFZHeWh5WnMySUtiRzdsa05RZCs3S1JH?=
 =?gb2312?B?Z3BJdnRRS29VeGZPMUtJYnErRzJpNGF6WDNOK1g0dUFBU0hrZjlwOUdhZzNM?=
 =?gb2312?B?NDBZR2pKUVJodXNXajlhckJsaHZsOWpkRXBjWkE5a0pJY2I1RkhVMDE1YmZr?=
 =?gb2312?B?S3pIQ2NOd3R6YkNCRmpoSmFXcGdxWDIwQ014Z1pJRk5oaVpwYTFGZFk3U2Mw?=
 =?gb2312?B?K0E9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10110.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(1580799027)(38070700021)(8096899003)(13003099007)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?c0RDdjhTdUVKbXZNL05IWFZFVXh5RTFGY3h0T1c0WDNBRUx3RVpNbjZQbG42?=
 =?gb2312?B?Y3VKUFpOSGpKaWN6R3lrMzhLekNRZUhlQld3MkRHQ2o0U2pRSHdSS01WR3lJ?=
 =?gb2312?B?SjFPUjJ3TlNBVGN0VjNMZlc4UVBhdittZ3owbmZ5L2c5L2VGc2ptRGFlVm12?=
 =?gb2312?B?ZUhlcUF6WTc4UGlObkk0NXU3eVZzQ3U3dUFySDlsTlFmOUd2WHNoY2Q2RjlV?=
 =?gb2312?B?L3kzMWk0RDA0VGxIYWdJc3Y5aWRKUGVDRjM5cDE4ZWJvem9DRWJzRVgrdkRr?=
 =?gb2312?B?RDY1Qi9VMnpEem54algrMlhVOUdrczJIOFJERktBKzJZaXRtdGhreStaemdH?=
 =?gb2312?B?TTBubExWbUR3Mk9ZU0N4blZ2S3pSLzlZdzczOUhLVDVSbVJRYUI0ZzB6cHZm?=
 =?gb2312?B?Ujc5WHZKaVZOUWIzQlZyeG5GU1dOTUFiU0ZkMjJ2VVEzd1FBTW0yYm1wckJT?=
 =?gb2312?B?R09aV0hLN0hSMDJBWnBld210OTN6bGJyQmZoVnNENHlBVUhlYkJWM3B2cTZu?=
 =?gb2312?B?QmhKalBhRnVjUCtJa0IrajN0QlRFNGR6NkhxUHc1eW9FbWRjR0lQSG9pNXAr?=
 =?gb2312?B?UHZ6UUxKRHZFcVk4aWI2Y01iN05LdlcxaUhST0NJNXc2cWZaREZHTUtMSDBV?=
 =?gb2312?B?N2sxQkJraWlOaWQrZHZzQ29QVjdRc2tQMi9PYnRSOGw5L2NEN1VjRE5kdjNs?=
 =?gb2312?B?VEdRdC9tZXQ2bUpRY2pFS1l1SW1OZkJJbmR6NStSTW5ZK2l4d3BhcXVwSjZ6?=
 =?gb2312?B?RXI5ZUhGbWZGV2Z4TnJnVWw0d3czRmNpTyt6S2NyUFJzWXhUR09NbzhkM0ZM?=
 =?gb2312?B?V2xQWmc1TCtXRFlBS1I1eTlZTjFYaEdsdk5kMFdTc1FOSktqOW5Xa3l3RkFu?=
 =?gb2312?B?aWFuUkxhTXZIN1N4VkFvV2pKNVhwdExYaUV3NW1vc3BpcVlWUmJtanVPYjNa?=
 =?gb2312?B?cms1VXNvQ2VLTWZNcTRRdlNiYk5XK1h0amoySVhJZUszZ21oWDZkNmp3TGNq?=
 =?gb2312?B?SklueU95N2s0bTNvQkl1SURXalovWk9nemJTSjRjYmdvU1lKRytmWDZOZFFG?=
 =?gb2312?B?WFNNVTg3UVR3NTdVaHR6elhnckJ6bmlSZXF1L1JzamdyUitIM3BHbmNwU3BV?=
 =?gb2312?B?aEpMMk5QL0lvcVFrZE4yakc1d01OMFp4bUM1QmFhTVZUUmJMUXdUVW5Velhr?=
 =?gb2312?B?Ym5VTDNIcXZZMnVlUzZ4Y25SY2txdk5LVkx3alVoTnluMVoxNWhhTVAxU2VM?=
 =?gb2312?B?aEZRM3doWGIvSWo5bTRrVjhpSEIrcEEvc0w2RHZrVXFTRXdNMFZ2NGc5VkR4?=
 =?gb2312?B?WkpONEdjUDQ0L0JWclNHdk82ZWV3dEhndUg0T3A2Uy8wU2M4VGw5Y0RrZG5W?=
 =?gb2312?B?OXpHejQzYmRoMWdtVlZVUlljejd4a3ZaWmhuMDZzNGNsM0hNL25ISFBBSEty?=
 =?gb2312?B?Rlc3ZWxDY3czM3RhU2dMVitHZWFER3ZwNmxFM0QyT0VEclpFUEI0WVVKRlJl?=
 =?gb2312?B?V3ZOY1hybjFFcXh5OHRoNW4rOVpvU2hPTWZVTUI0RVBWaDVBRGRLL0J5NTZa?=
 =?gb2312?B?OWF3cUFIUEpHbFpHT3BUTU9Na1hmV1lDOVNyRHV6c3h4VldGdDRxT0NzTnR3?=
 =?gb2312?B?eXQrV2VQQzZneHV3Z2FyaEhQVXlDZng3S1RKdWxUSGVyNGtORzZWV1k5VFNJ?=
 =?gb2312?B?RVZNbmtSTkVXcnpjZ3ZHd1Fvby9JTzVLZXRrL3RCUEw5bzRaMlpQSFd6NUJK?=
 =?gb2312?B?WDhuOWlaT3RudnBxblRVZ1Q2YW52bUFYNCtoWUt6UFBrek1SSElkdVNwUFpp?=
 =?gb2312?B?UC9YeTVOTG1QMkMxTlNNbGUvd3dEbEpXVUhONU9OdHNMVWpPeks4VmJWTGk1?=
 =?gb2312?B?MEVQVEZUS3RrUlJaNHo4YXluMzlvTUgza2szTUJxenl3UGFZK0loUTVQWHhJ?=
 =?gb2312?B?b1RCbERuYldZaVNSZ2JxTGl4VHdPSVRzdDZudXZBNHdBVi8zOXA5dXEvTzRP?=
 =?gb2312?B?UG84ZlRPRzY0RVJmVVhQOCttbDl1SGhtbGY1UW5DNUxmQk9sTnB2RUlIaXBm?=
 =?gb2312?B?Rm11V0pnWTRFZXZMekZnM1ZTL0F1Y3kvZUF4V1RpdTJrR3JYbkJSRW9kdmM4?=
 =?gb2312?B?Y3Y4NDliRm5WdGdyb2w5bG1qRU5hQTg0UjRYYnIzU2JPcHBiaWJ3elEwMEdX?=
 =?gb2312?B?eE9ISTlxZEtxQ3h0cm5Nby9oZ1FOeHdrNkRFbDd2ZElseVZ0S2dHUVBTckxo?=
 =?gb2312?B?S2N5dnBTUThicm5RYk5mcmdPVDF3cHI3ZldMN2hoWmZaMnJOOWZFbzcxeHdT?=
 =?gb2312?B?OE9yU1VkZUlvTEcvU3N2UmRaZzNLWnVSQWdQbTRVN3lQb2tYUE9ydz09?=
Content-Type: multipart/alternative;
	boundary="_000_TY3PR01MB10110545ACB9B18EB8F38FF679B74ATY3PR01MB10110jp_"
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10110.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 293eee54-98be-4465-56b2-08de73596e7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2026 04:01:47.5683
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DSGg9/tV2e+fgnlDfZUQYf4ctiTDy3croFLKDYtId56o7GtQea1i7nvLCCYopybArhK7Mzg3ihg9jvptiVoRHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB14110
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 04:01:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231740

--_000_TY3PR01MB10110545ACB9B18EB8F38FF679B74ATY3PR01MB10110jp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

cGluZw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCreivP7Iyzogb3BlbmVtYmVk
ZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZz4gtPqx7SBZaWRpbmcgTGl1IChGdWppdHN1KSB2aWEgbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyA8bGl1eWQuZm5zdD1mdWppdHN1LmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnPg0Kt6LLzcqxvOQ6IDIwMjbE6jLUwjnI1SAwOTo1Nw0KytW8/sjLOiBvcGVuZW1iZWRkZWQt
Y29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnPg0K1vfM4jogW09FLWNvcmVdW1BBVENIIHYyXSBsaWJwYW06IHVwZ3JhZGUg
MS43LjEgLT4gMS43LjINCg0KMS5DaGFuZ2Vsb2c6DQogIGh0dHBzOi8vZ2l0aHViLmNvbS9saW51
eC1wYW0vbGludXgtcGFtL3JlbGVhc2VzL3RhZy92MS43LjINCg0KMi5GaXggZG9fcGFja2FnZSBR
QSBJc3N1ZSBhcyBkZWZhdWx0IHZlbmRvcmRpciBoYXMgYmVlbiBjaGFuZ2VkDQogIFJlZmVyIHRv
IHRoaXMgY29tbWl0IGh0dHBzOi8vZ2l0aHViLmNvbS9saW51eC1wYW0vbGludXgtcGFtL2NvbW1p
dC9hZWEzMDgyMmUyZmE2Zjg3ZmFmMjU0MWRhMTQwZjY5ZGZkZmVlNzI4DQoNCiAgRVJST1I6IGxp
YnBhbS0xLjcuMi1yMCBkb19wYWNrYWdlOiBRQSBJc3N1ZTogbGlicGFtOiBGaWxlcy9kaXJlY3Rv
cmllcyB3ZXJlIGluc3RhbGxlZCBidXQgbm90IHNoaXBwZWQgaW4gYW55IHBhY2thZ2U6DQogIC91
c3Ivc2hhcmUvcGFtDQogIC91c3Ivc2hhcmUvcGFtL2Vudmlyb25tZW50DQogIC91c3Ivc2hhcmUv
cGFtL3NlY3VyaXR5DQogIC91c3Ivc2hhcmUvcGFtL3NlY3VyaXR5L25hbWVzcGFjZS5jb25mDQog
IC91c3Ivc2hhcmUvcGFtL3NlY3VyaXR5L2dyb3VwLmNvbmYNCiAgL3Vzci9zaGFyZS9wYW0vc2Vj
dXJpdHkvbmFtZXNwYWNlLmluaXQNCiAgL3Vzci9zaGFyZS9wYW0vc2VjdXJpdHkvZmFpbGxvY2su
Y29uZg0KICAvdXNyL3NoYXJlL3BhbS9zZWN1cml0eS9hY2Nlc3MuY29uZg0KICAvdXNyL3NoYXJl
L3BhbS9zZWN1cml0eS9wYW1fZW52LmNvbmYNCiAgL3Vzci9zaGFyZS9wYW0vc2VjdXJpdHkvcHdo
aXN0b3J5LmNvbmYNCiAgL3Vzci9zaGFyZS9wYW0vc2VjdXJpdHkvdGltZS5jb25mDQogIC91c3Iv
c2hhcmUvcGFtL3NlY3VyaXR5L2xpbWl0cy5jb25mDQoNCiAgQ2hhbmdlIHZlbmRvcmRpciB0byAv
ZXRjL3NlY3VyaXR5IHRvIGZpeCB0aGlzIGlzc3VlIGZvciBiYWNrd2FyZCBjb21wYXRpYmlsaXR5
Lg0KDQpTaWduZWQtb2ZmLWJ5OiBMaXUgWWlkaW5nIDxsaXV5ZC5mbnN0QGZ1aml0c3UuY29tPg0K
LS0tDQogLi4uL3JlY2lwZXMtZXh0ZW5kZWQvcGFtL3tsaWJwYW1fMS43LjEuYmIgPT4gbGlicGFt
XzEuNy4yLmJifSB8IDQgKystLQ0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pDQogcmVuYW1lIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9wYW0ve2xpYnBhbV8x
LjcuMS5iYiA9PiBsaWJwYW1fMS43LjIuYmJ9ICg5OCUpDQoNCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvcGFtL2xpYnBhbV8xLjcuMS5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRl
ZC9wYW0vbGlicGFtXzEuNy4yLmJiDQpzaW1pbGFyaXR5IGluZGV4IDk4JQ0KcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL3BhbS9saWJwYW1fMS43LjEuYmINCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvcGFtL2xpYnBhbV8xLjcuMi5iYg0KaW5kZXggOGZiNjc5ODNlZS4u
NTRjMTA1NGJhMCAxMDA2NDQNCi0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9wYW0vbGlicGFt
XzEuNy4xLmJiDQorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcGFtL2xpYnBhbV8xLjcuMi5i
Yg0KQEAgLTI0LDExICsyNCwxMSBAQCBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9kb3du
bG9hZC92JHtQVn0vTGludXgtUEFNLSR7UFZ9LnRhci54eiBcDQogICAgICAgICAgICBmaWxlOi8v
cGFtLXZvbGF0aWxlcy5jb25mIFwNCiAgICAgICAgICAgICINCg0KLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICIyMWRiY2VjNmUwMWRkNTc4ZjE0Nzg5ZWFjOTAyNGExODk0MWU2ZjI3MDJhMDVjZjkxYjI4
YzIzMmVlYjI2YWIwIg0KK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIzZDg2YjYzODNmYjVmZDllYjk1
NzhkMmNkNDdkOTI4MDExOTFmNGJmM2Y5YmM2MTQxOWJmZWZjOGFhMWU1MzFhIg0KDQogREVQRU5E
UyA9ICJiaXNvbi1uYXRpdmUgZmxleC1uYXRpdmUgbGlieG1sMi1uYXRpdmUgdmlydHVhbC9jcnlw
dCINCg0KLUVYVFJBX09FTUVTT04gPSAiLURkb2NzPWRpc2FibGVkIC1Ec2VjdXJlZGlyPSR7YmFz
ZV9saWJkaXJ9L3NlY3VyaXR5Ig0KK0VYVFJBX09FTUVTT04gPSAiLURkb2NzPWRpc2FibGVkIC1E
c2VjdXJlZGlyPSR7YmFzZV9saWJkaXJ9L3NlY3VyaXR5IC1EdmVuZG9yZGlyPSR7c3lzY29uZmRp
cn0vc2VjdXJpdHkiDQoNCiBMREZMQUdTICs9ICIke0BiYi51dGlscy5jb250YWlucygnRElTVFJP
X0ZFQVRVUkVTJywgJ2xkLWlzLWxsZCcsICcgLVdsLC0tdW5kZWZpbmVkLXZlcnNpb24nLCAnJywg
ZCl9Ig0KDQotLQ0KMi40My4wDQoNCg==

--_000_TY3PR01MB10110545ACB9B18EB8F38FF679B74ATY3PR01MB10110jp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
ping</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>=B7=A2=BC=FE=C8=CB:</b> openemb=
edded-core@lists.openembedded.org &lt;openembedded-core@lists.openembedded.=
org&gt; =B4=FA=B1=ED Yiding Liu (Fujitsu) via lists.openembedded.org &lt;li=
uyd.fnst=3Dfujitsu.com@lists.openembedded.org&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2026=C4=EA2=D4=C29=C8=D5 09:57<br>
<b>=CA=D5=BC=FE=C8=CB:</b> openembedded-core@lists.openembedded.org &lt;ope=
nembedded-core@lists.openembedded.org&gt;<br>
<b>=D6=F7=CC=E2:</b> [OE-core][PATCH v2] libpam: upgrade 1.7.1 -&gt; 1.7.2<=
/font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">1.Changelog:<br>
&nbsp; <a href=3D"https://github.com/linux-pam/linux-pam/releases/tag/v1.7.=
2">https://github.com/linux-pam/linux-pam/releases/tag/v1.7.2</a><br>
<br>
2.Fix do_package QA Issue as default vendordir has been changed<br>
&nbsp; Refer to this commit <a href=3D"https://github.com/linux-pam/linux-p=
am/commit/aea30822e2fa6f87faf2541da140f69dfdfee728">
https://github.com/linux-pam/linux-pam/commit/aea30822e2fa6f87faf2541da140f=
69dfdfee728</a><br>
<br>
&nbsp; ERROR: libpam-1.7.2-r0 do_package: QA Issue: libpam: Files/directori=
es were installed but not shipped in any package:<br>
&nbsp; /usr/share/pam<br>
&nbsp; /usr/share/pam/environment<br>
&nbsp; /usr/share/pam/security<br>
&nbsp; /usr/share/pam/security/namespace.conf<br>
&nbsp; /usr/share/pam/security/group.conf<br>
&nbsp; /usr/share/pam/security/namespace.init<br>
&nbsp; /usr/share/pam/security/faillock.conf<br>
&nbsp; /usr/share/pam/security/access.conf<br>
&nbsp; /usr/share/pam/security/pam_env.conf<br>
&nbsp; /usr/share/pam/security/pwhistory.conf<br>
&nbsp; /usr/share/pam/security/time.conf<br>
&nbsp; /usr/share/pam/security/limits.conf<br>
<br>
&nbsp; Change vendordir to /etc/security to fix this issue for backward com=
patibility.<br>
<br>
Signed-off-by: Liu Yiding &lt;liuyd.fnst@fujitsu.com&gt;<br>
---<br>
&nbsp;.../recipes-extended/pam/{libpam_1.7.1.bb =3D&gt; libpam_1.7.2.bb} | =
4 ++--<br>
&nbsp;1 file changed, 2 insertions(+), 2 deletions(-)<br>
&nbsp;rename meta/recipes-extended/pam/{libpam_1.7.1.bb =3D&gt; libpam_1.7.=
2.bb} (98%)<br>
<br>
diff --git a/meta/recipes-extended/pam/libpam_1.7.1.bb b/meta/recipes-exten=
ded/pam/libpam_1.7.2.bb<br>
similarity index 98%<br>
rename from meta/recipes-extended/pam/libpam_1.7.1.bb<br>
rename to meta/recipes-extended/pam/libpam_1.7.2.bb<br>
index 8fb67983ee..54c1054ba0 100644<br>
--- a/meta/recipes-extended/pam/libpam_1.7.1.bb<br>
+++ b/meta/recipes-extended/pam/libpam_1.7.2.bb<br>
@@ -24,11 +24,11 @@ SRC_URI =3D &quot;${GITHUB_BASE_URI}/download/v${PV}/Li=
nux-PAM-${PV}.tar.xz \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://pam-volatiles.conf">file://pam-volatiles.conf</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
&nbsp;<br>
-SRC_URI[sha256sum] =3D &quot;21dbcec6e01dd578f14789eac9024a18941e6f2702a05=
cf91b28c232eeb26ab0&quot;<br>
+SRC_URI[sha256sum] =3D &quot;3d86b6383fb5fd9eb9578d2cd47d92801191f4bf3f9bc=
61419bfefc8aa1e531a&quot;<br>
&nbsp;<br>
&nbsp;DEPENDS =3D &quot;bison-native flex-native libxml2-native virtual/cry=
pt&quot;<br>
&nbsp;<br>
-EXTRA_OEMESON =3D &quot;-Ddocs=3Ddisabled -Dsecuredir=3D${base_libdir}/sec=
urity&quot;<br>
+EXTRA_OEMESON =3D &quot;-Ddocs=3Ddisabled -Dsecuredir=3D${base_libdir}/sec=
urity -Dvendordir=3D${sysconfdir}/security&quot;<br>
&nbsp;<br>
&nbsp;LDFLAGS +=3D &quot;${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld=
', ' -Wl,--undefined-version', '', d)}&quot;<br>
&nbsp;<br>
-- <br>
2.43.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_TY3PR01MB10110545ACB9B18EB8F38FF679B74ATY3PR01MB10110jp_--

