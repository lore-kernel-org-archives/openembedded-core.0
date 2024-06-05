Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FEA4C25B76
	for <webhook@archiver.kernel.org>; Wed,  5 Jun 2024 07:07:25 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.9000.1717571242880979500
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jun 2024 00:07:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XBnuq/hK;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2eabd22d441so24135281fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Jun 2024 00:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717571241; x=1718176041; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qbFh17UHFv0NjGVER8q0aNZeXW1R7QufLi6/DF3jdmw=;
        b=XBnuq/hKmp17hR4BsySFshNTAnTb1fhXvdQp/Ws0KyoQeDo+1THkupGtH5g3SOjwP+
         PiP6Oc7ABFgl7zzSgcbZG+zc5zkkrNe0qrynRk71dlmnmexmJSxxgGe4cdtPwHYB+y6d
         5it957v41f1FFEVnc480YEJHgEfUJJxeuQ57SvmvszZSRMLVUfhCFHNkXp5qOc4OyIBV
         Z6cuI0OM3AQd9VaFsMUgAYojILPF1ek+s4SKrfmbNSDSpFY5d3mbYkwfi+fVrmAfkULa
         sX8tkTa82EVhRbBNKpcwMC43Pk6TVY1E/CCBRGvLU+WrWoY0eIKNS63h3vYsEbTdywgF
         HOZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717571241; x=1718176041;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qbFh17UHFv0NjGVER8q0aNZeXW1R7QufLi6/DF3jdmw=;
        b=wb58Zor4ZPGDT0KTCfevKL3ecCuPGQMDXNxdollvlzdiR8LkAK+tB9+9m+us5oGMv8
         BBu3LfuHh3dkxCFbX1H6GAnlGBmhThE0Pl/BYAV+EVPLG3bFtdxZxy3aoal0sQQanKSs
         bJGN9FROJQkqY8y3CV+0fXVHMS6GVUoWQdABMAOyNjC/pn70AiYmYLIWHPPJc1lhxwVX
         1bRZDFQuCP1jBW8ZmkNkox/FbF/uxZenoss6QPcjoM1nse1rAWjXhB9PiAnS/gMdb3Pe
         qjaK0rR+1fgz4GuBOWe6Zb+/Z3Jgme5EFPF0oqTY1fF4suQOavS5Sx+1JwV9wXo3+m8m
         1MFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpWcYWEwbAy5aSXR8dL1YV2JWO6im/Id8vflbnxF7TNPdDY9XGJaKPAXZKkE2IwL+Qr43gCyog1ywG+I+a1lnI3c/NxJFcox0Z7g/WWJSd2SVl/j6nWJaJ
X-Gm-Message-State: AOJu0Ywmw+wAy882bUgZjXq/ulcD65z4Lq39yCZ7yWFWxAe3ychtcrIJ
	yqr93UOUrH2qE4A++YsNiZUWnVohlz9JjXuyVCojNF52+Z1HjY7pEBF2dyLItBCXKnpiEmxfOZC
	zd85zR+rTWwQqYUbMqTMmQ7HlXv8=
X-Google-Smtp-Source: AGHT+IGQ6i6bdMKHmGNYKXKqxECDsguXfFF80rvLtzNGNiPCt1uFFGYU44XIf52dJRKrdE5JSyHm125tBo3DwsWKKPY=
X-Received: by 2002:a2e:b013:0:b0:2ea:aca0:2765 with SMTP id
 38308e7fff4ca-2eac7980c60mr9994251fa.5.1717571240505; Wed, 05 Jun 2024
 00:07:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240603162525.2940419-1-raj.khem@gmail.com> <1facaae48c6b1ea6e6b7640384a5e7ad79de5868.camel@linuxfoundation.org>
 <CAMKF1sr5B27YZ6rjPma-tgh=jLdZO50eGomprLPjQtvc5bi9qA@mail.gmail.com>
 <CAMKF1sqi2PNEkb4zfx4E8xiZKHfKHocxcdx2iKPKPvEtwua3qg@mail.gmail.com> <CAMKF1sqBqoWYiV6g6WZgsbHY3W+kk+zjfuFh-RxCN4duzvEq6A@mail.gmail.com>
In-Reply-To: <CAMKF1sqBqoWYiV6g6WZgsbHY3W+kk+zjfuFh-RxCN4duzvEq6A@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 5 Jun 2024 10:07:09 +0300
Message-ID: <CANNYZj9SQ6GRLc581M1aesWX5aXS-kpRnuRF4_6X4AmRcEALCg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-rpds-py: Create a symlink for cython
 module on musl
To: raj.khem@gmail.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000aaba7c061a1f37d4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jun 2024 07:07:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200356

--000000000000aaba7c061a1f37d4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for getting to the root of the issue.


Alex

On Wed 5. Jun 2024 at 9.47, Khem Raj via lists.openembedded.org <raj.khem=
=3D
gmail.com@lists.openembedded.org> wrote:

> On Mon, Jun 3, 2024 at 9:56=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrot=
e:
> >
> > On Mon, Jun 3, 2024 at 10:49=E2=80=AFAM Khem Raj <raj.khem@gmail.com> w=
rote:
> > >
> > > On Mon, Jun 3, 2024 at 9:35=E2=80=AFAM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > >
> > > > On Mon, 2024-06-03 at 09:25 -0700, Khem Raj via
> lists.openembedded.org
> > > > wrote:
> > > > > loader expects it to be called with 'linux-gnu' e.g
> > > > > rpds.cpython-312-x86_64-linux-musl.so is created with musl
> > > > > but loader expects it to called
> rpds.cpython-312-x86_64-linux-gnu.so
> > > > >
> > > > > Lets create the symlink to please the loader.
> > > > >
> > > > > Fixes
> > > > > ImportError while importing test module '/usr/lib/python3-rpds-
> > > > > py/ptest/tests/test_hash_trie_map.py'.
> > > > > Hint: make sure your test modules/packages have valid Python name=
s.
> > > > > Traceback:
> > > > > ../../python3.12/importlib/__init__.py:90: in import_module
> > > > >     return _bootstrap._gcd_import(name[level:], package, level)
> > > > > tests/test_hash_trie_map.py:36: in <module>
> > > > >     from rpds import HashTrieMap
> > > > > ../../python3.12/site-packages/rpds/__init__.py:1: in <module>
> > > > >     from .rpds import *
> > > > > E   ModuleNotFoundError: No module named 'rpds.rpds'
> > > > > ERROR: tests/test_hash_trie_map.py:tests/test_hash_trie_map.py
> > > > >
> > > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > > ---
> > > > >  .../recipes-devtools/python/python3-rpds-py_0.18.1.bb | 11
> > > > > +++++++++++
> > > > >  1 file changed, 11 insertions(+)
> > > > >
> > > > > diff --git a/meta/recipes-devtools/python/
> python3-rpds-py_0.18.1.bb
> > > > > b/meta/recipes-devtools/python/python3-rpds-py_0.18.1.bb
> > > > > index f46df1115c8..b1f0e100332 100644
> > > > > --- a/meta/recipes-devtools/python/python3-rpds-py_0.18.1.bb
> > > > > +++ b/meta/recipes-devtools/python/python3-rpds-py_0.18.1.bb
> > > > > @@ -27,4 +27,15 @@ do_install_ptest() {
> > > > >      cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> > > > >  }
> > > > >
> > > > > +do_install:append() {
> > > > > +    for f in ${D}/${PYTHON_SITEPACKAGES_DIR}/rpds/rpds.cpython*.=
so
> > > > > +    do
> > > > > +        fname=3D`basename $f`
> > > > > +        lname=3D`echo $fname | sed 's/musl/gnu/'`
> > > > > +        if [ "$fname" !=3D "$lname" ]; then
> > > > > +            mv $f ${D}/${PYTHON_SITEPACKAGES_DIR}/rpds/$lname
> > > > > +        fi
> > > > > +    done
> > > > > +}
> > > > > +
> > > > >  BBCLASSEXTEND =3D "native nativesdk"
> > > > >
> > > >
> > > > This feels like the kind of workaround that will live forever. Can =
we
> > > > not fix the loader to use the right name?
> > >
> > > OE's python interpreter is cross-built and we end up using OSABI whic=
h
> > > is detected during build 'linux-gnu', this seems to work fine for mos=
t
> of
> > > python modules since they get the OSABI from the sysconfigdata so it
> > > all works even though the OSABI is called linux-gnu, however some
> modules
> > > like this one which are using maturin to build, seems to get the OSAB=
I
> > > equivalent differently, I am no expert on maturin but maybe someone
> knows
> > > how it happens. This problem is seen with several python modules buil=
t
> with
> > > OE,  see
> > >
> > > https://github.com/meta-homeassistant/meta-homeassistant/issues/89
> > > https://github.com/pypa/auditwheel/issues/349
> > >
> > > also see how it is fixed in python3-pydantic-core on meta-python
> > >
> https://git.openembedded.org/meta-openembedded/tree/meta-python/recipes-d=
evtools/python/python3-pydantic-core_2.16.3.bb#n38
> > >
> > > Hopefully musllinux ABI tag will be sorted in pypa and this will work
> better
> > > however, we also need to see how we are encoding OSABI in python buil=
ds
> > >
> > > e.g. on qemux86-64 musl target I get
> > >
> > > root@qemux86-64:~# python3
> > > Python 3.12.3 (main, Apr  9 2024, 08:09:14) [Clang 19.0.0
> > > (/home/kraj/work/llvm-project 4152c5f5ae88d8d5fe99d20b525b35f14db2 on
> > > linux
> > > Type "help", "copyright", "credits" or "license" for more information=
.
> > > >>> import sysconfig
> > > >>> sysconfig.get_config_var('SOABI')
> > > 'cpython-312-x86_64-linux-gnu'
> > >
> >
> > I looked further in pyo and maturin infrastructure and it is using
> > ustc --target=3D<tuple> --print cfg  to compute EXT_SUFFIX equivalent
> > value which is then used to build the C extension (if any) inside the
> > wheel, thats why we get  cpython-312-x86_64-linux-musl for suffix,
> > what pyo/maturin is doing is right, however how OE does it in python
> > itself seems to be wrong to me, its synthesizing the OSABI
> > incorrectly.
> > where 'environment' value is not right. However, this is same
> > everywhere so it works, so long as the modules are built using
> > setuptools.
> > since SOABI is part of "_sysconfigdata" and its an OE generated file,
> > Perhaps it can consider the musl/gnu difference and emit SOABI
> > accordingly. Something like below
> >
> > https://snips.sh/f/L6QspcdxjL
> >
> > might be able to fix the python interpreter's logic.
>
> To close this thread. I have sent an alternative patch which fixes it
> in python3 itself.
>
> https://lore.kernel.org/openembedded-core/20240605064317.1646597-1-raj.kh=
em@gmail.com/T/#t
>
> >
> > > >
> > > > Also, there is not even a comment above saying why we need to do
> this.
> > > >
> > >
> > > I added the log showing how it does not work, I thought that is
> showing how
> > > it's not working at all when using musl. If you have better idea what
> I should
> > > add to commit msg to make it better, let me know I will send a v2.
> > >
> > > > Cheers,
> > > >
> > > > Richard
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200355):
> https://lists.openembedded.org/g/openembedded-core/message/200355
> Mute This Topic: https://lists.openembedded.org/mt/106465307/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000aaba7c061a1f37d4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks for getting to the root of the issue.</div><div di=
r=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</di=
v><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Wed 5. Jun 2024 at 9.47, Khem Raj via <a href=3D"http://lists.openembed=
ded.org">lists.openembedded.org</a> &lt;raj.khem=3D<a href=3D"mailto:gmail.=
com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-le=
ft-color:rgb(204,204,204)">On Mon, Jun 3, 2024 at 9:56=E2=80=AFPM Khem Raj =
&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.=
com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Mon, Jun 3, 2024 at 10:49=E2=80=AFAM Khem Raj &lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br=
>
&gt; &gt;<br>
&gt; &gt; On Mon, Jun 3, 2024 at 9:35=E2=80=AFAM Richard Purdie<br>
&gt; &gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=
=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Mon, 2024-06-03 at 09:25 -0700, Khem Raj via <a href=3D"h=
ttp://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.op=
enembedded.org</a><br>
&gt; &gt; &gt; wrote:<br>
&gt; &gt; &gt; &gt; loader expects it to be called with &#39;linux-gnu&#39;=
 e.g<br>
&gt; &gt; &gt; &gt; <a href=3D"http://rpds.cpython-312-x86_64-linux-musl.so=
" rel=3D"noreferrer" target=3D"_blank">rpds.cpython-312-x86_64-linux-musl.s=
o</a> is created with musl<br>
&gt; &gt; &gt; &gt; but loader expects it to called <a href=3D"http://rpds.=
cpython-312-x86_64-linux-gnu.so" rel=3D"noreferrer" target=3D"_blank">rpds.=
cpython-312-x86_64-linux-gnu.so</a><br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Lets create the symlink to please the loader.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Fixes<br>
&gt; &gt; &gt; &gt; ImportError while importing test module &#39;/usr/lib/p=
ython3-rpds-<br>
&gt; &gt; &gt; &gt; py/ptest/tests/test_hash_trie_map.py&#39;.<br>
&gt; &gt; &gt; &gt; Hint: make sure your test modules/packages have valid P=
ython names.<br>
&gt; &gt; &gt; &gt; Traceback:<br>
&gt; &gt; &gt; &gt; ../../python3.12/importlib/__init__.py:90: in import_mo=
dule<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0return _bootstrap._gcd_import(name[l=
evel:], package, level)<br>
&gt; &gt; &gt; &gt; tests/test_hash_trie_map.py:36: in &lt;module&gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0from rpds import HashTrieMap<br>
&gt; &gt; &gt; &gt; ../../python3.12/site-packages/rpds/__init__.py:1: in &=
lt;module&gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0from .rpds import *<br>
&gt; &gt; &gt; &gt; E=C2=A0 =C2=A0ModuleNotFoundError: No module named &#39=
;rpds.rpds&#39;<br>
&gt; &gt; &gt; &gt; ERROR: tests/test_hash_trie_map.py:tests/test_hash_trie=
_map.py<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt;=C2=A0 .../recipes-devtools/python/<a href=3D"http://pyt=
hon3-rpds-py_0.18.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-rpds-p=
y_0.18.1.bb</a> | 11<br>
&gt; &gt; &gt; &gt; +++++++++++<br>
&gt; &gt; &gt; &gt;=C2=A0 1 file changed, 11 insertions(+)<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; diff --git a/meta/recipes-devtools/python/<a href=3D"ht=
tp://python3-rpds-py_0.18.1.bb" rel=3D"noreferrer" target=3D"_blank">python=
3-rpds-py_0.18.1.bb</a><br>
&gt; &gt; &gt; &gt; b/meta/recipes-devtools/python/<a href=3D"http://python=
3-rpds-py_0.18.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-rpds-py_0=
.18.1.bb</a><br>
&gt; &gt; &gt; &gt; index f46df1115c8..b1f0e100332 100644<br>
&gt; &gt; &gt; &gt; --- a/meta/recipes-devtools/python/<a href=3D"http://py=
thon3-rpds-py_0.18.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-rpds-=
py_0.18.1.bb</a><br>
&gt; &gt; &gt; &gt; +++ b/meta/recipes-devtools/python/<a href=3D"http://py=
thon3-rpds-py_0.18.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-rpds-=
py_0.18.1.bb</a><br>
&gt; &gt; &gt; &gt; @@ -27,4 +27,15 @@ do_install_ptest() {<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 cp -rf ${S}/tests/* ${D}${PTEST_PAT=
H}/tests/<br>
&gt; &gt; &gt; &gt;=C2=A0 }<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; +do_install:append() {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 for f in ${D}/${PYTHON_SITEPACKAGES_DIR}=
/rpds/rpds.cpython*.so<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 do<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fname=3D`basename $f`<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 lname=3D`echo $fname | sed=
 &#39;s/musl/gnu/&#39;`<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;$fname&quot; !=
=3D &quot;$lname&quot; ]; then<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mv $f ${D}/$=
{PYTHON_SITEPACKAGES_DIR}/rpds/$lname<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0 done<br>
&gt; &gt; &gt; &gt; +}<br>
&gt; &gt; &gt; &gt; +<br>
&gt; &gt; &gt; &gt;=C2=A0 BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br=
>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; This feels like the kind of workaround that will live foreve=
r. Can we<br>
&gt; &gt; &gt; not fix the loader to use the right name?<br>
&gt; &gt;<br>
&gt; &gt; OE&#39;s python interpreter is cross-built and we end up using OS=
ABI which<br>
&gt; &gt; is detected during build &#39;linux-gnu&#39;, this seems to work =
fine for most of<br>
&gt; &gt; python modules since they get the OSABI from the sysconfigdata so=
 it<br>
&gt; &gt; all works even though the OSABI is called linux-gnu, however some=
 modules<br>
&gt; &gt; like this one which are using maturin to build, seems to get the =
OSABI<br>
&gt; &gt; equivalent differently, I am no expert on maturin but maybe someo=
ne knows<br>
&gt; &gt; how it happens. This problem is seen with several python modules =
built with<br>
&gt; &gt; OE,=C2=A0 see<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"https://github.com/meta-homeassistant/meta-homeassista=
nt/issues/89" rel=3D"noreferrer" target=3D"_blank">https://github.com/meta-=
homeassistant/meta-homeassistant/issues/89</a><br>
&gt; &gt; <a href=3D"https://github.com/pypa/auditwheel/issues/349" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/pypa/auditwheel/issues/349=
</a><br>
&gt; &gt;<br>
&gt; &gt; also see how it is fixed in python3-pydantic-core on meta-python<=
br>
&gt; &gt; <a href=3D"https://git.openembedded.org/meta-openembedded/tree/me=
ta-python/recipes-devtools/python/python3-pydantic-core_2.16.3.bb#n38" rel=
=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/meta-openemb=
edded/tree/meta-python/recipes-devtools/python/python3-pydantic-core_2.16.3=
.bb#n38</a><br>
&gt; &gt;<br>
&gt; &gt; Hopefully musllinux ABI tag will be sorted in pypa and this will =
work better<br>
&gt; &gt; however, we also need to see how we are encoding OSABI in python =
builds<br>
&gt; &gt;<br>
&gt; &gt; e.g. on qemux86-64 musl target I get<br>
&gt; &gt;<br>
&gt; &gt; root@qemux86-64:~# python3<br>
&gt; &gt; Python 3.12.3 (main, Apr=C2=A0 9 2024, 08:09:14) [Clang 19.0.0<br=
>
&gt; &gt; (/home/kraj/work/llvm-project 4152c5f5ae88d8d5fe99d20b525b35f14db=
2 on<br>
&gt; &gt; linux<br>
&gt; &gt; Type &quot;help&quot;, &quot;copyright&quot;, &quot;credits&quot;=
 or &quot;license&quot; for more information.<br>
&gt; &gt; &gt;&gt;&gt; import sysconfig<br>
&gt; &gt; &gt;&gt;&gt; sysconfig.get_config_var(&#39;SOABI&#39;)<br>
&gt; &gt; &#39;cpython-312-x86_64-linux-gnu&#39;<br>
&gt; &gt;<br>
&gt;<br>
&gt; I looked further in pyo and maturin infrastructure and it is using<br>
&gt; ustc --target=3D&lt;tuple&gt; --print cfg=C2=A0 to compute EXT_SUFFIX =
equivalent<br>
&gt; value which is then used to build the C extension (if any) inside the<=
br>
&gt; wheel, thats why we get=C2=A0 cpython-312-x86_64-linux-musl for suffix=
,<br>
&gt; what pyo/maturin is doing is right, however how OE does it in python<b=
r>
&gt; itself seems to be wrong to me, its synthesizing the OSABI<br>
&gt; incorrectly.<br>
&gt; where &#39;environment&#39; value is not right. However, this is same<=
br>
&gt; everywhere so it works, so long as the modules are built using<br>
&gt; setuptools.<br>
&gt; since SOABI is part of &quot;_sysconfigdata&quot; and its an OE genera=
ted file,<br>
&gt; Perhaps it can consider the musl/gnu difference and emit SOABI<br>
&gt; accordingly. Something like below<br>
&gt;<br>
&gt; <a href=3D"https://snips.sh/f/L6QspcdxjL" rel=3D"noreferrer" target=3D=
"_blank">https://snips.sh/f/L6QspcdxjL</a><br>
&gt;<br>
&gt; might be able to fix the python interpreter&#39;s logic.<br>
<br>
To close this thread. I have sent an alternative patch which fixes it<br>
in python3 itself.<br>
<a href=3D"https://lore.kernel.org/openembedded-core/20240605064317.1646597=
-1-raj.khem@gmail.com/T/#t" rel=3D"noreferrer" target=3D"_blank">https://lo=
re.kernel.org/openembedded-core/20240605064317.1646597-1-raj.khem@gmail.com=
/T/#t</a><br>
<br>
&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Also, there is not even a comment above saying why we need t=
o do this.<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; I added the log showing how it does not work, I thought that is s=
howing how<br>
&gt; &gt; it&#39;s not working at all when using musl. If you have better i=
dea what I should<br>
&gt; &gt; add to commit msg to make it better, let me know I will send a v2=
.<br>
&gt; &gt;<br>
&gt; &gt; &gt; Cheers,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Richard<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#200355): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/200355" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/200355</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/106465307/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/106465307/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000aaba7c061a1f37d4--

