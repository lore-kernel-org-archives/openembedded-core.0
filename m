Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 14DB76B7CA
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Sep 2014 09:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s879OcKB005830; Sun, 7 Sep 2014 10:24:38 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id zDJZIv94muTY; Sun,  7 Sep 2014 10:24:38 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s879OVe0005819
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Sun, 7 Sep 2014 10:24:33 +0100
Message-ID: <1410081872.12482.134.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Sun, 07 Sep 2014 10:24:32 +0100
In-Reply-To: <5409C313.20208@windriver.com>
References: <cover.1408588282.git.hongxu.jia@windriver.com>
	<990d4ba779e4127ff546796d62e2921392dbc0f7.1408588282.git.hongxu.jia@windriver.com>
	<1409910121.12482.65.camel@ted> <5409C313.20208@windriver.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] bbclass/sstate: only allowed sstate-cache objects are allowed in a build (read-only sstate-cache)
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
X-List-Received-Date: Sun, 07 Sep 2014 09:24:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-09-05 at 09:05 -0500, Mark Hatle wrote:
> On 9/5/14, 4:42 AM, Richard Purdie wrote:
> > Hi Hongxu,
> >
> > On Thu, 2014-08-21 at 10:36 +0800, Hongxu Jia wrote:
> >> The requirement is the developer who demand only the "new" software
> >> they write is allowed to be compiled from source, they only want to
> >> reuse binaries from an existed sstate-cache, if the developer makes
> >> a change that triggers a rebuild, it should be an instant error.
> >>
> >> The purpose of this is for the sstate-cache to check if the item
> >> exists or not. If it doesn't the item needs to be in a whitelist
> >> or we need to fail.
> >>
> >> In the sstate-cache code, add a checking in the return path of
> >> sstate_checkhashes. If read-only sstate-cache enable, and the
> >> recipe's ${PN} not in the ${SSTATECACHE_WHITELIST}, it trigered
> >> an instant error.
> >>
> >> ...
> >> $ bitbake db
> >> ERROR: Read-only sstate-cache is enabled, the build of
> >> "db rpm-native gcc-runtime eglibc linux-libc-headers libgcc"
> >> did not come from sstate-cache. Only the recipe listed in
> >> SSTATECACHE_WHITELIST is allowed to build from source
> >>
> >> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
> >
> > Sorry for the delay in getting to this, with the other patches for the
> > release, time has been difficult.
> >
> > I have been able to take a look at this and the other locked sstate
> > patches I've had pending for some time.
> >
> > Having thought quite a bit about this, I think we really want to make
> > this functionality part of the siggen class code. Where we need to add
> > hooks, we should do so with callbacks into the siggen code.
> >
> > I've just sent out a patch which my locked code in it. Could you take a
> > look and see if we can make that approach work with your code too?
> >
> > In particular, I don't really want to have multiple whitelist type
> > variables. Could we use the SIGGEN_LOCKEDSIGS variable as the definitive
> > way to control which recipes can float and which should not?
> 
> I'm all for combining this.. however it appears the patches have two slightly 
> separate goals.
> 
> The locked sstate patch tells the system to use a specific hash value and ONLY 
> that hash value.   So if a user modified a system behavior in a way that would 
> change the behavior of the component there is no warning or error.
> 
> The readonly sstate-cache on the other hand says, to reuse the sstate cache 
> items (there of course may be more then one per recipe name with a different 
> hash based on different configurations), but will warn/error when if the system 
> configuration changes in a way the hash would have changed.
> 
> So there needs to be an interface that says which items are allowed to be built 
> from source, and which items require either the locked or readonly sstate behavior.
> 
> Something like:
> 
> SIGGEN_LOCKEDSIGS = "\
> gcc-cross:do_populate_sysroot:ro \
> eglibc:do_populate_sysroot:ro \
> eglibc:do_packagedata:ro \
> gcc-cross:do_packagedata:ro \
> "
> 
> could work to extend it, but I have a concern with this.  It only affects 
> individual recipes.  The request we've had from our customers is that once they 
> have built their environment(s), and distributed the sstate-cache to their 
> developers -- only the items they distributed are allowed to be used, unless an 
> exception is granted.
> 
> So having to maintain a SIGGEN_LOCKSIGS = variable with every possible package 
> in the system seems complicated at best (for the RO case).  They really want a 
> switch that sets everything, except exceptions as read-only.
> 
> SIGGEN_LOCKEDSIGS = "\
> *:*:ro \
> bash:*:rw \
> "
> 
> but I don't know if the glob/wildcarding would add more processing overhead then 
> is acceptable.

I guess my main point right now is more about the controlling interface
of this which I believe should be the "siggen" class. What I'd like to
try and do is standardise on that as being the interface which handles
this policy, whatever it may be. If it needs hooks adding, we can do
that like the one I added from sstate.

Whether we end up with one siggen class or we have different ones
(perhaps subclassing each other) and we switch between them for
different behaviours I'm less sure about right now.

I'll give the locked sstate interface a bit more thought based on the
above, thanks. I suspect it may be a case of adding a new subclass with
some different functionality (e.g. readonly cache), then if that is what
the user requires, we select that class using BB_SIGNATURE_HANDLER?

Richard




