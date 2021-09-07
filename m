Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.33592.1631011228746269194
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Sep 2021 03:40:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ctCksTCr;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: andrey.z@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id h16so18588931lfk.10
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Sep 2021 03:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xj35BashVy4orZzIv5HkcpnE5Grp4A+2uUlvaIUyI88=;
        b=ctCksTCrObnhYhYnnBrLtW7yj2uE2ehXTy+bJkiQgXNdyENc8SOvHWa7wazNS2wMbM
         3rZ4Il7LXFt3IZOKbr8Ifp9ndRplbYkxwcagRcvLlmOFADoYuJmlTx8VFnr5xfcnheC0
         Lo981JdiEX1s0tVr+4RcybSkVKIfzNXsCM8TWC1OPDtFhW76tuO2Ykebfr80CXpxe3XL
         VP4RO3gDEOKTIx1SxiMc718OGahgDw03xIsbzh/dx6qpEEy7lE7wr/W7OENkq5VmidIz
         4t5vVnFYTsU90tk9f0nQVsLbv0Ea05KuFGmBy/pBIvuKw/FsQRpcz8lkza96HusgyUkG
         V77w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xj35BashVy4orZzIv5HkcpnE5Grp4A+2uUlvaIUyI88=;
        b=LxsWIJ7GZO5qqreYvwG1kKZLI+/rgng7c2JESi4BGMfFik+UYjAo/lija4iOtVbKdv
         otngmnPMUXwJ3pQReI+1Wor7viaDu68JizX5p72bl2KojVic87015pEcW2u0+e703xyn
         ymECv9HerKTgCT/0luH/6FlQlmgIUfAbVTELhhOpkxWwuOh0mRpnTSotbHM8aWUVe2lx
         +7AtRmBvX9xE1vteyHgH/qHIO9QNGzWFnjhhQcAchPLVoOaHirsfQhi7gvrFKeWdJVld
         Ckz3xTl88ry2RpMCplIaNqnhp8nwfhmPS5J0lFgpTv1gZ84i9mMSa5DI3niKzGYt92TE
         nxYg==
X-Gm-Message-State: AOAM532CIdOUAQAP+4QiZPpvOW1ICxe6q+RwNKYpxJL70SkUYWOix6ME
	IXEXMM3ZWVCQpsgBmC82MYwwD7n1fdcLWBRXsgs=
X-Google-Smtp-Source: ABdhPJzhjFeOTztwaBLpmVGJiHDq8J14NWnZFV+gwUxUP2v9buKRc8hYH1iaYUFKYT74Wbf01qc0GeTsxMMUsdGA4oA=
X-Received: by 2002:a05:6512:b13:: with SMTP id w19mr11900127lfu.61.1631011226805;
 Tue, 07 Sep 2021 03:40:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210907062554.852167-1-hongxu.jia@windriver.com>
In-Reply-To: <20210907062554.852167-1-hongxu.jia@windriver.com>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Tue, 7 Sep 2021 12:39:43 +0200
Message-ID: <CAHtQpK7+qYwK8qa9-NwCg0FyVjsq1DsqfRwFW-3Ck8zbrQF-bA@mail.gmail.com>
Subject: Re: [OE-core] [hardknott][PATCH] Revert "sdk: fix relocate symlink failed"
To: hongxu <hongxu.jia@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>, 
	"Mittal, Anuj" <anuj.mittal@intel.com>
Content-Type: text/plain; charset="UTF-8"

Hello Hongxu,

On Tue, Sep 7, 2021 at 8:26 AM hongxu <hongxu.jia@windriver.com> wrote:
>
> The commit [7e71acd265 sdk: fix relocate symlink failed] is used to fix
> regression issue caused by commit [bc4ee54535 sdk: Decouple default install
> path from built in path], but hardknott does not contain commit bc4ee54535,
> so commit 7e71acd265 should not be in hardknott neither, otherwise it caused
> other regression issue.
>
> This reverts commit 7e71acd265637d54d5bf149ea36cefa581f60992.

This has been already discussed for [dunfell], see [1].

The actual proposal was to take the second commit rather than
reverting the first one, which Steve did (see [2]).

Can the same approach be applied to [hardknott]?

>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/files/toolchain-shar-relocate.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/files/toolchain-shar-relocate.sh b/meta/files/toolchain-shar-relocate.sh
> index ba873373e2..5433741296 100644
> --- a/meta/files/toolchain-shar-relocate.sh
> +++ b/meta/files/toolchain-shar-relocate.sh
> @@ -72,7 +72,7 @@ fi
>
>  # change all symlinks pointing to @SDKPATH@
>  for l in $($SUDO_EXEC find $native_sysroot -type l); do
> -       $SUDO_EXEC ln -sfn $(readlink $l|$SUDO_EXEC sed -e "s:$SDK_BUILD_PATH:$target_sdk_dir:") $l
> +       $SUDO_EXEC ln -sfn $(readlink $l|$SUDO_EXEC sed -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:") $l
>         if [ $? -ne 0 ]; then
>                 echo "Failed to setup symlinks. Relocate script failed. Abort!"
>                 exit 1
> --
> 2.27.0
>
>
> 
>

Link: [1]: https://lists.openembedded.org/g/openembedded-core/topic/85311771#155603
Link: [2]: https://lists.openembedded.org/g/openembedded-core/message/155670

--
Regards,
Andrey.
