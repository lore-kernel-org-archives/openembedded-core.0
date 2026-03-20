Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE267109879A
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 15:18:34 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15467.1774019909244303554
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 08:18:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=ZrPiX77Y;
 spf=pass (domain: mvista.com, ip: 209.85.208.44, mailfrom: vanusuri@mvista.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-66174cf4549so4092171a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 08:18:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774019907; cv=none;
        d=google.com; s=arc-20240605;
        b=EWnh50l9WAZCmI+zFw3eLk5wqnoUK3UGpSKqGMjV0DBMLQHjfNtBWD/qTm3Zs+7lZR
         aDvARcjCIjPD1Uuhh0ct2Z8XrUfIEdrvSRZ/mRrysgi5gxL5QdbE9C0EGi4D88npqIxQ
         JPKa3J15OJa4HuaBzN/OOr3uXt24jl8n89LNdINuEI7I1xVNrz5AVguZFHMoVUIxf+FZ
         GM3K5DkqIpQ+iE/EVTVtYhtmjCLWvz7oovziDM47Mci+gF7Ho0oNLGQtS+FWWnAZsz2L
         y2b8rUe6dZ5P3UYr55yYyCo+vFEcCHB8wWfCAOMgC+AlwBUnbELsjwBaQYPvRMDRSviK
         v9hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cH/OrRd7+QVNq8Pd9sz8xkXf7ejG6r7i0dqZ6oaPkWQ=;
        fh=pPCZLadEnHSSNqpbdMoTRaQ3O6r9Sm3FEzXJm+M1zj8=;
        b=AYoeb86//yLE+t9w08ucXRQWzM2tHl7TqwHBN61H0w6jMl0ljxpvjK5yCWaFp36IWc
         K26wtQjBbF5I1hsnGheJmy5i+Eyw3teSzxRSDi156FGq9DYVK//BxwGRs/h9z8zWHRMU
         5DLFn/SCveVbOug7UlcIQ0oSB2dMQIvStqQgRYAPMOemAOtMRy7h2cBQ1PcysL/PAhUa
         b7plbqxgbUsvbuoVfTql/qHd2wRLpcP4bIMQDlIQAu1+wYCI6SOtYDmFJlUoyhsBZmNk
         sHBfpBzocv27apDMeTl+bCVVNGgG3w6TPGsz+149UfcS4ypyMEAlAnjKc2U2lPFrsvgy
         d6Jg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1774019907; x=1774624707; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cH/OrRd7+QVNq8Pd9sz8xkXf7ejG6r7i0dqZ6oaPkWQ=;
        b=ZrPiX77YvWhxP0n6BsSyePvfhibOqoFDCOqF1zOeiagUUK9jL2lBRdIpqJ21d+mqk9
         B48uNF7VdCsvmtRupmp1N3FdBTcG7oCX7pG4l30sF+z4ZJT7qqY8mXWd66+RCVztbSw0
         8JecEzkPuSJ4iJ5hhYJOLOz4RqTDLk2NEm1DA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774019907; x=1774624707;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cH/OrRd7+QVNq8Pd9sz8xkXf7ejG6r7i0dqZ6oaPkWQ=;
        b=r1SwSLPRkCVv/UtdNuzP8jVfR0WFOt+m9KtZq2vuNlzulXxMHPluzBGFN7X1jDjNtJ
         dsgyk6tCjnZJ4Z2xh+jqUimYl5OWfej+oPCpfnZTkQY7hRsoLZYvWIRT2uMkau7xjyiJ
         oJ/ZpDsh6DZ9a79H30cxSuEKj2aRA/VdKIvf8cd/7Uzpok6TP+qt3hGAbT1Y6o6JMwj8
         Y/D/qAYbaWVjIHZ/tF7orGteihgtGP1KibrQ7vIf6NIWN25G0NCLONY5WTYhRtGCm7FU
         7By8ia1D0UoL9UU7KcGkRlskngj3ejDl2QGwlpDCRSsTglYRkZW8p1n4aO+gogPcIuBy
         FOQw==
X-Gm-Message-State: AOJu0YxuRR1xzJj934UGWs1eyKAbUSRad2LGn2OjJK/Kub2Zo89nIwz8
	tbidOAn7c20+KlCIqB6wE1MZara5mxUFs71yYM2++DY0/Q+qG/Fr/LP6JJdIbjQXizog27yer6C
	Qw3CJC8d+SwZEZGyIIJCQlp/J2Otv5/kGl4UHe//LPA==
X-Gm-Gg: ATEYQzxWwlO+PlcmjG7tMSMLN88FKQnMsuJSbPExWtEV4sjQAXqiczSQbnki2nxX2bL
	344tvxqKUAuC72EtS3MeOnKf7Lqn/5vPLBSREFIKc8CvOB0SMw4UP5EQiWIOZ6ENl8U2IsK3UDF
	YHXAD04hGkVl99FioOEU8BZaTWIqSWXMS2xIkZnFaSQCQHR6x180ZbIPOiSw43PMb7S40q3ki5O
	S7XxsIrBKHICurJyeghwEiyUv4mLOmOQc4u4SU3iV9XFs4cZMOXqaH8AYndHtq+Fn08v75QnkA0
	eDxo2ZcHSzhxNx3I82pKYwXyQGS5kakfSQPM
X-Received: by 2002:a05:6402:27cc:b0:665:57bf:7de6 with SMTP id
 4fb4d7f45d1cf-668cab41163mr2019122a12.0.1774019906737; Fri, 20 Mar 2026
 08:18:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260320075604.551251-1-vanusuri@mvista.com> <20260320075604.551251-4-vanusuri@mvista.com>
 <DH7OJD1OK560.20DYBG2U7KWUE@smile.fr>
In-Reply-To: <DH7OJD1OK560.20DYBG2U7KWUE@smile.fr>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Fri, 20 Mar 2026 20:48:12 +0530
X-Gm-Features: AaiRm50l9re2iUJPpwZiRHWN1f5j3Z__oL5gBuYXQeUubmcAdS9svXzie4dnZSI
Message-ID: <CANQUz193viLhzsv9Bw4XQ_zY8LdHFLFp+2yj5xXoTW0aAZt-fA@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH 4/4] curl: Fix CVE-2026-3784
To: Fabien Thomas <fabien.thomas@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005da4ea064d7632b5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 15:18:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233613

--0000000000005da4ea064d7632b5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Fabien Thomas,

Thanks for providing the feedback.

On Fri, Mar 20, 2026 at 7:59=E2=80=AFPM Fabien Thomas <fabien.thomas@smile.=
fr>
wrote:

> On Fri Mar 20, 2026 at 8:56 AM CET, Vijay Anusuri via
> lists.openembedded.org wrote:
> > From: Vijay Anusuri <vanusuri@mvista.com>
> >
> > import patch from ubuntu to fix
> >  CVE-2026-3784
> >
> > Upstream-Status: Backport [import from ubuntu
> curl_7.81.0-1ubuntu1.23.debian.tar.xz
> > Upstream commit
> https://github.com/curl/curl/commit/5f13a7645e565c5c1a06f3]
> >
> > Reference: https://curl.se/docs/CVE-2026-3784.html
> >            https://ubuntu.com/security/CVE-2026-3784
> >
> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > ---
> >  .../curl/curl/CVE-2026-3784.patch             | 74 +++++++++++++++++++
> >  meta/recipes-support/curl/curl_7.82.0.bb      |  1 +
> >  2 files changed, 75 insertions(+)
> >  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-3784.patch
> >
> > diff --git a/meta/recipes-support/curl/curl/CVE-2026-3784.patch
> b/meta/recipes-support/curl/curl/CVE-2026-3784.patch
> > new file mode 100644
> > index 0000000000..8f3d56bab9
> > --- /dev/null
> > +++ b/meta/recipes-support/curl/curl/CVE-2026-3784.patch
> > @@ -0,0 +1,74 @@
> > +Backport of:
> > +
> > +From 5f13a7645e565c5c1a06f3ef86e97afb856fb364 Mon Sep 17 00:00:00 2001
> > +From: Stefan Eissing <stefan@eissing.org>
> > +Date: Fri, 6 Mar 2026 14:54:09 +0100
> > +Subject: [PATCH] proxy-auth: additional tests
> > +
> > +Also eliminate the special handling for socks proxy match.
> > +
> > +Closes #20837
> > +
> > +Upstream-Status: Backport [import from ubuntu
> curl_7.81.0-1ubuntu1.23.debian.tar.xz
> > +Upstream commit
> https://github.com/curl/curl/commit/5f13a7645e565c5c1a06f3]
> > +CVE: CVE-2026-3784
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + lib/url.c                        | 28 +++++++---------------------
> > + tests/http/test_13_proxy_auth.py | 20 ++++++++++++++++++++
> > + tests/http/testenv/curl.py       | 18 +++++++++++++++---
> > + 3 files changed, 42 insertions(+), 24 deletions(-)
> > +
> > +--- a/lib/url.c
> > ++++ b/lib/url.c
> > +@@ -930,33 +930,15 @@ proxy_info_matches(const struct proxy_in
> > + {
> > +   if((data->proxytype =3D=3D needle->proxytype) &&
> > +      (data->port =3D=3D needle->port) &&
> > +-     Curl_safe_strcasecompare(data->host.name, needle->host.name))
> > +-    return TRUE;
> > ++     curl_strequal(data->host.name, needle->host.name)) {
> > +
> > ++    if(Curl_timestrcmp(data->user, needle->user) ||
> > ++       Curl_timestrcmp(data->passwd, needle->passwd))
> > ++      return FALSE;
> > ++    return TRUE;
> > ++  }
> > +   return FALSE;
> > + }
> > +-
> > +-static bool
> > +-socks_proxy_info_matches(const struct proxy_info *data,
> > +-                         const struct proxy_info *needle)
> > +-{
> > +-  if(!proxy_info_matches(data, needle))
> > +-    return FALSE;
> > +-
> > +-  /* the user information is case-sensitive
> > +-     or at least it is not defined as case-insensitive
> > +-     see https://datatracker.ietf.org/doc/html/rfc3986#section-3.2.1
> */
> > +-
> > +-  /* curl_strequal does a case insentive comparison, so do not use it
> here! */
> > +-  if(Curl_timestrcmp(data->user, needle->user) ||
> > +-     Curl_timestrcmp(data->passwd, needle->passwd))
> > +-    return FALSE;
> > +-  return TRUE;
> > +-}
> > +-#else
> > +-/* disabled, won't get called */
> > +-#define proxy_info_matches(x,y) FALSE
> > +-#define socks_proxy_info_matches(x,y) FALSE
> > + #endif
> > +
> > + /* A connection has to have been idle for a shorter time than
> 'maxage_conn'
> > +@@ -1282,8 +1264,8 @@ ConnectionExists(struct Curl_easy *data,
> > +         continue;
> > +
> > +       if(needle->bits.socksproxy &&
> > +-        !socks_proxy_info_matches(&needle->socks_proxy,
> > +-                                  &check->socks_proxy))
> > ++        !proxy_info_matches(&needle->socks_proxy,
> > ++                            &check->socks_proxy))
> > +         continue;
> > + #endif
> > +       if(needle->bits.conn_to_host !=3D check->bits.conn_to_host)
> > diff --git a/meta/recipes-support/curl/curl_7.82.0.bb
> b/meta/recipes-support/curl/curl_7.82.0.bb
> > index 8fdd954c7e..c33183e096 100644
> > --- a/meta/recipes-support/curl/curl_7.82.0.bb
> > +++ b/meta/recipes-support/curl/curl_7.82.0.bb
> > @@ -74,6 +74,7 @@ SRC_URI =3D "https://curl.se/download/${BP}.tar.xz \
> >             file://CVE-2026-1965-1.patch \
> >             file://CVE-2026-1965-2.patch \
> >             file://CVE-2026-3783.patch \
> > +           file://CVE-2026-3784.patch \
> >             "
> >  SRC_URI[sha256sum] =3D
> "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
> >
> Hi Vijay,
>
> This my general feedback on the whole curl patch series.
>
> I noticed quite big differences between the upstream commits you cited an=
d
> the
> ones actually provided in this series. If these backports are from Ubuntu
> or Debian, please include the direct links to those commits as well.
>
> --> The previous Ubuntu commit link (
https://git.launchpad.net/ubuntu/+source/curl/tree/debian/patches?h=3Dubunt=
u/jammy-security)
is currently not accessible.

I=E2=80=99ve referenced the tarball version instead:
https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/curl/7.81.0-1ubu=
ntu1.23/curl_7.81.0-1ubuntu1.23.debian.tar.xz

Would it be okay if I include this download link in the patch?

> Additionally, your backport for CVE-2025-14524 ([PATCH 1/4]) differs
> from the one by Amaury Couderc, which has already been merged into
> scarthgap.
> Maybe it would be simplier to cherry-picked it ?
>

--> Version in kirkstone is different from scarthgap. I will try to
cherry-pick and send a V2 patch.

>
> One last detail regarding formatting: the last four patches include
> a 'Backport of' prefix in the patch header. While not strictly forbidden,
> this is unusual and adds unnecessary noise.
> Could you please remove these headers next time?
>

--> Sure. I will remove those unusual headers.

>
> Thanks.
>
> Regards,
> --
> Fabien Thomas
> Smile ECS
>
>
Thanks & Regards,
Vijay

--0000000000005da4ea064d7632b5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Fabien Thomas,<br><br></div><div>Thanks for provid=
ing the feedback.</div><br><div class=3D"gmail_quote gmail_quote_container"=
><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 20, 2026 at 7:59=E2=80=
=AFPM Fabien Thomas &lt;<a href=3D"mailto:fabien.thomas@smile.fr">fabien.th=
omas@smile.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On Fri Mar 20, 2026 at 8:56 AM CET, Vijay Anusuri via <a href=
=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lis=
ts.openembedded.org</a> wrote:<br>
&gt; From: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" target=
=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt;<br>
&gt; import patch from ubuntu to fix<br>
&gt;=C2=A0 CVE-2026-3784<br>
&gt;<br>
&gt; Upstream-Status: Backport [import from ubuntu curl_7.81.0-1ubuntu1.23.=
debian.tar.xz<br>
&gt; Upstream commit <a href=3D"https://github.com/curl/curl/commit/5f13a76=
45e565c5c1a06f3" rel=3D"noreferrer" target=3D"_blank">https://github.com/cu=
rl/curl/commit/5f13a7645e565c5c1a06f3</a>]<br>
&gt;<br>
&gt; Reference: <a href=3D"https://curl.se/docs/CVE-2026-3784.html" rel=3D"=
noreferrer" target=3D"_blank">https://curl.se/docs/CVE-2026-3784.html</a><b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://ubuntu.com=
/security/CVE-2026-3784" rel=3D"noreferrer" target=3D"_blank">https://ubunt=
u.com/security/CVE-2026-3784</a><br>
&gt;<br>
&gt; Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com=
" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../curl/curl/CVE-2026-3784.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 74 +++++++++++++++++++<br>
&gt;=C2=A0 meta/recipes-support/curl/<a href=3D"http://curl_7.82.0.bb" rel=
=3D"noreferrer" target=3D"_blank">curl_7.82.0.bb</a>=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 1 +<br>
&gt;=C2=A0 2 files changed, 75 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-3784.=
patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/curl/curl/CVE-2026-3784.patch b/meta=
/recipes-support/curl/curl/CVE-2026-3784.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..8f3d56bab9<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/curl/curl/CVE-2026-3784.patch<br>
&gt; @@ -0,0 +1,74 @@<br>
&gt; +Backport of:<br>
&gt; +<br>
&gt; +From 5f13a7645e565c5c1a06f3ef86e97afb856fb364 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Stefan Eissing &lt;<a href=3D"mailto:stefan@eissing.org" target=
=3D"_blank">stefan@eissing.org</a>&gt;<br>
&gt; +Date: Fri, 6 Mar 2026 14:54:09 +0100<br>
&gt; +Subject: [PATCH] proxy-auth: additional tests<br>
&gt; +<br>
&gt; +Also eliminate the special handling for socks proxy match.<br>
&gt; +<br>
&gt; +Closes #20837<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [import from ubuntu curl_7.81.0-1ubuntu1.23=
.debian.tar.xz<br>
&gt; +Upstream commit <a href=3D"https://github.com/curl/curl/commit/5f13a7=
645e565c5c1a06f3" rel=3D"noreferrer" target=3D"_blank">https://github.com/c=
url/curl/commit/5f13a7645e565c5c1a06f3</a>]<br>
&gt; +CVE: CVE-2026-3784<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + lib/url.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 28 +++++++---------------------<br>
&gt; + tests/http/test_13_proxy_auth.py | 20 ++++++++++++++++++++<br>
&gt; + tests/http/testenv/curl.py=C2=A0 =C2=A0 =C2=A0 =C2=A0| 18 ++++++++++=
+++++---<br>
&gt; + 3 files changed, 42 insertions(+), 24 deletions(-)<br>
&gt; +<br>
&gt; +--- a/lib/url.c<br>
&gt; ++++ b/lib/url.c<br>
&gt; +@@ -930,33 +930,15 @@ proxy_info_matches(const struct proxy_in<br>
&gt; + {<br>
&gt; +=C2=A0 =C2=A0if((data-&gt;proxytype =3D=3D needle-&gt;proxytype) &amp=
;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 (data-&gt;port =3D=3D needle-&gt;port) &amp;&amp=
;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0Curl_safe_strcasecompare(data-&gt;<a href=3D"htt=
p://host.name" rel=3D"noreferrer" target=3D"_blank">host.name</a>, needle-&=
gt;<a href=3D"http://host.name" rel=3D"noreferrer" target=3D"_blank">host.n=
ame</a>))<br>
&gt; +-=C2=A0 =C2=A0 return TRUE;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0curl_strequal(data-&gt;<a href=3D"http://host.na=
me" rel=3D"noreferrer" target=3D"_blank">host.name</a>, needle-&gt;<a href=
=3D"http://host.name" rel=3D"noreferrer" target=3D"_blank">host.name</a>)) =
{<br>
&gt; + <br>
&gt; ++=C2=A0 =C2=A0 if(Curl_timestrcmp(data-&gt;user, needle-&gt;user) ||<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0Curl_timestrcmp(data-&gt;passwd, needle-&=
gt;passwd))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return FALSE;<br>
&gt; ++=C2=A0 =C2=A0 return TRUE;<br>
&gt; ++=C2=A0 }<br>
&gt; +=C2=A0 =C2=A0return FALSE;<br>
&gt; + }<br>
&gt; +-<br>
&gt; +-static bool<br>
&gt; +-socks_proxy_info_matches(const struct proxy_info *data,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0const struct proxy_info *needle)<br>
&gt; +-{<br>
&gt; +-=C2=A0 if(!proxy_info_matches(data, needle))<br>
&gt; +-=C2=A0 =C2=A0 return FALSE;<br>
&gt; +-<br>
&gt; +-=C2=A0 /* the user information is case-sensitive<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0or at least it is not defined as case-insensitiv=
e<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0see <a href=3D"https://datatracker.ietf.org/doc/=
html/rfc3986#section-3.2.1" rel=3D"noreferrer" target=3D"_blank">https://da=
tatracker.ietf.org/doc/html/rfc3986#section-3.2.1</a> */<br>
&gt; +-<br>
&gt; +-=C2=A0 /* curl_strequal does a case insentive comparison, so do not =
use it here! */<br>
&gt; +-=C2=A0 if(Curl_timestrcmp(data-&gt;user, needle-&gt;user) ||<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0Curl_timestrcmp(data-&gt;passwd, needle-&gt;pass=
wd))<br>
&gt; +-=C2=A0 =C2=A0 return FALSE;<br>
&gt; +-=C2=A0 return TRUE;<br>
&gt; +-}<br>
&gt; +-#else<br>
&gt; +-/* disabled, won&#39;t get called */<br>
&gt; +-#define proxy_info_matches(x,y) FALSE<br>
&gt; +-#define socks_proxy_info_matches(x,y) FALSE<br>
&gt; + #endif<br>
&gt; + <br>
&gt; + /* A connection has to have been idle for a shorter time than &#39;m=
axage_conn&#39;<br>
&gt; +@@ -1282,8 +1264,8 @@ ConnectionExists(struct Curl_easy *data,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if(needle-&gt;bits.socksproxy &amp;&amp;<b=
r>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 !socks_proxy_info_matches(&amp;needle-&g=
t;socks_proxy,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;check-&gt;socks_p=
roxy))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 !proxy_info_matches(&amp;needle-&gt;sock=
s_proxy,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;check-&gt;socks_proxy))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
&gt; + #endif<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if(needle-&gt;bits.conn_to_host !=3D check=
-&gt;bits.conn_to_host)<br>
&gt; diff --git a/meta/recipes-support/curl/<a href=3D"http://curl_7.82.0.b=
b" rel=3D"noreferrer" target=3D"_blank">curl_7.82.0.bb</a> b/meta/recipes-s=
upport/curl/<a href=3D"http://curl_7.82.0.bb" rel=3D"noreferrer" target=3D"=
_blank">curl_7.82.0.bb</a><br>
&gt; index 8fdd954c7e..c33183e096 100644<br>
&gt; --- a/meta/recipes-support/curl/<a href=3D"http://curl_7.82.0.bb" rel=
=3D"noreferrer" target=3D"_blank">curl_7.82.0.bb</a><br>
&gt; +++ b/meta/recipes-support/curl/<a href=3D"http://curl_7.82.0.bb" rel=
=3D"noreferrer" target=3D"_blank">curl_7.82.0.bb</a><br>
&gt; @@ -74,6 +74,7 @@ SRC_URI =3D &quot;<a href=3D"https://curl.se/downloa=
d/$%7BBP%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://curl.se/do=
wnload/${BP}.tar.xz</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2026-1965-1.=
patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2026-1965-2.=
patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2026-3783.pa=
tch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2026-3784.patch \=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;0aaa12d7bd04b0966254f2703ce80dd5c38=
dbbd76af0297d3d690cdce58a583c&quot;<br>
&gt;=C2=A0 <br>
Hi Vijay,<br>
<br>
This my general feedback on the whole curl patch series.<br>
<br>
I noticed quite big differences between the upstream commits you cited and =
the <br>
ones actually provided in this series. If these backports are from Ubuntu <=
br>
or Debian, please include the direct links to those commits as well.<br>
<br></blockquote><div>--&gt; The previous Ubuntu commit link (<a class=3D"g=
mail-decorated-link" rel=3D"noopener" href=3D"https://git.launchpad.net/ubu=
ntu/+source/curl/tree/debian/patches?h=3Dubuntu/jammy-security">https://git=
.launchpad.net/ubuntu/+source/curl/tree/debian/patches?h=3Dubuntu/jammy-sec=
urity<span aria-hidden=3D"true" class=3D"gmail-ms-0.5 gmail-inline-block gm=
ail-align-middle gmail-leading-none"></span></a>) is currently not accessib=
le.
<p>I=E2=80=99ve referenced the tarball version instead:<br>
<a class=3D"gmail-decorated-link" rel=3D"noopener" href=3D"https://launchpa=
d.net/ubuntu/+archive/primary/+sourcefiles/curl/7.81.0-1ubuntu1.23/curl_7.8=
1.0-1ubuntu1.23.debian.tar.xz">https://launchpad.net/ubuntu/+archive/primar=
y/+sourcefiles/curl/7.81.0-1ubuntu1.23/curl_7.81.0-1ubuntu1.23.debian.tar.x=
z<span aria-hidden=3D"true" class=3D"gmail-ms-0.5 gmail-inline-block gmail-=
align-middle gmail-leading-none"></span></a></p>
<p>Would it be okay if I include this download link in the patch?</p></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
Additionally, your backport for CVE-2025-14524 ([PATCH 1/4]) differs <br>
from the one by Amaury Couderc, which has already been merged into scarthga=
p. <br>
Maybe it would be simplier to cherry-picked it ?<br></blockquote><div><br><=
/div><div>--&gt; Version in kirkstone is different from scarthgap. I will t=
ry to cherry-pick and send a V2 patch. <br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
<br>
One last detail regarding formatting: the last four patches include <br>
a &#39;Backport of&#39; prefix in the patch header. While not strictly forb=
idden, <br>
this is unusual and adds unnecessary noise. <br>
Could you please remove these headers next time? <br></blockquote><div><br>=
</div><div>--&gt; Sure. I will remove those unusual headers.=C2=A0 <br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thanks.<br>
<br>
Regards,<br>
-- <br>
Fabien Thomas<br>
Smile ECS<br>
<br></blockquote><div><br></div><div>Thanks &amp; Regards,</div><div>Vijay =
<br></div></div></div>

--0000000000005da4ea064d7632b5--

