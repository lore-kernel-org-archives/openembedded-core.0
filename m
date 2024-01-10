Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E99EAC4707B
	for <webhook@archiver.kernel.org>; Wed, 10 Jan 2024 15:45:59 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.41])
 by mx.groups.io with SMTP id smtpd.web11.14790.1704901548371891055
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 10 Jan 2024 07:45:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=JQ+IaNFU;
 spf=pass (domain: weidmueller.com, ip: 40.107.249.41, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W3RHL0nfrJnxXpb5T9HP03yrR49eaJtGIcivj9rS75OPTYeg+9HbdsY124xIBX7z1a5qC5TCpxikANat1qi0OD95HPkF8iG17WVMTuC6oNmRuMLQIXJRPsRxOGko7W/WBf07Lkxme6ulrbuKm+EdHG/cpqCKZaEnCgybfG4CKoWy4ilrKQF1sFWTvyurm6X6/+MchdkVwhqIRlO4CP0BH5V4nCj+4MDtnbV2oJM/zigY5Fvdy2DMBodkFhZiq2nZ7lSe2L5MiuaiVFmi1Zz5+1VCRO03NVxN0G5O3QRKnPL0bGSgHm/eqQuLT0uJ3HblDGf0XCicj4eC8Chi4OgDfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MejRqS6hlLnuwSwZVeKi5UXY86ZPuS1bMWyLqjK/2Jk=;
 b=hDKf4svgIBa0eXjSMxFT41IBk9fTxFFWiLRZxoapjorG3SYihaHwSUHqBQGtDfvUcrZjove/AEyl8rmYRcPsDOedlXAt2NVz30k4b+WagBeOyZLuCxi4mu/NnobpsaNG7NMFCfw+siiLo71YZCvWrT3by4xvAemKfxVusFHRFXxXBnZWTMUl6/ZgZ3tG1JdxgoQlCJv+/UAjZ8rd9e92F64krcBfVUxPQpFthYk7JCDfAd7NMSGWSRGj2cai1FhfTVbTP0a91QLfXQ2GsduIB+ejZO+mJVuimuweG8KEfMVLWaBMvF1NWZdqkF8+4cNqtBoBaGJGn/cjjwB6rloB2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MejRqS6hlLnuwSwZVeKi5UXY86ZPuS1bMWyLqjK/2Jk=;
 b=JQ+IaNFUFUcLQk7a4KD0TtrUQAaw+AKv0UNXPezaGA0hn6UK5wNoIev6O2WICc0gYfM0N7MwUyLFzf7EKZamtBYy5wJjIY4zBptxcR6xGHLRiA4qTe3qCUXMrA+l+adhc4YATm/iUpRpCW8Poy+bDneALEfKBiYU4OLIuXs+VAU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by DB9PR08MB6521.eurprd08.prod.outlook.com (2603:10a6:10:254::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.18; Wed, 10 Jan
 2024 15:45:44 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::daa3:b3af:ec52:4278]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::daa3:b3af:ec52:4278%3]) with mapi id 15.20.7159.020; Wed, 10 Jan 2024
 15:45:44 +0000
Message-ID: <3ec7d9d9-c1bb-45ad-ae57-54ff7733d487@weidmueller.com>
Date: Wed, 10 Jan 2024 16:45:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/3] recipetool: Don't fail on local go modules
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Vyacheslav Yurkov <uvv.mail@gmail.com>,
 Openembedded-core@lists.openembedded.org
References: <20240110115335.92914-1-uvv.mail@gmail.com>
 <8a756432917f8120a8e2d0d5b1e8ee9daebd6132.camel@linuxfoundation.org>
From: Lukas Funke <lukas.funke-oss@weidmueller.com>
In-Reply-To: <8a756432917f8120a8e2d0d5b1e8ee9daebd6132.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0062.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::11) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|DB9PR08MB6521:EE_
X-MS-Office365-Filtering-Correlation-Id: f3f15d5c-262d-4f92-b82b-08dc11f334e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yFCkYNwF0t7DJq6P8Py9MMOPeYpD5rTJ+fikBqXOdjFd4/AWWQ26jUFH4scW7XbHQXs4PGlf1go9x3aDXpD1aqvaRoBmy+WR8Rmadmydo3cXBRqVMLomvsbg8r82rDllVqGiTx2MjTcFRbvo5vvDKT+kcWIfZhXT9pVlgpRIeVw7oJW7fa6VeXLaehJUAhaCyKKhVSt7w22sOoTi7enljxlYt1ZRoKnEoDbp6ZWS4OXP+k5wGISAUwzCreD2f8DiW8PNIghECf29z/hZs23EF10nVoI3rGxUXewoiRILPmoZJNqEurTp+2fqEfSLROknFg7n0iArFk3Wr8uqDbR4uHyDCmbzR93obA8xd/wa1FCN1rDtnCCpRqPJefXq9gMyV11ai8XfCXFFRpILF1NG6yAcgVddvns9ORV9JKb72QB+EROMcmh9Dn4WoULa7XfX7JU8uO10OFon5Q/EiHVjDfx8q3wMxVG13W4JrSsSYkRc7/l5U3qUBa/r1r5oQy88RtuW0D6T1EqZ6fHol6Ucknfj7Np5vr1JoajufHL5DpxJ4iYSie//9K2vEaCHbiJyfcJt0eSYlLImbVuGyXBZrz2pBAIMHoBrGikKynJiiclCZ4UxE82Njlgev7nKL3f3VYb5Y5IaiGzVGROCdmG9oA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(346002)(39860400002)(366004)(396003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(31686004)(83380400001)(41300700001)(36756003)(86362001)(31696002)(38100700002)(66946007)(2616005)(26005)(6512007)(6486002)(2906002)(66556008)(66476007)(478600001)(316002)(110136005)(8936002)(6506007)(5660300002)(53546011)(4744005)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dWVjaTRRL2Mzam9rNHhub29paVcxSzVBV2V0QXBmQ1dsODV4OS9uM0pUYnF2?=
 =?utf-8?B?cmlHNFNDd0FzM0MxU3ZrMXp0aElCRy8xQ042alFjM1VJSUc1RVJPOHBRV0l1?=
 =?utf-8?B?cDQ2UU4xZWJ5RTRXM2ZhR3N4bXVzcWdrcllVK0cwaExWalFBNm1pTnVvekEx?=
 =?utf-8?B?aVdEZ3dIM2grUkRyYVNydG1kUzkzTFpLWnp6TExzazNia0NJMW5GNVJvMVlT?=
 =?utf-8?B?a1lHVVRCaTV0OW1IS040bU00WFQrWmFnMTF6NDAyam5KZGU4UlhRREgzK05p?=
 =?utf-8?B?OExnSlowaDlaR1BWbDE3WWVPcE5scWgxOFByem84TzJGOUZCZkUxYnRsUTdX?=
 =?utf-8?B?bUZRK1R0UW9hTnU1WGRkWmt4NTNKUVdSTGlqVkFmQVZuODFJUngzb0dab2Mz?=
 =?utf-8?B?QXM4bXB3bnVpbnVmdUFja2d4cHY1U1BwcWdSYnhKam0vTkZZRkQyNHlTN0Jz?=
 =?utf-8?B?Ni94QmlGL2hDRk03b3Bxakw3Q1pGVjFHWERablNYNGV3azN2ZlpYb2FPdWhM?=
 =?utf-8?B?eW5teUtENUY1UGkyeGlKL1MvYmtBQ2dtNkhFTUIzZUoxbEtpWWFxQkw1ajJP?=
 =?utf-8?B?NlQ4VThMMHovNXlDNW1GbWFWVUpwUldWSlpJZi9HQnhYN2I4RitWZFA4TUtI?=
 =?utf-8?B?azdCOVhmeitmalZ5MnA2K2xSQTNIN1hpOFIrOVNTSmxUTDU1RGNEWmVmM0hW?=
 =?utf-8?B?M0hwY1M5NlRybFRkY01VVUNwWTZYbVhKUlVWRnYvaUJnVmxGTU94dXgxZ3A1?=
 =?utf-8?B?cDJGRi9HUWpjQnZsQmhCN281aE4xcFVQOGNnL044MGFwTlVIdDRCVzA4VldU?=
 =?utf-8?B?S04yRk5CbzA2RzRGTzZ3K0hTaVg3Zm9QUU94MWtIaTRrcXNIaHRweWtUUlR3?=
 =?utf-8?B?QzF0OXZDM25UUy9KdUYyRVVMZEs4K1VOM1JrWlpha1dKRE5hWGNMd1pnSHor?=
 =?utf-8?B?YlU3bitna2RQMFB2NWZ1ZDdDVStXYW4yM0xySnNDTXRETHpjOEdoVEVRd1d6?=
 =?utf-8?B?SVY1dGkzTjUwaVVZSHBjbzUwZHBTckg3ejFjMTZqcTNhdmZnYVJWSG40aWtn?=
 =?utf-8?B?SEUxS3NZSjR3K1p5VkIyNnpCbG1KYjhFQncwbkFISEhraTBPbkNEcDhXWXRL?=
 =?utf-8?B?M2QxOG90TE9BeHQwNU54K0xEdUlsRXNyUzcwdHdjVjJPQ3pkNTJncUd6aDJp?=
 =?utf-8?B?TFZrSjM1L0ZkdjkvQ1JiS0UzaXJpb1NHOGNKWHB4a0RjRHZtYWtXVlA3TzRE?=
 =?utf-8?B?SjROYmhRNHlVVG9VZTl4eDBxaXlDNUtBNjUvZUhzbWwrMUZaaXhaQVBFS09C?=
 =?utf-8?B?ZE1qUnBxL0dRR0pZRzN0Wk14SVBqV0R6a2RaZHZYdk9FaWNTMUZaS24rMDFJ?=
 =?utf-8?B?QXdQTUF5d1lNL3N5SUZyK2s1N0UwY1VNQUNnRndrajc1VnBxZUN3djNKWkkv?=
 =?utf-8?B?bzVxRWFqYTFQWEJkNVJ6c0FWZzEyVC9HdlZXV0FzVmxnV3lkblh0TW1Tb25L?=
 =?utf-8?B?UGdvNWthVnpmczhaL0hJTVNtK1FEWmJTdmdjWVdBanhKTTdYcVk1VVZHTmpC?=
 =?utf-8?B?YXkxQWFEL2x5TnY4Y3M5cEpvK011ZDNIYzlGOUxUNGpCTHhTOC9FTit0YnVW?=
 =?utf-8?B?SFltVTF6SDdhT3lIWmxXSGoyUnJJYVB0Ni92cVZlRkVPajAzc0lCZURIK2FF?=
 =?utf-8?B?b1k2QW9UY3BKeHBoSC93MFRSTjFHRWtrV3I4ZlRsMUkxd1FyeGlDY2daaXpl?=
 =?utf-8?B?MmZvY1ZjKzdTVklMSjREOVVuQ3pUREdXTVZJcGR3VnlQSS80M1AydWxDSnVV?=
 =?utf-8?B?UEJEOTJ4R1pxMFdkcW9vOG9ManZwSjB5eTVnY04vZ0RaaFJ3TEMwa2JXMHN6?=
 =?utf-8?B?cVBwZW1ETW9LbXRacVVDSGw5ODk2WTBjOVZtekF2Y1d5elAva0s0ckJvaWhV?=
 =?utf-8?B?c1BxZ3R2SlBIRUxVRTFFVlBIemVhYzlyM08xYk5IZkh1TnAwSlo0SE9UMWg3?=
 =?utf-8?B?N2NUWjNZREhnbGorbXRjbys0S2RiYy9heUlTblZ0ejY4My81TU9ldjFQYUpl?=
 =?utf-8?B?cFZaTUg5bWtKSHhOWERrT01PSkIvVFNvTUVHTlYyWHZvaEVOSXI2RllxNEJV?=
 =?utf-8?B?SVV2RmJEM242SytoTXJ4U0gxcndwU3gvYmFwYUZlcTNyQ0ZoUlZvc1pxQkkr?=
 =?utf-8?B?bXc9PQ==?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3f15d5c-262d-4f92-b82b-08dc11f334e3
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 15:45:44.2854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SgIwyKE9aDCS4Bn3j6wKrbuU5UFdriruTBUrM+7xPBDJA0WDXvRcCIVVY3bxIJKhPs3OGbGR8rm3piNaClEmew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6521
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 15:45:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193515

On 10.01.2024 14:59, Richard Purdie wrote:
> On Wed, 2024-01-10 at 12:53 +0100, Vyacheslav Yurkov wrote:
>> Local modules are usually referenced with a 'replace' directive in
>> go.mod file. If that's the case, remove them from populating SRC_URI.
>>
>> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
>> ---
>>   scripts/lib/recipetool/create_go.py | 32 +++++++++++++++++------------
>>   1 file changed, 19 insertions(+), 13 deletions(-)
> 
> Do these changes mean we need to improve the test coverage in oe-
> selftest for recipetool?

Test converage needs improvement, yes. I haven't considered the case for 
local modules since this seems to be rare(?). Are there public projects 
which use this mechanism?

Best regards
Lukas

> 
> Cheers,
> 
> Richard


