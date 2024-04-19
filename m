Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4D7BC4345F
	for <webhook@archiver.kernel.org>; Fri, 19 Apr 2024 21:16:52 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.67])
 by mx.groups.io with SMTP id smtpd.web10.4978.1713561405203158970
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Apr 2024 14:16:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=BsM84K1u;
 spf=pass (domain: prevas.dk, ip: 40.107.20.67, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MZTB64ls2MobZgK1cOGTZV5bzlQA0qGcTYgWZkGtUPXc6RAtXZXRY+SfhUVlKL929PIoWzUlUlpdoJiRwh4m3sQt2vJMmWFdoMZXA7ZR2R9SL0duLUb3mi2sP0KWDzalNnH796yiMMEHLg2/80B/m+FEWlAp50eYQ9NA84pKoq7CVgPsl8dWt0J7cSYxLu2n2Q/OX85MHHHmSHrp9z+v0daOLGIbD7uoR5NlHQiC4nPZrNNNZ3+YRaymyin7KLR0brkHSlGpQOSAs5krPZ5Cz8MifSBEiEO6ATxWL7hhsQoQaSXMdbd3nUKFUbYM/cXKUT0YS7vq8I0NVsRxuOWKkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JNiM6RCw2qhwOid2wX4duMNidg9ubf8PkO5HyK7HDlc=;
 b=Z/u+6qQ1N45CkMYxf4JlEMPCfTwbS8PS7ee6i8vQbus5m6SbfUKLCuRNKsBcgiARV2CxFULTbEAEYkGp660W+Qf8NTzWS0NeHWuMpVPan9jgvEMNLLb90Honkccl0djwXsoVP8AzRpOxpJBAXH4/5pbg99J129pTvPgMg1klk8sFPdcTt1MvEGW7kqL9DTPdG1ygiSt1SdRF3mbu3qvalB498NDBcL970Q1eUVApkon700NNACj0lZfVNAeCk+//1XJzcVj5vUeB1NT+NeF+DNE7CX3q7G9BvopS605ITp8CmXLRUPxRdikhlSaylgZr3FLsjsE1qE5340NKo3SWwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JNiM6RCw2qhwOid2wX4duMNidg9ubf8PkO5HyK7HDlc=;
 b=BsM84K1uxmWL/03oDMr0f0/TAOLqaOoJAtaerC4RqZGyPqmuIrRV5N72XjLWhDrIMPhMhF0w9JBFoLfo5bLRK5lA7fCk0jeDysLT9J/cj50R7O2CM05nLiwfP7cS8wIp8mRwI/meJeEqdydtuTKnhTYt5nk+ZlmW5GwGRhcaWck=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45a::14)
 by AS1PR10MB5673.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Fri, 19 Apr
 2024 21:16:41 +0000
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3704:5975:fae0:7809]) by DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3704:5975:fae0:7809%6]) with mapi id 15.20.7472.042; Fri, 19 Apr 2024
 21:16:41 +0000
Message-ID: <3bcf8a46-6452-488b-85cb-c6938e1066a8@prevas.dk>
Date: Fri, 19 Apr 2024 23:16:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] bmaptool: add PROVIDES bmap-tools for
 compatibility
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Otavio Salvador <otavio@ossystems.com.br>,
 Tom Hochstein <tom.hochstein@nxp.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20240419203140.461439-1-rasmus.villemoes@prevas.dk>
 <CANNYZj_5AkKa_dJVmjzvnng_7SFrdDr70T_wDN=bcA2WfMX+Bw@mail.gmail.com>
Content-Language: en-US, da
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
In-Reply-To: <CANNYZj_5AkKa_dJVmjzvnng_7SFrdDr70T_wDN=bcA2WfMX+Bw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0013.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:a::19) To DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:45a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR10MB7100:EE_|AS1PR10MB5673:EE_
X-MS-Office365-Filtering-Correlation-Id: aa1a4322-a4ab-433e-7791-08dc60b60205
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?M2ZJWmIxS2pkaVIySWhhQ2NnUmVUZzRyUzZYdVRDNmY3Rnh6bEJrcysyWWFG?=
 =?utf-8?B?cmt3K0JWclRVbitMY1hVdEU4ZG4zL1lrVUptTHE4VVlqWDJIOG0vdW1ha1Bz?=
 =?utf-8?B?ZEhXK1NkZVd6WkVJZTNkVlQ0MHFMMXpmdFFESldnZlNHMHQwbnlnbWFpay83?=
 =?utf-8?B?NkxxcjVvYTY2eXltTmFlMGtoSTVSRDRKTkVwZkcySjJSTU5EQ1QvMnNmK01U?=
 =?utf-8?B?T2ZaYzlMdE1iWE1iMzlReUxqL0hzdEZaaElwVmVja2E3TW16K0poV0ZzNzlI?=
 =?utf-8?B?aEFMMk9naHRjZldjbDZvd28rN0NVVXlocTdkelJwWWw2LzNHdHMxYXkwWjJ6?=
 =?utf-8?B?azhpa1M2ejZwVW5FUCsycnl2ZjE4RGtUSTBNT2Q3YlRjd0lRRWxtRm01d24z?=
 =?utf-8?B?akM1dUN4MUgyamtYb0gwUVZKeC91dVJPRmNsc2pXTElOUmFCQ25NUGhveVRH?=
 =?utf-8?B?M0hZajdFSmI4dW1KNWltQnl5VnM0cDEvYlh3c2ZkejJmc21WKzc0L1NXbWlp?=
 =?utf-8?B?TEVHaXBnTUg5SWlLVHMwQ0hpdjQ3dW1aUVZRTytqWmVNbTJuV1ZKQ0IwMjZY?=
 =?utf-8?B?SFNBZGJJS1grczlKSnZKS2QzcjhlUEFJSktzR2N4YXp2SHZwRjZZS2dXWUZy?=
 =?utf-8?B?cjZpenF4bzdDaCt1VlZBZzBleE92VStZQktzUHpUTjIvM2trb1FpbHNRVlM2?=
 =?utf-8?B?UWdtVGhiRVI1OVZkdVFzc3cvU1NUcjI1RmFlU21zNVdXcGUvbXA5THpQOURV?=
 =?utf-8?B?VmF0N1V6MjZtcncxZG9RampqNHY2TjVkWjNvaFpMUldua3ZwL1dUcDExZTk3?=
 =?utf-8?B?MXJsdmIxUjVzSEdXdHhOeW15aXhvWklSRnV4RjlELzJ1ekV5LzQ3M3VJUE5V?=
 =?utf-8?B?NTBTOVVEWnRxRmJUWlY0ZVI2clNkNkQrUXpZNkgvQTRHVUY4bzFpMW1pTmth?=
 =?utf-8?B?QTE5MjVBNC9MbUg0NkFibkRtYUJocGRZWTNadVlvbjVQR1lqT1NmQXpFZlFJ?=
 =?utf-8?B?MUtsQStFNlh3R2VwMnJneU1nek45aDVqOHAvalAxdXlwR3dxMDNMeWpVeXNu?=
 =?utf-8?B?cW5JUmM5THB3dlNWK0g0TlBYWEhwMkE1SWJhVk5IUlpaVWxVRUhDZEZmMXJ6?=
 =?utf-8?B?YzArRS82bDY5ejVCc2M2eUdCUTZiR1ZTUHg3S2kxbHFiYVZmNU1yMGk3ZUd1?=
 =?utf-8?B?b3BRQ05zUkN2MU9Fa0lVbWlMM1dqMmJkbEw3eXhOY3h4SkhzT3pyZWRaZUtE?=
 =?utf-8?B?THhtZTJSc2hDRGpvaEpkcHFYbDZoWWhrK2Y5MFAwTEQ4bTF0MU5nL05CcEtk?=
 =?utf-8?B?NHdTNzJXRjQ3aUxJZ2kxNktvYTZ4bGxKZHk5T3duSjhsa2k0bUNNODNGRTBn?=
 =?utf-8?B?OHVUZWVXWHAvZkMrcURJZGFwS1VYaVQrbUpoYTlZNGZ0dHRSYWdVUW9CT1VC?=
 =?utf-8?B?T29oRUhBaGwvSGFlWW1qdTJWN1NCQlJ0YlhaL1FkVzhuY08wR212MkpibFFk?=
 =?utf-8?B?SWFxN3BpcDZVdUVtMmQ4UkN6TVM1RHNnanRVS3R1UDRxREZnNkRYMDNmMlBq?=
 =?utf-8?B?bHBmdm8yMTJBTmRLRnp4WWV4TCt2V2gyaWh5b01BclJ0NnpOaldRWjY2Vm53?=
 =?utf-8?Q?tMxE91QQjXcaa5zCBGfujw1y/L94pFhr2pgJ3hjN/4Cg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZWFzdGNqQi9KNWQrbUdvQVhURTM4VWFsY1RMdHE5ZFhLc0RSM0NublBPRHdm?=
 =?utf-8?B?bFlveUJISFg5czBBM3pvVk9VODFkek5QeGJmSWRaVHBRcHA3Y09TRWFCcTdr?=
 =?utf-8?B?eUcwYzBML0d3cXJFWVZOQnk0OGhXRXFDSTdDRzE4WENvZ3RiNHhwaWFLb25F?=
 =?utf-8?B?U3FiOVRLRlpxdW1qbjBLMWk0S0d3ZDRKUlVhQXRBcDhqeXcxM2NIakFvR3ho?=
 =?utf-8?B?eGk0dUxpS0tCL3J4NzRldTRvSkI4WjAra1grUXdhSXNhakFtRGphYXFqcDIx?=
 =?utf-8?B?THora0o0NnM0TnNBSENmeXlCeWFKOVBKTGZsdmcwL1ZTTFBtNHhTeHUzZG9Z?=
 =?utf-8?B?Nm9Yc2o2RGhrcXpBZ2Y3eDBWK3hmTjdWK0VoQnVLWFRCVkx4RmZkUTIrVmtO?=
 =?utf-8?B?ZzFmVXhYSXBhYmZKSmxBTEtpajdmVFhqR3BTQTVVUzRKcnlxaFh2Zm5OYVJn?=
 =?utf-8?B?aEdOQ3grTko2WnRaS1dyTUFsQmtpWGM4YzlrYitFcDRGYmJYYjJIZDBsTVpS?=
 =?utf-8?B?R3pnR1RXcEFycWU0SE9XbGF5aWFubGYwaXBkZnZEcUZSeW5UQWlWRUtlVVZv?=
 =?utf-8?B?OU1BcXBtQjYzYU9RZTcwamR4NzJvWjhuU2RtbVFyNDkxWXhiUk5mWHhTMGdz?=
 =?utf-8?B?ZVpFVE1ZNTRYNDlyaWdRL0x0aCtybEZubWZuWUhLYk00Q2ZGU2xpZDdKUnVr?=
 =?utf-8?B?MjdTODBJK2lyazEwSC9MMjNGaVp0cTd5WmliVHdBczJlSmhsanJjVGZDL2Vx?=
 =?utf-8?B?SkxWQ3J1N1M3Qm5FZnM0Rlo4MERjMWg4UTIxMDZqSVNYNEZiRHNGMWRPOXVQ?=
 =?utf-8?B?T3lkMzZQVHBhNThyR1Z4V0o1aEUwUm81YU91bFlZYlprSnlsUWpueVVJd1dB?=
 =?utf-8?B?YlRlNDR3dnBxd0ZyME96UVBrZlAzaTY1OFR2Nnd2WnBFWVp4a3NZTHN3dE8v?=
 =?utf-8?B?aVI0QTVpc0xPRmRJR1JSQ2VzdzJ2L3ZPOHZtamQ1L2s3Tnp1MC8zMlhYY3FP?=
 =?utf-8?B?azVjTjJSbmZmeHhwT0J2bi9ZVitYcU9kTTM4ckFFdi9uSzNoR0hEWEJ4YXcy?=
 =?utf-8?B?bkhHR0IwRFZXTWR0b3V0UVVBNWZlS1lqRTk1eWVMQ1BKblh5MXNEbzVUVjNy?=
 =?utf-8?B?Y2ZKSS9Hd2phNXRlQmFNZXE5RndGUWw2d3NlekZsVnh6dlNxNDl3R2ZBSXQv?=
 =?utf-8?B?aTNhNmRWSXh6ZC91SWtqL0svcG1vMFpPeHYza3FUMWFDRHFyZjJGUWF0WkpH?=
 =?utf-8?B?UmV3UkUxTmFERXB0SHBBQjVMSERZMGJRRWQ4RktBVHQ2ZGQ2MVBlRmFweklT?=
 =?utf-8?B?N21aWU0zQVYrOFFRTDdYQmErRkFFTGJpeTkreEZJWE5XTFB4L0lPYkhKcXJv?=
 =?utf-8?B?d011TnZNeDVxUlhrVFFWQjJPV0lxRVR2UkttaUhYcnJRWUIvOFZNL0FXTEp6?=
 =?utf-8?B?UFk2WkQrY0gyZXhkUVRSREw4OHdrbE1TTFp3VWllSGpQanBxcEVlRHljVmhR?=
 =?utf-8?B?TXBPOGFROWFyelNlRWJGcytwYWlCNnk0L1ZkUjdlMjBiZTY5N2d5K0hEM3p6?=
 =?utf-8?B?c2EzWWlwNW9SQzBaQytMMVl6TzB2Y2UweHJ6NjlJd0NpMEFNbmM0L0kySURV?=
 =?utf-8?B?UHB0QmNHaHlLdTNpVFUrQ0dEb2ZpSHg4d1Q3Q2Q0b3ltK3loR0EwVWREeWxZ?=
 =?utf-8?B?OVJRd2RaTE56Q0pIMjFwcHhSZUUwbExYaCtXYy9SQzg0R2ltRjhOOXBvRlF1?=
 =?utf-8?B?dEk1OTBlaENUa21qbTV4WEFrM3BKWWdBRGZmT2Rkc1V2WGYrTVgrSlQ2Y3lH?=
 =?utf-8?B?WU5PdktTaDRxZTZmZzBSWWhUVHBEbi94M2MzclRLUlZ2cDhaVmVvYWh6QWV0?=
 =?utf-8?B?MWhPTkF4T2xDNUVGamFqb3VnM0xEajBPK2h4WTZwWEE1T1E5eU9rTGI3dXo5?=
 =?utf-8?B?aWQyOTgyUE1acnQ5R1E4RlpUdHRXRlMrcFprRXFCaXRCMnVFSys3eVZyeWph?=
 =?utf-8?B?bXh2NEpzTCtUV3FKUGQ2elRYZHJHRDgrYXBIeVJ3SXlqUktmSUdtc2syblJI?=
 =?utf-8?B?ZTdORWtEMlhrcU12Ym8vWG5rWTdNcHhnWE5WR0ZnVkltd3NlNElSc0hTcS8w?=
 =?utf-8?B?N0pGbm5mbGt5NDkxWjFlN1d6dTFVQy9ha2JtSnI3TGZqUTNXWWlQVzQyUmpL?=
 =?utf-8?B?RGc9PQ==?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: aa1a4322-a4ab-433e-7791-08dc60b60205
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 21:16:41.5688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XnOY+xb0bmz9km8NFar2Oxv9xRgnVJxK2aY0FU1FHJPkqFNNGtKgK9vi2/lwQYNZ1IfU+Of6ZwHYhjp62tJRe2J+eTqnu8yTcceTXj9Kp1s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5673
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 21:16:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198565

On 19/04/2024 23.00, Alexander Kanavin wrote:
> This was already proposed, and rejected.
> https://lists.openembedded.org/g/openembedded-core/topic/104753355
> 
> You need to fix the metadata that refers to the old name.

So, how can a layer then be compatible with both nanbield and scarthgap?
Could this perhaps be applied just to the scarthgap branch, but not master?

Rasmus


