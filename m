Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id 81DF060C8A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2020 16:16:14 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id r18so2768370edl.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Feb 2020 08:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fDGhLyJlVxqAyJqGxKsIvdPhzby4EXL9a+5mYgsSDMo=;
	b=t5LOIdxdh36+GksCq7giQ30Ijgsh7oB6LPEywCcf4lkBOMDEST7jscIbs0nnsam3Yq
	MS2FQcLpWLc0TMBaqgNpWcYG+jIr5+dZvUvE9xKo4mQ1CGB4trzwidlFDEDn1d/1Trhh
	2liMrcJfvIMQm7F/fSDbvoqfFRufKAoIq0SKG22jros7Yo2raoYKzBD2/TgPfDjNGuen
	NMVv4MzJp4yHPry3p0G7sYf2EBo8J7kP2vahQEOLOOVTpqDypDzV0DOzn12UlHNorLb8
	c1XusWz6+DCiHxMDif79uT4Qr5m2J3RlT6EBrAMmIMrssIBIqTWJSF0Wf/QDmh7617+g
	7O3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fDGhLyJlVxqAyJqGxKsIvdPhzby4EXL9a+5mYgsSDMo=;
	b=fx38hy7VHnH+R8dS77Sh1To2S1T0Ra2i+HFrJoNA206aKVcSbLq5xS/Ki3JFNr07zD
	VbhQCu1EMVPeNNQx21Ghd6IuqyWW6wSSEXKH+WiS77+KLMPnQjOmhbUnnR5Lf3YpkNk0
	HcXBf5/sMo9+YQd0Jhgg1dhCvc3D5RgazynQJDAvPsf47s/4mC+5gFL1MtfRG4HnBvDH
	NG1t2IwtiNAQ3LS4Mo+LE3308G9uOo2vjkGzmMXC8FtSL4RCh7+hSee7dvL9ZQJLp3Th
	+2mrRSaMA5LRCDVKfpU6x3O1snmrn05cCaZQx+V0x48MLo4feYzvwgdfaSofZ80f/bcw
	QBxQ==
X-Gm-Message-State: APjAAAXjq8rpYXRsmaSG9VMmUMP71Zt0xlXQ/y2GQCKr03BzoW1fe5en
	kBipfjv/FTKca9IuYNSUkOeO3JWMUdjW+/Dr1qg=
X-Google-Smtp-Source: APXvYqxkit/1P9VCtXWxXUVCJAHyvLsHnB0BvQ4FILCPdHuXudQavKIJuaiOVlck84WtJ9EpyVgPFCI/X5Wtng51IFU=
X-Received: by 2002:a50:aacd:: with SMTP id r13mr5407184edc.129.1580919375022; 
	Wed, 05 Feb 2020 08:16:15 -0800 (PST)
MIME-Version: 1.0
References: <20200203212641.57611-1-bruce.ashfield@gmail.com>
	<20200203221142.7jljrrrjxic3qtau@jama>
In-Reply-To: <20200203221142.7jljrrrjxic3qtau@jama>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 5 Feb 2020 11:16:03 -0500
Message-ID: <CADkTA4OjZmkVYbiuZ_GpLSUb25dqOGQPKR=ogEvtasBUpkYO0w@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kern-tools: tweak symbol_why to be python safe
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
X-List-Received-Date: Wed, 05 Feb 2020 16:16:14 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 3, 2020 at 5:11 PM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> On Mon, Feb 03, 2020 at 04:26:41PM -0500, bruce.ashfield@gmail.com wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Updating the SRCREV to pickup tweaks to symbol_why.py to be
> > python3 safe:
> >
> >   - we explicitly call /usr/bin/env python3
> >   - we full specifiy our symbols
> >   - do not assume that 'None' can be converted to a string
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >
> > I didn't realized the v5.4 series had gone in, or I would have
> > send this sooner. This should resolve the errors that are thrown
> > when symbol_why is run to detect missing symbol dependencies.
> >
> > Bruce
> >
> >  meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> > index a4c0b6fb8a..57ec1abc6d 100644
> > --- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> > +++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> > @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=9c30e971d435
> >
> >  DEPENDS = "git-native"
> >
> > -SRCREV = "7465c8497893ef8f6503c918aeede969f7e9753b"
> > +SRCREV = "5358eb293399867db05fd73d04ce908d69a03bed"
> >  PR = "r12"
> >  PV = "0.2+git${SRCPV}"
>
> This needs a bit more cleanup for python3.

Martin,

I've got builds and tests running on the rest of the patches that have
come in recently, and I wanted to loop back to this one.

I'm dropping into a devshell and running the symbol_why.py script
using python3 from the sysroot and I didn't see the same issues (But I
do have changes for what's in your log).

I'll double check once my build churns through the queued patches
here, but I thought I'd check with you to see if you are still seeing
this with the various fixes for the gold linker you've pulled together
? I'm guessing that now that it isn't aborting early, the warnings
aren't triggering and hence it isn't even running (like it was in my
runs), so you can't say one way or the other,

I'm mainly interested to hear if it was a host python3 or the
sysroot-native one that was tossing those errors, so I can detangle my
last changes and test in a similar env.

Cheers,

Bruce

>
> DEBUG: Executing python function do_kernel_configcheck
> Traceback (most recent call last):
>   File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 2776, in _expand_macro
>     res += args[int(new_args[0])]
> ValueError: invalid literal for int() with base 10: 'error-if'
>
> During handling of the above exception, another exception occurred:
>
> Traceback (most recent call last):
>   File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/recipe-sysroot-native/usr/bin/symbol_why.py", line 295, in <module>
>     conf = kconfiglib.Kconfig( kconf, show_errors, show_errors )
>   File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 947, in __init__
>     self._init(filename, warn, warn_to_stderr, encoding)
>   File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 1085, in _init
>     self._parse_block(None, self.top_node, self.top_node).next = None
>   File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 2982, in _parse_block
>     prev = self._parse_block(None, parent, prev)
>   File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 2907, in _parse_block
>     while self._next_line():
>   File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 2234, in _next_line
>     self._tokens = self._tokenize(line)
>   File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 2364, in _tokenize
>     self._parse_assignment(s)
>   File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 2604, in _parse_assignment
>     s, i = self._expand_macro(s, i, ())
>   File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 2780, in _expand_macro
>     res += self._fn_val(new_args)
>   File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 2843, in _fn_val
>     return py_fn(self, *args)
>   File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 6769, in _error_if_fn
>     kconf.filename, kconf.linenr, msg))
> kconfiglib.KconfigError: scripts/Kconfig.include:39:  gold linker 'x86_64-oe-linux-ld --sysroot=/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/recipe-sysroot  ' not supported
> Traceback (most recent call last):
>   File "/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/recipe-sysroot-native/usr/bin/kconfiglib.py", line 2776, in _expand_macro
>     res += args[int(new_args[0])]
> ValueError: invalid literal for int() with base 10: 'error-if'
>
> During handling of the above exception, another exception occurred:
>
> and the log is full of this (the warnings at the end look the same as before)
>
> # wc -l /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/temp/log.do_kernel_configcheck.28364
> 11804 /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/linux-yocto/5.4.15-r0/temp/log.do_kernel_configcheck.28364
>
> Maybe kernel_configcheck now needs KERNEL_LD exported as well? See:
> https://patchwork.openembedded.org/patch/169702/
> which fixed do_configure with 5.4.



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

