Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web11.13776.1605643019320395980
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 11:56:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BKVACpFv;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id f20so31168657ejz.4
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 11:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4/WlmSfYRUG4U+JyFXWOz8lxN4+3v16E3Yhz6MoIDpg=;
        b=BKVACpFvdReBX+ZguorXHcDkTqUuKVrr2RyGWENVLsDpodvLowe5UUZwTEADnDts20
         Qx8qL9Z6kBnvXwdrsmpfz8r9KgbvIc3iw5my5B0QODAxvZCbPwLWKw2kjXmgoOO8/Zyp
         dv8euqc7HXyumVWPetodd4bzjAsa3bILbBG3kGgVEEA7vQbbyJbqA0hx62uphNg6lqlE
         zjWRlajOy0jHJbRKag16Yn30e3RO98GhPGoMbasDXHcQ6nv37gpjn7+9/fs/gVOs0lWE
         5SvRpAmPCx4NpuXnXBFsL6dRjQm+e4Ijyf1EyXGhJE3L3+KBM5cDuYE2kAddz+YGFCvu
         6//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4/WlmSfYRUG4U+JyFXWOz8lxN4+3v16E3Yhz6MoIDpg=;
        b=RtFS1RbrPovz5F96U9p3FU28ta/EQzrvTn7y8vGBTqEnLOrDSN1XLs1q1v+YUGqaXa
         dK88gdDmZ/RCHvj1TuYeyQcrnp4MYY7ykWdI2ORM/aYb+I4CbcOjxZdZSHuntHv5d9LH
         VMtFx7fSPJ/rt6WRlpEwwr9M9XL7wsfWimo+bYtaLteKY562R1bNqDPuUlHGlPkj4ohZ
         wq2xgcs4AUiC4vT3ahZXs9j/cE8N5RET+oHKJMSntXrgohdq5HRheQCMLE5DVtsAxDYu
         vEETm6nWgp6LQ6gXw4X+OxjKPu3PIC8KNdJ1wMDqufEVT0cIvOK3lQXq961DCywNGiHI
         MLfQ==
X-Gm-Message-State: AOAM531t1CKcjTQJzyvt5LCMl4tV/jXUQPx/TkcXuuvLPDv3Tzx4I0F9
	ar4D6aSLQzeOUe6LqDu1mBqdmmRoyCjIZRox2jU=
X-Google-Smtp-Source: ABdhPJzoZjjCK9Vz+wlpL8OBZdX15XIePVsB3VVqznooKfygTCOUtCqzjD5umaZhovaDUw6KUH3F6lpMGGooZ8oWyCM=
X-Received: by 2002:a17:906:3c53:: with SMTP id i19mr3223624ejg.392.1605643017840;
 Tue, 17 Nov 2020 11:56:57 -0800 (PST)
MIME-Version: 1.0
References: <20201117180441.296304-1-raj.khem@gmail.com> <CANPvuRkvCVF8nV5Gpo0LYkGs4d8So4Pvukp-YpDxK1=1vS116Q@mail.gmail.com>
In-Reply-To: <CANPvuRkvCVF8nV5Gpo0LYkGs4d8So4Pvukp-YpDxK1=1vS116Q@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Tue, 17 Nov 2020 20:56:47 +0100
Message-ID: <CA+chaQdPKhwuw197c=cHesYPmS5weQc6jc6SQi-1iisEGdHSeg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] python3targetconfig.bbclass: Make py3 dep and tasks only for target recipes
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, OE-core <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000b6eb3f05b452e5a9"

--000000000000b6eb3f05b452e5a9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I don't mind this change, but why do you think space in the variable is
better in this case (where we don't mind extra space being added for
native/nativesdk case?)

If someone sets EXTRA_PYTHON_DEPENDS =3D "foo" for whatever reason in some
recipe, then the space will be missing.

On Tue, Nov 17, 2020 at 7:36 PM Jose Quaresma <quaresma.jose@gmail.com>
wrote:

> Khem Raj <raj.khem@gmail.com> escreveu no dia ter=C3=A7a, 17/11/2020 =C3=
=
=A0(s)
> 18:04:
> >
> > python3targetconfig append target python3 to dependencies
> > unconditionally, and here its inherited unconditionally too but
> > distutils3-base is inherited in BBCLASSEXTEND'ed recipes and other
> not-target
> > recipes as well. Hence the change added via
> 9c8f666097802cb594a759989edcf01603a22df3
> > is now bridging the native dependencies with target python3 and thats
> > resulting all sorts of rebuilds for multimachine builds e.g.
> >
> > MACHINE=3Dqemuarm bitbake python3-scons-native
> > MACHINE=3Dqemumips bitbake python3-scons-native
> >
> > results in rebuilds for python3-scons-native
> >
> > bitbake-diffsigs shows
> >
> > Hash for dependent task python/python3-scons-native_3.1.2.bb:do_popula=
te_sysroot
> changed from
> 1cdb93193b416477df6faa137e83a967b433c7aa29033146b405153f73f36933 to
> 3cea1e7cbedd121ecb768fbc291cc4e4d7d3b5c0442897
> > 0e3b97bd058d162065
> >     Hash for dependent task python/python3-scons-native_3.1.2.bb:do_in=
stall
> changed from
> 8d6018fd03ffc6060a04532dc39a5b7ccca1be026a69d069cb4fb11aef86dd89 to
> c5f1d173596a8e910f45a2b6e0b4dab96cd0102be4d62bd3156
> > 229cb0f5ebb11
> >         Hash for dependent task python/python3-scons-native_3.1.2.bb:d=
o_compile
> changed from
> e3ee4b52a15267e6ae7853ec19a666b2fb62608a597608793336382d1c45f8a0 to
> 1e582043dfe6b3e00aaa532f363ce6afb37652abe837dac
> > 7cc9769194c43eae1
> >             Hash for dependent task python/python3-scons-native_3.1.2.=
bb:do_configure
> changed from
> 770a4d5a77a96ebd9e1e7368f710bca3f88e3b1266dffa3b2d0360b1e3a81e27 to
> a366982778b03eee5165c3117ee778f848acdfaa2
> > b346650fbdf114ac70ab57b
> >                 Hash for dependent task
> python/python3-scons-native_3.1.2.bb:do_prepare_recipe_sysroot changed
> from 958910037856ff5d5eb2b5162b3cdd02a3a710fc543b933cfeba771ee095cb72 to
> 474333fb565f908992fd3716
> > 4935aaecf31a79e867826fe634cde4f44171d8e7
> >                     Hash for dependent task python/python3_3.9.0.bb:do=
_populate_sysroot
> changed from
> 7ac1c4fcbb2eacf98d2c32d991751bd2f3c7d55e2e32f2c9e485e7f5975fecf8 to
> 25dcfe74a95af19cce8df7c29311cc5edbbf6ad
> > 08777e46a6fa6e417c0445018
> >
> > ...
> >
> > Therefore limit effects of this class only for target recipes.
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Alexander Kanavin <alex.kanavin@gmail.com>
> > Cc: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> > v2: Mark depends conditional instead
> > v3: Export _PYTHON_SYSCONFIGDATA_NAME only for target
> >     and mark tasks with target override
> >
> >  meta/classes/python3targetconfig.bbclass | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta/classes/python3targetconfig.bbclass
> b/meta/classes/python3targetconfig.bbclass
> > index 640d0c97b6..fc1025c207 100644
> > --- a/meta/classes/python3targetconfig.bbclass
> > +++ b/meta/classes/python3targetconfig.bbclass
> > @@ -1,15 +1,17 @@
> >  inherit python3native
> >
> > -DEPENDS_append =3D " python3"
> > +EXTRA_PYTHON_DEPENDS ?=3D ""
> > +EXTRA_PYTHON_DEPENDS_class-target =3D "python3"
> > +DEPENDS_append =3D " ${EXTRA_PYTHON_DEPENDS}"
>
> -EXTRA_PYTHON_DEPENDS_class-target =3D "python3"
> -DEPENDS_append =3D " ${EXTRA_PYTHON_DEPENDS}"
> +EXTRA_PYTHON_DEPENDS_class-target =3D " python3"
> +DEPENDS_append =3D "${EXTRA_PYTHON_DEPENDS}"
>
> add a space before python3 is better than always add it to DEPENDS
>
> >
> > -do_configure_prepend() {
> > +do_configure_prepend_class-target() {
> >          export _PYTHON_SYSCONFIGDATA_NAME=3D"_sysconfigdata"
> >  }
> >
> > -do_compile_prepend() {
> > +do_compile_prepend_class-target() {
> >          export _PYTHON_SYSCONFIGDATA_NAME=3D"_sysconfigdata"
> >  }
> >
> > -do_install_prepend() {
> > +do_install_prepend_class-target() {
> >          export _PYTHON_SYSCONFIGDATA_NAME=3D"_sysconfigdata"
> >  }
> > --
> > 2.29.2
> >
> >=20
> >
>
>
> --
> best regards,
> Jos=C3=A9 Quaresma
>

--000000000000b6eb3f05b452e5a9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I don&#39;t mind this change, but why do you think space i=
n the variable is better in this case (where we don&#39;t mind extra space =
being added for native/nativesdk case?)<div><br></div><div>If someone sets=
=C2=A0<span style=3D"color:rgb(80,0,80)">EXTRA_PYTHON_DEPENDS =3D &quot;fo=
o&quot; for whatever reason in some recipe, then the space will be missing.=
</span></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Tue, Nov 17, 2020 at 7:36 PM Jose Quaresma &lt;<a href=3D"m=
ailto:quaresma.jose@gmail.com">quaresma.jose@gmail.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">Khem Raj &lt;<a href=
=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt=
; escreveu no dia ter=C3=A7a, 17/11/2020 =C3=A0(s) 18:04:<br>
&gt;<br>
&gt; python3targetconfig append target python3 to dependencies<br>
&gt; unconditionally, and here its inherited unconditionally too but<br>
&gt; distutils3-base is inherited in BBCLASSEXTEND&#39;ed recipes and othe=
r not-target<br>
&gt; recipes as well. Hence the change added via 9c8f666097802cb594a759989=
edcf01603a22df3<br>
&gt; is now bridging the native dependencies with target python3 and thats=
<br>
&gt; resulting all sorts of rebuilds for multimachine builds e.g.<br>
&gt;<br>
&gt; MACHINE=3Dqemuarm bitbake python3-scons-native<br>
&gt; MACHINE=3Dqemumips bitbake python3-scons-native<br>
&gt;<br>
&gt; results in rebuilds for python3-scons-native<br>
&gt;<br>
&gt; bitbake-diffsigs shows<br>
&gt;<br>
&gt; Hash for dependent task python/python3-scons-native_3.1.2.bb:do_popul=
ate_sysroot changed from 1cdb93193b416477df6faa137e83a967b433c7aa29033146b4=
05153f73f36933 to 3cea1e7cbedd121ecb768fbc291cc4e4d7d3b5c0442897<br>
&gt; 0e3b97bd058d162065<br>
&gt;=C2=A0 =C2=A0 =C2=A0Hash for dependent task python/python3-scons-nativ=
e_3.1.2.bb:do_install changed from 8d6018fd03ffc6060a04532dc39a5b7ccca1be02=
6a69d069cb4fb11aef86dd89 to c5f1d173596a8e910f45a2b6e0b4dab96cd0102be4d62bd=
3156<br>
&gt; 229cb0f5ebb11<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Hash for dependent task python/pytho=
n3-scons-native_3.1.2.bb:do_compile changed from e3ee4b52a15267e6ae7853ec19=
a666b2fb62608a597608793336382d1c45f8a0 to 1e582043dfe6b3e00aaa532f363ce6afb=
37652abe837dac<br>
&gt; 7cc9769194c43eae1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Hash for dependent tas=
k python/python3-scons-native_3.1.2.bb:do_configure changed from 770a4d5a77=
a96ebd9e1e7368f710bca3f88e3b1266dffa3b2d0360b1e3a81e27 to a366982778b03eee5=
165c3117ee778f848acdfaa2<br>
&gt; b346650fbdf114ac70ab57b<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Hash for=
 dependent task python/python3-scons-native_3.1.2.bb:do_prepare_recipe_sysr=
oot changed from 958910037856ff5d5eb2b5162b3cdd02a3a710fc543b933cfeba771ee0=
95cb72 to 474333fb565f908992fd3716<br>
&gt; 4935aaecf31a79e867826fe634cde4f44171d8e7<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0Hash for dependent task python/python3_3.9.0.bb:do_populate_sysroot =
changed from 7ac1c4fcbb2eacf98d2c32d991751bd2f3c7d55e2e32f2c9e485e7f5975fec=
f8 to 25dcfe74a95af19cce8df7c29311cc5edbbf6ad<br>
&gt; 08777e46a6fa6e417c0445018<br>
&gt;<br>
&gt; ...<br>
&gt;<br>
&gt; Therefore limit effects of this class only for target recipes.<br>
&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; Cc: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" t=
arget=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; Cc: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" target=
=
=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; v2: Mark depends conditional instead<br>
&gt; v3: Export _PYTHON_SYSCONFIGDATA_NAME only for target<br>
&gt;=C2=A0 =C2=A0 =C2=A0and mark tasks with target override<br>
&gt;<br>
&gt;=C2=A0 meta/classes/python3targetconfig.bbclass | 10 ++++++----<br>
&gt;=C2=A0 1 file changed, 6 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/classes/python3targetconfig.bbclass b/meta/classes/=
python3targetconfig.bbclass<br>
&gt; index 640d0c97b6..fc1025c207 100644<br>
&gt; --- a/meta/classes/python3targetconfig.bbclass<br>
&gt; +++ b/meta/classes/python3targetconfig.bbclass<br>
&gt; @@ -1,15 +1,17 @@<br>
&gt;=C2=A0 inherit python3native<br>
&gt;<br>
&gt; -DEPENDS_append =3D &quot; python3&quot;<br>
&gt; +EXTRA_PYTHON_DEPENDS ?=3D &quot;&quot;<br>
&gt; +EXTRA_PYTHON_DEPENDS_class-target =3D &quot;python3&quot;<br>
&gt; +DEPENDS_append =3D &quot; ${EXTRA_PYTHON_DEPENDS}&quot;<br>
<br>
-EXTRA_PYTHON_DEPENDS_class-target =3D &quot;python3&quot;<br>
-DEPENDS_append =3D &quot; ${EXTRA_PYTHON_DEPENDS}&quot;<br>
+EXTRA_PYTHON_DEPENDS_class-target =3D &quot; python3&quot;<br>
+DEPENDS_append =3D &quot;${EXTRA_PYTHON_DEPENDS}&quot;<br>
<br>
add a space before python3 is better than always add it to DEPENDS<br>
<br>
&gt;<br>
&gt; -do_configure_prepend() {<br>
&gt; +do_configure_prepend_class-target() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 export _PYTHON_SYSCONFIGDATA_NAME=
=3D&quot;_sysconfigdata&quot;<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -do_compile_prepend() {<br>
&gt; +do_compile_prepend_class-target() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 export _PYTHON_SYSCONFIGDATA_NAME=
=3D&quot;_sysconfigdata&quot;<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -do_install_prepend() {<br>
&gt; +do_install_prepend_class-target() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 export _PYTHON_SYSCONFIGDATA_NAME=
=3D&quot;_sysconfigdata&quot;<br>
&gt;=C2=A0 }<br>
&gt; --<br>
&gt; 2.29.2<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
<br>
-- <br>
best regards,<br>
Jos=C3=A9 Quaresma<br>
</blockquote></div>

--000000000000b6eb3f05b452e5a9--
