Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7BFAC77B60
	for <webhook@archiver.kernel.org>; Sun, 30 Apr 2023 04:49:39 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.63038.1682830174616003096
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Apr 2023 21:49:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=qtfDM8Ut;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2a8eb8db083so12798001fa.3
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Apr 2023 21:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682830173; x=1685422173;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HqWWMsVyrlELlJFP1aBUIzf4bo3KIOSeHKEWfznRMMc=;
        b=qtfDM8UtFRF0jfYvJNifHnkHnLlzli7QYYi19bvp6bvmyc8VtThrEigxkqwE19o03M
         8eKGYYaLiERbhaLRurmdPjHYjoBRhxbtVu/q9qwuToCMBlKfGqysi113vRHuR4oBUYjp
         Tdl0omxlK2vYGpTgCDXlX1UIB80Hi4GgoRX4I26ZUorzA9Tl1bjqMmGK9BFDRZcSmpDI
         Q+Kcj3PRXxKAhmp33UA5Lm0XbEzbjJWEN5d1yF/6U+kNHPIiSndpE+9W2nYSQm4sqDoO
         MVWAzdU3guvYwTZW8zr+0caae1py360SHke+zP95vzds3KCvovMPgduHqecu1HUDmLwq
         F8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682830173; x=1685422173;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HqWWMsVyrlELlJFP1aBUIzf4bo3KIOSeHKEWfznRMMc=;
        b=F1c0fUvY1dCEKaFHfmHznfp11DImV6clMyT98RoI5IXr7JPNLGSyZ7Mp5Ij4fEa3fM
         xB7/1Y29S274YFymaOl5YJTasRY6O/9apZkEnj5b6IRyDOvaWl0Yi/ansFmzA6SIK4Ob
         ZwPwaV3rSr0nTB4vxW16RJ4L8OusJV34m5mgM7iNnUCsYEr6N7UiCJGUjKtpOaW/OeOD
         JY4OLDcmaUlAzyxeGm96Hj7rzabBNEDN8NlnRLDzm8SPrv4luN4IdSWkzSJdM+enveMP
         moswLLZ19b847BFxL7vQsVT59IkZ6hxgrtMPLFVaO/A1POOY28ebM7To5Zd8j1V95cZF
         zi7g==
X-Gm-Message-State: AC+VfDx1oXrs0cJLsJPzkPIOtrAKVEGbi+fks7Tw1wKDI7rlTxS7S6gm
	mFKVWqwKOrzodlWdxJWzxQogeuoNlUIFmN9wHAU=
X-Google-Smtp-Source: ACHHUZ6/EWqjkr4LHPjZILdC7klysunYaoukqtNEBmEV2cTfNgmPnx/tzjMXQcvebpWl9/98tHbctyQPFgTck3QKT2g=
X-Received: by 2002:a2e:9a83:0:b0:2a8:ae90:83d6 with SMTP id
 p3-20020a2e9a83000000b002a8ae9083d6mr2994196lji.48.1682830172502; Sat, 29 Apr
 2023 21:49:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230426095036.2632847-1-alex@linutronix.de> <20230426095036.2632847-10-alex@linutronix.de>
 <CAMKF1sqM-WhYtLALHemrPC62qMaA4h41UNr_kP6brLvbdJ2j+w@mail.gmail.com>
In-Reply-To: <CAMKF1sqM-WhYtLALHemrPC62qMaA4h41UNr_kP6brLvbdJ2j+w@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 30 Apr 2023 06:49:21 +0200
Message-ID: <CANNYZj-JbHNHLd1Dh5WAeBUoqLNwoKcdpeDH1UKkxhfsLZSfWQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 10/11] insane.bbclass: simplify exceptions for
 32 bit time API check
To: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex@linutronix.de>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a63c8b05fa866e9d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Apr 2023 04:49:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180563

--000000000000a63c8b05fa866e9d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Can I see the error please?

Alex

On Sat 29. Apr 2023 at 21.23, Khem Raj <raj.khem@gmail.com> wrote:

> its still triggering as error.
>
> On Wed, Apr 26, 2023 at 2:50=E2=80=AFAM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Existing implementation required to list both specific problematic apis=
,
> and files that
> > use them: neither is necessary as both are seen in package_qa error
> messages, and
> > can cause excessive amount of exception lines, if there are too many
> files, or
> > they are installed in arch-specific locations. Also, the value of
> INSANE_SKIP
> > should be the test that needs to be skipped, and in this case it wasn't=
.
> >
> > Also, all problematic recipes are now correctly listed.
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  meta/classes-global/insane.bbclass  | 14 +++-----------
> >  meta/conf/distro/include/time64.inc | 18 ++++++++++++------
> >  2 files changed, 15 insertions(+), 17 deletions(-)
> >
> > diff --git a/meta/classes-global/insane.bbclass
> b/meta/classes-global/insane.bbclass
> > index ee34d5208d1..8788f58fc5b 100644
> > --- a/meta/classes-global/insane.bbclass
> > +++ b/meta/classes-global/insane.bbclass
> > @@ -617,22 +617,14 @@ def check_32bit_symbols(path, packagename, d, elf=
,
> messages):
> >              # At this point, any symbol information is stripped into
> the debug
> >              # package, so that is the only place we will find them.
> >              elfpath =3D elfpath.replace('.debug/', '')
> > -            allowed =3D (
> > -                d.getVarFlag(
> > -                    'INSANE_SKIP:' + d.getVar('PN'),
> elfpath.replace('/', '_')
> > -                ) or ''
> > -            ).split()
> > -            usedapis -=3D set(allowed)
> > -            if usedapis:
> > +            allowed =3D "32bit-time" in (d.getVar('INSANE_SKIP') or
> '').split()
> > +            if not allowed:
> >                  msgformat =3D elfpath + " uses 32-bit api '%s'"
> >                  for sym in usedapis:
> >                      oe.qa.add_message(messages, '32bit-time', msgforma=
t
> % sym)
> >                  oe.qa.add_message(
> >                      messages, '32bit-time',
> > -                    'Suppress with INSANE_SKIP:%s[%s] =3D "%s"' % (
> > -                        d.getVar('PN'), elfpath.replace('/', '_'),
> > -                        ' '.join(usedapis)
> > -                    )
> > +                    'Suppress with INSANE_SKIP =3D "32bit-time"'
> >                  )
> >
> >  # Check license variables
> > diff --git a/meta/conf/distro/include/time64.inc
> b/meta/conf/distro/include/time64.inc
> > index f3bdfba4acf..1a3399bc5e6 100644
> > --- a/meta/conf/distro/include/time64.inc
> > +++ b/meta/conf/distro/include/time64.inc
> > @@ -30,10 +30,16 @@ GLIBC_64BIT_TIME_FLAGS:pn-pipewire =3D ""
> >  GLIBC_64BIT_TIME_FLAGS:pn-pulseaudio =3D ""
> >  GLIBC_64BIT_TIME_FLAGS:pn-gcc-sanitizers =3D ""
> >
> >
> -INSANE_SKIP:libstd-rs[_usr_lib_rustlib_armv7-poky-linux-gnueabihf_lib_li=
bstd.so]
> =3D "clock_gettime gettime fcntl fstat64 fstatat64 getsockopt ioctl lstat=
64
> nanosleep prctl recvmsg sendmsg setsockopt stat64"
> > -INSANE_SKIP:librsvg[_usr_bin_rsvg-convert] =3D "fcntl fstat64 prctl
> stat64 clock_gettime"
> > -INSANE_SKIP:librsvg[_usr_lib_librsvg-2.so.2.48.0] =3D "fcntl lstat64
> setsockopt sendmsg fstat64 getsockopt ioctl nanosleep timegm fstatat64
> prctl mktime gmtime_r recvmsg stat64 clock_gettime localtime_r"
> > -
> > -# libpulsedsp.so is a preload-library that hooks libc functions
> > -INSANE_SKIP:pulseaudio[_usr_lib_pulseaudio_libpulsedsp.so] =3D
> "setsockopt fcntl"
> > +INSANE_SKIP:append:pn-cargo =3D " 32bit-time"
> > +INSANE_SKIP:append:pn-gcc-sanitizers =3D " 32bit-time"
> > +INSANE_SKIP:append:pn-glibc =3D " 32bit-time"
> > +INSANE_SKIP:append:pn-glibc-tests =3D " 32bit-time"
> > +INSANE_SKIP:append:pn-librsvg =3D " 32bit-time"
> > +INSANE_SKIP:append:pn-libstd-rs =3D " 32bit-time"
> > +INSANE_SKIP:append:pn-pulseaudio =3D " 32bit-time"
> > +INSANE_SKIP:append:pn-python3-bcrypt =3D " 32bit-time"
> > +INSANE_SKIP:append:pn-python3-cryptography =3D " 32bit-time"
> > +INSANE_SKIP:append:pn-rust =3D " 32bit-time"
> > +INSANE_SKIP:append:pn-rust-hello-world =3D " 32bit-time"
> > +INSANE_SKIP:append:pn-strace =3D " 32bit-time"
> >
> > --
> > 2.30.2
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#180428):
> https://lists.openembedded.org/g/openembedded-core/message/180428
> > Mute This Topic: https://lists.openembedded.org/mt/98511412/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000a63c8b05fa866e9d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Can I see the error please?=C2=A0</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Sat 29. Apr 2023 at 21.23, Khem Raj=
 &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-l=
eft-color:rgb(204,204,204)">its still triggering as error.<br>
<br>
On Wed, Apr 26, 2023 at 2:50=E2=80=AFAM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Existing implementation required to list both specific problematic api=
s, and files that<br>
&gt; use them: neither is necessary as both are seen in package_qa error me=
ssages, and<br>
&gt; can cause excessive amount of exception lines, if there are too many f=
iles, or<br>
&gt; they are installed in arch-specific locations. Also, the value of INSA=
NE_SKIP<br>
&gt; should be the test that needs to be skipped, and in this case it wasn&=
#39;t.<br>
&gt;<br>
&gt; Also, all problematic recipes are now correctly listed.<br>
&gt;<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix=
.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes-global/insane.bbclass=C2=A0 | 14 +++-----------<br>
&gt;=C2=A0 meta/conf/distro/include/time64.inc | 18 ++++++++++++------<br>
&gt;=C2=A0 2 files changed, 15 insertions(+), 17 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/=
insane.bbclass<br>
&gt; index ee34d5208d1..8788f58fc5b 100644<br>
&gt; --- a/meta/classes-global/insane.bbclass<br>
&gt; +++ b/meta/classes-global/insane.bbclass<br>
&gt; @@ -617,22 +617,14 @@ def check_32bit_symbols(path, packagename, d, el=
f, messages):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # At this point, any s=
ymbol information is stripped into the debug<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # package, so that is =
the only place we will find them.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elfpath =3D elfpath.re=
place(&#39;.debug/&#39;, &#39;&#39;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 allowed =3D (<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.getVarFlag(=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 &#39;INSANE_SKIP:&#39; + d.getVar(&#39;PN&#39;), elfpath.replace(&#39;/&#3=
9;, &#39;_&#39;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ) or &#39;&#3=
9;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ).split()<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 usedapis -=3D set(allowed)<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if usedapis:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 allowed =3D &quot;32bit-tim=
e&quot; in (d.getVar(&#39;INSANE_SKIP&#39;) or &#39;&#39;).split()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not allowed:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msgforma=
t =3D elfpath + &quot; uses 32-bit api &#39;%s&#39;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for sym =
in usedapis:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 oe.qa.add_message(messages, &#39;32bit-time&#39;, msgformat % sym)<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe.qa.ad=
d_message(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 messages, &#39;32bit-time&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 &#39;Suppress with INSANE_SKIP:%s[%s] =3D &quot;%s&quot;&#39; % (<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 d.getVar(&#39;PN&#39;), elfpath.replace(&#39;/&#39;, &#39;_&=
#39;),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 &#39; &#39;.join(usedapis)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 &#39;Suppress with INSANE_SKIP =3D &quot;32bit-time&quot;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt;<br>
&gt;=C2=A0 # Check license variables<br>
&gt; diff --git a/meta/conf/distro/include/time64.inc b/meta/conf/distro/in=
clude/time64.inc<br>
&gt; index f3bdfba4acf..1a3399bc5e6 100644<br>
&gt; --- a/meta/conf/distro/include/time64.inc<br>
&gt; +++ b/meta/conf/distro/include/time64.inc<br>
&gt; @@ -30,10 +30,16 @@ GLIBC_64BIT_TIME_FLAGS:pn-pipewire =3D &quot;&quot=
;<br>
&gt;=C2=A0 GLIBC_64BIT_TIME_FLAGS:pn-pulseaudio =3D &quot;&quot;<br>
&gt;=C2=A0 GLIBC_64BIT_TIME_FLAGS:pn-gcc-sanitizers =3D &quot;&quot;<br>
&gt;<br>
&gt; -INSANE_SKIP:libstd-rs[_usr_lib_rustlib_armv7-poky-linux-gnueabihf_lib=
_libstd.so] =3D &quot;clock_gettime gettime fcntl fstat64 fstatat64 getsock=
opt ioctl lstat64 nanosleep prctl recvmsg sendmsg setsockopt stat64&quot;<b=
r>
&gt; -INSANE_SKIP:librsvg[_usr_bin_rsvg-convert] =3D &quot;fcntl fstat64 pr=
ctl stat64 clock_gettime&quot;<br>
&gt; -INSANE_SKIP:librsvg[_usr_lib_librsvg-2.so.2.48.0] =3D &quot;fcntl lst=
at64 setsockopt sendmsg fstat64 getsockopt ioctl nanosleep timegm fstatat64=
 prctl mktime gmtime_r recvmsg stat64 clock_gettime localtime_r&quot;<br>
&gt; -<br>
&gt; -# libpulsedsp.so is a preload-library that hooks libc functions<br>
&gt; -INSANE_SKIP:pulseaudio[_usr_lib_pulseaudio_libpulsedsp.so] =3D &quot;=
setsockopt fcntl&quot;<br>
&gt; +INSANE_SKIP:append:pn-cargo =3D &quot; 32bit-time&quot;<br>
&gt; +INSANE_SKIP:append:pn-gcc-sanitizers =3D &quot; 32bit-time&quot;<br>
&gt; +INSANE_SKIP:append:pn-glibc =3D &quot; 32bit-time&quot;<br>
&gt; +INSANE_SKIP:append:pn-glibc-tests =3D &quot; 32bit-time&quot;<br>
&gt; +INSANE_SKIP:append:pn-librsvg =3D &quot; 32bit-time&quot;<br>
&gt; +INSANE_SKIP:append:pn-libstd-rs =3D &quot; 32bit-time&quot;<br>
&gt; +INSANE_SKIP:append:pn-pulseaudio =3D &quot; 32bit-time&quot;<br>
&gt; +INSANE_SKIP:append:pn-python3-bcrypt =3D &quot; 32bit-time&quot;<br>
&gt; +INSANE_SKIP:append:pn-python3-cryptography =3D &quot; 32bit-time&quot=
;<br>
&gt; +INSANE_SKIP:append:pn-rust =3D &quot; 32bit-time&quot;<br>
&gt; +INSANE_SKIP:append:pn-rust-hello-world =3D &quot; 32bit-time&quot;<br=
>
&gt; +INSANE_SKIP:append:pn-strace =3D &quot; 32bit-time&quot;<br>
&gt;<br>
&gt; --<br>
&gt; 2.30.2<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#180428): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/180428" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/180428</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98511412=
/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/98511412/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--000000000000a63c8b05fa866e9d--

