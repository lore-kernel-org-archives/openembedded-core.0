Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33210C433F5
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 15:14:04 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.92.91.29])
 by mx.groups.io with SMTP id smtpd.web12.10900.1633360442590407097
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 08:14:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=XYpWbXJ+;
 spf=pass (domain: outlook.com, ip: 40.92.91.29,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QEaUp1lgEvkFRSdIhdWUH3UMCtlu03vTpeQGCQq+hY62ztWI5CGn50NwaZlie4jnpJopUNxFm3VcVBUNQIEl/O2Fbduzx4VF8C6nbG+qE1SNfe09TA5/w4j55ciBQoEwtjCcKZJkcypZT2GzaUneu0VCH5rtp0ReTIFv27qGyUGM8FvbUMJTiv65xrOqKdicpjzpS78oX+uDkwyfSqgHJYu+L0BxO6EdqtRKPgm1NSzHN+yRpqNb3NL72ulLeg6f6UcNJSSdrAV+8+a8r9FomB8GgVjAN11tmTut7zx1e5N/MQzvLwdqzEEYdqEs0WM7rGB9hDD5ElbfHauvyg1jow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jVxm9iO5MZhymwqTsW/o9eq/h5W49+8MrKTraGVmzpU=;
 b=Q+7Rkj2uBtU1jLi3guZHRDngFbBknFgGy40sh4XGSn0+p5/y6CpWjPc+ZqpElF1Ij2GigEadChM/e0dSvJQsqH5XMj8NZ9tZdC7ldPQgjNkY3pxF7HICv/T0H7CAzNHUB1HHqPtkI6WE4M/R7HKiAaH5QcmUYuNW/0MaaSOrn+mnZ2om3I5WR6jtZZqeFYGYHnBkcE4zCBAddtNKy4Y4l9AW48h4J7dKgyaSZxTzkJmojJ54YNr5cTmxp3Da0MmKpG6LrKqDIqblaDKqTG0qbkiEDX2f8r9S8MfPmNZJ3YgdeTd6toZ2PCBZUeu+AoVbrBucyNrFUgI2MFEc6N+u6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jVxm9iO5MZhymwqTsW/o9eq/h5W49+8MrKTraGVmzpU=;
 b=XYpWbXJ+TC5/WRkxrhbIwl/GeB8i0sgWS1f+mDcb2e5Y6TZrnJkZYrMRjihzsG5Var3w4H0CaDJvbHHh2OiCYG6bIXKUOf1gCo0VozKkODJIYfSRINw1UIsW2qm7eO3D1CcIKW3PqoOnUWGIWL4b8F6uhsZ2efnFeR+DSiTkPjd5GXlQwiuW45j6Fb5uqcUEL229/xP2nBZb0oNEuri1zDH3fUTpOY0OcnPGbE5xjSe0pQ9Pn5VXpOggv1DLjd69iGKl0zreQiyERZyTjeITmshtFbdrAxbzfdECadCy8Y5CdoFtaNrMjTqncXhwavyYHJjQbgWks+z+kMlN9bjmog==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM4PR0902MB1684.eurprd09.prod.outlook.com (2603:10a6:200:9a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Mon, 4 Oct
 2021 15:14:00 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710%3]) with mapi id 15.20.4566.022; Mon, 4 Oct 2021
 15:14:00 +0000
Subject: Re: [OE-core] [PATCH 2/3] glibc: fix append in DEPENDS
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20211004132853.30543-1-kweihmann@outlook.com>
 <AM9PR09MB46421376B722A7A7A315BC8CA8AE9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <2d32793c8dbc47a0afced79d07377812@axis.com>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB4642623841A0B2B3EDDE44D2A8AE9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Mon, 4 Oct 2021 17:13:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <2d32793c8dbc47a0afced79d07377812@axis.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN: [Df55F6slmitaCVEwe5YGjMUNATZNuRfs]
X-ClientProxiedBy: AM0PR07CA0036.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::49) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <eaf3ef31-81a6-081c-ef20-66b247538f18@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.43.125] (46.114.34.242) by
 AM0PR07CA0036.eurprd07.prod.outlook.com (2603:10a6:208:ac::49) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.16 via Frontend
 Transport; Mon, 4 Oct 2021 15:13:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14479579-e0d8-4da0-9595-08d9874997f1
X-MS-TrafficTypeDiagnostic: AM4PR0902MB1684:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wnMav3Gr//6/O7pD9uhhgQXlsVcOs0bvFj96lrc4kDncZRg9qmrhJdHY3YomUrGXvOZkcP4ueA4yYRMzq2LzKj0vMWfV1e9USWFQcnq1mca6xQrC9Jv2MTAibIK68+EvZdFRgzDX+ij1g/19VjH2nLobZPmpr01pmQgZM3QUhTFQwV9o6yXzcQpO37HD1tgHffMkG1IMlPReeEYLbcj+BRcuuhHnL7T9pJChy0c7ysHNqrXk+rYf6RYHPKCg3icJ2zDN1XlFQeOk2v97TswcNBZyBS3pEXkMkhpGicJ3ZHQ8RWoML7v0xqI3ASlzAjTNPf8Qoy9X/7r3qUEjdF1czRKYVoMauPajgkx7Us5hu1AYFp8S3jwEgv2+/boEXOfzuTGs2HLwpIt9v7KhectrUaNEaFYzdcDdY+k/TRApnH/Pwx/aBpWDAohtui+gzFd1
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	LxCFKH2mi9wg41vu6I6CMeZpe9Tzi7yi/s3pR3Kc+yGsVhhJq1o5iDIaQtmm8B4ik7E/C9sT5Wup7DH6RKJnu4KvU3jwLtVXFUPITl1+PtNSXczae1Tn9i8jNbG/qzvngsFED/xddqS7WOdCdYEOww==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 14479579-e0d8-4da0-9595-08d9874997f1
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2021 15:14:00.3520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0902MB1684
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Oct 2021 15:14:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156611



On 04.10.21 17:08, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-
>> core@lists.openembedded.org> On Behalf Of Konrad Weihmann
>> Sent: den 4 oktober 2021 15:29
>> To: openembedded-core@lists.openembedded.org
>> Cc: Konrad Weihmann <kweihmann@outlook.com>
>> Subject: [OE-core] [PATCH 2/3] glibc: fix append in DEPENDS
>>
>> fix the append with a leading blank, otherwise this messes up
>> DEPENDS when globally inherited classes add dependecies of their own
>>
>> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
>> ---
>>   meta/recipes-core/glib-2.0/glib.inc | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-
>> 2.0/glib.inc
>> index a34776b083..3436645f15 100644
>> --- a/meta/recipes-core/glib-2.0/glib.inc
>> +++ b/meta/recipes-core/glib-2.0/glib.inc
>> @@ -30,7 +30,7 @@ LEAD_SONAME = "libglib-2.0.*"
>>
>>   inherit meson gettext gtk-doc pkgconfig ptest-gnome upstream-version-is-
>> even bash-completion gio-module-cache manpages
>>
>> -DEPENDS:append:class-target = "${@' gtk-doc' if d.getVar('GTKDOC_ENABLED') == 'True' else ''}"
>> +DEPENDS:append:class-target = " ${@' gtk-doc' if d.getVar('GTKDOC_ENABLED') == 'True' else ''}"
> 
> This change is not needed as there already is a space inside
> the if statement (in ' gtk-doc').

Still this is very prone to errors, so I personally rather have a space 
too much than to few (esp. as the else clause doesn't add a space).

IHMO it should be for readability purpose rather " ${@'gtk-doc' if 
d.getVar('GTKDOC_ENABLED') == 'True' else ''}" than like it is now - but 
that's just cosmetics and I'm sure one could discuss about that a lot

> 
>>
>>   GTKDOC_MESON_OPTION = "gtk_doc"
>>
>> --
>> 2.25.1
> 
> //Peter
> 

