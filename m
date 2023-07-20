Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37D73C001B0
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 02:39:53 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.4775.1689820787872153701
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jul 2023 19:39:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=RzrB/SDV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=65658e6de2=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36K2E2WH015382
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 02:39:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=L2pBHet5m6vGCX2XiSZSRq5gxq/YFYZUBKaDGslcLKk=; b=
	RzrB/SDVhNj1bh3vubL/i66R5iyKEAsp+2I2Y8DVjGdIU+5kxNu2WkcsPbRr3fOQ
	W5msSkM9KEzB2+Toq5OEr3qr5TKbiqDn0FRooQ8CVX18Tjbpha4Xa3DBLhX0m0zZ
	CwQuPbuB18kJOIg+7GxAyPfR41vSz53yzjSvaGwc3cxg8D6TlhcleNk1eq9Mhyeb
	v8lvXEC2omNkrYc7TZy5jzbn8o6DESUw9F0lzwSHv/Z+hcJmZ0Gpn3l3AnLevXK8
	WSK3RWThBrPDHOk6VSZWcYY4bbcgn3HYgrhLFS15B7BCTPTIzQuc/EQVoiImf4Gu
	kQ1zgAa8DY33vQhBCPa+zw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3run8ac8xp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 02:39:46 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 36K2dkcb016943
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 02:39:46 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3run8ac8xn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jul 2023 02:39:46 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xg3alx65KLrT0KRMD1sPvfbTY/iAuWYEfHihf48UXxjCMeSlwiFvjlgjsHHba5tOed55UVrN5T6jJgpPDTQ0QznDw/v+Sm9ccTR5gY0CS8RndP+dRpCHoz8tXZ0jD1Htce7T3SDZWl0JAIb5hHnzJHI1FneGgT+uzmDjPGYoyqMT5YX8AGJ6oOgo4JGAQ69PuOibVCoBe5QAsqyPhwJkaDVUKzlJQCERgHVDva0hYoNZVrgn+DWUXgHrJR6pzriVxW9o0pZKL7kXws1Zy9nCizc3DMcJSBKSgqjB3qPwYN4S6Mp/Ddgz0yL8f+cIOAY+5FfPSJF9X/SDNq0np2Zg1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L2pBHet5m6vGCX2XiSZSRq5gxq/YFYZUBKaDGslcLKk=;
 b=bciMBa+ntxS6NQSvAoU3IIQgmlvACw+Bt9yWuzfc6cOvLspDLjxl8XMhl2BXuS58gXmiUrq9SW5KKG2D1Ud8mLgpIjX3HNDKySEjh9A5w3NIpmRHRNAk8pdaouuegVDGIpr+rUMWFxPL7x2MQJ30NJ/Q7K/PWslaLMxSoZD8c/XnYLTDUGTcp4py6Y/KbRX8MALLUL23FLnXCVGl7SeRSBoWGQhY8CelnTlwTnVLfJE7QHouRLL+V7dKcz5nN9h+hJoqtXsTWaA4Niy2Lx6apN8bQKraKaHcc9D+5O9cGU0auWUSb0jwKnYkQG6aAFuzACmXSj5B7PklMX8pdc2L5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by CY8PR11MB6842.namprd11.prod.outlook.com (2603:10b6:930:61::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Thu, 20 Jul
 2023 02:39:43 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::dd05:531c:7914:ce9f]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::dd05:531c:7914:ce9f%4]) with mapi id 15.20.6609.024; Thu, 20 Jul 2023
 02:39:43 +0000
Message-ID: <901588eb-0d0a-90c0-c26f-6c3774480152@windriver.com>
Date: Thu, 20 Jul 2023 10:39:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH v3] qemu: Add qemu-common package
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        "Yu, Mingli" <mingli.yu@eng.windriver.com>,
        alexandre.belloni@bootlin.com
Cc: openembedded-core@lists.openembedded.org, Ross.Burton@arm.com
References: <E57733DA-39D3-494F-A91D-9AA8306DBDAB@arm.com>
 <20230710103218.3834001-1-mingli.yu@eng.windriver.com>
 <2023071611474165f97b23@mail.local>
 <919cae59-a542-5a51-e70e-164b5306eb41@windriver.com>
 <202307171246212fd06366@mail.local>
 <9441c96a-33fe-19d4-4228-54a8f4ea413a@windriver.com>
 <20230719092014d84e04f9@mail.local>
 <5ef0c81123f4abb3be2234cd8598cfa0a4cffea5.camel@linuxfoundation.org>
 <078073d8-60c9-1cdd-e7be-cd3cf63e7dda@windriver.com>
 <a49258e57c93b7aafd3269952e073f24d5c217a6.camel@linuxfoundation.org>
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <a49258e57c93b7aafd3269952e073f24d5c217a6.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0159.apcprd04.prod.outlook.com (2603:1096:4::21)
 To CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|CY8PR11MB6842:EE_
X-MS-Office365-Filtering-Correlation-Id: cc5f7850-9b26-4961-6a10-08db88ca92c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vYdpikHK0RxBbFVtZ0gmz3OI8i3KmI3maOrToRLKqdltdsgEtxnxAYnDVIz1mTH6iw6aTON+r5shUFAflGcmq3IfXoWuz0w0lAnuBWq1WkaDn369iwfuiRDIJQkXMLjm8mwdN/b6QrjjrGcIEBoyVhybycFrhleIqRZOektKyKak486/UOw3/uGXB8rXuAUWHBKCHDA6AqLBgW9Nx9411W43dlI8iI++koaEHw0CqelBVKkRvmsMtPnl2aV8T4Ia01HpLc7YJ/Dz5/nMhsfNwHtX7XHdfXCTUjSrPSAkUuI++KrnVVCP6JBBL2Wa5FYa8DaSF6X73BebAuELA01Ich5nAfwOgxNqgv5e6R9tJd1qb5olnLcp1raGt05EVmHjJqUcs82H3cKfk0VRBXpMSrgpsM25dHKQnva/JGvfU0I1DktyGunDWfwdO6k2Vq9fubhnU7o6JX8aIaJMAAsJDSKQNm1MXpyrh2nU6DV8ixETLCrXls0lTbc5xtvTjG3mkr+UNnGvdyOXmLCSASMr4NWmSL7WNNmtGZpI+/84lHK5iqUz3PBM8j+KmssXFSJPJ9E4me3vxjSOy3BHQXmM3eK6XaeLib7aTD2MNQaFkM5OPUOsyS3NPO9Im8KJJryUcbW0zsVXvkGRlG1t9NLWew==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(346002)(136003)(376002)(39850400004)(451199021)(53546011)(6512007)(31686004)(2906002)(478600001)(6486002)(36756003)(8936002)(8676002)(4326008)(110136005)(66476007)(41300700001)(66556008)(66946007)(316002)(31696002)(83380400001)(38100700002)(26005)(86362001)(6666004)(6506007)(5660300002)(2616005)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZXRLUVB3SGlpNUl2NHJ4VzJzMmgzOWtxaGtSc2cxQmdSRTYrQTlGa1N0bk8y?=
 =?utf-8?B?cUNCZGlrZjdwdUFjc3JtK0NYNzVXYXdzeXBvUHBKNUdBMENnUS9MbElGZ2lk?=
 =?utf-8?B?Qnp6VDA3RXBQUWh1eDJOK3RUQnp1bmYyOFdvZmlEQjR2N3VmN3Y4R3l1Vnls?=
 =?utf-8?B?eVJLekJBcEYwUW1qTHhtZGRIM2RSa0M4dlpXUXoxbERsaWhyOVBuTElnRlhV?=
 =?utf-8?B?am10R05oaHNzWmlWWDVidzR0VmljcElFdmE3dTluMm5IR2E5aGkvcmExOHAw?=
 =?utf-8?B?UGkxQ1VCMzl6OHNaakNISGREUU9aNnI4Y1NmS3IxSVBCbXdzcVVyYkxweU4x?=
 =?utf-8?B?bG51OVJWTDhDSFFVaWlZTDVtWDhDNGZ5R05FZDZsZ05abWVaTXZod2l2cHhr?=
 =?utf-8?B?dU5Wa2tieWEzOElZODlRcWU4TFRtZ0J5a0lLUkY5eGJ4T01wajdiZUR1dkRh?=
 =?utf-8?B?MUM2WTlHMUsyWWtVNytRcTlSZytxOHN4ZStETFUwMktCeE1lY0lIcFBiOCtH?=
 =?utf-8?B?MnA3YlpwbDNrT3EvZjVXbG9zMFZ6blcvYy81bWphcGcxanN6RUdaK1pwY0lK?=
 =?utf-8?B?MmQ1NysyY3VzQVBoVyt0dlRQdXg4NXU5V2xoRjlFaFRTYlNyZDR4UDBqRS85?=
 =?utf-8?B?TitkZDhYT0N5K1l4SFRmRFFhTXpJRkZKNmtZRnptR0ZSa25EcmdZWEo5U2Ns?=
 =?utf-8?B?MkttYWg5ZHQxYTZHTFYzNDY5VjhMMXQ1MnhUcU5iQXQ5Zmk2TjRldDVDN3FK?=
 =?utf-8?B?UFZZV0tzaFNtS3BpYWQ0Wi9TYkZLQjU3aFNVdWdmb3VqMU43UG5Ha1VqTzdu?=
 =?utf-8?B?SkxJKzVmS1ZlTXJUdnhmRFJ4UXRWQTQrS2llOEdSbXkva1NRS1RNZ0FvbmZW?=
 =?utf-8?B?R0hzSEp5anI0TlRJQjBDQitTQTZUbFNYYk42cGw5Z0lRR2RmSUtVV2xiSUkx?=
 =?utf-8?B?c2J0UW84U0dRWWxGWjhlWGlFOEZhb2l3M09uaDZvREVYZEJwSThqenMrdFQ4?=
 =?utf-8?B?Z05UMWM5SnQ1bmQxdDZWWis4aTdLd1Z2SWFUdmNaVWtXMGthL3VLUzNoSHpr?=
 =?utf-8?B?Y3A5OFcrdmpoWDV4aVF0S3hTa1pzem9SVXBiZVNFYkd6bUhrNERsbCtOT25J?=
 =?utf-8?B?a0hudHgxSFltTFdyQUFMblpoMlZucmIvWFVjTWdSMTRoUERtZ1V0OEhwNFFC?=
 =?utf-8?B?ZG5PK3UvOGoxZUxKM2IzK2crZVM5V3B5ZnlKUFRKMUpCdDRZREtHTCtMTnBz?=
 =?utf-8?B?czc1ZzNTdzJ2TWcyb1lTRlowVWRaRytSUGl2cnRVb2FhVDBLSWV5SzZlR0E0?=
 =?utf-8?B?anZiaUd0bmVOTms0SjM1eExxUXNKOWNuaW1jWTRlT3VRYXRXemQvb3RQZHVV?=
 =?utf-8?B?RkpnaDNmditjc3ZGYjFnT1hRKzZuQlNFOU03cmh3RDlIRlZJaXdUVXJObU9j?=
 =?utf-8?B?WkF2emg0S09LcjJMTFYyb3JEam9wTnU4N0pqa201M2F4bk16bmNaR2hQdUVm?=
 =?utf-8?B?RXhZdmNQYTBKV05nd21TNWFteWZEdGE1TjBJdWNNNU9mMysyZlRaVUxjTXJ5?=
 =?utf-8?B?a3JrN0lnS0lNd29MZnlwY3gxZ0FSeHQ2Y2d2S2Mwd3NDRFdWWkVzRDU0Nzhi?=
 =?utf-8?B?YnowdzR0VThzZVhRd2FCNE9VZ2d6K1YwalY2V05sMHA5NG5jOXpXNmhpd0Q5?=
 =?utf-8?B?N05ydXlxcXdVTWptWTlpaElvSkVUWFJTMXhzYmxOTVJxa2ZoWm85akxBV0xR?=
 =?utf-8?B?bVRjS040RXF6TU1DMTFTSFhNc2VNdldnRGtKL09CWFRuUnUyUkhVV2ZuOWNt?=
 =?utf-8?B?N3FlL1ZGcWJhRk5RTEpwMXRMY05PRFNxRXhpaDBGcCtKVEdjMm9MZU51REx5?=
 =?utf-8?B?TnpMZEJBWkxXZ0JGQkNjN1dFSEpHMHRIalpjODNNbzVjZVhBdUZJOUFIVm5j?=
 =?utf-8?B?Z2lack91NzR4aHdLTXZzTkNyUEFMWUcrdHQxNFB5akRLSm5PODNmc2ExZGNa?=
 =?utf-8?B?ek5EZWxtd0RwcDlyaENWNnQzUnlKbUZHanpsVVU5b1c4R2xITWUwV2VzOHc0?=
 =?utf-8?B?VEF1THZkM0lTTnRBay9sbmRjMFJBazYzeGNCMU1yd0lhcmNUeGFMRUQyS1Yw?=
 =?utf-8?Q?+O//XqWdy7muPNVwQEe64rdlf?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc5f7850-9b26-4961-6a10-08db88ca92c5
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 02:39:43.3169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M0JbpUqSZKFEy0qIuLqq5lLs3rJbb28LFTV3p2jrL7Ce5ak5TWRoCClyyK9bQzCP3Fi396dJpKE+0ITKHm/C0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6842
X-Proofpoint-GUID: bCjfh5ucWQH_OVgbnGxm42F88IePFNOP
X-Proofpoint-ORIG-GUID: gU7R3uMBKj_8ClFf8rKmUCjO_VDj8sXR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-19_16,2023-07-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=644 clxscore=1015 adultscore=0 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2307200018
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 02:39:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184619

Hi Richard,

On 7/19/23 18:08, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> On Wed, 2023-07-19 at 17:39 +0800, Yu, Mingli wrote:
>> On 7/19/23 17:24, Richard Purdie wrote:
>>>>
>>>> It is relevant, this is because of the dependency that this gets built
>>>> and fails. I've seen v4 but didn't have the time to test it yet.
>>>
>>> I've still not seen an answer to Ross' question or mine about why we
>>> can't just add a couple of dependencies and resolve things that way.
>>
>> Sorry for delayed respond!
>>
>> Have added qemu-common to make qemu as meta package to keep backward
>> compatibility. For user who install qemu rpm such as
>> qemu-7.2.0-r0.corei7_64.rpm, it still pull in all of things as before.
>> For user who cares the rpm size, can just choose to install the needed
>> qemu arch rpms such as qemu-system-aarch64-7.2.0-r0.corei7_64.rpm.
> 
> So why not just add:
> 
> RRECOMMENDS:${PN} += "${PN}-system-all ${PN}-user-all"
> 
> as I think we've then covered all the options we need?

If just add RRECOMMENDS:${PN} += "${PN}-system-all ${PN}-user-all" by 
default, then how about the user who want only install 
qemu-system-aarch64-7.2.0-r0.corei7_64.rpm still install all qemu 
binaries as qemu-system-aarch64 rdepends on qemu which RRECOMMENDS 
qemu-system-all and 
qemu-user-all(https://git.openembedded.org/openembedded-core/commit/?id=893846ead7ee54d53e9076150cd655e0c8bca5db).

So it's better make qemu as meta package to keep backward compatibility 
for user who install qemu can install all qemu binaries as before and 
also can meet the need for user who want just install qemu arm64 
emulation rpm such as 
qemu-system-aarch64-7.2.0-r0.corei7_64.rpm(https://patchwork.yoctoproject.org/project/oe-core/patch/20230717071114.2734859-1-mingli.yu@eng.windriver.com/) 
via adding IMAGE_INSTALL:append = " qemu-system-aarch64" into 
conf/local.conf.

Thanks,

> 
> Cheers,
> 
> Richard

