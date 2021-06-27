Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web08.3719.1624831446903878724
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jun 2021 15:04:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NhpbEGnA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id l8so9617853wry.13
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Jun 2021 15:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=uj2gtukUeJG9w1qyAs7TBajtD+FpD7hWu+FACFXfXWM=;
        b=NhpbEGnAFomY1OEgrYKZV0VixNOeOlEdqX3G0tXDNPd7+SqrIYltaru6/1C0yOG82p
         Fx6UvO/MY+Ru7rhhpRRdPKj6J/DTLg6iKT9gAB+XYTnq06RJMYp2N1ocgkT0hGgI1fEi
         6whpXtfGB7LrqhNZn/n2t/JEs6MVLZTNZVz/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=uj2gtukUeJG9w1qyAs7TBajtD+FpD7hWu+FACFXfXWM=;
        b=IDxEpMlZTMrXDcwyIXIGwyr7W3rUj/HIpEIK2h4S2JRBKQhI/yTBVWG3jKHlNkpDQY
         2+oAu91yuW7d5SdgFmtwG1rtxfN6ktKl0A2b2I48AMlMOkpiPBnU4y9sBJa8RMgUxmfH
         wr2y2L3Z57yydpDr5wkTGtxH696CDMYzo3dCmVZVrFTkthiTN7Bv7+ypU+NqnXtOPffF
         atcjQUQG0T7bAD+izouJpu3rbhmHFMYk3IW0ot/ihjEVZkCYJ7pk+Mc/AVrXtd7NUmlv
         8gKDu5F5O5HW3PK0TjTZLi72d32xrjqe9V2qGvYv3slt32JTbQIk/9JmPjB4Ss6pqOgM
         jX7A==
X-Gm-Message-State: AOAM530nJR5mVk7mBpnNSvUKgxIVEO91o6FHqRWnHN6SwsmGpnlL4onG
	/sMOs+PwgopxDbhlatZrTlUHRQ==
X-Google-Smtp-Source: ABdhPJwfolW++QacT3VdmPxAxMYijNCha6T5SUHL9hreDWWoCpmlXv3HUG2CmJ4bzuqUjV5/SI+/9w==
X-Received: by 2002:a5d:62c2:: with SMTP id o2mr7313096wrv.234.1624831445612;
        Sun, 27 Jun 2021 15:04:05 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:6f48:4aa9:490d:a26? ([2001:8b0:aba:5f3c:6f48:4aa9:490d:a26])
        by smtp.gmail.com with ESMTPSA id i5sm1116781wrr.4.2021.06.27.15.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 15:04:05 -0700 (PDT)
Message-ID: <4510a378b3264d7ba29be80af9078510cef1a633.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] externalsrc.bbclass: dynamical change of DEBUG_PREFIX_MAP
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Frederic Martinsons <frederic.martinsons@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 27 Jun 2021 23:04:04 +0100
In-Reply-To: <20210623130637.3314755-1-frederic.martinsons@gmail.com>
References: <20210623130637.3314755-1-frederic.martinsons@gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-06-23 at 15:06 +0200, Frederic Martinsons wrote:
> When using external source manager (devtool), the debug symbol generated
> by the compilation doesn't point to the right directory.
> This is normally handled by gcc options that are defined
> in DEBUG_PREFIX_MAP in conf/bitbake.conf.
> 
> But the path in it are hardcoded and point to WORKDIR which is
> not overloaded by devtool.
> 
> This patch takes the parent directory of external source directory
> and prepend correct path to DEBUG_PREFIX_MAP.
> 
> Moreover, to avoid wrong path resolution during dwarfsrcfiles step
> in splitdebuginfo, it make B variable point to the same
> structure as EXTERNALSRC (if EXTERNALSRC_BUILD is not defined).
> 
> Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
> ---
>  meta/classes/externalsrc.bbclass | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
> index 3d6b80bee2..de5ef714b4 100644
> --- a/meta/classes/externalsrc.bbclass
> +++ b/meta/classes/externalsrc.bbclass
> @@ -53,14 +53,26 @@ python () {
>              d.setVar('BB_DONT_CACHE', '1')
>  
> 
>      if externalsrc:
> +        import os
>          import oe.recipeutils
>          import oe.path
>  
> 
> +        pn = d.getVar('PN')
> +        # taken from bitbake.conf
> +        debugsrcdir = "/usr/src/debug/%s/%s%s-%s" % (pn, d.getVar('EXTENDPE'), d.getVar('PV'), d.getVar('PR'))
> +        externalsrc_parentdir = os.path.dirname(externalsrc)
> +
> +        debug_prefix_map_ext = "-fmacro-prefix-map=%s=%s " % (externalsrc_parentdir, debugsrcdir)
> +        macro_prefix_map_ext = "-fdebug-prefix-map=%s=%s " % (externalsrc_parentdir, debugsrcdir)
> +        d.prependVar('DEBUG_PREFIX_MAP', debug_prefix_map_ext)
> +        d.prependVar('DEBUG_PREFIX_MAP', macro_prefix_map_ext)
> +
>          d.setVar('S', externalsrc)
>          if externalsrcbuild:
>              d.setVar('B', externalsrcbuild)
>          else:
> -            d.setVar('B', '${WORKDIR}/${BPN}-${PV}/')
> +            builddir = os.path.join(externalsrc_parentdir, "%s-build" % pn)
> +            d.setVar('B', builddir)
>  

I'm ok with adding some prefix mappings however the commit message doesn't really 
make it clear that you're actually inventing a new build directory here too. We 
can't just poke around the parent directory of the externalsrc like this since we
have no idea what that directory is and we've not been asked to "touch" it.

Cheers,

Richard



