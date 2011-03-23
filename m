Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q2R7S-0006Ov-3l for openembedded-core@lists.openembedded.org;
	Wed, 23 Mar 2011 17:41:17 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2NGdNfs001906
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2011 16:39:23 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01806-01 for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2011 16:39:19 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2NGdH7d001898
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2011 16:39:17 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1300817337.git.tom_rini@mentor.com>
References: <cover.1300817337.git.tom_rini@mentor.com>
Date: Wed, 23 Mar 2011 16:39:15 +0000
Message-ID: <1300898355.3018.26.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/2] coreutils-native and gettext fixes
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
X-List-Received-Date: Wed, 23 Mar 2011 16:41:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-03-22 at 11:21 -0700, Tom Rini wrote:
> They following changes do two things.  First up, this re-syncs
> coreutils-native with the changes I just made in openembedded.master
> to opt out of gmp-native rather than DEPEND on it (oe.master had neither
> previously).  The second change was that in testing the above I ran into
> gettext.bbclass + BBCLASSEXTEND breakage that I had fixed in oe.master
> previously.  I've extended what I did slightly to also cover crosssdk
> here.  After talking with Khem there's further cleanups that we can do
> but are separate.
> 
> Pull URL: git://git.openembedded.org/openembedded-core-contrib
>   Branch: trini/misc-fixes
>   Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=trini/misc-fixes
> 
> Thanks,
>     Tom Rini <tom_rini@mentor.com>
> ---
> 
> 
> Tom Rini (2):
>   coreutils: Switch to disabling gmp support
>   gettext.bbclass: Fix cases where we lost DEPENDS_GETTEXT

I've taken the coreutils change, thanks.

For gettext, we chatted on IRC but to summarise:

a) Poky went about addressing the problem slightly differently. Bottom
line is the situation was worked around when DEPENDS_virtclass was used
by manually specifying the gettext dependency.

If we go for a new way to fix this in the class like Tom is proposing,
I'd like to remove the other workaround so we have one clear way of
doing things.

b) This just highlights what a mess changing DEPENDS is at the moment.
Every time we want a virtclass we shouldn't have to add more items to
lists, it just feels wrong. Over time this has all the makings of an
unmaintainable disaster.

The root of the problem is what BBCLASSEXTEND does, or more specifically
the code in native.bbclass which needs to manipulate DEPENDS. There are
the following constraints on DEPENDS:

* Its set in recipes with a "=", i.e. a hard assignment. Ideally it
would be += to append to a core set of dependencies but that isn't the
way it works.

* We add in "core" dependencies such as the toolchain with a
DEPENDS_prepend = "xxx", e.g. from base.bbclass:

DEPENDS_prepend="${@base_dep_prepend(d)} "
DEPENDS_virtclass-native_prepend="${@base_dep_prepend(d)} "
DEPENDS_virtclass-nativesdk_prepend="${@base_dep_prepend(d)} "

This shows one other place where this virtclass workaround has had to be
applied :(.

The problem is that if someone sets:

DEPENDS_virtclass-native = "xxx"

this wipes out the original DEPENDS when you perhaps only wanted to wipe
out the recipe specific dependencies, not the core additional ones.

I don't have any better way to fix this at the moment but it does
highlight an easy solution to improve Tom's patch. We should define this
in base.bbclass:

BASEDEPENDS = "${@base_dep_prepend(d)}"
DEPENDS_prepend="${BASEDEPENDS} "
DEPENDS_virtclass-native_prepend="${BASEDEPENDS} "
DEPENDS_virtclass-nativesdk_prepend="${BASEDEPENDS} "

and then gettext.bbclass should just do:

BASEDEPENDS += "<gettext depenedncies>"

Whilst this is still ugly, its less ugly at least...

Cheers,

Richard






