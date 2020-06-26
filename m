Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web10.122.1593192823526395639
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 10:33:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OuJc5AB3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id k6so10274237wrn.3
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2020 10:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=EqQYHmDucnve8yYiiZQdoQQA9cV5q6tkQlvQyTJiyLo=;
        b=OuJc5AB3hdEkoK6v8vWlgmXxZOkToGd/0P96D1V3o7dm572ii3VHNy+3j4PKM/nziv
         FYiBGgmaV7dCPHjubv68+QzU459cmkNnYQuFAC6ae/sFN4vVuf8XILve+sTgswmHa4v2
         W9+NjZAKp+NWpkwCoTRcZmTdxH/lUkRHTBz6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=EqQYHmDucnve8yYiiZQdoQQA9cV5q6tkQlvQyTJiyLo=;
        b=Ncoh48HxrwRjHAEkGTQjCXVe/23DNxN/zWdYh5aNPFkDGgBx40GZg/NXslV8Cnw0Iq
         SMA+ozz5JyAiEXN8AcCgzCnnjqMeLYU20REaRZL42aqdzEdQlGl6zKfNfXAizZXrY7o3
         LXBtCNJK2ETtLI4vRIVnJ1bvQyrMqescE+HzZe3ndG65booeSoDpehKaqg+84i92pRS8
         gz7yS5CB9Ew5YOoGhTmrNcviUNdFpsbZzABXSEzZQZ0crTmM5C98AjVFoIVGtvP6VEyc
         Gnja9ktaU6vrbGWgnW0xbgOfvqNFzRB+CADXpohTvr0WY/JhOD+aCAiSdWCHz6RS6HPT
         gnXg==
X-Gm-Message-State: AOAM5303T/ZTAj4Gpn9rTtLi1qv7jOENZXzck1YEJEq8jEHwzck7y8nU
	XQ8lIz+1QbITfdV+YiWoISRCnw==
X-Google-Smtp-Source: ABdhPJzNpe172p0+KXEudH2dVpBNb4Kc+fBRl/nggirSMTQD+QWHRpeU8afDMZJVDkXb7KVOMLIEIg==
X-Received: by 2002:a5d:470b:: with SMTP id y11mr5028852wrq.101.1593192821838;
        Fri, 26 Jun 2020 10:33:41 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id d201sm17862548wmd.34.2020.06.26.10.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 10:33:41 -0700 (PDT)
Message-ID: <5f8a87af6dbd4b07323459cecc1bb7c149a4082d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [pseudo][PATCH 1/2] xattr: Fixed corrupting UID&GID when running setfacl -m on a directory
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Seebs <seebs@seebs.net>, Johannes Beisswenger
	 <johannes.beisswenger@cetitec.com>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 26 Jun 2020 18:33:39 +0100
In-Reply-To: <20200626103607.114d5711@seebsdell>
References: <20200626094031.9975-1-johannes.beisswenger@cetitec.com>
	 <20200626090553.6853a571@seebsdell>
	 <49dc076b-16fd-cd82-5793-bbf2c2fc9adf@cetitec.com>
	 <20200626103607.114d5711@seebsdell>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-06-26 at 10:36 -0500, Seebs wrote:
> On Fri, 26 Jun 2020 16:56:48 +0200
> "Johannes Beisswenger" <johannes.beisswenger@cetitec.com> wrote:
> 
> > The OP_CREATE/REPLACE/SET_XATTR operations in pseudo_op() don't
> > use 
> > msg_header.mode at all, it is only used for DB sanity checks, which
> > in turn only use the non-permission bits.
> 
> Right, the relevant part is the immediately following
> wrap_chmod/wrap_fchmod. I had forgotten about this chunk of code.
> 
> And... that leads us to the realization of how it is possible that
> this
> ever didn't bite us before.
> 
> The historical reason this exists is that at some point, GNU tar
> decided that it was a crime against nature, humanity, and God to use
> a
> stable existing API when a new API existed which could do the same
> thing at hundreds of times the computational cost, and abandoned all
> use of chmod() in circumstances when extended attributes are
> available.
> But in practice, this only happens for regular filesystem modes that
> do not require an ACL, and allow us to replace "here's your 12 bits
> of values" with "here's a small binary blob you can decode
> expensively".
> 
> But usually that's all that's present, so we just hit the path where
> we call chmod/fchmod and return early.
> 
> For us to hit this, we have to have gotten a system.posix_acl_access
> message which contains access list values other than those, which of
> course never happens, because who would actually use ACLs for their
> intended purpose, instead of as a ridiculously expensive way to
> implement chmod?
> 
> And yeah, I think you're right -- this assignment is just plain
> unneeded.
> 
> (I think the Darwin port is long-dead because Apple's security stuff
> makes it a pain to work with. Basically, "can we get this working on
> Darwin" was a high priority and common request until about three days
> after I got it running, and I don't think anyone's asked about it
> since.)

I need to do something about the patches queued up for pseudo. I'm
going to put them all on an "oe-core" branch in the pseudo repository
so we at least have a common place to use them from and get the recipe
cleaned up until such times as we can get proper review/merge to
master.

That shouldn't cause any problems and lets us improve things a bit.

There is one patch I'm not going to put there as looking at it, I
suspect it needs reworking and really isn't upstreamable, I think the
rest are appropriate given OE is one of pseudo's main users and can
hence influence its development.

Hope that is ok with you seebs!

Cheers,

Richard



