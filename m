Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D2195781E7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 14:24:55 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7MEOrsD032112
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 22 Aug 2017 15:24:55 +0100
Message-ID: <1503411893.32591.108.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Tue, 22 Aug 2017 15:24:53 +0100
In-Reply-To: <74bfd0a2-59a7-c98b-690d-8749ca7a989a@windriver.com>
References: <cover.1503283308.git.bruce.ashfield@windriver.com>
	<1503330934.32591.64.camel@linuxfoundation.org>
	<74bfd0a2-59a7-c98b-690d-8749ca7a989a@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Tue, 22 Aug 2017 15:24:55 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/9] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Tue, 22 Aug 2017 14:24:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-08-21 at 12:12 -0400, Bruce Ashfield wrote:
> On 2017-08-21 11:55 AM, Richard Purdie wrote:
> > 
> > On Sun, 2017-08-20 at 22:58 -0400, Bruce Ashfield wrote:
> > > 
> > > Here's the collected set of kernel changes that are ready for the
> > > M3
> > > builds.
> > > 
> > > We have some kernel meta data changes:
> > > 
> > >    kernel-yocto: configuration updates: x86 features
> > >    linux-yocto/4.1: fix fsl-ls10xx sdhci
> > >    linux-yocto: add usb-net configs by default
> > > 
> > > Some bug fixes:
> > > 
> > >    kernel-yocto: ensure that only valid BSPs are built
> > >    linux-yocto/4.10: CVE & misc fixes
> > > 
> > > And the important changes are the addition of the 4.12 kernel +
> > > libc headers
> > > and the removal of the 4.1 kernel.
> > > 
> > > I also have some -stable updates queued for the active kernel
> > > versions, but
> > > they will come out once this series has made it into the tree,
> > > since I'm
> > > trying to isolate any 4.12 issues from other -stable updates.
> > > 
> > > I built and booted all the qemu targets for 4.12, and have built
> > > for
> > > core-image-sato, core-image-kernel-dev, glibc and muslc for all
> > > of the
> > > architectures. My testing didn't pick up any regressions, but I
> > > was battling
> > > some other build errors (non kernel related) during my testing,
> > > so I can
> > > never be 100% sure.
> > > 
> > > I've sent patches to poky to remove/bump any references to the
> > > 4.1 kernel
> > > .. if I've missed any, I'm sure people will shout.
> > Thanks for the other fix, not got that tested yet as builds are
> > still
> > ongoing. However there appears to be a perf issue:
> > 
> > https://autobuilder.yocto.io/builders/nightly-deb-non-deb/builds/42
> > 9/steps/BuildImages/logs/stdio
> > https://autobuilder.yocto.io/builders/nightly-packagemanagers/build
> > s/77/steps/BuildImages/logs/stdio
> > https://autobuilder.yocto.io/builders/nightly-packagemanagers/build
> > s/77/steps/BuildImages_1/logs/stdio
> > https://autobuilder.yocto.io/builders/nightly-packagemanagers/build
> > s/77/steps/BuildImages_2/logs/stdio
> > [and so on]
> > 
> Aha. There's a difference in the clibrary that I was using. I'll have
> a closer look once my switch over and build gets going.

Thanks, I think you got that one but the /bin/awk issue remained after
your changes. Its easy to reproduce with "bitbake core-image-sato-sdk", 
or IMAGE_INSTALL_append = " kernel-devsrc". I ended up with this change
to fix it:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=master-next&id=a28acfa6c5890df4f5cb09962ef0c53837ac3b37

which I appreciate you won't like but it illustrates the problem. Any
preference on what to do with that patch?

We do also have a boot test issue on mips64:

https://autobuilder.yocto.io/builders/nightly-mips64/builds/423/steps/Running%20Sanity%20Tests/logs/stdio

and mips:

https://autobuilder.yocto.io/builders/nightly-mips/builds/425/steps/Running%20Sanity%20Tests/logs/stdio

I assume we just have to whitelist that error message?

Cheers,

Richard

