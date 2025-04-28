Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E7ABC369D5
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 18:42:41 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.89])
 by mx.groups.io with SMTP id smtpd.web10.56106.1745865751392269565
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 11:42:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=fFeIX/U7;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=fFeIX/U7;
 spf=pass (domain: arm.com, ip: 40.107.21.89, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=cfoX2HtsyUauvu+si2zo6EV43g1WCAnWQBZkfzo7qI2trFdHZOmlcE0fyMFucOuVPuR/xNQqHNU2DGAKNIdMwIzTUw20GqLo4qXxDtTqO7O1i1ry3ljWIAnNeB+4cs4nKGeCkDDTwPvYEoDORGqoXna+PvLvDAQVJnIJYkdXwjf4sqoO7elgk4iL+vsAW217kfRXTfWutDoRKfaYOMozKeIzRkFvcTevVQIm9heUTodxFw14MNvlieVQZ92FiTKbHFzS7BJJZNEgAqmjiwPuLJXZzLyExwKVyoxE3PIwf0be9AmHs/cHcwJqCs6murGi3Yq9tVBLkBcoFpqAN+JcgQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SZ1uQExZsU/s56N1A4EAUJ+0lXyd3DAyYhf3EMYudCU=;
 b=pz97dNTxYT+p5yQCbNsmEvnZ+sYjxDOdVh2yxzl+tAD3LY0iib0xUwCAQYUvSBMLu/TmyDp/NOSVaYEcjyZVTSYuM9BbKR2m8Afx61w99vKq/7vokOWr3E+66H3EehqCiMp7PFXNZ3umCcA269gQ/VrM+DZiwJGrK2dSbEKnnerJt9UT5bNLYPTTMNwQnp1vwByUyAjQL97gSLV5+ryM4L2kjyVI/5mpshujNcxW6SAs+kTr0hfiJMCf7nmqnImFKvkT1wHKYxaTbjhgbDCgoOXxAiLygL+gGKaefLz3TfS2lotJZbhnbAf/8RPwXrcrDn1mErOwlfbw/A7DHAwZAA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SZ1uQExZsU/s56N1A4EAUJ+0lXyd3DAyYhf3EMYudCU=;
 b=fFeIX/U7Gqn3kW+ZQSPSX8lvYoyl74woRE7tHUDl6ClQuJGaUHgaek3LvxmHG3hyrRnnYKDf3ml63bUpyAKVEDsfITVw2RbomGinXMCb3eu1Rn4SJVqo/9BCs1JkTkmQn11Lu7bWbeqoMFgabmEfHMl6BTVizbCRiLtDraqQN5M=
Received: from AM0PR02CA0105.eurprd02.prod.outlook.com (2603:10a6:208:154::46)
 by GV1PR08MB10423.eurprd08.prod.outlook.com (2603:10a6:150:165::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Mon, 28 Apr
 2025 18:42:26 +0000
Received: from AM3PEPF0000A797.eurprd04.prod.outlook.com
 (2603:10a6:208:154:cafe::f1) by AM0PR02CA0105.outlook.office365.com
 (2603:10a6:208:154::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Mon,
 28 Apr 2025 18:42:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A797.mail.protection.outlook.com (10.167.16.102) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8678.33
 via Frontend Transport; Mon, 28 Apr 2025 18:42:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ue0lE7a2d5FwCg6s+ILW3hZVoerE34NVyZzrJcnRtoggIeLoq7Zvr/artpv33dqI4xVj09xcyjj7aRdh9/zg3tol+EEQEMoIXYI2j+xsksSk1PR1vycYViHYV8KP+T9sQunVrsQBAfucl4j4hN7kIN14IXWxOU1J6gp6QDnR0v2FUc5lyI4GUph52m4AZ3qHsspVZdzCWgZq4Jbkj2za2xmAqrNmscZdBMz7Jl8ST1PradGilJz4u8sPjrWdvWeuhDjx+4q/0dOeSFuUpqTtGfocgKpdXBdjGPNvxYPtzzGsWZTh0VuFDM9x1+TFOQtLqmfskdDu6r3tpmUspdJyfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SZ1uQExZsU/s56N1A4EAUJ+0lXyd3DAyYhf3EMYudCU=;
 b=jHgMlQNCBwYS+MMtOGT+OxUSowjfy3TpP8+72egwrGyEkAXYIuMa/OfCth69QxkAwRcxFDKa/bq8wYTnUHvN0UahL3TuW9v0WJ78595vKbktxHwkkbUF86LeTNmj3NEMVQt3gUTTUC4ttt0aEnu6IQF1qCkWumZiZOex5PpQQhLo/hBs0fPWsjyIBU6gGNRb1GWlgxCnwpbZ4Z/jXR6aYE9kH9NMgg5t6Vdr7OD30Ykay1QZaREVwqEeaFMIcPzhDifVPxGH/Qhd+h5b5ctoLqTf2gTSoxG/hun06yQAv5NxE7tRmYiwEgeC6KTp/FU0hc90fbpdTu3ATFM896HmyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SZ1uQExZsU/s56N1A4EAUJ+0lXyd3DAyYhf3EMYudCU=;
 b=fFeIX/U7Gqn3kW+ZQSPSX8lvYoyl74woRE7tHUDl6ClQuJGaUHgaek3LvxmHG3hyrRnnYKDf3ml63bUpyAKVEDsfITVw2RbomGinXMCb3eu1Rn4SJVqo/9BCs1JkTkmQn11Lu7bWbeqoMFgabmEfHMl6BTVizbCRiLtDraqQN5M=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB10144.eurprd08.prod.outlook.com (2603:10a6:20b:630::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Mon, 28 Apr
 2025 18:41:52 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8678.027; Mon, 28 Apr 2025
 18:41:52 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>,
	"dmitry.baryshkov@oss.qualcomm.com" <dmitry.baryshkov@oss.qualcomm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] libxt: fix build error
Thread-Topic: [OE-core] [PATCH] libxt: fix build error
Thread-Index: AQHbuFUZx2B1v5D9zUuMofmKHC20sLO5ZqyAgAADCAA=
Date: Mon, 28 Apr 2025 18:41:52 +0000
Message-ID: <9E454D80-4362-4AF0-8372-54E3AD3AA8F2@arm.com>
References: <20250428154902.3084542-1-dmitry.baryshkov@oss.qualcomm.com>
 <CANNYZj9W6wHnH6AhYQafnVA9cfmF1pcQYFammfLABLB-BLoH-g@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9W6wHnH6AhYQafnVA9cfmF1pcQYFammfLABLB-BLoH-g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB10144:EE_|AM3PEPF0000A797:EE_|GV1PR08MB10423:EE_
X-MS-Office365-Filtering-Correlation-Id: 7707b64a-0fd1-468e-877e-08dd86846bc6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|10070799003|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?aUozWElTd2JhMlJRY2ZCOHF2bS80akNVR0hMOS9xTExaeXNFVFUwdklKdmFp?=
 =?utf-8?B?SE9xR0REQlhzMjlJUzFlR1o5aXBEcWpLUUNHYXJuSlcwQ1dvYitYRU15Ulh2?=
 =?utf-8?B?Tit6ZmV5TllwVnU0dUFHSHk3bkd5M25ZcDFBRGxsMkplSFgrVk9MSExVQXlC?=
 =?utf-8?B?bGxHcUxKZlErWWxOazk1N0toMmtYR1dtUkdaWEdPdU9idkluOFI5ODVyOVph?=
 =?utf-8?B?MWxGVXl2MmRRalVOcy9nT1hZa3pLeU1IcHNtb1QyWC9WZEk3UzhMMEZGTFg4?=
 =?utf-8?B?Tm5meGgzZHdjTHNEN3I1OVA1VXRrd1dpRVJkNFAwOVphNDBITmZYQ092dzFr?=
 =?utf-8?B?UE41WXYyUE9SZ3VFYUlWYnFjWlVGVmlMbmJrWC9aSFRaeElmdzMzZ05CTEhU?=
 =?utf-8?B?c3lTakFPaGxUeTRaRXVhTmtodkpsRC8yZFpsL2hDdk5tSjBRMU5xaWhjbkFG?=
 =?utf-8?B?Q1poVkpUdVhaS3JDMmlnS0llNnQrTDNveDhkbmdpMWRDNC9heWgyRHZGMWMy?=
 =?utf-8?B?WFg2V1RQMXBhMUZNd1J6RjArVmdlQWpCTWhIdTAzcitHY2wyb1FjVEZ2M2xx?=
 =?utf-8?B?ZzRJT25hR0hTUU0wWHFoeXJkSXQvbDlMbWNZajJGSFBxbHBodU5CeHpYWWto?=
 =?utf-8?B?bnQ5TzgzdUsyQ2IwUHBkNkdiNFFXYTRiVTNKK0M5RDJFZ2h4K3RRbmhML1RG?=
 =?utf-8?B?d2lVL3NiQjM1OTFKczQ1OENTM2R1dG9nZC8rOU83MEovMEYrRnAramw2MGZQ?=
 =?utf-8?B?ZXVYOHpzZUdBdk1CTVRoQUd6S0xMa3YzR0R0bnRrMmFYemZ6TUxYV2pnZ2Iw?=
 =?utf-8?B?Vml5TU1MTjFuWGYxeWEvWFU4bTVKZldtR3RwMG9EbzdzZzA1ajVMeFlJdGZR?=
 =?utf-8?B?Q0t6WXpqUitnK2xGa3kzL0VucTFORUczMjdNYW5lS2lNcFkwejdNWFQyRFE0?=
 =?utf-8?B?N3pJaS83NnRCRjdZbmpPTzQ1cHNyNHZMTGI5QmdoWTZuMFNwL2JPWFZpU3RR?=
 =?utf-8?B?SEEwVjZWNEZYaDdXTlVUdjAyQUhQSjc4YlNPVEVwUTlxaGhZZ0lrS3dSM3pz?=
 =?utf-8?B?UUxNZTAwU2FsMkQ0dHJMT2RsS0hvRDcwYlBIbVZ1aHFYdzM0L21OdUkzY2RJ?=
 =?utf-8?B?V21xdnRGUUovMDI4RDBDS1MrV25ReEtJUFpiUkI5VkNVa1R1Z2lIU1RlbUNj?=
 =?utf-8?B?N2poSGRaSkpVcUNSV0lham1CUjYyT3I0Nk5TY3ViWWRhdENDbHd6L0l0RVJu?=
 =?utf-8?B?OFIzWWhWeDJQN1g0MXNvV2cxdndldExPcUplNVFwVkIzUlloMXZtbXdoa091?=
 =?utf-8?B?OXJUYUdiZEp5cWdpeDkzQ0dZZ1pqUXo4dGQwdFl1ZW1GbVdDbGRwMjFmWERK?=
 =?utf-8?B?WlNOczZFTEp5UURlWVBVbVpCRlhHZk5DMVd6a1huVWZKSWR1M2ZuTjNOWVA2?=
 =?utf-8?B?QnRHRWhleTlHTDlrWG1MeGRGc3JMNFpJS28yU2ZvaHlMMWJtU3dVd0VwQkJO?=
 =?utf-8?B?QVk0aEhPOU1rSmI1TmRUQlhSUEtKc3M2WHpGWDA0bmUzWWZiWEszSXkyb24x?=
 =?utf-8?B?dzJDMUV1bWVXK1hPTmwyZWw0YXdRR0x3MUpDcTNoQWEveVQ1OHZWaHU4MXJX?=
 =?utf-8?B?Q2VRcWJqaWJJdXhKbUw5Z1ZqMzVRRGhRczZJRmNyU1Nwb1ZwUDVGckQ0ZEx2?=
 =?utf-8?B?ZVRhQjBZbzFSU280WjRJU21Pd2k1eWJRdjZjQkoxNkt0YVhOWVQzQzM4WmEr?=
 =?utf-8?B?cCt1Zm5UT29PWXU1QWFpM3I2SGJxMjVRODhNMy9qT2VnSmE0c0lGVXVNS3Bq?=
 =?utf-8?B?bkp2VDFjVEllek5CV3lLZkI4cFQ2alpUNWxidG82NkxlUERHT0s5ODBXcHRX?=
 =?utf-8?B?QXRXMURWZ3JRblFZMHhxWGhXdWNqTWlPVmQwTlBBZDIxZ2ZpRkpPR1ljUnlL?=
 =?utf-8?B?QkFRRkd2cWtBUEdtd1FNL1BucFd6Nml6dWpkQUZIcUdCRlNHSTNnZ1ZxT3N1?=
 =?utf-8?B?aDRHcU02VWZ3PT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1FA20D82E8178E4692D9EF04B46BD12F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10144
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF0000A797.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	04730669-f88c-4e86-2b4c-08dd868457d3
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|82310400026|36860700013|376014|35042699022|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Tlk2TG5ZaFhRMlhZRkZWOHJUc2N0U2VMZjhkRGZGZWpubzdhd0VEUC9HcExh?=
 =?utf-8?B?c2JIZDVGN2hmN2NKT09yNmhSNkMzQ3ZudnZZa0x2Ym9uWlRJUjJ0WHRZVzI4?=
 =?utf-8?B?QWJyN3IveWVSK2dlS2VSd1ZBMDRlMVhRY1oyM2kwYzhWMG9HMjEyTjhMZUdp?=
 =?utf-8?B?a05Vc3ZoVS9wKzIwOXFVbEcxODJNb3dGWmQ5eGE5ZTRDcm10R0VPZ0JjUFp4?=
 =?utf-8?B?L3F4WU5KVjg2ZFM3SWVKM0ticm5oNGdyVDdmZ1BoUWNDdGx6ZUkxV3E1Zklx?=
 =?utf-8?B?REFsa3BxZDhRWFFYVlgwYlA3OTRlRVRhSFJUTTNzWlUyQ2x0cUh3cFVhNXRq?=
 =?utf-8?B?K0YwbjAwakpxV2grYUdFazFUZkVQT2cyYXIwcnlnT1JKdTZXUWcxcmt4OHVF?=
 =?utf-8?B?MmJ2OEVZMEljWXJ5OXVFSWNRNThuOHMvNHBqb21aTTNaOHNPNVBkS0ZWZ0pi?=
 =?utf-8?B?eW1jQlJ0MHphV05Bc0pheEpVSWswVFJyQzhwaDM1c0FlQWJZNjlWd1ptTkR3?=
 =?utf-8?B?NDhFeCtyN01uMnU3MUdkSkZXbXJtVmZUcDV2d21zSHhid291OThOT0pGZFQr?=
 =?utf-8?B?M3RDcTgvOFpsNUk0UjhCTFFiRXpLbk5mSEZJNkpQVWp2bXVLQlpQb3FCc205?=
 =?utf-8?B?ODBQdElwQWVWMmQ3WUJZdS9pai9UOVRzNWVUMEt1K2NIL0NCRU4yZUJ6WDAx?=
 =?utf-8?B?NC9uU1ZKVFpIeWNXZ1VXa0dyMmJ5SzdwL2ZILzhOVWE1cWw5OUx4SE56NDNk?=
 =?utf-8?B?M0NRd0JWcTMxd3pSSmdSdWNqWUNocU1EUUVSNjJxT2ljUEVHS3UzUnJodGFy?=
 =?utf-8?B?am9RTlZoL1hXc1NQRDE2RDJOb0lHa09TYzlmK1lBb3JkOFgyL0FpRjhYQWxz?=
 =?utf-8?B?bmFCa3E0SG1xcGN0MGtIVS9lRVBhVG9HdXhxdlE1ZFNOaWJ6eHc0VTVHblpi?=
 =?utf-8?B?d1NEQi9FMVRvZDdTQVlib1lqc29xZzUxT05mcmNyM3QrRG1EWXdlQ1llaTZM?=
 =?utf-8?B?S25PR2JVSWJWY01FRDJyRHNWWTRTc1Z3bzBWMW9LL1ZBK0JXVW8xTlFONWJK?=
 =?utf-8?B?bWdJTGg4eGdvRWZCbkF2QlptbzM2Z2QvcXNsRHY4alhXODczRk9DbFhXWGph?=
 =?utf-8?B?ZklvK0RHQ0NiQ3NhM3dZZG9IeENuMm5JUTdvbnU5YWxZZkRIVnBGTWJWaUdM?=
 =?utf-8?B?dkw2NFRuU2NUaTRTWUJCZjVUWVQ0UlR2dk9wU3dyeE1kNVRzb054MHA2RmV3?=
 =?utf-8?B?QnUvRTdka1lsWEVFYU1xN1l5emFUVCsyNEtoeUJkWFNlOUlHTlorcDFSK2gx?=
 =?utf-8?B?OFBtUElDclhENmNDSHF2eCs0ZFlTTmUzRWFETkJPR21JSkNydkFEUlFBVFRy?=
 =?utf-8?B?eUYzMkVOREFrS1NOMEU4SWpmcThDeVpOenVuTzNrczY0MlVYRStlN2xVTzlw?=
 =?utf-8?B?UGc2VzE3T2RMN3RKOXlzUUZzSkdlWnpnNnlOSzlZMmRXejJEcUREa1N2NHpy?=
 =?utf-8?B?dStFQ0Q5SGYvMTN2UGVpaWVvKzR2dEo1eVNoR1VLd3NaM3BoWEdPaTV5Nzd2?=
 =?utf-8?B?WVBiVzdjeDkwbHZaMXNVN29oN1lROXAraHRkbGpab3pXTEUxaXFPak9hTHo3?=
 =?utf-8?B?UU03NTVwbDk1Ylg1NXA4aDdqTEFIcTQ2OHpSM2pqTkVUT21ucm10dHBsYnNn?=
 =?utf-8?B?ZHRNbElnYUlCSnZDQTVjeUZFczRsQWM3VVhieHRtZlh1TlQ4VC92M3hiSUFj?=
 =?utf-8?B?MG9zR2RpK3NLZTh0OEJJd0F0d0FwdzhNNnUyeXZlb05oTVZvcG4yTVkvRW05?=
 =?utf-8?B?RUlObUZzVlBUZktvaEMwL3J6cU42MU02a1VwMmVUZ2pUWDdJQzNEdjVUNWJq?=
 =?utf-8?B?RFduMDF6cHVTVlpIRGwyYWFReVZiZSt6djlKK25STlh2dXV4cUdxSWoyOTF5?=
 =?utf-8?B?SFdOSmVaUFI4VVV0RHN4dG1PL2ZqRi8rZFp1ZTBZRVBLNjJnTmRCTkVrYkV0?=
 =?utf-8?B?UDk4Q3FWOHpkbVZtWG8vM0JaTmtvWnVFSFZUUGVmcmZEajUyQXRMQkJNbnNI?=
 =?utf-8?Q?ZFQ7US?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(36860700013)(376014)(35042699022)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 18:42:25.7607
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7707b64a-0fd1-468e-877e-08dd86846bc6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A797.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10423
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 18:42:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215632

DQoNCj4gT24gMjggQXByIDIwMjUsIGF0IDE5OjMwLCBBbGV4YW5kZXIgS2FuYXZpbiB2aWEgbGlz
dHMub3BlbmVtYmVkZGVkLm9yZyA8YWxleC5rYW5hdmluPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnPiB3cm90ZToNCj4gDQo+IE9uIE1vbiwgMjggQXByIDIwMjUgYXQgMTc6NDksIERt
aXRyeSBCYXJ5c2hrb3YgdmlhDQo+IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPGRtaXRyeS5i
YXJ5c2hrb3Y9b3NzLnF1YWxjb21tLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToN
Cj4+IEJ1aWxkaW5nIG9mIGxpYlh0IGZhaWxzIHdpdGg6DQo+PiANCj4+IC4uLy4uL2xpYlh0LTEu
My4xL3NyYy9SZXNDb25maWcuYzogSW4gZnVuY3Rpb24gJ19nZXRfcGFydCc6DQo+PiAuLi8uLi9s
aWJYdC0xLjMuMS9zcmMvUmVzQ29uZmlnLmM6NDIxOjIzOiBlcnJvcjogdGhlIGNvbXBhcmlzb24g
d2lsbCBhbHdheXMgZXZhbHVhdGUgYXMgJ3RydWUnIGZvciB0aGUgYWRkcmVzcyBvZiAnYnVmZmVy
JyB3aWxsIG5ldmVyIGJlIE5VTEwgWy1XZXJyb3I9YWRkcmVzc10NCj4+IC4uLy4uL2xpYlh0LTEu
My4xL3NyYy9SZXNDb25maWcuYzo0MDQ6MTA6IG5vdGU6ICdidWZmZXInIGRlY2xhcmVkIGhlcmUN
Cj4+IC1FWFRSQV9PRUNPTkYgKz0gIi0tZGlzYWJsZS14a2IiDQo+PiArRVhUUkFfT0VDT05GICs9
ICItLWRpc2FibGUteGtiIC0tZGlzYWJsZS1zZWxlY3RpdmUtd2Vycm9yIg0KPiANCj4gU2FtZSBx
dWVzdGlvbnMgYXMgd2l0aCB0aGUgZ3JhcGhlbmUgcGF0Y2g6IHdoeSBpc24ndCBpdCBmYWlsaW5n
IGluIHRoZQ0KPiBhdXRvYnVpbGRlciBhbmQgc3RhbmRhcmQgcG9reT8gSGFzIHVwc3RyZWFtIGJl
ZW4gbm90aWZpZWQ/IEhvdyBjYW4gd2UNCj4ga25vdyB3aGVuIHdlIGNhbiByZW1vdmUgdGhpcyBm
bGFnPw0KDQpJ4oCZbSBfZ3Vlc3NpbmdfIEdDQyAxNSwgYnV0IHllcyB3ZSBkb27igJl0IHdhbnQg
dG8gZW5kIHVwIGNhcnJ5aW5nIHBhdGNoZXMgb3IgZmxhZ3Mgd2l0aG91dCBtYWtpbmcgaXQgY2xl
YXIgd2hlbiB0aGV5IGNhbiBiZSByZW1vdmVkLg0KDQpSb3Nz

