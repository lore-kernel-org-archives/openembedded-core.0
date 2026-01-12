Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4881EC9EC9A
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 16:06:44 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.35])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36488.1768233995322392767
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jan 2026 08:06:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=nzGAFEKi;
 spf=pass (domain: cherry.de, ip: 52.101.70.35, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V9cDWmNJMNvtX7CMdyHhiOZjZjvpnPBUOu6zVtts3X6cMvNjOY/GA1i4abXJmspiaaeWXMS9smPYflhm2Maq4g7JXcozemBQMYrkE3ROcsCCAQLKIxN4InoP+OWgekQZPkymfZ5HcLgRiq4eKZxOBaD1LOOK8RDvNZrt+/DOhy+3uuZaeuqRbyiazj2LV6d0yx/9pgS9f1da/Pw0JISP4QeaROIAGKcAdXYindxUsg2yLACV/6VvSHyz0pEciBoR4pVo0kpAdEwtv+d7ltIadCkApB6Gun3jRATFW4E3ys9OVifoGfZubRKFuSIBpu/Dtma04QRoYrfCghFQP0dkbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3qK6eQzXoAQVDfLY6lJuZnOLJHevaohksrLXSup1cXM=;
 b=MG4ylbmAcRBQPzGF0Zj4XpF65SLNyoW0wJt0JxT3eMSsT8ARN0jkfK2kx7g4Ky6qwue/k7bA71ZThEluPT1lNFExl/yy4RFjwtPzSu9XBSuA4z5sYdd8OZ+2mxaj9yPPWpU8PvdJ97pNH7vKYpYFGi+GBY6PMNZqaM1iTSOGQY5+PzwD7VI5/oSIVy5xDfxoFOJ+UCMGcBSe7mKdi/c+Y+RmfxmJOCgVeC59xX+ig2x06cnz6dM9ZBbekGei7hnVYKy4bmdQW8Ousc8PLOIaHaTMS/mdBFyHocq96jTfJYgtVTqH+N0SE7++dN5FkGZFi7chuEoVbwKjfYUG5lmdDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3qK6eQzXoAQVDfLY6lJuZnOLJHevaohksrLXSup1cXM=;
 b=nzGAFEKiSTrU0kp6kESAs5V+yWImsp+AtsPTH2lrVPLPSxG22WXwNAA5C7NLwmZAuH3ZVA44f93aKPiixaCcpISelQ8hLPjGO2v2lNFn44ja/4B6vvucJD2l6T7VKRY1VSsR6ruJRaESPc7kmRxuAJcNWktAMhEdG+HAQxtJgFA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GVXPR04MB10234.eurprd04.prod.outlook.com (2603:10a6:150:1c1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 16:06:30 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 16:06:27 +0000
Message-ID: <22438428-9339-4abe-a7ce-59524ca33cac@cherry.de>
Date: Mon, 12 Jan 2026 17:05:58 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [review][OE-core][scarthgap][PATCH] libtasn1:
 Stack-based_buffer_overflow_fix
To: amaury.couderc@est.tech, openembedded-core@lists.openembedded.org
References: <20260112160031.71913-1-amaury.couderc@est.tech>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260112160031.71913-1-amaury.couderc@est.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::13) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GVXPR04MB10234:EE_
X-MS-Office365-Filtering-Correlation-Id: 23c100f7-df18-4b5f-066c-08de51f48aca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?a3grY0NlYlZubnE0eHFucyt0eTN0a1Fsc2IycG1ndEhDQzdFeFg5UWo1K0o1?=
 =?utf-8?B?a3N0eGNtM09udU5aN2pibzBHNi9RQ2JtdUxkTzJaa25nMHJJeWxWdm9BckFu?=
 =?utf-8?B?R1o5QWRETVZqN2Iyc3Z4Q1dPM0lRem5MQlVjRS84eVVVS1ZkbWR2VFc2RVJG?=
 =?utf-8?B?QjJQdCtoOG5ZSXErd0Jyb1h3MUlSWE84NmV2dmJhZmh1Syt1SklxWVZTbzBI?=
 =?utf-8?B?dCtKcXNqaUpoWmVhVlNEVWJtdVVIWEgvdzFmL1hGZkRFS1c3WE1TaEVHUkp4?=
 =?utf-8?B?NWsxckFWRXBoRXk5TVh2Sjh1UFBKa21FMGRMVnRkVXN2NFhKYjRUMUdrYVdU?=
 =?utf-8?B?MWFxVGtoN09FalhSd2xXaUp0M2d0OUtCZTMwTVc1OGhCY0VhNHlZY2Eva1I5?=
 =?utf-8?B?VEpleExxalN5NHVlVEtBNDZscHd1cld3dlJObEJlUzNFTnc0T1lrMmxLQTRI?=
 =?utf-8?B?K3dHK0JDMGk4MnRmdHJDV1MwTCtoNjlUVTUrbWN0U0NpWHZ3YWlMYkdtNEk3?=
 =?utf-8?B?d2NPeXJoWGpZT0p3VW9GcVphYThMeFNqcE5yWU1sSHZMZThQWFArVTViZ0M1?=
 =?utf-8?B?MlVtS29JaWE5OTlFcEM3cjhLejQybEpkVXlEUXRHZjd1QmM0SlZJbVh2dDRk?=
 =?utf-8?B?enNCRC9sQlJFVFB6YU4wMEE3ck96cmVEOHJFRFZlK1lCbExhZFF5U05rdVdY?=
 =?utf-8?B?MDAwL0ZHZXdTcDNBZ2hTUUh4UnhzTTE4dE0zekRiRnlDdjIzcTRmejZ1K3d3?=
 =?utf-8?B?bW0vT0Mya00reFpia0FMajFyOE8wVEEzTlFrU0djckNadVhkb1hRelphQWdx?=
 =?utf-8?B?cTBKOVFMWGg1a2JoaTNmTDdHQXp6YVJSVmJDcjZtVE1BVzd5NUZFOGkvaGZj?=
 =?utf-8?B?Q2dab1c4WUxpQ285N0R6ekNvaGVQeE1KNFNqL1JZK0FhSXAwTEt1WjlSMmdH?=
 =?utf-8?B?TlROY0VwTUp0OVpYZUlBekdMMDB4dE90VGtJaFB3UG9tN2RaL3U0bllZWFA3?=
 =?utf-8?B?a0J2ZmhvWWs0ZmRIWUI5MExNUDdDQnhqbDlKUy8wZnY1c3cwYnJrcmR0WGky?=
 =?utf-8?B?M042aGhNc0hsdWhYUk9qU2F3M3h2Nlk4amx6dnBlcXV2WmJ2N3BCTlZ5T0ZZ?=
 =?utf-8?B?OXJuZ3BoZ244elhJZDZwWTlIZmV0dHpibzZtR0FMSnVjdnk4dmYwS1U1KzNj?=
 =?utf-8?B?dUV6cnlTU3FQU1piYXdKNnAzY1U1ZTF6bjMwaE5TcEdKek9FUG5KZHdRMkxz?=
 =?utf-8?B?SDJ5YWU4UENDclF1eUZYZTVhaWp5OVVsTUNGTVRScnQ4TzlEZ0x1YmQxZGdT?=
 =?utf-8?B?TFU0Y0E0Q2lxaDVhbUExcWlnRFNYTVNEUXl4cHlrYkJmbDZVQ3Z6YU8xdjF3?=
 =?utf-8?B?akMzQTAvaEhEK0JaMEhFN1BObndDdGxCcC9TajZrTWxsSWtmRFc4R3J3cVpI?=
 =?utf-8?B?OFc3cWhSdktha1ZWL0REYUVJQmdNV1NQemxZZmhPbnNoQkVCWkxNT0tuVHln?=
 =?utf-8?B?MEdvc2hoTGV3Ri8xanJNOVhVVis2ZEk3L2RBMWtPWnJKSS9vbkNXaUZrVDJF?=
 =?utf-8?B?N0s4OFA3aGxDaXExaE0vTkFUc3dveW1BL253RHVnUmdUOG1ZcFA5UHZHQlEy?=
 =?utf-8?B?ckZENW1EREw5b2NuamdEWGRTSTFyMDhLdFBCZDBqTE1KOXhWUTFGcWFrS09Y?=
 =?utf-8?B?VDZBbHZYanpOWittUEZyR3ZzbVlXRzdveWRIUTVwUGVsbVZzNjF2dVpOeC9I?=
 =?utf-8?B?NkF2aDR0S0ZwTVNYUjlKY0Z5M01Ya0s1amxHQzc0bS8wSGVBd0RuRzMvZVR6?=
 =?utf-8?B?NTdEZkNVdVAxTWNsNStweE5ZeTZLZGdlSG04ajdTcUtQbjRHd1kwS0JKLzNJ?=
 =?utf-8?B?TlBzUGZYZEhjREdNZyszdnFFMFZOMldnVjJhOWIxRUhNa0xtR3UxTHhFTzB0?=
 =?utf-8?Q?ZGwN/4YurhzPWUXkxMG7KY36ylrxyb/M?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?a2drUWZ2OFRjb01ydWN2Uy9mMWZqN2ovTlpxZ0JaNGRLcm5hVW03RUovQTBu?=
 =?utf-8?B?V25YUE0yakFleXlRc1gyb1FEYXB4Wko1WTJWMENyTDdBTVVtL29rVkJHdHFw?=
 =?utf-8?B?bVhYUE42LzJKZm1pWm1KYlJzdlpWV1dDZWx3MkN6TDFYZ0dhTVlhSmEyVlU1?=
 =?utf-8?B?UGg5azhjcUpEakxyZ052SjEvRFNzM29TTXdOdHhBaFNvMGVHQ01yVlRGTjlx?=
 =?utf-8?B?eDNBUlNZSGlkSGtua2tER1hob2U1Y0VLQ3FHYUpIcWdSMkN3R1NDWiszYmE4?=
 =?utf-8?B?VCtZWHVkRGVoNForcDBTQUhRN3h5d0JpQkJ1a1Vwb21SNFViR3JMTExjS0Vz?=
 =?utf-8?B?Mi93THlzeTFGNGRPVFNqSTZRZ0FubW1GZUMwcVlWRUVaTUxJNG9iNFdWZERz?=
 =?utf-8?B?b3I3NWYvRGZXSzN2T3hmakhReWhpak1Vb0RrS2laYjBmTW1jcjNuQ1E5eWc2?=
 =?utf-8?B?QytHT1M3aEVaWFpBR2prK1htOWY2YjNBc0ludXEyS0VobEZaWWhNSllaUzRO?=
 =?utf-8?B?bmxKOGRqZlVLWm9UQmZ1SmVaa1RrTUdndFpwVnJhUm45Y0pETHZicWhzODJt?=
 =?utf-8?B?bkNJYy9PeDgwbmRkTWVFYVJUK0R3SmVvbDNDVlJUZTMwUXFXNlhOVWZEUVNm?=
 =?utf-8?B?Y1JjcGIvUU9VNk1ZMmhnc29VeTNFbWVOQjM4aDRGVkZJNEV2U2UrQ2RMdVp6?=
 =?utf-8?B?T043VDljdHNaelM1d0doeUpKbnpNSDh5UlpZR09nRzEvclU1TTgza2RrYnJl?=
 =?utf-8?B?dUZhRTdlM1U2YW44bnNuS2crWmRtelNtUHZxUjZFSHZuYnpCSXdjbnZ3K0tQ?=
 =?utf-8?B?Sm9SRFY5Z1h0M3Fxd0FpMG5TLzdKZGR3R2Yvd0pYcFlnQXI5bmlOVG1pQmxx?=
 =?utf-8?B?d0tLQnZvTWsvUXNXeCtlNzUwN2VhMFg2N1N2MHY0amNUcUlPc3RQc2wrVUZa?=
 =?utf-8?B?VTB1WDZjOXRKWExVejhub21EelBQMnhabXk1OHZhdFlYOHV1bnRqeXIyWXh3?=
 =?utf-8?B?cmwvR2dBZ2UvdXBPTDRrQjh2SVlqZlQ5RzZhUFFhRDZuM0k4S3ZDT0Y5TndQ?=
 =?utf-8?B?Q1JRSXhzdEVFbkkzNXFwWDhwNys4RVNjbUIvWFZnV3NhdVF6NjRHT1pyL1lp?=
 =?utf-8?B?VlU3blZJQm9DL3RjM1ZMSG50YU1HLzROYkx5WjVsRGtIckZKaVpMaUxhcVFp?=
 =?utf-8?B?MDQwR0VGWDQ3NUJRMnZLa0RlV0ExS3hkZDkrdXpYU1ZBb3ZaQ00ydkFMazVk?=
 =?utf-8?B?TkRuMEEzNG5IUkxuZExXZEptaHY3WXJkT1FZODBDdTAxY24yanMyS0R0NXlu?=
 =?utf-8?B?NktaT0FNaFEwUm9kSEFGQmlRSEZRTUdzYVRndW0xQ2ZZVllUdERYOFVnQklL?=
 =?utf-8?B?aHpkalJrUmxCOXdTb09tNUtKSGJwajFnWnh6aG8xdXR4c0ZJSmFyMEVTcUtq?=
 =?utf-8?B?YjRpdm1VNTVTRWxSTFhBUEk4ZmJvRUR5L0s0Nk9ZajRPRmF1YjRwb1U5bmFI?=
 =?utf-8?B?L21TRnphREJsZnlzeFFTZWE0ZTUzOFZiOFpGZ0RqK0IxV0ZvRjlYSFkwR2E1?=
 =?utf-8?B?eng5VW1UUmoxandSUXNqa0xLd2hseFdpbjA2QXJ6QTJjdVVWYWUrbk9nUUIr?=
 =?utf-8?B?VlIyUUE3ejYzTjY5K3AwU1JrTm9VQzJVTkRtUitBL1FGMVFyQVBqUUUyeStW?=
 =?utf-8?B?UU9IbVlNWldCVzJqNnh6TFNCODFpTnlMMmpHUjhaak9xbFBzNFFCbHJvb0FY?=
 =?utf-8?B?dEt3RnhlSHppVGdIME55RFh3enF4K1M2ZnlSeWUxamJrR0dGdG5yZ2tJZWhC?=
 =?utf-8?B?R0cvekhYRkgwbnZtTk5qT1hVSWZ1eG42anFJR09qTHRDc3JaaksyKzFFc0hl?=
 =?utf-8?B?aENqeDY1SStrSDlKaWdXeXlVbTU3d3orSUNSL2hScU9sR3UvMjZXT1NkanZQ?=
 =?utf-8?B?dlFscXdXZXRFLzI0OGV4ajhYdzMvb1JNam9JdGlXY1V6bkFKZXVjTlBrYXgw?=
 =?utf-8?B?WkdlNWhjSlpuQ0lFMVZMdnkrSVpVUjhSdGJhd2NBY0FCQTRKQW5IUkIxSkQw?=
 =?utf-8?B?c0VaWDBxOGdtOVY2NWVCWmFWWHNiL0ZWaXI4cTYwYWEwdXNjM3NkQ2U2Kzc1?=
 =?utf-8?B?cGxUQ2c1TndFTHp6bXJjWTBEWU40VU5FQUhTQlhDalpFRUZvenRBZ0FTWHRh?=
 =?utf-8?B?S2dZb01TMTdqZ2dYNGNlRHczWVFNcVBkR1hJOTlSNW1LS2xSWmFNbkZBeFc1?=
 =?utf-8?B?RGpSWXVoT3pUQWp3c29YVVlwVDFjYTQ2b3RSTDk5KzJtVDAwUTAwY2UvcDhl?=
 =?utf-8?B?eitBMEI3Ni95cmlaMlhoVGRtakhHVzNjWkFYMlhRVm5VT2hjODV3dz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 23c100f7-df18-4b5f-066c-08de51f48aca
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 16:06:27.7136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VpvLnv9DA2z/EqW0UuveSIkvU1yKn4MTVWN3h11Et1tAg9w/HpMHIYSzIzeJtx9RfflB0VbQT6v8IVCfnnmgLPpm6oryyk/p28AF7mJSsNY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10234
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 16:06:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229211

Hi Amaury,

Is there any reason why this patch is only targeting scarthgap? Are 
master, whinlatter and kirkstone (the currently supported releases) not 
impacted? If so, why?

Cheers,
Quentin

