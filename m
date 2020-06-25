Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com [209.85.219.194])
 by mx.groups.io with SMTP id smtpd.web12.5844.1593072149386960654
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 01:02:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=qOUOxtle;
 spf=pass (domain: linaro.org, ip: 209.85.219.194, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yb1-f194.google.com with SMTP id h39so2334519ybj.3
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2020 01:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=5ZPr6PjV8HBTvQXDUkQz6+m1byirlf/ENojf9cGgo1M=;
        b=qOUOxtleO4BqyU8iYsLp1jnFv7kwhvyMo4KLFj4OH/B5+SFntSNXPgv4vbKZWf5X2R
         76OpxAMEMo/WQtxWtcCLpRzosAUxpSDRcwzdsiGCUpgPX8y6IZVC268i7IHWqffhSZMI
         AtIKFm1NNonKnQ+JfrhBPjr7bGlUvDLmPxm5s2d2bJ4IbRcvE+7Y7oCjmdis0jQ3Lhrw
         PU1bxzmAmsDe6+tzrpyqD8K7xZ+I+4hUqU5yn7rw1oPsjJ88jCGUg+T4wghYeGo8EO7y
         YpSfcz9HktcqMfsZ5Ag4XzCmlrfwEY3taMzWob9Fbopzvsjv86P8JVZXjtELse6CY5Qh
         OrUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=5ZPr6PjV8HBTvQXDUkQz6+m1byirlf/ENojf9cGgo1M=;
        b=d1DligBhL/EIGINu9+4koCJOSC0vtra51fptqhg6nM8UWJ9RwTG+Ci9UQhfbcnWcJO
         Fh5IQ0Qg2rZDX5X3dm1rRL19WaxLkF2dVxDVJ073JMi6e52Q9VuBUkSqjBSEbysffIEn
         3WsqHsHq30z20zBxKtrDBwIuS2T0IVPH3AWfFkrJuUXdsvyRBBHEqBxmRRkn4p04tsu7
         PyJUS9S5miXMa617QNG4SzIIWb1tyHuNiHFlOP4tmg0r+1rde8gdgnY9NV7cyKMQuXik
         XH2Uf/wcvUcDI2xkm7FX9R6iDRYEEzxMzH2g5DnX9foVqU6Y21r9Ybpmcr4hBndtUraE
         7RVg==
X-Gm-Message-State: AOAM5302zAfYBiP2ZCxU1a0upgP7x162GzlB94w5hLCLJt6UwrX6oBfl
	4/Hzfmx5Rl5m/I6ZpzEJIHUVqxv3kA+zTWtahuXG4JRYqFyUgFz/
X-Google-Smtp-Source: ABdhPJzpxlKbamZt0+IN23caw/wHzqifAq2ttTcBXqKs7jPlqQnt1kjzhaKHSW2DjtC11JpF6VtePSVHXNrITaKrqfY=
X-Received: by 2002:a25:53c5:: with SMTP id h188mr35721095ybb.133.1593072148307;
 Thu, 25 Jun 2020 01:02:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200625075927.21983-1-nicolas.dechesne@linaro.org>
In-Reply-To: <20200625075927.21983-1-nicolas.dechesne@linaro.org>
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
Date: Thu, 25 Jun 2020 10:02:16 +0200
Message-ID: <CAP71WjyJW6i121FQU6OxL4HWLKP7Hm0SMY2eE233PYQLZ7xYRw@mail.gmail.com>
Subject: Re: [PATCH] checklayer: parse LAYERDEPENDS with bb.utils.explode_dep_versions2()
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 25, 2020 at 9:59 AM Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
>
> LAYERDEPENDS is a string of this format:
> "DEPEND1 (optional version) DEPEND2 (optional version) ..."
>
> However when we parse LAYERDEPENDS in _get_layer_collections() we
> parse it as a simple string, and if any optional versions are there the
> 'depends' field is wrong. For example, running yocto-check-layer
> might result in such errors:
>
> ERROR: Layer meta-python depends on (>= and isn't found.
> ERROR: Layer meta-python depends on 12) and isn't found.
>
> Let's use bb.utils.explode_dep_versions2() to parse LAYERDEPENDS, and
> create a string that contains all dependencies, effectively
> skipping/ignoring any optional versions.

ouch. I forgot
Fixes [YOCTO #13957]

>
> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> ---
>  scripts/lib/checklayer/__init__.py | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/lib/checklayer/__init__.py b/scripts/lib/checklayer/__init__.py
> index 1138000275..0e5234808e 100644
> --- a/scripts/lib/checklayer/__init__.py
> +++ b/scripts/lib/checklayer/__init__.py
> @@ -59,9 +59,14 @@ def _get_layer_collections(layer_path, lconf=None, data=None):
>          pattern = ldata.getVar('BBFILE_PATTERN_%s' % name)
>          depends = ldata.getVar('LAYERDEPENDS_%s' % name)
>          compat = ldata.getVar('LAYERSERIES_COMPAT_%s' % name)
> +        try:
> +            depDict = bb.utils.explode_dep_versions2(depends)
> +        except bb.utils.VersionStringException as vse:
> +            bb.fatal('Error parsing LAYERDEPENDS_%s: %s' % (name, str(vse)))
> +
>          collections[name]['priority'] = priority
>          collections[name]['pattern'] = pattern
> -        collections[name]['depends'] = depends
> +        collections[name]['depends'] = ' '.join(depDict.keys())
>          collections[name]['compat'] = compat
>
>      return collections
> --
> 2.20.1
>
