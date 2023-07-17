Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38C9FC001B0
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 07:10:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.2936.1689577853909871017
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 00:10:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=T/nFtPD1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6562525d2f=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36H6qrVv004973
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 00:10:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=IHSwFHjXKyqnRztZrRTFs3tMOc8fMSLYP6qTbvVXodM=; b=
	T/nFtPD1tC9BJzXeGYH1BapRu+Ev/mV+0jbW++AS0aR0jThaU05/msmWXcQQ1UFH
	rvbJt/IXq8T+sCzq+xgpoOIpVIKGj4EmqL5dXVvAwMtf8hRiubyi6B341t1yr6DI
	6/JPkNhEknL1uxe+Gg0E1K11rz7h8k34GgNes9Sa38mzjbV4mIa41nL5eOKmfWC0
	LHyMZoE0a1QoYksnre4zEMlXqZ5ZPCIdO4JnBQUBnjmoJ1hsMqW2SRwg17VaCEEp
	+wTtgXcHcx8JQ6/alZZ21WocIHy0PVUA4wEXu18JtGN3jAq2qOvJ5ta/TgtQ9uly
	0iQuFxxFGaPDhapJae2ZrA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rupqy9axy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 00:10:53 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 36H7Aqex007615;
	Mon, 17 Jul 2023 00:10:52 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rupqy9axw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jul 2023 00:10:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ajJCmO6jBHWbxztUZH26z/iakRHeO3N3J5WmtIIiI26fu623Vs5zJGZV7QWC7dVJjmHrjSCwbpFU5YAMJ208r8jNOhv3z6y10oyvTxs7Xp0ErPbAOQ9rOS/GI9F6OAcPjJ/UOt3eV1H/uciHmoTbkoSuI44sCJePnoRQhQNieW27HZATlbZngXEsck9qTzi8U2DngTMHpuxgXphlkZ9aA0GXSyG6TpifxhdB7PM0LUQzSU7CE0F3Ij1sqCNsEJ7dQbTqPuZF1gaXYId+A+vyorGmoJIONpGnVGJdKYcYBrw1LWzEQDUCY6S9TJGS2yNC6Rbwbt3FCd/Y3tLjhTwcpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IHSwFHjXKyqnRztZrRTFs3tMOc8fMSLYP6qTbvVXodM=;
 b=jXgfkJHTIInlk1sC+VAqX1ZdywKK4uEdXi8OCU0AUyAEyrVwpNVu6u8ONen9pa1BxH0AJan1KHvvRSoqEBmLFryfn595SAHQCef6tEvBNhcyqWimdESl9vGWUPwboYA7MHKxCdRH1O8dak1aRyxsAEtS/91R0WSw5jM4OpMEGFES7JgmSbu6jRL47xTB4gf3JXNjUqOK44Hro8/VZjQmicKQEIYUDlOprB+IF/drDWYAjO4E4mkvxUwBblNiAt0HB8bjUEHbBYCbq5iORk8M79ybvZs5WSxA1HjlCobgPh+rN2/k9HFwyBNLUvhRzcigJC2MQ4cgQKsgxyd+xR2TEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by BL1PR11MB5301.namprd11.prod.outlook.com (2603:10b6:208:309::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Mon, 17 Jul
 2023 07:10:43 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::dbd1:fcc4:351a:8a98]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::dbd1:fcc4:351a:8a98%6]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 07:10:42 +0000
Message-ID: <919cae59-a542-5a51-e70e-164b5306eb41@windriver.com>
Date: Mon, 17 Jul 2023 15:10:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH v3] qemu: Add qemu-common package
Content-Language: en-US
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org, Ross.Burton@arm.com
References: <E57733DA-39D3-494F-A91D-9AA8306DBDAB@arm.com>
 <20230710103218.3834001-1-mingli.yu@eng.windriver.com>
 <2023071611474165f97b23@mail.local>
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <2023071611474165f97b23@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYBP286CA0027.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::15) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|BL1PR11MB5301:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c3732b9-4d98-4ab8-cb16-08db8694eed7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RCErabYKF5LkjBo1/rtaHDg3gWcaF1IdTCkFVaXfGnbIUVIODvMLJNIEezIWhl5/dFGECzCMgE2mTlYEI6uQTGw26QUaeM+LocoT5SZzCfK8z/kmuFSSunJiXDpqCoYk1dy1zEOkKu8P1Kev8lAwlYlNsAUOgGy5k1I2c7hZnA4xkDP++EEMHPvl8Cj9/Ukob1EKkRbL12mjGuc4OwDgne8csRkv5gP0dYYWy8+MFHZKKbsY2NJDZRBQth6v9I7s5hmRtoozMPsEORlmu8K5T3NgL+bqvCA6YnJNBErTrMfVLeQyonTjS9KI8JYZTmL3ATkh3v8k841g3oegidO/bcbAZ5Q1Nkn6Ikol+nE8yql4OXZNwFh+RiMEIPVVoFUOaJWW0OBusy0kMrSYCG5+/RmF6cWi2PGA1VJ3S1BRSlmmN7pMlypSGd5Z2ph54Nb0Jr2lsz0xGKiY16ZnzlV7r4Dkies2W5O2gWORpNpEyelPxSn8rC2UYqqC7rBHR8EjBk/MifX8MCjZ2vETXHeZlHbtYrxpr/FTxxa5fPULG6mDE3Hm9xLVf3oRN6dRLFAjwjoNXXPl9kXUx9+i7/NF+miz9ZnVPka2a7rRJZqV5HaOlOWZeMpr3Fc/YG0gnUDbqtg9tLKO+JE0t+eLrZkfCQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(136003)(39850400004)(396003)(346002)(451199021)(31686004)(86362001)(31696002)(2906002)(36756003)(66899021)(966005)(6512007)(186003)(83380400001)(53546011)(6506007)(26005)(38100700002)(6486002)(6666004)(110136005)(316002)(66946007)(66556008)(66476007)(2616005)(4326008)(478600001)(41300700001)(5660300002)(8936002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d2ZWZmU2VFR0eXh0T2NzQmNtYVZaejFsRXVrTUZmYlZnR2tJL0NiSjUvcGZP?=
 =?utf-8?B?SlYwdytnaWl3c01JS1RLUUc5T1IzaGxwNWpEd2hjU2k1WEJja2Q0YTJCdm9z?=
 =?utf-8?B?blBVQnpBcjZ6azNxYVR4d2JTZEpQOUovQ2E0d0pnWkx4U3F3MU1NMHBpeUhR?=
 =?utf-8?B?OU5PRVZEZzVCZUtyUGRiOEp2dFl6bkNmSTBJQzB3N0gvTUE1MEgxZzU5Ym0r?=
 =?utf-8?B?dVd2WmNyVEVBazZaWEsrSWNlWXNlL2pacG9IUVhwRVZiOTc2VDkzM0NmUFhx?=
 =?utf-8?B?WHMvS2RZOUw0cjZSZHhXK3NEVXBJMU9QOE5kaEx5enJqR3d4Rm1MTldTVUlQ?=
 =?utf-8?B?NUtlWUE0djFBZ2tBb0xzZVo1Ly8wTjhjVGN5MjVuZUczaTVaZEl2eWZRaGFn?=
 =?utf-8?B?cjYrNkg2L25hb0pJMFRPZHFwTmRMNVAycEE4c2VjRzgzWjNFU1NGM3BxWDNS?=
 =?utf-8?B?elEvakhuamFXYXhDdnRRRitmeTVFOEJYeDJaMU5ITEdZUWhaOURWbDdselho?=
 =?utf-8?B?aVdjd0E3YmUyQmJQUjRnSnFrQ09iZTM0cWRCVEhtRUNXc0pablJxRXdsZ0N5?=
 =?utf-8?B?MzNIK29hZE5GQVA5Zm9aWk83ZkZJQVU4aExOVFRVZWJRMmdlYlorTUpDWHFm?=
 =?utf-8?B?WVRGQ2UzUkxRMmRYMGJsVS9xNlloZ1VhdUJrVU1TL0hXaS9lZ2gzUUN3UmhD?=
 =?utf-8?B?bnBvblpJRkJEZ3ArQ1grT0ZZelkxampWZ3padWsybHphOWo4UlFpTlhMenlV?=
 =?utf-8?B?MFdTTkdGM2NVb0JkclFPTlM1RTgxVWFUWTdEcndoR3lHdm5UTnpNYWZseWdC?=
 =?utf-8?B?Y3pFKy8ya0g0TjgyM0R2bWVqK25zQXErdnozN1hTWlc4aVpqd2tNU0M2U1kv?=
 =?utf-8?B?blVKUEZjWFVpU0dVWjJWM1R0VXJuOWRKSmpCakVkOWZZRElEQTJDM1RZd1d2?=
 =?utf-8?B?My82WTFGZll6cDVLVC9FdmxPM28zT1dKSSt0Y3hRSjExeFR4SHZQRU1uWUwy?=
 =?utf-8?B?L05rNG0rVys1VldsN3U3YURYY1pyMjc4a2J4cWd6cmladjBwRVlkSEJzV0Zp?=
 =?utf-8?B?QlBvN09uRDVOVXpTY21jWm4rWkhRTzM0WjhuWVloWU5CNUdMeGplZlpKaFpL?=
 =?utf-8?B?WE9SRmRrVmo5S3pGWWpxT0VDRTNYT1BUczlpOUpDTlliT04wOFR6QXZrbTlx?=
 =?utf-8?B?bS83bENsWlFoRFpFU1ZJQVpIRjEwbmlmWHdsT2cwck55MDlSckw2S1dNNUNT?=
 =?utf-8?B?ZzJwakJ6Sm9jSFFGZ1FaMUV1T2huMXNDdEkwVyt0TTliSU1lRCtEQjZZLzIz?=
 =?utf-8?B?TUZ3eFNsQ05HZUNwclZUenF4V2hieWwwRWpFOWJXQjU2a25HZEtCeWo1TUMw?=
 =?utf-8?B?a0ExME1wSk9sdXNpUEphekczVFl5UEFCZnY4SGdXc01iUkV6V05oOFZ5amFV?=
 =?utf-8?B?aFI5YTJQU0MyTWNMUS9xRkJZb3JzNDNVNGhoQzJQTzc3c2FFWGtNaTBHRnZu?=
 =?utf-8?B?N1VzMUNQNzdLWERrVDk2UTZwbm0yQWptUE14dVY4K3k3cFgzSDlnR2dTZGxP?=
 =?utf-8?B?MlV3clRNTURVbHJkZ3FBaUNHb09GK1NXa0pLOEdkVk5QNDkxTHlSNFJGVzYw?=
 =?utf-8?B?VmlRRXZyaUhhZ3QxWUkxZTNOcmdWTitoaWl2VTM4THRyQUl3OEY1M0xVNTRZ?=
 =?utf-8?B?ckx3b1AyaERqVGZ1TThlckYwNXpMS2NMMnNtZzFrWkN6ZWF1SjVTbGYvRzZY?=
 =?utf-8?B?alNnenNMcjhQcmQ4Ym4wZGtHeERsbjI4S2ZURlFEYnU3dzBmS0FQL1NwRTZz?=
 =?utf-8?B?S0YwaTRNbHpkR085YmNwV2JuMW8wSWZ2VWt2VzJiMkRGZVN0cHU3Tkl6SlQz?=
 =?utf-8?B?SThIS2VMdU1GZk5yWTkyclc5SmtldW85b3JtVWlZZlNQVVJwQlZMQ3dMYi9p?=
 =?utf-8?B?V3RDVjFsUk5kK0d4QjhxdXplME5RSVJ3SnNmQjR3SjhsV0F2b1JmVEh3VW1u?=
 =?utf-8?B?R3BlM2JIK0JEVGdwL0FDRmE4TEo0SVJSdlZKaWV5RityV1VmZXpCN3c1WWRE?=
 =?utf-8?B?clNwYkFyakNFWVkwbmtrT2k1YWVqK0lYcFJnZytFL1lhZ28ybm5YMHoyOTRn?=
 =?utf-8?Q?qCE38TCHzKWC73erjuqDgnmeu?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c3732b9-4d98-4ab8-cb16-08db8694eed7
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 07:10:42.6233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Po7YW8YBBQ2ccLYl7G3ksdQk1dEfiaE1Fe4kRejqJn/EsnPc74zQQITsaS1GjdrAZwTimPNk2utpXaYEmbZkmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5301
X-Proofpoint-GUID: nXuid-2TJYPAIi9ITAl6_2BaawmJp6SU
X-Proofpoint-ORIG-GUID: BNVx1dam19V82v3l1fUGLUTrban8lZ86
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-17_05,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 clxscore=1015 mlxscore=0 impostorscore=0 bulkscore=0 mlxlogscore=576
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2307170064
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 07:10:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184431

Hi Alex,

On 7/16/23 19:47, Alexandre Belloni wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> Hello,
> 
> This causes the following meta-mingw error on the AB:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/7501/steps/12/logs/stdio

I didn't find the core-image-mingw-sdktest recipe which I noticed in the 
above log, so I cannot reproduce the issue as you mentioned.

Thanks,

> 
> This is due to the added native-sdk dependency.
> 
> On 10/07/2023 18:32:18+0800, Yu, Mingli wrote:
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> We split the qemu package [1] to add support to make user can install
>> one qemu arch emulation rpm to ease the concerns who care much about
>> the rpm size in embedded device.
>>
>> But for the user who only install the qemu-*.rpm can't do anything
>> except they install the qemu emulation rpm like qemu-system-x86-64-*.rpm
>> explicitly.
>>
>> So add qemu-common package to package all thing into qemu-common when
>> not split the package, and package only the basic into qemu-common and
>> other arch related to each qemu arch emulation rpm when split the package
>> to fix the backward compatibility.
>>
>> qenu-*.rpm which is meta package rdepends on qemu-common and the available
>> qemu arch emulation rpm like qemu-system-x86-64-*.rpm and etc.
>>
>> [1] https://git.openembedded.org/openembedded-core/commit/?id=893846ead7ee54d53e9076150cd655e0c8bca5db
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>>   meta/recipes-devtools/qemu/qemu.inc      | 23 ++++++++++++-----------
>>   meta/recipes-devtools/qemu/qemu_8.0.0.bb |  3 ++-
>>   2 files changed, 14 insertions(+), 12 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
>> index a5bdeef66d..94624163d0 100644
>> --- a/meta/recipes-devtools/qemu/qemu.inc
>> +++ b/meta/recipes-devtools/qemu/qemu.inc
>> @@ -226,15 +226,18 @@ PACKAGECONFIG[brlapi] = "--enable-brlapi,--disable-brlapi"
>>   PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack,"
>>   PACKAGECONFIG[debuginfo] = "--enable-libdw,--disable-libdw,elfutils"
>>
>> -INSANE_SKIP:${PN} = "arch"
>> +INSANE_SKIP:${PN}-common = "arch"
>>
>>   FILES:${PN} += "${datadir}/icons"
>>
>>   # For user who want to install all arch packages
>> -PACKAGES =+ "${PN}-system-all ${PN}-user-all"
>> +PACKAGES =+ "${PN}-common"
>> +RDEPENDS:${PN} += "${PN}-common"
>>
>> -ALLOW_EMPTY:${PN}-system-all = "1"
>> -ALLOW_EMPTY:${PN}-user-all = "1"
>> +ALLOW_EMPTY:${PN} = "1"
>> +FILES:${PN} = ""
>> +
>> +FILES:${PN}-common = "${bindir}/* ${includedir}/* ${libexecdir}/* ${datadir}/* ${localstatedir}"
>>
>>   PACKAGES_DYNAMIC += "^${PN}-user-.*  ^${PN}-system-.*"
>>
>> @@ -242,15 +245,13 @@ PACKAGESPLITFUNCS =+ "split_qemu_packages"
>>
>>   python split_qemu_packages () {
>>       archdir = d.expand('${bindir}/')
>> -    syspackages = do_split_packages(d, archdir, r'^qemu-system-(.*)$', '${PN}-system-%s', 'QEMU full system emulation binaries(%s)' , prepend=True)
>> -    if syspackages:
>> -        d.setVar('RDEPENDS:' + d.getVar('PN') + '-system-all', ' '.join(syspackages))
>> +    subpackages = do_split_packages(d, archdir, r'^qemu-system-(.*)$', '${PN}-system-%s', 'QEMU full system emulation binaries(%s)' , prepend=True, extra_depends='${PN}-common')
>>
>> -    userpackages = do_split_packages(d, archdir, r'^qemu-((?!system|edid|ga|img|io|nbd|pr-helper|storage-daemon).*)$', '${PN}-user-%s', 'QEMU full user emulation binaries(%s)' , prepend=True)
>> -    if userpackages:
>> -        d.setVar('RDEPENDS:' + d.getVar('PN') + '-user-all', ' '.join(userpackages))
>> +    subpackages += do_split_packages(d, archdir, r'^qemu-((?!system|edid|ga|img|io|nbd|pr-helper|storage-daemon).*)$', '${PN}-user-%s', 'QEMU full user emulation binaries(%s)' , prepend=True, extra_depends='${PN}-common')
>> +    if subpackages:
>> +        d.appendVar('RDEPENDS:' + d.getVar('PN'), ' ' + ' '.join(subpackages))
>>       mipspackage = d.getVar('PN') + "-user-mips"
>> -    if mipspackage in ' '.join(userpackages):
>> +    if mipspackage in ' '.join(subpackages):
>>           d.appendVar('RDEPENDS:' + mipspackage, ' ' + d.getVar("MLPREFIX") + 'bash')
>>   }
>>
>> diff --git a/meta/recipes-devtools/qemu/qemu_8.0.0.bb b/meta/recipes-devtools/qemu/qemu_8.0.0.bb
>> index 42e133967e..412c2bc7f0 100644
>> --- a/meta/recipes-devtools/qemu/qemu_8.0.0.bb
>> +++ b/meta/recipes-devtools/qemu/qemu_8.0.0.bb
>> @@ -8,7 +8,8 @@ DEPENDS:append:libc-musl = " libucontext"
>>
>>   CFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', '-DEGL_NO_X11=1', d)}"
>>
>> -RDEPENDS:${PN}:class-target += "bash"
>> +RDEPENDS:${PN}-common:class-target += "bash"
>> +RDEPENDS:${PN}-common:class-nativesdk += "bash"
>>
>>   EXTRA_OECONF:append:class-target = " --target-list=${@get_qemu_target_list(d)}"
>>   EXTRA_OECONF:append:class-target:mipsarcho32 = "${@bb.utils.contains('BBEXTENDCURR', 'multilib', ' --disable-capstone', '', d)}"
>> --
>> 2.25.1
>>
> 
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#184068): https://lists.openembedded.org/g/openembedded-core/message/184068
>> Mute This Topic: https://lists.openembedded.org/mt/100054994/3617179
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
> 
> 
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

