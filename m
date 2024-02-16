Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35E63C4829E
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 02:59:07 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web11.10690.1708052340129300355
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 18:59:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I0mfPuMp;
 spf=pass (domain: gmail.com, ip: 209.85.219.181, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dcbd1d4904dso1654558276.3
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 18:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708052339; x=1708657139; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xCTV2JUn6aQBmvm1mLX73/jt6IbdpFxNqnLf/aefOuo=;
        b=I0mfPuMp+qwBqucHscVp/JDlX3mG4BJxjlhR4RhXNBQ8ATRsWEAwc/C2l/1yXEPifc
         1DkUXuF3FrteDk2LiOFkef9+nCwWK0q3JhehkmJwUWaPSCTacHPfS+/IWJxOl1OXXeMK
         MH1nPnUbPfjUNvm5GR5owHb7Er+gIjgAJPn1m53S9Qw5UiwyklxMnd8PdE6YFkj04M1Q
         i599ts3xYxvuSYI4kxofWjHwpM/wUGX4zoDNeIDm7UC4IBuXySsXP2jg+H+WEU79J9g2
         y/xCQcYeD65jBzD2AbIRH6guPcmPoKbxGZqLgU59MSmR2NsvcuQQpSdBMHIS7aDfwR+8
         swtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708052339; x=1708657139;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xCTV2JUn6aQBmvm1mLX73/jt6IbdpFxNqnLf/aefOuo=;
        b=KWqrx2XeL1sRuOZ9HrZk/sC60zMYw66V1x4T6l3g22RNYK2Ns0pddTK16Y9bght/6p
         JMVULgDCgD+rvju3NTW0NMxTIoS1mz9AajWDMqkoOjp/rbK2PfTNj2ID0jDBp3k6iNmQ
         D+jJP5UKPu0hj4/YL4VscNAQBwuK8O4+gxU7LR7oUtbOkPb1j0Hyil6oqv4JMZmHVskk
         YMc+G4LhyQso8sOS51teNRI25ye3o/JL3Z7YteoISc5nd4wOBdDEie4MxrBj7SozqXsk
         9w1i792LSlB/HjF5BSVdaAGsGz/uQfkZUXCLUJoCUEH505euDGZWBicY8YN2LpSzST17
         /U6w==
X-Forwarded-Encrypted: i=1; AJvYcCWo2GpXmgVq9Jj/LoZFg4o/W9YjVmTYmRwXUOf8hLitSB4VXd/r/yM6T6OS/CS6AVWLgTOmaiM3IY1C63fNQ+RLuIArv67rD+1cqnlpbc9J4LFRq0bC6vsY
X-Gm-Message-State: AOJu0YxHEFiXXO/iMA/gs1XRtbyk5GsZnm+dHGF+J1b3LhzeVy+61paw
	FFzt6TM/WjrAsJZR0ad7PR8Wmilgcs1TdAGGLwE/FSjR8RfWXq3xXrNXUEB27Btu8rfx7QeaqUE
	BY0hyquqWGfnx5+OfldDJITZ5NZg=
X-Google-Smtp-Source: AGHT+IGko8P21FGaap3w+hI3jl7IlxJg6NCt0nhk/KUhPGMfW44arYnjaWeT3L4fBRU5ZEL224ApZpopPQMcjz/MniM=
X-Received: by 2002:a5b:289:0:b0:dcb:aa26:50fe with SMTP id
 x9-20020a5b0289000000b00dcbaa2650femr3702801ybl.15.1708052339209; Thu, 15 Feb
 2024 18:58:59 -0800 (PST)
MIME-Version: 1.0
References: <20240215212856.47492-1-richard.purdie@linuxfoundation.org> <CAMKF1spSaVrb5c2Cnm_2t=-rB0EbV57BkK22v=pfMsnOm1gsKg@mail.gmail.com>
In-Reply-To: <CAMKF1spSaVrb5c2Cnm_2t=-rB0EbV57BkK22v=pfMsnOm1gsKg@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 15 Feb 2024 18:58:48 -0800
Message-ID: <CANx9H-DJ6fTuMwujaBBJoYjRa8Wki5m1DTkHFggzy2wRqyw8cA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] openssh: Add a work around for ICE on mips/mips64
To: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Tim Orling <tim.orling@konsulko.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000efbab8061176ec39"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 02:59:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195737

--000000000000efbab8061176ec39
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I=E2=80=99m

On Thu, Feb 15, 2024 at 5:12=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:

> On Thu, Feb 15, 2024 at 1:29=E2=80=AFPM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > Unfortunately the new openssh version has an ICE on mips. This looks
> similar to:
> >
> > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D104817
> > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D104820
> >
> > Given how long these have been open, workaround the issue by disabling
> the compiler
> > hardening options on mips.
> >
> > It is likely better to do this than have the open CVEs for everyone
> > as we can't upgrade.
> >
> > An example:
> >
> > | during RTL pass: zero_call_used_regs
> > | clientloop.c: In function 'client_loop':
> > | clientloop.c:1699:1: internal compiler error: in int_mode_for_mode, a=
t
> stor-layout.cc:407
> > |  1699 | }
> > |       | ^
> > | 0x14d0acc internal_error(char const*, ...)
> > |       ???:0
> > | 0x5cf765 fancy_abort(char const*, int, char const*)
> > |       ???:0
> > | 0x826f1f emit_move_insn_1(rtx_def*, rtx_def*)
> > |       ???:0
> > | 0x8270c5 emit_move_insn(rtx_def*, rtx_def*)
> > |       ???:0
> > | 0xb7b994 default_zero_call_used_regs(HARD_REG_SET)
> > |       ???:0
> > | Please submit a full bug report, with preprocessed source (by using
> -freport-bug).
> > | Please include the complete backtrace with any bug report.
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/recipes-connectivity/openssh/openssh_9.6p1.bb | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
> b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
> > index 6366cefdf96..1fd36a266fd 100644
> > --- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
> > +++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
> > @@ -81,6 +81,10 @@ EXTRA_OECONF =3D "'LOGIN_PROGRAM=3D${base_bindir}/lo=
gin' \
> >  # musl doesn't implement wtmp/utmp and logwtmp
> >  EXTRA_OECONF:append:libc-musl =3D " --disable-wtmp --disable-lastlog"
> >
> > +# Work around ICE on mips/mips64 starting in 9.6p1
> > +EXTRA_OECONF:append:mips =3D " --without-hardening"
> > +EXTRA_OECONF:append:mips64 =3D " --without-hardening"
>
> Perhaps just use mipsarch override since I imagine it will impact all
> kinds of mips.
>

Just a data point, both qemumips and qemumips64 are based on the ~2006-ish
=E2=80=9CMalta=E2=80=9D machine. I don=E2=80=99t know yet if that set of tu=
ning is a factor (vs
=E2=80=9CBoston=E2=80=9D which is more like 2015). I=E2=80=99ll still follo=
w through with a bug
report on gcc bugzilla.


> > +
> >  # Since we do not depend on libbsd, we do not want configure to use it
> >  # just because it finds libutil.h.  But, specifying --disable-libutil
> >  # causes compile errors, so...
> > --
> > 2.40.1
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195733):
> https://lists.openembedded.org/g/openembedded-core/message/195733
> Mute This Topic: https://lists.openembedded.org/mt/104381904/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000efbab8061176ec39
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>I=E2=80=99m</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Feb 15, 2024 at 5:12=E2=80=AFPM Khem Raj &lt;<=
a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-co=
lor:rgb(204,204,204)">On Thu, Feb 15, 2024 at 1:29=E2=80=AFPM Richard Purdi=
e<br>
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank"=
>richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Unfortunately the new openssh version has an ICE on mips. This looks s=
imilar to:<br>
&gt;<br>
&gt; <a href=3D"https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D104817" rel=
=3D"noreferrer" target=3D"_blank">https://gcc.gnu.org/bugzilla/show_bug.cgi=
?id=3D104817</a><br>
&gt; <a href=3D"https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D104820" rel=
=3D"noreferrer" target=3D"_blank">https://gcc.gnu.org/bugzilla/show_bug.cgi=
?id=3D104820</a><br>
&gt;<br>
&gt; Given how long these have been open, workaround the issue by disabling=
 the compiler<br>
&gt; hardening options on mips.<br>
&gt;<br>
&gt; It is likely better to do this than have the open CVEs for everyone<br=
>
&gt; as we can&#39;t upgrade.<br>
&gt;<br>
&gt; An example:<br>
&gt;<br>
&gt; | during RTL pass: zero_call_used_regs<br>
&gt; | clientloop.c: In function &#39;client_loop&#39;:<br>
&gt; | clientloop.c:1699:1: internal compiler error: in int_mode_for_mode, =
at stor-layout.cc:407<br>
&gt; |=C2=A0 1699 | }<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0| ^<br>
&gt; | 0x14d0acc internal_error(char const*, ...)<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0???:0<br>
&gt; | 0x5cf765 fancy_abort(char const*, int, char const*)<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0???:0<br>
&gt; | 0x826f1f emit_move_insn_1(rtx_def*, rtx_def*)<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0???:0<br>
&gt; | 0x8270c5 emit_move_insn(rtx_def*, rtx_def*)<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0???:0<br>
&gt; | 0xb7b994 default_zero_call_used_regs(HARD_REG_SET)<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0???:0<br>
&gt; | Please submit a full bug report, with preprocessed source (by using =
-freport-bug).<br>
&gt; | Please include the complete backtrace with any bug report.<br>
&gt;<br>
&gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@lin=
uxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&=
gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-connectivity/openssh/<a href=3D"http://openssh_9.6p=
1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_9.6p1.bb</a> | 4 ++++<br=
>
&gt;=C2=A0 1 file changed, 4 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-connectivity/openssh/<a href=3D"http://opens=
sh_9.6p1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_9.6p1.bb</a> b/me=
ta/recipes-connectivity/openssh/<a href=3D"http://openssh_9.6p1.bb" rel=3D"=
noreferrer" target=3D"_blank">openssh_9.6p1.bb</a><br>
&gt; index 6366cefdf96..1fd36a266fd 100644<br>
&gt; --- a/meta/recipes-connectivity/openssh/<a href=3D"http://openssh_9.6p=
1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_9.6p1.bb</a><br>
&gt; +++ b/meta/recipes-connectivity/openssh/<a href=3D"http://openssh_9.6p=
1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_9.6p1.bb</a><br>
&gt; @@ -81,6 +81,10 @@ EXTRA_OECONF =3D &quot;&#39;LOGIN_PROGRAM=3D${base_=
bindir}/login&#39; \<br>
&gt;=C2=A0 # musl doesn&#39;t implement wtmp/utmp and logwtmp<br>
&gt;=C2=A0 EXTRA_OECONF:append:libc-musl =3D &quot; --disable-wtmp --disabl=
e-lastlog&quot;<br>
&gt;<br>
&gt; +# Work around ICE on mips/mips64 starting in 9.6p1<br>
&gt; +EXTRA_OECONF:append:mips =3D &quot; --without-hardening&quot;<br>
&gt; +EXTRA_OECONF:append:mips64 =3D &quot; --without-hardening&quot;<br>
<br>
Perhaps just use mipsarch override since I imagine it will impact all<br>
kinds of mips.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Just a data poin=
t, both qemumips and qemumips64 are based on the ~2006-ish =E2=80=9CMalta=
=E2=80=9D machine. I don=E2=80=99t know yet if that set of tuning is a fact=
or (vs =E2=80=9CBoston=E2=80=9D which is more like 2015). I=E2=80=99ll stil=
l follow through with a bug report on gcc bugzilla.</div><div dir=3D"auto">=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-le=
ft-color:rgb(204,204,204)"><br>
&gt; +<br>
&gt;=C2=A0 # Since we do not depend on libbsd, we do not want configure to =
use it<br>
&gt;=C2=A0 # just because it finds libutil.h.=C2=A0 But, specifying --disab=
le-libutil<br>
&gt;=C2=A0 # causes compile errors, so...<br>
&gt; --<br>
&gt; 2.40.1<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#195733): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/195733" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/195733</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104381904/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/104381904/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000efbab8061176ec39--

