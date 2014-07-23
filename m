Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 47F146AC9D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 14:31:29 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6NEVTxU026560; Wed, 23 Jul 2014 15:31:29 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hLHLgR3MVSYV; Wed, 23 Jul 2014 15:31:29 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6NEVNPZ026280
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 23 Jul 2014 15:31:25 +0100
Message-ID: <1406125883.22985.121.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Barker <paul@paulbarker.me.uk>
Date: Wed, 23 Jul 2014 15:31:23 +0100
In-Reply-To: <20140723135123.GA32767@gmail.com>
References: <20140723135123.GA32767@gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: gpgme-config
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
X-List-Received-Date: Wed, 23 Jul 2014 14:31:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-07-23 at 13:51 +0000, Paul Barker wrote:
> I'm trying to build opkg with 'gpg' added to PACKAGECONFIG on the master branch
> of OE. The gpg support for opkg is provided by gpgme, which uses 'gpgme-config'
> to determine CFLAGS and LIBS when building. After recent changes, the
> gpgme-config script is now just a dummy and doesn't do anything.
> 
> Upstream gpgme do not provide a pkg-config file and an upstream issue about this
> raised in 2012 was resolved WONTFIX (https://bugs.g10code.com/gnupg/issue1414).
> 
> Our options are:
> 
> 1) Add a .pc file to gpgme and maintain it within OE as it is very unlikely to
>    be accepted upstream. Then I need to modify configure.ac in opkg to support
>    both this pkg-config file (for OE) and the gpgme-config utility (for all
>    other users of opkg).

There are a set of applications, all gpg related which we've done this
for. Its rather sad upstream have this as WONTFIX and I'd love them to
reconsider this.

How does opkg's configure.ac use gpgme? Does it use the macros from
gpgme.m4 (or can it)? If it does, we can just patch that m4 file and
opkg will "just work", this is what happened with the majority of the
other gpg recipes. The patches tend just to delete a lot of code and are
relatively simple, hence the overhead isn't so bad.

> 
> 2) Make an exception to the policy on -config scripts for gpgme.
> 
> I haven't really followed the discussion on why -config scripts needed to be
> removed so I'll put this question to other OE developers. Would option (2) cause
> more problems in the long run? If so, is it worth the extra effort to follow
> option (1)?

If you look at what binconfig.bbclass does, its pretty horrific.
pkg-config is a much saner way of doing things in a cross compile
environment that doesn't mean we need to hack the -config scripts each
time we want to use a different sysroot.

There are only a small minority of recipes that don't support pkg-config
and the plan is just to patch those so they do, regardless of the
upstream.

> I'll probably need someone to bounce a few autoconf and pkg-config questions off
> if I implement option (1) as I'm not very familiar with either system.

Happy to help. Looking at the other pkgconfig.patch to the other gpg
pieces would be a good starting point.

Cheers,

Richard


