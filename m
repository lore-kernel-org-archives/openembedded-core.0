Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.8357.1602534352971510507
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2020 13:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=M7o8CP91;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id i1so14641123wro.1
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2020 13:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=5jKk49EBaKIZkLkk5A0pnBwBzDNGG8o/UshqhZOBkjw=;
        b=M7o8CP91Xed9WviP8Z01hrpJEKnCKPJSephoHYFHmz88GzdawZYYwPzdi5AOGi3E2c
         Bn2GsRjToE+KAW0S8M1f6NS9pucBgY6aR7McUdtaUGVzZEvzaoKfZAoErG9gbCPxmq8I
         v/ODEj9brgj+gOuhX8p4i2OI+nDHG+gFcapM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=5jKk49EBaKIZkLkk5A0pnBwBzDNGG8o/UshqhZOBkjw=;
        b=J1bnAe9AkqfAHFv8v/UEYqZEJoRuu8C0lBiEUFkTRybtGbga3rGjhcSBQ4euU675SK
         OINA5KNkkxIky+/lnQXEJ2HX39p2D096QmVaHKsblcBb631NNLtsWvohzLgzg0Nd0VlC
         ivb4BTBcnBcj5nuzC/NKD3Ls7UvcpCWKXGc/o7q89PGHqZv7jA+h8V8f7qdkasxLgCUw
         oV2IP0g7I/J0m3oxmxZ6Qzafp8L98vKr6ltUjgAQrXk7hmkvGkwDrpdY6GrGNlJMqJrO
         urmuhZ0rxKxWYWm2gwMVz3xdMKTDrPOooy4KsiOQgfgZ0xZeLp7OVpqoZUWp9liI7fTN
         MjbA==
X-Gm-Message-State: AOAM5307k5Ms16CSBWpI9iHA7BmHEJeS97Mpm60nnRlB+6ms3Su+ieRK
	mGePxFkSZRvDJi/B+vltaDNVBg==
X-Google-Smtp-Source: ABdhPJyksy9dchs8DQfyxvGvoyJ/gHXjjQGnAQFOJuzNPHWvkIgnX7dauRwaWoSzJHxH8XxYWpcmjg==
X-Received: by 2002:a5d:688c:: with SMTP id h12mr9046301wru.92.1602534351297;
        Mon, 12 Oct 2020 13:25:51 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 0.6.6.4.7.a.b.4.4.1.e.0.e.3.c.2.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (0.6.6.4.7.a.b.4.4.1.e.0.e.3.c.2.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:2c3e:e14:4ba7:4660])
        by smtp.gmail.com with ESMTPSA id x65sm25877843wmg.1.2020.10.12.13.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 13:25:50 -0700 (PDT)
Message-ID: <be66186b114ecec82608eb185297e385de1bb4a3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] pseudo: Fix statx function usage
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Seebs <seebs@seebs.net>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 12 Oct 2020 21:25:47 +0100
In-Reply-To: <20201012140849.69cf09fc@seebsdell>
References: <20201007162018.3187947-1-richard.purdie@linuxfoundation.org>
	 <20201007162018.3187947-2-richard.purdie@linuxfoundation.org>
	 <20201012140849.69cf09fc@seebsdell>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-10-12 at 14:08 -0500, Seebs wrote:
> On Wed,  7 Oct 2020 17:20:18 +0100
> "Richard Purdie" <richard.purdie@linuxfoundation.org> wrote:
> 
> > +There is magic in the posts where specific variable names have
> > specific +magic. For that magic to work, "path" needs to be used
> > not
> > "pathname" as +is currently there. Fix this, which fixes path
> > issues
> > on systems using +statx (Ubuntu 20.04 in particular).
> 
> So, usually if "pathname" is used, it's intentional to suppress the
> special magic behavior.

In this case I added the statx wrapper and didn't realise there was
magic related to the name "path", so its a bug I introduced. This patch
fixes my mistake. I think these are only on the oe-core branch, not
master.

>  Usually, but not always. In this case, the man
> page does use "pathname" and sometimes that means it's just a cut and
> paste error.

Its my own copy and paste bug :)

> My man page also says there's no glibc wrapper for statx, making me
> slightly surprised that a wrapper for it is needed/relevant.

Its definitely being used by Ubuntu 20.04 systems as we're findining
bugs related to it!

Thanks for the review!

Cheers,

Richard

