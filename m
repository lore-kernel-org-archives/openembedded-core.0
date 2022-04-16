Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 496F2C63697
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.17451.1650105996039883137
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 03:46:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Bw/4he/u;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=110578f926=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 23GAhjIx000544
	for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 03:46:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : from : to : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=a93YbRSRkmeOzLW0WQJlj+WC11aHHAERd9YOQ+pSRg4=;
 b=Bw/4he/ugHNEUp6d0L3cAiR95Ev2WscnhTkIFs8Zt/ySA9EIgyi0rSjYLvjgVCJxTHuQ
 XK0//zgVzAKwZfaEaJ7Aew3AaoZ3ncoPqW2QIvS1tTP3JKp4bskHrNS2lTa8iy0OfLJv
 74C+yQmMknZqQnbM5yaGYQli/bqdC0yWimIGBXlc81ubZDa3gA/ZTNnuBxPGrXGFldvi
 5DAXb2h33bJcIeoTvZ88QJNRAhidMxS27yLmpsac37lqdRYwimKuByIUBvxk5vWCDGBU
 9jaM1wjFAgvFD7QXdsyYGxL0FSx+p5AYEPhndX3bHmxA+F2JaWsX/NUmT6WkrOATq6H/ AQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ffs3102q1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 03:46:35 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 23GAkYAn006115
	for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 03:46:35 -0700
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2176.outbound.protection.outlook.com [104.47.73.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ffs3102py-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 16 Apr 2022 03:46:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EfwaLN5FyjkTrCmwHHsycEfUUotd9q5/YvcI0hYSQNmfBFGRBvdE92LxDtsqWeq0Ifzt2oE1GErZIqtzxdWRs7FPCe8Rpr3RMYViSMD3291WZojrilFDKe41b2Yzep86j7KKFajmJlznscq7uJQuQ+FLYaCz5izLnoJd0qVnU5vLeFipfmfHDcth6jTcVCmyiwB2qFkyx0BLwf5EVXykLLvWl+DAFSpgIEiZx3oX7ap+zVNVXVmrQvR9o6yF9+SU0ygJVFjgI8duBfxQtvZ9fMSJTBfRNN2D5iT9kZt+XguGG9EzdzzWt7Zu1dKPhBi71HPFnsPEBxDqLb5wsaScmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a93YbRSRkmeOzLW0WQJlj+WC11aHHAERd9YOQ+pSRg4=;
 b=WwApM1Vy1pG+mXLbFuP/HHdUyHFyFT8CZhWBMSwsUcvc3uJ/o5mwaTQQ+pcpPHp0GLEvgLWFa7LltoN6jQpRUKSScpUZ+9GJCLQo5rA6vD0aza65Tr4epKNEJg3WoZ1uujONHE9QS0b3/XfMIdF8K9w8uSrd7LAKd15uzSaULzjiSVU0MK+xRytC9MBCjRvz+yedAQCG761qQWT+jV8bXh5LFS33uMt+4rdgW1RhJY/UpzBv7b1uUFEYUXveOJ2IRDGl51GOKNFr3I/Eo8POKh9jI8A6g5j/8a/IHB/RNjl4mrCCg2lhbU2yazLMv810R04XTzS1I7BijygM5JtsTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BYAPR11MB2789.namprd11.prod.outlook.com (2603:10b6:a02:cc::11)
 by CY4PR11MB1703.namprd11.prod.outlook.com (2603:10b6:903:28::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Sat, 16 Apr
 2022 10:46:33 +0000
Received: from BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::952b:793c:c458:460e]) by BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::952b:793c:c458:460e%3]) with mapi id 15.20.5164.020; Sat, 16 Apr 2022
 10:46:32 +0000
Message-ID: <4901c29e-7000-337c-04ca-536dc7e0fc60@windriver.com>
Date: Sat, 16 Apr 2022 18:46:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [OE-core] [PATCH 0/1] libxshmfence: Correct LICENSE to HPND
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
To: openembedded-core@lists.openembedded.org, steve@sakoman.com
References: <16E65A7F97A77391.19917@lists.openembedded.org>
In-Reply-To: <16E65A7F97A77391.19917@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SL2P216CA0104.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:3::19) To BYAPR11MB2789.namprd11.prod.outlook.com
 (2603:10b6:a02:cc::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d78e83a2-a15d-431c-2121-08da1f965f11
X-MS-TrafficTypeDiagnostic: CY4PR11MB1703:EE_
X-Microsoft-Antispam-PRVS: 
	<CY4PR11MB1703DE6264BD788B4F7761CFFFF19@CY4PR11MB1703.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	h0g3w/5EEy5p8OvATPc3GgQ46ULabi4Js0VQXQ1PjOe2WFltVHR9h8E8F5IkX909PgtA7sOh5My3FEzvF6KO5tFxNk5hfCfWadW0chY4WZn039SzfvvRnXwtadpw3ZVwcJ/PfEQNDgoO63HXU4H4ohr6HRQp4P9dG8iGxumfPffortzyzD8hDIXHzh45Kb2FSlyqW0iNk6S5Kil/FNDEfzg2Me8EV3vytCFNo066fosglBLSFlg/WWqB/xwCMKRsEKLOOzozXKNVHaLvcbh/gmHgkj+XNk1q9NPLmFd3akSWQXz/RpecdqD/O6TjCeh6QCtPex5+fneG/db2u7T0rzeGzTO1XzOSgN6CipIVyJTj86YKJxUIahF44EciFYFCQSmC3c506caw/RdZc2hZO2KQq79bdxyyhwuXRBIkrRxqy4grZHV5bwyGC2A4fKGiFts+g+Erwg3Y6s6/dPcf61LpW2lCNqAyFEYT8sg67kKxnjcB79rapv9wp6Mp4yu2XWclY2usUuWU+lY1Ah1gJbkYlDk/VNn9/CzXspwPCriTSeF1QK68aQaoRYqKxrRRenCnrQ3617JBEGIb64Vj86mGRru/XvELzE62w0JG4wRtOFz7x5tvaro+qc2AHNIR3fP0FrXTl8RjGjSYkfaj1LlkpERrPv2NmtSKCNCCn3Rf1tVXBAA3qf6Tg7ivUMERz3dyKSOnUmIU7U1taySYmkK14Jb6lMXbCRS0XepsRzUQ8Do2I164A3I5x1J2ZXNlECHigsMTahBSFY8KtS0VCeJiuUPngOs1zNqer2R94OPur0D+QbQTUUJ9lF13402+kxitEm3LXXom2Vnoy3mSiryI+jZ6rSZclt5+k8Os++Z22ZHyqH4ZGYODRrEN+EMoAUaWiwzyR3077cD2YH1BYBAQamRmJYUJlb+XOTdu+cM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2789.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(66556008)(316002)(6506007)(53546011)(8936002)(5660300002)(52116002)(66476007)(6666004)(38350700002)(6486002)(86362001)(966005)(38100700002)(31696002)(508600001)(186003)(8676002)(36756003)(83380400001)(2616005)(2906002)(6512007)(26005)(31686004)(9126006)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?c0RIOFpmQ3MzWG4raUhWcy9YYi8yenNSeFRVZUNESE4wYlFYTFZlVXFseFBo?=
 =?utf-8?B?NmNIUDdFZWsxbWQ1bHhiNGNQWFRlcTExdm1TbzRPRVlBdVY3RkhIR1RyNWFX?=
 =?utf-8?B?b0pLRVZzdlBnSndXWTZoVUlmN2g1bEhBaGs3TkVCamxJYnFNeWF4c2wyRlpJ?=
 =?utf-8?B?VkxESnVyMTlFVFlVcUJpd2FJL1J0MHh4a25xYk5Kbis4UUhvSWNQNHVHeFVl?=
 =?utf-8?B?WCtSMmZ6bkl2eU9ucjJQY3UwNkN1SGgrT3gybCtNTEZwM09WRXVWY1c1ZVVI?=
 =?utf-8?B?Rk5VSFRXUDVTV1ljYllXR3NwVnViSEJxdVhGWUxpSTZBMEwzZFEyckovMitZ?=
 =?utf-8?B?UGFWUXU4RFNPZmFYUE4wRXpnQXovcGV3RGZhRDlZbk5BK0VmSVlzU2k4RjV4?=
 =?utf-8?B?eE13dW5WLzdRSWJDN242bmtudnFDZ3duSmRwcVZEY0szcDN2aXpvcjNhNll4?=
 =?utf-8?B?RTJkLzNRa3dJd3dMKzdTZjhWWWV0SmxxcEZ0RlAyVjlLNFlmUHFLakFjRkZZ?=
 =?utf-8?B?TU1GYlV6VVNzekFBQXVwU0JnaFRDYWxxUDVObkswMm5oZFM1enh2amZRVXRE?=
 =?utf-8?B?V0puTk9obEdpTXd6enhrTmg3VnI3anplc0RJQ0lvdEpWZngvWW9mMUhDNkdw?=
 =?utf-8?B?S1U0bVRmNnM4SlNOZnM4aW8xNzRITFF0MUtNTHFwWWczamFSWVF6L1hsM25Q?=
 =?utf-8?B?emtPM252c0IwUUt3MmpUNHdUZW9SRCtvODJuelBxZmJjUytzU0RxMGx2Z2pC?=
 =?utf-8?B?R3pIWWc4UWtzRXBHU2NtRWFzZGlOQmNqMDRkZ3h3YXJoWHNabkp3NjlFeGJ0?=
 =?utf-8?B?WWpaTWg4TFQrL3VrR3MwZDVNaXpXbXpmK3JwS0NRRkhkR3A5K3ZDNGQ4SGVW?=
 =?utf-8?B?VUVEUWZGUDVNMU04ZmU4M0V0MTA3aGRNUG5WenpNajBjOVBjWE9mbmFJOEYx?=
 =?utf-8?B?S0FZOHJOcE9pSUlhRWRNUzN6aWdiZWhTUjVHdVBaVUtPMEJITllQZHNVdHJL?=
 =?utf-8?B?c3FwaUhVdkZJdEJJNXdGRUswNWJlNXRGKzhpZDQrWDFTWkFsNlVJWUhsb1Qz?=
 =?utf-8?B?MkdoZnVLT0lJd095bkFma0RrRWdZV3hMY0x6NUlHVFhGRmI1TUIrazNnNWNG?=
 =?utf-8?B?akgvMTUwbWxsQW0zWWhJV0Y5OHpNMXRJYnlGRXJ4enJIY1hYMk52UllPVXB1?=
 =?utf-8?B?MUd0RWhNdElFblNjMDB4UkZrcUtSWWREQzFBVzlObDF1ZWM0UDFxdkZGRWtv?=
 =?utf-8?B?SWlxTWFuN3o1UlExYnAzSTV5TmhtZlB1VFNTT2diR0VNai91OHVMcjZQQWxl?=
 =?utf-8?B?bUU4WGQ4UFB4ajZHQXJ4Y3JOUlE2aXhvRksxcGlUQ1ZydFFFeWUybFpVOHNR?=
 =?utf-8?B?dWt2WURFNTd6RXZabDNYZisxTWpRdXJQdENrUmo4ZVJ3a1JIdVl3YzhhNDNW?=
 =?utf-8?B?NkZNcnNZMGhRZjhWelBYVzVacjlxQlRxc3VWaTIzaTBObUpPTEhzTWFQVlVR?=
 =?utf-8?B?eS9EWmkrWlJVa1huNDYxV3VoNVNiaDhuS3NCZkl6ekxPWFB3QWg5dHg1Vktl?=
 =?utf-8?B?TVpqdVZoaGlBRCtWY0dTNWhpZ2d3U3dlZm03YnJvb0dkTURnc3pUWHZ0V0Jy?=
 =?utf-8?B?YXh1ODNoU2ZXbnRsSGVvalZwaStGUTZZaC9uWWRub0drVGJLWTlST2V5RFBR?=
 =?utf-8?B?aEFqaGFzMWpVeHZBSExvZkdkUTY3UkMzNldSMENnazcxV2V0NjRVakpIMUgv?=
 =?utf-8?B?dGtDOVB1TzkrRDBxd1JHYlB3dS9FOGw1c1NycmpxbEJiQ2tuRng3dE1vT3VM?=
 =?utf-8?B?aUxyRVBZVFo2TFJxUXQ1UHNGR1MvbGtqZTBDT1RZSU9sVEFwRDZKZjVvaTJO?=
 =?utf-8?B?MWpYSXErU1crbUcrc0cwb1hucEVUWUhuSVRLenI4RUFaYnF2MWtMZWloaFZH?=
 =?utf-8?B?RzVEYU5ndENBN3BiTlUweW12UUZWbENPaTZPQVQ5bEhNcFQ4M2hDdHN3RGs1?=
 =?utf-8?B?bmVEbHAxWWJpbkd0cHJhUGV0SVJ4elFiM2NEMm03eGlQRms1RStNNVhiemhT?=
 =?utf-8?B?a0FNMU1Mb3NMSDUrdXA4NlE3SlBvU054djkvQVRkM29QVXNvYmFmajBPUGFP?=
 =?utf-8?B?d2QwWStOR2ZCVHNSNnNiK1JiMHhxNi8vSitFb3czbEc2NWYweDM2ajRtdVNM?=
 =?utf-8?B?R2o3eFBwMWI3YUQwcHhpQ0k2cjdrdTc5bXNlclZXZVZ6NHZ4RHQzSHJLTWNj?=
 =?utf-8?B?UFlpcEpLN0h3MElHWDRKVVdkYk1lL3phRkZYa1lNY3FsRm15eHVrOHcxZ0l4?=
 =?utf-8?B?dUZQU21qYTRCS0tlRzNRdDBLcDk4dS8vc2dCTzNza2R0b2dMcDlBTTFXdjlP?=
 =?utf-8?Q?5rnTPY/TVZpjIHg4=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d78e83a2-a15d-431c-2121-08da1f965f11
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2789.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2022 10:46:32.9203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 rQCxW3s3VBkOpoHyg7DVmfp0pVyAMei/tXpyyDwpDENUB7VTt6zIs8fijnMnp3OkggUXPTBOn995lKJ9GFvMmqbhi07rQl3AWtxmOAIQBMY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1703
X-Proofpoint-ORIG-GUID: 0M-UZZXsbZwfppUIEumCWvF2cYc0i4G1
X-Proofpoint-GUID: cU-V_Q0spTpOumpF0yC4xZoulW3_L0UD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-16_02,2022-04-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=763 mlxscore=0
 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2204160072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164535

Sorry, please ignore this, should be prefixed with [dunfell]

// Robert

On 4/16/22 18:43, Robert Yang wrote:
> The following changes since commit aa2bb4f62dd7e5c6fdf220264c3d62fbf2cc7d16:
> 
>    xserver-xorg: update to 1.20.14 (2022-03-29 11:43:54 -1000)
> 
> are available in the Git repository at:
> 
>    git://git.openembedded.org/openembedded-core-contrib rbt/license
>    http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/license
> 
> Richard Purdie (1):
>    libxshmfence: Correct LICENSE to HPND
> 
>   meta-selftest/recipes-test/recipeutils/recipeutils-test_1.2.bb | 2 +-
>   meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb             | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164533): https://lists.openembedded.org/g/openembedded-core/message/164533
> Mute This Topic: https://lists.openembedded.org/mt/90503383/3616940
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [liezhi.yang@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

