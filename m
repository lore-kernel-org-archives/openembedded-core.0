Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web12.71649.1597774683984320976
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2020 11:18:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EQQBZc8V;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id cq28so16023414edb.10
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2020 11:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lJ5qeJSbJGS8sMBYdTe7tEATypEmzt+ccWJAFRzlutk=;
        b=EQQBZc8VdIuyCt50yFucj2KQpEF/jMIppUZyMZy9R7LmYfvI/2lzOoK4GA1sBlxlM8
         1J7T7pZwqhQIGwhCzMFXN8tui5RlD36yogY0K3Wu+yp3LP98d+ZRMQBAV8SQ9FLWDKGY
         AO0pvYk/0+vw2QCIlcGJ22t8ZeMb1T7xzustbvj0YOtru1StYD6rK+8+v9zKFQn+OBxA
         ptQPad5kTDlf/O1yY9IN/IFZr6vuuS8QcPjQxS9Ge1/gDgEXeXdf89W0CGnjCOUWyRpi
         RyVZDcjFE3R2IwCnSrrmWM7CMYB15oy2fl6BznTeeH7E36Sp5hfHv0Bopj2rXAQZAukv
         Z5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lJ5qeJSbJGS8sMBYdTe7tEATypEmzt+ccWJAFRzlutk=;
        b=b5GE00N6O1q02nIeIlMPYQ5RPL+CN5y4EYRCA/f9fk/YnV3LE+kksIOGLGWNDLBSxm
         wbmazqoBcgbVVfJB0JRgMkxrgsCFXOZyjZNBwhxV/Sr1DGoyUlaZRz6H1le/gfihIqVu
         nqH/nnFM8cxAxRwP/xp+jaSLH4yxzHYH5/833anQkQ9V5oFz5hWLnoV5/cXZNXDvej0V
         uS+eXEMgAVv/QD0aIxatua1GfyYtfBXw87cM9rDWkrFagYaksHVyb+oldhPVTI09RO63
         CmWNtD+4I1RowxLEyI8YB8iJhO4i09QLYUuyt7NqZEGy1vtPQYEYEQ2x1RJxwFOMyrXm
         12pQ==
X-Gm-Message-State: AOAM533CnB2VgSjJmLekDWsCE3FI0rZ3RgtjKK3xjxevM8TyvboWPvu2
	fDkOQMiva+La/xy5v5cXzy87M+Q23Lxrw/8tvqE=
X-Google-Smtp-Source: ABdhPJyWjLdulu4cJg3w52ZXTwJzZN0hYzUqBE4igTxes1SbhInhd13N3Q0KksSdRVdxL45rLffohCuBUPZS4JXcnFw=
X-Received: by 2002:a50:954d:: with SMTP id v13mr21400978eda.337.1597774681353;
 Tue, 18 Aug 2020 11:18:01 -0700 (PDT)
MIME-Version: 1.0
References: <162C5AD9D44F999B.7353@lists.openembedded.org> <20200818160409.244099-1-Martin.Jansa@gmail.com>
 <CAMKF1srbTdp_Qf+rWvn-W=VAP0qzmS8bRv3e50EDx0-MqfVfnA@mail.gmail.com>
In-Reply-To: <CAMKF1srbTdp_Qf+rWvn-W=VAP0qzmS8bRv3e50EDx0-MqfVfnA@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Tue, 18 Aug 2020 20:17:50 +0200
Message-ID: <CA+chaQe+9VUxpWGbBNXjLV_4etOyLZnNPGW2c1bdtJ-XOft_mQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] perf: backport a fix for confusing non-fatal error
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000050339005ad2ae8b7"

--00000000000050339005ad2ae8b7
Content-Type: text/plain; charset="UTF-8"

This patch fixes only the non-fatal find/CC concatenation issue.

For other fixes it might be cleaner to just patch BSP kernels, I've listed
some perf gcc-10 fixes in the linux-raspberrypi upgrade:
https://github.com/agherzan/meta-raspberrypi/pull/705
but sadly it shows that even relatively recent 5.4.51 isn't good enough for
perf and this wasn't even without -fcommon discussed in the another thread.

On Tue, Aug 18, 2020 at 7:16 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Tue, Aug 18, 2020 at 9:04 AM Martin Jansa <Martin.Jansa@gmail.com>
> wrote:
> >
> > * add V=1 to make log.do_compile a bit more useful, with this it shows:
> >   /bin/sh
> '/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/perf/1.0-r9/perf-1.0/tools/perf/trace/beauty/arch_errno_names.sh'
> x86_64-oe-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse
> --sysroot=/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/perf/1.0-r9/recipe-sysroot
> /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/perf/1.0-r9/perf-1.0/tools
> >
> /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linux/perf/1.0-r9/perf-1.0/trace/beauty/generated/arch_errno_name_array.c
> >   find: unknown predicate `-m64/arch'
> >   x86_64-oe-linux-gcc: error: unrecognized command-line option
> '-m64/include/uapi/asm-generic/errno.h'
> >   x86_64-oe-linux-gcc: fatal error: no input files
> >   compilation terminated.
> >   x86_64-oe-linux-gcc: error: unrecognized command-line option
> '-m64/include/uapi/asm-generic/errno.h'
> >   x86_64-oe-linux-gcc: fatal error: no input files
> >   compilation terminated.
> >
> > * apply
> https://github.com/torvalds/linux/commit/e4ffd066ff440a57097e9140fa9e16ceef905de8
> >   with sed call to fix this
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/recipes-kernel/perf/perf.bb | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/meta/recipes-kernel/perf/perf.bb
> b/meta/recipes-kernel/perf/perf.bb
> > index cf95df710f..868cde7353 100644
> > --- a/meta/recipes-kernel/perf/perf.bb
> > +++ b/meta/recipes-kernel/perf/perf.bb
> > @@ -70,6 +70,7 @@ SPDX_S = "${S}/tools/perf"
> >  LDFLAGS="-ldl -lutil"
> >
> >  EXTRA_OEMAKE = '\
> > +    V=1 \
> >      -C ${S}/tools/perf \
> >      O=${B} \
> >      CROSS_COMPILE=${TARGET_PREFIX} \
> > @@ -201,6 +202,9 @@ do_configure_prepend () {
> >              ${S}/tools/perf/Makefile.perf
> >          sed -i -e
> "s,prefix='\$(DESTDIR_SQ)/usr'$,prefix='\$(DESTDIR_SQ)/usr'
> --install-lib='\$(DESTDIR)\$(PYTHON_SITEPACKAGES_DIR)',g" \
> >              ${S}/tools/perf/Makefile.perf
> > +        # backport
> https://github.com/torvalds/linux/commit/e4ffd066ff440a57097e9140fa9e16ceef905de8
> > +        sed -i -e 's,\($(Q)$(SHELL) .$(arch_errno_tbl).\) $(CC)
> $(arch_errno_hdr_dir),\1 $(firstword $(CC)) $(arch_errno_hdr_dir),g' \
> > +            ${S}/tools/perf/Makefile.perf
>
> This is good instead of patching every BSP kernel
> how far back will it go patching ?
>
> >      fi
> >      sed -i -e "s,--root='/\$(DESTDIR_SQ)',--prefix='\$(DESTDIR_SQ)/usr'
> --install-lib='\$(DESTDIR)\$(PYTHON_SITEPACKAGES_DIR)',g" \
> >          ${S}/tools/perf/Makefile*
> > --
> > 2.25.1
> >
> > 
>

--00000000000050339005ad2ae8b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This patch fixes only the non-fatal find/CC concatenation =
issue.<div><br></div><div>For other fixes it might be cleaner to just patch=
 BSP kernels, I&#39;ve listed some perf gcc-10 fixes in the linux-raspberry=
pi upgrade:</div><div><a href=3D"https://github.com/agherzan/meta-raspberry=
pi/pull/705">https://github.com/agherzan/meta-raspberrypi/pull/705</a><br><=
/div><div>but sadly it shows that even relatively recent 5.4.51 isn&#39;t g=
ood enough for perf and this wasn&#39;t even without -fcommon discussed in =
the another thread.</div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Tue, Aug 18, 2020 at 7:16 PM Khem Raj &lt;<a hr=
ef=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, Aug 18, 2020 at =
9:04 AM Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" target=
=3D"_blank">Martin.Jansa@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; * add V=3D1 to make log.do_compile a bit more useful, with this it sh=
ows:<br>
&gt;=C2=A0 =C2=A0/bin/sh &#39;/OE/build/oe-core/tmp-glibc/work/qemux86_64-=
oe-linux/perf/1.0-r9/perf-1.0/tools/perf/trace/beauty/arch_errno_names.sh&#=
39; x86_64-oe-linux-gcc=C2=A0 -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mf=
pmath=3Dsse --sysroot=3D/OE/build/oe-core/tmp-glibc/work/qemux86_64-oe-linu=
x/perf/1.0-r9/recipe-sysroot /OE/build/oe-core/tmp-glibc/work/qemux86_64-oe=
-linux/perf/1.0-r9/perf-1.0/tools &gt; /OE/build/oe-core/tmp-glibc/work/qem=
ux86_64-oe-linux/perf/1.0-r9/perf-1.0/trace/beauty/generated/arch_errno_nam=
e_array.c<br>
&gt;=C2=A0 =C2=A0find: unknown predicate `-m64/arch&#39;<br>
&gt;=C2=A0 =C2=A0x86_64-oe-linux-gcc: error: unrecognized command-line opt=
ion &#39;-m64/include/uapi/asm-generic/errno.h&#39;<br>
&gt;=C2=A0 =C2=A0x86_64-oe-linux-gcc: fatal error: no input files<br>
&gt;=C2=A0 =C2=A0compilation terminated.<br>
&gt;=C2=A0 =C2=A0x86_64-oe-linux-gcc: error: unrecognized command-line opt=
ion &#39;-m64/include/uapi/asm-generic/errno.h&#39;<br>
&gt;=C2=A0 =C2=A0x86_64-oe-linux-gcc: fatal error: no input files<br>
&gt;=C2=A0 =C2=A0compilation terminated.<br>
&gt;<br>
&gt; * apply <a href=3D"https://github.com/torvalds/linux/commit/e4ffd066f=
f440a57097e9140fa9e16ceef905de8" rel=3D"noreferrer" target=3D"_blank">https=
://github.com/torvalds/linux/commit/e4ffd066ff440a57097e9140fa9e16ceef905de=
8</a><br>
&gt;=C2=A0 =C2=A0with sed call to fix this<br>
&gt;<br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.=
com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"nore=
ferrer" target=3D"_blank">perf.bb</a> | 4 ++++<br>
&gt;=C2=A0 1 file changed, 4 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=
=3D"noreferrer" target=3D"_blank">perf.bb</a> b/meta/recipes-kernel/perf/<=
a href=3D"http://perf.bb" rel=3D"noreferrer" target=3D"_blank">perf.bb</a><=
br>
&gt; index cf95df710f..868cde7353 100644<br>
&gt; --- a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"nore=
ferrer" target=3D"_blank">perf.bb</a><br>
&gt; +++ b/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"nore=
ferrer" target=3D"_blank">perf.bb</a><br>
&gt; @@ -70,6 +70,7 @@ SPDX_S =3D &quot;${S}/tools/perf&quot;<br>
&gt;=C2=A0 LDFLAGS=3D&quot;-ldl -lutil&quot;<br>
&gt;<br>
&gt;=C2=A0 EXTRA_OEMAKE =3D &#39;\<br>
&gt; +=C2=A0 =C2=A0 V=3D1 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 -C ${S}/tools/perf \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 O=3D${B} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 CROSS_COMPILE=3D${TARGET_PREFIX} \<br>
&gt; @@ -201,6 +202,9 @@ do_configure_prepend () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${S}/tools/perf/Makef=
ile.perf<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &quot;s,prefix=3D&#39;\$(=
DESTDIR_SQ)/usr&#39;$,prefix=3D&#39;\$(DESTDIR_SQ)/usr&#39; --install-lib=
=3D&#39;\$(DESTDIR)\$(PYTHON_SITEPACKAGES_DIR)&#39;,g&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${S}/tools/perf/Makef=
ile.perf<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # backport <a href=3D"https://github.com=
/torvalds/linux/commit/e4ffd066ff440a57097e9140fa9e16ceef905de8" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/torvalds/linux/commit/e4ffd06=
6ff440a57097e9140fa9e16ceef905de8</a><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;s,\($(Q)$(SHELL) .$(arch_=
errno_tbl).\) $(CC) $(arch_errno_hdr_dir),\1 $(firstword $(CC)) $(arch_errn=
o_hdr_dir),g&#39; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${S}/tools/perf/Makefile.p=
erf<br>
<br>
This is good instead of patching every BSP kernel<br>
how far back will it go patching ?<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 sed -i -e &quot;s,--root=3D&#39;/\$(DESTDIR_SQ)&#=
39;,--prefix=3D&#39;\$(DESTDIR_SQ)/usr&#39; --install-lib=3D&#39;\$(DESTDIR=
)\$(PYTHON_SITEPACKAGES_DIR)&#39;,g&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${S}/tools/perf/Makefile*<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt; <br>
</blockquote></div>

--00000000000050339005ad2ae8b7--
