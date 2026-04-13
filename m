Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16FC9E9380D
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 03:17:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.263460.1776050244425804028
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Apr 2026 20:17:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=R67R5SG1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=85636eeddb=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D35eJR1731870
	for <openembedded-core@lists.openembedded.org>; Sun, 12 Apr 2026 20:17:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=K9hylfZHrs9rx+KQ0fxOoOTn8U7HIQKCr8jaKVfaHV4=; b=R67R5SG17rIe
	VujmUui1qFGT8WOmfB+JAIhbUD0SYTFJHrLK4TMFjJs1zwyHuhcXpiTREOfeqK99
	8Ln9KzgnyuT9Xkzm7lIuOSVTqggKhBpP4MTHYxW8lDMY3BHrZrWtE9kvyX02yQya
	FAv8uFFswLqSrjLPsX5NPm9xtWT1QOTLCD+6HexUQzNMtWNMI9E/DnarJdn2fMJ4
	xiUqm4Y2pTXCllOo47cdCem/EBky6+Gai6VgwnxZumuHkWVUYbDDhzxCVrQqI1z3
	zJA8x4hdxQsK38etQ9zAOI5nuSCmcHcNiTGfOrL2KB4AmzAbJWjzTdAv4h2vvqe4
	2HhQRo1jnA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013033.outbound.protection.outlook.com [40.93.201.33])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dfntds24v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 12 Apr 2026 20:17:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R1/Cn8YhwRFAVAeNQTB+7ds9Mf195ERhahhY3/TEmexDrYplhi9/1HOgzG72u0RHv/F8k7N8RSE9c8zgH45JdkAIbx3US8C2UjMo86Jt4fBRWp27UMyH2sIEOojxbOBSaoRClD6Z/ScxRl7sich5MkDPCOnvzAzh76azqlZlyBojH/RvrTtivadaYHiJvjRFykZl/b34UHcBVnT2ZOVhgfM0eLS+TnPosMOljXQu9ytVZ26iy9LSPWa+NW7tq6oCyHarBVePmT970+dercWT1noY0G8FBtcm776OP0ImXizIIek8GXpb69iVZVo0+PS5T3Q3LeZVSRGzVcLxlqvoXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K9hylfZHrs9rx+KQ0fxOoOTn8U7HIQKCr8jaKVfaHV4=;
 b=ng0cOUNTeFFN+q7BqAKBe7wy15Lhn18LAFyFMQoRoF9wbMbJ9ITai65sQ9JqwZrrZOc+NWOuSUmnpQS66jKmT9+SxfZTvwMDOXjQQOVtC2AsPpeA4QD3Ex1nc8PMizhGYvtkY2eB0FUecDwYM3wywwtM07OoZEo36JskETCKoAxL9jb8jKWroD++cgTVE98ZBfh9vdQi4Pw905qvwS47GHmyzdsUjfHYS/RfDc6VBCLSNxqDH0UKoMPHHHpE3+E2rRRGK5JFwZWgKp9Djxgj1Bh/73zpYUiWbglq44e02DJkMjfLfTSpFBWIvWXySs9b7xtkdTa6qb1StXdj0wMcnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by SJ1PR11MB6177.namprd11.prod.outlook.com (2603:10b6:a03:45c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 03:17:21 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9818.017; Mon, 13 Apr 2026
 03:17:21 +0000
Message-ID: <0439268c-895b-4ae8-88de-8aa9d03eaefd@windriver.com>
Date: Mon, 13 Apr 2026 11:17:16 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] gstreamer1.0-plugins-bad: add
 ANY_OF_DISTRO_FEATURES
To: openembedded-core@lists.openembedded.org
References: <189E1B5A8FDE995D.2964266@lists.openembedded.org>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <189E1B5A8FDE995D.2964266@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYWPR01CA0033.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::20) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|SJ1PR11MB6177:EE_
X-MS-Office365-Filtering-Correlation-Id: b9c47fca-e5b5-4c52-615e-08de990b2d23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|4022899009|376014|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	63wwxtf1QOfVkAOnSCG5AKWv46Tft1XC2xYwh5RE0VJn6c0VlX+lu25PCn/M3HfKlTfl7fvyfQKaDf4JCihgJ7jG/1lc1yLE5A31u+yZLJqpO6eCpaSdXAxxRI4Astvq9bs+PZ34CUaQcUZhSTshq2Vp4OQpa19CnXWfS3Bf8dzrt0/iB6SA8Jzroy50ETrPa7tgEvKfJE8DWU41v9iUmMokS0nI3aETbivs2GUcdciacZnes7TwzQ4FEV3i8iw4QtZGvRqwhRo1jBs/JEzsqLUDHWvsty4w384HUHcuVGI9LL8Qhi++2ZUjzNsJweBYxUc44MZdztIGg93ggaPqmT/fixP8lEb2EmyN555PXaSSOdcVvZ+peCnX+Ise+SIU7Kj853NvrD9zq5IIJSPFX9VHybVtxxNmCNraPiXpdV4CpUzMlvblgLBUzFWR8tx3KDKlK5Sr2gje2CJVMOSXiNuuBQiEWkAv09A+GORTzGYS0n9ZfH9OcjNgj9cQ+ErYRjxfG6BcOBFp13bD8kCW3ntetxcoPu5WH2uBXpf5hJfqL8PsXiLExF2Rnn1qzvHKL5NaX4OeBDzehCDoeYSGK6f63rj8CRz5LATVDWkfZ6yVumYtbsbYUc21j4JL9K2WDO9xayAwtuVYL8Z/KlWj9nAVvRQ41dCJ5zRQ72tbbgJBMbJDz+7WUFSlwb/w853t
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(376014)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VjhMSUU0UHlvK3NGaTFaTURlMzdhTk5RaVVKbVBTYTU3cWF5Zmk4aGNkQ09u?=
 =?utf-8?B?eFFabFRmVGViSjJRVG9lSEtNQW5YN1h2ajJRUEdqVERlalBRbXVERFkxZStV?=
 =?utf-8?B?YVJ3eTJObklOTy9IcWZ3eVNQN1pUdnI0YTFHY2lieFU0OG9WVzFVaEthNUNO?=
 =?utf-8?B?Zm1tRFAyMysrVHhaN1BmcGJybkRwRVVxWjluRDV5MzE5Z0VHNTFZVk9IcHZS?=
 =?utf-8?B?NmZhaXVKQWRLd25nUStoVC9iMlFKYTNVRzNoNXZjSEJKdDBjZW5PZVF1WktM?=
 =?utf-8?B?ZU9KdEtUTmNFanJqZzhNRHRnc043dzBrWkRKQkw1VFQzN2dDTEcyY1JHeVM2?=
 =?utf-8?B?RUpOMlNzY0s2WWFoNmxkNVpnL3JUUE9MR0xodmsvbEMrZHdHb1ppaFh3dzVh?=
 =?utf-8?B?c3RTNldUdnJUQVAweWZhUEhqTFVvbUVQdWd1M1dLMFZlNlY5RG5ObHl6SWts?=
 =?utf-8?B?M3RMT3hocVZkd2ROMElZcVUyeWd5UUpxVituV2VVZndjZVdHY0s4WkhTVXds?=
 =?utf-8?B?eWdOOXBubTBtOHNwdTk3THkzL25QNFpFV3VJdkJiUUdXcXEwUlRiWElMb0ZN?=
 =?utf-8?B?MVp1d01LSnlCNDgxWkdiZU9HQ2U5ckx4QTI5STQ0bmdoVlhHcTd5U3lQL0xG?=
 =?utf-8?B?OUNkbldWSkg3QlJhWlphc3p1cUpRWk1LellESHJDMmVxdVFFR3hRcW8xS2Js?=
 =?utf-8?B?TEtncmRjRzB0VWNQbkh5cHlIT3dxdXRpclJ3Nm9IZGlBemxIT3R3TUVXQ3hU?=
 =?utf-8?B?bW9zSEtBS3JIL1FqRzlTYlRmSmpUc3E0Vk9hSUt3WXFoYTNUa25YWnFFVk5Z?=
 =?utf-8?B?b0UzOVpTeDBCVjZWOFJWWnRCUlRtbnl2cndycDFrU2dhaWY3RDNIbHJ3RDZq?=
 =?utf-8?B?Vy9mRk9Ed3gzT3hqYzU4YklUYUFaVk10RkR5M3J1aUU1ZEZ4a3o1aVBubC8y?=
 =?utf-8?B?bWxLdkNtZ3Q0NDR2U0FLRVRNZzU0dmZrNHhYVEVITXNyRjlIWktKMVFhMFgy?=
 =?utf-8?B?SWRRVm81SGdOcUpDM1U4dWxTWHB6R2E5R1JxaENzdVRRYUp3L1JrS3dWdy9K?=
 =?utf-8?B?T2pwWFN0blVEcXYyYmRmdWdBQXJQWTRIOEQ1Mk5XNFMyN2poeS9uQ0JLRC9u?=
 =?utf-8?B?M1hqMW1MUUhxRnRIaXhHT3RXcEpaK2Jubkh0Vk92L2ZmWVV0NXlxbnhpUmRU?=
 =?utf-8?B?UjQxeThhczhUaVlNdVlzek9JZUl6L1ltZjdJYTVIbnVQcnpacy9nSzVpTjV4?=
 =?utf-8?B?eWxaQ2huWTZMWEZuUS9LNVBsT3o1SjJaaVhteGQ0OHNyM3VwQ0JndjZhTjhy?=
 =?utf-8?B?bTVhOGVWRjZ0ZWVxWHVQVUE2VCt0d0NaWG41TStmUGpuSjJ4TC9vbVhFN0lY?=
 =?utf-8?B?bHZJZHo4Z040MUlaL1E2aFp1ZFJCV2Y4RFMxS3lsd0tKSkpVQnJ5YzVGNG4r?=
 =?utf-8?B?VTM4MTk1OUpEcHE3emhUUFlYdTRzNmt1cGRZYjBHdHYxUWRrd0ZPa3ZLWXNp?=
 =?utf-8?B?cStiWnJCNEJiYjNXd1dBZ0xCMzVndDZ4RmYrMCtTM2RpVnZsMU0wY0lGRlcx?=
 =?utf-8?B?TFpXN211Y0JWdzRsclZXWkFPK0tRY2FIR0NuSmJFNTNsN1dpdDhKdDJid0Rx?=
 =?utf-8?B?RVFHRnRjVy9uQ0JFZ0Zqb3VzaEdDL0ZQcktPWUJ4RnovUjI5OEJUcC8wYVI1?=
 =?utf-8?B?YlpPZWdkeHBwMkQvZitjRnU1YlNHM0N3YVBxU0JvRmVoZlFEQW82Qk83bXBJ?=
 =?utf-8?B?TUZobm9VR3JTUVlBbzNFY2toOFZkTFJ2RWVIQmphS3c2aXVSeHJrUkhNWEtT?=
 =?utf-8?B?K0hIa1RYWFh0SXRtTExVZHNPSWE1UThqT1Rpa0U5WFhvblI3U052MWVsMTUx?=
 =?utf-8?B?NjJUYXVQL3k4Sml5ZTJSTnhKWEo2K2VvcEhBRTJFUkx6RU9LWHBkRFoxMjFq?=
 =?utf-8?B?T25rWFpNOWltdXhLU2xOcGZWb0JkSVdJUDFlYVh5UktBVXlCWGxSbDZIb21v?=
 =?utf-8?B?OGxydHEwZnNrc05TV1FLbmtvL3RZRU5GbUZGRlArd2VKbzJEL3pYWjd5T0tn?=
 =?utf-8?B?ZEZBbkhhTjJBdGNrTGNUNlFmQkROMndsUG5lRkxlZHJFcDBzVE5rUFdkVnYz?=
 =?utf-8?B?d1pLKzdaZVVZc1BHU1pYYWNHNk9EVHdkbE4xa1RzK2VvcmR5azMrL042OEJF?=
 =?utf-8?B?K1AyNFoxR1pPeTlncmhkYXJCdzlQWVJ2K1RXTkx3Z2orMkJPbDRudWFWcTJw?=
 =?utf-8?B?U2EyNGU4OFpxWEV2anUxTXV4YkdrWjBGRjFXTm5wWlJ5ZFMzb3Bhb2pvd3hm?=
 =?utf-8?B?V1NLZGVOZENsVjBVbVcyanptZmhNSU9MWjZZd1VVNE9EdnQrdC9oRitXeWgz?=
 =?utf-8?Q?Juy46HK2dPYbwdnI=3D?=
X-Exchange-RoutingPolicyChecked: 
	WLoOLOAxXiU4lz5EgGnNFumi3zqWB6pJBQGE+JxZJIHF/ZVjSSrsbqRv7usL5sLFLmx0W6y8v8O1yQLZCMedqOVZ2E+16npx1ISg6p459N8Ii0UGfB0t3AxG6WAbgYwqzGxHRkHCWxVZJoFd2SpMXLMRyPAU6ZhHrHWsNWHG/X3FPqbp4IhmT0H5vgwPQg04yqKLvBpcSiUbym3XeGel+89eTDp/CCr1DpDG9l7pq92Emz0dqszZEro7QoTIckN3d+4rIbeYxL35Fo0tYKizsTFb2xY526josRJuego7BdTD2cyef3PAIyzWqxvz1A6GgPx17gX8roY5nwdxEuIvPA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9c47fca-e5b5-4c52-615e-08de990b2d23
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 03:17:21.6654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: my81Uvh7xuhqCAt4qZ6SzJbXaHmzLhEm40VwR+x5OABTi5A5LZSdGZRVEBGO5PhdyWguUN/t7ya1G8HTOXJl2svS/L4CoDUmSdOOi87glqo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6177
X-Proofpoint-GUID: pnBjLxMy_DIps5hQmymX7PFAlgQ2dBCW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDAyOCBTYWx0ZWRfXz0dAuhsjAXYV
 ovsfYiSBCz0PF007yzuzfgN6mfUzc3GHvI1YDQD/eyze5al4yyGNiv8xqgADVJUXvL6e/DSijbR
 /++5oSpX2EVTBkkwXAU/T46tLO8BqECMqrwSpuYZjSnPeeqt6E2g/NwOBJJoj+v5pgTpmWtRBr7
 nNHLjvhLyvhF8ejpjjULZkW69QfCMxqvqQ3BwuSxQzxOGpgS3MqJhfY2S59wCMTPJkvEsw0FhgK
 U1cIGkuCX6PkyeEGOMnNQo7TfSOFWaDoOqTsNTGRitGQoM3hOVLSMDtbwoYagPOkjIrWuznQa6S
 87qmcIeJT7RJiwHOsRLjxkaB01GoEG6HCWaflQE8p/zLnBGK/4W559dSiP9z/pl2mKz7guYkLja
 1RfMJcdfr+CNWrSTwFB6gPRKHsfDAe3KvgLQNqLKxIVZIw+zPTHe70t2e5K5fEl/zfnAijYbja1
 PqpBGkd5ALwdcJpscmQ==
X-Authority-Analysis: v=2.4 cv=S6/pBosP c=1 sm=1 tr=0 ts=69dc6043 cx=c_pps
 a=ZRTQSBiCf/ik28kxSsFIIQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=P4YcPvp67HU7xPOPoKwA:9 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: pnBjLxMy_DIps5hQmymX7PFAlgQ2dBCW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130028
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 03:17:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235078

kindly ping

On 3/19/26 09:54, Changqing Li via lists.openembedded.org wrote:
> When vulkan is enabled in DISTRO_FEATURES without x11 or wayland,
> do_configure will failed with error:
> gst-libs/gst/vulkan/meson.build:311:4: ERROR: Problem encountered: No Windowing system found. vulkansink will not work
>
> set ANY_OF_DISTRO_FEATURES to make gstreamer1.0-plugins-bad build only
> when x11 or wayland is enabled.
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   .../gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb              | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb
> index 4a9cb37dd8..2cb00f180f 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb
> @@ -19,7 +19,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
>   
>   DEPENDS += "gstreamer1.0-plugins-base"
>   
> -inherit gobject-introspection
> +inherit gobject-introspection features_check
> +
> +ANY_OF_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', 'x11 wayland', '', d)}"
>   
>   PACKAGECONFIG ??= " \
>       ${GSTREAMER_ORC} \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#233455): https://lists.openembedded.org/g/openembedded-core/message/233455
> Mute This Topic: https://lists.openembedded.org/mt/118394443/3616873
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [changqing.li@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

