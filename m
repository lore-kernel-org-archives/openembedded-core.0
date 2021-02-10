Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web10.2571.1612942686697874202
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 23:38:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZfwlPnca;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id x3so906105qti.5
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Feb 2021 23:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wXj4skWvgtofwE1SQWjlUAD6sdulom+7oan0hca5afo=;
        b=ZfwlPncadd+LACJ+/32QBuJEgZw8d/UeIX3lkY30zR9gvcwWytBBNjUnjquDe4s8ti
         PD3630Bls6SjnOXpNGOQF0+sfSSdYUOcRkJAGPfv9793Bsv6Rbu6nD9fbryBnhEmqI2x
         hTYchwELj+bnuntQD1XDaAaCmGWVV3yyJvxc/1V6hFVrU/wmsxVgkfgje/61MOlRn2Tv
         fMPuEy6d5TeRwCK7ru3aiVnC240uYTS8CoxYH5WfODcvB/fFpKmWyAM6UORP/jtr+fvi
         bXw27wsxvolFNSOfI13/r7hSW8GbYjhXxaw/Zi9EDuMx2CZskIcrsUwmRhJq4rOZp4YC
         doAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wXj4skWvgtofwE1SQWjlUAD6sdulom+7oan0hca5afo=;
        b=WWh2HeuUJ+//w7/zSNXWuHP12Lxc7brg02j4H01TFX31LDvqajAKfD6/jzZUzSyur6
         FNialdGNlaDAa526QiQKIr5xljvSBVw90EJDtpo5ScVnmDGeuYkeNgek0U5L2lj3aRrK
         TsCMMuRx6etk5eXWZC71U8R5fmAQpC2oVvKR7VXwu7qMqQZPjC0+6DeS+j4EWaQZBYXZ
         RJ8z6maHg85Q3h4297TDUCTPvAEMJ6EN98d03cFNHECkOenX4IfXFGuetTow7yGGfFJl
         J3U6TgAd+Ka/ByP0sKmgH2Xjff9ExeVgXxr0LpAgjdNYT+z14DFHxJ1Exqe02F01Ce8g
         ClbA==
X-Gm-Message-State: AOAM532j68jXm9jTTNDc074zqOf7+1SHmN9RAg1Hy3KlLVTKAO1nkVzh
	WN46V9WYRFBWUe+Ae2ym8F9hEkvNWiifnanrpvM=
X-Google-Smtp-Source: ABdhPJwqZNQdFOHnr9jxlgI7fZ80WkCxv1i1ZUi6woAlR+5LvkpawG8BRX6P0xFLGi5zgcqfNYcW+L+d7MzUG0sA3Oc=
X-Received: by 2002:ac8:5bd1:: with SMTP id b17mr1640205qtb.53.1612942685737;
 Tue, 09 Feb 2021 23:38:05 -0800 (PST)
MIME-Version: 1.0
References: <20210206063138.1649019-1-raj.khem@gmail.com> <3b2c317d565d09bda89eacb05002ef1f0d816c6c.camel@intel.com>
In-Reply-To: <3b2c317d565d09bda89eacb05002ef1f0d816c6c.camel@intel.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 9 Feb 2021 23:37:39 -0800
Message-ID: <CAMKF1so+8XcjgVUjSbn3ph1ZMRQRjnLQbq4na9WNEfTT_TPwuQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] security_flags.inc: Use -O with -D_FORTIFY_SOURCE
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 9, 2021 at 8:47 PM Mittal, Anuj <anuj.mittal@intel.com> wrote:
>
> On Fri, 2021-02-05 at 22:31 -0800, Khem Raj wrote:
> > compiler can only use fortify options when some level of optimization
> > is
> > on, otherwise it ends up sending some warnings.
> >
> > warning: _FORTIFY_SOURCE requires compiling with optimization (-O) [-
> > W#warnings]
> >
> > this is usually OK, since -O<level> would be added via CFLAGS to
> > compiler cmdline in normal compile stages, however during configure
> > there are problems when CC,CPP,CXX are probed alone in configure
> > tests
> > which results in above warning, which confuses the configure results
> > and
> > autotools 2.70+ detects it as error e.g.
> >
> > configure:17292: error: C preprocessor "riscv32-yoe-linux-clang -
> > target riscv32-yoe-linux      -mlittle-endian -mno-relax -Qunused-
> > arguments -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -
> > Wformat-security -Werror=format-security --
> > sysroot=/mnt/b/yoe/master/build/tmp/work/riscv32-yoe-linux/ndpi/3.4-
> > r0/recipe-sysroot -E" fails sanity check
> > See `config.log' for more details
> >
> > therefore adding a -O ( which actually is -O1 ) to lcl_maybe_fortify
> > means we can properly test these configure tests and real -O<level>
> > will
> > still override -O added here, so overrall behavior improves
>
> gcc man page says that the last specified O option will take effect.
>
> In case of ncurses for example using poky:
>
> x86_64-poky-linux-gcc -m64 -march=skylake -mtune=generic -mavx2 -
> mfpmath=sse --sysroot=/home/anmitta2/work/poky/build/tmp/work/skylake-
> 64-poky-linux/ncurses/6.2-r0/recipe-sysroot -DHAVE_CONFIG_H -
> I../ncurses -I. -I../../../git/ncurses -I../include -
> I../../../git/ncurses/../include -D_FORTIFY_SOURCE=2 -D_DEFAULT_SOURCE
> -D_XOPEN_SOURCE=600 -DNDEBUG -O2 -pipe -g -feliminate-unused-debug-
> types -fmacro-prefix-
> map=/home/anmitta2/work/poky/build/tmp/work/skylake-64-poky-
> linux/ncurses/6.2-r0=/usr/src/debug/ncurses/6.2-r0
> -fdebug-prefix-map=/home/anmitta2/work/poky/build/tmp/work/skylake-64-
> poky-linux/ncurses/6.2-r0=/usr/src/debug/ncurses/6.2-r0
> -fdebug-prefix-map=/home/anmitta2/work/poky/build/tmp/work/skylake-64-
> poky-linux/ncurses/6.2-r0/recipe-sysroot=                      -fdebug-
> prefix-map=/home/anmitta2/work/poky/build/tmp/work/skylake-64-poky-
> linux/ncurses/6.2-r0/recipe-sysroot-native=  -fstack-protector-strong -
> O -Wformat -Wformat-security -Werror=format-security --param max-
> inline-insns-single=1200 -fPIC -DUSE_TERMLIB -c
> ../../../git/ncurses/tinfo/doalloc.c -o ../obj_s/doalloc.o
>
> I see -O after -O2 so is O2 really taking effect?

In this case -O  will take effect sadly. and it seems to be that
autconf munges the compiler cmdline
while generating CFLAGS in generated Makefiles and appends the value
of -On coming from CC
variable last.

I think right solution would be to add same -O<level> as specified in
SELECTED_OPTIMIZATION so it remains
in sync always, I have sent a patch to ml. Could you test it out and
let me know if it works for you as well.

>
> Thanks,
>
> Anuj
>
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/conf/distro/include/security_flags.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/conf/distro/include/security_flags.inc
> > b/meta/conf/distro/include/security_flags.inc
> > index 4e64eb99f9..05253b2df9 100644
> > --- a/meta/conf/distro/include/security_flags.inc
> > +++ b/meta/conf/distro/include/security_flags.inc
> > @@ -10,7 +10,7 @@ GCCPIE ?= "--enable-default-pie"
> >
> >  # _FORTIFY_SOURCE requires -O1 or higher, so disable in debug builds
> > as they use
> >  # -O0 which then results in a compiler warning.
> > -lcl_maybe_fortify ?=
> > "${@oe.utils.conditional('DEBUG_BUILD','1','','-
> > D_FORTIFY_SOURCE=2',d)}"
> > +lcl_maybe_fortify ?=
> > "${@oe.utils.conditional('DEBUG_BUILD','1','','-O -
> > D_FORTIFY_SOURCE=2',d)}"
> >
> >  # Error on use of format strings that represent possible security
> > problems
> >  SECURITY_STRINGFORMAT ?= "-Wformat -Wformat-security -Werror=format-
> > security"
> >
> > 
> >
>
