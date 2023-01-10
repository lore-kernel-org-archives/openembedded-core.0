Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BAF9C54EBC
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 16:51:46 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.109418.1673369499343836448
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jan 2023 08:51:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=eQ7PfoIx;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.51, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f51.google.com with SMTP id 18so18478991edw.7
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jan 2023 08:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1up7zRPONcdMU0ll7kX73I9CzwtRuhcC6kqoadBWQxw=;
        b=eQ7PfoIxGNqAxEOAFCG1jqs/uY01Ukx6ZyyvFABb848XyHW5FwRel2QNLDQowjpG49
         N6BRFScEFBYY3M6GZWyPg9JgYuSoUARCv9dAgf7lpJHrvvPfy0+ggJwtYlHw5n1bst0G
         b/gLR4UyFawnASc4mwubnJGebuj4RZh4CIMGlDmENwxN3WqUaPSsTJccpwdFW4Af9JJl
         S5ygfKQKqMqup2LtiIkE96wzy7bdEqWOazal+ABxDoghcU/b2xJD9FFgbJEG6HDpr4dw
         D6B49paNw/QwVe9nnQUqmIkGVPG6uhkV7w1ByKUn2/kRvvYtZWBHmmCMxn+Be8GeAUrl
         nlpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1up7zRPONcdMU0ll7kX73I9CzwtRuhcC6kqoadBWQxw=;
        b=MiR2wweRS4aRbldOSfLiYpJ3dnsDdiXfHh+dRa523O9sO44885+VXQeJz3Im8ANbpV
         Gs9hgW2NpUNJ/hWDDFfCOIDbT3SQbZKNgFf6wuSrJ1ijNgz8DObowwdDjXo5UFnHXWTK
         wHrx8ukuZcwE6tZlZAUlAcmdX7pR72IE7HOIFt1GHWww8gB1og9F/hNgZPY61L2eV+Uw
         4QsCe6C8+M5xM8I7ivE5P0PShaJpZ814mhC4NMRkKZy5lI4eOPULHQ9EIoMq4rzOlGNX
         h2hZ3hbmQWkJCazl6elxyDoWojBkqaq7+LvBqBhuToxQSRPuvnBW+kZUkEJING3iIFAo
         um9Q==
X-Gm-Message-State: AFqh2kojve/RvJPCSc1mMixM3NR3o5DeRjKrtzvLpw55MDecM13KrD7t
	o0IHzuldgwV1y2SuHdS2BT0Wi8mew5q/SK+165sm3w==
X-Google-Smtp-Source: AMrXdXuP20G+f8B3QUgE3wBJzoI9O6ORvdS/Mr1rppKSaUnKYhw7uksJohhufSCK8cLnBhxyxYKtO7hswTOG9IEtx0c=
X-Received: by 2002:a05:6402:2208:b0:48a:7ada:b260 with SMTP id
 cq8-20020a056402220800b0048a7adab260mr3632403edb.311.1673369497692; Tue, 10
 Jan 2023 08:51:37 -0800 (PST)
MIME-Version: 1.0
References: <20230110161016.28885-1-asharma@mvista.com>
In-Reply-To: <20230110161016.28885-1-asharma@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 10 Jan 2023 06:51:26 -1000
Message-ID: <CAOSpxdZNBqrxSo3UfZY3XMe-+Ext-5ZyyyS1YP276-Su3jfAVg@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] vim: Backport fix for CVE-2023-0049
To: Ashish Sharma <asharma@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jan 2023 16:51:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175723

Hi Ashish,

Thanks for helping with CVEs.

Due to the large number of CVE issues in vim we have adopted a policy
of doing version bumps rather than individual CVE patches.

So please submit a version bump patch similar to:

https://git.openembedded.org/openembedded-core/commit/?id=160f459febc7fb36cc0fe85c63eb26780ace3bfd

Also, please submit for the master branch, and I will cherry-pick to
the other branches after it is accepted there.

Thanks again!

Steve

On Tue, Jan 10, 2023 at 6:10 AM Ashish Sharma <asharma@mvista.com> wrote:
>
> Upstream-Status: Backport from 'https://github.com/vim/vim/commit/7b17eb4b063a234376c1ec909ee293e42cff290c'
> CVE: CVE-2023-0049
>
> Signed-off-by: Ashish Sharma <asharma@mvista.com>
> ---
>  .../vim/files/CVE-2023-0049.patch             | 62 +++++++++++++++++++
>  meta/recipes-support/vim/vim.inc              |  1 +
>  2 files changed, 63 insertions(+)
>  create mode 100644 meta/recipes-support/vim/files/CVE-2023-0049.patch
>
> diff --git a/meta/recipes-support/vim/files/CVE-2023-0049.patch b/meta/recipes-support/vim/files/CVE-2023-0049.patch
> new file mode 100644
> index 00000000000..d8155f5fabb
> --- /dev/null
> +++ b/meta/recipes-support/vim/files/CVE-2023-0049.patch
> @@ -0,0 +1,62 @@
> +From 7b17eb4b063a234376c1ec909ee293e42cff290c Mon Sep 17 00:00:00 2001
> +From: Bram Moolenaar <Bram@vim.org>
> +Date: Wed, 4 Jan 2023 14:31:49 +0000
> +Subject: [PATCH] patch 9.0.1143: invalid memory access with bad 'statusline'
> + value
> +
> +Problem:    Invalid memory access with bad 'statusline' value.
> +Solution:   Avoid going over the NUL at the end.
> +
> +Upstream-Status: Backport from 'https://github.com/vim/vim/commit/7b17eb4b063a234376c1ec909ee293e42cff290c'
> +CVE: CVE-2023-0049
> +Signed-off-by: Ashish Sharma <asharma@mvista.com>
> +---
> + src/buffer.c                    | 2 ++
> + src/testdir/test_statusline.vim | 7 +++++++
> + src/version.c                   | 2 ++
> + 3 files changed, 11 insertions(+)
> +
> +diff --git a/src/buffer.c b/src/buffer.c
> +index 98568987894e..40168226160c 100644
> +--- a/src/buffer.c
> ++++ b/src/buffer.c
> +@@ -4617,6 +4617,8 @@ build_stl_str_hl(
> + #endif
> +       if (vim_strchr(STL_ALL, *s) == NULL)
> +       {
> ++          if (*s == NUL)  // can happen with "%0"
> ++              break;
> +           s++;
> +           continue;
> +       }
> +diff --git a/src/testdir/test_statusline.vim b/src/testdir/test_statusline.vim
> +index a829597655bf..23613bfed37b 100644
> +--- a/src/testdir/test_statusline.vim
> ++++ b/src/testdir/test_statusline.vim
> +@@ -440,6 +440,13 @@ func Test_statusline()
> +   set splitbelow&
> + endfunc
> +
> ++func Test_statusline_trailing_percent_zero()
> ++  " this was causing illegal memory access
> ++  set laststatus=2 stl=%!%0
> ++  call assert_fails('redraw', 'E15: Invalid expression: "%0"')
> ++  set laststatus& stl&
> ++endfunc
> ++
> + func Test_statusline_visual()
> +   func CallWordcount()
> +     call wordcount()
> +diff --git a/src/version.c b/src/version.c
> +index df02bb87b87d..4ccbd537abe3 100644
> +--- a/src/version.c
> ++++ b/src/version.c
> +@@ -695,6 +695,8 @@ static char *(features[]) =
> +
> + static int included_patches[] =
> + {   /* Add new patch number below this line */
> ++/**/
> ++    1143,
> + /**/
> +     1142,
> + /**/
> diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
> index d86841efaa8..81c07bfefa8 100644
> --- a/meta/recipes-support/vim/vim.inc
> +++ b/meta/recipes-support/vim/vim.inc
> @@ -18,6 +18,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
>             file://vim-add-knob-whether-elf.h-are-checked.patch \
>             file://0001-src-Makefile-improve-reproducibility.patch \
>             file://no-path-adjust.patch \
> +          file://CVE-2023-0049.patch \
>             "
>
>  PV .= ".0947"
> --
> 2.35.5
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175718): https://lists.openembedded.org/g/openembedded-core/message/175718
> Mute This Topic: https://lists.openembedded.org/mt/96180104/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

