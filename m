Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 349F7C41513
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 14:01:16 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web10.51051.1720015270060572534
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jul 2024 07:01:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lsBiSnMV;
 spf=pass (domain: gmail.com, ip: 209.85.210.47, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-701ef03185fso3137450a34.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 07:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720015269; x=1720620069; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KKGD6+9YaB5k5xJzUxj/hb/5FR77G90WpBmiuRdPYds=;
        b=lsBiSnMVZeH4qRxRSvElo65Wbjbt846g7k+t63AygSwMiyimM6BRaOtQYMColhHuI+
         WnjYWoy2QAavpo/qMsUzInm4bvvJY3K/rLdNdW/VCL+CB+/FW99KWcxWgyBBf55G6Q6N
         dkHMyVNU7bzsA/lcd7FWFzTCa0y+U4hYuJDsmFRkAgB+R/49Djen/l+VDhQAm/xENyjS
         O+E9Qg86k2vS/NijlyHxI4ULK4YPdyal5q+6s24n51gImMQqU4Hx8WLSob58SfNguP+p
         0WknW4qrghkjrdhTQAU5pGSqBN6KmIHzx/yIXIPPX1sav5XUPSxeRfYicKHVayfWCSjl
         hcKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720015269; x=1720620069;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KKGD6+9YaB5k5xJzUxj/hb/5FR77G90WpBmiuRdPYds=;
        b=VJ9TQvmGxy/XEIanY4fHSLTU6n8V0hmBnNq3q8m4lJx6Lva1yR7SHuIRuQQp0KV/UD
         P1ChtxR5MCLz3zA56Y0g8lyFcuY4e3JDJiD7YxmHUmf83IR6V+lOTxWeHjQbcCeCzvqz
         TrfeaOj+JoDgaW/joq5SpVrCYG05GjNIC4a1u9641YjAkd6+UQ6bALufl134CjZyicX6
         ETCO1JGKWARXFT1mKrreLPJAoKzHSO30XTX+CYIhFiFhE4goniHdG3fYepj6wZmLfT6Z
         jbrkvslVUp4GSKya2yrSPMtPWVGriNaQMmtd8SNDCm0JguYZ2ccYKErTIAchyqYcDBjV
         JveQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjeowZJZt0FfqQKJrbfzIMmGCwSHbmAuuxJtASN4DlvgAIIXq4Yt2Kh9lnJ6X/zuq6CuXvaG90d4W4wNeuHweULXQ0L/t6yX7NXnYu94KiarlwgKI1qv4z
X-Gm-Message-State: AOJu0YwSt6ULpSX+rgW7B051+hdhFNK8KufFiYlR5utWYn29ODg5VMEi
	dqdHBOLlEeEgVDrKRXXHc00DOyE4NzObgvypPgSxw9oW9kS9xuKfcoOIx8UriHZuY8PkEd1FYGd
	9cg7i5BBeQ6C6ETQjOR3Vh2pzV8U=
X-Google-Smtp-Source: AGHT+IEe7SM7IH/9i6vAEJckORYTIRSa+q58Mw9Jftds8aQhWnIweRhyz0ZAF/D8AI/AbL+3I7JmPr6DrGyvppcxLeQ=
X-Received: by 2002:a05:6359:4c0a:b0:1a6:a9f8:c986 with SMTP id
 e5c5f4694b2df-1a6acf00131mr955252855d.27.1720015269072; Wed, 03 Jul 2024
 07:01:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240702163336.75537-2-jose.quaresma@foundries.io>
 <CAL5uAqzSdk6cpDOfM7KpUr94h5QLNbD0-a1CdjJBDX_aNVXYkA@mail.gmail.com>
 <CANPvuRkKcLTUp28yLa2c3WEFe3ZTFpZVbO0aD-nUBvaRc-oPdw@mail.gmail.com> <CAOSpxdajUXd4fSFXC4890SMkkJn9GoD2fqSZtN0pmUCHt1O0xg@mail.gmail.com>
In-Reply-To: <CAOSpxdajUXd4fSFXC4890SMkkJn9GoD2fqSZtN0pmUCHt1O0xg@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 3 Jul 2024 15:00:37 +0100
Message-ID: <CANPvuR=WubdXMJpjM8Bt4j3vF5Pon_RYpLx9B0amZ0tQs+PpkA@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH v2] openssh: fix CVE-2024-6387
To: Steve Sakoman <steve@sakoman.com>
Cc: Matthew Bullock <mbullock@thegoodpenguin.co.uk>, openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="0000000000001f17ce061c584369"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 14:01:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201483

--0000000000001f17ce061c584369
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Steve Sakoman <steve@sakoman.com> escreveu (quarta, 3/07/2024 =C3=A0(s) 14:=
41):

> On Tue, Jul 2, 2024 at 10:15=E2=80=AFAM Jose Quaresma via
> lists.openembedded.org
> <quaresma.jose=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > Hi Matthew,
> >
> > Matthew Bullock <mbullock@thegoodpenguin.co.uk> escreveu (ter=C3=A7a,
> 2/07/2024 =C3=A0(s) 18:00):
> >>
> >> On Tue, 2 Jul 2024 at 17:34, Jose Quaresma via lists.openembedded.org
> >> <quaresma.jose=3Dgmail.com@lists.openembedded.org> wrote:
> >> >
> >> > sshd(8) in Portable OpenSSH versions 8.5p1 to 9.7p1 (inclusive).
> >> > Race condition resulting in potential remote code execution.
> >> > A race condition in sshd(8) could allow remote code execution as roo=
t
> on non-OpenBSD systems.
> >> > This attack could be prevented by disabling the login grace timeout
> (LoginGraceTime=3D0 in sshd_config)
> >> > though this makes denial-of service against sshd(8) considerably
> easier.
> >> > For more information, please refer to the release notes [1] and the
> >> > report from the Qualys Security Advisory Team [2] who discovered the
> bug.
> >>
> >> Wouldn't it be better to use the much cleaner fix from openssh-portabl=
e:
> >>
> https://github.com/openssh/openssh-portable/commit/b00331402fe5c60d577f3f=
fcc35e49286cdc6b47
> >>
> >> I realise that most of the distros seem to have copied the same early
> >> patch but I assume that was to get the fix done prior to public
> >> exposure. As there's a proper fix isn't that better?
> >>
> >> Matthew
> >
> >
> > On the regression report [1] the suggested way to fix this is this one
> as you can see below:
> > [1] https://www.qualys.com/2024/07/01/cve-2024-6387/regresshion.txt
> >
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > Patches and mitigation
> >
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > Because this fix is part of a large commit (81c1099), on top of an even
> > larger defense-in-depth commit (03e3de4, "Start the process of splittin=
g
> > sshd into separate binaries"), it might prove difficult to backport. In
>
> Thanks for this additional explanation. You can disregard my previous
> request for a V2 on the scarthgap version since there is no upstream
> commit!
>
> Steve
>

Got it. I only saw this message after replying to the other scarthgap
versio.

Jose


>
> > that case, the signal handler race condition itself can be fixed by
> > removing or commenting out the async-signal-unsafe code from the
> > sshsigdie() function; for example:
> >
> > -----------------------------------------------------------------------=
-
> > sshsigdie(const char *file, const char *func, int line, int showfunc,
> >     LogLevel level, const char *suffix, const char *fmt, ...)
> > {
> > #if 0
> >         va_list args;
> >
> >         va_start(args, fmt);
> >         sshlogv(file, func, line, showfunc, SYSLOG_LEVEL_FATAL,
> >             suffix, fmt, args);
> >         va_end(args);
> > #endif
> >         _exit(1);
> > }
> > -----------------------------------------------------------------------=
-
> >
> >
> > Jose
> >
> > --
> > Best regards,
> >
> > Jos=C3=A9 Quaresma
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#201441):
> https://lists.openembedded.org/g/openembedded-core/message/201441
> > Mute This Topic: https://lists.openembedded.org/mt/107003224/3620601
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> steve@sakoman.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000001f17ce061c584369
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Steve Sakoman &lt;<a href=3D"mailto:s=
teve@sakoman.com">steve@sakoman.com</a>&gt; escreveu (quarta, 3/07/2024 =C3=
=A0(s) 14:41):<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">O=
n Tue, Jul 2, 2024 at 10:15=E2=80=AFAM Jose Quaresma via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a><br>
&lt;quaresma.jose=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" tar=
get=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Matthew,<br>
&gt;<br>
&gt; Matthew Bullock &lt;<a href=3D"mailto:mbullock@thegoodpenguin.co.uk" t=
arget=3D"_blank">mbullock@thegoodpenguin.co.uk</a>&gt; escreveu (ter=C3=A7a=
, 2/07/2024 =C3=A0(s) 18:00):<br>
&gt;&gt;<br>
&gt;&gt; On Tue, 2 Jul 2024 at 17:34, Jose Quaresma via <a href=3D"http://l=
ists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembed=
ded.org</a><br>
&gt;&gt; &lt;quaresma.jose=3D<a href=3D"mailto:gmail.com@lists.openembedded=
.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; sshd(8) in Portable OpenSSH versions 8.5p1 to 9.7p1 (inclusiv=
e).<br>
&gt;&gt; &gt; Race condition resulting in potential remote code execution.<=
br>
&gt;&gt; &gt; A race condition in sshd(8) could allow remote code execution=
 as root on non-OpenBSD systems.<br>
&gt;&gt; &gt; This attack could be prevented by disabling the login grace t=
imeout (LoginGraceTime=3D0 in sshd_config)<br>
&gt;&gt; &gt; though this makes denial-of service against sshd(8) considera=
bly easier.<br>
&gt;&gt; &gt; For more information, please refer to the release notes [1] a=
nd the<br>
&gt;&gt; &gt; report from the Qualys Security Advisory Team [2] who discove=
red the bug.<br>
&gt;&gt;<br>
&gt;&gt; Wouldn&#39;t it be better to use the much cleaner fix from openssh=
-portable:<br>
&gt;&gt; <a href=3D"https://github.com/openssh/openssh-portable/commit/b003=
31402fe5c60d577f3ffcc35e49286cdc6b47" rel=3D"noreferrer" target=3D"_blank">=
https://github.com/openssh/openssh-portable/commit/b00331402fe5c60d577f3ffc=
c35e49286cdc6b47</a><br>
&gt;&gt;<br>
&gt;&gt; I realise that most of the distros seem to have copied the same ea=
rly<br>
&gt;&gt; patch but I assume that was to get the fix done prior to public<br=
>
&gt;&gt; exposure. As there&#39;s a proper fix isn&#39;t that better?<br>
&gt;&gt;<br>
&gt;&gt; Matthew<br>
&gt;<br>
&gt;<br>
&gt; On the regression report [1] the suggested way to fix this is this one=
 as you can see below:<br>
&gt; [1] <a href=3D"https://www.qualys.com/2024/07/01/cve-2024-6387/regress=
hion.txt" rel=3D"noreferrer" target=3D"_blank">https://www.qualys.com/2024/=
07/01/cve-2024-6387/regresshion.txt</a><br>
&gt;<br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br=
>
&gt;<br>
&gt; Patches and mitigation<br>
&gt;<br>
&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br=
>
&gt;<br>
&gt; Because this fix is part of a large commit (81c1099), on top of an eve=
n<br>
&gt; larger defense-in-depth commit (03e3de4, &quot;Start the process of sp=
litting<br>
&gt; sshd into separate binaries&quot;), it might prove difficult to backpo=
rt. In<br>
<br>
Thanks for this additional explanation. You can disregard my previous<br>
request for a V2 on the scarthgap version since there is no upstream commit=
!<br>
<br>
Steve<br></blockquote><div><br></div><div>Got it.=C2=A0I only saw this mess=
age after replying to the other scarthgap versio.<br><br>Jose</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; that case, the signal handler race condition itself can be fixed by<br=
>
&gt; removing or commenting out the async-signal-unsafe code from the<br>
&gt; sshsigdie() function; for example:<br>
&gt;<br>
&gt; ----------------------------------------------------------------------=
--<br>
&gt; sshsigdie(const char *file, const char *func, int line, int showfunc,<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0LogLevel level, const char *suffix, const char *fmt=
, ...)<br>
&gt; {<br>
&gt; #if 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0va_list args;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0va_start(args, fmt);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sshlogv(file, func, line, showfunc, S=
YSLOG_LEVEL_FATAL,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0suffix, fmt, args);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0va_end(args);<br>
&gt; #endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_exit(1);<br>
&gt; }<br>
&gt; ----------------------------------------------------------------------=
--<br>
&gt;<br>
&gt;<br>
&gt; Jose<br>
&gt;<br>
&gt; --<br>
&gt; Best regards,<br>
&gt;<br>
&gt; Jos=C3=A9 Quaresma<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#201441): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/201441" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/201441</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10700322=
4/3620601" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/107003224/3620601</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:steve@sakoman.com" ta=
rget=3D"_blank">steve@sakoman.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--0000000000001f17ce061c584369--

