Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f54.google.com (mail-la0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id 82ADC6008D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 21:27:54 +0000 (UTC)
Received: by mail-la0-f54.google.com with SMTP id ea20so2868404lab.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 14:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=TdQQc9rdS9smQEZt7aqo6GIStlcQcKmYjIueP0kUhf8=;
	b=srqOAeteCCyz0K2dmUMgQJKIx5G2vBNPZhv0xwfzMo9sUZXlSWhDvtrFBeskbWJKoO
	d84QhrDSEsTPcfLIzPMhEncWkqcVEzUyc6ndqcKyOyGSDAt85Svgy7uUgrHPAFkqB5wc
	H0k2iJwzpbjfvd+dmcSuwF4xGGSgYv5uo3udZ4BFzQfYS4Zgdt6QtqCU/zOGQ8rsjEqw
	1tC6rUjnmsHOw5UvnEHI7jtL86fVw41YptuKEvLRPdu5ZK+eY8RS1h6hGL+3SJSqSlRx
	lbuLAiv4iI4Rzai4g2mPLQtP6iU57GFJWiLipb/cd9kIFnnABzqVpZpGCYyUSBs2Jwxy
	yFiA==
MIME-Version: 1.0
X-Received: by 10.112.57.49 with SMTP id f17mr4062421lbq.26.1377552474231;
	Mon, 26 Aug 2013 14:27:54 -0700 (PDT)
Received: by 10.112.12.103 with HTTP; Mon, 26 Aug 2013 14:27:54 -0700 (PDT)
In-Reply-To: <4A7D66DA-78E2-418A-8E86-8D7504B3193D@gmail.com>
References: <cover.1377405083.git.bruce.ashfield@windriver.com>
	<c2d44f9ff8d416b7f984bc4027de7acecbec0986.1377405083.git.bruce.ashfield@windriver.com>
	<CAMKF1sr+z-f7KW6BqMLbs0RuFu4fhz_crhBVM_++nOqVb=OtnQ@mail.gmail.com>
	<521AA761.4000605@windriver.com> <521ABA1C.9010105@windriver.com>
	<CADkTA4OFMOyAUi5njjFXb1NnTh4ONp4vHT3JZxuL4tiG3OqOiw@mail.gmail.com>
	<CADkTA4Pit1BhOxw5C1gFobrj-m00CpS-n=WNtCkgdRdCDRymhg@mail.gmail.com>
	<8DA5FFBA-9580-444A-AC2F-53C97EF6D105@gmail.com>
	<CADkTA4NFqrBD=y7LqjgRXJyYvd5RiwD0_ab8ZLE1gkTUsCMVhw@mail.gmail.com>
	<4A7D66DA-78E2-418A-8E86-8D7504B3193D@gmail.com>
Date: Mon, 26 Aug 2013 17:27:54 -0400
Message-ID: <CADkTA4O5V+FP+qYmM84v=A98CkmeQgNdRNKXYmx_78BnLezkCw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/7] eglibc: ptrace: protect ptrace_peeksiginfo_args from redefintion
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Aug 2013 21:27:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Aug 26, 2013 at 5:16 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Aug 26, 2013, at 10:59 AM, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
>> On Mon, Aug 26, 2013 at 1:28 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>> On Aug 25, 2013, at 7:46 PM, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>>>
>>>> A final (maybe .. hopefully!?) thought on this. Do drop this change,
>>>> but give me a
>>>> few minutes to remove the offending structure from linux-libc-headers_3.10. That
>>>> will also protect all users of yocto, regardless of the kernel unless
>>>> they provide
>>>> their own libc-headers .. and then they are on their own :)
>>>>
>>>> That leaves the c library alone, and should buy us time to fix the
>>>> offending apps.
>>>
>>> this is not again the correct place to fix it. since you will back this out say later
>>> when all apps are fixed anyway. If we need to keep it I would rather have the app
>>> builds failing and keep it enabled and it should not be the guy who is doing the kernel
>>> headers upgrade to fix the whole ecosystem either. So add the headers by all means
>>> and leave the old headers in there until the apps work correctly with new headers.
>>
>> Whether or not to allow the apps to break, that's a call for Saul and
>> Richard. For
>> now, this fix works in all cases, and I'm able to build and boot with the 3.10
>> kernel and matching headers.
>>
>> Given that we are about to hit the M4 freeze, I'd prefer this in now,
>> and the apps
>> fixed later. We need to get mileage with the matching headers and kernel.
>>
>> I think this is a good compromise for the time being, we've had far
>> nastier hacks in
>> the libc-headers in the past.
>
> It would make it harder to fix this problem in the app if we work is around this way :)
> while I see the your urgency of making 3.10 defaults. I don't think we should rush it but  thats
> just me

Typically I just ask for bugzilla entries to track the fixes in a situation like
this. At a high enough priority that they block a release. That gets everyone's
attention :)

Bruce

>
>
>>
>> Bruce
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end"
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

