Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.8261.1612447413503399959
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Feb 2021 06:03:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XQB/AgS3;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id y8so4227911ede.6
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Feb 2021 06:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jsYFHM/OXhmaODDnGNVYJO+PPMEgeEW3tLNC2JKOz3Y=;
        b=XQB/AgS39xH7iUJxh6ETZQFYzWPYDr9PZpFHf0OcjDLyN6GKIjy2F2WOwEMYzne6Vv
         XtQGPGNDGVPwlXMZcprBM6zMUtEnfMKVeZNzP+keXG5S/LMpqalDxzR3fpolmwdGC5y7
         QrIngheIyyF9i6ZNV3C+Y3NFa12o92zRibh/enaccli9JMVP24IM4CCQMTcCYIIHrzTZ
         IWkCcH7FxUyWxuj0TyHJ0x1b72qGv9fOS83/K4aVSdiRwZBpIsvH3e3az4L3j4ZVo2/A
         qNTzjnLG7LVbe3ejPljCLvcfJ701QpDgwifitFMUFRBudNrckCBRhiApgzZamZRQFkMk
         AK6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jsYFHM/OXhmaODDnGNVYJO+PPMEgeEW3tLNC2JKOz3Y=;
        b=EJeXTDNxKm4i0IXUCh2e1uF+Sx2J3tgpNIfj22lOzO6rBJNtufvEm1k43E3vZc+/oc
         PQj1jijDp4D9h9aUOc+ziECvI4ys1S6a3A9PEsmcAVe2atH/5WLhI9O9nTrzuNUv29mA
         v7qseM9UMEYMLvD+unq8xiTVsWuJhNSfoGgxH8RXlQsuoZY26jdxLS19l4pFbKsYCBJC
         aH8pRELOQ6SbZ5lhZGDr/aA+NmI55HF0pPUkEpvgqe938ss5S6haLv/ccjCIbTQGW0Rt
         zMMbd9x/8t+R/02FCiZNI4r9Ay3Vyhbzf8YLJwyjRSbhA/D24NTVP7CgqqqToHpoNXO3
         QkQg==
X-Gm-Message-State: AOAM5336ZOPVBif4XtVuR0sOuZsWpTpxYdoUdj0G7d07JAgZKq8+ov7q
	iFFjKYLuJ1l/7wzXTP6D7rpBSaAPdpe+2usxUwY=
X-Google-Smtp-Source: ABdhPJy8Pp4x3JPxq1ZtwXfSYzyYW6s5ZKPjs6XqlekVMTmfdxMmh8VrCIV4c7NvUTj5az+fYHJmKPVpK6uDrQjPRHQ=
X-Received: by 2002:a05:6402:26c9:: with SMTP id x9mr8111170edd.365.1612447411802;
 Thu, 04 Feb 2021 06:03:31 -0800 (PST)
MIME-Version: 1.0
References: <20210204121323.1696-1-tomasz.dziendzielski@gmail.com>
In-Reply-To: <20210204121323.1696-1-tomasz.dziendzielski@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 4 Feb 2021 09:03:20 -0500
Message-ID: <CADkTA4NU2ykdZ7QNmsR0oZE8JaYXonyQ0acghSfs7V6+A3T9kw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] license_image: Introduce SKIP_LICENSE_MANIFEST_RECIPES variable to prevent from trying to use license recipeinfo file from image recipes
To: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 4, 2021 at 7:10 AM Tomasz Dziendzielski
<tomasz.dziendzielski@gmail.com> wrote:
>
> If image recipe depends on another image recipe it will try to use
> license recipeinfo that is not deployed. It will result in:
> | Exception: FileNotFoundError: [Errno 2] No such file or directory:
> | 'TMPDIR/deploy/licenses/foo-image/recipeinfo'
>
> We can't determine in a simple and efficient way if dependency recipe
> inherits image.bbclass, so let's introduce SKIP_LICENSE_MANIFEST_RECIPES
> variable that will contain list of recipes that should be skipped.
>
> Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
> ---
>  meta/classes/license_image.bbclass | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_image.bbclass
> index 8fd88cfb2d..e2f3178306 100644
> --- a/meta/classes/license_image.bbclass
> +++ b/meta/classes/license_image.bbclass
> @@ -223,7 +223,8 @@ def get_deployed_dependencies(d):
>      pn = d.getVar("PN", True)
>      depends = list(set([dep[0] for dep
>                      in list(taskdata.values())
> -                    if not dep[0].endswith("-native") and not dep[0] == pn]))
> +                    if not dep[0].endswith("-native") and not dep[0] == pn
> +                    and dep[0] not in (d.getVar("SKIP_LICENSE_MANIFEST_RECIPES", True) or "").split()]))

I didn't see anything on the docs mailing list, but we should also
have a matching update to the docs for the new variable (unless it is
already in the docs, I didn't check for that).

Cheers,

Bruce


>
>      # To verify what was deployed it checks the rootfs dependencies against
>      # the SSTATE_MANIFESTS for "deploy" task.
> --
> 2.30.0
>
>
> 
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
