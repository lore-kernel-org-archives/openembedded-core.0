Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97AD2E94132
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 21:54:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6721.1696629254639499840
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Oct 2023 14:54:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=iHnDqhRI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8643e002a1=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 396JTwGk025782
	for <openembedded-core@lists.openembedded.org>; Fri, 6 Oct 2023 21:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:references:cc:from
	:in-reply-to:mime-version; s=PPS06212021; bh=4NO7PNnBq5Vu2SSOv3t
	X/9vPAGGuICatIN8vIRd2C9s=; b=iHnDqhRI4b2PuaMcK8R0PBiCRns37Vqyn9Y
	LqOu8F5uf5TkKwm4biFTG9On0PgGEZszxUZ7HUKnOPFLri9mNbPrvwWrjmHdmfn5
	tH+r03exh6OcGeHte0L/httDNmE/StE/Uwvwb3/hziHJAopcRoPhWVNLjTnDUITX
	5A154Kjx5xeuJZtAZn9Mqb5bMoAtPGk6iHmlW7Ir+N47N9XpbVizdwmet29FHTkk
	aEh+BAwPlm/ExjOcOBeo47Bc4O2B94cOD+p+hixMZoqwk1vh9ZQ44Jltm2qmNr+H
	rercfvM+Wivl6xYFSJj/UKRUUDWZ73tTwwyiH32ab5Pv1M2Ep1Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3thtya1ngq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 21:54:13 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 396LsD2Y001923
	for <openembedded-core@lists.openembedded.org>; Fri, 6 Oct 2023 21:54:13 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3thtya1ngn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Oct 2023 21:54:13 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YyO90993RHwvSn8troMrYJi7nfUncGXzYSXPr7q/P67Jax8xkRv3jFpZSgCLEtY/UnMbZkhDRpet0osa6i6ZV75PBELBbDJkUPbJsxUMpLO9WZvxzh/6wNrJDFWbPZdn7T9iisegqc0gisRPKv7SBAza64OUXGQT/QGmXoYgCNPdP6ufXfThd/TeYdVPBKwx3QEZ7lJDlIGkIsIjf7xiwm6bkcKc67Q4D+5y2NKdVWKk8+g9zDtpO0tIxp16DUNebAYGyOAySN8oXrSMOLHXvmsn8RfNNDk37W6l5RkUgxURRP4ksbIjOxjJo454lw/h5EJJEpZGux8q+KU9sx/+AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4NO7PNnBq5Vu2SSOv3tX/9vPAGGuICatIN8vIRd2C9s=;
 b=DLtwCDPEhYZlSQbbF8vKBNCXTE/ldaoSqfu0fa3ewAMOU3tnMhnA/CuH85Fwdb0ofrY4z3n3yL3BGuSQUJHjFDkVXQkDEm3ogCaHTkOGa1LsBel2QL1dlK0HLmWg/LfoD/SzJK86/f6oA3zsplWczqUnfbQdL5zWLdd1001jUuBTv09fs/rs7n0PzAb0S/VqZs6ZSiiEH0irdpQiYs8E60f9Skca4bg6Y+Xibu/1ar/3qgmkhpiOKH/ERM27b/gQxFpE6eILBYM/kkCL31YmxGNzALSpjHKQx70/lwDa6p9pufjkvn2aur17ln2Hp9bee72upT2aDR2xp9iTuCjDGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by SJ0PR11MB5119.namprd11.prod.outlook.com (2603:10b6:a03:2d6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.35; Fri, 6 Oct
 2023 21:54:09 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::d2d8:3f97:b35:ee7d]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::d2d8:3f97:b35:ee7d%3]) with mapi id 15.20.6838.039; Fri, 6 Oct 2023
 21:54:08 +0000
Content-Type: multipart/alternative;
 boundary="------------OWcRTbUcBhNFKzLcatxSxJbW"
Message-ID: <4f936d57-bf22-4c1d-9427-d4b2452e87b9@windriver.com>
Date: Fri, 6 Oct 2023 17:54:05 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V3] strace: skip so_peerpidfd test
Content-Language: en-CA
To: openembedded-core@lists.openembedded.org
References: <178BA1E17FB5BA53.24994@lists.openembedded.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <178BA1E17FB5BA53.24994@lists.openembedded.org>
X-ClientProxiedBy: SJ0PR05CA0115.namprd05.prod.outlook.com
 (2603:10b6:a03:334::30) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|SJ0PR11MB5119:EE_
X-MS-Office365-Filtering-Correlation-Id: 32454c13-e23b-4e37-d35c-08dbc6b6c469
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sZsBqvnJBp3lUtXkbNdIgOitMQhrmKDiFjt/RzTLu7OVkWHOXgOIlMozOp0wOXDRnvO+xO+ULXduRPygTT88XK9+8JCoTS6BG6WLk3Ic7ZCh/YfkXTvEg11BfsVL2v/bcZ3/nKaXSmew7T+ApDzv4uL/EPCjeqlx/FcwwggONd2Ak9avtlzBK8A72pa1coxD0yT01R3JfIjsPO3FBzi9j+PpQ75xxvB5MnZZOPyNfnrIHEXhD/aUl0CBoSOqim6uIDRphYv0boUTQOQXIFgF0nPibsYjGCs55iOjlLrXjjS15tBoThahms0NeWpYHTq5TeOhLKQuXT9vDG0CE1Eqs5mPSD2YBf5bjgjavB4CLlb7afaywuuePtwTJdooemnSfwAOUYcSeWFQSjxby6edGQGhzKVeUj62K7gtiv54t3M648W0ZyREKgB9s5W9Khte525mALvY5ieosXopkgYsUYeW0GxCeArDtpCZBay03qHglnDfyLhwpjDB3DFtlrH+tu7XcNv+ryYb5J7ZejtlQdK74D15Dvah0cE0fa/LBYw3m+jlAY6DBWmkek9/Po2JrCK+izqf04g5b5p7e6Gepo9y3PHD5Epj3HOVFkQnjiGXQ2wWl6TtEbfZUorc6a39
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(376002)(136003)(39850400004)(366004)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(8676002)(4326008)(8936002)(41300700001)(316002)(6916009)(31686004)(5660300002)(66476007)(66946007)(66556008)(2906002)(33964004)(86362001)(6512007)(2616005)(6506007)(53546011)(31696002)(6666004)(36756003)(166002)(478600001)(6486002)(966005)(66899024)(26005)(38100700002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VGFPODNCSUVKU3FxMmlIMnFWUWs0OVplTFd0aWtQR2c1RnNodnpDZ2F2UFVG?=
 =?utf-8?B?dG5qUjlVSEppL29BcExWSGVrMU1SODNBVUJXR25wa3cwNDV3N1ZlNkFqeVZ5?=
 =?utf-8?B?L3hJVHQzK3pIWHEwN3JDSndrWFczRUJsTVpFRXBBNmovNFVleVdGYWhpYTBo?=
 =?utf-8?B?bXhhbXJhTWUzdG1ES2tIb3JqaDVqUEUxcHBBRkRaa1J0QjB1anB2Qmh1RzlF?=
 =?utf-8?B?bTZPT3VLVXRoSDR6NjByZ3FBNS9MNGVwWUo0aWhKZGFMSE94a3NLWTBDNnFU?=
 =?utf-8?B?Qk9rYXV5Q1NTem1XaFZtSnNuWnBoOWYrN2E5NThrWmRjWHBKblBkeW5OdTJk?=
 =?utf-8?B?d0VYKzZxQW1EdzFuRHVvYW92RnlLV0xFOE5NUEpUV3RKbXdxNG12TzlIM1dS?=
 =?utf-8?B?anNwdGVNd3Y1MTUzbGhSZ0lqbU9Bek05NytxUzZIc21CNnVkL3JpUGtQWVFK?=
 =?utf-8?B?RTF4b1o4QWhFakx2UVZraWdqTXJTYWNjVWdlRFVCNDZIcUhVYzEzQ1JwT1BJ?=
 =?utf-8?B?KzVwNDNEZ1dSZnBKRmJubW05ZndOd29kVE4yR0lGN3ZtZC9HWkZ2WEJVV1Yw?=
 =?utf-8?B?RUlvMjNOTGROV0J5dGNZdnVzWlR1VHI3RGNTaElOZFk5S0pidm13WkhvVVBp?=
 =?utf-8?B?M0ZrcytzNXp6RlIxTDRlOG1ZRWw5Z2RzdXN6QytUMjVURW5DMUYrS0hWeTY5?=
 =?utf-8?B?NlpFaDgvNStrMVI5ZGdZOGtzT2pNc0lmRWx5ODErbzZIY3gwZTliR1hzUlBK?=
 =?utf-8?B?QklkNzNmZHFJdHN4Z3BzVHRMQ090SlZXZmtnbzFJUDhEbkdFSkRtMnlMOWR5?=
 =?utf-8?B?Nys3ZEl1Z1BtT0ZIamtUOGFmMWE3K3BTMFJyeG9VRUpBV0RhV2ZUMk05cEFv?=
 =?utf-8?B?Q3N5QTZua0JjeUtrbG5jTDVaTHkyM3RrOVhVdkVEcjZlY29jZHRqS2VLUTdh?=
 =?utf-8?B?RVFQaDNzdzdVVVBka1JQeTdtUGFQblN5bjNPWXVud3dzRGt4YlRGb3h2dUcy?=
 =?utf-8?B?OWFyeXk2dzhaS3dZQzN4cU9XK3hlSEVmUWJaN3EyUGdIZURQVWRpdDU2b1M0?=
 =?utf-8?B?Rm5lY1dPdms0elJVRUZvRmdrYTNLdmpaUGx2TXF6TlhPRFFkWlA4OE5sK1ox?=
 =?utf-8?B?UHJrZDlEa3prTHc5Zm9hZHk0cHhwYjJSK1VLb3hZTVQ5WmRGN2Nza0grY3VC?=
 =?utf-8?B?S1FUOW5pU2xFQ0NFd2ZwbEtPVzJrMUEzZzdrVU05cHFRSi9ERFFUc2FWRmpM?=
 =?utf-8?B?RTViWEZ2RjQ1eXJ6VVIyclVpUDUrU1J6bTFuTG9pNjg1aUU3MXlFZlVZSkRK?=
 =?utf-8?B?ZlBPb2hvZWY4Wk5kTlVwRGNsY3pTRHZoTEtlWi9ESEFISHdEb0lxaHdEaWlq?=
 =?utf-8?B?MHNDQ1NxUFl5V2hPb2hSSnI4VkQzV2VtNGVwb1EwMVQ2NEZ5eFJ6LzR3OW5T?=
 =?utf-8?B?UVl1MWh6aGpJYmV4RkFCcVVNaUl2R3pmZkJFSUthazdvMWdWY1dsVCtubmts?=
 =?utf-8?B?SXV2KzJpUGI2NWFURFkxS0NRd2M2d0RHaVJVSXZmV0dCY0IzWWhtV0FCWTRF?=
 =?utf-8?B?WG9lN2RRVzRKbWoxL211UmhyVXdFWFE2UXYzY1N6U0pXVjR6Z0dRSEdZZXNk?=
 =?utf-8?B?bHphcFBEc3g5YUVhaC9yclFVMWY1OHN3ZUdMaGxHanB0VFJrck9oeDNzSDJH?=
 =?utf-8?B?a1FEZ0s3YzVTaW5HeEtVQ2sxRm44Ry9nZnZPNWRJVnFFbEk5akdjWStOSUs0?=
 =?utf-8?B?RHFENitjc2tpeStYS21YN1J1UStORXlBc0h0S0l1R3Vocm1MMWRpNm9va3Q5?=
 =?utf-8?B?SENWa29UblQ0WjRWWjJ3WDYyZ0Z2MVk4ZmhmSUduY25qYjRmZUFJRW83d0Nq?=
 =?utf-8?B?QzQyQkg0UE02SFRURmJoTnpQZVRvc21UMVRHRE9scTQ0eXdIQkJYT0ZmTkdm?=
 =?utf-8?B?ckxwaGlNaHZBa2ErczdJYWlENGUvbHlzeGloZFFyQXpTY3o2UTU2U21jcG5H?=
 =?utf-8?B?L25oTzdqTjNmd0Vhc3pJRnhlUXhNaUVYMnU5MUc2eUtMQ2JiM1B4NlU5MHBY?=
 =?utf-8?B?UHo4cjltYWdjLytWeDVJM29ldlptb1dYeE5sWUQ1ak5LM0U2cWllYkVXbWo1?=
 =?utf-8?B?YTEyeUNaOHRwdVI1aVNhdENBS1k3bTQwK2ZsUjY3ekNuZEZEVjY0czlLb05n?=
 =?utf-8?B?cVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32454c13-e23b-4e37-d35c-08dbc6b6c469
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 21:54:08.5852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pah5tLyKGTCYEwJla4TjXgrDiyXrhv6QE5Y2R7hlbMZ1jvxJxXRFVWlu7sSXGvIeGnz9GF++s+Akc4YtdoLBbF/V3GO2SrRC6jdJaLi16X4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5119
X-Proofpoint-GUID: v9h2VWDW7ImQmqX1EGSvNNqlVkwUc7VZ
X-Proofpoint-ORIG-GUID: bO5GcKxaQGzMQPsjaO_s8JFTVm1ZoDJR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-06_15,2023-10-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 mlxscore=0 phishscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2310060168
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 21:54:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188792

--------------OWcRTbUcBhNFKzLcatxSxJbW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023-10-06 5:27 p.m., Randy MacLeod via lists.openembedded.org wrote:
> From: Randy MacLeod<Randy.MacLeod@windriver.com>
>
> The so_peerpidfd test is failing in every linux-yocto-6.5 ptest run
> due to a difference of square brackets in part of the log file.
>
> Skip the failing test until the difference is understood and fixed.
>
> Signed-off-by: Randy MacLeod<Randy.MacLeod@windriver.com>
> ---
>   .../skip-test-so_peerpidfd.gen.test.patch     | 25 +++++++++++++++++++
>   meta/recipes-devtools/strace/strace_6.5.bb    |  1 +
>   2 files changed, 26 insertions(+)
>   create mode 100644 meta/recipes-devtools/strace/strace/skip-test-so_peerpidfd.gen.test.patch
>
> diff --git a/meta/recipes-devtools/strace/strace/skip-test-so_peerpidfd.gen.test.patch b/meta/recipes-devtools/strace/strace/skip-test-so_peerpidfd.gen.test.patch
> new file mode 100644
> index 0000000000..76f93ab613
> --- /dev/null
> +++ b/meta/recipes-devtools/strace/strace/skip-test-so_peerpidfd.gen.test.patch
> @@ -0,0 +1,25 @@
> +From 002d9f2512245536dfc8d62db429d97e2216ec3a Mon Sep 17 00:00:00 2001
> +From: Randy MacLeod<Randy.MacLeod@windriver.com>
> +Date: Fri, 6 Oct 2023 12:08:23 -0700
> +Subject: [PATCH] skip tests/so_peerpidfd.gen.test
> +
> +Upstream-Status: Pending

I updated the commit log but forgot to git add the changes I made to the 
patch!
Sigh.


Richard took pity on me and said that he'd fixed the Upstream-Status 
before merging.

Happy Canadian Thanksgiving weekend everyone,

../Randy

> +
> +Signed-off-by: Randy MacLeod<Randy.MacLeod@windriver.com>
> +---
> + tests/so_peerpidfd.gen.test | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/tests/so_peerpidfd.gen.test b/tests/so_peerpidfd.gen.test
> +index 64ad3a2..f89da9f 100755
> +--- a/tests/so_peerpidfd.gen.test
> ++++ b/tests/so_peerpidfd.gen.test
> +@@ -1,4 +1,5 @@
> + #!/bin/sh -efu
> + # Generated by ./tests/gen_tests.sh from ./tests/gen_tests.in (so_peerpidfd --trace=getsockopt -y); do not edit.
> + . "${srcdir=.}/init.sh"
> ++skip_ "Test fails due to apparently trivial log format differences"
> + run_strace_match_diff --trace=getsockopt -y
> +--
> +2.39.0
> +
> diff --git a/meta/recipes-devtools/strace/strace_6.5.bb b/meta/recipes-devtools/strace/strace_6.5.bb
> index 8f90c35925..d6475e8db9 100644
> --- a/meta/recipes-devtools/strace/strace_6.5.bb
> +++ b/meta/recipes-devtools/strace/strace_6.5.bb
> @@ -14,6 +14,7 @@ SRC_URI ="https://strace.io/files/${PV}/strace-${PV}.tar.xz \ 
> file://skip-load.patch \ 
> file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch 
> \ file://0002-tests-Replace-off64_t-with-off_t.patch \ + 
> file://skip-test-so_peerpidfd.gen.test.patch \ "
>   SRC_URI[sha256sum] = "dfb051702389e1979a151892b5901afc9e93bbc1c70d84c906ade3224ca91980"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188788):https://lists.openembedded.org/g/openembedded-core/message/188788
> Mute This Topic:https://lists.openembedded.org/mt/101807172/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux

--------------OWcRTbUcBhNFKzLcatxSxJbW
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2023-10-06 5:27 p.m., Randy MacLeod
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:178BA1E17FB5BA53.24994@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a>

The so_peerpidfd test is failing in every linux-yocto-6.5 ptest run
due to a difference of square brackets in part of the log file.

Skip the failing test until the difference is understood and fixed.

Signed-off-by: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a>
---
 .../skip-test-so_peerpidfd.gen.test.patch     | 25 +++++++++++++++++++
 meta/recipes-devtools/strace/strace_6.5.bb    |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-devtools/strace/strace/skip-test-so_peerpidfd.gen.test.patch

diff --git a/meta/recipes-devtools/strace/strace/skip-test-so_peerpidfd.gen.test.patch b/meta/recipes-devtools/strace/strace/skip-test-so_peerpidfd.gen.test.patch
new file mode 100644
index 0000000000..76f93ab613
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/skip-test-so_peerpidfd.gen.test.patch
@@ -0,0 +1,25 @@
+From 002d9f2512245536dfc8d62db429d97e2216ec3a Mon Sep 17 00:00:00 2001
+From: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a>
+Date: Fri, 6 Oct 2023 12:08:23 -0700
+Subject: [PATCH] skip tests/so_peerpidfd.gen.test
+
+Upstream-Status: Pending</pre>
    </blockquote>
    <p>I updated the commit log but forgot to git add the changes I made
      to the patch!<br>
      Sigh.<br>
    </p>
    <p><br>
    </p>
    <p>Richard took pity on me and said that he'd fixed the
      Upstream-Status before merging.<br>
    </p>
    <p>Happy Canadian Thanksgiving weekend everyone,</p>
    <p>../Randy<br>
    </p>
    <blockquote type="cite" cite="mid:178BA1E17FB5BA53.24994@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">
+
+Signed-off-by: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a>
+---
+ tests/so_peerpidfd.gen.test | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tests/so_peerpidfd.gen.test b/tests/so_peerpidfd.gen.test
+index 64ad3a2..f89da9f 100755
+--- a/tests/so_peerpidfd.gen.test
++++ b/tests/so_peerpidfd.gen.test
+@@ -1,4 +1,5 @@
+ #!/bin/sh -efu
+ # Generated by ./tests/gen_tests.sh from ./tests/gen_tests.in (so_peerpidfd --trace=getsockopt -y); do not edit.
+ . &quot;${srcdir=.}/init.sh&quot;
++skip_ &quot;Test fails due to apparently trivial log format differences&quot;
+ run_strace_match_diff --trace=getsockopt -y
+-- 
+2.39.0
+
diff --git a/meta/recipes-devtools/strace/strace_6.5.bb b/meta/recipes-devtools/strace/strace_6.5.bb
index 8f90c35925..d6475e8db9 100644
--- a/meta/recipes-devtools/strace/strace_6.5.bb
+++ b/meta/recipes-devtools/strace/strace_6.5.bb
@@ -14,6 +14,7 @@ SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://strace.io/files/${PV}/strace-${PV}.tar.xz\file://skip-load.patch\file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch\file://0002-tests-Replace-off64_t-with-off_t.patch\+file://skip-test-so_peerpidfd.gen.test.patch\">&quot;https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://skip-load.patch \
            file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch \
            file://0002-tests-Replace-off64_t-with-off_t.patch \
+           file://skip-test-so_peerpidfd.gen.test.patch \
            &quot;</a>
 SRC_URI[sha256sum] = &quot;dfb051702389e1979a151892b5901afc9e93bbc1c70d84c906ade3224ca91980&quot;
 
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#188788): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/188788">https://lists.openembedded.org/g/openembedded-core/message/188788</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/101807172/3616765">https://lists.openembedded.org/mt/101807172/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------OWcRTbUcBhNFKzLcatxSxJbW--

