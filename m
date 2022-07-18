Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82977C43334
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 06:42:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.24298.1658126564791107616
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 23:42:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=dPwNGSGA;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=4198d03791=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 26I5weRJ029573
	for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 23:42:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : references : cc : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=iMCgl5LDwcn+qWx5VQnqleyvqzzje4ZZVYUz+4oCB18=;
 b=dPwNGSGA+nJkQGHmwCYtG+5+sy8vcqqv6BxWSWNyfHDgbkuIGnXBqy6aD7Af9g+cDK71
 TQ7oJ/6Os+GlwmhRKvMQrVM61aOenNPDpjPd6uyvTDZyjj4FC1INbgXmHH7S0vOpiEcY
 atj0jsKRTQjJOaLs34eVR0F2XAfQ/F2aeFAOPSPfZ2khEg74G9m/auRjn1viVekLrTsy
 1JEu7I7BOWNkUFyrmMhAkX2SvfbHmn24Ic1ZfRrpQWRpOPj6FcMEZFHEFx+d/YXuQFtP
 0bH9O4DpWH6jsZ+7zNQt6IxGDwryQUf98RqRNT5lGOXejke6hEvqcYbULbUo+ZgpNVDw Aw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hbvukrxx6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 23:42:44 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26I6gha8027319
	for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 23:42:43 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hbvukrxx5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 17 Jul 2022 23:42:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X2DNS0IfVsSKGY51VChlh2CEC2hEwu1BcrYkfZJXnJy0j6tRevBsN3Q++UkVEEZ74m3k/jlUxTRNNcQklsdB8EDHxjXOMQ33l97BBQuaV2SeWAgcIPQ71071bOB2bEllT5AUlRjKES7j/ovzY9c/RQ1bQQ5HRzNgD8/G+wOTYSkidJDTlg5XGTSnhVnv59Vgoq0RzjjM/TeXPwJYZsBP+BC3ViM9nWQ/CRIu5ppnXunIWu5VpGA95TaevGWzKzda7jxhv2/S+7Xqf0mSUvxz9xeTIhK/UttfKpnuh4MuM667JRzGXSpQrnTX5shNR444bEWYOZoaJJX7yK14Rzg6XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iMCgl5LDwcn+qWx5VQnqleyvqzzje4ZZVYUz+4oCB18=;
 b=HCrtixj/NCq5BSIPlcp/BTPwReGWAPvyqrnTI8hbdwbBNI8KB85miPipyZTjAsypk19eJk6ZY3q/VyuxYXCFts7YCgoAjv3kpGbZpVY7KQJGnLjjgoz8/2v18s8hyeg/h+uoUpbsenXu6iY0UZChNQwM0cQT61iKVIRtc83lqBbaWtM/+dSGZ4fH9hDUITFpU2QZBX7XK2dnRgZpyPfb/ubgtp4HmXTakXsyd5kaKX6kiUwfepLqY9VZ5wLB0IfBZiOuwwitVIiaiwEbQbwei1EKzuhGLkC+0GXkLt2ormfPyRgZcHi4qf///coqY7Wi+G2If08scm7zGK85RUVGHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by BN6PR11MB1380.namprd11.prod.outlook.com (2603:10b6:404:3c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.23; Mon, 18 Jul
 2022 06:42:40 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::6d87:33b1:3f5f:55f7]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::6d87:33b1:3f5f:55f7%5]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 06:42:40 +0000
Message-ID: <f9a77fc2-4ecd-2481-b5eb-71ef67d79d0a@windriver.com>
Date: Mon, 18 Jul 2022 14:42:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] [OE-core] [PATCH] bind: upgrade 9.18.2 -> 9.18.3
Content-Language: en-US
To: Steve Sakoman <steve@sakoman.com>
References: <1653381225-6080-1-git-send-email-wangmy@fujitsu.com>
Cc: wangmy <wangmy@fujitsu.com>,
        openembedded-core <openembedded-core@lists.openembedded.org>
From: Yi Zhao <yi.zhao@windriver.com>
In-Reply-To: <1653381225-6080-1-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0181.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::13) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03075307-b325-41f5-b2ae-08da6888b605
X-MS-TrafficTypeDiagnostic: BN6PR11MB1380:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0wdZrjF5sOMKX5HjeIRWhHQJKl4VimMCnPYKMG6mFEn9+A73O1n5jjDjvmFE9h+tkJQUuQBLGft6vmMT5YtVH69YXfGYEMeOVL87eO1gUa965NHd3WiV/ZGxPb947+ZfcPJYXSDg/trnuYfY63duq2MPRAjEuFqwkOOOFtwp/OVo9Y4YaZRo1+5/qlyKXOinsdADerI3/tkgHhvxERLNgGB6tbZnDDI1DxfRWDVGKowF5xgdp3N2gM19VXg15VK68rpHAn8QFVNcrG1v/B65268apK3Ptfo3Czw+QvEby1fAo9ya9ff6WRljIgV5BmkPn0wbOBkl+8NAH9lgRpyfbJlARf0GZE5uMEuAejvppbgun8J2TIE5i+Q+lHoMCQPR4Xg37oaiwol2LQfLSS/sIUJmh5qn0qZ8uPhx/QE0ixdb0CtrfAWAC+uBNa4fSziUcSnEwUyeFb9/4twUrWPmwDGt1+ewVhPmIkl7qkpAdOrxARNGp6W00QFxvSWFBJ7F7jGi3iKVSDWx8RPDTIhDZKD9KlN9QqRjk213R9QcIaYtbYaTGOO7pmAqFuOSifOQJzjRTB049mUsqHYKcymjBaxg9WrTZ0dD/9QdSZUz4buGs17o89Q3B6cWGgAyZq7tmnf+17HjmyzI1b22+C//L08g6cUjxhPVqFOGdxhg4JSLIFF+e4WKgVJ+bXWbjpdmdRZnw4eNW+bbPK7P4NMsLM0GADY9xZ1H1ItSy0l+NUc5FPjk5051dsoibOprktzLlM8noicqhWjrNS6YjY5ktRlyr84N/wwRFUEy2OfzDcl1X53KOcCC9sb6egbLVEIPBcfe00oP70yWuOMbO4s3zGMq356EYe+Wur6v2Dsk7j0lsqoDSDaj0bD2QwnLjQVXOON9VGgr+6Ks7swYkFMExw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39840400004)(376002)(346002)(366004)(136003)(396003)(2616005)(6512007)(5660300002)(53546011)(8936002)(478600001)(41300700001)(26005)(2906002)(6506007)(31696002)(6486002)(316002)(66556008)(44832011)(4326008)(38100700002)(186003)(83380400001)(86362001)(6666004)(966005)(8676002)(6916009)(66946007)(36756003)(54906003)(66476007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?K2NJWUY0RkViTjFVdnV6cTJvVGdiN2VzRHppdzh6N2w3elh3N3VaWDA1ck1v?=
 =?utf-8?B?NzBDclFQYzJzVndJZ0tYZFVpMnpDT3BHY3VKYklPcDhSeHVLWmh1cEdHM2l5?=
 =?utf-8?B?bHZwVy9RVEk2bFVUVnBSK3p4VjNGdjdyQ0dhRWpOT0FJZVdJNjNrZGoxSHZp?=
 =?utf-8?B?L0JDTmNhaGMyZm56a1NaTHJCSmRXaERRYWp3KzNxMTJpRGxtZFBYd2NDUWV3?=
 =?utf-8?B?RmlIN0w0TElxc2ZuVmZVRi9wbTUzTTZtakkreTNHN2hZSVdHM1VkaXNEdFNY?=
 =?utf-8?B?U0tQTTVNQ3N2aFdHbHhLVFdCSkRNVGlMZkIySHRqQmdnTmd3amxWcmduZ3RS?=
 =?utf-8?B?LzNLRElCL3liRTN1N0dmcTJhc2s3VWw1dzlEV2xJNlRURU5zZ2l0ZTQvb2xY?=
 =?utf-8?B?b1ZTNmpPaHRYV256dDZQbVJmTjNNSlIxSFh5d3pWWXRCaDdUbUFJSUl1T1VO?=
 =?utf-8?B?UlN0MzRWRHNnN090ZjR0UllLekJMWDBPOGczTTF3dUpRNFZoS20zVTZOYkYx?=
 =?utf-8?B?TW9kYldqVG40dW9aYm9mNisxNVIyMno3V2oreFF5bG9OYTdpM1ZnaDZ1YndS?=
 =?utf-8?B?WENXU21hY0xMVnllaEdwc2tjRDZGY2ZEVVA3dVk5RmZTRGNyb01oZjE4VlNt?=
 =?utf-8?B?NWtBL09uQTQ2Tm9PRTJBQzRFSUd0eGxDYUpFd29hcnZWV3JTeDA4eDVGVVBF?=
 =?utf-8?B?MDFWYVJrMFVQTHdVZzQ2VGJQeGQrTG1LMklYRHJtVzI5UHB1NGpWRGdNZG81?=
 =?utf-8?B?UjFkeCs4SnFWMDB1cWx4emVneTJlYlJOUTVoT2RMMWt4cGViMk5HNUJuakxL?=
 =?utf-8?B?dzRUdkhnT1E3VGdwWTc0ZzVGVmtOa1RnSjRlbkhqQUxocXJabUNBa2J0bER5?=
 =?utf-8?B?aHlvblRBT3lnZ0o3TTIxYUtDcVJmQ3RkOXArN2E0TTllckU2dVcrbk90Tzc5?=
 =?utf-8?B?Nk1DM1FSdlpSOGovSzRmYklFVzlERDRRN3J1eC8yMGpkZXMyS1krSHFrWmdM?=
 =?utf-8?B?b3YzdngxT3V2NTFxTXQvUDFQZUp6bWlWbVY0YUFmQWp6c3ZEMHBIOEgrdTMz?=
 =?utf-8?B?SEVqVGRZdk1PZk9EK2tvRmJsdS8vc2ZWMzk0VWY3MWJ5YnZmK0krL3JTcGhJ?=
 =?utf-8?B?c3RXcW1GRk5iUTZNV0UvYW1ORkJQMEV0Nk9KRnVnYnRqSHdsS0RXUDFtbUNZ?=
 =?utf-8?B?a3NrZFBWdUR6M2ZmKy9taVRVSHBCSWpCdmQwNVh5UUhQclR6YzYxcDMxbndD?=
 =?utf-8?B?SFhLNnpzNjlxdGFCdi9zc29YMEhXQjVTQnJvbEtiVTVJNldOenhGV1Q4OHBU?=
 =?utf-8?B?dFBiNHEwL2NzUmZuSU9ValVqTFFRVWI2MUVPUld1ekZYUEI5U05BMEdoQVRE?=
 =?utf-8?B?bkRocDBGeWxVeUIwbm53MTRxMWVjWXgzUElISjFISmtrallFNWZYNndwNm9u?=
 =?utf-8?B?YTJtek50U1R4YkJ1QjcvUTFHbmdFaWM2OGdmWWdWeEIzQTYvSDQzbEhjRUg0?=
 =?utf-8?B?MDlJTUo1U0doMDhaRHZqbzRaS1VNcGh0WGxETzlYRTc4dG0veERjdVhXcGdt?=
 =?utf-8?B?ek5KaDZCdmhoM0VZRzZldStSQXpheGVRVWZJMVo3SkErMHVycU1LWHFIN3Iw?=
 =?utf-8?B?UHhqWnBqNE1iMHFuVk43NWxablF6S1FwR3puVXdFc0Q4Ukc2NXdRbzdCdElx?=
 =?utf-8?B?VVQ3REtPWGJPYTFBeit4aktpSm54ZGpoeWRFeVI2Y0FacnhrN0ErQ0FCQThk?=
 =?utf-8?B?UWsvWWpnbHlDY1hpODA0ZmNPaTkrY0JHRUwyeVZnejY5K29qRE56ZHU3OVB0?=
 =?utf-8?B?anYwUFN5OWVGY1JYMi9IOWIrWk8zS0tBUktqbEtScG03VDU1MGZIRVZLak5j?=
 =?utf-8?B?RStBUTZhMHBVWUFvWnByZWNwSmZoZTVEQlozYUlST08xRFdBVEFoR0oxUC9Y?=
 =?utf-8?B?clBXSnc1TExZbWE3RXJpcVpXVHZuazJGcnZiT0pNVG1EZzhnZ3VhWmtrWWpo?=
 =?utf-8?B?b0o3aElwNGN6a2F1SHJFKzlTUzl3OE1vdWRDa0JjUy8ydEJ1eTViQ0ZqZHMw?=
 =?utf-8?B?cGtkNnJGSEI4Mjc1VjN0S3pxeVR4ZXJtNDVycm5tYWl6RnRrZ3dyYitidXJC?=
 =?utf-8?Q?3LIHu8HwuzaNmFGKQuFD/u/PI?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 03075307-b325-41f5-b2ae-08da6888b605
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 06:42:40.6263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 EegN0jpfeiZL7JY2mgPq7WT6UZfU4jHgsVw4FfA67MKVBDzKebFX+fL7SJ+FXlM+JwDVAx+K5HnAc7Gu9rQLMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1380
X-Proofpoint-GUID: biiEcobp5Z23t6CgW9jpMFpyFynkHoyA
X-Proofpoint-ORIG-GUID: D0Id5oKttsL0W2sKYGtx_el6BQHqaoHO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-18_04,2022-07-15_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 clxscore=1011 malwarescore=0 mlxscore=0
 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207180027
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 06:42:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168192

Hi Steve,


On 5/24/22 16:33, wangmy wrote:
> Changelog:
> ==========
> [security]
>   Fix a crash in DNS-over-HTTPS (DoH) code caused by
>   premature TLS stream socket object deletion.
>   (CVE-2022-1183) [GL #3216]


There is a CVE fix in this minor update. Is there any plan to backport 
it to kirkstone ?


Thanks,

Yi


>
> [bug]
>   RPZ NSIP and NSDNAME rule processing didn't handle stub
>   and static-stub zones at or above the query name.  This
>   has now been addressed. [GL #3232]
>   Fixed a deadlock that could occur if an rndc
>   connection arrived during the shutdown of network
>   interfaces. [GL #3272]
>
>   Refactor the fctx_done() function to set fctx to
>   NULL after detaching, so that reference counting
>   errors will be easier to avoid. [GL #2969]
>
>   udp_recv() in dispatch could trigger an INSIST when the
>   callback's result indicated success but the response
>   was canceled in the meantime. [GL #3300]
>
>   Work around a jemalloc quirk which could trigger an
>   out-of-memory condition in named over time. [GL #3287]
>
>   If there was a pending negative cache DS entry,
>   validations depending upon it could fail. [GL #3279]
>
>   dig returned a 0 exit status on UDP connection failure.
>   [GL #3235]
>
>   Fix an assertion failure when using dig with +nssearch
>   and +tcp options by starting the next query in the
>   send_done() callback (like in the UDP mode) instead
>   of doing that recursively in start_tcp(). Also
>   ensure that queries interrupted while connecting
>   are detached properly. [GL #3144]
>
>   Don't remove CDS/CDNSKEY DELETE records on zone sign
>   when using 'auto-dnssec maintain;'. [GL #2931]
>
> [contrib]
>   Avoid name space collision in dlz modules by prefixing
>   functions with 'dlz_'. [GL !5778]
>
>   dlz: Add FALLTHROUGH and UNREACHABLE macros. [GL #3306]
>
> [func]
>   Add new named command-line option -C to print built-in
>   defaults. [GL #1326]
>
>   Introduce the concept of broken catalog zones described
>   in the DNS catalog zones draft version 5 document.
>   [GL #3224]
>
>   Add DNS Extended Errors when stale answers are returned
>   from cache. [GL #2267]
>
>   Implement support for catalog zones change of ownership
>   (coo) mechanism described in the DNS catalog zones draft
>   version 5 document. [GL #3223]
>
>   Implement support for catalog zones options new syntax
>   based on catalog zones custom properties with "ext"
>   suffix described in the DNS catalog zones draft version
>   5 document. [GL #3222]
>
>   Implement reference counting for TLS contexts and
>   allow reloading of TLS certificates on reconfiguration
>   without destroying the underlying TCP listener sockets
>   for TLS-based DNS transports. [GL #3122]
>   Add support for remote TLS certificates
>   verification, both to BIND and dig, making it possible
>   to implement Strict and Mutual TLS authentication,
>   as described in RFC 9103, Section 9.3. [GL #3163]
>
> [cleanup]
>   Remove use of exclusive mode in ns_interfacemgr in
>   favor of rwlocked access to localhost and localnets
>   members of dns_aclenv_t structure. [GL #3229]
>
>   Remove the task exclusive mode use in ns_clientmgr.
>   [GL #3230]
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>   .../0001-avoid-start-failure-with-bind-user.patch               | 0
>   .../0001-named-lwresd-V-and-start-log-hide-build-options.patch  | 0
>   .../bind-ensure-searching-for-json-headers-searches-sysr.patch  | 0
>   .../bind/{bind-9.18.2 => bind-9.18.3}/bind9                     | 0
>   .../bind/{bind-9.18.2 => bind-9.18.3}/conf.patch                | 0
>   .../bind/{bind-9.18.2 => bind-9.18.3}/generate-rndc-key.sh      | 0
>   .../init.d-add-support-for-read-only-rootfs.patch               | 0
>   .../make-etc-initd-bind-stop-work.patch                         | 0
>   .../bind/{bind-9.18.2 => bind-9.18.3}/named.service             | 0
>   .../bind/{bind_9.18.2.bb => bind_9.18.3.bb}                     | 2 +-
>   10 files changed, 1 insertion(+), 1 deletion(-)
>   rename meta/recipes-connectivity/bind/{bind-9.18.2 => bind-9.18.3}/0001-avoid-start-failure-with-bind-user.patch (100%)
>   rename meta/recipes-connectivity/bind/{bind-9.18.2 => bind-9.18.3}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
>   rename meta/recipes-connectivity/bind/{bind-9.18.2 => bind-9.18.3}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
>   rename meta/recipes-connectivity/bind/{bind-9.18.2 => bind-9.18.3}/bind9 (100%)
>   rename meta/recipes-connectivity/bind/{bind-9.18.2 => bind-9.18.3}/conf.patch (100%)
>   rename meta/recipes-connectivity/bind/{bind-9.18.2 => bind-9.18.3}/generate-rndc-key.sh (100%)
>   rename meta/recipes-connectivity/bind/{bind-9.18.2 => bind-9.18.3}/init.d-add-support-for-read-only-rootfs.patch (100%)
>   rename meta/recipes-connectivity/bind/{bind-9.18.2 => bind-9.18.3}/make-etc-initd-bind-stop-work.patch (100%)
>   rename meta/recipes-connectivity/bind/{bind-9.18.2 => bind-9.18.3}/named.service (100%)
>   rename meta/recipes-connectivity/bind/{bind_9.18.2.bb => bind_9.18.3.bb} (98%)
>
> diff --git a/meta/recipes-connectivity/bind/bind-9.18.2/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.18.3/0001-avoid-start-failure-with-bind-user.patch
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.18.2/0001-avoid-start-failure-with-bind-user.patch
> rename to meta/recipes-connectivity/bind/bind-9.18.3/0001-avoid-start-failure-with-bind-user.patch
> diff --git a/meta/recipes-connectivity/bind/bind-9.18.2/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.18.3/0001-named-lwresd-V-and-start-log-hide-build-options.patch
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.18.2/0001-named-lwresd-V-and-start-log-hide-build-options.patch
> rename to meta/recipes-connectivity/bind/bind-9.18.3/0001-named-lwresd-V-and-start-log-hide-build-options.patch
> diff --git a/meta/recipes-connectivity/bind/bind-9.18.2/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.18.3/bind-ensure-searching-for-json-headers-searches-sysr.patch
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.18.2/bind-ensure-searching-for-json-headers-searches-sysr.patch
> rename to meta/recipes-connectivity/bind/bind-9.18.3/bind-ensure-searching-for-json-headers-searches-sysr.patch
> diff --git a/meta/recipes-connectivity/bind/bind-9.18.2/bind9 b/meta/recipes-connectivity/bind/bind-9.18.3/bind9
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.18.2/bind9
> rename to meta/recipes-connectivity/bind/bind-9.18.3/bind9
> diff --git a/meta/recipes-connectivity/bind/bind-9.18.2/conf.patch b/meta/recipes-connectivity/bind/bind-9.18.3/conf.patch
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.18.2/conf.patch
> rename to meta/recipes-connectivity/bind/bind-9.18.3/conf.patch
> diff --git a/meta/recipes-connectivity/bind/bind-9.18.2/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.18.3/generate-rndc-key.sh
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.18.2/generate-rndc-key.sh
> rename to meta/recipes-connectivity/bind/bind-9.18.3/generate-rndc-key.sh
> diff --git a/meta/recipes-connectivity/bind/bind-9.18.2/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.18.3/init.d-add-support-for-read-only-rootfs.patch
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.18.2/init.d-add-support-for-read-only-rootfs.patch
> rename to meta/recipes-connectivity/bind/bind-9.18.3/init.d-add-support-for-read-only-rootfs.patch
> diff --git a/meta/recipes-connectivity/bind/bind-9.18.2/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.18.3/make-etc-initd-bind-stop-work.patch
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.18.2/make-etc-initd-bind-stop-work.patch
> rename to meta/recipes-connectivity/bind/bind-9.18.3/make-etc-initd-bind-stop-work.patch
> diff --git a/meta/recipes-connectivity/bind/bind-9.18.2/named.service b/meta/recipes-connectivity/bind/bind-9.18.3/named.service
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.18.2/named.service
> rename to meta/recipes-connectivity/bind/bind-9.18.3/named.service
> diff --git a/meta/recipes-connectivity/bind/bind_9.18.2.bb b/meta/recipes-connectivity/bind/bind_9.18.3.bb
> similarity index 98%
> rename from meta/recipes-connectivity/bind/bind_9.18.2.bb
> rename to meta/recipes-connectivity/bind/bind_9.18.3.bb
> index 1c77aceb9f..b511b77f2e 100644
> --- a/meta/recipes-connectivity/bind/bind_9.18.2.bb
> +++ b/meta/recipes-connectivity/bind/bind_9.18.3.bb
> @@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
>              file://0001-avoid-start-failure-with-bind-user.patch \
>              "
>   
> -SRC_URI[sha256sum] = "2e4b38779bba0a23ee634fdf7c525fd9794c41d692bfd83cda25823a2a3ed969"
> +SRC_URI[sha256sum] = "0ad8da773bd93cba0ef66cc81999698ebdf9c3e51faed5e5c8c1eb75cad2ae6f"
>   
>   UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
>   # follow the ESV versions divisible by 2
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166051): https://lists.openembedded.org/g/openembedded-core/message/166051
> Mute This Topic: https://lists.openembedded.org/mt/91307116/3616783
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [yi.zhao@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

