Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10568C61DA4
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 08:33:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2160.1676363582940193952
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Feb 2023 00:33:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=14095b8db4=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31E7RaCD028208
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 08:33:02 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2173.outbound.protection.outlook.com [104.47.73.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3np20a2esg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 08:33:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EJNUsyhE1MnStsni1XaCI0uaDqXsdPwkqtAAWsYgseC0Nd+qos4gHqKmZ3RYQLj6IcPQZ8nUkLFfCIf9C3/ltI8us8y2AvHnpxioy96Rr+7vL906v2ElLHvLF13WKoaN03x0y2rPvvXJ4RGA6MJaJudxDPsZymLp0DyzhsdiQiNK3ZSxIwNmeP2R+Ht7JIKcgHF1ieJy1+XFvpEB942yIYxFZWQXej1l0sJOcptUwLLC9S3g1icrJMVrWYUBnJ7JMBl2P40Y7PMarKOz2gnvM0IFSmEtiERA3fQxnFzj0KWXQbu2UPsdCL3Mas+g0ztFBgEtFvy3ZYN7jrkBHYlKnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UKc7i8e9b1UYa6HcT9IDoU7oMNnsBjfEhZI1xCPN3j4=;
 b=l7d5nE/NY4m9JFCN2tPgwqgpGn9B1e8iJ3P8b/OXnDnFaR1x0oDnMw8UXloXBt8GXwfPVmI0eQuIfsqztUJYxQ/39IJCIEh8mEfpVrjhhVHfqtfj2JDyghUylvk00ocg4sRe7H8MP0DS3HrpXPRYCj2o6nMedvr56yGlTcnKibwGUnj8izbFBgylWmaxLmBw3mQASORkrnDnH9/IJzmuENhDWJMt2p79FpdxFIGsjD7cxoq/Xxm6SRbLcI//7YPidm6hmHoMvaeOTODWeSFW5RhtFCWgORy2g4HJqn56uj4ZAi+lnn06Pu77GoUKyjVLu2ORZu+hFVYlVfZfupUWTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by MW4PR11MB6840.namprd11.prod.outlook.com (2603:10b6:303:222::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36; Tue, 14 Feb
 2023 08:32:59 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f952:3d02:d71:cc68]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f952:3d02:d71:cc68%4]) with mapi id 15.20.6086.026; Tue, 14 Feb 2023
 08:32:59 +0000
Message-ID: <b125e99c-fedc-2cc8-2f72-7255b0547fe1@windriver.com>
Date: Tue, 14 Feb 2023 16:32:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [OE-Core][master][kirkstone][PATCH] dhcpcd: fix dhcpcd start
 failure on qemuppc64
To: openembedded-core@lists.openembedded.org
References: <17425510A5DF8C5B.6713@lists.openembedded.org>
Content-Language: en-US
From: xiangyu.chen@eng.windriver.com
In-Reply-To: <17425510A5DF8C5B.6713@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR21CA0029.namprd21.prod.outlook.com
 (2603:10b6:a03:114::39) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|MW4PR11MB6840:EE_
X-MS-Office365-Filtering-Correlation-Id: 970c9380-f721-4c33-99b9-08db0e66144c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mUEKSJruvTTYL3kdQSobVBPMwF2iPn3kELEqihtlZHFyYKhrgc1r8gqK/eFcJaLnslfa747S7CO93hMOvdpJg1zEeBkEMJjavvrFM+xrJK64zn8+nWFZBl08rWeGG/i0W89MfW4oIuBzppHNDT2wWrJQeHiSy39at8yZkjK6Sh/BOlevbQ+7cM9vSjlol25vZZeSwR9TYIvGUEiLe7bnydembeM3jiSCYw1KY9dAkjTFzHUAqM5Fw9BpV9z7TpKfx5mqx9VqkAPJZagzAost79eNJHHqxRFViCSQAy86ZPYZAMT88TOfJV1yf1WIhmNvhoTaMJ2gk2HqO81W5rcmGPg3fajRkRedhcY2+/FemTJia5eZgAgPzfH9VUxkGk6cOCEwupQ7ovPmugnYUJ46msmxiJbiK9xLAinrSzkNCQmVgmxMfD14/qglApJS1NRnfYQ6feTqvVSzdYU1RPRkeMT5skBBUYHu5b1tNuyl3f+tzkcV89hTngrqAR0DDCGwXnRrgfXj9Wa6puujtHMWbvA62HxofUSX9zVidZb4U430YFRTNxZu6NZv0KkcQxrA8x1NYki5YBOXdUUmJhUKUfMnOtGFbvBZakUZx9B7ITeH9qQgxMID1M5a9tk9hLs3DRAGrUAROWHwMAfw3+rA9DQozkvYMpp2ITyMkWdqogfOTwXqh3zg3sDjS8B48GKUADIWwnTv/QgNkrV4ob9RpZ0f/hoWA2W6tARTAx33e6hUz7ZpsNug8ZC2P51+1fjb
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(396003)(366004)(136003)(39860400002)(451199018)(966005)(38100700002)(83380400001)(186003)(5660300002)(478600001)(316002)(31696002)(6506007)(36756003)(6666004)(9686003)(26005)(53546011)(8676002)(2906002)(6512007)(8936002)(66476007)(6486002)(66556008)(31686004)(6916009)(66899018)(83170400001)(41300700001)(66946007)(40753002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cmxRaVkvVnoySHh5cWhLWklSRms5RERpaWo5bDRMMWZOR0ROSHBrNFRTNDl5?=
 =?utf-8?B?ZXdLQ0YzZUpTZGxIWEM5cllOWUJOZWd2STNQKzYvRVNMNElzamhVV09jUVNo?=
 =?utf-8?B?MHpodUN0M3Z6bzI2TjVUOHRsVnVkU3JTUEUrcVNzVXZKWTBIMi9SMmFuNGI0?=
 =?utf-8?B?ejR6Z1R0R1ZIbFBKK2plRS85SjlzUXVRZ3JLZ1hLYmdueDBqTTFHSDh2T1FK?=
 =?utf-8?B?ai9oT3I2VjIzbVpaQUJmMjJOa0hueWVsRjR4TFVQNlVWNGFVMjhnSFcxUmFD?=
 =?utf-8?B?N3hPdzc0cWNEU0grTXF1TGlrTHVqMXJFN0puQlhWYy9oRnhZMjI0ZU1zZDRa?=
 =?utf-8?B?MmEzd3B1d1VSdkxsK05HbkRwTVE1MjNab0RJT0xjdkJRYWFhNFlNKzg5dDBE?=
 =?utf-8?B?d3JiWVVTbUVkS2NNUlRRY20veVZEclZDdXRaajdiVXFRMlNzNmhPSlB1UEVy?=
 =?utf-8?B?bUVwRzBISm9ER0MzWXlxWEZ2S2wySk0yajBsR3lVakVyRmwvNEY1dmFYYmYv?=
 =?utf-8?B?dTdKbFc0QlZqMFh4VEc5WEd6MVhQVGNtd1NlWVR3b2RqWHRxVGlDaUEvQTZG?=
 =?utf-8?B?ZTdZWHFtN2FPN1IyQ29QOS9JejdXUHROekY1NERTK29RS3k5Y0JnY2J5a0I5?=
 =?utf-8?B?WnliVHcyZ1hKWHI0T2dYbTZ4KzFxNXhRN3JtN0VnWS9LLy9ocnJZNWIxekg3?=
 =?utf-8?B?Z0dVTUhEOTdhWHVhaDZGTTZ5NGlsMGhUQmFEK1oxQkZDMjhDc0NEL2NiMzU5?=
 =?utf-8?B?UzNLYUhrcUNsYS9DNkpTdVM2R1pxNGppWWZHQ2VDRE5USENPaXlOVFp2VnNB?=
 =?utf-8?B?U3g4eDhRbFRCQncycUROSjFwN1JQbnh4c1p1MlFjTmFuTGx1OHRFSlgwM1cz?=
 =?utf-8?B?RUppRHBheDVMTm10VFNZUFFBbVMzVFBISWwrczk1eTF4V2JHaE52VHRIemha?=
 =?utf-8?B?UVNZT0o4Nk8rU05PZWFTdXVqZlVGbzlwQVk1M2ZFNDY4UHRlZk5mbTJ2RUVm?=
 =?utf-8?B?NjZ2Vjc4MHJPa2VKczV1Tm9pSlFtWGZIR2NmQldaYjNMMUxLUTFhbmllVVdH?=
 =?utf-8?B?a0srRUE2UzF4SXd2dzMzNDhFbUFCajZ0eWJQdXZPaGNQYlpESUNkNER5a1py?=
 =?utf-8?B?NllBWS8wRzJ6eGlrd25DZ1Q3SEpLZUwzRHpIQ2tDU0NWUm9lY2hGUDBOSFly?=
 =?utf-8?B?WjlZdnVJWitWZi9DZ3QyOHhLUlo3MGhmWnhxWUxabE1RWjExRXUwSDJvVHZq?=
 =?utf-8?B?K242K00wN1ZzdnQyK1BINmJieGFNTk81Y1ZTM0hhU3pnTWh3R0VMeEk1SHRh?=
 =?utf-8?B?eGN5empsYVpaUlcvKzZqN3Y0QmQydWZWaUFDLzB4RUhLZGdzZHgyMGVzM0Qy?=
 =?utf-8?B?aFFDTnhNMFJUNHhOeE1oOXRHQlprV2paa3FLdTk1STFYZUx3YUkzYWJaR05v?=
 =?utf-8?B?NnRLMlgrckJpR3VpQXU2SkRwaEpoR1FDbDZxZzhuNzdCeGx2Tk5YR2pNLzMz?=
 =?utf-8?B?NWZjcVZvSHpuVURFMXhVUVFRNXhteVlyRWlLbzJvUms3Y0ZTZlBZd2VxRTdQ?=
 =?utf-8?B?dHVhbXE5anRsVVBnS1I5aXdUR2RieG9wWXVIMElmWHlOZXBqL3NaZlRvVVJV?=
 =?utf-8?B?OEdhdVcwc0FsODR3YW9ZZE9md1NFTnNsVlp5QVQ3L0N3REZOT0Z3ZkVqdzRz?=
 =?utf-8?B?dmxBWGg0SjdORkRXM1BjZUNMd1dEZm1SeFdxYVgyTVpvWUFJQlpUOFRscnFa?=
 =?utf-8?B?QStaYS9RdDlEM3ZGUlRQcTlRUGRxSXZZMCtrNEVhQThjMWhUTTR4SDFCNGNa?=
 =?utf-8?B?c1l1bU4yMGJsdU14QWpoL1ErMWRXdXMxUC9jcWRPYWpRcmFLMWtiVTJpL29Z?=
 =?utf-8?B?cGMyMUQ4anNMVGgraW9UekhtTWlydWhnUWIydmpVaWJrdisyaG54UFJnU1lU?=
 =?utf-8?B?bXQveXlyWlFxamd4OHU5RU5EVEFPdUdqMUo4UU40dGJjRUFmV2tIWDNxNHNL?=
 =?utf-8?B?bEUzUWEwTG5NQk9EZklRYjVKOVlFcm1WTCt6R3pIVWdaZlUrL0h6OXFTVEg3?=
 =?utf-8?B?Y0tMZUkyWVlPb3ZsNWY2M3did0VLZzBpeDlvMjFVdmFiT3Y4NEsvdEhkSHZN?=
 =?utf-8?B?c3pVeVNHRGhUczZTTjJjc2x6SlU4dG1Ra3I5Q0hsak55TC9FTnpsWXUxd0Fk?=
 =?utf-8?B?OEE9PQ==?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 970c9380-f721-4c33-99b9-08db0e66144c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 08:32:59.6199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tViMZDbBKlfb0go9JDu0Z30ChXdlctK7G2OZGCTfAYmFdnA3w2Es34dMhNIAw3ecwQN7gGsZAL8CzSgVdkr4qequhnY49XIgjkMFLP2Mz+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6840
X-Proofpoint-ORIG-GUID: 5QArovwHl-jp9u7qtNqBv6LR56afuQYw
X-Proofpoint-GUID: 5QArovwHl-jp9u7qtNqBv6LR56afuQYw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-14_04,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302140070
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 08:33:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177128


On 2/10/23 10:18, Xiangyu Chen wrote:
> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>
> Backport patch to fix dhcpcd start failed on qemuppc64.

Friendly ping, thanks.


>
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>   .../dhcpcd/dhcpcd_9.4.1.bb                    |  1 +
>   ...x-SECCOMP_AUDIT_ARCH-missing-ppc64le.patch | 34 +++++++++++++++++++
>   2 files changed, 35 insertions(+)
>   create mode 100644 meta/recipes-connectivity/dhcpcd/files/0001-privsep-linux-fix-SECCOMP_AUDIT_ARCH-missing-ppc64le.patch
>
> diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
> index 5cf77fa0f6..39e689d2f6 100644
> --- a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
> +++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
> @@ -16,6 +16,7 @@ SRC_URI = "https://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz \
>              file://0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch \
>              file://0001-privsep-Allow-getrandom-sysctl-for-newer-glibc.patch \
>              file://0002-privsep-Allow-newfstatat-syscall-as-well.patch \
> +           file://0001-privsep-linux-fix-SECCOMP_AUDIT_ARCH-missing-ppc64le.patch \
>              file://dhcpcd.service \
>              file://dhcpcd@.service \
>              "
> diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-privsep-linux-fix-SECCOMP_AUDIT_ARCH-missing-ppc64le.patch b/meta/recipes-connectivity/dhcpcd/files/0001-privsep-linux-fix-SECCOMP_AUDIT_ARCH-missing-ppc64le.patch
> new file mode 100644
> index 0000000000..1c514f9b8c
> --- /dev/null
> +++ b/meta/recipes-connectivity/dhcpcd/files/0001-privsep-linux-fix-SECCOMP_AUDIT_ARCH-missing-ppc64le.patch
> @@ -0,0 +1,34 @@
> +From 7a2d9767585ed2c407d4985bd2d81552034fb90a Mon Sep 17 00:00:00 2001
> +From: CHEN Xiangyu <xiangyu.chen@aol.com>
> +Date: Thu, 9 Feb 2023 18:41:52 +0800
> +Subject: [PATCH] privsep-linux: fix SECCOMP_AUDIT_ARCH missing ppc64le (#181)
> +
> +when dhcpcd running on ppc64le platform, it would be killed by SIGSYS.
> +
> +Upstream-Status: Backport [7a2d9767585ed2c407d4985bd2d81552034fb90a]
> +
> +Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> +---
> + src/privsep-linux.c | 6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/privsep-linux.c b/src/privsep-linux.c
> +index 7372d26b..6a301950 100644
> +--- a/src/privsep-linux.c
> ++++ b/src/privsep-linux.c
> +@@ -232,7 +232,11 @@ ps_root_sendnetlink(struct dhcpcd_ctx *ctx, int protocol, struct msghdr *msg)
> + #elif defined(__or1k__)
> + #  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_OPENRISC
> + #elif defined(__powerpc64__)
> +-#  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_PPC64
> ++#  if (BYTE_ORDER == LITTLE_ENDIAN)
> ++#    define SECCOMP_AUDIT_ARCH AUDIT_ARCH_PPC64LE
> ++#  else
> ++#    define SECCOMP_AUDIT_ARCH AUDIT_ARCH_PPC64
> ++#  endif
> + #elif defined(__powerpc__)
> + #  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_PPC
> + #elif defined(__riscv)
> +--
> +2.34.1
> +
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176972): https://lists.openembedded.org/g/openembedded-core/message/176972
> Mute This Topic: https://lists.openembedded.org/mt/96868623/7175143
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [xiangyu.chen@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

