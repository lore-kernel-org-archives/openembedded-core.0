Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C39FBC7115B
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 07:24:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1243.1750231469128184657
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 00:24:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8264ca7d46=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I5bmHY014004
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 07:24:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 478xa1m9dv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 07:24:28 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55I7ORXV010327;
	Wed, 18 Jun 2025 07:24:27 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2056.outbound.protection.outlook.com [40.107.236.56])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 478xa1m9du-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jun 2025 07:24:27 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HE1iM9a35Pfm+CKzvuoIdsrxEzA4mTtwRiZjwM3CkUF2i4coY/0jFmFfFa0dIRZn/6tJyysimHn8HmuxOVW4q/JLpqhH04QDFRkmkoom6PD9o6JNnPeReGeO2p6pu5hVhHwbdPwgwXRJwtFwXYKA6hu5seyiVZ1bhfrfEvIhiRs/7NInPqzVZMq3JBpcT2dMM3o38mQYReMDx51WY1AcPvV52Om16Pmrd+AvnYMIXDen7r46gh0hcqQDRoYM3nrpwRV4poiFynHO8v3ydSvMhIkNTqnd0uNaAXIRTYtEtrpf7+d/s076oyMm6g2GMHZKlw8pU7VcWpC2MfIFrhDuGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O9QORytBtNTSke5U+BCTZ5u4AXSIdujWtXWY/MvrUzY=;
 b=R8dzxGFe/xeP++nvU7b0HB5I0sFGdkRAWhn3IgWQ6K/JdME+gu658wjGsIC8xE636cEuE64glTfhBqIMh1Lszd1aUcQs8s+afywN1Z0DJMHTA1aNCjUg9a+UbNo2r+DXutwDRm/WCaGzGgWnkcJtB4SDdblpWFGYiqfQC9lUnNokG0Ut38rpa/uCmFbxVCl6cn9xWPNulqNhBTaVYpSg2XJ3hPXZS+pTkV2oKOhwOsKDRsIi4P9KG52tWDa7dudg0zGrGJXn9S+p71w7MS14fZ3e+xPKvLv+DHzASesZ7W+tLYf2MjqKjv7dvYVcgXZnwVcyuMZDv7SlOKwBoeIdaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS0PR11MB6493.namprd11.prod.outlook.com (2603:10b6:8:c3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 18 Jun
 2025 07:24:24 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 07:24:24 +0000
Message-ID: <582ab22a-f015-4611-b1d5-3c2c624585a1@windriver.com>
Date: Wed, 18 Jun 2025 15:24:16 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][scarthgap 8/8] systemd: Rename systemd_v255.21 to
 systemd_255.21
To: skandigraun@gmail.com, steve@sakoman.com,
        openembedded-core@lists.openembedded.org
References: <cover.1750176125.git.steve@sakoman.com>
 <db02a4cc542d0e7e563ec46c91bf9a7313a71d02.1750176125.git.steve@sakoman.com>
 <3285382b-51c5-4ea2-9784-91267d1180ac@gmail.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <3285382b-51c5-4ea2-9784-91267d1180ac@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYWPR01CA0006.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::11) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DS0PR11MB6493:EE_
X-MS-Office365-Filtering-Correlation-Id: 855f35ff-83fc-4d0e-d2d2-08ddae3926bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Sit5T1I2dTRvZ2dILzBtQXFzd2ZubXlqUm52WmFaNnFTZUNKSlhTUWRiVHFo?=
 =?utf-8?B?Zm5pTzA0aXlXSDl0R1Arb0IzL3BKY3diSEtEdG5xMXlCOGprTGtOMGlXTEw2?=
 =?utf-8?B?M1NGMWdOeHdqT3BTMzR6cE1nVU5uaXVuN3RXL1A3d3Q5MHN1a084Wnpya1l5?=
 =?utf-8?B?NWV0NEZ3RkJ4QlorUDNsVUQwUkRqRUdTdFF6aW1FSVk1UVloZ3VGc0tJYlcw?=
 =?utf-8?B?Zlc0Rlg0K25rc1lXVU9PZG1YZHlMa21QbVB3OVZQcW1DSVFpeXNPWnE4dU9y?=
 =?utf-8?B?THFrbU44RHhLSVBkR21EbVRzTTMzTlQ4R0NlaHk4NGNvRHg3REU4QitFQmZN?=
 =?utf-8?B?ZTJKY2x0TmJ0VTFSUUJ4T1dIRjd1YklZMHpVc2V2ZE5GOXhVb3BMbVJXbG96?=
 =?utf-8?B?Uk0wcHdkUHlTeEJRYUlRaklZNTR3YlluRHZVaEN0U3BDZEJQZHRQQmEyRy9x?=
 =?utf-8?B?Q0FDWnNQdGRxUzcraVhSWVlxUGhjUVEraDVCN2dXRGVvUFVXVGZGcUFwSVQv?=
 =?utf-8?B?NXhwRlpsd0JmM1lESiszbjh2bjlOV3hBNnJXYldVSnFNZzB0UHlKajNrcStV?=
 =?utf-8?B?OWxDNk9BVzk0a29NalBaY29QdFRZYm1DRXlRSmhnRm5xc2NXUGszMUplK29j?=
 =?utf-8?B?QWJQSjB4bFcrNXdTaXlYS3FWRDc2SWtVN3hWeVI3aFRsaGlHcnVrK1JhQ3Zw?=
 =?utf-8?B?VFdNM2dRdG5YQTJzeW1Beis2UWNzWmRETTg5aHBVVkMvMHRlS1NOdHllVllB?=
 =?utf-8?B?bEhYMitsSjlDdGVlay9YcU1CcXYyZWxKbzFxeGQvTm14cDNrWW03NjRtL1JT?=
 =?utf-8?B?VFpyUkp3OHo4Yll6cXRuL0Zjdi9mbFRac1Y2SFpydnRLc01kMUk1UGgyU1FE?=
 =?utf-8?B?R3FvRnQ1d1NsYmZ2N0w5NWcyK0EzeG9sQW5vbWxEbWVUZnY1YS8zRUlNbG1F?=
 =?utf-8?B?K1VtSmg2TkUrZFdkV2tXcGlUbmdKQVA5Ym1MdWUrZml6cTFtQzlkUWp0bWVP?=
 =?utf-8?B?RTJ6KzUzSm9SNFRvSEZoTXpwYnFsWlRiMCtpV3M3OTlXTW8yQkVxQjNnY1JG?=
 =?utf-8?B?SnJ2TjR5SU0rT1Q4WkZESGh2S0IwNkRNRjdHZG1VdkFDZUlxeGgxNkpZcUs4?=
 =?utf-8?B?d1JQeXF1WHF0Z1UzaENuNXF0MCswZzgrdkt3NGNFRm1FczlUNm5LK2tuSnhh?=
 =?utf-8?B?ZDZkdlBKUjArNHZ2R2xHQzJFTTllNEk3V1RzWDkwN1pFa1BsK1c5UTYzRWw2?=
 =?utf-8?B?Sk40R2tTOTR0VDBwVWxMMFRuTEdsNXpINGFTZ3pKZS9BRWZtNEt1MjVNdWtT?=
 =?utf-8?B?ZTUzWUJtcXc1dithSlZFVHlicDArTENEUU9ORXE1eGNxM0dqYnFUTnZOQS9x?=
 =?utf-8?B?OTlyWGpYUTc4ZXdlOFhkNTRSa0svck1Dd1NPM3FFSGdQYUt2aTFUeXRER1Qv?=
 =?utf-8?B?aVc5ZDhOL0lHZGtjQVdLc3FiNDBXVHFidjZnSm9sK0x2SVVrS0VRZnFLNll6?=
 =?utf-8?B?WWM2T3NXSXFFa1NIOXFFeWkxa0IzbnlZbVZuVjZVWmZTNnlETjVmR1VhcklR?=
 =?utf-8?B?NVpMQ283eUtNcFFKdTFsREw2UkdNYjJEb1loWC9kcmwxa21yWlBZazlmbHlJ?=
 =?utf-8?B?TEpLSi93NnN0cW1ualMzOWthalc1Q0pQc3l0VzcwVDJEUHg0aEpkbmkrYnpX?=
 =?utf-8?B?UEhVQmFPQ0ttSWtNOHFhL0FCK01TUXA3ZGx0dlJkeHRHV01UZFR3UDhNbnhs?=
 =?utf-8?B?bjBXK1M5U1czdVZvQW5CNWJWRG11WS8wWkdpQndZRldEUlZkY295NUxjNE5E?=
 =?utf-8?B?YzIxelVBV05iU09lRVFoa2s1NE41ZzFtMUtqell4UWxRZWswaG5ZTSsvR3RV?=
 =?utf-8?Q?9s8a83KXIvCLo?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4022899009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cHp2RzdXMWkvVkw0YUpjL2FvcXR6YVovcG9lVGdLMmZ0RHdDMjVvcC9URURw?=
 =?utf-8?B?blVJbFpXY29RTDZpMHdwNTNVREFtd0pnK2NPRlA0akRHVFk1YW1UNU9SOUxh?=
 =?utf-8?B?ZC9wdzlDcktMQTkrZ2piY2VFVUZJU1k1bjRMeUNzTjI3QzFMNkRPOEpUakZZ?=
 =?utf-8?B?SU1TQVNRTzNxaEhQbWlnNXRXcGJRVWlSM0UvVHVta09YNm04Z3dId20xWHlI?=
 =?utf-8?B?cFVXd3MxS3llbGdlQUdDcVZpaWt4Y3Z4SkVWd2JDQ1E3ZnBQNG1MYUlPRnA2?=
 =?utf-8?B?TFF0YUJ2K0c1cTQ1QVM3ZEh6OThobEJSRUhiK1lQVXhwd1I4aUpGclpBOHhW?=
 =?utf-8?B?V3RTaXI0YUdMa1Y1Nk9SL0p4SmhCeHhFR2ZvelhTOHBRQ2V1VkozUDZxNHJY?=
 =?utf-8?B?eXZsVVpyRlpkdlpiU0cvdjBXT2RFR2VyVEd6SXVCN1hLdTc3RTlCNmRWYVBn?=
 =?utf-8?B?bnVYT2RMNXdaditmNU03WHFveHZxY1FjM2FRNWhzWW9idkhLLytJTUhacmlE?=
 =?utf-8?B?T3hJQnBtMy92MVJteERKd2liTDJ3MjJ5OXRXMDRZT21FTkM2SHVCYnd4ZUNK?=
 =?utf-8?B?cFhVNmVyRzIvZjFRSUNnbTFkelJSV0E2WkFrV05RRTJoWFZyV0RwWXZsQzJt?=
 =?utf-8?B?aWFPOHpqWlM3bkxYTVBDNVc2bXhDUUcvRGI2WkJoQ3BBRnFPd29aK3ZYampy?=
 =?utf-8?B?TXd1b0FhTEVVWkdoN0ozY0RMZElKYVZUYnZpSEpjT1FoRk1GbUE0ZDlqWXFj?=
 =?utf-8?B?ajJzT1VkRWJLbnNsQzBOWUFPMmZWbXlxYXJSY2tPMjh6dFhVeGI4b09jV3VQ?=
 =?utf-8?B?UjMwdFpKR3lZak50V1k4VFJmeStDL1VxamRtYVI5Q1BsREZBUjRsOGpNT1gr?=
 =?utf-8?B?UXF2TUJRVmNBNW9uWmVleWQ3NnArT2Jxc00xbEZ6NnpaVVVjTnU3ZHFCbTZw?=
 =?utf-8?B?MnpqbThISnIxTVNkUkJtcDJBbEtMNVRwQjYzUnQ1RGZ2MU9CY1FhbTBnTmYz?=
 =?utf-8?B?YlNaZUV5UmR3ZzdqQ2ZEZm0zUTRDM1EvajhCRFd4YXNVTkttVlVCYW83S0tk?=
 =?utf-8?B?UEFRbmdEZlpZeXFYZHhNUWROWnZWWmpPaEFFMzJNbEtrK01WT2gxTmI2UVZO?=
 =?utf-8?B?cXlVaFBkQlRocWF3ZDl0MlBrNjhtOTRIRUZueW4zRTFlaVp4RFVHMkRBQzMv?=
 =?utf-8?B?MzJac3BvTE9oOVM5OWYvZlYxYi8rVUtGK2dNcVcxTzJQZlgyYytRREgzT2po?=
 =?utf-8?B?My9WaW8rU3ljbjluVFhtTDlOZGtUYm0ycFlYQ3daY3VRR29OaUFtK3VNZ3d2?=
 =?utf-8?B?VU5Ca1ZOVXZWNnhhMFRCeElvSHN0ZVlQcmYycDlYSmdTU0tyYjE3aGl3KzBv?=
 =?utf-8?B?V0xzbVpvLzgvcCtUQW92cnJnV0hneGduNm83UGtudXVKd09LNllYaXJzQXRM?=
 =?utf-8?B?RVpKQSt5M1dtbXhLYkxBbXRQYVpqckNVZjRQOE9OS1JZVnlEZzFUODhRZHE1?=
 =?utf-8?B?czgxU2FCZkYycnh0TmoweHYvWGdkS1hmU0NzYmZLcGlSYVJJZFY5czlITmUz?=
 =?utf-8?B?N3lZcFFhUDRMMnBZWGNMOWUzNGdELzltcytFSVFGTEE1YzZ5b0Q1VzMwR2tt?=
 =?utf-8?B?UWhnV1hGM3JCOWF6eDQ3azBSeEtQL0ZWTjk2bHdqeXNVaGtWTU9NSlhBWjZ1?=
 =?utf-8?B?Uk9qMGJDZnJMbGNzTDIwejdIZkVCVDFQQzNnYWVOS08xRW9KVkhXUEIxK3A0?=
 =?utf-8?B?MUhnS2dPaTh4ajlmc1V5TkZFTDNzS205aTNqblpCdDFGK3dMQ2wxUW9vNDJM?=
 =?utf-8?B?aFMxcFRibUdzaVVxdHB5b3BpQkN1Ky9hMDlzKzNUeUlNQjdMdi9qSHZYRVlh?=
 =?utf-8?B?RmNXajdrMjZicm9UYlgrTFNobXVqbDNtbTRaR1pRd0E0eFRjOVJ4MldIWGpi?=
 =?utf-8?B?U3RHL1ExUkpaTlA1ZEdic1dZUG9SQlAwOWJyUjlIWURnNmEzNE9COVFSWnRN?=
 =?utf-8?B?bG1NRjR2NWZnekVtWk00Zy9HcHRlRG5LaWNBSFdUVGJTZHlaNWl2blFsTDFn?=
 =?utf-8?B?Uk1Ka243NS80VUtuRFRtNnF2eUlZUEhGUEZKNUJDOEtzcDU1bm52WDVkK2V3?=
 =?utf-8?Q?W5G780cWM+9kYwGwj8+BU9L0G?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 855f35ff-83fc-4d0e-d2d2-08ddae3926bf
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 07:24:24.6097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LgxZr6kZXIps3+LvFrzuCCjCAKJAOG8RMRJurONRRp4/CEuLPXglTroedJN9vs6KPNI8dtMIkNXEofiZuJUDdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6493
X-Authority-Analysis: v=2.4 cv=PuiTbxM3 c=1 sm=1 tr=0 ts=685269ac cx=c_pps a=Z35tn85hJNknc3PDpfQsnQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=_enOPnqeAAAA:8 a=t7CeM3EgAAAA:8 a=K59sTfBNn0GJJ7tPEfgA:9 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=XAbD3I9PDrnSMThV5XoS:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: xDMNpNhwN1zK69zW40QtZqxzBQIIi9ww
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDA2MiBTYWx0ZWRfX8BrfnJ7Ye7fC LprLeRgbCusUaQSXDAIppc8+NIJLPiyNEHIZII8pKjW25WU3BHzYrB0EPpOzaE3y83p1y8H0kJ8 lVpZPMSsgteY/fcwuSnrqL0fz61/ArB2g/8naYrQkL4iVD1BTbCJB9Ae0iQAMhutCVMwOHqTz5g
 8xNZCkQl8g25GXBbXJu9SyGE7j8/iaYmXQKYxcuSCKS8UtmzoYjPyKhK1116HqC0+YRF5BmUkgq vMezfghY1lXk8svVld7BAld4XsRqUdpzCFtOZhwGuL7dDHLjilZoIUDjgM6EuxqqnPxVT/oDTpn aHktC6WOjq8SFAW8QlssEYU/1rtHmyWrdEHkW7CoBWQxMEUijMJnjJ/nKH6GQV2aC02Jflv3d8+
 d5QfMaHAXGK2YY8UqHJCkFxBW+uklUFrixbRp75xvF+JyHoQPTTmdXpK8MC+AQ5nnfz8SPpd
X-Proofpoint-GUID: rDy9uDq1IeU220Z7YhyO8YOhY094drUn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=768 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506180062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 07:24:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218972

The author's V1 patch bumped PE.
I replied to that patch, asking the author to not bump PE.
My reason is that we'll need to bump PE in later releases too 
(walnascar, master) if we bump PE in scarthgap.

Regards,
Qi

On 6/18/25 15:08, Gyorgy Sarvari via lists.openembedded.org wrote:
> On 6/17/25 18:04, Steve Sakoman via lists.openembedded.org wrote:
>> From: Savvas Etairidis <setairidis@gmail.com>
>>
>> The recipe was accidentally renamed with a 'v'
>> prefix in 29e623b2ad00555788412fa520fbb9ffec794cbb.
>>
>> Signed-off-by: Savvas Etairidis <setairidis@gmail.com>
>> Signed-off-by: Steve Sakoman <steve@sakoman.com>
>> ---
>>   .../systemd/{systemd_v255.21.bb => systemd_255.21.bb}             | 0
>>   1 file changed, 0 insertions(+), 0 deletions(-)
>>   rename meta/recipes-core/systemd/{systemd_v255.21.bb => systemd_255.21.bb} (100%)
>>
> Personally I'm not affected by this issue, and have no problem with this
> patch, but a few weeks ago there were people who were unhappy when a
> similar issue popped up in Walnascar with autoconf (though it was caught
> before merging), which makes me wonder if this is the way to go.
>
> Systemd already has a PE[1], exactly because of the same situation: "v"
> was removed from the start of ${PV} - maybe it's time to bump.
>
> Anyway, as this patch does no harm to me, this is not a complaint
> against it, but I thought it would be worth to mention it at least.
>
> [1]:
> https://git.yoctoproject.org/poky/commit/?id=f95bbe35b2aab929e50471db8ba50781d5027a01
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#218970): https://lists.openembedded.org/g/openembedded-core/message/218970
> Mute This Topic: https://lists.openembedded.org/mt/113692551/7304865
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


