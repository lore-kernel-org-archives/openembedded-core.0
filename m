Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8A92C433EF
	for <webhook@archiver.kernel.org>; Sun,  7 Nov 2021 08:54:59 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web12.29029.1636275299154347176
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Nov 2021 01:54:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=id53zIja;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id r8so21184614wra.7
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Nov 2021 01:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=PYn1YsWmDGHBE73S11+NRPpyeUtGg+d79r24H2Q+Ngo=;
        b=id53zIja37UevhD7oSYf1qEwEQ/MQB9Km4r6FWtxwqbcXMgr8I83iZUlq9vsdqXQAc
         2F6bZJHIlQNznU2xknuI3rO0P7yS4gMbsfQ6qK/o6Fasv1RBtwM5eA2PSBLoIzdUgO0L
         PFhPkiEnsHsEZoK8gzgHCDGWcBZOMzpxXCt8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=PYn1YsWmDGHBE73S11+NRPpyeUtGg+d79r24H2Q+Ngo=;
        b=yhzOF18iqjxFOg26ostGik2dK2mprFsbdLxIZ5ZK/PZvipScyupygbBDkXqvhKUkOO
         vpawW0QHvBCfF740aMj723yywmDGCSN6fJZfg6O49+LN3x7LKIu6tOtC1vNJJcQjalZs
         Vabo+Xz87cyUAfbhlQvAQ+iO467pRvJ6nPdZr9JQibu83JTOVrCjv1jxiq56VTYGkVen
         Um5kIAieoFbARpTnxig9lrh6TmXGRfm2gexZ9F9Z4L3L9qeFbjAYM/XEyqQ3UU4vWC3t
         BVP3YuC2/LKmsEwhrilZgaIQsLex0H5xTZoEnjsKHxHzZQmZ04sHu/ycFJym+sw4OBN6
         JziA==
X-Gm-Message-State: AOAM532fAV0ntTatqCuOq5cinj7ZpjDtlFB9yqA5Akbi/9sXI4J/wdLo
	jkAK4mr3LTaFou/z480pIbN9dg==
X-Google-Smtp-Source: 
 ABdhPJw/I14/w66f0BT5kY+EyyMelTFM0cTQe303Zp8p/0wc0ktl+HV1VWu1ky2s2gdm9fW5k4gQPg==
X-Received: by 2002:a5d:4a0a:: with SMTP id
 m10mr65932112wrq.221.1636275297264;
        Sun, 07 Nov 2021 01:54:57 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:fdfa:2bc:4272:d318?
 ([2001:8b0:aba:5f3c:fdfa:2bc:4272:d318])
        by smtp.gmail.com with ESMTPSA id
 h3sm12680371wrv.69.2021.11.07.01.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Nov 2021 01:54:56 -0700 (PDT)
Message-ID: 
 <cf04f6c310491ca861ce5073dc14554bcba99ebc.camel@linuxfoundation.org>
Subject: Re: [bitbake-devel] [PATCH 2/2] fetch2: Fix race condition in
 latest_revision
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: jasper@fancydomain.eu, bitbake-devel@lists.openembedded.org
Cc: martin@mko.dev, Daniel.Baumgart@iris-sensing.net,
	openembedded-core@lists.openembedded.org, Jasper Orschulko
	 <Jasper.Orschulko@iris-sensing.com>
Date: Sun, 07 Nov 2021 08:54:55 +0000
In-Reply-To: <20211105133048.19879-2-jasper@fancydomain.eu>
References: <20211105133048.19879-1-jasper@fancydomain.eu>
	 <20211105133048.19879-2-jasper@fancydomain.eu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Nov 2021 08:54:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157947

On Fri, 2021-11-05 at 14:30 +0100, Jasper Orschulko via lists.openembedded.org
wrote:
> From: Martin Koppehel <martin@mko.dev>
> 
> Setting latest_revision contained a race condition, where it would be
> set to an empty string, if the hash calculation function would take to
> long.
> 
> Signed-off-by: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
> ---
>  lib/bb/fetch2/__init__.py | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/bb/fetch2/__init__.py b/lib/bb/fetch2/__init__.py
> index 6a38cb09..9dc23d05 100644
> --- a/lib/bb/fetch2/__init__.py
> +++ b/lib/bb/fetch2/__init__.py
> @@ -1602,7 +1602,9 @@ class FetchMethod(object):
>          try:
>              return revs[key]
>          except KeyError:
> -            revs[key] = rev = self._latest_revision(ud, d, name)
> +            rev = self._latest_revision(ud, d, name)
> +            if rev != '':
> +                revs[key] = rev
>              return rev
>  
>      def sortable_revision(self, ud, d, name):

I'm afraid I don't understand why this is a race condition? Where is the timeout
that stops one being set?

Cheers,

Richard


