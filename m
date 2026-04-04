Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A0BEE88D94
	for <webhook@archiver.kernel.org>; Sat,  4 Apr 2026 08:43:32 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12883.1775292206404045276
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Apr 2026 01:43:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=OCQBlSrg;
 spf=pass (domain: mvista.com, ip: 209.85.208.42, mailfrom: vanusuri@mvista.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-66bb4d4fcb4so4596591a12.2
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Apr 2026 01:43:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775292205; cv=none;
        d=google.com; s=arc-20240605;
        b=Ebr45m2GqG1WTu16fF7/GthDfCUpEWLx0Y7Aix2o3C5awPXhb3bAfoas9znEMCNTAh
         Iqo6yjqG0JZvIUoHoNXDgBGBV3Dm/1Th+SDKdYba7vIcGMPi+wD57ShxLOjXqhikcvkl
         W8dr0ufEOTuEDdV4JhsMN/Gw9QYxJ37rcYJMvV4/nlG/awcgIkyDCuMrz8v84FFsfA31
         lm2wk1k1XVEsR7CTPjDyRfuol377QFmCwnQp5TNQWNzjt06tJyIT6X9DKyVizouvJRTh
         oBfR4Q/tJiHomkSbsf47DplefeUD7d8uVyAlaqbD+Xgjh2W2DsET1q45dnk0F8H7pyKK
         inkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YW/ixu3J+l+DkF9Zoh9sqmepkLtTs2yQrFDIPK0b+2Q=;
        fh=5VpxgiaFCw99hmUxvV+/er63fRX0UWM338mat0ljUv0=;
        b=jdmNNYsFw6h1NuVaMveyzY+VhQTV2IrfMPLFNHM9OZh5twkd9PmNcV0BCqvaZIvM5M
         IhZoqnU0YzY0Wyqyi9iqviA82iX4ECT0HgNC8Ei4C4q2n2fMMmNtFVBrPze95BpgiMH7
         Q6x12Er7z6YGZXVFAE5YGRqPSReI7ak3cInNIe6IOdjTQ4NIeMCBTzdrgfWz4qSnLy5z
         JKHEz9tYzLdioas4GjHyvMZoKhJiQP5RnBxvgjo7YLzHSTCJDFu0LmtTHwEMMAkOwrP1
         zyQRBdNoFG8vU9EVHm4ykayNxfIJg7ljyqYkNoe0UAGky30NDOkcSMCa1DRjwq0WAHoF
         xnDw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1775292205; x=1775897005; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YW/ixu3J+l+DkF9Zoh9sqmepkLtTs2yQrFDIPK0b+2Q=;
        b=OCQBlSrgyFvHI3cOoNUsfgkyvhhT310R4TE7HzrIe6Q+664++aiwQvrfdZNbtOySrR
         EdfUBQXHHpnQEGEYz8aJ4tWrz2PSEjL3VlphRF1mYQUjYKjfr6KyEwXJyf0t73LzR52T
         vvw+L82cJgOoF/5k2ki8btL+9zP4L8zxRtopE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775292205; x=1775897005;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YW/ixu3J+l+DkF9Zoh9sqmepkLtTs2yQrFDIPK0b+2Q=;
        b=OzTb/ErBpe/oUIFPQfw+VOpBYm/CxUU5wrQvlMKE1Kwsr2KzEbKyVdghXNyxs9rQ6L
         yljSOV11jiTwayR7AI0jwsUydAkIHNIPE1v1y9Aw0362JLUbxLp8AOBQyqHc9f0/QqcL
         3cSCuDMOK6qdNFPEUOJ3gjSyJtWpMdNfZVfoSulwbyRF0+3mruwsQe12diW7QGzROMCz
         dNRv+sHP1SdXuCos8eXhJ6Q0voHXn+j8bBBQdyxP3xSTr9gWS73rm9AeMJbdOu0P+sc5
         iOtg/NB8UQcTbPFbBwOvMaTc4faYHk2VCWBnWmUI8mzjmO3spCZP1EMRUSxbg+pGWV4B
         0nbw==
X-Gm-Message-State: AOJu0YyX8lsjRSEt+D09UGmwCZskCEs4nqNSHtLwfQ5YDHvGHSAUBeBH
	TWfpdlZ0VR11UTyYoeSP3WidoyJu831qDntOSBSqiTv7eIZOGvSsrQx38W/MeP9rQz1ZRd44jwq
	sRXrHjVWRz7AqgdkyvqoMjYD9K1EEP0L6m51OmiRfVw==
X-Gm-Gg: AeBDiesz4kY1YjLONZ8GgME+DR2g0qw3lzz5FQ9bfhgD9o5Dr7KrjZVwV4z4seqn9ld
	PALF+a53IMfhHh+Zgbl7BjVGOK8N8koxpo4YmEvuvTqbda/SsRLlbShisrGrFJP+1TXKJhAqL+N
	FFwmDI2vs/UqpGC/2rEwE7IIb0MBl5jH6HZE0k2ykGvvPztT4truNKIPIYMk/S09ze6FvK64vyc
	AUmd3+dgjPvlVIYyjd+adCxZGFYpCN77wE9oUSbU42SNnlvNGjB4YBDBsaAbavv5GvcEs7ajQLG
	zohcfxlAzNR+c7fbvuHnIciItiBgUs3asmjH8BmugATPBOmKMcwE
X-Received: by 2002:a05:6402:3052:10b0:66e:5664:1e23 with SMTP id
 4fb4d7f45d1cf-66e56642218mr1580473a12.7.1775292204476; Sat, 04 Apr 2026
 01:43:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260402071559.292708-1-vanusuri@mvista.com> <DHJW0NQHT38D.XY6Q9OTN12FY@smile.fr>
 <CANQUz183e_N3p7n1pSr4sXUP0QAHpytUZ=-akObn1HV3PXttqQ@mail.gmail.com> <DHK7STMY8355.1F4WMJQ94QI3C@smile.fr>
In-Reply-To: <DHK7STMY8355.1F4WMJQ94QI3C@smile.fr>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Sat, 4 Apr 2026 14:13:12 +0530
X-Gm-Features: AQROBzB9k0PSwglGsG0FZWQ3HIp0p0A06zl1iNfyk3vF16wNwV7h6VJ1wHc7kZc
Message-ID: <CANQUz1913UWT4A8TQnN0jknyrSagoN6gg8jyxi52dkbsqHSy2g@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] sqlite3: Fix CVE-2025-70873
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000387d30064e9e6d94"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Apr 2026 08:43:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234612

--000000000000387d30064e9e6d94
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

Thanks for checking.

From what I could verify, the issue affects SQLite versions with the
zipfile extension up to 3.51.1. The upstream fix appears to originate from
commit https://sqlite.org/src/info/3d459f1fb1bd1b5e (as referenced in the
SQLite tracker and forum discussion).

https://gist.github.com/cnwangjihe/f496393f30f5ecec5b18c8f5ab072054

https://sqlite.org/forum/forumpost/761eac3c82

In the 3.51.3 tag, the fix seems to be included as part of a larger
upstream commit
(https://github.com/sqlite/sqlite/commit/15cd6704863f7c68818b2d607191ab6944=
d39f98),
which bundles multiple changes together rather than isolating the CVE fix
in a single minimal patch. That likely explains why it=E2=80=99s not immedi=
ately
obvious when looking for a one-to-one commit reference.

So while there isn=E2=80=99t a standalone CVE-specific commit in 3.51.3, th=
e fix is
incorporated there as part of that broader change set.

Thanks & Regards,

Vijay




On Sat, Apr 4, 2026 at 1:37=E2=80=AFPM Yoann Congal <yoann.congal@smile.fr>=
 wrote:

> On Sat Apr 4, 2026 at 9:41 AM CEST, Vijay Anusuri wrote:
> > Hi Yoann,
> >
> > The fixes for this CVE are already included in SQLite version 3.51.3 on
> the
> > master branch.
>
> Can you tell me what commit does fix this CVE on the 3.51.3 tag? I don't
> see it.
>
> Regards,
>
> > I=E2=80=99ve already submitted backport patches for the whinlatter and =
scarthgap
> > branches. Please let me know if anything further is needed.
> >
> > Thanks & Regards,
> >
> > Vijay
> >
> >
> > On Sat, Apr 4, 2026 at 4:23=E2=80=AFAM Yoann Congal <yoann.congal@smile=
.fr>
> wrote:
> >
> >> On Thu Apr 2, 2026 at 9:15 AM CEST, Vijay Anusuri via
> >> lists.openembedded.org wrote:
> >> > From: Vijay Anusuri <vanusuri@mvista.com>
> >> >
> >> > Pick patch as per [1]
> >> >
> >> > [1] https://sqlite.org/src/info/3d459f1fb1bd1b5e
> >> > [2] https://sqlite.org/forum/forumpost/761eac3c82
> >> > [3]
> https://gist.github.com/cnwangjihe/f496393f30f5ecec5b18c8f5ab072054
> >> >
> >> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> >> > ---
> >>
> >> Hello,
> >>
> >> As far as I can tell, this CVE applies to master. Since this is the en=
d
> >> of kirkstone soon, I'll take it into the reviews series but can only
> >> merge it if there is a patch sent for this CVE in those branches.
> >>
> >> Regards,
> >>
> >> >  .../sqlite/files/CVE-2025-70873.patch         | 33
> +++++++++++++++++++
> >> >  meta/recipes-support/sqlite/sqlite3_3.38.5.bb |  1 +
> >> >  2 files changed, 34 insertions(+)
> >> >  create mode 100644
> >> meta/recipes-support/sqlite/files/CVE-2025-70873.patch
> >> >
> >> > diff --git a/meta/recipes-support/sqlite/files/CVE-2025-70873.patch
> >> b/meta/recipes-support/sqlite/files/CVE-2025-70873.patch
> >> > new file mode 100644
> >> > index 0000000000..86004c0b74
> >> > --- /dev/null
> >> > +++ b/meta/recipes-support/sqlite/files/CVE-2025-70873.patch
> >> > @@ -0,0 +1,33 @@
> >> > +From 5a05c59d4d75c03f23d5fb70feac9f789954bf8a Mon Sep 17 00:00:00
> 2001
> >> > +From: drh <>
> >> > +Date: Sat, 6 Dec 2025 20:41:24 +0000
> >> > +Subject: [PATCH] In the zipfile extension, only return as many byte=
s
> as
> >> > + Inflate actually generated.  [forum:/forumpost/761eac3c82|Forum po=
st
> >> > + 761eac3c82]. Adjust ./configure so that it builds zipfile into
> >> testfixture if
> >> > + ZLIB is available, so that tests get run on unix platforms.
> >> > +
> >> > +FossilOrigin-Name:
> >> 3d459f1fb1bd1b5e723629c463ab392af7b206ece3388bda216c6a4c26160909
> >> > +
> >> > +Upstream-Status: Backport [
> >>
> https://github.com/sqlite/sqlite/commit/5a05c59d4d75c03f23d5fb70feac9f789=
954bf8a
> >> ]
> >> > +CVE: CVE-2025-70873
> >> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> >> > +---
> >> > + shell.c | 2 +-
> >> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> >> > +
> >> > +diff --git a/shell.c b/shell.c
> >> > +index fa45d40..3c4902c 100644
> >> > +--- a/shell.c
> >> > ++++ b/shell.c
> >> > +@@ -7668,7 +7668,7 @@ static void zipfileInflate(
> >> > +       if( err!=3DZ_STREAM_END ){
> >> > +         zipfileCtxErrorMsg(pCtx, "inflate() failed (%d)", err);
> >> > +       }else{
> >> > +-        sqlite3_result_blob(pCtx, aRes, nOut, zipfileFree);
> >> > ++        sqlite3_result_blob(pCtx, aRes, (int)str.total_out,
> >> zipfileFree);
> >> > +         aRes =3D 0;
> >> > +       }
> >> > +     }
> >> > +--
> >> > +2.25.1
> >> > +
> >> > diff --git a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
> >> b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
> >> > index acdd80022e..9e10caa399 100644
> >> > --- a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
> >> > +++ b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
> >> > @@ -10,6 +10,7 @@ SRC_URI =3D "
> >> http://www.sqlite.org/2022/sqlite-autoconf-${SQLITE_PV}.tar.gz \
> >> >             file://CVE-2023-7104.patch \
> >> >             file://CVE-2025-29088.patch \
> >> >             file://CVE-2025-6965.patch \
> >> > +           file://CVE-2025-70873.patch \
> >> >             "
> >> >  SRC_URI[sha256sum] =3D
> >> "5af07de982ba658fd91a03170c945f99c971f6955bc79df3266544373e39869c"
> >> >
> >>
> >>
> >> --
> >> Yoann Congal
> >> Smile ECS
> >>
> >>
>
>
> --
> Yoann Congal
> Smile ECS
>
>

--000000000000387d30064e9e6d94
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p><span>Hi Yoann,</span></p><p><span>Thanks for checking.=
</span></p><p><span>From what I could verify, the issue affects SQLite vers=
ions with the zipfile extension up to 3.51.1. The upstream fix appears to o=
riginate from commit </span><a href=3D"https://sqlite.org/src/info/3d459f1f=
b1bd1b5e">https://sqlite.org/src/info/3d459f1fb1bd1b5e</a> <span>(as refere=
nced in the SQLite tracker and forum discussion).<br><br></span><a href=3D"=
https://gist.github.com/cnwangjihe/f496393f30f5ecec5b18c8f5ab072054">https:=
//gist.github.com/cnwangjihe/f496393f30f5ecec5b18c8f5ab072054</a></p><p><a =
href=3D"https://sqlite.org/forum/forumpost/761eac3c82">https://sqlite.org/f=
orum/forumpost/761eac3c82</a></p><p><span>In the 3.51.3 tag, the fix seems =
to be included as part of a larger upstream commit (</span><a href=3D"https=
://github.com/sqlite/sqlite/commit/">https://github.com/sqlite/sqlite/commi=
t/</a><span>15cd6704863f7c68818b2d607191ab6944d39f98), which bundles multip=
le changes together rather than isolating the CVE fix in a single minimal p=
atch. That likely explains why it=E2=80=99s not immediately obvious when lo=
oking for a one-to-one commit reference.</span></p><p><span>So while there =
isn=E2=80=99t a standalone CVE-specific commit in 3.51.3, the fix is incorp=
orated there as part of that broader change set.<br><br></span></p><p><span=
>Thanks &amp; Regards,<br></span></p><p><span>Vijay</span></p><p><br></p><b=
r></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"lt=
r" class=3D"gmail_attr">On Sat, Apr 4, 2026 at 1:37=E2=80=AFPM Yoann Congal=
 &lt;<a href=3D"mailto:yoann.congal@smile.fr">yoann.congal@smile.fr</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Sat A=
pr 4, 2026 at 9:41 AM CEST, Vijay Anusuri wrote:<br>
&gt; Hi Yoann,<br>
&gt;<br>
&gt; The fixes for this CVE are already included in SQLite version 3.51.3 o=
n the<br>
&gt; master branch.<br>
<br>
Can you tell me what commit does fix this CVE on the 3.51.3 tag? I don&#39;=
t see it.<br>
<br>
Regards,<br>
<br>
&gt; I=E2=80=99ve already submitted backport patches for the whinlatter and=
 scarthgap<br>
&gt; branches. Please let me know if anything further is needed.<br>
&gt;<br>
&gt; Thanks &amp; Regards,<br>
&gt;<br>
&gt; Vijay<br>
&gt;<br>
&gt;<br>
&gt; On Sat, Apr 4, 2026 at 4:23=E2=80=AFAM Yoann Congal &lt;<a href=3D"mai=
lto:yoann.congal@smile.fr" target=3D"_blank">yoann.congal@smile.fr</a>&gt; =
wrote:<br>
&gt;<br>
&gt;&gt; On Thu Apr 2, 2026 at 9:15 AM CEST, Vijay Anusuri via<br>
&gt;&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" targe=
t=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt;&gt; &gt; From: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com=
" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Pick patch as per [1]<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; [1] <a href=3D"https://sqlite.org/src/info/3d459f1fb1bd1b5e" =
rel=3D"noreferrer" target=3D"_blank">https://sqlite.org/src/info/3d459f1fb1=
bd1b5e</a><br>
&gt;&gt; &gt; [2] <a href=3D"https://sqlite.org/forum/forumpost/761eac3c82"=
 rel=3D"noreferrer" target=3D"_blank">https://sqlite.org/forum/forumpost/76=
1eac3c82</a><br>
&gt;&gt; &gt; [3] <a href=3D"https://gist.github.com/cnwangjihe/f496393f30f=
5ecec5b18c8f5ab072054" rel=3D"noreferrer" target=3D"_blank">https://gist.gi=
thub.com/cnwangjihe/f496393f30f5ecec5b18c8f5ab072054</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@m=
vista.com" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt;<br>
&gt;&gt; Hello,<br>
&gt;&gt;<br>
&gt;&gt; As far as I can tell, this CVE applies to master. Since this is th=
e end<br>
&gt;&gt; of kirkstone soon, I&#39;ll take it into the reviews series but ca=
n only<br>
&gt;&gt; merge it if there is a patch sent for this CVE in those branches.<=
br>
&gt;&gt;<br>
&gt;&gt; Regards,<br>
&gt;&gt;<br>
&gt;&gt; &gt;=C2=A0 .../sqlite/files/CVE-2025-70873.patch=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 33 +++++++++++++++++++<br>
&gt;&gt; &gt;=C2=A0 meta/recipes-support/sqlite/<a href=3D"http://sqlite3_3=
.38.5.bb" rel=3D"noreferrer" target=3D"_blank">sqlite3_3.38.5.bb</a> |=C2=
=A0 1 +<br>
&gt;&gt; &gt;=C2=A0 2 files changed, 34 insertions(+)<br>
&gt;&gt; &gt;=C2=A0 create mode 100644<br>
&gt;&gt; meta/recipes-support/sqlite/files/CVE-2025-70873.patch<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/meta/recipes-support/sqlite/files/CVE-2025-70873=
.patch<br>
&gt;&gt; b/meta/recipes-support/sqlite/files/CVE-2025-70873.patch<br>
&gt;&gt; &gt; new file mode 100644<br>
&gt;&gt; &gt; index 0000000000..86004c0b74<br>
&gt;&gt; &gt; --- /dev/null<br>
&gt;&gt; &gt; +++ b/meta/recipes-support/sqlite/files/CVE-2025-70873.patch<=
br>
&gt;&gt; &gt; @@ -0,0 +1,33 @@<br>
&gt;&gt; &gt; +From 5a05c59d4d75c03f23d5fb70feac9f789954bf8a Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; &gt; +From: drh &lt;&gt;<br>
&gt;&gt; &gt; +Date: Sat, 6 Dec 2025 20:41:24 +0000<br>
&gt;&gt; &gt; +Subject: [PATCH] In the zipfile extension, only return as ma=
ny bytes as<br>
&gt;&gt; &gt; + Inflate actually generated.=C2=A0 [forum:/forumpost/761eac3=
c82|Forum post<br>
&gt;&gt; &gt; + 761eac3c82]. Adjust ./configure so that it builds zipfile i=
nto<br>
&gt;&gt; testfixture if<br>
&gt;&gt; &gt; + ZLIB is available, so that tests get run on unix platforms.=
<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +FossilOrigin-Name:<br>
&gt;&gt; 3d459f1fb1bd1b5e723629c463ab392af7b206ece3388bda216c6a4c26160909<b=
r>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +Upstream-Status: Backport [<br>
&gt;&gt; <a href=3D"https://github.com/sqlite/sqlite/commit/5a05c59d4d75c03=
f23d5fb70feac9f789954bf8a" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/sqlite/sqlite/commit/5a05c59d4d75c03f23d5fb70feac9f789954bf8a</a><b=
r>
&gt;&gt; ]<br>
&gt;&gt; &gt; +CVE: CVE-2025-70873<br>
&gt;&gt; &gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@=
mvista.com" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt;&gt; &gt; +---<br>
&gt;&gt; &gt; + shell.c | 2 +-<br>
&gt;&gt; &gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +diff --git a/shell.c b/shell.c<br>
&gt;&gt; &gt; +index fa45d40..3c4902c 100644<br>
&gt;&gt; &gt; +--- a/shell.c<br>
&gt;&gt; &gt; ++++ b/shell.c<br>
&gt;&gt; &gt; +@@ -7668,7 +7668,7 @@ static void zipfileInflate(<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if( err!=3DZ_STREAM_END ){<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0zipfileCtxErrorMsg(pCtx, &=
quot;inflate() failed (%d)&quot;, err);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}else{<br>
&gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sqlite3_result_blob(pCtx, aRes,=
 nOut, zipfileFree);<br>
&gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 sqlite3_result_blob(pCtx, aRes,=
 (int)str.total_out,<br>
&gt;&gt; zipfileFree);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aRes =3D 0;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; &gt; +--<br>
&gt;&gt; &gt; +2.25.1<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; diff --git a/meta/recipes-support/sqlite/<a href=3D"http://sq=
lite3_3.38.5.bb" rel=3D"noreferrer" target=3D"_blank">sqlite3_3.38.5.bb</a>=
<br>
&gt;&gt; b/meta/recipes-support/sqlite/<a href=3D"http://sqlite3_3.38.5.bb"=
 rel=3D"noreferrer" target=3D"_blank">sqlite3_3.38.5.bb</a><br>
&gt;&gt; &gt; index acdd80022e..9e10caa399 100644<br>
&gt;&gt; &gt; --- a/meta/recipes-support/sqlite/<a href=3D"http://sqlite3_3=
.38.5.bb" rel=3D"noreferrer" target=3D"_blank">sqlite3_3.38.5.bb</a><br>
&gt;&gt; &gt; +++ b/meta/recipes-support/sqlite/<a href=3D"http://sqlite3_3=
.38.5.bb" rel=3D"noreferrer" target=3D"_blank">sqlite3_3.38.5.bb</a><br>
&gt;&gt; &gt; @@ -10,6 +10,7 @@ SRC_URI =3D &quot;<br>
&gt;&gt; <a href=3D"http://www.sqlite.org/2022/sqlite-autoconf-$%7BSQLITE_P=
V%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://www.sqlite.org/202=
2/sqlite-autoconf-${SQLITE_PV}.tar.gz</a> \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-202=
3-7104.patch \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-202=
5-29088.patch \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-202=
5-6965.patch \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-708=
73.patch \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;&gt; &gt;=C2=A0 SRC_URI[sha256sum] =3D<br>
&gt;&gt; &quot;5af07de982ba658fd91a03170c945f99c971f6955bc79df3266544373e39=
869c&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; Yoann Congal<br>
&gt;&gt; Smile ECS<br>
&gt;&gt;<br>
&gt;&gt;<br>
<br>
<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</blockquote></div>

--000000000000387d30064e9e6d94--

