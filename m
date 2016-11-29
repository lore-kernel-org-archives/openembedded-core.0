Return-Path: <rpjday@crashcourse.ca>
Received: from smtp486.redcondor.net (smtp486.redcondor.net [208.80.204.86])
	by mail.openembedded.org (Postfix) with ESMTP id D020D71AF5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 10:48:31 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp486.redcondor.net ({6695537a-536a-45f9-a249-877c85428649})
	via TCP (outbound) with ESMTPS id 20161129104831018_0486;
	Tue, 29 Nov 2016 10:48:31 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=29349 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cBfxY-00076p-1X; Tue, 29 Nov 2016 05:48:24 -0500
Date: Tue, 29 Nov 2016 05:47:11 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@ca624034.mitel.com
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <1480334664.28508.167.camel@linuxfoundation.org>
Message-ID: <alpine.LFD.2.20.1611290542100.24580@ca624034.mitel.com>
References: <alpine.LFD.2.20.1611280544090.16875@localhost.localdomain>
	<1480334664.28508.167.camel@linuxfoundation.org>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: ASSUME_PROVIDED versus SANITY_REQUIRED_UTILITIES versus "The Build Host Packages"
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
X-List-Received-Date: Tue, 29 Nov 2016 10:48:43 -0000
Content-Type: multipart/mixed; BOUNDARY="587864349-516673264-1480416437=:24580"

--587864349-516673264-1480416437=:24580
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 28 Nov 2016, Richard Purdie wrote:

> On Mon, 2016-11-28 at 06:20 -0500, Robert P. J. Day wrote:
> >   a bit confused by what i'm seeing in a recent
> > qemuppc/core-image-minimal build on my fedora system regarding which
> > native packages are built, despite what's in bitbake.conf (using
> > current poky layer checkout).
> >
> >   first, here's a snippet from bitbake.conf:
> >
> >   ASSUME_PROVIDED = "\
> >     bzip2-native \          <---
> >     chrpath-native \
> >     file-native \           <---
> >     findutils-native \
> >     git-native \
> >     grep-native \
> >     diffstat-native \
> >     ... snip ...
> >
> > suggesting that (among other things) bzip2-native and file-native
> > shouldn't be built -- it's the developer's responsibility to install
> > them, yes? but if i peek under tmp/work/x86_64-linux, i can see:
>
> There are two ways "file-native" can be used in a build. It can be
> used as the host provided "file" command and it is also needed by
> the file recipe to build file for the target. We need to build
> file-native in order for the build for the target file command to
> build/work. This is why it gets built.
>
> With bzip2, we need libbz2 (native) during the build process and we
> don't ASSUME_PROVIDED libbz2-devel, hence it builds bzip2-native
> only for that piece. Confusing perhaps but necessary unfortunately.

  ah, gotcha ... so in cases like that, even if a recipe needs to be
*partially* built for libraries, that in no way affects the
ASSUME_PROVIDED setting, correct? as in, once I ASSUME_PROVIDED
"bzip2-native", then that *better* exist on my build host, correct?

rday

P.S. there is still some lack of sync amongst:

  * ASSUME_PROVIDED
  * sanity.bbclass
  * YP quick start guide

one example i mentioned is that the YP guide does not list "sed" as a
build host requirement, but "sed-native" is in ASSUME_PROVIDED;
however, it's not listed in SANITY_REQUIRED_UTILITIES. that seems
inconsistent.

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--587864349-516673264-1480416437=:24580--
