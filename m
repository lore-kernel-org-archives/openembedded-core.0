Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web08.34525.1611177686865703820
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jan 2021 13:21:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Vf4D0hf4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 190so4016947wmz.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Jan 2021 13:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=mKKmj3bcTPYxvyk0w6/O4LRzkyk9u92o8Gix1EKlQ7g=;
        b=Vf4D0hf4sqcAvjwXGkN8dRmP7VcABDhY5gyjUl3+mnJ7vWXo2k2MGS3O414965fs30
         8J/Vx4zT4QWkR41zhMhRpkXhMIYbSjlkViAycVaLK/Gsm965tXYyoUtyTvgcJkyf2bUS
         m5ZBnLEnCoiLtnyYUhjI1PCl0j1mp9ij2CASI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=mKKmj3bcTPYxvyk0w6/O4LRzkyk9u92o8Gix1EKlQ7g=;
        b=IeOXdbCUbhq8jIzWkUbi4Y3yRgmvYHf2Y+52hQBPWYjQyxnc9HLGuHo3XOj/fq+yBR
         CHFXZ04udHxr8gMR5oZJ8bFdWkm6ibiDhXM1m4AKJ6pV3PlrpzmMHMV8IpPA/0RGH9PG
         YRZDvn4R30+Ykd4euCwxUlwQ7nnJC+xH/PC4Gnhgqr37efref8pNceN+wcqO2J7cwF6u
         04WIgyxbH+W/B99llMB65w1x1KQPMGCyiOlmEDvVRPn3w0Cmi0sKjbM8HZNQ2uC5L2NZ
         qU1WxeaeVkvXEcrnKbz9Vri4nhPD5BeF8qvRxqzviVtdQlnpW6XEFSDlz7NlPmb5fz6k
         yNsQ==
X-Gm-Message-State: AOAM530srT+vC3ix12ZeVDF0NleO7nN4qKa9xpNlFpgL9NLIzo0uuA8J
	GjOWCDbwhI4fFdciAAEb1eXsoQ==
X-Google-Smtp-Source: ABdhPJyINR3SOlA2c2a1aixiggnQr6zPIRS83G1tfHlCARWXHP3R1R59+BwV9RBnDUopkhT7YcrcMw==
X-Received: by 2002:a05:600c:230e:: with SMTP id 14mr6041158wmo.161.1611177685323;
        Wed, 20 Jan 2021 13:21:25 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:45f8:776c:2038:dccc? ([2001:8b0:aba:5f3c:45f8:776c:2038:dccc])
        by smtp.gmail.com with ESMTPSA id a62sm5843785wmf.7.2021.01.20.13.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 13:21:24 -0800 (PST)
Message-ID: <7ffdf606187272d4b63d60b5b4b9e791741b3843.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] dtc: improve reproducibility
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: oobitots@cisco.com, openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2021 21:21:23 +0000
In-Reply-To: <20210120182001.20523-1-oobitots@cisco.com>
References: <20210120182001.20523-1-oobitots@cisco.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-01-20 at 10:20 -0800, Oleksiy Obitotskyy via
lists.openembedded.org wrote:
> Makefile override CFLAGS, so -fmacro/debug-prefix-map
> optiions was omitted and binaries contains absolute
> patch to sources.
> 
> Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
> ---
>  meta/recipes-kernel/dtc/dtc.inc               | 10 +++++-
>  ...-Makefile-to-add-CFLAGS-not-override.patch | 36 +++++++++++++++++++
>  2 files changed, 45 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-kernel/dtc/dtc/0001-dtc-Fix-Makefile-to-add-CFLAGS-not-override.patch
> 
> diff --git a/meta/recipes-kernel/dtc/dtc.inc b/meta/recipes-kernel/dtc/dtc.inc
> index 0650e3c82e..59badd4951 100644
> --- a/meta/recipes-kernel/dtc/dtc.inc
> +++ b/meta/recipes-kernel/dtc/dtc.inc
> @@ -8,6 +8,14 @@ DEPENDS = "flex-native bison-native"
>  SRC_URI = "git://git.kernel.org/pub/scm/utils/dtc/dtc.git \
>             file://make_install.patch \
>             "
> +
> +def get_reproducibility_patches(d):
> +     if bb.data.inherits_class("reproducible_build", d):
> +        return "file://0001-dtc-Fix-Makefile-to-add-CFLAGS-not-override.patch"
> +     return ""
> +
> +SRC_URI += "${@get_reproducibility_patches(d)}"
> +
>  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"

Thanks for looking at this, its good to get some of the remaining
issues sorted!

Is there a reason we can't always apply this patch?

Cheers,

Richard


