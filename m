Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93F60D1BDD8
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 19:40:49 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24761.1764790842821325002
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 11:40:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=P3LHROz8;
 spf=pass (domain: siemens.com, ip: 52.101.65.53, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UWrbNhybS2b4XKi+d6PxsaFz1I57rJ2jABdpze+nk5t3vKwdIwCUs3Re3IpRU6pyjm7/DPBZ3V7AKxjzMHehUUK3xOqdmRfpu1VdMx0CSYwt73cV+eR8jl/LxubLp9En6UKe6RN3bqfFiw+692klLK3gec2No20pGShrLUi1X8FFp2yAWz+ZaxSxyRO1SFCtjX4rRwGWWHXi8H+l+e26LtG/j3txStaNfURVim6J8zx6KF56WBtlk6pCmN/WYLF0xQlu+wBN5F7iymZaH+2FEUTG3wIDhg4aMsI3anxZFr4O+kV4PEn8WVI9sKzRQ4qsB199mOoPPFp5LIuLjJPlgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jcNjyvpFmXRx9OHdk8/EHclByrfcLZ6BaHqAFiq0a5w=;
 b=zOl4RqKkmOxquH069GBwRYqutNdEeZ0lrdT0Ops095mfPYLXtNw1PB6pi6acsXP/YBHP2fQCTMKc1AHJjPANCSxSnRu6tm42kooNy8ccQvltfGMKI+EAeUWobjN0r6xxeAYjrv4cLfM4SgtLIVwQkYHXRoT8JdH9OEFVOAZpIGu65gV2ZviZs/shUrDpqj4y2orQrljoKfwoHc+2U1O7owGV14K96pOfqtrEGoSkn3orS/l6NR9AJynQcsRQmf1WXcjJWdMQhTfAtz4XdPFQMF25FMH/IID1F8OlNhTCtvV9u/cuec4Njp/EqVFOhMEFiev7BJoXFza1bTAntNx4+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jcNjyvpFmXRx9OHdk8/EHclByrfcLZ6BaHqAFiq0a5w=;
 b=P3LHROz8jp6t6zrSf0xyGpeNwKeLnO1uAW12lZFk9R3/9SI5w4pr4yRRfSGcjUvoSaRfem45bJMzPY/D3JYSx7lEz6sNyXVb/Fae3f9w2DTParo0JMEHfGzaykQotOpjUYqLi63MUYGr4cPHTuvB+amX3QEUta5k3JVlM4+mLW2bEaKhfwdKYoROLEqc3OHuDo3UwCmYXsEUrRYhOryhxYuq3NQ0YbKV2oixPGIjyrxZW3uv9xJoSHZHM0lsAZb9/255s0yf3mPUCSaP4CExN9dZ42BQnpsRKnCHaiK7fombSsj7hRoWNGqoXBAwnm4ITaHz1ugPxU++zf+w9obV1A==
Received: from PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:266::11)
 by PAXPR10MB5760.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:24a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 19:40:38 +0000
Received: from PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4144:34cc:64ca:dd9d]) by PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4144:34cc:64ca:dd9d%5]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 19:40:38 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] gnutls: upgrade 3.8.10 -> 3.8.11
Thread-Topic: [OE-core][PATCH] gnutls: upgrade 3.8.10 -> 3.8.11
Thread-Index: AQHcXy0wYJ+Jw6JWY0ij7T46/KFtdbUP3i6AgAAAWQCAAEUzAIAANySw
Date: Wed, 3 Dec 2025 19:40:38 +0000
Message-ID: 
 <PA4PR10MB5707CA848ABA181B3F2257C3FDD9A@PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM>
References: <20251126233410.1243674-1-peter.marko@siemens.com>
 <DEOKMWAUSBXZ.3H75N1QP1X7EH@bootlin.com>
 <PA4PR10MB57079BFF02DCCF78C2819034FDD9A@PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM>
 <DEOPXHBWOJX5.1IS9KMOWMJAGQ@bootlin.com>
In-Reply-To: <DEOPXHBWOJX5.1IS9KMOWMJAGQ@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=f1204979-bc3d-47b8-b8d3-f8e32806574a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-12-03T19:39:59Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR10MB5707:EE_|PAXPR10MB5760:EE_
x-ms-office365-filtering-correlation-id: a1160c1d-eeca-4037-a075-08de32a3d63c
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?dTRzQVQvZStFcUZqVWZMSi9GblhGVUhEcnI4QnFPNTc3OVA2WHlVK3k1dTlU?=
 =?utf-8?B?Vk5CY0h6SzhITmdnV3dKNFRoVDhkNGpjdVBrZEVzN0ZMc3RkWCsvamhRbkRU?=
 =?utf-8?B?MSthbHJWck5wYXAzRlhxeHhXUWFuTytVbnNGaFNXVzdHZEg2MDRuUTRxQkN0?=
 =?utf-8?B?REJUVW9MUG1mZk1BQk1hSUZhV0dmTVZwU2FFMGlFelJhWXZSOThSQU9mNVlN?=
 =?utf-8?B?Yk5xaGVTMGhsK1QxNzNrbGhqM0RIVktneDhTOXBtd2RoVTNiS08wL0dqNkMw?=
 =?utf-8?B?TCtBdzdJNVVXWnZqMkZuK3oyRWZRcmtqZ0xOZFgvNG1hQVZaMVp4SVBSN3Fm?=
 =?utf-8?B?NStJUkpGa0twOUd5VGorbkphaUxkTXZyeGtmaFlDMzNsWHhCNVlOcHlnVTIz?=
 =?utf-8?B?aXhrMGxFQVNRdzBNL0k2RUp3ZTlnZ0liZDRTVXZlOVNiT3pzemZDWk44MTBQ?=
 =?utf-8?B?dFVlc3c3Y0phemtjK2FibXlrdFNDMWwrY210TDl0Q2loQmkxaFZkSVBzN1B5?=
 =?utf-8?B?OHhCcU1BblFwR0ZEa3FwMlVvSFRYQkRKcm9HMjRtSVVFV01IQXE5bnZuQzA3?=
 =?utf-8?B?dWNEQ0hYeTZPT3VTamo2T3M0OGg2enZJSFk1QmZGeXVMTmZ3cE5yTWc5bUgz?=
 =?utf-8?B?RlFtV2krdTVLRERhbzA1M0lIUmV5cWdkMG9QZjNJaG9zdXVPa05uaHJBdlZy?=
 =?utf-8?B?dUt4Wkc0dlFFSFpIZFk4LzlvNitFYk5jd0FCREc0K09zSWZNcjB1MnNnbUdR?=
 =?utf-8?B?MjdMMFJPekw1eHhXN3NOQ3V0K0N0UXo4a1FYU3VPOVpoY1JoaE90U2t3Tkxu?=
 =?utf-8?B?NW9SYUVzQkdqRnJjelRFUkVOQmZsZ3ltQ2IyL1NVL29nYlNFZ29aS3h1QUxa?=
 =?utf-8?B?M0k5TmgxV0FpVFRTTFFHbk9FOFFnL1FHYmFYOHRTK2VnSi9CNkJ2Vjdremlh?=
 =?utf-8?B?NWRYbUovelV3RzU4NUIzT1gzMVUrUFppT0Z4NndJaHVCdUN6eFA1akNuUE9J?=
 =?utf-8?B?OFBHOVRENmIrMXV5cklMd082b21wVTRYWlRENld0eHJZbWNoc2x6bmk2Wkh4?=
 =?utf-8?B?TzMrU0NkTWtXOVZxQ0F2SzNOQTRhRlFsc01IL29ramNjTW5HOFhDWUkrdU1m?=
 =?utf-8?B?OGcweFE1bDI1VFdoSVEvbEtpdC9KcUg5SlQwUGhhZzNmVHg5aTBLaHFpL24r?=
 =?utf-8?B?U0JTZmtNcGJRSFQvTDh4RG5oTEN2YUVNVGpJSURtM3RNY25uNDBVb2xCalJt?=
 =?utf-8?B?eW9SZXBwaDBFQTVwTUJWcVF6dU9qNGYzQ3VLKzVmdDhLTzduZlhHUFROV05C?=
 =?utf-8?B?WFV4bDVPR0ZhNXRyKytvR1BkMGlNNGl6cmR4U1RRZ25rNDA3eHZkWCtYeXJl?=
 =?utf-8?B?a2JsNFRxQzVhUU5ZUTVoS3hTeXpaNUlkZFF4YXhnMW1kNHRJNkNqRDFyYytT?=
 =?utf-8?B?Wkl3ZURucndXM2ZXQnhCbVF6WktEYXFJSGN0bzlNZzd1ZjlKSUt2dzd6WVpz?=
 =?utf-8?B?cnRoalVlWE1KdGFlcHRDd1Q3OVQvdlNVdWNyQ25mWGY4L2k2SlcveWlSM0hS?=
 =?utf-8?B?MjdPaHFSQmc4MUF1YUMwZ2owbW1yUGE1UHBmUHpncUdLZ05DOVh4TlFOWEEx?=
 =?utf-8?B?QVl4Tm12TGgwZVNtRFdVYy9pd2JhdElNY2kxWUgwYWJodXVIQ3lOZGx3dnV2?=
 =?utf-8?B?NURBa25ITCs4R2xoNjVFV2Y1bFZ6VXZwRVY4UldtWXpTbFR5dnlJSW5TYjJZ?=
 =?utf-8?B?eHN5azB2MjUwcU9vNTh5UHNIOXVXcjJ2aDNSTkJYbVpZQ2ZycXdFWWZDZ2FE?=
 =?utf-8?B?VUdVNmFTOVdXSVZEODdzNHZFaDFQV2gzUDBXY2NnVTk0VUFCRmZITmFjQjRi?=
 =?utf-8?B?YnhMYVYybjVlQS9HUndIMzNBczFyVC9NODNNRTErbXNyVnB0aEllbjhDVWZI?=
 =?utf-8?B?byt3UlJNNEZ2YUNtckhTV3dtS0V0dlpWbTd3SDV2eFkzTysvS1Y1RW9FaytR?=
 =?utf-8?B?Vk40NERyWHBBPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?U0R4UGV6WVIxN2VYVUR1V2I2WW1yMjFha1BJRnVlemdUcHY0SjF6aDYwOW0x?=
 =?utf-8?B?N0dnd3NuUzFuOGZFSmdnQlJQREpSaFF0b1AydFZpSU1xRkxrNTZ0K1JYK0d4?=
 =?utf-8?B?bmJ1RGtjWTF0ZmduWGpRSXZSQUhPM0NhVkc0ck90YjFvT1BaeEN0SHRBaU5x?=
 =?utf-8?B?U2NQaTdLRzFpbW1wZnlaOUl2T3FwMDhvRDIvVnBmSEZHb1c0dnd6eUdBUitN?=
 =?utf-8?B?RW42NmxxVWxiN05KN0FDc1ZMb0wxT1h0cUl0WEZUZmx5dHI4T0c4KzdkTmxR?=
 =?utf-8?B?aEVVTWpBblo5L0cyOGRzc0JxM3JpeFhaeXBNYXdSNDR0RUt0OXlhTVMza1Jm?=
 =?utf-8?B?NTJiWFhhRk9KTk1QcnBRYVVveUs0N1o1T2hSeGd0bXdmSE1WM01vR1duU3pl?=
 =?utf-8?B?UVdhcTcyYkd1TFZHWVlPWUg1TlBrWmNWWHZaOHpDbWFnZ2xuUk43SGYwb0tZ?=
 =?utf-8?B?RERha0hSQzVEUFN5aGU3S1IzcGZwMGgxRUN4clg4ZjJKeU0wQ1MvRFdlSnk2?=
 =?utf-8?B?LzV6bUFleEZRamFaTDBUMkhjQ1U2Um40ZzlLN0pGMjBqNlZORlp2dUE5WkNH?=
 =?utf-8?B?cXdDRFJCR1p6cnZ2ZEx6eEtNQWduaFozSmMvMjhvMnpicFNzTFA0TVJMRkhl?=
 =?utf-8?B?OTJmdi9JODN5S3BXbTc1THY2VVFjbUZna2MvUkZldTgzQVZIWHdSeWxjUzM4?=
 =?utf-8?B?VE5Zb3dvaVpmVk9vYmp2SUViM3lYL082TW5kSUNYMWpKd0FHMHZWSUlMWHli?=
 =?utf-8?B?a252aFB0cmZzRkM5SXFqNERTTHZ1OGNXaEt5U05DYWVrdW9qdDFxQnVQWjlt?=
 =?utf-8?B?SE0wQlBxcVFxVy9SQWRodnRtTDJJRExQMTdIVGlFRHRIN3EzWVhZaW5QeEpp?=
 =?utf-8?B?NVVBeTNrNUlIdzNaQWk4NGZrTW5NcnBLeUhjT0dJbU5NSm5jTEdaM3M4eEMr?=
 =?utf-8?B?YWJ0TVRsR1VhdExLOXpVdDJ6S0NSMTkxSTdZalZDc21tVlNoNEpHNy9mZlE4?=
 =?utf-8?B?YXNtVkFHRTJoMnNDczZ2d0sxU2pkNnE2YlJnaXRHRVRIUGYzMmdraGV2a3BK?=
 =?utf-8?B?UGZTNHA3YTJHcElBRnZqNnJhWXQ3Y0xvQ3FuNml0cFcvM1QrZ1N5M25wN0xZ?=
 =?utf-8?B?eFhVRmYwSENxTzlnRytlRWZXeVNJeTQ0WWlvSWN2aFRsaEpKZmcyaDN0QlNT?=
 =?utf-8?B?QzFTbXo0RDVrMlJrckR0cVFUR0VsQk9CSzJyN1o0cWIxdXovaHJqS3VPZkNK?=
 =?utf-8?B?Q1JjQzhtSlNxSVdKOWVrUFUzUCtSaWVhM2cycUk0azBrMmhyaVFKeVd1Wmo5?=
 =?utf-8?B?eGNvMW1TeGphL0JmUWxQYXNWaXVqaW5LeUNYOVhzM05sbWZSdWkvOWJjUHdV?=
 =?utf-8?B?eElrWjQwQmRuSXAxMVY0SVpKQTFkVEFndjNSUmhjQ2NXdEtydkh1TU0veGtq?=
 =?utf-8?B?SGFGS2xYNWtDcnRGdDcyUzVaNGhIbG1Vb1kwV1pnSGRXZFIvWVFZRTRUNzVw?=
 =?utf-8?B?T3p0NGovOFViY1BFYVZJSE56eTdiN1g5ZVVUcmNuNUt1UDZOS3BXbyt3OXRh?=
 =?utf-8?B?TzFzRTNCT1YzN1YzMmlnTUlseFV5eUllM01IZ1F6ZW9aWFF2dk43aGhQQ2hY?=
 =?utf-8?B?S1FERWxyclkwMVF5MlFLdzVUa1hCWEtKdDJFWEtxN05FemU4SmNzVzhXUmNU?=
 =?utf-8?B?d2o3b1QxSkJEVlFuRFFOZ2ZpRTBrajN0cWdXL1hqNWNSYVcwZE03MDVtbmdr?=
 =?utf-8?B?NHFKNVdlTkdCcWxRamswdGV2eFp1MUZxR1RFTkVQL0p4cjhtbGRvWmpFMXg3?=
 =?utf-8?B?SzAzQnU0SW91a3l6K0lsNGtyR0w4eXJZOEpjUlMyMkVsSUhqeXR6b2VKRi9G?=
 =?utf-8?B?aWJZbXluZXplL09UdERYZURNWWg3UXdJNU91Qm55R3NxaGsxWWJYUCtGSGpM?=
 =?utf-8?B?NnduT1BHVFRKalBUNnNUd01XTElESU5LajlJN1c4ZWNueUNoZVI4WTNQNFJU?=
 =?utf-8?B?Q2FRei95VG1OelZVd1pleCtoeHVGblVLMmphK3U2K29RVVNZTFpoUXgvS3Ev?=
 =?utf-8?B?UnpiZ0lNemRPdmEvRy83cmVHMjNKdENLZ25kNGRWeEVFczZHOHVRSkYrQlpp?=
 =?utf-8?Q?p24cEypFGI1ZmlXYfAZKt3WXB?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a1160c1d-eeca-4037-a075-08de32a3d63c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2025 19:40:38.7916
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +n6Lh1lwQqQvA2Y4ky3/3t0mCbR4HNAFbm0Ezov/MuRvwgFiSMT3rgFaA+XdKIrZ1X4Q27+MOjFJ7Z0ndvpzhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB5760
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 19:40:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227238

SSBoYXZlIGJhY2twb3J0ZWQgcGF0Y2ggdG8gZml4IGJ1aWxkIG9uIERlYmlhbiAxMSBhbmQgc2Vu
dCBhIHYyLg0KUGV0ZXINCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBN
YXRoaWV1IER1Ym9pcy1CcmlhbmQgPG1hdGhpZXUuZHVib2lzLWJyaWFuZEBib290bGluLmNvbT4N
Cj4gU2VudDogV2VkbmVzZGF5LCBEZWNlbWJlciAzLCAyMDI1IDE3OjIzDQo+IFRvOiBNYXJrbywg
UGV0ZXIgKEZUIEQgRVUgU0sgQkZTMSkgPFBldGVyLk1hcmtvQHNpZW1lbnMuY29tPjsNCj4gb3Bl
bmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09F
LWNvcmVdW1BBVENIXSBnbnV0bHM6IHVwZ3JhZGUgMy44LjEwIC0+IDMuOC4xMQ0KPiANCj4gT24g
V2VkIERlYyAzLCAyMDI1IGF0IDE6MTUgUE0gQ0VULCBQZXRlciBNYXJrbyB3cm90ZToNCj4gPg0K
PiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IE1hdGhpZXUg
RHVib2lzLUJyaWFuZCA8bWF0aGlldS5kdWJvaXMtYnJpYW5kQGJvb3RsaW4uY29tPg0KPiA+PiBT
ZW50OiBXZWRuZXNkYXksIERlY2VtYmVyIDMsIDIwMjUgMTM6MTQNCj4gPj4gVG86IE1hcmtvLCBQ
ZXRlciAoRlQgRCBFVSBTSyBCRlMxKSA8UGV0ZXIuTWFya29Ac2llbWVucy5jb20+Ow0KPiA+PiBv
cGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4+IFN1YmplY3Q6IFJl
OiBbT0UtY29yZV1bUEFUQ0hdIGdudXRsczogdXBncmFkZSAzLjguMTAgLT4gMy44LjExDQo+ID4+
DQo+ID4+IE9uIFRodSBOb3YgMjcsIDIwMjUgYXQgMTI6MzQgQU0gQ0VULCBQZXRlciBNYXJrbyB2
aWENCj4gbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+PiB3cm90ZToNCj4gPj4gPiBGcm9tOiBQ
ZXRlciBNYXJrbyA8cGV0ZXIubWFya29Ac2llbWVucy5jb20+DQo+ID4+ID4NCj4gPj4gPiBSZWxl
YXNlIGluZm9ybWF0aW9uOiBbMV0NCj4gPj4gPiBJbmNsdWRlcyBmaXggZm9yIENWRS0yMDI1LTk4
MjAuDQo+ID4+ID4NCj4gPj4gPiBSZWZyZXNoIHBhdGNoZXMuDQo+ID4+ID4NCj4gPj4gPiBbMV0g
aHR0cHM6Ly9saXN0cy5nbnVwZy5vcmcvcGlwZXJtYWlsL2dudXRscy1oZWxwLzIwMjUtTm92ZW1i
ZXIvMDA0OTA2Lmh0bWwNCj4gPj4gPg0KPiA+PiA+IFNpZ25lZC1vZmYtYnk6IFBldGVyIE1hcmtv
IDxwZXRlci5tYXJrb0BzaWVtZW5zLmNvbT4NCj4gPj4gPiAtLS0NCj4gPj4NCj4gPj4gSGkgUGV0
ZXIsDQo+ID4+DQo+ID4+IFRoYW5rcyBmb3IgeW91ciBwYXRjaC4NCj4gPj4NCj4gPj4gSXQgbG9v
a3MgbGlrZSB3ZSBnb3Qgc29tZSBidWlsZCBpc3N1ZXMsIGF0IGxlYXN0IHdoZW4gYnVpbGRpbmcg
bmF0aXZlOg0KPiA+Pg0KPiA+PiBFUlJPUjogZ251dGxzLW5hdGl2ZS0zLjguMTEtcjAgZG9fY29t
cGlsZTogRXhlY3V0aW9uIG9mDQo+ICcvc3J2L3Bva3lidWlsZC95b2N0by0NCj4gPj4gd29ya2Vy
L3FlbXV4ODYtdGMvYnVpbGQvYnVpbGQtc3QtMjk4MjE2NS90bXAvd29yay94ODZfNjQtbGludXgv
Z251dGxzLQ0KPiA+PiBuYXRpdmUvMy44LjExL3RlbXAvcnVuLmRvX2NvbXBpbGUuMTgzNDA5NCcg
ZmFpbGVkIHdpdGggZXhpdCBjb2RlIDENCj4gPj4gLi4uDQo+ID4+IHwgSW4gZmlsZSBpbmNsdWRl
ZCBmcm9tIC4uLy4uL3NvdXJjZXMvZ251dGxzLTMuOC4xMS9saWIvYXVkaXQuaDoyMiwNCj4gPj4g
fCAgICAgICAgICAgICAgICAgIGZyb20gLi4vLi4vc291cmNlcy9nbnV0bHMtMy44LjExL2xpYi9h
dWRpdC5jOjI2Og0KPiA+PiB8IC4uLy4uL3NvdXJjZXMvZ251dGxzLTMuOC4xMS9saWIvY3JhdS9j
cmF1Lmg6MjU1OjIzOiBlcnJvcjogbWlzc2luZyBiaW5hcnkNCj4gb3BlcmF0b3INCj4gPj4gYmVm
b3JlIHRva2VuICIoIg0KPiA+PiB8ICAgMjU1IHwgICAgIF9faGFzX2NfYXR0cmlidXRlIChfX21h
eWJlX3VudXNlZF9fKQ0KPiA+PiB8ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgIF4NCj4g
Pj4NCj4gPj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllLyMv
YnVpbGRlcnMvMjgvYnVpbGRzLzI3MjENCj4gPj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3By
b2plY3Qub3JnL3ZhbGt5cmllLyMvYnVpbGRlcnMvNjMvYnVpbGRzLzI2MzINCj4gPg0KPiA+IEhp
IE1hdHRoaWV1LA0KPiA+DQo+ID4gb25seSBEZWJpYW4tMTEgb3IgbW9yZSBob3N0cyBoYWQgdGhp
cyBwcm9ibGVtPw0KPiA+DQo+ID4gUGV0ZXINCj4gPg0KPiANCj4gSXQgbG9va3MgbGlrZSBpdCBp
cyBpbmRlZWQgb25seSBvY2N1cnJpbmcgb24gZGViaWFuIDExLiBJJ3ZlIGxhdW5jaGVkDQo+IHR3
byBvdGhlciBidWlsZHMgb24gb3RoZXIgd29ya2VycywgYW5kIEkgY2FuJ3Qgc2VlIHRoZSBpc3N1
ZSBzbyBmYXINCj4gKGJ1aWxkIGlzIHN0aWxsIGluIHByb2dyZXNzKS4NCj4gDQo+IGh0dHBzOi8v
YXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy92YWxreXJpZS8jL2J1aWxkZXJzLzI4L2J1aWxk
cy8yNzI0DQo+IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy92YWxreXJpZS8j
L2J1aWxkZXJzLzYzL2J1aWxkcy8yNjM1DQo+IA0KPiBUaGFua3MsDQo+IE1hdGhpZXUNCj4gDQo+
IC0tDQo+IE1hdGhpZXUgRHVib2lzLUJyaWFuZCwgQm9vdGxpbg0KPiBFbWJlZGRlZCBMaW51eCBh
bmQgS2VybmVsIGVuZ2luZWVyaW5nDQo+IGh0dHBzOi8vYm9vdGxpbi5jb20NCg0K

