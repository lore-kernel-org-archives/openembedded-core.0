Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72363E6ADCB
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 23:02:09 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.59])
 by mx.groups.io with SMTP id smtpd.web10.37423.1732316520676605277
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 15:02:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=jIk42Rq4;
 spf=pass (domain: prevas.dk, ip: 40.107.20.59, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nOI7FrDdE8iQPswhvuVBh0a8a/FYIvzVdyyuSQ0UqCxTePnsrKgvYZoF+cpbPcdd4KD3ITO33+DGRTHZ0/klBtOrbz948krZBlojhB3LiRAMQaWVDVyVS+FryqvX1LfPoUOddBGqCmhjMJlGRUUE5EXU4g0yUOjXcV6S0ixp5PejSkXlIZaQXUlX7x1NCqGmAG3C+TZ6Y108eYe0rr3YHw/IDvTkimNCVFmZH3d4bnqYgvPQoMyPLaMrHdVMgod5qe2OBfBhMKNbLbUVUZ3fzUyvALcWqi9oJnk/vXv50QbrNHrRaL91z/3Gj+X9aNFyq41L24j3rRrLkjpKJXNGJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WMvEDftDX9dW86/i1Y8Xxx8pnNyp7kgmM5odDltSp+4=;
 b=lk4hMUufJf0uOLWANmRtGfXJ15Q6V1LqEpKuwACLzl72RJ6g8sHSG7I1fKhQbYea+N9VYPZQ95VzSkTGvGl8eyfgt+DUFY2digiceYdDiWpfOIjd/wnDMuZMKne3EplJ11MXpfIVLegJQic963u/4HoNRC1K1w/guEQJrfgn2geA7sF8kttU3XSqu8nykecqAZtlhxrCDwW5X4D0iXjIfr0ebiyDgD2GgD8qlbr6MRW2j7h2mMOwpaZETSfX/J2JE5NttMYGJtrBFZWmsjBJT2aI5udemnHyjSYTDAhnFmthfRRwJxypHyRpIq2mATXFMBUzmmhf4YrHkJbK2pyjeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WMvEDftDX9dW86/i1Y8Xxx8pnNyp7kgmM5odDltSp+4=;
 b=jIk42Rq4kinCA5uCwdE//PiiTBkPDTxidtZ6LTw3atpPnrDokMj/DWqlC9AIoylMPfsRLhVVDpIwVS/xdItmv1B4bBBazxDy1hDxMuglfXD2CY3j5WHFV28S13QhPoT2nEqFL+9keZMsANcfsSmaDBUPfBVxaBobMkJBuHbcN8I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from VI1PR10MB2477.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:87::20)
 by PAVPR10MB7489.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2f4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Fri, 22 Nov
 2024 23:01:56 +0000
Received: from VI1PR10MB2477.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4e8:da5:4265:ce59]) by VI1PR10MB2477.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::4e8:da5:4265:ce59%4]) with mapi id 15.20.8182.018; Fri, 22 Nov 2024
 23:01:56 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,  Richard Purdie
 <richard.purdie@linuxfoundation.org>,  Changqing Li
 <changqing.li@windriver.com>,  "emkan@prevas.dk" <emkan@prevas.dk>
Subject: Re: [OE-core] [PATCH] bitbake.conf: set FILESYSTEM_PERMS_TABLES
 using ??=
In-Reply-To: <DB5PR02MB10213FC6844484ED59B5806EDEF232@DB5PR02MB10213.eurprd02.prod.outlook.com>
	(Peter Kjellerstedt's message of "Fri, 22 Nov 2024 19:01:59 +0000")
References: <20241121090847.608522-1-ravi@prevas.dk>
	<DB5PR02MB10213FC6844484ED59B5806EDEF232@DB5PR02MB10213.eurprd02.prod.outlook.com>
Date: Sat, 23 Nov 2024 00:02:03 +0100
Message-ID: <87ttbykh3o.fsf@prevas.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0049.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:b::10) To VI1PR10MB2477.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:87::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR10MB2477:EE_|PAVPR10MB7489:EE_
X-MS-Office365-Filtering-Correlation-Id: f858ab99-8178-4c5e-57ae-08dd0b49a94f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?6M3Fu4I8KseucIDmlmK64Be+tI+J8W+OOqKfFMQQyPZ9Dm6UOie9Sw44X1t3?=
 =?us-ascii?Q?o+fwb8GgOIZfFCa9UB8cex0TrJg7pXKSWiJGPCZtpB2tWsBRqyilSCtfkzUp?=
 =?us-ascii?Q?4NgRiubX0hvMTUQGF8d8pKVjbq1eDH3MKSa+Ee96ukaJaZz1CUdI3xTmXb15?=
 =?us-ascii?Q?DlCp3SVhoNVXn+XD/tYre6mMzuPoXYASdw1YKQsCvMPyASmuISUMGHV7zULf?=
 =?us-ascii?Q?9YBefnXYQ6Sq4hgpHJohiWLa0JnrIBp2RsPzhKvTiKjqLisMMAZzKcg1xeWv?=
 =?us-ascii?Q?FiWYIFR74CyyQy/PYbW9vjRDp153tyFrDgnnx3se7f9crckhBWXyBIwEOkoA?=
 =?us-ascii?Q?fmjC9r9ZZgKR/As2GmKJVwElBLJQyQWzwZ0bY5a6AOtbr6FTnnoxoJaPyRpm?=
 =?us-ascii?Q?6tgbmBNM4JaXlvQhDuWuw8ur+rDRTrIMHeS1eQp4VSsBKPonbMYgE9/2RsMu?=
 =?us-ascii?Q?DC3WQI8T+mHrA8J8u+K7JeTMtwoH8s9VteWcN7FfVF8CMmAceezIF/qOuBqS?=
 =?us-ascii?Q?Ho8ydAL+4MaSRGUjTcRO+EfH/znA3SbWwb4HZ226i1YyhYqi1waE+bhxLLWx?=
 =?us-ascii?Q?RhnH3v7doNSsdzC5K1UPuBMYqwNS+EB3s15Ku1dEPqOiCrpGhm2omsTC0TYd?=
 =?us-ascii?Q?ht7mqQsAvKGtPBQfDq34rAiOmrtCKfHilLNaBPNvfU1+niHDOthLogXFeH93?=
 =?us-ascii?Q?8ufvAspy2oegn4virahnngIRZAdSc1qlMr+OV6OzdRz02Uy4+qnKho5OCXH+?=
 =?us-ascii?Q?Ty873WoKrFDuTWZNWQxhOtvFdVC8yRg9EGYtVGN85z+J5VH3UEMsU4IAA8b5?=
 =?us-ascii?Q?NjTNhTXchHfVOCK8rzN65p6J/rmTmzgmgt/5hhGCy4INH+mxMQmqiibK05Y8?=
 =?us-ascii?Q?FZFhzDwmx3pt2zb0EtfpEcA6Ypsps4zqHRHlrecSdqX27KwlnBbe2JW7QIuy?=
 =?us-ascii?Q?mCPcLV6s3sJaXdkFxbtdriqfMcb01394ghvd/Z7TPaHqp01wygb7WW693IC2?=
 =?us-ascii?Q?eZ8L8G29wB+/A5ygne9DMi/qZaxMzESt1ppni8bkGN3FN1+RM/3fzFEHSRyr?=
 =?us-ascii?Q?cV+yqStnv3PK9vtMJsyIPzOrUVOsZ/JG/wHCUH/8BUXRpZDYzGJSRUmF+cwT?=
 =?us-ascii?Q?aT+Bjt6XvAfUT4DKA8jaU6W9p1695Bro9tkM+HuCUZrskrOjYu0Wv6Fc6gE+?=
 =?us-ascii?Q?/Td3ETz67exFJtK6QjNMqdmbgJOoZTfaJzewsHRzHidKcr7fg9DW2+G6faOj?=
 =?us-ascii?Q?5ZRxIX/qBftIvqfOlmg0PdKT1wLp7ZqNR3g/gCGOPOyIqPwmQDeIwg7cj79Y?=
 =?us-ascii?Q?HQ7L0Fyoo5cjQR7W923sL7cjotMIxmtHiVC8WQeMTZ+C4BJdpMKtLjrFaaQ+?=
 =?us-ascii?Q?B8ZuWKmF/LKJXdJc4vn39eYGgZrv5NrNv0EYpoTtkPriNH4LdQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR10MB2477.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?w/7xEsy/xJsCdAosyQ7kEMJR2eE3IwqQFz5WayOKuTGfvYgPTSAWaMRc3sWl?=
 =?us-ascii?Q?112HKgvzjwhQIF4D0k7dE4mLaMjkZqgj0sZUTdejAwKwFDj0Fo+7h+xlF5yr?=
 =?us-ascii?Q?9TDnNTpboT6FwEjEVEWrNmG4I9fzcbxVBs5pIuBy715Kc2LiILdostzICiPX?=
 =?us-ascii?Q?V/EEwfED55Ogw4l6nGZCLdi0dAbW84x1gqWDGpL10FkFwIViJRtsaXQsm6Qk?=
 =?us-ascii?Q?NVPjP8pYzEt7BWuxFbND3M07JMVtRTza+W/ILk2D5GHuF4H4jMtnocdyDW8g?=
 =?us-ascii?Q?gc4uSKfRFuheSmb99bBa8oB0xRXr8qvc5Hx77ib/xxVizxHOqVq89mspsPN0?=
 =?us-ascii?Q?W0igpvKeQmrMjWSpEK/41rPJiWK3h/wWbNwdtkJl+lh4bV2UXFa78Es0v9Xc?=
 =?us-ascii?Q?c3BATH1UGPyKoerta5vJlIn2AdHJDyUYkzo2nfIlN3Jbjg3xSIvWoMbEEgXP?=
 =?us-ascii?Q?2Bi+WrjUBa3BDXg376mnNanOchcfvkrI8VmFIG6Uxw3XtITS4CnhQp+7Elg1?=
 =?us-ascii?Q?k4AG7Bmm/PudGQlhtVTGypLx6uu4VXCnOwZHiHuQL3zgG/13CPT9Xtu9W4gn?=
 =?us-ascii?Q?7aWZ+BYWxjKgP3thFtCbQ6FCyQsNldbxLUUxLQewRutzl5ZIitmxt5EnGjnO?=
 =?us-ascii?Q?tCx21LgeuZ6uIK11JeWDgkmUSMf4C0zAsROXZ8rDHEmfd86VZJj5uSW7jkrR?=
 =?us-ascii?Q?QEZLRIVtyaVaBPGELDVMYOBbBa7V4WG3C38I5yQzIIXujYVeS94C20DSS5Oo?=
 =?us-ascii?Q?l1GTjsZL2NZIYhORbU0yHe48aDfdsXN2iqnUbw8zx/9UB6rM28cKwkLTvw/4?=
 =?us-ascii?Q?442Q1Pk16DvvtAI7k4CMl/kla6YSNm4WZcXMeEUd65KFC2sGon9naVyEsAVU?=
 =?us-ascii?Q?5mM/JavuAB3Fm45IA9VPueghtkG1qweI4C8pH7oK9YZplFNpc+XEDezyaPHF?=
 =?us-ascii?Q?7R4CSeNTjMCv65N3UA/6zp3re+kB0jPgVJKW5GeaPFqerp6Yrj74wVbsndUr?=
 =?us-ascii?Q?GwMAKuCtcYWi7eZC1SrGFEOwFaOOb13a8YcSSm1esoLLvFwg8u3DRijOozhn?=
 =?us-ascii?Q?aut6I8ipw+vXicEQhXfZzJNLK5BqME9ETGJqXPixyqlRy0a3RW4kWtSytVkh?=
 =?us-ascii?Q?Ssrwqa6cBYPWpzFP0nRvL8LFo6KEWa0F2xy/TdW9BxkHjz084heQ1IIOnZDx?=
 =?us-ascii?Q?mHodCma5MEsWFb/kXOdFzPYhI/392kcahWO/G/rFOTfwErzVeWFjtwq7+Cr7?=
 =?us-ascii?Q?Nt+/2wytxCjYf7d7lc2oUHT9ySqQovBESuczMAbTqWZxTTEN+i/V9N61Oajn?=
 =?us-ascii?Q?++5YJ2b6w4B+DniIWop4db/LTKF1PuF0TZ7G8Z2tKrKt7HeoIvFNQ2bitxmU?=
 =?us-ascii?Q?0kVkfhLGIHsj//w4CP2LO2GYYMRmwqcZP1NYh0WnwIOSejD8kGfZU44T++b9?=
 =?us-ascii?Q?t7lX363G8mX6clfj9Ki51sMYp/1/FMvjdf2b/TVjJ5eRn8BSrWIfotqiDjmD?=
 =?us-ascii?Q?X4n/ohTxcMEgFdy7Gj5tF7cPYoNMb4wJ56QdIXtOfKiii//zMdkdeUCxp7XX?=
 =?us-ascii?Q?7PP0sJJVsFWIiWZTMaX5/YbuTQBBYuhhUYHEqzSJMu1n40uwfAyHIeqptsnQ?=
 =?us-ascii?Q?8w=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: f858ab99-8178-4c5e-57ae-08dd0b49a94f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR10MB2477.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 23:01:56.0333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R2drI6SKjB/sWMqck9ATpLIuw8wNpjTI3RuXOqGGhqo7ddeIN6vxfL4b6GRogo9jDfo2U78wIm8TsTzxbAn5RRKxgQZERROseasYn3NCYys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7489
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 23:02:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207670

On Fri, Nov 22 2024, Peter Kjellerstedt <peter.kjellerstedt@axis.com> wrote:

>> From: Rasmus Villemoes <ravi@prevas.dk>
>> 
>> This default value of FILESYSTEM_PERMS_TABLES is set before
>> local.conf, ${DISTRO}.conf etc. are parsed. So in order for
>> ${DISTRO}.conf to define the value, it has to use =. But that then
>> precludes the ${MACHINE}.conf from having final say, unless one there
>> resorts to some override hack.
>> 
>> Demote this default setting to a weak default. Then local.conf,
>> ${DISTRO}.conf, ${MACHINE}.conf etc. can each use ?= with the expected
>> precedence.
>> 
>> Signed-off-by: Rasmus Villemoes <ravi@prevas.dk>
>> ---
>>  meta/conf/bitbake.conf | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index 02bbf0e7a5..daf2d952e4 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -381,7 +381,7 @@ FILESEXTRAPATHS ?= "__default:"
>>  #  base_prefix, prefix, exec_prefix, base_bindir, base_sbindir, base_libdir,
>>  #  datadir, sysconfdir, servicedir, sharedstatedir, localstatedir, infodir,
>>  #  mandir, docdir, bindir, sbindir, libexecdir, libdir and includedir
>> -FILESYSTEM_PERMS_TABLES ?=  "files/fs-perms.txt \
>> +FILESYSTEM_PERMS_TABLES ??= "files/fs-perms.txt \
>>                               files/fs-perms-volatile-log.txt \
>>                               files/fs-perms-volatile-tmp.txt"
>> 
>
> Careful now. Changing ?= to ??= means that it is no longer possible to use 
> FILESYSTEM_PERMS_TABLES += "..." in, e.g., a ${DISTRO}.conf (something we do in 
> our layers). Instead it requires that FILESYSTEM_PERMS_TABLES:append is used.
>

Ah, good point. I only considered the various forms of assignment people
might have in the distro conf etc, not the various kinds of appends.

What prompted me to send this was that we'd like to have persistent
logs, and the documentation says "remove files/fs-perms-volatile-log.txt
from FILESYSTEM_PERMS_TABLES" - but I/we would rather not do that in our
distro conf by using the :remove operator; we would rather set a default
value for FILESYSTEM_PERMS_TABLES that derived distros or individual
machines could then have final say over.

Commits 91128c651706 and 8d1ae67b89c4 don't offer much explanation why
the individual flags were removed, but it does seem to make things
somewhat less flexible.

As always, an extra level of indirection might be introduced
(i.e. FILESYSTEM_PERMS_TABLE_LOG ??=
"files/fs-perms-volatile-log.txt" and rewriting bitbake.conf's
definition in terms of that...), but I'm loath to actually suggest that
until I understand the actual motivation for those two commits.

Rasmus

