Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.12041.1632146082887844513
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Sep 2021 06:54:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cJZxTeNG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id x6so29913335wrv.13
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Sep 2021 06:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=gl9t883iwlxk2jk5EcTv+u2AB09kXNqYAX5rezpfvBE=;
        b=cJZxTeNGT4FsM8p2FVOIdOBRclEXI4vI1gd2WiutMQu+Q7VCETsfOZ0FrPOI3nsYzy
         2NjhEDhSAh0aFq/N/Smfdyl/TF4hE9Uo7/BjnWdklsBYRR42ZIxON2mmmnx3Qff+NqlJ
         Ak0W2A6lP8BBMlMFCAEhE0V0uxzD7PrFEiSuM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=gl9t883iwlxk2jk5EcTv+u2AB09kXNqYAX5rezpfvBE=;
        b=jUIl9LevE0oWg2XOggRwcZCe4nkf8TJhd2lgSR0Sl1y3QXAVYGdgK2KBLtyyR4+a7H
         IdchyqjSt7WdGR9Slji1WqzjT7leD2PpI+0W2kG7fRdwLwc5P6K19upZd5ZvrXg99a2i
         0BbYeGRZEUk1qVp40S94Dwq9vqu0UdVpmK7GhRhu2ixxqVuoaNIXhNYuXokGWn6/eHLf
         nG2ZtdfetfzYbmMhEoK7dW3WZlsvWc1IC3LS6W5oHh/GsR29IWTmAKtxXSgXnodYHac6
         vR+Kik/rrrxMNgvrgeHtAnvYR0ZwLExgdFT1fjISLmCCQtTAC2HbalGysHDlfg5ZUOqz
         fURg==
X-Gm-Message-State: AOAM530rIEGiny81bpGiyjCYrWg/iTORAr612j8qFX2y/wobSSDWURPe
	Jn/mZ1vE5qIo81t22Kx6phEUkA==
X-Google-Smtp-Source: ABdhPJwBBqSC8BWlmLo0b3LrBOlgHH4IhXc3N+DxLwFiW6M388N4prFQq4XgUO6SqJSfV7Liti5y2A==
X-Received: by 2002:a1c:1fd3:: with SMTP id f202mr29473118wmf.44.1632146081375;
        Mon, 20 Sep 2021 06:54:41 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:7173:466e:b128:3e8b? ([2001:8b0:aba:5f3c:7173:466e:b128:3e8b])
        by smtp.gmail.com with ESMTPSA id 5sm10885975wmb.37.2021.09.20.06.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 06:54:41 -0700 (PDT)
Message-ID: <5aa952a94df465a15b06479f0c95f9dfe7474e89.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH] package_ipk/deb/rpm: Drop recursive do_build task dependencies
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Sep 2021 14:54:38 +0100
In-Reply-To: <CAJdd5GZAEFJZmLjRFadjF5s2zu_b-k3dftwaNanUAA-GvN9Bnw@mail.gmail.com>
References: <20210919105735.1543088-1-richard.purdie@linuxfoundation.org>
	 <CAJdd5GZAEFJZmLjRFadjF5s2zu_b-k3dftwaNanUAA-GvN9Bnw@mail.gmail.com>
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2021-09-20 at 08:27 -0500, Joshua Watt wrote:
> On Sun, Sep 19, 2021 at 5:57 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > 
> > This is a controversial change which removes the recursive dependencies
> > from the do_build target of packaging tasks of recipes.
> > 
> > Currently this means when you "bitbake <image>" or "bitbake <recipe>",
> > the packaging tasks run for all packaging backends enabled for all recipes
> > in the dependency chain. The same therefore then applies to images.
> > 
> > We don't actually need that, it is a convinience thing. Removing it
> > massively simplifies the task graph and causes much fewer tasks to execute
> > in many common scenarios. It also means less sstate is fetched for
> > example when building an image.
> 
> Faster builds in the common cases seems like a great idea!
> 
> If someone really needs the old behavior, is there a mechanism to do
> the equivalent to what it was doing?

In this context, "bitbake XXX --runall build" would be equivalent to the current
"bitbake XXX".

Cheers,

Richard

