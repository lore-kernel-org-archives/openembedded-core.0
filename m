Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8690660172
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2020 22:22:37 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id m13so17808908edb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Feb 2020 14:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=x0xoeRI+qjx5pu1DrPXl4BiKjuYgsCohiYxTADAc844=;
	b=tYoq+i/7KftL+BsAjpiZezHvU4WI79arUD/M2kgksJwoE3g88tpWX7S1jkONkmb9ey
	Hi9wggOlxuXW78DbkokxT0yuuq+RyU6e7NsGv29J8iOgf7CofGeCr8Ps0nYja6luB+gg
	npJr+h4/6r4zynMP8h3iQS81dQ58ckzYEonDrMIWeRtCMSpGrU5gk+OxIGQ4INg2g4He
	vLPhL84gOrW9g8zNzDF6eDnRaXEWDZPHhOugbFe0RPb1nFW4ci1f6QMUbgrrvheXl8vQ
	S3hJcuw8XjBg9v7b4zhVXxfSj2/YoM10Qx13AEkdvL5Oy9c4m/gaOe/SDC5WC4e1Pbhz
	85pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=x0xoeRI+qjx5pu1DrPXl4BiKjuYgsCohiYxTADAc844=;
	b=FLCox3Fzu8460Hbfu3qrTybQEJpsFoWApJvbfneruIvvMK7DMykuq4lDTQLQWYr0+j
	1dbAilB+wVmYlx6pss/YjNNoJ/Hhar+5on+/7oIrXIyURu74eknudRSy+HuQFo/mGBuL
	yoir9lzkhbPKrs9QowMqjAdB5Nrb166pV827TJS9baoh7XRnWuuEV8DKM3lC4A6j39Q+
	zZHUq4xn7NbfeOLlfjCu7EQCvjRK5E+ad+sc4RiG7FKZCu3O+AI98I05kJBEvsV9a1Fg
	EVQYvvIUzVFefuZm6m0JB48mqXA+2T0hbQ34H0oU7sWpH8Dpj3LEAMtoQBQ/TBsmuJ/G
	GpKg==
X-Gm-Message-State: APjAAAW0Q04LfpT6/BEhu72Ww9MvAzGEpfRJci/VxuyK8XAAvJOPz+aT
	E8ddWgncQMmdhWJzE4ojISKUwwpbk46eIDmo6IE=
X-Google-Smtp-Source: APXvYqzhG4O2Oe8Ux8i7CeUo8w1kCt+mqvnC5vndmgDqmx1MZaoSUNj5EDYbBiodsV/AOR8ymltxINSwVlxLXM9rjGY=
X-Received: by 2002:a50:ee8d:: with SMTP id f13mr13838760edr.347.1580768558054;
	Mon, 03 Feb 2020 14:22:38 -0800 (PST)
MIME-Version: 1.0
References: <20200203212641.57611-1-bruce.ashfield@gmail.com>
	<20200203221142.7jljrrrjxic3qtau@jama>
In-Reply-To: <20200203221142.7jljrrrjxic3qtau@jama>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 3 Feb 2020 17:22:26 -0500
Message-ID: <CADkTA4M=ZpOR6bOnSA2n2tS4UB2vRYuzHHDUcdjOMNK+e3z+EA@mail.gmail.com>
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
X-List-Received-Date: Mon, 03 Feb 2020 22:22:37 -0000
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
>

That's strange, it works fine under python3 here. I have a few more
scattered changes that i can't detangle right now.

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

I'm running it fully against v5.4 here, and it is working fine. But I
have enough debug through things, that I can't get them cleaned up
now, since I have to be up for a flight in a few hours.

What board are you building ? Because none of the warnings you are
seeing should be coming out, since I've cleaned all of those options
.. so there's some other mismatch going on.

Cheers,

Bruce


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

