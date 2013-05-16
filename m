Received: from r-finger.com ([178.79.160.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tf+lists.yocto@r-finger.com>) id 1UcuLE-00089C-JQ
	for openembedded-core@lists.openembedded.org;
	Thu, 16 May 2013 11:19:17 +0200
Received: from [192.168.0.2] (host86-137-102-112.range86-137.btcentralplus.com
	[86.137.102.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 71E1F952B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2013 10:01:03 +0100 (BST)
Message-ID: <5194A04E.3000300@r-finger.com>
Date: Thu, 16 May 2013 10:01:02 +0100
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120624 Icedove/10.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <518A6B25.5000108@r-finger.com> <1368639038.18324.6.camel@ted>
	<CAP9ODKqQ-TXBwUqPVZ_oZOK2MLRQhSp_9Xb7a=dOiPaQ+zUw5A@mail.gmail.com>
	<1671648.4UWfFTD1eS@helios>
	<CAP9ODKpqFxzooVtRzzfDzOQcicXQYnJ3wp0qO-jHyt1fi+1XGQ@mail.gmail.com>
	<1368650968.16243.145.camel@pb-ThinkPad-R50e>
In-Reply-To: <1368650968.16243.145.camel@pb-ThinkPad-R50e>
Subject: Re: proposal to move cogl, clutter and related recipes from oe-core to dedicated meta-clutter layer
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 May 2013 09:19:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Phil,

On 15/05/13 21:49, Phil Blundell wrote:
> On Wed, 2013-05-15 at 16:28 -0300, Otavio Salvador wrote:
> - we have a different (newer) version

I think particularly for point updates we should be able to minimize the
pain if the base recipes are set up well.


> - we use eglnative mostly, though we might start wanting to use glx
> under qemu for testing (subject to getting a suitable mesa)

This is the crux of the difficulties with cogl/clutter. In Guacamayo I
need to be able to use both eglnative and glx. I prefer eglnative +
gles2, because I only need a single clutter based app running and the
X11 overhead is not negligible, but on intel HW I have not been able to
get this working satisfactorily in the past, so ended up using GLX for
the likes of atom-pc and NUC.

The solution I came up with is to predefine a bunch common
configure+depends+rdepends sets in the clutter/cogl includes (there is
only a finite number of configurations that makes sense, though my
recipes do not cover them all), and then in a Guacamayo-specific
bbappend choose a suitable configuration on per-machine basis.


> - we have a slightly funky 2-stage bootstrap process for cogl in order
> to break the dependency cycle with cairo; this involves hacks to the
> recipes for cogl, cairo, pango and harfbuzz (at least) which I suspect
> would not be very palatable to oe-core.

I have never run into this, is this with recent cogls?


> The net result of all this is that, whenever I try to factor out a set
> of stuff that's "generic clutter" and could go into oe-core, I end up
> with recipes that have virtually nothing in common with what we're
> actually using and consequently don't actually solve any of my problems.

I don't think we can create a set of recipes that 'just work' for
everyone, but we can have recipes that minimal effort and that also
provide sensible defaults for the common machines out there.

There are some broader issues here though that need thought,
particularly, a bbappend should be a method of last resort, it would be
nice have a feature mechanism to ease the configuration. But distro
features are of no use here because it is not possible to differentiate
packages with different configs based on DF; machine features don't have
this limitation, but are the wrong place for this, plus it is entirely
conceivable you might want be able to build different configs for the
same machine on the same tmp dir (I use pseudo-machines for this, like
atom-egl, but that is just a nasty hack).

Tomas

-- 
http://sleepfive.com


