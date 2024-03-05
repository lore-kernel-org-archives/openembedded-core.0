Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DF7FC54E49
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 01:24:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.11276.1709601862226067569
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Mar 2024 17:24:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=N3sfb0Je;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3794bdc821=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 424MVoIo003131
	for <openembedded-core@lists.openembedded.org>; Tue, 5 Mar 2024 01:24:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=uf/axfH6fLZbAsh96SrPb0SMwbZYDJXI2pPGOkh6EjE=; b=
	N3sfb0JeLiFbjQfa+5e0DZVYq9bhuIt2uSPMPG6OCkqnisReATNAxTTfDtiBj/ug
	6xmfjd7L1QfInXXRgO1Rk67EZt7pCWDV6nrb6B7V92Wfwtj1lTn5OnZEvU3daKor
	/7oC1gaGco2UAOp0PlhFVL/Ipz1pyfX/JmemCFTK1qNpO4+/On3NhXW5iDSvxzXA
	/LKc/Qm+GTpMC5ZgriKH5arrZi914qEPSu+r6evU0Mw2f1pGVAHTn2JhyeuIhicZ
	SCviwDvo+q0ZnrBfOJ+2ka96TuxPK0QmgyWqSY2oTT0cr65/xD3VsDop0/PNSwbE
	YcNofW9VK9lpwSq0DKAtyA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wku36a9r7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 05 Mar 2024 01:24:19 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 4251OJoA011750;
	Tue, 5 Mar 2024 01:24:19 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wku36a9r6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Mar 2024 01:24:19 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EqTr4JdYKFfk0YF8srP/rlLy2sk+ShKHrLw9lFtdY4Ys5ynm9gtHHl6EEujpx9XHCEsHNwvHSHB0NmYFGt82pMA5aMRNy9cqQZZeyYc62U4wcHAek4PGK5SLUs7cnN3WgQuG34ylgAe4XdfVqNvNyNFaqOvvZul2I+bqnuppx5algcHk69WgYvH2FjbhYpTdmaxpkbqHgtMUmGSLhofeIuuqJqgNAqAIhgT7ztaQobUF3OJtvFaMz/1na0jE/Y8hkUnA/gbf+473rC4WhAcWRybOhb7VIG0uWkxsQEl57OqFLMPtWXG6DbUB0USaiamOlnsX47+lskJ928HmJlgtJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uf/axfH6fLZbAsh96SrPb0SMwbZYDJXI2pPGOkh6EjE=;
 b=PdwyTqxS/93nf/aMUXvGVTwkuHoqkk5QsnmS5dqd4Si6fc8qWgcB5Afr2I6DN00tu1xKXkz+kGjWjiz5yhRV1tvufno8jQqrU5119YVXMtEHw8TQXl80BA2wDAPBEsuaWDmOe+Nh7hnMU0ZhJMVgXT+NnXbHyOVz9NqqDdCpU2GZr8Zy37Sr3+9Eu6gyPTv3oEDF3K3sG8VxjbaGW90rCs179H4rF8FVPaJEAJpBNPrOv6V6v8n3ezdwj9R4npp+LwGeYjogBXfeshLaaQdRYJvWbH3nPvNIvU6zvpeuZZu100CVR6ya4q6X9dVmOq+x2g15Yok0/oROTcZYgkoHfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14) by
 SA1PR11MB7088.namprd11.prod.outlook.com (2603:10b6:806:2b7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23; Tue, 5 Mar
 2024 01:24:16 +0000
Received: from DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::a2e7:f760:65c9:ea47]) by DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::a2e7:f760:65c9:ea47%5]) with mapi id 15.20.7362.019; Tue, 5 Mar 2024
 01:24:16 +0000
Message-ID: <2783e698-9f43-4843-ac77-db41fedd35e3@windriver.com>
Date: Tue, 5 Mar 2024 09:23:51 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] glibc: fix multilib headers conflict for arm
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Kai Kang <kai.kang@eng.windriver.com>,
        openembedded-core@lists.openembedded.org
References: <20240304011249.1930843-1-kai.kang@windriver.com>
 <b023614f7765fc003a4aa854440c0b66d200d27b.camel@linuxfoundation.org>
From: Kai <kai.kang@windriver.com>
In-Reply-To: <b023614f7765fc003a4aa854440c0b66d200d27b.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI1PR02CA0055.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::16) To DS7PR11MB6064.namprd11.prod.outlook.com
 (2603:10b6:8:77::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6064:EE_|SA1PR11MB7088:EE_
X-MS-Office365-Filtering-Correlation-Id: 56d2d216-bf42-479b-10e5-08dc3cb2f8ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VYBzEko9QCTM6TMGuwr7/emwHyI47YKN6aQf/Og+qTZR5iAkr0oERJMTdW3onstdkmpVleCCED+djLYfv5YbN8nkeCSjmTziDS/NirANlQ/6ODpCQ0ZP4c/PGscAkvNRpbOgVcPAuNwaIPOf5IqtQhyWqtTNZ51kSVyGXR84j6WX2uYKj/o0jYxkBWi6YAbwGnCMyrVaUhvsyulElOjYvNwRHse/p/1rCRts59NoGdG60bzdR8DHd5Ko0AL7et6bkH7yAn9RYsmWwFKwMh144qSmETJMy8lKTmrN0GYkhZtyD1DdyiAvlCrBzvi+4eGxd6prdWZpJlKTBrHodJvf+HDPlrsO2whiOnocQBT2wy5/TZheYC5cFUN0zowWXJz9pIcT9oP36B8eaKDbIeO2CfP60r7cPe9J5HmlVcjJY8fw0l8Nz+Nlz9YZQoIuHLHWvAoD6zpi4K5hjIc1wtZ5la28iDyLuQSdr0Lj+k/9s0Lk/zoaxx+Wormsbag7Swfb2xzp/nKtn7QhJSv4eKTai10yE96oEsif6w86lHIzd9NXZeqz7WYDRRypbkyDdnYa+JDRBfaHtBbha7pi821CJfXslRhTAQJyZMKLq75RiAQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6064.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dklaLzdwQ0twMkZqYzNISzV6eTByaG82ZUhXWFp2cXJQeTJDdHcxZ2wvTFB3?=
 =?utf-8?B?dFpoc1FSNmVNcUszZVROWWZuSk9Na1YrRVcvM3loUys5YkVPbXNmR3FmaDFO?=
 =?utf-8?B?c1dwckFBd3I0ZGI0ZGs3a3VFdVIrbnNVbTduYmdkZVhsYitYZ1BHQm9LbG01?=
 =?utf-8?B?MnBxSFNQS3plWEJjMktRZ3hEbHlCNWVvVTJHMkc2dFUzZCs0cUJiallYSDIr?=
 =?utf-8?B?bmtyUWtCWmFOeFlmYXRnb0tCOFJML0djZkNDTGk2YWJOcG8zSVl5ZzZkTit6?=
 =?utf-8?B?Y3A3cVZUQXl5bytTNXdJWU53WWwvV3I1WUU1a1JISGhWQmJQWHNpQ29sM09M?=
 =?utf-8?B?UXY4dlJidWs5a2FUblh1MURuMDhTaVZMV2tWMUdYektGVTRWVE9Pak83RTZS?=
 =?utf-8?B?Zkw4Y25VcjF6SUxKQkJjTS84ejV3ODZkRjdLRVhZQ2hra0x0Wml4SXJkMXBS?=
 =?utf-8?B?a21JZkxTb0pPMnRrK3VZbkhMMkNtc3B4dHhsOHpxejM0ZG9lTUdUclBTUGcw?=
 =?utf-8?B?SlVqMGRVM0krazRaMmlsZXJWRWxUMnpMMW9GWlFMZU8xKzBncW5iK1V3UzNk?=
 =?utf-8?B?NWxSV2lTUEFPNkNwb2ljaGx5ckhRcXpEZWN5enpUUVR4NGdsd3E1bjdWR29u?=
 =?utf-8?B?VnVJYzJQYzY4K0NqYzRvL0Z3Sm45SEhEYU5hUmNNL09FT1I3aDhISUFqeU11?=
 =?utf-8?B?Q0ZXNURCWFpFZkY0VVgvdFBXYWh1SVI1VkFsN05EZkp6VnJBbHBMUTZsVGgz?=
 =?utf-8?B?S0NwSm16TFR1Z1YyWFVGZDhvTnNleUMxV1NtdTJNeDh2bWFaUTVwQnFWcmll?=
 =?utf-8?B?SmZLdlVWc2thVnRWUjhIc1k2UzNIV1QzQm1zeGhVYXRBWXZoZUszYkVqdXRy?=
 =?utf-8?B?Z1Q2V01hMi9nSUVocjlta2x0REFmeVBBZjNIQk5ZUFJBc3FmQnJLcWVvRytj?=
 =?utf-8?B?RFZFVXRMK0oyUmtCeFBpcDFFcGVhVHZCQ21JODZOS0kraERLaXNYa0ZRYmJO?=
 =?utf-8?B?WUhSS0JKd2g0OVE2SXVwM2FhRkxIQzBvSFlCNWx4eEZ1UDRjT2dBNFhJWHRn?=
 =?utf-8?B?cktrU1NuaGhUcU9lbEc5c1J3OXZ1by9mK0FSeHhUVUE1cjd0OHozRTcxMXY3?=
 =?utf-8?B?VXdlaWdKR1Q4QnR2QXhscU5LYWlrQnZ2aldKNHNoOXBLaGZMc3Z3Z1JKWktK?=
 =?utf-8?B?Ky9OQjY0TGFTS0JpSHIwTVBMLzE2c1R6MHpJWk90aVlwcjRnQ3AzdEZOeEVW?=
 =?utf-8?B?QlpuYVk2MGpXazhxT2JhVlZnbDEveWtJbVVTVmp6UGF3aCs3VE1rV2w3RVE2?=
 =?utf-8?B?WDZjV3lmVFAvNUw5Ry9wMmI3MVVOU1lwbkgyc2lUcWJGNFRLdzJGTjZNU0Jz?=
 =?utf-8?B?N0MvaUNSV25wQ3ZPZmRYS2RsQSt5VEtzRnF5V2tZQUltYVNvR1A1N2VQNzNi?=
 =?utf-8?B?MjQrV3RwOXRIOHc0RnV3QmJ1SitVMllsMFBINE9GVDNDdi9WQmUzaHdQWEFM?=
 =?utf-8?B?azZoTnJ3UnFZemdreC8yTEN0dTlHeHhjY01xaERBRWNEMTQ4czIraWJBQzdt?=
 =?utf-8?B?N1ZnVlFtMEZKNzR2K2hpaTVLSHhTSTBnbnhKbnJZdUFONU1xNWw5UjM4cmZv?=
 =?utf-8?B?QUtGenZkMEk3VG5nYVdiM0xzYVE0RUVFbWZJRERsTU94dnlveUJPYzg0TUNi?=
 =?utf-8?B?WnZYb3RuQkpMRm51N3NQamt1ZjRoK1pNSWdsRkZmb0pQRGpLQnlKcysyZG9U?=
 =?utf-8?B?VlhucGRKNmZERm82eVcvMWU1KzE4WUNoMHR5UFhhNkxGT29BSVNtWWRtL0hh?=
 =?utf-8?B?T3FjaFMxcTVNc2Z2bU8vRWdEYldiZGZleWhId01ZNVVtWktnVVlsd0FTYVpB?=
 =?utf-8?B?MmV0eEdRZVhpOU5NenBTUDlCNTM5RCtPM1F6UXlCajl6TW9Hais5QTdXS2t3?=
 =?utf-8?B?STIvQzRxRldRZ2txdFR2MENZd3BRTmkrZEc0S2dhU0FZNTZ0Z3BCK1h2VFRH?=
 =?utf-8?B?ZDE2WGxyemY1RjBYcTFRTzI3ZXNwM3hGWkUwNTBrNnhqMTYwL0dSZ3pVaEMr?=
 =?utf-8?B?MXdsa2p1cnBiVDVKYTN1NHNTNy9LeEJxVDZ2MmtrajVoNjZxTWh5QTNKMjB3?=
 =?utf-8?Q?Lb13Lx+bfqKTx+eJN1ZOoMUmX?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56d2d216-bf42-479b-10e5-08dc3cb2f8ef
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 01:24:16.1010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EQ0dEm2dFWn/hJuxLctOk8poyxpYbbD25pCC0aCblRSc3+d+fvmKD+O4VNHBtdtM0+W60HE0bHFgmXMrGqWQ3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7088
X-Proofpoint-ORIG-GUID: 0JYpORD72Z0oufzGXpFsnRdKuPM4_pEX
X-Proofpoint-GUID: FkVrELDjkvITBO9s0yxv6SG5CnxgXFd4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-04_20,2024-03-04_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403050007
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 424MVoIo003131
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Mar 2024 01:24:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196620

On 3/5/24 01:00, Richard Purdie wrote:
> On Mon, 2024-03-04 at 09:12 +0800, Kai Kang wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> The header files conflic when multilib enabled for arm:
>>
>>> Error: Transaction test error:
>>>  =C2=A0 file /usr/include/finclude/math-vector-fortran.h conflicts be=
tween attempted installs of
>>  =C2=A0=C2=A0=C2=A0 lib32-libc6-dev-2.39+git0+312e159626-r0.armv7at2hf=
_neon and libc6-dev-2.39+git0+312e159626-r0.cortexa72
>>
>> Invoke function oe_multilib_header to resolve it.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>  =C2=A0meta/recipes-core/glibc/glibc-package.inc | 2 ++
>>  =C2=A01 file changed, 2 insertions(+)
> It may fix conflicts but it appears to break the fortran compiler:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/2987=
/steps/14/logs/stdio
>
> I've not specifically bisected it to this but it does seem most likely.

OK. I'll figure it out.

Regards,
kai

>
> Cheers,
>
> Richard


--=20
Kai Kang
Wind River Linux


