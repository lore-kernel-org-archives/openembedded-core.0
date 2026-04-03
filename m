Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D5EEE88D69
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 21:31:44 +0000 (UTC)
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5483.1775251894501356731
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2026 14:31:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JaCfzE+D;
 spf=pass (domain: gmail.com, ip: 74.125.224.45, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-6501c9903edso2254400d50.1
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 14:31:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775251893; cv=none;
        d=google.com; s=arc-20240605;
        b=OSBO6EYQMyGjFOxf0lgEAdPSdbil5rR58daGCieUqrJ/B/aVDlHNrufviTJN847wIE
         pnoaNCJz+3NMWC+8EzwEN4HX7Uiq62928KRVlf+YivzAdnHcYryFR0FBwiPuC5JIMtJb
         zlhUo51WgRsBqJ0guECLYQPqs2eAIZJLA/OhuG+PgNlyjVXdaM3wlTHMfISvwLK6EloN
         6yvzDn3STkgzELdzuXVJZIjow1JLv/WF3FE3FHzSeQ4SUjFjrISGOnejLPDoOWEnSUcH
         rGrWbvU3t7ML4t1Wu2t0UizGmGexHmGY4xrVfAKvL+6F71Ga6G+R+AV6hIcSxgOlnLtx
         Qmww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kUAbJcnff+lxDtltXmPaNaJHUpAAMQIeWF0PH6Q1djg=;
        fh=Tyc0Jk2T+8fGWDixU3qFe8BDCZOG+4XtkeWc0U40ryA=;
        b=cssi2/qg69v4E35LiPE/NzfUs9HiUYdN5GNjfwlJwxS8LBAJ7CD05joDye+vtHB/2T
         xAyxUiG0kxZF0/Hfejn8Ee4gXv67QD+WxANZSnczZ/EVDn2S6W/9zR4RTD2PKuJSFE5P
         n1EyUlIt/QyvoFQpqyucTUAu41bGLr8965aI6FVsmF9XrCOd9SznBhrLoTKa6OffWYWm
         xaLRnvFZLtKORoWRM3wRAcTkwUDMPpv8B+CCezWsHLol1JNm3riGvGyHIXWeDiD93Yfs
         Jt1y3k0+tzoeNAinJRBc1NwPFjAd94F4btAp2NCN7fIT80+kl5O6w6WO5yJWm+Vz7xFU
         dO2g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775251893; x=1775856693; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kUAbJcnff+lxDtltXmPaNaJHUpAAMQIeWF0PH6Q1djg=;
        b=JaCfzE+D665rp9mgMvYK7bteeOWP6TvK0amFbgZKcGo734W88884mxVDATWz8z14Ak
         qyrb3KH/j7VMXnrMrD4mbuIK26m7EB7TrgCKhETP5UfqakmraYOuN2D77CQ/hroTGKLM
         bfZUWXKgoUWZFrdvmvSlUvotuODBaQnVx7D3gQxYRU3RpVYShtd19vijHuw/v0VHIbct
         98XsM8AK16fWP7POK5z2Ccwo1Z/BqxS5QTbZYu2Mg4SMsZoMllDUBqWDulFQ6g+kUVWX
         i1YiDLadfOkTrBaCXhYhodyikraVjaREni01MVLoiq9AsAqBaRm/VpfQLi4N8mJwpxpA
         0mqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775251893; x=1775856693;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kUAbJcnff+lxDtltXmPaNaJHUpAAMQIeWF0PH6Q1djg=;
        b=ozcS+2ciO8m7GrEfqoTxQQ1SMBviOLfnkdUQpwsYmkKsTVyW5QMzT2dUoTQWQiR1tn
         DYUFcFFhEwiKKzjxcxNeGvSOXpVLTtoXW+J1D9sHcL9Man58+RatPSn1MWDJOBmVtFIv
         5H3iqMDXB6L6AgebRAICMVfIvnul0XpEfd9AGaxIq4VTc/QfYtRCfVXSYsEQYTel20Sh
         m9DKsNcu+UzLPXgnibO8B0Tf0mI34yLtbvUgQ29ln+98x1k/zXtRAqh3hmE0PB7lg5Tm
         nUl232i7vK6MmINMDKP9itLxCvIWvQhHiGiinCtc50UOeEHMuNK764Pmq3MbuUgI+5Mw
         Bx6Q==
X-Gm-Message-State: AOJu0Yzx0XXfedbM9yYDLvpajxtPB1KiGNBYGsy1WTxGep3KL4Rf4x7U
	HYmvba/7skvYGaXGV+AGW07PWI1yFSFZ+48RMOBjDWK2TIPYdQUAaZ8SIwhrAC15vJqpZR3Faye
	p3A6WqcJVIltDbQhwBW68YtUxpHqKLuiLi53G
X-Gm-Gg: AeBDiesYGs5yPCJ+rKTaekHBjjdXEj2hsDwnwH0x0X4i/4OvTzf8bUDPEvQLqce6Cxj
	+Vj/OdZRkZXyQh2t4hXzQiLIkmMez14A2zaw1q6PBGcCQXrAs2EJHS1lL8lOoHBYwjYfLANcr1q
	mjg4BvoKo+oOa/Ou5wl0F2UUO/9+KtT/NMgYvV9QmL3TSC9Y9uuVFuDieQTo0kQLyC1Ouz1N7cl
	76z/ajzesxPP1WOkSyg2tQJlVKclmtnI156ukoEfFfavlnYhKDKzgnVicMtjQPRF98COFwpgzlU
	N6ymLQUGgIbH1m8Evmwdm12XK8kQGV/lFAOgpr/IP94rHettpTVrXyW5aCnR2ccmzVrD+Guxvox
	St1SZufR2Tme0PzoQDnEbfkV9
X-Received: by 2002:a05:690e:191c:b0:64e:e084:fa84 with SMTP id
 956f58d0204a3-6504889a0e9mr3858103d50.68.1775251893481; Fri, 03 Apr 2026
 14:31:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260403024300.1195438-1-khem.raj@oss.qualcomm.com> <5464d1df292f2c566c753df2f3d43daeda7d0be8.camel@linuxfoundation.org>
In-Reply-To: <5464d1df292f2c566c753df2f3d43daeda7d0be8.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 3 Apr 2026 14:31:07 -0700
X-Gm-Features: AQROBzCQL08gUDOIVH1uoU3p3xnN21Lw3xeaH9JBlK7lP7nESt1DNoVYOR89Lqg
Message-ID: <CAMKF1sozctABHw7WOgfRrP67B+0WMQ=VnckCaAmvYH-REYh5sA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] autoconf: Raise line length limit for sed/awk
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007f753f064e950ac0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 21:31:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234601

--0000000000007f753f064e950ac0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 3, 2026 at 1:53=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2026-04-02 at 19:43 -0700, Khem Raj via lists.openembedded.org
> wrote:
> > From: Khem Raj <raj.khem@gmail.com>
> >
> > Latest autoconf is splitting long cmd lines in config.status
> > it generates using sed/awk to have compatibility with
> > platform like HPUX,Solaris,AIX which is understandable given
> > autotools try to achieve wider portability, however, this does
> > mean that in OE builds we might get these newlines added in
> > places dividing commands including buildpaths in them and the
> > methods deployed to scrub them from output artifacts will fail
> > since the string is now on two lines resulting in build QA to
> > pass but the strings do sneak in affecting reproducibility
> > one such example is e2tools recipe in meta-filesystems and there
> > perhaps are more
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  ...-command-limit-to-prevent-line-wrapp.patch | 41 +++++++++++++++++++
> >  .../autoconf/autoconf_2.72.bb                 |  1 +
> >  2 files changed, 42 insertions(+)
> >  create mode 100644
> meta/recipes-devtools/autoconf/autoconf/0001-Increase-awk-sed-command-lim=
it-to-prevent-line-wrapp.patch
> >
> > diff --git
> a/meta/recipes-devtools/autoconf/autoconf/0001-Increase-awk-sed-command-l=
imit-to-prevent-line-wrapp.patch
> b/meta/recipes-devtools/autoconf/autoconf/0001-Increase-awk-sed-command-l=
imit-to-prevent-line-wrapp.patch
> > new file mode 100644
> > index 0000000000..0713af6d7d
> > --- /dev/null
> > +++
> b/meta/recipes-devtools/autoconf/autoconf/0001-Increase-awk-sed-command-l=
imit-to-prevent-line-wrapp.patch
> > @@ -0,0 +1,41 @@
> > +From 139f757a6244d3b1e07f7fddc6d07d9c17f45313 Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Tue, 25 Nov 2025 21:03:38 -0800
> > +Subject: [PATCH] Increase awk/sed command limit to prevent line wrappi=
ng
> > +
> > +Autoconf 2.70+ wraps long variable assignments in config.status
> > +using backslash-newline continuations. This breaks when LDFLAGS
> > +or other variables contain special characters.
> > +
> > +Increase _AC_SED_CMD_LIMIT from 99 and _AC_AWK_LITERAL_LIMIT
> > +from 148 to 4000 to prevent wrapping.
>
> The commit message explains why this is needed but the patch needs to
> as well (buildpaths being linewrapped and then not being correctly
> updated as they're over multiple lines).
>

makes sense, I have sent v2


>
> Cheers,
>
> Richard
>

--0000000000007f753f064e950ac0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 3, =
2026 at 1:53=E2=80=AFAM Richard Purdie &lt;<a href=3D"mailto:richard.purdie=
@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, 2026-04-02 =
at 19:43 -0700, Khem Raj via <a href=3D"http://lists.openembedded.org" rel=
=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_bl=
ank">raj.khem@gmail.com</a>&gt;<br>
&gt; <br>
&gt; Latest autoconf is splitting long cmd lines in config.status<br>
&gt; it generates using sed/awk to have compatibility with<br>
&gt; platform like HPUX,Solaris,AIX which is understandable given<br>
&gt; autotools try to achieve wider portability, however, this does<br>
&gt; mean that in OE builds we might get these newlines added in<br>
&gt; places dividing commands including buildpaths in them and the<br>
&gt; methods deployed to scrub them from output artifacts will fail<br>
&gt; since the string is now on two lines resulting in build QA to<br>
&gt; pass but the strings do sneak in affecting reproducibility<br>
&gt; one such example is e2tools recipe in meta-filesystems and there<br>
&gt; perhaps are more<br>
&gt; <br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0...-command-limit-to-prevent-line-wrapp.patch | 41 +++++++++++++=
++++++<br>
&gt; =C2=A0.../autoconf/<a href=3D"http://autoconf_2.72.bb" rel=3D"noreferr=
er" target=3D"_blank">autoconf_2.72.bb</a>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +=
<br>
&gt; =C2=A02 files changed, 42 insertions(+)<br>
&gt; =C2=A0create mode 100644 meta/recipes-devtools/autoconf/autoconf/0001-=
Increase-awk-sed-command-limit-to-prevent-line-wrapp.patch<br>
&gt; <br>
&gt; diff --git a/meta/recipes-devtools/autoconf/autoconf/0001-Increase-awk=
-sed-command-limit-to-prevent-line-wrapp.patch b/meta/recipes-devtools/auto=
conf/autoconf/0001-Increase-awk-sed-command-limit-to-prevent-line-wrapp.pat=
ch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..0713af6d7d<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/autoconf/autoconf/0001-Increase-awk-sed-co=
mmand-limit-to-prevent-line-wrapp.patch<br>
&gt; @@ -0,0 +1,41 @@<br>
&gt; +From 139f757a6244d3b1e07f7fddc6d07d9c17f45313 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
&gt; +Date: Tue, 25 Nov 2025 21:03:38 -0800<br>
&gt; +Subject: [PATCH] Increase awk/sed command limit to prevent line wrapp=
ing<br>
&gt; +<br>
&gt; +Autoconf 2.70+ wraps long variable assignments in config.status<br>
&gt; +using backslash-newline continuations. This breaks when LDFLAGS<br>
&gt; +or other variables contain special characters.<br>
&gt; +<br>
&gt; +Increase _AC_SED_CMD_LIMIT from 99 and _AC_AWK_LITERAL_LIMIT<br>
&gt; +from 148 to 4000 to prevent wrapping.<br>
<br>
The commit message explains why this is needed but the patch needs to<br>
as well (buildpaths being linewrapped and then not being correctly<br>
updated as they&#39;re over multiple lines).<br></blockquote><div><br></div=
><div>makes sense, I have sent v2</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div></div>

--0000000000007f753f064e950ac0--

