Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web08.39682.1629815088084894865
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 07:24:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=b61kqDGp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id e5so15039658wrp.8
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Aug 2021 07:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=AZiLpfwcWj+RqQUwx6sx+wINns7mK6XWkOtUkYNuMx4=;
        b=b61kqDGpHvoqeVgjgNCW9fH+VTziSETa1kZDcD4kYg5KAen8h9ZeH/4poGMeG8AFZo
         UetzZVowJ6gkNNHnwOsD9x04vzdGGqeUUJU2/C9jcH1Or/zbN4MgTL87RsnRCleMqMEq
         bLYudy7RNPzP6i6On2AzqfAlpkIKq26QKl5gw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=AZiLpfwcWj+RqQUwx6sx+wINns7mK6XWkOtUkYNuMx4=;
        b=La/2FnCVhU1rWJlujoXFWTqcTeLhepz7/WOVZwoz9rUSlLd9U+wYwYk9LdRYq3g9P9
         QSnkMSJyRb5BYcR2qb2W18e7U3wuX1c7q4cjq7EXE9+YrzGe+mQ9j6gDIHTqDfWEZRkX
         8PtLqBlTk7ln0wRAnkK7d6PBSNW5nkFDe76m68dORIFiAX6VnA2urUO9ASu/JTbAgXDE
         LwOtBmUmSYOiS1TWsfx3v2cZBixcTs6fd33I63fEfG66Oc67HdTl/u1PU4MKsPb8LuLv
         uPvgZWQmEr/e845bf88HRMFzWFWTVq1aTjxmwFBeDMZUblRz+IQkRVBwJeSwFCPZmcWH
         COZw==
X-Gm-Message-State: AOAM530JKBdmDDKZIFDZaOqpdILIzDZsfNWe1JGYDqEfAnUjMwT4a3u9
	24Kwnd/YJxMexVB3wb/sQbcytQ==
X-Google-Smtp-Source: ABdhPJyOSgZ9YVhdfskeNUobvsEOG13cOBMwKkz9nGZZvu/LYpf4wkb2v5QOxyOqHvAZTU3wXN/T6Q==
X-Received: by 2002:a5d:68d2:: with SMTP id p18mr9793046wrw.43.1629815086707;
        Tue, 24 Aug 2021 07:24:46 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:d23b:eedd:82d9:e12c? ([2001:8b0:aba:5f3c:d23b:eedd:82d9:e12c])
        by smtp.gmail.com with ESMTPSA id z2sm2418976wma.45.2021.08.24.07.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 07:24:46 -0700 (PDT)
Message-ID: <d248b212e6724aac56ae6b1638e438f25d350486.camel@linuxfoundation.org>
Subject: Re: [OE-core] [dunfell][PATCH 1/2] bitbake: fetch2: fix handling of `\` in file:// SRC_URI
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, Andrei Gherzan <andrei@gherzan.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>, Leif Middelschulte
	 <leif.middelschulte@klsmartin.com>
Date: Tue, 24 Aug 2021 15:24:45 +0100
In-Reply-To: <CAOSpxdYA6FchYLNRASehUkPcQkdHkjRJyjE6VaX0z--y6m3BWg@mail.gmail.com>
References: <20210823135250.767173-1-andrei@gherzan.com>
	 <CAOSpxdYA6FchYLNRASehUkPcQkdHkjRJyjE6VaX0z--y6m3BWg@mail.gmail.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2021-08-24 at 04:20 -1000, Steve Sakoman wrote:
> On Mon, Aug 23, 2021 at 3:53 AM Andrei Gherzan <andrei@gherzan.com> wrote:
> > 
> > From: Leif Middelschulte <leif.middelschulte@klsmartin.com>
> > 
> > Using backslashes in file:// URIs was broken.
> > Either the resolver would fail or the subsequent `cp` command.
> > Try to avoid this by putting the filenames into quotes.
> > 
> > Fixes https://bugzilla.yoctoproject.org/show_bug.cgi?id=8161
> > 
> > (Bitbake rev: aa857fa2e9cf3b0e43a9049b04ec4b0b3c779b11)
> 
> Patches for bitbake should be sent to: bitbake-devel@lists.openembedded.org
> 
> I tried applying this patch, but found that it caused errors on the autobuilder:
> 
> https://errors.yoctoproject.org/Errors/Build/129189/
> 

We dropped wildcard support in master but that is still present in dunfell. That
means we can't quote things as we are relying on expansion of the wildcards for
some SRC_URIs. This could be difficult to fix with the compatibility constraints
of an older release funfortunately :/.

Cheers,

Richard

