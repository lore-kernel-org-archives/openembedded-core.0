Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A9C3C25B74
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 04:56:48 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web11.13804.1717477004260836303
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jun 2024 21:56:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nlTlAwag;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6f906f52a4aso3115312a34.3
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 21:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717477003; x=1718081803; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VHOs2ptIYeRY0wRmIuBxSlEtfi5JkDh1lYrQx6Zr8nQ=;
        b=nlTlAwag1ZWdPxcDGKbCdVL7kJNA62GcyK4bu5GUYn1gaemMvvdgf5XBA4wlRJUgPT
         woy7Z4Mhc+6NE6Lo7u05n3S3WXklQA9AM1yGgUK7+mhumruXdatMP+msOC1P5AK4in/y
         20Sgmci6GCd0YIaU+hokPu1blEnby48rztUPysCzf0aMYOgtco2lmiFwyY50mvYAqrMe
         kXtDPBS/UTFYPHiVcS91Z6GA4I8lKu0FGlI1OlGNXsUs/yBMI/EuN+Z6ShfVFzn3/iNY
         H19+wv22vqivthaCKHzHl+u4sLIQyHixfKb3Kkd57IL7Rr0wZZAT+/ehtWMAozJ7tf6p
         QIjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717477003; x=1718081803;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VHOs2ptIYeRY0wRmIuBxSlEtfi5JkDh1lYrQx6Zr8nQ=;
        b=xD8EwmlOMyjsmUGavCqY7DS/HZDGTm09kq5ZV/9itFRHU9/CqcnX93gt3jYXqyRDg+
         WyCa/IZAyJssuQFB2kNKzIqxTNj3hd00/d55758JYh15AbQy+zkLreuS/fRToWVaxb8o
         EMwqsEqjGMw2wr531Ol+jXGlwbVBFJGx1LJWdpNV0vGpOWPDXwSWlOcLrR/x0xJTmyEp
         o31pvjJUQk8HAJiqQV6dHbWT+Jeox/AU4pHMVjLr3jCWP8g2RH56dfeNyvY/yiJstyf5
         s5rZZgDDDktu8JA7OOVaJvwkJCqgPrf5ivP6tBu6w4opQNaQp0/iPszyYqfXB8r2b64J
         PW/g==
X-Gm-Message-State: AOJu0Yy16J6kIzPE+2lE99LaWLEaYAnQib69jStZsrlCWE0TGKwYIRZG
	OvKbJ4nkVZEscxfCbk0lY9fvt1VXaJAGi9enoArCPw2/iHdfeWUqjQlcP2+4ScXh4y2S3YvwYLK
	Ix6Lv6nGVp+v+T1WV65ugbS/AgzU=
X-Google-Smtp-Source: AGHT+IFi+Y1NcEp8AWSDRYDPoGz1r25ie0AqXVWvdMuKN9L+a8xKMDOG+0KQxywYNlsc3UaZOa20PTJAsg9P6PP2MOs=
X-Received: by 2002:a05:6870:6388:b0:24f:e5f2:1d03 with SMTP id
 586e51a60fabf-2508b9c9a35mr13065667fac.24.1717477003188; Mon, 03 Jun 2024
 21:56:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240603162525.2940419-1-raj.khem@gmail.com> <1facaae48c6b1ea6e6b7640384a5e7ad79de5868.camel@linuxfoundation.org>
 <CAMKF1sr5B27YZ6rjPma-tgh=jLdZO50eGomprLPjQtvc5bi9qA@mail.gmail.com>
In-Reply-To: <CAMKF1sr5B27YZ6rjPma-tgh=jLdZO50eGomprLPjQtvc5bi9qA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Jun 2024 21:56:16 -0700
Message-ID: <CAMKF1sqi2PNEkb4zfx4E8xiZKHfKHocxcdx2iKPKPvEtwua3qg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-rpds-py: Create a symlink for cython
 module on musl
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 04:56:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200289

On Mon, Jun 3, 2024 at 10:49=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
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
> https://git.openembedded.org/meta-openembedded/tree/meta-python/recipes-d=
evtools/python/python3-pydantic-core_2.16.3.bb#n38
>
> Hopefully musllinux ABI tag will be sorted in pypa and this will work bet=
ter
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

I looked further in pyo and maturin infrastructure and it is using
ustc --target=3D<tuple> --print cfg  to compute EXT_SUFFIX equivalent
value which is then used to build the C extension (if any) inside the
wheel, thats why we get  cpython-312-x86_64-linux-musl for suffix,
what pyo/maturin is doing is right, however how OE does it in python
itself seems to be wrong to me, its synthesizing the OSABI
incorrectly.
where 'environment' value is not right. However, this is same
everywhere so it works, so long as the modules are built using
setuptools.
since SOABI is part of "_sysconfigdata" and its an OE generated file,
Perhaps it can consider the musl/gnu difference and emit SOABI
accordingly. Something like below

https://snips.sh/f/L6QspcdxjL

might be able to fix the python interpreter's logic.

> >
> > Also, there is not even a comment above saying why we need to do this.
> >
>
> I added the log showing how it does not work, I thought that is showing h=
ow
> it's not working at all when using musl. If you have better idea what I s=
hould
> add to commit msg to make it better, let me know I will send a v2.
>
> > Cheers,
> >
> > Richard

