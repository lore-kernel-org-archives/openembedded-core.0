Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id F1E0E610F5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 14:39:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7IEdBet031080; Mon, 18 Aug 2014 15:39:11 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id F7tGmTWdFBQf; Mon, 18 Aug 2014 15:39:11 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7IEd9RV031077
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 18 Aug 2014 15:39:10 +0100
Message-ID: <1408372750.1669.30.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 18 Aug 2014 15:39:10 +0100
In-Reply-To: <20140818131443.GL3660@jama>
References: <1408366010.1669.11.camel@ted> <20140818131443.GL3660@jama>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Allarch and packagegroup improvement proposal
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
X-List-Received-Date: Mon, 18 Aug 2014 14:39:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-08-18 at 15:14 +0200, Martin Jansa wrote:
> On Mon, Aug 18, 2014 at 01:46:50PM +0100, Richard Purdie wrote:
> > As some people are already painfully aware, the current way packagegroup
> > and allarch interact with the sstate signatures is painful.
> > 
> > Some example problem cases:
> > 
> > * An allarch package of scripts with an interpretor dependency (e.g perl)
> > 
> > * A packagegroup with dependencies on something which is debian renamed 
> >   e.g. build-essentials on libgmp 
> > 
> > 
> > Currently, packagegroups default to allarch and have their sstate
> > dependencies truncated. This means that when something like gmp
> > rebuilds, it can change package name thanks to debian renaming but the
> > packagegroup referencing the old name remains, causing image creation
> > failures.
> > 
> > So the "obvious" fix is to stop truncating the dependencies? Well, that
> > means that the allarch package is written out every time machine changes
> > to a different arch.
> > 
> > So we need to make packagegroups PACKAGE_ARCH specific? Well, this still
> > doesn't solve the problem of allarch packages having ever greater
> > problems with things like dependencies on perl.
> 
> Well then maybe that allarch package with perl dependency shouldn't be
> marked as allarch.

Take a step back and think about this from the end user system
perspective. The packages are all identical for each architecture,
"perl" doesn't change name. 

To me that means the correct end result is such a package should be
"allarch" in the package feeds.

The question then becomes, how do we generate such things in a sane way.

> I'm in favor of removing default allarch and setting correct
> PACKAGE_ARCH manually in the packagegroup recipes like we do elsewhere.
> 
> packagegroups are small and "rebuilt" quickly, so I don't mind
> "building" them once per TUNE_PKGARCH or even once per MACHINE_ARCH like
> we do for couple of them already.
> 
> I can even find few changes from me on ML which do exactly that.

It does seem a bit of a cop out to do this on the grounds that its
small/fast :/.

I agree there is good reason why some should be PKGARCH but we can
probably do better than just marking them all that way IMO. I think we
should try and mark them correctly too, i.e. think about whether the
packages really are identical and/or make sense as allarch and try and
avoid duplication if so.

Cheers,

Richard




