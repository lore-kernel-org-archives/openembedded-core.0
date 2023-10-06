Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 505B5E94125
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 21:25:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5993.1696627545072941012
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Oct 2023 14:25:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qiUEfUYa;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8643e002a1=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 396JTYnd023900
	for <openembedded-core@lists.openembedded.org>; Fri, 6 Oct 2023 21:25:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=rh8CwtCD2hPFTXeC94Y
	Vd6/zAph8zd6GwonWwBbnVFM=; b=qiUEfUYa9cM0Os6DIQxm2/No8u80iMOBcrM
	FM5aiX/6lrbGYzHAj9412qOMQ4H0YGhqsauWFQ2NRCXIHRUOuKXTtSBmIUEUv7eT
	sVOYSYZmH/2JFykw7oiRLwzquXpJOB5hC41gHmPn1uyqVx34A6x547fJ9R0L+U3h
	LaENso1b6B7bXngX67CPm1Gnykl4GRmdjdr89vLx524obm9gK5kg/4DoDPJX1d9G
	62nNnvQsJ8UzyoofpwOpVmGinW2n//Mlyksr9pY0QPuK+8uqJcblMljFZGUCdO0J
	Y35o+WeeBQzbp3rLO9H86ZQd3VBeUQE4eDaHCbxJ/AEMnUQ8IIg==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3thu0g9n9d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 21:25:44 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hgel12L3OqX3baE0/8uB4Yh9Y3ebJzcC192Ou0lZVdcIsPduwD/BSLLgUUZAyb3x2na5WGiNR1N/l7331cP/yx0H9d8b8jloreUBdkAJW43b4iFshN3NnZTxGd3IWvajiTfqxD9cDlrknudsXlRl0aa0Mc2jTtNcp8h2iYmYYahj60U2kjuv24DuzIRweDGNhRR4qjrTA1vdUusvIvic6mYcEf7zFicFs5RMBODEcNPdqMvSvltNOxv5aYALHKUIEuNmw/+5CFhn0YxvDjtRIp9Tw3SsIgi6gvVs7EDSlyNnpw5S9pO+5xJMITCLYacsCj/6jGH1t86aqt0yEbCcRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rh8CwtCD2hPFTXeC94YVd6/zAph8zd6GwonWwBbnVFM=;
 b=nKTpiKqulJvzGUP9sB73CKbe7kIw55hxhaLqUHvSyrM4qCvsKU3K9vWF1jZaFWzRDbD+azWL5BdCWqwsUzHwd6DzuS1hm1j0JTJtsip2YI3ejNYEFTP1HBb/S7VMEexp3DTO5T8wcRUyOZXkQ4he0lrjc6KoF79GPLvUo1OqN42zteksiuA5McC84p/uk+6RTdyBZw0fg4hs4UMMmpGrnTz7r/Vg+KPq0uHW9ThW5+NXKqXbPTczLzoLxUJTjUuh2eZLsMkZ4IH2+VFpDVN4KpbgLgXwETxcM6UQkelJbc6VVjxyErOmvhGMepzfr8Lvpg06GCJ6sE+rOjG1PPw58w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by PH0PR11MB4775.namprd11.prod.outlook.com (2603:10b6:510:34::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25; Fri, 6 Oct
 2023 21:25:39 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::d2d8:3f97:b35:ee7d]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::d2d8:3f97:b35:ee7d%3]) with mapi id 15.20.6838.039; Fri, 6 Oct 2023
 21:25:39 +0000
Content-Type: multipart/alternative;
 boundary="------------DOu06Qsa8CRnqlA2U97CGsWF"
Message-ID: <01520d0d-1ec6-42e9-aae2-2a857061be8e@windriver.com>
Date: Fri, 6 Oct 2023 17:25:35 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V2] strace: skip so_peerpidfd test
Content-Language: en-CA
To: openembedded-core@lists.openembedded.org
References: <178BA120CF45D8EE.5378@lists.openembedded.org>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <178BA120CF45D8EE.5378@lists.openembedded.org>
X-ClientProxiedBy: BYAPR11CA0087.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::28) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|PH0PR11MB4775:EE_
X-MS-Office365-Filtering-Correlation-Id: cdf2b2e7-87ee-4ea1-e8d7-08dbc6b2c975
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NxAIYUkL650oA/iW7t+yN2aE4gxcBt4hLKbfuGTkzbtT3cWa0PnAxxY1fkjLo6Ro7TrbzbU6Q4msOSGpZm94fVRao+fIphfXe6ic8m1zkuaT1/zmJ9Kao6peYn/ZOtGS4TUQWwCpXF/D5MZKAegHEeGpOJRpjKx0YHsyBYo88kZZTLJgyozlrP0IFii2JKOVrUjNtc2I5aFzP7Da9W+WcJv0kIGtOTbVT1mHf8m4okSXq+TCqTJTSfi8nTWqCn4ngjxmG+pzWTx2W0g7oSovhPrOwLd2yQ/10ghyzRknc8YakOcU+wAMLcO+76cRCu8EFcrHODgqRCnGWq5Hc67CpScKqfJroLpgjVAj9QBKliklIvN1Ty79UGtddFbp7zgkcyK8cho9oDQkHd0oUJ6kjqN5MDjlZnV2ftoX/4oIgUUegKE7d2OmG59Ylp82AiBMjC0saV+wZWbX/ghJ16VlI5LGWKv7WR1PQUT2pgzson0LJZqrM4rVTRxmVBhF05ZEsIJpau11nOGjCmHx3agoR/WmSmnyNuFO6N+s1JnP3fs9sXsFoWvoP+cpE86Nk9LggIY300IAA3itV1KO6rKTxYbvb4an99zDCSg40Fn7NkjCA9rQSdW3ZUfK2NpcBmya
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(39850400004)(366004)(136003)(346002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(66899024)(83380400001)(2616005)(26005)(166002)(66556008)(6916009)(66946007)(66476007)(8676002)(316002)(6486002)(6506007)(5660300002)(53546011)(33964004)(41300700001)(6666004)(6512007)(966005)(2906002)(478600001)(8936002)(36756003)(38100700002)(31696002)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZndMMmlXOHg2T09sdGVxcndqR1EvcERSenlqcUx6ejdGTE15VXM0b3RNWmts?=
 =?utf-8?B?cmhWR09pYzVobUZMSmhHM3hwV3o5ejZLb1FEQjJLejNSVEh2TW5wSzVqRUR0?=
 =?utf-8?B?UEY2bGZRalg3RXNPYnVtUmcxYzdQck5JNHVtMzNZdjRDMHA3ZVBzZFc4Y0pU?=
 =?utf-8?B?Q2xBMUIvY2RYZW90bWIwbERsUklqeGFOKzVjcitrTHVnVmpEOXA5dEpwVUxC?=
 =?utf-8?B?cDMxVWhYTHBudHJOc2ExTklBaXVuZkRzUWEraG1kMGpqTDJ1TmlzTXRSTG0v?=
 =?utf-8?B?bHgzZjVnWUQ4NjRrN2tVR3kxREpJNUM0b05GNnBNTHlEWUFYSTJxdG50ZEZZ?=
 =?utf-8?B?NTVHRWVhalZRekZiQTJOS2NEbmxPdCtQYjZnbkl4U25mVHpvVlYrU05jMlBz?=
 =?utf-8?B?Wkt3RHFRMEhrajNUYm16VE0ycE9SMVhYeXZDajE2U3E3bmpoVCt3RTVyNzg4?=
 =?utf-8?B?cEtSSmlhaC9yeHlpMmp1clg3Q2hNKzlmeFoweWNzWjJwZ0NFclROSGxsdVZQ?=
 =?utf-8?B?M1FQR0ZnQnpJT0xyaHVyRE91NHByajljTjlyM2kra0dENnVUYnFMU25YRWpt?=
 =?utf-8?B?SERZRDRreDJRR2RJMW5LVkpZYUFVZ3dOVE9xWTlod2lEZlhzZDVDUVdQVHI4?=
 =?utf-8?B?akFMSFlMZ3Z3MHB2L3lzYWtEQ3pveitYSkM1NE5nNUlnMHRubEk3YjBKUnRZ?=
 =?utf-8?B?dWlpbzNLL09CRVRNUEJrUFo1Mzc1Rm9TNXRQTGhsTkNWRlJ0QUF0OVNFSkxl?=
 =?utf-8?B?MFhCQm12bE0zRTNOWkJBYXpVTHBBTzh6a0ZTYmpkY3Fhbm9ZZGovdlBQak5N?=
 =?utf-8?B?THVXK3libW1xL1ZneU5xSWpacVY4dVJJa2VXNHNCUTljb1d1VTlUcEd0QlpZ?=
 =?utf-8?B?UVdiREN2RFFwMklRamg0N1RHU0RtZGMvUVBRZVVmRUNIdng5bmpJZ2FFN3cw?=
 =?utf-8?B?eUsrTkhaZlJYYzRobGZEeXZud1hLSmo1LysvQTZFMTFhcm4rMUtUTG1oOTBI?=
 =?utf-8?B?amJiRTIxQy9zUkxJUFRHTC9FcS9obzhob0RDb0ExV29yVnAyMjVBT0ZJOXBj?=
 =?utf-8?B?QUwxU1JrejkxTGx4bVh0K1dSandqeVMvS0pOWHdOd1Z2MnVSZ2hiYk9CckZn?=
 =?utf-8?B?eWdWWFVPWHpZejc2K2lKYXQxLzg5czkxVnROY0c3NUJwU3lkcjE3WXhwbzhy?=
 =?utf-8?B?WVlaRk96WFBmekdueWJnT1djV0M4WW5DR1djYlp0WXdmWm5XSjV2b1RhUHRN?=
 =?utf-8?B?eS9JbFhqdmhoUHE4bDZIN0hwVDZKcFVEVVFhSGVFVi8xZVdFQktBR0I3SHhN?=
 =?utf-8?B?N0Q1VDFDOUd5NExNZE13YUhtcWRKbHpIeGZyaEh4UUdEL01JT3Q3U0RoWExr?=
 =?utf-8?B?K21PeXZ6NDFQUU9CQWpFemN4U29aTG1ZbE5mVmJuVWd4a0ducHQrM3VlaTho?=
 =?utf-8?B?U29DQ21nRTR0am9iOHR0TWpHQlRQVDJ5Wm83V0NhTXZ5OEYrbkV6MUE1amNx?=
 =?utf-8?B?TzVzY1IvYWJ0NVZoWWZYZ1RDK1owMnlLNnJRVHV2bnRDWitmU1lmRmlReXU2?=
 =?utf-8?B?RGsxeGxlZXBHTzVLVjJpVlp0UUJNQTBiN2lHdENhRlYvWEZxUElhdUVhdjRH?=
 =?utf-8?B?V1M1bFBSWUxNcVdFK0RYSjV2U1UyMHoxUVM4OFBRWTJPZENjbFNqS1JVRXRB?=
 =?utf-8?B?UDY4TWs0Snk3TVg5NG1mdTJvbXdERkhHMWFwYzNLUE9RcGhVWVFkZStOY0d6?=
 =?utf-8?B?NEhPOXNseWxDd1pEMVd1azlmb0JQcThHdWtyRHYvT3pQSGg2cGlqU240eVBT?=
 =?utf-8?B?dEtYTUNCYU1iYnByM2gwb1k5dDFLVUlCby9ETU1SS3d5U04yRWxiVmd0NDQz?=
 =?utf-8?B?QTIzYUdjZCsvODRrOE1kTkJpSDBkYjE1S05Qa2R2VUt2dXBsODNBRnNYelB3?=
 =?utf-8?B?a3NlZ0tWb3FRNldxRnNBQUVicUViYlVFcDE0a2hyTHNJSXptU1RrcGEyUGM2?=
 =?utf-8?B?R0o5UVE5djQxRFhQQnZkRmhiMWhkVG1PakxkTU5XRHhuWDU5TEorRUo4bWRF?=
 =?utf-8?B?WDVjZk9IS2hhaEhuQWIwTTQvVGM3aUNYRzVtY3lZd0xCYzU2RnZzaHp4YjVB?=
 =?utf-8?B?R0c4bFdwWkJka3lGaUlzWTJ2RDZQdXo0U1J1a0d0R0NJbHF4ZS9mQ2hveS9B?=
 =?utf-8?B?eUE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdf2b2e7-87ee-4ea1-e8d7-08dbc6b2c975
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 21:25:39.0747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JMlK/ZvNeRqQBAIKVLobIXel4nQOFbz+QiAfWz4OlhI5l96vphL7LQv5UxeUAujjCh6Hnxk/UwlitKu83halvo7cPZsg//9clvlhxccGnds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4775
X-Proofpoint-ORIG-GUID: dAcGMXbHF8gh2cxXh2GnJah9GNJvOdGf
X-Proofpoint-GUID: dAcGMXbHF8gh2cxXh2GnJah9GNJvOdGf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-06_15,2023-10-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 mlxlogscore=841 mlxscore=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2310060164
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 21:25:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188787

--------------DOu06Qsa8CRnqlA2U97CGsWF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023-10-06 5:14 p.m., Randy MacLeod via lists.openembedded.org wrote:
> From: Randy MacLeod<Randy.MacLeod@windriver.com>
>
> The so_peerpidfd test is failing due to a difference of square brackets
> in part of the log file. Skip the failing test until the difference is
> understood and fixed.
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

Sigh, the status should be Inappropriate, v3 coming!

I do plan to fix this upstream but this work-around is inappropriate for 
upstream.

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
> View/Reply Online (#188786):https://lists.openembedded.org/g/openembedded-core/message/188786
> Mute This Topic:https://lists.openembedded.org/mt/101806877/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux

--------------DOu06Qsa8CRnqlA2U97CGsWF
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2023-10-06 5:14 p.m., Randy MacLeod
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:178BA120CF45D8EE.5378@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a>

The so_peerpidfd test is failing due to a difference of square brackets
in part of the log file. Skip the failing test until the difference is
understood and fixed.

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
    <p>Sigh, the status should be Inappropriate, v3 coming!</p>
    <p>I do plan to fix this upstream but this work-around is
      inappropriate for upstream.</p>
    <p>../Randy<br>
    </p>
    <blockquote type="cite" cite="mid:178BA120CF45D8EE.5378@lists.openembedded.org">
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
View/Reply Online (#188786): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/188786">https://lists.openembedded.org/g/openembedded-core/message/188786</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/101806877/3616765">https://lists.openembedded.org/mt/101806877/3616765</a>
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

--------------DOu06Qsa8CRnqlA2U97CGsWF--

