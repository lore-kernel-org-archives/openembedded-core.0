Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com [209.85.217.66])
 by mx.groups.io with SMTP id smtpd.web12.989.1591743574179222387
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2020 15:59:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tr8nqWGI;
 spf=pass (domain: gmail.com, ip: 209.85.217.66, mailfrom: armccurdy@gmail.com)
Received: by mail-vs1-f66.google.com with SMTP id y123so126918vsb.6
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2020 15:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QH+w0BRLoheVf0fn9Vfce2oSbG5gdVWbjaIJmBVal3s=;
        b=tr8nqWGIF1X+w/7wP1Jooc1N8XI+k2T0pD4BGEtW2bZ6ocZyIaZjcGVZUYBLrwkyyB
         h9+bpGhdhgepBZ/umKMwUZCWgVccLCrzl37YntyxmvseRlWrL/EW6OZOs5jXfQhK5HnW
         Rhzb0tmrQmiY62mylTK3UxchYR71ygOrIqy78nZuzh7UwaR94bJboXSa19q86Y5MBF1W
         lW7RqHjxIPTbLv2zYpdilM+Ctbtr/5gwd5pI/A+XP4aCuoTuvR8Nx14RoJX7bLy9TAOV
         pI+m1+UxTQAvk8gIHoKd5Nd2uT8fjpuPBZm8LVl0fBPXzArMdqNGCEKNCGVD1RtUV9cJ
         6Eig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QH+w0BRLoheVf0fn9Vfce2oSbG5gdVWbjaIJmBVal3s=;
        b=T1ja0Xeh0cOQ4ehjYAWFyV9f+c4zPDX/G9HR1okoessbQmZw36VigWql/N9od33ro2
         /or91sUg9UxyVldPVKUJ1G2OjE+8KdwrgR2ezGJOSWfzLGOerreC86sW8s+hSNAhNhN8
         3ITNKX8cn/87AByPJVsB4AXLCXc19Xc0cVbukhMG5fk33ThVOtuMpW24DH4pO26IC0Fv
         mRsVU4gPbmy3P6AA3Blm7jbUJe+ccm/V8ZUww8op1qGEEvzgEhAzpuyopFf7jwgNAJ4F
         hp42cUWJ6QNhoiogTdstcYSid1NYOywHanvDN1is5XleYLWU8zTXHLYbviPYSAwP9/kX
         ZCFA==
X-Gm-Message-State: AOAM5318y78IyXmCg2YsUiE9x+Z7WVOBDTP1kIMDc9AV1613k+CzC+Vi
	fSrMYiPicRBFlScCNbhsym6BPnQ8XQ8Nu5UhAU8=
X-Google-Smtp-Source: ABdhPJxBqt0/jYWm0+Bee2zkkq24Hwtsd+WZ0W4vVOp/nN8UW//9j96p30tVCZ7bd4UzxXUMGlkLf4dQ+KltA8Qn1MY=
X-Received: by 2002:a67:10c5:: with SMTP id 188mr447829vsq.223.1591743573216;
 Tue, 09 Jun 2020 15:59:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200609224602.195758-1-joe.slater@windriver.com>
In-Reply-To: <20200609224602.195758-1-joe.slater@windriver.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Tue, 9 Jun 2020 15:59:21 -0700
Message-ID: <CAJ86T=W23pyx+KVb6nXj6AVUuzGpGP08xDOX0AT=rR74oDg3eA@mail.gmail.com>
Subject: Re: [V2][oe-core][PATCH 1/1] vim: _FORTIFY_SOURCE=2 be gone
To: Joe Slater <joe.slater@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>, 
	Randy MacLeod <randy.macleod@windriver.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 9, 2020 at 3:46 PM Joe Slater <joe.slater@windriver.com> wrote:
>
> vim will abort in many places with this setting.  Replace
> it with the benign _FORTIFY_SOURCE=1.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  meta/recipes-support/vim/vim_8.2.bb | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta/recipes-support/vim/vim_8.2.bb b/meta/recipes-support/vim/vim_8.2.bb
> index 60946a181f..709b6ddb55 100644
> --- a/meta/recipes-support/vim/vim_8.2.bb
> +++ b/meta/recipes-support/vim/vim_8.2.bb
> @@ -8,3 +8,8 @@ BBCLASSEXTEND = "native"
>  ALTERNATIVE_${PN}_append = " xxd"
>  ALTERNATIVE_TARGET[xxd] = "${bindir}/xxd"
>  ALTERNATIVE_LINK_NAME[xxd] = "${bindir}/xxd"
> +
> +# We override the default in security_flags.inc because vim (not vim-tiny!) will abort
> +# in many places for _FORTIFY_SOURCE=2.  Security flags become part of CC.
> +#
> +lcl_maybe_fortify = "${@oe.utils.conditional('DEBUG_BUILD','1','','-D_FORTIFY_SOURCE=1',d)}"

"lcl_maybe_fortify" was supposed to be a private local variable in
security_flags.inc. If it's now a documented global variable which
recipes are allowed to mess with, it should be renamed (e.g.
capitalised and the lcl_ prefix removed).
