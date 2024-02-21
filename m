Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9987DC48BF6
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 07:18:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.8100.1708499935316560645
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Feb 2024 23:18:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=YURI5JEu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2781bf2bed=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41L70B5L023863
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 23:18:55 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=ytRXbl2qVExrVVYspsVDEr92OZp5l0iQps20m7/GSn0=; b=
	YURI5JEuUorrdkbB4GcJ973yhZ8lhAszCwrUZJSpuhquxY/15u+I4lGse2G1Ch4a
	+PrETmKXURfl3kOhTI9bKSo4JYtU7vhVQlyahNYA3jtQ0QOlSdQ4viW5nY2JJ8OA
	QLmSkOpOceUNe+iM2ONksradzBII/LreY5SyrG3RIc0KoeRQ353JrmuxaW7Q1xYy
	FekcUQRLXhviVU62w4aKACxcUapfHibf+TxXLdzz05xpxpbIsj54WaJMQKAkCg4q
	I0PPtasByqJzqM7C/UqwQNYd9BE6BnB1S0AaH5KjupU1zQkGv/1cqw49EnOwFzyl
	AuktHTOHj7VvxS2WKx0/6A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wd20crge3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 23:18:54 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 41L7Isu7016599;
	Tue, 20 Feb 2024 23:18:54 -0800
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wd20crge2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Feb 2024 23:18:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g6eUvMzEbJy3D5zLmDimEEwNtGARyf0XicDxJARZv57CtYzIHrD7kV84ZswtWonzEyOndAIZw9BRL732cUQggFU1pVl2xXdsP6lCT2W87ahsRdVrYwwG2VcCJ0mwf0BX21jS2qqPOtzBEomASio4kYUn0Iqvx6L0KRXFcQyCuQOsF4PGDNhvCZ9gwlYx2yRd7HAl6ZJLUNiMICjeDQtYadd3CbUtG/k0qDP6njPrLOBeubkX90a7rn6LuEwZnhVDYz5GJybxWEb6nttYEueP4+GnbeOkTO+kLftPWWAFoyct66HBtiKGBhrN0g+lH/GRn0Y+oPbC8B+0tNwzLLWL+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ytRXbl2qVExrVVYspsVDEr92OZp5l0iQps20m7/GSn0=;
 b=oFFG4jnUP3FGGQkWCZYgIW6Mh1UGNzejh+u7xwvk0oIaFJbB2ikngaN/dDEh005+QMgAzVMliPKrIJYxL/xhc2a1RcXew4ISErjq1jkTSY4QFuejH7pv95mvMbw05wg/SjbIFIthc12oA/8gJVA74TVHlbN5UrQILWKij+HbAH/dSBiuImy9wS5CtRcZ4HtV0QcNSEVjkYUVBdnmZQcex1fCpCcGnQXpoimQbIxIJdx/JUpOyrWCp3ZjzwTBvV3GHBrmqgtwvo7y2epXdK6pJS763aa7zvIbjG9XCBLZ3gw74+BpI1qnoaigC/TDXmhuWfSSsHMRrimad1tYnC9/gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA0PR11MB7305.namprd11.prod.outlook.com (2603:10b6:208:439::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.22; Wed, 21 Feb
 2024 07:18:50 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315%7]) with mapi id 15.20.7316.018; Wed, 21 Feb 2024
 07:18:49 +0000
Message-ID: <b128ef22-03b4-ebd7-1b2d-40b2d8ab2201@windriver.com>
Date: Wed, 21 Feb 2024 15:18:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core] [PATCH] sanity.bbclass: raise_sanity_error if /tmp is
 noexec
Content-Language: en-US
To: Ross Burton <ross.burton@arm.com>,
        "michalwsieron@gmail.com" <michalwsieron@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20240209140939.186588-1-michalwsieron@gmail.com>
 <94AE8BC1-9AA9-4DFB-B7B6-80CC83897ACD@arm.com>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <94AE8BC1-9AA9-4DFB-B7B6-80CC83897ACD@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0377.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::22) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|IA0PR11MB7305:EE_
X-MS-Office365-Filtering-Correlation-Id: fbd5e16a-42aa-4ba8-1586-08dc32ad5998
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	odAR9TO982zWacbF3yO4Izss685CJAMWhZQG4rhZ5yqP/FlsTmqqd6nVcZpZp215WEx03jjbnABII0x57KFmM4tUzII0mI2Z7eLUnT7CM+Np7sRHd/GvbETSl4p06GTHpZmvYgvvlu9mO/FUJWu9Z2DQIAnx5qffqUDILNaFd1w0yJmWTPfej9bSZ5KqDzYMhrPChD3XgDRrMYm2mKeg1tskX+eA3k693jAtq7h2uFNmlGHL0y+H86+FSJvpy8YSmZsXBOOI3VCNslaOIk8tJh0IyxSgx3MbenBqqSWqiviKKaRpMjBDN3GkDNbQYQbFoJsx6jaY1629WgH2hyOTeEnuRSA/v5WGRmYkcaAFtMuYgloIbhx5ERhhUyTcMtxW3IMEW01rtNJw6PT6RqPNvG11k3OhMVxF7knhP6Ka8V7Q3qVV9vpWxUy2CR+m8GS4dQPC0sqh42597EiSPppIOKO4dLE6JjoQuo1XzzokaKltUmj+o/+lBvu9m9TrzmDt4Um2ZIadessm7CZ/QH4DiA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SWEyeGFGTEpMWlE0aFpVTGNXOWY5eTV6cWkzNDBMWFJ3Wkl5bkh0K1lRQlg0?=
 =?utf-8?B?UXFQTDVCcThDb2pTSTFVUzZBM3JMd1VKb0R3NXB2d2ZZYjZOUGFvWmR5dlpy?=
 =?utf-8?B?LzRCSEJzMk1uK1ZveEV5KzRaeVlUQll5c1hYUHFpSFQwWkc3ZWRkU0J6Nzhh?=
 =?utf-8?B?VFg4eStvclFMTnFiem9BQ0VoOHJYVkZ5cVpqSGlzN05uMnRML2tDajd4c2lI?=
 =?utf-8?B?RWpLMXBSRitwOFQvOHQwOURRRVRIbG9IeWJ4N1hSV1RiRlZUd0tLMnRpVGh6?=
 =?utf-8?B?UlVrUDJRVVlUZ0VscE5TZDJrbnB4citnbS9KdnJSOXBoMDY3M2xiSm9MeFE5?=
 =?utf-8?B?ODlJaUluNnpoTDBtOVhlakRlZjV2b1JuaFRLMk8vR29EbW1yMmx0NXlIRVZ1?=
 =?utf-8?B?eVhYbnR3SlJET2VtMVNXQ0IzWHFXREtQU0lRdlF2N2lJdmxQTU5HZ1FGVWpH?=
 =?utf-8?B?RytJRE5DNWFYd3pmL2Mvb0FXS2NkMDFEeDFmWEhXUzFSM2ZIWTZqWnYwejlm?=
 =?utf-8?B?YmdSdWhNdzA4RE9zOUpvdjF1WStGMXM4Zk1lZmMwc2dQbm5UVlRYNG44TDNI?=
 =?utf-8?B?c1JKSm1WcEhWZE0ra1RMNnNVeitDL3BRY0psNlJEczI3b2pLdFdFWllBYW9T?=
 =?utf-8?B?bkNIM2VVbzQ0cVNoa0loUDExVjJzK0tiaDQzSXplTDJIRTh2aFI5Q0R5SDF3?=
 =?utf-8?B?UUw5dThKcEZwTnpHS0ZrTXRHbmxTUGZZclZkbi81N1FXUGRRYitJMEh5SURr?=
 =?utf-8?B?Y0dYUzJMOUI1cEdQL2NaUmM4ZU4ySzZ1dThUaGlCU3lkVkJjMUxWbW5JRGRJ?=
 =?utf-8?B?ODVsUXBvbU81cWgySFBNRXhJMkh2UUVkU3dOTFFReXNmbm5SKzNNTnkxNnZR?=
 =?utf-8?B?SmRBWmF1Ymszd3dlVnF2cytxQ0E5ZjZ0MlVOa0hxQXdxQnRmS3YyVWxmTC9i?=
 =?utf-8?B?TXNFVDNKV2ZSaHRCa05zSW1JRU9HVTUrVTlYcGR1OG9xMGRodElLZWlQdlFG?=
 =?utf-8?B?YWswVjU0OG8vYUFVTjMwOG1WRVZObEh4WXJ0Wk50cXdsM3g0MWJMeXcybmZD?=
 =?utf-8?B?NDYxdHJRV0Q1NlZWb1U0WWxuMmNHak91LytaSmJiNlJ0OVc2dlFiL0ZjbGI0?=
 =?utf-8?B?aG5RTGxuQWZiMDZweHJ6NTU3UE5UMXFUM2xCWHI3K0JKUlE5bjlZNVhsMW9h?=
 =?utf-8?B?NzdxYkpTS0JqNGVuOW9oQUxNQ1hoK2RMYklCckNndmZvYzEzWno2aTl1cGY1?=
 =?utf-8?B?MGpRWWxyblA4ZHVLZG15NE44ZzRCR1hpbHFnZlhieFV4ZjloSExSY3ZuV2Nk?=
 =?utf-8?B?UlJwcFo0MU1DK3ArWUNoS1NSamtiNzhRbFZDS21kTDJUMSs2dFdjSW0wdVIr?=
 =?utf-8?B?WDI5V3lyOW5ueC9kRGYxaXdLMWY0WXJuMHJCMTMrNjNOSUhvem1PZWNBY2RR?=
 =?utf-8?B?d1VhUkM2VlFGS094WTB5TnhZNTAySTdkOUV3L25McXZVNGJnMlNSNnljQ0tZ?=
 =?utf-8?B?QkZUYU5JSk91NExCYWdMVG0wVWwvaFJaZklMV0ltemg5TEI2WWRwZjVFc1dh?=
 =?utf-8?B?S1J6SE1BQ3pmUzY0MjdxUHgvVWRqZlBBaTRFcm50dmRDSnJaUlJmU3J1cU1D?=
 =?utf-8?B?VzNHbFZNOXNsREhRMDdoY3pFNms2TTdNclh2dkNmc2o1ZjhSc0hnTFpRTEYz?=
 =?utf-8?B?Ti9hZlNtemY0cnlBZWZEcU5DV25BL0dXU2sxbXFNa3NJTFpRTWNkNUtDYmtj?=
 =?utf-8?B?Qk9NSlZiRDJ6WEJoTE5JQWhLd2wxVXFiT0x5MEpjeExiWHFodjQ3NkROcEdZ?=
 =?utf-8?B?VXVISFlMVXZMQU0yRnFGM2VNaTZvNTdoZnZLZUZXcU9KcmFuRUtzczIybkpx?=
 =?utf-8?B?dExwSlo4dHI4RlNyeWRhbytQcitiK3IwOG1UQXFkWGJYbU51RGRZanVSblNH?=
 =?utf-8?B?c0dRN2VrTnpYZUNWRW5FcG5Lc2JJZ0UzSEN1a0xlSkhiUEdhS3dLL0dlci9B?=
 =?utf-8?B?bjcvSmJsLzQzR2FrQ29hdlgwcXFsTjdrWnZHTDZoK21tbHRuN1RhNmlKTUQ3?=
 =?utf-8?B?R3FFYTdkckNodXY0bWZ0YjNuWjRqLzFYS2liZVQ3K2hPUk5YZkQzcmNNdHVF?=
 =?utf-8?Q?6Lg2uK3FrAvWPO791Pj1frpdZ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbd5e16a-42aa-4ba8-1586-08dc32ad5998
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2024 07:18:49.4990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GPdUVv4asd07nZJufwOgiFX4pdzZwjhT3N3Sf4FrGPWC0Al0W9Me3r96Ak58qADIDEDDwXxjdXdBFqZYLKKYvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7305
X-Proofpoint-GUID: INqyAx-7Eck6POIMtl83uWhCgUCNUttO
X-Proofpoint-ORIG-GUID: J0GsaLODYOwvTq3WZfGH78SR2fNpkoke
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-20_06,2024-02-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 adultscore=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402210054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 07:18:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195957

Hi Michal,

I just noticed the change. I can't find the V2 in my mailbox, so I'm 
going to reply here.
I'm a little concerned about forcing such requirement here. It does not 
seem *necessary*.
As far as I know, the whole oe-core does not need /tmp to be exec. The 
commit message says 'old meson', this means the current version of meson 
works well, right?
Also, why is there 'no simple way to workaround'? Is the recipe 
hardcoding '/tmp' instead of using API or command? Does exporting TMPDIR 
work?
e.g.,
export TMPDIR="${B}/tmp"

Regards,
Qi

On 2/9/24 23:57, Ross Burton wrote:
> On 9 Feb 2024, at 14:09, Michal Sieron via lists.openembedded.org <michalwsieron=gmail.com@lists.openembedded.org> wrote:
>> +    # Ensure /tmp is NOT mounted with noexec
>> +    with open("/proc/mounts", "r") as f:
>> +        for line in f:
>> +            # format is described in fstab(5)
>> +            _, fs_file, _, fs_mntops, *_ = line.split()
>> +
>> +            # we only want to check /tmp
>> +            if fs_file != "/tmp":
>> +                continue
>> +
>> +            # iterate through the options from the end
>> +            for opt in reversed(fs_mntops.split(",")):
>> +                if opt == "noexec":
>> +                    raise_sanity_error("/tmp shouldn't be mounted with noexec.", d)
>> +
> Alternatively, this is neater:
>
> os.statvfs("/tmp").f_flag & os.ST_NOEXEC
>
> Ross
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195233): https://lists.openembedded.org/g/openembedded-core/message/195233
> Mute This Topic: https://lists.openembedded.org/mt/104258828/7304865
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


