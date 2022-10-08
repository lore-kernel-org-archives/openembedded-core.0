Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1AFBC433FE
	for <webhook@archiver.kernel.org>; Sat,  8 Oct 2022 07:13:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.1779.1665213202785170567
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Oct 2022 00:13:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=otTo0/0W;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=72807f6da3=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.5) with ESMTP id
 29870bR9007442
	for <openembedded-core@lists.openembedded.org>; Sat, 8 Oct 2022 07:13:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=bVBvZv/L+2I1B5aOG9MazevMKpvuHqlPgsDLZKmZo4w=;
 b=otTo0/0W/2BpsObGmWd6ulbMGajzKGfV3Ev7vw6K60oFCRgEm2v9bb4zD0k7dRQ3KmYv
 dHqry8DDHfJY/Wg6FOjuSnqGOdMb7CF9glTawME80imbKHfawBbUj6XUzXF9bebebk5N
 Ds1jRQ/JwuDWotkHDRdIFwXnCnhxP+tKXi9ULrpuzcWGLDbQuRFMJbUfACIq6ye6jsQW
 KBO29wHIUBEvkwqv2WurGirzcymWbRSs/CELAh7eNpX0FO0Sq+2Ca9+nfLx3WmEbunNo
 AmJo23IgAb3W79Pd5XxzHD4l3N2YTfzInnQXc4vrCxwleS0TldOZmFVNDyapIP5sJp8f FA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3k3067r44d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Oct 2022 07:13:21 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2987DLBC001012
	for <openembedded-core@lists.openembedded.org>; Sat, 8 Oct 2022 07:13:21 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3k3067r44c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Oct 2022 07:13:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E3q3o3E+BglQv+3g4EEbMD1kvJ5Pb9ZnQir4h+eXNvtXAZ3dFud75RYMemOPsn7kydP84LsR7XjxlyW4AirGXSLQAZylzMS+c0gW+3IgTz3aXzpJrW3b2cg6yGljA2AJXE07G4ghF5OzKOCDztXqv+EjNLzJPrA+sH6xx9zCRlLAwAdM8F58eH0Vu8XDLrx95AsfuTxCp/vIOkw22zOGlFG3IzX5CTzOetH855CEMSSSjs4GBnISMXwg6vv2oShHE9iVz1c0um1dNe/itg2J6GQ6nZrH+n5B1WdCFqTVK+JFyqRD9y0DMSW3Hamx6G1cH2CCTTIu2oCmt8KliYvTFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bVBvZv/L+2I1B5aOG9MazevMKpvuHqlPgsDLZKmZo4w=;
 b=dOWFxXDlO8nyYieH7B26yvIsk1AMtupuzHC+5TGQfU9KxTdbXEllG9twVDTPCrUtnknTa2LLGhg2vlFIrHaU62yTRv5jbdEhsLIp5vDCPkvDifXTgdUgFTZcv6FLkkawoCAnftV9QSyuCegZ0J/vH0YcRsqzM5pFO1jy17Jr8kW47USEWKd/ppKB44NCcic43T8YMHB8CPVZ1c3kan4MTJSLLCtSOj4HXTwICrezp5KitqjDzMoQH/EP+K14cZ7xeGlBtVzrQnEof4w/4WxkDbf22M10g59+OP56NOQZ7cssUb6UuU0dkZbqfTny7Mvkw7eios1dyfaItnC1c4YzNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by BL3PR11MB6337.namprd11.prod.outlook.com (2603:10b6:208:3b1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.32; Sat, 8 Oct
 2022 07:13:17 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::2de7:e0b6:c82a:1800]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::2de7:e0b6:c82a:1800%3]) with mapi id 15.20.5676.039; Sat, 8 Oct 2022
 07:13:17 +0000
Content-Type: multipart/alternative;
 boundary="------------soJWb187puD6WJ3GHv1YQST0"
Message-ID: <8e6f705f-5957-0573-fa77-77bfd8bd9dbc@windriver.com>
Date: Sat, 8 Oct 2022 15:13:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [OE-core] [PATCH] fix close_range fails unexpectedly in
 unprivileged process
Content-Language: en-US
To: Ross Burton <Ross.Burton@arm.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20220930084823.2772546-1-changqing.li@windriver.com>
 <16B6F015-6AEB-4374-B680-21AA22A1131C@arm.com>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <16B6F015-6AEB-4374-B680-21AA22A1131C@arm.com>
X-ClientProxiedBy: SL2P216CA0073.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2::6)
 To SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2557:EE_|BL3PR11MB6337:EE_
X-MS-Office365-Filtering-Correlation-Id: 14ebbd00-9fb1-4466-4d26-08daa8fc92a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4lNLtR+WJB962kwxOsdj35xi9HKkto670NKTQ9to5gVz8NaUVVuK+tPUh4gRo+3uqfDf6W1jlWV2MARBGphzqjgdWY6VMzxgbnrCCjTCuhmyQEyNK+yk4NoWz5DADl3bL/ED70aisrxBwCWHBF/IIJRwQHpcVv5oKVQd70YvNDTL0rwLnrDema2FhXJJ+pOmpeCXlWGlKJM5lMY5KGyeJJeoQl4ViRZ+9DQqDGsQybQpgAlMbGdYpPBqYH2t8V96Wqpla9khbh5Q0ildkToS26jGIjMI3ChefaAvTcvfdF+7IiO2LhH8yCGC1N/a1qXEfPYsXrqP2JvHjjAMn9099226M6y7TTMbAbDj/++oEkw3RJI48XaDJlF14T+vXp9ecd1msUzLrWlrD+GXK20OjSP7BTTCHDQEVynSCUXiXaiK9JIPQyhBKclG74duMNCcxIhE7QqbeYnskh4PVT6hBgOn2PDrHm2HonGaSmTxaNtscPH+nKJa2E3+JKV47ZOp+afsfAwQkFez/igpf5QZCOG5bNfaruifmVhwFuAzqV2irYItVoQW+bn0jp+gu6R3IpbM78/zK6+zWNt68kJnNG7NakbACCHCQPwhL1M8f5cGtNSBQR1RXpdPlhxqrWQ3WSa+HlG6hCYHKtb5Zl2fN7z8h1IgEiMLVUh38mVyq1ks7mYQW1fvrxAqfUwKgtv0GFrgLAxFxXf8bej+7ESPjI3YyLJyyXXL32T8NunPWIMaWTTNAj90hMcyVC0rjjRe3/yAk3TM6eQNgyJzXeBmRLB+yeyDWNGf4Fw07I4Bg/d9sFwfFtexkWFZLqhoLHXk5KPly3kgDLuzitptnDbPS7vuoHM8NFmD1l9SCWgXbFqBbg+gtSN3fDo0LMK2NkY2
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(376002)(346002)(396003)(39850400004)(451199015)(66476007)(8936002)(66556008)(4326008)(66946007)(8676002)(31686004)(31696002)(86362001)(6666004)(6916009)(5660300002)(6486002)(41300700001)(316002)(966005)(478600001)(166002)(33964004)(2906002)(44832011)(6506007)(66899015)(2616005)(83380400001)(38100700002)(36756003)(6512007)(53546011)(186003)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UmU3QU9CdFcybnR0Q0pERzFJdGdsV2pQdDkxNUxHaTRWbDdGNkVmTG54SUls?=
 =?utf-8?B?YkN4ZkFYQzY5VStGMVloS0pKZDNXa1VvU3IzamNTV2UvOUx5ZmN5QUgrdW0z?=
 =?utf-8?B?cFNDaXE0QWhMSENJeFk2NnRTR0pLbDRtSEVETXVpNTdkS3l3NEViR2JDeVNL?=
 =?utf-8?B?ZTIrRkdzVTFNTUJ6azcvdm9sYWt1UXU1am52aXl2R3Z5anZaNVI3V09RRWlU?=
 =?utf-8?B?eUtxR2VNRzNwdE5LUWlHcTczZUVBK2xWMkFSY09iUnlkYi9FNDlKRDI4b29J?=
 =?utf-8?B?Q2p3c2dDOXZvVUw0MEFCbzF1R0pLT3lkM0JLWWdaZmhDZGxJcllHY2hxdVo3?=
 =?utf-8?B?R0kwV2lsK2V1TjdpWkU1dVlpZWRPcWNWNFZkejcvbDh4Tk1jcEtFY1pNazlX?=
 =?utf-8?B?bVBzMmJOTC8wU1VMMGx1bDJ1bnhUdFRnRTF0V2pKTE1ZWVVzY1BDMVpCaEtX?=
 =?utf-8?B?YjV4bXhoQlp0dDk1dEJieE5DcGtiSWFlWTRLejRJY3N0aUFuNGdwQXd6VHd0?=
 =?utf-8?B?UXF5WUJXS09HcngxbzBKNE5UZm1YUUwwYlZ2NDZvV2d0eVF0RmdoYmxNZ1R0?=
 =?utf-8?B?VmY1SkJmb3U2anZWa0pPZXNXTGtPbFhWcU5xV0hTK0lhUXdUc2FXalRoMnVU?=
 =?utf-8?B?U3BKQnM3NDZsbnFzemdBckRQQ3FCM2dMaytTRTcvQkdZbU5CSGZBcUtZdDkr?=
 =?utf-8?B?U056cUlzUzR6S3Irb2hUVEVDZkl4eTBEc1lNYVRGNm5jNnNaRUVHVy9Ydmhs?=
 =?utf-8?B?bEU3Q1pNVml1UXhwdGxNbE41b0JsNmM2M2dQKzQ4eVNjeGpXZkJJaGVOdjNI?=
 =?utf-8?B?VENGZFdMb1JyR2krYnJnU2tWRFB0em85WmttQ0hkdHpPWmljUG1NdllJdDVy?=
 =?utf-8?B?SStTN0h6czEvWmpRblNhVSs1Q3dVam1vNDJ2S2dDd1F6VFhyUjhoeGdDbzFT?=
 =?utf-8?B?blNPYUh2VnRvOFpVT3g3RlIrV1hIaHdzaXFTRzR5R2o3T1hFUlAyeUlrSERJ?=
 =?utf-8?B?aFh1WjliY2NQaCswc3BYSXBuMmdnSFNoS0xvQkpiN1kzOHdqbXNHMFBvd0RW?=
 =?utf-8?B?ZGhIcGFFaUpNcTg5eUhQOWNYWkh3ajZzL1NySGVBajdWdVZFOHJORVpVZG85?=
 =?utf-8?B?UnN0VSs1SkZMeitFOGtNOHJmMHNUc09iS2k0WGtHcWpaNGhLeEN0RkM5bSty?=
 =?utf-8?B?MVRGNWcvZ2ZVMTM3NWpOcXdVOTN4V0txR0doUDJhakRRRVF3UTlNU2s4dkZr?=
 =?utf-8?B?ZGRDWEFjTlBZL1BnOHd3NlJ5ZW0rbmlENFFDSEZsbTlvUTZ1bWhHVTQzczJ6?=
 =?utf-8?B?VHAxbTlGTExiZDJOcEk1MzRlUFlYWXdaSGZOSEZveWZobE5ZMm9MRkdzVk1l?=
 =?utf-8?B?Vm1tN2NYVXpWZ1pTWnJpVG82bWtvVjk2R3FBeURzSUlUVU9pdi9UYmtZN0ww?=
 =?utf-8?B?amFPWWhWL21xMXNiNUp5RFRCUzBsUXVHck4xcHN5M3B5UU5SRi9yS09YSUNL?=
 =?utf-8?B?NFNNRkpRT29acEJvL2w2MjJFSFJpOTYwRHpLQ0cvd3U5VDB2NDZFOEU0cnJT?=
 =?utf-8?B?ek5DZXllNkprTXVidVVJY09hNjNlbmVMRmhCejZDalZRRXRGcXRuSllTWlgy?=
 =?utf-8?B?REtzNitwMEhkNHpwVHhhYktvOVRoMW9nM3dWeHcvdmwvV0FKQWcvYlZkTE5z?=
 =?utf-8?B?SDhiZGIzUUl6OTZ5WmhzN1JPajNMWnZSSDNzVldVeSt2V2FhLzhOZVJQd3dP?=
 =?utf-8?B?YzY0L0hwM2dXR0dLaC9MaEltb2VTcGlrYzZ3bTA0Smw0UmNtYVo3TXlyUHhV?=
 =?utf-8?B?V2Q0cm1rb2QvcTFhKzVTSGMydFhsUEg4ODMrSDAyUXJvTzJNR2s1cUhHM1gw?=
 =?utf-8?B?eGUremNBQlo4Zzh1WnVtTjBNZ3NYbE84NHk1bDFZd0FmbW9qcy9EL0c1MDd2?=
 =?utf-8?B?T0xZUmR1RXpKUTI4dHlNTG9rL25TS2lSRVdCZEsrLzFzSnFxYkRFTFhSemkr?=
 =?utf-8?B?NldtWVZvZFlPTlQxbTdNZVNFR0lHRUpraTVvZHA1d0ZsR1dRUm9IRzNXYTBj?=
 =?utf-8?B?aXJUTkdJcVRyZmxCdVBxTG83dXgxbHBQTGNtYzhLSytadHdjQTB5Y2o1V3lv?=
 =?utf-8?B?TTNNaEFCNWVuNmtkK3I2R1Z5UnlGTnlQSnJPR1V4ZTB3RXIycEt2Yy9ZZjRI?=
 =?utf-8?B?amc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 14ebbd00-9fb1-4466-4d26-08daa8fc92a6
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2022 07:13:17.3193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 zX0dRa0QVRGDWC5jpUHe+E+5Kg7/N9xxOjnRxLjd9YggXqKAE6ow70DDAgjW2zIDR+8ycHj2M8wG0t+CXRJbF/2Al4KsRiKI6aaa3Yd2RNs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6337
X-Proofpoint-GUID: bpc1Y1kPURs2eW8P3KWBYqtnAWq1OpXB
X-Proofpoint-ORIG-GUID: 6sZE_XCv4qIZRTkJIYofm_xpLkdH_44z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-07_04,2022-10-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210080044
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Oct 2022 07:13:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171532

--------------soJWb187puD6WJ3GHv1YQST0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 29870bR9007442

On 9/30/22 17:50, Ross Burton wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Yeah, this is a Docker issue. Fix your docker.
>
> Ross

Hi,

I know this is an docker issue, but this will block yocto build in old=20
docker. I noticed we already

have an local patch for glibc to fix similar issue. So, maybe this patch=20
is also need.

https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/gli=
bc/glibc/0023-fix-create-thread-failed-in-unprivileged-process-BZ-.patch=20
<https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/gl=
ibc/glibc/0023-fix-create-thread-failed-in-unprivileged-process-BZ-.patch=
>

BRs

Changqing

>
>> On 30 Sep 2022, at 09:48, Changqing Li via lists.openembedded.org<chan=
gqing.li=3Dwindriver.com@lists.openembedded.org>  wrote:
>>
>> From: Changqing Li<changqing.li@windriver.com>
>>
>> After commit [1], start a unprivileged container (docker run without -=
-privileged),
>> close file will fail.
>>
>> This is actually an docker issue, see [2]. But this issue will
>> block yocto build in docker with glibc2.35+. so add this local patch.
>>
>> [1]https://gitlab.gnome.org/GNOME/glib/-/commit/ce04a124040be091407e07=
0280d86ca810bacb8c
>> [2]https://github.com/moby/moby/issues/43595
>>
>> Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ---
>> ...fails-unexpectedly-in-unprivileged-p.patch | 46 +++++++++++++++++++
>> meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |  1 +
>> 2 files changed, 47 insertions(+)
>> create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-fix-close_=
range-fails-unexpectedly-in-unprivileged-p.patch
>>
>> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-fix-close_range-=
fails-unexpectedly-in-unprivileged-p.patch b/meta/recipes-core/glib-2.0/g=
lib-2.0/0001-fix-close_range-fails-unexpectedly-in-unprivileged-p.patch
>> new file mode 100644
>> index 0000000000..213ee7b11f
>> --- /dev/null
>> +++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-fix-close_range-fails-u=
nexpectedly-in-unprivileged-p.patch
>> @@ -0,0 +1,46 @@
>> +From 0fb283b3b1e3b4958b985804cbc40b7bff8b0e65 Mon Sep 17 00:00:00 200=
1
>> +From: Changqing Li<changqing.li@windriver.com>
>> +Date: Fri, 30 Sep 2022 08:29:41 +0000
>> +Subject: [PATCH] fix close_range fails unexpectedly in unprivileged p=
rocess
>> +
>> +After change [1], start a unprivileged container (docker run without =
--privileged),
>> +close file may fail.
>> +
>> +This is actually an docker issue, see [2]. But this issue will
>> +block yocto build in docker with glibc2.35+. so add this local patch.
>> +
>> +[1]https://gitlab.gnome.org/GNOME/glib/-/commit/ce04a124040be091407e0=
70280d86ca810bacb8c
>> +[2]https://github.com/moby/moby/issues/43595
>> +
>> +Upstream-Status: Inappropriate [Rejected by upstream]
>> +
>> +Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> +---
>> + glib/gspawn.c | 4 ++--
>> + 1 file changed, 2 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/glib/gspawn.c b/glib/gspawn.c
>> +index 0a2cbe5..83553a1 100644
>> +--- a/glib/gspawn.c
>> ++++ b/glib/gspawn.c
>> +@@ -1544,7 +1544,7 @@ safe_fdwalk_set_cloexec (int lowfd)
>> +    * fall back to safe_fdwalk(). Handle EINVAL in case `CLOSE_RANGE_=
CLOEXEC`
>> +    * is not supported. */
>> +   int ret =3D close_range (lowfd, G_MAXUINT, CLOSE_RANGE_CLOEXEC);
>> +-  if (ret =3D=3D 0 || !(errno =3D=3D ENOSYS || errno =3D=3D EINVAL))
>> ++  if (ret =3D=3D 0 || !(errno =3D=3D ENOSYS || errno =3D=3D EINVAL |=
| errno =3D=3D EPERM))
>> +     return ret;
>> + #endif  /* HAVE_CLOSE_RANGE */
>> +   return safe_fdwalk (set_cloexec, GINT_TO_POINTER (lowfd));
>> +@@ -1597,7 +1597,7 @@ safe_closefrom (int lowfd)
>> +    * Handle ENOSYS in case it=E2=80=99s supported in libc but not th=
e kernel; if so,
>> +    * fall back to safe_fdwalk(). */
>> +   int ret =3D close_range (lowfd, G_MAXUINT, 0);
>> +-  if (ret =3D=3D 0 || errno !=3D ENOSYS)
>> ++  if (ret =3D=3D 0 || !(errno =3D=3D ENOSYS || errno =3D=3D EPERM))
>> +     return ret;
>> + #endif  /* HAVE_CLOSE_RANGE */
>> +   return safe_fdwalk (close_func, GINT_TO_POINTER (lowfd));
>> +--
>> +2.34.1
>> +
>> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb b/meta/reci=
pes-core/glib-2.0/glib-2.0_2.72.3.bb
>> index dd1ea508d2..bbaacc64a4 100644
>> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
>> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
>> @@ -16,6 +16,7 @@ SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-$=
{PV}.tar.xz \
>>             file://0001-Do-not-write-bindir-into-pkg-config-files.patc=
h  \
>>             file://0001-meson-Run-atomics-test-on-clang-as-well.patch =
 \
>>             file://0001-gio-tests-resources.c-comment-out-a-build-host=
-only-.patch  \
>> +file://0001-fix-close_range-fails-unexpectedly-in-unprivileged-p.patc=
h  \
>>             "
>> SRC_URI:append:class-native =3D" file://relocate-modules.patch"
>>
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#171215):https://lists.openembedded.org/g/openembed=
ded-core/message/171215
>> Mute This Topic:https://lists.openembedded.org/mt/94012543/6875888
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  =
[ross.burton@arm.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
--------------soJWb187puD6WJ3GHv1YQST0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 29870bR9007442

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p>
</p>
    <div class=3D"moz-cite-prefix">On 9/30/22 17:50, Ross Burton wrote:<b=
r>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:16B6F015-6AEB-4374-B680-21AA22A=
1131C@arm.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">[Please note: This e-mail is=
 from an EXTERNAL e-mail address]

Yeah, this is a Docker issue. Fix your docker.

Ross</pre>
    </blockquote>
    <p>Hi, </p>
    <p>I know this is an docker issue, but this will block yocto build in=
 old docker. I noticed we already</p>
    <p>have an local patch for glibc to fix similar issue. So, maybe this=
 patch is also need.
</p>
    <p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; marg=
in-right:0px; -qt-block-indent:0; text-indent:0px;"><a href=3D"https://gi=
t.openembedded.org/openembedded-core/tree/meta/recipes-core/glibc/glibc/0=
023-fix-create-thread-failed-in-unprivileged-process-BZ-.patch"><span sty=
le=3D" font-family:'Sans Serif'; font-size:14px; text-decoration: underli=
ne; color:#0e72ed; background-color:transparent;">https://git.openembedde=
d.org/openembedded-core/tree/meta/recipes-core/glibc/glibc/0023-fix-creat=
e-thread-failed-in-unprivileged-process-BZ-.patch</span></a></p>
    <p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; marg=
in-right:0px; -qt-block-indent:0; text-indent:0px;">
</p>
    <p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; marg=
in-right:0px; -qt-block-indent:0; text-indent:0px;">BRs</p>
    <p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; marg=
in-right:0px; -qt-block-indent:0; text-indent:0px;">Changqing
</p>
    <p><style type=3D"text/css">p, li { white-space: pre-wrap; }</style><=
/p>
    <blockquote type=3D"cite" cite=3D"mid:16B6F015-6AEB-4374-B680-21AA22A=
1131C@arm.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">On 30 Sep 2022, at 09:48, =
Changqing Li via lists.openembedded.org <a class=3D"moz-txt-link-rfc2396E=
" href=3D"mailto:changqing.li=3Dwindriver.com@lists.openembedded.org">&lt=
;changqing.li=3Dwindriver.com@lists.openembedded.org&gt;</a> wrote:

From: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:chan=
gqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

After commit [1], start a unprivileged container (docker run without --pr=
ivileged),
close file will fail.

This is actually an docker issue, see [2]. But this issue will
block yocto build in docker with glibc2.35+. so add this local patch.

[1] <a class=3D"moz-txt-link-freetext" href=3D"https://gitlab.gnome.org/G=
NOME/glib/-/commit/ce04a124040be091407e070280d86ca810bacb8c">https://gitl=
ab.gnome.org/GNOME/glib/-/commit/ce04a124040be091407e070280d86ca810bacb8c=
</a>
[2] <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/moby/mo=
by/issues/43595">https://github.com/moby/moby/issues/43595</a>

Signed-off-by: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
...fails-unexpectedly-in-unprivileged-p.patch | 46 +++++++++++++++++++
meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |  1 +
2 files changed, 47 insertions(+)
create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-fix-close_ran=
ge-fails-unexpectedly-in-unprivileged-p.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-fix-close_range-fai=
ls-unexpectedly-in-unprivileged-p.patch b/meta/recipes-core/glib-2.0/glib=
-2.0/0001-fix-close_range-fails-unexpectedly-in-unprivileged-p.patch
new file mode 100644
index 0000000000..213ee7b11f
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-fix-close_range-fails-unex=
pectedly-in-unprivileged-p.patch
@@ -0,0 +1,46 @@
+From 0fb283b3b1e3b4958b985804cbc40b7bff8b0e65 Mon Sep 17 00:00:00 2001
+From: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:cha=
ngqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
+Date: Fri, 30 Sep 2022 08:29:41 +0000
+Subject: [PATCH] fix close_range fails unexpectedly in unprivileged proc=
ess
+
+After change [1], start a unprivileged container (docker run without --p=
rivileged),
+close file may fail.
+
+This is actually an docker issue, see [2]. But this issue will
+block yocto build in docker with glibc2.35+. so add this local patch.
+
+[1] <a class=3D"moz-txt-link-freetext" href=3D"https://gitlab.gnome.org/=
GNOME/glib/-/commit/ce04a124040be091407e070280d86ca810bacb8c">https://git=
lab.gnome.org/GNOME/glib/-/commit/ce04a124040be091407e070280d86ca810bacb8=
c</a>
+[2] <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/moby/m=
oby/issues/43595">https://github.com/moby/moby/issues/43595</a>
+
+Upstream-Status: Inappropriate [Rejected by upstream]
+
+Signed-off-by: Changqing Li <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
+---
+ glib/gspawn.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/glib/gspawn.c b/glib/gspawn.c
+index 0a2cbe5..83553a1 100644
+--- a/glib/gspawn.c
++++ b/glib/gspawn.c
+@@ -1544,7 +1544,7 @@ safe_fdwalk_set_cloexec (int lowfd)
+    * fall back to safe_fdwalk(). Handle EINVAL in case `CLOSE_RANGE_CLO=
EXEC`
+    * is not supported. */
+   int ret =3D close_range (lowfd, G_MAXUINT, CLOSE_RANGE_CLOEXEC);
+-  if (ret =3D=3D 0 || !(errno =3D=3D ENOSYS || errno =3D=3D EINVAL))
++  if (ret =3D=3D 0 || !(errno =3D=3D ENOSYS || errno =3D=3D EINVAL || e=
rrno =3D=3D EPERM))
+     return ret;
+ #endif  /* HAVE_CLOSE_RANGE */
+   return safe_fdwalk (set_cloexec, GINT_TO_POINTER (lowfd));
+@@ -1597,7 +1597,7 @@ safe_closefrom (int lowfd)
+    * Handle ENOSYS in case it=E2=80=99s supported in libc but not the k=
ernel; if so,
+    * fall back to safe_fdwalk(). */
+   int ret =3D close_range (lowfd, G_MAXUINT, 0);
+-  if (ret =3D=3D 0 || errno !=3D ENOSYS)
++  if (ret =3D=3D 0 || !(errno =3D=3D ENOSYS || errno =3D=3D EPERM))
+     return ret;
+ #endif  /* HAVE_CLOSE_RANGE */
+   return safe_fdwalk (close_func, GINT_TO_POINTER (lowfd));
+--
+2.34.1
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb b/meta/recipes=
-core/glib-2.0/glib-2.0_2.72.3.bb
index dd1ea508d2..bbaacc64a4 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
@@ -16,6 +16,7 @@ SRC_URI =3D &quot;${GNOME_MIRROR}/glib/${SHRT_VER}/glib=
-${PV}.tar.xz \
           <a class=3D"moz-txt-link-freetext" href=3D"file://0001-Do-not-=
write-bindir-into-pkg-config-files.patch">file://0001-Do-not-write-bindir=
-into-pkg-config-files.patch</a> \
           <a class=3D"moz-txt-link-freetext" href=3D"file://0001-meson-R=
un-atomics-test-on-clang-as-well.patch">file://0001-meson-Run-atomics-tes=
t-on-clang-as-well.patch</a> \
           <a class=3D"moz-txt-link-freetext" href=3D"file://0001-gio-tes=
ts-resources.c-comment-out-a-build-host-only-.patch">file://0001-gio-test=
s-resources.c-comment-out-a-build-host-only-.patch</a> \
+           <a class=3D"moz-txt-link-freetext" href=3D"file://0001-fix-cl=
ose_range-fails-unexpectedly-in-unprivileged-p.patch">file://0001-fix-clo=
se_range-fails-unexpectedly-in-unprivileged-p.patch</a> \
           &quot;
SRC_URI:append:class-native =3D <a class=3D"moz-txt-link-rfc2396E" href=3D=
"file://relocate-modules.patch">&quot; file://relocate-modules.patch&quot=
;</a>

--
2.34.1


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#171215): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/171215">https:/=
/lists.openembedded.org/g/openembedded-core/message/171215</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/94012543/6875888">https://lists.openembedded.org/mt/=
94012543/6875888</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:ross.burton@arm.com">ross.burton@arm.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
</pre>
    </blockquote>
  </body>
</html>

--------------soJWb187puD6WJ3GHv1YQST0--

