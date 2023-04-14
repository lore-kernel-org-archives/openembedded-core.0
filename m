Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64461C77B6E
	for <webhook@archiver.kernel.org>; Fri, 14 Apr 2023 16:11:52 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web10.14589.1681488707167371584
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Apr 2023 09:11:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=XFnryTSL;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-187bee46f9dso830506fac.11
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Apr 2023 09:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681488706; x=1684080706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZsCbC28hUcpHsL/QUe1yUlizjpWnq9XuVunkANDQ18=;
        b=XFnryTSLYpSw7E6cwTDiycmdvyU6UyqBdS45FbnMk0HSamJ54moUzaYdm8wVu8hwiy
         2qUnHJuhxXx2EtkP+WRV4Jl490g5wnGrN3VJRzRSJB/O5G91byMbpx0yNkZzR1W8RFAu
         SIySlJDDoLT1+MfXWUb6NlngWkyHAiRfQv24KH9KV4ql6MgcQlUW6Wqya3HKN8qpSmEZ
         0hJEa38w9DthfiMRT3vYF64psad0GgfwFnlA9YWRN2/e5+RFmoPt4GFRK1/asN5Ki61X
         mdLz4pjEcwW69ieeNGIA5vnuBY6Deb4JFAa2Uc5y75Hx5FWKw7RxXK8P5zUXb0Snz76Y
         4j1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681488706; x=1684080706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XZsCbC28hUcpHsL/QUe1yUlizjpWnq9XuVunkANDQ18=;
        b=ZmzDkP6Z6g/guPhe2ZjOTz8Ox/mgefl0Qso1h9fRTslkrpFO1bvYMVspQo4FK79c4i
         BOTNeLOcFPuimnso2e65kxJVuiJydoqBDaKR4Z/sZxrDs5NoPjJqy6t2n+4Tnsxwl8NC
         o2qBlsSP8dMe2MQvk9iVC9TPkhvq5UyEFU64fQQrsLimyeiN6vUYn4OSrWZ9ztAjXkRw
         GKwaRzdtIbpZIEJCsvTicQpk53qPkSTAAbK30adqKgNFSb4T/oKnRqIdv6YimiRh2QID
         BBpqP0Io4J6EZziqgUM3DWTTwWcohzYiZ3pfT6DaoBLAP1uSEQnYt0EoEpAIlu7u4wWO
         e9bg==
X-Gm-Message-State: AAQBX9fAo0YwA3W2yMWOtPqwMHypYmGTzNO7g2Kw/Ermb/gvhkzQdH2N
	ogplv1sSTc4VFysLkXPn1lK0uvddj6VkfzYF/Y4=
X-Google-Smtp-Source: AKy350afFyExPLTUGIfhAuqfw8UCfst8mkiqRmBkAkGLS2SRdaR+6nCz1+xwewsl2WVI7YUBAUjX7/hNPQTcQtwHX5I=
X-Received: by 2002:a05:6870:d622:b0:17e:915c:84a2 with SMTP id
 a34-20020a056870d62200b0017e915c84a2mr3246570oaq.4.1681488706113; Fri, 14 Apr
 2023 09:11:46 -0700 (PDT)
MIME-Version: 1.0
References: <1681462400-3660-1-git-send-email-qiutt@fujitsu.com> <1efe32dfbfba7491c672f81571bd950c629f1d79.camel@linuxfoundation.org>
In-Reply-To: <1efe32dfbfba7491c672f81571bd950c629f1d79.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Apr 2023 09:11:19 -0700
Message-ID: <CAMKF1srH4rxtr6srtJvNZEpfPZhfYR_jOshBrZomSAGEy2JYuA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V1] coreutils: Add gcc parameter for ptest
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "qiutt@fujitsu.com" <qiutt@fujitsu.com>, openembedded-core@lists.openembedded.org, 
	fnstml-fujitsuten@fujitsu.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Apr 2023 16:11:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180003

On Fri, Apr 14, 2023 at 3:06=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2023-04-14 at 16:53 +0800, qiutt@fujitsu.com wrote:
> > From: Qiu Tingting <qiutt@fujitsu.com>
> >
> > If gcc is installed in image, ptest result has 4 ERROR.
> >   ERROR: tests/rm/r-root.sh
> >   ERROR: tests/rm/rm-readdir-fail.sh
> >   ERROR: tests/cp/nfs-removal-race.sh
> >   ERROR: tests/ls/getxattr-speedup.sh
> >
> > r-root.log as an example:
> >   --------------------------
> >   k.c:1:10: fatal error: stdio.h: No such file or directory
> >       1 | #include <stdio.h>
> >         |          ^~~~~~~~~
> >   compilation terminated.
> >   r-root.sh: set-up failure: failed to build shared library
> >   ERROR tests/rm/r-root.sh (exit status: 99)
> >   --------------------------
> >
> > reason:
> >   In these cases, k.c file is created and compiled by gcc before run.
> >   There is a stdio.h file in /usr/include/ directory,
> >   but gcc parameter is not set it.
> >
> > solution:
> >   Add "-l /usr/include/" in gcc parameter.
> >
> > other:
> >   If gcc is not installed in image, these cases will be skipped.
> >
> > Signed-off-by: Qiu Tingting <qiutt@fujitsu.com>
> > ---
> >  meta/recipes-core/coreutils/coreutils_9.1.bb | 1 +
> >  1 file changed, 1 insertion(+)
>
>
> I'm a bit puzzled by this. Wouldn't on target gcc have /usr/include as
> part of it's default search path? Why isn't the default search path
> working?

yeah. Perhaps looking at full compiler commandline used just for this
test would help maybe there is something like
-ffreestanding or something passed to it.

>
> Cheers,
>
> Richard
>
>
> >
> > diff --git a/meta/recipes-core/coreutils/coreutils_9.1.bb b/meta/recipe=
s-core/coreutils/coreutils_9.1.bb
> > index 4807eefd04..fe785b673d 100644
> > --- a/meta/recipes-core/coreutils/coreutils_9.1.bb
> > +++ b/meta/recipes-core/coreutils/coreutils_9.1.bb
> > @@ -184,6 +184,7 @@ do_install_ptest () {
> >      install ${S}/build-aux/test-driver ${D}${PTEST_PATH}/build-aux/
> >      cp ${B}/Makefile ${D}${PTEST_PATH}/
> >      cp ${S}/init.cfg ${D}${PTEST_PATH}/
> > +    sed -i 's/CC -Wall -shared/CC -Wall -shared -l \/usr\/include\//g'=
 ${D}${PTEST_PATH}/init.cfg
> >      cp -r ${B}/src ${D}${PTEST_PATH}/
> >      cp -r ${S}/src/*.c ${D}${PTEST_PATH}/src
> >      sed -i '/^VPATH/s/=3D .*$/=3D ./g' ${D}${PTEST_PATH}/Makefile
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179996): https://lists.openembedded.org/g/openembedde=
d-core/message/179996
> Mute This Topic: https://lists.openembedded.org/mt/98258324/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

