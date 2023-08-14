Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AB5FEB64DD
	for <webhook@archiver.kernel.org>; Mon, 14 Aug 2023 09:47:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.104115.1692006429045335833
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Aug 2023 02:47:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bY7FAtFp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75906d3704=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37E9PeDR005417
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Aug 2023 02:47:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=FYE+DwgrwT5nMLErt0iU2gf1Kqi1vwrJ73nOvbz5QLk=; b=
	bY7FAtFpcl/oPq6yS7gWsp8nqQ88IjiKI8s5cMVwUK+Qo4zYYj0IcIBv8sO03ABK
	hjyW8oh8TIXFv0OjJxORsVelYfV0QrRJ/InwACy1kMRlHD2Y8rpSTzpK1eFXHODs
	oe4oa1Pztwp5awcfR/3MSOE7qJ+/x1+ybpEYwM1KTRaN1tQQ4n65bMpNs8JExvlN
	Pn0OGp1YpPgVBCjF7GhsfQl6+GqS6HCd3t+uGJ4RsIn7c2GdIpxPGDbwyUHdMARy
	nQ+EBn49GxlUARLw7M2AjAx9DlrSd2BffgkFctYf8CyNV/6yMgissu98YrI8O54e
	QlAFfwCcx3RIB7H2wF62vg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3se5by9jhw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Aug 2023 02:47:08 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 37E9l8wu017074;
	Mon, 14 Aug 2023 02:47:08 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3se5by9jhv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Aug 2023 02:47:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TrTdx1W83+6fIpvNFdX3c4GRLmfgfYfPArzcsIXQLX9IjDEfzbtHNUZJDBT1y/L61lOyP5X5Cyr86VfotBy9aKNkYF1gqGFPhwEMv0TSx+OiSlBAADyXOgJG+STZT6z9WufI7LX+/WCTzth5HWJ5XF0n9CK1Eqpkgd7B33WZQcXGWOPUp4c1g7jX9MxtD9d6DZIIw1G6zceYhmaGb8iUa76NvWo1gVcUxWUAav9GlIcCBofTCxhxsjQWwJig5jwaEaGn9kGEDlH0qMudC5GmKdXGadSiO2YUFmjewuXzBtJMClAsvKbw4T/M669uO2sQlqmOqewT5j4WZOoXxtsolQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FYE+DwgrwT5nMLErt0iU2gf1Kqi1vwrJ73nOvbz5QLk=;
 b=FdCU/M5Q6l1wcpOEDdPQ6Zxqxd2JNhrDCynQBzE0iOQlMSt1CSbrw/LO1dXSkni7WnMoj6dgSI23DkUqpljhU/REWMRhbkklzZMOMi/ZnrvuHW2w/gHF4u33WylgkJGCMvEXGC0B8aA0A0Tgu4g+l9+QOKmmjlN/PpZi1IPyxQc1Qk8A02pfUNKO7Yc9Mm6xgv+DdVUDreQmTpBD95fiiOq8DJOrFrmQbXH5WfYdt5QkUPGSAsbuJN1DEmtLSeZgvaNh4xO/nQKbxqvkWU/3azaMOZKKAoXxuGXFhE8J75wPD1aCyQjJEC6O//vKd/ZWodzLC9Dq3LEB0BrVmhKfYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by SJ2PR11MB8321.namprd11.prod.outlook.com (2603:10b6:a03:546::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.23; Mon, 14 Aug
 2023 09:47:04 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::9b45:9846:7a7d:6b9f]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::9b45:9846:7a7d:6b9f%4]) with mapi id 15.20.6678.025; Mon, 14 Aug 2023
 09:47:04 +0000
Message-ID: <dbd795c0-048f-5dbc-cc00-165681304cab@windriver.com>
Date: Mon, 14 Aug 2023 17:46:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH v4] qemu: Add qemu-common package
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        "Yu, Mingli" <mingli.yu@eng.windriver.com>,
        openembedded-core@lists.openembedded.org,
        alexandre.belloni@bootlin.com
References: <177296216FD9611D.22245@lists.openembedded.org>
 <ad4d8e98-9163-700d-32b8-5d67b6b127a2@windriver.com>
 <01211f8f8eafbda39b341638bcbbab9ab4edeba0.camel@linuxfoundation.org>
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <01211f8f8eafbda39b341638bcbbab9ab4edeba0.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:4:195::16) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|SJ2PR11MB8321:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d87c0fe-4a36-46dd-40db-08db9cab6a34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HI/su2Nqs69ASvkfC0xtHUWLtu6Drdocz0GF7Ku0Vb2fYsjwnm7WWts6yjAECOZliIkPAwZLf5ItagmMiG5vS/HFYgE4rdb1o/TXmI66g6f7McCGFfaicSBSVzhF+08tLh0i4o8KzZeVAWa9BnnlWDIz1LMx2q5yzgHPvbXTMvmem9tWl77c/g9F4W1mFjy4CBB1SOLbbgBd+70XqD9bd50nf2YCCT8keoZqasFS65MQEcAtUK8+HXXecvWeM1nBk9k3FeLCkCKWG1hcfg+KnYlfQr/tT3AfmBM5HixC/HkyLcWReOdAf6RhfCjQ4OIb88O88uFWzTYrvR48d9YJ7HsEf/uyn2sXkbJWum9+C13kBmj13L2dhn3EqDn/Q5OMby/RuBvc9WLMpxiaa33s4qsQh/OVosUgVFgGy3H5bwdO+bx8Qo+rTvYbFldKHCYcuzKK4+fnGtrIUyEcXe/wbzoQgLxpaMnzX7dXZoTVCfo7pIhz9g7ME8K8xSXwCGVe74M/Mb6/4uS7aHScAYYKmlDPREYG2a9v1hsyX/GaOoIZvYHNPUJxG6PCVfF+bt1iwr36KjHVHPKSBWBnTPgo2OD86jvnvKNVH8KXATIrCV1pJduKak2HLXt524OzcWOlRbAEL3o40ieOEUE5xKuu7jdmYHthl9pHLnqbJEqrdRZ8sJfdQ4HbPg4epRYQiQZ7
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(396003)(366004)(346002)(39850400004)(451199021)(186006)(1800799006)(966005)(6512007)(6666004)(6486002)(110136005)(478600001)(2616005)(6506007)(2906002)(316002)(66946007)(66476007)(41300700001)(66556008)(26005)(8676002)(8936002)(5660300002)(53546011)(38100700002)(36756003)(86362001)(31696002)(83380400001)(31686004)(66899021)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cnI2UU1HZ3lMak9vYTRudFJXbkpZWDhidG91NEowOFZTT2pidzdzYXdUMGZM?=
 =?utf-8?B?dGVEZDRCNmlLaFZuVitQSGF4Wk9zRStRQnFVem9TK05TRXE3dkpncEZuMWx4?=
 =?utf-8?B?QkhsUjJyVCs0dnRVZkpUdHo1MWxxa0d0cGhJTURQRVBwUFppY0FRcEdEQWdj?=
 =?utf-8?B?b3kxNkx4bUU0V0ROOEpwbWxZNy9ycUl2WjJHU0JKbHlpSFZwOTZHMlpuYk42?=
 =?utf-8?B?NEVkRS9rQ01aQWhGZEh3blhnRUlnSHRyUHV1Ni9aSHpoSDhUZTdSQkRXN0tz?=
 =?utf-8?B?QXRGeUQxbTFVazhWbUczS2k1eWtlczJEbmdxdUdSZW1Jcno2OHpaaFlBamRq?=
 =?utf-8?B?MkREYmo4aGVsLytvTUVzcnUwUUV2bDJYSE9iaFppRHI3YWFqOFkydkpiMkEx?=
 =?utf-8?B?M0VObnFlWUNhOWh5K2luS044bHowTUNDZ2VWbVMwWDFRWFFvL0RaODVnVkdh?=
 =?utf-8?B?cXE4bTV0cGg4eUlXV200RTBVMlJTdkFraXFMVTFMcmhacUpsa0JlejY5bGF5?=
 =?utf-8?B?cmVUMzgvNmgyRmZjZWNoVzcxSkQybXphRkxJMEpEOEh3QlF5aXZGZmxWWDhw?=
 =?utf-8?B?dmUxMUxZa0Ywa2VMZkJmOXVqV3JSY3BxbWcweitvbGlqNzI3YUkvOHZxaVhm?=
 =?utf-8?B?eWtGdHZkQkFhVGlQZ05PdVNhelZPU2l1dnhaQnh0TklCeURUY1lUdTdrTndR?=
 =?utf-8?B?Rm1YbTFDQXFlN25lc09za0Z1OHUrUDlNYWhyL0lGTXE4T0ZGcGF0M3NxZ2Rx?=
 =?utf-8?B?VXIweWJQSkdkaXZOZjBMVlVnby8yNEdRYlZaWktmblNXNW53SWNDK21DM0Nz?=
 =?utf-8?B?QTFCbSs4R2RadmJ0ZzlSK0g2OGV1RU5TaCtxNlJrYTlhY3dGNCtEVnoxNExi?=
 =?utf-8?B?MFNycG4yWkx1K3JWK1IzeTNvcGVJZENweHVmSzJNUU83MlpZcGNPU1JLWWZi?=
 =?utf-8?B?c2NkdGZnWUs5TWFidzdWUkVOOGEzUytZMjJYbVpSZ2ZNTC80dWIyR2ZJRncw?=
 =?utf-8?B?SnpmcGowVXRGMGZIeExpVDFUeU1SenlYbmlaOGxpL0RCZ2hRQmtocXUyelJh?=
 =?utf-8?B?QUVrVTBjR2dmSVBndllYOUp3eEc5UUhtMVAxQTBEZWJiOFRrZlorU0pQUXVN?=
 =?utf-8?B?eE1wQVNLQTA4MTJ4QkRocGFQUUZJelBJMWl3MmtPQ1NDTW5tSnhnVUs4L2FY?=
 =?utf-8?B?N3krVGVZSUxTS2h1OWM2Mm5sNjBUZjF2M1RpdW9ISDlnMFhWOGg4bVhURGoy?=
 =?utf-8?B?K3U0eVlZcSsydFkrM3loNXNWSmdONlROWFlqUHNDVldLNlBFR0krdzVmejFr?=
 =?utf-8?B?VTBxZlRiczZsci9vK2hBK0FLZWhSNzF6Si9Va3JQZ0NZRU1oazVSMjVSN2lj?=
 =?utf-8?B?QUx5aUw0VGo2Z011VVFoQkVERUVibGhjeE5rQzVDand3cE84NWt0eW40bzZH?=
 =?utf-8?B?MTQrc3NTUU9OMHE0K2FxNVBxa0QvZ3RaR29IS0FOZzY3U1hYRWgxTWlkQjZl?=
 =?utf-8?B?UE1GeWE3MFFzcEsyNWZ3T0pLRmxyeHVhNWRBMER0aCtHNVhwQXhuMUdJcEh5?=
 =?utf-8?B?WlZBTkVIR1J6eGQxSXVtK1NGaHdGbkFQejhqMEVDR1BxT3hvRkh4aEg4cHJn?=
 =?utf-8?B?enBrbXI3b0JaTmNMTlFOMWNMdFc2bExzU2NVQ2NpMGJDTmF3OHlUZ3pDdko5?=
 =?utf-8?B?Yzl4cWtuUjI5QTZ4YzQvN1dRbWhRTktZZGIvOFR6UHpQZ3dRKzViQTVVdDRG?=
 =?utf-8?B?MU1hZ2hMRnR2RTJzUEw1blFydDVUMU85SW1hSFBrbWNkWVVQd0tXUGFFZDFG?=
 =?utf-8?B?Q3hGUzk0NEprTEVTQU9FcUI0ZEIwRFFYbTdVRU9ralZxeldMWldLcWg2VUhJ?=
 =?utf-8?B?RTJZem5FZ3BFQ3YxY3NqM0JwWUk5ZUlib0swRWo0S2lMMDcvTDgvQ0Z5dUsr?=
 =?utf-8?B?OWlKeVVLaGJnOTNtVGVndDFsMFBpRldBc082ZFhZRmNEOFhvZllWVnBXWE5z?=
 =?utf-8?B?S3lyYWxIOWMydEhPakxJbnRacnR0Y2pDUDFWcWFFMmFxQnlOdlVyVDZmMkNL?=
 =?utf-8?B?aC9qcnVCQ2pKVFE0a3M4b2p0MWFQUmtZVXNmbjRCTERLY0ZMeVExbXlpdVk4?=
 =?utf-8?B?Z0VSLzRBMkY2YWhoNG1LaXdKQmswcVd4ZDI2cTUxZnhCMnY5V3lrVGttNkxM?=
 =?utf-8?B?ckE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d87c0fe-4a36-46dd-40db-08db9cab6a34
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 09:47:04.0852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DgyFbK96EDnsTE5foPmferCl+B/zx1K8k9ytbiuvP73tptZsJjKtYl/IYZy68KtDEIBi9E/96kE+XPJCuT/6gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8321
X-Proofpoint-GUID: ANkxMKQMlWkYs2AnBpg4P4Nw72c4YGLu
X-Proofpoint-ORIG-GUID: 8vun6K63LKQZgf8cduETPZFhMvY9ggdO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-14_04,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 mlxlogscore=446 lowpriorityscore=0
 adultscore=0 mlxscore=0 spamscore=0 impostorscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2308140090
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Aug 2023 09:47:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185929

Hi Richard,

On 8/14/23 17:25, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> On Mon, 2023-08-14 at 17:19 +0800, Yu, Mingli wrote:
>> Ping.
> 
> https://lists.openembedded.org/g/openembedded-core/message/184574
> 
> """
> So why not just add:
> 
> RRECOMMENDS:${PN} += "${PN}-system-all ${PN}-user-all"
> 
> as I think we've then covered all the options we need?
> """
> 
> I still haven't seen an answer to this?

Sorry for noise, have ever answered this question in another thread 
"[PATCH v3] qemu: Add qemu-common package".

If just add RRECOMMENDS:${PN} += "${PN}-system-all ${PN}-user-all" by 
default, then how about the user who want only install 
qemu-system-aarch64-7.2.0-r0.corei7_64.rpm still install all qemu 
binaries as qemu-system-aarch64 rdepends on qemu which RRECOMMENDS 
qemu-system-all and 
qemu-user-all(https://git.openembedded.org/openembedded-core/commit/?id=893846ead7ee54d53e9076150cd655e0c8bca5db).

So it's better make qemu as meta package to keep backward compatibility 
for user who install qemu can install all qemu binaries as before and 
also can meet the need for user who want just install qemu arm64 
emulation rpm such as 
qemu-system-aarch64-7.2.0-r0.corei7_64.rpm(https://patchwork.yoctoproject.org/project/oe-core/patch/20230717071114.2734859-1-mingli.yu@eng.windriver.com/) 
via adding IMAGE_INSTALL:append = " qemu-system-aarch64" into 
conf/local.conf.

Thanks,

> 
> I don't like the fact we've messed this packaging around multiple times
> and still don't seem clear on the problem(s) we're solving.
> 
> Cheers,
> 
> Richard
> 
> 
>>
>> Thanks,
>>
>> On 7/17/23 15:11, Yu, Mingli wrote:
>>> From: Mingli Yu <mingli.yu@windriver.com>
>>>
>>> We split the qemu package [1] to add support to make user can install
>>> one qemu arch emulation rpm to ease the concerns who care much about
>>> the rpm size in embedded device.
>>>
>>> But for the user who only install the qemu-*.rpm can't do anything
>>> except they install the qemu emulation rpm like qemu-system-x86-64-*.rpm
>>> explicitly.
>>>
>>> So add qemu-common package to package all thing into qemu-common when
>>> not split the package, and package only the basic into qemu-common and
>>> other arch related to each qemu arch emulation rpm when split the package
>>> to fix the backward compatibility.
>>>
>>> qenu-*.rpm which is meta package rdepends on qemu-common and the available
>>> qemu arch emulation rpm like qemu-system-x86-64-*.rpm and etc.
>>>
>>> [1] https://git.openembedded.org/openembedded-core/commit/?id=893846ead7ee54d53e9076150cd655e0c8bca5db
>>>
>>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>>> ---
>>>
>>> v3->v4: remove the added native-sdk dependency.
>>>
>>>    meta/recipes-devtools/qemu/qemu.inc      | 23 ++++++++++++-----------
>>>    meta/recipes-devtools/qemu/qemu_8.0.3.bb |  2 +-
>>>    2 files changed, 13 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
>>> index 16581db69d..76560f454d 100644
>>> --- a/meta/recipes-devtools/qemu/qemu.inc
>>> +++ b/meta/recipes-devtools/qemu/qemu.inc
>>> @@ -225,15 +225,18 @@ PACKAGECONFIG[brlapi] = "--enable-brlapi,--disable-brlapi"
>>>    PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack,"
>>>    PACKAGECONFIG[debuginfo] = "--enable-libdw,--disable-libdw,elfutils"
>>>
>>> -INSANE_SKIP:${PN} = "arch"
>>> +INSANE_SKIP:${PN}-common = "arch"
>>>
>>>    FILES:${PN} += "${datadir}/icons"
>>>
>>>    # For user who want to install all arch packages
>>> -PACKAGES =+ "${PN}-system-all ${PN}-user-all"
>>> +PACKAGES =+ "${PN}-common"
>>> +RDEPENDS:${PN} += "${PN}-common"
>>>
>>> -ALLOW_EMPTY:${PN}-system-all = "1"
>>> -ALLOW_EMPTY:${PN}-user-all = "1"
>>> +ALLOW_EMPTY:${PN} = "1"
>>> +FILES:${PN} = ""
>>> +
>>> +FILES:${PN}-common = "${bindir}/* ${includedir}/* ${libexecdir}/* ${datadir}/* ${localstatedir}"
>>>
>>>    PACKAGES_DYNAMIC += "^${PN}-user-.*  ^${PN}-system-.*"
>>>
>>> @@ -241,15 +244,13 @@ PACKAGESPLITFUNCS =+ "split_qemu_packages"
>>>
>>>    python split_qemu_packages () {
>>>        archdir = d.expand('${bindir}/')
>>> -    syspackages = do_split_packages(d, archdir, r'^qemu-system-(.*)$', '${PN}-system-%s', 'QEMU full system emulation binaries(%s)' , prepend=True)
>>> -    if syspackages:
>>> -        d.setVar('RDEPENDS:' + d.getVar('PN') + '-system-all', ' '.join(syspackages))
>>> +    subpackages = do_split_packages(d, archdir, r'^qemu-system-(.*)$', '${PN}-system-%s', 'QEMU full system emulation binaries(%s)' , prepend=True, extra_depends='${PN}-common')
>>>
>>> -    userpackages = do_split_packages(d, archdir, r'^qemu-((?!system|edid|ga|img|io|nbd|pr-helper|storage-daemon).*)$', '${PN}-user-%s', 'QEMU full user emulation binaries(%s)' , prepend=True)
>>> -    if userpackages:
>>> -        d.setVar('RDEPENDS:' + d.getVar('PN') + '-user-all', ' '.join(userpackages))
>>> +    subpackages += do_split_packages(d, archdir, r'^qemu-((?!system|edid|ga|img|io|nbd|pr-helper|storage-daemon).*)$', '${PN}-user-%s', 'QEMU full user emulation binaries(%s)' , prepend=True, extra_depends='${PN}-common')
>>> +    if subpackages:
>>> +        d.appendVar('RDEPENDS:' + d.getVar('PN'), ' ' + ' '.join(subpackages))
>>>        mipspackage = d.getVar('PN') + "-user-mips"
>>> -    if mipspackage in ' '.join(userpackages):
>>> +    if mipspackage in ' '.join(subpackages):
>>>            d.appendVar('RDEPENDS:' + mipspackage, ' ' + d.getVar("MLPREFIX") + 'bash')
>>>    }
>>>
>>> diff --git a/meta/recipes-devtools/qemu/qemu_8.0.3.bb b/meta/recipes-devtools/qemu/qemu_8.0.3.bb
>>> index 42e133967e..5d3c47c3b0 100644
>>> --- a/meta/recipes-devtools/qemu/qemu_8.0.3.bb
>>> +++ b/meta/recipes-devtools/qemu/qemu_8.0.3.bb
>>> @@ -8,7 +8,7 @@ DEPENDS:append:libc-musl = " libucontext"
>>>
>>>    CFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', '-DEGL_NO_X11=1', d)}"
>>>
>>> -RDEPENDS:${PN}:class-target += "bash"
>>> +RDEPENDS:${PN}-common:class-target += "bash"
>>>
>>>    EXTRA_OECONF:append:class-target = " --target-list=${@get_qemu_target_list(d)}"
>>>    EXTRA_OECONF:append:class-target:mipsarcho32 = "${@bb.utils.contains('BBEXTENDCURR', 'multilib', ' --disable-capstone', '', d)}"
>>>
>>>
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#184432): https://lists.openembedded.org/g/openembedded-core/message/184432
>>> Mute This Topic: https://lists.openembedded.org/mt/100190357/3618448
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mingli.yu@eng.windriver.com]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>
>>
> 

