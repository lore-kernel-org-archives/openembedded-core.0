Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.6909.1600802397696826757
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2020 12:19:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Q7skf+jL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id t10so18336654wrv.1
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2020 12:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=sNiEsyTBtdyH/5YRc4kMMPLisTj0q4JPrTq25Bt5Buk=;
        b=Q7skf+jLvGkGScHh0RF8fPLE8/S4MlBRuEoNwgRAmewICBUVbFVXSOGMW8bUnLFeEZ
         Q4d4REV2RBxoNBmyaaeEhNm7gzM0MHY3n4rBiE6wxoIvPwB0G0FXh4/qp+s2UMRBP0c9
         fhpL1IDI1ywP8hcJRKkzOEy2R+4Eo3LMCqzt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=sNiEsyTBtdyH/5YRc4kMMPLisTj0q4JPrTq25Bt5Buk=;
        b=cF/NVkb5E05Ene0mpv8ZuKR9eYKhuVa3kL0HaS3yV3jRnRbokqrevoK7AWbht8tElJ
         OdOX/iEu9gfclITVIi7QWHVgcBedGHrKm6BG7d9gtv8mN/WvbwoyVkv6Rm779Fy+mPHo
         JvjD9EYOnUy5ODXyoH/n68EU3l9rGQUoI+N4Bu9JDeZ742TSX9oXFrRs3YIdcREnzgsQ
         v/2ijy+FhLq/bTXEeLU/d8BuEJEhgJLyttBz9lQIzPDbwQ9rX7ZeMQtZr+e5dOjKOJDC
         EtGW55VMkV/nJeVim/9de3HJB623gm2xVyAxN5B/r5Xt48VIZeDlXWZv1g9ljG9LVEQq
         i8dw==
X-Gm-Message-State: AOAM533UaY4t9OL3Q+7Dr4oSdW5ttpI0uLyfRingRYISwy4QCgNxGaPP
	o5uUxsw85KiJamSnvQg7mpueoQ==
X-Google-Smtp-Source: ABdhPJxb5sG6F+5xY5rY83aHD5QehRACguXnIzivKS6Kwvwab+mz5z3yVkF8tXTrLUb9h44bWLxEjw==
X-Received: by 2002:a05:6000:11c5:: with SMTP id i5mr7154185wrx.18.1600802395861;
        Tue, 22 Sep 2020 12:19:55 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.4.9.1.b.0.3.3.1.2.9.4.4.4.0.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.4.9.1.b.0.3.3.1.2.9.4.4.4.0.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:b044:4921:330b:194d])
        by smtp.gmail.com with ESMTPSA id a13sm5249715wme.26.2020.09.22.12.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 12:19:55 -0700 (PDT)
Message-ID: <8733aa86bf930c5e55e9c29de8d00481fcd96726.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] pseudo: Remove mismatched inodes from the db
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Seebs <seebs@seebs.net>, openembedded-core@lists.openembedded.org
Date: Tue, 22 Sep 2020 20:19:54 +0100
In-Reply-To: <20200922125231.01ec8555@seebsdell>
References: <20200922131825.2496981-1-richard.purdie@linuxfoundation.org>
	 <20200922110610.29c2c97d@seebsdell>
	 <849dc8348735a3682a6de4be9f76138a73567dc8.camel@linuxfoundation.org>
	 <20200922125231.01ec8555@seebsdell>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-09-22 at 12:52 -0500, Seebs wrote:
> On Tue, 22 Sep 2020 18:22:18 +0100
> "Richard Purdie" <richard.purdie@linuxfoundation.org> wrote:
> 
> > The "fun" here is that "make install" is rewriting Makefiles within
> > the source code tree. The install step runs under pseudo, earlier
> > ones do not.
> > If we rerun earlier non-pseudo steps, the Makefiles get reset to
> > their
> > original state, then "make install" modifies them again.
> 
> ugh.
> 
> Okay, so. A vague thought about how to perhaps approach this: A
> post-install step, which basically does:
> 	pseudo cp Makefile Makefile.pseudo
> 	pseudo rm Makefile
> 	[not-pseudo] cp Makefile.pseudo Makefile
> 	pseudo rm Makefile.pseudo
>
> So that, at the end of the post-install, the files pseudo doesn't
> want
> to know about are forgotten. Possibly there ought to be a "forget
> about
> this directory" option/command.

We're not going to know the exact files unfortunately so it would
likely need to be an "all paths starting with XXX, YYY" type command.

A quick scan of my TMPDIR shows 17,000 of these path mismatches and I'm
not sure there is a single path in there we care about, it does mean a
lot of permissions are being mangled though :(

Cheers,

Richard


