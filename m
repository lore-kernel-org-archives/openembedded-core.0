Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE3AAC4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 01:31:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.111952.1699493487232068513
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 17:31:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fGEOCgfq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9677a88a23=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3A90f2FP008181
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Nov 2023 17:31:27 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=j0hA+fJoHGq+jIXNzN6
	8MJp82Ifx61OWFF77eNVVDYA=; b=fGEOCgfqNQfLBs9+/LiTZMEgYK4l5JfBMOb
	joVUKv29QlHQTVUOsH5twYAXg70X5Ts8BLZAqWeOMDCg0W867IooRkKxhEkt/n6v
	xk432MG2wguVmITkNHOxYH/LMswxIapvEhnx35VaqRUW1efkGrDyQBHrmdW6FqD6
	iZtZU7mx3Qq0ZhtzyKfWmGAfNbSXIAlGeceVGsz/TMWL6Q9emQGTO+4x1LyWa1kg
	iNQY/THA+6PIhrWs9HHwVS8qBvcey1Cn5+iaHNjV6xBF/vwRMSMIWu5QBu7tqmTd
	c8pRiagBd/jJPu6INO56CLSzujQI0eKGxNZFGlcFIyuVMWESJlQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u7w2t1cqf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 17:31:26 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 3A91VQnU023346
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Nov 2023 17:31:26 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u7w2t1cqd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Nov 2023 17:31:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rp7Hr4aDIeJmoSQxhQOfO6RYmRODN/RVmA3uRieJ+2qU2IeBi7X6t2xtUnRrEEiHsWiEsRG+LKEX/MyznmaQG+sJsBOnM5NPAy6luksEsYd8h/qihwGjSg3Saulvu9TFkAFkWlacVqdtBh7pjs04GWELIa4N/4B10zKpFzdDnyvDzsmTTBH4wYYYaCtxOkxw3fijKuhrWmD82XjvattJxHmXZCLU+CYk1NF0q/qbYeZDpq20gnQ8hWzp/DYl65+gJk3sj8iPd45wkagE1UIAu33mFLnqWbl5i6hM5gy+yizRH87a/pZOG9DktY8xC/6Nk3xJixA4zZ+pzLwDVcD48g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j0hA+fJoHGq+jIXNzN68MJp82Ifx61OWFF77eNVVDYA=;
 b=nt6pKvkUE9CuosL1a0oOeUnV00sQq25YKA/XDnN1KE85Uw1WMRUlFq7hPMQRrwnplpatF3d10nAS9UuItPuWWAzl4HSHUf4OwYqXSJS1fF8KC99TpWzwrYQ4w/+CA2sXz/HVsjjqR9Was38r3BVxPjGaPyosxNXD7JTbdpEVWU5BW5Ob/ZkW7rOWZc3FdFte9wApGOIbPvCoYHEOobQTWhVku0mw+EShFDm/Qpp/X2ghnqzg/lPBTUevn2SoeYNjOz/RvqtOtBTiwTV8UoNR6XfTwnRY/eUQkjOvOGQJgpr2O5oF+GOE0OOgzO85YuLxSqfl2OqSEhyPbiTVJo8Ong==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by PH7PR11MB6056.namprd11.prod.outlook.com (2603:10b6:510:1d4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Thu, 9 Nov
 2023 01:31:20 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::1452:e3f3:48cb:a128]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::1452:e3f3:48cb:a128%4]) with mapi id 15.20.6954.028; Thu, 9 Nov 2023
 01:31:20 +0000
Content-Type: multipart/alternative;
 boundary="------------M2t30tVv2CpuYRuXrke115UH"
Message-ID: <c40f8997-c5f6-4649-a6e0-61e2aab4c5b7@windriver.com>
Date: Wed, 8 Nov 2023 20:31:16 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC 2/5] valgrind: update from 3.21.0 to 3.22.0
Content-Language: en-CA
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com
References: <20231109012555.4074359-1-Randy.MacLeod@windriver.com>
 <1795D005CB9AFA17.15940@lists.openembedded.org>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <1795D005CB9AFA17.15940@lists.openembedded.org>
X-ClientProxiedBy: BYAPR04CA0022.namprd04.prod.outlook.com
 (2603:10b6:a03:40::35) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|PH7PR11MB6056:EE_
X-MS-Office365-Filtering-Correlation-Id: 255b990a-d10f-471d-d35e-08dbe0c3936b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8his9lJVBlqKYsZ3AUWfJEnptkBbYZK5hxfVuEuI9s9SkqhSdPFYZsRQqJo/Xu1Mm5gmdGyhUa16jdEdQueCwzvwMC5lkmO122r6EwoWzbok3OB+Raur8MHDQPq+YAZkmcNRFbgYwd6Tz9LUW5tdeWhrjoPiKeIOlJFZmTnwCq+HqbHTHcEq10YXbdMf8L1N4QigqMw1TvEHjqnfjgXypiAtysdVofMhl0CXd5rQyvzyeHS5DElqVlrWpNHtR53cynsvPx59M/TyAemkTDjEQvh2Aveh8OwoKrLubTVRW94n4RatATE7r+kDI7JGnZVt3NMgSA88ltky6ZMP86IdZpfvrA0EaQxc+gGbqEFhhe2oDRak6lhj5IldPiOeuzXeOaF5ZxQ9Ghzj+FbHaE9bIxR8twfSXXP5bR8eKAOhCpPAnRmcK1lxpZZdrVPTvmbzmje6E6aQze8sdF3NM0OmSCw2tz5OoHm3gPcRFHjXC9jXzm4Zjk2mFlEdSM2obA2dAIN04IYJudvEqRoGAktRcRp+qHlCvOThxqQHpqH6a/n9BIM8auVaX5vYj+6RDW2Sw6rUi9j7Y+Fs+xt3JhyTrfCYHd6Hxsw4Y8DncTZByS+mYZD6TlVC+dZXALkb3MkUfSCe76VKQsYwzuRp5O1KlTYp/uUQls+iPufmPWJUFOs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(346002)(39850400004)(366004)(136003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(2906002)(38100700002)(30864003)(31686004)(15650500001)(8936002)(8676002)(4326008)(41300700001)(83380400001)(5660300002)(86362001)(166002)(31696002)(21615005)(66899024)(966005)(6512007)(2616005)(33964004)(316002)(66556008)(66946007)(6916009)(66476007)(53546011)(6666004)(6506007)(26005)(6486002)(478600001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bWxkcnlZLzMvWlJnckF0MHFYVGNocnFwanVQL2R1MjV3cDdjV1ByQng5N2V4?=
 =?utf-8?B?Tk1VZ0RDV1dLNDdIbGFvZ2phaCtBckxJYXNzZXl4UGxxQW5qS2FyUy9NS3Fz?=
 =?utf-8?B?YUZYbVdMQjRiazdBOUl6ZDJ6ZW5xUFZKVjN6QktaZzFKNlZubHNnc3F0UGpF?=
 =?utf-8?B?elZoeHppOEN3L1h3V2o3bzllTmh0VkxiWnNqMHJhUVFQdlU4dzdhMHdwejZq?=
 =?utf-8?B?ZXRRaElzOTE0c3dXTktJbGk3VW9VbjVoZE5nYy8rNkI2Zmk4ZzhDRnB1emo0?=
 =?utf-8?B?c1JrZy8wNE0vd2s1cjhPcm05K3FjZmVHQ3JCVGw4MU82RUVtL09jRlpWWkxu?=
 =?utf-8?B?eGV6K1FVamU0eEZuOGRjd3dudDBDMTI4U2hOa01MZ0pHcEQ5T041aTBIV1Jy?=
 =?utf-8?B?VytjUERVbmNXd1lFNmRraVdLSGFJT05IazIxVWk3Umt5VlRRZk9qaTJDNVJi?=
 =?utf-8?B?NGFXNlMrQy83ZWp2cjBWWGJldEYwU0Z4cVNmczFkakhYQVpaN2xRMEJHU05B?=
 =?utf-8?B?L2JVUXdBaS9BNWVmSnRkL1o3UkM4RTB2cVlkK2dZbklNTE54TTlmejk5Njh6?=
 =?utf-8?B?TUIvSkdkLzhHQ1NvQXFVK1kvM3dMYlI1dDdqZEJST0w5YnJGVm5QZVBaaWg3?=
 =?utf-8?B?cTZxbWpxSTltUnQ2WGZnR1p2OW9nSTljUjFNLzlPK1RZbW96Ui8vV1poT0hY?=
 =?utf-8?B?cUl3a1VTWnZhUlZTVkdDWGo3S0lwSXRNeVp1SmVuSG9NLzV4bFYweWNQblBU?=
 =?utf-8?B?bUg0bXgzVUdEZE4zNVVIZ3RjMzg3eEtvMHhWN1R4M0xBeGR3OWRvQ2VmYVFH?=
 =?utf-8?B?ZXF6WWlTRHFGUUdNZk5kb3lqT3AwSEkxR2tlWEJnYlVoeVpZYWFtcmhFeWtt?=
 =?utf-8?B?ZVQySUxaVG1mRytReEtKdDRtVDZrS3EvT2FjRVhrVVhCTVpBUmsra1YvK0Y1?=
 =?utf-8?B?S1lEQ0o0bC9oMnFXbjBPY2ZySkZiYXJUTnVhM3ZPU01yTDNMRTFzdnJCcWJ2?=
 =?utf-8?B?N2Z5Y2Q2YlRSNUtyVEV4NGxoVDVkcEtWd094a2VmUTBrbmxiK2VhTWlaczFV?=
 =?utf-8?B?dG1ITm9WaTc0dFBhYlZqcnljL3hUSmlBMEI1bEpjRmw3ZmVjUEVIVXkrSjBG?=
 =?utf-8?B?V1Bmdk9uVGZucEZaclRud01ocGlBRHFaU0tDNFphYURyS01IZlV2VUJSUjZI?=
 =?utf-8?B?RHU4bGlreURPTzEvdUlLaVdCQTY1YXhWV3djamFvRi9VamtER3BZU2hjV0Zi?=
 =?utf-8?B?Y003U2NwZW81ZDlVcTlqM1d2WHdqV2kyYVlmQkdlN2NUV1hwMEVqMDRYQXRz?=
 =?utf-8?B?MDRXNGNhUHF5OXpsMEJFNFdRdjJ2VmIybktldDVRdWlFbmovMFlaemc5N1By?=
 =?utf-8?B?eVJHN3JZbGZUaEV5SGlkYjVGRTdLaWNTbEFuVzJuNWlzVllLMHlQMlpLRkZr?=
 =?utf-8?B?RzFwZmFPQUt1ZU43QXQzVDZQazlkcUd0ejl1cVFOM0x4MFp1OTZtdlJWeG8z?=
 =?utf-8?B?WEZvcDA3MlAxMUZTa1htcEVrT2ZCbXZCZy9uWFY2YWZHeGFrMjQwalZwL0Ra?=
 =?utf-8?B?WDRjRGpTRThTVnFxM25hamQ3SG9PemZPUklIYUNHVi82Y1h2SytiL05RY1NJ?=
 =?utf-8?B?dUlpcFJ3NHNiUktUZEdBRzlSZkJOeUVERjVNWkxOVThrMmdhT1c1Rmk3T0Ux?=
 =?utf-8?B?ODVBRkFDTnA2bHpZWXVOdmRQWnEreWttR1R6eU9rN1ZOaWQ4amxvT1JiYlJS?=
 =?utf-8?B?ZUFWaTNTQlZVSTA1blpNV2tYY28rWlNXdHlMRUVuc1BpZC9hUGFnZWJhY1Ns?=
 =?utf-8?B?SlhSTDVIZHhWM1IxYkhrbXZHYnlmbFFHelg5bkQ3d0xTcmxuYUdXTTFzMTBN?=
 =?utf-8?B?OGpGTExHQTJuZVB6cjhMbFJZM3dwVGJTbkc5MGlCOTIwOU1PZ2lFMUg4clZo?=
 =?utf-8?B?UC9RYTJ5N3BOdDZZcENqeElUMk9TTjdFYW0rT1FPc2dHVzBrdFgyR3lKTkRv?=
 =?utf-8?B?cVorblp5WXFGeEhmbEFwWlhPb1p3UGxwQm9QdUtXL1NyMFR5SUxwa1BrRk9t?=
 =?utf-8?B?aklsTkxUZGt2R3drQmRkd0Q0aW5lZFlMN3Mza2ZlQ2NTUVFFOTkzVVg2R0dS?=
 =?utf-8?B?TDZZWithT0hjMVp4WEhTMDliOFQrT1J3dWNyOTAybHB0UE5mZUlMSVljS3FJ?=
 =?utf-8?B?Y3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 255b990a-d10f-471d-d35e-08dbe0c3936b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 01:31:20.1422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E67Kzg95W43kHqRytfuuk2vbQO0Y8DLRxPNU8tptaQVOX00X4NM7TNBkjsD3Wd0fZAX+1u9AavG++IQG3XOZpLQ+srg+toIZij4+AReNYzE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6056
X-Proofpoint-GUID: 0ulw0wJJHRR6HAkctsjjUy7zFr_VEx8t
X-Proofpoint-ORIG-GUID: KB7SL4ZBZUa3jPbvpJ2cpli1ZMo6Hzs9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-09_01,2023-11-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 mlxlogscore=999 impostorscore=0 clxscore=1015 phishscore=0 bulkscore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311090010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Nov 2023 01:31:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190372

--------------M2t30tVv2CpuYRuXrke115UH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023-11-08 8:25 p.m., Randy MacLeod via lists.openembedded.org wrote:
> From: Randy MacLeod<Randy.MacLeod@windriver.com>
>
> Full release notes:https://valgrind.org/docs/manual/dist.news.html
>
> In summary, there is a new configure option: --with-gdbscripts-dir
> that lets you install the gdb valgrind python monitor scripts in a specific location.
> It's not used in the valgrind recipe yet. Also, there were a few Memcheck and Cachegrind
> improvements made and many bugs fixed.
>
> The update required removing the patch:
>     0001-none-tests-x86-linux-seg_override.c-add-missing-incl.patch
> as it's dealt with by these commits:
>     f7e4bb4af Bug 382034 - Testcases build fixes for musl
>     306232d40 musl: another fix for building testcases
> as described on:https://bugs.kde.org/show_bug.cgi?id=382034
>
> Ptest Resutls for qemux86-64/kvm
>
> glibc:
> === Test Summary ===
> TOTAL: 792
> PASSED: 759
> FAILED: 14
I haven't checked but I think these are 14 *new* ptest failures so we 
shouldn't merge until they are fixed.

The tests that fail are:

root@qemux86-64:/usr/lib/valgrind/ptest# grep FAIL 
valgrind_ptest_20231109-001351.log
FAIL: memcheck/tests/linux/dlclose_leak-no-keep
FAIL: memcheck/tests/linux/dlclose_leak
FAIL: memcheck/tests/wrap1
FAIL: memcheck/tests/wrap2
FAIL: memcheck/tests/wrap3
FAIL: memcheck/tests/wrap4
FAIL: memcheck/tests/wrap5
FAIL: memcheck/tests/wrap6
FAIL: memcheck/tests/wrap7
FAIL: memcheck/tests/wrap8
FAIL: cachegrind/tests/wrap5
FAIL: massif/tests/bug469146
FAIL: massif/tests/new-cpp
FAIL: massif/tests/overloaded-new

I may not get time to work on them any more this week so I'm sending the 
update
in case anyone (Alex!) wants to take a look.

../Rnady

> SKIPPED: 19
>
> musl:
> === Test Summary ===
> TOTAL: 792
> PASSED: 559
> FAILED: 211
> SKIPPED: 22
>
> Signed-off-by: Randy MacLeod<Randy.MacLeod@windriver.com>
> ---
>   ...inux-seg_override.c-add-missing-incl.patch | 30 -------------------
>   ...{valgrind_3.21.0.bb => valgrind_3.22.0.bb} |  3 +-
>   2 files changed, 1 insertion(+), 32 deletions(-)
>   delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-none-tests-x86-linux-seg_override.c-add-missing-incl.patch
>   rename meta/recipes-devtools/valgrind/{valgrind_3.21.0.bb => valgrind_3.22.0.bb} (98%)
>
> diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-x86-linux-seg_override.c-add-missing-incl.patch b/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-x86-linux-seg_override.c-add-missing-incl.patch
> deleted file mode 100644
> index 5e36c28523..0000000000
> --- a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-x86-linux-seg_override.c-add-missing-incl.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From 978d9ed7f857f2cdcd2a8632f3c2feb56b99c825 Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin<alex@linutronix.de>
> -Date: Mon, 8 May 2023 11:56:35 +0200
> -Subject: [PATCH] none/tests/x86-linux/seg_override.c: add missing include for
> - musl builds
> -
> -Otherwise SYS_modify_ldt is undefined.
> -
> -Upstream-Status: Submitted [https://bugs.kde.org/show_bug.cgi?id=382034]
> -Signed-off-by: Alexander Kanavin<alex@linutronix.de>
> -
> ----
> - none/tests/x86-linux/seg_override.c | 4 ++++
> - 1 file changed, 4 insertions(+)
> -
> -diff --git a/none/tests/x86-linux/seg_override.c b/none/tests/x86-linux/seg_override.c
> -index ca8fbfe..4ef4394 100644
> ---- a/none/tests/x86-linux/seg_override.c
> -+++ b/none/tests/x86-linux/seg_override.c
> -@@ -3,6 +3,10 @@
> - #include <errno.h>
> - #include <string.h>
> - #include "../../../config.h"
> -+#if defined(MUSL_LIBC)
> -+#include <syscall.h>
> -+#include <unistd.h>
> -+#endif
> -
> -
> - /* Stuff from Wine. */
> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.21.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
> similarity index 98%
> rename from meta/recipes-devtools/valgrind/valgrind_3.21.0.bb
> rename to meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
> index a2feda6aae..6dcd028075 100644
> --- a/meta/recipes-devtools/valgrind/valgrind_3.21.0.bb
> +++ b/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
> @@ -36,9 +36,8 @@ SRC_URI ="https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \ 
> file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch \ 
> file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch \ 
> file://0001-docs-Disable-manual-validation.patch \ - 
> file://0001-none-tests-x86-linux-seg_override.c-add-missing-incl.patch \ "
> -SRC_URI[sha256sum] = "10ce1618bb3e33fad16eb79552b0a3e1211762448a0d7fce11c8a6243b9ac971"
> +SRC_URI[sha256sum] = "c811db5add2c5f729944caf47c4e7a65dcaabb9461e472b578765dd7bf6d2d4c"
>   UPSTREAM_CHECK_REGEX = "valgrind-(?P<pver>\d+(\.\d+)+)\.tar"
>   
>   COMPATIBLE_HOST = '(i.86|x86_64|arm|aarch64|mips|powerpc|powerpc64).*-linux'
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190369):https://lists.openembedded.org/g/openembedded-core/message/190369
> Mute This Topic:https://lists.openembedded.org/mt/102477899/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux

--------------M2t30tVv2CpuYRuXrke115UH
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2023-11-08 8:25 p.m., Randy MacLeod
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1795D005CB9AFA17.15940@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a>

Full release notes: <a class="moz-txt-link-freetext" href="https://valgrind.org/docs/manual/dist.news.html">https://valgrind.org/docs/manual/dist.news.html</a>

In summary, there is a new configure option: --with-gdbscripts-dir
that lets you install the gdb valgrind python monitor scripts in a specific location.
It's not used in the valgrind recipe yet. Also, there were a few Memcheck and Cachegrind
improvements made and many bugs fixed.

The update required removing the patch:
   0001-none-tests-x86-linux-seg_override.c-add-missing-incl.patch
as it's dealt with by these commits:
   f7e4bb4af Bug 382034 - Testcases build fixes for musl
   306232d40 musl: another fix for building testcases
as described on: <a class="moz-txt-link-freetext" href="https://bugs.kde.org/show_bug.cgi?id=382034">https://bugs.kde.org/show_bug.cgi?id=382034</a>

Ptest Resutls for qemux86-64/kvm

glibc:
=== Test Summary ===
TOTAL: 792
PASSED: 759
FAILED: 14</pre>
    </blockquote>
    I haven't checked but I think these are 14 *new* ptest failures so
    we shouldn't merge until they are fixed.
    <p>The tests that fail are:</p>
    <p>root@qemux86-64:/usr/lib/valgrind/ptest# grep FAIL
      valgrind_ptest_20231109-001351.log <br>
      FAIL: memcheck/tests/linux/dlclose_leak-no-keep<br>
      FAIL: memcheck/tests/linux/dlclose_leak<br>
      FAIL: memcheck/tests/wrap1<br>
      FAIL: memcheck/tests/wrap2<br>
      FAIL: memcheck/tests/wrap3<br>
      FAIL: memcheck/tests/wrap4<br>
      FAIL: memcheck/tests/wrap5<br>
      FAIL: memcheck/tests/wrap6<br>
      FAIL: memcheck/tests/wrap7<br>
      FAIL: memcheck/tests/wrap8<br>
      FAIL: cachegrind/tests/wrap5<br>
      FAIL: massif/tests/bug469146<br>
      FAIL: massif/tests/new-cpp<br>
      FAIL: massif/tests/overloaded-new<br>
    </p>
    <p>I may not get time to work on them any more this week so I'm
      sending the update<br>
      in case anyone (Alex!) wants to take a look.</p>
    <p>../Rnady<br>
    </p>
    <blockquote type="cite" cite="mid:1795D005CB9AFA17.15940@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">
SKIPPED: 19

musl:
=== Test Summary ===
TOTAL: 792
PASSED: 559
FAILED: 211
SKIPPED: 22

Signed-off-by: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a>
---
 ...inux-seg_override.c-add-missing-incl.patch | 30 -------------------
 ...{valgrind_3.21.0.bb =&gt; valgrind_3.22.0.bb} |  3 +-
 2 files changed, 1 insertion(+), 32 deletions(-)
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-none-tests-x86-linux-seg_override.c-add-missing-incl.patch
 rename meta/recipes-devtools/valgrind/{valgrind_3.21.0.bb =&gt; valgrind_3.22.0.bb} (98%)

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-x86-linux-seg_override.c-add-missing-incl.patch b/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-x86-linux-seg_override.c-add-missing-incl.patch
deleted file mode 100644
index 5e36c28523..0000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-x86-linux-seg_override.c-add-missing-incl.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 978d9ed7f857f2cdcd2a8632f3c2feb56b99c825 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <a class="moz-txt-link-rfc2396E" href="mailto:alex@linutronix.de">&lt;alex@linutronix.de&gt;</a>
-Date: Mon, 8 May 2023 11:56:35 +0200
-Subject: [PATCH] none/tests/x86-linux/seg_override.c: add missing include for
- musl builds
-
-Otherwise SYS_modify_ldt is undefined.
-
-Upstream-Status: Submitted [<a class="moz-txt-link-freetext" href="https://bugs.kde.org/show_bug.cgi?id=382034">https://bugs.kde.org/show_bug.cgi?id=382034</a>]
-Signed-off-by: Alexander Kanavin <a class="moz-txt-link-rfc2396E" href="mailto:alex@linutronix.de">&lt;alex@linutronix.de&gt;</a>
-
----
- none/tests/x86-linux/seg_override.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/none/tests/x86-linux/seg_override.c b/none/tests/x86-linux/seg_override.c
-index ca8fbfe..4ef4394 100644
---- a/none/tests/x86-linux/seg_override.c
-+++ b/none/tests/x86-linux/seg_override.c
-@@ -3,6 +3,10 @@
- #include &lt;errno.h&gt;
- #include &lt;string.h&gt;
- #include &quot;../../../config.h&quot;
-+#if defined(MUSL_LIBC)
-+#include &lt;syscall.h&gt;
-+#include &lt;unistd.h&gt;
-+#endif
- 
- 
- /* Stuff from Wine. */
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.21.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
similarity index 98%
rename from meta/recipes-devtools/valgrind/valgrind_3.21.0.bb
rename to meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
index a2feda6aae..6dcd028075 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.21.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
@@ -36,9 +36,8 @@ SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2\file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch\file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch\file://0001-docs-Disable-manual-validation.patch\-file://0001-none-tests-x86-linux-seg_override.c-add-missing-incl.patch\">&quot;https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch \
            file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch \
            file://0001-docs-Disable-manual-validation.patch \
-           file://0001-none-tests-x86-linux-seg_override.c-add-missing-incl.patch \
            &quot;</a>
-SRC_URI[sha256sum] = &quot;10ce1618bb3e33fad16eb79552b0a3e1211762448a0d7fce11c8a6243b9ac971&quot;
+SRC_URI[sha256sum] = &quot;c811db5add2c5f729944caf47c4e7a65dcaabb9461e472b578765dd7bf6d2d4c&quot;
 UPSTREAM_CHECK_REGEX = &quot;valgrind-(?P&lt;pver&gt;\d+(\.\d+)+)\.tar&quot;
 
 COMPATIBLE_HOST = '(i.86|x86_64|arm|aarch64|mips|powerpc|powerpc64).*-linux'
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#190369): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/190369">https://lists.openembedded.org/g/openembedded-core/message/190369</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/102477899/3616765">https://lists.openembedded.org/mt/102477899/3616765</a>
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

--------------M2t30tVv2CpuYRuXrke115UH--

