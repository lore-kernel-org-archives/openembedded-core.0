Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3339E88D6F
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 22:23:34 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6324.1775255012021780202
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2026 15:23:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OkwmyBwN;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-89cc797547fso27496996d6.2
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 15:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775255011; x=1775859811; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5aSxhZ2Sc/Uw21JdmWIcMV0TnT8cG3V7zcdAKMwxr5Q=;
        b=OkwmyBwNpHT2B0sHktavbFFm2Fuel0lN/YqkLb9bUWMyp+wnttqFsLn+vJ82s/ASet
         7yVAX8Jv1IZEppYazzkhbvab9gN/hozVR7usUPOMNc/1GlGUjduoKWKOvLc3we5swnhJ
         7EiS2rAFTA36Fe1Net+XacIFe/IrLbj5e5JfSgBMekPsKTYN5k61BuaAv/f8IfZzZdW+
         3j9WBDyHPgQ+AGstlUUDAUcYJ9swW0g+eTBM6iV61I3EpnBTMgepO8t8491/UzhgtBKa
         I+iWk3w7V5dF9JRJwwpQZda03FEUS6gs4tyT7qQLM0+M/zkEDi7fqvffajFyZpnp9u5r
         olVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775255011; x=1775859811;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5aSxhZ2Sc/Uw21JdmWIcMV0TnT8cG3V7zcdAKMwxr5Q=;
        b=qLXkhceeQy92aWDTCV0h6IlltG1q0iu/Cd8v30WMrMRpEvcapTyEUkSadqb/CM2Po3
         fMY+OurVRrZstemYnzaHypMoF+GgRMHSl+wAbz9xMn7vl6ApUztm7wZ8RpIXoixVAJwD
         8EkXHt4EFRKC4NTqapRIQ/B2t/mld4zcsljisyEwbMqcpls5ieAGLx9Bm2kqdM3O4chV
         NBqx7I4H614u4qb2pVFUqQewzdhLzHCAAo8Fl4uEE5DOZ+H6uf1HUBsd8fbFUWGLXbrc
         5I4mQiAVYyQmEPbucNT1B3n+JUszVG4NC2zkAh6gItLAfeFnnBPBKX2vk9GbcektOsg2
         WyRA==
X-Gm-Message-State: AOJu0YwOsP64J29ucXCd92GvNj6fx97l9WKv15lY2Qo9nnqq7ondaRLw
	P+pzpl2+3OHjPI5QT59xzvuiE0G8et9stCLZ3JRdxHv2cd559n9UMsUx
X-Gm-Gg: AeBDiesnOV27itZjrTNE+gQWyAZv/0viV4ONmgTOgCX86RSFl9TBXi2FCD5DC07speH
	b2iXvHNGqz/Z6QsYP+6ALRx7rzU2k8R88d+p6r2PjTfPYbuL2yvs5abs1VL1+wbKZZBnoIl//o6
	T19SNks3RRNZuuN8PiatojlJh6NXMgFJ4gmpcv47JQZmt0ut9FemAkXU+vTvyH0ioK8Ityfw9dx
	rE9HBIa3dN6DuljcYwxN4qUd1g7shLKphWL2gimyT+Rg0gjwIeAJsP+ksDrgK9OpAMHC+8InepU
	lfPq/O+qT80S0tXZi6dGu6lgwnTNFlcSjScTJbNWAg6pBHw0RnN46M+Mgt/lU6F0AfL2ewDVjDm
	zGJ3rn2qUNQDdUZIjM8dA9bX3t34P5yc/HHktYBrJa5dflcaKNAJZeXBQfhb3TVxC0cR3pyRXeb
	u3PV3mGc61SiwRTVvZsfrBF+6cMrRKQw7IBFxtWnrRp9AUcm8c3eNKy7yAYki5ZDM2wg==
X-Received: by 2002:a05:6214:4408:b0:89f:9bc2:20d1 with SMTP id 6a1803df08f44-8a7020bc157mr84311476d6.7.1775255010948;
        Fri, 03 Apr 2026 15:23:30 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a593bf4f0fsm55854106d6.16.2026.04.03.15.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 15:23:30 -0700 (PDT)
Date: Fri, 3 Apr 2026 18:23:28 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	Mark Hatle <mark.hatle@kernel.crashing.org>
Subject: Re: [OE-core] [PATCH v9 4/5] wic: move canned *wks files
Message-ID: <adA94CgwRzIvBl1R@localhost.localdomain>
References: <20260403183541.2631883-1-twoerner@gmail.com>
 <20260403183541.2631883-5-twoerner@gmail.com>
 <59476a47af44f95f70e14869226d336e90c009a4.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <59476a47af44f95f70e14869226d336e90c009a4.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 22:23:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234604

On Fri 2026-04-03 @ 10:13:00 PM, Richard Purdie wrote:
> On Fri, 2026-04-03 at 14:35 -0400, Trevor Woerner via lists.openembedded.org wrote:
> > When "wic create ..." is invoked with a bare *wks name (i.e. without the
> > `.wks` extension), wic calls engine.py:find_canned_images() to find the
> > fully qualified *wks file. This function searches every directory formed by:
> >     - permutating all BBLAYERS with `/wic`
> >     - permutating all BBLAYERS with `/scripts/lib/wic/canned-wks`
> >     - checking `<scripts_path>/lib/wic/canned-wks`
> > Where `<scripts_path>` is the directory containing the wic program.
> 
> It doesn't. I just looked at the code and it uses BBPATH. That can be
> similar to BBLAYERS but it is different and the commit messages really
> should refer to BBPATH.

In the oe-selftest wic tests, most of the "wic create ..." commands
are called with bare *wks files (i.e. *wks files without the `.wks`
extension). When this happens, as "wic create..." is called, it starts
by running the code found here:

	https://git.openembedded.org/openembedded-core/tree/scripts/wic#n206

which calls:

	https://git.openembedded.org/openembedded-core/tree/scripts/lib/wic/engine.py#n46

which follows the algorithm that I have described above.

So for the oe-selftests to pass I wanted to move them.


> > When wic is part of oe-core, the last search path succeeds in finding
> > the canned *wks files in `<topdir>/scripts/lib/wic/canned-wks` (since
> > the wic program is found in oe-core's `<topdir>/scripts` directory, and
> > `<topdir>/scripts` is not a BBLAYER).
> > 
> > However, once wic is removed from oe-core, this algorithm will not find
> > these bare *wks files in any of the above-mentioned search paths since
> > the oe-core layer will no longer be the home of the wic program, and the
> > canned *wks files are not located in any directory relative to BBLAYERS.
> 
> I'm a bit confused by this reasoning. Are you saying that wic will no
> longer search BBPATH (or WKS_SEARCH_PATH)?
> 
> > Since these *wks files are specific to oe-core's meta layer, they should
> > stay with this layer. Therefore move the *wks files so they exist in one
> > of the locations searched relative to oe-core/meta's BBLAYERS.
> 
> I don't understand why these need to move given WKS_SEARCH_PATH remains
> unchanged, unless wic is going to ignore WKS_SEARCH_PATH going forward?

As an independent tool, these *wks files are rather oe-core-specific,
so I thought they should stay with the oe-core/meta layer, the same way
that, say, raspberry pi-specific *wks files stay in the raspberry pi
layer.

My first thought was to remove them from the standalone wic repository
altogether, but then decided I could keep them as examples.

I thought it would be dangerous to leave them in the wic source
tree where the above algorithm could find them. If I leave them in
src/wic/canned-wks, someone uses the tool and creates a *wks file with a
similar name to one of the canned-wks files, but they have a typo and
the canned one gets used instead of theirs...

...maybe I'm overthinking it?

