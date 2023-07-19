Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79E58EB64DA
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 09:10:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.9767.1689757854378205548
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jul 2023 02:10:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ebBssbVI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6564ce24fe=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36J5uJKO024718
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 02:10:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=GAxunOiTM0xdMsDkpICo1ienhWS9mRBM9nGyTR1Av80=; b=
	ebBssbVIHXIlJofMmWY3cmY+Ekbc/3GkCwmoBAzncHXLT3kqyHHknHnfCjyIhIY0
	JkBYuSetBg2dyClSVSksB52QknHJFPn0MlpCD+byh3rym3azKYMTAqtlykaBylEV
	6UQ9bOGNeAfHE829vMvzotJO2FT9BDBHD83N8+A3fgD+wppx0GKMg7lA8CrjS6if
	AAAQAOtsa8g0fS76RwNfrqrunKJX8rq4qzzDmECsPssU4y8TLDrJ+/XYFgo+rR4U
	2tiKG7aNvctx029OPTw0OZgLUoTmTiaLSk8lz30QkANR6HsnLHaSOmIaxC4qBghA
	/pLibij/G4KQLqp8OWRKZw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rupqybgpc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 02:10:53 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 36J9ArO7020873;
	Wed, 19 Jul 2023 02:10:53 -0700
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2041.outbound.protection.outlook.com [104.47.51.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rupqybgpa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jul 2023 02:10:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yw2UE7husT9M/Jyj9I06owmKtCz+ZV85fJuthKGGazUsJKVG/HzfBNVAqId38h1EZwibMKuMO4eL+1r3HKbcz2kJj8MLcV118kY0f6N24bzJWpEkJ9IOKKIjdHSIK8LhrWWvCGX+oEBJOs+2ZHeUZ127Fb3LsO3V9jFcuofOus/gLdpe083spuMDB5M92Ap4X1+JB5UL/hrwix9hH68Usw7Hklq0r/VVoR7Y3KVSKcqE+67/QBFY3Utk9OdHUU9m1LcmWyHYmv9FSNVHxPxJV6O8X+9v9FXQZ6GrzJr7HDm+i1LQ4V2b/B4jpIrmmzvOXxCeqq3G869XDBC+9bAx4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GAxunOiTM0xdMsDkpICo1ienhWS9mRBM9nGyTR1Av80=;
 b=EX7Q6YBx0z7x5HLglTgZidJJw/kOIMNjW22iH7qCaCH3B9a8V7Ltqoexxg2v4YwiE40eaa3GLKLzjvw4FoHd3U7u2dSTVi44iTnoNVdy/X5ideOGkZOk5FoksrHIew8J94juANfPyKZXIV0bkHcwUirL5jXrauAZH/8szd3Kxtk5IezeItFGtPgounamiyASadMynrC128OFQVjO453UGx4dH1F5T08FRY7ARak2p0W81rrEHaWMkooc3lECa6ceZNr0zYkjs9LPykCU+X66/cnFuOKaKJINVIY3wIKzxrTjdf1UdLQtA6Svyg7NIBtLIEclDH4usXYD5b1yB6dXiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by SJ0PR11MB6671.namprd11.prod.outlook.com (2603:10b6:a03:44b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Wed, 19 Jul
 2023 09:10:47 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::dd05:531c:7914:ce9f]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::dd05:531c:7914:ce9f%4]) with mapi id 15.20.6609.024; Wed, 19 Jul 2023
 09:10:47 +0000
Message-ID: <9441c96a-33fe-19d4-4228-54a8f4ea413a@windriver.com>
Date: Wed, 19 Jul 2023 17:10:37 +0800
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
 <919cae59-a542-5a51-e70e-164b5306eb41@windriver.com>
 <202307171246212fd06366@mail.local>
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <202307171246212fd06366@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0179.apcprd04.prod.outlook.com
 (2603:1096:4:14::17) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|SJ0PR11MB6671:EE_
X-MS-Office365-Filtering-Correlation-Id: 602f61db-bbe7-46ee-c4b2-08db883809ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	o+sgRF9V+GFMrglheAO0C9weN5mwoP1Rh09z8D9Ctgw/7MEujDLHCOM8IxIImAsTbtwa/jTRpSYg2yAE4x8vvtip7DZLQWGMq5Q1TAG5HJZDPXoFWxqwNwLdXhrLP6CcSzWyDby8zs4cmTvQDa+4QjAzGwyDb+SVfYicBku/WnnqJTp7OCwsJpMSBzFcYthROvfSTbGQ7vwQUz9+8MVi6EhvHv/0VfTo7Z57YuM6nyx9lWICEqw7R59uJEBZ4YVMh0wiz9D/+S4gxa2bRgCqVj7OVXD8DejZry+9wFXPQ3TTfvwqk0eQ4WUpYjTqOoUp0LUeX7acK04D+U/rBylP6ETlIvCcBv7EyuFopcd4VtQVYj7SpZUlOlpvPQTeY0kHkzmHsjCJChD+OizkzcnuxxurWX/Fzqhr3I6jvYGru4tu9SndDHHQyXwgwKw/GQLctlnP0zbvCuhGEKauFLaGR/aL2Ic9Os3P6etvCdMOx+SnWI5fxvYHceC/cAekJeCuknF1gg5wb9uZvnCxT/QSEadPJ+rGxq7QG1ru+3ODctigR9DwINje+DixRfQv/XhBPk58V0LDF2fgWiauNEpPVbSWGTSOEjl4ITg9AfkXbreg/EPptmMl+BPe1LSRShYH+5OGogf3OH22J709T7KrQg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(366004)(39850400004)(136003)(376002)(451199021)(31686004)(86362001)(2906002)(31696002)(36756003)(66899021)(186003)(83380400001)(53546011)(6506007)(26005)(38100700002)(6512007)(966005)(6666004)(6486002)(110136005)(66946007)(8936002)(66476007)(4326008)(66556008)(2616005)(316002)(41300700001)(478600001)(5660300002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OFJvVnJHY2xZU1BHNWlmTFYzL2d0VUpvVWpPNW40N3cxYW9ieDFmdWNnOW0w?=
 =?utf-8?B?L2hPczcxM2piYTZGNG1mRFM2eVJxQjV5SjJYV0FwSmE3MUxHT2hEL0x1RW1k?=
 =?utf-8?B?MWFtbVlqdFkxQTVXN0ZOU0dHL0NkU01xT2JMMzhkWk5XWXY5N0NPUnFhRXF4?=
 =?utf-8?B?S2Zwa0tETXFzRk5SZksvbnhPM0s3b2djdnpPemYwckRvTmxJTm1JMlgyWHV5?=
 =?utf-8?B?UXNDZWhVekdPdUVTYitqQlBpb1BuUUJkQVFJZXdUTitLa1p6SjJDbXZlZWtF?=
 =?utf-8?B?RysxOFhQQlA5cGtaemxYRUtTVDUrNUd0VHpuOXlja0hhWEN2VHFKL0psZC8y?=
 =?utf-8?B?cGtzZmhUUFFHTTVGU09RR0FMVXIxODhXRmVacXlOb1c0Mm5rK1FkUXk0alh3?=
 =?utf-8?B?Y3V1dlRnR3R3bFJuR1BQYTF6Q2tnUVRubDJEaGZxWHNydXdxeUF1ZEFwcVFt?=
 =?utf-8?B?T204bTNRdHFBd1JCQ1NSenJneW54ZDg1amcySisrbFR2U042N3pCQ3lPMER0?=
 =?utf-8?B?eWJDcFp0TkhMUlBBSmNDR2hOeEJRZmd6bXZTRjI4RkNkRWJvUFlRMkdyemU0?=
 =?utf-8?B?TXBGUXErNHVIUmtENDFIS3lJa05iUUtGdzBhd1lYQ1dtSnQ2cG9OK2NYK1Vl?=
 =?utf-8?B?OThPU3BZcFhJeXhNWnNrQWJ3T3BVcm9ibGJQOHhBcndQeTc5eUx5VWlER2FN?=
 =?utf-8?B?SWFkcUxuNEVxRW9Gb3dhakVYbWpKNzREQmNwQVI1R252Q1ovbmhDd0dYWDZZ?=
 =?utf-8?B?bk1pMWViNlo2cmFEbkc4TktmdUpRc2lhaUMrY1E5QlN2YU1OdElKUHYzQzFX?=
 =?utf-8?B?Q3VEaXlRMVBWLzJTK0xrdVhEbzV0NVNLSml4SGI3ZW9IRTJ2Y3UxN0l4cE0w?=
 =?utf-8?B?TWQ4Yk1HaWZVYW91cEhVSlFaODhpOXFPUnFINWlXR1NMaFNiMU41UmhvazRC?=
 =?utf-8?B?RVN4WDNCRm9iaTJCMml1UmV2SDVWSmJsbEUxTys1Q0pyNldvNXpHM0FqcU41?=
 =?utf-8?B?ek90bWFJNlUzOHRvc3F5amkxeittMEFUTzNHajZVaUxjZUdMRSt5ZjhZUTVF?=
 =?utf-8?B?MDljRmtETE5mWW81RFh6M0pDSnlYWTEwek1xQjFhL2wxbG9ZVEFNcnY1ZHU3?=
 =?utf-8?B?eVdFN2ttZ2gxSTlwQll5UHRqZ1d4b3JRbytldDM0ci96ei9xK3h1WE55T1N1?=
 =?utf-8?B?Q1VxQndZNERNNXdFYXRUMldaR05vdjRod2taM1RLb1NQZmhZN0s2TTdmMUtw?=
 =?utf-8?B?Ny9yQWdwZFhGQXhuVWF5R2pjaWZBY3JsK2dpK1BrOU44ZFlMUHdRREoxMVY0?=
 =?utf-8?B?NFNreDRoWllITnB6ZFVVakNubEkybG1xQ2xPRVZmZkVFSGFzTmdBYnBQR0pV?=
 =?utf-8?B?N1Y4dTd4NGZFbnZFZ1ZvSlVVOHBQVS9WR2UwaFlHR2Vsa0s0ZHFSQVAwdXdy?=
 =?utf-8?B?Qlo3cUdaaTB2QnBLRmQ2YzZuR0ozTERXbUtnMFVsZ3dPOG1QRG12Wm9Nejdu?=
 =?utf-8?B?OCtvWEdkQytMYmYvMGpWVnl5TWJVd3BZOGNUVExvdEVGT3NQaFZJV1Zrbno5?=
 =?utf-8?B?ck1vajlPVlFsdXJ2MHQ1dkdHRUl0QllQOEVZdkxKZW1TLzkvc09FTk9QL0F1?=
 =?utf-8?B?bGl4T2hMRXZTV3lickthWXdueFlCSDdCKzdnc09kRjJZVGRmL1podFZEcW9u?=
 =?utf-8?B?WWZYMytRZmhvZ3F0djJZRXk3SGtEUlM2ZCt3aERnSmVUUWlFNm4wbHZDWDNP?=
 =?utf-8?B?N2tyb3pMK0p2NnhTNmw4SWpPUEMyOHB1aGMxQVVjb1JZeXpvdi8rbVhUS2py?=
 =?utf-8?B?RllRMlpoc0dZV1hRTmFTcUxHOEptbjhGazZPSkF4aGN4QmdBeEVCVlhJb2xM?=
 =?utf-8?B?eXd3VDlSUk55Y2t2aCt4OXphVUlzajJsOEtETkZIamlxOU9WQ1I1d0xKTVE3?=
 =?utf-8?B?T3pTV3Z0TkJncUJwRkZQRlpMdGtQYlJPelJwQnVSOVZVbWs2ZnR4RjBieTgy?=
 =?utf-8?B?ZjZ3Y25ZWWNjQ1FPOUM5THVEQ1BNbmhQbFl0M1Y4cjBYTnpBRWlNeWxkTkhq?=
 =?utf-8?B?d3lHYVRMYVdOb3B1bVdMVFJvaHg0ekYrZjRQN2tFTVlkbTlaNHF6em5FU2w3?=
 =?utf-8?Q?JQo+DSRTX2jez7hZNLCqtQyFB?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 602f61db-bbe7-46ee-c4b2-08db883809ee
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 09:10:47.0346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i5PBpt5ipRvpKp+wuuc3p1mPi29YYJjdHsJCLHrhg9UhLNBOge3jFRvqWYEQi7y1JP+SPh7Rhmj0RWxIG/lxvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6671
X-Proofpoint-GUID: UlH5qmeMmoItSf35tX0hXrj-SF1rPsLV
X-Proofpoint-ORIG-GUID: Gj7NyUlPQ8O8XqAoMoxn0NZ-WFHA0uHG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-19_05,2023-07-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 clxscore=1015 mlxscore=0 impostorscore=0 bulkscore=0 mlxlogscore=728
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2307190084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 09:10:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184570

Hi Alex,

On 7/17/23 20:46, Alexandre Belloni wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> On 17/07/2023 15:10:35+0800, Yu, Mingli wrote:
>> Hi Alex,
>>
>> On 7/16/23 19:47, Alexandre Belloni wrote:
>>> CAUTION: This email comes from a non Wind River email account!
>>> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>>>
>>> Hello,
>>>
>>> This causes the following meta-mingw error on the AB:
>>>
>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/7501/steps/12/logs/stdio
>>
>> I didn't find the core-image-mingw-sdktest recipe which I noticed in the
>> above log, so I cannot reproduce the issue as you mentioned.
> 
> As stated above, this is part of meta-mingw:
> 
> https://git.yoctoproject.org/meta-mingw/tree/recipes-core/images?h=master-next

Thanks for your pointer!

BTW, the below error which in 
https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/7501/steps/12/logs/stdio 
seems irrelevant to the added nativesdk dependency though I have removed 
the nativesdk dependency in 
https://patchwork.yoctoproject.org/project/oe-core/patch/20230717071114.2734859-1-mingli.yu@eng.windriver.com/.

| 
/home/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/i686-nativesdk-mingw32-w64-mingw32/nativesdk-ncurses/6.4-r0/recipe-sysroot-native/usr/bin/i686-w64-mingw32/../../libexec/i686-w64-mingw32/gcc/i686-w64-mingw32/13.1.1/ld: 
../obj_s/lib_kernel.o:lib_kernel.c:(.text+0x5c): undefined reference to 
`_nc_mingw_tcflush'
| 
/home/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/i686-nativesdk-mingw32-w64-mingw32/nativesdk-ncurses/6.4-r0/recipe-sysroot-native/usr/bin/i686-w64-mingw32/../../libexec/i686-w64-mingw32/gcc/i686-w64-mingw32/13.1.1/ld: 
../obj_s/lib_ttyflags.o:lib_ttyflags.c:(.text+0x2c): undefined reference 
to `_nc_mingw_tcgetattr'
| 
/home/pokybuild/yocto-worker/meta-mingw/build/build/tmp/work/i686-nativesdk-mingw32-w64-mingw32/nativesdk-ncurses/6.4-r0/recipe-sysroot-native/usr/bin/i686-w64-mingw32/../../libexec/i686-w64-mingw32/gcc/i686-w64-mingw32/13.1.1/ld: 
../obj_s/lib_ttyflags.o:lib_ttyflags.c:(.text+0xbb): undefined reference 
to `_nc_mingw_tcsetattr'

Thanks,

> 
>>
>> Thanks,
>>
>>>
>>> This is due to the added native-sdk dependency.
>>>
>>> On 10/07/2023 18:32:18+0800, Yu, Mingli wrote:
>>>> From: Mingli Yu <mingli.yu@windriver.com>
>>>>
>>>> We split the qemu package [1] to add support to make user can install
>>>> one qemu arch emulation rpm to ease the concerns who care much about
>>>> the rpm size in embedded device.
>>>>
>>>> But for the user who only install the qemu-*.rpm can't do anything
>>>> except they install the qemu emulation rpm like qemu-system-x86-64-*.rpm
>>>> explicitly.
>>>>
>>>> So add qemu-common package to package all thing into qemu-common when
>>>> not split the package, and package only the basic into qemu-common and
>>>> other arch related to each qemu arch emulation rpm when split the package
>>>> to fix the backward compatibility.
>>>>
>>>> qenu-*.rpm which is meta package rdepends on qemu-common and the available
>>>> qemu arch emulation rpm like qemu-system-x86-64-*.rpm and etc.
>>>>
>>>> [1] https://git.openembedded.org/openembedded-core/commit/?id=893846ead7ee54d53e9076150cd655e0c8bca5db
>>>>
>>>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>>>> ---
>>>>    meta/recipes-devtools/qemu/qemu.inc      | 23 ++++++++++++-----------
>>>>    meta/recipes-devtools/qemu/qemu_8.0.0.bb |  3 ++-
>>>>    2 files changed, 14 insertions(+), 12 deletions(-)
>>>>
>>>> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
>>>> index a5bdeef66d..94624163d0 100644
>>>> --- a/meta/recipes-devtools/qemu/qemu.inc
>>>> +++ b/meta/recipes-devtools/qemu/qemu.inc
>>>> @@ -226,15 +226,18 @@ PACKAGECONFIG[brlapi] = "--enable-brlapi,--disable-brlapi"
>>>>    PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack,"
>>>>    PACKAGECONFIG[debuginfo] = "--enable-libdw,--disable-libdw,elfutils"
>>>>
>>>> -INSANE_SKIP:${PN} = "arch"
>>>> +INSANE_SKIP:${PN}-common = "arch"
>>>>
>>>>    FILES:${PN} += "${datadir}/icons"
>>>>
>>>>    # For user who want to install all arch packages
>>>> -PACKAGES =+ "${PN}-system-all ${PN}-user-all"
>>>> +PACKAGES =+ "${PN}-common"
>>>> +RDEPENDS:${PN} += "${PN}-common"
>>>>
>>>> -ALLOW_EMPTY:${PN}-system-all = "1"
>>>> -ALLOW_EMPTY:${PN}-user-all = "1"
>>>> +ALLOW_EMPTY:${PN} = "1"
>>>> +FILES:${PN} = ""
>>>> +
>>>> +FILES:${PN}-common = "${bindir}/* ${includedir}/* ${libexecdir}/* ${datadir}/* ${localstatedir}"
>>>>
>>>>    PACKAGES_DYNAMIC += "^${PN}-user-.*  ^${PN}-system-.*"
>>>>
>>>> @@ -242,15 +245,13 @@ PACKAGESPLITFUNCS =+ "split_qemu_packages"
>>>>
>>>>    python split_qemu_packages () {
>>>>        archdir = d.expand('${bindir}/')
>>>> -    syspackages = do_split_packages(d, archdir, r'^qemu-system-(.*)$', '${PN}-system-%s', 'QEMU full system emulation binaries(%s)' , prepend=True)
>>>> -    if syspackages:
>>>> -        d.setVar('RDEPENDS:' + d.getVar('PN') + '-system-all', ' '.join(syspackages))
>>>> +    subpackages = do_split_packages(d, archdir, r'^qemu-system-(.*)$', '${PN}-system-%s', 'QEMU full system emulation binaries(%s)' , prepend=True, extra_depends='${PN}-common')
>>>>
>>>> -    userpackages = do_split_packages(d, archdir, r'^qemu-((?!system|edid|ga|img|io|nbd|pr-helper|storage-daemon).*)$', '${PN}-user-%s', 'QEMU full user emulation binaries(%s)' , prepend=True)
>>>> -    if userpackages:
>>>> -        d.setVar('RDEPENDS:' + d.getVar('PN') + '-user-all', ' '.join(userpackages))
>>>> +    subpackages += do_split_packages(d, archdir, r'^qemu-((?!system|edid|ga|img|io|nbd|pr-helper|storage-daemon).*)$', '${PN}-user-%s', 'QEMU full user emulation binaries(%s)' , prepend=True, extra_depends='${PN}-common')
>>>> +    if subpackages:
>>>> +        d.appendVar('RDEPENDS:' + d.getVar('PN'), ' ' + ' '.join(subpackages))
>>>>        mipspackage = d.getVar('PN') + "-user-mips"
>>>> -    if mipspackage in ' '.join(userpackages):
>>>> +    if mipspackage in ' '.join(subpackages):
>>>>            d.appendVar('RDEPENDS:' + mipspackage, ' ' + d.getVar("MLPREFIX") + 'bash')
>>>>    }
>>>>
>>>> diff --git a/meta/recipes-devtools/qemu/qemu_8.0.0.bb b/meta/recipes-devtools/qemu/qemu_8.0.0.bb
>>>> index 42e133967e..412c2bc7f0 100644
>>>> --- a/meta/recipes-devtools/qemu/qemu_8.0.0.bb
>>>> +++ b/meta/recipes-devtools/qemu/qemu_8.0.0.bb
>>>> @@ -8,7 +8,8 @@ DEPENDS:append:libc-musl = " libucontext"
>>>>
>>>>    CFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', '-DEGL_NO_X11=1', d)}"
>>>>
>>>> -RDEPENDS:${PN}:class-target += "bash"
>>>> +RDEPENDS:${PN}-common:class-target += "bash"
>>>> +RDEPENDS:${PN}-common:class-nativesdk += "bash"
>>>>
>>>>    EXTRA_OECONF:append:class-target = " --target-list=${@get_qemu_target_list(d)}"
>>>>    EXTRA_OECONF:append:class-target:mipsarcho32 = "${@bb.utils.contains('BBEXTENDCURR', 'multilib', ' --disable-capstone', '', d)}"
>>>> --
>>>> 2.25.1
>>>>
>>>
>>>>
>>>>
>>>>
>>>
>>>
>>> --
>>> Alexandre Belloni, co-owner and COO, Bootlin
>>> Embedded Linux and Kernel engineering
>>> https://bootlin.com
> 
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#184431): https://lists.openembedded.org/g/openembedded-core/message/184431
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

