Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QMdkW-0002vv-Ar for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 12:13:04 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4IAAAoi026735
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 11:10:10 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26619-02 for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 11:10:06 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4IAA2Fm026720
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 11:10:03 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BANLkTimxzmHLg9FkMuF8HOYiUuDiBjzR8w@mail.gmail.com>
References: <cover.1305525725.git.raj.khem@gmail.com>
	<ca9a918a98510eac991c84ce1ebe8fecbdf38361.1305525725.git.raj.khem@gmail.com>
	<1305591231.3424.152.camel@rex>
	<20110518074909.GA31650@sakrah.homelinux.org>
	<1305705436.3424.299.camel@rex>
	<BANLkTimxzmHLg9FkMuF8HOYiUuDiBjzR8w@mail.gmail.com>
Date: Wed, 18 May 2011 11:09:59 +0100
Message-ID: <1305713399.3424.306.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 2/2] tclibc-uclibc.inc: Append -uclibc only to target recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 May 2011 10:13:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-05-18 at 10:48 +0200, Frans Meulenbroeks wrote:
> 2011/5/18 Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> > On Wed, 2011-05-18 at 00:49 -0700, Khem Raj wrote:
> > > I think we need to globalize libc variable like MACHINE or MULTIMACHINE
> > > and we could check if PREFERRED_PROVIDER_virtual/libc == TCLIBC or not
> > > in base.bbclass for sanity. Something like attached patch might be
> > > able to do it
> >
> > Having assessed how many places in the system we'd need to make this
> > kind of change I'm now of the opinion its too great. I think
> > manipulating TMPDIR is a better cleaner solution and we should inject
> > this there...
> >
> >
> > Note that this introduces  additional build time and space to rebuild
> native recipes for the different TMPDIR variants. Something which is not
> needed with the solution from Khem, if I properly understand things.

I mentioned this elsewhere in the thread but the sstate cache directory
is in TOPDIR, not TMPDIR so its shared between the builds. This means
the -native recipes should not need any additional build time. There is
some disk space usage but this should be minimal and disk space is
comparatively cheap anyway.

> From a conceptual point of view it seems better to mangle the target subdir
> name  in work (e.g. ppce300c3-oe-linux-uclibc) or introduce a subdir in
> TMPDIR for  (e.g. ppce300c3-oe-linux/uclibc )

This turns out to be quite nasty mangling as the deploy directories
don't include this and would need mangling in a certain style, the
sysroots need a different mangling and so does workdir, the cache
directories and so on. What these all have in common is they're in
TMPDIR and the native directories are pretty much the only thing we
don't mangle. The exceptions to the mangling seem to work out quite ugly
as in the cross case we have to "half-mangle" directories too.

> (actually I seem to recall that we have or had something in OE as 
> well, something like deploy/glibc)

Some of it worked ok in OE, some of it didn't and the move to a sysroot
directory per machine was the straw that broke the camel's back so to
speak. We need to take a step back and consider what we're trying to
achieve from an overall architecture perspective and which solution
makes sense.

Cheers,

Richard





