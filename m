Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E272EB64DA
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 23:29:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.217.1689895734790758231
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jul 2023 16:28:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=rWI/JE/H;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6565cab118=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36KNNpUl022112
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 16:28:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=FLxbkVqMdeFy/EViMlS
	D5bycY8XM0l9EZ8cvleBe8UI=; b=rWI/JE/HtTidNaFbPQ2m/vh2Nu6A5NwmFuH
	BlBogq8OiiGrCJyBOQDBA9+XliN8KRDpkje8Wi+igPNvf+i2FwMpA7zrZIX8uoO8
	CBY5O1sG5qELixm3686efJg4ZVSYiNVZBTI3cl0ApIEZRqHtSJHkrDBiIdmI3pfS
	kfa0CiHErLYtnXg/OCl+inSF69leDKmXLGQy5l9EAO862A/XUCvX9WB81uUCpKjF
	8IhYPVM9jbD5SSp1bDlkdkdqDiPRysTf0SWElWbHyMgEEr4lhLIoR6J9SHc62Q2+
	CXSPLVA/U5b/Ub/zN8+7Di20xpix7zeln4MknHAQFQxS2LTuTsA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rutyew0t5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 16:28:54 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 36KNSr2R030103;
	Thu, 20 Jul 2023 16:28:53 -0700
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2172.outbound.protection.outlook.com [104.47.73.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rutyew0t3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jul 2023 16:28:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ud1RUZHoZeM3SrDGzG9IMWSvFQKAEpqpXXlLNrfcbX9UJmWHz/I8vStJ2JPIG/1RRtFGuG4C6UE2yy99vqTcDpGQrNN98ybMnsYVZhcOp74eiaCu+5SmYzAOUa5wF8JeEOEc0uWlg6Fhtpzi2vgc1sL2JbilRZ7KWGPehX0l2+celHBLZJjISE74X7yUXBm4WYUuovE7q/tsy2dD8++L6ZFkudsJDmujINqtdNIeQPjAJ+KNwJOEHtXfDQeKxNrJmIY7H53z3vxc3O4BUA8sROfNS+9Zwlmx5eLhc1qNZUn+WRpbYE2qtoF8XTKdXCIf0kYBHmqFe6qNAHVU7pc26w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FLxbkVqMdeFy/EViMlSD5bycY8XM0l9EZ8cvleBe8UI=;
 b=mFH6/S/cfOMA6u8BoyGoWLHNF7qhvVygGq0vOVIkVP7ETm2R/gp+fJfETYXsE4jYuiY7mXgOalXdm+C2cjbZiJH0SdHTN/GMnMQaB2hBr/V1WEEF5LKktyC7wFw+VvlVEo1qnMXKiBIPr4aB9cjQOeCymnE8sN/6aYdzuDG7ohDZqgTTrZziZhH7WcPS/xlLzD81KaLyPO6g84I5vkG8P6KIS6gIwHE+MZk6woNssi/f5yb4IYPXbaof248Uss+y8vV9ffpnbXOKFIOmAqkfENVeryQo1OhNj4MEy8GV2ZR4DMN35MxD6V6Ra9y0SLMKOgZLKwiwHBPOOlhN2737Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by SA3PR11MB7413.namprd11.prod.outlook.com (2603:10b6:806:31a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Thu, 20 Jul
 2023 23:28:50 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::144:140c:a640:f799]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::144:140c:a640:f799%7]) with mapi id 15.20.6609.026; Thu, 20 Jul 2023
 23:28:50 +0000
Content-Type: multipart/alternative;
 boundary="------------OsEYB9CQdIKioD9u3BBoB00L"
Message-ID: <4d240a0a-1697-d96c-0272-5a465d693e02@windriver.com>
Date: Thu, 20 Jul 2023 19:28:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [OE-core][mickledore 02/26] dmidecode: fix CVE-2023-30630
Content-Language: en-CA
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org, Yogita.Urade@windriver.com,
        Kang Kai <kai.kang@windriver.com>
References: <cover.1689373875.git.steve@sakoman.com>
 <f92e59a0894145a828dc9ac74bf8c7a9355e0587.1689373876.git.steve@sakoman.com>
 <2bccf919-d8fe-6cb6-c913-ccfdad357f7a@windriver.com>
 <CAOSpxdapbZZQgtt8JKJUr9qhSWT3Z0h4tFG9TCpx4RK+FFL3pA@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CAOSpxdapbZZQgtt8JKJUr9qhSWT3Z0h4tFG9TCpx4RK+FFL3pA@mail.gmail.com>
X-ClientProxiedBy: SJ0PR03CA0143.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::28) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|SA3PR11MB7413:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c9a8ae1-afcf-4c26-bbe2-08db89791291
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lE8Y1wc96xFAa7zMPXawpKiNfh5I6gxRoB9OURLupjrX3Ya0tecM4+LKEFDiqAvgiJiEQOpxWdZGmom9w53GaQkV8acsxJizxihg9VcRnjWtmB+BRO5VrcFPq8If8/P9udEVgmJYchBZlD6/E4wV5aL4AwZZy97ARbUtmXjuhT4TBFCJOcNNlQmQqQzQm9avfijW6JQA/Lc8cmzCDWVXJsZCi+y78j1AeA8AuZEyNbrN89BwR4NkhKrlwNjF+wLmHfNTUCmAUc3zI8SVMbYBPgZowBJwjlstt6YHskQScRdZTQASy1hiPl45vIW4+IZTOohCRWw5VJa7Xl7grFOKwgHjsc8ksWQKs2F/xmK+Wnv5iiBsJSB3GKuZQsIkczj6WzbTiWNhLumkyY/ZawHQlkFxigEyMlD80/Db9TKPelm/KZZuWKPG9/QNrFfzm7uv8Ycoh+b8ODyEExUXkQk1a75z0aG9gS1TS0iWQnkQgISfJyjfv+Vmfa2MUTb8Uj3tpnjvLpp7c4gV/LcsZQ3NpDtEnTohsVm5/7pq9WTPfOdkgLARwK8iluRDpsSD73rx5XW+rkSACWVTm/2IFq4ze3niqYJiWikbi8QS3mmV+fPaadNheH4vL3kWviHY3NJL
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(376002)(136003)(39850400004)(396003)(451199021)(53546011)(107886003)(6512007)(36756003)(478600001)(6666004)(33964004)(966005)(6486002)(6506007)(26005)(86362001)(166002)(186003)(31696002)(66946007)(6916009)(316002)(66556008)(4326008)(66476007)(31686004)(21615005)(8676002)(38100700002)(5660300002)(2616005)(2906002)(41300700001)(83380400001)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TmxodkkvbG9LL1dtOTMvMlExYWIwelQ2RVI0Z0pPVTNjaWdQb3JLcFlPR2R0?=
 =?utf-8?B?VzNsV3VOejJmZjZxNmhuOEtURHNqRVdsaGRaN091OHBMNXZ1UUs2T2FNVjVy?=
 =?utf-8?B?RWJMZmM4Sk5BbnFRWUFnVDRXRm1NUGM2NDlsSXlvbXRaRzJwQ0p5Y0Z0YzN5?=
 =?utf-8?B?YlJoaVlnNWRVaklyRXd4RzVHVW5nVGdqWldyUnM1NlAwekZtNlFaWCs5NXQ2?=
 =?utf-8?B?SlYrbmh5SWxhVUdLdWRDMlU1NldQT1EzL3N3OUtHNjV1Nmd0THNuY2o3TlFs?=
 =?utf-8?B?MjBsMUwwMFFseGNQdFViVkJSSlIrdWdpS1hUR1FvT0pSc2MvUTNFMkhteWEy?=
 =?utf-8?B?dlpxNzNLRkpGc3l6OGc2MXpPWEZCRmNHOStkMDh0UW1iRGdNQnZqZzJvdUNi?=
 =?utf-8?B?L2o4YklzNTBRK3hyK2pHUWtaaS96WmwvVi93KzUyQ2JJV2tuWksyUXBqM2ZN?=
 =?utf-8?B?Ykp2UWs2STBLSFdLNm1MRjB6WFFEZStud3VDS3h6YklzTDZwZjFrUlhZWWRI?=
 =?utf-8?B?bUpHVXZqM3hpZGF5clRPTXl0RWZnRmlNTlUrRXdPKzZFWmwycmR5djlsaVFt?=
 =?utf-8?B?RVlzTStTNlZCYjFjN2V3Sk9qWWZuV200dUQ4RmVHWS8zRFhOeWIwckEzTEV0?=
 =?utf-8?B?akY1cWlKbW9mYnZJbVlmWDUyZXBGdisvZzFDdUJDbmhYL0pXbmRLUnQ2THVP?=
 =?utf-8?B?L3MweUFXMVNUQ205emFOVU5Td3N6OWdlZGpqY00wYVM0WElLMFJwSVd4bkxU?=
 =?utf-8?B?ZFJyakRLQ0paNFRPK0dDeE5pNkF3SzU2ZW55OHF3U1lDYWhTWTZUczFOeUZh?=
 =?utf-8?B?enJmY1RaK1NPRmRKQ0V2SlptajZQa2Z6TnFiMFJJL2FkenJGMkRDRE1tamtE?=
 =?utf-8?B?YW1rQ0pZdWdrQ0xQTnExeXh2QTNlSGtUM3NRZm9rNWtWRzJWRjE2TS9mR3FO?=
 =?utf-8?B?ZzhBMnJLQ3R5bThRbVUzZ2tpNkI2cElWUWpFTGhHRHorcERvSmhYVHF1eUY5?=
 =?utf-8?B?OVFJSlFGdWF4TUZMT2Y2aGNld1lYK2prT1N1djdUYVJmRXB0RUJuSGZ6enBT?=
 =?utf-8?B?Q2E3QU9KSFM1bjBLTHVNVThkdlZZS1RjM3Q1K2xCNFdqMGYyNUtsWGFsNks1?=
 =?utf-8?B?aXVhZzd0enZVejUxM2lIVlZaNlcxM25CRDNJeHVaOUxNK1grWXUxeU1TT25J?=
 =?utf-8?B?cmMwMW5idFdVcWpRZEd1VzVZalQ4cE1UZjdPaDl1L2hFNEovZXNhbitFUnZJ?=
 =?utf-8?B?dVRocWtTMkVQK1poeFJiVC8rTEp5Wks3QWxldFJqb3ZjSzVZdmxKWjFJR3dw?=
 =?utf-8?B?U0ZjNXFWTWh1SmhlS3pLdzVZbFFnNUtsSmZ5bjY4UVVQbnl2MEpud1BHeEFn?=
 =?utf-8?B?L2Zhdmw3M29QbHVDQXZMNnlySGhoTTIvWFRTZGpNS2ZKL3VOaWZqenEzZmtK?=
 =?utf-8?B?U0o3RXBFREgrTnpWR2tBR3JmN2dJdk1uOGlncW9pMnFZUEp3SFdMTkhQYVFp?=
 =?utf-8?B?UkFVU1pERUY0Tm9DMTVlNkJ3Y2tEazk3QVdkOFdmRm0wNmZORUFVam81UWNJ?=
 =?utf-8?B?NnFTbGFabjkrQ28yOU5SSm5KYzZ2RFpGbVFua1JQV0t1Qk5wK1NpSUdQcXcz?=
 =?utf-8?B?YmI0QzBXNk9tLzNEcHhqN3M3M2ZvaGdlbWltSnpydXRHU0xRNThkWVRKeUQ0?=
 =?utf-8?B?UjBsc0pIckg5ZWRPcW5sZDVMNFE2cWVIc1R1MmY4S2Fva3Y0aW9rSTJJZ1h4?=
 =?utf-8?B?dE04cGdFOU9SazBqZzhROHRnQmFDNmtOQkRVRGdwNlNSdGFOV2orSk9MLytX?=
 =?utf-8?B?Sk1Kc0tDQ2ovNCtKVng0WDAzR3lLRXg5bE9iYzVXa1pSU2xadUN0M1lCUXRD?=
 =?utf-8?B?bDdZOG15MitQN0k3RUlGczFvaHZzWFgybGRxR2lJZkZMWmI1ME9zY0hnUkgw?=
 =?utf-8?B?SG1TVnQ1aFlxUG1LS1ZJRlFLSFJzWkQxdGNUNEFqeTZnREsvcmxoVkt0LzNQ?=
 =?utf-8?B?WS9XSmFRQnNUaFV6NnJTellleHpyK3NjeE9GcksyNWZJc01HYWhWanlPYnVv?=
 =?utf-8?B?Y2kwMDFwb0YrQlZoWjdOVHcxam9JQmZjVkltZ1l3UXVoeUphKzV5aE5RYzdz?=
 =?utf-8?B?UWpSZ3VYWWZvK0g3S0hnVEtReUNsTEVYdzhsaFlFcmw1eDA2SU9KMWtONi80?=
 =?utf-8?B?TVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c9a8ae1-afcf-4c26-bbe2-08db89791291
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 23:28:50.0066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w2r0ZadWBR3pKQt6cPkV1Mg4Um1xhljl3Q2pjrAcoG6uvbu1yGvNTuEKIgV/zawAZ7wGOLmL/pZqQRvOb+ss95WjyAQJS/YDPGJQkafzOFI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7413
X-Proofpoint-ORIG-GUID: mbO9211PgvkrOJ84xnxqy1YVyDFA68bC
X-Proofpoint-GUID: M_WkZZCIH-3ypJqjmtLU5ShfCRosa4Ru
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-20_10,2023-07-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=999 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2306200000
 definitions=main-2307200200
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 23:29:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184662

--------------OsEYB9CQdIKioD9u3BBoB00L
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 36KNNpUl022112

On 2023-07-18 18:32, Steve Sakoman wrote:
> On Tue, Jul 18, 2023 at 11:49=E2=80=AFAM Randy MacLeod
> <randy.macleod@windriver.com>  wrote:
>> Add Kai,
>>
>> On 2023-07-14 18:32, Steve Sakoman via lists.openembedded.org wrote:
>>
>> From: Yogita Urade<yogita.urade@windriver.com>
>>
>> Dmidecode before 3.5 allows -dump-bin to overwrite a local file.
>> This has security relevance because, for example, execution of
>> Dmidecode via Sudo is plausible.
>>
>> References:
>> https://nvd.nist.gov/vuln/detail/CVE-2023-30630
>> https://lists.nongnu.org/archive/html/dmidecode-devel/2023-04/msg00016=
.html
>> https://lists.nongnu.org/archive/html/dmidecode-devel/2023-04/msg00017=
.html
>>
>> Signed-off-by: Yogita Urade<yogita.urade@windriver.com>
>> Signed-off-by: Steve Sakoman<steve@sakoman.com>
>> ---
>>   .../dmidecode/CVE-2023-30630_1.patch          | 237 ++++++++++++++++=
++
>>   .../dmidecode/CVE-2023-30630_2.patch          |  81 ++++++
>>   .../dmidecode/CVE-2023-30630_3.patch          |  69 +++++
>>   .../dmidecode/CVE-2023-30630_4.patch          | 137 ++++++++++
>>
>>
>> Summary:
>>
>>      I think this can merge but we should agree on how to handle dmide=
code.
>>
>>
>> Details:
>>
>> These changes work but it's bringing back 4 patches rather than bumpin=
g the version to 3.5
>> and picking up 2 patches. My conclusion is that it's okay but we shoul=
d probably talk
>> about how to maintain dmidecode since it just produces a bunch of prog=
rams for dumping
>> HW DMI/SMBIOS info and doesn't provide a runtime ABI, we can probably =
update to 3.5
>> ( or even 3.6 when that's out).
>>
>> Do you agree Steve?
> You'll always get the same answer from me: no version bumps that
> implement new features/apis.  Bug/security fixes only.
>
> If there is a strong case to be made for something outside this
> policy, it should go to the TSC for consideration.
>
> I don't want our stable branches to start resembling the kernel
> "stable" branches ...
>
> So, yes, I think we should merge this patch rather than version bump :-=
)
>
> Steve

Fine with me!

<snip>


There is no change to this commit and it will be merged so
read on only if you are interested in dmidecode maintenance and
my motivations in causing this bit of noise on the list. ;-)


I checked with the dmidecode upstream (1) about their versioning scheme=20
and if they
have considered having a structured release numbering scheme and even a=20
stable branch.

They said they increment versions at will and don't have a stable branch=20
other than latest release.
As Richard and Steve have said, we should be more conservative and if we=20
find that anyone needs
the additional hardware support that I was hoping to pick up, we can=20
back port patches.

Sorry for the noise,

../Randy


1)

https://lists.nongnu.org/archive/html/dmidecode-devel/2023-07/msg00006.ht=
ml

--=20
# Randy MacLeod
# Wind River Linux

--------------OsEYB9CQdIKioD9u3BBoB00L
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 36KNNpUl022112

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2023-07-18 18:32, Steve Sakoman
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAOSpxdapbZZQgtt8JKJUr9qhSWT3Z0=
h4tFG9TCpx4RK+FFL3pA@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">On Tue, Jul 18, 2023 at 11:4=
9=E2=80=AFAM Randy MacLeod
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:randy.macleod@windriver=
.com">&lt;randy.macleod@windriver.com&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">Add Kai,

On 2023-07-14 18:32, Steve Sakoman via lists.openembedded.org wrote:

From: Yogita Urade <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:yogi=
ta.urade@windriver.com">&lt;yogita.urade@windriver.com&gt;</a>

Dmidecode before 3.5 allows -dump-bin to overwrite a local file.
This has security relevance because, for example, execution of
Dmidecode via Sudo is plausible.

References:
<a class=3D"moz-txt-link-freetext" href=3D"https://nvd.nist.gov/vuln/deta=
il/CVE-2023-30630">https://nvd.nist.gov/vuln/detail/CVE-2023-30630</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://lists.nongnu.org/archi=
ve/html/dmidecode-devel/2023-04/msg00016.html">https://lists.nongnu.org/a=
rchive/html/dmidecode-devel/2023-04/msg00016.html</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://lists.nongnu.org/archi=
ve/html/dmidecode-devel/2023-04/msg00017.html">https://lists.nongnu.org/a=
rchive/html/dmidecode-devel/2023-04/msg00017.html</a>

Signed-off-by: Yogita Urade <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:yogita.urade@windriver.com">&lt;yogita.urade@windriver.com&gt;</a>
Signed-off-by: Steve Sakoman <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:steve@sakoman.com">&lt;steve@sakoman.com&gt;</a>
---
 .../dmidecode/CVE-2023-30630_1.patch          | 237 ++++++++++++++++++
 .../dmidecode/CVE-2023-30630_2.patch          |  81 ++++++
 .../dmidecode/CVE-2023-30630_3.patch          |  69 +++++
 .../dmidecode/CVE-2023-30630_4.patch          | 137 ++++++++++


Summary:

    I think this can merge but we should agree on how to handle dmidecode.


Details:

These changes work but it's bringing back 4 patches rather than bumping t=
he version to 3.5
and picking up 2 patches. My conclusion is that it's okay but we should p=
robably talk
about how to maintain dmidecode since it just produces a bunch of program=
s for dumping
HW DMI/SMBIOS info and doesn't provide a runtime ABI, we can probably upd=
ate to 3.5
( or even 3.6 when that's out).

Do you agree Steve?
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">You'll always get the same a=
nswer from me: no version bumps that
implement new features/apis.  Bug/security fixes only.

If there is a strong case to be made for something outside this
policy, it should go to the TSC for consideration.

I don't want our stable branches to start resembling the kernel
&quot;stable&quot; branches ...

So, yes, I think we should merge this patch rather than version bump :-)

Steve</pre>
    </blockquote>
    <p>Fine with me!<br>
    </p>
    <p>&lt;snip&gt;</p>
    <p><br>
    </p>
    <p>There is no change to this commit and it will be merged so <br>
      read on only if you are interested in dmidecode maintenance and <br=
>
      my motivations in causing this bit of noise on the list. ;-)</p>
    <p><br>
    </p>
    <p>I checked with the dmidecode upstream (1) about their versioning
      scheme and if they<br>
      have considered having a structured release numbering scheme and
      even a stable branch.</p>
    <p>They said they increment versions at will and don't have a stable
      branch other than latest release.<br>
      As Richard and Steve have said, we should be more conservative and
      if we find that anyone needs <br>
      the additional hardware support that I was hoping to pick up, we
      can back port patches.</p>
    <p>Sorry for the noise,<br>
    </p>
    <p>../Randy<br>
    </p>
    <p><br>
    </p>
    <p>1)<br>
    </p>
    <p><a class=3D"moz-txt-link-freetext" href=3D"https://lists.nongnu.or=
g/archive/html/dmidecode-devel/2023-07/msg00006.html">https://lists.nongn=
u.org/archive/html/dmidecode-devel/2023-07/msg00006.html</a><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------OsEYB9CQdIKioD9u3BBoB00L--

