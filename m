Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.223.1626814781818035437
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jul 2021 13:59:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fn/iqnaq;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id go30so36312728ejc.8
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jul 2021 13:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a82xRNhX4xf/+SDSp3SuhEX+Ba8dbNzJX4mycR2mXQc=;
        b=fn/iqnaq/w8KFeWj7Da6Y1fK96+r2Ut4X4d0opSG+Pf0/jFhFAH6Ojd0+iRxrlxgYT
         1KT6wxhVqlXvWdqrdlnNTYSHtlfvtGZ71axvWfAj5WB4FlOqE09HegPCwch4qqIAA5cT
         se56OD4XOqYBr1DoK+CwWwllOF9s9MMUpOUtFLtWCAt+VhxQxwBxxLegUZlhcDJzMpt7
         inOyJytm6KGVIlBQkhlWzQsF9oQCRq2oRGJG3TXCkmFVVUknHVmIfbBiXmi404fDZEd2
         WbN73o8yr9aPaVNPEvWaKUEAm1U0E1TyH2YEodZILVvO8T4nVNUhIEOwWjalO9sZRGH0
         VALQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a82xRNhX4xf/+SDSp3SuhEX+Ba8dbNzJX4mycR2mXQc=;
        b=NKepBAqDvI6iXlbgXIf+K6dJUWZL27CMIi7i3AbgrjCVrk+jNp+l8MhNvo82fITmAp
         C+q/1U9IBglBmaU/k6Cs74FcSacijU/uWSew2Vem8XK5WBVKgwCyAMZUY7gqJmyGKWQ+
         5vq1jNA3k30O0paoc7uaHkUr25eM56LYHEBJj285HUelBKpFr+LOEP7fhnQUQkg+3gQG
         qtB8br6Gdx/MxDJPC2M+NU9B3X7S/xE5IeumtGaSZmn9nIUrnhV5vTE5hqXP4cU5RUwm
         Yd0ukkONZP5dj94vE6qIGteBW/zoVUig52WXE292bVEghHixN1XlY/CNcgzFYoEaLXJL
         Tqqg==
X-Gm-Message-State: AOAM531jl2zhZEJ5ibxFiO21nXLzpNJ05nUO7jK1x2vVL91NfssflTPk
	Yhw3ts3mF/PJzoI6mRkUyXlYFvYaDjncrXNh9a4=
X-Google-Smtp-Source: ABdhPJzZ/VHeN6i+0cmmnzlxeIfdyp2B9RREc9qjhTsyCGTXZTq2ItcHL+RaOZqqn/87HdLSLyvxvarxwQjvUTJzHr4=
X-Received: by 2002:a17:906:c7d6:: with SMTP id dc22mr35225741ejb.517.1626814780085;
 Tue, 20 Jul 2021 13:59:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210720201034.25900-1-paul@pbarker.dev>
In-Reply-To: <20210720201034.25900-1-paul@pbarker.dev>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 20 Jul 2021 16:59:29 -0400
Message-ID: <CADkTA4OzrV-_ycu=4tM_uR9JkON+8h3S0M==YCzuMXqFa-UAGQ@mail.gmail.com>
Subject: Re: [PATCH] linux-yocto: Fix devupstream SRCREV assignment
To: Paul Barker <paul@pbarker.dev>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 20, 2021 at 4:10 PM Paul Barker <paul@pbarker.dev> wrote:
>
> Fixes the following error when building linux-yocto-upstream:
>
>     Fetcher failure: Unable to find revision 570e7aedcd00e7e8a218e37c3dfb3b1fda83d111
>     in branch v5.13/base even from upstream
>
> The error occurred as the SRCREV_machine assignment earlier in the
> recipe was being used instead of the mainline commit hash we want to use
> for linux-yocto-upstream.
>

Odd that I didn't see this, since I've been using this heavily for a
week. But I switched builders and I did trigger the same error.

One of my local development layers was clobbering the SRCREV format,
so my assignment of SRCREV directly (versus machine) was working.

RP: Grab this one directly, I'll have more version bumps that will
follow in not too long, but there's no sense waiting.

Bruce


> Signed-off-by: Paul Barker <paul@pbarker.dev>
> ---
>  meta/recipes-kernel/linux/linux-yocto_5.13.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.13.bb b/meta/recipes-kernel/linux/linux-yocto_5.13.bb
> index df385f912c..f43e738c69 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_5.13.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_5.13.bb
> @@ -31,7 +31,7 @@ SRCREV_meta ?= "4dcaa4bcd042d398e210b702449dd35fdf9f0078"
>  # normal PREFERRED_VERSION settings.
>  BBCLASSEXTEND = "devupstream:target"
>  DEFAULT_PREFERENCE_class-devupstream = "-1"
> -SRCREV_class-devupstream ?= "f86aa267e180b23d8d24ee6886bd3bf9a360112e"
> +SRCREV_machine_class-devupstream ?= "f86aa267e180b23d8d24ee6886bd3bf9a360112e"
>  PN_class-devupstream = "linux-yocto-upstream"
>  KBRANCH_class-devupstream = "v5.13/base"
>
> --
> 2.26.2
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
