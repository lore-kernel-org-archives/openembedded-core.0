Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B285F601F6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 10:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2UAuNJX022035; Wed, 30 Mar 2016 11:56:23 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id KwO9Pwe1B7Ky; Wed, 30 Mar 2016 11:56:23 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2UAuKtX022025
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 30 Mar 2016 11:56:22 +0100
Message-ID: <1459335380.21672.51.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bill Randle <william.c.randle@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 30 Mar 2016 11:56:20 +0100
In-Reply-To: <1459323169.21672.46.camel@linuxfoundation.org>
References: <1459290421-9838-1-git-send-email-william.c.randle@intel.com>
	<1459323169.21672.46.camel@linuxfoundation.org>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCHv3] man: fix several annoying compile/build warnings
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Mar 2016 10:56:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-03-30 at 08:32 +0100, Richard Purdie wrote:
> On Tue, 2016-03-29 at 15:27 -0700, Bill Randle wrote:
> > Fixed the build error when building man.config.5 (a remnant of a
> > long
> > ago previous patch). Optimized the manpages Makefile for parallel
> > builds. Drop a FHS patch that is no longer needed, as the standard
> > Makefile puts the man pages in the proper location. Also, fix
> > compile
> > warnings in a couple other files.
> > 
> > [YOCTO #9341]
> > 
> > Signed-off-by: Bill Randle <william.c.randle@intel.com>
> > ---
> > [Note: should be applied after previous man patch "fix src/Makefile
> > to work with parallel make".]
> > 
> > v3: clean up patch submission for mailing list
> 
> These two were applied in the build yet we saw:
> 
> https://autobuilder.yoctoproject.org/main/builders/nightly-x86-lsb/bu
> il
> ds/718/steps/BuildImages/logs/stdio

The man failure worried me a bit so I had a look at the code. The
configure script looks good with its BUILD_CC and CC, however it goes
on to build things with $CC then run them which in a cross environment,
isn't going to work.

The reason we only saw failures in qemux86-64 with poky-lsb is because
that is the only case where the binaries generated with $CC could
actually run (in the normal poky case, the interpretor isn't in /lib64/
but /lib/).

On my local builds in conf_script I see:

s,@DEFS@, -DUSG -Duid_t=__uid_t -Dgid_t=__uid_t -DALLOCA_MISSING -DNONLS -DNOGETOPT -DDO_COMPRESS,

and on the failed builds on the AB:

s,@DEFS@, -DSTDC_HEADERS -DTERMIOS_HEADER -DPOSIX -DDO_COMPRESS,

with the -DNONLS being necessary to avoid build failures.

I suspect we're going to have to seriously patch the configure script
to remove several of the tests and then set the options to the correct
things manually.

I haven't looked further at what other nastiness may lurk beyond this
but at least we have a clear understanding of why its breaking now...

Cheers,

Richard

