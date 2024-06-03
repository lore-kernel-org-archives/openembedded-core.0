Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 576EBC25B75
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 19:59:45 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.3043.1717444782178493407
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jun 2024 12:59:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Fd8WTYSA;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2eaae2a6dc1so26665231fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 12:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717444780; x=1718049580; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1y0NTRR/AkkTs1023pjsph8Ew+IKJkAacESKN70+AG4=;
        b=Fd8WTYSA44NbPtWcJ/1ygUFr4EPkRX+5AsFNb3/EHlBytXvpYqPsgxrZI2ZVGyOGio
         Gglf+WJPcpMum7J3CgTSwr1/K0xCtWhEQxmC6lX9spsDo8cWHs1c9oUA0uW/sB+iJjRh
         alEeyJNDED/yel4rfgUdF8mz5B7Ftn5cmDHtJsWV1aUw+Uq61ew2xl8e9n+VnleoY6mL
         PDAfgeBdNySL6b17hlviqypNjJ379PhOHm4JNKADyxL5jFf/o+t7TBdlgrjhbm9ukxsc
         /eQw3TmjVrUpgX7Dq5AGw2/RrJQK/XXpm4ZCBHMoI8JqP3zr8bbF2VGJKMpb7DBt7ZZT
         BREw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717444780; x=1718049580;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1y0NTRR/AkkTs1023pjsph8Ew+IKJkAacESKN70+AG4=;
        b=Na38FWjoN0a8zcYAHt9aFINRv05UMdWPNTfqrW05A2haPjKaN6HV07iGjURBZm9yt8
         VplW4nLvJF6GmFSkYQTqFtKnW8lYb/4MwFMjGH9/MYYbP8J2KjZTSyXbzgILGmRs4jnC
         n+GOdjO46Oe89IxKXaVyn5+uAz9mrIHMR4U4cG9HZ8o/FRos24/Egii/EjbAQDr/ohbw
         NXQ82AnX7q1EZmJgd6d2fJymwVNCKhLHG1rqJ3pT+AsuIsW1A7LM+HBnsq0HTYUkZCAY
         yr3ZM2Bq1KAtVYqcDl4TxVDYH26pvjhlBikab3AYIHGiQsRgPGDsCYYiiCmThibBGNHR
         QUfg==
X-Forwarded-Encrypted: i=1; AJvYcCWGwsfsdJROr4nw9RYuj05PhQHNCk+YzyoOGvg7RmHdGqKbB0+C0SRxr2vrLv0s7Ew3YvYrWTP8Dr6VS44LG1t36PZJqCzLT89yWqLdgY/0j3+DYCcMY4Lw
X-Gm-Message-State: AOJu0Yx0hrmz3ZdwKaxr5U5FMfnegh9inZQlCwt8OTjw0ZPviv/HI2YK
	1DG6htNatsTeG4JYZKH1S1jOC2W5XUts+BbQQZyd6kPFUYMoalL96rrPoBcXt/F9FHg+ZF2OrkY
	rm/7lEuJ8o0NEVMJN7Pozqsiiks0=
X-Google-Smtp-Source: AGHT+IFPa29mNdb6gvGLW8RJt/7t7il2fAVhRk9cDnHB+O/z6RqMagriVC7ve6N8kIePg0ER4GtaM2wXeYV8dA6kUrE=
X-Received: by 2002:a05:651c:1a28:b0:2e9:821a:82fb with SMTP id
 38308e7fff4ca-2ea950e877bmr96539441fa.6.1717444779843; Mon, 03 Jun 2024
 12:59:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240603162525.2940419-1-raj.khem@gmail.com> <1facaae48c6b1ea6e6b7640384a5e7ad79de5868.camel@linuxfoundation.org>
 <CAMKF1sr5B27YZ6rjPma-tgh=jLdZO50eGomprLPjQtvc5bi9qA@mail.gmail.com>
In-Reply-To: <CAMKF1sr5B27YZ6rjPma-tgh=jLdZO50eGomprLPjQtvc5bi9qA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 3 Jun 2024 22:59:28 +0300
Message-ID: <CANNYZj8XiWxKW3qp=V2-NsxTGuGR_AXnB8ywUKq-PikQhyYrbw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-rpds-py: Create a symlink for cython
 module on musl
To: raj.khem@gmail.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000062abf061a01c6de"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 19:59:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200280

--000000000000062abf061a01c6de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I agree with RP, please get to the source of the mismatch. It=E2=80=99s a r=
eally
unpleasant workaround.

Alex

On Mon 3. Jun 2024 at 20.49, Khem Raj via lists.openembedded.org <raj.khem=
=3D
gmail.com@lists.openembedded.org> wrote:

> On Mon, Jun 3, 2024 at 9:35=E2=80=AFAM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Mon, 2024-06-03 at 09:25 -0700, Khem Raj via lists.openembedded.org
> > wrote:
> > > loader expects it to be called with 'linux-gnu' e.g
> > > rpds.cpython-312-x86_64-linux-musl.so is created with musl
> > > but loader expects it to called rpds.cpython-312-x86_64-linux-gnu.so
> > >
> > > Lets create the symlink to please the loader.
> > >
> > > Fixes
> > > ImportError while importing test module '/usr/lib/python3-rpds-
> > > py/ptest/tests/test_hash_trie_map.py'.
> > > Hint: make sure your test modules/packages have valid Python names.
> > > Traceback:
> > > ../../python3.12/importlib/__init__.py:90: in import_module
> > >     return _bootstrap._gcd_import(name[level:], package, level)
> > > tests/test_hash_trie_map.py:36: in <module>
> > >     from rpds import HashTrieMap
> > > ../../python3.12/site-packages/rpds/__init__.py:1: in <module>
> > >     from .rpds import *
> > > E   ModuleNotFoundError: No module named 'rpds.rpds'
> > > ERROR: tests/test_hash_trie_map.py:tests/test_hash_trie_map.py
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  .../recipes-devtools/python/python3-rpds-py_0.18.1.bb | 11
> > > +++++++++++
> > >  1 file changed, 11 insertions(+)
> > >
> > > diff --git a/meta/recipes-devtools/python/python3-rpds-py_0.18.1.bb
> > > b/meta/recipes-devtools/python/python3-rpds-py_0.18.1.bb
> > > index f46df1115c8..b1f0e100332 100644
> > > --- a/meta/recipes-devtools/python/python3-rpds-py_0.18.1.bb
> > > +++ b/meta/recipes-devtools/python/python3-rpds-py_0.18.1.bb
> > > @@ -27,4 +27,15 @@ do_install_ptest() {
> > >      cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> > >  }
> > >
> > > +do_install:append() {
> > > +    for f in ${D}/${PYTHON_SITEPACKAGES_DIR}/rpds/rpds.cpython*.so
> > > +    do
> > > +        fname=3D`basename $f`
> > > +        lname=3D`echo $fname | sed 's/musl/gnu/'`
> > > +        if [ "$fname" !=3D "$lname" ]; then
> > > +            mv $f ${D}/${PYTHON_SITEPACKAGES_DIR}/rpds/$lname
> > > +        fi
> > > +    done
> > > +}
> > > +
> > >  BBCLASSEXTEND =3D "native nativesdk"
> > >
> >
> > This feels like the kind of workaround that will live forever. Can we
> > not fix the loader to use the right name?
>
> OE's python interpreter is cross-built and we end up using OSABI which
> is detected during build 'linux-gnu', this seems to work fine for most of
> python modules since they get the OSABI from the sysconfigdata so it
> all works even though the OSABI is called linux-gnu, however some modules
> like this one which are using maturin to build, seems to get the OSABI
> equivalent differently, I am no expert on maturin but maybe someone knows
> how it happens. This problem is seen with several python modules built wi=
th
> OE,  see
>
> https://github.com/meta-homeassistant/meta-homeassistant/issues/89
> https://github.com/pypa/auditwheel/issues/349
>
> also see how it is fixed in python3-pydantic-core on meta-python
>
> https://git.openembedded.org/meta-openembedded/tree/meta-python/recipes-d=
evtools/python/python3-pydantic-core_2.16.3.bb#n38
>
> Hopefully musllinux ABI tag will be sorted in pypa and this will work
> better
> however, we also need to see how we are encoding OSABI in python builds
>
> e.g. on qemux86-64 musl target I get
>
> root@qemux86-64:~# python3
> Python 3.12.3 (main, Apr  9 2024, 08:09:14) [Clang 19.0.0
> (/home/kraj/work/llvm-project 4152c5f5ae88d8d5fe99d20b525b35f14db2 on
> linux
> Type "help", "copyright", "credits" or "license" for more information.
> >>> import sysconfig
> >>> sysconfig.get_config_var('SOABI')
> 'cpython-312-x86_64-linux-gnu'
>
> >
> > Also, there is not even a comment above saying why we need to do this.
> >
>
> I added the log showing how it does not work, I thought that is showing h=
ow
> it's not working at all when using musl. If you have better idea what I
> should
> add to commit msg to make it better, let me know I will send a v2.
>
> > Cheers,
> >
> > Richard
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200275):
> https://lists.openembedded.org/g/openembedded-core/message/200275
> Mute This Topic: https://lists.openembedded.org/mt/106465307/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000062abf061a01c6de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I agree with RP, please get to the source of the mismatch=
. It=E2=80=99s a really unpleasant workaround.</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Mon 3. Jun 2024 at 20.49, Khem Raj via <=
a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;raj=
.khem=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists=
.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:=
solid;padding-left:1ex;border-left-color:rgb(204,204,204)">On Mon, Jun 3, 2=
024 at 9:35=E2=80=AFAM Richard Purdie<br>
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank"=
>richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Mon, 2024-06-03 at 09:25 -0700, Khem Raj via <a href=3D"http://list=
s.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded=
.org</a><br>
&gt; wrote:<br>
&gt; &gt; loader expects it to be called with &#39;linux-gnu&#39; e.g<br>
&gt; &gt; <a href=3D"http://rpds.cpython-312-x86_64-linux-musl.so" rel=3D"n=
oreferrer" target=3D"_blank">rpds.cpython-312-x86_64-linux-musl.so</a> is c=
reated with musl<br>
&gt; &gt; but loader expects it to called <a href=3D"http://rpds.cpython-31=
2-x86_64-linux-gnu.so" rel=3D"noreferrer" target=3D"_blank">rpds.cpython-31=
2-x86_64-linux-gnu.so</a><br>
&gt; &gt;<br>
&gt; &gt; Lets create the symlink to please the loader.<br>
&gt; &gt;<br>
&gt; &gt; Fixes<br>
&gt; &gt; ImportError while importing test module &#39;/usr/lib/python3-rpd=
s-<br>
&gt; &gt; py/ptest/tests/test_hash_trie_map.py&#39;.<br>
&gt; &gt; Hint: make sure your test modules/packages have valid Python name=
s.<br>
&gt; &gt; Traceback:<br>
&gt; &gt; ../../python3.12/importlib/__init__.py:90: in import_module<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0return _bootstrap._gcd_import(name[level:], pa=
ckage, level)<br>
&gt; &gt; tests/test_hash_trie_map.py:36: in &lt;module&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0from rpds import HashTrieMap<br>
&gt; &gt; ../../python3.12/site-packages/rpds/__init__.py:1: in &lt;module&=
gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0from .rpds import *<br>
&gt; &gt; E=C2=A0 =C2=A0ModuleNotFoundError: No module named &#39;rpds.rpds=
&#39;<br>
&gt; &gt; ERROR: tests/test_hash_trie_map.py:tests/test_hash_trie_map.py<br=
>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 .../recipes-devtools/python/<a href=3D"http://python3-rpds-=
py_0.18.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-rpds-py_0.18.1.b=
b</a> | 11<br>
&gt; &gt; +++++++++++<br>
&gt; &gt;=C2=A0 1 file changed, 11 insertions(+)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://pytho=
n3-rpds-py_0.18.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-rpds-py_=
0.18.1.bb</a><br>
&gt; &gt; b/meta/recipes-devtools/python/<a href=3D"http://python3-rpds-py_=
0.18.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-rpds-py_0.18.1.bb</=
a><br>
&gt; &gt; index f46df1115c8..b1f0e100332 100644<br>
&gt; &gt; --- a/meta/recipes-devtools/python/<a href=3D"http://python3-rpds=
-py_0.18.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-rpds-py_0.18.1.=
bb</a><br>
&gt; &gt; +++ b/meta/recipes-devtools/python/<a href=3D"http://python3-rpds=
-py_0.18.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-rpds-py_0.18.1.=
bb</a><br>
&gt; &gt; @@ -27,4 +27,15 @@ do_install_ptest() {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/<=
br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt;<br>
&gt; &gt; +do_install:append() {<br>
&gt; &gt; +=C2=A0 =C2=A0 for f in ${D}/${PYTHON_SITEPACKAGES_DIR}/rpds/rpds=
.cpython*.so<br>
&gt; &gt; +=C2=A0 =C2=A0 do<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fname=3D`basename $f`<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 lname=3D`echo $fname | sed &#39;s/mu=
sl/gnu/&#39;`<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;$fname&quot; !=3D &quot;$=
lname&quot; ]; then<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mv $f ${D}/${PYTHON_SI=
TEPACKAGES_DIR}/rpds/$lname<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; &gt; +=C2=A0 =C2=A0 done<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; &gt;<br>
&gt;<br>
&gt; This feels like the kind of workaround that will live forever. Can we<=
br>
&gt; not fix the loader to use the right name?<br>
<br>
OE&#39;s python interpreter is cross-built and we end up using OSABI which<=
br>
is detected during build &#39;linux-gnu&#39;, this seems to work fine for m=
ost of<br>
python modules since they get the OSABI from the sysconfigdata so it<br>
all works even though the OSABI is called linux-gnu, however some modules<b=
r>
like this one which are using maturin to build, seems to get the OSABI<br>
equivalent differently, I am no expert on maturin but maybe someone knows<b=
r>
how it happens. This problem is seen with several python modules built with=
<br>
OE,=C2=A0 see<br>
<br>
<a href=3D"https://github.com/meta-homeassistant/meta-homeassistant/issues/=
89" rel=3D"noreferrer" target=3D"_blank">https://github.com/meta-homeassist=
ant/meta-homeassistant/issues/89</a><br>
<a href=3D"https://github.com/pypa/auditwheel/issues/349" rel=3D"noreferrer=
" target=3D"_blank">https://github.com/pypa/auditwheel/issues/349</a><br>
<br>
also see how it is fixed in python3-pydantic-core on meta-python<br>
<a href=3D"https://git.openembedded.org/meta-openembedded/tree/meta-python/=
recipes-devtools/python/python3-pydantic-core_2.16.3.bb#n38" rel=3D"norefer=
rer" target=3D"_blank">https://git.openembedded.org/meta-openembedded/tree/=
meta-python/recipes-devtools/python/python3-pydantic-core_2.16.3.bb#n38</a>=
<br>
<br>
Hopefully musllinux ABI tag will be sorted in pypa and this will work bette=
r<br>
however, we also need to see how we are encoding OSABI in python builds<br>
<br>
e.g. on qemux86-64 musl target I get<br>
<br>
root@qemux86-64:~# python3<br>
Python 3.12.3 (main, Apr=C2=A0 9 2024, 08:09:14) [Clang 19.0.0<br>
(/home/kraj/work/llvm-project 4152c5f5ae88d8d5fe99d20b525b35f14db2 on<br>
linux<br>
Type &quot;help&quot;, &quot;copyright&quot;, &quot;credits&quot; or &quot;=
license&quot; for more information.<br>
&gt;&gt;&gt; import sysconfig<br>
&gt;&gt;&gt; sysconfig.get_config_var(&#39;SOABI&#39;)<br>
&#39;cpython-312-x86_64-linux-gnu&#39;<br>
<br>
&gt;<br>
&gt; Also, there is not even a comment above saying why we need to do this.=
<br>
&gt;<br>
<br>
I added the log showing how it does not work, I thought that is showing how=
<br>
it&#39;s not working at all when using musl. If you have better idea what I=
 should<br>
add to commit msg to make it better, let me know I will send a v2.<br>
<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Richard<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#200275): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/200275" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/200275</a><br>
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

--000000000000062abf061a01c6de--

