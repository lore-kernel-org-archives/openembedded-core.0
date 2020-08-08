Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web10.14067.1596924755527378616
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Aug 2020 15:12:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=TQJw1XK3;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.67, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f67.google.com with SMTP id m20so3787708eds.2
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Aug 2020 15:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j40vymbB7lUcmZrjOom8UFhrPBDi4G4nt/THB9z5KTg=;
        b=TQJw1XK3o1AQsxBpT1IuxLeh7myCcBiQmE7gyBhK/QNVlYoC4f6QjZj2thGZZi1BpZ
         10ZElYWINkZONmF8zApXN0ZyyA60dn7pshbhZka3ERAuHL8cwS0aMKtlsC0ZmFS3cUCp
         Kaa15ST2cpe6FlCI1SjgaWtEof43PJgMApM2SDpukMMl4BlOSqbFath3GVRBzpyLUCkN
         oYV04OIHCRkRGpd+DyQDS7rP53y1z1J7/VqZRrTQck7sEDAJHQ1SXd6qiFoAK9CqMkSp
         tUByatvi0YjOppd2Cuy4cqcZOjI7hT1fsdjAiCQ/IED8htNPY4nDVGDLdilbH8Qi5FNy
         SmnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j40vymbB7lUcmZrjOom8UFhrPBDi4G4nt/THB9z5KTg=;
        b=FdJSto6xV8F4gDoxjqviFQQTyt8/Gjf+iX7ldhWgDzmUMS29Y+KnhfxSX/78fzGwXP
         Hs7OsBjMJKyhE36LUcFy0oP51ex+GDImlObOmsgCpGKo54rjqHhMnfAMCqEYJi/4sod6
         88fVzsCkvbJ4wpVGTqjoUovHRKXZ+yb5k9DBAp2FwmtKr8u76OmfmLGWWiA/HGFCVIta
         yKf5Le5m+Rte9CZ01QejHXmMrOUMldVoP0IY/DYpGUI/Km27z0XUqWFw6+SMv9se40UD
         BPhs7+PN1pFogoe6ThwJMlCG6KTpZUMH7IJmbtSxrS2UX/v0BlXYiC3OM2rGVsP0yhhl
         Fwxw==
X-Gm-Message-State: AOAM531DThh+LtNh4RSvzzYPhHyD+rjO8zoQJ/RO0VTH50Cy/E6IEjVI
	0MqofJB9Q0r93yeppEdN+oQOB9V26kCpp6TAdDk9wQ==
X-Google-Smtp-Source: ABdhPJxUQe7gnZr93gF5teuqZYbjCipRzJXYQKyjxQBmjUPK1c/h8Y6YvtJbVj6GjWaaSIsjtOwoV4hRzq6TDXCQaG0=
X-Received: by 2002:a05:6402:1a54:: with SMTP id bf20mr14949299edb.217.1596924753994;
 Sat, 08 Aug 2020 15:12:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200807202548.753073-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20200807202548.753073-1-richard.purdie@linuxfoundation.org>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Sat, 8 Aug 2020 12:12:23 -1000
Message-ID: <CAOSpxdZrryt+TiLgpei1grJDQwxyqNfi_txg8=D2=4fLFmf8aw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] populate_sdk_ext: Ensure buildtools doesn't corrupt OECORE_NATIVE_SYSROOT
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Is this series suitable for dunfell?

Steve

On Fri, Aug 7, 2020 at 10:25 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> buildtools is built as a nativesdk which needs to use OECORE_NATIVE_SYSROOT
> for its own purposes and can reset it. Save and restore the value
> within the eSDK so the two don't clash.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/populate_sdk_ext.bbclass | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
> index fd0da16e7ea..44d99cfb972 100644
> --- a/meta/classes/populate_sdk_ext.bbclass
> +++ b/meta/classes/populate_sdk_ext.bbclass
> @@ -653,7 +653,10 @@ sdk_ext_postinst() {
>
>                 # Make sure when the user sets up the environment, they also get
>                 # the buildtools-tarball tools in their path.
> +               echo "# Save and reset OECORE_NATIVE_SYSROOT as buildtools may change it" >> $env_setup_script
> +               echo "SAVED=\"\$OECORE_NATIVE_SYSROOT\"" >> $env_setup_script
>                 echo ". $target_sdk_dir/buildtools/environment-setup*" >> $env_setup_script
> +               echo "OECORE_NATIVE_SYSROOT=\"\$SAVED\"" >> $env_setup_script
>         fi
>
>         # Allow bitbake environment setup to be ran as part of this sdk.
> --
> 2.25.1
>
> 
