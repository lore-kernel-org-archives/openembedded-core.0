Return-Path: <niko.mauno@iki.fi>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AE7CC433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 06:32:18 +0000 (UTC)
Received: from mailtransmit05.runbox.com (mailtransmit05.runbox.com [185.226.149.38])
 by mx.groups.io with SMTP id smtpd.web09.413.1667975530757777087
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 22:32:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@runbox.com header.s=selector2 header.b=StjJXo4f;
 spf=pass (domain: runbox.com, ip: 185.226.149.38, mailfrom: realint@runbox.com)
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
	by mailtransmit05.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <realint@runbox.com>)
	id 1osed4-00EsJw-HK; Wed, 09 Nov 2022 07:32:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector2; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:Reply-To:MIME-Version:Date:Message-ID;
	bh=ev6Vxk/x0qwjrKrMxdm/8K41qPIfuL+W1tDBthgQftw=; b=StjJXo4fD0oiKydOM0T1Yk+a25
	KxvDd530YEOT3g3KheHHLvHA7/PjriUe5PBKMWdteCIl9suIB687Qx7+o1/2tltO3ZpULOst/bisF
	V5afLDMmeqxpwVon28b/q4MrfkUj5O5vb/QMxJDN7KPVnPaFEImmPR99B7pNY3b3cIFouX9kUQNja
	50w3+fGgi1B4eBcETG9Di3NlXxpepSiLHV8qxhm8nWyBtaqAXWqEFaqUi0yn5Zfv/6xDL5Oq/PYvy
	/d6ItlyjXD6tNoJC9DV/RilnUltWtD68qjKfcKARIS31QmccGWjHjWVnVJ1qCq2p+2Jsr8wJc+Psq
	V42uPJlg==;
Received: from [10.9.9.74] (helo=submission03.runbox)
	by mailtransmit03.runbox with esmtp (Exim 4.86_2)
	(envelope-from <realint@runbox.com>)
	id 1osed3-0002AU-UL; Wed, 09 Nov 2022 07:32:06 +0100
Received: by submission03.runbox with esmtpsa  [Authenticated ID (1051538)]  (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.90_1)
	id 1oseco-0006cY-CR; Wed, 09 Nov 2022 07:31:50 +0100
Message-ID: <aed66526-9df8-fbf8-696c-b85a44f8e1b8@runbox.com>
Date: Wed, 9 Nov 2022 08:33:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Reply-To: niko.mauno@iki.fi
Subject: Re: [OE-core] [RFC PATCH 1/3] Try to ensure 64 bit time on 32 bit
 glibcful hosts
Content-Language: en-US
To: Ola x Nilsson <ola.x.nilsson@axis.com>,
 openembedded-core@lists.openembedded.org
Cc: "niko.mauno@vaisala.com" <niko.mauno@vaisala.com>
References: <20221108000828.42824-1-niko.mauno@vaisala.com>
 <jwqh6z9soii.fsf@axis.com>
From: Niko Mauno <realint@runbox.com>
In-Reply-To: <jwqh6z9soii.fsf@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 06:32:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173011

On related note, in this RFC series I was basing on reference set in 
https://github.com/lmajewski/meta-y2038/blob/master/conf/distro/y2038.inc#L8 
where the author has opted to use TARGET_CPPFLAGS.

-Niko

On 11/8/22 12:51, Ola x Nilsson wrote:
> 
> I'm working on the same thing, but I put GLIBC_64BIT_TIME_CPPFLAGS in
> TARGET_CC_ARCH instead to make sure they applied everywhere.
> 
> I'd be interested to hear what others think is the best place to put
> these flags.
> 
> I'm also looking at QA tests to make sure that no application or shared
> object is still using 32bit time or file functions from glibc.
> 
> /Ola
> 
> On Tue, Nov 08 2022, Niko Mauno via lists.openembedded.org wrote:
> 
>> Add default C Preprocessor flags that ensure Y2038 compatible 64 bit
>> time on 32 bit host applications when glibc is used. Prerequisites
>> are glibc version 2.34 or newer and Linux kernel version 5.1 or newer.
>>
>> Example of impact on 32 bit 'qemuarm' machine running
>> core-image-minimal. Before this change:
>>
>>    root@qemuarm:~# /bin/busybox date
>>    Sun Nov  6 06:09:39 UTC 2022
>>    root@qemuarm:~# /sbin/hwclock.util-linux -w
>>    root@qemuarm:~# /sbin/hwclock.util-linux
>>    2022-11-06 06:09:49.994249+00:00
>>    root@qemuarm:~# /bin/busybox date -s 2040-01-01
>>    date: invalid date '2040-01-01'
>>    root@qemuarm:~# /bin/date.coreutils -s 2040-01-01
>>    Sun Jan  1 00:00:00 UTC 2040
>>    root@qemuarm:~# /sbin/hwclock.util-linux -w
>>    root@qemuarm:~# /sbin/hwclock.util-linux
>>    1931-03-04 06:26:23.000000+00:00
>>    root@qemuarm:~#
>>
>> After this change:
>>
>>    root@qemuarm:~# /bin/busybox date
>>    Sun Nov  6 06:02:20 UTC 2022
>>    root@qemuarm:~# /sbin/hwclock.util-linux -w
>>    root@qemuarm:~# /sbin/hwclock.util-linux
>>    2022-11-06 06:02:27.989730+00:00
>>    root@qemuarm:~# /bin/busybox date -s 2040-01-01
>>    Sun Jan  1 00:00:00 UTC 2040
>>    root@qemuarm:~# /sbin/hwclock.util-linux -w
>>    root@qemuarm:~# /sbin/hwclock.util-linux
>>    2040-01-01 00:00:20.992954+00:00
>>    root@qemuarm:~#
>>
>>  From here on, the adding of new flags can be disabled on recipe or
>> global level by resetting the value of associated variable containing
>> the CPPFLAGS specific for 64 bit time
>>
>>    GLIBC_64BIT_TIME_CPPFLAGS = ""
>>
>> which can be useful e.g. when working around failure to compile a
>> component due to lack of 64 bit time support on 32 bit build in the
>> component's source code.
>>
>> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
>> ---
>>   meta/conf/distro/include/tclibc-glibc.inc        | 3 +++
>>   meta/recipes-devtools/gcc/gcc-sanitizers_12.2.bb | 2 ++
>>   meta/recipes-devtools/pseudo/pseudo_git.bb       | 2 ++
>>   3 files changed, 7 insertions(+)
>>
>> diff --git a/meta/conf/distro/include/tclibc-glibc.inc b/meta/conf/distro/include/tclibc-glibc.inc
>> index f48d16939e..95770298e9 100644
>> --- a/meta/conf/distro/include/tclibc-glibc.inc
>> +++ b/meta/conf/distro/include/tclibc-glibc.inc
>> @@ -17,6 +17,9 @@ PREFERRED_PROVIDER_virtual/crypt ?= "libxcrypt"
>>   
>>   CXXFLAGS += "-fvisibility-inlines-hidden"
>>   
>> +GLIBC_64BIT_TIME_CPPFLAGS = "-D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64"
>> +TARGET_CPPFLAGS += "${GLIBC_64BIT_TIME_CPPFLAGS}"
>> +
>>   LIBC_DEPENDENCIES = "\
>>   		     glibc \
>>   		     glibc-dbg \
>> diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers_12.2.bb b/meta/recipes-devtools/gcc/gcc-sanitizers_12.2.bb
>> index 8bda2ccad6..b3fafa0ea4 100644
>> --- a/meta/recipes-devtools/gcc/gcc-sanitizers_12.2.bb
>> +++ b/meta/recipes-devtools/gcc/gcc-sanitizers_12.2.bb
>> @@ -5,3 +5,5 @@ require gcc-sanitizers.inc
>>   # sanitizer_linux.s:5749: Error: lo register required -- `ldr ip,[sp],#8'
>>   ARM_INSTRUCTION_SET:armv4 = "arm"
>>   ARM_INSTRUCTION_SET:armv5 = "arm"
>> +
>> +GLIBC_64BIT_TIME_CPPFLAGS = ""
>> diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
>> index c34580b4ff..7734d0fbb0 100644
>> --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
>> +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
>> @@ -19,3 +19,5 @@ PV = "1.9.0+git${SRCPV}"
>>   
>>   # error: use of undeclared identifier '_STAT_VER'
>>   COMPATIBLE_HOST:libc-musl = 'null'
>> +
>> +GLIBC_64BIT_TIME_CPPFLAGS = ""
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172959): https://lists.openembedded.org/g/openembedded-core/message/172959
> Mute This Topic: https://lists.openembedded.org/mt/94880624/3618026
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [niko.mauno@iki.fi]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


