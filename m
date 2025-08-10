Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27CBBC87FCF
	for <webhook@archiver.kernel.org>; Sun, 10 Aug 2025 00:37:45 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web10.17821.1754786264138413294
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Aug 2025 17:37:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dwcGS+X6;
 spf=pass (domain: gmail.com, ip: 209.85.219.178, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e8e0c6f1707so2620831276.0
        for <openembedded-core@lists.openembedded.org>; Sat, 09 Aug 2025 17:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754786263; x=1755391063; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QRopYNBjvYjmDkpMW6/peMHiHZjl9Cf9tjMrWq0cBoc=;
        b=dwcGS+X6LWiWpNZvO7t6LnpknTj5dykIHw1r44kYncgcL3Wp52p6KTwGwf39J5Bflw
         UMwLs7hTtPLUyBuEc4qfzz4i1xRP8mXf2nFxJWuSJ1hbN9JJstRcpkMdtYniBJwdogK0
         EAV8IHIwGSxAGwdxAO0WXUvnLqbklE976mCjdZ2qjfao7wr9CkUZ7lDPli7hKlUZ9vWs
         EkaDNbdIwKLzDZXB/6frv1YydSv7dheIufMlSZ4iR6mnxXCvfOMs+Ci2tURtZgR8UFRy
         DnuynlbNZ7Aulw2MwP+JHuKITtnoZrlQD+tbm6+bfagWSlkAtbkisPZRuNI9ZCQhjLBz
         dTHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754786263; x=1755391063;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QRopYNBjvYjmDkpMW6/peMHiHZjl9Cf9tjMrWq0cBoc=;
        b=vRd7YSu5GgZ0LZoHnHowM5fnARbyjfuluddadkXadGmx/DPN0Iuz15BZ/EQFxSjomX
         zgTh5eMVLBm1drs/s8mgzR0gGr+Vwt4YX5k0LtKEOWet5jglOJdzX3vuvAEKBt6qNJ8S
         OmnFfNv5AO7rQsoArVjLnqfyAWH3/JzX9Qo9p5L7qmb++FDnNP5xVhM/18y3uoYJR8sG
         ViJLuQmr65bj2wD5qO4hN6IL3YGpoLoArgm2UWUZVDGaux5XWEcuUvnr7zk2bwTuyu61
         /EUgbcKoyFxCMAY3MLrEEO5OIuyTtuz3/Xwa58De8IhD8P6daAd9Xr+emQkzw2IRUbo1
         P4tw==
X-Forwarded-Encrypted: i=1; AJvYcCWI0RxIDvbLLQEOXNXOUUAv5yz2aa7HOopolP0M2TM+o986s/6DT5bfaDHgZk8EYEwwMaETosNIj9rdlpIOWGEKEQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzkQ/8mgmvk9ioj44TgUqEEY62ozz3NPW+8ChQg/n2udJsKMoOu
	LFS3dO64tdb8UDtVkgWWjamFJqk5Yz9Y9UhS6VFA60luvbV8x8VnwTW03n4eb7pAWu22kj4LXlu
	2qyPMbxv0JDjI0tsogp3S+Vh6TcKR3mE=
X-Gm-Gg: ASbGncs62uxCBYzBTNqFsHO0/5Z6YpV7P1lteVqa1RwOdggCpL78V+9sUcc1P6Xkd6a
	wkBw6IqslGoFp8Pjj71NmF6VvSAzVJp5eyzp9TUoUZHV7GT+5rZSz4V+YQQMkGMW0DI03UUPUqB
	HhtMVn+IJTKo5O3XNvijMAYPScWSvxDF1Hnhgk/VQwrNRTthCyPtfL95wvEjtQ59lgiPHTdQDAV
	lHDJPeDUkhP0dbqYui3VY9wlWkPIA3iVUy69cQF
X-Google-Smtp-Source: AGHT+IF0TdjnB7HW7xQWZ02lR2afFtpQW+k2gr/uwj12utPR95W1wZ+1W5Rmq9LIIcWiPRlb4nQaE3RD1EdogaV6jrw=
X-Received: by 2002:a05:6902:6318:b0:e8e:acac:a22d with SMTP id
 3f1490d57ef6-e904b45e7cemr8888796276.5.1754786263089; Sat, 09 Aug 2025
 17:37:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1754750560.git.steve@sakoman.com> <af3e5e432d9bf1e5811ea92f3e29c0874b6b9405.1754750560.git.steve@sakoman.com>
 <CAMKF1srEOsPHQf1wnJNWrUWqB22UJ6iGrFrxJdYeOVwEAhF2yg@mail.gmail.com> <AS1PR10MB569777F976A148A856172E1FFD2EA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB569777F976A148A856172E1FFD2EA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 9 Aug 2025 17:37:32 -0700
X-Gm-Features: Ac12FXxhTBznQ7FQNinYdTo1B7FYmn3asZ59CWDZXiRLoxG1ghGa8kVsl3FLBjM
Message-ID: <CAMKF1sqH_H8eLk7cH7p5EK9t9cTvRA7h_xjpXNx777HfS+Ocxg@mail.gmail.com>
Subject: Re: [OE-core][walnascar 4/6] glibc: stable 2.41 branch updates
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "steve@sakoman.com" <steve@sakoman.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000de476a063bf80379"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Aug 2025 00:37:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221693

--000000000000de476a063bf80379
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 9, 2025 at 3:23=E2=80=AFPM Marko, Peter <Peter.Marko@siemens.co=
m> wrote:

>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Khem Raj via
> > lists.openembedded.org
> > Sent: Saturday, August 9, 2025 17:45
> > To: steve@sakoman.com
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core][walnascar 4/6] glibc: stable 2.41 branch updates
> >
> > On Sat, Aug 9, 2025 at 7:44=E2=80=AFAM Steve Sakoman via
> > lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
> > wrote:
> > >
> > > From: Peter Marko <peter.marko@siemens.com>
> > >
> > > $ git log --oneline
> > 6e489c17f827317bcf8544efefa65f13b5a079dc..e7c419a2957590fb657900fc92a89=
7
> > 08f41abd9d
> > > e7c419a295 (origin/release/2.41/master, release/2.41/master) iconv:
> iconv -o
> > should not create executable files (bug 33164)
> > > 1e16d0096d posix: Fix double-free after allocation failure in regcomp
> (bug
> > 33185)
> > >
> > > Add CVE-2025-8058 to CVE ignore list as this is (bug 33185) commit.
> > >
> >
> > Hi Steve
> >
> > Should we wait for WRT to report back on glibc regression test results =
?
>
> Testresults on my setup:
>        Before     After   Diff
> PASS         5843      5847     +4
> XPASS        4         4         0
> FAIL         145       142      -3
> XFAIL        16        16        0
> UNSUPPORTED  243       243      0
>
> Diff of testcase status:
> malloc/tst-free-errno-malloc-hugetlb1 FAIL -> PASS
> malloc/tst-free-errno-mcheck FAIL-> PASS
> nptl/tst-getpid3 FAIL -> PASS
> nptl/tst-mutexpi8 FAIL -> PASS
> nptl/tst-mutexpi8-static PASS -> FAIL
> tst-regcomp-bracket-free N/A -> PASS (new testcase)


Thanks Peter I think this looks good


> Peter
>
> >
> > > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > > ---
> > >  meta/recipes-core/glibc/glibc-version.inc | 2 +-
> > >  meta/recipes-core/glibc/glibc_2.41.bb     | 2 +-
> > >  2 files changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes=
-
> > core/glibc/glibc-version.inc
> > > index a2cfd0f308..881a9cce2c 100644
> > > --- a/meta/recipes-core/glibc/glibc-version.inc
> > > +++ b/meta/recipes-core/glibc/glibc-version.inc
> > > @@ -1,6 +1,6 @@
> > >  SRCBRANCH ?=3D "release/2.41/master"
> > >  PV =3D "2.41+git"
> > > -SRCREV_glibc ?=3D "6e489c17f827317bcf8544efefa65f13b5a079dc"
> > > +SRCREV_glibc ?=3D "e7c419a2957590fb657900fc92a89708f41abd9d"
> > >  SRCREV_localedef ?=3D "fab74f31b3811df543e24b6de47efdf45b538abc"
> > >
> > >  GLIBC_GIT_URI ?=3D "git://sourceware.org/git/glibc.git;protocol=3Dht=
tps"
> > > diff --git a/meta/recipes-core/glibc/glibc_2.41.bb b/meta/recipes-
> > core/glibc/glibc_2.41.bb
> > > index 7ddf7f9127..8a65e8ce9f 100644
> > > --- a/meta/recipes-core/glibc/glibc_2.41.bb
> > > +++ b/meta/recipes-core/glibc/glibc_2.41.bb
> > > @@ -17,7 +17,7 @@ Allows for ASLR bypass so can bypass some hardening=
,
> > not an exploit in itself, m
> > >  easier access for another. 'ASLR bypass itself is not a
> vulnerability.'"
> > >
> > >  CVE_STATUS_GROUPS +=3D "CVE_STATUS_STABLE_BACKPORTS"
> > > -CVE_STATUS_STABLE_BACKPORTS =3D "CVE-2025-4802 CVE-2025-5702
> > CVE-2025-5745"
> > > +CVE_STATUS_STABLE_BACKPORTS =3D "CVE-2025-4802 CVE-2025-5702
> > CVE-2025-5745 CVE-2025-8058"
> > >  CVE_STATUS_STABLE_BACKPORTS[status] =3D "cpe-stable-backport: fix
> > available in used git hash"
> > >
> > >  DEPENDS +=3D "gperf-native bison-native"
> > > --
> > > 2.43.0
> > >
> > >
> > >
> > >
>

--000000000000de476a063bf80379
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sat, Aug 9, 2025 at 3:23=E2=80=AFPM Marko, Peter &l=
t;<a href=3D"mailto:Peter.Marko@siemens.com">Peter.Marko@siemens.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;openembedded=
-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core@=
lists.openembedded.org</a>&gt; On Behalf Of Khem Raj via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a><br>
&gt; Sent: Saturday, August 9, 2025 17:45<br>
&gt; To: <a href=3D"mailto:steve@sakoman.com" target=3D"_blank">steve@sakom=
an.com</a><br>
&gt; Cc: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Subject: Re: [OE-core][walnascar 4/6] glibc: stable 2.41 branch update=
s<br>
&gt; <br>
&gt; On Sat, Aug 9, 2025 at 7:44=E2=80=AFAM Steve Sakoman via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a> &lt;steve=3D<a href=3D"mailto:sakoman.c=
om@lists.openembedded.org" target=3D"_blank">sakoman.com@lists.openembedded=
.org</a>&gt;<br>
&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; From: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" =
target=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; $ git log --oneline<br>
&gt; 6e489c17f827317bcf8544efefa65f13b5a079dc..e7c419a2957590fb657900fc92a8=
97<br>
&gt; 08f41abd9d<br>
&gt; &gt; e7c419a295 (origin/release/2.41/master, release/2.41/master) icon=
v: iconv -o<br>
&gt; should not create executable files (bug 33164)<br>
&gt; &gt; 1e16d0096d posix: Fix double-free after allocation failure in reg=
comp (bug<br>
&gt; 33185)<br>
&gt; &gt;<br>
&gt; &gt; Add CVE-2025-8058 to CVE ignore list as this is (bug 33185) commi=
t.<br>
&gt; &gt;<br>
&gt; <br>
&gt; Hi Steve<br>
&gt; <br>
&gt; Should we wait for WRT to report back on glibc regression test results=
 ?<br>
<br>
Testresults on my setup:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0Before=C2=A0 =C2=A0 =C2=A0After=C2=A0 =C2=A0Diff=
<br>
PASS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A05843=C2=A0 =C2=A0 =C2=A0 5847=C2=A0 =
=C2=A0 =C2=A0+4<br>
XPASS=C2=A0 =C2=A0 =C2=A0 =C2=A0 4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
FAIL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0145=C2=A0 =C2=A0 =C2=A0 =C2=A0142=C2=
=A0 =C2=A0 =C2=A0 -3<br>
XFAIL=C2=A0 =C2=A0 =C2=A0 =C2=A0 16=C2=A0 =C2=A0 =C2=A0 =C2=A0 16=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0<br>
UNSUPPORTED=C2=A0 243=C2=A0 =C2=A0 =C2=A0 =C2=A0243=C2=A0 =C2=A0 =C2=A0 0<b=
r>
<br>
Diff of testcase status:<br>
malloc/tst-free-errno-malloc-hugetlb1 FAIL -&gt; PASS<br>
malloc/tst-free-errno-mcheck FAIL-&gt; PASS<br>
nptl/tst-getpid3 FAIL -&gt; PASS<br>
nptl/tst-mutexpi8 FAIL -&gt; PASS<br>
nptl/tst-mutexpi8-static PASS -&gt; FAIL<br>
tst-regcomp-bracket-free N/A -&gt; PASS (new testcase)</blockquote><div dir=
=3D"auto"><br></div><div dir=3D"auto">Thanks Peter I think this looks good=
=C2=A0</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=
=3D"auto"><br>
Peter<br>
<br>
&gt; <br>
&gt; &gt; Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siem=
ens.com" target=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
&gt; &gt; Signed-off-by: Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.=
com" target=3D"_blank">steve@sakoman.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta/recipes-core/glibc/glibc-version.inc | 2 +-<br>
&gt; &gt;=C2=A0 meta/recipes-core/glibc/<a href=3D"http://glibc_2.41.bb" re=
l=3D"noreferrer" target=3D"_blank">glibc_2.41.bb</a>=C2=A0 =C2=A0 =C2=A0| 2=
 +-<br>
&gt; &gt;=C2=A0 2 files changed, 2 insertions(+), 2 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/rec=
ipes-<br>
&gt; core/glibc/glibc-version.inc<br>
&gt; &gt; index a2cfd0f308..881a9cce2c 100644<br>
&gt; &gt; --- a/meta/recipes-core/glibc/glibc-version.inc<br>
&gt; &gt; +++ b/meta/recipes-core/glibc/glibc-version.inc<br>
&gt; &gt; @@ -1,6 +1,6 @@<br>
&gt; &gt;=C2=A0 SRCBRANCH ?=3D &quot;release/2.41/master&quot;<br>
&gt; &gt;=C2=A0 PV =3D &quot;2.41+git&quot;<br>
&gt; &gt; -SRCREV_glibc ?=3D &quot;6e489c17f827317bcf8544efefa65f13b5a079dc=
&quot;<br>
&gt; &gt; +SRCREV_glibc ?=3D &quot;e7c419a2957590fb657900fc92a89708f41abd9d=
&quot;<br>
&gt; &gt;=C2=A0 SRCREV_localedef ?=3D &quot;fab74f31b3811df543e24b6de47efdf=
45b538abc&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 GLIBC_GIT_URI ?=3D &quot;git://<a href=3D"http://sourceware=
.org/git/glibc.git;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">s=
ourceware.org/git/glibc.git;protocol=3Dhttps</a>&quot;<br>
&gt; &gt; diff --git a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.41=
.bb" rel=3D"noreferrer" target=3D"_blank">glibc_2.41.bb</a> b/meta/recipes-=
<br>
&gt; core/glibc/<a href=3D"http://glibc_2.41.bb" rel=3D"noreferrer" target=
=3D"_blank">glibc_2.41.bb</a><br>
&gt; &gt; index 7ddf7f9127..8a65e8ce9f 100644<br>
&gt; &gt; --- a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.41.bb" re=
l=3D"noreferrer" target=3D"_blank">glibc_2.41.bb</a><br>
&gt; &gt; +++ b/meta/recipes-core/glibc/<a href=3D"http://glibc_2.41.bb" re=
l=3D"noreferrer" target=3D"_blank">glibc_2.41.bb</a><br>
&gt; &gt; @@ -17,7 +17,7 @@ Allows for ASLR bypass so can bypass some harde=
ning,<br>
&gt; not an exploit in itself, m<br>
&gt; &gt;=C2=A0 easier access for another. &#39;ASLR bypass itself is not a=
 vulnerability.&#39;&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 CVE_STATUS_GROUPS +=3D &quot;CVE_STATUS_STABLE_BACKPORTS&qu=
ot;<br>
&gt; &gt; -CVE_STATUS_STABLE_BACKPORTS =3D &quot;CVE-2025-4802 CVE-2025-570=
2<br>
&gt; CVE-2025-5745&quot;<br>
&gt; &gt; +CVE_STATUS_STABLE_BACKPORTS =3D &quot;CVE-2025-4802 CVE-2025-570=
2<br>
&gt; CVE-2025-5745 CVE-2025-8058&quot;<br>
&gt; &gt;=C2=A0 CVE_STATUS_STABLE_BACKPORTS[status] =3D &quot;cpe-stable-ba=
ckport: fix<br>
&gt; available in used git hash&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 DEPENDS +=3D &quot;gperf-native bison-native&quot;<br>
&gt; &gt; --<br>
&gt; &gt; 2.43.0<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
</blockquote></div></div>

--000000000000de476a063bf80379--

