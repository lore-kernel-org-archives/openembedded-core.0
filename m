Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 0CD036E908
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Feb 2014 14:36:28 +0000 (UTC)
Received: by mail-la0-f48.google.com with SMTP id mc6so3972335lab.21
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Feb 2014 06:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=eodXAmqDXDz0iKIPyslWK5EcZnEDXZuiBphEO1BhVr0=;
	b=cEX4fF8Aot4rt3I5cO9S0iYDnmu0UrrNhT9urzkfYiMIpUrwDQH690WyBibZvb5u4r
	FO3vfLjAW5NQHx8rZ4g+anqcN9dBxQ9GkNMmIY8LtsXu+M3fEA2em/JQvAwa/nDCCBr4
	LX6W11hO6Kojkof9iy+So1DQr/c7S8wN2HVZPHQQJO2tBTMs8mizgJqvIIE3ol39Ahvg
	VIx984gxgs1zwzcRl30mqbMzr7VTpfarxHUbz4y4GRL9F+161ik4hew0EnZV5glz45a+
	CmZwZ52mN9p8XYbaEbrcKCpDIaXZsO819YaI8zrGiP38XozyF448vE/kaClKTJZgn/at
	JZfg==
MIME-Version: 1.0
X-Received: by 10.112.134.38 with SMTP id ph6mr17307148lbb.16.1391956588365;
	Sun, 09 Feb 2014 06:36:28 -0800 (PST)
Received: by 10.112.170.166 with HTTP; Sun, 9 Feb 2014 06:36:28 -0800 (PST)
In-Reply-To: <1391947592.7120.0.camel@ted>
References: <cover.1391534980.git.bruce.ashfield@windriver.com>
	<8a4a98cc53998f6bbf08763359e1b560b2da3e54.1391534980.git.bruce.ashfield@windriver.com>
	<1391947592.7120.0.camel@ted>
Date: Sun, 9 Feb 2014 09:36:28 -0500
Message-ID: <CADkTA4P+zF=pPonakN+0EP+d7306RXXLWPcnexaOcvj9+ijssA@mail.gmail.com>
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
X-List-Received-Date: Sun, 09 Feb 2014 14:36:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Feb 9, 2014 at 7:06 AM, Richard Purdie
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
> I think this patch is resulting in:
>
> http://autobuilder.yoctoproject.org/main/builders/nightly-fsl-ppc-lsb/builds/22/steps/BuildImages/logs/stdio
>

Could be. I'll launch a build and see if it happens here as well.

Bruce

> Cheers,
>
> Richard
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

