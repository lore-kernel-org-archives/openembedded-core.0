Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web09.6970.1611235933414224886
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jan 2021 05:32:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=yEfyL2e4;
 spf=pass (domain: burtonini.com, ip: 209.85.208.179, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f179.google.com with SMTP id n8so2502277ljg.3
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Jan 2021 05:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4JhuXq1h7oS2tTzIu0Q/VXVCMd7SY0wfgIpVQUnrkts=;
        b=yEfyL2e4eEFUoUqLhlEm2wgyBxD3Fl8Hv7zI5W2ESydmKBoNhwJaRQ0It22XnLUwhT
         L5blMGBUiex3CX4oqp2imFmJUQGaPzSCuY+tlkpXzsgMRPxG1ksE9Zsi2rm8XVzEXGRO
         ByRhGA+f0mKGOe4CVd33WEjidoYLl4/r1KIGV4i6+UT9ggDlnalvXvnJbkZ3Gjn1pYYt
         nJiqh1tjRcUv6FMvQrBeDycKxP4RHGlILTGlGQdPgMoUvF6GO4ZXjWJrvy97DDB13tc9
         TE8uXmGD3bNLf0hU2uVee0osokH/9dYBcVAKVnOJnq1iWqOO+X6HmNSW61XF8d6GddZ/
         FVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4JhuXq1h7oS2tTzIu0Q/VXVCMd7SY0wfgIpVQUnrkts=;
        b=OsUD4UlY9Y4KpoIWqLUzF5btuo/3AlwTlFQSt/QHxuMj8iiiGuGcdgx7cx/fZBj+ca
         F3Hq7gEKsAGFZeVOrY+ZaH81kJnVGAqYGZNq1ZXQhEFbndSXPYC0QMMOQbflHf2F296X
         ijDbBfdFf2UDh3iDsUpD++PAT19mKEfL/YoKpD4jI99E4nvYE/qXJxzNs0SxIUKi1Nu7
         giOttyo7xvr6w1eu4ytL9p7e4eVvs8vTVaS4WJ9Ws9N1pr5oPQ4CDf8X1Sl/rxnVd7ws
         w0ntJnVDWpIsRegYUD/PGEKppu1wZKOzk8NCKT27SY9v2+gyR1GlUneKbQuTY/ePKN/H
         REHQ==
X-Gm-Message-State: AOAM530ZsVjdXe9xI+IWmKtz9+Y8Y3UV17bBwP0DOEDcaHsil5h8f9w1
	mOoMefR50RfkGWhDt6e4PboY04RX+p0XHgMX1PbAlQ==
X-Google-Smtp-Source: ABdhPJxkX85jOFSPudO3T9iN5BhYOYy8Bxi4iRmpBrz1fiT1NHMxBQoEevVJETtBaJqr9zu+apbdDAZ/NNtvu9yhM1c=
X-Received: by 2002:a2e:b4a7:: with SMTP id q7mr7005771ljm.391.1611235930488;
 Thu, 21 Jan 2021 05:32:10 -0800 (PST)
MIME-Version: 1.0
References: <20210121130758.104506-1-oobitots@cisco.com>
In-Reply-To: <20210121130758.104506-1-oobitots@cisco.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Thu, 21 Jan 2021 13:31:58 +0000
Message-ID: <CAAnfSTtv=vf6SFqkAKcd_nRgCbiOafFWVd4HdenLqoTGmPhuKQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] pango: improve reproducibility
To: oobitots@cisco.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

I thought we'd already fixed this once already upstream - maybe new
templates have appeared.  This would be better as an upstreamed patch,
can you submit it there too?

Ross

On Thu, 21 Jan 2021 at 13:08, Oleksiy Obitotskyy via
lists.openembedded.org <oobitots=cisco.com@lists.openembedded.org>
wrote:
>
> Replace filename with basename in templates
> to avoid absolute path in generated source files.
>
> Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
> ---
>  meta/recipes-graphics/pango/pango_1.48.0.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-graphics/pango/pango_1.48.0.bb b/meta/recipes-graphics/pango/pango_1.48.0.bb
> index 552a44583c..a070581732 100644
> --- a/meta/recipes-graphics/pango/pango_1.48.0.bb
> +++ b/meta/recipes-graphics/pango/pango_1.48.0.bb
> @@ -35,6 +35,9 @@ GIR_MESON_OPTION = 'introspection'
>
>  do_configure_prepend() {
>      chmod +x ${S}/tests/*.py
> +    if [ -n "$SOURCE_DATE_EPOCH" ]; then
> +        find ${S} -name "*.template" -print0 | xargs -0 sed -i -e "s/@filename@/@basename@/"
> +    fi
>  }
>
>  do_configure_prepend_toolchain-clang() {
> --
> 2.26.2.Cisco
>
>
> 
>
