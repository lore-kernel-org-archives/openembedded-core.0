Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C08CC25B75
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 13:46:11 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.97])
 by mx.groups.io with SMTP id smtpd.web10.15906.1716471961975462302
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 May 2024 06:46:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=ClVG6kK/;
 spf=pass (domain: cherry.de, ip: 40.107.13.97, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D1HcfPYGI7JHT2r1WWjWL+usRoS6afBRwVJj4nwdZxFWUuYX7Fv0EP8SVscXXMK2B7UFGJjHVV1DddykevrHilHWB/9JQFHZ9S5py33UQGoVLvShkt835iBR9ej6ztUNXMPbFVcM39onU46aaoxsQ4TneunSPUKbHqufeTEjuA73M51yfCq+qEB2j1zmp4oiA4cF2axiFveO0hf1EvyAblR4GbQOVegBfC7TOA6FJN7ujs4Jh/Gwa3ZJmpgD0p+wkEHt5yUNYlkTPDl+cTvKPJrQH8i0Am6Hg8aK0eYHgpL86DYAX4wDH3yhEaM22NMw0Sl3Y4Dr5dmXrrDnuwYphA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yc+Wl92CHFTU6IUN+zcSD7r8V0gHAgFQRxHPKS1s8og=;
 b=d5l/YsaRCB5UtomjU+Tl2JpbwFtQRc8Zck4eHvCYkwEPHoMGAf0M8oM37B81TJCYIRyaDDnAfEVTt+A+oFy/eUsxeTu2lfuuFei43C/idz7+NW9y8sLswDO/mS+tBJKmQhs9O6q01q6NVwBrnRHnetW/uU78KBtkIcTJb4XajiPGiVaIkJrTXcqQdAZy2GcTCjYZUtPrrGj2wgCker8r2kx4tfextzm6TQquHahEU/zB6ZH/G9y1qQ64bLpvwxByAjq3J8M792+/6jDhsu5ZMa/ocrDJLb7MTQt01PtrV9H0BGyqZrpoI2r4NKEMjjd0b+1Va3t1Aj7EuVSx/2uY5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yc+Wl92CHFTU6IUN+zcSD7r8V0gHAgFQRxHPKS1s8og=;
 b=ClVG6kK/es2L0ETySJ87xOBFDvvNKorC04lyuXiklsZRxW9FaXAtsKr0mc0zcDReUL5sZq6B6IcjoO776JkMTASxxmsfa+G+sd99NqPk3C/bzqs1xQ9ClI9+sRakIHZLDSHX+FwXnNFCrsf26gF47L/JNshryhVLsRikJ9iDU/c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM0PR04MB6578.eurprd04.prod.outlook.com (2603:10a6:208:16e::11)
 by PAXPR04MB9350.eurprd04.prod.outlook.com (2603:10a6:102:2b7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Thu, 23 May
 2024 13:45:57 +0000
Received: from AM0PR04MB6578.eurprd04.prod.outlook.com
 ([fe80::b0f9:e7f8:2613:eefd]) by AM0PR04MB6578.eurprd04.prod.outlook.com
 ([fe80::b0f9:e7f8:2613:eefd%3]) with mapi id 15.20.7587.035; Thu, 23 May 2024
 13:45:57 +0000
Message-ID: <f0452dbd-636d-474d-b87d-caf6c0680843@cherry.de>
Date: Thu, 23 May 2024 15:45:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] scarthgap backports
To: peter.marko@siemens.com,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <AS1PR10MB5697A571F24C68195FB82070FDEB2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <AS1PR10MB5697A571F24C68195FB82070FDEB2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0014.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::22) To AM0PR04MB6578.eurprd04.prod.outlook.com
 (2603:10a6:208:16e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6578:EE_|PAXPR04MB9350:EE_
X-MS-Office365-Filtering-Correlation-Id: 376dcf4a-6453-4344-4353-08dc7b2eac8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RVdoODFQcUwwMzVvWjRvZk0zQjVsejdHT0QrTU9PMzhIVzZKV2VkN2pydDVt?=
 =?utf-8?B?eUxoUzc0Rml1NUlydWZBT0IyVFRVQ2l1TzdZbHFzR1RhWjhqMk01WnlwT25Q?=
 =?utf-8?B?Q0lrbVcxVEJxK2ZiSEZ0Y2xMZktlOFFEd1NkeGVVYnRZK1VHbGRObGl3VEZi?=
 =?utf-8?B?WElaQ1lhZEVZcmFFSURHZzNKRkJZYkNwSmZUd2FPa3ZubDNoRnhwdllTazd0?=
 =?utf-8?B?bXpWVWxjQXpuclFadFhLbWF1L2dSSWhLMHRxQW80Mys5MEhnV1dlSWJHUDRS?=
 =?utf-8?B?aXdtTU5kdFJReHhlMHNVMHJiTlhQQWlPU28xc09kVndnbEQxSit4ZUxCVWU4?=
 =?utf-8?B?WnI2QVk1YjdBTUMvNzNid2RHS0JmRzArZWxRUHRPS1hob1IrRmxpNzkyL2kw?=
 =?utf-8?B?N0lkZ090UkhpaVhnblNlOHdNSWpRT2x1cFF1MFdLMG9TNUxUK0x5a2JvNzhx?=
 =?utf-8?B?cm4rUjBnMlpRQ3VOMVdlTnI3YndXUURKZVhZNjhFQXhxcVdycForR20yQ1Jw?=
 =?utf-8?B?Wk1MT2xtSDdzME9wWGplalZHME83ay9NUmwyNjBIWmpZRHJCa3NGNjNRa2hz?=
 =?utf-8?B?bURlZzVBdFk3OXJyOVp2dzNpQjMvTlNHNElvSVZDUnFLd1YrV25paG12YVZZ?=
 =?utf-8?B?VUk5RTdpMERRRDJ1c3lEZkRobEVCdDVTUjRwUCtHRzQycGtlK3pxdzhqMENO?=
 =?utf-8?B?d2hxWk9ZTmNNcVVJSnFROWovQ1l3T3NUWUFsc0ZnWnBlcGpjTHA3cnJGSWwz?=
 =?utf-8?B?MGkrdDFWa0l1UncxNGNhQ1ZDa3ZyQ21xS1VlU213YlcvRjFISmo0NlVuRzlX?=
 =?utf-8?B?MlZqZ281ZnNvZ2JHNGFSNVRqYjRUY1ZtMC9xVHk0VDRvT0lJa3NkdDViNFVM?=
 =?utf-8?B?OVRYMzFEcDdWbzdCRnlNZVF2T0NUWVBEWGN5VThLL1l1Mi81blEwSHgxVnVZ?=
 =?utf-8?B?VEFHTllINnpGQ0tvMlFZQ3FNaE9Ec3NJcklOT2NGRGJNNXdMbDY0VDZHMVRu?=
 =?utf-8?B?WThWTlRZUWtPSHFMN0FGbHMzdUhvcUQ0blloR0QreG9TbnN3RkpUdW9UMDBu?=
 =?utf-8?B?V3JZTlpnQnhYSDhpdmNlZnJHUm5jOG5SQmk4eTBKdzQ4WkVvR1lORjBvUFR6?=
 =?utf-8?B?NkRKMEMvVnN2a0Vtb0VHenBMZGxHQmtaR2hBWEVkS3lZampzalZVaUZQczNG?=
 =?utf-8?B?RWRocWFKVlJpKzI3MGY2S0lLT3pwNVhid1pIc0RrQjkxNnowMTl1cjU0Tk9G?=
 =?utf-8?B?TXUyNTloZDdCR0FhTFlWeGZidWhNS2paNXhTdkl1SzVQK29XRmt1dUt6eUNW?=
 =?utf-8?B?Ukp6RDN4OE81RDNnTlIvOVVwR3lJa1QrUE16M1lZMkVmUmxSRVRwMjA0elF1?=
 =?utf-8?B?L0dGbUFYUEo3Y2dNYS9BTXlFemJoN3NMZktsbjRWUmRkTW1OM1BtdGcvV1VN?=
 =?utf-8?B?ZUxub1VkTVo3MlJMbThiaHhYclJrVDd4L2ZSR0ZRaWtNYXNRb3FucjRveVgz?=
 =?utf-8?B?cVVkTlNGTlYvOG1oUHUwZW1zQ2ZDSGQ0dE5IWVFHVHlBZVRNZzFpYVFEejdh?=
 =?utf-8?B?OVZLL25mMUhickV1cWJ4VmJwWGo3V3FpWGJLSXBtK2UrYmVTb3FGRU1aa1VH?=
 =?utf-8?B?N21pMTVSUVdCb2FtTzEvbEs5TjNVNmplYkppTS94TWJ6SWtiWFhtWnJUUUlH?=
 =?utf-8?B?cVowMis5dG1hREVXS0MxTzhVRytQeXRJUmdIVUg0MUFURWYyZldkTlRBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6578.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TGxpRnhNZ3ltN3g1VlNNK1hRMEdjRXpqYWRrd0Y0SG9ReTVXTkhoYWluWVFF?=
 =?utf-8?B?YzFjdG1lOFFXdjg2YmhXUXBvOUdiZ2dNaXF3ZFNhK21JV05PckZBT2JrMWlL?=
 =?utf-8?B?UDdRcnozZXk3MGxrS2lRM2dkdCtIZXFkejVJV2I3d09pQWdWcjZ6T1dCcVVO?=
 =?utf-8?B?T3VMRXB5bExBeE1wV2pUUHR1WVpXWFUxbkFKbHJMcXhpZmhSTkZDeTlXRFlZ?=
 =?utf-8?B?SEw1NXNiMnlUYzM3cEo1YVg5SjJzL1M1VXQ0dS9xVzM2ZjZmNmU2b2xDRkFw?=
 =?utf-8?B?VTFGMkUwSDhuamg3RFFhaERjYWVQS3Z6Zm9mS29HYjJNUG5TWDczMHdMQzk0?=
 =?utf-8?B?aVpseWk5T1Jla25oa3BEb1haNVkyM1FtVUZEZDhPbVExZkxVU3pvZzNLMVRs?=
 =?utf-8?B?RUltQUF3QVM3Q3dqNWpZbkRsRUhOMHNKL0lDcEZEN3BJNGFtcHYwYUlyODFp?=
 =?utf-8?B?QUNoT1V6Q2hmYW90cFlXNDduZ0JaRURTK0RrQTVVaURxTWhxWlpEa2E5V0Uv?=
 =?utf-8?B?VGEwMWczUVZwdk1nOWVRZTZIenFaL0k1R0JmZ1poYkcrV0p2Yk45SjFvaktM?=
 =?utf-8?B?MUVibzlmNEp3OHY0QjBlU0EvTlBlUEdmaWRUQTJKeFg2dmpGVldzeWhBUmxz?=
 =?utf-8?B?RVNqNStKeklXUGFvWUFpdGxBWjBZVDVWY3FqbGsvaEJiS2dxZ0NTdTRKOXJK?=
 =?utf-8?B?VURYc1ljdk5ucUR6LzkwdENlZ0VYbVVCSHZqSmdoWSs2NmJLd3NOKzZVR1dM?=
 =?utf-8?B?SUZZVFJhcHFIUFdFRllUZjBLclVYTktOWjVrK1ZsZWRMYmVxcytpaU5jb2Js?=
 =?utf-8?B?M1Y2TmNoRFRYQXF4eHlwVWhXVU01a2FOTld2N21VS3N1cnhpcEl3QVNBWlFU?=
 =?utf-8?B?M2xVT0NWT0VLOFF2STdwVG9RNDNjckwrcGc1dDBaekh6V2d0Y1JGaE1kRmoz?=
 =?utf-8?B?S2FaZDdQYnlLMkxWc25pM0hWRVQ1amtlWmpzYzdWczIrQlhsWWt2Wks2S3Ay?=
 =?utf-8?B?R3dKTDlPQ3V3VThQY25veEZIemFrWElwMlFZKzhRUkNHODA0TGRCNFRna1NF?=
 =?utf-8?B?bWY2c0VCMHFrZ2Y4b3BYZEZEbC9zTnNQZzAySnpIRkF5Nkxic1dJNjB2YmtF?=
 =?utf-8?B?UDdwbWJ6YW5ReTIxSXRXQldTSGhjVUFSYkJMVGQ5czFpM2hRQ0pMRjY1OXg0?=
 =?utf-8?B?ek80TTNvLzNOUGg4cTdscGMrMVZtWHQ4WStMSTJLMEZYUTVBVDExSk4rYTRQ?=
 =?utf-8?B?aU5BZVF2eVdmR2krRmIzU1hSN3VEQVZZdFJqbjlLSFhYM3VNdTRPMFpPTnZS?=
 =?utf-8?B?WnRvVHZ6d1dQeGVKZEdpRUVCNzlWaU96MzZnVnJZalZpdStJVWNZQXlOUm9h?=
 =?utf-8?B?NVpqVGNlSUlma2dTWjRUNFZsSUdWYzl5ZFhhTlRHMnR3eGpodE5WZlo4SEFC?=
 =?utf-8?B?NE0xK3hkZjJRVEJpRUZtWDJPbjMxS2ZNMkJrclZheStDRi9UVkFWRjVCamJL?=
 =?utf-8?B?OEFjcVdDb3lzekUwVnRKanZ3TVEvRCtSQmJlQTcvajdaWWdTU2NXSlV1NE9r?=
 =?utf-8?B?Z3F6UVVlQmhuaHZ0Vm9aamQxTDA4cnlPY3dPUnE0L0l5MzJxd011ZjBTRUZT?=
 =?utf-8?B?MmpJeUluRnlBVUFNMmszNE5nVGxONmUvd3VNS1ZEQ2Q1eXBxdzRmNXkzaUdk?=
 =?utf-8?B?RmgzSTUyQU81bitKbCtvRk9PVnd6UTF4NkgzMGlTTTVudHRwa1RPRWJ4SkFR?=
 =?utf-8?B?aU92TmdyN3BvWndTak9QaHFkbHFNZkZLMkNwaTNUMUVWSTc0MDJDTjJNeHBz?=
 =?utf-8?B?UVZZL3QvT0F1LzBXTUpWVzJjRDVtb1FoVDh3NWowQko3M1pINDVoUmQ1aHlD?=
 =?utf-8?B?QkRPY1lWeUJ0VGFkTWJCN0dyWXY4RS9jM1c4Q3BJY2FaWWp0VHNudjlYRUQz?=
 =?utf-8?B?cXdOOGdJOWIxYUZRR3ZjUm51ZzRIY0ZzbHRyMWFoZEtZSDdlNGp2NHJjTkh1?=
 =?utf-8?B?cUczbDRIUW9VL21kYW0vSHhMTTJoUFJKR08vSlZ4VXFIQ3ppRWhRdHhYcG5o?=
 =?utf-8?B?c1h3VWhqVDJ6eWpXV05mUDl3Y2xSU2w5amdkV1FsWFl5TXZiMFB2MFlOK2pK?=
 =?utf-8?B?c29CTlQwRXZvZ3lCcEphRW1ZeDRFeVpNYnc2R0Z3RUFqMU5vQmp0aVlUVDF4?=
 =?utf-8?Q?LddUw86mNJf18ZtZkDP5/T0=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 376dcf4a-6453-4344-4353-08dc7b2eac8b
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6578.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 13:45:57.5205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XaZ6LJLmeYrY3bMGGGMx1hbplplmR3BjcSIHos739G9We7QKLXINkg5/kYuUKoZD9yklmTkhutdPaMS04R2/zS1TkxwM86nBarz8xc5yd+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9350
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 13:46:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199799

Hi Peter,

On 5/22/24 11:10 PM, Peter Marko via lists.openembedded.org wrote:
> Hello,
> 
> I'd like to request following backports from master to scarthgap
> 
> To match versions in scarthgap branches between oe-core and meta-clang:
> adc2651a8e902af24fee6ff30a72f4b7c63bef6f llvm: Upgrade to 18.1.4
> 02df2fc6241ac8fb0e78f2fdff97a04e5c561d54 llvm: Upgrade to 18.1.5
> 
> Fix CVEs:
> bdf7b7460a4816e3d447264730a2814209667fb0 ncurses: Fix CVE-2023-50495
> 6573995adf4cfd48b036f8463b39f3864fcfd85b ncurses: Fix CVE-2023-45918
> 
> Version correction:
> c94e46019a7d443ccc4763ba16d87e7e97abe977 update-rc.d: add +git to PV
> 

I think the most efficient way may be to send patches with [scarthgap] 
in the mail subject (see --prefix) to the ML :)

Cheers,
Quentin

