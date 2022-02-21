Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F6BC433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 12:19:56 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.10121.1645445995464552828
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 04:19:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=efMiXEw9;
 spf=pass (domain: burtonini.com, ip: 209.85.221.50,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f50.google.com with SMTP id m27so14956928wrb.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 04:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zFC449lNRToHTbLgvm1BHMq+MLlvzKPb63/uCYQUj8s=;
        b=efMiXEw9193YiI2zGM4agY0oi81bvycCzvrw93wOl+kaxbW5/DgDEOCMximNRlu9In
         Kl4cIkSiJTNE9znTijt5r+9K71a4qZxUGWnUGRF9W9YzWcyahT5smFU4i/3x8pOMau76
         w+xcHocuah23Y3oO4YWFoyl+7hst22+a4ilC0pfNofgOVBCb6M5UCmnSb0kKL6WP8qE8
         mYSt2wMf7WXZU/L+0n0Ca+EROmAcBuRTkntw7pPnUfCESy6cVpSgTooxN+1RqH0TVLwm
         qUfxg+4JIDW61L1Hjzs8ilXgMaYnSSfG0ZQD94Px2l03smVdxnNsYzVFpU5RrnomeYrc
         Fx3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zFC449lNRToHTbLgvm1BHMq+MLlvzKPb63/uCYQUj8s=;
        b=kX3nP5X2EbWfsQo3Ms3kPSUdqYnw3kiWkLcD+ICJCx/HCJw33bCEGnQA3WL5wcLBOD
         R+wMFNPbMvqZfNXDqRBXgxSvAuENeNL5BAVM5UPCW1pbCM4ga0pskBwLomMXOR9VUvnD
         cy5sAuEqmjpG7KkpQt78tcq3wMLQeNiGcNHjaiJ4Toj1fhcR7ftmztLA4g5HNMhu+y/V
         qK80T3dfZq9zDXRaeJioOMXBWzMpT9tIPO9qjVPkHjkwvH5XTsJ/SPyxhHs6gj/SVH3d
         YWa7GM0ALl0gsqKVh15W9bGTh/ayJn/gZAxhlh/QBr7vY21d/mOeD4VMRJ3hCgmcW60/
         f8kw==
X-Gm-Message-State: AOAM5316m62/fr54/agQqlC2Nm8B8w3ZZxr7yDhF890CZf6uMzHi4o12
	zAuEZIq6auCz+zuNCryUTJ6Ym3VwKrTD6jbOXxFB4Q==
X-Google-Smtp-Source: 
 ABdhPJzsEFDlyQu0K4SCpLZhA4I8IqnjdDnL/wycU2YPTFpaDnz0alODrawkFMFZAe08l0ICUDpoa9Vc008dwPXWQx0=
X-Received: by 2002:adf:ee0d:0:b0:1e3:f28:487f with SMTP id
 y13-20020adfee0d000000b001e30f28487fmr15478442wrn.620.1645445993696; Mon, 21
 Feb 2022 04:19:53 -0800 (PST)
MIME-Version: 1.0
References: <20220216025429.33339-1-hongxu.jia@windriver.com>
 <CANNYZj9+HxkRdxFC8wG1Vhg2Q5=hLsEzzhGq3DV+6QFzmmdefQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9+HxkRdxFC8wG1Vhg2Q5=hLsEzzhGq3DV+6QFzmmdefQ@mail.gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Mon, 21 Feb 2022 12:19:42 +0000
Message-ID: 
 <CAAnfSTuGmKo8Jg42PPEc02pThgL0gUUp=i0QyrUPFntLYbbigA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc: fix create thread failed in unprivileged
 process
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: hongxu <hongxu.jia@windriver.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
 Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 12:19:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162025

Agreed.  Our CI used to hit this problem but we were missing some
upgrades on one of the runners, and now we don't need it.

Ross

On Wed, 16 Feb 2022 at 07:54, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> This is presumably to support builds on some old distribution, so it
> would help if you specify which distribution and which versions of
> docker require this. Otherwise we'll never know when we can drop the
> patch.
>
> Alex
>
> On Wed, 16 Feb 2022 at 03:54, hongxu <hongxu.jia@windriver.com> wrote:
> >
> > Since upstream commit [d8ea0d0168 Add an internal wrapper for clone, clone2
> > and clone3] applied, start a unprivileged container (docker run without
> > --privileged), it creates a thread failed in container.
> >
> > In commit d8ea0d0168, it calls __clone3 if HAVE_CLONE3_WAPPER is defined.  If
> > __clone3 returns -1 with ENOSYS, fall back to clone or clone2.
> >
> > As known from [1], cloneXXX fails with EPERM if CLONE_NEWCGROUP,
> > CLONE_NEWIPC, CLONE_NEWNET, CLONE_NEWNS, CLONE_NEWPID, or CLONE_NEWUTS
> > was specified by an unprivileged process (process without CAP_SYS_ADMIN)
> >
> > [1] https://man7.org/linux/man-pages/man2/clone3.2.html
> >
> > So if __clone3 returns -1 with EPERM, fall back to clone or clone2 could
> > fix the issue.
> >
> > Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > ---
> >  ...d-failed-in-unprivileged-process-BZ-.patch | 88 +++++++++++++++++++
> >  meta/recipes-core/glibc/glibc_2.35.bb         |  1 +
> >  2 files changed, 89 insertions(+)
> >  create mode 100644 meta/recipes-core/glibc/glibc/0024-fix-create-thread-failed-in-unprivileged-process-BZ-.patch
> >
> > diff --git a/meta/recipes-core/glibc/glibc/0024-fix-create-thread-failed-in-unprivileged-process-BZ-.patch b/meta/recipes-core/glibc/glibc/0024-fix-create-thread-failed-in-unprivileged-process-BZ-.patch
> > new file mode 100644
> > index 0000000000..b431ea168d
> > --- /dev/null
> > +++ b/meta/recipes-core/glibc/glibc/0024-fix-create-thread-failed-in-unprivileged-process-BZ-.patch
> > @@ -0,0 +1,88 @@
> > +From 6609858239b8f94e12c19eac0cec425511d1211f Mon Sep 17 00:00:00 2001
> > +From: Hongxu Jia <hongxu.jia@windriver.com>
> > +Date: Sun, 29 Aug 2021 20:49:16 +0800
> > +Subject: [PATCH] fix create thread failed in unprivileged process [BZ #28287]
> > +
> > +Since commit [d8ea0d0168 Add an internal wrapper for clone, clone2 and clone3]
> > +applied, start a unprivileged container (docker run without --privileged),
> > +it creates a thread failed in container.
> > +
> > +In commit d8ea0d0168, it calls __clone3 if HAVE_CLONE3_WAPPER is defined.  If
> > +__clone3 returns -1 with ENOSYS, fall back to clone or clone2.
> > +
> > +As known from [1], cloneXXX fails with EPERM if CLONE_NEWCGROUP,
> > +CLONE_NEWIPC, CLONE_NEWNET, CLONE_NEWNS, CLONE_NEWPID, or CLONE_NEWUTS
> > +was specified by an unprivileged process (process without CAP_SYS_ADMIN)
> > +
> > +[1] https://man7.org/linux/man-pages/man2/clone3.2.html
> > +
> > +So if __clone3 returns -1 with EPERM, fall back to clone or clone2 could
> > +fix the issue. Here are the test steps:
> > +
> > +1) Prepare test code
> > +cat > conftest.c <<ENDOF
> > + #include <pthread.h>
> > + #include <stdio.h>
> > +
> > +int check_me = 0;
> > +void* func(void* data) {check_me = 42; printf("start thread: check_me %d\n", check_me); return &check_me;}
> > +int main()
> > +{
> > +  pthread_t t;
> > +  void *ret;
> > +  pthread_create (&t, 0, func, 0);
> > +  pthread_join (t, &ret);
> > +  printf("check_me %d, p %p\n", check_me, &ret);
> > +  return (check_me != 42 || ret != &check_me);
> > +}
> > +
> > +ENDOF
> > +
> > +2) Compile
> > +gcc -o conftest -pthread conftest.c
> > +
> > +3) Start a container with glibc 2.34 installed
> > +[skip details]
> > +docker run -it <container-image-name> bash
> > +
> > +4) Run conftest without this patch
> > +$ ./conftest
> > +check_me 0, p 0x7ffd91ccd400
> > +
> > +5) Run conftest with this patch
> > +$ ./conftest
> > +start thread: check_me 42
> > +check_me 42, p 0x7ffe253c6f20
> > +
> > +Upstream-Status: Inappropriate [Rejected by upstream]
> > +
> > +Upstream glibc rejected it because the latest docker has resolved the issue [1],
> > +and upstream glibc does not backward compatibility with old docker[2]
> > +
> > +In order to build Yocto with uninative in old docker, we need this local
> > +patch
> > +
> > +[1] https://github.com/moby/moby/commit/9f6b562dd12ef7b1f9e2f8e6f2ab6477790a6594
> > +[2] https://sourceware.org/pipermail/libc-alpha/2021-August/130590.html
> > +
> > +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > +---
> > + sysdeps/unix/sysv/linux/clone-internal.c | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/sysdeps/unix/sysv/linux/clone-internal.c b/sysdeps/unix/sysv/linux/clone-internal.c
> > +index a71effcbd3..a0569113aa 100644
> > +--- a/sysdeps/unix/sysv/linux/clone-internal.c
> > ++++ b/sysdeps/unix/sysv/linux/clone-internal.c
> > +@@ -52,7 +52,7 @@ __clone_internal (struct clone_args *cl_args,
> > +   /* Try clone3 first.  */
> > +   int saved_errno = errno;
> > +   ret = __clone3 (cl_args, sizeof (*cl_args), func, arg);
> > +-  if (ret != -1 || errno != ENOSYS)
> > ++  if (ret != -1 || (errno != ENOSYS && errno != EPERM))
> > +     return ret;
> > +
> > +   /* NB: Restore errno since errno may be checked against non-zero
> > +--
> > +2.27.0
> > +
> > diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
> > index 2903a4001f..b785b61154 100644
> > --- a/meta/recipes-core/glibc/glibc_2.35.bb
> > +++ b/meta/recipes-core/glibc/glibc_2.35.bb
> > @@ -47,6 +47,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
> >             file://0021-Replace-echo-with-printf-builtin-in-nscd-init-script.patch \
> >             file://0022-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch \
> >             file://0023-timezone-Make-shell-interpreter-overridable-in-tzsel.patch \
> > +           file://0024-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
> >             "
> >  S = "${WORKDIR}/git"
> >  B = "${WORKDIR}/build-${TARGET_SYS}"
> > --
> > 2.27.0
> >
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161770): https://lists.openembedded.org/g/openembedded-core/message/161770
> Mute This Topic: https://lists.openembedded.org/mt/89178137/1676615
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ross@burtonini.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

