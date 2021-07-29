Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.17057.1627600939002664365
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jul 2021 16:22:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=W5z877fI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id e25-20020a05600c4b99b0290253418ba0fbso5123112wmp.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jul 2021 16:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=FTaEE8+oW0/OAMC5KIB4kn8+zaZVLQTLgTWChHQi4rU=;
        b=W5z877fIoVXQhvE4miaThbIUn0ZbQvP9tgppc0RvijpU4AjZ2PtA8Yy2vr79OOUtrj
         eBTNDOfYzZWEOjwCes9Tkz5S4BZ7E4c3CwY3M888LojTlwKUZnuzO7A8PaWvsEh7ruCY
         WeOt4wYZxLVnG2oQGwkw1oL/Vl1v+Wgk2r7yY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=FTaEE8+oW0/OAMC5KIB4kn8+zaZVLQTLgTWChHQi4rU=;
        b=W84m9vNa4sGxC5mqDA45fX22nJb/uaoY++vd7wlL5dYw99H2bMuQjw8xNR3lR/Rd4w
         9QHuzMmw42mnWSfYqR0Qk+5q8VEWnq8AlLuYLjIde0Ka8r5JoWOAuv+9g2q98c2aQiz3
         jfnbJEbDkxKkpG+9Fo6j38GoXXGj3LKrqpCG5zUAOn4oS5uHEJMb2bbDCMgLI2yuAtF+
         MMbybBfTP49ka6aQ9zxvjOljS3xAx5tbFv/+4t9PFbuRuGXyr8pitqIMKeukohJKoNEY
         /9MgtU875PB4ZIJkverUcN9/Ch6RFMZyzD+3sjkvi+h5dcz+w/cZFFM4Oqjr8+DRAuYO
         hEFg==
X-Gm-Message-State: AOAM533BqcXJR1Hw+kK224k0qx535w7j6Bd38V+pOwzn97a0kNvYxg6y
	TLjECxCJPnOMa6XL2/BsA7uBocDUxhfLqw==
X-Google-Smtp-Source: ABdhPJwOSOfKi+bby/g0Z2iy4ayil1btvbLHVQQnx8TZwPINLB2lNcWYzYqS1vb9FaC3BHbFeuZ+nA==
X-Received: by 2002:a1c:7f50:: with SMTP id a77mr3418601wmd.163.1627600937229;
        Thu, 29 Jul 2021 16:22:17 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:47e7:2d3d:e4c2:218b? ([2001:8b0:aba:5f3c:47e7:2d3d:e4c2:218b])
        by smtp.gmail.com with ESMTPSA id l9sm4424180wro.92.2021.07.29.16.22.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 16:22:16 -0700 (PDT)
Message-ID: <f147b797e6dff3358dde45fde9e911c01e420c86.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] scripts/contrib: Add override conversion script
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Jul 2021 00:22:16 +0100
In-Reply-To: <1695F9FE617EA75A.5172@lists.openembedded.org>
References: <1695F9FE617EA75A.5172@lists.openembedded.org>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-07-28 at 15:15 +0100, Richard Purdie via lists.openembedded.org wrote:
> This adds a script I've developed to migrate metadata to use the new override
> syntax. It is a bit rough but since its for a single use with validation, it
> doesn't need to be perfect. It is run simply as:
> 
> scripts/contrib/convert-overrides.py <directory>
> 
> It is setup and has been tested to work with OE-Core, Bitbake, yocto-docs,
> meta-yocto, meta-gplv2 and meta-mingw. For OE-Core, it converts around 10,100
> lines with about 34 manual fixes needed.
> 
> For other layers it would need updating for override names and exclusions for
> functions/variable names with "append", "prepend" or "remove" in them.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  scripts/contrib/convert-overrides.py | 146 +++++++++++++++++++++++++++
>  1 file changed, 146 insertions(+)
>  create mode 100755 scripts/contrib/convert-overrides.py

Since people are starting to use this, it is easier if it is in OE-Core and
we can then make changes as normal to it with patches.

I've therefore merged an updated version which has taken some of the review
feedback on board and improved it, along with feedback from some real world
use.

Cheers,

Richard



