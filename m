Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web10.1856.1607022979810828986
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 11:16:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=glSu+iBc;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id u21so2174043qtw.11
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 11:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zmO7CizAqQyhdwX5DxqwjLyOZrIvZadQaJXm+7AuhtY=;
        b=glSu+iBcoLyIXsT+auZbrZ7ozB28hJ43Aov1NHqjGVN+oWz+hljjzHjPA8dRPYh3yv
         pjT21vRlKD2/yIteH6pefGsbmeWXnaKxMsjCLwEYh9rbpo6QT5nLWsdWo9zqlA++qWRz
         cLY/uuWXNZbYJ0oF+XR+jndM8IZbkg9e4meokwdqUro541FWNhCZAQN4I/aaDyXp4y76
         CwSzjdQuInDq9R5zWFCgYmTtH5Geb3uYeV5j+xyJONaipor0QhN3FZgTuN53nhjKJtxy
         a5WMdQ/xWPWFaFPyD+CVumitjTvCKOncpLGcZD7HctvHMIPEVgSBUbdps2r+u8K0wZvQ
         cZcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zmO7CizAqQyhdwX5DxqwjLyOZrIvZadQaJXm+7AuhtY=;
        b=BDsC3Wo1GAEFW5kWHgsZKhXd5LW1wQLNbGO09tbo1UgfUWUk8Oo8sx4fZWDuvHUOFo
         lYKs6WmIaaKnlU2C2JHKYZTFPXI1Vh+RhSpKXdkRwM6+gdpbzpFoTeKG0eKwQtEEj+kw
         vDrXOPMTKb3COgmW6AVOAa7gfQX230r+glmuKRbTyVa5TL3oOzora7UCYSY9b3pMhgET
         sz7BgrcHfBl6bIm9SlBKhhLM5W9lTvRHOlduOlpWZVsXXPR675mruYDHglLAPDzCyPX1
         DKLRSvZeP8utHcwjH+zRB9rtWn5opfmV0WD4xa/Ar+edpKgABFNtAst4r3p1YuafCIii
         zBYw==
X-Gm-Message-State: AOAM530SxG03YPIduNxa+RCCz3M0Z+sAzb49eJWLS6ql/bm3fYSlgtAw
	vY9l18OG+U7yz9HVoAYq9L4gnN2tKR5sNH6E3c8=
X-Google-Smtp-Source: ABdhPJyt7o2Xyzj3QlFr29WpmpoocGY9aB6i3L7AnAp0PNy1jRC2Vm/GoWz95RmVwwGFBqx0CHsCUJJztrJ84N7e6gY=
X-Received: by 2002:ac8:3417:: with SMTP id u23mr4868515qtb.80.1607022978870;
 Thu, 03 Dec 2020 11:16:18 -0800 (PST)
MIME-Version: 1.0
References: <20201203133727.12936-1-alex.kanavin@gmail.com> <20201203133727.12936-4-alex.kanavin@gmail.com>
In-Reply-To: <20201203133727.12936-4-alex.kanavin@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 3 Dec 2020 11:15:52 -0800
Message-ID: <CAMKF1sqM-xmu-L-nhRKsf-A1Loiv0U72zV6jcNXyEy9QOLXdNw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 04/11] ruby: fix reproducibility
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 3, 2020 at 5:37 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  ...e.in-do-not-write-host-cross-cc-item.patch | 32 +++++++++++++++++++
>  meta/recipes-devtools/ruby/ruby_2.7.2.bb      |  1 +
>  2 files changed, 33 insertions(+)
>  create mode 100644 meta/recipes-devtools/ruby/ruby/0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch
>
> diff --git a/meta/recipes-devtools/ruby/ruby/0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch b/meta/recipes-devtools/ruby/ruby/0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch
> new file mode 100644
> index 0000000000..826daf2cda
> --- /dev/null
> +++ b/meta/recipes-devtools/ruby/ruby/0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch
> @@ -0,0 +1,32 @@
> +From 2368d07660a93a2c41d63f3ab6054ca4daeef820 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Tue, 17 Nov 2020 18:31:40 +0000
> +Subject: [PATCH] template/Makefile.in: do not write host cross-cc items into
> + target config
> +
> +This helps reproducibility.
> +
> +Upstream-Status: Inapproppriate [oe-core specific]
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + template/Makefile.in | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/template/Makefile.in b/template/Makefile.in
> +index 10dc826..940ee07 100644
> +--- a/template/Makefile.in
> ++++ b/template/Makefile.in
> +@@ -657,11 +657,11 @@ mjit_config.h:
> +       echo '#endif'; \
> +       quote MJIT_MIN_HEADER_NAME "$(MJIT_MIN_HEADER_NAME)"; \
> +       sep=,; \
> +-      quote "MJIT_CC_COMMON  " $(MJIT_CC); \
> ++      quote "MJIT_CC_COMMON  " ; \

where is this template used ? is it used on target ? is it possible to
just all bare compiler name then since it will still work on target
although not as important as if it was needed during cross builds.

> +       quote "MJIT_CFLAGS      MJIT_ARCHFLAG" $(MJIT_CFLAGS); \
> +       quote "MJIT_OPTFLAGS   " $(MJIT_OPTFLAGS); \
> +       quote "MJIT_DEBUGFLAGS " $(MJIT_DEBUGFLAGS); \
> +-      quote "MJIT_LDSHARED   " $(MJIT_LDSHARED); \
> ++      quote "MJIT_LDSHARED   " ; \
> +       quote "MJIT_DLDFLAGS    MJIT_ARCHFLAG" $(MJIT_DLDFLAGS); \
> +       quote "MJIT_LIBS       " $(LIBRUBYARG_SHARED); \
> +       quote 'PRELOADENV       "@PRELOADENV@"'; \
> diff --git a/meta/recipes-devtools/ruby/ruby_2.7.2.bb b/meta/recipes-devtools/ruby/ruby_2.7.2.bb
> index 055ea9343f..db6d672985 100644
> --- a/meta/recipes-devtools/ruby/ruby_2.7.2.bb
> +++ b/meta/recipes-devtools/ruby/ruby_2.7.2.bb
> @@ -6,6 +6,7 @@ SRC_URI += " \
>             file://remove_has_include_macros.patch \
>             file://run-ptest \
>             file://0001-Modify-shebang-of-libexec-y2racc-and-libexec-racc2y.patch \
> +           file://0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch \
>             "
>
>  SRC_URI[md5sum] = "2d4a28dcfa38352a627a597f6057c465"
> --
> 2.29.2
>
>
> 
>
