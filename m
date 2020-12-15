Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web08.1312.1608061509878185533
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Dec 2020 11:45:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vMw4s9Q+;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id c7so22327085edv.6
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Dec 2020 11:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XNyP4rlJoaoyTAmIqLwUnBZyjSfDCj4qSQPPANqS2M8=;
        b=vMw4s9Q+rIYXGYTFUbKKXxFw2mbmTbKYWrJSmfo0WwdIqvIV8z91VmKO25UJq4c1lN
         hHDJbiR1YNG5VDK6PE4jEc+IatBokFUMKyUrM7AW/DVi6vh+elV4MItNqGpIletFKsEw
         Qjno41HwJzZL9jrpgypnv0VQIY7hkkTLpbp4xl29vRgrwsNfW6aAPEA9M0wcy1V3KcB1
         Diiea3JoBKJwMl9l80NjhBNkLkvMF8cLVRcWoRreOApKjxxreQ5IPUzWp3FpS3J1czho
         IMtbbhckpP1wfp+oi9R280PPYpqkF9WPNMokFESpD2r45L9lwp5kjJeU+kNbAxN0g876
         bU4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XNyP4rlJoaoyTAmIqLwUnBZyjSfDCj4qSQPPANqS2M8=;
        b=S5M6VnX1Qaf2ytETpNZytgJMfb7rmDz5S0e5rbRH+gGexSTiS87bRsbBQZrvYUhTi6
         FqtoxZxUgh3p6aH6Nlxgs096I13vA5zN/3IFsEjNkJzvadXNBMdhcuP7ZtqsVwXcr/pL
         PuOcKuM9G9XmU6sUQO8rcPVI9ab+JYjE3q7kciyvavVIBxo1emph5X+Cq2MkVyjNUNVD
         RRPOG9aL5M1eA7FTvvsxvV5ixUIIVVozhRVJq2BZWlNOgJL6nhdU7GyspGxEdT/QulEv
         ft5HJs1qiyY72gsyQeRGDQ2fmGrAnIDgx7XpeLk6t7IJ099Q0oUcX/C1ekpidd0dIjxy
         Q/Xg==
X-Gm-Message-State: AOAM531Xb2gHp7ILZkExdCUEWOWpYDxFsC7uTg4mjqNa3WNHbqQ0vKnN
	lhCsYFHvI9o1+4PSbDuTmofB3mV/HlPHEKA8f58=
X-Google-Smtp-Source: ABdhPJxzguVwa+KW2WzCdByFVRvK6SthSSVsph4flVQ7LSaRnZbA2m/fatYNWcst8FvBExYUD2O8NmK51yhcHBQQNeQ=
X-Received: by 2002:aa7:d407:: with SMTP id z7mr32710791edq.234.1608061508206;
 Tue, 15 Dec 2020 11:45:08 -0800 (PST)
MIME-Version: 1.0
References: <20201215193506.13053-1-okaya@kernel.org>
In-Reply-To: <20201215193506.13053-1-okaya@kernel.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 15 Dec 2020 14:44:57 -0500
Message-ID: <CADkTA4OWM5PJXSgp7SMu+n0071YE-3wkaoV2JUPCuf5u=XdAnQ@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH v3] sudo: split into smaller tools package
To: Sinan Kaya <okaya@kernel.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 15, 2020 at 2:35 PM Sinan Kaya <okaya@kernel.org> wrote:
>
> Allow to include whether we want sudo, visudo, sudoreplay
> or cvtsudoers tools.
>
> Signed-off-by: Sinan Kaya <okaya@kernel.org>
> ---
>  meta/recipes-extended/sudo/sudo_1.9.3p1.bb | 24 +++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/sudo/sudo_1.9.3p1.bb b/meta/recipes-extended/sudo/sudo_1.9.3p1.bb
> index ba61a7f2472..0ea72caf790 100644
> --- a/meta/recipes-extended/sudo/sudo_1.9.3p1.bb
> +++ b/meta/recipes-extended/sudo/sudo_1.9.3p1.bb
> @@ -44,6 +44,28 @@ do_install_append () {
>         rmdir -p --ignore-fail-on-non-empty ${D}/run/sudo
>  }
>
> -FILES_${PN} += "${nonarch_libdir}/tmpfiles.d"

I don't see this maintained in the split of changes below, why was it dropped ?

>  FILES_${PN}-dev += "${libdir}/${BPN}/lib*${SOLIBSDEV} ${libdir}/${BPN}/*.la \
>                      ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la"
> +
> +PACKAGES += "${PN}-cvtsudoers"
> +PACKAGES += "${PN}-sudoreplay"
> +PACKAGES += "${PN}-visudo"
> +PACKAGES += "${PN}-sudo"
> +PACKAGES += "${PN}-lib"
> +
> +RDEPENDS_${PN}-cvtsudoers = "${PN}-lib"
> +RDEPENDS_${PN}-sudo = "${PN}-lib"
> +RDEPENDS_${PN}-sudoreplay = "${PN}-lib"
> +RDEPENDS_${PN}-visudo = "${PN}-lib"
> +
> +PROVIDES += "${PACKAGES}"
> +RRECOMMENDS_${PN} += "${PACKAGES}"

This isn't a direct replacement of the existing packaging. If we are
going to get a series of patches that keep splitting on binaries, they
shouldn't be like this.

For an image or configuration that turns off rrecommends (which is the
policy for a distro that I have), this is not backwards compatible and
we are going to get all sorts of runtime issues .. and then be forced
to update packages lists with this explosion of new splits.

If we do splits like this, something stronger than rrcommends is
needed, or they simply belong in a layer besides core.

Bruce

> +
> +ALLOW_EMPTY_${PN} = "1"
> +
> +FILES_${PN} = ""
> +FILES_${PN}-cvtsudoers = "${bindir}/cvtsudoers"
> +FILES_${PN}-sudoreplay = "${bindir}/sudoreplay"
> +FILES_${PN}-sudo = "${bindir}/sudo ${bindir}/sudoedit"
> +FILES_${PN}-visudo = "${sbindir}/visudo"
> +FILES_${PN}-lib = "${localstatedir} ${libexecdir} ${sysconfdir} ${libdir}"
> --
> 2.17.1
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
