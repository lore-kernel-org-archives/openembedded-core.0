Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DECB5CEFCE5
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 17:53:21 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.95984.1767721992209353917
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 09:53:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dDrWnV4B;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-78fc520433aso14044277b3.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 09:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767721991; x=1768326791; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fIKRXxHIaDEFE7CpDa+a/IcSyCK8F7RaKAJfxsDgx7U=;
        b=dDrWnV4BRlRknc1xDWgOM0B9Rx1yNMW3lWD13KBT1IxDlEgTUqNXQVv05nkx9Buvp2
         SbQDBA2uPUp3pOOM0Z4UJOFt7BgZqVJv1u91ph4rb82C+roA0Il4ZvKuY3FAlu7ccSI+
         deKUck/9Y31lP4pV1jb+mLOyFL+j7s5OwPtjLN9A16g4HSSLQ2KuDS1qk6qJ5oBKUHcL
         Xa8UtyckG75ciTcTcLAUkRvHRXQlRO0O2hWi2dDrRuBScPSY6hrtC+4voP3qeZRwfK6l
         A+4aGJQWfTvGo/w8HnU9qUB9rtyIVjELSyxm7rBd3Pa6tBK956volHc4gJPqrgenpHI/
         xlow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767721991; x=1768326791;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fIKRXxHIaDEFE7CpDa+a/IcSyCK8F7RaKAJfxsDgx7U=;
        b=Biq7veKlL31NKtg8wE3CitHZQ+3jMN/+EOgir5sIaVDcWIeKNiy/qkofhFMyvAy8Mp
         yj/sMWC78Lg5LJFF4dKsSc+H0Zd5uPjbRXz4jwU8/BOM/tN6EI+CjtVqxEVlMfj/mMEr
         9nephxjTGMoxQfILRf1G5c3pWMwjWeFDKPmA5OnrLk8rdE6LMqckGSdc4D/pg967FPvq
         lGP6FAEhbbi3ryCBxX7JdDuAvBrx0WhV1agiDKDpgQk6Z6vobRX5Mi3kEbqe1t1uHPsz
         S8P7cWxpq5g8KvaXoBlLyHpLblAzSNwh2AOJJ1FzzK3eKrtSIXOuz+tO9lLwWG2O9+yz
         XR/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUZPzjXGJiEeoWbQhpz9IDEFYEdsCNmGHcf0Z7+6SZzsizQZZQeSmwRmCoAAlpVV5Obgc+5QqBJvZUVZPnW68oD/g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxVcmcEugLtZUOdGJ6uQw6MAqYNfSEw3dzer2ZCrko+35yMb9nu
	yV+UsaPVeELLFXWhR4by06jc26MXpArFg6Am+yu1iTwyAHkrW8tgQnjLj3COio9ntvd8Dg1yUrk
	30AWcaoIaUj4aIxm4fbpIpohKWPVkpmQ=
X-Gm-Gg: AY/fxX5eFxGWs2Tjc9sEz43WbZ+FXzOCu6bFg7JpRnHhnALHwkgi1I6Gf5LGG9vlqBq
	nZCBy9Oik3PGc8FZnCp/p+IFhTISiKIst5lcowrvHlMRq/stSCpUMBl0sGeKySO/SGwDUW+hwK5
	a9SIZ/InHV/eDLqlt5cDz42kjZB9i7SOGxVrr43DiCqkMon4XfB7bT6CqpXl5ctnaPk4qhBgVKI
	mLOJvtLPlrd2mbAHNOwr9OzrTWlhNrb7Lxfrpy0BMThevaYpdmc62smMQUOWjxF5kxobFCTI+dL
	PQHTYkzUD3STAhIDwur5ApiFhRa2p176NzhsGNn7atz+R7wFdOumugjYFeKDbtEspL7C/wsApIq
	+pn19k5N9pbY+juDfBfohmeek6xOelAqP4p9rZVERjkhB2i4=
X-Google-Smtp-Source: AGHT+IH0Hl33Um6y7Hno4xuZ5SlK3DSaCibXWAe0n9RKgRUvGp2Q2dlvKC33KaCjj+zWl1ejqg2JLbGfpq/duH36ACA=
X-Received: by 2002:a53:b84c:0:b0:645:5ac1:8c0 with SMTP id
 956f58d0204a3-6470c9087ffmr2060663d50.65.1767721989720; Tue, 06 Jan 2026
 09:53:09 -0800 (PST)
MIME-Version: 1.0
References: <20260106143712.843971-1-joaomarcos.costa@bootlin.com>
 <20260106143712.843971-3-joaomarcos.costa@bootlin.com> <CADkTA4MpUSoTk-igh-Z2pcUQx7peJwZriiSbYmNpUJfPQqA4cg@mail.gmail.com>
In-Reply-To: <CADkTA4MpUSoTk-igh-Z2pcUQx7peJwZriiSbYmNpUJfPQqA4cg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 6 Jan 2026 09:52:58 -0800
X-Gm-Features: AQt7F2rOY5L5h6lVMUtksTsSi16mbrnqym4k_DDih6bl1iY6ElQZi7e6HZE60yU
Message-ID: <CAMKF1sqCtfJwfVaK1wbbzU=q9yro4X2egP4fyqxmL7QsM1eOfQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v1 2/2] linux-yocto/6.12: riscv: relocate
 KERNEL_FEATURES_RISCV into recipe
To: bruce.ashfield@gmail.com
Cc: joaomarcos.costa@bootlin.com, openembedded-core@lists.openembedded.org, 
	thomas.petazzoni@bootlin.com
Content-Type: multipart/alternative; boundary="000000000000424e9b0647bbd91b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 17:53:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228908

--000000000000424e9b0647bbd91b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 6, 2026 at 7:28=E2=80=AFAM Bruce Ashfield via lists.openembedde=
d.org
<bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:

> On Tue, Jan 6, 2026 at 9:37=E2=80=AFAM Joao Marcos Costa via
> lists.openembedded.org
> <joaomarcos.costa=3Dbootlin.com@lists.openembedded.org> wrote:
> >
> > In a custom linux recipe that requires linux-yocto.inc, the metadata
> > files (*.scc) end up in KERNEL_FEATURES. However, the custom recipe's
> > FILESPATH does not contain the path to oe-core's linux-yocto directory
> > (as expected), which leads to the error below:
> >
> > ERROR: linux-custom-6.12.15+git-r0 do_kernel_metadata:
> > Feature 'arch/riscv/tunes/riscv-isa-clear.scc' not found, this will
> cause configuration failures.
> > ERROR: linux-custom-6.12.15+git-r0 do_kernel_metadata:
> > Check the SRC_URI for meta-data repositories or directories that may be
> missing
> >
> > Move KERNEL_FEATURES_RISCV - along with the appends - out of the common
> > definitions.
>
> We shouldn't do this either.
>
> It dooms us to carry it along with each versioned linux-yocto recipe,
> which we don't
> want.
>
> Maybe a new .inc that all the linux-yocto recipe's inherit could work,
> since it is
> then something smaller to carry along.



Yeah we need this regardless how we fix it. I agree a separate inc file
might be more contained to maintain in long run


>
> Bruce
>
> >
> > Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
> > ---
> >  meta/recipes-kernel/linux/linux-yocto.inc     | 16 ----------------
> >  meta/recipes-kernel/linux/linux-yocto_6.12.bb | 16 ++++++++++++++++
> >  2 files changed, 16 insertions(+), 16 deletions(-)
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
> b/meta/recipes-kernel/linux/linux-yocto.inc
> > index 4d0a726bb6..389329030d 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto.inc
> > +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> > @@ -37,22 +37,6 @@ KERNEL_FEATURES:append =3D "
> ${@bb.utils.contains('MACHINE_FEATURES', 'efi', 'cfg/
> >  KERNEL_FEATURES:append =3D " ${@bb.utils.contains('MACHINE_FEATURES',
> 'numa', 'features/numa/numa.scc', '', d)}"
> >  KERNEL_FEATURES:append =3D " ${@bb.utils.contains('MACHINE_FEATURES',
> 'vfat', 'cfg/fs/vfat.scc', '', d)}"
> >
> > -KERNEL_FEATURES_RISCV =3D "\
> > -    arch/riscv/tunes/riscv-isa-clear.scc \
> > -    ${@bb.utils.contains(    'TUNE_FEATURES', 'rv 32 i m a',
> 'arch/riscv/tunes/riscv-isa-rv32i.scc',  '', d)} \
> > -    ${@bb.utils.contains(    'TUNE_FEATURES', 'rv 64 i m a',
> 'arch/riscv/tunes/riscv-isa-rv64i.scc',  '', d)} \
> > -    ${@bb.utils.contains(    'TUNE_FEATURES', 'f d',
>  'arch/riscv/tunes/riscv-isa-fpu.scc',    '', d)} \
> > -    ${@bb.utils.contains(    'TUNE_FEATURES', 'c',
>  'arch/riscv/tunes/riscv-isa-c.scc',      '', d)} \
> > -    ${@bb.utils.contains(    'TUNE_FEATURES', 'v',
>  'arch/riscv/tunes/riscv-isa-v.scc',      '', d)} \
> > -    ${@bb.utils.contains_any('TUNE_FEATURES', 'b zba',
>  'arch/riscv/tunes/riscv-isa-zba.scc',    '', d)} \
> > -    ${@bb.utils.contains_any('TUNE_FEATURES', 'b zbb',
>  'arch/riscv/tunes/riscv-isa-zbb.scc',    '', d)} \
> > -    ${@bb.utils.contains(    'TUNE_FEATURES', 'zbc',
>  'arch/riscv/tunes/riscv-isa-zbc.scc',    '', d)} \
> > -    ${@bb.utils.contains(    'TUNE_FEATURES', 'zicbom',
> 'arch/riscv/tunes/riscv-isa-zicbom.scc', '', d)} \
> > -    "
> > -
> > -KERNEL_FEATURES:append:riscv32 =3D " ${KERNEL_FEATURES_RISCV}"
> > -KERNEL_FEATURES:append:riscv64 =3D " ${KERNEL_FEATURES_RISCV}"
> > -
> >  # A KMACHINE is the mapping of a yocto $MACHINE to what is built
> >  # by the kernel. This is typically the branch that should be built,
> >  # and it can be specific to the machine or shared
> > diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
> b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
> > index 84419f8c78..22fa4ba5e0 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
> > @@ -76,4 +76,20 @@ KERNEL_FEATURES:append:powerpc64le =3D "
> arch/powerpc/powerpc-debug.scc"
> >  # ERROR: modpost: __ex_table+0x17a4 references non-executable section
> '.debug_loclists'
> >  # Check again during next major version upgrade
> >  KERNEL_FEATURES:remove:riscv32 =3D "features/debug/debug-kernel.scc"
> > +KERNEL_FEATURES_RISCV =3D "\
> > +    arch/riscv/tunes/riscv-isa-clear.scc \
> > +    ${@bb.utils.contains(    'TUNE_FEATURES', 'rv 32 i m a',
> 'arch/riscv/tunes/riscv-isa-rv32i.scc',  '', d)} \
> > +    ${@bb.utils.contains(    'TUNE_FEATURES', 'rv 64 i m a',
> 'arch/riscv/tunes/riscv-isa-rv64i.scc',  '', d)} \
> > +    ${@bb.utils.contains(    'TUNE_FEATURES', 'f d',
>  'arch/riscv/tunes/riscv-isa-fpu.scc',    '', d)} \
> > +    ${@bb.utils.contains(    'TUNE_FEATURES', 'c',
>  'arch/riscv/tunes/riscv-isa-c.scc',      '', d)} \
> > +    ${@bb.utils.contains(    'TUNE_FEATURES', 'v',
>  'arch/riscv/tunes/riscv-isa-v.scc',      '', d)} \
> > +    ${@bb.utils.contains_any('TUNE_FEATURES', 'b zba',
>  'arch/riscv/tunes/riscv-isa-zba.scc',    '', d)} \
> > +    ${@bb.utils.contains_any('TUNE_FEATURES', 'b zbb',
>  'arch/riscv/tunes/riscv-isa-zbb.scc',    '', d)} \
> > +    ${@bb.utils.contains(    'TUNE_FEATURES', 'zbc',
>  'arch/riscv/tunes/riscv-isa-zbc.scc',    '', d)} \
> > +    ${@bb.utils.contains(    'TUNE_FEATURES', 'zicbom',
> 'arch/riscv/tunes/riscv-isa-zicbom.scc', '', d)} \
> > +    "
> > +
> > +KERNEL_FEATURES:append:riscv32 =3D " ${KERNEL_FEATURES_RISCV}"
> > +KERNEL_FEATURES:append:riscv64 =3D " ${KERNEL_FEATURES_RISCV}"
> > +
> >  INSANE_SKIP:kernel-vmlinux:qemuppc64 =3D "textrel"
> > --
> > 2.47.0
> >
> >
> >
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#228902):
> https://lists.openembedded.org/g/openembedded-core/message/228902
> Mute This Topic: https://lists.openembedded.org/mt/117105622/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000424e9b0647bbd91b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 6, 2026 at 7:28=E2=80=AFAM =
Bruce Ashfield via <a href=3D"http://lists.openembedded.org">lists.openembe=
dded.org</a> &lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@lists.openemb=
edded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">On Tue, Jan 6, 2026 at 9:37=E2=80=AFAM Joao Marcos =
Costa via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a><br>
&lt;joaomarcos.costa=3D<a href=3D"mailto:bootlin.com@lists.openembedded.org=
" target=3D"_blank">bootlin.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; In a custom linux recipe that requires linux-yocto.inc, the metadata<b=
r>
&gt; files (*.scc) end up in KERNEL_FEATURES. However, the custom recipe&#3=
9;s<br>
&gt; FILESPATH does not contain the path to oe-core&#39;s linux-yocto direc=
tory<br>
&gt; (as expected), which leads to the error below:<br>
&gt;<br>
&gt; ERROR: linux-custom-6.12.15+git-r0 do_kernel_metadata:<br>
&gt; Feature &#39;arch/riscv/tunes/riscv-isa-clear.scc&#39; not found, this=
 will cause configuration failures.<br>
&gt; ERROR: linux-custom-6.12.15+git-r0 do_kernel_metadata:<br>
&gt; Check the SRC_URI for meta-data repositories or directories that may b=
e missing<br>
&gt;<br>
&gt; Move KERNEL_FEATURES_RISCV - along with the appends - out of the commo=
n<br>
&gt; definitions.<br>
<br>
We shouldn&#39;t do this either.<br>
<br>
It dooms us to carry it along with each versioned linux-yocto recipe,<br>
which we don&#39;t<br>
want.<br>
<br>
Maybe a new .inc that all the linux-yocto recipe&#39;s inherit could work,<=
br>
since it is<br>
then something smaller to carry along.</blockquote><div dir=3D"auto"><br></=
div><div dir=3D"auto"><br></div><div dir=3D"auto">Yeah we need this regardl=
ess how we fix it. I agree a separate inc file might be more contained to m=
aintain in long run</div><div dir=3D"auto"><br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex" dir=3D"auto"><br>
<br>
Bruce<br>
<br>
&gt;<br>
&gt; Signed-off-by: Jo=C3=A3o Marcos Costa &lt;<a href=3D"mailto:joaomarcos=
.costa@bootlin.com" target=3D"_blank">joaomarcos.costa@bootlin.com</a>&gt;<=
br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-kernel/linux/linux-yocto.inc=C2=A0 =C2=A0 =C2=A0| 1=
6 ----------------<br>
&gt;=C2=A0 meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.12.bb"=
 rel=3D"noreferrer" target=3D"_blank">linux-yocto_6.12.bb</a> | 16 ++++++++=
++++++++<br>
&gt;=C2=A0 2 files changed, 16 insertions(+), 16 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-=
kernel/linux/linux-yocto.inc<br>
&gt; index 4d0a726bb6..389329030d 100644<br>
&gt; --- a/meta/recipes-kernel/linux/linux-yocto.inc<br>
&gt; +++ b/meta/recipes-kernel/linux/linux-yocto.inc<br>
&gt; @@ -37,22 +37,6 @@ KERNEL_FEATURES:append =3D &quot; ${@bb.utils.conta=
ins(&#39;MACHINE_FEATURES&#39;, &#39;efi&#39;, &#39;cfg/<br>
&gt;=C2=A0 KERNEL_FEATURES:append =3D &quot; ${@bb.utils.contains(&#39;MACH=
INE_FEATURES&#39;, &#39;numa&#39;, &#39;features/numa/numa.scc&#39;, &#39;&=
#39;, d)}&quot;<br>
&gt;=C2=A0 KERNEL_FEATURES:append =3D &quot; ${@bb.utils.contains(&#39;MACH=
INE_FEATURES&#39;, &#39;vfat&#39;, &#39;cfg/fs/vfat.scc&#39;, &#39;&#39;, d=
)}&quot;<br>
&gt;<br>
&gt; -KERNEL_FEATURES_RISCV =3D &quot;\<br>
&gt; -=C2=A0 =C2=A0 arch/riscv/tunes/riscv-isa-clear.scc \<br>
&gt; -=C2=A0 =C2=A0 ${@bb.utils.contains(=C2=A0 =C2=A0 &#39;TUNE_FEATURES&#=
39;, &#39;rv 32 i m a&#39;, &#39;arch/riscv/tunes/riscv-isa-rv32i.scc&#39;,=
=C2=A0 &#39;&#39;, d)} \<br>
&gt; -=C2=A0 =C2=A0 ${@bb.utils.contains(=C2=A0 =C2=A0 &#39;TUNE_FEATURES&#=
39;, &#39;rv 64 i m a&#39;, &#39;arch/riscv/tunes/riscv-isa-rv64i.scc&#39;,=
=C2=A0 &#39;&#39;, d)} \<br>
&gt; -=C2=A0 =C2=A0 ${@bb.utils.contains(=C2=A0 =C2=A0 &#39;TUNE_FEATURES&#=
39;, &#39;f d&#39;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;arch/riscv/tunes/=
riscv-isa-fpu.scc&#39;,=C2=A0 =C2=A0 &#39;&#39;, d)} \<br>
&gt; -=C2=A0 =C2=A0 ${@bb.utils.contains(=C2=A0 =C2=A0 &#39;TUNE_FEATURES&#=
39;, &#39;c&#39;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;arch/riscv/t=
unes/riscv-isa-c.scc&#39;,=C2=A0 =C2=A0 =C2=A0 &#39;&#39;, d)} \<br>
&gt; -=C2=A0 =C2=A0 ${@bb.utils.contains(=C2=A0 =C2=A0 &#39;TUNE_FEATURES&#=
39;, &#39;v&#39;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;arch/riscv/t=
unes/riscv-isa-v.scc&#39;,=C2=A0 =C2=A0 =C2=A0 &#39;&#39;, d)} \<br>
&gt; -=C2=A0 =C2=A0 ${@bb.utils.contains_any(&#39;TUNE_FEATURES&#39;, &#39;=
b zba&#39;,=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;arch/riscv/tunes/riscv-isa-zba.s=
cc&#39;,=C2=A0 =C2=A0 &#39;&#39;, d)} \<br>
&gt; -=C2=A0 =C2=A0 ${@bb.utils.contains_any(&#39;TUNE_FEATURES&#39;, &#39;=
b zbb&#39;,=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;arch/riscv/tunes/riscv-isa-zbb.s=
cc&#39;,=C2=A0 =C2=A0 &#39;&#39;, d)} \<br>
&gt; -=C2=A0 =C2=A0 ${@bb.utils.contains(=C2=A0 =C2=A0 &#39;TUNE_FEATURES&#=
39;, &#39;zbc&#39;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;arch/riscv/tunes/=
riscv-isa-zbc.scc&#39;,=C2=A0 =C2=A0 &#39;&#39;, d)} \<br>
&gt; -=C2=A0 =C2=A0 ${@bb.utils.contains(=C2=A0 =C2=A0 &#39;TUNE_FEATURES&#=
39;, &#39;zicbom&#39;,=C2=A0 =C2=A0 =C2=A0 &#39;arch/riscv/tunes/riscv-isa-=
zicbom.scc&#39;, &#39;&#39;, d)} \<br>
&gt; -=C2=A0 =C2=A0 &quot;<br>
&gt; -<br>
&gt; -KERNEL_FEATURES:append:riscv32 =3D &quot; ${KERNEL_FEATURES_RISCV}&qu=
ot;<br>
&gt; -KERNEL_FEATURES:append:riscv64 =3D &quot; ${KERNEL_FEATURES_RISCV}&qu=
ot;<br>
&gt; -<br>
&gt;=C2=A0 # A KMACHINE is the mapping of a yocto $MACHINE to what is built=
<br>
&gt;=C2=A0 # by the kernel. This is typically the branch that should be bui=
lt,<br>
&gt;=C2=A0 # and it can be specific to the machine or shared<br>
&gt; diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6=
.12.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto_6.12.bb</a> b/meta=
/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.12.bb" rel=3D"norefer=
rer" target=3D"_blank">linux-yocto_6.12.bb</a><br>
&gt; index 84419f8c78..22fa4ba5e0 100644<br>
&gt; --- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.12.bb"=
 rel=3D"noreferrer" target=3D"_blank">linux-yocto_6.12.bb</a><br>
&gt; +++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.12.bb"=
 rel=3D"noreferrer" target=3D"_blank">linux-yocto_6.12.bb</a><br>
&gt; @@ -76,4 +76,20 @@ KERNEL_FEATURES:append:powerpc64le =3D &quot; arch/=
powerpc/powerpc-debug.scc&quot;<br>
&gt;=C2=A0 # ERROR: modpost: __ex_table+0x17a4 references non-executable se=
ction &#39;.debug_loclists&#39;<br>
&gt;=C2=A0 # Check again during next major version upgrade<br>
&gt;=C2=A0 KERNEL_FEATURES:remove:riscv32 =3D &quot;features/debug/debug-ke=
rnel.scc&quot;<br>
&gt; +KERNEL_FEATURES_RISCV =3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 arch/riscv/tunes/riscv-isa-clear.scc \<br>
&gt; +=C2=A0 =C2=A0 ${@bb.utils.contains(=C2=A0 =C2=A0 &#39;TUNE_FEATURES&#=
39;, &#39;rv 32 i m a&#39;, &#39;arch/riscv/tunes/riscv-isa-rv32i.scc&#39;,=
=C2=A0 &#39;&#39;, d)} \<br>
&gt; +=C2=A0 =C2=A0 ${@bb.utils.contains(=C2=A0 =C2=A0 &#39;TUNE_FEATURES&#=
39;, &#39;rv 64 i m a&#39;, &#39;arch/riscv/tunes/riscv-isa-rv64i.scc&#39;,=
=C2=A0 &#39;&#39;, d)} \<br>
&gt; +=C2=A0 =C2=A0 ${@bb.utils.contains(=C2=A0 =C2=A0 &#39;TUNE_FEATURES&#=
39;, &#39;f d&#39;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;arch/riscv/tunes/=
riscv-isa-fpu.scc&#39;,=C2=A0 =C2=A0 &#39;&#39;, d)} \<br>
&gt; +=C2=A0 =C2=A0 ${@bb.utils.contains(=C2=A0 =C2=A0 &#39;TUNE_FEATURES&#=
39;, &#39;c&#39;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;arch/riscv/t=
unes/riscv-isa-c.scc&#39;,=C2=A0 =C2=A0 =C2=A0 &#39;&#39;, d)} \<br>
&gt; +=C2=A0 =C2=A0 ${@bb.utils.contains(=C2=A0 =C2=A0 &#39;TUNE_FEATURES&#=
39;, &#39;v&#39;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;arch/riscv/t=
unes/riscv-isa-v.scc&#39;,=C2=A0 =C2=A0 =C2=A0 &#39;&#39;, d)} \<br>
&gt; +=C2=A0 =C2=A0 ${@bb.utils.contains_any(&#39;TUNE_FEATURES&#39;, &#39;=
b zba&#39;,=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;arch/riscv/tunes/riscv-isa-zba.s=
cc&#39;,=C2=A0 =C2=A0 &#39;&#39;, d)} \<br>
&gt; +=C2=A0 =C2=A0 ${@bb.utils.contains_any(&#39;TUNE_FEATURES&#39;, &#39;=
b zbb&#39;,=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;arch/riscv/tunes/riscv-isa-zbb.s=
cc&#39;,=C2=A0 =C2=A0 &#39;&#39;, d)} \<br>
&gt; +=C2=A0 =C2=A0 ${@bb.utils.contains(=C2=A0 =C2=A0 &#39;TUNE_FEATURES&#=
39;, &#39;zbc&#39;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;arch/riscv/tunes/=
riscv-isa-zbc.scc&#39;,=C2=A0 =C2=A0 &#39;&#39;, d)} \<br>
&gt; +=C2=A0 =C2=A0 ${@bb.utils.contains(=C2=A0 =C2=A0 &#39;TUNE_FEATURES&#=
39;, &#39;zicbom&#39;,=C2=A0 =C2=A0 =C2=A0 &#39;arch/riscv/tunes/riscv-isa-=
zicbom.scc&#39;, &#39;&#39;, d)} \<br>
&gt; +=C2=A0 =C2=A0 &quot;<br>
&gt; +<br>
&gt; +KERNEL_FEATURES:append:riscv32 =3D &quot; ${KERNEL_FEATURES_RISCV}&qu=
ot;<br>
&gt; +KERNEL_FEATURES:append:riscv64 =3D &quot; ${KERNEL_FEATURES_RISCV}&qu=
ot;<br>
&gt; +<br>
&gt;=C2=A0 INSANE_SKIP:kernel-vmlinux:qemuppc64 =3D &quot;textrel&quot;<br>
&gt; --<br>
&gt; 2.47.0<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#228902): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/228902" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/228902</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117105622/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117105622/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000424e9b0647bbd91b--

