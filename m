Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.8380.1623760105836013744
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jun 2021 05:28:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JkjZdpZm;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id l1so22199493ejb.6
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jun 2021 05:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qBgJVn+5cnaVK835hCJnhatVmva1LDzizufR11TQ4qE=;
        b=JkjZdpZmEtixldpJSCaKnOg3p41Ou5JKXedgG860Dzsph3/vv3mNC6YiNQVDe/FcfF
         UuI6GuTyD8C/r3j8NzUhpKUND2qbgH+qbq+6dz458dC0e8ZCQNOGQx4G0248gXN1HzD4
         eryzWR78oc8on4vkijg5eSlV0SM9Y3ycSjnFpinh7gmLv/+hzUihPRkV8EgeWY7iGrgM
         mVs1OPrkgGGwZHE4aUovg0HrNQzaK99c4A8DqvHSx3XucEsoJwsVbJbNXTRz69cPxyJz
         RgFWNFYArlXon4mlEPWhubgox6Sl6k4dQ9tCxWHa9tfm85izaf9Nae+jYmhRr6elgcAK
         0I6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qBgJVn+5cnaVK835hCJnhatVmva1LDzizufR11TQ4qE=;
        b=Bo3ai7CTafvzj9VtfYq9IhztoeR7zo65sxg1GwqahUg2DWPl5RAC7oeCf1SbqSsjzJ
         Nlxny4owSCo6T748Sq4UZ8e/kdFCgHurXLAonQQEbHQJxy5wYhywbvIXVtSwINPrIZ9q
         HhHhaPRey1Q10JvFXJX/VmjDl/f8cjgUSYGU6tn97amIhRoxE8h8B5NdOn0d3CWJ8SZw
         JCUHbQK1hcKGmwbENvmYUGrn1coWJ7bNSt1HSTpopL2+A4TKtdWlGnkZgdXgoMzQZDXL
         Rcx+f3Q+reRVFc9j7nErXEDa9WfkUrOCHo1J95QLZP8IzPzHTsnvD9Ww03geXaQe5diR
         vL8A==
X-Gm-Message-State: AOAM5322W8jgf7c8QeW8VOZ7lngIvEWUESsZ34Hd97Ft/hdwiccpWg52
	f96TNAfveTvi11DJOBe6DLtnfDeAEI70FTzNp/o=
X-Google-Smtp-Source: ABdhPJyH/eDKsnyq0ZQr94cZTc60gL43sq3mr20b/hbDBVLkJ3nt8Gb/Q+JpaSB/9SQw8pGvsYxLaO+ZTKsJ/QH7GG0=
X-Received: by 2002:a17:906:8056:: with SMTP id x22mr19934507ejw.298.1623760104112;
 Tue, 15 Jun 2021 05:28:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210615100200.3325303-1-ross.burton@arm.com>
In-Reply-To: <20210615100200.3325303-1-ross.burton@arm.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 15 Jun 2021 08:28:13 -0400
Message-ID: <CADkTA4N_y-LcJj3+FbFgkdYtPZmPExj8qf-FrQ8pzeQy8t0F9g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd-conf: Prevent systemd-network from managing veth interfaces
To: Ross Burton <ross@burtonini.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 15, 2021 at 6:02 AM Ross Burton <ross@burtonini.com> wrote:
>
> From: Matt Spencer <matt.spencer@arm.com>
>
> We need to prevent systemd-network from managing veth interface when
> using platforms like k3s as they control creation and management of the
> interfaces.

FWIW, I think this may surprise/break people in other use cases. I had
mentioned this to matt directly as well.

The situation is not as clear as that commit message implies. networkd
*can* cause issues with veth devices, but not always.

Not trying to stop the patch, but I wanted my concerns to be archived :D

Bruce

>
> Signed-off-by: Matt Spencer <matt.spencer@arm.com>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-core/systemd/systemd-conf/wired.network | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/systemd/systemd-conf/wired.network b/meta/recipes-core/systemd/systemd-conf/wired.network
> index e7b69970d6..7406287248 100644
> --- a/meta/recipes-core/systemd/systemd-conf/wired.network
> +++ b/meta/recipes-core/systemd/systemd-conf/wired.network
> @@ -1,5 +1,6 @@
>  [Match]
>  Type=ether
> +Name=!veth*
>  KernelCommandLine=!nfsroot
>  KernelCommandLine=!ip
>
> --
> 2.25.1
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
