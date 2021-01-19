Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web08.20316.1611098617672373215
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 15:23:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fbnvFGBo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id i63so1264584wma.4
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Jan 2021 15:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=8d8O7dqQ+nKTNwdJiV6Y1htm/FaLXNRqwrNoFl0JxVU=;
        b=fbnvFGBoGxTW6Vf9DWv5ilOp3Le+/Al0ZYJtpGywGwdYDG0xX6qi6L8ywkpdfiYHhX
         LQxyPxYZKaPlgbLDrdQ2oJyz9NqHHBTchNd/Av2IMQIuA9iSCPJ5C/OzVg7baMIIRu4G
         VxPS80XsO7sg3cTOBmIhvY6WBjJ1ipXz8mIjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=8d8O7dqQ+nKTNwdJiV6Y1htm/FaLXNRqwrNoFl0JxVU=;
        b=SKOyRrYQLRVMSFpAkhykIb0BYCAWIpOG8wip74laa/VlKaTDm2mloLNzjvqmhS4GUw
         3LbNda2L99m4VL/l1zehAHMku4MJI2iqOaTVi9BvT11aiFfWg48SQLh7rgbWRbF4KdAG
         tcZ7YHxwz/27tnXx9qk0aFQYopMOyoXMeXZNGfrmwXY0hN/P0+tJz/hr6iok55KJLIzM
         UtTI8lM1JJraJf1+qjU6UovyrRk6F+8XIKA+ZOQES+KX5uHbYr0lZkckgg6bHCEX8XRH
         4Fd3q6jY1ijKr7m9Htxxm5zQnFaJGLiUcuiXggaxUdtyR0PPlJelQSOYNWMJqZgzpZVU
         sJJg==
X-Gm-Message-State: AOAM531zSJtGnJcl4yhW82Vd4Hvflc+QR/7DjWU/uUOtQJ9Ywg4RWUlC
	uwchMhUllCMzher/7s4FblFa6Q==
X-Google-Smtp-Source: ABdhPJxc9huv9lD1xv6woFm37ilpi2IOm2pYIZB6c6HgWxYSx12m4cAEEqnEbjOtW8QSDl0La2r84w==
X-Received: by 2002:a1c:5a54:: with SMTP id o81mr1664398wmb.50.1611098616153;
        Tue, 19 Jan 2021 15:23:36 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:f7a4:851a:48d5:440b? ([2001:8b0:aba:5f3c:f7a4:851a:48d5:440b])
        by smtp.gmail.com with ESMTPSA id c6sm430933wrh.7.2021.01.19.15.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 15:23:35 -0800 (PST)
Message-ID: <45331765fb689a78bb52363d4fc8f5970693c763.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v4] util-linux: split uuid in separate recipe to allow bootstrapping
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <bluelightning@bluelightning.org>, 
	openembedded-core@lists.openembedded.org
Cc: luca.boccassi@gmail.com
Date: Tue, 19 Jan 2021 23:23:34 +0000
In-Reply-To: <2056926.Mh6RI2rZIc@linc>
References: <20201123132823.3996355-1-luca.boccassi@gmail.com>
	 <20201210184632.3448265-1-luca.boccassi@gmail.com>
	 <066f346a8d1c643650bf814cc3c18c363b820d5f.camel@linuxfoundation.org>
	 <2056926.Mh6RI2rZIc@linc>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2021-01-20 at 12:13 +1300, Paul Eggleton wrote:
> On Wednesday, 20 January 2021 09:52:41 NZDT Richard Purdie wrote:
> > I think the one remaining issue here is the need to change the DEPENDS
> > of so many other recipes, likely not just here in this patch but in
> > other layers. I think if util-linux DEPENDS on util-linux-uuid that
> > might remove the need for those changes? That should still allow you to
> > break the circular dependency problem?
> 
> I have to admit to a gap in my own knowledge of how our build system handles 
> transitive dependencies. Of course the recipe sysroot should still get 
> everything it needs in it even if the dependency is only indirectly included, 
> in the back of my mind I have the impression that there are expectations that 
> all dependencies are explicitly called out and there are subtle issues if they 
> aren't, but that could be a mistaken impression on my part.

I do wonder a little about that as well. As you say, sysroot
dependencies should handle this. Anything linking against libuuid
should also establish an package level runtime dependency through the
linkage so I think this should work.

We definitely don't explicitly list every dependency in every recipe.

If this can work, it makes the migration path for people easier so I
think its at least worth investigating/testing.

Just while I'm thinking, the PACKAGES_remove also bothers me a little.
Can we rearrange the variables so libuuid is only added in the libuuid
recipe variant?

[the idea being that since we control the metadata in oe-core, we
shouldn't need to use _remove and can restructure so we don't need to,
they're hard to undo. I know we do use it in places sadly even in core]

> > I suspect libuuid should really be maintained/built as a separate
> > software project given the dependency problems but that isn't my
> > decision, we just have to deal with it.
> 
> I agree that it would be better being separate, FWIW.
> 
> > I am also worried this is going to break AUH and mean we have to
> > manually handle this recipe but again, I suspect there is little to be
> > done and we just have to deal with it.
> 
> Could we perhaps fix the AUH to handle this properly? Do we need some kind of 
> mechanism to get it to always upgrade the two recipes together or is that only 
> part of the issue?

I don't know for sure that AUH won't handle it, I just worry about it.
If it doesn't it definitely could be something we could fix there. I
just don't know of anyone with the time to spend on what is a marginal
corner case if it doesn't work.

Cheers,

Richard

