Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id 90CE7706B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Feb 2015 10:03:02 +0000 (UTC)
Received: from [99.240.204.5] (port=55627 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1YPpqt-0002ea-Fq; Mon, 23 Feb 2015 05:02:59 -0500
Date: Mon, 23 Feb 2015 05:02:59 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: Paul Eggleton <paul.eggleton@linux.intel.com>
In-Reply-To: <10796820.h4sv9pPNbH@peggleto-mobl5.ger.corp.intel.com>
Message-ID: <alpine.LFD.2.11.1502230443370.18244@localhost>
References: <alpine.LFD.2.11.1502210434001.12954@localhost>
	<1424595258.11836.72.camel@linuxfoundation.org>
	<alpine.LFD.2.11.1502221509270.29570@localhost>
	<10796820.h4sv9pPNbH@peggleto-mobl5.ger.corp.intel.com>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: openembedded-core@lists.openembedded.org
Subject: Re: questions about WORKDIR and S usage and files/ stuff
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
X-List-Received-Date: Mon, 23 Feb 2015 10:03:04 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 23 Feb 2015, Paul Eggleton wrote:

> On Sunday 22 February 2015 15:25:07 Robert P. J. Day wrote:
> > On Sun, 22 Feb 2015, Richard Purdie wrote:
> > > http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=4eb3db9a2ca8eaff64b64
> > > b8f56dac25d4734571c
> > >
> > > http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=cf72ede74d35746a10d07
> > > 08942287548f9c72f30
> > >
> > > and some of the surrounding patches. I'd assumed base-files was part
> > > of that series, clearly it wasn't but there were many other recipes
> > > changed at that time.
> >
> >   ah, gotcha. so let me just summarize my understanding of this, it
> > looks pretty straightforward.
> >
> >   once upon a time, base.bbclass politely(?) auto-created the S
> > directory for each recipe. this had the potential for screwing things
> > up if the recipe author didn't set S properly for that recipe.
> >
> >   solution: stop auto-creating S, leaving the responsibility for
> > creating whatever S refers to to the recipe itself, typically as a
> > result of just doing a regular unpack of the SRC_URI. this allows
> > a trivial sanity check -- whatever directory S refers to should
> > exist as the result of the simple unpacking of that recipe.
> >
> >   now, given the default setting in bitbake.conf of
> >
> >   S = WORKDIR/BP
> >
> > as long as that value is appropriate for a recipe, then the recipe
> > author need not set it explicitly. *but*, even in the case where a
> > recipe doesn't require any "unpacking" -- as in, recipes like
> > base-files which refer exclusively to local files -- it is still
> > necessary to set S to *something* that will exist, just to pass
> > that sanity test, and the easiest solution is to just set it to
> > WORKDIR, which is guaranteed to exist for *any* recipe.
>
> Yes, but this is not generally good advice for every recipe. If the
> main source for your recipe unpacks to a subdirectory then that is
> where you should point S to.

  oh, i understand that ... i was referring specifically to just those
recipes which *don't* unpack to any subdirectory, things like
base-files and so on. *obviously*, if a recipe unpacks, say, a tarball
to a subdirectory, it's your responsibility to make sure S is set
properly.

> >   final thought on this -- to pass the sanity check, it is
> > necessary only for the directory referred to by S to exist. the
> > obvious thing to set it to is, of course, WORKDIR, but in the case
> > of recipes like base-files which don't even *use* S, it's
> > technically possible to set it to *any* directory guaranteed to
> > exist. i'm not suggesting this is a smart thing to do, only that
> > it would be technically viable.
>
> In theory, but why is that of any interest? You seem to be looking
> at this from the perspective of just passing the sanity test, but
> the sanity test is there for a reason - so that you set it to a
> proper value, not to just any old value to make the warning go away.

  oh, i get that. my point (obviously badly phrased) was that, in the
case of recipes like base-files where the entire content of the recipe
is represented exclusively by local files supplied by the recipe (and
which will be unpacked directly under WORKDIR), in order to pass the
sanity test, you still need to supply a value for S that represents a
directory that will exist, even if the recipe itself makes no use of
it. the obvious value is, of course, WORKDIR -- my point was that, if
you wanted to be deliberately perverse, for recipes like that, you
could set S to *any* existing directory to pass the sanity test. that
would be a massively silly thing to do ... i'm just saying that it
would work. oh, wait ... just reading the last para ...

> >   and all this suggests that, even if you set S = WORKDIR, for
> > cleanliness, you should still avoid referring to unpacked objects
> > relative to S, just in case -- it's safer to restrict yourself to
> > referring to things relative to WORKDIR. is that about right?
>
> For individual files that don't actually get unpacked, sure.

  ok, this is the style issue i was getting at ... even if you have a
recipe for which S = WORKDIR, if the recipe is manually processing
those local files, it should refer to them relative to WORKDIR, not S,
just in case ... who knows, maybe someday the recipe is modified to
actually unpack a tarball or something, and suddenly you need to go
through and fix everything.

  base-files is a good example of this -- all local files are referred
to relative to WORKDIR. on the other hand, the recipe for, say,
formfactor, violates that "style":

S = "${WORKDIR}"

PACKAGE_ARCH = "${MACHINE_ARCH}"
INHIBIT_DEFAULT_DEPS = "1"

do_install() {
        # Install file only if it has contents
        install -d ${D}${sysconfdir}/formfactor/
        install -m 0644 ${S}/config ${D}${sysconfdir}/formfactor/
        if [ -s "${S}/machconfig" ]; then
                install -m 0644 ${S}/machconfig ${D}${sysconfdir}/formfactor/
        fi
}

  again, technically correct, but i would have used WORKDIR in place
of S.

> You should use S to point to the actual source for the recipe,
> though. S is actually used.

  ah ... where? i'm quite willing to be convinced that it's necessary
for S = WORKDIR for recipes like this, i would just like to see why.
thanks.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


