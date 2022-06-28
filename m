Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 248E9C433EF
	for <webhook@archiver.kernel.org>; Tue, 28 Jun 2022 22:24:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.4699.1656455035182264516
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jun 2022 15:23:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=WAy8FuDp;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=4178f71ff9=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25SLhhw9006028
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Jun 2022 22:23:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=djcYq5kdNwtKCwZrtb0/8/Uv3YGuxA5gLEAidcWlv9A=;
 b=WAy8FuDpozwGWWACezr1OYgi3Dh64eixJjk4fqeQOffea1g+4onPLSvXsIBx7Sn0sePj
 o89TN+0teX4XMoP0Bs2CO9w/A0i5D9ddi/AjQTSgvPom6TMZ4B1FCxSh9kR007IlLtEe
 q/9G11h8bLmB2xTdEWFnesQCYURiPP7UBIKo80jRbC72nwycICvIBupqrbucWbEQZ5lU
 V8Lu4zi2ZR6BGwm76Od0sKzZ2ydJ9VGxD7KLcknyGTj4C+n2OTpEEW2pwnemlopCu4oi
 iezJjv+OKwhGE+y0wKPTaveTEOB41631PbncYtSrj3uOC0IObUUvuw2rgu8RQcbfUEzZ bg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gwsbajq7w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jun 2022 22:23:54 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25SMNr6Q021758
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Jun 2022 22:23:53 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gwsbajq7v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jun 2022 22:23:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i0JE72fzRN71Yrj6HVlNrZznpIS/2jYrZ/HifOqjerSQ0GELbhaCz9clRnqMhI35sgSMw0pS2NY3RcapDK5Fyi2IXE/Q6rNID0kpuDCYdxvVkTklWWQK+XeChmhyXlbGPx5mMLSzgqRcc1pyFl/ExzRk5RX5ZME4Pe9a0hwoUgVMfMKzL5j0xCl9fKYfAwL5SYfx0JBAdsvt4UQ+I2Gh7aGzzbrA++DQp/bxLs5C49udqb5H9IOVo7YXoQaj+4v0Q+/UTheo8qnqgCAN/RfTkDRCLU6e7diUtIm7rUodprJGisrYDGr84iY6voBVIRFrbm1CgfBdCwRcO96Dsx4/DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=djcYq5kdNwtKCwZrtb0/8/Uv3YGuxA5gLEAidcWlv9A=;
 b=keUqAGg3AcG9rT/o7ygm0mUHrMC/iEYXfc+GVNZ8YxPxYw7jxvrXHzwrYS2mORfIqtMi12WLA+Q/+jjWUzCgsg7/UCG6rsc7yzhELynMIy513Qi6cRTJ9p2sC0OR8eVOFVcjf7o9HpzU38IQguEQu3phbIaT4vqtLqT8aevPalfeLX/83aUUJJXva7833OSYxEYRBJGsEieYNca2lIjlLNR+w67b3EeiX//ul777Yk7I60hj6tsHuS3yD7MlCW/zrUvCHGKEDaFw6rRhwPkmQrGPH72bx7vgiXk/NLQk4zQ/qUf043tDGr/llr6aGW0Slk3/RusxHooikBdYYwraIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by BN6PR11MB1234.namprd11.prod.outlook.com (2603:10b6:404:47::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Tue, 28 Jun
 2022 22:23:52 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b999:2318:495a:f64a]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::b999:2318:495a:f64a%3]) with mapi id 15.20.5373.018; Tue, 28 Jun 2022
 22:23:52 +0000
Message-ID: <7f63cc20-9042-8c15-2fed-f25ba2e7229c@windriver.com>
Date: Tue, 28 Jun 2022 18:23:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [OE-core] [PATCH] glibc-tests: not clear BBCLASSEXTEND
Content-Language: en-CA
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        kai <kai.kang@windriver.com>,
 openembedded-core@lists.openembedded.org,
        "Gowda, Naveen" <naveen.gowda@windriver.com>
References: <20220628152228.16791-1-kai.kang@windriver.com>
 <738df83db6fae233af819932c4bf56174cac0528.camel@linuxfoundation.org>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: 
 <738df83db6fae233af819932c4bf56174cac0528.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0043.namprd02.prod.outlook.com
 (2603:10b6:a03:54::20) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c2cf2d8-cb4d-4424-5f49-08da5954e143
X-MS-TrafficTypeDiagnostic: BN6PR11MB1234:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Cib7iBgfaYhj4TMVskamTkfvxpob2+gJTx5QwzpSC6lM55rZMgbu47J9M68JtUPjpk4Ti2AMQWAvCRMXTww2PCud5SY5TmEpIUcJ37J1nCA/oIldYK29JHXqMYbuVuomhqaNv1h91ubTHcoqEJndDuU/DivtUPAD6v52F+0n1APuUN103usYbr7rsPlbE7MCp2VnM13gxddCLwSaiBbg6Aaq4tivsPRrsv8ndtaBc0/QG9bMMTIEqvDXIRwwK+YV8MzHMCe+gx/VPmq1ikIrIZxdPpiPWGr+SpR2hFV9udWAAPfKFQjnmNIqSsuHYX/2oOySlFRK5HAXXEw18vZruZ8pxEe5hTesD3Odv9jjn6M6qLh6b+wDDy/G0CY7/OUcpdLLF5Gq3RzXyYgpZkcwne1TUYrnQdgL4zrL/AS2Yr8NLTpldiR2W6/uZoxcrUK7rqNl1XD9L6D7xatLIZLtAu3Vc/F2D0LNh05xZ1FC+a2rbXIPpPVBg3Kz1DW6DbNHDpweyN8YUv6bofYotN8pisUN5vkaCgNrsW/uffam+einFqdRt5E/mpxCXy/4LxVv0DcJ2/i+lKNvDRXlVmL0qHhZxX7OCJIUKTLgt9GnFxJfGj0mIMbfXGicrEpPaMBsAoGTPeljdgBCNF6TenllaP6uPLs6/ORE0Dwi9mbeqi2M+pWVWz8Crbj4qXNZ6TCTrDgBvADQw1BvrxrQbjwv/O+WNU2tgkOjSq2IO9iSDugLu3GhINBqpmUuCqlO+VBW4wGHyZjFiQAPoAnQtUexur+tiQW6G54ZIt4saQYrXDmNMFwB4v4aUwUFpJN80l0c0rmSBnPgQPyLUUZX0v8nYzo/NBv1EwMSCYjLMUaxNtD0oVuZhiS6cFTrmdN6R3t/lz744UBES6+Rt5OOb0R2qTa/hKcloEy1ix7+XfRHezM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(346002)(136003)(396003)(366004)(376002)(2906002)(6636002)(8936002)(478600001)(38100700002)(26005)(52116002)(316002)(6486002)(6512007)(966005)(110136005)(86362001)(31696002)(8676002)(41300700001)(66946007)(66556008)(2616005)(66476007)(31686004)(53546011)(36756003)(5660300002)(83380400001)(6666004)(186003)(6506007)(38350700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Z2JTK2xTeDlQYzRWbHZrSFBYOFdLUUViOHNvVzRtWnNmK2N0QVhaajd3bWVR?=
 =?utf-8?B?eGRKMUxIRmUxQk8xYXl3ODFjSGdHZHRHOVhiekNtU08zd29TQmRnR2htaE5N?=
 =?utf-8?B?c2xhSXhCZERzeFp5dThUNVphQ0c1Z0JORlNiVE4rY2RPT1Frd1p6cTBGRGNR?=
 =?utf-8?B?eGJ6WFBNdk51UVo1VzJEOTBCYTZPYUk4dXZZZWJPbFhhVHlTTjhacE4zU0hZ?=
 =?utf-8?B?NUcrOVVsQk9IbGFQY1RTWGVXYjdRRjFNZ1lBQzFnYk1KMkhUVWVmdGlTclZ2?=
 =?utf-8?B?bGhWZ2pRaHpXb3QyMjRqa1EwRFJHZlN4TnVkWnFZNGJ4cmh2SXEvbFpCU2k0?=
 =?utf-8?B?b3kveU5LWk0reEZEVy9rYnFBbkdER1YyUlNaL3JSU0h6dm9acEVsT2o1NTJ6?=
 =?utf-8?B?S3VtOHk2V01Lc2JBNTBqSHNuUUR1MWwrVko3UHdId3pEM0I0UHY4ejNvNjZi?=
 =?utf-8?B?QllNZlNiTmgzblZjejhUSVdXL3JSMDBOcnc5UDJkd2Q0Z0JHNGs1NUtEWVA0?=
 =?utf-8?B?QnYxRHJRNkQ2MnZVMHhsSGx6SlhMcWJWN2s3d3ZUL3dRSkhKL3ZxT3NqeXE4?=
 =?utf-8?B?d0o5SUkyNVdxTGh4U1I5NEZyQlFkM0hhb3NKYW42ZEZGbjNCOUpCcWJxc3RE?=
 =?utf-8?B?N1RkWTN5OHp6RlowYUx6c0tia1I4NFJHbTFUeDZyTURpWlN4UmpQZVBERGtF?=
 =?utf-8?B?Mkd1c0ZveFZWVmVKd0VJcW52TkExNWhYRW45ZkF6QUtZM2NDM1pDdnBTejdR?=
 =?utf-8?B?bTJ0aytOQjRGYmxkak51ZzhMT2UrVkRoTFR4SWFSMlR6Z3lVR1d0KzZCeWx1?=
 =?utf-8?B?WVlhc2pwblpUMmZOWWQ3TmtpK2ZEVndkaE5WRHhISWNMYVI0U2tRSDNtaTU3?=
 =?utf-8?B?TEpXMjZDQU1MbkFGY3JkUnBWdGNvYjBkaXJiaExGOU4zZ0lUSGthUndmVEk5?=
 =?utf-8?B?Zjk3cFdzVzBhV2EyM2J1TUtNZDV0Q0VsVzBiNzFONHRSVlFCTDMrQTF2SzZP?=
 =?utf-8?B?U1V0NFgrdHJRK0NDVzQzVEpJclZzeE9JR0Y1clF5S1NRaDZyK05XNUF0Mmky?=
 =?utf-8?B?Wi9xUW9wTnJ5Vy8vOWJSc0RFa0tCN2ZNOW1TbDNRQ1o1ODc3eFlpbkFDcFZR?=
 =?utf-8?B?WlkyY25ucWZUT2VoNUxjbjU4U0c0dUw1UVZjMjBTK2pGOUF5U2xubDZvV2Ni?=
 =?utf-8?B?a3ZSVHJSUGdSSzg2ZE81OFh3clVtbkltTmN0UlRPbG9UeHJnV3dLUWpTZTNp?=
 =?utf-8?B?YTI4ZmEvTTc1bkhYUWpiSlFtWHZ2VXgrSnN6ZlN4ZWlWWDFYZk1tZWx5Z1BE?=
 =?utf-8?B?SFdKYUNnSm11bTlUc3Z6TVNMQy85SzVXRnA4R2s0Qksyc2hrejlUQmVHL1po?=
 =?utf-8?B?cGNZMkRtVXBGWDJiVkJETmR1ZGxwV3JYakR3OW55VEVVYmh2YVdCVDV1Q3BV?=
 =?utf-8?B?SEdwUmdHbHYzcEZDQllRMkROR1YyOENQdS9ESUljMk85eVBxY3p3RjIwcExj?=
 =?utf-8?B?ZlJ0RUxuaktIN01kNHI4VGdjRlAzOU9oV1ljb2NpM0hUQ2ltTkdDeVk3K2dP?=
 =?utf-8?B?WjdXcDZRcGZDZmtGUlpPT1prc0pzZ3lodHR3OVdtOWhUT0tNMVA0dG51N0dW?=
 =?utf-8?B?ZWFtZ2NaRnBYWjNNbUt1RHNvaWRReU9waDFmejh5Znd5UjFHT1o4OGU5d0lj?=
 =?utf-8?B?ekdmZUFtcXJ0NFhXeUwrVlVvNkIxY3VPLzRCU0tkZWh1UzJyVUswMkJLMkFv?=
 =?utf-8?B?N3ZGd3FXNFdhRnp6Q0VLWllXUkx0dHF6eXhlR0F0dEdkYTVhZjFVM3ZsUWdQ?=
 =?utf-8?B?TXBBU295aXYrNUJPK0R1ZWtjVHFMYTA2RGJGK0VkK3FXczBxSGpFSnJGSXFu?=
 =?utf-8?B?cXNERmF4ZSs5djdEcE9IWEludWEvbUN6aG5CTmlseW9jNDZjWlN0NUtHNENG?=
 =?utf-8?B?VFJVcTgrZzNmRVZndnN0bUhYV3BlNzRiOTczSE5TNHFqNXNnVHBhUnJScHJz?=
 =?utf-8?B?c0J3K0ExaFRJRWo2azZOVVVZNzJzaGxpaW53MXRNTzZ0Z2d4KzlBRXM2c01T?=
 =?utf-8?B?RGt4WFBzbnQvZzBlTkZzU3gvYnRtblNETG5mWWJLSDI3Slc3R3NYSno4bEl4?=
 =?utf-8?B?SHhCakp6SzFyUTk2Y0RaUndXczYvNE9Rbkd5WU82Q2tvSkRiamszeERGZ0Qz?=
 =?utf-8?B?MXc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4c2cf2d8-cb4d-4424-5f49-08da5954e143
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 22:23:51.9635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 WSy9EX9wuOn2rDkYY61cDzqdckmcQ2FwmhobgO80L0DGq3rjHtVvqA4TNqb/gF9tCDVM8+wnjuTgzEI+dWbreVArPENg6cl7clt5owS1Nlk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1234
X-Proofpoint-ORIG-GUID: ws4U0QiMDcS6l0Teriyjbo6zQUncWreQ
X-Proofpoint-GUID: W7J8qzOuMTQudLBkPYu2Tw-ptxqW3EZW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-28_11,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 clxscore=1015 mlxscore=0 mlxlogscore=999 adultscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206280088
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jun 2022 22:24:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167357

On 2022-06-28 12:03, Richard Purdie wrote:
> On Tue, 2022-06-28 at 23:22 +0800, kai wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> It clears BBCLASSEXTEND in glibc-tests recipe to remove 'nativesdk'
>> which is set in glibc recipe. The side effect is that it removes
>> "${MULTILIBS}" at same time if multilib enabled. Then there will no
>> multilib version glibc-tests. So only remove 'nativesdk' from
>> BBCLASSEXTEND rather than clear it.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta/recipes-core/glibc/glibc-tests_2.35.bb | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-core/glibc/glibc-tests_2.35.bb b/meta/recipes-core/glibc/glibc-tests_2.35.bb
>> index 414f8660de..028e83e865 100644
>> --- a/meta/recipes-core/glibc/glibc-tests_2.35.bb
>> +++ b/meta/recipes-core/glibc/glibc-tests_2.35.bb
>> @@ -18,7 +18,8 @@ python __anonymous() {
>>          d.setVar("PROVIDES", "${PN} ${PN}-ptest")
>>          d.setVar("RPROVIDES", "${PN} ${PN}-ptest")
>>   
>> -       d.setVar("BBCLASSEXTEND", "")
>> +       bbclassextend = d.getVar("BBCLASSEXTEND").replace("nativesdk", "").strip()
>> +       d.setVar("BBCLASSEXTEND", bbclassextend)
>>          d.setVar("RRECOMMENDS", "")
>>          d.setVar("SYSTEMD_SERVICE:nscd", "")
>>          d.setVar("SYSTEMD_PACKAGES", "")
>> @@ -95,7 +96,7 @@ python populate_packages:prepend () {
>>           d.setVar('DEBIAN_NAMES', '')
>>   }
>>   
>> -FILES:${PN} = "${PTEST_PATH}/* /usr/src/debug/glibc-tests/*"
>> +FILES:${PN} = "${PTEST_PATH}/* /usr/src/debug/${PN}/*"
>>   
>>   EXCLUDE_FROM_SHLIBS = "1"
>>
> Have you tested the multilib glibc-tests and been able to use it
> successfully?


If Kai hasn't Naveen will.

../Randy

>
> Cheers,
>
> Richard
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167350): https://lists.openembedded.org/g/openembedded-core/message/167350
> Mute This Topic: https://lists.openembedded.org/mt/92046086/3616765
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux


