Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6B7BC25B76
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 17:49:45 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web10.848.1717436978832753772
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jun 2024 10:49:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YFz1U99u;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3d1d3c7f7c6so2743613b6e.3
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 10:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717436978; x=1718041778; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=12klszO+yBilUuf13V2BVs7wYkv3ysxRMnk+C1WQo48=;
        b=YFz1U99u0VVWC1cBvYhhtTxh6qIIuYkVHnzVkFan93stO4vqOlXKf1hFbGe4Kh+7Gv
         DhDOm04RnmX4uEJtOEovX3AJpMs3G7Bon8PhtacwYt63tyxZCn1RPmnsHGYo+cNLZlby
         sOLstIDWmCKROMyxVO4Wt3aCveUfrnV8F4q3mJS4rpJivjFfgfs4nWMYuH4SxDQc+4Vk
         yyHiYT8KkRC4qZlr2Z9AeND+VIr4n1Lr1v4rnXgodf9AoKfdh29VDK84u3f+mPZynRPu
         Ka9yB+vHfZt5TOuiaYdvjdHIzDSOZ9TIJOOwpsQ7UVnVRjA9TkWVw5z3746GlaWa52sg
         3YmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717436978; x=1718041778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=12klszO+yBilUuf13V2BVs7wYkv3ysxRMnk+C1WQo48=;
        b=Zuf+FsNzK05TfnIs2j91ozBemg678oZg6q2k9zgW3IRjurj/X8AqA8ZQN+WynlVo4v
         k4dQLPOlfq7ifP4Ixu44B/ikseGYvMAUK423tUFj8+hPND5tVsqo6OdwkC6qxGQwVg5q
         +r8GaAWAngHXxp2Zdu3a4EAnxnRGdzghOBc/KTU++RbBss0A1YIgfiL4TatBcNhcqrl9
         yasoFwpR1jP9E1n3Fqc/A9c6v5RYmufJM+A36xAS7fhyNySR9JaKzxcdQIYbvERThJ8r
         qVuhwsM2BbHN12YzSVofIqghYE7PlkYrt6cEU2sZM2HqsyoBRtVD+OtDJDIvVHaVGbAt
         cx1w==
X-Gm-Message-State: AOJu0YxlhSzX51imWGMeQENWzbGVN/EntO43PSxBEbBsam8qeXIODx+4
	OXvIibiyqvT6ssZgMNLvNJCcpSVeknXYnWiGjfov0AGqUq+KZvCKmYZvQcEHkix2Pa4hOFbs41x
	fMTKGzV/x8x5smuSPZOuZbzfYV+I=
X-Google-Smtp-Source: AGHT+IHdL7VhMXoeztRjQ1mwc/lsjEoySL38BO1zAn1RQoTuqgqs83iwvOrPhvqd2z9YuF/JakxO+OnP3Wsw8FW6XZQ=
X-Received: by 2002:aca:1819:0:b0:3ca:b722:6883 with SMTP id
 5614622812f47-3d1e35c1135mr10314196b6e.40.1717436977764; Mon, 03 Jun 2024
 10:49:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240603162525.2940419-1-raj.khem@gmail.com> <1facaae48c6b1ea6e6b7640384a5e7ad79de5868.camel@linuxfoundation.org>
In-Reply-To: <1facaae48c6b1ea6e6b7640384a5e7ad79de5868.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Jun 2024 10:49:11 -0700
Message-ID: <CAMKF1sr5B27YZ6rjPma-tgh=jLdZO50eGomprLPjQtvc5bi9qA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-rpds-py: Create a symlink for cython
 module on musl
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 17:49:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200275

On Mon, Jun 3, 2024 at 9:35=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2024-06-03 at 09:25 -0700, Khem Raj via lists.openembedded.org
> wrote:
> > loader expects it to be called with 'linux-gnu' e.g
> > rpds.cpython-312-x86_64-linux-musl.so is created with musl
> > but loader expects it to called rpds.cpython-312-x86_64-linux-gnu.so
> >
> > Lets create the symlink to please the loader.
> >
> > Fixes
> > ImportError while importing test module '/usr/lib/python3-rpds-
> > py/ptest/tests/test_hash_trie_map.py'.
> > Hint: make sure your test modules/packages have valid Python names.
> > Traceback:
> > ../../python3.12/importlib/__init__.py:90: in import_module
> >     return _bootstrap._gcd_import(name[level:], package, level)
> > tests/test_hash_trie_map.py:36: in <module>
> >     from rpds import HashTrieMap
> > ../../python3.12/site-packages/rpds/__init__.py:1: in <module>
> >     from .rpds import *
> > E   ModuleNotFoundError: No module named 'rpds.rpds'
> > ERROR: tests/test_hash_trie_map.py:tests/test_hash_trie_map.py
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  .../recipes-devtools/python/python3-rpds-py_0.18.1.bb | 11
> > +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/meta/recipes-devtools/python/python3-rpds-py_0.18.1.bb
> > b/meta/recipes-devtools/python/python3-rpds-py_0.18.1.bb
> > index f46df1115c8..b1f0e100332 100644
> > --- a/meta/recipes-devtools/python/python3-rpds-py_0.18.1.bb
> > +++ b/meta/recipes-devtools/python/python3-rpds-py_0.18.1.bb
> > @@ -27,4 +27,15 @@ do_install_ptest() {
> >      cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
> >  }
> >
> > +do_install:append() {
> > +    for f in ${D}/${PYTHON_SITEPACKAGES_DIR}/rpds/rpds.cpython*.so
> > +    do
> > +        fname=3D`basename $f`
> > +        lname=3D`echo $fname | sed 's/musl/gnu/'`
> > +        if [ "$fname" !=3D "$lname" ]; then
> > +            mv $f ${D}/${PYTHON_SITEPACKAGES_DIR}/rpds/$lname
> > +        fi
> > +    done
> > +}
> > +
> >  BBCLASSEXTEND =3D "native nativesdk"
> >
>
> This feels like the kind of workaround that will live forever. Can we
> not fix the loader to use the right name?

OE's python interpreter is cross-built and we end up using OSABI which
is detected during build 'linux-gnu', this seems to work fine for most of
python modules since they get the OSABI from the sysconfigdata so it
all works even though the OSABI is called linux-gnu, however some modules
like this one which are using maturin to build, seems to get the OSABI
equivalent differently, I am no expert on maturin but maybe someone knows
how it happens. This problem is seen with several python modules built with
OE,  see

https://github.com/meta-homeassistant/meta-homeassistant/issues/89
https://github.com/pypa/auditwheel/issues/349

also see how it is fixed in python3-pydantic-core on meta-python
https://git.openembedded.org/meta-openembedded/tree/meta-python/recipes-dev=
tools/python/python3-pydantic-core_2.16.3.bb#n38

Hopefully musllinux ABI tag will be sorted in pypa and this will work bette=
r
however, we also need to see how we are encoding OSABI in python builds

e.g. on qemux86-64 musl target I get

root@qemux86-64:~# python3
Python 3.12.3 (main, Apr  9 2024, 08:09:14) [Clang 19.0.0
(/home/kraj/work/llvm-project 4152c5f5ae88d8d5fe99d20b525b35f14db2 on
linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import sysconfig
>>> sysconfig.get_config_var('SOABI')
'cpython-312-x86_64-linux-gnu'

>
> Also, there is not even a comment above saying why we need to do this.
>

I added the log showing how it does not work, I thought that is showing how
it's not working at all when using musl. If you have better idea what I sho=
uld
add to commit msg to make it better, let me know I will send a v2.

> Cheers,
>
> Richard

