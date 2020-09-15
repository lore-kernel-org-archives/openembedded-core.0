Received: from smtp0.taitradio.net (smtp0.taitradio.net [202.37.96.22])
 by mx.groups.io with SMTP id smtpd.web10.2860.1600130533522437209
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 17:42:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: taitradio.com, ip: 202.37.96.22, mailfrom: douglas.royds@taitradio.com)
Received: from [10.200.20.196] (unknown [10.200.20.196])
	by smtp0.taitradio.net (Postfix) with ESMTP id B7D3C22027A;
	Tue, 15 Sep 2020 12:42:09 +1200 (NZST)
Subject: Re: [OE-core] nativesdk-linux-libc-headers with two different MACHINEs
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <08f090d6-65c6-da98-ac7f-a2bc803c805a@taitradio.com>
 <CAMKF1soFHoBkMBQTtp7YXjxgzy1uyQQS=CePsOrOf_9BWV5chA@mail.gmail.com>
From: "Douglas" <douglas.royds@taitradio.com>
Message-ID: <2bc4eb24-82e0-2638-f204-1be9fa9c3aac@taitradio.com>
Date: Tue, 15 Sep 2020 12:42:09 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1soFHoBkMBQTtp7YXjxgzy1uyQQS=CePsOrOf_9BWV5chA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB

Yes it did, thanks!


On 15/09/20 12:31 pm, Khem Raj wrote:

> I think MACHINE should not matter for nativesdk packages. Does
> something like this work
>
> diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
> index 7f2692c51a..bb1dfd84c0 100644
> --- a/meta/classes/nativesdk.bbclass
> +++ b/meta/classes/nativesdk.bbclass
> @@ -10,7 +10,7 @@ LIBCOVERRIDE = ":${NATIVESDKLIBC}"
>   CLASSOVERRIDE = "class-nativesdk"
>   MACHINEOVERRIDES = ""
>   MACHINE_FEATURES = ""
> -
> +MACHINE = "${SDKMACHINE}"
>   MULTILIBS = ""
>
>   # we need consistent staging dir whether or not multilib is enabled
>
> On Mon, Sep 14, 2020 at 5:13 PM Douglas via lists.openembedded.org
> <douglas.royds=taitradio.com@lists.openembedded.org> wrote:
>> For the experiment, I wanted to see whether I could achieve no task signature change when building nativesdk-glibc for two different MACHINEs, but I found that the do_install sigdata for nativesdk-linux-libc-headers changed. We're installing the linux-libc-headers for the build machine, so it seems to make sense to take control of the TARGET_CC_KERNEL_ARCH:
>>
>> diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
>> index 32c3aa32ad..655439dd73 100644
>> --- a/meta/classes/nativesdk.bbclass
>> +++ b/meta/classes/nativesdk.bbclass
>> @@ -47,6 +47,7 @@ TARGET_VENDOR = "${SDK_VENDOR}"
>>   TARGET_OS = "${SDK_OS}"
>>   TARGET_PREFIX = "${SDK_PREFIX}"
>>   TARGET_CC_ARCH = "${SDK_CC_ARCH}"
>> +TARGET_CC_KERNEL_ARCH = "${SDK_CC_ARCH}"
>>   TARGET_LD_ARCH = "${SDK_LD_ARCH}"
>>
>> Which leaves me with:
>>
>> basehash changed from 42ed3480096bb7ea53b60dc876da0613 to 38ea60bdac041673f2c491d7bbabe17c
>> Variable MACHINE value changed from 'qemuarm' to 'qemux86-64'
>> runtaskdeps changed:
>> linux-libc-headers/linux-libc-headers_4.18.bb.do_compile:virtual:nativesdk with hash cbb186fe33cd69cb0b06384e4d50a244
>>   changed to
>> linux-libc-headers/linux-libc-headers_4.18.bb.do_compile:virtual:nativesdk with hash 4d34d6981b79d0fccc768566bf2fa533
>> Hash for dependent task linux-libc-headers/linux-libc-headers_4.18.bb.do_compile:virtual:nativesdk changed from cbb186fe33cd69cb0b06384e4d50a244 to 4d34d6981b79d0fccc768566bf2fa533
>>
>> The configure and compile tasks for linux-libc-headers are both set to noexec. For the experiment, I added an empty do_configure task, with this result on the do_configure sigdata:
>>
>> basehash changed from f13c2a2066fa48f0ccac35c085537c71 to bb13f2b1b1e7e6666376f3fb5a8ec888
>> Variable MACHINE value changed from 'qemux86-64' to 'qemuarm'
>>
>> What to do? Why is the MACHINE variable included in the task signature (it is unset in run.do_configure)? Adding it to BB_HASHBASE_WHITELIST had no effect. What am I missing here?
>>
>> 


