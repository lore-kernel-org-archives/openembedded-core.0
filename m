Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC678CFD635
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 08:16:39 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.16])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2193.1767860197990071012
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jan 2026 00:16:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector1 header.b=YLQCRLoX;
 spf=pass (domain: ericsson.com, ip: 52.101.65.16, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jWItxIfId72SwqHL7JgfBxfJkIP0yuYZWwKCaU7EJMJpw3gO3Ev6sQjQx+YtVqv2SVyE6qf3Z9HJVHZxJMUrdVTlJG96S1Oevt7ogoOuPiarfutT0AlsVy6sFXqevVnURWTQNUPFCGggykgL0LlGcp0nRLkdzuLqVmQDk7dMR3suQzWMZzwCH83QC+ILOrxDQb1jASHig9vWGcmUf7szFSo/+jqz+rbi+qy5ixUbr/+dztei5q7xaXTPjyVlMMI4rgOgHUoJimND+cVOeULZj1Y7EpYDydXbzU5zylfo5U/n1Zfy0UUbgcdZSqcYAvBzXzXQr04AHi4o9ffkeaIx6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hwNg6Sag6oNRI6Sgf+gkw7s/EyTP6I9B3Mwmy7dM9Hw=;
 b=wv/y4pMTsnqFlCAzNJhILdhtQMtLrFIBlLOp3sTd8pGiPFmyUlss4klSv5s4E0qwQa9CgTjtJFJPMJQDUoKM8VQyS1QrhKIvxZbpSAGgdQHj6PE+82z2TVhrcoY/twZekr4RoraCwJqr3qK6XNjUdcO8/UcmydTdmLj1F7i9RcD3IIrPIR5Uyckh9WX4u4oeTqPIDufH3HpVbnwoBQ1LDQOPh5kmgJPG0yje7cV9nM47KCKcL9/znit3MRDsfkP++WRc9Z1HoQJotpMKlbz4SodGiXWb5fbqBlB0Ei2QhoIfh4L7pVAy7T83s944oPFoeVcW5k5xmqf8YqNS1RGacA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hwNg6Sag6oNRI6Sgf+gkw7s/EyTP6I9B3Mwmy7dM9Hw=;
 b=YLQCRLoXOGjIGcZdXpzd8R+fWrNKJGkup7VSQuvii3743b6fN8jKNzXWeO0MNy3dxE7Jy1d3XGPB41dnzA/KiGxIZOqBw+b97BoFVh18Ruwd5vTgtL7M/P9vZdrD51SO5YXBEmQ4eLCTUz41IyTOfYRGpu68cgugEGADir9vzrhQC2LmFbHenW276Ud9M0IqfpU+vuVIOUS7pkZCP0/6E0ztsEC7Kuhd8sLa2t7sRS28XhpNB1zdXNwxkNalOutO35wdOi9rhWwUghaqqNeBoF518KCN1vG7RJTbvNLL800/+ZUawKchcXRUTOCHGTRUz7Ql/XvXl980cqSbxOiABA==
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com (2603:10a6:102:4af::6)
 by AS8PR07MB9354.eurprd07.prod.outlook.com (2603:10a6:20b:61a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 08:16:34 +0000
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7]) by PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7%5]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 08:16:34 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: "valentin.boudevin@gmail.com" <valentin.boudevin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: RE: [OE-core] [[PATCH v2] 3/4] generate-cve-exclusions: Move python
 script
Thread-Topic: [OE-core] [[PATCH v2] 3/4] generate-cve-exclusions: Move python
 script
Thread-Index: AQHcf0Ab9r1fkevhKkCs2YmACzUPOLVH7wcQ
Date: Thu, 8 Jan 2026 08:16:34 +0000
Message-ID: 
 <PA3PR07MB10721F18495C3995F7D9E2CA58A85A@PA3PR07MB10721.eurprd07.prod.outlook.com>
References: <20260106191001.3385117-1-valentin.boudevin@gmail.com>
 <20260106191001.3385117-3-valentin.boudevin@gmail.com>
In-Reply-To: <20260106191001.3385117-3-valentin.boudevin@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3PR07MB10721:EE_|AS8PR07MB9354:EE_
x-ms-office365-filtering-correlation-id: 34147f8c-e5f1-43f6-681a-08de4e8e3c89
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?UWl5OXZ4MDN5RjhzT1RGSy92T013bmhzYjNDeVNHd24yZXpHUDFkcUZHRWlR?=
 =?utf-8?B?UzM2WUNzcGhEQ0hhbk84UHhaRDlOaW9oQ1h4SUV1OTlBWWNObHc3dEFqZ3ZX?=
 =?utf-8?B?U3FxVllsUU55V29pdE1DMWY2WExkUWNvU1RhMFAxSUVYU2RqUWxMcHJXN1BC?=
 =?utf-8?B?ZEd0WHRWSFFxSk00bjFYRTVmOWFjWnExckdzdCtDY0t1MmFlNWF6c2NRKzNs?=
 =?utf-8?B?VlNaMFlTaTNoN3FuODdtYmFjYXkvS3J0NzZybnk3aDh0NG1tWVRuU09UMXRx?=
 =?utf-8?B?VjRJTytvV0xoOGwwdzFKQ3lHeHIvZWd0dmxMVmFhTDVPQ3JJYVBFZW5pQ2No?=
 =?utf-8?B?cUpIRnVoWHVYdkxMNElUMHIzdWZOR1kxMjIwL1FJRVIwSG5MMDJMODNsckVn?=
 =?utf-8?B?NzFOWEtlL1pkdy9GYnp6a2JEelZkQUl3RGg3ejZqNk9Fd1F0NFhCSW5JWWVD?=
 =?utf-8?B?Q1lYL1hBTGZOR043dFNBdk5jWlFCbzZvN0VrTWljeUk5QnRKYmpraVFJUWk2?=
 =?utf-8?B?c2s1THN3cFhnZnp4SjRsZkVIdDJpNkhRY3BUS2RaODUxR0NycTNTaW4rS2ZW?=
 =?utf-8?B?QlM5R0tySnVoRytNNWJFdncrTko5blNOeUFuYlBiTjVvRndxYlhKNjRUazl1?=
 =?utf-8?B?VW9lT25uSUNpM3JvaHhRb2haa29UNk5QbmdFWVExazNMaXA0SVhkMC84OGVL?=
 =?utf-8?B?UjhzNXloSHhzVlh6ZzhMb2lzMFRYQTdXRmlSQmw2YWIxOFZhcGo4Z2hNbm0r?=
 =?utf-8?B?OHVPQzlBOFRNdy9YTUNWcmo3SjNlcU9ZSyswZGVOWGluTHY2eGs2bnpaQkx5?=
 =?utf-8?B?aXBmOWVzaWY2NEVPQ2xlVHg1RGtQRC8xZVV3YnFDRlNJckFQOXA5Mk1SempY?=
 =?utf-8?B?UlpIR21sKzJ1THJEby8rU1ZEUlY3UWdmbW1TTVlFSlJOM0ZNVzByL1F5TkxN?=
 =?utf-8?B?QXZDYkhIWWxQMGNkTlhDZW5Famo4MUE4RlFFTWd6ajVrZTF4VG1UWWdUT2or?=
 =?utf-8?B?bFFXcitNQWJ3cDQ1ZE9yVmtUWTJ3UGFqK1BPdmtSeWV1M1BBK2UvWWU1UEdr?=
 =?utf-8?B?ZUZFN3RpakNNSWJXTENtalRMaVBGdEN6c1lBdDBVUXI2bEFHWWl1Q2RGNnN5?=
 =?utf-8?B?ZHdTYzh5SkRZNTZOTTVUQXlxdkJ6aEwvcXpwWHF1K056TDk3VW9wZWl0dGdt?=
 =?utf-8?B?NEYxdEFLbXJZWDNBN1FXTWRFSzFndS9Sa3piYTRlN1JEV1MzYnR0bnpxWjNZ?=
 =?utf-8?B?b0FaZm9qdXYyRlFPMTEzQzlWdEhCeVFscDdlN0loWEJieGNXdTNJU0JZRlRQ?=
 =?utf-8?B?MHhxeERjekZLK3JSWnNOVUhWSGlmRTBDbUlYd1RRZi9DNFdyN24rMGxiSDky?=
 =?utf-8?B?d3E4UnlBTjVla0JlZVdIV3F1NDcvbm43Qmd1NEY4RHZLMFV4RHN2OUM4Mjdw?=
 =?utf-8?B?RDlua2xkcy9VcHpZYk9kOXc3ZzAyMVVNaTZJb3U1R2ZCbkJkd0NRZDdkRkFn?=
 =?utf-8?B?L2thWGhZeS9hbDRXYmJRNFNiK1ZSNXlEeS9uUkdPMnpqT2VoQ0YrYW82STl1?=
 =?utf-8?B?S2hrZHZzZkROTmxRMzR0WEZRKzhUUkxaTFF0WWVBNnN1WXVjZ0ZJblhwS1o1?=
 =?utf-8?B?S3hkWDNqaEhrY29sS3lTY3RGZmorN2NqUjJjT2l5TmszT3FJaGZlempROVlt?=
 =?utf-8?B?enJ1Si9pYjU0dk1BV0pNajNVc0tkT3BnczgzRHJ3d1pscGt6bk8rYkhGUDFv?=
 =?utf-8?B?dTRLczFDbWVrWk10UjVOVnEyMDVtSlRqNnVTMXpZcGFTYlZ1c3MrR3JEclRV?=
 =?utf-8?B?cDdEQzZsbnlTQjlOaWpVTDBHd05FYUszUm9sbTBOZU14Vk15dnNJOTNKTUN3?=
 =?utf-8?B?N0ZLOXg0OXRxYytPTGo5QmpkNUNpQ2tzSjkvbW5sVmVZUmZBZDQzWVBHM2Q0?=
 =?utf-8?B?Qi8weDlFTkNpVzVWRjVJMXoyWUJyZmpTNDEwSFhnQVJ5YkxLQlVmUCttTSs5?=
 =?utf-8?B?WURPenBFRzRRPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR07MB10721.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?b1RSZ2g0TjE4UVp4WDhtWnlsczMzUkF2Uy8xQnpXSlI4bHJRTzY3dldVVjBm?=
 =?utf-8?B?ZGVlNTFmV0pHQTdwRkVqak1IaUJNanNNdTgyR0ZKTjYrTk9QbmR0K0t0UDhs?=
 =?utf-8?B?VS9SSE1zWGNVNWpidGsrVS9NcGovK3RHYVc4VjhDaG1aNk9UMUxsYkdrZkRt?=
 =?utf-8?B?RllZZVhyV3I2M1djUDlsRmMwTlNSeGYwYVdxY0FucG9WbnBWNml5bkxWZTBW?=
 =?utf-8?B?RWxZSTJwcjVsemg3UCtjM3VBTCttckFOdys1dVh4bWwwSkV6cVFHY1RjOGh5?=
 =?utf-8?B?MDd6MlN1cWs2WGdqZTAvTHJGNlVsVitmYUtkbG1mNnpNVVdDYkk4QitFd0Za?=
 =?utf-8?B?djJlcUtZN0dabFBndkNJYmY2ZVNBdnNMSGRSVzM4VVpWeGdtUXBMcnhKZWxs?=
 =?utf-8?B?K2FPanNJTXo0Z2NvS0xSVUZ6cVIvWTljUStxb0N4a2RUY1IvR2ZFdGJEUmJo?=
 =?utf-8?B?UWd0cFpUWWVEMDk0TkRDY1l5VEtnQzJHc1hmV1Y4UnZFbDU5bDdkcHVMamZF?=
 =?utf-8?B?d1h4djI1L2c3UmlnSS9iSmJYR2ZpVTFvQ3BrVXpqQVI4WWRLWGlFMFZBWktl?=
 =?utf-8?B?ZlkxWU5yZi9kelRrbzh5cWczRE5vVXR6akdjRVEwR2E0ZXNUTnZsdnlyYTB5?=
 =?utf-8?B?VkFxNFpzVGlQRFYySUp5WXNVdkpoUFhjeGV2Z0UxNVJ6bEkwRjZBNlBhLzhr?=
 =?utf-8?B?RW9NaGJiaUpZdXVWU3FJQXErcFh1OXZaYkVsNi9HK3lEU0kya2RkVjlkTTc0?=
 =?utf-8?B?ZFkyR293UlRqQk54YnZKZnpwc243UDhyZmM4dXVJVVc5Z2s0S3B2V3JWQkFt?=
 =?utf-8?B?U0F5eHNvZnluNkxNT1FQSjZVbzEwakdQaWl0S05sLzdLMEVKQ3FmZWNYczlV?=
 =?utf-8?B?bFZlMWNqTGhPTWlTQnJJaFY2eEpkZGsyWkhuSm1Vd1FYRUN1eUJNSjF2bDdv?=
 =?utf-8?B?TVFVOUhMajQrRkxQM2NmdXU1N3d4VHNJTnBkVVI2ODFWeHZiL2dxZXI0cXVL?=
 =?utf-8?B?UlZoZEtXTGJ1YVZybFNFS1R2dllQc0RnSzFMZTRRbUJ6MWN4dy9WYitYWDJs?=
 =?utf-8?B?TmQ3Rmg2Vnh2Q2VEWG5KT0dscnZWYW1nR2JSVVBFandCMGtFMUoyTnZVLzZI?=
 =?utf-8?B?NzltQlhlN01oMkJLYkVMVlpuQ2JnV1JjRFJ6Qk54ZHBBdFFDb3N3aGk4VURo?=
 =?utf-8?B?L1BRNWN1L3BLNVRXMW45NW9UVmMvSE4wbWJtb1lWOXZ4TnhxbUs0eHBHNFlO?=
 =?utf-8?B?U0s4d0FEVWdjY3hFSWk5eXVtcmlxRTFFY0F6TTJ3bkxlaTdyZVhuQWFmSG1n?=
 =?utf-8?B?Y05rczBKZHh1cURwTTRuRHdQUzFWeFJPQXBKQVY4YzdoOEpXZThKRzJ4TXRZ?=
 =?utf-8?B?WmFldGpMNm91WWJzdnJzYUJjTndaWVhtZFBUSGU4TlJlbG1MbkVmdHFVUzdz?=
 =?utf-8?B?dzArTU0rV0IxSWJGVHpNdVJseEhpWkl5QUoxdG5GNTVDT2lMZUJWZmZWOVFa?=
 =?utf-8?B?Q2p0VW1Bb29zV2JTOHV3WGtQRC9SWmhRRkNzZE9aYUxXank2MFZYNW9oeVRM?=
 =?utf-8?B?Ti9sQXBHblhtSVdWeGxoUzB3eXVqZDQ2bmVkRy96a2hub2JXUkRsSENBeCt6?=
 =?utf-8?B?MFVCeXQxQW5KanAyK3RPNmpXbHNUMFBybjMycEM2KzJVWlRFYi82R250VW12?=
 =?utf-8?B?L2djTHdrakFNMDlpQWJaRG9EV2FtK01mdE11UHlGZkFxTHVEY1hQTndERFNi?=
 =?utf-8?B?MVIzMW9pNVVsK0JWcVFTYWRpeFduUS9rWStqK2lsSXdrdG9pNkIrWUlRUkZ5?=
 =?utf-8?B?NkZKSDRxVWRXTVQ1eVlIS2NHcEdzd0ZpUE1BWHpmUEhuei9CVElvYktBSGlJ?=
 =?utf-8?B?ampxaWR6ZW5tbkpKbVVxUndaaCtCS3VxMVRXcUdvb1EyUjVPY1hpM1pGaVRI?=
 =?utf-8?B?SWxhTGc3TWZwYXZqZWFGZVRUbTUvWkIrQjVldHhNeEFqR0FYZlRCeUQrN0Zp?=
 =?utf-8?B?a3MvbDBuV0NzTC8wQmY0N1ZTNk9yVnhsaTYyS3B4VE0zVDE2SDQ4c3dpQmdL?=
 =?utf-8?B?RzBmV3FxNVM5Z2JJOTZkV2hyUmRMQzFrc2gzYmlVL3MvVW50NDFQc2c0OVpY?=
 =?utf-8?B?YVhLa2QvVVZOSVdWWDNGSlhiZmJPZ1BIbHVVU1FQMkNHL2xzOENQVW1nTG5V?=
 =?utf-8?B?c09jMEYvMHVPc0lNend2UzVoVTY3TkI4M1d5Rk45K21hOW13SGpQQitHZDVI?=
 =?utf-8?B?YTVRbStiRTlvM3E1d0RkTXcxM2xyTmlGOXFvSGdYZTlWZUY1LzRERWNzTGlR?=
 =?utf-8?B?QmxCcFhEMnhzWHEra1JPQzV3V2FjNThBQmZxN1k3Q0NFWEVETS85dz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3PR07MB10721.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34147f8c-e5f1-43f6-681a-08de4e8e3c89
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2026 08:16:34.0746
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CNrcug8QdU9JjQLW/rRK55T2ciChke9lL0ox6j+1yjoKD+vrFf3wLC51wtiyip19qEwZURZ08xpJnG2yl8WdRuswx+ocktQ/q0RK1iYoBVM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB9354
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 08:16:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229041

SGkgVmFsZW50aW4sDQpNYWtlIHN1cmUgdG8gdXBkYXRlIHRoZSBkb2N1bWVudGF0aW9uIHRvIHBv
aW50IHRvIHRoZSBuZXcgbG9jYXRpb24gb25jZSB0aGlzIGdldHMgbWVyZ2VkLg0KDQpodHRwczov
L2RvY3MueW9jdG9wcm9qZWN0Lm9yZy9kZXYvZGV2LW1hbnVhbC92dWxuZXJhYmlsaXRpZXMuaHRt
bCNsaW51eC1rZXJuZWwtdnVsbmVyYWJpbGl0aWVzDQoNCkkgd2FzIGFsc28gZ29pbmcgdG8gY29t
bWVudCB0byBoYXZlIEJydWNlIGF3YXJlIG9mIHRoZSBjaGFuZ2VzLCBzaW5jZSBoZSBydW5zIHRo
ZSBzY3JpcHQgd2hlbiB0aGUga2VybmVsIGdldHMgdXBkYXRlZCBidXQgaGUgYWxyZWFkeSByZXBs
aWVkIHRvIGl0Lg0KDQpEYW5pZWwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBG
cm9tOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRk
ZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIHZib3VkZXZp
biB2aWENCj4gbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTZW50OiBUdWVzZGF5LCA2IEphbnVh
cnkgMjAyNiAyMDoxMA0KPiBUbzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZw0KPiBDYzogVmFsZW50aW5Cb3VkZXZpbiA8dmFsZW50aW4uYm91ZGV2aW5AZ21haWwuY29t
Pg0KPiBTdWJqZWN0OiBbT0UtY29yZV0gW1tQQVRDSCB2Ml0gMy80XSBnZW5lcmF0ZS1jdmUtZXhj
bHVzaW9uczogTW92ZSBweXRob24gc2NyaXB0DQo+IA0KPiBUaGUgc2NyaXB0IHNob3VsZCBiZSBs
b2NhdGVkIHdpdGggb3RoZXIgc2NyaXB0cyBpbiBzY3JpcHRzL2NvbnRyaWIgaW5zdGVhZCBvZiBz
dGF5aW5nDQo+IGluIG1ldGEvY2xhc3Nlcy8uDQo+IA0KPiBVcGRhdGUgdGhlIG5ldyAuYmJjbGFz
cyB0byBtYXRjaCB0aGlzIG1vZGlmaWNhdGlvbg0KPiAtLS0NCj4gIG1ldGEvY2xhc3Nlcy9nZW5l
cmF0ZS1jdmUtZXhjbHVzaW9ucy5iYmNsYXNzICAgICAgICAgICAgICAgICAgICB8IDIgKy0NCj4g
IC4uLi9saW51eCA9PiBzY3JpcHRzL2NvbnRyaWJ9L2dlbmVyYXRlLWN2ZS1leGNsdXNpb25zLnB5
ICAgICAgICB8IDANCj4gIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkgIHJlbmFtZSB7bWV0YS9yZWNpcGVzLWtlcm5lbC9saW51eA0KPiA9PiBzY3JpcHRzL2Nv
bnRyaWJ9L2dlbmVyYXRlLWN2ZS1leGNsdXNpb25zLnB5ICgxMDAlKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL21ldGEvY2xhc3Nlcy9nZW5lcmF0ZS1jdmUtZXhjbHVzaW9ucy5iYmNsYXNzDQo+IGIvbWV0
YS9jbGFzc2VzL2dlbmVyYXRlLWN2ZS1leGNsdXNpb25zLmJiY2xhc3MNCj4gaW5kZXggMjU0ZWE1
NTMxZC4uMTAwZDJlOTliNiAxMDA2NDQNCj4gLS0tIGEvbWV0YS9jbGFzc2VzL2dlbmVyYXRlLWN2
ZS1leGNsdXNpb25zLmJiY2xhc3MNCj4gKysrIGIvbWV0YS9jbGFzc2VzL2dlbmVyYXRlLWN2ZS1l
eGNsdXNpb25zLmJiY2xhc3MNCj4gQEAgLTI4LDcgKzI4LDcgQEAgZG9fY2xvbmVfY3ZlbGlzdFY1
W2RvY10gPSAiQ2xvbmUgQ1ZFIGluZm9ybWF0aW9uIGZyb20gdGhlDQo+IENWRSBQcm9qZWN0OiBo
dHRwczovL2cgIGFkZHRhc2sgY2xvbmVfY3ZlbGlzdFY1IGJlZm9yZQ0KPiBkb19nZW5lcmF0ZV9j
dmVfZXhjbHVzaW9ucw0KPiANCj4gIGRvX2dlbmVyYXRlX2N2ZV9leGNsdXNpb25zKCkgew0KPiAt
ICAgIGdlbmVyYXRlX2N2ZV9leGNsdXNpb25zX3NjcmlwdD0kKGZpbmQgJHtDT1JFQkFTRX0gLW5h
bWUgImdlbmVyYXRlLWN2ZS0NCj4gZXhjbHVzaW9ucy5weSIpDQo+ICsNCj4gKyBnZW5lcmF0ZV9j
dmVfZXhjbHVzaW9uc19zY3JpcHQ9JHtDT1JFQkFTRX0vc2NyaXB0cy9jb250cmliL2dlbmVyYXRl
LWN2DQo+ICsgZS1leGNsdXNpb25zLnB5DQo+ICAgICAgaWYgWyAteiAiJHtnZW5lcmF0ZV9jdmVf
ZXhjbHVzaW9uc19zY3JpcHR9IiBdOyB0aGVuDQo+ICAgICAgICAgIGJiZmF0YWwgImdlbmVyYXRl
LWN2ZS1leGNsdXNpb25zLnB5IG5vdCBmb3VuZCBpbiAke0NPUkVCQVNFfS4iDQo+ICAgICAgZmkN
Cj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbGludXgvZ2VuZXJhdGUtY3ZlLWV4
Y2x1c2lvbnMucHkNCj4gYi9zY3JpcHRzL2NvbnRyaWIvZ2VuZXJhdGUtY3ZlLWV4Y2x1c2lvbnMu
cHkNCj4gc2ltaWxhcml0eSBpbmRleCAxMDAlDQo+IHJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1r
ZXJuZWwvbGludXgvZ2VuZXJhdGUtY3ZlLWV4Y2x1c2lvbnMucHkNCj4gcmVuYW1lIHRvIHNjcmlw
dHMvY29udHJpYi9nZW5lcmF0ZS1jdmUtZXhjbHVzaW9ucy5weQ0KPiAtLQ0KPiAyLjQzLjANCg0K

