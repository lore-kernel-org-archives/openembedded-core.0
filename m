Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.11804.1612883735471593570
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 07:15:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JZ26npRd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id 7so22425508wrz.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Feb 2021 07:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=yNyJi6qG7TNOgqahw1S66Xg8s0L6nCntLO0mi12HplM=;
        b=JZ26npRdIGVsnreU95yONvWY0UQcOdh0sNXkOd0Zdc+Ks5UV3MdthZWc4NMKHQCDAn
         XbOJep/adKi91p5hZftWeaLzLiFCopnJt27vtBP1PaOmY4WG1WaMFlft5e3oCSHYhpEw
         RlimdSjYofTaCVfH0R6CM/5itI8/PNj4Uh7L0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=yNyJi6qG7TNOgqahw1S66Xg8s0L6nCntLO0mi12HplM=;
        b=SLrc/UKvisTUjq8ApnRZyZZg479ac+AV3z/xa9jaOs8+ZV+cemAlAXpnmAKNpafrnR
         G94pwhwWQ/Ox/U6Qy7ghEgMFFo8/NKOhI02qyFTzNx8wpypnCiRDOa3Bt9IDbXWL79ip
         YiTzUV+3Vz9NqTj/XjjGx6WJ92nQ3O9aJDcFxjHkbBWIiPnq8PU32qFsiGetmNaACelD
         2y0dFpkEbePj7LvPGZynUtZs4J8k0AWJ3a//ulXdoYXoyTV1lruKQIPEqMI9dYw/FuA1
         /Aipit8jPpbphgk3KGMf6BZIFR/6rWlPv/dKwz2dsgLg7hhciOGYHuyGNao/jRp+J4nu
         JrIw==
X-Gm-Message-State: AOAM532QW57uH6j2ZVLeV+SYV9/eeu7qzeZSEEJbd0ifYQwvbsXh3kGt
	YF2F7AhCFkFC8p3SMEFV6cTUuw==
X-Google-Smtp-Source: ABdhPJyQaVXK1ml7D5qmyByWKuxy1UgoZ9993yWXvMfGHPkC2ptu3JRoRNBgueOtWOGX7+se/tkIyg==
X-Received: by 2002:adf:c6c1:: with SMTP id c1mr26208196wrh.326.1612883733980;
        Tue, 09 Feb 2021 07:15:33 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:6e64:a4a9:6e48:217c? ([2001:8b0:aba:5f3c:6e64:a4a9:6e48:217c])
        by smtp.gmail.com with ESMTPSA id r10sm5382865wrn.83.2021.02.09.07.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 07:15:33 -0800 (PST)
Message-ID: <f0c6dc4481894031536eda836d13510ae919935c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] license_image: Introduce SKIP_LICENSE_MANIFEST_RECIPES variable to prevent from trying to use license recipeinfo file from image recipes
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 09 Feb 2021 15:15:32 +0000
In-Reply-To: <20210204121323.1696-1-tomasz.dziendzielski@gmail.com>
References: <20210204121323.1696-1-tomasz.dziendzielski@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-02-04 at 13:13 +0100, Tomasz Dziendzielski wrote:
> If image recipe depends on another image recipe it will try to use
> license recipeinfo that is not deployed. It will result in:
> > Exception: FileNotFoundError: [Errno 2] No such file or directory:
> > 'TMPDIR/deploy/licenses/foo-image/recipeinfo'
> 
> We can't determine in a simple and efficient way if dependency recipe
> inherits image.bbclass, so let's introduce SKIP_LICENSE_MANIFEST_RECIPES
> variable that will contain list of recipes that should be skipped.
> 
> Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
> ---
>  meta/classes/license_image.bbclass | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_image.bbclass
> index 8fd88cfb2d..e2f3178306 100644
> --- a/meta/classes/license_image.bbclass
> +++ b/meta/classes/license_image.bbclass
> @@ -223,7 +223,8 @@ def get_deployed_dependencies(d):
>      pn = d.getVar("PN", True)
>      depends = list(set([dep[0] for dep
>                      in list(taskdata.values())
> -                    if not dep[0].endswith("-native") and not dep[0] == pn]))
> +                    if not dep[0].endswith("-native") and not dep[0] == pn
> +                    and dep[0] not in (d.getVar("SKIP_LICENSE_MANIFEST_RECIPES", True) or "").split()]))
>  
> 
> 
> 

I've been giving this some thought and I really don't like having to
remember to manually add special cases like this, it sounds/looks like
something we should really fix in a better way.

Perhaps we should just skip license files if they don't exist? We could
perhaps show a warning if the match isn't for a recipe called *-image?

Cheers,

Richard

