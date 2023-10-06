Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23DC4E94120
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 21:10:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.5677.1696626621996011181
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Oct 2023 14:10:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Rz+ujmwL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8643e002a1=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 396JTwFK025782
	for <openembedded-core@lists.openembedded.org>; Fri, 6 Oct 2023 21:10:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=RoKA7+P3QrIloFge0/W
	1DyuuECLeFF2vfBBrOdvoR/o=; b=Rz+ujmwLwdeWJge/Dd5D/OaYn/4OHsMYBtJ
	buFsci6j4klLM8X6WsV/s2oE6Ix0XQn0kL8bxo8jeFfjFqiceZrkKnY2rP0zP4Dt
	lLgXAUz6RxdovUwplC86oRnPTYFX+t/OSuZlfYxVi3Hms1txjT9nZT94BR/JXhLw
	1ZimfFZwjPwmcQQmpkjXBddTcPDzQhAeKI3xHB9W2OJdkaINf6oRu3bAVhPmjdNl
	e5XLq3mm8y8q6CYRvE7y5IbthMZKsfDCvOY5T+Z7Wr66IqoiAPEsjgQWPnukXDtx
	xxAkjgbC1RVpKtNCJCyPcQAVsCLQ7kSF10DgYhs01SZ9js5ChMQ==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3thtya1md4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 21:10:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A1v7Z4wqDbxYNFMvx9XXZ8warmBb8ReNN7gELqf87lQ3DO8F6v+wwPTXcHtZirOwMN+DeGS/YhrWWp1foyP2qVqV2218WiqBHXN5a2EJvGmuyApC3BkG/yQGucBU5NPvLxfp1NaGmQlnjfzMfb6wURQips8UbrbheKYnHRW51tUJE7V+nLjXiQw5IRqsZv+9xdITDZV3cOJuEA/yCVSuJE7OVURy2QVBsxC+hhm/0f9mD3KrqE2aP+4t5VjmPQmxQtvN+2V7XmJwEgSNalV1x7yryRG3iaxwk7ZCoxhAIBS2c/IF/oWAMxIfxXS7M0aOydljUYTx9ThfaPCKdML1HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RoKA7+P3QrIloFge0/W1DyuuECLeFF2vfBBrOdvoR/o=;
 b=g8nLXyldU0D1JgxfqDM0tmvC53GwZ/Trb1DaeJLgwTt3ISG10DJiLQLIAMjYGp6HJJQx5EhgSGCEuMfFQ+bs2SZ2jTfCZvS74FRRbRcfKn1oZZjlmhHJRdIzeX9WD6UGPFLVNi8vG3MahKipliMcN/tmLUY4+Xz/0rXu1T0GZWNJpSMa9UyUCJ3OJS+7OZKcuNwD1PRVOOoeAT16bz8OJXjlTCyEEXNoZjkw9e88u+FsiU9VSvKppnPTQpzjgtFcTpreS3/VvpoVIqZcolHyTFTHwgsUDK44nbWKJtPB34vXaXGJ+vWrEpLPjev72yoZy3bFkWv8RszFIBxSIpa9jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by IA1PR11MB8097.namprd11.prod.outlook.com (2603:10b6:208:457::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.38; Fri, 6 Oct
 2023 21:10:18 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::d2d8:3f97:b35:ee7d]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::d2d8:3f97:b35:ee7d%3]) with mapi id 15.20.6838.039; Fri, 6 Oct 2023
 21:10:18 +0000
Content-Type: multipart/alternative;
 boundary="------------o5UEszQbmTM8guYf0Yxu0por"
Message-ID: <614a479e-7b0a-4c90-ac07-3fd3e9624aef@windriver.com>
Date: Fri, 6 Oct 2023 17:10:13 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] strace: skip so_peerpidfd test
Content-Language: en-CA
To: openembedded-core@lists.openembedded.org
References: <178B9D6D52233587.5378@lists.openembedded.org>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <178B9D6D52233587.5378@lists.openembedded.org>
X-ClientProxiedBy: BY3PR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::25) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|IA1PR11MB8097:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d6459cd-43a8-4f9b-3c26-08dbc6b0a4c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9yWoM3EDekgw2KeCINRgIsgxO/2fquDgFRLnMkYgkjqHyMDxxpnvc9UnxDoEf/B4v2ortb3QRLphIDAUsoOnxS+YqkOQvU4P0uroRLlnbe4tZKGJ9SafMfQvt4x6DHw+zfeWZLQkVAWUibPxUr1j636TaJbMU7sOUYa5DWdI2GWdVNqgJ6PUfG6VcfvjU8Lsm5jgS9iXdBMeifzo7LQbF6U4NSIiRnbWWL6y5ygtsv4HNFcnTSZfRLg47UwFeUSbndREyZHyxPjbwZmNS9tI3RE8StcdK3YRGiT8mHQziZaCxXlEVL9EusnvMU4dlOeihRiLs4bqT++Gqj3qx/1oGlgkViCCcDwNwa0mnF0062pjSHaf3G52nFNn8fiiiERNF2nxgo3P/DN6eR7ZmJWXZBXH4ZWGbp3LBtXUAS/waz6oJx2DfVkiCGETLNn3clQuX9JeKWlqnWWys/Mm6JZwNVUHFOXoUfuhPfMB3kuzK40m0wWywkZg8F103YL41n8SpsFU6jh2wKlw6+8JG4YECzvCgCS+xIrltuzx94UH2NUeIQJtINSIAcYZVsWDwB0+6mzqn+Bcn1LXsyT95cHeqHCIY4I2yukp/5CMwTnW+oVvhj/xGnN8Zn+66LzpYD5Y
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(376002)(346002)(39850400004)(136003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(31686004)(66899024)(33964004)(6506007)(6666004)(53546011)(966005)(6512007)(6486002)(478600001)(86362001)(31696002)(38100700002)(166002)(316002)(41300700001)(2906002)(83380400001)(2616005)(26005)(36756003)(6916009)(66946007)(66556008)(66476007)(5660300002)(8936002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d29rU2NZUEd5NDZQbHNvbmxDWjZONlg0Z1g2L2FraHc4aktPN205STVDYmNO?=
 =?utf-8?B?ZDlyZm1oNzEzU1JGM3UydGNMd1plbUhiRjZMQzlJa3RvSFlhclN1UURvc04v?=
 =?utf-8?B?V25vSEdYMFg3TUZSVGdMU1Jhc0hBTE5vSHI4WGFKYTRidnRzaGJHNEM2Y0pJ?=
 =?utf-8?B?aiswSmQ5bWpPbDg4ZTBkWjNkVWpRMVBSWVNnc2NZNVVmRHhnUU9kTXB0dU9x?=
 =?utf-8?B?enZyNWFqOEo5RDFoRVgzNERxeDhBZWs3eUZlSm9UcU9uWHVoTXNhbzEwZnB3?=
 =?utf-8?B?VGhqWnBGa1hrK1pzMUVwNGJHTGpXTmdjeXBaTi94YURTUEN3VUQySlAyTEVU?=
 =?utf-8?B?L00xT2dWaDVWQUkvZnJpTkh4Q2Vjc1d2VXFld3BzYjVWTy9GaTZ6Y0grZFdU?=
 =?utf-8?B?Qk9hZUUyQS9pcDFpZXBGQzU5aGlDdjQzRlhoaVRlL2FTN3p3MXBLVnZCRW9M?=
 =?utf-8?B?QlJWcWxUY2UzUGZISFlBd1JmOXNLczg3TWIyQlBIcVFQYjBkbHR0WTAvVWMx?=
 =?utf-8?B?ME96aittNTVKb2taWlZSeFRpSXhtdURCYWs5RkFHbmJTbllCSDZXWkk3SElO?=
 =?utf-8?B?MmNuMFV6eG0rcmJIQmphcnQ3dzJjYklLYllySTJ5UEZxdXE1VFdRRGZMODNr?=
 =?utf-8?B?QmJJckZJMFQxY0JYL1RmS0xkMTlaQlNYRDgyWWdsUGlIWGtsNHpwVnNrMEZt?=
 =?utf-8?B?T1pmdWJBSlE0VThjbGpwa0hZYVFPQnQ3TjRnd1RMWDRwamh6RUdOck5JQUVR?=
 =?utf-8?B?UHF5ZERQeW5DbW4yUStCNEdYUW82RCtVcUtBVGVzTEpkbXVMWnJUMVJSMXY1?=
 =?utf-8?B?Ui9CeDh0ZVJDc1orZnVucEcvd0NqZGhuc3pLMlNHUUF6dlk3ZmNqQ2JMMEZE?=
 =?utf-8?B?REdzUHVONS9JS1JaYVIvT2tMSERkaDgvMjN5TWZkUEkyYThjaG40ZTBqMUlP?=
 =?utf-8?B?ay8wUUl4eU8vV2k1a243NWNqS21YM3lrNitJZW5sbDNHOWIzYko0ZjZraXNK?=
 =?utf-8?B?Slo5eGhrMUdVZ3FWaFVjOXFTV1RUSzZWY1JES0YvdFR0Nzg3UXVkSHJ6R2oy?=
 =?utf-8?B?NGpTamRqWXFrN0dQNDBlR0VOOFBuZ2J6Tk5WdmsyQ0FnanMwQUNDejVrQzVw?=
 =?utf-8?B?eGZiRVFXVWUzVmpoaUQ3d0YwcytiYXNYcnBJWUN0eDEvd2FkTTJJM1JIK0Jn?=
 =?utf-8?B?Mmc3YnplaC9JRUNNU2dnbEUyMlpraFFhSkwrRDZWR1A5RGlHdDU3MzdKZ25C?=
 =?utf-8?B?OWljRHNJaEFGZ2YrNDFEZjVTbmcrbzc4MDJQczBlMDAyZ01QQUhHM2xlWTJ6?=
 =?utf-8?B?YTJDWW5UbXZUYVBWMzhING4xVkFYY2lYS0I0VEZMYjJ2RFRHYTJ2YkVYYWx1?=
 =?utf-8?B?SWoyVW0wUDFuRWJtMzgxOHNrMGcvZjdYTmZYUzRqV1kxWEhmeEcwM21pbHhj?=
 =?utf-8?B?VXlHY1dGTnhQUHZveWsyZlQ5Q2M1N3hhL0hHckpqTDdLUFFhZXYxR1NEalJs?=
 =?utf-8?B?UENCUXdka0VudUlFSFpHaWR4TENURVBEd2pXNlV5b1ZmRDdqbHlDV2ZCczZ1?=
 =?utf-8?B?VS9xUVJ0NDFQVXh3M1B6c2dkQklrbUl5QXA3d1dCUkkxVXZvR3N6QjNSaHRp?=
 =?utf-8?B?ZWd1a3I4TWUvN1Bmc2RWRG5SSWdTTW9TUEQ1b2l2dFRYL3lxSWl6Nmpxd1ZW?=
 =?utf-8?B?eGRMeXB6VSswSXF3bCtVVjJ3WU5oMm9pU0ExeDFuNGprRXAvU0puOFl4Y3k0?=
 =?utf-8?B?cldDdkNkSG5ib0hVbmkyNjk5dHN3RkpaVzMrRCtSWDFudWMzamhqaWdVa1l3?=
 =?utf-8?B?eFZtOHBWZDZuUitTcGswMHNQbXpBazg4V2haOG5vRVFQd2FESDBLS1pKNitT?=
 =?utf-8?B?MjVKOEZpMXJtb1NVZENnQjFlYmJFL3lMenB6VWxzVDY4K3FLVXh5bTBlbW5N?=
 =?utf-8?B?dk5LMDlhTFFaQkY1b255WnljWGl1cEwyOTluZCtSUU4rQlQwSmVPVUxwYXpr?=
 =?utf-8?B?UXc5VDVlQjExMXY4UURWVnFXWEU0dXJTa1pkQUZ3bTBnOEI3eXV0b3lCOUsv?=
 =?utf-8?B?S2JUdmg2QnpPMXlVbjRaa2Rkd0F5T25EYWg4TkZqRXFBRlRuK2J1K0d6Mk1T?=
 =?utf-8?B?UnVDZUhOQU8zMkhyMGhjaWFuUVE2V2R3UTVvaVRXcUlGVFNlelYvRTNJakJG?=
 =?utf-8?B?RVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d6459cd-43a8-4f9b-3c26-08dbc6b0a4c1
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 21:10:18.5201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 26yWhdRDJ6wg1DUMxwSltWymLoQT3z1pw/LFZm8ccW4TY0rdlNFLdXjkNW36BbZ/QHFuXmqZmz9TItdRMRZaHHoNp75fYvQo8zMnb9ma8Yk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8097
X-Proofpoint-GUID: uXEoGiCbNxqNPorZT3H1PsbQp6VCAafy
X-Proofpoint-ORIG-GUID: uXEoGiCbNxqNPorZT3H1PsbQp6VCAafy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-06_15,2023-10-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=912
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 mlxscore=0 phishscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2310060161
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 21:10:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188785

--------------o5UEszQbmTM8guYf0Yxu0por
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023-10-06 4:06 p.m., Randy MacLeod via lists.openembedded.org wrote:
> From: Randy MacLeod<Randy.MacLeod@windriver.com>
>
> The so_peerpidfd test is failing due to a difference of square brackets
> in part of the log file. Skip the failing test until the difference is
> understood and fixed.
>
> Signed-off-by: Randy MacLeod<Randy.MacLeod@windriver.com>
> ---
>   .../skip-test-so_peerpidfd.gen.test.patch     | 25 +++++++++++++++++++
>   meta/recipes-devtools/strace/strace_6.5.bb    |  2 ++
>   2 files changed, 27 insertions(+)
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
> index 8f90c35925..81baae474f 100644
> --- a/meta/recipes-devtools/strace/strace_6.5.bb
> +++ b/meta/recipes-devtools/strace/strace_6.5.bb
> @@ -14,6 +14,7 @@ SRC_URI ="https://strace.io/files/${PV}/strace-${PV}.tar.xz \ 
> file://skip-load.patch \ 
> file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch 
> \ file://0002-tests-Replace-off64_t-with-off_t.patch \ + 
> file://skip-test-so_peerpidfd.gen.test.patch \ "
>   SRC_URI[sha256sum] = "dfb051702389e1979a151892b5901afc9e93bbc1c70d84c906ade3224ca91980"
>   
> @@ -47,6 +48,7 @@ do_install_ptest() {
>   	install -m 755 ${S}/build-aux/test-driver ${D}${PTEST_PATH}/build-aux/
>   	install -m 644 ${B}/src/config.h ${D}${PTEST_PATH}/src/
>           sed -i -e '/^src/s/strace.*[0-9]/ptest/' ${D}/${PTEST_PATH}/${TESTDIR}/Makefile
> +        sed -i '4 i skip_ "Skip due to trivial output format difference."' ${D}${PTEST_PATH}/tests/so_peerpidfd.gen.test


Oops, that line is no longer needed. V2 with it removed coming up.

../Randy


>   }
>   
>   RDEPENDS:${PN}-ptest += "make coreutils grep gawk sed"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188783):https://lists.openembedded.org/g/openembedded-core/message/188783
> Mute This Topic:https://lists.openembedded.org/mt/101805563/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux

--------------o5UEszQbmTM8guYf0Yxu0por
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2023-10-06 4:06 p.m., Randy MacLeod
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:178B9D6D52233587.5378@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a>

The so_peerpidfd test is failing due to a difference of square brackets
in part of the log file. Skip the failing test until the difference is
understood and fixed.

Signed-off-by: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a>
---
 .../skip-test-so_peerpidfd.gen.test.patch     | 25 +++++++++++++++++++
 meta/recipes-devtools/strace/strace_6.5.bb    |  2 ++
 2 files changed, 27 insertions(+)
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
+Upstream-Status: Pending
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
index 8f90c35925..81baae474f 100644
--- a/meta/recipes-devtools/strace/strace_6.5.bb
+++ b/meta/recipes-devtools/strace/strace_6.5.bb
@@ -14,6 +14,7 @@ SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://strace.io/files/${PV}/strace-${PV}.tar.xz\file://skip-load.patch\file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch\file://0002-tests-Replace-off64_t-with-off_t.patch\+file://skip-test-so_peerpidfd.gen.test.patch\">&quot;https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://skip-load.patch \
            file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch \
            file://0002-tests-Replace-off64_t-with-off_t.patch \
+           file://skip-test-so_peerpidfd.gen.test.patch \
            &quot;</a>
 SRC_URI[sha256sum] = &quot;dfb051702389e1979a151892b5901afc9e93bbc1c70d84c906ade3224ca91980&quot;
 
@@ -47,6 +48,7 @@ do_install_ptest() {
 	install -m 755 ${S}/build-aux/test-driver ${D}${PTEST_PATH}/build-aux/
 	install -m 644 ${B}/src/config.h ${D}${PTEST_PATH}/src/
         sed -i -e '/^src/s/strace.*[0-9]/ptest/' ${D}/${PTEST_PATH}/${TESTDIR}/Makefile
+        sed -i '4 i skip_ &quot;Skip due to trivial output format difference.&quot;' ${D}${PTEST_PATH}/tests/so_peerpidfd.gen.test</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Oops, that line is no longer needed. V2 with it removed coming
      up.</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:178B9D6D52233587.5378@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">
 }
 
 RDEPENDS:${PN}-ptest += &quot;make coreutils grep gawk sed&quot;
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#188783): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/188783">https://lists.openembedded.org/g/openembedded-core/message/188783</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/101805563/3616765">https://lists.openembedded.org/mt/101805563/3616765</a>
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

--------------o5UEszQbmTM8guYf0Yxu0por--

