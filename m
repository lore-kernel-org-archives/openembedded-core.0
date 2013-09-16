Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 34D586023B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 14:48:34 +0000 (UTC)
Received: by mail-la0-f49.google.com with SMTP id ev20so3154063lab.36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 07:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=z2JNXS1kGt7hd5dItgxcm8k9GT2JLTfpbwS2ZQ7aMo4=;
	b=LPBglaFaLo2f1lfR9fu0Gy85LY1yBWrCAmYss8pJdFacXJyneWSYIXrDgXQgEzrIRI
	1ergjeSZhAF0x2hdmoDs69Amm5tg7b7kXveB54cXG5UgIevE70vCQwyjs2Th0L6rDu2x
	aPhNnUQykK8ZiJE712RfZPptN9LCHCSgGDfs9P9Sf/MwFwmAajI/9TXbPF4I3BKl7Wq7
	rz9ykuQ8gICMBiEqcQNUdMrfwe2zNlrDK0MXMRo6zbNMNT7FvjICLiz+wAPhVq/tNLei
	49FZvjKAQHbf0Tfj11/r2PWbQJJLnvbSRRkX8g7+mWfW2L2uK/utQKXzL9/ozcn2AmtB
	s5oA==
MIME-Version: 1.0
X-Received: by 10.152.170.233 with SMTP id ap9mr72142lac.51.1379342915195;
	Mon, 16 Sep 2013 07:48:35 -0700 (PDT)
Received: by 10.112.12.103 with HTTP; Mon, 16 Sep 2013 07:48:35 -0700 (PDT)
In-Reply-To: <CAP9ODKo8-_pt9SQrNiBWvEsFxVyDPg8+bBsr-hN1DSxCRJX-kw@mail.gmail.com>
References: <1379295470-3444-1-git-send-email-otavio@ossystems.com.br>
	<5236AEF3.4000609@linux.intel.com>
	<CAP9ODKp2-Gj1PMuFuBft+5v4WWzMPWFjWkfnaasN8au+D1vM9A@mail.gmail.com>
	<CAP9ODKo8-_pt9SQrNiBWvEsFxVyDPg8+bBsr-hN1DSxCRJX-kw@mail.gmail.com>
Date: Mon, 16 Sep 2013 10:48:35 -0400
Message-ID: <CADkTA4MPHGhrHkD9vncY3KLmcmpQHRm8vitSOnJFzoyFFKtZdA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perf: Remove CFLAGS and LDFLAGS override
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
X-List-Received-Date: Mon, 16 Sep 2013 14:48:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Sep 16, 2013 at 9:53 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Mon, Sep 16, 2013 at 8:01 AM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
>> On Mon, Sep 16, 2013 at 4:10 AM, Saul Wold <sgw@linux.intel.com> wrote:
>>> On 09/15/2013 06:37 PM, Otavio Salvador wrote:
>>>>
>>>> The kernel build system does the right thing here and we should stop
>>>> overriding it. This code has been added based on a change from
>>>> 'meta-metro' layer, revision 9d698004137c1a888d40d6a4808d94afa22387e7,
>>>> without any information about what problem it fixes so I am reverting
>>>> it.
>>>>
>>>> Using the CFLAGS makes it impossible for kernel build system to append
>>>> to it, thus making the build fail in various ways as:
>>>>
>>>> |     CC /.../perf/1.0-r8/perf-1.0/perf.o
>>>> | In file included from builtin.h:4:0,
>>>> |                  from perf.c:9:
>>>> | util/util.h:74:24: fatal error: lk/debugfs.h: No such file or directory
>>>> |  #include <lk/debugfs.h>
>>>> |                         ^
>>>> | compilation terminated.
>>>>
>>>> Cc: Christopher Larson <kergoth@gmail.com>
>>>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>>>> ---
>>>>   meta/recipes-kernel/perf/perf.bb | 6 ------
>>>>   1 file changed, 6 deletions(-)
>>>>
>>>> diff --git a/meta/recipes-kernel/perf/perf.bb
>>>> b/meta/recipes-kernel/perf/perf.bb
>>>> index d2c1048..8d35fc6 100644
>>>> --- a/meta/recipes-kernel/perf/perf.bb
>>>> +++ b/meta/recipes-kernel/perf/perf.bb
>>>> @@ -72,13 +72,7 @@ EXTRA_OEMAKE = \
>>>>                 NO_GTK2=1 ${TUI_DEFINES} NO_DWARF=1 ${SCRIPTING_DEFINES} \
>>>>                 '
>>>>
>>>> -# We already pass the correct arguments to our compiler for the CFLAGS
>>>> (if we
>>>> -# don't override it, it'll add -m32/-m64 itself). For LDFLAGS, it was
>>>> failing
>>>> -# to find bfd symbols.
>>>>   EXTRA_OEMAKE += "\
>>>> -       'CFLAGS=${CFLAGS} -fPIC' \
>>>> -       'LDFLAGS=${LDFLAGS} -lpthread -lrt -lelf -lm -lbfd' \
>>>> -       \
>>>
>>> Maybe not, I got a compile error with this on the Autobuilder.
>>>
>>> http://autobuilder.yoctoproject.org:8011/builders/nightly-x86-64/builds/286/steps/Building%20Images/logs/stdio
>>
>> I only reproduce this error if I build with EXTRA_CFLAGS set. There
>> are no other changes in perf?
>
> I reproduced the error too. I am on it but still have no clue why it
> worked and now fails.

I've also reproduced it. Will report if I find anything interesting.
The problem is that
I don' t have Otavio's case to test against, so if we fix this, we'll
probably just re-break
his build.

Bruce

>
> Checking...
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

