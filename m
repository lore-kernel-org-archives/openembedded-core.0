Return-Path: <christoph.lauer@email.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44EABC43334
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 22:26:12 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by mx.groups.io with SMTP id smtpd.web11.15355.1657664770302544293
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 15:26:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=RfmhSuDX;
 spf=pass (domain: email.de, ip: 212.227.15.4,
 mailfrom: christoph.lauer@email.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
	s=dbaedf251592; t=1657664767;
	bh=/8sTFgULB4+ko0FFUKphWn2KRKjKvPmm7TbJc1iBhL8=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
	b=RfmhSuDXXXBpK790YmpgjkAy+TygZrJOvL1tqgLwJ4el1sqazU0KTHigud8wj2rYn
	 YNCQaeAsq4UCpw7lnwh1qbNFndmHWL65wZUULlHqSiJbLc73Ec+espMm4GQ4Dk9tZH
	 Udx7rTfjH7SQuNB1O1LjQh5nv6ILngvmdnos6724=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [172.18.0.93] ([178.251.90.190]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M6HG8-1oDaBL08fA-006l6k; Wed, 13
 Jul 2022 00:26:07 +0200
Message-ID: <2d8feee3-6745-a5bb-8650-314c527c0c40@email.de>
Date: Wed, 13 Jul 2022 00:26:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [OE-core] [PATCH] package.bbclass: Avoid stripping signed kernel
 modules in splitdebuginfo
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Christoph Lauer <christoph.lauer@xtronic.de>
References: <20220710153638.61096-1-christoph.lauer@email.de>
 <ac55c4c365dec2b3dcc4e1d664a176b0f71a08d0.camel@linuxfoundation.org>
From: Christoph Lauer <Christoph.Lauer@email.de>
In-Reply-To: 
 <ac55c4c365dec2b3dcc4e1d664a176b0f71a08d0.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nMXEVaLOPfRE6ivJPf9FPx6N5bS6tVlySmAK/3mH/DR2G5jIXVo
 vo10FOQ+A0jPdzGvrE0ddsWo9Jhe9+hdFZO/5ZD0mfZ5EZL4skDlu1kywLmMqtVGErWDY0L
 faUI5xA0KuWniFTD1Vuzyj+Bm459+Mhj0gQbhNR6W2QskQCMd11fzXRPmfTTpp6JL0kltWA
 lWg+Ys9PVa0MfCQcnfEqg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GcmKez/FesU=:iH+FPUqPbGuYH+ACS/f5+C
 RTif4JXioIXilvYwbcppro/VdN0VDqTYBP6YUgxh9r9S9FFsvfECL8IGRyJiw1Bn38SM6CwEl
 zbeO3Q+ljkqcd+so0p+iojAiH3H16zX3wdKsy27Kbs8t6OBPyA1mvm6aOjAX1fl1lMf1tg/r7
 uUg5sOPuHRsPlWkwKJJK3EM3ijnHbP3vt+uMejbqH9OM0HAKEuXMHgH8Vn2EHI29VRxKO35DF
 f+IBwg94tqvKe7Mq6rPw7UmOIRQNbmDW7VwyPUy8UnyFWUmOIhK4NiWfPjQa0P3ujNe5Uuh83
 15w4mgfxx9cdtExzWqmhRIrP8KdqXzuwDw9vp99IeYkqn3ecKgaJ+CXHJUSi5Ob3eGsQAMuTU
 mCavrTwCnlJzyVJzrPkuGrd1A90z2nr7/3gxRR4pw8Ap3rmUf9pkyfX+dWUmF9CXmuZN68qxN
 uTMA2p58xHw5FC+JbrglXsvdu1cmtihCczJLbvkfQ8mkHPN+B+dAu9qIi4S70KYdLPB8MSVT3
 e3Ps5wPnRc1Vva3kCnXKbF8zmIGSsM9enOTk0aW5ZC2/SbRV2pLYRfYtzWoDzeBZ11gADw8AN
 N9Bt8j57Yv7ItXYs8BZblRB5MXTEUdC4QY/a++CfLAODq68SsGSwSBG+PEJNiS8o1F1pD9Nhi
 W2K8FPRJvN2ICGZ7FJDmGR2ulBeOgnuAb73J+w8AsHTdlc1Vn2+LTVpIdW+Dz+/yYRf0txqwC
 JvBHYEAAFmOxUKl+aC76shg2LzSP1zUwKejHWDMLIr9ByhK/eEXg2rZKWRMhl6mfv6yXRVoLI
 DnTWvTCRVaMc1yYOED+lKKXzGsLWsczhxFMuRgn+gVyXFy+Wem8KnWd/iKhOfooLCrNLmMH5l
 pY/RA7SEJb2yCZ7ydIPrx8+QTTg6bR+qWdeq5LZDnMoocncXb0H6P0dG8gyYoo1CO3zOQPxCV
 6UefOv8NXhvKnH+NOnLeXYCHh4sDUYwPaCit5u7NSd23wx1uITWz3HLeOkL0Qk7YRn2sFr8B8
 9erPpCqb9L2OCkXjCqWI2ShlTiwwhjm7MeVfCo5DqRs/OQIKblo9fg9SmejFZnYwrseNf/LSj
 vi8R/fMiEvwAY/2IvFphFwrni+G7CSOC+HdljYz0Wd8CZSK3g4f2J6BKQ==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 22:26:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167944

Thank you for your input. The package function 'is_elf' can perform the
check if the current file is a kernel module. I will add another
condition to the patch.

Am 11.07.22 um 10:29 schrieb Richard Purdie:
> On Sun, 2022-07-10 at 17:36 +0200, Christoph Lauer wrote:
>> From: Christoph Lauer <christoph.lauer@xtronic.de>
>>
>> Since commit d756b346f248df47b0540644adb1d0f17bcc4b6e kernel modules ar=
e stripped by the functions 'runstrip' and 'splitdebuginfo'. Signed module=
s must not be stripped. Function 'runstrip' avoids this by running is_kern=
el_module_signed. Apply the same check to splitdebuginfo.
>>
>> Signed-off-by: Christoph Lauer <christoph.lauer@xtronic.de>
>> ---
>>   meta/classes/package.bbclass | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclas=
s
>> index 4850134022..5328c6bc8b 100644
>> --- a/meta/classes/package.bbclass
>> +++ b/meta/classes/package.bbclass
>> @@ -382,6 +382,10 @@ def splitdebuginfo(file, dvar, dv, d):
>>       debugfile =3D dvar + dest
>>       sources =3D []
>>
>> +    if oe.package.is_kernel_module_signed(file):
>> +        bb.debug(1, "Skip strip on signed module %s" % file)
>> +        return (file, sources)
>> +
>>       # Split the file...
>>       bb.utils.mkdirhier(os.path.dirname(debugfile))
>>       #bb.note("Split %s -> %s" % (file, debugfile))
>
> This isn't as simple as it may first appear. That is going to do open()
> and read() calls on many files which aren't kernel modules and it will
> impact the speed of the do_package task for recipes with large numbers
> of files (perl, ltp and so on).
>
> Cam we use the filename to limit which ones we scan a bit?
> Even=C2=A0something like:
>
> if ".ko" in file:
>
> would help a lot but I'm not sure that covers everything.
>
> Cheers,
>
> Richard
>

