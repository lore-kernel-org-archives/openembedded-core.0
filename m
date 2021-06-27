Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.3637.1624831124346159408
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jun 2021 14:58:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FLGgLE+W;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id j11-20020a05600c1c0bb02901e23d4c0977so11667674wms.0
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Jun 2021 14:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=twlCgDKfpJ06Ug6j7udrSJDDemkKRi8k3f4w7bHp3vI=;
        b=FLGgLE+Whh1aDjkSpeAnLSAvp1oZ8c2LG/bFNIsosdYAlV8iclIEAX1tbKXcDNisUs
         LkwjflYaiL2SH0/1YThlvNGmu7vFjV+dJT33O1C9uqBFscGKngivgv9orubu+z6aaqC3
         1SVTSNFxVSP4gjDwrtCzcVa9pOcHTTtT1EMQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=twlCgDKfpJ06Ug6j7udrSJDDemkKRi8k3f4w7bHp3vI=;
        b=o0tp55kvGBFbJYBiaaoj7fxyQFw49ylllczJ9+816YKDF3q/jTa1WY0RPuESXUZ08x
         +G9EnjycNr7S8CDtRgZ41ZdB0Ckg1lz81Wlid8gfdrCb4LbNJ1xPMAhr/xuF6MsRWm8y
         cCBdqlS9JpOLxdIVNL3X9dmUioJYzSxLxpxq1zajgJYEfDTaJjfpG6CUKSfCwlpevhB/
         PWSoQvR+ExiCQRDnvvxEaklc1C4dw/2Jjl1oZ505xAeb5BMXtMhMgYDmG2oJv7PqoSeN
         zE8ia0U9c+iwOH2LtqNO+9flvaX0ZrD+SeU1MU2lUoTXdSpdgANuaC+9fzsVgirjj1G8
         oL4w==
X-Gm-Message-State: AOAM5303Nydcodn3AWhwXTmuiFvNpixt77vuBwETZX2WeMRxV/6mTGiS
	kaBtAVZp9LX4Fo7rSDcN+Oo8WQ==
X-Google-Smtp-Source: ABdhPJySUrn/w08GQVGMT7QcqwSaN3VZMw8ZX9cOcka3vLyIOdl6OLyXjIq3lGwzG6hclPGigiwBwQ==
X-Received: by 2002:a05:600c:1c08:: with SMTP id j8mr23246565wms.73.1624831122821;
        Sun, 27 Jun 2021 14:58:42 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:6f48:4aa9:490d:a26? ([2001:8b0:aba:5f3c:6f48:4aa9:490d:a26])
        by smtp.gmail.com with ESMTPSA id j35sm6043985wms.7.2021.06.27.14.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 14:58:42 -0700 (PDT)
Message-ID: <607af1f2d3d906f0f3d044844cb68d18f3651e57.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] package.bbclass: manage external sources for debug source file packaging
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Frederic Martinsons <frederic.martinsons@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 27 Jun 2021 22:58:41 +0100
In-Reply-To: <20210623130637.3314755-2-frederic.martinsons@gmail.com>
References: <20210623130637.3314755-1-frederic.martinsons@gmail.com>
	 <20210623130637.3314755-2-frederic.martinsons@gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-06-23 at 15:06 +0200, Frederic Martinsons wrote:
> Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
> ---
>  meta/classes/package.bbclass | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index cf30f33f3d..38e9065f25 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -560,13 +560,20 @@ def copydebugsources(debugsrcdir, sources, d):
>          strip = d.getVar("STRIP")
>          objcopy = d.getVar("OBJCOPY")
>          workdir = d.getVar("WORKDIR")
> -        workparentdir = os.path.dirname(os.path.dirname(workdir))
> +        externalsrc = d.getVar('EXTERNALSRC')
> +        if externalsrc:
> +            workparentdir = os.path.dirname(externalsrc)
> +        else:
> +            workparentdir = os.path.dirname(os.path.dirname(workdir))
> +
>          workbasedir = os.path.basename(os.path.dirname(workdir)) + "/" + os.path.basename(workdir)
>  
> 
>          # If build path exists in sourcefile, it means toolchain did not use
>          # -fdebug-prefix-map to compile
>          if checkbuildpath(sourcefile, d):
>              localsrc_prefix = workparentdir + "/"
> +        elif externalsrc:
> +            localsrc_prefix = os.path.join("/usr/src/debug/", workbasedir) + "/"
>          else:
>              localsrc_prefix = "/usr/src/debug/"
>  

Having to change package.bbbclass to work around whatever externalsrc is doing 
feels rather wrong. This looks/feels like we're adding hacks on top of hacks 
and is going to end up with an unmaintainable mess. I'd note there are also
no test cases monitoring whether this is working or regressing.

The patch doesn't have a commit message and explaining anything about the 
problem being solved either. I don't doubt there is one but I don't think
this patch is right or ready to go in...

Cheers,

Richard


