Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BE8FC433EF
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 17:15:07 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web12.9575.1653498905739322356
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 10:15:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NUA6A3et;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id t13so11835155wrg.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 10:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=Wnv3CfBrBoDaheMbpMu1IeI72gkPQFRBRfDx424mWWc=;
        b=NUA6A3etD5sqUqWcfA0YfTIi6szF2SXUtI3lVJtmCx+01pt9dJFhP0iMvQrAUMnQGT
         8hV94WrIhHQEP/hH7gfjYAg9HMdGUEpxTax4YiJhQ9fJ5jKwpALkVzV7ceV4yegxvNsZ
         aEY+Y6nL+4s38Kriq/7GlJrtGhBYxex+jBeZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=Wnv3CfBrBoDaheMbpMu1IeI72gkPQFRBRfDx424mWWc=;
        b=MEczZy4jvw93Dl36FLyWBnjqexpDERq4ZdbAp3XEHkrvYaazfwbqJW4dQLWCQH9aXJ
         SjT1SsGx70LXZPnh7LQv+k4LOOX+ebgPQ06IH2dQVirolxy/Ghu9qGUCvSal2KZIuD3R
         34mRl45lDZ5Nk5pHg9JrNHUlhxBpfm+SX4lUSIxTX2U1XqdQ0vOHtANQmcXLtm/i1I0i
         0V0yIzKjcGOBg3buvB2ZmfaoTDijIPsv5ChLbHJxiQp7Z2oaHQ1Ohzyz6VJtC1eWUN/x
         24Ww/comQE1GgyOuvS5m+/eIrdO1SvfzrXUSAgp29uK+1jLoG14m8RZd4MCV0qqJKi/B
         K4+g==
X-Gm-Message-State: AOAM531MJb8bFMHJxZeBFqESwxaHdulFHlsQ9txsWbdnOOCO8o9BvX8j
	038woNgpJ2ZThnXwEfEiVBD8cg==
X-Google-Smtp-Source: 
 ABdhPJwRKPsaU4YmeQT6ef3gdqKQz0C8T7ugN0Kw22FggEdVdk1WpMlNU1+wNAeSxiyuVFSjd0dYCQ==
X-Received: by 2002:adf:d090:0:b0:20d:3d4:8845 with SMTP id
 y16-20020adfd090000000b0020d03d48845mr28234989wrh.162.1653498904152;
        Wed, 25 May 2022 10:15:04 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5808:e02b:90d6:3f52?
 ([2001:8b0:aba:5f3c:5808:e02b:90d6:3f52])
        by smtp.gmail.com with ESMTPSA id
 o10-20020a5d648a000000b0020e66dbb9dbsm3419622wri.81.2022.05.25.10.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 10:15:03 -0700 (PDT)
Message-ID: 
 <2178df0a12a6f5cb7723a26bda7fc42cbc6e9c71.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] go.bbclass: fix path to linker in native Go
 builds
From: richard.purdie@linuxfoundation.org
To: Dmitry Baryshkov <dbaryshkov@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: dmitry.baryshkov@linaro.org
Date: Wed, 25 May 2022 18:15:02 +0100
In-Reply-To: <20220525162035.808477-1-dmitry.baryshkov@linaro.org>
References: <20220525162035.808477-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 17:15:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166156

On Wed, 2022-05-25 at 19:20 +0300, Dmitry Baryshkov wrote:
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
>  meta/classes/go.bbclass | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

This is definitely not the correct fix. It should be pointing at the
uninative binaries, not the host system one.

Cheers,

Richard

