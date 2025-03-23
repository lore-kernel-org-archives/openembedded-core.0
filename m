Return-Path: <mac@mcrowe.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33E31C28B30
	for <webhook@archiver.kernel.org>; Sun, 23 Mar 2025 14:13:36 +0000 (UTC)
Received: from smarthost01a.sbp.mail.zen.net.uk (smarthost01a.sbp.mail.zen.net.uk [212.23.1.1])
 by mx.groups.io with SMTP id smtpd.web11.16247.1742739206370885161
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Mar 2025 07:13:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=jjm//4MD;
 spf=pass (domain: mcrowe.com, ip: 212.23.1.1, mailfrom: mac@mcrowe.com)
Received: from [88.97.37.36] (helo=deneb.mcrowe.com)
	by smarthost01a.sbp.mail.zen.net.uk with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <mac@mcrowe.com>)
	id 1twM4Y-005rD4-Sd;
	Sun, 23 Mar 2025 14:13:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20191005; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description; bh=ssUreRjSSqDSsC45cJZuZUX/xl89BINArtONoKxA+6U=; b=jjm//
	4MDxp7CRggY2+iTprfVBKPzKgCuau5sl8YAkqNTMlcDDbLRQHYaBy16/4zrTMmbksKzeDhC2dRToX
	qA1WsMRSyR++wkqWaQMcAzMNvJtrt6ok4aq6RPf5X1cWFD3obzA2WDOUXZmVDqkN1/8ocpe6TIoTv
	jbC58WivOumSwOMSnj0CplcJbM9YBQOgIBvL+TZ+CzqTV1WVql03j10YtBnJ1nbGE/y57v1lzWu8s
	K1l1E0B6hjgEx+B/4vt85e8g9CjhFhQy9GIMJabRWPtY6DLheOhpuqge/0dubbJo0vAAWILfxUNi3
	EOvTic8Nag8FwLM6Xwu5MSRSfshJQ==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.96)
	(envelope-from <mac@mcrowe.com>)
	id 1twM4q-004rgg-0l;
	Sun, 23 Mar 2025 14:13:24 +0000
Date: Sun, 23 Mar 2025 14:13:24 +0000
From: Mike Crowe <mac@mcrowe.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] gcc library directory and LLVM
Message-ID: <Z-AXBBqnYTjX_pJh@mcrowe.com>
References: <Z97_ivhm-0mW7_Px@mcrowe.com>
 <2b00dfa58869a6a2b8f0b709bf8eda20aaffa3e3.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2b00dfa58869a6a2b8f0b709bf8eda20aaffa3e3.camel@linuxfoundation.org>
X-Originating-smarthost01a-IP: [88.97.37.36]
Feedback-ID: 88.97.37.36
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Mar 2025 14:13:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213506

On Saturday 22 March 2025 at 20:02:58 +0000, Richard Purdie wrote:
> On Sat, 2025-03-22 at 18:20 +0000, Mike Crowe via lists.openembedded.org wrote:
> > Someone complained to me recently that clangd was unable to find headers in
> > multilib OE recipe sysroots even though it could do so for non-multilib OE
> > sysroots.
> > 
> > I dug into the LLVM code and discovered that LLVM has a specific "hack" for
> > OE[1] but that hack is not enabled for multilib sysroots. I proposed[2]
> > extending this hack to cover two common multilib targets. One of the LLVM
> > maintainers responded[3] suggesting that OE should consider moving from
> > using its current location ("${libdir}/${TARGET_SYS}") to the (apparently)
> > upstream default ("${libdir}/gcc/${TARGET_SYS}") or Debian's cross-compiler
> > ("${libdir}/gcc-cross/${TARGET_SYS}") conventions. So I thought I'd better
> > investigate that.
> > 
> > gcc-common.inc sets ${gcclibdir} to what looks like the right thing, but it
> > looks like that only has an effect on gcc compiled for the target and not
> > the cross or cross-canadian compilers and even then just controls where the
> > recipe looks for files and not where the GCC build system writes them to.
> > 
> > I found a comment in libgcc-common.inc that explains one side of what's
> > going on:
> > 
> > �# install the runtime in /usr/lib/ not in /usr/lib/gcc on target
> > �# so that cross-gcc can find it in the sysroot
> > 
> > Way back in 2010 (f47eeddbd692ac3c6109c18c9f04a3ad4dc789ba) that comment
> > used to say:
> > 
> > �# Also need to move gcc from /usr/lib/gcc/* to /usr/lib/ else the search paths won't find the crt*.o files
> > 
> > which provides a bit more of a clue but doesn't explain why gcc-cross isn't
> > capable of looking in /usr/lib/gcc. Of course, my attempts to leave install
> > libgcc etc. in the locations that the GCC build system wrote them to (i.e.
> > /usr/lib/gcc/${TARGET_SYS}/${gccversion}) result in the built gcc-cross
> > compiler being unable to find it! (This was not a huge surprise to me.)
> > 
> > My suspicion is that OE does things the way it does because there were no
> > conventions way back when it started and even generating a working
> > cross-compiler was an achievement. It did whatever was necessary to make
> > things work.
> > 
> > At the risk of opening a massive ancient can of worms, is there a chance
> > that it now possible to teach gcc-cross to look for libgcc etc. in
> > ${libdir}/gcc/${TARGET_SYS}/${gccversion} (or ../gcc-cross/..) to match
> > other distributions?
> 
> As someone who has poked at some of this, I suspect you're right, we
> managed to make it all work and we moved on to other more pressing
> matters.

I think that the phrase "poked at some of this" hugely underestimates the
work you've put into this over the years. Thank you!

> It would probably be nice to be consistent with the target layout but I
> suspect there are issues with the compiler/library search paths which
> prevent it as we do things today.
> 
> OE is one of the few setups that has separate host system, native and
> target sysroots. We also use our own mechanisms of relocation of gcc,
> partly due to that, all of which combines to mean that this isn't a
> simple thing to change.
> 
> Trying to unravel the situation and then if necessary, talking to
> upstream gcc about how we might be able improve things is on my todo
> list. Sadly it is the kind of thing few people actually care enough
> about to invest time into and I get too many other distracting bigger
> fires. Sadly I struggle to explain to people why we should care about
> making these kinds of back end infrastructure improvements and I
> therefore struggle to find time to spend on it.
> 
> So yes, I suspect it would be possible but who would wade through the
> pain involved, perhaps other than me, I'm not sure...

This is roughly what I was expecting.

I have only a cursory understanding of how this all works and unfortunately
I don't think I'm going to be able to invest the necessary time in trying
to learn enough to be useful. Nevertheless, if I get the chance to, I will.

It turns out that it is possible to trick the LLVM code into looking in the
right place by creating symlinks. Unfortunately it uses ../../.. to get
back from /usr/lib/gcc/${TARGET_SYS}/${gccversion}) to /usr/lib. This means
that each part of the former path must be a real directory though/. :( Why
it is finding /usr/lib this way rather than just using the sysroot argument
I don't know.

Thanks for sending such a useful reply so quickly.

Mike.

