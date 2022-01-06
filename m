Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 251EAC43217
	for <webhook@archiver.kernel.org>; Thu,  6 Jan 2022 18:39:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.13078.1641494369228518231
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jan 2022 10:39:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ha7me850;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=8005714978=saul.wold@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 206HVahu011510
	for <openembedded-core@lists.openembedded.org>; Thu, 6 Jan 2022 18:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=7vLx0HCScNc8MUPWm6yUoV+guH20ma0r1owM/1dtFhA=;
 b=ha7me850XfQ9NAK3dr+wZIQLBaKRI/NunxtlhxwoIxzOAo3TPhjUM85ypPdIc6okqFHg
 wJnD4EBoHJBBZ8hTFx1qBDv3BXy/Rd0j5aDkX2yWEbIGC3uOxnRGobUMEodk9wye64r+
 jvs6A/1a1YCgsNOcAdCYr99U83wgF5G3ownhPyJu4YbHWxJdrQY09fk3cfbTbiCjVPDq
 V8nX7BghJpGkiAnIHM8r4aZgU6mzwkkDl+AvlixxJEUNaT+I0ue95J+UZZYVItL8NNlv
 toAHshHxDIERr281TIihFRCJUUgDB5K4vpGKpJ8JC0haG19QzxAfIV0GuS/GK2R2jtr+ Hw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3de4wc01g3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jan 2022 18:39:27 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 206Ia1DY029025
	for <openembedded-core@lists.openembedded.org>; Thu, 6 Jan 2022 18:39:27 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2041.outbound.protection.outlook.com [104.47.73.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3de4wc01g2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jan 2022 18:39:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ALqC+WP0J+VXbH9dXts8PgFr8zMgjfi84zZqJJtSUX9bmZ3DT4X3e9oYTgKGLslBqNgRWz609BgwuwAW+s4ZFX+8JNsvLlzgZ3eIalr3VxY/RKhV1rDJojZUDeGenzgO+GiVm85qhwN7sarF/P08XonaIcom50QMacZJFQpYyDV887B21AspqiDJGuH6WBgOy3wpznfp+9WLrqpWFvaS78NQkoEgtQZzGK61aVriB+kisSnClpDK1AL1Z08bdgGoBdOAhT2ibaIRBvN7JC82srUqxZ8fHFroVS7xJh0PlYZOHQ+scsv/pWj4Xb9DNwK//eISet5Nw0vCfj7A8isrBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7vLx0HCScNc8MUPWm6yUoV+guH20ma0r1owM/1dtFhA=;
 b=E+etKcoKMb3HijTvlzdAaJan2AfASxs4TMK30HMmRl3BHBjN9qAJ72utjjODqyxIXGRI0RUj9SOHKn9L+UWgFJwTZ+AqttmoDdwg/r2FOiGHNemIddblUIOZA6OxXZdlKbDvPrsQrHlQbwIC3SPH2GqwbNiHEt3c2PecDycuL6OnuS20PFAboH9nW+/pD0yZVixwj4U9W3YHaZQ32ozKNSZRPOnvpJOOdtf5/wiHV4SvHYeCxK7CNMtwbKitja3fgE+3himfnaCp6NtOIP51pOsd9EZoF0iCuBco6lxKYKyAv28vVfE0xmvE/H6l6/SRmTgwTcwQV+DbJqyK01oByA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MWHPR1101MB2111.namprd11.prod.outlook.com (2603:10b6:301:4d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Thu, 6 Jan
 2022 18:39:24 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac%4]) with mapi id 15.20.4867.010; Thu, 6 Jan 2022
 18:39:23 +0000
Message-ID: <5f77303e-b1d3-3f6f-28f2-9010804f8081@windriver.com>
Date: Thu, 6 Jan 2022 10:39:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [OE-core] [PATCH] perl: Enable threading
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20211230212344.94913-1-saul.wold@windriver.com>
 <CAMKF1sqd-WXRegKoTF8yBSGup4Gi9r-mau-BYU47W5OfCDs2Bg@mail.gmail.com>
From: Saul Wold <Saul.Wold@windriver.com>
In-Reply-To: 
 <CAMKF1sqd-WXRegKoTF8yBSGup4Gi9r-mau-BYU47W5OfCDs2Bg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MWHPR13CA0046.namprd13.prod.outlook.com
 (2603:10b6:300:95::32) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec0364e8-3322-432b-169a-08d9d143dbc8
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2111:EE_
X-Microsoft-Antispam-PRVS: 
	<MWHPR1101MB2111A0F9EE7F9CEB3D3BD36CEE4C9@MWHPR1101MB2111.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	09U7jKlesSyJQMOtIGoZj7ClOXCRRuwx6bMqdgXKP+tFegkksdfC/PN1Uw5CrDpwSYGXi4zLWW0fQpRl1s90TCF3RuflZBtciJ7wwCiwOhhhu8C34pmYZoR8IQGxxq7Y0FR8EKm7TW2gCZphjAaBzEYu6IY3g+cksAVpwmljrTTLKmebvCVDoYvI34GJrRooTQ2Yg5ucOWZL9S30v/gotHyBNkt8iq+W4qMVN+y6Hkm5s2cEMQ3129d3oXxVBbIEH40Wnsy32iQvB3QeCxXKXR78tfoDENTAGFkuw1LJbLz02xNvoBuEekIO27/7f/YRjQnSVDT6gW5QS60vaa+LVLHlsMAuZXq8yXPuA2PH7PvKaTZx0OimaGdJyBeTVwR3fGjUhm2x1sUGyYfLLENt+mB9Jz9rBO83roM+Q7AxO8Y/CRi9NTy1M711ZLOnlDX5P9vcuTFfEwYnXpKcxr6MyZ0FHh2jm2ejiloymAZJAR9pBiKF9dSgwtVJRm8BYHXbwGP+lr7uWfgGvHkL5qhnhon+VhRQZExrWyxEPr49H8zoXWtozO/ewT+Ak75Z6fsi/XOgw0coYJIeXXdHCaE9GVGIiV6nchlWkkv5i82aNG9ujkwg3ZH7c1Ao/xbUpnuKzbEPEPijgq1QT0Zqxsj8JhfhUf1+rYN0sUoc2mMp9io3pPsQekKgCQYhcH5D/bImfAcppf4Ie+uVROgXMotmi/hLj/rxci2lXttqhAn+VJJl6nhTN769oPYgc6xdaVJOBaRVRZSpvS+9wZx8Ps/Tp24WIk3hWfk3Yeivc45HKLunVF5drkkvv9sDgGLvwTwa40S5nOM7C4Ql+jE07c5GxbRKnLyQsl7p9hBEsMYCPrka9E1q9dQMuEZLN1GqoSG+9mVMfFWru+hbBO/mO55hsA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(8676002)(66946007)(966005)(52116002)(66476007)(6666004)(36756003)(5660300002)(2906002)(508600001)(31696002)(66556008)(8936002)(31686004)(26005)(6512007)(4326008)(6916009)(186003)(6506007)(53546011)(83380400001)(316002)(38100700002)(38350700002)(86362001)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Rk54Y0lSeFl0c2szZlYyMnJlK2FoWGcrWnhibkZmSW42MmorbUtlUEJwMm53?=
 =?utf-8?B?b0YxdkhJQWVMeFY2UENQTExnQjI3aFdpdjZuYjIzT0M1YVdtWnM5L0tYejY4?=
 =?utf-8?B?TGxPdkZNS2ZyWWFkMG1Ca01uU0pNbzFVVlJPV2V0Zm94N2dqclVTS2wyZ3B1?=
 =?utf-8?B?OFN3cHE3d3FDdVUyN05HUGJZVkZ4Q05GeU9aL29GYmtNY0ZZY0dKZVpiZ0VJ?=
 =?utf-8?B?NHUxdVZqcDRDdFBiUDk5OWJjeVc1OGI5aE91b3N1N296a09tcld1SG9yV1Q3?=
 =?utf-8?B?Q0xwWGdFejRNUVI4L0Nna3pNdng0QW5NNk9Jd3NQMWJMcXI1WTlTWWdPLzhB?=
 =?utf-8?B?VzRWMHIyUUJLT3oybFgxUG4rNnRTRkpLTUlQVk82UDE2MDNLeDNGZG9ydnU4?=
 =?utf-8?B?MnA0SHVpVUVleVBZem9IRGVOdU9uQ1lEVzZJb2ZuS1BDc2FldmxFUlFIREQ4?=
 =?utf-8?B?SlpRL1k1SHpKaXQvcmNCWFVISCtmWTRhWVN6VWZWY1ZHUzFtdWI4a1pMRUZj?=
 =?utf-8?B?UHpRcmNjVzZncS9vSDVnbTV3NVUxbTkzQ1J6WVZkOCtsVFArN20yWitMcHZr?=
 =?utf-8?B?bWpMcG9WN2d2bEdkYTVKUC90RmxmNXdTVkNObkQxL0QvSm4yZ3lZTVhSc21J?=
 =?utf-8?B?NVA5YVdyVUcvVHp6d3hHOVpGTlVWVTBaMlJJZUs3b1NOUUp3eVdiMThaa1I1?=
 =?utf-8?B?bXNESGZYWms5ck5PN2VpajR4WXRIQjY4MHBrMFhxcFIybWN5dWNjcnA0SE5j?=
 =?utf-8?B?bzlVL3Q2alI4d3hHd1M5azZPUmdXSjFpY3JUcXVlN05EcWNjWHByZTh6b2NX?=
 =?utf-8?B?Q1RuMlJJVmxiaTQ5eDNaZnE4TVA1RWJXeHEza2VWTTFiVFVzcUxFbjM4d0M0?=
 =?utf-8?B?czd3OVFKNmt5Z2dDK1NYTkIxS0o5ZCtMbkg3Q25XMmk0V3hnanhRbXdMZHF5?=
 =?utf-8?B?aUs0WVQzdjlDdTRJLyttZnB1RTZXYytFS05YUldTeUFKbVB5UElOb0ltclUy?=
 =?utf-8?B?MDl6d2ZSNHRaQ0dwT2FOeDI0ZFJIeUxrSXdoNkR1VmVOaitxVVV0UU9JMjJT?=
 =?utf-8?B?VHBBdUdvLzhsMnBZQU9MeHh0YWlLRDc3b1dkVkJJZHBmVnhjSFMweXZxTGZ2?=
 =?utf-8?B?UHhpQnRiRmJNK3VsWXROUGZtejZKbVhaTjU0Z25WbmNkZW5VOGpORjZlVmVI?=
 =?utf-8?B?Zit5NkE3SEhQMUU0aVJ5d0tOc2xPeFltVTFwekJKc0xvS2tIV0huWTUxdFBx?=
 =?utf-8?B?WHpTSmtPRTRzTDJ2N0xvZ0RPSjlWbmNab2J6d2ZCaC9wZTNJU0ZETWRUVmhY?=
 =?utf-8?B?YXBwZFRhdmlBUkhJZDNUWjA1Q21JQmt2WnpNZDd3TDlXTFZEVGZMRkhtZnc0?=
 =?utf-8?B?UG1ncUhHMXVOV1dtNE9kVloxcE9aVG92QXF0WFBzWkxuT3U2V3MyWFdTMnE1?=
 =?utf-8?B?MWhwOWZLQUhCOXAyUWNnVXNNaFlwUGpDOTZLaThYL2tpdVVOb2RFRysrWlBq?=
 =?utf-8?B?MWRPYWlySEIxY01nYkk2cjQwVWtwYkwwYmpMRDdjRGpJTDBoRGkxa2tHQmhn?=
 =?utf-8?B?L2ZsSjJaTENIZFN5L0dXcDdoT1lYa1d6WDNLWmI3ZkdEUXE5aFVOQkhEdXZ5?=
 =?utf-8?B?SG50ZGxuWEtIc3M5aENWVC9iOHBRSkYxR1RhU3h5SFFoT3ZZWng4WVd2UkY4?=
 =?utf-8?B?Unp6ZHFKNTQ3ZTBTdUlQdW03aWJnT1hCZXBLZmtFRUNNM1NtSHB6VnN6QzVs?=
 =?utf-8?B?ci9Oc2l5dkt6L1M0NXdZTlBWZForN1RwenZoQ1puSHI4dlBJVjBxb3RMSE5r?=
 =?utf-8?B?dFFEa0RLVTBqb0dYb3FUQkhxcjRocmZlVkhzeFg3ZnJCMit2M0dxNi9jMllx?=
 =?utf-8?B?WUlPNWE3ZGZlT25EbDEvZHlCTGNBWGtXUFJXNXZWeWZXdW93VUc5MmNwSEZN?=
 =?utf-8?B?UkpUbUN5M0c1U1p4MWZpOUd3QndrSFpsc2lINDhPRGdWNzE2Z3FwcFNBbWtR?=
 =?utf-8?B?c3hFRWFxQUZ0NFgyRUVjVm1uTGVqejV5UU4vKzZIM2pQc0VZTnhSWm03RE0y?=
 =?utf-8?B?RnhjTXlwVG5iZ2RPdkVuOGxMY1NSdlArSkJ4Q1lqRHBJMkhaM3IrSDFkNjZK?=
 =?utf-8?B?eHNBdG56ZGVBQlRUNFVoenZKWDZqM0ZSRkRGV2NLT0FQSlJpNWVmYVJsWHRG?=
 =?utf-8?Q?4SyC2U3z/YtmN7zBChyT4WM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ec0364e8-3322-432b-169a-08d9d143dbc8
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2022 18:39:23.3722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 cv4C6RpcJHnNwstqDU55munB4PjamqmF4b3BXwj8dCEtnMnuiZy1KxMJL0l2kz1eNHTXFtuUg+WDJh91kXetag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2111
X-Proofpoint-GUID: Sj1F2wruaFEzHiEKCAZ5hn5KWypB2SeV
X-Proofpoint-ORIG-GUID: WYnyEz1-LCRY23kiz3iQIFsS61Bs7QNQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-06_07,2022-01-06_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201060122
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jan 2022 18:39:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160239



On 1/6/22 10:22, Khem Raj wrote:
> On Thu, Dec 30, 2021 at 1:24 PM Saul Wold <Saul.Wold@windriver.com> wrote:
>>
>> When the tranisiton to perl-cross occured, the threading define
>> seems to have been missed.  The perl tests for threading where
>> simply skipped, so there was no direct failures.  This was verified
>> by running perl ptest before and after the change to see PASS vs SKIP
>> results of threaded related tests.
>>
> 
> Do we need this for perl-native too ? I am seeing failures like below
> 
> https://errors.yoctoproject.org/Errors/Details/621556/
> https://errors.yoctoproject.org/Errors/Details/621555/
> 
> can you take a look ?
> 
Yes, I am looking into it.  RP mentioned it earlier today.

Yes, I guess I just enabled for the target and not native or nativesdk, 
building and testing now.


Sau!

>> Signed-off-by: Saul Wold <saul.wold@windriver.com>
>> ---
>>   meta/recipes-devtools/perl/perl_5.34.0.bb | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-devtools/perl/perl_5.34.0.bb b/meta/recipes-devtools/perl/perl_5.34.0.bb
>> index a6ae80f07e1..3306a093692 100644
>> --- a/meta/recipes-devtools/perl/perl_5.34.0.bb
>> +++ b/meta/recipes-devtools/perl/perl_5.34.0.bb
>> @@ -53,6 +53,7 @@ do_configure:class-target() {
>>       ./configure --prefix=${prefix} --libdir=${libdir} \
>>       --target=${TARGET_SYS} \
>>       -Duseshrplib \
>> +    -Dusethreads \
>>       -Dsoname=libperl.so.5 \
>>       -Dvendorprefix=${prefix} \
>>       -Darchlibexp=${STAGING_LIBDIR}/perl5/${PV}/${TARGET_ARCH}-linux \
>> --
>> 2.31.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#160066): https://lists.openembedded.org/g/openembedded-core/message/160066
>> Mute This Topic: https://lists.openembedded.org/mt/88042607/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

-- 
Sau!

