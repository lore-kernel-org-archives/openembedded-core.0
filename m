Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95036D10F57
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 03:26:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.32508.1731900382191311831
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Nov 2024 19:26:22 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=105219cfd5=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AI37fTx010310
	for <openembedded-core@lists.openembedded.org>; Sun, 17 Nov 2024 19:26:21 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xusq10h0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 17 Nov 2024 19:26:21 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4AI3QKHU004689
	for <openembedded-core@lists.openembedded.org>; Sun, 17 Nov 2024 19:26:21 -0800
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2042.outbound.protection.outlook.com [104.47.70.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xusq10gx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 17 Nov 2024 19:26:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UuHo+1RzHg87YbM9VoJQ0YZXE8gpxekSybaiNNPb0qpmT4my3N0BnGvg5Xlqu05z2uPu1s2RQOPx3n733aKYI4W394X13mWbmvaBmy5cmwwPadWcXm81cLZqlfMJBt93qLiuINjg7iuJimYgAoWpF5QaLgNJIKVHnIA4CH0XwDn4MB6GP2XHwbf5K9jWvZlE7la1hyFVAqdZRqTiDUD8/cgG1gRyjf24nCnJy+BElgTVbZZcB8bzrNqWLtVMDHlmOeL9qyZjp2mZUbWkusfjiHfQ1xin7JMKJ8y41LLxqm7rVYsJsoBvyCC1IT1JpNm1jCmJNBVJu7fULDQqqd0nkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qNoAGxQg0qFzCTmRnBI9do69VM+qe43AkYTKvXsFxlU=;
 b=Ktt7HmlNWmxjhrNRU0m/8gjtsCbARfeIW2pzsmnEd6jH8wnEzwIwNmtD+Fy5bzLgDG0mmjovnSpWWCzcSEoIsCCk9s0TKJyLAMchlthnyprQM94vjQ5xu8ILDEkCrzMwDxp/nHkBX/EKcyMuuhUrLZnLKoBaGweSUp+mqz7rS7gdCoeKSF4HvHOAU9X7WSHYXn67URb8M/znam31W+puTb828ytfGO1EhLbH5Rjj1zgYmmpNNp7yzDR4KSyi+xt2WAihW33j9F/YeeXJe6d8aiy5cm39cPON0dh793pw6cZSoSKBOCIMGNLlE3Tk1KhqikA6mKmVZ+rir3NibuS4zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by DS0PR11MB8134.namprd11.prod.outlook.com (2603:10b6:8:15a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.19; Mon, 18 Nov
 2024 03:26:18 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%4]) with mapi id 15.20.8158.017; Mon, 18 Nov 2024
 03:26:18 +0000
Message-ID: <f48c7ca6-b00c-4c77-942d-057806fe478f@windriver.com>
Date: Mon, 18 Nov 2024 11:26:10 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/3] sbom30.py: reduce redundant spdxid-hash
 symlinks to save inode on host
To: hongxu.jia@eng.windriver.com, openembedded-core@lists.openembedded.org,
        JPEWhacker@gmail.com
References: <18067C8FE5E58343.14874@lists.openembedded.org>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <18067C8FE5E58343.14874@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0019.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::10) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|DS0PR11MB8134:EE_
X-MS-Office365-Filtering-Correlation-Id: cc8c9d7d-9fec-4a6c-fbda-08dd0780c399
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|4022899009|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TzZlV0hxTGpEUmQ4d0hZNjl1SmtxdlVIcHhLNTI3bjJlTE1FcnZDcTE0SC9l?=
 =?utf-8?B?L2JWaFlSMlRwVWNENXFPWXhJTjJXSUp2c0FaQ1h4RlJNM1UvQ0ViVUovZTJl?=
 =?utf-8?B?cnpiUjRUOWtJcVA5dkNSL0NTNUpYa29nSWVxa3hrWFJoVDFvRGZITWU5Q3g5?=
 =?utf-8?B?ME1QYTJINlJKQ29MUndjbWV2VUZ5RnYvcHJYNFJuWnNiTk1FcmplMXlhT3Vp?=
 =?utf-8?B?MUNKSkJFYzlYQ0h1aEx2ang1d0F4NTNMRld1STVKdU51RnQxRzZHaCtuN2VQ?=
 =?utf-8?B?SU1wdEFzUDBmVnNLeDhYd0ZGalhFeHNtNjFmbjRKcUhoR0FZTlNpRDhyMUp5?=
 =?utf-8?B?RlhYTkc2eTlaSEVOQ1BsbFRnTlNnbmpFRnpnaXpzdXBKdGh2YUp1UFNPK2Nh?=
 =?utf-8?B?MVZyeENBMkZkOUFGcnF3REQ1TXdhZ3gvdzJKNVl6a1VzTXhaMUNhVHY4S05U?=
 =?utf-8?B?cjRUUjJhU1JneE1XY3FNSWZwM3pZZklEakE2dVc0Ymt4b2VQbGY4b0JUQlN1?=
 =?utf-8?B?cnFKTk9YSlBxNmJYV2VyOEpEYVV4Wjluby9idlJybkt2MnloMUkvS2Qyd1RZ?=
 =?utf-8?B?K2NaQzUvOXRJMGk5M283RlhGc0V5YktObklKY0JuL3BGcHZ6ejQrVWNyYnVL?=
 =?utf-8?B?VW1FY0xBQUlpZ3JJTW9xVHhVTzRQN0d1NXo1cXNLbU9zSnFBWW9rdWxZZ25H?=
 =?utf-8?B?YmtqS1VBcXVFUVRNb29mN0tMOFhxOUlVRGxyQnZJbm5IeUU3NWZzYngwYysw?=
 =?utf-8?B?OGZRNkN3UXAvUXVWT1d4VS9MQXBHMWhQcXpWN05IVjBZOEE3Q0hUejcrTW5N?=
 =?utf-8?B?Ritub2RQNEJ5cFRTNGhQWVkvSG96WUx4SHB0SlB1U2svWWl2anZkRWRGdzJa?=
 =?utf-8?B?Z0FsRU9IT0VIVXduZjlGQktGN2JMU3JTaXJrQzBrK2xkejdtUEs2SEdmTUU0?=
 =?utf-8?B?dzRDc1k1SlFUTXg3UmFBYXpnUFM3NXpENEJZKzhXdnhRcThOdEFGaG5mWERB?=
 =?utf-8?B?VVBwZXorSmttTlFVQzhLN2l0UHJrTlBUYlhxSGRWQTlWUVN0WXlONk1PT1dv?=
 =?utf-8?B?YTFyaXBLUjVVSW5BaTVFYWlvNzdXS2dwZkdySHhVVGpoazN4RDJxa05CbjBz?=
 =?utf-8?B?NFBkcFJPVVJhWitQWUs4bTVLVHBXc3YxOW5teHJIMFdXZWJwZ2hqWmVCakIy?=
 =?utf-8?B?ZFF0ajhTRDVQQmIzK0xIWWdGTlZkYy95MWFZYVIyNFhsbVM0SEFGdHkvSEJa?=
 =?utf-8?B?Y2NmYnBWSTdxcHlTYWFOVFA3dStzZnY0TGRRYXBoK3hMK1p4a2RxcWNaN3N6?=
 =?utf-8?B?aGlmNGZ3Q1dsVU9FM0hiMjNFZWlzLzQrMW45VGIyVXZla0p1cXhhbE5PYWtK?=
 =?utf-8?B?cWhOU1UwYmtZb3lBeHhacHNwaFdPU25pWlBNQzQvVTlnRWVNQzZ6dTVMdW5K?=
 =?utf-8?B?MVZqWFA0dDRXME5NK2xSNzhmTk1WQjhQcTdLN0ZKME8vZjFHSU9vZHhHYkxK?=
 =?utf-8?B?NVllZnFFRHJ3cXVPWlh2OVVJL0taVkdXbDlkaHhBUmwxUHBGQXFQdTRpVCtZ?=
 =?utf-8?B?eUtENyttWjdCNDV5R05rQXdmZFRNYmJpMUEybFF2T2RVTnEyUnVIeTUvRGlV?=
 =?utf-8?B?R053dFBUNmRLVGFJQVRQd3NXTThBTm1Sb3daRk9rZENLMGhsdXBRV0RLcC9Z?=
 =?utf-8?B?UGlxY3IrNW1oZWNpYWpxSDZrb0oxbWVsNzBJaHphUldEZXBleExNcDlnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WjMzK2VnQjgvRXhTME9XTHNzaGRhR3lxV2g3M25xQW9rZ3RjZ2EyZzgycStq?=
 =?utf-8?B?dG1lbXIxREQ5ZnRIMEx1UGtoSVBDYUo2OCtxZXZkejFoVlJHZmZ6YWlOZ3lT?=
 =?utf-8?B?WUZwLy9qbitHS3UyQmJEaDltUlU3NzZJZGRtRzdsWFNIblF3Sm5lYXpxeDZW?=
 =?utf-8?B?MUVCZE14Sm5GeEtyUnhtR2VuVHd3SjFaY1ZpTFZQMW92Ti91QzhReDlFc242?=
 =?utf-8?B?cllmZjVHdXRSamE5TTlvL2MwVDdPTi93clVUd0diVC9JK0VUVHVORExQMTZq?=
 =?utf-8?B?ZmxjK294enQ3L0FwZzZPMVkydS82VWdBVnkwU0dnN0pEQ29DZEtJblA3V2tj?=
 =?utf-8?B?RGIxcXdiVXQwYkQ0Wkk4c0xxSU5pR01YQlROMlpDOUpHZERrVGlLT3VWTWtt?=
 =?utf-8?B?MlBSdnBscUR2S1hzUndNRlFRL3h6K1Z6VXcvSDhmRWtURVdqK1dWMzJldEIw?=
 =?utf-8?B?VW1MeXJvcjJ6NUwyMWNGdTdORVZlYjAzbEpjNTd1bG9tOU05KzR2STIxN3Bl?=
 =?utf-8?B?NW1wcVY3eU9tQWRWeGViYmxQWGhpS3hTUjNjZ3hWZS9qb3A1ZnVsL3NJVVNi?=
 =?utf-8?B?YWI2NHM3TlN3aXk0RS9mYlVRRmRDWEZuZElYNDYzd0xoUEI5ZDNlU3diMXlp?=
 =?utf-8?B?TzhSRFlrMG82ZHROazJVME5JL1NVR294endMOEVvRW1mVEl5RS9IaDlWdHJB?=
 =?utf-8?B?VitKLytvak02bmFsbVR4R2tnRmZaOXZKWGtXR3NxMmpYS2xFcFJ5bWwvc05M?=
 =?utf-8?B?dTFVRHVMUmNLRDZRdzUxQy9yYzZQS2dQMXpHbWM2QnRLMnBtUDVnelpaT2Uz?=
 =?utf-8?B?ZmROWkd3VUJYbmhJV213bXd5OURxOG5iVjZJRE5ydHJtM1FvS0dUaU9GcXhD?=
 =?utf-8?B?K2tFcVUzS1dnenV6d3pXNXQycjByakF5endoRDhuUVJybnJDSzRaQnQraURR?=
 =?utf-8?B?QmRpTldkMnFNb3BEaDdsczBidTJvK1VYcGUzbFYzUTZ5NGV6N2x5azRKZmlR?=
 =?utf-8?B?eSt3SjJDUkxGaDVsS1hISlByaGdaOG1icWVqaEhmNHBEU0orMC9NVVg0VVR5?=
 =?utf-8?B?MWtzN09XZkh1dml3aUxwR2FpNjdzbGJ4NGlBQm52L3NHS0hyUGFyQXlqRmVn?=
 =?utf-8?B?VjF1Y2Vja0ZwWGVyT2cwZERPOUdScEoyMVEraWtyRDBjWVlrYUpHY2lNc3Bm?=
 =?utf-8?B?d1FkUkhPNFBaYVFNVDFNT0lKVW9kT2FBbDJJNXJZdVNLYWdmazBPU05FcUJW?=
 =?utf-8?B?YmRhajRNWUtRSWpTQVR3Rll5NXdBeDRyUzgySTcwZTFsck04SGtFblpZZ3JS?=
 =?utf-8?B?Y0kzQWRpZ2N2YVhHWHVwWDZtRXBReDB6WDl3S3VIYnFjYnhkL2szUjl0YStT?=
 =?utf-8?B?K2RLTGx4MTBET1ZlSDc5WnhDMEx3cW92NmQ3MXdKbzkyZ0dHTnF2aE9qb1B5?=
 =?utf-8?B?TmZ0eU1qRHFpWHFlQmpNZUFCeXpIeEI0bGZFQVhlRnoyRWN3dSs4NHVCT0Rh?=
 =?utf-8?B?ZysrNlhOck9OMXFjU0IrVGJ5dUhUNldoaTBheVV5dSsvWmM4RDlGK3UyeFMw?=
 =?utf-8?B?VnVrQWx1ZDN2RnRLUUhuWXVyUUdLV1FHWWdkZTNHdGU3czI3OUQ5RzBLQ3NL?=
 =?utf-8?B?cUMrUmx5RE5ZZVo1KzBMd0IzZUFtK1REcnpFYzR3R0I3dDJ2K2Z3QXZWeUpy?=
 =?utf-8?B?aUg0WUJLVjV3S1JWWXJEVVJJd0E0N01Bc1NDL3ZPclh6clg5c2tIbE9NUnR1?=
 =?utf-8?B?Tnk0MTJpQTk5YWFFZ24zOG1SL0JSdlNGK0NOWEZXdCtEUjFLMnBMKzFNN3RR?=
 =?utf-8?B?WWJnVlVSU3E5dWx3SlFwNHJjZWg3YkwvVllPdk9JeVBSWDJxNlRQTVVITVIw?=
 =?utf-8?B?d254ME5sQkM4aVhhQytRbjk3L1hKR2pSTDVlSG50SnlxSUJqWWlqMCtGQ1lv?=
 =?utf-8?B?clhzZFduSno2Mm14aFgzNHdtZGlJdVFPbUVNRlB0SXJHUVhITmFGbndXa2Nu?=
 =?utf-8?B?bjVkbHpzTVN3REdReC84Q1h4cWhxR0V5NjdweFRrOHNzY0VidW5ZMEo2MkJF?=
 =?utf-8?B?SDBxTThQVzVodStjK3dEL1BHdHlEZzhvV0JmUnZZNG1VS1Q0Q090OXZncjRk?=
 =?utf-8?B?YzdiWHlUVGdVdThRc0hRNW5udWJTMW15bEZueWhFb2VZWmxCaE1OWWZDQ3hG?=
 =?utf-8?B?ZGc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc8c9d7d-9fec-4a6c-fbda-08dd0780c399
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2024 03:26:18.0593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r24765YBCVUe7INs6LN6+ZTdJw5JKgMp4IkJW/ZEFkPnjTTNaR/jBecuMANXeagJ0/pqc79K+FBpKRezLImMfdFGYIfXBBUseBVCHn3bYRY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8134
X-Proofpoint-GUID: pwAfKWwoQn5OLVaddK5ZQzPvuh1bt3Ah
X-Proofpoint-ORIG-GUID: uf4S4qlkaMGqzbY5kO4HpYmhbjfUwYRM
X-Authority-Analysis: v=2.4 cv=d9mnygjE c=1 sm=1 tr=0 ts=673ab3dd cx=c_pps a=Dwc0YCQp5x8Ajc78WMz93g==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10
 a=24AZYWMyAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=fNWetxUTEzhEqDBAtZoA:9 a=QEXdDO2ut3YA:10 a=bG88sKzkDEFeXWNnvthB:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-17_24,2024-11-14_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411180027
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 03:26:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207201

Ping JPEWhacker

//Hongxu

On 11/10/24 11:07, hongxu via lists.openembedded.org wrote:
> In order to support all in-scope SPDX data within a single
> JSON-LD file for SPDX 3.0.1, Yocto's SBOM:
> - In native/target/nativesdk recipe, created spdxid-hash symlink
>    for each element to point to the JSON-LD file that contains
>    element details;
> - In image recipe, use spdxid-hash symlink to collect element
>    details from varies of JSON-LD files
>
> While SPDX_INCLUDE_SOURCES = "1", it adds sources to JSON-LD file
> and create 2N+ spdxid-hash symlinks for N source files.
> (N for software_File, N for hasDeclaredLicense's Relationship)
>
> For large numbers of source files, adding an extra symlink -> real file
> will occupy one more inode (per file), which will need a slot in
> the OS's inode cache. In this situation, disk performance is slow
> and inode is used up quickly
>
> While using function add_package_files to add source files to JSON-LD file,
> the spdxid-hash symlinks for source files point to the same JSON-LD file,
> then according to the format of spdxId
>
> - spdxId of souce file:
> http://spdx.org/spdxdocs/shadow-10e66933-65cf-5a2d-9a1d-99b12a405441/0838759b8d71923d250a0813dda7356ffd309576115bbf8ed7e266cf4aed86a5/sourcefile/1
>
> Remove the count number ('/1') from spdxId suffix, then all
> source files in one recipe will share one spdxid-hash symlink.
>
> The same reason to sysroot and package files
>
> - spdxId of sysroot file:
> http://spdx.org/spdxdocs/shadow-10e66933-65cf-5a2d-9a1d-99b12a405441/0838759b8d71923d250a0813dda7356ffd309576115bbf8ed7e266cf4aed86a5/sysroot/1
>
> - spdxId of pacakge file:
> http://spdx.org/spdxdocs/shadow-10e66933-65cf-5a2d-9a1d-99b12a405441/0838759b8d71923d250a0813dda7356ffd309576115bbf8ed7e266cf4aed86a5/package/shadow-src/file/1
>
> Build core-image-minimal with/without this commit, comparing the spdxid-hash number, 7 281 824 -> 70 508
>
> echo 'SPDX_INCLUDE_SOURCES = "1"' >> local.conf
>
> With this commit:
> $ time bitbake core-image-minimal
> real    95m6.960s
> user    0m22.832s
> sys     0m4.087s
>
> $ find tmp/deploy/spdx/3.0.1/*/by-spdxid-hash/ -name "*.spdx.json" |wc -l
> 70508
>
> Without this commit:
> $ time bitbake core-image-minimal
> real    100m17.769s
> user    0m24.516s
> sys     0m4.334s
>
> $ find tmp/deploy/spdx/3.0.1/*/by-spdxid-hash -name "*.json" |wc -l
> 7281824
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   meta/lib/oe/sbom30.py | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
> index e3a9428668..4efeaae3a0 100644
> --- a/meta/lib/oe/sbom30.py
> +++ b/meta/lib/oe/sbom30.py
> @@ -911,6 +911,10 @@ def jsonld_arch_path(d, arch, subdir, name, deploydir=None):
>   
>   
>   def jsonld_hash_path(_id):
> +    # For the spdId added by add_package_files, remove suffix count number
> +    if re.match(r".*/(sourcefile|sysroot|file)/\w+$", _id):
> +        _id = os.path.dirname(_id)
> +
>       h = hashlib.sha256(_id.encode("utf-8")).hexdigest()
>   
>       return Path("by-spdxid-hash") / h[:2], h
> @@ -992,6 +996,11 @@ def write_recipe_jsonld_doc(
>               *hash_path,
>               deploydir=deploydir,
>           )
> +
> +        # Return if expected symlink exists
> +        if link_name.is_symlink() and link_name.resolve() == dest:
> +            return hash_path[-1]
> +
>           try:
>               link_name.parent.mkdir(exist_ok=True, parents=True)
>               link_name.symlink_to(os.path.relpath(dest, link_name.parent))
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206912): https://lists.openembedded.org/g/openembedded-core/message/206912
> Mute This Topic: https://lists.openembedded.org/mt/109492273/3617049
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [hongxu.jia@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


