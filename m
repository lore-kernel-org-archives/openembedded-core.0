Received: from li44-10.members.linode.com ([72.14.181.10] helo=plausible.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andy.ross@windriver.com>) id 1T4wx6-00084W-Me
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 18:41:44 +0200
Received: from [0.0.0.0] (c-67-171-188-207.hsd1.or.comcast.net
	[67.171.188.207]) (Authenticated sender: andy-wrs)
	by plausible.org (Postfix) with ESMTPSA id 488281F577;
	Fri, 24 Aug 2012 09:29:38 -0700 (PDT)
Message-ID: <5037ABF0.1030908@windriver.com>
Date: Fri, 24 Aug 2012 09:29:36 -0700
From: Andy Ross <andy.ross@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1345817543.14369.70.camel@ted> <5037A36C.8020401@windriver.com>
	<1345825168.14369.85.camel@ted>
In-Reply-To: <1345825168.14369.85.camel@ted>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-4.7: Add fix for libtool rpath problems
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
X-List-Received-Date: Fri, 24 Aug 2012 16:41:44 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/24/2012 09:19 AM, Richard Purdie wrote:
> I'd love to have a better fix for this. I suspect its taking the path
> from some "gcc -print-xxxx" call which returns/usr/lib/../lib on x86_64
> so we could try and normalise it at source...

Yeah, but that sounds like whack-a-mole to me.  It's just too tempting
for upstream software to glue up a path name with .., it's very sane
for a human being.

One of the (comparatively few) spots where I actually isolated the
source of one of these is in gettext, where the configure script needs
a --with-ncurses-prefix to be "/usr".  So the bitbake recipe sets it
to ${STAGING_LIBDIR}/.., which seems clearly correct to me.  And then
somewhere in the configure script that turns into a libtool library
path of <ncurses_prefix>/lib (again completely correct), thus
"/usr/lib/../lib".  And even then it's correct and if used for a -L
argument would never cause a problem.

It's libtool which has special requirements here, becuase it's trying
to set rpaths based on those funny strings and has to have them
normalized.  So I'd argue that it's in libtool where this magic has to
happen.

Before I realized you already fixed the gcc-runtime issue, I was
looking at finding a place farther up the stack where this could be
done.  That is, sanitize all inbound paths at the spot where they're
parsed at the command line.  The current cases we know we need to hit
are -lib and -rpath, though I'm no libtool expert and am surely
missing some...

Andy



