Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web10.24389.1593616974087061791
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2020 08:22:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=emeHidoK;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id l12so25164076ejn.10
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2020 08:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0EUBl7dqSSV9nYVncePcCrSJxJPZ/RJNQbVql6r0BEU=;
        b=emeHidoKq8mzeptrWX4Wqn82/teTJoEGGB22pfT08AaPIQStiH+VSyUFNZk7KbaOgj
         GolMGtiP6b5Y5HAtiscpLEPbn3Q1iX6knwqqUBLZUy5fbstkTsrfWeg/yGAZj93VW/cF
         PIQz1K3RY1HinK3ApDX1DFi/D6SaopHbFsc+fEJtpq6mB3hEURGsxi8F7emJdVZyCUTo
         kAOb3MghwqV0IE2q90qhWDBVX5SksZaozWTIO+WvmBMumLj4fnp2b6aDtS00/vkQa0O+
         8jawEBhAQd8WUVu5dktYE2liIXWgjVMwLAARnpLTK6guWGE8Y6Ps7tHj3YUaSQxOwFZ/
         vvCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0EUBl7dqSSV9nYVncePcCrSJxJPZ/RJNQbVql6r0BEU=;
        b=VrIgwYUpVMLSOuR+h0qhyF1XB72e7bOwkdgJFfjxEDsDBbCmkqo9uTN4j5XqDd8txn
         uWtQAQ/x1uQ3BnHqKJxxjAVe5XVDR/0kcwC3czq1RJ2eh98pwLJKL4bvSjPEMfXqYs9L
         fJgAXHVdRdLHAUp8BsZVUvsHJS3jXXBBtWKupJ2rx+IxxodGBAc38OYdaiBteodsDjgT
         aw/Df7VNMOpOdc27DVIl7/siWfjBoiTIPYAg0qiKbx16/YoeMcIgYbCzNOY7l8MFCfEW
         sRwauXcZf8qPOe6Lq0iVW1QVgz/GKHSZSQeq5l/orYEObIJ6bk/BaW0veEm7DTsU9hiC
         U4uA==
X-Gm-Message-State: AOAM531TW2AL3+lSuvUL4oRCwky4ABdkHrhbI+VhXT105BTThf4QdXsO
	osxNiqzyJI4DwQxhUzMgIKVkMfw7IfzPjlB6ogk=
X-Google-Smtp-Source: ABdhPJyqjRExXQ1bG88UQbVsbPM3WZ05ns3ditIx9+Sm8qtq+BPx2YmoqFvlZuBS2InzDFTIjCDDuvnBZlNYaH9utqw=
X-Received: by 2002:a17:906:1414:: with SMTP id p20mr22903054ejc.247.1593616972564;
 Wed, 01 Jul 2020 08:22:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200701145825.3743-1-andrey.z@gmail.com>
In-Reply-To: <20200701145825.3743-1-andrey.z@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 1 Jul 2020 11:22:41 -0400
Message-ID: <CADkTA4M5YdCLcZKjHYoLJQCnx-sgmwVM4Ef-Xk=QZHB8XNytgg@mail.gmail.com>
Subject: Re: [PATCH v2] kernel/yocto: fix search for defconfig from src_uri
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 1, 2020 at 10:58 AM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
>
> Fetcher provides full paths to defconfig and scc files, which awk
> comparison operator does not catch during construction of
> src_uri_defconfig and sccs_from_src_uri lists. This causes the
> src_uri_defconfig variable to come out empty, and fails further
> validation if defconfig is only supplied via SRC_URI.
>
> Replace comparison operator with awk match function which searches for
> sub-string during filtering, effectively placing defconfig from SRC_URI
> into src_uri_defconfig and scc files in sccs_from_src_uri respectively.
>
> Fixes: 23dcff0d396c (kernel/yocto: ensure that defconfigs are processed first)


v2 passes my testing as well.  The autobuilder gets the final say, but
I can't see this causing any issues.

Acked-by: Bruce Ashfield <bruce.ashfield@gmail.com>

> Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
> ---
>  meta/classes/kernel-yocto.bbclass | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> index 41d8620e67..54a1a1627a 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -156,9 +156,10 @@ do_kernel_metadata() {
>         # a quick check to make sure we don't have duplicate defconfigs If
>         # there's a defconfig in the SRC_URI, did we also have one from the
>         # KBUILD_DEFCONFIG processing above ?
> -       src_uri_defconfig=$(echo $sccs_from_src_uri | awk '{ if ($0=="defconfig") { print $0 } }' RS=' ')
> +       src_uri_defconfig=$(echo $sccs_from_src_uri | awk '(match($0, "defconfig") != 0) { print $0 }' RS=' ')
>         # drop and defconfig's from the src_uri variable, we captured it just above here if it existed
> -       sccs_from_src_uri=$(echo $sccs_from_src_uri | awk '{ if ($0!="defconfig") { print $0 } }' RS=' ')
> +       sccs_from_src_uri=$(echo $sccs_from_src_uri | awk '(match($0, "defconfig") == 0) { print $0 }' RS=' ')
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
