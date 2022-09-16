Return-Path: <alberto@pianon.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A106ECAAA1
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 15:19:00 +0000 (UTC)
Received: from server3.justice4all.it (server3.justice4all.it [95.217.19.36])
 by mx.groups.io with SMTP id smtpd.web09.7405.1663341534301706575
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 08:18:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@pianon.eu
 header.s=mail20151219 header.b=s+qUpyFe;
 spf=pass (domain: pianon.eu, ip: 95.217.19.36, mailfrom: alberto@pianon.eu)
Received: from localhost (localhost [127.0.0.1])
	by server3.justice4all.it (Postfix) with ESMTP id C4E525C0096;
	Fri, 16 Sep 2022 17:18:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=pianon.eu; h=
	message-id:user-agent:references:in-reply-to:subject:subject
	:from:from:date:date:content-transfer-encoding:content-type
	:content-type:mime-version; s=mail20151219; t=1663341531; x=
	1665155932; bh=h02lAeJxiRmKnr+UMaovWR/VBe1vhGpsyqltpjtxQu8=; b=s
	+qUpyFei9RGY2F9dCp6K37FPcCaQqol/OigCoR+OqWAloi9blugLfWRPemINqXzw
	QrDr3HsrQ7aIHzrdJjd02S2A1VYhiITtHR4P7RIOkO4gSzfduEj8pQonO9Vp0bN5
	8OI1y795lNJhFBdkVtjTytpDxNhSPv7YHXjK+incyw=
X-Virus-Scanned: Debian amavisd-new at server3.justice4all.it
Received: from server3.justice4all.it ([127.0.0.1])
	by localhost (server3.justice4all.it [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id VtY23Tsxbfrl; Fri, 16 Sep 2022 17:18:51 +0200 (CEST)
Received: from pianon.eu (localhost [127.0.0.1])
	(Authenticated sender: alberto@pianon.eu)
	by server3.justice4all.it (Postfix) with ESMTPA id 16E9D5C0095;
	Fri, 16 Sep 2022 17:18:51 +0200 (CEST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 16 Sep 2022 17:18:50 +0200
From: Alberto Pianon <alberto@pianon.eu>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Marta Rybczynska <rybczynska@gmail.com>, OE-core
 <openembedded-core@lists.openembedded.org>,
 openembedded-architecture@lists.openembedded.org, Joshua Watt
 <JPEWhacker@gmail.com>, 'Carlo Piana' <carlo@piana.eu>,
 davide.ricci@huawei.com
Subject: Re: [Openembedded-architecture] Adding more information to the SBOM
In-Reply-To: 
 <e0ece56dc5b05480313c5eee78a3d31081478687.camel@linuxfoundation.org>
References: 
 <CAApg2=Q0+GqNVfyhnnadaEhXUB67_vbf5=ukKHdD8xRHqSOptg@mail.gmail.com>
 <e0ece56dc5b05480313c5eee78a3d31081478687.camel@linuxfoundation.org>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <10e816efb661938db17c512199720580@pianon.eu>
X-Sender: alberto@pianon.eu
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Sep 2022 15:19:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170791

Hi Richard,

thank you for your reply, you gave me very interesting cues to think
about. I'll reply in reverse/importance order

Il 2022-09-15 14:16 Richard Purdie wrote:
> 
> For the source issues above it basically it comes down to how much
> "pain" we want to push onto all users for the sake of adding in this
> data. Unfortunately it is data which many won't need or use and
> different legal departments do have different requirements.

We didn't paint the overall picture sufficiently well, therefore our
requirements may come across as coming from a particularly pedantic
legal department; my fault :)

Oniro is not "yet another commercial Yocto project", we are not a legal
department (even if we are experienced FLOSS lawyers and auditors, the
most prominent of whom is Carlo Piana -- cc'ed -- former general counsel
of FSFE and member of OSI Board).

Our rather ambitious goal is not limited to Oniro, and consists in doing
compliance in the open source way and both setting an example and
providing guidance and material for others to benefit from our effort.
Our work will therefore be shared (and possibly improved by others) not
only with Oniro-based projects but also with any Yocto project. Among
other things, the most relevant bit of work that we want to share is
**fully reviewed license information** and other legal metadata about a
whole bunch of open source components commonly used in Yocto projects.

To do that in a **scalable and fully automated way**, we need that Yocto
collects some information that is currently disposed of (or simply not
collected) at build time.

Oniro Project Leader, Davide Ricci - cc'ed - strongly encouraged us to
seek for feedback from you in order to find out the best way to do it.

Maybe organizing a call would be more convenient than discussing
background and requirements here, if you (and others) are available.


> Experience
> with archiver.bbclass shows that multiple codepaths doing these things
> is a nightmare to keep working, particularly for corner cases which do
> interesting things with the code (externalsrc, gcc shared workdir, the
> kernel and more).
> 
> I had a look at this and was a bit puzzled by some of it.
> 
> I can see the issues you'd have if you want to separate the unpatched
> source from the patches and know which files had patches applied as
> that is hard to track. There would be significiant overhead in trying
> to process and store that information in the unpack/patch steps and the
> archiver class does some of that already. It is messy, hard and doens't
> perform well. I'm reluctant to force everyone to do it as a result but
> that can also result in multiple code paths and when you have that, the
> result is that one breaks :(.
> 
> I also can see the issue with multiple sources in SRC_URI, although you
> should be able to map those back if you assume subtrees are "owned" by
> given SRC_URI entries. I suspect there may be a SPDX format limit in
> documenting that piece?

I'm replying in reverse order:

- there is a SPDX format limit, but it is by design: a SPDX package
   entity is a single sw distribution unit, so it may have only one
   downloadLocation; if you have more than one downloadLocation, you must
   have more than one SPDX package, according to SPDX specs;

- I understand that my solution is a bit hacky; but IMHO any other
   *post-mortem* solution would be far more hacky; the real solution
   would be collecting required information directly in do_fetch and
   do_unpack

- I also understand that we should reduce pain, otherwise nobody would
   use our solution; the simplest and cleanest way I can think about is
   collecting just package (in the SPDX sense) files' relative paths and
   checksums at every stage (fetch, unpack, patch, package), and leave
   data processing (i.e. mapping upstream source packages -> recipe's
   WORKDIR package -> debug source package -> binary packages -> binary
   image) to a separate tool, that may use (just a thought) a graph
   database to process things more efficiently.


> 
> Where I became puzzled is where you say "Information about debug
> sources for each actual binary file is then taken from
> tmp/pkgdata/<machine>/extended/*.json.zstd". This is the data we added
> and use for the spdx class so you shouldn't need to reinvent that
> piece. It should be the exact same data the spdx class uses.
> 

you're right, but in the context of a POC it was easier to extract them
directly from json files than from SPDX data :) It's just a POC to show
that required information may be retrieved in some way, implementation
details do not matter

> I was also puzzled about the difference between rpm and the other
> package backends. The exact same files are packaged by all the package
> backends so the checksums from do_package should be fine.
> 

Here I may miss some piece of information. I looked at files in
tmp/pkgdata but I couldn't find package file checksums anywhere: that is
why I parsed rpm packages. But if such checksums were already available
somewhere in tmp/pkgdata, it wouldn't be necessary to parse rpm packages
at all... Could you point me to what I'm (maybe) missing here? Thanks!

In any case, thank you much so for all your insights, they were
super-useful!

Cheers,

Alberto

