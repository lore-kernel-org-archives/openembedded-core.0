Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web08.3445.1608589915540364213
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Dec 2020 14:31:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from Marks-MacBook-Pro-16.local ([76.164.61.198])
	(authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 0BLMVehv015088
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO)
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Dec 2020 16:31:47 -0600
Subject: Re: [OE-core] [yocto-security] [PATCH] openssl: drop support for deprecated algorithms
To: openembedded-core@lists.openembedded.org
References: <AM0PR08MB361713C43176BFA1C7295477C5C20@AM0PR08MB3617.eurprd08.prod.outlook.com>
 <820250ef6b128796337fb4a730097a3aa80528d7.camel@linuxfoundation.org>
 <DBBPR09MB474859DDE9CBC3963BBFDA67A8C20@DBBPR09MB4748.eurprd09.prod.outlook.com>
 <3d6a9cee1d07a2329c259c986fe458f4ed8a2409.camel@linuxfoundation.org>
 <DBBPR09MB47482872A1EB65B9A9502107A8C20@DBBPR09MB4748.eurprd09.prod.outlook.com>
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
Message-ID: <1d0ddb74-2490-8f08-ca7e-dfd2f03dc03a@kernel.crashing.org>
Date: Mon, 21 Dec 2020 16:31:39 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <DBBPR09MB47482872A1EB65B9A9502107A8C20@DBBPR09MB4748.eurprd09.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 12/19/20 12:04 PM, Konrad Weihmann wrote:
> 
> 
> On 19.12.20 18:58, Richard Purdie wrote:
>> On Sat, 2020-12-19 at 18:53 +0100, Konrad Weihmann wrote:
>>> On 19.12.20 18:36, Richard Purdie wrote:
>>>>    PACKAGECONFIG[cryptodev-linux] = "enable-devcryptoeng,disable-devcryptoeng,cryptodev-linux,,cryptodev-module"
>>>> +PACKAGECONFIG[no-tls1] = "no-tls1"
>>>> +PACKAGECONFIG[no-tls1_1] = "no-tls1_1"
>>>>    
>>>>    B = "${WORKDIR}/build"
>>>>    do_configure[cleandirs] = "${B}"
>>>> @@ -52,6 +54,10 @@ EXTRA_OECONF_class-nativesdk = "--with-rand-seed=os,devrandom"
>>>>    CFLAGS_append_class-native = " -DOPENSSLDIR=/not/builtin -DENGINESDIR=/not/builtin"
>>>>    CFLAGS_append_class-nativesdk = " -DOPENSSLDIR=/not/builtin -DENGINESDIR=/not/builtin"
>>>>    
>>>> +# Disable deprecated crypto algorithms
>>>> +# Retained for compatibilty - des (curl), dh (python-ssl), dsa (rpm)
>>>> +DEPRECATED_CRYPTO_FLAGS = " no-ssl no-idea no-psk no-rc2 no-rc4 no-rc5 no-md2 no-md4 no-srp no-camellia no-bf no-mdc2 no-scrypt no-seed no-siphash no-sm2 no-sm3 no-sm4 no-whirlpool"
>>>> +
>>>   From my perspective this breaks backward compatibility, so I would
>>> rather have them all that as optional PACKAGECONFIG fields (which also
>>> does make it easier for ppl, still relying on one of those algorithms,
>>> for whatever reason, to re-enable them) - with the current approach all
>>> one could do is to override it with a bbappend - and tbh letting ppl
>>> have bbappends for this recipe, doesn't sound like the best idea in the
>>> long run to "enforce" any kind of "security" or "hardening"
>>
>> Having it as a variable does mean you could customise the variable and
>> doesn't mean it has to be done with a bbappend, it can be set from a
>> distro config too.
>>
>> I'm not sure turning each one into a packageconfig is going to be more
>> helpful compared to this in practise...
> 
> I'm not sure I follow, as this is a "hard" assign - if it would (in 
> theory) a ??= assignment, yes then it would be fine. Still that leaves 
> us with a not commonly known variable, while PACKAGECONFIG is more 
> widely accepted in 3rd party layers/distros from my experience.

In the past I had done something similar w/ PACKAGECONFIG, and then had a
comment in the recipe that indicated that certain items were not recommended
with a link to the OpenSSL documentation where it explained that.

It might also be a reasonable idea (security wise, maybe not OE wise) to display
a bb.warn if one of the 'unsafe' crypto algorithms is enabled.

As for someone mentioning that it's unclear if we should be maintaining a list,
in the past there was a list in the OpenSSL documentation.  I would certainly
rely on that list as what should and should not be enabled by default (with
exceptions as appropriate.)

--Mark

>>
>> Cheers,
>>
>> Richard
>>
>>
>>
>> 
>>
