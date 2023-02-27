Return-Path: <ovidiu.panait@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1675CC64ED8
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 17:17:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.96605.1677518260694213366
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Feb 2023 09:17:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=MQBSi65k;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1422c8561c=ovidiu.panait@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31RD06P0007055
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 17:17:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=5ibX1ptqV0RIaK3RL78Wxjcv3Xj4xR6YS67el9dQhM4=;
 b=MQBSi65kVVeESluOtfpFHmtZnopFzgC69tWF13v+gs4EvIzYTDawOiVoYlD3PapSiXn1
 qlKpvN4y72GVHLvhvEADybP4FGunHJzH8xA7evbpcK2AlCWkYn42Cdis/jwZq2YxchfR
 OD0rp1VUfQeHgCVjAH0diFF3HDYyNn11MbCff1efT96Ax+1A/ymG8jukRSt5lOOYLxYs
 M02o1nSQND2ppmq9DvOm+lFV/SWszH8gYNekHr46yiIVuOkm3PQo7OZzE1QxUC7GVXyO
 zvgRTj7vV4X/m/N3MJdn+JR+ARXySUVtgxl9u7wEDxiRQi/lSFS71jCTy4y8RLsgbGzk DQ== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nybnwj3ue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 17:17:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V0rlnX3lrWEy+1NGVGrh5s6nd7SdeTm3mSUnhbGi6UYQnfZ9UF8TmlyhtHtMXzVmbK36VwZo7PNV3bQq3DLIs2cjbedtX+VkM5n1Dbk8wWxBtS8bo3sOX+7l0ZPV15XVo6gBLOeuU/zrUTxkNnQcofFTUnCVgwNvcNDRieognC1oKneVcBDD3R4mNDNTRK7k4z0FYfWo9AdqtJckG6rRaQV3sVKplbKsSN2oXE1wBEfYVlDQgMnSY5ugJS9bRClvqZXXbLvmY9l6szakdknwjbvae5ZlPv4Lna39B+ihrxLuhlfssw7NLxB8hjeF5TgAXyNXHV1pmuCHZBy7euxhKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ibX1ptqV0RIaK3RL78Wxjcv3Xj4xR6YS67el9dQhM4=;
 b=Qbld76JPh2M0wjZ8aYbvP/P0pb8SlWeXIUJlXu2rTicNzui0s+ndtR9k+NLzV04Pttzek4TZvlFrd6eb8GuTVDSd/KAO/1irYCxVPCVZiHe3N2ZLn23aud9a3mM9Y1IBv4pE8R80XzlgOijaXeA3SpcZEWn73M9ePg32kqmWVH9kgNR8Gh7iunXdlLH6IQ5EPFSR+Z5pCCLFhZIfqED68jT6gJwiHCVnsKGpFhBGGYoPmQGv8G7aVMwYm3ED3bOsSf3WeyvnqFsFRJ2Jv21MAdLETowAt5w6QX942dzg2UR3FlGnU7G4oNOS3ecvd1l9sjmE99hqpoEe9JtWmy+snw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5327.namprd11.prod.outlook.com (2603:10b6:5:392::22)
 by SJ1PR11MB6298.namprd11.prod.outlook.com (2603:10b6:a03:457::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 17:17:37 +0000
Received: from DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::31f8:d3d4:2c0b:cec4]) by DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::31f8:d3d4:2c0b:cec4%8]) with mapi id 15.20.6134.029; Mon, 27 Feb 2023
 17:17:37 +0000
Message-ID: <bf4b881f-49cd-2aef-5a8b-8c706fbdac7c@windriver.com>
Date: Mon, 27 Feb 2023 19:17:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [OE-core] [PATCH 2/2] sstate.bbclass: fix cleanup when sysroot in
 manifest != RECIPE_SYSROOT
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <20230227154230.3566400-1-ovidiu.panait@eng.windriver.com>
 <20230227154230.3566400-2-ovidiu.panait@eng.windriver.com>
 <fc6726ed127fbd739352dc17cb1f32bb9d6935d0.camel@linuxfoundation.org>
From: Ovidiu Panait <ovidiu.panait@windriver.com>
In-Reply-To: <fc6726ed127fbd739352dc17cb1f32bb9d6935d0.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0254.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::27) To DM4PR11MB5327.namprd11.prod.outlook.com
 (2603:10b6:5:392::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5327:EE_|SJ1PR11MB6298:EE_
X-MS-Office365-Filtering-Correlation-Id: 596f380d-80a2-4efb-ef57-08db18e685a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fYJGHq2s8ssicMGMtOJBPsddB6Qfrwny1nKXllK14D9+T3ZXj5qU8vfky3+t8rXEdY/ZycU0Fwqm9sTXmB1NNvEUYJJQOlejx7i4+38lPf+8O5qWE/+e6VwsXHjsqZdFUSpF022qVor/CtvcnwUtNcVIb6Wq559CMD0xLLXWziX6ZcmLtCIPtmaLqbVNBo1UjODARfiOUDjMv1sHVZnL+fx+B8r2/0P9EP0uiPzzNxYmzAOsdQCZ92r9FFLlcGyK+Tqhjme42/Dj5di3a6QOfcabCJA2jo9NmOAS6x6KJqxnodzoF/DgO5BJEHyYejiCxdxnEbXtIKrKIuVX8193ULKz54ZpwQCaCEGoh5Ab83PP7CwNV/Djdf0YNl/WSUiQNEnhBGbRB7omJrH4+8xsM5nP/F8cmxfocuGcD0T9k/8wBE4sBeIhQQXvqW12xFeztkvk5Ra/V6+a+7w5N5/mg6Ua2yXW5lsqZ2uAZytOPCd1G+7JiEZYObSYFdY8Umu6YTy+NqOgl3l7Qn95PGIf+eFEUxx6bKJPsHMnEqF5a0rXZY8Y7zkdXb8jHdrQAghOnjQFCESvCsMjQYhBwGtzHF2WS9i1JisRHqZNmcepFm35pWZlGeqGq6FOzJsj1WcGCyrA/X1hJ9/rKW0TrkNRfbU+8G2UFsK66fNcemf2AnLtOYD5NvR/tau18aNRqhBd7/CzXYm2RfopG/YziHHLWZanClVVq/leBtITpwNiDNZ5U4wZfkDIt/e0/Vemv9AY
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5327.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(39850400004)(346002)(376002)(396003)(136003)(451199018)(8936002)(44832011)(5660300002)(66556008)(66476007)(66946007)(2906002)(6916009)(8676002)(316002)(478600001)(6486002)(83380400001)(6506007)(53546011)(6512007)(186003)(6666004)(2616005)(31686004)(41300700001)(38100700002)(36756003)(86362001)(31696002)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SmhuN2U4Qlk2N25VNnVqeDRzYVpUV284QmgyS3V4aGU1REZjSXk2QXBIZUs4?=
 =?utf-8?B?UFhDa1l3cHlpLzBYNUR6cWlheTN6WWpNTHZCUUp5SW9nRDJVV09BVk9MY05W?=
 =?utf-8?B?VW9EdFZ5YWtYZ2xxb0FrR1NPQW82QkZVdVBBeXlIeGRlRjJFSXhmRkJyZU1M?=
 =?utf-8?B?MWphTWtDVlB0ajdzbkdZL3REaDI4WjFJWVhqcDVGVWZnQ3JNZVVwVkJrcDlm?=
 =?utf-8?B?dFh0VlNsOXBJMG1LSWdMVkxWMmNvVUdWQnNRc211N255clhDM1NDMDR1NW52?=
 =?utf-8?B?QUtXcWxZMHJUem1MS2YrQzRGRXJLaGI4alVHMWFJTHRiVXNMK1RpTWNyNGRC?=
 =?utf-8?B?SFBKekxZRUo0bWJCYjh2TWdaOWhoZElWQjV0UTZrU0tITzhNRjZNYzlUMlQ2?=
 =?utf-8?B?aHMwRU1DaXN3RjdGck1qSk5CSEI3RmR4M1pnUHpiekVUd2VndFV1RXBSZlZH?=
 =?utf-8?B?enFiLzF6SEpNaDltV3plMVVBeDJXblVFSGxjMHBIQ203SmhidDV5eFhMUG9h?=
 =?utf-8?B?R2NrM3lXWjJGcjNQNHBqcStqdThNUE9mcktabURTenFZS1BiT0xWRVhCT2dk?=
 =?utf-8?B?OXd0SCtLYXdIaFVCdHNmQnR0aHBNQ0gvL1N2SG9mM29wN09tWXJTeURiV3NR?=
 =?utf-8?B?S2ltQ1NoNWptSTViVHJJOWdVTGx5U1ZBUkFad1NVSXdBcHRjUXVQdjZTVWZp?=
 =?utf-8?B?SkhiMTRlN3Q2eklhbkJyZGVIdnJtRDk3TGVmREMvYnZtc0RvR1FBMDRUMnZP?=
 =?utf-8?B?N2xreTFlQU1XY1o1OHczVVI4UEc3d0xYdUxEeUw1QUFNTEJTSzloY3NDUjlS?=
 =?utf-8?B?RUlCdEZIdEptUStzcWxGejBDR05acUZWVUZYSVh4OUY3UVBVaXFWV2FvVVky?=
 =?utf-8?B?RFpYNDNOK0JvY0s1UWJPOUNENVRVeU5RNjg0YnRJSVlJdlhsRUp3RW9rb1Uy?=
 =?utf-8?B?UlY4aW91VnVPLzJ2NUhFUnEzcDhWQXBSanc3ZFZ3ZFNWS1M5TVhRcjdteE5W?=
 =?utf-8?B?RnlPVXhTWXhVQXd4eEVyWVh5Q1JraWhQZkdJNTdXZm1tcWtDWE9UbE9wRFR3?=
 =?utf-8?B?VldRbU0wd1hybUh3ZVhkVGxPR3lCVFlPempZNDVFemV2dUFZQWR1TGxEQkhy?=
 =?utf-8?B?N2hxNkZuTEJQUzlUR0ZkYkVWV2ROVjBna1hodVY4QWE1ZjdUOTNRbk9mMHdX?=
 =?utf-8?B?bG5TWXIzOGtWQjBXR0VsTGp2RXg1NzFlYkhpRkM3cU9jaGZhTUFxQWZJeFUv?=
 =?utf-8?B?SFVzNXZnamt6V290V0doTEhkeXY2YTFjTnMyLzRXUHBFa3JFay9JT1IxUG9C?=
 =?utf-8?B?aVluS3lFM2ZWTG1pN1hpWVo2Kzg2SXFsTEhKQ092djRzRVFkY3c5MENVWTRv?=
 =?utf-8?B?UkFXeXZGeDlDcERUYml2UWZCL0dKNTZERXVUK1J5SDZFOFZQR1lOK00rQmlP?=
 =?utf-8?B?aFJwZzFEcGp5ejlweFMrSVJIOFV1UXhpZ2huY3JrRGZnVVprSUNESnZjWS9T?=
 =?utf-8?B?eWJFaW9BQUdHZjF5SElaTHVFaktqWkY3MXBFMHM4ckJVN0lMZHYxMjN0ZW5T?=
 =?utf-8?B?c0tMbEZNdzE3aDlDeG1zOVl0TnFoU1d1bkNDUGRUeHB5OFltamFLQzIvZnFq?=
 =?utf-8?B?bmlYc0lTenV3T2FQallkcmVhM1lNa2VvYVQ3ejNqaGFySUx2b210aGhpZ0ZM?=
 =?utf-8?B?MWx4SUFHbVNBcFpOWmQwWXAwR1VCYmRQbFdnd0RFdlpJbWpHd1JGOENicVB5?=
 =?utf-8?B?bUNZaVZGVDJ5Mit4ZnNvTlVIQ1gvMlRNYWpEUllrUEF0SGZOYVB5YjRsbSs2?=
 =?utf-8?B?bXFMTVZSY1pjQXZpcUlwUkVQeVlhU0QwdWt0NjU2eTdSNEducm1EazRiaW5k?=
 =?utf-8?B?UXhDa3ZQYlh5T3hWK2NsTTc0Q2M1U1VJNnFnVzg5VC9PNGx2RlhrVlhqbm5u?=
 =?utf-8?B?T1ZnVWdIM2xsMmFCdjJ5Q3JJdzJybXV4L2Nkb28yOHk5b29GWmw4N0EzcTRt?=
 =?utf-8?B?dm5HQStrMDgyQ2N4alFQZnh2cFFxV1V5bTExR1hiK2RwU3hQVGV3YkkwSW9V?=
 =?utf-8?B?U3JvR2oxdlBXZXpEUVZJcjR1eEVSTmtFeHdWUVNRa0hnK1luazc5K0tqWjJq?=
 =?utf-8?B?VThnR0tZbWV3bkVLRlpUT0E5OE5ZeEYzWmpiTjBHKzU0WEtpa1UrNDc5a2or?=
 =?utf-8?B?OUFhQnh5ajl4TGpoMEtRaFlnUUhQcWlDaWVXa21XL1k3c0N6S3lZQzAvckR5?=
 =?utf-8?Q?0GBZJ/VC2vapI7Oe3hzmzwThdDIZkeyxBWJVAOaEDE=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 596f380d-80a2-4efb-ef57-08db18e685a0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5327.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 17:17:37.1986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s/Z50LIe+YyoLMRFp9xuEnoVzpR/LT28A8PvPciVhh2PQSlmd8bmoTXKXUM/OQM3XpZ+arat6Ha0sKEhfLL6bIsiu2/GoR4jzg/hu/ecoAk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6298
X-Proofpoint-ORIG-GUID: 0lDbY3BXNp6C1Lxei3QymgaeElzVYx-a
X-Proofpoint-GUID: 0lDbY3BXNp6C1Lxei3QymgaeElzVYx-a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-27_13,2023-02-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302270134
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 17:17:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177802

Hi Richard,

On 2/27/23 17:56, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Mon, 2023-02-27 at 17:42 +0200, Ovidiu Panait wrote:
>> The following scenario currently fails:
>> git clone git://git.yoctoproject.org/poky
>> cd poky; . oe-init-build-env
>>
>> add to local.conf:
>> require conf/multilib.conf
>> MACHINE = "qemuarm64"
>> MULTILIBS = "multilib:lib32"
>> DEFAULTTUNE:virtclass-multilib-lib32 = "armv7athf-neon"
>>
>> bitbake gcc-cross-canadian-arm
>>
>> update local.conf to force a rebuild:
>> GCCPIE = "--disable-default-pie"
>>
>> bitbake gcc-cross-canadian-arm
>>
>> Failure log:
>> The stack trace of python calls that resulted in this exception/failure was:
>> File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
>>       0001:
>>   *** 0002:extend_recipe_sysroot(d)
>>       0003:
>> File: 'poky/meta/classes-global/staging.bbclass', lineno: 164, function: staging_copyfile
>>       0160:        os.symlink(linkto, dest)
>>       0161:        #bb.warn(c)
>>       0162:    else:
>>       0163:        try:
>>   *** 0164:            os.link(c, dest)
>>       0165:        except OSError as err:
>>       0166:            if err.errno == errno.EXDEV:
>>       0167:                bb.utils.copyfile(c, dest)
>>       0168:            else:
>> Exception: FileExistsError: [Errno 17] File exists: 'poky/build/tmp/sysroots-components/armv7at2hf-neon/lib32-linux-libc-headers/usr/include/asm/byteorder-32.h' -> 'poky/build/tmp/work/x86_64-nativesdk-pokysdk-linux/gcc-cross-canadian-arm/12.2.0-r0/recipe-sysroot/usr/include/asm/byteorder-32.h'
>>
>> In this particular case, the paths in lib32-linux-libc-headers manifest file
>> are prefixed with lib32-recipe-sysroot:
>> $ cat build/tmp/sysroots-components/manifests/lib32-linux-libc-headers.xxx
>> lib32-recipe-sysroot/usr/include/asm/byteorder-32.h
>> lib32-recipe-sysroot/usr/include/asm/sigcontext-32.h
>> ...
>>
>> When gcc-cross-canadian-arm is built, the actual files get copied to
>> recipe-sysroot directory during do_prepare_recipe_sysroot().
>>
>> Because of this mismatch, on rebuild, sstate_clean_manifest() will not clean
>> the files in recipe-sysroot, but will instead try to delete the non-existent
>> files in lib32-recipe-sysroot. This will trigger the FileExists errors later.
>>
>> Add checks in sstate_clean_manifest() for this corner case, so that
>> RECIPE_SYSROOT gets cleaned up properly.
>>
>> This fixes BZ#15045.
>>
>> Signed-off-by: Ovidiu Panait <ovidiu.panait@eng.windriver.com>
>> ---
>>   meta/classes-global/sstate.bbclass | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
>> index af93546b04..edf5c7fb65 100644
>> --- a/meta/classes-global/sstate.bbclass
>> +++ b/meta/classes-global/sstate.bbclass
>> @@ -529,9 +529,20 @@ def sstate_clean_manifest(manifest, d, canrace=False, prefix=None):
>>       entries = mfile.readlines()
>>       mfile.close()
>>
>> +    recipe_sysroot = d.getVar("RECIPE_SYSROOT").rstrip("/").rsplit('/', 1)[-1]
>> +
>>       for entry in entries:
>>           sstate_clean_entry(entry, canrace, prefix)
>>
>> +        # The sysroot directory stored in the manifest file might not be the
>> +        # same as RECIPE_SYSROOT, so the real sysroot will not be properly
>> +        # cleaned up on rebuild. Handle the cleanup here in order to avoid
>> +        # "File exists" errors during do_prepare_recipe_sysroot().
>> +        manifest_sysroot = entry.split("/", 1)[0] or None
>> +        if manifest_sysroot and manifest_sysroot != recipe_sysroot and not manifest_sysroot.endswith("-native"):
>> +            sysroot_entry = recipe_sysroot + "/" + entry.split("/", 1)[1]
>> +            sstate_clean_entry(sysroot_entry, canrace, prefix)
>> +
>>       postrm = manifest + ".postrm"
>>       if os.path.exists(manifest + ".postrm"):
>>           import subprocess
> How many recipe-sysroots are there for gcc-cross-canadian-arm ? This
> feels like a workaround for some other issue which should probably be
> fixed properly instead?
(resending, as the first reply didn't actually made it to the list)

There are "recipe-sysroot" and "recipe-sysroot-native" sysroots in 
gcc-cross-canadian-arm WORKDIR, but no lib32-recipe-sysroot.


Ovidiu
> Cheers,
>
> Richard
>
>

