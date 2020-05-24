Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com [209.85.210.67])
 by mx.groups.io with SMTP id smtpd.web12.11358.1590316060269248714
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 May 2020 03:27:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=DpUntaOp;
 spf=pass (domain: konsulko.com, ip: 209.85.210.67, mailfrom: paul.barker@konsulko.com)
Received: by mail-ot1-f67.google.com with SMTP id 69so11823887otv.2
        for <openembedded-core@lists.openembedded.org>; Sun, 24 May 2020 03:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GirerfWfAl+5cfyAPd50RDMKyqefk3CR+cVfLFZutxA=;
        b=DpUntaOpWgZtrsPdygPxnjqJQJaQszpKwPBjM3p0epoxWvh0edYBedL3daMJHZ0zZr
         M6XsDVJ+g+tVQJd443MzZwq6OOfbEmOTl0OxY65tlLDbsqksD5cc63JKX4fJw9qbg6mQ
         EO+eLoygnAIBFkrMKqtT0KAqki+S0ufvytd0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GirerfWfAl+5cfyAPd50RDMKyqefk3CR+cVfLFZutxA=;
        b=XMEviXJJMvoFXk0jwm26YlJEgz+m9166PglqCj60g7RA5hTk0LD1vn91JK2koORwAj
         /dS5BlSQdyURCXo4wico/JLqmsnGca/21kvR0cF3b8G5f4CM1KMe+G/n+CKz2iWHRFHI
         zpI/HVn7YKwZZJ4wUkODKuQ5rYrSRRS2jipppS9UFe3rK4yZ4iVcJ2RPHV9Z0WdT+fzW
         4Oh2aYTOVr1XFzfrO9nL+HWhspage6N+fOiuqIJgron0BuCmOBOFARjbmI3CtSN7puS7
         zE+ycZvePYDHmeMOXVAX7DjYk7WBneq/hTC9NmYL1JwfCgH38xMAISqJ1JyAMY793sF5
         K9TQ==
X-Gm-Message-State: AOAM531p0zq64Zs6sc19bO/cQ2inNX+EJPoO5cOOMNfEsdBozZIljTtY
	b7Xa3pamvNwk7HiSekggZypvTVob0QYT54bsnpgknw==
X-Google-Smtp-Source: ABdhPJz9r5iahhCao5upvpugMkr1JFMGCaTmlnTSZC4gq5bS3LeULlAlGjbqae88PRezOUFsL3q0Y80pppUHBLCciDI=
X-Received: by 2002:a05:6830:54f:: with SMTP id l15mr16052646otb.305.1590316059606;
 Sun, 24 May 2020 03:27:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200524102404.3931276-1-gzatko@gmail.com>
In-Reply-To: <20200524102404.3931276-1-gzatko@gmail.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Sun, 24 May 2020 11:27:29 +0100
Message-ID: <CAM9ZRVv-kww8P5SEpkcq77Z-VxzUNAat+5AWgKJLEBu-29Gpnw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sanity.bbclass: Detect and fail if 'inherit' is used in conf file
To: Gregor Zatko <gzatko@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 24 May 2020 at 11:24, Gregor Zatko <gzatko@gmail.com> wrote:
>
> 'inherit' directive may not be used in conf files as it's supposed
> to be used for the inheritance of classes.
> Correct form in conf file is INHERIT.
>
> This commit adds:
> - a sanity check to find whether the wrong case exists
> - fail the build if so
> - tell user about the difference in directives
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=5426
>
> Signed-off-by: Gregor Zatko <gzatko@gmail.com>
> ---
>  meta/classes/sanity.bbclass | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 292c5591dd..e021b9d240 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -784,6 +784,12 @@ def check_sanity_everybuild(status, d):
>      if "." in paths or "./" in paths or "" in paths:
>          status.addresult("PATH contains '.', './' or '' (empty element), which will break the build, please remove this.\nParsed PATH is " + str(paths) + "\n")
>
> +    # Check whether 'inherit' directive is found (used for a class to inherit)
> +    # in conf file it's supposed to be uppercase INHERIT
> +    inherit = d.getVar('inherit')
> +    if inherit:
> +        status.addresult("Please don't use inherit directive in your local.conf. The directive is supposed to be used in classes and recipes only to inherit of bbclasses. Here INHERIT should be used.\n")
> +
>      # Check that the DISTRO is valid, if set
>      # need to take into account DISTRO renaming DISTRO
>      distro = d.getVar('DISTRO')
> --
> 2.26.2

From https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded:
Please substitute "PATCH" with "PATCH v2" if you are submitting a
revised version after addressing feedback (or v3, v4 etc.).

I've seen several versions of this patch today and it would be easy to
lose track of which one is the latest if they arrive in someone's
inbox out-of-order.

No need to re-send just for this but please add a version next time.

Thanks,

-- 
Paul Barker
Konsulko Group
