Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web10.10103.1586442698145197352
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2020 07:31:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=T59u2Ykt;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id j4so4063824qkc.11
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2020 07:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=5k1+vmOxvXtR+aRMmgTBnjHJ7zSgfwD/yan/08CY7C0=;
        b=T59u2Yktxz9XWzoVW9vCZNeJXi5KGc3AWhZtTvN7kBzi0GGiT++sfKhjjcXd8SgcO4
         MsjwfX5S29AkNRrouSHy75eGa+9HTVdpLm+nLGVNbivytrftsXAW00WcIl71TqWEjnnl
         ExeMcJQV5b9ZWVw002WOQuEYVG0BDarzcK49M2LaMHQV3UOEkJ/lPIkwnUNxvF37y2yP
         KEs1FQwSj/IvdZfLQ1kPhLCrY+DxICHfy0YOWw1Q7ZMyRaDJJKGG6x3+aqRA6KFsvCqb
         rUzpgAqqhzk4hHxQwdRj/uTAiY1SFI2iwCWjQdJRejop4m/Uu7zG5Q9UodsfF4IbNqNM
         qZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=5k1+vmOxvXtR+aRMmgTBnjHJ7zSgfwD/yan/08CY7C0=;
        b=ZSqtqHyV6QqX0jXMxvHpUmjz3JC/91EJgJW0OLORkVabhgTvv80Yxg3BY25dKpDbCB
         qWv8AfRK2jtbL0syhj8msAYCJlcMogROUYkjmpSCwav0FiQVREIxahqhTeKvC3yVqydS
         Sd/3Qfz0NYP3vEVaQjJiXVhIj9KEZ2717h+R4sd03YUidlbDtJdyMmU9kQNh4WAZiOfT
         rEvQ5DJFTGvnIqgl0LqvN66eMoq+x4bfuI3UvXGvKfva1o37Vkns7t/GohxLbQoj1cCK
         BhZRb0HOfDAfCCSLLGZds8zYkmEwR9pc95YofhiYvTDV4xS6lmep/i6hQ7H4bUdmqxDA
         APCA==
X-Gm-Message-State: AGi0PuZCKzmSAwd6tG1k4czqgnFNFzQZ87+BMHELg9KKOME+K8vl+RCX
	l5u+cah5I5Z56evy6+6XWtCcUTMYWbGk33po2ZTv6tnH
X-Google-Smtp-Source: APiQypLcSUnGwH3QMQyQA6HADfic5FBGAfwBzrNWlWzuMnSDUR8Sym80+ZPWjw5LraCwDUqXnnN6HuDPpVNJy/cNfpk=
X-Received: by 2002:a05:620a:1eb:: with SMTP id x11mr53079qkn.225.1586442696930;
 Thu, 09 Apr 2020 07:31:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200409082941.3428697-1-raj.khem@gmail.com>
In-Reply-To: <20200409082941.3428697-1-raj.khem@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 9 Apr 2020 07:31:09 -0700
Message-ID: <CAMKF1spX-=He71ofkPj=uhMjHgfFp9wYo8YcETEARCDBK9L3-A@mail.gmail.com>
Subject: Re: [PATCH v2] multilib: Enable multilib headers for musl
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

This patch needs much more testing and I think is not sufficient either.

On Thu, Apr 9, 2020 at 1:29 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> This is no longer needed as we can build multilibbed images with musl
> now
>
> Include bits/reg.h on musl instead of bits/wordsize.h where __WORDSIZE
> is defined
>
> [YOCTO #13122]
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: include bits/reg.h on musl for __WORDSIZE
>
>  meta/classes/multilib_header.bbclass | 7 -------
>  scripts/multilib_header_wrapper.h    | 4 ++++
>  2 files changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/meta/classes/multilib_header.bbclass b/meta/classes/multilib_header.bbclass
> index e03f5b13b2..48f231eed0 100644
> --- a/meta/classes/multilib_header.bbclass
> +++ b/meta/classes/multilib_header.bbclass
> @@ -6,13 +6,6 @@ inherit siteinfo
>  # all of the ABI variants for that given architecture.
>  #
>  oe_multilib_header() {
> -
> -       case ${HOST_OS} in
> -       *-musl*)
> -               return
> -               ;;
> -       *)
> -       esac
>          # For MIPS: "n32" is a special case, which needs to be
>          # distinct from both 64-bit and 32-bit.
>          case ${TARGET_ARCH} in
> diff --git a/scripts/multilib_header_wrapper.h b/scripts/multilib_header_wrapper.h
> index c81e7ee5e8..00ea5bf841 100644
> --- a/scripts/multilib_header_wrapper.h
> +++ b/scripts/multilib_header_wrapper.h
> @@ -16,7 +16,11 @@
>  #elif defined (__aarch64__)
>  #define __MHWORDSIZE                   32
>  #else
> +#if defined(__GLIBC__)
>  #include <bits/wordsize.h>
> +#else
> +#include <bits/reg.h>
> +#endif
>  #if defined (__WORDSIZE)
>  #define __MHWORDSIZE                   __WORDSIZE
>  #else
> --
> 2.26.0
>
