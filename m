Return-Path: <martin.beeger@online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F731C43334
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 17:56:33 +0000 (UTC)
Received: from mail.indurad.com (mail.indurad.com [194.8.217.179])
 by mx.groups.io with SMTP id smtpd.web11.30489.1658166988193723565
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 10:56:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=softfail (domain: online.de, ip: 194.8.217.179, mailfrom: martin.beeger@online.de)
X-Virus-Scanned: Debian amavisd-new at mail.indurad.com
Received: from [10.144.1.55] (perlenbacher.bvd.indurad.x [10.144.1.55])
	by mail-rc1.bvd.indurad.x (Postfix) with ESMTPSA id 185B9230;
	Mon, 18 Jul 2022 19:56:25 +0200 (CEST)
Message-ID: <441c782a-e4f0-0f0d-4dad-835608fc1280@online.de>
Date: Mon, 18 Jul 2022 19:56:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [OE-core] [PATCH v2] cmake: remove CMAKE_ASM_FLAGS variable in
 toolchain file
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20220718165023.422662-1-martin.beeger@online.de>
 <CAMKF1sqhTWt_ANmfRiQEvcWnNXORxKGo0DM=XOoKKKQvAVp0KQ@mail.gmail.com>
From: Martin Beeger <martin.beeger@online.de>
In-Reply-To: 
 <CAMKF1sqhTWt_ANmfRiQEvcWnNXORxKGo0DM=XOoKKKQvAVp0KQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 17:56:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168245

Am 18.07.22 um 19:08 schrieb Khem Raj:
> On Mon, Jul 18, 2022 at 12:51 PM Martin Beeger <martin.beeger@online.de> wrote:
>>
>> As discussied in [YOCTO #14717] cmake contains a OEToolchainConfig.cmake
>> file to configure the toolchain correctly in cross-compile build for recipes
>> using cmake. The CMAKE_ASM_FLAGS are the configuration are meant for  assembly,
>> but the spelling is incorrect and the Flag is ASFLAGS for gcc and other compilers.
>> So this variable might neever have worked and it is better for
>> recipes to specify their own.
>>
> 
> Should it be removed from meta/classes/cmake.bbclass and
> meta/recipes-devtools/cmake/cmake/SDKToolchainConfig.cmake.template as
> well ?
> and what about CMAKE_ASM_FLAGS_RELEASE
> 
The templates have been added after my patch. The author of these has 
used an old version, of the file, which undoes my previous patch and 
does not remove them. I now need to rebase my patch and remove them.
Also it is unclear to me whether the creation of these new files has 
obsoleted the old OEToolchainConfig.cmake and whether is necessary to 
know duplicate all these files to have them even more inconsistent. 
Perhaps there is way to not have both?

On the topic of CMAKE_ASM_FLAGS_RELEASE :
I am very confused by the cmake.bbclass file. A lot of the parameters 
there make no sense to me. They are either redundant to the toolchain 
file, are already set by default by cmake, have little effect or are 
only necessary for bogus library cmake code and so on.
I can remove the asm flags from there, as they should have no effect 
there either.

For further changes I would need to dive in and try to understand where 
the long list of definitions in cmake.bbclass there is applied to. Is it 
only applied to the cmake build itself or to each build?

