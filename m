Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.502.1613519640481387797
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 15:54:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rCvhF9gN;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id l12so14396338edt.3
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 15:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TEv5qf0YX4D2oFbiSKWsorrWYjiT6CsnAsroD3FIpxI=;
        b=rCvhF9gNeq+aR+8j/wMeQ3N3FJGphBAnD6HSsJSzbKj+7KChwypdcTo9YHylcHcHc/
         WnvpP7doiV6XXw8XEqpZ9l6b667mU2FAQG0ZiX0YpFIEg1dMOz7alBBGgzNwBWpRKKyi
         XZ8uuCeBS0ZJKHQYgc+IZkcBuYRxS282UQToRynsTbfXwureNF80ALdk9wqPFoXWwlx/
         Lefe2pewwJQz/PC/Pso/B5sLyZso0kLP13bxcLTUOY7nrWc0hwvUiixOuqYIbAkrNg8F
         HQHeNrViBN1rAJZp4tjNZCwCovbzeOXErPzvBHYHxL+MsFHjRRkNjIr8MFcLN2C0dqqV
         s/WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TEv5qf0YX4D2oFbiSKWsorrWYjiT6CsnAsroD3FIpxI=;
        b=Ldhv8rUjHgx6D1AmcnCuxtR1dNmy6w7twLdpiC1mEoGRZT1J1KkWESR456oNpZo+xi
         P4YCBa6vCGkSJrSdwitLBMh+ch61PH1an3cjpIroIttJaJGfLtbf5NZZpdull4d0bJD5
         OV0yyGwtXUEZJ5bjDnQ2dBRcxUSYJIvkgCENM0hfOLbvL7zHUxrwN6u9n34AUpChLODg
         +hx0JkO84gk3x4WQG4WFoRAodlATgGSR+Wv34Q/upk8Wx+jreBzubyoaTGQPjZrBh8Rk
         LmDfxez8IYnktI8ui525l8VQh0WxyE2Yl5V/EjRpK2vKilah4faUReVSGisVrWYLJ7yC
         NqsA==
X-Gm-Message-State: AOAM532btMfdzvafn14O6froPIRBWhlAy+OtuJuc9cr7VjSjzG1QKrC8
	Eu1+mW0aQnwyjgNfelykvRzHzKXXoR/vZ5lvrOY=
X-Google-Smtp-Source: ABdhPJz96syI+InilQxRbpzltyVuvaWJaf2k1JiDWsnzvBKKTGZNlJug2ADj9wq4lccTwDAzN2blEzL9vxTLDlIKUIs=
X-Received: by 2002:a05:6402:c05:: with SMTP id co5mr20358477edb.388.1613519638765;
 Tue, 16 Feb 2021 15:53:58 -0800 (PST)
MIME-Version: 1.0
References: <20210216230130.1516657-1-Martin.Jansa@gmail.com> <CAMKF1sqh0WEed86n+JGM3WHVxAM31xUZ6mR744CQpUE4Sa1ziQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqh0WEed86n+JGM3WHVxAM31xUZ6mR744CQpUE4Sa1ziQ@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Tue, 16 Feb 2021 15:53:47 -0800
Message-ID: <CA+chaQdoYMbPazDp8onpqJMNj9SBL7pT_5XLYE1Dv1XmJ5ZMZw@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] icu: backport fix for rare random genrb segmentation fault
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e8224905bb7cd098"

--000000000000e8224905bb7cd098
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 16, 2021 at 3:33 PM Khem Raj <raj.khem@gmail.com> wrote:

> > index 08254648e4..6ba88595df 100644
> > --- a/meta/recipes-support/icu/icu_66.1.bb
> > +++ b/meta/recipes-support/icu/icu_66.1.bb
> > @@ -21,10 +21,11 @@ BASE_SRC_URI = "
> https://github.com/unicode-org/icu/releases/download/release-${I
> >  DATA_SRC_URI = "
> https://github.com/unicode-org/icu/releases/download/release-${ICU_FOLDER}/icu4c-${ICU_PV}-data.zip
> "
> >  SRC_URI = "${BASE_SRC_URI};name=code \
> >             ${DATA_SRC_URI};name=data \
> > +           file://0001-Fix-big-endian-build.patch;patchdir=${WORKDIR} \
>
 > +
 file://0002-ICU-21175-Add-cnvalias-as-a-dependency-of-misc_res.patch;patchdir=${WORKDIR}
\

>
> why this change ?
>

Because both these patches need to be applied on ${WORKDIR}/data directory
and doing it here provides slightly better error message when the patch
doesn't apply (e.g. in this case ${WORKDIR}/data is using dos line endings,
but I was preparing the patch in git repo where it's using unix line
endings as expected) and the patch call failing in
do_make_icudata_class-target is more confusing than usual do_patch failure.

Was there any reason to apply this fix only for target builds? I haven't
found any.

Cheers,

--000000000000e8224905bb7cd098
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 16, 2021 at 3:33 PM Khem =
Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; index =
08254648e4..6ba88595df 100644<br>
&gt; --- a/meta/recipes-support/icu/<a href=3D"http://icu_66.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">icu_66.1.bb</a><br>
&gt; +++ b/meta/recipes-support/icu/<a href=3D"http://icu_66.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">icu_66.1.bb</a><br>
&gt; @@ -21,10 +21,11 @@ BASE_SRC_URI =3D &quot;<a href=3D"https://github.c=
om/unicode-org/icu/releases/download/release-$%7BI" rel=3D"noreferrer" targ=
et=3D"_blank">https://github.com/unicode-org/icu/releases/download/release-=
${I</a><br>
&gt;=C2=A0 DATA_SRC_URI =3D &quot;<a href=3D"https://github.com/unicode-org=
/icu/releases/download/release-$%7BICU_FOLDER%7D/icu4c-$%7BICU_PV%7D-data.z=
ip" rel=3D"noreferrer" target=3D"_blank">https://github.com/unicode-org/icu=
/releases/download/release-${ICU_FOLDER}/icu4c-${ICU_PV}-data.zip</a>&quot;=
<br>
&gt;=C2=A0 SRC_URI =3D &quot;${BASE_SRC_URI};name=3Dcode \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${DATA_SRC_URI};name=3D=
data \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-big-endian-b=
uild.patch;patchdir=3D${WORKDIR} \<br></blockquote><div>=C2=A0&gt; +=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-ICU-21175-Add-cnvalias-as-a-d=
ependency-of-misc_res.patch;patchdir=3D${WORKDIR} \=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
<br>
why this change ?<br></blockquote><div><br></div><div>Because both these pa=
tches need to be applied on ${WORKDIR}/data directory and doing it here pro=
vides slightly better error message when the patch doesn&#39;t apply (e.g. =
in this case ${WORKDIR}/data is using dos line endings, but I was preparing=
 the patch in git repo where it&#39;s using unix line endings as expected) =
and the patch call failing in do_make_icudata_class-target is more confusin=
g than usual do_patch failure.</div><div><br></div><div>Was there any reaso=
n to apply this fix only for target builds? I haven&#39;t found any.</div><=
div><br></div><div>Cheers,</div></div></div>

--000000000000e8224905bb7cd098--
