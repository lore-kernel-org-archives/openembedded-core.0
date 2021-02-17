Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web11.731.1613520693879760028
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 16:11:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eykcoEHS;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id t18so5523438qvn.8
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 16:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=duG+efhJIBTx5XriSmmwrmy9C0JbTux2jikzjgzflpc=;
        b=eykcoEHSVsM9k2Y08cCOOZY17GeugVpVvbf4iOz1bccrBMPmk5IklbcdYKAls/eINT
         yYsVedhVrCkb6+ps4v2amiRyIEGTKhfjqFqpkoE8x+YY+GnZDpV2zcaS/h/jVG/ThiXH
         747xeGSe59HHOJbFIDqrPILo0O8cJW/LGTebJyGpvoQOYZhueDIowewSt3RGj+a298dw
         StROhgKjUqbNkAHYLl1MJR7voO8DAnf1xHF22ZSSqwpvV61wldOXf8AITFXj/hF0vAfd
         LxShBmIKzmTAdN7oNcJ7dlggLcAFnOY1V9u6wngiStehXDEYuPZsHPOGt/YASrXwud2w
         rjCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=duG+efhJIBTx5XriSmmwrmy9C0JbTux2jikzjgzflpc=;
        b=YJC8rYvtF7zNQW1WYO5BJ+2TcnXwmEEycbNl3W11dG7ZkZ9nZY+iThHHxLhUmvcy+G
         63Dz+xAUZ+jW1LPdHJ2j97FQZTbTsxbn0nVFYAx5XImJ6tBLEwCgaQbdduLGDgkQoAWU
         ZIdbDdMedwSthX5AL/Wk/4mNENY8oyVF1YujIuS0o6hDTilp8HMp89grnHaF7LytnTz/
         b9UsFZndrLqPSe3vv4ac9K70t38yzZvB7M6PMiI+fnBQdPxf/SleRMUai7vWRuTxHNIz
         55gdCUmf9oSbinLXE/Vuu7GZVG4GlihLxHC4rjsWrUTc6eIltkl7efqRaZqt//ghUvQq
         CQmw==
X-Gm-Message-State: AOAM532ZMWJqySJvRi1pvxhbFjBZsETqt812z2sKspvsxJgt6RGHUtmN
	RRFd5MAeAdtL3DHcOkMqdEVtGsYfz4TeyoHplK4=
X-Google-Smtp-Source: ABdhPJx7IJRDKaA58ZttMCO9ksOcgsvLz+WwglPDP1pJgGkp85WKSzSDJLawvRn2Ity+B3KZwN0vLzUxCdcP6TdqAkk=
X-Received: by 2002:a0c:fa90:: with SMTP id o16mr22089711qvn.55.1613520693002;
 Tue, 16 Feb 2021 16:11:33 -0800 (PST)
MIME-Version: 1.0
References: <20210216230130.1516657-1-Martin.Jansa@gmail.com>
 <CAMKF1sqh0WEed86n+JGM3WHVxAM31xUZ6mR744CQpUE4Sa1ziQ@mail.gmail.com> <CA+chaQdoYMbPazDp8onpqJMNj9SBL7pT_5XLYE1Dv1XmJ5ZMZw@mail.gmail.com>
In-Reply-To: <CA+chaQdoYMbPazDp8onpqJMNj9SBL7pT_5XLYE1Dv1XmJ5ZMZw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 16 Feb 2021 16:11:21 -0800
Message-ID: <CAMKF1spBtFXUzDaDSnQiOYw9xYPrn_-MiOrEOnmpven940MbNQ@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] icu: backport fix for rare random genrb segmentation fault
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000be861305bb7d0f24"

--000000000000be861305bb7d0f24
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 16, 2021 at 3:53 PM Martin Jansa <martin.jansa@gmail.com> wrote:

>
>
> On Tue, Feb 16, 2021 at 3:33 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>> > index 08254648e4..6ba88595df 100644
>> > --- a/meta/recipes-support/icu/icu_66.1.bb
>> > +++ b/meta/recipes-support/icu/icu_66.1.bb
>> > @@ -21,10 +21,11 @@ BASE_SRC_URI = "
>> https://github.com/unicode-org/icu/releases/download/release-${I
>> >  DATA_SRC_URI = "
>> https://github.com/unicode-org/icu/releases/download/release-${ICU_FOLDER}/icu4c-${ICU_PV}-data.zip
>> "
>> >  SRC_URI = "${BASE_SRC_URI};name=code \
>> >             ${DATA_SRC_URI};name=data \
>> > +           file://0001-Fix-big-endian-build.patch;patchdir=${WORKDIR} \
>>
>  > +
>  file://0002-ICU-21175-Add-cnvalias-as-a-dependency-of-misc_res.patch;patchdir=${WORKDIR}
> \
>
>>
>> why this change ?
>>
>
> Because both these patches need to be applied on ${WORKDIR}/data directory
> and doing it here provides slightly better error message when the patch
> doesn't apply (e.g. in this case ${WORKDIR}/data is using dos line endings,
> but I was preparing the patch in git repo where it's using unix line
> endings as expected) and the patch call failing in
> do_make_icudata_class-target is more confusing than usual do_patch failure.
>
> Was there any reason to apply this fix only for target builds? I haven't
> found any.
>

Generally it was done so it applied on latest data which may be regenerated
during build

>
> Cheers,
>

--000000000000be861305bb7d0f24
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Feb 16, 2021 at 3:53 PM Martin Jansa &lt;<a href=3D=
"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Tue, Feb 16, 2021 at 3:33 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail=
.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">&gt; index 08254648e4..6ba88595df=
 100644<br>
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
/div></div></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Gener=
ally it was done so it applied on latest data which may be regenerated duri=
ng build=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div cl=
ass=3D"gmail_quote"><div dir=3D"auto"></div><div><br></div><div>Cheers,</di=
v></div></div>
</blockquote></div></div>

--000000000000be861305bb7d0f24--
