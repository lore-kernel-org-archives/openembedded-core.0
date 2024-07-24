Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48204C3DA63
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 19:31:42 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.83])
 by mx.groups.io with SMTP id smtpd.web11.19336.1721849494164384810
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jul 2024 12:31:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=rXCQM6Xb;
 spf=pass (domain: oss.nxp.com, ip: 40.107.241.83, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xCUP/mHru1YYuY0XY1dEjpoZiEQ19ktLFPEfhzh6bN0V0aTCvt9x8mojxhimuz5LbV/qUaW9lZREiPorJB7fvcXV4H5IYE//26ZSrWMVtMTTcQ6+vDtQ+lTt93qbdJSw5RxtFFy9sQbgMZM4k9nTn3eYb1uVUj2y7Xvfy18vvj/O3oON7I9iSIrP9Bz9e4ZNz1i/v/iC2FRUGlylT2Sh5iZhDFDMXVh30h1fHj7VBpMPHZ+2brS3Q5kqrmhSjudCsNXq7SnkjzUERRXYzFAnT6obTD1q0PslTgyCNtdpuZvxvIxVOII68d4nxb2y34WezWbOMcGMnhuKE0Xw9cBOlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iMZ7JG27z5NWU7X3QKlv+J3TWZCLKb7dvxYBkcgGkh0=;
 b=g4NBhy7U8pYoCs2Lh5SMec+oq03yK2dfK0DT+01F0tpJjctFGnMt/4/FOdVJjWZTyqtiE9/afBJBJkBMa4+nfrU/jqGqsQrk6XB9JzBfKd8myvl+Mk06YOPN/rRpVY8Uw51VBp+sJXqX+RZEYaOt8HHB7qanxlW82S5fAVE6Vx6XLsaIYOYAeHl8QpKnos3HvOfJl10uUjQxZrMhPsgRL/9fjAACfCcxKDxi7IodZJwQb95JcK5S90rRF5v48peF75D23iTMV/mANy7wpyiAfiaWfDHmLaTTFcE6njuUnW5ttpYSlUfviEgap8KE3Nya07HT7qZwK+oWLuE9TebMng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iMZ7JG27z5NWU7X3QKlv+J3TWZCLKb7dvxYBkcgGkh0=;
 b=rXCQM6XbKjjd0PCHdFZ+zLrod8ws+eXK5kLOxv5coSg53zmnaVW/7jdsEPwo+/Cs7wftqD1tWGp5JkW0rpe8dH0bjyRXjC9QcW0v8VE630ghWWUjK/0f7fP9E2092VVr28G7y8x2d1Fop5xdKhdkCw6QwZonQAbVN868FKTfnTfGrrgJ9A6udlLWwQF2kWDh2nbRThfHw5UsthQ3TK4kgyZqiaScMu2bKa/OcW6MbHGgIGcYU4X3H+TfDLwF9E/N1QJEiufHISAYxRi/wKI7yNVq4YOyiBZl1YGuflMG51RwyBIZWN9KtoKasCeoXCoetfbtja9sOo8ObkwACxnDGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by GVXPR04MB10150.eurprd04.prod.outlook.com (2603:10a6:150:1c1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Wed, 24 Jul
 2024 19:31:25 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%3]) with mapi id 15.20.7784.017; Wed, 24 Jul 2024
 19:31:25 +0000
Content-Type: multipart/alternative;
 boundary="------------NJG0K6oxkqVlXalwLIJnn19g"
Message-ID: <2d2bb482-7264-42f1-b475-a255dd9468f2@oss.nxp.com>
Date: Wed, 24 Jul 2024 14:31:21 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] time64.inc: Simplify GLIBC_64BIT_TIME_FLAGS
 usage
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20240724170829.3456577-1-tom.hochstein@oss.nxp.com>
 <CANNYZj_GkEBefDmtp_ANbdZEv2r+i_RfTAYd0TpEbYD1kUZ+3g@mail.gmail.com>
Content-Language: en-US
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
In-Reply-To: <CANNYZj_GkEBefDmtp_ANbdZEv2r+i_RfTAYd0TpEbYD1kUZ+3g@mail.gmail.com>
X-ClientProxiedBy: AS4P195CA0001.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e2::8) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|GVXPR04MB10150:EE_
X-MS-Office365-Filtering-Correlation-Id: fbe92926-24bb-414e-75e3-08dcac173506
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WlpvamhRSGh0dnJYRjRnZEVMNGRraDAvcllDWGZ0TW5SU2g2N1JWSlA2Sy9v?=
 =?utf-8?B?ZGNKbTErZXdiYWdLc09MbHQ3OTMxL1dNWENSNFNyQ2U1QmVObHBidDM3LzBM?=
 =?utf-8?B?d3MxOWJjOXJ6cHJMTjloeDhxOTZoZHFyTzlHUkdLQUYzWk92M1I3TjFzRUY3?=
 =?utf-8?B?YjM5aW1RbEd5dE9qZ0pYdFZaTk9NZitKdkpaQk9jU2ZHc0xVaHhNWnNtVEdz?=
 =?utf-8?B?T0lWR1YvK05wbXk4TG42SnhncTJmckZlMjZIaS84OUx2UGx0ZHgzTDlvR3dD?=
 =?utf-8?B?c01sR0NoczRjSlE3QTl6NmlLc3d5TGcwRDZCMDFhdWJhMjhBYlhwS3BMRjla?=
 =?utf-8?B?RElLS0dqa0l5cE53bUF5b3Z3WEE2anpaRWFWZjVueUd0VUd4N3J1ZUJFRHo5?=
 =?utf-8?B?WmpDSE80NllmZC9jbno4cG9sTTFPaXVKbmhTMXlicU1IUXVWRWxZbTJUaXVD?=
 =?utf-8?B?NkJ4WTJ2Y0ZYeER5WitRUWE3QUZFYzBIeFFlZmwrd1NDRU14WmxXZEYrTVlm?=
 =?utf-8?B?U0Q5eHZyZTJ5ZGw3WGRwZzNVaW1LbzNJdURmTHQxa0hZTWVWSUY5QklZcE9K?=
 =?utf-8?B?ZERJVmw4Q2JXc2Njb3ByVzVCVDNYM2pNZUIySUR5WHhlb3hoVHFNMlh1WDJX?=
 =?utf-8?B?UjhiSmxHdTRQd2NkS3BaYm00ZjRBeDNUdEh2Z3VHLzFjRXFRTUpWbytnYWNw?=
 =?utf-8?B?NzBtRWxxRVFkbkp3aVM0WGZkZUtNQ1B5WEUxemFQcUF0Y1ZMekNwcUNXZ2VB?=
 =?utf-8?B?MFpDMDA2UE9FaVBUNHo2T2IyODFhU0Y1UGtaRFVIOGY2WFFzQUlZcnZQUjVm?=
 =?utf-8?B?QzVkNlVNbm82VmhYSUZ5d0VGOVJpS014SVBYT1c4OHd6QmNtZEZQdlJ5TzZl?=
 =?utf-8?B?ZS8yWWJxUTFhdFgyTW52K2NwKzN0MHZHZk9LelVQQy9sV21PcHZSenZJenND?=
 =?utf-8?B?WTR2Rmd5OWZFbCtzd3pMeGFyWjNSWEwyNzFDNmtMdUplWDErQkNpRlBlbkM2?=
 =?utf-8?B?MjJZRFVubE5VMkhnTGZ0ZFZxcTBuMGYxc3VwOGgrNVQ0SmZVcjRwckJUTzND?=
 =?utf-8?B?bW9xM3doVkhIOEIrVktqbURQdFlFNldiYlNJM2kvNVFXaUtySXVBSmZqSXMy?=
 =?utf-8?B?Ri9mOGF0Q0R3YXV2ZmpaRDhjV0FQOE9Mblc0c2ZvaURCSVRwUkNRWnU1OS9r?=
 =?utf-8?B?UEdzOVVMd0N5cVJxUzlpWjlEZ0ZIM2tTcXZTR0o4dWRUYklnMFJ3N1NzYlUr?=
 =?utf-8?B?dkxOTHFvQUV3VW54RS91a2RvZkZVZnVYS29nOTdJWHVFTlNIU0REYVpVK0VI?=
 =?utf-8?B?enBaUFZPR0x3R0drdGNiRWVhcUJIREZrell5N0dwUEZwQVVUMnNYOERlM3J0?=
 =?utf-8?B?VGh3cFpKcjJnWStqa0RCVjgyU2I2QmFqeTIyRVNrWSttVUZCUW5adjZTWnAz?=
 =?utf-8?B?UzVUaHlzZmlKb2FDckJYeEhpaGJjekgrZXk4UDlhS2d0MXcyZm9ROWloVFFR?=
 =?utf-8?B?N3lzOEFYbVh3VGNHT3lUdGdVd3dSZXhqNVd2RTVhcTBBYk5la0pjSUI3REpV?=
 =?utf-8?B?dUN6ZTAydmNrSnFINU1xUUpZNzFpMzUvTHRMZVNWTDVzQzFPUEdFb2NLVkZQ?=
 =?utf-8?B?Vk5uRE5FUXJNbWEwdG9DN01rbFlBclpmZlI4RDVsUFMwZEtlV1YrNWI1aHMw?=
 =?utf-8?B?QmdBS2lmNXNScU9Rb3U4dHVNUEswdmVjVSt2djMrU3Vrc1pKSnlHNk5kd2Nx?=
 =?utf-8?B?eUF5NjJHTi9oUS9JMFlLd3kxdVcxWXRmNVVySnl4NDZBdVNlSS9WYUJlWXBz?=
 =?utf-8?B?K2dTeGplU1JyMlB5QnB2dz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TEY3VEFkOEFKaUR2NTVEQUljaU14ZVN6WkhhUHhiL2NBUG12SUlUNy9iMDNm?=
 =?utf-8?B?QWRickowMzUxQnhRdE1nRWhIaXEyWDFJelh5aWpjbHdpLzRNblBLdFUxcmE4?=
 =?utf-8?B?aGw2VmhmODd4ZXhTTThIUVRjd0FHM2VwaTRZaGJtWTQyU2JpY2k3WFQ1VkFT?=
 =?utf-8?B?SVhmYjZRVDRrT3JHYzJkT0tOd3RZQ24yTmNvUDVHalZxOXJaTXd0cVRyajN5?=
 =?utf-8?B?dWM0RVRsem5naCs1WGcrZVZIS1FSMU1qSEVjTkNadWw1aTJPbDBtNFNvek0r?=
 =?utf-8?B?aFZNd3BkN1haYUZWWFRiVncxUkNLKytZRytJY01XVTVWVGI3cnQ4Mjh4cUpP?=
 =?utf-8?B?c3Bkdm5CZmkwRHZuMHVGbGJmUitQTFBqcUdnN0VUZS94M3E2MHQwMExzNFhi?=
 =?utf-8?B?bGN0SDRpbW5LK20xZVJvM1FHSnJHTUt5ZnB1ay9DaXRUbnlPN2JEMG5SbEYx?=
 =?utf-8?B?Q01xR1krU2Q3WGd5VEFLUEtYazJFNDh4UjZOR1NhSk5HT0ZmUllOUXpza0FP?=
 =?utf-8?B?aGJWMmd6QzdVVUlEbUQybnhlSjRORUd5OHpCNUV1a3BIQjBqd3VFdjhVMXc3?=
 =?utf-8?B?Z0RRVTZ6YjNpd3FZamlhdmFRbkFLbUIrNUYyQXlRWU85MWFRWkdsQlNSTHhk?=
 =?utf-8?B?VWNHTlo3K2tQWGNxZ3lkYkJCTEF6b0xLc0pkeStuRkV6Q0MyLzZRN2hFY0RN?=
 =?utf-8?B?THpKUnh1RXFxUW1vYXIyR3dEeTF4V1VHTER0Wk13QjRNWFR3Mk0vSHlTa2Rt?=
 =?utf-8?B?MFpHaERtM2hNYm5VOEpsRThhaEdsQWQ1ZkY1MitlT2c5Vi9SMEVKM00rakhu?=
 =?utf-8?B?NUZWYkx2bERsY3hlcDRrWnNkR0FOYmJtLzdYT2dxYUJzdFZIcnlYM2ZneEFV?=
 =?utf-8?B?ODBIMnNkNlphUzRLckZEbkZ4NXFnTUIvUnFCbmY2d2pjMFo2UUNNMjg0L1Qx?=
 =?utf-8?B?cldhUFoxS05NTUVQN0hmT0JoUzRpalZQTXF0VUpteFdleDhlR2pZaHdvaFFC?=
 =?utf-8?B?VmJaYjRndjFxT0FUd3BGdWUyYXdWczBZNjg1SEVVVERsZkt6aDEwbWtKbHZa?=
 =?utf-8?B?VTN3R2kwUmVDNW94KzlRKyt0ZS9mSDl1NVZOU3phN1VyZVJ6eGVzKzh6eWdO?=
 =?utf-8?B?UFFLOTJzd2Zod1BHbkEwYWVpQUhqQzMreHFXd3dBL1JnODEvK3l2UldnU3Rh?=
 =?utf-8?B?Z1A2ZEpNQkNZUi9JRXFBLys4aVVlMlh5bmdTa0VRb0p4d3RQaDI2cVlVNFpQ?=
 =?utf-8?B?Ty9BZmVQcmdxUVVubnErd1NiNDJqdTA5anZwWVZQSEttKzFHc2dodDRMTzhD?=
 =?utf-8?B?MzBnbU5CTmpTdEZiWWgvS0cwTU1DaVBsNlRVNngrQ0ViREk4eWY0SXNVSjNl?=
 =?utf-8?B?UVc1R2ZqWVVzU24zSGprQUVDWThMbHRySS9TTU5wT1A3TDZ1VmVHenJWTVdo?=
 =?utf-8?B?bWYvNWlaR0RVait3MmFZajRMZHd2M2lEWGk0WDlhREZnbVVGcGMrZkFyTWIv?=
 =?utf-8?B?NTlOY3QxNnE4aHlNOGZ5RklmblRYWE1uUkNXOWduSmxHd1AySDB5QTMzSE5X?=
 =?utf-8?B?KzFFRnhBYnI2UFhQL3ZCa05aeUlkOFRMaEhEaEhGaDdFdFlZQVpQOHZINTZI?=
 =?utf-8?B?Mlp0cC9IS2I5a0VHSENMaCtNcDVKOTVhb2xuaE84U1pvREo1cEhLeVFIeVFa?=
 =?utf-8?B?ZXdZbUhVKzd1L21vblFGZHVweUJZWHh6aGFEWWdPVUgvNFQ0TGp2VjFZdmV4?=
 =?utf-8?B?Q1BqVFJBV0ZFRmpVaHVYQ09sRXFZRlV4Q21tbTVqRUlXTmRDendFN1BEcUVk?=
 =?utf-8?B?NXRCNDhLU1h0dHdmLzhMVlNTcHRBOUppQ3pZcUwwQ2JXT3dEUy94ZHJsVTBC?=
 =?utf-8?B?bjRSWGhsem0rU2kxckZwV0lOWFJGOGczTVpVMHRSbld5anhrMG51ajdSSzlP?=
 =?utf-8?B?Q1U1eU9NMVlGb0FpbTN4ZUI0YUNEVitSMFVvQTFEemI4VVpiN3RHTmhISi9l?=
 =?utf-8?B?Wm8yaWFrSEE0WWFSQkVwVGN5bVNrTFQvNnpydjZqblFoTnhLMlh0bHhwVFpk?=
 =?utf-8?B?OVk5YmZ6N0JhMzVQQzFjSWhEM3VYOTRBSGgxZkF3YUNVa2hNay90SGxpNGtu?=
 =?utf-8?B?QTkzME5hcjdhOWM1SVJORVEvOVNieHZZblNiUXI1ZFpMcm52YXhHdC9sdnYx?=
 =?utf-8?B?Zmc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbe92926-24bb-414e-75e3-08dcac173506
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 19:31:25.6807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MTgsne5fsrJPa+8rUbvBMw2UCXJBRB5FqU0Cn4D3dJbizNxtI3E+f6g/J8u+6CgSPR15Fd3jwlEHy1aEVrKteA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10150
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 19:31:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202481

--------------NJG0K6oxkqVlXalwLIJnn19g
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/24/2024 12:20 PM, Alexander Kanavin wrote:
> On Wed, 24 Jul 2024 at 19:10, Tom Hochstein via lists.openembedded.org
> <tom.hochstein=oss.nxp.com@lists.openembedded.org>  wrote:
>> -GLIBC_64BIT_TIME_FLAGS = " -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64"
>> +TARGET_CC_ARCH += "${GLIBC_64BIT_TIME_FLAGS}"
>>
>>   # Only needed for some 32-bit architectures, some relatively newer
>>   # architectures do not need it ( e.g. riscv32 )
>> -TARGET_CC_ARCH:append:arm = "${GLIBC_64BIT_TIME_FLAGS}"
>> -TARGET_CC_ARCH:append:armeb = "${GLIBC_64BIT_TIME_FLAGS}"
>> -TARGET_CC_ARCH:append:mipsarcho32 = "${GLIBC_64BIT_TIME_FLAGS}"
>> -TARGET_CC_ARCH:append:powerpc ="${@bb.utils.contains('TUNE_FEATURES', 'm32', 
>> '${GLIBC_64BIT_TIME_FLAGS}', '', d)}"
>> -TARGET_CC_ARCH:append:x86 ="${@bb.utils.contains('TUNE_FEATURES', 'm32', 
>> '${GLIBC_64BIT_TIME_FLAGS}', '', d)}"
>> +GLIBC_64BIT_TIME_FLAGS             = ""
>> +GLIBC_64BIT_TIME_FLAGS:arm         = "-D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64"
>> +GLIBC_64BIT_TIME_FLAGS:armeb       = "-D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64"
>> +GLIBC_64BIT_TIME_FLAGS:mipsarcho32 = "-D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64"
>> +GLIBC_64BIT_TIME_FLAGS:powerpc     = \
>> +"${@bb.utils.contains('TUNE_FEATURES', 'm32', '-D_TIME_BITS=64 
>> -D_FILE_OFFSET_BITS=64', '', d)}"
>> +GLIBC_64BIT_TIME_FLAGS:x86         = \
>> +"${@bb.utils.contains('TUNE_FEATURES', 'm32', '-D_TIME_BITS=64 
>> -D_FILE_OFFSET_BITS=64', '', d)}"
> Apologies, but this is not simpler or better or more readable.
> Repeating "-D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64" multiple times
> should really be avoided.
>
> What prompted this patch specifically?
Thanks, Alex.

We are working to configure the builds of certain recipes so the 
non-Y2038-compliant code is avoided, e.g, by disabling oss-output in 
pulseaudio. That leads to needing to restore GLIBC_64BIT_TIME_FLAGS, 
which for pulseaudio is cleared here in time64.inc (on scarthgap, not on 
master):

GLIBC_64BIT_TIME_FLAGS:pn-pulseaudio = ""

When you do that override from another layer as one would normally 
expect, i.e., without the leading space, you get the error:

cc1: error: '-Werror=format-security-D_TIME_BITS=64': no option 
'-Wformat-security-D_TIME_BITS=64'

The problem is the design in time64.inc does impose an extra requirement 
for an external assignment to include a leading space. The redesign is 
meant to remove that requirement on the leading space, i.e., to simplify 
the usage of the variable by external users.

Tom


--------------NJG0K6oxkqVlXalwLIJnn19g
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/24/2024 12:20 PM, Alexander
      Kanavin wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj_GkEBefDmtp_ANbdZEv2r+i_RfTAYd0TpEbYD1kUZ+3g@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Wed, 24 Jul 2024 at 19:10, Tom Hochstein via lists.openembedded.org
<a class="moz-txt-link-rfc2396E" href="mailto:tom.hochstein=oss.nxp.com@lists.openembedded.org">&lt;tom.hochstein=oss.nxp.com@lists.openembedded.org&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">-GLIBC_64BIT_TIME_FLAGS = &quot; -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64&quot;
+TARGET_CC_ARCH += &quot;${GLIBC_64BIT_TIME_FLAGS}&quot;

 # Only needed for some 32-bit architectures, some relatively newer
 # architectures do not need it ( e.g. riscv32 )
-TARGET_CC_ARCH:append:arm = &quot;${GLIBC_64BIT_TIME_FLAGS}&quot;
-TARGET_CC_ARCH:append:armeb = &quot;${GLIBC_64BIT_TIME_FLAGS}&quot;
-TARGET_CC_ARCH:append:mipsarcho32 = &quot;${GLIBC_64BIT_TIME_FLAGS}&quot;
-TARGET_CC_ARCH:append:powerpc = <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains('TUNE_FEATURES','m32','${GLIBC_64BIT_TIME_FLAGS}','',d)}">&quot;${@bb.utils.contains('TUNE_FEATURES', 'm32', '${GLIBC_64BIT_TIME_FLAGS}', '', d)}&quot;</a>
-TARGET_CC_ARCH:append:x86 = <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains('TUNE_FEATURES','m32','${GLIBC_64BIT_TIME_FLAGS}','',d)}">&quot;${@bb.utils.contains('TUNE_FEATURES', 'm32', '${GLIBC_64BIT_TIME_FLAGS}', '', d)}&quot;</a>
+GLIBC_64BIT_TIME_FLAGS             = &quot;&quot;
+GLIBC_64BIT_TIME_FLAGS:arm         = &quot;-D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64&quot;
+GLIBC_64BIT_TIME_FLAGS:armeb       = &quot;-D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64&quot;
+GLIBC_64BIT_TIME_FLAGS:mipsarcho32 = &quot;-D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64&quot;
+GLIBC_64BIT_TIME_FLAGS:powerpc     = \
+    <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains('TUNE_FEATURES','m32','-D_TIME_BITS=64-D_FILE_OFFSET_BITS=64','',d)}">&quot;${@bb.utils.contains('TUNE_FEATURES', 'm32', '-D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64', '', d)}&quot;</a>
+GLIBC_64BIT_TIME_FLAGS:x86         = \
+    <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains('TUNE_FEATURES','m32','-D_TIME_BITS=64-D_FILE_OFFSET_BITS=64','',d)}">&quot;${@bb.utils.contains('TUNE_FEATURES', 'm32', '-D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64', '', d)}&quot;</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Apologies, but this is not simpler or better or more readable.
Repeating &quot;-D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64&quot; multiple times
should really be avoided.

What prompted this patch specifically?</pre>
    </blockquote>
    Thanks, Alex.<br>
    <br>
    We are working to configure the builds of certain recipes so the
    non-Y2038-compliant code is avoided, e.g, by disabling oss-output in
    pulseaudio. That leads to needing to restore GLIBC_64BIT_TIME_FLAGS,
    which for pulseaudio is cleared here in time64.inc (on scarthgap,
    not on master):<br>
    <br>
    GLIBC_64BIT_TIME_FLAGS:pn-pulseaudio = &quot;&quot;<br>
    <br>
    When you do that override from another layer as one would normally
    expect, i.e., without the leading space, you get the error:<br>
    <br>
    cc1: error: '-Werror=format-security-D_TIME_BITS=64': no option
    '-Wformat-security-D_TIME_BITS=64'<br>
    <br>
    The problem is the design in time64.inc does impose an extra
    requirement for an external assignment to include a leading space.
    The redesign is meant to remove that requirement on the leading
    space, i.e., to simplify the usage of the variable by external
    users.<br>
    <br>
    Tom<br>
    <br>
    <br>
    <span style="white-space: pre-wrap">
</span>
  </body>
</html>

--------------NJG0K6oxkqVlXalwLIJnn19g--

