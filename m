Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FC0FC3065C
	for <webhook@archiver.kernel.org>; Tue,  2 Jul 2024 17:15:40 +0000 (UTC)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
 by mx.groups.io with SMTP id smtpd.web10.30163.1719940535948029671
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jul 2024 10:15:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a3HwMPwD;
 spf=pass (domain: gmail.com, ip: 209.85.222.52, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-810173a1d0bso31934241.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jul 2024 10:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719940535; x=1720545335; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=//N58PvwFadyCN1f6N6ZdUNcEquMiNPQPgmD8ilFMkw=;
        b=a3HwMPwDuc7IhIHsNXISDYtLEUxdrL2g8CY5l2Tu9pqc1J9QVLYIEUWKJtHpLISbnW
         zLJHPLhODSazVDtnJkJwTJYgz0uIsd+EPvK3cs2cFESwP01ekSXetzJNTSEgklgk+FqI
         KAHML5pBrZNAgwoxNgmZtxKT01pnL6GtYtB4awT2f76MzUnb5gSJusGGkHOnqYNDL4vi
         UVUhESQ3pAQxryk+Brag4KIxFRBYH5q0c08bqE9sFlQgPO8lGBtKvoeeuoUG5o/RUaGn
         KmTtAZOExMr31qBhtoxN1/NlwYEwCHWOH/ypHrTmleFasbdJzeS+O2Xl0sZlSzZrMfM4
         LrZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719940535; x=1720545335;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=//N58PvwFadyCN1f6N6ZdUNcEquMiNPQPgmD8ilFMkw=;
        b=k8bJo+8ImX09TW9FxfhEC3K/7SF7zhKDJ+xf6Ht3Itvz6Nv1tKz06mPgIljHvvFYXa
         JTJX0SFH4I+nAUNKcHjlEotDDS1U0Dcm0RANNL40LClcq+ehgLRwe8tnt/3siEGDVc0A
         E8u1GNlKDxo7pjUNvUXLkzzYeAzrVNFbbNOsenN6AxRw8MEp/mjfGB9rpNfb3G/ItZT9
         /I9E7JFNqyVo/1kCMfc3wnVPEOKAHDN1kmgqG2TfnSv8bPKT3MfVgJn9cN+6PfJYlbyO
         QI7HTO7L8xwtVq6/SDFgisU5y5NCTTL+A9K97R3wJL93FAoOTy221o1PIaLqV2f96DKk
         tswg==
X-Gm-Message-State: AOJu0Yw+IpMk/1tW08Tgn3FZUjA3e9cKAA2W6qOstMOyTfA+W8H43B9n
	dVND6wFSImDSg2+WJLHwMEN6IARb+rd95CkcIx3usuc+yTeNLJmj8+04ZcSM0OXqS6YXmHz06mY
	ytMYUYHhXzPA/cG77wWaffKHjGe8=
X-Google-Smtp-Source: AGHT+IHex88giPA9nXPR4l0k3+1nfHVSaW0bcE3ljRIH42MIkLCnZoBwWEnlrYqBuChUoIDHrAdHElJdR6DNs9uyino=
X-Received: by 2002:a05:6122:4b0b:b0:4d8:7789:dd0d with SMTP id
 71dfb90a1353d-4f2a570aeeamr10554915e0c.15.1719940534811; Tue, 02 Jul 2024
 10:15:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240702163336.75537-2-jose.quaresma@foundries.io> <CAL5uAqzSdk6cpDOfM7KpUr94h5QLNbD0-a1CdjJBDX_aNVXYkA@mail.gmail.com>
In-Reply-To: <CAL5uAqzSdk6cpDOfM7KpUr94h5QLNbD0-a1CdjJBDX_aNVXYkA@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 2 Jul 2024 18:15:23 +0100
Message-ID: <CANPvuRkKcLTUp28yLa2c3WEFe3ZTFpZVbO0aD-nUBvaRc-oPdw@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH v2] openssh: fix CVE-2024-6387
To: Matthew Bullock <mbullock@thegoodpenguin.co.uk>
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="0000000000009cc393061c46dc02"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jul 2024 17:15:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201441

--0000000000009cc393061c46dc02
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matthew,

Matthew Bullock <mbullock@thegoodpenguin.co.uk> escreveu (ter=C3=A7a, 2/07/=
2024
=C3=A0(s) 18:00):

> On Tue, 2 Jul 2024 at 17:34, Jose Quaresma via lists.openembedded.org
> <quaresma.jose=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > sshd(8) in Portable OpenSSH versions 8.5p1 to 9.7p1 (inclusive).
> > Race condition resulting in potential remote code execution.
> > A race condition in sshd(8) could allow remote code execution as root o=
n
> non-OpenBSD systems.
> > This attack could be prevented by disabling the login grace timeout
> (LoginGraceTime=3D0 in sshd_config)
> > though this makes denial-of service against sshd(8) considerably easier=
.
> > For more information, please refer to the release notes [1] and the
> > report from the Qualys Security Advisory Team [2] who discovered the bu=
g.
>
> Wouldn't it be better to use the much cleaner fix from openssh-portable:
>
> https://github.com/openssh/openssh-portable/commit/b00331402fe5c60d577f3f=
fcc35e49286cdc6b47
>
> I realise that most of the distros seem to have copied the same early
> patch but I assume that was to get the fix done prior to public
> exposure. As there's a proper fix isn't that better?
>
> Matthew
>

On the regression report [1] the suggested way to fix this is this one as
you can see below:
[1] https://www.qualys.com/2024/07/01/cve-2024-6387/regresshion.txt

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Patches and mitigation

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Because this fix is part of a large commit (81c1099), on top of an even
larger defense-in-depth commit (03e3de4, "Start the process of splitting
sshd into separate binaries"), it might prove difficult to backport. In
that case, the signal handler race condition itself can be fixed by
removing or commenting out the async-signal-unsafe code from the
sshsigdie() function; for example:

------------------------------------------------------------------------
sshsigdie(const char *file, const char *func, int line, int showfunc,
    LogLevel level, const char *suffix, const char *fmt, ...)
{
#if 0
        va_list args;

        va_start(args, fmt);
        sshlogv(file, func, line, showfunc, SYSLOG_LEVEL_FATAL,
            suffix, fmt, args);
        va_end(args);
#endif
        _exit(1);
}
------------------------------------------------------------------------


Jose

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000009cc393061c46dc02
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Matthew,</div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">Matthew Bullock &lt;<a href=3D"mailto:mbul=
lock@thegoodpenguin.co.uk">mbullock@thegoodpenguin.co.uk</a>&gt; escreveu (=
ter=C3=A7a, 2/07/2024 =C3=A0(s) 18:00):<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On Tue, 2 Jul 2024 at 17:34, Jose Quaresma via <a h=
ref=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">=
lists.openembedded.org</a><br>
&lt;quaresma.jose=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" tar=
get=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; sshd(8) in Portable OpenSSH versions 8.5p1 to 9.7p1 (inclusive).<br>
&gt; Race condition resulting in potential remote code execution.<br>
&gt; A race condition in sshd(8) could allow remote code execution as root =
on non-OpenBSD systems.<br>
&gt; This attack could be prevented by disabling the login grace timeout (L=
oginGraceTime=3D0 in sshd_config)<br>
&gt; though this makes denial-of service against sshd(8) considerably easie=
r.<br>
&gt; For more information, please refer to the release notes [1] and the<br=
>
&gt; report from the Qualys Security Advisory Team [2] who discovered the b=
ug.<br>
<br>
Wouldn&#39;t it be better to use the much cleaner fix from openssh-portable=
:<br>
<a href=3D"https://github.com/openssh/openssh-portable/commit/b00331402fe5c=
60d577f3ffcc35e49286cdc6b47" rel=3D"noreferrer" target=3D"_blank">https://g=
ithub.com/openssh/openssh-portable/commit/b00331402fe5c60d577f3ffcc35e49286=
cdc6b47</a><br>
<br>
I realise that most of the distros seem to have copied the same early<br>
patch but I assume that was to get the fix done prior to public<br>
exposure. As there&#39;s a proper fix isn&#39;t that better?<br>
<br>
Matthew<br></blockquote><div><br></div><div>On the regression=C2=A0report [=
1] the suggested=C2=A0way to fix this is this one=C2=A0as you can see below=
:<br>[1] <a href=3D"https://www.qualys.com/2024/07/01/cve-2024-6387/regress=
hion.txt">https://www.qualys.com/2024/07/01/cve-2024-6387/regresshion.txt</=
a></div><div><br></div><div><pre style=3D"color:rgb(0,0,0)"><div class=3D"g=
mail_quote" style=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-s=
erif"><div><span style=3D"color:rgb(0,0,0)">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</span>=C2=A0</div></div><div style=3D"=
color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif"><br class=3D"gm=
ail-Apple-interchange-newline"></div>Patches and mitigation=C2=A0</pre><spa=
n style=3D"color:rgb(0,0,0)">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D</span>=C2=A0</div></div><div><pre style=3D"color:rgb(=
0,0,0)">Because this fix is part of a large commit (81c1099), on top of an =
even
larger defense-in-depth commit (03e3de4, &quot;Start the process of splitti=
ng
sshd into separate binaries&quot;), it might prove difficult to backport. I=
n
that case, the signal handler race condition itself can be fixed by
removing or commenting out the async-signal-unsafe code from the
sshsigdie() function; for example:

------------------------------------------------------------------------
sshsigdie(const char *file, const char *func, int line, int showfunc,
    LogLevel level, const char *suffix, const char *fmt, ...)
{
#if 0
        va_list args;

        va_start(args, fmt);
        sshlogv(file, func, line, showfunc, SYSLOG_LEVEL_FATAL,
            suffix, fmt, args);
        va_end(args);
#endif
        _exit(1);
}
------------------------------------------------------------------------</p=
re></div><br clear=3D"all"><div>Jose</div><div><br></div><span class=3D"gma=
il_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signatur=
e"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></d=
iv></div>

--0000000000009cc393061c46dc02--

