Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web12.11768.1613585131553640362
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Feb 2021 10:05:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LBUQdPe8;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id w5so4813848qts.12
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Feb 2021 10:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3/rbR0jXf8q3fxmlZtmLgZW85W9uM0IpEINvsE/z5qI=;
        b=LBUQdPe8gQk6PWssFftwAEoKIIbGUvw4rCvSPO7rg2duYT055SJyVMwYO3BojrCYvo
         58GL9LOn/g1VlnHFEt7O15DKIFzG2hflTsS4JdH8PYx4AShpvZbfLfKyJV1IOFIM0zdi
         Sumld/ExKD5JSJFH45RYQQrHyiFGh3huj8uGDsQjrjvfUWEGF2uHhGdJL9qhGRTKYGEW
         NtB3kMv0HD+YdS9Ubp9cje0o0tjjF4to6+U5Mw75Qb8mTBb6nQoR+erZiOpv+5m7KGRb
         q5T166ZKTvC1oX9HPsY3UhsViIMe6npRoONdePI82UeUlrFyPZrf96g062pJYvZH3Uvh
         McXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3/rbR0jXf8q3fxmlZtmLgZW85W9uM0IpEINvsE/z5qI=;
        b=s6qjlvg27NyjIxC4oxX3E2N8PDNTy8ooXihIIdSqPjYMrSWmMp/YhHjEOHk9rj+tdc
         OrH8YFUkfwngORGjzsKKL4/GGeFaKeZlDhJ/QDbIzqukiN9mgMv7mBeHLNDPfZ85Tg4c
         no8lnceEXzUca2RG5CIrrZztTXyrMBd+LrNcc9E4CXrbYoOF5Q+fH4eqgnxLtMXSikQ5
         oEeE4pF/RLxz8orzcZMpoAzHa2ETqMC1OctkdsoPCRZEOe7iKcQZGnPEv8Gx6wF+2hFn
         wCVckgK30ntIWcXRNhMe2P2Rl7Yq9LA24exv1XmCtHDo/pNrZ+tgLTLlxKbgi4UwqeLL
         1xwg==
X-Gm-Message-State: AOAM533Gx3L1ExX6emRyvMBed79yp1SKTB0bCEkrnxEExxO89qVS/OF5
	qgZQ8hqUnZW+HPNdOtXjUpd2bQarbZ3KC69ZKSM=
X-Google-Smtp-Source: ABdhPJzIGvcHu7dDiYxOEsGbcEgmQ1DcR6hrwJGE6g947tdS43IxpLfeUgS7K9R6XqSIv6bXQhdoKcj4wiyVfUJfUgs=
X-Received: by 2002:ac8:745:: with SMTP id k5mr488315qth.214.1613585130658;
 Wed, 17 Feb 2021 10:05:30 -0800 (PST)
MIME-Version: 1.0
References: <20210216190600.2038009-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20210216190600.2038009-1-richard.purdie@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 17 Feb 2021 10:05:03 -0800
Message-ID: <CAMKF1spnShJ96Xo+Laj4-aCUEXizKWAMkgO+P1Fq=kTmLX2A0A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] qemu: Refresh mmap fixes patch status/content
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

I am seeing musl builds are hung in qemu now, I suspect this change is
causing it.

On Tue, Feb 16, 2021 at 11:06 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> One mmap patch was merged upstream, the other is in progress but after
> discussion has been amended and resent. Update the patches as such.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/qemu/qemu/mmap.patch  |  2 +-
>  meta/recipes-devtools/qemu/qemu/mmap2.patch | 26 ++++++++++++++++-----
>  2 files changed, 21 insertions(+), 7 deletions(-)
>
> diff --git a/meta/recipes-devtools/qemu/qemu/mmap.patch b/meta/recipes-devtools/qemu/qemu/mmap.patch
> index 0f7d2ce04c2..edd9734f30a 100644
> --- a/meta/recipes-devtools/qemu/qemu/mmap.patch
> +++ b/meta/recipes-devtools/qemu/qemu/mmap.patch
> @@ -9,7 +9,7 @@ avoid asserting binaries when reserved_va is set.
>  This meant a test case now gives the same behaviour regardless of whether
>  reserved_va is set or not.
>
> -Upstream-Status: Pending
> +Upstream-Status: Backport [https://github.com/qemu/qemu/commit/ccc5ccc17f8cfbfd87d9aede5d12a2d47c56e712]
>  Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
>
>  Index: qemu-5.2.0/linux-user/mmap.c
> diff --git a/meta/recipes-devtools/qemu/qemu/mmap2.patch b/meta/recipes-devtools/qemu/qemu/mmap2.patch
> index 9d40565938f..1652131757b 100644
> --- a/meta/recipes-devtools/qemu/qemu/mmap2.patch
> +++ b/meta/recipes-devtools/qemu/qemu/mmap2.patch
> @@ -6,21 +6,35 @@ if it only sees ENOMEM and only exits when it hits EFAULT.
>
>  According to the docs, trying to mremap outside the address space
>  can/should return EFAULT and changing this allows the build to succeed.
> -Whether this should be fixed in qemu and/or musl, not sure.
>
> -Upstream-Status: Pending
> +A better return value for the other cases of invalid addresses is EINVAL
> +rather than ENOMEM so adjust the other part of the test to this.
> +
> +Upstream-Status: Submitted [https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg01355.html]
>  Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
>
>  Index: qemu-5.2.0/linux-user/mmap.c
>  ===================================================================
>  --- qemu-5.2.0.orig/linux-user/mmap.c
>  +++ qemu-5.2.0/linux-user/mmap.c
> -@@ -727,7 +727,7 @@ abi_long target_mremap(abi_ulong old_add
> -          !guest_range_valid(new_addr, new_size)) ||
> -         ((flags & MREMAP_MAYMOVE) == 0 &&
> -          !guest_range_valid(old_addr, new_size))) {
> +@@ -722,12 +722,14 @@ abi_long target_mremap(abi_ulong old_add
> +     int prot;
> +     void *host_addr;
> +
> +-    if (!guest_range_valid(old_addr, old_size) ||
> +-        ((flags & MREMAP_FIXED) &&
> +-         !guest_range_valid(new_addr, new_size)) ||
> +-        ((flags & MREMAP_MAYMOVE) == 0 &&
> +-         !guest_range_valid(old_addr, new_size))) {
>  -        errno = ENOMEM;
> ++    if (!guest_range_valid(old_addr, old_size)) {
>  +        errno = EFAULT;
> ++        return -1;
> ++    }
> ++
> ++    if (((flags & MREMAP_FIXED) && !guest_range_valid(new_addr, new_size)) ||
> ++        ((flags & MREMAP_MAYMOVE) == 0 && !guest_range_valid(old_addr, new_size))) {
> ++        errno = EINVAL;
>           return -1;
>       }
>
> --
> 2.27.0
>
>
> 
>
