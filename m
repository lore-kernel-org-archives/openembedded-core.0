Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web12.2311.1607024729551260439
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 11:45:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=S4IuBWHc;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id ek7so1582428qvb.6
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 11:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mmwihm2+zhSs/0dHVkbWwjVurLkKrlYYqVJI4eZH7CY=;
        b=S4IuBWHcrd6vQKRA92Zr1un2vO741GVGM5lHVwKDIUb7wXOS1yGHnYhxLSZOGmgQAT
         CLrWJmXtrPPipFADR7M2ccxzLyekBW5ZIDXaS9i2qQ+1aLcnC6HY9deZEuZH4gbHqa6K
         K/YJ6QKPW00fQ1tWFnxmdvfbMsNjFcW7ZP0z/9vJbmUEok2CAtQaSCpqqhtPAjva4S1O
         RO7YozfHR9EvDHOryE/56GQ4NOjJDxJEbxreAytb2z7LX0hkuCOCmo7IqhyopN0MEdFW
         0T5zu7tl49LIihsIXejhe9GDH29BYrOIIAcLjvezEw51BVYF7FnIevPQvKg9MO++mgWx
         DoTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mmwihm2+zhSs/0dHVkbWwjVurLkKrlYYqVJI4eZH7CY=;
        b=MX149zfh+HKv5t2nl8nwTZm8AvPOvQm8mNjE9ViNpoXG7yGJbh+4ReRLSq7u5D+OaB
         RECa3qaVwzq0PcyRdsjwEVxnLDP7JgkGRIyvp5cbfKBCMphk0+MpqkqaNKFNTwt2grUt
         xgHub4Lr0RxjEgHryZ4ktzLNrA5aBwQ6YbEnjy0iVrzfqGBMO0v3fqY2+DhsO7wQAF/i
         2HfT/zeFuH227+JNQ1QCAi2wjAkI/xIqlYXZqouXWLIbKIR/ipVMaAZhYI07W4R9+VYV
         Wt+ApmJYFgUXN++a7AG33q6ri1k0J3JoTP+IXHZRyPC2sRQT47f2x8GdPnaVvgBBHMEN
         wUmA==
X-Gm-Message-State: AOAM530bpvZZkJdmMQGEc9xM6bsZD72K+JFbDfzX76uEvxuYMkV3W964
	P+6sMLgFcEtRECjcevsCnQ+Qkmyz6t2mYc6SEqc=
X-Google-Smtp-Source: ABdhPJxm8MYf86+eGotVLPN1Ab3eoBbELbN3uYGhm+g2OS/Ltpuv7EEespsZhIZCKxT23RBh0fBA6gqWZfGOeAsQkxQ=
X-Received: by 2002:ad4:4b67:: with SMTP id m7mr600448qvx.5.1607024728609;
 Thu, 03 Dec 2020 11:45:28 -0800 (PST)
MIME-Version: 1.0
References: <20201203133727.12936-1-alex.kanavin@gmail.com> <20201203133727.12936-9-alex.kanavin@gmail.com>
In-Reply-To: <20201203133727.12936-9-alex.kanavin@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 3 Dec 2020 11:45:02 -0800
Message-ID: <CAMKF1srdJ-vJ_dbh4XWEBwuEZwWQ_g=SN2rY6ENmDP-z0teC=A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 09/11] llvm: sort the lists in generated source reproducibibly
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 3, 2020 at 5:37 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  ...r-sort-ClassInfo-lists-by-name-as-we.patch | 31 +++++++++++++++++++
>  meta/recipes-devtools/llvm/llvm_git.bb        |  3 +-
>  2 files changed, 33 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
>
> diff --git a/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch b/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
> new file mode 100644
> index 0000000000..20eea060b1
> --- /dev/null
> +++ b/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
> @@ -0,0 +1,31 @@
> +From 86940d87026432683fb6741cd8a34d3b9b18e40d Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Fri, 27 Nov 2020 10:11:08 +0000
> +Subject: [PATCH] AsmMatcherEmitter: sort ClassInfo lists by name as well
> +
> +Otherwise, there are instances which are identical in
> +every other field and therefore sort non-reproducibly
> +(which breaks binary and source reproducibiliy).
> +
> +Upstream-Status: Pending
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + llvm/utils/TableGen/AsmMatcherEmitter.cpp | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/llvm/utils/TableGen/AsmMatcherEmitter.cpp b/llvm/utils/TableGen/AsmMatcherEmitter.cpp
> +index ccf0959389b..1f801e83b7d 100644
> +--- a/llvm/utils/TableGen/AsmMatcherEmitter.cpp
> ++++ b/llvm/utils/TableGen/AsmMatcherEmitter.cpp
> +@@ -359,7 +359,10 @@ public:
> +     // name of a class shouldn't be significant. However, some of the backends
> +     // accidentally rely on this behaviour, so it will have to stay like this
> +     // until they are fixed.
> +-    return ValueName < RHS.ValueName;
> ++    if (ValueName != RHS.ValueName)
> ++        return ValueName < RHS.ValueName;
> ++    // All else being equal, we should sort by name, for source and binary reproducibility
> ++    return Name < RHS.Name;

this change looks good to me. it would be good to post it upstream as
well via phabricator to get additional reviews from LLVM community as
well.

> +   }
> + };
> +
> diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
> index b146d0e6e3..43395f8cfc 100644
> --- a/meta/recipes-devtools/llvm/llvm_git.bb
> +++ b/meta/recipes-devtools/llvm/llvm_git.bb
> @@ -33,7 +33,8 @@ SRCREV = "ef32c611aa214dea855364efd7ba451ec5ec3f74"
>  SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH} \
>             file://0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch;striplevel=2 \
>             file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
> -          "
> +           file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
> +           "
>
>  UPSTREAM_CHECK_GITTAGREGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
>
> --
> 2.29.2
>
>
> 
>
