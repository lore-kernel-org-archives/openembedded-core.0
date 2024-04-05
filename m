Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66407CD11C2
	for <webhook@archiver.kernel.org>; Fri,  5 Apr 2024 13:03:07 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.10941.1712322178781173850
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Apr 2024 06:02:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KHqu0ijY;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6eaf1a3e917so1826929b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Apr 2024 06:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712322178; x=1712926978; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c2sP2k6/kwWan3y719IriZoHXk59r3HxgSITDz9u/Nc=;
        b=KHqu0ijYThnz7qLqF2SsNM3oW9GEqOMN70uxqCKuIlzkr6tAQSwY2GByTq3LsjxazZ
         7oYhpm/Ozr62w1jNvp7NHrgOhXvJ8SG3idPnEfM4d2+Aaah7zl//rAPuR1dxxFjqAJc5
         JfTboBJPaNAAslPJv3LtAgefZkz4k4mHLzSHACEFKTq/OfSJ3M4dKnJxR3/EXbi2eH+N
         n+XLMhAL3/U1KmB8AbEiyEST9ZHpjeU1ZevW9gIq0ajtX18y0It1Ae/V34xJXCAzg+XD
         dc03LhrUk9GqcyPLk6yCsqHAuRF/16tmjCB+cq/VM62rmUJxVYCReiOyEH2XEAq+sFMU
         nn0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712322178; x=1712926978;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c2sP2k6/kwWan3y719IriZoHXk59r3HxgSITDz9u/Nc=;
        b=NvvP9e6lqIaVW9R/QY8ymOSpMbivkyyLUHFX4ybL3nAwHxFXzaJ68G1vi0yYikP+YE
         KUTPP71ma+4PMn+T/joYN4vFtgISBCIexUWgBwLSbt14svRaDCxDSo+EtK3kUYloid2j
         y7nialg0+4ge7roG+YHgDxc2Y3q9PEkKJO+UIK32EZeWmdkQUOYRDwwjd+9uc+eXTAlD
         gx2FF7GIkk/J05X3Iuv8omnLoKRTnYeHcRAihXMVrKYKeFQsF7IO9Pdu1rKfu7iNdjU/
         EBz2v+CYItB/ro8pBwAl8fI+EJje1wMXKLs267etL80vdSepEKL063AY9gBWqsqfrHuc
         er5g==
X-Forwarded-Encrypted: i=1; AJvYcCUR0xz2eAx9ikPRttNMkHmSbHqOp+9pUXey2hLDRwvzOQzUCjKamk0OKeaLVLqav28mLzQ41EVugfaq5lYH9DzpC2MLWWmcK/ARQi/VFIWwfrQQG6FFWRMW
X-Gm-Message-State: AOJu0YyqMcosFINY0hwP8MGuxse1KOzJuWNlar7izDafWFpsgh/s28IR
	Wa23JKJ9x7WJSQO6djBdTuMf+sDtGKlgXAi3nyWB2kLELEReD+nqViCHLcRyZ+9XP+AKrGJc5T/
	ZOVArry7/LCGozc9uYySWjIwyzN0=
X-Google-Smtp-Source: AGHT+IFuevLAsCCufx3q38LgVevRPDixWN69MBogSKiM+z5r9eCSUQ4YfZanT21kX3RM5OiCyGlXvQZfc6HbT0UzQZ0=
X-Received: by 2002:a17:903:44a:b0:1e2:a177:d6b with SMTP id
 iw10-20020a170903044a00b001e2a1770d6bmr1268055plb.19.1712322177964; Fri, 05
 Apr 2024 06:02:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240404204702.3380236-1-bruce.ashfield@gmail.com>
 <20240404204702.3380236-2-bruce.ashfield@gmail.com> <CAEHkU3WEdLDW=cOxWkp8vjBbmsGa_b8Q3XZwSpEYkxywdWq4NQ@mail.gmail.com>
In-Reply-To: <CAEHkU3WEdLDW=cOxWkp8vjBbmsGa_b8Q3XZwSpEYkxywdWq4NQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 5 Apr 2024 09:02:46 -0400
Message-ID: <CADkTA4NYEAH7hnKVr86nmMqYv2X82-_9pz-xn+q0utzWL9nO=w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2][RFC] perf: make bpf asm include arch conditional
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000028a41f0615591366"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Apr 2024 13:03:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197985

--00000000000028a41f0615591366
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 5, 2024 at 8:38=E2=80=AFAM Max Krummenacher <max.oss.09@gmail.c=
om>
wrote:

> Hi Bruce
>
> Thanks for working on this.
>
> On Thu, Apr 4, 2024 at 10:47=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gm=
ail.com>
> wrote:
> >
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > To keep the perf source copying as small as possible, we can
> > further refine the arch/uapi copy to the single file that we
> > currently need.
>
> With that design goal in mind I would go with this solution,
> Tested for an aarch64 target, 6.9-rc2 builds perf for me while before
> this series it failed.
>
> >
> > To avoid a warning from the general perf source copy routine,
> > we make the .h conditional based on the architecture.
> >
> > The supported architectures will not change often, so updating
> > this arch list is very minimal effort. Alternatively, we could
> > add a PERF_OPTIONAL_SRC variable and not warn if a file isn't
> > available for a given architecture.
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >
> > This is a further refinement of the perf header that
> > is required outside of tools.
> >
> > I'm trying it this way first, versus making the perf
> > source copy not warn on missing files, since we risk
> > skipping warnings we want to see!
> >
> > Bruce
> >
> >  meta/recipes-kernel/perf/perf.bb | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-kernel/perf/perf.bb
> b/meta/recipes-kernel/perf/perf.bb
> > index 2f540cd54b..3cc7f63610 100644
> > --- a/meta/recipes-kernel/perf/perf.bb
> > +++ b/meta/recipes-kernel/perf/perf.bb
> > @@ -129,7 +129,9 @@ EXTRA_OEMAKE +=3D "\
> >  # honour a JOBS variable.
> >  EXTRA_OEMAKE:append:task-configure =3D " JOBS=3D1"
> >
> > -# include/uapi/asm is for: include/uapi/asm/bpf_perf_event.h
> > +# the architectures that need this file can be found in
> > +# ./tools/include/uapi/asm/bpf_perf_event.h
> > +PERF_BPF_EVENT_SRC ?=3D '${@bb.utils.contains_any("ARCH", [ "riscv",
> "arm64", "powerpc" ], "arch/${ARCH}/include/uapi/asm/bpf_perf_event.h", "=
",
> d)}'
>
> s/powerpc/loongarch/
> If I get it right from tools/include/uapi/asm/bpf_perf_event.h powerpc
>

You are correct! I swear I read powerpc in the file, but looking
again this morning .. it isn't there!


> is not needed. (I didn't test)
> However "loongarch" does and seems to be supported in OE.
>
>
Correct! I skipped arc and s390 for the same reason. If someone
is using those arches, we can find out when they send a patch.

I'm going to send a v2 with powerpc dropped from the list.

Thanks for the test and review, it is most appreciated.

Bruce



> Cheers
> Max
>
> >  PERF_SRC ?=3D "Makefile \
> >               tools/arch \
> >               tools/build \
> > @@ -140,7 +142,7 @@ PERF_SRC ?=3D "Makefile \
> >               tools/scripts \
> >               scripts/ \
> >               arch/arm64/tools \
> > -             arch/${ARCH}/include/uapi/asm/ \
> > +             ${PERF_BPF_EVENT_SRC} \
> >               arch/${ARCH}/Makefile \
> >  "
> >
> > --
> > 2.39.2
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#197973):
> https://lists.openembedded.org/g/openembedded-core/message/197973
> > Mute This Topic: https://lists.openembedded.org/mt/105337225/3617484
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> max.oss.09@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000028a41f0615591366
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Apr 5, 2024 at 8:38=E2=80=AFAM Max Krummena=
cher &lt;<a href=3D"mailto:max.oss.09@gmail.com">max.oss.09@gmail.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Bru=
ce<br>
<br>
Thanks for working on this.<br>
<br>
On Thu, Apr 4, 2024 at 10:47=E2=80=AFPM Bruce Ashfield &lt;<a href=3D"mailt=
o:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&=
gt; wrote:<br>
&gt;<br>
&gt; From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" t=
arget=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt;<br>
&gt; To keep the perf source copying as small as possible, we can<br>
&gt; further refine the arch/uapi copy to the single file that we<br>
&gt; currently need.<br>
<br>
With that design goal in mind I would go with this solution,<br>
Tested for an aarch64 target, 6.9-rc2 builds perf for me while before<br>
this series it failed.<br>
<br>
&gt;<br>
&gt; To avoid a warning from the general perf source copy routine,<br>
&gt; we make the .h conditional based on the architecture.<br>
&gt;<br>
&gt; The supported architectures will not change often, so updating<br>
&gt; this arch list is very minimal effort. Alternatively, we could<br>
&gt; add a PERF_OPTIONAL_SRC variable and not warn if a file isn&#39;t<br>
&gt; available for a given architecture.<br>
&gt;<br>
&gt; Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gma=
il.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;<br>
&gt; This is a further refinement of the perf header that<br>
&gt; is required outside of tools.<br>
&gt;<br>
&gt; I&#39;m trying it this way first, versus making the perf<br>
&gt; source copy not warn on missing files, since we risk<br>
&gt; skipping warnings we want to see!<br>
&gt;<br>
&gt; Bruce<br>
&gt;<br>
&gt;=C2=A0 meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noref=
errer" target=3D"_blank">perf.bb</a> | 6 ++++--<br>
&gt;=C2=A0 1 file changed, 4 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=
=3D"noreferrer" target=3D"_blank">perf.bb</a> b/meta/recipes-kernel/perf/<a=
 href=3D"http://perf.bb" rel=3D"noreferrer" target=3D"_blank">perf.bb</a><b=
r>
&gt; index 2f540cd54b..3cc7f63610 100644<br>
&gt; --- a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noref=
errer" target=3D"_blank">perf.bb</a><br>
&gt; +++ b/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noref=
errer" target=3D"_blank">perf.bb</a><br>
&gt; @@ -129,7 +129,9 @@ EXTRA_OEMAKE +=3D &quot;\<br>
&gt;=C2=A0 # honour a JOBS variable.<br>
&gt;=C2=A0 EXTRA_OEMAKE:append:task-configure =3D &quot; JOBS=3D1&quot;<br>
&gt;<br>
&gt; -# include/uapi/asm is for: include/uapi/asm/bpf_perf_event.h<br>
&gt; +# the architectures that need this file can be found in<br>
&gt; +# ./tools/include/uapi/asm/bpf_perf_event.h<br>
&gt; +PERF_BPF_EVENT_SRC ?=3D &#39;${@bb.utils.contains_any(&quot;ARCH&quot=
;, [ &quot;riscv&quot;, &quot;arm64&quot;, &quot;powerpc&quot; ], &quot;arc=
h/${ARCH}/include/uapi/asm/bpf_perf_event.h&quot;, &quot;&quot;, d)}&#39;<b=
r>
<br>
s/powerpc/loongarch/<br>
If I get it right from tools/include/uapi/asm/bpf_perf_event.h powerpc<br><=
/blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-=
size:small">You are correct! I swear I read powerpc in the file, but lookin=
g</div><div class=3D"gmail_default" style=3D"font-size:small">again this mo=
rning .. it isn&#39;t there!</div><div class=3D"gmail_default" style=3D"fon=
t-size:small">=C2=A0<br></div></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
is not needed. (I didn&#39;t test)<br>
However &quot;loongarch&quot; does and seems to be supported in OE.<br>
<br></blockquote><div><br></div><div class=3D"gmail_default" style=3D"font-=
size:small">Correct! I skipped arc and s390 for the same reason. If someone=
</div><div class=3D"gmail_default" style=3D"font-size:small">is using those=
 arches, we can find out when they send a patch.</div><div class=3D"gmail_d=
efault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" st=
yle=3D"font-size:small">I&#39;m going to send a v2 with powerpc dropped fro=
m the list.</div><div class=3D"gmail_default" style=3D"font-size:small"><br=
></div><div class=3D"gmail_default" style=3D"font-size:small">Thanks for th=
e test and review, it is most appreciated.</div><div class=3D"gmail_default=
" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D=
"font-size:small">Bruce</div><div><br></div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
Cheers<br>
Max<br>
<br>
&gt;=C2=A0 PERF_SRC ?=3D &quot;Makefile \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tools/arch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tools/build \<br=
>
&gt; @@ -140,7 +142,7 @@ PERF_SRC ?=3D &quot;Makefile \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tools/scripts \<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0scripts/ \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arch/arm64/tools=
 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arch/${ARCH}/include/=
uapi/asm/ \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PERF_BPF_EVENT_SRC}=
 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arch/${ARCH}/Mak=
efile \<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt; --<br>
&gt; 2.39.2<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#197973): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/197973" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/197973</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10533722=
5/3617484" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/105337225/3617484</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:max.oss.09@gmail.com"=
 target=3D"_blank">max.oss.09@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div></div>

--00000000000028a41f0615591366--

