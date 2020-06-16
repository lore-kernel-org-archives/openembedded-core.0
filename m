Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web10.11851.1592317619442475525
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2020 07:26:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Rr23PyAh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id f185so3295364wmf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2020 07:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=qiU8eDHTyLuanLYEmLk1d0noXJHtfEX9plLgCr7ayFA=;
        b=Rr23PyAhSjY6GJsslbanJFUmoCsegET0orezPMSUrD/D2wuhs/xhzDRlk5v671Gt1r
         oEGO7BkCkNJqykG2jSXn74rn+gAW8ziodR2lnaui3R0ez1MEazRFWhFvOxoQ5l9PGfxv
         sSs/y8D09+HsH7GEosIDAvhGYUu/q/ybBWBcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=qiU8eDHTyLuanLYEmLk1d0noXJHtfEX9plLgCr7ayFA=;
        b=klkYX85Hkv22ZcctmJIO3f90h7/S+ZY3vHfGXZj4Mj3nEpJlTyOfrrkgHIU0C/3Lm6
         EAOogOMsBSLBfxvdnWl7PC9OgKwJPMxxIK6f0qZkUvVZLczX1jz79z5NsO6l+DgK3owc
         X5fSVP0laTTzg2OZ9WmIRfv9UXjWBaod/fUKB/O2IuEVsQuBZVUwIVAFvLRWAGWd5OJt
         LraoF6Y4RzCrLF9kjB9bVLYOEse5BIMQUa07KJYuZnMe494D6TLQJaCxrA7eRy00jDNZ
         vxlDEmtrN8NaIZ52aS7JgZa/rWFJXK5sEW2Z/xmsqr/4rQMRjxemz0ffuPydCnXT0DmZ
         L4Mw==
X-Gm-Message-State: AOAM532lB3Nun/T/MkN8b1QMFw558j5I71L/dcgWOwGWBf1sTrPkKHxY
	XD38J3hgonVjAHpZ8GoSU+6DJg==
X-Google-Smtp-Source: ABdhPJw6ubGRJpwe9doiP2ZHlLR+PG/hBowT5jtkn3u1Zr5WckzrZjwJpZGJH+p5FeD2Dav4hTJukw==
X-Received: by 2002:a05:600c:21d7:: with SMTP id x23mr3712862wmj.95.1592317617737;
        Tue, 16 Jun 2020 07:26:57 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id o20sm30829008wra.29.2020.06.16.07.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 07:26:56 -0700 (PDT)
Message-ID: <c5e3e0caa02d882eb4d6e54846b4bfd4e8e78158.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/4] devtool-source.bbclass: Do not export _PYTHON_SYSCONFIGDATA_NAME
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Dan McGregor <danismostlikely@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Daniel McGregor <daniel.mcgregor@vecima.com>
Date: Tue, 16 Jun 2020 15:26:55 +0100
In-Reply-To: <20200615220143.4018104-2-danismostlikely@gmail.com>
References: <20200615220143.4018104-1-danismostlikely@gmail.com>
	 <20200615220143.4018104-2-danismostlikely@gmail.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-06-15 at 16:01 -0600, Dan McGregor wrote:
> From: Dan McGregor <danismostlikely@gmail.com>
> 
> From: Daniel McGregor <daniel.mcgregor@vecima.com>
> 
> This varialbe is set to help python3 running inside the build
> environment. Unset it so that devtool can fetch recipes that inherit
> python3native.
> 
> Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
> ---
>  meta/classes/devtool-source.bbclass | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta/classes/devtool-source.bbclass
> b/meta/classes/devtool-source.bbclass
> index 280d6009f3..4032e59b0c 100644
> --- a/meta/classes/devtool-source.bbclass
> +++ b/meta/classes/devtool-source.bbclass
> @@ -46,6 +46,9 @@ python() {
>      d.setVar('STAMPS_DIR', os.path.join(tempdir, 'stamps'))
>      d.setVar('T', os.path.join(tempdir, 'temp'))
>  
> +    if bb.data.inherits_class('python3native', d):
> +        d.setVarFlag('_PYTHON_SYSCONFIGDATA_NAME', 'export', 0)
> +
>      # Hook in pre/postfuncs
>      is_kernel_yocto = bb.data.inherits_class('kernel-yocto', d)
>      if is_kernel_yocto:

No. We're seeing requests to add code like this all over the place in
the system and its not the right thing to do. We need to fix devtool so
that its setting PATH correctly when executing bitbake. This just works
around the problem.

Cheers,

Richard

