Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web08.9184.1625733205521391614
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jul 2021 01:33:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=H1vTOBEU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id i8so6402728wrp.12
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Jul 2021 01:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=g07Cr6Fj2up/6u73lCotN+bqgZlkT7i89G7GvbPJZ/U=;
        b=H1vTOBEU+B7kz+DO7hmDTph/sRbUbwM+ycF8GDOhq8UASQULIo1YZsfS5ZM8M/A9hm
         wnlN7SwfhDkw4x8Jr+VQ4js92th+okhMhLp7/OKZcyN6Wb5ssi6vnESWUCGVOt4tNPnR
         xKlQuZH7/Ldk3yQwIPdREU8VCEKI8/myYWp5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=g07Cr6Fj2up/6u73lCotN+bqgZlkT7i89G7GvbPJZ/U=;
        b=J000FS35wVNnQjIxwYtLFWSQFhNM9+xRmIyieBfVBsfly2JSxPZIiscwMcf6nDyUyx
         wigN2TJSmQ4eZzEFgMzAOJlG7RWaTxeXQZi6UyBeQRYqwsAlqTeUmAP5D0w/yRoPcf2O
         4fUWMYOHAuvlOL1eDK5fg++97aE+wkFZXBFiykcJNXq3rXu0awVZXT+Stpe7PvFAoHo+
         Oy+03ASlRDh1y4g2F9PfQqji2Qrc/lwDnmm44+lmP2LYLps5h3LNWXNRXtiyyppHo6Wc
         Qfw9rbmKdk373EDP8FHIOxxmP3NOUAEQJ+9dw5zfuGHCvLBExwLxVW0PsrGwRLUS/kjp
         DcwA==
X-Gm-Message-State: AOAM533wVD6aPc1QVl7J1AGcE9W1v6jcG+94rZZvMcUwZHTvg9a6tBsL
	mrBR9cJN2m6p0r62CxiPtG+aFw==
X-Google-Smtp-Source: ABdhPJzZLiT/Y8UUWOTD67MhQscy93R5czpFSQngPrX2osOpg/M5D6otu2N9qz4MrOOvFsv7upC93A==
X-Received: by 2002:a5d:47a7:: with SMTP id 7mr1607814wrb.150.1625733203837;
        Thu, 08 Jul 2021 01:33:23 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:226d:2875:5aa2:565b? ([2001:8b0:aba:5f3c:226d:2875:5aa2:565b])
        by smtp.gmail.com with ESMTPSA id z3sm1719224wrv.45.2021.07.08.01.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 01:33:23 -0700 (PDT)
Message-ID: <2302b1a994beea1e8cafb536a123d6ca9d375085.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] license: Drop adding RRECOMMENDS for license packages
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Mike Crowe <yocto@mac.mcrowe.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 08 Jul 2021 09:33:12 +0100
In-Reply-To: <20210708082623.GA25489@mcrowe.com>
References: <20210707170607.2698337-1-richard.purdie@linuxfoundation.org>
	 <20210708082623.GA25489@mcrowe.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-07-08 at 09:26 +0100, Mike Crowe wrote:
> On Wednesday 07 July 2021 at 18:06:07 +0100, Richard Purdie wrote:
> > This changes behaviour when LICENSE_CREATE_PACKAGE is in use. Packages
> > no longer have RRECOMMENDS adding to them.
> > 
> > It was highlighted that this doesn't apply to PACKAGES_DYNAMIC, nor can
> > it easily be made to do so. There is also a much easier way to handle this
> > which is:
> > 
> > IMAGE_INSTALL_COMPLEMENTARY += "*-lic"
> > 
> > which works on a per image basis and doesn't change the underlying
> > package dependencies. I propose we switch to this instead.
> 
> The downside to this is that IMAGE_INSTALL_COMPLEMENTARY isn't documented
> at https://www.yoctoproject.org/docs/latest/ref-manual/ref-manual.html so
> I'd assumed it to be an implementation detail. (Adding it to the
> documentation is presumably not difficult though.)

It should be documented, I think it being missing is just an oversight.

> 
> Since the equivalent for "*-dbg" is to add dbg-pkgs to IMAGE_FEATURES, I
> think that adding:
> 
>  COMPLEMENTARY_GLOB[lic-pkgs] = "*-lic"
> 
> to license_image.bbclass is a cleaner solution.

Yes, I like that.

> We could make the feature
> imply LICENSE_CREATE_PACKAGE="1" but it feels strange for an image feature
> to affect the packages when they are built so perhaps that isn't a good
> idea.

I agree, I'm not sure that would be too helpful. Maybe a comment next to
the line above mentioning it needs to be set? We might also be able to
add a warning if it wasn't set but lic-pkgs was used?

Cheers,

Richard

