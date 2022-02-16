Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A702C433FE
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 07:54:33 +0000 (UTC)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com
 [209.85.217.42])
 by mx.groups.io with SMTP id smtpd.web10.9327.1644998070265483197
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Feb 2022 23:54:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jAZJqS1Z;
 spf=pass (domain: gmail.com, ip: 209.85.217.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f42.google.com with SMTP id j20so1522310vsg.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Feb 2022 23:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cbDp7+P/5H4+/wDJzfKmzCetJiWadwNsJjtv7ouiysc=;
        b=jAZJqS1Zexuic/gcnDajl6GoEKxxd0CNtA3uqVn5g4sHdXZzcPHi0WQ3etYbX1acJr
         PlPfMdq7uh1DARlFth+BeEOht96aw1M2UGTG3cwWVoDuOHSdvolCKbcWzk2ZQkF+U2Qo
         CsrDYuP1QRlFXbgSIGeKB62N3h4RLoml38aIyL4FZ+qzzPE8a/rZt5BDz663EiqFp7i1
         ECC1/I7bBA7lve2DyAOUazwkH8hd/iyoX6uuUVpsPIHRpuEkkpYLiRVRP3R9/AqVXyBF
         K0YjPVs2tyk9ra0KqrXKieuarkwzFdJgpwP8tQftyjD5Z6QHcEi+KVKAmBxfuAZEq1gg
         Jusg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cbDp7+P/5H4+/wDJzfKmzCetJiWadwNsJjtv7ouiysc=;
        b=BCxC0F9yPBLOtGlqqJCNB/AQ/NPQ3K1jLqJXoVZ41nCyhxpGGR054hlMQfdOOXxjN4
         5huRXshsakPsCtl5uCF4qMw4c2bbvbOCIuxoe4jkwLIRdFIJ1ajuppp97bG+v654u5Vg
         NSa057vj49NJ4oMYTtsdn/MHcJWKDkuaBYTn4n3+f/gpgUe6YMICgdc3/iLhAZx3fWS+
         idah9pkk6atkLGVtsEV/+DYCuA3xpFLnFe/W+jVr/Os70MQId3xgzfcOMwvQYgbodB5O
         9JaeiXW285JRP0WIJXBPada1G3m8uusiTThmeKHXINUBAPZWuRvkt7Fp3upmjz8mY/Kb
         T0Ow==
X-Gm-Message-State: AOAM531tWClfPj7ou2T2hmg8f6lV/Ng7g+aSXd8nAbeIsqIQRYYTDzOd
	y4hbgoWIdFCTvXnrEDo3cEUL8FLv5jTJNlQUTh0=
X-Google-Smtp-Source: 
 ABdhPJwN+alW/z/+JQxp7DhXHeg6LYg7xRcvXPj+tnOFAiYn3ch+1RvU2VKHI7ioB3nFgX6vcq1rMBaF4y9G6H2Hyds=
X-Received: by 2002:a05:6102:20d1:b0:30e:dfe6:de1a with SMTP id
 i17-20020a05610220d100b0030edfe6de1amr445781vsr.73.1644998068850; Tue, 15 Feb
 2022 23:54:28 -0800 (PST)
MIME-Version: 1.0
References: <20220216025429.33339-1-hongxu.jia@windriver.com>
In-Reply-To: <20220216025429.33339-1-hongxu.jia@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 16 Feb 2022 08:54:17 +0100
Message-ID: 
 <CANNYZj9+HxkRdxFC8wG1Vhg2Q5=hLsEzzhGq3DV+6QFzmmdefQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc: fix create thread failed in unprivileged
 process
To: hongxu <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
 Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Feb 2022 07:54:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161770

This is presumably to support builds on some old distribution, so it
would help if you specify which distribution and which versions of
docker require this. Otherwise we'll never know when we can drop the
patch.

Alex

On Wed, 16 Feb 2022 at 03:54, hongxu <hongxu.jia@windriver.com> wrote:
>
> Since upstream commit [d8ea0d0168 Add an internal wrapper for clone, clone2
> and clone3] applied, start a unprivileged container (docker run without
> --privileged), it creates a thread failed in container.
>
> In commit d8ea0d0168, it calls __clone3 if HAVE_CLONE3_WAPPER is defined.  If
> __clone3 returns -1 with ENOSYS, fall back to clone or clone2.
>
> As known from [1], cloneXXX fails with EPERM if CLONE_NEWCGROUP,
> CLONE_NEWIPC, CLONE_NEWNET, CLONE_NEWNS, CLONE_NEWPID, or CLONE_NEWUTS
> was specified by an unprivileged process (process without CAP_SYS_ADMIN)
>
> [1] https://man7.org/linux/man-pages/man2/clone3.2.html
>
> So if __clone3 returns -1 with EPERM, fall back to clone or clone2 could
> fix the issue.
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  ...d-failed-in-unprivileged-process-BZ-.patch | 88 +++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.35.bb         |  1 +
>  2 files changed, 89 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/0024-fix-create-thread-failed-in-unprivileged-process-BZ-.patch
>
> diff --git a/meta/recipes-core/glibc/glibc/0024-fix-create-thread-failed-in-unprivileged-process-BZ-.patch b/meta/recipes-core/glibc/glibc/0024-fix-create-thread-failed-in-unprivileged-process-BZ-.patch
> new file mode 100644
> index 0000000000..b431ea168d
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0024-fix-create-thread-failed-in-unprivileged-process-BZ-.patch
> @@ -0,0 +1,88 @@
> +From 6609858239b8f94e12c19eac0cec425511d1211f Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Sun, 29 Aug 2021 20:49:16 +0800
> +Subject: [PATCH] fix create thread failed in unprivileged process [BZ #28287]
> +
> +Since commit [d8ea0d0168 Add an internal wrapper for clone, clone2 and clone3]
> +applied, start a unprivileged container (docker run without --privileged),
> +it creates a thread failed in container.
> +
> +In commit d8ea0d0168, it calls __clone3 if HAVE_CLONE3_WAPPER is defined.  If
> +__clone3 returns -1 with ENOSYS, fall back to clone or clone2.
> +
> +As known from [1], cloneXXX fails with EPERM if CLONE_NEWCGROUP,
> +CLONE_NEWIPC, CLONE_NEWNET, CLONE_NEWNS, CLONE_NEWPID, or CLONE_NEWUTS
> +was specified by an unprivileged process (process without CAP_SYS_ADMIN)
> +
> +[1] https://man7.org/linux/man-pages/man2/clone3.2.html
> +
> +So if __clone3 returns -1 with EPERM, fall back to clone or clone2 could
> +fix the issue. Here are the test steps:
> +
> +1) Prepare test code
> +cat > conftest.c <<ENDOF
> + #include <pthread.h>
> + #include <stdio.h>
> +
> +int check_me = 0;
> +void* func(void* data) {check_me = 42; printf("start thread: check_me %d\n", check_me); return &check_me;}
> +int main()
> +{
> +  pthread_t t;
> +  void *ret;
> +  pthread_create (&t, 0, func, 0);
> +  pthread_join (t, &ret);
> +  printf("check_me %d, p %p\n", check_me, &ret);
> +  return (check_me != 42 || ret != &check_me);
> +}
> +
> +ENDOF
> +
> +2) Compile
> +gcc -o conftest -pthread conftest.c
> +
> +3) Start a container with glibc 2.34 installed
> +[skip details]
> +docker run -it <container-image-name> bash
> +
> +4) Run conftest without this patch
> +$ ./conftest
> +check_me 0, p 0x7ffd91ccd400
> +
> +5) Run conftest with this patch
> +$ ./conftest
> +start thread: check_me 42
> +check_me 42, p 0x7ffe253c6f20
> +
> +Upstream-Status: Inappropriate [Rejected by upstream]
> +
> +Upstream glibc rejected it because the latest docker has resolved the issue [1],
> +and upstream glibc does not backward compatibility with old docker[2]
> +
> +In order to build Yocto with uninative in old docker, we need this local
> +patch
> +
> +[1] https://github.com/moby/moby/commit/9f6b562dd12ef7b1f9e2f8e6f2ab6477790a6594
> +[2] https://sourceware.org/pipermail/libc-alpha/2021-August/130590.html
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + sysdeps/unix/sysv/linux/clone-internal.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/sysdeps/unix/sysv/linux/clone-internal.c b/sysdeps/unix/sysv/linux/clone-internal.c
> +index a71effcbd3..a0569113aa 100644
> +--- a/sysdeps/unix/sysv/linux/clone-internal.c
> ++++ b/sysdeps/unix/sysv/linux/clone-internal.c
> +@@ -52,7 +52,7 @@ __clone_internal (struct clone_args *cl_args,
> +   /* Try clone3 first.  */
> +   int saved_errno = errno;
> +   ret = __clone3 (cl_args, sizeof (*cl_args), func, arg);
> +-  if (ret != -1 || errno != ENOSYS)
> ++  if (ret != -1 || (errno != ENOSYS && errno != EPERM))
> +     return ret;
> +
> +   /* NB: Restore errno since errno may be checked against non-zero
> +--
> +2.27.0
> +
> diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
> index 2903a4001f..b785b61154 100644
> --- a/meta/recipes-core/glibc/glibc_2.35.bb
> +++ b/meta/recipes-core/glibc/glibc_2.35.bb
> @@ -47,6 +47,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>             file://0021-Replace-echo-with-printf-builtin-in-nscd-init-script.patch \
>             file://0022-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch \
>             file://0023-timezone-Make-shell-interpreter-overridable-in-tzsel.patch \
> +           file://0024-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
>             "
>  S = "${WORKDIR}/git"
>  B = "${WORKDIR}/build-${TARGET_SYS}"
> --
> 2.27.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161764): https://lists.openembedded.org/g/openembedded-core/message/161764
> Mute This Topic: https://lists.openembedded.org/mt/89178137/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

