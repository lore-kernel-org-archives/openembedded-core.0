Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECF6AC28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 19:50:40 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.65])
 by mx.groups.io with SMTP id smtpd.web11.3137.1743191436102873649
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 12:50:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=wnPHpWk5;
 spf=pass (domain: oss.nxp.com, ip: 40.107.162.65, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nq3YgY1QIUqZSeje6g2WY+rOAmKFkOopO1W/vWAHrjkiTUgCgGtYzfLl2JYrrcBUG22xHluBZmrI08DuKtZJsgHEk8yi/Glj0K6XJFOhATguEbkjVNdzj+vFSJM6zIl+edUvMSNeb/Z368//6cMHmdn9UD+UDCzl1Azjm3apzzL6qYG176L2yA79VJm2SeOJJpRBovDldYuN8wgHDyl5Ug/Fq42Y/912lybudr39VigRiSClOgbuMX2YXaFhQCsHyXpebcFFu9slYuIEfps7iLYm9Ef7IqZWTKv+gjU1H3PJ+Yhy7n8jPIBJ69EA9mhe1Y8G5jX9mhTBsQ0nIiu0wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9NXLGdBMKa2/NdLfvhiNjIeojxKVpvqXN2NQxBg2AgQ=;
 b=aUuW0UunO6KpCATBNrSRdiDPLrZGOpeP+C+2RvcVfI2ycL5yw3DCLZsJYrCafXSESiUENi0wuETtk1LdldftWKDWgl8y2UYwKewzJxkDd6kBCUGaDWEujO50LVFZaRKxSPQ0oqSfcEF0UBUHRHdZ3RaP76oFdrF55OaW27JaDUQEcFqH9LIJIDITMcqG7IwnXhQx4zMWU7uAkNBrE5a3d8RPW7zhxU/vo88mAekGuWKb6QaEyJvaAgRGaO07uVgUjmr1VRjgn1MIcscHaipZAR9ANYlAI39Dbn2oenSmm3tE8aORR0tMjh8LyetnPx3byQy5lTr0oSj34ZK0MWhmBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9NXLGdBMKa2/NdLfvhiNjIeojxKVpvqXN2NQxBg2AgQ=;
 b=wnPHpWk5S8qCT7jYGuw6FGZ0hknXdujhdhPY/z2W6PKVhV2j71iHv6EUpey1oT08HfFeItsYUWzxK5vr9xAGxT5iUfEua9O7cpiPOgeeb3LGqVGhBsZ/4a6ioiltKMnhq+lhxjS9lcdvRuUXVVoqjiYKvNevckcbZeK72zW98Fg61HZjzbXqn2+LNKaTmgeOtX+zrk+9i1Mdqi4DWV1m068o0S/a/qNI40GcQ9OCXZGLXR4n7Qv8medz+39z4Vfs5zqkdZNORxvuiZBmk1fqFcjbM2yf+Ah9M2TDtSEYQDnXL6xpesWd3IAtUynOWRua5tP3wBJGZHQMUN0HkcvLbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by PAXPR04MB8489.eurprd04.prod.outlook.com (2603:10a6:102:1dd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 19:50:32 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8534.048; Fri, 28 Mar 2025
 19:50:32 +0000
Message-ID: <e5cbfc98-16ed-4bd7-839c-fee188865098@oss.nxp.com>
Date: Fri, 28 Mar 2025 14:50:25 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/2] meson: Allow user to override setup command
 options
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
References: <20250327225959.3611495-1-tom.hochstein@oss.nxp.com>
 <D8RU02JC2FSE.3ORJNCQOPYRSJ@bootlin.com>
Content-Language: en-US
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
In-Reply-To: <D8RU02JC2FSE.3ORJNCQOPYRSJ@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR01CA0011.prod.exchangelabs.com (2603:10b6:a02:80::24)
 To PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|PAXPR04MB8489:EE_
X-MS-Office365-Filtering-Correlation-Id: 4055c201-96fc-4af3-445a-08dd6e31cc5e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eVFnOGJ3YWZXcXdKdC8wTm5jMlN0ZUI0M2JlclI5czh6UXMwYU0wVE1wczJY?=
 =?utf-8?B?NUk1S2VoN0NjZjhSRXZldUpFa1BiZ01tZlJqMXgyMlk1bm5MbVFHdTVtNTZm?=
 =?utf-8?B?dE1wWnAvNHdNYlhJQm1XbWMzdmFOelFMRS9XMS9QWlg2NzV3cEROU0lXSC9K?=
 =?utf-8?B?R1hCVmlLWjZteDNwcWU1TE1RMHp4OS9ybER2QWZLOUtyU3NBQUpuc3Y1SFdX?=
 =?utf-8?B?bDVGRDQxUFVQK1puR3BZMGdhRjZtTWxiWEZ5VDMzcVNKcjYybEprcXJjSGYv?=
 =?utf-8?B?SmpGcE11U3pTSVMyc2RmL2cySGhzSGp5RXRRRkRvcGdwaUpoZGl2RnZOcjZn?=
 =?utf-8?B?N3RrcW1Fc1hKdk94Q1g0MDI3NXlKaWJVVGpPcm81K2tBYUQwalJRNlZPUzdK?=
 =?utf-8?B?eVMwdUZnMjk5OFFjZlZvUkx5eVJXYzV1N0UwczJQd3ZvOTU0clRTdHJrbVVG?=
 =?utf-8?B?RkZRUzV6MkttZHpzaFQxY2g4U2NhRFBTUDdJRFc2NHk4K2N0RHBxZ3UwZHpS?=
 =?utf-8?B?aTAvYTgxYXZZMWRLR0RUZ2wxa2ZmRWJ1SXdRRTE0V3R4L3NLVjdOQzlMWXlo?=
 =?utf-8?B?YUsraTRDVnROSnhOQ096WWVEV0Y3VzcyN3l1dWRrZ0d4Qi8xUnRvUm4vTlBy?=
 =?utf-8?B?dVNUV2hXUWx2VGNKSkdFMHdXM0hRMzA4UXhOZzZoSHdFU0VOS09hSytpZjJs?=
 =?utf-8?B?RDY3VVpiSFd1WjhaS2lEcVZ1YnNwVDR1VWJQNmRndTFNYUxiTmFYWnQycVFJ?=
 =?utf-8?B?bTNndEl0blhUYzgra0NrN0IwMUpJaWJFam1ZekJFakJ0T3N4clJJTDZCQllD?=
 =?utf-8?B?c25ONy9xM1h0RE1uNTlzVE9ic0NIK2VOeE53bVhPMjNTc3FKM2c4RTlvNWRS?=
 =?utf-8?B?SllJUDljM2Q4ODZub0FvbXA1Qmc5YlZoOXVra0ZPL1V2TGZNNEdRQWM1eFRm?=
 =?utf-8?B?OG9wOTM3eWJpTWwrL0lDNzQvZEp2eGRkeVhKYlZMWXVocXRoWG9VcFhYcFZB?=
 =?utf-8?B?VHFkMElWblBIQ3JFdUhxbzdMcXpkSVlKTTNVdHZmY1JyNlJ0TElEcmRhcUVJ?=
 =?utf-8?B?dHlrcTJSdktPUndMdzVxV0FwMzhTcDBKZnRaTGRFSjVRZlBNdHRrcEJVMHVG?=
 =?utf-8?B?RmJNMmEzQ0lldzBpNzNxcGFFaFpvbHptT0xCQ25RcytkN3hCN2c2UmkvN1ZM?=
 =?utf-8?B?cEpJd1JaYVJyOG1UQVFYS2l5dmRGTkFSNTZiaUxSNVJYNUZHcXpLL1EwejNR?=
 =?utf-8?B?dmlFaVNoTTZWandwTmE0VlVSM2FPREEzK3pRMkkzKy9jeVRGU2xOcGh0Wklp?=
 =?utf-8?B?bTFFRW9JelRVakMrbk84SkxVN0RSNk92MDk5bnluSkQ4bWRzcUlvd0MycUpR?=
 =?utf-8?B?OVpJN0dhUWg1Qyt5UmMwUS9kS256VUdZWkw3Sk9DR1NwdzdYQ01Hdm90Nm44?=
 =?utf-8?B?WXVWOG9pY0tvSjhYZ3QyWmZkTFVyTFhOUGNCQjVRVmp1VzJvbzFJbm9JTUZH?=
 =?utf-8?B?OTRyUkR4aWxRK2k0KzhxZklIQW5RL0VCSjJLUjcrbkJ2RzM4VEVUTmdkc2th?=
 =?utf-8?B?dUZZbzFnYXVKZWRPckJEZjdkd0FVdURFc1crakg4YjZocDFBczJPVUVFcnFJ?=
 =?utf-8?B?U3RzNmk3V0NJcjl0ekI2TEExcU1pMEJJeHlrcDNjNTBBaVdaTTFveEp2Uko3?=
 =?utf-8?B?VDdpaHIxUDV1eGp6MGhvd3VQQ2NCejM1a2QxN3ZoMGJmWHpOMmRNamkzbElk?=
 =?utf-8?Q?GT8d2e4ZYBdikVE6aAzMk3vhSLLtbTVZgVIZqPx?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZzRCTGhnTjFRRTN4R0p3NWloY0tDOHhwVXJQdXJrRkd3bWQvdXA3TlZYRnVs?=
 =?utf-8?B?eTZRS0tTWElYMUNnS3U3bnBSVFQ3SE5ZdllBSVpINlNJUmJvVFhURlVRc2pv?=
 =?utf-8?B?bTYrTEVGMy9sc0lXbWVPd3d1MWF4Zms3STdjSHJRMVJiUE5ZbWJBZkgrY09y?=
 =?utf-8?B?QjJOMjdhL0VJYVMxOE1Fb1VRTGJDS3l4VVpoS2l6N1V3TlE0UC9wNFB3ZVJs?=
 =?utf-8?B?T0loS0dOV3Z3bmlLM1NPT1ZBRXVDSE5QdGVXWDZjNDUxeklSbWNzVnB5TTh4?=
 =?utf-8?B?YXRydGJtUEloZXpEN0NoN0I3VmMwbjI3eFNmUHNDeXJ2T3Z0RENGYWRUSnJ5?=
 =?utf-8?B?U3hHRVBuYVpwczlRYkNSOEM4b1pkbGZOVDVuY3dYbWtmSnVSeUV1TEc3UXph?=
 =?utf-8?B?NzVqL0hRSG1Telk2Q3JSaDVPdWt3VFpTZ1RZWHJmWkMrY0ZNeHJtZGcvSk1j?=
 =?utf-8?B?RjRNTDZLSDRkaUhZU0d5T08xeTdHTjM5enZyZnMreXVWRTByKzlDcTExYStu?=
 =?utf-8?B?bzlKQmZkejc0MW1nbVk1WXFaOTlRNTlrR3gra0pnakV5eUlQY1V2N1oxVG1y?=
 =?utf-8?B?Vkl2eC9XdyszcmZjR081eHFPay8xclhsMEJXdWhJTnoxUUN1aDZ1MzE0UnpI?=
 =?utf-8?B?TkJ1N1N3S3duaFB1TDVGL2pEdXl3em5XdlBiM3VXcm4vOHJjOUhQOTBqQStp?=
 =?utf-8?B?RTlHSldZejRiTlN3ckxPUGNWbVZHL3ZsRUs3d0tsT2JJYkZzRk53L2NJc252?=
 =?utf-8?B?L3BYbnIvVm1jL0RGT0k3dWV4N3dyVXIxTC94REhCYkFkTTNQZEREZFRXYlE1?=
 =?utf-8?B?RmdoRTU5N2svK0RGVkJHTmZoK2gxdmc3YlJoUzJhYnVlZCsrc0Zqcm5zaCtv?=
 =?utf-8?B?djE2VjhjNGxvdmFkVUMydm1GOWNhaFluMDNOSEJVM3dTWEdweDlRYmNBQmt0?=
 =?utf-8?B?dzlZbFQzdzk0TWtvSS9hNVRLMG52cWJDbXpRSXVVOTloNmdTTGw5OEVQaWgx?=
 =?utf-8?B?NGpvOHVWOWdRSXFENFVTZ2JuLzRlTTFsV2k5R3RQZjVXRzhlOUF4SU55TmFD?=
 =?utf-8?B?eGhVcTFnWkZkelprYlpkOTlVZXFlMTQ5cnAybURrZUpySk96SGhNalZEL1NY?=
 =?utf-8?B?R2ZOcnQvVmtEMjh5ODExM1lFdE5WYXhiQ2J2Uy8zM2JOZHNnQTZSeGkvdmxW?=
 =?utf-8?B?ZU1DTStONjJEZ0QzQ2cwS2xRVHVFZjI3N1pTSWVjbDd0Nmg2RW1lZDZEM2RW?=
 =?utf-8?B?c3JTaXJWejlJMHBnY0dYQ3lXeW1HM0RiZjJENXZCMU92N3JCZ0MvYnlDMHpS?=
 =?utf-8?B?SUR0T0VmNCtnRjRiUkQvbUZhdkRwZWNFZTdYVFlYQ205N1dmbmNpL09pdkpT?=
 =?utf-8?B?Njd2SG9ZdURwYlZocmJQdytzQVJUUXJIK1NRenA0bTRmVHdRVk8vNlkyZ25F?=
 =?utf-8?B?emRxTDJWUkVCajRVRGJGY3hDbENkTHN4VCtBN05SN0VPTTBNQ2kyQlI3SFhv?=
 =?utf-8?B?ZVlYTXFFUzM4Q280citpL2VTdll0bHRRaDBWT2VvNXJiRjM1TTE4N3pHMElD?=
 =?utf-8?B?RFpIZ1hraDcyamprOG1EaCtQeXZwZGsvZGVZU1BNM3lqbEhLZFRQSkJncmNj?=
 =?utf-8?B?bGtpc2FsZXNlaXlxa0lhSk9jVUZ2dzF4YmhreWQzdEZQQ05ERmZ5WVYxQWlu?=
 =?utf-8?B?eGJPV3VuelY4VWNPMlFVa2xhVnV3WHVpa1FhVGFVM3VzY01EbUduZFZ0R2Ir?=
 =?utf-8?B?MFZCTnhkdDEvQ3ZrQ0RhdmZyZDludVRwbzhHY1Q0M1NYT1NDMUFCVFVLRG5q?=
 =?utf-8?B?NHVQbjNGYWNjenZWOXZ3VkNDRERnZkl5cXk2U1RPNzg4Tnd0V2tWYkF3Vmto?=
 =?utf-8?B?cE9wNFUyNWNNVUxsMnVEMjRCTmkrSVRnN09ZVFdmSmxBUkswY1FyVWQxODVV?=
 =?utf-8?B?WlJacUNsMTZLVkZ4WkhraXg1cy9GWUc4L251aFJSekloemRjbkhDOWF6WkRK?=
 =?utf-8?B?enU1OVBBY1c0U2YvQmpVUEttcnJHV21zMWw3OEcvZE8weTdHb1BWcmordm1k?=
 =?utf-8?B?cDdML1dneHhWSUEzZVpFNHh5cy9vdElEK0FETTNyVDMyajBpYm1UR2tYaUhQ?=
 =?utf-8?B?SUlvWHNDSkxldWExM2FYOUNtYVNZVzJMU2RhdmtIK2NaemZrVUNSYjdGQ3Z6?=
 =?utf-8?B?R3c9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4055c201-96fc-4af3-445a-08dd6e31cc5e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 19:50:32.1720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SxudnsVYHqJ2CoYbDLMzUsr4aJ7+8yc7R5g60GFXSwbFJo1/PLFWhfwhVsVBnLDOjz3/Ci9/uHIwBLR+Iy2O+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8489
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 19:50:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213865

On 3/28/2025 5:36 AM, Mathieu Dubois-Briand wrote:
> [You don't often get email from mathieu.dubois-briand@bootlin.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> On Thu Mar 27, 2025 at 11:59 PM CET, Tom Hochstein via lists.openembedded.org wrote:
>> The user cannot override the setup command options --cross-file and
>> --native-file because the meson-wrapper places these options on the
>> command line after the user options. This problem was noticed when
>> trying to build with an SDK using a custom cross-file.
>>
>> Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
>> ---
> 
> Hi Tom,
> 
> Thanks for your patch.
> 
> It looks it breaks some test on the autobuilder, maybe specific to x86:
> 
> Traceback (most recent call last):
>    File "/srv/pokybuild/yocto-worker/qemux86/build/meta/lib/oeqa/sdk/cases/meson.py", line 42, in test_epoxy
>      log = self._run("meson --warnlevel 1 -Degl=no -Dglx=no -Dx11=false {build} {source}".format(**dirs))
>    File "/srv/pokybuild/yocto-worker/qemux86/build/meta/lib/oeqa/sdk/case.py", line 15, in _run
>      return subprocess.check_output(". %s > /dev/null; %s;" % \
>    File "/usr/lib/python3.9/subprocess.py", line 424, in check_output
>      return run(*popenargs, stdout=PIPE, timeout=timeout, check=True,
>    File "/usr/lib/python3.9/subprocess.py", line 528, in run
>      raise CalledProcessError(retcode, process.args,
> oeqa.utils.subprocesstweak.OETestCalledProcessError: Command '. /srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/qemux86-poky-linux/core-image-sato/1.0/testimage-sdk/environment-setup-core2-32-poky-linux > /dev/null; meson --warnlevel 1 -Degl=no -Dglx=no -Dx11=false /srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/qemux86-poky-linux/core-image-sato/1.0/testimage-sdk/epoxy9vkngm2b/build /srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/qemux86-poky-linux/core-image-sato/1.0/testimage-sdk/epoxy9vkngm2b/libepoxy-1.5.3;' returned non-zero exit status 1
> Standard Output: meson-wrapper: Implicit setup command assumed
> meson-wrapper: Running meson with setup options: " --cross-file=/srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/qemux86-poky-linux/core-image-sato/1.0/testimage-sdk/sysroots/x86_64-pokysdk-linux/usr/share/meson/i686-poky-linux-meson.cross --native-file=/srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/qemux86-poky-linux/core-image-sato/1.0/testimage-sdk/sysroots/x86_64-pokysdk-linux/usr/share/meson/meson.native "
> 
> ERROR: Unknown CPU family i686, see https://wiki.yoctoproject.org/wiki/Meson/UnknownCPU for directions.
> 
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/1265
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/1283
> 
> Can you have a look at these test failures please?
> 
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 

Thanks, Mathieu. It appears that the problem goes deeper. V2 coming.

Tom


