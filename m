Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABF2EC5DF81
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 11:08:25 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14152.1787569696938870674
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 04:08:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=GSy2GgyG;
 spf=pass (domain: cherry.de, ip: 52.101.66.29, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m8HqiOaV19kJ+cK5Bu7C90BahlQXNbxkO4a8FgdkfhaHEY5A5SuTAjcDTldAbyJJoV0eFEs44bX4A/4R4b1UL6ZHaJKkOlS5AKJ6kfl/J3c8MDIMd531D2dY1aP0/eXrS5CImAzWJ2YK1Vbyz/F4/Ii2mJmKmKAEV6ftY0QzIi6rMNX8Z717jPLwPHIQ50BrxWwCcHjb8E5Ur3dryYQJUy6FfmiRlD2n/HvztT5vpCM7CrPxGZE/3SHRIh+0xV2RaoGXZ8DRoeUo0JG/z4b7V/0zzohhwZSiw5/T9DAvq6N3xXVXbEjX9CMNwFhFhMYrVQUVqyPmRqmIbtcT5dVG5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YLvicKEpD5AHUwZeDUSPKbdKHzjFG8x5rhj1GmgRYx8=;
 b=hexsggvYmnDXhX3liIrkEeoTicxHuJCLId3vMzZTROdIk0i+TpqAix4kEdR1wXgIfW4H3Hx/gYR9sVkgvArLBMgJdYTEswfns49owb7n2I68ydCFJJLdQhi42v8WnReM6LKKpzlbO828j+X8t+YyylcpXGMuDnYWS8/LvEos5goAaEk1yAVL+oF4vqsKscZ2sKIOa0VYhRn3aygi2sibYgl4SgSl/w6icWHl+8ZDCDR7lCvsZ3OqualVlcza4SNA+J+M9D3ZAkCpk52g2uu1jX1vDIp+9Kj3ej+VYXqHD66QLV+1IKJsb5GZ8gm+xXABPuLh9Ibtwad2mOxmDJG+Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YLvicKEpD5AHUwZeDUSPKbdKHzjFG8x5rhj1GmgRYx8=;
 b=GSy2GgyGwrWwvDJBuh2g6Y5Gszs+KDMptUpNEiGbpLzBDTcNhUD1R/JcO9O5dMbfqUPT0K9uub6/dShQie5ga2D6v2ouQXXL/s8/FJba9sCGcy31iCzV8j640uw+4cd4odPf9q2CL4oz+ds3rPJ3XJSqcZrCC3Vgu1BUSFd9vLw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 11:08:12 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%4]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 11:08:12 +0000
Message-ID: <683e7f3c-9107-40cd-aadd-975cdd2a64f7@cherry.de>
Date: Mon, 24 Aug 2026 13:08:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] u-boot-tools: add CVE_PRODUCT mapping
To: devanshp@cisco.com, openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
References: <20260824110158.26007-1-devanshp@cisco.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260824110158.26007-1-devanshp@cisco.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIXP296CA0006.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a9::13) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|AM7PR04MB7046:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bebc9cd-64a8-4cf1-8626-08df01cffcff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|376014|23010399003|366016|1800799024|6133799003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	tz7hK6AMOdxm8JiW9bvRohOWCSSxEGsBOk7yvvWgt0+7A0I01vwSMoeRrT95tjKjfdRqeZfuoJgHnjAAyb/U9uQH5GxRo1it2axU7Kf+XJeJADxE2pFV4Soj0htnoSiv6Su9S/0kNsm5UFqaEg8Q9xSgbN8XEaMob0k24A9uWclA5wI9J7rPJlaUkRobD5pMyN1n+aLALcqK4LKt6COBoLf2EgNv2SIBkWUboRK3EMkmEpVys+kCgTqMhoxi4aL2pSoL8VWz3dA79QCXkwzIVwoyjoyFcr2eTgd41nzr2qwk/4O2H/oasN3vZ29L9XygBe6a8nh7MdHA/UFAntGgDP7kc2WC6zoJbFvV8dSxlJg1DjOUDZmBI5KAammVIy5Eu8pWe/NpaSJ9jo8R4e6WlQjR8zAqX85kCCghW8dFdQwhYz7aC+JKZIeKX+NH1z/ipMW5p6rdU58Vbkj91IuG0sUsnhTskXXv4IJpUswjfzFubLdDlfY1DXVbLZ96IwrLoI8BwRMLe1pb8jMar6vHoGqKlwVh+lZb3NHLgnar/hp7dYmhPfqjaA4x9DPLKXmj4JWQ8jUMJ1RZ7bfLrTEk/QjV5q7k7JHnp6cRWVNHrokw9Nj7+Dr+jd1Mpwrj4zvRwTvr/d2b7ae8DYXQvUK0VxtNfT0AC7OvTlqvGCNb3Eg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(23010399003)(366016)(1800799024)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Y2dFT3BTM2R5WG5LSThSV3NiQ1hkQUhPL0dKVk0yRkhvL3IvRCtpR2NlQ0Q0?=
 =?utf-8?B?emF6a01vSkJhTHd6Z0V6bUhlcTFTbVZnSmpuTk1ROHdiS29oaElaMXZTODR3?=
 =?utf-8?B?ZlR4VlhSbTlyMVZNYlBBaWhIZXJ4b0ZNT0t6KzR1ZFpCZmlwMUVhbEdHR3FB?=
 =?utf-8?B?M0M2Y1M0bTViMS9oTDUxcjZHN3hxa1BkSit2dXVUb3JnT2duenQrNFJ2NWVH?=
 =?utf-8?B?Z1V4aUFIQ242a2RhNHZ5d09Hay9tUFJLTGdEeHgzc3ZDbzFBbzhjemFpcUFZ?=
 =?utf-8?B?Mk42a0Evck92eEtiV3pNM2FuTXFocG0xUFRWUGNUV0tYamgzc1lIQW9MZ2d3?=
 =?utf-8?B?WEtrdWVmU1V4Q1Nxc2xERUxybUdZVW1BMkM5MzRMRUdLVjhFM3dXdFJ6a0Y4?=
 =?utf-8?B?VDNsMmFBN29vUjAvcGduZE1OUFlGQVFvdzlZdTR3Wk9oQ2hnaUtHUlpOdzhu?=
 =?utf-8?B?SFJzcVR0ZEFZaUNvSFEyK291ck9adGhDdzI3RTZBV3p3UnFmK1hxM1NwTkpY?=
 =?utf-8?B?M3NHeEt1eEFJTmRKaDl1TFRsRkQ3RTNTR3FrSUE3NmY2cXRJRG02K092TDFZ?=
 =?utf-8?B?c2ovUjlYQ2FYZnNTV1h4N0FpV2hab0phdzRoajZpWFdpSUx5SkcwZEVqNTV4?=
 =?utf-8?B?dGRxTGJweEVBWEs3ZDBVVjkxT2NpZkV2eXM4QXNPZWVjVE10N1BiOGgzeXVw?=
 =?utf-8?B?S1NkM25TVnRpbm82VnN6MGlrOURDdDROcTVxMUpqTDh2c09ZNGs2cW16YXQx?=
 =?utf-8?B?eTZIMm1YWkZWcFVTSmFRZmtndzFEL2hGeWRibzdzWHFsSzNrR2VxdGZJQTEx?=
 =?utf-8?B?eDJUWFVrb0JqRFhobnB5R21TQU41a29YWG1XdkVodW5NcW9xdkpQRjFUUnM3?=
 =?utf-8?B?M1E2RjQzTCtRWXJHQ1VHS01XRmJ1YUhDZ0NwYXNobENTc2k5SnpqM3p5U2g3?=
 =?utf-8?B?MFg0TzI1WWtTSmdEeUNWSktYdWdIQXNRV3NvRnZ0Mmk4Y3NSbENwNU84QWFn?=
 =?utf-8?B?UGQzbWo1S0MzTXZlZ0xhV2ZuTTN2ZlJFa3cyU1htVnNKeVJ4VUlhVWducGJh?=
 =?utf-8?B?QlpBNHRZVXJpNnZEKzFnWE9SVGlmdFJiSVBqU3M4bDQ1ZEtYbmxmWkNlYnhI?=
 =?utf-8?B?QUpUQmVuWDdkNXVDTUJyQjBIRThvMjRDeDJhNUE5U3VlUlVyY0pwS3dJZ1BU?=
 =?utf-8?B?T2lxcEdyWmQybXluaU9qREo0eEp1MTQ3UHVWMnlUS29UMU1ZOGh6WVdkdDVF?=
 =?utf-8?B?a1pGaUdHSHlhUXl6TGxFdHBFeE9YaEh6Mml0c0pnZkNaeDNRbHQxL3Y2OFEv?=
 =?utf-8?B?UGNoU0ZqV0tRSHFrUk5leU5iQm81RWtTclpXZFd5REd2UHJkYllmV2RmaW5B?=
 =?utf-8?B?Ull0NWM4dWUyNjBjbkYySlhmT2p1YWVkS3FPeHdENFJid3VHZjZOZWRUc1gz?=
 =?utf-8?B?dTJhUXF6YXpoSzlNQXV0UGZIMkdIa2dIc0xPK3FGQVpJd3I5c1JUL3VLSGtS?=
 =?utf-8?B?YUZpajF4Tzk1OTRlcDVuU0lwQmhyek44anlXeXJQNWs4Q1cxbmJ6ZDNpNkU5?=
 =?utf-8?B?UU5BdFdrTUliclBiZWpFZ2FuWVhuVUVmL1dSS0dqdzFYQzFKZUR0MU9QRDB6?=
 =?utf-8?B?NFNyL2txNUpJNEgxUDdkMEs2MExKRkN6bFN5RXlTUGh3cGtNZUljTHkzb1Jx?=
 =?utf-8?B?RS9Gc21xcjYwLzdvN3FKamFSM254WXlMdmRzQWN4TG1pT0xJMklXVTk1Wk04?=
 =?utf-8?B?clhydjVlYzJVT3RIQnBMUWxUQmM3UTBDVFBvK1NPZGhQdGtaUGRtTnNtdEQw?=
 =?utf-8?B?dWRGYkdkQnE5Z3NpVEpmYnZZZVFoY2gzcUxpVnBjalYvc2QrZk1Zb3o3Y2JE?=
 =?utf-8?B?dit4bC9mK1FXOGpmc0lLV1N2K3RWTWdCWTFDMzNURFkxZmhYVGlJNlpRN21v?=
 =?utf-8?B?bG9EZ2trY0Y5VVV2aGw1VEtqN1UrUlB2dXBVeFU2cGt3dm1oMWNRK2xjQ01Y?=
 =?utf-8?B?WTRWMm1qTjZ1RE9xRXcxOGE1WEptbjJBbFg1Nk9zY0hNeVhVSXZrOWdpL1lV?=
 =?utf-8?B?L1AxclhNN1hYbEFCYnNaUDY3U3ZLV1NHNzFEYXYrODNIU3VoM1NnK091RVRw?=
 =?utf-8?B?RTJ6TWJ1WkhDRm9yRXRUVmk2UVo4THF0bEl6L0RDUzQ1cFNyNnFZZUxGcU5x?=
 =?utf-8?B?SnVkb1FJK3NSUVZ3MmJlbGtMaGJhbURxekp2YmR5NXZxaDhKcEkxK1pJT3Iw?=
 =?utf-8?B?b0tCT1lVZDhxcGpTRW9ySkpmcjQ4QTlzWkdQbEpRUDhwdHBmTEdqTE1Ed1hI?=
 =?utf-8?B?WG5FQmxTRGFQTWxZdUtwV0pHUGRZWG5jZWdwTEswYXFuaXJxTkUzajJ0azF3?=
 =?utf-8?Q?SE94GZyJPlrbVI5Cb/q4JvUyfPigEeQcpvKM1G4RqXOHd?=
X-MS-Exchange-AntiSpam-MessageData-1: wExx5ja+8nH8pqFM2Hgk/DQAFb5FJ36DNFY=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bebc9cd-64a8-4cf1-8626-08df01cffcff
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 11:08:12.5856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uibLrYE+OAdcyRQgb5Lw43Phw0898KnjPRdGw8QP2puTQ6xwoQQ6+RbwuhTP8vVot94Qf2nHD5IiWWFGBDGLxatc5cFAbEbMbTIRpiKvZ54=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7046
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 11:08:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244092

Hi Devansh,

On 8/24/26 1:01 PM, Devansh Patel via lists.openembedded.org wrote:
> From: Devansh Patel <devanshp@cisco.com>
> 
> The current inherited "u-boot-tools" identity has no vulnerability records even
> though this recipe builds host utilities from the U-Boot source tree, so
> source-aligned CVEs are missed.
> 
> Use "u-boot:u-boot" for the CNA affected-data identity and
> "denx:u-boot" for the NVD dictionary CPE and configuration identity.
> 

How about using a file that is included by both u-boot-tools and u-boot 
so that we don't have to not forget to update both?

u-boot-common.inc is included by both u-boot-tools.bb and u-boot.bb so 
that seems like an ideal candidate (if so, then we probably could remove 
CVE_PRODUCT from u-boot.inc?)

We only have denx:u-boot today in u-boot.inc, how did you come to the 
conclusion we also needed u-boot:u-boot?

Cheers,
Quentin

