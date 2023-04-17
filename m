Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43685C77B76
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 19:51:42 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.6970.1681761095799685995
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Apr 2023 12:51:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=ffs/mQfQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id n9-20020a05600c4f8900b003f05f617f3cso20376315wmq.2
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 12:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1681761094; x=1684353094;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ryiemnu1M0oBrbd8h6D5Dx/xnZPlfGqB6jVg4+XnBb4=;
        b=ffs/mQfQ0R9qNT7MJ/9+0wS+ZNvgWlLcqk803d3z/7q1/vsbhZ0jBoMPiTNKT97Plg
         jpjAqBws+Av50wtYpnK6ZKJofhGV17WqANcU2S3AF1YtGIpU+alSvrpCxXS6i/tZTPbD
         2cN3kErre2DngnuBNGRUgZmLTT00MRvlFmvHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681761094; x=1684353094;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ryiemnu1M0oBrbd8h6D5Dx/xnZPlfGqB6jVg4+XnBb4=;
        b=C+i4qZ4C9ZbxoyWREomt3KksUxXuao7SdrNV2irfyLMGnvR+6M1s1XToyPh9sKgT82
         UoPM8ohRh3GxS5plEhfQ8FmFEveMDemyndAzCD0J19k7cA+d3i07EhUZKgycil7P/RRd
         VZA1DdY/XKZhZKLuyoZUSueK5izFTAHm64CqARL3+Lk5SteLSJHKs3G3A1AiKD+Gdhpw
         QUzZWSseK6TW8Tja+cJDXHUE4/1WUmVqDvS2L3YYGosQzesNwRPbYh4RdNv/1ppj8lxt
         MAECZAWegzRfZk/7n++eQYkfWJ32EF/K1Un48q87oX1Qm4fV5AAgDKNnBWflWYxs5Fd6
         /Rzw==
X-Gm-Message-State: AAQBX9fe8EtGK/cMRoMuYUhcTd4PXksOLgDJ5kV+WZ1rv5ziOMJcz+F6
	TnHB6buIxk8iu2iurKUvb+Xi5g==
X-Google-Smtp-Source: AKy350YQHPWLe+bd+YAWWAt2XoBeiXEY4G0YuY+6U9Zch1DDTIY4XS7l4VoGsf/zg5tGJ6+AL3CkxA==
X-Received: by 2002:a1c:f303:0:b0:3f1:6942:e024 with SMTP id q3-20020a1cf303000000b003f16942e024mr5883620wmq.27.1681761094064;
        Mon, 17 Apr 2023 12:51:34 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e195:e920:f286:ffe6? ([2001:8b0:aba:5f3c:e195:e920:f286:ffe6])
        by smtp.gmail.com with ESMTPSA id x15-20020a5d6b4f000000b002c8476dde7asm11208140wrw.114.2023.04.17.12.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 12:51:33 -0700 (PDT)
Message-ID: <27b6976546dae12e92dd3af28f657c02eca4afe8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] make-mod-scripts: preserve libraries when
 rm_work is used
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Christoph Lauer <christoph.lauer@email.de>, 
	openembedded-core@lists.openembedded.org
Cc: Christoph Lauer <christoph.lauer@xtronic.de>
Date: Mon, 17 Apr 2023 20:51:32 +0100
In-Reply-To: <20230416103052.28268-1-christoph.lauer@email.de>
References: <20230416103052.28268-1-christoph.lauer@email.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 19:51:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180167

On Sun, 2023-04-16 at 12:30 +0200, Christoph Lauer wrote:
> From: Christoph Lauer <christoph.lauer@xtronic.de>
>=20
> With rm_work active, external module signing throws an error:
> scripts/sign-file: error while loading shared libraries: libcrypto.so.3: =
cannot open shared object file: No such file or directory
> Preserve libraries that sign-file script needs during runtime.
>=20
> Signed-off-by: Christoph Lauer <christoph.lauer@xtronic.de>
> ---
>  meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb=
 b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> index 28e0807d1d..0e24efc597 100644
> --- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> +++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> @@ -32,3 +32,6 @@ do_configure() {
>  		-C ${STAGING_KERNEL_DIR} O=3D${STAGING_KERNEL_BUILDDIR} $t
>  	done
>  }
> +
> +# keep native libraries required for module signing
> +RM_WORK_EXCLUDE_ITEMS +=3D "recipe-sysroot-native"

I'm really reluctant to take this change as it isn't the way
dependencies are meant to work.

It sounds like something in a shared workdir is depending on something
in a recipe workdir and we simply don't support that. Everything needed
should be in the shared workdir. At best this is a bandaid and there
will be other ways to make this fail such as cleaning make-mod-scripts.

I'm even less keen to take it when I think it's going to be backported
"everywhere" as if is the correct solution too.

I don't know what the right fix is unfortunately. I'm sure people would
like me to think about it and come up with one but there are simply too
many different things people would like me to do that with and even for
me, it does take a while to work these things out. I'm just out of
bandwidth, sorry :(

Cheers,

Richard



