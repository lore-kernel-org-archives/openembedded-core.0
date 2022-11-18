Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C744C4332F
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 15:10:11 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.14079.1668784207574127443
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Nov 2022 07:10:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WzdNWIcd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id v1so9630577wrt.11
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 07:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHfXvFaofr4DlfX4T3EGUkfDjyBULtOfunjaNJrqsOM=;
        b=WzdNWIcdC5dB6VNg/Gsdio+oSZt6bVcso6wyml79btK10hs+jO4pYBZE0cqcFhwCBo
         A5EQTSVHuc5q9rjm63LPxDtc0353LYi6peXXvNA+bPzKzJRwqA37s9DXHrzn56ogHjn1
         mpbirM7KddxA/jPPrcTVadJmHnvC1Hc8vhM0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KHfXvFaofr4DlfX4T3EGUkfDjyBULtOfunjaNJrqsOM=;
        b=cA9YkZABhShF8Jej9e7UktEQzi6a0uGPLT6m8xr9t5UgOO3lztadJtDSiXhuAmYI8B
         kngq/n4reLDeHcqlzsDXT5JXO6E/Vfu8xc7/OUN28u+Mnu6QcUi5I057w/t6+bCnwOR7
         bS7FuKrpdwn8HOUhlbKc6yULRje4oXszQeQN947B9tLc69GJU1qkD5ia+Hctvvaen1Gk
         3Hdl4WyCyc8gwQSswc8YOkw4RJIDQW55hwNQC/EAUv/jttXWgttNwj7m4QGU+wwHc4CM
         wjm2IhRKx+TRXk/CGrvp/f+dVpAy+fnFQbNLB1FYP9jZ/w1+Laho24uzSJbLomrPyAbU
         gnfg==
X-Gm-Message-State: ANoB5pnFDKUWF1pcYkYLobC0YqN/aXjtjbutxjevnoB1NBhHc/narsev
	bANJ7XFcyGxisDAvl94Zfoja1Q==
X-Google-Smtp-Source: AA0mqf6i+7OxrXecieO0E4JsIcgoQytzXeLhh7gO92osjG6SB6PcAV+YtEQNfZU3xgAZ8pChzCs4Ag==
X-Received: by 2002:adf:f208:0:b0:22e:33b5:d24 with SMTP id p8-20020adff208000000b0022e33b50d24mr4643130wro.90.1668784205925;
        Fri, 18 Nov 2022 07:10:05 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:a603:eef1:6736:def4? ([2001:8b0:aba:5f3c:a603:eef1:6736:def4])
        by smtp.gmail.com with ESMTPSA id l24-20020a05600c1d1800b003cf878c4468sm10565867wms.5.2022.11.18.07.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 07:10:05 -0800 (PST)
Message-ID: <7dc90b995d7a9688188b8756871181e46b2e296a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [langdale][master][PATCH] rust: Do not use default
 compiler flags defined in CC crate
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Anton Antonov <anton.antonov@arm.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 18 Nov 2022 15:10:04 +0000
In-Reply-To: <20221118144253.1156045-1-Anton.Antonov@arm.com>
References: <20221118144253.1156045-1-Anton.Antonov@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 15:10:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173466

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

That looks like a good start. I wondered if this might work as a
slightly cleaner solution?:

CRATE_CC_NO_DEFAULTS =3D "true"
CRATE_CC_NO_DEFAULTS:class-native =3D ""
CRATE_CC_NO_DEFAULTS[export] =3D "${'1' if d.getVar('CRATE_CC_NO_DEFAULTS')=
 =3D=3D 'true' else '0'}"

Cheers,

Richard

