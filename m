Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE198C6FA82
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 15:30:09 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
 [148.163.158.57])
 by mx.groups.io with SMTP id smtpd.web08.812.1663169402044659060
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 08:30:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=tbmH+KGI;
 spf=pass (domain: ni.com, ip: 148.163.158.57,
 mailfrom: prvs=6256703cc6=alex.stewart@ni.com)
Received: from pps.filterd (m0239463.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28E83gML012751;
	Wed, 14 Sep 2022 10:30:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com;
 h=message-id : date : to :
 cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version : subject; s=PPS11062020;
 bh=EnF4IWlEPH0K6n/S5ZigDT6x0uRTqwMwigUkEHSnkfs=;
 b=tbmH+KGILk8/0bCRYjb6RtY5AfFpF1CVPVdw40lzZzBuE40SMBwJ3dcArLeK0WoDWlTL
 338ju5dbWARbjtkU8duqYZcDaSWMsRKl0ACTXe4ENVbpjOIjwuctEzbNo+2mjAbkbf2j
 z9kc1w2JwIvnWS5+OypxRTjc1phSrjXyVFiW0nW9FfybePfAux7GWj3Q+zwyO4mufxc0
 sYgqsxkVfhf3Z4rcR5OH7DddcJF0sip+VGTQluSDVMQJw4bUTtl+dTu8DVcyeJWEoemc
 tb0UkaJ/TPB21NBBcGXsi1L4dFhMJCDnXjc0k/wQEdgqnsX1C5p88GOCKFJpWQeNHOxX 5A==
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0b-00010702.pphosted.com (PPS) with ESMTPS id 3jjya71v0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Sep 2022 10:30:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q8IPIDyqs7DErooK7Hi0moNPeNeT5ceAbE62vI8XxM34UDj+RRWYyNl6sKrNDdBvYLGvqGlkVxPjgd93y3CdgXeJdG7bqlDKvfwXz7xbayoLlHT8BcvE8lIxipOrbXn435dv2HbZ8Q0aWZDnSYIGWqe6vqSKa3u+Rdmzs6U+r5PmPq4VfxCc65m9KOx+1rzi6WMlH7V0K6/flJt458BYS66Mwj7fUP6AmbyDam0LarPIExV4RADYWvQnUnyxtTCTH9MUvERFJn9OaQqABx9y3zEOnZp5wmqY0W7F449ONXZ3F6kY2jQWZIusdHwy4b3PxIyLGpVoocTgeWERPLD3wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EnF4IWlEPH0K6n/S5ZigDT6x0uRTqwMwigUkEHSnkfs=;
 b=SkEcUqqoyfGCmsq0NiZrxnoRDwwWRfkv+ld6K2jKQGc8U+CSvpFit/hq60N+1HGlFyR3ad2HDRKAJc1st/Eq+XgxI4lWVcyA9f4KUq4wNGEiisgPOO3rKS+9zsUQCr+Q0k8lso73UlOo24Z9JMCSb8kBHwvUZEyBXNas9lZXRmwuLNEPLd4i2S1MqewIUE5o10JQen5Jw8aunoEe5SKq6NWFo7OThEi2BhPQ2jkYkpBT0BWMF079lOo4KLmavrwThvs1F35ABSI6pf1CdKz8PxiLIo/dM358Zp5RbLPoVzkcETFcemopx+b2RobdJgob2lYRwJCQSYbQqcVWqX35wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EnF4IWlEPH0K6n/S5ZigDT6x0uRTqwMwigUkEHSnkfs=;
 b=X5HL1uYUgj+ZTYhbearqWrwzM6EuYU2L53Enh4ALB5gEeDSuvqp4etAL44jYmjvDw7XRadHylYGqpAv2vj4yCCoe8cQGMAefB8/cpZHOQEpkKD7TL4cSDbF8wgf508npcsJmHZeCzr9RBgFuTgE/w1zcK8AWeTdeEn6VHt+L7Fo=
Received: from SN6PR04MB5151.namprd04.prod.outlook.com (2603:10b6:805:90::25)
 by BYAPR04MB4118.namprd04.prod.outlook.com (2603:10b6:a02:f7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.16; Wed, 14 Sep
 2022 15:29:58 +0000
Received: from SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::cdb:af23:81f5:620]) by SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::cdb:af23:81f5:620%6]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 15:29:58 +0000
Message-ID: <e8cb6729-07f0-5cd5-2e5a-31b48d02de68@ni.com>
Date: Wed, 14 Sep 2022 10:29:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
To: ecordonnier@snapchat.com, openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>,
        Alex Feinman <afeinman@snap.com>
References: <20220914095945.2046769-1-ecordonnier@snap.com>
Content-Language: en-US
From: Alex Stewart <alex.stewart@ni.com>
Organization: National Instruments Corp.
In-Reply-To: <20220914095945.2046769-1-ecordonnier@snap.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0014.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::23) To SN6PR04MB5151.namprd04.prod.outlook.com
 (2603:10b6:805:90::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB5151:EE_|BYAPR04MB4118:EE_
X-MS-Office365-Filtering-Correlation-Id: dcd46159-f6ed-41ca-de25-08da9665fb5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	M4hxcx8LH1cfVB4oWtdIWyC1kkRstXy2eGOUNRED4/MHpKVPlgRNaM/QI5cbmV4y92rzICxXz1tPwBvKlzVIHHL4nQeXudYRYvrh3Mo2JiVlZ5y6PLE8r6mf/DzmYmvOfsk9wJBPbMw8OFH6E3O0Qndpcwxxp/tFHvU1IqGbFSd18wcD+taR9hh14sKG8/RQwhgKrPz0hYL8d0gIpOGHHYo5JCcKEAfdTG3y3ZcfLZbpZp/Rj+JCbX16W0VYBK4O7b7xrwu318q8PAuIGEsBn1+hA0IRcAX6LPlgaJ9bfNrkrYuSKXulU+XLxc0keQoLnfY75WC5uqWfapFl0Uq7OtALKnbUVzvhK/FAcFpDTGWapIDISWBH0wD+0mO2WIwzfafN1498oSQisIrA/A4pD/bEoR+OARf5CZzhj1f42CKlsnl0ybHt/yGoEI2voKuyhQRa6P+yQphTkbqxRKn2/PdFQVN9VPNPi+pHdymRM/sMMvwBqJ8yR0+GtUkLFik3MIdfKoXQ1V+Ozrvqw7UFd1Hk0VjpQvbXr+/ePtw6Pc61cqdDzRxftde0+sq8pa1OVnkoXS4D+DP+POQllVxjjXQ/ozcMaOQVBI1PjZz6gGiVa8j1OtWHiywWhgC1c/kz3WLXVMBONNjvtVpYEE9OTUmf9O/QSUFmnfjqWFYWwmV/hEKIMkujSXsve2/ETp/C63+/piDiB2Te2pU7Hacc3aVp8DGoI8Y0KiUkj+2fJ2mNrUby/u+koA2BF/Pm5O8j/OL1PfI+0OhWgc2Rai7aIRjH8v0agmdKpi0mBwTOWH/CuoldsMQuOlzJweWLzFqrcAtuF8ltgKFDbcxYAkEPsw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB5151.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(39860400002)(366004)(396003)(376002)(136003)(451199015)(36916002)(31696002)(966005)(86362001)(31686004)(6666004)(6512007)(6506007)(53546011)(36756003)(186003)(8676002)(38100700002)(4326008)(2906002)(54906003)(66946007)(316002)(66556008)(6486002)(8936002)(478600001)(26005)(83380400001)(66476007)(5660300002)(41300700001)(2616005)(44832011)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S1BtajJHdi9HejR3ZTh2VEgyY1JoaDQvYWF0M2xHZXhtR1VzVURFMzNwbnZu?=
 =?utf-8?B?WEFISllpZW1rcFRhdmRYaExGTVF3ci8vVUpwZEpNYVU2cmtYaGVBRnVIK0VE?=
 =?utf-8?B?OGcvUlZ6VndaUG1OOGErQXZVNjZnWmZwTzdWVGZTd1d1T1g5RENVd2gveW1D?=
 =?utf-8?B?MXgwdDBHRk5QZWhnRDFnZ0N5c3dlbnY4ZUFpaWtlUXViOXloWmtWc0VBTDFm?=
 =?utf-8?B?b0lUZ0M0cE1uQm1WSDJzeU9uRm1OT05HWmtkOHYwZ01Ya1U4THZJV01JRnlD?=
 =?utf-8?B?NkloY2l4YVl1VmNEWHNrVWVIUjc0SFhndTlWVVcxZDdaU2dLMGJ5aENyU3Yv?=
 =?utf-8?B?Y1N4RkJJK2prKzlnKzVyelkvNzRzcjJNUVNuVnIxN3Q1YWcvbWQ2bWxPYkta?=
 =?utf-8?B?TDE5SkE0cjNxekU0a0Z0WUhDeTRnNHJxbmJNR2ZDWlIwek1BZTFnZEh6OHlP?=
 =?utf-8?B?bXh6eGp5dllJTDJFV3RvK3VJRzgxaTdXdlNwZUpVZ2c0UmdldkFqUitDZXh6?=
 =?utf-8?B?YkxhN3FRa0NUQ3NKeWovUVFLekVvOVl3dHR1NXpCdHovdkY3eDg2c1ZwUVRJ?=
 =?utf-8?B?dmxjTnoveFBIU1MzdUtNSmRTZ3JvdmRNZGpSNktlMjVLYlBxbkgySjRjN3RP?=
 =?utf-8?B?bjlVcVA0N3Q1V1AzSUpwUElPS0xCY1ZucngrZjRnQ1hkSmZwN2JxY2FoOVNa?=
 =?utf-8?B?VmlWZEZhcERZcUozbWFEOEowWW5PNDlZSUNnanZuZHk3WEZpeUpvVjBMVXJm?=
 =?utf-8?B?ZkpYOUVld1NoQkdncnRmNk54aXZzQXBvS0JMbklLOXJSbDRQbkNGNkpaUE0v?=
 =?utf-8?B?R3VLWHF2Mm5DZ3NscktjZnNncjVuNjh4eG9XS3FMdGw2dWFvcFJaQWlWUXo5?=
 =?utf-8?B?QzF2V3IwZTVENGtXTkNmOTNhSnFlM2V1SnBHV1lseVBRakxLWVhhYzNRMzFZ?=
 =?utf-8?B?UWZETDVwU3o2OHJCR0pweEZ6N2Y4ODBXY0JGRWhWMU9oSHJWNEtlaEFsQmEz?=
 =?utf-8?B?WVdhTEZXTEFaaHlEVlprMnZuVlZ3dHV3UXAvaG5uV2dKdGJRWG0rb2FvMUFP?=
 =?utf-8?B?Y2h3QzRCNGJyRCtRL3lUcDRaTzNpV0lVNU56amNrVWN0dGoraHJCNjFPTDRZ?=
 =?utf-8?B?aUN3NzZHb1huaEZZWmJZSDVFK2I1cVJYMDNkamR3amJsVnFJdmJQZmdIaC9u?=
 =?utf-8?B?UVo3bDJ2UUgzdXVrRHNHOUM5WmJRNS9OeHNTMFE0eXROeEtkMFdLRmJHclhs?=
 =?utf-8?B?RTBGZFpkeWRMUEMrSGdza0g4SFB1YytacTdrRXVZVWZaM2swenlBSkJEcGh3?=
 =?utf-8?B?VWVNSTdYYjRwT3hjSDdlYmwyWndzOVdHSDNaLzYrMzNOakROblRITlRnSjhS?=
 =?utf-8?B?YzByODhrYjhHQVhISi90K1p2QzBIL3Z6d1AzbFhqQnFkMFlWQldvdlBpUkZi?=
 =?utf-8?B?VjNDUHZNZXlhS0pDak80dERlUW9DVkx3UStBOTZZRW9nVWdkRDU3bmM4SFdG?=
 =?utf-8?B?VDJDcTNjK0h0dUxvUzlobHM5K29ub3R1VTgrcTNTak5yc214ZFZRS1dTSWRn?=
 =?utf-8?B?WDJNcmpUWmFOVVAxTHhadXMxdGE5UHdka2hYNmxxOUQwZWg2ekpKd1JEM0R3?=
 =?utf-8?B?TnlWVnV5cjF1bi9LcnRJRkZiVGVwRXUwZDc5bkk4QS81b3J1b251TEV6TFN5?=
 =?utf-8?B?TzhzYTlYYU85cmROQ2Y5MzczeUtBbDRFY2NmTWxFNFZiQTZhTWowUlc0aG5E?=
 =?utf-8?B?WFdOc21jeEdoby9hUDRJUkZMSWRNeGF1YWV0TThVUkhqb3lPY1RrUnNFdlZn?=
 =?utf-8?B?K2NRZHVUR0VGaGg0VDJoYkRqL1hHKzAxMkFVaytYNlQvWk5Ib3lEaXNmNzNE?=
 =?utf-8?B?MTBKTUlndDVpRTZLUU9rZ0JKSWdhaENQRWk3WmJobWo4anJobUZpdGRyOUxH?=
 =?utf-8?B?MmdrUHI0OCtyMXVlZmpWYjhuenpLaU9VUURVK0J4eFBZS3NlTmNHVDFtVHZ3?=
 =?utf-8?B?WVZmUlB5ZnVxRXJrOStpczdLRzNBeVFhSWJTOWhIdTl6ZU5Sc3RqanFEa1VH?=
 =?utf-8?B?Vkl1Vmg5UDZzaWI2VXVxU3lGeEZuTFNFZFYxRnJMRmVzTGNMQUlKOCs5Wkdu?=
 =?utf-8?Q?3aVfZhgOayyEY3JXvOQ1a9URj?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 dcd46159-f6ed-41ca-de25-08da9665fb5d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB5151.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 15:29:58.1005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 XB8p+QvBGa5LskAiFXF1OL9isSGJNTpYnkqZzt8V7aWjw38LFu5uCzBkZIYgGjh4ZMgEorVC2SIKKw/RtqptoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4118
X-Proofpoint-ORIG-GUID: bZY3jPKkQFb_NZteEfcVSugqhwf7IXUe
X-Proofpoint-GUID: bZY3jPKkQFb_NZteEfcVSugqhwf7IXUe
Subject: Re: [OE-core] [PATCH v2] opkg: add option for zstd support
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-14_06,2022-09-14_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
 score=30 clxscore=1015
 adultscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 mlxlogscore=714
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=30 reason=mlx scancount=1
 engine=8.12.0-2208220000 definitions=main-2209140075
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 15:30:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170663

ACK from me.

On 9/14/22 04:59, Etienne Cordonnier via lists.openembedded.org wrote:
> This allows the use of zstd for opkg packages by using OPKGBUILDCMD:
> OPKGBUILDCMD = "opkg-build -Z zstd"
>
> Signed-off-by: Alex Feinman <afeinman@snap.com>
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> ---
>   meta/recipes-devtools/opkg/opkg_0.6.0.bb | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/opkg/opkg_0.6.0.bb b/meta/recipes-devtools/opkg/opkg_0.6.0.bb
> index 7b351e8123..4cd589cd29 100644
> --- a/meta/recipes-devtools/opkg/opkg_0.6.0.bb
> +++ b/meta/recipes-devtools/opkg/opkg_0.6.0.bb
> @@ -39,6 +39,7 @@ PACKAGECONFIG[gpg] = "--enable-gpg,--disable-gpg,\
>   PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl"
>   PACKAGECONFIG[ssl-curl] = "--enable-ssl-curl,--disable-ssl-curl,curl openssl"
>   PACKAGECONFIG[sha256] = "--enable-sha256,--disable-sha256"
> +PACKAGECONFIG[zstd] = "--enable-zstd,--disable-zstd,zstd"
>   PACKAGECONFIG[libsolv] = "--with-libsolv,--without-libsolv,libsolv"
>   
>   EXTRA_OECONF:class-native = "--localstatedir=/${@os.path.relpath('${localstatedir}', '${STAGING_DIR_NATIVE}')} --sysconfdir=/${@os.path.relpath('${sysconfdir}', '${STAGING_DIR_NATIVE}')}"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170651): https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-core/message/170651__;!!FbZ0ZwI3Qg!s3ge2JNZe1G9vmQ-fsPaqWDO_Q31zeo7xvWaZyozqBUutvc_pqEPJh9YF4LJ284aTwx9LfkjOxEp2dzr_MM3cnXkAnz9-fO-i2Da$
> Mute This Topic: https://urldefense.com/v3/__https://lists.openembedded.org/mt/93674358/3616788__;!!FbZ0ZwI3Qg!s3ge2JNZe1G9vmQ-fsPaqWDO_Q31zeo7xvWaZyozqBUutvc_pqEPJh9YF4LJ284aTwx9LfkjOxEp2dzr_MM3cnXkAnz9-WZqAqb8$
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-core/unsub__;!!FbZ0ZwI3Qg!s3ge2JNZe1G9vmQ-fsPaqWDO_Q31zeo7xvWaZyozqBUutvc_pqEPJh9YF4LJ284aTwx9LfkjOxEp2dzr_MM3cnXkAnz9-a4JRFlg$   [alex.stewart@ni.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
Alex Stewart
Software Engineer - NI Real-Time OS
NI (National Instruments)

alex.stewart@ni.com


