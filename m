Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A3F2C433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 03:54:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.3368.1654055680674781047
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 20:54:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=FgamT+PI;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=3151ea4108=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 2513puN7022459
	for <openembedded-core@lists.openembedded.org>; Wed, 1 Jun 2022 03:54:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=0jJ4wTvnwMRMjb1V9Jre8BxCtisNsiQ04UuJlZgOC24=;
 b=FgamT+PIQL9j/hvsTcphyCPAiag/puag1TbvQ0owfVLP3N6dTw78CqF7Nf0IcGwytlA4
 19c8WMmxpBqhpJunq69BIQfuPAZQilKLefBFIH/ygUaIkgvdXf4wMjZSliJkXdOo4Mfr
 HM0MFE3O0yz64xHWxiQb0s0BcUpG/qrghEXjoOwdXPgRv/jsdn8/Q48PGFwLObTnA5mL
 lqqeHEImFBnTao9l6aao0g/TFvtaeCpAQ5sdueJaaPkaRgmofIg9Cfrt5vpHC7nV3BVc
 BgnKDILJXpIADPMy0NMYI/XiJcRN+z4MDIyQyBuWHeGGqd8P2muGH9XR6Ci/8DN2sQuG 4Q==
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gbbxkambu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 03:54:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iNkiJ9mfeMx6HUj5jBRwtYnCVexrPO9JL2N64fWky4+Dt4F+a8r7FRQ8iaCUHt8yFsEasj4Mr66Dzci9Cy5IMp12LHjfdv/w8fAc2G285wEJMn/pfrNM9zVWA+0MiykrEq5MJKOydrOgbrLB4cN4vJKPx3iN8z2TXKuGBzqW0Iw+pAcxipThG7pxfyL5kBtNt1EAcgSKPxXA5+unvSXKbEihdq2W7bn1Hti8Zh7bK/ZqoJn1m9MNOhpb28FRvN5tJKPu8UqpbRc9yMLfQBUTA2bqLTsNql2S9IcdmqkUG+hwSnFh56cK9+3v4Sefd8TXsYw+JL5u+/m5mBsqMXEoww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0jJ4wTvnwMRMjb1V9Jre8BxCtisNsiQ04UuJlZgOC24=;
 b=L0w/YCxqsqYWd2ejDYoT0xWe4YpVOg6gO00mQSeIUDzynmRNNqRGZAIHGN3vvh0nsr4Hm/a8vQyOWxQWqy3Ik60ASXMVLcs+JxcmgKLFy6wUObqbQnSgjGwwWOguJmaLsv4W6ckqFwOxNoTPO343DfATNkLWV84EvHw88Ou/EiVapvYg5Ru6yVTtPhaMglBOm0SlhcfTJErSUWKO2hOgzuVNVvdB7Jpf8H+P8vq9/yKhj7UX47k5ua91RzE7sR4BzDbZUymp5D5vRcbIg4L+oeRyjMRzaOrm4lN0rNjMbwm2HFuF+n9T/7tT0Vc3xEK/K24HauJTvzAFuMbpPErpKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 SJ1PR11MB6131.namprd11.prod.outlook.com (2603:10b6:a03:45e::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5293.19; Wed, 1 Jun 2022 03:54:37 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::7cb0:dc6c:b2b3:b69b]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::7cb0:dc6c:b2b3:b69b%5]) with mapi id 15.20.5293.019; Wed, 1 Jun 2022
 03:54:37 +0000
Message-ID: <dec30d02-897d-2a31-f71a-967c908c7867@windriver.com>
Date: Tue, 31 May 2022 23:54:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [OE-core] [PATCH 1/4] qemu: fix CVE-2021-4145
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <16F44FFA3DAE5CA5.22101@lists.openembedded.org>
From: Sakib Sajal <sakib.sajal@windriver.com>
In-Reply-To: <16F44FFA3DAE5CA5.22101@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0043.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::15) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd93ea16-ed3b-47ef-1b37-08da4382728e
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6131:EE_
X-Microsoft-Antispam-PRVS: 
	<SJ1PR11MB613155C61BE5417EDAFB648BF2DF9@SJ1PR11MB6131.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fj/57OsTfLiYoGSni7Cf4jHsbhUcBMbWxbJrSjI1WJZBd7v3CD+QHYqV4ruU5CWaykq91r64pErM5IrP3mEcXe9Y3F28I+NdmYqhN5dJJx97J/05NHm8VnJqOs8I0eOWmIUyHZLP8oLb9L5pqFb8gcLvJUoXR9cHZ3p5/PeJmKX22V5qFCiOi5H8DqEGSWCCwUmmLW77wBvo+FgaUvPn5ETc8ncNWSF4wIGkBIOTScIf7W+czErWd2GxbxdXGcXTqnymib3D9cjMDtCEg86ATZtyOle+EoWYBP/37oXARmh1GlFxMImxfoxzD+WhkpgP87mcO9dobAjz4wCxEwHuv7ICuJKxbFizPp0B/ya1meZiK9XAPB+0WZRWsEmN7AxKtpQX/q7UCu1sWKXr4TbM2mfDkbzif1UZsWnSOKk9bqa5upOV460Cu4cLQNXvdXz/91OMSeKkd8Szih9NjuwEm3XYexakhMBatlPiD6rxGJU59qSO+oXmib5EGmUZokul29yD7GfthOOKkHzrQs2CU9Tkg/PeoFL9KR3edturmtNHwDAPDYMxKAmLwH7ODOX8BZYEKiCDEgKdIzkEBJHcHTh/OwW+z6eUeZlG5eXMZ3LQ6alEtVvO8RFyEhpvIJQgQtNStgVfJFitTKW5TwEXDgi4nd4+bB43tyKl4JNHpEZp4TpvkKxjMN+vNK9pTFOWlYbyNT1+pc1kv7i88Ayj/FGddGmVdXbiPwh4lVPdq9KsTeKx5ezdjOwrj8g2TimcAT1JlPJzjQCmSIORLP6GkTtDqqrJMBEglC1jF70QYe2IAr8j6wIQWtRlLK7pkWpPyDLmdp0XvqaMBm8NwHp8sA5FHjDds+es9SRrU3ROGdTYyQODS8/pcHHBWPInS+rpQFnLwOpWmO3iZSmyTF1sQQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(44832011)(83380400001)(5660300002)(6506007)(2616005)(38100700002)(66556008)(66476007)(66946007)(31686004)(36756003)(8936002)(316002)(38350700002)(53546011)(2906002)(186003)(52116002)(31696002)(86362001)(6916009)(26005)(6486002)(6512007)(966005)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R3hKOElkZC9ML1VOczNjeDB5ZE4reTRjS0x4ZW5PZ2tkNURsOEhPZXJmQkhk?=
 =?utf-8?B?ajdyVXFsRzlZREErYmdUbks2eEhBUS8yRmNCMDl0VHE5MUtYYjVURnI5UFNT?=
 =?utf-8?B?M1FWMng5WFlHWGo5UWhDMy9WcUs0NitSRnBpeXhVSlFaeWVaczdwblZmNUw5?=
 =?utf-8?B?S003aCtQaVVNc0g2K3luTUlqajFia0ZMWVFkdDF1S2I0WXFBSElSQ0pyVjF6?=
 =?utf-8?B?Ti92RzFNUmlrVXlZaWlScmcxcVJOU1dpMGs2M0hLTnZtYjdGY0I0SUh0UDdG?=
 =?utf-8?B?MkFBVUhPN0h6RHRncXl3VmM4ak43eEE0ZkVZT3I1VE43SUVvdnhrTHl4L0Z0?=
 =?utf-8?B?ZHNuRk9HclR5SFpNQlkrY1RnVkpjckNoM2xyaHkzUSswM0RUL2FRSVFKYWwx?=
 =?utf-8?B?NEJqU2I4QUd0RWVmVWJVOVdUdjl0K1IzYVhPSm9vejV6ZHlibTZMNVAydTB0?=
 =?utf-8?B?TFBiRmNMbklnWFdtOUNpQXZ1T29uMjlVb0I3NFV2UWlEa3FlcDdrMTM2M3Av?=
 =?utf-8?B?TlFEK0NmZGsrdVdGbEtwWkxvMG1jWkhLbGlvMkhONjgyVHBzcDJHOFd3N1pt?=
 =?utf-8?B?UDJnclJjSXBmSFJ6TzZidGpHenJieWdKSXovUkFLUFM1VUVxL0EzZUVEb0ts?=
 =?utf-8?B?dHBob1NtS3lWTEY2ZjZua2o4YmNyVHJ4MlM3bFNIZUpZaGJyUkJab2pEaGJ6?=
 =?utf-8?B?bzhJNjdOK2g1Wkl6R09aeTBCc1haWnFCSWpLWThPNFR5UjlpTng2d0s1cDA3?=
 =?utf-8?B?UmVPbXpSYnExRGdqcEJHaDJRRENEUjA4S252YUoxZDEwdzQ3QXpjczdqdGFZ?=
 =?utf-8?B?Y25vZkVveVNGZXRUTzRkaXgybmVWeFhJT2xBditiQXptTzZ5UHg1KzhTTWZ0?=
 =?utf-8?B?czBrTjNabUNGWTJEd0xQd2pvSUtwek5sckN0MkVIK3g0OUQwYWZhakxnbUhx?=
 =?utf-8?B?WVpDVytiZmdwZEZFWU9UN3k2WXZBTE1qRmFhRFJac08zR2Y3Q0w4VzIxS1J6?=
 =?utf-8?B?MmZGQ2NSQlZsYkNmYXBiSWRWWTJob3I4R2V1OGdHVDQwUFo0S0JUUmREby9C?=
 =?utf-8?B?ckpYR2ZMWGNUaXdOb0I4N0NoVURsNTB2SGRhUkUySlh5U2p5a3RXNVB2dHJY?=
 =?utf-8?B?WWNwWlZqU1FueHFlbkZodjUyV2dnUkprTzhmYk9HZkhQNmhteTZIdnlaZ2ha?=
 =?utf-8?B?Ukc1U1BZaGZ6VjZGRzJxMHgzVHVkWUNCRWJEM1ptaFpISEFSSzBFMWJLZnhw?=
 =?utf-8?B?ei9oMk4rMm5WMVpsaTRjREJDU3hlYXEwak8yQjAxdy9TaVh3NTZsMWV3RnF5?=
 =?utf-8?B?YllSTThUZ3lna1RnQlIrNi9PRnBYdjIwVXZHbFFSaVhFRjRpWXpLT05odCti?=
 =?utf-8?B?WVFjTWtqRkNKTEhIN3d2cWlCZVIvczV1OUdTb1JoOEtkUGJhT0dVZ3V0VlZO?=
 =?utf-8?B?QlpXb2N6bEtVYnpQU2xtSTdZTUhDN2YvekpiSjJOcjZGY005QUhvNTUvMXBj?=
 =?utf-8?B?Mnl0aHJGZXUzbURTQmtWdXNWMmVxeEJsQ0NmTXJBdFNZNjJZdnRKVFJveHFZ?=
 =?utf-8?B?NEczQVJHMHFjKzlyTjNrZzhuSmRTcWNrTUxBenZscURoemp2dTdYUXFpUFZw?=
 =?utf-8?B?NkxCOHp1NUd2cFhldVFLalFqdUFJVlBzZC84YzlLcmtUbVZKUGs2NVA4bHpC?=
 =?utf-8?B?Q2RLUWZJQVZ1dVplTVdVRXYxR29Sb1d3akxYNjJuRnlHZVJpNy9lMHNNSS9V?=
 =?utf-8?B?UXZKbVVNVTRNVmVGRnc1aW80K1VOODZLbW85QnRvVlkwSnB6TTdha0VtUzZv?=
 =?utf-8?B?MnVXa2NkZEFVc1l5RFBVcDRKeXhYWXgvZmdrSlpoSUtremhwWWsxczEzVzNu?=
 =?utf-8?B?czlSdXRMc0R1LzBSbHdxdko1TWhnTmdtYldGZW14M21tU1JJVi9oMmNzWkdD?=
 =?utf-8?B?S2loMGV2Z2dEQTZ2Yzd3bFpXTjZuYmJBcTRjUDVKNk9Dai9zcTdwN3VXTDhz?=
 =?utf-8?B?dWdvUXNKc3pqdFhIczZtWjNlSyt3TzNkOHF6bUdMTWc2bmt5WVVWOHpvVmFE?=
 =?utf-8?B?Q2JhNGtNY3hBT3JQY3ZpeHZ6WnZKcDZrQmU2QjF5Um1ucG0vcUVqT1F6QTBY?=
 =?utf-8?B?aXpkWFF4NEJyZWRkdkg0QlVja2dQZFBhQ2o3MVlXTndhczdib0dnQmYwTmZw?=
 =?utf-8?B?WGozWEo3MmRWQnFlZkZ6K0lJTjVqSElHQ1dhM1hodGRhMHM5SmVnSEF3eUw4?=
 =?utf-8?B?TUlWMVdhcjB4R2M0OTA2dnZ4STJQdlQ1bFRTbnJUZXFqZVU0REFieE5Ncmgw?=
 =?utf-8?B?S2c1cWFxMy96UjV6cVBFWXU4MktoeVVPWlVtNkxmKyszWkJPTGIwSVpVK0tY?=
 =?utf-8?Q?qyl3K0NMITTj32f4=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fd93ea16-ed3b-47ef-1b37-08da4382728e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 03:54:37.4165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 4BgFkaJPqUYPxBVM6WtxsdC6ug5PK+msY/WtQGq6IImIXl7siLY2qCNUof1vFMNy5Yy201ws9NoW7ts1qGdL8jFLDTdVvemkz7u1HxBQcVY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6131
X-Proofpoint-GUID: GlFYd3HegmtTwrVhCRxCC9MnKW4LdLmj
X-Proofpoint-ORIG-GUID: GlFYd3HegmtTwrVhCRxCC9MnKW4LdLmj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-01_01,2022-05-30_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 phishscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206010016
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 03:54:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166350

This patch is for hardknott branch

On 2022-05-31 18:08, Sakib Sajal wrote:
> Fix for CVE-2021-4145, commit 66fed30c9c, fixes another commit:
>     d44dae1a7c ("block/mirror: fix active mirror dead-lock in mirror_wait_on_conflicts")
> Hence, backport both the patches to resolve the CVE.
>
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>   meta/recipes-devtools/qemu/qemu.inc           |  2 +
>   .../qemu/qemu/CVE-2021-4145_1.patch           | 67 +++++++++++++++
>   .../qemu/qemu/CVE-2021-4145_2.patch           | 85 +++++++++++++++++++
>   3 files changed, 154 insertions(+)
>   create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-4145_1.patch
>   create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-4145_2.patch
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index 568ef1be94..aa372810ce 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -75,6 +75,8 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
>              file://CVE-2021-3930.patch \
>              file://CVE-2021-20196_1.patch \
>              file://CVE-2021-20196_2.patch \
> +           file://CVE-2021-4145_1.patch \
> +           file://CVE-2021-4145_2.patch \
>              "
>   UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>   
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-4145_1.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-4145_1.patch
> new file mode 100644
> index 0000000000..02eae727d5
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-4145_1.patch
> @@ -0,0 +1,67 @@
> +From 59fe260a352156261ad0d89be446e5dd0ac96de3 Mon Sep 17 00:00:00 2001
> +From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> +Date: Sat, 3 Jul 2021 00:16:36 +0300
> +Subject: [PATCH 1/2] block/mirror: fix active mirror dead-lock in
> + mirror_wait_on_conflicts
> +
> +It's possible that requests start to wait each other in
> +mirror_wait_on_conflicts(). To avoid it let's use same technique as in
> +block/io.c in bdrv_wait_serialising_requests_locked() /
> +bdrv_find_conflicting_request(): don't wait on intersecting request if
> +it is already waiting for some other request.
> +
> +For details of the dead-lock look at testIntersectingActiveIO()
> +test-case which we actually fixing now.
> +
> +Fixes: d06107ade0ce74dc39739bac80de84b51ec18546
> +Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> +Message-Id: <20210702211636.228981-4-vsementsov@virtuozzo.com>
> +Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> +
> +CVE: CVE-2021-4145
> +Upstream-Status: Backport [d44dae1a7cf782ec9235746ebb0e6c1a20dd7288]
> +
> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> +---
> + block/mirror.c         | 12 ++++++++++++
> + tests/qemu-iotests/151 |  0
> + 2 files changed, 12 insertions(+)
> + mode change 100755 => 100644 tests/qemu-iotests/151
> +
> +diff --git a/block/mirror.c b/block/mirror.c
> +index 8e1ad6ece..fab008568 100644
> +--- a/block/mirror.c
> ++++ b/block/mirror.c
> +@@ -106,6 +106,7 @@ struct MirrorOp {
> +     bool is_in_flight;
> +     CoQueue waiting_requests;
> +     Coroutine *co;
> ++    MirrorOp *waiting_for_op;
> +
> +     QTAILQ_ENTRY(MirrorOp) next;
> + };
> +@@ -158,7 +159,18 @@ static void coroutine_fn mirror_wait_on_conflicts(MirrorOp *self,
> +             if (ranges_overlap(self_start_chunk, self_nb_chunks,
> +                                op_start_chunk, op_nb_chunks))
> +             {
> ++                /*
> ++                 * If the operation is already (indirectly) waiting for us, or
> ++                 * will wait for us as soon as it wakes up, then just go on
> ++                 * (instead of producing a deadlock in the former case).
> ++                 */
> ++                if (op->waiting_for_op) {
> ++                    continue;
> ++                }
> ++
> ++                self->waiting_for_op = op;
> +                 qemu_co_queue_wait(&op->waiting_requests, NULL);
> ++                self->waiting_for_op = NULL;
> +                 break;
> +             }
> +         }
> +diff --git a/tests/qemu-iotests/151 b/tests/qemu-iotests/151
> +old mode 100755
> +new mode 100644
> +--
> +2.33.0
> +
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-4145_2.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-4145_2.patch
> new file mode 100644
> index 0000000000..891664375c
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-4145_2.patch
> @@ -0,0 +1,85 @@
> +From 09036c63a4a498d65de0d035211b01f0482e3533 Mon Sep 17 00:00:00 2001
> +From: Stefano Garzarella <sgarzare@redhat.com>
> +Date: Fri, 10 Sep 2021 14:45:33 +0200
> +Subject: [PATCH 2/2] block/mirror: fix NULL pointer dereference in
> + mirror_wait_on_conflicts()
> +
> +In mirror_iteration() we call mirror_wait_on_conflicts() with
> +`self` parameter set to NULL.
> +
> +Starting from commit d44dae1a7c we dereference `self` pointer in
> +mirror_wait_on_conflicts() without checks if it is not NULL.
> +
> +Backtrace:
> +  Program terminated with signal SIGSEGV, Segmentation fault.
> +  #0  mirror_wait_on_conflicts (self=0x0, s=<optimized out>, offset=<optimized out>, bytes=<optimized out>)
> +      at ../block/mirror.c:172
> +  172	                self->waiting_for_op = op;
> +  [Current thread is 1 (Thread 0x7f0908931ec0 (LWP 380249))]
> +  (gdb) bt
> +  #0  mirror_wait_on_conflicts (self=0x0, s=<optimized out>, offset=<optimized out>, bytes=<optimized out>)
> +      at ../block/mirror.c:172
> +  #1  0x00005610c5d9d631 in mirror_run (job=0x5610c76a2c00, errp=<optimized out>) at ../block/mirror.c:491
> +  #2  0x00005610c5d58726 in job_co_entry (opaque=0x5610c76a2c00) at ../job.c:917
> +  #3  0x00005610c5f046c6 in coroutine_trampoline (i0=<optimized out>, i1=<optimized out>)
> +      at ../util/coroutine-ucontext.c:173
> +  #4  0x00007f0909975820 in ?? () at ../sysdeps/unix/sysv/linux/x86_64/__start_context.S:91
> +      from /usr/lib64/libc.so.6
> +
> +Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2001404
> +Fixes: d44dae1a7c ("block/mirror: fix active mirror dead-lock in mirror_wait_on_conflicts")
> +Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> +Message-Id: <20210910124533.288318-1-sgarzare@redhat.com>
> +Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> +Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> +
> +CVE: CVE-2021-4145
> +Upstream-Status: Backport [66fed30c9cd11854fc878a4eceb507e915d7c9cd]
> +
> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> +---
> + block/mirror.c | 25 ++++++++++++++++---------
> + 1 file changed, 16 insertions(+), 9 deletions(-)
> +
> +diff --git a/block/mirror.c b/block/mirror.c
> +index fab008568..ca0be146f 100644
> +--- a/block/mirror.c
> ++++ b/block/mirror.c
> +@@ -159,18 +159,25 @@ static void coroutine_fn mirror_wait_on_conflicts(MirrorOp *self,
> +             if (ranges_overlap(self_start_chunk, self_nb_chunks,
> +                                op_start_chunk, op_nb_chunks))
> +             {
> +-                /*
> +-                 * If the operation is already (indirectly) waiting for us, or
> +-                 * will wait for us as soon as it wakes up, then just go on
> +-                 * (instead of producing a deadlock in the former case).
> +-                 */
> +-                if (op->waiting_for_op) {
> +-                    continue;
> ++                if (self) {
> ++                    /*
> ++                     * If the operation is already (indirectly) waiting for us,
> ++                     * or will wait for us as soon as it wakes up, then just go
> ++                     * on (instead of producing a deadlock in the former case).
> ++                     */
> ++                    if (op->waiting_for_op) {
> ++                        continue;
> ++                    }
> ++
> ++                    self->waiting_for_op = op;
> +                 }
> +
> +-                self->waiting_for_op = op;
> +                 qemu_co_queue_wait(&op->waiting_requests, NULL);
> +-                self->waiting_for_op = NULL;
> ++
> ++                if (self) {
> ++                    self->waiting_for_op = NULL;
> ++                }
> ++
> +                 break;
> +             }
> +         }
> +--
> +2.33.0
> +
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166340): https://lists.openembedded.org/g/openembedded-core/message/166340
> Mute This Topic: https://lists.openembedded.org/mt/91462667/4422444
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [sakib.sajal@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

