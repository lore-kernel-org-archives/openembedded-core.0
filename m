Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD4A1C46CD2
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 04:08:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.5206.1702958902467924393
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 20:08:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Peqz4pBq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0717b75427=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BJ2CrvL013868
	for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 20:08:22 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=GPCBtEEeKGLvD0UnAA1lFvtfj/QaWKKmeRyFoFtPC2s=; b=
	Peqz4pBqNcYJ3cohnTKfav6GPslDyhxDhFaZVI9L5oubMevdufc+UwWrDXIiZZ5B
	L20gXC9WmP5jWtJfS4eX9mQC6O2PA79ucLFSA/aocST/lJ5COc1UHjRfujpcu7QK
	rbtGnuXOAY2l7hSz4L55tt/gv68cxeUaU5T5cTmUXIoz8fK8Tq136SC3OemlmB7+
	Dc3TqCeeDVtgdkP7JbmEUETBCz7eEVgWTyfWqROPuIUnkoPFl1apf4t6dt+Ty/ac
	xr0ZLU0CWeoIuvwGCdMlWMMegglLlK7H+WaTK3KlaQZfbsI3K1Ls81pvWr8V3izj
	aj67YYDrjRjbwBxKYfoJSQ==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v1c9kjcy4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 20:08:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZC+YTcOH3jrPSnAYESTPu2jOGue9jorAgNXpxqrJ59cWeauvi+SOUEFctUnXLItiBYljT/3b0sWUkTdTzuCEe05RzdoxjxjGDVbZtIcDWS/zdSyYArgItp+xwtYVQIhHWDnnF+uIe6YbwkE1b7xd3m7ZYifMKp48MT9oz5NnpRuErJtuPabnsCYDezmx35N6sCBcTG4rU2lik3jnvFy6FaPw6nD+TgbdmbqzcZQl2lZHP+8Yn8b43Yr7bHkkupEejFRdAJjNfIxipvN7MMg6om59GJNQMhHIhyb+bDjBhScTKw/Ft25wgjlYBKtSl3nNq5q/4VPIjdlnY89+LfKnyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GPCBtEEeKGLvD0UnAA1lFvtfj/QaWKKmeRyFoFtPC2s=;
 b=N3KX/ZM55+EghlOK9WEPoaENvMfzAekHQEb+cw/1P6PX5pBuyAV1Zb3XiZjLEhYPVa7OCToMzdoAW9pa1XRvMXuegiL7+jQADRqa+RT0McVvevzVkvpReDo7ndqAzIMq4px+0WGG61zVaem7goVkH/YeZUYHqZwYMOScI32yv8u5RjPg3AtJZl4xeAkNEkxkxO9J/XOpNzZuWxAUlgsSFXzSMpzjmIybwCE+um0wy9Xjh8KxTerKzyB9o9CuJUxgz/HBsQFGCsOHChSSwIIBpBITmj1jutYJ5M5Yf6l/jy1eNon1s+gxI9jR8Aw9a8PgNQsnFTTB0A0CahxwS0vG8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by DM4PR11MB5421.namprd11.prod.outlook.com (2603:10b6:5:398::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Tue, 19 Dec
 2023 04:08:19 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::4b52:5e25:a620:592]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::4b52:5e25:a620:592%7]) with mapi id 15.20.7091.034; Tue, 19 Dec 2023
 04:08:19 +0000
Message-ID: <3fd7ac0a-37f4-42a0-ab7b-b3d8793fa6b9@windriver.com>
Date: Tue, 19 Dec 2023 12:08:18 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC PATCH V2 0/5] Fix persistent tmp
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <179FA115B6317FAF.20566@lists.openembedded.org>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <179FA115B6317FAF.20566@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR04CA0002.namprd04.prod.outlook.com
 (2603:10b6:a03:217::7) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|DM4PR11MB5421:EE_
X-MS-Office365-Filtering-Correlation-Id: 86ec8149-0bc6-45c0-4949-08dc00482266
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5cvMJYqANJlC1SJ3XeirGBjTAtp+/mwqXhr4Ot62AEaIq1lcs17YkbTWOFUFqnYzNV5WTjcGQSlzuftk3V3JeaKf7lRY4isXJM7JM8TAgGGjmnzHvp6KxAitYDFvAUdzUr7P7UkbdzIQ4M0WBIrCcITX1ud1xfXWhjYsl+Sp0XTig4Wa8KrsdO9RWEiTZQo4WLU2FgF5S+iVrx/Qjv/S5bm0ZWnTWFpFgFyPvCY5mz44aBuxWeiq+dE1OjQWMCLV8EZiaxaIdlJBPLOhiOszGCq1F7W7bHHiUl1WET9QSfWsp0TiWldahh351/q8Cq3GOd3LzQjuNRNdCLcJkEAw2xpAJWB9mJvly/kXf+0U28vf2072JnxxF7ign4qXzEkYnenIWbsTUDacwGsTFY3JiOIdaAeZfR4CtOeHyhI1ezZMpx3vASaIEhvi7aqyuRFYTCdYtnnYhbNDxqFFINaAUKSCmjr/Q1KXIHpQQNi10E6UqxcLOofk/j705N1WAVCg27wUblAl8mvUfvYLHbsC2jDTwOmyq6ioKPYMNlqoztvu8MKxzmQyZnivMGx78A3qjj0kDgh1iZ3G2wb8fGXc/CPLYBSMYfxqE6tysXdXvCwPVxhOLJD7lF0R9gHu/JJ7DJSSCPj9seziWcIS0EsXgigFeyJqyXQZKb6BO31Uz/s=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(39850400004)(366004)(396003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(83380400001)(53546011)(2616005)(26005)(38100700002)(8676002)(8936002)(5660300002)(44832011)(41300700001)(30864003)(2906002)(478600001)(966005)(6486002)(6506007)(6512007)(66476007)(66556008)(66946007)(316002)(6916009)(36756003)(31696002)(86362001)(31686004)(66899024)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S2FNb0x3NzVnZlQ2ZVVEYTNvOHcya1VVUS9GVlRGNEh3TXF2ZVdzS3RaQnlY?=
 =?utf-8?B?RUlKMlYxd2dJenJEVC95Rm1lQUlLOG1GTmVOZGwvcmU1WTJkc3hRVnV2bGtR?=
 =?utf-8?B?bG43VVBZSnBQWVVpd2JXZUNURmpqSk9vaUFydUhJckM5Q3pxYjFOWENhTXEx?=
 =?utf-8?B?Z3QvT0NrOStJMGlYYTFCRDV1TDR2bG5SUlRwREFYQ3h6VjdvdUh4UXdEeW82?=
 =?utf-8?B?VDRERzArbEdIVmVGYUZFUVVsSmVoeXdxajVsRVpPT0dpSW8rZG5ZMEdaT2Uz?=
 =?utf-8?B?WkNJOG8vRktlY1BsVlU0S3lTb0tybnZFWGRYNjdmWUh2cWNCWWU0YU5LMG9O?=
 =?utf-8?B?SExYQytrd2d2QndJVW0zMWQ1Z1EzRGptOE9SWnBTQkV6K1dhbm1GOFU0SHhj?=
 =?utf-8?B?TDhRc3BWTVNsZUFtUVpkNHJiVFNESlZnVlFRQkdyWWFFL0REYkNIRU1xUHRo?=
 =?utf-8?B?cGNTZnA1cFg1Wk9HWFJKa0FzU2EzenZLOU5uVE56OTUvOG1UWDNGS3lNZC9T?=
 =?utf-8?B?WHNYbHpsNzdCL2JlV3V5RDNDc2hDNHlTVFhTMXRFeHo0ZmZVMldDR2Mwb3Ev?=
 =?utf-8?B?Vmt6bVlqeE5TUTBwZFFKYVQ4VmhZOWwzcGFDSWhPdFBDb1VIKzJLbWRQUzYy?=
 =?utf-8?B?czJaS0VkUTJaS0NORmRXTHlEQXBjU2VhcmxFNlJOcG5ORU1yVnBpSm43NEdK?=
 =?utf-8?B?NHZ0clRMOVZJL2lyOUNiajZIRHZuZmNVU2ZFb2xrQksxZTZsdS92SDgveG1Y?=
 =?utf-8?B?WHBmcmRrUlhkVmM3a1FBd1p2a3hEYWRUOGFzRnVmNnBRSDBYaDVDTzMwbnY4?=
 =?utf-8?B?TkxZRE0yQWlxQlY0RVVTeXdVUU9rbXEyTW5OalZ2TzhJdU52TlREVlJMeTZh?=
 =?utf-8?B?elI2T2NpWVloamRlUExYSTVpd1hKR095ck92WHdmRmdFOFVyQjM4WUpQVVdQ?=
 =?utf-8?B?SkgrTTY2dGpuTUpudEZiNWVtZHhUenNpaVNQUCt2Wnh5OGkwSGluVHpwRWxC?=
 =?utf-8?B?MDVObGgrQWlYOE11Wm1BVlowaWk3TGtKOUxhK1NWZ0VBMmxaQnlRT0lFOHky?=
 =?utf-8?B?cVJRUzFtNUduNWswTVdVYkVwQXZGR3VJWkFmTlI0REZXSGdBRVlhbFVYSXp3?=
 =?utf-8?B?OGc4TWc1UTY2TURUcnYwNEZpK1lxWUhlV1hzSGdzZ3BodmJJTThWUHVxVTl6?=
 =?utf-8?B?R2RmV0ZicTNwNjc5c24vMnlNQWltVVB4ZUZuWndmbDJXd0FQMDdzUVRBengv?=
 =?utf-8?B?ZVRuWWowYXRMQWtHcjR5eWEwYUxSOHhla1lNRlpPMjRDTEpqOVQvRGVKU0N3?=
 =?utf-8?B?RkUwdHc5VExuemU3UXJwT3Q3RFhjamZoSDdESlQrNDF5Z2ZlYmNHVVVZWEJI?=
 =?utf-8?B?UUYxNzRSZkpGTlM4VVY5T3RWSldCU2tibDdpS1YzamVVYkJ5eFVVZVFicCty?=
 =?utf-8?B?Z09RS3pkTXBHWjQ4MFhCa052MDJlZ1hQSHh5V05RRzVWdVYxdFFxN2RYVStJ?=
 =?utf-8?B?M2U3ci9ETERiR1ByYlB1MW5qUXNDN3k4VFNuOTRFQmE3c1ZYcU83RXFlcUdw?=
 =?utf-8?B?bndSeDB3SUlWb2FkSHNqL0JZeERpeUZDaXRVUzA4OHJoZjIzdHBxZjFUR3Q2?=
 =?utf-8?B?VzdhenpTRHdCRG5hcjQ1OGppaXlvVmMrRVozbmVIcnFHdjkvV3poblRZQWVu?=
 =?utf-8?B?bG82aHkvNS9zSTlMQVVIS0tmbTEzZmovSUxJQWVSME9jRjFXa1NxTy80ZGpC?=
 =?utf-8?B?YjA4ZG9sTEwvblNBUkxjaTNmNGFWOHBvdnBhOStINnN1VnlpdHRSVXZQU1gv?=
 =?utf-8?B?Yng0NFU2YTdFcWZJNlhaTnVDdWdua2NBM2hLNTdzWFd0ZDdua1gxSkt3YWJx?=
 =?utf-8?B?YzJEOVQ3UFZMNGR3ZXdpQURtQXkwWXMxbEFUeGIrRE15eCtoRXdrTFdOdVMz?=
 =?utf-8?B?THhpMFNnbGJLNkNLU0srK2IweG90OGpGN1gyUDFVWSt5TWNKL1dnMmFTd25M?=
 =?utf-8?B?ODB1WW4zQWhPK3FLRTJwdEQ1WlVWeDAwZDdCanNFbWlKNFpyaVRRZklLZ2dW?=
 =?utf-8?B?Nm9iSnJ5ZlltT0ptblpRc1RValErN2plY1I1R1VsWURmNWdDVmw5SnVwN1A4?=
 =?utf-8?B?bWUrclkrNkNDQXZSN25Yc0FBdGhhT1hnNnM4N21CYmZ5MFdKajRoSVk3VDI3?=
 =?utf-8?B?eGc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86ec8149-0bc6-45c0-4949-08dc00482266
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2023 04:08:19.5825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q8LVNbPnUoCtAt1K9LOg0zNmfeXTO4S1cRhvUe6JaZhihWdHcz7C5mp0xNpQZDxgeglxUcbttIPwqvC5rnKm8fMM6+v1THv0XLhDQ/wgPHk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5421
X-Proofpoint-GUID: 3SVmEKQD5SpKBC1HqhKvb91YvvzwzD0K
X-Proofpoint-ORIG-GUID: 3SVmEKQD5SpKBC1HqhKvb91YvvzwzD0K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=865 clxscore=1015 bulkscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312190028
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 04:08:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192690

kindly ping

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

