Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web12.12978.1610473772651924539
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jan 2021 09:49:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Sst7aKvW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id r7so3420058wrc.5
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Jan 2021 09:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=nxqgUX1hb40ro9vh+y0svgxhNpXparS21VH0rbcJ+xo=;
        b=Sst7aKvWObhYfbi5wMrRcqwNqTdU+6jjShUgB2V0ew4I/DGIBRr34uSUfBXHe0XrmJ
         Anpb+2uNraL/wQ2verzF1eKzlxeluWjQmeuAOPPr6vsXdRFxtF0B2GzPCWLcHHvd+5p6
         ZxAOiCROjvzCPIfImkSewxLCId+jNjbOK4eRA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=nxqgUX1hb40ro9vh+y0svgxhNpXparS21VH0rbcJ+xo=;
        b=VQOhdz7bS//BIDo1VPbI6fKtpsdAlMgme9fhLCI60v3VZ8PjMmmxvZoGLL5Qe3uLGs
         wmAGyYwowuQf6uv3jb0hhxpN2ld2feB03IzqBC32CHI9/e/cLG/jRJapNNu0s36YCe7D
         lFxk1njoLhKC/nVDL7eClpAbLdKXp3TWgv6QiuUIM3hA4YEouaWiqSaFx4Jrump2s4mf
         pGeK4VoXJx5gawViMsTzAsMH6mWJA+XHCsGivMvI8G7V2tsRBQO9NGjKlRjUKj7muESw
         mVwIy6CoRXdnu00bz3pQFqmdUGw6TS0cAYACj28uU0GQtyKZNcfL7q9kXbUA9fVIEmVU
         6Uhg==
X-Gm-Message-State: AOAM5320XHarJLjT5UK5FJk+Zucgn7P79JtjFByeEaz478AkKYj6bbdJ
	Sg19uW7il6iPJMG0nLgjClIZPg==
X-Google-Smtp-Source: ABdhPJzsHm2ogtMVA2spiLlYHllFoarc3OKPDdy0vUtRvM3o+468yVEJ7AYnfuxpxMD92wzXZVOwKA==
X-Received: by 2002:a5d:61c4:: with SMTP id q4mr18401wrv.304.1610473771140;
        Tue, 12 Jan 2021 09:49:31 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:281a:af36:8e71:af21? ([2001:8b0:aba:5f3c:281a:af36:8e71:af21])
        by smtp.gmail.com with ESMTPSA id g1sm6173031wrq.30.2021.01.12.09.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 09:49:30 -0800 (PST)
Message-ID: <c283c960deec844c48af3e0be41ff2c05e8a0665.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH 1/1] classes/npm: utilize lockfile in do_fetch to avoid multiconfig problems
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: chris.laplante@agilent.com, openembedded-core@lists.openembedded.org
Cc: jean-marie.lemetayer@savoirfairelinux.com
Date: Tue, 12 Jan 2021 17:49:29 +0000
In-Reply-To: <20210112165341.3723-2-chris.laplante@agilent.com>
References: <20210112165341.3723-1-chris.laplante@agilent.com>
	 <20210112165341.3723-2-chris.laplante@agilent.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-01-12 at 11:53 -0500, Chris Laplante via
lists.openembedded.org wrote:
> From: Chris Laplante <chris.laplante@agilent.com>
> 
> The npmsw fetcher doesn't play nice with multiconfig for some reason.
> Concurrent do_fetch tasks for npm recipes can try to download modules at
> the same time to ${DL_DIR}/npm2, resulting in races and failed
> downloads.
> 
> Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
> ---
>  meta/classes/npm.bbclass | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
> index 068032a1e5..3e56765a2f 100644
> --- a/meta/classes/npm.bbclass
> +++ b/meta/classes/npm.bbclass
> @@ -41,6 +41,8 @@ NPM_PACKAGE = "${WORKDIR}/npm-package"
>  NPM_CACHE = "${WORKDIR}/npm-cache"
>  NPM_BUILD = "${WORKDIR}/npm-build"
>  
> 
> 
> 
> +do_fetch[lockfiles] += "${DL_DIR}/npm2_fetch.lock"
> +
>  def npm_global_configs(d):
>      """Get the npm global configuration"""
>      configs = []

If its just multilib, you could put a ${BPN} in the lock name? or is it
conflicting general recipes?

Cheers,

Richard

