Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF2E3C4828F
	for <webhook@archiver.kernel.org>; Sun,  4 Feb 2024 02:58:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.31664.1707015493376636385
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Feb 2024 18:58:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=IUr2lysq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2764459116=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4142b2hG008939
	for <openembedded-core@lists.openembedded.org>; Sat, 3 Feb 2024 18:58:13 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=zmQff7Ipx03aO2pHME0gzmgIU02a5AzuAui1hTz7dT0=; b=
	IUr2lysqqPpOQ2FvOF7QUxI4ut++lgOkMkk27ndd/ZbuXGHBbDf26HW5C7i7OUsa
	340cREtyIjtIz1ogaYUh8Q+MNArDK2xqHdtbK8nScK/U/xBUyshx/dJOjaRNrCiw
	Tf6JnkW19PYSK6fHpp3tc7UGmd18RlqWXEIGLTqFU1kDOSFzvdJpeft5CuDHYgOD
	B0IsonWOhx1qVFv0WNjH5hFu8Ldf7cQatOG9kmMbxKWiy4lbD+ZJdxnGFFVjmMLi
	oEMiDmYR9k6gluY0o+6TGukK9BbVe6li4/zJlTKkEptjFsjdIuiYkcd0gwnwus4p
	33m4oo5A2ooF/6dNFYQ+7w==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w1nvm0day-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 18:58:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=apy1UL7B7zDbA/uMPX75I2m3I26i0u0VkCsCX+tlrhYvuKmHE3uz9XWFvzxMw+noBoNCsCB2A00KRb3lLETDEg6LXQQ/KVZIwDi7k1a0NnRfhqNimreyinbJbfesmOSW673z/ZU7Om8UhzjeRn6OrCxJxdb0J43IBvjj6Z1NJA2MMWpqyXwISdSdxQ8OMq3H5sfGFgV+IrNzDFThXPYRn/2vWFIPXidAQqbEkDFg+6Y2xzdauF0UTpQy7AWkX2iqgLmQKtu4qxLAJecOMcc2gdR7wj32mJ4Q6HvKtVdeHnlhhHXB7qf8JOMgrEAhYS1jZvR4tADS7Nc5O+0Ev7zE8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zmQff7Ipx03aO2pHME0gzmgIU02a5AzuAui1hTz7dT0=;
 b=YZ06takTYsoIQVqM7fBeidCBNlWyahOhqmwpeUlctucpU6qpHYsJvXWnlACZQhgK5ofujuGqz0bjETPSt8wbQw6bTrnX9pnwVOsXf88pYcd7V4THsQ7b/wtTwBcvp0Iu0BYs+Y7UnHhbA8TjvGShfPpFekssPzWqTE8lHi7L7frQYzTHj0NrsuiDwLwJRl4+bG/cGy6MH/VHUCMTFaOiQggYq9Qs7V5RgTfk0kf82gIcRN2p+py90lBxwTq3s5b4xOVCv+ld62CAAF73saPo+dFI+3n6ndi3GoKcmADnJ3/nUHVFDuD2MG1Zr6S58nNm/XmWI4zXKSfUhqB+l6wi3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by DS7PR11MB7950.namprd11.prod.outlook.com (2603:10b6:8:e0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.31; Sun, 4 Feb
 2024 02:58:10 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8b8e:f9b9:7a84:375e]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8b8e:f9b9:7a84:375e%4]) with mapi id 15.20.7249.032; Sun, 4 Feb 2024
 02:58:10 +0000
Message-ID: <f32ecfd5-5d95-403e-87ed-b2db21a1afde@windriver.com>
Date: Sun, 4 Feb 2024 10:58:04 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC PATCH V2 0/5] Fix persistent tmp
Content-Language: en-US
To: Changqing Li <changqing.li@eng.windriver.com>,
        openembedded-core@lists.openembedded.org
References: <179FA115B6317FAF.20566@lists.openembedded.org>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <179FA115B6317FAF.20566@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY2PR01CA0005.jpnprd01.prod.outlook.com
 (2603:1096:404:a::17) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|DS7PR11MB7950:EE_
X-MS-Office365-Filtering-Correlation-Id: f4c63f1b-fd23-4c13-ee46-08dc252d1eb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pf8BrINATfiYl46zE09EEPGktbL5v6p3uDtPq7y9nNkgEq92oYKO48Kjs6Q7DZVb5f9E7q72Dz4e9HZau3PW7KHFAH+nVdcNEBFkn28b1dlxBU75bub6zXLpgSS41+G0ktphTZNgq+3tiKo/+lIiE8Er1o8+LL1wKqu7c9agU4kbO4Dp/aHedl9b96DyCXnJjOEw3/7WCvFJINXFNeJ/bdUqmFoTDH+lRce+1MqACKcgK3tTw1MjTKPe1p7L57V39Yu4B/EV0MejFc8+P71oy/qwcObG/FVzhTROhfFM/0RuA5KHhNY/HhWAwORAZ/C8CfslKgsvCRnUuerwFWsIagvGwEODavUDhZ9+kI59zAV8UGzwLL+VIbMERfdI8HUAQ/y+lIY8jonb+mPz5CVBD6ISUI9l2sMkBJeGYQOuZQeAnmVJAJn0reOZSQlYNtU6Q6mXJ2AE9TCBWn4vMX4n6ehMZG4b2BeD7ZPv1DsC4/EHCntWkiKveNdjtAsLo60FQpUrJ0byMwZBlOgGP3zdZ+CTuSCUxzWvtq0X1O7nUtBCyZ9g4ah+LkVr109vf/Y5kYzcFhMLW6UVbS+G1uz+J18QW5nY2M1Bp0Vbv/idPt7Va4MTbYraoxTDLmoJW7jf
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(396003)(39840400004)(376002)(136003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(31696002)(26005)(2616005)(83380400001)(41300700001)(38100700002)(86362001)(8936002)(6506007)(8676002)(66946007)(316002)(5660300002)(66556008)(2906002)(66476007)(44832011)(6666004)(30864003)(53546011)(478600001)(966005)(6486002)(6512007)(36756003)(31686004)(66899024)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TjZiMElUQ09NVHpYZW9VNjJTT0VWVjlTNTZiaTRHUmtkOCtxRDc5TGZ0SFhH?=
 =?utf-8?B?bnJEZjE3T1dPTCtNaWNzdi9mRTJaYTZ3UldzRGxXMXlmcUg1a1VhRWdsd0tx?=
 =?utf-8?B?NitmdlpPQTd6RnozTnBsczJoTnZ5aVN5YktMUEpzeTB2OHFUSm4zQTFuSllZ?=
 =?utf-8?B?cHpDNlhteER1Zm1USUg1bkpQaEM4ZGJmR1FTSklLd2k5MDhjQ0NscW9FVnJl?=
 =?utf-8?B?L1YzOUZRV3hucGZ1SmdEUnYybms3NTNUdjVQNlFpZHArY3FJQ016RmNIbFFU?=
 =?utf-8?B?dmhVSm0rYnN5V292cFJ1WW5ob3JaWEhmV1dVdnZkdzQrYjBVR0t6N013MkdM?=
 =?utf-8?B?RHkyTWtjNENvbStHUzJGZWs4a3l5Y0drdmRuOVFtV1FINXlDR3VkRlFSWno1?=
 =?utf-8?B?UGg1emZqZE1NbGFQS2JMd25sRHc3dVhFWUp0dVEzeVNCSWpwU3ZqVlQ5WS9Q?=
 =?utf-8?B?YmExbElvdHo5a1dCTVQzd0NTM1pvSjhjY2ZhSTExVVNVS21WL1VHMWplK3hm?=
 =?utf-8?B?M05QK1pINnQxNkpXdzNIQ2ZxMVdXOVR6dk5yUWtDSnJzWERZeVdtREJNbmF0?=
 =?utf-8?B?TSt6ZW1ObDFTZkZtcjVhV2lxOHp4Rm5xQXFmcTAxL045RVZUUDQ4Z1hMSmZC?=
 =?utf-8?B?VTVaSUVURmZYWHJLUWptd3BhNXRrV045aGdFSEY1STVaemIvd3YxZCtKRDVo?=
 =?utf-8?B?WUJJeCtJZ2wwa2xKWnQ5a2gzaVFORlpUZXNHVUJBa3VXRHZsR1ptWHgwTitX?=
 =?utf-8?B?WHkyUkxlbFp1SXZDcjFlNUVpNUxrekkrd3FDTEhDT0pwOXRUcGpFcEFxV1Bq?=
 =?utf-8?B?MnJqY2pJejJkTmM0R3pMTkt0VTRnMU9ydVhJMG5EdkYyWWRnMEd5UVFWQm5K?=
 =?utf-8?B?ZzUvSjluUnN0NDFuWndkOGpaQ0NqRlNDNk8wdHFhZWhsZ2JmZGxmR3NheFBi?=
 =?utf-8?B?cWRmU3phSkFZRitkcUxMc2dObkp4WktteFlhaWRCMjZ2OWNKVTAyM2hZOU5i?=
 =?utf-8?B?dmwwMWJPa1BBNlNBRVJBYmdMNU9QRldVTW9haDVPSW5GUnI3YXF0clZocWtu?=
 =?utf-8?B?R1ZmNlFmMTM5cUNReWN4aHlYTDJPaGVJY080Y2dIcXlHeEN1Z2pkbjVmcjZR?=
 =?utf-8?B?WGdEUnBBcFZTcUdpUStiaHhBY0JlR1hadVoraDh5VjkreW9JMFc4V2ZEMkxS?=
 =?utf-8?B?ZkJLQmE3NTl5cnpBMUlqcWJLc2lCRnlKK3ZYSWI4RU5rZmt0U0llRVkwRDFI?=
 =?utf-8?B?L0dCNjRjMFJ3ZXI0RU5jeDlBVGlteCtkL1krRDFjWDZsOGw5ZkFkR0JVUEsv?=
 =?utf-8?B?OXVyQ3NTRmdpTWVWa1V4c2Z2bGZBdVdxTE1NTCtpU1FXeDg4VStjb0dVejMx?=
 =?utf-8?B?UW5rbm5zZDhyVm1tWHV3QUdyblZla1JpTWdoazY1R3VDcld2K1R3TXJMaS9n?=
 =?utf-8?B?WlVPY0s5a1Q5Y1o1RHB3dXkwR2NKQU5Cd1UwakFNdVNkZ2lPYys0SEY3NFdK?=
 =?utf-8?B?dXJMT1Z2eDZ5bW1FVVBYMUkvdVA2c29sZU9wSEdmS0JCRkMwcFVsL0JWTStY?=
 =?utf-8?B?VXc1R2d3VkQ4dy9RRlZlaWRVenhSKytqYVFvOVEyYTUrMWUyRTRVV1QzK2NU?=
 =?utf-8?B?ZUpIbGNHV3pyUlFTS2tpbVJ5SlBWSVFPUUl6UHRBTURNMElVc2dSQzdqcm1t?=
 =?utf-8?B?WkNTYjFhZnlaRGFsZnIxS0YrMGNQTDNTcGtsZk1TZEVwR3YzTmxLN21WOVFU?=
 =?utf-8?B?V2FucFlkOHRDVi9LVnZwYmx6Y3JrdnFGUWJ4VWw2OTIzWVQvbW1aL3RpVU5G?=
 =?utf-8?B?RVBjQUdhNmNRUGVMYjRmZUNQaDNvQ3dqN1V4R21rdDB5L2JSQWJKaElFc3ZR?=
 =?utf-8?B?a2toNkpYVnZKd1VNdWtBQkZwY2JpK3JKTHU2NkFEdCtxa3BFMjZGMWx1WU1n?=
 =?utf-8?B?eHllaEhmakhzL3FZN2RqL0ZEbHBGa1pPdWlhb0xQU1A1aDN0Tk0vdWd0eHJS?=
 =?utf-8?B?dGp6VENKejU3Nno3TjZVRkx6MllURW9kdDk0ZkZ0aGVmdXhQNWIxYWNjYU9Q?=
 =?utf-8?B?cFhoOUZOMENFYWx4enE5dW1kSnRTR2xJZXFsa1RoK1libEFIdWZWYVZDVWVR?=
 =?utf-8?B?YURqekdqUmt2d2RmcUlydFhueHRYellHZzllWlVjczZIVGlPbllyaDA4cUp0?=
 =?utf-8?B?dnc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4c63f1b-fd23-4c13-ee46-08dc252d1eb7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2024 02:58:10.2024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v/u4AQqkm1xzzCwmA9fLU5+QbD/04XtyEe6xeGyZpZ3My6FDu1pOKmbo5tnUrGjc8wJ5MSTAPecB4g+29Pk56j0gjHeMbZh1YSKgPaKRbRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7950
X-Proofpoint-GUID: mBcx0IuDR8cexQw2SKwE6lP2El9ApHLP
X-Proofpoint-ORIG-GUID: mBcx0IuDR8cexQw2SKwE6lP2El9ApHLP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-03_18,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=947 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402040020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Feb 2024 02:58:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194868

ping

On 12/11/23 08:58, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> Hi, All
>
> Currently, VOLATILE_TMP_DIR not works,
> set VOLATILE_TMP_DIR="no", VOLATILE_LOG_DIR="no", after boot target,
> /var/tmp still link to tmpfs /var/volatile/tmp
>
> lrwxrwxrwx  1 root root   11 Mar  9  2018 lock -> ../run/lock
> drwxr-xr-x  4 root root 1024 Dec  4 07:55 log
> lrwxrwxrwx  1 root root    6 Mar  9  2018 run -> ../run
> drwxr-xr-x  3 root root 1024 Mar  9  2018 spool
> lrwxrwxrwx  1 root root   12 Mar  9  2018 tmp -> volatile/tmp
> drwxrwxrwt  4 root root   80 Dec  4 07:55 volatile
>
> So I do some research, fix this issue and do some other changes accordingly. Please
> help to review this patch, thanks.
>
> Targets:
> 1. Support persistent tmp,  For persistent tmp, only /var/tmp is persistent, /tmp is tmpfs,
>     For volatile tmp, /tmp link to /var/tmp, /var/tmp link to /var/volatile/tmp
> 2. make systemd and SysVinit have the same directory structure.
>
> Currently, systemd and SysVinit have different directory structure, the difference focus on how to handle /tmp.
>
> when volatile is enabled, for sysVinit, /tmp link to /var/tmp, /var/tmp link to /var/volatile/tmp
> refer [4][5]. but for systemd, /tmp is a directory, it is mounted by systemd as tmpfs. /var/tmp
> linked to /var/volatile/tmp.  And for systemd, refer [6], set different age for /tmp and /var/tmp.
>
> Since volatile disabled not works, ignore the difference when volatile is disabled.
>
> With this patch, VOLATILE_TMP_DIR will behavior like this:
> For both sysvinit and systemd:
> 1. VOLATILE_TMP_DIR="yes":
> /tmp link to /var/tmp,  /var/tmp link to /var/volatile/log,  /var/volatile is mounted as tmpfs
> In this case, for systemd, /tmp and /var/tmp will set to the same age, 10d.
>
> Compare to current behavior, there are 2 changes:
>     1) for systemd,  /tmp changed from a directy to a symlink to /var/tmp
>     2) age of /tmp and /var/tmp will be same
>
> 2. VOLATILE_TMP_DIR="no":
> /tmp is a directory mounted as tmpfs, /var/tmp is a directory on persistent fs, and keep the age as [6]
>
> Change like this in order to meet [1][2], also maybe [3] for systemd.
>
> Compare to current behavior, there is one change:
>     1) for sysVinit, /tmp changed from a symlink to a directory
>
> [1] https://refspecs.linuxfoundation.org/FHS_3.0/fhs/ch03s18.html
> [2] https://refspecs.linuxfoundation.org/FHS_3.0/fhs/ch05s15.html
> [3] https://systemd.io/TEMPORARY_DIRECTORIES/
> [4] https://git.openembedded.org/openembedded/tree/docs/usermanual/chapters/recipes.xml#n3535
> [5] https://git.openembedded.org/openembedded-core/commit/?id=12c4acd7ac5a27cf3676065b60f1c8395c96854c
> [6] https://github.com/systemd/systemd/blob/main/tmpfiles.d/tmp.conf
> [7] https://www.freedesktop.org/software/systemd/man/latest/tmpfiles.d.html
>
>
> Test Result of following cases:
> 1.
> SysVinit
> VOLATILE_TMP_DIR="yes"
> VOLATILE_LOG_DIR="yes"
>
> root@qemux86-64:~# ls -al /tmp
> lrwxrwxrwx    1 root     root             8 Dec  8 08:51 /tmp -> /var/tmp
> root@qemux86-64:~# ls -al /var/log
> lrwxrwxrwx    1 root     root            17 Dec  8 08:51 /var/log -> /var/volatile/log
> root@qemux86-64:~# ls -al /var/tmp
> lrwxrwxrwx    1 root     root            17 Dec  8 08:51 /var/tmp -> /var/volatile/tmp
> root@qemux86-64:~# mount | grep volatile
> tmpfs on /var/volatile type tmpfs (rw,relatime)
> root@qemux86-64:~#
>
> 2.
> SysVinit
> VOLATILE_TMP_DIR="no"
> VOLATILE_LOG_DIR="no"
>
> root@qemux86-64:/# ls -al
> drwxr-xr-x   18 root     root          1024 Dec  8 09:22 .
> drwxr-xr-x   18 root     root          1024 Dec  8 09:22 ..
> drwxr-xr-x    2 root     root          3072 Mar  9  2018 bin
> drwxr-xr-x    2 root     root          1024 Mar  9  2018 boot
> drwxr-xr-x   13 root     root          2960 Dec  8 09:24 dev
> drwxr-xr-x   20 root     root          1024 Dec  8 09:24 etc
> drwxr-xr-x    3 root     root          1024 Mar  9  2018 home
> drwxr-xr-x    6 root     root          1024 Mar  9  2018 lib
> drwx------    2 root     root         12288 Dec  8 09:22 lost+found
> drwxr-xr-x    2 root     root          1024 Mar  9  2018 media
> drwxr-xr-x    2 root     root          1024 Mar  9  2018 mnt
> dr-xr-xr-x  161 root     root             0 Dec  8 09:24 proc
> drwxr-xr-x    4 root     root           240 Dec  8 09:24 run
> drwxr-xr-x    2 root     root          3072 Mar  9  2018 sbin
> dr-xr-xr-x   12 root     root             0 Dec  8 09:24 sys
> drwxrwxrwt    2 root     root            40 Dec  8 09:24 tmp
> drwxr-xr-x    9 root     root          1024 Mar  9  2018 usr
> drwxr-xr-x   10 root     root          1024 Dec  8 09:24 var
> root@qemux86-64:/# cd /var/
> root@qemux86-64:/var# ls -al
> drwxr-xr-x   10 root     root          1024 Dec  8 09:24 .
> drwxr-xr-x   18 root     root          1024 Dec  8 09:22 ..
> drwxr-xr-x    2 root     root          1024 Mar  9  2018 backups
> drwxr-xr-x    2 root     root          1024 Mar  9  2018 cache
> drwxr-xr-x    4 root     root          1024 Mar  9  2018 lib
> drwxr-xr-x    2 root     root          1024 Mar  9  2018 local
> lrwxrwxrwx    1 root     root             9 Dec  8 09:24 lock -> /run/lock
> drwxr-xr-x    2 root     root          1024 Dec  8 09:24 log
> lrwxrwxrwx    1 root     root             4 Dec  8 09:24 run -> /run
> drwxr-xr-x    2 root     root          1024 Mar  9  2018 spool
> drwxrwxrwt    2 root     root          1024 Mar  9  2018 tmp
> drwxrwxrwt    4 root     root            80 Dec  8 09:24 volatile
> root@qemux86-64:/var# mount | grep tmpfs
> devtmpfs on /dev type devtmpfs (rw,relatime,size=1012164k,nr_inodes=253041,mode=755)
> tmpfs on /run type tmpfs (rw,nosuid,nodev,mode=755)
> tmpfs on /var/volatile type tmpfs (rw,relatime)
> tmpfs on /tmp type tmpfs (rw,nosuid,nodev,nr_inodes=1048576)
> root@qemux86-64:/var#
>
>
> 3.
> systemd
> VOLATILE_TMP_DIR="yes"
> VOLATILE_LOG_DIR="yes"
>
> root@qemux86-64:/# ls -al /tmp
> lrwxrwxrwx    1 root     root             8 Dec  8 08:49 /tmp -> /var/tmp
>             8 Dec  8 08:49 /tmp -> /var/tmp
> root@qemux86-64:/# cd /var/
> root@qemux86-64:/var# ls -al tmp
> lrwxrwxrwx    1 root     root            12 Mar  9  2018 tmp -> volatile/tmp
> root@qemux86-64:/var# ls -al log
> lrwxrwxrwx    1 root     root            12 Mar  9  2018 log -> volatile/log
> root@qemux86-64:/var# mount | grep tmp
> devtmpfs on /dev type devtmpfs (rw,relatime,size=1012160k,nr_inodes=253040,mode=755)
> tmpfs on /dev/shm type tmpfs (rw,nosuid,nodev)
> tmpfs on /run type tmpfs (rw,nosuid,nodev,size=405732k,nr_inodes=819200,mode=755)
> tmpfs on /sys/fs/cgroup type tmpfs (ro,nosuid,nodev,noexec,size=4096k,nr_inodes=1024,mode=755)
> tmpfs on /var/volatile type tmpfs (rw,relatime)
> root@qemux86-64:/var#
>
> 4.
> systemd
> VOLATILE_TMP_DIR="no"
> VOLATILE_LOG_DIR="no"
>
> root@qemux86-64:/# ls -al
> drwxr-xr-x   17 root     root          1024 Dec  8 09:16 .
> drwxr-xr-x   17 root     root          1024 Dec  8 09:16 ..
> lrwxrwxrwx    1 root     root             7 Mar  9  2018 bin -> usr/bin
> drwxr-xr-x    2 root     root          1024 Mar  9  2018 boot
> drwxr-xr-x   14 root     root          3260 Dec  8 09:16 dev
> drwxr-xr-x   21 root     root          3072 Dec  8 09:16 etc
> drwxr-xr-x    3 root     root          1024 Mar  9  2018 home
> lrwxrwxrwx    1 root     root             7 Mar  9  2018 lib -> usr/lib
> drwx------    2 root     root         12288 Dec  8 09:16 lost+found
> drwxr-xr-x    2 root     root          1024 Mar  9  2018 media
> drwxr-xr-x    2 root     root          1024 Mar  9  2018 mnt
> dr-xr-xr-x  173 root     root             0 Dec  8 09:16 proc
> drwx------    3 root     root          1024 Dec  8 09:16 root
> drwxr-xr-x   11 root     root           320 Dec  8 09:16 run
> lrwxrwxrwx    1 root     root             8 Mar  9  2018 sbin -> usr/sbin
> drwxr-xr-x    2 root     root          1024 Mar  9  2018 srv
> dr-xr-xr-x   12 root     root             0 Dec  8 09:16 sys
> drwxrwxrwt    9 root     root           180 Dec  8 09:16 tmp
> drwxr-xr-x   10 root     root          1024 Mar  9  2018 usr
> drwxr-xr-x   10 root     root          1024 Dec  8 09:16 var
> root@qemux86-64:/# cd /var/
> root@qemux86-64:/var# ls -al
> drwxr-xr-x   10 root     root          1024 Dec  8 09:16 .
> drwxr-xr-x   17 root     root          1024 Dec  8 09:16 ..
> -rw-r--r--    1 root     root           208 Mar  9  2018 .updated
> drwxr-xr-x    2 root     root          1024 Mar  9  2018 backups
> drwxr-xr-x    4 root     root          1024 Dec  8 09:16 cache
> drwxr-xr-x    6 root     root          1024 Dec  8 09:16 lib
> drwxr-xr-x    2 root     root          1024 Mar  9  2018 local
> lrwxrwxrwx    1 root     root            11 Mar  9  2018 lock -> ../run/lock
> drwxr-xr-x    4 root     root          1024 Dec  8 09:16 log
> lrwxrwxrwx    1 root     root             6 Mar  9  2018 run -> ../run
> drwxr-xr-x    3 root     root          1024 Mar  9  2018 spool
> drwxrwxrwt    5 root     root          1024 Dec  8 09:16 tmp
> drwxrwxrwt    2 root     root            40 Dec  8 09:16 volatile
> root@qemux86-64:/var# mount | grep tmpfs
> devtmpfs on /dev type devtmpfs (rw,relatime,size=1012164k,nr_inodes=253041,mode=755)
> tmpfs on /dev/shm type tmpfs (rw,nosuid,nodev)
> tmpfs on /run type tmpfs (rw,nosuid,nodev,size=405732k,nr_inodes=819200,mode=755)
> tmpfs on /sys/fs/cgroup type tmpfs (ro,nosuid,nodev,noexec,size=4096k,nr_inodes=1024,mode=755)
> tmpfs on /tmp type tmpfs (rw,nosuid,nodev,nr_inodes=1048576)
> tmpfs on /var/volatile type tmpfs (rw,relatime)
> root@qemux86-64:/var#
>
> 5.
> SysVinit
> VOLATILE_TMP_DIR="yes"
> VOLATILE_LOG_DIR="no"
>
> root@qemux86-64:/# ls -al
> drwxr-xr-x   17 root     root          1024 Dec  8 09:40 .
> drwxr-xr-x   17 root     root          1024 Dec  8 09:40 ..
> drwxr-xr-x    2 root     root          3072 Mar  9  2018 bin
> drwxr-xr-x    2 root     root          1024 Mar  9  2018 boot
> drwxr-xr-x   13 root     root          2960 Dec  8 09:40 dev
> drwxr-xr-x   20 root     root          1024 Dec  8 09:40 etc
> drwxr-xr-x    3 root     root          1024 Mar  9  2018 home
> drwxr-xr-x    6 root     root          1024 Mar  9  2018 lib
> drwx------    2 root     root         12288 Dec  8 09:40 lost+found
> drwxr-xr-x    2 root     root          1024 Mar  9  2018 media
> drwxr-xr-x    2 root     root          1024 Mar  9  2018 mnt
> dr-xr-xr-x  159 root     root             0 Dec  8 09:40 proc
> drwxr-xr-x    4 root     root           240 Dec  8 09:40 run
> drwxr-xr-x    2 root     root          3072 Mar  9  2018 sbin
> dr-xr-xr-x   12 root     root             0 Dec  8 09:40 sys
> lrwxrwxrwx    1 root     root             8 Dec  8 09:40 tmp -> /var/tmp
> drwxr-xr-x    9 root     root          1024 Mar  9  2018 usr
> drwxr-xr-x    9 root     root          1024 Dec  8 09:40 var
> root@qemux86-64:/# cd /var/
> root@qemux86-64:/var# ls -al
> drwxr-xr-x    9 root     root          1024 Dec  8 09:40 .
> drwxr-xr-x   17 root     root          1024 Dec  8 09:40 ..
> drwxr-xr-x    2 root     root          1024 Mar  9  2018 backups
> drwxr-xr-x    2 root     root          1024 Mar  9  2018 cache
> drwxr-xr-x    4 root     root          1024 Mar  9  2018 lib
> drwxr-xr-x    2 root     root          1024 Mar  9  2018 local
> lrwxrwxrwx    1 root     root             9 Dec  8 09:40 lock -> /run/lock
> drwxr-xr-x    2 root     root          1024 Dec  8 09:40 log
> lrwxrwxrwx    1 root     root             4 Dec  8 09:40 run -> /run
> drwxr-xr-x    2 root     root          1024 Mar  9  2018 spool
> lrwxrwxrwx    1 root     root            17 Dec  8 09:40 tmp -> /var/volatile/tmp
> drwxrwxrwt    3 root     root            60 Dec  8 09:40 volatile
> root@qemux86-64:/var# mount | grep tmp
> devtmpfs on /dev type devtmpfs (rw,relatime,size=1012164k,nr_inodes=253041,mode=755)
> tmpfs on /run type tmpfs (rw,nosuid,nodev,mode=755)
> tmpfs on /var/volatile type tmpfs (rw,relatime)
> root@qemux86-64:/var#
>
>
> 6.
> systemd
> VOLATILE_TMP_DIR="no"
> VOLATILE_LOG_DIR="yes"
>
> root@qemux86-64:/# ls -al
> drwxr-xr-x   17 root     root          1024 Dec  8 09:46 .
> drwxr-xr-x   17 root     root          1024 Dec  8 09:46 ..
> lrwxrwxrwx    1 root     root             7 Mar  9  2018 bin -> usr/bin
> drwxr-xr-x    2 root     root          1024 Mar  9  2018 boot
> drwxr-xr-x   14 root     root          3260 Dec  8 09:46 dev
> drwxr-xr-x   21 root     root          3072 Dec  8 09:46 etc
> drwxr-xr-x    3 root     root          1024 Mar  9  2018 home
> lrwxrwxrwx    1 root     root             7 Mar  9  2018 lib -> usr/lib
> drwx------    2 root     root         12288 Dec  8 09:44 lost+found
> drwxr-xr-x    2 root     root          1024 Mar  9  2018 media
> drwxr-xr-x    2 root     root          1024 Mar  9  2018 mnt
> dr-xr-xr-x  173 root     root             0 Dec  8 09:46 proc
> drwx------    3 root     root          1024 Dec  8 09:46 root
> drwxr-xr-x   11 root     root           320 Dec  8 09:46 run
> lrwxrwxrwx    1 root     root             8 Mar  9  2018 sbin -> usr/sbin
> drwxr-xr-x    2 root     root          1024 Mar  9  2018 srv
> dr-xr-xr-x   12 root     root             0 Dec  8 09:46 sys
> drwxrwxrwt    9 root     root           180 Dec  8 09:46 tmp
> drwxr-xr-x   10 root     root          1024 Mar  9  2018 usr
> drwxr-xr-x    9 root     root          1024 Dec  8 09:46 var
> root@qemux86-64:/# cd /var/
> root@qemux86-64:/var# ls -al
> drwxr-xr-x    9 root     root          1024 Dec  8 09:46 .
> drwxr-xr-x   17 root     root          1024 Dec  8 09:46 ..
> -rw-r--r--    1 root     root           208 Mar  9  2018 .updated
> drwxr-xr-x    2 root     root          1024 Mar  9  2018 backups
> drwxr-xr-x    4 root     root          1024 Dec  8 09:46 cache
> drwxr-xr-x    6 root     root          1024 Dec  8 09:46 lib
> drwxr-xr-x    2 root     root          1024 Mar  9  2018 local
> lrwxrwxrwx    1 root     root            11 Mar  9  2018 lock -> ../run/lock
> lrwxrwxrwx    1 root     root            12 Mar  9  2018 log -> volatile/log
> lrwxrwxrwx    1 root     root             6 Mar  9  2018 run -> ../run
> drwxr-xr-x    3 root     root          1024 Mar  9  2018 spool
> drwxrwxrwt    5 root     root          1024 Dec  8 09:46 tmp
> drwxrwxrwt    3 root     root            60 Dec  8 09:46 volatile
> root@qemux86-64:/var# mount | grep tmp
> devtmpfs on /dev type devtmpfs (rw,relatime,size=1012164k,nr_inodes=253041,mode=755)
> tmpfs on /dev/shm type tmpfs (rw,nosuid,nodev)
> tmpfs on /run type tmpfs (rw,nosuid,nodev,size=405732k,nr_inodes=819200,mode=755)
> tmpfs on /sys/fs/cgroup type tmpfs (ro,nosuid,nodev,noexec,size=4096k,nr_inodes=1024,mode=755)
> tmpfs on /tmp type tmpfs (rw,nosuid,nodev,nr_inodes=1048576)
> tmpfs on /var/volatile type tmpfs (rw,relatime)
> root@qemux86-64:/var#
>
> Changqing Li (5):
>    bitbake.conf: set correct FILESYSTEM_PERMS_TABLES
>    base-files: update dirs1777 and volatiles according to
>      VOLATILE_TMP_DIR
>    initscripts: support persistent tmp
>    systemd: support persistent tmp
>    eudev: create dir /tmp if persistent tmp is used
>
>   meta/conf/bitbake.conf                        |  5 ++-
>   ...fs-perms.txt => fs-perms-volatile-log.txt} | 32 -------------------
>   ...tent-log.txt => fs-perms-volatile-tmp.txt} | 27 ----------------
>   meta/files/fs-perms.txt                       |  3 --
>   .../base-files/base-files_3.0.14.bb           |  8 +++--
>   .../initscripts/initscripts-1.0/volatiles     |  1 +
>   .../initscripts/initscripts_1.0.bb            | 12 ++++---
>   .../systemd/systemd/00-create-volatile.conf   |  3 +-
>   meta/recipes-core/systemd/systemd_254.4.bb    | 23 +++++++++----
>   meta/recipes-core/udev/eudev_3.2.14.bb        |  4 +++
>   10 files changed, 40 insertions(+), 78 deletions(-)
>   copy meta/files/{fs-perms.txt => fs-perms-volatile-log.txt} (53%)
>   rename meta/files/{fs-perms-persistent-log.txt => fs-perms-volatile-tmp.txt} (59%)
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192130): https://lists.openembedded.org/g/openembedded-core/message/192130
> Mute This Topic: https://lists.openembedded.org/mt/103100474/3616873
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [changqing.li@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

