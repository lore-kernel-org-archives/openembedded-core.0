Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web08.2120.1613527727992694256
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 18:08:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hfBl6ASz;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id lu16so4895054ejb.9
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 18:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ThkKPyUC6GUlz1VGurYFAGW87LRnuYlr+pA4yBsO3TI=;
        b=hfBl6ASz/s4q8Qctjo8l9C+hLIXMwzqke28w7YjolSGbVaFxekNHFq3QMVV6g5qQNk
         cZbPhy2upqStY7NIR1hXl3MZoJZBXQ53vbVoEcnH5VcD6sGZQBfQkEbO5YWns990yCMB
         /pEJgcAOmLBOmikeRN/7dsQ+rGB1QFRAVuSR1kte5Bs78/JI5UCQ4EedqfqYGPakATPs
         rdarbBikBz6e3IfqHjrAEqZeB7Ml7FbF1+PlpyvQAA99RBVDG1G5fiA7aqxK6yoIcCzx
         +0wr+mBz+tv5I4VrPAUrgrdgV/8zgiLVANc3fOX+l6oEjeNpvRaBadmreVxwS+n/7amA
         L23A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ThkKPyUC6GUlz1VGurYFAGW87LRnuYlr+pA4yBsO3TI=;
        b=eZBu7mJ91Paxj63CeyiMh6BVofyv3DPWzif5AHbpVAbLpA3Vrptu11yPL3lXScIC7u
         ++O9Ip9Bt50UOKMKspdyIzzAOcC79bpvwSL7AV9uw5IbZfmc9hrkXnyojvciOmJn+MMr
         KYg9LvCv7nnZxfAKxOt1UUo0nz75gL4NzE+zdPgvUxusTcUmESJdUC3EqyF2u4qNEDK/
         WXqKZxW3ATgsjjzsU7gSCk76Wo8toF5JWs4uDt3t4M29HcSnewZlafV84yXnfLI1WYMO
         k+IRaNx7YYId0WVABBbsjpF+oXGnOHLo9n3888nSrJz0RZpO8Lc2qXqECa11vSCm7gKn
         0jWQ==
X-Gm-Message-State: AOAM532JlCYaGgYAn6mVLU2oBvs+tcx6COF3fRtena+kzoTb9POxF4Ip
	hb7o7KBJ43fUmcwA0Mj+fFx75Ku6VU6RGLtOnDQ=
X-Google-Smtp-Source: ABdhPJx6DodXtALwnPe8RIsbY78YDV5BRV+yISEyc5DWmDOeMidxcvg7aq5/tFtbdOvDJPShkY4Om6lSBLVdlTDIW+I=
X-Received: by 2002:a17:907:2622:: with SMTP id aq2mr16431771ejc.470.1613527726466;
 Tue, 16 Feb 2021 18:08:46 -0800 (PST)
MIME-Version: 1.0
References: <20210216230130.1516657-1-Martin.Jansa@gmail.com>
 <CAMKF1sqh0WEed86n+JGM3WHVxAM31xUZ6mR744CQpUE4Sa1ziQ@mail.gmail.com>
 <CA+chaQdoYMbPazDp8onpqJMNj9SBL7pT_5XLYE1Dv1XmJ5ZMZw@mail.gmail.com> <CAMKF1spBtFXUzDaDSnQiOYw9xYPrn_-MiOrEOnmpven940MbNQ@mail.gmail.com>
In-Reply-To: <CAMKF1spBtFXUzDaDSnQiOYw9xYPrn_-MiOrEOnmpven940MbNQ@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Tue, 16 Feb 2021 18:08:35 -0800
Message-ID: <CA+chaQcKgbUi8jXH24xMT4j2SqRctYu8PiXr3WL5tpAgeWDg+Q@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] icu: backport fix for rare random genrb segmentation fault
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f8a94c05bb7eb2b0"

--000000000000f8a94c05bb7eb2b0
Content-Type: text/plain; charset="UTF-8"

> Generally it was done so it applied on latest data which may be
regenerated during build

Maybe I'm missing something, but
https://git.openembedded.org/openembedded-core/commit/?id=5e5be67744d7ddf5a9ac433ecba02f697a84a325
adds make_icudata task after do_patch and it was creating a copy from
${WORKDIR}/data and then patching it, if it's already patched by do_patch
task, then the patched data directory is being used even if the
make_icudata gets re-executed during build.

So this IMHO shouldn't have any impact on behavior, except applying the
patch in do_patch instead of delaying (and possibly re-applying it when
re-executed) inside make_icudata task.

On Tue, Feb 16, 2021 at 4:11 PM Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On Tue, Feb 16, 2021 at 3:53 PM Martin Jansa <martin.jansa@gmail.com>
> wrote:
>
>>
>>
>> On Tue, Feb 16, 2021 at 3:33 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>>> > index 08254648e4..6ba88595df 100644
>>> > --- a/meta/recipes-support/icu/icu_66.1.bb
>>> > +++ b/meta/recipes-support/icu/icu_66.1.bb
>>> > @@ -21,10 +21,11 @@ BASE_SRC_URI = "
>>> https://github.com/unicode-org/icu/releases/download/release-${I
>>> >  DATA_SRC_URI = "
>>> https://github.com/unicode-org/icu/releases/download/release-${ICU_FOLDER}/icu4c-${ICU_PV}-data.zip
>>> "
>>> >  SRC_URI = "${BASE_SRC_URI};name=code \
>>> >             ${DATA_SRC_URI};name=data \
>>> > +           file://0001-Fix-big-endian-build.patch;patchdir=${WORKDIR}
>>> \
>>>
>>  > +
>>  file://0002-ICU-21175-Add-cnvalias-as-a-dependency-of-misc_res.patch;patchdir=${WORKDIR}
>> \
>>
>>>
>>> why this change ?
>>>
>>
>> Because both these patches need to be applied on ${WORKDIR}/data
>> directory and doing it here provides slightly better error message when the
>> patch doesn't apply (e.g. in this case ${WORKDIR}/data is using dos line
>> endings, but I was preparing the patch in git repo where it's using unix
>> line endings as expected) and the patch call failing in
>> do_make_icudata_class-target is more confusing than usual do_patch failure.
>>
>> Was there any reason to apply this fix only for target builds? I haven't
>> found any.
>>
>
> Generally it was done so it applied on latest data which may be
> regenerated during build
>
>>
>> Cheers,
>>
>

--000000000000f8a94c05bb7eb2b0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>&gt; Generally it was done so it applied on latest da=
ta which may be regenerated during build=C2=A0</div><div><br></div><div>May=
be I&#39;m missing something, but</div><a href=3D"https://git.openembedded.=
org/openembedded-core/commit/?id=3D5e5be67744d7ddf5a9ac433ecba02f697a84a325=
">https://git.openembedded.org/openembedded-core/commit/?id=3D5e5be67744d7d=
df5a9ac433ecba02f697a84a325</a><br><div>adds=C2=A0make_icudata task after d=
o_patch and it was creating a copy from ${WORKDIR}/data and then patching i=
t, if it&#39;s already patched by do_patch task, then the patched data dire=
ctory is being used even if the make_icudata gets re-executed during build.=
</div><div><br></div><div>So this IMHO shouldn&#39;t have any impact on beh=
avior, except applying the patch in do_patch instead of delaying (and possi=
bly re-applying it when re-executed) inside make_icudata task.</div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue,=
 Feb 16, 2021 at 4:11 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com"=
>raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div><br></div><div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 16, 2021 at 3:53 PM Martin Jan=
sa &lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.j=
ansa@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 16, 2021 at=
 3:33 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blan=
k">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">&gt; index 08254648e4..6ba88595df 100644<br>
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
ng build=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div =
dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"auto"></div><div><br></d=
iv><div>Cheers,</div></div></div>
</blockquote></div></div>
</blockquote></div>

--000000000000f8a94c05bb7eb2b0--
