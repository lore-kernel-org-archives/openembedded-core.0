Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web09.3287.1632198101066761380
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Sep 2021 21:21:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qSfJZPOy;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id m21so50085900qkm.13
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Sep 2021 21:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/qhoeMwSGTf7IfrhT/PeiHd8NjcJ42mKNIMCIo84Ldk=;
        b=qSfJZPOy+sQAs5IZD8atOIEtpqYWu/aEcx3WaJMQREdu+8GTVYFlRxDCO32Av51NHt
         v8dipHbdUN20BhXe3JgC1MuCcreqa+hktLSUAO6IRthmexcQ7Xr8oPGfkJAN+9xRt1SK
         iw0JwhuADOR3s3rfANM1YCDpmvEzBbD/K1m8ovNmrs74ukiJhOqOuGZoSTvo8Aicd5cO
         Ik/jNVrpllWHn7Cr5GVjfJU8OJzp1FfyWhM0egOB1WegVpVdPDd7uZsXp49tyMwpL8dw
         T199wrg8DAqrU2S34Qh1OnBpyWkIpqboNpHdsW0lI806L7wAFJSc6nT7tqQ/u9QpYOz+
         maUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/qhoeMwSGTf7IfrhT/PeiHd8NjcJ42mKNIMCIo84Ldk=;
        b=G+RnQwpFCN6q8wtPPYTo9vgOwnOyGxbSqi/WupRiCfvZ5jiqeh2IvOc3mWi5OpRgee
         iNUzEegYA1/ToxMcCajBObN7BbW2fM3KPg/CjEh5IBEyBPa1pTtHLpeRJB4qM+M0/j5Y
         QhlK264cgLtrM6c6/QKwOpL56RsbmCaEDLmMXJkRCJAf9nD6sw6R1wyeToxHU2CebFi/
         4EgI0C/a/UwgvufnpzD7/Rmmw/t3Pg+zHzT/mk04XfkVPqKHZ/TMbF6UemzcOdSsjgC9
         k9m1Pe1qmT2p6pzvBFN3GtG28pNE6xU3ccH4ADXfpwnwFns0Que6XU+DBRz75Hyeu9SL
         n74A==
X-Gm-Message-State: AOAM530KRhRIN4P6witaNT4FhfDVneLci1P3Gl+MdJPU8D75pAMhEYuh
	sFc80d6ggnGZxXKA3yIcfp+bJCnkQDyCmIHcxm4=
X-Google-Smtp-Source: ABdhPJzmqW3vZOFfmYEo/HdJUt5O0/GDRgiqtcPa8Nj+JWo6rsCpUFKBr8hM9i/ahpH+v4GG7Kkh1pW7MPEemJcVWdA=
X-Received: by 2002:a37:9c46:: with SMTP id f67mr542671qke.98.1632198100030;
 Mon, 20 Sep 2021 21:21:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210920124621.1576702-1-richard.purdie@linuxfoundation.org>
 <16A68880435BB472.28512@lists.openembedded.org> <e22062ab2915a57b1bff1217c911a97c3c647e30.camel@linuxfoundation.org>
 <0700251c-57a1-cc4c-dd94-a253032a02d1@gmail.com>
In-Reply-To: <0700251c-57a1-cc4c-dd94-a253032a02d1@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 20 Sep 2021 21:21:14 -0700
Message-ID: <CAMKF1spNqjAHRh=0F2ohMCCoSdwDOTWAFRMz2RCVU9+rBiiO_g@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 14/14] layer.conf: Extend recipes not to install without explict dependencies
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 20, 2021 at 6:34 AM Joshua Watt <JPEWhacker@gmail.com> wrote:
>
>
> On 9/20/21 7:48 AM, Richard Purdie wrote:
>
> On Mon, 2021-09-20 at 13:46 +0100, Richard Purdie via lists.openembedded.org
> wrote:
>
> There are several dependencies which recipes have which are not needed
> at runtime, only at build time. Extend the list of these from bison to
> include quilt, patch, meson, autoconf, automake and ninja which should
> reduce the amount of data being included in native sysroots.
>
> This speeds up and reduces the sstate needed for image builds for example.
>
> If this change breaks recipes, it probably means they're missing an explicit
> DEPENDS on something in this list which is a bug in the recipe.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/conf/layer.conf | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> index 307ad7e2237..b3cc8a249e9 100644
> --- a/meta/conf/layer.conf
> +++ b/meta/conf/layer.conf
> @@ -48,6 +48,7 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
>  "
>
>  SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
> +  *->patch-native \
>    *->quilt-native \
>    *->subversion-native \
>    *->git-native \
> @@ -90,7 +91,16 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
>  # (e.g. X -> Y -> binutils-cross -> bison-native) no longer meet the
>  # dependency incidentally. This improves determinism and avoids build
>  # failures when people switch to external toolchains.
> -SSTATE_EXCLUDEDEPS_SYSROOT += ".*->bison-native"
> +SSTATE_EXCLUDEDEPS_SYSROOT += "\
> +    .*->autoconf-native \
> +    .*->automake-native \
> +    .*->bison-native \
> +    .*->meson-native \
> +    .*->ninja-native \
> +    .*->patch-native \
> +    .*->pkgconfig-native \
> +    .*->quilt-native \
> +"
>
> I've marked this one as an RFC since it caused a fair bit of pain even in OE-
> core due to recipes having pkgconfig class inherits missing.
>
> We do really want to do this and correctly mark up the recipe dependencies, the
> question is whether it is too late for 3.4 or not. We could go for a smaller
> list for now too but I wanted to hear opinions.
>
>
> It looks like a great change! I'd say it's too late for 3.4 and we should do it for 3.5 instead.
>

right see the failed recipes which would need fixing
https://errors.yoctoproject.org/Errors/Build/130779/

> Cheers,
>
> Richard
>
>
>
>
>
> 
>
