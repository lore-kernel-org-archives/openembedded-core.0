Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3C5BC433EF
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 11:04:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.4981.1642590275899245411
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 03:04:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=i5lJsPq0;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=8018707d56=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20JALkFb026504
	for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 03:04:32 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=l+ARWdZdOB5eRNB7yPtBN1arsu87jw8O0rPoDMc4kcg=;
 b=i5lJsPq0edb2N/Nfwb8Cktigx5Qqot9eFu6rIvQrRYJ4D/LAADs6tseb9112zL3Vwxl3
 mx5CorX7H2/EcarsM40nXRbAddP5ira6a2rdeHpyIBh6AO1JhYbniEx3RfuKHPKXg54q
 ENK7kdFTG7F3gJoOoGKq1vM8Dt8N/2ulXBig8uzWbv6s2W2LpMmereYTluxy4ZCtHDZI
 iGFTP+CI7uaRjw7lJmVuPqx1b6Iqv+mPAnsHqxGgux+piozyY2LFpoO/szEl9V7KFNyM
 5mC13z/IYaYpYgsEncWm/StxL6mr0Prd3/zxidqvDTfDRXQUzBvfDtaYZ1/tH8KotxW1 cQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dnh10h79j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 03:04:32 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20JB4VgD028063
	for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 03:04:31 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dnh10h79h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jan 2022 03:04:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VC+UUGxE3kPSUch71Wi8kTI0R/niG3XNeVvD4TDZ5X52Zx4iaWYQzXIXgTkstLusDmPz5CGO3kohMHsnE9wMqjGClh9/oQVK0t2R22CvLWAiRJ5ZcGPydMqI49umkYiPPH5aIdrExk4g00ZjfUob6gdRNDGJMpF+52/emQKiE+eU/M+qqs1OOEoC65Pu0RlTwBIUJV7Vd2vn1FtvD4obopSaK2o5xFi0MRhpIo7hYo7IpruFQbg9RdrXM+f5Cw9NYY/OuZ0KtJDpB3mOf727Jv7XsJR9LsLbpaxbchfhEBXUuGz4U7iVTkFGzpzACuWvzUNzvZEaBwJWax/ybfLLUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l+ARWdZdOB5eRNB7yPtBN1arsu87jw8O0rPoDMc4kcg=;
 b=MO29Lk18/4yEU27R/KwF/N1uEmwAuxymoqpefQwj6bHYlbEtDZLUUoO/J62g0+SWDN0LaPl3tjf34ZyRcq3yAsh1jXoNaLWeE3Ne3jR4XMRSn4zzAt+53eD/KA+t6ZtoFRqyNIClUjp3v36Lx2MoOh+f9EY4yjZ9mB74G9OWSEIDYLz9C8EdKgasvMJByth5+Mg/s6SH9a2jfMqPURAn+3bC9yVdf4Qw7DZMrNvg8z7txJ6bOU2rze8Tl9l4DbyiasNfeYjHRQa0c9UX4BzW8IqXqSlMAgntfxsGdOeoo+jmxmfvSOiWxXvQ442ezGP2qmKzYVMGrAUGHDagzLq4Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from BYAPR11MB2789.namprd11.prod.outlook.com (2603:10b6:a02:cc::11)
 by MW3PR11MB4540.namprd11.prod.outlook.com (2603:10b6:303:56::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Wed, 19 Jan
 2022 11:04:24 +0000
Received: from BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::5cb5:e426:2e48:17ed]) by BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::5cb5:e426:2e48:17ed%5]) with mapi id 15.20.4888.014; Wed, 19 Jan 2022
 11:04:24 +0000
Subject: Re: [PATCH 10/39] logrotate: update 3.18.1 -> 3.19.0, drop
 rotate-across-filesystems patches
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20220119104117.2120127-1-alex@linutronix.de>
 <20220119104117.2120127-10-alex@linutronix.de>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <65dcbb68-d828-4779-06f6-d0ac554a7af6@windriver.com>
Date: Wed, 19 Jan 2022 19:04:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20220119104117.2120127-10-alex@linutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HK0PR01CA0056.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::20) To BYAPR11MB2789.namprd11.prod.outlook.com
 (2603:10b6:a02:cc::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9c8754b-45a1-4183-38f0-08d9db3b73d6
X-MS-TrafficTypeDiagnostic: MW3PR11MB4540:EE_
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB4540E8EC6308AEAD48B33DC3FF599@MW3PR11MB4540.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pFgNLDCd54ioOnfSe/LIOSs9vZmZPeyTUoX1C/5bPU0b4SiWqt0s0j0ZIHeAkzcNHRVKrmznKbI+WQyLx3QGVy4eTaY8bC/yTLHPTIv9t92WizKTQYggpCAJFeWWd1ai0srIdIRXgNIvmWvUeDXcuG4O1fzcLDgBs4ZqHz2cl3omE1YmhX9lHOpnrTdeIs8Y8AhOzA5Pm0BXrn23QViXBdqc+RlfKcoOMo4BThLXRh2+Zlm7RclDXmwkjnbNDyxqiSvJHrZdIb6NF1XcZZUn/C+HI3/aI7csmgM42nssT7ideJJN+Q+Ow51IRZmwpsOv4W3cFnaW1WERI5WVqEXWAdITrA/+za9XIHBJ12WkZoQ7Wr1HwG1SN7Cl7HNocrO7z2DfDoUSZBVHXugDhzPDLVri9Z6h3drQ8Czh95INK0LvgTZT0Jvlp/eCGC7AmKY07/todsI2uLEiAGPwVzdytUcvvWNdHNgxaCqRE2T/5BE70lstBgBYyRrc0L5hxs01oSPX/5jCZeeaDuqixJtZ3Ugj9z+J4XAwfAX3wU400HY0GMM3dcoLVdIbYmQA7MgbGnQRr5x9ju7iG8bqtxu2apLKXPpzJEoU4XNK6OtNed/yPyQcTFYvPj/rxi9/Iq5cGRR1ZSlCohlp7yFbLw4nrewU91jgTUWkxi8fCBOyzCxEgaMZUhfQ4yPpLQZM9E7gWR5xvl+ODrXjp5Ige/f2QJmzAlJ4jgtcwAosAe291YTJd9uAaAwfgwtfmZIwwDfntuOoRsEABnTACXbgIrQnVvYQBwQjhI57bTga2/S54VPEL0tL/oyWGMd/nE0WfcADRKIjmoigXNioZf69wFBWDxPGlri5p2W7jbq1lFT09sV2X1Iap1VPjO5aYJHsn+DZLLE7U3xe1ZLSiKQixEf02w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2789.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(31686004)(5660300002)(316002)(6512007)(15650500001)(2616005)(83380400001)(186003)(38350700002)(38100700002)(36756003)(66476007)(66556008)(66946007)(508600001)(4326008)(6486002)(2906002)(8676002)(86362001)(966005)(30864003)(31696002)(53546011)(8936002)(6506007)(6666004)(26005)(52116002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U2p6Y2JLb3cxT0dkZGdTek1hYk5FOU94WW51ZzZxVVFYRUc1d0dCZ1oveTBL?=
 =?utf-8?B?a1llQlNKa1IzRTM2NDBYYzl5TlViVzA1LzA2eTJtRkVxMXBIdU8vRTRMQTZh?=
 =?utf-8?B?Y090RDJCeTZ4aVFEckU1UmNjTXJ6cm9BdjhqZ05qWXU3c3NxSlM3bFVxMURB?=
 =?utf-8?B?d3lDV0FqNEo3UFhEY092R0wrbitlVUtHVWZ1OFFhTlpncHdLS2wrQVN4MjVu?=
 =?utf-8?B?OVZiajNkcWMxRjBYaEluQmFMSWU0enpESTFSR2dUSnl0M0ZjOWtqd1ZaKzh0?=
 =?utf-8?B?dHczd2pWdGc2MWpqajE4V1JhanB6ZzNUbVc5VHZOTmNVcmV1V1JhRzVkTTBM?=
 =?utf-8?B?TUJZQWVraDFHREpiWWtreHB5VXBPazdkSVJIWm5PdGVtblZkY1FselNRbEpG?=
 =?utf-8?B?MjBWSFJtd21qbEJ0bUM5am9qbUJQSS9IekZRbkpRdW5DNnV5ZkRwRk90UnAx?=
 =?utf-8?B?a05rSlVzZXE4cXhtZnlGaUVxUUZrdFI1UGN5NWFCVE01eVEzNmVjcHVUSlBi?=
 =?utf-8?B?blppQWtvb1E3WEVCM1l2VTlMWnFnT1VtLy9oU0RmRWwycG5xQWVTUm1ZWXIv?=
 =?utf-8?B?TFBMeVMyU1RKT000cUFZL0Q0bWoyUGRmbjdhNFd4bmFrcHRFQzVCUkxSSDNk?=
 =?utf-8?B?UkZxSkNCWS9CTzROaWh2U1FYV0NwMjRnOE5ZOTFLWnBKTk5RQkdVZkVqekFE?=
 =?utf-8?B?U3ZsZmRsOHhTSGpTMm9LUXduT3ZOeFNHYzhpcHlPZVEvMHYvM2cvMTRoQUtu?=
 =?utf-8?B?d1Z3S3A1alVYVFI4UGZMOUFGT1B4VGdqWWpncnp0RGtzM3F3ejA3NEt0OGRJ?=
 =?utf-8?B?VGVNSVdNUmlQdm5XZFFpSDM4UTFTcWtNM0VwZ3RVZ1VuTDdLTjBEN0tFTUpo?=
 =?utf-8?B?eWZkWHFVRGJIbDRyM25mMEtkUERIRGtBZ2duY3BCTFF5b2Vka2dVZEN4M2tL?=
 =?utf-8?B?aGNDZmVQZjFDOFczZTN5eUpTUytSSzIxTWwxckRuQmpJVmhWWWpxL2s4enJQ?=
 =?utf-8?B?YmJ1VzFJbnN0cmNCYU8zeisvNW0xVWRMai9MOTdXeFM0bFNjdmV6b1pYOHVy?=
 =?utf-8?B?SDljakpPTWovUW01SWc3NzkydkI1Q1Q4d05GTUsyb21UZ2N4YUJOYmtQcm52?=
 =?utf-8?B?TG5wVld0VjZSL3BjbTgzUUNOcnNNeHIvN3ZTM1R1N2hzd3pNZjJlQWdkUFVo?=
 =?utf-8?B?R0R5V3hyMU5xTTh0c2hqOXRMSEQ0cEZkQm1IQU9ub083UTR6eWIvbGRRbEJG?=
 =?utf-8?B?L2NlSXFRNVpPNlVzekZTOWZ3WU5NNFU4VWVUYks1WE5TMkxYc2ZHUlF5czdm?=
 =?utf-8?B?ejJwUVZHQXphZGdqLzNPMjlrcnM0SlZQNTZiZ0FrVFFBWUs1MVBMRVNrNzBo?=
 =?utf-8?B?L2ltTHBCbmJQUUVJaDk4bmkwMWswT1pvZ0ZybHBQM1hmVmxsL0o2a0t1Rkt5?=
 =?utf-8?B?WGd3cHdYaXZDR2s3ZG1YMUgydUtNc3N3VCswR0tibWJNSGZpajlvcHZzeWNh?=
 =?utf-8?B?eEdDMG4xemZPSFJjSWpFRnJ6NG1mSytlV0k0N3Z6cUlWd1FLL01KU01BRDdy?=
 =?utf-8?B?bXJwV0NtVlJ0K1F1dVM2NVRVVW9CQTdNT3hVcFptR2psZ05lNlBHL2JtUFFi?=
 =?utf-8?B?bGFKRVBNWEhwd2QvQy9HMVlrTXZlS0NvN1hPWHFCVzRwMjVkVXRCSHBDcWNo?=
 =?utf-8?B?TVorV0RxZERhQXF1K0lSck9GOGdHK1lmdCs5eUYxZnkycUxuVW9ydTMzNGhV?=
 =?utf-8?B?N0xLNktsWU9nRk9RYVVseDlPUGJFVFhSZVJ2VVByMEdodnl4OWJiSWNsbGV1?=
 =?utf-8?B?OHFZOEU0d0NxVnBtbEFmSTRNZDI4RXpORU5scGdpdm5yTDA1VkY0ekV5T201?=
 =?utf-8?B?VzFRM0xDVVZaZk00a0FjUktZcG9KQ01hN0NYTkxicGVOUGVUSU00ajZqMEd6?=
 =?utf-8?B?MWtDM0JyUFp4Mm1qRS9qZ1BQeHFLN0xReGxTancvS1RXT0pqTVVmYmZIem5l?=
 =?utf-8?B?dDF4OVZPa3FXV2w2OW41QXV2R245NW9EdHhoS1lCQjhacU15UDg5VHJNMk1S?=
 =?utf-8?B?Zm8veGw2Rlg0ajZTMFBSRnVLMTN4QmFISlVUTEQyYU54eDh3c3A2UnJqR1c0?=
 =?utf-8?B?R3NLZDEvNTRRYWU5RHRUTHpsRzVDbnpxalBoWVVUNlZWeXFyNXM1bmJSSjc4?=
 =?utf-8?B?OEV6cEhoTnVNUnZ3N3VoUTVJRWVPZ2tDQ2gyNjhHaWMyZnhSd00xT3NZUkhv?=
 =?utf-8?B?MHpKZ0luRTJRWW5Rck13UTNHZlpRPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d9c8754b-45a1-4183-38f0-08d9db3b73d6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2789.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 11:04:24.5108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 03AP0ApUnHcXu6LSBMQS8YGB6/Tv4iTz2RV3UF2MDIFs7svnPxBzYmGP1UyEtF5splvsK+SlWQTPr0RzgWJNqYR534aKlF6qwbll8TbX3hs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4540
X-Proofpoint-ORIG-GUID: jZGK2L7VY4dgu73IXl8ai_Bq2WKBYDc1
X-Proofpoint-GUID: T6k2oVo4k5eVttc2X7s3YuZ3x0sMwf4K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-19_07,2022-01-19_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 adultscore=0 clxscore=1011 bulkscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201190061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 11:04:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160732

Hi Alexander,

On 1/19/22 6:40 PM, Alexander Kanavin wrote:
> Upstream review and request to address it got no reaction
> from the author, and the patches are an ongoing rebase burden,
> so if someone needs this feature, please complete
> the upstreaming work first.

Yes, we can drop it, and work upstream first if needed.

// Robert

> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>   meta/lib/oeqa/runtime/cases/logrotate.py      |  14 +-
>   .../logrotate/0001-Update-the-manual.patch    |  39 -----
>   .../logrotate/act-as-mv-when-rotate.patch     | 149 ------------------
>   .../disable-check-different-filesystems.patch |  36 -----
>   ...ogrotate_3.18.1.bb => logrotate_3.19.0.bb} |   8 +-
>   5 files changed, 9 insertions(+), 237 deletions(-)
>   delete mode 100644 meta/recipes-extended/logrotate/logrotate/0001-Update-the-manual.patch
>   delete mode 100644 meta/recipes-extended/logrotate/logrotate/act-as-mv-when-rotate.patch
>   delete mode 100644 meta/recipes-extended/logrotate/logrotate/disable-check-different-filesystems.patch
>   rename meta/recipes-extended/logrotate/{logrotate_3.18.1.bb => logrotate_3.19.0.bb} (92%)
> 
> diff --git a/meta/lib/oeqa/runtime/cases/logrotate.py b/meta/lib/oeqa/runtime/cases/logrotate.py
> index a4efcd07c0..2bff08f9da 100644
> --- a/meta/lib/oeqa/runtime/cases/logrotate.py
> +++ b/meta/lib/oeqa/runtime/cases/logrotate.py
> @@ -17,7 +17,7 @@ class LogrotateTest(OERuntimeTestCase):
>   
>       @classmethod
>       def tearDownClass(cls):
> -        cls.tc.target.run('mv -f $HOME/wtmp.oeqabak /etc/logrotate.d/wtmp && rm -rf $HOME/logrotate_dir')
> +        cls.tc.target.run('mv -f $HOME/wtmp.oeqabak /etc/logrotate.d/wtmp && rm -rf /var/log//logrotate_dir')
>           cls.tc.target.run('rm -rf /var/log/logrotate_testfile && rm -rf /etc/logrotate.d/logrotate_testfile')
>   
>       @OETestDepends(['ssh.SSHTest.test_ssh'])
> @@ -29,17 +29,17 @@ class LogrotateTest(OERuntimeTestCase):
>           msg = ('Could not create/update /var/log/wtmp with touch')
>           self.assertEqual(status, 0, msg = msg)
>   
> -        status, output = self.target.run('mkdir $HOME/logrotate_dir')
> +        status, output = self.target.run('mkdir /var/log//logrotate_dir')
>           msg = ('Could not create logrotate_dir. Output: %s' % output)
>           self.assertEqual(status, 0, msg = msg)
>   
> -        status, output = self.target.run('echo "create \n olddir $HOME/logrotate_dir \n include /etc/logrotate.d/wtmp" > /tmp/logrotate-test.conf')
> +        status, output = self.target.run('echo "create \n olddir /var/log//logrotate_dir \n include /etc/logrotate.d/wtmp" > /tmp/logrotate-test.conf')
>           msg = ('Could not write to /tmp/logrotate-test.conf')
>           self.assertEqual(status, 0, msg = msg)
>           
>           # If logrotate fails to rotate the log, view the verbose output of logrotate to see what prevented it
>           _, logrotate_output = self.target.run('logrotate -vf /tmp/logrotate-test.conf')
> -        status, _ = self.target.run('find $HOME/logrotate_dir -type f | grep wtmp.1')
> +        status, _ = self.target.run('find /var/log//logrotate_dir -type f | grep wtmp.1')
>           msg = ("logrotate did not successfully rotate the wtmp log. Output from logrotate -vf: \n%s" % (logrotate_output))
>           self.assertEqual(status, 0, msg = msg)
>          
> @@ -54,17 +54,17 @@ class LogrotateTest(OERuntimeTestCase):
>           msg = ('Could not write to /etc/logrotate.d/logrotate_testfile')
>           self.assertEqual(status, 0, msg = msg)
>   
> -        status, output = self.target.run('echo "create \n olddir $HOME/logrotate_dir \n include /etc/logrotate.d/logrotate_testfile" > /tmp/logrotate-test2.conf')
> +        status, output = self.target.run('echo "create \n olddir /var/log//logrotate_dir \n include /etc/logrotate.d/logrotate_testfile" > /tmp/logrotate-test2.conf')
>           msg = ('Could not write to /tmp/logrotate_test2.conf')
>           self.assertEqual(status, 0, msg = msg)
>   
> -        status, output = self.target.run('find $HOME/logrotate_dir -type f | grep logrotate_testfile.1')
> +        status, output = self.target.run('find /var/log//logrotate_dir -type f | grep logrotate_testfile.1')
>           msg = ('A rotated log for logrotate_testfile is already present in logrotate_dir')
>           self.assertEqual(status, 1, msg = msg)
>   
>           # If logrotate fails to rotate the log, view the verbose output of logrotate instead of just listing the files in olddir
>           _, logrotate_output = self.target.run('logrotate -vf /tmp/logrotate-test2.conf')
> -        status, _ = self.target.run('find $HOME/logrotate_dir -type f | grep logrotate_testfile.1')
> +        status, _ = self.target.run('find /var/log//logrotate_dir -type f | grep logrotate_testfile.1')
>           msg = ('logrotate did not successfully rotate the logrotate_test log. Output from logrotate -vf: \n%s' % (logrotate_output))
>           self.assertEqual(status, 0, msg = msg)
>   
> diff --git a/meta/recipes-extended/logrotate/logrotate/0001-Update-the-manual.patch b/meta/recipes-extended/logrotate/logrotate/0001-Update-the-manual.patch
> deleted file mode 100644
> index 50a3852078..0000000000
> --- a/meta/recipes-extended/logrotate/logrotate/0001-Update-the-manual.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From 3e2cfa88b6538bb0fee3d9a6e99622055d05ac4a Mon Sep 17 00:00:00 2001
> -From: Robert Yang <liezhi.yang@windriver.com>
> -Date: Tue, 17 Feb 2015 21:14:37 -0800
> -Subject: [PATCH] Update the manual
> -
> -Update the manual for rotating on different filesystems.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> -
> ----
> - logrotate.8.in | 10 ++++------
> - 1 file changed, 4 insertions(+), 6 deletions(-)
> -
> -diff --git a/logrotate.8.in b/logrotate.8.in
> -index 98fea91..70b4c44 100644
> ---- a/logrotate.8.in
> -+++ b/logrotate.8.in
> -@@ -202,12 +202,10 @@ at all (use with caution, may waste performance and disk space). Default is 0.
> -
> - .TP
> - \fBolddir \fIdirectory\fR
> --Logs are moved into \fIdirectory\fR for rotation.  The \fIdirectory\fR must be
> --on the same physical device as the log file being rotated, unless \fBcopy\fR,
> --\fBcopytruncate\fR or \fBrenamecopy\fR option is used.  The \fIdirectory\fR
> --is assumed to be relative to the directory holding the log file
> --unless an absolute path name is specified.  When this option is used all
> --old versions of the log end up in \fIdirectory\fR.  This option may be
> -+Logs are moved into \fIdirectory\fR for rotation. The \fIdirectory\fR
> -+is assumed to be relative to the directory holding the log file unless
> -+an absolute path name is specified. When this option is used all old
> -+versions of the log end up in \fIdirectory\fR. This option may be
> - overridden by the \fBnoolddir\fR option.
> -
> - .TP
> ---
> -2.24.0
> -
> diff --git a/meta/recipes-extended/logrotate/logrotate/act-as-mv-when-rotate.patch b/meta/recipes-extended/logrotate/logrotate/act-as-mv-when-rotate.patch
> deleted file mode 100644
> index 4efd471906..0000000000
> --- a/meta/recipes-extended/logrotate/logrotate/act-as-mv-when-rotate.patch
> +++ /dev/null
> @@ -1,149 +0,0 @@
> -From 17d57a2a923a4af53c8910a9999aebeab3f5d83a Mon Sep 17 00:00:00 2001
> -From: Robert Yang <liezhi.yang@windriver.com>
> -Date: Tue, 17 Feb 2015 21:08:07 -0800
> -Subject: [PATCH] Act as the "mv" command when rotate log
> -
> -Act as the "mv" command when rotate log, first rename, if failed, then
> -read and write.
> -
> -Upstream-Status: Inappropriate [needs a rework according to https://github.com/logrotate/logrotate/pull/429]
> -
> -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> -
> ----
> - logrotate.c | 71 ++++++++++++++++++++++++++++++++++++++++++++---------
> - 1 file changed, 59 insertions(+), 12 deletions(-)
> -
> -diff --git a/logrotate.c b/logrotate.c
> -index 45b3eb6..231371a 100644
> ---- a/logrotate.c
> -+++ b/logrotate.c
> -@@ -1463,6 +1463,53 @@ static int findNeedRotating(const struct logInfo *log, unsigned logNum, int forc
> -     return 0;
> - }
> -
> -+/* Act as the "mv" command, if rename failed, then read the old file and
> -+ * write to new file. The function which invokes the mvFile will use
> -+ * the strerror(errorno) to handle the error message, so we don't have
> -+ * to print the error message here */
> -+
> -+int mvFile (char *oldName, char *newName, struct logInfo *log, acl_type acl)
> -+{
> -+    struct stat sbprev;
> -+    int fd_old, fd_new, n;
> -+    char buf[BUFSIZ];
> -+
> -+    /* Do the rename first */
> -+    if (!rename(oldName, newName))
> -+        return 0;
> -+
> -+    /* If the errno is EXDEV, then read old file, write newfile and
> -+     * remove the oldfile */
> -+    if (errno == EXDEV) {
> -+        /* Open the old file to read */
> -+        if ((fd_old = open(oldName, O_RDONLY)) < 0)
> -+            return 1;
> -+
> -+        /* Create the file to write, keep the same attribute as the old file */
> -+        if (stat(oldName, &sbprev))
> -+            return 1;
> -+        else {
> -+            if ((fd_new = createOutputFile(newName,
> -+                O_WRONLY | O_CREAT | O_TRUNC, &sbprev, acl, 0)) < 0 )
> -+                return 1;
> -+        }
> -+
> -+        /* Read and write */
> -+        while ((n = read(fd_old, buf, BUFSIZ)) > 0)
> -+            if (write(fd_new, buf, n) != n)
> -+                return 1;
> -+
> -+        if ((close(fd_old) < 0) ||
> -+            removeLogFile(oldName, log) ||
> -+            (close(fd_new) < 0))
> -+            return 1;
> -+
> -+        return 0;
> -+    }
> -+
> -+    return 1;
> -+}
> -+
> - /* find the rotated file with the highest index */
> - static int findLastRotated(const struct logNames *rotNames,
> -                            const char *fileext, const char *compext)
> -@@ -1958,15 +2005,15 @@ static int prerotateSingleLog(const struct logInfo *log, unsigned logNum,
> -             }
> -
> -             message(MESS_DEBUG,
> --                    "renaming %s to %s (rotatecount %d, logstart %d, i %d), \n",
> -+                    "moving %s to %s (rotatecount %d, logstart %d, i %d), \n",
> -                     oldName, newName, rotateCount, logStart, i);
> -
> --            if (!debug && rename(oldName, newName)) {
> -+            if (!debug && mvFile(oldName, newName, log, prev_acl)) {
> -                 if (errno == ENOENT) {
> -                     message(MESS_DEBUG, "old log %s does not exist\n",
> -                             oldName);
> -                 } else {
> --                    message(MESS_ERROR, "error renaming %s to %s: %s\n",
> -+                    message(MESS_ERROR, "error moving %s to %s: %s\n",
> -                             oldName, newName, strerror(errno));
> -                     hasErrors = 1;
> -                 }
> -@@ -2051,10 +2098,10 @@ static int rotateSingleLog(const struct logInfo *log, unsigned logNum,
> -                     return 1;
> -                 }
> -
> --                message(MESS_DEBUG, "renaming %s to %s\n", log->files[logNum],
> -+                message(MESS_DEBUG, "moving %s to %s\n", log->files[logNum],
> -                         tmpFilename);
> --                if (!debug && !hasErrors && rename(log->files[logNum], tmpFilename)) {
> --                    message(MESS_ERROR, "failed to rename %s to %s: %s\n",
> -+                if (!debug && !hasErrors && mvFile(log->files[logNum], rotNames->finalName, log, prev_acl)) {
> -+                    message(MESS_ERROR, "failed to move %s to %s: %s\n",
> -                             log->files[logNum], tmpFilename,
> -                             strerror(errno));
> -                     hasErrors = 1;
> -@@ -2063,11 +2110,11 @@ static int rotateSingleLog(const struct logInfo *log, unsigned logNum,
> -                 free(tmpFilename);
> -             }
> -             else {
> --                message(MESS_DEBUG, "renaming %s to %s\n", log->files[logNum],
> -+                message(MESS_DEBUG, "moving %s to %s\n", log->files[logNum],
> -                         rotNames->finalName);
> -                 if (!debug && !hasErrors &&
> --                        rename(log->files[logNum], rotNames->finalName)) {
> --                    message(MESS_ERROR, "failed to rename %s to %s: %s\n",
> -+                        mvFile(log->files[logNum], rotNames->finalName, log, prev_acl)) {
> -+                    message(MESS_ERROR, "failed to move %s to %s: %s\n",
> -                             log->files[logNum], rotNames->finalName,
> -                             strerror(errno));
> -                     hasErrors = 1;
> -@@ -2480,7 +2527,7 @@ static int rotateLogSet(const struct logInfo *log, int force)
> -     return hasErrors;
> - }
> -
> --static int writeState(const char *stateFilename)
> -+static int writeState(struct logInfo *log, char *stateFilename)
> - {
> -     struct logState *p;
> -     FILE *f;
> -@@ -2659,7 +2706,7 @@ static int writeState(const char *stateFilename)
> -         fclose(f);
> -
> -     if (error == 0) {
> --        if (rename(tmpFilename, stateFilename)) {
> -+        if (mvFile(tmpFilename, stateFilename, log, prev_acl)) {
> -             message(MESS_ERROR, "error renaming temp state file %s to %s: %s\n",
> -                     tmpFilename, stateFilename, strerror(errno));
> -             unlink(tmpFilename);
> -@@ -3073,7 +3120,7 @@ int main(int argc, const char **argv)
> -         rc |= rotateLogSet(log, force);
> -
> -     if (!debug)
> --        rc |= writeState(stateFile);
> -+        rc |= writeState(log, stateFile);
> -
> -     return (rc != 0);
> - }
> diff --git a/meta/recipes-extended/logrotate/logrotate/disable-check-different-filesystems.patch b/meta/recipes-extended/logrotate/logrotate/disable-check-different-filesystems.patch
> deleted file mode 100644
> index d7f9a02cc8..0000000000
> --- a/meta/recipes-extended/logrotate/logrotate/disable-check-different-filesystems.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From 16c1833ade4c036b30b8761d2c4a5bd85cc65c44 Mon Sep 17 00:00:00 2001
> -From: Robert Yang <liezhi.yang@windriver.com>
> -Date: Tue, 8 Jan 2019 06:27:06 +0000
> -Subject: [PATCH] Disable the check for different filesystems
> -
> -The logrotate supports rotate log across different filesystems now, so
> -disable the check for different filesystems.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> -
> ----
> - config.c | 9 ---------
> - 1 file changed, 9 deletions(-)
> -
> -diff --git a/config.c b/config.c
> -index d2488f1..1de3745 100644
> ---- a/config.c
> -+++ b/config.c
> -@@ -1902,15 +1902,6 @@ duperror:
> -                             }
> -
> -                             free(ld);
> --
> --                            if (sb.st_dev != sb2.st_dev
> --                                    && !(newlog->flags & (LOG_FLAG_COPYTRUNCATE | LOG_FLAG_COPY | LOG_FLAG_TMPFILENAME))) {
> --                                message(MESS_ERROR,
> --                                        "%s:%d olddir %s and log file %s "
> --                                        "are on different devices\n", configFile,
> --                                        lineNum, newlog->oldDir, newlog->files[j]);
> --                                goto error;
> --                            }
> -                         }
> -                     }
> -
> diff --git a/meta/recipes-extended/logrotate/logrotate_3.18.1.bb b/meta/recipes-extended/logrotate/logrotate_3.19.0.bb
> similarity index 92%
> rename from meta/recipes-extended/logrotate/logrotate_3.18.1.bb
> rename to meta/recipes-extended/logrotate/logrotate_3.19.0.bb
> index bca47872c5..67c071833c 100644
> --- a/meta/recipes-extended/logrotate/logrotate_3.18.1.bb
> +++ b/meta/recipes-extended/logrotate/logrotate_3.19.0.bb
> @@ -13,13 +13,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>   UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
>   UPSTREAM_CHECK_REGEX = "logrotate-(?P<pver>\d+(\.\d+)+).tar"
>   
> -SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz \
> -            file://act-as-mv-when-rotate.patch \
> -            file://0001-Update-the-manual.patch \
> -            file://disable-check-different-filesystems.patch \
> -            "
> +SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz"
>   
> -SRC_URI[sha256sum] = "14a924e4804b3974e85019a9f9352c2a69726702e6656155c48bcdeace68a5dc"
> +SRC_URI[sha256sum] = "ddd5274d684c5c99ca724e8069329f343ebe376e07493d537d9effdc501214ba"
>   
>   # These CVEs are debian, gentoo or SUSE specific on the way logrotate was installed/used
>   CVE_CHECK_WHITELIST += "CVE-2011-1548 CVE-2011-1549 CVE-2011-1550"
> 

