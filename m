Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7D6BC46CD2
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 06:50:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.17046.1706079017022993109
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jan 2024 22:50:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=nwAhRbK8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1753778f48=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40O6RbIi002124
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 06:50:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=k2BDKUyFIcnpUnFUnqL
	vBUoLLK86uc5a4x8NkNKyckk=; b=nwAhRbK85VLxlZFk+ovc3nfiV5YUADDWqLQ
	yR2QxuIaLI3mMXwxHKC8wTcH+aeJfPGYNbWffvuAvbna0Mmt4zjHrRwGPtrjntvP
	cnWNHQInIKg8XqaL+USjnd4YZIQXA6j8t7ceF+EIdpa079UmjTxyGmdcednXogHA
	69iVkRB6xevR8essmV8234S2qzHnzcX92VMnNnetAImsIPYPI7h9/V9tCxjFqfa+
	2pTNJNMf291w5bOdG2IL51S0wUcV8vtIV/OWTxiDTnlnjWSO9u268PwSXBd+7GG4
	GZrANx7yY7J4QUCx4RLMk4w0gRzC29w06R/xAlzT9hGFwrlyynw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vtmg28dwk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 06:50:16 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 40O6oFY7027853;
	Wed, 24 Jan 2024 06:50:15 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vtmg28dwj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jan 2024 06:50:15 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bziwAMzBnVs9dmibkE/X7n0XY7R6cwmCj61eoGQt6QWijXzCojQyqF60hJ8MoILwtg0NVCKHmHxb+bbtUoHEgL3Ew+QHxKOu1NqS9kpkGMB6RO/GIpxkhUnVI1wfvdCA+vk943crUpexv1oviOfzDh/H8zH6zNzzIpKWYZwFwZmnQI4KmtqYuUp3Z3WtkXqvWsln420eCVYmA1g8/vdpROz0GnXCsHnhF5Co2g7UTmeMeKTd/7IFWVKidyIjkrJOs2CkpN1w99runw1wroOLiZPqyDzcaDobSFnuem+4Mi1IYbTYMipU4cVFUj7HEys2GsVmxXx7C14yuVTNByzG5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k2BDKUyFIcnpUnFUnqLvBUoLLK86uc5a4x8NkNKyckk=;
 b=Ky1wiQkA0sFVsHJLOHtwI1a2/1oU2e0L3aRHCGbabln1aKccnlmaKh3modV1U5DmUpyq0jI5EOporUiYAFS2jLa5scIcy5AxsWv+d/aqPlfsnECs8Rsjmeh8IrekB+RB9h+v9IL0vaQOoflCtiy+PQ4LDsJYD/a9nX8Z6mUDmtL3WbvuwXjbZ5qwDHooq1b730m/7lIevkIBefq9jGYxaIMLY95WE0VGqJqOO/B7o66ZxOaImq76/MPoNcJ12dQRkihDTA31HA2t7bPXUaoU8nRWGjJCwA5EC0PJdHOQTx5ZS6JRasKNhiTF2rbCs4Js0cpik5RVh/kl+cF2JbHfeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by PH7PR11MB8036.namprd11.prod.outlook.com (2603:10b6:510:248::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Wed, 24 Jan
 2024 06:50:13 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107%4]) with mapi id 15.20.7228.022; Wed, 24 Jan 2024
 06:50:13 +0000
Content-Type: multipart/alternative;
 boundary="------------9hMOQX9CQp0sWCTsa2qeke7W"
Message-ID: <0697dfb1-9de8-48d6-aa53-f44cbbdce7df@windriver.com>
Date: Wed, 24 Jan 2024 12:20:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 1/7] rust: Fetch cargo from rust-snapshot
 dir.
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com
References: <20240123131633.641012-1-Yash.Shinde@windriver.com>
 <17AD12BD124D26C8.31068@lists.openembedded.org>
 <1c7059e4c0bad63e7510f5dafff81bbdfba474e6.camel@linuxfoundation.org>
From: Yash Shinde <Yash.Shinde@windriver.com>
In-Reply-To: <1c7059e4c0bad63e7510f5dafff81bbdfba474e6.camel@linuxfoundation.org>
X-ClientProxiedBy: BYAPR11CA0049.namprd11.prod.outlook.com
 (2603:10b6:a03:80::26) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|PH7PR11MB8036:EE_
X-MS-Office365-Filtering-Correlation-Id: 57ba2a00-84c0-4445-39b1-08dc1ca8b6f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0zX9SkwhLaswtHk98e2GcfJZqV0otnZ3vRNmR1t+l2+F3cCusChwot9wuGIM9TxiwKlLNui5zfkJOYs3ijV7HGDVmP2QhhnHGhxtBjIGu1ovgFMYHHBSjeX5kMF8ZRw2wGKRTcbs/RSWgiaNYGgeDDBJnRz4H+5tpiH0ePtXcHqoODjptNiRQ+wErKxsT8WvvFi9O6MlBPYnMPO4Yd9+pw4Q4F6jAgbNLWj9kkE5cDaGGgMXyCN3v0kC9SaeC9lLbcO0X79WByNLQcDt1wZ1bpJmciTyAjAT9IAVQunPzYAKGCswZurNwxPbbO4hA5o5yRZLmZaW1myy007fyvSMFRYRht769+V8PjtN+94p70BBWrA0nxTDDQQ70+3OI1d/T7IoY9BYLU6tp32RdFG3FJDxDt8QJUp3aQ77nnSfmFw5c5zbe9T7OtvVEyJ+WYYIkHrQHj/dIIPAeeADyqQWX9+1mtTYLFipmY0v87AWG9YtEV3lm2HcA+YsZPGAsWU5xWK1WnKTpky+ZxOPAqFhaB7F4VtmWcHYLHDR09xaF8YYgLdjp+GbSJsLUEsKhvfw78nigrujZHssiQzrjwcnhGJhwcDMDZQUyFaTqkG78xpeOTgztStfTyoN33mabTXNb14W1WKlWTWe95Uj7cAMUN+omBMY0+1ogV4oVUdodYM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39850400004)(346002)(136003)(366004)(396003)(230273577357003)(230173577357003)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(2906002)(31696002)(6512007)(166002)(26005)(86362001)(8936002)(2616005)(4326008)(8676002)(478600001)(41300700001)(107886003)(38100700002)(36756003)(31686004)(83380400001)(316002)(66476007)(66946007)(5660300002)(6666004)(66556008)(53546011)(966005)(6506007)(33964004)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U3ZvWmNOQ1J6M291TmZlUEp6M0VDMzRQZVI3T1ZqTWdNbldlK1o1L1lVMlYy?=
 =?utf-8?B?d3Ivd2pqK2tBR1BUbVRHd3BnRHpVTGtDY0czL1JPU3c3T29ERWhMY2tGK2Y2?=
 =?utf-8?B?U0c1RTN5SG8rdE5oT3dXNGMrWkloR1cyMGJQYTF6cUhybXJBWWNTbUZSVldx?=
 =?utf-8?B?VHFYSWd3NVQ0RXhESzBBZllWMytUNzNrck1lV2MvanE2KzNodXdxQVptNEJD?=
 =?utf-8?B?c0hrMzBkU3JKRDErWisxWGhaMmpmMUxOMXdERlBwdFlMeFFwSmQrYlQ5L0NO?=
 =?utf-8?B?QkRrU2paVDk4ZzhYR1Z6WXZZc084bkxXZk80Y1dSQ0RrU3N0TlRsMmYzL1VV?=
 =?utf-8?B?U09QSEdneVRjWVVOMWhpNUN4dHFuT05FRXUva1Z6dGxjN2dZc2dkQm8wdSs2?=
 =?utf-8?B?TE1LUjE1RUJGL0xROThIaUZYd1dmdFYrYm1IK3N6ZE1Wdi9hSzgzWkNzalJQ?=
 =?utf-8?B?UkZzMzZYMEUwQy91US84SVdEVUNLbGUveExZekI1aEZDODRiMFJLWTNDUlhk?=
 =?utf-8?B?Tkp4WVdFY2hmbmFlVXhLYkFEelBtc1Eyak5DcDNQaVNUT1FEWktiSTdiR05q?=
 =?utf-8?B?RDBKU1FqMUNvd2xrMTVKOUpnd011M3ZMQkcwSGFCUm5STGJoaHExWjF0MHV3?=
 =?utf-8?B?bFAvVWdlMkk4NlcxVHZteFB4MTdnVm80Q0kxSEU4U1k0SnVMWkZ2VlBJbndJ?=
 =?utf-8?B?cEJGWFJVKzMxclMvOUcxaG5pMzZOSnhxOUE3d1NMS3dpRS9pcW1aMi9xaHJF?=
 =?utf-8?B?blMwTGZFd0dqT0JKQlBQY2ZJelhBVDl0dXF5eGJ2Ylc4QUlicUJhZTkwUFBW?=
 =?utf-8?B?NVBVWVp5Mmd1bU8wYzQybyt3ZC80eUNwTndiZVY2L2ZYRk85VFpoSGJMYi9S?=
 =?utf-8?B?cW9aYTdCWEoxTHlSaU1wZ0gwOFJ1RGkvNjIyeUdYZkdteW45RHpTbDgvcVN1?=
 =?utf-8?B?dWV3ZUIzMjk5VG1TZTlLNjM2M0F3OE44OUpab2FVb242WDF1blcvK3JVYTJD?=
 =?utf-8?B?cXdwUDhCZmNybDdxN1FIaElGRHFicHE2TW40VlBocW5EaTFPOE9HZFA2QmMx?=
 =?utf-8?B?N095YTdXbDRJYUpPWDlYN21TL3o0R00xcUZ5MHNVVktBaGJzTXR5c2paa25n?=
 =?utf-8?B?Y0xOblVNWmlTRGtZbFNyZExnUWdXVzNab0JNNitlRUtndUxER3NQK2VkcXVs?=
 =?utf-8?B?OUswcWJQaTdsdC8rVlZGazVnZlc4d1pUTFRVS3M0UjdLK3RndlE0ck1naTR5?=
 =?utf-8?B?dG1PenZrVnRCZ3N2R1l3NDBUaFpqQnRXU05hR3N4UkNNV1ZzZFpnNjNyNi9M?=
 =?utf-8?B?QUpEQ3B0am9oeWM3MlBtUjJnNGFJY3ZnMVF1dDFQWnBISEt6Z0xnbmlxNUxR?=
 =?utf-8?B?YkJTMkdoL0JlUGppOGo5VUp0Qll5ODNkdEM0cFJmWnMzY01OY21Lbjg1OW5p?=
 =?utf-8?B?b3NCQ2wyRFNXMSt2S1A3dGRZVmVVTjl1UHF3N3VVV09SNmcwblEwL015OHlF?=
 =?utf-8?B?YUtvZnhxUW9SamV3Vm1aRDlsa2c1UGdlL0xhK09tczVYaWRsdE51Q2hiYnls?=
 =?utf-8?B?dUdrQ052T1dtTFIvc09lWGJBaDFsaTN1Q3ZIcVpHNEFkS28rK25neWYzdzNY?=
 =?utf-8?B?UEQ5eDh0SWNNNExCazhsYVo2ZlYwZGRKMm1LSGdCRmhoRTYvd2VNNW5LWDd0?=
 =?utf-8?B?eEhlSGpRbXlwL2Z2Vnd0V1B5UVV6M0tPZDYzMWFXbWhkc2RxTXJtSFZYTlE1?=
 =?utf-8?B?VWVFOHpLUFdHS1NWZ2NYcWlQQXdONlBDa1JQZWp5WngvUzJvcXZydEpzL3Rh?=
 =?utf-8?B?UDkrTTA5TWhWUW44RUhzNC9HaTZXRjB5VmVvaWRRajVtYWZlb3BDcXhtV2xv?=
 =?utf-8?B?NmVnSmZDN25IWHhtRkg1b1hGZE44aTJ3Zm40NlFZbXFyMFFkQmJEMnYxOVRQ?=
 =?utf-8?B?YllDdENVR0ZJT0FhOEpXb3JmT2dmM0FkZDlTQnhoclA4ZDRTeTQzT0RhOUJn?=
 =?utf-8?B?SWZXQnF0VEhoVzVVMndud3lCYjBBaUQ5YzJ6RDZNdHFxMkVaUVE1TjBaVVJ3?=
 =?utf-8?B?OSttZy9maW9HMVNTcjBQNHdqaG1RUHI2OTdoSWdEbUxtT3FVSVRxNXpXSW15?=
 =?utf-8?B?WTE1dERTL3FmVVZKTkFKaldsVFVOZkFhcnNvelQzbmFkK1YwSkoxZmR4TW5o?=
 =?utf-8?B?MWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57ba2a00-84c0-4445-39b1-08dc1ca8b6f4
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 06:50:13.0255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Of2nIE7ouE2jnvJOrKnDNX11eeaUEPDDt5VCVZ09CPXvIa4GT4VYzwNCUlYdNnAUdNEvrqDPmJMlzQ/xfIP8Fuy+99bMlu128YcptIRGrDs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8036
X-Proofpoint-GUID: L6U5AfjvZWq_65pWtSYiJQNCpq28TyOE
X-Proofpoint-ORIG-GUID: 3uadWSDZAkntSJEc4e_lZnPZnIyo_5qo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-24_02,2024-01-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 mlxlogscore=999 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401240049
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 06:50:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194262

--------------9hMOQX9CQp0sWCTsa2qeke7W
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 40O6RbIi002124


On 24-01-2024 02:47, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Tue, 2024-01-23 at 20:07 +0000, Richard Purdie via
> lists.openembedded.org wrote:
>> On Tue, 2024-01-23 at 05:16 -0800, Shinde, Yash via
>> lists.openembedded.org wrote:
>>> From: Yash Shinde<Yash.Shinde@windriver.com>
>>>
>>>      Fixes: Exception: no cargo executable found at
>>>             `${B}/rustc-1.74.1-src/build/x86_64-unknown-linux-gnu/sta=
ge0/bin/cargo`
>>>
>>>      Fix the cargo binary path error on oe-selftest and path set to r=
ust-snapshot dir.
>>>
>>>      Patch sent to upstream-https://github.com/rust-lang/rust/pull/12=
0125
>>>
>>> Signed-off-by: Yash Shinde<Yash.Shinde@windriver.com>
>>> ---
>>>   .../rust/files/cargo-path.patch               | 37 ++++++++++++++++=
+++
>>>   1 file changed, 37 insertions(+)
>>>   create mode 100644 meta/recipes-devtools/rust/files/cargo-path.patc=
h
>> Unlike earlier versions of this series, there were a lot of failures:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6482
>>
>> Basically every machine except qemumips failed on the toolchain tests.
> I also meant to mention, we need to improve the test output when it
> fails. It is currently near useless :(

The test output log is redirected to '${B}/rustc-1.74.1-src/summary.txt'=20
file which has
test results and error logs for failed test cases, if any.

I assume you are asking for more details in the cmd window of oe-selftest=
?

$ oe-selftest -r rust

cmdline output:
/
/

/2024-01-23 20:08:39,227 - oe-selftest - INFO - Changing cwd to=20
/home/poky/build
2024-01-23 20:08:39,228 - oe-selftest - INFO - Adding layer libraries:
2024-01-23 20:08:39,228 - oe-selftest - INFO - /home/poky/meta/lib
2024-01-23 20:08:39,228 - oe-selftest - INFO - /home/poky/meta-yocto-bsp/=
lib
2024-01-23 20:08:39,228 - oe-selftest - INFO - /home/poky/meta-selftest/l=
ib
2024-01-23 20:08:39,229 - oe-selftest - INFO - Checking base=20
configuration is valid/parsable
2024-01-23 20:08:40,757 - oe-selftest - INFO - Adding: "include=20
selftest.inc" in /home/poky/build-st/conf/local.conf
2024-01-23 20:08:40,757 - oe-selftest - INFO - Adding: "include=20
bblayers.inc" in bblayers.conf
2024-01-23 20:08:40,758 - oe-selftest - INFO - test_rust=20
(rust.RustSelfTestSystemEmulated)
2024-01-23 21:22:50,600 - oe-selftest - INFO -=C2=A0 ... ok
2024-01-23 21:22:50,622 - oe-selftest - INFO -=20
----------------------------------------------------------------------
2024-01-23 21:22:50,622 - oe-selftest - INFO - Ran 1 test in 4450.264s
2024-01-23 21:22:50,622 - oe-selftest - INFO - OK
2024-01-23 21:23:08,292 - oe-selftest - INFO - RESULTS:
2024-01-23 21:23:08,292 - oe-selftest - INFO - RESULTS -=20
rust.RustSelfTestSystemEmulated.test_rust: PASSED (4449.86s)
2024-01-23 21:23:08,477 - oe-selftest - INFO - SUMMARY:
2024-01-23 21:23:08,478 - oe-selftest - INFO - oe-selftest () - Ran 1=20
test in 4450.264s
2024-01-23 21:23:08,478 - oe-selftest - INFO - oe-selftest - OK - All=20
required tests passed (successes=3D1, skipped=3D0, failures=3D0, errors=3D=
0)
/
Currently, it shows above info which is similar to other toolchain=20
oe-selftests.
Let me know how the output log should look like?


Regards,
Yash

> Cheers,
>
> Richard
--------------9hMOQX9CQp0sWCTsa2qeke7W
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 24-01-2024 02:47, Richard Purdie
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1c7059e4c0bad63e7510f5dafff81bbdfba474e6.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Tue, 2024-01-23 at 20:07 +0000, Richard Purdie via
lists.openembedded.org wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On Tue, 2024-01-23 at 05:16 -0800, Shinde, Yash via
lists.openembedded.org wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">From: Yash Shinde <a class="moz-txt-link-rfc2396E" href="mailto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>

    Fixes: Exception: no cargo executable found at
           `${B}/rustc-1.74.1-src/build/x86_64-unknown-linux-gnu/stage0/bin/cargo`

    Fix the cargo binary path error on oe-selftest and path set to rust-snapshot dir.

    Patch sent to upstream- <a class="moz-txt-link-freetext" href="https://github.com/rust-lang/rust/pull/120125">https://github.com/rust-lang/rust/pull/120125</a>

Signed-off-by: Yash Shinde <a class="moz-txt-link-rfc2396E" href="mailto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>
---
 .../rust/files/cargo-path.patch               | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/cargo-path.patch
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Unlike earlier versions of this series, there were a lot of failures:

<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6482">https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6482</a>

Basically every machine except qemumips failed on the toolchain tests.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I also meant to mention, we need to improve the test output when it
fails. It is currently near useless :(</pre>
    </blockquote>
    <p>The test output log is redirected to '<span style="white-space: pre-wrap">${B}/rustc-1.74.1-src/summary.txt</span>'
      file which has <br>
      test results and error logs for failed test cases, if any.<br>
      <br>
      I assume you are asking for more details in the cmd window of
      oe-selftest?<br>
      <br>
      $ oe-selftest -r rust<br>
      <br>
      cmdline output:<br>
      <i><br>
      </i></p>
    <p><i>2024-01-23 20:08:39,227 - oe-selftest - INFO - Changing cwd to
        /home/poky/build<br>
        2024-01-23 20:08:39,228 - oe-selftest - INFO - Adding layer
        libraries:<br>
        2024-01-23 20:08:39,228 - oe-selftest - INFO -&nbsp;
        /home/poky/meta/lib<br>
        2024-01-23 20:08:39,228 - oe-selftest - INFO -&nbsp;
        /home/poky/meta-yocto-bsp/lib<br>
        2024-01-23 20:08:39,228 - oe-selftest - INFO -&nbsp;
        /home/poky/meta-selftest/lib<br>
        2024-01-23 20:08:39,229 - oe-selftest - INFO - Checking base
        configuration is valid/parsable<br>
        2024-01-23 20:08:40,757 - oe-selftest - INFO - Adding: &quot;include
        selftest.inc&quot; in /home/poky/build-st/conf/local.conf<br>
        2024-01-23 20:08:40,757 - oe-selftest - INFO - Adding: &quot;include
        bblayers.inc&quot; in bblayers.conf<br>
        2024-01-23 20:08:40,758 - oe-selftest - INFO - test_rust
        (rust.RustSelfTestSystemEmulated)<br>
        2024-01-23 21:22:50,600 - oe-selftest - INFO -&nbsp; ... ok<br>
        2024-01-23 21:22:50,622 - oe-selftest - INFO -
        ----------------------------------------------------------------------<br>
        2024-01-23 21:22:50,622 - oe-selftest - INFO - Ran 1 test in
        4450.264s<br>
        2024-01-23 21:22:50,622 - oe-selftest - INFO - OK<br>
        2024-01-23 21:23:08,292 - oe-selftest - INFO - RESULTS:<br>
        2024-01-23 21:23:08,292 - oe-selftest - INFO - RESULTS -
        rust.RustSelfTestSystemEmulated.test_rust: PASSED (4449.86s)<br>
        2024-01-23 21:23:08,477 - oe-selftest - INFO - SUMMARY:<br>
        2024-01-23 21:23:08,478 - oe-selftest - INFO - oe-selftest () -
        Ran 1 test in 4450.264s<br>
        2024-01-23 21:23:08,478 - oe-selftest - INFO - oe-selftest - OK
        - All required tests passed (successes=1, skipped=0, failures=0,
        errors=0)<br>
      </i><br>
      Currently, it shows above info which is similar to other toolchain
      oe-selftests.<br>
      Let me know how the output log should look like?<br>
      <br>
      <br>
      Regards,<br>
      Yash<span style="white-space: pre-wrap">
</span></p>
    <blockquote type="cite" cite="mid:1c7059e4c0bad63e7510f5dafff81bbdfba474e6.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">
Cheers,

Richard
</pre>
    </blockquote>
  </body>
</html>

--------------9hMOQX9CQp0sWCTsa2qeke7W--

