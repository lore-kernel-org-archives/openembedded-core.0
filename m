Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.11137.1598444494810512733
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2020 05:21:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ELJILifS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id y3so1593628wrl.4
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2020 05:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=eyMHx8OYdiH+NGb4ZZ0WOakteqdLQDKVMTzDwD6jUg4=;
        b=ELJILifSxlJHYVRAYUztRbw0uVSKa+3bnze1CWwQiHNSzxH2XKpnBXD3ociyp+Oe3W
         Mcw5aa6Lzaw97qNfPpQXYIGNErImIz97MvGo0eCAfWx59Uomys2+RbmIjxP1gbFxKsUW
         MiIT4zXZkyWXIn28hjeQSFKEc0Mj66psgAvQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=eyMHx8OYdiH+NGb4ZZ0WOakteqdLQDKVMTzDwD6jUg4=;
        b=hwb+b1ndGK2K+ytlIZWQaDpgH5y5ZVGqkXvawguP8L4FcmgDkcoG9u2fO3Qckd38en
         SsngAytWOj0/gddT8javmfAQdFH7oDvWv+oGMJ9MlOgZtlUwb/hpVt3LUJob00lS6Lr7
         s2SmjJIUDQdefJm4mOZMNzspkhgvduspcPSTCJwmSLVxNYTCB8bnvwwd5zCtTpO/Vwwn
         hg/mKvwoP+HqILXUxNeYDMhPlk+ool6M0UAO/vEAd9MOVMA8mzKu0DkhHgc+O1n7Mqze
         iALeQgbUTtLHzL6aFB2S4EvhIRj2MuiZcG00VT4dvLir+vFs+lxyI88Ko2ZmPI2qqc8c
         kFYw==
X-Gm-Message-State: AOAM532OMkwUc64sQBuPi8txFcBKcKqscfbiZev+2cHoRNFJ5Eml/w+r
	eH5+nNjrTTZ57Gr7jZQ2HiulEQ==
X-Google-Smtp-Source: ABdhPJyJtShfZCrXHzObmH28OAr/t1nMRmczkDMmwg2ityBrD+Fc8RSgP3fU7B63G0/ortme7OEV9w==
X-Received: by 2002:adf:db52:: with SMTP id f18mr291201wrj.397.1598444493053;
        Wed, 26 Aug 2020 05:21:33 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.9.b.8.7.0.d.0.8.3.5.0.7.0.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.9.b.8.7.0.d.0.8.3.5.0.7.0.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c407:538:d07:8b9d])
        by smtp.gmail.com with ESMTPSA id h5sm5816067wrt.31.2020.08.26.05.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2020 05:21:31 -0700 (PDT)
Message-ID: <3ab390081775d2605afd8fbd759c62bdb331c582.camel@linuxfoundation.org>
Subject: Re: [OE-core] [master][PATCH v2 0/6] Allow PR Service and hash equiv togther
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@kernel.crashing.org>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 26 Aug 2020 13:21:30 +0100
In-Reply-To: <c9d88407-a2ee-38f8-17e2-6a79f627ca57@kernel.crashing.org>
References: <20200826112733.52492-1-mark.hatle@kernel.crashing.org>
	 <f5e8f15912143ac89e3361f63cb504a290d427c6.camel@linuxfoundation.org>
	 <c9d88407-a2ee-38f8-17e2-6a79f627ca57@kernel.crashing.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-08-26 at 07:14 -0500, Mark Hatle wrote:
> This was actually the first thing I tried, and it was a complete
> failure.  The problem is that all of the variables that we play with
> (not just PKGV/PKGR, as this impacts the RRECOMMENDS, RDEPENDS,
> etc..) all need this replacement done.
> 
> Then they reference PKGR, which references EXTENDPRAUTO, which is a
> python variable which references PRAUTO which is what we actually
> care about.
> 
> So really what we should be doing is putting in 'PRAUTO' (@PRAUTO@)
> as the replacement value and then replacing that later -- but we
> can't just do that since if it's blank then EXTENDPRAUTO works
> differently then if it's set.
> 
> So we would need to wrap @EXTENDPRAUTO@, which "works".. but then we
> have to be able to expand it on the reading of the data as
> well.  Which means modifications of every routine that reads the
> variables from the pkgdata store.  But the various places where the
> variables are read in don't have access to the list of variables to
> expand -- so we might have to assume @...@ is used, which may work
> but I'm still worried about how complicated it gets.

I take the point about needing to use EXTENDPRAUTO, that makes sense.

So if in do_package we set EXTENDPRAUTO = "@EXTENDPRAUTO@", then in
do_packagedata we set PRAUTO then do a sed @EXTENDPRAUTO@ to
d.getVar("EXTENDPRAUTO"), we should then have the right data from that
point on?

I know its not a clean abstraction to two variables like you have now
but I think if we document what is happening, that doesn't matter. Its
not as if we're going to extend this to other variables regularly.

> With the current usage, the only place I've seen issues
> (buildhistory) is where
> they read the pkgdata directly and it never ends up in a
> datastore.  Assuming it
> goes into a datastore then it's automatically expanded.  (Other then
> buildhistory, I think all of the reader routines are located in
> lib/oe/packagedata.py -- so we should be able to scan for this stuff
> in the
> general case.)
> 
> (I also don't want to move EXTENDPRAUTO into say do_package, because
> I believe
> the implementation of this is going to need to change in the future
> to support
> the use-case where a standard distribution is produced, a user
> consumes it --
> modifies a package and provides a variant of a few patches and just
> wants to
> extend the EXTENDPRAUTO with additional release information.  I.e.
> initial
> version of EXTENDPRAUTO is .1, where the user's customization makes
> it .1.1...)

Agreed, but I think we can preserve it as above.

> > I'm also wondering if we should just inject the @XXXX@ change
> > (instead
> > of the delVar) into d directly at the start of do_package itself,
> > where
> > the existing     bb.build.exec_func("package_get_auto_pr", d) call
> > is?
> > 
> > That would then remove all the confusing localdata changes?
> 
> Part of the reason I moved the change to a function as I thought it
> made it easier to read and understand the why.

Yes, having the function helps but it could be better again if we don't
need multiple datastores...

Cheers,

Richard

