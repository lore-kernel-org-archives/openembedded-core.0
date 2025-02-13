Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9390EC0219D
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 07:51:49 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.6247.1739433101643358045
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 23:51:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HIQPoiJb;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-2adc2b6837eso209102fac.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 23:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739433101; x=1740037901; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=65rpStvQHObVK9K9vHs9WyY1ccOBGXdUJD8aKtpJCw8=;
        b=HIQPoiJbGqKZ3QWR52WyYNUPI3mpRNRKBfRMW4UG0VgKCF3ZDQMxp0h1p3ctaIpKUV
         lYRAbMsOOI2a0SVk0UmvQMm9gsFpBSV8Jepu5v07OjTQ9MQaIvX2QPLSh18x4dX51BJ/
         gnjq/rrKwEwx722eINc6XjwekIG1A4zlM8QiLS2AxCWiYASCxOC9sJfk45vcuhmMuzEb
         noj2f1BrZy5irhSN4Mgb+09Okpo7sDGxg/QumKBi2U3TzOrzVus0dp/FFxJEUUfZ0ap4
         c4v4rZnd3TrceXxji4ic7O4AGEmD40aoAkq5iOTp9Rba8Js/S+sqvvXUYutHCXl3Bta0
         gNOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739433101; x=1740037901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=65rpStvQHObVK9K9vHs9WyY1ccOBGXdUJD8aKtpJCw8=;
        b=sUTtu0LhTaNKHP294lKuxEYte1GCtNIGj72eJvMgSXzg5FORR7EH1Fn5xz/yJtwvmA
         JTPBfpnFM1nZVkIEYSNdaaMJ6RwSlRpGgDh3Z+CqKL9eTScknHp7V1xScm0319UmDxGs
         iDYJ/3JcLzkhhslzFpTFDgr25yuwWHp4S4t/Bhi/iok8QcUursR8zymmyBAn/dJl1EC2
         RsPceCL+jokRt+2lCXkO0ZfNM2ciiw4Q/RisztapdqpCi1tl017Qsq0Mrk7G5FCGGzi2
         cVUA8LVrSvimPaxPyKJOZQ/EnWjsz/UcfX4N2trnk9m+/0M7/xe/ko6qbav9vKnAzsjd
         zw8Q==
X-Gm-Message-State: AOJu0Yz+WlLfUtjw5Uz5QKqvU75LvR6VdI+QYTbol9bCLhQeORzXhObr
	5vmYORx/GX4phZqV4ySgo8/9hLn4jORBymWcZcXVmUnmaKnWOHnSuZWr4j3uhFLXgW+qj2Fnz0z
	lnZCPu42OvuJ9ar/Rq3Bj+07Dr1Q=
X-Gm-Gg: ASbGncvDlHYA3L8dNVcKHlcs/0FB+REi+dzhvzwiq+ucZec7XPF8TGtajrYWv95MboG
	rXYQly/K9GGUgBCUGyXSgLRHCytoRXKF1urswkrxa1fjZIa2OD8zxek3xkBuEqMu6OjZaWqOnns
	cmHF1xrr+eSNw=
X-Google-Smtp-Source: AGHT+IHiTvpp3D7A6W9MIWWouk0wjt2MlHcujQsUUgBSdOoXm6b+rXRkVb0r+MTBeDHPkovIXWP4ysg4wbZFA8yNINQ=
X-Received: by 2002:a05:6870:7b47:b0:29e:14ff:2f9c with SMTP id
 586e51a60fabf-2b8f8be1f1fmr1169635fac.18.1739433100719; Wed, 12 Feb 2025
 23:51:40 -0800 (PST)
MIME-Version: 1.0
References: <20250213064207.2663813-1-yuanxiaofeng@eswincomputing.com>
In-Reply-To: <20250213064207.2663813-1-yuanxiaofeng@eswincomputing.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Feb 2025 23:51:13 -0800
X-Gm-Features: AWEUYZl-XIosrEaFpXAH0hf3nZPTSAXLfRCcdZUkEAB4Iw1xxQJUWvT5QbWZBV4
Message-ID: <CAMKF1sokDS6Qm04iEpPGNvQ-9G20C+G8dG6CoytpOQJBU8YJug@mail.gmail.com>
Subject: Re: [PATCH] cross-localedef-native : fixup filesystem check error
To: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
Cc: openembedded-core@lists.openembedded.org, 
	Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 07:51:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211304

Can you format the patch to match the style and also create a PR on
githut for cross-localedef?

On Wed, Feb 12, 2025 at 10:42=E2=80=AFPM Xiaofeng Yuan
<yuanxiaofeng@eswincomputing.com> wrote:
>
> compile glibc-locale triger error, the error info
> is "cross-localedef-native: /xxx/glibc-locale/2.40+git/
> locale-tree/Makefile is on different filesystem than rest
> (use -f option to override)." But check the file, find it's
> filesystem is same as the rest. Now use the f_type instead of
> dev_t to check the filesystem.
>
> Change-Id: I62d840dd74467e8e1afd6e322b05ce012d35458c
>
> Signed-off-by: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
>
> CC: Jason Wessel <jason.wessel@windriver.com>
> CC: Khem Raj <raj.khem@gmail.com>
> Change-Id: I0cf8f143dc4a38fc1835439f4d5e7641832b7a81
> ---
>  .../glibc/cross-localedef-native_2.40.bb      |  1 +
>  ...ixup-hardlink-filesystem-check-error.patch | 78 +++++++++++++++++++
>  2 files changed, 79 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/0001-localedef-fixup-ha=
rdlink-filesystem-check-error.patch
>
> diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.40.bb b/met=
a/recipes-core/glibc/cross-localedef-native_2.40.bb
> index fed6e4ea97..15204f3744 100644
> --- a/meta/recipes-core/glibc/cross-localedef-native_2.40.bb
> +++ b/meta/recipes-core/glibc/cross-localedef-native_2.40.bb
> @@ -32,6 +32,7 @@ SRC_URI =3D "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};nam=
e=3Dglibc \
>             file://0014-localedef-add-to-archive-uses-a-hard-coded-locale=
-pa.patch \
>             file://0017-Replace-echo-with-printf-builtin-in-nscd-init-scr=
ipt.patch \
>             file://0019-timezone-Make-shell-interpreter-overridable-in-tz=
sel.patch \
> +           file://0001-localedef-fixup-hardlink-filesystem-check-error.p=
atch \
>             "
>  # Makes for a rather long rev (22 characters), but...
>  #
> diff --git a/meta/recipes-core/glibc/glibc/0001-localedef-fixup-hardlink-=
filesystem-check-error.patch b/meta/recipes-core/glibc/glibc/0001-localedef=
-fixup-hardlink-filesystem-check-error.patch
> new file mode 100644
> index 0000000000..a7b3e01259
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0001-localedef-fixup-hardlink-filesys=
tem-check-error.patch
> @@ -0,0 +1,78 @@
> +From af6fa1c52d1f83f7a16adf6fa6241269e0034b0b Mon Sep 17 00:00:00 2001
> +From: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
> +Date: Thu, 13 Feb 2025 11:46:59 +0800
> +Subject: [PATCH] cross-localedef-native : fixup filesystem check error
> +
> +Since ordinary files and directories within the same
> +directory but on the same filesystem may have different dev_t,
> +using dev_t to determine whether files (including directories)
> +belong to the same file system is unreliable and may lead to
> +incorrect results. To address this issue, statfs is used to
> +retrieve the filesystem information, allowing the determination
> +of whether files belong to the same file system.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
> +---
> + locale/programs/cross-localedef-hardlink.c | 32 +++++++++++++---------
> + 1 file changed, 19 insertions(+), 13 deletions(-)
> +
> +diff --git a/locale/programs/cross-localedef-hardlink.c b/locale/program=
s/cross-localedef-hardlink.c
> +index 726e6dd948..a51f076923 100644
> +--- a/locale/programs/cross-localedef-hardlink.c
> ++++ b/locale/programs/cross-localedef-hardlink.c
> +@@ -42,6 +42,7 @@
> + #include "xalloc.h"
> + //#include "nls.h"
> + //#include "closestream.h"
> ++#include <sys/statfs.h>
> +
> + #define NHASH   (1<<17)  /* Must be a power of 2! */
> + #define NBUF    64
> +@@ -93,6 +94,7 @@ struct hardlink_ctl {
> +               no_link:1,
> +               content_only:1,
> +               force:1;
> ++      long f_type;
> + };
> + /* ctl is in global scope due use in atexit() */
> + struct hardlink_ctl global_ctl;
> +@@ -185,20 +187,24 @@ static void growstr(struct hardlink_dynstr *str, s=
ize_t newlen)
> +
> + static void process_path(struct hardlink_ctl *ctl, const char *name)
> + {
> +-      struct stat st, st2, st3;
> +-      const size_t namelen =3D strlen(name);
> ++        struct stat st, st2, st3;
> ++        struct statfs stfs;
> ++        const size_t namelen =3D strlen(name);
> ++
> ++        ctl->nobjects++;
> ++        if (lstat(name, &st))
> ++                return;
> ++        if (statfs(name, &stfs))
> ++                return;
> ++
> ++        if (stfs.f_type !=3D ctl->f_type && !ctl->force) {
> ++                if (ctl->f_type)
> ++                        errx(EXIT_FAILURE,
> ++                             ("%s is on different filesystem than the r=
est "
> ++                               "(use -f option to override)."), name);
> ++                ctl->f_type =3D stfs.f_type;
> ++        }
> +
> +-      ctl->nobjects++;
> +-      if (lstat(name, &st))
> +-              return;
> +-
> +-      if (st.st_dev !=3D ctl->dev && !ctl->force) {
> +-              if (ctl->dev)
> +-                      errx(EXIT_FAILURE,
> +-                           ("%s is on different filesystem than the res=
t "
> +-                             "(use -f option to override)."), name);
> +-              ctl->dev =3D st.st_dev;
> +-      }
> +       if (S_ISDIR(st.st_mode)) {
> +               struct hardlink_dir *dp =3D xmalloc(add3(sizeof(*dp), nam=
elen, 1));
> +               memcpy(dp->name, name, namelen + 1);
>

