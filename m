Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D496CD6E4C
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 08:29:31 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23727.1780302122086086276
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 01:22:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kxp69KEl;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: adityags2004@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39677234558so11861611fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 01:22:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780302120; cv=none;
        d=google.com; s=arc-20240605;
        b=C59ldjjAdhLXrX+WPQb3EZZYBWax5Lml6cNUdedIUqdbFLUK7Hr7JCCF7jRV9szPxS
         hn2GpYnLk5dpEM+kmlpnm/I7SWaL+UN2S7s1dTs6HUnnkiv0xZ++/KFJQT2XMF4bBdDh
         M8moGd0s1b6wSp8VHYsCUVKOTvXKqpcKowdcYkIu0TrRiqB2HACbDkbK2uVKnRh4Z/p8
         PiCSpJmUdB5S1VDePDOybioZd20EqqMPLQdVonpANoM3yugKUNXms7dUF+i3NfUrhs9V
         W4BKrSjQY5NtP6iYQuf+xEViTubxGiqoLZYvbMM31OxHA8y+UzsggwjJK0uMbaeus9cZ
         1ZxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TgruhPw6Sb36FPNp1lmuHCo/gOMjLEFuxp9MxvGRjg4=;
        fh=NivRYCl+nFjkkjpyVc3vucYzpwAIm+ICT/6QX5Lw4XA=;
        b=GOFSzmmdTK7dIbXkKF9uF777IBu74IJlwaYSAD75H0k1R4uVJwOv3/ypsuxcxab+3A
         4sizyna5jzEPA/FA6SUFbUIJ3Qd6wBNy59cwpQFYn8t9trTt8UsGdPgI5QJEZySg3QRh
         h+1fJxxdQfQAtP3Mn5tsLapkORuQFVoG/0zdc0Z1IkTIJBD26X3dTphEJzH+C0kKYork
         Eh/Ccj9VBfMMuo9Dto2t7LLFwWA5ugPXThGYZX2g6AgcqESmg8301cyADCROPTeMm8xg
         kf03yobE7t5yNc+fvB4mde0l8FZjzMwdmEmqQsamKwvLFZf7nM1sKZCxOmfRMsUYc5Dy
         qzog==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780302120; x=1780906920; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TgruhPw6Sb36FPNp1lmuHCo/gOMjLEFuxp9MxvGRjg4=;
        b=kxp69KEl2H+LI20kawDTygixeAlg2yv3b066TrnzMSXuLl69H3H6LwU6ECmCgb9UJD
         /s0hCQmJbc2fxH4+OhCx/N3b7fXI9m8sPwZGkld2qAKoky5SAJCUj8Q/3/MjtH9upnAl
         h4N3j2fujPZU6/FxWPrHPZxOALLc/WSsMCG3wo+LbWOnVykfmUf4JM5DnZCXI3QtwM25
         4pydA2eNcEJdoGuWnoBT2pyIVN/uE8h4X6OKQGdTum5P1sSz5933UfsK3IfD7t9jpeQ5
         ieEHYEO+dPsQzj7rKrCKE4F/tc7gF+9AQysZEvAftDnRvxMirR16IxVjAgXb/ADZ7i7g
         /JMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780302120; x=1780906920;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TgruhPw6Sb36FPNp1lmuHCo/gOMjLEFuxp9MxvGRjg4=;
        b=Zp5xx6V5VKltA+WmqYV7G2q+7czwR/QcnSOc/SV+WzB9JbIddtaDcjvN7pjFg4EGMt
         rbnp0dwRkPGFUjGwWuTKmD6iJKrqJYUd6mTometqpPYkzqB6D5u5NKRxGZK/8v7RyVUY
         3TQF3w6Jx0YHbXE6BVTIT+CUCKGxi1oRPqRJX+6FXynLWUslFsz5ZkbwXhDleECbqm9L
         jzWaSkzmN1gLPm6ZsvGPenwoVTuSYGbyXEeHVlkOQWe1Fa5tydlt+0252xr2rY8b8/SG
         87jM0rJoulhTABsKj+tQQ1D8qVxfSVH9TPHBNgv02gNN6Rp7fwAD21NwfFh07XUqEX9L
         0Nsg==
X-Gm-Message-State: AOJu0Yy/QDK+DpBgNiEo68O5mbMddc2c35zQkWJnZPaTGlVG5YKNVUer
	lz49dwpULfrfcq//zuRDT9gVbHS485S8GcQ+iWsCbtGVdzIVi2uBt9ao1cqvU/t4TNURZJ6gU9L
	tn/8NOkooCXe6D6r2WnyO9CsBX5Ng7v8=
X-Gm-Gg: Acq92OHRGD4NBKeAE1C+fg/GqPZB4Yi8cgtIJn3etFrS8NhuwTP0187vFXb6BZ9stQ2
	MPTsAG2gwb1PdC19aUcOPQR/A/3OQWlTvm4X/tJX4dNhZvm+H/oEllLM/JEeVnKwgi6Rcp+NE3n
	19w8L094yghkwLNf8PIKggIgHpj0ejXhRqVv0GSzZssoe92pMSf5Eyt900gKGebES0m1nCnAT3F
	Fr6Z3M5CI2WqR37fy1vRvBhSDarDm7T7Lc7sXrtAbEzAjF1qQoMfiiKD6qstbz5YRLkFjZBqs3Z
	NSLr32Uc5e8SA/4OulAGhmBWpxPCwrvIfTTxBysy0f309T1gonU=
X-Received: by 2002:a05:651c:2001:b0:396:5b8a:6a67 with SMTP id
 38308e7fff4ca-39664f0f602mr19003691fa.15.1780302119773; Mon, 01 Jun 2026
 01:21:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260601062311.638-1-adityags2004@gmail.com> <b756a9add53cba2b685aa30d803526e1d002d8c2.camel@linuxfoundation.org>
In-Reply-To: <b756a9add53cba2b685aa30d803526e1d002d8c2.camel@linuxfoundation.org>
From: "Aditya G.S" <adityags2004@gmail.com>
Date: Mon, 1 Jun 2026 13:51:46 +0530
X-Gm-Features: AVHnY4Kw0ktwJpGiQnq2QXXBfy-rai623RHveFiiM83cVtxEgWIFUd3nEpsszKA
Message-ID: <CAHaUZZCrvUUWT-KgwcXLVDC2S0c7HdMnfYaZvD0fX0qs6YLgyA@mail.gmail.com>
Subject: Re: [PATCH] [PATCH v3] gawk: backport randtest stability fix
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex.kanavin@gmail.com>, joaomarcos.costa@bootlin.com, ross.burton@arm.com, 
	randy.macleod@windriver.com
Content-Type: multipart/alternative; boundary="000000000000712c4506532ce3b1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 08:29:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237825

--000000000000712c4506532ce3b1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

Thanks for the detailed feedback.

I've now reworked the patch against master, addressed the formatting
issues, updated the Bugzilla reference to [YOCTO #16254], and resent the
patch as v4.

Please let me know if any further changes are needed.

Thanks,
Aditya

On Mon, Jun 1, 2026, 12:07=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Hi,
>
> Thanks for the patch. I have a few pieces of feedback, just to help
> streamline the patch merging process.
>
> Firstly, I think this might be against scarthgap as it has 5.3.0?
> master/wrynose have 5.4.0. It isn't against master, you need to say
> which branch it is against in the shortlog/subject, e.g. [scarthgap].
> We do also have a backport policy which means this needs to be applied
> in master first, then backported to the LTS releases after that.
>
> On Mon, 2026-06-01 at 11:53 +0530, Aditya GS wrote:
> > Backport upstream fix to improve stability of randtest.sh by
> > retrying when sigma is too small, avoiding intermittent failures.
> >
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16254
>
> The convention for this is:
>
> [YOCTO #16254]
>
> >
> > Signed-off-by: Aditya GS <adityags2004@gmail.com>
> > ---
> >  .../gawk/files/randtest-fix.patch             | 139 ++++++++++++++++++
> >  meta/recipes-extended/gawk/gawk_5.3.0.bb      |   1 +
> >  2 files changed, 140 insertions(+)
> >  create mode 100644 meta/recipes-extended/gawk/files/randtest-fix.patch
> >
> > diff --git a/meta/recipes-extended/gawk/files/randtest-fix.patch
> b/meta/recipes-extended/gawk/files/randtest-fix.patch
> > new file mode 100644
> > index 0000000000..0b813e667e
> > --- /dev/null
> > +++ b/meta/recipes-extended/gawk/files/randtest-fix.patch
> > @@ -0,0 +1,139 @@
> > +From f2250f4bc864913437619af7a9834a1c24915acd Mon Sep 17 00:00:00 2001
> > +From: "Arnold D. Robbins" <arnold@skeeve.com>
> > +Date: Thu, 28 May 2026 09:52:41 -0400
> > +Subject: [PATCH] Improve test/randtest.sh.
> > +
> > +Backport upstream fix to improve stability of randtest.sh by retrying
> > +when sigma is too small, avoiding intermittent failures.
> > +
> > +Upstream-Status: Backport
> > +[
> https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=3Df2250f4bc864=
913437619af7a983
>
> Missing closing brace and ideally shouldn't be line wrapped.
>
> > + function abs(abs_input) { return(sqrt(abs_input^2)) ; }
> > + '
> > +
> > +--
> > +2.34.1
> > +
> > diff --git a/meta/recipes-extended/gawk/gawk_5.3.0.bb
> b/meta/recipes-extended/gawk/gawk_5.3.0.bb
> > index ac9d8500d6..06184a4b48 100644
> > --- a/meta/recipes-extended/gawk/gawk_5.3.0.bb
> > +++ b/meta/recipes-extended/gawk/gawk_5.3.0.bb
> > @@ -18,6 +18,7 @@ PACKAGECONFIG[mpfr] =3D "--with-mpfr,--without-mpfr,
> mpfr"
> >  SRC_URI =3D "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
> >             file://0001-m4-readline-add-missing-includes.patch \
> >             file://run-ptest \
> > +        file://randtest-fix.patch \
> >             "
>
> Whitespace mismatch.
>
> Could you send a tweaked version against master please? I would like to
> remove one of the intermittent ptest failures!
>
> Thanks,
>
> Richard
>

--000000000000712c4506532ce3b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Richard,<div dir=3D"auto"><br></div><div dir=3D"auto">=
Thanks for the detailed feedback.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">I&#39;ve now reworked the patch against master, addressed the for=
matting issues, updated the Bugzilla reference to [YOCTO #16254], and resen=
t the patch as v4.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Pleas=
e let me know if any further changes are needed.</div><div dir=3D"auto"><br=
></div><div dir=3D"auto">Thanks,=C2=A0</div><div dir=3D"auto">Aditya</div><=
/div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Jun 1, 2026, 12:07=E2=80=AFPM Richard Purdie &=
lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@lin=
uxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi,=
<br>
<br>
Thanks for the patch. I have a few pieces of feedback, just to help<br>
streamline the patch merging process.<br>
<br>
Firstly, I think this might be against scarthgap as it has 5.3.0?<br>
master/wrynose have 5.4.0. It isn&#39;t against master, you need to say<br>
which branch it is against in the shortlog/subject, e.g. [scarthgap].<br>
We do also have a backport policy which means this needs to be applied<br>
in master first, then backported to the LTS releases after that.<br>
<br>
On Mon, 2026-06-01 at 11:53 +0530, Aditya GS wrote:<br>
&gt; Backport upstream fix to improve stability of randtest.sh by<br>
&gt; retrying when sigma is too small, avoiding intermittent failures.<br>
&gt; <br>
&gt; <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16254" =
rel=3D"noreferrer noreferrer" target=3D"_blank">https://bugzilla.yoctoproje=
ct.org/show_bug.cgi?id=3D16254</a><br>
<br>
The convention for this is:<br>
<br>
[YOCTO #16254]<br>
<br>
&gt; <br>
&gt; Signed-off-by: Aditya GS &lt;<a href=3D"mailto:adityags2004@gmail.com"=
 target=3D"_blank" rel=3D"noreferrer">adityags2004@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0.../gawk/files/randtest-fix.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 139 ++++++++++++++++++<br>
&gt; =C2=A0meta/recipes-extended/gawk/<a href=3D"http://gawk_5.3.0.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">gawk_5.3.0.bb</a>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +<br>
&gt; =C2=A02 files changed, 140 insertions(+)<br>
&gt; =C2=A0create mode 100644 meta/recipes-extended/gawk/files/randtest-fix=
.patch<br>
&gt; <br>
&gt; diff --git a/meta/recipes-extended/gawk/files/randtest-fix.patch b/met=
a/recipes-extended/gawk/files/randtest-fix.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..0b813e667e<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-extended/gawk/files/randtest-fix.patch<br>
&gt; @@ -0,0 +1,139 @@<br>
&gt; +From f2250f4bc864913437619af7a9834a1c24915acd Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: &quot;Arnold D. Robbins&quot; &lt;<a href=3D"mailto:arnold@skee=
ve.com" target=3D"_blank" rel=3D"noreferrer">arnold@skeeve.com</a>&gt;<br>
&gt; +Date: Thu, 28 May 2026 09:52:41 -0400<br>
&gt; +Subject: [PATCH] Improve test/randtest.sh.<br>
&gt; +<br>
&gt; +Backport upstream fix to improve stability of randtest.sh by retrying=
<br>
&gt; +when sigma is too small, avoiding intermittent failures.<br>
&gt; +<br>
&gt; +Upstream-Status: Backport<br>
&gt; +[<a href=3D"https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?i=
d=3Df2250f4bc864913437619af7a983" rel=3D"noreferrer noreferrer" target=3D"_=
blank">https://cgit.git.savannah.gnu.org/cgit/gawk.git/commit/?id=3Df2250f4=
bc864913437619af7a983</a><br>
<br>
Missing closing brace and ideally shouldn&#39;t be line wrapped.<br>
<br>
&gt; + function abs(abs_input) { return(sqrt(abs_input^2)) ; }<br>
&gt; + &#39;<br>
&gt; + <br>
&gt; +-- <br>
&gt; +2.34.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-extended/gawk/<a href=3D"http://gawk_5.3.0.b=
b" rel=3D"noreferrer noreferrer" target=3D"_blank">gawk_5.3.0.bb</a> b/meta=
/recipes-extended/gawk/<a href=3D"http://gawk_5.3.0.bb" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">gawk_5.3.0.bb</a><br>
&gt; index ac9d8500d6..06184a4b48 100644<br>
&gt; --- a/meta/recipes-extended/gawk/<a href=3D"http://gawk_5.3.0.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">gawk_5.3.0.bb</a><br>
&gt; +++ b/meta/recipes-extended/gawk/<a href=3D"http://gawk_5.3.0.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">gawk_5.3.0.bb</a><br>
&gt; @@ -18,6 +18,7 @@ PACKAGECONFIG[mpfr] =3D &quot;--with-mpfr,--without-=
mpfr, mpfr&quot;<br>
&gt; =C2=A0SRC_URI =3D &quot;${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fil=
e://0001-m4-readline-add-missing-includes.patch=C2=A0\<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fil=
e://run-ptest=C2=A0\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0 file://randtest-fix.patch=C2=A0\<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &qu=
ot;<br>
<br>
Whitespace mismatch.<br>
<br>
Could you send a tweaked version against master please? I would like to<br>
remove one of the intermittent ptest failures!<br>
<br>
Thanks,<br>
<br>
Richard<br>
</blockquote></div>

--000000000000712c4506532ce3b1--

