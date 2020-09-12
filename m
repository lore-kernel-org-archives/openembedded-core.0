Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web12.9509.1599874858662948588
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2020 18:40:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qR3ltvDG;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: parkch98@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id i1so12083410edv.2
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2020 18:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G90EzISWzkufSLFwD0qHKTNB6X83Qp3gXsrBjuWeDG8=;
        b=qR3ltvDGATJlhd7LZVligbV+dZfS001nH2dmVmXk89YqG0H7RBA4StKLyABUQc6zSf
         1dSyauYxoRFEsxABCKfHdeJ5yMWVzQSpdOBh7OTPsjAfgRLj8B3F622wj0gXox27yyGq
         KT69GuJLl+XXMELP84H4WEiOApShznIj/eFVLvFPpXsnZfFgCHtqauYeEwAkUqA3k6g+
         0zJf6Vgbnxy+o6DQMlmFmMLv/PJ0SF/DobE9l3Anwh54/pXbrJhp+szlVpKCje6y7MRe
         i5++LrKeVy3+ODIBkbwRF4JTpHvDz03GlN3PEF8DRgoN9xeuptb9oZHYxMYezp24FtSV
         sgrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G90EzISWzkufSLFwD0qHKTNB6X83Qp3gXsrBjuWeDG8=;
        b=j4GtXftVb7q0q5i6nf8JSgOb2ItS4vM0GIgOGl+QrfWqdr2cDxPzjNaV2n1FOII7dH
         VU1TXIp8JBbiddDl1gBreNR3zJfJ9uvawzNhGe2QHBHIGWOtadVwCPn07IjEurGZeQ0Y
         uOFNKe1kH86sv1nTUkf3pSdeQoKXvESg3BirbKfbyXaiK6ej/sX6Q8f+ZiyzZliuCHTG
         yvINdOEDZ5sH1LjBGyTTOQ8ueucfau48u992y6CgAhbRjfzlqeKh44GFqkVP0P2emp3t
         zvTsUt1wlJfXkw+X8W/zt5I2Q2Sci8tUIHvR1u0o1/HOz/C8BEjnu3KUnIM8zdtdHumF
         fh/Q==
X-Gm-Message-State: AOAM531C4qBtsAZkVN8ul6Nk7E5oZqKDdTdE9i1/VuVs371v9rLrdYdk
	LGhvnLzi/8/sWxA1mTmmt4mJL3GegtbOgfaNscS/J2d6sRuEyQ==
X-Google-Smtp-Source: ABdhPJzQmGq1/d6DsaIl5flMWZCMpeaPdjJJ6uY4r5bj+EYrBo76lbmimj5WB8ksH+5dWiOvO4yXdtH58MT4YKq8hJE=
X-Received: by 2002:aa7:cd06:: with SMTP id b6mr5472660edw.196.1599874856966;
 Fri, 11 Sep 2020 18:40:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1598810890.git.steve@sakoman.com> <4425ddd70d77fa0b45ee08e405937ab5f31f16f8.1598810890.git.steve@sakoman.com>
In-Reply-To: <4425ddd70d77fa0b45ee08e405937ab5f31f16f8.1598810890.git.steve@sakoman.com>
From: "Chanho Park" <parkch98@gmail.com>
Date: Sat, 12 Sep 2020 10:40:46 +0900
Message-ID: <CAPTzV15cU7POhAMFoPhqkCBT-9jsHJ_6z3XKWMPHF81dJcBz3A@mail.gmail.com>
Subject: Re: [OE-core][dunfell 23/25] kernel.bbclass: run do_symlink_kernsrc before do_patch
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"

Hi,

This patch makes STAGING_KERNEL_DIR symlink broken if externalsrc is used.
I filed a bug for this.
https://bugzilla.yoctoproject.org/show_bug.cgi?id=14044

Best Regards,
Chanho Park

On Mon, Aug 31, 2020 at 3:19 AM Steve Sakoman <steve@sakoman.com> wrote:
>
> From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
>
> There's a race between do_symlink_kernsrc and do_populate_lic, since
> the latter is ordered "after do_patch"; so the two may run in
> parallel. In some cases, that actually causes do_populate_lic to fail
> if it happens to look for a license file somewhere under ${S} in the
> short window after shutil.move and before the symlink has been
> created.
>
> Fix that by simply ordering symlink_kernsrc before do_patch. Any task
> that pokes around in ${S} looking for files should be ordered after
> do_patch, so this should also fix similar latent races with other ad
> hoc tasks.
>
> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit c5dfc2586b4135cc86e91bb04fed837daf505676)
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/classes/kernel.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 9e3c34ad48..9eb9bd2844 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -152,7 +152,7 @@ python do_symlink_kernsrc () {
>              shutil.move(s, kernsrc)
>              os.symlink(kernsrc, s)
>  }
> -addtask symlink_kernsrc before do_configure after do_unpack
> +addtask symlink_kernsrc before do_patch after do_unpack
>
>  inherit kernel-arch deploy
>
> --
> 2.17.1
>
> 



-- 
Best Regards,
Chanho Park
