Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web09.10732.1626095531900035099
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jul 2021 06:12:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=okw0y76w;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id i20so34490251ejw.4
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 06:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6furKzSB/W1I4/q/hOO9Z3e6PYftPUeytONHoFRzb7U=;
        b=okw0y76w3MkAPH8rlm2vNPAEAgQI8ICv9YEv1U3UNN/FJ6SmN0PuIKRzp7CT48G2wz
         2txC3i/EJxjQwFEq6iptLvfZmcl4kbeD2DM50ql+w6GfipXKfl43RiGnFEpz9pMaDNdP
         K9jzLpq6B7zKXG1KtHfPm9DEWmxs/z969g35SK3F5DO+tZU4Hi9nO7sRdE85PoDvg+RX
         vKVkgH2KZmT4T0dlGs0gPHD5aYwtUQ1aYNQEEaEKpT+/CBrF6xFuyPy+AVuDRHPnu+tE
         sBcIYbxRzPmNg896bz/IlMHFK+X/wP5n70saGrPS7HPOBjJ6kKTMskxtkn5g6B8vsdB2
         mUHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6furKzSB/W1I4/q/hOO9Z3e6PYftPUeytONHoFRzb7U=;
        b=HMzqlP0bcdjwf2ZsDjhxyKVt+PSbU6jzgSJ7m2+XmesxzrAMHk4+gLlhqFu78VmONK
         nrp8Uj03l5apJq+sAnOfiF5Cq2aUP1ZXpEK5EWZuw/aIZTQ/FvcNFDZsuStHTBh+CQp1
         XaiNMKo3Y2iWz2goGmIlNxyJjYGhFaWAruhPUF+Duc5Q07qWn9cDZgg95isWgRLEOfq8
         iHjC6zeoqHlV8A2rBKy+bt8JsyB5x/UIW1+iz73Zay7JJ8MPwhxlJ3/netMDJwfKj008
         8tn+Pwqt7cXQuVPsSBVf2X2iOnqASt4RQ6poHOynrrY7e+sc0UICycKSoCSOXy9kR8bL
         VFkA==
X-Gm-Message-State: AOAM530LtRLwyanY6n4A04CjtyaGZr/yCvAkgzmNEvXVfjdAD2iK0SSf
	P98aIgC1IMG5/xtfzP1ad2UsBHDnyu41bbrRE1g=
X-Google-Smtp-Source: ABdhPJxied/EBlujbbGptW0sVvO1lWFPu4d6+PRfeVsLmz4sLV8zO1AFqWfY2OIF0lwtJskX5aHZ9n++9ES3e1O7WG8=
X-Received: by 2002:a17:906:4b46:: with SMTP id j6mr3183522ejv.247.1626095530364;
 Mon, 12 Jul 2021 06:12:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210712073225.39726-1-qiang.zhang@windriver.com>
In-Reply-To: <20210712073225.39726-1-qiang.zhang@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 12 Jul 2021 09:11:57 -0400
Message-ID: <CADkTA4NB_ZsUMoNHH6woGob6e61QaxGEcayikOg6A1M32201+A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel-devsrc: provide gen-cpucaps.awk and cpucaps for arm64
To: "Zhang, Qiang" <qiang.zhang@windriver.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 12, 2021 at 3:02 AM <qiang.zhang@windriver.com> wrote:
>
> From: Zqiang <qiang.zhang@windriver.com>
>
> In v5.13+ kernel, when exporting the SDK and make scripts prepare
> the gen-cpucaps.awk and cpucaps be needed. this change is based on
> 0c6c2d3615ef ("arm64: Generate cpucaps.h").
>
> Signed-off-by: Zqiang <qiang.zhang@windriver.com>
> ---
>  meta/recipes-kernel/linux/kernel-devsrc.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
> index 84e99233e6..b4af622d57 100644
> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> @@ -162,6 +162,9 @@ do_install() {
>              cp -a --parents arch/arm64/kernel/vdso/note.S $kerneldir/build/
>              cp -a --parents arch/arm64/kernel/vdso/gen_vdso_offsets.sh $kerneldir/build/
>
> +            cp -a --parents arch/arm64/tools/gen-cpucaps.awk $kerneldir/build/
> +            cp -a --parents arch/arm64/tools/cpucaps $kerneldir/build/

This is already in a patch that I sent on July 2nd.

cb1b7e76f20dc7f11a667fa00958ab56e680c632 [kernel-devsrc: fix
scripts/prepare for ARM64]

Also, the context of this branch is different from what we have in
master, so I'm not sure what baseline you are working from.

Bruce



> +
>              cp -a --parents arch/arm64/kernel/module.lds $kerneldir/build/ 2>/dev/null || :
>         fi
>
> --
> 2.17.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
