Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 33E0160030
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 11:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7JBJteK001883; Tue, 19 Aug 2014 12:23:10 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 7GgVs1xHrOnh; Tue, 19 Aug 2014 12:23:10 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7JBN46x001956
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 19 Aug 2014 12:23:06 +0100
Message-ID: <1408447385.1669.44.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 19 Aug 2014 12:23:05 +0100
In-Reply-To: <22E8A6CB-313F-4713-B76F-FE090570EB15@dominion.thruhere.net>
References: <1408366010.1669.11.camel@ted> <20140818131443.GL3660@jama>
	<1408372750.1669.30.camel@ted> <1408376104.1669.33.camel@ted>
	<22E8A6CB-313F-4713-B76F-FE090570EB15@dominion.thruhere.net>
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
X-List-Received-Date: Tue, 19 Aug 2014 11:23:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-08-19 at 12:41 +0200, Koen Kooi wrote:
> Op 18 aug. 2014, om 17:35 heeft Richard Purdie <richard.purdie@linuxfoundation.org> het volgende geschreven:
> 
> > On Mon, 2014-08-18 at 15:39 +0100, Richard Purdie wrote:
> >> On Mon, 2014-08-18 at 15:14 +0200, Martin Jansa wrote:
> >>> Well then maybe that allarch package with perl dependency shouldn't be
> >>> marked as allarch.
> >> 
> >> Take a step back and think about this from the end user system
> >> perspective. The packages are all identical for each architecture,
> >> "perl" doesn't change name. 
> >> 
> >> To me that means the correct end result is such a package should be
> >> "allarch" in the package feeds.
> >> 
> >> The question then becomes, how do we generate such things in a sane way.
> >> 
> >>> I'm in favor of removing default allarch and setting correct
> >>> PACKAGE_ARCH manually in the packagegroup recipes like we do elsewhere.
> >>> 
> >>> packagegroups are small and "rebuilt" quickly, so I don't mind
> >>> "building" them once per TUNE_PKGARCH or even once per MACHINE_ARCH like
> >>> we do for couple of them already.
> >>> 
> >>> I can even find few changes from me on ML which do exactly that.
> >> 
> >> It does seem a bit of a cop out to do this on the grounds that its
> >> small/fast :/.
> >> 
> >> I agree there is good reason why some should be PKGARCH but we can
> >> probably do better than just marking them all that way IMO. I think we
> >> should try and mark them correctly too, i.e. think about whether the
> >> packages really are identical and/or make sense as allarch and try and
> >> avoid duplication if so.
> > 
> > I also have one other idea. We could adjust debian.bbclass so that it
> > adds an RPROVIDES for the original package name. We could then instruct
> > packagegroups specifically not to adjust the naming for debian renaming.
> > 
> > This would mean that the packagegroups would know the dependencies by
> > their non-debian, unversioned name.
> > 
> > Would that work for people?
> > 
> > I'm torn on the idea right now but thought I'd share it.
> 
> What happens in the following situation:
> 
> foo.bb generates foo.ipk (/usr/bin/foo) and libfoo5.ipk
> (/usr/lib/libfoo.so.5), will libfoo5 RPROVIDE 'foo', 'libfoo' or
> something else?

libfoo

Its very unlikely someone would write a package which the namespaces
conflicted in the way we use things currently.

The other related question is whether we should be doing automatic
remapping in RPROVIDES/RREPLACES/RCONFLICTS ?

Since at the moment if we put libfoo into RPROVIDES, it gets mapped to
libfoo5 by the remapping code...

I have patches which make various things work, I'll probably post them
and people can see what they think. 

Cheers,

Richard




