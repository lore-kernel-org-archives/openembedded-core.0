Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BE1BC433EF
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 18:58:38 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web09.10846.1653505113637551692
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 11:58:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LD42fc99;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id e28so30731396wra.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 11:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=1DN6/fWg8yAGuCN2bLSVK+b8bBTloloqqiLJrZvCceA=;
        b=LD42fc994inH0vPZ2JkhEb0lqSEhV123tK73QYqzAYKLnLIBJCWGRvyetrq3pM+zRG
         kOXNvIfvObxlE5NKfcsx/YBWrwxOzgicftHJZJj+ZrMXYhowqQsN058EjSeczwZgP65a
         8dotR4JzC5ygTRT8KisxgSmJxWx+rSWzK0IS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=1DN6/fWg8yAGuCN2bLSVK+b8bBTloloqqiLJrZvCceA=;
        b=zKkhRW4o5TwqH+qy39XUh13yzs60QPj2nCLFUMdqL1xPdlHiy9nhYmazRYdILd3ECK
         bXsku3d9vVcRvE3n3JKPa1qkmJVONJ6Z+kqisJWVS8v0KDFJkK/dJdzKs3NtwzsmacrO
         /EGr+JUmLA/d+YR7SbyEbmNTjUO1wwXR3CydTiELNnPQsGYxCWMNWj4870gw42vTn8BB
         Bw+7QBb1APjz/y6JQ2VXsy5mbHmSX4Kxfh0JtgWFiWkKeazPDozKWvjkAIS+VZKswfEc
         zjxFmsFpBG2DZ9YFLCejxLx2x8Lp40inA0/BjSapUuuiNAjGB4DHverrFbbQL9nE3o3E
         aYxA==
X-Gm-Message-State: AOAM530pZN70h6LYN03nTe92ZuUL4eig6AgbSsaO3f3wLcME4RAIkM8Z
	aBiBAFm2NLeYW4COQTc8Ewdu6w==
X-Google-Smtp-Source: 
 ABdhPJwiXaQVOuse9l4ra9hYCwv0Rw+ldOar+IaQbkFNk+J9fDKgW+QuU4NG3c2AQczxesejJqBDmg==
X-Received: by 2002:a5d:4d06:0:b0:210:b6:7af0 with SMTP id
 z6-20020a5d4d06000000b0021000b67af0mr3305224wrt.258.1653505112093;
        Wed, 25 May 2022 11:58:32 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5808:e02b:90d6:3f52?
 ([2001:8b0:aba:5f3c:5808:e02b:90d6:3f52])
        by smtp.gmail.com with ESMTPSA id
 m23-20020a05600c3b1700b0039749256d74sm3172387wms.2.2022.05.25.11.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 11:58:31 -0700 (PDT)
Message-ID: 
 <c015ab079801775fe75fc8b255c6d66172473393.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] go.bbclass: fix path to linker in native
 Go builds
From: richard.purdie@linuxfoundation.org
To: Dmitry Baryshkov <dbaryshkov@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: dmitry.baryshkov@linaro.org
Date: Wed, 25 May 2022 19:58:30 +0100
In-Reply-To: <20220525175627.829194-1-dmitry.baryshkov@linaro.org>
References: <20220525175627.829194-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 18:58:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166167

On Wed, 2022-05-25 at 20:56 +0300, Dmitry Baryshkov wrote:
> Building native Go tools results in the tool pointing to the wrong
> location of dynamic linker (see below). The linker is looked up in the
> temporary dir, which can be removed if rm_work is inherited. This
> results in being unable to execute the program with the 'No such file or
> directory' error. Override linker specificiation for native recipes (and
> let Go build environment to pick up a correct one on it's own).
>=20
> Without this patch:
>=20
> $ ldd tmp-rpb-glibc/sysroots-components/x86_64/go-md2man-native/usr/bin/g=
o-md2man
> 	linux-vdso.so.1 (0x00007ffe945ec000)
> 	libc.so.6 =3D> /lib/x86_64-linux-gnu/libc.so.6 (0x00007f3a7490e000)
> 	/home/lumag/Projects/RPB/build-rpb/tmp-rpb-glibc/work/x86_64-linux/go-md=
2man-native/1.0.10+gitAUTOINC+f79a8a8ca6-r0/recipe-sysroot-native/usr/lib/l=
d-linux-x86-64.so.2 =3D> /lib64/ld-linux-x86-64.so.2 (0x00007f3a74d13000)
> $ tmp-rpb-glibc/sysroots-components/x86_64/go-md2man-native/usr/bin/go-md=
2man  --help
> -bash: tmp-rpb-glibc/sysroots-components/x86_64/go-md2man-native/usr/bin/=
go-md2man: No such file or directory
>=20
> With the patch
>=20
> $ ldd tmp-rpb-glibc/sysroots-components/x86_64/go-md2man-native/usr/bin/g=
o-md2man
> 	linux-vdso.so.1 (0x00007ffd19dbf000)
> 	libc.so.6 =3D> /lib/x86_64-linux-gnu/libc.so.6 (0x00007f2d44181000)
> 	/lib64/ld-linux-x86-64.so.2 (0x00007f2d44586000)
> $ tmp-rpb-glibc/sysroots-components/x86_64/go-md2man-native/usr/bin/go-md=
2man  --help
> Usage of tmp-rpb-glibc/sysroots-components/x86_64/go-md2man-native/usr/bi=
n/go-md2man:
>   -in string
> 	Path to file to be processed (default: stdin)
>   -out string
> 	Path to output processed file (default: stdout)
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes since v1:
>  - Explicitly use UNINATIVE_LOADER if uninative is enabled. This is not
>    required (as the binaries will be patches anyway), but makes things
>    more obvious.
> ---
>  meta/classes/go.bbclass | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
> index 1a9a0bc1d426..da3cab5da5bf 100644
> --- a/meta/classes/go.bbclass
> +++ b/meta/classes/go.bbclass
> @@ -45,7 +45,9 @@ GO_LINKMODE ?=3D ""
>  GO_LINKMODE:class-nativesdk =3D "--linkmode=3Dexternal"
>  GO_LINKMODE:class-native =3D "--linkmode=3Dexternal"
>  GO_EXTRA_LDFLAGS ?=3D ""
> -GO_LDFLAGS ?=3D '-ldflags=3D"${GO_RPATH} ${GO_LINKMODE} -I ${@get_linuxl=
oader(d)} ${GO_EXTRA_LDFLAGS} -extldflags '${GO_EXTLDFLAGS}'"'
> +GO_LINUXLOADER ?=3D "-I ${@get_linuxloader(d)}"
> +GO_LINUXLOADER:class-native =3D "${@ "-I " + d.getVar('UNINATIVE_LOADER'=
) if bb.data.inherits_class('uninative', d) else '' }"
> +GO_LDFLAGS ?=3D '-ldflags=3D"${GO_RPATH} ${GO_LINKMODE} ${GO_LINUXLOADER=
} ${GO_EXTRA_LDFLAGS} -extldflags '${GO_EXTLDFLAGS}'"'

This will result in taskhash changes between uninative and non-
uninative builds and I suspect will trip up some of the selftests as a
result.

I think your original patch is ok, we just need to mention it is for
the non-uninative case in the commit message as that explains why
people haven't seen some of the issues. That did confuse me initially!

Cheers,

Richard



