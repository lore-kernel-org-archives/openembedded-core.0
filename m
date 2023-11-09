Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC217C4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 01:40:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.112196.1699493992500090478
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 17:39:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=SNIK9N7E;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9677a88a23=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3A8NxA2v026757
	for <openembedded-core@lists.openembedded.org>; Thu, 9 Nov 2023 01:39:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=w1DURjm955dTSX9GC6F
	atK9gGaihCEPwu03dwi0FBgY=; b=SNIK9N7EQ6e6B/29wSnWk+vxGee+3YKOtDL
	8Jd+4T0+ZjNQqa9ydRzKJqtMbxWgRrEYALwNswfMJ8QCJJAz0yT9zOxvzXDUClcR
	SozzjVQhKSEzTluJkbYVyLb71eJYyK2EpAfnRGB8a7b6P6z3kDAzKrjrAYqiCmMj
	7ll2F0pOIQyUIfGe2jhzgIjHsMLtvgo2yFU7hlUwe+9+/frTA4WyYHyQiC0rgFuu
	yNHiVMmz1dfUXjBwcSgU8b9t8nUWaJDlfgGcZr8HRTbBsxlCF/ALxSttJukrowAi
	embcdzmomXk7hpK6g5pUTPJSNqg3/vk+t4YfF7nX8uUu3f5VjXA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u7w3y1cb6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 09 Nov 2023 01:39:51 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 3A91a2B5030440
	for <openembedded-core@lists.openembedded.org>; Thu, 9 Nov 2023 01:39:51 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u7w3y1cb4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Nov 2023 01:39:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JARDfc9gVr4+ITV7jUhCHmaB2rH/W3VHz+KupQNSaY0sub7nX+Nu8Zh+HEeGane1UW2ewdGoY+hBb2RfZLx0pEm/is2eeejGgIQb+ZzelmMBK2+4se4g60s4QJwpNnNjL8lIlTb44qRieckrSgZAdxTcLiOpNBXsqvfZGWbFf2yZI7TQmCTO1znSnJH2olUAE1MYg3k0ii1M33lRGTnNqyux3tUSGlksF11XsbEexPLkcjlxBOvq6DCDtrLGBLFH/YToLHXHT8jro1vtUY/lQcdNtR6wLvVFEBbi2H16uRbqjHBs958BPA43wHl0uNewDVLeg677O4vWgbkrx6s3sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w1DURjm955dTSX9GC6FatK9gGaihCEPwu03dwi0FBgY=;
 b=kO8N/h0c4ujnaiQ6Y+MGAk0LLUVLkSaMX04p4E3dlAZ1iG/u1KCM/qpaAzdikze3BRd6meRyhpdBm/VH8E7J4qQj0GWA13FLEkvJ0zbfzkDNW9SZ5RUlWsmc04Mm7ZsY626YzFFmKGJ8uIEKpL5S4c21BSrxBI3A03Fkuay4Zpp+sCQ3E6GVlj16p6e3BW73MvheQLsTyKYSvSxTW/mIo8VkNGu3MwPNHPBOVpawOhKWgOf40WPAm305F+HKGzwRPzdQKf2Xm4PTU7BfZvzPsmxcrMZdz2kDxFEMJ7fiSqtvvTGF//QhFcDausBkGB1S0SOV6Jsb10jt89khUOjmSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Thu, 9 Nov
 2023 01:39:46 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::1452:e3f3:48cb:a128]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::1452:e3f3:48cb:a128%4]) with mapi id 15.20.6954.028; Thu, 9 Nov 2023
 01:39:46 +0000
Content-Type: multipart/alternative;
 boundary="------------ryFtTJ6ohYSKxm47Tpra0Bke"
Message-ID: <eccba9a8-e21e-4ee7-b9e8-c21ae58b52ed@windriver.com>
Date: Wed, 8 Nov 2023 20:39:42 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC 3/5] valgrind: drop context API musl patch
Content-Language: en-CA
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com
References: <20231109012555.4074359-1-Randy.MacLeod@windriver.com>
 <1795D005D4290C63.6123@lists.openembedded.org>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <1795D005D4290C63.6123@lists.openembedded.org>
X-ClientProxiedBy: BYAPR01CA0031.prod.exchangelabs.com (2603:10b6:a02:80::44)
 To DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|DS0PR11MB8205:EE_
X-MS-Office365-Filtering-Correlation-Id: f74c79e1-0c3b-4c7f-03bb-08dbe0c4c0d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0jrpqEJfKax0WuPvsNtbSd9jlN7WQIFZrM3qBETdCmv1OzqP3gQK8VBKdDsMn4KTbRvgVY4pTXI+vVVEXG9c9o3CdrXYEzxrmogZ2UcyFDNumMyAyX6k6kjIJQeUhqLP0YsZpADSJX5q2crjm6RgDpo/lkjFaCk39aev3G05BI+ascGjD86rsaYKUiB8HXlC2r89tS1cmM6SID8yVx5od1grVHrHcfMurK9a7XplEjlImQIdwJYlwPsM4ojgjj4E48gmjJms0ODtoa2NBQMBofB2gRFSlMOP6zE+a4fJWRLwWMNzK7RYvs1qxnr6VtPBNJlLNonlK2cY8ssg8B0LoCYI9d5q3MFI6jz94jqCIzIBXcU4Kt9iJJG0KedWtbM6eJGyUvHYnBRaQNc1Vwre7rTfD8mxRaoSssVIAkJS8pp6INxeSYe32MMaStmIgieBofcpg3Idw2H2Tav4k5xWIiV2fH1WZudWvONA7MPvPaMd7zB8NIgoPn0klUZ/9LWlI4V13+TbVnot6f5szcJftJLNu2d8oaMhsrXafFqGowV65Q8q43GEQDT+aHnXf0C0Lds3iExY/VC9KlSFVzppV779BxSw8PDFsRBfFSem8wVBlgqt1NmHdtmjbiJMO1JjErC7m4aF9eE9Mt3R1S5lph6R+g/6cqHPQh6ens5kJ/0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(396003)(39850400004)(346002)(366004)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(83380400001)(6486002)(966005)(6666004)(6506007)(6512007)(33964004)(53546011)(2616005)(478600001)(26005)(30864003)(41300700001)(2906002)(5660300002)(66556008)(66476007)(4326008)(66946007)(8936002)(316002)(8676002)(6916009)(36756003)(38100700002)(86362001)(31696002)(166002)(66899024)(31686004)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MGttcFVZdXdBQzJKVnlFVmlBd1k1cG5jWmxUbDJGeC9IN29DRlE2TEFvZStU?=
 =?utf-8?B?YkdXbDQyU2JMZVpmdms5Y2pEZE9IMkpMYlFETDlJQmxDYTJ1REdhYjdsczdX?=
 =?utf-8?B?MUxLV0FlRnhVcko5aEIwQnc5WGk3dmhsbEJ2TGNOYkQrK3dLZDlaRTJaRTZJ?=
 =?utf-8?B?ZU5NNGtiS2lIUkJmOThicUhheENhd01kVkpsUXhKeUY5WFA3Z1hML3ZWdHds?=
 =?utf-8?B?YlR6ckp2emhnK3QyQVpnQmt4QTVGSUd0ZkI5T1E0RTBDdk1TU3NqZ1BOL2JS?=
 =?utf-8?B?d2JLdEFqTWVnSEQxTXFtS25VTUppNitldTFiMzlBeEVEbi9tV1hWODBSQnZM?=
 =?utf-8?B?ZnUrRVp0cE1vUG9teER3L0lYN3VzRVFJdUNDR1lEdytOVEVKbEVtRUJsTzRJ?=
 =?utf-8?B?ZnNHazA0MDdOMmFsQSswYzhqSnNkUWhQSDNUb2kwTHN3aW9wekJCaU5RSVgy?=
 =?utf-8?B?Tk90ZjJlcG15RkZBYzJBV05GRTUrc3ZWQjlWYVdVSUxoVW9QMkhPT2lPTEVR?=
 =?utf-8?B?NXI4QnNmeTkwRjdsdEJJdDZmUFVNMUVWQi9YWlc1d25ieERtTjZzQ2hVbzJm?=
 =?utf-8?B?NVhlaFRyQjYvMzQ1eGlUdzNKNlFwL2VRcHhnSnpYRzBucElqS1pDYm0zQnVZ?=
 =?utf-8?B?bzlpbkRWZERxaUVQRmo4M3UySHFOTWRoOWFFcjZMSGM1TlQ3ZHdVdmFqWEtt?=
 =?utf-8?B?RjN4bk1HSi9uNFlBM3NleTYySm5CM0V3OHdsdzluUFhPZy9SY1hvYU9qZ21L?=
 =?utf-8?B?amI5bWx2aFR3RHB2ZERnYU5qZGs5Mjh2b0NjV2YxaWRjWjdsQVlNMUlZbEVa?=
 =?utf-8?B?TnJQdkdsQ3grYktabGVsNno2MTV6WG9Pa3dxR2I5VUJkUEZHS0s0UytEWmhi?=
 =?utf-8?B?MEVkSk9QbnBNTm9xMzN4cmVGU2xtRkYzWWgzdisrYWFycVRpZ1JwSmdBRkpB?=
 =?utf-8?B?SVBOLys3QUVFTUFTVEZWeUZsM2FzZ3oxbVRDZDV1NnFKSFAyaHJQaGk5Vmgv?=
 =?utf-8?B?S0FFOVJJTGRtVDVkeCt1NTdrNC9JR0pqdGNIVmNrak1yYnZvU29UT0xMVkt4?=
 =?utf-8?B?cmRuMmMvemZlSWJDNzFsOFJhU0dMbkdnUU44d0x4dXBSRVJHeHZCMFJmcFgw?=
 =?utf-8?B?RnhEaHdZYjFHV3R2S3V4Yjl3bjQ1TS9nM1Z1Q3ZUa3E2djUwQmRpYmVwVTE3?=
 =?utf-8?B?ZVg4MHMxYXFKMWYxVDlIdEE4cithNk93WWRuaitMd0tzSXQzMnFmdDh5czk5?=
 =?utf-8?B?Ymx4U0ZsQU0vYmU5eVBURnZyYzBnaVoyZ2JHcTN2M3JVbmZLR0hNLzRFU25S?=
 =?utf-8?B?NExTS2V0L1RlQkVBWnpBSGN3RWlKYlphNm9yQjRWQWNSUi9JSTA5NTRFMjJ1?=
 =?utf-8?B?YnhqSzhSUytDbEtxY0ZUcGRXczkzZDhNcktKclpSRTNQTEE4cThwTEw2S1l0?=
 =?utf-8?B?VzRFK3NDbWtoOWg5cEp5UGs4QUFhb0g5T29mbnpJK2lURjB5Qk9xYTRxSmVZ?=
 =?utf-8?B?bVJvcHZWSm9URmEwbGp3eG13eTBLNUJqNW8raUllTzlxWmoxWW5qZDUrUUhi?=
 =?utf-8?B?UmtHQWtIb2RtODJ3Q0lNa00rTGNaelE0K3d5U3lNWTFqbDlwVEFMQitraitI?=
 =?utf-8?B?ZndGK1J2Sk5WWTFmeFU2cVEzdUxheUd0QVBCOTZ5SHpwYlVCZGNQUnFNbXF1?=
 =?utf-8?B?QituTWgxMXM0QnBiclg0dUNodXA2SFZscDYvdzVJNlp3MHRtQ0dPK3Ftb2lU?=
 =?utf-8?B?bXJKcVhMa0p1WE1DTUc4QlpWYS80YWM5Z3h5VWs5R2hKRzJieGtIelBoRGlQ?=
 =?utf-8?B?S1FySUp0aURnNzQxYmIzMWMyLy9YNzhwNUlFOXVYN2pOL1k5N25GeUJkU2FJ?=
 =?utf-8?B?RW01azFJMFdXeFRCcjVBOFdUbHRKNGlBUGJncGZ0TjIwVWpNaWYxbUFveWRY?=
 =?utf-8?B?d3p5VWJYSGZ2T3RCN09wWnVMSVlMbTJpRDd2QjRoZmlDRFBMbEZPeC9ta0RJ?=
 =?utf-8?B?MitMTzQybG00MURCRXFSS0pUOVlTbUM5WlRnZ0F0TmdLZWhkaG5OY3RCeTVo?=
 =?utf-8?B?Z1p5bTFUNlZiRUp6cXc3ZUZxVmx2bHB2cU1uanpIVUJqcUtqNzBUOWNIdEhj?=
 =?utf-8?B?NmJYbXdoT1NjYzdMR2g2a3c1UjlwQnNqcWdmMGRtbWJ3RHBCVTI0VnJTeTdV?=
 =?utf-8?B?R0E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f74c79e1-0c3b-4c7f-03bb-08dbe0c4c0d3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 01:39:45.7260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T2ZuS8KOiGHXKcZeEBiXpThGpVlZEV85wogjrzhRMYttdAnuiKDM3rzUCXwIG6JjIpHn36GgVOwhWvxXtyQlAOPHLcCQQi7NfHkmba1lQbI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8205
X-Proofpoint-GUID: RyXuvowLs-HFE2Jq410yO0xQApAGVIAF
X-Proofpoint-ORIG-GUID: C0L00evszd2Jl92GIQiOvsL3ffgzunKj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-09_01,2023-11-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 mlxscore=0 spamscore=0 impostorscore=0 suspectscore=0 mlxlogscore=999
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311090011
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Nov 2023 01:40:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190373

--------------ryFtTJ6ohYSKxm47Tpra0Bke
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023-11-08 8:25 p.m., Randy MacLeod via lists.openembedded.org wrote:
> From: Randy MacLeod<Randy.MacLeod@windriver.com>
>
> Drop 002-context-APIs-are-not-available-on-musl.patch
I tested the update to 3.22 including ptests and then did a careful 
review of the patches

so that's why these 'drop' commits come after the recipe update commit.


Strangely enough, the build/ptest results didn't change as I dropped 
each patch
since upstream took a different approach to each problem and the patches
were simply not required.

I _could_ squash all these 'drop' commits into the recipe update but
I prefer to do them one at a time.

../Randy


> since this is handled in a different way by the following
> upstream commits:
>     c9e88f345 configure, drd: Only build the swapcontext test if swapcontext() is available
>     7cd4d7816 memcheck/tests/linux/stack_changes: Only run this test if setcontext() is available
> And the that tracked the error:
>     https://bugs.kde.org/show_bug.cgi?id=434775
> is closed.
>
> No regression in musl qemux86-64/kvm ptest resutls.:
>
> Signed-off-by: Randy MacLeod<Randy.MacLeod@windriver.com>
> ---
>   ...ntext-APIs-are-not-available-on-musl.patch | 92 -------------------
>   .../valgrind/valgrind_3.22.0.bb               |  1 -
>   2 files changed, 93 deletions(-)
>   delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0002-context-APIs-are-not-available-on-musl.patch
>
> diff --git a/meta/recipes-devtools/valgrind/valgrind/0002-context-APIs-are-not-available-on-musl.patch b/meta/recipes-devtools/valgrind/valgrind/0002-context-APIs-are-not-available-on-musl.patch
> deleted file mode 100644
> index 7f0e38cb95..0000000000
> --- a/meta/recipes-devtools/valgrind/valgrind/0002-context-APIs-are-not-available-on-musl.patch
> +++ /dev/null
> @@ -1,92 +0,0 @@
> -From 26c104adf6c5162572b7aa2fac89d0835b7f8f0b Mon Sep 17 00:00:00 2001
> -From: Randy MacLeod<Randy.MacLeod@windriver.com>
> -Date: Tue, 16 Oct 2018 21:27:46 -0400
> -Subject: [PATCH] context APIs are not available on musl
> -
> -Updated patch for valgrind-3.14
> -
> -Signed-off-by: Khem Raj<raj.khem@gmail.com>
> -Signed-off-by: Randy MacLeod<Randy.MacLeod@windriver.com>
> -
> -Apply same patch to drd/tests/swapcontext.c
> -for valgrind-3.17.
> -
> -Upstream-Status: Submitted [https://bugs.kde.org/show_bug.cgi?id=434775]
> -
> -Signed-off-by: Yi Fan Yu<yifan.yu@windriver.com>
> ----
> - drd/tests/swapcontext.c              | 6 ++++++
> - memcheck/tests/linux/stack_changes.c | 7 ++++++-
> - 2 files changed, 12 insertions(+), 1 deletion(-)
> -
> -diff --git a/drd/tests/swapcontext.c b/drd/tests/swapcontext.c
> -index 622c70bc5..5e72bb0f3 100644
> ---- a/drd/tests/swapcontext.c
> -+++ b/drd/tests/swapcontext.c
> -@@ -20,6 +20,7 @@
> -
> - #define STACKSIZE (PTHREAD_STACK_MIN + 4096)
> -
> -+#ifdef __GLIBC__
> - typedef struct thread_local {
> -   ucontext_t uc[3];
> -   size_t nrsw;
> -@@ -67,9 +68,11 @@ void *worker(void *data)
> -   swapcontext(&tlocal->uc[0], &tlocal->uc[1]);
> -   return NULL;
> - }
> -+#endif
> -
> - int main(int argc, char *argv[])
> - {
> -+#ifdef __GLIBC__
> -   enum { NR = 32 };
> -   thread_local_t tlocal[NR];
> -   pthread_t thread[NR];
> -@@ -94,6 +97,9 @@ int main(int argc, char *argv[])
> -
> -   for (i = 0; i < NR; i++)
> -     pthread_join(thread[i], NULL);
> -+#else
> -+    printf("libc context call APIs e.g. getcontext() are deprecated by posix\n");
> -+#endif
> -
> -   return 0;
> - }
> -diff --git a/memcheck/tests/linux/stack_changes.c b/memcheck/tests/linux/stack_changes.c
> -index 7f97b90a5..a26cb4ae6 100644
> ---- a/memcheck/tests/linux/stack_changes.c
> -+++ b/memcheck/tests/linux/stack_changes.c
> -@@ -10,6 +10,7 @@
> - // This test is checking the libc context calls (setcontext, etc.) and
> - // checks that Valgrind notices their stack changes properly.
> -
> -+#ifdef __GLIBC__
> - typedef  ucontext_t  mycontext;
> -
> - mycontext ctx1, ctx2, oldc;
> -@@ -51,9 +52,11 @@ int init_context(mycontext *uc)
> -
> -     return ret;
> - }
> -+#endif
> -
> - int main(int argc, char **argv)
> - {
> -+#ifdef __GLIBC__
> -     int c1 = init_context(&ctx1);
> -     int c2 = init_context(&ctx2);
> -
> -@@ -66,6 +69,8 @@ int main(int argc, char **argv)
> -     //free(ctx1.uc_stack.ss_sp);
> -     VALGRIND_STACK_DEREGISTER(c2);
> -     //free(ctx2.uc_stack.ss_sp);
> --
> -+#else
> -+    printf("libc context call APIs e.g. getcontext() are deprecated by posix\n");
> -+#endif
> -     return 0;
> - }
> ---
> -2.17.1
> -
> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
> index 6dcd028075..0ebf08eb28 100644
> --- a/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
> +++ b/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
> @@ -25,7 +25,6 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
>              file://valgrind-make-ld-XXX.so-strlen-intercept-optional.patch  \
>              file://0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch  \
>              file://0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch  \
> -file://0002-context-APIs-are-not-available-on-musl.patch  \
>              file://0003-correct-include-directive-path-for-config.h.patch  \
>              file://0001-fix-opcode-not-supported-on-mips32-linux.patch  \
>              file://0001-Make-local-functions-static-to-avoid-assembler-error.patch  \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190370):https://lists.openembedded.org/g/openembedded-core/message/190370
> Mute This Topic:https://lists.openembedded.org/mt/102477900/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux

--------------ryFtTJ6ohYSKxm47Tpra0Bke
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2023-11-08 8:25 p.m., Randy MacLeod
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1795D005D4290C63.6123@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a>

Drop 002-context-APIs-are-not-available-on-musl.patch</pre>
    </blockquote>
    I tested the update to 3.22 including ptests and then did a careful
    review of the patches<br>
    <p>so that's why these 'drop' commits come after the recipe update
      commit.</p>
    <br>
    Strangely enough, the build/ptest results didn't change as I dropped
    each patch<br>
    since upstream took a different approach to each problem and the
    patches<br>
    were simply not required.<br>
    <p>I _could_ squash all these 'drop' commits into the recipe update
      but <br>
      I prefer to do them one at a time. <br>
      <br>
      ../Randy<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:1795D005D4290C63.6123@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">
since this is handled in a different way by the following
upstream commits:
   c9e88f345 configure, drd: Only build the swapcontext test if swapcontext() is available
   7cd4d7816 memcheck/tests/linux/stack_changes: Only run this test if setcontext() is available
And the that tracked the error:
   <a class="moz-txt-link-freetext" href="https://bugs.kde.org/show_bug.cgi?id=434775">https://bugs.kde.org/show_bug.cgi?id=434775</a>
is closed.

No regression in musl qemux86-64/kvm ptest resutls.:

Signed-off-by: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a>
---
 ...ntext-APIs-are-not-available-on-musl.patch | 92 -------------------
 .../valgrind/valgrind_3.22.0.bb               |  1 -
 2 files changed, 93 deletions(-)
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0002-context-APIs-are-not-available-on-musl.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/0002-context-APIs-are-not-available-on-musl.patch b/meta/recipes-devtools/valgrind/valgrind/0002-context-APIs-are-not-available-on-musl.patch
deleted file mode 100644
index 7f0e38cb95..0000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0002-context-APIs-are-not-available-on-musl.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-From 26c104adf6c5162572b7aa2fac89d0835b7f8f0b Mon Sep 17 00:00:00 2001
-From: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a>
-Date: Tue, 16 Oct 2018 21:27:46 -0400
-Subject: [PATCH] context APIs are not available on musl
-
-Updated patch for valgrind-3.14
-
-Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
-Signed-off-by: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a>
-
-Apply same patch to drd/tests/swapcontext.c
-for valgrind-3.17.
-
-Upstream-Status: Submitted [<a class="moz-txt-link-freetext" href="https://bugs.kde.org/show_bug.cgi?id=434775">https://bugs.kde.org/show_bug.cgi?id=434775</a>]
-
-Signed-off-by: Yi Fan Yu <a class="moz-txt-link-rfc2396E" href="mailto:yifan.yu@windriver.com">&lt;yifan.yu@windriver.com&gt;</a>
----
- drd/tests/swapcontext.c              | 6 ++++++
- memcheck/tests/linux/stack_changes.c | 7 ++++++-
- 2 files changed, 12 insertions(+), 1 deletion(-)
-
-diff --git a/drd/tests/swapcontext.c b/drd/tests/swapcontext.c
-index 622c70bc5..5e72bb0f3 100644
---- a/drd/tests/swapcontext.c
-+++ b/drd/tests/swapcontext.c
-@@ -20,6 +20,7 @@
- 
- #define STACKSIZE (PTHREAD_STACK_MIN + 4096)
- 
-+#ifdef __GLIBC__
- typedef struct thread_local {
-   ucontext_t uc[3];
-   size_t nrsw;
-@@ -67,9 +68,11 @@ void *worker(void *data)
-   swapcontext(&amp;tlocal-&gt;uc[0], &amp;tlocal-&gt;uc[1]);
-   return NULL;
- }
-+#endif
- 
- int main(int argc, char *argv[])
- {
-+#ifdef __GLIBC__
-   enum { NR = 32 };
-   thread_local_t tlocal[NR];
-   pthread_t thread[NR];
-@@ -94,6 +97,9 @@ int main(int argc, char *argv[])
- 
-   for (i = 0; i &lt; NR; i++)
-     pthread_join(thread[i], NULL);
-+#else
-+    printf(&quot;libc context call APIs e.g. getcontext() are deprecated by posix\n&quot;);
-+#endif
- 
-   return 0;
- }
-diff --git a/memcheck/tests/linux/stack_changes.c b/memcheck/tests/linux/stack_changes.c
-index 7f97b90a5..a26cb4ae6 100644
---- a/memcheck/tests/linux/stack_changes.c
-+++ b/memcheck/tests/linux/stack_changes.c
-@@ -10,6 +10,7 @@
- // This test is checking the libc context calls (setcontext, etc.) and
- // checks that Valgrind notices their stack changes properly.
- 
-+#ifdef __GLIBC__
- typedef  ucontext_t  mycontext;
- 
- mycontext ctx1, ctx2, oldc;
-@@ -51,9 +52,11 @@ int init_context(mycontext *uc)
- 
-     return ret;
- }
-+#endif
- 
- int main(int argc, char **argv)
- {
-+#ifdef __GLIBC__
-     int c1 = init_context(&amp;ctx1);
-     int c2 = init_context(&amp;ctx2);
- 
-@@ -66,6 +69,8 @@ int main(int argc, char **argv)
-     //free(ctx1.uc_stack.ss_sp);
-     VALGRIND_STACK_DEREGISTER(c2);
-     //free(ctx2.uc_stack.ss_sp);
--
-+#else
-+    printf(&quot;libc context call APIs e.g. getcontext() are deprecated by posix\n&quot;);
-+#endif
-     return 0;
- }
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
index 6dcd028075..0ebf08eb28 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
@@ -25,7 +25,6 @@ SRC_URI = &quot;<a class="moz-txt-link-freetext" href="https://sourceware.org/pub/valgrind/valgrind-$">https://sourceware.org/pub/valgrind/valgrind-$</a>{PV}.tar.bz2 \
            <a class="moz-txt-link-freetext" href="file://valgrind-make-ld-XXX.so-strlen-intercept-optional.patch">file://valgrind-make-ld-XXX.so-strlen-intercept-optional.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch">file://0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch">file://0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://0002-context-APIs-are-not-available-on-musl.patch">file://0002-context-APIs-are-not-available-on-musl.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0003-correct-include-directive-path-for-config.h.patch">file://0003-correct-include-directive-path-for-config.h.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0001-fix-opcode-not-supported-on-mips32-linux.patch">file://0001-fix-opcode-not-supported-on-mips32-linux.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0001-Make-local-functions-static-to-avoid-assembler-error.patch">file://0001-Make-local-functions-static-to-avoid-assembler-error.patch</a> \
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#190370): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/190370">https://lists.openembedded.org/g/openembedded-core/message/190370</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/102477900/3616765">https://lists.openembedded.org/mt/102477900/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------ryFtTJ6ohYSKxm47Tpra0Bke--

