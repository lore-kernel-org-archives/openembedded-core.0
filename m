Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web10.3883.1601025732633782364
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2020 02:22:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VOHR0ze8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id q9so2312148wmj.2
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2020 02:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=trNzcRV66pcZg+Pd1NKlYpo0YKOaDiGdMfGi8bA0c2g=;
        b=VOHR0ze8b6JTJt0S56LxdhWOsPFOyjesmaAqkg0Dc3hW46ZpCtyzKykaIECB3iNZqA
         yAKbP2VEOKET/VUbxxDSiN8j9kLS2alRcEqDKBdzy0qj4jUNIbpNHv9ayicdjZg+N12M
         6k+3P42CqpGk7hi07UcBeClmrpTtYtkiWt0U8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=trNzcRV66pcZg+Pd1NKlYpo0YKOaDiGdMfGi8bA0c2g=;
        b=GF/sunqmyohc+ars7vMYuu+aZooI01SU7BlFgjubo8TpNZoOkEX1RPZrQWo5PrjWFx
         uItxUjWjdX8w4Cg08VN2hQKTkBIlef5CBz1SdoeJNu4p0r2wbBxXEgxgVeHmNGH6od2k
         mxDLXMiVZ36gVGuQyPMRk8+lTBpABhTghKsxbzpt9vM9rzsr+/1bcqXqT+pepHlXl0Yc
         w/cmkds60dmGsWKk0xTozmx+GmQdMuvF6cqKr1myauC9fLQryxB9WcK628I96/sfErMS
         rgEeXSj6axrUt47LSke+R1W6HHwDGel3W/k2t0r1J2SmAs4TPwFUwS3x7upTQ642mjOo
         gAzA==
X-Gm-Message-State: AOAM532HVVMnBUR/j+qT/VmP44rbwE6mnGrdAX59rToMfiFIzSwOeY7S
	fjgftcQ+xLzPfgjlVw4yDdPsLg==
X-Google-Smtp-Source: ABdhPJy3ZIP40qF39aO0M/N0Gnq/d5w6m2z6Yc82/np7+/g3iLhU1q0XYGoWMeLzcDtO/kuSBR/fbw==
X-Received: by 2002:a1c:f008:: with SMTP id a8mr2166029wmb.155.1601025730869;
        Fri, 25 Sep 2020 02:22:10 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 4.2.7.5.8.3.b.f.6.2.f.6.c.b.0.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (4.2.7.5.8.3.b.f.6.2.f.6.c.b.0.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:90bc:6f26:fb38:5724])
        by smtp.gmail.com with ESMTPSA id 70sm2240815wmb.41.2020.09.25.02.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2020 02:22:10 -0700 (PDT)
Message-ID: <4a415c1606881f5f2786a51405c46b978443ba73.camel@linuxfoundation.org>
Subject: Re: [RFC PATCH 0/4] fix externalsrc task dependency issues
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>, 
	openembedded-core@lists.openembedded.org
Cc: parkch98@gmail.com, Steve Sakoman <steve@sakoman.com>
Date: Fri, 25 Sep 2020 10:22:07 +0100
In-Reply-To: <bf1062de-a95d-591c-151d-b25e55d7a3cf@prevas.dk>
References: <20200922151518.1615-1-rasmus.villemoes@prevas.dk>
	 <bf1062de-a95d-591c-151d-b25e55d7a3cf@prevas.dk>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-09-25 at 11:06 +0200, Rasmus Villemoes wrote:
> On 22/09/2020 17.15, Rasmus Villemoes wrote:
> > This is all entirely untested, hence RFC. But if this doesn't work
> > for
> > some reason, I think externalsrc.bbclass should grow some comments
> > as
> > to why deltask is used instead of the noexec flag.
> > 
> > Patch 4 is a revert of patch 1, but I did it that way to facilitate
> > backporting, in case patch 2 is too dangerous for backporting. If
> > that
> > is considered safe enough, it should be enough to apply patch 2 to
> > avoid the churn. In any case, patch 3 is just a little
> > simplification
> > made possible by patch 2.
> > 
> > 
> 
> Ping. Chanho, can you tell if this would fix the externalsrc problem?
> Richard, any comments on the deltask vs noexec usage?

You started this patchset with "This is all entirely untested" which
I'm afraid made me rather nervous. Much as I'd love to, I don't have
time to debug every patch series people send.

I'm fairly sure the deltask vs. noexec was deliberate and Paul and I
went around in circles on this several times.

I have some memory that at least part of the problem was usability. If
someone can "see" the task in listtasks and trys to run it but nothing
happens, its very confusing for the user. By deleting it, we make it
very clear its not there.

I think there were technical issues as well, such as recipes which
inject other tasks between unpack and patch. We needed to stop those
other tasks running too which deltasks does effectively, noexec would
not.

Cheers,

Richard

