Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1990BE63FED
	for <webhook@archiver.kernel.org>; Sat,  4 Apr 2026 18:19:39 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21780.1775326775087830088
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Apr 2026 11:19:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=n2o5PJM4;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8a3342d301aso34723596d6.2
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Apr 2026 11:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775326774; x=1775931574; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vqAscvjmQggmSfC62zYE+uSh1DbNFKm1xENrnxezz1o=;
        b=n2o5PJM4AVnPX+Ll7kcmN0YibzH1Cx9uEbDkYlWcPdLR5Fj/LvGKw2MHbcYmGfD99f
         GvZULWnBviv49JnC3gED2m3MgdH4l7Eufarenj+pfG58VK9tSkrWZkTonj49QKK7y7tf
         40vCfa5OGBoj6Tlw420lUr4Hd0F5HJ2JO+dh8r4LrN0TXlr/vvhz2ou4++YG5tDLw4rH
         sDIUc89uBu4TnohvHAWSL0iYDTsc6BcDPB9y7TOXmSQAmn7UWX8WDv+zu5IGWn6CjIRv
         zyU0lCgT3IyWa3u9AJgjujLAY5KhqOGxrK2yeNl8pPGbxkglmzFi0lf4JUEW2P/B/rTc
         J1Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775326774; x=1775931574;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vqAscvjmQggmSfC62zYE+uSh1DbNFKm1xENrnxezz1o=;
        b=TTRd89tbSEGZ2FV0hx7IXwFTiwNXNeuSCwmYfwtl83PB0tKMd6KjzDAQEu7nCymjl2
         1B+FmV9ZUbXFi6mW2BsS/bFuBT2dTZd9CHcpiLsg0n7zvNPT9oda6LKiSwOxxgPB+bQo
         292J/pG0lHLvOYplDSOxvazRTJODwJaQrN5pi2Vkbr/c68R1gETWBKuvLJqleJVpOlu3
         o4NL8SKlNUB5A+TeND4RMv/tLPKtlL2Borcvg4BtR4thTxUUBEMu4nReoPGKVkz0GyB2
         sH2nG6Vz8RzNnvTKImSwBS9kum9TSbaFfREUaktnMfJLV2hl4rlsOj4HBmxlkaxkXzLb
         tdbQ==
X-Gm-Message-State: AOJu0Yz3/rP1z20SIhhcs9YGMJp7eyBEIMKQzgEAaZD2yLxKRFNdY+IR
	AoL+8TGmXAG+7kw9ihTQcBu/3hkg3pjILsXoB7fSry8z0PGb2tbyt7nM
X-Gm-Gg: AeBDiev1u1nuhY7b2MQ92GZlJ+TH4mQFTfxabqzsO1C5EAMn8RcTK7/Gy3rwGCOrsiF
	bw3pxzKZc6g7if7OFd2b2hckReio/XEMoWZCgqEF7xQjyBY1ez6kIspLU0mBq9nlr6gkwqJiwYZ
	RikDjHH6xbJ1VGtz8RuHQL4I/myTgC0GHmQgVCc2g0ZrEjoydZU04qOy86Oc0XfPKbker77IGee
	rzd1p/72koHL+XgTEa5J9fhdr9uhKuIRR3UA3nwCeipxhwnYRYCJwNWbQx18u/2ziDczVGQi9Sy
	8wm9wimMGfgIT/8rcm62hlsVQW7tDXOchnihhzbFB5A19O7ZSgWp+Ngz/gW0lZOVbsPvYfT434n
	312WSb/bQG0BgcZpzEPRMBZVD6nYSzrLz1335LyFNibYty6F5hCB1M+AH11AXaBff2rh9fhzxVI
	J7ySt5afx3hcktJWFs1klGYQWNX1ca+JOWCVX7ZYWoWcASTOys+GPnxsSc3e7JpgULKA==
X-Received: by 2002:a05:6214:5e06:b0:8a1:6529:5ac2 with SMTP id 6a1803df08f44-8a7025b51ebmr101820006d6.13.1775326773721;
        Sat, 04 Apr 2026 11:19:33 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a5974ddccdsm78855056d6.41.2026.04.04.11.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 11:19:32 -0700 (PDT)
Date: Sat, 4 Apr 2026 14:19:30 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	Mark Hatle <mark.hatle@kernel.crashing.org>
Subject: Re: [OE-core] [PATCH v9 4/5] wic: move canned *wks files
Message-ID: <adFWMmXJzzTo0CSj@localhost.localdomain>
References: <20260403183541.2631883-1-twoerner@gmail.com>
 <20260403183541.2631883-5-twoerner@gmail.com>
 <59476a47af44f95f70e14869226d336e90c009a4.camel@linuxfoundation.org>
 <adA94CgwRzIvBl1R@localhost.localdomain>
 <c15be3d11d7381e0be75e56340dc985628ba513a.camel@linuxfoundation.org>
 <adEyY7c8FLpJPNkc@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <adEyY7c8FLpJPNkc@localhost.localdomain>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Apr 2026 18:19:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234617

On Sat 2026-04-04 @ 11:46:43 AM, Trevor Woerner wrote:
> On Sat 2026-04-04 @ 08:27:13 AM, Richard Purdie wrote:
> > On Fri, 2026-04-03 at 18:23 -0400, Trevor Woerner wrote:
> > > On Fri 2026-04-03 @ 10:13:00 PM, Richard Purdie wrote:
> > > > On Fri, 2026-04-03 at 14:35 -0400, Trevor Woerner via lists.openembedded.org wrote:
> > > > > When "wic create ..." is invoked with a bare *wks name (i.e. without the
> > > > > `.wks` extension), wic calls engine.py:find_canned_images() to find the
> > > > > fully qualified *wks file. This function searches every directory formed by:
> > > > >     - permutating all BBLAYERS with `/wic`
> > > > >     - permutating all BBLAYERS with `/scripts/lib/wic/canned-wks`
> > > > >     - checking `<scripts_path>/lib/wic/canned-wks`
> > > > > Where `<scripts_path>` is the directory containing the wic program.
> > > > 
> > > > It doesn't. I just looked at the code and it uses BBPATH. That can be
> > > > similar to BBLAYERS but it is different and the commit messages really
> > > > should refer to BBPATH.
> > > 
> > > In the oe-selftest wic tests, most of the "wic create ..." commands
> > > are called with bare *wks files (i.e. *wks files without the `.wks`
> > > extension). When this happens, as "wic create..." is called, it starts
> > > by running the code found here:
> > > 
> > > 	https://git.openembedded.org/openembedded-core/tree/scripts/wic#n206
> > > 
> > > which calls:
> > > 
> > > 	https://git.openembedded.org/openembedded-core/tree/scripts/lib/wic/engine.py#n46
> > > 
> > > which follows the algorithm that I have described above.
> > > 
> > > So for the oe-selftests to pass I wanted to move them.
> > 
> > You are right, it is using BBLAYERS. This is very confusing since the
> > wks files are using BBPATH, which is similar but subtly different. 
> > 
> > Is there any reason it can't use BBPATH to match?
> > 
> > I agree the files need to move but I'd like them to end up in
> > meta/files/wic, not meta/wic. Whilst it complicates the migration a
> > little, I think it would be best to move them once and get them into
> > the right place.
> > 
> > The questions are then firstly, how to do that simply, then secondly,
> > how to clean up the rest of this (and when to do that).
> > 
> > Adding files/wic into the search path is trivial. Deprecating the
> > existing search paths with appropriate warnings is a bit trickier and
> > there is the question of when we should do that, before or after the
> > current release. "after" would seem more obvious, but it will mean two
> > different behaviours before and after release and with a standalone
> > tool, this does become harder.
> 
> I'm only guessing here, but it looks like someone wrote "wic create" to
> run two different ways: with the wks file specified with or without the
> ".wks" extension.
> 
> If ".wks" is not given (e.g. "wic create directdisk-gpt ...", which is
> what occurs in the oe-selftest tests, i.e. when wic is run independently
> without being part of a bitbake build) then wic invokes its own search
> algorithm to try to find the wks file using BBLAYERS and script_dir. In
> this case the wks file is specified without the ".wks" and no path
> information is given on the cmdline. It is up to wic to find the actual
> wks file itself.
> 
> If the ".wks" is included (which is what happens when wic is called as
> part of a bitbake build and therefore the image_types_wic.bbclass is
> used) then the class adds the ".wks" at the end, and also gives wic the
> path to the wks file which it finds using WKS_SEARCH_PATH which is based
> on BBPATH and COREBASE.
> 
> Assuming the persona of someone who wants to use this new, independent
> wic tool, and who knows nothing about The Yocto Project or bitbake, I
> think having wic look in "magical" places for the wks file would be hard
> to understand and surprising. As an independent tool I think the user
> should provide the path to the actual wks file (with the ".wks"
> extension) and if that file can't be found as specified on the cmdline,
> wic should simply fail with an error.
> 
> As part of making wic an independent tool, I think wic's code to search
> for a wks file if the ".wks" is not provided should be removed. This
> means that, as part of the transition, I would have to modify each "wic
> create" test in oe-core's oe-selftests. I'm fine with that. That could
> be done cleanly if I write a little function to find the wks file in
> the wic.py oe-selftest itself using the same logic as is used in the
> image_types_wic.bbclass.
> 
> To summarize: in my opinion, wic shouldn't have search logic. From wic's
> point of view the wks file should be specified on the cmdline in a way
> that wic will find the file the user wants to use (or not find it).
> The oe-selftests should be updated to use the same search logic from
> the image_types_wic.bbclass so that when it invokes "wic create" it is
> providing wic with the path to a wks file that has a ".wks" extension
> (which is how bitbake invokes wic) instead of specifying a bare wks file
> and hoping wic will find it.

Looking at the code, it's a little deeper than that. wic also has a "wic
list" subcommand to "list available canned images and source plugins"
and it uses the same search logic (using BBLAYERS) to find "canned
images". The existing wic documentation, help text, and code refers to
these bare wks names as "images" or "canned images". If you specify a
bare wks to "wic create" and it can't find the wks file, the error
message says (in part): "No image named %s found..." (instead of "No wks
named %s found...".

Maybe I'm not understanding the history here, or maybe there's some
use-case I don't understand (or has long since stopped working) but what
"wic create" needs here is a wks file, not an image name, and conflating
the two seems very odd.

If it were up to me I'd clean the whole thing up. "wic create" needs a
wks file to guide it, not an image name that wic is going to use to find
a <image>.wks file using its own search logic.

I already have two patches to do this: one to add the bbclass search
logic to the oe-selftest wic tests, and a second one to remove wic's
image search logic from wic itself.

The first one is fairly easy to add and justify (I think).

The second one might be harder. Maybe there is some strange use-case
where we want wic to handle "wic create <bare-wks>" where <bare-wks> is
thought of as an image name? Removing wic's bare-wks search logic also
removes the "wic list images" subcommand since the only point of that
subcommand is to invoke its search logic and find "images" (which are
actually wks files).

> I'm happy to add "files/wic" as another location for
> image_types_wic.bbclass to search for wks files.
> 
> > > > I don't understand why these need to move given WKS_SEARCH_PATH remains
> > > > unchanged, unless wic is going to ignore WKS_SEARCH_PATH going forward?
> > > 
> > > As an independent tool, these *wks files are rather oe-core-specific,
> > > so I thought they should stay with the oe-core/meta layer, the same way
> > > that, say, raspberry pi-specific *wks files stay in the raspberry pi
> > > layer.
> > > 
> > > My first thought was to remove them from the standalone wic repository
> > > altogether, but then decided I could keep them as examples.
> > > 
> > > I thought it would be dangerous to leave them in the wic source
> > > tree where the above algorithm could find them. If I leave them in
> > > src/wic/canned-wks, someone uses the tool and creates a *wks file with a
> > > similar name to one of the canned-wks files, but they have a typo and
> > > the canned one gets used instead of theirs...
> > > 
> > > ...maybe I'm overthinking it?
> > 
> > It is definitely dangerous to leave them in the search paths so I agree
> > with that. The files do belong in OE-Core too. It is still a little
> > dangerous having files lying around which have the same names as the
> > ones in core since this kind of duplication still can confuse people
> > when they edit the wrong file. We have bigger issues I guess but some
> > renaming of the examples might help.
> > 
> > Cheers,
> > 
> > Richard
> > 
> > 

