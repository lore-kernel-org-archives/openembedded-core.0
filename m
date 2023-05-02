Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88A1CC7EE21
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 23:30:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6307.1683070198441453941
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 16:29:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=lwp3EXXi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4486efa346=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 342LcLvk016893
	for <openembedded-core@lists.openembedded.org>; Tue, 2 May 2023 16:29:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=l5whoKfbAT/SbUJBl1DkXPUVcwAocZs8XyacR34s3XA=;
 b=lwp3EXXijWi/6PZgpUHyF9cXcezbhmbrtJCZPJkjRfyOShJOOqbG4jHR/EMH5t2r/z3Q
 ZRTsEEiSdIJZs5+7o/BN3OEQKgu+PFAAqGbmniyNV6xrPA5UXEKGladNAYe3wZS6FZuy
 1tEn9EecIwXokBi2X0wGO18p0Ev7PzJTUPWJ0+sGVpZhDZpZTab1M/DjkIp35lPON8XL
 6RWiZGFaAhYQ5kQJqGotu4hz/ut3LDYZrL2dJX5UucVx++931g+RyIjqnMxqWMrstfow
 3oR4XD6XLTBldQKQZKgQaepLJv4A4d1QddoQBoRETsyTbw04UyTkKo7ftb1PnfqCKvQS XQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3q8xh5k4tk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 16:29:57 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 342NTvFi024466
	for <openembedded-core@lists.openembedded.org>; Tue, 2 May 2023 16:29:57 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3q8xh5k4tj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 May 2023 16:29:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tlm5EZFZM/eXWnLEbROUwzEOBx6f/LIeQ4HatMyyl2hyp+Fw2jZmeMq3o+DVUI9WYC1A8EaQsRN6mpWpGE2NV+JDPiY0Sm/4J1LO9LLX3QwBwiMLqNV/GHOybqrAg9hE8dIZ6E58OQ+Uqoa8j3r2+CPve4HZww9BPXiLww4uOlXVrW0AS6yllHorJdNQGwadlIxZ+JQgN54UNyQCXVUqHDv8JTv+8TeKLXaVYdkl18c5cIKJXZkUGxD6GMAmvE4Gf/qH4RsgYHf6lE0ggcH406mWjaG8OhEq7kr9Pdqhk76M0gMhgMFeJgKpldJa8/Hq2CSLhRTFm6M9RKvw8HC2yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l5whoKfbAT/SbUJBl1DkXPUVcwAocZs8XyacR34s3XA=;
 b=hE9BMv0UxDN+SIbZ0KiKAGgRHv7BNZutdCLsNsioHHEXSoJwDEd5Ci7il0sy4xBhpLpDOf5u4TIoqYOrAY1hLXnx3xbR9q+D3vKoOcEb/TcOqjh7WgJPsmKn3QA4MRNfnRdSN7Nz1QmZ2wECeER+TPkNacx+rzGCoGVTI5lQcjoF9hVOSf4CTqrraCFiOZLVM9tcm8hHDUhqWfYN7eye9rfeLIGPZ949GBi502jhtpivLdRMnPJDBlsza3HS97eoZouc/jp8NQirUim6DQQEalXCRm63BU4ZUxP25JhJuHUZL2d4RorFHlwofmj1b5ElDhn1cCT8FmJmgHBoIZmz2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MN2PR11MB3998.namprd11.prod.outlook.com (2603:10b6:208:137::21)
 by CO1PR11MB4977.namprd11.prod.outlook.com (2603:10b6:303:6d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 23:29:53 +0000
Received: from MN2PR11MB3998.namprd11.prod.outlook.com
 ([fe80::bfd4:5bb6:b790:80e1]) by MN2PR11MB3998.namprd11.prod.outlook.com
 ([fe80::bfd4:5bb6:b790:80e1%5]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 23:29:52 +0000
Content-Type: multipart/alternative;
 boundary="------------zrLMPlpoTztkMRymX8NzmLKK"
Message-ID: <ad51e892-f8cb-adf9-b958-1e2cad618015@windriver.com>
Date: Tue, 2 May 2023 19:29:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [AUH] rust: upgrading to 1.69.0 FAILED -> Sundeep to do the
 update.
Content-Language: en-CA
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>,
        "alex.kiernan@gmail.com" <alex.kiernan@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <01010187d9352360-4eff0521-e848-4365-a203-ba8b516d3d8b-000000@us-west-2.amazonses.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <01010187d9352360-4eff0521-e848-4365-a203-ba8b516d3d8b-000000@us-west-2.amazonses.com>
X-ClientProxiedBy: SJ0PR05CA0088.namprd05.prod.outlook.com
 (2603:10b6:a03:332::33) To MN2PR11MB3998.namprd11.prod.outlook.com
 (2603:10b6:208:137::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB3998:EE_|CO1PR11MB4977:EE_
X-MS-Office365-Filtering-Correlation-Id: 57262db7-b3c2-44c7-d7d2-08db4b652154
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1RB5dA2zsz+lJrjPIrEQi4mNewcSB0U4V0U9HLsibEp1MTLjS2gNcwFj7veqn2Co/YV3UvC2PBQ/6rSHPK+lvhlyZYZ0mRoFHgn2jTo4Ey9D3dtkGagwykxkLvY9/9MlKkIbbEkWP4GDxwPZAkSIcK+yHBBsAOD0lMquTiBwuwzUleJSRZVc4lbVwkz9oDL/ruZSBooUmknEKl56e+YO+Dcj4p/+8ldYBzlMfnNSdzHpeLCPHXQr4HlFhP0XH7qIJlderYAdVREiMOQQXB9kjShJxesIRN4mQPwgtKjyj/ZVg4GyBRUOHFsew907Dgt/ZkLKJVplzMTgjWXB1StnnW4E6WjowCSp6nAQDGjl+x8h+uK2NxNLAnl9Oi/QLt3BJHIXAtPrvw2HtbHus1KqyvvkGjyvI9boa1cCzhDYPOqDwS2SItZmEsn2v7vWYn26EiHHj6+ofaXbNv5R5v0xQuGQF/hsphscpHJs4m8pvXkjTxzQh4rsdmkxRyyecosf4QNMLuv0xCVWOh25YkCLJt+Yq6fnibD0usQVYmuVVfmKwnMIIeUIOG3nGcyYoGbqGMr+I7vhVDNvlZ4G2e7xtRDZJpccVGbNUSTEDVdm4CUZq6WcPdSFrCA76JMXVka4RCnOVmj8O6mb0Bml6yih9w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3998.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(366004)(346002)(136003)(396003)(376002)(451199021)(83380400001)(966005)(33964004)(6486002)(478600001)(110136005)(6666004)(2616005)(6512007)(6506007)(26005)(186003)(53546011)(38100700002)(2906002)(30864003)(15650500001)(36756003)(5660300002)(66556008)(66946007)(66476007)(4326008)(41300700001)(8676002)(8936002)(166002)(86362001)(31696002)(316002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZElEdERkRWtxTlF6YWtQNTgwNXdwUld4bVB3RTJlM2I0U1FqOHVIWXhTczJI?=
 =?utf-8?B?UE1oRHBjeW5lc0Y0eHBwVlFTVFdRTUdNT2JvNXRwdGNHMm9Ba0ZYbjhQTWxZ?=
 =?utf-8?B?ZStSTC9mVnZmbzg2cnlTdGY5UEZzWFord0hmZ016VlBjS3pBT2VRajdHT3FM?=
 =?utf-8?B?MCtVVmZucEZUQzZXQ2hJZ3FOMTVFYzBTT3VsTnlrVm5zckdIa3RWa0ZRekJx?=
 =?utf-8?B?QnVIdTE4bThCcURkYjdnaDBzNlZnZWZqWCtIdWxzTjl0d20rTnE2UjJjNGU1?=
 =?utf-8?B?L1dOYjBWdENlcDVXWGZ6eUh2cHJOcldjVnNiTi9TTjg2Ly9RSE4rc1dGZ0Zr?=
 =?utf-8?B?TnZWcmhKbDR4SWpudTFmaUxRaklvMThFWXRBcEg4TmcvK1JvbUEvN2U5T1BU?=
 =?utf-8?B?YXJDUUdhaG1mNXV4Z3E3dWdIbWdjWWwraWxkOHJjUmV5VnEvUVpJVTVCUnF6?=
 =?utf-8?B?eElvdEFIVjZsZVVXOFFrMm5PbGc3NW55OEh0bytrMk1oZW96aXJoNGY3eFow?=
 =?utf-8?B?QjBFSkpUM05JVWlzL203eDdnblFMRjVFS0JUaGpWTzRFck5RSnZPdW5kMG0z?=
 =?utf-8?B?dUgwanZVK0tIY2NOdWZ0TFVCdjF5ckxLZGhKdzRnVFdUYmtqZE9vZmI1akdm?=
 =?utf-8?B?bW1kWmFUTVc2ZjBoRHJ0UkZDV2Q1eU16UkNhaE04dWxaYlg0U2hOekNVWkNz?=
 =?utf-8?B?R09XbEt3MUpNZGVqdVBSakFqNHU5UVJmQ1ZpWE9QenNoMWU5MllCNlhKL3ZJ?=
 =?utf-8?B?OEY0SHpvbVh1UmN4QVpQc3g0YnBDVEVrTmNoM3NMMndyZFVCMnpUaGNRVjdI?=
 =?utf-8?B?dkFxY2lrWUFJa0dyVnRJbDR2OS9oR1VLblN5TUR2QzNqTll5WDJab1YxZE4z?=
 =?utf-8?B?dTN5dlJUYmp5d0ZXRjk5TG1MNzA5RFhJYVFrOGxKbHZYT3pDSlRWeXhWbnNs?=
 =?utf-8?B?dHE0Yk11YStxcllhZUFqWk1iZnlDSmlIZjUyZWg5R1JzRDErSE95TTQwRHN5?=
 =?utf-8?B?MjZuK3dWaHR0N2o1bVlSUnRhcVQ0WVVMV0F1aUJLa2ltbkhVTHFUTVh4QzA4?=
 =?utf-8?B?NWxIRHJCR0FXQ00wdzdjSHBFQTRRTkhtem1jSEw0MFlYWnFUUk9sTzlxMTk4?=
 =?utf-8?B?b1ViMVZLMTZaMjZ4SXo0bExyRkJ1TkNMUm9SSXBWMFpNUjJ2ZEhkTDU2V1hi?=
 =?utf-8?B?RGdjVnJpcVRCSHZ1a0JsSURPL3Mzd3Y4TFpFZ21tNk1URVY3VkYxOVhSL050?=
 =?utf-8?B?THEvUFVZWHB1b0xrZ3hqbHdQaGlKM0dXeEdWSjh3a2l3aG82YlVHUmh2dU9G?=
 =?utf-8?B?bW5YcUU3RzVSTmZNSlpvVnRDb1BKWGhRUTQrY3MzZVNPMXFqcmMvQk1hWkhn?=
 =?utf-8?B?NzFmbDlRYXRMQjFvQ2NMemlqRTZUQ0RhM1B0TjU0aFRPUW05eks1OHJJclJp?=
 =?utf-8?B?SUVGa2oxN3NCQ2lTYld1Q2xwVXBzT3BoMTRCVmJzSm1hblVoZEFldVdsdFA5?=
 =?utf-8?B?NzliYTFOWFhBeHJPelR5VU85R3NCcm5nSjNGZlYwVzRNNlNERlJKNDJYeEV0?=
 =?utf-8?B?T1JCY3B0MlJkNHphd1U1bHQ2WmZJL0cyeTlZWDQ4YkZTNTkwbGVSUVBJdzVi?=
 =?utf-8?B?UXFHQlpLZDRQdmxJVVA1NndtczdSQk5XajdtUTM5YktGNEllbmwvQTROelVF?=
 =?utf-8?B?ODg1QmQrc2V0VVB6VHkreUZFa1d1NUlMZzJGbk41QnBJS0NiWW03THBveWZN?=
 =?utf-8?B?eGlXWWcxQ3pGd1c3eVA1K0hYZHozUm1WOVVrTEI1UW1EeEJRN2hDcHc5N3VY?=
 =?utf-8?B?L3ArdFVKZ1FPWU5JMnVZRkY3bWJIV2ZDOW5jSG00WThxb3d3NVFiTUh3Zllk?=
 =?utf-8?B?eDFtekg0dkdRKys5cGRkc2dkUk9LNHdDUzd5VlZJYS9yeDJoellBbVBmODBn?=
 =?utf-8?B?QkVpZXVMUHNJMEhwMy9nbGt4aWJJcmRNRytSMkhRTFlUQndEVjJPQ2RjRzFy?=
 =?utf-8?B?TlVuTVNqWmJLUEhxTlY5dEhuZjNidzVrNTRhZUxpRmtweGRmWnU0czNkTlor?=
 =?utf-8?B?NUlOdWNEMW01UXhrTmtjTDhVY1Q2MHEzbG5na0dGU216R0tJRC9qUWV3WTl3?=
 =?utf-8?B?cjBKVmJnbXRPN3Z2UG8wWDZ5a2FMZUtNcTY1YWRXY0ZYMXlFYU4vRzNXQ3Yr?=
 =?utf-8?B?amc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57262db7-b3c2-44c7-d7d2-08db4b652154
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3998.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 23:29:52.8426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A+L9XEwsm3zp57Mzs2Qv7tTZ2K3Z5KOoUvRz1eOlNmBbg3YjQ9V8fy/egDMplquP/k0Hx5FfvZV9Cn4CcqNI6EYHqCQhKhJ1N0gXy149HwM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4977
X-Proofpoint-ORIG-GUID: bTRG4_UdyM9KYKSU5DKu9BtmU_Jp0dem
X-Proofpoint-GUID: FaGl7gO6BpopOL7aJPXIUy-kzvuH5qvW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-02_12,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305020199
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 23:30:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180778

--------------zrLMPlpoTztkMRymX8NzmLKK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023-05-01 17:25, auh@yoctoproject.org wrote:
> Hello,
>
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe *rust* to *1.69.0* has Failed (devtool error).
>
> Detailed error information:
>
> The following devtool command failed:  upgrade rust -V 1.69.0

Sundeep said that he will start working on this tomorrow unless someone 
else speaks up
about having the update underway. 1.70 isn't due until June 1st or so.

../Randy


> NOTE: Starting bitbake server...
> NOTE: Reconnecting to bitbake server...
> NOTE: Retrying server connection (#1)... (14:02:48.244299)
> Loading cache...done.
> Loaded 1799 entries from dependency cache.
> Removing 1 recipes from the x86_64 sysroot...done.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION           = "2.4.0"
> BUILD_SYS            = "x86_64-linux"
> NATIVELSBSTRING      = "universal"
> TARGET_SYS           = "x86_64-poky-linux"
> MACHINE              = "qemux86-64"
> DISTRO               = "poky"
> DISTRO_VERSION       = "4.2"
> TUNE_FEATURES        = "m64 core2"
> TARGET_FPU           = ""
> meta
> meta-poky
> meta-yocto-bsp       = "tmp-auh-upgrades:c08f5fabc6f19121f285caaed7c99e1ba459baab"
> workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"
>
> Initialising tasks...done.
> Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 22 (0% match, 100% complete)
> NOTE: Executing Tasks
> NOTE: Tasks Summary: Attempted 102 tasks of which 99 didn't need to be rerun and all succeeded.
> NOTE: Writing buildhistory
> NOTE: Writing buildhistory took: 2 seconds
> Loading cache...done.
> Loaded 1799 entries from dependency cache.
> Parsing recipes...done.
> Parsing of 900 .bb files complete (898 cached, 2 parsed). 1800 targets, 39 skipped, 0 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION           = "2.4.0"
> BUILD_SYS            = "x86_64-linux"
> NATIVELSBSTRING      = "universal"
> TARGET_SYS           = "x86_64-poky-linux"
> MACHINE              = "qemux86-64"
> DISTRO               = "poky"
> DISTRO_VERSION       = "4.2"
> TUNE_FEATURES        = "m64 core2"
> TARGET_FPU           = ""
> meta
> meta-poky
> meta-yocto-bsp       = "tmp-auh-upgrades:c08f5fabc6f19121f285caaed7c99e1ba459baab"
> workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"
>
> Initialising tasks...done.
> Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 18 (0% match, 100% complete)
> NOTE: Executing Tasks
> NOTE: Tasks Summary: Attempted 83 tasks of which 81 didn't need to be rerun and all succeeded.
> NOTE: Writing buildhistory
> NOTE: Writing buildhistory took: 2 seconds
> DEBUG 5 [Errno 25] Inappropriate ioctl for device
> Adding changed files:   0% |                                   | ETA:  --:--:--
> Adding changed files:   0% |                                   | ETA:  --:--:--
> Adding changed files:   1% |                                    | ETA:  0:01:03
> Adding changed files:   2% |                                    | ETA:  0:00:45
> Adding changed files:   3% |#                                   | ETA:  0:00:40
> Adding changed files:   4% |#                                   | ETA:  0:00:36
> Adding changed files:   5% |#                                   | ETA:  0:00:34
> Adding changed files:   6% |##                                  | ETA:  0:00:33
> Adding changed files:   7% |##                                  | ETA:  0:00:32
> Adding changed files:   8% |##                                  | ETA:  0:00:31
> Adding changed files:   9% |###                                 | ETA:  0:00:30
> Adding changed files:  10% |###                                 | ETA:  0:00:30
> Adding changed files:  11% |####                                | ETA:  0:00:29
> Adding changed files:  12% |####                                | ETA:  0:00:29
> Adding changed files:  13% |####                                | ETA:  0:00:28
> Adding changed files:  14% |#####                               | ETA:  0:00:27
> Adding changed files:  15% |#####                               | ETA:  0:00:27
> Adding changed files:  16% |#####                               | ETA:  0:00:27
> Adding changed files:  17% |######                              | ETA:  0:00:26
> Adding changed files:  18% |######                              | ETA:  0:00:26
> Adding changed files:  19% |######                              | ETA:  0:00:25
> Adding changed files:  20% |#######                             | ETA:  0:00:25
> Adding changed files:  21% |#######                             | ETA:  0:00:25
> Adding changed files:  22% |########                            | ETA:  0:00:24
> Adding changed files:  23% |########                            | ETA:  0:00:24
> Adding changed files:  24% |########                            | ETA:  0:00:23
> Adding changed files:  25% |#########                           | ETA:  0:00:23
> Adding changed files:  26% |#########                           | ETA:  0:00:23
> Adding changed files:  27% |#########                           | ETA:  0:00:23
> Adding changed files:  28% |##########                          | ETA:  0:00:23
> Adding changed files:  29% |##########                          | ETA:  0:00:22
> Adding changed files:  30% |##########                          | ETA:  0:00:22
> Adding changed files:  31% |###########                         | ETA:  0:00:22
> Adding changed files:  32% |###########                         | ETA:  0:00:22
> Adding changed files:  33% |############                        | ETA:  0:00:21
> Adding changed files:  34% |############                        | ETA:  0:00:21
> Adding changed files:  35% |############                        | ETA:  0:00:21
> Adding changed files:  36% |#############                       | ETA:  0:00:21
> Adding changed files:  37% |#############                       | ETA:  0:00:20
> Adding changed files:  38% |#############                       | ETA:  0:00:20
> Adding changed files:  39% |##############                      | ETA:  0:00:20
> Adding changed files:  40% |##############                      | ETA:  0:00:20
> Adding changed files:  41% |##############                      | ETA:  0:00:19
> Adding changed files:  42% |###############                     | ETA:  0:00:19
> Adding changed files:  43% |###############                     | ETA:  0:00:19
> Adding changed files:  44% |################                    | ETA:  0:00:18
> Adding changed files:  45% |################                    | ETA:  0:00:18
> Adding changed files:  46% |################                    | ETA:  0:00:18
> Adding changed files:  47% |#################                   | ETA:  0:00:17
> Adding changed files:  48% |#################                   | ETA:  0:00:17
> Adding changed files:  49% |#################                   | ETA:  0:00:17
> Adding changed files:  50% |##################                  | ETA:  0:00:17
> Adding changed files:  51% |##################                  | ETA:  0:00:16
> Adding changed files:  52% |###################                 | ETA:  0:00:16
> Adding changed files:  53% |###################                 | ETA:  0:00:16
> Adding changed files:  54% |###################                 | ETA:  0:00:15
> Adding changed files:  55% |####################                | ETA:  0:00:15
> Adding changed files:  56% |####################                | ETA:  0:00:15
> Adding changed files:  57% |####################                | ETA:  0:00:14
> Adding changed files:  58% |#####################               | ETA:  0:00:14
> Adding changed files:  59% |#####################               | ETA:  0:00:14
> Adding changed files:  60% |#####################               | ETA:  0:00:13
> Adding changed files:  61% |######################              | ETA:  0:00:13
> Adding changed files:  63% |######################              | ETA:  0:00:13
> Adding changed files:  64% |#######################             | ETA:  0:00:12
> Adding changed files:  65% |#######################             | ETA:  0:00:12
> Adding changed files:  66% |#######################             | ETA:  0:00:12
> Adding changed files:  67% |########################            | ETA:  0:00:11
> Adding changed files:  68% |########################            | ETA:  0:00:11
> Adding changed files:  69% |########################            | ETA:  0:00:11
> Adding changed files:  70% |#########################           | ETA:  0:00:10
> Adding changed files:  71% |#########################           | ETA:  0:00:10
> Adding changed files:  72% |#########################           | ETA:  0:00:10
> Adding changed files:  73% |##########################          | ETA:  0:00:09
> Adding changed files:  74% |##########################          | ETA:  0:00:09
> Adding changed files:  75% |###########################         | ETA:  0:00:09
> Adding changed files:  76% |###########################         | ETA:  0:00:08
> Adding changed files:  77% |###########################         | ETA:  0:00:08
> Adding changed files:  78% |############################        | ETA:  0:00:07
> Adding changed files:  79% |############################        | ETA:  0:00:07
> Adding changed files:  80% |############################        | ETA:  0:00:07
> Adding changed files:  81% |#############################       | ETA:  0:00:06
> Adding changed files:  82% |#############################       | ETA:  0:00:06
> Adding changed files:  83% |#############################       | ETA:  0:00:06
> Adding changed files:  84% |##############################      | ETA:  0:00:05
> Adding changed files:  85% |##############################      | ETA:  0:00:05
> Adding changed files:  86% |###############################     | ETA:  0:00:05
> Adding changed files:  87% |###############################     | ETA:  0:00:04
> Adding changed files:  88% |###############################     | ETA:  0:00:04
> Adding changed files:  89% |################################    | ETA:  0:00:03
> Adding changed files:  90% |################################    | ETA:  0:00:03
> Adding changed files:  91% |################################    | ETA:  0:00:03
> Adding changed files:  92% |#################################   | ETA:  0:00:02
> Adding changed files:  93% |#################################   | ETA:  0:00:02
> Adding changed files:  94% |##################################  | ETA:  0:00:02
> Adding changed files:  95% |##################################  | ETA:  0:00:01
> Adding changed files:  96% |##################################  | ETA:  0:00:01
> Adding changed files:  97% |################################### | ETA:  0:00:00
> Adding changed files:  98% |################################### | ETA:  0:00:00
> Adding changed files:  99% |################################### | ETA:  0:00:00
> Adding changed files: 100% |####################################| Time: 0:00:36
>
> INFO: Extracting current version source...
> INFO: Extracting upgraded version source...
> INFO: Fetchinghttps://static.rust-lang.org/dist/rustc-1.69.0-src.tar.xz;name=rust...
> INFO: Rebasing devtool onto 501a8ba40bc5d3e5ab5ee81bf2819c527bc8f221
> WARNING: Command 'git rebase 501a8ba40bc5d3e5ab5ee81bf2819c527bc8f221' failed:
> CONFLICT (modify/delete): vendor/crossbeam-utils-0.8.12/.cargo-checksum.json deleted in HEAD and modified in 8ca3ec0aa (rust: Fix crossbeam-utils for arches without atomics).  Version 8ca3ec0aa (rust: Fix crossbeam-utils for arches without atomics) of vendor/crossbeam-utils-0.8.12/.cargo-checksum.json left in tree.
> CONFLICT (modify/delete): vendor/crossbeam-utils-0.8.12/build.rs deleted in HEAD and modified in 8ca3ec0aa (rust: Fix crossbeam-utils for arches without atomics).  Version 8ca3ec0aa (rust: Fix crossbeam-utils for arches without atomics) of vendor/crossbeam-utils-0.8.12/build.rs left in tree.
>
> ERROR: Execution of 'git checkout devtool' failed with exit code 1:
> error: you need to resolve your current index first
> vendor/crossbeam-utils-0.8.12/.cargo-checksum.json: needs merge
> vendor/crossbeam-utils-0.8.12/build.rs: needs merge
>
>
>
> Please review the attached files for further information and build/update failures.
> Any problem please file a bug athttps://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler
>
> Regards,
> The Upgrade Helper


-- 
# Randy MacLeod
# Wind River Linux

--------------zrLMPlpoTztkMRymX8NzmLKK
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2023-05-01 17:25,
      <a class="moz-txt-link-abbreviated" href="mailto:auh@yoctoproject.org">auh@yoctoproject.org</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:01010187d9352360-4eff0521-e848-4365-a203-ba8b516d3d8b-000000@us-west-2.amazonses.com">
      <pre class="moz-quote-pre" wrap="">Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *rust* to *1.69.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade rust -V 1.69.0</pre>
    </blockquote>
    <p>Sundeep said that he will start working on this tomorrow unless
      someone else speaks up<br>
      about having the update underway. 1.70 isn't due until June 1st or
      so.<br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:01010187d9352360-4eff0521-e848-4365-a203-ba8b516d3d8b-000000@us-west-2.amazonses.com">
      <pre class="moz-quote-pre" wrap="">
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (14:02:48.244299)
Loading cache...done.
Loaded 1799 entries from dependency cache.
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = &quot;2.4.0&quot;
BUILD_SYS            = &quot;x86_64-linux&quot;
NATIVELSBSTRING      = &quot;universal&quot;
TARGET_SYS           = &quot;x86_64-poky-linux&quot;
MACHINE              = &quot;qemux86-64&quot;
DISTRO               = &quot;poky&quot;
DISTRO_VERSION       = &quot;4.2&quot;
TUNE_FEATURES        = &quot;m64 core2&quot;
TARGET_FPU           = &quot;&quot;
meta                 
meta-poky            
meta-yocto-bsp       = &quot;tmp-auh-upgrades:c08f5fabc6f19121f285caaed7c99e1ba459baab&quot;
workspace            = &quot;master:cce6db2a59d309f77c1f9ca173fc674c506062d0&quot;

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 22 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 102 tasks of which 99 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
Loading cache...done.
Loaded 1799 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (898 cached, 2 parsed). 1800 targets, 39 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = &quot;2.4.0&quot;
BUILD_SYS            = &quot;x86_64-linux&quot;
NATIVELSBSTRING      = &quot;universal&quot;
TARGET_SYS           = &quot;x86_64-poky-linux&quot;
MACHINE              = &quot;qemux86-64&quot;
DISTRO               = &quot;poky&quot;
DISTRO_VERSION       = &quot;4.2&quot;
TUNE_FEATURES        = &quot;m64 core2&quot;
TARGET_FPU           = &quot;&quot;
meta                 
meta-poky            
meta-yocto-bsp       = &quot;tmp-auh-upgrades:c08f5fabc6f19121f285caaed7c99e1ba459baab&quot;
workspace            = &quot;master:cce6db2a59d309f77c1f9ca173fc674c506062d0&quot;

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 18 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 83 tasks of which 81 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   1% |                                    | ETA:  0:01:03
Adding changed files:   2% |                                    | ETA:  0:00:45
Adding changed files:   3% |#                                   | ETA:  0:00:40
Adding changed files:   4% |#                                   | ETA:  0:00:36
Adding changed files:   5% |#                                   | ETA:  0:00:34
Adding changed files:   6% |##                                  | ETA:  0:00:33
Adding changed files:   7% |##                                  | ETA:  0:00:32
Adding changed files:   8% |##                                  | ETA:  0:00:31
Adding changed files:   9% |###                                 | ETA:  0:00:30
Adding changed files:  10% |###                                 | ETA:  0:00:30
Adding changed files:  11% |####                                | ETA:  0:00:29
Adding changed files:  12% |####                                | ETA:  0:00:29
Adding changed files:  13% |####                                | ETA:  0:00:28
Adding changed files:  14% |#####                               | ETA:  0:00:27
Adding changed files:  15% |#####                               | ETA:  0:00:27
Adding changed files:  16% |#####                               | ETA:  0:00:27
Adding changed files:  17% |######                              | ETA:  0:00:26
Adding changed files:  18% |######                              | ETA:  0:00:26
Adding changed files:  19% |######                              | ETA:  0:00:25
Adding changed files:  20% |#######                             | ETA:  0:00:25
Adding changed files:  21% |#######                             | ETA:  0:00:25
Adding changed files:  22% |########                            | ETA:  0:00:24
Adding changed files:  23% |########                            | ETA:  0:00:24
Adding changed files:  24% |########                            | ETA:  0:00:23
Adding changed files:  25% |#########                           | ETA:  0:00:23
Adding changed files:  26% |#########                           | ETA:  0:00:23
Adding changed files:  27% |#########                           | ETA:  0:00:23
Adding changed files:  28% |##########                          | ETA:  0:00:23
Adding changed files:  29% |##########                          | ETA:  0:00:22
Adding changed files:  30% |##########                          | ETA:  0:00:22
Adding changed files:  31% |###########                         | ETA:  0:00:22
Adding changed files:  32% |###########                         | ETA:  0:00:22
Adding changed files:  33% |############                        | ETA:  0:00:21
Adding changed files:  34% |############                        | ETA:  0:00:21
Adding changed files:  35% |############                        | ETA:  0:00:21
Adding changed files:  36% |#############                       | ETA:  0:00:21
Adding changed files:  37% |#############                       | ETA:  0:00:20
Adding changed files:  38% |#############                       | ETA:  0:00:20
Adding changed files:  39% |##############                      | ETA:  0:00:20
Adding changed files:  40% |##############                      | ETA:  0:00:20
Adding changed files:  41% |##############                      | ETA:  0:00:19
Adding changed files:  42% |###############                     | ETA:  0:00:19
Adding changed files:  43% |###############                     | ETA:  0:00:19
Adding changed files:  44% |################                    | ETA:  0:00:18
Adding changed files:  45% |################                    | ETA:  0:00:18
Adding changed files:  46% |################                    | ETA:  0:00:18
Adding changed files:  47% |#################                   | ETA:  0:00:17
Adding changed files:  48% |#################                   | ETA:  0:00:17
Adding changed files:  49% |#################                   | ETA:  0:00:17
Adding changed files:  50% |##################                  | ETA:  0:00:17
Adding changed files:  51% |##################                  | ETA:  0:00:16
Adding changed files:  52% |###################                 | ETA:  0:00:16
Adding changed files:  53% |###################                 | ETA:  0:00:16
Adding changed files:  54% |###################                 | ETA:  0:00:15
Adding changed files:  55% |####################                | ETA:  0:00:15
Adding changed files:  56% |####################                | ETA:  0:00:15
Adding changed files:  57% |####################                | ETA:  0:00:14
Adding changed files:  58% |#####################               | ETA:  0:00:14
Adding changed files:  59% |#####################               | ETA:  0:00:14
Adding changed files:  60% |#####################               | ETA:  0:00:13
Adding changed files:  61% |######################              | ETA:  0:00:13
Adding changed files:  63% |######################              | ETA:  0:00:13
Adding changed files:  64% |#######################             | ETA:  0:00:12
Adding changed files:  65% |#######################             | ETA:  0:00:12
Adding changed files:  66% |#######################             | ETA:  0:00:12
Adding changed files:  67% |########################            | ETA:  0:00:11
Adding changed files:  68% |########################            | ETA:  0:00:11
Adding changed files:  69% |########################            | ETA:  0:00:11
Adding changed files:  70% |#########################           | ETA:  0:00:10
Adding changed files:  71% |#########################           | ETA:  0:00:10
Adding changed files:  72% |#########################           | ETA:  0:00:10
Adding changed files:  73% |##########################          | ETA:  0:00:09
Adding changed files:  74% |##########################          | ETA:  0:00:09
Adding changed files:  75% |###########################         | ETA:  0:00:09
Adding changed files:  76% |###########################         | ETA:  0:00:08
Adding changed files:  77% |###########################         | ETA:  0:00:08
Adding changed files:  78% |############################        | ETA:  0:00:07
Adding changed files:  79% |############################        | ETA:  0:00:07
Adding changed files:  80% |############################        | ETA:  0:00:07
Adding changed files:  81% |#############################       | ETA:  0:00:06
Adding changed files:  82% |#############################       | ETA:  0:00:06
Adding changed files:  83% |#############################       | ETA:  0:00:06
Adding changed files:  84% |##############################      | ETA:  0:00:05
Adding changed files:  85% |##############################      | ETA:  0:00:05
Adding changed files:  86% |###############################     | ETA:  0:00:05
Adding changed files:  87% |###############################     | ETA:  0:00:04
Adding changed files:  88% |###############################     | ETA:  0:00:04
Adding changed files:  89% |################################    | ETA:  0:00:03
Adding changed files:  90% |################################    | ETA:  0:00:03
Adding changed files:  91% |################################    | ETA:  0:00:03
Adding changed files:  92% |#################################   | ETA:  0:00:02
Adding changed files:  93% |#################################   | ETA:  0:00:02
Adding changed files:  94% |##################################  | ETA:  0:00:02
Adding changed files:  95% |##################################  | ETA:  0:00:01
Adding changed files:  96% |##################################  | ETA:  0:00:01
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files:  98% |################################### | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:36

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching <a class="moz-txt-link-freetext" href="https://static.rust-lang.org/dist/rustc-1.69.0-src.tar.xz;name=rust">https://static.rust-lang.org/dist/rustc-1.69.0-src.tar.xz;name=rust</a>...
INFO: Rebasing devtool onto 501a8ba40bc5d3e5ab5ee81bf2819c527bc8f221
WARNING: Command 'git rebase 501a8ba40bc5d3e5ab5ee81bf2819c527bc8f221' failed:
CONFLICT (modify/delete): vendor/crossbeam-utils-0.8.12/.cargo-checksum.json deleted in HEAD and modified in 8ca3ec0aa (rust: Fix crossbeam-utils for arches without atomics).  Version 8ca3ec0aa (rust: Fix crossbeam-utils for arches without atomics) of vendor/crossbeam-utils-0.8.12/.cargo-checksum.json left in tree.
CONFLICT (modify/delete): vendor/crossbeam-utils-0.8.12/build.rs deleted in HEAD and modified in 8ca3ec0aa (rust: Fix crossbeam-utils for arches without atomics).  Version 8ca3ec0aa (rust: Fix crossbeam-utils for arches without atomics) of vendor/crossbeam-utils-0.8.12/build.rs left in tree.

ERROR: Execution of 'git checkout devtool' failed with exit code 1:
error: you need to resolve your current index first
vendor/crossbeam-utils-0.8.12/.cargo-checksum.json: needs merge
vendor/crossbeam-utils-0.8.12/build.rs: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at <a class="moz-txt-link-freetext" href="https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler">https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler</a>

Regards,
The Upgrade Helper</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------zrLMPlpoTztkMRymX8NzmLKK--

