Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5722CC3DA6E
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 02:38:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.137850.1703817515458334306
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Dec 2023 18:38:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=MaF5F60w;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1727e084dc=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BT2XChU028918
	for <openembedded-core@lists.openembedded.org>; Thu, 28 Dec 2023 18:38:35 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=S1pCm0U51FsphFNvWp7L1c1L9Y6GHxgR2j+ANFDCiQE=; b=
	MaF5F60wsqy2gmDoWR7wXonOsSAvAsHxjGu952EFAgPdULQykYAhaqVI7yQUnulT
	AtDI4TSguSiZ7ibmJsgSu3vOWzu2wd0e6AiYK7GLvmLbpyBGBJUqzdDt+VX9Mm/e
	PmP3SxwHucEwhrrglgBrJjGSRRbrVwZ8aPWoZlIktlQY1rdyWQhNu5excahE4Z9h
	0J7/SzfU4rOWYd48QVIKvhEg+8/lb5G/tVBzOsltuyTlEXEJ6sUM4Y34xM6XWct8
	b7dzNmwRVQ1YlhU58HVZzW007u/teOEZeZ5LwVcSezOvKwGrIaJktTnXYguNuoGm
	2e17TEs12+4kN/ahrWbb0A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v5yxm4hej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 28 Dec 2023 18:38:34 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3BT2cYCv002726;
	Thu, 28 Dec 2023 18:38:34 -0800
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v5yxm4heh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Dec 2023 18:38:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bfOJQTsT+z0bOBLA+ibGm49OYkzam42AhQWCgb6IvdCuN6xo9FDZ1KjBOrzfQUN0lFOmozMRcRD3f1ZQeswDIhur/MCyVjHJlSR6Pj8RqoK6KvdUZvljOSE4hIKGvdK4dSVnmaPHZzLxKrY6drZblsMf2MNkrxu1PFDzZxmaXO3yQMv39Fw8qO54QZSy6DRIi782Ts5PxZwScg20MxMLGUkBAwzXwySCr10rzvHKjrk86EBacplhVN+KY9egqmUgRfB6zymxJOAjVFjfIObjWEYd30iBUxrYaI7qN4Dvzt09irP/9Vk+jOSCbh+Nd0dhQTmwzgqmKV0ojj1HYew+IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S1pCm0U51FsphFNvWp7L1c1L9Y6GHxgR2j+ANFDCiQE=;
 b=YfiHvLCl3f3CAdPlucbt/hB31crrxwCeH3G47b1mLYe7E3SOAJIWt0WSSM55EhUD74pDd4jSYkBsGACqQ21vuM+yCcYRc8ubSBvPHpAgQth2qOtlv/L+QmLjGXNvRPH3RxBlN/vTyXEbXOmqb+SFILy8bXqU1AO2cHJjlRbpLlOZQlS0CH4QYP1AGvivPQ/KEx2j26DJmMtnzjTcoeV1Mzf7hoTwz5qFwzDnUObjOei0XhvUFAj4f+/qc+q3kA3kjJBLbJrzuBnUzvVCk35C5lC3F8Mi8gZ6KKFi3d+si0bVInxKbSk48psL1ZTqf51bmH+r88zqZIWTJ1Fg32FHWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH0PR11MB5596.namprd11.prod.outlook.com (2603:10b6:510:eb::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.20; Fri, 29 Dec
 2023 02:38:28 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315%6]) with mapi id 15.20.7135.019; Fri, 29 Dec 2023
 02:38:28 +0000
Message-ID: <339c8673-650a-37ee-dad5-e7cd3ebfedf5@windriver.com>
Date: Fri, 29 Dec 2023 10:38:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core][PATCH 1/3] systemd: upgrade to 255.1
Content-Language: en-US
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20231227042036.2376255-1-Qi.Chen@windriver.com>
 <2023122711592084d34620@mail.local>
 <CO6PR11MB560279EC2354AEBC89D8E15FED9EA@CO6PR11MB5602.namprd11.prod.outlook.com>
 <202312282114180d86a09f@mail.local>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <202312282114180d86a09f@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY2PR06CA0030.apcprd06.prod.outlook.com
 (2603:1096:404:2e::18) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH0PR11MB5596:EE_
X-MS-Office365-Filtering-Correlation-Id: f9277c54-fcf4-452a-46df-08dc08173cf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ioGF3SeeEJOX1hhBBNrhqAQNoW7kMBkfwy4dIBu1AJ78f14t7Droa9h4BjA00CyJyqQPZFoExrimKdTOv8RU8jsBiCkNCqnC/kyh+QfA/GfKHSdlOBcxqPzFfQsxjKPfVsfL1jFgu52kB7cv34w5MA3bX1kOu7UO1DpBDvfBc6z1DdrNGz4J63GTM753EWaelxrqriYqpszRAvjyiqpC3O7H+2frCdQfut6NWcY7qqe6tlJvYiZGwPCUBSj03iUtupay4ekWGHfatD3Za8zMHSsXH3CVe3vWgSp2ic0ODEnU230kegiJOnPZ8E2s/wqAeVVY8mMwzAgn2gXZpWkDlrkhMwcxepOqQuTFzxVzp1YIDulz+8210w4RoTSYpoJRrIqGuDHoXpfAo8c8TgxzxzP43LiBPunj550tDIXJvUKth2iWHfTg0QMICyLS9Od5z9CGiw6Ua7JyXO+/x3BGA2LS/G9Fa4Y13c/XP3jEkP5seWrPXLUPdcJACS9fZkKqyLvX5GPQrP7ALFwgvtfrPgO2yxU2ri9eAASOW6EyuSqALR+XFtJJStOCEUg7YWhBYYclaE01oUUkHK8+wanEjRC+bGZ6DCFHh42P9gnCMnF5nmCya3UV3JeayNkSjPvD7ILZ6t1qai5uZeragrTwRx6ceOtlq6Z9EZCl+sWzmHEy8q3562vNuzQFyL9OUX2ucJBYlEsY6kFe2r6EO93j4c251KpBqEIn17G2HxxrKmA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39850400004)(136003)(396003)(376002)(346002)(230173577357003)(230922051799003)(230273577357003)(64100799003)(186009)(1800799012)(451199024)(31686004)(36756003)(66899024)(6916009)(66476007)(6512007)(66556008)(6506007)(6486002)(66946007)(31696002)(86362001)(53546011)(6666004)(38100700002)(26005)(2616005)(8936002)(41300700001)(83380400001)(4326008)(2906002)(5660300002)(30864003)(966005)(478600001)(316002)(8676002)(2004002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MEZXaThJVHJjcTFLQ1VoS2RzcjMvUHUraC9lMHJ6ZWZkVDFtNSttaytzamZE?=
 =?utf-8?B?RldXZ1IrTDg0WnVtdjM4SE12L1p3Z2trTWo0cjlud0x0RjFNdGg1WnNaZ0Z5?=
 =?utf-8?B?NEZPNkNwc0IzSHUzb281SFJBVGtlZFhuK0FJMXh2NnREUHhXVDE1d21LWlhE?=
 =?utf-8?B?empCYmdHYkpzamxwR09pYyszMzhPMDRGaitBalFGeVZuWnBnbGdhOXFVUzhj?=
 =?utf-8?B?UHltZWxPa3Q3M2dOYUx4K2s3Nks2a2dQWWpBMld4UGpuWmxBZjNnb1hEVmE0?=
 =?utf-8?B?NmpJYUNna1FHTzAzTmZ3TUFSckZJQlY3NEZBOU9qdDA5cnRNb3pWS2dQVWdZ?=
 =?utf-8?B?bzNlQmVkQWZGK2dHSHZhOVZNVWlyUkFPQWRtT1ZwYURDaDNTNy9nNGdncEhy?=
 =?utf-8?B?QldwbWIwUXR1N2RqdGtyUllQUzBDYW9lRVA5bjh1T2dxNlNwc0lFUFRmMi9i?=
 =?utf-8?B?aW9BVmZ5MEpqdXgrQmlqYnhYSG16cWoxWVBjOTc3Slk0RXpUMWtSZlFMbVg2?=
 =?utf-8?B?RHBUZzBDcTZ2Y3RKL3BwZnNLT0lKUDVMb2hQQ0p1N0RGbjlaVXNXWnRnMGJl?=
 =?utf-8?B?SGxkNWpHcEZJRzBod3BuZDBMbGlsMTMxaFAxUlJmQ3Y2ak12OVZaWlJXbHp6?=
 =?utf-8?B?Sklua21JWGRneC9wazk1bzJsVG5EbGErcnZld3J0RDlHYWxQVEpkZmlFVmx6?=
 =?utf-8?B?MVZGZVNFQjc2U0RESXRNUWZqRHR6ZUZmcE1TWFE5SjJLQi9QaUtJdW1nRElL?=
 =?utf-8?B?bWFaWitIZEg1SnlDTytrb0hPYVAxTmMyTGpFYWV5cVlTTlI4L0gwTU1iMUtV?=
 =?utf-8?B?VUt5cHc4akZBbDJCZlNuUG9jTzNVMXJlVW5GbGRPOFVGNzFiN1BKNVZrVlNE?=
 =?utf-8?B?V3BsMU82U2VjdFFWbTNMOWZ0bzRsUUlBY0YxcDVaOWQrS3lpaVFySmpkZ3lP?=
 =?utf-8?B?aHQrbDBHS3VOZ01kcnR5RUY2dG1BbkF3SVdxeUw5QVVFT3dEV00zbEdqcVdq?=
 =?utf-8?B?ck9veFFHckZQWlVuTEoraGx2RDBUNlFFMnRNZENkOGlIM0V2akZMZzJENzhu?=
 =?utf-8?B?VGpUMlFEMnhOdFdXM2tCTUswN014bVVRQUpzYXFZK3k3YnlaaUwxandBcnla?=
 =?utf-8?B?bXJ1MEhDQi85ano5QU03SFhOMGJtKytHVjl2Zno2WGlzOVMzWmRWQ2MzdldR?=
 =?utf-8?B?MFdSdzRudVN6akNKQms3UE1zTUtRQkREb1A4d21SOCtxb21GWUxUOFFycXEy?=
 =?utf-8?B?TUlQY21kTVAzMzc4bnVIbFA3RHl4d1hTd3B4UzZjS2FFaVRSOGtiVTM1UzJk?=
 =?utf-8?B?MWpTa2dPaVJuNnZiaTErKzl0MXlzRm5CZHM2VjliTTlDTTdITFF2WDhTeTRR?=
 =?utf-8?B?UjcvNXRNWEllbDhuaW9IcExCQmJ6Wk9hOVlFNDNUZDA3aFRoMVFiM0syc1Vr?=
 =?utf-8?B?azBGQ0cwemVxM2tXQkpzRWMvMzJManB6ZGNCZ1ljTmV1TmVEMEVMdENqVmZ3?=
 =?utf-8?B?TTJmamdDWEJZeUhPeTB0OUl3M3RWaDFVampjcVUyYlBmN1JkK285ZThTUUov?=
 =?utf-8?B?U3l1ZnpjRFJXZkFGRUJsZzdSQ2N4NExBZ0FMMWVsbENJYTIrRHVVRnVuMUQw?=
 =?utf-8?B?RzlWdnJyMk82U2hMUTVod1RTaUtsZzhXWXNIeDBLN0Z4ZnVHSkVpNmh0WE1k?=
 =?utf-8?B?czVMVWRqWnlKOXdIQWZYUk9Oa1VQcnFobThrY3Y5NjZQNWxWMWlTVmlSSmZn?=
 =?utf-8?B?anhwTGhON3IzamxBV2dIVW1RRkZDNmRvOHJibUpBeU9qRTdCVEJ3VnF2R01F?=
 =?utf-8?B?VFZWWVAyeGc5Y3lCV1BCTnRoYU9sc21zNEJNaWsrUjU5UkdzY21hZnB0Tk5B?=
 =?utf-8?B?VnhZREk2ek9CQytkVGdIQVpzRE4zM3BXMEo2QkcyTDdpanpVRTRWVkxDWitK?=
 =?utf-8?B?Q3VmVWVzWlBpclUzSVpqWkdmS1k1bCs4RnRaZGhqcmgvZ3JHbGZiYmZyYkRW?=
 =?utf-8?B?NjhDWm52K0E1c00wdmorUTEzWWJURzBuYXh0VnRaZzZiN0JUWklCWVlLTGcx?=
 =?utf-8?B?bVlyOWp4Z2JrZkkvUFAydWV5VklRU0tCWXhlNGpNTzM3WUwrdEhwclF2R1pD?=
 =?utf-8?Q?4/wXuRWvbNTkKidmlhB/pMRjI?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9277c54-fcf4-452a-46df-08dc08173cf9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2023 02:38:28.1342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ha3wNWX4OLtvZlQyTPiJtPtibq8S+52XBwFrkrydAN3kngC5tEnQEGuvlWV5ZXtppL9bFgRISa2g7XrbHZuzQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5596
X-Proofpoint-GUID: QBovClByvMpyAOst3drOc6gpCjlFlX3x
X-Proofpoint-ORIG-GUID: 2qieVTVXCYpTxmjjnMAEg9lwVjrWiu6v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 mlxscore=0 bulkscore=0 impostorscore=0 adultscore=0
 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312290018
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 02:38:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192995

On 12/29/23 05:14, Alexandre Belloni wrote:
> On 28/12/2023 03:00:08+0000, Chen, Qi wrote:
>> I double checked it in my environment, setting INIT_MANAGER to "systemd" and then 'bitbake systemd' will not generate this warning. In this case ROOT_HOME's value is "/root".
>> I checked https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/8354, but I couldn't find the configuration items that set the init manager to systemd.
>> Does the build use the variable 'INIT_MANAGER'? Does it set ROOT_HOME to "/home/root" somewhere?
>>
> This is the config that is used:
>
> MACHINE = "qemux86-64"
> DISTRO = "poky"
> SDKMACHINE = "x86_64"
> PACKAGE_CLASSES = "package_rpm package_deb package_ipk"
> DL_DIR = '/srv/autobuilder/autobuilder.yocto.io/current_sources'
> SSTATE_DIR ?= '/srv/autobuilder/autobuilder.yocto.io/pub/sstate'

> TEST_SUITES:append = ' systemd'
> DISTRO_FEATURES:append = ' pam systemd usrmerge'
> VIRTUAL-RUNTIME_init_manager = 'systemd'
> DISTRO_FEATURES_BACKFILL_CONSIDERED = 'sysvinit'

OK, I see.

I'd suggest replacing the above 4 lines with a single line:

INIT_MANAGER = "systemd"

The INIT_MANAGER mechanism was added to make switching init managers easier.

Another choice is adding the following line to sync with the 
meta/conf/distro/include/init-manager-systemd.inc settings.

ROOT_HOME ?= "/root"

Regards,

Qi


> DISTRO_FEATURES:remove = 'x11'
> QEMU_USE_KVM = 'True'
> INHERIT += 'report-error'
> PREMIRRORS = ''
> BB_GENERATE_MIRROR_TARBALLS = '1'
> BB_NUMBER_THREADS = '16'
> BB_NUMBER_PARSE_THREADS = '16'
> PARALLEL_MAKE = '-j 16 -l 52'
> BB_PRESSURE_MAX_CPU = '10000'
> BB_PRESSURE_MAX_IO = '10000'
> XZ_MEMLIMIT = '5%'
> XZ_THREADS = '8'
> ZSTD_THREADS = '8'
> BB_TASK_NICE_LEVEL = '5'
> BB_TASK_NICE_LEVEL:task-testimage = '0'
> BB_TASK_IONICE_LEVEL = '2.7'
> BB_TASK_IONICE_LEVEL:task-testimage = '2.1'
> IMAGE_CLASSES += 'testimage'
> TEST_QEMUBOOT_TIMEOUT = '1500'
> SANITY_TESTED_DISTROS = ''
> SDK_EXT_TYPE = 'minimal'
> SDK_INCLUDE_TOOLCHAIN = '1'
> ESDK_LOCAL_CONF_REMOVE:append = 'BB_HASHSERVE'
> BB_DISKMON_DIRS = 'STOPTASKS,${TMPDIR},1G,100K STOPTASKS,${DL_DIR},1G STOPTASKS,${SSTATE_DIR},1G STOPTASKS,/tmp,100M,30K HALT,${TMPDIR},100M,1K HALT,${DL_DIR},100M HALT,${SSTATE_DIR},100M HALT,/tmp,10M,1K'
> BB_HASHSERVE = 'hashserv.yocto.io:8686'
> RUNQEMU_TMPFS_DIR = '/home/pokybuild/tmp'
> BB_HEARTBEAT_EVENT = '60'
> BB_LOG_HOST_STAT_ON_INTERVAL = '1'
> BB_LOG_HOST_STAT_CMDS_INTERVAL = 'oe-time-dd-test.sh -c 100 -t 3'
> BB_LOG_HOST_STAT_ON_FAILURE = '1'
> BB_LOG_HOST_STAT_CMDS_FAILURE = 'oe-time-dd-test.sh -l'
> SDK_TOOLCHAIN_LANGS += 'rust'
> BB_SERVER_TIMEOUT = '60'
>
> It is in auto.conf and it is displayed in the first lines of
> https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/8354/steps/14/logs/stdio
>
>> Regards,
>> Qi
>>
>> -----Original Message-----
>> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
>> Sent: Wednesday, December 27, 2023 7:59 PM
>> To: Chen, Qi <Qi.Chen@windriver.com>
>> Cc: openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core][PATCH 1/3] systemd: upgrade to 255.1
>>
>> We hit the added warning on the autobuilders:
>>
>> WARNING: systemd-1_255.1-r0 do_install: Using /home/root as root user's home directory is not fully supported by systemd
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/8354/steps/14/logs/warnings
>>
>> On 27/12/2023 12:20:34+0800, Chen Qi via lists.openembedded.org wrote:
>>> From: Chen Qi <Qi.Chen@windriver.com>
>>>
>>> 1. Patch changes:
>>>
>>> 0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch
>>> is removed because it has no real effect now. The /lib is now /usr/lib
>>> because 'usrmerge' is a required distro feature for systemd.
>>>
>>> 0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch is
>>> refreshed for the new version to avoid patch-fuzz issue.
>>>
>>> 2. root user's home directory now defaults to "/root":
>>>
>>> The sysuers.d/basic.conf is still modified to respect the ROOT_HOME
>>> value, so if users set ROOT_HOME to "/home/root", the behavior is the
>>> same as before. However, this is only for backward compatibility. With
>>> this patch, The ROOT_HOME value is set to "/root" in init-manager-systemd.inc.
>>> This is because systemd's source codes are hardcoding "/root", and
>>> other values are not officially supported. See the list below.
>>> $ grep -rl '"/root"' src/ | grep -v 'src/test'
>>> src/core/namespace.c
>>> src/basic/user-util.c
>>> src/nss-systemd/nss-systemd.c
>>> src/nspawn/nspawn.c
>>> src/firstboot/firstboot.c
>>> src/shared/userdb.c
>>> src/shared/user-record.c
>>> $ grep -rl /root network/ factory/ sysctl.d/ sysusers.d/ rules.d/
>>> tmpfiles.d/ units/ xorg/ tools/ sysusers.d/basic.conf.in
>>> tmpfiles.d/provision.conf units/emergency.service.in
>>> units/rescue.service.in tools/list-discoverable-partitions.py
>>> Previously, the recipe was just substituting sysusers.d/basic.conf.in,
>>> which is not enough to be treated as 'fully support'. I deliberately
>>> put a warning message in do_install to warn users about non "/root"
>>> ROOT_HOME value. Don't remove it until all above places are handled.
>>>
>>> 3. cgroupv2 is now the default.
>>> cgroupv2 is the default for systemd for many years and it's the
>>> default for distros such as ubuntu and fedora. Let's also use it as the default.
>>>
>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>> ---
>>>   .../distro/include/init-manager-systemd.inc   |  2 +
>>>   meta/recipes-core/systemd/systemd.inc         |  4 +-
>>>   ...tall-dependency-links-at-install-tim.patch | 22 +++---
>>> ...sysctl.d-binfmt.d-modules-load.d-to-.patch | 73 -------------------
>>>   .../systemd/systemd/basic.conf.in             | 40 ----------
>>>   .../{systemd_254.4.bb => systemd_255.1.bb}    | 16 ++--
>>>   6 files changed, 25 insertions(+), 132 deletions(-)  delete mode
>>> 100644
>>> meta/recipes-core/systemd/systemd/0004-Move-sysusers.d-sysctl.d-binfmt
>>> .d-modules-load.d-to-.patch  delete mode 100644
>>> meta/recipes-core/systemd/systemd/basic.conf.in
>>>   rename meta/recipes-core/systemd/{systemd_254.4.bb =>
>>> systemd_255.1.bb} (98%)
>>>
>>> diff --git a/meta/conf/distro/include/init-manager-systemd.inc
>>> b/meta/conf/distro/include/init-manager-systemd.inc
>>> index 595d1f2644..0a76647459 100644
>>> --- a/meta/conf/distro/include/init-manager-systemd.inc
>>> +++ b/meta/conf/distro/include/init-manager-systemd.inc
>>> @@ -5,3 +5,5 @@ VIRTUAL-RUNTIME_init_manager ??= "systemd"
>>>   VIRTUAL-RUNTIME_initscripts ??= "systemd-compat-units"
>>>   VIRTUAL-RUNTIME_login_manager ??= "shadow-base"
>>>   VIRTUAL-RUNTIME_dev_manager ??= "systemd"
>>> +# systemd hardcodes /root in its source codes, other values are not
>>> +offically supported ROOT_HOME ?= "/root"
>>> diff --git a/meta/recipes-core/systemd/systemd.inc
>>> b/meta/recipes-core/systemd/systemd.inc
>>> index ccc3236457..1417e0150f 100644
>>> --- a/meta/recipes-core/systemd/systemd.inc
>>> +++ b/meta/recipes-core/systemd/systemd.inc
>>> @@ -15,8 +15,8 @@ LICENSE:libsystemd = "LGPL-2.1-or-later"
>>>   LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
>>>                       file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
>>>   
>>> -SRCREV = "2e7504449a51fb38db9cd2da391c6434f82def51"
>>> -SRCBRANCH = "v254-stable"
>>> +SRCREV = "2018ccef6645ce00c784369a22dc4e98f6d7061d"
>>> +SRCBRANCH = "v255-stable"
>>>   SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH}"
>>>   
>>>   S = "${WORKDIR}/git"
>>> diff --git
>>> a/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependen
>>> cy-links-at-install-tim.patch
>>> b/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependen
>>> cy-links-at-install-tim.patch
>>> index 085f1e9052..be231cf6b2 100644
>>> ---
>>> a/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependen
>>> cy-links-at-install-tim.patch
>>> +++ b/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-depe
>>> +++ ndency-links-at-install-tim.patch
>>> @@ -1,8 +1,8 @@
>>> -From ca7d9a8d9c81702af9c599bb79706f12b1a465cf Mon Sep 17 00:00:00
>>> 2001
>>> +From 29a58009a172e369ad7166e16dab2f4945c6b0d2 Mon Sep 17 00:00:00
>>> +2001
>>>   From: Chen Qi <Qi.Chen@windriver.com>
>>>   Date: Thu, 21 Feb 2019 16:23:24 +0800
>>> -Subject: [PATCH] binfmt: Don't install dependency links at install
>>> time for
>>> - the binfmt services
>>> +Subject: [PATCH 1/2] binfmt: Don't install dependency links at
>>> +install time  for the binfmt services
>>>   
>>>   use [Install] blocks so that they get created when the service is
>>> enabled  like a traditional service.
>>> @@ -25,10 +25,10 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com>
>>>    3 files changed, 7 insertions(+), 2 deletions(-)
>>>   
>>>   diff --git a/units/meson.build b/units/meson.build -index
>>> c7939a10f8..219570ab19 100644
>>> +index e7bfb7f838..1d5ec4b178 100644
>>>   --- a/units/meson.build
>>>   +++ b/units/meson.build
>>> -@@ -149,7 +149,6 @@ units = [
>>> +@@ -154,7 +154,6 @@ units = [
>>>            {
>>>              'file' : 'proc-sys-fs-binfmt_misc.automount',
>>>              'conditions' : ['ENABLE_BINFMT'], @@ -36,7 +36,7 @@ index
>>> c7939a10f8..219570ab19 100644
>>>            },
>>>            {
>>>              'file' : 'proc-sys-fs-binfmt_misc.mount', -@@ -246,7
>>> +245,6 @@ units = [
>>> +@@ -251,7 +250,6 @@ units = [
>>>            {
>>>              'file' : 'systemd-binfmt.service.in',
>>>              'conditions' : ['ENABLE_BINFMT'], @@ -45,7 +45,7 @@ index
>>> c7939a10f8..219570ab19 100644
>>>            {
>>>              'file' : 'systemd-bless-boot.service.in',  diff --git
>>> a/units/proc-sys-fs-binfmt_misc.automount
>>> b/units/proc-sys-fs-binfmt_misc.automount
>>> -index 6b1bbdc91e..5ec5b8670a 100644
>>> +index 5d212015a5..6c2900ca77 100644
>>>   --- a/units/proc-sys-fs-binfmt_misc.automount
>>>   +++ b/units/proc-sys-fs-binfmt_misc.automount
>>>   @@ -22,3 +22,6 @@ Before=shutdown.target @@ -56,7 +56,7 @@ index
>>> 6b1bbdc91e..5ec5b8670a 100644  +[Install]  +WantedBy=sysinit.target
>>> diff --git a/units/systemd-binfmt.service.in
>>> b/units/systemd-binfmt.service.in -index b04412e037..63f116e4fa 100644
>>> +index 6861c76674..531e9fbd90 100644
>>>   --- a/units/systemd-binfmt.service.in  +++
>>> b/units/systemd-binfmt.service.in  @@ -14,6 +14,7 @@
>>> Documentation=https://docs.kernel.org/admin-guide/binfmt-misc.html
>>> @@ -68,12 +68,12 @@ index b04412e037..63f116e4fa 100644
>>>    After=proc-sys-fs-binfmt_misc.mount
>>>    After=local-fs.target
>>>   @@ -31,3 +32,6 @@ RemainAfterExit=yes
>>> - ExecStart={{ROOTLIBEXECDIR}}/systemd-binfmt
>>> - ExecStop={{ROOTLIBEXECDIR}}/systemd-binfmt --unregister
>>> + ExecStart={{LIBEXECDIR}}/systemd-binfmt
>>> + ExecStop={{LIBEXECDIR}}/systemd-binfmt --unregister
>>>    TimeoutSec=90s
>>>   +
>>>   +[Install]
>>>   +WantedBy=sysinit.target
>>>   --
>>> -2.39.2
>>> +2.34.1
>>>   
>>> diff --git
>>> a/meta/recipes-core/systemd/systemd/0004-Move-sysusers.d-sysctl.d-binf
>>> mt.d-modules-load.d-to-.patch
>>> b/meta/recipes-core/systemd/systemd/0004-Move-sysusers.d-sysctl.d-binf
>>> mt.d-modules-load.d-to-.patch
>>> deleted file mode 100644
>>> index 98914ae154..0000000000
>>> ---
>>> a/meta/recipes-core/systemd/systemd/0004-Move-sysusers.d-sysctl.d-binf
>>> mt.d-modules-load.d-to-.patch
>>> +++ /dev/null
>>> @@ -1,73 +0,0 @@
>>> -From f75f03ef6bc3554068e456bed227f333d5cb8c34 Mon Sep 17 00:00:00
>>> 2001
>>> -From: Khem Raj <raj.khem@gmail.com>
>>> -Date: Tue, 29 Sep 2020 18:01:41 -0700
>>> -Subject: [PATCH] Move sysusers.d/sysctl.d/binfmt.d/modules-load.d to
>>> /usr
>>> -
>>> -These directories are moved to /lib since systemd v246, commit
>>> -4a56315a990b ("path: use ROOTPREFIX properly"), but in oe-core/yocto,
>>> -the old /usr/lib is still being used.
>>> -
>>> -Upstream-Status: Inappropriate (OE-specific)
>>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> -Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
>>> ----
>>> - src/core/systemd.pc.in           | 8 ++++----
>>> - src/libsystemd/sd-path/sd-path.c | 8 ++++----
>>> - 2 files changed, 8 insertions(+), 8 deletions(-)
>>> -
>>> -diff --git a/src/core/systemd.pc.in b/src/core/systemd.pc.in -index
>>> 693433b34b..8368a3ff02 100644
>>> ---- a/src/core/systemd.pc.in
>>> -+++ b/src/core/systemd.pc.in
>>> -@@ -67,16 +67,16 @@ tmpfilesdir=${tmpfiles_dir}
>>> -
>>> - user_tmpfiles_dir=${prefix}/share/user-tmpfiles.d
>>> -
>>> --sysusers_dir=${rootprefix}/lib/sysusers.d
>>> -+sysusers_dir=${prefix}/lib/sysusers.d
>>> - sysusersdir=${sysusers_dir}
>>> -
>>> --sysctl_dir=${rootprefix}/lib/sysctl.d
>>> -+sysctl_dir=${prefix}/lib/sysctl.d
>>> - sysctldir=${sysctl_dir}
>>> -
>>> --binfmt_dir=${rootprefix}/lib/binfmt.d
>>> -+binfmt_dir=${prefix}/lib/binfmt.d
>>> - binfmtdir=${binfmt_dir}
>>> -
>>> --modules_load_dir=${rootprefix}/lib/modules-load.d
>>> -+modules_load_dir=${prefix}/lib/modules-load.d
>>> - modulesloaddir=${modules_load_dir}
>>> -
>>> - catalog_dir=${prefix}/lib/systemd/catalog
>>> -diff --git a/src/libsystemd/sd-path/sd-path.c
>>> b/src/libsystemd/sd-path/sd-path.c
>>> -index 1af3a36d1d..def502b717 100644
>>> ---- a/src/libsystemd/sd-path/sd-path.c
>>> -+++ b/src/libsystemd/sd-path/sd-path.c
>>> -@@ -365,19 +365,19 @@ static int get_path(uint64_t type, char **buffer, const char **ret) {
>>> -                 return 0;
>>> -
>>> -         case SD_PATH_SYSUSERS:
>>> --                *ret = ROOTPREFIX_NOSLASH "/lib/sysusers.d";
>>> -+                *ret = "/usr/lib/sysusers.d";
>>> -                 return 0;
>>> -
>>> -         case SD_PATH_SYSCTL:
>>> --                *ret = ROOTPREFIX_NOSLASH "/lib/sysctl.d";
>>> -+                *ret = "/usr/lib/sysctl.d";
>>> -                 return 0;
>>> -
>>> -         case SD_PATH_BINFMT:
>>> --                *ret = ROOTPREFIX_NOSLASH "/lib/binfmt.d";
>>> -+                *ret = "/usr/lib/binfmt.d";
>>> -                 return 0;
>>> -
>>> -         case SD_PATH_MODULES_LOAD:
>>> --                *ret = ROOTPREFIX_NOSLASH "/lib/modules-load.d";
>>> -+                *ret = "/usr/lib/modules-load.d";
>>> -                 return 0;
>>> -
>>> -         case SD_PATH_CATALOG:
>>> ---
>>> -2.39.2
>>> -
>>> diff --git a/meta/recipes-core/systemd/systemd/basic.conf.in
>>> b/meta/recipes-core/systemd/systemd/basic.conf.in
>>> deleted file mode 100644
>>> index fac288f7fa..0000000000
>>> --- a/meta/recipes-core/systemd/systemd/basic.conf.in
>>> +++ /dev/null
>>> @@ -1,40 +0,0 @@
>>> -#  This file is part of systemd.
>>> -#
>>> -#  systemd is free software; you can redistribute it and/or modify it
>>> -#  under the terms of the GNU Lesser General Public License as
>>> published by -#  the Free Software Foundation; either version 2.1 of
>>> the License, or -#  (at your option) any later version.
>>> -
>>> -# The superuser
>>> -u root    0     "root" :ROOT_HOME:
>>> -
>>> -# The nobody user/group for NFS file systems
>>> -g {{NOBODY_GROUP_NAME}} 65534       -            -
>>> -u {{NOBODY_USER_NAME }} 65534:65534 "Nobody"     -
>>> -
>>> -# Administrator group: can *see* more than normal users
>>> -g adm     {{ADM_GID    }}     -            -
>>> -
>>> -# Administrator group: can *do* more than normal users
>>> -g wheel   {{WHEEL_GID  }}     -            -
>>> -
>>> -# Access to shared database of users on the system
>>> -g utmp    {{UTMP_GID   }}     -            -
>>> -
>>> -# Physical and virtual hardware access groups
>>> -g audio   {{AUDIO_GID  }}     -            -
>>> -g cdrom   {{CDROM_GID  }}     -            -
>>> -g dialout {{DIALOUT_GID}}     -            -
>>> -g disk    {{DISK_GID   }}     -            -
>>> -g input   {{INPUT_GID  }}     -            -
>>> -g kmem    {{KMEM_GID   }}     -            -
>>> -g kvm     {{KVM_GID    }}     -            -
>>> -g lp      {{LP_GID     }}     -            -
>>> -g render  {{RENDER_GID }}     -            -
>>> -g sgx     {{SGX_GID    }}     -            -
>>> -g tape    {{TAPE_GID   }}     -            -
>>> -g tty     {{TTY_GID    }}     -            -
>>> -g video   {{VIDEO_GID  }}     -            -
>>> -
>>> -# Default group for normal users
>>> -g users   {{USERS_GID  }}     -            -
>>> diff --git a/meta/recipes-core/systemd/systemd_254.4.bb
>>> b/meta/recipes-core/systemd/systemd_255.1.bb
>>> similarity index 98%
>>> rename from meta/recipes-core/systemd/systemd_254.4.bb
>>> rename to meta/recipes-core/systemd/systemd_255.1.bb
>>> index 0c12926bef..daa3a01fef 100644
>>> --- a/meta/recipes-core/systemd/systemd_254.4.bb
>>> +++ b/meta/recipes-core/systemd/systemd_255.1.bb
>>> @@ -21,7 +21,6 @@ REQUIRED_DISTRO_FEATURES += "systemd"
>>>   SRC_URI += " \
>>>              file://touchscreen.rules \
>>>              file://00-create-volatile.conf \
>>> -           file://basic.conf.in \
>>>              ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallback', 'file://org.freedesktop.hostname1_no_polkit.conf', '', d)} \
>>>              ${@bb.utils.contains('PACKAGECONFIG', 'polkit_hostnamed_fallback', 'file://00-hostnamed-network-user.conf', '', d)} \
>>>              file://init \
>>> @@ -29,7 +28,6 @@ SRC_URI += " \
>>>              file://systemd-pager.sh \
>>>              file://0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
>>>              file://0008-implment-systemd-sysv-install-for-OE.patch \
>>> -           file://0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch \
>>>              "
>>>   
>>>   # patches needed by musl
>>> @@ -73,6 +71,7 @@ PACKAGECONFIG ??= " \
>>>       ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '', 'link-udev-shared', d)} \
>>>       backlight \
>>>       binfmt \
>>> +    cgroupv2 \
>>>       gshadow \
>>>       hibernate \
>>>       hostnamed \
>>> @@ -266,12 +265,16 @@ EXTRA_OEMESON += "-Dkexec-path=${sbindir}/kexec
>>> \  # The 60 seconds is watchdog's default vaule.
>>>   WATCHDOG_TIMEOUT ??= "60"
>>>   
>>> -do_configure:prepend() {
>>> -  sed s@:ROOT_HOME:@${ROOT_HOME}@g ${WORKDIR}/basic.conf.in >
>>> ${S}/sysusers.d/basic.conf.in -}
>>> -
>>>   do_install() {
>>>   	meson_do_install
>>> +	# Change the root user's home directory in /lib/sysusers.d/basic.conf.
>>> +	# This is done merely for backward compatibility with previous systemd recipes.
>>> +	# systemd hardcodes root user's HOME to be "/root". Changing to use other values
>>> +	# may have unexpected runtime behaviors.
>>> +	if [ "${ROOT_HOME}" != "/root" ]; then
>>> +		bbwarn "Using ${ROOT_HOME} as root user's home directory is not fully supported by systemd"
>>> +		sed -i -e 's#/root#${ROOT_HOME}#g' ${D}${exec_prefix}/lib/sysusers.d/basic.conf
>>> +	fi
>>>   	install -d ${D}/${base_sbindir}
>>>   	if ${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator', 'false', 'true', d)}; then
>>>   		# Provided by a separate recipe
>>> @@ -754,6 +757,7 @@ FILES:udev += "${base_sbindir}/udevd \
>>>                  ${rootlibexecdir}/udev/rules.d/60-persistent-alsa.rules \
>>>                  ${rootlibexecdir}/udev/rules.d/60-persistent-input.rules \
>>>                  
>>> ${rootlibexecdir}/udev/rules.d/60-persistent-storage.rules \
>>> +
>>> + ${rootlibexecdir}/udev/rules.d/60-persistent-storage-mtd.rules \
>>>                  ${rootlibexecdir}/udev/rules.d/60-persistent-storage-tape.rules \
>>>                  ${rootlibexecdir}/udev/rules.d/60-persistent-v4l.rules \
>>>                  ${rootlibexecdir}/udev/rules.d/60-sensor.rules \
>>> --
>>> 2.34.1
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#192923): https://lists.openembedded.org/g/openembedded-core/message/192923
>>> Mute This Topic: https://lists.openembedded.org/mt/103380516/3617179
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>
>>
>> -- 
>> Alexandre Belloni, co-owner and COO, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com



