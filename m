Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB136CA1002
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 11:02:29 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.4])
 by mx.groups.io with SMTP id smtpd.web10.36410.1756983743265612547
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 04:02:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=h6c8ikOf;
 spf=pass (domain: siemens.com, ip: 52.101.66.4, mailfrom: adrian.freihofer@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PNEIe+RdaCSshcgsQqrZkXFtG+BXwuffUxvHViXn+UhfTe4zR8Jo+BNYjCegH+lU1cIaqQAthODdqUacSPU1cIsljnzgscfSDuwTPThFMNCY+fp7TKuSv0ikusJVB2JAYqFvKoEUBrNBobMBGBvk4sjxtBUTcSw8ZUoYK7dqBLbMa7cfur6+W6A+Es+mian8BlY6EtpDAQfEhwpaMNxVU3bdpXqZqoWPKSeVI5Q/ygGnkvVxv/NIKyrvhBU1QZG+xffQna/jLXLyF9OW1y9xkUQX0yYRTvGmXXI9hBLYL1xAm4njZriplnfePPqPOAHdp1X4KTSfzdQ580vV5hl4Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tCrV2wO6nPNAWp3sgVkP9aLGzc4W3IZvSM2AtJQA2CI=;
 b=piZT2tStlgAtFgtBnC3MgSkicUZ99L3tuqbIWQmBst5RPxadkHkBUZ2fAzF4BUDmhTka4jWsdEOrUKYkwWtVZwohaSgWHkD0PwFd3PBZrFLL7grbsMt5pGiu68rjjCadRasgrLTJ/U9u1PYKogGRjqYHGb5ttlpFRhOdG/All1Qp7rb/8ZnKVxhdz7UvtYmfbbq9McHOUDHjLPd6rnq2WjTcq7Y4cb/LF5rFio3wc9RooSD/0BVcWPfXHO0UAu8Y5jnZvD5HmNp6ExZLoGxyXEVrhk3FiwM29C/5aXGlcqj/NeykyxaW78a7STO5tmL0uB73Lu3bn6Okrhfwbn6IqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tCrV2wO6nPNAWp3sgVkP9aLGzc4W3IZvSM2AtJQA2CI=;
 b=h6c8ikOfXdPiWnqNyWTKHNmE8msn66nvt2scwb+E0nOAIJit9YhR294MsGV8tYlE3y53helMwFz2+UXiiFGtvqqFruK9k3eDnUESqquTyPV4CoRRJ4vPG0zpr9VHjAJMj07RcjJs8cTySF3bdVmRWhKBuX4nX1iL5AakA4cC5/P9dz1w8X6FnaUk9eqshvccwDDj1SPu40pFCf9++BZ8jd6ooVXl3fF1VogVDpEuJXWADeXeZX2tA+Ju9T9ba8IQmxgnmoYnDvk6AkV1rLIheehjO60BPg/FHnZm2AiRadOYHpl5lfnBrt+iDuFl3wQiSJjm8fgHcTnaEMdOcUfcHQ==
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:13e::17)
 by PRAPR10MB7621.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:294::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 11:02:17 +0000
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e586:9cf8:7696:cbda]) by DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e586:9cf8:7696:cbda%6]) with mapi id 15.20.9073.026; Thu, 4 Sep 2025
 11:02:16 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: Kavinaya S <kavinaya@qti.qualcomm.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/2] fitimage: test FIT_LINUX_BIN behavior
Thread-Topic: [PATCH v2 2/2] fitimage: test FIT_LINUX_BIN behavior
Thread-Index: AQHcHX7JooIh+dyX+0yIZ7ObN6xzgrSC28CA
Date: Thu, 4 Sep 2025 11:02:16 +0000
Message-ID: <e772b753a9d1103fa1271f188f732a73cfea701a.camel@siemens.com>
References: <20250904093122.593125-1-kavinaya@qti.qualcomm.com>
	 <20250904093122.593125-3-kavinaya@qti.qualcomm.com>
In-Reply-To: <20250904093122.593125-3-kavinaya@qti.qualcomm.com>
Accept-Language: en-US, de-CH
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-1.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR10MB3529:EE_|PRAPR10MB7621:EE_
x-ms-office365-filtering-correlation-id: e75ed1e0-dfbe-4083-8bc8-08ddeba282a1
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?Y2tWNjhEZXd6NFB2TitBandkQ1JPYktySkJnV0t2Wi9LeWtzRWNnc2RyeWQr?=
 =?utf-8?B?VVlWSXNZMlZyQ3hEMWhPUEZBeFpKT25td3FXWVB2L1IxaElsYk1mYTNaSWV4?=
 =?utf-8?B?TkdYdUM4eVovMVFtajQ4TkFVRS92aThGSnEycVpqZWx3dnMremRaYUo5TXZU?=
 =?utf-8?B?bmg3am9lcDhLMElIb1hhc2ZqQnlmTXplY2pjVXg0U3JZeG1oZ0dxNFU4WU5k?=
 =?utf-8?B?YUpheURYam5ZdHNtRHJtMnl0SDFHdktJVXgvdmpzaXBhQ1FCeWFJRHlibExa?=
 =?utf-8?B?U1QxSndnRDR1VWdNNWpHWVJoUHdnblp5MjM1VWROd0RpMzVieGIzK3RraHNT?=
 =?utf-8?B?NW5pTjRCNlhHcW9GZ3pmb0FRbnRGSC9IZHhTMnJrTGlzYkN4dmV4TWgybXoy?=
 =?utf-8?B?LzV2L2VaOWpqczRqYWM5Qm1NMWxqajdTZ0tSdUkvVU4vRWI1OHVLSFhXL2Zq?=
 =?utf-8?B?VUdKZERsSGZpSm5uV2d4cDdJTTdpN0lnMnZUcU5TREgyTXByajJ5MlhaSWMx?=
 =?utf-8?B?SEZMeWtQemN1M3pLbnc5endtTlVEUFFCTnB6eStvRWZDaWhCbVJzMnRBVXRJ?=
 =?utf-8?B?R1p4RjkwbU5mdUcxdFRvQ2tnQ3ZHYlQ1dE1TTnRHQTl1OXB6V3Y1c3dQWTJ1?=
 =?utf-8?B?cVpBZ0ZEZEV2eFVmR0xhMmh2Z1N6bUo0eHo3RjNTeGZINDN1Q1NNSE9ISlBU?=
 =?utf-8?B?K0pkTHdRNWF1YzdVOEZsbjFDWFJ5WVpNdmc5eFJCQXdtU2h6cWVhNy96V0hZ?=
 =?utf-8?B?amhIR2Y3SGhwdTZFSFZwWXByOGJ6dmNXWWNCSm9TUFI5cVF1TkkyY1BmSEU2?=
 =?utf-8?B?WW5Hc0ZxZnhyaFVEbWNpV2s5Mm9mWkw3My9CM25iem9vSjMrNlQ2bmdpT254?=
 =?utf-8?B?ZGxMVTlpZ1dHdFBzK0lybVpGdERKSXNkQ0VNbUtXMklUbGsxTnNNejRXc0c0?=
 =?utf-8?B?L2d4Y0d5ZGVoS0YxTWxsNTRKK09YR3dMQnowaXJXSE16RWVoRnRveUE4MlBj?=
 =?utf-8?B?MGhGZ2lpOUhWMGNybTZQMXlKWXNvYUE5VEJzVVlSbUFWelBMbDJlYUs3NG5T?=
 =?utf-8?B?NFJiVnZMTnFDUUsvWHhWTk5Sa2YvNHF4eWdvK011QzFqUEF3aGk4cTlSSnQ5?=
 =?utf-8?B?QkV4MFc3SjA1T05xVWpCMWdnTW43dUdiU0l4aUZYSzllbFRVZkRrMDh0QlZM?=
 =?utf-8?B?SCtlVTJ3NmRhcTB3WDEvV0FpNmw0TGR0SlMwNFJROTZWY3JYMU1EdDVWVFlD?=
 =?utf-8?B?R2VQQnBneEE1Zm1ieWVoY2luSkc1Y2JjS3ZNNDgzcWN4a0VLMndYWGlNQ1NW?=
 =?utf-8?B?c21DZWZOODY4c1ZDT2daTzNXUEpBblFBZ0ROMGg1ZG5yY1ZpTUwxRkJPRlZZ?=
 =?utf-8?B?YUE1a2dZdnN4ZE1lR2h1ZkcyQ2xodEExVTM3U3JINlpvcmhNVUpCYkE2UVY4?=
 =?utf-8?B?Z0l2d3RRYkFPdldZT0RhYlI5WlNHbXJNU2gxTTErYSt3SGpPbTdJcGVkaXY1?=
 =?utf-8?B?SThTU3FUV2pvcitFcjh3TElNNUQzb0ovVWVvMmpxZlNuVnpKWm9IalhwQUFI?=
 =?utf-8?B?OEpPbXN6U0cvaHA4NTJFeUlSYW5rTUdBV3pVaHN6V1lIMkU4MjUyL2FyU2s2?=
 =?utf-8?B?R2NhSStFaDMyVVk3UWFkU0dkc3dJNWkwSkFrOW9kY3pCQUlSUW9QK1l1WDQ2?=
 =?utf-8?B?dlVMYm1xWW1hU0piNU5HWVZJMUZaREpBTTRQMmFja2NwQkI3TlhhRkNEL3VJ?=
 =?utf-8?B?U2lvWEZ5VWhkb1RYTmI1WDZsdjRUbkR6bm5GbWZ3OGdDMWo3Q1RYcVVlTTN2?=
 =?utf-8?B?aFA3MzlMVEJ6bzRadkZGakhyOEZIYjB4MmxYbFU0cHZLYmtrNzgxZlpySCt5?=
 =?utf-8?B?eTQ3Q3BRaEhXM2tONmF0K0JKWEd1M2w1aEIzU2tUMEdYRU5OSUdvSnlwb0dR?=
 =?utf-8?B?M3BZQW5qQWFVUVFObjQvbWQrdkp1UzhkS1dRVWhTcVlpdXZNQ1d1LzNPVWww?=
 =?utf-8?B?VEh6ZThVeGNBPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?QjRHZlAwV2dLenR0K3NhK0tZTjh5a1luSHptVG1QMExrMGdCalcvZHFmMGlS?=
 =?utf-8?B?bVk2TndxY0luRVdxTldnTVNpL1psc2MvcmZZUGpZWFkrSFhHZXFUMzY5YlpB?=
 =?utf-8?B?d1lpcG9aSE9EV0VHRVpvcmE0RWNHK3dNQjZZVmZWcTI3RnV4bWx0TDkyMjF4?=
 =?utf-8?B?OWE5d3hRdktSZ1NRaEVVWUU1K3Z6c1pMWTdlT0MzQWZJTEtveVJkZTJmbmNk?=
 =?utf-8?B?c1RDK2JLM3R0L1FUK20waXhNSDlwaEdoRlRFMGtRcmJmc1dlV3VaMFVkZldm?=
 =?utf-8?B?QXd4YUpFSlNONHhWNDFRcE9QMEswai9TNGNtY0xvblpFaXZxOVZFMk1Ha1Bn?=
 =?utf-8?B?Z2NrcHFjU2IyS1ZVZGRCMDFpdHR0R3Z2TGRtZzVzZU1XRUU3SS9ZR0s5RWxE?=
 =?utf-8?B?anBOMm5kQmgxY0hKR1VBV2xpL3g1Ykg5cTJnTjl2NU5IOTZDSWhxMUJIK242?=
 =?utf-8?B?b3M5VHhJNUZqZit5Wk9WR0taUVd2Rkhhajl5TVYxT1h0NkNmNDdCaE9rWm42?=
 =?utf-8?B?c2JMa2JhUUYxWEttZHdpMzlocjJHcTk5YWNFRlBlMVBHSllPK2RPdkRpZXEr?=
 =?utf-8?B?UThUQlE4anNUZThUTE05WHlqMGJtMC9aNlVRMWwrQXdlNXhTY01yalJrZU81?=
 =?utf-8?B?a1ZkanNTTUlCSVI5dXNwR1pDNFM1L1RkUFgvYTF5Zm1LYkV5NXF4c1lhTFR3?=
 =?utf-8?B?T2xwdDZLSnkzcXd1LzBPRkNtK0VPb0krRCs3aWhWSVdoYzl5TTZtbXFXZTA1?=
 =?utf-8?B?L0w1MVk2ZFZJOGxoYXh0VThDRU12NWhZYzhIcUNBSm1PVExtQXlZR0lFaHlE?=
 =?utf-8?B?K2NEcWxNQkNjV2pJbXlFWkxaNE93NTEwaHhDc1NsWnpYRGs4S1dtK2ZTV01R?=
 =?utf-8?B?emowNXlEcFdsQU5XRTBkMmE4bkMzdVNaU1ZTaHZsbE1iaDBpeG5oZHg3ZGMw?=
 =?utf-8?B?Y0hUNFhNeGZLRlVHNDBKTVdqeW9jb28wZUhyODVsNEdsL0swVjg1QTBkMnhV?=
 =?utf-8?B?c2dYNEJjd1h2UzBjL2hoWjQrV2ZtaGdMQnlOWXBCQk5MLzZMak82MFFiME9l?=
 =?utf-8?B?R01yT0wrOGRhWFNvUHdrRUxUU1doOXlsVTVMVlFzL2Q2azdkeDBoNmFoRkdU?=
 =?utf-8?B?T0JiZWxvYWJpZkI5NE5MOFlwTjJneER2bDEwakhoT1c4R05JZy8zd2RVKzdE?=
 =?utf-8?B?MmxUVkVzbWRZWFhxaitKZzNGcU1tUHh0QUo5UHBXdmw5R3lvM2RhZ2dJMlBw?=
 =?utf-8?B?cjBVdEFJRUU2MHhSNUdFUXh2eVZSZklPdW9WTFBjUmhSNVlRNDVJd0p6WGll?=
 =?utf-8?B?QWx1ZmVCN0g0aGJveHRhbW9iZk93Sk4zYVBmRy9Wc2JFZnljOS9wcnQ2U295?=
 =?utf-8?B?WlVDTExaVlBSdlMxNkJBUGlKL1Y5UTN0bXJ1dVpsVkx6V1k4aysxQ2gxYnNP?=
 =?utf-8?B?TklvdWtQVnZBdjRqTGRTWER0K1VJNktRR1VtM0k4TEVid1Jya2dDaDErbEc4?=
 =?utf-8?B?MkJEUkdHOTRXNTh0V1pGa1VRV25zMGxDRGhZZEdMY3lpNElBNHdjZTRka0hN?=
 =?utf-8?B?bG9LcFRIQnMyOHp4S2dqT0w1RDJDOTExS0FFQlJwWVlPNDZLNlNTOThnUity?=
 =?utf-8?B?dTYwMEhlanM0L2NLbVJUbnpYRDR6b2E0aVdMcnpvK0hqK0RmbEdsb01VRE9l?=
 =?utf-8?B?bWo5R2hvNlhzZEc3MVhtWVZYbEIvMGZYY1ZlOTVhZWYyampoa05TZmNUZnFM?=
 =?utf-8?B?S1hrSmIwMG9xTlhQbThoOHZzTHl0UDIyVjZJc0VmZlQ4eVBoQU9tVHVSNDdF?=
 =?utf-8?B?eGx5VWpDcWJyU2xlZmhBL1VVL1dzVWgxSEpxQzZVMFJxNitMVm9lQ0cxRmpu?=
 =?utf-8?B?Nng2VXNsWDFaLzN2d3B6alNIZ24yR2gwb3Y3d1pXK2FWcVk1aGdkWnIzZHJP?=
 =?utf-8?B?VVMxdjEvU3JRaUFrN2xMdU5MSW4wNXdMUHpFNUhzb3BQZXZRaGV5MmNBaVZm?=
 =?utf-8?B?bUgwbXZNa2grOHM0ZFFoSHJtTnZPM05hc3FQaDB3dUlnYlZ4U2JubS9yYjFl?=
 =?utf-8?B?UzNHdWFhQmg1aGcrbWEySE9iZU80NzBEOHliWW9vZWptV2lDL01WN3BRMUJu?=
 =?utf-8?B?QXZwYnpEWE1BK0IrVTFyYWwxdFFubVJzSnlRdHM5Z1VzS05uT0ZobXNNaGN4?=
 =?utf-8?B?ZXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <96D78024224D3E46A0EEA6F9BE9AC2AF@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e75ed1e0-dfbe-4083-8bc8-08ddeba282a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2025 11:02:16.5147
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HpzSLnP/jQX/Txv9knHdb+mMFel07g33jPLKv58Jl6BVsnT9zULMEf6MbXXj2TycYzJop92PV+594IDrR1th7G/8tnWkz/YdpWCU9KufivM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAPR10MB7621
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 11:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222918

T24gVGh1LCAyMDI1LTA5LTA0IGF0IDE1OjAxICswNTMwLCBLYXZpbmF5YSBTIHdyb3RlOgo+IEFk
ZCBhIHNlbGZ0ZXN0IHRvIHZlcmlmeSB0aGF0IEZJVF9MSU5VWF9CSU4gY29udHJvbHMga2VybmVs
IHNlY3Rpb24KPiBpbmNsdXNpb24gaW4KPiB0aGUgSVRTIGZpbGUuCj4gCj4gU2lnbmVkLW9mZi1i
eTogS2F2aW5heWEgUyA8a2F2aW5heWFAcXRpLnF1YWxjb21tLmNvbT4KPiBDYzogQWRyaWFuIEZy
ZWlob2ZlciA8YWRyaWFuLmZyZWlob2ZlckBzaWVtZW5zLmNvbT4KPiAtLS0KPiDCoG1ldGEvbGli
L29lcWEvc2VsZnRlc3QvY2FzZXMvZml0aW1hZ2UucHkgfCAzNQo+ICsrKysrKysrKysrKysrKysr
KysrKysrKwo+IMKgMSBmaWxlIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0t
Z2l0IGEvbWV0YS9saWIvb2VxYS9zZWxmdGVzdC9jYXNlcy9maXRpbWFnZS5weQo+IGIvbWV0YS9s
aWIvb2VxYS9zZWxmdGVzdC9jYXNlcy9maXRpbWFnZS5weQo+IGluZGV4IDNjNDA4NTc3NDcuLmE4
Y2VlNWI3MTEgMTAwNjQ0Cj4gLS0tIGEvbWV0YS9saWIvb2VxYS9zZWxmdGVzdC9jYXNlcy9maXRp
bWFnZS5weQo+ICsrKyBiL21ldGEvbGliL29lcWEvc2VsZnRlc3QvY2FzZXMvZml0aW1hZ2UucHkK
PiBAQCAtODM4LDYgKzgzOCw0MSBAQCBQUkVGRVJSRURfUFJPVklERVJfdmlydHVhbC9kdGIgPSAi
YmJiLWR0YnMtYXMtCj4gZXh0Igo+IMKgwqDCoMKgwqDCoMKgwqAgYmJfdmFycyA9IHNlbGYuX2Zp
dF9nZXRfYmJfdmFycygpCj4gwqDCoMKgwqDCoMKgwqDCoCBzZWxmLl90ZXN0X2ZpdGltYWdlKGJi
X3ZhcnMpCj4gwqAKPiArwqDCoMKgIGRlZiB0ZXN0X2ZpdF9saW51eF9iaW5fYmVoYXZpb3Ioc2Vs
Zik6Cj4gK8KgwqDCoMKgwqDCoMKgICIiIgo+ICvCoMKgwqDCoMKgwqDCoCBTdW1tYXJ5OsKgwqDC
oMKgIFZlcmlmeSB0aGF0IEZJVF9MSU5VWF9CSU4gY29udHJvbHMgd2hldGhlciB0aGUKPiBrZXJu
ZWwgc2VjdGlvbiBpcyBlbWl0dGVkIGluIHRoZSBJVFMgZmlsZS4KPiArwqDCoMKgwqDCoMKgwqAg
RXhwZWN0ZWQ6wqDCoMKgIC0gV2hlbiBGSVRfTElOVVhfQklOID0gIiIsIHRoZSBrZXJuZWwgc2Vj
dGlvbgo+IGlzIHNraXBwZWQuCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0g
V2hlbiBGSVRfTElOVVhfQklOID0gImxpbnV4LmJpbiIsIHRoZSBrZXJuZWwKPiBzZWN0aW9uIGlz
IGluY2x1ZGVkLgoKQWxpZ25tZW50IGlzc3VlPwoKPiArwqDCoMKgwqDCoMKgwqAgIiIiCj4gKwo+
ICvCoMKgwqDCoMKgwqDCoCAjIENhc2UgMTogRklUX0xJTlVYX0JJTiBpcyBlbXB0eSDigJQga2Vy
bmVsIHNlY3Rpb24gc2hvdWxkIGJlCj4gc2tpcHBlZAo+ICvCoMKgwqDCoMKgwqDCoCBjb25maWdf
ZW1wdHkgPSAiIiIKPiArTUFDSElORSA9ICJxZW11YXJtIgo+ICtGSVRfTElOVVhfQklOID0gIiIK
PiArIiIiCj4gK8KgwqDCoMKgwqDCoMKgIGNvbmZpZ19lbXB0eSA9IHNlbGYuX2NvbmZpZ19hZGRf
a2VybmVsX2NsYXNzZXMoY29uZmlnX2VtcHR5KQo+ICvCoMKgwqDCoMKgwqDCoCBzZWxmLndyaXRl
X2NvbmZpZyhjb25maWdfZW1wdHkpCj4gK8KgwqDCoMKgwqDCoMKgIGJiX3ZhcnNfZW1wdHkgPSBz
ZWxmLl9maXRfZ2V0X2JiX3ZhcnMoKQo+ICvCoMKgwqDCoMKgwqDCoCBmaXRpbWFnZV9pdHNfcGF0
aF9lbXB0eSwgXyA9Cj4gc2VsZi5fYml0YmFrZV9maXRfaW1hZ2UoYmJfdmFyc19lbXB0eSkKPiAr
Cj4gK8KgwqDCoMKgwqDCoMKgIHdpdGggb3BlbihmaXRpbWFnZV9pdHNfcGF0aF9lbXB0eSkgYXMg
aXRzX2ZpbGU6Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaXRzX2NvbnRlbnQgPSBpdHNfZmls
ZS5yZWFkKCkKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzZWxmLmFzc2VydE5vdEluKCJrZXJu
ZWwtMSIsIGl0c19jb250ZW50LCAia2VybmVsLTEKPiBzZWN0aW9uIHNob3VsZCBub3QgYmUgcHJl
c2VudCB3aGVuIEZJVF9MSU5VWF9CSU4gaXMgZW1wdHkiKQo+ICsKPiArwqDCoMKgICMgQ2FzZSAy
OiBGSVRfTElOVVhfQklOIGlzIHNldCB0byAibGludXguYmluIiDigJQga2VybmVsIHNlY3Rpb24K
PiBzaG91bGQgYmUgaW5jbHVkZWQKCkRvIHdlIG5lZWQgdGhpcyB0ZXN0IGF0IGFsbD8gSXQncyB3
ZWxsIHRlc3RlZCBieSBhbGwgdGhlIG90aGVyIHRlc3QKY2FzZXMuIFRlc3QgZHVyYXRpb24gc2hv
dWxkIGJlIHNvcnQsIGlmIHBvc3NpYmxlLgoKPiArwqDCoMKgwqDCoMKgwqAgY29uZmlnX3NldCA9
ICIiIgo+ICtNQUNISU5FID0gInFlbXVhcm0iCj4gK0ZJVF9MSU5VWF9CSU4gPSAibGludXguYmlu
Igo+ICsiIiIKPiArwqDCoMKgwqDCoMKgwqAgY29uZmlnX3NldCA9IHNlbGYuX2NvbmZpZ19hZGRf
a2VybmVsX2NsYXNzZXMoY29uZmlnX3NldCkKPiArwqDCoMKgwqDCoMKgwqAgc2VsZi53cml0ZV9j
b25maWcoY29uZmlnX3NldCkKPiArwqDCoMKgwqDCoMKgwqAgYmJfdmFyc19zZXQgPSBzZWxmLl9m
aXRfZ2V0X2JiX3ZhcnMoKQo+ICvCoMKgwqDCoMKgwqDCoCBmaXRpbWFnZV9pdHNfcGF0aF9zZXQs
IF8gPQo+IHNlbGYuX2JpdGJha2VfZml0X2ltYWdlKGJiX3ZhcnNfc2V0KQo+ICsKPiArwqDCoMKg
wqDCoMKgwqAgd2l0aCBvcGVuKGZpdGltYWdlX2l0c19wYXRoX3NldCkgYXMgaXRzX2ZpbGU6Cj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaXRzX2NvbnRlbnQgPSBpdHNfZmlsZS5yZWFkKCkKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzZWxmLmFzc2VydEluKCJrZXJuZWwtMSIsIGl0c19jb250
ZW50LCAia2VybmVsLTEgc2VjdGlvbgo+IHNob3VsZCBiZSBwcmVzZW50IHdoZW4gRklUX0xJTlVY
X0JJTiBpcyBzZXQgdG8gbGludXguYmluIikKPiArCj4gwqAKPiDCoMKgwqDCoCBkZWYgdGVzdF9z
aWduX2ZpdF9pbWFnZV9jb25maWd1cmF0aW9ucyhzZWxmKToKPiDCoMKgwqDCoMKgwqDCoMKgICIi
IgoKVGhhbmsgeW91ISBMR1RNIG90aGVyd2lzZS4KCkFkcmlhbgoK

