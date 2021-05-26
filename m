Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
 by mx.groups.io with SMTP id smtpd.web11.10131.1622046677277844705
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 May 2021 09:31:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pI/lpaQ5;
 spf=pass (domain: gmail.com, ip: 209.85.217.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f52.google.com with SMTP id u188so988358vsu.8
        for <openembedded-core@lists.openembedded.org>; Wed, 26 May 2021 09:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/yXno/KFQHonmftvOtLJFGjp2eJhzefU5DdnSmjAeIQ=;
        b=pI/lpaQ5//lui3trJGX6g7C66KRLu47NQDGxydkzAlE2Dlq/FnRJ8u47TMk8/49I8u
         Qv30H8r2sAMC1MyFYbKqGifObGSbsqgUxfc9PmsnxI9uGg1MEr1B4GJizweCOR5Ay6K9
         cO7Ix1YX9bZ/LX+/SfosT3mdd0hBYO0X3dwb8ZdzoL3tfN5nVdiviDvDm+CfhbP6+uNA
         H+Een8BfXLCpMy7XZaSm635Q9ZCBYHKTbgJSKtc974Hx6+18Xghxym0F+W2yMbzo4HPv
         FzORQwYerDSUk9XjZufVCHSTqeCWOWMrvj7djDRYHMSYcm0yGftRFmBLLUIxcTUP4cof
         3VOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/yXno/KFQHonmftvOtLJFGjp2eJhzefU5DdnSmjAeIQ=;
        b=TtplmgOKK/ixtlwGNprqOeGKkBTn4/X407J2LdTMjCCdwIgXm1NSO1xqskImtTw9BX
         o7mRsNGkYwjSpsfRhLFZswJ2QGADXKa3/xN0jAJ6Rx4gUW7QnExNeJE0DdgiIPOf8ZMl
         V8QttFO0/f3trfjFx4qjkn4FCTHIiI3vePGXmhus9h5Gzb5eFzsL4mbi/9w0CAaRvQ3D
         N0y1PB+wDGnXpzu62KMCj22VKgFDK1EQ9CaXnRmGW3EEFV7VP9afRsqtfs0bCGE4hr+h
         zVQoBV2ygmsOppOHo4Ni4KlSbUUdQOYpdboE4QQJF38ILS305Bh/KMF8hWyNuOroRLoU
         gb8Q==
X-Gm-Message-State: AOAM5319RPff5oPcFjMmFYI3UeekB/xQVdCuyrxZdrlMDLsqqQG9mwov
	bi8a+eyJlt6aiKKyxs+3SJdPubZG2gzNG5RJgEqFti6q
X-Google-Smtp-Source: ABdhPJxZ4yfwmlBAc5mveuHDg7AGsVgOUpATiiykX1q1OyUYWi2kqaGlfIsvYTsF5lL03iS80YR8TODI8WAHuFAeM8I=
X-Received: by 2002:a67:d715:: with SMTP id p21mr31446591vsj.31.1622046676027;
 Wed, 26 May 2021 09:31:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210526143021.3920457-1-ross.burton@arm.com> <AM9PR09MB464243195811A0A545893993A8249@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: <AM9PR09MB464243195811A0A545893993A8249@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 26 May 2021 18:31:04 +0200
Message-ID: <CANNYZj8P=MiXKYsBhPBdrPDskZ5BvZvtm+7E1k6TzcEU21gMmg@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] rpm: limit xz threading
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Ross Burton <ross@burtonini.com>
Content-Type: multipart/alternative; boundary="000000000000ef2a5f05c33e2ba1"

--000000000000ef2a5f05c33e2ba1
Content-Type: text/plain; charset="UTF-8"

I think Ross already sent a better patch where the number of threads is set
externally via BB variable?

Alex

On Wed, 26 May 2021 at 18:08, Konrad Weihmann <kweihmann@outlook.com> wrote:

>
>
> On 26.05.21 16:30, Ross Burton wrote:
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >   .../rpm/files/less-threads.patch              | 24 +++++++++++++++++++
> >   meta/recipes-devtools/rpm/rpm_4.16.1.3.bb     |  1 +
> >   2 files changed, 25 insertions(+)
> >   create mode 100644 meta/recipes-devtools/rpm/files/less-threads.patch
> >
> > diff --git a/meta/recipes-devtools/rpm/files/less-threads.patch
> b/meta/recipes-devtools/rpm/files/less-threads.patch
> > new file mode 100644
> > index 0000000000..d6db85f28a
> > --- /dev/null
> > +++ b/meta/recipes-devtools/rpm/files/less-threads.patch
> > @@ -0,0 +1,24 @@
> > +Instead of telling XZ to use as many threads as there are processor
> cores, just
> > +hardcode this to 4.
>
> at this point I read 4
>
> > +
> > +On large systems with lots of cores, XZ will use unreasonable amounts
> of memory.
> > +For example, my ThunderX2 reports 256 cores and rpmbuild takes 3.8GB of
> resident
> > +memory when packaging cmake. Limiting RPM to just 8 threads reduces
> this to
> > +1.2GB without massively reducing the compression speed.
> > +
> > +Upstream-Status: Inappropriate
> > +Signed-off-by: Ross Burton <ross.burton@arm.com>
> > +
> > +diff --git a/rpmio/rpmio.c b/rpmio/rpmio.c
> > +index 52be6a38d..c4034e9e5 100644
> > +--- a/rpmio/rpmio.c
> > ++++ b/rpmio/rpmio.c
> > +@@ -799,7 +799,7 @@ static LZFILE *lzopen_internal(const char *mode,
> int fd, int xz)
> > + #ifdef HAVE_LZMA_MT
> > +         } else {
> > +             if (threads == -1)
> > +-                threads = rpmExpandNumeric("%{getncpus}");
> > ++                threads = 8;
>
> ...but here it's 8 :thinking: (I know 2xthreads == cores, still I find
> the commit messages very confusing). Wouldn't it make more sense to
> externalize the value, so that patch might become upstreamable?
>
> > +             lzma_mt mt_options = {
> > +                 .flags = 0,
> > +                 .threads = threads,
> > diff --git a/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
> b/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
> > index 95a6f5cf71..f7e9378061 100644
> > --- a/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
> > +++ b/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
> > @@ -40,6 +40,7 @@ SRC_URI = "git://
> github.com/rpm-software-management/rpm;branch=rpm-4.16.x \
> >
> file://0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch \
> >
> file://0001-lib-transaction.c-fix-file-conflicts-for-MIPS64-N32.patch \
> >              file://0001-tools-Add-error.h-for-non-glibc-case.patch \
> > +           file://less-threads.patch \
> >              "
> >
> >   PE = "1"
> >
> >
> >
> >
> >
>
> 
>
>

--000000000000ef2a5f05c33e2ba1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I think Ross already sent a better patch where the nu=
mber of threads is set externally via BB variable?</div><div><br></div><div=
>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, 26 May 2021 at 18:08, Konrad Weihmann &lt;<a href=
=3D"mailto:kweihmann@outlook.com" target=3D"_blank">kweihmann@outlook.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
br>
<br>
On 26.05.21 16:30, Ross Burton wrote:<br>
&gt; Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com"=
 target=3D"_blank">ross.burton@arm.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0.../rpm/files/less-threads.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 24 +++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0meta/recipes-devtools/rpm/<a href=3D"http://rpm_4.16.1.3.=
bb" rel=3D"noreferrer" target=3D"_blank">rpm_4.16.1.3.bb</a>=C2=A0 =C2=A0 =
=C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A02 files changed, 25 insertions(+)<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-devtools/rpm/files/less-t=
hreads.patch<br>
&gt; <br>
&gt; diff --git a/meta/recipes-devtools/rpm/files/less-threads.patch b/met=
a/recipes-devtools/rpm/files/less-threads.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..d6db85f28a<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/rpm/files/less-threads.patch<br>
&gt; @@ -0,0 +1,24 @@<br>
&gt; +Instead of telling XZ to use as many threads as there are processor =
cores, just<br>
&gt; +hardcode this to 4.<br>
<br>
at this point I read 4<br>
<br>
&gt; +<br>
&gt; +On large systems with lots of cores, XZ will use unreasonable amount=
s of memory.<br>
&gt; +For example, my ThunderX2 reports 256 cores and rpmbuild takes 3.8GB=
 of resident<br>
&gt; +memory when packaging cmake. Limiting RPM to just 8 threads reduces =
this to<br>
&gt; +1.2GB without massively reducing the compression speed.<br>
&gt; +<br>
&gt; +Upstream-Status: Inappropriate<br>
&gt; +Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com=
" target=3D"_blank">ross.burton@arm.com</a>&gt;<br>
&gt; +<br>
&gt; +diff --git a/rpmio/rpmio.c b/rpmio/rpmio.c<br>
&gt; +index 52be6a38d..c4034e9e5 100644<br>
&gt; +--- a/rpmio/rpmio.c<br>
&gt; ++++ b/rpmio/rpmio.c<br>
&gt; +@@ -799,7 +799,7 @@ static LZFILE *lzopen_internal(const char *mode,=
 int fd, int xz)<br>
&gt; + #ifdef HAVE_LZMA_MT<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (threads =3D=3D -=
1)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 threads =3D=
 rpmExpandNumeric(&quot;%{getncpus}&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 threads =3D=
 8;<br>
<br>
...but here it&#39;s 8 :thinking: (I know 2xthreads =3D=3D cores, still I =
find <br>
the commit messages very confusing). Wouldn&#39;t it make more sense to <b=
r>
externalize the value, so that patch might become upstreamable?<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lzma_mt mt_options =
=3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.flags=
 =3D 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.threa=
ds =3D threads,<br>
&gt; diff --git a/meta/recipes-devtools/rpm/<a href=3D"http://rpm_4.16.1.3=
.bb" rel=3D"noreferrer" target=3D"_blank">rpm_4.16.1.3.bb</a> b/meta/recipe=
s-devtools/rpm/<a href=3D"http://rpm_4.16.1.3.bb" rel=3D"noreferrer" target=
=
=3D"_blank">rpm_4.16.1.3.bb</a><br>
&gt; index 95a6f5cf71..f7e9378061 100644<br>
&gt; --- a/meta/recipes-devtools/rpm/<a href=3D"http://rpm_4.16.1.3.bb" re=
l=3D"noreferrer" target=3D"_blank">rpm_4.16.1.3.bb</a><br>
&gt; +++ b/meta/recipes-devtools/rpm/<a href=3D"http://rpm_4.16.1.3.bb" re=
l=3D"noreferrer" target=3D"_blank">rpm_4.16.1.3.bb</a><br>
&gt; @@ -40,6 +40,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.co=
m/rpm-software-management/rpm;branch=3Drpm-4.16.x" rel=3D"noreferrer" targe=
t=3D"_blank">github.com/rpm-software-management/rpm;branch=3Drpm-4.16.x</a>=
 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0016-rpmscript=
.c-change-logging-level-around-scriptlets-t.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-lib-trans=
action.c-fix-file-conflicts-for-MIPS64-N32.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-tools-Add=
-error.h-for-non-glibc-case.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://less-threads.patch \=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0PE =3D &quot;1&quot;<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
<br>
</blockquote></div>

--000000000000ef2a5f05c33e2ba1--
