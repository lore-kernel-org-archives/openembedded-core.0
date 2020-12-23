Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
 by mx.groups.io with SMTP id smtpd.web08.3017.1608762959451301198
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 14:35:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HJU1i0eY;
 spf=pass (domain: gmail.com, ip: 209.85.166.170, mailfrom: twoerner@gmail.com)
Received: by mail-il1-f170.google.com with SMTP id g1so492580ilk.7
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Dec 2020 14:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=pO8ZsiOmaXVEB1F5fYYni7mkXVygt6UUpgRIWTr7cn8=;
        b=HJU1i0eYzBO5v8YezAAWCjQQizkO8k1hPUe/UGLWEiaLmlLzvF2a4flQD9Ycxw0zt6
         LDDNrkp784J7x7S+UbJ+P2dX8s4EKNhlkaEXF+WDivqCf4Pi/P4m5UYxxb7lJ31BoPgz
         sA0R+sWOxdv6F+N8+Df8dpu5o/iHaatXEYvDzVum08k+36apeC0WSTTBTt7N0p1nh6wA
         mY/urszxlPRdV28r1L2WP5EnC68HbRtVe8ZLRGDQAKHx9puUaQPbpl7QEXnr2xRef0+D
         hmya1OJtRPJJzfx8zkapHGR8IE3SuZWHqvuGyBfY3wB+Y/SR+7kclKwuaptm3a7LwBOq
         Xxnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pO8ZsiOmaXVEB1F5fYYni7mkXVygt6UUpgRIWTr7cn8=;
        b=YZnrNYkZUQx/2MLwtbrm4UiQM7U4gvNirXxW2FJCoR5om6tEAqF3PneE9LtcXbQUWp
         dbJIdrF4yK8IGLgp+O9E46uaI7BrTJZJhar7FSwL7X3DbnWv4sWkiOY5qeTxgZ6sGaiY
         oZ/UUrdMZaFVC534Ls5IKhCQ1eFxBJpzA4vI2XTvJrUpZ/PqNrJRnXDPrD5tldWa2fap
         BOPBj7yOgOSSOGPvE6FZIXehJ2sixkSHCousJETZO84RCRi3oIuo63cmNnURLQoHZ1db
         EzW8/wRZWKy31e34yRPBTbr1PQG0c10wiPe3vmW/OQcB4V3GSQVOha14hTqbVQofRMgl
         FHbw==
X-Gm-Message-State: AOAM530SNYi+xN+Bt3yXZwDjfvPlpytChYSsRrXblY9LN+XDdfFdyVBo
	KMMilBudqb4XYrLTgo0F0GA=
X-Google-Smtp-Source: ABdhPJymq5m+KldPeVbrKOVTEzVkKf3XRhRxVsoQGXA/EI6SZdgnugYVoUZ/LpZfGJg2P8T3NCQ6iQ==
X-Received: by 2002:a92:ae06:: with SMTP id s6mr28466318ilh.282.1608762958900;
        Wed, 23 Dec 2020 14:35:58 -0800 (PST)
Return-Path: <twoerner@gmail.com>
Received: from localhost ([206.248.190.95])
        by smtp.gmail.com with ESMTPSA id b18sm17911668iln.46.2020.12.23.14.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Dec 2020 14:35:58 -0800 (PST)
Date: Wed, 23 Dec 2020 17:35:55 -0500
From: "Trevor Woerner" <twoerner@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [master-next][PATCH 2/3] psplash: work on first boot (sysvinit)
Message-ID: <20201223223555.GA1089@localhost>
References: <20201223170621.35727-1-twoerner@gmail.com>
 <20201223170621.35727-2-twoerner@gmail.com>
 <743d9e91ea6fb99193e315f8b20778e418109da7.camel@linuxfoundation.org>
 <20201223215005.GA9542@localhost>
 <4a7f64f4a7a6e458974fd411b68a1075ba7204a7.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <4a7f64f4a7a6e458974fd411b68a1075ba7204a7.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed 2020-12-23 @ 10:06:05 PM, Richard Purdie wrote:
> On Wed, 2020-12-23 at 16:50 -0500, Trevor Woerner wrote:
> > On Wed 2020-12-23 @ 06:00:21 PM, Richard Purdie wrote:
> > > Personally, I don't really like the idea of having a top level
> > > directory called .psplash,
> > 
> > Neither do I, which is why I also added the code to remove the
> > directory once
> > the psplash program is done running. Whenever psplash is run the
> > directory is
> > created just before it starts and removed when psplash is done.
> > 
> > > is there a reason it doesn't work in /mnt?
> > 
> > This all works fine (without any changes) on the qemuX machines, but
> > on a real device (e.g. rpi) when the image is booted for the first
> > time everything is mounted, initially, RO, when using sysvinit. At
> > the end of the first boot, and for every subsequent boot, the
> > filesystem is R/W, so everything works on
> > subsequent boots.
> 
> Right, but why can't psplash create /mnt/.psplash? Why do we need / and
> not /mnt ?

Ah okay.

Let me play with it some more. The only point of /mnt/.psplash (or /.psplash)
is to have a directory in which a tmpfs can be mounted in which the fifo is
created. [this is the current behaviour]

It all sounds rather convoluted. I'll look for something better.
