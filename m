Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web12.5699.1613558401664241068
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Feb 2021 02:40:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=baHaQRmU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id v7so16809855wrr.12
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Feb 2021 02:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=Z1CELNPO6amkKnskfYUfkUTFfi6OVmyWnAQ7CT7dNxE=;
        b=baHaQRmU9UI99CUm/hgvXjhnG83VFd2yPrSOBLOJ8ANPiDO/7wFt3AU+2QV1Y6Cyw/
         4Kx+zdCmF7F85pWZmSlvrCbCQFanqzPqxRN78lDtLVePQKIXY6taDU4lKm8OcM0d/zJ4
         kDSMZ20n3a7vlQzkFRiYVSbF8YP2By+frNoXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Z1CELNPO6amkKnskfYUfkUTFfi6OVmyWnAQ7CT7dNxE=;
        b=amrSZTVMJg8bmbp6TgVVMPx6kLYxtQ85WneciOLl1svmFvyS6zRYG+6iFACsIXav4w
         4/ogomDg4HCYYPtsphGj9GhWYchIOhBSrnXXwnV/ifweJZzCrid1D1IsaGPqhgpsEmGo
         l9iCtmXyppIXspHG2p3zpCGBfS5+FITtl36EDfrhBydOYrgcVglniZ9z2tU6GTft+lGs
         81fH/adMnXwBx68u/xUTIMOldOlioF9XULjKrql8sQcpevo2BDmrPk+JlG4emw6V5pDL
         QdGX4eDV2bLayFCIWSXGCbYF8ug1DGOLz2ScFlYYj8GxeQ4J+HeFKP4XNPa47UXy0//s
         zldA==
X-Gm-Message-State: AOAM533yzAmXagbVj276TqzuxjUDP6QyHH5Gt1RVG6Zp/+2wr8aAFtpW
	DJwiSteMG8JXet0lGgonImXygg==
X-Google-Smtp-Source: ABdhPJzXkniZpAtFKpher1p6KLfDyP9U51aUhOb1KIeCrLJE8E+sJzF74nBfRdOQP5L2S15G+YU77Q==
X-Received: by 2002:a5d:47af:: with SMTP id 15mr29113855wrb.205.1613558400048;
        Wed, 17 Feb 2021 02:40:00 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:19d:cb66:14ba:c267? ([2001:8b0:aba:5f3c:19d:cb66:14ba:c267])
        by smtp.gmail.com with ESMTPSA id e1sm3431460wrd.44.2021.02.17.02.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 02:39:59 -0800 (PST)
Message-ID: <8bb8d2888759c8102ee35a7b3badf06fdb0eea86.camel@linuxfoundation.org>
Subject: Re: [OE-core] [poky-contrib][RFC PATCH 2/5] package: Remove false positive lic warnings
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Meh Mbeh Ida Delphine <idadelm@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 17 Feb 2021 10:39:57 +0000
In-Reply-To: <20210217040033.21541-3-idadelm@gmail.com>
References: <20210217040033.21541-1-idadelm@gmail.com>
	 <20210217040033.21541-3-idadelm@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-02-17 at 05:00 +0100, Meh Mbeh Ida Delphine wrote:
> With the IGNOREWITHLINUXSYSCALLNOTE variable set to "1" in local.conf, it removes the "WITH Linux syscall note" string attached to the license value for sources before comparism.
> This is to get more recipe LICENSES to match with those of the sources and reduce the number of warnings outputed.
> 
> Signed-off-by: Ida Delphine <idadelm@gmail.com>
> ---
>  meta/classes/package.bbclass | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index c3259146b6..14c8475cfa 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -1774,6 +1774,10 @@ fi
>                      if l.endswith('-or-later'):
>                          lic_ = l.replace('-or-later', '+')
>                          computedpkglicsperpkg.add(lic_)
> +                    elif l.endswith(' WITH Linux-syscall-note'):
> +                        if d.getVar("IGNOREWITHLINUXSYSCALLNOTE") == "1":
> +                            lic_ = l.replace(' WITH Linux-syscall-note', '')
> +                            computedpkglicsperpkg.add(lic_)

I think this is going to break things and it should be entirely
removing this license entry.

Why? Headers under GPLv2 WITH Linux-syscall-note can be used in a non-
GPLv2 application and that application doesn't then become under GPLv2.

What we probably want is a "safe" list of licenses which don't have
implications and entries matching "* WITH Linux-syscall-note" can be
ignored, as long as they're only in header files. Perhaps we also need
a check to ensure we only see "* WITH Linux-syscall-note" in header
files?

Cheers,

Richard

