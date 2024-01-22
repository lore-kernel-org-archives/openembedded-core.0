Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44649C4725D
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 04:38:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.66320.1705898308171695505
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Jan 2024 20:38:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=sQh25VrK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1751a95c74=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40M4OIWY030599
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 04:38:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=nxgvHJMfav9krXn7C7G
	T9pzWMkxFAEkE4iwPhFvPaUA=; b=sQh25VrKpou8bAXjHWgWKI7IGCK8kod/m0T
	zZ2EtwHDiuOteuksQbjMoZorK4mnH82Z1SFgub0EI4iHq7qZXqsBUug2z30FpStn
	/hGHeOjJdJL/RVnuFTYV7efiJ0bKNvEFGyZd3wMR4y5IEpksNxCOAjGzHL2ZaMFr
	DWupsY0sEfFAJ4wsdQ9LyivMQZQJQFlWERZHR4jabRXT1QiuiZPB3O5+na7pOWwN
	YAz1tNAqTqSB2otTaZlj0LEX4hTh9mD4dwzy7WV7P7tS7Ow+uBjiDhDagMwPOTdM
	ONL3LKAVvz2Uk7bY1KMwbIeHmCEaJmjkOwJ1AilhXHNUfnCqOcg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vr5571gf7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 04:38:26 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 40M4cQZx014267;
	Mon, 22 Jan 2024 04:38:26 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vr5571gf6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jan 2024 04:38:26 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NdXqXytYcbecFfN4PQnHMSJ2iFaoeron5p3UzFPnth5T7nsQU0lrzcOqJQhlUrrk30IggEBZszFC9d7Jyo3RtQsnGVJI9R/fiaXTqVSc7d/pf9OW1UPEwxeKsEPJnKj1lof3kIs/hU/MoFkS1xcS2/c2u5Vr/Sowi7vLDRTL8NnhJOThQyFgQjvI/itTwGbKX70JE2pQZUJwn5tmsr0icg5FUYG+KwOFGIVmdRe/kFud6GI120bsyLrOYndBcjcVjG9ZZmTzsDEaWiH6zSYXmFptdLVkF7YYCHbSCwlFY4j3VtyvlHInYBEx5o8XbJv6ZUGV802/ADPGmj/QAkw0wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nxgvHJMfav9krXn7C7GT9pzWMkxFAEkE4iwPhFvPaUA=;
 b=CbJL3Cw7cbqqE9apS09VWYxBcxxkgL0tHbmYN1ZS+fpyK3IWFTbU8SkP66N2uGQrXB8hDko2uS9/iOIzMOxTl0bsA0L5IcbVstD83+RNmm7GmMoPsKX/heGqzsZCoDvE8tjH1+7XJUfnd68qhG1f0/VAUuJRPXQeeZLojLFcYCcgEeTPYzlylrGKKri38qb4kOsVphgA4hsIdslYLACEv8SczQ/SBFOlGUG3eV2xsO0J1FoiLRx6XOSguoAttoYmFDx+K4A7kg9bLrJtezUqzXDsNgi0qR70v83RryfXaPFZ0jiBjvt0FuZxzDwnqmw0FkaWgo1Xx34E2tn7fwU+fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DM3PR11MB8736.namprd11.prod.outlook.com (2603:10b6:0:47::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.31; Mon, 22 Jan 2024 04:38:23 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315%7]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 04:38:21 +0000
Content-Type: multipart/alternative;
 boundary="------------vYPxs6t31v6vNIqE6qIAAO3r"
Message-ID: <ff3ec5f6-13fc-0468-9a07-09c3226c300b@windriver.com>
Date: Mon, 22 Jan 2024 12:38:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core][PATCH 1/3] systemd: upgrade to 255.1
Content-Language: en-US
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
References: <20231227042036.2376255-1-Qi.Chen@windriver.com>
 <2968be9a-c13d-5d98-e1be-d291d0b5b008@windriver.com>
 <2024011918132485b9ba7f@mail.local> <202401191814434c0685e2@mail.local>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <202401191814434c0685e2@mail.local>
X-ClientProxiedBy: SG2PR02CA0026.apcprd02.prod.outlook.com
 (2603:1096:3:18::14) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DM3PR11MB8736:EE_
X-MS-Office365-Filtering-Correlation-Id: d46f7a73-f42d-4f93-5c26-08dc1b03f698
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	n4On67RKpdfvg6sWR8UqMjhkPSs3JKIck9kf3DFhaudp5RLHCcQR0Jy4mIPAetnrjmjg+VhWGazGmViFnZ9LHlnRSBUhR3mxZOdKKw17+sVDzPRatevN0X3sEVzrL7NETvXOy98gP6G0r5AABzunZOEZJjy/panrxNcFN+JJ/NxiYiIdBlvG+dvr0bOJljmduly+ETEbBJ/0UUu05OFpbZkt5yxkl+yRHxBEi23AeZLj6tasvV3vMKyWvG228ux1qsY682ayaRkqUE5wX3gLOgCkYm+CUjy4L8XbRCfgk8R++daITk89hrJULGqBRO+50hAjjreo9f/4JTGjtI+6uUNfd8lVNR2XkJT9YzbOpzRjDMbzq8hVyeTf+Rjwimg3GxBuCNDQSUYs2odFqAfFTb6Mspx+eNaz5aHr82k57EVS6V82R04IC6+I/itJqudiwz5r4sp1CZ8IUmGuByPBTChQZeK2Ez49S5JgihMVWTlsoPtaruP+C4g0nYggx0xUwfUQK+b+n7mhcrwUYVb3GJ+5Qsozsa7ur9QC4SslkBxqwAhatnP6cSDVMoX/HX47/EQ2s0KQeJJylh17tnCUQg3MU4pzQxNfg6sq1FaulFhK+fISpui5/9mNvDvrOJAaHDTxprB7BAJvBlfMCR6qqfFMx6vqoqhDfTqxAZy+/SZYZFCctfsmLghAaHbnIgugYA0zuKONu4hkXaXCAOxmWAozFNoFtJFHvr8pXQ1fRHw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39830400003)(346002)(376002)(366004)(396003)(230273577357003)(230173577357003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(36756003)(26005)(6506007)(6666004)(53546011)(33964004)(2616005)(6512007)(5660300002)(83380400001)(30864003)(2906002)(21615005)(41300700001)(966005)(8936002)(66556008)(4326008)(8676002)(66476007)(6916009)(478600001)(316002)(66946007)(6486002)(31696002)(86362001)(38100700002)(166002)(66899024)(31686004)(2004002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SFlwbWtwZ1A1WHFNOE81TnhaMVpFT21PcXk3TmhVMHhrSkJaSTFkY1E4c1Jy?=
 =?utf-8?B?R200OUpSaHI4ZWdOelZnQUt2aDFwV1kxM2V0UkNQNmdXNnhvQTB5SVJzcVov?=
 =?utf-8?B?eEtjUTUxS1NKUWVaMjl3aGlpWis2QldycWdpZDh0T3FKK1RDWGNRTm45Qmhh?=
 =?utf-8?B?RVh3MGRVTkIrcndaOUdSVVgrWlB5cERYbW9hMTNKWkpQeUFUZjYzaVdFRGZU?=
 =?utf-8?B?SW9yRkkvVnBPenRtS1FtMTRwTllmd3c2dS9GTU9EVnJCUy9XSGUrQng4ZkFp?=
 =?utf-8?B?N2xESkpLdE95ZTVBNXkvWGRBcXoxL2ljQUl1ZTlTNmFrQkNkUzdjRWE5V3oy?=
 =?utf-8?B?eTdlVExySWNwME9vQ0VUTUZVc3NBKzJHWkJDSEV6Rjk1UzllRkx3ZmVpdkN0?=
 =?utf-8?B?MjQvclJKMUFVZW5CSVZ5UER6MW5FRnN3c3Nzd0JIM1Ezam9JSkF3a2FNQm1F?=
 =?utf-8?B?Snpub2dzckxacGdKSVVNQXZ3WnVESmpZbGlJMjhPU2I1K0dKZlpBcXRGVVF6?=
 =?utf-8?B?ZHV3MmZ4dW1GRG5hN0tKenZuSGN3QTgvR0RLNmdIOE1DOHdLbmtHUUhYdmY3?=
 =?utf-8?B?ZEVkcFlkalg2UFk3cEQyV2FjT3NoV29oTTRNdlkrWCs2VUhuRDlNZU8rUW1N?=
 =?utf-8?B?QmZwVW92ZVh4Y3h4bDJjOGtJSWZmWjBwajRxbDRPcFh6QnQrWTllN2pYL2h0?=
 =?utf-8?B?cmJoK1Ivb2pHMUNFTnJ6K1pIVDZYVGE4UTdVRHdVMG9QaUl6RUJVblVaT3I3?=
 =?utf-8?B?OStkTnp5RDBJSkRySGNaNVhEZnhUK0xOdHRTcVpQSDJJcE90M1JQWHYvRE1S?=
 =?utf-8?B?dVlxcVdQdVpWbmJwUGZhQjVKUFRkeit4SkNpVnZXMitPbUFUUDRqK1ZhS3g1?=
 =?utf-8?B?U2MrMlkwOVRtMmF5VlRma1d6RjRFRXZVaDdKWlBWcGdLVnNnM2FNUFp5RVo2?=
 =?utf-8?B?ajlEWU8xamdybm55OUMzbkZGa2xoSkJrdWp4U2lxUWorVmdGTnV1dloyNmpa?=
 =?utf-8?B?SUNOcnROdVRIZHNtdHIrRThWczJ6c2lmNkJDNWk0SThKbW50WFNXUG0zWjhl?=
 =?utf-8?B?MHB2TndkdU5lUW9HYUFXdEFHWlZlTldQYmhFVUVmWCs1cDlLQVBueHEvNmJ5?=
 =?utf-8?B?aU8vNDNpZ242T2xua3pBUW5CWU9KOE9BNi9pUHdSQWx4OUFSTncvVnhVclhs?=
 =?utf-8?B?bUQvRDQzZ1htRVhva0dqUlNFcms4WTN6WE5Xa2MrSjBFZWhWVGFidlFZWXZ1?=
 =?utf-8?B?d1BVMzdWSVNBdENxRDd3VW1YSFkyNzJlUkV4Rkg3Qi8yTVlnTmtQaVpaQ1Uv?=
 =?utf-8?B?bG9MNXVzbHhrb1JTaUtseVV5aCtKNlBvSTQ5Q1NRRkR1cDBRQXFuK3VMbHN4?=
 =?utf-8?B?MW1qazNGS2ppYjVoTGhBZnZXM2dLM1dQY0xXUkNTaDdUVi9IZDFzeTRrVTRq?=
 =?utf-8?B?eitxWUNuNFQzRnJvTnpsM050UmhaT0MyNFpDWUZKUUovSjZreXk5ZmZyNWpD?=
 =?utf-8?B?M2xWdTZDTU10UzMvclFlY212aE5yMng3eVZMSllMbG4wL1ZDUmtIbWl3bGxm?=
 =?utf-8?B?UHdJMVlweVAxcDJpVnNwK2RjWkV1U0V5ekJnR3Rab1gzTFR3QjNKNTZRRHBK?=
 =?utf-8?B?cTZwYVU5bUI5MDhzVGhZSFN5ZncxQTNZaTNORlN5VWlXU2lWVy9MTlQxMnlk?=
 =?utf-8?B?RDVQY3ZxVGpRVUxuU2h0ZEJWSnFlYyt4NXk4WTU1Y0taaDVCR3h6ZHA1OWlU?=
 =?utf-8?B?TkJqZWdBbFdQdmI0aVFSTGJ1L2tFSUJ4T1NYSlJ0bDN5T0YzSUJidHBCMG50?=
 =?utf-8?B?cnRUd052WnhrVGRZb0tPK0RZZWZ5eVd0aDZiTTM0TGpHdStFSGY4NTV3L1pu?=
 =?utf-8?B?Wm13VGxhUUhsbTdBaDBJRHVZdE43WDVmYm9iMFVqQURwUmwxTy9DS2RjZVhW?=
 =?utf-8?B?LzcydFZoMjB6SU1uZGtvUWtkcEg5aUJ6NXZISmU0TWYvQ1BIWDArWmV0ekNa?=
 =?utf-8?B?citvVDc0Rm5iN29zaU42OHIwYnZiRHFxY0k3MXFMVnJrUG1TcEU2R2pHRjlP?=
 =?utf-8?B?bVdTMFZtbFBHd3kzT05CTjJBaGYzNzd0YnZuY2lVR1o3eFRCSjZlVmt4YmNk?=
 =?utf-8?Q?9MJPFMFVsZhkg2ZwFHFwKJ0IV?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d46f7a73-f42d-4f93-5c26-08dc1b03f698
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 04:38:21.8287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BtzFfy2f+EJJARd0Kf7vGuVnPPXgURZPZS4lJ+b99Ufs8TSM30gyjbFk0W9L1Ckm5SsGYnyJl5XaqAoXXcqcUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8736
X-Proofpoint-GUID: nKHUhWHkYY7zIssOK1wtuSXtmYxa8DvR
X-Proofpoint-ORIG-GUID: ztUqS1glisXlpBT4guV_jnay9yxt-Inx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-21_04,2024-01-19_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401220030
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 04:38:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194111

--------------vYPxs6t31v6vNIqE6qIAAO3r
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/20/24 02:14, Alexandre Belloni wrote:
> On 19/01/2024 19:13:25+0100, Alexandre Belloni wrote:
>> On 19/01/2024 11:09:20+0800, Chen Qi via lists.openembedded.org wrote:
>>> What's the status of this patch series?
>>> Is there any issue or concern that I missed?
>> I'm glad you asked, I got this today:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/8466/steps/26/logs/warnings
> and I know you sent a patch for this but it didn't make it yet.

I just double checked with the following settings from the "Sysvinit 
with systemd" entry in config.json, there's no warning.

DISTRO_FEATURES:append = ' systemd usrmerge'
ROOT_HOME = '/root'
VIRTUAL-RUNTIME_init_manager = 'sysvinit'

So I further checked the build's settings. 
https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/8466

In the second step, "Fetch yocto-autobuilder-helper", I can see the 
following logs:

HEAD is now at ebb7e65 config.json: Fix syntax errors

So the build is not using the latest repo. The latest commit is:

97bb07f (HEAD -> master, origin/master, origin/HEAD) config.json: set 
ROOT_HOME to /root for sysvinit with systemd

Regards,

Qi


>
>>> Regards,
>>> Qi
>>>
>>> On 12/27/23 12:20, Chen Qi via lists.openembedded.org wrote:
>>>> From: Chen Qi<Qi.Chen@windriver.com>
>>>>
>>>> 1. Patch changes:
>>>>
>>>> 0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch
>>>> is removed because it has no real effect now. The /lib is now
>>>> /usr/lib because 'usrmerge' is a required distro feature for systemd.
>>>>
>>>> 0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch is
>>>> refreshed for the new version to avoid patch-fuzz issue.
>>>>
>>>> 2. root user's home directory now defaults to "/root":
>>>>
>>>> The sysuers.d/basic.conf is still modified to respect the ROOT_HOME
>>>> value, so if users set ROOT_HOME to "/home/root", the behavior is the
>>>> same as before. However, this is only for backward compatibility. With
>>>> this patch, The ROOT_HOME value is set to "/root" in init-manager-systemd.inc.
>>>> This is because systemd's source codes are hardcoding "/root", and other
>>>> values are not officially supported. See the list below.
>>>> $ grep -rl '"/root"' src/ | grep -v 'src/test'
>>>> src/core/namespace.c
>>>> src/basic/user-util.c
>>>> src/nss-systemd/nss-systemd.c
>>>> src/nspawn/nspawn.c
>>>> src/firstboot/firstboot.c
>>>> src/shared/userdb.c
>>>> src/shared/user-record.c
>>>> $ grep -rl /root network/ factory/ sysctl.d/ sysusers.d/ rules.d/ tmpfiles.d/ units/ xorg/ tools/
>>>> sysusers.d/basic.conf.in
>>>> tmpfiles.d/provision.conf
>>>> units/emergency.service.in
>>>> units/rescue.service.in
>>>> tools/list-discoverable-partitions.py
>>>> Previously, the recipe was just substituting sysusers.d/basic.conf.in,
>>>> which is not enough to be treated as 'fully support'. I deliberately put
>>>> a warning message in do_install to warn users about non "/root" ROOT_HOME
>>>> value. Don't remove it until all above places are handled.
>>>>
>>>> 3. cgroupv2 is now the default.
>>>> cgroupv2 is the default for systemd for many years and it's the default
>>>> for distros such as ubuntu and fedora. Let's also use it as the default.
>>>>
>>>> Signed-off-by: Chen Qi<Qi.Chen@windriver.com>
>>>> ---
>>>>    .../distro/include/init-manager-systemd.inc   |  2 +
>>>>    meta/recipes-core/systemd/systemd.inc         |  4 +-
>>>>    ...tall-dependency-links-at-install-tim.patch | 22 +++---
>>>>    ...sysctl.d-binfmt.d-modules-load.d-to-.patch | 73 -------------------
>>>>    .../systemd/systemd/basic.conf.in             | 40 ----------
>>>>    .../{systemd_254.4.bb => systemd_255.1.bb}    | 16 ++--
>>>>    6 files changed, 25 insertions(+), 132 deletions(-)
>>>>    delete mode 100644 meta/recipes-core/systemd/systemd/0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch
>>>>    delete mode 100644 meta/recipes-core/systemd/systemd/basic.conf.in
>>>>    rename meta/recipes-core/systemd/{systemd_254.4.bb => systemd_255.1.bb} (98%)
>>>>
>>>> diff --git a/meta/conf/distro/include/init-manager-systemd.inc b/meta/conf/distro/include/init-manager-systemd.inc
>>>> index 595d1f2644..0a76647459 100644
>>>> --- a/meta/conf/distro/include/init-manager-systemd.inc
>>>> +++ b/meta/conf/distro/include/init-manager-systemd.inc
>>>> @@ -5,3 +5,5 @@ VIRTUAL-RUNTIME_init_manager ??= "systemd"
>>>>    VIRTUAL-RUNTIME_initscripts ??= "systemd-compat-units"
>>>>    VIRTUAL-RUNTIME_login_manager ??= "shadow-base"
>>>>    VIRTUAL-RUNTIME_dev_manager ??= "systemd"
>>>> +# systemd hardcodes /root in its source codes, other values are not offically supported
>>>> +ROOT_HOME ?= "/root"
>>>> diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
>>>> index ccc3236457..1417e0150f 100644
>>>> --- a/meta/recipes-core/systemd/systemd.inc
>>>> +++ b/meta/recipes-core/systemd/systemd.inc
>>>> @@ -15,8 +15,8 @@ LICENSE:libsystemd = "LGPL-2.1-or-later"
>>>>    LIC_FILES_CHKSUM ="file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \ 
>>>> file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
>>>> -SRCREV = "2e7504449a51fb38db9cd2da391c6434f82def51"
>>>> -SRCBRANCH = "v254-stable"
>>>> +SRCREV = "2018ccef6645ce00c784369a22dc4e98f6d7061d"
>>>> +SRCBRANCH = "v255-stable"
>>>>    SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH}"
>>>>    S = "${WORKDIR}/git"
>>>> diff --git a/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch b/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch
>>>> index 085f1e9052..be231cf6b2 100644
>>>> --- a/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch
>>>> +++ b/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch
>>>> @@ -1,8 +1,8 @@
>>>> -From ca7d9a8d9c81702af9c599bb79706f12b1a465cf Mon Sep 17 00:00:00 2001
>>>> +From 29a58009a172e369ad7166e16dab2f4945c6b0d2 Mon Sep 17 00:00:00 2001
>>>>    From: Chen Qi<Qi.Chen@windriver.com>
>>>>    Date: Thu, 21 Feb 2019 16:23:24 +0800
>>>> -Subject: [PATCH] binfmt: Don't install dependency links at install time for
>>>> - the binfmt services
>>>> +Subject: [PATCH 1/2] binfmt: Don't install dependency links at install time
>>>> + for the binfmt services
>>>>    use [Install] blocks so that they get created when the service is enabled
>>>>    like a traditional service.
>>>> @@ -25,10 +25,10 @@ Signed-off-by: Scott Murray<scott.murray@konsulko.com>
>>>>     3 files changed, 7 insertions(+), 2 deletions(-)
>>>>    diff --git a/units/meson.build b/units/meson.build
>>>> -index c7939a10f8..219570ab19 100644
>>>> +index e7bfb7f838..1d5ec4b178 100644
>>>>    --- a/units/meson.build
>>>>    +++ b/units/meson.build
>>>> -@@ -149,7 +149,6 @@ units = [
>>>> +@@ -154,7 +154,6 @@ units = [
>>>>             {
>>>>               'file' : 'proc-sys-fs-binfmt_misc.automount',
>>>>               'conditions' : ['ENABLE_BINFMT'],
>>>> @@ -36,7 +36,7 @@ index c7939a10f8..219570ab19 100644
>>>>             },
>>>>             {
>>>>               'file' : 'proc-sys-fs-binfmt_misc.mount',
>>>> -@@ -246,7 +245,6 @@ units = [
>>>> +@@ -251,7 +250,6 @@ units = [
>>>>             {
>>>>               'file' : 'systemd-binfmt.service.in',
>>>>               'conditions' : ['ENABLE_BINFMT'],
>>>> @@ -45,7 +45,7 @@ index c7939a10f8..219570ab19 100644
>>>>             {
>>>>               'file' : 'systemd-bless-boot.service.in',
>>>>    diff --git a/units/proc-sys-fs-binfmt_misc.automount b/units/proc-sys-fs-binfmt_misc.automount
>>>> -index 6b1bbdc91e..5ec5b8670a 100644
>>>> +index 5d212015a5..6c2900ca77 100644
>>>>    --- a/units/proc-sys-fs-binfmt_misc.automount
>>>>    +++ b/units/proc-sys-fs-binfmt_misc.automount
>>>>    @@ -22,3 +22,6 @@ Before=shutdown.target
>>>> @@ -56,7 +56,7 @@ index 6b1bbdc91e..5ec5b8670a 100644
>>>>    +[Install]
>>>>    +WantedBy=sysinit.target
>>>>    diff --git a/units/systemd-binfmt.service.in b/units/systemd-binfmt.service.in
>>>> -index b04412e037..63f116e4fa 100644
>>>> +index 6861c76674..531e9fbd90 100644
>>>>    --- a/units/systemd-binfmt.service.in
>>>>    +++ b/units/systemd-binfmt.service.in
>>>>    @@ -14,6 +14,7 @@ Documentation=https://docs.kernel.org/admin-guide/binfmt-misc.html
>>>> @@ -68,12 +68,12 @@ index b04412e037..63f116e4fa 100644
>>>>     After=proc-sys-fs-binfmt_misc.mount
>>>>     After=local-fs.target
>>>>    @@ -31,3 +32,6 @@ RemainAfterExit=yes
>>>> - ExecStart={{ROOTLIBEXECDIR}}/systemd-binfmt
>>>> - ExecStop={{ROOTLIBEXECDIR}}/systemd-binfmt --unregister
>>>> + ExecStart={{LIBEXECDIR}}/systemd-binfmt
>>>> + ExecStop={{LIBEXECDIR}}/systemd-binfmt --unregister
>>>>     TimeoutSec=90s
>>>>    +
>>>>    +[Install]
>>>>    +WantedBy=sysinit.target
>>>>    --
>>>> -2.39.2
>>>> +2.34.1
>>>> diff --git a/meta/recipes-core/systemd/systemd/0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch b/meta/recipes-core/systemd/systemd/0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch
>>>> deleted file mode 100644
>>>> index 98914ae154..0000000000
>>>> --- a/meta/recipes-core/systemd/systemd/0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch
>>>> +++ /dev/null
>>>> @@ -1,73 +0,0 @@
>>>> -From f75f03ef6bc3554068e456bed227f333d5cb8c34 Mon Sep 17 00:00:00 2001
>>>> -From: Khem Raj<raj.khem@gmail.com>
>>>> -Date: Tue, 29 Sep 2020 18:01:41 -0700
>>>> -Subject: [PATCH] Move sysusers.d/sysctl.d/binfmt.d/modules-load.d to /usr
>>>> -
>>>> -These directories are moved to /lib since systemd v246, commit
>>>> -4a56315a990b ("path: use ROOTPREFIX properly"), but in oe-core/yocto,
>>>> -the old /usr/lib is still being used.
>>>> -
>>>> -Upstream-Status: Inappropriate (OE-specific)
>>>> -Signed-off-by: Khem Raj<raj.khem@gmail.com>
>>>> -Signed-off-by: Jiaqing Zhao<jiaqing.zhao@linux.intel.com>
>>>> ----
>>>> - src/core/systemd.pc.in           | 8 ++++----
>>>> - src/libsystemd/sd-path/sd-path.c | 8 ++++----
>>>> - 2 files changed, 8 insertions(+), 8 deletions(-)
>>>> -
>>>> -diff --git a/src/core/systemd.pc.in b/src/core/systemd.pc.in
>>>> -index 693433b34b..8368a3ff02 100644
>>>> ---- a/src/core/systemd.pc.in
>>>> -+++ b/src/core/systemd.pc.in
>>>> -@@ -67,16 +67,16 @@ tmpfilesdir=${tmpfiles_dir}
>>>> -
>>>> - user_tmpfiles_dir=${prefix}/share/user-tmpfiles.d
>>>> -
>>>> --sysusers_dir=${rootprefix}/lib/sysusers.d
>>>> -+sysusers_dir=${prefix}/lib/sysusers.d
>>>> - sysusersdir=${sysusers_dir}
>>>> -
>>>> --sysctl_dir=${rootprefix}/lib/sysctl.d
>>>> -+sysctl_dir=${prefix}/lib/sysctl.d
>>>> - sysctldir=${sysctl_dir}
>>>> -
>>>> --binfmt_dir=${rootprefix}/lib/binfmt.d
>>>> -+binfmt_dir=${prefix}/lib/binfmt.d
>>>> - binfmtdir=${binfmt_dir}
>>>> -
>>>> --modules_load_dir=${rootprefix}/lib/modules-load.d
>>>> -+modules_load_dir=${prefix}/lib/modules-load.d
>>>> - modulesloaddir=${modules_load_dir}
>>>> -
>>>> - catalog_dir=${prefix}/lib/systemd/catalog
>>>> -diff --git a/src/libsystemd/sd-path/sd-path.c b/src/libsystemd/sd-path/sd-path.c
>>>> -index 1af3a36d1d..def502b717 100644
>>>> ---- a/src/libsystemd/sd-path/sd-path.c
>>>> -+++ b/src/libsystemd/sd-path/sd-path.c
>>>> -@@ -365,19 +365,19 @@ static int get_path(uint64_t type, char **buffer, const char **ret) {
>>>> -                 return 0;
>>>> -
>>>> -         case SD_PATH_SYSUSERS:
>>>> --                *ret = ROOTPREFIX_NOSLASH "/lib/sysusers.d";
>>>> -+                *ret = "/usr/lib/sysusers.d";
>>>> -                 return 0;
>>>> -
>>>> -         case SD_PATH_SYSCTL:
>>>> --                *ret = ROOTPREFIX_NOSLASH "/lib/sysctl.d";
>>>> -+                *ret = "/usr/lib/sysctl.d";
>>>> -                 return 0;
>>>> -
>>>> -         case SD_PATH_BINFMT:
>>>> --                *ret = ROOTPREFIX_NOSLASH "/lib/binfmt.d";
>>>> -+                *ret = "/usr/lib/binfmt.d";
>>>> -                 return 0;
>>>> -
>>>> -         case SD_PATH_MODULES_LOAD:
>>>> --                *ret = ROOTPREFIX_NOSLASH "/lib/modules-load.d";
>>>> -+                *ret = "/usr/lib/modules-load.d";
>>>> -                 return 0;
>>>> -
>>>> -         case SD_PATH_CATALOG:
>>>> ---
>>>> -2.39.2
>>>> -
>>>> diff --git a/meta/recipes-core/systemd/systemd/basic.conf.in b/meta/recipes-core/systemd/systemd/basic.conf.in
>>>> deleted file mode 100644
>>>> index fac288f7fa..0000000000
>>>> --- a/meta/recipes-core/systemd/systemd/basic.conf.in
>>>> +++ /dev/null
>>>> @@ -1,40 +0,0 @@
>>>> -#  This file is part of systemd.
>>>> -#
>>>> -#  systemd is free software; you can redistribute it and/or modify it
>>>> -#  under the terms of the GNU Lesser General Public License as published by
>>>> -#  the Free Software Foundation; either version 2.1 of the License, or
>>>> -#  (at your option) any later version.
>>>> -
>>>> -# The superuser
>>>> -u root    0     "root" :ROOT_HOME:
>>>> -
>>>> -# The nobody user/group for NFS file systems
>>>> -g {{NOBODY_GROUP_NAME}} 65534       -            -
>>>> -u {{NOBODY_USER_NAME }} 65534:65534 "Nobody"     -
>>>> -
>>>> -# Administrator group: can *see* more than normal users
>>>> -g adm     {{ADM_GID    }}     -            -
>>>> -
>>>> -# Administrator group: can *do* more than normal users
>>>> -g wheel   {{WHEEL_GID  }}     -            -
>>>> -
>>>> -# Access to shared database of users on the system
>>>> -g utmp    {{UTMP_GID   }}     -            -
>>>> -
>>>> -# Physical and virtual hardware access groups
>>>> -g audio   {{AUDIO_GID  }}     -            -
>>>> -g cdrom   {{CDROM_GID  }}     -            -
>>>> -g dialout {{DIALOUT_GID}}     -            -
>>>> -g disk    {{DISK_GID   }}     -            -
>>>> -g input   {{INPUT_GID  }}     -            -
>>>> -g kmem    {{KMEM_GID   }}     -            -
>>>> -g kvm     {{KVM_GID    }}     -            -
>>>> -g lp      {{LP_GID     }}     -            -
>>>> -g render  {{RENDER_GID }}     -            -
>>>> -g sgx     {{SGX_GID    }}     -            -
>>>> -g tape    {{TAPE_GID   }}     -            -
>>>> -g tty     {{TTY_GID    }}     -            -
>>>> -g video   {{VIDEO_GID  }}     -            -
>>>> -
>>>> -# Default group for normal users
>>>> -g users   {{USERS_GID  }}     -            -
>>>> diff --git a/meta/recipes-core/systemd/systemd_254.4.bb b/meta/recipes-core/systemd/systemd_255.1.bb
>>>> similarity index 98%
>>>> rename from meta/recipes-core/systemd/systemd_254.4.bb
>>>> rename to meta/recipes-core/systemd/systemd_255.1.bb
>>>> index 0c12926bef..daa3a01fef 100644
>>>> --- a/meta/recipes-core/systemd/systemd_254.4.bb
>>>> +++ b/meta/recipes-core/systemd/systemd_255.1.bb
>>>> @@ -21,7 +21,6 @@ REQUIRED_DISTRO_FEATURES += "systemd"
>>>>    SRC_URI += " \
>>>>               file://touchscreen.rules  \
>>>>               file://00-create-volatile.conf  \
>>>> -file://basic.conf.in  \
>>>>               ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallback', 'file://org.freedesktop.hostname1_no_polkit.conf', '', d)} \
>>>>               ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallback', 'file://00-hostnamed-network-user.conf', '', d)} \
>>>>               file://init  \
>>>> @@ -29,7 +28,6 @@ SRC_URI += " \
>>>>               file://systemd-pager.sh  \
>>>>               file://0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch  \
>>>>               file://0008-implment-systemd-sysv-install-for-OE.patch  \
>>>> -file://0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch  \
>>>>               "
>>>>    # patches needed by musl
>>>> @@ -73,6 +71,7 @@ PACKAGECONFIG ??= " \
>>>>        ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '', 'link-udev-shared', d)} \
>>>>        backlight \
>>>>        binfmt \
>>>> +    cgroupv2 \
>>>>        gshadow \
>>>>        hibernate \
>>>>        hostnamed \
>>>> @@ -266,12 +265,16 @@ EXTRA_OEMESON += "-Dkexec-path=${sbindir}/kexec \
>>>>    # The 60 seconds is watchdog's default vaule.
>>>>    WATCHDOG_TIMEOUT ??= "60"
>>>> -do_configure:prepend() {
>>>> -  sed s@:ROOT_HOME:@${ROOT_HOME}@g ${WORKDIR}/basic.conf.in > ${S}/sysusers.d/basic.conf.in
>>>> -}
>>>> -
>>>>    do_install() {
>>>>    	meson_do_install
>>>> +	# Change the root user's home directory in /lib/sysusers.d/basic.conf.
>>>> +	# This is done merely for backward compatibility with previous systemd recipes.
>>>> +	# systemd hardcodes root user's HOME to be "/root". Changing to use other values
>>>> +	# may have unexpected runtime behaviors.
>>>> +	if [ "${ROOT_HOME}" != "/root" ]; then
>>>> +		bbwarn "Using ${ROOT_HOME} as root user's home directory is not fully supported by systemd"
>>>> +		sed -i -e 's#/root#${ROOT_HOME}#g' ${D}${exec_prefix}/lib/sysusers.d/basic.conf
>>>> +	fi
>>>>    	install -d ${D}/${base_sbindir}
>>>>    	if ${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator', 'false', 'true', d)}; then
>>>>    		# Provided by a separate recipe
>>>> @@ -754,6 +757,7 @@ FILES:udev += "${base_sbindir}/udevd \
>>>>                   ${rootlibexecdir}/udev/rules.d/60-persistent-alsa.rules \
>>>>                   ${rootlibexecdir}/udev/rules.d/60-persistent-input.rules \
>>>>                   ${rootlibexecdir}/udev/rules.d/60-persistent-storage.rules \
>>>> +               ${rootlibexecdir}/udev/rules.d/60-persistent-storage-mtd.rules \
>>>>                   ${rootlibexecdir}/udev/rules.d/60-persistent-storage-tape.rules \
>>>>                   ${rootlibexecdir}/udev/rules.d/60-persistent-v4l.rules \
>>>>                   ${rootlibexecdir}/udev/rules.d/60-sensor.rules \
>>>>
>>>>
>>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#194007):https://lists.openembedded.org/g/openembedded-core/message/194007
>>> Mute This Topic:https://lists.openembedded.org/mt/103380516/3617179
>>> Group Owner:openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [alexandre.belloni@bootlin.com]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>
>>
>> -- 
>> Alexandre Belloni, co-owner and COO, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com


--------------vYPxs6t31v6vNIqE6qIAAO3r
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 1/20/24 02:14, Alexandre Belloni
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:202401191814434c0685e2@mail.local">
      <pre class="moz-quote-pre" wrap="">On 19/01/2024 19:13:25+0100, Alexandre Belloni wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 19/01/2024 11:09:20+0800, Chen Qi via lists.openembedded.org wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">What's the status of this patch series?
Is there any issue or concern that I missed?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
I'm glad you asked, I got this today:

<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/8466/steps/26/logs/warnings">https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/8466/steps/26/logs/warnings</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
and I know you sent a patch for this but it didn't make it yet.</pre>
    </blockquote>
    <p>I just double checked with the following settings from the
      &quot;Sysvinit with systemd&quot; entry in config.json, there's no warning.</p>
    <p>DISTRO_FEATURES:append = ' systemd usrmerge'<br>
      ROOT_HOME = '/root'<br>
      VIRTUAL-RUNTIME_init_manager = 'sysvinit'</p>
    <p>So I further checked the build's settings.
      <a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/8466">https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/8466</a></p>
    <p>In the second step, &quot;Fetch yocto-autobuilder-helper&quot;, I can see
      the following logs:</p>
    <pre class="select-content log"><span class="no-wrap log_e" data-linenumber-content="291"><span class="">HEAD is now at ebb7e65 config.json: Fix syntax errors</span></span></pre>
    <p></p>
    <p>So the build is not using the latest repo. The latest commit is:</p>
    <p>97bb07f (HEAD -&gt; master, origin/master, origin/HEAD)
      config.json: set ROOT_HOME to /root for sysvinit with systemd</p>
    <p>Regards,</p>
    <p>Qi<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:202401191814434c0685e2@mail.local">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
Regards,
Qi

On 12/27/23 12:20, Chen Qi via lists.openembedded.org wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">From: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>

1. Patch changes:

0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch
is removed because it has no real effect now. The /lib is now
/usr/lib because 'usrmerge' is a required distro feature for systemd.

0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch is
refreshed for the new version to avoid patch-fuzz issue.

2. root user's home directory now defaults to &quot;/root&quot;:

The sysuers.d/basic.conf is still modified to respect the ROOT_HOME
value, so if users set ROOT_HOME to &quot;/home/root&quot;, the behavior is the
same as before. However, this is only for backward compatibility. With
this patch, The ROOT_HOME value is set to &quot;/root&quot; in init-manager-systemd.inc.
This is because systemd's source codes are hardcoding &quot;/root&quot;, and other
values are not officially supported. See the list below.
$ grep -rl '&quot;/root&quot;' src/ | grep -v 'src/test'
src/core/namespace.c
src/basic/user-util.c
src/nss-systemd/nss-systemd.c
src/nspawn/nspawn.c
src/firstboot/firstboot.c
src/shared/userdb.c
src/shared/user-record.c
$ grep -rl /root network/ factory/ sysctl.d/ sysusers.d/ rules.d/ tmpfiles.d/ units/ xorg/ tools/
sysusers.d/basic.conf.in
tmpfiles.d/provision.conf
units/emergency.service.in
units/rescue.service.in
tools/list-discoverable-partitions.py
Previously, the recipe was just substituting sysusers.d/basic.conf.in,
which is not enough to be treated as 'fully support'. I deliberately put
a warning message in do_install to warn users about non &quot;/root&quot; ROOT_HOME
value. Don't remove it until all above places are handled.

3. cgroupv2 is now the default.
cgroupv2 is the default for systemd for many years and it's the default
for distros such as ubuntu and fedora. Let's also use it as the default.

Signed-off-by: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
---
  .../distro/include/init-manager-systemd.inc   |  2 +
  meta/recipes-core/systemd/systemd.inc         |  4 +-
  ...tall-dependency-links-at-install-tim.patch | 22 +++---
  ...sysctl.d-binfmt.d-modules-load.d-to-.patch | 73 -------------------
  .../systemd/systemd/basic.conf.in             | 40 ----------
  .../{systemd_254.4.bb =&gt; systemd_255.1.bb}    | 16 ++--
  6 files changed, 25 insertions(+), 132 deletions(-)
  delete mode 100644 meta/recipes-core/systemd/systemd/0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch
  delete mode 100644 meta/recipes-core/systemd/systemd/basic.conf.in
  rename meta/recipes-core/systemd/{systemd_254.4.bb =&gt; systemd_255.1.bb} (98%)

diff --git a/meta/conf/distro/include/init-manager-systemd.inc b/meta/conf/distro/include/init-manager-systemd.inc
index 595d1f2644..0a76647459 100644
--- a/meta/conf/distro/include/init-manager-systemd.inc
+++ b/meta/conf/distro/include/init-manager-systemd.inc
@@ -5,3 +5,5 @@ VIRTUAL-RUNTIME_init_manager ??= &quot;systemd&quot;
  VIRTUAL-RUNTIME_initscripts ??= &quot;systemd-compat-units&quot;
  VIRTUAL-RUNTIME_login_manager ??= &quot;shadow-base&quot;
  VIRTUAL-RUNTIME_dev_manager ??= &quot;systemd&quot;
+# systemd hardcodes /root in its source codes, other values are not offically supported
+ROOT_HOME ?= &quot;/root&quot;
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index ccc3236457..1417e0150f 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -15,8 +15,8 @@ LICENSE:libsystemd = &quot;LGPL-2.1-or-later&quot;
  LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe\file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c">&quot;file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                      file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c&quot;</a>
-SRCREV = &quot;2e7504449a51fb38db9cd2da391c6434f82def51&quot;
-SRCBRANCH = &quot;v254-stable&quot;
+SRCREV = &quot;2018ccef6645ce00c784369a22dc4e98f6d7061d&quot;
+SRCBRANCH = &quot;v255-stable&quot;
  SRC_URI = &quot;git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH}&quot;
  S = &quot;${WORKDIR}/git&quot;
diff --git a/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch b/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch
index 085f1e9052..be231cf6b2 100644
--- a/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch
+++ b/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch
@@ -1,8 +1,8 @@
-From ca7d9a8d9c81702af9c599bb79706f12b1a465cf Mon Sep 17 00:00:00 2001
+From 29a58009a172e369ad7166e16dab2f4945c6b0d2 Mon Sep 17 00:00:00 2001
  From: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
  Date: Thu, 21 Feb 2019 16:23:24 +0800
-Subject: [PATCH] binfmt: Don't install dependency links at install time for
- the binfmt services
+Subject: [PATCH 1/2] binfmt: Don't install dependency links at install time
+ for the binfmt services
  use [Install] blocks so that they get created when the service is enabled
  like a traditional service.
@@ -25,10 +25,10 @@ Signed-off-by: Scott Murray <a class="moz-txt-link-rfc2396E" href="mailto:scott.murray@konsulko.com">&lt;scott.murray@konsulko.com&gt;</a>
   3 files changed, 7 insertions(+), 2 deletions(-)
  diff --git a/units/meson.build b/units/meson.build
-index c7939a10f8..219570ab19 100644
+index e7bfb7f838..1d5ec4b178 100644
  --- a/units/meson.build
  +++ b/units/meson.build
-@@ -149,7 +149,6 @@ units = [
+@@ -154,7 +154,6 @@ units = [
           {
             'file' : 'proc-sys-fs-binfmt_misc.automount',
             'conditions' : ['ENABLE_BINFMT'],
@@ -36,7 +36,7 @@ index c7939a10f8..219570ab19 100644
           },
           {
             'file' : 'proc-sys-fs-binfmt_misc.mount',
-@@ -246,7 +245,6 @@ units = [
+@@ -251,7 +250,6 @@ units = [
           {
             'file' : 'systemd-binfmt.service.in',
             'conditions' : ['ENABLE_BINFMT'],
@@ -45,7 +45,7 @@ index c7939a10f8..219570ab19 100644
           {
             'file' : 'systemd-bless-boot.service.in',
  diff --git a/units/proc-sys-fs-binfmt_misc.automount b/units/proc-sys-fs-binfmt_misc.automount
-index 6b1bbdc91e..5ec5b8670a 100644
+index 5d212015a5..6c2900ca77 100644
  --- a/units/proc-sys-fs-binfmt_misc.automount
  +++ b/units/proc-sys-fs-binfmt_misc.automount
  @@ -22,3 +22,6 @@ Before=shutdown.target
@@ -56,7 +56,7 @@ index 6b1bbdc91e..5ec5b8670a 100644
  +[Install]
  +WantedBy=sysinit.target
  diff --git a/units/systemd-binfmt.service.in b/units/systemd-binfmt.service.in
-index b04412e037..63f116e4fa 100644
+index 6861c76674..531e9fbd90 100644
  --- a/units/systemd-binfmt.service.in
  +++ b/units/systemd-binfmt.service.in
  @@ -14,6 +14,7 @@ Documentation=<a class="moz-txt-link-freetext" href="https://docs.kernel.org/admin-guide/binfmt-misc.html">https://docs.kernel.org/admin-guide/binfmt-misc.html</a>
@@ -68,12 +68,12 @@ index b04412e037..63f116e4fa 100644
   After=proc-sys-fs-binfmt_misc.mount
   After=local-fs.target
  @@ -31,3 +32,6 @@ RemainAfterExit=yes
- ExecStart={{ROOTLIBEXECDIR}}/systemd-binfmt
- ExecStop={{ROOTLIBEXECDIR}}/systemd-binfmt --unregister
+ ExecStart={{LIBEXECDIR}}/systemd-binfmt
+ ExecStop={{LIBEXECDIR}}/systemd-binfmt --unregister
   TimeoutSec=90s
  +
  +[Install]
  +WantedBy=sysinit.target
  --
-2.39.2
+2.34.1
diff --git a/meta/recipes-core/systemd/systemd/0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch b/meta/recipes-core/systemd/systemd/0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch
deleted file mode 100644
index 98914ae154..0000000000
--- a/meta/recipes-core/systemd/systemd/0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From f75f03ef6bc3554068e456bed227f333d5cb8c34 Mon Sep 17 00:00:00 2001
-From: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
-Date: Tue, 29 Sep 2020 18:01:41 -0700
-Subject: [PATCH] Move sysusers.d/sysctl.d/binfmt.d/modules-load.d to /usr
-
-These directories are moved to /lib since systemd v246, commit
-4a56315a990b (&quot;path: use ROOTPREFIX properly&quot;), but in oe-core/yocto,
-the old /usr/lib is still being used.
-
-Upstream-Status: Inappropriate (OE-specific)
-Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
-Signed-off-by: Jiaqing Zhao <a class="moz-txt-link-rfc2396E" href="mailto:jiaqing.zhao@linux.intel.com">&lt;jiaqing.zhao@linux.intel.com&gt;</a>
----
- src/core/systemd.pc.in           | 8 ++++----
- src/libsystemd/sd-path/sd-path.c | 8 ++++----
- 2 files changed, 8 insertions(+), 8 deletions(-)
-
-diff --git a/src/core/systemd.pc.in b/src/core/systemd.pc.in
-index 693433b34b..8368a3ff02 100644
---- a/src/core/systemd.pc.in
-+++ b/src/core/systemd.pc.in
-@@ -67,16 +67,16 @@ tmpfilesdir=${tmpfiles_dir}
-
- user_tmpfiles_dir=${prefix}/share/user-tmpfiles.d
-
--sysusers_dir=${rootprefix}/lib/sysusers.d
-+sysusers_dir=${prefix}/lib/sysusers.d
- sysusersdir=${sysusers_dir}
-
--sysctl_dir=${rootprefix}/lib/sysctl.d
-+sysctl_dir=${prefix}/lib/sysctl.d
- sysctldir=${sysctl_dir}
-
--binfmt_dir=${rootprefix}/lib/binfmt.d
-+binfmt_dir=${prefix}/lib/binfmt.d
- binfmtdir=${binfmt_dir}
-
--modules_load_dir=${rootprefix}/lib/modules-load.d
-+modules_load_dir=${prefix}/lib/modules-load.d
- modulesloaddir=${modules_load_dir}
-
- catalog_dir=${prefix}/lib/systemd/catalog
-diff --git a/src/libsystemd/sd-path/sd-path.c b/src/libsystemd/sd-path/sd-path.c
-index 1af3a36d1d..def502b717 100644
---- a/src/libsystemd/sd-path/sd-path.c
-+++ b/src/libsystemd/sd-path/sd-path.c
-@@ -365,19 +365,19 @@ static int get_path(uint64_t type, char **buffer, const char **ret) {
-                 return 0;
-
-         case SD_PATH_SYSUSERS:
--                *ret = ROOTPREFIX_NOSLASH &quot;/lib/sysusers.d&quot;;
-+                *ret = &quot;/usr/lib/sysusers.d&quot;;
-                 return 0;
-
-         case SD_PATH_SYSCTL:
--                *ret = ROOTPREFIX_NOSLASH &quot;/lib/sysctl.d&quot;;
-+                *ret = &quot;/usr/lib/sysctl.d&quot;;
-                 return 0;
-
-         case SD_PATH_BINFMT:
--                *ret = ROOTPREFIX_NOSLASH &quot;/lib/binfmt.d&quot;;
-+                *ret = &quot;/usr/lib/binfmt.d&quot;;
-                 return 0;
-
-         case SD_PATH_MODULES_LOAD:
--                *ret = ROOTPREFIX_NOSLASH &quot;/lib/modules-load.d&quot;;
-+                *ret = &quot;/usr/lib/modules-load.d&quot;;
-                 return 0;
-
-         case SD_PATH_CATALOG:
---
-2.39.2
-
diff --git a/meta/recipes-core/systemd/systemd/basic.conf.in b/meta/recipes-core/systemd/systemd/basic.conf.in
deleted file mode 100644
index fac288f7fa..0000000000
--- a/meta/recipes-core/systemd/systemd/basic.conf.in
+++ /dev/null
@@ -1,40 +0,0 @@
-#  This file is part of systemd.
-#
-#  systemd is free software; you can redistribute it and/or modify it
-#  under the terms of the GNU Lesser General Public License as published by
-#  the Free Software Foundation; either version 2.1 of the License, or
-#  (at your option) any later version.
-
-# The superuser
-u root    0     &quot;root&quot; :ROOT_HOME:
-
-# The nobody user/group for NFS file systems
-g {{NOBODY_GROUP_NAME}} 65534       -            -
-u {{NOBODY_USER_NAME }} 65534:65534 &quot;Nobody&quot;     -
-
-# Administrator group: can *see* more than normal users
-g adm     {{ADM_GID    }}     -            -
-
-# Administrator group: can *do* more than normal users
-g wheel   {{WHEEL_GID  }}     -            -
-
-# Access to shared database of users on the system
-g utmp    {{UTMP_GID   }}     -            -
-
-# Physical and virtual hardware access groups
-g audio   {{AUDIO_GID  }}     -            -
-g cdrom   {{CDROM_GID  }}     -            -
-g dialout {{DIALOUT_GID}}     -            -
-g disk    {{DISK_GID   }}     -            -
-g input   {{INPUT_GID  }}     -            -
-g kmem    {{KMEM_GID   }}     -            -
-g kvm     {{KVM_GID    }}     -            -
-g lp      {{LP_GID     }}     -            -
-g render  {{RENDER_GID }}     -            -
-g sgx     {{SGX_GID    }}     -            -
-g tape    {{TAPE_GID   }}     -            -
-g tty     {{TTY_GID    }}     -            -
-g video   {{VIDEO_GID  }}     -            -
-
-# Default group for normal users
-g users   {{USERS_GID  }}     -            -
diff --git a/meta/recipes-core/systemd/systemd_254.4.bb b/meta/recipes-core/systemd/systemd_255.1.bb
similarity index 98%
rename from meta/recipes-core/systemd/systemd_254.4.bb
rename to meta/recipes-core/systemd/systemd_255.1.bb
index 0c12926bef..daa3a01fef 100644
--- a/meta/recipes-core/systemd/systemd_254.4.bb
+++ b/meta/recipes-core/systemd/systemd_255.1.bb
@@ -21,7 +21,6 @@ REQUIRED_DISTRO_FEATURES += &quot;systemd&quot;
  SRC_URI += &quot; \
             <a class="moz-txt-link-freetext" href="file://touchscreen.rules">file://touchscreen.rules</a> \
             <a class="moz-txt-link-freetext" href="file://00-create-volatile.conf">file://00-create-volatile.conf</a> \
-           <a class="moz-txt-link-freetext" href="file://basic.conf.in">file://basic.conf.in</a> \
             ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallback', '<a class="moz-txt-link-freetext" href="file://org.freedesktop.hostname1_no_polkit.conf">file://org.freedesktop.hostname1_no_polkit.conf</a>', '', d)} \
             ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallback', '<a class="moz-txt-link-freetext" href="file://00-hostnamed-network-user.conf">file://00-hostnamed-network-user.conf</a>', '', d)} \
             <a class="moz-txt-link-freetext" href="file://init">file://init</a> \
@@ -29,7 +28,6 @@ SRC_URI += &quot; \
             <a class="moz-txt-link-freetext" href="file://systemd-pager.sh">file://systemd-pager.sh</a> \
             <a class="moz-txt-link-freetext" href="file://0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch">file://0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch</a> \
             <a class="moz-txt-link-freetext" href="file://0008-implment-systemd-sysv-install-for-OE.patch">file://0008-implment-systemd-sysv-install-for-OE.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch">file://0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch</a> \
             &quot;
  # patches needed by musl
@@ -73,6 +71,7 @@ PACKAGECONFIG ??= &quot; \
      ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '', 'link-udev-shared', d)} \
      backlight \
      binfmt \
+    cgroupv2 \
      gshadow \
      hibernate \
      hostnamed \
@@ -266,12 +265,16 @@ EXTRA_OEMESON += &quot;-Dkexec-path=${sbindir}/kexec \
  # The 60 seconds is watchdog's default vaule.
  WATCHDOG_TIMEOUT ??= &quot;60&quot;
-do_configure:prepend() {
-  sed s@:ROOT_HOME:@${ROOT_HOME}@g ${WORKDIR}/basic.conf.in &gt; ${S}/sysusers.d/basic.conf.in
-}
-
  do_install() {
  	meson_do_install
+	# Change the root user's home directory in /lib/sysusers.d/basic.conf.
+	# This is done merely for backward compatibility with previous systemd recipes.
+	# systemd hardcodes root user's HOME to be &quot;/root&quot;. Changing to use other values
+	# may have unexpected runtime behaviors.
+	if [ &quot;${ROOT_HOME}&quot; != &quot;/root&quot; ]; then
+		bbwarn &quot;Using ${ROOT_HOME} as root user's home directory is not fully supported by systemd&quot;
+		sed -i -e 's#/root#${ROOT_HOME}#g' ${D}${exec_prefix}/lib/sysusers.d/basic.conf
+	fi
  	install -d ${D}/${base_sbindir}
  	if ${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator', 'false', 'true', d)}; then
  		# Provided by a separate recipe
@@ -754,6 +757,7 @@ FILES:udev += &quot;${base_sbindir}/udevd \
                 ${rootlibexecdir}/udev/rules.d/60-persistent-alsa.rules \
                 ${rootlibexecdir}/udev/rules.d/60-persistent-input.rules \
                 ${rootlibexecdir}/udev/rules.d/60-persistent-storage.rules \
+               ${rootlibexecdir}/udev/rules.d/60-persistent-storage-mtd.rules \
                 ${rootlibexecdir}/udev/rules.d/60-persistent-storage-tape.rules \
                 ${rootlibexecdir}/udev/rules.d/60-persistent-v4l.rules \
                 ${rootlibexecdir}/udev/rules.d/60-sensor.rules \



</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#194007): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/194007">https://lists.openembedded.org/g/openembedded-core/message/194007</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/103380516/3617179">https://lists.openembedded.org/mt/103380516/3617179</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:alexandre.belloni@bootlin.com">alexandre.belloni@bootlin.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
<a class="moz-txt-link-freetext" href="https://bootlin.com">https://bootlin.com</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------vYPxs6t31v6vNIqE6qIAAO3r--

