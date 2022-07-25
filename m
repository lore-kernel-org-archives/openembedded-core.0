Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA971C43334
	for <webhook@archiver.kernel.org>; Mon, 25 Jul 2022 10:34:06 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.26440.1658745239072660426
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jul 2022 03:33:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UqZ7R37q;
 spf=pass (domain: gmail.com, ip: 209.85.128.42,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id
 f24-20020a1cc918000000b003a30178c022so9083793wmb.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jul 2022 03:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J54tYEylOhO78Rd49BPTHyKb5fYTX6f/94qXUVWSqr4=;
        b=UqZ7R37qwa4NnWSbGtDudExZQItajeh9so4OVRE23lxWd/Mpq1oySMJ/D0LLOJec/1
         EPRW74PkF7GrRiFkpuNo5lwRkFGdyejdNBWoxMUTQjvEb5KmdCswozI25VXl5uf4f1KT
         PMLvwpzN2rMIeW5LxGMeN17+O81rkhuaCLxNoSw7/M7HGgmGGf5GUMkYHJx5ZXLkppLe
         gcU/wkGtcjN6Nc+4GTmvUx+uPa5nk+SNkGTqUW1mgP23Qqrw8QRxXSropCVEbAUt59vs
         Fbsic2pDP9QVYiC9DYt7PNqxTr5+xR+Lx2nTG/+XK1Ev4UXThG87PwbGVSBbW3vYLzSQ
         dxww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J54tYEylOhO78Rd49BPTHyKb5fYTX6f/94qXUVWSqr4=;
        b=uLMbUDLMwMV5tpBUSR4+Uwn9DY1yWUZeiQI2dEkUwhDT19YZ8HVDpQBVWGQwXcH1+0
         pcV4rVgmf6vnCoLwwfQa7v1jpo+iBhQ9nuqm5qE58ZjX7aqoHUFRtJOSrubK+TrHMBlP
         lpanF4WUCo3DuQ518k0GWOjBgPBIcdE5+Ltn53zc6aD01Z+nS2RFzJdeR80oK8CJK56M
         oOca3pTpS2i7nlko6pWx0ed5NRdMSzhFOirEK4NjPCvvH9KvgkS+oB5Yl3fPBU+fLdOo
         F+oX0cyPCCarTr20wRkmAnSNatFeRXZO+CSQZ7wCysXS8HEHfdp329fnLTFGSEKSexDX
         nCWw==
X-Gm-Message-State: AJIora/NpCNJWLLHkEFuSvYjKTkPLEx5PUSeHzb358HyKL0ApIRGmgBU
	xKaU+2EAdcKCmLFW4mPYjr2wqGW888ALfsHQCRs=
X-Google-Smtp-Source: 
 AGRyM1sVODLINwQxVy1yWfvq9Z0v3l1SmmzKskmEir7C58HTeJcREScIa7V1bi5vybpG2MPn+YD46Mih5MdNwIebB6s=
X-Received: by 2002:a7b:ca4a:0:b0:3a3:651f:51d8 with SMTP id
 m10-20020a7bca4a000000b003a3651f51d8mr1649449wml.102.1658745237267; Mon, 25
 Jul 2022 03:33:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1657772638.git.steve@sakoman.com>
 <05760b29576aa8797bbae2e9a1a6a44d3c6aa97e.1657772638.git.steve@sakoman.com>
 <CA+chaQfp6PbQpQuUz57f7uorXduNEj6ybSXOSE4wSmwnMxb0UA@mail.gmail.com>
 <CALY4984uzb+sJDy=R_XKzOoigNWsBT77MY3Wn86KbXnEZJY+QQ@mail.gmail.com>
In-Reply-To: 
 <CALY4984uzb+sJDy=R_XKzOoigNWsBT77MY3Wn86KbXnEZJY+QQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 25 Jul 2022 12:33:29 +0200
Message-ID: 
 <CA+chaQcDQKzngTfVpzcz77mM-F-HZ+UFv7zW3zFqpjFyQtby4A@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 10/27] glibc: stable 2.35 branch updates
To: pgowda cve <pgowda.cve@gmail.com>
Cc: Steve Sakoman <steve@sakoman.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a3eb0b05e49eb8c9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Jul 2022 10:34:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168477

--000000000000a3eb0b05e49eb8c9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

it was reverted in buildroot as well in:
https://lore.kernel.org/all/20220615022348.914136-1-james.hilliard1@gmail.c=
om/t/

reverting it in both master and kirkstone is probably good work around for
now, I can send a patch later today as I already have it reverted in my
builds.

Regards,

On Mon, Jul 25, 2022 at 12:18 PM pgowda cve <pgowda.cve@gmail.com> wrote:

> Hi Martin,
>
> Thanks for the confirmation from your side.
> I had the same issue and reverting the commit on master branch fixed the
> issue.
> Please let me know whether the patch should be reverted in the master
> branch to
> avoid building issues when "DEBUG_BUILD" is enabled.
>
> Thanks & Regards
> Pgowda
> On Sun, Jul 24, 2022 at 11:25 PM Martin Jansa <Martin.Jansa@gmail.com>
> wrote:
> >
> > On Thu, Jul 14, 2022 at 6:36 AM Steve Sakoman <steve@sakoman.com> wrote=
:
> >>
> >> From: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
> >>
> >> Below commits on Glibc-2.35 development branch are updated.
> >>
> >> glibc:
> >> ....
> >> 2d05ba7f8e Linux: Implement a useful version of _startup_fatal
> >
> > ...
> >
> > This last commit seems to cause build failure with DEBUG_BUILD:
> >
> > x86_64-webos-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3
> -mfpmath=3Dsse
> --sysroot=3D/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-6=
4-webos-linux/glibc/2.35-r0/recipe-sysroot
> -Wl,-rpath-link=3D/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/c=
ore2-64-webos-linux/glibc/2.35-r0/build-x86_64-webos-linux:/OE/build/luneos=
-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/glibc/2.35-r0/bu=
ild-x86_64-webos-linux/math:/OE/build/luneos-kirkstone/webos-ports/tmp-glib=
c/work/core2-64-webos-linux/glibc/2.35-r0/build-x86_64-webos-linux/elf:/OE/=
build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/glib=
c/2.35-r0/build-x86_64-webos-linux/dlfcn:/OE/build/luneos-kirkstone/webos-p=
orts/tmp-glibc/work/core2-64-webos-linux/glibc/2.35-r0/build-x86_64-webos-l=
inux/nss:/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-web=
os-linux/glibc/2.35-r0/build-x86_64-webos-linux/nis:/OE/build/luneos-kirkst=
one/webos-ports/tmp-glibc/work/core2-64-webos-linux/glibc/2.35-r0/build-x86=
_64-webos-linux/rt:/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/co=
re2-64-webos-linux/glibc/2.35-r0/build-x86_64-webos-linux/resolv:/OE/build/=
luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/glibc/2.35=
-r0/build-x86_64-webos-linux/mathvec:/OE/build/luneos-kirkstone/webos-ports=
/tmp-glibc/work/core2-64-webos-linux/glibc/2.35-r0/build-x86_64-webos-linux=
/support:/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-web=
os-linux/glibc/2.35-r0/build-x86_64-webos-linux/nptl
> -o
> /OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linu=
x/glibc/2.35-r0/build-x86_64-webos-linux/support/shell-container
> -pie -Wl,-O1 -nostdlib -nostartfiles  -Wl,-O1 -Wl,--hash-style=3Dgnu
> -Wl,--as-needed
> -fmacro-prefix-map=3D/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/wor=
k/core2-64-webos-linux/glibc/2.35-r0=3D/usr/src/debug/glibc/2.35-r0
>
> -fdebug-prefix-map=3D/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/wor=
k/core2-64-webos-linux/glibc/2.35-r0=3D/usr/src/debug/glibc/2.35-r0
>
> -fdebug-prefix-map=3D/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/wor=
k/core2-64-webos-linux/glibc/2.35-r0/recipe-sysroot=3D
>
> -fdebug-prefix-map=3D/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/wor=
k/core2-64-webos-linux/glibc/2.35-r0/recipe-sysroot-native=3D
> -fuse-ld=3Dbfd  -Wl,-z,combreloc -Wl,-z,relro -Wl,--hash-style=3Dboth
> /OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linu=
x/glibc/2.35-r0/build-x86_64-webos-linux/csu/Scrt1.o
> /OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linu=
x/glibc/2.35-r0/build-x86_64-webos-linux/csu/crti.o
> `x86_64-webos-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpma=
th=3Dsse
> --sysroot=3D/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-6=
4-webos-linux/glibc/2.35-r0/recipe-sysroot
> --print-file-name=3DcrtbeginS.o`
> /OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linu=
x/glibc/2.35-r0/build-x86_64-webos-linux/support/shell-container.o
> /OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linu=
x/glibc/2.35-r0/build-x86_64-webos-linux/support/libsupport_nonshared.a
> -Wl,-dynamic-linker=3D/lib/ld-linux-x86-64.so.2 -Wl,-z,now
> /OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linu=
x/glibc/2.35-r0/build-x86_64-webos-linux/libc.so.6
> /OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linu=
x/glibc/2.35-r0/build-x86_64-webos-linux/libc_nonshared.a
> -Wl,--as-needed
> /OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linu=
x/glibc/2.35-r0/build-x86_64-webos-linux/elf/ld.so
> -Wl,--no-as-needed -lgcc  `x86_64-webos-linux-gcc  -m64 -march=3Dcore2
> -mtune=3Dcore2 -msse3 -mfpmath=3Dsse
> --sysroot=3D/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-6=
4-webos-linux/glibc/2.35-r0/recipe-sysroot
> --print-file-name=3DcrtendS.o`
> /OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linu=
x/glibc/2.35-r0/build-x86_64-webos-linux/csu/crtn.o
> >
> /OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linu=
x/glibc/2.35-r0/recipe-sysroot-native/usr/bin/x86_64-webos-linux/../../libe=
xec/x86_64-webos-linux/gcc/x86_64-webos-linux/11.3.0/ld.bfd:
> /OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linu=
x/glibc/2.35-r0/build-x86_64-webos-linux/libc.a(libc-tls.o):
> in function `__libc_setup_tls':
> > /usr/src/debug/glibc/2.35-r0/git/csu/libc-tls.c:202: undefined referenc=
e
> to `_startup_fatal_not_constant'
> >
> > The same is reproducible with DEBUG_BUILD in current master. Reverting
> 2d05ba7f8e confirms that this is the only new issue with DEBUG_BUILD.
> >
> > Regards,
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#168463):
> https://lists.openembedded.org/g/openembedded-core/message/168463
> > Mute This Topic: https://lists.openembedded.org/mt/92373447/6402864
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> pgowda.cve@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000a3eb0b05e49eb8c9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>it was reverted in buildroot as wel=
l in:</div><div><a href=3D"https://lore.kernel.org/all/20220615022348.91413=
6-1-james.hilliard1@gmail.com/t/">https://lore.kernel.org/all/2022061502234=
8.914136-1-james.hilliard1@gmail.com/t/</a><br></div><div><br></div><div>re=
verting it in both master and kirkstone is probably good work around for no=
w, I can send a patch later today as I already have it reverted in my build=
s.</div><div><br></div><div>Regards,</div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 25, 2022 at 12:18 PM =
pgowda cve &lt;<a href=3D"mailto:pgowda.cve@gmail.com">pgowda.cve@gmail.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Hi Martin,<br>
<br>
Thanks for the confirmation from your side.<br>
I had the same issue and reverting the commit on master branch fixed the is=
sue.<br>
Please let me know whether the patch should be reverted in the master branc=
h to<br>
avoid building issues when &quot;DEBUG_BUILD&quot; is enabled.<br>
<br>
Thanks &amp; Regards<br>
Pgowda<br>
On Sun, Jul 24, 2022 at 11:25 PM Martin Jansa &lt;<a href=3D"mailto:Martin.=
Jansa@gmail.com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt; wrote:<br=
>
&gt;<br>
&gt; On Thu, Jul 14, 2022 at 6:36 AM Steve Sakoman &lt;<a href=3D"mailto:st=
eve@sakoman.com" target=3D"_blank">steve@sakoman.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; From: Sundeep KOKKONDA &lt;<a href=3D"mailto:sundeep.kokkonda@gmai=
l.com" target=3D"_blank">sundeep.kokkonda@gmail.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Below commits on Glibc-2.35 development branch are updated.<br>
&gt;&gt;<br>
&gt;&gt; glibc:<br>
&gt;&gt; ....<br>
&gt;&gt; 2d05ba7f8e Linux: Implement a useful version of _startup_fatal<br>
&gt;<br>
&gt; ...<br>
&gt;<br>
&gt; This last commit seems to cause build failure with DEBUG_BUILD:<br>
&gt;<br>
&gt; x86_64-webos-linux-gcc=C2=A0 -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3=
 -mfpmath=3Dsse --sysroot=3D/OE/build/luneos-kirkstone/webos-ports/tmp-glib=
c/work/core2-64-webos-linux/glibc/2.35-r0/recipe-sysroot -Wl,-rpath-link=3D=
/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/=
glibc/2.35-r0/build-x86_64-webos-linux:/OE/build/luneos-kirkstone/webos-por=
ts/tmp-glibc/work/core2-64-webos-linux/glibc/2.35-r0/build-x86_64-webos-lin=
ux/math:/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webo=
s-linux/glibc/2.35-r0/build-x86_64-webos-linux/elf:/OE/build/luneos-kirksto=
ne/webos-ports/tmp-glibc/work/core2-64-webos-linux/glibc/2.35-r0/build-x86_=
64-webos-linux/dlfcn:/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/=
core2-64-webos-linux/glibc/2.35-r0/build-x86_64-webos-linux/nss:/OE/build/l=
uneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/glibc/2.35-=
r0/build-x86_64-webos-linux/nis:/OE/build/luneos-kirkstone/webos-ports/tmp-=
glibc/work/core2-64-webos-linux/glibc/2.35-r0/build-x86_64-webos-linux/rt:/=
OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/g=
libc/2.35-r0/build-x86_64-webos-linux/resolv:/OE/build/luneos-kirkstone/web=
os-ports/tmp-glibc/work/core2-64-webos-linux/glibc/2.35-r0/build-x86_64-web=
os-linux/mathvec:/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core=
2-64-webos-linux/glibc/2.35-r0/build-x86_64-webos-linux/support:/OE/build/l=
uneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/glibc/2.35-=
r0/build-x86_64-webos-linux/nptl -o /OE/build/luneos-kirkstone/webos-ports/=
tmp-glibc/work/core2-64-webos-linux/glibc/2.35-r0/build-x86_64-webos-linux/=
support/shell-container -pie -Wl,-O1 -nostdlib -nostartfiles=C2=A0 -Wl,-O1 =
-Wl,--hash-style=3Dgnu -Wl,--as-needed -fmacro-prefix-map=3D/OE/build/luneo=
s-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/glibc/2.35-r0=
=3D/usr/src/debug/glibc/2.35-r0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -fdebug-prefix-map=3D/OE/build/luneos-ki=
rkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/glibc/2.35-r0=3D/us=
r/src/debug/glibc/2.35-r0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -fdebug-prefix-map=3D/OE/build/luneos-kirkstone=
/webos-ports/tmp-glibc/work/core2-64-webos-linux/glibc/2.35-r0/recipe-sysro=
ot=3D=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 -fdebug-prefix-map=3D/OE/build/luneos-kirkstone/webos-ports/tmp-glib=
c/work/core2-64-webos-linux/glibc/2.35-r0/recipe-sysroot-native=3D=C2=A0 -f=
use-ld=3Dbfd=C2=A0 -Wl,-z,combreloc -Wl,-z,relro -Wl,--hash-style=3Dboth /O=
E/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/gl=
ibc/2.35-r0/build-x86_64-webos-linux/csu/Scrt1.o /OE/build/luneos-kirkstone=
/webos-ports/tmp-glibc/work/core2-64-webos-linux/glibc/2.35-r0/build-x86_64=
-webos-linux/csu/crti.o `x86_64-webos-linux-gcc=C2=A0 -m64 -march=3Dcore2 -=
mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/OE/build/luneos-kirkstone/=
webos-ports/tmp-glibc/work/core2-64-webos-linux/glibc/2.35-r0/recipe-sysroo=
t=C2=A0 --print-file-name=3DcrtbeginS.o` /OE/build/luneos-kirkstone/webos-p=
orts/tmp-glibc/work/core2-64-webos-linux/glibc/2.35-r0/build-x86_64-webos-l=
inux/support/shell-container.o /OE/build/luneos-kirkstone/webos-ports/tmp-g=
libc/work/core2-64-webos-linux/glibc/2.35-r0/build-x86_64-webos-linux/suppo=
rt/libsupport_nonshared.a=C2=A0 -Wl,-dynamic-linker=3D/lib/ld-linux-x86-64.=
so.2 -Wl,-z,now /OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2=
-64-webos-linux/glibc/2.35-r0/build-x86_64-webos-linux/libc.so.6 /OE/build/=
luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/glibc/2.35=
-r0/build-x86_64-webos-linux/libc_nonshared.a -Wl,--as-needed /OE/build/lun=
eos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/glibc/2.35-r0=
/build-x86_64-webos-linux/elf/ld.so -Wl,--no-as-needed -lgcc=C2=A0 `x86_64-=
webos-linux-gcc=C2=A0 -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3D=
sse --sysroot=3D/OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2=
-64-webos-linux/glibc/2.35-r0/recipe-sysroot=C2=A0 --print-file-name=3Dcrte=
ndS.o` /OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos=
-linux/glibc/2.35-r0/build-x86_64-webos-linux/csu/crtn.o<br>
&gt; /OE/build/luneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-l=
inux/glibc/2.35-r0/recipe-sysroot-native/usr/bin/x86_64-webos-linux/../../l=
ibexec/x86_64-webos-linux/gcc/x86_64-webos-linux/11.3.0/ld.bfd: /OE/build/l=
uneos-kirkstone/webos-ports/tmp-glibc/work/core2-64-webos-linux/glibc/2.35-=
r0/build-x86_64-webos-linux/libc.a(libc-tls.o): in function `__libc_setup_t=
ls&#39;:<br>
&gt; /usr/src/debug/glibc/2.35-r0/git/csu/libc-tls.c:202: undefined referen=
ce to `_startup_fatal_not_constant&#39;<br>
&gt;<br>
&gt; The same is reproducible with DEBUG_BUILD in current master. Reverting=
 2d05ba7f8e confirms that this is the only new issue with DEBUG_BUILD.<br>
&gt;<br>
&gt; Regards,<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#168463): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/168463" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/168463</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/92373447=
/6402864" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/92373447/6402864</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:pgowda.cve@gmail.com"=
 target=3D"_blank">pgowda.cve@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--000000000000a3eb0b05e49eb8c9--

