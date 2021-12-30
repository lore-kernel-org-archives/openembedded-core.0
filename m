Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0A36C433F5
	for <webhook@archiver.kernel.org>; Thu, 30 Dec 2021 08:52:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.62257.1640854322730888045
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Dec 2021 00:52:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ZBKf17O2;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=8998ad2b46=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BU8dKAk015370
	for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Dec 2021 00:52:02 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=WQQ9HFX3FRkNTYUPqHhBwufRKvK8p0vRaDyfF4yhupM=;
 b=ZBKf17O2LM42e9/CkOXehXSiZB/AoYGkA+L+aQebDYijRbW1/7dCysHjyvDFY9Umt4rU
 J3B66BIALX1VXjnujk3k60ZKxfsqrAyKlQAMTAZsWd0zc4q5mJLm03I89UmLmuTxK0UM
 ind9qJhljyzZndoWGZDPrpMMFcUqTaI0OW4ksmMrXID3fm5SVZJM6HvmXuv7wXV1Cg2D
 lHbnP+BlhjnGL9G06oedOWoIb+4T3kqGtt6rCogKhq7y/AuDE1Zkb4d52QYEQXeCDaPf
 y8MinGtKFGg8NWRTzhuR0axsZZ9GAEXnI4Ak8FdRRK642Vg0stMOKH81xDFEj3Krzn7+ UA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d94fs03uk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Dec 2021 00:52:02 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1BU8q1GY005473
	for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Dec 2021 00:52:01 -0800
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2042.outbound.protection.outlook.com [104.47.74.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d94fs03uj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Dec 2021 00:52:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aNFXsjV2ICdiU/Ki3RDuZFuvhGU3VHMn1Xxgz4dytCwDFEC4D53kBe/nQMCsrosjlNSGmQB1wrPYXklemQJLcPstGnXcZWumsRFMRXynaA7ELwL03UsQds771DEWZf4E/OOlgmRZBkkLqqNekmuA3P+vUQKdcnozsLDzolxxe8einsJ8dJSKkfzADELgmUbl3kPmxkLtnJ4WXJLYLDNIvOi5U2dZNJ7bc3DEGiQujhatQw7zY8TKRZBT2j5WbUgM+1HEelygKHZpH01QAlQ3fLCxYqJXSOxhQ4si4Ey1tRU/pmuClae9X+3KYNaMuKQQypA5nAOFdv2hJLwFgt6xCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WQQ9HFX3FRkNTYUPqHhBwufRKvK8p0vRaDyfF4yhupM=;
 b=N/qPjMk8td9L55xYOEzV7IeEuygk1GYXbdNPBc7pKMUxEbBMqqqnnDsc/T7sBwTsVIL8CesuKOxRuZqVwer+StgErBJvkV4kiO1s+CcRzf+K7aFWfKRKiQc2fDTGlYJKuJmv2QeGIxRsHkw6mGXQBl7+zHXP0yz2m/tyCRNd19LfiIPkSwXePVY/wDTkknigutM3cNRdSPeeLfYpGEC5zh5jLXVkHkNaVpIOtkGGydC60LV5dEjjaQjlb6/I1HEb+eJc9NnEZEcnC0kJ0hq0M7Oo01hjv0+FIF+5GYWWxlwb5xrvJswc7KjppI4z0bjrQ9SCMcuCxDXR1LU7azDe4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SA2PR11MB5081.namprd11.prod.outlook.com (2603:10b6:806:118::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.13; Thu, 30 Dec
 2021 08:51:58 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::b8e4:15a2:7da4:2cc7]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::b8e4:15a2:7da4:2cc7%6]) with mapi id 15.20.4823.024; Thu, 30 Dec 2021
 08:51:57 +0000
Subject: Re: [OE-core][PATCH v2 1/2] qemu.bbclass: drop OLDEST_KERNEL
 reference
To: Matt Madison <matt@madison.systems>,
        openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>, Khem Raj <raj.khem@gmail.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20211216114836.964835-1-matt@madison.systems>
 <20211216114836.964835-2-matt@madison.systems>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <3e66c6fb-b376-a292-34b1-70abdc270f41@windriver.com>
Date: Thu, 30 Dec 2021 16:51:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20211216114836.964835-2-matt@madison.systems>
Content-Type: multipart/alternative;
 boundary="------------4192E0C412BB5837410FA50E"
Content-Language: en-US
X-ClientProxiedBy: HK2PR0401CA0013.apcprd04.prod.outlook.com
 (2603:1096:202:2::23) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c4170c0-2091-4441-af27-08d9cb71a2fe
X-MS-TrafficTypeDiagnostic: SA2PR11MB5081:EE_
X-Microsoft-Antispam-PRVS: 
	<SA2PR11MB50816A651AE274DBFA03AC5282459@SA2PR11MB5081.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uMgW4SPrvP30mwphYN1gXoa7gnPHqjo+3iDkV5gnSw1vUYiEvPDi2UXbTe36mSiZ5brjhmYCQfLdZlb8+pPN7QxMTJKIK/qZpvuLGBsNF76hPYyokM+6tBpjVrK6Bv+pMndkMiwC9kmYnGklha4uQ2tg98X4ugTLR1Y8FIUHIpMWeMoB5bWiQAUnbtVS98NmqzxmU6op8y5CZg56/b/NSoHpjj6U5aj4GYfmHzuc6d+BjQg9r0IJ1+jATLNN0KiDqVO3BZBMlRglciINjg0eeU35xxMXbEmV9z3fvOS30tXeBnzsBhvEjIL2ACBCxHeumxGevYjQ1HO9wQo8g9t8O7kukoGr40HUOWBqDsWJfui6bU8bp3s8NHPLk0Xc8+FM0zrqubTQNx0yABVhQQ/nCeJKZuJ8zk9CXsI5y31kigiWCx19ShCfPG5TEm/ILmXd0Uz5OLTf/h7dij8nAF7swiq8Cl7K6PV8BTFYKg8wCDSc4v13JzVm7wmHawGTWQoYuo1Bel3QhznlbPJho7JkwOMi3yXQGLU3N8gIFgb7bTRE6LZuspQjEouTf9rQvXuaNxKYnqjHj7LrqWfx7a6ISGfIGQoWjOFATdRyNJcN+MK3egFH1AumlQQx+KQHL9qNavZe/646rSVYLTphgGnwvbk+6p/bkfFQk4jMb7ArfGLK6D+Mnm7TicHr4fRIxck6VXCQzNoXPSkOCWFhjnsNzWIVdFWatEIM7Hc+yQsZ6ULzTweYNT8GfF0tfOFJAZPDcVWzjhVG+HCLOqSFSosib5Sy04E+uWMpuElyVxFAqWmSMuQxp5pAxKz6i+tf2QIoh0eHdrdxEsgNbiG0GrYtYj0Ihhh3yWMKHZEvZOWdw4Gy1VjNGTOI6dQAc6MosxvMIaVpaNxPoCyfFAmKoxNwNw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(966005)(508600001)(38350700002)(38100700002)(6666004)(53546011)(6506007)(26005)(6486002)(31696002)(316002)(186003)(8676002)(66946007)(5660300002)(6512007)(66476007)(66556008)(2906002)(44832011)(2616005)(86362001)(31686004)(83380400001)(52116002)(36756003)(166002)(54906003)(33964004)(8936002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aWl2cEo3R09HbUxRQXdYbkJKMGNSVXVjd3lVdFhqZG0zWXZETXV5bVdsYXV0?=
 =?utf-8?B?ckdWdTNHbTlTckxZMC95WEcvdG1FZkI0VTFtTzR2SmVwMXY4dmM5UUJycHk1?=
 =?utf-8?B?Z2JTcVFDQ0w0Vm5qbFhJY2w3cTg0dW5RTTNlbkwrMlBqanlNZm1vZDliUjNF?=
 =?utf-8?B?SWFqM2R0K0Q0WEFzVmo1OTAybVJYU2FHSTFqTzNDVUlpUk5ScFo0ZEhTZmli?=
 =?utf-8?B?SGwxYmZBYUZoTGIvYmRnNy9TY0pBSFovUlFlNndVbnFNT2RyVG1maXFVaHps?=
 =?utf-8?B?eVBCYW1EVXNEL1I5NTNwbDZNM0R1MEVKRm9mcmdXWmpaQmJUaXBrM21BaDZi?=
 =?utf-8?B?UzkrLzZlYWJjZmU4NWs0WGI5VkxIUHlpWUFWUUdpWGUxb3VMY2NpRHNRTW5k?=
 =?utf-8?B?bUwvTXhnTVZHVGh6ZnIvSWZoZUNEalVabkpmK0JLRXhmdExuVVdsUG5kVHRX?=
 =?utf-8?B?dytWSzhlTnN2K011dVY4MmxhbE1ub3FSaUN0eVFxc2VHaXJ0b3NPWWwrdXZl?=
 =?utf-8?B?czlvZVpTUlBFMnp5d09LWDJZQmgwaEFHVEw2Ym9TRi9SK04vMVc0dURmRzBZ?=
 =?utf-8?B?bmk4OXFkY2ZINFZmcUhzdWRocmdmL0grZ1JSZkpZeERVdGt0TlZmeUNLd0FS?=
 =?utf-8?B?SXBVTkxGNTVRWll1b2JOL01vZnZFOGxSdzlYSk5LeitwZmYrOWRXOWpDU1I3?=
 =?utf-8?B?UDNxOWc2clE0bFNQaEdqVUova2NNTFBIQWpBLzJkUHV0RWlETzNUenY0Z3Rz?=
 =?utf-8?B?NitrS0NqOTVockloMXljN0Z2Y3Q1RlVvM2lMaFVFa1VmZUttcU05dG96QUFs?=
 =?utf-8?B?bjhiUGFTNWp5L2xFdHFPamM3L09nMDJJQVdOUjJLTWVOQXF6bDZLSzVSeGNS?=
 =?utf-8?B?UzBDNEcxZ01aand2RDJLZzZmcy9jQ0tRbkJ1RDZtZG4wVmVEMGJkM1FRSHU5?=
 =?utf-8?B?K3JUcWFBdG80SzhhZFZuMWhtRVJwc2RidkEwcFRETWlYOHZWT1JZeUt4enVs?=
 =?utf-8?B?bnplTVZBUHpMUm5DRjdNWDI0bTlUZzl2NFBUSldIeFhSM1Zvd2YxeXFkaE5B?=
 =?utf-8?B?Rll3dXFObWdOeDlpY21oSk1LWTNpc0pTNU5UTDdQRDZNS245S3VFc1BHWDRD?=
 =?utf-8?B?d0gySXRkRTRDeEVnTk42NTMwcEFuUkFTS0JRK0oxa0RJYnpBQm1RRWdYSVBo?=
 =?utf-8?B?dUVOazd6a3VGak5CbUt6Zjh2SGZ5WklyMFBHUmEyZGhmdFZWNiszdHdjakZm?=
 =?utf-8?B?MXMxdmRxSjdnTUo4VWdyamFhYWY3eHRXNTJwQk15SGxGdEJVbk5XUThEUWlK?=
 =?utf-8?B?eGF6bzJ4a1hHcFlPdVZlTUxqbHl0czE5Y2NjV09Cb0pGb2NhWHFJS0llVHI1?=
 =?utf-8?B?eURnZ25RMEgybUhXcCt5YTNJeXJGWnZoZFJ3SW5MOC9hNnVyRXZ2b2RxeTRL?=
 =?utf-8?B?RDIyei9wOHdxQisxd1hYK2dkWjI1SzN1UHRFcU5xMFhHNWpRVGVuSFBHY3FT?=
 =?utf-8?B?N2p1d2hnNmlQeTNmdk95SUkyRllCOGV4V0x6RnhvRklHUlFGSU9TMHVjOEdp?=
 =?utf-8?B?MDBOZjdmNVNWU0pqYktVQnFzZm9ZMXZEK1dLQXgxSWMwdktvL2gzNjN0WFVu?=
 =?utf-8?B?bG9BNy84WDVSSjhURGhpVHVYbm1TbE90ME0xeHJ5em5LdUtxOHNqanpLQmhE?=
 =?utf-8?B?ZjlEN3I2RjdrdkJLSzBybG5XZXBuY0FjVHFKWk5sdVJhV0QwN3pXNVEyenhn?=
 =?utf-8?B?d1NBRWV6aHU2U0FENURTN3FnUEVsTUpHSE5YVFVkbURYaStxaHVRV1FWcW0w?=
 =?utf-8?B?ZHVyVXBrc1VRdlMvckFCMXpsOEZ2cm5sODVoOU5Sck5DV1l6OCsxMTM3OUd2?=
 =?utf-8?B?NmpieUZzYmVSMlZtcjlaUmhrQ1VhdE5TT1dMWnlmeHJlanBOLzlvT3IzTmRI?=
 =?utf-8?B?dnVYeDZzdlpkQ2hkWktWaldaZzBlbGdlRGNkUm5SdmdVKzBIcTFSdTMwSHZB?=
 =?utf-8?B?UCttcDBrb1FNYkM2b2hmVStrM0RZWTNsdjVhTkZ6WmRLbjJ2NDc4NUFnYUZV?=
 =?utf-8?B?MHA5R2F1aGNacmtUVXE4aTJKVDdDbEJEWG8zTkorQWpxZ3o4WFFxMTZXTXRL?=
 =?utf-8?B?MmtzdFIvZlN0UUpjaUcxbXN6UitlbzNMV3dqa1JrdHUvNzA4R0ZyN2RUVExE?=
 =?utf-8?B?UEgwdTJXQ0FFTmIrOG5oZUROT011MWlSdDhLby9rR0JVTnM1L1RVeW1HSU1q?=
 =?utf-8?B?Q2lKOGp2S0JpWHFiVkxQR2wrRUZnPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7c4170c0-2091-4441-af27-08d9cb71a2fe
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2021 08:51:57.7617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 iVEqsu3h/TG7Y4b08bXaAGtyvFjHQAkVYLRcvSFBKNQDNSqSP7wfHx8V24Y+D04kE8yWRvFVNFjV2Hy8AMRFDcRjdq15+iL3Qh5WhMHJKfo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5081
X-Proofpoint-GUID: wsbJcZV2j7BFJvbNK2j4131NZfdPg00b
X-Proofpoint-ORIG-GUID: R_YxBpbUAZwzPay8oU2gNDAtVpfjKTxw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-30_02,2021-12-29_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 malwarescore=0 spamscore=0 mlxscore=0 adultscore=0 clxscore=1011
 impostorscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112300049
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Dec 2021 08:52:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160058

--------------4192E0C412BB5837410FA50E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/16/21 7:48 PM, Matt Madison wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> which is introducing task hash changes for some
> allarch package builds, and should no longer
> be needed with recent versions of qemu.
>
> Signed-off-by: Matt Madison <matt@madison.systems>
> ---
>   meta/classes/qemu.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
> index 01a7b86ae1..333202b7c4 100644
> --- a/meta/classes/qemu.bbclass
> +++ b/meta/classes/qemu.bbclass
> @@ -54,7 +54,7 @@ def qemu_run_binary(data, rootfs_path, binary):
>   # this dance). For others (e.g. arm) a -cpu option is not necessary, since the
>   # qemu-arm default CPU supports all required architecture levels.
>
> -QEMU_OPTIONS = "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH')) or ""}"
> +QEMU_OPTIONS = "${@d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH')) or ""}"

Hi,

Latest yocto still take "CentOS 7.x" as Supported Linux Distributions. 
But centos7 have kernel version 3.10.

But we have some archs, like aarch64, set OLDEST_KERNEL to 3.14. Without 
"-r ${OLDEST_KERNEL}",

some recipes which will run qemu during configure or compile will failed 
with error:

FATAL: kernel too old

How about add it back?


Thanks

Changqing

>   QEMU_OPTIONS[vardeps] += "QEMU_EXTRAOPTIONS_${PACKAGE_ARCH}"
>
>   QEMU_EXTRAOPTIONS_ppce500v2 = " -cpu e500v2"
> --
> 2.32.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159782): https://lists.openembedded.org/g/openembedded-core/message/159782
> Mute This Topic: https://lists.openembedded.org/mt/87765279/3616873
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [changqing.li@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

--------------4192E0C412BB5837410FA50E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 12/16/21 7:48 PM, Matt Madison
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20211216114836.964835-2-matt@madison.systems">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

which is introducing task hash changes for some
allarch package builds, and should no longer
be needed with recent versions of qemu.

Signed-off-by: Matt Madison <a class="moz-txt-link-rfc2396E" href="mailto:matt@madison.systems">&lt;matt@madison.systems&gt;</a>
---
 meta/classes/qemu.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
index 01a7b86ae1..333202b7c4 100644
--- a/meta/classes/qemu.bbclass
+++ b/meta/classes/qemu.bbclass
@@ -54,7 +54,7 @@ def qemu_run_binary(data, rootfs_path, binary):
 # this dance). For others (e.g. arm) a -cpu option is not necessary, since the
 # qemu-arm default CPU supports all required architecture levels.

-QEMU_OPTIONS = &quot;-r ${OLDEST_KERNEL} ${@d.getVar(&quot;QEMU_EXTRAOPTIONS_%s&quot; % d.getVar('PACKAGE_ARCH')) or &quot;&quot;}&quot;
+QEMU_OPTIONS = <a class="moz-txt-link-rfc2396E" href="mailto:${@d.getVar(">&quot;${@d.getVar(&quot;</a>QEMU_EXTRAOPTIONS_%s&quot; % d.getVar('PACKAGE_ARCH')) or &quot;&quot;}&quot;</pre>
    </blockquote>
    <p>Hi,</p>
    <p>Latest yocto still take &quot;CentOS 7.x&quot; as <span class="section-number"></span>Supported Linux Distributions. But
      centos7 have kernel version 3.10.</p>
    <p>But we have some archs, like aarch64, set OLDEST_KERNEL to 3.14.
      Without &quot;-r ${OLDEST_KERNEL}&quot;,</p>
    <p>some recipes which will run qemu during configure or compile will
      failed with error:</p>
    <p>FATAL: kernel too old</p>
    <p>How about add it back? <br>
    </p>
    <p><br>
    </p>
    <p>Thanks</p>
    <p>Changqing<br>
    </p>
    <blockquote type="cite" cite="mid:20211216114836.964835-2-matt@madison.systems">
      <pre class="moz-quote-pre" wrap="">
 QEMU_OPTIONS[vardeps] += &quot;QEMU_EXTRAOPTIONS_${PACKAGE_ARCH}&quot;

 QEMU_EXTRAOPTIONS_ppce500v2 = &quot; -cpu e500v2&quot;
--
2.32.0

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#159782): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/159782">https://lists.openembedded.org/g/openembedded-core/message/159782</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/87765279/3616873">https://lists.openembedded.org/mt/87765279/3616873</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------4192E0C412BB5837410FA50E--

