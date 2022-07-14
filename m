Return-Path: <preid@electromag.com.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9224AC433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 08:26:10 +0000 (UTC)
Received: from anchovy3.45ru.net.au (anchovy3.45ru.net.au [203.30.46.155])
 by mx.groups.io with SMTP id smtpd.web11.5292.1657787158383143114
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jul 2022 01:25:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: electromag.com.au,
 ip: 203.30.46.155, mailfrom: preid@electromag.com.au)
Received: (qmail 26163 invoked by uid 5089); 14 Jul 2022 08:25:56 -0000
Received: by simscan 1.2.0 ppid: 25914, pid: 25915, t: 0.9595s
         scanners: regex: 1.2.0 attach: 1.2.0 clamav: 0.88.3/m:40/d:1950 spam:
 3.1.4
Received: from unknown (HELO ?192.168.0.22?)
 (preid@electromag.com.au@203.59.235.95)
  by anchovy2.45ru.net.au with ESMTPA; 14 Jul 2022 08:25:54 -0000
Message-ID: <33bb2737-58eb-5cc7-c6a0-30328f9baafe@electromag.com.au>
Date: Thu, 14 Jul 2022 16:25:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [OE-core] libstdc++ honister -> kirkstone
Content-Language: en-AU
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
  mfumita@electromag.com.au, openembedded-core@lists.openembedded.org
References: <fbe2ba5d-f82c-ea57-a00d-4e0ff1b9586f@electromag.com.au>
 <28194.1657080073438546558@lists.openembedded.org>
 <25ddecdf5e77515b5967dd92d804e8dbd4ef3b70.camel@linuxfoundation.org>
 <f4223840-8400-44ed-1d5d-8f9ab9b51c46@electromag.com.au>
 <6e83879c522c185635c6ad258854e170ef07fcd3.camel@linuxfoundation.org>
From: Phil Reid <preid@electromag.com.au>
In-Reply-To: 
 <6e83879c522c185635c6ad258854e170ef07fcd3.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Jul 2022 08:26:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168026

On 14/07/2022 6:13 am, Richard Purdie wrote:
> On Tue, 2022-07-12 at 13:23 +0800, Phil Reid wrote:
>> On 8/07/2022 9:05 pm, Richard Purdie wrote:
>>> On Tue, 2022-07-05 at 21:01 -0700, mfumita@electromag.com.au wrote:
>>>> Hello there,
>>>>    
>>>> It isn't due to EOVERFLOW but make_file_type function in libstdc++-
>>>> v3\src\filesystem\ops-common.h always returns file_type::unknown.
>>>> It's because _GLIBCXX_HAVE_S_ISREG isn't defined.
>>>> I found HAVE_S_ISREG at libstdc++-v3/config.h isn't set properly.
>>>>    
>>>> It's caused by a configure failure below to tell if S_ISREG exists on
>>>> the target.
>>>> gcc/arm-emit-linux-gnueabi/11.3.0/ld: error: tmp-
>>>> glibc/work/cortexa9t2hf-neon-emit-linux-gnueabi/gcc-runtime/11.3.0-
>>>> r0/dummylib/libstdc++.so: file is empty
>>>> collect2: error: ld returned 1 exit status
>>>> configure:15686: $? = 1
>>>>    
>>>> It complains dummylib/libstdc++.so is empty, configure failed then
>>>> wrongly considered S_ISREG doesn't exist.
>>>> This seems related to the following commit.
>>>> https://github.com/openembedded/openembedded-core/commit/34b0edb0d3120c32063ff7e3dd52be20d60401d5
>>>>    
>>>> Reverting this commit rectifies this issue but not sure what's the
>>>> proper fix?
>>>> Any help appreciated.
>>>
>>> There is some piece we're still not understanding. I had a look at my
>>> local build (master so gcc 12.1) and I see HAVE_S_ISREG is set
>>> correctly, I don't see any "file is empty" message.
>>>
>>> Are you able to reproduce this on master? Which linker are you using?
>>>
>>
>> G'day Richard,
>>
>> I've update to master and tried this. Still get a "file is empty" error during configure. See log snippet below.
>>
>>
>> Tried to capture the ld version here:
>>
>> wait4(23043, /home/preid/dev/v2022.05/tmp-glibc/work/cortexa9t2hf-neon-emit-linux-gnueabi/gcc-runtime/12.1.0-r0/recipe-sysroot-native/usr/bin/arm-emit-linux-gnueabi/../../libexec/arm-emit-linux-gnueabi/gcc/arm-emit-linux-gnueabi/12.1.0/ld: error: /home/preid/dev/v2022.05/tmp-glibc/work/cortexa9t2hf-neon-emit-linux-gnueabi/gcc-runtime/12.1.0-r0/dummylib/libstdc++.so: file is empty
>> collect2: error: ld returned 1 exit status
>>
>>
>> /home/preid/dev/v2022.05/tmp-glibc/work/cortexa9t2hf-neon-emit-linux-gnueabi/gcc-runtime/12.1.0-r0/recipe-sysroot-native/usr/bin/arm-emit-linux-gnueabi/../../libexec/arm-emit-linux-gnueabi/gcc/arm-emit-linux-gnueabi/12.1.0/ld --version
>> GNU gold (GNU Binutils 2.38.20220516) 1.16
>> Copyright (C) 2022 Free Software Foundation, Inc.
>> This program is free software; you may redistribute it under the terms of
>> the GNU General Public License version 3 or (at your option) a later version.
>> This program has absolutely no warranty.
>>
>>
>> Hope that helps.
> 
> 
> It does thanks. It confirms you're using the gold linker which allowed
> me to reproduce (I was trying with the default bfd). I think this small
> change will fix it:
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
> index c39a0caf8a7..7e920df2d34 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> @@ -68,7 +68,8 @@ do_configure () {
>          # libstdc++ isn't built yet so CXX would error not able to find it which breaks stdc++'s configure
>          # tests. Create a dummy empty lib for the purposes of configure.
>          mkdir -p ${WORKDIR}/dummylib
> -       touch ${WORKDIR}/dummylib/libstdc++.so
> +       touch ${WORKDIR}/dummylib/dummylib.c
> +       ${CC} ${WORKDIR}/dummylib/dummylib.c -shared -o ${WORKDIR}/dummylib/libstdc++.so
>          for d in libgcc ${RUNTIMETARGET}; do
>                  echo "Configuring $d"
>                  rm -rf ${B}/${TARGET_SYS}/$d/
> 
G'day Richard,

Thanks, can confirm that this fixes the problem. Our tests all passed.
Will you submit this as a patch?
Affects us on kirkstone, as well as master branch.




-- 
Regards
Phil Reid
  

