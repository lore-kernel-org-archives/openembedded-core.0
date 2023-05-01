Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3947FC77B60
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 01:34:25 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.84238.1682904857705604641
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Apr 2023 18:34:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=RQN8rogF;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-4ecb137af7eso2414183e87.2
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Apr 2023 18:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682904856; x=1685496856;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a8j7COTD9A0wXPY8qIllFIR1UKu1DBaHVQc80loFfvY=;
        b=RQN8rogFptpaCwAqshE38zx4NLAv74ye5PeZqiezvE2uSx90uJDBdwMRwRN4i54JKs
         KlB9YjNSy6IvEwrFsuf5+LuQcBYYXch11yS5HU25Yh7B8BpbyS6sy5KOHjg4rdIBhfHu
         tYkCH3B4pt8ejSJ8QDKEdWG2MfcK1PumGX+gxiJwM8I9OGzdvMrcnTzkacH8WLMKdrCl
         +4fantveYJVO4RrBZFjxWtald8J5D3Pz0MSf+aU2JOL9pXUWxRQnJZHMgIjICDMiGSxQ
         pi/My9m9uBFqk+3kpsCL3rSJPHINv0jgKeLMt3oid6NMvWhNP/6px+Q+8AwKPzBR+3kK
         xJpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682904856; x=1685496856;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a8j7COTD9A0wXPY8qIllFIR1UKu1DBaHVQc80loFfvY=;
        b=kmaTqfkWhy77R4ezKpTlp0aFBKp+V+wrktpv5TQCtuOjB88Vewk+8sJ5N/omE7kdmO
         uj8pyTZrUUYKMdVxsL72Wc/6G06LviqYD5WDjiGlQ/fs9qWqdawmqd7cm2+InIdrv9IK
         QW4j9nQoyUNOg0ghY3STzx10x8iAByLMw4H0xx6RuPbnx9ZsdjTE7lviT85VkBu6jv2t
         aDrwqfXUXYwafkudp8mbB9viQ5phN6SNhN4k2nO2oVzoGKNvuaTwRPImKQbYqag9itwZ
         UW7PuH+xxrnf+q9s7erLkrSpm9JoBIBvXn3EPlXk67KqBV0fxtfmmrUKPW3rs2CcL3II
         5GTA==
X-Gm-Message-State: AC+VfDyO/9pt6qt7ytmrWgfuBhP6A0DEb8r2MnwJRsfmIMnyWdXbFfHQ
	ri/BeegeCJVVBzawVhgUCa+w6G+NA16sj5Gjnrs=
X-Google-Smtp-Source: ACHHUZ67UzJti/ApHBPSHrt7sRRwEu4Tn+cHUS6VT5/blecxM+ZPjGlY2PBsorVB1zKjRaRc7O5Ni8IIqRu7bBhrzwY=
X-Received: by 2002:a19:f815:0:b0:4ed:c3a1:752a with SMTP id
 a21-20020a19f815000000b004edc3a1752amr3019709lff.45.1682904855372; Sun, 30
 Apr 2023 18:34:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230426095036.2632847-1-alex@linutronix.de> <20230426095036.2632847-10-alex@linutronix.de>
 <CAMKF1sqM-WhYtLALHemrPC62qMaA4h41UNr_kP6brLvbdJ2j+w@mail.gmail.com>
 <CANNYZj-JbHNHLd1Dh5WAeBUoqLNwoKcdpeDH1UKkxhfsLZSfWQ@mail.gmail.com>
 <CAMKF1sr108FSHSZ0sg7GEedTpfpuR=nnSY_MJGpprVBFzwNx-w@mail.gmail.com>
 <CANNYZj_eZK+etivyDpRkMRRL0K5Vd5DDY3Z+Y7G31_obabeOTQ@mail.gmail.com> <CAMKF1sqassFJNsbaEOKB15-XtVeok5ZKOR=ufUXDrKaq6anJMw@mail.gmail.com>
In-Reply-To: <CAMKF1sqassFJNsbaEOKB15-XtVeok5ZKOR=ufUXDrKaq6anJMw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 1 May 2023 03:34:04 +0200
Message-ID: <CANNYZj_SXQmvsp88FXVAzviYJ0K459SWFOEVqjZQSDc1dun57Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 10/11] insane.bbclass: simplify exceptions for
 32 bit time API check
To: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex@linutronix.de>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001869d605fa97d266"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 01:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180583

--0000000000001869d605fa97d266
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

So how would I replicate these? What build is actually being run?

Alex

On Mon 1. May 2023 at 2.23, Khem Raj <raj.khem@gmail.com> wrote:

> here is latest - https://errors.yoctoproject.org/Errors/Build/163426/
> I have tree rebased on alex'es master-next here
>
> https://git.yoctoproject.org/poky-contrib/log/?h=3Dyoe/mut
>
> On Sat, Apr 29, 2023 at 10:35=E2=80=AFPM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > This looks like a build with v1 version of the patchset, and not v2.
> > Pseudo has been specifically excluded from the qa check in v2 for
> > instance.
> >
> > Alex
> >
> > On Sun, 30 Apr 2023 at 07:16, Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > https://errors.yoctoproject.org/Errors/Build/163415/
> > >
> > > On Sat, Apr 29, 2023 at 9:49=E2=80=AFPM Alexander Kanavin
> > > <alex.kanavin@gmail.com> wrote:
> > > >
> > > > Can I see the error please?
> > > >
> > > > Alex
> > > >
> > > > On Sat 29. Apr 2023 at 21.23, Khem Raj <raj.khem@gmail.com> wrote:
> > > >>
> > > >> its still triggering as error.
> > > >>
> > > >> On Wed, Apr 26, 2023 at 2:50=E2=80=AFAM Alexander Kanavin
> > > >> <alex.kanavin@gmail.com> wrote:
> > > >> >
> > > >> > Existing implementation required to list both specific
> problematic apis, and files that
> > > >> > use them: neither is necessary as both are seen in package_qa
> error messages, and
> > > >> > can cause excessive amount of exception lines, if there are too
> many files, or
> > > >> > they are installed in arch-specific locations. Also, the value o=
f
> INSANE_SKIP
> > > >> > should be the test that needs to be skipped, and in this case it
> wasn't.
> > > >> >
> > > >> > Also, all problematic recipes are now correctly listed.
> > > >> >
> > > >> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > > >> > ---
> > > >> >  meta/classes-global/insane.bbclass  | 14 +++-----------
> > > >> >  meta/conf/distro/include/time64.inc | 18 ++++++++++++------
> > > >> >  2 files changed, 15 insertions(+), 17 deletions(-)
> > > >> >
> > > >> > diff --git a/meta/classes-global/insane.bbclass
> b/meta/classes-global/insane.bbclass
> > > >> > index ee34d5208d1..8788f58fc5b 100644
> > > >> > --- a/meta/classes-global/insane.bbclass
> > > >> > +++ b/meta/classes-global/insane.bbclass
> > > >> > @@ -617,22 +617,14 @@ def check_32bit_symbols(path, packagename,
> d, elf, messages):
> > > >> >              # At this point, any symbol information is stripped
> into the debug
> > > >> >              # package, so that is the only place we will find
> them.
> > > >> >              elfpath =3D elfpath.replace('.debug/', '')
> > > >> > -            allowed =3D (
> > > >> > -                d.getVarFlag(
> > > >> > -                    'INSANE_SKIP:' + d.getVar('PN'),
> elfpath.replace('/', '_')
> > > >> > -                ) or ''
> > > >> > -            ).split()
> > > >> > -            usedapis -=3D set(allowed)
> > > >> > -            if usedapis:
> > > >> > +            allowed =3D "32bit-time" in (d.getVar('INSANE_SKIP'=
)
> or '').split()
> > > >> > +            if not allowed:
> > > >> >                  msgformat =3D elfpath + " uses 32-bit api '%s'"
> > > >> >                  for sym in usedapis:
> > > >> >                      oe.qa.add_message(messages, '32bit-time',
> msgformat % sym)
> > > >> >                  oe.qa.add_message(
> > > >> >                      messages, '32bit-time',
> > > >> > -                    'Suppress with INSANE_SKIP:%s[%s] =3D "%s"'=
 % (
> > > >> > -                        d.getVar('PN'), elfpath.replace('/',
> '_'),
> > > >> > -                        ' '.join(usedapis)
> > > >> > -                    )
> > > >> > +                    'Suppress with INSANE_SKIP =3D "32bit-time"=
'
> > > >> >                  )
> > > >> >
> > > >> >  # Check license variables
> > > >> > diff --git a/meta/conf/distro/include/time64.inc
> b/meta/conf/distro/include/time64.inc
> > > >> > index f3bdfba4acf..1a3399bc5e6 100644
> > > >> > --- a/meta/conf/distro/include/time64.inc
> > > >> > +++ b/meta/conf/distro/include/time64.inc
> > > >> > @@ -30,10 +30,16 @@ GLIBC_64BIT_TIME_FLAGS:pn-pipewire =3D ""
> > > >> >  GLIBC_64BIT_TIME_FLAGS:pn-pulseaudio =3D ""
> > > >> >  GLIBC_64BIT_TIME_FLAGS:pn-gcc-sanitizers =3D ""
> > > >> >
> > > >> >
> -INSANE_SKIP:libstd-rs[_usr_lib_rustlib_armv7-poky-linux-gnueabihf_lib_li=
bstd.so]
> =3D "clock_gettime gettime fcntl fstat64 fstatat64 getsockopt ioctl lstat=
64
> nanosleep prctl recvmsg sendmsg setsockopt stat64"
> > > >> > -INSANE_SKIP:librsvg[_usr_bin_rsvg-convert] =3D "fcntl fstat64
> prctl stat64 clock_gettime"
> > > >> > -INSANE_SKIP:librsvg[_usr_lib_librsvg-2.so.2.48.0] =3D "fcntl
> lstat64 setsockopt sendmsg fstat64 getsockopt ioctl nanosleep timegm
> fstatat64 prctl mktime gmtime_r recvmsg stat64 clock_gettime localtime_r"
> > > >> > -
> > > >> > -# libpulsedsp.so is a preload-library that hooks libc functions
> > > >> > -INSANE_SKIP:pulseaudio[_usr_lib_pulseaudio_libpulsedsp.so] =3D
> "setsockopt fcntl"
> > > >> > +INSANE_SKIP:append:pn-cargo =3D " 32bit-time"
> > > >> > +INSANE_SKIP:append:pn-gcc-sanitizers =3D " 32bit-time"
> > > >> > +INSANE_SKIP:append:pn-glibc =3D " 32bit-time"
> > > >> > +INSANE_SKIP:append:pn-glibc-tests =3D " 32bit-time"
> > > >> > +INSANE_SKIP:append:pn-librsvg =3D " 32bit-time"
> > > >> > +INSANE_SKIP:append:pn-libstd-rs =3D " 32bit-time"
> > > >> > +INSANE_SKIP:append:pn-pulseaudio =3D " 32bit-time"
> > > >> > +INSANE_SKIP:append:pn-python3-bcrypt =3D " 32bit-time"
> > > >> > +INSANE_SKIP:append:pn-python3-cryptography =3D " 32bit-time"
> > > >> > +INSANE_SKIP:append:pn-rust =3D " 32bit-time"
> > > >> > +INSANE_SKIP:append:pn-rust-hello-world =3D " 32bit-time"
> > > >> > +INSANE_SKIP:append:pn-strace =3D " 32bit-time"
> > > >> >
> > > >> > --
> > > >> > 2.30.2
> > > >> >
> > > >> >
> > > >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > >> > Links: You receive all messages sent to this group.
> > > >> > View/Reply Online (#180428):
> https://lists.openembedded.org/g/openembedded-core/message/180428
> > > >> > Mute This Topic:
> https://lists.openembedded.org/mt/98511412/1997914
> > > >> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > >> > Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> > > >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > >> >
>

--0000000000001869d605fa97d266
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">So how would I replicate these? What build is actually be=
ing run?</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon=
 1. May 2023 at 2.23, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">ra=
j.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:s=
olid;padding-left:1ex;border-left-color:rgb(204,204,204)">here is latest - =
<a href=3D"https://errors.yoctoproject.org/Errors/Build/163426/" rel=3D"nor=
eferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/Build/163=
426/</a><br>
I have tree rebased on alex&#39;es master-next here<br>
<br>
<a href=3D"https://git.yoctoproject.org/poky-contrib/log/?h=3Dyoe/mut" rel=
=3D"noreferrer" target=3D"_blank">https://git.yoctoproject.org/poky-contrib=
/log/?h=3Dyoe/mut</a><br>
<br>
On Sat, Apr 29, 2023 at 10:35=E2=80=AFPM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; This looks like a build with v1 version of the patchset, and not v2.<b=
r>
&gt; Pseudo has been specifically excluded from the qa check in v2 for<br>
&gt; instance.<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt; On Sun, 30 Apr 2023 at 07:16, Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"https://errors.yoctoproject.org/Errors/Build/163415/" =
rel=3D"noreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors=
/Build/163415/</a><br>
&gt; &gt;<br>
&gt; &gt; On Sat, Apr 29, 2023 at 9:49=E2=80=AFPM Alexander Kanavin<br>
&gt; &gt; &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">a=
lex.kanavin@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Can I see the error please?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Alex<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Sat 29. Apr 2023 at 21.23, Khem Raj &lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br=
>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; its still triggering as error.<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; On Wed, Apr 26, 2023 at 2:50=E2=80=AFAM Alexander Kanavi=
n<br>
&gt; &gt; &gt;&gt; &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"=
_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt;&gt; &gt; Existing implementation required to list both speci=
fic problematic apis, and files that<br>
&gt; &gt; &gt;&gt; &gt; use them: neither is necessary as both are seen in =
package_qa error messages, and<br>
&gt; &gt; &gt;&gt; &gt; can cause excessive amount of exception lines, if t=
here are too many files, or<br>
&gt; &gt; &gt;&gt; &gt; they are installed in arch-specific locations. Also=
, the value of INSANE_SKIP<br>
&gt; &gt; &gt;&gt; &gt; should be the test that needs to be skipped, and in=
 this case it wasn&#39;t.<br>
&gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt;&gt; &gt; Also, all problematic recipes are now correctly lis=
ted.<br>
&gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt;&gt; &gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mai=
lto:alex@linutronix.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; &gt; &gt;&gt; &gt; ---<br>
&gt; &gt; &gt;&gt; &gt;=C2=A0 meta/classes-global/insane.bbclass=C2=A0 | 14=
 +++-----------<br>
&gt; &gt; &gt;&gt; &gt;=C2=A0 meta/conf/distro/include/time64.inc | 18 ++++=
++++++++------<br>
&gt; &gt; &gt;&gt; &gt;=C2=A0 2 files changed, 15 insertions(+), 17 deletio=
ns(-)<br>
&gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt;&gt; &gt; diff --git a/meta/classes-global/insane.bbclass b/m=
eta/classes-global/insane.bbclass<br>
&gt; &gt; &gt;&gt; &gt; index ee34d5208d1..8788f58fc5b 100644<br>
&gt; &gt; &gt;&gt; &gt; --- a/meta/classes-global/insane.bbclass<br>
&gt; &gt; &gt;&gt; &gt; +++ b/meta/classes-global/insane.bbclass<br>
&gt; &gt; &gt;&gt; &gt; @@ -617,22 +617,14 @@ def check_32bit_symbols(path,=
 packagename, d, elf, messages):<br>
&gt; &gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # A=
t this point, any symbol information is stripped into the debug<br>
&gt; &gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # p=
ackage, so that is the only place we will find them.<br>
&gt; &gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elf=
path =3D elfpath.replace(&#39;.debug/&#39;, &#39;&#39;)<br>
&gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 allowed =
=3D (<br>
&gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 d.getVarFlag(<br>
&gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &#39;INSANE_SKIP:&#39; + d.getVar(&#39;PN&#39;), elfpa=
th.replace(&#39;/&#39;, &#39;_&#39;)<br>
&gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ) or &#39;&#39;<br>
&gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ).split(=
)<br>
&gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 usedapis=
 -=3D set(allowed)<br>
&gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if useda=
pis:<br>
&gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 allowed =
=3D &quot;32bit-time&quot; in (d.getVar(&#39;INSANE_SKIP&#39;) or &#39;&#39=
;).split()<br>
&gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not a=
llowed:<br>
&gt; &gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 msgformat =3D elfpath + &quot; uses 32-bit api &#39;%s&#39;&quot=
;<br>
&gt; &gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 for sym in usedapis:<br>
&gt; &gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 oe.qa.add_message(messages, &#39;32bit-time&#39;, =
msgformat % sym)<br>
&gt; &gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 oe.qa.add_message(<br>
&gt; &gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 messages, &#39;32bit-time&#39;,<br>
&gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &#39;Suppress with INSANE_SKIP:%s[%s] =3D &quot;%s&quo=
t;&#39; % (<br>
&gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.getVar(&#39;PN&#39;), elfpath.replace(=
&#39;/&#39;, &#39;_&#39;),<br>
&gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39; &#39;.join(usedapis)<br>
&gt; &gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 )<br>
&gt; &gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &#39;Suppress with INSANE_SKIP =3D &quot;32bit-time&qu=
ot;&#39;<br>
&gt; &gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 )<br>
&gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt;&gt; &gt;=C2=A0 # Check license variables<br>
&gt; &gt; &gt;&gt; &gt; diff --git a/meta/conf/distro/include/time64.inc b/=
meta/conf/distro/include/time64.inc<br>
&gt; &gt; &gt;&gt; &gt; index f3bdfba4acf..1a3399bc5e6 100644<br>
&gt; &gt; &gt;&gt; &gt; --- a/meta/conf/distro/include/time64.inc<br>
&gt; &gt; &gt;&gt; &gt; +++ b/meta/conf/distro/include/time64.inc<br>
&gt; &gt; &gt;&gt; &gt; @@ -30,10 +30,16 @@ GLIBC_64BIT_TIME_FLAGS:pn-pipew=
ire =3D &quot;&quot;<br>
&gt; &gt; &gt;&gt; &gt;=C2=A0 GLIBC_64BIT_TIME_FLAGS:pn-pulseaudio =3D &quo=
t;&quot;<br>
&gt; &gt; &gt;&gt; &gt;=C2=A0 GLIBC_64BIT_TIME_FLAGS:pn-gcc-sanitizers =3D =
&quot;&quot;<br>
&gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt;&gt; &gt; -INSANE_SKIP:libstd-rs[_usr_lib_rustlib_armv7-poky-=
linux-gnueabihf_lib_libstd.so] =3D &quot;clock_gettime gettime fcntl fstat6=
4 fstatat64 getsockopt ioctl lstat64 nanosleep prctl recvmsg sendmsg setsoc=
kopt stat64&quot;<br>
&gt; &gt; &gt;&gt; &gt; -INSANE_SKIP:librsvg[_usr_bin_rsvg-convert] =3D &qu=
ot;fcntl fstat64 prctl stat64 clock_gettime&quot;<br>
&gt; &gt; &gt;&gt; &gt; -INSANE_SKIP:librsvg[_usr_lib_librsvg-2.so.2.48.0] =
=3D &quot;fcntl lstat64 setsockopt sendmsg fstat64 getsockopt ioctl nanosle=
ep timegm fstatat64 prctl mktime gmtime_r recvmsg stat64 clock_gettime loca=
ltime_r&quot;<br>
&gt; &gt; &gt;&gt; &gt; -<br>
&gt; &gt; &gt;&gt; &gt; -# libpulsedsp.so is a preload-library that hooks l=
ibc functions<br>
&gt; &gt; &gt;&gt; &gt; -INSANE_SKIP:pulseaudio[_usr_lib_pulseaudio_libpuls=
edsp.so] =3D &quot;setsockopt fcntl&quot;<br>
&gt; &gt; &gt;&gt; &gt; +INSANE_SKIP:append:pn-cargo =3D &quot; 32bit-time&=
quot;<br>
&gt; &gt; &gt;&gt; &gt; +INSANE_SKIP:append:pn-gcc-sanitizers =3D &quot; 32=
bit-time&quot;<br>
&gt; &gt; &gt;&gt; &gt; +INSANE_SKIP:append:pn-glibc =3D &quot; 32bit-time&=
quot;<br>
&gt; &gt; &gt;&gt; &gt; +INSANE_SKIP:append:pn-glibc-tests =3D &quot; 32bit=
-time&quot;<br>
&gt; &gt; &gt;&gt; &gt; +INSANE_SKIP:append:pn-librsvg =3D &quot; 32bit-tim=
e&quot;<br>
&gt; &gt; &gt;&gt; &gt; +INSANE_SKIP:append:pn-libstd-rs =3D &quot; 32bit-t=
ime&quot;<br>
&gt; &gt; &gt;&gt; &gt; +INSANE_SKIP:append:pn-pulseaudio =3D &quot; 32bit-=
time&quot;<br>
&gt; &gt; &gt;&gt; &gt; +INSANE_SKIP:append:pn-python3-bcrypt =3D &quot; 32=
bit-time&quot;<br>
&gt; &gt; &gt;&gt; &gt; +INSANE_SKIP:append:pn-python3-cryptography =3D &qu=
ot; 32bit-time&quot;<br>
&gt; &gt; &gt;&gt; &gt; +INSANE_SKIP:append:pn-rust =3D &quot; 32bit-time&q=
uot;<br>
&gt; &gt; &gt;&gt; &gt; +INSANE_SKIP:append:pn-rust-hello-world =3D &quot; =
32bit-time&quot;<br>
&gt; &gt; &gt;&gt; &gt; +INSANE_SKIP:append:pn-strace =3D &quot; 32bit-time=
&quot;<br>
&gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt;&gt; &gt; --<br>
&gt; &gt; &gt;&gt; &gt; 2.30.2<br>
&gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; &gt;&gt; &gt; Links: You receive all messages sent to this group.=
<br>
&gt; &gt; &gt;&gt; &gt; View/Reply Online (#180428): <a href=3D"https://lis=
ts.openembedded.org/g/openembedded-core/message/180428" rel=3D"noreferrer" =
target=3D"_blank">https://lists.openembedded.org/g/openembedded-core/messag=
e/180428</a><br>
&gt; &gt; &gt;&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembed=
ded.org/mt/98511412/1997914" rel=3D"noreferrer" target=3D"_blank">https://l=
ists.openembedded.org/mt/98511412/1997914</a><br>
&gt; &gt; &gt;&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-core%2B=
owner@lists.openembedded.org" target=3D"_blank">openembedded-core+owner@lis=
ts.openembedded.org</a><br>
&gt; &gt; &gt;&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.=
org/g/openembedded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:ra=
j.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; &gt; &gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; &gt;&gt; &gt;<br>
</blockquote></div></div>

--0000000000001869d605fa97d266--

