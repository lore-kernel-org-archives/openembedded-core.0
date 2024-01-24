Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFB74C47422
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 06:48:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.17041.1706078899362316743
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jan 2024 22:48:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LZKoM7aC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1753778f48=yash.shinde@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40O66Dnj014899
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 22:48:19 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=WFUeyto41yRdBJ72VhwzMI30cy7k5fs6RSVg/hdbdd4=; b=
	LZKoM7aCTN1+RSK/PrCYAqJbnKsf+FMXu7z/UVPdXbiffJZSKbXwsX8a8gPh+t9Z
	FSilQjWGvUwTrrFWBnFzR4d82odDD2bvHO/4VpTu/JJ5mMPgmoqy5DH9DeJ4vBgX
	r5ei97sEo5UyuuhaNGNmNZN2t17OUhjXynmy+2HnqPVpPSnZsqfdsSXyUM+R2n45
	Z/bJxKoIN4Yuf5h7UHaqv/4SNtMaq/5IxedtUFle/fJjrZniZBpejgYd2znky3yc
	9SJLf+YnTSiBMrCHe72z0a6rZ7ROX935Z/hbd7dCDR7b6Askuy6WQ0uJ2Gxc2b58
	djSrRBCudHT700SYbKyMJQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vtmfhgdsk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 22:48:18 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 40O6mIGt030991;
	Tue, 23 Jan 2024 22:48:18 -0800
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vtmfhgdsj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jan 2024 22:48:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bX1DHpz0DsfbX54yciabYTLWWDMJApTtpM0YFS8YAL6cWlWuVn1me285VaSHVHFGN42hvUFCDo6zgN7+bprq5bG8tIO4CkmTTzn1bbPJG68uQl9FNRiHuvURFGmTguLtvN1vYZVSo1GKUZZJIEnwCaitCBnO8xwLK4VU4av1arVls/aKqPKp+0TUfqD+bhz87qLVw4UvAJE0FeywTPeRuhvirNqnkPu6mOUnPdorQ0qI/A+w4D7uhE20wFITGAxMO8IipX+5lXb29hwlNFlU+nMMws7cTlld7UlNaDLTZLjXR/902g31yk7l6qvq+5LtsRtvrvAZ38+hHnd846sRMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WFUeyto41yRdBJ72VhwzMI30cy7k5fs6RSVg/hdbdd4=;
 b=cM4YbHJv8pGa1Kh0EUi3BPpJbnLaTfYh69tdfaemCvcOi+/AXXYOwyyBR7pIlPELk7TbG9mrE1VDYL2hEmAjIT5j8NyU7v07LSqP+l9S6IUTUOpJhE3HjblSHAj17lz3kf5FTVZSL8D6sl98fh0Z6juws7b7yHOrJWsx96AO2uCSxU04GYCroD9zuQyZGRecHA4ejQvT7toJADMASAxpF/hJr+XD/Kuxd6tCmD4hG4WG6i6h6todTjpqRf95JmmFQnrKvIx9qwR8PULQoQC46w65if3jumz3EWnngTcwLI1ZuuFPjHl5hr+jWSS/sGOFBbr/EGywVEYOh01yG8gg4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by PH7PR11MB8036.namprd11.prod.outlook.com (2603:10b6:510:248::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Wed, 24 Jan
 2024 06:48:14 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107%4]) with mapi id 15.20.7228.022; Wed, 24 Jan 2024
 06:48:14 +0000
Message-ID: <db130c5b-ce29-44fc-bdbc-4dfc41ffd7eb@windriver.com>
Date: Wed, 24 Jan 2024 12:18:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 1/7] rust: Fetch cargo from rust-snapshot
 dir.
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com
References: <20240123131633.641012-1-Yash.Shinde@windriver.com>
 <36cf600e720193cac28386b4b4cf55f168f4058a.camel@linuxfoundation.org>
Content-Language: en-US
From: Yash Shinde <Yash.Shinde@windriver.com>
In-Reply-To: <36cf600e720193cac28386b4b4cf55f168f4058a.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0057.namprd17.prod.outlook.com
 (2603:10b6:a03:167::34) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|PH7PR11MB8036:EE_
X-MS-Office365-Filtering-Correlation-Id: 2210fc22-2044-4ca2-a1fb-08dc1ca86ffa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eRbPfL9/TOOkbJwuZrZr6KMvAdDlIhvH0dQcaFd5p6FNyrNL9I7lCkURWOVmPVJSE7lHgS4wZWT+06LAMvvgc8lh4typRtLyeb39Rb/O6c6zz1z73+i6v7x8MSnELH2GxgA+gBFjmHdczYBWFwLeOJJ2KQqKEMIdluqga6xj2rYrFIeZ63B5+HuDbJlQwMAeeZS62B/K56yTWnR4NhKzE52/T9V0aRgQElF7NRb4UVX//dU4hOy6ZGW60kz4iez+/Yt1pZwocZMGApA6SR0HHsua/4Vwl8zQ0hlMS7qeBV29AS/RNfiZspNYpgZmztera74v4o6EWsKHvgK3aqU3XiGt8q3/03zrU9DgqdL3A1gLak/Fkyf+Io3Eb5mpC+OSeX9w66XAJo4qUu68qGTK7mPB6MBv7zygtCg87op0rfbEGaY9BerrCfRSjszqKBiyIr9ULhe6eENdZLzprWDLu61BekWuPoBJk+eR9QYJu8tsIZIsGj3fi0/kwbi8GAZnChKuKO9UW2xbGuI86Te63dZMQVvsL88tESMO4Ahuj7YaO3NcpG3CMRBYg9OJLLE52qIJ5y2raGdkN75dpAgNWhX7vnoOmYqE3XiHGeLVN1VKDySfIRIqfIjfk6oc9wsZxbhVocKhSLw3opmW6ifuGOvyA7ZqzrrPZ4YUdVMwrFwIWwMFhph6X4MAYsOKuVYo
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39850400004)(346002)(136003)(366004)(396003)(230273577357003)(230173577357003)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(2906002)(31696002)(6512007)(26005)(86362001)(8936002)(2616005)(4326008)(8676002)(478600001)(41300700001)(107886003)(38100700002)(36756003)(31686004)(83380400001)(316002)(66476007)(66946007)(5660300002)(6666004)(66556008)(53546011)(966005)(6506007)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bzduTmQ3aHgxcjYwbmhna0RudktWS1A2UFk3bWp1elNtVmpvSUFDckVZVnRm?=
 =?utf-8?B?Y3U0L1I5NWx1SG5HUnp5cU5VUGthekdrYm5tQk5KK0NkcjlsZE93MzR0eVBL?=
 =?utf-8?B?WitoVGh3bXhmdzl3UmFFMjhFakRsS2QxRmtBb29Lcm9PMExhbXdQNTJPY21G?=
 =?utf-8?B?VFhRTE9RRlRSakxjVDVtcFg2L3pTRlFlWE1kTmJvZmg3bXFCMHd3TE9FTkk4?=
 =?utf-8?B?dy8vc25DeWxDNGxoSGZ4enBhQUVTOWVhaWpZclNkQU1iRWJ0cGN5VVBGQ010?=
 =?utf-8?B?MU9mT29BQUZ0TGVGdko4RTMrbkt2dVhndDRrT0Y1SjVicUxKM09rZnBWSnhn?=
 =?utf-8?B?aFpPekx3T3A4TVVZOURSV0xVeER1S0hnNG5tU2ZVWmQ2VkdHV3VzTjlleGhD?=
 =?utf-8?B?OGJHVWRlQjVvL0g4Qnd5TlZ2OWRualR1YURSNnE4QXpmdU5Tc3ErOEQ2dEoy?=
 =?utf-8?B?Q1A1eExnTUJBQUd0OFRkZHdyTHR2OHY0R2pWQkZiTFpBTG5jK1Z3dHU0M3Z3?=
 =?utf-8?B?VmswNlFTeWplTVBnQTZaSGxiTHpaTnN2WUNPUDRJTlNsOXV3L1BlSzZOWExa?=
 =?utf-8?B?MnFnVnlKZnVaOUdTeTgydDFGOHZ1K3ZDSHc4VGZpdE5JeC9ZNyt3RXNRRmdP?=
 =?utf-8?B?OWY2UTZ6TkY5SFBZMHlJanRkRmVQT041VnlGaTFwUGF3MnlKTDBzQWpUaDBj?=
 =?utf-8?B?RkNCSEFRaDRGeGhZQ1JGU3JUUzNJV2lTL0FOVlBNSUVpQUVuOGN2eE1jKzI5?=
 =?utf-8?B?N2ZFNTJLQVJZTTlOTzNiRVpjWlV1c2FHdEZjeEFMMSt0aXI0NTg3bys5RWUx?=
 =?utf-8?B?MHpIdHBQNlpnN280elN2bzlYdjMwYmpQZ08zUWtraUdsN2k0SXhrNnpRa0xw?=
 =?utf-8?B?cmFxam1qb3JBbDZFUVNjeWt1Um9pRURZWXhKVUlCNGdhUUpJd0JUQVV4QUd0?=
 =?utf-8?B?OEhUMGhyL0RvVW9wVUIyU0djQjhWaVljOGR5Y21qL2ovd09ESDBIMG1Kcjl1?=
 =?utf-8?B?My9OTzYxWi81QzkrR3YzdUowTUJTa1dnd3lySVBtSjg5d2k1QU10QlpBVWVi?=
 =?utf-8?B?NTJ5dVBxbXdoSmV3WUx3UGZub3BhNXNzbEpkREhZelAvZDRZajZYdUt5VU1O?=
 =?utf-8?B?Nnp3WTF2azVOdEtHTmRHZkw1RDJlQlZCNjJjZ0ZMNGpnNUpiYjZGb1ozdDZ0?=
 =?utf-8?B?N3NTQ3JwMzB3QjZpVmhwYjBUUGpTNjRpcG5qbS9MdHcreTdvTHdoQVBtOTVL?=
 =?utf-8?B?OWpYRHFKZ3JqY3p2Qk03YWRwNS9LczNwMU1ySWQ5N0hra1RpZ2xjb3VlM1NJ?=
 =?utf-8?B?YVNVSlVMdHYycWxpOUZxOGpsRkRuQ1BOQUhxNThrcy95Ris0cEVFRlEvTDRo?=
 =?utf-8?B?cTBnREVBSW1GQmxyRk9oc0ltZmJCcXFUamZUMEhVQTJadkRjakxvelIrL2Vs?=
 =?utf-8?B?Szdjc2IzN2o5VkJtZGdyWkxQR3JXTW52RWhhYWpwamwzcTlvRFhYbXEya2pS?=
 =?utf-8?B?bzh1QmlDekFyTTgrOFFBSlRRZEZwMnZ4Z1hPMmozb2NCSWUrQ1AyQ3hNb2lq?=
 =?utf-8?B?SjFDUUVYM2w5ZmZ6QWZmVlpRZFFRQUlpWnMwU3NIcEhvYnFXVXdDS1RuWWVy?=
 =?utf-8?B?ZURJZVNzQXAxL2YwS0RGaEZtVWtXNDNKVGJTRjFUdUdIUTE0dnkreDg1Z21z?=
 =?utf-8?B?dE9vUHpYcGdrQWxYOXVoT1A2MG13WEVZMDJtVDNIWVVSbDVOWVNrU25od1Zn?=
 =?utf-8?B?MHB2Rlp5R0NMU254aDROdXB1bXRYWXNISFZMeGQ4Nnp5S1lhNFZLaDV4c0lG?=
 =?utf-8?B?MVVMN2FGTEtoZ0IwazE2dVk0OXNjSGhuRTVERitOdnVqSkJXcmRxTGFjanlX?=
 =?utf-8?B?YXozYTcyVGU0RWhwZ1N3NGQ5TVlTYTk1VVRRT2MxTUxOd2ZjSVhoV015VWtF?=
 =?utf-8?B?ODd2RTZFd3ViRnl2Y2FhUlMyeE5qRFdnbmZubFgyY0plWDdTemF6QURBcC9U?=
 =?utf-8?B?YWticXNSY1l2ZWRqT21nQ2ZBNlA3cTdYT0ZlS1JadGpNcUlkTjI1MWx1Q1NI?=
 =?utf-8?B?b2pwRE9rVmYybmQwbjYrSlZreHNXdDRSSGwxVDlRZFl2Mm5MQ0xoOEJCd01z?=
 =?utf-8?B?Y2hwemNwRDA0aUYvcW5LcjBra0FkVU9ObXA5SUFLWmxaU3hVbHZzQ0w4L2Mv?=
 =?utf-8?B?QkE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2210fc22-2044-4ca2-a1fb-08dc1ca86ffa
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 06:48:13.9762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1K8R/vAeUPhoNGlt+4/uX9tlrqDeD+gvebD7iz2aKy5Tqvvnz84YoiPIT8TYf8aWvmxzb6KzOngRZVH/I5M3xqPW3t8LcGMhXB8iI4hX+WU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8036
X-Proofpoint-ORIG-GUID: GaCxn1K3NPjk8JdTXHtXwQGk6fJMoMSF
X-Proofpoint-GUID: wWK-aB-wLohUokIoTjIe4x9lmYP0KGRS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-24_02,2024-01-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=924
 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401240048
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 06:48:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194261


On 24-01-2024 01:37, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Tue, 2024-01-23 at 05:16 -0800, Shinde, Yash via
> lists.openembedded.org wrote:
>> From: Yash Shinde <Yash.Shinde@windriver.com>
>>
>>      Fixes: Exception: no cargo executable found at
>>             `${B}/rustc-1.74.1-src/build/x86_64-unknown-linux-gnu/stage0/bin/cargo`
>>
>>      Fix the cargo binary path error on oe-selftest and path set to rust-snapshot dir.
>>
>>      Patch sent to upstream- https://github.com/rust-lang/rust/pull/120125
>>
>> Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
>> ---
>>   .../rust/files/cargo-path.patch               | 37 +++++++++++++++++++
>>   1 file changed, 37 insertions(+)
>>   create mode 100644 meta/recipes-devtools/rust/files/cargo-path.patch
> Unlike earlier versions of this series, there were a lot of failures:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6482
>
> Basically every machine except qemumips failed on the toolchain tests.

I investigated and found the cause of the failures.

Actually, some test cases were additionally missed while removing them 
from exclude list when
making changes for "rust: Remove the test cases whose parent dir is also 
present in the exclude list" patch.
(Maybe, the automated tool used to remove tests didn't work properly...)

I fixed those and after successful tests, I will send the patch.

Regards,
Yash

>
> Cheers,
>
> Richard

