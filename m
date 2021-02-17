Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web12.5748.1613558724899926847
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Feb 2021 02:45:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=N14h3ze2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id v7so16828102wrr.12
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Feb 2021 02:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=8v33VqHYljEsTe/YpRMJv2aXTb2PD0ihCyqyJhuTWCU=;
        b=N14h3ze26gQq/MtDY4oe/wXiPdefvXo2kIftJCW+e1u3d6N9dMlhopbxE6HbB52JwC
         X+mYhRBkZPlkf3tkY2SxpQlZem/kxnvQq6OowMbpEvg6tgsXl+j0zEnGCy9UMGV8fdaF
         yvPuxQO6FlZIYl6ZWLaoBzWkPdT28ZGiNujvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=8v33VqHYljEsTe/YpRMJv2aXTb2PD0ihCyqyJhuTWCU=;
        b=icjNdOIHy4nqYbjkywkKplSfw8pMZBUPZHLhqlnQ5joBAkXFPooUceGGAP/Ja8rocv
         gtQ9uqyyE/fJVHjTDMieX3E/WED/W73z1SOKnkcDZAvrgbbCJTlQ+Mx3MoR6wZtTlLPM
         0bDhg3tuuifQFGSZBXME9a0SXC5celfsRg5WQrWYuvVKbZlfi2pHqRv25dhHavF7c5y9
         qyLaWGvDrezcuj93BRInHiud4r+GuqNcCjRIHeFfPtjjACa16SmhQETWLi4XRsnYmU6c
         StEe4SUIS96eD77D6D+T0wTdbbkskImndr90BNxGkWi6XK6FaDH486xxsQeAKObiI3bI
         Zj+Q==
X-Gm-Message-State: AOAM530dY0U5cBZuB/oyXdhUMcLptcOb4qvV9eMhwdADlXCRthP+UU3D
	CX1/hJvd9ZsI0Xq+EQHuczX2DA==
X-Google-Smtp-Source: ABdhPJyjHHoaii6limqYMwSf6Dg6jb93dErOIJYkrHCRIPrLjwx5xYhyaCUzYmHoMPg+9V8u7UD/kw==
X-Received: by 2002:a05:6000:1565:: with SMTP id 5mr29002024wrz.109.1613558723228;
        Wed, 17 Feb 2021 02:45:23 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:19d:cb66:14ba:c267? ([2001:8b0:aba:5f3c:19d:cb66:14ba:c267])
        by smtp.gmail.com with ESMTPSA id i8sm3913613wry.90.2021.02.17.02.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 02:45:23 -0800 (PST)
Message-ID: <00aa11a4caeb70297cfc193827a45d1ecf1a6132.camel@linuxfoundation.org>
Subject: Re: [OE-core] [poky-contrib][RFC PATCH 4/5] license.bbclass: Add functions to split and canonicalise license strings
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Meh Mbeh Ida Delphine <idadelm@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 17 Feb 2021 10:45:21 +0000
In-Reply-To: <20210217040033.21541-5-idadelm@gmail.com>
References: <20210217040033.21541-1-idadelm@gmail.com>
	 <20210217040033.21541-5-idadelm@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-02-17 at 05:00 +0100, Meh Mbeh Ida Delphine wrote:
> These functions that will later be used in package.bbclass simply make the source and recipe licenses in the same format so that they can easily be compared and the ouput warnings filtered accordingly.
> split_spdx_lic() splits the license strings and returns a set of the canonicalised licenses.
> rem_false_lics() does two things:
> - Converts '-or-later' licenses to their canonicalised form
> - Gets rid of "WITH Linux-syscall-note" from license string if specified in local.conf
> 
> Signed-off-by: Ida Delphine <idadelm@gmail.com>
> ---
>  meta/classes/license.bbclass | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> index dc91118340..576464cb26 100644
> --- a/meta/classes/license.bbclass
> +++ b/meta/classes/license.bbclass
> @@ -435,3 +435,30 @@ python do_populate_lic_setscene () {
>      sstate_setscene(d)
>  }
>  addtask do_populate_lic_setscene
> +
> +
> +def split_spdx_lic(d, licensestr):
> +    """
> +    Split the license strings and returns a set of the
> +    canonicalised licenses.
> +    """
> +    import oe.license
> +    split_lic = oe.license.list_licenses(licensestr)
> +    spdx_lic = set([canonical_license(d, l) for l in split_lic])
> +    return spdx_lic
> +
> +def rem_false_lics(d, pkglic):
> +    pkglicsperpkg = set([])
> +    for l in pkglic:
> +        if l.endswith('-or-later'):
> +            # Converts '-or-later' licenses to their canonicalised form
> +            lic_ = l.replace('-or-later', '+')
> +            pkglicsperpkg.add(lic_)
> +        elif l.endswith(' WITH Linux-syscall-note'):
> +        # Gets rid of "WITH Linux-syscall-note from license sring"
> +            if d.getVar("LICENSE_WITH_LINUX_SYS") == "1":
> +                lic_ = l.replace(' WITH Linux-syscall-note', '')
> +                pkglicsperpkg.add(lic_)
> +        else:
> +            pkglicsperpkg.add(l)
> +    return pkglicsperpkg


Creating these functions is good. We should put them into the function
library in meta/lib/oe/license.py. I already commented about a couple
of elements of this second function.

Cheers,

Richard


