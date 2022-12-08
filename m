Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04C08C3A5A7
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 12:17:46 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.11879.1670501861474028139
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Dec 2022 04:17:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TI8FX1D9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id ay40so907073wmb.2
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 04:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9VsiO72WUfP5kH3d4Y2m8g+/Vq0YjNF3J3nr74QzFTc=;
        b=TI8FX1D9Tzv29z9Anvv5YLf4mtdrB6HLoqpgqc+m9RYyzQor8zRm5ZsvAiwoziABJC
         73nlbqlXyUUSoRbpTvJuT5f6tS2EWoPxshDK0M7nE4x5Se2xW+1Ew4eQsSUInhBdm3kS
         by8rI62Emk2v5V2LE66SuK2cXk8vQQXzgsZko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9VsiO72WUfP5kH3d4Y2m8g+/Vq0YjNF3J3nr74QzFTc=;
        b=qOJVUCef3V1OlIQB9HMco33S4EP6uEivjCzGB0ZlrjQAxVefv0l3F6OEEUN51uM8GZ
         m3i38vGLi0uTwS3uMhD0e+kkl7lSCoPlW89NwqvOPamJaxMbqR6//Gm5MFZoStRb85LQ
         RJWn1CFkXoalm82qaZ9cwwp92JbSq0b9SUbRU3aKoHKEgvzUJoo9WflN+BO9rLzKlAyp
         XsKreIBSKKEb8DZn648fGM6uLQt1+wTVE+6eP95qH2XI50du//s04kfRIGV6+NbKf8Ha
         W5rPhsKVeB7U+mUfYah+q07oKz5gy/1koAOLbbxRn0zEeumPSVvPPGOwit9SV/gMCFCP
         +Tbg==
X-Gm-Message-State: ANoB5pm+AA/J1G3aBoHXIsynO0k6FYDBYtKL3g8cnAMXFVNBlczYEUX/
	0ezBkg8OQlyYTopzNYIEPeYQJg==
X-Google-Smtp-Source: AA0mqf5ai7xkagngbOsQOStqa2k7LiZhR2cHdwT8hDSb0k9UpFytF+wac3wkv3Y4ZIo1D3GfYpfVDQ==
X-Received: by 2002:a05:600c:5407:b0:3c6:e63e:89a6 with SMTP id he7-20020a05600c540700b003c6e63e89a6mr1942805wmb.2.1670501859790;
        Thu, 08 Dec 2022 04:17:39 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:50bb:c4ee:bb3b:bc91? ([2001:8b0:aba:5f3c:50bb:c4ee:bb3b:bc91])
        by smtp.gmail.com with ESMTPSA id l5-20020a5d5605000000b002367ad808a9sm21919213wrv.30.2022.12.08.04.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 04:17:39 -0800 (PST)
Message-ID: <cd5af976d2f6c820f8aced11c07155c71ff16125.camel@linuxfoundation.org>
Subject: Re: [OE-core] [langdale][master][PATCH] rust: Do not use default
 compiler flags defined in CC crate
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Anton Antonov <anton.antonov@arm.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 08 Dec 2022 12:17:38 +0000
In-Reply-To: <20221118144253.1156045-1-Anton.Antonov@arm.com>
References: <20221118144253.1156045-1-Anton.Antonov@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 12:17:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174402

On Fri, 2022-11-18 at 14:42 +0000, Anton Antonov wrote:
> Rust crates build dependecy C libraries using "CC" crate.
> This crate adds some default compiler parameters depending on target arch=
.
> For some target archs these parameters conflict with the parameters defin=
ed by OE.
>=20
> Warnings/errors like this can be seen in the case:
>=20
> cc1: error: switch '-mcpu=3Dcortex-a15' conflicts with switch '-march=3Da=
rmv7-a+fp' [-Werror]
>=20
> Lets use the OE parameters only by exporting CRATE_CC_NO_DEFAULTS.
> https://github.com/rust-lang/cc-rs#external-configuration-via-environment=
-variables
>=20
> This patch fixes https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1494=
7
>=20
> Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
> ---
>  meta/classes-recipe/rust-target-config.bbclass | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>=20
> diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classe=
s-recipe/rust-target-config.bbclass
> index 2710b4325d..4135335043 100644
> --- a/meta/classes-recipe/rust-target-config.bbclass
> +++ b/meta/classes-recipe/rust-target-config.bbclass
> @@ -401,3 +401,21 @@ python do_rust_gen_targets () {
>  addtask rust_gen_targets after do_patch before do_compile
>  do_rust_gen_targets[dirs] +=3D "${RUST_TARGETS_DIR}"
> =20
> +# For building C dependecies only use compiler parameters defined in OE-=
core
> +# and ignore the default parameters defined in the CC crate.
> +# https://github.com/rust-lang/cc-rs#external-configuration-via-environm=
ent-variables
> +# For rust native recipes we still rely on the CC crate parameters.
> +
> +CRATE_CC_NO_DEFAULTS:class-target ?=3D "true"
> +CRATE_CC_NO_DEFAULTS:class-nativesdk ?=3D "true"
> +CRATE_CC_NO_DEFAULTS:class-native ?=3D ""
> +
> +# The CC crate checks for CRATE_CC_NO_DEFAULTS existence not value.
> +# Even empty CRATE_CC_NO_DEFAULTS will be taken into account.
> +# So, don't export it if empty.
> +do_compile:prepend() {
> +    if [ -n "${CRATE_CC_NO_DEFAULTS}" ]; then
> +        export CRATE_CC_NO_DEFAULTS=3D"${CRATE_CC_NO_DEFAULTS}"
> +        bbnote "CRATE_CC_NO_DEFAULTS is exported"
> +    fi
> +}

Sorry about the delays on this. I did want to try and sort the
underlying export issue and whilst I proposed a patch, the performance
impact of it is a concern so it isn't moving forward right now.

I suspect that means we should merge a different fix for now. The above
is still a little more complex and harder to read than it could be.
Could you try a version which does something like:


do_compile:prepend:class-target() {
    export CRATE_CC_NO_DEFAULTS=3D1
}

do_compile:prepend:class-nativesdk() {
    export CRATE_CC_NO_DEFAULTS=3D1
}

which should be a bit clearer/simpler?

Cheers,

Richard


