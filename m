Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f172.google.com (mail-lb0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9379B6E954
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2014 00:35:21 +0000 (UTC)
Received: by mail-lb0-f172.google.com with SMTP id c11so7050791lbj.17
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Feb 2014 16:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=xunnC2t/4Ln3YrjkyEsVEPqTvm/XL4mds6JCYBf+5Qc=;
	b=FDylGywEyiTzIpdIUIRYn3144nCISkP2n1iMy+Xd3Aq9l2NJcmbhC/R4crl44Z65fL
	p59lYjGmCGwz/s0huWWTb4Ifr+BlzrfLCExcu0pKiPtqZWZBHPsaHXQBgUDVollxPxXb
	kgNDhX1JdCqm0HXRuWu9UFPtHTyOFVPwE+goDcWFsVyrtsbEsLgfC3y2CPCEdb5P/ObQ
	uFGxJc1BGGh0c0mgKzw1oZFhtyblR5gMJEsGVNVSmTTQEUc2FnRc9Pna7EmEoGtV1WsE
	X6wM6AW2yp05qb7E1TMuwXifuemvmEd8s5uiARWc06IAFSwOS1TdDwmqfs8EwVS+cH88
	O7Xg==
MIME-Version: 1.0
X-Received: by 10.112.72.170 with SMTP id e10mr17610lbv.43.1391560521282; Tue,
	04 Feb 2014 16:35:21 -0800 (PST)
Received: by 10.112.24.162 with HTTP; Tue, 4 Feb 2014 16:35:21 -0800 (PST)
In-Reply-To: <1391556415.15248.2.camel@ted>
References: <cover.1391534980.git.bruce.ashfield@windriver.com>
	<8a4a98cc53998f6bbf08763359e1b560b2da3e54.1391534980.git.bruce.ashfield@windriver.com>
	<1391556415.15248.2.camel@ted>
Date: Tue, 4 Feb 2014 19:35:21 -0500
Message-ID: <CADkTA4PeY8XL=h7xSsBVYXEBUx56_sTXjhPQ-sV0pjAQHvHrEQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] kernel: stop using -exec rm for deleting files
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
X-List-Received-Date: Wed, 05 Feb 2014 00:35:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 4, 2014 at 6:26 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2014-02-04 at 12:34 -0500, Bruce Ashfield wrote:
>> Removing files from the source tree via find, exec and rm is not the
>> most efficient operation, due to (among other things) the many forked
>> processes.
>>
>> If we use -delete, it saves a significant amount of time. But -delete
>> does not work with -prune (since it forces -depth). To maintain the
>> lib, tools and scripts source files, we can hide them temporarily,
>> skip their hidden directories and then finally restore them.
>>
>> Time for install before this change:
>>
>>  real    2m48.563s
>>  user    0m35.220s
>>  sys     0m33.036s
>>
>> Time for install after this change:
>>
>>  real    1m21.301s
>>  user    0m33.160s
>>  sys     0m28.388s
>>
>> We could further speed this up by using inline perl to delete the files,
>> but that complexity is avoided for now.
>>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> ---
>>  meta/classes/kernel.bbclass | 18 +++++++++++++++---
>>  1 file changed, 15 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index 51626b03f824..b76a65699755 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -260,9 +260,21 @@ kernel_do_install() {
>>       # we clean the scripts dir while leaving the generated config
>>       # and include files.
>>       #
>> -     oe_runmake -C $kerneldir CC="${KERNEL_CC}" LD="${KERNEL_LD}" clean
>> -     make -C $kerneldir _mrproper_scripts
>> -     find $kerneldir -path $kerneldir/lib -prune -o -path $kerneldir/tools -prune -o -path $kerneldir/scripts -prune -o -name "*.[csS]" -exec rm '{}' \;
>
> If we wanted to keep the single expression like this, we could do
> something like:
>
> find $kerneldir -path $kerneldir/lib -prune -o -path $kerneldir/tools -prune -o -path $kerneldir/scripts -prune -o -name "*.[csS]" -print0 | xargs -0 rm -f
>
> ?
>
> I don't have strong feelings about it, I'm just curious if you tried it
> really. The xargs should batch things up enough that the fork overhead
> is much less.

I did try xargs, and a few other things in between. I had a 7 hour plane flight
to look into this (and packaging overhead .. that's next) and I tried
a few other
techniques. As I hinted in my commit message, the fastest is to actually
locate the files with perl and calling unlink() directly .. but that's
even more of
a departure from what we had before :)

find, prune and friends get so unreadable, that when I found the faster way, I
tossed them in the bin and didn't look back!

Cheers,

Bruce

>
> Cheers,
>
> Richard
>
>
>> +     oe_runmake -C $kerneldir CC="${KERNEL_CC}" LD="${KERNEL_LD}" clean _mrproper_scripts
>> +
>> +     # hide directories that shouldn't have their .c, s and S files deleted
>> +     for d in tools scripts lib; do
>> +             mv $kerneldir/$d $kerneldir/.$d
>> +     done
>> +
>> +     # delete .c, .s and .S files, unless we hid a directory as .<dir>. This technique is
>> +     # much faster than find -prune and -exec
>> +     find . -not -path '*/\.*' -type f -name "*.[csS]" -delete
>> +
>> +     # put the hidden dirs back
>> +     for d in tools scripts lib; do
>> +             mv $kerneldir/.$d $kerneldir/$d
>> +     done
>>
>>       # As of Linux kernel version 3.0.1, the clean target removes
>>       # arch/powerpc/lib/crtsavres.o which is present in
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

