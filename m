Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BBCEC46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 21:14:54 +0000 (UTC)
Received: from smtp3.emailarray.com (smtp3.emailarray.com [65.39.216.17])
 by mx.groups.io with SMTP id smtpd.web10.2296.1704230086106880896
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jan 2024 13:14:46 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: balister.org, ip: 65.39.216.17, mailfrom: philip@balister.org)
Received: (qmail 76885 invoked by uid 89); 2 Jan 2024 21:14:45 -0000
X-Orig-Sender: philip@balister.org
Received: from unknown (HELO ?192.168.11.155?) (cGhpbGlwQGJhbGlzdGVyLm9yZ0A3My4xNTIuMTM0LjE1Mg==) (POLARISLOCAL)  
  by smtp3.emailarray.com with SMTP; 2 Jan 2024 21:14:45 -0000
Message-ID: <f0af4f52-8d7b-41aa-ae30-b082f1a348cb@balister.org>
Date: Tue, 2 Jan 2024 16:14:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] sanity.bbclass: CHeck for additional native
 perl modules.
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20240102112135.3594972-1-philip@balister.org>
 <cb8e91d0ac9ad995d5e54529c7aa986d0ef346f8.camel@linuxfoundation.org>
 <5e4c5bc7-937a-4161-a6ac-79969e3842e6@balister.org>
 <3355eb0d17a4dc6f4b8ffa63c097da4e8b81b9eb.camel@linuxfoundation.org>
From: Philip Balister <philip@balister.org>
In-Reply-To: <3355eb0d17a4dc6f4b8ffa63c097da4e8b81b9eb.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 21:14:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193258

On 1/2/24 11:45, Richard Purdie wrote:
> On Tue, 2024-01-02 at 11:40 -0500, Philip Balister wrote:
>> On 1/2/24 10:34, Richard Purdie wrote:
>>> On Tue, 2024-01-02 at 06:21 -0500, Philip Balister wrote:
>>>> Since we use the build systems native perl, we need to check that all
>>>> perl modules required for a build are installed. For a default Fedora 39
>>>> install, autoconf-native and libxcrypt both fail to build due to missing
>>>> perl modules. After taking careful notes, this commits adds checks for
>>>> File::Compare, File::Copy, open, and FindBin.
>>>>
>>>> [YOCTO #14691]
>>>>
>>>> Signed-off-by: Philip Balister <philip@balister.org>
>>>> ---
>>>>    meta/classes-global/sanity.bbclass | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
>>>> index 9b824915f2..57353b9478 100644
>>>> --- a/meta/classes-global/sanity.bbclass
>>>> +++ b/meta/classes-global/sanity.bbclass
>>>> @@ -532,7 +532,7 @@ def check_git_version(sanity_data):
>>>>    def check_perl_modules(sanity_data):
>>>>        import subprocess
>>>>        ret = ""
>>>> -    modules = ( "Text::ParseWords", "Thread::Queue", "Data::Dumper" )
>>>> +    modules = ( "Text::ParseWords", "Thread::Queue", "Data::Dumper", "File::Compare", "File::Copy", "open", "FindBin" )
>>>>        errresult = ''
>>>>        for m in modules:
>>>>            try:
>>>
>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/8418
>>
>> Curious, so the Ubuntu autobuilder doesn't have the perl open module?
>> Can you build libxcrypt on that builder?
>>
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=14691#c7 shows the
>> build failing until I install the perl-open package.
> 
> $ perl -e "use open"
> open: needs explicit list of PerlIO layers at -e line 1.
> BEGIN failed--compilation aborted at -e line 1.

Why isn't anything easy!

$ perl -e "use open ':std'"

does complete on Fedora 39. What is confusing me is why the check seems 
to go through on my Fedora 39 , but and not the AB machine. I suppose it 
is time to add typos to confirm the code attempts to execute.

I am guessing I could tell bitbake the module is "open ':std'".

Philip

> 
> Cheers,
> 
> Richard
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193246): https://lists.openembedded.org/g/openembedded-core/message/193246
> Mute This Topic: https://lists.openembedded.org/mt/103479426/384425
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [philip@balister.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

