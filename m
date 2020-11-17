Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web12.13975.1605644306103858032
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 12:18:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HiUcdL45;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id l5so23814805edq.11
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 12:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=a51gWsOiE2roPuTAhi1gwC26WWysddZf9GTT+OzWdYY=;
        b=HiUcdL45PJkJexH6AeNbmJLUB7qSsEiLwD2hVmsJAXaALnlVI3PDTZuplxXy3rIyk0
         RJGupewMlb2ICwYnjWKq72291/qfYsRooNk8Mx6VVV21HM1GO+6iKz3OCUSpYvlIIPkg
         EF1Am5WuIYIaJGvdxbvSzhaDizJcAHuo4ICBBdJqTbiDqL/kFRd/DqZjp+Wr2Sg2d/h+
         qtmVs9v0iFdaqYDwa1FMG2Cy+xvURTH3IE7vRKZuD5mbbdY+TqAn6QU65FnfuxwkSED2
         rzgYibx77uV5hQ3SGW5gPzqlFLK92a0j315w61En181Xd6D4Q0H+1N88/1T8IMJiCo3+
         NwxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=a51gWsOiE2roPuTAhi1gwC26WWysddZf9GTT+OzWdYY=;
        b=TsW45V+peisgAmjwAgu8knGx/j4NnmRvraSYxhPYLTTUZPbFKKa2ABfcuyDa8ZSSLH
         p1LwVzfaOmFMackEwW+c8jWenxH1AMEmFLu6sr2LTA1NFgvqnaXuh0jychvJ1IqQU5kM
         2yo//srCU7Hh//uLdBK+O4xZOae3BRGrN1VvdywFBjdQlarVuI0uIn/wId/FIXv9WinW
         jJWtu5g1vQUoE8rPsxPlXCvptpmqSd9G4u48gLyusc0jSnnCbaLNfUuDoBMwl42BmQMZ
         CUVrncuhycNPAjo2mMVTjaXDZZ21c4Q6iJPNsKjEHZejKGLtpbQmL2LxJY68Dk7x1jba
         N/UA==
X-Gm-Message-State: AOAM532KOD9SmGBDrYzUeUVv5e+xUabKE1flxopM4aJKhNEW12YjBQLW
	j/4giXQUvfTdE47hoKXxO3OlUqmQDIUB+aJO8DE=
X-Google-Smtp-Source: ABdhPJyo1ejUOD235jGf9LmZXobMBEm2wFY9pgqCGISQgsPMKd0PYvoX2UyBLBjDyLz1OXXdc/jPquUTx0oqPH/8CZE=
X-Received: by 2002:a05:6402:17ac:: with SMTP id j12mr22317555edy.31.1605644304413;
 Tue, 17 Nov 2020 12:18:24 -0800 (PST)
MIME-Version: 1.0
References: <20201117180441.296304-1-raj.khem@gmail.com> <CANPvuRkvCVF8nV5Gpo0LYkGs4d8So4Pvukp-YpDxK1=1vS116Q@mail.gmail.com>
 <CA+chaQdPKhwuw197c=cHesYPmS5weQc6jc6SQi-1iisEGdHSeg@mail.gmail.com>
In-Reply-To: <CA+chaQdPKhwuw197c=cHesYPmS5weQc6jc6SQi-1iisEGdHSeg@mail.gmail.com>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Tue, 17 Nov 2020 20:18:12 +0000
Message-ID: <CANPvuRnK2v4SwZ722=Phhp_C6PGphB7ygMYOzMaCDbbXcSzUsw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] python3targetconfig.bbclass: Make py3 dep and tasks only for target recipes
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, OE-core <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Martin,

you're right. if EXTRA_PYTHON_DEPENDS is set outside of the bbclass it
break the DEPENDS.

Sorry Khem for my suggestion, your initial was right.

+EXTRA_PYTHON_DEPENDS_class-target =3D "python3"
+DEPENDS_append =3D " ${EXTRA_PYTHON_DEPENDS}"

But in this case (when EXTRA_PYTHON_DEPENDS is set outside of the bbclass)
it will don't have any effect for the overwrite class-target because
EXTRA_PYTHON_DEPENDS_class-target=3D"python3" always will set
EXTRA_PYTHON_DEPENDS=3D"python3"

I think I have see another problem now and something like this is better:

+EXTRA_PYTHON_DEPENDS_append_class-target =3D "python3"
+DEPENDS_append =3D " ${EXTRA_PYTHON_DEPENDS}"

Martin Jansa <martin.jansa@gmail.com> escreveu no dia ter=C3=A7a,
17/11/2020 =C3=A0(s) 19:56:
>
> I don't mind this change, but why do you think space in the variable is =
better in this case (where we don't mind extra space being added for native=
/nativesdk case?)
>
> If someone sets EXTRA_PYTHON_DEPENDS =3D "foo" for whatever reason in so=
me recipe, then the space will be missing.
>
> On Tue, Nov 17, 2020 at 7:36 PM Jose Quaresma <quaresma.jose@gmail.com> =
wrote:
>>
>> Khem Raj <raj.khem@gmail.com> escreveu no dia ter=C3=A7a, 17/11/2020 =
=C3=A0(s) 18:04:
>> >
>> > python3targetconfig append target python3 to dependencies
>> > unconditionally, and here its inherited unconditionally too but
>> > distutils3-base is inherited in BBCLASSEXTEND'ed recipes and other no=
t-target
>> > recipes as well. Hence the change added via 9c8f666097802cb594a759989=
edcf01603a22df3
>> > is now bridging the native dependencies with target python3 and thats
>> > resulting all sorts of rebuilds for multimachine builds e.g.
>> >
>> > MACHINE=3Dqemuarm bitbake python3-scons-native
>> > MACHINE=3Dqemumips bitbake python3-scons-native
>> >
>> > results in rebuilds for python3-scons-native
>> >
>> > bitbake-diffsigs shows
>> >
>> > Hash for dependent task python/python3-scons-native_3.1.2.bb:do_popul=
ate_sysroot changed from 1cdb93193b416477df6faa137e83a967b433c7aa29033146b4=
05153f73f36933 to 3cea1e7cbedd121ecb768fbc291cc4e4d7d3b5c0442897
>> > 0e3b97bd058d162065
>> >     Hash for dependent task python/python3-scons-native_3.1.2.bb:do_i=
nstall changed from 8d6018fd03ffc6060a04532dc39a5b7ccca1be026a69d069cb4fb11=
aef86dd89 to c5f1d173596a8e910f45a2b6e0b4dab96cd0102be4d62bd3156
>> > 229cb0f5ebb11
>> >         Hash for dependent task python/python3-scons-native_3.1.2.bb:=
do_compile changed from e3ee4b52a15267e6ae7853ec19a666b2fb62608a59760879333=
6382d1c45f8a0 to 1e582043dfe6b3e00aaa532f363ce6afb37652abe837dac
>> > 7cc9769194c43eae1
>> >             Hash for dependent task python/python3-scons-native_3.1.2=
.bb:do_configure changed from 770a4d5a77a96ebd9e1e7368f710bca3f88e3b1266dff=
a3b2d0360b1e3a81e27 to a366982778b03eee5165c3117ee778f848acdfaa2
>> > b346650fbdf114ac70ab57b
>> >                 Hash for dependent task python/python3-scons-native_3=
.1.2.bb:do_prepare_recipe_sysroot changed from 958910037856ff5d5eb2b5162b3c=
dd02a3a710fc543b933cfeba771ee095cb72 to 474333fb565f908992fd3716
>> > 4935aaecf31a79e867826fe634cde4f44171d8e7
>> >                     Hash for dependent task python/python3_3.9.0.bb:d=
o_populate_sysroot changed from 7ac1c4fcbb2eacf98d2c32d991751bd2f3c7d55e2e3=
2f2c9e485e7f5975fecf8 to 25dcfe74a95af19cce8df7c29311cc5edbbf6ad
>> > 08777e46a6fa6e417c0445018
>> >
>> > ...
>> >
>> > Therefore limit effects of this class only for target recipes.
>> >
>> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > Cc: Alexander Kanavin <alex.kanavin@gmail.com>
>> > Cc: Martin Jansa <Martin.Jansa@gmail.com>
>> > ---
>> > v2: Mark depends conditional instead
>> > v3: Export _PYTHON_SYSCONFIGDATA_NAME only for target
>> >     and mark tasks with target override
>> >
>> >  meta/classes/python3targetconfig.bbclass | 10 ++++++----
>> >  1 file changed, 6 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/meta/classes/python3targetconfig.bbclass b/meta/classes/=
python3targetconfig.bbclass
>> > index 640d0c97b6..fc1025c207 100644
>> > --- a/meta/classes/python3targetconfig.bbclass
>> > +++ b/meta/classes/python3targetconfig.bbclass
>> > @@ -1,15 +1,17 @@
>> >  inherit python3native
>> >
>> > -DEPENDS_append =3D " python3"
>> > +EXTRA_PYTHON_DEPENDS ?=3D ""
>> > +EXTRA_PYTHON_DEPENDS_class-target =3D "python3"
>> > +DEPENDS_append =3D " ${EXTRA_PYTHON_DEPENDS}"
>>
>> -EXTRA_PYTHON_DEPENDS_class-target =3D "python3"
>> -DEPENDS_append =3D " ${EXTRA_PYTHON_DEPENDS}"
>> +EXTRA_PYTHON_DEPENDS_class-target =3D " python3"
>> +DEPENDS_append =3D "${EXTRA_PYTHON_DEPENDS}"
>>
>> add a space before python3 is better than always add it to DEPENDS
>>
>> >
>> > -do_configure_prepend() {
>> > +do_configure_prepend_class-target() {
>> >          export _PYTHON_SYSCONFIGDATA_NAME=3D"_sysconfigdata"
>> >  }
>> >
>> > -do_compile_prepend() {
>> > +do_compile_prepend_class-target() {
>> >          export _PYTHON_SYSCONFIGDATA_NAME=3D"_sysconfigdata"
>> >  }
>> >
>> > -do_install_prepend() {
>> > +do_install_prepend_class-target() {
>> >          export _PYTHON_SYSCONFIGDATA_NAME=3D"_sysconfigdata"
>> >  }
>> > --
>> > 2.29.2
>> >
>> >=20
>> >
>>
>>
>> --
>> best regards,
>> Jos=C3=A9 Quaresma



--=20
best regards,
Jos=C3=A9 Quaresma
