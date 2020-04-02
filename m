Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web10.3633.1585858520692501648
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2020 13:15:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RN0KEBX6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id 91so3832698wri.10
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2020 13:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=NiIBqP9IyW3IUrKj9D4OEemcsseL6iEZg4ylOhlZbJ8=;
        b=RN0KEBX6k5AJ33t+8xUiu272LjYOaV4Q9F4kXr+LwIFct8Zs1evtUgymmieD938ynO
         HEM4uPr9KE9f5AAiIHEHiTcUK08wVkAIuNx8lEvW9CWtVnjuNkpIfwskxn6NId+Cx19l
         t9Nuh3sYZifZRWl+7H3ygEfbhVHiFtvv0TRzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=NiIBqP9IyW3IUrKj9D4OEemcsseL6iEZg4ylOhlZbJ8=;
        b=LEmG5HfEeaxu++n/hfDwbTD2mhQOvormb2+Rshpni0VNl8mzs6NZk1YPBNI+22ioEo
         DeF0JHb8B1E14t+HfiATZN7+XCEDZD5vmYT0I4TkBc3vqQUxN9hAfyegvwmq2wkkT0Ln
         JZ0EgKG2ew+j5ws3lVdnIiapvEcYtJic2ExlXoKFnoZ4HvcghnlKAijEK8BVLTN3Pd/f
         B1n1trnDc/hazWuTp4NxjmBfhn94J7pPriqAy0lZl/tZALSKvWsRjr7xcktpY1yjHXid
         WSwQEdY6tKhUEhAWoi3gzVOstZg1qY5xLD4omnwVEXnD5eUln4ZnEvFBVy9kbPWEmz+O
         H5KQ==
X-Gm-Message-State: AGi0PuYq6tq6OAiT42ZniU1uAXH4iW3qCSHhZ6IV+E+XGkE80C4vl+5p
	zz9sND3wP/1VbZjLkuy3jq4EcA==
X-Google-Smtp-Source: APiQypI9PAI8eitTX6m/YUcQSSjLILNnX/qPhCbkmPOY/SokbHBw4ArkGRbDRintc263byL+/JKm4g==
X-Received: by 2002:a5d:55c4:: with SMTP id i4mr5502308wrw.170.1585858519158;
        Thu, 02 Apr 2020 13:15:19 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id a145sm771537wmd.20.2020.04.02.13.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2020 13:15:18 -0700 (PDT)
Message-ID: <7c6f84dd795b37bbabc594cc90683405933e3063.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] classes/reproducible_build: Skip SDE for non-finalizing virtual recipes
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Joshua Watt <JPEWhacker@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 02 Apr 2020 21:15:17 +0100
In-Reply-To: <20200402180832.12814-1-JPEWhacker@gmail.com>
References: <20200402180832.12814-1-JPEWhacker@gmail.com>
User-Agent: Evolution 3.36.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-04-02 at 13:08 -0500, Joshua Watt wrote:
> Don't capture the source date epoch for recipes that are not being
> finalized. This prevents a virtual recipe (e.g. multilib) from
> attempting to read the source date epoch file from the non-virtual
> recipes workdir.
> 
> [YOCTO #13851]
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/classes/reproducible_build.bbclass | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

Thanks, its a start. Unfortunately it pokes or assumes far too much
knowledge of bitbake internals so we'll have to come up with something
neater.

I'll give this some further thought.

Cheers,

Richard

> diff --git a/meta/classes/reproducible_build.bbclass
> b/meta/classes/reproducible_build.bbclass
> index 8da40f656a..48ec9108a5 100644
> --- a/meta/classes/reproducible_build.bbclass
> +++ b/meta/classes/reproducible_build.bbclass
> @@ -172,6 +172,20 @@ python create_source_date_epoch_stamp() {
>  }
>  
>  def get_source_date_epoch_value(d):
> +    onlyfinalize = d.getVar('__ONLYFINALISE')
> +    virtual = "%s:%s" % (d.getVar("BBEXTENDCURR") or "",
> d.getVar("BBEXTENDVARIANT") or "")
> +
> +    if onlyfinalize == "default":
> +        onlyfinalize = ":"
> +
> +    # Only capture the source date epoch if the current virtual
> recipe is the
> +    # one being finalized. This prevents looking for the SDE file in
> another
> +    # recipes ${WORKDIR}, where it may or may not exist
> +    if onlyfinalize:
> +        if onlyfinalize != virtual:
> +            bb.debug(2, "Skipping SOURCE_DATE_EPOCH: virtual '%s' !=
> finalize '%s'" % (virtual, onlyfinalize))
> +            return 0
> +
>      cached = d.getVar('__CACHED_SOURCE_DATE_EPOCH')
>      if cached:
>          return cached
> 

