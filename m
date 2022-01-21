Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0717CC433EF
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 03:55:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.7304.1642737305092142861
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 19:55:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=CspRAdzd;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=8020d4495e=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20L3sFfb015378
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jan 2022 03:55:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=k98HAtt3oakZm0P9HCqWZXmUfpdku8bhQ8U9b0GQIDo=;
 b=CspRAdzdz/6c+IR7HbRul3mwXBqrY2XFKLOeFkBzu2d2a5QLUMWRaShM2Eh/4KZo0S2K
 RvoU9O6fgkOqjQBCWrEt66FUFwwaiA/gfGiTO7OAH4h4ruX7VGaLEJWAzk5JPDAqDlYw
 RHEc7S2vUFTwKpYwo++iJkSfTjjZZUX/JBVV2AHsqAEvIax/mULxOlWyQJzk6TNglwLM
 y/dZtUbzu3YJNoWe/8rqRsEPAhHWrajoMFUoEmQzzIwY/gnufXBfTDb1zSH75ifX4pUd
 KXro0HiT2Bdlq9zVBQI1iti+ymgmFILtTkrFrNLwDa0myMhydEHtSb2/YAy1/gdGfQjD Pg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dqhx783j4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jan 2022 03:55:03 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20L3t3G6016815
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jan 2022 03:55:03 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dqhx783j2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jan 2022 03:55:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fIxDvlunQ+2anO03oR11cML80+UiTnPqlLKzbBvDHZ5qGWvjXLLB744ilvU75ZL8+Gy53IPgeCu83NibfyVr5wqh0cBqZvsy2C4oaJ7wvGT+ZqArSfnY7cd4hUuBTIHAQycxCyzT887wu5Vc1oKDt0zp0JOkUDYopunql0eGF9VPO9t4Gv85RPDuoYPSYzwAVkGNCjJrk6C7TFgth9ldrmM9uEzoOkKHSpr/kFQH7k/Xy8YwXXSaSivRajb2X3su7isyXpcSFQeiF+Q2/HMpGh/PJStkj42JXruWpNcviGhqK9nLc9ySGGQY6/nBfwkNQoHC+dyVQTGkx2zAdm6H0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k98HAtt3oakZm0P9HCqWZXmUfpdku8bhQ8U9b0GQIDo=;
 b=OQjZE9YvTcXWYjW9vEtuIm2+OGQ8bcqRtjmPzqAc2DUq9mcJZ4DbGhvz2q6Sx0329y1CzZ9e8LotIYSc1qHhiacr8lVcRqFhzAZNOtJiXxbezZW5dsFCq4lcSPWcR9eQ/8+6Dz+caEy37vAtHL8hhaS3FUXELHgEJpCgugWuKZSjVpkEKI9vvdbITeTj5uTNmWPzUJnxzBm8EaR5FVrY9/uSfCnG4wTWw01x9WMi0LCdFAE1ZVvC9fTEdH/AGMygTBOtsUBuS7o/4vdN6PQChws6Cw309h/W3FjjB/9+5SZ2KySKwQ1TLv0xkbWAiWJ23vLq2OyUcM0DVf3IQRbjQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from BYAPR11MB2789.namprd11.prod.outlook.com (2603:10b6:a02:cc::11)
 by CY4PR11MB1688.namprd11.prod.outlook.com (2603:10b6:903:25::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Fri, 21 Jan
 2022 03:55:02 +0000
Received: from BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::5cb5:e426:2e48:17ed]) by BYAPR11MB2789.namprd11.prod.outlook.com
 ([fe80::5cb5:e426:2e48:17ed%5]) with mapi id 15.20.4909.010; Fri, 21 Jan 2022
 03:55:02 +0000
Subject: Re: [OE-core] [PATCH 1/1] bitbake.conf: Add BB_TASK_NETWORK to enable
 task network globally
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: "jupiter.hce@gmail.com" <jupiter.hce@gmail.com>
References: <cover.1642662353.git.liezhi.yang@windriver.com>
 <bb3ae8dbd929eac83394be5fe3284dd79c895e44.1642662353.git.liezhi.yang@windriver.com>
 <b42e9f3bde0a4126bde3e4969412ee1b@axis.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <73f2cb78-a125-aff5-6cba-5fc36b5b799d@windriver.com>
Date: Fri, 21 Jan 2022 11:54:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <b42e9f3bde0a4126bde3e4969412ee1b@axis.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HK2PR02CA0194.apcprd02.prod.outlook.com
 (2603:1096:201:21::30) To BYAPR11MB2789.namprd11.prod.outlook.com
 (2603:10b6:a02:cc::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9dc2df77-722c-4d42-2b36-08d9dc91ccf3
X-MS-TrafficTypeDiagnostic: CY4PR11MB1688:EE_
X-Microsoft-Antispam-PRVS: 
	<CY4PR11MB16887F19DC0057080B6A1FE7FF5B9@CY4PR11MB1688.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XcLJQ4HELakQJmjN7NnfD+/+XEzIyfTYbJKvhGl7+5AAltA5Gr8xH1lrSIGy1dtnZJ057kkNs/2qnjrlJNzosFlugI2IuF7JGHkWOmuXdAmb3deLzjarXSSPb31BsQ33nG/3U1cXlDKtuBxQwT7fMxPVVEFPIxUkV0mc3TxTZxJB9GhH0GIwRI2MDpxtOsyKjEPOU+DQFMLZ9EQe6d3ig26jng5GsgtI40DWABJZxmKG55znKg9f2sSLVOMftA9QDvRvDwjAgqE1szVi0c8w8dz/yyz6EpOiZaXHzQabwxyhiDuvYwsMFyZzN+bplLAqBRhq0i/ybkLfA288yeuAx5E979+iWU6wi9yaqMreBOFln5l23P1+dWRjlAfOfI6DIR1aWbLtUpibyyXsHF0ZA2EVGBn8QgGZJekiqZK33MRC8FEVwdUX7xTeRYndSxU+FmswiQYohVG0m/xVpwcDS0Rhj2+qg+MsqNHjLu34MVGJ1mGvxpePeYFqhpQiTNzOPC5329rBjimYix1S+Vq7KhbcjuZ5dVRcHSDsQL4NDn0XinTl3dlvnag2n9CNGx6XeEIOHkTrznJdZZaGsHGddm0YOZxw+kwQh4YqC9VyzAzf7B/KmOk9dwy9Fdtb53JhPvIcYrE9cNd41MD+TBvpr3rsJJizaEMoJl0sZc/piJJMiJ6ej8+7SPutFIS8FcYRfXcQApUZA43NGE02GRcuc9TS0IKh3AaQTxjpQMLFYyOqJYGt22euh9BPsJa45mbTEWlYsihxraA67IYzfJRN0Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2789.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(66476007)(6512007)(66946007)(8936002)(6486002)(31686004)(53546011)(2906002)(2616005)(86362001)(83380400001)(52116002)(66556008)(6666004)(36756003)(8676002)(4326008)(5660300002)(38350700002)(38100700002)(110136005)(186003)(508600001)(6506007)(26005)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VFZFYTMra2F6VnNCL2k5UlhzbTVEVEw2NXVWeTNqQVRlQVlpemoxYTdSdDVV?=
 =?utf-8?B?UTBZTWV4T2hWTVNFNnpEV3psK0RtUWgxS3BaMnZ5KzNLQm04bldmbkVoc1pO?=
 =?utf-8?B?eTl6ckFncm92c1RVaGpIQUpKbjhhK1JVTGtKUStIOTB3V3JvWnAzVlFJQmlP?=
 =?utf-8?B?QjFFQjR3cWx4bHMxdTRaMnBDK2pHS0VHUkY3L0IxR1Y4eFVTV3p0VjU5WXVm?=
 =?utf-8?B?cGtITWh4SFIwS0dqQ2RXcStrRyt0MmVvOVlPek81VEYzbXEwbWRjaURmZUcv?=
 =?utf-8?B?QnVVZ3h3UWx2bThaYzdoUUpocXV5cTNTZUxoZkVaOXhyNnlpdHVTNWcyb3h3?=
 =?utf-8?B?WmRIRlRraE1rOFdJVDg4d1dnRkZYeFN1YldhbXZQNGtyS05lRmhMVUplSllz?=
 =?utf-8?B?Tk1EMUJsNjVIejhudnJhTWp2a1VUaEduQlVXcDRWcEtYWmRhd3EwWG1wMENj?=
 =?utf-8?B?TENROTdSbENJeXhUdHdMdm9oRlRMeTQyUDhoMnUvVU5NNWdIMEl6dkQrRzdU?=
 =?utf-8?B?V3FIRXB0MnVwczM0SU5yamdyaFBoM3A2Rkl6U2szT3FUS2xZT0xnOE94eUFN?=
 =?utf-8?B?eE5Id2RzMUdFZVJIbU1CNU4vdnZYbkxSSzRjUmVnL3ArRXB1Qkp6WkowOHlX?=
 =?utf-8?B?WU1pNVpCVFRPb3g3dDVLR1hRcmFHRFl4Ky9RUUZiVjRnRi9CaFJHamdNWWE5?=
 =?utf-8?B?NVJVUnZvU0hzRWdqelF2dGN5NmtXS3JGU0hQd1J0UW4zWDhhN1lsaTEvOHBV?=
 =?utf-8?B?NDZjaGN4OXZiUm8vMUhqYWU0NnovNjRuTU03UEZLQ09UNWJRd2YycDhFZTgy?=
 =?utf-8?B?eC84UlZhOWFCaVgvNTNLeXBwd1g1Y00xbi9aSFBCd2NYT0FWUzJWT3lEVjVx?=
 =?utf-8?B?NWNEb0N4TGZmdkVhTC9QVG1PN0M3OW9aU3FIc2dWbG1HMG5nd1NaTmRITDg3?=
 =?utf-8?B?TjRFek5EUkJsVmw2YlJVQXZhWDZpREdTTE5QOFNkQTBkRkhYN29IN0ErZWFl?=
 =?utf-8?B?Ykx4ckZJZUg1K1c3Skw0b1JaSjZIU1JXRzZqbi94KzBhSStNTzg1NGN3Z1hN?=
 =?utf-8?B?TVpyblpHOW1VM1ZFVlR3eGVBZ29VaUhkeXI5WTVzcDRXVkdaOVQvcVJLeDhw?=
 =?utf-8?B?YVVwOHY5eHd6NER3N0dBb0ZQYThEWXk2WHlqZVJRVm5HUUo1RklLd3ZubkZj?=
 =?utf-8?B?NGhTNitYWU5TVzc2MHQ5elpSdnVWTWxVK3BBTTFtUWxsSnhzdjl5SFB2d3Fh?=
 =?utf-8?B?MUwyOFVPc1hpYUZUUVZkZmtpMTRRNlJ1THV4OHlZbnlIdVAwNW5wcE5MSzZR?=
 =?utf-8?B?SWpza05UcER0dkdFc0E1UHIwUDcrY01uSTM3MGNEbUdLbStWMFN4Wjg0UG13?=
 =?utf-8?B?YUNxMGg4aGM1ZHBad2VCQmZFcGwyMml0SDFMaWNjbVRpWmpvam9DRkxUTkdm?=
 =?utf-8?B?THZoZTF1bHZJem5CZVF5SjVqU2tKSldNSE9RTmVBdVMxeXI3cHlZVHdpbnZv?=
 =?utf-8?B?NjRJL0owVFlOQnhDWUhmRzZOZUpQdDFuK1VFYzJtWGZ5cnZuSzRmYkJnbHZ1?=
 =?utf-8?B?NVdvWXg5M3pHSGlEcm1DYk82NEJKN05BMUI0MU1PVlJkSWgwZjc5emVjcVN2?=
 =?utf-8?B?S1ArU3BNVGxOd3dabG01SlNlcjVWcjk3NEVmSnRPNjJUUDRERWZ3azA1OE5i?=
 =?utf-8?B?VFl6QTJMeWttd3loZThQZTF4UHZ3ci9QQmtWWktPNUgraFlmb1c1RjZWWEFm?=
 =?utf-8?B?SGlMU2E5LzByNmwvM05MYnFPWTNFSG9RaXRBTU9hMkcvb3ora0tPQ29JUDIx?=
 =?utf-8?B?ajRVbmNKM2Y1aFFGUy9FWTJtYmU3cFpCVFNRakhNQ1dmQVpCK0VjeUNVUzF0?=
 =?utf-8?B?NzRRTUx3SDBYMG53VFFtS3Bvc2JtVkVGTEwwZHpUdjJQVyt3YjIybDJodDVM?=
 =?utf-8?B?OEhBaVRldEl0SHdTNndyUEhPNTBvWENPRmFUblh3d1E1UlJUWHdSRy9GNjlq?=
 =?utf-8?B?WEM3b0JIand2bFRRQm9jT1RJZTVpclloamdUWHFEWE9tTjMrcGVNNDNhVWJP?=
 =?utf-8?B?YXZTTGNnQ3h0dHVDdnZPQ3NXUVhwSyt1Q3ZVWU01TitoVzJwUHR2SFhhb3Nt?=
 =?utf-8?B?NFduSXhWM3lvLzFLV1lldGJYRnFBeWM2d3BsdUxsT2p6bmozUXZubTRQNUFi?=
 =?utf-8?B?bjdPejFicjRDdzZGNWtLeTJxYlNqalBvckQ5anRtRlpTb1ZDQ1YvS0tmR0pn?=
 =?utf-8?B?UE5mNmtsWndaSy9zNnZHUytwQnN3PT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9dc2df77-722c-4d42-2b36-08d9dc91ccf3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2789.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2022 03:55:01.9148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 LgYGvGXmveY+DyGwujucF8vEIvlNCgsrr3Z+c3A0mQL0WNqxQYwSMuPMKnKyXQi8nRuNX4tbdC2+jxRyfX8pgxapY9oyrwZlHSphlJEUDSI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1688
X-Proofpoint-ORIG-GUID: A2fYsyw1hJsbcLPbPYhS31BNVNYe8-eB
X-Proofpoint-GUID: tILOQKB3cJhgTWianp_jNpeBmanJ4U7x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-21_01,2022-01-20_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 adultscore=0 phishscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201210025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jan 2022 03:55:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160813



On 1/20/22 9:47 PM, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-
>> core@lists.openembedded.org> On Behalf Of Robert Yang
>> Sent: den 20 januari 2022 08:09
>> To: openembedded-core@lists.openembedded.org
>> Cc: jupiter.hce@gmail.com
>> Subject: [OE-core] [PATCH 1/1] bitbake.conf: Add BB_TASK_NETWORK to enable
>> task network globally
>>
>> The NIS or icecc can't work when task network is dissable, add
>> BB_TASK_NETWORK to enable network globally for such exceptions.
>>
>> Note, enable nscd on the build machine might be a solution, but that isn't
>> reliable since it depends on whether the network function has been cached
>> or not.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/classes/icecc.bbclass |  2 ++
>>   meta/conf/bitbake.conf     |  3 +++
>>   meta/lib/oe/utils.py       | 15 +++++++++++++++
>>   3 files changed, 20 insertions(+)
>>
>> diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
>> index 794e9930ad9..c39c86458a4 100644
>> --- a/meta/classes/icecc.bbclass
>> +++ b/meta/classes/icecc.bbclass
>> @@ -41,6 +41,8 @@ ICECC_ENV_EXEC ?= "${STAGING_BINDIR_NATIVE}/icecc-create-env"
>>
>>   HOSTTOOLS_NONFATAL += "icecc patchelf"
>>
>> +BB_TASK_NETWORK ? = "1"
>> +
>>   # This version can be incremented when changes are made to the environment that
>>   # invalidate the version on the compile nodes. Changing it will cause a new
>>   # environment to be created.
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index fba99e8f0cd..bf5bcd55519 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -946,3 +946,6 @@ MULTILIB_VARIANTS ??= ""
>>   # what it would be anyway if the signature generator (e.g. OEEquivHash)
>> doesn't
>>   # support unihashes.
>>   BB_UNIHASH ?= "${BB_TASKHASH}"
>> +
>> +# Enable task network for remote user such as NIS.
>> +BB_TASK_NETWORK ??= "${@['1', '0'][oe.utils.is_local_uid()]}"
> 
> I think this is more readable:
> 
> BB_TASK_NETWORK ??= "${@0 if oe.utils.is_local_uid() else 1}"
> 
> An even more readable solution would be to rename the function to
> is_nonlocal_uid() and make it return the inverse of what it returns
> now.
> 
> You probably also want to change it to use := instead of ??= so that
> /etc/passwd is only parsed once. This might require to introduce
> another variable:
> 
> UID_IS_NONLOCAL := "${@0 if oe.utils.is_local_uid() else 1}"
> BB_TASK_NETWORK ??= "${UID_IS_NONLOCAL}"


We may not need this any more since NIS seems that is the only case which 
doesn't work, and can't be fixed (or not easy to fix) by set network per task.

// Robert

> 
>> diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
>> index 136650e6f74..c21f034aafc 100644
>> --- a/meta/lib/oe/utils.py
>> +++ b/meta/lib/oe/utils.py
>> @@ -595,3 +595,18 @@ def directory_size(root, blocksize=4096):
>>           total += sum(roundup(getsize(os.path.join(root, name))) for name in files)
>>           total += roundup(getsize(root))
>>       return total
>> +
>> +def is_local_uid(uid=''):
>> +    """
>> +    Check whether uid is a local one or not.
>> +    Can't use pwd module since it gets all UIDs, not local ones only.
>> +    """
>> +    if not uid:
>> +        uid = os.getuid()
>> +    local_uids = set()
>> +    with open('/etc/passwd', 'r') as f:
>> +        for line in f.readlines():
>> +            if not ':' in line:
>> +                continue
>> +            local_uids.add(line.split(':')[2])
>> +    return uid in local_uids
>> --
>> 2.31.1
> 
> //Peter
> 

