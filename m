Return-Path: <seebs@seebs.net>
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id 00E457888F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 23:56:56 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 175662E8938;
	Fri, 23 Mar 2018 18:56:57 -0500 (CDT)
Date: Fri, 23 Mar 2018 18:56:55 -0500
From: Seebs <seebs@seebs.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20180323185655.51d96c05@seebsdell>
In-Reply-To: <1521848850.11431.36.camel@linuxfoundation.org>
References: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<lyk1u2re5q.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LaU41nPj1U2puHTvW272u0skdFk-gkuz3_-hXWWbxEqAg@mail.gmail.com>
	<lyd0zurcw4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20180323112820.12bc94a4@seebsdell>
	<CAJTo0LYfzA2i6GwJA0mODvNse8gy+=gYBk-T9dAUbR65bAVDZA@mail.gmail.com>
	<20180323114939.218c0607@seebsdell>
	<1521848850.11431.36.camel@linuxfoundation.org>
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: pseudo: host user contamination
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
X-List-Received-Date: Fri, 23 Mar 2018 23:56:57 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 23 Mar 2018 23:47:30 +0000
Richard Purdie <richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2018-03-23 at 11:49 -0500, Seebs wrote:
> > On Fri, 23 Mar 2018 16:30:55 +0000
> > "Burton, Ross" <ross.burton@intel.com> wrote:
> > 
> > > 
> > > Because in GNU's infinite wisdom they're using renameat2() to do
> > > atomic renames in the mv command, and as renameat2 isn't in the
> > > headers for F27 it just does a syscall directly. This is in
> > > upstream
> > > coreutils so once they make a release, everyone gets it.
> > UGH.
> > 
> > I... am really unsure whether it's possible to catch that, because
> > I really, really, don't want to try to intercept raw syscall()
> > calls. I don't think that ends well.
> 
> Just out of interest for my education, why is that a really bad idea?
> Loops, e.g. with memory allocation issues?

Potentially. We rely pretty heavily on the assumption that an *actual*
syscall can go through.

Although... Actually, I don't even know if this is an actual syscall.
This could be an actual glibc wrapper around the syscall interface,
just like all the others, which is not the *actual* raw syscall or
whatever, and... I have no idea how often that is or isn't hit.

It's totally possible it would work, but basically, I have a pretty
good intuition of when something sounds brittle and error-prone, and
trying to trap syscall() sounds brittle and error-prone and might work
today but not next week...

-s

