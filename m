Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67D8BC25B76
	for <webhook@archiver.kernel.org>; Wed,  5 Jun 2024 06:47:35 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web10.8681.1717570050388105628
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jun 2024 23:47:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WzWJRNjb;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2509f93959bso269204fac.1
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 23:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717570049; x=1718174849; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ul7c8g8Bmq7K4+yYLG6yVJqYcYE2ALG9BhANLkEMkrQ=;
        b=WzWJRNjbjBIU+suZ8PMAw7XkeQc6ncZRFtdMt+VpkhL4vcYcxizVjfzYvMMP98xoqU
         wgaefCuW1Fx3x/JMiTVHP7eCSw5K95EtN6riXAEUREMHIm/Z54wpqZlH2oEb4Ghf3m76
         Dne9BnRzRwPsvQSmrEf4ddBAjQE9ULbYdSwcFmQkjt9A8aylDgaGIk+XPIuDaN4zyYLt
         TQeuDqxKKqeka8zJ9ckzYSn1AYFsmkrf4HjFqtvege7fN6knlobRBxiQyB3Y549lFXRv
         dywJXf3EUImHU8Lp1Kwvn4MTw8Mqd+WcasTmjleqszQ9CgkKORKbvo6T6jB9gzjFI1EY
         y1Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717570049; x=1718174849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ul7c8g8Bmq7K4+yYLG6yVJqYcYE2ALG9BhANLkEMkrQ=;
        b=OgrehKmg30ScbEb6ryDx+jZi02QSJci2vBhouCE54K5Ansf9FGhQbtAfM+s3gMp6EI
         R33sF3++Zuz6BzCz8yC6ImdJeVUUl+waBUnY8JDnhETCj7848KJ8P8YZF7OZwAA2+jOj
         ALfaRQ4oCWzkd66TliwjOhJfshSJjWs2EHyo6Pi/CDtHWmdA1LN4UACHFmEczcIvKGlI
         AZJ26hgNpIt5e7Ty+OQG94Ore/WBVld0thWEvhUeVCUqppNgOOfVnFPQhn8/5lmVH93U
         MjFDlks6wFo2Ae+l8/oIyOMKXgdkSpREiI7uwozJmCuhq753LHvE1Edz2qeFCFwnIVcD
         nKxQ==
X-Gm-Message-State: AOJu0YyougV05dMjUED6U+z3MXFoGu845wfDXWsyvrB443/o6wNS8dy3
	6aT69YithyGTwWmBfH9L867i1FNGYZFRJDmDjMp60XlXSyPf3UpAI5G5Ck41foPZJcJIZ2CgJJi
	TdZDxIgR2MqtWMi6ttqYiY9s4SA0B+GDA
X-Google-Smtp-Source: AGHT+IG0TLz6FVhQExuzDlTDhaheV7NenSwyZwsaaFX+YhYelN3ZROQj1gNPnVp2LS3bp66mTx7nDjhnU28NBVaXhLU=
X-Received: by 2002:a05:6870:2cc:b0:251:2c3f:7a2e with SMTP id
 586e51a60fabf-2512c3fe706mr362856fac.2.1717570049449; Tue, 04 Jun 2024
 23:47:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240603162525.2940419-1-raj.khem@gmail.com> <1facaae48c6b1ea6e6b7640384a5e7ad79de5868.camel@linuxfoundation.org>
 <CAMKF1sr5B27YZ6rjPma-tgh=jLdZO50eGomprLPjQtvc5bi9qA@mail.gmail.com> <CAMKF1sqi2PNEkb4zfx4E8xiZKHfKHocxcdx2iKPKPvEtwua3qg@mail.gmail.com>
In-Reply-To: <CAMKF1sqi2PNEkb4zfx4E8xiZKHfKHocxcdx2iKPKPvEtwua3qg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Jun 2024 23:47:00 -0700
Message-ID: <CAMKF1sqBqoWYiV6g6WZgsbHY3W+kk+zjfuFh-RxCN4duzvEq6A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-rpds-py: Create a symlink for cython
 module on musl
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jun 2024 06:47:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200355

On Mon, Jun 3, 2024 at 9:56=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Mon, Jun 3, 2024 at 10:49=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wro=
te:
> >
> > On Mon, Jun 3, 2024 at 9:35=E2=80=AFAM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Mon, 2024-06-03 at 09:25 -0700, Khem Raj via lists.openembedded.or=
g
> > > wrote:
> > > > loader expects it to be called with 'linux-gnu' e.g
> > > > rpds.cpython-312-x86_64-linux-musl.so is created with musl
> > > > but loader expects it to called rpds.cpython-312-x86_64-linux-gnu.s=
o
> > > >
> > > > Lets create the symlink to please the loader.
> > > >
> > > > Fixes
> > > > ImportError while importing test module '/usr/lib/python3-rpds-
> > > > py/ptest/tests/test_hash_trie_map.py'.
> > > > Hint: make sure your test modules/packages have valid Python names.
> > > > Traceback:
> > > > ../../python3.12/importlib/__init__.py:90: in import_module
> > > >     return _bootstrap._gcd_import(name[level:], package, level)
> > > > tests/test_hash_trie_map.py:36: in <module>
> > > >     from rpds import HashTrieMap
> > > > ../../python3.12/site-packages/rpds/__init__.py:1: in <module>
> > > >     from .rpds import *
> > > > E   ModuleNotFoundError: No module named 'rpds.rpds'
> > > > ERROR: tests/test_hash_trie_map.py:tests/test_hash_trie_map.py
> > > >
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > ---
> > > >  .../recipes-devtools/python/python3-rpds-py_0.18.1.bb | 11
> > > > +++++++++++
> > > >  1 file changed, 11 insertions(+)
> > > >
> > > > diff --git a/meta/recipes-devtools/python/python3-rpds-py_0.18.1.bb
> > > > b/meta/recipes-devtools/python/python3-rpds-py_0.18.1.bb
> > > > index f46df1115c8..b1f0e100332 100644
> > > > --- a/meta/recipes-devtools/python/python3-rpds-py_0.18.1.bb
> > > > +++ b/meta/recipes-devtools/python/python3-rpds-py_0.18.1.bb
> > > > @@ -27,4 +27,15 @@ do_install_ptest() {
> > > >      cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> > > >  }
> > > >
> > > > +do_install:append() {
> > > > +    for f in ${D}/${PYTHON_SITEPACKAGES_DIR}/rpds/rpds.cpython*.so
> > > > +    do
> > > > +        fname=3D`basename $f`
> > > > +        lname=3D`echo $fname | sed 's/musl/gnu/'`
> > > > +        if [ "$fname" !=3D "$lname" ]; then
> > > > +            mv $f ${D}/${PYTHON_SITEPACKAGES_DIR}/rpds/$lname
> > > > +        fi
> > > > +    done
> > > > +}
> > > > +
> > > >  BBCLASSEXTEND =3D "native nativesdk"
> > > >
> > >
> > > This feels like the kind of workaround that will live forever. Can we
> > > not fix the loader to use the right name?
> >
> > OE's python interpreter is cross-built and we end up using OSABI which
> > is detected during build 'linux-gnu', this seems to work fine for most =
of
> > python modules since they get the OSABI from the sysconfigdata so it
> > all works even though the OSABI is called linux-gnu, however some modul=
es
> > like this one which are using maturin to build, seems to get the OSABI
> > equivalent differently, I am no expert on maturin but maybe someone kno=
ws
> > how it happens. This problem is seen with several python modules built =
with
> > OE,  see
> >
> > https://github.com/meta-homeassistant/meta-homeassistant/issues/89
> > https://github.com/pypa/auditwheel/issues/349
> >
> > also see how it is fixed in python3-pydantic-core on meta-python
> > https://git.openembedded.org/meta-openembedded/tree/meta-python/recipes=
-devtools/python/python3-pydantic-core_2.16.3.bb#n38
> >
> > Hopefully musllinux ABI tag will be sorted in pypa and this will work b=
etter
> > however, we also need to see how we are encoding OSABI in python builds
> >
> > e.g. on qemux86-64 musl target I get
> >
> > root@qemux86-64:~# python3
> > Python 3.12.3 (main, Apr  9 2024, 08:09:14) [Clang 19.0.0
> > (/home/kraj/work/llvm-project 4152c5f5ae88d8d5fe99d20b525b35f14db2 on
> > linux
> > Type "help", "copyright", "credits" or "license" for more information.
> > >>> import sysconfig
> > >>> sysconfig.get_config_var('SOABI')
> > 'cpython-312-x86_64-linux-gnu'
> >
>
> I looked further in pyo and maturin infrastructure and it is using
> ustc --target=3D<tuple> --print cfg  to compute EXT_SUFFIX equivalent
> value which is then used to build the C extension (if any) inside the
> wheel, thats why we get  cpython-312-x86_64-linux-musl for suffix,
> what pyo/maturin is doing is right, however how OE does it in python
> itself seems to be wrong to me, its synthesizing the OSABI
> incorrectly.
> where 'environment' value is not right. However, this is same
> everywhere so it works, so long as the modules are built using
> setuptools.
> since SOABI is part of "_sysconfigdata" and its an OE generated file,
> Perhaps it can consider the musl/gnu difference and emit SOABI
> accordingly. Something like below
>
> https://snips.sh/f/L6QspcdxjL
>
> might be able to fix the python interpreter's logic.

To close this thread. I have sent an alternative patch which fixes it
in python3 itself.
https://lore.kernel.org/openembedded-core/20240605064317.1646597-1-raj.khem=
@gmail.com/T/#t

>
> > >
> > > Also, there is not even a comment above saying why we need to do this=
.
> > >
> >
> > I added the log showing how it does not work, I thought that is showing=
 how
> > it's not working at all when using musl. If you have better idea what I=
 should
> > add to commit msg to make it better, let me know I will send a v2.
> >
> > > Cheers,
> > >
> > > Richard

