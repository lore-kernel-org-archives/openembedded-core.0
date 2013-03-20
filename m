Received: from mail-bk0-f54.google.com ([209.85.214.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1UILEv-0005va-Jk
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 16:47:54 +0100
Received: by mail-bk0-f54.google.com with SMTP id w5so958432bku.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2013 08:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=3TAiLBAQdOwDttYG/2Syc5mIJeZeUQa78P0qP88apMs=;
	b=hwGhP7qR+MXXw6NkYVCRaE++3CSbrdWV6xSZQ7vruj6/FsZ2xCvbKMhg1nCmaqCsFV
	aUC0Us92j4bfSXAspWrTXRXQk022x2Rx5o/YyZTQvHqympV3cUMgqc5DLm0AnPqicNH9
	bAXsQ0zS5ExjH5r+HD4IhbVR8Oe33S2Ee/FBZFtfutbBCvu2nxBLU0FZqqkadPBpa9Ql
	LLOP7ZnXMz5H8C4Oc3rb/xIkfa4LTdiMzwlZWJgGHvKUIvdpT8HZkvcYGVFBflf0Y61Z
	VC0UdIB6XVICdEI7ut1Jp1/UL9x0KduqnhuwXgq+wjDF24ycodaQsRaevfJ937BIrqR1
	Szqg==
MIME-Version: 1.0
X-Received: by 10.112.49.35 with SMTP id r3mr9750719lbn.95.1363793454179; Wed,
	20 Mar 2013 08:30:54 -0700 (PDT)
Received: by 10.112.61.3 with HTTP; Wed, 20 Mar 2013 08:30:54 -0700 (PDT)
In-Reply-To: <CAEUf8FtQUc-pTOMb=yYtcjjUF7F=0ytN=OT-Y2Am71+v_oJGnA@mail.gmail.com>
References: <1363785756-35510-1-git-send-email-anders.roxell@gmail.com>
	<CADkTA4MZoRJp5gddPpkhKHkSXphettB=B4Fx=f0NPmtzfnGWGw@mail.gmail.com>
	<CAEUf8FtQUc-pTOMb=yYtcjjUF7F=0ytN=OT-Y2Am71+v_oJGnA@mail.gmail.com>
Date: Wed, 20 Mar 2013 11:30:54 -0400
Message-ID: <CADkTA4NitxAbPH-Nb=67ZwboTBFPUCMNXTQLMCYzQ2dL_On8hQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Anders Roxell <anders.roxell@gmail.com>
Cc: Anders Roxell <anders.roxell@enea.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-kernel-base: linux/version.h path update for 3.7-rc1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Mar 2013 15:47:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Mar 20, 2013 at 10:55 AM, Anders Roxell <anders.roxell@gmail.com> wrote:
>
>
>
> On Wed, Mar 20, 2013 at 2:42 PM, Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
>>
>> On Wed, Mar 20, 2013 at 9:22 AM,  <anders.roxell@gmail.com> wrote:
>> > From: Anders Roxell <anders.roxell@enea.com>
>> >
>> > In mainline kernel 3.7-rc1 (hash:abbf1590de22a6d22)
>> > The path include/linux/version.h was updated to
>> > include/generated/uapi/linux/version.h
>>
>> It's true that uapi now holds the generated version.h, but what build
>> error were you seeing without this change in place ?
>
>
> We were trying to build linx
> (http://linx.sourceforge.net/linxdoc/doc/index.html)
> Please let me know if it is better to rewrite linx or include this patch?

My concern is that as a list of alternatives builds up over time, that don't
necessarily use the same format of the linux version, you'll end up with
applications that are making the wrong decisions if a fallback is used. Having
a clear public / exported file, and throwing errors if it doesn't exist would
ensure consistent behaviour (granted annoying if you get the error when you
think you shouldn't).

If you look at the code in get_kernelversion() it shouldn't even work if
version.h is used versus utsrelease.h.  I'd be inclined to suggest the
removal of the existing version.h fallback, versus adding another.

You might not even need to modify the application code to fix this. What
are the dependencies of your recipe that would allow for utsrelease.h
to not be generated when the build calls get_kernelversion ?

Cheers,

Bruce

>
> Regards,
> Anders
>
>>
>> utsrelease.h is
>> still created where it has been for some time, and should be what is
>> typically used for any version checks.
>>
>> Cheers,
>>
>> Bruce
>>
>>
>>
>> >
>> > Signed-off-by: Anders Roxell <anders.roxell@enea.com>
>> > ---
>> >  meta/classes/linux-kernel-base.bbclass |    3 +++
>> >  1 files changed, 3 insertions(+), 0 deletions(-)
>> >
>> > diff --git a/meta/classes/linux-kernel-base.bbclass
>> > b/meta/classes/linux-kernel-base.bbclass
>> > index 4f2b0a4..b7d0ffa 100644
>> > --- a/meta/classes/linux-kernel-base.bbclass
>> > +++ b/meta/classes/linux-kernel-base.bbclass
>> > @@ -8,6 +8,9 @@ def get_kernelversion(p):
>> >          fn = p + '/include/generated/utsrelease.h'
>> >      if not os.path.isfile(fn):
>> >          fn = p + '/include/linux/version.h'
>> > +    if not os.path.isfile(fn):
>> > +        # after 3.7-rc1
>> > +        fn = p + '/include/generated/uapi/linux/version.h'
>> >
>> >      import re
>> >      try:
>> > --
>> > 1.7.5.4
>> >
>> >
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end"
>
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


