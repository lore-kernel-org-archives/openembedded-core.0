Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web12.49.1592947859306827379
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2020 14:30:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZSPZfVBf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id f18so241900wml.3
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2020 14:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=3LR+cf795Y73hMpwbGgn8WhtPMMoUg8OOdUd6v58jXE=;
        b=ZSPZfVBfKE5TWtHuDRRKUBS7+xhb5KOrfaa818NpakVzMZLh5KG29aUemHFx/WsgkD
         pWy+ydPRX4ElhgKksOOFhoAppBc27eadsVi0xzcYcTZ1Z+oAJ+Htrz9zeIyTBFwKaMrj
         Y2ClKXOGzTMPJ//TEslZUUWi5rZdvbDSWoiS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=3LR+cf795Y73hMpwbGgn8WhtPMMoUg8OOdUd6v58jXE=;
        b=pjFCiLSIxNZh+IRyvKX52eYVIrq29kkepcxeZ7ZwUezIKdNAx2ONsaeVpVLnFhd/cg
         TSRmur5GBggLg7P782ykWRI0CEnzDWGNNcMAZ2Kvfh3HnwBEv/nQ0ciHQKCm1z3gBSoD
         ZzZvVzZ9d7ONbC1vysfdihOVsqEtXnohoPw8+1IofmsavxrTCdH37pjtFZAWRtPL7mM+
         1Mx8zMwB0QtRra7jwW+AHSwiDr5WfAQyWZqVMtb0OuqhrEt6gvYFahjm1AQLo0/gY0oY
         o7uKV8Vp9esLkhNfJ3Rp0+maLLaeIUe1NDBNihfzrnqmlWmqvlogk7vCn6GZCNksbUMy
         JTyg==
X-Gm-Message-State: AOAM533159AVAL3ERJl3M0GGkfq86IpxEzPEz8C+z91iDenGIOmw18gT
	Ir6RJSN1k4ONXXDO7kpgBpWPrg==
X-Google-Smtp-Source: ABdhPJyM7V2nL8zrsVWEaMD0Flgulx1ol3LPaeg5HhwglEufq+ql/KX/Xk5D8XyASAwBo0RbbYbd4Q==
X-Received: by 2002:a1c:80d3:: with SMTP id b202mr5198192wmd.111.1592947857753;
        Tue, 23 Jun 2020 14:30:57 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id d132sm5301850wmd.35.2020.06.23.14.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 14:30:57 -0700 (PDT)
Message-ID: <b3fa61a52318b6364da1468b3ca3a1a3f894172c.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCH 1/1] gcr: ensure gcr-oids.h is generated before use
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Joe Slater <joe.slater@windriver.com>, 
	openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com
Date: Tue, 23 Jun 2020 22:30:55 +0100
In-Reply-To: <20200623200905.185825-1-joe.slater@windriver.com>
References: <20200623200905.185825-1-joe.slater@windriver.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-06-23 at 13:09 -0700, Joe Slater wrote:
> Add it to the list of sources needed before library
> building in the ui directory.  It is already in
> the list for the gcr directory.
> 
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  meta/recipes-gnome/gcr/gcr/gcr-oids.patch | 28 ++++++++++++++++++++++++++++
>  meta/recipes-gnome/gcr/gcr_3.36.0.bb      |  2 ++
>  2 files changed, 30 insertions(+)
>  create mode 100644 meta/recipes-gnome/gcr/gcr/gcr-oids.patch
> 
> diff --git a/meta/recipes-gnome/gcr/gcr/gcr-oids.patch b/meta/recipes-gnome/gcr/gcr/gcr-oids.patch
> new file mode 100644
> index 0000000..7c99951
> --- /dev/null
> +++ b/meta/recipes-gnome/gcr/gcr/gcr-oids.patch
> @@ -0,0 +1,28 @@
> +gcr: add two generated files to gcr_ui_sources
> +
> +gcr-oids.h is needed by several sources in the ui directory but is not in the
> +list of sources needed before compile time.  In a highly parallel build environment
> +this can cause errors like --
> +
> +In file included from ../gcr-3.36.0/ui/gcr-certificate-request-renderer.c:20:
> +./gcr/gcr-oids.h:5: error: unterminated #ifndef
> +    5 | #ifndef GCR_OIDS_
> +      | 
> +
> +We add gcr_oids, which generates the file, to the sources needed.
> +
> +Upstream-Status:  Pending

This looks like a straightforward fix upstream should take, has it been
mentioned to them?

Cheers,

Richard

