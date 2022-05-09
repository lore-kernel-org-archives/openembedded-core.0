Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93734C433F5
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 01:41:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.27013.1652060488305174480
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 May 2022 18:41:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=Iz/G5zJF;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=2128ccc66a=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 2491fRqf008293
	for <openembedded-core@lists.openembedded.org>; Mon, 9 May 2022 01:41:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : subject :
 to : cc : references : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=a+ZSLWXNCcM8EVGfMZY2wxe5IK91+CCtOz/WPfV9MQc=;
 b=Iz/G5zJFkru7BPFMSMEG+KF6VoXBPC1BkgRYAVtSWPujXjaHz6ZoqD0O3q0JAgUF0jyE
 RWei2BdgOWzvVgeTVpdo033qI/6AyVsNEvFrmbgeCGJWrNRyJs7D3G2gWkzYOdipanZy
 m2RE+TU6b3dlq+5aUqPrV+sxiNeOcin2MkfGZCdim+klzNETA53yUz+3HYJ9445NKfVp
 pHM0I94/32QBl9XKpQJNkIea9MeDRGle0USl5C0UD253bMP/h7MGkx4+RlFi319dm4wW
 q2HkNvdodT4y8AO4//GpMJSul0HulJsouemQJqEYOsLOLVdHR0fOB0mIXXxX7i1U40w5 JQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fwdyys2cu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 09 May 2022 01:41:27 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2491fR4V008202
	for <openembedded-core@lists.openembedded.org>; Mon, 9 May 2022 01:41:27 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fwdyys2cs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 May 2022 01:41:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XzBV+3QAZzxjEVG8ms+uL43rdf1FdWZTo6byFjZWI5K4Jlaodb9IA19226YRjxJRxj/VLPtld9t8EvecX5D+pMt6RWNVzarYhMpo1WLtbi7/o5sJCzKAzcfXhvq1jDhVDbSoiW7vSQLKnU2mrt2HQyG01D3w5RDW6CSXT9XuwnssjupyIks+bRKv9bZfOKuTZuv5pvDjGPqKioRy40/f1quBCVRbpp8ouP11aFbSdwHZbTWxKPKgDnsuXYm+FdKUCWVVO5CTp54cWTfTGhJNhpmZr8uZDRMS++mZBoISJXSPncZL7E47J/PSd+3dO0uOz/0TNhCcBN3uG85V3/XBZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a+ZSLWXNCcM8EVGfMZY2wxe5IK91+CCtOz/WPfV9MQc=;
 b=nMhA6CHPz5nqU6Kr4FAR3GBXSot30niQpcWUVd3Cfn3B/HR8WHYu7xY0cH/lyRd9xnWTN6b+zVI777Fb7uTD+Y9ucjJMMHHlBhf+cWqjxIXTgxS5LRgNGbac5zSOgPkO51zc4XObwrrhCGPW+iAbp4t27ut7sfWdjLh2t33XoBaBDM4BBVlEHgtF920gLiSwzKAsW+iLqgfQLR3n4Ecr2kXy0bXdPlS0grZpl6OusN2niXex9ZWgJ2ZYEH40EWNO0SIuDsg0QPywc/Ma2fmO6XHccCrUdhyUdyY2WuuX5Tg6D/msF/X05cnICeilx9xip/XVsrkYUQQW9+WKQ0gLiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by DM5PR11MB1386.namprd11.prod.outlook.com (2603:10b6:3:11::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Mon, 9 May
 2022 01:41:24 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::c103:34e:6b82:8f92]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::c103:34e:6b82:8f92%4]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 01:41:24 +0000
From: Changqing Li <changqing.li@windriver.com>
Subject: Re: [OE-core] [PATCH] bitbake.conf: support persistent /var/tmp
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
Cc: Randy MacLeod <randy.macleod@windriver.com>
References: <16989323AFD32DAC.17148@lists.openembedded.org>
 <16A0074A273CDC4D.26797@lists.openembedded.org>
 <11e3b9fb-0673-db2f-5f6a-4f10d48cda0c@windriver.com>
 <0f44c9945b6ffc2583dab6eabd796b2af7633ee4.camel@linuxfoundation.org>
Message-ID: <606c9365-f490-ee62-0051-22e1329f6bde@windriver.com>
Date: Mon, 9 May 2022 09:41:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: 
 <0f44c9945b6ffc2583dab6eabd796b2af7633ee4.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-ClientProxiedBy: SG2PR06CA0214.apcprd06.prod.outlook.com
 (2603:1096:4:68::22) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a05d18d3-39c6-44b7-fa5d-08da315d06da
X-MS-TrafficTypeDiagnostic: DM5PR11MB1386:EE_
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB13865DBF0A00E20D0B724B0B82C69@DM5PR11MB1386.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KwwUiKJ4vknRZ0pWcoq+iKFyzJo+vcRUjIJ3qhQKSVz2i+7hpoCVYJPvHuT9LNb4LcuVa/GDV2FB/28OYESEOGA/iLaF0QagCUZuUD1KYsWyK/Buw1nhtZl4lwSbCZT2kEEIQMoeyQQORs9ZxH6M3qSqtjCWQLZu9LpX0793cIDY/GMJf3S7yDV3okJexRIJWATzDRnbs3kqgEEl8SlnPF1TvaJb66cUTJhB1Mdaq/0XvlO0bjjzHu9lrAwAkV6vX8ECjG2Kgvn1Bfh+JmyKnaaQToqBxFPDnHtMiFexvnSUxI6J+SA/yLnB/+aMN7kC8G1XbVv1GNnTXKFLRTrgNkOfrakA8ORtTfqv/6ujFczu6zD4lRZj43jLrWMZCoeBjkVa1LSCD6KCXI7S0Qra6lph0lz1pJ2fs1IZ1PohjxR44WP80pCSm1PvRWFdxkpbnLdFM2+XeuZu2/ZFuPIAfD/BTHCL80/xXhsYai3XBncYHqgrVYlP0kLHXI/Jk2wak+OKyDYvjIhvUAWnkrtXOeyRiY2QjAg6/V3R2rWXCaqrlzeAwQT1gFci2zyUMcnnLb+BdtywGJbcqoP3H/Hp4PIx6+Ir2bKhzccs/0moji71WvgMxM783ij/7oUyoItQZ3rA0ghhSjABjYVSFEzfKZgrgASyorONhO9X4waajDrJ8vMQ5K5KebcbJqDX/FM/uHK/q7gUHrY3d5s+/CdPrPoiQtJGzgwgN+9tBaTt+Hm15hoPdnvLiYwF0hMrK0minFikFeQuSXGiohWgmVtvVw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(44832011)(2906002)(36756003)(8936002)(31686004)(38100700002)(38350700002)(5660300002)(31696002)(83380400001)(186003)(508600001)(107886003)(66946007)(66476007)(2616005)(66556008)(8676002)(4326008)(316002)(53546011)(6506007)(52116002)(86362001)(6666004)(6486002)(26005)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MFhBMHhLNDc3OGRVZ21uczVPL21zblBHQ1FZY1N5ZVZyci9SNE9PYTRJYmx1?=
 =?utf-8?B?RnJWbnNEd0UzTTlUQ1phdTNwRjlRSWZxVVRVSXA2REYrZzJtUVNjUFd1NFN2?=
 =?utf-8?B?b0w0TWJqUXAvd052b3FGbHR1dFJCL0hpLzdiMDZMRkUwZm1WU2QrcllqRmhx?=
 =?utf-8?B?eG53VGFON3dyT1ZoYlVGRXFsbkVtbFdFOFdUZ2JIWng4aU03NEQ1Z3p1Y3do?=
 =?utf-8?B?dEdNWWhQazFycm9UWDBROGZEZTREengyVVd2TGNhc3NabitxVkR2d205UWFL?=
 =?utf-8?B?cTZvZVYvbUNpQnlUTXJGcmdLaUt2ZFNyRmhDNEwyMkJtZE9WamJraU92enF2?=
 =?utf-8?B?YTRReFRvUTZoY0Zndnpra2R4ZXYybUI5WjY5MzJvOHIzR1hzZU5BMnVkMWRI?=
 =?utf-8?B?bVc3dGpSdFRzUnI3UDVyaHIxcDdIek0zYmczT05qRTBnYkNzRmRwNDNzREhH?=
 =?utf-8?B?dHBZeU9ZaHVlYTlZODZaNjVWenhQNkpNWGdOMkhKUzJMWjVBOUxReDFDbjBl?=
 =?utf-8?B?MWpERlJ1bGlxaXNjeW5YWDNQbDQ0MEdoNnF2dCsxdEdUZFhhaHB4dHpCUC82?=
 =?utf-8?B?ZWF3Rzh2cGxDTnkyWVl6SlBIYlFvQzNUeDk0NnpWeGEyODFib0YyeUpmc3Ez?=
 =?utf-8?B?MHlpNUtOK2NVczlZUVpzODdxNCtCbmo3M1pFbmtpSkc2YU1QcGdoM2hUVHN1?=
 =?utf-8?B?UHQzNjk4UThqRTdWbUdQQUFBQkg2UU9vTmMydWVtNTlLYjlXYnl2aVFEZ010?=
 =?utf-8?B?Slo1VUt0ZTU1T1JHM0hKZjNDaW5CdU5HMXduSEpRZlprRSs2UHgzVnc5WWRw?=
 =?utf-8?B?SzNtN25zeXYxWHpTZnhxOHJpT09RTzdYZ29IelhBblZkV2YyeHBSUFBncjVV?=
 =?utf-8?B?ejE4aXBzUVJtYkMyRkp5Umt5Uy8xQXFremZpUUxyRUxWZUFpcE03QzBrTnFF?=
 =?utf-8?B?em80aElxc2ljZXFpSWdsUDFHQW51R21vQThlcmdWZGEzRklVOUJ2YW1ram5n?=
 =?utf-8?B?RUxpcEZVN0xxNUpPTE82L0ZId2RTbWZZMmt1bDdpWDZMSTZueldWY1gvVnVn?=
 =?utf-8?B?Q2tua1N2TitNM3dZNTN6c3RYeEg5ZUxZZkw5ZnJ2akFLckNxaDdaa3pNc0NC?=
 =?utf-8?B?OUtZbkVCOStqWE8wNkY2ZWxxcU5Ec2ExQmUxZDB5NTZsdTJBZ2VSaEdsQlcy?=
 =?utf-8?B?aHRHNFVSejRzRzlCVDI5ZE5mL1p2MnFlM0xEY2QvNWhXNHdtUWtLaEFIZ1Vm?=
 =?utf-8?B?Qndlb3hZZlZiQzgwVC9XU3JoRVE4dTFuZlVuRWo2am5PZHlwajU2cDYwaGlR?=
 =?utf-8?B?Mm9UT3pFczBpUkVOaUo2UjZvNC9uY1BhQTdwZmRWcUFlSzVNa09JMGxJRnJD?=
 =?utf-8?B?VnhVSXFOM04ydFZvYkFqOWFmMEd4TkltSFYzaGh0aVh1M1JYRDF6YW1Ya2pJ?=
 =?utf-8?B?Zlc4eG55YTV4UVhUaytvdzNvWHdRQ1FWakhOUkZBa25oVUJCT1p2U2JnQytE?=
 =?utf-8?B?eklYY3FlR1ZoRFhCT3JZV0JxdjhIckNzWldCMFV2WENpSzk0QXJLQW45NGNx?=
 =?utf-8?B?aFN2YXRIc2pKMFBPdHBCY0dLMGk2c2FSWTM0dXBHdERaNjR0TlpQVzVJNnV6?=
 =?utf-8?B?K1FWNk1qRHFzODQyeXBJTnh5b2x4RW1CRHRvSnFtbEhQelZtbDN4bnpMZDJM?=
 =?utf-8?B?ZEtIZGhJZ0MyMmc1UVUzMnJ2WWU1L3pXcktXUjg5cjh0TXV0L2NMSkNHUU5H?=
 =?utf-8?B?SVlxS0tSYzM0M0xpV3Y5ZGNFNVUxc0pEQ0hRaHlIMmN4SHk3ZDdkMSttNkNP?=
 =?utf-8?B?TWR0ZHVtcG5JNUJYQ3FUM0JaV3F6ODZTZS9ITUlhMjhXd1J6VWZqR3FIWGdQ?=
 =?utf-8?B?TVJLeHhpNWNzdEhybmZTUENUekxkR0wvSk42N3c3NTFFVzFOSldVbjdGY01m?=
 =?utf-8?B?dUlkcDhid0FiR0VZUVl1RExiMmJGQUJ0OHRpU0c1V2J2NmQvVlY1SHF0bnhj?=
 =?utf-8?B?QjFtRXhWOHJtTjE3OEtKd0RxZnp5TVk0SlMxNmlJcGc1dVc4T0Y4RXZXSTFN?=
 =?utf-8?B?TnVGMGZDbFpKdzd0NElsQ0NSQkFieXQ3Ty90VVAySnhhMGYyemR2dUFNa29H?=
 =?utf-8?B?Mm41V3V6UXBtbk9STUpRa3ZCYjQwdGM3c1E5c2lzbDlGWmM5OW4yUVVLaTNp?=
 =?utf-8?B?OE5Pb2hmNGlqcDlyZWZ0QTA4NHNUeGFjc29tZVFNbWhZS2o3dy8zUThWcXA5?=
 =?utf-8?B?T2IvZnJjTVlzb3o0V2F1a2JxeUVGV1RUcnVmUlVuMngzemtKdDVLRUxzQnBU?=
 =?utf-8?B?UjcxWkptT2Jad2FsR014WGNTeUJBS3dlMUVtZjBzZlhBdldpb29QZUoyRG10?=
 =?utf-8?Q?nJImzD22T7C01ESU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a05d18d3-39c6-44b7-fa5d-08da315d06da
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2022 01:41:24.4330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 imFwI+jeUL3BWXnR3BYzKTYV44aM64AqeRPxdLMwHfJ4Jdvi/2QQjuUSbSL4Nc7gDfsIrhj3qduJbLh3N7y2vu7jAV/+we097ES/Y8neph0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1386
X-Proofpoint-GUID: ue-oxN2Ag52TPMConFs4Y6K2jj79U1N_
X-Proofpoint-ORIG-GUID: kZJKEZh6FfyyAlQ22klD7b-rVmDshFpi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-08_09,2022-05-06_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 phishscore=0 mlxscore=0 spamscore=0 impostorscore=0 clxscore=1011
 mlxlogscore=999 adultscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205090006
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 2491fRqf008293
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 May 2022 01:41:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165382


On 9/13/21 7:00 PM, Richard Purdie wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On Mon, 2021-09-13 at 11:42 +0800, Changqing Li wrote:
>> ping
>> On 8/30/21 4:11 PM, Changqing Li wrote:
>>
>>> On 8/6/21 9:21 AM, Changqing Li wrote:
>>>
>>>> From: Changqing Li<changqing.li@windriver.com>
>>>>
>>>> Steps:
>>>> 1. build out rootfs core-image-minimal-qemux86-64.tar.bz2
>>>> 2. docker import core-image-minimal-qemux86-64.tar.bz2 poky:latest
>>>> 3. docker run -it --rm poky:latest /bin/sh
>>>> 4.
>>>> /var # ls -al
>>>> drwxr-xr-x    8 root     root          4096 Mar  9  2018 .
>>>> drwxr-xr-x    1 root     root          4096 Aug  5 06:59 ..
>>>> drwxr-xr-x    2 root     root          4096 Mar  9  2018 backups
>>>> drwxr-xr-x    2 root     root          4096 Mar  9  2018 cache
>>>> drwxr-xr-x    5 root     root          4096 Mar  9  2018 lib
>>>> drwxr-xr-x    2 root     root          4096 Mar  9  2018 local
>>>> lrwxrwxrwx    1 root     root            11 Mar  9  2018 lock ->
>>>> ../run/lock
>>>> lrwxrwxrwx    1 root     root            12 Mar  9  2018 log ->
>>>> volatile/log
>>>> lrwxrwxrwx    1 root     root             6 Mar  9  2018 run -> ../r=
un
>>>> drwxr-xr-x    3 root     root          4096 Mar  9  2018 spool
>>>> lrwxrwxrwx    1 root     root            12 Mar  9  2018 tmp ->
>>>> volatile/tmp
>>>> drwxr-xr-x    2 root     root          4096 Mar  9  2018 volatile
>>>> /var # cd log
>>>> /bin/sh: cd: can't cd to log: No such file or directory
>>>> /var # cd tmp
>>>> /bin/sh: cd: can't cd to tmp: No such file or directory
>>>> /var # cd volatile/
>>>> /var/volatile # ls -al
>>>> drwxr-xr-x    2 root     root          4096 Mar  9  2018 .
> Sorry, I appreciate this change hasn't had feedback. Unfortunately I'm =
finding
> this one hard to review. I'm also worried because it changes a number o=
f key
> areas of the system init process in a way which looks very tailored to =
a
> specific use case.
>
> I suspect we do need to have some kind of better configuration of this =
area of
> the system but I'm not convinced this patchset does that, it looks more=
 likely
> to adversely affect other use cases in favour of a specialist one.
>
> I am unlikely to want to make changes in this area until the next relea=
se now,
> sorry :/.
>
> This is one of the problems with not having enough people with speciali=
st
> knowledge to help review, too much falls to me and I just don't have th=
e time to
> dive into each different thing and stand a chance of making the correct
> decisions. This is frustrating for everyone.
>
> Cheers,
>
> Richard

Hi,

Since 4.0 is Released recently,=C2=A0 maybe it is proper time to make cha=
nges=20
in this area.

Any suggestion about this issue is welcome. Thanks.


Regards

Changqing

>
>
>

