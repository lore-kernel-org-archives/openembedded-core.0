Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8729FC83F01
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 04:57:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7160.1693371445617379838
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Aug 2023 21:57:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ALiUxi4X;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=760630e6d4=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37U4DiCY031277
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Aug 2023 21:57:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=SgZAqncYhRv6aHB5yOdf3GX3I6gZJL9q46BgvTL1p48=; b=
	ALiUxi4X5OnM1cs2hs4dwexp8ZTK3D/itYmPtm77GKGSARxvDsE0IEXFjpva5Z4N
	0O8LxgycuJMUv2l/bojro9uybTZ10hIyRNWgqg5Ic4ziAZ/X78PpjLFyKuwUK+7/
	6b4RSi3zKDWuOUKduYmGiUStDWfZ93+9n67EZnvpEFeLl1pV8w/kLu9ScUVPRox/
	CgaoFtzhL6DbEg7Wlo3TXFumsFeEkrCHQDJdKERcahRNEo/tCKfA68AC8vEZVcGI
	A/0JJW60GAwpL+9f+Kzd1NNyaTnJiciKGrrWF6xSpVTe13k1uBWBmKugLe7+8DLS
	6RWSWRCf/SR1kMT8TQAyXQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sqcp1b819-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Aug 2023 21:57:25 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 37U4vOQN018383;
	Tue, 29 Aug 2023 21:57:24 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sqcp1b818-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Aug 2023 21:57:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cuxs3r/mg2oKHWIurYHQ8QIcr1QZ6cdlBgvInYUU4e51htNOJVByajneVxtwpWagmELuAKgrjLG7l49LHI9ZPit2JlrivMPi9FUgDmni3jDp6OvlmAraf720TfwTlYpGODV1XGxETMrrXERSmsJYfUFE4I4FYFf/t4fcPWwPNVUgPkT3U2TZvNjfWzTSjhHqFDhT0+BUwgYvJZylQOH+TZQHJgf+d7m8dLnOuKXR5UeLAcUN4kFbygLL/6g+VMbLq0HFdTs10c15KGciKxAYApCxBs9Y7+FJ1zB8uurkd0mmw6K6ttbJBLtsHZnNugRgtEKmjY8s4R7oUYPrBkf3rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SgZAqncYhRv6aHB5yOdf3GX3I6gZJL9q46BgvTL1p48=;
 b=k1i6JCHIchqx+w/a9t3YarFKrq2rC0B28SGKN7P/zMFRd0UVpDSW91eZcwMUkKqkkHhec6tPeIP79d0pWPjqXmKKu/9tz0dAHz0epcTLg8SRVb74lvtlud/pnbeRt6512A3GGOodyrH8lO5vn1aI7R4YjKxRhshuN3FP2pUG5CdP22JJBuBbQ/VGzvYF4RwJnP6whAHLL/uU+frX7uTkrH21mN50uPebe35T0MpKDppnSBfvXsyJ1zgPK0kFBjCTr8nPiuxqz/L2ed5gidT1Mj4T0zPGTtbq+OezRfH01zXiG4mn0Hw8KJBOSRqF+uah9taOl3KLtaFdnRTt/7NyBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CH3PR11MB8592.namprd11.prod.outlook.com (2603:10b6:610:1b1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Wed, 30 Aug
 2023 04:49:31 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::da88:58a3:bc6b:2e3d]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::da88:58a3:bc6b:2e3d%7]) with mapi id 15.20.6699.035; Wed, 30 Aug 2023
 04:49:31 +0000
Message-ID: <89ec3c86-c60b-1553-103c-927eeedf2ff7@windriver.com>
Date: Wed, 30 Aug 2023 12:49:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core] [PATCH 3/3] stress-ng: upgrade 0.15.08 -> 0.16.04
To: Anuj Mittal <anuj.mittal@intel.com>,
        openembedded-core@lists.openembedded.org
References: <20230817073834.55471-1-anuj.mittal@intel.com>
 <20230817073834.55471-3-anuj.mittal@intel.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <20230817073834.55471-3-anuj.mittal@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:54::13) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CH3PR11MB8592:EE_
X-MS-Office365-Filtering-Correlation-Id: 76019018-72f1-4e0c-a880-08dba914800b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dc8oB7Bu9yOrvHFwvy2TI2Bf+wvGb9GXqFk8xaz18xIj0+ivgImq6BtyuUeFLFj4mxZxZw5KgY/HnCFc6aifwr22rH0FaMvoz8cCUiHBWaCE4sH6nV0X3Mgs8gRbCmVBMwN62VlFB03KTxjMhNAiFZqM3RG0qoAXks78iI2FfqAUuXp4ppNw084bsTk5Jwm4DDufLmZO5Cw1GZ3hJtpqS9NCcKzPn4Rs5GSyCToxT/lBMJKQQmZxCIX7ndiJGzMD6JVC7hunSZxiG65BPS2FlI8h6me9SNIfloa1mJCEYQffRZhHXcIl2RMFH3P7eSV9hhUdAKhUgwCrzlVo/D/bMNmvcQ/cHjzGzx6A9FYhZxrey0xFvpr/FBSGdsbgLPOKlSaeAFR1T9j06IKJpuXPKA1L1n3bClLX8FSnFgjp0Dnn8/Nu0oh6yocMNyv+lQ0aQr7m77QsGzJG96CfbWlhG+sgfCAmDwmZ+M2bW/NxcRXVWRZsVqAAQCXSLNWZcBcuL2Q8vUSvKm5AHa2m7ocuPEi+YMNQMAvYnsyZTFW47AqtReKx7iFb7XQB1TfQfn3CjtcPnspGHzviUpW01NkbTt0FKpBmPp/KS7v+1DJ7EVQm4BlaAB2dODmnrggUeoiN9dSBzLAB6K1DjMy1UF9V7RRTEcDj0N68zqynI5bF4Oo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(136003)(39850400004)(396003)(376002)(186009)(451199024)(1800799009)(66899024)(31696002)(6666004)(6512007)(53546011)(6506007)(2616005)(6486002)(66556008)(2906002)(5660300002)(8936002)(86362001)(36756003)(66946007)(316002)(41300700001)(66476007)(38100700002)(8676002)(83380400001)(478600001)(966005)(26005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WEZBSTJybmNXSy9CbkpRY2FHWUJpWTQ5V0ZzKzdCRVdHTmtvbFB6YnlwSm1y?=
 =?utf-8?B?U3E2SGExRXY3NTU0MWcyRFV3RHdCbnB0NzZ3Z29KUjgwTGVya29OdzZyMElU?=
 =?utf-8?B?K0VWWURpbEVkSzBuYkR2ZUpVNU1mNWR2Q09lWGQ5RldNR1FlZEMvRlhieXky?=
 =?utf-8?B?dXNNaEg3ZmU5OERscUpwRC8yd2E4SnMwaS9ycXlOVyt1ekNGVkxVdGhvTWMy?=
 =?utf-8?B?MjNQK1JrVDJGaFBMZXJuRndrS2pVaGR0b0R6QmtsWTlIZ2YwaFFxRXU5cEtY?=
 =?utf-8?B?MEFPanQ3UHBDUGl4dmZqRlRwRmVZZEZ3OWlFTi9ObHdUakZFSU1qdVFoWnls?=
 =?utf-8?B?TmZnL0l2bzF0d3BHY3dsVk5kbjJTSUdvSFdMai9jVW5VbjAzbEc5elF1bEUr?=
 =?utf-8?B?Mmc3VDhia3QzQ1pnbk45MlpPbFd0c2tSZStIeDE4ZjhYdUlIZllkZjk1ME5U?=
 =?utf-8?B?OFZiMmJuRGJQRnpHYzkzbWh1UENuVUxrcU1MWi8wOFBRcTBUbHY1VGQ2M1Zu?=
 =?utf-8?B?NldYVVd6YnpUdnBnNE1ZdjV2bUZWKzZ2bVZMZHY2T3ROL1RrWE9CVnNJTExK?=
 =?utf-8?B?WC9DSDlOWkM0ZDJSbUU0YnBMbGZUWEZ3VFp3Nlkra0xLVlB4WFkvVjJhVzl6?=
 =?utf-8?B?bnN0TS9tNzBWYkdEQUh4cnhkT1c4OWhydEV2Zk9tRUhOS3o1S2liSnpMLzhF?=
 =?utf-8?B?RmR6VEovVXBMTGpNRDRFL25VSjFSN2JCa2NBYTlkby8rak9kaWp0QUMrbXpi?=
 =?utf-8?B?U21JVW56QUZnSE0zMm5haXZ6OE1yZnNMTDFNbWpadE1iUVBBK2pkUjN5YmEr?=
 =?utf-8?B?ZHlFbWtyTmo2VFRrZDNwd3hKdXE0Wis5NEo5ckdEUUJrd0EvYmxVS01RZTVC?=
 =?utf-8?B?RGhLUEdsS1VOSW5udlY1eHBDQVFBOEVDUXRpSVpoazZoWHYrb3RLZS92cFNa?=
 =?utf-8?B?b3hhQzgxcFc5eDBzUGFaM2N6ZU8zNzZ2cnExekZQYVNvMTQwcSt0emw1dmVn?=
 =?utf-8?B?alppd2RiSGpQQTBTdnpGQTN0NVVhaG5HaUcrek1YNVZ3bEsrMmxWL1MwOE5C?=
 =?utf-8?B?SHpTQ1ZoYi96YVRYZ29zU0hqVlpxaWc0QTlhNk0veld5a1JLYk9VdTYyQVVj?=
 =?utf-8?B?TmdzSDByQU9LNWVVY0JDb0hXQXRBRU1IenlKanl6Mlh4amhLcC9wWUNhVExJ?=
 =?utf-8?B?SEZUQWRmd1ZYaXhoOU5IQUVldllVbmQyV0YrdmlBb1dWLzhhbW4rNlk1MFFo?=
 =?utf-8?B?UHBiMlJxazYvaWsrc0ZjL3greWJkOUlKSTRhVUlIOGU2Zm5jZFNVM29EQ05Z?=
 =?utf-8?B?ajFuSnRPckNZb2hHYWtSMm9ZK0ZhaWJ4YU5kRVNvOFRMUTFZelF5T3BSMFpY?=
 =?utf-8?B?Qm4rSjBVNUIySlBFTlZwUnU1dVJxUHZlcjd4R2o3c2FoNEgrVENUYTR0Um00?=
 =?utf-8?B?bWtiMVNvVVJZSWxwWklWcnczSG1GdlhzUnh6YXFyN1ZFTEF3blRXK2MrSmF6?=
 =?utf-8?B?bmlGL2hMNldrQVQ2K3B0dTVsdmJucVhHc01lWG9PeC9Eb05hQWx4QS9VNFhE?=
 =?utf-8?B?Qi9PY1ZkSkRVWkJJVEtwdGNXZUNvMFJJazE4NlhZYlJHRVdVVE1rTG9ZaDJa?=
 =?utf-8?B?MnVpSi9obzJlTXlOMTV6dVhiMDNUbU16WGl0ZEl2M2p0MFRNWWZxd1JvM0JM?=
 =?utf-8?B?U1p6ZVNoc1BYak80WWgvQnlSRXA3M0JweWxCYm5ISXFGUE1qSmtYM1JUeGN6?=
 =?utf-8?B?V2FEb0pKYjF3Y3h0ZWNzZS9wbktFWHlodXg5N1VmMlFpNDdVVmM0NEVTNUJn?=
 =?utf-8?B?VGVFOGgyVGd0azJZOG5SbVpXMnZRaU84YVMxOFlyWkI3VmdJc1RDbkQvemFj?=
 =?utf-8?B?eUxWaTA0Y01maGMreDUreGZSVVFrTWUyQU9aVkx4RW01NTdVL1VhNDR6am8r?=
 =?utf-8?B?MGtYVlE1d055SnQ3U2I3U2RqTjNTUkhudXRYclRLdkk3V2MxcEJuR0dhN1Ew?=
 =?utf-8?B?QW4xREhFMVl2VUs4RFFsbW5uRzlHbStDZDVpS2tYS1RkOUMxOTcyVWhzMkNj?=
 =?utf-8?B?b3ZMV3hJdkxYYjI3NGludVNkQ252cGJCb2tVbnVoakhOb21XdmNRa29OMHlk?=
 =?utf-8?Q?PTzyjBoK9yziXK9s8I9Iuh/bp?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76019018-72f1-4e0c-a880-08dba914800b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 04:49:31.8072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3NgS1aNPGXkyH5ugIXnUARce6Z/nCHH8RT1BpUqq+1C0snr8EFW5J3VGDdMw7qjFVt6LTREwC7SsTQlUbleq0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8592
X-Proofpoint-ORIG-GUID: VjFCfAabkJpoLukrq1PaFERBnwqRBMCb
X-Proofpoint-GUID: jjYbsHTeao4EGNLgmhEV-RM8q5VGSqBF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_16,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 mlxlogscore=781 phishscore=0 clxscore=1015
 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2308300045
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 04:57:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186868

This upgrade introduces a build failure when DEBUG_BUILD is enabled.
I've sent out a patch to disable it in this recipe as a workaround.
I've also filed a new issue for stress-ng upstream: 
https://github.com/ColinIanKing/stress-ng/issues/315

Regards,
Qi

On 8/17/23 15:38, Anuj Mittal wrote:
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>   .../stress-ng/{stress-ng_0.15.08.bb => stress-ng_0.16.04.bb}    | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta/recipes-extended/stress-ng/{stress-ng_0.15.08.bb => stress-ng_0.16.04.bb} (94%)
>
> diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.15.08.bb b/meta/recipes-extended/stress-ng/stress-ng_0.16.04.bb
> similarity index 94%
> rename from meta/recipes-extended/stress-ng/stress-ng_0.15.08.bb
> rename to meta/recipes-extended/stress-ng/stress-ng_0.16.04.bb
> index 9952c4ef8a5..6e5665cc3b9 100644
> --- a/meta/recipes-extended/stress-ng/stress-ng_0.15.08.bb
> +++ b/meta/recipes-extended/stress-ng/stress-ng_0.16.04.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>   
>   SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master \
>              "
> -SRCREV = "4fc205238518cdaf80cf18e8bd411708f7ba3856"
> +SRCREV = "95777d7cf32de9fc88c452a968ae2ae23ed269c2"
>   S = "${WORKDIR}/git"
>   
>   DEPENDS = "coreutils-native libbsd"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186292): https://lists.openembedded.org/g/openembedded-core/message/186292
> Mute This Topic: https://lists.openembedded.org/mt/100796322/7304865
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


