Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B550C43334
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 21:04:15 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web08.551.1655931852549182052
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 14:04:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17,
 mailfrom: f_l_k@t-online.de)
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout02.t-online.de (Postfix) with SMTP id C9A7A8065;
	Wed, 22 Jun 2022 23:03:47 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.39.186]) by fwd71.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1o47Vr-2QwCPp0; Wed, 22 Jun 2022 23:03:47 +0200
Message-ID: <e74c83db-d4fd-8696-d00b-b19c19f9b42e@t-online.de>
Date: Wed, 22 Jun 2022 23:03:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [oe-core][PATCH 1/2] llvm: make LLVM_HAVE_OPT_VIEWER_MODULES
 optional
Content-Language: en-US
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
References: <20220622173251.478588-1-f_l_k@t-online.de>
 <20220622224440.658ff65c@booty>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: <20220622224440.658ff65c@booty>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TOI-EXPURGATEID: 150726::1655931827-014319F2-98FCBBF8/0/0 CLEAN NORMAL
X-TOI-MSGID: 0ed9179e-22f6-470b-bdb5-735136bd2117
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jun 2022 21:04:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167258

Hi Luca,

your commit message is way better than mine.

One suggestion on your patch. I guess to be working on the target it 
would be needed to add python3-pygment and python3-pyyaml as runtime 
dependencies as well.

PACKAGECONFIG[optviewer] = ",-DPY_PYGMENTS_FOUND=OFF -DPY_PYGMENTS_LEXERS_C_CPP_FOUND=OFF -DPY_YAML_FOUND=OFF,python3-pygments python3-pyyaml,python3-pygments python3-pyyaml"

Markus

Am 22.06.22 um 22:44 schrieb Luca Ceresoli:
> Hi Markus,
>
> On Wed, 22 Jun 2022 19:32:50 +0200
> "Markus Volk" <f_l_k@t-online.de> wrote:
>
>> Make it a PACKAGECONFIG option and thus avoid automagic to improve reproducibility
>>
>> Signed-off-by: Markus Volk <f_l_k@t-online.de>
>> ---
>>   meta/recipes-devtools/llvm/llvm_git.bb | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
>> index 67ed1eab00..b86605cbce 100644
>> --- a/meta/recipes-devtools/llvm/llvm_git.bb
>> +++ b/meta/recipes-devtools/llvm/llvm_git.bb
>> @@ -90,6 +90,9 @@ EXTRA_OECMAKE:append:class-nativesdk = "\
>>                     -DLLVM_CONFIG_PATH=${STAGING_BINDIR_NATIVE}/llvm-config${PV} \
>>                    "
>>   
>> +PACKAGECONFIG ?= ""
>> +PACKAGECONFIG[optviewer] = "-DPY_PYGMENTS_FOUND=ON -DPY_PYGMENTS_LEXERS_C_CPP_FOUND=ON -DPY_YAML_FOUND=ON,-DPY_PYGMENTS_FOUND=OFF,,python3-pygments python3-pyyaml"
>> +
> I have been working on a different version of this patch earlier today
> based on the discussion on this mailing list. Now it completed testing
> on my machine and I have run a build on the autobuilders:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/1049
>
> My approach was slightly different, but not dramatically. I wrote a
> more informative commit message though. I'm sending my patch to have
> both out so that we can find which is the best one.
>

