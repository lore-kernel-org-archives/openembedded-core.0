Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52703C61CE8
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 11:10:24 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com (AS8PR03CU001.outbound.protection.outlook.com [52.101.71.64])
 by mx.groups.io with SMTP id smtpd.web10.10430.1749726616115181574
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 04:10:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=XlowlO2c;
 spf=pass (domain: siemens.com, ip: 52.101.71.64, mailfrom: adrian.freihofer@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P2YetZwxHDcVT0C/mVOxzQ1/odPTloIdGSeV+kAg+Ocb6mV5pmQzI58vlAhODx5f8N6Z6xbgk5qoxK7zh63ceNPuB36n5CVZnl82PBv05r+TOMQ8c+4hKbpxhC9Z9J++UwNPx7BmEqgO373FRs3RmJr+dsax5aY+miAxLRzOxe2MOWn8htYEkZGkIUoil19BYK/X/3gO5JncdXPsTK9I3VJMDPynESNK3z5hS6fuDHRa8UjvZO1RT/T0eDT52434nlyy5VtyD4IECYf5Tt3T0TfESSlgp97TINhubXLDKjQKjyVMcTGLnHJCgGxImA0cyU5d/ZbSS8bfq2llTBriug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e1LAlZTyPP09WmOFqOCwG59Ds67I24C8rlOKcHvqBLY=;
 b=QXFySHYO3zTcen/cCskoFN6/jNfCNbzWcwp6+MSGlhyh4hEPy+NheFKhRvpz7/qx3NchFG8USJg5rIf6VD1p0eIwSfcbK0jPrrDL3DzVKBYfjS8AJSjfRTr/dQqJ3/YooVKyoimza4vG7Do6tf7xAwlFT45JmWTtHa5YChGNWsSvx145I/WiERrBbCbuKFLk609QL1qIlgh7JmD8aThJFSGDvOxU6aajCpcPAMyedEKtS/C1D5AgjUclsDz1sN6KXrejzdcjMxd/Ym5q590J0+10URs/aQcg4V+S4ZKzL78fr+5Ead6cgcX3Ga/eO0Z5wWew4DXO1SzYyPh20TGZsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e1LAlZTyPP09WmOFqOCwG59Ds67I24C8rlOKcHvqBLY=;
 b=XlowlO2cyrTKgHFeJqQo0f7gpM+oLroXLtVMRLxSjh+TuTv3xrDvFnKv2dSvFZiZT8gZTMJL5KXOnYqPDR//GjlrQpyqzUkQ0t/D67yW0DTii0aA4AaL/hdQBxqPej6leOgHdLelEiO4NC6HV48o82A/FGMELo5O/6f8UtXdhxFw9jaI0i1Jsa2XdRCtGMOWx8615UQ3FSrNaFyNXiolAG/7QFSmZc/GYyyuP1VHDGiWdsmlW4t8klY1RGf1BbRRCShwdp8gku5WNAnxbLaDzM8B3dpd3DZRNrwoSP3YUCNilHkjMNF6edweDhOOwNDJpN05AZwXQ/7bLTD7TygqeQ==
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:13e::17)
 by PA1PR10MB8729.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:441::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.22; Thu, 12 Jun
 2025 11:10:13 +0000
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e586:9cf8:7696:cbda]) by DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e586:9cf8:7696:cbda%6]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 11:10:13 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: "jamin_lin@aspeedtech.com" <jamin_lin@aspeedtech.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "troy_lee@aspeedtech.com" <troy_lee@aspeedtech.com>
Subject: Re: [OE-core] [PATCH v1 1/2] uboot-sign: Avoid symlink and install
 errors when SPL DTB is missing
Thread-Topic: [OE-core] [PATCH v1 1/2] uboot-sign: Avoid symlink and install
 errors when SPL DTB is missing
Thread-Index: AQHb1rNcVvGKmFR9hUW4r8nmyllCmrP/Z7sA
Date: Thu, 12 Jun 2025 11:10:12 +0000
Message-ID: <4004e8969d9e5d7ba9915e1cf4240ba08c12b0f7.camel@siemens.com>
References: <20250606071915.2680182-1-jamin_lin@aspeedtech.com>
	 <20250606071915.2680182-2-jamin_lin@aspeedtech.com>
In-Reply-To: <20250606071915.2680182-2-jamin_lin@aspeedtech.com>
Accept-Language: en-US, de-CH
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-1.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR10MB3529:EE_|PA1PR10MB8729:EE_
x-ms-office365-filtering-correlation-id: 317536d0-7749-4682-ddd7-08dda9a1b3eb
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|4022899009|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?ZWJtNEIvY2wzOUgwRXZWQWpNZDVUNG4wQVRseVI2TlE3UytvRGVSZ0x5UU9s?=
 =?utf-8?B?aE1QZ29LTGxIa0NTSXkwNC9YSnVTSjNFc2dyVWduQkdwQVdXRXBlMEo1V1kv?=
 =?utf-8?B?OTNtUFBtU1hITHZDM05PbWVGNzAxdkVoK1pEeXRtVGVMNmR1T25yU3lqKzFL?=
 =?utf-8?B?QkphWllWa0JvbHNoQ1ZKRUxVNkVSVW9TVEdnZzJhZ203endPZ21ZTUJsa1Fz?=
 =?utf-8?B?VUI2djhoS3E2MXJ6b2NZNkdJUU1QRWM0aUtKSjhPNEx5R0szRXhYWmQrTjlx?=
 =?utf-8?B?RXY3cUFmS21WTlY3QnJHdkZ0ek1tLzNVV0xKbmx2T0U2c3gzWDFaejVyK3Y4?=
 =?utf-8?B?MTNDNFFWQ0JpQ3NWQldNQWljdmRzRnlsWVhiVnJXNUtBMklobkNacnZqSmtG?=
 =?utf-8?B?UnQvdmdlcEQ1V05VNW43aGZjbmhwa3M3M3JXSHZwcHUyZ1RVeE1laTNORTVG?=
 =?utf-8?B?UExjMEVuOVpSektENFdHaVhiWGJISVZ3empPbTg2WGtLMkliWnVKbmNuZXhi?=
 =?utf-8?B?cTljRmxBaWJmWVZpWHNxMVRrdnI1MUEzNHNhRmNLMjYyYVhIcVdlak1RbHVC?=
 =?utf-8?B?Y1BING5UdUxBOGZxaEszbzljN2Y4UDVhU25PVGVtTTMyZmt5UVVCc1NSbzJn?=
 =?utf-8?B?MVJuYWQ3anRlYXRoR0FYMWhCMTE3RVovZHhqbmo0bldWaEI3cGJLQnRjWU1H?=
 =?utf-8?B?VmxOUUtBbkgvcHpEWlNMNWhublBTUnVodytEdDhIcHd6MThmcHh1SS83T3pu?=
 =?utf-8?B?VzlQWGdrZHhiOWZxMnJ6STRheVZjQzlDQS9RaVBGUkRpeGNwb084TENzYU9t?=
 =?utf-8?B?eWE1bmNYb2NnNnlDS2kvRkNSTkN1NldiWnNGYm4wOHBLRlYrN0tQclVyaWV0?=
 =?utf-8?B?dUpUWERMck5yNE04aGZBMDE5alVhamZlUHFwS21UM2tJVy9WdGtncXQ2MGRE?=
 =?utf-8?B?L01rVkRYMXJ3dEM2Mk1meXNFekc5NDRiN1VkRTJjVURkT05YL1Q3YlVzSVE1?=
 =?utf-8?B?SDRDZGFTRlJUY1RQNXZWRzJyVU1RY0RmWFRRRE9iYTF5WXJnaHBNVVhIM3pK?=
 =?utf-8?B?S011bDRCYjZOMDU5TnVhSng2NURhbUJNZ3lCZFg3ejlQZkZNNlNha1gvNXE5?=
 =?utf-8?B?Yk9PVHdHdWtpMThvVlQwZVRYWXhPbmVNSjh4bTVxT2puL3o1djNXNUN6TlFi?=
 =?utf-8?B?VVRmR2E1Rmo3RWN4bXRFWStrcGVvS1VtMUk4Q0NKcTY2UyswU1FoQy9rWWhk?=
 =?utf-8?B?VFh1ZDRzRGNjU0o2RllRYWVzU1EyazVZY0w3SS8zZzRYUTN5eHFRTnNaWnNs?=
 =?utf-8?B?WWxkSDVkSEx1SDQ0eVpBL3p3Z1FXNDF5Mm9jU0VOYml0THk1ejhpeHBZcVVH?=
 =?utf-8?B?M0F5T1U5WjVJTFc3YUxZQk9NMU1PY0Z0L2wwaERiaHNrZng4NnlVQ0VZdVdS?=
 =?utf-8?B?SmJQMXFITVZnUm9WencrYmp0MjU1RmJFTVMwTXJvTWlNMVFIRlhUNGp3WEFS?=
 =?utf-8?B?SDBHNUkrQWI3N2l6MlcxVWZyaTBWbFN6NWYzcVhmd0VJaitCeTF2V2loSjgy?=
 =?utf-8?B?aURuNy8vYlhQb1FRaytJTi9kQ1lDSkt5YUY1N051cm5JUnlnZlFIUHlYYnV3?=
 =?utf-8?B?N1pOUFdTb0w2dm9tOFFNMFpDVGlLMnlxYjZDVi9zYlpvWlZ0WG16ci92eEZV?=
 =?utf-8?B?MDJDbFZlKzJHNGY5Z1R0TytmZzRBVzl5RGgyMDBROGREVlF1b0R3b1dScEE4?=
 =?utf-8?B?MEM0ZXNpeEwwbk94MWUvQm1Tc0MzMzBRZWl3YzRTWlhqbm9jQWNLVVg4V3Np?=
 =?utf-8?B?UExjNDhQa0poWktQUEJWMWNNSXJOUzFMWXhFWnpINmt2NGQrU3NaRHRUM3lZ?=
 =?utf-8?B?bjQ5R25ISWZWaG13bXdjTnlEVGpDL2FQb2dhTmwxSUg5bERscnpjQWVFbmdZ?=
 =?utf-8?B?dUl0cHpQem5ocWdDbVFuV2VIek9HeXJCTjFtNUppaU1FenlRMXFDZUV3M1hD?=
 =?utf-8?Q?XddYfBifZrY6AEKW5TEVa+qoDyg/Cw=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4022899009)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?STc4VWJJZEkrOHFqOE41TXRMK1ExUjZRT3V5VUI0bWY2WXBwaUFwL2w4WTNF?=
 =?utf-8?B?enVudkZiTGVaL3pRSjhMR1lvTzBHRU5jWGVHQjRIa3p4ZUkvMkxqakxVRkVM?=
 =?utf-8?B?cVRPMWFqaldteHFXaG1aSzZ3eWxDbldUalN5dXA2RkZVbHJvZlBGQ0wwQTJJ?=
 =?utf-8?B?V3NITDZETVhuWEhUWnlsUDdtWTBWcEE2YzNwOTE4WU15aGlESk9xaTR0RTUw?=
 =?utf-8?B?djJqbjE4akFLYkVKMGFZQ1F3WjFTcGEvazExUW1uMVQxbHhNU3lJYXpZV1JR?=
 =?utf-8?B?QTY3bjJXSnd3ak11K0VQc2F3aHNPaFhOUHl2ZE5JMG10ZjRuNjhhdE5VY3lC?=
 =?utf-8?B?YjJHVVBsWGU2TTQyY0grRXYzSEp1TkphUi90RjBJMjluUmZFakd5TldpQmpY?=
 =?utf-8?B?WXA4MWtnSkUzenNrMGVvNUlzVDB5M3hyTkxaSFZ1cVBKaFhVWVZqK1hWcUFH?=
 =?utf-8?B?UC91M2hMR2UxSmNoRDRJS2JzV1dwTytpVE5lenZ3UzJQaHVsS1Mwb085U0hr?=
 =?utf-8?B?VGt6SGJUWExHbEhXK25MR3p4V2F2THRXdUJMc2Ewc1FiYTE5NzFwMzdDWVVm?=
 =?utf-8?B?dkcvNXFFZW5lbjZOMGN6OWRQZEVRalN1eUFFQ3JQRFpZdmt0MkxUd0VqQjdq?=
 =?utf-8?B?Q3E1VDRWNEFsKzVNOWg0NG40c1UxSUd1Skp5NG03U0dMN0tqazNPTmRnSWpD?=
 =?utf-8?B?cHpVNlVrNkZYTTBYY1ZSdWhlMXc5ZGR1dTZzc2QvczZUV3ZXYkdrclhLV2FJ?=
 =?utf-8?B?c2N6WUx2RXFmMFFYK2c4QU9hSVZ4TlZrdGhSRzdzVWc5NmF2N05pdnhIYXUy?=
 =?utf-8?B?U0dMKzhXZ1FDZStDUm45Y3ptbWplRXFwMUZaR00rVDJRWEp3S3NJSy83ODNV?=
 =?utf-8?B?YndUb1ZHTHRXVy94eHBZdWVITWw4dUcyQURwSXVQUW1TTnBzNWxPWlJDODR4?=
 =?utf-8?B?Y2ZRWUxrK3VWVWR3WHQ1MGJoKzR5TFlzbkVoM1ZlT3JVdk44WlQvc3JYL05R?=
 =?utf-8?B?c3diQlBuY3d4NTBZMk1CTnJjVWJBbU9Tb3VPRVZDZUN5bzJQNlFiV1Vyd25q?=
 =?utf-8?B?NEdIUGNBTytMall2dVVJVzE1VTlQZWxMZkhDWmdHK0VycSs1M1JWbXNQVWVF?=
 =?utf-8?B?TXFQamNCL3JmYXliMmF0MG1FeEtGL0IyYnBTVHFva2dLWEE2T1plK1ZadGh2?=
 =?utf-8?B?ZWNlYWJnS2UwZWJueG8zWXR1N1gxRXltaU9aWEQ1QWgrS0lac3BrQnlBZUJp?=
 =?utf-8?B?cEVhbkloSUxVa0ZNSUFac2kzTmt0WXVGTVltRDRKMWl3WUtLMXJuZFhRMkhR?=
 =?utf-8?B?OU1sbnNGcWViUkk4MHNGeDlvbjFpb0ZkSmZCWUpEd1lLSlpFR2hQWWwzL3pa?=
 =?utf-8?B?SDYwcE40UllQREJReTNadEpVcG9NOGVpWXJMYTdtQmZid1pUZlNmdlNtNVM2?=
 =?utf-8?B?ZDJMN2J3elpPeWF1TkQ5RWdET3FuZkU2UVpGQjlWNmtKRDVGMktzUFRIZDlB?=
 =?utf-8?B?Mk1JeEsyQXR4WXVNd1pQR05IV0pWSTgzZGRQRWZqUmpGODl4cnFjR0luU0pU?=
 =?utf-8?B?MkFXSTBlVlUrOHVkZGFxc0hQSzZxNzlXVCtrcjN5N04xZFgrdWt5NXpxV01t?=
 =?utf-8?B?VkFKZ2FPZmlLaCsxSEVWdkZUQlR0dUF6YS9RVktERjVJZ3BpRHVEQi9od2xk?=
 =?utf-8?B?K0ZvNjZWc1JMNzhnYUlpbHhqSUJpMVhFblo3VEYvY2pmUi9RcjdFZlB6KzAw?=
 =?utf-8?B?LzJ1dWVhWkpmSXNhTndRdmxESEp0TStrbW04WHAyN2dXbmdVWjB5MnVDbkY5?=
 =?utf-8?B?aHhaSXhPeG5pdE5FbG9IWUdZcFJqZEpRUG5ZZEFiVmdEUjJiamJaYVp6SUt3?=
 =?utf-8?B?cnFuVnVWNlhQdkVzTy9xenEwNkdpKzJ1bFNQaW5HSTY2WmMrbXNyM3JFOS9Y?=
 =?utf-8?B?ZlBta0V4MmdJRHF4NS9kYVNab1pZZmdqTDB1U1d4TlJTZFZadFJMV1ZiOWFP?=
 =?utf-8?B?Y2dzOXRiajc4T0N1UmJCR2ZEdk9kK0p5Yys0ZzV3Z3ZTWEh1cDdVTVN6d1FG?=
 =?utf-8?B?NXpUenk4R1drMVVjK2YvS0poNDd5RWthODE4dWQ2eVo2WVhnK3RnQkZFUG90?=
 =?utf-8?B?NEtiN0s3UXhBSHVvNXljZ3QvMU1JVW9NNVhzQ2xnTCthWHZtK1U5cEtDNDJS?=
 =?utf-8?B?NXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <256BAFAA5CA35C4BBBDDCC31B5A46268@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 317536d0-7749-4682-ddd7-08dda9a1b3eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2025 11:10:12.9344
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lAXWqg9sy1jLlP38pHwwjEdorwkndQuYNr9i7H0bgX5zTStVQ8K4pgG6mqx5cjShP1LoLfXoQNhJYlTwfyT0XqutbJmgFKe9kapP0T5lv3I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB8729
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 11:10:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218512

T24gRnJpLCAyMDI1LTA2LTA2IGF0IDE1OjE5ICswODAwLCBKYW1pbiBMaW4gdmlhIGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcKd3JvdGU6Cj4gRml4IHBvdGVudGlhbCBlcnJvcnMgZHVyaW5nIGRvX2Rl
cGxveSBhbmQgZGVwbG95X3NwbF9kdGIgd2hlbgo+IFNQTF9EVEJfQklOQVJZIG9yCj4gU1BMX0JJ
TkFSWSBpcyBub3QgcHJlc2VudC4KPiAKPiBXcmFwcGVkIGluc3RhbGwgY29tbWFuZCBpbiBkZXBs
b3lfc3BsX2R0YigpIHdpdGggYSBmaWxlIGV4aXN0ZW5jZQo+IGNoZWNrLgo+IEltcHJvdmVkIGNv
bmRpdGlvbiBpbiBkb19kZXBsb3kgdG8gY2hlY2sgZm9yIGFjdHVhbCBleGlzdGVuY2Ugb2YKPiAk
e1NQTF9ESVJ9LyR7U1BMX0RUQl9CSU5BUll9IGluc3RlYWQgb2Ygb25seSByZWx5aW5nIG9uIHZh
cmlhYmxlIG5vbi0KPiBlbXB0aW5lc3MuCj4gUHJldmVudHMgImluc3RhbGw6IG1pc3NpbmcgZGVz
dGluYXRpb24gZmlsZSBvcGVyYW5kIiBhbmQgaW52YWxpZAo+IHN5bWxpbmsKPiBjcmVhdGlvbi4K
ClRoZSBjb21taXQgbWVzc2FnZSBkZXNjcmliZXMgdGhlIGNvZGUgY2hhbmdlcywgYnV0IGxhY2tz
IHRoZSBjcnVjaWFsCmNvbnRleHQgb2Ygd2h5IHRoZXNlIGNoYW5nZXMgYXJlIG5lY2Vzc2FyeS4g
Q291bGQgeW91IHBsZWFzZSBhZGQgc29tZQpiYWNrZ3JvdW5kIGluZm9ybWF0aW9uIGV4cGxhaW5p
bmcgdGhlIG1vdGl2YXRpb24gb3IgcHJvYmxlbSB0aGlzIGNoYW5nZQppcyBzb2x2aW5nPyBXaGF0
J3MgdGhlIHVzZSBjYXNlIHdoZXJlIHRoZSBjb2RlIHNob3VsZCBwcm9jZWVkIHdpdGhvdXQKZmlu
ZGluZyB0aGUgJHtTUExfQklOQVJZfSBmaWxlPwpUaGlzIHdvdWxkIGhlbHAgZnV0dXJlIG1haW50
YWluZXJzIGJldHRlciB1bmRlcnN0YW5kIHRoZSByYXRpb25hbGUKYmVoaW5kIHRoaXMgbW9kaWZp
Y2F0aW9uLgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW1pbiBMaW4gPGphbWluX2xpbkBhc3BlZWR0
ZWNoLmNvbT4KPiAtLS0KPiDCoG1ldGEvY2xhc3Nlcy1yZWNpcGUvdWJvb3Qtc2lnbi5iYmNsYXNz
IHwgNiArKysrLS0KPiDCoDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nlcy1yZWNpcGUvdWJvb3Qtc2lnbi5i
YmNsYXNzIGIvbWV0YS9jbGFzc2VzLQo+IHJlY2lwZS91Ym9vdC1zaWduLmJiY2xhc3MKPiBpbmRl
eCA3M2U5Y2UzZjExLi42ZWUxODc0Y2Q2IDEwMDY0NAo+IC0tLSBhL21ldGEvY2xhc3Nlcy1yZWNp
cGUvdWJvb3Qtc2lnbi5iYmNsYXNzCj4gKysrIGIvbWV0YS9jbGFzc2VzLXJlY2lwZS91Ym9vdC1z
aWduLmJiY2xhc3MKPiBAQCAtMjc1LDcgKzI3NSw5IEBAIGRlcGxveV9zcGxfZHRiKCkgewo+IMKg
CWZpCj4gwqAKPiDCoAkjIEZvciBiYWNrd2FyZHMgY29tcGF0aWJpbGl0eS4uLgo+IC0JaW5zdGFs
bCAtRG02NDQgJHtTUExfQklOQVJZfSAke0RFUExPWURJUn0vJHtTUExfSU1BR0V9Cj4gKwlpZiBb
IC1lICIke1NQTF9CSU5BUll9IiBdOyB0aGVuCklmIHBvc3NpYmxlLCB0aGVzZSBraW5kcyBvZiBj
aGVja3Mgc2hvdWxkIHJlbHkgc29sZWx5IG9uIEJpdEJha2UKdmFyaWFibGVzLiBDaGVja2luZyBm
b3IgZmlsZXMgaW4gdGhlIGZpbGVzeXN0ZW0gaXMgdmVyeSBmcmFnaWxlLiBUaGVyZQphcmUgbWFu
eSBzY2VuYXJpb3Mgd2hlcmUgYSBmaWxlIG1pZ2h0IG5vdCBiZSBpbiBpdHMgZXhwZWN0ZWQgbG9j
YXRpb24KZHVlIHRvIGEgYnVnLiBXaGVuIHRoaXMgaGFwcGVucywgZGVidWdnaW5nIGJlY29tZXMg
bXVjaCBoYXJkZXIgaWYgdGhlCmNvZGUgc2lsZW50bHkgY29udGludWVzIHJ1bm5pbmcgaW5zdGVh
ZCBvZiBmYWlsaW5nIHdpdGggYSBjbGVhciBlcnJvcgptZXNzYWdlIGFib3V0IHRoZSBtaXNzaW5n
IGZpbGUuIFdoaWxlIGZpbGUtYmFzZWQgY2hlY2tzIG1pZ2h0IGFsbG93CmNvZGUgdG8gY29udGlu
dWUgcnVubmluZyB3aXRoIHdyb25nIGFzc3VtcHRpb25zLCB2YXJpYWJsZS1iYXNlZCBjaGVja3MK
d2lsbCBmYWlsIGltbWVkaWF0ZWx5IHdpdGggY2xlYXIgZXJyb3IgY29uZGl0aW9ucywgbWFraW5n
IGRlYnVnZ2luZwptb3JlIHN0cmFpZ2h0Zm9yd2FyZCBhbmQgaXNzdWVzIG1vcmUgYXBwYXJlbnQu
Ckkga25vdyB0aGVyZSBhcmUgc2ltaWxhciBleGFtcGxlcyBpbiB0aGUgZXhpc3RpbmcgY29kZS4K
Cj4gKwkJaW5zdGFsbCAtRG02NDQgJHtTUExfQklOQVJZfQo+ICR7REVQTE9ZRElSfS8ke1NQTF9J
TUFHRX0KPiArCWZpCj4gwqB9Cj4gwqAKPiDCoGRvX3Vib290X2dlbmVyYXRlX3JzYV9rZXlzKCkg
ewo+IEBAIC02MDAsNyArNjAyLDcgQEAgZG9fZGVwbG95OnByZXBlbmQoKSB7Cj4gwqAJCWxuIC1z
ZiAke1VCT09UX0ZJVElNQUdFX0lNQUdFfQo+ICR7REVQTE9ZRElSfS8ke1VCT09UX0ZJVElNQUdF
X1NZTUxJTkt9Cj4gwqAJZmkKPiDCoAo+IC0JaWYgWyAiJHtTUExfU0lHTl9FTkFCTEV9IiA9ICIx
IiAtYSAtbiAiJHtTUExfRFRCX0JJTkFSWX0iIF0KPiA7IHRoZW4KPiArCWlmIFsgIiR7U1BMX1NJ
R05fRU5BQkxFfSIgPSAiMSIgLWEgLWUKPiAiJHtTUExfRElSfS8ke1NQTF9EVEJfQklOQVJZfSIg
XSA7IHRoZW4KU2FtZSBhcyBhYm92ZS4KCkFkcmlhbgoKPiDCoAkJbG4gLXNmICR7U1BMX0RUQl9J
TUFHRX0KPiAke0RFUExPWURJUn0vJHtTUExfRFRCX1NZTUxJTkt9Cj4gwqAJCWxuIC1zZiAke1NQ
TF9EVEJfSU1BR0V9Cj4gJHtERVBMT1lESVJ9LyR7U1BMX0RUQl9CSU5BUll9Cj4gwqAJCWxuIC1z
ZiAke1NQTF9OT0RUQl9JTUFHRX0KPiAke0RFUExPWURJUn0vJHtTUExfTk9EVEJfU1lNTElOS30K
PiAKPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQo+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVz
c2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLgo+IFZpZXcvUmVwbHkgT25saW5lICgjMjE4MTEzKToK
PiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNz
YWdlLzIxODExMwo+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQu
b3JnL210LzExMzQ5OTU4NC8zNjE2ODU4Cj4gR3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1jb3Jl
K293bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcKPiBVbnN1YnNjcmliZToKPiBodHRwczovL2xp
c3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1YsKgWwo+IGFkcmlh
bi5mcmVpaG9mZXJAc2llbWVucy5jb21dCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0KPiAKCg==

