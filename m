Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web09.1267.1603316830648261507
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2020 14:47:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DkcsYFNw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id d78so3622516wmd.3
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2020 14:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=IF7HyqUWRdJUWFY+hGmfYvgfMvWDQ5Fy2McXUocTrq4=;
        b=DkcsYFNwPqED3KIild+9+ozbxjVQc2amXd+bZFQPmwkoDv8x3NQRCc7+kf4a6iZshN
         6dI1nWze0WWKWE/s+VR3A6NbT+TIWwcW80uXsO46xAVKMt1Pqz1Q5pp2Rs5f+/XoMIZQ
         SfexpWPwq8XHx5a2ObB0QgzfmuDs2zQFrGRdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=IF7HyqUWRdJUWFY+hGmfYvgfMvWDQ5Fy2McXUocTrq4=;
        b=NrrzUR1aeddxRvkgfJ8OrylCD3dazVkLJT2qfbVYQN0hmAAm3oM5Oq1lHLBZzOVXL3
         scp8PuGXeYOr3josIDOxMOWDuXreqfecR8hWhcrzvB2BTRW3YkKhb1IyRwml6wk1pkuB
         k8SkHDfLBb6YZO4CedHDbYq6UWAovb1s29/PW36d0QQf8ZZXZZDkdVdDhi5mGjFnmSYC
         O1Oa5txjeOKwwW1QgY9z7MY3/XN8v5eVrhGFzmiNAVzbdUXB4PadvW/7kLI1hp8i2eDb
         toIZM8iCrDJyLRF31WRiF64mhqAJahO6j21hKfK3YbfGL/JjvLQaQnFVPKi2WkFT96rR
         EVwA==
X-Gm-Message-State: AOAM532j7PdgOGKL1mNP8zd3gQB9VfXY7VXyckNOYu0ISn96TfbFJpMq
	NyznzoRIwle+47noBSzP+SZ5Jg==
X-Google-Smtp-Source: ABdhPJxwygLqUJ1oH6fIeeYnAZI59JtsXrObncpfQnedlDJpEacR52c6CQQroSvs2+icDxQO8/IyGQ==
X-Received: by 2002:a1c:2581:: with SMTP id l123mr5350138wml.169.1603316828994;
        Wed, 21 Oct 2020 14:47:08 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from a.6.3.d.1.f.b.7.5.5.7.b.f.2.d.5.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (a.6.3.d.1.f.b.7.5.5.7.b.f.2.d.5.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:5d2f:b755:7bf1:d36a])
        by smtp.gmail.com with ESMTPSA id c130sm5580259wma.17.2020.10.21.14.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 14:47:08 -0700 (PDT)
Message-ID: <d4a88c9df72243f4e334d3b408200062b6113b59.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] multilib_header.bbclass: Do not install the stubs for non-multilib case
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Wed, 21 Oct 2020 22:47:07 +0100
In-Reply-To: <20201021210932.984184-1-raj.khem@gmail.com>
References: <20201021210932.984184-1-raj.khem@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-10-21 at 14:09 -0700, Khem Raj wrote:
> We mark certain headers which are not usable in multilib case through
> this function, this however is a unnessary indirection when building
> distros without multilib feature. Additionally it also addresses a
> case
> where we compile baremetal software e.g. bootloaders or BPF binaries
> e.g. which are a different target effectively but can be built using
> same toolchain with some flags. This does not work when we always
> install the stubs since the stubs require a fixed wordsize definition
> and that may not be true for the BPF cases e.g. it will work fine
> when
> multilib is enabled since that would have provided the headers it
> needed
> say for 32bit multilib. Currently they go missing for a non-multilib
> case and we end up with errors like
> 
> recipe-sysroot/usr/include/bits/long-double.h:23:10: fatal error:
> 'bits/long-double-32.h' file
> not found
> > #include <bits/long-double-32.h>
> 
> Therefore lets install these stubs only when using
> multilib in distro
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/classes/multilib_header.bbclass | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/multilib_header.bbclass
> b/meta/classes/multilib_header.bbclass
> index e03f5b13b2..9ccdf46be5 100644
> --- a/meta/classes/multilib_header.bbclass
> +++ b/meta/classes/multilib_header.bbclass
> @@ -6,7 +6,9 @@ inherit siteinfo
>  # all of the ABI variants for that given architecture.
>  #
>  oe_multilib_header() {
> -
> +	if [ -z "${MULTILIB_VARIANTS}" ]; then
> +		return
> +	fi
>  	case ${HOST_OS} in
>  	*-musl*)
>  		return

I have a feeling this was written specifically not to touch that
variable so that a multilib build can reuse components from a non-
multilib build and share the sstate if you configure it that way. This
change would force *all* multilibs to be stores as their own sstate and
require their own namespace.

We may therefore have to find a different control for this :/.

Cheers,

Richard



