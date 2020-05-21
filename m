Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.2106.1590050519735527341
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2020 01:42:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FOUP2CTk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id r3so3932168wrn.11
        for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2020 01:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=05hTbamH/qO0qZgLCl+aYun7JwzGdlsYL7NWQKcTDdE=;
        b=FOUP2CTkSjAF/J/5EVdANXzvHCWVJIkVbvIWOVG/bPYhydXbPLPdSW9rTvKANUOmsn
         qvIHfNado09SIr0bC+PhoICNqdfRhlDw/UdgzmjRsLV98j0Flx0rNMnuLAgNKB6C4njO
         x2kk2xrUARz5hscVVNAmpsG9EoP9TorBwvAi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=05hTbamH/qO0qZgLCl+aYun7JwzGdlsYL7NWQKcTDdE=;
        b=Ey2sUIk07cEVEEl2tftQQyEq1c77mhFnML/Vh3rVfSSpi4ogc4oq705tEUTxX6oeGs
         PS6OFhpAAz7xU03kvCBJehkCHc7XrztkqdZUmmU3SEZoBRSRRxcuRjsDsQFYtiZzHJ0q
         Z4w9IeN6tgCTi3ip3sJKNcZEgK1xeCHpniPhXsKh2WteCRroyWGfb4HueGid/fo5PXi6
         KM/8hkr5WIb7Sp2Js/o0mRpWS99opgwTGiyrlgx2nk3bmecgvaehHragsZHcwoPdW936
         3MydWKsOo2fBpUBYJ5T3GL/W41+jFFC1+1H5vvcaBhxbKIFVGZF7iYoghy2lmmBCWQ02
         oHbg==
X-Gm-Message-State: AOAM533ivPeoP9AfkuO7I5Pdv0BxDuCJyF+z230KBauB0ut1musjqDmP
	NZxHIF7xuUXhpD6FaVojXcFG19Bpb0E=
X-Google-Smtp-Source: ABdhPJxSsLQbZe8Jz64PLxFAndtmjUPuUXCtGDG9KPI5WG8nwmsATgoy5RO7rLJ5MhJZTFeaeyisnQ==
X-Received: by 2002:a05:6000:1010:: with SMTP id a16mr7139818wrx.291.1590050518254;
        Thu, 21 May 2020 01:41:58 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id l11sm6009631wmf.28.2020.05.21.01.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 01:41:57 -0700 (PDT)
Message-ID: <c6a1e363c6265e6fc17e205422ee992a5522244f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/1] archiver.bbclass: Fix duplicated SRC_URIs for do_ar_original
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>, 
	openembedded-core@lists.openembedded.org
Cc: pbarker@konsulko.com
Date: Thu, 21 May 2020 09:41:56 +0100
In-Reply-To: <990b33fc44d9449f1a3e7c9d6703a8ba225e681e.1590033901.git.liezhi.yang@windriver.com>
References: <cover.1590033901.git.liezhi.yang@windriver.com>
	 <990b33fc44d9449f1a3e7c9d6703a8ba225e681e.1590033901.git.liezhi.yang@windriver.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-05-20 at 21:05 -0700, Robert Yang wrote:
> The argument urls of bb.fetch2.Fetch(urls, d) are duplicated to SRC_URI, which caused errors like:
> 
> bb.data_smart.ExpansionError: Failure expanding variable SRCPV, expression was ${@bb.fetch2.get_srcrev(d)} which triggered exception FetchError: Fetcher failure: The SRCREV_FORMAT variable must be set when multiple SCMs are used.
> The SCMs are:
> git://github.com/docker/notary.git;destsuffix=git/src/github.com/docker/notary
> git://github.com/docker/notary.git
> 
> The first one is from original SRC_URI, the second one is from the
> variable 'urls', so cleanup SRC_URI before call bb.fetch2.Fetch() can fix the
> problem.
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/classes/archiver.bbclass | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
> index 43333a7551..780c562b68 100644
> --- a/meta/classes/archiver.bbclass
> +++ b/meta/classes/archiver.bbclass
> @@ -193,7 +193,13 @@ python do_ar_original() {
>                  del decoded[5][param]
>          encoded = bb.fetch2.encodeurl(decoded)
>          urls[i] = encoded
> -    fetch = bb.fetch2.Fetch(urls, d)
> +
> +    # Cleanup SRC_URI before call bb.fetch2.Fetch() since now SRC_URI is in the
> +    # variable "urls", otherwise there might be errors like:
> +    # The SRCREV_FORMAT variable must be set when multiple SCMs are used
> +    ld = bb.data.createCopy(d)
> +    ld.setVar('SRC_URI', '')
> +    fetch = bb.fetch2.Fetch(urls, ld)
>      tarball_suffix = {}
>      for url in fetch.urls:
>          local = fetch.localpath(url).rstrip("/");


Well found! I've starred at that code for a different issue and not
spotted that!

Cheers,

Richard

