Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26920CD128A
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 19:58:46 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web10.2019.1712001518961943136
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 12:58:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LMkTKHXY;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5a50880ce2aso2782617eaf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 12:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712001518; x=1712606318; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jjiAXATtdXE8y7LXU/7GbzA+foWqkNQT3yzOX/a6E4o=;
        b=LMkTKHXYgfYWrQTplzsI28VTRj/RYZsjQEkhksXh2wqRSTBtJcxSIzD2K0gEgRH/AY
         3ZlHtokRGZZoTR5QiVs026/R73fzS1MJyQ2eHgS/MolSYcNqfgy0IrYsr7T+Wm8WV1q0
         DZL19tiaT/5NxRbVmbRyWbjf716UIQmOmoy8DljToEe3iS1BS/vSlV1AjEErS2iOajwW
         szx3bZuq34D5EP4oP7xQJP6CZ/gspRVWDdT4F1zSJFHHw9uli1yrtobxLKY+YKWMMw3V
         O8Fm49NHQFG8G3Tfirf+7KvFJNfhxzrRrgA3Ew97U1/kXlxTZZ+6uoFv3T5WZDnz6odk
         aVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712001518; x=1712606318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jjiAXATtdXE8y7LXU/7GbzA+foWqkNQT3yzOX/a6E4o=;
        b=B4cq4uGZsl5TsyhE9OKA62BcfOev5Au7E5u8whAVXNLJ5LW4E0qxT+aYqd/k7EF0Qw
         ZdM73UjUG+XiF/swSN70HCpGhyRzKostsstimVIns7tNrnKpxGvzvZt9PrKPt2SqDRD5
         3B1LqjQhcH7TSCWGRH1E56BZsjQmVh6DWjBPbywnjWjEKXHfDFQcB2K4xcVhdKL1Kjuf
         GvmJhAPgL4OhnXaM2/SZ9t3EAu1x7QefaD2NBZ+D/55864oXKNw7krHAYsReDEo/uMdg
         SNKBtaEHXMVv0A3ieebnFqdvcw8U0jwJxCIxgfKvpTE4bBbUSvNlxf5PNpZG1QInqB5C
         kfzQ==
X-Gm-Message-State: AOJu0YyWGyb24PP/M+iawEyUTwtJZ3xB9zgE55z3L9B2x+GUgVRUfosM
	7Tx87hdsZjfZj1KQ7qLGShMxyU8EuxVxtASAAY0Kl9wKKPVmHmCZs5a+8X3PPXdOZSXnl9AbWy4
	4WJhMeXERPRMQxeJwzzsg6LkDsww=
X-Google-Smtp-Source: AGHT+IGgTQVIq86qyD7+dl44K3QrAbFdBxQqfmv+jDXGnSbP0aIlPZzUELnAOzyFtrVh7r0zcmZPGIU5di90Iczawug=
X-Received: by 2002:a05:6870:ebc4:b0:22a:a6eb:19c5 with SMTP id
 cr4-20020a056870ebc400b0022aa6eb19c5mr13382740oab.8.1712001518056; Mon, 01
 Apr 2024 12:58:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240401081011.479084-1-Yash.Shinde@windriver.com>
In-Reply-To: <20240401081011.479084-1-Yash.Shinde@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 1 Apr 2024 12:58:11 -0700
Message-ID: <CAMKF1spGJ_JjvgHezfhaEwuZHAmnyzK2vmWvqGps0AwOfbz2pg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc: Fix stale qemu processes left after
 glibc oe-selftest
To: Yash.Shinde@windriver.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, 
	Umesh.Kallapa@windriver.com, Naveen.Gowda@windriver.com, 
	Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 19:58:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197851

it would be better to disable them just for architectures where it
fails since it seems to be a workaround, it would be good to keep it
as small as possible

On Mon, Apr 1, 2024 at 1:10=E2=80=AFAM Shinde, Yash via lists.openembedded.=
org
<Yash.Shinde=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Yash Shinde <Yash.Shinde@windriver.com>
>
> qemumips and qemuppc were leaving stale processes behind after
> running glibc oe-selftest. During analysis, it was found that
> it was due to "tst-scm_rights" and "tst-scm_rights-time64" tests.
> Disable them so that there are no stale processes left behind.
>
> [YOCTO #15423]
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15423
>
> Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
> ---
>  .../glibc/glibc/0024-qemu-stale-process.patch | 45 +++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.39.bb         |  1 +
>  2 files changed, 46 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/0024-qemu-stale-process=
.patch
>
> diff --git a/meta/recipes-core/glibc/glibc/0024-qemu-stale-process.patch =
b/meta/recipes-core/glibc/glibc/0024-qemu-stale-process.patch
> new file mode 100644
> index 0000000000..c28fa31b89
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0024-qemu-stale-process.patch
> @@ -0,0 +1,45 @@
> +glibc: Fix stale qemu processes left after glibc oe-selftest
> +
> +qemumips and qemuppc were leaving stale processes behind after
> +running glibc oe-selftest. During analysis, it was found that
> +it was due to "tst-scm_rights" and "tst-scm_rights-time64" tests.
> +Disable them so that there are no stale processes left behind.
> +
> +[YOCTO #15423]
> +https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15423
> +
> +Upstream-Status: Inappropriate [oe-core specific]
> +Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
> +---
> +diff --git a/sysdeps/unix/sysv/linux/Makefile  b/sysdeps/unix/sysv/linux=
/Makefile
> +--- a/sysdeps/unix/sysv/linux/Makefile    2024-03-18 01:15:49.019202881 =
-0700
> ++++ b/sysdeps/unix/sysv/linux/Makefile  2024-03-14 06:26:18.581404107 -0=
700
> +@@ -222,7 +222,6 @@
> +   tst-process_mrelease \
> +   tst-quota \
> +   tst-rlimit-infinity \
> +-  tst-scm_rights \
> +   tst-sigtimedwait \
> +   tst-sync_file_range \
> +   tst-sysconf-iov_max \
> +@@ -233,6 +232,8 @@
> +   tst-timerfd \
> +   tst-ttyname-direct \
> +   tst-ttyname-namespace \
> ++  # Skip this test to avoid stale qemu process
> ++  # tst-scm_rights \
> +   # tests
> +
> + # process_madvise requires CAP_SYS_ADMIN.
> +@@ -270,9 +271,10 @@
> +   tst-ntp_gettimex-time64 \
> +   tst-ppoll-time64 \
> +   tst-prctl-time64 \
> +-  tst-scm_rights-time64 \
> +   tst-sigtimedwait-time64 \
> +   tst-timerfd-time64 \
> ++  # Skip this test to avoid stale qemu process
> ++  # tst-scm_rights-time64 \
> +   # tests-time64
> +
> + tests-clone-internal =3D \
> diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/gl=
ibc/glibc_2.39.bb
> index b203060064..9122472689 100644
> --- a/meta/recipes-core/glibc/glibc_2.39.bb
> +++ b/meta/recipes-core/glibc/glibc_2.39.bb
> @@ -49,6 +49,7 @@ SRC_URI =3D  "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};na=
me=3Dglibc \
>             file://0021-fix-create-thread-failed-in-unprivileged-process-=
BZ-.patch \
>             file://0022-Avoid-hardcoded-build-time-paths-in-the-output-bi=
nar.patch \
>             file://0023-aarch64-configure-Pass-mcpu-along-with-march-to-d=
ete.patch \
> +           file://0024-qemu-stale-process.patch \
>  "
>  S =3D "${WORKDIR}/git"
>  B =3D "${WORKDIR}/build-${TARGET_SYS}"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197678): https://lists.openembedded.org/g/openembedde=
d-core/message/197678
> Mute This Topic: https://lists.openembedded.org/mt/105259855/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

