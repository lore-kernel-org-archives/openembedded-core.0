Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DB55C2BA4C
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 15:06:36 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.13902.1643209594379548357
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 07:06:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=LvqcNm6q;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.50,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f50.google.com with SMTP id d10so39704065eje.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 07:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WOXwW5AhINKY/OdUL2psrAlojdAzADkwL+csR80DWcU=;
        b=LvqcNm6qS241SgI4gT0qaos/MWsPzTW2UrxWYk7+O363BI56s+4HYCCbyXkTKwnTvN
         1L0HQdZFJog+hI0Hxdi1QBsAzWyFnbFDsUmejCMMEif1sOD/vxZ9tHYgJOljfEw5zhfU
         b2aJswdVlZmWJ+Ap2oVNsjE/MVcQ6h+HPdLjwNs2wwmlYavLBsXXyppW+q6KE49LUH/p
         7xOr/rQA9ZMFlcIkb866CDi4GV0x4+Sdy9QIjZsf9tnhSNkR6cCQcsdsuPwR3DLv/Tmj
         cpNv6bTj3vAlBmfFvHbyi4CE6m+GP5qayWjTtzZI2iVU/WxAZ6sysPbVQncujiF2WB3/
         cduQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WOXwW5AhINKY/OdUL2psrAlojdAzADkwL+csR80DWcU=;
        b=mzHFHeU+ZjtKzvAJWLoWeOVB8PJ4JD45RHuD21eBW98EdWsII//XT3OF5pzmouiKZQ
         Z66W74bvxGwMuqmds7Cw6ubRjkLOWcpS/K0S5+Wr+TnHVsrrFmFS7gsICSiXmcD/iK2b
         /S6UHkdcoqVMGG3tm5ZZkh/PCOWMYzK/ckSqiilZxzcSgsMvDnnJ+KtATdonRqrgKOZS
         E9L0T4U5iZ/hCVqNqPf6TFRja+JCcXVmQV4zyhH4fLxWwpCd9SFlxItMcfRq/poscbhn
         nxittKDW8lCTtcitd5EKAJgbYaatDv+YknXHty3/yMoMdKVJ3Luj4MtGb2Vqp1P0tPvV
         cZSg==
X-Gm-Message-State: AOAM530KU5FCH3HWz8ArwwWLtPWyBTSI7YqZ+mSV2YDQiWQFk4LvwP06
	M44+SpClhi7YV65I3s3ILh1/Uda747eG0Yj6yGHusg==
X-Google-Smtp-Source: 
 ABdhPJwiobqTDBNmNcAQt1i6Ay2OqKjRclLqTWHCW/6AzeNHu9UwbYzLVhhjmiES0u/FvjquV2tN3TXaREENrtwZtXE=
X-Received: by 2002:a17:907:72c4:: with SMTP id
 du4mr12450074ejc.243.1643209592436;
 Wed, 26 Jan 2022 07:06:32 -0800 (PST)
MIME-Version: 1.0
References: <20220124065404.4062-1-flowergom@gmail.com>
In-Reply-To: <20220124065404.4062-1-flowergom@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 26 Jan 2022 05:06:21 -1000
Message-ID: 
 <CAOSpxdakr2QjNVOdKJUjcsuHhZYy4+ReQgSnaT7Hed_E89Vn8A@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH v2] ghostscript: fix CVE-2021-45949
To: Minjae Kim <flowergom@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jan 2022 15:06:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160989

On Sun, Jan 23, 2022 at 8:54 PM Minjae Kim <flowergom@gmail.com> wrote:
>
> Ghostscript GhostPDL 9.50 through 9.54.0 has a heap-based buffer overflow in sampled_data_finish
> (called from sampled_data_continue and interp).
>
> To apply the CVE-2021-45949 patch,
> check-stack-limits-after-function-evalution.patch should be applied first.

Unfortunately I'm getting an error with this patch:

ERROR: ghostscript-9.52-r0 do_patch: Applying patch
'CVE-2021-45949.patch' on target directory
'/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/ghostscript/9.52-r0/ghostscript-9.52'
Command Error: 'quilt --quiltrc
/home/steve/builds/poky-contrib/build/tmp/work/core2-64-poky-linux/ghostscript/9.52-r0/recipe-sysroot-native/etc/quiltrc
push' exited with 0  Output:
Applying patch CVE-2021-45949.patch
patching file psi/zfsample.c
Hunk #1 FAILED at 533.
1 out of 2 hunks FAILED -- rejects in file psi/zfsample.c
Patch CVE-2021-45949.patch does not apply (enforce with -f)

Steve


> References:
> https://nvd.nist.gov/vuln/detail/CVE-2021-45949
>
> Signed-off-by: Minjae Kim <flowergom@gmail.com>
> ---
>  .../ghostscript/CVE-2021-45949.patch          | 68 +++++++++++++++++++
>  ...tack-limits-after-function-evalution.patch | 51 ++++++++++++++
>  .../ghostscript/ghostscript_9.52.bb           |  2 +
>  3 files changed, 121 insertions(+)
>  create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2021-45949.patch
>  create mode 100644 meta/recipes-extended/ghostscript/ghostscript/check-stack-limits-after-function-evalution.patch
>
> diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2021-45949.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2021-45949.patch
> new file mode 100644
> index 0000000000..605155342e
> --- /dev/null
> +++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2021-45949.patch
> @@ -0,0 +1,68 @@
> +From 2a3129365d3bc0d4a41f107ef175920d1505d1f7 Mon Sep 17 00:00:00 2001
> +From: Chris Liddell <chris.liddell@artifex.com>
> +Date: Tue, 1 Jun 2021 19:57:16 +0100
> +Subject: [PATCH] Bug 703902: Fix op stack management in
> + sampled_data_continue()
> +
> +Replace pop() (which does no checking, and doesn't handle stack extension
> +blocks) with ref_stack_pop() which does do all that.
> +
> +We still use pop() in one case (it's faster), but we have to later use
> +ref_stack_pop() before calling sampled_data_sample() which also accesses the
> +op stack.
> +
> +Fixes:
> +https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=34675
> +
> +Upstream-Status: Backported [https://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=2a3129365d3bc0d4a41f107ef175920d1505d1f7]
> +CVE: CVE-2021-45949
> +Signed-off-by: Minjae Kim <flowergom@gmail.com>
> +---
> + psi/zfsample.c | 16 ++++++++++------
> + 1 file changed, 10 insertions(+), 6 deletions(-)
> +
> +diff --git a/psi/zfsample.c b/psi/zfsample.c
> +index 0e8e4bc8d..00cd0cfdd 100644
> +--- a/psi/zfsample.c
> ++++ b/psi/zfsample.c
> +@@ -533,15 +533,19 @@ sampled_data_continue(i_ctx_t *i_ctx_p)
> +         for (j = 0; j < bps; j++)
> +             data_ptr[bps * i + j] = (byte)(cv >> ((bps - 1 - j) * 8));        /* MSB first */
> +     }
> +-    pop(num_out);                 /* Move op to base of result values */
> +
> +-    /* Check if we are done collecting data. */
> ++    pop(num_out); /* Move op to base of result values */
> +
> ++    /* From here on, we have to use ref_stack_pop() rather than pop()
> ++       so that it handles stack extension blocks properly, before calling
> ++       sampled_data_sample() which also uses the op stack.
> ++     */
> ++    /* Check if we are done collecting data. */
> +     if (increment_cube_indexes(params, penum->indexes)) {
> +         if (stack_depth_adjust == 0)
> +-            pop(O_STACK_PAD);     /* Remove spare stack space */
> ++            ref_stack_pop(&o_stack, O_STACK_PAD);         /* Remove spare stack space */
> +         else
> +-            pop(stack_depth_adjust - num_out);
> ++            ref_stack_pop(&o_stack, stack_depth_adjust - num_out);
> +         /* Execute the closing procedure, if given */
> +         code = 0;
> +         if (esp_finish_proc != 0)
> +@@ -554,11 +558,11 @@ sampled_data_continue(i_ctx_t *i_ctx_p)
> +             if ((O_STACK_PAD - stack_depth_adjust) < 0) {
> +                 stack_depth_adjust = -(O_STACK_PAD - stack_depth_adjust);
> +                 check_op(stack_depth_adjust);
> +-                pop(stack_depth_adjust);
> ++                ref_stack_pop(&o_stack, stack_depth_adjust);
> +             }
> +             else {
> +                 check_ostack(O_STACK_PAD - stack_depth_adjust);
> +-                push(O_STACK_PAD - stack_depth_adjust);
> ++                ref_stack_push(&o_stack, O_STACK_PAD - stack_depth_adjust);
> +                 for (i=0;i<O_STACK_PAD - stack_depth_adjust;i++)
> +                     make_null(op - i);
> +             }
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-extended/ghostscript/ghostscript/check-stack-limits-after-function-evalution.patch b/meta/recipes-extended/ghostscript/ghostscript/check-stack-limits-after-function-evalution.patch
> new file mode 100644
> index 0000000000..722bab4ddb
> --- /dev/null
> +++ b/meta/recipes-extended/ghostscript/ghostscript/check-stack-limits-after-function-evalution.patch
> @@ -0,0 +1,51 @@
> +From 7861fcad13c497728189feafb41cd57b5b50ea25 Mon Sep 17 00:00:00 2001
> +From: Chris Liddell <chris.liddell@artifex.com>
> +Date: Fri, 12 Feb 2021 10:34:23 +0000
> +Subject: [PATCH] oss-fuzz 30715: Check stack limits after function evaluation.
> +
> +During function result sampling, after the callout to the Postscript
> +interpreter, make sure there is enough stack space available before pushing
> +or popping entries.
> +
> +In thise case, the Postscript procedure for the "function" is totally invalid
> +(as a function), and leaves the op stack in an unrecoverable state (as far as
> +function evaluation is concerned). We end up popping more entries off the
> +stack than are available.
> +
> +To cope, add in stack limit checking to throw an appropriate error when this
> +happens.
> +
> +Upstream-Status: Backported [https://git.ghostscript.com/?p=ghostpdl.git;a=patch;h=7861fcad13c497728189feafb41cd57b5b50ea25]
> +Signed-off-by: Minjae Kim <flowergom@gmail.com>
> +---
> + psi/zfsample.c | 14 +++++++++++---
> + 1 file changed, 11 insertions(+), 3 deletions(-)
> +
> +diff --git a/psi/zfsample.c b/psi/zfsample.c
> +index 290809405..652ae02c6 100644
> +--- a/psi/zfsample.c
> ++++ b/psi/zfsample.c
> +@@ -551,9 +551,17 @@ sampled_data_continue(i_ctx_t *i_ctx_p)
> +     } else {
> +         if (stack_depth_adjust) {
> +             stack_depth_adjust -= num_out;
> +-            push(O_STACK_PAD - stack_depth_adjust);
> +-            for (i=0;i<O_STACK_PAD - stack_depth_adjust;i++)
> +-                make_null(op - i);
> ++            if ((O_STACK_PAD - stack_depth_adjust) < 0) {
> ++                stack_depth_adjust = -(O_STACK_PAD - stack_depth_adjust);
> ++                check_op(stack_depth_adjust);
> ++                pop(stack_depth_adjust);
> ++            }
> ++            else {
> ++                check_ostack(O_STACK_PAD - stack_depth_adjust);
> ++                push(O_STACK_PAD - stack_depth_adjust);
> ++                for (i=0;i<O_STACK_PAD - stack_depth_adjust;i++)
> ++                    make_null(op - i);
> ++            }
> +         }
> +     }
> +
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.52.bb b/meta/recipes-extended/ghostscript/ghostscript_9.52.bb
> index 32346e6811..ac3d0dca43 100644
> --- a/meta/recipes-extended/ghostscript/ghostscript_9.52.bb
> +++ b/meta/recipes-extended/ghostscript/ghostscript_9.52.bb
> @@ -39,6 +39,8 @@ SRC_URI = "${SRC_URI_BASE} \
>             file://ghostscript-9.21-prevent_recompiling.patch \
>             file://cups-no-gcrypt.patch \
>             file://CVE-2020-15900.patch \
> +           file://check-stack-limits-after-function-evalution.patch \
> +           file://CVE-2021-45949.patch \
>             "
>
>  SRC_URI_class-native = "${SRC_URI_BASE} \
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160870): https://lists.openembedded.org/g/openembedded-core/message/160870
> Mute This Topic: https://lists.openembedded.org/mt/88642112/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

