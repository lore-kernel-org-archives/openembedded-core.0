Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43F09E9D80A
	for <webhook@archiver.kernel.org>; Sun,  5 Apr 2026 15:22:29 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36726.1775402545502907066
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Apr 2026 08:22:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Ky8GghOO;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-89cd8596724so39932816d6.0
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2026 08:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775402544; x=1776007344; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dLQw3p9QUdQ+rpuYkoU3FP+FUCYrvKMncYy6TVTix2w=;
        b=Ky8GghOOF1BbnbVKZXKOWLQ7qQPqa8JFv8+kSOMi4cA8uZg5iyy08n29thillxU9lm
         mBwolVXEe8AfvzEJDhpupruMG45aeTZN53jFPZVTAdVTQFRO13lSWl+9rdvgQmNhYz7b
         5FO+vATvs7UPQEtgv795Z7QczvptY4IpG5Ehq07tGei2fD1WfIpXqMTZHxcjIKe0hiYf
         F6s/wqvrWcjxMLBJ0gZXNGva9hXsTY50Ywti5J5Qli55qbx/DRc5X1Mrl+ueXsNWVzdr
         gDf570gzOAn2SOoMQuoF9+Lkg7+k650AzFmZ1RXzaNrtw83xvIVVGU885QEzzRvR+B0J
         KWtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775402544; x=1776007344;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dLQw3p9QUdQ+rpuYkoU3FP+FUCYrvKMncYy6TVTix2w=;
        b=LWGDvIy50pNGy+nmw6FZYHrJ83XhK8VRXKNbyEyK8TkudE3YQoKM2ERutszqH+pRHm
         0MXN8uo3uYEwi8y6MdM4DAW8T1Zd9/rUg8K2re/wpsuAclZyCW8KJTZSR4EEXMnb44wK
         7Mv6QLUXU4HNbnHWvrT36VqXtDFcxBpfKvA5l7UUNU7YibdAh8hrbmf8gbBND6zg7dpa
         YhSQ/3wtN4BNWFb5v/tSgs3VWq9d2iXRisD0nSe+LLHeqArFjCWiPwWqQ2ia5YNej05H
         oNkGGtG4mPHqJkH870yiXsgu68MEkTbjXgPpvOWr/+nooFlPf+Ms27ClNcAh/9G3T6fX
         LExQ==
X-Gm-Message-State: AOJu0YymKqn85VoFknlsaApb1Qt/5PT0WZ8wYUth/IZrPdfugxKFIVWP
	kAWadSTl/GMR0ZxKjzR+X05BDtyZZlwfYQ4ubOqbLSQKqU/XmzxVVjj6
X-Gm-Gg: AeBDiesPcZL0SUcQbQs+I/zcQjv14VZ4XViBA7u9Eg7i4GIkvP3tQCybQk7KqIgmN1c
	L/jd1QPo7qcy1OOb/ec1LIFSAfPdRIDq7ew09gOOK99DT8TwAA3RsH0k+MkpzXVnm4oETKdF5p5
	kaNPYwTKlL6485erLQsYrK6EUWVc8VKJfmSuQNp9V4XIPzBjfurbv/CjGFif33XVIoF+Ca1gL+A
	jlOxu6dPhU/BPQlaYRYjNP6wzr5fQmXr8oJP+VgstYfbeAK6E4OCmwoEAQTZLYkqHwQ8Nq0gZVz
	qPwYiPV7k+9vFfwS/USwamdDNN9EFFBCRP5CS879Nf7tQoelJ5AMW/Wwu1fS1yAVomjiXge3nay
	oMEsu8tz8b1ddmJ/gtEgmO8Y1lg7XPtdJ/9zOl08U3sXqDYrMknSwRVv3z9jvcLrIkwzqYW/f7R
	lkHoHB3FkdFRL4Uk/dd6TY2Fon9Bz7YrFy+9jybkXNBgB6LV5X1SxHRKoSIa+JnexMVg==
X-Received: by 2002:a05:6214:c6a:b0:89c:5289:4be6 with SMTP id 6a1803df08f44-8a7027a7dcbmr148555536d6.13.1775402544441;
        Sun, 05 Apr 2026 08:22:24 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a5933321e3sm119604906d6.7.2026.04.05.08.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 08:22:23 -0700 (PDT)
Date: Sun, 5 Apr 2026 11:22:22 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	Mark Hatle <mark.hatle@kernel.crashing.org>
Subject: Re: [OE-core] [PATCH v9 4/5] wic: move canned *wks files
Message-ID: <adJ-LhNDjPfXx95p@localhost.localdomain>
References: <20260403183541.2631883-5-twoerner@gmail.com>
 <59476a47af44f95f70e14869226d336e90c009a4.camel@linuxfoundation.org>
 <adA94CgwRzIvBl1R@localhost.localdomain>
 <c15be3d11d7381e0be75e56340dc985628ba513a.camel@linuxfoundation.org>
 <adEyY7c8FLpJPNkc@localhost.localdomain>
 <f366155401c254d33792e00d0f6b60b81ed34d8b.camel@linuxfoundation.org>
 <adF2qsDHX3SzWqzy@localhost.localdomain>
 <889c5788a6c49ddf77b22859b7d82014c75ecb98.camel@linuxfoundation.org>
 <adJPst82O73CdC9P@localhost.localdomain>
 <93d79b4fb9c40165dedc93dc988d55c26e54ab7a.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <93d79b4fb9c40165dedc93dc988d55c26e54ab7a.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2026 15:22:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234635

On Sun 2026-04-05 @ 03:16:26 PM, Richard Purdie wrote:
> On Sun, 2026-04-05 at 08:04 -0400, Trevor Woerner wrote:
> > On Sun 2026-04-05 @ 10:17:40 AM, Richard Purdie wrote:
> > > On Sat, 2026-04-04 at 16:38 -0400, Trevor Woerner wrote:
> > > > On Sat 2026-04-04 @ 07:36:05 PM, Richard Purdie wrote:
> > > > > On Sat, 2026-04-04 at 11:46 -0400, Trevor Woerner wrote:
> > > > > > On Sat 2026-04-04 @ 08:27:13 AM, Richard Purdie wrote:
> > > > > > 
> > > > > > I'm only guessing here, but it looks like someone wrote "wic create" to
> > > > > > run two different ways: with the wks file specified with or without the
> > > > > > ".wks" extension.
> > > > > > 
> > > > > > If ".wks" is not given (e.g. "wic create directdisk-gpt ...", which is
> > > > > > what occurs in the oe-selftest tests, i.e. when wic is run independently
> > > > > > without being part of a bitbake build) then wic invokes its own search
> > > > > > algorithm to try to find the wks file using BBLAYERS and script_dir. In
> > > > > > this case the wks file is specified without the ".wks" and no path
> > > > > > information is given on the cmdline. It is up to wic to find the actual
> > > > > > wks file itself.
> > > > > > 
> > > > > > If the ".wks" is included (which is what happens when wic is called as
> > > > > > part of a bitbake build and therefore the image_types_wic.bbclass is
> > > > > > used) then the class adds the ".wks" at the end, and also gives wic the
> > > > > > path to the wks file which it finds using WKS_SEARCH_PATH which is based
> > > > > > on BBPATH and COREBASE.
> > > > > > 
> > > > > > Assuming the persona of someone who wants to use this new, independent
> > > > > > wic tool, and who knows nothing about The Yocto Project or bitbake, I
> > > > > > think having wic look in "magical" places for the wks file would be hard
> > > > > > to understand and surprising. As an independent tool I think the user
> > > > > > should provide the path to the actual wks file (with the ".wks"
> > > > > > extension) and if that file can't be found as specified on the cmdline,
> > > > > > wic should simply fail with an error.
> > > > > > 
> > > > > > As part of making wic an independent tool, I think wic's code to search
> > > > > > for a wks file if the ".wks" is not provided should be removed. This
> > > > > > means that, as part of the transition, I would have to modify each "wic
> > > > > > create" test in oe-core's oe-selftests. I'm fine with that. That could
> > > > > > be done cleanly if I write a little function to find the wks file in
> > > > > > the wic.py oe-selftest itself using the same logic as is used in the
> > > > > > image_types_wic.bbclass.
> > > > > > 
> > > > > > To summarize: in my opinion, wic shouldn't have search logic. From wic's
> > > > > > point of view the wks file should be specified on the cmdline in a way
> > > > > > that wic will find the file the user wants to use (or not find it).
> > > > > > The oe-selftests should be updated to use the same search logic from
> > > > > > the image_types_wic.bbclass so that when it invokes "wic create" it is
> > > > > > providing wic with the path to a wks file that has a ".wks" extension
> > > > > > (which is how bitbake invokes wic) instead of specifying a bare wks file
> > > > > > and hoping wic will find it.
> > > > > > 
> > > > > > I'm happy to add "files/wic" as another location for
> > > > > > image_types_wic.bbclass to search for wks files.
> > > > > 
> > > > > I guess the first question is are we going to take this for wrynose or
> > > > > not? I'm not particularly happy with the files a top level wic
> > > > > directory, I think it needs to be meta/files/wic. To make that work, we
> > > > > need to tweak the search paths in wic and in image_types_wic.bbclass.
> > > > > If we can resolve that issue, we're probably good to move forward with
> > > > > merging.
> > > > > 
> > > > > I agree that the search path logic should be tidied up. Whether you can
> > > > > provide a search path to wic or whether that has to be done in metadata
> > > > > is an open question. I do see your perspective, equally, if you are
> > > > > using wic within OE, having some search knowledge may be ok. I would
> > > > > want to see it basically using files/wic from BBPATH  with everything
> > > > > else removed. There is a question of how you warn users about old
> > > > > paths. This piece is too late for the release though.
> > > > > 
> > > > > So I'd propose we add files/wic to the search path, move the files
> > > > > there and that lets us at least get some of the changes into the
> > > > > release?
> > > > 
> > > > Sounds perfect, thanks!
> > > 
> > > Since we're running out of time and I really don't want to have to
> > > think about this too much more/again, I've:
> > > 
> > > * written a patch to add files/wic as a search path in wic
> > > * written a patch to add files/wic as a search path in the class
> > > * dropped wic and the canned-wks paths in wic
> > > * dropped wic and the canned-wks paths in the class
> > > * converted wic to use BBPATH instead of BBLAYERS
> > > * added a sanity test to detect the old paths and error
> > > * pushed a contrib/rpurdie branch into the wic repo with the patches
> > > 
> > > This is going to mean people have to update layers to use "files/wic"
> > > but we can clearly tell people they need to do it. If we went with
> > > either of the other locations and changed BBLAYERS -> BBPATH, there
> > > could be corner cases we miss in the detection.
> > > 
> > > Autobuilder testing shows this will break a few layers but it is a
> > > clear error which people can easily fix.
> > > 
> > > How does that look to people?
> > 
> > Sounds great to me!
> > 
> > Presumably we will move the contrib/rpurdie branch to master in
> > git.yoctoproject.org/wic and the SRC_URI of the wic recipe in oe-core
> > will need a tweak before making it official?
> 
> I pushed onto a contrib branch so we can make a decision on this.
> Assuming we go ahead, we'd merge the patches to master, the update the
> recipe accordingly.

I've looked at your patches in oe-core master-next as well as in the wic
repository contrib/rpurdie and they all look fine to me. This is a nice
update for wic.

> Cheers,
> 
> Richard

