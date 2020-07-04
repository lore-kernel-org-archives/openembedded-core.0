Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web12.12404.1593829529668144948
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2020 19:25:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YjCTnSHM;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id e22so29317384edq.8
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2020 19:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=tRglmCppyhSd+lQYmbWP3RqwuOp1llhve8vef+gC7EM=;
        b=YjCTnSHMWzT6TopqG7+DkyuI9if3EtA/tfBUmWODjXqyfNHjjGTmDoYuIOIdl8MCLy
         ZK/AJfRkCtPEs7gnBlidZvNhbgbpvLf8t8sLif86z0tftJ3WJkoG8gWdMWLVV07rgA2Q
         TfrnwiJ9Wwm1Pr/wYDPxlVWrK9vGSbGUnsHy/mcprmRHFoBz+8kd56AmYzkHoeDv93Kq
         8qy12NW+yWQ+DfD6RNTq4U4mBy97P5mhTqKLtv8n2eTR7fnYoUvVfESwcg7ww3Tdgx/W
         3VQsM3inRLxG86MgzppI7OwtKbJ3+Lj4Gl7IRIn52f5uEuKvcs4xx5vOtd6JbDN+UiYc
         zjew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=tRglmCppyhSd+lQYmbWP3RqwuOp1llhve8vef+gC7EM=;
        b=PRKmlNDSir6aZ9GgMxo1Gy2oJM75WsKhEyXY5BJQGOXRxGnGxg6Ku7jam4N1Adyl8r
         DVcRfBKJ/SDQHH94yXeetGPS+T6WMMS9Cv4JPAVvcMKuB9GPjBhKKsP1mGa8ZzujEuH9
         1yflmZl9jKmLp25WyxPTW4ZmofaWJd0UptBUWm6JKmKHe0b3NWykw2QVouS7iCuSLGxu
         dw6gXid1hcnMLVxr8nLfGhreugqCXdaOjyVqEnqIgNkSgxUsxv6hgg/7WX5hUxCtaiVW
         YB67RAIarOASuEbl17U8+BMP9I+8+8fU2szw/RkVIhNwvvf7Utj6x3DtbA8nDDp5j4HG
         9AZA==
X-Gm-Message-State: AOAM531k5AY24VMPJ9UCsPTMg4ASpGLWpEcjpGfchg7eodPRtBsjf2Ds
	iab7nc8r9f1KdBUWIyrEleVk4isT1TKZeDaWai0=
X-Google-Smtp-Source: ABdhPJxrvdiAQgNfXoQCxpKldpCKAjZTxqdpBn6WxHxhHhooGQtQm2hVIZL65qvvyYzMAaWAFPU46u4jLVV7gB6icmk=
X-Received: by 2002:aa7:db11:: with SMTP id t17mr42330055eds.365.1593829528107;
 Fri, 03 Jul 2020 19:25:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200704011830.6i2uyextz7oml4sk@vctlabs.com>
In-Reply-To: <20200704011830.6i2uyextz7oml4sk@vctlabs.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 3 Jul 2020 22:25:17 -0400
Message-ID: <CADkTA4Pn=bR_+Nrdq1RT0K=4VoCR_BnP=+=VhHzx364Q+D_wjQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel-yocto.bbclass: fix failure to find defconfig
To: "S. Lockwood-Childs" <sjl@vctlabs.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 3, 2020 at 9:15 PM S. Lockwood-Childs <sjl@vctlabs.com> wrote:
>
> Fix build failure in do_kernel_metadata
>
> do_kernel_metadata: Could not locate BSP definition for $MACHINE/standard
>                     and no defconfig was provided
>
> The original awk statements looking for the current MACHINE's defconfig
> expected to find an entry from SRC_URI that exactly matched 'defconfig'.
> In fact, the actual defconfig entry in SRC_URI had been resolved to a
> full path inside the working dir, e.g. '/path/to/workdir/defconfig'
>
> Instead of an exact match, use a looser criteria of matching (or not
> matching) 'defconfig' as a word in the current record, which still works
> if there is a path in front of it. This should achieve the intended
> objective of splitting the list into defconfig and non-defconfig
> entries.

We already have a patch on the list for this.

Cheers,

Bruce

>
> Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
> ---
>  meta/classes/kernel-yocto.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> index 41d8620e67..97d6f61850 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -156,9 +156,9 @@ do_kernel_metadata() {
>         # a quick check to make sure we don't have duplicate defconfigs If
>         # there's a defconfig in the SRC_URI, did we also have one from the
>         # KBUILD_DEFCONFIG processing above ?
> -       src_uri_defconfig=$(echo $sccs_from_src_uri | awk '{ if ($0=="defconfig") { print $0 } }' RS=' ')
> +       src_uri_defconfig=$(echo $sccs_from_src_uri | awk '/\<defconfig\>/ { print $0 }' RS=' ')
>         # drop and defconfig's from the src_uri variable, we captured it just above here if it existed
> -       sccs_from_src_uri=$(echo $sccs_from_src_uri | awk '{ if ($0!="defconfig") { print $0 } }' RS=' ')
> +       sccs_from_src_uri=$(echo $sccs_from_src_uri | awk '!/\<defconfig\>/ { print $0 }' RS=' ')
>         if [ -n "$in_tree_defconfig" ]; then
>                 sccs_defconfig=$in_tree_defconfig
>                 if [ -n "$src_uri_defconfig" ]; then
> --
> 2.20.1
>
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
