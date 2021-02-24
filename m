Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.1293.1614197784259877857
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Feb 2021 12:16:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=KmEzssJB;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: anbelski@linux.microsoft.com)
Received: from [192.168.178.23] (unknown [83.135.214.71])
	by linux.microsoft.com (Postfix) with ESMTPSA id 7D7F020B6C40;
	Wed, 24 Feb 2021 12:16:22 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7D7F020B6C40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1614197783;
	bh=HVaX5BBUHlfe/tMuzTLxV2LRX9lD7rQyetczx8MeWYU=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=KmEzssJBtXhoNOEd2DR/ap3c0sMEZll17Dkeng3VXgKi3jHtvsvep0QV+F9vICkL4
	 jId7Le3RNxGzo3JEyDuMo5if68V9Tuzc0XfKxQuwKoaYg4BWOzCS5qCiRpp6erS51h
	 L5ceEm/ThUkln/e05HqiGLxJSTFl85ugwvnOdw9k=
Subject: Re: [OE-core] Current native SDK glibc compat
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core <openembedded-core@lists.openembedded.org>
Cc: randy.macleod@windriver.com
References: <4ec292a9-3723-34f2-51a5-01dd6652f651@linux.microsoft.com>
 <1a309c4181d7de1b38497b4db6f4e1d664f18398.camel@linuxfoundation.org>
 <9a8cb006-e161-b402-d496-72a1c983e90a@linux.microsoft.com>
 <e4561a7e8c89fe26dd593b0412e16be67665baff.camel@linuxfoundation.org>
From: "Anatol Belski" <anbelski@linux.microsoft.com>
Message-ID: <ce2c3ea0-891b-8c7d-e89a-590fcd7ab12c@linux.microsoft.com>
Date: Wed, 24 Feb 2021 21:16:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <e4561a7e8c89fe26dd593b0412e16be67665baff.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 2/24/2021 5:49 PM, Richard Purdie wrote:
> On Wed, 2021-02-24 at 13:56 +0100, Anatol Belski wrote:
>> On 2/24/2021 1:32 PM, Richard Purdie wrote:
>>> Hi,
>>>
>>> On Wed, 2021-02-24 at 12:40 +0100, Anatol Belski wrote:
>>>> the current master build seems to be broken with symbols unavailable
>>>> from the host glibc. The following is to see on the SDK built and
>>>> installed on the same host Ubuntu 18.04.5 having glibc 2.27:
>>>>
>>>> $ . /tmp/poky-sdk-master-00/environment-setup-core2-64-poky-linux
>>>>
>>>> $ ldd $(which $CC)
>>>> /tmp/poky-sdk-master-00/sysroots/x86_64-pokysdk-linux/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc:
>>>> /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.33' not found
>>> We change the loader path inside our SDK binaries so you can't trust the
>>> output from ldd, it will find a different result to what you'd see
>>> when you run the binary.
>>>
>>> What issue are you seeing trying to run these?
>> Initially it was sighted here appearing when a binary is actually invoked:
>>
>> https://github.com/meta-rust/meta-rust/pull/313#issuecomment-782784056
>>
>> I went digging to see similar cases.
>>
>>
>> Regarding the loader path, are you referring to this?
>>
>> $ chrpath $(which $CC)
>> /tmp/poky-sdk-master-00/sysroots/x86_64-pokysdk-linux/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc:
>> RPATH=$ORIGIN/../../lib
> No, I mean the dynamic loader pointer.
>
> $ tmp/sysroots-uninative/x86_64-linux/usr/bin/patchelf-uninative python3-native/python3.9 --print-interpreter
> [...]tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2
>
> Above I'm showing that a native binary in the build (python3-native)
> has the interpreter (dynamic loader) set to our uninative ld.so.
> The SDK is similar.
>
>> As the binary where the issue was sighted has this
>>
>> $ chrpath $(which cargo)
>> /tmp/rust-sdk-deploy-18/sysroots/x86_64-pokysdk-linux/usr/bin/cargo:
>> RUNPATH=$ORIGIN/../lib
>>
>>
>> but then, the DSOs have no rpath set, eg.
>>
>> $ chrpath
>> /tmp/rust-sdk-deploy-18/sysroots/x86_64-pokysdk-linux/usr/bin/../lib/libcrypto.so.1.1
>> /tmp/rust-sdk-deploy-18/sysroots/x86_64-pokysdk-linux/usr/bin/../lib/libcrypto.so.1.1:
>> no rpath or runpath tag found.
>>
>>
>> so it might lead to the interferrence with the host. Does it perhaps
>> need both $ORIGIN/../../lib and $ORIGIN/../lib if binaries are in /usr ?
> Our dynamic loader knows how to use the specific sysroot and then
> fall back to /usr and /lib.

Thanks a lot for explaining this.

Getting back to the initial case led to the question, i'm now able to 
check what is the correct dynamic loader:

$ tmp/sysroots-uninative/x86_64-linux/usr/bin/patchelf-uninative 
/tmp/rust-sdk-deploy-18/sysroots/x86_64-pokysdk-linux/usr/bin/cargo 
--print-interpreter
/tmp/rust-sdk-deploy-18/sysroots/x86_64-pokysdk-linux/lib/ld-linux-x86-64.so.2

and also could use --print-needed which would be similar to "readelf -d 
", but it'd be still not possible to check things at the runtime? OFC 
knowing what i know now, it's possible to locate the DSO and check 
symbols like this:

$ x86_64-poky-linux-objdump -T 
./sysroots/x86_64-pokysdk-linux/lib/libc.so.6 | grep GLIBC_2.33

just seems the catch points are quite subtle :) Perhaps there could be a 
recommendation on a good way validating the binaries in the SDK HOST part?

Thanks

Anatol



