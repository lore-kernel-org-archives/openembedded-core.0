Return-Path: <mac@mcrowe.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DC80C35FFC
	for <webhook@archiver.kernel.org>; Sat, 22 Mar 2025 18:21:10 +0000 (UTC)
Received: from smarthost01a.sbp.mail.zen.net.uk (smarthost01a.sbp.mail.zen.net.uk [212.23.1.1])
 by mx.groups.io with SMTP id smtpd.web10.1733.1742667660669238039
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Mar 2025 11:21:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=HP3d+PQs;
 spf=pass (domain: mcrowe.com, ip: 212.23.1.1, mailfrom: mac@mcrowe.com)
Received: from [88.97.37.36] (helo=deneb.mcrowe.com)
	by smarthost01a.sbp.mail.zen.net.uk with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <mac@mcrowe.com>)
	id 1tw3Sb-003dAH-4F
	for openembedded-core@lists.openembedded.org;
	Sat, 22 Mar 2025 18:20:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20191005; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:
	Sender:Reply-To:CC:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=nRdhAtKneEAZLfHCLkPw4+F3tJ5+N8lXQ3dQOT63qjY=; b=HP
	3d+PQsPM9Bdv+GAdOYwJlYxpyIgNsmsAUEzpMZc2l9dxVymOmHovHpyDKMSxuMqB7HbAEs8eaLQp7
	kae/8+DsODJux+anQD2faZy/eIELNlNSAms/zI+vwM/Ek//8wsHpO/7EqkH8/b51JZ8LCNBSD/F2J
	BRp0KVXROsJemkgq9yMVKdi0V+0YFuuC+DIjXvjiz5M7g338EBNJh1WEIExllK3XDbBiXi32iRiK/
	Sh0FGXuoYhWNGx9/b5+Hi+dTz30fZ6RHUI3ZxkUxerhFkd0+lffLdGv/lds6cGWA5buE+j8Di6OuE
	28vPQ+foOZIAbEE3K9FoCdW79JPRkf+Q==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.96)
	(envelope-from <mac@mcrowe.com>)
	id 1tw3Ss-002Lqn-0v
	for openembedded-core@lists.openembedded.org;
	Sat, 22 Mar 2025 18:20:58 +0000
Date: Sat, 22 Mar 2025 18:20:58 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Subject: gcc library directory and LLVM
Message-ID: <Z97_ivhm-0mW7_Px@mcrowe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Originating-smarthost01a-IP: [88.97.37.36]
Feedback-ID: 88.97.37.36
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Mar 2025 18:21:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213497

Someone complained to me recently that clangd was unable to find headers in
multilib OE recipe sysroots even though it could do so for non-multilib OE
sysroots.

I dug into the LLVM code and discovered that LLVM has a specific "hack" for
OE[1] but that hack is not enabled for multilib sysroots. I proposed[2]
extending this hack to cover two common multilib targets. One of the LLVM
maintainers responded[3] suggesting that OE should consider moving from
using its current location ("${libdir}/${TARGET_SYS}") to the (apparently)
upstream default ("${libdir}/gcc/${TARGET_SYS}") or Debian's cross-compiler
("${libdir}/gcc-cross/${TARGET_SYS}") conventions. So I thought I'd better
investigate that.

gcc-common.inc sets ${gcclibdir} to what looks like the right thing, but it
looks like that only has an effect on gcc compiled for the target and not
the cross or cross-canadian compilers and even then just controls where the
recipe looks for files and not where the GCC build system writes them to.

I found a comment in libgcc-common.inc that explains one side of what's
going on:

 # install the runtime in /usr/lib/ not in /usr/lib/gcc on target                                                                                                                      
 # so that cross-gcc can find it in the sysroot

Way back in 2010 (f47eeddbd692ac3c6109c18c9f04a3ad4dc789ba) that comment
used to say:

 # Also need to move gcc from /usr/lib/gcc/* to /usr/lib/ else the search paths won't find the crt*.o files

which provides a bit more of a clue but doesn't explain why gcc-cross isn't
capable of looking in /usr/lib/gcc. Of course, my attempts to leave install
libgcc etc. in the locations that the GCC build system wrote them to (i.e.
/usr/lib/gcc/${TARGET_SYS}/${gccversion}) result in the built gcc-cross
compiler being unable to find it! (This was not a huge surprise to me.)

My suspicion is that OE does things the way it does because there were no
conventions way back when it started and even generating a working
cross-compiler was an achievement. It did whatever was necessary to make
things work.

At the risk of opening a massive ancient can of worms, is there a chance
that it now possible to teach gcc-cross to look for libgcc etc. in
${libdir}/gcc/${TARGET_SYS}/${gccversion} (or ../gcc-cross/..) to match
other distributions?

Thanks.

Mike.

[1] https://github.com/llvm/llvm-project/blob/868c89ff0e0ef09ac504873cb9bab8197f5fca2d/clang/lib/Driver/ToolChains/Gnu.cpp#L2880
[2] https://github.com/llvm/llvm-project/pull/121302
[3] https://github.com/llvm/llvm-project/pull/121302#issuecomment-2677041092

