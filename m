Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6570DC4321E
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 02:46:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.1280.1650313428546003599
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 13:23:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=gGgFDrfs;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=1107a133ed=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 23IKG6VR018691
	for <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 20:23:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=sKSKBJTM+5NVIIPnyPT4MHBXSrhDPQGhd9eDpNS5Xtg=;
 b=gGgFDrfsUMzkaUCHMz3+D17DvvumBTnwHQkRb/s0zh68BG4WKifw9rhnEv6RpLsB+/5G
 4E9UE1ByYNliNIarr2ydY23b5URxlZQoZDeEb43qysalZNDX8gU5AlW3IIg6TmFc1u2a
 fpTzry1EOEEeTqNv5Rs5OgJ2ujy9QXPFqG/EFQ9g6gLFDJ6yjKzO9bG/aGyykMSDVkS3
 Pm7bi8Xfuy1erypZoBfhIc/UG2DlqEMnSKeO8zFz/Mxnd4qmjFc7QKfAwTEPeynImTwD
 KfXLFDxQDAsDBp8NrVKxs3Ux513nUhrTX7zUcDGLc7b7xYPcJNUkPuWn69wlG1iIwgXO /w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ffpqn1neb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 20:23:47 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 23IKNl9k001470
	for <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 20:23:47 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ffpqn1nea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Apr 2022 20:23:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CBcDUhgderEw7F+E0G42s7HH9H5IUVBKQdvKltFPtOGpZuLBenIRIZx17nLv4cm0lPK1WnqyvXKcFZA8dkfwQY9IZlM096/xh0amDgX5RCmfzZWhQ4Xfh3NSMIiZFp60WFrXtv+TKeuU5b5UUe+90pVxKMeJkSsjRWdkqHJ7+EnnV0hTnMGV3iPPvaP7SuSbqnDR9HAcF+7pu/dde35BNtbIoIYETxRqbjdl0nyH3V+/Qji83FRO+zNz/Uz7RqXk1MVa1qIq+Y1jLTPAcNQ9RnBkOvbW3RK3jTirQ2h81GkOLmTxk4ZhiMDEA6KWdm6eiMY7akHNWzJ9GOylhLDN9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sKSKBJTM+5NVIIPnyPT4MHBXSrhDPQGhd9eDpNS5Xtg=;
 b=HTbCt67wgm8Px7HFlxC1uR2OVx/uAz3tiCJK/k6izmxKnQHcA8SIpUfEusIfXGKRlDfu3996qpAg2yYWIobVIVxFctb2oa+Dn3fv5O0jXxke1UvPa72PCjzA+7ZcfHUN+BvqFfgUxb6DmHha1uY9ToSxcviKLImgpkw8MLAD3Vg/cngLZPm9dAFDtwXlP78s5u/P1UqaVUhQoZBkvlcHDAcrSlF080h6PcETkbAE/DBkMETITpr12Uvd5yM4ERGyBTJONfCYnOrQi70gPXosm99TYXd0MJ6YIXL1ZidmEIVXkv+edR8WEpMlxF9Mleoth4vwqZP5w/GM0zsu1oHP7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by BL0PR11MB3185.namprd11.prod.outlook.com (2603:10b6:208:63::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Mon, 18 Apr
 2022 20:23:44 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::4529:9749:17c6:d1c2]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::4529:9749:17c6:d1c2%7]) with mapi id 15.20.5164.025; Mon, 18 Apr 2022
 20:23:44 +0000
Message-ID: <74f47f87-14ca-6313-131d-7bc71daebd7b@windriver.com>
Date: Mon, 18 Apr 2022 16:23:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [AUH] rust-llvm: upgrading to 1.60.0 FAILED
Content-Language: en-CA
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
        "Gowda, Naveen" <naveen.gowda@windriver.com>
References: 
 <010101802ecde680-777fdb10-0998-402c-a718-2e3ebe7e6cc8-000000@us-west-2.amazonses.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: 
 <010101802ecde680-777fdb10-0998-402c-a718-2e3ebe7e6cc8-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0382.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::27) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8501a190-a9c5-4437-3dbf-08da217955ed
X-MS-TrafficTypeDiagnostic: BL0PR11MB3185:EE_
X-Microsoft-Antispam-PRVS: 
	<BL0PR11MB3185FCDAD328D3E1495FC7EDF8F39@BL0PR11MB3185.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bFE7Iu+0XZWDid41W2xBnTIFMhfqDu4qlMdg4lg6Hxt1TEWuT6KcviUZLcEpfm0fsqR4wzHxWaFqhl2WzGuf4KGi5qv1i6jTcCTpuoqhyivUvwhnZRxWi69BBgrb9bF1k8k9QoFC2jSXTPap+9NnOpRAWj3sJ91P7D2T5vtsArXwV84qFm//wlj4+BlpITg7s5shEsa0siGxRS8gB/qQD9KSq/XSkXDjXDi+9/eeLGa00gK761wqCZQU/0rOAxVBnTro7ogJKGq/6imsUhtT+rwFopTqbCCHy5fp1rcFVQ1mHNZomGEy2MjTbc0UdNgPu+0Uu46dTS0i9dv3Ib7WsZ7vdOsjIpzQbEO2q74IWeY/V4mRuJf76H6n44JpC5EJBWl5uLe+qkgU6+XKeDRWso6FZbQNuvBXPr55QRYqJ4lmwIgklkxwPFlap0pT3V+CQXKiZRoHt/Xh8VhEoSI3z6YdqMofhoUwySHZVopVfVmXADQfVbAyxHPnB4jC6bYzSxLzidWqNVA+v7x0bFbJzzMcwih3n2u6d5glnVEt+SGLttGzyzmqp3TpCwiOtMtJXmz6cjbBN+jX2m3i4Absj1ZgPZCBMovwv6yaVbYtnsItaqsQL94z03Nk/g6sMfCzRKapSrjFQvxgGwUROegMoGF1MwoipvrwziU0YFb9XzFeOxlKo4pJUcaOHn8C3+sqMo7DDCFuyUb16VC06uWq0bOM2t+VYFxvOCwbmnD5uaMV8tkBitMXzWmhQNHMxHUxvW4cBIU3Jy8nF2y28x/vzz97uYuRdBnqskmEmdMtdtk1CBfTUix3K2UKMylKElbrddkcZgilIfHKsy78zw4vJiR1XvymMip6hl1dnM0fhcA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(5660300002)(966005)(66946007)(8936002)(53546011)(66556008)(6506007)(508600001)(66476007)(83380400001)(6486002)(316002)(2906002)(6636002)(31696002)(31686004)(110136005)(52116002)(26005)(6512007)(36756003)(186003)(86362001)(38100700002)(2616005)(38350700002)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?K1F6eVd1Q3VTVm8zY1RlVzhpZTNxejRFbGpJMGxKMXpmNUQrL1BKcXNWZDlH?=
 =?utf-8?B?eXFMRWViTXR3ODNRWXpZTmZ6SnhwdjJ0Uk1xNkdpZk9yVUZnbFp3TGw2ZHNY?=
 =?utf-8?B?OStma2FlTURYdXhsaXdNQ3RHaXlDZE9za2J0ZktzcncyZnFoVFZROWtiSEZR?=
 =?utf-8?B?ZG1nUlA4U0FkUGhMU2tjSU44NnpKZVVTMWNMeVFOWExodFRIYm1HWEJsRUNq?=
 =?utf-8?B?WnF3bDNQcUhETWVVR0Y1d0NSOENkVnk4S1Q4NzR5RStkZTUyUFIxUFFHZjBr?=
 =?utf-8?B?R3dFTHhDS0tMK0pNcXA5bGZiN1krRE1PMUR2d01BQlJYSFpacEpmN01ZdWhv?=
 =?utf-8?B?dHA3YWIxZmpNVFkwNS93bWR2WVVicVNmQStqdVRTQkhkRVVKSUFkbHpzNWtE?=
 =?utf-8?B?ays2TW9ROE11dWRlajYzaUpTRGZaUm1OTGJlUjljNjN1VFlGSndUeldRbzVQ?=
 =?utf-8?B?M0FsUXZPTWdYMUJnQXdPTFRSbnk5MzhWZ1JTeE9QamN6WXViNGoxN25pVHRq?=
 =?utf-8?B?eS9aZWI4L3EzSGo3RGZnWVdwZ2tabXcxUGdDaTlhNEcxWS9iNG5pL3AvK1RI?=
 =?utf-8?B?VzR1QjRaNEhzWFNtZFBhbWhrQVUvMGg5TUIyc1ZPWEVOTExnSmxIdjRvTEtF?=
 =?utf-8?B?aHFTUUlRZmJrY3V4eHFLSC9SVFByNFY4aHkxWXh1NVFMdmc5cUw1b0t2N01v?=
 =?utf-8?B?ZXZoOTVQS3p0SnZDMUxYMjdUR1BlUzZrK3l3c08vK29VQkVRSVByRVJiWThG?=
 =?utf-8?B?YWV3Rzk0T1pmVnp3akFueU5ZcFY2cndIZkhCRG1nS2hZcGxmNmdmSGpKNnoz?=
 =?utf-8?B?OWgyeFZ4SXRyc2I0aFdGL3BYekw2RWNQY3RBSUxTRlRwak93Q3NBNWo0UFN0?=
 =?utf-8?B?QUlYakJIdGtaem9pVjIrVFpzYlViWWo4clVjNHhOcG5VeVhHemIvM2NKVE1U?=
 =?utf-8?B?MitmNFptL3dZQkNzK2dWSnFFcWE2MnNtMVoxdGYvZkxrL3Qyd2pzQjQ2TUxY?=
 =?utf-8?B?azBhamVib09ZWHp3bGEvM1k5anlmZ0NJNHNaMUFYbjNteHpKc2c4WnBmMVRQ?=
 =?utf-8?B?SUg2ZTJuNlJGRTlvRTBGeHFxUDBKYm1QTFpxMDV2dFdmbW1HODByby80bG1W?=
 =?utf-8?B?emVGZm8wOUZwMU1ybkxRUnBtRU9uMlcvT3BuQmROZTZHRmNWa2ZmNDYyS2pw?=
 =?utf-8?B?Mi9YRlJ6YXRNbnp2ekdQM2REM1ZYeCsrQ1p0WFVPdVN6OG8wbTNyS054di9o?=
 =?utf-8?B?NTE3SG5acVhlVTcwYk4rcmN6MXlMV0R0T0tEcEd6K3hIVUQvVVF0QU1EdFFJ?=
 =?utf-8?B?SmtzVkpadHN4VkhWRXJpczkzUDJxTXRVQ3orWFhuTUNKRjZRVnprbm0wUVF3?=
 =?utf-8?B?VTRVa1JWa2FMdmxLUmo3T0Y3UWV5N2d3dmRxTWFUbVZQV1dWK2swWEtOQW1k?=
 =?utf-8?B?anp2SXd0UStwRTlNeVMxRStNd2FRdVM5TUY4T1cwWDhyODdLMFVvZDBScWNU?=
 =?utf-8?B?NzlPNWhlR3pWSEhDTU9kVy9mNVR4NmZxNzRLVDVMek5hNlpoUmNMSTBWNXJZ?=
 =?utf-8?B?dVZZanY4Ynl4cVhrNmZkdklFUFkrOFJzRWhHMlNMazlIUlpCcWEraFptZVUx?=
 =?utf-8?B?d2Y4VVA0STc5SmhNVmtTNW9EVkdRc1pTemRPSUlnU01lT1dubE1FOGpJbDBu?=
 =?utf-8?B?aVNCOW5sSHgvUnByeTJDbm1heHYzSytWZ0pYdEZrVzZiSW5kcW41SUZDU0pI?=
 =?utf-8?B?ZEtRYW83MnBlQVV6QWZscG14bHJYS2cvdzFTalRUSXRxR2xrbWZsejIxN2hS?=
 =?utf-8?B?Ymw2cFpqY3NsTVIxeExleWRIMTgyVmcyUFpoY0tsOFo1VHpHNzV2OUE4cVBS?=
 =?utf-8?B?V1B3Wi91ck9CZGQ0NHg1azFuUlNJeHRtc2FsWWxVYW9WVG42LzR1ZnVCa2li?=
 =?utf-8?B?K0dJQXlnd1Uwa3FqY284a0x5RlBVM3lJQ1kvNTU5T0gzaHR1d3FaUnBKeTRy?=
 =?utf-8?B?Q3FTbjF4UXJveHhhOFlJaGV0cy9tUTcxMER4SkEvRXRTMG1mWmxoM2JjQ0tF?=
 =?utf-8?B?eER6VE1Jdkk2dXV6d2RQZVNCcTU3a0YyNytselhicHFJN2NRcmo2TFoyWkx4?=
 =?utf-8?B?TlVscTFCZktNcHh3cVBycHhDQ043KzF0c1dOYU11Y3NSdnNmTlF6bHJCODlM?=
 =?utf-8?B?RlFFbVYxNGVsZkFueEgwbHZpWGRsS2FicGJ2emxzTU5mOWNGZk9HZG5RWW1t?=
 =?utf-8?B?UTlmNHJPUWVqbGJ1MTUzVlNxUThHQnFrM3RnSk1TbXJLTjBlTzhqVFhrY1Iv?=
 =?utf-8?B?M3FwdERFd2xock9tV2J6aVBTTHhZelhKQTE0Y1M3MEpqdWc5WlRjODM0QWw5?=
 =?utf-8?Q?wZZOCL9qoJ1Xp2ug=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8501a190-a9c5-4437-3dbf-08da217955ed
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2022 20:23:44.4748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 q/LGUa8cx/8fXTLDCsBBxPrz76yehcUZ6IbbfKMSjSG18MCsj2BQzfrE9Gqq1DZbsNGVvgCHZ2/oE2GKXuPZSeckrQnjGnUtF5oK5E1Na7Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3185
X-Proofpoint-GUID: cXDfaLfUG4qAwhfl15SwBUspvRV_aGlF
X-Proofpoint-ORIG-GUID: SDsQGuHRYiXMFjx8xp6vCY1JAsAQbeSb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-18_02,2022-04-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 clxscore=1011 suspectscore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204180118
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Apr 2022 02:46:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164608

On 2022-04-15 15:58, auh@yoctoproject.org wrote:
> Hello,
>
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe *rust-llvm* to *1.60.0* has Failed (devtool error).


Alex,

Do you have this Rust/Cargo/... update in a branch somewhere or
should Naveen work on the 1.60 update?

Naveen will also update the rust test patches that we've been hoping
to get merged for some time.

../Randy


>
> Detailed error information:
>
> The following devtool command failed:  finish -f rust-llvm /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust
> NOTE: Starting bitbake server...
> Loading cache...done.
> Loaded 1640 entries from dependency cache.
> Parsing recipes...done.
> Parsing of 883 .bb files complete (882 cached, 1 parsed). 1642 targets, 34 skipped, 0 masked, 0 errors.
>
> ERROR: Traceback (most recent call last):
>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/cookerdata.py", line 162, in wrapped
>      return func(fn, *args)
>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/cookerdata.py", line 187, in parse_config_file
>      return bb.parse.handle(fn, data, include)
>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/parse/__init__.py", line 107, in handle
>      return h['handle'](fn, data, include)
>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/parse/parse_py/ConfHandler.py", line 118, in handle
>      abs_fn = resolve_file(fn, data)
>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/parse/__init__.py", line 133, in resolve_file
>      raise IOError(errno.ENOENT, "file %s not found" % fn)
> FileNotFoundError: [Errno 2] file /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/conf/layer.conf not found
>
> ERROR: Unable to parse /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/conf/layer.conf: [Errno 2] file /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/conf/layer.conf not found
> Traceback (most recent call last):
>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/cookerdata.py", line 162, in wrapped
>      return func(fn, *args)
>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/cookerdata.py", line 187, in parse_config_file
>      return bb.parse.handle(fn, data, include)
>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/parse/__init__.py", line 107, in handle
>      return h['handle'](fn, data, include)
>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/parse/parse_py/ConfHandler.py", line 118, in handle
>      abs_fn = resolve_file(fn, data)
>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/parse/__init__.py", line 133, in resolve_file
>      raise IOError(errno.ENOENT, "file %s not found" % fn)
> FileNotFoundError: [Errno 2] file /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/conf/layer.conf not found
>
> During handling of the above exception, another exception occurred:
>
> Traceback (most recent call last):
>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/devtool", line 334, in <module>
>      ret = main()
>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/devtool", line 321, in main
>      ret = args.func(args, config, basepath, workspace)
>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/devtool/standard.py", line 2108, in finish
>      updated, appendfile, removed = _update_recipe(args.recipename, workspace, rd, args.mode, appendlayerdir, wildcard_version=True, no_remove=False, no_report_remove=removing_original, initial_rev=args.initial_rev, dry_run_outdir=dry_run_outdir, no_overrides=args.no_overrides, force_patch_refresh=args.force_patch_refresh)
>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/devtool/standard.py", line 1814, in _update_recipe
>      updated, appendf, removed = _update_recipe_patch(recipename, workspace, srctree, crd, appendlayerdir, wildcard_version, no_remove, no_report_remove, initial_rev, dry_run_outdir, force_patch_refresh)
>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/devtool/standard.py", line 1671, in _update_recipe_patch
>      redirect_output=dry_run_outdir)
>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/meta/lib/oe/recipeutils.py", line 705, in bbappend_recipe
>      appendpath, pathok = get_bbappend_path(rd, destlayerdir, wildcardver)
>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/meta/lib/oe/recipeutils.py", line 632, in get_bbappend_path
>      confdata = bb.cookerdata.parse_config_file(destlayerconf, confdata)
>    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/cookerdata.py", line 167, in wrapped
>      raise bb.BBHandledException()
> bb.BBHandledException
>
>
> Please review the attached files for further information and build/update failures.
> Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler
>
> Regards,
> The Upgrade Helper


-- 
# Randy MacLeod
# Wind River Linux


