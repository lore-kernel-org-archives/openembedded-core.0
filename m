Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CB7016FF97
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2016 17:04:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0SH4QRc020818; Thu, 28 Jan 2016 17:04:26 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id bQQIYxCaCzUT; Thu, 28 Jan 2016 17:04:26 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0SH4KlM020808
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 28 Jan 2016 17:04:22 GMT
Message-ID: <1454000660.10340.52.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Hongxu Jia <hongxu.jia@windriver.com>
Date: Thu, 28 Jan 2016 17:04:20 +0000
In-Reply-To: <56A983DE.6030907@windriver.com>
References: <cover.1453882496.git.hongxu.jia@windriver.com>
	<1453889810.10340.5.camel@linuxfoundation.org>
	<F43BB7C8-5982-46B5-90B1-D11128DEA616@gmail.com>
	<1453932798.10340.11.camel@linuxfoundation.org>
	<56A983DE.6030907@windriver.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] base/bbclass: use target path to replace build ones in debugging info
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
X-List-Received-Date: Thu, 28 Jan 2016 17:04:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-01-28 at 10:58 +0800, Hongxu Jia wrote:
> On 01/28/2016 06:13 AM, Richard Purdie wrote:
> > On Wed, 2016-01-27 at 14:34 -0500, Khem Raj wrote:
> > > > On Jan 27, 2016, at 5:16 AM, Richard Purdie <
> > > > richard.purdie@linuxfoundation.org> wrote:
> > > > 
> > > > I like the idea of this a lot, I think it makes sense however
> > > > why
> > > > not
> 
> My original trying was just added them here, but the variable parsing
> at here is too early, the ${BPN}, ${B} and {S} was assigned with
> 'defaultpkgname' at this time. Which we have:
> ...
> > -fdebug-prefix-map=/buildarea/raid0/hjia/build-20160127-yocto
> > -buildpath-2/
> tmp/work/core2-64-poky-linux/defaultpkgname/1.0-r0/defaultpkgname
> -1.0=
> /usr/src/defaultpkgname


I think this is just from your debugging technique. By the time these
are used in recipes, they will have the correct value for these
variables. Expansion happens late, not when the line is parsed.

Can you be more specific about how you tested this and the problem you
saw?

> With searching the manual, I could not find a gcc option to
> do the path substitution on switches in debugging information.
> 
> Maybe we could add a patch for gcc to do this. I could try in V2
> if there is no side effect.

I like that idea.

> Compile with '-fdebug-prefix-map':
> objdump -g packages-split/lib32-glibc-dev/usr/lib/gcrt1.o
> ...
> > <0><5e>: Abbrev Number: 1 (DW_TAG_compile_unit)
> >    <5f>   DW_AT_producer    : (indirect string, offset: 0xbb): GNU
> > C99 5.3.0 -m32
> -march=core2 -mtune=core2 -msse3 -mfpmath=sse -mpreferred-stack
> -boundary=4 -g -O2
> -std=gnu99 -fgnu89-inline -fdebug-prefix
> -map=/buildarea/raid0/hjia/build-20160119-
> yocto-buildpath/tmp/work/core2-32-pokymllib32-linux/lib32-glibc/2.22
> -r0/git=/usr/src/glibc
> -feliminate-unused-debug-types -fmerge-all-constants -frounding-math 
> -ftls-model=initial-exec
> 
> When we use '-fdebug-prefix-map', the TMPDIR was added to switches.
> Although
> remove the switches is to avoid buildpath QA check, the side effect
> is 
> the other
> part of compile options have also been removed.
> 
> If we need to leave the switches in, I think we could tweak the 
> buildpath QA check,
> which allows TMPDIR in '-fdebug-prefix-map=' without warning. I think
> I 
> should
> send a V2 to do this for discussion.
> 
> Solution1: do some path substitutions on the switches
> Solution2: tweak buildpath QA check to allow TMPDIR in '-fdebug
> -prefix-map='
> 
> I will try them in V2.

Thanks, that part looks good to me.

Cheers,

Richard

