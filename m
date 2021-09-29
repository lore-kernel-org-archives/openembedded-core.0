Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73B6BC433EF
	for <webhook@archiver.kernel.org>; Wed, 29 Sep 2021 03:31:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.4199.1632886266881107469
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Sep 2021 20:31:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=nB/BvibB;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=5906dcf99d=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18T3TFKh026357
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Sep 2021 03:31:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=MHzDeP/n99BMtmSP2vrw4uldji+aJTdEQnqEtpLTPlE=;
 b=nB/BvibBo5Axa7hh/TxlX/vFNbHdN51qxpwIrpu2WWpq/Zy2WmJbvxpZsAd6GIoISlNd
 SLxWG2k1Xjxffyzq5i9T8ZbBWr99BPT0fiwRs4eTAeeddLgoPK6fCBR3aXYso2XvamVi
 6+EyYG54XV5W1IhzBPmrioTWTC2pJjqbnqic/U3hFKhdq+6CbcEPaPKUoghZO9LflO5G
 XbaoINXg7RGncTSQSC2u/ztSMj0IraFCsQW73E939Jk+LS84YASf6MzBQJLUA38QIDNt
 t06ljy+0uGfiNfPDlRlTUs1dgGld46SxENjCfB9GUDFQ5sU8Ai/BkyT6xkjj8kRJlRka HQ==
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bc0qfrvfr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Sep 2021 03:30:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nuwAKg3grxTG7CU5kBmf8dWxprARqu2sf8bgYxIt/Q/dmR9TzapNqoMq0X4bZS0kojpFsNLdp4jGHtlyvV0KLZj+05iQsZxBePx7y+ATw0yRs5qUH98jMe/WFR1NhnBPsWORJXL1rbyIjVG8qIUXXDFxC2gmvD9Ki3ArNjFOdkdg17rSezlBB7fCQqwsumskk0aMzxeYTzIVmlZEuaSbDquTvTxlN5GzpNqD9buWOgaJEQwcKmyTuD6J4i8uq1fJ7Cx8JzVBwkBD0ES2k08sEIlfsvWFDUhnENJyK6fUJEWpuySz1eEQggqa2yMJX0uMcWwcU/MaqzJXcRHoGg+CsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=MHzDeP/n99BMtmSP2vrw4uldji+aJTdEQnqEtpLTPlE=;
 b=BHlUrvhszh0vbChDbzjTOVRO3WmOXv6Cf5T6BBxyfxlT0tGJiarigN4kPq9fVXpUNawWdXadSebpivrZ/3wuD3J6oxu4iW+vY6qU8DOsbnuCiEKsw8TVJcwch4Q2eC7AK2R6HDTSToUJeqmt2Voq+iSWOn9na/LiVvK8wSM85qTOi652yWbGdp2GmicnOxjv9Cg5EXWw0EkkOsVg1wWrGlofd+k2mdSgdHuxP/4ohyPfFCTwLMX1tKYyCsOey/wfriDx9CYRrToocwSTXHUdBroSmpoZ3GwhCdTCJG3ptT1hpPHkpSivlaqLNJrHyvdtniEpAouqVkihAJUD0Cw7UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CO6PR11MB5636.namprd11.prod.outlook.com (2603:10b6:5:357::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Wed, 29 Sep
 2021 03:30:54 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7d7e:52e7:5527:d2c9]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7d7e:52e7:5527:d2c9%3]) with mapi id 15.20.4566.014; Wed, 29 Sep 2021
 03:30:54 +0000
Subject: Re: [OE-core][PATCH] systemd: fix CVE-2021-33910
To: openembedded-core@lists.openembedded.org
References: <16A92D4CE6134AD1.7073@lists.openembedded.org>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <4893fd35-de31-039c-577b-117d2d1d2c4b@windriver.com>
Date: Wed, 29 Sep 2021 11:43:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <16A92D4CE6134AD1.7073@lists.openembedded.org>
Content-Type: multipart/alternative;
 boundary="------------6AC3431435C97C206895F4C1"
X-ClientProxiedBy: HK2PR04CA0060.apcprd04.prod.outlook.com
 (2603:1096:202:14::28) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
Received: from [128.224.162.141] (60.247.85.82) by
 HK2PR04CA0060.apcprd04.prod.outlook.com (2603:1096:202:14::28) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.4566.14 via Frontend
 Transport; Wed, 29 Sep 2021 03:30:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88e264e5-6b90-4bf7-a0a0-08d982f98ae4
X-MS-TrafficTypeDiagnostic: CO6PR11MB5636:
X-Microsoft-Antispam-PRVS: 
	<CO6PR11MB56367980882834A58CCC78F9EDA99@CO6PR11MB5636.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:127;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4V1BDSimgPjs4uK0if4Fc6tTGhucrS4JTU3uYaCZ3bEW42ZvETXRHJ0G11q5vhLMQPIAYlr71OsfSVKKZL5XxBAxiRoCDhFJ+sy/BA969gTncfZlsVfM04o5qYcdnfVjuiKweYsvz5TsxVoMPn6UHR3i/5OgdnRwVRpnk7s5hXXYXHWMI6yGdBSivvFiQ3Xe0aUNDupRSX104QGGWDkBPgcEGl0PzI9G06JOQTmRBZXuGfV7Ptb1J0980fsKisZqskYGj9yifAYVXe7UoS+hiPWJDAhqR3g2lLJuC89QIpve4zW3twYVMQp5mkXFteho2CcoqkQ3bxFHIdN/H5a9CeqAw8jBdMf478RYnCmu4ES8HEwKKhfFv3PxEXY9YmfM1Q1lpK2NMsVqyXl9e2q7Aoz1lt3frb1AhIcGyuayuPxFcAqEHLtm+IF8ySfkphUggoIemYH7Zz+Yi9ScHNL8ydp1zH+d6FkTFTFnw8eExATG4Kr2T40vfkgPnndsxNiATOaQyvP4Vz6KmoLNhbADlhepdk9TQ81Wb2hr/4sLx81a0HxH9DpjBZ7yWs74y81/xcDhO6WOuz69qg/ldnjcukU+nkHfRUhxZPQYQTICx1T3BhFBfCX7K82F3r8qbio4/3lX90hupsuAohx75q3gZBWuQa6EyTDENYmsK3A1aQp7vxB8ou81BDIalP3/t1LicrShRZ+Zv50An0ph+fMNN5fMNRJoO2bvumcka3u1W4E5K2HqZa6xR3ffGc9VAQeaAveYDJn3MQKGCkr9jhPg+vFjh/NUWyaxBsLvYFrVRjiHDlDfsVp10xO6JHnQXIdiZ8qZqCgqXZfjmNue/k7YiGAeD0KnYXnP/cmxIvPl3V80GE7CiIqdVYB+LaNywb82dBlHqtXMt4BAkmeHjmdRivY72rI2cbePfrZNtGLjXW8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(166002)(31696002)(5660300002)(956004)(6486002)(508600001)(36756003)(2616005)(38100700002)(33964004)(53546011)(316002)(16576012)(66946007)(38350700002)(83380400001)(6916009)(86362001)(2906002)(52116002)(966005)(6706004)(8936002)(6666004)(26005)(8676002)(186003)(66556008)(66476007)(31686004)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R3RoYzZTMVQ2bjh6MVpQakE4anZOU2FOUUJxdGtsdld2TXJKM1RKRUpDUGYz?=
 =?utf-8?B?T0lZdlZad2RmVlBPSGNPZ25RRDVMc1p6SXFjcTFDaDAwUHZHL1NpNWpPU0xk?=
 =?utf-8?B?UWx1QmRLODQrWm52ditlbS81b3RJWXFLT3BJMDFiOU5hOUdsQmprcTFqOUtF?=
 =?utf-8?B?V1FhMi9MUHNOVFo1NXVCRk50bGlCcFBXN0Z6Z252cVZoVVhUUTJxR2lMSkpK?=
 =?utf-8?B?RGxaVUUvekNkRGRPZExPNnhQeG91NDNHMGgrUk1FZ2FFTmpUUVdJZ2ZIUFlv?=
 =?utf-8?B?WVJwK2NibmI0cWdlemdkMm96ZFYzT2dsVlBrdlRqdzdxaFFCTkFyR09oSnox?=
 =?utf-8?B?TzdSUDVWZmN3MS83QUNWNENpYndNM1huVnA0cmwzZGZYMVE2bkJlSGljSTQy?=
 =?utf-8?B?SXNVUmdsR010a09QbVFPV3p2UjNtZHZhcm9DUkc0d1NvWnVlTWxoWU9jbFFM?=
 =?utf-8?B?VXFTOWJkOWtpdjFTVEpWaW41NDUwZkZ6ZkpxOGhnWXlZZVNVWEtUK20rYUpo?=
 =?utf-8?B?Z2dsN25GbXRCdmpFaEp2NHd2TmdNSWorZk5OTGtJUk5HcFJ5NVJkRVBKSmlC?=
 =?utf-8?B?cDJ4dFZJaG82VEJYVC84QlJXTmpmRGNhTThYZTZQdTd1UGlxV1lURm94a0Y5?=
 =?utf-8?B?Ui9IbWZ2N1c4RVRBYSt0bWdFckh3ODQxU3FWQm9wQlVSMUtKb0ppMFJ3aVYv?=
 =?utf-8?B?Y2FGWUJXVFc4TURzUUVWRHFHcFNITG1Qb290cUtyYmJjU1EwV2tTMW5sYnZi?=
 =?utf-8?B?T3FKN25rbkZuRUh6YWhuYzlzWXV4N0NnV2xvaGFnVlV4RS84aSszSDlvT1B4?=
 =?utf-8?B?Mk56SGhWajBQU0FRNUFFL3dBTU85Uk4zWUQ4cFhNTFBGSHpRL2hObFdIQjBE?=
 =?utf-8?B?c084OGtmUzJzZHVib21PRXgxTGVoTThKYnF3Wm5CYVZiWVZzM2EzWnpPMmFo?=
 =?utf-8?B?ek5Uajc1d25HQkl5Q1BUc3FVbVZjM1U3U3M4VngvWVJSUWp0RVNWaGJZbCs3?=
 =?utf-8?B?eU9mRG9QejBLbCtJbUJpeWhBdjZ6bnZCVUdaeTZGVWwrVXVOMWhreWk3bERR?=
 =?utf-8?B?MHhkaWdGQ2hDN0o4QkNBR2lVRkxrclFQdzlkYzhXaWJVUVVnZW4rcDlSQld5?=
 =?utf-8?B?TWcxSjgyeEZZWEw2Nmd3WUZpWDA2SHRtcE9vSElyQ0lnQUZQWUh6Zk5ZQnFm?=
 =?utf-8?B?ZFBDd0I2Qnd6UXBXZ01nelluc0I0TDJXUm90cHM5eG53L0NvZ2NrbDJUWXJT?=
 =?utf-8?B?R0tOTURJbjBLdjhVK0lsVjZtbE5KaGZuVE9SYnZTcVBiTDR6TUpWSXg0ZGdO?=
 =?utf-8?B?d29PTnZBeDJhV3dORlFkS1RYYlllSE4wdENwUWh1QllGV2NoUE5rUWt1L3Jk?=
 =?utf-8?B?ckpXWDk1WnRITyt0ZTZnUmJUUVY5ZWZQUncyQzJwN2k2RFg0dGUwVXV1N2s2?=
 =?utf-8?B?UHdvdkMvOFNleS9VTCt4SHFXVDB5cG4waHAzbjg3UWhQbktvQmNYWnQwTllm?=
 =?utf-8?B?dFhuYnhlNEZTRjRkWW5GdjM3cTVsVlZzbDZFWUJOZjNadG9WUWF3QnZKWmhl?=
 =?utf-8?B?aDdpekQ2Ly9wY2k1L0ZoRitZem40K0Y0MDN0VGRKVHZUL3RMZHRGTTRVeTRi?=
 =?utf-8?B?WlEzckwvZWtTejhtOTFvUGtIUWtiVmovdFFjSVg4QlZ6b2dJbGg1aVZ2QWNE?=
 =?utf-8?B?QW5CaFdNTjNTZnQvTUVHWk5BQm94WjF4ME0yVk53WEtoM2hhTGZIN1ljNGdN?=
 =?utf-8?Q?L0eapI2mdi59AMVXFRcfBP7yauLB9O2S2gy00iU?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 88e264e5-6b90-4bf7-a0a0-08d982f98ae4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 03:30:54.1956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ElOEc91XA41WeB0Uvt/dNi3XkkSzpzR1Ej4peei+KeHF8IbYtRWJtR/w1B4c1NQWUHaFocHKOkEj984/ltQ8DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5636
X-Proofpoint-GUID: zdbXqOBRl7Q38xH-LCvJ6APQjsVmJWZl
X-Proofpoint-ORIG-GUID: zdbXqOBRl7Q38xH-LCvJ6APQjsVmJWZl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-29_01,2021-09-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 mlxlogscore=877 adultscore=0 mlxscore=0 malwarescore=0 phishscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109290019
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Sep 2021 03:31:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156440

--------------6AC3431435C97C206895F4C1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Please ignore this one, this patch is for hardknott.

On 09/29/2021 11:29 AM, Chen Qi wrote:
> Backport patch to fix CVE-2021-33910.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   ...it-name-do-not-use-strdupa-on-a-path.patch | 72 +++++++++++++++++++
>   meta/recipes-core/systemd/systemd_247.6.bb    |  1 +
>   2 files changed, 73 insertions(+)
>   create mode 100644 meta/recipes-core/systemd/systemd/0001-basic-unit-name-do-not-use-strdupa-on-a-path.patch
>
> diff --git a/meta/recipes-core/systemd/systemd/0001-basic-unit-name-do-not-use-strdupa-on-a-path.patch b/meta/recipes-core/systemd/systemd/0001-basic-unit-name-do-not-use-strdupa-on-a-path.patch
> new file mode 100644
> index 0000000000..0ab8174441
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0001-basic-unit-name-do-not-use-strdupa-on-a-path.patch
> @@ -0,0 +1,72 @@
> +From b00674347337b7531c92fdb65590ab253bb57538 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
> +Date: Wed, 23 Jun 2021 11:46:41 +0200
> +Subject: [PATCH] basic/unit-name: do not use strdupa() on a path
> +
> +The path may have unbounded length, for example through a fuse mount.
> +
> +CVE-2021-33910: attacked controlled alloca() leads to crash in systemd and
> +ultimately a kernel panic. Systemd parses the content of /proc/self/mountinfo
> +and each mountpoint is passed to mount_setup_unit(), which calls
> +unit_name_path_escape() underneath. A local attacker who is able to mount a
> +filesystem with a very long path can crash systemd and the whole system.
> +
> +https://bugzilla.redhat.com/show_bug.cgi?id=1970887
> +
> +The resulting string length is bounded by UNIT_NAME_MAX, which is 256. But we
> +can't easily check the length after simplification before doing the
> +simplification, which in turns uses a copy of the string we can write to.
> +So we can't reject paths that are too long before doing the duplication.
> +Hence the most obvious solution is to switch back to strdup(), as before
> +7410616cd9dbbec97cf98d75324da5cda2b2f7a2.
> +
> +(cherry picked from commit 441e0115646d54f080e5c3bb0ba477c892861ab9)
> +(cherry picked from commit 764b74113e36ac5219a4b82a05f311b5a92136ce)
> +(cherry picked from commit 4a1c5f34bd3e1daed4490e9d97918e504d19733b)
> +
> +CVE: CVE-2021-33910
> +Upstream-Status: Backport [b00674347337b7531c92fdb65590ab253bb57538]
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + src/basic/unit-name.c | 13 +++++--------
> + 1 file changed, 5 insertions(+), 8 deletions(-)
> +
> +diff --git a/src/basic/unit-name.c b/src/basic/unit-name.c
> +index 5f595af944..9b6cacde87 100644
> +--- a/src/basic/unit-name.c
> ++++ b/src/basic/unit-name.c
> +@@ -378,12 +378,13 @@ int unit_name_unescape(const char *f, char **ret) {
> + }
> +
> + int unit_name_path_escape(const char *f, char **ret) {
> +-        char *p, *s;
> ++        _cleanup_free_ char *p = NULL;
> ++        char *s;
> +
> +         assert(f);
> +         assert(ret);
> +
> +-        p = strdupa(f);
> ++        p = strdup(f);
> +         if (!p)
> +                 return -ENOMEM;
> +
> +@@ -395,13 +396,9 @@ int unit_name_path_escape(const char *f, char **ret) {
> +                 if (!path_is_normalized(p))
> +                         return -EINVAL;
> +
> +-                /* Truncate trailing slashes */
> ++                /* Truncate trailing slashes and skip leading slashes */
> +                 delete_trailing_chars(p, "/");
> +-
> +-                /* Truncate leading slashes */
> +-                p = skip_leading_chars(p, "/");
> +-
> +-                s = unit_name_escape(p);
> ++                s = unit_name_escape(skip_leading_chars(p, "/"));
> +         }
> +         if (!s)
> +                 return -ENOMEM;
> +--
> +2.33.0
> +
> diff --git a/meta/recipes-core/systemd/systemd_247.6.bb b/meta/recipes-core/systemd/systemd_247.6.bb
> index eb31dabca0..571a1efe8b 100644
> --- a/meta/recipes-core/systemd/systemd_247.6.bb
> +++ b/meta/recipes-core/systemd/systemd_247.6.bb
> @@ -31,6 +31,7 @@ SRC_URI += "file://touchscreen.rules \
>              file://0002-sd-dhcp-client-shorten-code-a-bit.patch \
>              file://0003-sd-dhcp-client-logs-when-dhcp-client-unexpectedly-ga.patch \
>              file://0004-sd-dhcp-client-tentatively-ignore-FORCERENEW-command.patch \
> +           file://0001-basic-unit-name-do-not-use-strdupa-on-a-path.patch \
>              "
>   
>   # patches needed by musl
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156438): https://lists.openembedded.org/g/openembedded-core/message/156438
> Mute This Topic: https://lists.openembedded.org/mt/85941233/3618072
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


--------------6AC3431435C97C206895F4C1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">Please ignore this one, this patch is
      for hardknott.<br>
      <br>
      On 09/29/2021 11:29 AM, Chen Qi wrote:<br>
    </div>
    <blockquote cite="mid:16A92D4CE6134AD1.7073@lists.openembedded.org" type="cite">
      <pre wrap="">Backport patch to fix CVE-2021-33910.

Signed-off-by: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
---
 ...it-name-do-not-use-strdupa-on-a-path.patch | 72 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_247.6.bb    |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-basic-unit-name-do-not-use-strdupa-on-a-path.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-basic-unit-name-do-not-use-strdupa-on-a-path.patch b/meta/recipes-core/systemd/systemd/0001-basic-unit-name-do-not-use-strdupa-on-a-path.patch
new file mode 100644
index 0000000000..0ab8174441
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-basic-unit-name-do-not-use-strdupa-on-a-path.patch
@@ -0,0 +1,72 @@
+From b00674347337b7531c92fdb65590ab253bb57538 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <a class="moz-txt-link-rfc2396E" href="mailto:zbyszek@in.waw.pl">&lt;zbyszek@in.waw.pl&gt;</a>
+Date: Wed, 23 Jun 2021 11:46:41 +0200
+Subject: [PATCH] basic/unit-name: do not use strdupa() on a path
+
+The path may have unbounded length, for example through a fuse mount.
+
+CVE-2021-33910: attacked controlled alloca() leads to crash in systemd and
+ultimately a kernel panic. Systemd parses the content of /proc/self/mountinfo
+and each mountpoint is passed to mount_setup_unit(), which calls
+unit_name_path_escape() underneath. A local attacker who is able to mount a
+filesystem with a very long path can crash systemd and the whole system.
+
+https://bugzilla.redhat.com/show_bug.cgi?id=1970887
+
+The resulting string length is bounded by UNIT_NAME_MAX, which is 256. But we
+can't easily check the length after simplification before doing the
+simplification, which in turns uses a copy of the string we can write to.
+So we can't reject paths that are too long before doing the duplication.
+Hence the most obvious solution is to switch back to strdup(), as before
+7410616cd9dbbec97cf98d75324da5cda2b2f7a2.
+
+(cherry picked from commit 441e0115646d54f080e5c3bb0ba477c892861ab9)
+(cherry picked from commit 764b74113e36ac5219a4b82a05f311b5a92136ce)
+(cherry picked from commit 4a1c5f34bd3e1daed4490e9d97918e504d19733b)
+
+CVE: CVE-2021-33910
+Upstream-Status: Backport [b00674347337b7531c92fdb65590ab253bb57538]
+Signed-off-by: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
+---
+ src/basic/unit-name.c | 13 +++++--------
+ 1 file changed, 5 insertions(+), 8 deletions(-)
+
+diff --git a/src/basic/unit-name.c b/src/basic/unit-name.c
+index 5f595af944..9b6cacde87 100644
+--- a/src/basic/unit-name.c
++++ b/src/basic/unit-name.c
+@@ -378,12 +378,13 @@ int unit_name_unescape(const char *f, char **ret) {
+ }
+ 
+ int unit_name_path_escape(const char *f, char **ret) {
+-        char *p, *s;
++        _cleanup_free_ char *p = NULL;
++        char *s;
+ 
+         assert(f);
+         assert(ret);
+ 
+-        p = strdupa(f);
++        p = strdup(f);
+         if (!p)
+                 return -ENOMEM;
+ 
+@@ -395,13 +396,9 @@ int unit_name_path_escape(const char *f, char **ret) {
+                 if (!path_is_normalized(p))
+                         return -EINVAL;
+ 
+-                /* Truncate trailing slashes */
++                /* Truncate trailing slashes and skip leading slashes */
+                 delete_trailing_chars(p, &quot;/&quot;);
+-
+-                /* Truncate leading slashes */
+-                p = skip_leading_chars(p, &quot;/&quot;);
+-
+-                s = unit_name_escape(p);
++                s = unit_name_escape(skip_leading_chars(p, &quot;/&quot;));
+         }
+         if (!s)
+                 return -ENOMEM;
+-- 
+2.33.0
+
diff --git a/meta/recipes-core/systemd/systemd_247.6.bb b/meta/recipes-core/systemd/systemd_247.6.bb
index eb31dabca0..571a1efe8b 100644
--- a/meta/recipes-core/systemd/systemd_247.6.bb
+++ b/meta/recipes-core/systemd/systemd_247.6.bb
@@ -31,6 +31,7 @@ SRC_URI += <a class="moz-txt-link-rfc2396E" href="file://touchscreen.rules\file://0002-sd-dhcp-client-shorten-code-a-bit.patch\file://0003-sd-dhcp-client-logs-when-dhcp-client-unexpectedly-ga.patch\file://0004-sd-dhcp-client-tentatively-ignore-FORCERENEW-command.patch\+file://0001-basic-unit-name-do-not-use-strdupa-on-a-path.patch\">&quot;file://touchscreen.rules \
            file://0002-sd-dhcp-client-shorten-code-a-bit.patch \
            file://0003-sd-dhcp-client-logs-when-dhcp-client-unexpectedly-ga.patch \
            file://0004-sd-dhcp-client-tentatively-ignore-FORCERENEW-command.patch \
+           file://0001-basic-unit-name-do-not-use-strdupa-on-a-path.patch \
            &quot;</a>
 
 # patches needed by musl
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#156438): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/156438">https://lists.openembedded.org/g/openembedded-core/message/156438</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/85941233/3618072">https://lists.openembedded.org/mt/85941233/3618072</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------6AC3431435C97C206895F4C1--

