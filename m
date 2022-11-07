Return-Path: <xiangyu.chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 586CBC433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 02:27:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.5811.1667788040793098343
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 18:27:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=AWewJEip;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=83104f160c=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2A72QscN013016
	for <openembedded-core@lists.openembedded.org>; Mon, 7 Nov 2022 02:27:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=2PkNa+nz6urPLv8SB+xEnqS0c27b33U6AdsPU3Gdzu0=;
 b=AWewJEipfj5uwd8Ml3fDSA693mL2KSigj4aH1cCMi+AZHRt+kBe8ynjPY4Ms5TMfMrw2
 kdAbEBHgh+bUSDP2n6di1lRT0fTi/mtD3dZ5V9PaaOMikvTrJdjHmDhdOuVAF/XYNtpe
 OG2cjDxAy/a8iMo6Dawb1Q6ug36NEEkOE0zGakw4q4s9MMgi+N0MyMLY7fQe0vECJWUV
 IC19dqs6n5KtT9Vs87ZsCwP5eBaaPjq28PuJhy5L0JZdc0Xs8StLpBwPMOH1bBR/9PiH
 tDa9Ss5whNg/3CgQt2L5Sk0He9ctn/VvERC4SJXTWfd/bCgz79fO2Vu+5GgMO4MavIPa pg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3knd21hbvr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 02:27:19 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A72RJgN013695
	for <openembedded-core@lists.openembedded.org>; Mon, 7 Nov 2022 02:27:19 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2043.outbound.protection.outlook.com [104.47.74.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3knd21hbvq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Nov 2022 02:27:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ExQAR/vr5T8KGHZ6bAjfD4IbBhdF+zECzFuv/5hb+1sneSDcKD5qdVdCYuqtNu1dQBoGUd66rzzgRLYL5pGC0cj5VCAl3MIA9eg3DSUay36PdHohzrLmJD0fXv3yLQsaIjfyw9HQU6GIS0A7LmiX04IWRjUbbaEi3e7CAAPhh7RFQ5PoryCTdGC7JtDc86hBLLI+XdWSdjMD4QYkMm5pGDql4XNuImJhCk+dsN9cCQ+yE3xSrXp+0RMsOq2W7d2/xsT+7EIhrbQtSilqfmt2hiUNWT7kkPBqaXsqmt2OfDX8wPJUjecHTPwwkhGGC4lXg8Icjj4+B2rGAKiA3wumSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2PkNa+nz6urPLv8SB+xEnqS0c27b33U6AdsPU3Gdzu0=;
 b=TEHPU3LmS2v53wxmP5rgQoI6mHZGT+hId0uvfBieMOBAfS4eJJdoFVcAp8ZiM4m3d+HrrnXmFX6oRGJPcjAjEpkKtXzVp27Dwrc7uCI0wU9SCFsqZqQwsYuUG2nUy7TYr9WL0n/+Eb9owaOXczGVas+3R0ga8LEMXV+eOVU4U+mcZXQAgEpfS83hbtpsRpH5SREDthPJ0KWu/QdLcN6+JxUWQXVfAejozvsTH2md0jRaKXvWxwSSc7LqzHyx7fAsinhjXbNWI55AbpN25gDQBTT6Vhvcmgzp7JiBngqLp9qgpbw0RomQKY8XZQ9cQ7a7x7ErNTLEbdG8z8pF/hU6uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by SJ0PR11MB4991.namprd11.prod.outlook.com (2603:10b6:a03:2df::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Mon, 7 Nov
 2022 02:27:15 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16%3]) with mapi id 15.20.5791.022; Mon, 7 Nov 2022
 02:27:15 +0000
Message-ID: <5d70bfd3-037a-444e-e302-94dda8ed7ca9@windriver.com>
Date: Mon, 7 Nov 2022 10:27:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [OE-Core][master][kirkstone][PATCH V2] rng-tools: Add Arm aarch64
 CPU specific configuration to address excessive CPU usage on startup
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <172352CEDDCB35BE.6436@lists.openembedded.org>
 <d26c2ba8-eb2c-5a72-e7ee-e1ad89e95444@windriver.com>
 <CAMKF1soeerVU3hLV+UG7HzBkNkN2MYddoPj3S49oQg=fHRCbcw@mail.gmail.com>
From: Xiangyu Chen <xiangyu.chen@windriver.com>
In-Reply-To: <CAMKF1soeerVU3hLV+UG7HzBkNkN2MYddoPj3S49oQg=fHRCbcw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SL2P216CA0148.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::19) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|SJ0PR11MB4991:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b51e5c8-09eb-4620-4735-08dac0679567
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0DMHfJ//X4phlfnt2DNyAlk+y9D+0UhWe1VjlFqkCITfVyxmCQ8fnv3rOnfi4zOso1JqX2d2OW064M1szjAVc6ZHP0oIxMcEt5aviwBiwGblXBEgmOcfR8ZgSSModP4eqBOaBsL//wEhl9Lftt/8tjRQ1DF3etw/v+XCbwwni5ckor0mY0MnsqwO28zQLKw1SGvZx+qmMObztspi4yD312s2pthBoSvicMZOcl0z/K/sNL++Ee0jKyYAZed4sqRqFtOiX5ZJf53MEQ39FfboUVdcGuO7Yb25tKA0m+RymzxQkbBU9YhcjjU8L13UtrxxG43kyCOYLNyrq9QC50jrZI96651tAX37DF/KLzQy9HOdK49jP3OHrc0mjVQKA9rldzFnJBUjJTK35RCzAF8zaxG/EHf19aFa5GBKUJZ65I8HA6a5PL0c8JWYflnF4eHoioaFFrEAE/2dR7FzFQU4fzAbTtO+tFGZZDg3NWJQtQbOkMEWv55ZLDYnzGK5/Vtz/K/J3ito8cTaPh1cZ33dyHjSFGfwPfD65WZTukEP0Wz62Zx4+k8NiBwR1Izad5AyI2s3+2G6omlLSFcjtDMPvni8t2AGwfkGuFs4XWoANLS3vYeFn7X5GQyh+/pW5azbp5y7aZPsaAf7oz6M3kbSL5uL0IX3xYmB3b+rD5B8wPjSPNI9Ltnkc8ig0FDmlENiO+rdGVG3a0EjcRbQg6nKDRRGuzfG8jTa8/dp6/1KSeTWGcm0pKMmkXsl7hwQrtsMhd4UuapSghYtkwoCT193ZWzsSFUKM+h7CkYhnDrS2vm7MFf/ygex+P4x4bSjdeEtInXSz06xwJLd0Y8/aeQ8zkiKup47aqryFK4o7fRRAec=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39840400004)(346002)(376002)(366004)(396003)(136003)(451199015)(66899015)(36756003)(316002)(6916009)(5660300002)(966005)(6486002)(83380400001)(478600001)(2906002)(4326008)(41300700001)(44832011)(8936002)(66556008)(66946007)(66476007)(8676002)(6512007)(2616005)(186003)(31686004)(26005)(38100700002)(53546011)(86362001)(31696002)(6666004)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q1ZyTjJ2bHNVMkxxeTZvSHQxc2R5TnRkSHlyWXJHa28rdDhiRFArTjZXTUN5?=
 =?utf-8?B?a3duSzQwbGVKVFFLSndDZFZFOEJQRkNZelRBak5WS1NkWTBwV0ptb2hoL1Vo?=
 =?utf-8?B?OG9pYlh5WHFlL0dLeHEydHVBYk0yQ29JLzRCS1pZRnBOZjQwTjk0Z0dHSnk3?=
 =?utf-8?B?Zk12Y2ZRTjBmYjlxci9lVzQzVWRUNGkvYTN5L1lIYjJ5OURYR0Z1TkNzYUw5?=
 =?utf-8?B?aVJ4aUl2aExFdlVHbGJwZmdMQ0tINXFFcGhaSnZiNVMwUTdmVytBZzJWTEJD?=
 =?utf-8?B?eFpRZ3dBRm1sbmo2YytxZEo2MDd0b0JNYXRMWEI4MkIrTXlQOHdnZkQ0ZUdZ?=
 =?utf-8?B?c3E2K2c5RnoreVNXS1ZlZEVMOFR0T3FGbTd3b3c0Sm9FQTRmY3d0SE9zdnJK?=
 =?utf-8?B?dEhhQzlNcEtzT3ZLUU04NTJyWUQ2azlNV0xiZUp3ZWZrOW1Hc084S3NuaCtT?=
 =?utf-8?B?OU41NXZmUGM0dTJiL1F0Tlo4bGJTbmVoVnJnT09WVVRoREhVQjdrVUV0UmFN?=
 =?utf-8?B?SCtsQWM0M2kyTVVzRlhrdlBQN3hNRmhYcTRUa2M2MEFNTk5OUFhHcTVCTkY1?=
 =?utf-8?B?U3FXY1BKQ0JZSVc5ZHVMbVgrdjNGSlBjNUR4bk9kMGNHTG9XY1NVdHlvQVNV?=
 =?utf-8?B?Q2E2OTBZaVFoRk5vOEJiU3BTeFd5WFB6TmgwVW5kcDRnOFdQYTE0VzYyWmwz?=
 =?utf-8?B?Wm9adm1KUXU1azhNZy9kS2ZUc3czR05mV0cydkViSGJ1VXZuWk8yWFNxVSt3?=
 =?utf-8?B?MWVSTG1udFNUb3YvemMyc0RGU1JhMnh6Y1pXWUhIcjd0R2ZjMmxCaWJqV2Fr?=
 =?utf-8?B?NHQvWHV3MGhSNWlaME9pTFhmb0g5OHY3THNLVlFLYTR6VVE4QVBRTFpMS0RS?=
 =?utf-8?B?dmVveC9zQUhMa2s2YThMdUc3bzNTMVNQd2lzOS9udTJBQ2dZaEdrZURzYVNZ?=
 =?utf-8?B?L2dSa1g2Uk5jbkxQUGp4ZE1rcWxPVFF4cjRPckRETDR1cHZRbmFoaGluMEhu?=
 =?utf-8?B?bm5jMG1iNko0MFJjUzVadCs5RnA1L1k5djU3Z25xMVpoeWo2RWpNVGJ2Nitu?=
 =?utf-8?B?SHB5eDdDUExzOG93OTZtM2UyejdScGFWNWpMZ3JwN2JQTXc2WVZKQ2tZamkv?=
 =?utf-8?B?cHh6YkZsdGpLRURaZFpLTlpneG5rTjZlbE9aUkNMWXFBOHVxQmgwMVFVSFNz?=
 =?utf-8?B?UTV4Z1pwN1VRT3VpNjF5VlFIVCtqcWw2VCtjd1BCQWVYdTVnYzRlV1FmUklE?=
 =?utf-8?B?MmFubjlLdXRsWm14UTlOck9VZitnRDVMdnFRdTJBQzl1TlM2N0ZWZjVUV1lr?=
 =?utf-8?B?RGs3RDNNRjJMQ0d2RDlpcnZjZEZMQVhiNWtkK2EySUpwUEF0aHJpSWxlY1Z1?=
 =?utf-8?B?UVFTek9pMkdsblRrY2IrRzkybDErWmNveGJOVW11My96TjRoQW5zcFduWEpl?=
 =?utf-8?B?UGk3VUlrOFIyaWx2OVZOUkZ2NnBqUXRLYTd5REE4SGNKUW84VzBEdC9Oa0xL?=
 =?utf-8?B?SWxMQU9DZWJpNGhOTWVYK095V2xQUHBVdFYzdk5vK1E0UFo4L09JZHNYZFRy?=
 =?utf-8?B?ek9JOWNONjN1dlJ0NzRVVjZZQ0VGTVBUSnNCQS85bWdMc21ZWHF0eXZ1cy9o?=
 =?utf-8?B?N0kzYndPbXdxekt1OGtpQk1wNnVDT3QxS2poZGRhNjRYN0ZpblVMZjU2Y1hL?=
 =?utf-8?B?OXVYUFhqVC92U2JZTmdLeVdLaWJwVVljV3NYdkZHY3pzTXBQNnpWemhaN2R5?=
 =?utf-8?B?eGZDcG4ydFdwMFd5MzY2ZXBiY2wvN2pSQ2dBUmlsclhTS2ZZK2dEbVpKYnEz?=
 =?utf-8?B?SHdHK2YrOTA1OEFPeFpNRC9nWjRUS0d6TEIrTmJwblBuUCtFMDdkVkw4V3Zl?=
 =?utf-8?B?OHRBeG9sYlVxV1kzUXNwY3J4R2M0dHU1SjdGUHljYkNhQWR6MXk5bzgyOUlk?=
 =?utf-8?B?UktoUGdmcGVIMkNoYVhWbXVFZ09aL2lyemt2Uk5ERzVLUlQyeEZKOUpXR1ZJ?=
 =?utf-8?B?TjRmYWdEaWI0REZMVGQrS1I0RncwQ3VaNWVtN01XWVVaWE9BRGttRTJENXBL?=
 =?utf-8?B?ZUt2bVJPWDhjZHZzYmdjM3NGRjZuRDBQcXhzVXlZcVlCZG5xZGVjcnFqcW1v?=
 =?utf-8?B?TWhhQTNBaXBYNVJwQnV6NDlMSlJ3MDcvL3VnejNvcU9mVUlBN0tmVXdNVFh6?=
 =?utf-8?B?bWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b51e5c8-09eb-4620-4735-08dac0679567
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 02:27:14.9887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hx+yOaFjSwf77hSYMR+R3Epsf6XJyMUEYIi7CU0VtcKwyarC0MTErvGc6IouvOaBp3gJmwAenZd2SoHb38r+h2pWRo1Mv48JdbYMUveQoqY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4991
X-Proofpoint-GUID: HWJxvHeC8f38eIsAzR0b-XF0gi0N5Rka
X-Proofpoint-ORIG-GUID: 57G_asa32q_cj-Jss0dcwpAi3xk8scf9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-06_16,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211070018
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 02:27:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172821


On 11/7/22 10:18, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Sun, Nov 6, 2022 at 5:21 PM Xiangyu Chen <xiangyu.chen@windriver.com> wrote:
>>
>> On 11/1/22 09:48, Xiangyu Chen wrote:
>>> With the default jitter options aarch64 CPU-based devices typically experience continuous
>>> high CPU utilisation for several minutes after rngd starts.
>>>
>>> Accoring to the rng-tools issue #150[1] and comments[2],in order to address this,
>>> the following configuration changes have been made, those configurations
>>> also can be found on Alpine Linux[3]:
>>>
>>> - reduce the number of threads used to 1 in total, rather than 1 per core.
>>> - reduce the buffer size from 16535 to 4133 which reduces the time taken
>>>     to fill the buffer (and so reduces the duration of CPU load).
>>>
>>> [1] https://github.com/nhorman/rng-tools/issues/150
>>> [2] https://github.com/nhorman/rng-tools/issues/150#issuecomment-953079212
>>> [3] https://git.alpinelinux.org/aports/tree/main/rng-tools/rngd.confd-arm
>>>
>>> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
>>> ---
>>> Changes in V2:
>>>     *put the aarch64 specific default file in meta/recipes-support/rng-tools/rng-tools/aarch64
>> Friendly ping. Is there any more concern on this?
> My concern is that will it be so for all aarch64 machines ?

I tested two aarch64 platforms on my hand, zynqmp and raspi4, the 
rng-tools behavior is the same, when service start, the jitter random 
generator would load full cpu cores load. It would cause other services 
take long time to start. I also checked another linux distribution, so 
far, only Alpine Linux processed this issue and it applied those 
configurations on all aarch64 platforms.


Thanks,

Xiangyu

>
>>
>> Thanks,
>>
>> Xiangyu
>>
>>> ---
>>>    .../rng-tools/rng-tools/aarch64/default               | 11 +++++++++++
>>>    1 file changed, 11 insertions(+)
>>>    create mode 100644 meta/recipes-support/rng-tools/rng-tools/aarch64/default
>>>
>>> diff --git a/meta/recipes-support/rng-tools/rng-tools/aarch64/default b/meta/recipes-support/rng-tools/rng-tools/aarch64/default
>>> new file mode 100644
>>> index 0000000000..5a2fbcc9ef
>>> --- /dev/null
>>> +++ b/meta/recipes-support/rng-tools/rng-tools/aarch64/default
>>> @@ -0,0 +1,11 @@
>>> +# With the default jitter options Arm CPU-based devices typically experience
>>> +# continuous high CPU utilisation for several minutes after rngd starts.
>>> +# See https://gitlab.alpinelinux.org/alpine/aports/-/issues/13035 and
>>> +# https://github.com/nhorman/rng-tools/issues/150
>>> +# In order to address this the following configuration changes have been made:
>>> +#
>>> +#   - reduce the number of threads used to 1 in total, rather than 1 per core.
>>> +#   - reduce the buffer size from 16535 to 4133 which reduces the time taken
>>> +#     to fill the buffer (and so reduces the duration of CPU load).
>>> +#
>>> +EXTRA_ARGS="-r /dev/hwrng -O jitter:buffer_size:4133 -O jitter:refill_thresh:4133 -O jitter:thread_count:1"
>>>
>>>
>>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#172819): https://lists.openembedded.org/g/openembedded-core/message/172819
>> Mute This Topic: https://lists.openembedded.org/mt/94701000/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

