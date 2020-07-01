Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web11.20716.1593608292929833433
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2020 05:58:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EfmCmdTg;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id by13so9730022edb.11
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2020 05:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hdI5y7ui2g+CzbzRtsxcRrBZebFwXOQeNRzP0WsoYEI=;
        b=EfmCmdTgsCxRdWrGCgNArsJ3fcxRPEBGK5A7qTyEspiuQ6PRhRPqcT2M125v/zoPYX
         u6wwHbP4R4Utgr1XfuieYOujtI5zdawoCxbwHsg0XdrnnS3yfWz6eRsoFNmyWF5r/rII
         reQ11TQDamwVHD3lGQ+5nHLy+/1t5wh/BzGMNQ5UHUbJpIrrIaFW+Nnl8CWKsuvZXRla
         ZtfupHxukXyre5uEQqoC3JDJrUuSvWuwXKP1Z7sd+IBj14pHEq5gWZ5zyxXaR5e07Eak
         Fd3hl11toq8aOj3q116C9uuWhtOoCH2rSSbEFXsl99gbzX8vobULvhyoEXHVaNKPzdas
         71LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hdI5y7ui2g+CzbzRtsxcRrBZebFwXOQeNRzP0WsoYEI=;
        b=UNa6HCUIli1ei/ht3jefD+WM7EenXH+nDl5JVEWQKQ2te/1hFhD557VOy/XrYLPENN
         +kf95fjaWscLMZ8hTDg3k1nb+KevJEG+ZtaNefU8oILH7UCj+ZHbMMSNNbvDDVvn52Ue
         AyiBqvfKyeJbJN8nXNBjekO3BbeTZK1FPvy5oni6NpR1BiDo2VYeYsCEvo+6adZqayCh
         xbny2dqVTfUuknHHh//Oh2ej2XVo9L6EE1rPxJD2lW45vEbAMotiBmk2YkDQuqSvbf7j
         ZvrdRKwcL1RZzUowNVxgAKoLZKAhs6PcV4o+9e9U7Dt6uZ7jn/p/xhh44bESJXtaZMQn
         /v7w==
X-Gm-Message-State: AOAM531YuJ76TbUz9FHuX65WOBn24SXE+9itAzsXxUykYY4Ulf0mf8PJ
	+jA3RoBWS/1s+vqyXcLhuvmkuAAJi8HBJqL0FnE=
X-Google-Smtp-Source: ABdhPJwR60CIju9x09NfIqYCe4UPiuR/alGGExjTRYzVNXdkFOerCIbQU1RWgF5pihXhAjOfzE6pWoq1d/pKBRatMsU=
X-Received: by 2002:aa7:db11:: with SMTP id t17mr27929292eds.365.1593608291223;
 Wed, 01 Jul 2020 05:58:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200701104628.32696-1-andrey.z@gmail.com>
In-Reply-To: <20200701104628.32696-1-andrey.z@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 1 Jul 2020 08:58:00 -0400
Message-ID: <CADkTA4N68p6gK-nO3mPJ0z+MtBDFJDjsvn0RpF=ou1+Wj-5UFQ@mail.gmail.com>
Subject: Re: [PATCH] kernel/yocto: fix search for defconfig from src_uri
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 1, 2020 at 6:46 AM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
>
> Fetcher provides full paths to defconfig and scc files, which awk
> comparison operator does not catch during construction of
> src_uri_defconfig and sccs_from_src_uri lists. This causes the
> src_uri_defconfig variable to come out empty, and fails further
> validation if defconfig is only supplied via SRC_URI.
>
> Replace comparison operator with awk index function which searches for
> sub-string during filtering, effectively placing defconfig from SRC_URI
> into src_uri_defconfig and scc files in sccs_from_src_uri respectively.
>

Hmm. This passed all of my testing (defconfigs were picked up
properly), can you share your test configuration ? I'd like to test
this across my kernels, since I have even more corner cases than most.

What issues did it cause in your build ? Was the defconfig skipped completely ?

Bruce

> Fixes: 23dcff0d396c (kernel/yocto: ensure that defconfigs are processed first)
> Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
> ---
>  meta/classes/kernel-yocto.bbclass | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> index 41d8620e67..059d78b7dc 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -156,9 +156,10 @@ do_kernel_metadata() {
>         # a quick check to make sure we don't have duplicate defconfigs If
>         # there's a defconfig in the SRC_URI, did we also have one from the
>         # KBUILD_DEFCONFIG processing above ?
> -       src_uri_defconfig=$(echo $sccs_from_src_uri | awk '{ if ($0=="defconfig") { print $0 } }' RS=' ')
> +       src_uri_defconfig=$(echo $sccs_from_src_uri | awk '(index($0, "defconfig") != 0) { print $0 }' RS=' ')
>         # drop and defconfig's from the src_uri variable, we captured it just above here if it existed
> -       sccs_from_src_uri=$(echo $sccs_from_src_uri | awk '{ if ($0!="defconfig") { print $0 } }' RS=' ')
> +       sccs_from_src_uri=$(echo $sccs_from_src_uri | awk '(index($0, "defconfig") == 0) { print $0 }' RS=' ')
> +
>         if [ -n "$in_tree_defconfig" ]; then
>                 sccs_defconfig=$in_tree_defconfig
>                 if [ -n "$src_uri_defconfig" ]; then
> --
> 2.17.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
