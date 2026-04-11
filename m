Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50321F44879
	for <webhook@archiver.kernel.org>; Sat, 11 Apr 2026 08:51:27 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.185377.1775897477765162306
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Apr 2026 01:51:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ezliuNH5;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43cff5dafc3so2102224f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Apr 2026 01:51:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775897476; cv=none;
        d=google.com; s=arc-20240605;
        b=ZL+pSuVWw0knxOhRP87DlvYJDp1tbJfdnwGBPmRJ3u5ptJD0PYRyuUkgDMW4fkQ1bA
         LVf2bDZVNZcifoCR0e+lbNFglwST77fUuks2jO1W3qGqBsfUxSBCQtTS/5o/O9KouN+f
         2wqDC15YRK/TXgzi5ISwbX52NhD5C8ZxxeSRFIYTjbVF6QXhCsE1uBRLM20SmgAOewIs
         G76muOvODjzn254DVkSdLeWpqB3M3xrVIMeXd0EUa5NXOpx3JxxEWQPxmgeRz3KQZ0pj
         UrOwKIpuopDXnMTXXjLTix/lEPnXJMOIUQ1L5ShjSYt7Db/K7a21eetSlu1K/Ekaue9t
         bRHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uW8r3FMz4Wex1zEy5NR27KVRHtvPwLYUb/s77ykTYro=;
        fh=NR8X5UTK2yjJ5NE9zcQHXujvm8fqi42VPt+lY2wmrNg=;
        b=FXpW0fbDlKH+LLh6bzllhO8bbgGzhLCk11ZVd4OyFmO/j2THXGSqzXrmJ4ONFsmyBu
         oMncv8f2SP21eRQTWUOC0uKqcbRnJHXr3szmwwZ5s97FXu+ydhbVlFUkU8JMtAYHo4ru
         vfuqyWWrhcFEtcn2XK9z69xXXegGVj0+2pw9XKWqxv8Yo+lc4jpIjYLXqbYg/CjfiPR0
         41yJBLc4GePueLxrPVwlqh2YPUqvryiE6NpibfRel/QL09KN9tfGLE/puTwuGEYlRzOD
         dSI2d3XjdTg1DTWOZjAHDkNj6dO7xeFZk5sv7eM4M6onmI1z8vcxAjVo7/7l1JURtHgg
         TddA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775897476; x=1776502276; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uW8r3FMz4Wex1zEy5NR27KVRHtvPwLYUb/s77ykTYro=;
        b=ezliuNH5PscMYGPzUrWVIvZAzm9VMbGxdotofWEnKXW3BnFFT+x12EVeYjE47pYGqi
         AKU1+LHIY9GRFsyHkN9oE6oF3PP6Byls/kbJSviiZid1n6cu+6fYHZO9HxOSismGdLqS
         McwMBJNjWfBXxLwY+DOHKzIniRaE2YfKV9rEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775897476; x=1776502276;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uW8r3FMz4Wex1zEy5NR27KVRHtvPwLYUb/s77ykTYro=;
        b=T1Z1n583Ge8axXjjoTZKX0Ud0z1bktqN4uHbooTDEFFLaYSaFUqE/moA/l6VmA1frC
         +kZOvBRKA5y+mqb5BpX4durFiKmJcvaXPPs9ivzX3o22JECnCvmWn99nJFVNJk3pl1pI
         KeJS86Qfx11EkBbD/4PyeOXKHkgjwPfow4mHa1r6AQfrJU59kA2hhM1+kPBVyruYsXqU
         iqaJ1U9x9demo7IV9HynMICYwnYnIaux47KOCPnhT/VR6CUN44gBBYkUTx7H9/gw2zva
         UJ0C/FKD8Z/saBsSD9bVg7M6todNXr9oOgDMzHkuPJDjOpys+U2DkhthSJ4P1oPNKzeF
         EufQ==
X-Gm-Message-State: AOJu0Yy82SW9Ii7rFpqQgMqdVav1o3yIDffrryWidosfQVkVVIEscN2c
	53sekp8sdiNRJK4f9Of2IdXm+9aR/aKSIbgynGk2asLn6BJO16PmwwXZ3wAeBssFLOt/I1qutV0
	MKxX2wHQTRmT9HyXqn52ru+gM/EhZpsbXTpArofQ5PA==
X-Gm-Gg: AeBDieummp5GjgfIyhvLKPow0VVT4jQZVFyLo4rUDVFlxY3jvx1kWsog3thzgThk0Zm
	kdVFM9IvZKRpGy9EpAu4pP6Na6xhL56ZfZFhNRTJCjOiiTnX9H1m8PfDPTyXNqzmRd/rgQgbcEq
	FA0ileJlQSfHw+tDwQ00/tHaIuU5hLW+GBnMj10BBHPaDJYAQ/UF/nE06/a8Ux3H0PpP1WinwWW
	QuEyDw7hOKhV0+21zVVcOBxxEzDtDDUkdScM+7jMOfzAlRG6XGrny1Jne5xa1pQ/WFPC0HSujXw
	B/KAWsdMDGEWmR7iLSnAEWZlEOdLalZRNmu2+I0o
X-Received: by 2002:a05:6000:208a:b0:43c:f95c:3e70 with SMTP id
 ffacd0b85a97d-43d642dac9fmr8683362f8f.25.1775897475950; Sat, 11 Apr 2026
 01:51:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1775823919.git.yoann.congal@smile.fr> <b507de6d469890f14d153c0eb48361d97d24a71e.1775823919.git.yoann.congal@smile.fr>
 <f3daae4a20bccd2286f85b492b11bbae866b78d5.camel@linuxfoundation.org>
In-Reply-To: <f3daae4a20bccd2286f85b492b11bbae866b78d5.camel@linuxfoundation.org>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Sat, 11 Apr 2026 10:51:04 +0200
X-Gm-Features: AQROBzBxIHQDVrLFfbDeUTrFuLZ0hzyOGNc4y3OIiwLZGO7QzXhBKkiJHN3F1gI
Message-ID: <CAMSfU+4WYe9Bs_=ciVPnWEr1bz23ZMfNSQ_BnBj5A98gh-9evg@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 1/1] oeqa/selftest/git-submodule-test:
 Default to https git protocol for YP/OE repos
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Paul Barker <paul@pbarker.dev>
Content-Type: multipart/alternative; boundary="00000000000036418f064f2b5a62"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Apr 2026 08:51:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235045

--00000000000036418f064f2b5a62
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le sam. 11 avr. 2026, 09:28, Richard Purdie <
richard.purdie@linuxfoundation.org> a =C3=A9crit :

> On Fri, 2026-04-10 at 14:27 +0200, Yoann Congal via lists.openembedded.or=
g
> wrote:
> > From: Yoann Congal <yoann.congal@smile.fr>
> >
> > Following up on commit 139102a73d41 ("recipes: Default to https git
> protocol where possible"),
> > > The recommendation from server maintainers is that the https protocol
> > > is both faster and more reliable than the dedicated git protocol at
> this point.
> > > Switch to it where possible.
> >
> > Use ";protocol=3Dhttps" for the parent git submodule and, also, update =
the
> > SRCREV to point to a commit where submodules are reference through a
> > https:// URL instead of a git:// one.
> >
> > Update the expected output of the archiver test.
> >
> > Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> > ---
> >  .../recipes-test/git-submodule-test/git-submodule-test.bb     | 4 ++--
> >  meta/lib/oeqa/selftest/cases/archiver.py                      | 4 ++--
> >  2 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta-selftest/recipes-test/git-submodule-test/
> git-submodule-test.bb b/meta-selftest/recipes-test/git-submodule-test/
> git-submodule-test.bb
> > index fa3041b7d8f..3f66cf6919d 100644
> > --- a/meta-selftest/recipes-test/git-submodule-test/
> git-submodule-test.bb
> > +++ b/meta-selftest/recipes-test/git-submodule-test/
> git-submodule-test.bb
> > @@ -5,8 +5,8 @@ LIC_FILES_CHKSUM =3D
> "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0bcf8506ecda
> >
> >  INHIBIT_DEFAULT_DEPS =3D "1"
> >
> > -SRC_URI =3D "gitsm://
> git.yoctoproject.org/git-submodule-test;branch=3Dmaster"
> > -SRCREV =3D "a2885dd7d25380d23627e7544b7bbb55014b16ee"
> > +SRC_URI =3D "gitsm://
> git.yoctoproject.org/git-submodule-test;branch=3Dmaster;protocol=3Dhttps"
> > +SRCREV =3D "f280847494763cdcf71197557a81ba7d8a6bce42"
> >
> >  S =3D "${WORKDIR}/git"
> >
> > diff --git a/meta/lib/oeqa/selftest/cases/archiver.py
> b/meta/lib/oeqa/selftest/cases/archiver.py
> > index 75195241b79..ad2dd2dda65 100644
> > --- a/meta/lib/oeqa/selftest/cases/archiver.py
> > +++ b/meta/lib/oeqa/selftest/cases/archiver.py
> > @@ -301,8 +301,8 @@ class Archiver(OESelftestTestCase):
> >
> >          bb_vars =3D get_bb_vars(['DEPLOY_DIR_SRC'])
> >          for target_file_name in [
> > -
> 'gitsmshallow_git.yoctoproject.org.git-submodule-test_a2885dd-1_master.ta=
r.gz',
> > -
> 'gitsmshallow_git.yoctoproject.org.bitbake-gitsm-test1_bare_120f4c7-1.tar=
.gz',
> > +
> 'gitsmshallow_git.yoctoproject.org.git-submodule-test_f280847-1_master.ta=
r.gz',
> > +
> 'gitsmshallow_git.yoctoproject.org.bitbake-gitsm-test1_bare_79a0efa-1.tar=
.gz',
> >
> 'gitsmshallow_git.yoctoproject.org.bitbake-gitsm-test2_bare_f66699e-1.tar=
.gz',
> >
> 'gitsmshallow_git.openembedded.org.bitbake_bare_52a144a-1.tar.gz',
> >
> 'gitsmshallow_git.openembedded.org.bitbake_bare_c39b997-1.tar.gz'
>
> Does master need that? At a quick look it probably should...
>


Yes it does need it. And this is not the only reference patched on
kirkstone that is not patch on master, I will send the series to master as
soon as possible.

>
> I'm wondering if this should be using an isolated downloads directory
> for the test and it is seeing files from previous builds?
>

Yes, surely.

But more generally, a universe fetch, on a empty dl_dir and a blocked
git:// protocol (can be done locally with a firewall rule, don't know about
doing that on AB) should be interesting...

Regards,

>
> Cheers,
>
> Richard
>

--00000000000036418f064f2b5a62
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><br><div class=3D"gmail_quote gmail_quote_co=
ntainer"><div dir=3D"ltr" class=3D"gmail_attr">Le sam. 11 avr. 2026, 09:28,=
 Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">r=
ichard.purdie@linuxfoundation.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">On Fri, 2026-04-10 at 14:27 +=
0200, Yoann Congal via <a href=3D"http://lists.openembedded.org" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; From: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" target=
=3D"_blank" rel=3D"noreferrer">yoann.congal@smile.fr</a>&gt;<br>
&gt; <br>
&gt; Following up on commit 139102a73d41 (&quot;recipes: Default to https g=
it protocol where possible&quot;),<br>
&gt; &gt; The recommendation from server maintainers is that the https prot=
ocol<br>
&gt; &gt; is both faster and more reliable than the dedicated git protocol =
at this point.<br>
&gt; &gt; Switch to it where possible.<br>
&gt; <br>
&gt; Use &quot;;protocol=3Dhttps&quot; for the parent git submodule and, al=
so, update the<br>
&gt; SRCREV to point to a commit where submodules are reference through a<b=
r>
&gt; https:// URL instead of a git:// one.<br>
&gt; <br>
&gt; Update the expected output of the archiver test.<br>
&gt; <br>
&gt; Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.f=
r" target=3D"_blank" rel=3D"noreferrer">yoann.congal@smile.fr</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0.../recipes-test/git-submodule-test/<a href=3D"http://git-submod=
ule-test.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">git-submodule-=
test.bb</a>=C2=A0=C2=A0=C2=A0=C2=A0 | 4 ++--<br>
&gt; =C2=A0meta/lib/oeqa/selftest/cases/archiver.py=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4 ++--<br>
&gt; =C2=A02 files changed, 4 insertions(+), 4 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta-selftest/recipes-test/git-submodule-test/<a href=3D"=
http://git-submodule-test.bb" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">git-submodule-test.bb</a> b/meta-selftest/recipes-test/git-submodule-tes=
t/<a href=3D"http://git-submodule-test.bb" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">git-submodule-test.bb</a><br>
&gt; index fa3041b7d8f..3f66cf6919d 100644<br>
&gt; --- a/meta-selftest/recipes-test/git-submodule-test/<a href=3D"http://=
git-submodule-test.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">git-=
submodule-test.bb</a><br>
&gt; +++ b/meta-selftest/recipes-test/git-submodule-test/<a href=3D"http://=
git-submodule-test.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">git-=
submodule-test.bb</a><br>
&gt; @@ -5,8 +5,8 @@ LIC_FILES_CHKSUM =3D &quot;file://${COMMON_LICENSE_DIR=
}/MIT;md5=3D0835ade698e0bcf8506ecda<br>
&gt; =C2=A0<br>
&gt; =C2=A0INHIBIT_DEFAULT_DEPS =3D &quot;1&quot;<br>
&gt; =C2=A0<br>
&gt; -SRC_URI =3D &quot;gitsm://<a href=3D"http://git.yoctoproject.org/git-=
submodule-test;branch=3Dmaster" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">git.yoctoproject.org/git-submodule-test;branch=3Dmaster</a>&quot;<br>
&gt; -SRCREV =3D &quot;a2885dd7d25380d23627e7544b7bbb55014b16ee&quot;<br>
&gt; +SRC_URI =3D &quot;gitsm://<a href=3D"http://git.yoctoproject.org/git-=
submodule-test;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer noreferr=
er" target=3D"_blank">git.yoctoproject.org/git-submodule-test;branch=3Dmast=
er;protocol=3Dhttps</a>&quot;<br>
&gt; +SRCREV =3D &quot;f280847494763cdcf71197557a81ba7d8a6bce42&quot;<br>
&gt; =C2=A0<br>
&gt; =C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; =C2=A0<br>
&gt; diff --git a/meta/lib/oeqa/selftest/cases/archiver.py b/meta/lib/oeqa/=
selftest/cases/archiver.py<br>
&gt; index 75195241b79..ad2dd2dda65 100644<br>
&gt; --- a/meta/lib/oeqa/selftest/cases/archiver.py<br>
&gt; +++ b/meta/lib/oeqa/selftest/cases/archiver.py<br>
&gt; @@ -301,8 +301,8 @@ class Archiver(OESelftestTestCase):<br>
&gt; =C2=A0<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb_vars =3D get_bb_va=
rs([&#39;DEPLOY_DIR_SRC&#39;])<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for target_file_name =
in [<br>
&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &#=
39;gitsmshallow_git.yoctoproject.org.git-submodule-test_a2885dd-1_master.ta=
r.gz&#39;,<br>
&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &#=
39;gitsmshallow_git.yoctoproject.org.bitbake-gitsm-test1_bare_120f4c7-1.tar=
.gz&#39;,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &#=
39;gitsmshallow_git.yoctoproject.org.git-submodule-test_f280847-1_master.ta=
r.gz&#39;,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &#=
39;gitsmshallow_git.yoctoproject.org.bitbake-gitsm-test1_bare_79a0efa-1.tar=
.gz&#39;,<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 &#39;gitsmshallow_git.yoctoproject.org.bitbake-gitsm-test2_bare_f66699e=
-1.tar.gz&#39;,<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 &#39;gitsmshallow_git.openembedded.org.bitbake_bare_52a144a-1.tar.gz&#3=
9;,<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 &#39;gitsmshallow_git.openembedded.org.bitbake_bare_c39b997-1.tar.gz&#3=
9;<br>
<br>
Does master need that? At a quick look it probably should...<br></blockquot=
e></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div =
dir=3D"auto">Yes it does need it. And this is not the only reference patche=
d on kirkstone that is not patch on master, I will send the series to maste=
r as soon as possible.</div><div dir=3D"auto"><div class=3D"gmail_quote gma=
il_quote_container"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I&#39;m wondering if this should be using an isolated downloads directory<b=
r>
for the test and it is seeing files from previous builds?<br></blockquote><=
/div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Yes, surely.</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">But more generally, a univers=
e fetch, on a empty dl_dir and a blocked git:// protocol (can be done local=
ly with a firewall rule, don&#39;t know about doing that on AB) should be i=
nteresting...</div><div dir=3D"auto"><br></div><div dir=3D"auto">Regards,</=
div><div dir=3D"auto"><div class=3D"gmail_quote gmail_quote_container"><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div></div></div>

--00000000000036418f064f2b5a62--

