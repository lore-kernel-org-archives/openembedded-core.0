Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EE7FC77B7C
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 23:31:30 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web10.15308.1683243086811252679
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 May 2023 16:31:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ktfuu3c7;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-1924ec320c5so960408fac.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 16:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683243086; x=1685835086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a6gfnvz9ySGRqs9NAlONBqNT8+P39q8lF/Fl6EIkolw=;
        b=ktfuu3c7tBr5OLm5Vlncyb7mXwz4FXrLSfHBsJt310DNLwJcR61wlCX9i5vJZoLx/s
         B8WEkNALvttRBdn5y/BCwCZINKM1/ZOwV7pTxuLuKtzaz5IKGDMpIgIQ5mgh9dMhQ5Jo
         ldMQCZ/4RHjpC0xwFFMj7FaqO0/V61EeN/AdnTvVSIETKAN2hAaighzEiTp8xMenGK26
         AvLmJVR7CMOR2NmV8EWoke33eQ5ParnnuDiWVlIHnwJdRtKGejJQza2NchvUHZiF+x3a
         l5ea0U2Bym0g//ptYl6tUw1rRKN6+9hXl0szm+mFQOGgwm8m8AP15YJjuR2RO4Sy3CAh
         XOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683243086; x=1685835086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a6gfnvz9ySGRqs9NAlONBqNT8+P39q8lF/Fl6EIkolw=;
        b=CRLPHMq9djbTy5005NjGV76aExRC8Lt+g5tHhS3Wj9dBvgZlJb9ltnLhvYnFtD90R4
         4Hk72AANNRsD7OCa+JIVJ/9YWI+ifFEqbYIV98JXqFg3Nqa/l4XXEJY0gDJ/aFkYBlQr
         HYvklXZ1z8IGzIxB92DxIQMrqEFuYW/DlRzcchJFtCV/ZehWeNGCWRcrL2GOY+oJbJC9
         0XLJnM2fQEduHj/U+HJG80ZRLVQWkcjiHf26Ju0NE11HqnE4OXuRbIl9t3qsSSlO7pt4
         SLSbRynRU3zlRl7pw+npLio8zqThzVxH9nHRJ5SQaeNKeAtVF/ZEurLUZtCcjZkS5Idw
         YCvQ==
X-Gm-Message-State: AC+VfDzeZusHlZ21bcN77eDDUtf3tPjvQJAYmeZvXWImByoygQ3QxxLe
	sItkn6lXxTZVCRe4koBDX/aj+ekNRWvfcpuKiZIcBMae
X-Google-Smtp-Source: ACHHUZ6lQBGiSFWs53xaof0Jg6MyZxjVT7zZQEKJt4UCP2qlXL5yJFDNAteDetVg7DkidaohN7tw902PvKwaTwFijrI=
X-Received: by 2002:a05:6808:1918:b0:38d:8c66:783f with SMTP id
 bf24-20020a056808191800b0038d8c66783fmr3263888oib.3.1683243085919; Thu, 04
 May 2023 16:31:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230429012900.872374-1-raj.khem@gmail.com> <6a5ca0bf10350375f568163e3be93dfeed266d6f.camel@linuxfoundation.org>
In-Reply-To: <6a5ca0bf10350375f568163e3be93dfeed266d6f.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 4 May 2023 16:30:59 -0700
Message-ID: <CAMKF1spF7oF9VOrcj_O6qU_ZJTjZb2w6X5LU0H4xze7H22r5gQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cpio: Run ptests under ptest user
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 23:31:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180889

On Thu, May 4, 2023 at 2:16=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2023-04-28 at 18:29 -0700, Khem Raj wrote:
> > Running these tests under root user on musl works ok but it emits
> > additional diagnostic
> >
> > cpio: dir: Cannot change ownership to uid 0, gid 0: Not supported
> >
> > Ideally its better to run this test suite under non-root user which
> > is often how these are run. Moreover, tests work on musl as well.
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-extended/cpio/cpio-2.13/run-ptest   |  9 +--------
> >  .../cpio/cpio-2.13/{run-ptest =3D> test.sh}        |  0
> >  meta/recipes-extended/cpio/cpio_2.13.bb          | 16 ++++++++++++++++
> >  3 files changed, 17 insertions(+), 8 deletions(-)
> >  mode change 100644 =3D> 100755 meta/recipes-extended/cpio/cpio-2.13/ru=
n-ptest
> >  copy meta/recipes-extended/cpio/cpio-2.13/{run-ptest =3D> test.sh} (10=
0%)
> >
> > diff --git a/meta/recipes-extended/cpio/cpio-2.13/run-ptest b/meta/reci=
pes-extended/cpio/cpio-2.13/run-ptest
> > old mode 100644
> > new mode 100755
> > index f027574e86..f35a756d6b
> > --- a/meta/recipes-extended/cpio/cpio-2.13/run-ptest
> > +++ b/meta/recipes-extended/cpio/cpio-2.13/run-ptest
> > @@ -1,10 +1,3 @@
> >  #!/bin/sh
> >
> > -# Define cpio test work dir
> > -WORKDIR=3D@PTEST_PATH@/tests/
> > -
> > -# Run test
> > -cd ${WORKDIR}
> > -./atconfig ./atlocal ./testsuite
> > -
> > -./testsuite 2>&1 | grep -E '[0-9]{1,3}: ' | sed -e 's/^.....//' -e '/[=
ok]$/s/^/PASS: /;/FAILED (.*)/s/^/FAIL: /;/skipped (.*)/s/^/SKIP: /;/expect=
ed failure/ s/^/PASS: /;/UNEXPECTED PASS/s/^/FAIL: /' -e 's/ok$//g' -e 's/F=
AILED.*//g' -e 's/skipped.*//g' -e 's/expected failure.*//g' -e 's/UNEXPECT=
ED PASS.*//g'
> > +su -c ./test.sh ptest
> > diff --git a/meta/recipes-extended/cpio/cpio-2.13/run-ptest b/meta/reci=
pes-extended/cpio/cpio-2.13/test.sh
> > similarity index 100%
> > copy from meta/recipes-extended/cpio/cpio-2.13/run-ptest
> > copy to meta/recipes-extended/cpio/cpio-2.13/test.sh
> > diff --git a/meta/recipes-extended/cpio/cpio_2.13.bb b/meta/recipes-ext=
ended/cpio/cpio_2.13.bb
> > index df5e09cae8..943fa9b3ab 100644
> > --- a/meta/recipes-extended/cpio/cpio_2.13.bb
> > +++ b/meta/recipes-extended/cpio/cpio_2.13.bb
> > @@ -14,6 +14,7 @@ SRC_URI =3D "${GNU_MIRROR}/cpio/cpio-${PV}.tar.gz \
> >             file://0001-Use-__alignof__-with-clang.patch \
> >             file://0001-Wrong-CRC-with-ASCII-CRC-for-large-files.patch =
\
> >             file://run-ptest \
> > +           file://test.sh \
> >             "
> >
> >  SRC_URI[md5sum] =3D "389c5452d667c23b5eceb206f5000810"
> > @@ -57,9 +58,24 @@ do_install_ptest() {
> >      install --mode=3D755 ${B}/tests/atlocal ${D}${PTEST_PATH}/tests/
> >      install --mode=3D755 ${B}/tests/genfile ${D}${PTEST_PATH}/tests/
> >      install --mode=3D755 ${S}/tests/testsuite ${D}${PTEST_PATH}/tests/
> > +    install --mode=3D755 ${WORKDIR}/test.sh ${D}${PTEST_PATH}/test.sh
> >      sed -i "s#@PTEST_PATH@#${PTEST_PATH}#g" ${D}${PTEST_PATH}/run-ptes=
t
> >  }
> >
> > +# ptest.bbclass currently chowns the ptest directory explicitly, so we=
 need to
> > +# change permission after that has happened so the ptest user can writ=
e a
> > +# temporary directory.
> > +do_install_ptest_base:append() {
> > +    chgrp -R ptest ${D}${PTEST_PATH}/
> > +    chmod -R g+w ${D}${PTEST_PATH}/
> > +}
> > +
> > +# The tests need to run as a non-root user, so pull in the ptest user
> > +DEPENDS:append:class-target =3D "${@bb.utils.contains('PTEST_ENABLED',=
 '1', ' ptest-runner', '', d)}"
> > +PACKAGE_WRITE_DEPS +=3D "ptest-runner"
> > +
> > +RDEPENDS:${PN}-ptest +=3D "ptest-runner"
> > +
> >  PACKAGES =3D+ "${PN}-rmt"
> >
> >  FILES:${PN}-rmt =3D "${sbindir}/rmt*"
>
> This seems to break the ptests as it stops returning results:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/5010

Good catch and my bad, I forgot to move PTEST_PATH substitution to
test.sh, sent a v2 which should fix it

>
> Cheers,
>
> Richard
>

