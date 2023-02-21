Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C5FCC64EC4
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 02:29:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.33567.1676946590617123345
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 18:29:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=JnEEarA7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=141643becc=saul.wold@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31L2KlDP014793
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 18:29:50 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=Gw38YbIlhzkh2amjltU3xbRtYZWiCjD8fu4Xog38s/M=;
 b=JnEEarA7Y61+3UKszIWDm1G/2BG7+bNE/rXbgJhlhmMitiyaaGjhDyMPsZZSuDzIgPWX
 HIGPi3eTePPzAVe+UhEecFxhyLxT35TlVgK9kee7dC9uAUVZD3ji7OeyY1KPoVainPNe
 oeHkUxPNeJWmRL5JI7gQsFqDVXjYo5twrmWP8sAEGJfSIAjxaLvXswb1IBtC32zVcNAm
 BjPUk0pfe2pu/XYjbZgS0dKotWIOHdXcNurdKHlfkBW4T2cQSazxsMUXh/Mco659wL4x
 Lbogik+0ChdUZetvj3XWKcDe3W2Z8/331nKx41SdL1+3eh2P3BU5vEvM+ccxjsbr8CzO IA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nty2pt053-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 18:29:50 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31L2S4U0030331
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 18:29:49 -0800
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nty2pt051-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Feb 2023 18:29:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ql83h8/wX5RDEE+rj3eY3oQPFdHd6PK68gsv5SxkJKXjRDWZDAGh6EYz8BG3iuAJilzJcGajUxkiGmB9R6ReiSNGmDMBHAZ9459YUuGTbPx3Ut/oown2FXs9/Zlxq4fRX4Z8KOycdYQ17MJtKd6wEN8AukPFFvf0lBNOD4sAq34xTvlFKl6Z+Wk5vufVjMl33gPO/WF3JwFy5xGvCfGP4DC7AxodUaDWR/UZk0LeFWuI8i9aD9s+45MmrLFwVkUqHxEvBbPCzEUyJA6GbNkma7/zVR9jIEp0r4HeV8WEzZHl2WTWuZfrD9WF3DVII3e20iCSQ2trt8QqUtWBWeAkfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gw38YbIlhzkh2amjltU3xbRtYZWiCjD8fu4Xog38s/M=;
 b=Ff+oI/jVNbxf13xTYwT15gt62TIpHkBUAYgNxmi2+4Wgq6luZTpA9IX9jtlUPWs72Q+q18K520WwqH+GjhzQtErDRpC+Us0Uo0O73Tkr5k7C7eF6JcsyRLO8oyjOf6tdP99C640bKKI6enV4opZMehZIKwFiuGRYaBCuGy2on9ad/N8VHhladGOFi/399Gjas1zIIuYuBFhAM2YEua7+nmvZipIEmvxKHoabRRsApetMsdurKpWrE3Kjb7SKqsli3HOn8mQcQLAhZpIZY/AbzdOFHSKHyvxIclRlPYzfc1Mlxs+jnB70QPg4Nu14RQ6iANiEZ5WZN/McaI6f56RQkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MN0PR11MB6035.namprd11.prod.outlook.com (2603:10b6:208:376::13)
 by SJ0PR11MB4895.namprd11.prod.outlook.com (2603:10b6:a03:2de::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.19; Tue, 21 Feb
 2023 02:29:46 +0000
Received: from MN0PR11MB6035.namprd11.prod.outlook.com
 ([fe80::524b:83cf:5482:246e]) by MN0PR11MB6035.namprd11.prod.outlook.com
 ([fe80::524b:83cf:5482:246e%9]) with mapi id 15.20.6111.019; Tue, 21 Feb 2023
 02:29:46 +0000
Message-ID: <7b59c966-d4c0-b393-c58a-8162cf826d19@windriver.com>
Date: Mon, 20 Feb 2023 18:29:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [OE-core] [PATCH] package.bbclase: Add check for /build in
 copydebugsources()
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <20230220213022.2898796-1-saul.wold@windriver.com>
 <3a22927134f9d2466964a0c66e4bac70a7e0a8ab.camel@linuxfoundation.org>
From: "Saul Wold (local)" <saul.wold@windriver.com>
In-Reply-To: <3a22927134f9d2466964a0c66e4bac70a7e0a8ab.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0103.namprd05.prod.outlook.com
 (2603:10b6:a03:334::18) To MN0PR11MB6035.namprd11.prod.outlook.com
 (2603:10b6:208:376::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6035:EE_|SJ0PR11MB4895:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bae9def-6a89-487e-24c4-08db13b37f62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	niZ5WLHElBPHIxt8B8EHvJ62rQsxyfOD4GS1SYHdk3hExH3JQDuaA+wzPduRNAsON17VvF2pBGmLeJXIcmYlOjFfxmsbqXQC8rMF3V0ZpmE9DRGnYkG7rBKMSZdx3CuOofhVHi2+ThWoQmbtKpsY1hvkTl90/beyFG3ZrsUv6fMN7x6vk/SvDhoisM8yZgQzFkNVZQ/HVObA3BbZLVtZG7VRqDmtrmiHrHQXKoem2yejYTsksSx7nB+KF+u4mNNaMLgSlnmiIGh9tO4trw1meVi36FvibrXSKeOnA6kPGpLBLipKnWJVT0U/qGU+MPNyRAVij07MK55iFQCoRGSCs50U8G0IkgR/h3H2xa9RztGNeuZFUT0erjT/mv0OFxa8qpTYmZNYwwNqpuDajhnhSrrTqPEkvZfV4VogIkNbjNAjjJnv15VX6V5Kidoi3altMYZsNrqcRmydy8u+S/Bb+stkyNqhnfUieo3OS86vgYPRqB3SWPG0c8goCJzoUOPQ8PqGi19/+jjDO7Jd63ZclEQmib6hY+ZFuGCigaFDr1RK+wDD17EmW50DEj9/GZcMY1s7FN/vlMoziHUvLFh6LS6RK4FZi9wzGj7s9Mc3r5Yw2YVrcAW/k8hCqMEXvkEQ+RGvAqq8yNKoJXoP3LW7hDCrrgIWqyY6gTj8cf7eebNKRLk7mfwPuIl4FAwTjpsKTVUCjZNlTIyrNFlAI6/5OjkWceTWRRa2q8vZkbHTeU4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6035.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(39850400004)(136003)(376002)(346002)(396003)(451199018)(36756003)(478600001)(6506007)(52116002)(6666004)(8676002)(2616005)(53546011)(316002)(41300700001)(186003)(66556008)(66476007)(66946007)(6512007)(8936002)(86362001)(38100700002)(6486002)(5660300002)(31696002)(2906002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?amEzTXRsSG9xYy92NDM0dmliQThxTW9LczBPVlMvdzBnRjVuVlF2c1N6U0dO?=
 =?utf-8?B?NGF6aGNRMi9rRncvRS8wc0NXMXBXNTRzanlJbStyYmRYSVp0YXlEL1J1bUpY?=
 =?utf-8?B?QmtxclBGd1pWUXZoazgzZHdPdXh4VHhlVkk4NXY4ZkdxY2I2NmdXQnExd05B?=
 =?utf-8?B?eW1NTWRTaVpOS3B3MENVL3BlOUZuQXpveFNndFZEUzM5UUhhbjNZWFV2YVJ0?=
 =?utf-8?B?dzRLS1FNK1BFVUgxa2d2VmNtUU1tSVdjR1Bpdk9tZlQ3cUhkeERtY3V5Nm1y?=
 =?utf-8?B?UkNnd2tXRGZld25Od2ozNFV0aHhaWTBMdE5GTmlUTmM5SElZeDhXNml2c200?=
 =?utf-8?B?TEtOb0R2ZlV2NGl4R01qUVU2NU9SeGpNQU1tOFVLWGs3NkoxUExOZlhWc3Ex?=
 =?utf-8?B?dGRPQTIvei9xdTJtenEycENSaEVMVUZqaEVhUzc2UWVndFBFOHV4cjBoK0sy?=
 =?utf-8?B?OGxld3AvK1E2c01CcDRDWFJrbHlmbkdKdm1zWm9IUUt6MGx5RjZmWXVSOGtS?=
 =?utf-8?B?MnUwZm9NTkNwZGJDUFkzaUZSc3B1aUYva0NFbmE5MEZhbjFCQ1dpc1Q3Mmor?=
 =?utf-8?B?NjJtVDErU2VzN0ZSQlJaTjBpVlUyRnFKcjhoYjBaS2hoVVR3d2tEcDhEZVhR?=
 =?utf-8?B?aWhMajl5NGtPNkU1d01NMzFNVDRHamlYbU8yNnJjdDJNM2pBZWUxTGhvV05p?=
 =?utf-8?B?dkdrcUhGTzJlczlqdVdqRVJtSTRJaTZ1aVFSNzRMcktPQStEQ1pCdms3SDVY?=
 =?utf-8?B?SzRkU0ZpVzRsOHZyK0pmc0VzVVd1Z0ZVL1JVcWtFRlBCMmZXc1VWMlpPU3Rz?=
 =?utf-8?B?WkNsVnN1L2RKVnRpZ0pBajlhME5ENEU2dkcyMm9yL1cxa1NmOElnV1ZYQ013?=
 =?utf-8?B?dEtBbWI5RXRhbVJBczJzMmtGZzhWZ3FWY1dXSzNRVDN5ZDgrZFhXQ3BiNzBD?=
 =?utf-8?B?Q1FsZ09kUWl6K3orZHlXdWpmRG5VUVYycGdRVk9xYXZjWWNIV0t5bVN6dS9L?=
 =?utf-8?B?MDA4OXlFSWpsR3F1Z1ZHZUV3Vy9scDBuUWhqVXhSUXZwZWg2a2FLQmkxeHc1?=
 =?utf-8?B?bTdGZkJsSDR5QTVhNkNadXYrRzZ3S2xOMmhNRCtXS0VPeUVDbVdsSGZ4TFFa?=
 =?utf-8?B?WmppV3UvUXJZQjE0cDA3NEUyUWVUalpVajV2NTZ0U0hZK1ZLTnZOSUoraG5j?=
 =?utf-8?B?NDN6MEtJQm5KajZWZzZuNGxsd1E2YkNsV3BCblVEdmtFVkRINTVldEo4Q081?=
 =?utf-8?B?U0NOaHVGSkJTcmI0MGV6Q2plRTJmclIvUzBRV1VPRmt3TzBwZlJqQllvangv?=
 =?utf-8?B?cXhhZ2xkMGN1Y2x2c2g0NFJtRlVZMzh1SDFjNW05OXYyU2NoUyswTUVqcUp1?=
 =?utf-8?B?UlhjSFJGRnRaVm9jODNNT1pKS2dJamkzZFFYbkdhbnFRN2VtbW1iK0loSzI5?=
 =?utf-8?B?eEZnT1FnOGlMWFp1bW13UXhBcFF0Z005SHROazFmTlRJK3ZNOTk1ckxITlhn?=
 =?utf-8?B?WlNwYUk4M2tDOThHTnZ5QU1QNGdlVVRvU0RORmNpVUxNZUhVay9VaXBIalpW?=
 =?utf-8?B?YTQwYi9VbHJjSm9sT3pqVTJQQk96MkxFWE4yZmo1S1J2TThlZ3RvUG01Sy80?=
 =?utf-8?B?Wnd0SVJvQkdmMlJYUFJXQlZzemNVQ3c5U0hMRWRIU0phSC8zcmprNkZRaVB3?=
 =?utf-8?B?bjFmRC9ZVVJXQkNJYW5zN1E2aXdLbDJjUHlmQTRKVjFNRnE2V1IrMW43c0FL?=
 =?utf-8?B?K2hwUUxRbnZrOFdHYmROaXZ1cTc5K1dIZnZyZzkyc00zb0s2bnRJVFNWbTg5?=
 =?utf-8?B?U0lGOTZvVXNpclJnR1lXa01IamE3bXowbzVhejVaZGVJV2ZRUzgzZVZxdHVT?=
 =?utf-8?B?RDVnNk94UjgxQm84bkpHaGRHaTE0dnJUbkptZXJjMllqUDZhT1BtbFlwY3I2?=
 =?utf-8?B?UDFlMjRaTnlvRXN0S3IvZzl5N3Awa3NTcFN1dWpPNlRCV2VyZTdISVBRNGhT?=
 =?utf-8?B?OVczU21NY3VKNnQ0cWU0Um5XREFCa0RyYWIrd2JZclZDdVhjTzFmL0xEL3ZZ?=
 =?utf-8?B?S2FDeTd0NHRPdVpFTzAxNUxIUkl3cWdUeUpXSEVTWjZSMXFwemNaNnl5b25P?=
 =?utf-8?B?WkVXUTZ0bndyWkdYNVdvbzNaZ21Jd0xrR3JNeDA3YkhaVytXV0trNlVtYW9k?=
 =?utf-8?B?NmlacHlERWVXUnJCdER6dzE3Y2FaWTJ2bHVidzFRRVo2WG5SWm5QQThaaVhQ?=
 =?utf-8?B?VVZNeVJZclNQTU1NQmIzZHl2aW9RPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bae9def-6a89-487e-24c4-08db13b37f62
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6035.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 02:29:46.2612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UA/ha9TfbFgLjej6+dxxihhhTVIAHKH0pjoeQc35LOSMV6n6ctmkYZENwNf4VA8QKBkTS2OTgkBfyVItsSLiBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4895
X-Proofpoint-ORIG-GUID: JqniKHHavmyv6Aqd_3KWOOq92mwcmDns
X-Proofpoint-GUID: YNhSsdLmsYGfXrdf9tDbCNVUkBhUj_LQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-20_19,2023-02-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302210021
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 02:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177479



On 2/20/23 14:40, Richard Purdie wrote:
> On Mon, 2023-02-20 at 13:30 -0800, Saul Wold wrote:
>> This is needed when the SDK or eSDK is installed in a /build top level
>> directory as it conflicts with the build directory within the existing
>> /usr/src/debug/build (which is really a link). Rename it and then do the
>> copy,
>>
> 
>> this is not an issue with master currently due to some other
>> changes that occurred in master.
> 
> Is this an issue in master or not? I can't parse that! :)
> Oops, sorry this is meant for Kirkstone branch, their is a different problem in master since the code was refactored a direct backport is not possible.

Oops, sorry this is meant for Kirkstone branch, the code in master was 
refactored and seems to have solved the problem since /us/src/debug now 
has $PN/$PV components in the path.

I will resend it as kirkstone specific.

Sau!
> Cheers,
> 
> Richard
> 
>>
>> Fixes: [YOCTO #15026]
>>
>> Signed-off-by: Saul Wold <saul.wold@windriver.com>
>> ---
>>   meta/classes/package.bbclass | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
>> index 8b11fdd155..2950218145 100644
>> --- a/meta/classes/package.bbclass
>> +++ b/meta/classes/package.bbclass
>> @@ -636,6 +636,13 @@ def copydebugsources(debugsrcdir, sources, d):
>>           # Same check as above for externalsrc
>>           if workdir not in sdir:
>>               if os.path.exists(dvar + debugsrcdir + sdir):
>> +                # Special case for /build since we need to move into
>> +                # /usr/src/debug/build so rename sdir to build.build
>> +                if sdir.find("/build") == 0:
>> +                    cmd = "mv %s%s%s %s%s%s" % (dvar, debugsrcdir, "/build", dvar, debugsrcdir, "/build.build")
>> +                    subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
>> +                    sdir = sdir.replace("/build", "/build.build", 1)
>> +
>>                   cmd = "mv %s%s%s/* %s%s" % (dvar, debugsrcdir, sdir, dvar,debugsrcdir)
>>                   subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
>>

