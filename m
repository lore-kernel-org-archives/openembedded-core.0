Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3E34C4167D
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 21:11:12 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.775.1702501869097255558
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 13:11:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XRz6XHE4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-336437ae847so535940f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 13:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702501867; x=1703106667; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b75gMGcJxNepP7GPV4lsJ9weTl91RyoZrZAJRPdT7kc=;
        b=XRz6XHE4dR/lxvMWaT1ZhyZJjAUZMYyrmR08ofREhBdc/ADdbeHrEHntZQ6Yt2fOMY
         erIzy6FW0RNWph2ViZXTzwjX38vWvo187Hk7dCuyH+5A5WsAcBdEW32+W2RTQYC+aRw5
         I+vH4hApGU5boYN3WcasI6h78Wh7+PrZaCFek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702501867; x=1703106667;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b75gMGcJxNepP7GPV4lsJ9weTl91RyoZrZAJRPdT7kc=;
        b=W+B4QK+zzlqSrvWXayRZzu9Zc/UQBv//t4qATkNcWCv5PqeGCdG2HPHun94x2uOWgp
         OHIuuvirdjUHMWTRtYaDZlCRXf0seU4aZYSb2ILp2h2eJQMG4FoB3PeYpJd23KBqNGnG
         5Eq2eE7FLSysNlVNlhem8RPi8GB4hBEf2jfolCs25m3DAFUF7WnwkWl0kMR9IAfb3Zcz
         Jg0eRAtWq9KLxSlFIbxP5cDVdFAPDHZpFJwO7mJqvopXpaQtgoSDL83KUNopHNQ4Q0/7
         iA1thRas/C9V94YBxwwmsNsLw4Hq82DjzJNaTTPohbzN1FxvnVJzD/30JFr/sIfyI/mV
         AFwg==
X-Gm-Message-State: AOJu0YxCjoRZpGX0g4c0oFfDj/ttfBWJjYGQOhjwn3qrTGZrSnNW8zSl
	3sui5otWpfhUVAkTWEY0XpMdMw==
X-Google-Smtp-Source: AGHT+IGdwXlIyOYxL6wMQLKNlVowMWKtlbd0PhazEO/AEK+amefhMOAWbldoeAVFnJHagcVFX65rFg==
X-Received: by 2002:a5d:624a:0:b0:333:2fd2:5d30 with SMTP id m10-20020a5d624a000000b003332fd25d30mr4220369wrv.98.1702501867458;
        Wed, 13 Dec 2023 13:11:07 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7173:bb34:6d69:83d3? ([2001:8b0:aba:5f3c:7173:bb34:6d69:83d3])
        by smtp.gmail.com with ESMTPSA id c1-20020a5d4cc1000000b0033350f5f94dsm14153808wrt.101.2023.12.13.13.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 13:11:07 -0800 (PST)
Message-ID: <182ad0e88ab88b269d5b256406ca9bfffaf129cc.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] dtc: pass version as parameter instead of
 querying git
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: peter.marko@siemens.com, openembedded-core@lists.openembedded.org
Date: Wed, 13 Dec 2023 21:11:06 +0000
In-Reply-To: <20231213210703.667740-1-peter.marko@siemens.com>
References: <20231213210703.667740-1-peter.marko@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 21:11:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192327

On Wed, 2023-12-13 at 22:07 +0100, Peter Marko via
lists.openembedded.org wrote:
> From: Peter Marko <peter.marko@siemens.com>
>=20
> Since switch from Makefile to meson based build,
> the version is no longer hardcoded but queried from git tag.
>=20
> This works only if git history is available.
> When shallow tarballs are used, tag is not available.
>=20
> Example error for trusted-firmware-a from meta-arm:
> dtc version too old (039a994), you need at least version 1.4.4
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  ...n-as-parameter-instead-of-querying-g.patch | 49 +++++++++++++++++++
>  meta/recipes-kernel/dtc/dtc_1.7.0.bb          |  7 ++-
>  2 files changed, 54 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-kernel/dtc/dtc/0001-meson-get-version-as=
-parameter-instead-of-querying-g.patch
>=20
> diff --git a/meta/recipes-kernel/dtc/dtc/0001-meson-get-version-as-parame=
ter-instead-of-querying-g.patch b/meta/recipes-kernel/dtc/dtc/0001-meson-ge=
t-version-as-parameter-instead-of-querying-g.patch
> new file mode 100644
> index 0000000000..d7906bd6f9
> --- /dev/null
> +++ b/meta/recipes-kernel/dtc/dtc/0001-meson-get-version-as-parameter-ins=
tead-of-querying-g.patch
> @@ -0,0 +1,49 @@
> +From f32056f825b926b5820d43478d11e92eee1ec91f Mon Sep 17 00:00:00 2001
> +From: Peter Marko <peter.marko@siemens.com>
> +Date: Wed, 13 Dec 2023 21:18:14 +0100
> +Subject: [PATCH] meson: get version as parameter instead of querying git
> +
> +When using shallow tarballs, git tag is not available.
> +This causes version to be git hash.
> +This prevents application from checking minimal required version.
> +
> +Example error for trusted-firmware-a from meta-arm:
> +dtc version too old (039a994), you need at least version 1.4.4
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + meson.build       | 3 ++-
> + meson_options.txt | 2 ++
> + 2 files changed, 4 insertions(+), 1 deletion(-)
> +

I'm not sure that is inappropriate. Has anyone talked to upstream about
builds failing from shallow clones?

Cheers,

Richard



