Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB3C7C433F5
	for <webhook@archiver.kernel.org>; Wed,  5 Jan 2022 06:03:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.3423.1641362590445249783
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jan 2022 22:03:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=U7umFes4;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=80041a28b6=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 2055st9s022239
	for <openembedded-core@lists.openembedded.org>; Wed, 5 Jan 2022 06:03:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=a8IcqVqM76mzo465WvgC0ohfXQin2vGZvdzoJJSoH5Y=;
 b=U7umFes4iSGxNY9CInZrOZFztO2c1Tsln3bknDaKChQYBO+FdTR6Z7nXBzuoQJYFvp9A
 npFFuFeV6k3HxACzXGxOj+Rudq3U0TJdkEMwmAD+9Lv4c7Hr2c3BCIXnfXsVgBYbX2aI
 1W9pqC3MmeqGjgUKYUUP7L3x44s0qWXcmi8PT1RO6v3HVax2+D6KLvLDQs2uSBVREZnG
 KFJOS7PdCZ4tR9ZHUlamkMOld+tZw81P1yt7QdQlpqzlL+edJDm1sAiTbXWrfMKWVBw9
 IFdziyGsG7rKcf0RnhfAtyJTNlq/BJe5pCYJV9S76+ziAjWuPgE82MJyFhs2EwNSrHn/ oQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dc21yh5vt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jan 2022 06:03:09 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 205638xI007421
	for <openembedded-core@lists.openembedded.org>; Wed, 5 Jan 2022 06:03:09 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dc21yh5vr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jan 2022 06:03:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=guKbF+pftENkzXREYsGnJQmAfrIAB8SbY3OTrKnGK7LPUlnBeq2zdEzSHJZjekmE419z7D5cyvrgVDljx+MPtkylaKS64BAnh0cvIsGL3ETjKaKz9dTaRR3xKblJU+/BeQZGVF7KIag4Imu9jROvqoRyIEylhK44EzYl0r/rduaXKb9zr/za0VCUFi6e7PSVPgsg6BStmIP6gp+q1WGtowsFTxcYA21HHH6MVVvjTW26PBJE9ojtChffqpKkr2Al3quI+mFUfgmSi8joi9/B9RmH09VLluT30q5u7fhiSBVIsztmKdrxbkSxVadJXP7U9aRknzw14ja3LwDF70G5Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a8IcqVqM76mzo465WvgC0ohfXQin2vGZvdzoJJSoH5Y=;
 b=A8ZXWt2r9ihpPsJEXKXq83MUWvyPtanAISiNL9gFFCeEhz0jDq/ZFoA5kIVeU4ScVxiZZvWu01k/YR2QjuTbBJ/871qmzzIw9S8TMGYH8KyYztmqaM0GjGQ1K78PiHnL/TVJSj9Euc1wiUx09ndcdOgOnzXza81cJZlhA/jivMovKnnOmDrLy5AOF8ymCOj6GnDqqre6OTYm9D+h2YnIdoXRFYlqYbHE7ntfaXOnFWofCfO4r0rSQreYr37HwFXwvlaukRoOG6yzHumBtIb0S8uyoNHIpoBAB/62Gus7NR6uWQsLiRckLhWBkSuOWhIYvszdkECLAVT6xAWlbamJqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by PH0PR11MB5609.namprd11.prod.outlook.com (2603:10b6:510:e0::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14; Wed, 5 Jan
 2022 06:03:07 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::b52c:74ae:e50a:5206]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::b52c:74ae:e50a:5206%8]) with mapi id 15.20.4844.016; Wed, 5 Jan 2022
 06:03:07 +0000
Subject: Re: [OE-core][PATCH] core-image-tiny-initramfs: delete populate_sdk
 task
To: Ross Burton <ross@burtonini.com>
Cc: openembedded-core@lists.openembedded.org
References: <20211216050914.90422-1-Qi.Chen@windriver.com>
 <CAAnfSTus81TLunS18ghDnW_DsX+B01ziUk4m7yBMAKnbkso2wA@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <43a0cd4a-33f6-d6c5-811f-df06573fc077@windriver.com>
Date: Wed, 5 Jan 2022 14:02:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: 
 <CAAnfSTus81TLunS18ghDnW_DsX+B01ziUk4m7yBMAKnbkso2wA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: HKAPR04CA0011.apcprd04.prod.outlook.com
 (2603:1096:203:d0::21) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09a7cc26-fe1c-42f7-a557-08d9d0110b63
X-MS-TrafficTypeDiagnostic: PH0PR11MB5609:EE_
X-Microsoft-Antispam-PRVS: 
	<PH0PR11MB560985F52022DA365E5149C4ED4B9@PH0PR11MB5609.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	S7mLGr65WjQniFeH2sYkVRJ15aQ71bSKw0vWZO4h8ykaI0CH7L4CJtKGK2EFkb0honSS70sAUKdr0N9EeeMhqOfA70I+XdKqx803bZTPDBnzkN+xR0uMVBpiciR4oMWMo6YnB0Z4jQyWh5pjy9wT0V9UuVTpRK5DY3aV0AI+vo51Wa2V5rGWp1eP4s7sHNSeOS7xdx+UQUrM/yVoIdsGgAdg8YScb5fzBKkfklCu+ohy0KVg0RtbgCVYWk+IuFKqMVu6vgeKcvbCw52n4bm621rS/jybUngcJ3GPWYVkYVQYiLLGIgSAs+/pCbCFDeCkE4e8RW/4e5pgs/qHrf06/rmiivHTY0k5YfIPpzFQBszyEe4YkQtffTc18p4MZdqy/58JopAOUMFA5lTpa9GWvoOajfa/iPSfnNsPuP6jzBnZY4FuahwE6x0VVunaFFv4iR0O/IjW/hqErIdPBKOqje6i/2pKLuYXpppEB9y5mTSzdxKW5QoFFSXT4Cz+MRBfsudnCfEYjDGQCL4ru9fDrqRYHIQhjeDy5mpZ7z8Hev8l5kuxQj9UXWuN9ucayRipzDJI6CHRHb45LC0dXK22Uze7pOszUxpoT2tXAG6DQzwCmpkCAD84qwCAmkeXsdB9oeIkTDg3MVmv0RJ8CkiAkazvm6gf7b2RKd8QpjZ3yCVWly0jLaoqFup8ncnsSdoTZL8UeBf058NWFRe+tr1/FEFb8X8QUrUkN7O4nuDUDVf3FvEG89GRrPYAyPA6wbhEtWWJq9qaW7vVVgzxGSwOGQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(86362001)(31686004)(8676002)(186003)(5660300002)(6916009)(6506007)(53546011)(83380400001)(2616005)(508600001)(38350700002)(2906002)(6666004)(38100700002)(36756003)(26005)(4326008)(31696002)(6486002)(8936002)(66556008)(52116002)(66476007)(6512007)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NFQzNGtvdW50T1hnbjh3RWpDTFlCVk5VbTlHTU1ja1dvaGFsR3RFQU81ZGk1?=
 =?utf-8?B?bExtSTFzNjRvZHg3RERLSjBpZkhkQzBsaEpUK09hSkxrT1hXVDFJNHN1RGVt?=
 =?utf-8?B?YVUrb3lXOGdkMnRTY1puVlVsQkw3ZTVMVnh6WEZ5cmx2b2k4UUswV1h2L3ps?=
 =?utf-8?B?WGlIZnFmdU9hc3BwbGRQYTViSnBvcEgweVI4R1ZKeXVJTUQwWnNYL0JnRnBW?=
 =?utf-8?B?Ykh0YWdxMDFUSnNGRXJPSXowcGhobjRORHhEeVNmQitGL0tuRmU3K0RPYzRk?=
 =?utf-8?B?NDZxbkE2STRFaWtJSWc4bGdTaHJLeE5CRERYdjc0L2dNaW8rTWhWVG14VmZm?=
 =?utf-8?B?b3RZdWh0MWVuVkFicEd5Y0pTSkZ2QUY4N2Q5aldHR2MwQ2NUQWQ0MmRlZkRW?=
 =?utf-8?B?SDYvcXB6bUlMak1uUTVKZk01di9sUXRXYlljcFF0NnRIcmJIcG0xNDlRT3lM?=
 =?utf-8?B?ZWZROWJzUzUvUm1jbVhKU1NDbkNqcDhZcVZKQnYyRG9FT2NqODhVZEJvbFM3?=
 =?utf-8?B?VWRYbm9oZ0YrNFdqZ2Uya0VpazgrRDMxZkJDWndOVEc4MWZSY0pRTUZ5WWhx?=
 =?utf-8?B?ekRhM1BLUUR3bHY2c29DUnpDY0xFVGgxN0NJSGtrOExJSUF1MjdJTFJXRDd2?=
 =?utf-8?B?eG02Z3Rwek1ha2x5WlJDM0tnK2dpQzg3emZNd0IxUUYwZlI1VHdoQ2Y0bGFs?=
 =?utf-8?B?dzRxWW1tb2FmRUs1bVM2QW5HWUlBZW5ONWFEZjNNc29jd1ZRNXFSL2FKNWRP?=
 =?utf-8?B?QkJ0VjdrdTkyTVFaL21LRnJlcitqdCtoZjE2QVZlM0hNd1YyN09ISnQzWjZl?=
 =?utf-8?B?S3dUTGQyMXgrRnp6NnBIZ280MEZGUmt4UlQvRVFpZVE1bUhIa0RYc1ZnL05m?=
 =?utf-8?B?OGkraVZxZ2ZwOFV4bFRBNDlPckpFNUxmZFZwMm9kYy9iRGZkMHR1UnhZb1JF?=
 =?utf-8?B?MzRpMmZzYTJiYnJoMmk3VW04L0FXY3I2Y08wTE1BTmNCbzR6NERuNXFQVmIy?=
 =?utf-8?B?aGJDQzQrTUR5VjNsWlpscy9uQ0NUa0lHc2JJaDBoY01jYjBYbTJxd0dUSER1?=
 =?utf-8?B?R1Jlai9iTWRJbVlLNWQ1VlhWYjhJM09QNC95ZXlkQWZUVnFJcWk1TDZVUjJa?=
 =?utf-8?B?ZDRmRFlmZTY3RTBaWUorc0lPRE5zY2tDQ2RsUlpLK0hQYi94bWNDOUFxOWJt?=
 =?utf-8?B?aHFSTTFmY245WXZRTXNmRUFxbTBjc0FERC8ycjRWdnlPMkZLa2tlQTR3Q0Vx?=
 =?utf-8?B?T0p5aVVpWUorTzVlOTZvNktkMG9EL0xhVzR6T252YWEyQmNtRjVubGdBTmVk?=
 =?utf-8?B?NXEzR2JZVEY0M3FEeXUwWEZrV2Z6cHEwejZhOFR5NTJ0SnFOMGJkYktUSXpo?=
 =?utf-8?B?bnA3a3ZicThDSjJuOGJERy9aSzRVUXJkb1NlVUU4aGVOejhkQ2xMQ2t3QWJy?=
 =?utf-8?B?MEt1YldBSDVxNnA0SytzZXJ1VTJPdndRUHhsWEpZN2ZHcEI2VjNJbjE4VmJZ?=
 =?utf-8?B?MFlXWWtZdnRVVXY3VjlGY3VmNTJ2KzhwM2FuS2MxT2lYcXlaeEhKcHVIdUZo?=
 =?utf-8?B?Mml1b0E5bkgxYU1jclQ5NGFac3RCZjY3d3E5U0l5ZHhEUHZMUXdFY25GaVFW?=
 =?utf-8?B?NXRjM0EvY3Vsa3U3cWJnV25TL0VnM1ZndmpYL2JpNmdjVEVESTNOdGhBV3k0?=
 =?utf-8?B?R0JWZ1ZwSVB0TmJUYU9Bb0l1VHg5bkNDR05pekZMRjRDcFJJdDJNL0hkaWYv?=
 =?utf-8?B?SFpxeCtJOE80K0wyRHlzaEFLaTRBbm03aFhUZkZ2SVVFUHFLK0UvV01EMlUw?=
 =?utf-8?B?Rk84a1FsbTBnYm9BVXJHaUplMnp1WGN6ejBEclQ2eXJONEwyZG5hZG15dURr?=
 =?utf-8?B?WDhHTlRzcFVXYkt2UFFuNit5OWp2NWdYc2xvTWhqNjZXRFNXMGFGdVhYdjNT?=
 =?utf-8?B?ekcxTFhudmZJOVUwVExQK2h3UGgzbVU2WVRkRFFTYVk5b1ZkNW9KTHVERjJC?=
 =?utf-8?B?OWREeVY5U0tGZitzSVR2dm1WUVA1RXlrM0xlME0rMVVKZFVHWEdQdlVkVnd4?=
 =?utf-8?B?dVM1dkFYaHdkL0pxeE1KVUsrVnBEU3k5cHpTTVhreTExUHBPcnVoTUtBeFZp?=
 =?utf-8?B?WnhuWmgzVERva1NpWFRReGIzTlo3N2tMa3M0M1Q4VmtrY1dLS2FzenpNQmpO?=
 =?utf-8?Q?G+Ci5oqoNaFapxtDju/wdU4=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 09a7cc26-fe1c-42f7-a557-08d9d0110b63
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 06:03:07.5924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 S0tyaHwWAS7KgF2h5Rh1iTd3nDWSJY/umr9WP+DKIGg584n40sMiUqfIOquKWqGxckEtbJDI8ed/y+2d03Xb1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5609
X-Proofpoint-GUID: nXA81G_jtxFyNGzTYV7HUGHh_oFsJARQ
X-Proofpoint-ORIG-GUID: 8TQsZ4XmD5Wk_5ulfsOiuiTrURcTP22w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-05_01,2022-01-04_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 clxscore=1015 malwarescore=0 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 mlxscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2201050041
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jan 2022 06:03:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160179

On 12/29/21 5:36 AM, Ross Burton wrote:
> On Thu, 16 Dec 2021 at 05:09, Chen Qi <Qi.Chen@windriver.com> wrote:
>> Currently, if we do `bitbake core-image-tiny-initramfs' and then
>> install the generated SDK, the following error appears.
>>
>>    tar: ./sysroots/core2-64-poky-linux/dev/console: Cannot mknod: Operation not permitted
>>
>> The populate_sdk task does not make much sense for this recipe and
>> considering the fact the its SDK cannot be installed, we'd better just
>> delete the task.
> Feels to me that this is working around a problem instead of fixing the problem.
>
> This happens for -tiny-initramfs because the root fs contains a
> populated /dev tree, with device nodes in.  There is no hard
> association between "has a static /dev" and "SDKs are meaningless", so
> a better fix would be to remove /dev from the SDK entirely, instead of
> removing SDKs from one image, when this is a general problem.
>
> Ross

Hi Ross,

I've sent out a new patch to remove '/dev' from SDK.

Regards,

Qi


