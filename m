Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6539ACC6B29
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 08:54:20 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8895.1791968055607953583
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 01:54:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=kXY6Zi7F;
 spf=pass (domain: est.tech, ip: 52.101.66.18, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CdjXqZQptpyz1Z3psyFi40XBXufIlKHscUY69eVDbpU89SOkYK6/fg8qtgx+DRdiS9IvhSArQlVAySQq7qk3F3m9Cx8tF9+KosqhiHTPHtVoIcvUdpv9Wmn3rNXH8qoWLg3tP8k20cLObBKo/v/5n3nlnfbWjPdPTjrtAVnXlkUxSWxnZ3Q7MgUgEnSs5kKrya1FIiX3vvIsH5WFzx2W6KJA0KciJT7VdFwBAqlvkm+BsvAzcAh6SOqP2LKkT6wJL+hDFvuFhS4/UZ+MlpzSuwp1rnjrrNiAodoXPiHionS1QNfhyEDzRKsOZK3YXaXfDX+3OaYFD3d8t9V8aVB/uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N4p4Nf00/jQvcJ60ABbPlrQaGF38rgavuDcyUM+M7r4=;
 b=e4zQXt8W/50DRwuLDJuSJzGtzJWv+4lYYy45ij16wJhSZmcCmA6gPaD3BWwMKHzta070zEvFBtThgOH0kPJVrSl3RdpqdLdqgSvitORb6H6mgPoeNuNEVl4ZGWFXlq/JDBaXiJOQ+dZpA8qy7LeYFgXeRBQUihXO+IYtWZa/r8qveUbd3T1lNmdYAOFzh6Ff4cbrc5Q4x6sNJuifXGm7Qi+PS+8RaCvucfjIfUGnln4Uxon06XXwHtwBoqEETcIYP8Bosd3YsSZHeAbUJD6fY+8mHdD/iGPDxIUv/oyDccSnqb72OC03BcSST4/xxu/Pg8HxxW7hC/Kovl2XmzU8bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N4p4Nf00/jQvcJ60ABbPlrQaGF38rgavuDcyUM+M7r4=;
 b=kXY6Zi7FWCTXB1dwBSrRZKOQtCW+MYBIyhf8eRkjnPLYGSDf23D9YvilZxEKhpzDT2zI+LUW780KfV/+0f8xRzwn3OeyCjIlnVbE4tKES3KvmnYx0xQj6JBOdyPexljLkHCCfW0BatES5d2bGi8fmJo6pIF1kCb/XIuBjkOd8P9A/3WST6ydRcSGo8TjtReZzfgBRvTP1GmsLBLKvKhu7KmG25GIsfns6uaap1cklNfplPwjsZe6mKrF/ZEAelUHJmBqt6F/gdxjgtn/e5wnT8RBqRJLzRwmUU+l6/BgTIlKx40586NlmwGpx18sPIENWXE71x/KcOF9lTL3A2CFaw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PA1P189MB3467.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4f9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 08:54:11 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 08:54:11 +0000
Message-ID: <db708460-55d3-4b11-aca9-5f790a57eac2@est.tech>
Date: Wed, 14 Oct 2026 10:54:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][PATCH v2 2/7] libpcap: Fix CVE-2026-31912
To: Yoann Congal <yoann.congal@smile.fr>,
 openembedded-core@lists.openembedded.org
References: <20260915194520.45847-1-jaipaul.cheernam@est.tech>
 <20260921201715.79085-1-jaipaul.cheernam@est.tech>
 <20260921201715.79085-3-jaipaul.cheernam@est.tech>
 <DLU7MXCRDG6L.3GEYY13WESLNP@smile.fr>
Content-Language: en-US
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
In-Reply-To: <DLU7MXCRDG6L.3GEYY13WESLNP@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P193CA0054.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::29) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PA1P189MB3467:EE_
X-MS-Office365-Filtering-Correlation-Id: bc1f8840-c6e8-4e3a-e179-08df29d0b702
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|10067099003|22082099003|18002099003|3023799007|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	QmmfN2qG9LnDUZ7fOkOV7Tld4fQLdxPA/fMvphIjuwjbIilMVaAHSuSGIqVrkeafnZPITsv4swNECNOUZR252aqoUpe6p8ib/z3M2SuaZbuoCTvj8W6uqpBkfyub/utwYlBSwGZ1oZ5+p0QOFIVb4LL4m3gDZwzEyr1cpO8wSGQ2ob5ddgazTogU3RDWFkBsMbSmrmj6Z7+GMEDlodVFEBYUzhCRoDFidCdtzLe8WnGnqK0RgVqE0QwE9d/rQevdC21FqST3e6K2Tql4z6CfGc3jz7T3bFKj9pzcyJmYvUyXzj/yS8tYFRh9Q08A/W+xRW6VTSiIQcv1sjNB/AgaWMCt1rLdSL++5N+ryE/7vI5WR5zCKfeQNctDiU31w2qncMS3wF0qIANe2DSIFGTIbRT5xwoEd47gzDvoGUK0PX7jiTZ7YX/8i+q7MtkNWam7CIQO2bsrWswz641zVQnvu7eaSwjZxpFJKhIp3rgU5meEHbZPMAHOOM3O1N+uCpYmFiHWjAI95opul2yHW1mS/zrWJZF5fUpwDKtYQgYdisHVVGQQRU4oY1j0P/tRGiUhUXZv7LSBWjyePKn/Uj1m0Gc7EoUbVvy8Pb9/Y2lcyvDq/aRvtV740aZfrS9DyEuinfj2UFv0quRf/Iq1DQEmzB3MBQZm3KYxs4O5NIA2MbI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(22082099003)(18002099003)(3023799007)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QUFaTzNqQmM0NUdvVmZoYXI1WEV1d0RaUmExd21hV1VwWnNRWHhvT3ppdDZt?=
 =?utf-8?B?bTlnMi9RWForc1hhc3VvT2hoNW9uWFBmRGNERGhteng3VTJMUDBpSGtKNUpT?=
 =?utf-8?B?MHRyMk53YWE2QTcvUEJBQlRHYkhYSmZQbWptTVJkMUxHM0dRNWFtbU9CWFo4?=
 =?utf-8?B?dGxkVjF6bkExNWMxQnpxRDROYTJmd3BhMytWK1Q0Z3BqL2VhN3ZiYStacVI2?=
 =?utf-8?B?VjJjMEhubG05cm1iOGtMTWhBTklJaE9XMUI1NmpxbjZYaXhESlE2OVJldzNr?=
 =?utf-8?B?NnlWZWlrMXF4QkUwcCt6RHlLRy9ZWS80S0g4bHRwUGlsSVFWcGMyNGpzNGRN?=
 =?utf-8?B?R3E4aHJWTUltK29ZN2lKWTljSTd3aXJySkI3RHRjemxQaEZISVpDS3RnQTg3?=
 =?utf-8?B?aXdlY3VQYXo4alpobGx1ZHd5OFNaV3E2TysxVnVKcjRHTVdVSlRDMGtCRXY5?=
 =?utf-8?B?NG4zNkVCeTZjRVY3TUpwcWg4RktMTHRDcWNUZGpjOUp2YmFWMGlIRUZDamE2?=
 =?utf-8?B?T0RqN1ozVzdJNDk2VEVoSGN3NWRkK1BsUlgwYjErV1NhY09QaFJZVVZzd2tQ?=
 =?utf-8?B?N21CRDliakxkOHU4QXRoNXB5VkpIeERVNUpPWDlhTlByNlR5WlJ0aUF4RkpJ?=
 =?utf-8?B?a29qT0FuZERPNnUzdmdxSmljd1lxekVCblUxT3kvUmlxYXVDc3o5ZldZdTRn?=
 =?utf-8?B?THdqYUt3UEd4V2dEa2RtZ1c5NUp4N0dJRVlaSkh6V2ZQNjd3ZDd5K3BRcE5F?=
 =?utf-8?B?UDczVmt2MkFTb0tBL1NpTWtUU245Y1kwWTBuTWd1enR2REFTTWczZlRRSkNB?=
 =?utf-8?B?SnB3TTJPUUJnUVI1a000aGhIQ1FJNW1waE5rVHNSRlpta2phd3ZvY1pubDlq?=
 =?utf-8?B?UFZ3SWd6NEtMb2IrV1NQckdvOHNDWjUrT2lSNjlobEdEME5LZ1FEeEF6ekk5?=
 =?utf-8?B?Z0l1dDYzNTcyQmptTEsrMmd2WWFGanIya3NKSUdtSFJDRzNCUnlpclRobTA2?=
 =?utf-8?B?TjBoa3VIcUY0SVhmQmc2TE5OSXpRWVNFSmxhNUE1UVZoZEtsSFVOUVBRbkZq?=
 =?utf-8?B?V3FoL2krR2FRME5SeXhrOE1yYmdObDljM1FVSWhqMkV3TFVDSndxSU13eWgx?=
 =?utf-8?B?dUhaZ1R6ZlpadTMvdGN2c3c5M2xja3BzdmVGVHVYYUdOcHQzR05ZTFcwbDBZ?=
 =?utf-8?B?Ynp5QUtDUjdpUGdRRjhSMFo1MmJySXBPem9VcktXTjliUitwM1VNZWhSK0Er?=
 =?utf-8?B?TytIMG95RTdleFlYQVIzRGRCdythTDZDY2tPa1VESWRQd0RCSFRMcW8yY3Fs?=
 =?utf-8?B?cXoreTlQZFIyM3ZQZVpTR0hjU1JnVVQ5RCs4L0lhMWV6VU5TeDU3enY2UEhD?=
 =?utf-8?B?SmRQZXRoaUFIeE9KYk1KTDhyTlJ2b3lHa0srSS9PZy8vTS9LNVhOOU1WaDBY?=
 =?utf-8?B?Tm1yTnRheXpYenorYzBmNHRoN3NRaVY4aFNLSHdGNHdwWnY5YzFKdG9KVHJK?=
 =?utf-8?B?aG5Ta0QyaC9ZcFplT2hmeXFjTGVpM3c2bXhNeCtpeUpMeDlsQi92d3dFbWd3?=
 =?utf-8?B?UHRiSTkxRDB6bmh4aU1yNGgyV3dZZzBLeVhsYjVsL0EwZWN5ajNob0pvajNT?=
 =?utf-8?B?ZERnQ05UR25sS1dVQVdnaTVNR3QxaGxqOGp2SGdDUDJmOGZESTBNRS9tTjNk?=
 =?utf-8?B?M1NwL1Rnc0NkUkxJdUJsS0RYQ28xM2RmeDZGUWN1V3NxaWltQnV1ZDVEcHR2?=
 =?utf-8?B?ZHJtL3JFK0pqYlZFbU14SW5kMlFoaEd0Uld1a1NadFpqaHN3alVRUCs1MXl1?=
 =?utf-8?B?dlkxVzM0M2VLQVN5bjNaay9rZlRXZ2hKOTlKeUVnK3Y5czh1WjJSd1JVNm01?=
 =?utf-8?B?SGRxMGZQRE5NVGxWNkhWbWg1WDNtY2VFdS9xaWVDOS9oYVRWSkJyVk1LZkpC?=
 =?utf-8?B?aDJxRGNaRk83WjFhR25HQ1lhME85SlB3NG13bG9lb0hUV0RUbjRzcTZaZ0hK?=
 =?utf-8?B?ak1Ob3J2MHNsNmJ3bDgreEhnRm1KSGtWbndYM0hkUm02MFQxdWRGSEMwMDZo?=
 =?utf-8?B?YUFobGlLSHkwazk4UTM0T1JlL01TdjdCek9LclBUeTdCUVNRZ3cvQVVBeWJn?=
 =?utf-8?B?WHlYM0ZieUMxUURpQW85cTh2K21VVWRmenhLY0dKMHU1b2YzN2xEZkNMVVJ2?=
 =?utf-8?B?eGp4WGFSbzZqa3dYa2FBck1TaE4zUnkrb0VJa3lEenc1dEtCa2JpRFkrcG9r?=
 =?utf-8?B?RE1wUnYrVXdoeWZCajdVSGo0eWkzbzhkVmxRVHRpbkM2NlhlckxJWmhVYitQ?=
 =?utf-8?B?bzFoSkZQOEd3LzJ3K0pCK1lrVHZQMmVsK3hCVGN1RmJZMjdhZ3hPUT09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: bc1f8840-c6e8-4e3a-e179-08df29d0b702
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 08:54:11.1764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N9pm5iKdm9559lskblF1fRZqj/1LWwpHUxc7JBb4zRhyoVsyrg/OeymnPEOA5wSL2p7NJNBqKeHH0tt6/BzlsRHM2/Pi9n+wuwehjjjsR7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB3467
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 08:54:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247749


On 2026-10-02 10:30, Yoann Congal wrote:
> This also drop a pcap-haiku.c hunk. Should'nt we patch pcap-haiku.cpp?
> This was before it was rewriten in C.
>
> I may have missed it for the wrynose patch but if a patch is needed, could
> you send a fix for wrynose as well?
>
> Also, please check that the backport notes are exhaustive (e.g. there is
> also a missing man patch for which a note would have been appreciated)

Hi Yoann,

I will fix and send new series and Yes, I missed about haiku.

wrynose looks correct , so no patch needed there.


Regards,

Jaipaul


